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
-3.038258, -0.3180813, -1.003047, 1, 0, 0, 1,
-2.895539, 0.8993621, 1.375734, 1, 0.007843138, 0, 1,
-2.715089, -0.4277287, -1.553359, 1, 0.01176471, 0, 1,
-2.675037, -0.9219743, -1.779865, 1, 0.01960784, 0, 1,
-2.563521, 0.9305792, 0.09502689, 1, 0.02352941, 0, 1,
-2.561961, -1.163914, -3.547831, 1, 0.03137255, 0, 1,
-2.500242, 1.752512, 0.3802319, 1, 0.03529412, 0, 1,
-2.499209, 0.8162624, -0.8360319, 1, 0.04313726, 0, 1,
-2.327028, 1.255231, 0.1645014, 1, 0.04705882, 0, 1,
-2.302358, 1.194913, -2.03993, 1, 0.05490196, 0, 1,
-2.245637, -0.1230746, -1.978567, 1, 0.05882353, 0, 1,
-2.205184, 0.391608, -2.399822, 1, 0.06666667, 0, 1,
-2.133169, 1.857396, 0.3833097, 1, 0.07058824, 0, 1,
-2.089766, 0.1238152, -1.104379, 1, 0.07843138, 0, 1,
-2.063984, 1.779623, -0.6811464, 1, 0.08235294, 0, 1,
-2.036732, 1.057533, -2.048735, 1, 0.09019608, 0, 1,
-2.030932, -0.5123973, -2.730103, 1, 0.09411765, 0, 1,
-2.023062, -0.466892, -2.328138, 1, 0.1019608, 0, 1,
-1.974473, -1.827933, -2.67006, 1, 0.1098039, 0, 1,
-1.969622, -1.432966, -0.9426569, 1, 0.1137255, 0, 1,
-1.942301, -0.1949637, -3.01588, 1, 0.1215686, 0, 1,
-1.939338, -1.081218, -3.513683, 1, 0.1254902, 0, 1,
-1.938067, 0.7749248, -1.316073, 1, 0.1333333, 0, 1,
-1.933027, 0.3633281, -2.017129, 1, 0.1372549, 0, 1,
-1.844512, -0.4218836, -0.5949386, 1, 0.145098, 0, 1,
-1.840916, -0.5543851, -1.804794, 1, 0.1490196, 0, 1,
-1.830837, 3.050984, -0.9688604, 1, 0.1568628, 0, 1,
-1.791449, 0.7697632, -2.382667, 1, 0.1607843, 0, 1,
-1.790086, -0.07885403, -2.571709, 1, 0.1686275, 0, 1,
-1.779377, -0.9849299, -3.338003, 1, 0.172549, 0, 1,
-1.779014, -0.424676, -2.214086, 1, 0.1803922, 0, 1,
-1.777867, 0.7412925, -0.6609057, 1, 0.1843137, 0, 1,
-1.727203, -2.038886, -3.202055, 1, 0.1921569, 0, 1,
-1.72566, 0.5799391, -1.849433, 1, 0.1960784, 0, 1,
-1.705589, 0.3100726, -2.562675, 1, 0.2039216, 0, 1,
-1.703424, -0.1233533, -0.5804243, 1, 0.2117647, 0, 1,
-1.701668, -1.09358, -1.803217, 1, 0.2156863, 0, 1,
-1.691723, -0.4266017, -1.707917, 1, 0.2235294, 0, 1,
-1.688795, -1.089145, -0.791503, 1, 0.227451, 0, 1,
-1.671782, 1.672622, -0.5793922, 1, 0.2352941, 0, 1,
-1.66041, -1.531782, -1.113074, 1, 0.2392157, 0, 1,
-1.654693, 0.74725, -3.165474, 1, 0.2470588, 0, 1,
-1.652886, -1.651502, -1.509066, 1, 0.2509804, 0, 1,
-1.638032, -0.904494, -4.345837, 1, 0.2588235, 0, 1,
-1.637848, -2.119992, -3.843246, 1, 0.2627451, 0, 1,
-1.623638, -0.2347653, -1.359244, 1, 0.2705882, 0, 1,
-1.616239, 0.225059, -1.615828, 1, 0.2745098, 0, 1,
-1.603115, 0.6332121, -1.421622, 1, 0.282353, 0, 1,
-1.584186, 0.1335839, -1.415013, 1, 0.2862745, 0, 1,
-1.583918, -1.285247, -0.6575067, 1, 0.2941177, 0, 1,
-1.57319, -0.3330949, -1.741109, 1, 0.3019608, 0, 1,
-1.573094, 0.2482921, -0.4589612, 1, 0.3058824, 0, 1,
-1.543321, 1.738802, -0.9524597, 1, 0.3137255, 0, 1,
-1.542988, 1.873577, 1.09033, 1, 0.3176471, 0, 1,
-1.521542, 0.9300825, -1.813339, 1, 0.3254902, 0, 1,
-1.515523, 0.08893519, -2.365537, 1, 0.3294118, 0, 1,
-1.501938, 0.2846959, -0.3565166, 1, 0.3372549, 0, 1,
-1.494825, -0.4598244, -3.002621, 1, 0.3411765, 0, 1,
-1.483798, 0.6975575, -0.9909563, 1, 0.3490196, 0, 1,
-1.464911, -0.4923717, -4.289145, 1, 0.3529412, 0, 1,
-1.454539, 0.1782958, -0.278638, 1, 0.3607843, 0, 1,
-1.446342, -0.7805746, -2.413722, 1, 0.3647059, 0, 1,
-1.442912, 1.870135, -0.03819437, 1, 0.372549, 0, 1,
-1.442247, 0.4759261, 0.1447249, 1, 0.3764706, 0, 1,
-1.436826, 0.4153211, -0.7008932, 1, 0.3843137, 0, 1,
-1.435919, 1.017728, -2.12786, 1, 0.3882353, 0, 1,
-1.424651, -0.7556986, -3.212277, 1, 0.3960784, 0, 1,
-1.422092, 0.5566871, -0.8365549, 1, 0.4039216, 0, 1,
-1.420635, 0.4606055, -3.474174, 1, 0.4078431, 0, 1,
-1.42006, 0.3727157, -1.399508, 1, 0.4156863, 0, 1,
-1.417458, 0.5078804, -0.983367, 1, 0.4196078, 0, 1,
-1.414331, 0.4609073, -1.553309, 1, 0.427451, 0, 1,
-1.39377, -0.4136965, -2.823879, 1, 0.4313726, 0, 1,
-1.380498, -1.743973, -1.387253, 1, 0.4392157, 0, 1,
-1.37881, -0.5246266, -3.074559, 1, 0.4431373, 0, 1,
-1.366219, -1.571108, -1.339631, 1, 0.4509804, 0, 1,
-1.36298, -0.8661413, -3.123407, 1, 0.454902, 0, 1,
-1.357701, -0.4920458, -1.625903, 1, 0.4627451, 0, 1,
-1.357267, -0.5493374, -1.420263, 1, 0.4666667, 0, 1,
-1.35199, -0.6393594, -0.07032208, 1, 0.4745098, 0, 1,
-1.351248, 0.6388276, -1.579282, 1, 0.4784314, 0, 1,
-1.337758, -1.17184, -3.826702, 1, 0.4862745, 0, 1,
-1.331409, -0.3127528, -1.823116, 1, 0.4901961, 0, 1,
-1.327994, -3.223675, -1.400752, 1, 0.4980392, 0, 1,
-1.327926, 1.575934, 0.1791532, 1, 0.5058824, 0, 1,
-1.325324, 1.449222, -2.040723, 1, 0.509804, 0, 1,
-1.323307, -0.136335, -2.759319, 1, 0.5176471, 0, 1,
-1.317468, 1.273405, -0.01452683, 1, 0.5215687, 0, 1,
-1.309168, -0.3425316, -3.476557, 1, 0.5294118, 0, 1,
-1.307926, 0.19855, -1.624068, 1, 0.5333334, 0, 1,
-1.291347, 1.631677, 0.6580029, 1, 0.5411765, 0, 1,
-1.291157, 0.512875, -1.707364, 1, 0.5450981, 0, 1,
-1.285095, 0.1409715, -1.442237, 1, 0.5529412, 0, 1,
-1.283072, -0.2379721, -1.93734, 1, 0.5568628, 0, 1,
-1.279734, 0.4316993, -1.622279, 1, 0.5647059, 0, 1,
-1.279163, -0.0729491, -2.748142, 1, 0.5686275, 0, 1,
-1.275309, -0.7004137, -0.893801, 1, 0.5764706, 0, 1,
-1.257757, -0.834783, -1.632103, 1, 0.5803922, 0, 1,
-1.23842, 0.5480153, -0.08594364, 1, 0.5882353, 0, 1,
-1.236625, 1.459051, -0.7508748, 1, 0.5921569, 0, 1,
-1.230863, -0.5151081, -2.595376, 1, 0.6, 0, 1,
-1.223142, -1.112401, -2.499078, 1, 0.6078432, 0, 1,
-1.219733, -0.6268134, -1.636772, 1, 0.6117647, 0, 1,
-1.210984, -1.091772, -1.297007, 1, 0.6196079, 0, 1,
-1.209343, -0.1080356, -1.427929, 1, 0.6235294, 0, 1,
-1.206637, 1.289569, -0.4260231, 1, 0.6313726, 0, 1,
-1.205115, 0.6967641, -0.7039013, 1, 0.6352941, 0, 1,
-1.200869, 0.8401266, -0.395773, 1, 0.6431373, 0, 1,
-1.195391, -0.8552154, -3.614389, 1, 0.6470588, 0, 1,
-1.191674, 0.26895, -2.61799, 1, 0.654902, 0, 1,
-1.185417, -0.1024013, -3.160271, 1, 0.6588235, 0, 1,
-1.184825, -0.4360996, -0.333378, 1, 0.6666667, 0, 1,
-1.162472, -0.6162175, -2.702996, 1, 0.6705883, 0, 1,
-1.162179, -0.0003639257, -1.532438, 1, 0.6784314, 0, 1,
-1.147944, 2.160825, 0.4089136, 1, 0.682353, 0, 1,
-1.145027, -0.6189327, -2.222726, 1, 0.6901961, 0, 1,
-1.144902, 0.9090573, -0.2892889, 1, 0.6941177, 0, 1,
-1.14034, -0.300541, -0.4549103, 1, 0.7019608, 0, 1,
-1.137165, 0.7088786, -1.009607, 1, 0.7098039, 0, 1,
-1.137134, 0.4650499, -1.469994, 1, 0.7137255, 0, 1,
-1.135074, -0.05568161, -1.272002, 1, 0.7215686, 0, 1,
-1.127748, 0.4110863, 0.0722642, 1, 0.7254902, 0, 1,
-1.124693, 1.483293, -0.6728843, 1, 0.7333333, 0, 1,
-1.113355, 0.5059317, -2.1659, 1, 0.7372549, 0, 1,
-1.099596, 0.8926139, 0.5151125, 1, 0.7450981, 0, 1,
-1.097461, 0.6616122, -1.721282, 1, 0.7490196, 0, 1,
-1.088759, 1.345569, -2.29577, 1, 0.7568628, 0, 1,
-1.088561, 0.6475433, -0.6529519, 1, 0.7607843, 0, 1,
-1.082982, -0.9765049, -2.151242, 1, 0.7686275, 0, 1,
-1.076658, -1.277451, -0.9534324, 1, 0.772549, 0, 1,
-1.071115, -0.3427514, -0.2597074, 1, 0.7803922, 0, 1,
-1.065827, 0.8561962, 0.2864792, 1, 0.7843137, 0, 1,
-1.063998, 0.6581689, 0.5803075, 1, 0.7921569, 0, 1,
-1.063873, 0.703085, -0.7328948, 1, 0.7960784, 0, 1,
-1.061649, -0.5691271, -1.742178, 1, 0.8039216, 0, 1,
-1.059818, -1.268907, -1.032638, 1, 0.8117647, 0, 1,
-1.059155, 1.109495, 0.3609464, 1, 0.8156863, 0, 1,
-1.058565, -0.2794805, -1.845002, 1, 0.8235294, 0, 1,
-1.051168, 0.0257204, -2.536799, 1, 0.827451, 0, 1,
-1.050701, -0.8336233, -2.480754, 1, 0.8352941, 0, 1,
-1.047095, -0.0904484, -2.450583, 1, 0.8392157, 0, 1,
-1.044295, 1.111316, -1.831282, 1, 0.8470588, 0, 1,
-1.03786, 0.2679272, -0.3830371, 1, 0.8509804, 0, 1,
-1.037026, 0.7739967, -1.600882, 1, 0.8588235, 0, 1,
-1.034525, -0.0004465286, -1.258679, 1, 0.8627451, 0, 1,
-1.029837, 0.3488388, -0.4897442, 1, 0.8705882, 0, 1,
-1.021004, -0.3494813, -2.160942, 1, 0.8745098, 0, 1,
-1.020135, 1.974212, -0.8003972, 1, 0.8823529, 0, 1,
-1.019897, 0.7876686, 0.7189316, 1, 0.8862745, 0, 1,
-1.01944, 1.364826, -0.7313625, 1, 0.8941177, 0, 1,
-1.013427, -1.179309, -1.45512, 1, 0.8980392, 0, 1,
-1.010382, -0.4830908, -3.168942, 1, 0.9058824, 0, 1,
-0.9996234, -0.2282527, -2.330328, 1, 0.9137255, 0, 1,
-0.9963802, 0.1725153, -2.874829, 1, 0.9176471, 0, 1,
-0.9944773, 0.2848253, -1.425704, 1, 0.9254902, 0, 1,
-0.9919318, -1.378364, -2.888371, 1, 0.9294118, 0, 1,
-0.9860033, 0.3334084, -1.488449, 1, 0.9372549, 0, 1,
-0.9848586, -0.7111541, -2.472116, 1, 0.9411765, 0, 1,
-0.9812692, 0.4660859, 1.108495, 1, 0.9490196, 0, 1,
-0.9796097, -0.5637503, -0.1769284, 1, 0.9529412, 0, 1,
-0.9787076, 1.388124, -0.4903064, 1, 0.9607843, 0, 1,
-0.9775475, -0.4505583, -2.575948, 1, 0.9647059, 0, 1,
-0.9756545, 1.044683, -0.1421497, 1, 0.972549, 0, 1,
-0.9744257, -0.5204945, -1.271186, 1, 0.9764706, 0, 1,
-0.9665361, 1.423017, -1.230127, 1, 0.9843137, 0, 1,
-0.9627469, -0.5636713, -2.251749, 1, 0.9882353, 0, 1,
-0.9560128, -0.3309033, -1.695794, 1, 0.9960784, 0, 1,
-0.9524273, -0.4331318, -2.423625, 0.9960784, 1, 0, 1,
-0.9524252, 0.3012861, -0.6965167, 0.9921569, 1, 0, 1,
-0.9510831, -0.7574157, -2.549784, 0.9843137, 1, 0, 1,
-0.937834, -0.06340071, -2.635174, 0.9803922, 1, 0, 1,
-0.9371189, -1.285881, -3.14632, 0.972549, 1, 0, 1,
-0.9325973, 0.4814059, -3.860901, 0.9686275, 1, 0, 1,
-0.9307038, -0.5608425, -2.843247, 0.9607843, 1, 0, 1,
-0.9305682, 1.44049, -1.795881, 0.9568627, 1, 0, 1,
-0.9268466, -0.5062876, -2.683249, 0.9490196, 1, 0, 1,
-0.9229861, -0.4114542, -1.770058, 0.945098, 1, 0, 1,
-0.9213797, -0.05548942, -2.978461, 0.9372549, 1, 0, 1,
-0.9202477, -1.078438, -0.3944874, 0.9333333, 1, 0, 1,
-0.9197772, -1.175545, -3.182872, 0.9254902, 1, 0, 1,
-0.9168723, 1.12884, -1.358493, 0.9215686, 1, 0, 1,
-0.916419, 0.5422888, -1.309718, 0.9137255, 1, 0, 1,
-0.9162357, -0.09858785, -2.65442, 0.9098039, 1, 0, 1,
-0.9145598, -0.3467932, -2.702691, 0.9019608, 1, 0, 1,
-0.9136556, -0.6113514, -1.542053, 0.8941177, 1, 0, 1,
-0.9123505, 0.2723351, -2.034852, 0.8901961, 1, 0, 1,
-0.9104636, -0.8357461, -1.474021, 0.8823529, 1, 0, 1,
-0.9063395, -0.2145824, -1.540279, 0.8784314, 1, 0, 1,
-0.9047616, -2.247118, -3.028825, 0.8705882, 1, 0, 1,
-0.9045076, -0.4801985, -3.633601, 0.8666667, 1, 0, 1,
-0.9031164, -0.5738205, -1.870371, 0.8588235, 1, 0, 1,
-0.8935992, 1.237858, -1.517062, 0.854902, 1, 0, 1,
-0.8931457, -0.3673843, -1.021209, 0.8470588, 1, 0, 1,
-0.8930139, -0.8529276, -2.339718, 0.8431373, 1, 0, 1,
-0.8924921, -0.9715132, -2.595449, 0.8352941, 1, 0, 1,
-0.8924448, 1.242087, -2.96915, 0.8313726, 1, 0, 1,
-0.8904094, -0.4596018, -2.793748, 0.8235294, 1, 0, 1,
-0.8886133, 1.355024, 0.2890078, 0.8196079, 1, 0, 1,
-0.8865412, -0.4162491, -0.6876471, 0.8117647, 1, 0, 1,
-0.8857805, 0.5650954, -0.4368077, 0.8078431, 1, 0, 1,
-0.8814057, -0.8032149, -1.914868, 0.8, 1, 0, 1,
-0.8810624, -1.663581, -2.504767, 0.7921569, 1, 0, 1,
-0.8740921, 1.025562, -0.9689943, 0.7882353, 1, 0, 1,
-0.8719956, 1.144809, -1.266137, 0.7803922, 1, 0, 1,
-0.867954, -1.463395, -2.793705, 0.7764706, 1, 0, 1,
-0.8655951, -0.2489257, -0.05371129, 0.7686275, 1, 0, 1,
-0.8640265, -0.2701314, -2.928082, 0.7647059, 1, 0, 1,
-0.8609079, -0.3095482, -1.361068, 0.7568628, 1, 0, 1,
-0.8572441, 1.360289, 0.7797253, 0.7529412, 1, 0, 1,
-0.8546711, -1.231831, -1.804527, 0.7450981, 1, 0, 1,
-0.8513488, -0.935738, -2.961792, 0.7411765, 1, 0, 1,
-0.8504606, -0.8644951, -2.364403, 0.7333333, 1, 0, 1,
-0.8483415, -0.5613729, -2.89853, 0.7294118, 1, 0, 1,
-0.8474509, 0.6119697, -0.1159089, 0.7215686, 1, 0, 1,
-0.8453333, 2.098811, -0.6712919, 0.7176471, 1, 0, 1,
-0.8442186, -1.051071, -0.9430396, 0.7098039, 1, 0, 1,
-0.839852, -0.2973414, -1.543062, 0.7058824, 1, 0, 1,
-0.8373104, -0.5582917, -2.603651, 0.6980392, 1, 0, 1,
-0.8333381, -1.862008, -2.642911, 0.6901961, 1, 0, 1,
-0.8315722, 0.3562005, -2.598411, 0.6862745, 1, 0, 1,
-0.8268576, -0.9687458, -0.1424767, 0.6784314, 1, 0, 1,
-0.8230288, 0.2510017, -3.590047, 0.6745098, 1, 0, 1,
-0.8225403, -0.03246003, -1.686298, 0.6666667, 1, 0, 1,
-0.8225239, -1.206836, -2.713099, 0.6627451, 1, 0, 1,
-0.8198445, 0.5034111, -1.541444, 0.654902, 1, 0, 1,
-0.8167108, 0.6856226, -1.042761, 0.6509804, 1, 0, 1,
-0.8144485, 0.06992318, -0.7813388, 0.6431373, 1, 0, 1,
-0.8023366, 1.624473, -0.904162, 0.6392157, 1, 0, 1,
-0.799837, -0.7389313, -4.11809, 0.6313726, 1, 0, 1,
-0.7996813, -0.1773235, -3.645122, 0.627451, 1, 0, 1,
-0.7951998, -2.108576, -3.180531, 0.6196079, 1, 0, 1,
-0.7928175, 0.3979268, 1.124948, 0.6156863, 1, 0, 1,
-0.7799809, -0.3176662, -0.9037837, 0.6078432, 1, 0, 1,
-0.7783703, -0.9745443, -2.069906, 0.6039216, 1, 0, 1,
-0.7737813, -0.6434041, -2.702194, 0.5960785, 1, 0, 1,
-0.7726427, 1.024414, -1.246559, 0.5882353, 1, 0, 1,
-0.7714672, 0.7642417, -0.5300808, 0.5843138, 1, 0, 1,
-0.7697365, 1.831994, -2.032364, 0.5764706, 1, 0, 1,
-0.763895, 0.3170408, -0.4925176, 0.572549, 1, 0, 1,
-0.7615999, -2.415861, -2.558383, 0.5647059, 1, 0, 1,
-0.7555647, -0.1090194, -0.493619, 0.5607843, 1, 0, 1,
-0.7542377, -0.1825355, -3.101415, 0.5529412, 1, 0, 1,
-0.7536097, -0.3129619, -1.643221, 0.5490196, 1, 0, 1,
-0.7504208, -0.2932394, -2.18174, 0.5411765, 1, 0, 1,
-0.7496417, 0.9128505, 0.5411494, 0.5372549, 1, 0, 1,
-0.7452992, 1.888978, -0.1567075, 0.5294118, 1, 0, 1,
-0.7393025, -0.4777823, -3.454169, 0.5254902, 1, 0, 1,
-0.7383575, -0.4496311, -2.637387, 0.5176471, 1, 0, 1,
-0.7376752, 0.7893305, 0.4839553, 0.5137255, 1, 0, 1,
-0.7361445, -0.6135263, -2.313939, 0.5058824, 1, 0, 1,
-0.7360698, -0.7759832, -0.5716102, 0.5019608, 1, 0, 1,
-0.7348754, -0.9838726, -2.295131, 0.4941176, 1, 0, 1,
-0.7325613, 0.7440935, -2.212665, 0.4862745, 1, 0, 1,
-0.7323005, 0.2477943, -1.243596, 0.4823529, 1, 0, 1,
-0.7290777, 0.1103441, -2.108436, 0.4745098, 1, 0, 1,
-0.7230246, -0.7911688, -2.030107, 0.4705882, 1, 0, 1,
-0.721212, 0.5203172, -0.4058952, 0.4627451, 1, 0, 1,
-0.7183276, 0.7758285, -2.299806, 0.4588235, 1, 0, 1,
-0.7076734, 0.8080273, -0.6082302, 0.4509804, 1, 0, 1,
-0.6839132, 0.4981213, -1.987545, 0.4470588, 1, 0, 1,
-0.6818693, 2.064082, -0.6115064, 0.4392157, 1, 0, 1,
-0.6801811, 0.1843445, -1.001636, 0.4352941, 1, 0, 1,
-0.6788973, 0.4720063, -0.5279886, 0.427451, 1, 0, 1,
-0.6787573, -0.6873719, -1.181377, 0.4235294, 1, 0, 1,
-0.6742846, -0.3791749, -0.8410375, 0.4156863, 1, 0, 1,
-0.6690283, 0.6176806, -1.565535, 0.4117647, 1, 0, 1,
-0.6687027, 0.1694188, 0.1061635, 0.4039216, 1, 0, 1,
-0.6662117, -0.08893894, 0.9145267, 0.3960784, 1, 0, 1,
-0.6652685, 0.5638866, -1.754591, 0.3921569, 1, 0, 1,
-0.6637231, 2.15145, -0.9893684, 0.3843137, 1, 0, 1,
-0.6633578, -1.480448, -2.428041, 0.3803922, 1, 0, 1,
-0.6631038, 0.5910133, -0.8649428, 0.372549, 1, 0, 1,
-0.6603127, 0.6496032, -1.602624, 0.3686275, 1, 0, 1,
-0.658806, -1.605267, -3.395602, 0.3607843, 1, 0, 1,
-0.6507107, 0.4115919, -0.5419659, 0.3568628, 1, 0, 1,
-0.6503602, 1.153702, -2.039977, 0.3490196, 1, 0, 1,
-0.6428462, -1.36634, -2.128849, 0.345098, 1, 0, 1,
-0.6412508, -0.8530421, -2.420603, 0.3372549, 1, 0, 1,
-0.6391209, -1.032416, -2.666833, 0.3333333, 1, 0, 1,
-0.6374051, -0.1244893, -1.948346, 0.3254902, 1, 0, 1,
-0.6319842, -0.8821048, -3.423624, 0.3215686, 1, 0, 1,
-0.6257422, 1.492866, -1.040773, 0.3137255, 1, 0, 1,
-0.6224113, -0.00210904, -2.967898, 0.3098039, 1, 0, 1,
-0.6200928, 0.1633262, -1.068783, 0.3019608, 1, 0, 1,
-0.6166676, -0.4978802, -1.033433, 0.2941177, 1, 0, 1,
-0.6158154, 1.578959, 0.4951514, 0.2901961, 1, 0, 1,
-0.6115609, -0.5495061, -1.943016, 0.282353, 1, 0, 1,
-0.6100464, 0.3176937, -1.191236, 0.2784314, 1, 0, 1,
-0.6073605, 0.950573, -0.9744031, 0.2705882, 1, 0, 1,
-0.6060663, -1.421591, -2.188349, 0.2666667, 1, 0, 1,
-0.6037296, 2.292492, -0.07201917, 0.2588235, 1, 0, 1,
-0.5995715, -1.281579, -3.536381, 0.254902, 1, 0, 1,
-0.5953611, 0.2727953, -0.1572306, 0.2470588, 1, 0, 1,
-0.5903036, 0.8613048, -0.5923362, 0.2431373, 1, 0, 1,
-0.5902866, -0.2420226, -1.820739, 0.2352941, 1, 0, 1,
-0.5897426, -0.5240209, -2.786882, 0.2313726, 1, 0, 1,
-0.5882544, 2.297091, -1.205329, 0.2235294, 1, 0, 1,
-0.5867226, 0.6812866, 0.8508962, 0.2196078, 1, 0, 1,
-0.581811, -0.6839018, -2.950505, 0.2117647, 1, 0, 1,
-0.5755404, -1.11599, -4.219592, 0.2078431, 1, 0, 1,
-0.5740149, -1.942243, -0.9385342, 0.2, 1, 0, 1,
-0.5710918, -1.032032, -2.067655, 0.1921569, 1, 0, 1,
-0.564139, -0.3085282, -4.045653, 0.1882353, 1, 0, 1,
-0.5640261, -0.49615, -2.357109, 0.1803922, 1, 0, 1,
-0.5635165, 1.927936, -0.5389898, 0.1764706, 1, 0, 1,
-0.559359, 0.3336246, -2.216695, 0.1686275, 1, 0, 1,
-0.5547473, -1.267083, -3.236359, 0.1647059, 1, 0, 1,
-0.5515919, -0.4838634, -2.882514, 0.1568628, 1, 0, 1,
-0.550624, 0.4566503, -0.8381538, 0.1529412, 1, 0, 1,
-0.5498558, 0.1242674, -0.7545868, 0.145098, 1, 0, 1,
-0.5491822, 1.187548, 0.3590231, 0.1411765, 1, 0, 1,
-0.547688, -0.738516, -1.926773, 0.1333333, 1, 0, 1,
-0.5472773, 0.571628, -0.9576762, 0.1294118, 1, 0, 1,
-0.546275, 1.120877, -1.042057, 0.1215686, 1, 0, 1,
-0.544262, 0.5023071, -1.730394, 0.1176471, 1, 0, 1,
-0.5438902, 0.7166253, -0.7404465, 0.1098039, 1, 0, 1,
-0.5429147, 0.3952872, -2.389351, 0.1058824, 1, 0, 1,
-0.5425965, -0.451565, -3.153779, 0.09803922, 1, 0, 1,
-0.5411906, 2.176762, -0.7219248, 0.09019608, 1, 0, 1,
-0.5391749, -0.05857382, -2.956577, 0.08627451, 1, 0, 1,
-0.5350175, -0.08625369, -0.9607279, 0.07843138, 1, 0, 1,
-0.5327118, 1.531832, -0.1153748, 0.07450981, 1, 0, 1,
-0.5321025, -2.058825, -2.306262, 0.06666667, 1, 0, 1,
-0.5312423, 0.07639852, -1.061741, 0.0627451, 1, 0, 1,
-0.5295653, -1.23113, -4.277214, 0.05490196, 1, 0, 1,
-0.5210752, -0.3120691, -1.67709, 0.05098039, 1, 0, 1,
-0.5165735, 0.1100201, -1.544454, 0.04313726, 1, 0, 1,
-0.5135104, 0.02720586, -1.912066, 0.03921569, 1, 0, 1,
-0.512118, -0.9135782, -4.344642, 0.03137255, 1, 0, 1,
-0.5113489, 2.379508, 0.07379562, 0.02745098, 1, 0, 1,
-0.5082811, -1.425589, -2.313186, 0.01960784, 1, 0, 1,
-0.5066087, 0.1580894, -1.212919, 0.01568628, 1, 0, 1,
-0.5060961, 0.738781, 0.006806206, 0.007843138, 1, 0, 1,
-0.505888, 0.1776714, -0.8745618, 0.003921569, 1, 0, 1,
-0.4997498, 1.374714, -0.6582654, 0, 1, 0.003921569, 1,
-0.4988651, -1.526023, -3.329843, 0, 1, 0.01176471, 1,
-0.4930966, 0.003214741, -0.0575345, 0, 1, 0.01568628, 1,
-0.4917442, 1.548617, -0.8217742, 0, 1, 0.02352941, 1,
-0.4892251, 1.396677, -0.01178117, 0, 1, 0.02745098, 1,
-0.485334, -1.325529, -3.121322, 0, 1, 0.03529412, 1,
-0.4846884, -0.7817361, -2.800007, 0, 1, 0.03921569, 1,
-0.4817052, 0.834089, -1.25625, 0, 1, 0.04705882, 1,
-0.4812591, 0.2949414, 0.9088476, 0, 1, 0.05098039, 1,
-0.4765061, 0.8079723, -0.6179842, 0, 1, 0.05882353, 1,
-0.4756516, 0.1935021, -0.4656251, 0, 1, 0.0627451, 1,
-0.4743586, 2.476482, 0.3213907, 0, 1, 0.07058824, 1,
-0.4728279, -1.040228, -2.153297, 0, 1, 0.07450981, 1,
-0.4722068, 0.9294914, 0.7340595, 0, 1, 0.08235294, 1,
-0.4715703, 0.1921067, -1.014858, 0, 1, 0.08627451, 1,
-0.4681495, -0.5403364, -3.710401, 0, 1, 0.09411765, 1,
-0.4656529, 1.120204, 0.4276391, 0, 1, 0.1019608, 1,
-0.4655278, 0.6290544, -1.158303, 0, 1, 0.1058824, 1,
-0.4634556, 1.830314, -0.3274045, 0, 1, 0.1137255, 1,
-0.463006, -0.7675708, -2.185388, 0, 1, 0.1176471, 1,
-0.4595184, 0.7529538, -0.712486, 0, 1, 0.1254902, 1,
-0.4588816, -0.7945791, -1.524731, 0, 1, 0.1294118, 1,
-0.4588463, 1.798573, -1.428816, 0, 1, 0.1372549, 1,
-0.4525703, -0.3364027, -3.017798, 0, 1, 0.1411765, 1,
-0.4517154, 0.1128107, -0.2387459, 0, 1, 0.1490196, 1,
-0.4516748, -1.563932, -3.257671, 0, 1, 0.1529412, 1,
-0.4456319, 0.6392651, 1.042906, 0, 1, 0.1607843, 1,
-0.4442825, -1.961106, -4.039009, 0, 1, 0.1647059, 1,
-0.4400125, 0.418857, -0.09988542, 0, 1, 0.172549, 1,
-0.4390445, 0.7079167, -0.5009042, 0, 1, 0.1764706, 1,
-0.4383078, 1.102997, -0.5811263, 0, 1, 0.1843137, 1,
-0.4376998, 1.521917, 0.3224986, 0, 1, 0.1882353, 1,
-0.4351847, -0.3309538, -0.7361945, 0, 1, 0.1960784, 1,
-0.4291848, 0.9012299, -0.9792483, 0, 1, 0.2039216, 1,
-0.4262436, 1.277908, -1.161993, 0, 1, 0.2078431, 1,
-0.422254, -0.1415634, -0.6658828, 0, 1, 0.2156863, 1,
-0.4109682, -1.759907, -3.479394, 0, 1, 0.2196078, 1,
-0.4106747, -0.09228618, -1.502504, 0, 1, 0.227451, 1,
-0.4102172, 1.96468, -0.8581223, 0, 1, 0.2313726, 1,
-0.4085866, 0.22231, 0.1015083, 0, 1, 0.2392157, 1,
-0.4066326, 0.1619344, -1.707294, 0, 1, 0.2431373, 1,
-0.4016711, -0.6267657, -0.1226862, 0, 1, 0.2509804, 1,
-0.3997218, 0.34015, -0.6978933, 0, 1, 0.254902, 1,
-0.3953139, 0.3215164, -2.045529, 0, 1, 0.2627451, 1,
-0.3908744, 0.2675802, -1.557926, 0, 1, 0.2666667, 1,
-0.3841728, 1.149488, -0.3147971, 0, 1, 0.2745098, 1,
-0.3838659, -1.943306, -2.924408, 0, 1, 0.2784314, 1,
-0.3768007, -0.831678, -1.923447, 0, 1, 0.2862745, 1,
-0.3681872, 0.6271592, -1.573464, 0, 1, 0.2901961, 1,
-0.3645632, -3.067644, -2.341255, 0, 1, 0.2980392, 1,
-0.3641885, -0.4100282, -2.688642, 0, 1, 0.3058824, 1,
-0.3632257, 0.1023789, -2.506265, 0, 1, 0.3098039, 1,
-0.361394, 1.166909, -0.3970939, 0, 1, 0.3176471, 1,
-0.348186, -0.2451048, -2.732975, 0, 1, 0.3215686, 1,
-0.3458568, -0.5703607, -2.043967, 0, 1, 0.3294118, 1,
-0.3454514, -1.113059, -2.474181, 0, 1, 0.3333333, 1,
-0.3395039, 0.6993688, -0.1828038, 0, 1, 0.3411765, 1,
-0.3371801, 0.7169044, -1.51809, 0, 1, 0.345098, 1,
-0.336654, -0.3226096, -3.625179, 0, 1, 0.3529412, 1,
-0.3366331, 1.155732, 0.2201896, 0, 1, 0.3568628, 1,
-0.3277893, 0.9053654, -0.4173664, 0, 1, 0.3647059, 1,
-0.3263745, -1.189341, -2.119251, 0, 1, 0.3686275, 1,
-0.3263302, -0.3128656, -1.16927, 0, 1, 0.3764706, 1,
-0.3114804, 0.5183541, -0.3472038, 0, 1, 0.3803922, 1,
-0.3099023, 1.418942, -0.4436052, 0, 1, 0.3882353, 1,
-0.3085891, -0.1020231, -3.305448, 0, 1, 0.3921569, 1,
-0.3045144, 0.4119621, -0.2340304, 0, 1, 0.4, 1,
-0.3030651, 0.03109677, -1.610041, 0, 1, 0.4078431, 1,
-0.3025089, 1.169969, -1.389513, 0, 1, 0.4117647, 1,
-0.2967216, 0.4350679, -0.303485, 0, 1, 0.4196078, 1,
-0.2940289, 1.893503, -1.786341, 0, 1, 0.4235294, 1,
-0.2932657, -0.2684253, -2.375856, 0, 1, 0.4313726, 1,
-0.2920626, 1.217098, 0.9643441, 0, 1, 0.4352941, 1,
-0.2906227, 0.2539658, -0.9695865, 0, 1, 0.4431373, 1,
-0.2880043, -1.690861, -2.577097, 0, 1, 0.4470588, 1,
-0.2878191, 1.230472, 0.4211796, 0, 1, 0.454902, 1,
-0.2807563, 1.543789, 0.2286739, 0, 1, 0.4588235, 1,
-0.2726938, 0.9544671, 0.1796514, 0, 1, 0.4666667, 1,
-0.2711171, 2.423381, -2.518567, 0, 1, 0.4705882, 1,
-0.2673344, -0.3730181, -2.464577, 0, 1, 0.4784314, 1,
-0.2658837, -2.003411, -2.674796, 0, 1, 0.4823529, 1,
-0.2650178, 0.1791133, -0.7005212, 0, 1, 0.4901961, 1,
-0.2636731, 0.6302971, 0.2477772, 0, 1, 0.4941176, 1,
-0.2563405, 0.09322631, -2.079016, 0, 1, 0.5019608, 1,
-0.2553648, -0.4681423, -1.802603, 0, 1, 0.509804, 1,
-0.2551841, -0.2564067, -3.040255, 0, 1, 0.5137255, 1,
-0.2510744, -0.9158522, -2.892088, 0, 1, 0.5215687, 1,
-0.2477679, 1.963509, 0.1608498, 0, 1, 0.5254902, 1,
-0.2409138, -1.436654, -4.071895, 0, 1, 0.5333334, 1,
-0.2399891, 0.8553407, 1.106822, 0, 1, 0.5372549, 1,
-0.2381755, 1.624123, 1.240672, 0, 1, 0.5450981, 1,
-0.2378969, -0.6066737, -2.252431, 0, 1, 0.5490196, 1,
-0.2323051, -1.032358, -4.383262, 0, 1, 0.5568628, 1,
-0.2321911, 1.448602, -0.9422792, 0, 1, 0.5607843, 1,
-0.2308951, 0.0667439, -0.3073803, 0, 1, 0.5686275, 1,
-0.2305829, 0.6999862, 0.5444955, 0, 1, 0.572549, 1,
-0.2266779, 1.193523, -0.6381025, 0, 1, 0.5803922, 1,
-0.2181951, -1.218806, -2.27253, 0, 1, 0.5843138, 1,
-0.217533, -0.04949702, -4.327005, 0, 1, 0.5921569, 1,
-0.215813, 2.190529, 0.5834088, 0, 1, 0.5960785, 1,
-0.214763, 0.258123, -1.252319, 0, 1, 0.6039216, 1,
-0.2096224, -0.6256493, -0.8305322, 0, 1, 0.6117647, 1,
-0.2071644, -0.6366658, -2.788803, 0, 1, 0.6156863, 1,
-0.2039275, 0.8144121, -1.150381, 0, 1, 0.6235294, 1,
-0.2002759, -2.869803, -2.861745, 0, 1, 0.627451, 1,
-0.1996384, -1.38485, -3.730412, 0, 1, 0.6352941, 1,
-0.1960284, 1.269946, -0.2651428, 0, 1, 0.6392157, 1,
-0.1953521, -1.351452, -4.372209, 0, 1, 0.6470588, 1,
-0.1952066, 0.005042761, -1.75025, 0, 1, 0.6509804, 1,
-0.1908194, -1.614123, -3.141814, 0, 1, 0.6588235, 1,
-0.1897548, 0.1850221, -0.8525497, 0, 1, 0.6627451, 1,
-0.1896482, 1.771932, -0.8386801, 0, 1, 0.6705883, 1,
-0.1882268, 1.316227, -0.2316751, 0, 1, 0.6745098, 1,
-0.1831157, -0.05711345, -2.384513, 0, 1, 0.682353, 1,
-0.1801757, 0.1923088, 0.2381992, 0, 1, 0.6862745, 1,
-0.1787575, 0.02942534, -1.480131, 0, 1, 0.6941177, 1,
-0.1779302, 0.8204401, -0.3595325, 0, 1, 0.7019608, 1,
-0.1761553, -2.06206, -3.490212, 0, 1, 0.7058824, 1,
-0.1668441, -0.1232326, -3.215557, 0, 1, 0.7137255, 1,
-0.1649664, -1.425653, -6.435844, 0, 1, 0.7176471, 1,
-0.1591427, -0.5319789, -3.412492, 0, 1, 0.7254902, 1,
-0.1583824, 1.928639, 0.1591419, 0, 1, 0.7294118, 1,
-0.1555759, -0.4132846, -2.999606, 0, 1, 0.7372549, 1,
-0.1499761, 1.023841, 0.3931367, 0, 1, 0.7411765, 1,
-0.1485744, -0.3015248, -2.477943, 0, 1, 0.7490196, 1,
-0.1387608, 0.88751, 0.7118474, 0, 1, 0.7529412, 1,
-0.1378458, 0.279419, -0.5338929, 0, 1, 0.7607843, 1,
-0.1374728, 0.8739332, -2.177431, 0, 1, 0.7647059, 1,
-0.1365004, -0.9124978, -2.572572, 0, 1, 0.772549, 1,
-0.1357638, 0.4943482, -1.110574, 0, 1, 0.7764706, 1,
-0.1338091, 0.9257776, 0.5041147, 0, 1, 0.7843137, 1,
-0.1291068, -0.905831, -4.940259, 0, 1, 0.7882353, 1,
-0.1288999, 0.1129027, -1.578796, 0, 1, 0.7960784, 1,
-0.1261947, 0.1476341, -0.5569755, 0, 1, 0.8039216, 1,
-0.1248844, -0.004965576, -0.09250943, 0, 1, 0.8078431, 1,
-0.1230553, -0.01736762, 0.8541391, 0, 1, 0.8156863, 1,
-0.1219412, 0.3861071, -1.767965, 0, 1, 0.8196079, 1,
-0.1196927, -0.3317603, -1.102264, 0, 1, 0.827451, 1,
-0.1193412, 0.8490901, -0.4051612, 0, 1, 0.8313726, 1,
-0.1182387, -1.965838, -1.951913, 0, 1, 0.8392157, 1,
-0.1165296, 0.06449495, -1.091988, 0, 1, 0.8431373, 1,
-0.1148285, -0.666835, -2.359701, 0, 1, 0.8509804, 1,
-0.1139757, 0.8977566, -0.8671976, 0, 1, 0.854902, 1,
-0.1125578, -1.384683, -3.136277, 0, 1, 0.8627451, 1,
-0.1124956, 1.923678, 0.009990169, 0, 1, 0.8666667, 1,
-0.1100886, 1.822762, 1.169984, 0, 1, 0.8745098, 1,
-0.1100441, -1.613452, -2.00405, 0, 1, 0.8784314, 1,
-0.108817, 0.26645, -0.2810073, 0, 1, 0.8862745, 1,
-0.1082855, -0.2690029, -3.522058, 0, 1, 0.8901961, 1,
-0.1063937, -0.2729734, -3.98856, 0, 1, 0.8980392, 1,
-0.1062603, -0.04710343, -2.410907, 0, 1, 0.9058824, 1,
-0.1055899, 0.04897514, -0.9616346, 0, 1, 0.9098039, 1,
-0.1047029, -0.4813287, -1.955949, 0, 1, 0.9176471, 1,
-0.1042234, 0.3668787, -0.916571, 0, 1, 0.9215686, 1,
-0.1021882, -1.656375, -2.49759, 0, 1, 0.9294118, 1,
-0.1014494, 0.892945, 0.8968513, 0, 1, 0.9333333, 1,
-0.1001053, 2.081913, 1.229433, 0, 1, 0.9411765, 1,
-0.09680777, -0.8498441, -3.827204, 0, 1, 0.945098, 1,
-0.09620114, 0.4166102, 1.744682, 0, 1, 0.9529412, 1,
-0.09611023, -1.26244, -3.148435, 0, 1, 0.9568627, 1,
-0.09586202, 1.232288, -0.3449302, 0, 1, 0.9647059, 1,
-0.0928513, -0.0269807, -4.034386, 0, 1, 0.9686275, 1,
-0.09020169, 0.3787944, 0.374627, 0, 1, 0.9764706, 1,
-0.08955082, 0.9452353, 1.516901, 0, 1, 0.9803922, 1,
-0.08853207, 0.7478699, 0.2965839, 0, 1, 0.9882353, 1,
-0.08302654, -1.232405, -4.977718, 0, 1, 0.9921569, 1,
-0.08235099, -1.419839, -5.154478, 0, 1, 1, 1,
-0.08184004, -0.2164196, -3.666217, 0, 0.9921569, 1, 1,
-0.07629128, 0.7844282, -0.522413, 0, 0.9882353, 1, 1,
-0.07388902, -1.02333, -2.911758, 0, 0.9803922, 1, 1,
-0.0729699, -0.3184427, -3.31221, 0, 0.9764706, 1, 1,
-0.07111545, 0.6927438, 0.09073243, 0, 0.9686275, 1, 1,
-0.06930178, -0.5754394, -3.119556, 0, 0.9647059, 1, 1,
-0.06457645, -0.6599954, -3.353218, 0, 0.9568627, 1, 1,
-0.06410587, -0.3348569, -5.069839, 0, 0.9529412, 1, 1,
-0.05746499, 0.6524822, -1.850387, 0, 0.945098, 1, 1,
-0.05518597, -0.3419822, -2.690127, 0, 0.9411765, 1, 1,
-0.05367433, 0.2937692, 1.153318, 0, 0.9333333, 1, 1,
-0.05235414, 0.2040221, 1.456452, 0, 0.9294118, 1, 1,
-0.05026336, 0.434646, 0.6310236, 0, 0.9215686, 1, 1,
-0.04732241, 0.4651261, 1.685849, 0, 0.9176471, 1, 1,
-0.04534452, 0.580892, 0.6567756, 0, 0.9098039, 1, 1,
-0.04501671, 0.5832034, -2.328186, 0, 0.9058824, 1, 1,
-0.04368016, -0.1261389, -0.9671676, 0, 0.8980392, 1, 1,
-0.0421182, 0.1051254, -0.4304638, 0, 0.8901961, 1, 1,
-0.03911491, 2.166499, -1.337548, 0, 0.8862745, 1, 1,
-0.03808173, 0.8269015, -0.774061, 0, 0.8784314, 1, 1,
-0.03601089, 0.3558128, -0.2238315, 0, 0.8745098, 1, 1,
-0.03117958, 0.4146309, -1.730347, 0, 0.8666667, 1, 1,
-0.02895723, 1.763371, 0.2627858, 0, 0.8627451, 1, 1,
-0.02885695, -0.724009, -4.09535, 0, 0.854902, 1, 1,
-0.02842593, 0.7697173, 0.8532283, 0, 0.8509804, 1, 1,
-0.02747795, 0.2363525, 0.827545, 0, 0.8431373, 1, 1,
-0.02472002, 0.7548599, 1.015798, 0, 0.8392157, 1, 1,
-0.01955128, -1.036067, -2.738941, 0, 0.8313726, 1, 1,
-0.01808635, -0.07900839, -4.61603, 0, 0.827451, 1, 1,
-0.01639569, 0.6610535, -1.202219, 0, 0.8196079, 1, 1,
-0.01604337, 0.6291594, -0.1669752, 0, 0.8156863, 1, 1,
-0.01578588, -0.7898831, -1.726673, 0, 0.8078431, 1, 1,
-0.01257422, -1.533379, -2.776288, 0, 0.8039216, 1, 1,
-0.01221483, -2.094692, -4.455651, 0, 0.7960784, 1, 1,
-0.01168683, 1.063588, 0.4340833, 0, 0.7882353, 1, 1,
-0.01013365, -0.1389892, -3.911807, 0, 0.7843137, 1, 1,
-0.008695431, -0.1766133, -3.525336, 0, 0.7764706, 1, 1,
-0.002802111, 0.7453249, 0.1830144, 0, 0.772549, 1, 1,
-0.001587877, -0.8172665, -2.109367, 0, 0.7647059, 1, 1,
0.003743615, 0.4491307, -0.07643993, 0, 0.7607843, 1, 1,
0.006654819, -0.04187939, 3.145381, 0, 0.7529412, 1, 1,
0.008561613, -1.061112, 4.76284, 0, 0.7490196, 1, 1,
0.01072744, 0.391559, -2.604037, 0, 0.7411765, 1, 1,
0.01601363, -0.2600904, 2.206976, 0, 0.7372549, 1, 1,
0.0172768, -0.4755598, 4.632343, 0, 0.7294118, 1, 1,
0.01964917, -0.2647546, 3.380884, 0, 0.7254902, 1, 1,
0.02018281, -0.9299143, 1.881016, 0, 0.7176471, 1, 1,
0.02365966, -1.455595, 3.675814, 0, 0.7137255, 1, 1,
0.02483671, 1.621402, 0.327771, 0, 0.7058824, 1, 1,
0.02724723, 0.1688327, -0.3830195, 0, 0.6980392, 1, 1,
0.02822624, 1.250231, 0.4549231, 0, 0.6941177, 1, 1,
0.02939323, 0.6729213, -1.253689, 0, 0.6862745, 1, 1,
0.03706438, 1.179156, -0.4275733, 0, 0.682353, 1, 1,
0.03738987, 0.7048155, -0.1881004, 0, 0.6745098, 1, 1,
0.03829212, -2.010892, 2.707258, 0, 0.6705883, 1, 1,
0.03918883, 1.630535, 0.03169951, 0, 0.6627451, 1, 1,
0.04085607, -1.903382, 2.644758, 0, 0.6588235, 1, 1,
0.04132188, 1.168002, -0.04850622, 0, 0.6509804, 1, 1,
0.04180195, 1.197014, -1.888253, 0, 0.6470588, 1, 1,
0.04402963, -0.1635288, 4.398853, 0, 0.6392157, 1, 1,
0.04478266, -0.6984505, 3.555045, 0, 0.6352941, 1, 1,
0.04565653, -0.06249445, 1.861124, 0, 0.627451, 1, 1,
0.05369103, 0.04852418, 2.033232, 0, 0.6235294, 1, 1,
0.05387924, -0.1085776, 2.429684, 0, 0.6156863, 1, 1,
0.0542329, -0.3121872, 2.207872, 0, 0.6117647, 1, 1,
0.06128581, 0.02074006, 2.039572, 0, 0.6039216, 1, 1,
0.0621173, 1.373506, 0.02454047, 0, 0.5960785, 1, 1,
0.06576694, 0.01424121, 1.375445, 0, 0.5921569, 1, 1,
0.06765665, 0.73905, -0.8176402, 0, 0.5843138, 1, 1,
0.06918215, 1.30997, 0.9949079, 0, 0.5803922, 1, 1,
0.07101885, 0.41007, 0.4618445, 0, 0.572549, 1, 1,
0.07162666, -0.1352518, 2.439666, 0, 0.5686275, 1, 1,
0.07384022, 0.2447519, 1.174041, 0, 0.5607843, 1, 1,
0.07945243, -0.3602724, 3.987456, 0, 0.5568628, 1, 1,
0.08006237, -0.4526955, 1.88693, 0, 0.5490196, 1, 1,
0.08448399, 0.1376222, 0.2626523, 0, 0.5450981, 1, 1,
0.08737913, -1.502854, 3.814582, 0, 0.5372549, 1, 1,
0.0898916, -0.9668506, 2.286992, 0, 0.5333334, 1, 1,
0.08996815, -0.2442531, 0.4633074, 0, 0.5254902, 1, 1,
0.09130292, -0.131512, 3.105006, 0, 0.5215687, 1, 1,
0.09313327, -1.110461, 5.508903, 0, 0.5137255, 1, 1,
0.09458192, -0.6557372, 1.470298, 0, 0.509804, 1, 1,
0.09495573, -0.2220029, 3.586003, 0, 0.5019608, 1, 1,
0.09566449, -1.154298, 0.764023, 0, 0.4941176, 1, 1,
0.09665922, 0.9455304, 0.4905075, 0, 0.4901961, 1, 1,
0.09691031, -2.802772, 3.218534, 0, 0.4823529, 1, 1,
0.09809365, -0.02846869, 1.352199, 0, 0.4784314, 1, 1,
0.09832452, 1.83894, -0.9926201, 0, 0.4705882, 1, 1,
0.101323, -1.076367, 2.395663, 0, 0.4666667, 1, 1,
0.1013238, -1.567717, 2.740652, 0, 0.4588235, 1, 1,
0.1027607, 0.8766515, 1.080506, 0, 0.454902, 1, 1,
0.1045791, 0.4693827, -0.5589603, 0, 0.4470588, 1, 1,
0.1075235, -0.1402277, 2.453306, 0, 0.4431373, 1, 1,
0.1121214, -0.3189166, 2.268526, 0, 0.4352941, 1, 1,
0.114716, -0.9367607, 3.798018, 0, 0.4313726, 1, 1,
0.1160735, -0.964581, 2.783205, 0, 0.4235294, 1, 1,
0.1214166, 0.5737348, 1.10207, 0, 0.4196078, 1, 1,
0.1242601, 0.784996, 0.7357281, 0, 0.4117647, 1, 1,
0.1251037, 0.2938555, 1.1973, 0, 0.4078431, 1, 1,
0.1277516, -0.05530551, 2.007087, 0, 0.4, 1, 1,
0.1277659, -2.628372, 2.762284, 0, 0.3921569, 1, 1,
0.1305915, 0.5103053, 0.6772406, 0, 0.3882353, 1, 1,
0.1325566, -1.209248, 2.811456, 0, 0.3803922, 1, 1,
0.1335475, -1.803741, 2.486158, 0, 0.3764706, 1, 1,
0.1337345, 2.103862, 0.6662812, 0, 0.3686275, 1, 1,
0.138731, 0.06728815, 1.003697, 0, 0.3647059, 1, 1,
0.1420639, 0.8755239, 0.901629, 0, 0.3568628, 1, 1,
0.1431643, 1.188635, 0.9313844, 0, 0.3529412, 1, 1,
0.1472617, 0.4257126, 0.7941402, 0, 0.345098, 1, 1,
0.1538166, 0.1408968, 1.062576, 0, 0.3411765, 1, 1,
0.1551485, -1.420823, 3.117826, 0, 0.3333333, 1, 1,
0.1589699, 0.07444514, 2.125806, 0, 0.3294118, 1, 1,
0.164477, -0.4411861, 4.999233, 0, 0.3215686, 1, 1,
0.1650553, -0.6909527, 4.043564, 0, 0.3176471, 1, 1,
0.1655647, 1.750598, 0.309303, 0, 0.3098039, 1, 1,
0.1659303, -0.3761998, 3.063365, 0, 0.3058824, 1, 1,
0.1726783, 0.9222342, -2.313354, 0, 0.2980392, 1, 1,
0.1739097, -0.1915798, 2.470849, 0, 0.2901961, 1, 1,
0.1751911, 1.771123, -2.456258, 0, 0.2862745, 1, 1,
0.1759356, -0.1669662, 3.754341, 0, 0.2784314, 1, 1,
0.1759608, -1.989699, 2.373623, 0, 0.2745098, 1, 1,
0.176727, 1.691925, 1.38347, 0, 0.2666667, 1, 1,
0.178975, 0.2985472, 1.089804, 0, 0.2627451, 1, 1,
0.1842292, 0.5223585, 0.2420084, 0, 0.254902, 1, 1,
0.1930877, -0.3377247, 2.366592, 0, 0.2509804, 1, 1,
0.2033942, -0.924679, 4.222418, 0, 0.2431373, 1, 1,
0.2042781, -0.08516272, 1.599935, 0, 0.2392157, 1, 1,
0.204646, -0.03114845, 2.425652, 0, 0.2313726, 1, 1,
0.2071459, -0.5107621, 2.394493, 0, 0.227451, 1, 1,
0.2093467, 2.326092, 1.552731, 0, 0.2196078, 1, 1,
0.2122347, 1.444969, 0.4566948, 0, 0.2156863, 1, 1,
0.215253, -0.4224366, 2.377074, 0, 0.2078431, 1, 1,
0.2185528, -1.345577, 2.611053, 0, 0.2039216, 1, 1,
0.2220833, -1.400196, 3.716882, 0, 0.1960784, 1, 1,
0.2279045, 0.4435036, 1.67594, 0, 0.1882353, 1, 1,
0.2310314, 0.5377127, 0.9941515, 0, 0.1843137, 1, 1,
0.231034, 0.4505502, -1.119492, 0, 0.1764706, 1, 1,
0.2382833, -1.020293, 3.869155, 0, 0.172549, 1, 1,
0.2431073, -0.2828602, 1.891406, 0, 0.1647059, 1, 1,
0.2446447, 0.8979025, 0.8256879, 0, 0.1607843, 1, 1,
0.2458471, 1.43332, 1.640969, 0, 0.1529412, 1, 1,
0.2476428, -1.582217, 3.335727, 0, 0.1490196, 1, 1,
0.2516919, -0.5149876, 2.937635, 0, 0.1411765, 1, 1,
0.2627864, -0.4571059, 3.274496, 0, 0.1372549, 1, 1,
0.266515, -0.2950179, 4.418467, 0, 0.1294118, 1, 1,
0.2704554, 0.5691586, -1.156013, 0, 0.1254902, 1, 1,
0.27162, -2.015599, 3.713936, 0, 0.1176471, 1, 1,
0.2722648, -0.4306006, 4.445642, 0, 0.1137255, 1, 1,
0.2729977, 0.3901325, 1.56345, 0, 0.1058824, 1, 1,
0.2730719, 0.002328916, 2.868824, 0, 0.09803922, 1, 1,
0.2742897, 1.309006, 0.9234446, 0, 0.09411765, 1, 1,
0.2764624, -0.9330071, 1.340522, 0, 0.08627451, 1, 1,
0.2771337, 0.7390515, 0.5592488, 0, 0.08235294, 1, 1,
0.2801916, 0.0717366, 2.426304, 0, 0.07450981, 1, 1,
0.2862108, -1.167211, 2.814773, 0, 0.07058824, 1, 1,
0.296279, -0.02641734, 0.5054743, 0, 0.0627451, 1, 1,
0.2964569, 1.415805, 0.7980729, 0, 0.05882353, 1, 1,
0.3031775, 1.011273, -0.3799679, 0, 0.05098039, 1, 1,
0.3042604, 1.266061, 0.7642576, 0, 0.04705882, 1, 1,
0.3108298, 0.559005, -0.351794, 0, 0.03921569, 1, 1,
0.3161746, 0.4028527, 0.4260859, 0, 0.03529412, 1, 1,
0.3165988, 1.650504, 1.030977, 0, 0.02745098, 1, 1,
0.3185307, 0.5884945, 0.7092205, 0, 0.02352941, 1, 1,
0.3186328, -0.9552981, 3.385378, 0, 0.01568628, 1, 1,
0.3190243, 0.6216339, -1.40809, 0, 0.01176471, 1, 1,
0.3243752, -0.509137, 1.750139, 0, 0.003921569, 1, 1,
0.32785, 0.4278876, 0.7658288, 0.003921569, 0, 1, 1,
0.3316154, 0.7261401, -0.2432401, 0.007843138, 0, 1, 1,
0.3321558, -1.079259, 1.922047, 0.01568628, 0, 1, 1,
0.3338128, 1.426525, -0.2940757, 0.01960784, 0, 1, 1,
0.337805, -1.750838, 1.72478, 0.02745098, 0, 1, 1,
0.3379961, 0.5631942, 0.04426606, 0.03137255, 0, 1, 1,
0.343187, -1.267732, 4.685955, 0.03921569, 0, 1, 1,
0.343662, -0.8549975, 4.729238, 0.04313726, 0, 1, 1,
0.3445999, 0.7950227, -0.8142719, 0.05098039, 0, 1, 1,
0.3477769, -0.2567419, 1.72728, 0.05490196, 0, 1, 1,
0.3489146, 0.1069071, 2.066849, 0.0627451, 0, 1, 1,
0.3516389, -1.011198, 3.772479, 0.06666667, 0, 1, 1,
0.3524427, -0.6114091, 2.464048, 0.07450981, 0, 1, 1,
0.3529288, 1.980124, 0.5132902, 0.07843138, 0, 1, 1,
0.3546907, -2.01568, 3.403579, 0.08627451, 0, 1, 1,
0.3548049, -0.2314725, 2.135486, 0.09019608, 0, 1, 1,
0.3570866, 0.1895713, 0.6312402, 0.09803922, 0, 1, 1,
0.3581013, 0.05366054, 1.438872, 0.1058824, 0, 1, 1,
0.3584507, 0.7933446, 1.551298, 0.1098039, 0, 1, 1,
0.3605028, -2.560067, 1.943607, 0.1176471, 0, 1, 1,
0.3670301, 0.6080482, 0.7565116, 0.1215686, 0, 1, 1,
0.367479, 0.0197209, 1.214498, 0.1294118, 0, 1, 1,
0.3682231, 0.2734271, 0.6229764, 0.1333333, 0, 1, 1,
0.3694445, 0.7337043, 0.6191967, 0.1411765, 0, 1, 1,
0.3869681, 1.298263, 0.9219846, 0.145098, 0, 1, 1,
0.3887905, -2.466735, 2.393477, 0.1529412, 0, 1, 1,
0.3934847, -0.5087916, 2.946041, 0.1568628, 0, 1, 1,
0.3951691, -1.476495, 3.395789, 0.1647059, 0, 1, 1,
0.3974009, -0.389663, 3.604183, 0.1686275, 0, 1, 1,
0.3984503, -0.6391901, 2.028623, 0.1764706, 0, 1, 1,
0.401709, -0.0796518, 1.442752, 0.1803922, 0, 1, 1,
0.4054359, 0.8030007, 0.1487097, 0.1882353, 0, 1, 1,
0.406473, 0.2319652, 0.6085604, 0.1921569, 0, 1, 1,
0.4095446, -0.4172526, 1.280766, 0.2, 0, 1, 1,
0.4101955, -1.796784, 1.366936, 0.2078431, 0, 1, 1,
0.410696, 0.636614, -0.5827715, 0.2117647, 0, 1, 1,
0.4131085, -0.6544605, 3.610919, 0.2196078, 0, 1, 1,
0.4142666, 0.2532995, 0.3534211, 0.2235294, 0, 1, 1,
0.4171352, -0.0124343, 0.1731858, 0.2313726, 0, 1, 1,
0.4268691, 1.653612, 0.5485633, 0.2352941, 0, 1, 1,
0.4280275, 0.3241225, 0.2919047, 0.2431373, 0, 1, 1,
0.4282428, -0.3172017, 1.226833, 0.2470588, 0, 1, 1,
0.4339035, 1.144681, -0.4369943, 0.254902, 0, 1, 1,
0.4339624, -1.786253, 3.90685, 0.2588235, 0, 1, 1,
0.4356509, -0.8983129, 2.297395, 0.2666667, 0, 1, 1,
0.4364812, -0.03635996, 0.3824522, 0.2705882, 0, 1, 1,
0.4419262, -0.9045849, 5.078831, 0.2784314, 0, 1, 1,
0.4430083, 1.191638, -0.04919223, 0.282353, 0, 1, 1,
0.4464634, 0.5208504, -0.09300974, 0.2901961, 0, 1, 1,
0.4483177, -0.2078167, 2.255428, 0.2941177, 0, 1, 1,
0.4491338, 0.5806013, 0.7862975, 0.3019608, 0, 1, 1,
0.4523305, 0.384107, 0.2682486, 0.3098039, 0, 1, 1,
0.4546102, -1.947616, 2.81806, 0.3137255, 0, 1, 1,
0.4549549, -0.3809194, 0.7600598, 0.3215686, 0, 1, 1,
0.4595146, -0.7667249, 2.846401, 0.3254902, 0, 1, 1,
0.4640782, 2.047089, 0.7216613, 0.3333333, 0, 1, 1,
0.4661315, 0.4733522, 0.923146, 0.3372549, 0, 1, 1,
0.46826, 0.209288, 0.6370463, 0.345098, 0, 1, 1,
0.4688733, 1.071981, -0.0721506, 0.3490196, 0, 1, 1,
0.4692882, -0.3435851, 2.136225, 0.3568628, 0, 1, 1,
0.4694631, 0.2946208, 0.0215526, 0.3607843, 0, 1, 1,
0.4719627, -0.5787213, 4.487856, 0.3686275, 0, 1, 1,
0.4742266, -0.01357198, 2.26136, 0.372549, 0, 1, 1,
0.4761236, 0.5491112, -1.406692, 0.3803922, 0, 1, 1,
0.4786134, -0.1350932, 2.123065, 0.3843137, 0, 1, 1,
0.4858356, 1.193361, 0.8065618, 0.3921569, 0, 1, 1,
0.4867966, -0.2258107, 2.148642, 0.3960784, 0, 1, 1,
0.4892363, -0.6436411, 3.157006, 0.4039216, 0, 1, 1,
0.4918313, 1.26945, 1.1976, 0.4117647, 0, 1, 1,
0.49223, -1.224097, 0.9406683, 0.4156863, 0, 1, 1,
0.4933332, -0.2436827, 0.7197356, 0.4235294, 0, 1, 1,
0.4945875, -1.681538, 3.627565, 0.427451, 0, 1, 1,
0.4946071, 0.63269, -0.2153717, 0.4352941, 0, 1, 1,
0.5063715, -1.057516, 2.0388, 0.4392157, 0, 1, 1,
0.5067565, 1.160851, 0.3632774, 0.4470588, 0, 1, 1,
0.5093995, 2.278085, 0.3084142, 0.4509804, 0, 1, 1,
0.5094686, 0.5574465, 0.004075381, 0.4588235, 0, 1, 1,
0.5116422, -0.4495034, 2.928151, 0.4627451, 0, 1, 1,
0.5147936, 2.077267, 3.001149, 0.4705882, 0, 1, 1,
0.5157068, 0.6388454, -1.30126, 0.4745098, 0, 1, 1,
0.5232306, -0.2949491, 1.100338, 0.4823529, 0, 1, 1,
0.5275334, -0.5482638, 2.84298, 0.4862745, 0, 1, 1,
0.5340437, 1.059759, 1.303346, 0.4941176, 0, 1, 1,
0.5370663, -1.600395, 1.538823, 0.5019608, 0, 1, 1,
0.537374, 1.249561, -0.4721239, 0.5058824, 0, 1, 1,
0.5387202, -0.6263345, 4.289664, 0.5137255, 0, 1, 1,
0.5462395, -0.1102803, 2.52311, 0.5176471, 0, 1, 1,
0.5518997, 0.9524267, 2.514335, 0.5254902, 0, 1, 1,
0.5553244, 1.154383, 0.5675325, 0.5294118, 0, 1, 1,
0.5683453, -1.549459, 2.338028, 0.5372549, 0, 1, 1,
0.5842117, 1.115639, 0.644373, 0.5411765, 0, 1, 1,
0.5844923, -0.9200379, 0.9911565, 0.5490196, 0, 1, 1,
0.5861904, -0.7381486, 1.639523, 0.5529412, 0, 1, 1,
0.587654, 1.065492, -0.4646284, 0.5607843, 0, 1, 1,
0.5899426, 0.9320824, 1.331943, 0.5647059, 0, 1, 1,
0.59036, -0.05606864, -0.1899937, 0.572549, 0, 1, 1,
0.5904335, -0.2710954, 0.5497317, 0.5764706, 0, 1, 1,
0.5910943, 1.395002, 0.0921587, 0.5843138, 0, 1, 1,
0.5943712, 1.541497, -0.3574564, 0.5882353, 0, 1, 1,
0.6078978, 1.459834, -0.4688833, 0.5960785, 0, 1, 1,
0.6172223, -1.171559, 2.575716, 0.6039216, 0, 1, 1,
0.6176999, 1.680743, -0.8805628, 0.6078432, 0, 1, 1,
0.6206295, -0.1044, 1.656437, 0.6156863, 0, 1, 1,
0.6251761, -0.5692067, 2.060723, 0.6196079, 0, 1, 1,
0.63074, 0.7064002, 1.299829, 0.627451, 0, 1, 1,
0.6333014, 1.735029, -1.885398, 0.6313726, 0, 1, 1,
0.6349868, -0.5575762, 3.107357, 0.6392157, 0, 1, 1,
0.6371322, 1.419639, 1.248102, 0.6431373, 0, 1, 1,
0.6379497, 0.1198768, 1.817835, 0.6509804, 0, 1, 1,
0.6435459, 0.7766675, -0.3904258, 0.654902, 0, 1, 1,
0.644484, 0.07250838, 2.531689, 0.6627451, 0, 1, 1,
0.6455465, -0.9331335, 2.882745, 0.6666667, 0, 1, 1,
0.652791, 0.6282767, -0.6976205, 0.6745098, 0, 1, 1,
0.6547018, 0.1952112, 2.875397, 0.6784314, 0, 1, 1,
0.6551459, -0.8754277, 2.71153, 0.6862745, 0, 1, 1,
0.6600133, 1.031815, 0.8240719, 0.6901961, 0, 1, 1,
0.6605307, -0.239546, 0.7606696, 0.6980392, 0, 1, 1,
0.661942, 1.597533, -1.469261, 0.7058824, 0, 1, 1,
0.6646917, 0.02944547, 1.22346, 0.7098039, 0, 1, 1,
0.669327, -1.24622, 3.966881, 0.7176471, 0, 1, 1,
0.676547, 1.228871, -0.4841396, 0.7215686, 0, 1, 1,
0.6813591, 0.4300966, 0.1509114, 0.7294118, 0, 1, 1,
0.6821269, -1.368832, 2.526951, 0.7333333, 0, 1, 1,
0.6871679, -0.9908851, 2.482594, 0.7411765, 0, 1, 1,
0.6892229, 0.07526754, 1.773622, 0.7450981, 0, 1, 1,
0.6892527, -0.5773643, 0.5725237, 0.7529412, 0, 1, 1,
0.6913828, -0.9963246, 2.567146, 0.7568628, 0, 1, 1,
0.6945139, 0.2499307, 0.8719232, 0.7647059, 0, 1, 1,
0.6951006, 0.1519845, 1.213951, 0.7686275, 0, 1, 1,
0.6983159, 3.052373, -0.1735116, 0.7764706, 0, 1, 1,
0.7030246, -0.03383611, 1.44952, 0.7803922, 0, 1, 1,
0.7060862, -0.2446949, 2.938662, 0.7882353, 0, 1, 1,
0.7083922, -0.4739902, 1.552184, 0.7921569, 0, 1, 1,
0.7107949, 0.5119795, 1.148039, 0.8, 0, 1, 1,
0.714264, -2.283056, 2.240764, 0.8078431, 0, 1, 1,
0.7159745, 0.446171, -0.5315336, 0.8117647, 0, 1, 1,
0.7230192, -0.4684611, 1.592183, 0.8196079, 0, 1, 1,
0.7335145, -0.07683183, 1.157547, 0.8235294, 0, 1, 1,
0.7360924, -0.6263809, 2.952773, 0.8313726, 0, 1, 1,
0.737482, -0.02141848, 2.35674, 0.8352941, 0, 1, 1,
0.7460131, 0.09250177, 3.036145, 0.8431373, 0, 1, 1,
0.7543718, -1.210433, 3.540678, 0.8470588, 0, 1, 1,
0.756614, -1.159179, 2.580136, 0.854902, 0, 1, 1,
0.7571298, -0.4166399, 2.377589, 0.8588235, 0, 1, 1,
0.7582526, -0.119491, 3.242507, 0.8666667, 0, 1, 1,
0.7592301, 0.1838411, 0.2896304, 0.8705882, 0, 1, 1,
0.761875, -0.7474995, 1.711885, 0.8784314, 0, 1, 1,
0.762636, -1.621967, 4.637374, 0.8823529, 0, 1, 1,
0.7725494, -0.6165088, 3.257151, 0.8901961, 0, 1, 1,
0.7788207, -0.5977343, 2.604064, 0.8941177, 0, 1, 1,
0.780508, 0.7256079, -0.8910758, 0.9019608, 0, 1, 1,
0.7868389, -0.8545871, 4.213196, 0.9098039, 0, 1, 1,
0.7883629, 0.4517387, 2.22106, 0.9137255, 0, 1, 1,
0.7904299, -0.300497, 1.195352, 0.9215686, 0, 1, 1,
0.7908595, -0.2484255, -0.02652551, 0.9254902, 0, 1, 1,
0.7918462, 0.7041886, -0.1520376, 0.9333333, 0, 1, 1,
0.7937872, 1.058797, 0.1785199, 0.9372549, 0, 1, 1,
0.7964978, 0.2210989, -0.6246479, 0.945098, 0, 1, 1,
0.7971858, 1.872236, -0.7798306, 0.9490196, 0, 1, 1,
0.8019973, -1.16062, 3.306276, 0.9568627, 0, 1, 1,
0.8025463, -0.4087076, 0.8031006, 0.9607843, 0, 1, 1,
0.8075491, -0.4188974, 2.372606, 0.9686275, 0, 1, 1,
0.8171722, 0.2455209, 1.177391, 0.972549, 0, 1, 1,
0.8182868, 0.6981867, 2.758236, 0.9803922, 0, 1, 1,
0.8194472, -0.4147945, 1.887961, 0.9843137, 0, 1, 1,
0.8233846, 0.3070478, 2.384741, 0.9921569, 0, 1, 1,
0.8284534, -0.2310457, 0.2942507, 0.9960784, 0, 1, 1,
0.8296284, -0.3544559, 0.3186703, 1, 0, 0.9960784, 1,
0.8301148, 0.6291773, 0.5712984, 1, 0, 0.9882353, 1,
0.8305583, 1.750115, -0.1768462, 1, 0, 0.9843137, 1,
0.8307093, 0.7482622, 0.7834354, 1, 0, 0.9764706, 1,
0.8360639, 0.7147243, 1.6205, 1, 0, 0.972549, 1,
0.8449978, -1.214387, 1.732578, 1, 0, 0.9647059, 1,
0.8498904, -0.7210612, 2.154311, 1, 0, 0.9607843, 1,
0.8526164, 1.453019, -0.3777415, 1, 0, 0.9529412, 1,
0.8548423, 0.9484997, -1.441973, 1, 0, 0.9490196, 1,
0.8645273, 0.1705644, 1.913466, 1, 0, 0.9411765, 1,
0.865945, 1.230553, 3.456974, 1, 0, 0.9372549, 1,
0.8683597, 1.114899, 0.6267071, 1, 0, 0.9294118, 1,
0.8713582, -0.4158391, 1.897129, 1, 0, 0.9254902, 1,
0.8796079, 0.8435804, 0.7852853, 1, 0, 0.9176471, 1,
0.9016022, -0.7631387, 1.430444, 1, 0, 0.9137255, 1,
0.9045309, -1.48394, 2.646938, 1, 0, 0.9058824, 1,
0.9068478, -0.7702621, 2.576907, 1, 0, 0.9019608, 1,
0.9075065, -1.039941, 0.8207952, 1, 0, 0.8941177, 1,
0.9096853, -0.7393534, 2.941902, 1, 0, 0.8862745, 1,
0.9155049, 0.7026352, 0.2629951, 1, 0, 0.8823529, 1,
0.9183958, -0.03832532, 1.45843, 1, 0, 0.8745098, 1,
0.9228482, -0.04026482, 2.512063, 1, 0, 0.8705882, 1,
0.9295254, -0.9723957, 1.972422, 1, 0, 0.8627451, 1,
0.9345059, -1.174679, 3.727489, 1, 0, 0.8588235, 1,
0.9359442, 0.8493381, 1.283831, 1, 0, 0.8509804, 1,
0.9387205, -0.1968667, 2.497235, 1, 0, 0.8470588, 1,
0.9499467, 0.1947461, 1.211018, 1, 0, 0.8392157, 1,
0.9589856, -1.429862, 2.047547, 1, 0, 0.8352941, 1,
0.9614588, 0.8213668, 0.9197446, 1, 0, 0.827451, 1,
0.9685583, 0.7303035, 0.879096, 1, 0, 0.8235294, 1,
0.9709069, 0.4528068, 2.079544, 1, 0, 0.8156863, 1,
0.9740593, 1.334248, -1.596939, 1, 0, 0.8117647, 1,
0.9744078, 1.824358, -0.6793348, 1, 0, 0.8039216, 1,
0.9785268, -1.275284, 1.391006, 1, 0, 0.7960784, 1,
0.9866189, -0.815506, 0.7907516, 1, 0, 0.7921569, 1,
0.9988347, -1.541473, 1.387402, 1, 0, 0.7843137, 1,
1.00263, -0.1464779, 0.6814373, 1, 0, 0.7803922, 1,
1.003677, 0.2100944, 0.9477208, 1, 0, 0.772549, 1,
1.013141, -0.7230746, 2.732008, 1, 0, 0.7686275, 1,
1.013923, -0.7510576, 1.511552, 1, 0, 0.7607843, 1,
1.017357, -0.2492555, 2.60059, 1, 0, 0.7568628, 1,
1.019701, -0.2414543, 2.684978, 1, 0, 0.7490196, 1,
1.020119, -0.1171393, 2.7866, 1, 0, 0.7450981, 1,
1.027498, 0.7953759, 0.05145852, 1, 0, 0.7372549, 1,
1.036679, 0.5976174, 0.1574682, 1, 0, 0.7333333, 1,
1.037355, -1.454362, 2.57163, 1, 0, 0.7254902, 1,
1.038183, 2.095058, -1.712021, 1, 0, 0.7215686, 1,
1.048695, -0.572646, 2.038438, 1, 0, 0.7137255, 1,
1.057786, -0.04847207, 2.808429, 1, 0, 0.7098039, 1,
1.06962, 0.1432873, 1.470038, 1, 0, 0.7019608, 1,
1.075447, -0.456266, 1.184497, 1, 0, 0.6941177, 1,
1.077089, -1.346143, 3.477054, 1, 0, 0.6901961, 1,
1.084341, 0.07926931, 1.174194, 1, 0, 0.682353, 1,
1.084487, -1.344385, 3.268718, 1, 0, 0.6784314, 1,
1.085627, -0.4420115, 1.274162, 1, 0, 0.6705883, 1,
1.090028, 0.2399838, 2.855527, 1, 0, 0.6666667, 1,
1.092128, 0.3606811, -0.2763752, 1, 0, 0.6588235, 1,
1.095091, -0.2511292, 2.828363, 1, 0, 0.654902, 1,
1.096338, -0.5910357, 2.448963, 1, 0, 0.6470588, 1,
1.102915, -1.651245, 2.506714, 1, 0, 0.6431373, 1,
1.118059, 0.1053499, 1.233606, 1, 0, 0.6352941, 1,
1.118341, -0.7675974, 2.454888, 1, 0, 0.6313726, 1,
1.127311, 0.7924294, 1.455764, 1, 0, 0.6235294, 1,
1.127343, 0.4592777, 1.528121, 1, 0, 0.6196079, 1,
1.127481, -1.899459, 3.690759, 1, 0, 0.6117647, 1,
1.135103, 0.7306641, -0.964905, 1, 0, 0.6078432, 1,
1.136236, -0.6818037, 1.30741, 1, 0, 0.6, 1,
1.143235, -1.196659, 3.067189, 1, 0, 0.5921569, 1,
1.143556, 0.5537616, 0.08629511, 1, 0, 0.5882353, 1,
1.166463, 0.6621679, 0.94459, 1, 0, 0.5803922, 1,
1.167475, 1.420439, 2.265438, 1, 0, 0.5764706, 1,
1.171104, 1.747465, -0.6674283, 1, 0, 0.5686275, 1,
1.171767, -0.05603715, 0.8612102, 1, 0, 0.5647059, 1,
1.17887, 0.4063322, 0.8788229, 1, 0, 0.5568628, 1,
1.183365, -0.1873248, -0.4293036, 1, 0, 0.5529412, 1,
1.187229, -2.215576, 3.090113, 1, 0, 0.5450981, 1,
1.187957, -1.034875, 1.626065, 1, 0, 0.5411765, 1,
1.189345, -1.946427, 2.258049, 1, 0, 0.5333334, 1,
1.191001, 2.172871, 0.2476105, 1, 0, 0.5294118, 1,
1.203306, -1.647502, 2.041191, 1, 0, 0.5215687, 1,
1.220557, -0.1311223, 0.4964515, 1, 0, 0.5176471, 1,
1.228162, -0.1590911, 0.5173416, 1, 0, 0.509804, 1,
1.229089, 1.88777, 1.734766, 1, 0, 0.5058824, 1,
1.235593, 1.444206, 0.7488348, 1, 0, 0.4980392, 1,
1.239226, 0.5449681, 1.55907, 1, 0, 0.4901961, 1,
1.242648, 0.3539455, 3.052696, 1, 0, 0.4862745, 1,
1.246377, -0.007879237, 2.414476, 1, 0, 0.4784314, 1,
1.251401, -0.4768232, 1.17735, 1, 0, 0.4745098, 1,
1.256158, -0.5789299, 3.496275, 1, 0, 0.4666667, 1,
1.261884, 0.3332204, 2.431656, 1, 0, 0.4627451, 1,
1.264509, -2.348518, 3.324425, 1, 0, 0.454902, 1,
1.272683, 0.6134255, 1.535784, 1, 0, 0.4509804, 1,
1.275191, 1.030686, 2.332826, 1, 0, 0.4431373, 1,
1.308314, 0.2284774, 2.434197, 1, 0, 0.4392157, 1,
1.313847, 0.3448393, 0.7888961, 1, 0, 0.4313726, 1,
1.328991, -2.227818, 1.15908, 1, 0, 0.427451, 1,
1.32931, -0.2645604, 0.6173736, 1, 0, 0.4196078, 1,
1.33331, -0.3755507, 1.493119, 1, 0, 0.4156863, 1,
1.346906, 0.19972, 3.748897, 1, 0, 0.4078431, 1,
1.347468, -1.086991, 4.505344, 1, 0, 0.4039216, 1,
1.349181, 0.5625684, 3.793444, 1, 0, 0.3960784, 1,
1.354574, -0.8662456, 3.569605, 1, 0, 0.3882353, 1,
1.372658, 0.1498018, 1.238411, 1, 0, 0.3843137, 1,
1.385303, -0.5601462, 1.261291, 1, 0, 0.3764706, 1,
1.391261, -0.5847061, 2.053887, 1, 0, 0.372549, 1,
1.413576, 0.1237039, 1.853668, 1, 0, 0.3647059, 1,
1.414358, 0.7095395, 0.3589804, 1, 0, 0.3607843, 1,
1.420664, -0.1124777, 1.103858, 1, 0, 0.3529412, 1,
1.43255, 0.1718171, 0.9279061, 1, 0, 0.3490196, 1,
1.432626, 0.478615, 1.221255, 1, 0, 0.3411765, 1,
1.453436, 1.844942, -0.2889362, 1, 0, 0.3372549, 1,
1.46509, -0.8195096, 0.1308936, 1, 0, 0.3294118, 1,
1.47269, 0.06961242, 2.252283, 1, 0, 0.3254902, 1,
1.485514, 1.098035, 1.276913, 1, 0, 0.3176471, 1,
1.519372, 0.9672624, 0.32846, 1, 0, 0.3137255, 1,
1.531813, 0.4054658, 1.715863, 1, 0, 0.3058824, 1,
1.54836, -0.7379967, 1.559502, 1, 0, 0.2980392, 1,
1.553002, 0.02004191, 3.062842, 1, 0, 0.2941177, 1,
1.570974, 0.09626513, 1.660562, 1, 0, 0.2862745, 1,
1.573005, -1.555738, 2.859613, 1, 0, 0.282353, 1,
1.579306, -0.3404943, 2.07948, 1, 0, 0.2745098, 1,
1.580228, -0.3287208, 0.8175585, 1, 0, 0.2705882, 1,
1.603692, 1.397951, 0.1879404, 1, 0, 0.2627451, 1,
1.644089, -0.4441558, 2.535856, 1, 0, 0.2588235, 1,
1.655078, -0.567272, 2.710613, 1, 0, 0.2509804, 1,
1.681738, -0.6075704, 2.939395, 1, 0, 0.2470588, 1,
1.704222, 0.7284977, 1.520584, 1, 0, 0.2392157, 1,
1.719124, -0.3740848, 1.814495, 1, 0, 0.2352941, 1,
1.727896, -0.670188, 2.460664, 1, 0, 0.227451, 1,
1.748494, -1.326751, 1.963513, 1, 0, 0.2235294, 1,
1.7595, -0.9145652, 1.721724, 1, 0, 0.2156863, 1,
1.766996, 0.1237702, 3.789762, 1, 0, 0.2117647, 1,
1.770389, 0.009445755, 0.5928621, 1, 0, 0.2039216, 1,
1.776498, -0.2050616, 2.231418, 1, 0, 0.1960784, 1,
1.777048, 0.9577553, 1.149733, 1, 0, 0.1921569, 1,
1.805363, -0.3928956, 1.777277, 1, 0, 0.1843137, 1,
1.847302, 1.08468, 1.494462, 1, 0, 0.1803922, 1,
1.847513, 2.121816, 0.2406105, 1, 0, 0.172549, 1,
1.85139, 0.7288672, -0.2023839, 1, 0, 0.1686275, 1,
1.868939, -0.06403609, 2.674464, 1, 0, 0.1607843, 1,
1.888545, -1.328159, 1.288121, 1, 0, 0.1568628, 1,
1.891133, -0.4807315, 3.089296, 1, 0, 0.1490196, 1,
1.903479, 0.2792542, 2.254833, 1, 0, 0.145098, 1,
1.925294, 0.7625486, 2.433369, 1, 0, 0.1372549, 1,
1.942762, 0.1146023, 2.424178, 1, 0, 0.1333333, 1,
1.950345, 0.01879535, 2.004869, 1, 0, 0.1254902, 1,
2.020908, -0.5677649, 0.1427454, 1, 0, 0.1215686, 1,
2.03789, 1.058257, 1.791013, 1, 0, 0.1137255, 1,
2.049612, 0.6190236, -0.3316568, 1, 0, 0.1098039, 1,
2.118044, 1.284244, -0.2474165, 1, 0, 0.1019608, 1,
2.142436, -0.4936422, 4.030522, 1, 0, 0.09411765, 1,
2.146677, -1.82273, 2.890224, 1, 0, 0.09019608, 1,
2.147858, -0.5008809, 1.571576, 1, 0, 0.08235294, 1,
2.19018, -0.4564014, 1.204701, 1, 0, 0.07843138, 1,
2.191087, -0.1866355, 1.237668, 1, 0, 0.07058824, 1,
2.216594, -0.8159025, 2.426696, 1, 0, 0.06666667, 1,
2.231344, -0.4570959, 0.4224956, 1, 0, 0.05882353, 1,
2.280475, -1.562533, 1.229691, 1, 0, 0.05490196, 1,
2.503674, -1.502691, 3.643928, 1, 0, 0.04705882, 1,
2.60597, -0.8787888, 2.430961, 1, 0, 0.04313726, 1,
2.622397, 0.1813613, 3.03368, 1, 0, 0.03529412, 1,
2.656003, 1.190026, 1.252463, 1, 0, 0.03137255, 1,
2.855258, 1.354622, -0.2074769, 1, 0, 0.02352941, 1,
2.914031, -0.7974282, 1.505594, 1, 0, 0.01960784, 1,
2.976583, 0.06921525, 0.9581401, 1, 0, 0.01176471, 1,
3.127856, -0.2057186, 2.283206, 1, 0, 0.007843138, 1
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
0.04479909, -4.287465, -8.460479, 0, -0.5, 0.5, 0.5,
0.04479909, -4.287465, -8.460479, 1, -0.5, 0.5, 0.5,
0.04479909, -4.287465, -8.460479, 1, 1.5, 0.5, 0.5,
0.04479909, -4.287465, -8.460479, 0, 1.5, 0.5, 0.5
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
-4.083415, -0.08565092, -8.460479, 0, -0.5, 0.5, 0.5,
-4.083415, -0.08565092, -8.460479, 1, -0.5, 0.5, 0.5,
-4.083415, -0.08565092, -8.460479, 1, 1.5, 0.5, 0.5,
-4.083415, -0.08565092, -8.460479, 0, 1.5, 0.5, 0.5
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
-4.083415, -4.287465, -0.4634709, 0, -0.5, 0.5, 0.5,
-4.083415, -4.287465, -0.4634709, 1, -0.5, 0.5, 0.5,
-4.083415, -4.287465, -0.4634709, 1, 1.5, 0.5, 0.5,
-4.083415, -4.287465, -0.4634709, 0, 1.5, 0.5, 0.5
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
-3, -3.317816, -6.615016,
3, -3.317816, -6.615016,
-3, -3.317816, -6.615016,
-3, -3.479424, -6.922593,
-2, -3.317816, -6.615016,
-2, -3.479424, -6.922593,
-1, -3.317816, -6.615016,
-1, -3.479424, -6.922593,
0, -3.317816, -6.615016,
0, -3.479424, -6.922593,
1, -3.317816, -6.615016,
1, -3.479424, -6.922593,
2, -3.317816, -6.615016,
2, -3.479424, -6.922593,
3, -3.317816, -6.615016,
3, -3.479424, -6.922593
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
-3, -3.80264, -7.537747, 0, -0.5, 0.5, 0.5,
-3, -3.80264, -7.537747, 1, -0.5, 0.5, 0.5,
-3, -3.80264, -7.537747, 1, 1.5, 0.5, 0.5,
-3, -3.80264, -7.537747, 0, 1.5, 0.5, 0.5,
-2, -3.80264, -7.537747, 0, -0.5, 0.5, 0.5,
-2, -3.80264, -7.537747, 1, -0.5, 0.5, 0.5,
-2, -3.80264, -7.537747, 1, 1.5, 0.5, 0.5,
-2, -3.80264, -7.537747, 0, 1.5, 0.5, 0.5,
-1, -3.80264, -7.537747, 0, -0.5, 0.5, 0.5,
-1, -3.80264, -7.537747, 1, -0.5, 0.5, 0.5,
-1, -3.80264, -7.537747, 1, 1.5, 0.5, 0.5,
-1, -3.80264, -7.537747, 0, 1.5, 0.5, 0.5,
0, -3.80264, -7.537747, 0, -0.5, 0.5, 0.5,
0, -3.80264, -7.537747, 1, -0.5, 0.5, 0.5,
0, -3.80264, -7.537747, 1, 1.5, 0.5, 0.5,
0, -3.80264, -7.537747, 0, 1.5, 0.5, 0.5,
1, -3.80264, -7.537747, 0, -0.5, 0.5, 0.5,
1, -3.80264, -7.537747, 1, -0.5, 0.5, 0.5,
1, -3.80264, -7.537747, 1, 1.5, 0.5, 0.5,
1, -3.80264, -7.537747, 0, 1.5, 0.5, 0.5,
2, -3.80264, -7.537747, 0, -0.5, 0.5, 0.5,
2, -3.80264, -7.537747, 1, -0.5, 0.5, 0.5,
2, -3.80264, -7.537747, 1, 1.5, 0.5, 0.5,
2, -3.80264, -7.537747, 0, 1.5, 0.5, 0.5,
3, -3.80264, -7.537747, 0, -0.5, 0.5, 0.5,
3, -3.80264, -7.537747, 1, -0.5, 0.5, 0.5,
3, -3.80264, -7.537747, 1, 1.5, 0.5, 0.5,
3, -3.80264, -7.537747, 0, 1.5, 0.5, 0.5
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
-3.13075, -3, -6.615016,
-3.13075, 3, -6.615016,
-3.13075, -3, -6.615016,
-3.289527, -3, -6.922593,
-3.13075, -2, -6.615016,
-3.289527, -2, -6.922593,
-3.13075, -1, -6.615016,
-3.289527, -1, -6.922593,
-3.13075, 0, -6.615016,
-3.289527, 0, -6.922593,
-3.13075, 1, -6.615016,
-3.289527, 1, -6.922593,
-3.13075, 2, -6.615016,
-3.289527, 2, -6.922593,
-3.13075, 3, -6.615016,
-3.289527, 3, -6.922593
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
-3.607082, -3, -7.537747, 0, -0.5, 0.5, 0.5,
-3.607082, -3, -7.537747, 1, -0.5, 0.5, 0.5,
-3.607082, -3, -7.537747, 1, 1.5, 0.5, 0.5,
-3.607082, -3, -7.537747, 0, 1.5, 0.5, 0.5,
-3.607082, -2, -7.537747, 0, -0.5, 0.5, 0.5,
-3.607082, -2, -7.537747, 1, -0.5, 0.5, 0.5,
-3.607082, -2, -7.537747, 1, 1.5, 0.5, 0.5,
-3.607082, -2, -7.537747, 0, 1.5, 0.5, 0.5,
-3.607082, -1, -7.537747, 0, -0.5, 0.5, 0.5,
-3.607082, -1, -7.537747, 1, -0.5, 0.5, 0.5,
-3.607082, -1, -7.537747, 1, 1.5, 0.5, 0.5,
-3.607082, -1, -7.537747, 0, 1.5, 0.5, 0.5,
-3.607082, 0, -7.537747, 0, -0.5, 0.5, 0.5,
-3.607082, 0, -7.537747, 1, -0.5, 0.5, 0.5,
-3.607082, 0, -7.537747, 1, 1.5, 0.5, 0.5,
-3.607082, 0, -7.537747, 0, 1.5, 0.5, 0.5,
-3.607082, 1, -7.537747, 0, -0.5, 0.5, 0.5,
-3.607082, 1, -7.537747, 1, -0.5, 0.5, 0.5,
-3.607082, 1, -7.537747, 1, 1.5, 0.5, 0.5,
-3.607082, 1, -7.537747, 0, 1.5, 0.5, 0.5,
-3.607082, 2, -7.537747, 0, -0.5, 0.5, 0.5,
-3.607082, 2, -7.537747, 1, -0.5, 0.5, 0.5,
-3.607082, 2, -7.537747, 1, 1.5, 0.5, 0.5,
-3.607082, 2, -7.537747, 0, 1.5, 0.5, 0.5,
-3.607082, 3, -7.537747, 0, -0.5, 0.5, 0.5,
-3.607082, 3, -7.537747, 1, -0.5, 0.5, 0.5,
-3.607082, 3, -7.537747, 1, 1.5, 0.5, 0.5,
-3.607082, 3, -7.537747, 0, 1.5, 0.5, 0.5
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
-3.13075, -3.317816, -6,
-3.13075, -3.317816, 4,
-3.13075, -3.317816, -6,
-3.289527, -3.479424, -6,
-3.13075, -3.317816, -4,
-3.289527, -3.479424, -4,
-3.13075, -3.317816, -2,
-3.289527, -3.479424, -2,
-3.13075, -3.317816, 0,
-3.289527, -3.479424, 0,
-3.13075, -3.317816, 2,
-3.289527, -3.479424, 2,
-3.13075, -3.317816, 4,
-3.289527, -3.479424, 4
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
-3.607082, -3.80264, -6, 0, -0.5, 0.5, 0.5,
-3.607082, -3.80264, -6, 1, -0.5, 0.5, 0.5,
-3.607082, -3.80264, -6, 1, 1.5, 0.5, 0.5,
-3.607082, -3.80264, -6, 0, 1.5, 0.5, 0.5,
-3.607082, -3.80264, -4, 0, -0.5, 0.5, 0.5,
-3.607082, -3.80264, -4, 1, -0.5, 0.5, 0.5,
-3.607082, -3.80264, -4, 1, 1.5, 0.5, 0.5,
-3.607082, -3.80264, -4, 0, 1.5, 0.5, 0.5,
-3.607082, -3.80264, -2, 0, -0.5, 0.5, 0.5,
-3.607082, -3.80264, -2, 1, -0.5, 0.5, 0.5,
-3.607082, -3.80264, -2, 1, 1.5, 0.5, 0.5,
-3.607082, -3.80264, -2, 0, 1.5, 0.5, 0.5,
-3.607082, -3.80264, 0, 0, -0.5, 0.5, 0.5,
-3.607082, -3.80264, 0, 1, -0.5, 0.5, 0.5,
-3.607082, -3.80264, 0, 1, 1.5, 0.5, 0.5,
-3.607082, -3.80264, 0, 0, 1.5, 0.5, 0.5,
-3.607082, -3.80264, 2, 0, -0.5, 0.5, 0.5,
-3.607082, -3.80264, 2, 1, -0.5, 0.5, 0.5,
-3.607082, -3.80264, 2, 1, 1.5, 0.5, 0.5,
-3.607082, -3.80264, 2, 0, 1.5, 0.5, 0.5,
-3.607082, -3.80264, 4, 0, -0.5, 0.5, 0.5,
-3.607082, -3.80264, 4, 1, -0.5, 0.5, 0.5,
-3.607082, -3.80264, 4, 1, 1.5, 0.5, 0.5,
-3.607082, -3.80264, 4, 0, 1.5, 0.5, 0.5
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
-3.13075, -3.317816, -6.615016,
-3.13075, 3.146514, -6.615016,
-3.13075, -3.317816, 5.688074,
-3.13075, 3.146514, 5.688074,
-3.13075, -3.317816, -6.615016,
-3.13075, -3.317816, 5.688074,
-3.13075, 3.146514, -6.615016,
-3.13075, 3.146514, 5.688074,
-3.13075, -3.317816, -6.615016,
3.220348, -3.317816, -6.615016,
-3.13075, -3.317816, 5.688074,
3.220348, -3.317816, 5.688074,
-3.13075, 3.146514, -6.615016,
3.220348, 3.146514, -6.615016,
-3.13075, 3.146514, 5.688074,
3.220348, 3.146514, 5.688074,
3.220348, -3.317816, -6.615016,
3.220348, 3.146514, -6.615016,
3.220348, -3.317816, 5.688074,
3.220348, 3.146514, 5.688074,
3.220348, -3.317816, -6.615016,
3.220348, -3.317816, 5.688074,
3.220348, 3.146514, -6.615016,
3.220348, 3.146514, 5.688074
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
var radius = 8.159426;
var distance = 36.30221;
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
mvMatrix.translate( -0.04479909, 0.08565092, 0.4634709 );
mvMatrix.scale( 1.389072, 1.36474, 0.7170663 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.30221);
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
Dimethoxon<-read.table("Dimethoxon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dimethoxon$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dimethoxon' not found
```

```r
y<-Dimethoxon$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dimethoxon' not found
```

```r
z<-Dimethoxon$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dimethoxon' not found
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
-3.038258, -0.3180813, -1.003047, 0, 0, 1, 1, 1,
-2.895539, 0.8993621, 1.375734, 1, 0, 0, 1, 1,
-2.715089, -0.4277287, -1.553359, 1, 0, 0, 1, 1,
-2.675037, -0.9219743, -1.779865, 1, 0, 0, 1, 1,
-2.563521, 0.9305792, 0.09502689, 1, 0, 0, 1, 1,
-2.561961, -1.163914, -3.547831, 1, 0, 0, 1, 1,
-2.500242, 1.752512, 0.3802319, 0, 0, 0, 1, 1,
-2.499209, 0.8162624, -0.8360319, 0, 0, 0, 1, 1,
-2.327028, 1.255231, 0.1645014, 0, 0, 0, 1, 1,
-2.302358, 1.194913, -2.03993, 0, 0, 0, 1, 1,
-2.245637, -0.1230746, -1.978567, 0, 0, 0, 1, 1,
-2.205184, 0.391608, -2.399822, 0, 0, 0, 1, 1,
-2.133169, 1.857396, 0.3833097, 0, 0, 0, 1, 1,
-2.089766, 0.1238152, -1.104379, 1, 1, 1, 1, 1,
-2.063984, 1.779623, -0.6811464, 1, 1, 1, 1, 1,
-2.036732, 1.057533, -2.048735, 1, 1, 1, 1, 1,
-2.030932, -0.5123973, -2.730103, 1, 1, 1, 1, 1,
-2.023062, -0.466892, -2.328138, 1, 1, 1, 1, 1,
-1.974473, -1.827933, -2.67006, 1, 1, 1, 1, 1,
-1.969622, -1.432966, -0.9426569, 1, 1, 1, 1, 1,
-1.942301, -0.1949637, -3.01588, 1, 1, 1, 1, 1,
-1.939338, -1.081218, -3.513683, 1, 1, 1, 1, 1,
-1.938067, 0.7749248, -1.316073, 1, 1, 1, 1, 1,
-1.933027, 0.3633281, -2.017129, 1, 1, 1, 1, 1,
-1.844512, -0.4218836, -0.5949386, 1, 1, 1, 1, 1,
-1.840916, -0.5543851, -1.804794, 1, 1, 1, 1, 1,
-1.830837, 3.050984, -0.9688604, 1, 1, 1, 1, 1,
-1.791449, 0.7697632, -2.382667, 1, 1, 1, 1, 1,
-1.790086, -0.07885403, -2.571709, 0, 0, 1, 1, 1,
-1.779377, -0.9849299, -3.338003, 1, 0, 0, 1, 1,
-1.779014, -0.424676, -2.214086, 1, 0, 0, 1, 1,
-1.777867, 0.7412925, -0.6609057, 1, 0, 0, 1, 1,
-1.727203, -2.038886, -3.202055, 1, 0, 0, 1, 1,
-1.72566, 0.5799391, -1.849433, 1, 0, 0, 1, 1,
-1.705589, 0.3100726, -2.562675, 0, 0, 0, 1, 1,
-1.703424, -0.1233533, -0.5804243, 0, 0, 0, 1, 1,
-1.701668, -1.09358, -1.803217, 0, 0, 0, 1, 1,
-1.691723, -0.4266017, -1.707917, 0, 0, 0, 1, 1,
-1.688795, -1.089145, -0.791503, 0, 0, 0, 1, 1,
-1.671782, 1.672622, -0.5793922, 0, 0, 0, 1, 1,
-1.66041, -1.531782, -1.113074, 0, 0, 0, 1, 1,
-1.654693, 0.74725, -3.165474, 1, 1, 1, 1, 1,
-1.652886, -1.651502, -1.509066, 1, 1, 1, 1, 1,
-1.638032, -0.904494, -4.345837, 1, 1, 1, 1, 1,
-1.637848, -2.119992, -3.843246, 1, 1, 1, 1, 1,
-1.623638, -0.2347653, -1.359244, 1, 1, 1, 1, 1,
-1.616239, 0.225059, -1.615828, 1, 1, 1, 1, 1,
-1.603115, 0.6332121, -1.421622, 1, 1, 1, 1, 1,
-1.584186, 0.1335839, -1.415013, 1, 1, 1, 1, 1,
-1.583918, -1.285247, -0.6575067, 1, 1, 1, 1, 1,
-1.57319, -0.3330949, -1.741109, 1, 1, 1, 1, 1,
-1.573094, 0.2482921, -0.4589612, 1, 1, 1, 1, 1,
-1.543321, 1.738802, -0.9524597, 1, 1, 1, 1, 1,
-1.542988, 1.873577, 1.09033, 1, 1, 1, 1, 1,
-1.521542, 0.9300825, -1.813339, 1, 1, 1, 1, 1,
-1.515523, 0.08893519, -2.365537, 1, 1, 1, 1, 1,
-1.501938, 0.2846959, -0.3565166, 0, 0, 1, 1, 1,
-1.494825, -0.4598244, -3.002621, 1, 0, 0, 1, 1,
-1.483798, 0.6975575, -0.9909563, 1, 0, 0, 1, 1,
-1.464911, -0.4923717, -4.289145, 1, 0, 0, 1, 1,
-1.454539, 0.1782958, -0.278638, 1, 0, 0, 1, 1,
-1.446342, -0.7805746, -2.413722, 1, 0, 0, 1, 1,
-1.442912, 1.870135, -0.03819437, 0, 0, 0, 1, 1,
-1.442247, 0.4759261, 0.1447249, 0, 0, 0, 1, 1,
-1.436826, 0.4153211, -0.7008932, 0, 0, 0, 1, 1,
-1.435919, 1.017728, -2.12786, 0, 0, 0, 1, 1,
-1.424651, -0.7556986, -3.212277, 0, 0, 0, 1, 1,
-1.422092, 0.5566871, -0.8365549, 0, 0, 0, 1, 1,
-1.420635, 0.4606055, -3.474174, 0, 0, 0, 1, 1,
-1.42006, 0.3727157, -1.399508, 1, 1, 1, 1, 1,
-1.417458, 0.5078804, -0.983367, 1, 1, 1, 1, 1,
-1.414331, 0.4609073, -1.553309, 1, 1, 1, 1, 1,
-1.39377, -0.4136965, -2.823879, 1, 1, 1, 1, 1,
-1.380498, -1.743973, -1.387253, 1, 1, 1, 1, 1,
-1.37881, -0.5246266, -3.074559, 1, 1, 1, 1, 1,
-1.366219, -1.571108, -1.339631, 1, 1, 1, 1, 1,
-1.36298, -0.8661413, -3.123407, 1, 1, 1, 1, 1,
-1.357701, -0.4920458, -1.625903, 1, 1, 1, 1, 1,
-1.357267, -0.5493374, -1.420263, 1, 1, 1, 1, 1,
-1.35199, -0.6393594, -0.07032208, 1, 1, 1, 1, 1,
-1.351248, 0.6388276, -1.579282, 1, 1, 1, 1, 1,
-1.337758, -1.17184, -3.826702, 1, 1, 1, 1, 1,
-1.331409, -0.3127528, -1.823116, 1, 1, 1, 1, 1,
-1.327994, -3.223675, -1.400752, 1, 1, 1, 1, 1,
-1.327926, 1.575934, 0.1791532, 0, 0, 1, 1, 1,
-1.325324, 1.449222, -2.040723, 1, 0, 0, 1, 1,
-1.323307, -0.136335, -2.759319, 1, 0, 0, 1, 1,
-1.317468, 1.273405, -0.01452683, 1, 0, 0, 1, 1,
-1.309168, -0.3425316, -3.476557, 1, 0, 0, 1, 1,
-1.307926, 0.19855, -1.624068, 1, 0, 0, 1, 1,
-1.291347, 1.631677, 0.6580029, 0, 0, 0, 1, 1,
-1.291157, 0.512875, -1.707364, 0, 0, 0, 1, 1,
-1.285095, 0.1409715, -1.442237, 0, 0, 0, 1, 1,
-1.283072, -0.2379721, -1.93734, 0, 0, 0, 1, 1,
-1.279734, 0.4316993, -1.622279, 0, 0, 0, 1, 1,
-1.279163, -0.0729491, -2.748142, 0, 0, 0, 1, 1,
-1.275309, -0.7004137, -0.893801, 0, 0, 0, 1, 1,
-1.257757, -0.834783, -1.632103, 1, 1, 1, 1, 1,
-1.23842, 0.5480153, -0.08594364, 1, 1, 1, 1, 1,
-1.236625, 1.459051, -0.7508748, 1, 1, 1, 1, 1,
-1.230863, -0.5151081, -2.595376, 1, 1, 1, 1, 1,
-1.223142, -1.112401, -2.499078, 1, 1, 1, 1, 1,
-1.219733, -0.6268134, -1.636772, 1, 1, 1, 1, 1,
-1.210984, -1.091772, -1.297007, 1, 1, 1, 1, 1,
-1.209343, -0.1080356, -1.427929, 1, 1, 1, 1, 1,
-1.206637, 1.289569, -0.4260231, 1, 1, 1, 1, 1,
-1.205115, 0.6967641, -0.7039013, 1, 1, 1, 1, 1,
-1.200869, 0.8401266, -0.395773, 1, 1, 1, 1, 1,
-1.195391, -0.8552154, -3.614389, 1, 1, 1, 1, 1,
-1.191674, 0.26895, -2.61799, 1, 1, 1, 1, 1,
-1.185417, -0.1024013, -3.160271, 1, 1, 1, 1, 1,
-1.184825, -0.4360996, -0.333378, 1, 1, 1, 1, 1,
-1.162472, -0.6162175, -2.702996, 0, 0, 1, 1, 1,
-1.162179, -0.0003639257, -1.532438, 1, 0, 0, 1, 1,
-1.147944, 2.160825, 0.4089136, 1, 0, 0, 1, 1,
-1.145027, -0.6189327, -2.222726, 1, 0, 0, 1, 1,
-1.144902, 0.9090573, -0.2892889, 1, 0, 0, 1, 1,
-1.14034, -0.300541, -0.4549103, 1, 0, 0, 1, 1,
-1.137165, 0.7088786, -1.009607, 0, 0, 0, 1, 1,
-1.137134, 0.4650499, -1.469994, 0, 0, 0, 1, 1,
-1.135074, -0.05568161, -1.272002, 0, 0, 0, 1, 1,
-1.127748, 0.4110863, 0.0722642, 0, 0, 0, 1, 1,
-1.124693, 1.483293, -0.6728843, 0, 0, 0, 1, 1,
-1.113355, 0.5059317, -2.1659, 0, 0, 0, 1, 1,
-1.099596, 0.8926139, 0.5151125, 0, 0, 0, 1, 1,
-1.097461, 0.6616122, -1.721282, 1, 1, 1, 1, 1,
-1.088759, 1.345569, -2.29577, 1, 1, 1, 1, 1,
-1.088561, 0.6475433, -0.6529519, 1, 1, 1, 1, 1,
-1.082982, -0.9765049, -2.151242, 1, 1, 1, 1, 1,
-1.076658, -1.277451, -0.9534324, 1, 1, 1, 1, 1,
-1.071115, -0.3427514, -0.2597074, 1, 1, 1, 1, 1,
-1.065827, 0.8561962, 0.2864792, 1, 1, 1, 1, 1,
-1.063998, 0.6581689, 0.5803075, 1, 1, 1, 1, 1,
-1.063873, 0.703085, -0.7328948, 1, 1, 1, 1, 1,
-1.061649, -0.5691271, -1.742178, 1, 1, 1, 1, 1,
-1.059818, -1.268907, -1.032638, 1, 1, 1, 1, 1,
-1.059155, 1.109495, 0.3609464, 1, 1, 1, 1, 1,
-1.058565, -0.2794805, -1.845002, 1, 1, 1, 1, 1,
-1.051168, 0.0257204, -2.536799, 1, 1, 1, 1, 1,
-1.050701, -0.8336233, -2.480754, 1, 1, 1, 1, 1,
-1.047095, -0.0904484, -2.450583, 0, 0, 1, 1, 1,
-1.044295, 1.111316, -1.831282, 1, 0, 0, 1, 1,
-1.03786, 0.2679272, -0.3830371, 1, 0, 0, 1, 1,
-1.037026, 0.7739967, -1.600882, 1, 0, 0, 1, 1,
-1.034525, -0.0004465286, -1.258679, 1, 0, 0, 1, 1,
-1.029837, 0.3488388, -0.4897442, 1, 0, 0, 1, 1,
-1.021004, -0.3494813, -2.160942, 0, 0, 0, 1, 1,
-1.020135, 1.974212, -0.8003972, 0, 0, 0, 1, 1,
-1.019897, 0.7876686, 0.7189316, 0, 0, 0, 1, 1,
-1.01944, 1.364826, -0.7313625, 0, 0, 0, 1, 1,
-1.013427, -1.179309, -1.45512, 0, 0, 0, 1, 1,
-1.010382, -0.4830908, -3.168942, 0, 0, 0, 1, 1,
-0.9996234, -0.2282527, -2.330328, 0, 0, 0, 1, 1,
-0.9963802, 0.1725153, -2.874829, 1, 1, 1, 1, 1,
-0.9944773, 0.2848253, -1.425704, 1, 1, 1, 1, 1,
-0.9919318, -1.378364, -2.888371, 1, 1, 1, 1, 1,
-0.9860033, 0.3334084, -1.488449, 1, 1, 1, 1, 1,
-0.9848586, -0.7111541, -2.472116, 1, 1, 1, 1, 1,
-0.9812692, 0.4660859, 1.108495, 1, 1, 1, 1, 1,
-0.9796097, -0.5637503, -0.1769284, 1, 1, 1, 1, 1,
-0.9787076, 1.388124, -0.4903064, 1, 1, 1, 1, 1,
-0.9775475, -0.4505583, -2.575948, 1, 1, 1, 1, 1,
-0.9756545, 1.044683, -0.1421497, 1, 1, 1, 1, 1,
-0.9744257, -0.5204945, -1.271186, 1, 1, 1, 1, 1,
-0.9665361, 1.423017, -1.230127, 1, 1, 1, 1, 1,
-0.9627469, -0.5636713, -2.251749, 1, 1, 1, 1, 1,
-0.9560128, -0.3309033, -1.695794, 1, 1, 1, 1, 1,
-0.9524273, -0.4331318, -2.423625, 1, 1, 1, 1, 1,
-0.9524252, 0.3012861, -0.6965167, 0, 0, 1, 1, 1,
-0.9510831, -0.7574157, -2.549784, 1, 0, 0, 1, 1,
-0.937834, -0.06340071, -2.635174, 1, 0, 0, 1, 1,
-0.9371189, -1.285881, -3.14632, 1, 0, 0, 1, 1,
-0.9325973, 0.4814059, -3.860901, 1, 0, 0, 1, 1,
-0.9307038, -0.5608425, -2.843247, 1, 0, 0, 1, 1,
-0.9305682, 1.44049, -1.795881, 0, 0, 0, 1, 1,
-0.9268466, -0.5062876, -2.683249, 0, 0, 0, 1, 1,
-0.9229861, -0.4114542, -1.770058, 0, 0, 0, 1, 1,
-0.9213797, -0.05548942, -2.978461, 0, 0, 0, 1, 1,
-0.9202477, -1.078438, -0.3944874, 0, 0, 0, 1, 1,
-0.9197772, -1.175545, -3.182872, 0, 0, 0, 1, 1,
-0.9168723, 1.12884, -1.358493, 0, 0, 0, 1, 1,
-0.916419, 0.5422888, -1.309718, 1, 1, 1, 1, 1,
-0.9162357, -0.09858785, -2.65442, 1, 1, 1, 1, 1,
-0.9145598, -0.3467932, -2.702691, 1, 1, 1, 1, 1,
-0.9136556, -0.6113514, -1.542053, 1, 1, 1, 1, 1,
-0.9123505, 0.2723351, -2.034852, 1, 1, 1, 1, 1,
-0.9104636, -0.8357461, -1.474021, 1, 1, 1, 1, 1,
-0.9063395, -0.2145824, -1.540279, 1, 1, 1, 1, 1,
-0.9047616, -2.247118, -3.028825, 1, 1, 1, 1, 1,
-0.9045076, -0.4801985, -3.633601, 1, 1, 1, 1, 1,
-0.9031164, -0.5738205, -1.870371, 1, 1, 1, 1, 1,
-0.8935992, 1.237858, -1.517062, 1, 1, 1, 1, 1,
-0.8931457, -0.3673843, -1.021209, 1, 1, 1, 1, 1,
-0.8930139, -0.8529276, -2.339718, 1, 1, 1, 1, 1,
-0.8924921, -0.9715132, -2.595449, 1, 1, 1, 1, 1,
-0.8924448, 1.242087, -2.96915, 1, 1, 1, 1, 1,
-0.8904094, -0.4596018, -2.793748, 0, 0, 1, 1, 1,
-0.8886133, 1.355024, 0.2890078, 1, 0, 0, 1, 1,
-0.8865412, -0.4162491, -0.6876471, 1, 0, 0, 1, 1,
-0.8857805, 0.5650954, -0.4368077, 1, 0, 0, 1, 1,
-0.8814057, -0.8032149, -1.914868, 1, 0, 0, 1, 1,
-0.8810624, -1.663581, -2.504767, 1, 0, 0, 1, 1,
-0.8740921, 1.025562, -0.9689943, 0, 0, 0, 1, 1,
-0.8719956, 1.144809, -1.266137, 0, 0, 0, 1, 1,
-0.867954, -1.463395, -2.793705, 0, 0, 0, 1, 1,
-0.8655951, -0.2489257, -0.05371129, 0, 0, 0, 1, 1,
-0.8640265, -0.2701314, -2.928082, 0, 0, 0, 1, 1,
-0.8609079, -0.3095482, -1.361068, 0, 0, 0, 1, 1,
-0.8572441, 1.360289, 0.7797253, 0, 0, 0, 1, 1,
-0.8546711, -1.231831, -1.804527, 1, 1, 1, 1, 1,
-0.8513488, -0.935738, -2.961792, 1, 1, 1, 1, 1,
-0.8504606, -0.8644951, -2.364403, 1, 1, 1, 1, 1,
-0.8483415, -0.5613729, -2.89853, 1, 1, 1, 1, 1,
-0.8474509, 0.6119697, -0.1159089, 1, 1, 1, 1, 1,
-0.8453333, 2.098811, -0.6712919, 1, 1, 1, 1, 1,
-0.8442186, -1.051071, -0.9430396, 1, 1, 1, 1, 1,
-0.839852, -0.2973414, -1.543062, 1, 1, 1, 1, 1,
-0.8373104, -0.5582917, -2.603651, 1, 1, 1, 1, 1,
-0.8333381, -1.862008, -2.642911, 1, 1, 1, 1, 1,
-0.8315722, 0.3562005, -2.598411, 1, 1, 1, 1, 1,
-0.8268576, -0.9687458, -0.1424767, 1, 1, 1, 1, 1,
-0.8230288, 0.2510017, -3.590047, 1, 1, 1, 1, 1,
-0.8225403, -0.03246003, -1.686298, 1, 1, 1, 1, 1,
-0.8225239, -1.206836, -2.713099, 1, 1, 1, 1, 1,
-0.8198445, 0.5034111, -1.541444, 0, 0, 1, 1, 1,
-0.8167108, 0.6856226, -1.042761, 1, 0, 0, 1, 1,
-0.8144485, 0.06992318, -0.7813388, 1, 0, 0, 1, 1,
-0.8023366, 1.624473, -0.904162, 1, 0, 0, 1, 1,
-0.799837, -0.7389313, -4.11809, 1, 0, 0, 1, 1,
-0.7996813, -0.1773235, -3.645122, 1, 0, 0, 1, 1,
-0.7951998, -2.108576, -3.180531, 0, 0, 0, 1, 1,
-0.7928175, 0.3979268, 1.124948, 0, 0, 0, 1, 1,
-0.7799809, -0.3176662, -0.9037837, 0, 0, 0, 1, 1,
-0.7783703, -0.9745443, -2.069906, 0, 0, 0, 1, 1,
-0.7737813, -0.6434041, -2.702194, 0, 0, 0, 1, 1,
-0.7726427, 1.024414, -1.246559, 0, 0, 0, 1, 1,
-0.7714672, 0.7642417, -0.5300808, 0, 0, 0, 1, 1,
-0.7697365, 1.831994, -2.032364, 1, 1, 1, 1, 1,
-0.763895, 0.3170408, -0.4925176, 1, 1, 1, 1, 1,
-0.7615999, -2.415861, -2.558383, 1, 1, 1, 1, 1,
-0.7555647, -0.1090194, -0.493619, 1, 1, 1, 1, 1,
-0.7542377, -0.1825355, -3.101415, 1, 1, 1, 1, 1,
-0.7536097, -0.3129619, -1.643221, 1, 1, 1, 1, 1,
-0.7504208, -0.2932394, -2.18174, 1, 1, 1, 1, 1,
-0.7496417, 0.9128505, 0.5411494, 1, 1, 1, 1, 1,
-0.7452992, 1.888978, -0.1567075, 1, 1, 1, 1, 1,
-0.7393025, -0.4777823, -3.454169, 1, 1, 1, 1, 1,
-0.7383575, -0.4496311, -2.637387, 1, 1, 1, 1, 1,
-0.7376752, 0.7893305, 0.4839553, 1, 1, 1, 1, 1,
-0.7361445, -0.6135263, -2.313939, 1, 1, 1, 1, 1,
-0.7360698, -0.7759832, -0.5716102, 1, 1, 1, 1, 1,
-0.7348754, -0.9838726, -2.295131, 1, 1, 1, 1, 1,
-0.7325613, 0.7440935, -2.212665, 0, 0, 1, 1, 1,
-0.7323005, 0.2477943, -1.243596, 1, 0, 0, 1, 1,
-0.7290777, 0.1103441, -2.108436, 1, 0, 0, 1, 1,
-0.7230246, -0.7911688, -2.030107, 1, 0, 0, 1, 1,
-0.721212, 0.5203172, -0.4058952, 1, 0, 0, 1, 1,
-0.7183276, 0.7758285, -2.299806, 1, 0, 0, 1, 1,
-0.7076734, 0.8080273, -0.6082302, 0, 0, 0, 1, 1,
-0.6839132, 0.4981213, -1.987545, 0, 0, 0, 1, 1,
-0.6818693, 2.064082, -0.6115064, 0, 0, 0, 1, 1,
-0.6801811, 0.1843445, -1.001636, 0, 0, 0, 1, 1,
-0.6788973, 0.4720063, -0.5279886, 0, 0, 0, 1, 1,
-0.6787573, -0.6873719, -1.181377, 0, 0, 0, 1, 1,
-0.6742846, -0.3791749, -0.8410375, 0, 0, 0, 1, 1,
-0.6690283, 0.6176806, -1.565535, 1, 1, 1, 1, 1,
-0.6687027, 0.1694188, 0.1061635, 1, 1, 1, 1, 1,
-0.6662117, -0.08893894, 0.9145267, 1, 1, 1, 1, 1,
-0.6652685, 0.5638866, -1.754591, 1, 1, 1, 1, 1,
-0.6637231, 2.15145, -0.9893684, 1, 1, 1, 1, 1,
-0.6633578, -1.480448, -2.428041, 1, 1, 1, 1, 1,
-0.6631038, 0.5910133, -0.8649428, 1, 1, 1, 1, 1,
-0.6603127, 0.6496032, -1.602624, 1, 1, 1, 1, 1,
-0.658806, -1.605267, -3.395602, 1, 1, 1, 1, 1,
-0.6507107, 0.4115919, -0.5419659, 1, 1, 1, 1, 1,
-0.6503602, 1.153702, -2.039977, 1, 1, 1, 1, 1,
-0.6428462, -1.36634, -2.128849, 1, 1, 1, 1, 1,
-0.6412508, -0.8530421, -2.420603, 1, 1, 1, 1, 1,
-0.6391209, -1.032416, -2.666833, 1, 1, 1, 1, 1,
-0.6374051, -0.1244893, -1.948346, 1, 1, 1, 1, 1,
-0.6319842, -0.8821048, -3.423624, 0, 0, 1, 1, 1,
-0.6257422, 1.492866, -1.040773, 1, 0, 0, 1, 1,
-0.6224113, -0.00210904, -2.967898, 1, 0, 0, 1, 1,
-0.6200928, 0.1633262, -1.068783, 1, 0, 0, 1, 1,
-0.6166676, -0.4978802, -1.033433, 1, 0, 0, 1, 1,
-0.6158154, 1.578959, 0.4951514, 1, 0, 0, 1, 1,
-0.6115609, -0.5495061, -1.943016, 0, 0, 0, 1, 1,
-0.6100464, 0.3176937, -1.191236, 0, 0, 0, 1, 1,
-0.6073605, 0.950573, -0.9744031, 0, 0, 0, 1, 1,
-0.6060663, -1.421591, -2.188349, 0, 0, 0, 1, 1,
-0.6037296, 2.292492, -0.07201917, 0, 0, 0, 1, 1,
-0.5995715, -1.281579, -3.536381, 0, 0, 0, 1, 1,
-0.5953611, 0.2727953, -0.1572306, 0, 0, 0, 1, 1,
-0.5903036, 0.8613048, -0.5923362, 1, 1, 1, 1, 1,
-0.5902866, -0.2420226, -1.820739, 1, 1, 1, 1, 1,
-0.5897426, -0.5240209, -2.786882, 1, 1, 1, 1, 1,
-0.5882544, 2.297091, -1.205329, 1, 1, 1, 1, 1,
-0.5867226, 0.6812866, 0.8508962, 1, 1, 1, 1, 1,
-0.581811, -0.6839018, -2.950505, 1, 1, 1, 1, 1,
-0.5755404, -1.11599, -4.219592, 1, 1, 1, 1, 1,
-0.5740149, -1.942243, -0.9385342, 1, 1, 1, 1, 1,
-0.5710918, -1.032032, -2.067655, 1, 1, 1, 1, 1,
-0.564139, -0.3085282, -4.045653, 1, 1, 1, 1, 1,
-0.5640261, -0.49615, -2.357109, 1, 1, 1, 1, 1,
-0.5635165, 1.927936, -0.5389898, 1, 1, 1, 1, 1,
-0.559359, 0.3336246, -2.216695, 1, 1, 1, 1, 1,
-0.5547473, -1.267083, -3.236359, 1, 1, 1, 1, 1,
-0.5515919, -0.4838634, -2.882514, 1, 1, 1, 1, 1,
-0.550624, 0.4566503, -0.8381538, 0, 0, 1, 1, 1,
-0.5498558, 0.1242674, -0.7545868, 1, 0, 0, 1, 1,
-0.5491822, 1.187548, 0.3590231, 1, 0, 0, 1, 1,
-0.547688, -0.738516, -1.926773, 1, 0, 0, 1, 1,
-0.5472773, 0.571628, -0.9576762, 1, 0, 0, 1, 1,
-0.546275, 1.120877, -1.042057, 1, 0, 0, 1, 1,
-0.544262, 0.5023071, -1.730394, 0, 0, 0, 1, 1,
-0.5438902, 0.7166253, -0.7404465, 0, 0, 0, 1, 1,
-0.5429147, 0.3952872, -2.389351, 0, 0, 0, 1, 1,
-0.5425965, -0.451565, -3.153779, 0, 0, 0, 1, 1,
-0.5411906, 2.176762, -0.7219248, 0, 0, 0, 1, 1,
-0.5391749, -0.05857382, -2.956577, 0, 0, 0, 1, 1,
-0.5350175, -0.08625369, -0.9607279, 0, 0, 0, 1, 1,
-0.5327118, 1.531832, -0.1153748, 1, 1, 1, 1, 1,
-0.5321025, -2.058825, -2.306262, 1, 1, 1, 1, 1,
-0.5312423, 0.07639852, -1.061741, 1, 1, 1, 1, 1,
-0.5295653, -1.23113, -4.277214, 1, 1, 1, 1, 1,
-0.5210752, -0.3120691, -1.67709, 1, 1, 1, 1, 1,
-0.5165735, 0.1100201, -1.544454, 1, 1, 1, 1, 1,
-0.5135104, 0.02720586, -1.912066, 1, 1, 1, 1, 1,
-0.512118, -0.9135782, -4.344642, 1, 1, 1, 1, 1,
-0.5113489, 2.379508, 0.07379562, 1, 1, 1, 1, 1,
-0.5082811, -1.425589, -2.313186, 1, 1, 1, 1, 1,
-0.5066087, 0.1580894, -1.212919, 1, 1, 1, 1, 1,
-0.5060961, 0.738781, 0.006806206, 1, 1, 1, 1, 1,
-0.505888, 0.1776714, -0.8745618, 1, 1, 1, 1, 1,
-0.4997498, 1.374714, -0.6582654, 1, 1, 1, 1, 1,
-0.4988651, -1.526023, -3.329843, 1, 1, 1, 1, 1,
-0.4930966, 0.003214741, -0.0575345, 0, 0, 1, 1, 1,
-0.4917442, 1.548617, -0.8217742, 1, 0, 0, 1, 1,
-0.4892251, 1.396677, -0.01178117, 1, 0, 0, 1, 1,
-0.485334, -1.325529, -3.121322, 1, 0, 0, 1, 1,
-0.4846884, -0.7817361, -2.800007, 1, 0, 0, 1, 1,
-0.4817052, 0.834089, -1.25625, 1, 0, 0, 1, 1,
-0.4812591, 0.2949414, 0.9088476, 0, 0, 0, 1, 1,
-0.4765061, 0.8079723, -0.6179842, 0, 0, 0, 1, 1,
-0.4756516, 0.1935021, -0.4656251, 0, 0, 0, 1, 1,
-0.4743586, 2.476482, 0.3213907, 0, 0, 0, 1, 1,
-0.4728279, -1.040228, -2.153297, 0, 0, 0, 1, 1,
-0.4722068, 0.9294914, 0.7340595, 0, 0, 0, 1, 1,
-0.4715703, 0.1921067, -1.014858, 0, 0, 0, 1, 1,
-0.4681495, -0.5403364, -3.710401, 1, 1, 1, 1, 1,
-0.4656529, 1.120204, 0.4276391, 1, 1, 1, 1, 1,
-0.4655278, 0.6290544, -1.158303, 1, 1, 1, 1, 1,
-0.4634556, 1.830314, -0.3274045, 1, 1, 1, 1, 1,
-0.463006, -0.7675708, -2.185388, 1, 1, 1, 1, 1,
-0.4595184, 0.7529538, -0.712486, 1, 1, 1, 1, 1,
-0.4588816, -0.7945791, -1.524731, 1, 1, 1, 1, 1,
-0.4588463, 1.798573, -1.428816, 1, 1, 1, 1, 1,
-0.4525703, -0.3364027, -3.017798, 1, 1, 1, 1, 1,
-0.4517154, 0.1128107, -0.2387459, 1, 1, 1, 1, 1,
-0.4516748, -1.563932, -3.257671, 1, 1, 1, 1, 1,
-0.4456319, 0.6392651, 1.042906, 1, 1, 1, 1, 1,
-0.4442825, -1.961106, -4.039009, 1, 1, 1, 1, 1,
-0.4400125, 0.418857, -0.09988542, 1, 1, 1, 1, 1,
-0.4390445, 0.7079167, -0.5009042, 1, 1, 1, 1, 1,
-0.4383078, 1.102997, -0.5811263, 0, 0, 1, 1, 1,
-0.4376998, 1.521917, 0.3224986, 1, 0, 0, 1, 1,
-0.4351847, -0.3309538, -0.7361945, 1, 0, 0, 1, 1,
-0.4291848, 0.9012299, -0.9792483, 1, 0, 0, 1, 1,
-0.4262436, 1.277908, -1.161993, 1, 0, 0, 1, 1,
-0.422254, -0.1415634, -0.6658828, 1, 0, 0, 1, 1,
-0.4109682, -1.759907, -3.479394, 0, 0, 0, 1, 1,
-0.4106747, -0.09228618, -1.502504, 0, 0, 0, 1, 1,
-0.4102172, 1.96468, -0.8581223, 0, 0, 0, 1, 1,
-0.4085866, 0.22231, 0.1015083, 0, 0, 0, 1, 1,
-0.4066326, 0.1619344, -1.707294, 0, 0, 0, 1, 1,
-0.4016711, -0.6267657, -0.1226862, 0, 0, 0, 1, 1,
-0.3997218, 0.34015, -0.6978933, 0, 0, 0, 1, 1,
-0.3953139, 0.3215164, -2.045529, 1, 1, 1, 1, 1,
-0.3908744, 0.2675802, -1.557926, 1, 1, 1, 1, 1,
-0.3841728, 1.149488, -0.3147971, 1, 1, 1, 1, 1,
-0.3838659, -1.943306, -2.924408, 1, 1, 1, 1, 1,
-0.3768007, -0.831678, -1.923447, 1, 1, 1, 1, 1,
-0.3681872, 0.6271592, -1.573464, 1, 1, 1, 1, 1,
-0.3645632, -3.067644, -2.341255, 1, 1, 1, 1, 1,
-0.3641885, -0.4100282, -2.688642, 1, 1, 1, 1, 1,
-0.3632257, 0.1023789, -2.506265, 1, 1, 1, 1, 1,
-0.361394, 1.166909, -0.3970939, 1, 1, 1, 1, 1,
-0.348186, -0.2451048, -2.732975, 1, 1, 1, 1, 1,
-0.3458568, -0.5703607, -2.043967, 1, 1, 1, 1, 1,
-0.3454514, -1.113059, -2.474181, 1, 1, 1, 1, 1,
-0.3395039, 0.6993688, -0.1828038, 1, 1, 1, 1, 1,
-0.3371801, 0.7169044, -1.51809, 1, 1, 1, 1, 1,
-0.336654, -0.3226096, -3.625179, 0, 0, 1, 1, 1,
-0.3366331, 1.155732, 0.2201896, 1, 0, 0, 1, 1,
-0.3277893, 0.9053654, -0.4173664, 1, 0, 0, 1, 1,
-0.3263745, -1.189341, -2.119251, 1, 0, 0, 1, 1,
-0.3263302, -0.3128656, -1.16927, 1, 0, 0, 1, 1,
-0.3114804, 0.5183541, -0.3472038, 1, 0, 0, 1, 1,
-0.3099023, 1.418942, -0.4436052, 0, 0, 0, 1, 1,
-0.3085891, -0.1020231, -3.305448, 0, 0, 0, 1, 1,
-0.3045144, 0.4119621, -0.2340304, 0, 0, 0, 1, 1,
-0.3030651, 0.03109677, -1.610041, 0, 0, 0, 1, 1,
-0.3025089, 1.169969, -1.389513, 0, 0, 0, 1, 1,
-0.2967216, 0.4350679, -0.303485, 0, 0, 0, 1, 1,
-0.2940289, 1.893503, -1.786341, 0, 0, 0, 1, 1,
-0.2932657, -0.2684253, -2.375856, 1, 1, 1, 1, 1,
-0.2920626, 1.217098, 0.9643441, 1, 1, 1, 1, 1,
-0.2906227, 0.2539658, -0.9695865, 1, 1, 1, 1, 1,
-0.2880043, -1.690861, -2.577097, 1, 1, 1, 1, 1,
-0.2878191, 1.230472, 0.4211796, 1, 1, 1, 1, 1,
-0.2807563, 1.543789, 0.2286739, 1, 1, 1, 1, 1,
-0.2726938, 0.9544671, 0.1796514, 1, 1, 1, 1, 1,
-0.2711171, 2.423381, -2.518567, 1, 1, 1, 1, 1,
-0.2673344, -0.3730181, -2.464577, 1, 1, 1, 1, 1,
-0.2658837, -2.003411, -2.674796, 1, 1, 1, 1, 1,
-0.2650178, 0.1791133, -0.7005212, 1, 1, 1, 1, 1,
-0.2636731, 0.6302971, 0.2477772, 1, 1, 1, 1, 1,
-0.2563405, 0.09322631, -2.079016, 1, 1, 1, 1, 1,
-0.2553648, -0.4681423, -1.802603, 1, 1, 1, 1, 1,
-0.2551841, -0.2564067, -3.040255, 1, 1, 1, 1, 1,
-0.2510744, -0.9158522, -2.892088, 0, 0, 1, 1, 1,
-0.2477679, 1.963509, 0.1608498, 1, 0, 0, 1, 1,
-0.2409138, -1.436654, -4.071895, 1, 0, 0, 1, 1,
-0.2399891, 0.8553407, 1.106822, 1, 0, 0, 1, 1,
-0.2381755, 1.624123, 1.240672, 1, 0, 0, 1, 1,
-0.2378969, -0.6066737, -2.252431, 1, 0, 0, 1, 1,
-0.2323051, -1.032358, -4.383262, 0, 0, 0, 1, 1,
-0.2321911, 1.448602, -0.9422792, 0, 0, 0, 1, 1,
-0.2308951, 0.0667439, -0.3073803, 0, 0, 0, 1, 1,
-0.2305829, 0.6999862, 0.5444955, 0, 0, 0, 1, 1,
-0.2266779, 1.193523, -0.6381025, 0, 0, 0, 1, 1,
-0.2181951, -1.218806, -2.27253, 0, 0, 0, 1, 1,
-0.217533, -0.04949702, -4.327005, 0, 0, 0, 1, 1,
-0.215813, 2.190529, 0.5834088, 1, 1, 1, 1, 1,
-0.214763, 0.258123, -1.252319, 1, 1, 1, 1, 1,
-0.2096224, -0.6256493, -0.8305322, 1, 1, 1, 1, 1,
-0.2071644, -0.6366658, -2.788803, 1, 1, 1, 1, 1,
-0.2039275, 0.8144121, -1.150381, 1, 1, 1, 1, 1,
-0.2002759, -2.869803, -2.861745, 1, 1, 1, 1, 1,
-0.1996384, -1.38485, -3.730412, 1, 1, 1, 1, 1,
-0.1960284, 1.269946, -0.2651428, 1, 1, 1, 1, 1,
-0.1953521, -1.351452, -4.372209, 1, 1, 1, 1, 1,
-0.1952066, 0.005042761, -1.75025, 1, 1, 1, 1, 1,
-0.1908194, -1.614123, -3.141814, 1, 1, 1, 1, 1,
-0.1897548, 0.1850221, -0.8525497, 1, 1, 1, 1, 1,
-0.1896482, 1.771932, -0.8386801, 1, 1, 1, 1, 1,
-0.1882268, 1.316227, -0.2316751, 1, 1, 1, 1, 1,
-0.1831157, -0.05711345, -2.384513, 1, 1, 1, 1, 1,
-0.1801757, 0.1923088, 0.2381992, 0, 0, 1, 1, 1,
-0.1787575, 0.02942534, -1.480131, 1, 0, 0, 1, 1,
-0.1779302, 0.8204401, -0.3595325, 1, 0, 0, 1, 1,
-0.1761553, -2.06206, -3.490212, 1, 0, 0, 1, 1,
-0.1668441, -0.1232326, -3.215557, 1, 0, 0, 1, 1,
-0.1649664, -1.425653, -6.435844, 1, 0, 0, 1, 1,
-0.1591427, -0.5319789, -3.412492, 0, 0, 0, 1, 1,
-0.1583824, 1.928639, 0.1591419, 0, 0, 0, 1, 1,
-0.1555759, -0.4132846, -2.999606, 0, 0, 0, 1, 1,
-0.1499761, 1.023841, 0.3931367, 0, 0, 0, 1, 1,
-0.1485744, -0.3015248, -2.477943, 0, 0, 0, 1, 1,
-0.1387608, 0.88751, 0.7118474, 0, 0, 0, 1, 1,
-0.1378458, 0.279419, -0.5338929, 0, 0, 0, 1, 1,
-0.1374728, 0.8739332, -2.177431, 1, 1, 1, 1, 1,
-0.1365004, -0.9124978, -2.572572, 1, 1, 1, 1, 1,
-0.1357638, 0.4943482, -1.110574, 1, 1, 1, 1, 1,
-0.1338091, 0.9257776, 0.5041147, 1, 1, 1, 1, 1,
-0.1291068, -0.905831, -4.940259, 1, 1, 1, 1, 1,
-0.1288999, 0.1129027, -1.578796, 1, 1, 1, 1, 1,
-0.1261947, 0.1476341, -0.5569755, 1, 1, 1, 1, 1,
-0.1248844, -0.004965576, -0.09250943, 1, 1, 1, 1, 1,
-0.1230553, -0.01736762, 0.8541391, 1, 1, 1, 1, 1,
-0.1219412, 0.3861071, -1.767965, 1, 1, 1, 1, 1,
-0.1196927, -0.3317603, -1.102264, 1, 1, 1, 1, 1,
-0.1193412, 0.8490901, -0.4051612, 1, 1, 1, 1, 1,
-0.1182387, -1.965838, -1.951913, 1, 1, 1, 1, 1,
-0.1165296, 0.06449495, -1.091988, 1, 1, 1, 1, 1,
-0.1148285, -0.666835, -2.359701, 1, 1, 1, 1, 1,
-0.1139757, 0.8977566, -0.8671976, 0, 0, 1, 1, 1,
-0.1125578, -1.384683, -3.136277, 1, 0, 0, 1, 1,
-0.1124956, 1.923678, 0.009990169, 1, 0, 0, 1, 1,
-0.1100886, 1.822762, 1.169984, 1, 0, 0, 1, 1,
-0.1100441, -1.613452, -2.00405, 1, 0, 0, 1, 1,
-0.108817, 0.26645, -0.2810073, 1, 0, 0, 1, 1,
-0.1082855, -0.2690029, -3.522058, 0, 0, 0, 1, 1,
-0.1063937, -0.2729734, -3.98856, 0, 0, 0, 1, 1,
-0.1062603, -0.04710343, -2.410907, 0, 0, 0, 1, 1,
-0.1055899, 0.04897514, -0.9616346, 0, 0, 0, 1, 1,
-0.1047029, -0.4813287, -1.955949, 0, 0, 0, 1, 1,
-0.1042234, 0.3668787, -0.916571, 0, 0, 0, 1, 1,
-0.1021882, -1.656375, -2.49759, 0, 0, 0, 1, 1,
-0.1014494, 0.892945, 0.8968513, 1, 1, 1, 1, 1,
-0.1001053, 2.081913, 1.229433, 1, 1, 1, 1, 1,
-0.09680777, -0.8498441, -3.827204, 1, 1, 1, 1, 1,
-0.09620114, 0.4166102, 1.744682, 1, 1, 1, 1, 1,
-0.09611023, -1.26244, -3.148435, 1, 1, 1, 1, 1,
-0.09586202, 1.232288, -0.3449302, 1, 1, 1, 1, 1,
-0.0928513, -0.0269807, -4.034386, 1, 1, 1, 1, 1,
-0.09020169, 0.3787944, 0.374627, 1, 1, 1, 1, 1,
-0.08955082, 0.9452353, 1.516901, 1, 1, 1, 1, 1,
-0.08853207, 0.7478699, 0.2965839, 1, 1, 1, 1, 1,
-0.08302654, -1.232405, -4.977718, 1, 1, 1, 1, 1,
-0.08235099, -1.419839, -5.154478, 1, 1, 1, 1, 1,
-0.08184004, -0.2164196, -3.666217, 1, 1, 1, 1, 1,
-0.07629128, 0.7844282, -0.522413, 1, 1, 1, 1, 1,
-0.07388902, -1.02333, -2.911758, 1, 1, 1, 1, 1,
-0.0729699, -0.3184427, -3.31221, 0, 0, 1, 1, 1,
-0.07111545, 0.6927438, 0.09073243, 1, 0, 0, 1, 1,
-0.06930178, -0.5754394, -3.119556, 1, 0, 0, 1, 1,
-0.06457645, -0.6599954, -3.353218, 1, 0, 0, 1, 1,
-0.06410587, -0.3348569, -5.069839, 1, 0, 0, 1, 1,
-0.05746499, 0.6524822, -1.850387, 1, 0, 0, 1, 1,
-0.05518597, -0.3419822, -2.690127, 0, 0, 0, 1, 1,
-0.05367433, 0.2937692, 1.153318, 0, 0, 0, 1, 1,
-0.05235414, 0.2040221, 1.456452, 0, 0, 0, 1, 1,
-0.05026336, 0.434646, 0.6310236, 0, 0, 0, 1, 1,
-0.04732241, 0.4651261, 1.685849, 0, 0, 0, 1, 1,
-0.04534452, 0.580892, 0.6567756, 0, 0, 0, 1, 1,
-0.04501671, 0.5832034, -2.328186, 0, 0, 0, 1, 1,
-0.04368016, -0.1261389, -0.9671676, 1, 1, 1, 1, 1,
-0.0421182, 0.1051254, -0.4304638, 1, 1, 1, 1, 1,
-0.03911491, 2.166499, -1.337548, 1, 1, 1, 1, 1,
-0.03808173, 0.8269015, -0.774061, 1, 1, 1, 1, 1,
-0.03601089, 0.3558128, -0.2238315, 1, 1, 1, 1, 1,
-0.03117958, 0.4146309, -1.730347, 1, 1, 1, 1, 1,
-0.02895723, 1.763371, 0.2627858, 1, 1, 1, 1, 1,
-0.02885695, -0.724009, -4.09535, 1, 1, 1, 1, 1,
-0.02842593, 0.7697173, 0.8532283, 1, 1, 1, 1, 1,
-0.02747795, 0.2363525, 0.827545, 1, 1, 1, 1, 1,
-0.02472002, 0.7548599, 1.015798, 1, 1, 1, 1, 1,
-0.01955128, -1.036067, -2.738941, 1, 1, 1, 1, 1,
-0.01808635, -0.07900839, -4.61603, 1, 1, 1, 1, 1,
-0.01639569, 0.6610535, -1.202219, 1, 1, 1, 1, 1,
-0.01604337, 0.6291594, -0.1669752, 1, 1, 1, 1, 1,
-0.01578588, -0.7898831, -1.726673, 0, 0, 1, 1, 1,
-0.01257422, -1.533379, -2.776288, 1, 0, 0, 1, 1,
-0.01221483, -2.094692, -4.455651, 1, 0, 0, 1, 1,
-0.01168683, 1.063588, 0.4340833, 1, 0, 0, 1, 1,
-0.01013365, -0.1389892, -3.911807, 1, 0, 0, 1, 1,
-0.008695431, -0.1766133, -3.525336, 1, 0, 0, 1, 1,
-0.002802111, 0.7453249, 0.1830144, 0, 0, 0, 1, 1,
-0.001587877, -0.8172665, -2.109367, 0, 0, 0, 1, 1,
0.003743615, 0.4491307, -0.07643993, 0, 0, 0, 1, 1,
0.006654819, -0.04187939, 3.145381, 0, 0, 0, 1, 1,
0.008561613, -1.061112, 4.76284, 0, 0, 0, 1, 1,
0.01072744, 0.391559, -2.604037, 0, 0, 0, 1, 1,
0.01601363, -0.2600904, 2.206976, 0, 0, 0, 1, 1,
0.0172768, -0.4755598, 4.632343, 1, 1, 1, 1, 1,
0.01964917, -0.2647546, 3.380884, 1, 1, 1, 1, 1,
0.02018281, -0.9299143, 1.881016, 1, 1, 1, 1, 1,
0.02365966, -1.455595, 3.675814, 1, 1, 1, 1, 1,
0.02483671, 1.621402, 0.327771, 1, 1, 1, 1, 1,
0.02724723, 0.1688327, -0.3830195, 1, 1, 1, 1, 1,
0.02822624, 1.250231, 0.4549231, 1, 1, 1, 1, 1,
0.02939323, 0.6729213, -1.253689, 1, 1, 1, 1, 1,
0.03706438, 1.179156, -0.4275733, 1, 1, 1, 1, 1,
0.03738987, 0.7048155, -0.1881004, 1, 1, 1, 1, 1,
0.03829212, -2.010892, 2.707258, 1, 1, 1, 1, 1,
0.03918883, 1.630535, 0.03169951, 1, 1, 1, 1, 1,
0.04085607, -1.903382, 2.644758, 1, 1, 1, 1, 1,
0.04132188, 1.168002, -0.04850622, 1, 1, 1, 1, 1,
0.04180195, 1.197014, -1.888253, 1, 1, 1, 1, 1,
0.04402963, -0.1635288, 4.398853, 0, 0, 1, 1, 1,
0.04478266, -0.6984505, 3.555045, 1, 0, 0, 1, 1,
0.04565653, -0.06249445, 1.861124, 1, 0, 0, 1, 1,
0.05369103, 0.04852418, 2.033232, 1, 0, 0, 1, 1,
0.05387924, -0.1085776, 2.429684, 1, 0, 0, 1, 1,
0.0542329, -0.3121872, 2.207872, 1, 0, 0, 1, 1,
0.06128581, 0.02074006, 2.039572, 0, 0, 0, 1, 1,
0.0621173, 1.373506, 0.02454047, 0, 0, 0, 1, 1,
0.06576694, 0.01424121, 1.375445, 0, 0, 0, 1, 1,
0.06765665, 0.73905, -0.8176402, 0, 0, 0, 1, 1,
0.06918215, 1.30997, 0.9949079, 0, 0, 0, 1, 1,
0.07101885, 0.41007, 0.4618445, 0, 0, 0, 1, 1,
0.07162666, -0.1352518, 2.439666, 0, 0, 0, 1, 1,
0.07384022, 0.2447519, 1.174041, 1, 1, 1, 1, 1,
0.07945243, -0.3602724, 3.987456, 1, 1, 1, 1, 1,
0.08006237, -0.4526955, 1.88693, 1, 1, 1, 1, 1,
0.08448399, 0.1376222, 0.2626523, 1, 1, 1, 1, 1,
0.08737913, -1.502854, 3.814582, 1, 1, 1, 1, 1,
0.0898916, -0.9668506, 2.286992, 1, 1, 1, 1, 1,
0.08996815, -0.2442531, 0.4633074, 1, 1, 1, 1, 1,
0.09130292, -0.131512, 3.105006, 1, 1, 1, 1, 1,
0.09313327, -1.110461, 5.508903, 1, 1, 1, 1, 1,
0.09458192, -0.6557372, 1.470298, 1, 1, 1, 1, 1,
0.09495573, -0.2220029, 3.586003, 1, 1, 1, 1, 1,
0.09566449, -1.154298, 0.764023, 1, 1, 1, 1, 1,
0.09665922, 0.9455304, 0.4905075, 1, 1, 1, 1, 1,
0.09691031, -2.802772, 3.218534, 1, 1, 1, 1, 1,
0.09809365, -0.02846869, 1.352199, 1, 1, 1, 1, 1,
0.09832452, 1.83894, -0.9926201, 0, 0, 1, 1, 1,
0.101323, -1.076367, 2.395663, 1, 0, 0, 1, 1,
0.1013238, -1.567717, 2.740652, 1, 0, 0, 1, 1,
0.1027607, 0.8766515, 1.080506, 1, 0, 0, 1, 1,
0.1045791, 0.4693827, -0.5589603, 1, 0, 0, 1, 1,
0.1075235, -0.1402277, 2.453306, 1, 0, 0, 1, 1,
0.1121214, -0.3189166, 2.268526, 0, 0, 0, 1, 1,
0.114716, -0.9367607, 3.798018, 0, 0, 0, 1, 1,
0.1160735, -0.964581, 2.783205, 0, 0, 0, 1, 1,
0.1214166, 0.5737348, 1.10207, 0, 0, 0, 1, 1,
0.1242601, 0.784996, 0.7357281, 0, 0, 0, 1, 1,
0.1251037, 0.2938555, 1.1973, 0, 0, 0, 1, 1,
0.1277516, -0.05530551, 2.007087, 0, 0, 0, 1, 1,
0.1277659, -2.628372, 2.762284, 1, 1, 1, 1, 1,
0.1305915, 0.5103053, 0.6772406, 1, 1, 1, 1, 1,
0.1325566, -1.209248, 2.811456, 1, 1, 1, 1, 1,
0.1335475, -1.803741, 2.486158, 1, 1, 1, 1, 1,
0.1337345, 2.103862, 0.6662812, 1, 1, 1, 1, 1,
0.138731, 0.06728815, 1.003697, 1, 1, 1, 1, 1,
0.1420639, 0.8755239, 0.901629, 1, 1, 1, 1, 1,
0.1431643, 1.188635, 0.9313844, 1, 1, 1, 1, 1,
0.1472617, 0.4257126, 0.7941402, 1, 1, 1, 1, 1,
0.1538166, 0.1408968, 1.062576, 1, 1, 1, 1, 1,
0.1551485, -1.420823, 3.117826, 1, 1, 1, 1, 1,
0.1589699, 0.07444514, 2.125806, 1, 1, 1, 1, 1,
0.164477, -0.4411861, 4.999233, 1, 1, 1, 1, 1,
0.1650553, -0.6909527, 4.043564, 1, 1, 1, 1, 1,
0.1655647, 1.750598, 0.309303, 1, 1, 1, 1, 1,
0.1659303, -0.3761998, 3.063365, 0, 0, 1, 1, 1,
0.1726783, 0.9222342, -2.313354, 1, 0, 0, 1, 1,
0.1739097, -0.1915798, 2.470849, 1, 0, 0, 1, 1,
0.1751911, 1.771123, -2.456258, 1, 0, 0, 1, 1,
0.1759356, -0.1669662, 3.754341, 1, 0, 0, 1, 1,
0.1759608, -1.989699, 2.373623, 1, 0, 0, 1, 1,
0.176727, 1.691925, 1.38347, 0, 0, 0, 1, 1,
0.178975, 0.2985472, 1.089804, 0, 0, 0, 1, 1,
0.1842292, 0.5223585, 0.2420084, 0, 0, 0, 1, 1,
0.1930877, -0.3377247, 2.366592, 0, 0, 0, 1, 1,
0.2033942, -0.924679, 4.222418, 0, 0, 0, 1, 1,
0.2042781, -0.08516272, 1.599935, 0, 0, 0, 1, 1,
0.204646, -0.03114845, 2.425652, 0, 0, 0, 1, 1,
0.2071459, -0.5107621, 2.394493, 1, 1, 1, 1, 1,
0.2093467, 2.326092, 1.552731, 1, 1, 1, 1, 1,
0.2122347, 1.444969, 0.4566948, 1, 1, 1, 1, 1,
0.215253, -0.4224366, 2.377074, 1, 1, 1, 1, 1,
0.2185528, -1.345577, 2.611053, 1, 1, 1, 1, 1,
0.2220833, -1.400196, 3.716882, 1, 1, 1, 1, 1,
0.2279045, 0.4435036, 1.67594, 1, 1, 1, 1, 1,
0.2310314, 0.5377127, 0.9941515, 1, 1, 1, 1, 1,
0.231034, 0.4505502, -1.119492, 1, 1, 1, 1, 1,
0.2382833, -1.020293, 3.869155, 1, 1, 1, 1, 1,
0.2431073, -0.2828602, 1.891406, 1, 1, 1, 1, 1,
0.2446447, 0.8979025, 0.8256879, 1, 1, 1, 1, 1,
0.2458471, 1.43332, 1.640969, 1, 1, 1, 1, 1,
0.2476428, -1.582217, 3.335727, 1, 1, 1, 1, 1,
0.2516919, -0.5149876, 2.937635, 1, 1, 1, 1, 1,
0.2627864, -0.4571059, 3.274496, 0, 0, 1, 1, 1,
0.266515, -0.2950179, 4.418467, 1, 0, 0, 1, 1,
0.2704554, 0.5691586, -1.156013, 1, 0, 0, 1, 1,
0.27162, -2.015599, 3.713936, 1, 0, 0, 1, 1,
0.2722648, -0.4306006, 4.445642, 1, 0, 0, 1, 1,
0.2729977, 0.3901325, 1.56345, 1, 0, 0, 1, 1,
0.2730719, 0.002328916, 2.868824, 0, 0, 0, 1, 1,
0.2742897, 1.309006, 0.9234446, 0, 0, 0, 1, 1,
0.2764624, -0.9330071, 1.340522, 0, 0, 0, 1, 1,
0.2771337, 0.7390515, 0.5592488, 0, 0, 0, 1, 1,
0.2801916, 0.0717366, 2.426304, 0, 0, 0, 1, 1,
0.2862108, -1.167211, 2.814773, 0, 0, 0, 1, 1,
0.296279, -0.02641734, 0.5054743, 0, 0, 0, 1, 1,
0.2964569, 1.415805, 0.7980729, 1, 1, 1, 1, 1,
0.3031775, 1.011273, -0.3799679, 1, 1, 1, 1, 1,
0.3042604, 1.266061, 0.7642576, 1, 1, 1, 1, 1,
0.3108298, 0.559005, -0.351794, 1, 1, 1, 1, 1,
0.3161746, 0.4028527, 0.4260859, 1, 1, 1, 1, 1,
0.3165988, 1.650504, 1.030977, 1, 1, 1, 1, 1,
0.3185307, 0.5884945, 0.7092205, 1, 1, 1, 1, 1,
0.3186328, -0.9552981, 3.385378, 1, 1, 1, 1, 1,
0.3190243, 0.6216339, -1.40809, 1, 1, 1, 1, 1,
0.3243752, -0.509137, 1.750139, 1, 1, 1, 1, 1,
0.32785, 0.4278876, 0.7658288, 1, 1, 1, 1, 1,
0.3316154, 0.7261401, -0.2432401, 1, 1, 1, 1, 1,
0.3321558, -1.079259, 1.922047, 1, 1, 1, 1, 1,
0.3338128, 1.426525, -0.2940757, 1, 1, 1, 1, 1,
0.337805, -1.750838, 1.72478, 1, 1, 1, 1, 1,
0.3379961, 0.5631942, 0.04426606, 0, 0, 1, 1, 1,
0.343187, -1.267732, 4.685955, 1, 0, 0, 1, 1,
0.343662, -0.8549975, 4.729238, 1, 0, 0, 1, 1,
0.3445999, 0.7950227, -0.8142719, 1, 0, 0, 1, 1,
0.3477769, -0.2567419, 1.72728, 1, 0, 0, 1, 1,
0.3489146, 0.1069071, 2.066849, 1, 0, 0, 1, 1,
0.3516389, -1.011198, 3.772479, 0, 0, 0, 1, 1,
0.3524427, -0.6114091, 2.464048, 0, 0, 0, 1, 1,
0.3529288, 1.980124, 0.5132902, 0, 0, 0, 1, 1,
0.3546907, -2.01568, 3.403579, 0, 0, 0, 1, 1,
0.3548049, -0.2314725, 2.135486, 0, 0, 0, 1, 1,
0.3570866, 0.1895713, 0.6312402, 0, 0, 0, 1, 1,
0.3581013, 0.05366054, 1.438872, 0, 0, 0, 1, 1,
0.3584507, 0.7933446, 1.551298, 1, 1, 1, 1, 1,
0.3605028, -2.560067, 1.943607, 1, 1, 1, 1, 1,
0.3670301, 0.6080482, 0.7565116, 1, 1, 1, 1, 1,
0.367479, 0.0197209, 1.214498, 1, 1, 1, 1, 1,
0.3682231, 0.2734271, 0.6229764, 1, 1, 1, 1, 1,
0.3694445, 0.7337043, 0.6191967, 1, 1, 1, 1, 1,
0.3869681, 1.298263, 0.9219846, 1, 1, 1, 1, 1,
0.3887905, -2.466735, 2.393477, 1, 1, 1, 1, 1,
0.3934847, -0.5087916, 2.946041, 1, 1, 1, 1, 1,
0.3951691, -1.476495, 3.395789, 1, 1, 1, 1, 1,
0.3974009, -0.389663, 3.604183, 1, 1, 1, 1, 1,
0.3984503, -0.6391901, 2.028623, 1, 1, 1, 1, 1,
0.401709, -0.0796518, 1.442752, 1, 1, 1, 1, 1,
0.4054359, 0.8030007, 0.1487097, 1, 1, 1, 1, 1,
0.406473, 0.2319652, 0.6085604, 1, 1, 1, 1, 1,
0.4095446, -0.4172526, 1.280766, 0, 0, 1, 1, 1,
0.4101955, -1.796784, 1.366936, 1, 0, 0, 1, 1,
0.410696, 0.636614, -0.5827715, 1, 0, 0, 1, 1,
0.4131085, -0.6544605, 3.610919, 1, 0, 0, 1, 1,
0.4142666, 0.2532995, 0.3534211, 1, 0, 0, 1, 1,
0.4171352, -0.0124343, 0.1731858, 1, 0, 0, 1, 1,
0.4268691, 1.653612, 0.5485633, 0, 0, 0, 1, 1,
0.4280275, 0.3241225, 0.2919047, 0, 0, 0, 1, 1,
0.4282428, -0.3172017, 1.226833, 0, 0, 0, 1, 1,
0.4339035, 1.144681, -0.4369943, 0, 0, 0, 1, 1,
0.4339624, -1.786253, 3.90685, 0, 0, 0, 1, 1,
0.4356509, -0.8983129, 2.297395, 0, 0, 0, 1, 1,
0.4364812, -0.03635996, 0.3824522, 0, 0, 0, 1, 1,
0.4419262, -0.9045849, 5.078831, 1, 1, 1, 1, 1,
0.4430083, 1.191638, -0.04919223, 1, 1, 1, 1, 1,
0.4464634, 0.5208504, -0.09300974, 1, 1, 1, 1, 1,
0.4483177, -0.2078167, 2.255428, 1, 1, 1, 1, 1,
0.4491338, 0.5806013, 0.7862975, 1, 1, 1, 1, 1,
0.4523305, 0.384107, 0.2682486, 1, 1, 1, 1, 1,
0.4546102, -1.947616, 2.81806, 1, 1, 1, 1, 1,
0.4549549, -0.3809194, 0.7600598, 1, 1, 1, 1, 1,
0.4595146, -0.7667249, 2.846401, 1, 1, 1, 1, 1,
0.4640782, 2.047089, 0.7216613, 1, 1, 1, 1, 1,
0.4661315, 0.4733522, 0.923146, 1, 1, 1, 1, 1,
0.46826, 0.209288, 0.6370463, 1, 1, 1, 1, 1,
0.4688733, 1.071981, -0.0721506, 1, 1, 1, 1, 1,
0.4692882, -0.3435851, 2.136225, 1, 1, 1, 1, 1,
0.4694631, 0.2946208, 0.0215526, 1, 1, 1, 1, 1,
0.4719627, -0.5787213, 4.487856, 0, 0, 1, 1, 1,
0.4742266, -0.01357198, 2.26136, 1, 0, 0, 1, 1,
0.4761236, 0.5491112, -1.406692, 1, 0, 0, 1, 1,
0.4786134, -0.1350932, 2.123065, 1, 0, 0, 1, 1,
0.4858356, 1.193361, 0.8065618, 1, 0, 0, 1, 1,
0.4867966, -0.2258107, 2.148642, 1, 0, 0, 1, 1,
0.4892363, -0.6436411, 3.157006, 0, 0, 0, 1, 1,
0.4918313, 1.26945, 1.1976, 0, 0, 0, 1, 1,
0.49223, -1.224097, 0.9406683, 0, 0, 0, 1, 1,
0.4933332, -0.2436827, 0.7197356, 0, 0, 0, 1, 1,
0.4945875, -1.681538, 3.627565, 0, 0, 0, 1, 1,
0.4946071, 0.63269, -0.2153717, 0, 0, 0, 1, 1,
0.5063715, -1.057516, 2.0388, 0, 0, 0, 1, 1,
0.5067565, 1.160851, 0.3632774, 1, 1, 1, 1, 1,
0.5093995, 2.278085, 0.3084142, 1, 1, 1, 1, 1,
0.5094686, 0.5574465, 0.004075381, 1, 1, 1, 1, 1,
0.5116422, -0.4495034, 2.928151, 1, 1, 1, 1, 1,
0.5147936, 2.077267, 3.001149, 1, 1, 1, 1, 1,
0.5157068, 0.6388454, -1.30126, 1, 1, 1, 1, 1,
0.5232306, -0.2949491, 1.100338, 1, 1, 1, 1, 1,
0.5275334, -0.5482638, 2.84298, 1, 1, 1, 1, 1,
0.5340437, 1.059759, 1.303346, 1, 1, 1, 1, 1,
0.5370663, -1.600395, 1.538823, 1, 1, 1, 1, 1,
0.537374, 1.249561, -0.4721239, 1, 1, 1, 1, 1,
0.5387202, -0.6263345, 4.289664, 1, 1, 1, 1, 1,
0.5462395, -0.1102803, 2.52311, 1, 1, 1, 1, 1,
0.5518997, 0.9524267, 2.514335, 1, 1, 1, 1, 1,
0.5553244, 1.154383, 0.5675325, 1, 1, 1, 1, 1,
0.5683453, -1.549459, 2.338028, 0, 0, 1, 1, 1,
0.5842117, 1.115639, 0.644373, 1, 0, 0, 1, 1,
0.5844923, -0.9200379, 0.9911565, 1, 0, 0, 1, 1,
0.5861904, -0.7381486, 1.639523, 1, 0, 0, 1, 1,
0.587654, 1.065492, -0.4646284, 1, 0, 0, 1, 1,
0.5899426, 0.9320824, 1.331943, 1, 0, 0, 1, 1,
0.59036, -0.05606864, -0.1899937, 0, 0, 0, 1, 1,
0.5904335, -0.2710954, 0.5497317, 0, 0, 0, 1, 1,
0.5910943, 1.395002, 0.0921587, 0, 0, 0, 1, 1,
0.5943712, 1.541497, -0.3574564, 0, 0, 0, 1, 1,
0.6078978, 1.459834, -0.4688833, 0, 0, 0, 1, 1,
0.6172223, -1.171559, 2.575716, 0, 0, 0, 1, 1,
0.6176999, 1.680743, -0.8805628, 0, 0, 0, 1, 1,
0.6206295, -0.1044, 1.656437, 1, 1, 1, 1, 1,
0.6251761, -0.5692067, 2.060723, 1, 1, 1, 1, 1,
0.63074, 0.7064002, 1.299829, 1, 1, 1, 1, 1,
0.6333014, 1.735029, -1.885398, 1, 1, 1, 1, 1,
0.6349868, -0.5575762, 3.107357, 1, 1, 1, 1, 1,
0.6371322, 1.419639, 1.248102, 1, 1, 1, 1, 1,
0.6379497, 0.1198768, 1.817835, 1, 1, 1, 1, 1,
0.6435459, 0.7766675, -0.3904258, 1, 1, 1, 1, 1,
0.644484, 0.07250838, 2.531689, 1, 1, 1, 1, 1,
0.6455465, -0.9331335, 2.882745, 1, 1, 1, 1, 1,
0.652791, 0.6282767, -0.6976205, 1, 1, 1, 1, 1,
0.6547018, 0.1952112, 2.875397, 1, 1, 1, 1, 1,
0.6551459, -0.8754277, 2.71153, 1, 1, 1, 1, 1,
0.6600133, 1.031815, 0.8240719, 1, 1, 1, 1, 1,
0.6605307, -0.239546, 0.7606696, 1, 1, 1, 1, 1,
0.661942, 1.597533, -1.469261, 0, 0, 1, 1, 1,
0.6646917, 0.02944547, 1.22346, 1, 0, 0, 1, 1,
0.669327, -1.24622, 3.966881, 1, 0, 0, 1, 1,
0.676547, 1.228871, -0.4841396, 1, 0, 0, 1, 1,
0.6813591, 0.4300966, 0.1509114, 1, 0, 0, 1, 1,
0.6821269, -1.368832, 2.526951, 1, 0, 0, 1, 1,
0.6871679, -0.9908851, 2.482594, 0, 0, 0, 1, 1,
0.6892229, 0.07526754, 1.773622, 0, 0, 0, 1, 1,
0.6892527, -0.5773643, 0.5725237, 0, 0, 0, 1, 1,
0.6913828, -0.9963246, 2.567146, 0, 0, 0, 1, 1,
0.6945139, 0.2499307, 0.8719232, 0, 0, 0, 1, 1,
0.6951006, 0.1519845, 1.213951, 0, 0, 0, 1, 1,
0.6983159, 3.052373, -0.1735116, 0, 0, 0, 1, 1,
0.7030246, -0.03383611, 1.44952, 1, 1, 1, 1, 1,
0.7060862, -0.2446949, 2.938662, 1, 1, 1, 1, 1,
0.7083922, -0.4739902, 1.552184, 1, 1, 1, 1, 1,
0.7107949, 0.5119795, 1.148039, 1, 1, 1, 1, 1,
0.714264, -2.283056, 2.240764, 1, 1, 1, 1, 1,
0.7159745, 0.446171, -0.5315336, 1, 1, 1, 1, 1,
0.7230192, -0.4684611, 1.592183, 1, 1, 1, 1, 1,
0.7335145, -0.07683183, 1.157547, 1, 1, 1, 1, 1,
0.7360924, -0.6263809, 2.952773, 1, 1, 1, 1, 1,
0.737482, -0.02141848, 2.35674, 1, 1, 1, 1, 1,
0.7460131, 0.09250177, 3.036145, 1, 1, 1, 1, 1,
0.7543718, -1.210433, 3.540678, 1, 1, 1, 1, 1,
0.756614, -1.159179, 2.580136, 1, 1, 1, 1, 1,
0.7571298, -0.4166399, 2.377589, 1, 1, 1, 1, 1,
0.7582526, -0.119491, 3.242507, 1, 1, 1, 1, 1,
0.7592301, 0.1838411, 0.2896304, 0, 0, 1, 1, 1,
0.761875, -0.7474995, 1.711885, 1, 0, 0, 1, 1,
0.762636, -1.621967, 4.637374, 1, 0, 0, 1, 1,
0.7725494, -0.6165088, 3.257151, 1, 0, 0, 1, 1,
0.7788207, -0.5977343, 2.604064, 1, 0, 0, 1, 1,
0.780508, 0.7256079, -0.8910758, 1, 0, 0, 1, 1,
0.7868389, -0.8545871, 4.213196, 0, 0, 0, 1, 1,
0.7883629, 0.4517387, 2.22106, 0, 0, 0, 1, 1,
0.7904299, -0.300497, 1.195352, 0, 0, 0, 1, 1,
0.7908595, -0.2484255, -0.02652551, 0, 0, 0, 1, 1,
0.7918462, 0.7041886, -0.1520376, 0, 0, 0, 1, 1,
0.7937872, 1.058797, 0.1785199, 0, 0, 0, 1, 1,
0.7964978, 0.2210989, -0.6246479, 0, 0, 0, 1, 1,
0.7971858, 1.872236, -0.7798306, 1, 1, 1, 1, 1,
0.8019973, -1.16062, 3.306276, 1, 1, 1, 1, 1,
0.8025463, -0.4087076, 0.8031006, 1, 1, 1, 1, 1,
0.8075491, -0.4188974, 2.372606, 1, 1, 1, 1, 1,
0.8171722, 0.2455209, 1.177391, 1, 1, 1, 1, 1,
0.8182868, 0.6981867, 2.758236, 1, 1, 1, 1, 1,
0.8194472, -0.4147945, 1.887961, 1, 1, 1, 1, 1,
0.8233846, 0.3070478, 2.384741, 1, 1, 1, 1, 1,
0.8284534, -0.2310457, 0.2942507, 1, 1, 1, 1, 1,
0.8296284, -0.3544559, 0.3186703, 1, 1, 1, 1, 1,
0.8301148, 0.6291773, 0.5712984, 1, 1, 1, 1, 1,
0.8305583, 1.750115, -0.1768462, 1, 1, 1, 1, 1,
0.8307093, 0.7482622, 0.7834354, 1, 1, 1, 1, 1,
0.8360639, 0.7147243, 1.6205, 1, 1, 1, 1, 1,
0.8449978, -1.214387, 1.732578, 1, 1, 1, 1, 1,
0.8498904, -0.7210612, 2.154311, 0, 0, 1, 1, 1,
0.8526164, 1.453019, -0.3777415, 1, 0, 0, 1, 1,
0.8548423, 0.9484997, -1.441973, 1, 0, 0, 1, 1,
0.8645273, 0.1705644, 1.913466, 1, 0, 0, 1, 1,
0.865945, 1.230553, 3.456974, 1, 0, 0, 1, 1,
0.8683597, 1.114899, 0.6267071, 1, 0, 0, 1, 1,
0.8713582, -0.4158391, 1.897129, 0, 0, 0, 1, 1,
0.8796079, 0.8435804, 0.7852853, 0, 0, 0, 1, 1,
0.9016022, -0.7631387, 1.430444, 0, 0, 0, 1, 1,
0.9045309, -1.48394, 2.646938, 0, 0, 0, 1, 1,
0.9068478, -0.7702621, 2.576907, 0, 0, 0, 1, 1,
0.9075065, -1.039941, 0.8207952, 0, 0, 0, 1, 1,
0.9096853, -0.7393534, 2.941902, 0, 0, 0, 1, 1,
0.9155049, 0.7026352, 0.2629951, 1, 1, 1, 1, 1,
0.9183958, -0.03832532, 1.45843, 1, 1, 1, 1, 1,
0.9228482, -0.04026482, 2.512063, 1, 1, 1, 1, 1,
0.9295254, -0.9723957, 1.972422, 1, 1, 1, 1, 1,
0.9345059, -1.174679, 3.727489, 1, 1, 1, 1, 1,
0.9359442, 0.8493381, 1.283831, 1, 1, 1, 1, 1,
0.9387205, -0.1968667, 2.497235, 1, 1, 1, 1, 1,
0.9499467, 0.1947461, 1.211018, 1, 1, 1, 1, 1,
0.9589856, -1.429862, 2.047547, 1, 1, 1, 1, 1,
0.9614588, 0.8213668, 0.9197446, 1, 1, 1, 1, 1,
0.9685583, 0.7303035, 0.879096, 1, 1, 1, 1, 1,
0.9709069, 0.4528068, 2.079544, 1, 1, 1, 1, 1,
0.9740593, 1.334248, -1.596939, 1, 1, 1, 1, 1,
0.9744078, 1.824358, -0.6793348, 1, 1, 1, 1, 1,
0.9785268, -1.275284, 1.391006, 1, 1, 1, 1, 1,
0.9866189, -0.815506, 0.7907516, 0, 0, 1, 1, 1,
0.9988347, -1.541473, 1.387402, 1, 0, 0, 1, 1,
1.00263, -0.1464779, 0.6814373, 1, 0, 0, 1, 1,
1.003677, 0.2100944, 0.9477208, 1, 0, 0, 1, 1,
1.013141, -0.7230746, 2.732008, 1, 0, 0, 1, 1,
1.013923, -0.7510576, 1.511552, 1, 0, 0, 1, 1,
1.017357, -0.2492555, 2.60059, 0, 0, 0, 1, 1,
1.019701, -0.2414543, 2.684978, 0, 0, 0, 1, 1,
1.020119, -0.1171393, 2.7866, 0, 0, 0, 1, 1,
1.027498, 0.7953759, 0.05145852, 0, 0, 0, 1, 1,
1.036679, 0.5976174, 0.1574682, 0, 0, 0, 1, 1,
1.037355, -1.454362, 2.57163, 0, 0, 0, 1, 1,
1.038183, 2.095058, -1.712021, 0, 0, 0, 1, 1,
1.048695, -0.572646, 2.038438, 1, 1, 1, 1, 1,
1.057786, -0.04847207, 2.808429, 1, 1, 1, 1, 1,
1.06962, 0.1432873, 1.470038, 1, 1, 1, 1, 1,
1.075447, -0.456266, 1.184497, 1, 1, 1, 1, 1,
1.077089, -1.346143, 3.477054, 1, 1, 1, 1, 1,
1.084341, 0.07926931, 1.174194, 1, 1, 1, 1, 1,
1.084487, -1.344385, 3.268718, 1, 1, 1, 1, 1,
1.085627, -0.4420115, 1.274162, 1, 1, 1, 1, 1,
1.090028, 0.2399838, 2.855527, 1, 1, 1, 1, 1,
1.092128, 0.3606811, -0.2763752, 1, 1, 1, 1, 1,
1.095091, -0.2511292, 2.828363, 1, 1, 1, 1, 1,
1.096338, -0.5910357, 2.448963, 1, 1, 1, 1, 1,
1.102915, -1.651245, 2.506714, 1, 1, 1, 1, 1,
1.118059, 0.1053499, 1.233606, 1, 1, 1, 1, 1,
1.118341, -0.7675974, 2.454888, 1, 1, 1, 1, 1,
1.127311, 0.7924294, 1.455764, 0, 0, 1, 1, 1,
1.127343, 0.4592777, 1.528121, 1, 0, 0, 1, 1,
1.127481, -1.899459, 3.690759, 1, 0, 0, 1, 1,
1.135103, 0.7306641, -0.964905, 1, 0, 0, 1, 1,
1.136236, -0.6818037, 1.30741, 1, 0, 0, 1, 1,
1.143235, -1.196659, 3.067189, 1, 0, 0, 1, 1,
1.143556, 0.5537616, 0.08629511, 0, 0, 0, 1, 1,
1.166463, 0.6621679, 0.94459, 0, 0, 0, 1, 1,
1.167475, 1.420439, 2.265438, 0, 0, 0, 1, 1,
1.171104, 1.747465, -0.6674283, 0, 0, 0, 1, 1,
1.171767, -0.05603715, 0.8612102, 0, 0, 0, 1, 1,
1.17887, 0.4063322, 0.8788229, 0, 0, 0, 1, 1,
1.183365, -0.1873248, -0.4293036, 0, 0, 0, 1, 1,
1.187229, -2.215576, 3.090113, 1, 1, 1, 1, 1,
1.187957, -1.034875, 1.626065, 1, 1, 1, 1, 1,
1.189345, -1.946427, 2.258049, 1, 1, 1, 1, 1,
1.191001, 2.172871, 0.2476105, 1, 1, 1, 1, 1,
1.203306, -1.647502, 2.041191, 1, 1, 1, 1, 1,
1.220557, -0.1311223, 0.4964515, 1, 1, 1, 1, 1,
1.228162, -0.1590911, 0.5173416, 1, 1, 1, 1, 1,
1.229089, 1.88777, 1.734766, 1, 1, 1, 1, 1,
1.235593, 1.444206, 0.7488348, 1, 1, 1, 1, 1,
1.239226, 0.5449681, 1.55907, 1, 1, 1, 1, 1,
1.242648, 0.3539455, 3.052696, 1, 1, 1, 1, 1,
1.246377, -0.007879237, 2.414476, 1, 1, 1, 1, 1,
1.251401, -0.4768232, 1.17735, 1, 1, 1, 1, 1,
1.256158, -0.5789299, 3.496275, 1, 1, 1, 1, 1,
1.261884, 0.3332204, 2.431656, 1, 1, 1, 1, 1,
1.264509, -2.348518, 3.324425, 0, 0, 1, 1, 1,
1.272683, 0.6134255, 1.535784, 1, 0, 0, 1, 1,
1.275191, 1.030686, 2.332826, 1, 0, 0, 1, 1,
1.308314, 0.2284774, 2.434197, 1, 0, 0, 1, 1,
1.313847, 0.3448393, 0.7888961, 1, 0, 0, 1, 1,
1.328991, -2.227818, 1.15908, 1, 0, 0, 1, 1,
1.32931, -0.2645604, 0.6173736, 0, 0, 0, 1, 1,
1.33331, -0.3755507, 1.493119, 0, 0, 0, 1, 1,
1.346906, 0.19972, 3.748897, 0, 0, 0, 1, 1,
1.347468, -1.086991, 4.505344, 0, 0, 0, 1, 1,
1.349181, 0.5625684, 3.793444, 0, 0, 0, 1, 1,
1.354574, -0.8662456, 3.569605, 0, 0, 0, 1, 1,
1.372658, 0.1498018, 1.238411, 0, 0, 0, 1, 1,
1.385303, -0.5601462, 1.261291, 1, 1, 1, 1, 1,
1.391261, -0.5847061, 2.053887, 1, 1, 1, 1, 1,
1.413576, 0.1237039, 1.853668, 1, 1, 1, 1, 1,
1.414358, 0.7095395, 0.3589804, 1, 1, 1, 1, 1,
1.420664, -0.1124777, 1.103858, 1, 1, 1, 1, 1,
1.43255, 0.1718171, 0.9279061, 1, 1, 1, 1, 1,
1.432626, 0.478615, 1.221255, 1, 1, 1, 1, 1,
1.453436, 1.844942, -0.2889362, 1, 1, 1, 1, 1,
1.46509, -0.8195096, 0.1308936, 1, 1, 1, 1, 1,
1.47269, 0.06961242, 2.252283, 1, 1, 1, 1, 1,
1.485514, 1.098035, 1.276913, 1, 1, 1, 1, 1,
1.519372, 0.9672624, 0.32846, 1, 1, 1, 1, 1,
1.531813, 0.4054658, 1.715863, 1, 1, 1, 1, 1,
1.54836, -0.7379967, 1.559502, 1, 1, 1, 1, 1,
1.553002, 0.02004191, 3.062842, 1, 1, 1, 1, 1,
1.570974, 0.09626513, 1.660562, 0, 0, 1, 1, 1,
1.573005, -1.555738, 2.859613, 1, 0, 0, 1, 1,
1.579306, -0.3404943, 2.07948, 1, 0, 0, 1, 1,
1.580228, -0.3287208, 0.8175585, 1, 0, 0, 1, 1,
1.603692, 1.397951, 0.1879404, 1, 0, 0, 1, 1,
1.644089, -0.4441558, 2.535856, 1, 0, 0, 1, 1,
1.655078, -0.567272, 2.710613, 0, 0, 0, 1, 1,
1.681738, -0.6075704, 2.939395, 0, 0, 0, 1, 1,
1.704222, 0.7284977, 1.520584, 0, 0, 0, 1, 1,
1.719124, -0.3740848, 1.814495, 0, 0, 0, 1, 1,
1.727896, -0.670188, 2.460664, 0, 0, 0, 1, 1,
1.748494, -1.326751, 1.963513, 0, 0, 0, 1, 1,
1.7595, -0.9145652, 1.721724, 0, 0, 0, 1, 1,
1.766996, 0.1237702, 3.789762, 1, 1, 1, 1, 1,
1.770389, 0.009445755, 0.5928621, 1, 1, 1, 1, 1,
1.776498, -0.2050616, 2.231418, 1, 1, 1, 1, 1,
1.777048, 0.9577553, 1.149733, 1, 1, 1, 1, 1,
1.805363, -0.3928956, 1.777277, 1, 1, 1, 1, 1,
1.847302, 1.08468, 1.494462, 1, 1, 1, 1, 1,
1.847513, 2.121816, 0.2406105, 1, 1, 1, 1, 1,
1.85139, 0.7288672, -0.2023839, 1, 1, 1, 1, 1,
1.868939, -0.06403609, 2.674464, 1, 1, 1, 1, 1,
1.888545, -1.328159, 1.288121, 1, 1, 1, 1, 1,
1.891133, -0.4807315, 3.089296, 1, 1, 1, 1, 1,
1.903479, 0.2792542, 2.254833, 1, 1, 1, 1, 1,
1.925294, 0.7625486, 2.433369, 1, 1, 1, 1, 1,
1.942762, 0.1146023, 2.424178, 1, 1, 1, 1, 1,
1.950345, 0.01879535, 2.004869, 1, 1, 1, 1, 1,
2.020908, -0.5677649, 0.1427454, 0, 0, 1, 1, 1,
2.03789, 1.058257, 1.791013, 1, 0, 0, 1, 1,
2.049612, 0.6190236, -0.3316568, 1, 0, 0, 1, 1,
2.118044, 1.284244, -0.2474165, 1, 0, 0, 1, 1,
2.142436, -0.4936422, 4.030522, 1, 0, 0, 1, 1,
2.146677, -1.82273, 2.890224, 1, 0, 0, 1, 1,
2.147858, -0.5008809, 1.571576, 0, 0, 0, 1, 1,
2.19018, -0.4564014, 1.204701, 0, 0, 0, 1, 1,
2.191087, -0.1866355, 1.237668, 0, 0, 0, 1, 1,
2.216594, -0.8159025, 2.426696, 0, 0, 0, 1, 1,
2.231344, -0.4570959, 0.4224956, 0, 0, 0, 1, 1,
2.280475, -1.562533, 1.229691, 0, 0, 0, 1, 1,
2.503674, -1.502691, 3.643928, 0, 0, 0, 1, 1,
2.60597, -0.8787888, 2.430961, 1, 1, 1, 1, 1,
2.622397, 0.1813613, 3.03368, 1, 1, 1, 1, 1,
2.656003, 1.190026, 1.252463, 1, 1, 1, 1, 1,
2.855258, 1.354622, -0.2074769, 1, 1, 1, 1, 1,
2.914031, -0.7974282, 1.505594, 1, 1, 1, 1, 1,
2.976583, 0.06921525, 0.9581401, 1, 1, 1, 1, 1,
3.127856, -0.2057186, 2.283206, 1, 1, 1, 1, 1
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
var radius = 9.98571;
var distance = 35.07438;
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
mvMatrix.translate( -0.04479885, 0.08565092, 0.4634709 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.07438);
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
