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
-3.73082, -0.2000261, 0.3215996, 1, 0, 0, 1,
-3.311296, -0.8521196, -0.2795547, 1, 0.007843138, 0, 1,
-3.037153, -0.0747353, -2.040367, 1, 0.01176471, 0, 1,
-2.777035, -0.4505993, -2.157735, 1, 0.01960784, 0, 1,
-2.751023, -0.4980161, -1.175018, 1, 0.02352941, 0, 1,
-2.692144, 0.1431904, -2.542387, 1, 0.03137255, 0, 1,
-2.528903, 0.6320415, -2.62489, 1, 0.03529412, 0, 1,
-2.379119, 1.811579, 1.445251, 1, 0.04313726, 0, 1,
-2.325917, 0.3569289, -0.1693937, 1, 0.04705882, 0, 1,
-2.271146, 0.658628, 0.0943815, 1, 0.05490196, 0, 1,
-2.267444, -0.5562891, -1.99816, 1, 0.05882353, 0, 1,
-2.171405, -0.7989354, -1.268398, 1, 0.06666667, 0, 1,
-2.138341, -1.618557, -2.008032, 1, 0.07058824, 0, 1,
-2.129825, 0.9469234, -1.191035, 1, 0.07843138, 0, 1,
-2.056734, 1.382871, 0.08111861, 1, 0.08235294, 0, 1,
-2.05455, -2.756017, -3.654723, 1, 0.09019608, 0, 1,
-1.97741, -0.6296463, -0.9741544, 1, 0.09411765, 0, 1,
-1.955893, -1.383836, -1.865014, 1, 0.1019608, 0, 1,
-1.949574, -1.216286, -0.8704378, 1, 0.1098039, 0, 1,
-1.936835, 0.1244206, -2.331409, 1, 0.1137255, 0, 1,
-1.934196, -0.1864444, -2.903788, 1, 0.1215686, 0, 1,
-1.924178, 0.4105403, -2.256521, 1, 0.1254902, 0, 1,
-1.921181, 0.4049804, -2.636993, 1, 0.1333333, 0, 1,
-1.918433, 0.2982439, -1.673127, 1, 0.1372549, 0, 1,
-1.883334, 0.311285, -1.872706, 1, 0.145098, 0, 1,
-1.87985, 0.1186512, -1.154646, 1, 0.1490196, 0, 1,
-1.871429, -0.823891, -3.166123, 1, 0.1568628, 0, 1,
-1.866918, -0.8484619, -1.155167, 1, 0.1607843, 0, 1,
-1.858015, 0.6988866, -1.720337, 1, 0.1686275, 0, 1,
-1.856748, -0.8985757, -3.665291, 1, 0.172549, 0, 1,
-1.848883, 1.10381, -1.747691, 1, 0.1803922, 0, 1,
-1.847149, -1.27089, -1.667308, 1, 0.1843137, 0, 1,
-1.834172, 1.722285, 1.320606, 1, 0.1921569, 0, 1,
-1.831937, 0.9829803, -0.5951577, 1, 0.1960784, 0, 1,
-1.802224, 0.5561525, -2.273745, 1, 0.2039216, 0, 1,
-1.782109, 1.049253, -1.583753, 1, 0.2117647, 0, 1,
-1.743266, -0.7573619, -2.090128, 1, 0.2156863, 0, 1,
-1.736642, 1.519573, -1.023829, 1, 0.2235294, 0, 1,
-1.71717, 0.1005367, -2.407079, 1, 0.227451, 0, 1,
-1.705876, 0.1697097, -0.7980995, 1, 0.2352941, 0, 1,
-1.702987, 1.266709, -1.610099, 1, 0.2392157, 0, 1,
-1.702269, 0.829301, -1.740633, 1, 0.2470588, 0, 1,
-1.695722, 0.530337, -0.9698601, 1, 0.2509804, 0, 1,
-1.661015, -1.585215, -3.294954, 1, 0.2588235, 0, 1,
-1.654826, -0.220799, -3.443989, 1, 0.2627451, 0, 1,
-1.654704, -1.525278, -1.664778, 1, 0.2705882, 0, 1,
-1.648983, -0.36677, -2.189765, 1, 0.2745098, 0, 1,
-1.648743, 0.9180954, 0.1014817, 1, 0.282353, 0, 1,
-1.636803, -1.149383, -1.409067, 1, 0.2862745, 0, 1,
-1.632771, 0.2688067, -2.780424, 1, 0.2941177, 0, 1,
-1.620212, 0.3584069, -0.7958265, 1, 0.3019608, 0, 1,
-1.608564, 2.219419, -0.4712501, 1, 0.3058824, 0, 1,
-1.596748, -1.003753, -2.551085, 1, 0.3137255, 0, 1,
-1.594635, 0.2742125, -0.224218, 1, 0.3176471, 0, 1,
-1.583874, 1.288423, -1.496103, 1, 0.3254902, 0, 1,
-1.580282, -2.101445, -1.145062, 1, 0.3294118, 0, 1,
-1.577888, -0.6272295, 0.4171572, 1, 0.3372549, 0, 1,
-1.577144, 0.6521472, 0.09117139, 1, 0.3411765, 0, 1,
-1.575331, 1.962838, 0.06754342, 1, 0.3490196, 0, 1,
-1.575199, 1.214721, -0.02724459, 1, 0.3529412, 0, 1,
-1.571392, -0.005685372, -1.287774, 1, 0.3607843, 0, 1,
-1.56769, -0.144276, -1.205454, 1, 0.3647059, 0, 1,
-1.566174, -1.603245, -0.4637559, 1, 0.372549, 0, 1,
-1.546431, 0.8776798, -0.9874679, 1, 0.3764706, 0, 1,
-1.544106, -0.1216605, -1.443843, 1, 0.3843137, 0, 1,
-1.543104, 1.552203, -0.9495413, 1, 0.3882353, 0, 1,
-1.537199, -0.340016, -0.742404, 1, 0.3960784, 0, 1,
-1.53188, 0.5446011, -0.4660905, 1, 0.4039216, 0, 1,
-1.529257, -0.1452954, -2.762441, 1, 0.4078431, 0, 1,
-1.524261, 0.6113442, -0.7433715, 1, 0.4156863, 0, 1,
-1.490003, -1.492006, -3.511302, 1, 0.4196078, 0, 1,
-1.479908, -1.164593, -2.013121, 1, 0.427451, 0, 1,
-1.466678, 0.8880684, -0.1735911, 1, 0.4313726, 0, 1,
-1.454234, -0.3700206, -2.799844, 1, 0.4392157, 0, 1,
-1.438267, -0.3937714, -0.338458, 1, 0.4431373, 0, 1,
-1.429339, -0.07435574, -2.818275, 1, 0.4509804, 0, 1,
-1.420781, -0.5456434, -1.936768, 1, 0.454902, 0, 1,
-1.420534, -0.3005515, -3.134327, 1, 0.4627451, 0, 1,
-1.41185, 0.721983, -1.770713, 1, 0.4666667, 0, 1,
-1.407955, 0.4416781, -1.690184, 1, 0.4745098, 0, 1,
-1.407013, 0.9888791, 0.7923781, 1, 0.4784314, 0, 1,
-1.400971, 0.03458149, 0.6115206, 1, 0.4862745, 0, 1,
-1.398269, 0.2380191, -1.46367, 1, 0.4901961, 0, 1,
-1.397366, -1.328428, -2.940948, 1, 0.4980392, 0, 1,
-1.394148, 0.6682733, -1.358612, 1, 0.5058824, 0, 1,
-1.39233, 1.496191, -0.1703137, 1, 0.509804, 0, 1,
-1.388153, -0.6574417, -2.333752, 1, 0.5176471, 0, 1,
-1.379774, -0.07087498, -4.042621, 1, 0.5215687, 0, 1,
-1.378569, -1.551874, -2.252948, 1, 0.5294118, 0, 1,
-1.367062, -1.431909, -1.980152, 1, 0.5333334, 0, 1,
-1.360809, -0.03786547, -2.932805, 1, 0.5411765, 0, 1,
-1.353722, 0.7687028, -0.08937819, 1, 0.5450981, 0, 1,
-1.349295, -1.136919, -0.7602596, 1, 0.5529412, 0, 1,
-1.342, -1.028894, -2.53983, 1, 0.5568628, 0, 1,
-1.331768, 0.4012509, -3.160629, 1, 0.5647059, 0, 1,
-1.319462, 0.6763307, -2.011867, 1, 0.5686275, 0, 1,
-1.318942, -0.5736141, -2.703173, 1, 0.5764706, 0, 1,
-1.312637, -1.547626, -2.471344, 1, 0.5803922, 0, 1,
-1.309256, -0.6311805, 0.4494461, 1, 0.5882353, 0, 1,
-1.308378, -0.2581809, -2.031704, 1, 0.5921569, 0, 1,
-1.308255, -0.7788333, -1.103517, 1, 0.6, 0, 1,
-1.306333, 1.097534, -0.4564647, 1, 0.6078432, 0, 1,
-1.304371, -1.360714, -3.297364, 1, 0.6117647, 0, 1,
-1.30066, -1.032501, -1.752704, 1, 0.6196079, 0, 1,
-1.298397, -0.7121795, -2.758518, 1, 0.6235294, 0, 1,
-1.28711, -0.2293325, -2.790332, 1, 0.6313726, 0, 1,
-1.281913, 0.3520968, -2.127367, 1, 0.6352941, 0, 1,
-1.28184, 1.811494, 0.84573, 1, 0.6431373, 0, 1,
-1.277041, 0.2462731, -2.422719, 1, 0.6470588, 0, 1,
-1.27679, 0.8290603, -0.1653502, 1, 0.654902, 0, 1,
-1.275039, -1.720679, -1.217609, 1, 0.6588235, 0, 1,
-1.273901, 0.9984037, -1.402545, 1, 0.6666667, 0, 1,
-1.263115, 0.5920543, 0.4029574, 1, 0.6705883, 0, 1,
-1.262061, 1.086163, -0.1502451, 1, 0.6784314, 0, 1,
-1.258801, -1.699605, -1.829151, 1, 0.682353, 0, 1,
-1.2502, 1.653039, -0.1234331, 1, 0.6901961, 0, 1,
-1.246243, -1.137762, -1.056811, 1, 0.6941177, 0, 1,
-1.239044, 0.2683578, -2.554401, 1, 0.7019608, 0, 1,
-1.236946, 0.1139188, -2.01281, 1, 0.7098039, 0, 1,
-1.230782, 3.2498, -2.409505, 1, 0.7137255, 0, 1,
-1.22783, -1.494342, -4.300473, 1, 0.7215686, 0, 1,
-1.226627, -0.5312678, -2.007401, 1, 0.7254902, 0, 1,
-1.22585, -1.006035, -0.635401, 1, 0.7333333, 0, 1,
-1.225412, -0.04271397, -0.2236619, 1, 0.7372549, 0, 1,
-1.215335, 1.251708, -0.7669067, 1, 0.7450981, 0, 1,
-1.211119, -0.07168666, 0.06910601, 1, 0.7490196, 0, 1,
-1.200978, 2.122705, -1.316506, 1, 0.7568628, 0, 1,
-1.190823, 0.3822137, -1.270688, 1, 0.7607843, 0, 1,
-1.188916, -0.8337074, -3.072444, 1, 0.7686275, 0, 1,
-1.187422, -0.5891624, -0.9413034, 1, 0.772549, 0, 1,
-1.18417, -0.5716915, -0.8352934, 1, 0.7803922, 0, 1,
-1.173489, 1.684405, -0.4935702, 1, 0.7843137, 0, 1,
-1.168807, 2.799525, -0.4147608, 1, 0.7921569, 0, 1,
-1.16853, -2.017112, -2.953588, 1, 0.7960784, 0, 1,
-1.165106, -0.7769123, -1.737824, 1, 0.8039216, 0, 1,
-1.164987, -0.02394031, -2.776987, 1, 0.8117647, 0, 1,
-1.163543, -0.5159369, -0.4736612, 1, 0.8156863, 0, 1,
-1.160745, 0.8822551, -1.149628, 1, 0.8235294, 0, 1,
-1.153439, 0.5412683, -0.1178099, 1, 0.827451, 0, 1,
-1.150889, -2.769071, -1.818179, 1, 0.8352941, 0, 1,
-1.147024, -0.3793737, -1.330235, 1, 0.8392157, 0, 1,
-1.145339, -0.4106015, -1.655266, 1, 0.8470588, 0, 1,
-1.137722, 1.309875, -0.6789399, 1, 0.8509804, 0, 1,
-1.135799, -0.6472499, -0.04595226, 1, 0.8588235, 0, 1,
-1.135014, 1.244232, -1.111655, 1, 0.8627451, 0, 1,
-1.128748, 1.518072, -1.866135, 1, 0.8705882, 0, 1,
-1.126766, -0.3998421, -1.307441, 1, 0.8745098, 0, 1,
-1.117948, -0.9638066, -2.395129, 1, 0.8823529, 0, 1,
-1.113752, 0.4522405, -0.7173671, 1, 0.8862745, 0, 1,
-1.101732, -0.470651, -2.008428, 1, 0.8941177, 0, 1,
-1.099365, 0.4228232, -0.7045733, 1, 0.8980392, 0, 1,
-1.097406, 0.4661566, -1.58753, 1, 0.9058824, 0, 1,
-1.091158, 0.2924035, -0.12804, 1, 0.9137255, 0, 1,
-1.087882, 1.917093, -1.768576, 1, 0.9176471, 0, 1,
-1.071709, 0.1476749, 1.90497, 1, 0.9254902, 0, 1,
-1.062096, 0.1379059, -0.6891294, 1, 0.9294118, 0, 1,
-1.056486, -1.167277, -1.746014, 1, 0.9372549, 0, 1,
-1.051242, -0.5327306, -1.759256, 1, 0.9411765, 0, 1,
-1.038989, 1.161004, -0.5277815, 1, 0.9490196, 0, 1,
-1.03297, 1.66633, -0.2675807, 1, 0.9529412, 0, 1,
-1.02758, -0.239637, -1.580334, 1, 0.9607843, 0, 1,
-1.020422, 2.767361, 1.441501, 1, 0.9647059, 0, 1,
-1.020198, -0.1939725, -1.566657, 1, 0.972549, 0, 1,
-1.010389, -0.3244652, -2.520631, 1, 0.9764706, 0, 1,
-1.006723, -1.060128, -2.751006, 1, 0.9843137, 0, 1,
-1.0053, 1.194908, 0.891719, 1, 0.9882353, 0, 1,
-0.9991407, 0.06843875, -1.074919, 1, 0.9960784, 0, 1,
-0.9927886, 0.6716927, -0.7390136, 0.9960784, 1, 0, 1,
-0.9913775, -0.1597956, -1.469244, 0.9921569, 1, 0, 1,
-0.9885457, -0.1269962, -1.722529, 0.9843137, 1, 0, 1,
-0.9883327, -2.111056, -3.976141, 0.9803922, 1, 0, 1,
-0.9879775, -0.5482665, -1.326066, 0.972549, 1, 0, 1,
-0.9873512, -0.1431756, -2.031166, 0.9686275, 1, 0, 1,
-0.9845979, 0.8534722, -0.8539443, 0.9607843, 1, 0, 1,
-0.9818225, -0.2474077, -1.398121, 0.9568627, 1, 0, 1,
-0.9776385, 1.569985, -0.5223062, 0.9490196, 1, 0, 1,
-0.9771304, 1.512898, -2.778484, 0.945098, 1, 0, 1,
-0.9649764, 0.6864123, -1.141897, 0.9372549, 1, 0, 1,
-0.9638329, -0.4082907, -2.236784, 0.9333333, 1, 0, 1,
-0.9607253, 2.680287, -0.6748197, 0.9254902, 1, 0, 1,
-0.9592454, -0.3101924, -1.71978, 0.9215686, 1, 0, 1,
-0.95904, 1.190265, -1.148735, 0.9137255, 1, 0, 1,
-0.9517263, -0.144607, -0.02818493, 0.9098039, 1, 0, 1,
-0.9473829, 0.1490566, -1.340627, 0.9019608, 1, 0, 1,
-0.9389968, -0.9641196, -2.644734, 0.8941177, 1, 0, 1,
-0.9365714, 0.4807472, -2.499287, 0.8901961, 1, 0, 1,
-0.9325402, 1.005825, -0.4982199, 0.8823529, 1, 0, 1,
-0.9288376, 0.3172929, -0.478708, 0.8784314, 1, 0, 1,
-0.9146513, -0.7303085, -2.660081, 0.8705882, 1, 0, 1,
-0.9136555, -1.013792, -0.9212461, 0.8666667, 1, 0, 1,
-0.9118855, -0.3804327, -2.377012, 0.8588235, 1, 0, 1,
-0.908573, 0.2484558, 0.3346945, 0.854902, 1, 0, 1,
-0.9036875, 1.215715, -1.754749, 0.8470588, 1, 0, 1,
-0.897685, 0.2661748, -2.993713, 0.8431373, 1, 0, 1,
-0.8972465, -0.1919849, 0.3224169, 0.8352941, 1, 0, 1,
-0.8851412, -0.2225755, -1.875993, 0.8313726, 1, 0, 1,
-0.882507, 1.3146, -0.8758845, 0.8235294, 1, 0, 1,
-0.8780172, 1.753984, -2.784974, 0.8196079, 1, 0, 1,
-0.8675766, 0.2123603, -0.3881456, 0.8117647, 1, 0, 1,
-0.863991, 0.8414425, -2.383174, 0.8078431, 1, 0, 1,
-0.8632061, -0.6640461, -1.220515, 0.8, 1, 0, 1,
-0.8612953, -0.6696275, -2.592043, 0.7921569, 1, 0, 1,
-0.8578079, 1.390651, -0.6989799, 0.7882353, 1, 0, 1,
-0.8522883, -0.2904548, -2.501637, 0.7803922, 1, 0, 1,
-0.8472978, 1.237635, -1.31332, 0.7764706, 1, 0, 1,
-0.8467501, 0.6243748, 0.03996365, 0.7686275, 1, 0, 1,
-0.8445707, 1.229404, -0.9638473, 0.7647059, 1, 0, 1,
-0.8439466, -0.7275741, -1.005807, 0.7568628, 1, 0, 1,
-0.8417024, -1.201728, -2.225325, 0.7529412, 1, 0, 1,
-0.837326, 0.0006472423, -0.06002798, 0.7450981, 1, 0, 1,
-0.8329831, -0.4978858, -3.680988, 0.7411765, 1, 0, 1,
-0.8189299, 0.2695722, -2.754689, 0.7333333, 1, 0, 1,
-0.8116408, 0.9958535, -0.6075424, 0.7294118, 1, 0, 1,
-0.8097106, -0.277082, -0.497523, 0.7215686, 1, 0, 1,
-0.8062745, 1.002343, -0.8304467, 0.7176471, 1, 0, 1,
-0.8058376, -1.385539, -1.876528, 0.7098039, 1, 0, 1,
-0.8015888, 0.3877714, -1.672386, 0.7058824, 1, 0, 1,
-0.7985433, -1.947984, -3.521888, 0.6980392, 1, 0, 1,
-0.7964702, 0.4179718, -0.09313688, 0.6901961, 1, 0, 1,
-0.7949111, -1.472978, -3.091494, 0.6862745, 1, 0, 1,
-0.7919818, 0.7979464, 0.08788931, 0.6784314, 1, 0, 1,
-0.7879313, 1.231227, -2.367336, 0.6745098, 1, 0, 1,
-0.7866678, -1.55247, -2.469047, 0.6666667, 1, 0, 1,
-0.7787352, 0.04747648, -2.01652, 0.6627451, 1, 0, 1,
-0.7742876, -1.233643, -4.141515, 0.654902, 1, 0, 1,
-0.77185, -1.650991, -3.142559, 0.6509804, 1, 0, 1,
-0.7705202, 0.1993445, -2.468381, 0.6431373, 1, 0, 1,
-0.7528435, -0.6559867, -2.432406, 0.6392157, 1, 0, 1,
-0.7524201, -2.474193, -2.23889, 0.6313726, 1, 0, 1,
-0.7517937, -2.051597, -1.854786, 0.627451, 1, 0, 1,
-0.7479032, 0.8936571, -0.8224666, 0.6196079, 1, 0, 1,
-0.7463627, -0.5493586, -2.247095, 0.6156863, 1, 0, 1,
-0.7460217, 0.1868709, -1.903654, 0.6078432, 1, 0, 1,
-0.7444173, 0.1280606, -1.493062, 0.6039216, 1, 0, 1,
-0.7363258, -0.5955642, -3.682862, 0.5960785, 1, 0, 1,
-0.728978, -0.5739766, -1.816358, 0.5882353, 1, 0, 1,
-0.7254173, -0.02689659, -3.013808, 0.5843138, 1, 0, 1,
-0.7197886, 3.359803, -0.1538473, 0.5764706, 1, 0, 1,
-0.7143476, 0.1735417, -0.8509194, 0.572549, 1, 0, 1,
-0.7123917, -0.0323396, -2.535325, 0.5647059, 1, 0, 1,
-0.7114762, 0.5271372, -3.802082, 0.5607843, 1, 0, 1,
-0.7108548, 0.5232735, -2.443107, 0.5529412, 1, 0, 1,
-0.7061044, 0.3133246, 0.03608406, 0.5490196, 1, 0, 1,
-0.7054294, -0.3790432, -2.771277, 0.5411765, 1, 0, 1,
-0.7002249, -0.1765658, -1.197746, 0.5372549, 1, 0, 1,
-0.6970289, 0.2054007, -0.7798485, 0.5294118, 1, 0, 1,
-0.6937488, -0.2509726, -1.483096, 0.5254902, 1, 0, 1,
-0.6864136, -0.1359597, -1.735349, 0.5176471, 1, 0, 1,
-0.6805543, -0.4346696, -2.957673, 0.5137255, 1, 0, 1,
-0.6805422, -0.177245, -0.2910551, 0.5058824, 1, 0, 1,
-0.6769091, -0.01458291, -1.932798, 0.5019608, 1, 0, 1,
-0.6721513, -0.7567244, -2.007239, 0.4941176, 1, 0, 1,
-0.6698944, -1.592169, -2.206171, 0.4862745, 1, 0, 1,
-0.659548, -0.7534796, -2.339007, 0.4823529, 1, 0, 1,
-0.6592665, 0.5131617, -2.333126, 0.4745098, 1, 0, 1,
-0.6456633, -1.550965, -3.154558, 0.4705882, 1, 0, 1,
-0.6398515, -0.6014561, -2.941661, 0.4627451, 1, 0, 1,
-0.6355261, 0.02913572, -1.828474, 0.4588235, 1, 0, 1,
-0.6322192, -0.2161238, -2.643031, 0.4509804, 1, 0, 1,
-0.6318482, 1.689416, -0.2645206, 0.4470588, 1, 0, 1,
-0.628184, -0.2653903, -0.7930694, 0.4392157, 1, 0, 1,
-0.6279209, -0.9415143, -2.849031, 0.4352941, 1, 0, 1,
-0.6250759, -1.146308, -3.240169, 0.427451, 1, 0, 1,
-0.6244351, 0.2350686, -1.49255, 0.4235294, 1, 0, 1,
-0.6230786, -0.7835175, -2.189985, 0.4156863, 1, 0, 1,
-0.6209698, -0.654514, -4.808459, 0.4117647, 1, 0, 1,
-0.6148952, 0.4504652, -0.5989986, 0.4039216, 1, 0, 1,
-0.6081837, -0.009137086, -1.254212, 0.3960784, 1, 0, 1,
-0.6046111, -0.1440471, -1.210917, 0.3921569, 1, 0, 1,
-0.6041559, 1.339819, 0.1103423, 0.3843137, 1, 0, 1,
-0.6026358, 0.06346064, -0.02361085, 0.3803922, 1, 0, 1,
-0.6022359, -0.2395565, -2.150432, 0.372549, 1, 0, 1,
-0.602133, -0.2086872, -2.164609, 0.3686275, 1, 0, 1,
-0.6021054, 0.01380913, -1.099348, 0.3607843, 1, 0, 1,
-0.6006069, -0.8790164, -2.00276, 0.3568628, 1, 0, 1,
-0.5992717, 1.012153, -0.4832276, 0.3490196, 1, 0, 1,
-0.59909, 1.263497, -0.2026867, 0.345098, 1, 0, 1,
-0.5985574, 0.4682217, -0.5534335, 0.3372549, 1, 0, 1,
-0.5975588, -0.6480159, -2.574922, 0.3333333, 1, 0, 1,
-0.5959165, -0.8393538, -2.026204, 0.3254902, 1, 0, 1,
-0.5933262, 0.2561629, -0.2042985, 0.3215686, 1, 0, 1,
-0.591122, -0.9202617, -3.191511, 0.3137255, 1, 0, 1,
-0.587808, 1.196784, 0.6609521, 0.3098039, 1, 0, 1,
-0.5840077, 0.9869547, 1.157475, 0.3019608, 1, 0, 1,
-0.5805134, 0.679684, -0.2190247, 0.2941177, 1, 0, 1,
-0.5803934, -1.109673, -2.862658, 0.2901961, 1, 0, 1,
-0.5783377, 1.09375, -0.3390073, 0.282353, 1, 0, 1,
-0.5781149, -1.034296, -3.634805, 0.2784314, 1, 0, 1,
-0.5683748, 0.3374585, 0.8722194, 0.2705882, 1, 0, 1,
-0.563512, -1.15459, -3.570172, 0.2666667, 1, 0, 1,
-0.5622576, 0.4123559, -1.657144, 0.2588235, 1, 0, 1,
-0.5559604, -0.4346521, -1.844404, 0.254902, 1, 0, 1,
-0.5517695, -0.2559717, -3.753563, 0.2470588, 1, 0, 1,
-0.5451618, -0.6244911, -2.199857, 0.2431373, 1, 0, 1,
-0.5404781, 0.6779926, -1.454413, 0.2352941, 1, 0, 1,
-0.540283, 0.04748806, -2.062881, 0.2313726, 1, 0, 1,
-0.5356047, -1.040324, -3.321228, 0.2235294, 1, 0, 1,
-0.5302336, -1.444036, -3.998211, 0.2196078, 1, 0, 1,
-0.5272208, -0.7543265, -3.852931, 0.2117647, 1, 0, 1,
-0.5271635, 0.6786438, -1.089621, 0.2078431, 1, 0, 1,
-0.5240897, -0.5248032, -3.901462, 0.2, 1, 0, 1,
-0.5178972, -0.5454599, -2.67383, 0.1921569, 1, 0, 1,
-0.517153, 1.746821, 0.1032864, 0.1882353, 1, 0, 1,
-0.5170268, -0.03773659, -1.235303, 0.1803922, 1, 0, 1,
-0.5166273, 0.6620435, 1.118554, 0.1764706, 1, 0, 1,
-0.5143123, -0.5698867, -2.586946, 0.1686275, 1, 0, 1,
-0.5130741, -0.7598561, -1.817264, 0.1647059, 1, 0, 1,
-0.5127444, -1.336054, -2.198009, 0.1568628, 1, 0, 1,
-0.5116825, -2.55188, -3.927665, 0.1529412, 1, 0, 1,
-0.5111769, 0.2719457, 0.118403, 0.145098, 1, 0, 1,
-0.5106778, -0.3535312, -2.122059, 0.1411765, 1, 0, 1,
-0.5070554, 0.06114988, -1.342484, 0.1333333, 1, 0, 1,
-0.5061361, -0.2833011, -2.38236, 0.1294118, 1, 0, 1,
-0.5044076, -1.824864, -3.509733, 0.1215686, 1, 0, 1,
-0.5039209, -0.3998285, -2.385317, 0.1176471, 1, 0, 1,
-0.5009891, -0.2660348, -1.764751, 0.1098039, 1, 0, 1,
-0.5003459, -0.7836192, -2.091715, 0.1058824, 1, 0, 1,
-0.499951, -0.2267305, -0.6759374, 0.09803922, 1, 0, 1,
-0.4984585, -1.655433, -2.778413, 0.09019608, 1, 0, 1,
-0.4980523, 0.05039791, -0.7536038, 0.08627451, 1, 0, 1,
-0.497442, -0.3110083, -3.136064, 0.07843138, 1, 0, 1,
-0.4944355, -0.6657628, -5.152845, 0.07450981, 1, 0, 1,
-0.4927679, 0.5519113, -0.1715157, 0.06666667, 1, 0, 1,
-0.4919707, 0.1959101, -0.9444854, 0.0627451, 1, 0, 1,
-0.4915827, -1.223608, -3.240402, 0.05490196, 1, 0, 1,
-0.4853182, 1.542657, -0.07396649, 0.05098039, 1, 0, 1,
-0.471706, -0.1782617, -2.369727, 0.04313726, 1, 0, 1,
-0.4676111, -0.3224095, -3.99567, 0.03921569, 1, 0, 1,
-0.4672795, -1.723476, -0.8117831, 0.03137255, 1, 0, 1,
-0.4631737, -0.2181098, -2.077754, 0.02745098, 1, 0, 1,
-0.4544711, -0.6743008, -2.58803, 0.01960784, 1, 0, 1,
-0.4511135, 0.7752574, -2.640365, 0.01568628, 1, 0, 1,
-0.4496862, 0.3578056, -0.8349138, 0.007843138, 1, 0, 1,
-0.4481521, -1.595952, -3.669622, 0.003921569, 1, 0, 1,
-0.4369978, -0.6861654, -2.381074, 0, 1, 0.003921569, 1,
-0.4310179, 0.5458367, 0.4785124, 0, 1, 0.01176471, 1,
-0.4302041, -0.637477, -3.428502, 0, 1, 0.01568628, 1,
-0.4301423, -0.592281, -2.136682, 0, 1, 0.02352941, 1,
-0.4293019, -1.032438, -4.404285, 0, 1, 0.02745098, 1,
-0.4270255, -1.519096, -0.3137326, 0, 1, 0.03529412, 1,
-0.4251376, 0.8654113, 0.8204291, 0, 1, 0.03921569, 1,
-0.4241201, -0.04226272, -1.106209, 0, 1, 0.04705882, 1,
-0.4228931, -1.450006, -2.508274, 0, 1, 0.05098039, 1,
-0.4183897, -1.732195, -4.816256, 0, 1, 0.05882353, 1,
-0.4178773, 0.06535527, 0.1583586, 0, 1, 0.0627451, 1,
-0.4155443, -0.01122444, -3.199911, 0, 1, 0.07058824, 1,
-0.4140364, -0.9965395, -2.417304, 0, 1, 0.07450981, 1,
-0.4098583, -0.9122108, -2.339164, 0, 1, 0.08235294, 1,
-0.4086651, 0.6997239, -0.8850806, 0, 1, 0.08627451, 1,
-0.4071352, -0.7885833, -2.467608, 0, 1, 0.09411765, 1,
-0.4051925, -0.3509871, -2.603076, 0, 1, 0.1019608, 1,
-0.3981574, 0.372988, -1.177264, 0, 1, 0.1058824, 1,
-0.3949762, 0.9219789, 2.290868, 0, 1, 0.1137255, 1,
-0.3909732, -0.8374529, -2.324177, 0, 1, 0.1176471, 1,
-0.3875031, 0.6185282, 0.9689212, 0, 1, 0.1254902, 1,
-0.3825088, -0.3748159, -0.244014, 0, 1, 0.1294118, 1,
-0.380646, 0.2270955, -0.7495659, 0, 1, 0.1372549, 1,
-0.3802148, -0.3069091, -2.964158, 0, 1, 0.1411765, 1,
-0.3763077, -1.370285, -1.345699, 0, 1, 0.1490196, 1,
-0.3746551, 0.02931949, -1.733163, 0, 1, 0.1529412, 1,
-0.3717136, -3.099297, -4.003438, 0, 1, 0.1607843, 1,
-0.3705541, -0.3595232, -3.595514, 0, 1, 0.1647059, 1,
-0.369233, -1.101098, -3.330772, 0, 1, 0.172549, 1,
-0.3667454, -0.2071886, -2.444523, 0, 1, 0.1764706, 1,
-0.3622435, 0.4752843, -1.17303, 0, 1, 0.1843137, 1,
-0.3581014, -0.4906475, -1.407447, 0, 1, 0.1882353, 1,
-0.3511846, 2.843836, -1.135693, 0, 1, 0.1960784, 1,
-0.3500853, -0.8708171, -3.29347, 0, 1, 0.2039216, 1,
-0.3497907, 0.7059609, -1.366744, 0, 1, 0.2078431, 1,
-0.347637, -0.9234096, -3.310332, 0, 1, 0.2156863, 1,
-0.3429193, -0.5094901, -4.689454, 0, 1, 0.2196078, 1,
-0.3303638, 0.9173913, 0.4534889, 0, 1, 0.227451, 1,
-0.3229034, 0.889237, -0.135038, 0, 1, 0.2313726, 1,
-0.3225985, -0.07634209, -1.434916, 0, 1, 0.2392157, 1,
-0.3210495, -1.147303, -2.490252, 0, 1, 0.2431373, 1,
-0.3195268, -0.9936994, -0.8705972, 0, 1, 0.2509804, 1,
-0.31777, -0.4876474, -1.272083, 0, 1, 0.254902, 1,
-0.3079904, 1.531809, -1.231315, 0, 1, 0.2627451, 1,
-0.3063291, -1.360895, -1.716542, 0, 1, 0.2666667, 1,
-0.3048046, 0.6204662, -1.892871, 0, 1, 0.2745098, 1,
-0.3046432, -1.411302, -3.895154, 0, 1, 0.2784314, 1,
-0.3043675, -0.6297815, -2.266527, 0, 1, 0.2862745, 1,
-0.302979, 1.171713, 1.089408, 0, 1, 0.2901961, 1,
-0.3000335, -2.21373, -4.026003, 0, 1, 0.2980392, 1,
-0.2977378, -1.678627, -2.758805, 0, 1, 0.3058824, 1,
-0.2941411, -0.1547059, -1.176695, 0, 1, 0.3098039, 1,
-0.2931919, 1.172118, 1.540617, 0, 1, 0.3176471, 1,
-0.2931374, -0.2920226, -2.229895, 0, 1, 0.3215686, 1,
-0.2860996, 0.808013, -1.131916, 0, 1, 0.3294118, 1,
-0.2856355, 0.405191, 0.5387836, 0, 1, 0.3333333, 1,
-0.2850485, -0.2600651, -2.972215, 0, 1, 0.3411765, 1,
-0.2828932, -1.472321, -2.395132, 0, 1, 0.345098, 1,
-0.2811253, -0.7638983, -2.594698, 0, 1, 0.3529412, 1,
-0.2800831, 1.810364, -0.5557938, 0, 1, 0.3568628, 1,
-0.2759362, -1.157637, -4.724007, 0, 1, 0.3647059, 1,
-0.2749406, 1.02047, -0.3996389, 0, 1, 0.3686275, 1,
-0.2741689, 0.2978196, 0.3584326, 0, 1, 0.3764706, 1,
-0.2718129, 0.4468046, -0.00377053, 0, 1, 0.3803922, 1,
-0.2697506, -0.01309282, 0.8694538, 0, 1, 0.3882353, 1,
-0.2647063, 0.2586443, -1.25892, 0, 1, 0.3921569, 1,
-0.2569402, 0.5887113, 0.0002414295, 0, 1, 0.4, 1,
-0.2543898, 0.4916634, 0.6486458, 0, 1, 0.4078431, 1,
-0.2518331, -0.479945, -2.014781, 0, 1, 0.4117647, 1,
-0.2471935, -1.12879, -2.004667, 0, 1, 0.4196078, 1,
-0.2446176, 1.933306, -0.8460723, 0, 1, 0.4235294, 1,
-0.2442155, 0.3929307, 0.1681137, 0, 1, 0.4313726, 1,
-0.2428557, -0.2197668, -1.116778, 0, 1, 0.4352941, 1,
-0.2402682, -1.073799, -3.950935, 0, 1, 0.4431373, 1,
-0.2388603, -0.2066478, -1.003211, 0, 1, 0.4470588, 1,
-0.2366764, -0.4614996, -0.4790324, 0, 1, 0.454902, 1,
-0.2346104, 0.3189179, -0.3238882, 0, 1, 0.4588235, 1,
-0.2331672, -0.389328, -3.545626, 0, 1, 0.4666667, 1,
-0.231995, 0.7202345, -0.4710786, 0, 1, 0.4705882, 1,
-0.2319835, 0.2765217, -0.3693397, 0, 1, 0.4784314, 1,
-0.2264781, -0.3390907, -3.816064, 0, 1, 0.4823529, 1,
-0.2247828, 0.3067125, -1.925321, 0, 1, 0.4901961, 1,
-0.224628, -2.145298, -1.86046, 0, 1, 0.4941176, 1,
-0.2181405, 0.4350007, -0.3313514, 0, 1, 0.5019608, 1,
-0.2110881, -0.9947005, -2.57438, 0, 1, 0.509804, 1,
-0.2080166, 1.025642, 2.40399, 0, 1, 0.5137255, 1,
-0.1925722, -1.269068, -2.598202, 0, 1, 0.5215687, 1,
-0.1872514, 0.9147286, 0.1407874, 0, 1, 0.5254902, 1,
-0.1850041, -0.5060099, -2.9178, 0, 1, 0.5333334, 1,
-0.1846149, 0.529516, 0.4025892, 0, 1, 0.5372549, 1,
-0.1829311, 0.4572389, 0.1145004, 0, 1, 0.5450981, 1,
-0.1803094, 0.08685971, -1.108898, 0, 1, 0.5490196, 1,
-0.1753918, -0.0394186, -2.580546, 0, 1, 0.5568628, 1,
-0.1745612, -1.051853, -2.793656, 0, 1, 0.5607843, 1,
-0.1718794, -1.319036, -4.206535, 0, 1, 0.5686275, 1,
-0.170479, -1.003963, -0.8581613, 0, 1, 0.572549, 1,
-0.1678518, 0.6941862, -1.851141, 0, 1, 0.5803922, 1,
-0.1623452, 0.3170382, -0.8431835, 0, 1, 0.5843138, 1,
-0.1623053, -1.111896, -4.720828, 0, 1, 0.5921569, 1,
-0.1607757, 1.509149, -0.3332755, 0, 1, 0.5960785, 1,
-0.1593757, 0.3003013, -1.796959, 0, 1, 0.6039216, 1,
-0.1581302, -1.112509, -4.198174, 0, 1, 0.6117647, 1,
-0.1567814, -1.734445, -2.814232, 0, 1, 0.6156863, 1,
-0.1505623, 1.191466, -2.004469, 0, 1, 0.6235294, 1,
-0.1493669, -0.04571642, -1.787062, 0, 1, 0.627451, 1,
-0.146387, 0.02261802, -1.037756, 0, 1, 0.6352941, 1,
-0.1439453, 0.5028794, 0.9865184, 0, 1, 0.6392157, 1,
-0.1416398, -0.7328717, -5.07408, 0, 1, 0.6470588, 1,
-0.1293627, 0.04832327, -0.8617247, 0, 1, 0.6509804, 1,
-0.1243812, -0.805777, -2.935421, 0, 1, 0.6588235, 1,
-0.1229242, -1.424098, -3.418721, 0, 1, 0.6627451, 1,
-0.1202453, 0.1426225, 0.8688011, 0, 1, 0.6705883, 1,
-0.1168284, 1.802467, -1.019555, 0, 1, 0.6745098, 1,
-0.1166592, 0.04031697, -1.237129, 0, 1, 0.682353, 1,
-0.1127431, -0.5257462, -1.002952, 0, 1, 0.6862745, 1,
-0.09979013, -0.5854338, -3.4839, 0, 1, 0.6941177, 1,
-0.09872755, 0.7745424, -0.2187545, 0, 1, 0.7019608, 1,
-0.09788678, -0.5923115, -3.990543, 0, 1, 0.7058824, 1,
-0.09244324, 1.194622, 0.6097776, 0, 1, 0.7137255, 1,
-0.09054194, -0.3292945, -2.110185, 0, 1, 0.7176471, 1,
-0.08995342, 0.7941782, 0.3921095, 0, 1, 0.7254902, 1,
-0.08952773, 0.1396094, -0.6279248, 0, 1, 0.7294118, 1,
-0.08818207, 0.07139767, -1.429083, 0, 1, 0.7372549, 1,
-0.08358965, -0.5182785, -4.098028, 0, 1, 0.7411765, 1,
-0.07825166, -0.1021914, -1.886395, 0, 1, 0.7490196, 1,
-0.07182325, -0.6060373, -1.32732, 0, 1, 0.7529412, 1,
-0.07121486, 0.6963693, -0.255556, 0, 1, 0.7607843, 1,
-0.0706431, -0.1347978, -2.495843, 0, 1, 0.7647059, 1,
-0.07006878, -1.281013, -2.437815, 0, 1, 0.772549, 1,
-0.0644316, -1.156641, -2.360316, 0, 1, 0.7764706, 1,
-0.06378763, 0.3009516, 0.4188024, 0, 1, 0.7843137, 1,
-0.06273617, 0.1142763, -0.055935, 0, 1, 0.7882353, 1,
-0.06208658, -0.09447081, -3.528011, 0, 1, 0.7960784, 1,
-0.06193303, -0.1089519, -2.485165, 0, 1, 0.8039216, 1,
-0.06074594, -0.3591376, -2.71272, 0, 1, 0.8078431, 1,
-0.05562684, 0.8569857, 0.6623315, 0, 1, 0.8156863, 1,
-0.05433996, -0.2502417, -3.50824, 0, 1, 0.8196079, 1,
-0.05138132, -0.4747746, -4.52108, 0, 1, 0.827451, 1,
-0.04936384, 1.463998, 1.304799, 0, 1, 0.8313726, 1,
-0.04882343, 0.8001725, 0.1003549, 0, 1, 0.8392157, 1,
-0.04312185, -0.3047048, -3.933552, 0, 1, 0.8431373, 1,
-0.04273411, 0.2035786, -2.272794, 0, 1, 0.8509804, 1,
-0.04073132, -1.220011, -3.83667, 0, 1, 0.854902, 1,
-0.03930683, 0.379197, -1.599136, 0, 1, 0.8627451, 1,
-0.03570192, -0.03137753, -0.8104207, 0, 1, 0.8666667, 1,
-0.03494143, 0.4763311, 0.8799128, 0, 1, 0.8745098, 1,
-0.03466245, 0.02125532, -1.923452, 0, 1, 0.8784314, 1,
-0.03232727, 0.9243304, -0.3858435, 0, 1, 0.8862745, 1,
-0.02493686, 0.488207, 0.7512745, 0, 1, 0.8901961, 1,
-0.02486575, -0.06701977, -1.750584, 0, 1, 0.8980392, 1,
-0.02220846, 1.075369, -1.033891, 0, 1, 0.9058824, 1,
-0.02012928, 0.04896614, -0.6418828, 0, 1, 0.9098039, 1,
-0.01740916, -1.200464, -2.771397, 0, 1, 0.9176471, 1,
-0.01471858, 0.07043736, 0.2844073, 0, 1, 0.9215686, 1,
-0.01236978, 0.9088184, 2.385831, 0, 1, 0.9294118, 1,
-0.01196843, -0.1926776, -2.955748, 0, 1, 0.9333333, 1,
-0.01166704, 1.427351, 1.059719, 0, 1, 0.9411765, 1,
-0.01145497, -1.202085, -1.953565, 0, 1, 0.945098, 1,
-0.009978235, 0.04153114, -0.9754441, 0, 1, 0.9529412, 1,
-0.005020444, -0.7244132, -2.374368, 0, 1, 0.9568627, 1,
-0.003352105, -1.779528, -3.657012, 0, 1, 0.9647059, 1,
-0.002194504, -0.3646758, -4.523944, 0, 1, 0.9686275, 1,
-0.001949779, -0.1642749, -2.487995, 0, 1, 0.9764706, 1,
-0.000760835, -0.9011059, -4.762202, 0, 1, 0.9803922, 1,
0.001143379, -0.9760291, 1.901368, 0, 1, 0.9882353, 1,
0.003580903, 0.09027386, 0.8613026, 0, 1, 0.9921569, 1,
0.003876427, -1.004948, 2.710481, 0, 1, 1, 1,
0.005574041, 0.6002361, 0.2775233, 0, 0.9921569, 1, 1,
0.00898168, -0.5431372, 2.468965, 0, 0.9882353, 1, 1,
0.01186529, -0.1391711, 3.083129, 0, 0.9803922, 1, 1,
0.01211478, -2.132661, 3.58986, 0, 0.9764706, 1, 1,
0.01231275, 1.201422, 0.7752727, 0, 0.9686275, 1, 1,
0.01502556, 0.4141182, 0.4740222, 0, 0.9647059, 1, 1,
0.01507935, 0.5012676, -0.7256365, 0, 0.9568627, 1, 1,
0.01750313, -0.04808423, 2.214016, 0, 0.9529412, 1, 1,
0.02016193, 2.563895, -0.05661542, 0, 0.945098, 1, 1,
0.02260546, -0.4547192, 2.617703, 0, 0.9411765, 1, 1,
0.02420334, -1.17917, 3.085628, 0, 0.9333333, 1, 1,
0.02506813, 0.3197405, -0.3068748, 0, 0.9294118, 1, 1,
0.02515381, -1.079315, 1.749501, 0, 0.9215686, 1, 1,
0.02529403, 0.2439554, -0.8371091, 0, 0.9176471, 1, 1,
0.02702745, -0.6828255, 4.229716, 0, 0.9098039, 1, 1,
0.02750448, 0.8901004, -0.35539, 0, 0.9058824, 1, 1,
0.03140078, 1.606492, 0.9622659, 0, 0.8980392, 1, 1,
0.03659682, 1.676421, 1.988601, 0, 0.8901961, 1, 1,
0.03770729, -0.06770924, 1.561664, 0, 0.8862745, 1, 1,
0.04443903, -1.695368, 3.553252, 0, 0.8784314, 1, 1,
0.04588119, -0.6716416, 2.470758, 0, 0.8745098, 1, 1,
0.05375087, 1.302182, -1.357018, 0, 0.8666667, 1, 1,
0.05445735, -1.921203, 2.818566, 0, 0.8627451, 1, 1,
0.05522899, -0.3360226, 2.072156, 0, 0.854902, 1, 1,
0.05911183, -1.104337, 4.809423, 0, 0.8509804, 1, 1,
0.0621343, -1.057976, 2.879674, 0, 0.8431373, 1, 1,
0.06456774, -0.2849086, 3.336758, 0, 0.8392157, 1, 1,
0.06915051, 0.3142928, -0.8180127, 0, 0.8313726, 1, 1,
0.07198941, 1.228565, -1.327047, 0, 0.827451, 1, 1,
0.07257257, 0.3942586, 1.178515, 0, 0.8196079, 1, 1,
0.07441916, 0.2345905, 0.2564909, 0, 0.8156863, 1, 1,
0.0766924, -0.04419401, 1.326838, 0, 0.8078431, 1, 1,
0.08071335, 1.643203, -0.4032056, 0, 0.8039216, 1, 1,
0.08705784, 1.251131, -0.3696653, 0, 0.7960784, 1, 1,
0.09297639, -0.7447756, 3.016044, 0, 0.7882353, 1, 1,
0.0960307, 0.5848884, -0.6615451, 0, 0.7843137, 1, 1,
0.1001121, 0.4343189, -0.3571654, 0, 0.7764706, 1, 1,
0.100926, -0.4836346, 1.601739, 0, 0.772549, 1, 1,
0.1013216, -0.247273, 2.117588, 0, 0.7647059, 1, 1,
0.1070201, -0.4821011, 1.411458, 0, 0.7607843, 1, 1,
0.1095154, -0.05894757, 2.028814, 0, 0.7529412, 1, 1,
0.1152181, -0.2772192, 1.434663, 0, 0.7490196, 1, 1,
0.1154722, -0.361311, 3.398973, 0, 0.7411765, 1, 1,
0.1253145, -1.769749, 3.32793, 0, 0.7372549, 1, 1,
0.127335, -1.841137, 3.288141, 0, 0.7294118, 1, 1,
0.1286095, 1.674954, -1.512394, 0, 0.7254902, 1, 1,
0.1312912, 1.587417, -0.3225049, 0, 0.7176471, 1, 1,
0.1348563, -2.045026, 1.345134, 0, 0.7137255, 1, 1,
0.1349044, -0.4895098, 3.310806, 0, 0.7058824, 1, 1,
0.1355133, -0.8490175, 2.56583, 0, 0.6980392, 1, 1,
0.1392612, -1.101689, 2.917726, 0, 0.6941177, 1, 1,
0.1423013, -0.1224285, 0.9501762, 0, 0.6862745, 1, 1,
0.1439601, -0.4518623, 3.727442, 0, 0.682353, 1, 1,
0.1453853, -0.1135124, 2.212091, 0, 0.6745098, 1, 1,
0.1509533, 0.04284322, 1.647525, 0, 0.6705883, 1, 1,
0.1533182, -0.8428777, 4.573251, 0, 0.6627451, 1, 1,
0.1536521, 0.5681812, 0.5143969, 0, 0.6588235, 1, 1,
0.154803, 0.2575317, -0.08076191, 0, 0.6509804, 1, 1,
0.1551143, -0.6766292, 3.679856, 0, 0.6470588, 1, 1,
0.156443, 0.08100349, 1.352592, 0, 0.6392157, 1, 1,
0.1655164, 0.02368579, 2.403237, 0, 0.6352941, 1, 1,
0.1681635, 1.533228, 0.2096703, 0, 0.627451, 1, 1,
0.1712685, 1.537837, -1.04681, 0, 0.6235294, 1, 1,
0.17205, -0.1151782, 2.290145, 0, 0.6156863, 1, 1,
0.1736246, 0.6296893, 1.864071, 0, 0.6117647, 1, 1,
0.1737901, -0.2175736, 2.974753, 0, 0.6039216, 1, 1,
0.1747406, -0.07288857, 0.8841698, 0, 0.5960785, 1, 1,
0.1761333, -0.4344582, 3.071487, 0, 0.5921569, 1, 1,
0.1812842, -0.8115745, 1.956109, 0, 0.5843138, 1, 1,
0.1832714, 0.5103073, 2.121145, 0, 0.5803922, 1, 1,
0.1842349, -0.4270669, 1.855288, 0, 0.572549, 1, 1,
0.1873559, -0.5925, 2.854089, 0, 0.5686275, 1, 1,
0.1891062, 0.4065762, -0.1370009, 0, 0.5607843, 1, 1,
0.1901439, 0.4191859, 0.1723433, 0, 0.5568628, 1, 1,
0.190442, 1.895451, 0.3488609, 0, 0.5490196, 1, 1,
0.2003646, 0.7736257, -0.3295361, 0, 0.5450981, 1, 1,
0.2030828, -0.1719635, 2.306644, 0, 0.5372549, 1, 1,
0.2057818, -0.3060938, 1.279922, 0, 0.5333334, 1, 1,
0.2157881, -0.103462, 0.4925408, 0, 0.5254902, 1, 1,
0.2164048, 0.3363317, 1.289557, 0, 0.5215687, 1, 1,
0.2209498, -0.2183475, 1.533671, 0, 0.5137255, 1, 1,
0.2218241, 1.039288, 0.5092987, 0, 0.509804, 1, 1,
0.2228662, -0.0850723, 1.539756, 0, 0.5019608, 1, 1,
0.2236968, 2.02807, -0.5049123, 0, 0.4941176, 1, 1,
0.2240831, -0.05650299, 1.235605, 0, 0.4901961, 1, 1,
0.2279985, 0.4989464, 0.4070562, 0, 0.4823529, 1, 1,
0.2286287, -0.09037302, 2.02341, 0, 0.4784314, 1, 1,
0.2400922, -1.255044, 4.053444, 0, 0.4705882, 1, 1,
0.2420951, -1.104173, 1.530997, 0, 0.4666667, 1, 1,
0.2429327, 0.4617718, 0.161275, 0, 0.4588235, 1, 1,
0.2462332, -0.06647112, 2.134988, 0, 0.454902, 1, 1,
0.2477885, -1.501991, 3.345309, 0, 0.4470588, 1, 1,
0.2492289, 0.316655, 1.516353, 0, 0.4431373, 1, 1,
0.2500711, -0.4341249, 2.901397, 0, 0.4352941, 1, 1,
0.2525955, -0.1311409, 1.148664, 0, 0.4313726, 1, 1,
0.2537183, -0.8338728, 3.214853, 0, 0.4235294, 1, 1,
0.2553891, 0.5156262, -0.4112723, 0, 0.4196078, 1, 1,
0.2582131, 0.09531936, 0.7249788, 0, 0.4117647, 1, 1,
0.2583612, 0.5419912, 0.4520862, 0, 0.4078431, 1, 1,
0.2587596, -2.242207, 2.355832, 0, 0.4, 1, 1,
0.2662759, 1.98127, 0.07753491, 0, 0.3921569, 1, 1,
0.2669757, -2.740022, 2.14971, 0, 0.3882353, 1, 1,
0.2672344, 1.718714, -0.7840201, 0, 0.3803922, 1, 1,
0.267811, -0.2413563, 1.682832, 0, 0.3764706, 1, 1,
0.2685539, 0.505422, 0.9701259, 0, 0.3686275, 1, 1,
0.2688356, -1.230302, 1.49017, 0, 0.3647059, 1, 1,
0.2692288, 0.5258288, 0.1793915, 0, 0.3568628, 1, 1,
0.2705051, 0.01980029, 1.252375, 0, 0.3529412, 1, 1,
0.2752403, -0.07300527, 1.063071, 0, 0.345098, 1, 1,
0.2797464, -0.3892735, 4.201692, 0, 0.3411765, 1, 1,
0.2816017, -1.05424, 3.139803, 0, 0.3333333, 1, 1,
0.2855518, 0.4169126, -0.6025918, 0, 0.3294118, 1, 1,
0.2877127, 0.02185504, 0.212845, 0, 0.3215686, 1, 1,
0.2898311, -0.4601424, 2.863769, 0, 0.3176471, 1, 1,
0.2910518, 1.166978, 1.314535, 0, 0.3098039, 1, 1,
0.2912315, -0.7464337, 2.823416, 0, 0.3058824, 1, 1,
0.2927775, 0.5748951, -0.2954149, 0, 0.2980392, 1, 1,
0.2935656, 0.923046, 0.4226563, 0, 0.2901961, 1, 1,
0.2951475, -1.200143, 1.637861, 0, 0.2862745, 1, 1,
0.295545, -1.106791, 4.237195, 0, 0.2784314, 1, 1,
0.3020807, 0.6949579, 1.270781, 0, 0.2745098, 1, 1,
0.3060111, 0.3263309, 2.620728, 0, 0.2666667, 1, 1,
0.3060383, 0.4807147, 0.5200711, 0, 0.2627451, 1, 1,
0.3169839, 0.4328391, -0.4754812, 0, 0.254902, 1, 1,
0.3169839, -1.491654, 1.417702, 0, 0.2509804, 1, 1,
0.321937, 0.09039042, 1.407454, 0, 0.2431373, 1, 1,
0.3231788, -2.031173, 4.747636, 0, 0.2392157, 1, 1,
0.3284226, 0.3104659, 2.544858, 0, 0.2313726, 1, 1,
0.3318307, -0.4950869, 3.097625, 0, 0.227451, 1, 1,
0.3330131, -0.5733253, 2.632619, 0, 0.2196078, 1, 1,
0.3350438, -0.5061412, 2.780112, 0, 0.2156863, 1, 1,
0.3373252, -0.9415396, 5.834426, 0, 0.2078431, 1, 1,
0.3377389, 2.023608, 1.573996, 0, 0.2039216, 1, 1,
0.3394245, -0.3134272, 1.649989, 0, 0.1960784, 1, 1,
0.3395941, 0.6325136, 1.558066, 0, 0.1882353, 1, 1,
0.3409566, 0.3846541, 1.460642, 0, 0.1843137, 1, 1,
0.3420512, 0.9738442, -0.1150368, 0, 0.1764706, 1, 1,
0.3437201, -0.7557239, 2.198985, 0, 0.172549, 1, 1,
0.3464791, 0.7941743, 1.024759, 0, 0.1647059, 1, 1,
0.3486112, -0.5699381, 4.279445, 0, 0.1607843, 1, 1,
0.3528488, 0.6294857, 0.6531541, 0, 0.1529412, 1, 1,
0.3579597, -1.023823, 4.5946, 0, 0.1490196, 1, 1,
0.3594107, -0.8913935, 2.582404, 0, 0.1411765, 1, 1,
0.3602808, -0.238561, 3.309673, 0, 0.1372549, 1, 1,
0.3631686, -1.778229, 2.407725, 0, 0.1294118, 1, 1,
0.3685771, 0.2008519, 2.314515, 0, 0.1254902, 1, 1,
0.3715986, 0.1805003, 0.1063317, 0, 0.1176471, 1, 1,
0.3723282, -1.637971, 2.779426, 0, 0.1137255, 1, 1,
0.3859251, -0.5012078, 4.36364, 0, 0.1058824, 1, 1,
0.3952081, -1.742694, 4.794066, 0, 0.09803922, 1, 1,
0.4000129, -0.1282951, 3.652204, 0, 0.09411765, 1, 1,
0.4006166, 0.4851818, 2.092155, 0, 0.08627451, 1, 1,
0.4035843, -0.6050212, 3.888623, 0, 0.08235294, 1, 1,
0.4043454, 0.1116517, 0.2888945, 0, 0.07450981, 1, 1,
0.4056367, -0.04918595, 1.928176, 0, 0.07058824, 1, 1,
0.4100704, 0.6621436, -0.6092803, 0, 0.0627451, 1, 1,
0.4116369, -0.3134762, 4.135296, 0, 0.05882353, 1, 1,
0.4129516, -0.08942631, 2.452074, 0, 0.05098039, 1, 1,
0.4162028, 0.5072705, 0.5890116, 0, 0.04705882, 1, 1,
0.4167256, 0.7067184, -0.581679, 0, 0.03921569, 1, 1,
0.4186637, -1.551884, 3.286685, 0, 0.03529412, 1, 1,
0.4234243, 0.5255523, 0.3416542, 0, 0.02745098, 1, 1,
0.4238566, -3.131708, 2.052368, 0, 0.02352941, 1, 1,
0.4241562, 0.2715842, 0.4849558, 0, 0.01568628, 1, 1,
0.4243094, -1.143722, 2.951245, 0, 0.01176471, 1, 1,
0.4250684, -0.4957068, 1.958018, 0, 0.003921569, 1, 1,
0.4291593, 0.120674, -0.4907998, 0.003921569, 0, 1, 1,
0.4310783, 0.2924988, 0.6049492, 0.007843138, 0, 1, 1,
0.4313939, 1.047002, -2.250552, 0.01568628, 0, 1, 1,
0.4319967, 0.217239, -0.1221058, 0.01960784, 0, 1, 1,
0.4364077, -1.185664, 1.968812, 0.02745098, 0, 1, 1,
0.4394462, -0.9295607, 2.530883, 0.03137255, 0, 1, 1,
0.4413119, -0.02629473, 1.754498, 0.03921569, 0, 1, 1,
0.4416133, -0.3843582, 2.076341, 0.04313726, 0, 1, 1,
0.4425455, -1.740806, 2.361471, 0.05098039, 0, 1, 1,
0.4435636, -0.1207694, 3.188884, 0.05490196, 0, 1, 1,
0.444786, -1.044694, 3.078081, 0.0627451, 0, 1, 1,
0.453509, -0.3257857, 2.461244, 0.06666667, 0, 1, 1,
0.4562454, 0.6796873, 0.5267919, 0.07450981, 0, 1, 1,
0.4599399, 2.055024, 0.7030187, 0.07843138, 0, 1, 1,
0.4613679, 0.5360444, -0.3102555, 0.08627451, 0, 1, 1,
0.4660815, -1.082319, 2.065769, 0.09019608, 0, 1, 1,
0.4687136, 2.271387, 0.4368616, 0.09803922, 0, 1, 1,
0.474253, -0.2329203, 2.424741, 0.1058824, 0, 1, 1,
0.474541, -0.05386403, 2.898267, 0.1098039, 0, 1, 1,
0.4776312, -0.4727724, 1.173757, 0.1176471, 0, 1, 1,
0.4797034, 1.771744, 0.2145894, 0.1215686, 0, 1, 1,
0.4803724, 0.593844, 2.236343, 0.1294118, 0, 1, 1,
0.4836366, -0.3485345, 1.757953, 0.1333333, 0, 1, 1,
0.4837614, 1.270197, -0.04026762, 0.1411765, 0, 1, 1,
0.4840673, 0.172523, 1.065805, 0.145098, 0, 1, 1,
0.4854839, 0.08315352, 2.078304, 0.1529412, 0, 1, 1,
0.4907639, 0.6580812, -0.5162938, 0.1568628, 0, 1, 1,
0.4909945, -0.9166111, 2.269854, 0.1647059, 0, 1, 1,
0.4941736, -0.2623071, 0.9330109, 0.1686275, 0, 1, 1,
0.4944825, -0.8138285, 1.7762, 0.1764706, 0, 1, 1,
0.5003387, -0.1780256, 2.998992, 0.1803922, 0, 1, 1,
0.5016805, -0.3311553, 1.686665, 0.1882353, 0, 1, 1,
0.5024219, 1.900755, -0.411127, 0.1921569, 0, 1, 1,
0.5036511, -0.604811, 3.211249, 0.2, 0, 1, 1,
0.505486, 0.3350791, 1.804323, 0.2078431, 0, 1, 1,
0.508903, -1.627531, 2.221031, 0.2117647, 0, 1, 1,
0.5104557, -0.9337872, 3.14648, 0.2196078, 0, 1, 1,
0.5113548, 1.174318, 0.6230742, 0.2235294, 0, 1, 1,
0.5155499, -0.4146236, 0.6005158, 0.2313726, 0, 1, 1,
0.5258402, -1.16335, 1.24392, 0.2352941, 0, 1, 1,
0.5289904, 0.3152274, 1.303299, 0.2431373, 0, 1, 1,
0.5294443, 0.2167879, -1.184204, 0.2470588, 0, 1, 1,
0.531069, 1.383884, -1.730267, 0.254902, 0, 1, 1,
0.5378605, 1.274017, -0.1097327, 0.2588235, 0, 1, 1,
0.5396759, 0.864215, 0.5767556, 0.2666667, 0, 1, 1,
0.5409079, 0.7255156, 0.7339802, 0.2705882, 0, 1, 1,
0.5413085, 0.2013786, 0.07301856, 0.2784314, 0, 1, 1,
0.543626, -1.195988, 3.137191, 0.282353, 0, 1, 1,
0.5444002, -1.128567, 2.745343, 0.2901961, 0, 1, 1,
0.5480214, 0.4279467, 1.962105, 0.2941177, 0, 1, 1,
0.5538139, -1.954465, 2.739434, 0.3019608, 0, 1, 1,
0.5541381, 0.7684356, -0.3818322, 0.3098039, 0, 1, 1,
0.5545702, 0.4697184, 0.2145659, 0.3137255, 0, 1, 1,
0.5582467, 0.1363342, 0.5491223, 0.3215686, 0, 1, 1,
0.5590463, 2.048881, 0.8071512, 0.3254902, 0, 1, 1,
0.5633622, 0.8294615, -0.3901641, 0.3333333, 0, 1, 1,
0.5637668, -0.8578896, 3.182337, 0.3372549, 0, 1, 1,
0.5664675, 1.282459, -0.8712242, 0.345098, 0, 1, 1,
0.5666276, 0.6498492, -0.9202573, 0.3490196, 0, 1, 1,
0.5730109, -0.8347437, 4.190946, 0.3568628, 0, 1, 1,
0.5731097, -0.9624906, 3.103781, 0.3607843, 0, 1, 1,
0.5778019, -0.3722427, 0.8285614, 0.3686275, 0, 1, 1,
0.5787651, 0.4707201, 1.018651, 0.372549, 0, 1, 1,
0.5870779, -0.4217122, 1.796377, 0.3803922, 0, 1, 1,
0.5891225, -0.8657611, 3.332891, 0.3843137, 0, 1, 1,
0.5952538, -0.1217917, 0.3747768, 0.3921569, 0, 1, 1,
0.6035607, -0.8228372, 4.890135, 0.3960784, 0, 1, 1,
0.6058105, 0.6692992, -0.1926834, 0.4039216, 0, 1, 1,
0.6181369, 0.4532843, -0.36038, 0.4117647, 0, 1, 1,
0.6215159, 1.283205, -0.548353, 0.4156863, 0, 1, 1,
0.6215814, 1.28858, 1.140405, 0.4235294, 0, 1, 1,
0.6218156, -0.7105727, 2.178442, 0.427451, 0, 1, 1,
0.6265831, -0.9584645, 2.044849, 0.4352941, 0, 1, 1,
0.630259, -0.2250623, 1.521535, 0.4392157, 0, 1, 1,
0.6325767, 1.485837, 0.7781475, 0.4470588, 0, 1, 1,
0.6385184, -0.7544585, 1.338649, 0.4509804, 0, 1, 1,
0.6407286, -0.5545186, 1.527514, 0.4588235, 0, 1, 1,
0.6463243, -1.284759, 2.745708, 0.4627451, 0, 1, 1,
0.6475347, -0.006762159, 3.459708, 0.4705882, 0, 1, 1,
0.6481242, 0.8120101, 0.82451, 0.4745098, 0, 1, 1,
0.6570404, 0.1312822, -0.3997661, 0.4823529, 0, 1, 1,
0.6596573, -1.344403, 2.036869, 0.4862745, 0, 1, 1,
0.6643348, -0.5185037, 2.801749, 0.4941176, 0, 1, 1,
0.6657016, -0.08955394, 1.000229, 0.5019608, 0, 1, 1,
0.6676662, 1.565566, -2.867107, 0.5058824, 0, 1, 1,
0.6691791, 0.192069, -1.436394, 0.5137255, 0, 1, 1,
0.6715183, -1.228366, 4.403917, 0.5176471, 0, 1, 1,
0.6723723, -1.089473, 2.615601, 0.5254902, 0, 1, 1,
0.6799827, 0.04745478, 0.8688483, 0.5294118, 0, 1, 1,
0.6814249, 0.9291084, 0.4989333, 0.5372549, 0, 1, 1,
0.6852451, 1.249203, 1.541623, 0.5411765, 0, 1, 1,
0.6855959, 0.6485841, 2.216447, 0.5490196, 0, 1, 1,
0.6856647, -0.750399, 2.661312, 0.5529412, 0, 1, 1,
0.6861441, -1.340298, 2.320992, 0.5607843, 0, 1, 1,
0.6883349, -0.29362, 0.180837, 0.5647059, 0, 1, 1,
0.6884931, -0.869525, 0.9889495, 0.572549, 0, 1, 1,
0.6896126, 0.113798, 0.0392166, 0.5764706, 0, 1, 1,
0.7003059, 0.9175094, 0.7266672, 0.5843138, 0, 1, 1,
0.7061934, -0.4431458, 1.257723, 0.5882353, 0, 1, 1,
0.7066075, -0.8596127, 2.997589, 0.5960785, 0, 1, 1,
0.7072237, 0.2862336, 1.969901, 0.6039216, 0, 1, 1,
0.7130159, 0.6611893, 0.3836673, 0.6078432, 0, 1, 1,
0.7142381, -1.265018, 2.491964, 0.6156863, 0, 1, 1,
0.7168349, -0.2009931, 2.799761, 0.6196079, 0, 1, 1,
0.7190124, -0.04245293, -0.2873553, 0.627451, 0, 1, 1,
0.7220959, -1.213932, 2.402304, 0.6313726, 0, 1, 1,
0.7260555, 0.3083529, 2.213287, 0.6392157, 0, 1, 1,
0.7281644, -0.603575, 2.207854, 0.6431373, 0, 1, 1,
0.7383869, -0.3135841, 2.061119, 0.6509804, 0, 1, 1,
0.739319, 0.06551824, 2.147166, 0.654902, 0, 1, 1,
0.7412858, 3.684189, -0.9301003, 0.6627451, 0, 1, 1,
0.7428119, 0.2597294, 2.125041, 0.6666667, 0, 1, 1,
0.7449681, -1.413509, 3.357917, 0.6745098, 0, 1, 1,
0.7455357, 1.661845, 0.09410287, 0.6784314, 0, 1, 1,
0.7493271, 2.141693, 0.3004121, 0.6862745, 0, 1, 1,
0.7503813, 0.2519878, 1.77996, 0.6901961, 0, 1, 1,
0.7585672, -1.362916, 4.320389, 0.6980392, 0, 1, 1,
0.7674373, -0.2282686, 0.04994627, 0.7058824, 0, 1, 1,
0.7775109, 0.3604953, -0.1716687, 0.7098039, 0, 1, 1,
0.7783505, 0.9225852, 1.433484, 0.7176471, 0, 1, 1,
0.7842174, -0.3616178, 0.9415167, 0.7215686, 0, 1, 1,
0.7878221, -1.060989, 1.621014, 0.7294118, 0, 1, 1,
0.7894408, 0.9761515, 1.217613, 0.7333333, 0, 1, 1,
0.791698, 1.359591, 1.40633, 0.7411765, 0, 1, 1,
0.792789, -0.4228803, 1.260332, 0.7450981, 0, 1, 1,
0.7980944, -2.245112, 2.419768, 0.7529412, 0, 1, 1,
0.8007988, -1.052862, 4.427406, 0.7568628, 0, 1, 1,
0.8094421, 0.9229488, 0.8770413, 0.7647059, 0, 1, 1,
0.8110157, -0.4275175, 1.285292, 0.7686275, 0, 1, 1,
0.8132188, 1.301496, 1.119873, 0.7764706, 0, 1, 1,
0.8177722, -0.4069201, -1.020552, 0.7803922, 0, 1, 1,
0.8188091, 1.185873, 1.039692, 0.7882353, 0, 1, 1,
0.8206858, -1.094703, 0.6412579, 0.7921569, 0, 1, 1,
0.8264073, -0.9347801, 1.408038, 0.8, 0, 1, 1,
0.8278741, 0.2248781, 3.609162, 0.8078431, 0, 1, 1,
0.831066, -1.52025, 2.842156, 0.8117647, 0, 1, 1,
0.8412328, 1.972384, 0.9216403, 0.8196079, 0, 1, 1,
0.8427833, 0.03604433, 2.295004, 0.8235294, 0, 1, 1,
0.8435894, 0.0827226, 2.820554, 0.8313726, 0, 1, 1,
0.8482253, 0.5661256, 0.2349741, 0.8352941, 0, 1, 1,
0.848335, -0.8637507, 3.052428, 0.8431373, 0, 1, 1,
0.848912, 0.3751656, 0.5406964, 0.8470588, 0, 1, 1,
0.8557667, -0.8123239, 2.579879, 0.854902, 0, 1, 1,
0.8598473, 0.3950306, 1.31998, 0.8588235, 0, 1, 1,
0.8605058, -0.7685732, 0.1661181, 0.8666667, 0, 1, 1,
0.8611475, 0.142859, 2.301667, 0.8705882, 0, 1, 1,
0.8712025, 0.4957637, 1.364764, 0.8784314, 0, 1, 1,
0.8728316, 2.602394, -0.1503164, 0.8823529, 0, 1, 1,
0.8858285, 1.067793, 1.644482, 0.8901961, 0, 1, 1,
0.8999552, 2.185399, 1.54839, 0.8941177, 0, 1, 1,
0.9001094, 0.08520376, 1.285876, 0.9019608, 0, 1, 1,
0.9008238, -0.8003643, 2.605941, 0.9098039, 0, 1, 1,
0.9053106, -1.071805, 3.027186, 0.9137255, 0, 1, 1,
0.9179707, 0.8076119, -0.4883173, 0.9215686, 0, 1, 1,
0.9217448, 0.3342805, 1.649057, 0.9254902, 0, 1, 1,
0.9242086, 0.4032607, 1.76344, 0.9333333, 0, 1, 1,
0.9307734, 0.149531, 2.018207, 0.9372549, 0, 1, 1,
0.9311332, -1.290176, 0.7255922, 0.945098, 0, 1, 1,
0.9363843, -0.3822697, 1.945178, 0.9490196, 0, 1, 1,
0.9420194, 0.912271, -0.3896282, 0.9568627, 0, 1, 1,
0.9473804, -0.5565891, 3.2564, 0.9607843, 0, 1, 1,
0.9519088, -0.1665623, 1.001917, 0.9686275, 0, 1, 1,
0.9558187, -0.634131, 2.762868, 0.972549, 0, 1, 1,
0.9601337, -0.06478275, 2.008033, 0.9803922, 0, 1, 1,
0.9696823, 0.5331597, 1.849068, 0.9843137, 0, 1, 1,
0.9708443, 0.3446505, 0.5429724, 0.9921569, 0, 1, 1,
0.9977837, -1.122068, 1.703182, 0.9960784, 0, 1, 1,
1.011398, -1.53171, 2.276908, 1, 0, 0.9960784, 1,
1.015848, -0.9746252, 3.104738, 1, 0, 0.9882353, 1,
1.02059, -0.3397493, 2.126836, 1, 0, 0.9843137, 1,
1.022755, -0.1570604, 0.7402703, 1, 0, 0.9764706, 1,
1.033449, 1.067125, 1.28959, 1, 0, 0.972549, 1,
1.038628, -0.6121528, 2.394164, 1, 0, 0.9647059, 1,
1.041741, 0.7333143, 1.145321, 1, 0, 0.9607843, 1,
1.042697, -1.60691, 2.83359, 1, 0, 0.9529412, 1,
1.043334, 0.09577572, 1.352903, 1, 0, 0.9490196, 1,
1.059306, -0.2525992, 1.376806, 1, 0, 0.9411765, 1,
1.060131, 0.2487154, 1.730466, 1, 0, 0.9372549, 1,
1.062111, 0.5058921, 1.983946, 1, 0, 0.9294118, 1,
1.062806, 1.623703, -0.6904285, 1, 0, 0.9254902, 1,
1.065846, -0.4981831, 1.348946, 1, 0, 0.9176471, 1,
1.070311, 0.04938543, 1.727453, 1, 0, 0.9137255, 1,
1.073593, 0.2490748, 0.8522586, 1, 0, 0.9058824, 1,
1.075199, -1.08294, 1.081843, 1, 0, 0.9019608, 1,
1.077639, 1.677283, 0.6272898, 1, 0, 0.8941177, 1,
1.080089, 0.157875, 2.223099, 1, 0, 0.8862745, 1,
1.081275, -0.4799446, 1.377941, 1, 0, 0.8823529, 1,
1.084545, -0.3229793, 2.206982, 1, 0, 0.8745098, 1,
1.084788, -1.369109, 3.12501, 1, 0, 0.8705882, 1,
1.086653, -0.03044707, 2.373017, 1, 0, 0.8627451, 1,
1.090582, -0.4726518, 2.699553, 1, 0, 0.8588235, 1,
1.091236, -0.6833099, 1.896501, 1, 0, 0.8509804, 1,
1.101155, -0.1606134, 2.333795, 1, 0, 0.8470588, 1,
1.111408, 0.9633012, -0.2807111, 1, 0, 0.8392157, 1,
1.115365, -0.1066822, 0.1662701, 1, 0, 0.8352941, 1,
1.121309, -1.490553, 4.135377, 1, 0, 0.827451, 1,
1.127305, 0.3002851, 1.26885, 1, 0, 0.8235294, 1,
1.129485, -1.612111, 1.533763, 1, 0, 0.8156863, 1,
1.138564, -2.022486, 2.76659, 1, 0, 0.8117647, 1,
1.152646, -3.515993, 0.8015812, 1, 0, 0.8039216, 1,
1.157606, -1.112596, 3.020019, 1, 0, 0.7960784, 1,
1.158152, -0.2727869, 2.155409, 1, 0, 0.7921569, 1,
1.158383, -0.7464716, 2.689521, 1, 0, 0.7843137, 1,
1.161759, -1.650519, 3.567412, 1, 0, 0.7803922, 1,
1.162351, -0.2266455, 1.044916, 1, 0, 0.772549, 1,
1.176489, -1.747395, 1.106461, 1, 0, 0.7686275, 1,
1.179183, 0.5785135, 0.1839993, 1, 0, 0.7607843, 1,
1.181587, -0.552139, 2.79224, 1, 0, 0.7568628, 1,
1.188885, 1.49549, 0.8282868, 1, 0, 0.7490196, 1,
1.199739, 0.4540438, 1.455252, 1, 0, 0.7450981, 1,
1.200986, 0.2419062, -0.4156454, 1, 0, 0.7372549, 1,
1.201209, 0.3065193, 1.126859, 1, 0, 0.7333333, 1,
1.206583, 1.277738, 1.274444, 1, 0, 0.7254902, 1,
1.210897, -0.6051065, 2.997708, 1, 0, 0.7215686, 1,
1.226474, -0.0201295, 2.296027, 1, 0, 0.7137255, 1,
1.229675, -0.9030058, 1.407171, 1, 0, 0.7098039, 1,
1.230387, 0.3691011, 0.6110386, 1, 0, 0.7019608, 1,
1.235093, 0.06726475, 3.570676, 1, 0, 0.6941177, 1,
1.242192, -2.037811, 3.002667, 1, 0, 0.6901961, 1,
1.247682, -0.8828953, 1.468058, 1, 0, 0.682353, 1,
1.248307, 0.5236279, 0.5757402, 1, 0, 0.6784314, 1,
1.250756, -0.5281289, 2.621636, 1, 0, 0.6705883, 1,
1.256018, 0.5454558, 0.7417359, 1, 0, 0.6666667, 1,
1.265043, -0.4446261, 2.219026, 1, 0, 0.6588235, 1,
1.270793, 0.2457341, 0.3178314, 1, 0, 0.654902, 1,
1.273087, 0.8982103, 1.768645, 1, 0, 0.6470588, 1,
1.280034, -0.7184401, 1.178767, 1, 0, 0.6431373, 1,
1.29603, -0.376214, 2.996697, 1, 0, 0.6352941, 1,
1.297458, 0.556959, 1.539366, 1, 0, 0.6313726, 1,
1.298275, 0.2026941, 1.995759, 1, 0, 0.6235294, 1,
1.313271, 2.121344, 0.4853301, 1, 0, 0.6196079, 1,
1.324314, -1.737319, 2.750193, 1, 0, 0.6117647, 1,
1.333382, -0.4420945, 3.13129, 1, 0, 0.6078432, 1,
1.341293, 0.0610478, 1.7238, 1, 0, 0.6, 1,
1.35052, -0.3708566, 3.501398, 1, 0, 0.5921569, 1,
1.359504, 0.7837844, 3.0657, 1, 0, 0.5882353, 1,
1.362462, -2.2573, 2.203151, 1, 0, 0.5803922, 1,
1.367661, 0.4805206, 1.237622, 1, 0, 0.5764706, 1,
1.369564, 0.6545287, -0.8030818, 1, 0, 0.5686275, 1,
1.373502, 0.2276736, 2.190847, 1, 0, 0.5647059, 1,
1.385857, 0.9658298, 2.871814, 1, 0, 0.5568628, 1,
1.396335, -0.5678179, 2.354035, 1, 0, 0.5529412, 1,
1.397712, -1.00515, 3.178781, 1, 0, 0.5450981, 1,
1.40889, -0.6695533, 3.232014, 1, 0, 0.5411765, 1,
1.411269, 1.35859, -1.088174, 1, 0, 0.5333334, 1,
1.415275, 0.2007072, 1.99997, 1, 0, 0.5294118, 1,
1.416883, -0.278913, 1.69227, 1, 0, 0.5215687, 1,
1.417013, 0.5137116, 0.9763061, 1, 0, 0.5176471, 1,
1.41859, -1.642052, 2.92069, 1, 0, 0.509804, 1,
1.425517, 1.067768, 1.011502, 1, 0, 0.5058824, 1,
1.434584, -0.07028975, 1.636082, 1, 0, 0.4980392, 1,
1.446855, -0.1938086, 2.446409, 1, 0, 0.4901961, 1,
1.457183, 0.008053024, 1.937027, 1, 0, 0.4862745, 1,
1.457618, 0.2241045, 0.04505113, 1, 0, 0.4784314, 1,
1.468481, -0.6011526, 2.480783, 1, 0, 0.4745098, 1,
1.475518, -1.313007, 3.144617, 1, 0, 0.4666667, 1,
1.477543, 2.449381, 0.02031394, 1, 0, 0.4627451, 1,
1.478835, -0.7580804, 0.9434292, 1, 0, 0.454902, 1,
1.486034, -1.917501, 2.550641, 1, 0, 0.4509804, 1,
1.498407, 0.6722328, 0.1384264, 1, 0, 0.4431373, 1,
1.505995, -1.873197, 1.251041, 1, 0, 0.4392157, 1,
1.523611, 0.1806621, 2.381027, 1, 0, 0.4313726, 1,
1.525444, -0.5980485, 2.754648, 1, 0, 0.427451, 1,
1.536628, 0.3157203, 1.076698, 1, 0, 0.4196078, 1,
1.538818, -1.955957, 3.741352, 1, 0, 0.4156863, 1,
1.543003, -1.405298, 0.7397293, 1, 0, 0.4078431, 1,
1.544607, -0.6953301, 0.4014315, 1, 0, 0.4039216, 1,
1.547071, 1.674854, 1.241487, 1, 0, 0.3960784, 1,
1.566779, 1.306968, 0.2812105, 1, 0, 0.3882353, 1,
1.570292, 0.2059967, 1.068933, 1, 0, 0.3843137, 1,
1.571385, 0.5538649, 1.409381, 1, 0, 0.3764706, 1,
1.573042, 0.3156372, 2.034621, 1, 0, 0.372549, 1,
1.574288, -1.792308, 3.942908, 1, 0, 0.3647059, 1,
1.577425, -0.2056588, 1.873217, 1, 0, 0.3607843, 1,
1.581008, -0.5052196, 2.376232, 1, 0, 0.3529412, 1,
1.581525, 1.420225, 0.9404797, 1, 0, 0.3490196, 1,
1.585665, -0.1871923, 0.3651863, 1, 0, 0.3411765, 1,
1.587393, -1.084944, 1.98262, 1, 0, 0.3372549, 1,
1.58748, -0.9481758, 2.299909, 1, 0, 0.3294118, 1,
1.602441, 0.8101617, -0.2481731, 1, 0, 0.3254902, 1,
1.612024, -1.067433, 1.545665, 1, 0, 0.3176471, 1,
1.63614, -0.08710986, 3.493675, 1, 0, 0.3137255, 1,
1.637257, -0.3328665, 1.526838, 1, 0, 0.3058824, 1,
1.651971, 0.02948181, 1.152192, 1, 0, 0.2980392, 1,
1.653442, 0.1341808, 0.9706108, 1, 0, 0.2941177, 1,
1.665235, 1.474577, 0.5704655, 1, 0, 0.2862745, 1,
1.681141, -0.3901103, 1.239631, 1, 0, 0.282353, 1,
1.70937, -0.6244074, 0.1014891, 1, 0, 0.2745098, 1,
1.710995, 0.3651121, 2.883477, 1, 0, 0.2705882, 1,
1.734793, 0.2314847, 1.765892, 1, 0, 0.2627451, 1,
1.736575, -0.5404695, 2.776852, 1, 0, 0.2588235, 1,
1.751982, 0.9605731, 0.770557, 1, 0, 0.2509804, 1,
1.757858, 0.1301221, 1.16676, 1, 0, 0.2470588, 1,
1.761557, 0.4096901, 0.2316294, 1, 0, 0.2392157, 1,
1.768938, 1.007766, -0.06605085, 1, 0, 0.2352941, 1,
1.771503, -1.665556, 0.6549187, 1, 0, 0.227451, 1,
1.785473, -0.002172074, 1.525066, 1, 0, 0.2235294, 1,
1.798275, 1.20422, 3.295755, 1, 0, 0.2156863, 1,
1.800864, 0.8302586, -0.7847273, 1, 0, 0.2117647, 1,
1.802235, 0.763534, 2.671132, 1, 0, 0.2039216, 1,
1.810112, -0.03809785, 0.8680787, 1, 0, 0.1960784, 1,
1.826189, 0.4299793, 0.9197203, 1, 0, 0.1921569, 1,
1.829041, 1.107609, 3.465093, 1, 0, 0.1843137, 1,
1.834382, 1.583652, 2.828456, 1, 0, 0.1803922, 1,
1.840526, -0.08771817, 2.226283, 1, 0, 0.172549, 1,
1.844522, 1.108321, -0.629782, 1, 0, 0.1686275, 1,
1.885768, 0.6705604, 1.432204, 1, 0, 0.1607843, 1,
1.900153, 0.6673577, 3.01319, 1, 0, 0.1568628, 1,
1.929915, 0.2711475, 1.058223, 1, 0, 0.1490196, 1,
1.939567, -1.44556, 2.866538, 1, 0, 0.145098, 1,
1.949484, -1.597871, 3.518025, 1, 0, 0.1372549, 1,
1.976677, -0.9448354, 3.23027, 1, 0, 0.1333333, 1,
1.977858, -1.166814, 2.589075, 1, 0, 0.1254902, 1,
1.990239, -1.247227, 3.191565, 1, 0, 0.1215686, 1,
2.042645, -0.797197, 2.499017, 1, 0, 0.1137255, 1,
2.043423, -0.2414207, 0.5327585, 1, 0, 0.1098039, 1,
2.064227, -2.756297, 2.768721, 1, 0, 0.1019608, 1,
2.207521, 0.1887359, 1.422006, 1, 0, 0.09411765, 1,
2.245442, -0.03299668, 1.136366, 1, 0, 0.09019608, 1,
2.256155, 0.3599944, 1.073618, 1, 0, 0.08235294, 1,
2.343707, -1.058137, 2.086494, 1, 0, 0.07843138, 1,
2.372324, 0.376705, 2.276299, 1, 0, 0.07058824, 1,
2.451442, -2.311506, 3.00845, 1, 0, 0.06666667, 1,
2.4548, 0.1155199, 2.48303, 1, 0, 0.05882353, 1,
2.489101, -0.3808813, 1.622226, 1, 0, 0.05490196, 1,
2.511312, 1.219129, 0.6084707, 1, 0, 0.04705882, 1,
2.514248, 0.4072424, 0.2651085, 1, 0, 0.04313726, 1,
2.546964, 1.812651, 1.149028, 1, 0, 0.03529412, 1,
2.554769, 0.8749239, 0.9853376, 1, 0, 0.03137255, 1,
2.623635, -0.9658299, 1.348051, 1, 0, 0.02352941, 1,
2.664559, 2.019246, 0.7035981, 1, 0, 0.01960784, 1,
3.113641, 1.225205, 0.4114914, 1, 0, 0.01176471, 1,
3.390629, -0.9197094, 2.812674, 1, 0, 0.007843138, 1
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
-0.1700956, -4.736424, -7.015188, 0, -0.5, 0.5, 0.5,
-0.1700956, -4.736424, -7.015188, 1, -0.5, 0.5, 0.5,
-0.1700956, -4.736424, -7.015188, 1, 1.5, 0.5, 0.5,
-0.1700956, -4.736424, -7.015188, 0, 1.5, 0.5, 0.5
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
-4.937906, 0.08409798, -7.015188, 0, -0.5, 0.5, 0.5,
-4.937906, 0.08409798, -7.015188, 1, -0.5, 0.5, 0.5,
-4.937906, 0.08409798, -7.015188, 1, 1.5, 0.5, 0.5,
-4.937906, 0.08409798, -7.015188, 0, 1.5, 0.5, 0.5
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
-4.937906, -4.736424, 0.3407903, 0, -0.5, 0.5, 0.5,
-4.937906, -4.736424, 0.3407903, 1, -0.5, 0.5, 0.5,
-4.937906, -4.736424, 0.3407903, 1, 1.5, 0.5, 0.5,
-4.937906, -4.736424, 0.3407903, 0, 1.5, 0.5, 0.5
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
-2, -3.623996, -5.317655,
2, -3.623996, -5.317655,
-2, -3.623996, -5.317655,
-2, -3.809401, -5.600577,
0, -3.623996, -5.317655,
0, -3.809401, -5.600577,
2, -3.623996, -5.317655,
2, -3.809401, -5.600577
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
-2, -4.18021, -6.166421, 0, -0.5, 0.5, 0.5,
-2, -4.18021, -6.166421, 1, -0.5, 0.5, 0.5,
-2, -4.18021, -6.166421, 1, 1.5, 0.5, 0.5,
-2, -4.18021, -6.166421, 0, 1.5, 0.5, 0.5,
0, -4.18021, -6.166421, 0, -0.5, 0.5, 0.5,
0, -4.18021, -6.166421, 1, -0.5, 0.5, 0.5,
0, -4.18021, -6.166421, 1, 1.5, 0.5, 0.5,
0, -4.18021, -6.166421, 0, 1.5, 0.5, 0.5,
2, -4.18021, -6.166421, 0, -0.5, 0.5, 0.5,
2, -4.18021, -6.166421, 1, -0.5, 0.5, 0.5,
2, -4.18021, -6.166421, 1, 1.5, 0.5, 0.5,
2, -4.18021, -6.166421, 0, 1.5, 0.5, 0.5
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
-3.837642, -2, -5.317655,
-3.837642, 2, -5.317655,
-3.837642, -2, -5.317655,
-4.021019, -2, -5.600577,
-3.837642, 0, -5.317655,
-4.021019, 0, -5.600577,
-3.837642, 2, -5.317655,
-4.021019, 2, -5.600577
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
-4.387774, -2, -6.166421, 0, -0.5, 0.5, 0.5,
-4.387774, -2, -6.166421, 1, -0.5, 0.5, 0.5,
-4.387774, -2, -6.166421, 1, 1.5, 0.5, 0.5,
-4.387774, -2, -6.166421, 0, 1.5, 0.5, 0.5,
-4.387774, 0, -6.166421, 0, -0.5, 0.5, 0.5,
-4.387774, 0, -6.166421, 1, -0.5, 0.5, 0.5,
-4.387774, 0, -6.166421, 1, 1.5, 0.5, 0.5,
-4.387774, 0, -6.166421, 0, 1.5, 0.5, 0.5,
-4.387774, 2, -6.166421, 0, -0.5, 0.5, 0.5,
-4.387774, 2, -6.166421, 1, -0.5, 0.5, 0.5,
-4.387774, 2, -6.166421, 1, 1.5, 0.5, 0.5,
-4.387774, 2, -6.166421, 0, 1.5, 0.5, 0.5
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
-3.837642, -3.623996, -4,
-3.837642, -3.623996, 4,
-3.837642, -3.623996, -4,
-4.021019, -3.809401, -4,
-3.837642, -3.623996, -2,
-4.021019, -3.809401, -2,
-3.837642, -3.623996, 0,
-4.021019, -3.809401, 0,
-3.837642, -3.623996, 2,
-4.021019, -3.809401, 2,
-3.837642, -3.623996, 4,
-4.021019, -3.809401, 4
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
-4.387774, -4.18021, -4, 0, -0.5, 0.5, 0.5,
-4.387774, -4.18021, -4, 1, -0.5, 0.5, 0.5,
-4.387774, -4.18021, -4, 1, 1.5, 0.5, 0.5,
-4.387774, -4.18021, -4, 0, 1.5, 0.5, 0.5,
-4.387774, -4.18021, -2, 0, -0.5, 0.5, 0.5,
-4.387774, -4.18021, -2, 1, -0.5, 0.5, 0.5,
-4.387774, -4.18021, -2, 1, 1.5, 0.5, 0.5,
-4.387774, -4.18021, -2, 0, 1.5, 0.5, 0.5,
-4.387774, -4.18021, 0, 0, -0.5, 0.5, 0.5,
-4.387774, -4.18021, 0, 1, -0.5, 0.5, 0.5,
-4.387774, -4.18021, 0, 1, 1.5, 0.5, 0.5,
-4.387774, -4.18021, 0, 0, 1.5, 0.5, 0.5,
-4.387774, -4.18021, 2, 0, -0.5, 0.5, 0.5,
-4.387774, -4.18021, 2, 1, -0.5, 0.5, 0.5,
-4.387774, -4.18021, 2, 1, 1.5, 0.5, 0.5,
-4.387774, -4.18021, 2, 0, 1.5, 0.5, 0.5,
-4.387774, -4.18021, 4, 0, -0.5, 0.5, 0.5,
-4.387774, -4.18021, 4, 1, -0.5, 0.5, 0.5,
-4.387774, -4.18021, 4, 1, 1.5, 0.5, 0.5,
-4.387774, -4.18021, 4, 0, 1.5, 0.5, 0.5
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
-3.837642, -3.623996, -5.317655,
-3.837642, 3.792192, -5.317655,
-3.837642, -3.623996, 5.999235,
-3.837642, 3.792192, 5.999235,
-3.837642, -3.623996, -5.317655,
-3.837642, -3.623996, 5.999235,
-3.837642, 3.792192, -5.317655,
-3.837642, 3.792192, 5.999235,
-3.837642, -3.623996, -5.317655,
3.497451, -3.623996, -5.317655,
-3.837642, -3.623996, 5.999235,
3.497451, -3.623996, 5.999235,
-3.837642, 3.792192, -5.317655,
3.497451, 3.792192, -5.317655,
-3.837642, 3.792192, 5.999235,
3.497451, 3.792192, 5.999235,
3.497451, -3.623996, -5.317655,
3.497451, 3.792192, -5.317655,
3.497451, -3.623996, 5.999235,
3.497451, 3.792192, 5.999235,
3.497451, -3.623996, -5.317655,
3.497451, -3.623996, 5.999235,
3.497451, 3.792192, -5.317655,
3.497451, 3.792192, 5.999235
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
var radius = 8.218366;
var distance = 36.56444;
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
mvMatrix.translate( 0.1700956, -0.08409798, -0.3407903 );
mvMatrix.scale( 1.211417, 1.198171, 0.7851856 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.56444);
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
Dimethylhydrazin<-read.table("Dimethylhydrazin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dimethylhydrazin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dimethylhydrazin' not found
```

```r
y<-Dimethylhydrazin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dimethylhydrazin' not found
```

```r
z<-Dimethylhydrazin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dimethylhydrazin' not found
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
-3.73082, -0.2000261, 0.3215996, 0, 0, 1, 1, 1,
-3.311296, -0.8521196, -0.2795547, 1, 0, 0, 1, 1,
-3.037153, -0.0747353, -2.040367, 1, 0, 0, 1, 1,
-2.777035, -0.4505993, -2.157735, 1, 0, 0, 1, 1,
-2.751023, -0.4980161, -1.175018, 1, 0, 0, 1, 1,
-2.692144, 0.1431904, -2.542387, 1, 0, 0, 1, 1,
-2.528903, 0.6320415, -2.62489, 0, 0, 0, 1, 1,
-2.379119, 1.811579, 1.445251, 0, 0, 0, 1, 1,
-2.325917, 0.3569289, -0.1693937, 0, 0, 0, 1, 1,
-2.271146, 0.658628, 0.0943815, 0, 0, 0, 1, 1,
-2.267444, -0.5562891, -1.99816, 0, 0, 0, 1, 1,
-2.171405, -0.7989354, -1.268398, 0, 0, 0, 1, 1,
-2.138341, -1.618557, -2.008032, 0, 0, 0, 1, 1,
-2.129825, 0.9469234, -1.191035, 1, 1, 1, 1, 1,
-2.056734, 1.382871, 0.08111861, 1, 1, 1, 1, 1,
-2.05455, -2.756017, -3.654723, 1, 1, 1, 1, 1,
-1.97741, -0.6296463, -0.9741544, 1, 1, 1, 1, 1,
-1.955893, -1.383836, -1.865014, 1, 1, 1, 1, 1,
-1.949574, -1.216286, -0.8704378, 1, 1, 1, 1, 1,
-1.936835, 0.1244206, -2.331409, 1, 1, 1, 1, 1,
-1.934196, -0.1864444, -2.903788, 1, 1, 1, 1, 1,
-1.924178, 0.4105403, -2.256521, 1, 1, 1, 1, 1,
-1.921181, 0.4049804, -2.636993, 1, 1, 1, 1, 1,
-1.918433, 0.2982439, -1.673127, 1, 1, 1, 1, 1,
-1.883334, 0.311285, -1.872706, 1, 1, 1, 1, 1,
-1.87985, 0.1186512, -1.154646, 1, 1, 1, 1, 1,
-1.871429, -0.823891, -3.166123, 1, 1, 1, 1, 1,
-1.866918, -0.8484619, -1.155167, 1, 1, 1, 1, 1,
-1.858015, 0.6988866, -1.720337, 0, 0, 1, 1, 1,
-1.856748, -0.8985757, -3.665291, 1, 0, 0, 1, 1,
-1.848883, 1.10381, -1.747691, 1, 0, 0, 1, 1,
-1.847149, -1.27089, -1.667308, 1, 0, 0, 1, 1,
-1.834172, 1.722285, 1.320606, 1, 0, 0, 1, 1,
-1.831937, 0.9829803, -0.5951577, 1, 0, 0, 1, 1,
-1.802224, 0.5561525, -2.273745, 0, 0, 0, 1, 1,
-1.782109, 1.049253, -1.583753, 0, 0, 0, 1, 1,
-1.743266, -0.7573619, -2.090128, 0, 0, 0, 1, 1,
-1.736642, 1.519573, -1.023829, 0, 0, 0, 1, 1,
-1.71717, 0.1005367, -2.407079, 0, 0, 0, 1, 1,
-1.705876, 0.1697097, -0.7980995, 0, 0, 0, 1, 1,
-1.702987, 1.266709, -1.610099, 0, 0, 0, 1, 1,
-1.702269, 0.829301, -1.740633, 1, 1, 1, 1, 1,
-1.695722, 0.530337, -0.9698601, 1, 1, 1, 1, 1,
-1.661015, -1.585215, -3.294954, 1, 1, 1, 1, 1,
-1.654826, -0.220799, -3.443989, 1, 1, 1, 1, 1,
-1.654704, -1.525278, -1.664778, 1, 1, 1, 1, 1,
-1.648983, -0.36677, -2.189765, 1, 1, 1, 1, 1,
-1.648743, 0.9180954, 0.1014817, 1, 1, 1, 1, 1,
-1.636803, -1.149383, -1.409067, 1, 1, 1, 1, 1,
-1.632771, 0.2688067, -2.780424, 1, 1, 1, 1, 1,
-1.620212, 0.3584069, -0.7958265, 1, 1, 1, 1, 1,
-1.608564, 2.219419, -0.4712501, 1, 1, 1, 1, 1,
-1.596748, -1.003753, -2.551085, 1, 1, 1, 1, 1,
-1.594635, 0.2742125, -0.224218, 1, 1, 1, 1, 1,
-1.583874, 1.288423, -1.496103, 1, 1, 1, 1, 1,
-1.580282, -2.101445, -1.145062, 1, 1, 1, 1, 1,
-1.577888, -0.6272295, 0.4171572, 0, 0, 1, 1, 1,
-1.577144, 0.6521472, 0.09117139, 1, 0, 0, 1, 1,
-1.575331, 1.962838, 0.06754342, 1, 0, 0, 1, 1,
-1.575199, 1.214721, -0.02724459, 1, 0, 0, 1, 1,
-1.571392, -0.005685372, -1.287774, 1, 0, 0, 1, 1,
-1.56769, -0.144276, -1.205454, 1, 0, 0, 1, 1,
-1.566174, -1.603245, -0.4637559, 0, 0, 0, 1, 1,
-1.546431, 0.8776798, -0.9874679, 0, 0, 0, 1, 1,
-1.544106, -0.1216605, -1.443843, 0, 0, 0, 1, 1,
-1.543104, 1.552203, -0.9495413, 0, 0, 0, 1, 1,
-1.537199, -0.340016, -0.742404, 0, 0, 0, 1, 1,
-1.53188, 0.5446011, -0.4660905, 0, 0, 0, 1, 1,
-1.529257, -0.1452954, -2.762441, 0, 0, 0, 1, 1,
-1.524261, 0.6113442, -0.7433715, 1, 1, 1, 1, 1,
-1.490003, -1.492006, -3.511302, 1, 1, 1, 1, 1,
-1.479908, -1.164593, -2.013121, 1, 1, 1, 1, 1,
-1.466678, 0.8880684, -0.1735911, 1, 1, 1, 1, 1,
-1.454234, -0.3700206, -2.799844, 1, 1, 1, 1, 1,
-1.438267, -0.3937714, -0.338458, 1, 1, 1, 1, 1,
-1.429339, -0.07435574, -2.818275, 1, 1, 1, 1, 1,
-1.420781, -0.5456434, -1.936768, 1, 1, 1, 1, 1,
-1.420534, -0.3005515, -3.134327, 1, 1, 1, 1, 1,
-1.41185, 0.721983, -1.770713, 1, 1, 1, 1, 1,
-1.407955, 0.4416781, -1.690184, 1, 1, 1, 1, 1,
-1.407013, 0.9888791, 0.7923781, 1, 1, 1, 1, 1,
-1.400971, 0.03458149, 0.6115206, 1, 1, 1, 1, 1,
-1.398269, 0.2380191, -1.46367, 1, 1, 1, 1, 1,
-1.397366, -1.328428, -2.940948, 1, 1, 1, 1, 1,
-1.394148, 0.6682733, -1.358612, 0, 0, 1, 1, 1,
-1.39233, 1.496191, -0.1703137, 1, 0, 0, 1, 1,
-1.388153, -0.6574417, -2.333752, 1, 0, 0, 1, 1,
-1.379774, -0.07087498, -4.042621, 1, 0, 0, 1, 1,
-1.378569, -1.551874, -2.252948, 1, 0, 0, 1, 1,
-1.367062, -1.431909, -1.980152, 1, 0, 0, 1, 1,
-1.360809, -0.03786547, -2.932805, 0, 0, 0, 1, 1,
-1.353722, 0.7687028, -0.08937819, 0, 0, 0, 1, 1,
-1.349295, -1.136919, -0.7602596, 0, 0, 0, 1, 1,
-1.342, -1.028894, -2.53983, 0, 0, 0, 1, 1,
-1.331768, 0.4012509, -3.160629, 0, 0, 0, 1, 1,
-1.319462, 0.6763307, -2.011867, 0, 0, 0, 1, 1,
-1.318942, -0.5736141, -2.703173, 0, 0, 0, 1, 1,
-1.312637, -1.547626, -2.471344, 1, 1, 1, 1, 1,
-1.309256, -0.6311805, 0.4494461, 1, 1, 1, 1, 1,
-1.308378, -0.2581809, -2.031704, 1, 1, 1, 1, 1,
-1.308255, -0.7788333, -1.103517, 1, 1, 1, 1, 1,
-1.306333, 1.097534, -0.4564647, 1, 1, 1, 1, 1,
-1.304371, -1.360714, -3.297364, 1, 1, 1, 1, 1,
-1.30066, -1.032501, -1.752704, 1, 1, 1, 1, 1,
-1.298397, -0.7121795, -2.758518, 1, 1, 1, 1, 1,
-1.28711, -0.2293325, -2.790332, 1, 1, 1, 1, 1,
-1.281913, 0.3520968, -2.127367, 1, 1, 1, 1, 1,
-1.28184, 1.811494, 0.84573, 1, 1, 1, 1, 1,
-1.277041, 0.2462731, -2.422719, 1, 1, 1, 1, 1,
-1.27679, 0.8290603, -0.1653502, 1, 1, 1, 1, 1,
-1.275039, -1.720679, -1.217609, 1, 1, 1, 1, 1,
-1.273901, 0.9984037, -1.402545, 1, 1, 1, 1, 1,
-1.263115, 0.5920543, 0.4029574, 0, 0, 1, 1, 1,
-1.262061, 1.086163, -0.1502451, 1, 0, 0, 1, 1,
-1.258801, -1.699605, -1.829151, 1, 0, 0, 1, 1,
-1.2502, 1.653039, -0.1234331, 1, 0, 0, 1, 1,
-1.246243, -1.137762, -1.056811, 1, 0, 0, 1, 1,
-1.239044, 0.2683578, -2.554401, 1, 0, 0, 1, 1,
-1.236946, 0.1139188, -2.01281, 0, 0, 0, 1, 1,
-1.230782, 3.2498, -2.409505, 0, 0, 0, 1, 1,
-1.22783, -1.494342, -4.300473, 0, 0, 0, 1, 1,
-1.226627, -0.5312678, -2.007401, 0, 0, 0, 1, 1,
-1.22585, -1.006035, -0.635401, 0, 0, 0, 1, 1,
-1.225412, -0.04271397, -0.2236619, 0, 0, 0, 1, 1,
-1.215335, 1.251708, -0.7669067, 0, 0, 0, 1, 1,
-1.211119, -0.07168666, 0.06910601, 1, 1, 1, 1, 1,
-1.200978, 2.122705, -1.316506, 1, 1, 1, 1, 1,
-1.190823, 0.3822137, -1.270688, 1, 1, 1, 1, 1,
-1.188916, -0.8337074, -3.072444, 1, 1, 1, 1, 1,
-1.187422, -0.5891624, -0.9413034, 1, 1, 1, 1, 1,
-1.18417, -0.5716915, -0.8352934, 1, 1, 1, 1, 1,
-1.173489, 1.684405, -0.4935702, 1, 1, 1, 1, 1,
-1.168807, 2.799525, -0.4147608, 1, 1, 1, 1, 1,
-1.16853, -2.017112, -2.953588, 1, 1, 1, 1, 1,
-1.165106, -0.7769123, -1.737824, 1, 1, 1, 1, 1,
-1.164987, -0.02394031, -2.776987, 1, 1, 1, 1, 1,
-1.163543, -0.5159369, -0.4736612, 1, 1, 1, 1, 1,
-1.160745, 0.8822551, -1.149628, 1, 1, 1, 1, 1,
-1.153439, 0.5412683, -0.1178099, 1, 1, 1, 1, 1,
-1.150889, -2.769071, -1.818179, 1, 1, 1, 1, 1,
-1.147024, -0.3793737, -1.330235, 0, 0, 1, 1, 1,
-1.145339, -0.4106015, -1.655266, 1, 0, 0, 1, 1,
-1.137722, 1.309875, -0.6789399, 1, 0, 0, 1, 1,
-1.135799, -0.6472499, -0.04595226, 1, 0, 0, 1, 1,
-1.135014, 1.244232, -1.111655, 1, 0, 0, 1, 1,
-1.128748, 1.518072, -1.866135, 1, 0, 0, 1, 1,
-1.126766, -0.3998421, -1.307441, 0, 0, 0, 1, 1,
-1.117948, -0.9638066, -2.395129, 0, 0, 0, 1, 1,
-1.113752, 0.4522405, -0.7173671, 0, 0, 0, 1, 1,
-1.101732, -0.470651, -2.008428, 0, 0, 0, 1, 1,
-1.099365, 0.4228232, -0.7045733, 0, 0, 0, 1, 1,
-1.097406, 0.4661566, -1.58753, 0, 0, 0, 1, 1,
-1.091158, 0.2924035, -0.12804, 0, 0, 0, 1, 1,
-1.087882, 1.917093, -1.768576, 1, 1, 1, 1, 1,
-1.071709, 0.1476749, 1.90497, 1, 1, 1, 1, 1,
-1.062096, 0.1379059, -0.6891294, 1, 1, 1, 1, 1,
-1.056486, -1.167277, -1.746014, 1, 1, 1, 1, 1,
-1.051242, -0.5327306, -1.759256, 1, 1, 1, 1, 1,
-1.038989, 1.161004, -0.5277815, 1, 1, 1, 1, 1,
-1.03297, 1.66633, -0.2675807, 1, 1, 1, 1, 1,
-1.02758, -0.239637, -1.580334, 1, 1, 1, 1, 1,
-1.020422, 2.767361, 1.441501, 1, 1, 1, 1, 1,
-1.020198, -0.1939725, -1.566657, 1, 1, 1, 1, 1,
-1.010389, -0.3244652, -2.520631, 1, 1, 1, 1, 1,
-1.006723, -1.060128, -2.751006, 1, 1, 1, 1, 1,
-1.0053, 1.194908, 0.891719, 1, 1, 1, 1, 1,
-0.9991407, 0.06843875, -1.074919, 1, 1, 1, 1, 1,
-0.9927886, 0.6716927, -0.7390136, 1, 1, 1, 1, 1,
-0.9913775, -0.1597956, -1.469244, 0, 0, 1, 1, 1,
-0.9885457, -0.1269962, -1.722529, 1, 0, 0, 1, 1,
-0.9883327, -2.111056, -3.976141, 1, 0, 0, 1, 1,
-0.9879775, -0.5482665, -1.326066, 1, 0, 0, 1, 1,
-0.9873512, -0.1431756, -2.031166, 1, 0, 0, 1, 1,
-0.9845979, 0.8534722, -0.8539443, 1, 0, 0, 1, 1,
-0.9818225, -0.2474077, -1.398121, 0, 0, 0, 1, 1,
-0.9776385, 1.569985, -0.5223062, 0, 0, 0, 1, 1,
-0.9771304, 1.512898, -2.778484, 0, 0, 0, 1, 1,
-0.9649764, 0.6864123, -1.141897, 0, 0, 0, 1, 1,
-0.9638329, -0.4082907, -2.236784, 0, 0, 0, 1, 1,
-0.9607253, 2.680287, -0.6748197, 0, 0, 0, 1, 1,
-0.9592454, -0.3101924, -1.71978, 0, 0, 0, 1, 1,
-0.95904, 1.190265, -1.148735, 1, 1, 1, 1, 1,
-0.9517263, -0.144607, -0.02818493, 1, 1, 1, 1, 1,
-0.9473829, 0.1490566, -1.340627, 1, 1, 1, 1, 1,
-0.9389968, -0.9641196, -2.644734, 1, 1, 1, 1, 1,
-0.9365714, 0.4807472, -2.499287, 1, 1, 1, 1, 1,
-0.9325402, 1.005825, -0.4982199, 1, 1, 1, 1, 1,
-0.9288376, 0.3172929, -0.478708, 1, 1, 1, 1, 1,
-0.9146513, -0.7303085, -2.660081, 1, 1, 1, 1, 1,
-0.9136555, -1.013792, -0.9212461, 1, 1, 1, 1, 1,
-0.9118855, -0.3804327, -2.377012, 1, 1, 1, 1, 1,
-0.908573, 0.2484558, 0.3346945, 1, 1, 1, 1, 1,
-0.9036875, 1.215715, -1.754749, 1, 1, 1, 1, 1,
-0.897685, 0.2661748, -2.993713, 1, 1, 1, 1, 1,
-0.8972465, -0.1919849, 0.3224169, 1, 1, 1, 1, 1,
-0.8851412, -0.2225755, -1.875993, 1, 1, 1, 1, 1,
-0.882507, 1.3146, -0.8758845, 0, 0, 1, 1, 1,
-0.8780172, 1.753984, -2.784974, 1, 0, 0, 1, 1,
-0.8675766, 0.2123603, -0.3881456, 1, 0, 0, 1, 1,
-0.863991, 0.8414425, -2.383174, 1, 0, 0, 1, 1,
-0.8632061, -0.6640461, -1.220515, 1, 0, 0, 1, 1,
-0.8612953, -0.6696275, -2.592043, 1, 0, 0, 1, 1,
-0.8578079, 1.390651, -0.6989799, 0, 0, 0, 1, 1,
-0.8522883, -0.2904548, -2.501637, 0, 0, 0, 1, 1,
-0.8472978, 1.237635, -1.31332, 0, 0, 0, 1, 1,
-0.8467501, 0.6243748, 0.03996365, 0, 0, 0, 1, 1,
-0.8445707, 1.229404, -0.9638473, 0, 0, 0, 1, 1,
-0.8439466, -0.7275741, -1.005807, 0, 0, 0, 1, 1,
-0.8417024, -1.201728, -2.225325, 0, 0, 0, 1, 1,
-0.837326, 0.0006472423, -0.06002798, 1, 1, 1, 1, 1,
-0.8329831, -0.4978858, -3.680988, 1, 1, 1, 1, 1,
-0.8189299, 0.2695722, -2.754689, 1, 1, 1, 1, 1,
-0.8116408, 0.9958535, -0.6075424, 1, 1, 1, 1, 1,
-0.8097106, -0.277082, -0.497523, 1, 1, 1, 1, 1,
-0.8062745, 1.002343, -0.8304467, 1, 1, 1, 1, 1,
-0.8058376, -1.385539, -1.876528, 1, 1, 1, 1, 1,
-0.8015888, 0.3877714, -1.672386, 1, 1, 1, 1, 1,
-0.7985433, -1.947984, -3.521888, 1, 1, 1, 1, 1,
-0.7964702, 0.4179718, -0.09313688, 1, 1, 1, 1, 1,
-0.7949111, -1.472978, -3.091494, 1, 1, 1, 1, 1,
-0.7919818, 0.7979464, 0.08788931, 1, 1, 1, 1, 1,
-0.7879313, 1.231227, -2.367336, 1, 1, 1, 1, 1,
-0.7866678, -1.55247, -2.469047, 1, 1, 1, 1, 1,
-0.7787352, 0.04747648, -2.01652, 1, 1, 1, 1, 1,
-0.7742876, -1.233643, -4.141515, 0, 0, 1, 1, 1,
-0.77185, -1.650991, -3.142559, 1, 0, 0, 1, 1,
-0.7705202, 0.1993445, -2.468381, 1, 0, 0, 1, 1,
-0.7528435, -0.6559867, -2.432406, 1, 0, 0, 1, 1,
-0.7524201, -2.474193, -2.23889, 1, 0, 0, 1, 1,
-0.7517937, -2.051597, -1.854786, 1, 0, 0, 1, 1,
-0.7479032, 0.8936571, -0.8224666, 0, 0, 0, 1, 1,
-0.7463627, -0.5493586, -2.247095, 0, 0, 0, 1, 1,
-0.7460217, 0.1868709, -1.903654, 0, 0, 0, 1, 1,
-0.7444173, 0.1280606, -1.493062, 0, 0, 0, 1, 1,
-0.7363258, -0.5955642, -3.682862, 0, 0, 0, 1, 1,
-0.728978, -0.5739766, -1.816358, 0, 0, 0, 1, 1,
-0.7254173, -0.02689659, -3.013808, 0, 0, 0, 1, 1,
-0.7197886, 3.359803, -0.1538473, 1, 1, 1, 1, 1,
-0.7143476, 0.1735417, -0.8509194, 1, 1, 1, 1, 1,
-0.7123917, -0.0323396, -2.535325, 1, 1, 1, 1, 1,
-0.7114762, 0.5271372, -3.802082, 1, 1, 1, 1, 1,
-0.7108548, 0.5232735, -2.443107, 1, 1, 1, 1, 1,
-0.7061044, 0.3133246, 0.03608406, 1, 1, 1, 1, 1,
-0.7054294, -0.3790432, -2.771277, 1, 1, 1, 1, 1,
-0.7002249, -0.1765658, -1.197746, 1, 1, 1, 1, 1,
-0.6970289, 0.2054007, -0.7798485, 1, 1, 1, 1, 1,
-0.6937488, -0.2509726, -1.483096, 1, 1, 1, 1, 1,
-0.6864136, -0.1359597, -1.735349, 1, 1, 1, 1, 1,
-0.6805543, -0.4346696, -2.957673, 1, 1, 1, 1, 1,
-0.6805422, -0.177245, -0.2910551, 1, 1, 1, 1, 1,
-0.6769091, -0.01458291, -1.932798, 1, 1, 1, 1, 1,
-0.6721513, -0.7567244, -2.007239, 1, 1, 1, 1, 1,
-0.6698944, -1.592169, -2.206171, 0, 0, 1, 1, 1,
-0.659548, -0.7534796, -2.339007, 1, 0, 0, 1, 1,
-0.6592665, 0.5131617, -2.333126, 1, 0, 0, 1, 1,
-0.6456633, -1.550965, -3.154558, 1, 0, 0, 1, 1,
-0.6398515, -0.6014561, -2.941661, 1, 0, 0, 1, 1,
-0.6355261, 0.02913572, -1.828474, 1, 0, 0, 1, 1,
-0.6322192, -0.2161238, -2.643031, 0, 0, 0, 1, 1,
-0.6318482, 1.689416, -0.2645206, 0, 0, 0, 1, 1,
-0.628184, -0.2653903, -0.7930694, 0, 0, 0, 1, 1,
-0.6279209, -0.9415143, -2.849031, 0, 0, 0, 1, 1,
-0.6250759, -1.146308, -3.240169, 0, 0, 0, 1, 1,
-0.6244351, 0.2350686, -1.49255, 0, 0, 0, 1, 1,
-0.6230786, -0.7835175, -2.189985, 0, 0, 0, 1, 1,
-0.6209698, -0.654514, -4.808459, 1, 1, 1, 1, 1,
-0.6148952, 0.4504652, -0.5989986, 1, 1, 1, 1, 1,
-0.6081837, -0.009137086, -1.254212, 1, 1, 1, 1, 1,
-0.6046111, -0.1440471, -1.210917, 1, 1, 1, 1, 1,
-0.6041559, 1.339819, 0.1103423, 1, 1, 1, 1, 1,
-0.6026358, 0.06346064, -0.02361085, 1, 1, 1, 1, 1,
-0.6022359, -0.2395565, -2.150432, 1, 1, 1, 1, 1,
-0.602133, -0.2086872, -2.164609, 1, 1, 1, 1, 1,
-0.6021054, 0.01380913, -1.099348, 1, 1, 1, 1, 1,
-0.6006069, -0.8790164, -2.00276, 1, 1, 1, 1, 1,
-0.5992717, 1.012153, -0.4832276, 1, 1, 1, 1, 1,
-0.59909, 1.263497, -0.2026867, 1, 1, 1, 1, 1,
-0.5985574, 0.4682217, -0.5534335, 1, 1, 1, 1, 1,
-0.5975588, -0.6480159, -2.574922, 1, 1, 1, 1, 1,
-0.5959165, -0.8393538, -2.026204, 1, 1, 1, 1, 1,
-0.5933262, 0.2561629, -0.2042985, 0, 0, 1, 1, 1,
-0.591122, -0.9202617, -3.191511, 1, 0, 0, 1, 1,
-0.587808, 1.196784, 0.6609521, 1, 0, 0, 1, 1,
-0.5840077, 0.9869547, 1.157475, 1, 0, 0, 1, 1,
-0.5805134, 0.679684, -0.2190247, 1, 0, 0, 1, 1,
-0.5803934, -1.109673, -2.862658, 1, 0, 0, 1, 1,
-0.5783377, 1.09375, -0.3390073, 0, 0, 0, 1, 1,
-0.5781149, -1.034296, -3.634805, 0, 0, 0, 1, 1,
-0.5683748, 0.3374585, 0.8722194, 0, 0, 0, 1, 1,
-0.563512, -1.15459, -3.570172, 0, 0, 0, 1, 1,
-0.5622576, 0.4123559, -1.657144, 0, 0, 0, 1, 1,
-0.5559604, -0.4346521, -1.844404, 0, 0, 0, 1, 1,
-0.5517695, -0.2559717, -3.753563, 0, 0, 0, 1, 1,
-0.5451618, -0.6244911, -2.199857, 1, 1, 1, 1, 1,
-0.5404781, 0.6779926, -1.454413, 1, 1, 1, 1, 1,
-0.540283, 0.04748806, -2.062881, 1, 1, 1, 1, 1,
-0.5356047, -1.040324, -3.321228, 1, 1, 1, 1, 1,
-0.5302336, -1.444036, -3.998211, 1, 1, 1, 1, 1,
-0.5272208, -0.7543265, -3.852931, 1, 1, 1, 1, 1,
-0.5271635, 0.6786438, -1.089621, 1, 1, 1, 1, 1,
-0.5240897, -0.5248032, -3.901462, 1, 1, 1, 1, 1,
-0.5178972, -0.5454599, -2.67383, 1, 1, 1, 1, 1,
-0.517153, 1.746821, 0.1032864, 1, 1, 1, 1, 1,
-0.5170268, -0.03773659, -1.235303, 1, 1, 1, 1, 1,
-0.5166273, 0.6620435, 1.118554, 1, 1, 1, 1, 1,
-0.5143123, -0.5698867, -2.586946, 1, 1, 1, 1, 1,
-0.5130741, -0.7598561, -1.817264, 1, 1, 1, 1, 1,
-0.5127444, -1.336054, -2.198009, 1, 1, 1, 1, 1,
-0.5116825, -2.55188, -3.927665, 0, 0, 1, 1, 1,
-0.5111769, 0.2719457, 0.118403, 1, 0, 0, 1, 1,
-0.5106778, -0.3535312, -2.122059, 1, 0, 0, 1, 1,
-0.5070554, 0.06114988, -1.342484, 1, 0, 0, 1, 1,
-0.5061361, -0.2833011, -2.38236, 1, 0, 0, 1, 1,
-0.5044076, -1.824864, -3.509733, 1, 0, 0, 1, 1,
-0.5039209, -0.3998285, -2.385317, 0, 0, 0, 1, 1,
-0.5009891, -0.2660348, -1.764751, 0, 0, 0, 1, 1,
-0.5003459, -0.7836192, -2.091715, 0, 0, 0, 1, 1,
-0.499951, -0.2267305, -0.6759374, 0, 0, 0, 1, 1,
-0.4984585, -1.655433, -2.778413, 0, 0, 0, 1, 1,
-0.4980523, 0.05039791, -0.7536038, 0, 0, 0, 1, 1,
-0.497442, -0.3110083, -3.136064, 0, 0, 0, 1, 1,
-0.4944355, -0.6657628, -5.152845, 1, 1, 1, 1, 1,
-0.4927679, 0.5519113, -0.1715157, 1, 1, 1, 1, 1,
-0.4919707, 0.1959101, -0.9444854, 1, 1, 1, 1, 1,
-0.4915827, -1.223608, -3.240402, 1, 1, 1, 1, 1,
-0.4853182, 1.542657, -0.07396649, 1, 1, 1, 1, 1,
-0.471706, -0.1782617, -2.369727, 1, 1, 1, 1, 1,
-0.4676111, -0.3224095, -3.99567, 1, 1, 1, 1, 1,
-0.4672795, -1.723476, -0.8117831, 1, 1, 1, 1, 1,
-0.4631737, -0.2181098, -2.077754, 1, 1, 1, 1, 1,
-0.4544711, -0.6743008, -2.58803, 1, 1, 1, 1, 1,
-0.4511135, 0.7752574, -2.640365, 1, 1, 1, 1, 1,
-0.4496862, 0.3578056, -0.8349138, 1, 1, 1, 1, 1,
-0.4481521, -1.595952, -3.669622, 1, 1, 1, 1, 1,
-0.4369978, -0.6861654, -2.381074, 1, 1, 1, 1, 1,
-0.4310179, 0.5458367, 0.4785124, 1, 1, 1, 1, 1,
-0.4302041, -0.637477, -3.428502, 0, 0, 1, 1, 1,
-0.4301423, -0.592281, -2.136682, 1, 0, 0, 1, 1,
-0.4293019, -1.032438, -4.404285, 1, 0, 0, 1, 1,
-0.4270255, -1.519096, -0.3137326, 1, 0, 0, 1, 1,
-0.4251376, 0.8654113, 0.8204291, 1, 0, 0, 1, 1,
-0.4241201, -0.04226272, -1.106209, 1, 0, 0, 1, 1,
-0.4228931, -1.450006, -2.508274, 0, 0, 0, 1, 1,
-0.4183897, -1.732195, -4.816256, 0, 0, 0, 1, 1,
-0.4178773, 0.06535527, 0.1583586, 0, 0, 0, 1, 1,
-0.4155443, -0.01122444, -3.199911, 0, 0, 0, 1, 1,
-0.4140364, -0.9965395, -2.417304, 0, 0, 0, 1, 1,
-0.4098583, -0.9122108, -2.339164, 0, 0, 0, 1, 1,
-0.4086651, 0.6997239, -0.8850806, 0, 0, 0, 1, 1,
-0.4071352, -0.7885833, -2.467608, 1, 1, 1, 1, 1,
-0.4051925, -0.3509871, -2.603076, 1, 1, 1, 1, 1,
-0.3981574, 0.372988, -1.177264, 1, 1, 1, 1, 1,
-0.3949762, 0.9219789, 2.290868, 1, 1, 1, 1, 1,
-0.3909732, -0.8374529, -2.324177, 1, 1, 1, 1, 1,
-0.3875031, 0.6185282, 0.9689212, 1, 1, 1, 1, 1,
-0.3825088, -0.3748159, -0.244014, 1, 1, 1, 1, 1,
-0.380646, 0.2270955, -0.7495659, 1, 1, 1, 1, 1,
-0.3802148, -0.3069091, -2.964158, 1, 1, 1, 1, 1,
-0.3763077, -1.370285, -1.345699, 1, 1, 1, 1, 1,
-0.3746551, 0.02931949, -1.733163, 1, 1, 1, 1, 1,
-0.3717136, -3.099297, -4.003438, 1, 1, 1, 1, 1,
-0.3705541, -0.3595232, -3.595514, 1, 1, 1, 1, 1,
-0.369233, -1.101098, -3.330772, 1, 1, 1, 1, 1,
-0.3667454, -0.2071886, -2.444523, 1, 1, 1, 1, 1,
-0.3622435, 0.4752843, -1.17303, 0, 0, 1, 1, 1,
-0.3581014, -0.4906475, -1.407447, 1, 0, 0, 1, 1,
-0.3511846, 2.843836, -1.135693, 1, 0, 0, 1, 1,
-0.3500853, -0.8708171, -3.29347, 1, 0, 0, 1, 1,
-0.3497907, 0.7059609, -1.366744, 1, 0, 0, 1, 1,
-0.347637, -0.9234096, -3.310332, 1, 0, 0, 1, 1,
-0.3429193, -0.5094901, -4.689454, 0, 0, 0, 1, 1,
-0.3303638, 0.9173913, 0.4534889, 0, 0, 0, 1, 1,
-0.3229034, 0.889237, -0.135038, 0, 0, 0, 1, 1,
-0.3225985, -0.07634209, -1.434916, 0, 0, 0, 1, 1,
-0.3210495, -1.147303, -2.490252, 0, 0, 0, 1, 1,
-0.3195268, -0.9936994, -0.8705972, 0, 0, 0, 1, 1,
-0.31777, -0.4876474, -1.272083, 0, 0, 0, 1, 1,
-0.3079904, 1.531809, -1.231315, 1, 1, 1, 1, 1,
-0.3063291, -1.360895, -1.716542, 1, 1, 1, 1, 1,
-0.3048046, 0.6204662, -1.892871, 1, 1, 1, 1, 1,
-0.3046432, -1.411302, -3.895154, 1, 1, 1, 1, 1,
-0.3043675, -0.6297815, -2.266527, 1, 1, 1, 1, 1,
-0.302979, 1.171713, 1.089408, 1, 1, 1, 1, 1,
-0.3000335, -2.21373, -4.026003, 1, 1, 1, 1, 1,
-0.2977378, -1.678627, -2.758805, 1, 1, 1, 1, 1,
-0.2941411, -0.1547059, -1.176695, 1, 1, 1, 1, 1,
-0.2931919, 1.172118, 1.540617, 1, 1, 1, 1, 1,
-0.2931374, -0.2920226, -2.229895, 1, 1, 1, 1, 1,
-0.2860996, 0.808013, -1.131916, 1, 1, 1, 1, 1,
-0.2856355, 0.405191, 0.5387836, 1, 1, 1, 1, 1,
-0.2850485, -0.2600651, -2.972215, 1, 1, 1, 1, 1,
-0.2828932, -1.472321, -2.395132, 1, 1, 1, 1, 1,
-0.2811253, -0.7638983, -2.594698, 0, 0, 1, 1, 1,
-0.2800831, 1.810364, -0.5557938, 1, 0, 0, 1, 1,
-0.2759362, -1.157637, -4.724007, 1, 0, 0, 1, 1,
-0.2749406, 1.02047, -0.3996389, 1, 0, 0, 1, 1,
-0.2741689, 0.2978196, 0.3584326, 1, 0, 0, 1, 1,
-0.2718129, 0.4468046, -0.00377053, 1, 0, 0, 1, 1,
-0.2697506, -0.01309282, 0.8694538, 0, 0, 0, 1, 1,
-0.2647063, 0.2586443, -1.25892, 0, 0, 0, 1, 1,
-0.2569402, 0.5887113, 0.0002414295, 0, 0, 0, 1, 1,
-0.2543898, 0.4916634, 0.6486458, 0, 0, 0, 1, 1,
-0.2518331, -0.479945, -2.014781, 0, 0, 0, 1, 1,
-0.2471935, -1.12879, -2.004667, 0, 0, 0, 1, 1,
-0.2446176, 1.933306, -0.8460723, 0, 0, 0, 1, 1,
-0.2442155, 0.3929307, 0.1681137, 1, 1, 1, 1, 1,
-0.2428557, -0.2197668, -1.116778, 1, 1, 1, 1, 1,
-0.2402682, -1.073799, -3.950935, 1, 1, 1, 1, 1,
-0.2388603, -0.2066478, -1.003211, 1, 1, 1, 1, 1,
-0.2366764, -0.4614996, -0.4790324, 1, 1, 1, 1, 1,
-0.2346104, 0.3189179, -0.3238882, 1, 1, 1, 1, 1,
-0.2331672, -0.389328, -3.545626, 1, 1, 1, 1, 1,
-0.231995, 0.7202345, -0.4710786, 1, 1, 1, 1, 1,
-0.2319835, 0.2765217, -0.3693397, 1, 1, 1, 1, 1,
-0.2264781, -0.3390907, -3.816064, 1, 1, 1, 1, 1,
-0.2247828, 0.3067125, -1.925321, 1, 1, 1, 1, 1,
-0.224628, -2.145298, -1.86046, 1, 1, 1, 1, 1,
-0.2181405, 0.4350007, -0.3313514, 1, 1, 1, 1, 1,
-0.2110881, -0.9947005, -2.57438, 1, 1, 1, 1, 1,
-0.2080166, 1.025642, 2.40399, 1, 1, 1, 1, 1,
-0.1925722, -1.269068, -2.598202, 0, 0, 1, 1, 1,
-0.1872514, 0.9147286, 0.1407874, 1, 0, 0, 1, 1,
-0.1850041, -0.5060099, -2.9178, 1, 0, 0, 1, 1,
-0.1846149, 0.529516, 0.4025892, 1, 0, 0, 1, 1,
-0.1829311, 0.4572389, 0.1145004, 1, 0, 0, 1, 1,
-0.1803094, 0.08685971, -1.108898, 1, 0, 0, 1, 1,
-0.1753918, -0.0394186, -2.580546, 0, 0, 0, 1, 1,
-0.1745612, -1.051853, -2.793656, 0, 0, 0, 1, 1,
-0.1718794, -1.319036, -4.206535, 0, 0, 0, 1, 1,
-0.170479, -1.003963, -0.8581613, 0, 0, 0, 1, 1,
-0.1678518, 0.6941862, -1.851141, 0, 0, 0, 1, 1,
-0.1623452, 0.3170382, -0.8431835, 0, 0, 0, 1, 1,
-0.1623053, -1.111896, -4.720828, 0, 0, 0, 1, 1,
-0.1607757, 1.509149, -0.3332755, 1, 1, 1, 1, 1,
-0.1593757, 0.3003013, -1.796959, 1, 1, 1, 1, 1,
-0.1581302, -1.112509, -4.198174, 1, 1, 1, 1, 1,
-0.1567814, -1.734445, -2.814232, 1, 1, 1, 1, 1,
-0.1505623, 1.191466, -2.004469, 1, 1, 1, 1, 1,
-0.1493669, -0.04571642, -1.787062, 1, 1, 1, 1, 1,
-0.146387, 0.02261802, -1.037756, 1, 1, 1, 1, 1,
-0.1439453, 0.5028794, 0.9865184, 1, 1, 1, 1, 1,
-0.1416398, -0.7328717, -5.07408, 1, 1, 1, 1, 1,
-0.1293627, 0.04832327, -0.8617247, 1, 1, 1, 1, 1,
-0.1243812, -0.805777, -2.935421, 1, 1, 1, 1, 1,
-0.1229242, -1.424098, -3.418721, 1, 1, 1, 1, 1,
-0.1202453, 0.1426225, 0.8688011, 1, 1, 1, 1, 1,
-0.1168284, 1.802467, -1.019555, 1, 1, 1, 1, 1,
-0.1166592, 0.04031697, -1.237129, 1, 1, 1, 1, 1,
-0.1127431, -0.5257462, -1.002952, 0, 0, 1, 1, 1,
-0.09979013, -0.5854338, -3.4839, 1, 0, 0, 1, 1,
-0.09872755, 0.7745424, -0.2187545, 1, 0, 0, 1, 1,
-0.09788678, -0.5923115, -3.990543, 1, 0, 0, 1, 1,
-0.09244324, 1.194622, 0.6097776, 1, 0, 0, 1, 1,
-0.09054194, -0.3292945, -2.110185, 1, 0, 0, 1, 1,
-0.08995342, 0.7941782, 0.3921095, 0, 0, 0, 1, 1,
-0.08952773, 0.1396094, -0.6279248, 0, 0, 0, 1, 1,
-0.08818207, 0.07139767, -1.429083, 0, 0, 0, 1, 1,
-0.08358965, -0.5182785, -4.098028, 0, 0, 0, 1, 1,
-0.07825166, -0.1021914, -1.886395, 0, 0, 0, 1, 1,
-0.07182325, -0.6060373, -1.32732, 0, 0, 0, 1, 1,
-0.07121486, 0.6963693, -0.255556, 0, 0, 0, 1, 1,
-0.0706431, -0.1347978, -2.495843, 1, 1, 1, 1, 1,
-0.07006878, -1.281013, -2.437815, 1, 1, 1, 1, 1,
-0.0644316, -1.156641, -2.360316, 1, 1, 1, 1, 1,
-0.06378763, 0.3009516, 0.4188024, 1, 1, 1, 1, 1,
-0.06273617, 0.1142763, -0.055935, 1, 1, 1, 1, 1,
-0.06208658, -0.09447081, -3.528011, 1, 1, 1, 1, 1,
-0.06193303, -0.1089519, -2.485165, 1, 1, 1, 1, 1,
-0.06074594, -0.3591376, -2.71272, 1, 1, 1, 1, 1,
-0.05562684, 0.8569857, 0.6623315, 1, 1, 1, 1, 1,
-0.05433996, -0.2502417, -3.50824, 1, 1, 1, 1, 1,
-0.05138132, -0.4747746, -4.52108, 1, 1, 1, 1, 1,
-0.04936384, 1.463998, 1.304799, 1, 1, 1, 1, 1,
-0.04882343, 0.8001725, 0.1003549, 1, 1, 1, 1, 1,
-0.04312185, -0.3047048, -3.933552, 1, 1, 1, 1, 1,
-0.04273411, 0.2035786, -2.272794, 1, 1, 1, 1, 1,
-0.04073132, -1.220011, -3.83667, 0, 0, 1, 1, 1,
-0.03930683, 0.379197, -1.599136, 1, 0, 0, 1, 1,
-0.03570192, -0.03137753, -0.8104207, 1, 0, 0, 1, 1,
-0.03494143, 0.4763311, 0.8799128, 1, 0, 0, 1, 1,
-0.03466245, 0.02125532, -1.923452, 1, 0, 0, 1, 1,
-0.03232727, 0.9243304, -0.3858435, 1, 0, 0, 1, 1,
-0.02493686, 0.488207, 0.7512745, 0, 0, 0, 1, 1,
-0.02486575, -0.06701977, -1.750584, 0, 0, 0, 1, 1,
-0.02220846, 1.075369, -1.033891, 0, 0, 0, 1, 1,
-0.02012928, 0.04896614, -0.6418828, 0, 0, 0, 1, 1,
-0.01740916, -1.200464, -2.771397, 0, 0, 0, 1, 1,
-0.01471858, 0.07043736, 0.2844073, 0, 0, 0, 1, 1,
-0.01236978, 0.9088184, 2.385831, 0, 0, 0, 1, 1,
-0.01196843, -0.1926776, -2.955748, 1, 1, 1, 1, 1,
-0.01166704, 1.427351, 1.059719, 1, 1, 1, 1, 1,
-0.01145497, -1.202085, -1.953565, 1, 1, 1, 1, 1,
-0.009978235, 0.04153114, -0.9754441, 1, 1, 1, 1, 1,
-0.005020444, -0.7244132, -2.374368, 1, 1, 1, 1, 1,
-0.003352105, -1.779528, -3.657012, 1, 1, 1, 1, 1,
-0.002194504, -0.3646758, -4.523944, 1, 1, 1, 1, 1,
-0.001949779, -0.1642749, -2.487995, 1, 1, 1, 1, 1,
-0.000760835, -0.9011059, -4.762202, 1, 1, 1, 1, 1,
0.001143379, -0.9760291, 1.901368, 1, 1, 1, 1, 1,
0.003580903, 0.09027386, 0.8613026, 1, 1, 1, 1, 1,
0.003876427, -1.004948, 2.710481, 1, 1, 1, 1, 1,
0.005574041, 0.6002361, 0.2775233, 1, 1, 1, 1, 1,
0.00898168, -0.5431372, 2.468965, 1, 1, 1, 1, 1,
0.01186529, -0.1391711, 3.083129, 1, 1, 1, 1, 1,
0.01211478, -2.132661, 3.58986, 0, 0, 1, 1, 1,
0.01231275, 1.201422, 0.7752727, 1, 0, 0, 1, 1,
0.01502556, 0.4141182, 0.4740222, 1, 0, 0, 1, 1,
0.01507935, 0.5012676, -0.7256365, 1, 0, 0, 1, 1,
0.01750313, -0.04808423, 2.214016, 1, 0, 0, 1, 1,
0.02016193, 2.563895, -0.05661542, 1, 0, 0, 1, 1,
0.02260546, -0.4547192, 2.617703, 0, 0, 0, 1, 1,
0.02420334, -1.17917, 3.085628, 0, 0, 0, 1, 1,
0.02506813, 0.3197405, -0.3068748, 0, 0, 0, 1, 1,
0.02515381, -1.079315, 1.749501, 0, 0, 0, 1, 1,
0.02529403, 0.2439554, -0.8371091, 0, 0, 0, 1, 1,
0.02702745, -0.6828255, 4.229716, 0, 0, 0, 1, 1,
0.02750448, 0.8901004, -0.35539, 0, 0, 0, 1, 1,
0.03140078, 1.606492, 0.9622659, 1, 1, 1, 1, 1,
0.03659682, 1.676421, 1.988601, 1, 1, 1, 1, 1,
0.03770729, -0.06770924, 1.561664, 1, 1, 1, 1, 1,
0.04443903, -1.695368, 3.553252, 1, 1, 1, 1, 1,
0.04588119, -0.6716416, 2.470758, 1, 1, 1, 1, 1,
0.05375087, 1.302182, -1.357018, 1, 1, 1, 1, 1,
0.05445735, -1.921203, 2.818566, 1, 1, 1, 1, 1,
0.05522899, -0.3360226, 2.072156, 1, 1, 1, 1, 1,
0.05911183, -1.104337, 4.809423, 1, 1, 1, 1, 1,
0.0621343, -1.057976, 2.879674, 1, 1, 1, 1, 1,
0.06456774, -0.2849086, 3.336758, 1, 1, 1, 1, 1,
0.06915051, 0.3142928, -0.8180127, 1, 1, 1, 1, 1,
0.07198941, 1.228565, -1.327047, 1, 1, 1, 1, 1,
0.07257257, 0.3942586, 1.178515, 1, 1, 1, 1, 1,
0.07441916, 0.2345905, 0.2564909, 1, 1, 1, 1, 1,
0.0766924, -0.04419401, 1.326838, 0, 0, 1, 1, 1,
0.08071335, 1.643203, -0.4032056, 1, 0, 0, 1, 1,
0.08705784, 1.251131, -0.3696653, 1, 0, 0, 1, 1,
0.09297639, -0.7447756, 3.016044, 1, 0, 0, 1, 1,
0.0960307, 0.5848884, -0.6615451, 1, 0, 0, 1, 1,
0.1001121, 0.4343189, -0.3571654, 1, 0, 0, 1, 1,
0.100926, -0.4836346, 1.601739, 0, 0, 0, 1, 1,
0.1013216, -0.247273, 2.117588, 0, 0, 0, 1, 1,
0.1070201, -0.4821011, 1.411458, 0, 0, 0, 1, 1,
0.1095154, -0.05894757, 2.028814, 0, 0, 0, 1, 1,
0.1152181, -0.2772192, 1.434663, 0, 0, 0, 1, 1,
0.1154722, -0.361311, 3.398973, 0, 0, 0, 1, 1,
0.1253145, -1.769749, 3.32793, 0, 0, 0, 1, 1,
0.127335, -1.841137, 3.288141, 1, 1, 1, 1, 1,
0.1286095, 1.674954, -1.512394, 1, 1, 1, 1, 1,
0.1312912, 1.587417, -0.3225049, 1, 1, 1, 1, 1,
0.1348563, -2.045026, 1.345134, 1, 1, 1, 1, 1,
0.1349044, -0.4895098, 3.310806, 1, 1, 1, 1, 1,
0.1355133, -0.8490175, 2.56583, 1, 1, 1, 1, 1,
0.1392612, -1.101689, 2.917726, 1, 1, 1, 1, 1,
0.1423013, -0.1224285, 0.9501762, 1, 1, 1, 1, 1,
0.1439601, -0.4518623, 3.727442, 1, 1, 1, 1, 1,
0.1453853, -0.1135124, 2.212091, 1, 1, 1, 1, 1,
0.1509533, 0.04284322, 1.647525, 1, 1, 1, 1, 1,
0.1533182, -0.8428777, 4.573251, 1, 1, 1, 1, 1,
0.1536521, 0.5681812, 0.5143969, 1, 1, 1, 1, 1,
0.154803, 0.2575317, -0.08076191, 1, 1, 1, 1, 1,
0.1551143, -0.6766292, 3.679856, 1, 1, 1, 1, 1,
0.156443, 0.08100349, 1.352592, 0, 0, 1, 1, 1,
0.1655164, 0.02368579, 2.403237, 1, 0, 0, 1, 1,
0.1681635, 1.533228, 0.2096703, 1, 0, 0, 1, 1,
0.1712685, 1.537837, -1.04681, 1, 0, 0, 1, 1,
0.17205, -0.1151782, 2.290145, 1, 0, 0, 1, 1,
0.1736246, 0.6296893, 1.864071, 1, 0, 0, 1, 1,
0.1737901, -0.2175736, 2.974753, 0, 0, 0, 1, 1,
0.1747406, -0.07288857, 0.8841698, 0, 0, 0, 1, 1,
0.1761333, -0.4344582, 3.071487, 0, 0, 0, 1, 1,
0.1812842, -0.8115745, 1.956109, 0, 0, 0, 1, 1,
0.1832714, 0.5103073, 2.121145, 0, 0, 0, 1, 1,
0.1842349, -0.4270669, 1.855288, 0, 0, 0, 1, 1,
0.1873559, -0.5925, 2.854089, 0, 0, 0, 1, 1,
0.1891062, 0.4065762, -0.1370009, 1, 1, 1, 1, 1,
0.1901439, 0.4191859, 0.1723433, 1, 1, 1, 1, 1,
0.190442, 1.895451, 0.3488609, 1, 1, 1, 1, 1,
0.2003646, 0.7736257, -0.3295361, 1, 1, 1, 1, 1,
0.2030828, -0.1719635, 2.306644, 1, 1, 1, 1, 1,
0.2057818, -0.3060938, 1.279922, 1, 1, 1, 1, 1,
0.2157881, -0.103462, 0.4925408, 1, 1, 1, 1, 1,
0.2164048, 0.3363317, 1.289557, 1, 1, 1, 1, 1,
0.2209498, -0.2183475, 1.533671, 1, 1, 1, 1, 1,
0.2218241, 1.039288, 0.5092987, 1, 1, 1, 1, 1,
0.2228662, -0.0850723, 1.539756, 1, 1, 1, 1, 1,
0.2236968, 2.02807, -0.5049123, 1, 1, 1, 1, 1,
0.2240831, -0.05650299, 1.235605, 1, 1, 1, 1, 1,
0.2279985, 0.4989464, 0.4070562, 1, 1, 1, 1, 1,
0.2286287, -0.09037302, 2.02341, 1, 1, 1, 1, 1,
0.2400922, -1.255044, 4.053444, 0, 0, 1, 1, 1,
0.2420951, -1.104173, 1.530997, 1, 0, 0, 1, 1,
0.2429327, 0.4617718, 0.161275, 1, 0, 0, 1, 1,
0.2462332, -0.06647112, 2.134988, 1, 0, 0, 1, 1,
0.2477885, -1.501991, 3.345309, 1, 0, 0, 1, 1,
0.2492289, 0.316655, 1.516353, 1, 0, 0, 1, 1,
0.2500711, -0.4341249, 2.901397, 0, 0, 0, 1, 1,
0.2525955, -0.1311409, 1.148664, 0, 0, 0, 1, 1,
0.2537183, -0.8338728, 3.214853, 0, 0, 0, 1, 1,
0.2553891, 0.5156262, -0.4112723, 0, 0, 0, 1, 1,
0.2582131, 0.09531936, 0.7249788, 0, 0, 0, 1, 1,
0.2583612, 0.5419912, 0.4520862, 0, 0, 0, 1, 1,
0.2587596, -2.242207, 2.355832, 0, 0, 0, 1, 1,
0.2662759, 1.98127, 0.07753491, 1, 1, 1, 1, 1,
0.2669757, -2.740022, 2.14971, 1, 1, 1, 1, 1,
0.2672344, 1.718714, -0.7840201, 1, 1, 1, 1, 1,
0.267811, -0.2413563, 1.682832, 1, 1, 1, 1, 1,
0.2685539, 0.505422, 0.9701259, 1, 1, 1, 1, 1,
0.2688356, -1.230302, 1.49017, 1, 1, 1, 1, 1,
0.2692288, 0.5258288, 0.1793915, 1, 1, 1, 1, 1,
0.2705051, 0.01980029, 1.252375, 1, 1, 1, 1, 1,
0.2752403, -0.07300527, 1.063071, 1, 1, 1, 1, 1,
0.2797464, -0.3892735, 4.201692, 1, 1, 1, 1, 1,
0.2816017, -1.05424, 3.139803, 1, 1, 1, 1, 1,
0.2855518, 0.4169126, -0.6025918, 1, 1, 1, 1, 1,
0.2877127, 0.02185504, 0.212845, 1, 1, 1, 1, 1,
0.2898311, -0.4601424, 2.863769, 1, 1, 1, 1, 1,
0.2910518, 1.166978, 1.314535, 1, 1, 1, 1, 1,
0.2912315, -0.7464337, 2.823416, 0, 0, 1, 1, 1,
0.2927775, 0.5748951, -0.2954149, 1, 0, 0, 1, 1,
0.2935656, 0.923046, 0.4226563, 1, 0, 0, 1, 1,
0.2951475, -1.200143, 1.637861, 1, 0, 0, 1, 1,
0.295545, -1.106791, 4.237195, 1, 0, 0, 1, 1,
0.3020807, 0.6949579, 1.270781, 1, 0, 0, 1, 1,
0.3060111, 0.3263309, 2.620728, 0, 0, 0, 1, 1,
0.3060383, 0.4807147, 0.5200711, 0, 0, 0, 1, 1,
0.3169839, 0.4328391, -0.4754812, 0, 0, 0, 1, 1,
0.3169839, -1.491654, 1.417702, 0, 0, 0, 1, 1,
0.321937, 0.09039042, 1.407454, 0, 0, 0, 1, 1,
0.3231788, -2.031173, 4.747636, 0, 0, 0, 1, 1,
0.3284226, 0.3104659, 2.544858, 0, 0, 0, 1, 1,
0.3318307, -0.4950869, 3.097625, 1, 1, 1, 1, 1,
0.3330131, -0.5733253, 2.632619, 1, 1, 1, 1, 1,
0.3350438, -0.5061412, 2.780112, 1, 1, 1, 1, 1,
0.3373252, -0.9415396, 5.834426, 1, 1, 1, 1, 1,
0.3377389, 2.023608, 1.573996, 1, 1, 1, 1, 1,
0.3394245, -0.3134272, 1.649989, 1, 1, 1, 1, 1,
0.3395941, 0.6325136, 1.558066, 1, 1, 1, 1, 1,
0.3409566, 0.3846541, 1.460642, 1, 1, 1, 1, 1,
0.3420512, 0.9738442, -0.1150368, 1, 1, 1, 1, 1,
0.3437201, -0.7557239, 2.198985, 1, 1, 1, 1, 1,
0.3464791, 0.7941743, 1.024759, 1, 1, 1, 1, 1,
0.3486112, -0.5699381, 4.279445, 1, 1, 1, 1, 1,
0.3528488, 0.6294857, 0.6531541, 1, 1, 1, 1, 1,
0.3579597, -1.023823, 4.5946, 1, 1, 1, 1, 1,
0.3594107, -0.8913935, 2.582404, 1, 1, 1, 1, 1,
0.3602808, -0.238561, 3.309673, 0, 0, 1, 1, 1,
0.3631686, -1.778229, 2.407725, 1, 0, 0, 1, 1,
0.3685771, 0.2008519, 2.314515, 1, 0, 0, 1, 1,
0.3715986, 0.1805003, 0.1063317, 1, 0, 0, 1, 1,
0.3723282, -1.637971, 2.779426, 1, 0, 0, 1, 1,
0.3859251, -0.5012078, 4.36364, 1, 0, 0, 1, 1,
0.3952081, -1.742694, 4.794066, 0, 0, 0, 1, 1,
0.4000129, -0.1282951, 3.652204, 0, 0, 0, 1, 1,
0.4006166, 0.4851818, 2.092155, 0, 0, 0, 1, 1,
0.4035843, -0.6050212, 3.888623, 0, 0, 0, 1, 1,
0.4043454, 0.1116517, 0.2888945, 0, 0, 0, 1, 1,
0.4056367, -0.04918595, 1.928176, 0, 0, 0, 1, 1,
0.4100704, 0.6621436, -0.6092803, 0, 0, 0, 1, 1,
0.4116369, -0.3134762, 4.135296, 1, 1, 1, 1, 1,
0.4129516, -0.08942631, 2.452074, 1, 1, 1, 1, 1,
0.4162028, 0.5072705, 0.5890116, 1, 1, 1, 1, 1,
0.4167256, 0.7067184, -0.581679, 1, 1, 1, 1, 1,
0.4186637, -1.551884, 3.286685, 1, 1, 1, 1, 1,
0.4234243, 0.5255523, 0.3416542, 1, 1, 1, 1, 1,
0.4238566, -3.131708, 2.052368, 1, 1, 1, 1, 1,
0.4241562, 0.2715842, 0.4849558, 1, 1, 1, 1, 1,
0.4243094, -1.143722, 2.951245, 1, 1, 1, 1, 1,
0.4250684, -0.4957068, 1.958018, 1, 1, 1, 1, 1,
0.4291593, 0.120674, -0.4907998, 1, 1, 1, 1, 1,
0.4310783, 0.2924988, 0.6049492, 1, 1, 1, 1, 1,
0.4313939, 1.047002, -2.250552, 1, 1, 1, 1, 1,
0.4319967, 0.217239, -0.1221058, 1, 1, 1, 1, 1,
0.4364077, -1.185664, 1.968812, 1, 1, 1, 1, 1,
0.4394462, -0.9295607, 2.530883, 0, 0, 1, 1, 1,
0.4413119, -0.02629473, 1.754498, 1, 0, 0, 1, 1,
0.4416133, -0.3843582, 2.076341, 1, 0, 0, 1, 1,
0.4425455, -1.740806, 2.361471, 1, 0, 0, 1, 1,
0.4435636, -0.1207694, 3.188884, 1, 0, 0, 1, 1,
0.444786, -1.044694, 3.078081, 1, 0, 0, 1, 1,
0.453509, -0.3257857, 2.461244, 0, 0, 0, 1, 1,
0.4562454, 0.6796873, 0.5267919, 0, 0, 0, 1, 1,
0.4599399, 2.055024, 0.7030187, 0, 0, 0, 1, 1,
0.4613679, 0.5360444, -0.3102555, 0, 0, 0, 1, 1,
0.4660815, -1.082319, 2.065769, 0, 0, 0, 1, 1,
0.4687136, 2.271387, 0.4368616, 0, 0, 0, 1, 1,
0.474253, -0.2329203, 2.424741, 0, 0, 0, 1, 1,
0.474541, -0.05386403, 2.898267, 1, 1, 1, 1, 1,
0.4776312, -0.4727724, 1.173757, 1, 1, 1, 1, 1,
0.4797034, 1.771744, 0.2145894, 1, 1, 1, 1, 1,
0.4803724, 0.593844, 2.236343, 1, 1, 1, 1, 1,
0.4836366, -0.3485345, 1.757953, 1, 1, 1, 1, 1,
0.4837614, 1.270197, -0.04026762, 1, 1, 1, 1, 1,
0.4840673, 0.172523, 1.065805, 1, 1, 1, 1, 1,
0.4854839, 0.08315352, 2.078304, 1, 1, 1, 1, 1,
0.4907639, 0.6580812, -0.5162938, 1, 1, 1, 1, 1,
0.4909945, -0.9166111, 2.269854, 1, 1, 1, 1, 1,
0.4941736, -0.2623071, 0.9330109, 1, 1, 1, 1, 1,
0.4944825, -0.8138285, 1.7762, 1, 1, 1, 1, 1,
0.5003387, -0.1780256, 2.998992, 1, 1, 1, 1, 1,
0.5016805, -0.3311553, 1.686665, 1, 1, 1, 1, 1,
0.5024219, 1.900755, -0.411127, 1, 1, 1, 1, 1,
0.5036511, -0.604811, 3.211249, 0, 0, 1, 1, 1,
0.505486, 0.3350791, 1.804323, 1, 0, 0, 1, 1,
0.508903, -1.627531, 2.221031, 1, 0, 0, 1, 1,
0.5104557, -0.9337872, 3.14648, 1, 0, 0, 1, 1,
0.5113548, 1.174318, 0.6230742, 1, 0, 0, 1, 1,
0.5155499, -0.4146236, 0.6005158, 1, 0, 0, 1, 1,
0.5258402, -1.16335, 1.24392, 0, 0, 0, 1, 1,
0.5289904, 0.3152274, 1.303299, 0, 0, 0, 1, 1,
0.5294443, 0.2167879, -1.184204, 0, 0, 0, 1, 1,
0.531069, 1.383884, -1.730267, 0, 0, 0, 1, 1,
0.5378605, 1.274017, -0.1097327, 0, 0, 0, 1, 1,
0.5396759, 0.864215, 0.5767556, 0, 0, 0, 1, 1,
0.5409079, 0.7255156, 0.7339802, 0, 0, 0, 1, 1,
0.5413085, 0.2013786, 0.07301856, 1, 1, 1, 1, 1,
0.543626, -1.195988, 3.137191, 1, 1, 1, 1, 1,
0.5444002, -1.128567, 2.745343, 1, 1, 1, 1, 1,
0.5480214, 0.4279467, 1.962105, 1, 1, 1, 1, 1,
0.5538139, -1.954465, 2.739434, 1, 1, 1, 1, 1,
0.5541381, 0.7684356, -0.3818322, 1, 1, 1, 1, 1,
0.5545702, 0.4697184, 0.2145659, 1, 1, 1, 1, 1,
0.5582467, 0.1363342, 0.5491223, 1, 1, 1, 1, 1,
0.5590463, 2.048881, 0.8071512, 1, 1, 1, 1, 1,
0.5633622, 0.8294615, -0.3901641, 1, 1, 1, 1, 1,
0.5637668, -0.8578896, 3.182337, 1, 1, 1, 1, 1,
0.5664675, 1.282459, -0.8712242, 1, 1, 1, 1, 1,
0.5666276, 0.6498492, -0.9202573, 1, 1, 1, 1, 1,
0.5730109, -0.8347437, 4.190946, 1, 1, 1, 1, 1,
0.5731097, -0.9624906, 3.103781, 1, 1, 1, 1, 1,
0.5778019, -0.3722427, 0.8285614, 0, 0, 1, 1, 1,
0.5787651, 0.4707201, 1.018651, 1, 0, 0, 1, 1,
0.5870779, -0.4217122, 1.796377, 1, 0, 0, 1, 1,
0.5891225, -0.8657611, 3.332891, 1, 0, 0, 1, 1,
0.5952538, -0.1217917, 0.3747768, 1, 0, 0, 1, 1,
0.6035607, -0.8228372, 4.890135, 1, 0, 0, 1, 1,
0.6058105, 0.6692992, -0.1926834, 0, 0, 0, 1, 1,
0.6181369, 0.4532843, -0.36038, 0, 0, 0, 1, 1,
0.6215159, 1.283205, -0.548353, 0, 0, 0, 1, 1,
0.6215814, 1.28858, 1.140405, 0, 0, 0, 1, 1,
0.6218156, -0.7105727, 2.178442, 0, 0, 0, 1, 1,
0.6265831, -0.9584645, 2.044849, 0, 0, 0, 1, 1,
0.630259, -0.2250623, 1.521535, 0, 0, 0, 1, 1,
0.6325767, 1.485837, 0.7781475, 1, 1, 1, 1, 1,
0.6385184, -0.7544585, 1.338649, 1, 1, 1, 1, 1,
0.6407286, -0.5545186, 1.527514, 1, 1, 1, 1, 1,
0.6463243, -1.284759, 2.745708, 1, 1, 1, 1, 1,
0.6475347, -0.006762159, 3.459708, 1, 1, 1, 1, 1,
0.6481242, 0.8120101, 0.82451, 1, 1, 1, 1, 1,
0.6570404, 0.1312822, -0.3997661, 1, 1, 1, 1, 1,
0.6596573, -1.344403, 2.036869, 1, 1, 1, 1, 1,
0.6643348, -0.5185037, 2.801749, 1, 1, 1, 1, 1,
0.6657016, -0.08955394, 1.000229, 1, 1, 1, 1, 1,
0.6676662, 1.565566, -2.867107, 1, 1, 1, 1, 1,
0.6691791, 0.192069, -1.436394, 1, 1, 1, 1, 1,
0.6715183, -1.228366, 4.403917, 1, 1, 1, 1, 1,
0.6723723, -1.089473, 2.615601, 1, 1, 1, 1, 1,
0.6799827, 0.04745478, 0.8688483, 1, 1, 1, 1, 1,
0.6814249, 0.9291084, 0.4989333, 0, 0, 1, 1, 1,
0.6852451, 1.249203, 1.541623, 1, 0, 0, 1, 1,
0.6855959, 0.6485841, 2.216447, 1, 0, 0, 1, 1,
0.6856647, -0.750399, 2.661312, 1, 0, 0, 1, 1,
0.6861441, -1.340298, 2.320992, 1, 0, 0, 1, 1,
0.6883349, -0.29362, 0.180837, 1, 0, 0, 1, 1,
0.6884931, -0.869525, 0.9889495, 0, 0, 0, 1, 1,
0.6896126, 0.113798, 0.0392166, 0, 0, 0, 1, 1,
0.7003059, 0.9175094, 0.7266672, 0, 0, 0, 1, 1,
0.7061934, -0.4431458, 1.257723, 0, 0, 0, 1, 1,
0.7066075, -0.8596127, 2.997589, 0, 0, 0, 1, 1,
0.7072237, 0.2862336, 1.969901, 0, 0, 0, 1, 1,
0.7130159, 0.6611893, 0.3836673, 0, 0, 0, 1, 1,
0.7142381, -1.265018, 2.491964, 1, 1, 1, 1, 1,
0.7168349, -0.2009931, 2.799761, 1, 1, 1, 1, 1,
0.7190124, -0.04245293, -0.2873553, 1, 1, 1, 1, 1,
0.7220959, -1.213932, 2.402304, 1, 1, 1, 1, 1,
0.7260555, 0.3083529, 2.213287, 1, 1, 1, 1, 1,
0.7281644, -0.603575, 2.207854, 1, 1, 1, 1, 1,
0.7383869, -0.3135841, 2.061119, 1, 1, 1, 1, 1,
0.739319, 0.06551824, 2.147166, 1, 1, 1, 1, 1,
0.7412858, 3.684189, -0.9301003, 1, 1, 1, 1, 1,
0.7428119, 0.2597294, 2.125041, 1, 1, 1, 1, 1,
0.7449681, -1.413509, 3.357917, 1, 1, 1, 1, 1,
0.7455357, 1.661845, 0.09410287, 1, 1, 1, 1, 1,
0.7493271, 2.141693, 0.3004121, 1, 1, 1, 1, 1,
0.7503813, 0.2519878, 1.77996, 1, 1, 1, 1, 1,
0.7585672, -1.362916, 4.320389, 1, 1, 1, 1, 1,
0.7674373, -0.2282686, 0.04994627, 0, 0, 1, 1, 1,
0.7775109, 0.3604953, -0.1716687, 1, 0, 0, 1, 1,
0.7783505, 0.9225852, 1.433484, 1, 0, 0, 1, 1,
0.7842174, -0.3616178, 0.9415167, 1, 0, 0, 1, 1,
0.7878221, -1.060989, 1.621014, 1, 0, 0, 1, 1,
0.7894408, 0.9761515, 1.217613, 1, 0, 0, 1, 1,
0.791698, 1.359591, 1.40633, 0, 0, 0, 1, 1,
0.792789, -0.4228803, 1.260332, 0, 0, 0, 1, 1,
0.7980944, -2.245112, 2.419768, 0, 0, 0, 1, 1,
0.8007988, -1.052862, 4.427406, 0, 0, 0, 1, 1,
0.8094421, 0.9229488, 0.8770413, 0, 0, 0, 1, 1,
0.8110157, -0.4275175, 1.285292, 0, 0, 0, 1, 1,
0.8132188, 1.301496, 1.119873, 0, 0, 0, 1, 1,
0.8177722, -0.4069201, -1.020552, 1, 1, 1, 1, 1,
0.8188091, 1.185873, 1.039692, 1, 1, 1, 1, 1,
0.8206858, -1.094703, 0.6412579, 1, 1, 1, 1, 1,
0.8264073, -0.9347801, 1.408038, 1, 1, 1, 1, 1,
0.8278741, 0.2248781, 3.609162, 1, 1, 1, 1, 1,
0.831066, -1.52025, 2.842156, 1, 1, 1, 1, 1,
0.8412328, 1.972384, 0.9216403, 1, 1, 1, 1, 1,
0.8427833, 0.03604433, 2.295004, 1, 1, 1, 1, 1,
0.8435894, 0.0827226, 2.820554, 1, 1, 1, 1, 1,
0.8482253, 0.5661256, 0.2349741, 1, 1, 1, 1, 1,
0.848335, -0.8637507, 3.052428, 1, 1, 1, 1, 1,
0.848912, 0.3751656, 0.5406964, 1, 1, 1, 1, 1,
0.8557667, -0.8123239, 2.579879, 1, 1, 1, 1, 1,
0.8598473, 0.3950306, 1.31998, 1, 1, 1, 1, 1,
0.8605058, -0.7685732, 0.1661181, 1, 1, 1, 1, 1,
0.8611475, 0.142859, 2.301667, 0, 0, 1, 1, 1,
0.8712025, 0.4957637, 1.364764, 1, 0, 0, 1, 1,
0.8728316, 2.602394, -0.1503164, 1, 0, 0, 1, 1,
0.8858285, 1.067793, 1.644482, 1, 0, 0, 1, 1,
0.8999552, 2.185399, 1.54839, 1, 0, 0, 1, 1,
0.9001094, 0.08520376, 1.285876, 1, 0, 0, 1, 1,
0.9008238, -0.8003643, 2.605941, 0, 0, 0, 1, 1,
0.9053106, -1.071805, 3.027186, 0, 0, 0, 1, 1,
0.9179707, 0.8076119, -0.4883173, 0, 0, 0, 1, 1,
0.9217448, 0.3342805, 1.649057, 0, 0, 0, 1, 1,
0.9242086, 0.4032607, 1.76344, 0, 0, 0, 1, 1,
0.9307734, 0.149531, 2.018207, 0, 0, 0, 1, 1,
0.9311332, -1.290176, 0.7255922, 0, 0, 0, 1, 1,
0.9363843, -0.3822697, 1.945178, 1, 1, 1, 1, 1,
0.9420194, 0.912271, -0.3896282, 1, 1, 1, 1, 1,
0.9473804, -0.5565891, 3.2564, 1, 1, 1, 1, 1,
0.9519088, -0.1665623, 1.001917, 1, 1, 1, 1, 1,
0.9558187, -0.634131, 2.762868, 1, 1, 1, 1, 1,
0.9601337, -0.06478275, 2.008033, 1, 1, 1, 1, 1,
0.9696823, 0.5331597, 1.849068, 1, 1, 1, 1, 1,
0.9708443, 0.3446505, 0.5429724, 1, 1, 1, 1, 1,
0.9977837, -1.122068, 1.703182, 1, 1, 1, 1, 1,
1.011398, -1.53171, 2.276908, 1, 1, 1, 1, 1,
1.015848, -0.9746252, 3.104738, 1, 1, 1, 1, 1,
1.02059, -0.3397493, 2.126836, 1, 1, 1, 1, 1,
1.022755, -0.1570604, 0.7402703, 1, 1, 1, 1, 1,
1.033449, 1.067125, 1.28959, 1, 1, 1, 1, 1,
1.038628, -0.6121528, 2.394164, 1, 1, 1, 1, 1,
1.041741, 0.7333143, 1.145321, 0, 0, 1, 1, 1,
1.042697, -1.60691, 2.83359, 1, 0, 0, 1, 1,
1.043334, 0.09577572, 1.352903, 1, 0, 0, 1, 1,
1.059306, -0.2525992, 1.376806, 1, 0, 0, 1, 1,
1.060131, 0.2487154, 1.730466, 1, 0, 0, 1, 1,
1.062111, 0.5058921, 1.983946, 1, 0, 0, 1, 1,
1.062806, 1.623703, -0.6904285, 0, 0, 0, 1, 1,
1.065846, -0.4981831, 1.348946, 0, 0, 0, 1, 1,
1.070311, 0.04938543, 1.727453, 0, 0, 0, 1, 1,
1.073593, 0.2490748, 0.8522586, 0, 0, 0, 1, 1,
1.075199, -1.08294, 1.081843, 0, 0, 0, 1, 1,
1.077639, 1.677283, 0.6272898, 0, 0, 0, 1, 1,
1.080089, 0.157875, 2.223099, 0, 0, 0, 1, 1,
1.081275, -0.4799446, 1.377941, 1, 1, 1, 1, 1,
1.084545, -0.3229793, 2.206982, 1, 1, 1, 1, 1,
1.084788, -1.369109, 3.12501, 1, 1, 1, 1, 1,
1.086653, -0.03044707, 2.373017, 1, 1, 1, 1, 1,
1.090582, -0.4726518, 2.699553, 1, 1, 1, 1, 1,
1.091236, -0.6833099, 1.896501, 1, 1, 1, 1, 1,
1.101155, -0.1606134, 2.333795, 1, 1, 1, 1, 1,
1.111408, 0.9633012, -0.2807111, 1, 1, 1, 1, 1,
1.115365, -0.1066822, 0.1662701, 1, 1, 1, 1, 1,
1.121309, -1.490553, 4.135377, 1, 1, 1, 1, 1,
1.127305, 0.3002851, 1.26885, 1, 1, 1, 1, 1,
1.129485, -1.612111, 1.533763, 1, 1, 1, 1, 1,
1.138564, -2.022486, 2.76659, 1, 1, 1, 1, 1,
1.152646, -3.515993, 0.8015812, 1, 1, 1, 1, 1,
1.157606, -1.112596, 3.020019, 1, 1, 1, 1, 1,
1.158152, -0.2727869, 2.155409, 0, 0, 1, 1, 1,
1.158383, -0.7464716, 2.689521, 1, 0, 0, 1, 1,
1.161759, -1.650519, 3.567412, 1, 0, 0, 1, 1,
1.162351, -0.2266455, 1.044916, 1, 0, 0, 1, 1,
1.176489, -1.747395, 1.106461, 1, 0, 0, 1, 1,
1.179183, 0.5785135, 0.1839993, 1, 0, 0, 1, 1,
1.181587, -0.552139, 2.79224, 0, 0, 0, 1, 1,
1.188885, 1.49549, 0.8282868, 0, 0, 0, 1, 1,
1.199739, 0.4540438, 1.455252, 0, 0, 0, 1, 1,
1.200986, 0.2419062, -0.4156454, 0, 0, 0, 1, 1,
1.201209, 0.3065193, 1.126859, 0, 0, 0, 1, 1,
1.206583, 1.277738, 1.274444, 0, 0, 0, 1, 1,
1.210897, -0.6051065, 2.997708, 0, 0, 0, 1, 1,
1.226474, -0.0201295, 2.296027, 1, 1, 1, 1, 1,
1.229675, -0.9030058, 1.407171, 1, 1, 1, 1, 1,
1.230387, 0.3691011, 0.6110386, 1, 1, 1, 1, 1,
1.235093, 0.06726475, 3.570676, 1, 1, 1, 1, 1,
1.242192, -2.037811, 3.002667, 1, 1, 1, 1, 1,
1.247682, -0.8828953, 1.468058, 1, 1, 1, 1, 1,
1.248307, 0.5236279, 0.5757402, 1, 1, 1, 1, 1,
1.250756, -0.5281289, 2.621636, 1, 1, 1, 1, 1,
1.256018, 0.5454558, 0.7417359, 1, 1, 1, 1, 1,
1.265043, -0.4446261, 2.219026, 1, 1, 1, 1, 1,
1.270793, 0.2457341, 0.3178314, 1, 1, 1, 1, 1,
1.273087, 0.8982103, 1.768645, 1, 1, 1, 1, 1,
1.280034, -0.7184401, 1.178767, 1, 1, 1, 1, 1,
1.29603, -0.376214, 2.996697, 1, 1, 1, 1, 1,
1.297458, 0.556959, 1.539366, 1, 1, 1, 1, 1,
1.298275, 0.2026941, 1.995759, 0, 0, 1, 1, 1,
1.313271, 2.121344, 0.4853301, 1, 0, 0, 1, 1,
1.324314, -1.737319, 2.750193, 1, 0, 0, 1, 1,
1.333382, -0.4420945, 3.13129, 1, 0, 0, 1, 1,
1.341293, 0.0610478, 1.7238, 1, 0, 0, 1, 1,
1.35052, -0.3708566, 3.501398, 1, 0, 0, 1, 1,
1.359504, 0.7837844, 3.0657, 0, 0, 0, 1, 1,
1.362462, -2.2573, 2.203151, 0, 0, 0, 1, 1,
1.367661, 0.4805206, 1.237622, 0, 0, 0, 1, 1,
1.369564, 0.6545287, -0.8030818, 0, 0, 0, 1, 1,
1.373502, 0.2276736, 2.190847, 0, 0, 0, 1, 1,
1.385857, 0.9658298, 2.871814, 0, 0, 0, 1, 1,
1.396335, -0.5678179, 2.354035, 0, 0, 0, 1, 1,
1.397712, -1.00515, 3.178781, 1, 1, 1, 1, 1,
1.40889, -0.6695533, 3.232014, 1, 1, 1, 1, 1,
1.411269, 1.35859, -1.088174, 1, 1, 1, 1, 1,
1.415275, 0.2007072, 1.99997, 1, 1, 1, 1, 1,
1.416883, -0.278913, 1.69227, 1, 1, 1, 1, 1,
1.417013, 0.5137116, 0.9763061, 1, 1, 1, 1, 1,
1.41859, -1.642052, 2.92069, 1, 1, 1, 1, 1,
1.425517, 1.067768, 1.011502, 1, 1, 1, 1, 1,
1.434584, -0.07028975, 1.636082, 1, 1, 1, 1, 1,
1.446855, -0.1938086, 2.446409, 1, 1, 1, 1, 1,
1.457183, 0.008053024, 1.937027, 1, 1, 1, 1, 1,
1.457618, 0.2241045, 0.04505113, 1, 1, 1, 1, 1,
1.468481, -0.6011526, 2.480783, 1, 1, 1, 1, 1,
1.475518, -1.313007, 3.144617, 1, 1, 1, 1, 1,
1.477543, 2.449381, 0.02031394, 1, 1, 1, 1, 1,
1.478835, -0.7580804, 0.9434292, 0, 0, 1, 1, 1,
1.486034, -1.917501, 2.550641, 1, 0, 0, 1, 1,
1.498407, 0.6722328, 0.1384264, 1, 0, 0, 1, 1,
1.505995, -1.873197, 1.251041, 1, 0, 0, 1, 1,
1.523611, 0.1806621, 2.381027, 1, 0, 0, 1, 1,
1.525444, -0.5980485, 2.754648, 1, 0, 0, 1, 1,
1.536628, 0.3157203, 1.076698, 0, 0, 0, 1, 1,
1.538818, -1.955957, 3.741352, 0, 0, 0, 1, 1,
1.543003, -1.405298, 0.7397293, 0, 0, 0, 1, 1,
1.544607, -0.6953301, 0.4014315, 0, 0, 0, 1, 1,
1.547071, 1.674854, 1.241487, 0, 0, 0, 1, 1,
1.566779, 1.306968, 0.2812105, 0, 0, 0, 1, 1,
1.570292, 0.2059967, 1.068933, 0, 0, 0, 1, 1,
1.571385, 0.5538649, 1.409381, 1, 1, 1, 1, 1,
1.573042, 0.3156372, 2.034621, 1, 1, 1, 1, 1,
1.574288, -1.792308, 3.942908, 1, 1, 1, 1, 1,
1.577425, -0.2056588, 1.873217, 1, 1, 1, 1, 1,
1.581008, -0.5052196, 2.376232, 1, 1, 1, 1, 1,
1.581525, 1.420225, 0.9404797, 1, 1, 1, 1, 1,
1.585665, -0.1871923, 0.3651863, 1, 1, 1, 1, 1,
1.587393, -1.084944, 1.98262, 1, 1, 1, 1, 1,
1.58748, -0.9481758, 2.299909, 1, 1, 1, 1, 1,
1.602441, 0.8101617, -0.2481731, 1, 1, 1, 1, 1,
1.612024, -1.067433, 1.545665, 1, 1, 1, 1, 1,
1.63614, -0.08710986, 3.493675, 1, 1, 1, 1, 1,
1.637257, -0.3328665, 1.526838, 1, 1, 1, 1, 1,
1.651971, 0.02948181, 1.152192, 1, 1, 1, 1, 1,
1.653442, 0.1341808, 0.9706108, 1, 1, 1, 1, 1,
1.665235, 1.474577, 0.5704655, 0, 0, 1, 1, 1,
1.681141, -0.3901103, 1.239631, 1, 0, 0, 1, 1,
1.70937, -0.6244074, 0.1014891, 1, 0, 0, 1, 1,
1.710995, 0.3651121, 2.883477, 1, 0, 0, 1, 1,
1.734793, 0.2314847, 1.765892, 1, 0, 0, 1, 1,
1.736575, -0.5404695, 2.776852, 1, 0, 0, 1, 1,
1.751982, 0.9605731, 0.770557, 0, 0, 0, 1, 1,
1.757858, 0.1301221, 1.16676, 0, 0, 0, 1, 1,
1.761557, 0.4096901, 0.2316294, 0, 0, 0, 1, 1,
1.768938, 1.007766, -0.06605085, 0, 0, 0, 1, 1,
1.771503, -1.665556, 0.6549187, 0, 0, 0, 1, 1,
1.785473, -0.002172074, 1.525066, 0, 0, 0, 1, 1,
1.798275, 1.20422, 3.295755, 0, 0, 0, 1, 1,
1.800864, 0.8302586, -0.7847273, 1, 1, 1, 1, 1,
1.802235, 0.763534, 2.671132, 1, 1, 1, 1, 1,
1.810112, -0.03809785, 0.8680787, 1, 1, 1, 1, 1,
1.826189, 0.4299793, 0.9197203, 1, 1, 1, 1, 1,
1.829041, 1.107609, 3.465093, 1, 1, 1, 1, 1,
1.834382, 1.583652, 2.828456, 1, 1, 1, 1, 1,
1.840526, -0.08771817, 2.226283, 1, 1, 1, 1, 1,
1.844522, 1.108321, -0.629782, 1, 1, 1, 1, 1,
1.885768, 0.6705604, 1.432204, 1, 1, 1, 1, 1,
1.900153, 0.6673577, 3.01319, 1, 1, 1, 1, 1,
1.929915, 0.2711475, 1.058223, 1, 1, 1, 1, 1,
1.939567, -1.44556, 2.866538, 1, 1, 1, 1, 1,
1.949484, -1.597871, 3.518025, 1, 1, 1, 1, 1,
1.976677, -0.9448354, 3.23027, 1, 1, 1, 1, 1,
1.977858, -1.166814, 2.589075, 1, 1, 1, 1, 1,
1.990239, -1.247227, 3.191565, 0, 0, 1, 1, 1,
2.042645, -0.797197, 2.499017, 1, 0, 0, 1, 1,
2.043423, -0.2414207, 0.5327585, 1, 0, 0, 1, 1,
2.064227, -2.756297, 2.768721, 1, 0, 0, 1, 1,
2.207521, 0.1887359, 1.422006, 1, 0, 0, 1, 1,
2.245442, -0.03299668, 1.136366, 1, 0, 0, 1, 1,
2.256155, 0.3599944, 1.073618, 0, 0, 0, 1, 1,
2.343707, -1.058137, 2.086494, 0, 0, 0, 1, 1,
2.372324, 0.376705, 2.276299, 0, 0, 0, 1, 1,
2.451442, -2.311506, 3.00845, 0, 0, 0, 1, 1,
2.4548, 0.1155199, 2.48303, 0, 0, 0, 1, 1,
2.489101, -0.3808813, 1.622226, 0, 0, 0, 1, 1,
2.511312, 1.219129, 0.6084707, 0, 0, 0, 1, 1,
2.514248, 0.4072424, 0.2651085, 1, 1, 1, 1, 1,
2.546964, 1.812651, 1.149028, 1, 1, 1, 1, 1,
2.554769, 0.8749239, 0.9853376, 1, 1, 1, 1, 1,
2.623635, -0.9658299, 1.348051, 1, 1, 1, 1, 1,
2.664559, 2.019246, 0.7035981, 1, 1, 1, 1, 1,
3.113641, 1.225205, 0.4114914, 1, 1, 1, 1, 1,
3.390629, -0.9197094, 2.812674, 1, 1, 1, 1, 1
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
var radius = 10.08937;
var distance = 35.43847;
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
mvMatrix.translate( 0.1700957, -0.08409786, -0.3407903 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.43847);
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
