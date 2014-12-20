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
-3.725395, -0.8162988, -0.234177, 1, 0, 0, 1,
-2.949572, 0.2042165, -0.3945446, 1, 0.007843138, 0, 1,
-2.829322, 1.246743, -1.003931, 1, 0.01176471, 0, 1,
-2.718144, -0.3650762, -3.74753, 1, 0.01960784, 0, 1,
-2.674395, -0.3615304, -3.417804, 1, 0.02352941, 0, 1,
-2.513324, -0.07616574, -1.322755, 1, 0.03137255, 0, 1,
-2.476273, 0.6345333, -0.5727648, 1, 0.03529412, 0, 1,
-2.399359, 0.153242, -2.999552, 1, 0.04313726, 0, 1,
-2.337548, 0.1481323, -1.616563, 1, 0.04705882, 0, 1,
-2.326542, -0.001890217, -2.944628, 1, 0.05490196, 0, 1,
-2.315737, -0.441825, -1.997227, 1, 0.05882353, 0, 1,
-2.30218, 0.4740829, -0.0181531, 1, 0.06666667, 0, 1,
-2.272943, -1.586824, -2.298253, 1, 0.07058824, 0, 1,
-2.254877, 1.072699, -0.9391904, 1, 0.07843138, 0, 1,
-2.2244, 0.3446379, -1.08349, 1, 0.08235294, 0, 1,
-2.223435, 0.09571572, -2.090772, 1, 0.09019608, 0, 1,
-2.196404, -1.518166, -1.833082, 1, 0.09411765, 0, 1,
-2.159585, -1.315862, -4.116098, 1, 0.1019608, 0, 1,
-2.151283, -3.291083, -1.953034, 1, 0.1098039, 0, 1,
-2.151254, 1.30062, -0.01795735, 1, 0.1137255, 0, 1,
-2.149946, -0.83115, -2.476476, 1, 0.1215686, 0, 1,
-2.146383, 0.4249946, -0.9861769, 1, 0.1254902, 0, 1,
-2.122539, 0.3945142, -2.281421, 1, 0.1333333, 0, 1,
-2.102818, -0.8303881, -3.399766, 1, 0.1372549, 0, 1,
-2.097848, -0.3626443, -2.142127, 1, 0.145098, 0, 1,
-2.07971, -0.603182, -1.151872, 1, 0.1490196, 0, 1,
-2.02137, -2.088534, -2.919332, 1, 0.1568628, 0, 1,
-2.002353, -0.6518838, -1.043126, 1, 0.1607843, 0, 1,
-1.985992, 1.066999, -1.395235, 1, 0.1686275, 0, 1,
-1.934127, 1.027741, -1.604874, 1, 0.172549, 0, 1,
-1.92252, -2.905771, -1.876304, 1, 0.1803922, 0, 1,
-1.875853, -0.203672, 0.4773021, 1, 0.1843137, 0, 1,
-1.805999, 0.2073534, -1.213325, 1, 0.1921569, 0, 1,
-1.785799, 1.002477, -3.810224, 1, 0.1960784, 0, 1,
-1.759011, 0.5587667, -1.134873, 1, 0.2039216, 0, 1,
-1.758576, -0.2256936, -2.340661, 1, 0.2117647, 0, 1,
-1.754066, -0.7100626, -0.9106743, 1, 0.2156863, 0, 1,
-1.750787, 0.287801, -2.681107, 1, 0.2235294, 0, 1,
-1.744375, -1.969758, -2.201458, 1, 0.227451, 0, 1,
-1.741461, -0.141155, -2.092716, 1, 0.2352941, 0, 1,
-1.736688, 2.78504, -0.1777284, 1, 0.2392157, 0, 1,
-1.71567, 0.4676366, 0.08089125, 1, 0.2470588, 0, 1,
-1.702613, -0.214016, -2.335081, 1, 0.2509804, 0, 1,
-1.683398, 1.811547, -1.750592, 1, 0.2588235, 0, 1,
-1.631235, 0.7492053, -1.665298, 1, 0.2627451, 0, 1,
-1.628273, -0.3775704, -2.207628, 1, 0.2705882, 0, 1,
-1.610111, 0.581736, -0.7646749, 1, 0.2745098, 0, 1,
-1.602551, 0.5743628, -1.516833, 1, 0.282353, 0, 1,
-1.599831, -1.237235, -2.813612, 1, 0.2862745, 0, 1,
-1.596802, 0.156636, -1.209945, 1, 0.2941177, 0, 1,
-1.578087, -0.163342, -2.602325, 1, 0.3019608, 0, 1,
-1.577983, -0.6525033, -0.7480478, 1, 0.3058824, 0, 1,
-1.575361, 1.411066, -1.414545, 1, 0.3137255, 0, 1,
-1.561907, -0.7058371, -2.969727, 1, 0.3176471, 0, 1,
-1.550455, -0.1620895, -0.8246155, 1, 0.3254902, 0, 1,
-1.548751, -0.4581847, 0.01707992, 1, 0.3294118, 0, 1,
-1.535692, -2.598281, -2.699925, 1, 0.3372549, 0, 1,
-1.535648, 1.098484, -1.901543, 1, 0.3411765, 0, 1,
-1.530219, 1.200906, -1.27566, 1, 0.3490196, 0, 1,
-1.526543, -1.652419, -0.7939128, 1, 0.3529412, 0, 1,
-1.508676, -1.371684, -3.223669, 1, 0.3607843, 0, 1,
-1.492635, 1.60722, -0.6480406, 1, 0.3647059, 0, 1,
-1.491705, -0.9651915, -2.636931, 1, 0.372549, 0, 1,
-1.488334, -1.527538, -3.373379, 1, 0.3764706, 0, 1,
-1.470019, 0.2519369, -1.581303, 1, 0.3843137, 0, 1,
-1.465538, 0.8706673, -1.918198, 1, 0.3882353, 0, 1,
-1.465275, -0.5764306, -1.690769, 1, 0.3960784, 0, 1,
-1.461647, -1.719583, -1.983343, 1, 0.4039216, 0, 1,
-1.443073, 0.06896048, 1.060532, 1, 0.4078431, 0, 1,
-1.437106, -0.3855251, -2.310984, 1, 0.4156863, 0, 1,
-1.425674, -0.170697, -1.664183, 1, 0.4196078, 0, 1,
-1.419261, 1.763906, -0.2851648, 1, 0.427451, 0, 1,
-1.408303, -0.3357283, -1.020706, 1, 0.4313726, 0, 1,
-1.402905, 0.7770418, -0.3551558, 1, 0.4392157, 0, 1,
-1.39079, 0.2667038, -2.060403, 1, 0.4431373, 0, 1,
-1.382179, 0.37341, -1.80629, 1, 0.4509804, 0, 1,
-1.375909, 0.4241367, -0.8512103, 1, 0.454902, 0, 1,
-1.352646, 0.9965757, -1.322827, 1, 0.4627451, 0, 1,
-1.349618, 1.51321, -1.895729, 1, 0.4666667, 0, 1,
-1.340074, -0.3200154, -3.214218, 1, 0.4745098, 0, 1,
-1.322942, 0.4545908, -1.43728, 1, 0.4784314, 0, 1,
-1.315642, 0.5253937, -2.559913, 1, 0.4862745, 0, 1,
-1.305272, -1.020985, -2.330941, 1, 0.4901961, 0, 1,
-1.294958, -0.3366651, -1.919638, 1, 0.4980392, 0, 1,
-1.292054, 1.763527, 0.1517888, 1, 0.5058824, 0, 1,
-1.291222, 0.8104394, 0.2717331, 1, 0.509804, 0, 1,
-1.283833, -0.4947165, -1.471312, 1, 0.5176471, 0, 1,
-1.279628, -1.037043, -4.25174, 1, 0.5215687, 0, 1,
-1.278751, -0.5478843, -3.195287, 1, 0.5294118, 0, 1,
-1.275742, 0.9449039, -0.6047416, 1, 0.5333334, 0, 1,
-1.26541, 0.478573, -0.9605041, 1, 0.5411765, 0, 1,
-1.263134, 0.7328657, -1.116322, 1, 0.5450981, 0, 1,
-1.262522, 0.2289726, -2.055502, 1, 0.5529412, 0, 1,
-1.259728, 0.1869523, -1.068964, 1, 0.5568628, 0, 1,
-1.257859, 0.8966619, 0.3921246, 1, 0.5647059, 0, 1,
-1.254812, 0.1082356, -1.283062, 1, 0.5686275, 0, 1,
-1.254404, -0.1415227, -1.53626, 1, 0.5764706, 0, 1,
-1.251193, -0.550891, -2.028619, 1, 0.5803922, 0, 1,
-1.244121, 0.3272494, -0.2983432, 1, 0.5882353, 0, 1,
-1.242883, -0.8764778, -2.858359, 1, 0.5921569, 0, 1,
-1.239774, -1.662331, -3.609762, 1, 0.6, 0, 1,
-1.238114, 1.410986, 0.3708461, 1, 0.6078432, 0, 1,
-1.237718, -0.3606652, -2.084076, 1, 0.6117647, 0, 1,
-1.231704, 0.1478165, -1.816997, 1, 0.6196079, 0, 1,
-1.227706, -2.052901, -3.589199, 1, 0.6235294, 0, 1,
-1.225051, -0.4430596, -1.618469, 1, 0.6313726, 0, 1,
-1.224491, -0.8709965, -1.517365, 1, 0.6352941, 0, 1,
-1.221797, 1.282189, -0.4558378, 1, 0.6431373, 0, 1,
-1.219244, 1.110034, 0.4184666, 1, 0.6470588, 0, 1,
-1.218186, 1.592286, -2.483734, 1, 0.654902, 0, 1,
-1.212039, 0.8535168, -0.7856724, 1, 0.6588235, 0, 1,
-1.208314, -0.3860167, -2.169456, 1, 0.6666667, 0, 1,
-1.208076, 0.06138422, -0.6300676, 1, 0.6705883, 0, 1,
-1.203205, -2.552773, -2.042043, 1, 0.6784314, 0, 1,
-1.191744, 0.2941034, -3.015156, 1, 0.682353, 0, 1,
-1.188401, -0.4330805, -1.867896, 1, 0.6901961, 0, 1,
-1.183057, 1.09867, -0.5501184, 1, 0.6941177, 0, 1,
-1.181623, 2.806666, 1.116603, 1, 0.7019608, 0, 1,
-1.180025, -1.065975, -2.646947, 1, 0.7098039, 0, 1,
-1.172562, 0.5840694, -1.869993, 1, 0.7137255, 0, 1,
-1.167958, 0.3305613, -0.03425204, 1, 0.7215686, 0, 1,
-1.167235, 1.013775, -0.9361354, 1, 0.7254902, 0, 1,
-1.161679, 1.306198, -0.7919461, 1, 0.7333333, 0, 1,
-1.16084, -0.03551973, -0.8407466, 1, 0.7372549, 0, 1,
-1.157705, 0.5062105, -2.457855, 1, 0.7450981, 0, 1,
-1.155982, 0.8654283, -0.454, 1, 0.7490196, 0, 1,
-1.154504, 0.5961819, -0.4219672, 1, 0.7568628, 0, 1,
-1.152844, 0.8347236, 0.5920382, 1, 0.7607843, 0, 1,
-1.15097, -2.041918, -3.150176, 1, 0.7686275, 0, 1,
-1.142255, 0.04486658, -1.674047, 1, 0.772549, 0, 1,
-1.138527, -0.06883009, -0.8171103, 1, 0.7803922, 0, 1,
-1.136307, -0.4796278, 0.2149225, 1, 0.7843137, 0, 1,
-1.135346, 1.227728, -0.4418968, 1, 0.7921569, 0, 1,
-1.133874, 0.3692908, -0.2065753, 1, 0.7960784, 0, 1,
-1.12984, 0.06437755, -0.4409856, 1, 0.8039216, 0, 1,
-1.129771, 0.1767175, -3.518032, 1, 0.8117647, 0, 1,
-1.126513, 1.084339, -0.1192034, 1, 0.8156863, 0, 1,
-1.115847, -1.490375, -1.356702, 1, 0.8235294, 0, 1,
-1.107785, 2.79694, 0.2001519, 1, 0.827451, 0, 1,
-1.104689, 0.4052344, -2.150948, 1, 0.8352941, 0, 1,
-1.100736, 0.5636191, 0.2718567, 1, 0.8392157, 0, 1,
-1.09827, -1.742681, -2.959179, 1, 0.8470588, 0, 1,
-1.094107, 0.8658379, 0.4383428, 1, 0.8509804, 0, 1,
-1.090055, 1.271659, -1.436832, 1, 0.8588235, 0, 1,
-1.088685, -0.5953403, -1.91046, 1, 0.8627451, 0, 1,
-1.088452, -0.7245624, -2.478347, 1, 0.8705882, 0, 1,
-1.074608, -1.454734, -3.522039, 1, 0.8745098, 0, 1,
-1.073216, -0.4263753, -3.038403, 1, 0.8823529, 0, 1,
-1.065829, -0.9385597, -2.421921, 1, 0.8862745, 0, 1,
-1.060917, 1.230598, -0.2078819, 1, 0.8941177, 0, 1,
-1.060717, -0.2318852, -1.522092, 1, 0.8980392, 0, 1,
-1.057435, -0.4622431, -1.682223, 1, 0.9058824, 0, 1,
-1.055841, 1.317969, -0.06875372, 1, 0.9137255, 0, 1,
-1.049422, 1.101065, -1.173922, 1, 0.9176471, 0, 1,
-1.043153, 0.753823, -0.2814701, 1, 0.9254902, 0, 1,
-1.04306, -0.3707789, -2.704296, 1, 0.9294118, 0, 1,
-1.032588, 0.2481524, -1.36883, 1, 0.9372549, 0, 1,
-1.03178, -0.7764418, -2.915507, 1, 0.9411765, 0, 1,
-1.025445, 1.396521, -2.26383, 1, 0.9490196, 0, 1,
-1.02147, -0.432708, -2.096183, 1, 0.9529412, 0, 1,
-1.010319, 0.285593, -0.1007679, 1, 0.9607843, 0, 1,
-1.004255, -2.0213, -3.614171, 1, 0.9647059, 0, 1,
-0.999029, 0.6893747, -0.9301164, 1, 0.972549, 0, 1,
-0.9915351, -0.3596067, -0.8766334, 1, 0.9764706, 0, 1,
-0.9884564, 1.364257, -1.789464, 1, 0.9843137, 0, 1,
-0.9849157, -0.6521426, -1.46694, 1, 0.9882353, 0, 1,
-0.9795305, 0.1169528, -1.964689, 1, 0.9960784, 0, 1,
-0.9780992, -0.1083261, -1.61001, 0.9960784, 1, 0, 1,
-0.975364, 0.6212531, -1.804922, 0.9921569, 1, 0, 1,
-0.9699249, 0.4207154, -1.549905, 0.9843137, 1, 0, 1,
-0.9604547, -0.2829747, -2.272065, 0.9803922, 1, 0, 1,
-0.9512853, -2.007204, -2.401878, 0.972549, 1, 0, 1,
-0.9510922, -0.0846418, -2.051386, 0.9686275, 1, 0, 1,
-0.9425019, 0.6715075, -0.6776133, 0.9607843, 1, 0, 1,
-0.9413244, -0.1666187, -0.5338259, 0.9568627, 1, 0, 1,
-0.9381754, 0.859251, 0.1545882, 0.9490196, 1, 0, 1,
-0.9367401, 0.3543586, -2.652955, 0.945098, 1, 0, 1,
-0.9311984, 1.255892, -1.831954, 0.9372549, 1, 0, 1,
-0.9266942, -1.210168, -2.011801, 0.9333333, 1, 0, 1,
-0.9124091, -0.3647222, -3.019063, 0.9254902, 1, 0, 1,
-0.9065764, 0.5264246, -4.316339, 0.9215686, 1, 0, 1,
-0.9009321, 0.3222333, -1.143978, 0.9137255, 1, 0, 1,
-0.8960063, -0.7010908, -1.4963, 0.9098039, 1, 0, 1,
-0.89057, -1.240689, -2.367425, 0.9019608, 1, 0, 1,
-0.8790861, 0.398564, -0.9910524, 0.8941177, 1, 0, 1,
-0.8738229, 2.598355, 1.623969, 0.8901961, 1, 0, 1,
-0.873736, 0.7461466, -1.033183, 0.8823529, 1, 0, 1,
-0.8714983, 0.1943463, -0.4293406, 0.8784314, 1, 0, 1,
-0.8668736, 0.8711934, -0.4780281, 0.8705882, 1, 0, 1,
-0.8653212, -0.1099438, -1.009142, 0.8666667, 1, 0, 1,
-0.8626283, -0.1787256, -2.855345, 0.8588235, 1, 0, 1,
-0.8580848, 0.05002573, -0.2913967, 0.854902, 1, 0, 1,
-0.8486241, -0.276281, -3.816225, 0.8470588, 1, 0, 1,
-0.8388107, 0.5748768, -1.134313, 0.8431373, 1, 0, 1,
-0.8365964, 0.4207427, -1.127408, 0.8352941, 1, 0, 1,
-0.8365741, -1.018803, -3.382154, 0.8313726, 1, 0, 1,
-0.8337399, -0.1332477, -2.723629, 0.8235294, 1, 0, 1,
-0.8258882, 0.5101844, -0.02234438, 0.8196079, 1, 0, 1,
-0.8254383, 0.1570679, -0.6728141, 0.8117647, 1, 0, 1,
-0.8250696, -1.263274, -3.843976, 0.8078431, 1, 0, 1,
-0.8241768, -0.8100232, -3.183231, 0.8, 1, 0, 1,
-0.821399, 0.6242893, -0.1564892, 0.7921569, 1, 0, 1,
-0.8188572, 0.2016828, -2.19099, 0.7882353, 1, 0, 1,
-0.8136771, 0.2218936, -0.6801571, 0.7803922, 1, 0, 1,
-0.8090301, -2.901579, -5.568638, 0.7764706, 1, 0, 1,
-0.8028083, 1.760739, 0.468406, 0.7686275, 1, 0, 1,
-0.8000136, 0.8632951, -0.7541791, 0.7647059, 1, 0, 1,
-0.7969272, 0.649822, 0.1469282, 0.7568628, 1, 0, 1,
-0.7947285, 0.3763607, -1.437441, 0.7529412, 1, 0, 1,
-0.7908791, 1.926562, 0.6381977, 0.7450981, 1, 0, 1,
-0.7897385, -1.214735, -2.506116, 0.7411765, 1, 0, 1,
-0.7884532, 1.447992, -0.5448658, 0.7333333, 1, 0, 1,
-0.7879359, -1.479952, -2.094352, 0.7294118, 1, 0, 1,
-0.7862912, -0.3301378, -3.215909, 0.7215686, 1, 0, 1,
-0.7829704, 1.540029, -1.087501, 0.7176471, 1, 0, 1,
-0.7751561, 0.5351948, -1.914879, 0.7098039, 1, 0, 1,
-0.7729499, 0.9902754, -0.5597433, 0.7058824, 1, 0, 1,
-0.7716398, -1.794209, -2.56142, 0.6980392, 1, 0, 1,
-0.7679261, 0.2853803, -1.333615, 0.6901961, 1, 0, 1,
-0.7663233, 1.439841, -1.467257, 0.6862745, 1, 0, 1,
-0.7646176, 0.0619729, -2.419333, 0.6784314, 1, 0, 1,
-0.7607724, -0.1534233, -0.5315609, 0.6745098, 1, 0, 1,
-0.7539081, 2.517158, -0.6253794, 0.6666667, 1, 0, 1,
-0.7504257, 1.92076, -0.1345863, 0.6627451, 1, 0, 1,
-0.7496651, -1.010573, -2.069718, 0.654902, 1, 0, 1,
-0.7489109, -0.8304073, -3.580322, 0.6509804, 1, 0, 1,
-0.745494, -1.494048, -3.025979, 0.6431373, 1, 0, 1,
-0.7434365, -1.080601, -3.336974, 0.6392157, 1, 0, 1,
-0.7432232, 1.08028, 0.3848245, 0.6313726, 1, 0, 1,
-0.7347941, -0.2666628, 1.354669, 0.627451, 1, 0, 1,
-0.7304307, 2.073989, 0.003297461, 0.6196079, 1, 0, 1,
-0.7301039, 0.4511217, 0.2988098, 0.6156863, 1, 0, 1,
-0.7284083, -0.3433425, -1.854977, 0.6078432, 1, 0, 1,
-0.7270792, -0.193785, -1.402623, 0.6039216, 1, 0, 1,
-0.7157438, 1.410244, 0.4143522, 0.5960785, 1, 0, 1,
-0.7145949, -2.097056, -3.856898, 0.5882353, 1, 0, 1,
-0.7111453, 0.2092215, -2.867164, 0.5843138, 1, 0, 1,
-0.7089998, -0.7250778, -2.410168, 0.5764706, 1, 0, 1,
-0.7089524, 0.6915326, -2.376642, 0.572549, 1, 0, 1,
-0.6975842, -1.008339, -2.104305, 0.5647059, 1, 0, 1,
-0.693522, 0.3164751, -1.009304, 0.5607843, 1, 0, 1,
-0.6889693, -0.3241883, -0.5066735, 0.5529412, 1, 0, 1,
-0.6876792, 0.6461834, 0.009656157, 0.5490196, 1, 0, 1,
-0.6805199, 0.6207126, 0.1930215, 0.5411765, 1, 0, 1,
-0.6794695, 0.2198881, -1.4195, 0.5372549, 1, 0, 1,
-0.678755, -0.750816, -3.263186, 0.5294118, 1, 0, 1,
-0.6727594, -0.1123376, -0.5406675, 0.5254902, 1, 0, 1,
-0.6709622, 0.7366874, 0.1601439, 0.5176471, 1, 0, 1,
-0.6636823, -0.3265843, -1.181862, 0.5137255, 1, 0, 1,
-0.6588519, -0.2721916, -0.6002172, 0.5058824, 1, 0, 1,
-0.6565993, -0.9883549, -2.03248, 0.5019608, 1, 0, 1,
-0.650783, -1.406387, -2.180827, 0.4941176, 1, 0, 1,
-0.650152, -0.07998161, -1.126904, 0.4862745, 1, 0, 1,
-0.6497785, 0.7231588, -1.432349, 0.4823529, 1, 0, 1,
-0.644889, 0.1588104, -0.7336624, 0.4745098, 1, 0, 1,
-0.6422873, -1.353552, -3.920748, 0.4705882, 1, 0, 1,
-0.6420805, -0.01092616, -1.385136, 0.4627451, 1, 0, 1,
-0.6386663, -0.1693155, -1.59301, 0.4588235, 1, 0, 1,
-0.6240144, 0.1043886, 1.76448, 0.4509804, 1, 0, 1,
-0.623054, 1.294626, -1.027183, 0.4470588, 1, 0, 1,
-0.6192452, 0.03288213, -2.558203, 0.4392157, 1, 0, 1,
-0.6180823, 1.337463, -1.807353, 0.4352941, 1, 0, 1,
-0.6171575, 0.6482687, -0.5143377, 0.427451, 1, 0, 1,
-0.6153192, 0.1493347, -1.600102, 0.4235294, 1, 0, 1,
-0.614435, 0.2958923, -1.794814, 0.4156863, 1, 0, 1,
-0.596361, 1.421949, -2.666588, 0.4117647, 1, 0, 1,
-0.5942383, -1.739646, -3.413007, 0.4039216, 1, 0, 1,
-0.5875884, 0.6681461, -2.036837, 0.3960784, 1, 0, 1,
-0.580072, 0.8635588, -0.08929217, 0.3921569, 1, 0, 1,
-0.5773368, -0.1665982, -2.509923, 0.3843137, 1, 0, 1,
-0.5766671, 1.634959, -1.53695, 0.3803922, 1, 0, 1,
-0.5737145, -0.4099853, -2.087223, 0.372549, 1, 0, 1,
-0.5726393, -0.9263191, -2.714338, 0.3686275, 1, 0, 1,
-0.5706178, 0.004033505, -2.240956, 0.3607843, 1, 0, 1,
-0.5637118, -0.6833403, -3.195405, 0.3568628, 1, 0, 1,
-0.5612211, -0.1186864, -2.547333, 0.3490196, 1, 0, 1,
-0.5608612, -0.5955892, -3.113092, 0.345098, 1, 0, 1,
-0.5596533, -0.7212498, -2.863663, 0.3372549, 1, 0, 1,
-0.5579754, -0.366096, -2.744397, 0.3333333, 1, 0, 1,
-0.5572539, -0.1850178, -2.834607, 0.3254902, 1, 0, 1,
-0.5566326, 0.3854745, -1.125185, 0.3215686, 1, 0, 1,
-0.555943, -0.01484567, -2.255606, 0.3137255, 1, 0, 1,
-0.5542824, 0.6645022, -0.4014564, 0.3098039, 1, 0, 1,
-0.5532074, -0.8590735, -2.612473, 0.3019608, 1, 0, 1,
-0.5492216, 0.0271488, -3.645247, 0.2941177, 1, 0, 1,
-0.5492004, 2.090613, 1.830962, 0.2901961, 1, 0, 1,
-0.5455869, 1.12395, -0.6681628, 0.282353, 1, 0, 1,
-0.5455664, 0.04981112, -2.781974, 0.2784314, 1, 0, 1,
-0.5434537, -0.4382319, -3.136334, 0.2705882, 1, 0, 1,
-0.5434427, 1.661431, -1.368474, 0.2666667, 1, 0, 1,
-0.5432918, -0.5940034, -1.711828, 0.2588235, 1, 0, 1,
-0.540731, -2.752762, -2.00739, 0.254902, 1, 0, 1,
-0.5381835, 1.618905, 0.07717705, 0.2470588, 1, 0, 1,
-0.5352638, 0.2696576, -0.8302014, 0.2431373, 1, 0, 1,
-0.5329153, -1.727492, 0.01262036, 0.2352941, 1, 0, 1,
-0.5315607, 2.443939, 1.303665, 0.2313726, 1, 0, 1,
-0.530331, -0.005216273, -0.2255607, 0.2235294, 1, 0, 1,
-0.5270694, 1.019217, -0.5081358, 0.2196078, 1, 0, 1,
-0.5266077, 0.935757, 0.5387893, 0.2117647, 1, 0, 1,
-0.5256013, -0.6097822, -0.5450259, 0.2078431, 1, 0, 1,
-0.5244409, 0.8257238, -1.160493, 0.2, 1, 0, 1,
-0.5239272, 0.07981964, -2.483053, 0.1921569, 1, 0, 1,
-0.5143638, -0.5729554, -2.351094, 0.1882353, 1, 0, 1,
-0.5092593, -0.7100223, -1.876883, 0.1803922, 1, 0, 1,
-0.5071823, 1.281176, -2.584035, 0.1764706, 1, 0, 1,
-0.5036712, -0.6598212, -2.237297, 0.1686275, 1, 0, 1,
-0.5033084, -0.696837, -3.792643, 0.1647059, 1, 0, 1,
-0.4998452, 1.232414, -0.1488416, 0.1568628, 1, 0, 1,
-0.4987061, -0.4650204, -3.161421, 0.1529412, 1, 0, 1,
-0.4969849, 0.651396, 0.1627869, 0.145098, 1, 0, 1,
-0.4937139, -1.325769, -3.028934, 0.1411765, 1, 0, 1,
-0.493251, 0.4106948, -1.6136, 0.1333333, 1, 0, 1,
-0.4921589, 0.9973415, -0.8376577, 0.1294118, 1, 0, 1,
-0.4880539, 0.6254057, -0.4791664, 0.1215686, 1, 0, 1,
-0.4862416, 1.238289, -0.7211196, 0.1176471, 1, 0, 1,
-0.4834605, 0.1309619, -2.430365, 0.1098039, 1, 0, 1,
-0.4830456, 0.7229254, -1.429258, 0.1058824, 1, 0, 1,
-0.4812011, 0.5914897, -0.7959273, 0.09803922, 1, 0, 1,
-0.4797724, -1.093739, -2.507542, 0.09019608, 1, 0, 1,
-0.4788562, 0.5166804, -0.2029243, 0.08627451, 1, 0, 1,
-0.4775201, 0.5029646, -1.086814, 0.07843138, 1, 0, 1,
-0.4774731, -0.576071, -1.756087, 0.07450981, 1, 0, 1,
-0.4773766, 0.1045813, -1.12683, 0.06666667, 1, 0, 1,
-0.470197, 0.9316252, -1.614706, 0.0627451, 1, 0, 1,
-0.4689128, 0.06309615, -1.916959, 0.05490196, 1, 0, 1,
-0.4608448, -1.577504, -0.8267457, 0.05098039, 1, 0, 1,
-0.4562726, -1.367119, -3.644275, 0.04313726, 1, 0, 1,
-0.4552975, 0.1318634, -2.055851, 0.03921569, 1, 0, 1,
-0.447125, 0.3173343, 0.5418546, 0.03137255, 1, 0, 1,
-0.445083, -0.837105, -2.175054, 0.02745098, 1, 0, 1,
-0.4445699, 0.2670186, -0.25341, 0.01960784, 1, 0, 1,
-0.4408224, 0.5069846, -4.236473, 0.01568628, 1, 0, 1,
-0.4405119, 0.2697402, -1.125178, 0.007843138, 1, 0, 1,
-0.4399331, 0.2094774, -0.4878282, 0.003921569, 1, 0, 1,
-0.4354432, -1.210523, -1.356115, 0, 1, 0.003921569, 1,
-0.4242511, -0.8822563, -2.090309, 0, 1, 0.01176471, 1,
-0.423806, -0.09803105, -2.006719, 0, 1, 0.01568628, 1,
-0.421743, -0.1030143, -0.9638594, 0, 1, 0.02352941, 1,
-0.4208688, 0.8955024, 1.302611, 0, 1, 0.02745098, 1,
-0.4195291, -1.361423, -3.295652, 0, 1, 0.03529412, 1,
-0.4154363, -0.3642608, -2.594577, 0, 1, 0.03921569, 1,
-0.4153978, -0.5964941, -1.516946, 0, 1, 0.04705882, 1,
-0.4143224, 1.195063, -1.626555, 0, 1, 0.05098039, 1,
-0.412036, -0.0523534, -1.911177, 0, 1, 0.05882353, 1,
-0.4096396, 1.151106, 0.8754399, 0, 1, 0.0627451, 1,
-0.4073122, -0.1110731, -1.874076, 0, 1, 0.07058824, 1,
-0.4061367, -0.211637, -0.7988743, 0, 1, 0.07450981, 1,
-0.4007139, 0.5764239, 0.6436067, 0, 1, 0.08235294, 1,
-0.3961734, -1.105263, -3.816136, 0, 1, 0.08627451, 1,
-0.391444, 0.2096889, -1.558239, 0, 1, 0.09411765, 1,
-0.3836884, 0.2605274, -1.503714, 0, 1, 0.1019608, 1,
-0.3817985, 1.141713, -0.7124547, 0, 1, 0.1058824, 1,
-0.3807294, 0.8799347, -0.2720528, 0, 1, 0.1137255, 1,
-0.3802694, 1.064945, -2.244022, 0, 1, 0.1176471, 1,
-0.3779257, -0.2221243, -2.978198, 0, 1, 0.1254902, 1,
-0.375113, -0.05577073, -2.551951, 0, 1, 0.1294118, 1,
-0.3735743, 0.2616261, -0.4407421, 0, 1, 0.1372549, 1,
-0.3725336, 1.322484, 1.696825, 0, 1, 0.1411765, 1,
-0.3722819, 0.7219098, -0.8668941, 0, 1, 0.1490196, 1,
-0.3668925, -1.951874, -3.52859, 0, 1, 0.1529412, 1,
-0.3643295, -1.059964, -3.589527, 0, 1, 0.1607843, 1,
-0.3588433, 0.1606893, -0.4256272, 0, 1, 0.1647059, 1,
-0.3576222, -0.5725797, -2.280289, 0, 1, 0.172549, 1,
-0.3502663, -1.275602, -2.897355, 0, 1, 0.1764706, 1,
-0.350073, 0.2317494, 0.03178356, 0, 1, 0.1843137, 1,
-0.3486603, -0.4978431, -0.1176255, 0, 1, 0.1882353, 1,
-0.3484581, 0.1077047, -0.2977498, 0, 1, 0.1960784, 1,
-0.3444991, 0.1209369, -1.627064, 0, 1, 0.2039216, 1,
-0.3431232, 0.4819011, -0.8388174, 0, 1, 0.2078431, 1,
-0.3427967, -1.04152, -2.550105, 0, 1, 0.2156863, 1,
-0.3414536, -0.04141669, -2.026729, 0, 1, 0.2196078, 1,
-0.3365587, 0.3334593, -1.901729, 0, 1, 0.227451, 1,
-0.3341985, 0.4082885, 0.3867863, 0, 1, 0.2313726, 1,
-0.3340393, 1.766186, 0.7453877, 0, 1, 0.2392157, 1,
-0.3322463, 1.338114, -1.796071, 0, 1, 0.2431373, 1,
-0.3322228, -0.6647613, -2.798299, 0, 1, 0.2509804, 1,
-0.3272021, -0.5853369, -4.104664, 0, 1, 0.254902, 1,
-0.3263603, 0.7332942, 0.7741821, 0, 1, 0.2627451, 1,
-0.3259177, 0.8210061, 1.44767, 0, 1, 0.2666667, 1,
-0.3220356, -0.1535901, -3.374369, 0, 1, 0.2745098, 1,
-0.3162369, 2.012712, 0.6512066, 0, 1, 0.2784314, 1,
-0.3151519, -1.244915, -2.425543, 0, 1, 0.2862745, 1,
-0.3150721, 1.053132, -0.8636886, 0, 1, 0.2901961, 1,
-0.3145101, -0.6622475, -2.523063, 0, 1, 0.2980392, 1,
-0.3014501, -0.713306, -2.279102, 0, 1, 0.3058824, 1,
-0.3004183, -1.509857, -2.519197, 0, 1, 0.3098039, 1,
-0.2955061, 1.646214, 1.064706, 0, 1, 0.3176471, 1,
-0.2940852, -0.6016049, -3.331568, 0, 1, 0.3215686, 1,
-0.2940498, 1.271427, -0.2605052, 0, 1, 0.3294118, 1,
-0.2940245, -0.006959587, -1.430769, 0, 1, 0.3333333, 1,
-0.2878462, -1.305386, -3.775103, 0, 1, 0.3411765, 1,
-0.2844033, 1.345949, 0.7584241, 0, 1, 0.345098, 1,
-0.2837085, 1.737981, -0.1119703, 0, 1, 0.3529412, 1,
-0.2783879, 0.2747597, -1.58888, 0, 1, 0.3568628, 1,
-0.2779135, -0.8396645, -0.6641815, 0, 1, 0.3647059, 1,
-0.2760538, 0.8716375, -0.8239226, 0, 1, 0.3686275, 1,
-0.2642505, 1.413896, -1.843657, 0, 1, 0.3764706, 1,
-0.2622602, -1.270356, -2.10656, 0, 1, 0.3803922, 1,
-0.259903, 0.5084668, -0.6100055, 0, 1, 0.3882353, 1,
-0.2598882, 0.6815296, 0.5690234, 0, 1, 0.3921569, 1,
-0.2591799, 0.2148905, 0.3547028, 0, 1, 0.4, 1,
-0.2533476, -0.3942234, -1.690376, 0, 1, 0.4078431, 1,
-0.2522825, 0.006940141, 0.408453, 0, 1, 0.4117647, 1,
-0.2522011, 0.947186, 1.661464, 0, 1, 0.4196078, 1,
-0.251202, -0.888814, -2.590601, 0, 1, 0.4235294, 1,
-0.2451401, -1.324013, -3.22448, 0, 1, 0.4313726, 1,
-0.2451145, -0.630434, -2.254601, 0, 1, 0.4352941, 1,
-0.2434488, 0.2400656, 0.06187294, 0, 1, 0.4431373, 1,
-0.2405695, -0.1363293, -5.070501, 0, 1, 0.4470588, 1,
-0.2393155, 0.08790249, -1.658716, 0, 1, 0.454902, 1,
-0.2382588, -0.4809687, -2.972771, 0, 1, 0.4588235, 1,
-0.2344101, -0.9294516, -5.461812, 0, 1, 0.4666667, 1,
-0.2336103, 1.377439, -0.1879728, 0, 1, 0.4705882, 1,
-0.2333533, 0.40868, 0.5874226, 0, 1, 0.4784314, 1,
-0.23179, -1.003271, -2.459692, 0, 1, 0.4823529, 1,
-0.2288193, -0.6023329, -1.423023, 0, 1, 0.4901961, 1,
-0.2281223, -0.02041034, -3.544378, 0, 1, 0.4941176, 1,
-0.2274749, 0.9315288, -0.008882965, 0, 1, 0.5019608, 1,
-0.2268151, -3.095167, -4.124886, 0, 1, 0.509804, 1,
-0.2254335, -0.2294139, -2.10999, 0, 1, 0.5137255, 1,
-0.2216603, 0.2872133, -1.850747, 0, 1, 0.5215687, 1,
-0.2181733, -0.2185978, -4.385705, 0, 1, 0.5254902, 1,
-0.2172412, 1.367355, 0.2213311, 0, 1, 0.5333334, 1,
-0.2150287, -0.4088314, -2.034873, 0, 1, 0.5372549, 1,
-0.2132345, -0.3346545, -3.365625, 0, 1, 0.5450981, 1,
-0.2128549, -0.2190719, -1.796226, 0, 1, 0.5490196, 1,
-0.2120642, 0.1141502, -0.04640985, 0, 1, 0.5568628, 1,
-0.2100229, -0.249823, -2.698449, 0, 1, 0.5607843, 1,
-0.2097217, -1.93613, -3.385601, 0, 1, 0.5686275, 1,
-0.2078949, -0.5075516, -1.98298, 0, 1, 0.572549, 1,
-0.2067409, -0.4080033, -3.223124, 0, 1, 0.5803922, 1,
-0.2063157, 0.9552243, 0.9220544, 0, 1, 0.5843138, 1,
-0.2024058, 0.7981921, -1.048875, 0, 1, 0.5921569, 1,
-0.2010708, 1.594283, -0.1120116, 0, 1, 0.5960785, 1,
-0.1946876, -0.9488477, -3.499972, 0, 1, 0.6039216, 1,
-0.1905683, 0.521358, -0.5600035, 0, 1, 0.6117647, 1,
-0.1897197, -0.9494958, -2.382166, 0, 1, 0.6156863, 1,
-0.188969, -0.988115, -2.365195, 0, 1, 0.6235294, 1,
-0.1859511, 2.436511, -0.1369683, 0, 1, 0.627451, 1,
-0.1846939, -1.748074, -3.141252, 0, 1, 0.6352941, 1,
-0.1828195, -1.972882, -2.110041, 0, 1, 0.6392157, 1,
-0.1808202, 0.8972278, 1.060618, 0, 1, 0.6470588, 1,
-0.1797999, 0.6575935, -1.949361, 0, 1, 0.6509804, 1,
-0.1797554, 0.4749494, -0.623993, 0, 1, 0.6588235, 1,
-0.1791896, 0.1387403, -0.4739185, 0, 1, 0.6627451, 1,
-0.177066, -1.416665, -4.134601, 0, 1, 0.6705883, 1,
-0.1745209, -0.7267236, -1.441055, 0, 1, 0.6745098, 1,
-0.1675277, -0.02006967, -1.321325, 0, 1, 0.682353, 1,
-0.1622515, 0.9852094, 0.5837668, 0, 1, 0.6862745, 1,
-0.1610155, -0.02947872, -0.00237517, 0, 1, 0.6941177, 1,
-0.1598366, -1.157794, -2.278012, 0, 1, 0.7019608, 1,
-0.1544604, 0.2131833, -1.416054, 0, 1, 0.7058824, 1,
-0.1541534, -0.1959182, -1.594947, 0, 1, 0.7137255, 1,
-0.1497505, -0.09685715, -2.11583, 0, 1, 0.7176471, 1,
-0.1446117, 0.2648496, -0.2873491, 0, 1, 0.7254902, 1,
-0.140676, -0.5221401, -2.119547, 0, 1, 0.7294118, 1,
-0.137509, -0.1933962, -3.980463, 0, 1, 0.7372549, 1,
-0.1372956, -0.5470916, -4.83794, 0, 1, 0.7411765, 1,
-0.1354277, -0.1109802, -3.356173, 0, 1, 0.7490196, 1,
-0.1328604, -0.6554501, -1.917654, 0, 1, 0.7529412, 1,
-0.1327902, 0.2690453, -2.244898, 0, 1, 0.7607843, 1,
-0.1284513, 0.4195983, 0.5716356, 0, 1, 0.7647059, 1,
-0.1245043, -0.9729446, -3.374991, 0, 1, 0.772549, 1,
-0.1242425, -0.2919389, -3.040892, 0, 1, 0.7764706, 1,
-0.1218205, -0.3367999, -3.972621, 0, 1, 0.7843137, 1,
-0.1203234, 0.2955182, 0.2769086, 0, 1, 0.7882353, 1,
-0.1192481, -0.1956791, -2.614609, 0, 1, 0.7960784, 1,
-0.119023, 1.224143, 0.07426407, 0, 1, 0.8039216, 1,
-0.1147589, 0.2876639, -0.2708474, 0, 1, 0.8078431, 1,
-0.1110947, 1.570908, 0.09976485, 0, 1, 0.8156863, 1,
-0.1082615, -1.789723, -2.546097, 0, 1, 0.8196079, 1,
-0.1052016, -2.214246, -4.21623, 0, 1, 0.827451, 1,
-0.1029164, -0.7872777, -3.266046, 0, 1, 0.8313726, 1,
-0.1018774, 0.1916062, -1.64736, 0, 1, 0.8392157, 1,
-0.09937004, 0.08337558, -0.02205323, 0, 1, 0.8431373, 1,
-0.098548, -1.181176, -1.804726, 0, 1, 0.8509804, 1,
-0.09745553, 1.431503, 0.7381188, 0, 1, 0.854902, 1,
-0.08904027, -0.5819653, -5.122422, 0, 1, 0.8627451, 1,
-0.08320672, -2.159422, -2.613429, 0, 1, 0.8666667, 1,
-0.08177169, -0.1929139, -3.167573, 0, 1, 0.8745098, 1,
-0.08117051, -1.137403, -3.304788, 0, 1, 0.8784314, 1,
-0.07824322, 1.113284, 0.08283898, 0, 1, 0.8862745, 1,
-0.07704546, 0.191245, -0.6905668, 0, 1, 0.8901961, 1,
-0.07090433, -0.1572107, -2.493454, 0, 1, 0.8980392, 1,
-0.07034122, 1.074469, -0.5818329, 0, 1, 0.9058824, 1,
-0.06452426, 0.6492085, 0.4141888, 0, 1, 0.9098039, 1,
-0.06388689, 1.532502, 0.1727608, 0, 1, 0.9176471, 1,
-0.06386305, -1.310223, -2.069315, 0, 1, 0.9215686, 1,
-0.06092395, -0.4846093, -4.193629, 0, 1, 0.9294118, 1,
-0.06089794, 0.3778268, -0.05030966, 0, 1, 0.9333333, 1,
-0.06030813, -0.3716449, -2.541178, 0, 1, 0.9411765, 1,
-0.05623626, 1.042189, 0.7751435, 0, 1, 0.945098, 1,
-0.0554411, 0.8921267, -0.9575367, 0, 1, 0.9529412, 1,
-0.05264427, 1.194017, 1.643779, 0, 1, 0.9568627, 1,
-0.040846, -0.1476696, -4.352371, 0, 1, 0.9647059, 1,
-0.0396047, 0.1637039, -0.3070804, 0, 1, 0.9686275, 1,
-0.03615599, -0.8852677, -3.517464, 0, 1, 0.9764706, 1,
-0.02378486, 0.1011259, 0.507321, 0, 1, 0.9803922, 1,
-0.02101779, 0.452029, -3.070586, 0, 1, 0.9882353, 1,
-0.01517669, -1.322927, -1.459666, 0, 1, 0.9921569, 1,
-0.01365928, 1.544035, 0.8950062, 0, 1, 1, 1,
-0.01290064, -0.6245999, -3.561978, 0, 0.9921569, 1, 1,
-0.01266664, -1.173913, -3.09444, 0, 0.9882353, 1, 1,
-0.009687269, 1.543531, 0.4333968, 0, 0.9803922, 1, 1,
-0.006321225, 0.493155, 1.003628, 0, 0.9764706, 1, 1,
-0.005512394, 0.343176, 0.3370457, 0, 0.9686275, 1, 1,
-0.005138914, 0.9751904, -0.1547765, 0, 0.9647059, 1, 1,
-0.003439714, 1.151294, -0.4391834, 0, 0.9568627, 1, 1,
0.002979608, 0.3962229, -0.1833346, 0, 0.9529412, 1, 1,
0.003639342, 1.124471, -2.491416, 0, 0.945098, 1, 1,
0.005324519, -0.7773789, 4.068775, 0, 0.9411765, 1, 1,
0.007441492, -0.893073, 2.405131, 0, 0.9333333, 1, 1,
0.008441142, -0.6425241, 2.638355, 0, 0.9294118, 1, 1,
0.009357189, -0.4710176, 1.82482, 0, 0.9215686, 1, 1,
0.009388884, -0.5546358, 1.944879, 0, 0.9176471, 1, 1,
0.01147558, -0.08235844, 3.178694, 0, 0.9098039, 1, 1,
0.01719229, 1.307974, -1.404277, 0, 0.9058824, 1, 1,
0.01797317, 1.597365, 0.9760084, 0, 0.8980392, 1, 1,
0.01913223, -0.6918964, 3.325505, 0, 0.8901961, 1, 1,
0.02203772, -0.8038062, 2.839373, 0, 0.8862745, 1, 1,
0.02363314, 1.052843, 0.4322945, 0, 0.8784314, 1, 1,
0.02422998, 0.07561884, -1.11595, 0, 0.8745098, 1, 1,
0.02817594, -0.70891, 3.582225, 0, 0.8666667, 1, 1,
0.0338457, -0.6380087, 2.872128, 0, 0.8627451, 1, 1,
0.03549351, 0.3780924, 0.3216653, 0, 0.854902, 1, 1,
0.03638068, -0.1776741, 2.223968, 0, 0.8509804, 1, 1,
0.04296719, 0.345683, 0.09451742, 0, 0.8431373, 1, 1,
0.04686003, -0.05040803, 3.133882, 0, 0.8392157, 1, 1,
0.04753786, -1.268626, 2.610869, 0, 0.8313726, 1, 1,
0.04835291, -0.1964165, 2.841324, 0, 0.827451, 1, 1,
0.05485279, -0.5328331, 3.240747, 0, 0.8196079, 1, 1,
0.0590455, -0.4148457, 3.586154, 0, 0.8156863, 1, 1,
0.06141434, -1.007767, 3.682016, 0, 0.8078431, 1, 1,
0.06168559, -0.0932643, 2.970387, 0, 0.8039216, 1, 1,
0.0645631, 1.637159, -0.2049949, 0, 0.7960784, 1, 1,
0.0665874, 0.7682711, -0.8884275, 0, 0.7882353, 1, 1,
0.06748477, 0.6369945, -0.4292007, 0, 0.7843137, 1, 1,
0.0675104, 0.3788678, 1.701983, 0, 0.7764706, 1, 1,
0.06914721, -0.4203949, 2.571416, 0, 0.772549, 1, 1,
0.06941437, 0.8543923, -0.6654795, 0, 0.7647059, 1, 1,
0.07020593, -0.5260686, 2.246173, 0, 0.7607843, 1, 1,
0.07250313, -0.4111424, 3.827309, 0, 0.7529412, 1, 1,
0.07393119, -2.03712, 4.442669, 0, 0.7490196, 1, 1,
0.07787526, 0.4966493, -0.4781961, 0, 0.7411765, 1, 1,
0.08049934, -2.143759, 3.913936, 0, 0.7372549, 1, 1,
0.0815471, 1.893718, -0.9596289, 0, 0.7294118, 1, 1,
0.08239596, 0.1785135, 1.050875, 0, 0.7254902, 1, 1,
0.08612254, -0.8942107, 3.244302, 0, 0.7176471, 1, 1,
0.08684319, 0.05536675, -0.3236755, 0, 0.7137255, 1, 1,
0.08734993, -0.4535618, 2.125607, 0, 0.7058824, 1, 1,
0.08770837, 0.3803053, -0.4994224, 0, 0.6980392, 1, 1,
0.09564566, -0.1648799, 0.7595871, 0, 0.6941177, 1, 1,
0.09904549, -1.875281, 1.382862, 0, 0.6862745, 1, 1,
0.09998704, 1.678705, 1.30379, 0, 0.682353, 1, 1,
0.1055189, 1.405143, -0.5968342, 0, 0.6745098, 1, 1,
0.1124837, 0.2876936, 2.189404, 0, 0.6705883, 1, 1,
0.1146205, -0.4733694, 3.480052, 0, 0.6627451, 1, 1,
0.1180189, 0.01332461, 0.2679617, 0, 0.6588235, 1, 1,
0.1251954, 1.036286, 0.5521259, 0, 0.6509804, 1, 1,
0.1266731, -0.9286815, 2.062943, 0, 0.6470588, 1, 1,
0.1334844, -0.7021895, 3.082894, 0, 0.6392157, 1, 1,
0.1354527, 0.212469, 0.4252533, 0, 0.6352941, 1, 1,
0.1389968, -0.47032, 2.499404, 0, 0.627451, 1, 1,
0.1425766, 1.031075, -0.6484644, 0, 0.6235294, 1, 1,
0.1455719, -0.05722865, 3.014568, 0, 0.6156863, 1, 1,
0.1464301, -1.075912, 3.196616, 0, 0.6117647, 1, 1,
0.1468679, 1.848819, 1.00068, 0, 0.6039216, 1, 1,
0.1491644, 0.4318981, 1.110818, 0, 0.5960785, 1, 1,
0.149733, 0.6020995, -0.6770327, 0, 0.5921569, 1, 1,
0.1505846, -0.6360675, 2.815119, 0, 0.5843138, 1, 1,
0.158832, 0.08255921, 1.250585, 0, 0.5803922, 1, 1,
0.1590564, -1.149316, 6.309117, 0, 0.572549, 1, 1,
0.1613705, 1.351446, 0.9187236, 0, 0.5686275, 1, 1,
0.1623975, -0.6906896, 4.25838, 0, 0.5607843, 1, 1,
0.1680846, -1.907909, 2.647316, 0, 0.5568628, 1, 1,
0.1706101, -1.184276, 2.85292, 0, 0.5490196, 1, 1,
0.1716781, -1.319308, 2.898412, 0, 0.5450981, 1, 1,
0.1723841, 0.04500427, 0.6290517, 0, 0.5372549, 1, 1,
0.1731929, 0.927267, 0.919915, 0, 0.5333334, 1, 1,
0.1778298, -0.01225656, 1.536248, 0, 0.5254902, 1, 1,
0.180606, 1.227401, -1.50039, 0, 0.5215687, 1, 1,
0.18666, 2.41044, -0.4496442, 0, 0.5137255, 1, 1,
0.1883213, -0.1022879, 2.10524, 0, 0.509804, 1, 1,
0.1906038, 1.990582, -0.2028894, 0, 0.5019608, 1, 1,
0.1907132, 0.7691466, -0.145417, 0, 0.4941176, 1, 1,
0.2062846, 0.5690395, 0.2232702, 0, 0.4901961, 1, 1,
0.2082681, -0.6356587, 2.419929, 0, 0.4823529, 1, 1,
0.2114961, 0.2726156, 3.134118, 0, 0.4784314, 1, 1,
0.2118481, 0.7328115, -1.520906, 0, 0.4705882, 1, 1,
0.2126908, -0.007933058, 2.548781, 0, 0.4666667, 1, 1,
0.2132997, 0.1481565, 3.563698, 0, 0.4588235, 1, 1,
0.2163972, 1.162036, -0.8707128, 0, 0.454902, 1, 1,
0.2184706, -0.2304072, 2.884802, 0, 0.4470588, 1, 1,
0.2185197, -1.900471, 3.533042, 0, 0.4431373, 1, 1,
0.2204374, 0.2307389, -0.4886044, 0, 0.4352941, 1, 1,
0.2210186, -0.2603039, 2.668511, 0, 0.4313726, 1, 1,
0.2235015, -1.04291, 4.118494, 0, 0.4235294, 1, 1,
0.2235222, 2.499657, -0.2051148, 0, 0.4196078, 1, 1,
0.2238619, 0.8450038, -0.5153325, 0, 0.4117647, 1, 1,
0.2265176, 1.090697, 0.2621842, 0, 0.4078431, 1, 1,
0.2267312, 0.9525247, -0.1985663, 0, 0.4, 1, 1,
0.2270153, 0.6336187, 1.870049, 0, 0.3921569, 1, 1,
0.229379, 0.3146928, 1.322284, 0, 0.3882353, 1, 1,
0.2310554, 0.7582528, 1.35426, 0, 0.3803922, 1, 1,
0.2444989, 1.191232, 1.548875, 0, 0.3764706, 1, 1,
0.2452642, -1.792818, 2.000302, 0, 0.3686275, 1, 1,
0.2459067, 0.2068286, 0.7459033, 0, 0.3647059, 1, 1,
0.2469561, 0.1310076, 1.663763, 0, 0.3568628, 1, 1,
0.2499504, -1.652645, 4.247637, 0, 0.3529412, 1, 1,
0.2503437, -0.1012382, 1.845545, 0, 0.345098, 1, 1,
0.2510813, -0.4820901, 4.249709, 0, 0.3411765, 1, 1,
0.2524044, -0.454519, 2.477415, 0, 0.3333333, 1, 1,
0.2545319, -0.7836179, 3.610899, 0, 0.3294118, 1, 1,
0.2546967, -0.4631333, 5.49683, 0, 0.3215686, 1, 1,
0.2562692, -0.11851, 0.6177928, 0, 0.3176471, 1, 1,
0.2567359, -0.1919967, 1.877969, 0, 0.3098039, 1, 1,
0.2605644, 0.00578733, 2.391173, 0, 0.3058824, 1, 1,
0.2608407, 0.9684445, -0.4319359, 0, 0.2980392, 1, 1,
0.261552, -2.349385, 4.00443, 0, 0.2901961, 1, 1,
0.2706416, 0.8404539, -0.1497878, 0, 0.2862745, 1, 1,
0.2727254, 0.3108325, 0.6233716, 0, 0.2784314, 1, 1,
0.2756755, -1.645698, 4.56642, 0, 0.2745098, 1, 1,
0.2768443, -1.489883, 3.744553, 0, 0.2666667, 1, 1,
0.2771914, -1.797138, 2.602864, 0, 0.2627451, 1, 1,
0.2787363, -0.4814058, 3.22458, 0, 0.254902, 1, 1,
0.2799008, 1.4147, -0.01311104, 0, 0.2509804, 1, 1,
0.2897592, -0.01309759, 3.91664, 0, 0.2431373, 1, 1,
0.2995674, 0.4857429, 0.1041367, 0, 0.2392157, 1, 1,
0.3021765, 0.4380582, 1.218576, 0, 0.2313726, 1, 1,
0.3039297, 0.236347, 1.583698, 0, 0.227451, 1, 1,
0.3053133, -0.1638131, 1.972547, 0, 0.2196078, 1, 1,
0.3090946, -1.091357, 1.710035, 0, 0.2156863, 1, 1,
0.3120066, 0.4977275, 1.710213, 0, 0.2078431, 1, 1,
0.3171576, 0.2967307, 1.662598, 0, 0.2039216, 1, 1,
0.3238612, 1.452055, 0.6092502, 0, 0.1960784, 1, 1,
0.3254845, -0.5729927, 2.607692, 0, 0.1882353, 1, 1,
0.3277071, 1.745144, 0.6501961, 0, 0.1843137, 1, 1,
0.3311142, -0.5632831, 0.7823251, 0, 0.1764706, 1, 1,
0.3335884, -1.271971, 3.714769, 0, 0.172549, 1, 1,
0.3353717, -0.05899899, 0.06967841, 0, 0.1647059, 1, 1,
0.3393863, 0.7426096, 2.46932, 0, 0.1607843, 1, 1,
0.345014, -0.3548115, 1.201885, 0, 0.1529412, 1, 1,
0.3456886, 0.9499078, -0.3101408, 0, 0.1490196, 1, 1,
0.349453, -0.4336388, 2.310425, 0, 0.1411765, 1, 1,
0.351585, 0.1827423, 0.7884188, 0, 0.1372549, 1, 1,
0.3537904, 0.9562253, 0.2047374, 0, 0.1294118, 1, 1,
0.3546386, 0.4988464, 0.9308324, 0, 0.1254902, 1, 1,
0.3546568, -1.115802, 3.254045, 0, 0.1176471, 1, 1,
0.3547038, 1.011778, 1.053589, 0, 0.1137255, 1, 1,
0.3555866, 1.047552, 0.7610869, 0, 0.1058824, 1, 1,
0.3633316, -0.1748366, 1.772609, 0, 0.09803922, 1, 1,
0.3716229, -0.8418087, 2.895301, 0, 0.09411765, 1, 1,
0.3719674, 1.473739, 1.928159, 0, 0.08627451, 1, 1,
0.3790939, -0.24605, 2.376188, 0, 0.08235294, 1, 1,
0.3792906, -1.090188, 3.846561, 0, 0.07450981, 1, 1,
0.3793657, -0.3673147, 2.235786, 0, 0.07058824, 1, 1,
0.3876969, 0.5441746, 1.346912, 0, 0.0627451, 1, 1,
0.3952692, 0.1126435, -1.675017, 0, 0.05882353, 1, 1,
0.4021694, 0.06215945, 2.425239, 0, 0.05098039, 1, 1,
0.4027992, -0.6712995, 1.500524, 0, 0.04705882, 1, 1,
0.4033792, 0.3472777, 2.079243, 0, 0.03921569, 1, 1,
0.4045939, -0.04465876, -0.4143323, 0, 0.03529412, 1, 1,
0.406799, -0.6119679, 2.344293, 0, 0.02745098, 1, 1,
0.4088745, 0.7596722, -0.1896687, 0, 0.02352941, 1, 1,
0.4097017, -0.2714558, 1.538345, 0, 0.01568628, 1, 1,
0.41346, -1.287994, 4.269931, 0, 0.01176471, 1, 1,
0.4154843, 0.3384724, 1.565629, 0, 0.003921569, 1, 1,
0.4190268, 0.02917777, 0.2302962, 0.003921569, 0, 1, 1,
0.422258, -0.706988, 3.11851, 0.007843138, 0, 1, 1,
0.4233867, -0.3061613, 2.199317, 0.01568628, 0, 1, 1,
0.4265511, 0.6278596, 0.2228503, 0.01960784, 0, 1, 1,
0.430831, -0.9193204, 1.289363, 0.02745098, 0, 1, 1,
0.4345165, -0.5227038, 2.823216, 0.03137255, 0, 1, 1,
0.4428509, 0.012239, 2.612737, 0.03921569, 0, 1, 1,
0.4432413, 1.023905, 0.7536147, 0.04313726, 0, 1, 1,
0.449441, -0.9704176, 1.046529, 0.05098039, 0, 1, 1,
0.4511364, -0.2342259, 2.375149, 0.05490196, 0, 1, 1,
0.4567856, -0.7643158, 3.981648, 0.0627451, 0, 1, 1,
0.4569858, 1.689871, -0.2476797, 0.06666667, 0, 1, 1,
0.4575961, -0.8912438, 3.951962, 0.07450981, 0, 1, 1,
0.4588274, 0.1771559, 0.1386388, 0.07843138, 0, 1, 1,
0.4601149, 1.690871, 0.7661495, 0.08627451, 0, 1, 1,
0.4697941, 0.8485628, 0.7234143, 0.09019608, 0, 1, 1,
0.4703262, -0.920887, 1.497239, 0.09803922, 0, 1, 1,
0.4709716, -0.5829251, 2.786438, 0.1058824, 0, 1, 1,
0.4765608, 0.07504375, 1.183335, 0.1098039, 0, 1, 1,
0.4798511, -0.5463969, 2.200089, 0.1176471, 0, 1, 1,
0.4825868, 0.0789293, 2.499561, 0.1215686, 0, 1, 1,
0.4855412, -0.1758424, 0.8533643, 0.1294118, 0, 1, 1,
0.4891989, -0.1675671, 1.465691, 0.1333333, 0, 1, 1,
0.489706, 1.820837, 1.102716, 0.1411765, 0, 1, 1,
0.4898137, -0.3230703, 2.560844, 0.145098, 0, 1, 1,
0.4915208, 0.2062411, 0.2751051, 0.1529412, 0, 1, 1,
0.4931416, 1.160093, 0.1354111, 0.1568628, 0, 1, 1,
0.4932505, -0.32555, 1.374012, 0.1647059, 0, 1, 1,
0.499091, 2.929558, 0.954385, 0.1686275, 0, 1, 1,
0.5013199, 0.2419756, 2.14204, 0.1764706, 0, 1, 1,
0.5040493, 0.1413411, 1.44272, 0.1803922, 0, 1, 1,
0.5046253, -0.4592926, 1.955434, 0.1882353, 0, 1, 1,
0.5054001, 0.8348041, 1.697047, 0.1921569, 0, 1, 1,
0.5071723, -0.3195837, 4.271335, 0.2, 0, 1, 1,
0.516395, 0.7748558, -0.9766135, 0.2078431, 0, 1, 1,
0.5233005, 0.7711273, 1.061745, 0.2117647, 0, 1, 1,
0.5314101, 0.3318515, 0.7381703, 0.2196078, 0, 1, 1,
0.5348715, -0.1391622, 1.78796, 0.2235294, 0, 1, 1,
0.5378957, 0.4652674, 1.03793, 0.2313726, 0, 1, 1,
0.5395387, 1.748862, -0.5357059, 0.2352941, 0, 1, 1,
0.5445524, -0.2719013, 1.881041, 0.2431373, 0, 1, 1,
0.5545623, 0.1880145, -0.0251918, 0.2470588, 0, 1, 1,
0.5592365, -0.4870874, 2.006149, 0.254902, 0, 1, 1,
0.5602998, 0.1340574, 1.078203, 0.2588235, 0, 1, 1,
0.5613966, 0.03461463, 1.531009, 0.2666667, 0, 1, 1,
0.5628071, 0.1853831, 1.882604, 0.2705882, 0, 1, 1,
0.5642942, -1.553748, 2.890487, 0.2784314, 0, 1, 1,
0.5676515, 0.05048695, 2.519234, 0.282353, 0, 1, 1,
0.5773492, 0.1809714, 0.8131193, 0.2901961, 0, 1, 1,
0.5784779, 0.5092286, 1.052658, 0.2941177, 0, 1, 1,
0.5806929, -0.4294974, 2.737868, 0.3019608, 0, 1, 1,
0.5819303, -0.8577394, 2.663802, 0.3098039, 0, 1, 1,
0.5836748, 1.335671, 0.3891423, 0.3137255, 0, 1, 1,
0.589031, -0.1153126, 3.355958, 0.3215686, 0, 1, 1,
0.5936391, 1.697869, 0.07519247, 0.3254902, 0, 1, 1,
0.5963315, -1.065031, 4.196813, 0.3333333, 0, 1, 1,
0.5982638, 1.611619, 0.8536212, 0.3372549, 0, 1, 1,
0.6011195, -1.065706, 2.742558, 0.345098, 0, 1, 1,
0.6023111, -0.02400583, 2.105198, 0.3490196, 0, 1, 1,
0.605213, 0.6707363, 0.326282, 0.3568628, 0, 1, 1,
0.6061137, 0.7439129, 2.805973, 0.3607843, 0, 1, 1,
0.6078587, -0.980401, 1.353053, 0.3686275, 0, 1, 1,
0.6095159, -1.400728, 2.218666, 0.372549, 0, 1, 1,
0.6212127, -1.161852, 2.203387, 0.3803922, 0, 1, 1,
0.6224257, -0.9148402, 3.806648, 0.3843137, 0, 1, 1,
0.6229989, -0.1700448, 0.7917361, 0.3921569, 0, 1, 1,
0.6305579, -1.573532, 1.154701, 0.3960784, 0, 1, 1,
0.6314147, -1.222682, 2.631321, 0.4039216, 0, 1, 1,
0.636889, -0.8510491, 2.844392, 0.4117647, 0, 1, 1,
0.6373078, -0.811358, 2.223649, 0.4156863, 0, 1, 1,
0.6407416, 1.097108, 1.402719, 0.4235294, 0, 1, 1,
0.6434061, 0.4287748, 0.1303165, 0.427451, 0, 1, 1,
0.6488687, 0.1235438, 0.9859356, 0.4352941, 0, 1, 1,
0.6574696, 0.5886969, 0.5200076, 0.4392157, 0, 1, 1,
0.6667905, -0.469073, 1.997449, 0.4470588, 0, 1, 1,
0.667608, -1.025946, 3.06929, 0.4509804, 0, 1, 1,
0.6694619, -0.2441939, 0.5906018, 0.4588235, 0, 1, 1,
0.6752785, 0.2645744, 0.5513042, 0.4627451, 0, 1, 1,
0.6753363, 0.8277662, -0.03916607, 0.4705882, 0, 1, 1,
0.6809478, -0.8833461, 1.621759, 0.4745098, 0, 1, 1,
0.6835746, 0.6147979, -0.003748382, 0.4823529, 0, 1, 1,
0.6839879, 0.1489681, 0.4239277, 0.4862745, 0, 1, 1,
0.6889239, -0.4322477, 3.100198, 0.4941176, 0, 1, 1,
0.6902105, -0.2048778, 2.794383, 0.5019608, 0, 1, 1,
0.6904293, -1.655049, 2.874351, 0.5058824, 0, 1, 1,
0.6908912, 0.3526748, 0.9916599, 0.5137255, 0, 1, 1,
0.6922019, 0.5620906, 1.239648, 0.5176471, 0, 1, 1,
0.6926135, -0.4839717, 1.671361, 0.5254902, 0, 1, 1,
0.6941022, -0.2458322, 0.03605417, 0.5294118, 0, 1, 1,
0.6954356, 0.1620928, 0.8456247, 0.5372549, 0, 1, 1,
0.6955376, 0.3366712, 1.98094, 0.5411765, 0, 1, 1,
0.7001501, 0.8678094, 1.364349, 0.5490196, 0, 1, 1,
0.7067619, -0.4036403, 2.604196, 0.5529412, 0, 1, 1,
0.7097816, -0.8450274, 1.914359, 0.5607843, 0, 1, 1,
0.7136556, -1.624761, 2.710953, 0.5647059, 0, 1, 1,
0.7186585, -0.2629024, 1.069373, 0.572549, 0, 1, 1,
0.7252451, 1.343651, 0.3962477, 0.5764706, 0, 1, 1,
0.726118, -0.7505137, 3.426232, 0.5843138, 0, 1, 1,
0.7282513, -1.25996, 1.460248, 0.5882353, 0, 1, 1,
0.7295153, 0.569003, 1.071256, 0.5960785, 0, 1, 1,
0.7316607, 0.006889753, 1.720794, 0.6039216, 0, 1, 1,
0.7346455, -0.5997259, 4.082397, 0.6078432, 0, 1, 1,
0.7480908, -0.06475765, 1.736976, 0.6156863, 0, 1, 1,
0.7518467, 0.383363, 0.8194724, 0.6196079, 0, 1, 1,
0.7588401, -1.079162, 2.503566, 0.627451, 0, 1, 1,
0.7616882, -0.6077822, 1.968639, 0.6313726, 0, 1, 1,
0.7686172, -0.3755906, 2.171403, 0.6392157, 0, 1, 1,
0.7707055, 0.5232306, 0.6037468, 0.6431373, 0, 1, 1,
0.7720821, -0.8923723, 2.795274, 0.6509804, 0, 1, 1,
0.7731324, -0.7886577, 3.063538, 0.654902, 0, 1, 1,
0.7784259, 1.34429, -0.1171037, 0.6627451, 0, 1, 1,
0.7840801, 0.4635918, 0.2503841, 0.6666667, 0, 1, 1,
0.7960634, 0.02466772, -0.1689407, 0.6745098, 0, 1, 1,
0.8007527, 1.197395, 2.490439, 0.6784314, 0, 1, 1,
0.802804, 0.101439, 0.2290711, 0.6862745, 0, 1, 1,
0.8054491, 0.2409319, 1.861176, 0.6901961, 0, 1, 1,
0.8068735, -0.8252747, 1.77705, 0.6980392, 0, 1, 1,
0.8070812, 0.298327, 1.861814, 0.7058824, 0, 1, 1,
0.8074387, 0.2163069, -0.1170297, 0.7098039, 0, 1, 1,
0.8105198, 0.05758398, 1.174702, 0.7176471, 0, 1, 1,
0.8111297, -0.1938767, 1.770494, 0.7215686, 0, 1, 1,
0.8136773, 1.369271, 0.7072167, 0.7294118, 0, 1, 1,
0.8147088, 2.645133, 1.419704, 0.7333333, 0, 1, 1,
0.816155, -0.0952663, 1.532471, 0.7411765, 0, 1, 1,
0.8167995, -2.177452, 2.584036, 0.7450981, 0, 1, 1,
0.8172057, -0.7110267, 1.319485, 0.7529412, 0, 1, 1,
0.817347, -1.832116, 3.983017, 0.7568628, 0, 1, 1,
0.8225825, 0.9200239, 1.144007, 0.7647059, 0, 1, 1,
0.8249779, -2.303624, 2.644651, 0.7686275, 0, 1, 1,
0.8306699, 0.8272561, 2.435389, 0.7764706, 0, 1, 1,
0.8404385, 0.7395972, 0.2288608, 0.7803922, 0, 1, 1,
0.8457632, 0.3419949, 0.4906543, 0.7882353, 0, 1, 1,
0.8518975, 1.013066, 1.172948, 0.7921569, 0, 1, 1,
0.8550896, -0.468779, 2.447357, 0.8, 0, 1, 1,
0.8604571, -1.136703, 1.829089, 0.8078431, 0, 1, 1,
0.8620151, 0.8558462, -0.6101889, 0.8117647, 0, 1, 1,
0.8852198, -0.0723417, 2.999197, 0.8196079, 0, 1, 1,
0.8861421, 0.1421059, 1.528712, 0.8235294, 0, 1, 1,
0.8918341, 0.7792736, 0.8574015, 0.8313726, 0, 1, 1,
0.892507, 0.9020733, 0.5060005, 0.8352941, 0, 1, 1,
0.8965834, 0.1204886, 1.241845, 0.8431373, 0, 1, 1,
0.9227812, -0.9578198, 2.031959, 0.8470588, 0, 1, 1,
0.9269934, -1.605229, 2.515724, 0.854902, 0, 1, 1,
0.9293022, -0.403836, 3.070059, 0.8588235, 0, 1, 1,
0.9345492, 1.324751, -0.4105692, 0.8666667, 0, 1, 1,
0.9380187, -0.5951568, 1.402598, 0.8705882, 0, 1, 1,
0.9387212, -0.4721203, 0.3346547, 0.8784314, 0, 1, 1,
0.9415867, 0.8191797, 1.349188, 0.8823529, 0, 1, 1,
0.9424914, -1.264477, 2.63764, 0.8901961, 0, 1, 1,
0.9427566, -1.402434, 0.3592202, 0.8941177, 0, 1, 1,
0.9582043, -0.05510357, 2.407668, 0.9019608, 0, 1, 1,
0.9623461, 0.1148162, -0.342002, 0.9098039, 0, 1, 1,
0.9658856, 1.264987, 1.064543, 0.9137255, 0, 1, 1,
0.9728829, 0.3988023, 1.073196, 0.9215686, 0, 1, 1,
0.9762263, -0.4587109, 3.209817, 0.9254902, 0, 1, 1,
0.9777642, 0.04019396, 2.068628, 0.9333333, 0, 1, 1,
0.9918966, -1.23651, 2.15907, 0.9372549, 0, 1, 1,
0.9989107, -1.257393, 1.616205, 0.945098, 0, 1, 1,
0.999441, 0.03260658, 4.826867, 0.9490196, 0, 1, 1,
1.001655, -0.6981062, 2.385498, 0.9568627, 0, 1, 1,
1.004791, -0.5205492, 5.226373, 0.9607843, 0, 1, 1,
1.012692, 1.633257, 0.3825619, 0.9686275, 0, 1, 1,
1.013722, -0.1399246, 2.516028, 0.972549, 0, 1, 1,
1.019722, -1.133631, 1.977379, 0.9803922, 0, 1, 1,
1.020502, 1.131206, -0.3930371, 0.9843137, 0, 1, 1,
1.021667, 1.526259, 1.484143, 0.9921569, 0, 1, 1,
1.02269, 0.393904, 1.113417, 0.9960784, 0, 1, 1,
1.026584, 0.05728192, 1.542009, 1, 0, 0.9960784, 1,
1.027907, -1.225885, 1.016421, 1, 0, 0.9882353, 1,
1.031328, -0.782232, 1.41609, 1, 0, 0.9843137, 1,
1.032217, 1.081098, 1.839008, 1, 0, 0.9764706, 1,
1.044896, 1.523962, 1.644423, 1, 0, 0.972549, 1,
1.046632, -0.1642766, 2.881438, 1, 0, 0.9647059, 1,
1.048813, 0.3609219, -0.2252626, 1, 0, 0.9607843, 1,
1.054541, 0.2335012, 1.327935, 1, 0, 0.9529412, 1,
1.066454, 1.941269, -0.7604946, 1, 0, 0.9490196, 1,
1.071667, -0.4833457, 2.027131, 1, 0, 0.9411765, 1,
1.074123, -0.560387, 0.3775075, 1, 0, 0.9372549, 1,
1.074446, -0.8467045, 0.6521625, 1, 0, 0.9294118, 1,
1.076684, 0.1047988, 2.027679, 1, 0, 0.9254902, 1,
1.07717, -0.4441981, 1.874304, 1, 0, 0.9176471, 1,
1.084387, -0.8892096, 1.947819, 1, 0, 0.9137255, 1,
1.08788, -1.299809, 2.22891, 1, 0, 0.9058824, 1,
1.09131, 2.412975, 0.5427254, 1, 0, 0.9019608, 1,
1.10061, -1.267553, 1.258637, 1, 0, 0.8941177, 1,
1.102579, 0.008825342, 2.010761, 1, 0, 0.8862745, 1,
1.103361, 0.2876009, 0.4503259, 1, 0, 0.8823529, 1,
1.104233, -0.1416483, 1.527965, 1, 0, 0.8745098, 1,
1.105841, 0.858, 1.44285, 1, 0, 0.8705882, 1,
1.106244, 0.542808, 1.117963, 1, 0, 0.8627451, 1,
1.124943, 0.6882783, 2.457238, 1, 0, 0.8588235, 1,
1.134421, 2.417773, 0.3866578, 1, 0, 0.8509804, 1,
1.144353, 0.5211344, -1.808482, 1, 0, 0.8470588, 1,
1.144518, -0.2056004, 3.007554, 1, 0, 0.8392157, 1,
1.147967, -1.404121, 2.53295, 1, 0, 0.8352941, 1,
1.152307, -1.220677, 3.141521, 1, 0, 0.827451, 1,
1.161677, 0.7946391, 0.8331755, 1, 0, 0.8235294, 1,
1.169137, 0.9111872, 1.422615, 1, 0, 0.8156863, 1,
1.184143, -1.292411, 3.05878, 1, 0, 0.8117647, 1,
1.187747, 1.085147, 1.053649, 1, 0, 0.8039216, 1,
1.192238, 0.7024504, 1.831817, 1, 0, 0.7960784, 1,
1.203021, -1.067929, 3.518163, 1, 0, 0.7921569, 1,
1.210148, 0.2404555, 3.596565, 1, 0, 0.7843137, 1,
1.214081, 1.114609, 1.542641, 1, 0, 0.7803922, 1,
1.219741, 0.1625076, 0.8720394, 1, 0, 0.772549, 1,
1.221917, 0.2785787, 1.859945, 1, 0, 0.7686275, 1,
1.228694, -0.7482948, 3.993427, 1, 0, 0.7607843, 1,
1.233189, -1.091771, 2.497661, 1, 0, 0.7568628, 1,
1.23475, 1.280311, 0.1522583, 1, 0, 0.7490196, 1,
1.236063, -1.561511, 1.153891, 1, 0, 0.7450981, 1,
1.243136, 0.4749924, 2.563689, 1, 0, 0.7372549, 1,
1.243853, 2.569896, 1.068357, 1, 0, 0.7333333, 1,
1.24712, -1.243808, 2.26039, 1, 0, 0.7254902, 1,
1.255362, -1.502618, 1.222762, 1, 0, 0.7215686, 1,
1.256867, 1.106055, -0.6855513, 1, 0, 0.7137255, 1,
1.258711, 0.6384602, 0.5114994, 1, 0, 0.7098039, 1,
1.270662, 0.192853, 0.7465671, 1, 0, 0.7019608, 1,
1.271959, -0.1314922, 0.1669737, 1, 0, 0.6941177, 1,
1.300796, -0.3372283, 2.153391, 1, 0, 0.6901961, 1,
1.317736, 0.4285126, -0.01915865, 1, 0, 0.682353, 1,
1.318601, 0.1960133, -0.5254308, 1, 0, 0.6784314, 1,
1.3351, 0.2604433, 2.498169, 1, 0, 0.6705883, 1,
1.337701, 0.9597173, 0.5950819, 1, 0, 0.6666667, 1,
1.340064, -0.6983491, 2.133674, 1, 0, 0.6588235, 1,
1.34399, 0.6233871, -0.6446959, 1, 0, 0.654902, 1,
1.346601, -1.055825, 2.911675, 1, 0, 0.6470588, 1,
1.34681, 1.305349, 0.9487023, 1, 0, 0.6431373, 1,
1.353314, -2.340265, 1.451799, 1, 0, 0.6352941, 1,
1.3604, -0.5537059, 2.030361, 1, 0, 0.6313726, 1,
1.361233, -0.2578088, 0.4683025, 1, 0, 0.6235294, 1,
1.362171, 1.252208, 2.303605, 1, 0, 0.6196079, 1,
1.373594, -0.05704504, 4.38238, 1, 0, 0.6117647, 1,
1.373648, -0.4058398, 2.381043, 1, 0, 0.6078432, 1,
1.38785, -0.0752707, 3.671982, 1, 0, 0.6, 1,
1.394618, 1.31601, -0.4585514, 1, 0, 0.5921569, 1,
1.424889, 0.8122097, 1.856669, 1, 0, 0.5882353, 1,
1.425244, -0.5153115, 3.113691, 1, 0, 0.5803922, 1,
1.437862, 0.7232587, 3.01631, 1, 0, 0.5764706, 1,
1.443374, 0.2699921, 2.534853, 1, 0, 0.5686275, 1,
1.447861, -0.4644434, 1.44102, 1, 0, 0.5647059, 1,
1.453034, 1.516378, -1.778428, 1, 0, 0.5568628, 1,
1.461744, 0.5308795, 0.9421015, 1, 0, 0.5529412, 1,
1.465322, 0.6085973, 2.310625, 1, 0, 0.5450981, 1,
1.471298, 2.070996, 1.894306, 1, 0, 0.5411765, 1,
1.483254, -1.91797, 1.427098, 1, 0, 0.5333334, 1,
1.490507, -0.5714974, 4.441023, 1, 0, 0.5294118, 1,
1.495658, -0.9208044, 1.724763, 1, 0, 0.5215687, 1,
1.511918, -0.04851834, 2.640364, 1, 0, 0.5176471, 1,
1.512016, 0.6362762, 0.7414917, 1, 0, 0.509804, 1,
1.512891, 0.1974321, 1.42497, 1, 0, 0.5058824, 1,
1.514018, 2.167812, 1.147956, 1, 0, 0.4980392, 1,
1.519536, 0.246623, 0.7109712, 1, 0, 0.4901961, 1,
1.519998, -1.247329, 2.20217, 1, 0, 0.4862745, 1,
1.530838, -0.7974521, 0.4025327, 1, 0, 0.4784314, 1,
1.5314, -0.09392893, 2.478729, 1, 0, 0.4745098, 1,
1.542681, -0.7342366, 1.945792, 1, 0, 0.4666667, 1,
1.559162, -0.2126094, 2.988871, 1, 0, 0.4627451, 1,
1.562143, 1.788368, 2.268898, 1, 0, 0.454902, 1,
1.574182, 0.5475143, 0.6793165, 1, 0, 0.4509804, 1,
1.585662, 0.8233981, 0.7076042, 1, 0, 0.4431373, 1,
1.591781, -0.09160531, 1.597368, 1, 0, 0.4392157, 1,
1.595781, 0.8868361, 0.2642501, 1, 0, 0.4313726, 1,
1.603743, 0.6170262, 2.12534, 1, 0, 0.427451, 1,
1.615512, -0.5512832, 3.207789, 1, 0, 0.4196078, 1,
1.616891, -0.01091755, 2.826736, 1, 0, 0.4156863, 1,
1.618387, -0.5052639, 2.899837, 1, 0, 0.4078431, 1,
1.622656, -0.4506426, 1.736017, 1, 0, 0.4039216, 1,
1.623405, 0.9319636, 1.027449, 1, 0, 0.3960784, 1,
1.62844, 0.4535832, 0.5069377, 1, 0, 0.3882353, 1,
1.639938, 0.09375244, 2.266065, 1, 0, 0.3843137, 1,
1.642881, 0.1661297, 1.492722, 1, 0, 0.3764706, 1,
1.66442, -1.521435, 3.392744, 1, 0, 0.372549, 1,
1.67304, -0.3846119, 1.711936, 1, 0, 0.3647059, 1,
1.689015, 0.05144221, 1.853306, 1, 0, 0.3607843, 1,
1.691, -0.3637253, 1.39693, 1, 0, 0.3529412, 1,
1.706559, -0.4630408, 2.815225, 1, 0, 0.3490196, 1,
1.712557, -1.044811, 1.189963, 1, 0, 0.3411765, 1,
1.713429, -0.1281514, 0.365415, 1, 0, 0.3372549, 1,
1.717963, 1.189444, 0.7295302, 1, 0, 0.3294118, 1,
1.753391, 0.2395232, 0.8415318, 1, 0, 0.3254902, 1,
1.754364, -0.2424226, 0.7422749, 1, 0, 0.3176471, 1,
1.756803, 0.5990825, 2.026967, 1, 0, 0.3137255, 1,
1.782404, -0.7515824, 1.570918, 1, 0, 0.3058824, 1,
1.789681, -0.41765, 0.6030964, 1, 0, 0.2980392, 1,
1.792312, -0.2722778, 1.371778, 1, 0, 0.2941177, 1,
1.798624, -0.9964243, 1.820167, 1, 0, 0.2862745, 1,
1.81143, -0.2848794, 2.2432, 1, 0, 0.282353, 1,
1.819155, -0.9978153, 2.82715, 1, 0, 0.2745098, 1,
1.827584, 1.099038, 1.288572, 1, 0, 0.2705882, 1,
1.827674, 0.8741796, -1.181898, 1, 0, 0.2627451, 1,
1.843285, -1.291151, 3.031767, 1, 0, 0.2588235, 1,
1.848275, 0.0379118, 0.2611769, 1, 0, 0.2509804, 1,
1.861996, 0.1276668, 1.778389, 1, 0, 0.2470588, 1,
1.878206, 0.2276237, 1.804411, 1, 0, 0.2392157, 1,
1.880551, 0.2683958, -1.882366, 1, 0, 0.2352941, 1,
1.885208, 0.4327076, 0.8956283, 1, 0, 0.227451, 1,
1.89088, -0.6181757, 0.8914735, 1, 0, 0.2235294, 1,
1.893945, -0.2237278, 3.621763, 1, 0, 0.2156863, 1,
1.910965, -0.3234003, 2.517826, 1, 0, 0.2117647, 1,
1.913075, 1.503301, -0.01933933, 1, 0, 0.2039216, 1,
1.917998, 0.4321721, 0.1073917, 1, 0, 0.1960784, 1,
1.921738, -0.2789659, 2.651835, 1, 0, 0.1921569, 1,
1.931232, 0.570166, 1.054564, 1, 0, 0.1843137, 1,
1.961606, 1.795905, 1.878534, 1, 0, 0.1803922, 1,
1.96414, -0.3046343, 3.096117, 1, 0, 0.172549, 1,
2.009813, -0.1021866, 1.789326, 1, 0, 0.1686275, 1,
2.02459, 0.5437369, 2.014721, 1, 0, 0.1607843, 1,
2.04205, -0.4852317, 3.075227, 1, 0, 0.1568628, 1,
2.06264, 0.04876227, 2.352945, 1, 0, 0.1490196, 1,
2.066447, -0.2320854, 0.4759657, 1, 0, 0.145098, 1,
2.071725, -0.2868336, 0.3013194, 1, 0, 0.1372549, 1,
2.07469, -0.750362, -0.5990036, 1, 0, 0.1333333, 1,
2.079339, 0.3255129, 2.784246, 1, 0, 0.1254902, 1,
2.096632, 1.60851, 2.225995, 1, 0, 0.1215686, 1,
2.12462, 0.459856, 2.161458, 1, 0, 0.1137255, 1,
2.142423, 0.657672, 1.791006, 1, 0, 0.1098039, 1,
2.142855, 0.5635806, 1.104337, 1, 0, 0.1019608, 1,
2.177225, 1.120695, 1.936356, 1, 0, 0.09411765, 1,
2.183663, 0.5647154, 0.4305373, 1, 0, 0.09019608, 1,
2.219417, 0.7674348, 0.7038626, 1, 0, 0.08235294, 1,
2.22306, -1.291425, 2.513014, 1, 0, 0.07843138, 1,
2.282965, -0.3189587, 1.216071, 1, 0, 0.07058824, 1,
2.344944, -0.8039783, 2.264807, 1, 0, 0.06666667, 1,
2.345019, -0.6842946, 3.46089, 1, 0, 0.05882353, 1,
2.367098, 0.01208229, -0.5577857, 1, 0, 0.05490196, 1,
2.384543, -0.09337291, 0.6263642, 1, 0, 0.04705882, 1,
2.400796, 0.9800122, 3.928725, 1, 0, 0.04313726, 1,
2.448422, -0.08521056, 3.225822, 1, 0, 0.03529412, 1,
2.538988, 0.6418711, 0.3957691, 1, 0, 0.03137255, 1,
2.554784, -0.8296798, 1.536414, 1, 0, 0.02352941, 1,
2.594275, -0.6809227, 2.636914, 1, 0, 0.01960784, 1,
2.642769, 0.212238, 1.448538, 1, 0, 0.01176471, 1,
3.519927, 1.150832, 1.89019, 1, 0, 0.007843138, 1
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
-0.1027341, -4.345481, -7.581917, 0, -0.5, 0.5, 0.5,
-0.1027341, -4.345481, -7.581917, 1, -0.5, 0.5, 0.5,
-0.1027341, -4.345481, -7.581917, 1, 1.5, 0.5, 0.5,
-0.1027341, -4.345481, -7.581917, 0, 1.5, 0.5, 0.5
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
-4.953478, -0.1807625, -7.581917, 0, -0.5, 0.5, 0.5,
-4.953478, -0.1807625, -7.581917, 1, -0.5, 0.5, 0.5,
-4.953478, -0.1807625, -7.581917, 1, 1.5, 0.5, 0.5,
-4.953478, -0.1807625, -7.581917, 0, 1.5, 0.5, 0.5
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
-4.953478, -4.345481, 0.3702397, 0, -0.5, 0.5, 0.5,
-4.953478, -4.345481, 0.3702397, 1, -0.5, 0.5, 0.5,
-4.953478, -4.345481, 0.3702397, 1, 1.5, 0.5, 0.5,
-4.953478, -4.345481, 0.3702397, 0, 1.5, 0.5, 0.5
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
-2, -3.384392, -5.746804,
2, -3.384392, -5.746804,
-2, -3.384392, -5.746804,
-2, -3.544574, -6.052656,
0, -3.384392, -5.746804,
0, -3.544574, -6.052656,
2, -3.384392, -5.746804,
2, -3.544574, -6.052656
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
-2, -3.864937, -6.664361, 0, -0.5, 0.5, 0.5,
-2, -3.864937, -6.664361, 1, -0.5, 0.5, 0.5,
-2, -3.864937, -6.664361, 1, 1.5, 0.5, 0.5,
-2, -3.864937, -6.664361, 0, 1.5, 0.5, 0.5,
0, -3.864937, -6.664361, 0, -0.5, 0.5, 0.5,
0, -3.864937, -6.664361, 1, -0.5, 0.5, 0.5,
0, -3.864937, -6.664361, 1, 1.5, 0.5, 0.5,
0, -3.864937, -6.664361, 0, 1.5, 0.5, 0.5,
2, -3.864937, -6.664361, 0, -0.5, 0.5, 0.5,
2, -3.864937, -6.664361, 1, -0.5, 0.5, 0.5,
2, -3.864937, -6.664361, 1, 1.5, 0.5, 0.5,
2, -3.864937, -6.664361, 0, 1.5, 0.5, 0.5
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
-3.834075, -3, -5.746804,
-3.834075, 2, -5.746804,
-3.834075, -3, -5.746804,
-4.020642, -3, -6.052656,
-3.834075, -2, -5.746804,
-4.020642, -2, -6.052656,
-3.834075, -1, -5.746804,
-4.020642, -1, -6.052656,
-3.834075, 0, -5.746804,
-4.020642, 0, -6.052656,
-3.834075, 1, -5.746804,
-4.020642, 1, -6.052656,
-3.834075, 2, -5.746804,
-4.020642, 2, -6.052656
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
-4.393776, -3, -6.664361, 0, -0.5, 0.5, 0.5,
-4.393776, -3, -6.664361, 1, -0.5, 0.5, 0.5,
-4.393776, -3, -6.664361, 1, 1.5, 0.5, 0.5,
-4.393776, -3, -6.664361, 0, 1.5, 0.5, 0.5,
-4.393776, -2, -6.664361, 0, -0.5, 0.5, 0.5,
-4.393776, -2, -6.664361, 1, -0.5, 0.5, 0.5,
-4.393776, -2, -6.664361, 1, 1.5, 0.5, 0.5,
-4.393776, -2, -6.664361, 0, 1.5, 0.5, 0.5,
-4.393776, -1, -6.664361, 0, -0.5, 0.5, 0.5,
-4.393776, -1, -6.664361, 1, -0.5, 0.5, 0.5,
-4.393776, -1, -6.664361, 1, 1.5, 0.5, 0.5,
-4.393776, -1, -6.664361, 0, 1.5, 0.5, 0.5,
-4.393776, 0, -6.664361, 0, -0.5, 0.5, 0.5,
-4.393776, 0, -6.664361, 1, -0.5, 0.5, 0.5,
-4.393776, 0, -6.664361, 1, 1.5, 0.5, 0.5,
-4.393776, 0, -6.664361, 0, 1.5, 0.5, 0.5,
-4.393776, 1, -6.664361, 0, -0.5, 0.5, 0.5,
-4.393776, 1, -6.664361, 1, -0.5, 0.5, 0.5,
-4.393776, 1, -6.664361, 1, 1.5, 0.5, 0.5,
-4.393776, 1, -6.664361, 0, 1.5, 0.5, 0.5,
-4.393776, 2, -6.664361, 0, -0.5, 0.5, 0.5,
-4.393776, 2, -6.664361, 1, -0.5, 0.5, 0.5,
-4.393776, 2, -6.664361, 1, 1.5, 0.5, 0.5,
-4.393776, 2, -6.664361, 0, 1.5, 0.5, 0.5
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
-3.834075, -3.384392, -4,
-3.834075, -3.384392, 6,
-3.834075, -3.384392, -4,
-4.020642, -3.544574, -4,
-3.834075, -3.384392, -2,
-4.020642, -3.544574, -2,
-3.834075, -3.384392, 0,
-4.020642, -3.544574, 0,
-3.834075, -3.384392, 2,
-4.020642, -3.544574, 2,
-3.834075, -3.384392, 4,
-4.020642, -3.544574, 4,
-3.834075, -3.384392, 6,
-4.020642, -3.544574, 6
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
-4.393776, -3.864937, -4, 0, -0.5, 0.5, 0.5,
-4.393776, -3.864937, -4, 1, -0.5, 0.5, 0.5,
-4.393776, -3.864937, -4, 1, 1.5, 0.5, 0.5,
-4.393776, -3.864937, -4, 0, 1.5, 0.5, 0.5,
-4.393776, -3.864937, -2, 0, -0.5, 0.5, 0.5,
-4.393776, -3.864937, -2, 1, -0.5, 0.5, 0.5,
-4.393776, -3.864937, -2, 1, 1.5, 0.5, 0.5,
-4.393776, -3.864937, -2, 0, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 0, 0, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 0, 1, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 0, 1, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 0, 0, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 2, 0, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 2, 1, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 2, 1, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 2, 0, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 4, 0, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 4, 1, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 4, 1, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 4, 0, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 6, 0, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 6, 1, -0.5, 0.5, 0.5,
-4.393776, -3.864937, 6, 1, 1.5, 0.5, 0.5,
-4.393776, -3.864937, 6, 0, 1.5, 0.5, 0.5
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
-3.834075, -3.384392, -5.746804,
-3.834075, 3.022867, -5.746804,
-3.834075, -3.384392, 6.487284,
-3.834075, 3.022867, 6.487284,
-3.834075, -3.384392, -5.746804,
-3.834075, -3.384392, 6.487284,
-3.834075, 3.022867, -5.746804,
-3.834075, 3.022867, 6.487284,
-3.834075, -3.384392, -5.746804,
3.628607, -3.384392, -5.746804,
-3.834075, -3.384392, 6.487284,
3.628607, -3.384392, 6.487284,
-3.834075, 3.022867, -5.746804,
3.628607, 3.022867, -5.746804,
-3.834075, 3.022867, 6.487284,
3.628607, 3.022867, 6.487284,
3.628607, -3.384392, -5.746804,
3.628607, 3.022867, -5.746804,
3.628607, -3.384392, 6.487284,
3.628607, 3.022867, 6.487284,
3.628607, -3.384392, -5.746804,
3.628607, -3.384392, 6.487284,
3.628607, 3.022867, -5.746804,
3.628607, 3.022867, 6.487284
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
var radius = 8.382262;
var distance = 37.29363;
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
mvMatrix.translate( 0.1027341, 0.1807625, -0.3702397 );
mvMatrix.scale( 1.214452, 1.4145, 0.7408044 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.29363);
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
Dimethoxon<-read.table("Dimethoxon.xyz")
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
-3.725395, -0.8162988, -0.234177, 0, 0, 1, 1, 1,
-2.949572, 0.2042165, -0.3945446, 1, 0, 0, 1, 1,
-2.829322, 1.246743, -1.003931, 1, 0, 0, 1, 1,
-2.718144, -0.3650762, -3.74753, 1, 0, 0, 1, 1,
-2.674395, -0.3615304, -3.417804, 1, 0, 0, 1, 1,
-2.513324, -0.07616574, -1.322755, 1, 0, 0, 1, 1,
-2.476273, 0.6345333, -0.5727648, 0, 0, 0, 1, 1,
-2.399359, 0.153242, -2.999552, 0, 0, 0, 1, 1,
-2.337548, 0.1481323, -1.616563, 0, 0, 0, 1, 1,
-2.326542, -0.001890217, -2.944628, 0, 0, 0, 1, 1,
-2.315737, -0.441825, -1.997227, 0, 0, 0, 1, 1,
-2.30218, 0.4740829, -0.0181531, 0, 0, 0, 1, 1,
-2.272943, -1.586824, -2.298253, 0, 0, 0, 1, 1,
-2.254877, 1.072699, -0.9391904, 1, 1, 1, 1, 1,
-2.2244, 0.3446379, -1.08349, 1, 1, 1, 1, 1,
-2.223435, 0.09571572, -2.090772, 1, 1, 1, 1, 1,
-2.196404, -1.518166, -1.833082, 1, 1, 1, 1, 1,
-2.159585, -1.315862, -4.116098, 1, 1, 1, 1, 1,
-2.151283, -3.291083, -1.953034, 1, 1, 1, 1, 1,
-2.151254, 1.30062, -0.01795735, 1, 1, 1, 1, 1,
-2.149946, -0.83115, -2.476476, 1, 1, 1, 1, 1,
-2.146383, 0.4249946, -0.9861769, 1, 1, 1, 1, 1,
-2.122539, 0.3945142, -2.281421, 1, 1, 1, 1, 1,
-2.102818, -0.8303881, -3.399766, 1, 1, 1, 1, 1,
-2.097848, -0.3626443, -2.142127, 1, 1, 1, 1, 1,
-2.07971, -0.603182, -1.151872, 1, 1, 1, 1, 1,
-2.02137, -2.088534, -2.919332, 1, 1, 1, 1, 1,
-2.002353, -0.6518838, -1.043126, 1, 1, 1, 1, 1,
-1.985992, 1.066999, -1.395235, 0, 0, 1, 1, 1,
-1.934127, 1.027741, -1.604874, 1, 0, 0, 1, 1,
-1.92252, -2.905771, -1.876304, 1, 0, 0, 1, 1,
-1.875853, -0.203672, 0.4773021, 1, 0, 0, 1, 1,
-1.805999, 0.2073534, -1.213325, 1, 0, 0, 1, 1,
-1.785799, 1.002477, -3.810224, 1, 0, 0, 1, 1,
-1.759011, 0.5587667, -1.134873, 0, 0, 0, 1, 1,
-1.758576, -0.2256936, -2.340661, 0, 0, 0, 1, 1,
-1.754066, -0.7100626, -0.9106743, 0, 0, 0, 1, 1,
-1.750787, 0.287801, -2.681107, 0, 0, 0, 1, 1,
-1.744375, -1.969758, -2.201458, 0, 0, 0, 1, 1,
-1.741461, -0.141155, -2.092716, 0, 0, 0, 1, 1,
-1.736688, 2.78504, -0.1777284, 0, 0, 0, 1, 1,
-1.71567, 0.4676366, 0.08089125, 1, 1, 1, 1, 1,
-1.702613, -0.214016, -2.335081, 1, 1, 1, 1, 1,
-1.683398, 1.811547, -1.750592, 1, 1, 1, 1, 1,
-1.631235, 0.7492053, -1.665298, 1, 1, 1, 1, 1,
-1.628273, -0.3775704, -2.207628, 1, 1, 1, 1, 1,
-1.610111, 0.581736, -0.7646749, 1, 1, 1, 1, 1,
-1.602551, 0.5743628, -1.516833, 1, 1, 1, 1, 1,
-1.599831, -1.237235, -2.813612, 1, 1, 1, 1, 1,
-1.596802, 0.156636, -1.209945, 1, 1, 1, 1, 1,
-1.578087, -0.163342, -2.602325, 1, 1, 1, 1, 1,
-1.577983, -0.6525033, -0.7480478, 1, 1, 1, 1, 1,
-1.575361, 1.411066, -1.414545, 1, 1, 1, 1, 1,
-1.561907, -0.7058371, -2.969727, 1, 1, 1, 1, 1,
-1.550455, -0.1620895, -0.8246155, 1, 1, 1, 1, 1,
-1.548751, -0.4581847, 0.01707992, 1, 1, 1, 1, 1,
-1.535692, -2.598281, -2.699925, 0, 0, 1, 1, 1,
-1.535648, 1.098484, -1.901543, 1, 0, 0, 1, 1,
-1.530219, 1.200906, -1.27566, 1, 0, 0, 1, 1,
-1.526543, -1.652419, -0.7939128, 1, 0, 0, 1, 1,
-1.508676, -1.371684, -3.223669, 1, 0, 0, 1, 1,
-1.492635, 1.60722, -0.6480406, 1, 0, 0, 1, 1,
-1.491705, -0.9651915, -2.636931, 0, 0, 0, 1, 1,
-1.488334, -1.527538, -3.373379, 0, 0, 0, 1, 1,
-1.470019, 0.2519369, -1.581303, 0, 0, 0, 1, 1,
-1.465538, 0.8706673, -1.918198, 0, 0, 0, 1, 1,
-1.465275, -0.5764306, -1.690769, 0, 0, 0, 1, 1,
-1.461647, -1.719583, -1.983343, 0, 0, 0, 1, 1,
-1.443073, 0.06896048, 1.060532, 0, 0, 0, 1, 1,
-1.437106, -0.3855251, -2.310984, 1, 1, 1, 1, 1,
-1.425674, -0.170697, -1.664183, 1, 1, 1, 1, 1,
-1.419261, 1.763906, -0.2851648, 1, 1, 1, 1, 1,
-1.408303, -0.3357283, -1.020706, 1, 1, 1, 1, 1,
-1.402905, 0.7770418, -0.3551558, 1, 1, 1, 1, 1,
-1.39079, 0.2667038, -2.060403, 1, 1, 1, 1, 1,
-1.382179, 0.37341, -1.80629, 1, 1, 1, 1, 1,
-1.375909, 0.4241367, -0.8512103, 1, 1, 1, 1, 1,
-1.352646, 0.9965757, -1.322827, 1, 1, 1, 1, 1,
-1.349618, 1.51321, -1.895729, 1, 1, 1, 1, 1,
-1.340074, -0.3200154, -3.214218, 1, 1, 1, 1, 1,
-1.322942, 0.4545908, -1.43728, 1, 1, 1, 1, 1,
-1.315642, 0.5253937, -2.559913, 1, 1, 1, 1, 1,
-1.305272, -1.020985, -2.330941, 1, 1, 1, 1, 1,
-1.294958, -0.3366651, -1.919638, 1, 1, 1, 1, 1,
-1.292054, 1.763527, 0.1517888, 0, 0, 1, 1, 1,
-1.291222, 0.8104394, 0.2717331, 1, 0, 0, 1, 1,
-1.283833, -0.4947165, -1.471312, 1, 0, 0, 1, 1,
-1.279628, -1.037043, -4.25174, 1, 0, 0, 1, 1,
-1.278751, -0.5478843, -3.195287, 1, 0, 0, 1, 1,
-1.275742, 0.9449039, -0.6047416, 1, 0, 0, 1, 1,
-1.26541, 0.478573, -0.9605041, 0, 0, 0, 1, 1,
-1.263134, 0.7328657, -1.116322, 0, 0, 0, 1, 1,
-1.262522, 0.2289726, -2.055502, 0, 0, 0, 1, 1,
-1.259728, 0.1869523, -1.068964, 0, 0, 0, 1, 1,
-1.257859, 0.8966619, 0.3921246, 0, 0, 0, 1, 1,
-1.254812, 0.1082356, -1.283062, 0, 0, 0, 1, 1,
-1.254404, -0.1415227, -1.53626, 0, 0, 0, 1, 1,
-1.251193, -0.550891, -2.028619, 1, 1, 1, 1, 1,
-1.244121, 0.3272494, -0.2983432, 1, 1, 1, 1, 1,
-1.242883, -0.8764778, -2.858359, 1, 1, 1, 1, 1,
-1.239774, -1.662331, -3.609762, 1, 1, 1, 1, 1,
-1.238114, 1.410986, 0.3708461, 1, 1, 1, 1, 1,
-1.237718, -0.3606652, -2.084076, 1, 1, 1, 1, 1,
-1.231704, 0.1478165, -1.816997, 1, 1, 1, 1, 1,
-1.227706, -2.052901, -3.589199, 1, 1, 1, 1, 1,
-1.225051, -0.4430596, -1.618469, 1, 1, 1, 1, 1,
-1.224491, -0.8709965, -1.517365, 1, 1, 1, 1, 1,
-1.221797, 1.282189, -0.4558378, 1, 1, 1, 1, 1,
-1.219244, 1.110034, 0.4184666, 1, 1, 1, 1, 1,
-1.218186, 1.592286, -2.483734, 1, 1, 1, 1, 1,
-1.212039, 0.8535168, -0.7856724, 1, 1, 1, 1, 1,
-1.208314, -0.3860167, -2.169456, 1, 1, 1, 1, 1,
-1.208076, 0.06138422, -0.6300676, 0, 0, 1, 1, 1,
-1.203205, -2.552773, -2.042043, 1, 0, 0, 1, 1,
-1.191744, 0.2941034, -3.015156, 1, 0, 0, 1, 1,
-1.188401, -0.4330805, -1.867896, 1, 0, 0, 1, 1,
-1.183057, 1.09867, -0.5501184, 1, 0, 0, 1, 1,
-1.181623, 2.806666, 1.116603, 1, 0, 0, 1, 1,
-1.180025, -1.065975, -2.646947, 0, 0, 0, 1, 1,
-1.172562, 0.5840694, -1.869993, 0, 0, 0, 1, 1,
-1.167958, 0.3305613, -0.03425204, 0, 0, 0, 1, 1,
-1.167235, 1.013775, -0.9361354, 0, 0, 0, 1, 1,
-1.161679, 1.306198, -0.7919461, 0, 0, 0, 1, 1,
-1.16084, -0.03551973, -0.8407466, 0, 0, 0, 1, 1,
-1.157705, 0.5062105, -2.457855, 0, 0, 0, 1, 1,
-1.155982, 0.8654283, -0.454, 1, 1, 1, 1, 1,
-1.154504, 0.5961819, -0.4219672, 1, 1, 1, 1, 1,
-1.152844, 0.8347236, 0.5920382, 1, 1, 1, 1, 1,
-1.15097, -2.041918, -3.150176, 1, 1, 1, 1, 1,
-1.142255, 0.04486658, -1.674047, 1, 1, 1, 1, 1,
-1.138527, -0.06883009, -0.8171103, 1, 1, 1, 1, 1,
-1.136307, -0.4796278, 0.2149225, 1, 1, 1, 1, 1,
-1.135346, 1.227728, -0.4418968, 1, 1, 1, 1, 1,
-1.133874, 0.3692908, -0.2065753, 1, 1, 1, 1, 1,
-1.12984, 0.06437755, -0.4409856, 1, 1, 1, 1, 1,
-1.129771, 0.1767175, -3.518032, 1, 1, 1, 1, 1,
-1.126513, 1.084339, -0.1192034, 1, 1, 1, 1, 1,
-1.115847, -1.490375, -1.356702, 1, 1, 1, 1, 1,
-1.107785, 2.79694, 0.2001519, 1, 1, 1, 1, 1,
-1.104689, 0.4052344, -2.150948, 1, 1, 1, 1, 1,
-1.100736, 0.5636191, 0.2718567, 0, 0, 1, 1, 1,
-1.09827, -1.742681, -2.959179, 1, 0, 0, 1, 1,
-1.094107, 0.8658379, 0.4383428, 1, 0, 0, 1, 1,
-1.090055, 1.271659, -1.436832, 1, 0, 0, 1, 1,
-1.088685, -0.5953403, -1.91046, 1, 0, 0, 1, 1,
-1.088452, -0.7245624, -2.478347, 1, 0, 0, 1, 1,
-1.074608, -1.454734, -3.522039, 0, 0, 0, 1, 1,
-1.073216, -0.4263753, -3.038403, 0, 0, 0, 1, 1,
-1.065829, -0.9385597, -2.421921, 0, 0, 0, 1, 1,
-1.060917, 1.230598, -0.2078819, 0, 0, 0, 1, 1,
-1.060717, -0.2318852, -1.522092, 0, 0, 0, 1, 1,
-1.057435, -0.4622431, -1.682223, 0, 0, 0, 1, 1,
-1.055841, 1.317969, -0.06875372, 0, 0, 0, 1, 1,
-1.049422, 1.101065, -1.173922, 1, 1, 1, 1, 1,
-1.043153, 0.753823, -0.2814701, 1, 1, 1, 1, 1,
-1.04306, -0.3707789, -2.704296, 1, 1, 1, 1, 1,
-1.032588, 0.2481524, -1.36883, 1, 1, 1, 1, 1,
-1.03178, -0.7764418, -2.915507, 1, 1, 1, 1, 1,
-1.025445, 1.396521, -2.26383, 1, 1, 1, 1, 1,
-1.02147, -0.432708, -2.096183, 1, 1, 1, 1, 1,
-1.010319, 0.285593, -0.1007679, 1, 1, 1, 1, 1,
-1.004255, -2.0213, -3.614171, 1, 1, 1, 1, 1,
-0.999029, 0.6893747, -0.9301164, 1, 1, 1, 1, 1,
-0.9915351, -0.3596067, -0.8766334, 1, 1, 1, 1, 1,
-0.9884564, 1.364257, -1.789464, 1, 1, 1, 1, 1,
-0.9849157, -0.6521426, -1.46694, 1, 1, 1, 1, 1,
-0.9795305, 0.1169528, -1.964689, 1, 1, 1, 1, 1,
-0.9780992, -0.1083261, -1.61001, 1, 1, 1, 1, 1,
-0.975364, 0.6212531, -1.804922, 0, 0, 1, 1, 1,
-0.9699249, 0.4207154, -1.549905, 1, 0, 0, 1, 1,
-0.9604547, -0.2829747, -2.272065, 1, 0, 0, 1, 1,
-0.9512853, -2.007204, -2.401878, 1, 0, 0, 1, 1,
-0.9510922, -0.0846418, -2.051386, 1, 0, 0, 1, 1,
-0.9425019, 0.6715075, -0.6776133, 1, 0, 0, 1, 1,
-0.9413244, -0.1666187, -0.5338259, 0, 0, 0, 1, 1,
-0.9381754, 0.859251, 0.1545882, 0, 0, 0, 1, 1,
-0.9367401, 0.3543586, -2.652955, 0, 0, 0, 1, 1,
-0.9311984, 1.255892, -1.831954, 0, 0, 0, 1, 1,
-0.9266942, -1.210168, -2.011801, 0, 0, 0, 1, 1,
-0.9124091, -0.3647222, -3.019063, 0, 0, 0, 1, 1,
-0.9065764, 0.5264246, -4.316339, 0, 0, 0, 1, 1,
-0.9009321, 0.3222333, -1.143978, 1, 1, 1, 1, 1,
-0.8960063, -0.7010908, -1.4963, 1, 1, 1, 1, 1,
-0.89057, -1.240689, -2.367425, 1, 1, 1, 1, 1,
-0.8790861, 0.398564, -0.9910524, 1, 1, 1, 1, 1,
-0.8738229, 2.598355, 1.623969, 1, 1, 1, 1, 1,
-0.873736, 0.7461466, -1.033183, 1, 1, 1, 1, 1,
-0.8714983, 0.1943463, -0.4293406, 1, 1, 1, 1, 1,
-0.8668736, 0.8711934, -0.4780281, 1, 1, 1, 1, 1,
-0.8653212, -0.1099438, -1.009142, 1, 1, 1, 1, 1,
-0.8626283, -0.1787256, -2.855345, 1, 1, 1, 1, 1,
-0.8580848, 0.05002573, -0.2913967, 1, 1, 1, 1, 1,
-0.8486241, -0.276281, -3.816225, 1, 1, 1, 1, 1,
-0.8388107, 0.5748768, -1.134313, 1, 1, 1, 1, 1,
-0.8365964, 0.4207427, -1.127408, 1, 1, 1, 1, 1,
-0.8365741, -1.018803, -3.382154, 1, 1, 1, 1, 1,
-0.8337399, -0.1332477, -2.723629, 0, 0, 1, 1, 1,
-0.8258882, 0.5101844, -0.02234438, 1, 0, 0, 1, 1,
-0.8254383, 0.1570679, -0.6728141, 1, 0, 0, 1, 1,
-0.8250696, -1.263274, -3.843976, 1, 0, 0, 1, 1,
-0.8241768, -0.8100232, -3.183231, 1, 0, 0, 1, 1,
-0.821399, 0.6242893, -0.1564892, 1, 0, 0, 1, 1,
-0.8188572, 0.2016828, -2.19099, 0, 0, 0, 1, 1,
-0.8136771, 0.2218936, -0.6801571, 0, 0, 0, 1, 1,
-0.8090301, -2.901579, -5.568638, 0, 0, 0, 1, 1,
-0.8028083, 1.760739, 0.468406, 0, 0, 0, 1, 1,
-0.8000136, 0.8632951, -0.7541791, 0, 0, 0, 1, 1,
-0.7969272, 0.649822, 0.1469282, 0, 0, 0, 1, 1,
-0.7947285, 0.3763607, -1.437441, 0, 0, 0, 1, 1,
-0.7908791, 1.926562, 0.6381977, 1, 1, 1, 1, 1,
-0.7897385, -1.214735, -2.506116, 1, 1, 1, 1, 1,
-0.7884532, 1.447992, -0.5448658, 1, 1, 1, 1, 1,
-0.7879359, -1.479952, -2.094352, 1, 1, 1, 1, 1,
-0.7862912, -0.3301378, -3.215909, 1, 1, 1, 1, 1,
-0.7829704, 1.540029, -1.087501, 1, 1, 1, 1, 1,
-0.7751561, 0.5351948, -1.914879, 1, 1, 1, 1, 1,
-0.7729499, 0.9902754, -0.5597433, 1, 1, 1, 1, 1,
-0.7716398, -1.794209, -2.56142, 1, 1, 1, 1, 1,
-0.7679261, 0.2853803, -1.333615, 1, 1, 1, 1, 1,
-0.7663233, 1.439841, -1.467257, 1, 1, 1, 1, 1,
-0.7646176, 0.0619729, -2.419333, 1, 1, 1, 1, 1,
-0.7607724, -0.1534233, -0.5315609, 1, 1, 1, 1, 1,
-0.7539081, 2.517158, -0.6253794, 1, 1, 1, 1, 1,
-0.7504257, 1.92076, -0.1345863, 1, 1, 1, 1, 1,
-0.7496651, -1.010573, -2.069718, 0, 0, 1, 1, 1,
-0.7489109, -0.8304073, -3.580322, 1, 0, 0, 1, 1,
-0.745494, -1.494048, -3.025979, 1, 0, 0, 1, 1,
-0.7434365, -1.080601, -3.336974, 1, 0, 0, 1, 1,
-0.7432232, 1.08028, 0.3848245, 1, 0, 0, 1, 1,
-0.7347941, -0.2666628, 1.354669, 1, 0, 0, 1, 1,
-0.7304307, 2.073989, 0.003297461, 0, 0, 0, 1, 1,
-0.7301039, 0.4511217, 0.2988098, 0, 0, 0, 1, 1,
-0.7284083, -0.3433425, -1.854977, 0, 0, 0, 1, 1,
-0.7270792, -0.193785, -1.402623, 0, 0, 0, 1, 1,
-0.7157438, 1.410244, 0.4143522, 0, 0, 0, 1, 1,
-0.7145949, -2.097056, -3.856898, 0, 0, 0, 1, 1,
-0.7111453, 0.2092215, -2.867164, 0, 0, 0, 1, 1,
-0.7089998, -0.7250778, -2.410168, 1, 1, 1, 1, 1,
-0.7089524, 0.6915326, -2.376642, 1, 1, 1, 1, 1,
-0.6975842, -1.008339, -2.104305, 1, 1, 1, 1, 1,
-0.693522, 0.3164751, -1.009304, 1, 1, 1, 1, 1,
-0.6889693, -0.3241883, -0.5066735, 1, 1, 1, 1, 1,
-0.6876792, 0.6461834, 0.009656157, 1, 1, 1, 1, 1,
-0.6805199, 0.6207126, 0.1930215, 1, 1, 1, 1, 1,
-0.6794695, 0.2198881, -1.4195, 1, 1, 1, 1, 1,
-0.678755, -0.750816, -3.263186, 1, 1, 1, 1, 1,
-0.6727594, -0.1123376, -0.5406675, 1, 1, 1, 1, 1,
-0.6709622, 0.7366874, 0.1601439, 1, 1, 1, 1, 1,
-0.6636823, -0.3265843, -1.181862, 1, 1, 1, 1, 1,
-0.6588519, -0.2721916, -0.6002172, 1, 1, 1, 1, 1,
-0.6565993, -0.9883549, -2.03248, 1, 1, 1, 1, 1,
-0.650783, -1.406387, -2.180827, 1, 1, 1, 1, 1,
-0.650152, -0.07998161, -1.126904, 0, 0, 1, 1, 1,
-0.6497785, 0.7231588, -1.432349, 1, 0, 0, 1, 1,
-0.644889, 0.1588104, -0.7336624, 1, 0, 0, 1, 1,
-0.6422873, -1.353552, -3.920748, 1, 0, 0, 1, 1,
-0.6420805, -0.01092616, -1.385136, 1, 0, 0, 1, 1,
-0.6386663, -0.1693155, -1.59301, 1, 0, 0, 1, 1,
-0.6240144, 0.1043886, 1.76448, 0, 0, 0, 1, 1,
-0.623054, 1.294626, -1.027183, 0, 0, 0, 1, 1,
-0.6192452, 0.03288213, -2.558203, 0, 0, 0, 1, 1,
-0.6180823, 1.337463, -1.807353, 0, 0, 0, 1, 1,
-0.6171575, 0.6482687, -0.5143377, 0, 0, 0, 1, 1,
-0.6153192, 0.1493347, -1.600102, 0, 0, 0, 1, 1,
-0.614435, 0.2958923, -1.794814, 0, 0, 0, 1, 1,
-0.596361, 1.421949, -2.666588, 1, 1, 1, 1, 1,
-0.5942383, -1.739646, -3.413007, 1, 1, 1, 1, 1,
-0.5875884, 0.6681461, -2.036837, 1, 1, 1, 1, 1,
-0.580072, 0.8635588, -0.08929217, 1, 1, 1, 1, 1,
-0.5773368, -0.1665982, -2.509923, 1, 1, 1, 1, 1,
-0.5766671, 1.634959, -1.53695, 1, 1, 1, 1, 1,
-0.5737145, -0.4099853, -2.087223, 1, 1, 1, 1, 1,
-0.5726393, -0.9263191, -2.714338, 1, 1, 1, 1, 1,
-0.5706178, 0.004033505, -2.240956, 1, 1, 1, 1, 1,
-0.5637118, -0.6833403, -3.195405, 1, 1, 1, 1, 1,
-0.5612211, -0.1186864, -2.547333, 1, 1, 1, 1, 1,
-0.5608612, -0.5955892, -3.113092, 1, 1, 1, 1, 1,
-0.5596533, -0.7212498, -2.863663, 1, 1, 1, 1, 1,
-0.5579754, -0.366096, -2.744397, 1, 1, 1, 1, 1,
-0.5572539, -0.1850178, -2.834607, 1, 1, 1, 1, 1,
-0.5566326, 0.3854745, -1.125185, 0, 0, 1, 1, 1,
-0.555943, -0.01484567, -2.255606, 1, 0, 0, 1, 1,
-0.5542824, 0.6645022, -0.4014564, 1, 0, 0, 1, 1,
-0.5532074, -0.8590735, -2.612473, 1, 0, 0, 1, 1,
-0.5492216, 0.0271488, -3.645247, 1, 0, 0, 1, 1,
-0.5492004, 2.090613, 1.830962, 1, 0, 0, 1, 1,
-0.5455869, 1.12395, -0.6681628, 0, 0, 0, 1, 1,
-0.5455664, 0.04981112, -2.781974, 0, 0, 0, 1, 1,
-0.5434537, -0.4382319, -3.136334, 0, 0, 0, 1, 1,
-0.5434427, 1.661431, -1.368474, 0, 0, 0, 1, 1,
-0.5432918, -0.5940034, -1.711828, 0, 0, 0, 1, 1,
-0.540731, -2.752762, -2.00739, 0, 0, 0, 1, 1,
-0.5381835, 1.618905, 0.07717705, 0, 0, 0, 1, 1,
-0.5352638, 0.2696576, -0.8302014, 1, 1, 1, 1, 1,
-0.5329153, -1.727492, 0.01262036, 1, 1, 1, 1, 1,
-0.5315607, 2.443939, 1.303665, 1, 1, 1, 1, 1,
-0.530331, -0.005216273, -0.2255607, 1, 1, 1, 1, 1,
-0.5270694, 1.019217, -0.5081358, 1, 1, 1, 1, 1,
-0.5266077, 0.935757, 0.5387893, 1, 1, 1, 1, 1,
-0.5256013, -0.6097822, -0.5450259, 1, 1, 1, 1, 1,
-0.5244409, 0.8257238, -1.160493, 1, 1, 1, 1, 1,
-0.5239272, 0.07981964, -2.483053, 1, 1, 1, 1, 1,
-0.5143638, -0.5729554, -2.351094, 1, 1, 1, 1, 1,
-0.5092593, -0.7100223, -1.876883, 1, 1, 1, 1, 1,
-0.5071823, 1.281176, -2.584035, 1, 1, 1, 1, 1,
-0.5036712, -0.6598212, -2.237297, 1, 1, 1, 1, 1,
-0.5033084, -0.696837, -3.792643, 1, 1, 1, 1, 1,
-0.4998452, 1.232414, -0.1488416, 1, 1, 1, 1, 1,
-0.4987061, -0.4650204, -3.161421, 0, 0, 1, 1, 1,
-0.4969849, 0.651396, 0.1627869, 1, 0, 0, 1, 1,
-0.4937139, -1.325769, -3.028934, 1, 0, 0, 1, 1,
-0.493251, 0.4106948, -1.6136, 1, 0, 0, 1, 1,
-0.4921589, 0.9973415, -0.8376577, 1, 0, 0, 1, 1,
-0.4880539, 0.6254057, -0.4791664, 1, 0, 0, 1, 1,
-0.4862416, 1.238289, -0.7211196, 0, 0, 0, 1, 1,
-0.4834605, 0.1309619, -2.430365, 0, 0, 0, 1, 1,
-0.4830456, 0.7229254, -1.429258, 0, 0, 0, 1, 1,
-0.4812011, 0.5914897, -0.7959273, 0, 0, 0, 1, 1,
-0.4797724, -1.093739, -2.507542, 0, 0, 0, 1, 1,
-0.4788562, 0.5166804, -0.2029243, 0, 0, 0, 1, 1,
-0.4775201, 0.5029646, -1.086814, 0, 0, 0, 1, 1,
-0.4774731, -0.576071, -1.756087, 1, 1, 1, 1, 1,
-0.4773766, 0.1045813, -1.12683, 1, 1, 1, 1, 1,
-0.470197, 0.9316252, -1.614706, 1, 1, 1, 1, 1,
-0.4689128, 0.06309615, -1.916959, 1, 1, 1, 1, 1,
-0.4608448, -1.577504, -0.8267457, 1, 1, 1, 1, 1,
-0.4562726, -1.367119, -3.644275, 1, 1, 1, 1, 1,
-0.4552975, 0.1318634, -2.055851, 1, 1, 1, 1, 1,
-0.447125, 0.3173343, 0.5418546, 1, 1, 1, 1, 1,
-0.445083, -0.837105, -2.175054, 1, 1, 1, 1, 1,
-0.4445699, 0.2670186, -0.25341, 1, 1, 1, 1, 1,
-0.4408224, 0.5069846, -4.236473, 1, 1, 1, 1, 1,
-0.4405119, 0.2697402, -1.125178, 1, 1, 1, 1, 1,
-0.4399331, 0.2094774, -0.4878282, 1, 1, 1, 1, 1,
-0.4354432, -1.210523, -1.356115, 1, 1, 1, 1, 1,
-0.4242511, -0.8822563, -2.090309, 1, 1, 1, 1, 1,
-0.423806, -0.09803105, -2.006719, 0, 0, 1, 1, 1,
-0.421743, -0.1030143, -0.9638594, 1, 0, 0, 1, 1,
-0.4208688, 0.8955024, 1.302611, 1, 0, 0, 1, 1,
-0.4195291, -1.361423, -3.295652, 1, 0, 0, 1, 1,
-0.4154363, -0.3642608, -2.594577, 1, 0, 0, 1, 1,
-0.4153978, -0.5964941, -1.516946, 1, 0, 0, 1, 1,
-0.4143224, 1.195063, -1.626555, 0, 0, 0, 1, 1,
-0.412036, -0.0523534, -1.911177, 0, 0, 0, 1, 1,
-0.4096396, 1.151106, 0.8754399, 0, 0, 0, 1, 1,
-0.4073122, -0.1110731, -1.874076, 0, 0, 0, 1, 1,
-0.4061367, -0.211637, -0.7988743, 0, 0, 0, 1, 1,
-0.4007139, 0.5764239, 0.6436067, 0, 0, 0, 1, 1,
-0.3961734, -1.105263, -3.816136, 0, 0, 0, 1, 1,
-0.391444, 0.2096889, -1.558239, 1, 1, 1, 1, 1,
-0.3836884, 0.2605274, -1.503714, 1, 1, 1, 1, 1,
-0.3817985, 1.141713, -0.7124547, 1, 1, 1, 1, 1,
-0.3807294, 0.8799347, -0.2720528, 1, 1, 1, 1, 1,
-0.3802694, 1.064945, -2.244022, 1, 1, 1, 1, 1,
-0.3779257, -0.2221243, -2.978198, 1, 1, 1, 1, 1,
-0.375113, -0.05577073, -2.551951, 1, 1, 1, 1, 1,
-0.3735743, 0.2616261, -0.4407421, 1, 1, 1, 1, 1,
-0.3725336, 1.322484, 1.696825, 1, 1, 1, 1, 1,
-0.3722819, 0.7219098, -0.8668941, 1, 1, 1, 1, 1,
-0.3668925, -1.951874, -3.52859, 1, 1, 1, 1, 1,
-0.3643295, -1.059964, -3.589527, 1, 1, 1, 1, 1,
-0.3588433, 0.1606893, -0.4256272, 1, 1, 1, 1, 1,
-0.3576222, -0.5725797, -2.280289, 1, 1, 1, 1, 1,
-0.3502663, -1.275602, -2.897355, 1, 1, 1, 1, 1,
-0.350073, 0.2317494, 0.03178356, 0, 0, 1, 1, 1,
-0.3486603, -0.4978431, -0.1176255, 1, 0, 0, 1, 1,
-0.3484581, 0.1077047, -0.2977498, 1, 0, 0, 1, 1,
-0.3444991, 0.1209369, -1.627064, 1, 0, 0, 1, 1,
-0.3431232, 0.4819011, -0.8388174, 1, 0, 0, 1, 1,
-0.3427967, -1.04152, -2.550105, 1, 0, 0, 1, 1,
-0.3414536, -0.04141669, -2.026729, 0, 0, 0, 1, 1,
-0.3365587, 0.3334593, -1.901729, 0, 0, 0, 1, 1,
-0.3341985, 0.4082885, 0.3867863, 0, 0, 0, 1, 1,
-0.3340393, 1.766186, 0.7453877, 0, 0, 0, 1, 1,
-0.3322463, 1.338114, -1.796071, 0, 0, 0, 1, 1,
-0.3322228, -0.6647613, -2.798299, 0, 0, 0, 1, 1,
-0.3272021, -0.5853369, -4.104664, 0, 0, 0, 1, 1,
-0.3263603, 0.7332942, 0.7741821, 1, 1, 1, 1, 1,
-0.3259177, 0.8210061, 1.44767, 1, 1, 1, 1, 1,
-0.3220356, -0.1535901, -3.374369, 1, 1, 1, 1, 1,
-0.3162369, 2.012712, 0.6512066, 1, 1, 1, 1, 1,
-0.3151519, -1.244915, -2.425543, 1, 1, 1, 1, 1,
-0.3150721, 1.053132, -0.8636886, 1, 1, 1, 1, 1,
-0.3145101, -0.6622475, -2.523063, 1, 1, 1, 1, 1,
-0.3014501, -0.713306, -2.279102, 1, 1, 1, 1, 1,
-0.3004183, -1.509857, -2.519197, 1, 1, 1, 1, 1,
-0.2955061, 1.646214, 1.064706, 1, 1, 1, 1, 1,
-0.2940852, -0.6016049, -3.331568, 1, 1, 1, 1, 1,
-0.2940498, 1.271427, -0.2605052, 1, 1, 1, 1, 1,
-0.2940245, -0.006959587, -1.430769, 1, 1, 1, 1, 1,
-0.2878462, -1.305386, -3.775103, 1, 1, 1, 1, 1,
-0.2844033, 1.345949, 0.7584241, 1, 1, 1, 1, 1,
-0.2837085, 1.737981, -0.1119703, 0, 0, 1, 1, 1,
-0.2783879, 0.2747597, -1.58888, 1, 0, 0, 1, 1,
-0.2779135, -0.8396645, -0.6641815, 1, 0, 0, 1, 1,
-0.2760538, 0.8716375, -0.8239226, 1, 0, 0, 1, 1,
-0.2642505, 1.413896, -1.843657, 1, 0, 0, 1, 1,
-0.2622602, -1.270356, -2.10656, 1, 0, 0, 1, 1,
-0.259903, 0.5084668, -0.6100055, 0, 0, 0, 1, 1,
-0.2598882, 0.6815296, 0.5690234, 0, 0, 0, 1, 1,
-0.2591799, 0.2148905, 0.3547028, 0, 0, 0, 1, 1,
-0.2533476, -0.3942234, -1.690376, 0, 0, 0, 1, 1,
-0.2522825, 0.006940141, 0.408453, 0, 0, 0, 1, 1,
-0.2522011, 0.947186, 1.661464, 0, 0, 0, 1, 1,
-0.251202, -0.888814, -2.590601, 0, 0, 0, 1, 1,
-0.2451401, -1.324013, -3.22448, 1, 1, 1, 1, 1,
-0.2451145, -0.630434, -2.254601, 1, 1, 1, 1, 1,
-0.2434488, 0.2400656, 0.06187294, 1, 1, 1, 1, 1,
-0.2405695, -0.1363293, -5.070501, 1, 1, 1, 1, 1,
-0.2393155, 0.08790249, -1.658716, 1, 1, 1, 1, 1,
-0.2382588, -0.4809687, -2.972771, 1, 1, 1, 1, 1,
-0.2344101, -0.9294516, -5.461812, 1, 1, 1, 1, 1,
-0.2336103, 1.377439, -0.1879728, 1, 1, 1, 1, 1,
-0.2333533, 0.40868, 0.5874226, 1, 1, 1, 1, 1,
-0.23179, -1.003271, -2.459692, 1, 1, 1, 1, 1,
-0.2288193, -0.6023329, -1.423023, 1, 1, 1, 1, 1,
-0.2281223, -0.02041034, -3.544378, 1, 1, 1, 1, 1,
-0.2274749, 0.9315288, -0.008882965, 1, 1, 1, 1, 1,
-0.2268151, -3.095167, -4.124886, 1, 1, 1, 1, 1,
-0.2254335, -0.2294139, -2.10999, 1, 1, 1, 1, 1,
-0.2216603, 0.2872133, -1.850747, 0, 0, 1, 1, 1,
-0.2181733, -0.2185978, -4.385705, 1, 0, 0, 1, 1,
-0.2172412, 1.367355, 0.2213311, 1, 0, 0, 1, 1,
-0.2150287, -0.4088314, -2.034873, 1, 0, 0, 1, 1,
-0.2132345, -0.3346545, -3.365625, 1, 0, 0, 1, 1,
-0.2128549, -0.2190719, -1.796226, 1, 0, 0, 1, 1,
-0.2120642, 0.1141502, -0.04640985, 0, 0, 0, 1, 1,
-0.2100229, -0.249823, -2.698449, 0, 0, 0, 1, 1,
-0.2097217, -1.93613, -3.385601, 0, 0, 0, 1, 1,
-0.2078949, -0.5075516, -1.98298, 0, 0, 0, 1, 1,
-0.2067409, -0.4080033, -3.223124, 0, 0, 0, 1, 1,
-0.2063157, 0.9552243, 0.9220544, 0, 0, 0, 1, 1,
-0.2024058, 0.7981921, -1.048875, 0, 0, 0, 1, 1,
-0.2010708, 1.594283, -0.1120116, 1, 1, 1, 1, 1,
-0.1946876, -0.9488477, -3.499972, 1, 1, 1, 1, 1,
-0.1905683, 0.521358, -0.5600035, 1, 1, 1, 1, 1,
-0.1897197, -0.9494958, -2.382166, 1, 1, 1, 1, 1,
-0.188969, -0.988115, -2.365195, 1, 1, 1, 1, 1,
-0.1859511, 2.436511, -0.1369683, 1, 1, 1, 1, 1,
-0.1846939, -1.748074, -3.141252, 1, 1, 1, 1, 1,
-0.1828195, -1.972882, -2.110041, 1, 1, 1, 1, 1,
-0.1808202, 0.8972278, 1.060618, 1, 1, 1, 1, 1,
-0.1797999, 0.6575935, -1.949361, 1, 1, 1, 1, 1,
-0.1797554, 0.4749494, -0.623993, 1, 1, 1, 1, 1,
-0.1791896, 0.1387403, -0.4739185, 1, 1, 1, 1, 1,
-0.177066, -1.416665, -4.134601, 1, 1, 1, 1, 1,
-0.1745209, -0.7267236, -1.441055, 1, 1, 1, 1, 1,
-0.1675277, -0.02006967, -1.321325, 1, 1, 1, 1, 1,
-0.1622515, 0.9852094, 0.5837668, 0, 0, 1, 1, 1,
-0.1610155, -0.02947872, -0.00237517, 1, 0, 0, 1, 1,
-0.1598366, -1.157794, -2.278012, 1, 0, 0, 1, 1,
-0.1544604, 0.2131833, -1.416054, 1, 0, 0, 1, 1,
-0.1541534, -0.1959182, -1.594947, 1, 0, 0, 1, 1,
-0.1497505, -0.09685715, -2.11583, 1, 0, 0, 1, 1,
-0.1446117, 0.2648496, -0.2873491, 0, 0, 0, 1, 1,
-0.140676, -0.5221401, -2.119547, 0, 0, 0, 1, 1,
-0.137509, -0.1933962, -3.980463, 0, 0, 0, 1, 1,
-0.1372956, -0.5470916, -4.83794, 0, 0, 0, 1, 1,
-0.1354277, -0.1109802, -3.356173, 0, 0, 0, 1, 1,
-0.1328604, -0.6554501, -1.917654, 0, 0, 0, 1, 1,
-0.1327902, 0.2690453, -2.244898, 0, 0, 0, 1, 1,
-0.1284513, 0.4195983, 0.5716356, 1, 1, 1, 1, 1,
-0.1245043, -0.9729446, -3.374991, 1, 1, 1, 1, 1,
-0.1242425, -0.2919389, -3.040892, 1, 1, 1, 1, 1,
-0.1218205, -0.3367999, -3.972621, 1, 1, 1, 1, 1,
-0.1203234, 0.2955182, 0.2769086, 1, 1, 1, 1, 1,
-0.1192481, -0.1956791, -2.614609, 1, 1, 1, 1, 1,
-0.119023, 1.224143, 0.07426407, 1, 1, 1, 1, 1,
-0.1147589, 0.2876639, -0.2708474, 1, 1, 1, 1, 1,
-0.1110947, 1.570908, 0.09976485, 1, 1, 1, 1, 1,
-0.1082615, -1.789723, -2.546097, 1, 1, 1, 1, 1,
-0.1052016, -2.214246, -4.21623, 1, 1, 1, 1, 1,
-0.1029164, -0.7872777, -3.266046, 1, 1, 1, 1, 1,
-0.1018774, 0.1916062, -1.64736, 1, 1, 1, 1, 1,
-0.09937004, 0.08337558, -0.02205323, 1, 1, 1, 1, 1,
-0.098548, -1.181176, -1.804726, 1, 1, 1, 1, 1,
-0.09745553, 1.431503, 0.7381188, 0, 0, 1, 1, 1,
-0.08904027, -0.5819653, -5.122422, 1, 0, 0, 1, 1,
-0.08320672, -2.159422, -2.613429, 1, 0, 0, 1, 1,
-0.08177169, -0.1929139, -3.167573, 1, 0, 0, 1, 1,
-0.08117051, -1.137403, -3.304788, 1, 0, 0, 1, 1,
-0.07824322, 1.113284, 0.08283898, 1, 0, 0, 1, 1,
-0.07704546, 0.191245, -0.6905668, 0, 0, 0, 1, 1,
-0.07090433, -0.1572107, -2.493454, 0, 0, 0, 1, 1,
-0.07034122, 1.074469, -0.5818329, 0, 0, 0, 1, 1,
-0.06452426, 0.6492085, 0.4141888, 0, 0, 0, 1, 1,
-0.06388689, 1.532502, 0.1727608, 0, 0, 0, 1, 1,
-0.06386305, -1.310223, -2.069315, 0, 0, 0, 1, 1,
-0.06092395, -0.4846093, -4.193629, 0, 0, 0, 1, 1,
-0.06089794, 0.3778268, -0.05030966, 1, 1, 1, 1, 1,
-0.06030813, -0.3716449, -2.541178, 1, 1, 1, 1, 1,
-0.05623626, 1.042189, 0.7751435, 1, 1, 1, 1, 1,
-0.0554411, 0.8921267, -0.9575367, 1, 1, 1, 1, 1,
-0.05264427, 1.194017, 1.643779, 1, 1, 1, 1, 1,
-0.040846, -0.1476696, -4.352371, 1, 1, 1, 1, 1,
-0.0396047, 0.1637039, -0.3070804, 1, 1, 1, 1, 1,
-0.03615599, -0.8852677, -3.517464, 1, 1, 1, 1, 1,
-0.02378486, 0.1011259, 0.507321, 1, 1, 1, 1, 1,
-0.02101779, 0.452029, -3.070586, 1, 1, 1, 1, 1,
-0.01517669, -1.322927, -1.459666, 1, 1, 1, 1, 1,
-0.01365928, 1.544035, 0.8950062, 1, 1, 1, 1, 1,
-0.01290064, -0.6245999, -3.561978, 1, 1, 1, 1, 1,
-0.01266664, -1.173913, -3.09444, 1, 1, 1, 1, 1,
-0.009687269, 1.543531, 0.4333968, 1, 1, 1, 1, 1,
-0.006321225, 0.493155, 1.003628, 0, 0, 1, 1, 1,
-0.005512394, 0.343176, 0.3370457, 1, 0, 0, 1, 1,
-0.005138914, 0.9751904, -0.1547765, 1, 0, 0, 1, 1,
-0.003439714, 1.151294, -0.4391834, 1, 0, 0, 1, 1,
0.002979608, 0.3962229, -0.1833346, 1, 0, 0, 1, 1,
0.003639342, 1.124471, -2.491416, 1, 0, 0, 1, 1,
0.005324519, -0.7773789, 4.068775, 0, 0, 0, 1, 1,
0.007441492, -0.893073, 2.405131, 0, 0, 0, 1, 1,
0.008441142, -0.6425241, 2.638355, 0, 0, 0, 1, 1,
0.009357189, -0.4710176, 1.82482, 0, 0, 0, 1, 1,
0.009388884, -0.5546358, 1.944879, 0, 0, 0, 1, 1,
0.01147558, -0.08235844, 3.178694, 0, 0, 0, 1, 1,
0.01719229, 1.307974, -1.404277, 0, 0, 0, 1, 1,
0.01797317, 1.597365, 0.9760084, 1, 1, 1, 1, 1,
0.01913223, -0.6918964, 3.325505, 1, 1, 1, 1, 1,
0.02203772, -0.8038062, 2.839373, 1, 1, 1, 1, 1,
0.02363314, 1.052843, 0.4322945, 1, 1, 1, 1, 1,
0.02422998, 0.07561884, -1.11595, 1, 1, 1, 1, 1,
0.02817594, -0.70891, 3.582225, 1, 1, 1, 1, 1,
0.0338457, -0.6380087, 2.872128, 1, 1, 1, 1, 1,
0.03549351, 0.3780924, 0.3216653, 1, 1, 1, 1, 1,
0.03638068, -0.1776741, 2.223968, 1, 1, 1, 1, 1,
0.04296719, 0.345683, 0.09451742, 1, 1, 1, 1, 1,
0.04686003, -0.05040803, 3.133882, 1, 1, 1, 1, 1,
0.04753786, -1.268626, 2.610869, 1, 1, 1, 1, 1,
0.04835291, -0.1964165, 2.841324, 1, 1, 1, 1, 1,
0.05485279, -0.5328331, 3.240747, 1, 1, 1, 1, 1,
0.0590455, -0.4148457, 3.586154, 1, 1, 1, 1, 1,
0.06141434, -1.007767, 3.682016, 0, 0, 1, 1, 1,
0.06168559, -0.0932643, 2.970387, 1, 0, 0, 1, 1,
0.0645631, 1.637159, -0.2049949, 1, 0, 0, 1, 1,
0.0665874, 0.7682711, -0.8884275, 1, 0, 0, 1, 1,
0.06748477, 0.6369945, -0.4292007, 1, 0, 0, 1, 1,
0.0675104, 0.3788678, 1.701983, 1, 0, 0, 1, 1,
0.06914721, -0.4203949, 2.571416, 0, 0, 0, 1, 1,
0.06941437, 0.8543923, -0.6654795, 0, 0, 0, 1, 1,
0.07020593, -0.5260686, 2.246173, 0, 0, 0, 1, 1,
0.07250313, -0.4111424, 3.827309, 0, 0, 0, 1, 1,
0.07393119, -2.03712, 4.442669, 0, 0, 0, 1, 1,
0.07787526, 0.4966493, -0.4781961, 0, 0, 0, 1, 1,
0.08049934, -2.143759, 3.913936, 0, 0, 0, 1, 1,
0.0815471, 1.893718, -0.9596289, 1, 1, 1, 1, 1,
0.08239596, 0.1785135, 1.050875, 1, 1, 1, 1, 1,
0.08612254, -0.8942107, 3.244302, 1, 1, 1, 1, 1,
0.08684319, 0.05536675, -0.3236755, 1, 1, 1, 1, 1,
0.08734993, -0.4535618, 2.125607, 1, 1, 1, 1, 1,
0.08770837, 0.3803053, -0.4994224, 1, 1, 1, 1, 1,
0.09564566, -0.1648799, 0.7595871, 1, 1, 1, 1, 1,
0.09904549, -1.875281, 1.382862, 1, 1, 1, 1, 1,
0.09998704, 1.678705, 1.30379, 1, 1, 1, 1, 1,
0.1055189, 1.405143, -0.5968342, 1, 1, 1, 1, 1,
0.1124837, 0.2876936, 2.189404, 1, 1, 1, 1, 1,
0.1146205, -0.4733694, 3.480052, 1, 1, 1, 1, 1,
0.1180189, 0.01332461, 0.2679617, 1, 1, 1, 1, 1,
0.1251954, 1.036286, 0.5521259, 1, 1, 1, 1, 1,
0.1266731, -0.9286815, 2.062943, 1, 1, 1, 1, 1,
0.1334844, -0.7021895, 3.082894, 0, 0, 1, 1, 1,
0.1354527, 0.212469, 0.4252533, 1, 0, 0, 1, 1,
0.1389968, -0.47032, 2.499404, 1, 0, 0, 1, 1,
0.1425766, 1.031075, -0.6484644, 1, 0, 0, 1, 1,
0.1455719, -0.05722865, 3.014568, 1, 0, 0, 1, 1,
0.1464301, -1.075912, 3.196616, 1, 0, 0, 1, 1,
0.1468679, 1.848819, 1.00068, 0, 0, 0, 1, 1,
0.1491644, 0.4318981, 1.110818, 0, 0, 0, 1, 1,
0.149733, 0.6020995, -0.6770327, 0, 0, 0, 1, 1,
0.1505846, -0.6360675, 2.815119, 0, 0, 0, 1, 1,
0.158832, 0.08255921, 1.250585, 0, 0, 0, 1, 1,
0.1590564, -1.149316, 6.309117, 0, 0, 0, 1, 1,
0.1613705, 1.351446, 0.9187236, 0, 0, 0, 1, 1,
0.1623975, -0.6906896, 4.25838, 1, 1, 1, 1, 1,
0.1680846, -1.907909, 2.647316, 1, 1, 1, 1, 1,
0.1706101, -1.184276, 2.85292, 1, 1, 1, 1, 1,
0.1716781, -1.319308, 2.898412, 1, 1, 1, 1, 1,
0.1723841, 0.04500427, 0.6290517, 1, 1, 1, 1, 1,
0.1731929, 0.927267, 0.919915, 1, 1, 1, 1, 1,
0.1778298, -0.01225656, 1.536248, 1, 1, 1, 1, 1,
0.180606, 1.227401, -1.50039, 1, 1, 1, 1, 1,
0.18666, 2.41044, -0.4496442, 1, 1, 1, 1, 1,
0.1883213, -0.1022879, 2.10524, 1, 1, 1, 1, 1,
0.1906038, 1.990582, -0.2028894, 1, 1, 1, 1, 1,
0.1907132, 0.7691466, -0.145417, 1, 1, 1, 1, 1,
0.2062846, 0.5690395, 0.2232702, 1, 1, 1, 1, 1,
0.2082681, -0.6356587, 2.419929, 1, 1, 1, 1, 1,
0.2114961, 0.2726156, 3.134118, 1, 1, 1, 1, 1,
0.2118481, 0.7328115, -1.520906, 0, 0, 1, 1, 1,
0.2126908, -0.007933058, 2.548781, 1, 0, 0, 1, 1,
0.2132997, 0.1481565, 3.563698, 1, 0, 0, 1, 1,
0.2163972, 1.162036, -0.8707128, 1, 0, 0, 1, 1,
0.2184706, -0.2304072, 2.884802, 1, 0, 0, 1, 1,
0.2185197, -1.900471, 3.533042, 1, 0, 0, 1, 1,
0.2204374, 0.2307389, -0.4886044, 0, 0, 0, 1, 1,
0.2210186, -0.2603039, 2.668511, 0, 0, 0, 1, 1,
0.2235015, -1.04291, 4.118494, 0, 0, 0, 1, 1,
0.2235222, 2.499657, -0.2051148, 0, 0, 0, 1, 1,
0.2238619, 0.8450038, -0.5153325, 0, 0, 0, 1, 1,
0.2265176, 1.090697, 0.2621842, 0, 0, 0, 1, 1,
0.2267312, 0.9525247, -0.1985663, 0, 0, 0, 1, 1,
0.2270153, 0.6336187, 1.870049, 1, 1, 1, 1, 1,
0.229379, 0.3146928, 1.322284, 1, 1, 1, 1, 1,
0.2310554, 0.7582528, 1.35426, 1, 1, 1, 1, 1,
0.2444989, 1.191232, 1.548875, 1, 1, 1, 1, 1,
0.2452642, -1.792818, 2.000302, 1, 1, 1, 1, 1,
0.2459067, 0.2068286, 0.7459033, 1, 1, 1, 1, 1,
0.2469561, 0.1310076, 1.663763, 1, 1, 1, 1, 1,
0.2499504, -1.652645, 4.247637, 1, 1, 1, 1, 1,
0.2503437, -0.1012382, 1.845545, 1, 1, 1, 1, 1,
0.2510813, -0.4820901, 4.249709, 1, 1, 1, 1, 1,
0.2524044, -0.454519, 2.477415, 1, 1, 1, 1, 1,
0.2545319, -0.7836179, 3.610899, 1, 1, 1, 1, 1,
0.2546967, -0.4631333, 5.49683, 1, 1, 1, 1, 1,
0.2562692, -0.11851, 0.6177928, 1, 1, 1, 1, 1,
0.2567359, -0.1919967, 1.877969, 1, 1, 1, 1, 1,
0.2605644, 0.00578733, 2.391173, 0, 0, 1, 1, 1,
0.2608407, 0.9684445, -0.4319359, 1, 0, 0, 1, 1,
0.261552, -2.349385, 4.00443, 1, 0, 0, 1, 1,
0.2706416, 0.8404539, -0.1497878, 1, 0, 0, 1, 1,
0.2727254, 0.3108325, 0.6233716, 1, 0, 0, 1, 1,
0.2756755, -1.645698, 4.56642, 1, 0, 0, 1, 1,
0.2768443, -1.489883, 3.744553, 0, 0, 0, 1, 1,
0.2771914, -1.797138, 2.602864, 0, 0, 0, 1, 1,
0.2787363, -0.4814058, 3.22458, 0, 0, 0, 1, 1,
0.2799008, 1.4147, -0.01311104, 0, 0, 0, 1, 1,
0.2897592, -0.01309759, 3.91664, 0, 0, 0, 1, 1,
0.2995674, 0.4857429, 0.1041367, 0, 0, 0, 1, 1,
0.3021765, 0.4380582, 1.218576, 0, 0, 0, 1, 1,
0.3039297, 0.236347, 1.583698, 1, 1, 1, 1, 1,
0.3053133, -0.1638131, 1.972547, 1, 1, 1, 1, 1,
0.3090946, -1.091357, 1.710035, 1, 1, 1, 1, 1,
0.3120066, 0.4977275, 1.710213, 1, 1, 1, 1, 1,
0.3171576, 0.2967307, 1.662598, 1, 1, 1, 1, 1,
0.3238612, 1.452055, 0.6092502, 1, 1, 1, 1, 1,
0.3254845, -0.5729927, 2.607692, 1, 1, 1, 1, 1,
0.3277071, 1.745144, 0.6501961, 1, 1, 1, 1, 1,
0.3311142, -0.5632831, 0.7823251, 1, 1, 1, 1, 1,
0.3335884, -1.271971, 3.714769, 1, 1, 1, 1, 1,
0.3353717, -0.05899899, 0.06967841, 1, 1, 1, 1, 1,
0.3393863, 0.7426096, 2.46932, 1, 1, 1, 1, 1,
0.345014, -0.3548115, 1.201885, 1, 1, 1, 1, 1,
0.3456886, 0.9499078, -0.3101408, 1, 1, 1, 1, 1,
0.349453, -0.4336388, 2.310425, 1, 1, 1, 1, 1,
0.351585, 0.1827423, 0.7884188, 0, 0, 1, 1, 1,
0.3537904, 0.9562253, 0.2047374, 1, 0, 0, 1, 1,
0.3546386, 0.4988464, 0.9308324, 1, 0, 0, 1, 1,
0.3546568, -1.115802, 3.254045, 1, 0, 0, 1, 1,
0.3547038, 1.011778, 1.053589, 1, 0, 0, 1, 1,
0.3555866, 1.047552, 0.7610869, 1, 0, 0, 1, 1,
0.3633316, -0.1748366, 1.772609, 0, 0, 0, 1, 1,
0.3716229, -0.8418087, 2.895301, 0, 0, 0, 1, 1,
0.3719674, 1.473739, 1.928159, 0, 0, 0, 1, 1,
0.3790939, -0.24605, 2.376188, 0, 0, 0, 1, 1,
0.3792906, -1.090188, 3.846561, 0, 0, 0, 1, 1,
0.3793657, -0.3673147, 2.235786, 0, 0, 0, 1, 1,
0.3876969, 0.5441746, 1.346912, 0, 0, 0, 1, 1,
0.3952692, 0.1126435, -1.675017, 1, 1, 1, 1, 1,
0.4021694, 0.06215945, 2.425239, 1, 1, 1, 1, 1,
0.4027992, -0.6712995, 1.500524, 1, 1, 1, 1, 1,
0.4033792, 0.3472777, 2.079243, 1, 1, 1, 1, 1,
0.4045939, -0.04465876, -0.4143323, 1, 1, 1, 1, 1,
0.406799, -0.6119679, 2.344293, 1, 1, 1, 1, 1,
0.4088745, 0.7596722, -0.1896687, 1, 1, 1, 1, 1,
0.4097017, -0.2714558, 1.538345, 1, 1, 1, 1, 1,
0.41346, -1.287994, 4.269931, 1, 1, 1, 1, 1,
0.4154843, 0.3384724, 1.565629, 1, 1, 1, 1, 1,
0.4190268, 0.02917777, 0.2302962, 1, 1, 1, 1, 1,
0.422258, -0.706988, 3.11851, 1, 1, 1, 1, 1,
0.4233867, -0.3061613, 2.199317, 1, 1, 1, 1, 1,
0.4265511, 0.6278596, 0.2228503, 1, 1, 1, 1, 1,
0.430831, -0.9193204, 1.289363, 1, 1, 1, 1, 1,
0.4345165, -0.5227038, 2.823216, 0, 0, 1, 1, 1,
0.4428509, 0.012239, 2.612737, 1, 0, 0, 1, 1,
0.4432413, 1.023905, 0.7536147, 1, 0, 0, 1, 1,
0.449441, -0.9704176, 1.046529, 1, 0, 0, 1, 1,
0.4511364, -0.2342259, 2.375149, 1, 0, 0, 1, 1,
0.4567856, -0.7643158, 3.981648, 1, 0, 0, 1, 1,
0.4569858, 1.689871, -0.2476797, 0, 0, 0, 1, 1,
0.4575961, -0.8912438, 3.951962, 0, 0, 0, 1, 1,
0.4588274, 0.1771559, 0.1386388, 0, 0, 0, 1, 1,
0.4601149, 1.690871, 0.7661495, 0, 0, 0, 1, 1,
0.4697941, 0.8485628, 0.7234143, 0, 0, 0, 1, 1,
0.4703262, -0.920887, 1.497239, 0, 0, 0, 1, 1,
0.4709716, -0.5829251, 2.786438, 0, 0, 0, 1, 1,
0.4765608, 0.07504375, 1.183335, 1, 1, 1, 1, 1,
0.4798511, -0.5463969, 2.200089, 1, 1, 1, 1, 1,
0.4825868, 0.0789293, 2.499561, 1, 1, 1, 1, 1,
0.4855412, -0.1758424, 0.8533643, 1, 1, 1, 1, 1,
0.4891989, -0.1675671, 1.465691, 1, 1, 1, 1, 1,
0.489706, 1.820837, 1.102716, 1, 1, 1, 1, 1,
0.4898137, -0.3230703, 2.560844, 1, 1, 1, 1, 1,
0.4915208, 0.2062411, 0.2751051, 1, 1, 1, 1, 1,
0.4931416, 1.160093, 0.1354111, 1, 1, 1, 1, 1,
0.4932505, -0.32555, 1.374012, 1, 1, 1, 1, 1,
0.499091, 2.929558, 0.954385, 1, 1, 1, 1, 1,
0.5013199, 0.2419756, 2.14204, 1, 1, 1, 1, 1,
0.5040493, 0.1413411, 1.44272, 1, 1, 1, 1, 1,
0.5046253, -0.4592926, 1.955434, 1, 1, 1, 1, 1,
0.5054001, 0.8348041, 1.697047, 1, 1, 1, 1, 1,
0.5071723, -0.3195837, 4.271335, 0, 0, 1, 1, 1,
0.516395, 0.7748558, -0.9766135, 1, 0, 0, 1, 1,
0.5233005, 0.7711273, 1.061745, 1, 0, 0, 1, 1,
0.5314101, 0.3318515, 0.7381703, 1, 0, 0, 1, 1,
0.5348715, -0.1391622, 1.78796, 1, 0, 0, 1, 1,
0.5378957, 0.4652674, 1.03793, 1, 0, 0, 1, 1,
0.5395387, 1.748862, -0.5357059, 0, 0, 0, 1, 1,
0.5445524, -0.2719013, 1.881041, 0, 0, 0, 1, 1,
0.5545623, 0.1880145, -0.0251918, 0, 0, 0, 1, 1,
0.5592365, -0.4870874, 2.006149, 0, 0, 0, 1, 1,
0.5602998, 0.1340574, 1.078203, 0, 0, 0, 1, 1,
0.5613966, 0.03461463, 1.531009, 0, 0, 0, 1, 1,
0.5628071, 0.1853831, 1.882604, 0, 0, 0, 1, 1,
0.5642942, -1.553748, 2.890487, 1, 1, 1, 1, 1,
0.5676515, 0.05048695, 2.519234, 1, 1, 1, 1, 1,
0.5773492, 0.1809714, 0.8131193, 1, 1, 1, 1, 1,
0.5784779, 0.5092286, 1.052658, 1, 1, 1, 1, 1,
0.5806929, -0.4294974, 2.737868, 1, 1, 1, 1, 1,
0.5819303, -0.8577394, 2.663802, 1, 1, 1, 1, 1,
0.5836748, 1.335671, 0.3891423, 1, 1, 1, 1, 1,
0.589031, -0.1153126, 3.355958, 1, 1, 1, 1, 1,
0.5936391, 1.697869, 0.07519247, 1, 1, 1, 1, 1,
0.5963315, -1.065031, 4.196813, 1, 1, 1, 1, 1,
0.5982638, 1.611619, 0.8536212, 1, 1, 1, 1, 1,
0.6011195, -1.065706, 2.742558, 1, 1, 1, 1, 1,
0.6023111, -0.02400583, 2.105198, 1, 1, 1, 1, 1,
0.605213, 0.6707363, 0.326282, 1, 1, 1, 1, 1,
0.6061137, 0.7439129, 2.805973, 1, 1, 1, 1, 1,
0.6078587, -0.980401, 1.353053, 0, 0, 1, 1, 1,
0.6095159, -1.400728, 2.218666, 1, 0, 0, 1, 1,
0.6212127, -1.161852, 2.203387, 1, 0, 0, 1, 1,
0.6224257, -0.9148402, 3.806648, 1, 0, 0, 1, 1,
0.6229989, -0.1700448, 0.7917361, 1, 0, 0, 1, 1,
0.6305579, -1.573532, 1.154701, 1, 0, 0, 1, 1,
0.6314147, -1.222682, 2.631321, 0, 0, 0, 1, 1,
0.636889, -0.8510491, 2.844392, 0, 0, 0, 1, 1,
0.6373078, -0.811358, 2.223649, 0, 0, 0, 1, 1,
0.6407416, 1.097108, 1.402719, 0, 0, 0, 1, 1,
0.6434061, 0.4287748, 0.1303165, 0, 0, 0, 1, 1,
0.6488687, 0.1235438, 0.9859356, 0, 0, 0, 1, 1,
0.6574696, 0.5886969, 0.5200076, 0, 0, 0, 1, 1,
0.6667905, -0.469073, 1.997449, 1, 1, 1, 1, 1,
0.667608, -1.025946, 3.06929, 1, 1, 1, 1, 1,
0.6694619, -0.2441939, 0.5906018, 1, 1, 1, 1, 1,
0.6752785, 0.2645744, 0.5513042, 1, 1, 1, 1, 1,
0.6753363, 0.8277662, -0.03916607, 1, 1, 1, 1, 1,
0.6809478, -0.8833461, 1.621759, 1, 1, 1, 1, 1,
0.6835746, 0.6147979, -0.003748382, 1, 1, 1, 1, 1,
0.6839879, 0.1489681, 0.4239277, 1, 1, 1, 1, 1,
0.6889239, -0.4322477, 3.100198, 1, 1, 1, 1, 1,
0.6902105, -0.2048778, 2.794383, 1, 1, 1, 1, 1,
0.6904293, -1.655049, 2.874351, 1, 1, 1, 1, 1,
0.6908912, 0.3526748, 0.9916599, 1, 1, 1, 1, 1,
0.6922019, 0.5620906, 1.239648, 1, 1, 1, 1, 1,
0.6926135, -0.4839717, 1.671361, 1, 1, 1, 1, 1,
0.6941022, -0.2458322, 0.03605417, 1, 1, 1, 1, 1,
0.6954356, 0.1620928, 0.8456247, 0, 0, 1, 1, 1,
0.6955376, 0.3366712, 1.98094, 1, 0, 0, 1, 1,
0.7001501, 0.8678094, 1.364349, 1, 0, 0, 1, 1,
0.7067619, -0.4036403, 2.604196, 1, 0, 0, 1, 1,
0.7097816, -0.8450274, 1.914359, 1, 0, 0, 1, 1,
0.7136556, -1.624761, 2.710953, 1, 0, 0, 1, 1,
0.7186585, -0.2629024, 1.069373, 0, 0, 0, 1, 1,
0.7252451, 1.343651, 0.3962477, 0, 0, 0, 1, 1,
0.726118, -0.7505137, 3.426232, 0, 0, 0, 1, 1,
0.7282513, -1.25996, 1.460248, 0, 0, 0, 1, 1,
0.7295153, 0.569003, 1.071256, 0, 0, 0, 1, 1,
0.7316607, 0.006889753, 1.720794, 0, 0, 0, 1, 1,
0.7346455, -0.5997259, 4.082397, 0, 0, 0, 1, 1,
0.7480908, -0.06475765, 1.736976, 1, 1, 1, 1, 1,
0.7518467, 0.383363, 0.8194724, 1, 1, 1, 1, 1,
0.7588401, -1.079162, 2.503566, 1, 1, 1, 1, 1,
0.7616882, -0.6077822, 1.968639, 1, 1, 1, 1, 1,
0.7686172, -0.3755906, 2.171403, 1, 1, 1, 1, 1,
0.7707055, 0.5232306, 0.6037468, 1, 1, 1, 1, 1,
0.7720821, -0.8923723, 2.795274, 1, 1, 1, 1, 1,
0.7731324, -0.7886577, 3.063538, 1, 1, 1, 1, 1,
0.7784259, 1.34429, -0.1171037, 1, 1, 1, 1, 1,
0.7840801, 0.4635918, 0.2503841, 1, 1, 1, 1, 1,
0.7960634, 0.02466772, -0.1689407, 1, 1, 1, 1, 1,
0.8007527, 1.197395, 2.490439, 1, 1, 1, 1, 1,
0.802804, 0.101439, 0.2290711, 1, 1, 1, 1, 1,
0.8054491, 0.2409319, 1.861176, 1, 1, 1, 1, 1,
0.8068735, -0.8252747, 1.77705, 1, 1, 1, 1, 1,
0.8070812, 0.298327, 1.861814, 0, 0, 1, 1, 1,
0.8074387, 0.2163069, -0.1170297, 1, 0, 0, 1, 1,
0.8105198, 0.05758398, 1.174702, 1, 0, 0, 1, 1,
0.8111297, -0.1938767, 1.770494, 1, 0, 0, 1, 1,
0.8136773, 1.369271, 0.7072167, 1, 0, 0, 1, 1,
0.8147088, 2.645133, 1.419704, 1, 0, 0, 1, 1,
0.816155, -0.0952663, 1.532471, 0, 0, 0, 1, 1,
0.8167995, -2.177452, 2.584036, 0, 0, 0, 1, 1,
0.8172057, -0.7110267, 1.319485, 0, 0, 0, 1, 1,
0.817347, -1.832116, 3.983017, 0, 0, 0, 1, 1,
0.8225825, 0.9200239, 1.144007, 0, 0, 0, 1, 1,
0.8249779, -2.303624, 2.644651, 0, 0, 0, 1, 1,
0.8306699, 0.8272561, 2.435389, 0, 0, 0, 1, 1,
0.8404385, 0.7395972, 0.2288608, 1, 1, 1, 1, 1,
0.8457632, 0.3419949, 0.4906543, 1, 1, 1, 1, 1,
0.8518975, 1.013066, 1.172948, 1, 1, 1, 1, 1,
0.8550896, -0.468779, 2.447357, 1, 1, 1, 1, 1,
0.8604571, -1.136703, 1.829089, 1, 1, 1, 1, 1,
0.8620151, 0.8558462, -0.6101889, 1, 1, 1, 1, 1,
0.8852198, -0.0723417, 2.999197, 1, 1, 1, 1, 1,
0.8861421, 0.1421059, 1.528712, 1, 1, 1, 1, 1,
0.8918341, 0.7792736, 0.8574015, 1, 1, 1, 1, 1,
0.892507, 0.9020733, 0.5060005, 1, 1, 1, 1, 1,
0.8965834, 0.1204886, 1.241845, 1, 1, 1, 1, 1,
0.9227812, -0.9578198, 2.031959, 1, 1, 1, 1, 1,
0.9269934, -1.605229, 2.515724, 1, 1, 1, 1, 1,
0.9293022, -0.403836, 3.070059, 1, 1, 1, 1, 1,
0.9345492, 1.324751, -0.4105692, 1, 1, 1, 1, 1,
0.9380187, -0.5951568, 1.402598, 0, 0, 1, 1, 1,
0.9387212, -0.4721203, 0.3346547, 1, 0, 0, 1, 1,
0.9415867, 0.8191797, 1.349188, 1, 0, 0, 1, 1,
0.9424914, -1.264477, 2.63764, 1, 0, 0, 1, 1,
0.9427566, -1.402434, 0.3592202, 1, 0, 0, 1, 1,
0.9582043, -0.05510357, 2.407668, 1, 0, 0, 1, 1,
0.9623461, 0.1148162, -0.342002, 0, 0, 0, 1, 1,
0.9658856, 1.264987, 1.064543, 0, 0, 0, 1, 1,
0.9728829, 0.3988023, 1.073196, 0, 0, 0, 1, 1,
0.9762263, -0.4587109, 3.209817, 0, 0, 0, 1, 1,
0.9777642, 0.04019396, 2.068628, 0, 0, 0, 1, 1,
0.9918966, -1.23651, 2.15907, 0, 0, 0, 1, 1,
0.9989107, -1.257393, 1.616205, 0, 0, 0, 1, 1,
0.999441, 0.03260658, 4.826867, 1, 1, 1, 1, 1,
1.001655, -0.6981062, 2.385498, 1, 1, 1, 1, 1,
1.004791, -0.5205492, 5.226373, 1, 1, 1, 1, 1,
1.012692, 1.633257, 0.3825619, 1, 1, 1, 1, 1,
1.013722, -0.1399246, 2.516028, 1, 1, 1, 1, 1,
1.019722, -1.133631, 1.977379, 1, 1, 1, 1, 1,
1.020502, 1.131206, -0.3930371, 1, 1, 1, 1, 1,
1.021667, 1.526259, 1.484143, 1, 1, 1, 1, 1,
1.02269, 0.393904, 1.113417, 1, 1, 1, 1, 1,
1.026584, 0.05728192, 1.542009, 1, 1, 1, 1, 1,
1.027907, -1.225885, 1.016421, 1, 1, 1, 1, 1,
1.031328, -0.782232, 1.41609, 1, 1, 1, 1, 1,
1.032217, 1.081098, 1.839008, 1, 1, 1, 1, 1,
1.044896, 1.523962, 1.644423, 1, 1, 1, 1, 1,
1.046632, -0.1642766, 2.881438, 1, 1, 1, 1, 1,
1.048813, 0.3609219, -0.2252626, 0, 0, 1, 1, 1,
1.054541, 0.2335012, 1.327935, 1, 0, 0, 1, 1,
1.066454, 1.941269, -0.7604946, 1, 0, 0, 1, 1,
1.071667, -0.4833457, 2.027131, 1, 0, 0, 1, 1,
1.074123, -0.560387, 0.3775075, 1, 0, 0, 1, 1,
1.074446, -0.8467045, 0.6521625, 1, 0, 0, 1, 1,
1.076684, 0.1047988, 2.027679, 0, 0, 0, 1, 1,
1.07717, -0.4441981, 1.874304, 0, 0, 0, 1, 1,
1.084387, -0.8892096, 1.947819, 0, 0, 0, 1, 1,
1.08788, -1.299809, 2.22891, 0, 0, 0, 1, 1,
1.09131, 2.412975, 0.5427254, 0, 0, 0, 1, 1,
1.10061, -1.267553, 1.258637, 0, 0, 0, 1, 1,
1.102579, 0.008825342, 2.010761, 0, 0, 0, 1, 1,
1.103361, 0.2876009, 0.4503259, 1, 1, 1, 1, 1,
1.104233, -0.1416483, 1.527965, 1, 1, 1, 1, 1,
1.105841, 0.858, 1.44285, 1, 1, 1, 1, 1,
1.106244, 0.542808, 1.117963, 1, 1, 1, 1, 1,
1.124943, 0.6882783, 2.457238, 1, 1, 1, 1, 1,
1.134421, 2.417773, 0.3866578, 1, 1, 1, 1, 1,
1.144353, 0.5211344, -1.808482, 1, 1, 1, 1, 1,
1.144518, -0.2056004, 3.007554, 1, 1, 1, 1, 1,
1.147967, -1.404121, 2.53295, 1, 1, 1, 1, 1,
1.152307, -1.220677, 3.141521, 1, 1, 1, 1, 1,
1.161677, 0.7946391, 0.8331755, 1, 1, 1, 1, 1,
1.169137, 0.9111872, 1.422615, 1, 1, 1, 1, 1,
1.184143, -1.292411, 3.05878, 1, 1, 1, 1, 1,
1.187747, 1.085147, 1.053649, 1, 1, 1, 1, 1,
1.192238, 0.7024504, 1.831817, 1, 1, 1, 1, 1,
1.203021, -1.067929, 3.518163, 0, 0, 1, 1, 1,
1.210148, 0.2404555, 3.596565, 1, 0, 0, 1, 1,
1.214081, 1.114609, 1.542641, 1, 0, 0, 1, 1,
1.219741, 0.1625076, 0.8720394, 1, 0, 0, 1, 1,
1.221917, 0.2785787, 1.859945, 1, 0, 0, 1, 1,
1.228694, -0.7482948, 3.993427, 1, 0, 0, 1, 1,
1.233189, -1.091771, 2.497661, 0, 0, 0, 1, 1,
1.23475, 1.280311, 0.1522583, 0, 0, 0, 1, 1,
1.236063, -1.561511, 1.153891, 0, 0, 0, 1, 1,
1.243136, 0.4749924, 2.563689, 0, 0, 0, 1, 1,
1.243853, 2.569896, 1.068357, 0, 0, 0, 1, 1,
1.24712, -1.243808, 2.26039, 0, 0, 0, 1, 1,
1.255362, -1.502618, 1.222762, 0, 0, 0, 1, 1,
1.256867, 1.106055, -0.6855513, 1, 1, 1, 1, 1,
1.258711, 0.6384602, 0.5114994, 1, 1, 1, 1, 1,
1.270662, 0.192853, 0.7465671, 1, 1, 1, 1, 1,
1.271959, -0.1314922, 0.1669737, 1, 1, 1, 1, 1,
1.300796, -0.3372283, 2.153391, 1, 1, 1, 1, 1,
1.317736, 0.4285126, -0.01915865, 1, 1, 1, 1, 1,
1.318601, 0.1960133, -0.5254308, 1, 1, 1, 1, 1,
1.3351, 0.2604433, 2.498169, 1, 1, 1, 1, 1,
1.337701, 0.9597173, 0.5950819, 1, 1, 1, 1, 1,
1.340064, -0.6983491, 2.133674, 1, 1, 1, 1, 1,
1.34399, 0.6233871, -0.6446959, 1, 1, 1, 1, 1,
1.346601, -1.055825, 2.911675, 1, 1, 1, 1, 1,
1.34681, 1.305349, 0.9487023, 1, 1, 1, 1, 1,
1.353314, -2.340265, 1.451799, 1, 1, 1, 1, 1,
1.3604, -0.5537059, 2.030361, 1, 1, 1, 1, 1,
1.361233, -0.2578088, 0.4683025, 0, 0, 1, 1, 1,
1.362171, 1.252208, 2.303605, 1, 0, 0, 1, 1,
1.373594, -0.05704504, 4.38238, 1, 0, 0, 1, 1,
1.373648, -0.4058398, 2.381043, 1, 0, 0, 1, 1,
1.38785, -0.0752707, 3.671982, 1, 0, 0, 1, 1,
1.394618, 1.31601, -0.4585514, 1, 0, 0, 1, 1,
1.424889, 0.8122097, 1.856669, 0, 0, 0, 1, 1,
1.425244, -0.5153115, 3.113691, 0, 0, 0, 1, 1,
1.437862, 0.7232587, 3.01631, 0, 0, 0, 1, 1,
1.443374, 0.2699921, 2.534853, 0, 0, 0, 1, 1,
1.447861, -0.4644434, 1.44102, 0, 0, 0, 1, 1,
1.453034, 1.516378, -1.778428, 0, 0, 0, 1, 1,
1.461744, 0.5308795, 0.9421015, 0, 0, 0, 1, 1,
1.465322, 0.6085973, 2.310625, 1, 1, 1, 1, 1,
1.471298, 2.070996, 1.894306, 1, 1, 1, 1, 1,
1.483254, -1.91797, 1.427098, 1, 1, 1, 1, 1,
1.490507, -0.5714974, 4.441023, 1, 1, 1, 1, 1,
1.495658, -0.9208044, 1.724763, 1, 1, 1, 1, 1,
1.511918, -0.04851834, 2.640364, 1, 1, 1, 1, 1,
1.512016, 0.6362762, 0.7414917, 1, 1, 1, 1, 1,
1.512891, 0.1974321, 1.42497, 1, 1, 1, 1, 1,
1.514018, 2.167812, 1.147956, 1, 1, 1, 1, 1,
1.519536, 0.246623, 0.7109712, 1, 1, 1, 1, 1,
1.519998, -1.247329, 2.20217, 1, 1, 1, 1, 1,
1.530838, -0.7974521, 0.4025327, 1, 1, 1, 1, 1,
1.5314, -0.09392893, 2.478729, 1, 1, 1, 1, 1,
1.542681, -0.7342366, 1.945792, 1, 1, 1, 1, 1,
1.559162, -0.2126094, 2.988871, 1, 1, 1, 1, 1,
1.562143, 1.788368, 2.268898, 0, 0, 1, 1, 1,
1.574182, 0.5475143, 0.6793165, 1, 0, 0, 1, 1,
1.585662, 0.8233981, 0.7076042, 1, 0, 0, 1, 1,
1.591781, -0.09160531, 1.597368, 1, 0, 0, 1, 1,
1.595781, 0.8868361, 0.2642501, 1, 0, 0, 1, 1,
1.603743, 0.6170262, 2.12534, 1, 0, 0, 1, 1,
1.615512, -0.5512832, 3.207789, 0, 0, 0, 1, 1,
1.616891, -0.01091755, 2.826736, 0, 0, 0, 1, 1,
1.618387, -0.5052639, 2.899837, 0, 0, 0, 1, 1,
1.622656, -0.4506426, 1.736017, 0, 0, 0, 1, 1,
1.623405, 0.9319636, 1.027449, 0, 0, 0, 1, 1,
1.62844, 0.4535832, 0.5069377, 0, 0, 0, 1, 1,
1.639938, 0.09375244, 2.266065, 0, 0, 0, 1, 1,
1.642881, 0.1661297, 1.492722, 1, 1, 1, 1, 1,
1.66442, -1.521435, 3.392744, 1, 1, 1, 1, 1,
1.67304, -0.3846119, 1.711936, 1, 1, 1, 1, 1,
1.689015, 0.05144221, 1.853306, 1, 1, 1, 1, 1,
1.691, -0.3637253, 1.39693, 1, 1, 1, 1, 1,
1.706559, -0.4630408, 2.815225, 1, 1, 1, 1, 1,
1.712557, -1.044811, 1.189963, 1, 1, 1, 1, 1,
1.713429, -0.1281514, 0.365415, 1, 1, 1, 1, 1,
1.717963, 1.189444, 0.7295302, 1, 1, 1, 1, 1,
1.753391, 0.2395232, 0.8415318, 1, 1, 1, 1, 1,
1.754364, -0.2424226, 0.7422749, 1, 1, 1, 1, 1,
1.756803, 0.5990825, 2.026967, 1, 1, 1, 1, 1,
1.782404, -0.7515824, 1.570918, 1, 1, 1, 1, 1,
1.789681, -0.41765, 0.6030964, 1, 1, 1, 1, 1,
1.792312, -0.2722778, 1.371778, 1, 1, 1, 1, 1,
1.798624, -0.9964243, 1.820167, 0, 0, 1, 1, 1,
1.81143, -0.2848794, 2.2432, 1, 0, 0, 1, 1,
1.819155, -0.9978153, 2.82715, 1, 0, 0, 1, 1,
1.827584, 1.099038, 1.288572, 1, 0, 0, 1, 1,
1.827674, 0.8741796, -1.181898, 1, 0, 0, 1, 1,
1.843285, -1.291151, 3.031767, 1, 0, 0, 1, 1,
1.848275, 0.0379118, 0.2611769, 0, 0, 0, 1, 1,
1.861996, 0.1276668, 1.778389, 0, 0, 0, 1, 1,
1.878206, 0.2276237, 1.804411, 0, 0, 0, 1, 1,
1.880551, 0.2683958, -1.882366, 0, 0, 0, 1, 1,
1.885208, 0.4327076, 0.8956283, 0, 0, 0, 1, 1,
1.89088, -0.6181757, 0.8914735, 0, 0, 0, 1, 1,
1.893945, -0.2237278, 3.621763, 0, 0, 0, 1, 1,
1.910965, -0.3234003, 2.517826, 1, 1, 1, 1, 1,
1.913075, 1.503301, -0.01933933, 1, 1, 1, 1, 1,
1.917998, 0.4321721, 0.1073917, 1, 1, 1, 1, 1,
1.921738, -0.2789659, 2.651835, 1, 1, 1, 1, 1,
1.931232, 0.570166, 1.054564, 1, 1, 1, 1, 1,
1.961606, 1.795905, 1.878534, 1, 1, 1, 1, 1,
1.96414, -0.3046343, 3.096117, 1, 1, 1, 1, 1,
2.009813, -0.1021866, 1.789326, 1, 1, 1, 1, 1,
2.02459, 0.5437369, 2.014721, 1, 1, 1, 1, 1,
2.04205, -0.4852317, 3.075227, 1, 1, 1, 1, 1,
2.06264, 0.04876227, 2.352945, 1, 1, 1, 1, 1,
2.066447, -0.2320854, 0.4759657, 1, 1, 1, 1, 1,
2.071725, -0.2868336, 0.3013194, 1, 1, 1, 1, 1,
2.07469, -0.750362, -0.5990036, 1, 1, 1, 1, 1,
2.079339, 0.3255129, 2.784246, 1, 1, 1, 1, 1,
2.096632, 1.60851, 2.225995, 0, 0, 1, 1, 1,
2.12462, 0.459856, 2.161458, 1, 0, 0, 1, 1,
2.142423, 0.657672, 1.791006, 1, 0, 0, 1, 1,
2.142855, 0.5635806, 1.104337, 1, 0, 0, 1, 1,
2.177225, 1.120695, 1.936356, 1, 0, 0, 1, 1,
2.183663, 0.5647154, 0.4305373, 1, 0, 0, 1, 1,
2.219417, 0.7674348, 0.7038626, 0, 0, 0, 1, 1,
2.22306, -1.291425, 2.513014, 0, 0, 0, 1, 1,
2.282965, -0.3189587, 1.216071, 0, 0, 0, 1, 1,
2.344944, -0.8039783, 2.264807, 0, 0, 0, 1, 1,
2.345019, -0.6842946, 3.46089, 0, 0, 0, 1, 1,
2.367098, 0.01208229, -0.5577857, 0, 0, 0, 1, 1,
2.384543, -0.09337291, 0.6263642, 0, 0, 0, 1, 1,
2.400796, 0.9800122, 3.928725, 1, 1, 1, 1, 1,
2.448422, -0.08521056, 3.225822, 1, 1, 1, 1, 1,
2.538988, 0.6418711, 0.3957691, 1, 1, 1, 1, 1,
2.554784, -0.8296798, 1.536414, 1, 1, 1, 1, 1,
2.594275, -0.6809227, 2.636914, 1, 1, 1, 1, 1,
2.642769, 0.212238, 1.448538, 1, 1, 1, 1, 1,
3.519927, 1.150832, 1.89019, 1, 1, 1, 1, 1
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
var radius = 10.22537;
var distance = 35.91618;
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
mvMatrix.translate( 0.1027341, 0.1807624, -0.3702397 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.91618);
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
