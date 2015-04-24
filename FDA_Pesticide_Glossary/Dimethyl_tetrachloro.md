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
-3.11392, 0.0006425451, -1.983693, 1, 0, 0, 1,
-2.958683, -0.5491089, -1.395977, 1, 0.007843138, 0, 1,
-2.870513, -0.4260921, -2.295844, 1, 0.01176471, 0, 1,
-2.308459, -0.1778901, -0.580328, 1, 0.01960784, 0, 1,
-2.302656, -0.2374008, -2.752897, 1, 0.02352941, 0, 1,
-2.262511, 0.6007995, 2.023762, 1, 0.03137255, 0, 1,
-2.240448, -0.5240043, -2.316533, 1, 0.03529412, 0, 1,
-2.219685, 0.4497542, -2.028548, 1, 0.04313726, 0, 1,
-2.21252, 0.09851838, -0.5845488, 1, 0.04705882, 0, 1,
-2.200683, -0.9731535, -1.927042, 1, 0.05490196, 0, 1,
-2.191118, -1.831946, -1.32648, 1, 0.05882353, 0, 1,
-2.159689, -0.6580282, -3.378823, 1, 0.06666667, 0, 1,
-2.125801, 2.117627, -1.363847, 1, 0.07058824, 0, 1,
-2.031244, -0.509319, -1.712206, 1, 0.07843138, 0, 1,
-2.027338, 1.080052, -1.981513, 1, 0.08235294, 0, 1,
-2.018464, -0.1655338, -0.1759344, 1, 0.09019608, 0, 1,
-1.993776, 0.78558, -1.305495, 1, 0.09411765, 0, 1,
-1.974982, 0.07208695, -2.149856, 1, 0.1019608, 0, 1,
-1.966812, -1.279836, -1.249831, 1, 0.1098039, 0, 1,
-1.964562, -0.2284174, -0.01864793, 1, 0.1137255, 0, 1,
-1.950606, 0.6004773, -1.201149, 1, 0.1215686, 0, 1,
-1.935118, -0.421654, -2.569807, 1, 0.1254902, 0, 1,
-1.917165, 0.525413, -1.073047, 1, 0.1333333, 0, 1,
-1.917108, -1.601397, -0.9350309, 1, 0.1372549, 0, 1,
-1.903917, 0.9329273, 0.3001993, 1, 0.145098, 0, 1,
-1.903544, -1.349149, -1.999902, 1, 0.1490196, 0, 1,
-1.897212, 2.142183, -1.581564, 1, 0.1568628, 0, 1,
-1.896853, 1.008951, -0.4151572, 1, 0.1607843, 0, 1,
-1.87167, 0.4630706, -0.7718728, 1, 0.1686275, 0, 1,
-1.868843, 0.9214514, -1.693288, 1, 0.172549, 0, 1,
-1.845769, -0.5414622, -0.9563631, 1, 0.1803922, 0, 1,
-1.837358, -0.06656806, -0.09186536, 1, 0.1843137, 0, 1,
-1.834421, -0.8026704, -1.462036, 1, 0.1921569, 0, 1,
-1.826149, -1.088402, -3.180459, 1, 0.1960784, 0, 1,
-1.80956, -0.04744461, -2.277903, 1, 0.2039216, 0, 1,
-1.793489, -1.731741, -3.366697, 1, 0.2117647, 0, 1,
-1.770811, -0.4914056, -2.173416, 1, 0.2156863, 0, 1,
-1.746034, 1.06028, 0.3167905, 1, 0.2235294, 0, 1,
-1.744398, -1.672575, -1.706368, 1, 0.227451, 0, 1,
-1.729377, -0.2232944, -3.358194, 1, 0.2352941, 0, 1,
-1.712678, -0.3454016, -0.02287308, 1, 0.2392157, 0, 1,
-1.680017, 0.3862776, 0.2851272, 1, 0.2470588, 0, 1,
-1.678644, 2.42574, -0.6405051, 1, 0.2509804, 0, 1,
-1.668319, -0.7592602, -2.265248, 1, 0.2588235, 0, 1,
-1.652199, -0.4011589, -3.074484, 1, 0.2627451, 0, 1,
-1.642911, -0.05955163, -0.3320552, 1, 0.2705882, 0, 1,
-1.63963, -0.9470007, -0.6703225, 1, 0.2745098, 0, 1,
-1.628406, -0.7699067, -2.580365, 1, 0.282353, 0, 1,
-1.623819, -1.164786, -2.643848, 1, 0.2862745, 0, 1,
-1.591776, -2.165266, -1.450847, 1, 0.2941177, 0, 1,
-1.5756, 1.332335, -0.4754916, 1, 0.3019608, 0, 1,
-1.571625, 0.7054773, -0.989421, 1, 0.3058824, 0, 1,
-1.568081, -0.1494609, -3.216313, 1, 0.3137255, 0, 1,
-1.554285, 0.6089135, -1.277092, 1, 0.3176471, 0, 1,
-1.551156, 0.6349574, -2.252412, 1, 0.3254902, 0, 1,
-1.550951, 1.63344, -1.43636, 1, 0.3294118, 0, 1,
-1.55031, -0.5206988, -1.751927, 1, 0.3372549, 0, 1,
-1.547455, 0.3555779, -1.35823, 1, 0.3411765, 0, 1,
-1.547042, -0.2770865, -2.155842, 1, 0.3490196, 0, 1,
-1.54214, -0.02681121, -1.033068, 1, 0.3529412, 0, 1,
-1.527359, 1.261762, 1.246061, 1, 0.3607843, 0, 1,
-1.525027, 1.484902, -0.5708748, 1, 0.3647059, 0, 1,
-1.523263, -1.290289, -3.559905, 1, 0.372549, 0, 1,
-1.518298, 0.2293196, -1.572678, 1, 0.3764706, 0, 1,
-1.503645, 0.3083551, -1.90547, 1, 0.3843137, 0, 1,
-1.483076, -0.7835649, -2.706449, 1, 0.3882353, 0, 1,
-1.478923, 0.5724034, -0.3427198, 1, 0.3960784, 0, 1,
-1.476784, 0.5736325, -0.6065468, 1, 0.4039216, 0, 1,
-1.456669, -1.298855, -1.241002, 1, 0.4078431, 0, 1,
-1.456385, -1.727203, -3.727363, 1, 0.4156863, 0, 1,
-1.450698, 0.513452, -1.596979, 1, 0.4196078, 0, 1,
-1.440241, 0.4601935, -0.999554, 1, 0.427451, 0, 1,
-1.437791, 0.5376477, 0.3219976, 1, 0.4313726, 0, 1,
-1.437119, 2.31722, -0.7916939, 1, 0.4392157, 0, 1,
-1.43388, 1.459677, -1.032861, 1, 0.4431373, 0, 1,
-1.428915, 0.4929973, -1.631444, 1, 0.4509804, 0, 1,
-1.422866, -0.4510971, -2.918714, 1, 0.454902, 0, 1,
-1.418134, -0.408296, -1.066097, 1, 0.4627451, 0, 1,
-1.413824, 0.562131, -1.200736, 1, 0.4666667, 0, 1,
-1.410919, -0.5560601, -2.314229, 1, 0.4745098, 0, 1,
-1.409503, 0.3233826, -2.096659, 1, 0.4784314, 0, 1,
-1.408961, -0.5266868, -3.478884, 1, 0.4862745, 0, 1,
-1.407357, 1.063145, -0.3056234, 1, 0.4901961, 0, 1,
-1.406725, -0.3037322, -2.454367, 1, 0.4980392, 0, 1,
-1.388758, 0.1507828, -0.02163268, 1, 0.5058824, 0, 1,
-1.375735, -1.240242, -1.395794, 1, 0.509804, 0, 1,
-1.374583, 0.8185514, 0.6534529, 1, 0.5176471, 0, 1,
-1.373771, 0.9984854, -1.794094, 1, 0.5215687, 0, 1,
-1.3721, -1.316552, -1.490741, 1, 0.5294118, 0, 1,
-1.370914, -1.215542, -2.724071, 1, 0.5333334, 0, 1,
-1.359931, -0.1905053, -1.335628, 1, 0.5411765, 0, 1,
-1.35617, -0.04120439, -2.002838, 1, 0.5450981, 0, 1,
-1.353608, 0.4040808, -2.35679, 1, 0.5529412, 0, 1,
-1.351398, -0.1809267, -1.380012, 1, 0.5568628, 0, 1,
-1.349554, 1.141579, -3.243399, 1, 0.5647059, 0, 1,
-1.343272, 1.050169, -1.240993, 1, 0.5686275, 0, 1,
-1.330498, -0.04946456, -0.6745054, 1, 0.5764706, 0, 1,
-1.328886, 0.266946, -1.809789, 1, 0.5803922, 0, 1,
-1.317575, 1.465663, -0.3056652, 1, 0.5882353, 0, 1,
-1.314011, 0.1176168, -0.02235742, 1, 0.5921569, 0, 1,
-1.312997, -0.1943349, -1.595872, 1, 0.6, 0, 1,
-1.30393, 0.06483393, -1.741821, 1, 0.6078432, 0, 1,
-1.303403, -0.5056085, 0.415278, 1, 0.6117647, 0, 1,
-1.301095, 1.303894, -2.218404, 1, 0.6196079, 0, 1,
-1.298603, -1.071512, -1.993188, 1, 0.6235294, 0, 1,
-1.290977, -2.606545, -1.846079, 1, 0.6313726, 0, 1,
-1.286911, 0.1296327, -1.19046, 1, 0.6352941, 0, 1,
-1.277773, 0.8487061, -2.684574, 1, 0.6431373, 0, 1,
-1.273717, -0.05026767, -1.240991, 1, 0.6470588, 0, 1,
-1.253126, -0.0006253231, -3.002193, 1, 0.654902, 0, 1,
-1.249203, -0.6455575, -4.794672, 1, 0.6588235, 0, 1,
-1.22989, 1.177988, -1.52238, 1, 0.6666667, 0, 1,
-1.228789, -0.9747609, -1.665107, 1, 0.6705883, 0, 1,
-1.225001, -0.5622685, -1.463733, 1, 0.6784314, 0, 1,
-1.222668, -1.240758, -1.924707, 1, 0.682353, 0, 1,
-1.222449, -0.4687198, -2.437195, 1, 0.6901961, 0, 1,
-1.200766, 0.601844, -1.165923, 1, 0.6941177, 0, 1,
-1.194482, -1.212539, -2.268457, 1, 0.7019608, 0, 1,
-1.191533, 0.1347965, -2.806389, 1, 0.7098039, 0, 1,
-1.187948, 1.397663, -0.2689956, 1, 0.7137255, 0, 1,
-1.186278, -0.4945759, -2.05598, 1, 0.7215686, 0, 1,
-1.186117, -0.0003691457, -2.755412, 1, 0.7254902, 0, 1,
-1.183684, -0.4238526, -2.888408, 1, 0.7333333, 0, 1,
-1.178919, 1.30554, 1.268018, 1, 0.7372549, 0, 1,
-1.175343, -0.03319158, -1.397898, 1, 0.7450981, 0, 1,
-1.173329, 0.327888, -0.3199678, 1, 0.7490196, 0, 1,
-1.15904, 1.062897, -0.2986768, 1, 0.7568628, 0, 1,
-1.14769, -0.6564704, -0.3755054, 1, 0.7607843, 0, 1,
-1.145188, -0.4989655, -0.5359675, 1, 0.7686275, 0, 1,
-1.145186, 1.177029, -0.4686259, 1, 0.772549, 0, 1,
-1.145153, -0.6423417, -1.053541, 1, 0.7803922, 0, 1,
-1.144462, 0.816749, -1.20433, 1, 0.7843137, 0, 1,
-1.140346, -1.011695, -2.470352, 1, 0.7921569, 0, 1,
-1.132608, -0.2440573, -4.358174, 1, 0.7960784, 0, 1,
-1.131747, -0.1944173, -0.7153293, 1, 0.8039216, 0, 1,
-1.128129, -0.448191, -2.497173, 1, 0.8117647, 0, 1,
-1.12398, -0.167229, -1.537609, 1, 0.8156863, 0, 1,
-1.104138, 1.260761, -0.8689792, 1, 0.8235294, 0, 1,
-1.10067, 0.002169497, -0.04944693, 1, 0.827451, 0, 1,
-1.097216, 0.7533869, -1.396383, 1, 0.8352941, 0, 1,
-1.096568, -0.4642633, 0.5754598, 1, 0.8392157, 0, 1,
-1.095291, 0.5356379, -1.49716, 1, 0.8470588, 0, 1,
-1.093638, -1.098403, -0.6033248, 1, 0.8509804, 0, 1,
-1.091933, 1.849461, 0.8153934, 1, 0.8588235, 0, 1,
-1.091505, 1.564844, -0.4874833, 1, 0.8627451, 0, 1,
-1.089223, 0.7354409, -2.356469, 1, 0.8705882, 0, 1,
-1.0856, 1.40344, -1.544192, 1, 0.8745098, 0, 1,
-1.075974, -0.03367442, -1.293334, 1, 0.8823529, 0, 1,
-1.074953, -0.6536032, -1.954455, 1, 0.8862745, 0, 1,
-1.06983, -0.3254431, -2.531469, 1, 0.8941177, 0, 1,
-1.069802, -0.8800219, -1.83045, 1, 0.8980392, 0, 1,
-1.059575, 0.7034557, -2.33289, 1, 0.9058824, 0, 1,
-1.05876, 1.252284, -0.6112176, 1, 0.9137255, 0, 1,
-1.057531, 1.810064, -0.9532173, 1, 0.9176471, 0, 1,
-1.056603, 1.505322, -2.134207, 1, 0.9254902, 0, 1,
-1.053177, -0.03814383, -3.386236, 1, 0.9294118, 0, 1,
-1.043815, 0.1733482, -1.967224, 1, 0.9372549, 0, 1,
-1.040725, 1.377156, -0.5375096, 1, 0.9411765, 0, 1,
-1.039599, -1.61155, -1.331741, 1, 0.9490196, 0, 1,
-1.025732, -0.1494229, -0.4136024, 1, 0.9529412, 0, 1,
-1.023433, -0.7177961, -3.977104, 1, 0.9607843, 0, 1,
-1.021902, 0.5644343, -0.8574635, 1, 0.9647059, 0, 1,
-1.017822, 1.894172, 0.0005291585, 1, 0.972549, 0, 1,
-1.016024, 1.497316, -2.476861, 1, 0.9764706, 0, 1,
-1.014336, 0.01635543, -3.122523, 1, 0.9843137, 0, 1,
-1.002869, -0.7360725, -1.989537, 1, 0.9882353, 0, 1,
-1.001973, -1.120236, -4.279434, 1, 0.9960784, 0, 1,
-0.9903877, 0.8393201, -2.569858, 0.9960784, 1, 0, 1,
-0.9812387, 1.500259, -1.000093, 0.9921569, 1, 0, 1,
-0.9758627, -0.3340296, -2.172022, 0.9843137, 1, 0, 1,
-0.9701732, -0.2717437, -2.13232, 0.9803922, 1, 0, 1,
-0.9700746, 0.347448, -0.9719202, 0.972549, 1, 0, 1,
-0.9692208, 0.3288812, 1.001948, 0.9686275, 1, 0, 1,
-0.9635957, -0.3013621, -3.575351, 0.9607843, 1, 0, 1,
-0.9611119, 0.07968286, -0.3718537, 0.9568627, 1, 0, 1,
-0.9575897, 1.319407, 1.46119, 0.9490196, 1, 0, 1,
-0.9491269, 0.1597313, -1.026443, 0.945098, 1, 0, 1,
-0.9476904, -2.443602, -3.023606, 0.9372549, 1, 0, 1,
-0.9410863, -1.07707, -2.813416, 0.9333333, 1, 0, 1,
-0.9398388, 1.680997, 0.8536094, 0.9254902, 1, 0, 1,
-0.9365034, -0.7618988, -1.109306, 0.9215686, 1, 0, 1,
-0.9354982, 0.4166346, -0.0706308, 0.9137255, 1, 0, 1,
-0.926672, 0.4822219, -1.913181, 0.9098039, 1, 0, 1,
-0.9249325, -0.4920532, -1.734117, 0.9019608, 1, 0, 1,
-0.9200219, -3.258357, -3.486823, 0.8941177, 1, 0, 1,
-0.9171532, 0.01992182, 0.1262895, 0.8901961, 1, 0, 1,
-0.9127377, -0.1942926, -2.17806, 0.8823529, 1, 0, 1,
-0.9061581, -0.6389702, -1.859701, 0.8784314, 1, 0, 1,
-0.9056222, 1.621398, 0.5705904, 0.8705882, 1, 0, 1,
-0.9005867, -1.706797, -2.437331, 0.8666667, 1, 0, 1,
-0.8939068, 0.3525462, -0.833253, 0.8588235, 1, 0, 1,
-0.8903654, 1.738722, -0.8853505, 0.854902, 1, 0, 1,
-0.8729061, -0.2245698, -2.11019, 0.8470588, 1, 0, 1,
-0.8724739, -0.8179472, -2.114106, 0.8431373, 1, 0, 1,
-0.861914, 0.2454309, -1.803874, 0.8352941, 1, 0, 1,
-0.8585827, -1.474176, -4.77241, 0.8313726, 1, 0, 1,
-0.8577572, 0.2872789, -2.250519, 0.8235294, 1, 0, 1,
-0.8563025, 0.3913667, -1.580653, 0.8196079, 1, 0, 1,
-0.8538492, 0.3930698, -1.564147, 0.8117647, 1, 0, 1,
-0.8532071, -1.83002, -2.246482, 0.8078431, 1, 0, 1,
-0.8361785, 1.75045, -0.7717906, 0.8, 1, 0, 1,
-0.8341452, 2.289341, -1.380783, 0.7921569, 1, 0, 1,
-0.8234739, -0.5993726, -0.7976045, 0.7882353, 1, 0, 1,
-0.8190871, -0.2072783, -2.693681, 0.7803922, 1, 0, 1,
-0.8174489, 0.5353783, -0.3679531, 0.7764706, 1, 0, 1,
-0.8135324, 0.3464019, -1.523384, 0.7686275, 1, 0, 1,
-0.8124461, 0.0589226, -0.514527, 0.7647059, 1, 0, 1,
-0.8035632, 0.2384212, -0.9539523, 0.7568628, 1, 0, 1,
-0.7939093, 0.1025854, -3.551921, 0.7529412, 1, 0, 1,
-0.7909952, -0.5715066, -2.984885, 0.7450981, 1, 0, 1,
-0.7905921, -1.320763, -1.758184, 0.7411765, 1, 0, 1,
-0.7898691, 1.512945, -1.294316, 0.7333333, 1, 0, 1,
-0.7887466, 1.290734, -3.398542, 0.7294118, 1, 0, 1,
-0.7832065, 1.174245, -1.818252, 0.7215686, 1, 0, 1,
-0.7799596, 0.08241033, -1.805522, 0.7176471, 1, 0, 1,
-0.7787019, -0.4373022, -3.302665, 0.7098039, 1, 0, 1,
-0.7757455, 2.332009, 0.04286197, 0.7058824, 1, 0, 1,
-0.7710947, -1.3619, -1.437264, 0.6980392, 1, 0, 1,
-0.7655939, -0.9635867, -4.213286, 0.6901961, 1, 0, 1,
-0.7626956, -0.4801535, -1.371497, 0.6862745, 1, 0, 1,
-0.7561299, -0.276275, -1.371379, 0.6784314, 1, 0, 1,
-0.755803, -0.1226883, -0.6749839, 0.6745098, 1, 0, 1,
-0.7541122, -0.4685676, -1.044823, 0.6666667, 1, 0, 1,
-0.7510182, 1.716733, -0.2654997, 0.6627451, 1, 0, 1,
-0.7501564, 0.6363292, 0.9582783, 0.654902, 1, 0, 1,
-0.750021, 0.8748534, -1.744965, 0.6509804, 1, 0, 1,
-0.7485216, 0.2094675, -1.379244, 0.6431373, 1, 0, 1,
-0.7465584, -0.3761545, -1.91033, 0.6392157, 1, 0, 1,
-0.7431355, -0.7993682, -3.600146, 0.6313726, 1, 0, 1,
-0.7409252, -2.36247, -2.430734, 0.627451, 1, 0, 1,
-0.7340086, 0.5222262, -0.3814903, 0.6196079, 1, 0, 1,
-0.7333094, -0.7277903, -2.90788, 0.6156863, 1, 0, 1,
-0.7271335, 0.6801757, 1.486652, 0.6078432, 1, 0, 1,
-0.7261705, 1.229439, 1.198252, 0.6039216, 1, 0, 1,
-0.7241993, -0.4717618, -1.319265, 0.5960785, 1, 0, 1,
-0.7100821, 1.81482, -0.1522553, 0.5882353, 1, 0, 1,
-0.7029126, 0.3066714, 0.6077914, 0.5843138, 1, 0, 1,
-0.7016729, -0.7400311, -2.306417, 0.5764706, 1, 0, 1,
-0.6999115, 0.4670736, -0.1265598, 0.572549, 1, 0, 1,
-0.6996259, -0.3012987, -2.479862, 0.5647059, 1, 0, 1,
-0.6981415, -0.8275724, -3.971493, 0.5607843, 1, 0, 1,
-0.6955634, 0.1819966, -2.266421, 0.5529412, 1, 0, 1,
-0.6935965, 0.2127762, -1.169863, 0.5490196, 1, 0, 1,
-0.6927653, 0.08164788, -2.138626, 0.5411765, 1, 0, 1,
-0.6921588, -0.4232871, -3.101247, 0.5372549, 1, 0, 1,
-0.6893995, 0.2398732, -2.589885, 0.5294118, 1, 0, 1,
-0.6841483, 0.09186499, -1.47435, 0.5254902, 1, 0, 1,
-0.6822005, -0.005920332, -0.8892344, 0.5176471, 1, 0, 1,
-0.682054, 0.273799, -1.296181, 0.5137255, 1, 0, 1,
-0.6797342, 0.09977578, -1.731559, 0.5058824, 1, 0, 1,
-0.6737374, -0.5233375, -2.270136, 0.5019608, 1, 0, 1,
-0.6725084, -1.892873, -2.757959, 0.4941176, 1, 0, 1,
-0.6711997, 0.9010428, 0.3387599, 0.4862745, 1, 0, 1,
-0.6678842, -0.7720338, -2.619295, 0.4823529, 1, 0, 1,
-0.6561773, -0.02122802, -0.8920873, 0.4745098, 1, 0, 1,
-0.6514331, 0.2564171, 0.08710063, 0.4705882, 1, 0, 1,
-0.6512927, -0.2362165, -1.583604, 0.4627451, 1, 0, 1,
-0.648535, -0.2043742, -3.024218, 0.4588235, 1, 0, 1,
-0.6483603, 0.2674475, -1.32349, 0.4509804, 1, 0, 1,
-0.6465925, -0.2102328, -2.326704, 0.4470588, 1, 0, 1,
-0.6462718, 1.000549, -1.22939, 0.4392157, 1, 0, 1,
-0.6442177, -1.240282, -3.293588, 0.4352941, 1, 0, 1,
-0.6421217, -0.8416778, -1.621602, 0.427451, 1, 0, 1,
-0.6396376, 0.3948732, -0.3389611, 0.4235294, 1, 0, 1,
-0.6350657, 0.8868918, -0.3628957, 0.4156863, 1, 0, 1,
-0.6319207, 1.683825, -2.477098, 0.4117647, 1, 0, 1,
-0.6280298, -0.0008068696, 0.4793408, 0.4039216, 1, 0, 1,
-0.6273596, 1.492418, 0.2166334, 0.3960784, 1, 0, 1,
-0.6267528, -0.558675, -3.095364, 0.3921569, 1, 0, 1,
-0.6264409, 1.013, 0.4345785, 0.3843137, 1, 0, 1,
-0.6246276, 1.11136, 0.5769143, 0.3803922, 1, 0, 1,
-0.614655, -0.3436257, -1.128541, 0.372549, 1, 0, 1,
-0.6113473, -0.3301187, -3.545213, 0.3686275, 1, 0, 1,
-0.611335, 1.402942, -2.287787, 0.3607843, 1, 0, 1,
-0.6084137, 0.09828442, 0.9797989, 0.3568628, 1, 0, 1,
-0.6052248, 1.591432, -0.8412672, 0.3490196, 1, 0, 1,
-0.6045284, 0.9128575, -1.047255, 0.345098, 1, 0, 1,
-0.6019925, -1.195433, -4.172721, 0.3372549, 1, 0, 1,
-0.6003725, -0.8901265, -1.30165, 0.3333333, 1, 0, 1,
-0.6003495, 0.5819101, -1.996237, 0.3254902, 1, 0, 1,
-0.598677, -0.8871518, -0.1323522, 0.3215686, 1, 0, 1,
-0.5985351, 1.120371, -1.071814, 0.3137255, 1, 0, 1,
-0.5962772, -0.3202261, -1.621448, 0.3098039, 1, 0, 1,
-0.5907987, 0.5310997, 1.792614, 0.3019608, 1, 0, 1,
-0.5845364, -0.282932, -1.372995, 0.2941177, 1, 0, 1,
-0.5814931, 2.240155, 1.178387, 0.2901961, 1, 0, 1,
-0.5812799, -0.1734654, 0.5219388, 0.282353, 1, 0, 1,
-0.5771087, -1.333265, -1.517236, 0.2784314, 1, 0, 1,
-0.5679821, -0.7341256, -2.268286, 0.2705882, 1, 0, 1,
-0.5653005, 0.2988356, -1.369703, 0.2666667, 1, 0, 1,
-0.5637118, 0.6007242, -1.041801, 0.2588235, 1, 0, 1,
-0.5576599, -0.3481323, -2.45106, 0.254902, 1, 0, 1,
-0.5567046, 0.1357458, -1.292503, 0.2470588, 1, 0, 1,
-0.5527992, 0.7592858, -0.9355828, 0.2431373, 1, 0, 1,
-0.550586, 1.137568, -1.0535, 0.2352941, 1, 0, 1,
-0.5504906, -0.3379072, -1.454031, 0.2313726, 1, 0, 1,
-0.5489357, -0.1918566, -0.2887862, 0.2235294, 1, 0, 1,
-0.5459082, -1.153025, -3.221268, 0.2196078, 1, 0, 1,
-0.5446555, -0.4240529, -1.547107, 0.2117647, 1, 0, 1,
-0.5446517, 0.1463674, -3.239289, 0.2078431, 1, 0, 1,
-0.5357364, -2.081959, -2.349952, 0.2, 1, 0, 1,
-0.5316066, 0.08599614, -2.909525, 0.1921569, 1, 0, 1,
-0.5310579, -1.25847, -3.608284, 0.1882353, 1, 0, 1,
-0.5288684, -2.05414, -2.818335, 0.1803922, 1, 0, 1,
-0.5265011, -0.02097179, -1.48017, 0.1764706, 1, 0, 1,
-0.5243216, 0.2468614, -1.450869, 0.1686275, 1, 0, 1,
-0.5233001, -0.1842791, -2.383106, 0.1647059, 1, 0, 1,
-0.5204414, 0.3019682, -1.966536, 0.1568628, 1, 0, 1,
-0.5173091, 0.01025885, -2.76757, 0.1529412, 1, 0, 1,
-0.5153937, -0.1455203, -1.240275, 0.145098, 1, 0, 1,
-0.5153355, -0.8558141, -2.287263, 0.1411765, 1, 0, 1,
-0.5128664, 0.2772097, -1.160591, 0.1333333, 1, 0, 1,
-0.5071578, -0.09303366, -1.244269, 0.1294118, 1, 0, 1,
-0.5066804, 0.6510313, -2.531921, 0.1215686, 1, 0, 1,
-0.5044723, 2.36937, -0.213093, 0.1176471, 1, 0, 1,
-0.5005682, 0.3505427, -0.1609998, 0.1098039, 1, 0, 1,
-0.4997177, -0.2846541, -1.385508, 0.1058824, 1, 0, 1,
-0.4982682, -0.1051077, -1.089583, 0.09803922, 1, 0, 1,
-0.4954943, 0.5953661, 0.3180157, 0.09019608, 1, 0, 1,
-0.4945071, 0.7804411, -0.6475654, 0.08627451, 1, 0, 1,
-0.4918734, 0.6256506, -0.07018655, 0.07843138, 1, 0, 1,
-0.4918316, 1.108155, 0.006620329, 0.07450981, 1, 0, 1,
-0.4879713, -2.712296, -1.692454, 0.06666667, 1, 0, 1,
-0.4828855, -2.040645, -2.54129, 0.0627451, 1, 0, 1,
-0.4814903, 1.814672, -0.1518407, 0.05490196, 1, 0, 1,
-0.4802567, -0.2497373, -2.840301, 0.05098039, 1, 0, 1,
-0.4792857, 0.2828553, 0.8342586, 0.04313726, 1, 0, 1,
-0.4785758, -0.5584008, 0.05555189, 0.03921569, 1, 0, 1,
-0.4744758, -0.04990478, -1.012494, 0.03137255, 1, 0, 1,
-0.4701528, -0.9078097, -1.73856, 0.02745098, 1, 0, 1,
-0.4688582, -0.195741, -3.00462, 0.01960784, 1, 0, 1,
-0.4635683, 0.2276777, -1.246689, 0.01568628, 1, 0, 1,
-0.4597766, 0.949237, 1.134078, 0.007843138, 1, 0, 1,
-0.4565207, -0.4120638, -0.9393303, 0.003921569, 1, 0, 1,
-0.4549773, 0.2130354, -1.109813, 0, 1, 0.003921569, 1,
-0.4543291, 1.080108, -0.8965696, 0, 1, 0.01176471, 1,
-0.4526906, 1.641603, -0.2429456, 0, 1, 0.01568628, 1,
-0.4516457, -0.978663, -2.698896, 0, 1, 0.02352941, 1,
-0.4475708, -0.3101828, -2.591597, 0, 1, 0.02745098, 1,
-0.4411726, 1.096749, -0.2285823, 0, 1, 0.03529412, 1,
-0.4396655, -0.2541816, -1.43503, 0, 1, 0.03921569, 1,
-0.4382734, -0.1395829, -1.027825, 0, 1, 0.04705882, 1,
-0.436934, 0.7087601, 0.425431, 0, 1, 0.05098039, 1,
-0.4218712, 0.306535, -0.7161117, 0, 1, 0.05882353, 1,
-0.4215318, -1.35858, -1.08461, 0, 1, 0.0627451, 1,
-0.4211062, -1.057233, -2.827908, 0, 1, 0.07058824, 1,
-0.4180828, 0.3188621, -0.5147404, 0, 1, 0.07450981, 1,
-0.4127496, -0.3989032, -2.600511, 0, 1, 0.08235294, 1,
-0.4116551, 0.8529024, 0.7513966, 0, 1, 0.08627451, 1,
-0.4100328, 0.2417563, -0.7985976, 0, 1, 0.09411765, 1,
-0.4046769, 0.8683678, 0.597551, 0, 1, 0.1019608, 1,
-0.4033209, -0.5156685, -2.959886, 0, 1, 0.1058824, 1,
-0.401412, 1.157253, -1.274434, 0, 1, 0.1137255, 1,
-0.3976184, 0.8288922, 0.8508085, 0, 1, 0.1176471, 1,
-0.3946199, -0.3148096, -2.354031, 0, 1, 0.1254902, 1,
-0.3929422, 0.7418375, -0.9402639, 0, 1, 0.1294118, 1,
-0.3921562, -1.320163, -0.9828977, 0, 1, 0.1372549, 1,
-0.3920145, 1.675911, -0.03177907, 0, 1, 0.1411765, 1,
-0.3917871, -1.465075, -2.442063, 0, 1, 0.1490196, 1,
-0.3800144, -0.4314834, -1.011716, 0, 1, 0.1529412, 1,
-0.3792022, 0.1699533, -2.181988, 0, 1, 0.1607843, 1,
-0.3744075, 1.072677, 0.7217849, 0, 1, 0.1647059, 1,
-0.3736254, -0.7953395, -2.363956, 0, 1, 0.172549, 1,
-0.3723169, -0.2633099, -2.747711, 0, 1, 0.1764706, 1,
-0.3683597, 0.04915995, -1.721712, 0, 1, 0.1843137, 1,
-0.3675836, -2.195361, -2.366506, 0, 1, 0.1882353, 1,
-0.363977, 2.234187, 1.396701, 0, 1, 0.1960784, 1,
-0.3635652, 0.4310589, 0.6332325, 0, 1, 0.2039216, 1,
-0.3615085, -0.6950088, -3.488364, 0, 1, 0.2078431, 1,
-0.360366, 0.9058535, 0.02972421, 0, 1, 0.2156863, 1,
-0.3601442, 0.1310007, -0.4654977, 0, 1, 0.2196078, 1,
-0.3596889, 0.4406322, -0.02417676, 0, 1, 0.227451, 1,
-0.3593927, -0.0324547, -0.7277634, 0, 1, 0.2313726, 1,
-0.3592539, -0.9538532, -1.612369, 0, 1, 0.2392157, 1,
-0.3543675, 0.6597859, -0.9817292, 0, 1, 0.2431373, 1,
-0.3516433, -0.5245486, -1.795035, 0, 1, 0.2509804, 1,
-0.3507812, -0.8978776, -1.643811, 0, 1, 0.254902, 1,
-0.3487108, 0.5149144, -1.052993, 0, 1, 0.2627451, 1,
-0.3453263, 1.396721, 0.03541871, 0, 1, 0.2666667, 1,
-0.3410114, -1.569111, -1.903204, 0, 1, 0.2745098, 1,
-0.3389512, -1.2644, -2.312485, 0, 1, 0.2784314, 1,
-0.3368581, 0.7917548, -0.8753076, 0, 1, 0.2862745, 1,
-0.3367497, -0.9992689, -3.421243, 0, 1, 0.2901961, 1,
-0.333241, -1.160238, -3.116806, 0, 1, 0.2980392, 1,
-0.3324048, -0.6667986, -2.552677, 0, 1, 0.3058824, 1,
-0.3312975, 1.007816, -0.5812044, 0, 1, 0.3098039, 1,
-0.3305888, 1.256866, -1.15725, 0, 1, 0.3176471, 1,
-0.3300996, 1.615077, 1.183778, 0, 1, 0.3215686, 1,
-0.3287896, 0.1459414, -1.156235, 0, 1, 0.3294118, 1,
-0.32771, 0.311176, -1.455664, 0, 1, 0.3333333, 1,
-0.3272995, 1.11805, -0.6623883, 0, 1, 0.3411765, 1,
-0.3224735, 0.867645, -1.893026, 0, 1, 0.345098, 1,
-0.3161885, -0.212645, -2.495687, 0, 1, 0.3529412, 1,
-0.3150203, 0.4426981, -0.3246513, 0, 1, 0.3568628, 1,
-0.3143075, 0.5507474, -0.09120862, 0, 1, 0.3647059, 1,
-0.3139655, 0.4580233, -1.146661, 0, 1, 0.3686275, 1,
-0.3134662, -0.08146865, -2.412422, 0, 1, 0.3764706, 1,
-0.3130426, 0.09298973, -2.029759, 0, 1, 0.3803922, 1,
-0.3112185, 0.2824654, 0.3224649, 0, 1, 0.3882353, 1,
-0.3109442, -0.9294974, -5.498335, 0, 1, 0.3921569, 1,
-0.3062512, 0.5072586, -1.562401, 0, 1, 0.4, 1,
-0.303561, 2.104595, -1.366391, 0, 1, 0.4078431, 1,
-0.2995818, -0.3211298, -1.815519, 0, 1, 0.4117647, 1,
-0.2983733, 0.9850063, -1.466043, 0, 1, 0.4196078, 1,
-0.2939101, -0.2321488, -1.204856, 0, 1, 0.4235294, 1,
-0.2918129, 0.5325795, -0.3157352, 0, 1, 0.4313726, 1,
-0.2900263, 2.507038, -0.3014124, 0, 1, 0.4352941, 1,
-0.2882496, 2.149021, -2.524406, 0, 1, 0.4431373, 1,
-0.2840993, -0.0158251, -1.884842, 0, 1, 0.4470588, 1,
-0.2831047, 0.681399, -1.042624, 0, 1, 0.454902, 1,
-0.2814428, -0.4340312, -4.524289, 0, 1, 0.4588235, 1,
-0.2790469, 0.7741964, -0.865613, 0, 1, 0.4666667, 1,
-0.2616658, -0.7132156, -5.550818, 0, 1, 0.4705882, 1,
-0.2585515, -1.613188, -1.586795, 0, 1, 0.4784314, 1,
-0.2581302, -0.2833141, -2.220515, 0, 1, 0.4823529, 1,
-0.2560634, 0.4159843, -3.526614, 0, 1, 0.4901961, 1,
-0.2538284, -0.9419948, -5.011166, 0, 1, 0.4941176, 1,
-0.2528279, 0.3809579, -0.7128089, 0, 1, 0.5019608, 1,
-0.2518706, -1.239565, -3.461949, 0, 1, 0.509804, 1,
-0.2517768, -0.8097227, -3.098445, 0, 1, 0.5137255, 1,
-0.2507897, -0.5221444, -3.7091, 0, 1, 0.5215687, 1,
-0.2446611, 0.8607306, 0.08281767, 0, 1, 0.5254902, 1,
-0.2444646, -0.2018666, -0.6021125, 0, 1, 0.5333334, 1,
-0.2435409, -1.186751, -2.764941, 0, 1, 0.5372549, 1,
-0.2434273, -1.23536, -2.683572, 0, 1, 0.5450981, 1,
-0.2392023, -1.706176, -3.013193, 0, 1, 0.5490196, 1,
-0.2374062, 0.9535988, -0.8602584, 0, 1, 0.5568628, 1,
-0.2364445, -0.3120138, -2.927997, 0, 1, 0.5607843, 1,
-0.2357264, -1.197148, -2.883866, 0, 1, 0.5686275, 1,
-0.2322063, -0.2931217, -2.62898, 0, 1, 0.572549, 1,
-0.2270307, 0.9959034, 0.0008422498, 0, 1, 0.5803922, 1,
-0.2253515, -1.940752, -2.595527, 0, 1, 0.5843138, 1,
-0.2227478, 1.486618, -0.6255777, 0, 1, 0.5921569, 1,
-0.2187758, 0.4127058, 0.8997812, 0, 1, 0.5960785, 1,
-0.2185181, -0.6490334, -2.79762, 0, 1, 0.6039216, 1,
-0.2145155, 0.1310779, -0.3458446, 0, 1, 0.6117647, 1,
-0.2143126, -0.1756789, -2.628009, 0, 1, 0.6156863, 1,
-0.21145, 1.013569, -1.613406, 0, 1, 0.6235294, 1,
-0.2062485, -1.066445, -2.412475, 0, 1, 0.627451, 1,
-0.206004, 0.6898, 0.9474703, 0, 1, 0.6352941, 1,
-0.204528, -0.2210776, -1.728519, 0, 1, 0.6392157, 1,
-0.1984893, 0.8444841, -1.074895, 0, 1, 0.6470588, 1,
-0.1971882, 1.156104, -0.5694863, 0, 1, 0.6509804, 1,
-0.1961996, -0.3047499, -3.693901, 0, 1, 0.6588235, 1,
-0.1960146, 0.0405989, -0.3713442, 0, 1, 0.6627451, 1,
-0.1938457, 0.8276361, -1.200482, 0, 1, 0.6705883, 1,
-0.192696, 0.2091898, -0.7864671, 0, 1, 0.6745098, 1,
-0.1915897, 2.502159, 0.1371633, 0, 1, 0.682353, 1,
-0.189418, 2.026705, -3.69189, 0, 1, 0.6862745, 1,
-0.1844839, 0.647893, -0.3359815, 0, 1, 0.6941177, 1,
-0.1839765, 1.179188, -0.4721907, 0, 1, 0.7019608, 1,
-0.1689015, 0.4902529, 0.1651247, 0, 1, 0.7058824, 1,
-0.1666314, -0.2458107, -2.781001, 0, 1, 0.7137255, 1,
-0.1554806, -0.1359634, -2.962727, 0, 1, 0.7176471, 1,
-0.147611, 0.2580073, -0.09641426, 0, 1, 0.7254902, 1,
-0.1468364, -0.4915586, -1.317556, 0, 1, 0.7294118, 1,
-0.1464192, -0.5855687, -2.630181, 0, 1, 0.7372549, 1,
-0.1363567, -0.4129024, -3.452603, 0, 1, 0.7411765, 1,
-0.1340607, -1.738044, -3.107407, 0, 1, 0.7490196, 1,
-0.1286749, -0.08100143, -2.46083, 0, 1, 0.7529412, 1,
-0.1231937, -1.32927, -2.259752, 0, 1, 0.7607843, 1,
-0.1147175, 0.2027659, -1.234917, 0, 1, 0.7647059, 1,
-0.1129546, 1.519775, 0.9786454, 0, 1, 0.772549, 1,
-0.1125031, -1.115848, -3.370698, 0, 1, 0.7764706, 1,
-0.1080076, -1.822535, -3.446464, 0, 1, 0.7843137, 1,
-0.1061048, -0.3371204, -0.37071, 0, 1, 0.7882353, 1,
-0.1031723, 0.9290953, 1.588504, 0, 1, 0.7960784, 1,
-0.09786958, 0.6970471, -0.8329497, 0, 1, 0.8039216, 1,
-0.09383766, 0.3949151, -2.265182, 0, 1, 0.8078431, 1,
-0.09351841, 1.289444, 0.4358504, 0, 1, 0.8156863, 1,
-0.09178611, -0.2590388, -3.119184, 0, 1, 0.8196079, 1,
-0.09108573, 0.3147287, -0.8022799, 0, 1, 0.827451, 1,
-0.09017298, -1.270701, -2.715563, 0, 1, 0.8313726, 1,
-0.08671337, -0.0874138, -0.95956, 0, 1, 0.8392157, 1,
-0.08577265, -0.1893264, -2.864877, 0, 1, 0.8431373, 1,
-0.0824806, -0.5799049, -3.959627, 0, 1, 0.8509804, 1,
-0.07767189, 0.442495, -0.8528591, 0, 1, 0.854902, 1,
-0.07620766, -0.8765644, -5.890095, 0, 1, 0.8627451, 1,
-0.07483463, -0.3709302, -2.485291, 0, 1, 0.8666667, 1,
-0.07255175, 0.07483668, -1.189426, 0, 1, 0.8745098, 1,
-0.0715334, 1.812732, -1.137429, 0, 1, 0.8784314, 1,
-0.07100653, -0.9150533, -0.5236062, 0, 1, 0.8862745, 1,
-0.07040147, 1.463595, 0.9949054, 0, 1, 0.8901961, 1,
-0.05494673, -1.459843, -3.662053, 0, 1, 0.8980392, 1,
-0.05282984, -0.7894389, -2.548681, 0, 1, 0.9058824, 1,
-0.04540198, -1.687109, -4.745522, 0, 1, 0.9098039, 1,
-0.04518748, -2.866056, -2.285481, 0, 1, 0.9176471, 1,
-0.04197349, 0.2800581, -0.08871231, 0, 1, 0.9215686, 1,
-0.04012483, 1.976107, 0.009153472, 0, 1, 0.9294118, 1,
-0.03683398, -0.4003425, -2.665761, 0, 1, 0.9333333, 1,
-0.03667054, 1.12436, 0.2019483, 0, 1, 0.9411765, 1,
-0.03351137, -1.148105, -3.261169, 0, 1, 0.945098, 1,
-0.030639, -0.601063, -2.807392, 0, 1, 0.9529412, 1,
-0.03056318, 1.410145, 0.6517404, 0, 1, 0.9568627, 1,
-0.02893182, 0.7015725, -0.5946235, 0, 1, 0.9647059, 1,
-0.02806726, -0.4645593, -3.215333, 0, 1, 0.9686275, 1,
-0.02319605, -0.7210709, -2.33828, 0, 1, 0.9764706, 1,
-0.02103477, -1.195611, -3.423807, 0, 1, 0.9803922, 1,
-0.01846769, -0.4814038, -1.772018, 0, 1, 0.9882353, 1,
-0.01508206, -0.9952798, -2.62834, 0, 1, 0.9921569, 1,
-0.01219797, 0.2428532, 2.009436, 0, 1, 1, 1,
-0.01199018, -0.3956684, -2.89857, 0, 0.9921569, 1, 1,
-0.01055505, 1.214455, -1.457564, 0, 0.9882353, 1, 1,
0.001131142, -0.3503664, 2.655725, 0, 0.9803922, 1, 1,
0.001938687, -0.7557263, 1.950691, 0, 0.9764706, 1, 1,
0.008356851, 0.499077, -0.05793113, 0, 0.9686275, 1, 1,
0.008805637, -0.8180915, 3.276377, 0, 0.9647059, 1, 1,
0.008854951, 0.2870764, 2.3019, 0, 0.9568627, 1, 1,
0.00940019, -1.262767, 4.553824, 0, 0.9529412, 1, 1,
0.01000057, -1.055328, 1.602485, 0, 0.945098, 1, 1,
0.01053034, -1.061183, 3.884586, 0, 0.9411765, 1, 1,
0.01182175, 0.03015093, -0.2268638, 0, 0.9333333, 1, 1,
0.01206238, 2.009759, 0.580332, 0, 0.9294118, 1, 1,
0.01779955, 0.5066711, -1.025813, 0, 0.9215686, 1, 1,
0.02227408, -0.4039368, 2.533736, 0, 0.9176471, 1, 1,
0.02417511, 0.7996603, 1.035214, 0, 0.9098039, 1, 1,
0.0279644, 1.288482, 0.659057, 0, 0.9058824, 1, 1,
0.03038675, 0.713687, -0.05643945, 0, 0.8980392, 1, 1,
0.03358652, 0.08589499, 0.5248475, 0, 0.8901961, 1, 1,
0.03401021, 0.6378958, -0.64895, 0, 0.8862745, 1, 1,
0.03585389, 2.78043, -0.9627467, 0, 0.8784314, 1, 1,
0.0369203, -0.777141, 4.889997, 0, 0.8745098, 1, 1,
0.04164028, 0.1234037, 1.275554, 0, 0.8666667, 1, 1,
0.04647215, -1.642696, 4.662252, 0, 0.8627451, 1, 1,
0.04820881, -0.2387304, 3.511484, 0, 0.854902, 1, 1,
0.05092466, 0.1344158, 0.5641124, 0, 0.8509804, 1, 1,
0.05198331, 1.019531, 1.106544, 0, 0.8431373, 1, 1,
0.05592228, -0.7738649, 2.557077, 0, 0.8392157, 1, 1,
0.06150408, 1.335252, -0.2477597, 0, 0.8313726, 1, 1,
0.06217893, 0.4667854, 1.192938, 0, 0.827451, 1, 1,
0.06682254, 0.9798545, 0.7740963, 0, 0.8196079, 1, 1,
0.06741642, 0.2390374, -0.05295305, 0, 0.8156863, 1, 1,
0.06873123, -0.8567522, 3.746059, 0, 0.8078431, 1, 1,
0.07223778, 1.755899, -0.9690421, 0, 0.8039216, 1, 1,
0.07347447, 0.6473131, -0.7222236, 0, 0.7960784, 1, 1,
0.07871311, -1.939185, 1.987031, 0, 0.7882353, 1, 1,
0.08257172, -0.1876622, 0.2105598, 0, 0.7843137, 1, 1,
0.08502688, -0.2590377, 3.632086, 0, 0.7764706, 1, 1,
0.08807328, -0.673271, 3.984804, 0, 0.772549, 1, 1,
0.08911426, 2.434017, -1.192651, 0, 0.7647059, 1, 1,
0.09146709, -0.4598342, 4.399697, 0, 0.7607843, 1, 1,
0.09332036, 0.07014008, 1.927378, 0, 0.7529412, 1, 1,
0.09463384, 0.3017457, 1.214969, 0, 0.7490196, 1, 1,
0.09710993, 0.3772498, 0.1315061, 0, 0.7411765, 1, 1,
0.09902736, -1.395477, 2.782559, 0, 0.7372549, 1, 1,
0.1093071, -1.560458, 4.801118, 0, 0.7294118, 1, 1,
0.1101236, -0.53461, 3.528184, 0, 0.7254902, 1, 1,
0.1104412, 1.057028, -0.6521008, 0, 0.7176471, 1, 1,
0.1125041, 0.6075285, 0.4406644, 0, 0.7137255, 1, 1,
0.1147374, -0.7203881, 2.321361, 0, 0.7058824, 1, 1,
0.1217406, -1.925136, 2.829522, 0, 0.6980392, 1, 1,
0.1228797, 0.1792763, 1.401603, 0, 0.6941177, 1, 1,
0.1261928, -0.1513601, -0.7187345, 0, 0.6862745, 1, 1,
0.1296788, 1.429572, -1.047559, 0, 0.682353, 1, 1,
0.1300621, 0.9624627, -1.401891, 0, 0.6745098, 1, 1,
0.1403386, 1.857732, 0.1511659, 0, 0.6705883, 1, 1,
0.1425477, -2.822885, 2.066025, 0, 0.6627451, 1, 1,
0.1517922, -0.200174, 2.920918, 0, 0.6588235, 1, 1,
0.1522363, 0.002158391, 2.920705, 0, 0.6509804, 1, 1,
0.1560687, -0.2159645, 1.939495, 0, 0.6470588, 1, 1,
0.157873, 1.114446, 0.1004003, 0, 0.6392157, 1, 1,
0.1591797, 1.103898, 0.597786, 0, 0.6352941, 1, 1,
0.1596047, 0.7428294, -1.276855, 0, 0.627451, 1, 1,
0.1643558, 0.8575922, 1.3024, 0, 0.6235294, 1, 1,
0.1652443, 1.503955, -0.3001629, 0, 0.6156863, 1, 1,
0.1702586, -0.3713455, 2.889042, 0, 0.6117647, 1, 1,
0.1740713, -0.7247812, 3.08888, 0, 0.6039216, 1, 1,
0.1772953, -0.2529313, 4.035964, 0, 0.5960785, 1, 1,
0.1799794, -0.2522541, 2.316439, 0, 0.5921569, 1, 1,
0.1826247, 0.343833, 0.9442027, 0, 0.5843138, 1, 1,
0.1843691, -1.719761, 5.188199, 0, 0.5803922, 1, 1,
0.1860597, 0.0634824, 1.883421, 0, 0.572549, 1, 1,
0.186319, -0.1096209, 1.490868, 0, 0.5686275, 1, 1,
0.1875083, 0.5670925, 0.4721805, 0, 0.5607843, 1, 1,
0.1890792, 0.07497571, -0.136427, 0, 0.5568628, 1, 1,
0.1898573, -0.02958046, 0.2624141, 0, 0.5490196, 1, 1,
0.1919134, 0.2079526, 1.044521, 0, 0.5450981, 1, 1,
0.1926957, 0.3008106, -1.034793, 0, 0.5372549, 1, 1,
0.1956027, 0.5896752, 1.344066, 0, 0.5333334, 1, 1,
0.1958984, -1.212597, 3.551296, 0, 0.5254902, 1, 1,
0.2032356, -0.1111096, 0.727057, 0, 0.5215687, 1, 1,
0.2103952, 0.6335781, 1.178488, 0, 0.5137255, 1, 1,
0.2200214, 1.303397, -1.332323, 0, 0.509804, 1, 1,
0.2206068, 0.9279851, 1.962707, 0, 0.5019608, 1, 1,
0.221168, -0.4666036, 2.191609, 0, 0.4941176, 1, 1,
0.2296966, 0.4457838, 0.09306774, 0, 0.4901961, 1, 1,
0.2297113, -1.301701, 2.951104, 0, 0.4823529, 1, 1,
0.2313882, 0.4617207, 0.4584264, 0, 0.4784314, 1, 1,
0.2324786, 0.7469632, 0.5561877, 0, 0.4705882, 1, 1,
0.2352734, -1.902258, 3.991119, 0, 0.4666667, 1, 1,
0.2389632, -0.2442991, 4.642072, 0, 0.4588235, 1, 1,
0.2389995, 1.241256, 0.5004905, 0, 0.454902, 1, 1,
0.2397417, -0.2580357, 3.737998, 0, 0.4470588, 1, 1,
0.2411675, 0.5220241, -0.07843748, 0, 0.4431373, 1, 1,
0.2458725, 0.8667142, -2.243337, 0, 0.4352941, 1, 1,
0.2467493, 0.1057292, 1.519902, 0, 0.4313726, 1, 1,
0.2480458, 0.5579847, 0.7270083, 0, 0.4235294, 1, 1,
0.2485256, -0.4074728, 2.715983, 0, 0.4196078, 1, 1,
0.2502729, 0.6158779, -0.3675378, 0, 0.4117647, 1, 1,
0.25309, 0.7945741, -1.08237, 0, 0.4078431, 1, 1,
0.2545406, -0.475701, 3.293485, 0, 0.4, 1, 1,
0.2583655, 0.9852574, 2.010138, 0, 0.3921569, 1, 1,
0.2634839, -0.1201673, 4.075346, 0, 0.3882353, 1, 1,
0.2687937, 1.630832, -0.02435005, 0, 0.3803922, 1, 1,
0.2697484, -0.02077323, 3.364654, 0, 0.3764706, 1, 1,
0.2707207, 1.338946, -1.660101, 0, 0.3686275, 1, 1,
0.2712024, -1.943748, 3.831218, 0, 0.3647059, 1, 1,
0.2712713, -0.8782554, 3.612612, 0, 0.3568628, 1, 1,
0.2717562, -0.004138129, 2.42747, 0, 0.3529412, 1, 1,
0.2748858, 0.05313419, 3.091459, 0, 0.345098, 1, 1,
0.2788048, 0.1847973, 1.048913, 0, 0.3411765, 1, 1,
0.2801405, -0.07320807, 1.394929, 0, 0.3333333, 1, 1,
0.2828839, 0.6311436, 1.425121, 0, 0.3294118, 1, 1,
0.2835223, -0.05224085, 2.868913, 0, 0.3215686, 1, 1,
0.283878, 1.714583, -0.5622689, 0, 0.3176471, 1, 1,
0.2844746, 0.3100836, -1.286029, 0, 0.3098039, 1, 1,
0.2875196, 0.5726972, 0.4993775, 0, 0.3058824, 1, 1,
0.2971399, 0.6811309, 2.230314, 0, 0.2980392, 1, 1,
0.2990213, 0.1368932, 2.559162, 0, 0.2901961, 1, 1,
0.3024933, -0.7718554, 3.140814, 0, 0.2862745, 1, 1,
0.3026739, -0.2465093, 2.469293, 0, 0.2784314, 1, 1,
0.3031183, -0.98073, 1.898318, 0, 0.2745098, 1, 1,
0.3066992, -0.4848536, 3.502243, 0, 0.2666667, 1, 1,
0.3068173, 0.09591117, 0.6876038, 0, 0.2627451, 1, 1,
0.308322, -0.1172164, 2.553369, 0, 0.254902, 1, 1,
0.3110785, -0.2484182, 1.757424, 0, 0.2509804, 1, 1,
0.3127638, -0.3294384, 2.354324, 0, 0.2431373, 1, 1,
0.3157094, -0.8977543, 1.691447, 0, 0.2392157, 1, 1,
0.3202372, -0.6426076, 3.22051, 0, 0.2313726, 1, 1,
0.3203565, 0.5744209, -1.030961, 0, 0.227451, 1, 1,
0.3209802, 1.687503, 0.04772703, 0, 0.2196078, 1, 1,
0.321318, -0.4228359, 3.334074, 0, 0.2156863, 1, 1,
0.3215463, 0.3440111, 0.1889126, 0, 0.2078431, 1, 1,
0.3223595, -0.02741157, 1.90531, 0, 0.2039216, 1, 1,
0.3251322, -1.602979, 3.168681, 0, 0.1960784, 1, 1,
0.3308906, -0.5890963, 2.041023, 0, 0.1882353, 1, 1,
0.3319903, 0.4284921, 1.2175, 0, 0.1843137, 1, 1,
0.3355457, -0.6692216, 2.772799, 0, 0.1764706, 1, 1,
0.3401369, 0.522771, 1.278568, 0, 0.172549, 1, 1,
0.3453677, 0.93259, 1.208833, 0, 0.1647059, 1, 1,
0.3519002, 0.5568648, 1.18981, 0, 0.1607843, 1, 1,
0.3564103, -0.08630942, 1.768716, 0, 0.1529412, 1, 1,
0.3588713, 1.540061, 0.2643229, 0, 0.1490196, 1, 1,
0.3600932, -0.8716027, 2.119224, 0, 0.1411765, 1, 1,
0.3602556, 0.602771, 0.3027332, 0, 0.1372549, 1, 1,
0.3627464, -0.1727199, 1.683533, 0, 0.1294118, 1, 1,
0.3628831, 0.5193939, 0.9853378, 0, 0.1254902, 1, 1,
0.3636767, 0.4427354, 1.288666, 0, 0.1176471, 1, 1,
0.3639149, -0.07441763, 0.6472856, 0, 0.1137255, 1, 1,
0.3650726, -0.04582094, 1.050279, 0, 0.1058824, 1, 1,
0.3654364, 2.029959, -0.9969279, 0, 0.09803922, 1, 1,
0.3683993, 0.110741, 1.209139, 0, 0.09411765, 1, 1,
0.3766003, -1.173604, 1.77484, 0, 0.08627451, 1, 1,
0.3771191, 1.226898, 0.3991684, 0, 0.08235294, 1, 1,
0.3798031, -0.6426571, 2.66224, 0, 0.07450981, 1, 1,
0.387923, 0.5791122, 1.99742, 0, 0.07058824, 1, 1,
0.3892829, -1.356346, 3.763325, 0, 0.0627451, 1, 1,
0.3909068, 0.3968466, 1.639895, 0, 0.05882353, 1, 1,
0.39428, -0.2095401, 1.897654, 0, 0.05098039, 1, 1,
0.3943425, -0.3091028, 2.629794, 0, 0.04705882, 1, 1,
0.3959456, -1.698413, 5.296961, 0, 0.03921569, 1, 1,
0.3987813, -0.9326523, 3.034324, 0, 0.03529412, 1, 1,
0.403479, -1.421894, 2.233311, 0, 0.02745098, 1, 1,
0.4045845, -0.7691201, 3.593228, 0, 0.02352941, 1, 1,
0.4085928, 0.3390884, 0.4997097, 0, 0.01568628, 1, 1,
0.4104625, -1.136658, 3.851667, 0, 0.01176471, 1, 1,
0.4115888, -0.7134795, 2.112819, 0, 0.003921569, 1, 1,
0.415747, 0.408348, -0.09230967, 0.003921569, 0, 1, 1,
0.4166142, 0.3334299, 0.862057, 0.007843138, 0, 1, 1,
0.417895, 1.194134, 1.352545, 0.01568628, 0, 1, 1,
0.4206759, -0.3644223, 3.39309, 0.01960784, 0, 1, 1,
0.4208831, 0.2176574, 1.052016, 0.02745098, 0, 1, 1,
0.4214606, -0.2536679, 2.374593, 0.03137255, 0, 1, 1,
0.4239985, 1.061414, 1.826269, 0.03921569, 0, 1, 1,
0.426462, 0.9139971, 0.4225076, 0.04313726, 0, 1, 1,
0.4353347, 0.334484, -0.08465456, 0.05098039, 0, 1, 1,
0.4372095, -1.131578, 2.502146, 0.05490196, 0, 1, 1,
0.4381937, -1.061619, 1.194993, 0.0627451, 0, 1, 1,
0.4398178, -1.071673, 3.466062, 0.06666667, 0, 1, 1,
0.4412838, 0.9372938, 2.297906, 0.07450981, 0, 1, 1,
0.444156, 0.2770069, 2.325746, 0.07843138, 0, 1, 1,
0.4479083, 0.9022755, -1.110152, 0.08627451, 0, 1, 1,
0.4498258, -0.08723016, 1.600347, 0.09019608, 0, 1, 1,
0.4511702, 1.509196, 0.09194493, 0.09803922, 0, 1, 1,
0.4591776, -0.5208226, 3.145395, 0.1058824, 0, 1, 1,
0.4597037, -0.8464044, 3.419877, 0.1098039, 0, 1, 1,
0.4622088, 1.477782, 0.9014711, 0.1176471, 0, 1, 1,
0.467305, -0.03225309, 0.960018, 0.1215686, 0, 1, 1,
0.4685777, -0.4475783, 1.61347, 0.1294118, 0, 1, 1,
0.4688864, 0.9061672, 0.3438493, 0.1333333, 0, 1, 1,
0.4695223, 1.567578, 1.806082, 0.1411765, 0, 1, 1,
0.4723688, -0.3586298, 1.555584, 0.145098, 0, 1, 1,
0.4789676, -1.153285, 3.140799, 0.1529412, 0, 1, 1,
0.4853012, 0.5933921, -0.2838863, 0.1568628, 0, 1, 1,
0.4883346, -1.128401, 1.797385, 0.1647059, 0, 1, 1,
0.4907494, 0.2516116, 1.187949, 0.1686275, 0, 1, 1,
0.4934124, 1.20671, -1.551246, 0.1764706, 0, 1, 1,
0.4973662, -2.517294, 3.717878, 0.1803922, 0, 1, 1,
0.5012191, -0.806808, 1.164103, 0.1882353, 0, 1, 1,
0.5036695, -0.8795427, 4.400328, 0.1921569, 0, 1, 1,
0.5040721, 0.7969723, 0.6903085, 0.2, 0, 1, 1,
0.5162402, 0.3603997, 1.891809, 0.2078431, 0, 1, 1,
0.5173695, 0.2684315, -0.04740488, 0.2117647, 0, 1, 1,
0.5174592, 0.8812345, 1.703903, 0.2196078, 0, 1, 1,
0.5177926, -0.08495, 1.800455, 0.2235294, 0, 1, 1,
0.5179973, 0.4114091, 1.74464, 0.2313726, 0, 1, 1,
0.5206993, 0.2538773, 1.061639, 0.2352941, 0, 1, 1,
0.5227984, -0.6528538, 3.844588, 0.2431373, 0, 1, 1,
0.5252165, 0.2481579, 2.011087, 0.2470588, 0, 1, 1,
0.5338438, 0.2563235, 0.4018881, 0.254902, 0, 1, 1,
0.5389796, 0.7709381, -1.161573, 0.2588235, 0, 1, 1,
0.5409484, -0.5043192, 1.854095, 0.2666667, 0, 1, 1,
0.5487464, -1.254138, 0.7883514, 0.2705882, 0, 1, 1,
0.5496491, 1.018474, 1.262518, 0.2784314, 0, 1, 1,
0.5498545, -0.3915043, -0.6879994, 0.282353, 0, 1, 1,
0.5521263, -0.03985341, 1.959139, 0.2901961, 0, 1, 1,
0.5574561, -0.856591, 0.9781091, 0.2941177, 0, 1, 1,
0.5598087, 0.7665592, -0.5405964, 0.3019608, 0, 1, 1,
0.5628015, -1.049525, 2.35717, 0.3098039, 0, 1, 1,
0.5631739, 0.5622545, 0.5371177, 0.3137255, 0, 1, 1,
0.5653976, 0.6348998, 2.267686, 0.3215686, 0, 1, 1,
0.5678989, -0.3716403, 0.004399928, 0.3254902, 0, 1, 1,
0.5712541, 1.193177, 0.9256297, 0.3333333, 0, 1, 1,
0.5714834, -0.4828157, 1.514161, 0.3372549, 0, 1, 1,
0.5724279, 0.4839191, -0.6323445, 0.345098, 0, 1, 1,
0.5738995, 0.5510209, 0.9279131, 0.3490196, 0, 1, 1,
0.5743616, 0.5183949, 0.6135593, 0.3568628, 0, 1, 1,
0.575138, -1.040285, 2.911548, 0.3607843, 0, 1, 1,
0.5755974, 1.170537, 1.640772, 0.3686275, 0, 1, 1,
0.5779874, -1.053464, 4.361091, 0.372549, 0, 1, 1,
0.5813934, -0.2603819, 3.61738, 0.3803922, 0, 1, 1,
0.5830904, -0.05860431, 1.012308, 0.3843137, 0, 1, 1,
0.58466, 1.797252, -0.3181584, 0.3921569, 0, 1, 1,
0.5866919, 1.673389, 0.5884067, 0.3960784, 0, 1, 1,
0.5963533, 0.4061594, 0.2930247, 0.4039216, 0, 1, 1,
0.5965142, -1.313903, 4.58038, 0.4117647, 0, 1, 1,
0.6027694, 0.9474742, 1.089504, 0.4156863, 0, 1, 1,
0.6057981, -1.432019, 2.361518, 0.4235294, 0, 1, 1,
0.6066268, 0.1080349, 0.8596191, 0.427451, 0, 1, 1,
0.6080195, 0.819602, 1.776473, 0.4352941, 0, 1, 1,
0.6080522, -1.41842, 1.953229, 0.4392157, 0, 1, 1,
0.6099417, 0.8557251, 0.1152904, 0.4470588, 0, 1, 1,
0.614776, -0.2204405, 0.445296, 0.4509804, 0, 1, 1,
0.6200503, 1.256172, 0.6072392, 0.4588235, 0, 1, 1,
0.6273291, -0.1582388, 1.249681, 0.4627451, 0, 1, 1,
0.6294887, -0.5701609, 3.125302, 0.4705882, 0, 1, 1,
0.6296577, 3.028924, -0.6655407, 0.4745098, 0, 1, 1,
0.6299425, -0.4694416, 1.946166, 0.4823529, 0, 1, 1,
0.6303446, 1.581328, 0.04809795, 0.4862745, 0, 1, 1,
0.632538, -0.3747445, 0.5629657, 0.4941176, 0, 1, 1,
0.638325, -0.5766202, 1.860787, 0.5019608, 0, 1, 1,
0.6394822, -0.2438565, 4.119106, 0.5058824, 0, 1, 1,
0.6410224, 0.3394971, 3.675485, 0.5137255, 0, 1, 1,
0.6416157, 0.009962062, 3.101457, 0.5176471, 0, 1, 1,
0.6434869, 0.4296951, 0.7537136, 0.5254902, 0, 1, 1,
0.6445436, -0.6442524, 3.652612, 0.5294118, 0, 1, 1,
0.6449183, -0.3101474, 1.772808, 0.5372549, 0, 1, 1,
0.6450776, 1.424178, 0.7574247, 0.5411765, 0, 1, 1,
0.6454498, -1.587794, 2.140147, 0.5490196, 0, 1, 1,
0.6466817, -0.9228257, 2.672117, 0.5529412, 0, 1, 1,
0.6499268, -0.1456179, 2.83626, 0.5607843, 0, 1, 1,
0.6507451, 0.07344739, 1.70698, 0.5647059, 0, 1, 1,
0.6531617, -0.009471354, 1.105852, 0.572549, 0, 1, 1,
0.6544042, -1.551925, 3.803112, 0.5764706, 0, 1, 1,
0.6649689, 0.9604016, 0.8342164, 0.5843138, 0, 1, 1,
0.6699845, 0.6570396, 1.303619, 0.5882353, 0, 1, 1,
0.6828663, -0.2439502, 1.041624, 0.5960785, 0, 1, 1,
0.6830629, -1.614062, 1.393751, 0.6039216, 0, 1, 1,
0.6859429, 0.3446122, -0.09813323, 0.6078432, 0, 1, 1,
0.6875281, -0.08491062, 2.05599, 0.6156863, 0, 1, 1,
0.6934129, 1.10276, 0.4320449, 0.6196079, 0, 1, 1,
0.6982902, -0.6550547, 2.887533, 0.627451, 0, 1, 1,
0.6983951, 1.28018, -0.6058899, 0.6313726, 0, 1, 1,
0.700682, 0.6512262, 2.518738, 0.6392157, 0, 1, 1,
0.7037443, -0.7031445, 4.75956, 0.6431373, 0, 1, 1,
0.7143824, -1.072544, 3.89641, 0.6509804, 0, 1, 1,
0.7220626, -0.2423894, 3.142726, 0.654902, 0, 1, 1,
0.7309946, 0.9511896, 1.337415, 0.6627451, 0, 1, 1,
0.7354497, -0.1298366, -0.4580622, 0.6666667, 0, 1, 1,
0.7430258, 1.216679, 0.8251143, 0.6745098, 0, 1, 1,
0.7600952, 1.943642, -0.2149649, 0.6784314, 0, 1, 1,
0.762872, 0.211039, 1.060222, 0.6862745, 0, 1, 1,
0.7647221, 1.095782, -0.005970464, 0.6901961, 0, 1, 1,
0.7712999, -0.7911782, 2.410525, 0.6980392, 0, 1, 1,
0.7761357, 0.9387563, 2.411044, 0.7058824, 0, 1, 1,
0.7764426, 0.8685367, 0.9169227, 0.7098039, 0, 1, 1,
0.7795258, -0.365215, 2.649363, 0.7176471, 0, 1, 1,
0.7871197, 1.077374, 1.209606, 0.7215686, 0, 1, 1,
0.7897003, 1.394883, 0.6752465, 0.7294118, 0, 1, 1,
0.7897813, -1.183049, 1.662557, 0.7333333, 0, 1, 1,
0.7923725, 0.5174338, -0.3124526, 0.7411765, 0, 1, 1,
0.7933794, 0.8737254, 1.055964, 0.7450981, 0, 1, 1,
0.7958966, -0.8121432, 1.85016, 0.7529412, 0, 1, 1,
0.7987693, 1.937333, -0.6879729, 0.7568628, 0, 1, 1,
0.7989596, -0.9093875, 2.837599, 0.7647059, 0, 1, 1,
0.7992852, 0.3287951, 1.729595, 0.7686275, 0, 1, 1,
0.8060517, 0.0982919, 1.10117, 0.7764706, 0, 1, 1,
0.8087029, -0.6241277, 1.008172, 0.7803922, 0, 1, 1,
0.8120744, -0.4138009, 3.601572, 0.7882353, 0, 1, 1,
0.8134667, 0.0719252, 1.334509, 0.7921569, 0, 1, 1,
0.8155137, -1.181607, 1.654633, 0.8, 0, 1, 1,
0.816875, 0.6281258, 2.606967, 0.8078431, 0, 1, 1,
0.8213632, -0.0729221, 2.147681, 0.8117647, 0, 1, 1,
0.8289362, -0.4531082, 0.03116741, 0.8196079, 0, 1, 1,
0.8333418, -0.4625472, 1.752752, 0.8235294, 0, 1, 1,
0.8355221, -2.391921, 0.7677969, 0.8313726, 0, 1, 1,
0.8357762, 0.4583189, 1.032416, 0.8352941, 0, 1, 1,
0.8391301, -0.2631269, 0.9687765, 0.8431373, 0, 1, 1,
0.8399859, 1.675806, 1.597299, 0.8470588, 0, 1, 1,
0.8400655, -0.1299218, 3.720815, 0.854902, 0, 1, 1,
0.8501178, -1.984158, 2.06467, 0.8588235, 0, 1, 1,
0.8547208, -2.087222, 0.6506994, 0.8666667, 0, 1, 1,
0.8556402, 0.5348938, 1.026164, 0.8705882, 0, 1, 1,
0.8585171, 0.7194818, 2.177754, 0.8784314, 0, 1, 1,
0.864167, 0.1777913, 1.84688, 0.8823529, 0, 1, 1,
0.8642098, -1.184723, 2.209076, 0.8901961, 0, 1, 1,
0.866149, 0.4539226, 2.519264, 0.8941177, 0, 1, 1,
0.8832203, -0.6513302, 1.320924, 0.9019608, 0, 1, 1,
0.8841108, 3.606024, -0.4770699, 0.9098039, 0, 1, 1,
0.8920116, 1.378169, -0.2371736, 0.9137255, 0, 1, 1,
0.892415, -1.081316, 2.342565, 0.9215686, 0, 1, 1,
0.9019759, -0.4606109, 0.5585152, 0.9254902, 0, 1, 1,
0.9030378, -0.2265353, 3.150508, 0.9333333, 0, 1, 1,
0.90534, 0.4846429, 1.028376, 0.9372549, 0, 1, 1,
0.906273, 0.4754846, 0.488785, 0.945098, 0, 1, 1,
0.9073619, -1.106959, 2.189877, 0.9490196, 0, 1, 1,
0.9078995, -0.3714414, 1.780022, 0.9568627, 0, 1, 1,
0.9093596, -0.1039284, 1.356487, 0.9607843, 0, 1, 1,
0.9176905, -0.2847504, 1.941158, 0.9686275, 0, 1, 1,
0.9186776, 0.1459557, 2.355564, 0.972549, 0, 1, 1,
0.9285671, 0.2982086, 2.545816, 0.9803922, 0, 1, 1,
0.9349653, 1.063375, 0.836946, 0.9843137, 0, 1, 1,
0.9392788, 0.7481201, 0.9847429, 0.9921569, 0, 1, 1,
0.9408265, 1.179743, 0.560729, 0.9960784, 0, 1, 1,
0.9410926, 0.2430557, 0.6902804, 1, 0, 0.9960784, 1,
0.9416167, 0.779936, 2.59541, 1, 0, 0.9882353, 1,
0.943997, -0.8021931, 2.728718, 1, 0, 0.9843137, 1,
0.9482141, 1.301742, 0.7207033, 1, 0, 0.9764706, 1,
0.9506004, 3.370446, 0.2994274, 1, 0, 0.972549, 1,
0.9511186, 0.4903806, 0.6609334, 1, 0, 0.9647059, 1,
0.9514988, -0.03535573, 1.884184, 1, 0, 0.9607843, 1,
0.9574558, -0.3397618, 2.499308, 1, 0, 0.9529412, 1,
0.9634361, -0.5389239, 4.332307, 1, 0, 0.9490196, 1,
0.9641392, -0.6259365, 3.615303, 1, 0, 0.9411765, 1,
0.9761159, -0.02036479, 1.384287, 1, 0, 0.9372549, 1,
0.9780675, 1.136974, 2.605393, 1, 0, 0.9294118, 1,
0.9860404, 0.3236178, -0.04027831, 1, 0, 0.9254902, 1,
0.9882399, -1.081872, 2.751878, 1, 0, 0.9176471, 1,
0.994527, -2.029286, 4.222372, 1, 0, 0.9137255, 1,
0.9959219, -0.1592499, 1.667327, 1, 0, 0.9058824, 1,
1.008924, 0.993651, -0.5698003, 1, 0, 0.9019608, 1,
1.010308, 0.592231, 1.447314, 1, 0, 0.8941177, 1,
1.010573, -1.634896, 3.039935, 1, 0, 0.8862745, 1,
1.010818, -0.07796533, 1.511902, 1, 0, 0.8823529, 1,
1.014491, -1.378234, 0.4731667, 1, 0, 0.8745098, 1,
1.016115, -0.2818043, 2.410931, 1, 0, 0.8705882, 1,
1.017807, -0.8612015, 2.309525, 1, 0, 0.8627451, 1,
1.026066, -0.7846881, 2.679948, 1, 0, 0.8588235, 1,
1.031822, -1.661391, 1.299253, 1, 0, 0.8509804, 1,
1.041596, 0.3928626, 1.064546, 1, 0, 0.8470588, 1,
1.044174, 0.5559127, 0.7182087, 1, 0, 0.8392157, 1,
1.047833, -1.771491, 2.241522, 1, 0, 0.8352941, 1,
1.053316, -1.348973, 1.691071, 1, 0, 0.827451, 1,
1.070759, -0.1368177, 0.7338657, 1, 0, 0.8235294, 1,
1.075217, -1.177514, 0.8960695, 1, 0, 0.8156863, 1,
1.08201, 0.5738038, 3.419602, 1, 0, 0.8117647, 1,
1.086805, -3.477215, 3.995342, 1, 0, 0.8039216, 1,
1.092446, -1.545275, 1.962567, 1, 0, 0.7960784, 1,
1.093981, 1.161196, 0.2866591, 1, 0, 0.7921569, 1,
1.096472, -0.3764988, 2.035333, 1, 0, 0.7843137, 1,
1.097138, -0.9943913, 2.423743, 1, 0, 0.7803922, 1,
1.098394, 0.4520014, 0.8164358, 1, 0, 0.772549, 1,
1.103655, -1.323031, 1.498379, 1, 0, 0.7686275, 1,
1.110066, -1.099423, 1.436298, 1, 0, 0.7607843, 1,
1.112097, -2.841712, 2.794265, 1, 0, 0.7568628, 1,
1.118918, 0.1682982, 1.152364, 1, 0, 0.7490196, 1,
1.120602, -0.2002317, -0.0006358461, 1, 0, 0.7450981, 1,
1.129832, -0.7237394, 2.397656, 1, 0, 0.7372549, 1,
1.130208, 1.979958, 0.6189905, 1, 0, 0.7333333, 1,
1.152053, -1.289981, 1.150566, 1, 0, 0.7254902, 1,
1.159663, -0.4666825, 3.116505, 1, 0, 0.7215686, 1,
1.163448, -0.99142, 2.602615, 1, 0, 0.7137255, 1,
1.167268, -0.1590438, 2.160639, 1, 0, 0.7098039, 1,
1.169773, -0.09386057, 2.429297, 1, 0, 0.7019608, 1,
1.190589, -1.114096, 4.061275, 1, 0, 0.6941177, 1,
1.197211, 2.329311, 2.703172, 1, 0, 0.6901961, 1,
1.200162, 0.281857, 0.3234088, 1, 0, 0.682353, 1,
1.201469, -0.6094795, 1.191753, 1, 0, 0.6784314, 1,
1.205017, 0.1418637, 2.066092, 1, 0, 0.6705883, 1,
1.209906, -2.040594, 3.933824, 1, 0, 0.6666667, 1,
1.213053, 0.8873248, 1.134488, 1, 0, 0.6588235, 1,
1.220234, -0.3520428, 1.68785, 1, 0, 0.654902, 1,
1.227956, -0.7953728, 1.189797, 1, 0, 0.6470588, 1,
1.233687, -1.150793, 2.555285, 1, 0, 0.6431373, 1,
1.236217, 0.6560298, -2.167725, 1, 0, 0.6352941, 1,
1.23737, 2.933518, 0.9362243, 1, 0, 0.6313726, 1,
1.2392, -0.4207512, 2.787662, 1, 0, 0.6235294, 1,
1.247668, 0.7720032, 1.679177, 1, 0, 0.6196079, 1,
1.25586, -0.4956146, 4.533185, 1, 0, 0.6117647, 1,
1.26236, 1.141826, 0.221267, 1, 0, 0.6078432, 1,
1.278837, 0.8297321, 1.730375, 1, 0, 0.6, 1,
1.303945, -0.6775674, 1.061084, 1, 0, 0.5921569, 1,
1.305443, -0.431674, 0.09590948, 1, 0, 0.5882353, 1,
1.30673, 0.5889938, -0.8872006, 1, 0, 0.5803922, 1,
1.306869, 0.4904055, 0.984485, 1, 0, 0.5764706, 1,
1.309255, -0.6336216, 1.46603, 1, 0, 0.5686275, 1,
1.312539, 0.08267105, 0.4234465, 1, 0, 0.5647059, 1,
1.315792, 0.1075524, 0.1029784, 1, 0, 0.5568628, 1,
1.322527, 1.524148, -0.2255913, 1, 0, 0.5529412, 1,
1.32769, 1.273931, 1.794265, 1, 0, 0.5450981, 1,
1.32883, -0.5752869, 2.901344, 1, 0, 0.5411765, 1,
1.332709, -0.7098861, 1.810814, 1, 0, 0.5333334, 1,
1.342841, -1.166731, 1.055324, 1, 0, 0.5294118, 1,
1.344095, 0.3382776, 1.790811, 1, 0, 0.5215687, 1,
1.346927, 0.3412337, 0.1103683, 1, 0, 0.5176471, 1,
1.360963, 0.484617, 0.7904639, 1, 0, 0.509804, 1,
1.36367, -1.399662, 2.620798, 1, 0, 0.5058824, 1,
1.367442, -1.061279, 2.61173, 1, 0, 0.4980392, 1,
1.373537, 0.2956964, -1.24029, 1, 0, 0.4901961, 1,
1.38519, -0.2006436, 0.9165769, 1, 0, 0.4862745, 1,
1.39191, 3.289027, 0.7578225, 1, 0, 0.4784314, 1,
1.412033, -0.2950669, 1.880894, 1, 0, 0.4745098, 1,
1.412555, -0.9371544, 2.334716, 1, 0, 0.4666667, 1,
1.417878, -0.3038106, 0.4036678, 1, 0, 0.4627451, 1,
1.425014, -0.9964731, 1.523321, 1, 0, 0.454902, 1,
1.426328, -0.1439116, 0.7817487, 1, 0, 0.4509804, 1,
1.426735, -0.9509766, 1.696771, 1, 0, 0.4431373, 1,
1.440965, 0.2546637, 0.8731824, 1, 0, 0.4392157, 1,
1.445608, -0.3842794, 2.533093, 1, 0, 0.4313726, 1,
1.451064, -0.4171011, 1.927419, 1, 0, 0.427451, 1,
1.453897, -0.7056972, 1.307938, 1, 0, 0.4196078, 1,
1.458176, 1.166195, 0.3824819, 1, 0, 0.4156863, 1,
1.463642, -0.8191081, 1.741605, 1, 0, 0.4078431, 1,
1.463778, 1.046675, 2.165504, 1, 0, 0.4039216, 1,
1.504324, -0.2573372, 1.561063, 1, 0, 0.3960784, 1,
1.507426, -0.8257267, 1.682242, 1, 0, 0.3882353, 1,
1.511526, 1.084, 1.17784, 1, 0, 0.3843137, 1,
1.513504, -0.03923272, -0.4866064, 1, 0, 0.3764706, 1,
1.53634, 0.6190909, 2.90335, 1, 0, 0.372549, 1,
1.549484, -0.4642444, 2.91806, 1, 0, 0.3647059, 1,
1.557172, 0.2561204, 2.50165, 1, 0, 0.3607843, 1,
1.568428, -0.3410756, 0.5928953, 1, 0, 0.3529412, 1,
1.583002, -0.9070221, 2.754408, 1, 0, 0.3490196, 1,
1.585971, -0.4007551, -0.1022706, 1, 0, 0.3411765, 1,
1.588251, 1.249315, 1.401697, 1, 0, 0.3372549, 1,
1.591516, -0.99966, 0.3629023, 1, 0, 0.3294118, 1,
1.594286, 0.0806048, 1.290058, 1, 0, 0.3254902, 1,
1.594996, 1.082608, 2.310927, 1, 0, 0.3176471, 1,
1.598887, 0.6210936, 1.634012, 1, 0, 0.3137255, 1,
1.599484, 1.237327, 2.07143, 1, 0, 0.3058824, 1,
1.60074, 0.363186, 2.588437, 1, 0, 0.2980392, 1,
1.603486, 0.3463926, 1.227581, 1, 0, 0.2941177, 1,
1.608353, 0.152493, 2.566525, 1, 0, 0.2862745, 1,
1.612164, 0.1742701, 2.736881, 1, 0, 0.282353, 1,
1.61655, 0.04172089, 1.335859, 1, 0, 0.2745098, 1,
1.616948, -0.2567737, 1.347018, 1, 0, 0.2705882, 1,
1.618058, 0.1308417, 1.786692, 1, 0, 0.2627451, 1,
1.632058, -1.203908, 1.527229, 1, 0, 0.2588235, 1,
1.640909, -2.075161, 2.249908, 1, 0, 0.2509804, 1,
1.655836, 0.3961514, 1.591409, 1, 0, 0.2470588, 1,
1.66676, -0.06689522, 2.643957, 1, 0, 0.2392157, 1,
1.668826, -1.138781, 1.429007, 1, 0, 0.2352941, 1,
1.690899, -1.333489, 3.134322, 1, 0, 0.227451, 1,
1.694859, -0.2793436, 2.180023, 1, 0, 0.2235294, 1,
1.695158, -0.6636646, 1.695535, 1, 0, 0.2156863, 1,
1.704723, 0.1552896, 2.587562, 1, 0, 0.2117647, 1,
1.71688, -0.4881924, 2.951964, 1, 0, 0.2039216, 1,
1.724776, -0.2946559, 1.230365, 1, 0, 0.1960784, 1,
1.785849, -1.115127, 1.654489, 1, 0, 0.1921569, 1,
1.799223, 0.4010039, 0.9370022, 1, 0, 0.1843137, 1,
1.79927, -0.1367742, -0.3211075, 1, 0, 0.1803922, 1,
1.806301, -1.031424, 2.950636, 1, 0, 0.172549, 1,
1.825006, -1.478361, 1.602747, 1, 0, 0.1686275, 1,
1.825521, -0.6883205, 0.6710674, 1, 0, 0.1607843, 1,
1.833256, -1.967, 2.618315, 1, 0, 0.1568628, 1,
1.860229, 0.147725, 1.205196, 1, 0, 0.1490196, 1,
1.88144, 1.729153, 0.1430167, 1, 0, 0.145098, 1,
1.926834, 0.8656743, 0.247288, 1, 0, 0.1372549, 1,
1.96048, 2.561062, 2.329259, 1, 0, 0.1333333, 1,
1.963506, -0.4364396, 3.452358, 1, 0, 0.1254902, 1,
2.004408, 0.3272856, 0.2617317, 1, 0, 0.1215686, 1,
2.01069, -1.6285, 2.355361, 1, 0, 0.1137255, 1,
2.021797, 0.9216264, -0.2678644, 1, 0, 0.1098039, 1,
2.142488, -0.2946909, 1.811495, 1, 0, 0.1019608, 1,
2.187881, -0.8928936, 1.859176, 1, 0, 0.09411765, 1,
2.248823, 0.4175872, 1.017918, 1, 0, 0.09019608, 1,
2.28165, 0.6173484, -0.01444431, 1, 0, 0.08235294, 1,
2.380762, -0.5726045, 0.5012701, 1, 0, 0.07843138, 1,
2.387795, 1.201205, 1.249483, 1, 0, 0.07058824, 1,
2.443983, 1.262531, 0.7388874, 1, 0, 0.06666667, 1,
2.470536, 2.629, 0.5704967, 1, 0, 0.05882353, 1,
2.480226, 1.193037, 2.331002, 1, 0, 0.05490196, 1,
2.485895, 0.9414642, 3.974962, 1, 0, 0.04705882, 1,
2.559396, 0.09237467, 1.22809, 1, 0, 0.04313726, 1,
2.56025, -0.5523002, 3.644427, 1, 0, 0.03529412, 1,
2.685461, 1.783117, -0.03625355, 1, 0, 0.03137255, 1,
2.733723, -0.2890499, 2.416901, 1, 0, 0.02352941, 1,
2.740052, 0.3158589, 3.411416, 1, 0, 0.01960784, 1,
3.214484, -1.778393, 3.219423, 1, 0, 0.01176471, 1,
3.281325, 0.5181436, 1.419449, 1, 0, 0.007843138, 1
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
0.08370221, -4.677824, -7.786301, 0, -0.5, 0.5, 0.5,
0.08370221, -4.677824, -7.786301, 1, -0.5, 0.5, 0.5,
0.08370221, -4.677824, -7.786301, 1, 1.5, 0.5, 0.5,
0.08370221, -4.677824, -7.786301, 0, 1.5, 0.5, 0.5
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
-4.197914, 0.06440473, -7.786301, 0, -0.5, 0.5, 0.5,
-4.197914, 0.06440473, -7.786301, 1, -0.5, 0.5, 0.5,
-4.197914, 0.06440473, -7.786301, 1, 1.5, 0.5, 0.5,
-4.197914, 0.06440473, -7.786301, 0, 1.5, 0.5, 0.5
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
-4.197914, -4.677824, -0.2965672, 0, -0.5, 0.5, 0.5,
-4.197914, -4.677824, -0.2965672, 1, -0.5, 0.5, 0.5,
-4.197914, -4.677824, -0.2965672, 1, 1.5, 0.5, 0.5,
-4.197914, -4.677824, -0.2965672, 0, 1.5, 0.5, 0.5
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
-3, -3.583463, -6.057901,
3, -3.583463, -6.057901,
-3, -3.583463, -6.057901,
-3, -3.765857, -6.345968,
-2, -3.583463, -6.057901,
-2, -3.765857, -6.345968,
-1, -3.583463, -6.057901,
-1, -3.765857, -6.345968,
0, -3.583463, -6.057901,
0, -3.765857, -6.345968,
1, -3.583463, -6.057901,
1, -3.765857, -6.345968,
2, -3.583463, -6.057901,
2, -3.765857, -6.345968,
3, -3.583463, -6.057901,
3, -3.765857, -6.345968
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
-3, -4.130643, -6.922101, 0, -0.5, 0.5, 0.5,
-3, -4.130643, -6.922101, 1, -0.5, 0.5, 0.5,
-3, -4.130643, -6.922101, 1, 1.5, 0.5, 0.5,
-3, -4.130643, -6.922101, 0, 1.5, 0.5, 0.5,
-2, -4.130643, -6.922101, 0, -0.5, 0.5, 0.5,
-2, -4.130643, -6.922101, 1, -0.5, 0.5, 0.5,
-2, -4.130643, -6.922101, 1, 1.5, 0.5, 0.5,
-2, -4.130643, -6.922101, 0, 1.5, 0.5, 0.5,
-1, -4.130643, -6.922101, 0, -0.5, 0.5, 0.5,
-1, -4.130643, -6.922101, 1, -0.5, 0.5, 0.5,
-1, -4.130643, -6.922101, 1, 1.5, 0.5, 0.5,
-1, -4.130643, -6.922101, 0, 1.5, 0.5, 0.5,
0, -4.130643, -6.922101, 0, -0.5, 0.5, 0.5,
0, -4.130643, -6.922101, 1, -0.5, 0.5, 0.5,
0, -4.130643, -6.922101, 1, 1.5, 0.5, 0.5,
0, -4.130643, -6.922101, 0, 1.5, 0.5, 0.5,
1, -4.130643, -6.922101, 0, -0.5, 0.5, 0.5,
1, -4.130643, -6.922101, 1, -0.5, 0.5, 0.5,
1, -4.130643, -6.922101, 1, 1.5, 0.5, 0.5,
1, -4.130643, -6.922101, 0, 1.5, 0.5, 0.5,
2, -4.130643, -6.922101, 0, -0.5, 0.5, 0.5,
2, -4.130643, -6.922101, 1, -0.5, 0.5, 0.5,
2, -4.130643, -6.922101, 1, 1.5, 0.5, 0.5,
2, -4.130643, -6.922101, 0, 1.5, 0.5, 0.5,
3, -4.130643, -6.922101, 0, -0.5, 0.5, 0.5,
3, -4.130643, -6.922101, 1, -0.5, 0.5, 0.5,
3, -4.130643, -6.922101, 1, 1.5, 0.5, 0.5,
3, -4.130643, -6.922101, 0, 1.5, 0.5, 0.5
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
-3.209849, -2, -6.057901,
-3.209849, 2, -6.057901,
-3.209849, -2, -6.057901,
-3.374527, -2, -6.345968,
-3.209849, 0, -6.057901,
-3.374527, 0, -6.345968,
-3.209849, 2, -6.057901,
-3.374527, 2, -6.345968
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
"0",
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
-3.703882, -2, -6.922101, 0, -0.5, 0.5, 0.5,
-3.703882, -2, -6.922101, 1, -0.5, 0.5, 0.5,
-3.703882, -2, -6.922101, 1, 1.5, 0.5, 0.5,
-3.703882, -2, -6.922101, 0, 1.5, 0.5, 0.5,
-3.703882, 0, -6.922101, 0, -0.5, 0.5, 0.5,
-3.703882, 0, -6.922101, 1, -0.5, 0.5, 0.5,
-3.703882, 0, -6.922101, 1, 1.5, 0.5, 0.5,
-3.703882, 0, -6.922101, 0, 1.5, 0.5, 0.5,
-3.703882, 2, -6.922101, 0, -0.5, 0.5, 0.5,
-3.703882, 2, -6.922101, 1, -0.5, 0.5, 0.5,
-3.703882, 2, -6.922101, 1, 1.5, 0.5, 0.5,
-3.703882, 2, -6.922101, 0, 1.5, 0.5, 0.5
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
-3.209849, -3.583463, -4,
-3.209849, -3.583463, 4,
-3.209849, -3.583463, -4,
-3.374527, -3.765857, -4,
-3.209849, -3.583463, -2,
-3.374527, -3.765857, -2,
-3.209849, -3.583463, 0,
-3.374527, -3.765857, 0,
-3.209849, -3.583463, 2,
-3.374527, -3.765857, 2,
-3.209849, -3.583463, 4,
-3.374527, -3.765857, 4
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
-3.703882, -4.130643, -4, 0, -0.5, 0.5, 0.5,
-3.703882, -4.130643, -4, 1, -0.5, 0.5, 0.5,
-3.703882, -4.130643, -4, 1, 1.5, 0.5, 0.5,
-3.703882, -4.130643, -4, 0, 1.5, 0.5, 0.5,
-3.703882, -4.130643, -2, 0, -0.5, 0.5, 0.5,
-3.703882, -4.130643, -2, 1, -0.5, 0.5, 0.5,
-3.703882, -4.130643, -2, 1, 1.5, 0.5, 0.5,
-3.703882, -4.130643, -2, 0, 1.5, 0.5, 0.5,
-3.703882, -4.130643, 0, 0, -0.5, 0.5, 0.5,
-3.703882, -4.130643, 0, 1, -0.5, 0.5, 0.5,
-3.703882, -4.130643, 0, 1, 1.5, 0.5, 0.5,
-3.703882, -4.130643, 0, 0, 1.5, 0.5, 0.5,
-3.703882, -4.130643, 2, 0, -0.5, 0.5, 0.5,
-3.703882, -4.130643, 2, 1, -0.5, 0.5, 0.5,
-3.703882, -4.130643, 2, 1, 1.5, 0.5, 0.5,
-3.703882, -4.130643, 2, 0, 1.5, 0.5, 0.5,
-3.703882, -4.130643, 4, 0, -0.5, 0.5, 0.5,
-3.703882, -4.130643, 4, 1, -0.5, 0.5, 0.5,
-3.703882, -4.130643, 4, 1, 1.5, 0.5, 0.5,
-3.703882, -4.130643, 4, 0, 1.5, 0.5, 0.5
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
-3.209849, -3.583463, -6.057901,
-3.209849, 3.712273, -6.057901,
-3.209849, -3.583463, 5.464767,
-3.209849, 3.712273, 5.464767,
-3.209849, -3.583463, -6.057901,
-3.209849, -3.583463, 5.464767,
-3.209849, 3.712273, -6.057901,
-3.209849, 3.712273, 5.464767,
-3.209849, -3.583463, -6.057901,
3.377253, -3.583463, -6.057901,
-3.209849, -3.583463, 5.464767,
3.377253, -3.583463, 5.464767,
-3.209849, 3.712273, -6.057901,
3.377253, 3.712273, -6.057901,
-3.209849, 3.712273, 5.464767,
3.377253, 3.712273, 5.464767,
3.377253, -3.583463, -6.057901,
3.377253, 3.712273, -6.057901,
3.377253, -3.583463, 5.464767,
3.377253, 3.712273, 5.464767,
3.377253, -3.583463, -6.057901,
3.377253, -3.583463, 5.464767,
3.377253, 3.712273, -6.057901,
3.377253, 3.712273, 5.464767
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
var radius = 8.087463;
var distance = 35.98203;
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
mvMatrix.translate( -0.08370221, -0.06440473, 0.2965672 );
mvMatrix.scale( 1.327492, 1.198553, 0.7588801 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.98203);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Dimethyl_tetrachloro<-read.table("Dimethyl_tetrachloro.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.11392, 0.0006425451, -1.983693, 0, 0, 1, 1, 1,
-2.958683, -0.5491089, -1.395977, 1, 0, 0, 1, 1,
-2.870513, -0.4260921, -2.295844, 1, 0, 0, 1, 1,
-2.308459, -0.1778901, -0.580328, 1, 0, 0, 1, 1,
-2.302656, -0.2374008, -2.752897, 1, 0, 0, 1, 1,
-2.262511, 0.6007995, 2.023762, 1, 0, 0, 1, 1,
-2.240448, -0.5240043, -2.316533, 0, 0, 0, 1, 1,
-2.219685, 0.4497542, -2.028548, 0, 0, 0, 1, 1,
-2.21252, 0.09851838, -0.5845488, 0, 0, 0, 1, 1,
-2.200683, -0.9731535, -1.927042, 0, 0, 0, 1, 1,
-2.191118, -1.831946, -1.32648, 0, 0, 0, 1, 1,
-2.159689, -0.6580282, -3.378823, 0, 0, 0, 1, 1,
-2.125801, 2.117627, -1.363847, 0, 0, 0, 1, 1,
-2.031244, -0.509319, -1.712206, 1, 1, 1, 1, 1,
-2.027338, 1.080052, -1.981513, 1, 1, 1, 1, 1,
-2.018464, -0.1655338, -0.1759344, 1, 1, 1, 1, 1,
-1.993776, 0.78558, -1.305495, 1, 1, 1, 1, 1,
-1.974982, 0.07208695, -2.149856, 1, 1, 1, 1, 1,
-1.966812, -1.279836, -1.249831, 1, 1, 1, 1, 1,
-1.964562, -0.2284174, -0.01864793, 1, 1, 1, 1, 1,
-1.950606, 0.6004773, -1.201149, 1, 1, 1, 1, 1,
-1.935118, -0.421654, -2.569807, 1, 1, 1, 1, 1,
-1.917165, 0.525413, -1.073047, 1, 1, 1, 1, 1,
-1.917108, -1.601397, -0.9350309, 1, 1, 1, 1, 1,
-1.903917, 0.9329273, 0.3001993, 1, 1, 1, 1, 1,
-1.903544, -1.349149, -1.999902, 1, 1, 1, 1, 1,
-1.897212, 2.142183, -1.581564, 1, 1, 1, 1, 1,
-1.896853, 1.008951, -0.4151572, 1, 1, 1, 1, 1,
-1.87167, 0.4630706, -0.7718728, 0, 0, 1, 1, 1,
-1.868843, 0.9214514, -1.693288, 1, 0, 0, 1, 1,
-1.845769, -0.5414622, -0.9563631, 1, 0, 0, 1, 1,
-1.837358, -0.06656806, -0.09186536, 1, 0, 0, 1, 1,
-1.834421, -0.8026704, -1.462036, 1, 0, 0, 1, 1,
-1.826149, -1.088402, -3.180459, 1, 0, 0, 1, 1,
-1.80956, -0.04744461, -2.277903, 0, 0, 0, 1, 1,
-1.793489, -1.731741, -3.366697, 0, 0, 0, 1, 1,
-1.770811, -0.4914056, -2.173416, 0, 0, 0, 1, 1,
-1.746034, 1.06028, 0.3167905, 0, 0, 0, 1, 1,
-1.744398, -1.672575, -1.706368, 0, 0, 0, 1, 1,
-1.729377, -0.2232944, -3.358194, 0, 0, 0, 1, 1,
-1.712678, -0.3454016, -0.02287308, 0, 0, 0, 1, 1,
-1.680017, 0.3862776, 0.2851272, 1, 1, 1, 1, 1,
-1.678644, 2.42574, -0.6405051, 1, 1, 1, 1, 1,
-1.668319, -0.7592602, -2.265248, 1, 1, 1, 1, 1,
-1.652199, -0.4011589, -3.074484, 1, 1, 1, 1, 1,
-1.642911, -0.05955163, -0.3320552, 1, 1, 1, 1, 1,
-1.63963, -0.9470007, -0.6703225, 1, 1, 1, 1, 1,
-1.628406, -0.7699067, -2.580365, 1, 1, 1, 1, 1,
-1.623819, -1.164786, -2.643848, 1, 1, 1, 1, 1,
-1.591776, -2.165266, -1.450847, 1, 1, 1, 1, 1,
-1.5756, 1.332335, -0.4754916, 1, 1, 1, 1, 1,
-1.571625, 0.7054773, -0.989421, 1, 1, 1, 1, 1,
-1.568081, -0.1494609, -3.216313, 1, 1, 1, 1, 1,
-1.554285, 0.6089135, -1.277092, 1, 1, 1, 1, 1,
-1.551156, 0.6349574, -2.252412, 1, 1, 1, 1, 1,
-1.550951, 1.63344, -1.43636, 1, 1, 1, 1, 1,
-1.55031, -0.5206988, -1.751927, 0, 0, 1, 1, 1,
-1.547455, 0.3555779, -1.35823, 1, 0, 0, 1, 1,
-1.547042, -0.2770865, -2.155842, 1, 0, 0, 1, 1,
-1.54214, -0.02681121, -1.033068, 1, 0, 0, 1, 1,
-1.527359, 1.261762, 1.246061, 1, 0, 0, 1, 1,
-1.525027, 1.484902, -0.5708748, 1, 0, 0, 1, 1,
-1.523263, -1.290289, -3.559905, 0, 0, 0, 1, 1,
-1.518298, 0.2293196, -1.572678, 0, 0, 0, 1, 1,
-1.503645, 0.3083551, -1.90547, 0, 0, 0, 1, 1,
-1.483076, -0.7835649, -2.706449, 0, 0, 0, 1, 1,
-1.478923, 0.5724034, -0.3427198, 0, 0, 0, 1, 1,
-1.476784, 0.5736325, -0.6065468, 0, 0, 0, 1, 1,
-1.456669, -1.298855, -1.241002, 0, 0, 0, 1, 1,
-1.456385, -1.727203, -3.727363, 1, 1, 1, 1, 1,
-1.450698, 0.513452, -1.596979, 1, 1, 1, 1, 1,
-1.440241, 0.4601935, -0.999554, 1, 1, 1, 1, 1,
-1.437791, 0.5376477, 0.3219976, 1, 1, 1, 1, 1,
-1.437119, 2.31722, -0.7916939, 1, 1, 1, 1, 1,
-1.43388, 1.459677, -1.032861, 1, 1, 1, 1, 1,
-1.428915, 0.4929973, -1.631444, 1, 1, 1, 1, 1,
-1.422866, -0.4510971, -2.918714, 1, 1, 1, 1, 1,
-1.418134, -0.408296, -1.066097, 1, 1, 1, 1, 1,
-1.413824, 0.562131, -1.200736, 1, 1, 1, 1, 1,
-1.410919, -0.5560601, -2.314229, 1, 1, 1, 1, 1,
-1.409503, 0.3233826, -2.096659, 1, 1, 1, 1, 1,
-1.408961, -0.5266868, -3.478884, 1, 1, 1, 1, 1,
-1.407357, 1.063145, -0.3056234, 1, 1, 1, 1, 1,
-1.406725, -0.3037322, -2.454367, 1, 1, 1, 1, 1,
-1.388758, 0.1507828, -0.02163268, 0, 0, 1, 1, 1,
-1.375735, -1.240242, -1.395794, 1, 0, 0, 1, 1,
-1.374583, 0.8185514, 0.6534529, 1, 0, 0, 1, 1,
-1.373771, 0.9984854, -1.794094, 1, 0, 0, 1, 1,
-1.3721, -1.316552, -1.490741, 1, 0, 0, 1, 1,
-1.370914, -1.215542, -2.724071, 1, 0, 0, 1, 1,
-1.359931, -0.1905053, -1.335628, 0, 0, 0, 1, 1,
-1.35617, -0.04120439, -2.002838, 0, 0, 0, 1, 1,
-1.353608, 0.4040808, -2.35679, 0, 0, 0, 1, 1,
-1.351398, -0.1809267, -1.380012, 0, 0, 0, 1, 1,
-1.349554, 1.141579, -3.243399, 0, 0, 0, 1, 1,
-1.343272, 1.050169, -1.240993, 0, 0, 0, 1, 1,
-1.330498, -0.04946456, -0.6745054, 0, 0, 0, 1, 1,
-1.328886, 0.266946, -1.809789, 1, 1, 1, 1, 1,
-1.317575, 1.465663, -0.3056652, 1, 1, 1, 1, 1,
-1.314011, 0.1176168, -0.02235742, 1, 1, 1, 1, 1,
-1.312997, -0.1943349, -1.595872, 1, 1, 1, 1, 1,
-1.30393, 0.06483393, -1.741821, 1, 1, 1, 1, 1,
-1.303403, -0.5056085, 0.415278, 1, 1, 1, 1, 1,
-1.301095, 1.303894, -2.218404, 1, 1, 1, 1, 1,
-1.298603, -1.071512, -1.993188, 1, 1, 1, 1, 1,
-1.290977, -2.606545, -1.846079, 1, 1, 1, 1, 1,
-1.286911, 0.1296327, -1.19046, 1, 1, 1, 1, 1,
-1.277773, 0.8487061, -2.684574, 1, 1, 1, 1, 1,
-1.273717, -0.05026767, -1.240991, 1, 1, 1, 1, 1,
-1.253126, -0.0006253231, -3.002193, 1, 1, 1, 1, 1,
-1.249203, -0.6455575, -4.794672, 1, 1, 1, 1, 1,
-1.22989, 1.177988, -1.52238, 1, 1, 1, 1, 1,
-1.228789, -0.9747609, -1.665107, 0, 0, 1, 1, 1,
-1.225001, -0.5622685, -1.463733, 1, 0, 0, 1, 1,
-1.222668, -1.240758, -1.924707, 1, 0, 0, 1, 1,
-1.222449, -0.4687198, -2.437195, 1, 0, 0, 1, 1,
-1.200766, 0.601844, -1.165923, 1, 0, 0, 1, 1,
-1.194482, -1.212539, -2.268457, 1, 0, 0, 1, 1,
-1.191533, 0.1347965, -2.806389, 0, 0, 0, 1, 1,
-1.187948, 1.397663, -0.2689956, 0, 0, 0, 1, 1,
-1.186278, -0.4945759, -2.05598, 0, 0, 0, 1, 1,
-1.186117, -0.0003691457, -2.755412, 0, 0, 0, 1, 1,
-1.183684, -0.4238526, -2.888408, 0, 0, 0, 1, 1,
-1.178919, 1.30554, 1.268018, 0, 0, 0, 1, 1,
-1.175343, -0.03319158, -1.397898, 0, 0, 0, 1, 1,
-1.173329, 0.327888, -0.3199678, 1, 1, 1, 1, 1,
-1.15904, 1.062897, -0.2986768, 1, 1, 1, 1, 1,
-1.14769, -0.6564704, -0.3755054, 1, 1, 1, 1, 1,
-1.145188, -0.4989655, -0.5359675, 1, 1, 1, 1, 1,
-1.145186, 1.177029, -0.4686259, 1, 1, 1, 1, 1,
-1.145153, -0.6423417, -1.053541, 1, 1, 1, 1, 1,
-1.144462, 0.816749, -1.20433, 1, 1, 1, 1, 1,
-1.140346, -1.011695, -2.470352, 1, 1, 1, 1, 1,
-1.132608, -0.2440573, -4.358174, 1, 1, 1, 1, 1,
-1.131747, -0.1944173, -0.7153293, 1, 1, 1, 1, 1,
-1.128129, -0.448191, -2.497173, 1, 1, 1, 1, 1,
-1.12398, -0.167229, -1.537609, 1, 1, 1, 1, 1,
-1.104138, 1.260761, -0.8689792, 1, 1, 1, 1, 1,
-1.10067, 0.002169497, -0.04944693, 1, 1, 1, 1, 1,
-1.097216, 0.7533869, -1.396383, 1, 1, 1, 1, 1,
-1.096568, -0.4642633, 0.5754598, 0, 0, 1, 1, 1,
-1.095291, 0.5356379, -1.49716, 1, 0, 0, 1, 1,
-1.093638, -1.098403, -0.6033248, 1, 0, 0, 1, 1,
-1.091933, 1.849461, 0.8153934, 1, 0, 0, 1, 1,
-1.091505, 1.564844, -0.4874833, 1, 0, 0, 1, 1,
-1.089223, 0.7354409, -2.356469, 1, 0, 0, 1, 1,
-1.0856, 1.40344, -1.544192, 0, 0, 0, 1, 1,
-1.075974, -0.03367442, -1.293334, 0, 0, 0, 1, 1,
-1.074953, -0.6536032, -1.954455, 0, 0, 0, 1, 1,
-1.06983, -0.3254431, -2.531469, 0, 0, 0, 1, 1,
-1.069802, -0.8800219, -1.83045, 0, 0, 0, 1, 1,
-1.059575, 0.7034557, -2.33289, 0, 0, 0, 1, 1,
-1.05876, 1.252284, -0.6112176, 0, 0, 0, 1, 1,
-1.057531, 1.810064, -0.9532173, 1, 1, 1, 1, 1,
-1.056603, 1.505322, -2.134207, 1, 1, 1, 1, 1,
-1.053177, -0.03814383, -3.386236, 1, 1, 1, 1, 1,
-1.043815, 0.1733482, -1.967224, 1, 1, 1, 1, 1,
-1.040725, 1.377156, -0.5375096, 1, 1, 1, 1, 1,
-1.039599, -1.61155, -1.331741, 1, 1, 1, 1, 1,
-1.025732, -0.1494229, -0.4136024, 1, 1, 1, 1, 1,
-1.023433, -0.7177961, -3.977104, 1, 1, 1, 1, 1,
-1.021902, 0.5644343, -0.8574635, 1, 1, 1, 1, 1,
-1.017822, 1.894172, 0.0005291585, 1, 1, 1, 1, 1,
-1.016024, 1.497316, -2.476861, 1, 1, 1, 1, 1,
-1.014336, 0.01635543, -3.122523, 1, 1, 1, 1, 1,
-1.002869, -0.7360725, -1.989537, 1, 1, 1, 1, 1,
-1.001973, -1.120236, -4.279434, 1, 1, 1, 1, 1,
-0.9903877, 0.8393201, -2.569858, 1, 1, 1, 1, 1,
-0.9812387, 1.500259, -1.000093, 0, 0, 1, 1, 1,
-0.9758627, -0.3340296, -2.172022, 1, 0, 0, 1, 1,
-0.9701732, -0.2717437, -2.13232, 1, 0, 0, 1, 1,
-0.9700746, 0.347448, -0.9719202, 1, 0, 0, 1, 1,
-0.9692208, 0.3288812, 1.001948, 1, 0, 0, 1, 1,
-0.9635957, -0.3013621, -3.575351, 1, 0, 0, 1, 1,
-0.9611119, 0.07968286, -0.3718537, 0, 0, 0, 1, 1,
-0.9575897, 1.319407, 1.46119, 0, 0, 0, 1, 1,
-0.9491269, 0.1597313, -1.026443, 0, 0, 0, 1, 1,
-0.9476904, -2.443602, -3.023606, 0, 0, 0, 1, 1,
-0.9410863, -1.07707, -2.813416, 0, 0, 0, 1, 1,
-0.9398388, 1.680997, 0.8536094, 0, 0, 0, 1, 1,
-0.9365034, -0.7618988, -1.109306, 0, 0, 0, 1, 1,
-0.9354982, 0.4166346, -0.0706308, 1, 1, 1, 1, 1,
-0.926672, 0.4822219, -1.913181, 1, 1, 1, 1, 1,
-0.9249325, -0.4920532, -1.734117, 1, 1, 1, 1, 1,
-0.9200219, -3.258357, -3.486823, 1, 1, 1, 1, 1,
-0.9171532, 0.01992182, 0.1262895, 1, 1, 1, 1, 1,
-0.9127377, -0.1942926, -2.17806, 1, 1, 1, 1, 1,
-0.9061581, -0.6389702, -1.859701, 1, 1, 1, 1, 1,
-0.9056222, 1.621398, 0.5705904, 1, 1, 1, 1, 1,
-0.9005867, -1.706797, -2.437331, 1, 1, 1, 1, 1,
-0.8939068, 0.3525462, -0.833253, 1, 1, 1, 1, 1,
-0.8903654, 1.738722, -0.8853505, 1, 1, 1, 1, 1,
-0.8729061, -0.2245698, -2.11019, 1, 1, 1, 1, 1,
-0.8724739, -0.8179472, -2.114106, 1, 1, 1, 1, 1,
-0.861914, 0.2454309, -1.803874, 1, 1, 1, 1, 1,
-0.8585827, -1.474176, -4.77241, 1, 1, 1, 1, 1,
-0.8577572, 0.2872789, -2.250519, 0, 0, 1, 1, 1,
-0.8563025, 0.3913667, -1.580653, 1, 0, 0, 1, 1,
-0.8538492, 0.3930698, -1.564147, 1, 0, 0, 1, 1,
-0.8532071, -1.83002, -2.246482, 1, 0, 0, 1, 1,
-0.8361785, 1.75045, -0.7717906, 1, 0, 0, 1, 1,
-0.8341452, 2.289341, -1.380783, 1, 0, 0, 1, 1,
-0.8234739, -0.5993726, -0.7976045, 0, 0, 0, 1, 1,
-0.8190871, -0.2072783, -2.693681, 0, 0, 0, 1, 1,
-0.8174489, 0.5353783, -0.3679531, 0, 0, 0, 1, 1,
-0.8135324, 0.3464019, -1.523384, 0, 0, 0, 1, 1,
-0.8124461, 0.0589226, -0.514527, 0, 0, 0, 1, 1,
-0.8035632, 0.2384212, -0.9539523, 0, 0, 0, 1, 1,
-0.7939093, 0.1025854, -3.551921, 0, 0, 0, 1, 1,
-0.7909952, -0.5715066, -2.984885, 1, 1, 1, 1, 1,
-0.7905921, -1.320763, -1.758184, 1, 1, 1, 1, 1,
-0.7898691, 1.512945, -1.294316, 1, 1, 1, 1, 1,
-0.7887466, 1.290734, -3.398542, 1, 1, 1, 1, 1,
-0.7832065, 1.174245, -1.818252, 1, 1, 1, 1, 1,
-0.7799596, 0.08241033, -1.805522, 1, 1, 1, 1, 1,
-0.7787019, -0.4373022, -3.302665, 1, 1, 1, 1, 1,
-0.7757455, 2.332009, 0.04286197, 1, 1, 1, 1, 1,
-0.7710947, -1.3619, -1.437264, 1, 1, 1, 1, 1,
-0.7655939, -0.9635867, -4.213286, 1, 1, 1, 1, 1,
-0.7626956, -0.4801535, -1.371497, 1, 1, 1, 1, 1,
-0.7561299, -0.276275, -1.371379, 1, 1, 1, 1, 1,
-0.755803, -0.1226883, -0.6749839, 1, 1, 1, 1, 1,
-0.7541122, -0.4685676, -1.044823, 1, 1, 1, 1, 1,
-0.7510182, 1.716733, -0.2654997, 1, 1, 1, 1, 1,
-0.7501564, 0.6363292, 0.9582783, 0, 0, 1, 1, 1,
-0.750021, 0.8748534, -1.744965, 1, 0, 0, 1, 1,
-0.7485216, 0.2094675, -1.379244, 1, 0, 0, 1, 1,
-0.7465584, -0.3761545, -1.91033, 1, 0, 0, 1, 1,
-0.7431355, -0.7993682, -3.600146, 1, 0, 0, 1, 1,
-0.7409252, -2.36247, -2.430734, 1, 0, 0, 1, 1,
-0.7340086, 0.5222262, -0.3814903, 0, 0, 0, 1, 1,
-0.7333094, -0.7277903, -2.90788, 0, 0, 0, 1, 1,
-0.7271335, 0.6801757, 1.486652, 0, 0, 0, 1, 1,
-0.7261705, 1.229439, 1.198252, 0, 0, 0, 1, 1,
-0.7241993, -0.4717618, -1.319265, 0, 0, 0, 1, 1,
-0.7100821, 1.81482, -0.1522553, 0, 0, 0, 1, 1,
-0.7029126, 0.3066714, 0.6077914, 0, 0, 0, 1, 1,
-0.7016729, -0.7400311, -2.306417, 1, 1, 1, 1, 1,
-0.6999115, 0.4670736, -0.1265598, 1, 1, 1, 1, 1,
-0.6996259, -0.3012987, -2.479862, 1, 1, 1, 1, 1,
-0.6981415, -0.8275724, -3.971493, 1, 1, 1, 1, 1,
-0.6955634, 0.1819966, -2.266421, 1, 1, 1, 1, 1,
-0.6935965, 0.2127762, -1.169863, 1, 1, 1, 1, 1,
-0.6927653, 0.08164788, -2.138626, 1, 1, 1, 1, 1,
-0.6921588, -0.4232871, -3.101247, 1, 1, 1, 1, 1,
-0.6893995, 0.2398732, -2.589885, 1, 1, 1, 1, 1,
-0.6841483, 0.09186499, -1.47435, 1, 1, 1, 1, 1,
-0.6822005, -0.005920332, -0.8892344, 1, 1, 1, 1, 1,
-0.682054, 0.273799, -1.296181, 1, 1, 1, 1, 1,
-0.6797342, 0.09977578, -1.731559, 1, 1, 1, 1, 1,
-0.6737374, -0.5233375, -2.270136, 1, 1, 1, 1, 1,
-0.6725084, -1.892873, -2.757959, 1, 1, 1, 1, 1,
-0.6711997, 0.9010428, 0.3387599, 0, 0, 1, 1, 1,
-0.6678842, -0.7720338, -2.619295, 1, 0, 0, 1, 1,
-0.6561773, -0.02122802, -0.8920873, 1, 0, 0, 1, 1,
-0.6514331, 0.2564171, 0.08710063, 1, 0, 0, 1, 1,
-0.6512927, -0.2362165, -1.583604, 1, 0, 0, 1, 1,
-0.648535, -0.2043742, -3.024218, 1, 0, 0, 1, 1,
-0.6483603, 0.2674475, -1.32349, 0, 0, 0, 1, 1,
-0.6465925, -0.2102328, -2.326704, 0, 0, 0, 1, 1,
-0.6462718, 1.000549, -1.22939, 0, 0, 0, 1, 1,
-0.6442177, -1.240282, -3.293588, 0, 0, 0, 1, 1,
-0.6421217, -0.8416778, -1.621602, 0, 0, 0, 1, 1,
-0.6396376, 0.3948732, -0.3389611, 0, 0, 0, 1, 1,
-0.6350657, 0.8868918, -0.3628957, 0, 0, 0, 1, 1,
-0.6319207, 1.683825, -2.477098, 1, 1, 1, 1, 1,
-0.6280298, -0.0008068696, 0.4793408, 1, 1, 1, 1, 1,
-0.6273596, 1.492418, 0.2166334, 1, 1, 1, 1, 1,
-0.6267528, -0.558675, -3.095364, 1, 1, 1, 1, 1,
-0.6264409, 1.013, 0.4345785, 1, 1, 1, 1, 1,
-0.6246276, 1.11136, 0.5769143, 1, 1, 1, 1, 1,
-0.614655, -0.3436257, -1.128541, 1, 1, 1, 1, 1,
-0.6113473, -0.3301187, -3.545213, 1, 1, 1, 1, 1,
-0.611335, 1.402942, -2.287787, 1, 1, 1, 1, 1,
-0.6084137, 0.09828442, 0.9797989, 1, 1, 1, 1, 1,
-0.6052248, 1.591432, -0.8412672, 1, 1, 1, 1, 1,
-0.6045284, 0.9128575, -1.047255, 1, 1, 1, 1, 1,
-0.6019925, -1.195433, -4.172721, 1, 1, 1, 1, 1,
-0.6003725, -0.8901265, -1.30165, 1, 1, 1, 1, 1,
-0.6003495, 0.5819101, -1.996237, 1, 1, 1, 1, 1,
-0.598677, -0.8871518, -0.1323522, 0, 0, 1, 1, 1,
-0.5985351, 1.120371, -1.071814, 1, 0, 0, 1, 1,
-0.5962772, -0.3202261, -1.621448, 1, 0, 0, 1, 1,
-0.5907987, 0.5310997, 1.792614, 1, 0, 0, 1, 1,
-0.5845364, -0.282932, -1.372995, 1, 0, 0, 1, 1,
-0.5814931, 2.240155, 1.178387, 1, 0, 0, 1, 1,
-0.5812799, -0.1734654, 0.5219388, 0, 0, 0, 1, 1,
-0.5771087, -1.333265, -1.517236, 0, 0, 0, 1, 1,
-0.5679821, -0.7341256, -2.268286, 0, 0, 0, 1, 1,
-0.5653005, 0.2988356, -1.369703, 0, 0, 0, 1, 1,
-0.5637118, 0.6007242, -1.041801, 0, 0, 0, 1, 1,
-0.5576599, -0.3481323, -2.45106, 0, 0, 0, 1, 1,
-0.5567046, 0.1357458, -1.292503, 0, 0, 0, 1, 1,
-0.5527992, 0.7592858, -0.9355828, 1, 1, 1, 1, 1,
-0.550586, 1.137568, -1.0535, 1, 1, 1, 1, 1,
-0.5504906, -0.3379072, -1.454031, 1, 1, 1, 1, 1,
-0.5489357, -0.1918566, -0.2887862, 1, 1, 1, 1, 1,
-0.5459082, -1.153025, -3.221268, 1, 1, 1, 1, 1,
-0.5446555, -0.4240529, -1.547107, 1, 1, 1, 1, 1,
-0.5446517, 0.1463674, -3.239289, 1, 1, 1, 1, 1,
-0.5357364, -2.081959, -2.349952, 1, 1, 1, 1, 1,
-0.5316066, 0.08599614, -2.909525, 1, 1, 1, 1, 1,
-0.5310579, -1.25847, -3.608284, 1, 1, 1, 1, 1,
-0.5288684, -2.05414, -2.818335, 1, 1, 1, 1, 1,
-0.5265011, -0.02097179, -1.48017, 1, 1, 1, 1, 1,
-0.5243216, 0.2468614, -1.450869, 1, 1, 1, 1, 1,
-0.5233001, -0.1842791, -2.383106, 1, 1, 1, 1, 1,
-0.5204414, 0.3019682, -1.966536, 1, 1, 1, 1, 1,
-0.5173091, 0.01025885, -2.76757, 0, 0, 1, 1, 1,
-0.5153937, -0.1455203, -1.240275, 1, 0, 0, 1, 1,
-0.5153355, -0.8558141, -2.287263, 1, 0, 0, 1, 1,
-0.5128664, 0.2772097, -1.160591, 1, 0, 0, 1, 1,
-0.5071578, -0.09303366, -1.244269, 1, 0, 0, 1, 1,
-0.5066804, 0.6510313, -2.531921, 1, 0, 0, 1, 1,
-0.5044723, 2.36937, -0.213093, 0, 0, 0, 1, 1,
-0.5005682, 0.3505427, -0.1609998, 0, 0, 0, 1, 1,
-0.4997177, -0.2846541, -1.385508, 0, 0, 0, 1, 1,
-0.4982682, -0.1051077, -1.089583, 0, 0, 0, 1, 1,
-0.4954943, 0.5953661, 0.3180157, 0, 0, 0, 1, 1,
-0.4945071, 0.7804411, -0.6475654, 0, 0, 0, 1, 1,
-0.4918734, 0.6256506, -0.07018655, 0, 0, 0, 1, 1,
-0.4918316, 1.108155, 0.006620329, 1, 1, 1, 1, 1,
-0.4879713, -2.712296, -1.692454, 1, 1, 1, 1, 1,
-0.4828855, -2.040645, -2.54129, 1, 1, 1, 1, 1,
-0.4814903, 1.814672, -0.1518407, 1, 1, 1, 1, 1,
-0.4802567, -0.2497373, -2.840301, 1, 1, 1, 1, 1,
-0.4792857, 0.2828553, 0.8342586, 1, 1, 1, 1, 1,
-0.4785758, -0.5584008, 0.05555189, 1, 1, 1, 1, 1,
-0.4744758, -0.04990478, -1.012494, 1, 1, 1, 1, 1,
-0.4701528, -0.9078097, -1.73856, 1, 1, 1, 1, 1,
-0.4688582, -0.195741, -3.00462, 1, 1, 1, 1, 1,
-0.4635683, 0.2276777, -1.246689, 1, 1, 1, 1, 1,
-0.4597766, 0.949237, 1.134078, 1, 1, 1, 1, 1,
-0.4565207, -0.4120638, -0.9393303, 1, 1, 1, 1, 1,
-0.4549773, 0.2130354, -1.109813, 1, 1, 1, 1, 1,
-0.4543291, 1.080108, -0.8965696, 1, 1, 1, 1, 1,
-0.4526906, 1.641603, -0.2429456, 0, 0, 1, 1, 1,
-0.4516457, -0.978663, -2.698896, 1, 0, 0, 1, 1,
-0.4475708, -0.3101828, -2.591597, 1, 0, 0, 1, 1,
-0.4411726, 1.096749, -0.2285823, 1, 0, 0, 1, 1,
-0.4396655, -0.2541816, -1.43503, 1, 0, 0, 1, 1,
-0.4382734, -0.1395829, -1.027825, 1, 0, 0, 1, 1,
-0.436934, 0.7087601, 0.425431, 0, 0, 0, 1, 1,
-0.4218712, 0.306535, -0.7161117, 0, 0, 0, 1, 1,
-0.4215318, -1.35858, -1.08461, 0, 0, 0, 1, 1,
-0.4211062, -1.057233, -2.827908, 0, 0, 0, 1, 1,
-0.4180828, 0.3188621, -0.5147404, 0, 0, 0, 1, 1,
-0.4127496, -0.3989032, -2.600511, 0, 0, 0, 1, 1,
-0.4116551, 0.8529024, 0.7513966, 0, 0, 0, 1, 1,
-0.4100328, 0.2417563, -0.7985976, 1, 1, 1, 1, 1,
-0.4046769, 0.8683678, 0.597551, 1, 1, 1, 1, 1,
-0.4033209, -0.5156685, -2.959886, 1, 1, 1, 1, 1,
-0.401412, 1.157253, -1.274434, 1, 1, 1, 1, 1,
-0.3976184, 0.8288922, 0.8508085, 1, 1, 1, 1, 1,
-0.3946199, -0.3148096, -2.354031, 1, 1, 1, 1, 1,
-0.3929422, 0.7418375, -0.9402639, 1, 1, 1, 1, 1,
-0.3921562, -1.320163, -0.9828977, 1, 1, 1, 1, 1,
-0.3920145, 1.675911, -0.03177907, 1, 1, 1, 1, 1,
-0.3917871, -1.465075, -2.442063, 1, 1, 1, 1, 1,
-0.3800144, -0.4314834, -1.011716, 1, 1, 1, 1, 1,
-0.3792022, 0.1699533, -2.181988, 1, 1, 1, 1, 1,
-0.3744075, 1.072677, 0.7217849, 1, 1, 1, 1, 1,
-0.3736254, -0.7953395, -2.363956, 1, 1, 1, 1, 1,
-0.3723169, -0.2633099, -2.747711, 1, 1, 1, 1, 1,
-0.3683597, 0.04915995, -1.721712, 0, 0, 1, 1, 1,
-0.3675836, -2.195361, -2.366506, 1, 0, 0, 1, 1,
-0.363977, 2.234187, 1.396701, 1, 0, 0, 1, 1,
-0.3635652, 0.4310589, 0.6332325, 1, 0, 0, 1, 1,
-0.3615085, -0.6950088, -3.488364, 1, 0, 0, 1, 1,
-0.360366, 0.9058535, 0.02972421, 1, 0, 0, 1, 1,
-0.3601442, 0.1310007, -0.4654977, 0, 0, 0, 1, 1,
-0.3596889, 0.4406322, -0.02417676, 0, 0, 0, 1, 1,
-0.3593927, -0.0324547, -0.7277634, 0, 0, 0, 1, 1,
-0.3592539, -0.9538532, -1.612369, 0, 0, 0, 1, 1,
-0.3543675, 0.6597859, -0.9817292, 0, 0, 0, 1, 1,
-0.3516433, -0.5245486, -1.795035, 0, 0, 0, 1, 1,
-0.3507812, -0.8978776, -1.643811, 0, 0, 0, 1, 1,
-0.3487108, 0.5149144, -1.052993, 1, 1, 1, 1, 1,
-0.3453263, 1.396721, 0.03541871, 1, 1, 1, 1, 1,
-0.3410114, -1.569111, -1.903204, 1, 1, 1, 1, 1,
-0.3389512, -1.2644, -2.312485, 1, 1, 1, 1, 1,
-0.3368581, 0.7917548, -0.8753076, 1, 1, 1, 1, 1,
-0.3367497, -0.9992689, -3.421243, 1, 1, 1, 1, 1,
-0.333241, -1.160238, -3.116806, 1, 1, 1, 1, 1,
-0.3324048, -0.6667986, -2.552677, 1, 1, 1, 1, 1,
-0.3312975, 1.007816, -0.5812044, 1, 1, 1, 1, 1,
-0.3305888, 1.256866, -1.15725, 1, 1, 1, 1, 1,
-0.3300996, 1.615077, 1.183778, 1, 1, 1, 1, 1,
-0.3287896, 0.1459414, -1.156235, 1, 1, 1, 1, 1,
-0.32771, 0.311176, -1.455664, 1, 1, 1, 1, 1,
-0.3272995, 1.11805, -0.6623883, 1, 1, 1, 1, 1,
-0.3224735, 0.867645, -1.893026, 1, 1, 1, 1, 1,
-0.3161885, -0.212645, -2.495687, 0, 0, 1, 1, 1,
-0.3150203, 0.4426981, -0.3246513, 1, 0, 0, 1, 1,
-0.3143075, 0.5507474, -0.09120862, 1, 0, 0, 1, 1,
-0.3139655, 0.4580233, -1.146661, 1, 0, 0, 1, 1,
-0.3134662, -0.08146865, -2.412422, 1, 0, 0, 1, 1,
-0.3130426, 0.09298973, -2.029759, 1, 0, 0, 1, 1,
-0.3112185, 0.2824654, 0.3224649, 0, 0, 0, 1, 1,
-0.3109442, -0.9294974, -5.498335, 0, 0, 0, 1, 1,
-0.3062512, 0.5072586, -1.562401, 0, 0, 0, 1, 1,
-0.303561, 2.104595, -1.366391, 0, 0, 0, 1, 1,
-0.2995818, -0.3211298, -1.815519, 0, 0, 0, 1, 1,
-0.2983733, 0.9850063, -1.466043, 0, 0, 0, 1, 1,
-0.2939101, -0.2321488, -1.204856, 0, 0, 0, 1, 1,
-0.2918129, 0.5325795, -0.3157352, 1, 1, 1, 1, 1,
-0.2900263, 2.507038, -0.3014124, 1, 1, 1, 1, 1,
-0.2882496, 2.149021, -2.524406, 1, 1, 1, 1, 1,
-0.2840993, -0.0158251, -1.884842, 1, 1, 1, 1, 1,
-0.2831047, 0.681399, -1.042624, 1, 1, 1, 1, 1,
-0.2814428, -0.4340312, -4.524289, 1, 1, 1, 1, 1,
-0.2790469, 0.7741964, -0.865613, 1, 1, 1, 1, 1,
-0.2616658, -0.7132156, -5.550818, 1, 1, 1, 1, 1,
-0.2585515, -1.613188, -1.586795, 1, 1, 1, 1, 1,
-0.2581302, -0.2833141, -2.220515, 1, 1, 1, 1, 1,
-0.2560634, 0.4159843, -3.526614, 1, 1, 1, 1, 1,
-0.2538284, -0.9419948, -5.011166, 1, 1, 1, 1, 1,
-0.2528279, 0.3809579, -0.7128089, 1, 1, 1, 1, 1,
-0.2518706, -1.239565, -3.461949, 1, 1, 1, 1, 1,
-0.2517768, -0.8097227, -3.098445, 1, 1, 1, 1, 1,
-0.2507897, -0.5221444, -3.7091, 0, 0, 1, 1, 1,
-0.2446611, 0.8607306, 0.08281767, 1, 0, 0, 1, 1,
-0.2444646, -0.2018666, -0.6021125, 1, 0, 0, 1, 1,
-0.2435409, -1.186751, -2.764941, 1, 0, 0, 1, 1,
-0.2434273, -1.23536, -2.683572, 1, 0, 0, 1, 1,
-0.2392023, -1.706176, -3.013193, 1, 0, 0, 1, 1,
-0.2374062, 0.9535988, -0.8602584, 0, 0, 0, 1, 1,
-0.2364445, -0.3120138, -2.927997, 0, 0, 0, 1, 1,
-0.2357264, -1.197148, -2.883866, 0, 0, 0, 1, 1,
-0.2322063, -0.2931217, -2.62898, 0, 0, 0, 1, 1,
-0.2270307, 0.9959034, 0.0008422498, 0, 0, 0, 1, 1,
-0.2253515, -1.940752, -2.595527, 0, 0, 0, 1, 1,
-0.2227478, 1.486618, -0.6255777, 0, 0, 0, 1, 1,
-0.2187758, 0.4127058, 0.8997812, 1, 1, 1, 1, 1,
-0.2185181, -0.6490334, -2.79762, 1, 1, 1, 1, 1,
-0.2145155, 0.1310779, -0.3458446, 1, 1, 1, 1, 1,
-0.2143126, -0.1756789, -2.628009, 1, 1, 1, 1, 1,
-0.21145, 1.013569, -1.613406, 1, 1, 1, 1, 1,
-0.2062485, -1.066445, -2.412475, 1, 1, 1, 1, 1,
-0.206004, 0.6898, 0.9474703, 1, 1, 1, 1, 1,
-0.204528, -0.2210776, -1.728519, 1, 1, 1, 1, 1,
-0.1984893, 0.8444841, -1.074895, 1, 1, 1, 1, 1,
-0.1971882, 1.156104, -0.5694863, 1, 1, 1, 1, 1,
-0.1961996, -0.3047499, -3.693901, 1, 1, 1, 1, 1,
-0.1960146, 0.0405989, -0.3713442, 1, 1, 1, 1, 1,
-0.1938457, 0.8276361, -1.200482, 1, 1, 1, 1, 1,
-0.192696, 0.2091898, -0.7864671, 1, 1, 1, 1, 1,
-0.1915897, 2.502159, 0.1371633, 1, 1, 1, 1, 1,
-0.189418, 2.026705, -3.69189, 0, 0, 1, 1, 1,
-0.1844839, 0.647893, -0.3359815, 1, 0, 0, 1, 1,
-0.1839765, 1.179188, -0.4721907, 1, 0, 0, 1, 1,
-0.1689015, 0.4902529, 0.1651247, 1, 0, 0, 1, 1,
-0.1666314, -0.2458107, -2.781001, 1, 0, 0, 1, 1,
-0.1554806, -0.1359634, -2.962727, 1, 0, 0, 1, 1,
-0.147611, 0.2580073, -0.09641426, 0, 0, 0, 1, 1,
-0.1468364, -0.4915586, -1.317556, 0, 0, 0, 1, 1,
-0.1464192, -0.5855687, -2.630181, 0, 0, 0, 1, 1,
-0.1363567, -0.4129024, -3.452603, 0, 0, 0, 1, 1,
-0.1340607, -1.738044, -3.107407, 0, 0, 0, 1, 1,
-0.1286749, -0.08100143, -2.46083, 0, 0, 0, 1, 1,
-0.1231937, -1.32927, -2.259752, 0, 0, 0, 1, 1,
-0.1147175, 0.2027659, -1.234917, 1, 1, 1, 1, 1,
-0.1129546, 1.519775, 0.9786454, 1, 1, 1, 1, 1,
-0.1125031, -1.115848, -3.370698, 1, 1, 1, 1, 1,
-0.1080076, -1.822535, -3.446464, 1, 1, 1, 1, 1,
-0.1061048, -0.3371204, -0.37071, 1, 1, 1, 1, 1,
-0.1031723, 0.9290953, 1.588504, 1, 1, 1, 1, 1,
-0.09786958, 0.6970471, -0.8329497, 1, 1, 1, 1, 1,
-0.09383766, 0.3949151, -2.265182, 1, 1, 1, 1, 1,
-0.09351841, 1.289444, 0.4358504, 1, 1, 1, 1, 1,
-0.09178611, -0.2590388, -3.119184, 1, 1, 1, 1, 1,
-0.09108573, 0.3147287, -0.8022799, 1, 1, 1, 1, 1,
-0.09017298, -1.270701, -2.715563, 1, 1, 1, 1, 1,
-0.08671337, -0.0874138, -0.95956, 1, 1, 1, 1, 1,
-0.08577265, -0.1893264, -2.864877, 1, 1, 1, 1, 1,
-0.0824806, -0.5799049, -3.959627, 1, 1, 1, 1, 1,
-0.07767189, 0.442495, -0.8528591, 0, 0, 1, 1, 1,
-0.07620766, -0.8765644, -5.890095, 1, 0, 0, 1, 1,
-0.07483463, -0.3709302, -2.485291, 1, 0, 0, 1, 1,
-0.07255175, 0.07483668, -1.189426, 1, 0, 0, 1, 1,
-0.0715334, 1.812732, -1.137429, 1, 0, 0, 1, 1,
-0.07100653, -0.9150533, -0.5236062, 1, 0, 0, 1, 1,
-0.07040147, 1.463595, 0.9949054, 0, 0, 0, 1, 1,
-0.05494673, -1.459843, -3.662053, 0, 0, 0, 1, 1,
-0.05282984, -0.7894389, -2.548681, 0, 0, 0, 1, 1,
-0.04540198, -1.687109, -4.745522, 0, 0, 0, 1, 1,
-0.04518748, -2.866056, -2.285481, 0, 0, 0, 1, 1,
-0.04197349, 0.2800581, -0.08871231, 0, 0, 0, 1, 1,
-0.04012483, 1.976107, 0.009153472, 0, 0, 0, 1, 1,
-0.03683398, -0.4003425, -2.665761, 1, 1, 1, 1, 1,
-0.03667054, 1.12436, 0.2019483, 1, 1, 1, 1, 1,
-0.03351137, -1.148105, -3.261169, 1, 1, 1, 1, 1,
-0.030639, -0.601063, -2.807392, 1, 1, 1, 1, 1,
-0.03056318, 1.410145, 0.6517404, 1, 1, 1, 1, 1,
-0.02893182, 0.7015725, -0.5946235, 1, 1, 1, 1, 1,
-0.02806726, -0.4645593, -3.215333, 1, 1, 1, 1, 1,
-0.02319605, -0.7210709, -2.33828, 1, 1, 1, 1, 1,
-0.02103477, -1.195611, -3.423807, 1, 1, 1, 1, 1,
-0.01846769, -0.4814038, -1.772018, 1, 1, 1, 1, 1,
-0.01508206, -0.9952798, -2.62834, 1, 1, 1, 1, 1,
-0.01219797, 0.2428532, 2.009436, 1, 1, 1, 1, 1,
-0.01199018, -0.3956684, -2.89857, 1, 1, 1, 1, 1,
-0.01055505, 1.214455, -1.457564, 1, 1, 1, 1, 1,
0.001131142, -0.3503664, 2.655725, 1, 1, 1, 1, 1,
0.001938687, -0.7557263, 1.950691, 0, 0, 1, 1, 1,
0.008356851, 0.499077, -0.05793113, 1, 0, 0, 1, 1,
0.008805637, -0.8180915, 3.276377, 1, 0, 0, 1, 1,
0.008854951, 0.2870764, 2.3019, 1, 0, 0, 1, 1,
0.00940019, -1.262767, 4.553824, 1, 0, 0, 1, 1,
0.01000057, -1.055328, 1.602485, 1, 0, 0, 1, 1,
0.01053034, -1.061183, 3.884586, 0, 0, 0, 1, 1,
0.01182175, 0.03015093, -0.2268638, 0, 0, 0, 1, 1,
0.01206238, 2.009759, 0.580332, 0, 0, 0, 1, 1,
0.01779955, 0.5066711, -1.025813, 0, 0, 0, 1, 1,
0.02227408, -0.4039368, 2.533736, 0, 0, 0, 1, 1,
0.02417511, 0.7996603, 1.035214, 0, 0, 0, 1, 1,
0.0279644, 1.288482, 0.659057, 0, 0, 0, 1, 1,
0.03038675, 0.713687, -0.05643945, 1, 1, 1, 1, 1,
0.03358652, 0.08589499, 0.5248475, 1, 1, 1, 1, 1,
0.03401021, 0.6378958, -0.64895, 1, 1, 1, 1, 1,
0.03585389, 2.78043, -0.9627467, 1, 1, 1, 1, 1,
0.0369203, -0.777141, 4.889997, 1, 1, 1, 1, 1,
0.04164028, 0.1234037, 1.275554, 1, 1, 1, 1, 1,
0.04647215, -1.642696, 4.662252, 1, 1, 1, 1, 1,
0.04820881, -0.2387304, 3.511484, 1, 1, 1, 1, 1,
0.05092466, 0.1344158, 0.5641124, 1, 1, 1, 1, 1,
0.05198331, 1.019531, 1.106544, 1, 1, 1, 1, 1,
0.05592228, -0.7738649, 2.557077, 1, 1, 1, 1, 1,
0.06150408, 1.335252, -0.2477597, 1, 1, 1, 1, 1,
0.06217893, 0.4667854, 1.192938, 1, 1, 1, 1, 1,
0.06682254, 0.9798545, 0.7740963, 1, 1, 1, 1, 1,
0.06741642, 0.2390374, -0.05295305, 1, 1, 1, 1, 1,
0.06873123, -0.8567522, 3.746059, 0, 0, 1, 1, 1,
0.07223778, 1.755899, -0.9690421, 1, 0, 0, 1, 1,
0.07347447, 0.6473131, -0.7222236, 1, 0, 0, 1, 1,
0.07871311, -1.939185, 1.987031, 1, 0, 0, 1, 1,
0.08257172, -0.1876622, 0.2105598, 1, 0, 0, 1, 1,
0.08502688, -0.2590377, 3.632086, 1, 0, 0, 1, 1,
0.08807328, -0.673271, 3.984804, 0, 0, 0, 1, 1,
0.08911426, 2.434017, -1.192651, 0, 0, 0, 1, 1,
0.09146709, -0.4598342, 4.399697, 0, 0, 0, 1, 1,
0.09332036, 0.07014008, 1.927378, 0, 0, 0, 1, 1,
0.09463384, 0.3017457, 1.214969, 0, 0, 0, 1, 1,
0.09710993, 0.3772498, 0.1315061, 0, 0, 0, 1, 1,
0.09902736, -1.395477, 2.782559, 0, 0, 0, 1, 1,
0.1093071, -1.560458, 4.801118, 1, 1, 1, 1, 1,
0.1101236, -0.53461, 3.528184, 1, 1, 1, 1, 1,
0.1104412, 1.057028, -0.6521008, 1, 1, 1, 1, 1,
0.1125041, 0.6075285, 0.4406644, 1, 1, 1, 1, 1,
0.1147374, -0.7203881, 2.321361, 1, 1, 1, 1, 1,
0.1217406, -1.925136, 2.829522, 1, 1, 1, 1, 1,
0.1228797, 0.1792763, 1.401603, 1, 1, 1, 1, 1,
0.1261928, -0.1513601, -0.7187345, 1, 1, 1, 1, 1,
0.1296788, 1.429572, -1.047559, 1, 1, 1, 1, 1,
0.1300621, 0.9624627, -1.401891, 1, 1, 1, 1, 1,
0.1403386, 1.857732, 0.1511659, 1, 1, 1, 1, 1,
0.1425477, -2.822885, 2.066025, 1, 1, 1, 1, 1,
0.1517922, -0.200174, 2.920918, 1, 1, 1, 1, 1,
0.1522363, 0.002158391, 2.920705, 1, 1, 1, 1, 1,
0.1560687, -0.2159645, 1.939495, 1, 1, 1, 1, 1,
0.157873, 1.114446, 0.1004003, 0, 0, 1, 1, 1,
0.1591797, 1.103898, 0.597786, 1, 0, 0, 1, 1,
0.1596047, 0.7428294, -1.276855, 1, 0, 0, 1, 1,
0.1643558, 0.8575922, 1.3024, 1, 0, 0, 1, 1,
0.1652443, 1.503955, -0.3001629, 1, 0, 0, 1, 1,
0.1702586, -0.3713455, 2.889042, 1, 0, 0, 1, 1,
0.1740713, -0.7247812, 3.08888, 0, 0, 0, 1, 1,
0.1772953, -0.2529313, 4.035964, 0, 0, 0, 1, 1,
0.1799794, -0.2522541, 2.316439, 0, 0, 0, 1, 1,
0.1826247, 0.343833, 0.9442027, 0, 0, 0, 1, 1,
0.1843691, -1.719761, 5.188199, 0, 0, 0, 1, 1,
0.1860597, 0.0634824, 1.883421, 0, 0, 0, 1, 1,
0.186319, -0.1096209, 1.490868, 0, 0, 0, 1, 1,
0.1875083, 0.5670925, 0.4721805, 1, 1, 1, 1, 1,
0.1890792, 0.07497571, -0.136427, 1, 1, 1, 1, 1,
0.1898573, -0.02958046, 0.2624141, 1, 1, 1, 1, 1,
0.1919134, 0.2079526, 1.044521, 1, 1, 1, 1, 1,
0.1926957, 0.3008106, -1.034793, 1, 1, 1, 1, 1,
0.1956027, 0.5896752, 1.344066, 1, 1, 1, 1, 1,
0.1958984, -1.212597, 3.551296, 1, 1, 1, 1, 1,
0.2032356, -0.1111096, 0.727057, 1, 1, 1, 1, 1,
0.2103952, 0.6335781, 1.178488, 1, 1, 1, 1, 1,
0.2200214, 1.303397, -1.332323, 1, 1, 1, 1, 1,
0.2206068, 0.9279851, 1.962707, 1, 1, 1, 1, 1,
0.221168, -0.4666036, 2.191609, 1, 1, 1, 1, 1,
0.2296966, 0.4457838, 0.09306774, 1, 1, 1, 1, 1,
0.2297113, -1.301701, 2.951104, 1, 1, 1, 1, 1,
0.2313882, 0.4617207, 0.4584264, 1, 1, 1, 1, 1,
0.2324786, 0.7469632, 0.5561877, 0, 0, 1, 1, 1,
0.2352734, -1.902258, 3.991119, 1, 0, 0, 1, 1,
0.2389632, -0.2442991, 4.642072, 1, 0, 0, 1, 1,
0.2389995, 1.241256, 0.5004905, 1, 0, 0, 1, 1,
0.2397417, -0.2580357, 3.737998, 1, 0, 0, 1, 1,
0.2411675, 0.5220241, -0.07843748, 1, 0, 0, 1, 1,
0.2458725, 0.8667142, -2.243337, 0, 0, 0, 1, 1,
0.2467493, 0.1057292, 1.519902, 0, 0, 0, 1, 1,
0.2480458, 0.5579847, 0.7270083, 0, 0, 0, 1, 1,
0.2485256, -0.4074728, 2.715983, 0, 0, 0, 1, 1,
0.2502729, 0.6158779, -0.3675378, 0, 0, 0, 1, 1,
0.25309, 0.7945741, -1.08237, 0, 0, 0, 1, 1,
0.2545406, -0.475701, 3.293485, 0, 0, 0, 1, 1,
0.2583655, 0.9852574, 2.010138, 1, 1, 1, 1, 1,
0.2634839, -0.1201673, 4.075346, 1, 1, 1, 1, 1,
0.2687937, 1.630832, -0.02435005, 1, 1, 1, 1, 1,
0.2697484, -0.02077323, 3.364654, 1, 1, 1, 1, 1,
0.2707207, 1.338946, -1.660101, 1, 1, 1, 1, 1,
0.2712024, -1.943748, 3.831218, 1, 1, 1, 1, 1,
0.2712713, -0.8782554, 3.612612, 1, 1, 1, 1, 1,
0.2717562, -0.004138129, 2.42747, 1, 1, 1, 1, 1,
0.2748858, 0.05313419, 3.091459, 1, 1, 1, 1, 1,
0.2788048, 0.1847973, 1.048913, 1, 1, 1, 1, 1,
0.2801405, -0.07320807, 1.394929, 1, 1, 1, 1, 1,
0.2828839, 0.6311436, 1.425121, 1, 1, 1, 1, 1,
0.2835223, -0.05224085, 2.868913, 1, 1, 1, 1, 1,
0.283878, 1.714583, -0.5622689, 1, 1, 1, 1, 1,
0.2844746, 0.3100836, -1.286029, 1, 1, 1, 1, 1,
0.2875196, 0.5726972, 0.4993775, 0, 0, 1, 1, 1,
0.2971399, 0.6811309, 2.230314, 1, 0, 0, 1, 1,
0.2990213, 0.1368932, 2.559162, 1, 0, 0, 1, 1,
0.3024933, -0.7718554, 3.140814, 1, 0, 0, 1, 1,
0.3026739, -0.2465093, 2.469293, 1, 0, 0, 1, 1,
0.3031183, -0.98073, 1.898318, 1, 0, 0, 1, 1,
0.3066992, -0.4848536, 3.502243, 0, 0, 0, 1, 1,
0.3068173, 0.09591117, 0.6876038, 0, 0, 0, 1, 1,
0.308322, -0.1172164, 2.553369, 0, 0, 0, 1, 1,
0.3110785, -0.2484182, 1.757424, 0, 0, 0, 1, 1,
0.3127638, -0.3294384, 2.354324, 0, 0, 0, 1, 1,
0.3157094, -0.8977543, 1.691447, 0, 0, 0, 1, 1,
0.3202372, -0.6426076, 3.22051, 0, 0, 0, 1, 1,
0.3203565, 0.5744209, -1.030961, 1, 1, 1, 1, 1,
0.3209802, 1.687503, 0.04772703, 1, 1, 1, 1, 1,
0.321318, -0.4228359, 3.334074, 1, 1, 1, 1, 1,
0.3215463, 0.3440111, 0.1889126, 1, 1, 1, 1, 1,
0.3223595, -0.02741157, 1.90531, 1, 1, 1, 1, 1,
0.3251322, -1.602979, 3.168681, 1, 1, 1, 1, 1,
0.3308906, -0.5890963, 2.041023, 1, 1, 1, 1, 1,
0.3319903, 0.4284921, 1.2175, 1, 1, 1, 1, 1,
0.3355457, -0.6692216, 2.772799, 1, 1, 1, 1, 1,
0.3401369, 0.522771, 1.278568, 1, 1, 1, 1, 1,
0.3453677, 0.93259, 1.208833, 1, 1, 1, 1, 1,
0.3519002, 0.5568648, 1.18981, 1, 1, 1, 1, 1,
0.3564103, -0.08630942, 1.768716, 1, 1, 1, 1, 1,
0.3588713, 1.540061, 0.2643229, 1, 1, 1, 1, 1,
0.3600932, -0.8716027, 2.119224, 1, 1, 1, 1, 1,
0.3602556, 0.602771, 0.3027332, 0, 0, 1, 1, 1,
0.3627464, -0.1727199, 1.683533, 1, 0, 0, 1, 1,
0.3628831, 0.5193939, 0.9853378, 1, 0, 0, 1, 1,
0.3636767, 0.4427354, 1.288666, 1, 0, 0, 1, 1,
0.3639149, -0.07441763, 0.6472856, 1, 0, 0, 1, 1,
0.3650726, -0.04582094, 1.050279, 1, 0, 0, 1, 1,
0.3654364, 2.029959, -0.9969279, 0, 0, 0, 1, 1,
0.3683993, 0.110741, 1.209139, 0, 0, 0, 1, 1,
0.3766003, -1.173604, 1.77484, 0, 0, 0, 1, 1,
0.3771191, 1.226898, 0.3991684, 0, 0, 0, 1, 1,
0.3798031, -0.6426571, 2.66224, 0, 0, 0, 1, 1,
0.387923, 0.5791122, 1.99742, 0, 0, 0, 1, 1,
0.3892829, -1.356346, 3.763325, 0, 0, 0, 1, 1,
0.3909068, 0.3968466, 1.639895, 1, 1, 1, 1, 1,
0.39428, -0.2095401, 1.897654, 1, 1, 1, 1, 1,
0.3943425, -0.3091028, 2.629794, 1, 1, 1, 1, 1,
0.3959456, -1.698413, 5.296961, 1, 1, 1, 1, 1,
0.3987813, -0.9326523, 3.034324, 1, 1, 1, 1, 1,
0.403479, -1.421894, 2.233311, 1, 1, 1, 1, 1,
0.4045845, -0.7691201, 3.593228, 1, 1, 1, 1, 1,
0.4085928, 0.3390884, 0.4997097, 1, 1, 1, 1, 1,
0.4104625, -1.136658, 3.851667, 1, 1, 1, 1, 1,
0.4115888, -0.7134795, 2.112819, 1, 1, 1, 1, 1,
0.415747, 0.408348, -0.09230967, 1, 1, 1, 1, 1,
0.4166142, 0.3334299, 0.862057, 1, 1, 1, 1, 1,
0.417895, 1.194134, 1.352545, 1, 1, 1, 1, 1,
0.4206759, -0.3644223, 3.39309, 1, 1, 1, 1, 1,
0.4208831, 0.2176574, 1.052016, 1, 1, 1, 1, 1,
0.4214606, -0.2536679, 2.374593, 0, 0, 1, 1, 1,
0.4239985, 1.061414, 1.826269, 1, 0, 0, 1, 1,
0.426462, 0.9139971, 0.4225076, 1, 0, 0, 1, 1,
0.4353347, 0.334484, -0.08465456, 1, 0, 0, 1, 1,
0.4372095, -1.131578, 2.502146, 1, 0, 0, 1, 1,
0.4381937, -1.061619, 1.194993, 1, 0, 0, 1, 1,
0.4398178, -1.071673, 3.466062, 0, 0, 0, 1, 1,
0.4412838, 0.9372938, 2.297906, 0, 0, 0, 1, 1,
0.444156, 0.2770069, 2.325746, 0, 0, 0, 1, 1,
0.4479083, 0.9022755, -1.110152, 0, 0, 0, 1, 1,
0.4498258, -0.08723016, 1.600347, 0, 0, 0, 1, 1,
0.4511702, 1.509196, 0.09194493, 0, 0, 0, 1, 1,
0.4591776, -0.5208226, 3.145395, 0, 0, 0, 1, 1,
0.4597037, -0.8464044, 3.419877, 1, 1, 1, 1, 1,
0.4622088, 1.477782, 0.9014711, 1, 1, 1, 1, 1,
0.467305, -0.03225309, 0.960018, 1, 1, 1, 1, 1,
0.4685777, -0.4475783, 1.61347, 1, 1, 1, 1, 1,
0.4688864, 0.9061672, 0.3438493, 1, 1, 1, 1, 1,
0.4695223, 1.567578, 1.806082, 1, 1, 1, 1, 1,
0.4723688, -0.3586298, 1.555584, 1, 1, 1, 1, 1,
0.4789676, -1.153285, 3.140799, 1, 1, 1, 1, 1,
0.4853012, 0.5933921, -0.2838863, 1, 1, 1, 1, 1,
0.4883346, -1.128401, 1.797385, 1, 1, 1, 1, 1,
0.4907494, 0.2516116, 1.187949, 1, 1, 1, 1, 1,
0.4934124, 1.20671, -1.551246, 1, 1, 1, 1, 1,
0.4973662, -2.517294, 3.717878, 1, 1, 1, 1, 1,
0.5012191, -0.806808, 1.164103, 1, 1, 1, 1, 1,
0.5036695, -0.8795427, 4.400328, 1, 1, 1, 1, 1,
0.5040721, 0.7969723, 0.6903085, 0, 0, 1, 1, 1,
0.5162402, 0.3603997, 1.891809, 1, 0, 0, 1, 1,
0.5173695, 0.2684315, -0.04740488, 1, 0, 0, 1, 1,
0.5174592, 0.8812345, 1.703903, 1, 0, 0, 1, 1,
0.5177926, -0.08495, 1.800455, 1, 0, 0, 1, 1,
0.5179973, 0.4114091, 1.74464, 1, 0, 0, 1, 1,
0.5206993, 0.2538773, 1.061639, 0, 0, 0, 1, 1,
0.5227984, -0.6528538, 3.844588, 0, 0, 0, 1, 1,
0.5252165, 0.2481579, 2.011087, 0, 0, 0, 1, 1,
0.5338438, 0.2563235, 0.4018881, 0, 0, 0, 1, 1,
0.5389796, 0.7709381, -1.161573, 0, 0, 0, 1, 1,
0.5409484, -0.5043192, 1.854095, 0, 0, 0, 1, 1,
0.5487464, -1.254138, 0.7883514, 0, 0, 0, 1, 1,
0.5496491, 1.018474, 1.262518, 1, 1, 1, 1, 1,
0.5498545, -0.3915043, -0.6879994, 1, 1, 1, 1, 1,
0.5521263, -0.03985341, 1.959139, 1, 1, 1, 1, 1,
0.5574561, -0.856591, 0.9781091, 1, 1, 1, 1, 1,
0.5598087, 0.7665592, -0.5405964, 1, 1, 1, 1, 1,
0.5628015, -1.049525, 2.35717, 1, 1, 1, 1, 1,
0.5631739, 0.5622545, 0.5371177, 1, 1, 1, 1, 1,
0.5653976, 0.6348998, 2.267686, 1, 1, 1, 1, 1,
0.5678989, -0.3716403, 0.004399928, 1, 1, 1, 1, 1,
0.5712541, 1.193177, 0.9256297, 1, 1, 1, 1, 1,
0.5714834, -0.4828157, 1.514161, 1, 1, 1, 1, 1,
0.5724279, 0.4839191, -0.6323445, 1, 1, 1, 1, 1,
0.5738995, 0.5510209, 0.9279131, 1, 1, 1, 1, 1,
0.5743616, 0.5183949, 0.6135593, 1, 1, 1, 1, 1,
0.575138, -1.040285, 2.911548, 1, 1, 1, 1, 1,
0.5755974, 1.170537, 1.640772, 0, 0, 1, 1, 1,
0.5779874, -1.053464, 4.361091, 1, 0, 0, 1, 1,
0.5813934, -0.2603819, 3.61738, 1, 0, 0, 1, 1,
0.5830904, -0.05860431, 1.012308, 1, 0, 0, 1, 1,
0.58466, 1.797252, -0.3181584, 1, 0, 0, 1, 1,
0.5866919, 1.673389, 0.5884067, 1, 0, 0, 1, 1,
0.5963533, 0.4061594, 0.2930247, 0, 0, 0, 1, 1,
0.5965142, -1.313903, 4.58038, 0, 0, 0, 1, 1,
0.6027694, 0.9474742, 1.089504, 0, 0, 0, 1, 1,
0.6057981, -1.432019, 2.361518, 0, 0, 0, 1, 1,
0.6066268, 0.1080349, 0.8596191, 0, 0, 0, 1, 1,
0.6080195, 0.819602, 1.776473, 0, 0, 0, 1, 1,
0.6080522, -1.41842, 1.953229, 0, 0, 0, 1, 1,
0.6099417, 0.8557251, 0.1152904, 1, 1, 1, 1, 1,
0.614776, -0.2204405, 0.445296, 1, 1, 1, 1, 1,
0.6200503, 1.256172, 0.6072392, 1, 1, 1, 1, 1,
0.6273291, -0.1582388, 1.249681, 1, 1, 1, 1, 1,
0.6294887, -0.5701609, 3.125302, 1, 1, 1, 1, 1,
0.6296577, 3.028924, -0.6655407, 1, 1, 1, 1, 1,
0.6299425, -0.4694416, 1.946166, 1, 1, 1, 1, 1,
0.6303446, 1.581328, 0.04809795, 1, 1, 1, 1, 1,
0.632538, -0.3747445, 0.5629657, 1, 1, 1, 1, 1,
0.638325, -0.5766202, 1.860787, 1, 1, 1, 1, 1,
0.6394822, -0.2438565, 4.119106, 1, 1, 1, 1, 1,
0.6410224, 0.3394971, 3.675485, 1, 1, 1, 1, 1,
0.6416157, 0.009962062, 3.101457, 1, 1, 1, 1, 1,
0.6434869, 0.4296951, 0.7537136, 1, 1, 1, 1, 1,
0.6445436, -0.6442524, 3.652612, 1, 1, 1, 1, 1,
0.6449183, -0.3101474, 1.772808, 0, 0, 1, 1, 1,
0.6450776, 1.424178, 0.7574247, 1, 0, 0, 1, 1,
0.6454498, -1.587794, 2.140147, 1, 0, 0, 1, 1,
0.6466817, -0.9228257, 2.672117, 1, 0, 0, 1, 1,
0.6499268, -0.1456179, 2.83626, 1, 0, 0, 1, 1,
0.6507451, 0.07344739, 1.70698, 1, 0, 0, 1, 1,
0.6531617, -0.009471354, 1.105852, 0, 0, 0, 1, 1,
0.6544042, -1.551925, 3.803112, 0, 0, 0, 1, 1,
0.6649689, 0.9604016, 0.8342164, 0, 0, 0, 1, 1,
0.6699845, 0.6570396, 1.303619, 0, 0, 0, 1, 1,
0.6828663, -0.2439502, 1.041624, 0, 0, 0, 1, 1,
0.6830629, -1.614062, 1.393751, 0, 0, 0, 1, 1,
0.6859429, 0.3446122, -0.09813323, 0, 0, 0, 1, 1,
0.6875281, -0.08491062, 2.05599, 1, 1, 1, 1, 1,
0.6934129, 1.10276, 0.4320449, 1, 1, 1, 1, 1,
0.6982902, -0.6550547, 2.887533, 1, 1, 1, 1, 1,
0.6983951, 1.28018, -0.6058899, 1, 1, 1, 1, 1,
0.700682, 0.6512262, 2.518738, 1, 1, 1, 1, 1,
0.7037443, -0.7031445, 4.75956, 1, 1, 1, 1, 1,
0.7143824, -1.072544, 3.89641, 1, 1, 1, 1, 1,
0.7220626, -0.2423894, 3.142726, 1, 1, 1, 1, 1,
0.7309946, 0.9511896, 1.337415, 1, 1, 1, 1, 1,
0.7354497, -0.1298366, -0.4580622, 1, 1, 1, 1, 1,
0.7430258, 1.216679, 0.8251143, 1, 1, 1, 1, 1,
0.7600952, 1.943642, -0.2149649, 1, 1, 1, 1, 1,
0.762872, 0.211039, 1.060222, 1, 1, 1, 1, 1,
0.7647221, 1.095782, -0.005970464, 1, 1, 1, 1, 1,
0.7712999, -0.7911782, 2.410525, 1, 1, 1, 1, 1,
0.7761357, 0.9387563, 2.411044, 0, 0, 1, 1, 1,
0.7764426, 0.8685367, 0.9169227, 1, 0, 0, 1, 1,
0.7795258, -0.365215, 2.649363, 1, 0, 0, 1, 1,
0.7871197, 1.077374, 1.209606, 1, 0, 0, 1, 1,
0.7897003, 1.394883, 0.6752465, 1, 0, 0, 1, 1,
0.7897813, -1.183049, 1.662557, 1, 0, 0, 1, 1,
0.7923725, 0.5174338, -0.3124526, 0, 0, 0, 1, 1,
0.7933794, 0.8737254, 1.055964, 0, 0, 0, 1, 1,
0.7958966, -0.8121432, 1.85016, 0, 0, 0, 1, 1,
0.7987693, 1.937333, -0.6879729, 0, 0, 0, 1, 1,
0.7989596, -0.9093875, 2.837599, 0, 0, 0, 1, 1,
0.7992852, 0.3287951, 1.729595, 0, 0, 0, 1, 1,
0.8060517, 0.0982919, 1.10117, 0, 0, 0, 1, 1,
0.8087029, -0.6241277, 1.008172, 1, 1, 1, 1, 1,
0.8120744, -0.4138009, 3.601572, 1, 1, 1, 1, 1,
0.8134667, 0.0719252, 1.334509, 1, 1, 1, 1, 1,
0.8155137, -1.181607, 1.654633, 1, 1, 1, 1, 1,
0.816875, 0.6281258, 2.606967, 1, 1, 1, 1, 1,
0.8213632, -0.0729221, 2.147681, 1, 1, 1, 1, 1,
0.8289362, -0.4531082, 0.03116741, 1, 1, 1, 1, 1,
0.8333418, -0.4625472, 1.752752, 1, 1, 1, 1, 1,
0.8355221, -2.391921, 0.7677969, 1, 1, 1, 1, 1,
0.8357762, 0.4583189, 1.032416, 1, 1, 1, 1, 1,
0.8391301, -0.2631269, 0.9687765, 1, 1, 1, 1, 1,
0.8399859, 1.675806, 1.597299, 1, 1, 1, 1, 1,
0.8400655, -0.1299218, 3.720815, 1, 1, 1, 1, 1,
0.8501178, -1.984158, 2.06467, 1, 1, 1, 1, 1,
0.8547208, -2.087222, 0.6506994, 1, 1, 1, 1, 1,
0.8556402, 0.5348938, 1.026164, 0, 0, 1, 1, 1,
0.8585171, 0.7194818, 2.177754, 1, 0, 0, 1, 1,
0.864167, 0.1777913, 1.84688, 1, 0, 0, 1, 1,
0.8642098, -1.184723, 2.209076, 1, 0, 0, 1, 1,
0.866149, 0.4539226, 2.519264, 1, 0, 0, 1, 1,
0.8832203, -0.6513302, 1.320924, 1, 0, 0, 1, 1,
0.8841108, 3.606024, -0.4770699, 0, 0, 0, 1, 1,
0.8920116, 1.378169, -0.2371736, 0, 0, 0, 1, 1,
0.892415, -1.081316, 2.342565, 0, 0, 0, 1, 1,
0.9019759, -0.4606109, 0.5585152, 0, 0, 0, 1, 1,
0.9030378, -0.2265353, 3.150508, 0, 0, 0, 1, 1,
0.90534, 0.4846429, 1.028376, 0, 0, 0, 1, 1,
0.906273, 0.4754846, 0.488785, 0, 0, 0, 1, 1,
0.9073619, -1.106959, 2.189877, 1, 1, 1, 1, 1,
0.9078995, -0.3714414, 1.780022, 1, 1, 1, 1, 1,
0.9093596, -0.1039284, 1.356487, 1, 1, 1, 1, 1,
0.9176905, -0.2847504, 1.941158, 1, 1, 1, 1, 1,
0.9186776, 0.1459557, 2.355564, 1, 1, 1, 1, 1,
0.9285671, 0.2982086, 2.545816, 1, 1, 1, 1, 1,
0.9349653, 1.063375, 0.836946, 1, 1, 1, 1, 1,
0.9392788, 0.7481201, 0.9847429, 1, 1, 1, 1, 1,
0.9408265, 1.179743, 0.560729, 1, 1, 1, 1, 1,
0.9410926, 0.2430557, 0.6902804, 1, 1, 1, 1, 1,
0.9416167, 0.779936, 2.59541, 1, 1, 1, 1, 1,
0.943997, -0.8021931, 2.728718, 1, 1, 1, 1, 1,
0.9482141, 1.301742, 0.7207033, 1, 1, 1, 1, 1,
0.9506004, 3.370446, 0.2994274, 1, 1, 1, 1, 1,
0.9511186, 0.4903806, 0.6609334, 1, 1, 1, 1, 1,
0.9514988, -0.03535573, 1.884184, 0, 0, 1, 1, 1,
0.9574558, -0.3397618, 2.499308, 1, 0, 0, 1, 1,
0.9634361, -0.5389239, 4.332307, 1, 0, 0, 1, 1,
0.9641392, -0.6259365, 3.615303, 1, 0, 0, 1, 1,
0.9761159, -0.02036479, 1.384287, 1, 0, 0, 1, 1,
0.9780675, 1.136974, 2.605393, 1, 0, 0, 1, 1,
0.9860404, 0.3236178, -0.04027831, 0, 0, 0, 1, 1,
0.9882399, -1.081872, 2.751878, 0, 0, 0, 1, 1,
0.994527, -2.029286, 4.222372, 0, 0, 0, 1, 1,
0.9959219, -0.1592499, 1.667327, 0, 0, 0, 1, 1,
1.008924, 0.993651, -0.5698003, 0, 0, 0, 1, 1,
1.010308, 0.592231, 1.447314, 0, 0, 0, 1, 1,
1.010573, -1.634896, 3.039935, 0, 0, 0, 1, 1,
1.010818, -0.07796533, 1.511902, 1, 1, 1, 1, 1,
1.014491, -1.378234, 0.4731667, 1, 1, 1, 1, 1,
1.016115, -0.2818043, 2.410931, 1, 1, 1, 1, 1,
1.017807, -0.8612015, 2.309525, 1, 1, 1, 1, 1,
1.026066, -0.7846881, 2.679948, 1, 1, 1, 1, 1,
1.031822, -1.661391, 1.299253, 1, 1, 1, 1, 1,
1.041596, 0.3928626, 1.064546, 1, 1, 1, 1, 1,
1.044174, 0.5559127, 0.7182087, 1, 1, 1, 1, 1,
1.047833, -1.771491, 2.241522, 1, 1, 1, 1, 1,
1.053316, -1.348973, 1.691071, 1, 1, 1, 1, 1,
1.070759, -0.1368177, 0.7338657, 1, 1, 1, 1, 1,
1.075217, -1.177514, 0.8960695, 1, 1, 1, 1, 1,
1.08201, 0.5738038, 3.419602, 1, 1, 1, 1, 1,
1.086805, -3.477215, 3.995342, 1, 1, 1, 1, 1,
1.092446, -1.545275, 1.962567, 1, 1, 1, 1, 1,
1.093981, 1.161196, 0.2866591, 0, 0, 1, 1, 1,
1.096472, -0.3764988, 2.035333, 1, 0, 0, 1, 1,
1.097138, -0.9943913, 2.423743, 1, 0, 0, 1, 1,
1.098394, 0.4520014, 0.8164358, 1, 0, 0, 1, 1,
1.103655, -1.323031, 1.498379, 1, 0, 0, 1, 1,
1.110066, -1.099423, 1.436298, 1, 0, 0, 1, 1,
1.112097, -2.841712, 2.794265, 0, 0, 0, 1, 1,
1.118918, 0.1682982, 1.152364, 0, 0, 0, 1, 1,
1.120602, -0.2002317, -0.0006358461, 0, 0, 0, 1, 1,
1.129832, -0.7237394, 2.397656, 0, 0, 0, 1, 1,
1.130208, 1.979958, 0.6189905, 0, 0, 0, 1, 1,
1.152053, -1.289981, 1.150566, 0, 0, 0, 1, 1,
1.159663, -0.4666825, 3.116505, 0, 0, 0, 1, 1,
1.163448, -0.99142, 2.602615, 1, 1, 1, 1, 1,
1.167268, -0.1590438, 2.160639, 1, 1, 1, 1, 1,
1.169773, -0.09386057, 2.429297, 1, 1, 1, 1, 1,
1.190589, -1.114096, 4.061275, 1, 1, 1, 1, 1,
1.197211, 2.329311, 2.703172, 1, 1, 1, 1, 1,
1.200162, 0.281857, 0.3234088, 1, 1, 1, 1, 1,
1.201469, -0.6094795, 1.191753, 1, 1, 1, 1, 1,
1.205017, 0.1418637, 2.066092, 1, 1, 1, 1, 1,
1.209906, -2.040594, 3.933824, 1, 1, 1, 1, 1,
1.213053, 0.8873248, 1.134488, 1, 1, 1, 1, 1,
1.220234, -0.3520428, 1.68785, 1, 1, 1, 1, 1,
1.227956, -0.7953728, 1.189797, 1, 1, 1, 1, 1,
1.233687, -1.150793, 2.555285, 1, 1, 1, 1, 1,
1.236217, 0.6560298, -2.167725, 1, 1, 1, 1, 1,
1.23737, 2.933518, 0.9362243, 1, 1, 1, 1, 1,
1.2392, -0.4207512, 2.787662, 0, 0, 1, 1, 1,
1.247668, 0.7720032, 1.679177, 1, 0, 0, 1, 1,
1.25586, -0.4956146, 4.533185, 1, 0, 0, 1, 1,
1.26236, 1.141826, 0.221267, 1, 0, 0, 1, 1,
1.278837, 0.8297321, 1.730375, 1, 0, 0, 1, 1,
1.303945, -0.6775674, 1.061084, 1, 0, 0, 1, 1,
1.305443, -0.431674, 0.09590948, 0, 0, 0, 1, 1,
1.30673, 0.5889938, -0.8872006, 0, 0, 0, 1, 1,
1.306869, 0.4904055, 0.984485, 0, 0, 0, 1, 1,
1.309255, -0.6336216, 1.46603, 0, 0, 0, 1, 1,
1.312539, 0.08267105, 0.4234465, 0, 0, 0, 1, 1,
1.315792, 0.1075524, 0.1029784, 0, 0, 0, 1, 1,
1.322527, 1.524148, -0.2255913, 0, 0, 0, 1, 1,
1.32769, 1.273931, 1.794265, 1, 1, 1, 1, 1,
1.32883, -0.5752869, 2.901344, 1, 1, 1, 1, 1,
1.332709, -0.7098861, 1.810814, 1, 1, 1, 1, 1,
1.342841, -1.166731, 1.055324, 1, 1, 1, 1, 1,
1.344095, 0.3382776, 1.790811, 1, 1, 1, 1, 1,
1.346927, 0.3412337, 0.1103683, 1, 1, 1, 1, 1,
1.360963, 0.484617, 0.7904639, 1, 1, 1, 1, 1,
1.36367, -1.399662, 2.620798, 1, 1, 1, 1, 1,
1.367442, -1.061279, 2.61173, 1, 1, 1, 1, 1,
1.373537, 0.2956964, -1.24029, 1, 1, 1, 1, 1,
1.38519, -0.2006436, 0.9165769, 1, 1, 1, 1, 1,
1.39191, 3.289027, 0.7578225, 1, 1, 1, 1, 1,
1.412033, -0.2950669, 1.880894, 1, 1, 1, 1, 1,
1.412555, -0.9371544, 2.334716, 1, 1, 1, 1, 1,
1.417878, -0.3038106, 0.4036678, 1, 1, 1, 1, 1,
1.425014, -0.9964731, 1.523321, 0, 0, 1, 1, 1,
1.426328, -0.1439116, 0.7817487, 1, 0, 0, 1, 1,
1.426735, -0.9509766, 1.696771, 1, 0, 0, 1, 1,
1.440965, 0.2546637, 0.8731824, 1, 0, 0, 1, 1,
1.445608, -0.3842794, 2.533093, 1, 0, 0, 1, 1,
1.451064, -0.4171011, 1.927419, 1, 0, 0, 1, 1,
1.453897, -0.7056972, 1.307938, 0, 0, 0, 1, 1,
1.458176, 1.166195, 0.3824819, 0, 0, 0, 1, 1,
1.463642, -0.8191081, 1.741605, 0, 0, 0, 1, 1,
1.463778, 1.046675, 2.165504, 0, 0, 0, 1, 1,
1.504324, -0.2573372, 1.561063, 0, 0, 0, 1, 1,
1.507426, -0.8257267, 1.682242, 0, 0, 0, 1, 1,
1.511526, 1.084, 1.17784, 0, 0, 0, 1, 1,
1.513504, -0.03923272, -0.4866064, 1, 1, 1, 1, 1,
1.53634, 0.6190909, 2.90335, 1, 1, 1, 1, 1,
1.549484, -0.4642444, 2.91806, 1, 1, 1, 1, 1,
1.557172, 0.2561204, 2.50165, 1, 1, 1, 1, 1,
1.568428, -0.3410756, 0.5928953, 1, 1, 1, 1, 1,
1.583002, -0.9070221, 2.754408, 1, 1, 1, 1, 1,
1.585971, -0.4007551, -0.1022706, 1, 1, 1, 1, 1,
1.588251, 1.249315, 1.401697, 1, 1, 1, 1, 1,
1.591516, -0.99966, 0.3629023, 1, 1, 1, 1, 1,
1.594286, 0.0806048, 1.290058, 1, 1, 1, 1, 1,
1.594996, 1.082608, 2.310927, 1, 1, 1, 1, 1,
1.598887, 0.6210936, 1.634012, 1, 1, 1, 1, 1,
1.599484, 1.237327, 2.07143, 1, 1, 1, 1, 1,
1.60074, 0.363186, 2.588437, 1, 1, 1, 1, 1,
1.603486, 0.3463926, 1.227581, 1, 1, 1, 1, 1,
1.608353, 0.152493, 2.566525, 0, 0, 1, 1, 1,
1.612164, 0.1742701, 2.736881, 1, 0, 0, 1, 1,
1.61655, 0.04172089, 1.335859, 1, 0, 0, 1, 1,
1.616948, -0.2567737, 1.347018, 1, 0, 0, 1, 1,
1.618058, 0.1308417, 1.786692, 1, 0, 0, 1, 1,
1.632058, -1.203908, 1.527229, 1, 0, 0, 1, 1,
1.640909, -2.075161, 2.249908, 0, 0, 0, 1, 1,
1.655836, 0.3961514, 1.591409, 0, 0, 0, 1, 1,
1.66676, -0.06689522, 2.643957, 0, 0, 0, 1, 1,
1.668826, -1.138781, 1.429007, 0, 0, 0, 1, 1,
1.690899, -1.333489, 3.134322, 0, 0, 0, 1, 1,
1.694859, -0.2793436, 2.180023, 0, 0, 0, 1, 1,
1.695158, -0.6636646, 1.695535, 0, 0, 0, 1, 1,
1.704723, 0.1552896, 2.587562, 1, 1, 1, 1, 1,
1.71688, -0.4881924, 2.951964, 1, 1, 1, 1, 1,
1.724776, -0.2946559, 1.230365, 1, 1, 1, 1, 1,
1.785849, -1.115127, 1.654489, 1, 1, 1, 1, 1,
1.799223, 0.4010039, 0.9370022, 1, 1, 1, 1, 1,
1.79927, -0.1367742, -0.3211075, 1, 1, 1, 1, 1,
1.806301, -1.031424, 2.950636, 1, 1, 1, 1, 1,
1.825006, -1.478361, 1.602747, 1, 1, 1, 1, 1,
1.825521, -0.6883205, 0.6710674, 1, 1, 1, 1, 1,
1.833256, -1.967, 2.618315, 1, 1, 1, 1, 1,
1.860229, 0.147725, 1.205196, 1, 1, 1, 1, 1,
1.88144, 1.729153, 0.1430167, 1, 1, 1, 1, 1,
1.926834, 0.8656743, 0.247288, 1, 1, 1, 1, 1,
1.96048, 2.561062, 2.329259, 1, 1, 1, 1, 1,
1.963506, -0.4364396, 3.452358, 1, 1, 1, 1, 1,
2.004408, 0.3272856, 0.2617317, 0, 0, 1, 1, 1,
2.01069, -1.6285, 2.355361, 1, 0, 0, 1, 1,
2.021797, 0.9216264, -0.2678644, 1, 0, 0, 1, 1,
2.142488, -0.2946909, 1.811495, 1, 0, 0, 1, 1,
2.187881, -0.8928936, 1.859176, 1, 0, 0, 1, 1,
2.248823, 0.4175872, 1.017918, 1, 0, 0, 1, 1,
2.28165, 0.6173484, -0.01444431, 0, 0, 0, 1, 1,
2.380762, -0.5726045, 0.5012701, 0, 0, 0, 1, 1,
2.387795, 1.201205, 1.249483, 0, 0, 0, 1, 1,
2.443983, 1.262531, 0.7388874, 0, 0, 0, 1, 1,
2.470536, 2.629, 0.5704967, 0, 0, 0, 1, 1,
2.480226, 1.193037, 2.331002, 0, 0, 0, 1, 1,
2.485895, 0.9414642, 3.974962, 0, 0, 0, 1, 1,
2.559396, 0.09237467, 1.22809, 1, 1, 1, 1, 1,
2.56025, -0.5523002, 3.644427, 1, 1, 1, 1, 1,
2.685461, 1.783117, -0.03625355, 1, 1, 1, 1, 1,
2.733723, -0.2890499, 2.416901, 1, 1, 1, 1, 1,
2.740052, 0.3158589, 3.411416, 1, 1, 1, 1, 1,
3.214484, -1.778393, 3.219423, 1, 1, 1, 1, 1,
3.281325, 0.5181436, 1.419449, 1, 1, 1, 1, 1
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
var radius = 9.94396;
var distance = 34.92774;
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
mvMatrix.translate( -0.08370209, -0.06440449, 0.2965672 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.92774);
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