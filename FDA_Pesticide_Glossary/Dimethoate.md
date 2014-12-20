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
-3.415454, 0.5353034, -2.698084, 1, 0, 0, 1,
-2.875952, -0.6254743, -3.252993, 1, 0.007843138, 0, 1,
-2.842185, 0.2563487, -1.869649, 1, 0.01176471, 0, 1,
-2.71212, -1.460915, -1.186839, 1, 0.01960784, 0, 1,
-2.658495, -1.899027, -0.8645024, 1, 0.02352941, 0, 1,
-2.468437, 0.236834, -2.063978, 1, 0.03137255, 0, 1,
-2.450681, -0.7767735, -1.882391, 1, 0.03529412, 0, 1,
-2.407752, 0.9129103, -1.460751, 1, 0.04313726, 0, 1,
-2.397425, -0.7208949, -2.549565, 1, 0.04705882, 0, 1,
-2.394739, 1.344943, 1.222407, 1, 0.05490196, 0, 1,
-2.350095, -0.7620923, -1.053178, 1, 0.05882353, 0, 1,
-2.31212, -0.3286673, -1.377895, 1, 0.06666667, 0, 1,
-2.291712, -1.080188, -3.885943, 1, 0.07058824, 0, 1,
-2.231751, -0.4447761, -3.518333, 1, 0.07843138, 0, 1,
-2.216241, 0.2367443, -1.122945, 1, 0.08235294, 0, 1,
-2.170695, 0.1709471, -0.7387904, 1, 0.09019608, 0, 1,
-2.142038, 0.4594546, -2.311865, 1, 0.09411765, 0, 1,
-2.135389, 0.4461853, -0.4169111, 1, 0.1019608, 0, 1,
-2.087888, 0.563783, -2.269288, 1, 0.1098039, 0, 1,
-2.084064, -1.757637, -1.160993, 1, 0.1137255, 0, 1,
-2.082643, 0.08724508, -3.023038, 1, 0.1215686, 0, 1,
-2.068723, -0.2015508, -0.5603492, 1, 0.1254902, 0, 1,
-2.060906, 0.6003667, 0.5408172, 1, 0.1333333, 0, 1,
-2.05245, 0.3137142, -1.077017, 1, 0.1372549, 0, 1,
-2.031039, 0.7438072, 0.4630409, 1, 0.145098, 0, 1,
-2.030972, 1.608792, 1.125379, 1, 0.1490196, 0, 1,
-1.984316, 0.3542796, -1.761707, 1, 0.1568628, 0, 1,
-1.983058, 0.9510828, -0.04884185, 1, 0.1607843, 0, 1,
-1.973874, -1.116931, -1.70168, 1, 0.1686275, 0, 1,
-1.973841, -1.943839, -3.258921, 1, 0.172549, 0, 1,
-1.939768, -1.730501, -0.586572, 1, 0.1803922, 0, 1,
-1.923746, -1.154043, -1.38694, 1, 0.1843137, 0, 1,
-1.909157, -0.7505817, -1.290368, 1, 0.1921569, 0, 1,
-1.889814, -0.4749582, -3.257185, 1, 0.1960784, 0, 1,
-1.88829, 1.784104, -1.547548, 1, 0.2039216, 0, 1,
-1.871917, 0.9882685, -1.350872, 1, 0.2117647, 0, 1,
-1.871637, 1.5595, 0.9165069, 1, 0.2156863, 0, 1,
-1.867954, -0.3073925, -1.644069, 1, 0.2235294, 0, 1,
-1.859291, 1.133529, -2.23763, 1, 0.227451, 0, 1,
-1.847261, 1.836152, 2.39816, 1, 0.2352941, 0, 1,
-1.839248, 0.7718959, -1.544927, 1, 0.2392157, 0, 1,
-1.830848, 1.098911, -1.360675, 1, 0.2470588, 0, 1,
-1.818792, -1.615592, -1.425014, 1, 0.2509804, 0, 1,
-1.817366, -0.6281102, -1.539972, 1, 0.2588235, 0, 1,
-1.809356, 0.3839986, -1.996445, 1, 0.2627451, 0, 1,
-1.800538, 0.09463642, -2.322455, 1, 0.2705882, 0, 1,
-1.799195, 0.2653897, -1.551456, 1, 0.2745098, 0, 1,
-1.795414, -0.6350827, -0.9112718, 1, 0.282353, 0, 1,
-1.778521, 0.4446127, -1.551211, 1, 0.2862745, 0, 1,
-1.777675, 2.3045, -0.02150316, 1, 0.2941177, 0, 1,
-1.765514, -0.6668202, -3.835342, 1, 0.3019608, 0, 1,
-1.762273, 1.947211, -1.698305, 1, 0.3058824, 0, 1,
-1.76132, -1.304116, -0.8289365, 1, 0.3137255, 0, 1,
-1.749837, -1.048235, -1.860656, 1, 0.3176471, 0, 1,
-1.749372, 0.05709356, -2.249377, 1, 0.3254902, 0, 1,
-1.746107, 0.4097767, -0.7380979, 1, 0.3294118, 0, 1,
-1.730268, 0.06963205, -1.275549, 1, 0.3372549, 0, 1,
-1.709447, 0.1113925, -2.628356, 1, 0.3411765, 0, 1,
-1.690047, -0.6432696, -2.260725, 1, 0.3490196, 0, 1,
-1.686599, -2.251162, -1.398573, 1, 0.3529412, 0, 1,
-1.68373, -0.8718696, -1.204179, 1, 0.3607843, 0, 1,
-1.680468, -0.5713116, -2.810176, 1, 0.3647059, 0, 1,
-1.678359, -1.37531, -2.829134, 1, 0.372549, 0, 1,
-1.671682, -2.44496, -2.736972, 1, 0.3764706, 0, 1,
-1.665033, -0.1006793, -1.39703, 1, 0.3843137, 0, 1,
-1.635013, 0.4252006, -1.254532, 1, 0.3882353, 0, 1,
-1.618824, -1.471622, -3.139197, 1, 0.3960784, 0, 1,
-1.618293, -1.73488, -3.867875, 1, 0.4039216, 0, 1,
-1.601128, -0.2289801, -1.193754, 1, 0.4078431, 0, 1,
-1.598531, -0.388104, -1.860633, 1, 0.4156863, 0, 1,
-1.590979, -0.4557418, -2.308211, 1, 0.4196078, 0, 1,
-1.583084, 0.1460596, -0.745734, 1, 0.427451, 0, 1,
-1.561848, -1.087699, -0.04928453, 1, 0.4313726, 0, 1,
-1.557719, 0.7316015, -1.201053, 1, 0.4392157, 0, 1,
-1.551816, 1.530666, -3.212258, 1, 0.4431373, 0, 1,
-1.543283, -0.6873209, -3.023113, 1, 0.4509804, 0, 1,
-1.532855, 0.3394593, -0.2325946, 1, 0.454902, 0, 1,
-1.529747, -0.6238633, -0.9186928, 1, 0.4627451, 0, 1,
-1.521768, 0.3266293, -1.498924, 1, 0.4666667, 0, 1,
-1.519165, -0.4938773, -2.404206, 1, 0.4745098, 0, 1,
-1.514663, -0.2965695, -1.928812, 1, 0.4784314, 0, 1,
-1.513116, 0.6960301, -0.6314076, 1, 0.4862745, 0, 1,
-1.513035, -0.7508991, -3.4826, 1, 0.4901961, 0, 1,
-1.511719, -0.5045161, -1.581516, 1, 0.4980392, 0, 1,
-1.506426, -1.213658, -1.912068, 1, 0.5058824, 0, 1,
-1.500244, -0.7240195, -1.649852, 1, 0.509804, 0, 1,
-1.498003, 0.6373542, 1.007007, 1, 0.5176471, 0, 1,
-1.496389, -0.6981562, -1.999437, 1, 0.5215687, 0, 1,
-1.484936, -0.4888717, -1.27052, 1, 0.5294118, 0, 1,
-1.477685, -2.063594, -3.544243, 1, 0.5333334, 0, 1,
-1.463485, 1.033185, -2.442829, 1, 0.5411765, 0, 1,
-1.463128, -0.5278655, -1.796031, 1, 0.5450981, 0, 1,
-1.451406, -0.2746874, 0.4061359, 1, 0.5529412, 0, 1,
-1.449154, 1.460309, -2.038169, 1, 0.5568628, 0, 1,
-1.439639, -1.145226, -1.611566, 1, 0.5647059, 0, 1,
-1.436565, -1.365979, -2.821778, 1, 0.5686275, 0, 1,
-1.411455, 1.718748, -0.4742431, 1, 0.5764706, 0, 1,
-1.403047, 0.4367973, 0.1131638, 1, 0.5803922, 0, 1,
-1.381688, -0.6111786, -1.679928, 1, 0.5882353, 0, 1,
-1.380908, -0.3329845, -2.013324, 1, 0.5921569, 0, 1,
-1.365363, 1.193963, -1.586456, 1, 0.6, 0, 1,
-1.315055, 1.165249, 0.1450808, 1, 0.6078432, 0, 1,
-1.311166, -0.03739509, -1.517086, 1, 0.6117647, 0, 1,
-1.306928, -2.20078, -3.693543, 1, 0.6196079, 0, 1,
-1.303152, 0.9896117, -2.666055, 1, 0.6235294, 0, 1,
-1.3013, -0.9440911, -3.186977, 1, 0.6313726, 0, 1,
-1.298829, -1.564428, -3.192309, 1, 0.6352941, 0, 1,
-1.298812, 0.2426507, -2.226866, 1, 0.6431373, 0, 1,
-1.295461, 0.8863756, -0.7656175, 1, 0.6470588, 0, 1,
-1.294758, 1.074773, -0.4585002, 1, 0.654902, 0, 1,
-1.286223, -0.8611799, -1.989681, 1, 0.6588235, 0, 1,
-1.281054, 0.5581142, -0.3712495, 1, 0.6666667, 0, 1,
-1.276514, -0.3366106, -1.264298, 1, 0.6705883, 0, 1,
-1.274284, -1.620264, -2.109999, 1, 0.6784314, 0, 1,
-1.26674, -1.623437, -3.926047, 1, 0.682353, 0, 1,
-1.256009, -1.459354, -2.264372, 1, 0.6901961, 0, 1,
-1.25384, -0.5266309, -1.546016, 1, 0.6941177, 0, 1,
-1.241924, -1.204073, -1.777823, 1, 0.7019608, 0, 1,
-1.23142, -0.5434759, -1.380677, 1, 0.7098039, 0, 1,
-1.22934, -1.079857, -1.06351, 1, 0.7137255, 0, 1,
-1.218701, 0.891618, 0.2139877, 1, 0.7215686, 0, 1,
-1.217426, 1.65106, -0.8973212, 1, 0.7254902, 0, 1,
-1.212034, 1.426288, -0.7989907, 1, 0.7333333, 0, 1,
-1.211943, 0.02246149, -2.152018, 1, 0.7372549, 0, 1,
-1.207765, -0.6739686, -2.418251, 1, 0.7450981, 0, 1,
-1.197694, -0.5324253, -1.76625, 1, 0.7490196, 0, 1,
-1.197103, 0.4791512, -2.150239, 1, 0.7568628, 0, 1,
-1.186504, 0.7813936, -1.106913, 1, 0.7607843, 0, 1,
-1.185555, -2.16816, -3.245195, 1, 0.7686275, 0, 1,
-1.185327, 0.7161031, -0.1137518, 1, 0.772549, 0, 1,
-1.161166, 1.161943, -1.40488, 1, 0.7803922, 0, 1,
-1.150219, -1.003351, -2.146303, 1, 0.7843137, 0, 1,
-1.142227, -0.0659419, -2.095781, 1, 0.7921569, 0, 1,
-1.140208, 0.3512203, -1.664057, 1, 0.7960784, 0, 1,
-1.139067, -0.3017859, -0.3960637, 1, 0.8039216, 0, 1,
-1.128603, 1.079084, -1.847008, 1, 0.8117647, 0, 1,
-1.128095, 0.2253433, -0.6181385, 1, 0.8156863, 0, 1,
-1.121106, -0.3094773, -3.178914, 1, 0.8235294, 0, 1,
-1.117891, -0.1684841, -2.439251, 1, 0.827451, 0, 1,
-1.116572, -0.9872824, -2.281072, 1, 0.8352941, 0, 1,
-1.109547, 1.752236, -1.00573, 1, 0.8392157, 0, 1,
-1.10579, -1.300188, -4.217221, 1, 0.8470588, 0, 1,
-1.105176, -1.002669, -2.940942, 1, 0.8509804, 0, 1,
-1.101565, -1.394576, -1.623357, 1, 0.8588235, 0, 1,
-1.093444, -0.8291064, -3.383247, 1, 0.8627451, 0, 1,
-1.080258, 0.04443902, -0.6499063, 1, 0.8705882, 0, 1,
-1.072708, -0.7568291, 0.6835864, 1, 0.8745098, 0, 1,
-1.069672, 1.52172, 0.6370969, 1, 0.8823529, 0, 1,
-1.067978, -2.340408, -3.335646, 1, 0.8862745, 0, 1,
-1.053747, -0.9330747, -2.067824, 1, 0.8941177, 0, 1,
-1.053722, -1.683814, -2.738646, 1, 0.8980392, 0, 1,
-1.050537, -0.236107, -1.065162, 1, 0.9058824, 0, 1,
-1.043491, -0.7082084, -1.538222, 1, 0.9137255, 0, 1,
-1.04237, 0.8056084, 0.65928, 1, 0.9176471, 0, 1,
-1.041182, -1.134432, -2.140141, 1, 0.9254902, 0, 1,
-1.006617, 0.4632795, -2.210969, 1, 0.9294118, 0, 1,
-1.001459, 1.018413, -0.867388, 1, 0.9372549, 0, 1,
-0.9998513, 2.254558, -0.7172904, 1, 0.9411765, 0, 1,
-0.9990395, 0.5867864, -0.2467942, 1, 0.9490196, 0, 1,
-0.9985346, -0.9337738, -3.045406, 1, 0.9529412, 0, 1,
-0.9893807, 0.8761045, 0.9029391, 1, 0.9607843, 0, 1,
-0.9874396, 0.1373136, -2.17757, 1, 0.9647059, 0, 1,
-0.9796699, -0.6528259, -3.321201, 1, 0.972549, 0, 1,
-0.9787782, -0.7213674, -2.829896, 1, 0.9764706, 0, 1,
-0.9764873, -0.4885776, -2.705019, 1, 0.9843137, 0, 1,
-0.9750854, 0.2038405, -0.5768912, 1, 0.9882353, 0, 1,
-0.9704115, 1.011789, -1.958404, 1, 0.9960784, 0, 1,
-0.9695821, -1.281614, -2.513101, 0.9960784, 1, 0, 1,
-0.9686903, 1.121752, -2.960426, 0.9921569, 1, 0, 1,
-0.9654651, -0.2483712, -1.208217, 0.9843137, 1, 0, 1,
-0.9643091, -0.1641978, 0.52673, 0.9803922, 1, 0, 1,
-0.9635993, -0.8630522, -1.378945, 0.972549, 1, 0, 1,
-0.9611855, 1.543347, -0.6440523, 0.9686275, 1, 0, 1,
-0.9561367, -0.9340098, -1.422656, 0.9607843, 1, 0, 1,
-0.9555048, 0.5838848, -0.4332552, 0.9568627, 1, 0, 1,
-0.9508812, -0.6521181, -2.797443, 0.9490196, 1, 0, 1,
-0.934044, 0.3188685, 0.5821162, 0.945098, 1, 0, 1,
-0.9254385, 0.4440796, -0.6395994, 0.9372549, 1, 0, 1,
-0.915392, -1.47433, -1.700859, 0.9333333, 1, 0, 1,
-0.9128147, -0.3396326, -0.7501627, 0.9254902, 1, 0, 1,
-0.9126739, -1.137696, -0.98063, 0.9215686, 1, 0, 1,
-0.908065, 0.04605164, -1.638743, 0.9137255, 1, 0, 1,
-0.9064661, -0.8260534, -0.7052343, 0.9098039, 1, 0, 1,
-0.9019365, -0.4152506, -1.820062, 0.9019608, 1, 0, 1,
-0.8914755, -0.2763175, -2.678845, 0.8941177, 1, 0, 1,
-0.8898039, -1.193739, -2.239559, 0.8901961, 1, 0, 1,
-0.8839157, -1.308261, -1.955528, 0.8823529, 1, 0, 1,
-0.8837319, 0.6258694, -0.5972093, 0.8784314, 1, 0, 1,
-0.8711162, -1.562174, -3.271638, 0.8705882, 1, 0, 1,
-0.8694512, -0.2473566, -1.151982, 0.8666667, 1, 0, 1,
-0.8633716, 0.5397055, -1.416474, 0.8588235, 1, 0, 1,
-0.860977, -0.6356011, -3.383608, 0.854902, 1, 0, 1,
-0.8608607, -0.7707859, -2.120257, 0.8470588, 1, 0, 1,
-0.8529063, 0.3701807, -3.879708, 0.8431373, 1, 0, 1,
-0.8493724, -0.3818142, -3.272266, 0.8352941, 1, 0, 1,
-0.8473629, 0.04416896, -3.121937, 0.8313726, 1, 0, 1,
-0.8462499, -0.3470462, -4.131644, 0.8235294, 1, 0, 1,
-0.8455542, -0.2151805, -2.178219, 0.8196079, 1, 0, 1,
-0.8444233, 0.5783038, 0.1589634, 0.8117647, 1, 0, 1,
-0.8430924, -0.593479, -1.138176, 0.8078431, 1, 0, 1,
-0.8419659, 0.6034549, -0.01503203, 0.8, 1, 0, 1,
-0.8406047, -0.6821361, -4.651424, 0.7921569, 1, 0, 1,
-0.8321905, -0.04430958, -4.369575, 0.7882353, 1, 0, 1,
-0.8240916, 1.010617, 0.05531801, 0.7803922, 1, 0, 1,
-0.8226514, -0.9556947, -1.423525, 0.7764706, 1, 0, 1,
-0.8220032, 0.7554111, -2.691278, 0.7686275, 1, 0, 1,
-0.8199766, 0.3267733, -2.21896, 0.7647059, 1, 0, 1,
-0.8194827, 1.506706, -2.429614, 0.7568628, 1, 0, 1,
-0.8173865, -0.81126, -3.538973, 0.7529412, 1, 0, 1,
-0.8127653, -1.795228, -2.751565, 0.7450981, 1, 0, 1,
-0.8092155, 0.1809112, -1.550066, 0.7411765, 1, 0, 1,
-0.8043498, -0.4485337, -1.038081, 0.7333333, 1, 0, 1,
-0.7922249, -0.798229, -2.936825, 0.7294118, 1, 0, 1,
-0.7917202, -0.2243246, -0.4060725, 0.7215686, 1, 0, 1,
-0.7902421, 2.814438, -0.2800481, 0.7176471, 1, 0, 1,
-0.7837521, -0.8529188, -1.803586, 0.7098039, 1, 0, 1,
-0.7834856, -0.1611772, 0.5829599, 0.7058824, 1, 0, 1,
-0.7826109, -0.3915793, -0.7624558, 0.6980392, 1, 0, 1,
-0.7818137, 0.5962591, -0.5482326, 0.6901961, 1, 0, 1,
-0.7773478, 0.5497872, -2.610494, 0.6862745, 1, 0, 1,
-0.7762566, 1.064172, -0.6450239, 0.6784314, 1, 0, 1,
-0.7727554, -1.203163, -4.163084, 0.6745098, 1, 0, 1,
-0.7703557, 1.150926, 0.2100294, 0.6666667, 1, 0, 1,
-0.7698321, -2.165834, -3.498994, 0.6627451, 1, 0, 1,
-0.7672651, -0.6211259, -2.172405, 0.654902, 1, 0, 1,
-0.7621908, 1.014236, -0.4553841, 0.6509804, 1, 0, 1,
-0.7542691, 0.7925614, -0.09995931, 0.6431373, 1, 0, 1,
-0.7537025, 0.5354335, -2.172559, 0.6392157, 1, 0, 1,
-0.751388, 0.6576903, -2.307768, 0.6313726, 1, 0, 1,
-0.7496112, 1.780513, -1.282285, 0.627451, 1, 0, 1,
-0.7464288, -1.240733, -2.176235, 0.6196079, 1, 0, 1,
-0.7462406, 1.682323, 1.728018, 0.6156863, 1, 0, 1,
-0.7406276, -0.2761364, -0.8013105, 0.6078432, 1, 0, 1,
-0.7400318, 0.4364219, -1.160174, 0.6039216, 1, 0, 1,
-0.7347146, 0.371231, -1.172152, 0.5960785, 1, 0, 1,
-0.7337705, -2.209538, -2.381816, 0.5882353, 1, 0, 1,
-0.7323085, -0.4678631, -1.861867, 0.5843138, 1, 0, 1,
-0.7313238, -1.705979, -1.704286, 0.5764706, 1, 0, 1,
-0.7304101, 0.2054667, -2.001895, 0.572549, 1, 0, 1,
-0.7296647, 0.08872711, -3.798409, 0.5647059, 1, 0, 1,
-0.7231261, 1.267581, -1.25714, 0.5607843, 1, 0, 1,
-0.7222575, -0.188417, -1.454736, 0.5529412, 1, 0, 1,
-0.720851, 0.3505759, -0.4894322, 0.5490196, 1, 0, 1,
-0.7164895, -1.336668, -0.72086, 0.5411765, 1, 0, 1,
-0.7093696, -0.183591, -1.857133, 0.5372549, 1, 0, 1,
-0.7085559, -1.781225, -4.081678, 0.5294118, 1, 0, 1,
-0.7043067, -1.152103, -2.468801, 0.5254902, 1, 0, 1,
-0.7030233, 0.1235078, -0.439113, 0.5176471, 1, 0, 1,
-0.6970528, -0.9227065, -2.235171, 0.5137255, 1, 0, 1,
-0.6967351, 0.3942257, -1.682516, 0.5058824, 1, 0, 1,
-0.6953793, 1.41269, 0.7628385, 0.5019608, 1, 0, 1,
-0.695002, -0.4269392, -2.456148, 0.4941176, 1, 0, 1,
-0.6942438, -0.680674, -2.383747, 0.4862745, 1, 0, 1,
-0.6919138, -0.3260179, -3.574126, 0.4823529, 1, 0, 1,
-0.6875064, -1.424182, -2.528339, 0.4745098, 1, 0, 1,
-0.6739803, -1.289698, -3.745895, 0.4705882, 1, 0, 1,
-0.6717886, 0.02232168, -2.899803, 0.4627451, 1, 0, 1,
-0.6709947, 1.010655, -0.9907665, 0.4588235, 1, 0, 1,
-0.6652412, 0.1828864, -0.02490932, 0.4509804, 1, 0, 1,
-0.6612471, -0.4695573, -2.001827, 0.4470588, 1, 0, 1,
-0.6610513, -1.251105, -1.907421, 0.4392157, 1, 0, 1,
-0.6607664, -0.142814, -2.721518, 0.4352941, 1, 0, 1,
-0.6503307, -0.9309473, -3.109877, 0.427451, 1, 0, 1,
-0.6490852, -0.6494284, -0.3704143, 0.4235294, 1, 0, 1,
-0.6469509, -0.5124769, -2.703905, 0.4156863, 1, 0, 1,
-0.6424391, -0.7764682, -2.428885, 0.4117647, 1, 0, 1,
-0.633626, 1.166843, -0.0651888, 0.4039216, 1, 0, 1,
-0.6216954, -1.635448, -1.751197, 0.3960784, 1, 0, 1,
-0.6183058, -0.9184603, -1.531419, 0.3921569, 1, 0, 1,
-0.6148298, 0.4159266, -1.196522, 0.3843137, 1, 0, 1,
-0.612035, -2.164581, -3.489975, 0.3803922, 1, 0, 1,
-0.6102895, -0.3444182, -1.233151, 0.372549, 1, 0, 1,
-0.6095428, 0.5378577, -2.765179, 0.3686275, 1, 0, 1,
-0.6048287, -1.445312, -2.517698, 0.3607843, 1, 0, 1,
-0.5978006, -0.04514317, -0.2860504, 0.3568628, 1, 0, 1,
-0.5966226, -1.111418, -2.968787, 0.3490196, 1, 0, 1,
-0.5958365, 1.089467, -0.2997979, 0.345098, 1, 0, 1,
-0.5890497, 0.1208709, -1.417134, 0.3372549, 1, 0, 1,
-0.5865452, -1.775739, -1.61353, 0.3333333, 1, 0, 1,
-0.5793549, 1.461176, -1.714758, 0.3254902, 1, 0, 1,
-0.5722904, -0.7455142, -0.5215347, 0.3215686, 1, 0, 1,
-0.5663975, -0.7281599, -3.627396, 0.3137255, 1, 0, 1,
-0.5662104, -0.1042379, -1.072129, 0.3098039, 1, 0, 1,
-0.5634362, -0.01607947, -0.647017, 0.3019608, 1, 0, 1,
-0.5629391, 1.400012, 0.8553012, 0.2941177, 1, 0, 1,
-0.5619792, -0.1166709, -0.9777997, 0.2901961, 1, 0, 1,
-0.5590786, -0.1141138, -2.477803, 0.282353, 1, 0, 1,
-0.5574743, -0.1568266, -2.009995, 0.2784314, 1, 0, 1,
-0.5545552, -1.762737, -3.361818, 0.2705882, 1, 0, 1,
-0.5526899, -0.6039934, -0.8406021, 0.2666667, 1, 0, 1,
-0.5524055, 2.131372, -0.3434839, 0.2588235, 1, 0, 1,
-0.5472097, 1.339653, -0.6873933, 0.254902, 1, 0, 1,
-0.544367, 1.326766, 0.5473741, 0.2470588, 1, 0, 1,
-0.5403314, 0.3185341, -3.558197, 0.2431373, 1, 0, 1,
-0.5395447, -0.8170639, -4.56025, 0.2352941, 1, 0, 1,
-0.5375475, 1.571761, 1.654616, 0.2313726, 1, 0, 1,
-0.5312498, 0.4417073, -1.818325, 0.2235294, 1, 0, 1,
-0.5268645, -1.379861, -2.952001, 0.2196078, 1, 0, 1,
-0.5221122, -0.2001209, -3.782534, 0.2117647, 1, 0, 1,
-0.5167394, 0.1821073, -1.458713, 0.2078431, 1, 0, 1,
-0.5157734, -0.1445718, -2.582775, 0.2, 1, 0, 1,
-0.5123017, -0.4607284, -2.498889, 0.1921569, 1, 0, 1,
-0.5061722, -0.09106845, -2.352553, 0.1882353, 1, 0, 1,
-0.5029466, 0.4110643, -0.3801695, 0.1803922, 1, 0, 1,
-0.5028158, 1.671033, -0.5942146, 0.1764706, 1, 0, 1,
-0.5024487, -1.373022, -2.484299, 0.1686275, 1, 0, 1,
-0.5016519, 1.020803, -0.4991052, 0.1647059, 1, 0, 1,
-0.5014694, -1.476048, -3.834573, 0.1568628, 1, 0, 1,
-0.5007647, -0.3542501, -1.41613, 0.1529412, 1, 0, 1,
-0.4979429, -0.07421628, -2.57914, 0.145098, 1, 0, 1,
-0.4955783, -1.002904, -3.075258, 0.1411765, 1, 0, 1,
-0.4944133, 0.565338, -0.1004609, 0.1333333, 1, 0, 1,
-0.4940298, 1.375186, 0.07724304, 0.1294118, 1, 0, 1,
-0.4882072, 1.368567, 0.5778316, 0.1215686, 1, 0, 1,
-0.4879285, 1.765812, -2.799302, 0.1176471, 1, 0, 1,
-0.4835435, 0.5559304, 0.3118461, 0.1098039, 1, 0, 1,
-0.4813867, -0.359048, -2.474452, 0.1058824, 1, 0, 1,
-0.4742579, 0.5389711, -1.479465, 0.09803922, 1, 0, 1,
-0.4742304, -1.06309, -3.597424, 0.09019608, 1, 0, 1,
-0.4731832, -0.4182743, -3.512833, 0.08627451, 1, 0, 1,
-0.4707697, -1.928761, -1.949391, 0.07843138, 1, 0, 1,
-0.4687056, 0.9336659, 0.4967136, 0.07450981, 1, 0, 1,
-0.4664219, -0.511984, -2.446642, 0.06666667, 1, 0, 1,
-0.4643295, -0.9949704, -3.867506, 0.0627451, 1, 0, 1,
-0.4583663, 0.5640993, -1.584612, 0.05490196, 1, 0, 1,
-0.4565783, -0.6266803, -2.846171, 0.05098039, 1, 0, 1,
-0.4513839, -0.8446473, -3.292732, 0.04313726, 1, 0, 1,
-0.4489555, -0.6822725, -2.025851, 0.03921569, 1, 0, 1,
-0.4472554, 1.753032, 2.699051, 0.03137255, 1, 0, 1,
-0.4428598, 1.49901, -0.5582298, 0.02745098, 1, 0, 1,
-0.4348612, -1.203912, -3.321692, 0.01960784, 1, 0, 1,
-0.433421, 0.1545632, -1.431838, 0.01568628, 1, 0, 1,
-0.4326186, -0.6216084, -3.825257, 0.007843138, 1, 0, 1,
-0.4300064, -0.1174696, -3.55925, 0.003921569, 1, 0, 1,
-0.4283273, -1.712101, -1.592581, 0, 1, 0.003921569, 1,
-0.4276139, 0.2421763, -1.228046, 0, 1, 0.01176471, 1,
-0.4263217, -0.172076, -1.447702, 0, 1, 0.01568628, 1,
-0.4247033, -1.113084, -1.991119, 0, 1, 0.02352941, 1,
-0.4228485, -0.03820112, -1.498966, 0, 1, 0.02745098, 1,
-0.4227213, 0.2693778, -1.435501, 0, 1, 0.03529412, 1,
-0.4170148, 0.9184644, -2.705899, 0, 1, 0.03921569, 1,
-0.4166511, 1.296521, 0.8086733, 0, 1, 0.04705882, 1,
-0.4164885, 0.09084543, -0.7770217, 0, 1, 0.05098039, 1,
-0.4151996, -0.6345535, -0.1381836, 0, 1, 0.05882353, 1,
-0.4149849, 0.4529382, 0.3004618, 0, 1, 0.0627451, 1,
-0.4145127, -1.641099, -3.18401, 0, 1, 0.07058824, 1,
-0.4144379, 1.834048, -0.4879451, 0, 1, 0.07450981, 1,
-0.4138602, 0.301376, 0.3247597, 0, 1, 0.08235294, 1,
-0.4098539, 0.4332661, -0.5202945, 0, 1, 0.08627451, 1,
-0.4097728, -0.1778766, -2.008506, 0, 1, 0.09411765, 1,
-0.4069915, -1.842683, -3.04219, 0, 1, 0.1019608, 1,
-0.4039988, -2.488184, -2.276622, 0, 1, 0.1058824, 1,
-0.4035367, -0.2932939, -0.9703882, 0, 1, 0.1137255, 1,
-0.402257, -0.6651887, -1.115842, 0, 1, 0.1176471, 1,
-0.3950303, -1.587, -1.860721, 0, 1, 0.1254902, 1,
-0.3909348, -0.473036, -2.224423, 0, 1, 0.1294118, 1,
-0.3876652, -1.704641, -1.875825, 0, 1, 0.1372549, 1,
-0.3838132, 0.9198093, 0.556767, 0, 1, 0.1411765, 1,
-0.383458, -1.628067, -1.935098, 0, 1, 0.1490196, 1,
-0.3831107, 0.3988704, 0.09783077, 0, 1, 0.1529412, 1,
-0.381119, 1.725975, -1.601336, 0, 1, 0.1607843, 1,
-0.3788138, -0.4176287, -1.470847, 0, 1, 0.1647059, 1,
-0.3780236, 0.1740365, -1.071329, 0, 1, 0.172549, 1,
-0.3634917, -0.3775751, -1.575751, 0, 1, 0.1764706, 1,
-0.3631336, -1.061851, -1.810027, 0, 1, 0.1843137, 1,
-0.3614593, 0.7126126, -0.4943382, 0, 1, 0.1882353, 1,
-0.3599958, -0.6301704, -2.747886, 0, 1, 0.1960784, 1,
-0.3584051, 0.749527, -0.1048574, 0, 1, 0.2039216, 1,
-0.3579337, -0.02163654, -0.5443382, 0, 1, 0.2078431, 1,
-0.3550613, -0.5339428, -3.891576, 0, 1, 0.2156863, 1,
-0.3378554, 0.958315, 0.8778726, 0, 1, 0.2196078, 1,
-0.3371164, -0.5031606, -3.697975, 0, 1, 0.227451, 1,
-0.3370729, -2.056172, -3.940863, 0, 1, 0.2313726, 1,
-0.3369117, -0.3701482, -1.662884, 0, 1, 0.2392157, 1,
-0.3350655, -0.2233962, -2.739434, 0, 1, 0.2431373, 1,
-0.3345397, 0.2907384, -2.72242, 0, 1, 0.2509804, 1,
-0.3336373, 1.445501, 0.1062099, 0, 1, 0.254902, 1,
-0.3333468, -0.5966914, -3.044323, 0, 1, 0.2627451, 1,
-0.3315275, 0.919805, -0.5038112, 0, 1, 0.2666667, 1,
-0.3309463, -0.6224603, -3.433656, 0, 1, 0.2745098, 1,
-0.3247189, 0.8216963, 0.5409516, 0, 1, 0.2784314, 1,
-0.3245471, -1.774775, -2.57667, 0, 1, 0.2862745, 1,
-0.3217688, 1.928528, -1.844181, 0, 1, 0.2901961, 1,
-0.319914, -1.431623, -2.876734, 0, 1, 0.2980392, 1,
-0.3192348, 0.1488119, -1.495159, 0, 1, 0.3058824, 1,
-0.3182017, 0.2293771, -1.553634, 0, 1, 0.3098039, 1,
-0.3157049, -1.227685, -2.34475, 0, 1, 0.3176471, 1,
-0.3149112, 1.18513, -0.9525717, 0, 1, 0.3215686, 1,
-0.3138968, -0.17741, -1.774761, 0, 1, 0.3294118, 1,
-0.3056322, -1.142965, -2.351645, 0, 1, 0.3333333, 1,
-0.3049408, 1.290944, -0.6131586, 0, 1, 0.3411765, 1,
-0.3024617, 1.013737, -0.1101423, 0, 1, 0.345098, 1,
-0.2985054, -0.9460104, -2.950739, 0, 1, 0.3529412, 1,
-0.2932797, -0.5247309, -2.954756, 0, 1, 0.3568628, 1,
-0.2885117, 0.8729958, 0.6680015, 0, 1, 0.3647059, 1,
-0.2875468, -0.6045925, -3.521425, 0, 1, 0.3686275, 1,
-0.2863426, 1.574942, -0.6459647, 0, 1, 0.3764706, 1,
-0.2844049, 0.722075, -1.01649, 0, 1, 0.3803922, 1,
-0.2841077, 0.1266642, -1.32389, 0, 1, 0.3882353, 1,
-0.2832089, -0.1875763, -0.8051916, 0, 1, 0.3921569, 1,
-0.279033, -0.02267409, -1.781059, 0, 1, 0.4, 1,
-0.2783154, -1.061396, -3.22511, 0, 1, 0.4078431, 1,
-0.2782979, -1.108721, -2.270543, 0, 1, 0.4117647, 1,
-0.2775999, 0.3997243, -0.6194093, 0, 1, 0.4196078, 1,
-0.2774277, 0.9236289, -0.6390261, 0, 1, 0.4235294, 1,
-0.2771013, -0.1708842, -1.235689, 0, 1, 0.4313726, 1,
-0.2733518, 2.109138, 1.139348, 0, 1, 0.4352941, 1,
-0.2692453, 0.2445257, -2.413851, 0, 1, 0.4431373, 1,
-0.2691391, -0.6881914, -4.208741, 0, 1, 0.4470588, 1,
-0.2681194, 0.4391139, -0.6304396, 0, 1, 0.454902, 1,
-0.2631377, -0.1306969, -3.045339, 0, 1, 0.4588235, 1,
-0.2620591, 1.12837, 0.5871351, 0, 1, 0.4666667, 1,
-0.2607366, -0.8117378, -2.093543, 0, 1, 0.4705882, 1,
-0.2603668, 0.2084907, 0.464056, 0, 1, 0.4784314, 1,
-0.2556969, -0.8389658, -2.80514, 0, 1, 0.4823529, 1,
-0.2524183, 0.2925452, -1.280753, 0, 1, 0.4901961, 1,
-0.2500406, -0.6104155, -2.51868, 0, 1, 0.4941176, 1,
-0.2432816, 0.3747815, 0.7065057, 0, 1, 0.5019608, 1,
-0.2428719, -0.4552863, -1.137428, 0, 1, 0.509804, 1,
-0.2407039, -1.266109, -2.490117, 0, 1, 0.5137255, 1,
-0.2403069, -1.421193, -3.264891, 0, 1, 0.5215687, 1,
-0.2363163, -0.1816668, -3.00246, 0, 1, 0.5254902, 1,
-0.2354238, 0.535702, 0.4283691, 0, 1, 0.5333334, 1,
-0.2266565, 0.04034605, -0.5629292, 0, 1, 0.5372549, 1,
-0.2220603, 0.4652297, -0.2436717, 0, 1, 0.5450981, 1,
-0.2176243, 0.5050247, -1.494848, 0, 1, 0.5490196, 1,
-0.2154002, 1.707283, -1.700623, 0, 1, 0.5568628, 1,
-0.2139647, -0.9074496, -3.604928, 0, 1, 0.5607843, 1,
-0.2097481, -0.4898484, -1.646502, 0, 1, 0.5686275, 1,
-0.2083534, -2.044953, -2.472838, 0, 1, 0.572549, 1,
-0.2075655, 0.3874322, -1.312854, 0, 1, 0.5803922, 1,
-0.2066643, 0.1702537, -0.5270516, 0, 1, 0.5843138, 1,
-0.2060459, -0.0352181, -0.79389, 0, 1, 0.5921569, 1,
-0.2058865, -0.9675115, -2.137993, 0, 1, 0.5960785, 1,
-0.2050872, -0.8840486, -2.557627, 0, 1, 0.6039216, 1,
-0.2020249, -1.692337, -2.615927, 0, 1, 0.6117647, 1,
-0.2014206, 0.5404926, -1.086232, 0, 1, 0.6156863, 1,
-0.2000694, -1.630569, -2.787397, 0, 1, 0.6235294, 1,
-0.1969815, -0.8592153, -2.510989, 0, 1, 0.627451, 1,
-0.1945344, -0.4660503, -3.458124, 0, 1, 0.6352941, 1,
-0.1945134, 0.1221693, -1.070524, 0, 1, 0.6392157, 1,
-0.1921341, -1.177185, -3.593701, 0, 1, 0.6470588, 1,
-0.1887967, 0.4452237, 0.003547551, 0, 1, 0.6509804, 1,
-0.1887894, -1.950919, -0.7523655, 0, 1, 0.6588235, 1,
-0.1876348, 0.4417424, 1.145582, 0, 1, 0.6627451, 1,
-0.1874905, 0.7701759, -0.2836646, 0, 1, 0.6705883, 1,
-0.1866816, -1.551724, -3.414174, 0, 1, 0.6745098, 1,
-0.1863638, 0.1244713, -0.8604733, 0, 1, 0.682353, 1,
-0.1854174, 0.02838759, -0.9001294, 0, 1, 0.6862745, 1,
-0.1853884, 0.7672233, -0.6092479, 0, 1, 0.6941177, 1,
-0.1819568, -1.25376, -2.467993, 0, 1, 0.7019608, 1,
-0.1701097, -1.272483, -4.121652, 0, 1, 0.7058824, 1,
-0.1668746, 0.2061097, -0.3932302, 0, 1, 0.7137255, 1,
-0.1667845, -1.095553, -2.983626, 0, 1, 0.7176471, 1,
-0.1627067, 0.9613899, -0.5339175, 0, 1, 0.7254902, 1,
-0.157498, -1.009462, -4.608852, 0, 1, 0.7294118, 1,
-0.1534422, -0.2512042, -3.187581, 0, 1, 0.7372549, 1,
-0.1494304, 1.246027, 0.6009622, 0, 1, 0.7411765, 1,
-0.1485702, -0.541351, -2.679919, 0, 1, 0.7490196, 1,
-0.1446963, 1.153214, -0.7539992, 0, 1, 0.7529412, 1,
-0.1427873, -1.200013, -1.789727, 0, 1, 0.7607843, 1,
-0.1367742, -0.2560401, -4.799901, 0, 1, 0.7647059, 1,
-0.1349322, -0.3020476, -2.920307, 0, 1, 0.772549, 1,
-0.1299843, -1.762454, -2.88521, 0, 1, 0.7764706, 1,
-0.1253148, 0.2144094, -0.6515102, 0, 1, 0.7843137, 1,
-0.1189859, -1.675791, -2.828298, 0, 1, 0.7882353, 1,
-0.1161831, -1.789239, -3.673455, 0, 1, 0.7960784, 1,
-0.109583, -0.8123673, -2.794933, 0, 1, 0.8039216, 1,
-0.108164, 0.9155964, -1.440618, 0, 1, 0.8078431, 1,
-0.1081558, -0.3061964, -3.635568, 0, 1, 0.8156863, 1,
-0.1077514, 0.2191682, -0.6338598, 0, 1, 0.8196079, 1,
-0.105221, 0.4777305, -1.113417, 0, 1, 0.827451, 1,
-0.1048296, 0.5451176, 0.8476124, 0, 1, 0.8313726, 1,
-0.1015388, -0.7756876, -2.334418, 0, 1, 0.8392157, 1,
-0.1001534, 0.989835, -0.2934633, 0, 1, 0.8431373, 1,
-0.09928293, 0.4393713, 0.590876, 0, 1, 0.8509804, 1,
-0.09348845, 0.08001203, -0.6804588, 0, 1, 0.854902, 1,
-0.09163143, 0.1224843, 0.5796726, 0, 1, 0.8627451, 1,
-0.09138174, 2.925163, 1.219134, 0, 1, 0.8666667, 1,
-0.09115012, 0.8453959, -0.2708115, 0, 1, 0.8745098, 1,
-0.08896039, -0.5519817, -2.436712, 0, 1, 0.8784314, 1,
-0.08832487, 1.917851, -0.09610236, 0, 1, 0.8862745, 1,
-0.08813242, -0.1952963, -3.502984, 0, 1, 0.8901961, 1,
-0.08759753, 0.7100117, 0.1171331, 0, 1, 0.8980392, 1,
-0.08372526, -0.4277411, -2.843692, 0, 1, 0.9058824, 1,
-0.08208304, 0.218497, -0.4308044, 0, 1, 0.9098039, 1,
-0.07790339, -1.461405, -2.542538, 0, 1, 0.9176471, 1,
-0.06680951, 1.542912, 1.327221, 0, 1, 0.9215686, 1,
-0.06327002, -2.052867, -5.12793, 0, 1, 0.9294118, 1,
-0.0613051, 0.1520631, -0.6813207, 0, 1, 0.9333333, 1,
-0.05766096, 1.743729, -0.7097185, 0, 1, 0.9411765, 1,
-0.05287685, -0.3397152, -4.180659, 0, 1, 0.945098, 1,
-0.05011884, -2.634255, -3.764118, 0, 1, 0.9529412, 1,
-0.04515761, 1.265919, -0.3328164, 0, 1, 0.9568627, 1,
-0.04300857, 0.3853879, -0.6095108, 0, 1, 0.9647059, 1,
-0.0378023, 1.783373, 0.9509, 0, 1, 0.9686275, 1,
-0.03708735, -0.3773304, -4.679133, 0, 1, 0.9764706, 1,
-0.03179022, -0.03644211, -5.644163, 0, 1, 0.9803922, 1,
-0.02726577, 0.5022693, 1.368166, 0, 1, 0.9882353, 1,
-0.02539178, -0.4560867, -2.185139, 0, 1, 0.9921569, 1,
-0.02467508, -1.245322, -1.380688, 0, 1, 1, 1,
-0.02430307, -0.7507567, -3.870425, 0, 0.9921569, 1, 1,
-0.02234607, 0.6458492, 1.578874, 0, 0.9882353, 1, 1,
-0.0212073, -1.654069, -2.418937, 0, 0.9803922, 1, 1,
-0.01657423, -1.220221, -1.530292, 0, 0.9764706, 1, 1,
-0.01577397, -0.7558664, -2.372835, 0, 0.9686275, 1, 1,
-0.0102938, -0.1479419, -3.589446, 0, 0.9647059, 1, 1,
-0.008757813, 0.8272047, 0.67955, 0, 0.9568627, 1, 1,
-0.008111862, 0.9896119, -0.4674472, 0, 0.9529412, 1, 1,
-0.004496865, 0.2270285, -0.5295869, 0, 0.945098, 1, 1,
-0.004029718, -0.7412941, -2.092952, 0, 0.9411765, 1, 1,
-0.003897983, -1.917371, -2.517842, 0, 0.9333333, 1, 1,
0.002432591, -0.15231, 2.670325, 0, 0.9294118, 1, 1,
0.003154085, 0.7627338, -1.141006, 0, 0.9215686, 1, 1,
0.003412394, -2.849951, 2.741464, 0, 0.9176471, 1, 1,
0.003732336, 0.005714142, 0.6937438, 0, 0.9098039, 1, 1,
0.004541783, 0.3782951, -0.6825471, 0, 0.9058824, 1, 1,
0.004586628, 0.7648726, 0.4931221, 0, 0.8980392, 1, 1,
0.00632262, 0.09134091, 1.509362, 0, 0.8901961, 1, 1,
0.0099274, 0.1876144, -0.4800278, 0, 0.8862745, 1, 1,
0.0103913, 0.7943571, 0.3218336, 0, 0.8784314, 1, 1,
0.01293373, 0.3062524, -0.7334598, 0, 0.8745098, 1, 1,
0.01415317, 1.450193, -1.716826, 0, 0.8666667, 1, 1,
0.01574671, 0.2639683, 0.522926, 0, 0.8627451, 1, 1,
0.01827745, 0.7111777, -0.6750285, 0, 0.854902, 1, 1,
0.020528, 1.666432, 0.4758199, 0, 0.8509804, 1, 1,
0.02762223, 0.3989579, -0.6883694, 0, 0.8431373, 1, 1,
0.03073486, 1.677353, -0.4304166, 0, 0.8392157, 1, 1,
0.03103302, 1.141193, -0.9768173, 0, 0.8313726, 1, 1,
0.0341727, -0.4604606, 1.794744, 0, 0.827451, 1, 1,
0.03561516, -0.6488705, 4.246753, 0, 0.8196079, 1, 1,
0.03642583, 1.278314, -1.506451, 0, 0.8156863, 1, 1,
0.04499115, 0.110162, -0.06015604, 0, 0.8078431, 1, 1,
0.05202575, 1.105859, 0.2151484, 0, 0.8039216, 1, 1,
0.05673749, 0.574581, 0.3489026, 0, 0.7960784, 1, 1,
0.05790062, 1.096444, -0.0555597, 0, 0.7882353, 1, 1,
0.05843714, -1.487258, 4.129789, 0, 0.7843137, 1, 1,
0.05958974, -1.431033, 2.333112, 0, 0.7764706, 1, 1,
0.06043444, -1.509262, 4.272955, 0, 0.772549, 1, 1,
0.06050577, -1.540405, 4.242629, 0, 0.7647059, 1, 1,
0.06443454, 1.169779, 1.633593, 0, 0.7607843, 1, 1,
0.06481152, -0.518548, 1.509899, 0, 0.7529412, 1, 1,
0.06732164, 0.1331882, -0.04932638, 0, 0.7490196, 1, 1,
0.07344934, -0.9144713, 1.4222, 0, 0.7411765, 1, 1,
0.07633512, 1.074678, -0.5749422, 0, 0.7372549, 1, 1,
0.07637909, 0.481649, -0.80252, 0, 0.7294118, 1, 1,
0.07922865, 0.8417409, -1.380539, 0, 0.7254902, 1, 1,
0.08205357, 0.6288679, -1.042908, 0, 0.7176471, 1, 1,
0.08273152, 0.7890633, 1.126927, 0, 0.7137255, 1, 1,
0.08423999, 0.3264632, 0.1796598, 0, 0.7058824, 1, 1,
0.08833639, -0.4952594, 4.864238, 0, 0.6980392, 1, 1,
0.09282139, 0.3732424, -0.3285787, 0, 0.6941177, 1, 1,
0.09333804, -0.4453438, 2.019519, 0, 0.6862745, 1, 1,
0.09484096, -0.6260129, 3.637053, 0, 0.682353, 1, 1,
0.0958545, -0.8736879, 2.209601, 0, 0.6745098, 1, 1,
0.09643284, -0.743203, 1.27728, 0, 0.6705883, 1, 1,
0.09839406, -1.246812, 4.466382, 0, 0.6627451, 1, 1,
0.0989031, 0.8149448, 0.8089944, 0, 0.6588235, 1, 1,
0.1015533, 2.084764, 0.8428174, 0, 0.6509804, 1, 1,
0.1041441, 0.8166937, -0.699204, 0, 0.6470588, 1, 1,
0.1085132, 0.6800711, -0.5029654, 0, 0.6392157, 1, 1,
0.1087954, 2.213725, 0.6833161, 0, 0.6352941, 1, 1,
0.1104138, 1.924865, -1.617548, 0, 0.627451, 1, 1,
0.1136037, -0.005736076, 1.446111, 0, 0.6235294, 1, 1,
0.1211992, -0.4073005, 3.273427, 0, 0.6156863, 1, 1,
0.1238185, -0.6209402, 1.619612, 0, 0.6117647, 1, 1,
0.1239318, 0.9877963, 0.2218667, 0, 0.6039216, 1, 1,
0.1249452, 0.5162381, -0.229476, 0, 0.5960785, 1, 1,
0.1260053, 1.198143, -0.8323928, 0, 0.5921569, 1, 1,
0.1287563, -0.5040857, 2.343427, 0, 0.5843138, 1, 1,
0.1292052, -1.094774, 2.938131, 0, 0.5803922, 1, 1,
0.1315087, -1.52449, 4.8385, 0, 0.572549, 1, 1,
0.1348201, 1.252474, 1.193842, 0, 0.5686275, 1, 1,
0.1355701, 0.03872574, 0.5374504, 0, 0.5607843, 1, 1,
0.1366179, 0.1969979, 1.832696, 0, 0.5568628, 1, 1,
0.1390785, -0.5365754, 2.780643, 0, 0.5490196, 1, 1,
0.1398712, -0.869924, 2.994682, 0, 0.5450981, 1, 1,
0.1422833, -0.6439128, 3.10304, 0, 0.5372549, 1, 1,
0.1445934, 1.27212, -0.3082143, 0, 0.5333334, 1, 1,
0.1449715, -1.294475, 3.361775, 0, 0.5254902, 1, 1,
0.1501959, -1.958968, 3.389959, 0, 0.5215687, 1, 1,
0.1503299, 0.2283727, 0.07498268, 0, 0.5137255, 1, 1,
0.1520858, -0.3396805, 2.931613, 0, 0.509804, 1, 1,
0.1559929, 1.947417, -0.6661432, 0, 0.5019608, 1, 1,
0.1573147, -0.7969462, 1.991225, 0, 0.4941176, 1, 1,
0.1656753, 0.9383419, -0.0340835, 0, 0.4901961, 1, 1,
0.1762609, -1.574748, 2.949318, 0, 0.4823529, 1, 1,
0.1775974, -2.458969, 4.043441, 0, 0.4784314, 1, 1,
0.1833294, -1.134331, 0.7335176, 0, 0.4705882, 1, 1,
0.1842796, 0.2518713, -0.2993481, 0, 0.4666667, 1, 1,
0.1848606, -0.5670304, 2.201637, 0, 0.4588235, 1, 1,
0.1874701, -0.4130817, 3.114207, 0, 0.454902, 1, 1,
0.1912126, 0.1468617, 0.2590561, 0, 0.4470588, 1, 1,
0.1913645, 0.6985324, 0.2509972, 0, 0.4431373, 1, 1,
0.1936062, 0.06433418, 1.443309, 0, 0.4352941, 1, 1,
0.1936779, -0.04054417, 3.313427, 0, 0.4313726, 1, 1,
0.1955727, -0.6108798, 2.879169, 0, 0.4235294, 1, 1,
0.1970151, -0.8483388, 2.234861, 0, 0.4196078, 1, 1,
0.2003242, -0.1077215, 0.7382032, 0, 0.4117647, 1, 1,
0.2043333, -0.1409656, 2.5125, 0, 0.4078431, 1, 1,
0.2132425, -0.8355592, 4.491285, 0, 0.4, 1, 1,
0.2137059, 0.1351887, 2.194884, 0, 0.3921569, 1, 1,
0.2166776, 1.716342, 0.8137022, 0, 0.3882353, 1, 1,
0.2180689, 0.04140503, 1.712039, 0, 0.3803922, 1, 1,
0.2186717, -2.942359, 1.747817, 0, 0.3764706, 1, 1,
0.2191174, -0.6393763, 3.941541, 0, 0.3686275, 1, 1,
0.2193438, -1.173622, 2.448683, 0, 0.3647059, 1, 1,
0.2206489, 1.646019, -0.1921165, 0, 0.3568628, 1, 1,
0.2271211, -0.761921, 1.963328, 0, 0.3529412, 1, 1,
0.2339423, -0.3966008, 3.10723, 0, 0.345098, 1, 1,
0.2363836, 1.400755, -0.2782685, 0, 0.3411765, 1, 1,
0.2368762, -0.3499238, 1.118514, 0, 0.3333333, 1, 1,
0.2371479, 0.6135212, -1.470534, 0, 0.3294118, 1, 1,
0.2415649, 0.750137, 1.517724, 0, 0.3215686, 1, 1,
0.243131, -0.9530585, 3.756718, 0, 0.3176471, 1, 1,
0.244325, 0.6943626, 0.1385915, 0, 0.3098039, 1, 1,
0.2443298, 0.9901516, 0.8199852, 0, 0.3058824, 1, 1,
0.2484465, 1.933946, 0.349214, 0, 0.2980392, 1, 1,
0.2512292, 1.698551, 1.621817, 0, 0.2901961, 1, 1,
0.2596388, 2.562439, 1.074143, 0, 0.2862745, 1, 1,
0.2606629, 0.4753134, 0.226057, 0, 0.2784314, 1, 1,
0.2696071, 1.86443, -0.9889786, 0, 0.2745098, 1, 1,
0.2922009, 0.6510829, 0.200498, 0, 0.2666667, 1, 1,
0.2980368, -1.027479, 3.491346, 0, 0.2627451, 1, 1,
0.3012494, -0.0147034, 0.03326757, 0, 0.254902, 1, 1,
0.3077166, -2.663306, 3.725964, 0, 0.2509804, 1, 1,
0.310284, 0.05166734, 1.437724, 0, 0.2431373, 1, 1,
0.3131223, 0.8540177, 1.551703, 0, 0.2392157, 1, 1,
0.3242148, 0.8012707, -0.8372265, 0, 0.2313726, 1, 1,
0.3249029, 0.05057264, 2.237765, 0, 0.227451, 1, 1,
0.3250615, 0.5522688, 0.2564389, 0, 0.2196078, 1, 1,
0.3265767, 0.192234, 0.7722701, 0, 0.2156863, 1, 1,
0.3285079, -0.3459008, 1.638322, 0, 0.2078431, 1, 1,
0.3288982, -1.013353, 2.829116, 0, 0.2039216, 1, 1,
0.329341, 0.6870915, 0.1573622, 0, 0.1960784, 1, 1,
0.3337884, 1.06642, 1.557437, 0, 0.1882353, 1, 1,
0.3351247, 0.3646053, -0.8342327, 0, 0.1843137, 1, 1,
0.337062, -0.7676972, 3.797298, 0, 0.1764706, 1, 1,
0.3383141, 1.464753, -1.980999, 0, 0.172549, 1, 1,
0.3443336, -0.5921912, 0.500855, 0, 0.1647059, 1, 1,
0.3514762, -1.481716, 2.976668, 0, 0.1607843, 1, 1,
0.3572597, 0.1644606, 0.9150757, 0, 0.1529412, 1, 1,
0.3580511, 1.000051, 0.7220654, 0, 0.1490196, 1, 1,
0.3682674, 1.220793, 1.332361, 0, 0.1411765, 1, 1,
0.3741581, -1.405642, 1.625071, 0, 0.1372549, 1, 1,
0.3745719, -1.570071, 1.191988, 0, 0.1294118, 1, 1,
0.3799789, 1.166602, -0.4320759, 0, 0.1254902, 1, 1,
0.383694, 2.978128, -2.516223, 0, 0.1176471, 1, 1,
0.3908535, -0.2978097, 1.804036, 0, 0.1137255, 1, 1,
0.3908546, -0.1165042, 1.561565, 0, 0.1058824, 1, 1,
0.3914604, -0.4456947, 1.397073, 0, 0.09803922, 1, 1,
0.3990265, -0.5383875, 1.794715, 0, 0.09411765, 1, 1,
0.4006673, -1.237057, 3.088416, 0, 0.08627451, 1, 1,
0.4036739, -0.3863939, 1.574736, 0, 0.08235294, 1, 1,
0.408858, 2.259884, -0.6686882, 0, 0.07450981, 1, 1,
0.4107508, 0.423011, 0.3809167, 0, 0.07058824, 1, 1,
0.4135501, 2.887214, -0.300252, 0, 0.0627451, 1, 1,
0.4139745, 0.8248712, -1.26392, 0, 0.05882353, 1, 1,
0.4154558, 1.559677, 0.3060681, 0, 0.05098039, 1, 1,
0.4167094, -0.5537456, 2.861093, 0, 0.04705882, 1, 1,
0.4167717, 0.02503354, 1.483477, 0, 0.03921569, 1, 1,
0.4173279, -1.367322, 2.048897, 0, 0.03529412, 1, 1,
0.4222812, 0.3731001, 2.234062, 0, 0.02745098, 1, 1,
0.4251121, -0.0248868, 1.582291, 0, 0.02352941, 1, 1,
0.4275073, -0.8273433, 3.782864, 0, 0.01568628, 1, 1,
0.4283343, -1.840618, 2.204259, 0, 0.01176471, 1, 1,
0.4286459, -0.2465351, 3.088155, 0, 0.003921569, 1, 1,
0.4301358, -0.8940219, 1.306079, 0.003921569, 0, 1, 1,
0.4313693, 0.1711034, 0.7706202, 0.007843138, 0, 1, 1,
0.4325945, -0.7382745, 1.011792, 0.01568628, 0, 1, 1,
0.4335345, 2.203745, 1.293302, 0.01960784, 0, 1, 1,
0.4346915, 0.07829724, 0.4136894, 0.02745098, 0, 1, 1,
0.4352523, -0.119068, 2.15492, 0.03137255, 0, 1, 1,
0.4359123, 0.305455, -0.6557788, 0.03921569, 0, 1, 1,
0.4376648, 0.2938255, -0.5229785, 0.04313726, 0, 1, 1,
0.4436672, 0.5649928, 0.2987767, 0.05098039, 0, 1, 1,
0.4498191, 0.1806344, 1.578147, 0.05490196, 0, 1, 1,
0.4569092, -1.312391, 4.010253, 0.0627451, 0, 1, 1,
0.457624, -1.453845, 2.768288, 0.06666667, 0, 1, 1,
0.4612197, 0.6376701, 0.2366868, 0.07450981, 0, 1, 1,
0.4670601, -0.9660958, 4.372441, 0.07843138, 0, 1, 1,
0.468378, -0.2398479, 2.125477, 0.08627451, 0, 1, 1,
0.4690555, 0.3011145, 0.5963715, 0.09019608, 0, 1, 1,
0.4875095, 0.2209794, 2.4119, 0.09803922, 0, 1, 1,
0.4880743, 0.9586428, 0.1160894, 0.1058824, 0, 1, 1,
0.4894355, -1.744136, 4.994172, 0.1098039, 0, 1, 1,
0.4906859, -0.9622495, 4.470051, 0.1176471, 0, 1, 1,
0.4918369, -0.5907592, 3.73242, 0.1215686, 0, 1, 1,
0.493122, -1.979338, 3.346047, 0.1294118, 0, 1, 1,
0.4940059, -0.06555122, 1.227561, 0.1333333, 0, 1, 1,
0.4946041, -0.5463603, 1.50903, 0.1411765, 0, 1, 1,
0.496046, 1.362958, -0.02023001, 0.145098, 0, 1, 1,
0.4963425, -0.3793804, 2.202409, 0.1529412, 0, 1, 1,
0.4981287, 1.832944, 0.1297312, 0.1568628, 0, 1, 1,
0.4988315, 0.585532, -0.3779011, 0.1647059, 0, 1, 1,
0.5034479, -0.6425797, 3.834047, 0.1686275, 0, 1, 1,
0.5051959, -2.015253, 3.557159, 0.1764706, 0, 1, 1,
0.5077081, 0.2785318, 2.169312, 0.1803922, 0, 1, 1,
0.5079639, 0.692541, 1.158726, 0.1882353, 0, 1, 1,
0.5093697, -0.9794156, 1.170094, 0.1921569, 0, 1, 1,
0.5099509, 1.8151, 0.8122621, 0.2, 0, 1, 1,
0.5164147, -0.9332352, 3.062929, 0.2078431, 0, 1, 1,
0.5195601, 0.516624, -0.04714336, 0.2117647, 0, 1, 1,
0.5197772, -0.6466296, 3.535912, 0.2196078, 0, 1, 1,
0.5219338, 0.6843182, -1.141058, 0.2235294, 0, 1, 1,
0.5277959, 0.09882358, 2.457661, 0.2313726, 0, 1, 1,
0.5292424, -0.2262588, 1.725768, 0.2352941, 0, 1, 1,
0.5376025, 0.9589313, -0.03202391, 0.2431373, 0, 1, 1,
0.5409537, -0.4578526, 2.005732, 0.2470588, 0, 1, 1,
0.5430065, 0.3460373, 2.458395, 0.254902, 0, 1, 1,
0.5444515, -1.479249, 2.76462, 0.2588235, 0, 1, 1,
0.5465267, 0.9254147, -0.6063832, 0.2666667, 0, 1, 1,
0.5474898, 1.035823, 2.936212, 0.2705882, 0, 1, 1,
0.5508839, 1.290362, 1.617174, 0.2784314, 0, 1, 1,
0.5517795, -2.01121, 3.190223, 0.282353, 0, 1, 1,
0.5521751, -2.08937, 1.032105, 0.2901961, 0, 1, 1,
0.5539529, 0.2882024, -0.6721437, 0.2941177, 0, 1, 1,
0.5547748, 1.983535, 0.8158838, 0.3019608, 0, 1, 1,
0.5605839, 0.8686001, -0.4201427, 0.3098039, 0, 1, 1,
0.5610573, -0.03431112, 1.851403, 0.3137255, 0, 1, 1,
0.5631179, -1.150686, 2.109918, 0.3215686, 0, 1, 1,
0.5647576, -0.6829297, 3.969317, 0.3254902, 0, 1, 1,
0.5655174, -0.8487913, 3.35264, 0.3333333, 0, 1, 1,
0.5671204, 0.1353822, 0.8578961, 0.3372549, 0, 1, 1,
0.5741885, 0.5931482, -0.6896684, 0.345098, 0, 1, 1,
0.576285, 0.4516066, 1.990616, 0.3490196, 0, 1, 1,
0.5766211, 0.6178744, -0.1104953, 0.3568628, 0, 1, 1,
0.5774186, -0.3310621, 3.245209, 0.3607843, 0, 1, 1,
0.5830436, -0.4170289, 2.545582, 0.3686275, 0, 1, 1,
0.5903907, -1.382861, 1.697525, 0.372549, 0, 1, 1,
0.5923979, -0.6397802, 1.990083, 0.3803922, 0, 1, 1,
0.5927908, -0.7526426, 2.570965, 0.3843137, 0, 1, 1,
0.6003608, 2.192678, -0.4916697, 0.3921569, 0, 1, 1,
0.6008003, -0.624506, 2.236542, 0.3960784, 0, 1, 1,
0.6056484, -0.06413342, 2.527262, 0.4039216, 0, 1, 1,
0.6075249, -0.4227253, 0.3268631, 0.4117647, 0, 1, 1,
0.6081677, -0.04013446, 1.432187, 0.4156863, 0, 1, 1,
0.6087669, 1.06836, 0.2887431, 0.4235294, 0, 1, 1,
0.6132514, -1.252829, 3.232096, 0.427451, 0, 1, 1,
0.614463, 0.7602514, 1.358299, 0.4352941, 0, 1, 1,
0.6153411, 0.3137089, -0.03784068, 0.4392157, 0, 1, 1,
0.6230413, 0.3384706, 0.8791647, 0.4470588, 0, 1, 1,
0.6245067, 0.2510145, 0.4483308, 0.4509804, 0, 1, 1,
0.6253345, 1.504675, 0.3964209, 0.4588235, 0, 1, 1,
0.6284426, 0.6374447, -0.6682675, 0.4627451, 0, 1, 1,
0.6353427, -0.08709161, 1.540364, 0.4705882, 0, 1, 1,
0.6448717, 1.273175, 0.2884855, 0.4745098, 0, 1, 1,
0.6473877, 0.7090251, 2.05099, 0.4823529, 0, 1, 1,
0.6511809, 0.3061431, 1.366915, 0.4862745, 0, 1, 1,
0.6518248, -0.8932805, 3.132525, 0.4941176, 0, 1, 1,
0.6536129, -1.006955, 2.84588, 0.5019608, 0, 1, 1,
0.656844, -1.742756, 4.62235, 0.5058824, 0, 1, 1,
0.6607417, -0.0125147, 2.147429, 0.5137255, 0, 1, 1,
0.6748354, -1.406678, 3.173035, 0.5176471, 0, 1, 1,
0.6817666, 0.1305753, 2.737706, 0.5254902, 0, 1, 1,
0.6848105, 0.02835524, 3.110286, 0.5294118, 0, 1, 1,
0.6898983, 0.9924572, 1.362581, 0.5372549, 0, 1, 1,
0.69038, -1.350241, 2.779788, 0.5411765, 0, 1, 1,
0.690886, 0.6480566, 0.9031577, 0.5490196, 0, 1, 1,
0.6951532, 0.09153991, 0.1209795, 0.5529412, 0, 1, 1,
0.6952862, -1.010344, 2.744599, 0.5607843, 0, 1, 1,
0.6978291, -0.1485972, 2.292653, 0.5647059, 0, 1, 1,
0.6995462, 0.5342571, 2.005755, 0.572549, 0, 1, 1,
0.706324, 0.4442435, 0.6861521, 0.5764706, 0, 1, 1,
0.7106315, 0.1899224, 1.665158, 0.5843138, 0, 1, 1,
0.7125461, 0.397693, -1.493953, 0.5882353, 0, 1, 1,
0.7129226, -0.204017, 1.967932, 0.5960785, 0, 1, 1,
0.7163799, -2.832128, 2.934229, 0.6039216, 0, 1, 1,
0.7366641, 0.6575984, -0.6044316, 0.6078432, 0, 1, 1,
0.7385851, 0.2903641, 1.510631, 0.6156863, 0, 1, 1,
0.74648, 1.33234, 0.6898271, 0.6196079, 0, 1, 1,
0.751202, -0.5278896, 2.847283, 0.627451, 0, 1, 1,
0.7548949, 0.4388058, 1.414397, 0.6313726, 0, 1, 1,
0.763874, -0.6010315, 0.03499449, 0.6392157, 0, 1, 1,
0.7656169, -0.01582054, 1.756374, 0.6431373, 0, 1, 1,
0.765927, 0.1097305, 0.354135, 0.6509804, 0, 1, 1,
0.7699718, 0.5018004, 1.133775, 0.654902, 0, 1, 1,
0.7742921, 0.8743262, 0.8724803, 0.6627451, 0, 1, 1,
0.7770276, -0.8410568, 0.6365139, 0.6666667, 0, 1, 1,
0.7797921, -0.8222453, 2.866298, 0.6745098, 0, 1, 1,
0.7910544, -0.5164621, 1.839671, 0.6784314, 0, 1, 1,
0.7930142, 0.5092233, 0.4272616, 0.6862745, 0, 1, 1,
0.7934414, -2.882906, 3.953249, 0.6901961, 0, 1, 1,
0.795977, -0.05570406, 1.626079, 0.6980392, 0, 1, 1,
0.7968999, 2.17794, -0.3870733, 0.7058824, 0, 1, 1,
0.811396, -0.4838847, 2.333651, 0.7098039, 0, 1, 1,
0.8190429, -0.5812336, 1.956205, 0.7176471, 0, 1, 1,
0.8234349, 0.1241639, 1.560353, 0.7215686, 0, 1, 1,
0.8243461, -1.088031, 3.293563, 0.7294118, 0, 1, 1,
0.825757, -0.5759867, 1.639926, 0.7333333, 0, 1, 1,
0.8263773, -0.5530518, 2.81421, 0.7411765, 0, 1, 1,
0.8331822, -1.038182, 2.262001, 0.7450981, 0, 1, 1,
0.8380333, 0.09846281, 0.06931458, 0.7529412, 0, 1, 1,
0.8435671, -0.406989, 1.806939, 0.7568628, 0, 1, 1,
0.8512507, 1.073064, 1.385048, 0.7647059, 0, 1, 1,
0.8556501, 0.8471509, 0.60557, 0.7686275, 0, 1, 1,
0.8596558, 2.356032, -0.2761825, 0.7764706, 0, 1, 1,
0.8626005, -1.678964, 1.819845, 0.7803922, 0, 1, 1,
0.8639716, -0.8024781, 1.08773, 0.7882353, 0, 1, 1,
0.8653901, 0.4100009, 2.0039, 0.7921569, 0, 1, 1,
0.8680845, 1.495202, 0.2247521, 0.8, 0, 1, 1,
0.8700246, 0.7324642, 1.223036, 0.8078431, 0, 1, 1,
0.8700539, 1.583681, 0.1555881, 0.8117647, 0, 1, 1,
0.8768411, -0.6904733, 2.009977, 0.8196079, 0, 1, 1,
0.8807102, 0.0433021, 0.2635115, 0.8235294, 0, 1, 1,
0.8867122, -0.1409119, -0.05100726, 0.8313726, 0, 1, 1,
0.887141, -0.2118759, 0.5367627, 0.8352941, 0, 1, 1,
0.8977005, 1.91413, 0.5193486, 0.8431373, 0, 1, 1,
0.9019421, -0.4370486, 1.795672, 0.8470588, 0, 1, 1,
0.9116259, 0.1764879, 2.578691, 0.854902, 0, 1, 1,
0.9186797, 1.663516, 1.525107, 0.8588235, 0, 1, 1,
0.9208381, -1.370438, 1.540891, 0.8666667, 0, 1, 1,
0.9215178, -2.698817, 2.225357, 0.8705882, 0, 1, 1,
0.9232739, 0.5816193, -1.234455, 0.8784314, 0, 1, 1,
0.9263564, 0.2272086, 1.068962, 0.8823529, 0, 1, 1,
0.928728, -0.401254, 2.951203, 0.8901961, 0, 1, 1,
0.9382293, -1.367185, 2.260931, 0.8941177, 0, 1, 1,
0.9385448, 1.11827, -0.4386945, 0.9019608, 0, 1, 1,
0.9396799, -0.6222079, 3.358516, 0.9098039, 0, 1, 1,
0.9445112, -1.905939, 1.612264, 0.9137255, 0, 1, 1,
0.948074, -0.8228449, 2.444608, 0.9215686, 0, 1, 1,
0.9485155, 0.6066582, -0.1570682, 0.9254902, 0, 1, 1,
0.9603203, -0.07134497, 2.738703, 0.9333333, 0, 1, 1,
0.9641914, 0.3739963, 0.2508846, 0.9372549, 0, 1, 1,
0.9709676, 1.538438, 1.084916, 0.945098, 0, 1, 1,
0.9792872, 0.4668697, 1.097564, 0.9490196, 0, 1, 1,
0.9843339, 0.4391634, 1.142635, 0.9568627, 0, 1, 1,
0.9879387, -0.7998087, 1.661367, 0.9607843, 0, 1, 1,
0.9962484, -0.09322207, 1.322746, 0.9686275, 0, 1, 1,
0.9984282, 0.5596687, -0.5970508, 0.972549, 0, 1, 1,
1.005229, 1.323375, -0.4259822, 0.9803922, 0, 1, 1,
1.00551, -1.377085, 0.4381248, 0.9843137, 0, 1, 1,
1.01539, 0.1542635, 2.074063, 0.9921569, 0, 1, 1,
1.025401, -1.408564, 1.540213, 0.9960784, 0, 1, 1,
1.026736, 0.4811363, 0.7601983, 1, 0, 0.9960784, 1,
1.035767, -0.7644087, 3.127872, 1, 0, 0.9882353, 1,
1.044283, -0.7735668, 2.190364, 1, 0, 0.9843137, 1,
1.04985, -0.6009961, 0.5155734, 1, 0, 0.9764706, 1,
1.052621, -0.2107793, 1.226396, 1, 0, 0.972549, 1,
1.058648, -3.002769, 3.199635, 1, 0, 0.9647059, 1,
1.058825, 0.9119983, 0.9237475, 1, 0, 0.9607843, 1,
1.063123, -0.5370016, 2.672198, 1, 0, 0.9529412, 1,
1.065982, -0.588585, 0.9898819, 1, 0, 0.9490196, 1,
1.066516, -1.110477, 2.381268, 1, 0, 0.9411765, 1,
1.068606, -1.025919, 1.056779, 1, 0, 0.9372549, 1,
1.069922, -0.5770806, 2.924558, 1, 0, 0.9294118, 1,
1.070848, -1.608919, 1.951909, 1, 0, 0.9254902, 1,
1.080828, 0.3210064, 3.70294, 1, 0, 0.9176471, 1,
1.087235, -1.206321, 3.003804, 1, 0, 0.9137255, 1,
1.088551, 0.1310088, 1.241573, 1, 0, 0.9058824, 1,
1.090604, -1.865578, 2.590979, 1, 0, 0.9019608, 1,
1.096584, 2.159422, -0.4974394, 1, 0, 0.8941177, 1,
1.102368, 0.9645514, 1.646775, 1, 0, 0.8862745, 1,
1.103763, 1.152892, 0.6787367, 1, 0, 0.8823529, 1,
1.105506, -0.7283561, 2.185163, 1, 0, 0.8745098, 1,
1.107518, 0.3652755, 1.067855, 1, 0, 0.8705882, 1,
1.108842, 0.6928505, 2.593847, 1, 0, 0.8627451, 1,
1.114584, -0.4794913, 2.294254, 1, 0, 0.8588235, 1,
1.122737, -1.070008, 2.160638, 1, 0, 0.8509804, 1,
1.125269, -0.2467567, 0.8425147, 1, 0, 0.8470588, 1,
1.129039, -0.03732423, 1.995785, 1, 0, 0.8392157, 1,
1.130107, 1.741036, 3.011827, 1, 0, 0.8352941, 1,
1.133402, -0.6840092, 2.765336, 1, 0, 0.827451, 1,
1.133912, -0.8172907, 1.361495, 1, 0, 0.8235294, 1,
1.137063, -1.513191, 2.599672, 1, 0, 0.8156863, 1,
1.147565, 0.5837069, 1.781333, 1, 0, 0.8117647, 1,
1.149149, 0.8725848, 2.653726, 1, 0, 0.8039216, 1,
1.170318, -0.4960533, 1.810994, 1, 0, 0.7960784, 1,
1.172806, -0.6671576, 3.032847, 1, 0, 0.7921569, 1,
1.176643, 1.094134, 2.022906, 1, 0, 0.7843137, 1,
1.180632, 0.1229664, -0.3213896, 1, 0, 0.7803922, 1,
1.183507, -0.4734169, 2.021427, 1, 0, 0.772549, 1,
1.189335, 0.8773262, 1.443336, 1, 0, 0.7686275, 1,
1.1899, 0.3001567, -0.1317546, 1, 0, 0.7607843, 1,
1.194964, 0.05110402, 3.206043, 1, 0, 0.7568628, 1,
1.202905, -0.6189348, 2.324316, 1, 0, 0.7490196, 1,
1.208326, 0.8691131, 1.907923, 1, 0, 0.7450981, 1,
1.231754, -1.412373, 2.674891, 1, 0, 0.7372549, 1,
1.233162, 0.06227643, 0.5511643, 1, 0, 0.7333333, 1,
1.237552, -0.53048, 2.000961, 1, 0, 0.7254902, 1,
1.239106, 0.3147552, -0.1783627, 1, 0, 0.7215686, 1,
1.239335, -0.9004435, 2.66523, 1, 0, 0.7137255, 1,
1.240906, -1.498427, 2.77726, 1, 0, 0.7098039, 1,
1.241354, 1.401993, 1.500974, 1, 0, 0.7019608, 1,
1.243017, 2.257908, 0.4849389, 1, 0, 0.6941177, 1,
1.243993, -0.1488818, 2.058072, 1, 0, 0.6901961, 1,
1.25153, -0.4423061, 0.8497946, 1, 0, 0.682353, 1,
1.252357, -0.4255904, 2.095578, 1, 0, 0.6784314, 1,
1.257335, 0.3015885, 0.4836503, 1, 0, 0.6705883, 1,
1.26539, 0.3005543, 1.222982, 1, 0, 0.6666667, 1,
1.26745, -0.5581673, 2.666802, 1, 0, 0.6588235, 1,
1.268522, 0.9495568, 1.834868, 1, 0, 0.654902, 1,
1.277288, 0.695273, 1.103306, 1, 0, 0.6470588, 1,
1.287251, 0.3392219, -0.4138951, 1, 0, 0.6431373, 1,
1.293374, -0.7937549, 2.303527, 1, 0, 0.6352941, 1,
1.29428, -0.2057817, 2.097242, 1, 0, 0.6313726, 1,
1.296358, -0.5700415, 2.925909, 1, 0, 0.6235294, 1,
1.297778, -0.8903474, 2.306479, 1, 0, 0.6196079, 1,
1.329634, 1.836644, -0.1937602, 1, 0, 0.6117647, 1,
1.33115, 0.3273575, 1.844911, 1, 0, 0.6078432, 1,
1.342631, 1.666223, 1.001649, 1, 0, 0.6, 1,
1.346458, -0.04533635, 2.535968, 1, 0, 0.5921569, 1,
1.350337, -0.781912, 2.652441, 1, 0, 0.5882353, 1,
1.357618, 2.507236, -1.076871, 1, 0, 0.5803922, 1,
1.361275, -1.044155, 1.575141, 1, 0, 0.5764706, 1,
1.370978, 0.3637979, 2.54545, 1, 0, 0.5686275, 1,
1.375908, 0.00936773, 1.573099, 1, 0, 0.5647059, 1,
1.383989, 0.8280645, -0.3966934, 1, 0, 0.5568628, 1,
1.402637, 0.1185599, 3.242203, 1, 0, 0.5529412, 1,
1.406527, 0.6557692, 1.177813, 1, 0, 0.5450981, 1,
1.409859, 1.051861, 1.722481, 1, 0, 0.5411765, 1,
1.411218, -0.6950627, 2.176397, 1, 0, 0.5333334, 1,
1.412387, 0.3246761, 1.855718, 1, 0, 0.5294118, 1,
1.428402, 0.2242807, -0.1212016, 1, 0, 0.5215687, 1,
1.428876, 0.5551829, 0.700798, 1, 0, 0.5176471, 1,
1.430586, -0.8597144, 2.131744, 1, 0, 0.509804, 1,
1.438052, -2.240094, 2.407672, 1, 0, 0.5058824, 1,
1.440814, 0.3704914, 1.697737, 1, 0, 0.4980392, 1,
1.443679, -1.318297, 2.040021, 1, 0, 0.4901961, 1,
1.445946, 0.3685053, 0.9534617, 1, 0, 0.4862745, 1,
1.450431, -1.111267, 2.262947, 1, 0, 0.4784314, 1,
1.452152, -1.581187, 1.647997, 1, 0, 0.4745098, 1,
1.453041, 0.3233944, 0.9837265, 1, 0, 0.4666667, 1,
1.453833, -0.001249756, 1.433251, 1, 0, 0.4627451, 1,
1.457166, -1.254488, 2.458935, 1, 0, 0.454902, 1,
1.46556, -0.4868868, 4.251516, 1, 0, 0.4509804, 1,
1.47676, -0.2059527, 1.845123, 1, 0, 0.4431373, 1,
1.503549, 0.6469121, 2.715627, 1, 0, 0.4392157, 1,
1.505361, 0.706561, 1.212201, 1, 0, 0.4313726, 1,
1.506958, 0.03431632, 2.41244, 1, 0, 0.427451, 1,
1.513137, 0.6154187, -1.270844, 1, 0, 0.4196078, 1,
1.521713, 0.4948986, 1.807237, 1, 0, 0.4156863, 1,
1.522852, 0.2626163, 0.2548593, 1, 0, 0.4078431, 1,
1.536892, 0.07343563, 0.6216342, 1, 0, 0.4039216, 1,
1.548314, 0.5953793, 1.155853, 1, 0, 0.3960784, 1,
1.561121, -1.353335, 2.746493, 1, 0, 0.3882353, 1,
1.579221, -1.218253, 1.580909, 1, 0, 0.3843137, 1,
1.580972, 0.08608321, 1.720441, 1, 0, 0.3764706, 1,
1.582712, -0.7811602, 0.6149701, 1, 0, 0.372549, 1,
1.586795, -0.1027608, -0.1903534, 1, 0, 0.3647059, 1,
1.594536, 0.4604082, 2.030789, 1, 0, 0.3607843, 1,
1.596006, -0.2283362, 0.7922874, 1, 0, 0.3529412, 1,
1.601369, -0.5998891, 1.82182, 1, 0, 0.3490196, 1,
1.613035, -1.466978, 1.403155, 1, 0, 0.3411765, 1,
1.622655, 0.4433223, 2.023419, 1, 0, 0.3372549, 1,
1.629284, 1.464975, 2.074696, 1, 0, 0.3294118, 1,
1.630785, 0.4723144, 2.199331, 1, 0, 0.3254902, 1,
1.641862, -0.5617645, 2.30976, 1, 0, 0.3176471, 1,
1.649045, 1.343406, 1.30943, 1, 0, 0.3137255, 1,
1.650797, -0.7214727, 1.022958, 1, 0, 0.3058824, 1,
1.651111, 0.2059243, 0.285461, 1, 0, 0.2980392, 1,
1.658364, -1.578971, 2.408342, 1, 0, 0.2941177, 1,
1.66745, 0.3413028, 1.246693, 1, 0, 0.2862745, 1,
1.668527, -2.534469, 1.852212, 1, 0, 0.282353, 1,
1.671836, -1.080583, 0.9201581, 1, 0, 0.2745098, 1,
1.672602, 0.6190062, 1.262868, 1, 0, 0.2705882, 1,
1.673735, -0.1577729, 1.891954, 1, 0, 0.2627451, 1,
1.681426, -1.255051, 3.614817, 1, 0, 0.2588235, 1,
1.699455, 0.5336564, 0.2079531, 1, 0, 0.2509804, 1,
1.731353, -1.570142, 2.784375, 1, 0, 0.2470588, 1,
1.750414, -1.569796, 1.258339, 1, 0, 0.2392157, 1,
1.787793, 1.080567, -0.1851927, 1, 0, 0.2352941, 1,
1.788195, 1.748046, 0.9176198, 1, 0, 0.227451, 1,
1.798135, -1.492173, 3.851021, 1, 0, 0.2235294, 1,
1.801338, 0.3715106, 0.9594818, 1, 0, 0.2156863, 1,
1.803006, -1.203884, 1.972239, 1, 0, 0.2117647, 1,
1.803027, -0.3578219, 2.479209, 1, 0, 0.2039216, 1,
1.806654, -1.129076, 1.855023, 1, 0, 0.1960784, 1,
1.810306, 0.7751924, -0.2704226, 1, 0, 0.1921569, 1,
1.827587, 1.376294, 0.5620111, 1, 0, 0.1843137, 1,
1.835516, 0.4041994, 1.717793, 1, 0, 0.1803922, 1,
1.848785, 0.6202223, 0.2134722, 1, 0, 0.172549, 1,
1.859839, -0.4543682, 1.286456, 1, 0, 0.1686275, 1,
1.89818, 0.8635439, 1.465128, 1, 0, 0.1607843, 1,
1.915492, -0.5143673, 0.6762259, 1, 0, 0.1568628, 1,
1.937078, -1.113058, 1.388035, 1, 0, 0.1490196, 1,
1.96379, 0.1813181, 1.62534, 1, 0, 0.145098, 1,
2.027303, -0.349406, 1.357669, 1, 0, 0.1372549, 1,
2.052546, -0.6143715, 1.504221, 1, 0, 0.1333333, 1,
2.087817, -0.3054073, 2.173256, 1, 0, 0.1254902, 1,
2.088199, 0.3646585, -0.1419743, 1, 0, 0.1215686, 1,
2.133855, 0.4928256, 3.736829, 1, 0, 0.1137255, 1,
2.1496, 0.5123324, 1.541427, 1, 0, 0.1098039, 1,
2.204314, -1.13464, 3.16085, 1, 0, 0.1019608, 1,
2.209789, -1.903226, 1.880906, 1, 0, 0.09411765, 1,
2.224332, -0.750754, 2.440418, 1, 0, 0.09019608, 1,
2.259759, -0.05277983, 2.558127, 1, 0, 0.08235294, 1,
2.32191, 0.2949089, 2.601761, 1, 0, 0.07843138, 1,
2.422538, 1.849747, 0.7824536, 1, 0, 0.07058824, 1,
2.430478, 0.93878, 1.078555, 1, 0, 0.06666667, 1,
2.435088, 0.5249221, 0.92835, 1, 0, 0.05882353, 1,
2.445199, 0.558764, 1.385656, 1, 0, 0.05490196, 1,
2.456745, 0.7021018, -0.1388895, 1, 0, 0.04705882, 1,
2.561592, -0.1903833, 0.7605972, 1, 0, 0.04313726, 1,
2.563157, -1.650207, 3.873358, 1, 0, 0.03529412, 1,
2.687365, 0.661615, 2.551927, 1, 0, 0.03137255, 1,
2.905885, 0.4205712, 2.187776, 1, 0, 0.02352941, 1,
2.913536, -0.9276167, 2.131784, 1, 0, 0.01960784, 1,
3.205384, 0.2890289, 2.308159, 1, 0, 0.01176471, 1,
3.367789, 0.6047984, 2.099108, 1, 0, 0.007843138, 1
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
-0.02383256, -4.016531, -7.447361, 0, -0.5, 0.5, 0.5,
-0.02383256, -4.016531, -7.447361, 1, -0.5, 0.5, 0.5,
-0.02383256, -4.016531, -7.447361, 1, 1.5, 0.5, 0.5,
-0.02383256, -4.016531, -7.447361, 0, 1.5, 0.5, 0.5
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
-4.565213, -0.01232052, -7.447361, 0, -0.5, 0.5, 0.5,
-4.565213, -0.01232052, -7.447361, 1, -0.5, 0.5, 0.5,
-4.565213, -0.01232052, -7.447361, 1, 1.5, 0.5, 0.5,
-4.565213, -0.01232052, -7.447361, 0, 1.5, 0.5, 0.5
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
-4.565213, -4.016531, -0.3249953, 0, -0.5, 0.5, 0.5,
-4.565213, -4.016531, -0.3249953, 1, -0.5, 0.5, 0.5,
-4.565213, -4.016531, -0.3249953, 1, 1.5, 0.5, 0.5,
-4.565213, -4.016531, -0.3249953, 0, 1.5, 0.5, 0.5
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
-3, -3.092483, -5.803738,
3, -3.092483, -5.803738,
-3, -3.092483, -5.803738,
-3, -3.24649, -6.077675,
-2, -3.092483, -5.803738,
-2, -3.24649, -6.077675,
-1, -3.092483, -5.803738,
-1, -3.24649, -6.077675,
0, -3.092483, -5.803738,
0, -3.24649, -6.077675,
1, -3.092483, -5.803738,
1, -3.24649, -6.077675,
2, -3.092483, -5.803738,
2, -3.24649, -6.077675,
3, -3.092483, -5.803738,
3, -3.24649, -6.077675
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
-3, -3.554507, -6.625549, 0, -0.5, 0.5, 0.5,
-3, -3.554507, -6.625549, 1, -0.5, 0.5, 0.5,
-3, -3.554507, -6.625549, 1, 1.5, 0.5, 0.5,
-3, -3.554507, -6.625549, 0, 1.5, 0.5, 0.5,
-2, -3.554507, -6.625549, 0, -0.5, 0.5, 0.5,
-2, -3.554507, -6.625549, 1, -0.5, 0.5, 0.5,
-2, -3.554507, -6.625549, 1, 1.5, 0.5, 0.5,
-2, -3.554507, -6.625549, 0, 1.5, 0.5, 0.5,
-1, -3.554507, -6.625549, 0, -0.5, 0.5, 0.5,
-1, -3.554507, -6.625549, 1, -0.5, 0.5, 0.5,
-1, -3.554507, -6.625549, 1, 1.5, 0.5, 0.5,
-1, -3.554507, -6.625549, 0, 1.5, 0.5, 0.5,
0, -3.554507, -6.625549, 0, -0.5, 0.5, 0.5,
0, -3.554507, -6.625549, 1, -0.5, 0.5, 0.5,
0, -3.554507, -6.625549, 1, 1.5, 0.5, 0.5,
0, -3.554507, -6.625549, 0, 1.5, 0.5, 0.5,
1, -3.554507, -6.625549, 0, -0.5, 0.5, 0.5,
1, -3.554507, -6.625549, 1, -0.5, 0.5, 0.5,
1, -3.554507, -6.625549, 1, 1.5, 0.5, 0.5,
1, -3.554507, -6.625549, 0, 1.5, 0.5, 0.5,
2, -3.554507, -6.625549, 0, -0.5, 0.5, 0.5,
2, -3.554507, -6.625549, 1, -0.5, 0.5, 0.5,
2, -3.554507, -6.625549, 1, 1.5, 0.5, 0.5,
2, -3.554507, -6.625549, 0, 1.5, 0.5, 0.5,
3, -3.554507, -6.625549, 0, -0.5, 0.5, 0.5,
3, -3.554507, -6.625549, 1, -0.5, 0.5, 0.5,
3, -3.554507, -6.625549, 1, 1.5, 0.5, 0.5,
3, -3.554507, -6.625549, 0, 1.5, 0.5, 0.5
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
-3.517202, -3, -5.803738,
-3.517202, 2, -5.803738,
-3.517202, -3, -5.803738,
-3.691871, -3, -6.077675,
-3.517202, -2, -5.803738,
-3.691871, -2, -6.077675,
-3.517202, -1, -5.803738,
-3.691871, -1, -6.077675,
-3.517202, 0, -5.803738,
-3.691871, 0, -6.077675,
-3.517202, 1, -5.803738,
-3.691871, 1, -6.077675,
-3.517202, 2, -5.803738,
-3.691871, 2, -6.077675
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
-4.041208, -3, -6.625549, 0, -0.5, 0.5, 0.5,
-4.041208, -3, -6.625549, 1, -0.5, 0.5, 0.5,
-4.041208, -3, -6.625549, 1, 1.5, 0.5, 0.5,
-4.041208, -3, -6.625549, 0, 1.5, 0.5, 0.5,
-4.041208, -2, -6.625549, 0, -0.5, 0.5, 0.5,
-4.041208, -2, -6.625549, 1, -0.5, 0.5, 0.5,
-4.041208, -2, -6.625549, 1, 1.5, 0.5, 0.5,
-4.041208, -2, -6.625549, 0, 1.5, 0.5, 0.5,
-4.041208, -1, -6.625549, 0, -0.5, 0.5, 0.5,
-4.041208, -1, -6.625549, 1, -0.5, 0.5, 0.5,
-4.041208, -1, -6.625549, 1, 1.5, 0.5, 0.5,
-4.041208, -1, -6.625549, 0, 1.5, 0.5, 0.5,
-4.041208, 0, -6.625549, 0, -0.5, 0.5, 0.5,
-4.041208, 0, -6.625549, 1, -0.5, 0.5, 0.5,
-4.041208, 0, -6.625549, 1, 1.5, 0.5, 0.5,
-4.041208, 0, -6.625549, 0, 1.5, 0.5, 0.5,
-4.041208, 1, -6.625549, 0, -0.5, 0.5, 0.5,
-4.041208, 1, -6.625549, 1, -0.5, 0.5, 0.5,
-4.041208, 1, -6.625549, 1, 1.5, 0.5, 0.5,
-4.041208, 1, -6.625549, 0, 1.5, 0.5, 0.5,
-4.041208, 2, -6.625549, 0, -0.5, 0.5, 0.5,
-4.041208, 2, -6.625549, 1, -0.5, 0.5, 0.5,
-4.041208, 2, -6.625549, 1, 1.5, 0.5, 0.5,
-4.041208, 2, -6.625549, 0, 1.5, 0.5, 0.5
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
-3.517202, -3.092483, -4,
-3.517202, -3.092483, 4,
-3.517202, -3.092483, -4,
-3.691871, -3.24649, -4,
-3.517202, -3.092483, -2,
-3.691871, -3.24649, -2,
-3.517202, -3.092483, 0,
-3.691871, -3.24649, 0,
-3.517202, -3.092483, 2,
-3.691871, -3.24649, 2,
-3.517202, -3.092483, 4,
-3.691871, -3.24649, 4
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
-4.041208, -3.554507, -4, 0, -0.5, 0.5, 0.5,
-4.041208, -3.554507, -4, 1, -0.5, 0.5, 0.5,
-4.041208, -3.554507, -4, 1, 1.5, 0.5, 0.5,
-4.041208, -3.554507, -4, 0, 1.5, 0.5, 0.5,
-4.041208, -3.554507, -2, 0, -0.5, 0.5, 0.5,
-4.041208, -3.554507, -2, 1, -0.5, 0.5, 0.5,
-4.041208, -3.554507, -2, 1, 1.5, 0.5, 0.5,
-4.041208, -3.554507, -2, 0, 1.5, 0.5, 0.5,
-4.041208, -3.554507, 0, 0, -0.5, 0.5, 0.5,
-4.041208, -3.554507, 0, 1, -0.5, 0.5, 0.5,
-4.041208, -3.554507, 0, 1, 1.5, 0.5, 0.5,
-4.041208, -3.554507, 0, 0, 1.5, 0.5, 0.5,
-4.041208, -3.554507, 2, 0, -0.5, 0.5, 0.5,
-4.041208, -3.554507, 2, 1, -0.5, 0.5, 0.5,
-4.041208, -3.554507, 2, 1, 1.5, 0.5, 0.5,
-4.041208, -3.554507, 2, 0, 1.5, 0.5, 0.5,
-4.041208, -3.554507, 4, 0, -0.5, 0.5, 0.5,
-4.041208, -3.554507, 4, 1, -0.5, 0.5, 0.5,
-4.041208, -3.554507, 4, 1, 1.5, 0.5, 0.5,
-4.041208, -3.554507, 4, 0, 1.5, 0.5, 0.5
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
-3.517202, -3.092483, -5.803738,
-3.517202, 3.067842, -5.803738,
-3.517202, -3.092483, 5.153747,
-3.517202, 3.067842, 5.153747,
-3.517202, -3.092483, -5.803738,
-3.517202, -3.092483, 5.153747,
-3.517202, 3.067842, -5.803738,
-3.517202, 3.067842, 5.153747,
-3.517202, -3.092483, -5.803738,
3.469537, -3.092483, -5.803738,
-3.517202, -3.092483, 5.153747,
3.469537, -3.092483, 5.153747,
-3.517202, 3.067842, -5.803738,
3.469537, 3.067842, -5.803738,
-3.517202, 3.067842, 5.153747,
3.469537, 3.067842, 5.153747,
3.469537, -3.092483, -5.803738,
3.469537, 3.067842, -5.803738,
3.469537, -3.092483, 5.153747,
3.469537, 3.067842, 5.153747,
3.469537, -3.092483, -5.803738,
3.469537, -3.092483, 5.153747,
3.469537, 3.067842, -5.803738,
3.469537, 3.067842, 5.153747
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
var radius = 7.679498;
var distance = 34.16695;
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
mvMatrix.translate( 0.02383256, 0.01232052, 0.3249953 );
mvMatrix.scale( 1.188426, 1.347855, 0.7577673 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16695);
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
Dimethoate<-read.table("Dimethoate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dimethoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dimethoate' not found
```

```r
y<-Dimethoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dimethoate' not found
```

```r
z<-Dimethoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dimethoate' not found
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
-3.415454, 0.5353034, -2.698084, 0, 0, 1, 1, 1,
-2.875952, -0.6254743, -3.252993, 1, 0, 0, 1, 1,
-2.842185, 0.2563487, -1.869649, 1, 0, 0, 1, 1,
-2.71212, -1.460915, -1.186839, 1, 0, 0, 1, 1,
-2.658495, -1.899027, -0.8645024, 1, 0, 0, 1, 1,
-2.468437, 0.236834, -2.063978, 1, 0, 0, 1, 1,
-2.450681, -0.7767735, -1.882391, 0, 0, 0, 1, 1,
-2.407752, 0.9129103, -1.460751, 0, 0, 0, 1, 1,
-2.397425, -0.7208949, -2.549565, 0, 0, 0, 1, 1,
-2.394739, 1.344943, 1.222407, 0, 0, 0, 1, 1,
-2.350095, -0.7620923, -1.053178, 0, 0, 0, 1, 1,
-2.31212, -0.3286673, -1.377895, 0, 0, 0, 1, 1,
-2.291712, -1.080188, -3.885943, 0, 0, 0, 1, 1,
-2.231751, -0.4447761, -3.518333, 1, 1, 1, 1, 1,
-2.216241, 0.2367443, -1.122945, 1, 1, 1, 1, 1,
-2.170695, 0.1709471, -0.7387904, 1, 1, 1, 1, 1,
-2.142038, 0.4594546, -2.311865, 1, 1, 1, 1, 1,
-2.135389, 0.4461853, -0.4169111, 1, 1, 1, 1, 1,
-2.087888, 0.563783, -2.269288, 1, 1, 1, 1, 1,
-2.084064, -1.757637, -1.160993, 1, 1, 1, 1, 1,
-2.082643, 0.08724508, -3.023038, 1, 1, 1, 1, 1,
-2.068723, -0.2015508, -0.5603492, 1, 1, 1, 1, 1,
-2.060906, 0.6003667, 0.5408172, 1, 1, 1, 1, 1,
-2.05245, 0.3137142, -1.077017, 1, 1, 1, 1, 1,
-2.031039, 0.7438072, 0.4630409, 1, 1, 1, 1, 1,
-2.030972, 1.608792, 1.125379, 1, 1, 1, 1, 1,
-1.984316, 0.3542796, -1.761707, 1, 1, 1, 1, 1,
-1.983058, 0.9510828, -0.04884185, 1, 1, 1, 1, 1,
-1.973874, -1.116931, -1.70168, 0, 0, 1, 1, 1,
-1.973841, -1.943839, -3.258921, 1, 0, 0, 1, 1,
-1.939768, -1.730501, -0.586572, 1, 0, 0, 1, 1,
-1.923746, -1.154043, -1.38694, 1, 0, 0, 1, 1,
-1.909157, -0.7505817, -1.290368, 1, 0, 0, 1, 1,
-1.889814, -0.4749582, -3.257185, 1, 0, 0, 1, 1,
-1.88829, 1.784104, -1.547548, 0, 0, 0, 1, 1,
-1.871917, 0.9882685, -1.350872, 0, 0, 0, 1, 1,
-1.871637, 1.5595, 0.9165069, 0, 0, 0, 1, 1,
-1.867954, -0.3073925, -1.644069, 0, 0, 0, 1, 1,
-1.859291, 1.133529, -2.23763, 0, 0, 0, 1, 1,
-1.847261, 1.836152, 2.39816, 0, 0, 0, 1, 1,
-1.839248, 0.7718959, -1.544927, 0, 0, 0, 1, 1,
-1.830848, 1.098911, -1.360675, 1, 1, 1, 1, 1,
-1.818792, -1.615592, -1.425014, 1, 1, 1, 1, 1,
-1.817366, -0.6281102, -1.539972, 1, 1, 1, 1, 1,
-1.809356, 0.3839986, -1.996445, 1, 1, 1, 1, 1,
-1.800538, 0.09463642, -2.322455, 1, 1, 1, 1, 1,
-1.799195, 0.2653897, -1.551456, 1, 1, 1, 1, 1,
-1.795414, -0.6350827, -0.9112718, 1, 1, 1, 1, 1,
-1.778521, 0.4446127, -1.551211, 1, 1, 1, 1, 1,
-1.777675, 2.3045, -0.02150316, 1, 1, 1, 1, 1,
-1.765514, -0.6668202, -3.835342, 1, 1, 1, 1, 1,
-1.762273, 1.947211, -1.698305, 1, 1, 1, 1, 1,
-1.76132, -1.304116, -0.8289365, 1, 1, 1, 1, 1,
-1.749837, -1.048235, -1.860656, 1, 1, 1, 1, 1,
-1.749372, 0.05709356, -2.249377, 1, 1, 1, 1, 1,
-1.746107, 0.4097767, -0.7380979, 1, 1, 1, 1, 1,
-1.730268, 0.06963205, -1.275549, 0, 0, 1, 1, 1,
-1.709447, 0.1113925, -2.628356, 1, 0, 0, 1, 1,
-1.690047, -0.6432696, -2.260725, 1, 0, 0, 1, 1,
-1.686599, -2.251162, -1.398573, 1, 0, 0, 1, 1,
-1.68373, -0.8718696, -1.204179, 1, 0, 0, 1, 1,
-1.680468, -0.5713116, -2.810176, 1, 0, 0, 1, 1,
-1.678359, -1.37531, -2.829134, 0, 0, 0, 1, 1,
-1.671682, -2.44496, -2.736972, 0, 0, 0, 1, 1,
-1.665033, -0.1006793, -1.39703, 0, 0, 0, 1, 1,
-1.635013, 0.4252006, -1.254532, 0, 0, 0, 1, 1,
-1.618824, -1.471622, -3.139197, 0, 0, 0, 1, 1,
-1.618293, -1.73488, -3.867875, 0, 0, 0, 1, 1,
-1.601128, -0.2289801, -1.193754, 0, 0, 0, 1, 1,
-1.598531, -0.388104, -1.860633, 1, 1, 1, 1, 1,
-1.590979, -0.4557418, -2.308211, 1, 1, 1, 1, 1,
-1.583084, 0.1460596, -0.745734, 1, 1, 1, 1, 1,
-1.561848, -1.087699, -0.04928453, 1, 1, 1, 1, 1,
-1.557719, 0.7316015, -1.201053, 1, 1, 1, 1, 1,
-1.551816, 1.530666, -3.212258, 1, 1, 1, 1, 1,
-1.543283, -0.6873209, -3.023113, 1, 1, 1, 1, 1,
-1.532855, 0.3394593, -0.2325946, 1, 1, 1, 1, 1,
-1.529747, -0.6238633, -0.9186928, 1, 1, 1, 1, 1,
-1.521768, 0.3266293, -1.498924, 1, 1, 1, 1, 1,
-1.519165, -0.4938773, -2.404206, 1, 1, 1, 1, 1,
-1.514663, -0.2965695, -1.928812, 1, 1, 1, 1, 1,
-1.513116, 0.6960301, -0.6314076, 1, 1, 1, 1, 1,
-1.513035, -0.7508991, -3.4826, 1, 1, 1, 1, 1,
-1.511719, -0.5045161, -1.581516, 1, 1, 1, 1, 1,
-1.506426, -1.213658, -1.912068, 0, 0, 1, 1, 1,
-1.500244, -0.7240195, -1.649852, 1, 0, 0, 1, 1,
-1.498003, 0.6373542, 1.007007, 1, 0, 0, 1, 1,
-1.496389, -0.6981562, -1.999437, 1, 0, 0, 1, 1,
-1.484936, -0.4888717, -1.27052, 1, 0, 0, 1, 1,
-1.477685, -2.063594, -3.544243, 1, 0, 0, 1, 1,
-1.463485, 1.033185, -2.442829, 0, 0, 0, 1, 1,
-1.463128, -0.5278655, -1.796031, 0, 0, 0, 1, 1,
-1.451406, -0.2746874, 0.4061359, 0, 0, 0, 1, 1,
-1.449154, 1.460309, -2.038169, 0, 0, 0, 1, 1,
-1.439639, -1.145226, -1.611566, 0, 0, 0, 1, 1,
-1.436565, -1.365979, -2.821778, 0, 0, 0, 1, 1,
-1.411455, 1.718748, -0.4742431, 0, 0, 0, 1, 1,
-1.403047, 0.4367973, 0.1131638, 1, 1, 1, 1, 1,
-1.381688, -0.6111786, -1.679928, 1, 1, 1, 1, 1,
-1.380908, -0.3329845, -2.013324, 1, 1, 1, 1, 1,
-1.365363, 1.193963, -1.586456, 1, 1, 1, 1, 1,
-1.315055, 1.165249, 0.1450808, 1, 1, 1, 1, 1,
-1.311166, -0.03739509, -1.517086, 1, 1, 1, 1, 1,
-1.306928, -2.20078, -3.693543, 1, 1, 1, 1, 1,
-1.303152, 0.9896117, -2.666055, 1, 1, 1, 1, 1,
-1.3013, -0.9440911, -3.186977, 1, 1, 1, 1, 1,
-1.298829, -1.564428, -3.192309, 1, 1, 1, 1, 1,
-1.298812, 0.2426507, -2.226866, 1, 1, 1, 1, 1,
-1.295461, 0.8863756, -0.7656175, 1, 1, 1, 1, 1,
-1.294758, 1.074773, -0.4585002, 1, 1, 1, 1, 1,
-1.286223, -0.8611799, -1.989681, 1, 1, 1, 1, 1,
-1.281054, 0.5581142, -0.3712495, 1, 1, 1, 1, 1,
-1.276514, -0.3366106, -1.264298, 0, 0, 1, 1, 1,
-1.274284, -1.620264, -2.109999, 1, 0, 0, 1, 1,
-1.26674, -1.623437, -3.926047, 1, 0, 0, 1, 1,
-1.256009, -1.459354, -2.264372, 1, 0, 0, 1, 1,
-1.25384, -0.5266309, -1.546016, 1, 0, 0, 1, 1,
-1.241924, -1.204073, -1.777823, 1, 0, 0, 1, 1,
-1.23142, -0.5434759, -1.380677, 0, 0, 0, 1, 1,
-1.22934, -1.079857, -1.06351, 0, 0, 0, 1, 1,
-1.218701, 0.891618, 0.2139877, 0, 0, 0, 1, 1,
-1.217426, 1.65106, -0.8973212, 0, 0, 0, 1, 1,
-1.212034, 1.426288, -0.7989907, 0, 0, 0, 1, 1,
-1.211943, 0.02246149, -2.152018, 0, 0, 0, 1, 1,
-1.207765, -0.6739686, -2.418251, 0, 0, 0, 1, 1,
-1.197694, -0.5324253, -1.76625, 1, 1, 1, 1, 1,
-1.197103, 0.4791512, -2.150239, 1, 1, 1, 1, 1,
-1.186504, 0.7813936, -1.106913, 1, 1, 1, 1, 1,
-1.185555, -2.16816, -3.245195, 1, 1, 1, 1, 1,
-1.185327, 0.7161031, -0.1137518, 1, 1, 1, 1, 1,
-1.161166, 1.161943, -1.40488, 1, 1, 1, 1, 1,
-1.150219, -1.003351, -2.146303, 1, 1, 1, 1, 1,
-1.142227, -0.0659419, -2.095781, 1, 1, 1, 1, 1,
-1.140208, 0.3512203, -1.664057, 1, 1, 1, 1, 1,
-1.139067, -0.3017859, -0.3960637, 1, 1, 1, 1, 1,
-1.128603, 1.079084, -1.847008, 1, 1, 1, 1, 1,
-1.128095, 0.2253433, -0.6181385, 1, 1, 1, 1, 1,
-1.121106, -0.3094773, -3.178914, 1, 1, 1, 1, 1,
-1.117891, -0.1684841, -2.439251, 1, 1, 1, 1, 1,
-1.116572, -0.9872824, -2.281072, 1, 1, 1, 1, 1,
-1.109547, 1.752236, -1.00573, 0, 0, 1, 1, 1,
-1.10579, -1.300188, -4.217221, 1, 0, 0, 1, 1,
-1.105176, -1.002669, -2.940942, 1, 0, 0, 1, 1,
-1.101565, -1.394576, -1.623357, 1, 0, 0, 1, 1,
-1.093444, -0.8291064, -3.383247, 1, 0, 0, 1, 1,
-1.080258, 0.04443902, -0.6499063, 1, 0, 0, 1, 1,
-1.072708, -0.7568291, 0.6835864, 0, 0, 0, 1, 1,
-1.069672, 1.52172, 0.6370969, 0, 0, 0, 1, 1,
-1.067978, -2.340408, -3.335646, 0, 0, 0, 1, 1,
-1.053747, -0.9330747, -2.067824, 0, 0, 0, 1, 1,
-1.053722, -1.683814, -2.738646, 0, 0, 0, 1, 1,
-1.050537, -0.236107, -1.065162, 0, 0, 0, 1, 1,
-1.043491, -0.7082084, -1.538222, 0, 0, 0, 1, 1,
-1.04237, 0.8056084, 0.65928, 1, 1, 1, 1, 1,
-1.041182, -1.134432, -2.140141, 1, 1, 1, 1, 1,
-1.006617, 0.4632795, -2.210969, 1, 1, 1, 1, 1,
-1.001459, 1.018413, -0.867388, 1, 1, 1, 1, 1,
-0.9998513, 2.254558, -0.7172904, 1, 1, 1, 1, 1,
-0.9990395, 0.5867864, -0.2467942, 1, 1, 1, 1, 1,
-0.9985346, -0.9337738, -3.045406, 1, 1, 1, 1, 1,
-0.9893807, 0.8761045, 0.9029391, 1, 1, 1, 1, 1,
-0.9874396, 0.1373136, -2.17757, 1, 1, 1, 1, 1,
-0.9796699, -0.6528259, -3.321201, 1, 1, 1, 1, 1,
-0.9787782, -0.7213674, -2.829896, 1, 1, 1, 1, 1,
-0.9764873, -0.4885776, -2.705019, 1, 1, 1, 1, 1,
-0.9750854, 0.2038405, -0.5768912, 1, 1, 1, 1, 1,
-0.9704115, 1.011789, -1.958404, 1, 1, 1, 1, 1,
-0.9695821, -1.281614, -2.513101, 1, 1, 1, 1, 1,
-0.9686903, 1.121752, -2.960426, 0, 0, 1, 1, 1,
-0.9654651, -0.2483712, -1.208217, 1, 0, 0, 1, 1,
-0.9643091, -0.1641978, 0.52673, 1, 0, 0, 1, 1,
-0.9635993, -0.8630522, -1.378945, 1, 0, 0, 1, 1,
-0.9611855, 1.543347, -0.6440523, 1, 0, 0, 1, 1,
-0.9561367, -0.9340098, -1.422656, 1, 0, 0, 1, 1,
-0.9555048, 0.5838848, -0.4332552, 0, 0, 0, 1, 1,
-0.9508812, -0.6521181, -2.797443, 0, 0, 0, 1, 1,
-0.934044, 0.3188685, 0.5821162, 0, 0, 0, 1, 1,
-0.9254385, 0.4440796, -0.6395994, 0, 0, 0, 1, 1,
-0.915392, -1.47433, -1.700859, 0, 0, 0, 1, 1,
-0.9128147, -0.3396326, -0.7501627, 0, 0, 0, 1, 1,
-0.9126739, -1.137696, -0.98063, 0, 0, 0, 1, 1,
-0.908065, 0.04605164, -1.638743, 1, 1, 1, 1, 1,
-0.9064661, -0.8260534, -0.7052343, 1, 1, 1, 1, 1,
-0.9019365, -0.4152506, -1.820062, 1, 1, 1, 1, 1,
-0.8914755, -0.2763175, -2.678845, 1, 1, 1, 1, 1,
-0.8898039, -1.193739, -2.239559, 1, 1, 1, 1, 1,
-0.8839157, -1.308261, -1.955528, 1, 1, 1, 1, 1,
-0.8837319, 0.6258694, -0.5972093, 1, 1, 1, 1, 1,
-0.8711162, -1.562174, -3.271638, 1, 1, 1, 1, 1,
-0.8694512, -0.2473566, -1.151982, 1, 1, 1, 1, 1,
-0.8633716, 0.5397055, -1.416474, 1, 1, 1, 1, 1,
-0.860977, -0.6356011, -3.383608, 1, 1, 1, 1, 1,
-0.8608607, -0.7707859, -2.120257, 1, 1, 1, 1, 1,
-0.8529063, 0.3701807, -3.879708, 1, 1, 1, 1, 1,
-0.8493724, -0.3818142, -3.272266, 1, 1, 1, 1, 1,
-0.8473629, 0.04416896, -3.121937, 1, 1, 1, 1, 1,
-0.8462499, -0.3470462, -4.131644, 0, 0, 1, 1, 1,
-0.8455542, -0.2151805, -2.178219, 1, 0, 0, 1, 1,
-0.8444233, 0.5783038, 0.1589634, 1, 0, 0, 1, 1,
-0.8430924, -0.593479, -1.138176, 1, 0, 0, 1, 1,
-0.8419659, 0.6034549, -0.01503203, 1, 0, 0, 1, 1,
-0.8406047, -0.6821361, -4.651424, 1, 0, 0, 1, 1,
-0.8321905, -0.04430958, -4.369575, 0, 0, 0, 1, 1,
-0.8240916, 1.010617, 0.05531801, 0, 0, 0, 1, 1,
-0.8226514, -0.9556947, -1.423525, 0, 0, 0, 1, 1,
-0.8220032, 0.7554111, -2.691278, 0, 0, 0, 1, 1,
-0.8199766, 0.3267733, -2.21896, 0, 0, 0, 1, 1,
-0.8194827, 1.506706, -2.429614, 0, 0, 0, 1, 1,
-0.8173865, -0.81126, -3.538973, 0, 0, 0, 1, 1,
-0.8127653, -1.795228, -2.751565, 1, 1, 1, 1, 1,
-0.8092155, 0.1809112, -1.550066, 1, 1, 1, 1, 1,
-0.8043498, -0.4485337, -1.038081, 1, 1, 1, 1, 1,
-0.7922249, -0.798229, -2.936825, 1, 1, 1, 1, 1,
-0.7917202, -0.2243246, -0.4060725, 1, 1, 1, 1, 1,
-0.7902421, 2.814438, -0.2800481, 1, 1, 1, 1, 1,
-0.7837521, -0.8529188, -1.803586, 1, 1, 1, 1, 1,
-0.7834856, -0.1611772, 0.5829599, 1, 1, 1, 1, 1,
-0.7826109, -0.3915793, -0.7624558, 1, 1, 1, 1, 1,
-0.7818137, 0.5962591, -0.5482326, 1, 1, 1, 1, 1,
-0.7773478, 0.5497872, -2.610494, 1, 1, 1, 1, 1,
-0.7762566, 1.064172, -0.6450239, 1, 1, 1, 1, 1,
-0.7727554, -1.203163, -4.163084, 1, 1, 1, 1, 1,
-0.7703557, 1.150926, 0.2100294, 1, 1, 1, 1, 1,
-0.7698321, -2.165834, -3.498994, 1, 1, 1, 1, 1,
-0.7672651, -0.6211259, -2.172405, 0, 0, 1, 1, 1,
-0.7621908, 1.014236, -0.4553841, 1, 0, 0, 1, 1,
-0.7542691, 0.7925614, -0.09995931, 1, 0, 0, 1, 1,
-0.7537025, 0.5354335, -2.172559, 1, 0, 0, 1, 1,
-0.751388, 0.6576903, -2.307768, 1, 0, 0, 1, 1,
-0.7496112, 1.780513, -1.282285, 1, 0, 0, 1, 1,
-0.7464288, -1.240733, -2.176235, 0, 0, 0, 1, 1,
-0.7462406, 1.682323, 1.728018, 0, 0, 0, 1, 1,
-0.7406276, -0.2761364, -0.8013105, 0, 0, 0, 1, 1,
-0.7400318, 0.4364219, -1.160174, 0, 0, 0, 1, 1,
-0.7347146, 0.371231, -1.172152, 0, 0, 0, 1, 1,
-0.7337705, -2.209538, -2.381816, 0, 0, 0, 1, 1,
-0.7323085, -0.4678631, -1.861867, 0, 0, 0, 1, 1,
-0.7313238, -1.705979, -1.704286, 1, 1, 1, 1, 1,
-0.7304101, 0.2054667, -2.001895, 1, 1, 1, 1, 1,
-0.7296647, 0.08872711, -3.798409, 1, 1, 1, 1, 1,
-0.7231261, 1.267581, -1.25714, 1, 1, 1, 1, 1,
-0.7222575, -0.188417, -1.454736, 1, 1, 1, 1, 1,
-0.720851, 0.3505759, -0.4894322, 1, 1, 1, 1, 1,
-0.7164895, -1.336668, -0.72086, 1, 1, 1, 1, 1,
-0.7093696, -0.183591, -1.857133, 1, 1, 1, 1, 1,
-0.7085559, -1.781225, -4.081678, 1, 1, 1, 1, 1,
-0.7043067, -1.152103, -2.468801, 1, 1, 1, 1, 1,
-0.7030233, 0.1235078, -0.439113, 1, 1, 1, 1, 1,
-0.6970528, -0.9227065, -2.235171, 1, 1, 1, 1, 1,
-0.6967351, 0.3942257, -1.682516, 1, 1, 1, 1, 1,
-0.6953793, 1.41269, 0.7628385, 1, 1, 1, 1, 1,
-0.695002, -0.4269392, -2.456148, 1, 1, 1, 1, 1,
-0.6942438, -0.680674, -2.383747, 0, 0, 1, 1, 1,
-0.6919138, -0.3260179, -3.574126, 1, 0, 0, 1, 1,
-0.6875064, -1.424182, -2.528339, 1, 0, 0, 1, 1,
-0.6739803, -1.289698, -3.745895, 1, 0, 0, 1, 1,
-0.6717886, 0.02232168, -2.899803, 1, 0, 0, 1, 1,
-0.6709947, 1.010655, -0.9907665, 1, 0, 0, 1, 1,
-0.6652412, 0.1828864, -0.02490932, 0, 0, 0, 1, 1,
-0.6612471, -0.4695573, -2.001827, 0, 0, 0, 1, 1,
-0.6610513, -1.251105, -1.907421, 0, 0, 0, 1, 1,
-0.6607664, -0.142814, -2.721518, 0, 0, 0, 1, 1,
-0.6503307, -0.9309473, -3.109877, 0, 0, 0, 1, 1,
-0.6490852, -0.6494284, -0.3704143, 0, 0, 0, 1, 1,
-0.6469509, -0.5124769, -2.703905, 0, 0, 0, 1, 1,
-0.6424391, -0.7764682, -2.428885, 1, 1, 1, 1, 1,
-0.633626, 1.166843, -0.0651888, 1, 1, 1, 1, 1,
-0.6216954, -1.635448, -1.751197, 1, 1, 1, 1, 1,
-0.6183058, -0.9184603, -1.531419, 1, 1, 1, 1, 1,
-0.6148298, 0.4159266, -1.196522, 1, 1, 1, 1, 1,
-0.612035, -2.164581, -3.489975, 1, 1, 1, 1, 1,
-0.6102895, -0.3444182, -1.233151, 1, 1, 1, 1, 1,
-0.6095428, 0.5378577, -2.765179, 1, 1, 1, 1, 1,
-0.6048287, -1.445312, -2.517698, 1, 1, 1, 1, 1,
-0.5978006, -0.04514317, -0.2860504, 1, 1, 1, 1, 1,
-0.5966226, -1.111418, -2.968787, 1, 1, 1, 1, 1,
-0.5958365, 1.089467, -0.2997979, 1, 1, 1, 1, 1,
-0.5890497, 0.1208709, -1.417134, 1, 1, 1, 1, 1,
-0.5865452, -1.775739, -1.61353, 1, 1, 1, 1, 1,
-0.5793549, 1.461176, -1.714758, 1, 1, 1, 1, 1,
-0.5722904, -0.7455142, -0.5215347, 0, 0, 1, 1, 1,
-0.5663975, -0.7281599, -3.627396, 1, 0, 0, 1, 1,
-0.5662104, -0.1042379, -1.072129, 1, 0, 0, 1, 1,
-0.5634362, -0.01607947, -0.647017, 1, 0, 0, 1, 1,
-0.5629391, 1.400012, 0.8553012, 1, 0, 0, 1, 1,
-0.5619792, -0.1166709, -0.9777997, 1, 0, 0, 1, 1,
-0.5590786, -0.1141138, -2.477803, 0, 0, 0, 1, 1,
-0.5574743, -0.1568266, -2.009995, 0, 0, 0, 1, 1,
-0.5545552, -1.762737, -3.361818, 0, 0, 0, 1, 1,
-0.5526899, -0.6039934, -0.8406021, 0, 0, 0, 1, 1,
-0.5524055, 2.131372, -0.3434839, 0, 0, 0, 1, 1,
-0.5472097, 1.339653, -0.6873933, 0, 0, 0, 1, 1,
-0.544367, 1.326766, 0.5473741, 0, 0, 0, 1, 1,
-0.5403314, 0.3185341, -3.558197, 1, 1, 1, 1, 1,
-0.5395447, -0.8170639, -4.56025, 1, 1, 1, 1, 1,
-0.5375475, 1.571761, 1.654616, 1, 1, 1, 1, 1,
-0.5312498, 0.4417073, -1.818325, 1, 1, 1, 1, 1,
-0.5268645, -1.379861, -2.952001, 1, 1, 1, 1, 1,
-0.5221122, -0.2001209, -3.782534, 1, 1, 1, 1, 1,
-0.5167394, 0.1821073, -1.458713, 1, 1, 1, 1, 1,
-0.5157734, -0.1445718, -2.582775, 1, 1, 1, 1, 1,
-0.5123017, -0.4607284, -2.498889, 1, 1, 1, 1, 1,
-0.5061722, -0.09106845, -2.352553, 1, 1, 1, 1, 1,
-0.5029466, 0.4110643, -0.3801695, 1, 1, 1, 1, 1,
-0.5028158, 1.671033, -0.5942146, 1, 1, 1, 1, 1,
-0.5024487, -1.373022, -2.484299, 1, 1, 1, 1, 1,
-0.5016519, 1.020803, -0.4991052, 1, 1, 1, 1, 1,
-0.5014694, -1.476048, -3.834573, 1, 1, 1, 1, 1,
-0.5007647, -0.3542501, -1.41613, 0, 0, 1, 1, 1,
-0.4979429, -0.07421628, -2.57914, 1, 0, 0, 1, 1,
-0.4955783, -1.002904, -3.075258, 1, 0, 0, 1, 1,
-0.4944133, 0.565338, -0.1004609, 1, 0, 0, 1, 1,
-0.4940298, 1.375186, 0.07724304, 1, 0, 0, 1, 1,
-0.4882072, 1.368567, 0.5778316, 1, 0, 0, 1, 1,
-0.4879285, 1.765812, -2.799302, 0, 0, 0, 1, 1,
-0.4835435, 0.5559304, 0.3118461, 0, 0, 0, 1, 1,
-0.4813867, -0.359048, -2.474452, 0, 0, 0, 1, 1,
-0.4742579, 0.5389711, -1.479465, 0, 0, 0, 1, 1,
-0.4742304, -1.06309, -3.597424, 0, 0, 0, 1, 1,
-0.4731832, -0.4182743, -3.512833, 0, 0, 0, 1, 1,
-0.4707697, -1.928761, -1.949391, 0, 0, 0, 1, 1,
-0.4687056, 0.9336659, 0.4967136, 1, 1, 1, 1, 1,
-0.4664219, -0.511984, -2.446642, 1, 1, 1, 1, 1,
-0.4643295, -0.9949704, -3.867506, 1, 1, 1, 1, 1,
-0.4583663, 0.5640993, -1.584612, 1, 1, 1, 1, 1,
-0.4565783, -0.6266803, -2.846171, 1, 1, 1, 1, 1,
-0.4513839, -0.8446473, -3.292732, 1, 1, 1, 1, 1,
-0.4489555, -0.6822725, -2.025851, 1, 1, 1, 1, 1,
-0.4472554, 1.753032, 2.699051, 1, 1, 1, 1, 1,
-0.4428598, 1.49901, -0.5582298, 1, 1, 1, 1, 1,
-0.4348612, -1.203912, -3.321692, 1, 1, 1, 1, 1,
-0.433421, 0.1545632, -1.431838, 1, 1, 1, 1, 1,
-0.4326186, -0.6216084, -3.825257, 1, 1, 1, 1, 1,
-0.4300064, -0.1174696, -3.55925, 1, 1, 1, 1, 1,
-0.4283273, -1.712101, -1.592581, 1, 1, 1, 1, 1,
-0.4276139, 0.2421763, -1.228046, 1, 1, 1, 1, 1,
-0.4263217, -0.172076, -1.447702, 0, 0, 1, 1, 1,
-0.4247033, -1.113084, -1.991119, 1, 0, 0, 1, 1,
-0.4228485, -0.03820112, -1.498966, 1, 0, 0, 1, 1,
-0.4227213, 0.2693778, -1.435501, 1, 0, 0, 1, 1,
-0.4170148, 0.9184644, -2.705899, 1, 0, 0, 1, 1,
-0.4166511, 1.296521, 0.8086733, 1, 0, 0, 1, 1,
-0.4164885, 0.09084543, -0.7770217, 0, 0, 0, 1, 1,
-0.4151996, -0.6345535, -0.1381836, 0, 0, 0, 1, 1,
-0.4149849, 0.4529382, 0.3004618, 0, 0, 0, 1, 1,
-0.4145127, -1.641099, -3.18401, 0, 0, 0, 1, 1,
-0.4144379, 1.834048, -0.4879451, 0, 0, 0, 1, 1,
-0.4138602, 0.301376, 0.3247597, 0, 0, 0, 1, 1,
-0.4098539, 0.4332661, -0.5202945, 0, 0, 0, 1, 1,
-0.4097728, -0.1778766, -2.008506, 1, 1, 1, 1, 1,
-0.4069915, -1.842683, -3.04219, 1, 1, 1, 1, 1,
-0.4039988, -2.488184, -2.276622, 1, 1, 1, 1, 1,
-0.4035367, -0.2932939, -0.9703882, 1, 1, 1, 1, 1,
-0.402257, -0.6651887, -1.115842, 1, 1, 1, 1, 1,
-0.3950303, -1.587, -1.860721, 1, 1, 1, 1, 1,
-0.3909348, -0.473036, -2.224423, 1, 1, 1, 1, 1,
-0.3876652, -1.704641, -1.875825, 1, 1, 1, 1, 1,
-0.3838132, 0.9198093, 0.556767, 1, 1, 1, 1, 1,
-0.383458, -1.628067, -1.935098, 1, 1, 1, 1, 1,
-0.3831107, 0.3988704, 0.09783077, 1, 1, 1, 1, 1,
-0.381119, 1.725975, -1.601336, 1, 1, 1, 1, 1,
-0.3788138, -0.4176287, -1.470847, 1, 1, 1, 1, 1,
-0.3780236, 0.1740365, -1.071329, 1, 1, 1, 1, 1,
-0.3634917, -0.3775751, -1.575751, 1, 1, 1, 1, 1,
-0.3631336, -1.061851, -1.810027, 0, 0, 1, 1, 1,
-0.3614593, 0.7126126, -0.4943382, 1, 0, 0, 1, 1,
-0.3599958, -0.6301704, -2.747886, 1, 0, 0, 1, 1,
-0.3584051, 0.749527, -0.1048574, 1, 0, 0, 1, 1,
-0.3579337, -0.02163654, -0.5443382, 1, 0, 0, 1, 1,
-0.3550613, -0.5339428, -3.891576, 1, 0, 0, 1, 1,
-0.3378554, 0.958315, 0.8778726, 0, 0, 0, 1, 1,
-0.3371164, -0.5031606, -3.697975, 0, 0, 0, 1, 1,
-0.3370729, -2.056172, -3.940863, 0, 0, 0, 1, 1,
-0.3369117, -0.3701482, -1.662884, 0, 0, 0, 1, 1,
-0.3350655, -0.2233962, -2.739434, 0, 0, 0, 1, 1,
-0.3345397, 0.2907384, -2.72242, 0, 0, 0, 1, 1,
-0.3336373, 1.445501, 0.1062099, 0, 0, 0, 1, 1,
-0.3333468, -0.5966914, -3.044323, 1, 1, 1, 1, 1,
-0.3315275, 0.919805, -0.5038112, 1, 1, 1, 1, 1,
-0.3309463, -0.6224603, -3.433656, 1, 1, 1, 1, 1,
-0.3247189, 0.8216963, 0.5409516, 1, 1, 1, 1, 1,
-0.3245471, -1.774775, -2.57667, 1, 1, 1, 1, 1,
-0.3217688, 1.928528, -1.844181, 1, 1, 1, 1, 1,
-0.319914, -1.431623, -2.876734, 1, 1, 1, 1, 1,
-0.3192348, 0.1488119, -1.495159, 1, 1, 1, 1, 1,
-0.3182017, 0.2293771, -1.553634, 1, 1, 1, 1, 1,
-0.3157049, -1.227685, -2.34475, 1, 1, 1, 1, 1,
-0.3149112, 1.18513, -0.9525717, 1, 1, 1, 1, 1,
-0.3138968, -0.17741, -1.774761, 1, 1, 1, 1, 1,
-0.3056322, -1.142965, -2.351645, 1, 1, 1, 1, 1,
-0.3049408, 1.290944, -0.6131586, 1, 1, 1, 1, 1,
-0.3024617, 1.013737, -0.1101423, 1, 1, 1, 1, 1,
-0.2985054, -0.9460104, -2.950739, 0, 0, 1, 1, 1,
-0.2932797, -0.5247309, -2.954756, 1, 0, 0, 1, 1,
-0.2885117, 0.8729958, 0.6680015, 1, 0, 0, 1, 1,
-0.2875468, -0.6045925, -3.521425, 1, 0, 0, 1, 1,
-0.2863426, 1.574942, -0.6459647, 1, 0, 0, 1, 1,
-0.2844049, 0.722075, -1.01649, 1, 0, 0, 1, 1,
-0.2841077, 0.1266642, -1.32389, 0, 0, 0, 1, 1,
-0.2832089, -0.1875763, -0.8051916, 0, 0, 0, 1, 1,
-0.279033, -0.02267409, -1.781059, 0, 0, 0, 1, 1,
-0.2783154, -1.061396, -3.22511, 0, 0, 0, 1, 1,
-0.2782979, -1.108721, -2.270543, 0, 0, 0, 1, 1,
-0.2775999, 0.3997243, -0.6194093, 0, 0, 0, 1, 1,
-0.2774277, 0.9236289, -0.6390261, 0, 0, 0, 1, 1,
-0.2771013, -0.1708842, -1.235689, 1, 1, 1, 1, 1,
-0.2733518, 2.109138, 1.139348, 1, 1, 1, 1, 1,
-0.2692453, 0.2445257, -2.413851, 1, 1, 1, 1, 1,
-0.2691391, -0.6881914, -4.208741, 1, 1, 1, 1, 1,
-0.2681194, 0.4391139, -0.6304396, 1, 1, 1, 1, 1,
-0.2631377, -0.1306969, -3.045339, 1, 1, 1, 1, 1,
-0.2620591, 1.12837, 0.5871351, 1, 1, 1, 1, 1,
-0.2607366, -0.8117378, -2.093543, 1, 1, 1, 1, 1,
-0.2603668, 0.2084907, 0.464056, 1, 1, 1, 1, 1,
-0.2556969, -0.8389658, -2.80514, 1, 1, 1, 1, 1,
-0.2524183, 0.2925452, -1.280753, 1, 1, 1, 1, 1,
-0.2500406, -0.6104155, -2.51868, 1, 1, 1, 1, 1,
-0.2432816, 0.3747815, 0.7065057, 1, 1, 1, 1, 1,
-0.2428719, -0.4552863, -1.137428, 1, 1, 1, 1, 1,
-0.2407039, -1.266109, -2.490117, 1, 1, 1, 1, 1,
-0.2403069, -1.421193, -3.264891, 0, 0, 1, 1, 1,
-0.2363163, -0.1816668, -3.00246, 1, 0, 0, 1, 1,
-0.2354238, 0.535702, 0.4283691, 1, 0, 0, 1, 1,
-0.2266565, 0.04034605, -0.5629292, 1, 0, 0, 1, 1,
-0.2220603, 0.4652297, -0.2436717, 1, 0, 0, 1, 1,
-0.2176243, 0.5050247, -1.494848, 1, 0, 0, 1, 1,
-0.2154002, 1.707283, -1.700623, 0, 0, 0, 1, 1,
-0.2139647, -0.9074496, -3.604928, 0, 0, 0, 1, 1,
-0.2097481, -0.4898484, -1.646502, 0, 0, 0, 1, 1,
-0.2083534, -2.044953, -2.472838, 0, 0, 0, 1, 1,
-0.2075655, 0.3874322, -1.312854, 0, 0, 0, 1, 1,
-0.2066643, 0.1702537, -0.5270516, 0, 0, 0, 1, 1,
-0.2060459, -0.0352181, -0.79389, 0, 0, 0, 1, 1,
-0.2058865, -0.9675115, -2.137993, 1, 1, 1, 1, 1,
-0.2050872, -0.8840486, -2.557627, 1, 1, 1, 1, 1,
-0.2020249, -1.692337, -2.615927, 1, 1, 1, 1, 1,
-0.2014206, 0.5404926, -1.086232, 1, 1, 1, 1, 1,
-0.2000694, -1.630569, -2.787397, 1, 1, 1, 1, 1,
-0.1969815, -0.8592153, -2.510989, 1, 1, 1, 1, 1,
-0.1945344, -0.4660503, -3.458124, 1, 1, 1, 1, 1,
-0.1945134, 0.1221693, -1.070524, 1, 1, 1, 1, 1,
-0.1921341, -1.177185, -3.593701, 1, 1, 1, 1, 1,
-0.1887967, 0.4452237, 0.003547551, 1, 1, 1, 1, 1,
-0.1887894, -1.950919, -0.7523655, 1, 1, 1, 1, 1,
-0.1876348, 0.4417424, 1.145582, 1, 1, 1, 1, 1,
-0.1874905, 0.7701759, -0.2836646, 1, 1, 1, 1, 1,
-0.1866816, -1.551724, -3.414174, 1, 1, 1, 1, 1,
-0.1863638, 0.1244713, -0.8604733, 1, 1, 1, 1, 1,
-0.1854174, 0.02838759, -0.9001294, 0, 0, 1, 1, 1,
-0.1853884, 0.7672233, -0.6092479, 1, 0, 0, 1, 1,
-0.1819568, -1.25376, -2.467993, 1, 0, 0, 1, 1,
-0.1701097, -1.272483, -4.121652, 1, 0, 0, 1, 1,
-0.1668746, 0.2061097, -0.3932302, 1, 0, 0, 1, 1,
-0.1667845, -1.095553, -2.983626, 1, 0, 0, 1, 1,
-0.1627067, 0.9613899, -0.5339175, 0, 0, 0, 1, 1,
-0.157498, -1.009462, -4.608852, 0, 0, 0, 1, 1,
-0.1534422, -0.2512042, -3.187581, 0, 0, 0, 1, 1,
-0.1494304, 1.246027, 0.6009622, 0, 0, 0, 1, 1,
-0.1485702, -0.541351, -2.679919, 0, 0, 0, 1, 1,
-0.1446963, 1.153214, -0.7539992, 0, 0, 0, 1, 1,
-0.1427873, -1.200013, -1.789727, 0, 0, 0, 1, 1,
-0.1367742, -0.2560401, -4.799901, 1, 1, 1, 1, 1,
-0.1349322, -0.3020476, -2.920307, 1, 1, 1, 1, 1,
-0.1299843, -1.762454, -2.88521, 1, 1, 1, 1, 1,
-0.1253148, 0.2144094, -0.6515102, 1, 1, 1, 1, 1,
-0.1189859, -1.675791, -2.828298, 1, 1, 1, 1, 1,
-0.1161831, -1.789239, -3.673455, 1, 1, 1, 1, 1,
-0.109583, -0.8123673, -2.794933, 1, 1, 1, 1, 1,
-0.108164, 0.9155964, -1.440618, 1, 1, 1, 1, 1,
-0.1081558, -0.3061964, -3.635568, 1, 1, 1, 1, 1,
-0.1077514, 0.2191682, -0.6338598, 1, 1, 1, 1, 1,
-0.105221, 0.4777305, -1.113417, 1, 1, 1, 1, 1,
-0.1048296, 0.5451176, 0.8476124, 1, 1, 1, 1, 1,
-0.1015388, -0.7756876, -2.334418, 1, 1, 1, 1, 1,
-0.1001534, 0.989835, -0.2934633, 1, 1, 1, 1, 1,
-0.09928293, 0.4393713, 0.590876, 1, 1, 1, 1, 1,
-0.09348845, 0.08001203, -0.6804588, 0, 0, 1, 1, 1,
-0.09163143, 0.1224843, 0.5796726, 1, 0, 0, 1, 1,
-0.09138174, 2.925163, 1.219134, 1, 0, 0, 1, 1,
-0.09115012, 0.8453959, -0.2708115, 1, 0, 0, 1, 1,
-0.08896039, -0.5519817, -2.436712, 1, 0, 0, 1, 1,
-0.08832487, 1.917851, -0.09610236, 1, 0, 0, 1, 1,
-0.08813242, -0.1952963, -3.502984, 0, 0, 0, 1, 1,
-0.08759753, 0.7100117, 0.1171331, 0, 0, 0, 1, 1,
-0.08372526, -0.4277411, -2.843692, 0, 0, 0, 1, 1,
-0.08208304, 0.218497, -0.4308044, 0, 0, 0, 1, 1,
-0.07790339, -1.461405, -2.542538, 0, 0, 0, 1, 1,
-0.06680951, 1.542912, 1.327221, 0, 0, 0, 1, 1,
-0.06327002, -2.052867, -5.12793, 0, 0, 0, 1, 1,
-0.0613051, 0.1520631, -0.6813207, 1, 1, 1, 1, 1,
-0.05766096, 1.743729, -0.7097185, 1, 1, 1, 1, 1,
-0.05287685, -0.3397152, -4.180659, 1, 1, 1, 1, 1,
-0.05011884, -2.634255, -3.764118, 1, 1, 1, 1, 1,
-0.04515761, 1.265919, -0.3328164, 1, 1, 1, 1, 1,
-0.04300857, 0.3853879, -0.6095108, 1, 1, 1, 1, 1,
-0.0378023, 1.783373, 0.9509, 1, 1, 1, 1, 1,
-0.03708735, -0.3773304, -4.679133, 1, 1, 1, 1, 1,
-0.03179022, -0.03644211, -5.644163, 1, 1, 1, 1, 1,
-0.02726577, 0.5022693, 1.368166, 1, 1, 1, 1, 1,
-0.02539178, -0.4560867, -2.185139, 1, 1, 1, 1, 1,
-0.02467508, -1.245322, -1.380688, 1, 1, 1, 1, 1,
-0.02430307, -0.7507567, -3.870425, 1, 1, 1, 1, 1,
-0.02234607, 0.6458492, 1.578874, 1, 1, 1, 1, 1,
-0.0212073, -1.654069, -2.418937, 1, 1, 1, 1, 1,
-0.01657423, -1.220221, -1.530292, 0, 0, 1, 1, 1,
-0.01577397, -0.7558664, -2.372835, 1, 0, 0, 1, 1,
-0.0102938, -0.1479419, -3.589446, 1, 0, 0, 1, 1,
-0.008757813, 0.8272047, 0.67955, 1, 0, 0, 1, 1,
-0.008111862, 0.9896119, -0.4674472, 1, 0, 0, 1, 1,
-0.004496865, 0.2270285, -0.5295869, 1, 0, 0, 1, 1,
-0.004029718, -0.7412941, -2.092952, 0, 0, 0, 1, 1,
-0.003897983, -1.917371, -2.517842, 0, 0, 0, 1, 1,
0.002432591, -0.15231, 2.670325, 0, 0, 0, 1, 1,
0.003154085, 0.7627338, -1.141006, 0, 0, 0, 1, 1,
0.003412394, -2.849951, 2.741464, 0, 0, 0, 1, 1,
0.003732336, 0.005714142, 0.6937438, 0, 0, 0, 1, 1,
0.004541783, 0.3782951, -0.6825471, 0, 0, 0, 1, 1,
0.004586628, 0.7648726, 0.4931221, 1, 1, 1, 1, 1,
0.00632262, 0.09134091, 1.509362, 1, 1, 1, 1, 1,
0.0099274, 0.1876144, -0.4800278, 1, 1, 1, 1, 1,
0.0103913, 0.7943571, 0.3218336, 1, 1, 1, 1, 1,
0.01293373, 0.3062524, -0.7334598, 1, 1, 1, 1, 1,
0.01415317, 1.450193, -1.716826, 1, 1, 1, 1, 1,
0.01574671, 0.2639683, 0.522926, 1, 1, 1, 1, 1,
0.01827745, 0.7111777, -0.6750285, 1, 1, 1, 1, 1,
0.020528, 1.666432, 0.4758199, 1, 1, 1, 1, 1,
0.02762223, 0.3989579, -0.6883694, 1, 1, 1, 1, 1,
0.03073486, 1.677353, -0.4304166, 1, 1, 1, 1, 1,
0.03103302, 1.141193, -0.9768173, 1, 1, 1, 1, 1,
0.0341727, -0.4604606, 1.794744, 1, 1, 1, 1, 1,
0.03561516, -0.6488705, 4.246753, 1, 1, 1, 1, 1,
0.03642583, 1.278314, -1.506451, 1, 1, 1, 1, 1,
0.04499115, 0.110162, -0.06015604, 0, 0, 1, 1, 1,
0.05202575, 1.105859, 0.2151484, 1, 0, 0, 1, 1,
0.05673749, 0.574581, 0.3489026, 1, 0, 0, 1, 1,
0.05790062, 1.096444, -0.0555597, 1, 0, 0, 1, 1,
0.05843714, -1.487258, 4.129789, 1, 0, 0, 1, 1,
0.05958974, -1.431033, 2.333112, 1, 0, 0, 1, 1,
0.06043444, -1.509262, 4.272955, 0, 0, 0, 1, 1,
0.06050577, -1.540405, 4.242629, 0, 0, 0, 1, 1,
0.06443454, 1.169779, 1.633593, 0, 0, 0, 1, 1,
0.06481152, -0.518548, 1.509899, 0, 0, 0, 1, 1,
0.06732164, 0.1331882, -0.04932638, 0, 0, 0, 1, 1,
0.07344934, -0.9144713, 1.4222, 0, 0, 0, 1, 1,
0.07633512, 1.074678, -0.5749422, 0, 0, 0, 1, 1,
0.07637909, 0.481649, -0.80252, 1, 1, 1, 1, 1,
0.07922865, 0.8417409, -1.380539, 1, 1, 1, 1, 1,
0.08205357, 0.6288679, -1.042908, 1, 1, 1, 1, 1,
0.08273152, 0.7890633, 1.126927, 1, 1, 1, 1, 1,
0.08423999, 0.3264632, 0.1796598, 1, 1, 1, 1, 1,
0.08833639, -0.4952594, 4.864238, 1, 1, 1, 1, 1,
0.09282139, 0.3732424, -0.3285787, 1, 1, 1, 1, 1,
0.09333804, -0.4453438, 2.019519, 1, 1, 1, 1, 1,
0.09484096, -0.6260129, 3.637053, 1, 1, 1, 1, 1,
0.0958545, -0.8736879, 2.209601, 1, 1, 1, 1, 1,
0.09643284, -0.743203, 1.27728, 1, 1, 1, 1, 1,
0.09839406, -1.246812, 4.466382, 1, 1, 1, 1, 1,
0.0989031, 0.8149448, 0.8089944, 1, 1, 1, 1, 1,
0.1015533, 2.084764, 0.8428174, 1, 1, 1, 1, 1,
0.1041441, 0.8166937, -0.699204, 1, 1, 1, 1, 1,
0.1085132, 0.6800711, -0.5029654, 0, 0, 1, 1, 1,
0.1087954, 2.213725, 0.6833161, 1, 0, 0, 1, 1,
0.1104138, 1.924865, -1.617548, 1, 0, 0, 1, 1,
0.1136037, -0.005736076, 1.446111, 1, 0, 0, 1, 1,
0.1211992, -0.4073005, 3.273427, 1, 0, 0, 1, 1,
0.1238185, -0.6209402, 1.619612, 1, 0, 0, 1, 1,
0.1239318, 0.9877963, 0.2218667, 0, 0, 0, 1, 1,
0.1249452, 0.5162381, -0.229476, 0, 0, 0, 1, 1,
0.1260053, 1.198143, -0.8323928, 0, 0, 0, 1, 1,
0.1287563, -0.5040857, 2.343427, 0, 0, 0, 1, 1,
0.1292052, -1.094774, 2.938131, 0, 0, 0, 1, 1,
0.1315087, -1.52449, 4.8385, 0, 0, 0, 1, 1,
0.1348201, 1.252474, 1.193842, 0, 0, 0, 1, 1,
0.1355701, 0.03872574, 0.5374504, 1, 1, 1, 1, 1,
0.1366179, 0.1969979, 1.832696, 1, 1, 1, 1, 1,
0.1390785, -0.5365754, 2.780643, 1, 1, 1, 1, 1,
0.1398712, -0.869924, 2.994682, 1, 1, 1, 1, 1,
0.1422833, -0.6439128, 3.10304, 1, 1, 1, 1, 1,
0.1445934, 1.27212, -0.3082143, 1, 1, 1, 1, 1,
0.1449715, -1.294475, 3.361775, 1, 1, 1, 1, 1,
0.1501959, -1.958968, 3.389959, 1, 1, 1, 1, 1,
0.1503299, 0.2283727, 0.07498268, 1, 1, 1, 1, 1,
0.1520858, -0.3396805, 2.931613, 1, 1, 1, 1, 1,
0.1559929, 1.947417, -0.6661432, 1, 1, 1, 1, 1,
0.1573147, -0.7969462, 1.991225, 1, 1, 1, 1, 1,
0.1656753, 0.9383419, -0.0340835, 1, 1, 1, 1, 1,
0.1762609, -1.574748, 2.949318, 1, 1, 1, 1, 1,
0.1775974, -2.458969, 4.043441, 1, 1, 1, 1, 1,
0.1833294, -1.134331, 0.7335176, 0, 0, 1, 1, 1,
0.1842796, 0.2518713, -0.2993481, 1, 0, 0, 1, 1,
0.1848606, -0.5670304, 2.201637, 1, 0, 0, 1, 1,
0.1874701, -0.4130817, 3.114207, 1, 0, 0, 1, 1,
0.1912126, 0.1468617, 0.2590561, 1, 0, 0, 1, 1,
0.1913645, 0.6985324, 0.2509972, 1, 0, 0, 1, 1,
0.1936062, 0.06433418, 1.443309, 0, 0, 0, 1, 1,
0.1936779, -0.04054417, 3.313427, 0, 0, 0, 1, 1,
0.1955727, -0.6108798, 2.879169, 0, 0, 0, 1, 1,
0.1970151, -0.8483388, 2.234861, 0, 0, 0, 1, 1,
0.2003242, -0.1077215, 0.7382032, 0, 0, 0, 1, 1,
0.2043333, -0.1409656, 2.5125, 0, 0, 0, 1, 1,
0.2132425, -0.8355592, 4.491285, 0, 0, 0, 1, 1,
0.2137059, 0.1351887, 2.194884, 1, 1, 1, 1, 1,
0.2166776, 1.716342, 0.8137022, 1, 1, 1, 1, 1,
0.2180689, 0.04140503, 1.712039, 1, 1, 1, 1, 1,
0.2186717, -2.942359, 1.747817, 1, 1, 1, 1, 1,
0.2191174, -0.6393763, 3.941541, 1, 1, 1, 1, 1,
0.2193438, -1.173622, 2.448683, 1, 1, 1, 1, 1,
0.2206489, 1.646019, -0.1921165, 1, 1, 1, 1, 1,
0.2271211, -0.761921, 1.963328, 1, 1, 1, 1, 1,
0.2339423, -0.3966008, 3.10723, 1, 1, 1, 1, 1,
0.2363836, 1.400755, -0.2782685, 1, 1, 1, 1, 1,
0.2368762, -0.3499238, 1.118514, 1, 1, 1, 1, 1,
0.2371479, 0.6135212, -1.470534, 1, 1, 1, 1, 1,
0.2415649, 0.750137, 1.517724, 1, 1, 1, 1, 1,
0.243131, -0.9530585, 3.756718, 1, 1, 1, 1, 1,
0.244325, 0.6943626, 0.1385915, 1, 1, 1, 1, 1,
0.2443298, 0.9901516, 0.8199852, 0, 0, 1, 1, 1,
0.2484465, 1.933946, 0.349214, 1, 0, 0, 1, 1,
0.2512292, 1.698551, 1.621817, 1, 0, 0, 1, 1,
0.2596388, 2.562439, 1.074143, 1, 0, 0, 1, 1,
0.2606629, 0.4753134, 0.226057, 1, 0, 0, 1, 1,
0.2696071, 1.86443, -0.9889786, 1, 0, 0, 1, 1,
0.2922009, 0.6510829, 0.200498, 0, 0, 0, 1, 1,
0.2980368, -1.027479, 3.491346, 0, 0, 0, 1, 1,
0.3012494, -0.0147034, 0.03326757, 0, 0, 0, 1, 1,
0.3077166, -2.663306, 3.725964, 0, 0, 0, 1, 1,
0.310284, 0.05166734, 1.437724, 0, 0, 0, 1, 1,
0.3131223, 0.8540177, 1.551703, 0, 0, 0, 1, 1,
0.3242148, 0.8012707, -0.8372265, 0, 0, 0, 1, 1,
0.3249029, 0.05057264, 2.237765, 1, 1, 1, 1, 1,
0.3250615, 0.5522688, 0.2564389, 1, 1, 1, 1, 1,
0.3265767, 0.192234, 0.7722701, 1, 1, 1, 1, 1,
0.3285079, -0.3459008, 1.638322, 1, 1, 1, 1, 1,
0.3288982, -1.013353, 2.829116, 1, 1, 1, 1, 1,
0.329341, 0.6870915, 0.1573622, 1, 1, 1, 1, 1,
0.3337884, 1.06642, 1.557437, 1, 1, 1, 1, 1,
0.3351247, 0.3646053, -0.8342327, 1, 1, 1, 1, 1,
0.337062, -0.7676972, 3.797298, 1, 1, 1, 1, 1,
0.3383141, 1.464753, -1.980999, 1, 1, 1, 1, 1,
0.3443336, -0.5921912, 0.500855, 1, 1, 1, 1, 1,
0.3514762, -1.481716, 2.976668, 1, 1, 1, 1, 1,
0.3572597, 0.1644606, 0.9150757, 1, 1, 1, 1, 1,
0.3580511, 1.000051, 0.7220654, 1, 1, 1, 1, 1,
0.3682674, 1.220793, 1.332361, 1, 1, 1, 1, 1,
0.3741581, -1.405642, 1.625071, 0, 0, 1, 1, 1,
0.3745719, -1.570071, 1.191988, 1, 0, 0, 1, 1,
0.3799789, 1.166602, -0.4320759, 1, 0, 0, 1, 1,
0.383694, 2.978128, -2.516223, 1, 0, 0, 1, 1,
0.3908535, -0.2978097, 1.804036, 1, 0, 0, 1, 1,
0.3908546, -0.1165042, 1.561565, 1, 0, 0, 1, 1,
0.3914604, -0.4456947, 1.397073, 0, 0, 0, 1, 1,
0.3990265, -0.5383875, 1.794715, 0, 0, 0, 1, 1,
0.4006673, -1.237057, 3.088416, 0, 0, 0, 1, 1,
0.4036739, -0.3863939, 1.574736, 0, 0, 0, 1, 1,
0.408858, 2.259884, -0.6686882, 0, 0, 0, 1, 1,
0.4107508, 0.423011, 0.3809167, 0, 0, 0, 1, 1,
0.4135501, 2.887214, -0.300252, 0, 0, 0, 1, 1,
0.4139745, 0.8248712, -1.26392, 1, 1, 1, 1, 1,
0.4154558, 1.559677, 0.3060681, 1, 1, 1, 1, 1,
0.4167094, -0.5537456, 2.861093, 1, 1, 1, 1, 1,
0.4167717, 0.02503354, 1.483477, 1, 1, 1, 1, 1,
0.4173279, -1.367322, 2.048897, 1, 1, 1, 1, 1,
0.4222812, 0.3731001, 2.234062, 1, 1, 1, 1, 1,
0.4251121, -0.0248868, 1.582291, 1, 1, 1, 1, 1,
0.4275073, -0.8273433, 3.782864, 1, 1, 1, 1, 1,
0.4283343, -1.840618, 2.204259, 1, 1, 1, 1, 1,
0.4286459, -0.2465351, 3.088155, 1, 1, 1, 1, 1,
0.4301358, -0.8940219, 1.306079, 1, 1, 1, 1, 1,
0.4313693, 0.1711034, 0.7706202, 1, 1, 1, 1, 1,
0.4325945, -0.7382745, 1.011792, 1, 1, 1, 1, 1,
0.4335345, 2.203745, 1.293302, 1, 1, 1, 1, 1,
0.4346915, 0.07829724, 0.4136894, 1, 1, 1, 1, 1,
0.4352523, -0.119068, 2.15492, 0, 0, 1, 1, 1,
0.4359123, 0.305455, -0.6557788, 1, 0, 0, 1, 1,
0.4376648, 0.2938255, -0.5229785, 1, 0, 0, 1, 1,
0.4436672, 0.5649928, 0.2987767, 1, 0, 0, 1, 1,
0.4498191, 0.1806344, 1.578147, 1, 0, 0, 1, 1,
0.4569092, -1.312391, 4.010253, 1, 0, 0, 1, 1,
0.457624, -1.453845, 2.768288, 0, 0, 0, 1, 1,
0.4612197, 0.6376701, 0.2366868, 0, 0, 0, 1, 1,
0.4670601, -0.9660958, 4.372441, 0, 0, 0, 1, 1,
0.468378, -0.2398479, 2.125477, 0, 0, 0, 1, 1,
0.4690555, 0.3011145, 0.5963715, 0, 0, 0, 1, 1,
0.4875095, 0.2209794, 2.4119, 0, 0, 0, 1, 1,
0.4880743, 0.9586428, 0.1160894, 0, 0, 0, 1, 1,
0.4894355, -1.744136, 4.994172, 1, 1, 1, 1, 1,
0.4906859, -0.9622495, 4.470051, 1, 1, 1, 1, 1,
0.4918369, -0.5907592, 3.73242, 1, 1, 1, 1, 1,
0.493122, -1.979338, 3.346047, 1, 1, 1, 1, 1,
0.4940059, -0.06555122, 1.227561, 1, 1, 1, 1, 1,
0.4946041, -0.5463603, 1.50903, 1, 1, 1, 1, 1,
0.496046, 1.362958, -0.02023001, 1, 1, 1, 1, 1,
0.4963425, -0.3793804, 2.202409, 1, 1, 1, 1, 1,
0.4981287, 1.832944, 0.1297312, 1, 1, 1, 1, 1,
0.4988315, 0.585532, -0.3779011, 1, 1, 1, 1, 1,
0.5034479, -0.6425797, 3.834047, 1, 1, 1, 1, 1,
0.5051959, -2.015253, 3.557159, 1, 1, 1, 1, 1,
0.5077081, 0.2785318, 2.169312, 1, 1, 1, 1, 1,
0.5079639, 0.692541, 1.158726, 1, 1, 1, 1, 1,
0.5093697, -0.9794156, 1.170094, 1, 1, 1, 1, 1,
0.5099509, 1.8151, 0.8122621, 0, 0, 1, 1, 1,
0.5164147, -0.9332352, 3.062929, 1, 0, 0, 1, 1,
0.5195601, 0.516624, -0.04714336, 1, 0, 0, 1, 1,
0.5197772, -0.6466296, 3.535912, 1, 0, 0, 1, 1,
0.5219338, 0.6843182, -1.141058, 1, 0, 0, 1, 1,
0.5277959, 0.09882358, 2.457661, 1, 0, 0, 1, 1,
0.5292424, -0.2262588, 1.725768, 0, 0, 0, 1, 1,
0.5376025, 0.9589313, -0.03202391, 0, 0, 0, 1, 1,
0.5409537, -0.4578526, 2.005732, 0, 0, 0, 1, 1,
0.5430065, 0.3460373, 2.458395, 0, 0, 0, 1, 1,
0.5444515, -1.479249, 2.76462, 0, 0, 0, 1, 1,
0.5465267, 0.9254147, -0.6063832, 0, 0, 0, 1, 1,
0.5474898, 1.035823, 2.936212, 0, 0, 0, 1, 1,
0.5508839, 1.290362, 1.617174, 1, 1, 1, 1, 1,
0.5517795, -2.01121, 3.190223, 1, 1, 1, 1, 1,
0.5521751, -2.08937, 1.032105, 1, 1, 1, 1, 1,
0.5539529, 0.2882024, -0.6721437, 1, 1, 1, 1, 1,
0.5547748, 1.983535, 0.8158838, 1, 1, 1, 1, 1,
0.5605839, 0.8686001, -0.4201427, 1, 1, 1, 1, 1,
0.5610573, -0.03431112, 1.851403, 1, 1, 1, 1, 1,
0.5631179, -1.150686, 2.109918, 1, 1, 1, 1, 1,
0.5647576, -0.6829297, 3.969317, 1, 1, 1, 1, 1,
0.5655174, -0.8487913, 3.35264, 1, 1, 1, 1, 1,
0.5671204, 0.1353822, 0.8578961, 1, 1, 1, 1, 1,
0.5741885, 0.5931482, -0.6896684, 1, 1, 1, 1, 1,
0.576285, 0.4516066, 1.990616, 1, 1, 1, 1, 1,
0.5766211, 0.6178744, -0.1104953, 1, 1, 1, 1, 1,
0.5774186, -0.3310621, 3.245209, 1, 1, 1, 1, 1,
0.5830436, -0.4170289, 2.545582, 0, 0, 1, 1, 1,
0.5903907, -1.382861, 1.697525, 1, 0, 0, 1, 1,
0.5923979, -0.6397802, 1.990083, 1, 0, 0, 1, 1,
0.5927908, -0.7526426, 2.570965, 1, 0, 0, 1, 1,
0.6003608, 2.192678, -0.4916697, 1, 0, 0, 1, 1,
0.6008003, -0.624506, 2.236542, 1, 0, 0, 1, 1,
0.6056484, -0.06413342, 2.527262, 0, 0, 0, 1, 1,
0.6075249, -0.4227253, 0.3268631, 0, 0, 0, 1, 1,
0.6081677, -0.04013446, 1.432187, 0, 0, 0, 1, 1,
0.6087669, 1.06836, 0.2887431, 0, 0, 0, 1, 1,
0.6132514, -1.252829, 3.232096, 0, 0, 0, 1, 1,
0.614463, 0.7602514, 1.358299, 0, 0, 0, 1, 1,
0.6153411, 0.3137089, -0.03784068, 0, 0, 0, 1, 1,
0.6230413, 0.3384706, 0.8791647, 1, 1, 1, 1, 1,
0.6245067, 0.2510145, 0.4483308, 1, 1, 1, 1, 1,
0.6253345, 1.504675, 0.3964209, 1, 1, 1, 1, 1,
0.6284426, 0.6374447, -0.6682675, 1, 1, 1, 1, 1,
0.6353427, -0.08709161, 1.540364, 1, 1, 1, 1, 1,
0.6448717, 1.273175, 0.2884855, 1, 1, 1, 1, 1,
0.6473877, 0.7090251, 2.05099, 1, 1, 1, 1, 1,
0.6511809, 0.3061431, 1.366915, 1, 1, 1, 1, 1,
0.6518248, -0.8932805, 3.132525, 1, 1, 1, 1, 1,
0.6536129, -1.006955, 2.84588, 1, 1, 1, 1, 1,
0.656844, -1.742756, 4.62235, 1, 1, 1, 1, 1,
0.6607417, -0.0125147, 2.147429, 1, 1, 1, 1, 1,
0.6748354, -1.406678, 3.173035, 1, 1, 1, 1, 1,
0.6817666, 0.1305753, 2.737706, 1, 1, 1, 1, 1,
0.6848105, 0.02835524, 3.110286, 1, 1, 1, 1, 1,
0.6898983, 0.9924572, 1.362581, 0, 0, 1, 1, 1,
0.69038, -1.350241, 2.779788, 1, 0, 0, 1, 1,
0.690886, 0.6480566, 0.9031577, 1, 0, 0, 1, 1,
0.6951532, 0.09153991, 0.1209795, 1, 0, 0, 1, 1,
0.6952862, -1.010344, 2.744599, 1, 0, 0, 1, 1,
0.6978291, -0.1485972, 2.292653, 1, 0, 0, 1, 1,
0.6995462, 0.5342571, 2.005755, 0, 0, 0, 1, 1,
0.706324, 0.4442435, 0.6861521, 0, 0, 0, 1, 1,
0.7106315, 0.1899224, 1.665158, 0, 0, 0, 1, 1,
0.7125461, 0.397693, -1.493953, 0, 0, 0, 1, 1,
0.7129226, -0.204017, 1.967932, 0, 0, 0, 1, 1,
0.7163799, -2.832128, 2.934229, 0, 0, 0, 1, 1,
0.7366641, 0.6575984, -0.6044316, 0, 0, 0, 1, 1,
0.7385851, 0.2903641, 1.510631, 1, 1, 1, 1, 1,
0.74648, 1.33234, 0.6898271, 1, 1, 1, 1, 1,
0.751202, -0.5278896, 2.847283, 1, 1, 1, 1, 1,
0.7548949, 0.4388058, 1.414397, 1, 1, 1, 1, 1,
0.763874, -0.6010315, 0.03499449, 1, 1, 1, 1, 1,
0.7656169, -0.01582054, 1.756374, 1, 1, 1, 1, 1,
0.765927, 0.1097305, 0.354135, 1, 1, 1, 1, 1,
0.7699718, 0.5018004, 1.133775, 1, 1, 1, 1, 1,
0.7742921, 0.8743262, 0.8724803, 1, 1, 1, 1, 1,
0.7770276, -0.8410568, 0.6365139, 1, 1, 1, 1, 1,
0.7797921, -0.8222453, 2.866298, 1, 1, 1, 1, 1,
0.7910544, -0.5164621, 1.839671, 1, 1, 1, 1, 1,
0.7930142, 0.5092233, 0.4272616, 1, 1, 1, 1, 1,
0.7934414, -2.882906, 3.953249, 1, 1, 1, 1, 1,
0.795977, -0.05570406, 1.626079, 1, 1, 1, 1, 1,
0.7968999, 2.17794, -0.3870733, 0, 0, 1, 1, 1,
0.811396, -0.4838847, 2.333651, 1, 0, 0, 1, 1,
0.8190429, -0.5812336, 1.956205, 1, 0, 0, 1, 1,
0.8234349, 0.1241639, 1.560353, 1, 0, 0, 1, 1,
0.8243461, -1.088031, 3.293563, 1, 0, 0, 1, 1,
0.825757, -0.5759867, 1.639926, 1, 0, 0, 1, 1,
0.8263773, -0.5530518, 2.81421, 0, 0, 0, 1, 1,
0.8331822, -1.038182, 2.262001, 0, 0, 0, 1, 1,
0.8380333, 0.09846281, 0.06931458, 0, 0, 0, 1, 1,
0.8435671, -0.406989, 1.806939, 0, 0, 0, 1, 1,
0.8512507, 1.073064, 1.385048, 0, 0, 0, 1, 1,
0.8556501, 0.8471509, 0.60557, 0, 0, 0, 1, 1,
0.8596558, 2.356032, -0.2761825, 0, 0, 0, 1, 1,
0.8626005, -1.678964, 1.819845, 1, 1, 1, 1, 1,
0.8639716, -0.8024781, 1.08773, 1, 1, 1, 1, 1,
0.8653901, 0.4100009, 2.0039, 1, 1, 1, 1, 1,
0.8680845, 1.495202, 0.2247521, 1, 1, 1, 1, 1,
0.8700246, 0.7324642, 1.223036, 1, 1, 1, 1, 1,
0.8700539, 1.583681, 0.1555881, 1, 1, 1, 1, 1,
0.8768411, -0.6904733, 2.009977, 1, 1, 1, 1, 1,
0.8807102, 0.0433021, 0.2635115, 1, 1, 1, 1, 1,
0.8867122, -0.1409119, -0.05100726, 1, 1, 1, 1, 1,
0.887141, -0.2118759, 0.5367627, 1, 1, 1, 1, 1,
0.8977005, 1.91413, 0.5193486, 1, 1, 1, 1, 1,
0.9019421, -0.4370486, 1.795672, 1, 1, 1, 1, 1,
0.9116259, 0.1764879, 2.578691, 1, 1, 1, 1, 1,
0.9186797, 1.663516, 1.525107, 1, 1, 1, 1, 1,
0.9208381, -1.370438, 1.540891, 1, 1, 1, 1, 1,
0.9215178, -2.698817, 2.225357, 0, 0, 1, 1, 1,
0.9232739, 0.5816193, -1.234455, 1, 0, 0, 1, 1,
0.9263564, 0.2272086, 1.068962, 1, 0, 0, 1, 1,
0.928728, -0.401254, 2.951203, 1, 0, 0, 1, 1,
0.9382293, -1.367185, 2.260931, 1, 0, 0, 1, 1,
0.9385448, 1.11827, -0.4386945, 1, 0, 0, 1, 1,
0.9396799, -0.6222079, 3.358516, 0, 0, 0, 1, 1,
0.9445112, -1.905939, 1.612264, 0, 0, 0, 1, 1,
0.948074, -0.8228449, 2.444608, 0, 0, 0, 1, 1,
0.9485155, 0.6066582, -0.1570682, 0, 0, 0, 1, 1,
0.9603203, -0.07134497, 2.738703, 0, 0, 0, 1, 1,
0.9641914, 0.3739963, 0.2508846, 0, 0, 0, 1, 1,
0.9709676, 1.538438, 1.084916, 0, 0, 0, 1, 1,
0.9792872, 0.4668697, 1.097564, 1, 1, 1, 1, 1,
0.9843339, 0.4391634, 1.142635, 1, 1, 1, 1, 1,
0.9879387, -0.7998087, 1.661367, 1, 1, 1, 1, 1,
0.9962484, -0.09322207, 1.322746, 1, 1, 1, 1, 1,
0.9984282, 0.5596687, -0.5970508, 1, 1, 1, 1, 1,
1.005229, 1.323375, -0.4259822, 1, 1, 1, 1, 1,
1.00551, -1.377085, 0.4381248, 1, 1, 1, 1, 1,
1.01539, 0.1542635, 2.074063, 1, 1, 1, 1, 1,
1.025401, -1.408564, 1.540213, 1, 1, 1, 1, 1,
1.026736, 0.4811363, 0.7601983, 1, 1, 1, 1, 1,
1.035767, -0.7644087, 3.127872, 1, 1, 1, 1, 1,
1.044283, -0.7735668, 2.190364, 1, 1, 1, 1, 1,
1.04985, -0.6009961, 0.5155734, 1, 1, 1, 1, 1,
1.052621, -0.2107793, 1.226396, 1, 1, 1, 1, 1,
1.058648, -3.002769, 3.199635, 1, 1, 1, 1, 1,
1.058825, 0.9119983, 0.9237475, 0, 0, 1, 1, 1,
1.063123, -0.5370016, 2.672198, 1, 0, 0, 1, 1,
1.065982, -0.588585, 0.9898819, 1, 0, 0, 1, 1,
1.066516, -1.110477, 2.381268, 1, 0, 0, 1, 1,
1.068606, -1.025919, 1.056779, 1, 0, 0, 1, 1,
1.069922, -0.5770806, 2.924558, 1, 0, 0, 1, 1,
1.070848, -1.608919, 1.951909, 0, 0, 0, 1, 1,
1.080828, 0.3210064, 3.70294, 0, 0, 0, 1, 1,
1.087235, -1.206321, 3.003804, 0, 0, 0, 1, 1,
1.088551, 0.1310088, 1.241573, 0, 0, 0, 1, 1,
1.090604, -1.865578, 2.590979, 0, 0, 0, 1, 1,
1.096584, 2.159422, -0.4974394, 0, 0, 0, 1, 1,
1.102368, 0.9645514, 1.646775, 0, 0, 0, 1, 1,
1.103763, 1.152892, 0.6787367, 1, 1, 1, 1, 1,
1.105506, -0.7283561, 2.185163, 1, 1, 1, 1, 1,
1.107518, 0.3652755, 1.067855, 1, 1, 1, 1, 1,
1.108842, 0.6928505, 2.593847, 1, 1, 1, 1, 1,
1.114584, -0.4794913, 2.294254, 1, 1, 1, 1, 1,
1.122737, -1.070008, 2.160638, 1, 1, 1, 1, 1,
1.125269, -0.2467567, 0.8425147, 1, 1, 1, 1, 1,
1.129039, -0.03732423, 1.995785, 1, 1, 1, 1, 1,
1.130107, 1.741036, 3.011827, 1, 1, 1, 1, 1,
1.133402, -0.6840092, 2.765336, 1, 1, 1, 1, 1,
1.133912, -0.8172907, 1.361495, 1, 1, 1, 1, 1,
1.137063, -1.513191, 2.599672, 1, 1, 1, 1, 1,
1.147565, 0.5837069, 1.781333, 1, 1, 1, 1, 1,
1.149149, 0.8725848, 2.653726, 1, 1, 1, 1, 1,
1.170318, -0.4960533, 1.810994, 1, 1, 1, 1, 1,
1.172806, -0.6671576, 3.032847, 0, 0, 1, 1, 1,
1.176643, 1.094134, 2.022906, 1, 0, 0, 1, 1,
1.180632, 0.1229664, -0.3213896, 1, 0, 0, 1, 1,
1.183507, -0.4734169, 2.021427, 1, 0, 0, 1, 1,
1.189335, 0.8773262, 1.443336, 1, 0, 0, 1, 1,
1.1899, 0.3001567, -0.1317546, 1, 0, 0, 1, 1,
1.194964, 0.05110402, 3.206043, 0, 0, 0, 1, 1,
1.202905, -0.6189348, 2.324316, 0, 0, 0, 1, 1,
1.208326, 0.8691131, 1.907923, 0, 0, 0, 1, 1,
1.231754, -1.412373, 2.674891, 0, 0, 0, 1, 1,
1.233162, 0.06227643, 0.5511643, 0, 0, 0, 1, 1,
1.237552, -0.53048, 2.000961, 0, 0, 0, 1, 1,
1.239106, 0.3147552, -0.1783627, 0, 0, 0, 1, 1,
1.239335, -0.9004435, 2.66523, 1, 1, 1, 1, 1,
1.240906, -1.498427, 2.77726, 1, 1, 1, 1, 1,
1.241354, 1.401993, 1.500974, 1, 1, 1, 1, 1,
1.243017, 2.257908, 0.4849389, 1, 1, 1, 1, 1,
1.243993, -0.1488818, 2.058072, 1, 1, 1, 1, 1,
1.25153, -0.4423061, 0.8497946, 1, 1, 1, 1, 1,
1.252357, -0.4255904, 2.095578, 1, 1, 1, 1, 1,
1.257335, 0.3015885, 0.4836503, 1, 1, 1, 1, 1,
1.26539, 0.3005543, 1.222982, 1, 1, 1, 1, 1,
1.26745, -0.5581673, 2.666802, 1, 1, 1, 1, 1,
1.268522, 0.9495568, 1.834868, 1, 1, 1, 1, 1,
1.277288, 0.695273, 1.103306, 1, 1, 1, 1, 1,
1.287251, 0.3392219, -0.4138951, 1, 1, 1, 1, 1,
1.293374, -0.7937549, 2.303527, 1, 1, 1, 1, 1,
1.29428, -0.2057817, 2.097242, 1, 1, 1, 1, 1,
1.296358, -0.5700415, 2.925909, 0, 0, 1, 1, 1,
1.297778, -0.8903474, 2.306479, 1, 0, 0, 1, 1,
1.329634, 1.836644, -0.1937602, 1, 0, 0, 1, 1,
1.33115, 0.3273575, 1.844911, 1, 0, 0, 1, 1,
1.342631, 1.666223, 1.001649, 1, 0, 0, 1, 1,
1.346458, -0.04533635, 2.535968, 1, 0, 0, 1, 1,
1.350337, -0.781912, 2.652441, 0, 0, 0, 1, 1,
1.357618, 2.507236, -1.076871, 0, 0, 0, 1, 1,
1.361275, -1.044155, 1.575141, 0, 0, 0, 1, 1,
1.370978, 0.3637979, 2.54545, 0, 0, 0, 1, 1,
1.375908, 0.00936773, 1.573099, 0, 0, 0, 1, 1,
1.383989, 0.8280645, -0.3966934, 0, 0, 0, 1, 1,
1.402637, 0.1185599, 3.242203, 0, 0, 0, 1, 1,
1.406527, 0.6557692, 1.177813, 1, 1, 1, 1, 1,
1.409859, 1.051861, 1.722481, 1, 1, 1, 1, 1,
1.411218, -0.6950627, 2.176397, 1, 1, 1, 1, 1,
1.412387, 0.3246761, 1.855718, 1, 1, 1, 1, 1,
1.428402, 0.2242807, -0.1212016, 1, 1, 1, 1, 1,
1.428876, 0.5551829, 0.700798, 1, 1, 1, 1, 1,
1.430586, -0.8597144, 2.131744, 1, 1, 1, 1, 1,
1.438052, -2.240094, 2.407672, 1, 1, 1, 1, 1,
1.440814, 0.3704914, 1.697737, 1, 1, 1, 1, 1,
1.443679, -1.318297, 2.040021, 1, 1, 1, 1, 1,
1.445946, 0.3685053, 0.9534617, 1, 1, 1, 1, 1,
1.450431, -1.111267, 2.262947, 1, 1, 1, 1, 1,
1.452152, -1.581187, 1.647997, 1, 1, 1, 1, 1,
1.453041, 0.3233944, 0.9837265, 1, 1, 1, 1, 1,
1.453833, -0.001249756, 1.433251, 1, 1, 1, 1, 1,
1.457166, -1.254488, 2.458935, 0, 0, 1, 1, 1,
1.46556, -0.4868868, 4.251516, 1, 0, 0, 1, 1,
1.47676, -0.2059527, 1.845123, 1, 0, 0, 1, 1,
1.503549, 0.6469121, 2.715627, 1, 0, 0, 1, 1,
1.505361, 0.706561, 1.212201, 1, 0, 0, 1, 1,
1.506958, 0.03431632, 2.41244, 1, 0, 0, 1, 1,
1.513137, 0.6154187, -1.270844, 0, 0, 0, 1, 1,
1.521713, 0.4948986, 1.807237, 0, 0, 0, 1, 1,
1.522852, 0.2626163, 0.2548593, 0, 0, 0, 1, 1,
1.536892, 0.07343563, 0.6216342, 0, 0, 0, 1, 1,
1.548314, 0.5953793, 1.155853, 0, 0, 0, 1, 1,
1.561121, -1.353335, 2.746493, 0, 0, 0, 1, 1,
1.579221, -1.218253, 1.580909, 0, 0, 0, 1, 1,
1.580972, 0.08608321, 1.720441, 1, 1, 1, 1, 1,
1.582712, -0.7811602, 0.6149701, 1, 1, 1, 1, 1,
1.586795, -0.1027608, -0.1903534, 1, 1, 1, 1, 1,
1.594536, 0.4604082, 2.030789, 1, 1, 1, 1, 1,
1.596006, -0.2283362, 0.7922874, 1, 1, 1, 1, 1,
1.601369, -0.5998891, 1.82182, 1, 1, 1, 1, 1,
1.613035, -1.466978, 1.403155, 1, 1, 1, 1, 1,
1.622655, 0.4433223, 2.023419, 1, 1, 1, 1, 1,
1.629284, 1.464975, 2.074696, 1, 1, 1, 1, 1,
1.630785, 0.4723144, 2.199331, 1, 1, 1, 1, 1,
1.641862, -0.5617645, 2.30976, 1, 1, 1, 1, 1,
1.649045, 1.343406, 1.30943, 1, 1, 1, 1, 1,
1.650797, -0.7214727, 1.022958, 1, 1, 1, 1, 1,
1.651111, 0.2059243, 0.285461, 1, 1, 1, 1, 1,
1.658364, -1.578971, 2.408342, 1, 1, 1, 1, 1,
1.66745, 0.3413028, 1.246693, 0, 0, 1, 1, 1,
1.668527, -2.534469, 1.852212, 1, 0, 0, 1, 1,
1.671836, -1.080583, 0.9201581, 1, 0, 0, 1, 1,
1.672602, 0.6190062, 1.262868, 1, 0, 0, 1, 1,
1.673735, -0.1577729, 1.891954, 1, 0, 0, 1, 1,
1.681426, -1.255051, 3.614817, 1, 0, 0, 1, 1,
1.699455, 0.5336564, 0.2079531, 0, 0, 0, 1, 1,
1.731353, -1.570142, 2.784375, 0, 0, 0, 1, 1,
1.750414, -1.569796, 1.258339, 0, 0, 0, 1, 1,
1.787793, 1.080567, -0.1851927, 0, 0, 0, 1, 1,
1.788195, 1.748046, 0.9176198, 0, 0, 0, 1, 1,
1.798135, -1.492173, 3.851021, 0, 0, 0, 1, 1,
1.801338, 0.3715106, 0.9594818, 0, 0, 0, 1, 1,
1.803006, -1.203884, 1.972239, 1, 1, 1, 1, 1,
1.803027, -0.3578219, 2.479209, 1, 1, 1, 1, 1,
1.806654, -1.129076, 1.855023, 1, 1, 1, 1, 1,
1.810306, 0.7751924, -0.2704226, 1, 1, 1, 1, 1,
1.827587, 1.376294, 0.5620111, 1, 1, 1, 1, 1,
1.835516, 0.4041994, 1.717793, 1, 1, 1, 1, 1,
1.848785, 0.6202223, 0.2134722, 1, 1, 1, 1, 1,
1.859839, -0.4543682, 1.286456, 1, 1, 1, 1, 1,
1.89818, 0.8635439, 1.465128, 1, 1, 1, 1, 1,
1.915492, -0.5143673, 0.6762259, 1, 1, 1, 1, 1,
1.937078, -1.113058, 1.388035, 1, 1, 1, 1, 1,
1.96379, 0.1813181, 1.62534, 1, 1, 1, 1, 1,
2.027303, -0.349406, 1.357669, 1, 1, 1, 1, 1,
2.052546, -0.6143715, 1.504221, 1, 1, 1, 1, 1,
2.087817, -0.3054073, 2.173256, 1, 1, 1, 1, 1,
2.088199, 0.3646585, -0.1419743, 0, 0, 1, 1, 1,
2.133855, 0.4928256, 3.736829, 1, 0, 0, 1, 1,
2.1496, 0.5123324, 1.541427, 1, 0, 0, 1, 1,
2.204314, -1.13464, 3.16085, 1, 0, 0, 1, 1,
2.209789, -1.903226, 1.880906, 1, 0, 0, 1, 1,
2.224332, -0.750754, 2.440418, 1, 0, 0, 1, 1,
2.259759, -0.05277983, 2.558127, 0, 0, 0, 1, 1,
2.32191, 0.2949089, 2.601761, 0, 0, 0, 1, 1,
2.422538, 1.849747, 0.7824536, 0, 0, 0, 1, 1,
2.430478, 0.93878, 1.078555, 0, 0, 0, 1, 1,
2.435088, 0.5249221, 0.92835, 0, 0, 0, 1, 1,
2.445199, 0.558764, 1.385656, 0, 0, 0, 1, 1,
2.456745, 0.7021018, -0.1388895, 0, 0, 0, 1, 1,
2.561592, -0.1903833, 0.7605972, 1, 1, 1, 1, 1,
2.563157, -1.650207, 3.873358, 1, 1, 1, 1, 1,
2.687365, 0.661615, 2.551927, 1, 1, 1, 1, 1,
2.905885, 0.4205712, 2.187776, 1, 1, 1, 1, 1,
2.913536, -0.9276167, 2.131784, 1, 1, 1, 1, 1,
3.205384, 0.2890289, 2.308159, 1, 1, 1, 1, 1,
3.367789, 0.6047984, 2.099108, 1, 1, 1, 1, 1
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
var radius = 9.535286;
var distance = 33.49229;
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
mvMatrix.translate( 0.0238328, 0.01232052, 0.3249953 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49229);
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
