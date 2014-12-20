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
-3.566327, -2.51291, -3.110827, 1, 0, 0, 1,
-3.070247, 1.142912, -0.1894063, 1, 0.007843138, 0, 1,
-2.920236, -1.907426, -1.152064, 1, 0.01176471, 0, 1,
-2.864569, 0.4949409, -2.538252, 1, 0.01960784, 0, 1,
-2.655526, 1.394766, -1.257075, 1, 0.02352941, 0, 1,
-2.644445, -0.3279702, -1.349043, 1, 0.03137255, 0, 1,
-2.566033, 0.1470399, 0.2096987, 1, 0.03529412, 0, 1,
-2.529014, -0.3817702, -0.8332413, 1, 0.04313726, 0, 1,
-2.427903, 0.693572, -2.053349, 1, 0.04705882, 0, 1,
-2.335473, -0.1877611, -1.493148, 1, 0.05490196, 0, 1,
-2.26966, -0.3881879, -2.382943, 1, 0.05882353, 0, 1,
-2.260923, -0.3009046, 0.4198188, 1, 0.06666667, 0, 1,
-2.25681, 0.1613449, -0.9926406, 1, 0.07058824, 0, 1,
-2.18332, -0.4896648, -0.9597887, 1, 0.07843138, 0, 1,
-2.165107, -0.1422604, -2.444454, 1, 0.08235294, 0, 1,
-2.137738, -1.437614, -4.510919, 1, 0.09019608, 0, 1,
-2.114559, -0.8548775, -3.572332, 1, 0.09411765, 0, 1,
-2.092576, 0.7920381, -1.099292, 1, 0.1019608, 0, 1,
-2.067852, -0.4226522, -1.278294, 1, 0.1098039, 0, 1,
-2.038105, -0.09499018, -2.944891, 1, 0.1137255, 0, 1,
-2.001353, -1.550563, -2.309217, 1, 0.1215686, 0, 1,
-1.985389, -0.118079, -1.111464, 1, 0.1254902, 0, 1,
-1.970371, 0.2191369, -2.897845, 1, 0.1333333, 0, 1,
-1.965868, 1.727375, 0.2334654, 1, 0.1372549, 0, 1,
-1.956013, -0.06100053, -1.821244, 1, 0.145098, 0, 1,
-1.949868, -0.4799004, -2.511552, 1, 0.1490196, 0, 1,
-1.948586, -0.6629341, -0.7400281, 1, 0.1568628, 0, 1,
-1.928034, 1.41793, -1.059064, 1, 0.1607843, 0, 1,
-1.909806, 3.012853, -1.176723, 1, 0.1686275, 0, 1,
-1.900506, -1.181467, -0.8095044, 1, 0.172549, 0, 1,
-1.845396, 0.3460958, -1.622845, 1, 0.1803922, 0, 1,
-1.840544, 0.8546702, -3.635815, 1, 0.1843137, 0, 1,
-1.839631, -1.863969, -4.536286, 1, 0.1921569, 0, 1,
-1.822026, -1.462636, -1.118966, 1, 0.1960784, 0, 1,
-1.8123, -1.255939, -2.650688, 1, 0.2039216, 0, 1,
-1.805782, -0.4928095, -0.1633783, 1, 0.2117647, 0, 1,
-1.797519, 1.285249, -1.57577, 1, 0.2156863, 0, 1,
-1.774389, -0.04466447, -1.96514, 1, 0.2235294, 0, 1,
-1.765506, -1.854925, -3.490054, 1, 0.227451, 0, 1,
-1.756841, -0.153378, -1.170101, 1, 0.2352941, 0, 1,
-1.742566, 0.1355511, 0.5419576, 1, 0.2392157, 0, 1,
-1.682495, 0.04462346, -1.502759, 1, 0.2470588, 0, 1,
-1.677794, -2.333179, -2.73437, 1, 0.2509804, 0, 1,
-1.673869, 0.4434242, -1.798051, 1, 0.2588235, 0, 1,
-1.664244, -1.177217, -2.645423, 1, 0.2627451, 0, 1,
-1.648696, 0.7962551, -2.468284, 1, 0.2705882, 0, 1,
-1.646878, -0.1147956, -1.91458, 1, 0.2745098, 0, 1,
-1.634637, 0.2928801, 0.2496613, 1, 0.282353, 0, 1,
-1.631754, -0.6400747, -3.086574, 1, 0.2862745, 0, 1,
-1.629499, -1.017624, -2.878727, 1, 0.2941177, 0, 1,
-1.628797, -0.09164791, -1.716845, 1, 0.3019608, 0, 1,
-1.628281, 0.4407843, -1.934923, 1, 0.3058824, 0, 1,
-1.6262, 1.354162, -0.60629, 1, 0.3137255, 0, 1,
-1.626132, -0.361424, -2.317461, 1, 0.3176471, 0, 1,
-1.622262, 0.158578, -1.699038, 1, 0.3254902, 0, 1,
-1.621034, -1.090101, -2.768197, 1, 0.3294118, 0, 1,
-1.615909, 0.2078781, -1.013283, 1, 0.3372549, 0, 1,
-1.604115, 0.3395999, -2.010419, 1, 0.3411765, 0, 1,
-1.59676, -1.866065, -0.5802489, 1, 0.3490196, 0, 1,
-1.585617, 1.72455, -0.29031, 1, 0.3529412, 0, 1,
-1.571827, 0.8476169, -1.415796, 1, 0.3607843, 0, 1,
-1.56327, 1.113368, -0.1535209, 1, 0.3647059, 0, 1,
-1.562577, 0.5491503, -0.9590279, 1, 0.372549, 0, 1,
-1.544183, 1.283613, -1.052119, 1, 0.3764706, 0, 1,
-1.543698, 0.6131672, -1.709288, 1, 0.3843137, 0, 1,
-1.536681, -1.247751, -2.72182, 1, 0.3882353, 0, 1,
-1.534266, -2.690653, -2.35857, 1, 0.3960784, 0, 1,
-1.532844, -0.1288505, -1.725762, 1, 0.4039216, 0, 1,
-1.51968, -0.3446117, -2.806038, 1, 0.4078431, 0, 1,
-1.513121, -0.553261, -2.607063, 1, 0.4156863, 0, 1,
-1.512689, 0.3453921, -0.4175295, 1, 0.4196078, 0, 1,
-1.511034, 1.524414, -2.11587, 1, 0.427451, 0, 1,
-1.491742, 1.182773, 1.350384, 1, 0.4313726, 0, 1,
-1.487727, -0.0747183, -0.3962973, 1, 0.4392157, 0, 1,
-1.484782, 0.1630562, -3.073657, 1, 0.4431373, 0, 1,
-1.479627, -0.03355394, 2.269978, 1, 0.4509804, 0, 1,
-1.478774, 0.3804164, -3.636471, 1, 0.454902, 0, 1,
-1.467461, 0.3596162, 0.2923952, 1, 0.4627451, 0, 1,
-1.464359, 0.6610659, -1.480082, 1, 0.4666667, 0, 1,
-1.461486, -0.9973195, -3.38669, 1, 0.4745098, 0, 1,
-1.45774, -1.392777, -2.238978, 1, 0.4784314, 0, 1,
-1.457447, -1.474087, -3.799221, 1, 0.4862745, 0, 1,
-1.456459, 0.6982672, -1.231488, 1, 0.4901961, 0, 1,
-1.456312, 0.8548256, -2.603513, 1, 0.4980392, 0, 1,
-1.44986, -2.155005, -1.395545, 1, 0.5058824, 0, 1,
-1.444932, 0.51962, -1.202594, 1, 0.509804, 0, 1,
-1.443553, 1.268313, -1.447251, 1, 0.5176471, 0, 1,
-1.426969, -0.4195607, -1.977224, 1, 0.5215687, 0, 1,
-1.422294, 0.1968295, -1.290501, 1, 0.5294118, 0, 1,
-1.420227, 0.5134538, -1.753383, 1, 0.5333334, 0, 1,
-1.41628, -1.427957, -2.690659, 1, 0.5411765, 0, 1,
-1.413583, -0.4508731, -1.53096, 1, 0.5450981, 0, 1,
-1.410954, 1.360794, -1.087004, 1, 0.5529412, 0, 1,
-1.403793, -0.7488795, -2.430622, 1, 0.5568628, 0, 1,
-1.395201, 1.564941, -1.271989, 1, 0.5647059, 0, 1,
-1.392922, 0.1173261, -0.513429, 1, 0.5686275, 0, 1,
-1.38985, 0.1170496, -0.8695504, 1, 0.5764706, 0, 1,
-1.389032, 0.4693228, -1.738713, 1, 0.5803922, 0, 1,
-1.388013, 1.369521, 0.04562248, 1, 0.5882353, 0, 1,
-1.387272, 0.8415757, -1.467093, 1, 0.5921569, 0, 1,
-1.373289, 0.3655917, -0.6593845, 1, 0.6, 0, 1,
-1.361337, -1.302237, -1.752312, 1, 0.6078432, 0, 1,
-1.343307, -1.494766, -2.052696, 1, 0.6117647, 0, 1,
-1.34124, -0.8460979, -3.850584, 1, 0.6196079, 0, 1,
-1.337808, -0.06155045, -0.0742204, 1, 0.6235294, 0, 1,
-1.336963, 0.1863929, -1.635313, 1, 0.6313726, 0, 1,
-1.330904, 0.2748061, -2.048785, 1, 0.6352941, 0, 1,
-1.320386, -1.042175, -1.690513, 1, 0.6431373, 0, 1,
-1.319742, -0.8384783, -0.9705739, 1, 0.6470588, 0, 1,
-1.309273, 0.1068681, -1.269185, 1, 0.654902, 0, 1,
-1.30497, 0.2427095, -0.532041, 1, 0.6588235, 0, 1,
-1.301241, 0.3603185, -1.343295, 1, 0.6666667, 0, 1,
-1.281397, -0.5575171, -1.969207, 1, 0.6705883, 0, 1,
-1.280279, 1.066367, -1.353855, 1, 0.6784314, 0, 1,
-1.279139, -2.111458, -1.325444, 1, 0.682353, 0, 1,
-1.263511, 0.4666429, 0.07546031, 1, 0.6901961, 0, 1,
-1.244507, -0.05740421, -0.1465169, 1, 0.6941177, 0, 1,
-1.235915, -1.445667, -1.134493, 1, 0.7019608, 0, 1,
-1.23027, -0.9375212, -2.678239, 1, 0.7098039, 0, 1,
-1.221896, -0.001121238, -1.038026, 1, 0.7137255, 0, 1,
-1.217417, -1.392212, -1.957861, 1, 0.7215686, 0, 1,
-1.216252, 0.2086968, -0.4567528, 1, 0.7254902, 0, 1,
-1.216186, 1.135816, 0.2605306, 1, 0.7333333, 0, 1,
-1.212487, -0.8603845, -0.8265538, 1, 0.7372549, 0, 1,
-1.210323, 1.229664, -0.109368, 1, 0.7450981, 0, 1,
-1.198975, -0.2974224, -3.08578, 1, 0.7490196, 0, 1,
-1.194347, 1.084127, -0.02781439, 1, 0.7568628, 0, 1,
-1.19268, 0.05763563, -2.188974, 1, 0.7607843, 0, 1,
-1.192394, 0.7642177, -0.5957685, 1, 0.7686275, 0, 1,
-1.191529, 0.4840379, -1.145949, 1, 0.772549, 0, 1,
-1.191082, -1.766466, -2.169417, 1, 0.7803922, 0, 1,
-1.177679, -0.6214578, -0.8782414, 1, 0.7843137, 0, 1,
-1.171269, 0.4759789, -1.708124, 1, 0.7921569, 0, 1,
-1.153331, 0.5366468, 0.2467855, 1, 0.7960784, 0, 1,
-1.146345, -0.6017458, -2.613503, 1, 0.8039216, 0, 1,
-1.132263, -0.3852688, -0.7814166, 1, 0.8117647, 0, 1,
-1.125888, -0.9347018, -0.2639132, 1, 0.8156863, 0, 1,
-1.123687, -1.047523, -1.93785, 1, 0.8235294, 0, 1,
-1.120846, -0.2302974, -1.513108, 1, 0.827451, 0, 1,
-1.117261, 0.1545766, 0.2049938, 1, 0.8352941, 0, 1,
-1.11449, -0.9933093, -2.560835, 1, 0.8392157, 0, 1,
-1.108258, 0.3085397, -1.71316, 1, 0.8470588, 0, 1,
-1.107846, -0.4652594, -2.139403, 1, 0.8509804, 0, 1,
-1.105093, 0.123975, -1.05824, 1, 0.8588235, 0, 1,
-1.101858, -2.161401, -4.525492, 1, 0.8627451, 0, 1,
-1.099551, 0.2859423, -2.02957, 1, 0.8705882, 0, 1,
-1.068093, -0.01644251, -1.804764, 1, 0.8745098, 0, 1,
-1.066706, 0.06314318, -2.706461, 1, 0.8823529, 0, 1,
-1.060907, -0.5173135, -2.949646, 1, 0.8862745, 0, 1,
-1.056646, 2.840071, 0.2604361, 1, 0.8941177, 0, 1,
-1.033973, 2.620857, 1.234126, 1, 0.8980392, 0, 1,
-1.021943, -1.113485, -2.810565, 1, 0.9058824, 0, 1,
-1.011596, -0.6538647, -0.3631782, 1, 0.9137255, 0, 1,
-1.011122, -0.7549525, -1.748879, 1, 0.9176471, 0, 1,
-1.003541, -0.8962786, -2.249591, 1, 0.9254902, 0, 1,
-1.00052, 0.1307562, -0.463758, 1, 0.9294118, 0, 1,
-0.9985518, 1.718852, -1.217701, 1, 0.9372549, 0, 1,
-0.9930435, 0.8415198, -0.03165513, 1, 0.9411765, 0, 1,
-0.984061, 0.1888396, -0.2280231, 1, 0.9490196, 0, 1,
-0.9834769, 0.04014713, -1.793545, 1, 0.9529412, 0, 1,
-0.9828115, -0.545714, -4.271945, 1, 0.9607843, 0, 1,
-0.981307, -2.038592, -2.28153, 1, 0.9647059, 0, 1,
-0.9809681, 0.5238695, -1.219744, 1, 0.972549, 0, 1,
-0.9804193, -0.2397159, -3.554867, 1, 0.9764706, 0, 1,
-0.9755464, -0.3433297, -1.930843, 1, 0.9843137, 0, 1,
-0.9710556, -2.38064, -1.229994, 1, 0.9882353, 0, 1,
-0.9666037, 0.7295748, -0.3281528, 1, 0.9960784, 0, 1,
-0.9643555, 0.3875921, -0.4859534, 0.9960784, 1, 0, 1,
-0.9520348, 0.1939345, -0.5969391, 0.9921569, 1, 0, 1,
-0.9506562, -0.3713775, -1.533377, 0.9843137, 1, 0, 1,
-0.9505002, 0.09915513, -3.39084, 0.9803922, 1, 0, 1,
-0.9488401, 0.3592229, -1.275839, 0.972549, 1, 0, 1,
-0.9485641, -0.8877486, -3.201293, 0.9686275, 1, 0, 1,
-0.944663, -0.5773277, -2.213035, 0.9607843, 1, 0, 1,
-0.9444829, 0.0522744, -2.261973, 0.9568627, 1, 0, 1,
-0.9442053, 0.7706334, -1.782984, 0.9490196, 1, 0, 1,
-0.9440128, 1.484875, -0.6875376, 0.945098, 1, 0, 1,
-0.938587, -0.3030615, -0.8316473, 0.9372549, 1, 0, 1,
-0.9330574, 0.02278176, -2.115057, 0.9333333, 1, 0, 1,
-0.9330158, 1.838695, 0.4192867, 0.9254902, 1, 0, 1,
-0.9317926, -1.971419, -3.36009, 0.9215686, 1, 0, 1,
-0.9284117, 1.103207, -0.635551, 0.9137255, 1, 0, 1,
-0.9127386, 0.218179, -1.016765, 0.9098039, 1, 0, 1,
-0.9093554, 1.827701, 0.3019547, 0.9019608, 1, 0, 1,
-0.9081597, 0.2748947, -0.2263365, 0.8941177, 1, 0, 1,
-0.9023077, 1.599569, -1.094488, 0.8901961, 1, 0, 1,
-0.8991135, -1.346903, -2.624844, 0.8823529, 1, 0, 1,
-0.8957558, 0.06663322, -3.690499, 0.8784314, 1, 0, 1,
-0.8949977, 0.05351764, -1.690256, 0.8705882, 1, 0, 1,
-0.8926821, 1.506247, -0.214061, 0.8666667, 1, 0, 1,
-0.8922014, -0.09710272, -2.476551, 0.8588235, 1, 0, 1,
-0.8907032, 0.8337748, -1.459402, 0.854902, 1, 0, 1,
-0.8868301, -1.513904, -1.716449, 0.8470588, 1, 0, 1,
-0.8863073, 1.148066, 0.251427, 0.8431373, 1, 0, 1,
-0.8716338, -1.351849, -2.770347, 0.8352941, 1, 0, 1,
-0.8708563, 0.5822614, -1.501928, 0.8313726, 1, 0, 1,
-0.865706, 0.08742827, -0.488541, 0.8235294, 1, 0, 1,
-0.8623816, -2.016948, -1.416044, 0.8196079, 1, 0, 1,
-0.8622461, -0.4995294, -1.441795, 0.8117647, 1, 0, 1,
-0.8524946, -1.281909, -2.405003, 0.8078431, 1, 0, 1,
-0.8482283, -0.4734387, -2.475937, 0.8, 1, 0, 1,
-0.8421417, -0.8523386, -2.410433, 0.7921569, 1, 0, 1,
-0.8383688, -1.239883, -1.732194, 0.7882353, 1, 0, 1,
-0.8361313, -0.5899703, -2.949671, 0.7803922, 1, 0, 1,
-0.8332015, 0.5544732, 0.4882333, 0.7764706, 1, 0, 1,
-0.833044, -0.4773872, -1.745681, 0.7686275, 1, 0, 1,
-0.8324625, -0.42556, -2.409113, 0.7647059, 1, 0, 1,
-0.8297418, -0.2576213, -2.07392, 0.7568628, 1, 0, 1,
-0.8266343, 0.4801303, 0.5274948, 0.7529412, 1, 0, 1,
-0.8147541, 0.06593902, 0.2277271, 0.7450981, 1, 0, 1,
-0.8142081, -0.390403, -0.6820328, 0.7411765, 1, 0, 1,
-0.8088252, 0.6048671, -0.01904479, 0.7333333, 1, 0, 1,
-0.7948187, 0.3066055, -2.49153, 0.7294118, 1, 0, 1,
-0.7907721, 0.3388443, -0.5858165, 0.7215686, 1, 0, 1,
-0.7903037, 0.642255, -1.099124, 0.7176471, 1, 0, 1,
-0.790279, 2.445456, 0.8507568, 0.7098039, 1, 0, 1,
-0.7841838, 0.1326995, -3.01279, 0.7058824, 1, 0, 1,
-0.7825421, -1.512341, -1.326012, 0.6980392, 1, 0, 1,
-0.7802923, -0.4396802, -2.572051, 0.6901961, 1, 0, 1,
-0.7764294, 0.6909453, -0.758426, 0.6862745, 1, 0, 1,
-0.7700416, 1.70442, -0.709822, 0.6784314, 1, 0, 1,
-0.7635194, -0.64557, -3.344191, 0.6745098, 1, 0, 1,
-0.7616968, 0.009173906, -1.266533, 0.6666667, 1, 0, 1,
-0.7587326, 0.2913967, 0.4971839, 0.6627451, 1, 0, 1,
-0.7529687, 0.4319684, -0.9851944, 0.654902, 1, 0, 1,
-0.7522131, 0.6596677, 0.4534137, 0.6509804, 1, 0, 1,
-0.750652, 0.715655, -2.051625, 0.6431373, 1, 0, 1,
-0.7440359, 0.4349391, -1.256868, 0.6392157, 1, 0, 1,
-0.742286, 1.115274, -2.196383, 0.6313726, 1, 0, 1,
-0.7351475, 0.2911887, -0.002356927, 0.627451, 1, 0, 1,
-0.7325647, -0.8731385, -2.306142, 0.6196079, 1, 0, 1,
-0.7299277, 0.6149271, -0.1254971, 0.6156863, 1, 0, 1,
-0.7274729, -1.057533, -3.705349, 0.6078432, 1, 0, 1,
-0.727451, 0.4050742, -2.764777, 0.6039216, 1, 0, 1,
-0.7263544, 0.6946379, -1.06583, 0.5960785, 1, 0, 1,
-0.7262337, -0.5382032, -2.823948, 0.5882353, 1, 0, 1,
-0.7230648, -0.7858674, -2.213043, 0.5843138, 1, 0, 1,
-0.72201, 0.5701255, -1.88018, 0.5764706, 1, 0, 1,
-0.720924, 1.933356, -0.3588115, 0.572549, 1, 0, 1,
-0.7169557, -1.110743, -0.3592415, 0.5647059, 1, 0, 1,
-0.7108916, -0.9986797, -3.517823, 0.5607843, 1, 0, 1,
-0.7079371, 0.8204494, -1.170808, 0.5529412, 1, 0, 1,
-0.7021793, 1.373159, 0.6695337, 0.5490196, 1, 0, 1,
-0.7018877, -0.7672956, -4.288529, 0.5411765, 1, 0, 1,
-0.6970553, 0.858219, 0.9447942, 0.5372549, 1, 0, 1,
-0.6970108, -1.063035, -2.43508, 0.5294118, 1, 0, 1,
-0.6967024, -0.5570897, -0.361051, 0.5254902, 1, 0, 1,
-0.6868404, -0.7564529, -2.44725, 0.5176471, 1, 0, 1,
-0.6836225, -0.1576324, -3.347721, 0.5137255, 1, 0, 1,
-0.6802396, 0.4931593, -0.09751695, 0.5058824, 1, 0, 1,
-0.6784626, -0.1511808, -3.110969, 0.5019608, 1, 0, 1,
-0.65359, 0.2564563, -2.539103, 0.4941176, 1, 0, 1,
-0.6528842, -0.8379466, -1.690321, 0.4862745, 1, 0, 1,
-0.6506744, 0.2817582, -2.769623, 0.4823529, 1, 0, 1,
-0.6484313, 1.069667, -0.8457912, 0.4745098, 1, 0, 1,
-0.6455557, -0.4877165, -2.577321, 0.4705882, 1, 0, 1,
-0.6446225, -0.7201883, -2.433765, 0.4627451, 1, 0, 1,
-0.6414291, -0.2783779, -2.259283, 0.4588235, 1, 0, 1,
-0.6376108, -0.5258573, -2.624843, 0.4509804, 1, 0, 1,
-0.6247935, 0.1102048, -0.1608984, 0.4470588, 1, 0, 1,
-0.623989, 0.2477545, -3.245864, 0.4392157, 1, 0, 1,
-0.6236793, 0.8953325, -1.232778, 0.4352941, 1, 0, 1,
-0.6185058, -1.422215, -2.6209, 0.427451, 1, 0, 1,
-0.6175227, 0.5081569, -1.306052, 0.4235294, 1, 0, 1,
-0.6121607, -0.3776485, -2.296149, 0.4156863, 1, 0, 1,
-0.6112812, 1.104168, -2.248594, 0.4117647, 1, 0, 1,
-0.6091675, 1.020772, -2.919507, 0.4039216, 1, 0, 1,
-0.6028512, -0.8490863, -2.212523, 0.3960784, 1, 0, 1,
-0.6027927, 0.3222526, -1.137686, 0.3921569, 1, 0, 1,
-0.6008952, -0.4777377, -2.704384, 0.3843137, 1, 0, 1,
-0.5960202, 1.281035, -0.9554964, 0.3803922, 1, 0, 1,
-0.5932543, 0.4019141, -1.145925, 0.372549, 1, 0, 1,
-0.5928189, -2.337923, -2.660071, 0.3686275, 1, 0, 1,
-0.591822, -1.696977, -3.033355, 0.3607843, 1, 0, 1,
-0.5844357, -1.156587, -2.788368, 0.3568628, 1, 0, 1,
-0.5820057, -1.56561, -4.776943, 0.3490196, 1, 0, 1,
-0.5772657, 0.8052247, -2.226877, 0.345098, 1, 0, 1,
-0.5743365, -1.262715, -2.717851, 0.3372549, 1, 0, 1,
-0.5734478, -0.02739559, -0.4637235, 0.3333333, 1, 0, 1,
-0.5718885, -1.087075, -3.492249, 0.3254902, 1, 0, 1,
-0.5694423, 1.748264, -0.5642622, 0.3215686, 1, 0, 1,
-0.5656615, -1.228029, -1.845171, 0.3137255, 1, 0, 1,
-0.5649289, -2.315415, -0.9614291, 0.3098039, 1, 0, 1,
-0.5647935, 2.093267, -0.7042907, 0.3019608, 1, 0, 1,
-0.5639312, 0.448231, 0.2248934, 0.2941177, 1, 0, 1,
-0.5634454, -1.500794, -3.137952, 0.2901961, 1, 0, 1,
-0.5595086, -2.071675, -3.759532, 0.282353, 1, 0, 1,
-0.5495674, 0.004226883, -1.841731, 0.2784314, 1, 0, 1,
-0.5486529, 0.6509098, -0.09011409, 0.2705882, 1, 0, 1,
-0.5476661, 0.5829801, -0.4905454, 0.2666667, 1, 0, 1,
-0.542007, -0.890759, -2.536479, 0.2588235, 1, 0, 1,
-0.5406456, -0.2340812, -1.037682, 0.254902, 1, 0, 1,
-0.5397444, -0.3977489, -2.598348, 0.2470588, 1, 0, 1,
-0.5328739, -0.05594185, -1.548468, 0.2431373, 1, 0, 1,
-0.5314373, -0.6049765, -2.80471, 0.2352941, 1, 0, 1,
-0.5312352, 0.1464209, -0.2596466, 0.2313726, 1, 0, 1,
-0.5271739, -0.0620117, -1.111037, 0.2235294, 1, 0, 1,
-0.5264808, 0.8395122, 0.7999259, 0.2196078, 1, 0, 1,
-0.5225524, -1.012823, -1.092849, 0.2117647, 1, 0, 1,
-0.5221714, 1.345333, 0.8347679, 0.2078431, 1, 0, 1,
-0.5219508, 0.5050122, -0.4473916, 0.2, 1, 0, 1,
-0.52133, 0.8345627, -0.5907694, 0.1921569, 1, 0, 1,
-0.5206855, 1.327234, 0.779921, 0.1882353, 1, 0, 1,
-0.5158702, 1.930188, 0.0009372986, 0.1803922, 1, 0, 1,
-0.505954, -0.2728294, -2.465093, 0.1764706, 1, 0, 1,
-0.5053486, -1.67391, -3.30144, 0.1686275, 1, 0, 1,
-0.503713, -0.8864305, -0.7416123, 0.1647059, 1, 0, 1,
-0.4996163, -1.086496, -3.855494, 0.1568628, 1, 0, 1,
-0.4952543, -0.5649017, -1.151274, 0.1529412, 1, 0, 1,
-0.4945895, -0.1470095, -1.197993, 0.145098, 1, 0, 1,
-0.4909013, -0.6674297, -3.595214, 0.1411765, 1, 0, 1,
-0.4892921, 0.2589484, -1.300167, 0.1333333, 1, 0, 1,
-0.4880678, 0.3416959, 0.8830091, 0.1294118, 1, 0, 1,
-0.4863457, 0.9150729, -0.3103454, 0.1215686, 1, 0, 1,
-0.4813444, -0.2327476, -1.686271, 0.1176471, 1, 0, 1,
-0.4766223, 0.356332, -1.300493, 0.1098039, 1, 0, 1,
-0.4757046, 0.1396814, -2.540254, 0.1058824, 1, 0, 1,
-0.4729888, 0.2656384, -3.054729, 0.09803922, 1, 0, 1,
-0.4664815, -0.3760393, -2.744102, 0.09019608, 1, 0, 1,
-0.4606111, -0.4774774, -2.01062, 0.08627451, 1, 0, 1,
-0.4595419, -0.6459479, -2.031094, 0.07843138, 1, 0, 1,
-0.456071, -0.009749177, -0.08068997, 0.07450981, 1, 0, 1,
-0.4549947, -0.2395624, -2.885875, 0.06666667, 1, 0, 1,
-0.4525041, -0.1981801, -2.791467, 0.0627451, 1, 0, 1,
-0.4514977, -0.1315201, -2.01504, 0.05490196, 1, 0, 1,
-0.4505278, -3.186339, -3.487354, 0.05098039, 1, 0, 1,
-0.4450848, -1.76842, -2.835717, 0.04313726, 1, 0, 1,
-0.4450602, 0.1258289, -0.6140369, 0.03921569, 1, 0, 1,
-0.4340163, -1.716976, -2.485647, 0.03137255, 1, 0, 1,
-0.4321225, 1.493008, -1.109672, 0.02745098, 1, 0, 1,
-0.4309133, -0.5043681, -1.591825, 0.01960784, 1, 0, 1,
-0.4302023, -0.2705655, -2.807542, 0.01568628, 1, 0, 1,
-0.4224902, 0.8793411, 0.2390933, 0.007843138, 1, 0, 1,
-0.4204942, 0.0750982, -1.581462, 0.003921569, 1, 0, 1,
-0.4190992, 0.4986398, -1.527259, 0, 1, 0.003921569, 1,
-0.4108164, -1.601327, -2.831378, 0, 1, 0.01176471, 1,
-0.4088616, 0.695501, -0.07589757, 0, 1, 0.01568628, 1,
-0.4074685, -1.521477, -2.91986, 0, 1, 0.02352941, 1,
-0.406915, -0.2309115, -1.685216, 0, 1, 0.02745098, 1,
-0.4063668, -0.9721481, -3.713861, 0, 1, 0.03529412, 1,
-0.4057991, 1.204989, 0.3456946, 0, 1, 0.03921569, 1,
-0.3968092, -0.8086674, -1.115338, 0, 1, 0.04705882, 1,
-0.3935034, -1.318229, -0.9829639, 0, 1, 0.05098039, 1,
-0.3931766, -0.1906949, -2.767305, 0, 1, 0.05882353, 1,
-0.3924581, 0.324194, 0.5997674, 0, 1, 0.0627451, 1,
-0.3906071, -0.6400088, -2.139635, 0, 1, 0.07058824, 1,
-0.3864394, 0.7085419, 0.2593406, 0, 1, 0.07450981, 1,
-0.3838553, -0.8363985, -2.736723, 0, 1, 0.08235294, 1,
-0.3834118, -1.632639, -3.862002, 0, 1, 0.08627451, 1,
-0.3782049, -0.4285468, -2.814653, 0, 1, 0.09411765, 1,
-0.3756569, 0.4725645, -0.4503888, 0, 1, 0.1019608, 1,
-0.3751718, 1.25172, -1.031553, 0, 1, 0.1058824, 1,
-0.3748092, -0.6155393, -3.135866, 0, 1, 0.1137255, 1,
-0.3743888, 0.3070531, -0.7047291, 0, 1, 0.1176471, 1,
-0.3685679, 0.1719157, -0.8902859, 0, 1, 0.1254902, 1,
-0.3683927, 1.925585, 0.8257912, 0, 1, 0.1294118, 1,
-0.362489, -0.1935325, -0.7588191, 0, 1, 0.1372549, 1,
-0.3521993, 1.522963, -0.809206, 0, 1, 0.1411765, 1,
-0.3511832, -0.7049281, -2.429151, 0, 1, 0.1490196, 1,
-0.3367052, 0.2413108, -1.63538, 0, 1, 0.1529412, 1,
-0.335229, -2.434163, -2.148065, 0, 1, 0.1607843, 1,
-0.3301124, -1.20017, -2.267763, 0, 1, 0.1647059, 1,
-0.3297705, 0.3951801, 0.536741, 0, 1, 0.172549, 1,
-0.3283512, 1.132768, -0.4213974, 0, 1, 0.1764706, 1,
-0.3258377, 0.2041523, -2.415232, 0, 1, 0.1843137, 1,
-0.3257871, -0.5329179, -3.308621, 0, 1, 0.1882353, 1,
-0.325405, -0.38603, -1.313441, 0, 1, 0.1960784, 1,
-0.3250038, -0.4512847, -3.022579, 0, 1, 0.2039216, 1,
-0.3249271, 0.483918, -1.203418, 0, 1, 0.2078431, 1,
-0.3180135, -0.1166659, -0.9397161, 0, 1, 0.2156863, 1,
-0.3097529, -0.8490626, -4.817679, 0, 1, 0.2196078, 1,
-0.3048304, 0.3985977, 1.155911, 0, 1, 0.227451, 1,
-0.3037087, -0.9978728, -4.184924, 0, 1, 0.2313726, 1,
-0.3029249, 1.063895, 1.047772, 0, 1, 0.2392157, 1,
-0.3023059, -0.701206, -1.465689, 0, 1, 0.2431373, 1,
-0.3008981, -0.739139, -2.000533, 0, 1, 0.2509804, 1,
-0.3003815, -1.049991, -3.343381, 0, 1, 0.254902, 1,
-0.2998983, 0.06452816, -0.9581529, 0, 1, 0.2627451, 1,
-0.299532, 1.516175, 1.023885, 0, 1, 0.2666667, 1,
-0.2973249, -0.3748416, -2.340932, 0, 1, 0.2745098, 1,
-0.2944511, 0.242539, -0.1361716, 0, 1, 0.2784314, 1,
-0.2919619, -0.7377472, -3.157562, 0, 1, 0.2862745, 1,
-0.2892388, 0.04237889, -1.850681, 0, 1, 0.2901961, 1,
-0.2871037, -0.9377018, -3.175465, 0, 1, 0.2980392, 1,
-0.283925, 0.7982666, -0.8379924, 0, 1, 0.3058824, 1,
-0.2810215, 0.5729728, 0.4332405, 0, 1, 0.3098039, 1,
-0.275739, 2.170213, -0.1560605, 0, 1, 0.3176471, 1,
-0.2727027, -0.2588836, -2.270649, 0, 1, 0.3215686, 1,
-0.2719838, -1.069404, -3.877547, 0, 1, 0.3294118, 1,
-0.2713279, -0.01297974, -2.190249, 0, 1, 0.3333333, 1,
-0.2703873, 0.5433181, 1.374545, 0, 1, 0.3411765, 1,
-0.2628614, 0.3789089, -0.1587694, 0, 1, 0.345098, 1,
-0.2616268, 1.794084, 0.09393171, 0, 1, 0.3529412, 1,
-0.2609922, 0.3880739, -0.1102395, 0, 1, 0.3568628, 1,
-0.2553557, -0.9319894, -3.754064, 0, 1, 0.3647059, 1,
-0.2488931, 0.3865506, -0.6419828, 0, 1, 0.3686275, 1,
-0.247252, -1.25073, -3.110149, 0, 1, 0.3764706, 1,
-0.2429397, 0.7644302, 2.910995, 0, 1, 0.3803922, 1,
-0.2371331, 1.647918, 0.644175, 0, 1, 0.3882353, 1,
-0.234044, -1.220211, -1.466844, 0, 1, 0.3921569, 1,
-0.2296521, -1.674957, -2.49054, 0, 1, 0.4, 1,
-0.2226363, -1.528774, -3.338073, 0, 1, 0.4078431, 1,
-0.2172652, -0.3797232, -2.864491, 0, 1, 0.4117647, 1,
-0.2164581, 0.8347508, 0.54803, 0, 1, 0.4196078, 1,
-0.2148633, 0.9681857, -1.007906, 0, 1, 0.4235294, 1,
-0.2136627, -1.657296, -5.147218, 0, 1, 0.4313726, 1,
-0.2125693, -1.045636, -2.578785, 0, 1, 0.4352941, 1,
-0.2108947, -0.9738895, -3.110116, 0, 1, 0.4431373, 1,
-0.2089761, -0.7621754, -3.143185, 0, 1, 0.4470588, 1,
-0.2072695, 0.4762696, -0.3074798, 0, 1, 0.454902, 1,
-0.2003533, -1.587263, -2.402544, 0, 1, 0.4588235, 1,
-0.2002663, 0.4157873, -0.8628998, 0, 1, 0.4666667, 1,
-0.1993601, -2.540372, -2.587557, 0, 1, 0.4705882, 1,
-0.1976332, 0.38118, -1.873571, 0, 1, 0.4784314, 1,
-0.1871043, 2.749751, 0.8178446, 0, 1, 0.4823529, 1,
-0.1854467, -1.350084, -2.551672, 0, 1, 0.4901961, 1,
-0.1831905, -0.09535455, -3.639923, 0, 1, 0.4941176, 1,
-0.1806191, 1.837608, -1.503868, 0, 1, 0.5019608, 1,
-0.1738439, -0.9033985, -3.223113, 0, 1, 0.509804, 1,
-0.1735922, 0.007142244, -1.352881, 0, 1, 0.5137255, 1,
-0.1699803, 0.465202, 1.158236, 0, 1, 0.5215687, 1,
-0.1667311, 0.6926132, -2.627363, 0, 1, 0.5254902, 1,
-0.1652401, -0.3680691, -2.928814, 0, 1, 0.5333334, 1,
-0.1624099, 0.9326093, 1.188885, 0, 1, 0.5372549, 1,
-0.1488485, -0.4094465, -4.876529, 0, 1, 0.5450981, 1,
-0.1482129, -0.1423038, -2.411135, 0, 1, 0.5490196, 1,
-0.1476444, -0.2707023, -3.334496, 0, 1, 0.5568628, 1,
-0.1438692, 0.6171969, 0.08042086, 0, 1, 0.5607843, 1,
-0.134156, -1.118161, -4.15144, 0, 1, 0.5686275, 1,
-0.1339029, 1.363803, 0.326961, 0, 1, 0.572549, 1,
-0.1276877, 0.142791, -0.007121877, 0, 1, 0.5803922, 1,
-0.1269764, -0.1130256, -1.835554, 0, 1, 0.5843138, 1,
-0.1259656, 0.1211925, -1.691355, 0, 1, 0.5921569, 1,
-0.1259571, -0.7119224, -5.128984, 0, 1, 0.5960785, 1,
-0.1244197, -0.114113, -2.268457, 0, 1, 0.6039216, 1,
-0.1232116, -0.7539555, -3.616004, 0, 1, 0.6117647, 1,
-0.1201564, -0.2051036, -3.13187, 0, 1, 0.6156863, 1,
-0.1198488, 0.9133922, 0.1108056, 0, 1, 0.6235294, 1,
-0.1181432, -0.2316004, -3.289504, 0, 1, 0.627451, 1,
-0.1177387, 0.004356528, -0.279122, 0, 1, 0.6352941, 1,
-0.1164882, -1.115657, -2.861383, 0, 1, 0.6392157, 1,
-0.1110983, -0.07117119, -2.127617, 0, 1, 0.6470588, 1,
-0.1101961, -0.9696814, -3.324965, 0, 1, 0.6509804, 1,
-0.109089, 1.359523, 1.731111, 0, 1, 0.6588235, 1,
-0.1047812, -0.3602575, -2.421422, 0, 1, 0.6627451, 1,
-0.1036484, -0.6981165, -2.394114, 0, 1, 0.6705883, 1,
-0.1026536, 0.8870322, -1.896174, 0, 1, 0.6745098, 1,
-0.09402487, 1.759735, 1.497914, 0, 1, 0.682353, 1,
-0.09399364, 1.135387, -1.355326, 0, 1, 0.6862745, 1,
-0.09123506, 0.4542893, -0.2691274, 0, 1, 0.6941177, 1,
-0.09103223, -0.1621261, -3.759649, 0, 1, 0.7019608, 1,
-0.09026795, -1.785915, -4.357256, 0, 1, 0.7058824, 1,
-0.08928041, 0.7083061, 0.325478, 0, 1, 0.7137255, 1,
-0.08780152, -1.186321, -2.479032, 0, 1, 0.7176471, 1,
-0.08532241, 1.183418, 1.677738, 0, 1, 0.7254902, 1,
-0.08309198, 1.690717, -0.4646166, 0, 1, 0.7294118, 1,
-0.07879894, 0.281004, -0.2817041, 0, 1, 0.7372549, 1,
-0.07787887, 0.3594789, -0.3749824, 0, 1, 0.7411765, 1,
-0.07439777, -1.125918, -4.889012, 0, 1, 0.7490196, 1,
-0.07322562, 0.6431953, -1.635177, 0, 1, 0.7529412, 1,
-0.07072081, -1.332823, -1.578641, 0, 1, 0.7607843, 1,
-0.06727481, 0.3884066, 0.2383309, 0, 1, 0.7647059, 1,
-0.06684905, -1.09809, -4.190463, 0, 1, 0.772549, 1,
-0.06388845, 0.3063349, -0.9125684, 0, 1, 0.7764706, 1,
-0.06303883, -0.2394985, -4.595995, 0, 1, 0.7843137, 1,
-0.06301324, -0.6184127, -3.281058, 0, 1, 0.7882353, 1,
-0.06159365, 1.665079, -0.3812335, 0, 1, 0.7960784, 1,
-0.06142294, -0.8225685, -4.479017, 0, 1, 0.8039216, 1,
-0.05717567, 0.8919684, 1.939834, 0, 1, 0.8078431, 1,
-0.05511343, 0.731797, 1.009687, 0, 1, 0.8156863, 1,
-0.05068548, 0.865976, 0.1726145, 0, 1, 0.8196079, 1,
-0.04416134, 0.1649078, 0.1793153, 0, 1, 0.827451, 1,
-0.04378703, -1.445281, -3.755453, 0, 1, 0.8313726, 1,
-0.04324939, -1.678959, -4.271369, 0, 1, 0.8392157, 1,
-0.04212458, -1.159418, -3.091022, 0, 1, 0.8431373, 1,
-0.04094451, 1.822241, 0.05685267, 0, 1, 0.8509804, 1,
-0.0406446, -0.7908197, -4.546333, 0, 1, 0.854902, 1,
-0.04058559, 0.5517557, 0.4265151, 0, 1, 0.8627451, 1,
-0.03990167, 1.159518, -0.01935906, 0, 1, 0.8666667, 1,
-0.03986287, 0.9987398, 0.5354664, 0, 1, 0.8745098, 1,
-0.03915485, 1.282915, 0.09183387, 0, 1, 0.8784314, 1,
-0.03787986, 0.810608, 0.3973605, 0, 1, 0.8862745, 1,
-0.0378341, -0.7248991, -0.8966588, 0, 1, 0.8901961, 1,
-0.03003695, 0.9407675, 0.5812707, 0, 1, 0.8980392, 1,
-0.02831812, -0.71983, -3.922346, 0, 1, 0.9058824, 1,
-0.02746929, -1.722373, -2.698388, 0, 1, 0.9098039, 1,
-0.02723965, -0.9303589, -2.441388, 0, 1, 0.9176471, 1,
-0.02663444, -0.2291026, -3.384849, 0, 1, 0.9215686, 1,
-0.0260392, -1.202657, -3.128857, 0, 1, 0.9294118, 1,
-0.02513614, -0.3639379, -3.509765, 0, 1, 0.9333333, 1,
-0.02353546, 0.2962383, -1.670618, 0, 1, 0.9411765, 1,
-0.0231293, 0.7309697, -0.5455306, 0, 1, 0.945098, 1,
-0.01708186, 1.579412, 1.160235, 0, 1, 0.9529412, 1,
-0.01310935, 0.1856987, -1.425769, 0, 1, 0.9568627, 1,
-0.01174625, -3.4543, -2.708458, 0, 1, 0.9647059, 1,
-0.01120543, 0.08070856, 0.653396, 0, 1, 0.9686275, 1,
-0.01087486, 1.343608, 1.1275, 0, 1, 0.9764706, 1,
-0.01011992, -0.758331, -4.384548, 0, 1, 0.9803922, 1,
-0.009853152, 0.5160667, 1.600664, 0, 1, 0.9882353, 1,
-0.007068716, -0.9708613, -3.249337, 0, 1, 0.9921569, 1,
-0.00301599, 1.355247, -1.523006, 0, 1, 1, 1,
0.008083101, -0.5230112, 3.539768, 0, 0.9921569, 1, 1,
0.01162886, -1.071639, 3.536537, 0, 0.9882353, 1, 1,
0.01431981, 1.446142, 0.07083897, 0, 0.9803922, 1, 1,
0.01900665, -0.02269994, 3.785083, 0, 0.9764706, 1, 1,
0.01947449, -0.5770296, 3.495732, 0, 0.9686275, 1, 1,
0.02030544, -1.089426, 2.481734, 0, 0.9647059, 1, 1,
0.02493876, -0.9753155, 2.688968, 0, 0.9568627, 1, 1,
0.02583056, 0.7617584, -1.574372, 0, 0.9529412, 1, 1,
0.02651115, 0.8764285, -0.2408991, 0, 0.945098, 1, 1,
0.02808868, -0.2026555, 2.170739, 0, 0.9411765, 1, 1,
0.03131685, -0.8325791, 3.724234, 0, 0.9333333, 1, 1,
0.03554156, 0.5555603, 0.1211496, 0, 0.9294118, 1, 1,
0.03564106, 1.436459, -1.23263, 0, 0.9215686, 1, 1,
0.03694386, -0.8846325, 3.040861, 0, 0.9176471, 1, 1,
0.03816009, -1.145661, 2.714477, 0, 0.9098039, 1, 1,
0.03898363, -1.47868, 1.903189, 0, 0.9058824, 1, 1,
0.04014475, -0.7710401, 2.295174, 0, 0.8980392, 1, 1,
0.04196692, -0.099511, 2.762014, 0, 0.8901961, 1, 1,
0.04277386, -0.2857247, 3.615841, 0, 0.8862745, 1, 1,
0.04320549, -0.2803169, 3.261749, 0, 0.8784314, 1, 1,
0.04528444, -0.9980498, 2.068977, 0, 0.8745098, 1, 1,
0.04738461, 0.5613014, -1.327457, 0, 0.8666667, 1, 1,
0.05368211, -0.3021569, 2.473025, 0, 0.8627451, 1, 1,
0.05432456, 0.1914616, 0.5154906, 0, 0.854902, 1, 1,
0.05578306, 0.08872477, 1.668322, 0, 0.8509804, 1, 1,
0.05697876, -0.7607415, 2.853899, 0, 0.8431373, 1, 1,
0.05722073, 0.3609599, 1.165017, 0, 0.8392157, 1, 1,
0.0595589, -0.8040783, 4.474208, 0, 0.8313726, 1, 1,
0.06266876, 0.09189294, -0.9769683, 0, 0.827451, 1, 1,
0.06566814, -0.4022965, 3.909226, 0, 0.8196079, 1, 1,
0.06634432, 1.296724, 1.238195, 0, 0.8156863, 1, 1,
0.06877608, 1.705604, 0.9349014, 0, 0.8078431, 1, 1,
0.06965339, -1.506731, 1.675186, 0, 0.8039216, 1, 1,
0.07074143, -0.3820964, 3.617472, 0, 0.7960784, 1, 1,
0.07258263, 0.6586714, 1.353551, 0, 0.7882353, 1, 1,
0.07576822, 0.2678171, 0.6378105, 0, 0.7843137, 1, 1,
0.07645487, -0.948455, 2.505949, 0, 0.7764706, 1, 1,
0.07670374, 1.550858, -0.2865422, 0, 0.772549, 1, 1,
0.07818584, -1.140494, 3.300707, 0, 0.7647059, 1, 1,
0.0786001, 0.7527986, 0.9309413, 0, 0.7607843, 1, 1,
0.07983612, -0.0657329, 4.498013, 0, 0.7529412, 1, 1,
0.0825131, 0.3400089, 0.6435205, 0, 0.7490196, 1, 1,
0.08689429, 0.8666353, 0.8818832, 0, 0.7411765, 1, 1,
0.0873076, -0.3548628, 2.749718, 0, 0.7372549, 1, 1,
0.09287221, -0.4297132, 3.579197, 0, 0.7294118, 1, 1,
0.09531415, -0.1754224, 3.245089, 0, 0.7254902, 1, 1,
0.09809333, -0.2719505, 2.82765, 0, 0.7176471, 1, 1,
0.09957317, 0.5401218, 0.1404335, 0, 0.7137255, 1, 1,
0.09978617, 0.0448666, 0.9957505, 0, 0.7058824, 1, 1,
0.1026813, 0.8847714, 0.4839161, 0, 0.6980392, 1, 1,
0.1070181, 0.1297187, -0.206347, 0, 0.6941177, 1, 1,
0.1085271, -1.406297, 1.888953, 0, 0.6862745, 1, 1,
0.109812, 0.8213544, 0.8214958, 0, 0.682353, 1, 1,
0.1105558, 0.5482685, -0.09423758, 0, 0.6745098, 1, 1,
0.1106263, -1.560872, 1.974707, 0, 0.6705883, 1, 1,
0.1116571, -0.04303247, 3.411889, 0, 0.6627451, 1, 1,
0.1118137, 1.267639, -0.7583903, 0, 0.6588235, 1, 1,
0.1147648, -0.08007236, 1.29747, 0, 0.6509804, 1, 1,
0.1194755, 0.8584186, -0.1009181, 0, 0.6470588, 1, 1,
0.1226745, -0.9913927, 3.56795, 0, 0.6392157, 1, 1,
0.1241543, -1.260837, 1.840313, 0, 0.6352941, 1, 1,
0.1267316, 0.5073948, 0.6582863, 0, 0.627451, 1, 1,
0.1322382, 1.11874, 0.172882, 0, 0.6235294, 1, 1,
0.1325428, 0.2339468, 1.652504, 0, 0.6156863, 1, 1,
0.133131, -1.906617, 2.514084, 0, 0.6117647, 1, 1,
0.1405848, -0.3228583, 1.958859, 0, 0.6039216, 1, 1,
0.1421166, 0.209142, 1.557337, 0, 0.5960785, 1, 1,
0.143916, -0.2846673, 2.006211, 0, 0.5921569, 1, 1,
0.1442017, 0.2250232, -0.501798, 0, 0.5843138, 1, 1,
0.1474492, 0.06981212, 0.7895115, 0, 0.5803922, 1, 1,
0.1504373, 1.34361, -1.162281, 0, 0.572549, 1, 1,
0.1507387, -1.292413, 3.059018, 0, 0.5686275, 1, 1,
0.1595356, -0.09439011, 1.712176, 0, 0.5607843, 1, 1,
0.1627766, 0.6623423, -0.1951054, 0, 0.5568628, 1, 1,
0.1629193, -0.1655204, 2.688431, 0, 0.5490196, 1, 1,
0.1650165, -0.8385442, 2.900719, 0, 0.5450981, 1, 1,
0.1667158, 2.162674, 0.4762875, 0, 0.5372549, 1, 1,
0.1678604, -1.076393, 3.480634, 0, 0.5333334, 1, 1,
0.1745168, 0.4602749, 0.8883274, 0, 0.5254902, 1, 1,
0.1753884, -0.6258031, 1.706425, 0, 0.5215687, 1, 1,
0.1802933, -0.175254, 1.501298, 0, 0.5137255, 1, 1,
0.1862902, 0.08828288, 0.3881358, 0, 0.509804, 1, 1,
0.1867685, 1.179947, -0.3004219, 0, 0.5019608, 1, 1,
0.1877086, -1.651358, 3.68556, 0, 0.4941176, 1, 1,
0.1942445, 1.102086, 1.794467, 0, 0.4901961, 1, 1,
0.1960957, -0.9084119, 2.638799, 0, 0.4823529, 1, 1,
0.1969389, -0.3956661, 2.086156, 0, 0.4784314, 1, 1,
0.2004965, -0.8669742, 3.908392, 0, 0.4705882, 1, 1,
0.200928, -0.2992978, 3.085885, 0, 0.4666667, 1, 1,
0.2010975, 0.2869108, 2.119151, 0, 0.4588235, 1, 1,
0.2045486, -0.567384, 2.240713, 0, 0.454902, 1, 1,
0.2090485, 1.08286, -1.075175, 0, 0.4470588, 1, 1,
0.2197589, -0.7604339, 0.9907425, 0, 0.4431373, 1, 1,
0.2200735, 0.1886875, 1.081327, 0, 0.4352941, 1, 1,
0.2201276, 0.3067136, -0.3265395, 0, 0.4313726, 1, 1,
0.2204195, -1.271057, 2.273538, 0, 0.4235294, 1, 1,
0.2230785, -2.012913, 2.360448, 0, 0.4196078, 1, 1,
0.2282548, -0.77746, 3.261559, 0, 0.4117647, 1, 1,
0.2285063, 2.069048, 0.07507305, 0, 0.4078431, 1, 1,
0.2285088, 0.5274526, -1.543707, 0, 0.4, 1, 1,
0.2335767, -0.3871705, 3.516052, 0, 0.3921569, 1, 1,
0.236687, -1.436802, 3.143588, 0, 0.3882353, 1, 1,
0.2371609, -0.1574491, 2.110919, 0, 0.3803922, 1, 1,
0.2375514, 1.025072, -0.1398491, 0, 0.3764706, 1, 1,
0.2403438, -0.3700814, 4.191567, 0, 0.3686275, 1, 1,
0.2419909, 0.1522168, 2.070877, 0, 0.3647059, 1, 1,
0.2421166, -2.129976, 1.395403, 0, 0.3568628, 1, 1,
0.243189, -0.07126339, 1.700507, 0, 0.3529412, 1, 1,
0.2445003, -0.8301423, 3.347288, 0, 0.345098, 1, 1,
0.245807, 0.9866115, 2.79052, 0, 0.3411765, 1, 1,
0.2483108, -0.5694408, 4.715824, 0, 0.3333333, 1, 1,
0.2489117, 1.184055, -0.04604067, 0, 0.3294118, 1, 1,
0.2517447, 0.9739638, 0.6080915, 0, 0.3215686, 1, 1,
0.2547217, 0.3184306, 1.834165, 0, 0.3176471, 1, 1,
0.2571218, 1.126683, 1.334058, 0, 0.3098039, 1, 1,
0.25789, 0.2525795, 1.024045, 0, 0.3058824, 1, 1,
0.2581517, -0.09184477, 1.829417, 0, 0.2980392, 1, 1,
0.2608197, 1.287687, 0.882054, 0, 0.2901961, 1, 1,
0.2679236, 0.1894366, 0.930041, 0, 0.2862745, 1, 1,
0.2682832, -0.7295575, 3.202002, 0, 0.2784314, 1, 1,
0.2691007, 0.8884754, 0.8395246, 0, 0.2745098, 1, 1,
0.2748376, 2.673514, 0.3700711, 0, 0.2666667, 1, 1,
0.2921432, -0.6103194, 5.280225, 0, 0.2627451, 1, 1,
0.296823, -0.5277051, 2.983369, 0, 0.254902, 1, 1,
0.3090793, 0.6063324, 1.367217, 0, 0.2509804, 1, 1,
0.3104, -1.921912, 2.03775, 0, 0.2431373, 1, 1,
0.3110518, -0.4462, 2.991318, 0, 0.2392157, 1, 1,
0.3111376, 1.008574, -0.08449978, 0, 0.2313726, 1, 1,
0.3112547, 0.9213462, 0.9326005, 0, 0.227451, 1, 1,
0.3135017, -1.08702, 2.987567, 0, 0.2196078, 1, 1,
0.3150424, 1.384967, -0.8838571, 0, 0.2156863, 1, 1,
0.3170181, -1.188351, 2.131337, 0, 0.2078431, 1, 1,
0.319011, 2.338756, 0.436589, 0, 0.2039216, 1, 1,
0.3197098, 0.0588145, 1.622568, 0, 0.1960784, 1, 1,
0.3230402, 1.271058, 1.693069, 0, 0.1882353, 1, 1,
0.3257245, 0.9055609, 1.754487, 0, 0.1843137, 1, 1,
0.3262915, 0.8616779, 0.7461091, 0, 0.1764706, 1, 1,
0.3297888, -0.9504588, 1.85806, 0, 0.172549, 1, 1,
0.3358094, 0.2579863, -0.770991, 0, 0.1647059, 1, 1,
0.3447849, -0.1702607, 2.000289, 0, 0.1607843, 1, 1,
0.3455548, -0.9001214, 3.631474, 0, 0.1529412, 1, 1,
0.3467061, -0.5851698, 2.340077, 0, 0.1490196, 1, 1,
0.3467094, -1.310325, 1.970095, 0, 0.1411765, 1, 1,
0.3477302, 0.3441207, -1.370497, 0, 0.1372549, 1, 1,
0.3496044, -0.8643116, 4.238479, 0, 0.1294118, 1, 1,
0.3602577, -0.7408181, 4.09836, 0, 0.1254902, 1, 1,
0.3607732, -0.7921167, 3.388532, 0, 0.1176471, 1, 1,
0.3615153, 0.752667, -1.201761, 0, 0.1137255, 1, 1,
0.3634084, -0.2250413, 2.806573, 0, 0.1058824, 1, 1,
0.3649246, -0.7751369, 3.76524, 0, 0.09803922, 1, 1,
0.3650894, 0.5831174, 0.5828392, 0, 0.09411765, 1, 1,
0.3676517, -1.677143, 2.842026, 0, 0.08627451, 1, 1,
0.3732206, 0.9182509, -0.4365118, 0, 0.08235294, 1, 1,
0.3803045, 0.04377265, 0.8761393, 0, 0.07450981, 1, 1,
0.3807546, -0.7706538, 3.48753, 0, 0.07058824, 1, 1,
0.3823013, 0.3263271, -0.1021649, 0, 0.0627451, 1, 1,
0.3825566, -1.832413, 2.936935, 0, 0.05882353, 1, 1,
0.3892232, -0.08738214, 1.547907, 0, 0.05098039, 1, 1,
0.3901182, -1.337003, 3.782322, 0, 0.04705882, 1, 1,
0.3934152, 1.321791, -1.151264, 0, 0.03921569, 1, 1,
0.3940003, 0.8694177, 0.1180241, 0, 0.03529412, 1, 1,
0.3983012, -0.03620053, 1.348771, 0, 0.02745098, 1, 1,
0.3985293, 1.88771, 1.03161, 0, 0.02352941, 1, 1,
0.4006961, 0.8720127, 0.4559753, 0, 0.01568628, 1, 1,
0.4041642, -0.4016682, 3.92352, 0, 0.01176471, 1, 1,
0.4063534, -0.4324791, 2.698929, 0, 0.003921569, 1, 1,
0.4111173, 1.522698, -1.134043, 0.003921569, 0, 1, 1,
0.4113291, -0.4181459, 1.898752, 0.007843138, 0, 1, 1,
0.4124501, -0.2455615, 3.253971, 0.01568628, 0, 1, 1,
0.4134365, -1.140888, 1.087388, 0.01960784, 0, 1, 1,
0.4235047, -0.5362796, 3.371676, 0.02745098, 0, 1, 1,
0.425509, -1.001521, 3.057007, 0.03137255, 0, 1, 1,
0.4274508, -0.4399917, 1.538149, 0.03921569, 0, 1, 1,
0.4286259, 0.7553502, 2.677565, 0.04313726, 0, 1, 1,
0.4288103, -0.3309842, 3.730465, 0.05098039, 0, 1, 1,
0.4357145, 1.788137, 1.183175, 0.05490196, 0, 1, 1,
0.4402679, -0.151655, 0.8476137, 0.0627451, 0, 1, 1,
0.4444321, -0.01792518, 1.815164, 0.06666667, 0, 1, 1,
0.4482732, -0.3627222, 1.385653, 0.07450981, 0, 1, 1,
0.4517489, -0.290145, 1.145753, 0.07843138, 0, 1, 1,
0.4588668, -1.047938, 3.841409, 0.08627451, 0, 1, 1,
0.459933, -0.4786228, 3.746082, 0.09019608, 0, 1, 1,
0.4639636, -0.3331391, 2.58226, 0.09803922, 0, 1, 1,
0.4643027, -0.8123743, 3.071059, 0.1058824, 0, 1, 1,
0.4670311, 0.07460858, 0.9988452, 0.1098039, 0, 1, 1,
0.469456, 1.100977, 0.3924062, 0.1176471, 0, 1, 1,
0.4726647, -1.412832, 3.055209, 0.1215686, 0, 1, 1,
0.4824376, -0.5923217, 2.934443, 0.1294118, 0, 1, 1,
0.4850482, 2.724239, 0.1016934, 0.1333333, 0, 1, 1,
0.4883927, -0.1971431, 1.679551, 0.1411765, 0, 1, 1,
0.4939929, -1.377823, 2.697407, 0.145098, 0, 1, 1,
0.4942924, 1.085613, 1.292697, 0.1529412, 0, 1, 1,
0.4992291, -0.7461192, 2.468481, 0.1568628, 0, 1, 1,
0.5020921, -0.65282, 3.391391, 0.1647059, 0, 1, 1,
0.5083316, 0.1507894, 1.780373, 0.1686275, 0, 1, 1,
0.5088192, 1.2681, 0.01094963, 0.1764706, 0, 1, 1,
0.5097447, -1.540678, 2.061748, 0.1803922, 0, 1, 1,
0.5101742, -0.9162022, 3.626921, 0.1882353, 0, 1, 1,
0.5133776, 0.3294692, 0.0954145, 0.1921569, 0, 1, 1,
0.5149611, 0.3801612, 2.05825, 0.2, 0, 1, 1,
0.5157174, 1.065643, 0.009675772, 0.2078431, 0, 1, 1,
0.5222737, -0.5976231, 2.322929, 0.2117647, 0, 1, 1,
0.5234947, 0.4608742, -1.124518, 0.2196078, 0, 1, 1,
0.5244063, 0.2779889, 1.994372, 0.2235294, 0, 1, 1,
0.5261194, -0.6536927, 3.383286, 0.2313726, 0, 1, 1,
0.5274305, -1.806602, 3.161444, 0.2352941, 0, 1, 1,
0.5294824, 0.3123291, 0.8460752, 0.2431373, 0, 1, 1,
0.5295134, 1.739363, -0.1959837, 0.2470588, 0, 1, 1,
0.537835, 0.4685862, -0.4665505, 0.254902, 0, 1, 1,
0.5383636, 0.4549596, -0.9235666, 0.2588235, 0, 1, 1,
0.539307, -0.9547266, 2.281094, 0.2666667, 0, 1, 1,
0.5401406, -0.2393065, 2.695026, 0.2705882, 0, 1, 1,
0.5423976, -0.6574984, 3.902596, 0.2784314, 0, 1, 1,
0.5430811, 2.301239, 0.6852382, 0.282353, 0, 1, 1,
0.5462747, -1.974056, 3.021692, 0.2901961, 0, 1, 1,
0.5469385, 1.575449, -0.003517328, 0.2941177, 0, 1, 1,
0.5551716, -0.9774187, 2.187539, 0.3019608, 0, 1, 1,
0.563867, 0.1174738, 1.918987, 0.3098039, 0, 1, 1,
0.5666098, 0.8213132, 1.608517, 0.3137255, 0, 1, 1,
0.5667035, -0.4126144, 2.3048, 0.3215686, 0, 1, 1,
0.5701612, 0.5252243, 0.3330616, 0.3254902, 0, 1, 1,
0.5741749, 0.4543486, 0.5892788, 0.3333333, 0, 1, 1,
0.5752002, -2.01605, 2.948286, 0.3372549, 0, 1, 1,
0.5819107, -0.08098701, 2.644876, 0.345098, 0, 1, 1,
0.585402, -0.7984561, 2.200269, 0.3490196, 0, 1, 1,
0.5862225, -0.8609368, 3.211619, 0.3568628, 0, 1, 1,
0.5879017, 1.707009, 0.0395206, 0.3607843, 0, 1, 1,
0.5986777, -1.139617, 2.419016, 0.3686275, 0, 1, 1,
0.5998292, -1.853469, 3.557277, 0.372549, 0, 1, 1,
0.6034669, -0.1636026, 1.455263, 0.3803922, 0, 1, 1,
0.6039472, 0.5046502, 1.182348, 0.3843137, 0, 1, 1,
0.6048895, 0.9719332, 0.0115589, 0.3921569, 0, 1, 1,
0.6072684, -0.6279846, 1.761202, 0.3960784, 0, 1, 1,
0.6101978, 0.1533478, 0.4581911, 0.4039216, 0, 1, 1,
0.6109517, 0.6979265, 0.02013623, 0.4117647, 0, 1, 1,
0.6136915, 0.7852774, 0.2949241, 0.4156863, 0, 1, 1,
0.6214961, 0.3619724, 0.3432504, 0.4235294, 0, 1, 1,
0.6272068, -1.103597, 1.425057, 0.427451, 0, 1, 1,
0.6282615, 0.5767897, 2.509773, 0.4352941, 0, 1, 1,
0.6298711, 1.036231, 0.09231614, 0.4392157, 0, 1, 1,
0.6305351, 2.15671, 1.776237, 0.4470588, 0, 1, 1,
0.6319441, -0.2687326, 2.620808, 0.4509804, 0, 1, 1,
0.633195, 0.4644201, -0.293841, 0.4588235, 0, 1, 1,
0.6356936, 0.641512, 1.460602, 0.4627451, 0, 1, 1,
0.6405234, -1.51134, 2.280114, 0.4705882, 0, 1, 1,
0.6408345, 1.040286, -1.017755, 0.4745098, 0, 1, 1,
0.6436317, -0.369911, 0.5899544, 0.4823529, 0, 1, 1,
0.6464188, 0.7449798, 1.702015, 0.4862745, 0, 1, 1,
0.6495499, -0.5503768, 3.494943, 0.4941176, 0, 1, 1,
0.6506637, -0.1133457, 2.672218, 0.5019608, 0, 1, 1,
0.651023, -0.2976692, 2.745502, 0.5058824, 0, 1, 1,
0.6522828, -0.4555948, 2.636901, 0.5137255, 0, 1, 1,
0.6529447, -1.919488, 4.062848, 0.5176471, 0, 1, 1,
0.6548578, -0.2080663, 0.4582952, 0.5254902, 0, 1, 1,
0.6555613, -0.9671701, 1.162038, 0.5294118, 0, 1, 1,
0.6557704, 0.08632528, 2.408962, 0.5372549, 0, 1, 1,
0.6596514, 0.6688022, 0.6853334, 0.5411765, 0, 1, 1,
0.663128, 0.3209847, -0.0360515, 0.5490196, 0, 1, 1,
0.6657342, 0.03849149, 1.904639, 0.5529412, 0, 1, 1,
0.6657657, -1.845846, 2.082198, 0.5607843, 0, 1, 1,
0.6670663, 1.589098, -0.05793733, 0.5647059, 0, 1, 1,
0.6709815, 0.1570705, 2.689453, 0.572549, 0, 1, 1,
0.6721284, 0.186419, 1.843646, 0.5764706, 0, 1, 1,
0.6737114, 0.8071941, 2.843345, 0.5843138, 0, 1, 1,
0.676124, 0.5252852, -0.329773, 0.5882353, 0, 1, 1,
0.6766431, -0.0002219649, 1.092923, 0.5960785, 0, 1, 1,
0.6770027, 0.574529, 0.6560341, 0.6039216, 0, 1, 1,
0.6806343, 0.4129106, -0.1416451, 0.6078432, 0, 1, 1,
0.6917241, 1.952095, 1.508725, 0.6156863, 0, 1, 1,
0.6932534, -0.3840386, 2.728441, 0.6196079, 0, 1, 1,
0.6982862, -1.945457, 2.442152, 0.627451, 0, 1, 1,
0.7015056, -0.3109523, 2.771016, 0.6313726, 0, 1, 1,
0.7026561, 0.6981347, 1.247014, 0.6392157, 0, 1, 1,
0.7066712, 1.974919, 0.8030671, 0.6431373, 0, 1, 1,
0.7102415, 0.787071, 1.297362, 0.6509804, 0, 1, 1,
0.7141315, 0.7312717, 0.1219746, 0.654902, 0, 1, 1,
0.7247843, 0.236877, 1.502902, 0.6627451, 0, 1, 1,
0.7259836, 1.943924, -0.2411485, 0.6666667, 0, 1, 1,
0.7261047, 0.4148791, 1.501006, 0.6745098, 0, 1, 1,
0.7268983, -0.2993607, 1.325435, 0.6784314, 0, 1, 1,
0.7335715, 0.2560149, 1.673256, 0.6862745, 0, 1, 1,
0.7369505, 1.088996, 0.05826868, 0.6901961, 0, 1, 1,
0.7379777, -0.5620431, 1.349748, 0.6980392, 0, 1, 1,
0.740855, 0.5294033, -0.3506193, 0.7058824, 0, 1, 1,
0.7415044, 2.160643, 0.8570022, 0.7098039, 0, 1, 1,
0.7566472, -0.5825061, 3.633372, 0.7176471, 0, 1, 1,
0.7611371, 0.4579363, 1.627378, 0.7215686, 0, 1, 1,
0.7688519, -0.03384516, 0.9076663, 0.7294118, 0, 1, 1,
0.7830952, 1.380949, 0.5653146, 0.7333333, 0, 1, 1,
0.7835035, 1.124489, -0.8758579, 0.7411765, 0, 1, 1,
0.7897896, -1.960032, 2.196744, 0.7450981, 0, 1, 1,
0.7907088, -1.176072, 3.124366, 0.7529412, 0, 1, 1,
0.7910812, -1.094537, 4.109264, 0.7568628, 0, 1, 1,
0.7939979, 0.3721752, 0.514725, 0.7647059, 0, 1, 1,
0.8031752, -0.1662366, 1.377464, 0.7686275, 0, 1, 1,
0.8064457, 1.394018, 1.180442, 0.7764706, 0, 1, 1,
0.8080434, 0.8907434, 0.9406466, 0.7803922, 0, 1, 1,
0.8082386, -0.4959617, 3.467257, 0.7882353, 0, 1, 1,
0.8100622, 0.746173, -1.122143, 0.7921569, 0, 1, 1,
0.8168331, 1.068095, 2.400954, 0.8, 0, 1, 1,
0.818342, -0.08265526, 3.322633, 0.8078431, 0, 1, 1,
0.8261179, -0.6438049, 0.7147655, 0.8117647, 0, 1, 1,
0.8266618, 0.241789, 2.756037, 0.8196079, 0, 1, 1,
0.8342189, -1.469609, 2.858469, 0.8235294, 0, 1, 1,
0.8386513, 0.2936096, 0.6506264, 0.8313726, 0, 1, 1,
0.8432056, 0.8701526, 0.1297065, 0.8352941, 0, 1, 1,
0.8482835, 0.08550585, 0.1592189, 0.8431373, 0, 1, 1,
0.8514042, 0.7690238, 2.54333, 0.8470588, 0, 1, 1,
0.8561205, -0.0007164679, 0.7860195, 0.854902, 0, 1, 1,
0.860092, -0.556568, 1.65748, 0.8588235, 0, 1, 1,
0.885873, -1.086415, 3.13303, 0.8666667, 0, 1, 1,
0.8952086, -1.44149, 2.794962, 0.8705882, 0, 1, 1,
0.8963605, 1.538362, 1.138914, 0.8784314, 0, 1, 1,
0.8995693, -0.4342284, 0.7845293, 0.8823529, 0, 1, 1,
0.9002599, 0.895277, 1.4876, 0.8901961, 0, 1, 1,
0.9015719, 0.3735172, 3.343567, 0.8941177, 0, 1, 1,
0.931515, -1.351565, 3.707891, 0.9019608, 0, 1, 1,
0.9351789, 0.2509015, 0.9367477, 0.9098039, 0, 1, 1,
0.9400495, 0.7674954, 2.554653, 0.9137255, 0, 1, 1,
0.9460052, 0.4095672, 1.950466, 0.9215686, 0, 1, 1,
0.9509276, 1.792505, -1.36248, 0.9254902, 0, 1, 1,
0.9574133, -0.2432387, 0.1530293, 0.9333333, 0, 1, 1,
0.960015, -1.133842, 2.136185, 0.9372549, 0, 1, 1,
0.9602501, -0.06707624, 1.415145, 0.945098, 0, 1, 1,
0.9628496, -0.2861671, 0.004053095, 0.9490196, 0, 1, 1,
0.9721646, -0.4610544, 3.800917, 0.9568627, 0, 1, 1,
0.9813066, 0.218364, 1.01435, 0.9607843, 0, 1, 1,
0.9822873, 0.2715719, 2.189964, 0.9686275, 0, 1, 1,
0.9861941, -1.048793, 3.509019, 0.972549, 0, 1, 1,
0.9874279, 1.800933, -1.050239, 0.9803922, 0, 1, 1,
0.9895798, 0.6260435, -0.825008, 0.9843137, 0, 1, 1,
0.9985757, -1.031534, 0.9594493, 0.9921569, 0, 1, 1,
1.005758, -1.180013, 2.170421, 0.9960784, 0, 1, 1,
1.022504, 0.1573624, 0.3815736, 1, 0, 0.9960784, 1,
1.024788, -0.5752473, 2.921915, 1, 0, 0.9882353, 1,
1.025311, 0.4238367, 2.167876, 1, 0, 0.9843137, 1,
1.027252, 0.01551706, 2.184946, 1, 0, 0.9764706, 1,
1.030252, -1.846836, 2.518282, 1, 0, 0.972549, 1,
1.035425, 0.5882232, 1.094844, 1, 0, 0.9647059, 1,
1.04283, 1.50302, -0.463288, 1, 0, 0.9607843, 1,
1.048531, 0.03577287, 2.770519, 1, 0, 0.9529412, 1,
1.052567, -1.554333, 2.324443, 1, 0, 0.9490196, 1,
1.053536, 0.7777478, -1.060222, 1, 0, 0.9411765, 1,
1.055473, -0.3438191, 1.802005, 1, 0, 0.9372549, 1,
1.056597, 1.259211, 0.2179492, 1, 0, 0.9294118, 1,
1.061934, -0.3148719, 1.392343, 1, 0, 0.9254902, 1,
1.066305, -0.5835233, 1.738528, 1, 0, 0.9176471, 1,
1.076908, 1.487728, 0.1441737, 1, 0, 0.9137255, 1,
1.079571, -1.045421, 2.235315, 1, 0, 0.9058824, 1,
1.081772, 1.33766, -0.3865763, 1, 0, 0.9019608, 1,
1.082331, -0.8083145, 2.536503, 1, 0, 0.8941177, 1,
1.082816, 0.2890472, -0.04864449, 1, 0, 0.8862745, 1,
1.086017, 1.491015, -0.255552, 1, 0, 0.8823529, 1,
1.091115, 0.133172, 1.178277, 1, 0, 0.8745098, 1,
1.096636, 0.4966915, 1.371351, 1, 0, 0.8705882, 1,
1.100353, 0.6827167, 3.216075, 1, 0, 0.8627451, 1,
1.108424, 0.8330109, 0.9164994, 1, 0, 0.8588235, 1,
1.111569, -1.388196, 0.5443498, 1, 0, 0.8509804, 1,
1.116272, -0.04951286, 2.05889, 1, 0, 0.8470588, 1,
1.118603, 0.4472097, 1.507359, 1, 0, 0.8392157, 1,
1.119291, 0.553254, 0.1025885, 1, 0, 0.8352941, 1,
1.121037, 0.6943616, -0.09543758, 1, 0, 0.827451, 1,
1.121409, -1.711379, 2.27254, 1, 0, 0.8235294, 1,
1.123732, -0.3447598, 2.162575, 1, 0, 0.8156863, 1,
1.131737, 0.1113528, 0.8733065, 1, 0, 0.8117647, 1,
1.142251, 0.1578287, 1.009097, 1, 0, 0.8039216, 1,
1.145729, 0.2758552, 2.531433, 1, 0, 0.7960784, 1,
1.146516, -0.6538264, 2.787323, 1, 0, 0.7921569, 1,
1.149023, -2.269808, 2.795105, 1, 0, 0.7843137, 1,
1.149284, -1.345381, 3.359215, 1, 0, 0.7803922, 1,
1.155183, -2.140433, 2.295438, 1, 0, 0.772549, 1,
1.156482, -0.3761853, 3.114725, 1, 0, 0.7686275, 1,
1.16231, -0.2969519, 2.596543, 1, 0, 0.7607843, 1,
1.175986, 1.456537, 1.189117, 1, 0, 0.7568628, 1,
1.183254, 1.343502, 0.5841945, 1, 0, 0.7490196, 1,
1.189614, -0.06156643, 1.605171, 1, 0, 0.7450981, 1,
1.194244, -1.162295, 2.720786, 1, 0, 0.7372549, 1,
1.197944, 1.416566, 2.404119, 1, 0, 0.7333333, 1,
1.199629, -1.125231, 2.798646, 1, 0, 0.7254902, 1,
1.200315, 0.687048, 1.294098, 1, 0, 0.7215686, 1,
1.200614, 0.3194128, -0.2531206, 1, 0, 0.7137255, 1,
1.223703, -0.9126177, 0.1969186, 1, 0, 0.7098039, 1,
1.226054, -0.9833059, 2.30193, 1, 0, 0.7019608, 1,
1.229103, 0.9633533, 0.328971, 1, 0, 0.6941177, 1,
1.233587, -0.0276988, 2.693435, 1, 0, 0.6901961, 1,
1.237044, -0.07525979, 1.177256, 1, 0, 0.682353, 1,
1.243466, -0.4227124, 2.032726, 1, 0, 0.6784314, 1,
1.261205, -0.1616701, 2.92731, 1, 0, 0.6705883, 1,
1.266697, -0.8324064, 1.379307, 1, 0, 0.6666667, 1,
1.269276, 2.424491, 0.7417265, 1, 0, 0.6588235, 1,
1.270709, 0.003535424, 1.324601, 1, 0, 0.654902, 1,
1.274053, -1.698865, 2.665189, 1, 0, 0.6470588, 1,
1.280754, -0.6235163, 1.647861, 1, 0, 0.6431373, 1,
1.281724, -0.9565544, 2.766182, 1, 0, 0.6352941, 1,
1.293729, -0.08909503, 0.5142839, 1, 0, 0.6313726, 1,
1.296872, -0.03457667, 2.11597, 1, 0, 0.6235294, 1,
1.306487, -1.204577, 1.661088, 1, 0, 0.6196079, 1,
1.30958, -0.2519524, 0.02564463, 1, 0, 0.6117647, 1,
1.313048, -1.033082, 1.853529, 1, 0, 0.6078432, 1,
1.317328, -1.113735, 1.707585, 1, 0, 0.6, 1,
1.320884, -1.178892, 1.113003, 1, 0, 0.5921569, 1,
1.323386, 1.818671, 0.01620247, 1, 0, 0.5882353, 1,
1.323916, -0.1549112, 3.77103, 1, 0, 0.5803922, 1,
1.330253, -1.289241, 1.818075, 1, 0, 0.5764706, 1,
1.331862, 0.137903, 0.1517232, 1, 0, 0.5686275, 1,
1.344317, -1.259323, 0.4664113, 1, 0, 0.5647059, 1,
1.350684, -0.08242523, 0.637917, 1, 0, 0.5568628, 1,
1.356586, -0.3743585, 1.393696, 1, 0, 0.5529412, 1,
1.37845, 0.924224, 1.547797, 1, 0, 0.5450981, 1,
1.384559, 1.000626, 0.2071451, 1, 0, 0.5411765, 1,
1.385092, -0.3722923, 0.1009978, 1, 0, 0.5333334, 1,
1.392387, -0.5566785, 1.974252, 1, 0, 0.5294118, 1,
1.413335, 1.872447, 1.293677, 1, 0, 0.5215687, 1,
1.414298, -0.4820107, 2.230146, 1, 0, 0.5176471, 1,
1.414332, 1.04565, 1.155531, 1, 0, 0.509804, 1,
1.415658, 0.945517, -0.761974, 1, 0, 0.5058824, 1,
1.420605, -0.04574541, 1.562556, 1, 0, 0.4980392, 1,
1.42609, 0.8029851, 1.125722, 1, 0, 0.4901961, 1,
1.426249, 0.8068216, -0.3148785, 1, 0, 0.4862745, 1,
1.438197, -0.5101962, 1.024964, 1, 0, 0.4784314, 1,
1.444675, -0.4239111, 1.404838, 1, 0, 0.4745098, 1,
1.448996, 1.635365, -0.04979254, 1, 0, 0.4666667, 1,
1.449882, -0.5291595, 1.52938, 1, 0, 0.4627451, 1,
1.457975, 0.9086339, -0.305973, 1, 0, 0.454902, 1,
1.461558, 1.912902, 1.278169, 1, 0, 0.4509804, 1,
1.462112, 0.5176963, 2.545129, 1, 0, 0.4431373, 1,
1.466413, -1.283682, 4.30885, 1, 0, 0.4392157, 1,
1.476328, 0.06153044, 1.642382, 1, 0, 0.4313726, 1,
1.482198, 0.4505285, -0.3999946, 1, 0, 0.427451, 1,
1.484692, -0.6054034, 1.975195, 1, 0, 0.4196078, 1,
1.49407, -0.8519176, 3.413953, 1, 0, 0.4156863, 1,
1.496585, -0.044156, 0.1447295, 1, 0, 0.4078431, 1,
1.515709, 1.064412, 2.725506, 1, 0, 0.4039216, 1,
1.525647, 0.1782225, 1.5425, 1, 0, 0.3960784, 1,
1.532361, 0.7307376, -0.0272522, 1, 0, 0.3882353, 1,
1.541789, -0.4361303, 1.142173, 1, 0, 0.3843137, 1,
1.54784, -1.372313, 4.303973, 1, 0, 0.3764706, 1,
1.554502, -0.8694159, 1.987822, 1, 0, 0.372549, 1,
1.569176, -0.0526784, 0.6572241, 1, 0, 0.3647059, 1,
1.579038, -0.3881592, 1.678169, 1, 0, 0.3607843, 1,
1.581769, 0.1553223, 1.10102, 1, 0, 0.3529412, 1,
1.6004, -0.9158854, 0.1136975, 1, 0, 0.3490196, 1,
1.616242, -1.355625, 3.06117, 1, 0, 0.3411765, 1,
1.616506, -0.1912111, 1.220759, 1, 0, 0.3372549, 1,
1.623977, 1.047972, 0.3517073, 1, 0, 0.3294118, 1,
1.6356, -0.831241, 1.323545, 1, 0, 0.3254902, 1,
1.641525, -0.5854864, 2.741716, 1, 0, 0.3176471, 1,
1.664704, -2.032914, 1.595774, 1, 0, 0.3137255, 1,
1.673784, 0.1017444, 2.848532, 1, 0, 0.3058824, 1,
1.678, 1.204005, 1.973053, 1, 0, 0.2980392, 1,
1.680375, -1.673708, 2.7569, 1, 0, 0.2941177, 1,
1.682296, -1.214523, 0.7412811, 1, 0, 0.2862745, 1,
1.690542, 0.868143, 0.8062693, 1, 0, 0.282353, 1,
1.691751, -0.6819401, 1.079708, 1, 0, 0.2745098, 1,
1.692063, -1.964781, 3.754589, 1, 0, 0.2705882, 1,
1.694163, -0.6387746, 1.805269, 1, 0, 0.2627451, 1,
1.701261, -0.3687111, 1.24552, 1, 0, 0.2588235, 1,
1.708972, -1.025568, 2.533753, 1, 0, 0.2509804, 1,
1.71076, 1.109616, 1.52969, 1, 0, 0.2470588, 1,
1.719763, -0.4437751, 1.688746, 1, 0, 0.2392157, 1,
1.734091, 0.7368252, 2.31698, 1, 0, 0.2352941, 1,
1.743636, 1.193399, -0.09337953, 1, 0, 0.227451, 1,
1.761371, 1.63437, 1.75798, 1, 0, 0.2235294, 1,
1.764514, 0.247814, 1.770952, 1, 0, 0.2156863, 1,
1.792536, -0.6996306, 2.030498, 1, 0, 0.2117647, 1,
1.834061, 0.4899794, 2.511154, 1, 0, 0.2039216, 1,
1.845563, 0.9027709, 1.593312, 1, 0, 0.1960784, 1,
1.84722, 0.8296216, 1.192434, 1, 0, 0.1921569, 1,
1.853471, 0.3707934, 2.292154, 1, 0, 0.1843137, 1,
1.868818, -0.7571303, 0.4415245, 1, 0, 0.1803922, 1,
1.934999, -0.3937788, 2.220809, 1, 0, 0.172549, 1,
1.936935, -0.4574514, 1.396098, 1, 0, 0.1686275, 1,
1.945484, -1.807895, 3.920479, 1, 0, 0.1607843, 1,
1.953866, 0.4021201, 1.850089, 1, 0, 0.1568628, 1,
1.955609, -0.3555663, 2.572913, 1, 0, 0.1490196, 1,
2.004279, 0.2567478, 0.4126688, 1, 0, 0.145098, 1,
2.041131, 1.221892, 0.5222693, 1, 0, 0.1372549, 1,
2.05652, -0.2170282, 2.39612, 1, 0, 0.1333333, 1,
2.060038, 1.178357, 0.8177722, 1, 0, 0.1254902, 1,
2.119083, 1.257845, 1.694194, 1, 0, 0.1215686, 1,
2.130502, -0.4195425, 0.7831662, 1, 0, 0.1137255, 1,
2.279937, -2.551935, 1.109364, 1, 0, 0.1098039, 1,
2.304662, -0.342584, 1.424757, 1, 0, 0.1019608, 1,
2.317055, 0.29323, 2.179669, 1, 0, 0.09411765, 1,
2.318542, -2.391445, 1.152372, 1, 0, 0.09019608, 1,
2.321705, 0.3588486, 2.007571, 1, 0, 0.08235294, 1,
2.37893, -0.7064502, 0.2180212, 1, 0, 0.07843138, 1,
2.437265, 0.8985807, 0.1822702, 1, 0, 0.07058824, 1,
2.444607, 0.06875244, 0.607941, 1, 0, 0.06666667, 1,
2.465493, 0.07262811, 2.480598, 1, 0, 0.05882353, 1,
2.487694, -0.6171461, 2.08357, 1, 0, 0.05490196, 1,
2.524656, -2.56075, 2.853261, 1, 0, 0.04705882, 1,
2.628721, 0.03625898, 1.100437, 1, 0, 0.04313726, 1,
2.674273, -0.5295416, 1.935829, 1, 0, 0.03529412, 1,
2.703299, 0.827009, 1.463763, 1, 0, 0.03137255, 1,
2.711781, -2.204167, 2.679849, 1, 0, 0.02352941, 1,
2.930265, -1.892767, 1.645743, 1, 0, 0.01960784, 1,
3.603968, 0.03211094, 2.257665, 1, 0, 0.01176471, 1,
4.011664, 0.4445064, 0.8303713, 1, 0, 0.007843138, 1
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
0.2226688, -4.550482, -6.91467, 0, -0.5, 0.5, 0.5,
0.2226688, -4.550482, -6.91467, 1, -0.5, 0.5, 0.5,
0.2226688, -4.550482, -6.91467, 1, 1.5, 0.5, 0.5,
0.2226688, -4.550482, -6.91467, 0, 1.5, 0.5, 0.5
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
-4.850796, -0.2207233, -6.91467, 0, -0.5, 0.5, 0.5,
-4.850796, -0.2207233, -6.91467, 1, -0.5, 0.5, 0.5,
-4.850796, -0.2207233, -6.91467, 1, 1.5, 0.5, 0.5,
-4.850796, -0.2207233, -6.91467, 0, 1.5, 0.5, 0.5
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
-4.850796, -4.550482, 0.06650376, 0, -0.5, 0.5, 0.5,
-4.850796, -4.550482, 0.06650376, 1, -0.5, 0.5, 0.5,
-4.850796, -4.550482, 0.06650376, 1, 1.5, 0.5, 0.5,
-4.850796, -4.550482, 0.06650376, 0, 1.5, 0.5, 0.5
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
-2, -3.551307, -5.303629,
4, -3.551307, -5.303629,
-2, -3.551307, -5.303629,
-2, -3.717836, -5.572136,
0, -3.551307, -5.303629,
0, -3.717836, -5.572136,
2, -3.551307, -5.303629,
2, -3.717836, -5.572136,
4, -3.551307, -5.303629,
4, -3.717836, -5.572136
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
"2",
"4"
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
-2, -4.050895, -6.109149, 0, -0.5, 0.5, 0.5,
-2, -4.050895, -6.109149, 1, -0.5, 0.5, 0.5,
-2, -4.050895, -6.109149, 1, 1.5, 0.5, 0.5,
-2, -4.050895, -6.109149, 0, 1.5, 0.5, 0.5,
0, -4.050895, -6.109149, 0, -0.5, 0.5, 0.5,
0, -4.050895, -6.109149, 1, -0.5, 0.5, 0.5,
0, -4.050895, -6.109149, 1, 1.5, 0.5, 0.5,
0, -4.050895, -6.109149, 0, 1.5, 0.5, 0.5,
2, -4.050895, -6.109149, 0, -0.5, 0.5, 0.5,
2, -4.050895, -6.109149, 1, -0.5, 0.5, 0.5,
2, -4.050895, -6.109149, 1, 1.5, 0.5, 0.5,
2, -4.050895, -6.109149, 0, 1.5, 0.5, 0.5,
4, -4.050895, -6.109149, 0, -0.5, 0.5, 0.5,
4, -4.050895, -6.109149, 1, -0.5, 0.5, 0.5,
4, -4.050895, -6.109149, 1, 1.5, 0.5, 0.5,
4, -4.050895, -6.109149, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.679997, -3, -5.303629,
-3.679997, 3, -5.303629,
-3.679997, -3, -5.303629,
-3.87513, -3, -5.572136,
-3.679997, -2, -5.303629,
-3.87513, -2, -5.572136,
-3.679997, -1, -5.303629,
-3.87513, -1, -5.572136,
-3.679997, 0, -5.303629,
-3.87513, 0, -5.572136,
-3.679997, 1, -5.303629,
-3.87513, 1, -5.572136,
-3.679997, 2, -5.303629,
-3.87513, 2, -5.572136,
-3.679997, 3, -5.303629,
-3.87513, 3, -5.572136
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
-4.265397, -3, -6.109149, 0, -0.5, 0.5, 0.5,
-4.265397, -3, -6.109149, 1, -0.5, 0.5, 0.5,
-4.265397, -3, -6.109149, 1, 1.5, 0.5, 0.5,
-4.265397, -3, -6.109149, 0, 1.5, 0.5, 0.5,
-4.265397, -2, -6.109149, 0, -0.5, 0.5, 0.5,
-4.265397, -2, -6.109149, 1, -0.5, 0.5, 0.5,
-4.265397, -2, -6.109149, 1, 1.5, 0.5, 0.5,
-4.265397, -2, -6.109149, 0, 1.5, 0.5, 0.5,
-4.265397, -1, -6.109149, 0, -0.5, 0.5, 0.5,
-4.265397, -1, -6.109149, 1, -0.5, 0.5, 0.5,
-4.265397, -1, -6.109149, 1, 1.5, 0.5, 0.5,
-4.265397, -1, -6.109149, 0, 1.5, 0.5, 0.5,
-4.265397, 0, -6.109149, 0, -0.5, 0.5, 0.5,
-4.265397, 0, -6.109149, 1, -0.5, 0.5, 0.5,
-4.265397, 0, -6.109149, 1, 1.5, 0.5, 0.5,
-4.265397, 0, -6.109149, 0, 1.5, 0.5, 0.5,
-4.265397, 1, -6.109149, 0, -0.5, 0.5, 0.5,
-4.265397, 1, -6.109149, 1, -0.5, 0.5, 0.5,
-4.265397, 1, -6.109149, 1, 1.5, 0.5, 0.5,
-4.265397, 1, -6.109149, 0, 1.5, 0.5, 0.5,
-4.265397, 2, -6.109149, 0, -0.5, 0.5, 0.5,
-4.265397, 2, -6.109149, 1, -0.5, 0.5, 0.5,
-4.265397, 2, -6.109149, 1, 1.5, 0.5, 0.5,
-4.265397, 2, -6.109149, 0, 1.5, 0.5, 0.5,
-4.265397, 3, -6.109149, 0, -0.5, 0.5, 0.5,
-4.265397, 3, -6.109149, 1, -0.5, 0.5, 0.5,
-4.265397, 3, -6.109149, 1, 1.5, 0.5, 0.5,
-4.265397, 3, -6.109149, 0, 1.5, 0.5, 0.5
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
-3.679997, -3.551307, -4,
-3.679997, -3.551307, 4,
-3.679997, -3.551307, -4,
-3.87513, -3.717836, -4,
-3.679997, -3.551307, -2,
-3.87513, -3.717836, -2,
-3.679997, -3.551307, 0,
-3.87513, -3.717836, 0,
-3.679997, -3.551307, 2,
-3.87513, -3.717836, 2,
-3.679997, -3.551307, 4,
-3.87513, -3.717836, 4
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
-4.265397, -4.050895, -4, 0, -0.5, 0.5, 0.5,
-4.265397, -4.050895, -4, 1, -0.5, 0.5, 0.5,
-4.265397, -4.050895, -4, 1, 1.5, 0.5, 0.5,
-4.265397, -4.050895, -4, 0, 1.5, 0.5, 0.5,
-4.265397, -4.050895, -2, 0, -0.5, 0.5, 0.5,
-4.265397, -4.050895, -2, 1, -0.5, 0.5, 0.5,
-4.265397, -4.050895, -2, 1, 1.5, 0.5, 0.5,
-4.265397, -4.050895, -2, 0, 1.5, 0.5, 0.5,
-4.265397, -4.050895, 0, 0, -0.5, 0.5, 0.5,
-4.265397, -4.050895, 0, 1, -0.5, 0.5, 0.5,
-4.265397, -4.050895, 0, 1, 1.5, 0.5, 0.5,
-4.265397, -4.050895, 0, 0, 1.5, 0.5, 0.5,
-4.265397, -4.050895, 2, 0, -0.5, 0.5, 0.5,
-4.265397, -4.050895, 2, 1, -0.5, 0.5, 0.5,
-4.265397, -4.050895, 2, 1, 1.5, 0.5, 0.5,
-4.265397, -4.050895, 2, 0, 1.5, 0.5, 0.5,
-4.265397, -4.050895, 4, 0, -0.5, 0.5, 0.5,
-4.265397, -4.050895, 4, 1, -0.5, 0.5, 0.5,
-4.265397, -4.050895, 4, 1, 1.5, 0.5, 0.5,
-4.265397, -4.050895, 4, 0, 1.5, 0.5, 0.5
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
-3.679997, -3.551307, -5.303629,
-3.679997, 3.109861, -5.303629,
-3.679997, -3.551307, 5.436637,
-3.679997, 3.109861, 5.436637,
-3.679997, -3.551307, -5.303629,
-3.679997, -3.551307, 5.436637,
-3.679997, 3.109861, -5.303629,
-3.679997, 3.109861, 5.436637,
-3.679997, -3.551307, -5.303629,
4.125334, -3.551307, -5.303629,
-3.679997, -3.551307, 5.436637,
4.125334, -3.551307, 5.436637,
-3.679997, 3.109861, -5.303629,
4.125334, 3.109861, -5.303629,
-3.679997, 3.109861, 5.436637,
4.125334, 3.109861, 5.436637,
4.125334, -3.551307, -5.303629,
4.125334, 3.109861, -5.303629,
4.125334, -3.551307, 5.436637,
4.125334, 3.109861, 5.436637,
4.125334, -3.551307, -5.303629,
4.125334, -3.551307, 5.436637,
4.125334, 3.109861, -5.303629,
4.125334, 3.109861, 5.436637
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
var radius = 7.931862;
var distance = 35.28975;
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
mvMatrix.translate( -0.2226688, 0.2207233, -0.06650376 );
mvMatrix.scale( 1.098747, 1.287475, 0.7984983 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.28975);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Dimethyl_tetrachloro<-read.table("Dimethyl_tetrachloro.xyz")
```

```
## Error in read.table("Dimethyl_tetrachloro.xyz"): no lines available in input
```

```r
x<-Dimethyl_tetrachloro$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dimethyl_tetrachloro' not found
```

```r
y<-Dimethyl_tetrachloro$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dimethyl_tetrachloro' not found
```

```r
z<-Dimethyl_tetrachloro$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dimethyl_tetrachloro' not found
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
-3.566327, -2.51291, -3.110827, 0, 0, 1, 1, 1,
-3.070247, 1.142912, -0.1894063, 1, 0, 0, 1, 1,
-2.920236, -1.907426, -1.152064, 1, 0, 0, 1, 1,
-2.864569, 0.4949409, -2.538252, 1, 0, 0, 1, 1,
-2.655526, 1.394766, -1.257075, 1, 0, 0, 1, 1,
-2.644445, -0.3279702, -1.349043, 1, 0, 0, 1, 1,
-2.566033, 0.1470399, 0.2096987, 0, 0, 0, 1, 1,
-2.529014, -0.3817702, -0.8332413, 0, 0, 0, 1, 1,
-2.427903, 0.693572, -2.053349, 0, 0, 0, 1, 1,
-2.335473, -0.1877611, -1.493148, 0, 0, 0, 1, 1,
-2.26966, -0.3881879, -2.382943, 0, 0, 0, 1, 1,
-2.260923, -0.3009046, 0.4198188, 0, 0, 0, 1, 1,
-2.25681, 0.1613449, -0.9926406, 0, 0, 0, 1, 1,
-2.18332, -0.4896648, -0.9597887, 1, 1, 1, 1, 1,
-2.165107, -0.1422604, -2.444454, 1, 1, 1, 1, 1,
-2.137738, -1.437614, -4.510919, 1, 1, 1, 1, 1,
-2.114559, -0.8548775, -3.572332, 1, 1, 1, 1, 1,
-2.092576, 0.7920381, -1.099292, 1, 1, 1, 1, 1,
-2.067852, -0.4226522, -1.278294, 1, 1, 1, 1, 1,
-2.038105, -0.09499018, -2.944891, 1, 1, 1, 1, 1,
-2.001353, -1.550563, -2.309217, 1, 1, 1, 1, 1,
-1.985389, -0.118079, -1.111464, 1, 1, 1, 1, 1,
-1.970371, 0.2191369, -2.897845, 1, 1, 1, 1, 1,
-1.965868, 1.727375, 0.2334654, 1, 1, 1, 1, 1,
-1.956013, -0.06100053, -1.821244, 1, 1, 1, 1, 1,
-1.949868, -0.4799004, -2.511552, 1, 1, 1, 1, 1,
-1.948586, -0.6629341, -0.7400281, 1, 1, 1, 1, 1,
-1.928034, 1.41793, -1.059064, 1, 1, 1, 1, 1,
-1.909806, 3.012853, -1.176723, 0, 0, 1, 1, 1,
-1.900506, -1.181467, -0.8095044, 1, 0, 0, 1, 1,
-1.845396, 0.3460958, -1.622845, 1, 0, 0, 1, 1,
-1.840544, 0.8546702, -3.635815, 1, 0, 0, 1, 1,
-1.839631, -1.863969, -4.536286, 1, 0, 0, 1, 1,
-1.822026, -1.462636, -1.118966, 1, 0, 0, 1, 1,
-1.8123, -1.255939, -2.650688, 0, 0, 0, 1, 1,
-1.805782, -0.4928095, -0.1633783, 0, 0, 0, 1, 1,
-1.797519, 1.285249, -1.57577, 0, 0, 0, 1, 1,
-1.774389, -0.04466447, -1.96514, 0, 0, 0, 1, 1,
-1.765506, -1.854925, -3.490054, 0, 0, 0, 1, 1,
-1.756841, -0.153378, -1.170101, 0, 0, 0, 1, 1,
-1.742566, 0.1355511, 0.5419576, 0, 0, 0, 1, 1,
-1.682495, 0.04462346, -1.502759, 1, 1, 1, 1, 1,
-1.677794, -2.333179, -2.73437, 1, 1, 1, 1, 1,
-1.673869, 0.4434242, -1.798051, 1, 1, 1, 1, 1,
-1.664244, -1.177217, -2.645423, 1, 1, 1, 1, 1,
-1.648696, 0.7962551, -2.468284, 1, 1, 1, 1, 1,
-1.646878, -0.1147956, -1.91458, 1, 1, 1, 1, 1,
-1.634637, 0.2928801, 0.2496613, 1, 1, 1, 1, 1,
-1.631754, -0.6400747, -3.086574, 1, 1, 1, 1, 1,
-1.629499, -1.017624, -2.878727, 1, 1, 1, 1, 1,
-1.628797, -0.09164791, -1.716845, 1, 1, 1, 1, 1,
-1.628281, 0.4407843, -1.934923, 1, 1, 1, 1, 1,
-1.6262, 1.354162, -0.60629, 1, 1, 1, 1, 1,
-1.626132, -0.361424, -2.317461, 1, 1, 1, 1, 1,
-1.622262, 0.158578, -1.699038, 1, 1, 1, 1, 1,
-1.621034, -1.090101, -2.768197, 1, 1, 1, 1, 1,
-1.615909, 0.2078781, -1.013283, 0, 0, 1, 1, 1,
-1.604115, 0.3395999, -2.010419, 1, 0, 0, 1, 1,
-1.59676, -1.866065, -0.5802489, 1, 0, 0, 1, 1,
-1.585617, 1.72455, -0.29031, 1, 0, 0, 1, 1,
-1.571827, 0.8476169, -1.415796, 1, 0, 0, 1, 1,
-1.56327, 1.113368, -0.1535209, 1, 0, 0, 1, 1,
-1.562577, 0.5491503, -0.9590279, 0, 0, 0, 1, 1,
-1.544183, 1.283613, -1.052119, 0, 0, 0, 1, 1,
-1.543698, 0.6131672, -1.709288, 0, 0, 0, 1, 1,
-1.536681, -1.247751, -2.72182, 0, 0, 0, 1, 1,
-1.534266, -2.690653, -2.35857, 0, 0, 0, 1, 1,
-1.532844, -0.1288505, -1.725762, 0, 0, 0, 1, 1,
-1.51968, -0.3446117, -2.806038, 0, 0, 0, 1, 1,
-1.513121, -0.553261, -2.607063, 1, 1, 1, 1, 1,
-1.512689, 0.3453921, -0.4175295, 1, 1, 1, 1, 1,
-1.511034, 1.524414, -2.11587, 1, 1, 1, 1, 1,
-1.491742, 1.182773, 1.350384, 1, 1, 1, 1, 1,
-1.487727, -0.0747183, -0.3962973, 1, 1, 1, 1, 1,
-1.484782, 0.1630562, -3.073657, 1, 1, 1, 1, 1,
-1.479627, -0.03355394, 2.269978, 1, 1, 1, 1, 1,
-1.478774, 0.3804164, -3.636471, 1, 1, 1, 1, 1,
-1.467461, 0.3596162, 0.2923952, 1, 1, 1, 1, 1,
-1.464359, 0.6610659, -1.480082, 1, 1, 1, 1, 1,
-1.461486, -0.9973195, -3.38669, 1, 1, 1, 1, 1,
-1.45774, -1.392777, -2.238978, 1, 1, 1, 1, 1,
-1.457447, -1.474087, -3.799221, 1, 1, 1, 1, 1,
-1.456459, 0.6982672, -1.231488, 1, 1, 1, 1, 1,
-1.456312, 0.8548256, -2.603513, 1, 1, 1, 1, 1,
-1.44986, -2.155005, -1.395545, 0, 0, 1, 1, 1,
-1.444932, 0.51962, -1.202594, 1, 0, 0, 1, 1,
-1.443553, 1.268313, -1.447251, 1, 0, 0, 1, 1,
-1.426969, -0.4195607, -1.977224, 1, 0, 0, 1, 1,
-1.422294, 0.1968295, -1.290501, 1, 0, 0, 1, 1,
-1.420227, 0.5134538, -1.753383, 1, 0, 0, 1, 1,
-1.41628, -1.427957, -2.690659, 0, 0, 0, 1, 1,
-1.413583, -0.4508731, -1.53096, 0, 0, 0, 1, 1,
-1.410954, 1.360794, -1.087004, 0, 0, 0, 1, 1,
-1.403793, -0.7488795, -2.430622, 0, 0, 0, 1, 1,
-1.395201, 1.564941, -1.271989, 0, 0, 0, 1, 1,
-1.392922, 0.1173261, -0.513429, 0, 0, 0, 1, 1,
-1.38985, 0.1170496, -0.8695504, 0, 0, 0, 1, 1,
-1.389032, 0.4693228, -1.738713, 1, 1, 1, 1, 1,
-1.388013, 1.369521, 0.04562248, 1, 1, 1, 1, 1,
-1.387272, 0.8415757, -1.467093, 1, 1, 1, 1, 1,
-1.373289, 0.3655917, -0.6593845, 1, 1, 1, 1, 1,
-1.361337, -1.302237, -1.752312, 1, 1, 1, 1, 1,
-1.343307, -1.494766, -2.052696, 1, 1, 1, 1, 1,
-1.34124, -0.8460979, -3.850584, 1, 1, 1, 1, 1,
-1.337808, -0.06155045, -0.0742204, 1, 1, 1, 1, 1,
-1.336963, 0.1863929, -1.635313, 1, 1, 1, 1, 1,
-1.330904, 0.2748061, -2.048785, 1, 1, 1, 1, 1,
-1.320386, -1.042175, -1.690513, 1, 1, 1, 1, 1,
-1.319742, -0.8384783, -0.9705739, 1, 1, 1, 1, 1,
-1.309273, 0.1068681, -1.269185, 1, 1, 1, 1, 1,
-1.30497, 0.2427095, -0.532041, 1, 1, 1, 1, 1,
-1.301241, 0.3603185, -1.343295, 1, 1, 1, 1, 1,
-1.281397, -0.5575171, -1.969207, 0, 0, 1, 1, 1,
-1.280279, 1.066367, -1.353855, 1, 0, 0, 1, 1,
-1.279139, -2.111458, -1.325444, 1, 0, 0, 1, 1,
-1.263511, 0.4666429, 0.07546031, 1, 0, 0, 1, 1,
-1.244507, -0.05740421, -0.1465169, 1, 0, 0, 1, 1,
-1.235915, -1.445667, -1.134493, 1, 0, 0, 1, 1,
-1.23027, -0.9375212, -2.678239, 0, 0, 0, 1, 1,
-1.221896, -0.001121238, -1.038026, 0, 0, 0, 1, 1,
-1.217417, -1.392212, -1.957861, 0, 0, 0, 1, 1,
-1.216252, 0.2086968, -0.4567528, 0, 0, 0, 1, 1,
-1.216186, 1.135816, 0.2605306, 0, 0, 0, 1, 1,
-1.212487, -0.8603845, -0.8265538, 0, 0, 0, 1, 1,
-1.210323, 1.229664, -0.109368, 0, 0, 0, 1, 1,
-1.198975, -0.2974224, -3.08578, 1, 1, 1, 1, 1,
-1.194347, 1.084127, -0.02781439, 1, 1, 1, 1, 1,
-1.19268, 0.05763563, -2.188974, 1, 1, 1, 1, 1,
-1.192394, 0.7642177, -0.5957685, 1, 1, 1, 1, 1,
-1.191529, 0.4840379, -1.145949, 1, 1, 1, 1, 1,
-1.191082, -1.766466, -2.169417, 1, 1, 1, 1, 1,
-1.177679, -0.6214578, -0.8782414, 1, 1, 1, 1, 1,
-1.171269, 0.4759789, -1.708124, 1, 1, 1, 1, 1,
-1.153331, 0.5366468, 0.2467855, 1, 1, 1, 1, 1,
-1.146345, -0.6017458, -2.613503, 1, 1, 1, 1, 1,
-1.132263, -0.3852688, -0.7814166, 1, 1, 1, 1, 1,
-1.125888, -0.9347018, -0.2639132, 1, 1, 1, 1, 1,
-1.123687, -1.047523, -1.93785, 1, 1, 1, 1, 1,
-1.120846, -0.2302974, -1.513108, 1, 1, 1, 1, 1,
-1.117261, 0.1545766, 0.2049938, 1, 1, 1, 1, 1,
-1.11449, -0.9933093, -2.560835, 0, 0, 1, 1, 1,
-1.108258, 0.3085397, -1.71316, 1, 0, 0, 1, 1,
-1.107846, -0.4652594, -2.139403, 1, 0, 0, 1, 1,
-1.105093, 0.123975, -1.05824, 1, 0, 0, 1, 1,
-1.101858, -2.161401, -4.525492, 1, 0, 0, 1, 1,
-1.099551, 0.2859423, -2.02957, 1, 0, 0, 1, 1,
-1.068093, -0.01644251, -1.804764, 0, 0, 0, 1, 1,
-1.066706, 0.06314318, -2.706461, 0, 0, 0, 1, 1,
-1.060907, -0.5173135, -2.949646, 0, 0, 0, 1, 1,
-1.056646, 2.840071, 0.2604361, 0, 0, 0, 1, 1,
-1.033973, 2.620857, 1.234126, 0, 0, 0, 1, 1,
-1.021943, -1.113485, -2.810565, 0, 0, 0, 1, 1,
-1.011596, -0.6538647, -0.3631782, 0, 0, 0, 1, 1,
-1.011122, -0.7549525, -1.748879, 1, 1, 1, 1, 1,
-1.003541, -0.8962786, -2.249591, 1, 1, 1, 1, 1,
-1.00052, 0.1307562, -0.463758, 1, 1, 1, 1, 1,
-0.9985518, 1.718852, -1.217701, 1, 1, 1, 1, 1,
-0.9930435, 0.8415198, -0.03165513, 1, 1, 1, 1, 1,
-0.984061, 0.1888396, -0.2280231, 1, 1, 1, 1, 1,
-0.9834769, 0.04014713, -1.793545, 1, 1, 1, 1, 1,
-0.9828115, -0.545714, -4.271945, 1, 1, 1, 1, 1,
-0.981307, -2.038592, -2.28153, 1, 1, 1, 1, 1,
-0.9809681, 0.5238695, -1.219744, 1, 1, 1, 1, 1,
-0.9804193, -0.2397159, -3.554867, 1, 1, 1, 1, 1,
-0.9755464, -0.3433297, -1.930843, 1, 1, 1, 1, 1,
-0.9710556, -2.38064, -1.229994, 1, 1, 1, 1, 1,
-0.9666037, 0.7295748, -0.3281528, 1, 1, 1, 1, 1,
-0.9643555, 0.3875921, -0.4859534, 1, 1, 1, 1, 1,
-0.9520348, 0.1939345, -0.5969391, 0, 0, 1, 1, 1,
-0.9506562, -0.3713775, -1.533377, 1, 0, 0, 1, 1,
-0.9505002, 0.09915513, -3.39084, 1, 0, 0, 1, 1,
-0.9488401, 0.3592229, -1.275839, 1, 0, 0, 1, 1,
-0.9485641, -0.8877486, -3.201293, 1, 0, 0, 1, 1,
-0.944663, -0.5773277, -2.213035, 1, 0, 0, 1, 1,
-0.9444829, 0.0522744, -2.261973, 0, 0, 0, 1, 1,
-0.9442053, 0.7706334, -1.782984, 0, 0, 0, 1, 1,
-0.9440128, 1.484875, -0.6875376, 0, 0, 0, 1, 1,
-0.938587, -0.3030615, -0.8316473, 0, 0, 0, 1, 1,
-0.9330574, 0.02278176, -2.115057, 0, 0, 0, 1, 1,
-0.9330158, 1.838695, 0.4192867, 0, 0, 0, 1, 1,
-0.9317926, -1.971419, -3.36009, 0, 0, 0, 1, 1,
-0.9284117, 1.103207, -0.635551, 1, 1, 1, 1, 1,
-0.9127386, 0.218179, -1.016765, 1, 1, 1, 1, 1,
-0.9093554, 1.827701, 0.3019547, 1, 1, 1, 1, 1,
-0.9081597, 0.2748947, -0.2263365, 1, 1, 1, 1, 1,
-0.9023077, 1.599569, -1.094488, 1, 1, 1, 1, 1,
-0.8991135, -1.346903, -2.624844, 1, 1, 1, 1, 1,
-0.8957558, 0.06663322, -3.690499, 1, 1, 1, 1, 1,
-0.8949977, 0.05351764, -1.690256, 1, 1, 1, 1, 1,
-0.8926821, 1.506247, -0.214061, 1, 1, 1, 1, 1,
-0.8922014, -0.09710272, -2.476551, 1, 1, 1, 1, 1,
-0.8907032, 0.8337748, -1.459402, 1, 1, 1, 1, 1,
-0.8868301, -1.513904, -1.716449, 1, 1, 1, 1, 1,
-0.8863073, 1.148066, 0.251427, 1, 1, 1, 1, 1,
-0.8716338, -1.351849, -2.770347, 1, 1, 1, 1, 1,
-0.8708563, 0.5822614, -1.501928, 1, 1, 1, 1, 1,
-0.865706, 0.08742827, -0.488541, 0, 0, 1, 1, 1,
-0.8623816, -2.016948, -1.416044, 1, 0, 0, 1, 1,
-0.8622461, -0.4995294, -1.441795, 1, 0, 0, 1, 1,
-0.8524946, -1.281909, -2.405003, 1, 0, 0, 1, 1,
-0.8482283, -0.4734387, -2.475937, 1, 0, 0, 1, 1,
-0.8421417, -0.8523386, -2.410433, 1, 0, 0, 1, 1,
-0.8383688, -1.239883, -1.732194, 0, 0, 0, 1, 1,
-0.8361313, -0.5899703, -2.949671, 0, 0, 0, 1, 1,
-0.8332015, 0.5544732, 0.4882333, 0, 0, 0, 1, 1,
-0.833044, -0.4773872, -1.745681, 0, 0, 0, 1, 1,
-0.8324625, -0.42556, -2.409113, 0, 0, 0, 1, 1,
-0.8297418, -0.2576213, -2.07392, 0, 0, 0, 1, 1,
-0.8266343, 0.4801303, 0.5274948, 0, 0, 0, 1, 1,
-0.8147541, 0.06593902, 0.2277271, 1, 1, 1, 1, 1,
-0.8142081, -0.390403, -0.6820328, 1, 1, 1, 1, 1,
-0.8088252, 0.6048671, -0.01904479, 1, 1, 1, 1, 1,
-0.7948187, 0.3066055, -2.49153, 1, 1, 1, 1, 1,
-0.7907721, 0.3388443, -0.5858165, 1, 1, 1, 1, 1,
-0.7903037, 0.642255, -1.099124, 1, 1, 1, 1, 1,
-0.790279, 2.445456, 0.8507568, 1, 1, 1, 1, 1,
-0.7841838, 0.1326995, -3.01279, 1, 1, 1, 1, 1,
-0.7825421, -1.512341, -1.326012, 1, 1, 1, 1, 1,
-0.7802923, -0.4396802, -2.572051, 1, 1, 1, 1, 1,
-0.7764294, 0.6909453, -0.758426, 1, 1, 1, 1, 1,
-0.7700416, 1.70442, -0.709822, 1, 1, 1, 1, 1,
-0.7635194, -0.64557, -3.344191, 1, 1, 1, 1, 1,
-0.7616968, 0.009173906, -1.266533, 1, 1, 1, 1, 1,
-0.7587326, 0.2913967, 0.4971839, 1, 1, 1, 1, 1,
-0.7529687, 0.4319684, -0.9851944, 0, 0, 1, 1, 1,
-0.7522131, 0.6596677, 0.4534137, 1, 0, 0, 1, 1,
-0.750652, 0.715655, -2.051625, 1, 0, 0, 1, 1,
-0.7440359, 0.4349391, -1.256868, 1, 0, 0, 1, 1,
-0.742286, 1.115274, -2.196383, 1, 0, 0, 1, 1,
-0.7351475, 0.2911887, -0.002356927, 1, 0, 0, 1, 1,
-0.7325647, -0.8731385, -2.306142, 0, 0, 0, 1, 1,
-0.7299277, 0.6149271, -0.1254971, 0, 0, 0, 1, 1,
-0.7274729, -1.057533, -3.705349, 0, 0, 0, 1, 1,
-0.727451, 0.4050742, -2.764777, 0, 0, 0, 1, 1,
-0.7263544, 0.6946379, -1.06583, 0, 0, 0, 1, 1,
-0.7262337, -0.5382032, -2.823948, 0, 0, 0, 1, 1,
-0.7230648, -0.7858674, -2.213043, 0, 0, 0, 1, 1,
-0.72201, 0.5701255, -1.88018, 1, 1, 1, 1, 1,
-0.720924, 1.933356, -0.3588115, 1, 1, 1, 1, 1,
-0.7169557, -1.110743, -0.3592415, 1, 1, 1, 1, 1,
-0.7108916, -0.9986797, -3.517823, 1, 1, 1, 1, 1,
-0.7079371, 0.8204494, -1.170808, 1, 1, 1, 1, 1,
-0.7021793, 1.373159, 0.6695337, 1, 1, 1, 1, 1,
-0.7018877, -0.7672956, -4.288529, 1, 1, 1, 1, 1,
-0.6970553, 0.858219, 0.9447942, 1, 1, 1, 1, 1,
-0.6970108, -1.063035, -2.43508, 1, 1, 1, 1, 1,
-0.6967024, -0.5570897, -0.361051, 1, 1, 1, 1, 1,
-0.6868404, -0.7564529, -2.44725, 1, 1, 1, 1, 1,
-0.6836225, -0.1576324, -3.347721, 1, 1, 1, 1, 1,
-0.6802396, 0.4931593, -0.09751695, 1, 1, 1, 1, 1,
-0.6784626, -0.1511808, -3.110969, 1, 1, 1, 1, 1,
-0.65359, 0.2564563, -2.539103, 1, 1, 1, 1, 1,
-0.6528842, -0.8379466, -1.690321, 0, 0, 1, 1, 1,
-0.6506744, 0.2817582, -2.769623, 1, 0, 0, 1, 1,
-0.6484313, 1.069667, -0.8457912, 1, 0, 0, 1, 1,
-0.6455557, -0.4877165, -2.577321, 1, 0, 0, 1, 1,
-0.6446225, -0.7201883, -2.433765, 1, 0, 0, 1, 1,
-0.6414291, -0.2783779, -2.259283, 1, 0, 0, 1, 1,
-0.6376108, -0.5258573, -2.624843, 0, 0, 0, 1, 1,
-0.6247935, 0.1102048, -0.1608984, 0, 0, 0, 1, 1,
-0.623989, 0.2477545, -3.245864, 0, 0, 0, 1, 1,
-0.6236793, 0.8953325, -1.232778, 0, 0, 0, 1, 1,
-0.6185058, -1.422215, -2.6209, 0, 0, 0, 1, 1,
-0.6175227, 0.5081569, -1.306052, 0, 0, 0, 1, 1,
-0.6121607, -0.3776485, -2.296149, 0, 0, 0, 1, 1,
-0.6112812, 1.104168, -2.248594, 1, 1, 1, 1, 1,
-0.6091675, 1.020772, -2.919507, 1, 1, 1, 1, 1,
-0.6028512, -0.8490863, -2.212523, 1, 1, 1, 1, 1,
-0.6027927, 0.3222526, -1.137686, 1, 1, 1, 1, 1,
-0.6008952, -0.4777377, -2.704384, 1, 1, 1, 1, 1,
-0.5960202, 1.281035, -0.9554964, 1, 1, 1, 1, 1,
-0.5932543, 0.4019141, -1.145925, 1, 1, 1, 1, 1,
-0.5928189, -2.337923, -2.660071, 1, 1, 1, 1, 1,
-0.591822, -1.696977, -3.033355, 1, 1, 1, 1, 1,
-0.5844357, -1.156587, -2.788368, 1, 1, 1, 1, 1,
-0.5820057, -1.56561, -4.776943, 1, 1, 1, 1, 1,
-0.5772657, 0.8052247, -2.226877, 1, 1, 1, 1, 1,
-0.5743365, -1.262715, -2.717851, 1, 1, 1, 1, 1,
-0.5734478, -0.02739559, -0.4637235, 1, 1, 1, 1, 1,
-0.5718885, -1.087075, -3.492249, 1, 1, 1, 1, 1,
-0.5694423, 1.748264, -0.5642622, 0, 0, 1, 1, 1,
-0.5656615, -1.228029, -1.845171, 1, 0, 0, 1, 1,
-0.5649289, -2.315415, -0.9614291, 1, 0, 0, 1, 1,
-0.5647935, 2.093267, -0.7042907, 1, 0, 0, 1, 1,
-0.5639312, 0.448231, 0.2248934, 1, 0, 0, 1, 1,
-0.5634454, -1.500794, -3.137952, 1, 0, 0, 1, 1,
-0.5595086, -2.071675, -3.759532, 0, 0, 0, 1, 1,
-0.5495674, 0.004226883, -1.841731, 0, 0, 0, 1, 1,
-0.5486529, 0.6509098, -0.09011409, 0, 0, 0, 1, 1,
-0.5476661, 0.5829801, -0.4905454, 0, 0, 0, 1, 1,
-0.542007, -0.890759, -2.536479, 0, 0, 0, 1, 1,
-0.5406456, -0.2340812, -1.037682, 0, 0, 0, 1, 1,
-0.5397444, -0.3977489, -2.598348, 0, 0, 0, 1, 1,
-0.5328739, -0.05594185, -1.548468, 1, 1, 1, 1, 1,
-0.5314373, -0.6049765, -2.80471, 1, 1, 1, 1, 1,
-0.5312352, 0.1464209, -0.2596466, 1, 1, 1, 1, 1,
-0.5271739, -0.0620117, -1.111037, 1, 1, 1, 1, 1,
-0.5264808, 0.8395122, 0.7999259, 1, 1, 1, 1, 1,
-0.5225524, -1.012823, -1.092849, 1, 1, 1, 1, 1,
-0.5221714, 1.345333, 0.8347679, 1, 1, 1, 1, 1,
-0.5219508, 0.5050122, -0.4473916, 1, 1, 1, 1, 1,
-0.52133, 0.8345627, -0.5907694, 1, 1, 1, 1, 1,
-0.5206855, 1.327234, 0.779921, 1, 1, 1, 1, 1,
-0.5158702, 1.930188, 0.0009372986, 1, 1, 1, 1, 1,
-0.505954, -0.2728294, -2.465093, 1, 1, 1, 1, 1,
-0.5053486, -1.67391, -3.30144, 1, 1, 1, 1, 1,
-0.503713, -0.8864305, -0.7416123, 1, 1, 1, 1, 1,
-0.4996163, -1.086496, -3.855494, 1, 1, 1, 1, 1,
-0.4952543, -0.5649017, -1.151274, 0, 0, 1, 1, 1,
-0.4945895, -0.1470095, -1.197993, 1, 0, 0, 1, 1,
-0.4909013, -0.6674297, -3.595214, 1, 0, 0, 1, 1,
-0.4892921, 0.2589484, -1.300167, 1, 0, 0, 1, 1,
-0.4880678, 0.3416959, 0.8830091, 1, 0, 0, 1, 1,
-0.4863457, 0.9150729, -0.3103454, 1, 0, 0, 1, 1,
-0.4813444, -0.2327476, -1.686271, 0, 0, 0, 1, 1,
-0.4766223, 0.356332, -1.300493, 0, 0, 0, 1, 1,
-0.4757046, 0.1396814, -2.540254, 0, 0, 0, 1, 1,
-0.4729888, 0.2656384, -3.054729, 0, 0, 0, 1, 1,
-0.4664815, -0.3760393, -2.744102, 0, 0, 0, 1, 1,
-0.4606111, -0.4774774, -2.01062, 0, 0, 0, 1, 1,
-0.4595419, -0.6459479, -2.031094, 0, 0, 0, 1, 1,
-0.456071, -0.009749177, -0.08068997, 1, 1, 1, 1, 1,
-0.4549947, -0.2395624, -2.885875, 1, 1, 1, 1, 1,
-0.4525041, -0.1981801, -2.791467, 1, 1, 1, 1, 1,
-0.4514977, -0.1315201, -2.01504, 1, 1, 1, 1, 1,
-0.4505278, -3.186339, -3.487354, 1, 1, 1, 1, 1,
-0.4450848, -1.76842, -2.835717, 1, 1, 1, 1, 1,
-0.4450602, 0.1258289, -0.6140369, 1, 1, 1, 1, 1,
-0.4340163, -1.716976, -2.485647, 1, 1, 1, 1, 1,
-0.4321225, 1.493008, -1.109672, 1, 1, 1, 1, 1,
-0.4309133, -0.5043681, -1.591825, 1, 1, 1, 1, 1,
-0.4302023, -0.2705655, -2.807542, 1, 1, 1, 1, 1,
-0.4224902, 0.8793411, 0.2390933, 1, 1, 1, 1, 1,
-0.4204942, 0.0750982, -1.581462, 1, 1, 1, 1, 1,
-0.4190992, 0.4986398, -1.527259, 1, 1, 1, 1, 1,
-0.4108164, -1.601327, -2.831378, 1, 1, 1, 1, 1,
-0.4088616, 0.695501, -0.07589757, 0, 0, 1, 1, 1,
-0.4074685, -1.521477, -2.91986, 1, 0, 0, 1, 1,
-0.406915, -0.2309115, -1.685216, 1, 0, 0, 1, 1,
-0.4063668, -0.9721481, -3.713861, 1, 0, 0, 1, 1,
-0.4057991, 1.204989, 0.3456946, 1, 0, 0, 1, 1,
-0.3968092, -0.8086674, -1.115338, 1, 0, 0, 1, 1,
-0.3935034, -1.318229, -0.9829639, 0, 0, 0, 1, 1,
-0.3931766, -0.1906949, -2.767305, 0, 0, 0, 1, 1,
-0.3924581, 0.324194, 0.5997674, 0, 0, 0, 1, 1,
-0.3906071, -0.6400088, -2.139635, 0, 0, 0, 1, 1,
-0.3864394, 0.7085419, 0.2593406, 0, 0, 0, 1, 1,
-0.3838553, -0.8363985, -2.736723, 0, 0, 0, 1, 1,
-0.3834118, -1.632639, -3.862002, 0, 0, 0, 1, 1,
-0.3782049, -0.4285468, -2.814653, 1, 1, 1, 1, 1,
-0.3756569, 0.4725645, -0.4503888, 1, 1, 1, 1, 1,
-0.3751718, 1.25172, -1.031553, 1, 1, 1, 1, 1,
-0.3748092, -0.6155393, -3.135866, 1, 1, 1, 1, 1,
-0.3743888, 0.3070531, -0.7047291, 1, 1, 1, 1, 1,
-0.3685679, 0.1719157, -0.8902859, 1, 1, 1, 1, 1,
-0.3683927, 1.925585, 0.8257912, 1, 1, 1, 1, 1,
-0.362489, -0.1935325, -0.7588191, 1, 1, 1, 1, 1,
-0.3521993, 1.522963, -0.809206, 1, 1, 1, 1, 1,
-0.3511832, -0.7049281, -2.429151, 1, 1, 1, 1, 1,
-0.3367052, 0.2413108, -1.63538, 1, 1, 1, 1, 1,
-0.335229, -2.434163, -2.148065, 1, 1, 1, 1, 1,
-0.3301124, -1.20017, -2.267763, 1, 1, 1, 1, 1,
-0.3297705, 0.3951801, 0.536741, 1, 1, 1, 1, 1,
-0.3283512, 1.132768, -0.4213974, 1, 1, 1, 1, 1,
-0.3258377, 0.2041523, -2.415232, 0, 0, 1, 1, 1,
-0.3257871, -0.5329179, -3.308621, 1, 0, 0, 1, 1,
-0.325405, -0.38603, -1.313441, 1, 0, 0, 1, 1,
-0.3250038, -0.4512847, -3.022579, 1, 0, 0, 1, 1,
-0.3249271, 0.483918, -1.203418, 1, 0, 0, 1, 1,
-0.3180135, -0.1166659, -0.9397161, 1, 0, 0, 1, 1,
-0.3097529, -0.8490626, -4.817679, 0, 0, 0, 1, 1,
-0.3048304, 0.3985977, 1.155911, 0, 0, 0, 1, 1,
-0.3037087, -0.9978728, -4.184924, 0, 0, 0, 1, 1,
-0.3029249, 1.063895, 1.047772, 0, 0, 0, 1, 1,
-0.3023059, -0.701206, -1.465689, 0, 0, 0, 1, 1,
-0.3008981, -0.739139, -2.000533, 0, 0, 0, 1, 1,
-0.3003815, -1.049991, -3.343381, 0, 0, 0, 1, 1,
-0.2998983, 0.06452816, -0.9581529, 1, 1, 1, 1, 1,
-0.299532, 1.516175, 1.023885, 1, 1, 1, 1, 1,
-0.2973249, -0.3748416, -2.340932, 1, 1, 1, 1, 1,
-0.2944511, 0.242539, -0.1361716, 1, 1, 1, 1, 1,
-0.2919619, -0.7377472, -3.157562, 1, 1, 1, 1, 1,
-0.2892388, 0.04237889, -1.850681, 1, 1, 1, 1, 1,
-0.2871037, -0.9377018, -3.175465, 1, 1, 1, 1, 1,
-0.283925, 0.7982666, -0.8379924, 1, 1, 1, 1, 1,
-0.2810215, 0.5729728, 0.4332405, 1, 1, 1, 1, 1,
-0.275739, 2.170213, -0.1560605, 1, 1, 1, 1, 1,
-0.2727027, -0.2588836, -2.270649, 1, 1, 1, 1, 1,
-0.2719838, -1.069404, -3.877547, 1, 1, 1, 1, 1,
-0.2713279, -0.01297974, -2.190249, 1, 1, 1, 1, 1,
-0.2703873, 0.5433181, 1.374545, 1, 1, 1, 1, 1,
-0.2628614, 0.3789089, -0.1587694, 1, 1, 1, 1, 1,
-0.2616268, 1.794084, 0.09393171, 0, 0, 1, 1, 1,
-0.2609922, 0.3880739, -0.1102395, 1, 0, 0, 1, 1,
-0.2553557, -0.9319894, -3.754064, 1, 0, 0, 1, 1,
-0.2488931, 0.3865506, -0.6419828, 1, 0, 0, 1, 1,
-0.247252, -1.25073, -3.110149, 1, 0, 0, 1, 1,
-0.2429397, 0.7644302, 2.910995, 1, 0, 0, 1, 1,
-0.2371331, 1.647918, 0.644175, 0, 0, 0, 1, 1,
-0.234044, -1.220211, -1.466844, 0, 0, 0, 1, 1,
-0.2296521, -1.674957, -2.49054, 0, 0, 0, 1, 1,
-0.2226363, -1.528774, -3.338073, 0, 0, 0, 1, 1,
-0.2172652, -0.3797232, -2.864491, 0, 0, 0, 1, 1,
-0.2164581, 0.8347508, 0.54803, 0, 0, 0, 1, 1,
-0.2148633, 0.9681857, -1.007906, 0, 0, 0, 1, 1,
-0.2136627, -1.657296, -5.147218, 1, 1, 1, 1, 1,
-0.2125693, -1.045636, -2.578785, 1, 1, 1, 1, 1,
-0.2108947, -0.9738895, -3.110116, 1, 1, 1, 1, 1,
-0.2089761, -0.7621754, -3.143185, 1, 1, 1, 1, 1,
-0.2072695, 0.4762696, -0.3074798, 1, 1, 1, 1, 1,
-0.2003533, -1.587263, -2.402544, 1, 1, 1, 1, 1,
-0.2002663, 0.4157873, -0.8628998, 1, 1, 1, 1, 1,
-0.1993601, -2.540372, -2.587557, 1, 1, 1, 1, 1,
-0.1976332, 0.38118, -1.873571, 1, 1, 1, 1, 1,
-0.1871043, 2.749751, 0.8178446, 1, 1, 1, 1, 1,
-0.1854467, -1.350084, -2.551672, 1, 1, 1, 1, 1,
-0.1831905, -0.09535455, -3.639923, 1, 1, 1, 1, 1,
-0.1806191, 1.837608, -1.503868, 1, 1, 1, 1, 1,
-0.1738439, -0.9033985, -3.223113, 1, 1, 1, 1, 1,
-0.1735922, 0.007142244, -1.352881, 1, 1, 1, 1, 1,
-0.1699803, 0.465202, 1.158236, 0, 0, 1, 1, 1,
-0.1667311, 0.6926132, -2.627363, 1, 0, 0, 1, 1,
-0.1652401, -0.3680691, -2.928814, 1, 0, 0, 1, 1,
-0.1624099, 0.9326093, 1.188885, 1, 0, 0, 1, 1,
-0.1488485, -0.4094465, -4.876529, 1, 0, 0, 1, 1,
-0.1482129, -0.1423038, -2.411135, 1, 0, 0, 1, 1,
-0.1476444, -0.2707023, -3.334496, 0, 0, 0, 1, 1,
-0.1438692, 0.6171969, 0.08042086, 0, 0, 0, 1, 1,
-0.134156, -1.118161, -4.15144, 0, 0, 0, 1, 1,
-0.1339029, 1.363803, 0.326961, 0, 0, 0, 1, 1,
-0.1276877, 0.142791, -0.007121877, 0, 0, 0, 1, 1,
-0.1269764, -0.1130256, -1.835554, 0, 0, 0, 1, 1,
-0.1259656, 0.1211925, -1.691355, 0, 0, 0, 1, 1,
-0.1259571, -0.7119224, -5.128984, 1, 1, 1, 1, 1,
-0.1244197, -0.114113, -2.268457, 1, 1, 1, 1, 1,
-0.1232116, -0.7539555, -3.616004, 1, 1, 1, 1, 1,
-0.1201564, -0.2051036, -3.13187, 1, 1, 1, 1, 1,
-0.1198488, 0.9133922, 0.1108056, 1, 1, 1, 1, 1,
-0.1181432, -0.2316004, -3.289504, 1, 1, 1, 1, 1,
-0.1177387, 0.004356528, -0.279122, 1, 1, 1, 1, 1,
-0.1164882, -1.115657, -2.861383, 1, 1, 1, 1, 1,
-0.1110983, -0.07117119, -2.127617, 1, 1, 1, 1, 1,
-0.1101961, -0.9696814, -3.324965, 1, 1, 1, 1, 1,
-0.109089, 1.359523, 1.731111, 1, 1, 1, 1, 1,
-0.1047812, -0.3602575, -2.421422, 1, 1, 1, 1, 1,
-0.1036484, -0.6981165, -2.394114, 1, 1, 1, 1, 1,
-0.1026536, 0.8870322, -1.896174, 1, 1, 1, 1, 1,
-0.09402487, 1.759735, 1.497914, 1, 1, 1, 1, 1,
-0.09399364, 1.135387, -1.355326, 0, 0, 1, 1, 1,
-0.09123506, 0.4542893, -0.2691274, 1, 0, 0, 1, 1,
-0.09103223, -0.1621261, -3.759649, 1, 0, 0, 1, 1,
-0.09026795, -1.785915, -4.357256, 1, 0, 0, 1, 1,
-0.08928041, 0.7083061, 0.325478, 1, 0, 0, 1, 1,
-0.08780152, -1.186321, -2.479032, 1, 0, 0, 1, 1,
-0.08532241, 1.183418, 1.677738, 0, 0, 0, 1, 1,
-0.08309198, 1.690717, -0.4646166, 0, 0, 0, 1, 1,
-0.07879894, 0.281004, -0.2817041, 0, 0, 0, 1, 1,
-0.07787887, 0.3594789, -0.3749824, 0, 0, 0, 1, 1,
-0.07439777, -1.125918, -4.889012, 0, 0, 0, 1, 1,
-0.07322562, 0.6431953, -1.635177, 0, 0, 0, 1, 1,
-0.07072081, -1.332823, -1.578641, 0, 0, 0, 1, 1,
-0.06727481, 0.3884066, 0.2383309, 1, 1, 1, 1, 1,
-0.06684905, -1.09809, -4.190463, 1, 1, 1, 1, 1,
-0.06388845, 0.3063349, -0.9125684, 1, 1, 1, 1, 1,
-0.06303883, -0.2394985, -4.595995, 1, 1, 1, 1, 1,
-0.06301324, -0.6184127, -3.281058, 1, 1, 1, 1, 1,
-0.06159365, 1.665079, -0.3812335, 1, 1, 1, 1, 1,
-0.06142294, -0.8225685, -4.479017, 1, 1, 1, 1, 1,
-0.05717567, 0.8919684, 1.939834, 1, 1, 1, 1, 1,
-0.05511343, 0.731797, 1.009687, 1, 1, 1, 1, 1,
-0.05068548, 0.865976, 0.1726145, 1, 1, 1, 1, 1,
-0.04416134, 0.1649078, 0.1793153, 1, 1, 1, 1, 1,
-0.04378703, -1.445281, -3.755453, 1, 1, 1, 1, 1,
-0.04324939, -1.678959, -4.271369, 1, 1, 1, 1, 1,
-0.04212458, -1.159418, -3.091022, 1, 1, 1, 1, 1,
-0.04094451, 1.822241, 0.05685267, 1, 1, 1, 1, 1,
-0.0406446, -0.7908197, -4.546333, 0, 0, 1, 1, 1,
-0.04058559, 0.5517557, 0.4265151, 1, 0, 0, 1, 1,
-0.03990167, 1.159518, -0.01935906, 1, 0, 0, 1, 1,
-0.03986287, 0.9987398, 0.5354664, 1, 0, 0, 1, 1,
-0.03915485, 1.282915, 0.09183387, 1, 0, 0, 1, 1,
-0.03787986, 0.810608, 0.3973605, 1, 0, 0, 1, 1,
-0.0378341, -0.7248991, -0.8966588, 0, 0, 0, 1, 1,
-0.03003695, 0.9407675, 0.5812707, 0, 0, 0, 1, 1,
-0.02831812, -0.71983, -3.922346, 0, 0, 0, 1, 1,
-0.02746929, -1.722373, -2.698388, 0, 0, 0, 1, 1,
-0.02723965, -0.9303589, -2.441388, 0, 0, 0, 1, 1,
-0.02663444, -0.2291026, -3.384849, 0, 0, 0, 1, 1,
-0.0260392, -1.202657, -3.128857, 0, 0, 0, 1, 1,
-0.02513614, -0.3639379, -3.509765, 1, 1, 1, 1, 1,
-0.02353546, 0.2962383, -1.670618, 1, 1, 1, 1, 1,
-0.0231293, 0.7309697, -0.5455306, 1, 1, 1, 1, 1,
-0.01708186, 1.579412, 1.160235, 1, 1, 1, 1, 1,
-0.01310935, 0.1856987, -1.425769, 1, 1, 1, 1, 1,
-0.01174625, -3.4543, -2.708458, 1, 1, 1, 1, 1,
-0.01120543, 0.08070856, 0.653396, 1, 1, 1, 1, 1,
-0.01087486, 1.343608, 1.1275, 1, 1, 1, 1, 1,
-0.01011992, -0.758331, -4.384548, 1, 1, 1, 1, 1,
-0.009853152, 0.5160667, 1.600664, 1, 1, 1, 1, 1,
-0.007068716, -0.9708613, -3.249337, 1, 1, 1, 1, 1,
-0.00301599, 1.355247, -1.523006, 1, 1, 1, 1, 1,
0.008083101, -0.5230112, 3.539768, 1, 1, 1, 1, 1,
0.01162886, -1.071639, 3.536537, 1, 1, 1, 1, 1,
0.01431981, 1.446142, 0.07083897, 1, 1, 1, 1, 1,
0.01900665, -0.02269994, 3.785083, 0, 0, 1, 1, 1,
0.01947449, -0.5770296, 3.495732, 1, 0, 0, 1, 1,
0.02030544, -1.089426, 2.481734, 1, 0, 0, 1, 1,
0.02493876, -0.9753155, 2.688968, 1, 0, 0, 1, 1,
0.02583056, 0.7617584, -1.574372, 1, 0, 0, 1, 1,
0.02651115, 0.8764285, -0.2408991, 1, 0, 0, 1, 1,
0.02808868, -0.2026555, 2.170739, 0, 0, 0, 1, 1,
0.03131685, -0.8325791, 3.724234, 0, 0, 0, 1, 1,
0.03554156, 0.5555603, 0.1211496, 0, 0, 0, 1, 1,
0.03564106, 1.436459, -1.23263, 0, 0, 0, 1, 1,
0.03694386, -0.8846325, 3.040861, 0, 0, 0, 1, 1,
0.03816009, -1.145661, 2.714477, 0, 0, 0, 1, 1,
0.03898363, -1.47868, 1.903189, 0, 0, 0, 1, 1,
0.04014475, -0.7710401, 2.295174, 1, 1, 1, 1, 1,
0.04196692, -0.099511, 2.762014, 1, 1, 1, 1, 1,
0.04277386, -0.2857247, 3.615841, 1, 1, 1, 1, 1,
0.04320549, -0.2803169, 3.261749, 1, 1, 1, 1, 1,
0.04528444, -0.9980498, 2.068977, 1, 1, 1, 1, 1,
0.04738461, 0.5613014, -1.327457, 1, 1, 1, 1, 1,
0.05368211, -0.3021569, 2.473025, 1, 1, 1, 1, 1,
0.05432456, 0.1914616, 0.5154906, 1, 1, 1, 1, 1,
0.05578306, 0.08872477, 1.668322, 1, 1, 1, 1, 1,
0.05697876, -0.7607415, 2.853899, 1, 1, 1, 1, 1,
0.05722073, 0.3609599, 1.165017, 1, 1, 1, 1, 1,
0.0595589, -0.8040783, 4.474208, 1, 1, 1, 1, 1,
0.06266876, 0.09189294, -0.9769683, 1, 1, 1, 1, 1,
0.06566814, -0.4022965, 3.909226, 1, 1, 1, 1, 1,
0.06634432, 1.296724, 1.238195, 1, 1, 1, 1, 1,
0.06877608, 1.705604, 0.9349014, 0, 0, 1, 1, 1,
0.06965339, -1.506731, 1.675186, 1, 0, 0, 1, 1,
0.07074143, -0.3820964, 3.617472, 1, 0, 0, 1, 1,
0.07258263, 0.6586714, 1.353551, 1, 0, 0, 1, 1,
0.07576822, 0.2678171, 0.6378105, 1, 0, 0, 1, 1,
0.07645487, -0.948455, 2.505949, 1, 0, 0, 1, 1,
0.07670374, 1.550858, -0.2865422, 0, 0, 0, 1, 1,
0.07818584, -1.140494, 3.300707, 0, 0, 0, 1, 1,
0.0786001, 0.7527986, 0.9309413, 0, 0, 0, 1, 1,
0.07983612, -0.0657329, 4.498013, 0, 0, 0, 1, 1,
0.0825131, 0.3400089, 0.6435205, 0, 0, 0, 1, 1,
0.08689429, 0.8666353, 0.8818832, 0, 0, 0, 1, 1,
0.0873076, -0.3548628, 2.749718, 0, 0, 0, 1, 1,
0.09287221, -0.4297132, 3.579197, 1, 1, 1, 1, 1,
0.09531415, -0.1754224, 3.245089, 1, 1, 1, 1, 1,
0.09809333, -0.2719505, 2.82765, 1, 1, 1, 1, 1,
0.09957317, 0.5401218, 0.1404335, 1, 1, 1, 1, 1,
0.09978617, 0.0448666, 0.9957505, 1, 1, 1, 1, 1,
0.1026813, 0.8847714, 0.4839161, 1, 1, 1, 1, 1,
0.1070181, 0.1297187, -0.206347, 1, 1, 1, 1, 1,
0.1085271, -1.406297, 1.888953, 1, 1, 1, 1, 1,
0.109812, 0.8213544, 0.8214958, 1, 1, 1, 1, 1,
0.1105558, 0.5482685, -0.09423758, 1, 1, 1, 1, 1,
0.1106263, -1.560872, 1.974707, 1, 1, 1, 1, 1,
0.1116571, -0.04303247, 3.411889, 1, 1, 1, 1, 1,
0.1118137, 1.267639, -0.7583903, 1, 1, 1, 1, 1,
0.1147648, -0.08007236, 1.29747, 1, 1, 1, 1, 1,
0.1194755, 0.8584186, -0.1009181, 1, 1, 1, 1, 1,
0.1226745, -0.9913927, 3.56795, 0, 0, 1, 1, 1,
0.1241543, -1.260837, 1.840313, 1, 0, 0, 1, 1,
0.1267316, 0.5073948, 0.6582863, 1, 0, 0, 1, 1,
0.1322382, 1.11874, 0.172882, 1, 0, 0, 1, 1,
0.1325428, 0.2339468, 1.652504, 1, 0, 0, 1, 1,
0.133131, -1.906617, 2.514084, 1, 0, 0, 1, 1,
0.1405848, -0.3228583, 1.958859, 0, 0, 0, 1, 1,
0.1421166, 0.209142, 1.557337, 0, 0, 0, 1, 1,
0.143916, -0.2846673, 2.006211, 0, 0, 0, 1, 1,
0.1442017, 0.2250232, -0.501798, 0, 0, 0, 1, 1,
0.1474492, 0.06981212, 0.7895115, 0, 0, 0, 1, 1,
0.1504373, 1.34361, -1.162281, 0, 0, 0, 1, 1,
0.1507387, -1.292413, 3.059018, 0, 0, 0, 1, 1,
0.1595356, -0.09439011, 1.712176, 1, 1, 1, 1, 1,
0.1627766, 0.6623423, -0.1951054, 1, 1, 1, 1, 1,
0.1629193, -0.1655204, 2.688431, 1, 1, 1, 1, 1,
0.1650165, -0.8385442, 2.900719, 1, 1, 1, 1, 1,
0.1667158, 2.162674, 0.4762875, 1, 1, 1, 1, 1,
0.1678604, -1.076393, 3.480634, 1, 1, 1, 1, 1,
0.1745168, 0.4602749, 0.8883274, 1, 1, 1, 1, 1,
0.1753884, -0.6258031, 1.706425, 1, 1, 1, 1, 1,
0.1802933, -0.175254, 1.501298, 1, 1, 1, 1, 1,
0.1862902, 0.08828288, 0.3881358, 1, 1, 1, 1, 1,
0.1867685, 1.179947, -0.3004219, 1, 1, 1, 1, 1,
0.1877086, -1.651358, 3.68556, 1, 1, 1, 1, 1,
0.1942445, 1.102086, 1.794467, 1, 1, 1, 1, 1,
0.1960957, -0.9084119, 2.638799, 1, 1, 1, 1, 1,
0.1969389, -0.3956661, 2.086156, 1, 1, 1, 1, 1,
0.2004965, -0.8669742, 3.908392, 0, 0, 1, 1, 1,
0.200928, -0.2992978, 3.085885, 1, 0, 0, 1, 1,
0.2010975, 0.2869108, 2.119151, 1, 0, 0, 1, 1,
0.2045486, -0.567384, 2.240713, 1, 0, 0, 1, 1,
0.2090485, 1.08286, -1.075175, 1, 0, 0, 1, 1,
0.2197589, -0.7604339, 0.9907425, 1, 0, 0, 1, 1,
0.2200735, 0.1886875, 1.081327, 0, 0, 0, 1, 1,
0.2201276, 0.3067136, -0.3265395, 0, 0, 0, 1, 1,
0.2204195, -1.271057, 2.273538, 0, 0, 0, 1, 1,
0.2230785, -2.012913, 2.360448, 0, 0, 0, 1, 1,
0.2282548, -0.77746, 3.261559, 0, 0, 0, 1, 1,
0.2285063, 2.069048, 0.07507305, 0, 0, 0, 1, 1,
0.2285088, 0.5274526, -1.543707, 0, 0, 0, 1, 1,
0.2335767, -0.3871705, 3.516052, 1, 1, 1, 1, 1,
0.236687, -1.436802, 3.143588, 1, 1, 1, 1, 1,
0.2371609, -0.1574491, 2.110919, 1, 1, 1, 1, 1,
0.2375514, 1.025072, -0.1398491, 1, 1, 1, 1, 1,
0.2403438, -0.3700814, 4.191567, 1, 1, 1, 1, 1,
0.2419909, 0.1522168, 2.070877, 1, 1, 1, 1, 1,
0.2421166, -2.129976, 1.395403, 1, 1, 1, 1, 1,
0.243189, -0.07126339, 1.700507, 1, 1, 1, 1, 1,
0.2445003, -0.8301423, 3.347288, 1, 1, 1, 1, 1,
0.245807, 0.9866115, 2.79052, 1, 1, 1, 1, 1,
0.2483108, -0.5694408, 4.715824, 1, 1, 1, 1, 1,
0.2489117, 1.184055, -0.04604067, 1, 1, 1, 1, 1,
0.2517447, 0.9739638, 0.6080915, 1, 1, 1, 1, 1,
0.2547217, 0.3184306, 1.834165, 1, 1, 1, 1, 1,
0.2571218, 1.126683, 1.334058, 1, 1, 1, 1, 1,
0.25789, 0.2525795, 1.024045, 0, 0, 1, 1, 1,
0.2581517, -0.09184477, 1.829417, 1, 0, 0, 1, 1,
0.2608197, 1.287687, 0.882054, 1, 0, 0, 1, 1,
0.2679236, 0.1894366, 0.930041, 1, 0, 0, 1, 1,
0.2682832, -0.7295575, 3.202002, 1, 0, 0, 1, 1,
0.2691007, 0.8884754, 0.8395246, 1, 0, 0, 1, 1,
0.2748376, 2.673514, 0.3700711, 0, 0, 0, 1, 1,
0.2921432, -0.6103194, 5.280225, 0, 0, 0, 1, 1,
0.296823, -0.5277051, 2.983369, 0, 0, 0, 1, 1,
0.3090793, 0.6063324, 1.367217, 0, 0, 0, 1, 1,
0.3104, -1.921912, 2.03775, 0, 0, 0, 1, 1,
0.3110518, -0.4462, 2.991318, 0, 0, 0, 1, 1,
0.3111376, 1.008574, -0.08449978, 0, 0, 0, 1, 1,
0.3112547, 0.9213462, 0.9326005, 1, 1, 1, 1, 1,
0.3135017, -1.08702, 2.987567, 1, 1, 1, 1, 1,
0.3150424, 1.384967, -0.8838571, 1, 1, 1, 1, 1,
0.3170181, -1.188351, 2.131337, 1, 1, 1, 1, 1,
0.319011, 2.338756, 0.436589, 1, 1, 1, 1, 1,
0.3197098, 0.0588145, 1.622568, 1, 1, 1, 1, 1,
0.3230402, 1.271058, 1.693069, 1, 1, 1, 1, 1,
0.3257245, 0.9055609, 1.754487, 1, 1, 1, 1, 1,
0.3262915, 0.8616779, 0.7461091, 1, 1, 1, 1, 1,
0.3297888, -0.9504588, 1.85806, 1, 1, 1, 1, 1,
0.3358094, 0.2579863, -0.770991, 1, 1, 1, 1, 1,
0.3447849, -0.1702607, 2.000289, 1, 1, 1, 1, 1,
0.3455548, -0.9001214, 3.631474, 1, 1, 1, 1, 1,
0.3467061, -0.5851698, 2.340077, 1, 1, 1, 1, 1,
0.3467094, -1.310325, 1.970095, 1, 1, 1, 1, 1,
0.3477302, 0.3441207, -1.370497, 0, 0, 1, 1, 1,
0.3496044, -0.8643116, 4.238479, 1, 0, 0, 1, 1,
0.3602577, -0.7408181, 4.09836, 1, 0, 0, 1, 1,
0.3607732, -0.7921167, 3.388532, 1, 0, 0, 1, 1,
0.3615153, 0.752667, -1.201761, 1, 0, 0, 1, 1,
0.3634084, -0.2250413, 2.806573, 1, 0, 0, 1, 1,
0.3649246, -0.7751369, 3.76524, 0, 0, 0, 1, 1,
0.3650894, 0.5831174, 0.5828392, 0, 0, 0, 1, 1,
0.3676517, -1.677143, 2.842026, 0, 0, 0, 1, 1,
0.3732206, 0.9182509, -0.4365118, 0, 0, 0, 1, 1,
0.3803045, 0.04377265, 0.8761393, 0, 0, 0, 1, 1,
0.3807546, -0.7706538, 3.48753, 0, 0, 0, 1, 1,
0.3823013, 0.3263271, -0.1021649, 0, 0, 0, 1, 1,
0.3825566, -1.832413, 2.936935, 1, 1, 1, 1, 1,
0.3892232, -0.08738214, 1.547907, 1, 1, 1, 1, 1,
0.3901182, -1.337003, 3.782322, 1, 1, 1, 1, 1,
0.3934152, 1.321791, -1.151264, 1, 1, 1, 1, 1,
0.3940003, 0.8694177, 0.1180241, 1, 1, 1, 1, 1,
0.3983012, -0.03620053, 1.348771, 1, 1, 1, 1, 1,
0.3985293, 1.88771, 1.03161, 1, 1, 1, 1, 1,
0.4006961, 0.8720127, 0.4559753, 1, 1, 1, 1, 1,
0.4041642, -0.4016682, 3.92352, 1, 1, 1, 1, 1,
0.4063534, -0.4324791, 2.698929, 1, 1, 1, 1, 1,
0.4111173, 1.522698, -1.134043, 1, 1, 1, 1, 1,
0.4113291, -0.4181459, 1.898752, 1, 1, 1, 1, 1,
0.4124501, -0.2455615, 3.253971, 1, 1, 1, 1, 1,
0.4134365, -1.140888, 1.087388, 1, 1, 1, 1, 1,
0.4235047, -0.5362796, 3.371676, 1, 1, 1, 1, 1,
0.425509, -1.001521, 3.057007, 0, 0, 1, 1, 1,
0.4274508, -0.4399917, 1.538149, 1, 0, 0, 1, 1,
0.4286259, 0.7553502, 2.677565, 1, 0, 0, 1, 1,
0.4288103, -0.3309842, 3.730465, 1, 0, 0, 1, 1,
0.4357145, 1.788137, 1.183175, 1, 0, 0, 1, 1,
0.4402679, -0.151655, 0.8476137, 1, 0, 0, 1, 1,
0.4444321, -0.01792518, 1.815164, 0, 0, 0, 1, 1,
0.4482732, -0.3627222, 1.385653, 0, 0, 0, 1, 1,
0.4517489, -0.290145, 1.145753, 0, 0, 0, 1, 1,
0.4588668, -1.047938, 3.841409, 0, 0, 0, 1, 1,
0.459933, -0.4786228, 3.746082, 0, 0, 0, 1, 1,
0.4639636, -0.3331391, 2.58226, 0, 0, 0, 1, 1,
0.4643027, -0.8123743, 3.071059, 0, 0, 0, 1, 1,
0.4670311, 0.07460858, 0.9988452, 1, 1, 1, 1, 1,
0.469456, 1.100977, 0.3924062, 1, 1, 1, 1, 1,
0.4726647, -1.412832, 3.055209, 1, 1, 1, 1, 1,
0.4824376, -0.5923217, 2.934443, 1, 1, 1, 1, 1,
0.4850482, 2.724239, 0.1016934, 1, 1, 1, 1, 1,
0.4883927, -0.1971431, 1.679551, 1, 1, 1, 1, 1,
0.4939929, -1.377823, 2.697407, 1, 1, 1, 1, 1,
0.4942924, 1.085613, 1.292697, 1, 1, 1, 1, 1,
0.4992291, -0.7461192, 2.468481, 1, 1, 1, 1, 1,
0.5020921, -0.65282, 3.391391, 1, 1, 1, 1, 1,
0.5083316, 0.1507894, 1.780373, 1, 1, 1, 1, 1,
0.5088192, 1.2681, 0.01094963, 1, 1, 1, 1, 1,
0.5097447, -1.540678, 2.061748, 1, 1, 1, 1, 1,
0.5101742, -0.9162022, 3.626921, 1, 1, 1, 1, 1,
0.5133776, 0.3294692, 0.0954145, 1, 1, 1, 1, 1,
0.5149611, 0.3801612, 2.05825, 0, 0, 1, 1, 1,
0.5157174, 1.065643, 0.009675772, 1, 0, 0, 1, 1,
0.5222737, -0.5976231, 2.322929, 1, 0, 0, 1, 1,
0.5234947, 0.4608742, -1.124518, 1, 0, 0, 1, 1,
0.5244063, 0.2779889, 1.994372, 1, 0, 0, 1, 1,
0.5261194, -0.6536927, 3.383286, 1, 0, 0, 1, 1,
0.5274305, -1.806602, 3.161444, 0, 0, 0, 1, 1,
0.5294824, 0.3123291, 0.8460752, 0, 0, 0, 1, 1,
0.5295134, 1.739363, -0.1959837, 0, 0, 0, 1, 1,
0.537835, 0.4685862, -0.4665505, 0, 0, 0, 1, 1,
0.5383636, 0.4549596, -0.9235666, 0, 0, 0, 1, 1,
0.539307, -0.9547266, 2.281094, 0, 0, 0, 1, 1,
0.5401406, -0.2393065, 2.695026, 0, 0, 0, 1, 1,
0.5423976, -0.6574984, 3.902596, 1, 1, 1, 1, 1,
0.5430811, 2.301239, 0.6852382, 1, 1, 1, 1, 1,
0.5462747, -1.974056, 3.021692, 1, 1, 1, 1, 1,
0.5469385, 1.575449, -0.003517328, 1, 1, 1, 1, 1,
0.5551716, -0.9774187, 2.187539, 1, 1, 1, 1, 1,
0.563867, 0.1174738, 1.918987, 1, 1, 1, 1, 1,
0.5666098, 0.8213132, 1.608517, 1, 1, 1, 1, 1,
0.5667035, -0.4126144, 2.3048, 1, 1, 1, 1, 1,
0.5701612, 0.5252243, 0.3330616, 1, 1, 1, 1, 1,
0.5741749, 0.4543486, 0.5892788, 1, 1, 1, 1, 1,
0.5752002, -2.01605, 2.948286, 1, 1, 1, 1, 1,
0.5819107, -0.08098701, 2.644876, 1, 1, 1, 1, 1,
0.585402, -0.7984561, 2.200269, 1, 1, 1, 1, 1,
0.5862225, -0.8609368, 3.211619, 1, 1, 1, 1, 1,
0.5879017, 1.707009, 0.0395206, 1, 1, 1, 1, 1,
0.5986777, -1.139617, 2.419016, 0, 0, 1, 1, 1,
0.5998292, -1.853469, 3.557277, 1, 0, 0, 1, 1,
0.6034669, -0.1636026, 1.455263, 1, 0, 0, 1, 1,
0.6039472, 0.5046502, 1.182348, 1, 0, 0, 1, 1,
0.6048895, 0.9719332, 0.0115589, 1, 0, 0, 1, 1,
0.6072684, -0.6279846, 1.761202, 1, 0, 0, 1, 1,
0.6101978, 0.1533478, 0.4581911, 0, 0, 0, 1, 1,
0.6109517, 0.6979265, 0.02013623, 0, 0, 0, 1, 1,
0.6136915, 0.7852774, 0.2949241, 0, 0, 0, 1, 1,
0.6214961, 0.3619724, 0.3432504, 0, 0, 0, 1, 1,
0.6272068, -1.103597, 1.425057, 0, 0, 0, 1, 1,
0.6282615, 0.5767897, 2.509773, 0, 0, 0, 1, 1,
0.6298711, 1.036231, 0.09231614, 0, 0, 0, 1, 1,
0.6305351, 2.15671, 1.776237, 1, 1, 1, 1, 1,
0.6319441, -0.2687326, 2.620808, 1, 1, 1, 1, 1,
0.633195, 0.4644201, -0.293841, 1, 1, 1, 1, 1,
0.6356936, 0.641512, 1.460602, 1, 1, 1, 1, 1,
0.6405234, -1.51134, 2.280114, 1, 1, 1, 1, 1,
0.6408345, 1.040286, -1.017755, 1, 1, 1, 1, 1,
0.6436317, -0.369911, 0.5899544, 1, 1, 1, 1, 1,
0.6464188, 0.7449798, 1.702015, 1, 1, 1, 1, 1,
0.6495499, -0.5503768, 3.494943, 1, 1, 1, 1, 1,
0.6506637, -0.1133457, 2.672218, 1, 1, 1, 1, 1,
0.651023, -0.2976692, 2.745502, 1, 1, 1, 1, 1,
0.6522828, -0.4555948, 2.636901, 1, 1, 1, 1, 1,
0.6529447, -1.919488, 4.062848, 1, 1, 1, 1, 1,
0.6548578, -0.2080663, 0.4582952, 1, 1, 1, 1, 1,
0.6555613, -0.9671701, 1.162038, 1, 1, 1, 1, 1,
0.6557704, 0.08632528, 2.408962, 0, 0, 1, 1, 1,
0.6596514, 0.6688022, 0.6853334, 1, 0, 0, 1, 1,
0.663128, 0.3209847, -0.0360515, 1, 0, 0, 1, 1,
0.6657342, 0.03849149, 1.904639, 1, 0, 0, 1, 1,
0.6657657, -1.845846, 2.082198, 1, 0, 0, 1, 1,
0.6670663, 1.589098, -0.05793733, 1, 0, 0, 1, 1,
0.6709815, 0.1570705, 2.689453, 0, 0, 0, 1, 1,
0.6721284, 0.186419, 1.843646, 0, 0, 0, 1, 1,
0.6737114, 0.8071941, 2.843345, 0, 0, 0, 1, 1,
0.676124, 0.5252852, -0.329773, 0, 0, 0, 1, 1,
0.6766431, -0.0002219649, 1.092923, 0, 0, 0, 1, 1,
0.6770027, 0.574529, 0.6560341, 0, 0, 0, 1, 1,
0.6806343, 0.4129106, -0.1416451, 0, 0, 0, 1, 1,
0.6917241, 1.952095, 1.508725, 1, 1, 1, 1, 1,
0.6932534, -0.3840386, 2.728441, 1, 1, 1, 1, 1,
0.6982862, -1.945457, 2.442152, 1, 1, 1, 1, 1,
0.7015056, -0.3109523, 2.771016, 1, 1, 1, 1, 1,
0.7026561, 0.6981347, 1.247014, 1, 1, 1, 1, 1,
0.7066712, 1.974919, 0.8030671, 1, 1, 1, 1, 1,
0.7102415, 0.787071, 1.297362, 1, 1, 1, 1, 1,
0.7141315, 0.7312717, 0.1219746, 1, 1, 1, 1, 1,
0.7247843, 0.236877, 1.502902, 1, 1, 1, 1, 1,
0.7259836, 1.943924, -0.2411485, 1, 1, 1, 1, 1,
0.7261047, 0.4148791, 1.501006, 1, 1, 1, 1, 1,
0.7268983, -0.2993607, 1.325435, 1, 1, 1, 1, 1,
0.7335715, 0.2560149, 1.673256, 1, 1, 1, 1, 1,
0.7369505, 1.088996, 0.05826868, 1, 1, 1, 1, 1,
0.7379777, -0.5620431, 1.349748, 1, 1, 1, 1, 1,
0.740855, 0.5294033, -0.3506193, 0, 0, 1, 1, 1,
0.7415044, 2.160643, 0.8570022, 1, 0, 0, 1, 1,
0.7566472, -0.5825061, 3.633372, 1, 0, 0, 1, 1,
0.7611371, 0.4579363, 1.627378, 1, 0, 0, 1, 1,
0.7688519, -0.03384516, 0.9076663, 1, 0, 0, 1, 1,
0.7830952, 1.380949, 0.5653146, 1, 0, 0, 1, 1,
0.7835035, 1.124489, -0.8758579, 0, 0, 0, 1, 1,
0.7897896, -1.960032, 2.196744, 0, 0, 0, 1, 1,
0.7907088, -1.176072, 3.124366, 0, 0, 0, 1, 1,
0.7910812, -1.094537, 4.109264, 0, 0, 0, 1, 1,
0.7939979, 0.3721752, 0.514725, 0, 0, 0, 1, 1,
0.8031752, -0.1662366, 1.377464, 0, 0, 0, 1, 1,
0.8064457, 1.394018, 1.180442, 0, 0, 0, 1, 1,
0.8080434, 0.8907434, 0.9406466, 1, 1, 1, 1, 1,
0.8082386, -0.4959617, 3.467257, 1, 1, 1, 1, 1,
0.8100622, 0.746173, -1.122143, 1, 1, 1, 1, 1,
0.8168331, 1.068095, 2.400954, 1, 1, 1, 1, 1,
0.818342, -0.08265526, 3.322633, 1, 1, 1, 1, 1,
0.8261179, -0.6438049, 0.7147655, 1, 1, 1, 1, 1,
0.8266618, 0.241789, 2.756037, 1, 1, 1, 1, 1,
0.8342189, -1.469609, 2.858469, 1, 1, 1, 1, 1,
0.8386513, 0.2936096, 0.6506264, 1, 1, 1, 1, 1,
0.8432056, 0.8701526, 0.1297065, 1, 1, 1, 1, 1,
0.8482835, 0.08550585, 0.1592189, 1, 1, 1, 1, 1,
0.8514042, 0.7690238, 2.54333, 1, 1, 1, 1, 1,
0.8561205, -0.0007164679, 0.7860195, 1, 1, 1, 1, 1,
0.860092, -0.556568, 1.65748, 1, 1, 1, 1, 1,
0.885873, -1.086415, 3.13303, 1, 1, 1, 1, 1,
0.8952086, -1.44149, 2.794962, 0, 0, 1, 1, 1,
0.8963605, 1.538362, 1.138914, 1, 0, 0, 1, 1,
0.8995693, -0.4342284, 0.7845293, 1, 0, 0, 1, 1,
0.9002599, 0.895277, 1.4876, 1, 0, 0, 1, 1,
0.9015719, 0.3735172, 3.343567, 1, 0, 0, 1, 1,
0.931515, -1.351565, 3.707891, 1, 0, 0, 1, 1,
0.9351789, 0.2509015, 0.9367477, 0, 0, 0, 1, 1,
0.9400495, 0.7674954, 2.554653, 0, 0, 0, 1, 1,
0.9460052, 0.4095672, 1.950466, 0, 0, 0, 1, 1,
0.9509276, 1.792505, -1.36248, 0, 0, 0, 1, 1,
0.9574133, -0.2432387, 0.1530293, 0, 0, 0, 1, 1,
0.960015, -1.133842, 2.136185, 0, 0, 0, 1, 1,
0.9602501, -0.06707624, 1.415145, 0, 0, 0, 1, 1,
0.9628496, -0.2861671, 0.004053095, 1, 1, 1, 1, 1,
0.9721646, -0.4610544, 3.800917, 1, 1, 1, 1, 1,
0.9813066, 0.218364, 1.01435, 1, 1, 1, 1, 1,
0.9822873, 0.2715719, 2.189964, 1, 1, 1, 1, 1,
0.9861941, -1.048793, 3.509019, 1, 1, 1, 1, 1,
0.9874279, 1.800933, -1.050239, 1, 1, 1, 1, 1,
0.9895798, 0.6260435, -0.825008, 1, 1, 1, 1, 1,
0.9985757, -1.031534, 0.9594493, 1, 1, 1, 1, 1,
1.005758, -1.180013, 2.170421, 1, 1, 1, 1, 1,
1.022504, 0.1573624, 0.3815736, 1, 1, 1, 1, 1,
1.024788, -0.5752473, 2.921915, 1, 1, 1, 1, 1,
1.025311, 0.4238367, 2.167876, 1, 1, 1, 1, 1,
1.027252, 0.01551706, 2.184946, 1, 1, 1, 1, 1,
1.030252, -1.846836, 2.518282, 1, 1, 1, 1, 1,
1.035425, 0.5882232, 1.094844, 1, 1, 1, 1, 1,
1.04283, 1.50302, -0.463288, 0, 0, 1, 1, 1,
1.048531, 0.03577287, 2.770519, 1, 0, 0, 1, 1,
1.052567, -1.554333, 2.324443, 1, 0, 0, 1, 1,
1.053536, 0.7777478, -1.060222, 1, 0, 0, 1, 1,
1.055473, -0.3438191, 1.802005, 1, 0, 0, 1, 1,
1.056597, 1.259211, 0.2179492, 1, 0, 0, 1, 1,
1.061934, -0.3148719, 1.392343, 0, 0, 0, 1, 1,
1.066305, -0.5835233, 1.738528, 0, 0, 0, 1, 1,
1.076908, 1.487728, 0.1441737, 0, 0, 0, 1, 1,
1.079571, -1.045421, 2.235315, 0, 0, 0, 1, 1,
1.081772, 1.33766, -0.3865763, 0, 0, 0, 1, 1,
1.082331, -0.8083145, 2.536503, 0, 0, 0, 1, 1,
1.082816, 0.2890472, -0.04864449, 0, 0, 0, 1, 1,
1.086017, 1.491015, -0.255552, 1, 1, 1, 1, 1,
1.091115, 0.133172, 1.178277, 1, 1, 1, 1, 1,
1.096636, 0.4966915, 1.371351, 1, 1, 1, 1, 1,
1.100353, 0.6827167, 3.216075, 1, 1, 1, 1, 1,
1.108424, 0.8330109, 0.9164994, 1, 1, 1, 1, 1,
1.111569, -1.388196, 0.5443498, 1, 1, 1, 1, 1,
1.116272, -0.04951286, 2.05889, 1, 1, 1, 1, 1,
1.118603, 0.4472097, 1.507359, 1, 1, 1, 1, 1,
1.119291, 0.553254, 0.1025885, 1, 1, 1, 1, 1,
1.121037, 0.6943616, -0.09543758, 1, 1, 1, 1, 1,
1.121409, -1.711379, 2.27254, 1, 1, 1, 1, 1,
1.123732, -0.3447598, 2.162575, 1, 1, 1, 1, 1,
1.131737, 0.1113528, 0.8733065, 1, 1, 1, 1, 1,
1.142251, 0.1578287, 1.009097, 1, 1, 1, 1, 1,
1.145729, 0.2758552, 2.531433, 1, 1, 1, 1, 1,
1.146516, -0.6538264, 2.787323, 0, 0, 1, 1, 1,
1.149023, -2.269808, 2.795105, 1, 0, 0, 1, 1,
1.149284, -1.345381, 3.359215, 1, 0, 0, 1, 1,
1.155183, -2.140433, 2.295438, 1, 0, 0, 1, 1,
1.156482, -0.3761853, 3.114725, 1, 0, 0, 1, 1,
1.16231, -0.2969519, 2.596543, 1, 0, 0, 1, 1,
1.175986, 1.456537, 1.189117, 0, 0, 0, 1, 1,
1.183254, 1.343502, 0.5841945, 0, 0, 0, 1, 1,
1.189614, -0.06156643, 1.605171, 0, 0, 0, 1, 1,
1.194244, -1.162295, 2.720786, 0, 0, 0, 1, 1,
1.197944, 1.416566, 2.404119, 0, 0, 0, 1, 1,
1.199629, -1.125231, 2.798646, 0, 0, 0, 1, 1,
1.200315, 0.687048, 1.294098, 0, 0, 0, 1, 1,
1.200614, 0.3194128, -0.2531206, 1, 1, 1, 1, 1,
1.223703, -0.9126177, 0.1969186, 1, 1, 1, 1, 1,
1.226054, -0.9833059, 2.30193, 1, 1, 1, 1, 1,
1.229103, 0.9633533, 0.328971, 1, 1, 1, 1, 1,
1.233587, -0.0276988, 2.693435, 1, 1, 1, 1, 1,
1.237044, -0.07525979, 1.177256, 1, 1, 1, 1, 1,
1.243466, -0.4227124, 2.032726, 1, 1, 1, 1, 1,
1.261205, -0.1616701, 2.92731, 1, 1, 1, 1, 1,
1.266697, -0.8324064, 1.379307, 1, 1, 1, 1, 1,
1.269276, 2.424491, 0.7417265, 1, 1, 1, 1, 1,
1.270709, 0.003535424, 1.324601, 1, 1, 1, 1, 1,
1.274053, -1.698865, 2.665189, 1, 1, 1, 1, 1,
1.280754, -0.6235163, 1.647861, 1, 1, 1, 1, 1,
1.281724, -0.9565544, 2.766182, 1, 1, 1, 1, 1,
1.293729, -0.08909503, 0.5142839, 1, 1, 1, 1, 1,
1.296872, -0.03457667, 2.11597, 0, 0, 1, 1, 1,
1.306487, -1.204577, 1.661088, 1, 0, 0, 1, 1,
1.30958, -0.2519524, 0.02564463, 1, 0, 0, 1, 1,
1.313048, -1.033082, 1.853529, 1, 0, 0, 1, 1,
1.317328, -1.113735, 1.707585, 1, 0, 0, 1, 1,
1.320884, -1.178892, 1.113003, 1, 0, 0, 1, 1,
1.323386, 1.818671, 0.01620247, 0, 0, 0, 1, 1,
1.323916, -0.1549112, 3.77103, 0, 0, 0, 1, 1,
1.330253, -1.289241, 1.818075, 0, 0, 0, 1, 1,
1.331862, 0.137903, 0.1517232, 0, 0, 0, 1, 1,
1.344317, -1.259323, 0.4664113, 0, 0, 0, 1, 1,
1.350684, -0.08242523, 0.637917, 0, 0, 0, 1, 1,
1.356586, -0.3743585, 1.393696, 0, 0, 0, 1, 1,
1.37845, 0.924224, 1.547797, 1, 1, 1, 1, 1,
1.384559, 1.000626, 0.2071451, 1, 1, 1, 1, 1,
1.385092, -0.3722923, 0.1009978, 1, 1, 1, 1, 1,
1.392387, -0.5566785, 1.974252, 1, 1, 1, 1, 1,
1.413335, 1.872447, 1.293677, 1, 1, 1, 1, 1,
1.414298, -0.4820107, 2.230146, 1, 1, 1, 1, 1,
1.414332, 1.04565, 1.155531, 1, 1, 1, 1, 1,
1.415658, 0.945517, -0.761974, 1, 1, 1, 1, 1,
1.420605, -0.04574541, 1.562556, 1, 1, 1, 1, 1,
1.42609, 0.8029851, 1.125722, 1, 1, 1, 1, 1,
1.426249, 0.8068216, -0.3148785, 1, 1, 1, 1, 1,
1.438197, -0.5101962, 1.024964, 1, 1, 1, 1, 1,
1.444675, -0.4239111, 1.404838, 1, 1, 1, 1, 1,
1.448996, 1.635365, -0.04979254, 1, 1, 1, 1, 1,
1.449882, -0.5291595, 1.52938, 1, 1, 1, 1, 1,
1.457975, 0.9086339, -0.305973, 0, 0, 1, 1, 1,
1.461558, 1.912902, 1.278169, 1, 0, 0, 1, 1,
1.462112, 0.5176963, 2.545129, 1, 0, 0, 1, 1,
1.466413, -1.283682, 4.30885, 1, 0, 0, 1, 1,
1.476328, 0.06153044, 1.642382, 1, 0, 0, 1, 1,
1.482198, 0.4505285, -0.3999946, 1, 0, 0, 1, 1,
1.484692, -0.6054034, 1.975195, 0, 0, 0, 1, 1,
1.49407, -0.8519176, 3.413953, 0, 0, 0, 1, 1,
1.496585, -0.044156, 0.1447295, 0, 0, 0, 1, 1,
1.515709, 1.064412, 2.725506, 0, 0, 0, 1, 1,
1.525647, 0.1782225, 1.5425, 0, 0, 0, 1, 1,
1.532361, 0.7307376, -0.0272522, 0, 0, 0, 1, 1,
1.541789, -0.4361303, 1.142173, 0, 0, 0, 1, 1,
1.54784, -1.372313, 4.303973, 1, 1, 1, 1, 1,
1.554502, -0.8694159, 1.987822, 1, 1, 1, 1, 1,
1.569176, -0.0526784, 0.6572241, 1, 1, 1, 1, 1,
1.579038, -0.3881592, 1.678169, 1, 1, 1, 1, 1,
1.581769, 0.1553223, 1.10102, 1, 1, 1, 1, 1,
1.6004, -0.9158854, 0.1136975, 1, 1, 1, 1, 1,
1.616242, -1.355625, 3.06117, 1, 1, 1, 1, 1,
1.616506, -0.1912111, 1.220759, 1, 1, 1, 1, 1,
1.623977, 1.047972, 0.3517073, 1, 1, 1, 1, 1,
1.6356, -0.831241, 1.323545, 1, 1, 1, 1, 1,
1.641525, -0.5854864, 2.741716, 1, 1, 1, 1, 1,
1.664704, -2.032914, 1.595774, 1, 1, 1, 1, 1,
1.673784, 0.1017444, 2.848532, 1, 1, 1, 1, 1,
1.678, 1.204005, 1.973053, 1, 1, 1, 1, 1,
1.680375, -1.673708, 2.7569, 1, 1, 1, 1, 1,
1.682296, -1.214523, 0.7412811, 0, 0, 1, 1, 1,
1.690542, 0.868143, 0.8062693, 1, 0, 0, 1, 1,
1.691751, -0.6819401, 1.079708, 1, 0, 0, 1, 1,
1.692063, -1.964781, 3.754589, 1, 0, 0, 1, 1,
1.694163, -0.6387746, 1.805269, 1, 0, 0, 1, 1,
1.701261, -0.3687111, 1.24552, 1, 0, 0, 1, 1,
1.708972, -1.025568, 2.533753, 0, 0, 0, 1, 1,
1.71076, 1.109616, 1.52969, 0, 0, 0, 1, 1,
1.719763, -0.4437751, 1.688746, 0, 0, 0, 1, 1,
1.734091, 0.7368252, 2.31698, 0, 0, 0, 1, 1,
1.743636, 1.193399, -0.09337953, 0, 0, 0, 1, 1,
1.761371, 1.63437, 1.75798, 0, 0, 0, 1, 1,
1.764514, 0.247814, 1.770952, 0, 0, 0, 1, 1,
1.792536, -0.6996306, 2.030498, 1, 1, 1, 1, 1,
1.834061, 0.4899794, 2.511154, 1, 1, 1, 1, 1,
1.845563, 0.9027709, 1.593312, 1, 1, 1, 1, 1,
1.84722, 0.8296216, 1.192434, 1, 1, 1, 1, 1,
1.853471, 0.3707934, 2.292154, 1, 1, 1, 1, 1,
1.868818, -0.7571303, 0.4415245, 1, 1, 1, 1, 1,
1.934999, -0.3937788, 2.220809, 1, 1, 1, 1, 1,
1.936935, -0.4574514, 1.396098, 1, 1, 1, 1, 1,
1.945484, -1.807895, 3.920479, 1, 1, 1, 1, 1,
1.953866, 0.4021201, 1.850089, 1, 1, 1, 1, 1,
1.955609, -0.3555663, 2.572913, 1, 1, 1, 1, 1,
2.004279, 0.2567478, 0.4126688, 1, 1, 1, 1, 1,
2.041131, 1.221892, 0.5222693, 1, 1, 1, 1, 1,
2.05652, -0.2170282, 2.39612, 1, 1, 1, 1, 1,
2.060038, 1.178357, 0.8177722, 1, 1, 1, 1, 1,
2.119083, 1.257845, 1.694194, 0, 0, 1, 1, 1,
2.130502, -0.4195425, 0.7831662, 1, 0, 0, 1, 1,
2.279937, -2.551935, 1.109364, 1, 0, 0, 1, 1,
2.304662, -0.342584, 1.424757, 1, 0, 0, 1, 1,
2.317055, 0.29323, 2.179669, 1, 0, 0, 1, 1,
2.318542, -2.391445, 1.152372, 1, 0, 0, 1, 1,
2.321705, 0.3588486, 2.007571, 0, 0, 0, 1, 1,
2.37893, -0.7064502, 0.2180212, 0, 0, 0, 1, 1,
2.437265, 0.8985807, 0.1822702, 0, 0, 0, 1, 1,
2.444607, 0.06875244, 0.607941, 0, 0, 0, 1, 1,
2.465493, 0.07262811, 2.480598, 0, 0, 0, 1, 1,
2.487694, -0.6171461, 2.08357, 0, 0, 0, 1, 1,
2.524656, -2.56075, 2.853261, 0, 0, 0, 1, 1,
2.628721, 0.03625898, 1.100437, 1, 1, 1, 1, 1,
2.674273, -0.5295416, 1.935829, 1, 1, 1, 1, 1,
2.703299, 0.827009, 1.463763, 1, 1, 1, 1, 1,
2.711781, -2.204167, 2.679849, 1, 1, 1, 1, 1,
2.930265, -1.892767, 1.645743, 1, 1, 1, 1, 1,
3.603968, 0.03211094, 2.257665, 1, 1, 1, 1, 1,
4.011664, 0.4445064, 0.8303713, 1, 1, 1, 1, 1
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
var radius = 9.80593;
var distance = 34.44291;
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
mvMatrix.translate( -0.2226686, 0.2207232, -0.06650376 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.44291);
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
