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
-3.385511, 0.6944451, -1.952631, 1, 0, 0, 1,
-3.104032, 1.881163, -0.6168941, 1, 0.007843138, 0, 1,
-2.84897, 0.5032893, 0.707822, 1, 0.01176471, 0, 1,
-2.789666, 0.5263965, -1.502387, 1, 0.01960784, 0, 1,
-2.615846, 0.7521827, -1.137642, 1, 0.02352941, 0, 1,
-2.454249, -0.09245964, -0.5375845, 1, 0.03137255, 0, 1,
-2.449574, 0.4136793, -4.539639, 1, 0.03529412, 0, 1,
-2.428554, -0.08414516, -0.7197917, 1, 0.04313726, 0, 1,
-2.419535, 2.819413, -0.8503668, 1, 0.04705882, 0, 1,
-2.309793, 0.5539296, -2.180376, 1, 0.05490196, 0, 1,
-2.199331, -0.4125233, -2.820791, 1, 0.05882353, 0, 1,
-2.156817, 0.9908271, -1.352726, 1, 0.06666667, 0, 1,
-2.153114, -1.138343, -1.144045, 1, 0.07058824, 0, 1,
-2.135597, -1.860872, -0.3593653, 1, 0.07843138, 0, 1,
-2.132025, 0.7684919, -1.029397, 1, 0.08235294, 0, 1,
-2.106044, -0.01852866, -1.672805, 1, 0.09019608, 0, 1,
-2.065392, -1.921757, -2.487213, 1, 0.09411765, 0, 1,
-2.021762, -0.6302618, -2.144091, 1, 0.1019608, 0, 1,
-2.015661, -1.259691, -3.879385, 1, 0.1098039, 0, 1,
-1.988639, 0.3514043, -0.6837163, 1, 0.1137255, 0, 1,
-1.984111, -1.106856, -0.5116745, 1, 0.1215686, 0, 1,
-1.978615, -1.339727, -3.694355, 1, 0.1254902, 0, 1,
-1.923716, -0.436352, -1.98529, 1, 0.1333333, 0, 1,
-1.872534, 1.263841, -0.8570605, 1, 0.1372549, 0, 1,
-1.847333, 1.048042, -1.724354, 1, 0.145098, 0, 1,
-1.842204, 0.7872318, -0.1839704, 1, 0.1490196, 0, 1,
-1.827516, -0.5728785, -3.335372, 1, 0.1568628, 0, 1,
-1.794629, 0.9206249, -1.126824, 1, 0.1607843, 0, 1,
-1.789759, 1.035264, -2.324066, 1, 0.1686275, 0, 1,
-1.780258, 1.084778, -2.28468, 1, 0.172549, 0, 1,
-1.737255, 0.6250975, -2.197448, 1, 0.1803922, 0, 1,
-1.710121, 2.064222, -1.359215, 1, 0.1843137, 0, 1,
-1.710058, 0.3762383, -0.2459767, 1, 0.1921569, 0, 1,
-1.69622, -0.1253919, -2.40223, 1, 0.1960784, 0, 1,
-1.695049, 0.3441758, -2.146334, 1, 0.2039216, 0, 1,
-1.659944, 0.1714451, -0.8238493, 1, 0.2117647, 0, 1,
-1.654433, 2.194629, 0.3430059, 1, 0.2156863, 0, 1,
-1.649482, 1.700469, -0.8878967, 1, 0.2235294, 0, 1,
-1.642868, 0.2604703, -1.040507, 1, 0.227451, 0, 1,
-1.637478, 0.145675, -2.811939, 1, 0.2352941, 0, 1,
-1.627727, 0.2007687, -2.432891, 1, 0.2392157, 0, 1,
-1.627107, -0.9249346, -1.030825, 1, 0.2470588, 0, 1,
-1.606138, 0.5189266, -0.8290071, 1, 0.2509804, 0, 1,
-1.595348, 0.4209828, -1.127138, 1, 0.2588235, 0, 1,
-1.570666, -0.4808631, -1.068227, 1, 0.2627451, 0, 1,
-1.560606, 1.161074, -1.928946, 1, 0.2705882, 0, 1,
-1.558203, 0.439425, -1.680243, 1, 0.2745098, 0, 1,
-1.546224, -1.304006, -1.412223, 1, 0.282353, 0, 1,
-1.542714, 0.6864247, -1.994158, 1, 0.2862745, 0, 1,
-1.516553, 1.830538, -1.755023, 1, 0.2941177, 0, 1,
-1.487656, 0.342887, -0.9253039, 1, 0.3019608, 0, 1,
-1.48531, -0.5671831, -1.934637, 1, 0.3058824, 0, 1,
-1.479737, 0.6805797, -0.6730588, 1, 0.3137255, 0, 1,
-1.477418, -0.8506772, -2.882835, 1, 0.3176471, 0, 1,
-1.473957, -0.03061786, -0.7920725, 1, 0.3254902, 0, 1,
-1.470235, -0.1206683, -0.5745243, 1, 0.3294118, 0, 1,
-1.454461, -0.356878, -2.025675, 1, 0.3372549, 0, 1,
-1.450161, 1.575496, -1.538263, 1, 0.3411765, 0, 1,
-1.441748, 0.4897834, -3.015143, 1, 0.3490196, 0, 1,
-1.440822, 0.4060782, -0.5646721, 1, 0.3529412, 0, 1,
-1.435814, 1.247952, -1.630114, 1, 0.3607843, 0, 1,
-1.431261, 0.9689283, -1.878143, 1, 0.3647059, 0, 1,
-1.429046, -1.553953, -1.833129, 1, 0.372549, 0, 1,
-1.428823, -0.9035167, -3.641064, 1, 0.3764706, 0, 1,
-1.427565, -0.3924315, -2.473785, 1, 0.3843137, 0, 1,
-1.403747, 0.667011, -0.973181, 1, 0.3882353, 0, 1,
-1.403532, 0.5389745, -1.22709, 1, 0.3960784, 0, 1,
-1.393627, -0.7103193, -3.45472, 1, 0.4039216, 0, 1,
-1.361579, 0.2249388, -1.582026, 1, 0.4078431, 0, 1,
-1.357508, 0.2429234, -2.878592, 1, 0.4156863, 0, 1,
-1.351775, 1.517443, -2.88599, 1, 0.4196078, 0, 1,
-1.325993, -0.2291203, -2.365099, 1, 0.427451, 0, 1,
-1.31568, 0.8260769, -2.401078, 1, 0.4313726, 0, 1,
-1.31381, -1.043067, -0.3462906, 1, 0.4392157, 0, 1,
-1.313341, -1.174623, -2.413274, 1, 0.4431373, 0, 1,
-1.305073, -0.2564622, -1.266662, 1, 0.4509804, 0, 1,
-1.305033, -0.7102094, -3.448551, 1, 0.454902, 0, 1,
-1.304901, 0.4500885, -1.731436, 1, 0.4627451, 0, 1,
-1.286017, 0.709967, -1.908577, 1, 0.4666667, 0, 1,
-1.285373, -1.433457, -1.763506, 1, 0.4745098, 0, 1,
-1.27624, -0.1584287, -3.023688, 1, 0.4784314, 0, 1,
-1.276153, 1.426932, 1.182394, 1, 0.4862745, 0, 1,
-1.274805, 0.1557829, -0.8511862, 1, 0.4901961, 0, 1,
-1.270204, -0.77147, -2.048091, 1, 0.4980392, 0, 1,
-1.263451, 1.953334, 0.03071923, 1, 0.5058824, 0, 1,
-1.263104, 1.427946, -2.340604, 1, 0.509804, 0, 1,
-1.245774, -0.01776956, -3.551569, 1, 0.5176471, 0, 1,
-1.244243, 1.888212, 0.4703646, 1, 0.5215687, 0, 1,
-1.237513, 0.4716086, 0.8023482, 1, 0.5294118, 0, 1,
-1.232481, 0.08434315, -1.529139, 1, 0.5333334, 0, 1,
-1.225945, -1.662303, -0.8207069, 1, 0.5411765, 0, 1,
-1.225283, -0.75057, -1.651638, 1, 0.5450981, 0, 1,
-1.225179, -1.951122, -3.054061, 1, 0.5529412, 0, 1,
-1.217313, -0.7226967, -1.453339, 1, 0.5568628, 0, 1,
-1.213126, 2.20729, -0.04179411, 1, 0.5647059, 0, 1,
-1.212488, -1.203581, -1.453739, 1, 0.5686275, 0, 1,
-1.204611, -1.023914, -1.611539, 1, 0.5764706, 0, 1,
-1.200477, -0.2730288, -1.752832, 1, 0.5803922, 0, 1,
-1.193044, 0.3799144, -1.319444, 1, 0.5882353, 0, 1,
-1.186634, 1.379264, -1.017669, 1, 0.5921569, 0, 1,
-1.178938, -1.146764, -4.260807, 1, 0.6, 0, 1,
-1.17794, 0.1615717, -0.614054, 1, 0.6078432, 0, 1,
-1.16636, -0.2436612, -1.167821, 1, 0.6117647, 0, 1,
-1.166186, 0.3526115, -1.950979, 1, 0.6196079, 0, 1,
-1.148321, -0.3018519, -2.727448, 1, 0.6235294, 0, 1,
-1.141111, -0.5138105, -2.016968, 1, 0.6313726, 0, 1,
-1.140662, -1.969072, -1.901865, 1, 0.6352941, 0, 1,
-1.139238, -1.661696, -2.661875, 1, 0.6431373, 0, 1,
-1.138846, 0.1762608, -1.210344, 1, 0.6470588, 0, 1,
-1.137794, 0.8649126, -0.9220135, 1, 0.654902, 0, 1,
-1.137517, -0.1866097, -1.776776, 1, 0.6588235, 0, 1,
-1.13277, -0.05882565, -1.210372, 1, 0.6666667, 0, 1,
-1.131866, -0.4850561, -1.771672, 1, 0.6705883, 0, 1,
-1.127016, -0.3393559, -0.5697317, 1, 0.6784314, 0, 1,
-1.122703, 1.110268, -0.6838704, 1, 0.682353, 0, 1,
-1.114756, 1.65136, -1.736557, 1, 0.6901961, 0, 1,
-1.112027, 0.01260858, -2.963139, 1, 0.6941177, 0, 1,
-1.097121, -0.3080064, -1.879537, 1, 0.7019608, 0, 1,
-1.096295, 2.063512, -0.9341961, 1, 0.7098039, 0, 1,
-1.093293, 0.1207653, -1.633809, 1, 0.7137255, 0, 1,
-1.089444, -0.9088295, -3.179847, 1, 0.7215686, 0, 1,
-1.079643, -1.166136, -0.4901821, 1, 0.7254902, 0, 1,
-1.078306, -0.4176198, -1.874632, 1, 0.7333333, 0, 1,
-1.075764, -1.137764, -0.7104302, 1, 0.7372549, 0, 1,
-1.068374, 0.5410028, 0.2733037, 1, 0.7450981, 0, 1,
-1.068063, 0.3801723, -2.24237, 1, 0.7490196, 0, 1,
-1.067937, -0.69008, -0.9197005, 1, 0.7568628, 0, 1,
-1.063132, -1.794105, -3.493297, 1, 0.7607843, 0, 1,
-1.056681, 0.9703243, -1.804771, 1, 0.7686275, 0, 1,
-1.035986, -0.5448657, -4.462986, 1, 0.772549, 0, 1,
-1.031447, -1.983915, -3.510838, 1, 0.7803922, 0, 1,
-1.028781, -1.2575, -1.205865, 1, 0.7843137, 0, 1,
-1.017344, 0.006197502, -2.205142, 1, 0.7921569, 0, 1,
-1.016907, 0.8424833, -0.3636472, 1, 0.7960784, 0, 1,
-1.003519, -0.5425575, -1.830508, 1, 0.8039216, 0, 1,
-1.000792, 1.463099, -1.183141, 1, 0.8117647, 0, 1,
-0.998816, -0.4563308, -1.15589, 1, 0.8156863, 0, 1,
-0.9954101, -2.570162, -5.458251, 1, 0.8235294, 0, 1,
-0.9930389, 0.820032, -2.019649, 1, 0.827451, 0, 1,
-0.9895378, 0.02062299, -0.2326845, 1, 0.8352941, 0, 1,
-0.9858648, -0.5267946, -1.578223, 1, 0.8392157, 0, 1,
-0.9853918, -0.003920962, -0.9732084, 1, 0.8470588, 0, 1,
-0.982889, 1.500889, -1.075987, 1, 0.8509804, 0, 1,
-0.9805542, 0.1312257, -3.064938, 1, 0.8588235, 0, 1,
-0.9777448, -0.8735268, -4.250126, 1, 0.8627451, 0, 1,
-0.9763821, 0.3379127, -0.1442369, 1, 0.8705882, 0, 1,
-0.9757521, 0.380863, -1.692072, 1, 0.8745098, 0, 1,
-0.9708975, -0.6889219, -0.5118678, 1, 0.8823529, 0, 1,
-0.9668197, 0.8030823, 1.16374, 1, 0.8862745, 0, 1,
-0.9630121, -0.3637888, -0.8374218, 1, 0.8941177, 0, 1,
-0.9570212, 0.3854139, 0.2128227, 1, 0.8980392, 0, 1,
-0.9506099, -0.2326694, -4.097147, 1, 0.9058824, 0, 1,
-0.9332588, 0.4714502, -0.6714318, 1, 0.9137255, 0, 1,
-0.9332481, 0.510141, -1.661453, 1, 0.9176471, 0, 1,
-0.9293624, 0.6158166, -1.579113, 1, 0.9254902, 0, 1,
-0.9262583, -0.1955204, -1.799777, 1, 0.9294118, 0, 1,
-0.9245498, -0.3680394, -1.622587, 1, 0.9372549, 0, 1,
-0.9183061, 1.08984, -2.999934, 1, 0.9411765, 0, 1,
-0.9139432, 0.07074853, -0.9572748, 1, 0.9490196, 0, 1,
-0.9123884, -0.5994411, -3.314693, 1, 0.9529412, 0, 1,
-0.9080358, -1.700519, -1.687385, 1, 0.9607843, 0, 1,
-0.8990226, -0.9881683, -3.659365, 1, 0.9647059, 0, 1,
-0.8918846, 1.874534, 0.02765048, 1, 0.972549, 0, 1,
-0.8915721, 0.4240889, -1.385459, 1, 0.9764706, 0, 1,
-0.8888685, -0.4183123, -2.482173, 1, 0.9843137, 0, 1,
-0.8874221, 0.6970163, -1.34885, 1, 0.9882353, 0, 1,
-0.886848, 0.06728326, -1.789959, 1, 0.9960784, 0, 1,
-0.8861965, 0.40167, -0.4073873, 0.9960784, 1, 0, 1,
-0.8829682, -0.629844, -2.237187, 0.9921569, 1, 0, 1,
-0.8786283, -0.7831878, -1.260925, 0.9843137, 1, 0, 1,
-0.8776474, 0.2626314, -2.523352, 0.9803922, 1, 0, 1,
-0.871774, -0.746617, -2.297495, 0.972549, 1, 0, 1,
-0.8696113, -0.05500453, -0.4338744, 0.9686275, 1, 0, 1,
-0.8670514, 1.292475, -0.477726, 0.9607843, 1, 0, 1,
-0.8644135, 0.326943, -2.316395, 0.9568627, 1, 0, 1,
-0.8633701, -0.6049396, -2.598252, 0.9490196, 1, 0, 1,
-0.8622103, 2.719978, -1.046493, 0.945098, 1, 0, 1,
-0.8530185, 0.6101696, -1.396971, 0.9372549, 1, 0, 1,
-0.8511104, 1.236683, 0.4476434, 0.9333333, 1, 0, 1,
-0.8490314, -0.6134163, -2.715283, 0.9254902, 1, 0, 1,
-0.8327645, 0.4954374, -1.404579, 0.9215686, 1, 0, 1,
-0.819804, -1.969048, -2.306798, 0.9137255, 1, 0, 1,
-0.8187431, -0.09228506, -3.450753, 0.9098039, 1, 0, 1,
-0.8149999, 1.030404, -1.770239, 0.9019608, 1, 0, 1,
-0.8143679, -0.0776981, -0.9861695, 0.8941177, 1, 0, 1,
-0.8139897, 0.7264899, -0.9853188, 0.8901961, 1, 0, 1,
-0.812696, 1.414266, -0.5660252, 0.8823529, 1, 0, 1,
-0.8100533, 1.122911, -1.057998, 0.8784314, 1, 0, 1,
-0.8093565, -0.2440728, -3.342831, 0.8705882, 1, 0, 1,
-0.7984121, -0.2162115, -1.266279, 0.8666667, 1, 0, 1,
-0.7976491, 0.4041937, 0.3914522, 0.8588235, 1, 0, 1,
-0.7961864, -0.8912756, -3.317693, 0.854902, 1, 0, 1,
-0.7956136, -0.8425233, -2.706852, 0.8470588, 1, 0, 1,
-0.7892629, 0.3754866, -0.5283874, 0.8431373, 1, 0, 1,
-0.7872622, -0.318261, -3.4729, 0.8352941, 1, 0, 1,
-0.7812168, 0.97031, -0.7375384, 0.8313726, 1, 0, 1,
-0.7783239, -2.542161, -3.760793, 0.8235294, 1, 0, 1,
-0.7745533, 2.433308, -0.3712876, 0.8196079, 1, 0, 1,
-0.7706877, -1.339471, -5.143476, 0.8117647, 1, 0, 1,
-0.7698742, -0.5916376, -2.499366, 0.8078431, 1, 0, 1,
-0.7677192, -0.4695469, -2.530807, 0.8, 1, 0, 1,
-0.7648317, -0.3263729, -2.73925, 0.7921569, 1, 0, 1,
-0.7629422, -0.8363224, -3.801472, 0.7882353, 1, 0, 1,
-0.7611803, 0.06156394, -1.011859, 0.7803922, 1, 0, 1,
-0.7483421, -0.7322751, -1.986935, 0.7764706, 1, 0, 1,
-0.7463108, 1.157282, 2.276452, 0.7686275, 1, 0, 1,
-0.7431103, -0.9384003, -0.6574413, 0.7647059, 1, 0, 1,
-0.7340608, 0.03333539, -0.1865212, 0.7568628, 1, 0, 1,
-0.7318996, 2.389694, -1.356899, 0.7529412, 1, 0, 1,
-0.7314951, -0.6970957, -4.17247, 0.7450981, 1, 0, 1,
-0.7289361, -0.2911903, -2.565229, 0.7411765, 1, 0, 1,
-0.7272745, -0.124935, -1.755295, 0.7333333, 1, 0, 1,
-0.7187251, -0.6517031, -2.731376, 0.7294118, 1, 0, 1,
-0.7158161, -1.092023, -3.002084, 0.7215686, 1, 0, 1,
-0.7157861, -1.68239, -1.933992, 0.7176471, 1, 0, 1,
-0.7145281, 0.3365447, -0.9698973, 0.7098039, 1, 0, 1,
-0.7128612, 0.248417, -1.360863, 0.7058824, 1, 0, 1,
-0.7051498, -1.150255, -3.856859, 0.6980392, 1, 0, 1,
-0.704868, 1.948151, 1.255651, 0.6901961, 1, 0, 1,
-0.7026302, 0.05832801, -1.562046, 0.6862745, 1, 0, 1,
-0.6982145, -0.7138927, -2.732001, 0.6784314, 1, 0, 1,
-0.6957378, -0.1671989, -2.532419, 0.6745098, 1, 0, 1,
-0.6945313, 1.656782, -1.350194, 0.6666667, 1, 0, 1,
-0.6887509, -0.06649146, -2.378664, 0.6627451, 1, 0, 1,
-0.6822331, -0.63157, -2.836709, 0.654902, 1, 0, 1,
-0.6784828, -0.4697607, -1.496148, 0.6509804, 1, 0, 1,
-0.6730169, -0.9426898, -3.072648, 0.6431373, 1, 0, 1,
-0.6680467, -0.6895439, -1.945979, 0.6392157, 1, 0, 1,
-0.6631853, 0.1478281, -1.382214, 0.6313726, 1, 0, 1,
-0.6596639, -0.7807351, -0.9946019, 0.627451, 1, 0, 1,
-0.65768, -0.5616184, -2.226944, 0.6196079, 1, 0, 1,
-0.6561838, -0.7376819, -1.129332, 0.6156863, 1, 0, 1,
-0.6542839, -0.2076992, -2.489626, 0.6078432, 1, 0, 1,
-0.6465216, 0.6053476, 0.1455639, 0.6039216, 1, 0, 1,
-0.6462455, 0.2465139, -1.673643, 0.5960785, 1, 0, 1,
-0.6408204, 1.097873, -0.3071826, 0.5882353, 1, 0, 1,
-0.6378718, 0.2522015, -1.015735, 0.5843138, 1, 0, 1,
-0.636323, 0.777736, -1.623139, 0.5764706, 1, 0, 1,
-0.6329395, -1.134479, -2.777673, 0.572549, 1, 0, 1,
-0.6299694, -1.148798, -2.057942, 0.5647059, 1, 0, 1,
-0.62708, 0.5086245, -0.4095544, 0.5607843, 1, 0, 1,
-0.6243959, 0.8540318, -0.05575264, 0.5529412, 1, 0, 1,
-0.6239498, 1.158039, -0.7503638, 0.5490196, 1, 0, 1,
-0.6235999, 0.3003395, -1.957914, 0.5411765, 1, 0, 1,
-0.6172717, 1.112363, 0.9835427, 0.5372549, 1, 0, 1,
-0.6102423, 1.214826, 0.8341485, 0.5294118, 1, 0, 1,
-0.6094634, -1.195494, -4.094473, 0.5254902, 1, 0, 1,
-0.6073675, -0.09394915, -3.128654, 0.5176471, 1, 0, 1,
-0.6065656, 0.04395735, -1.601886, 0.5137255, 1, 0, 1,
-0.6061832, -1.318238, -2.015606, 0.5058824, 1, 0, 1,
-0.602929, -0.2123682, -2.651447, 0.5019608, 1, 0, 1,
-0.6005266, 2.507378, 0.07079481, 0.4941176, 1, 0, 1,
-0.5997478, -0.2232617, -0.5929436, 0.4862745, 1, 0, 1,
-0.5985558, -1.226566, -2.810116, 0.4823529, 1, 0, 1,
-0.5977867, 0.6252996, 0.2256586, 0.4745098, 1, 0, 1,
-0.5974514, -1.395377, -1.879902, 0.4705882, 1, 0, 1,
-0.5974442, -1.032659, -1.827485, 0.4627451, 1, 0, 1,
-0.595315, 1.591609, 1.663633, 0.4588235, 1, 0, 1,
-0.5943786, -1.238435, -3.632587, 0.4509804, 1, 0, 1,
-0.5937546, -0.860123, -3.000554, 0.4470588, 1, 0, 1,
-0.5900577, 0.7603838, -2.063008, 0.4392157, 1, 0, 1,
-0.5895209, -0.7842383, -1.840478, 0.4352941, 1, 0, 1,
-0.5891845, -0.262856, -3.082769, 0.427451, 1, 0, 1,
-0.5865569, -0.9343114, -3.177468, 0.4235294, 1, 0, 1,
-0.5834303, 0.6240969, -1.831191, 0.4156863, 1, 0, 1,
-0.579505, -2.439277, -3.63475, 0.4117647, 1, 0, 1,
-0.5782505, -0.4420318, -3.911386, 0.4039216, 1, 0, 1,
-0.5741758, 1.008742, 1.362007, 0.3960784, 1, 0, 1,
-0.5735186, -0.5841171, -3.350935, 0.3921569, 1, 0, 1,
-0.5717109, -0.1598157, -3.473966, 0.3843137, 1, 0, 1,
-0.571527, -0.2477816, -2.982746, 0.3803922, 1, 0, 1,
-0.570799, -0.6914332, -2.702144, 0.372549, 1, 0, 1,
-0.5676912, 0.7533289, -1.084571, 0.3686275, 1, 0, 1,
-0.5591394, 2.077158, -1.099244, 0.3607843, 1, 0, 1,
-0.5588605, -0.4287676, -2.254095, 0.3568628, 1, 0, 1,
-0.5586485, -2.013451, -3.279378, 0.3490196, 1, 0, 1,
-0.5582914, 0.8910703, 0.2287285, 0.345098, 1, 0, 1,
-0.5570054, 1.274087, -1.267875, 0.3372549, 1, 0, 1,
-0.5548773, -0.195619, -0.6647127, 0.3333333, 1, 0, 1,
-0.5493454, -0.3802494, -0.7359297, 0.3254902, 1, 0, 1,
-0.5448924, 0.5875667, 0.2158765, 0.3215686, 1, 0, 1,
-0.5355605, 2.516493, -1.029624, 0.3137255, 1, 0, 1,
-0.5320778, 0.1388168, -1.846728, 0.3098039, 1, 0, 1,
-0.5298028, 1.090498, -0.2846693, 0.3019608, 1, 0, 1,
-0.5275722, 0.8081985, -0.2027495, 0.2941177, 1, 0, 1,
-0.5257843, 0.7145839, -0.6568964, 0.2901961, 1, 0, 1,
-0.5248513, -0.30633, -3.440474, 0.282353, 1, 0, 1,
-0.5204881, -0.4085999, -3.092678, 0.2784314, 1, 0, 1,
-0.519609, 1.124937, -0.3585769, 0.2705882, 1, 0, 1,
-0.5172268, -0.02646878, -1.58022, 0.2666667, 1, 0, 1,
-0.5145262, -1.529951, -3.017077, 0.2588235, 1, 0, 1,
-0.5123907, 1.613486, -1.262038, 0.254902, 1, 0, 1,
-0.5107186, -0.2644604, -1.9867, 0.2470588, 1, 0, 1,
-0.5093777, 0.1780546, -1.629285, 0.2431373, 1, 0, 1,
-0.5022317, 1.333514, -0.3226027, 0.2352941, 1, 0, 1,
-0.5012316, -1.168859, -2.903897, 0.2313726, 1, 0, 1,
-0.5010965, 0.5226076, -1.58126, 0.2235294, 1, 0, 1,
-0.4935169, -0.2099729, -2.05502, 0.2196078, 1, 0, 1,
-0.492781, 0.3588566, -2.617126, 0.2117647, 1, 0, 1,
-0.4900474, -0.5242385, -2.928515, 0.2078431, 1, 0, 1,
-0.4884101, -0.3288425, -1.043265, 0.2, 1, 0, 1,
-0.485717, 1.268964, -0.8026208, 0.1921569, 1, 0, 1,
-0.485272, -0.8409665, -3.463111, 0.1882353, 1, 0, 1,
-0.4819748, 0.2099368, 0.4379209, 0.1803922, 1, 0, 1,
-0.4774793, 0.501261, -0.5154833, 0.1764706, 1, 0, 1,
-0.4668853, 0.5750901, -0.4485209, 0.1686275, 1, 0, 1,
-0.4637934, -0.7014223, -1.039816, 0.1647059, 1, 0, 1,
-0.4620367, -0.06129971, -1.796896, 0.1568628, 1, 0, 1,
-0.4513885, 0.1562609, -0.9296696, 0.1529412, 1, 0, 1,
-0.4512208, 1.697762, -0.7934523, 0.145098, 1, 0, 1,
-0.4508873, -0.5051181, -2.281704, 0.1411765, 1, 0, 1,
-0.4503716, 1.047567, 0.0584457, 0.1333333, 1, 0, 1,
-0.4482265, -1.136388, -5.203902, 0.1294118, 1, 0, 1,
-0.4450999, -0.2319344, -1.990954, 0.1215686, 1, 0, 1,
-0.4395682, -0.1088444, -2.643251, 0.1176471, 1, 0, 1,
-0.4378435, -0.08614845, -1.462207, 0.1098039, 1, 0, 1,
-0.4371269, -1.070108, -6.072739, 0.1058824, 1, 0, 1,
-0.4353386, -1.240096, -4.282541, 0.09803922, 1, 0, 1,
-0.4329133, -0.7350191, -4.366027, 0.09019608, 1, 0, 1,
-0.4303648, -1.385852, -3.325198, 0.08627451, 1, 0, 1,
-0.4277628, -0.8165752, -1.783301, 0.07843138, 1, 0, 1,
-0.4273033, 0.05409328, -0.3815092, 0.07450981, 1, 0, 1,
-0.4266793, 1.358245, 0.1728156, 0.06666667, 1, 0, 1,
-0.4266369, -0.6958313, -3.49908, 0.0627451, 1, 0, 1,
-0.4183326, 1.35782, -0.6951548, 0.05490196, 1, 0, 1,
-0.4152783, 0.8132823, -1.618953, 0.05098039, 1, 0, 1,
-0.4117065, 1.185922, -1.989409, 0.04313726, 1, 0, 1,
-0.4094258, 0.4024672, -2.440518, 0.03921569, 1, 0, 1,
-0.406009, -0.5887211, -2.553793, 0.03137255, 1, 0, 1,
-0.4044843, 0.4999122, -1.086554, 0.02745098, 1, 0, 1,
-0.4029766, 0.8638699, 0.01549033, 0.01960784, 1, 0, 1,
-0.4016701, 0.2986041, -0.5152138, 0.01568628, 1, 0, 1,
-0.4015364, -0.1294172, -3.639432, 0.007843138, 1, 0, 1,
-0.3981355, 0.3924711, -0.131056, 0.003921569, 1, 0, 1,
-0.3959869, -0.2079892, -3.581714, 0, 1, 0.003921569, 1,
-0.3938348, -0.06056267, -0.9147397, 0, 1, 0.01176471, 1,
-0.3927194, -1.748258, -1.959022, 0, 1, 0.01568628, 1,
-0.3902968, 1.80007, -0.2144752, 0, 1, 0.02352941, 1,
-0.3894543, 1.1074, 1.530479, 0, 1, 0.02745098, 1,
-0.3860532, -0.6849074, -3.199689, 0, 1, 0.03529412, 1,
-0.3846463, -0.8687339, -1.904612, 0, 1, 0.03921569, 1,
-0.3844278, -0.1729765, 0.4880375, 0, 1, 0.04705882, 1,
-0.3763691, -0.2093417, -2.610013, 0, 1, 0.05098039, 1,
-0.3759088, 0.1099666, -1.829629, 0, 1, 0.05882353, 1,
-0.3688792, -0.1252726, -1.021311, 0, 1, 0.0627451, 1,
-0.3685485, -2.497886, -3.899926, 0, 1, 0.07058824, 1,
-0.3634416, 1.401206, 1.120735, 0, 1, 0.07450981, 1,
-0.3578488, 1.368154, 0.5552246, 0, 1, 0.08235294, 1,
-0.3568448, 0.9258482, 0.9231051, 0, 1, 0.08627451, 1,
-0.3560404, -0.4792676, -2.292903, 0, 1, 0.09411765, 1,
-0.3541141, 1.441584, 0.7462174, 0, 1, 0.1019608, 1,
-0.3516943, 1.005568, 0.5090073, 0, 1, 0.1058824, 1,
-0.3505943, -0.4041962, -2.858993, 0, 1, 0.1137255, 1,
-0.345174, 0.9455222, -1.545814, 0, 1, 0.1176471, 1,
-0.3420641, 0.0883465, -2.277956, 0, 1, 0.1254902, 1,
-0.3382517, 0.7311181, -1.072548, 0, 1, 0.1294118, 1,
-0.3370711, -0.6532308, -2.804133, 0, 1, 0.1372549, 1,
-0.3366167, 0.5488834, -4.063881, 0, 1, 0.1411765, 1,
-0.3360622, -0.4741278, -1.459327, 0, 1, 0.1490196, 1,
-0.3359473, -1.656489, -2.7872, 0, 1, 0.1529412, 1,
-0.3352201, 0.8139738, -0.7084614, 0, 1, 0.1607843, 1,
-0.3323833, -0.7147132, -2.814935, 0, 1, 0.1647059, 1,
-0.3291708, -1.345359, -3.145795, 0, 1, 0.172549, 1,
-0.3255895, -0.6714202, -3.329104, 0, 1, 0.1764706, 1,
-0.3234836, -0.003076303, -1.694209, 0, 1, 0.1843137, 1,
-0.3228593, -0.9195107, -4.117297, 0, 1, 0.1882353, 1,
-0.3225802, -0.80321, -1.317075, 0, 1, 0.1960784, 1,
-0.319621, -0.877965, -1.629372, 0, 1, 0.2039216, 1,
-0.3184515, 0.2741003, 0.897646, 0, 1, 0.2078431, 1,
-0.3163278, 1.882529, -1.36355, 0, 1, 0.2156863, 1,
-0.3056406, 0.9095053, 1.043299, 0, 1, 0.2196078, 1,
-0.3011343, 1.076961, 0.4794315, 0, 1, 0.227451, 1,
-0.2903383, 0.5691461, -1.779153, 0, 1, 0.2313726, 1,
-0.2888088, -1.116299, -4.42399, 0, 1, 0.2392157, 1,
-0.2874486, -0.3765287, -2.173831, 0, 1, 0.2431373, 1,
-0.2857276, 2.918952, -0.266353, 0, 1, 0.2509804, 1,
-0.2826876, -0.3012633, -2.537142, 0, 1, 0.254902, 1,
-0.2815101, -1.535933, -2.80203, 0, 1, 0.2627451, 1,
-0.2796018, 3.096045, 0.9824179, 0, 1, 0.2666667, 1,
-0.2771566, -0.4471649, -2.291789, 0, 1, 0.2745098, 1,
-0.2722197, 0.4395823, -0.3758869, 0, 1, 0.2784314, 1,
-0.2682221, -0.565261, -2.64052, 0, 1, 0.2862745, 1,
-0.2672254, -0.7674446, -1.862553, 0, 1, 0.2901961, 1,
-0.2658719, 0.9068746, -0.3494086, 0, 1, 0.2980392, 1,
-0.2610821, 0.3350877, -2.263788, 0, 1, 0.3058824, 1,
-0.2585979, -1.158894, -3.197443, 0, 1, 0.3098039, 1,
-0.2585817, 1.023753, 0.05364776, 0, 1, 0.3176471, 1,
-0.2571944, 1.491232, -1.508361, 0, 1, 0.3215686, 1,
-0.2556153, -0.226976, -2.834061, 0, 1, 0.3294118, 1,
-0.2543801, 1.283318, -0.7297806, 0, 1, 0.3333333, 1,
-0.2519506, -1.851422, -1.618356, 0, 1, 0.3411765, 1,
-0.2472399, -0.2465741, -0.4448347, 0, 1, 0.345098, 1,
-0.2447345, -0.1913859, -1.27161, 0, 1, 0.3529412, 1,
-0.2431512, 0.8254555, -1.495904, 0, 1, 0.3568628, 1,
-0.2428625, -1.384691, -3.596952, 0, 1, 0.3647059, 1,
-0.2426481, -0.06951326, -1.123728, 0, 1, 0.3686275, 1,
-0.2335019, -2.367495, -3.45487, 0, 1, 0.3764706, 1,
-0.2328942, -0.9654025, -3.132133, 0, 1, 0.3803922, 1,
-0.2312927, 0.1979394, -0.1898059, 0, 1, 0.3882353, 1,
-0.2291082, 1.749243, -1.759445, 0, 1, 0.3921569, 1,
-0.2226975, -0.2940698, -2.3754, 0, 1, 0.4, 1,
-0.2211978, 0.8427173, 0.2543647, 0, 1, 0.4078431, 1,
-0.219999, 1.367601, -0.0168534, 0, 1, 0.4117647, 1,
-0.2146897, 0.6115989, -0.9243855, 0, 1, 0.4196078, 1,
-0.2101498, 1.036678, 0.4087663, 0, 1, 0.4235294, 1,
-0.2096079, -1.289844, -3.38057, 0, 1, 0.4313726, 1,
-0.2086928, 0.2835844, 0.6517474, 0, 1, 0.4352941, 1,
-0.2082755, -1.275735, -4.425089, 0, 1, 0.4431373, 1,
-0.2050141, 0.390227, -0.1134751, 0, 1, 0.4470588, 1,
-0.204881, -0.9036299, -4.837071, 0, 1, 0.454902, 1,
-0.1984049, -0.4171916, -3.162563, 0, 1, 0.4588235, 1,
-0.192113, 1.063894, 0.1415262, 0, 1, 0.4666667, 1,
-0.1919808, 0.3522586, 0.6196341, 0, 1, 0.4705882, 1,
-0.1914936, 0.5736488, -0.08959003, 0, 1, 0.4784314, 1,
-0.1844147, -0.2614374, -1.903323, 0, 1, 0.4823529, 1,
-0.182267, -0.5520467, -4.43927, 0, 1, 0.4901961, 1,
-0.1812986, -0.3152042, -3.044246, 0, 1, 0.4941176, 1,
-0.181256, 0.5491533, 1.210972, 0, 1, 0.5019608, 1,
-0.1802693, 0.6707003, -1.962934, 0, 1, 0.509804, 1,
-0.1756438, -0.5641094, -3.020858, 0, 1, 0.5137255, 1,
-0.1747638, -1.008301, -3.174123, 0, 1, 0.5215687, 1,
-0.1738094, 0.6839933, -2.445709, 0, 1, 0.5254902, 1,
-0.1734152, -1.211422, -3.20344, 0, 1, 0.5333334, 1,
-0.1705176, -0.1558058, -3.483404, 0, 1, 0.5372549, 1,
-0.1699558, -0.1110376, -2.053462, 0, 1, 0.5450981, 1,
-0.1611434, 0.778614, -0.2499189, 0, 1, 0.5490196, 1,
-0.1602624, -0.5736642, -3.233578, 0, 1, 0.5568628, 1,
-0.1597787, -1.223683, -2.75273, 0, 1, 0.5607843, 1,
-0.1590664, 0.5137334, -1.43889, 0, 1, 0.5686275, 1,
-0.1586115, -0.6846123, -4.175074, 0, 1, 0.572549, 1,
-0.1544108, -0.236118, -4.662347, 0, 1, 0.5803922, 1,
-0.1491419, -0.4721577, -2.539264, 0, 1, 0.5843138, 1,
-0.1484531, 0.198005, -2.143843, 0, 1, 0.5921569, 1,
-0.147725, 0.5665731, -0.2485369, 0, 1, 0.5960785, 1,
-0.1446717, 1.920096, -0.7266157, 0, 1, 0.6039216, 1,
-0.133858, -0.6723139, -2.68566, 0, 1, 0.6117647, 1,
-0.1329339, 1.64382, 0.3082364, 0, 1, 0.6156863, 1,
-0.1327428, 0.6832915, 0.3497943, 0, 1, 0.6235294, 1,
-0.1299505, 0.6889234, 1.516523, 0, 1, 0.627451, 1,
-0.1242572, 1.501901, 0.8327036, 0, 1, 0.6352941, 1,
-0.1209799, -0.8005046, -1.735862, 0, 1, 0.6392157, 1,
-0.1191051, -1.181362, -1.676905, 0, 1, 0.6470588, 1,
-0.1177365, 0.2973505, -1.457597, 0, 1, 0.6509804, 1,
-0.1154263, 1.079131, 1.291573, 0, 1, 0.6588235, 1,
-0.1102548, 0.09368611, -0.2526536, 0, 1, 0.6627451, 1,
-0.1055495, -0.9443328, -2.232393, 0, 1, 0.6705883, 1,
-0.1042517, -0.1247239, -2.52435, 0, 1, 0.6745098, 1,
-0.1002098, -0.2968994, -3.554457, 0, 1, 0.682353, 1,
-0.09932826, -1.29924, -1.229591, 0, 1, 0.6862745, 1,
-0.09787583, -2.001594, -2.340307, 0, 1, 0.6941177, 1,
-0.09743526, 0.8866145, -1.948156, 0, 1, 0.7019608, 1,
-0.09724017, 2.683891, 0.6683831, 0, 1, 0.7058824, 1,
-0.09465444, -0.240439, -2.583601, 0, 1, 0.7137255, 1,
-0.09413084, -0.3196113, -3.570069, 0, 1, 0.7176471, 1,
-0.09061026, 0.2069371, -0.3825711, 0, 1, 0.7254902, 1,
-0.08855095, 0.0208339, -1.544368, 0, 1, 0.7294118, 1,
-0.08480889, -0.4281341, -2.23764, 0, 1, 0.7372549, 1,
-0.07999087, -0.6536382, -2.41073, 0, 1, 0.7411765, 1,
-0.07844622, 1.993229, -1.639011, 0, 1, 0.7490196, 1,
-0.07675117, -0.7825, -4.266387, 0, 1, 0.7529412, 1,
-0.0758574, -0.4714399, -2.885234, 0, 1, 0.7607843, 1,
-0.07542366, 0.7076576, -1.229291, 0, 1, 0.7647059, 1,
-0.07315816, -0.9632537, -1.409912, 0, 1, 0.772549, 1,
-0.06825478, 1.48252, 1.157987, 0, 1, 0.7764706, 1,
-0.06721815, -1.341079, -2.876125, 0, 1, 0.7843137, 1,
-0.06690791, -0.5622883, -3.696244, 0, 1, 0.7882353, 1,
-0.06566951, 0.8136132, -0.9485223, 0, 1, 0.7960784, 1,
-0.0655012, -0.4049121, -3.298609, 0, 1, 0.8039216, 1,
-0.06281777, 0.7339779, 0.933315, 0, 1, 0.8078431, 1,
-0.06235775, -1.465406, -4.671862, 0, 1, 0.8156863, 1,
-0.06143847, -2.206782, -2.51563, 0, 1, 0.8196079, 1,
-0.0607016, -1.854921, -2.39903, 0, 1, 0.827451, 1,
-0.0553969, 0.2457571, -1.004495, 0, 1, 0.8313726, 1,
-0.04775239, -0.1917943, -1.789492, 0, 1, 0.8392157, 1,
-0.04403888, 0.01453286, -1.221656, 0, 1, 0.8431373, 1,
-0.04370424, -0.368975, -2.420218, 0, 1, 0.8509804, 1,
-0.04288096, -0.1407185, -3.767081, 0, 1, 0.854902, 1,
-0.04233185, -0.9447411, -2.609243, 0, 1, 0.8627451, 1,
-0.04035912, -1.650023, -1.739179, 0, 1, 0.8666667, 1,
-0.03892633, 1.113967, -0.3494632, 0, 1, 0.8745098, 1,
-0.03529181, 0.5011305, -0.7307425, 0, 1, 0.8784314, 1,
-0.03283512, 0.0284418, -1.134771, 0, 1, 0.8862745, 1,
-0.03270182, -0.1518434, -4.272715, 0, 1, 0.8901961, 1,
-0.03190704, -1.125556, -0.8983611, 0, 1, 0.8980392, 1,
-0.03093488, 0.09252057, 2.212546, 0, 1, 0.9058824, 1,
-0.02508398, -0.7398816, -4.007842, 0, 1, 0.9098039, 1,
-0.02297026, 0.8876484, -0.8178203, 0, 1, 0.9176471, 1,
-0.02258006, -0.3994091, -2.574659, 0, 1, 0.9215686, 1,
-0.01187019, -0.6353297, -3.174947, 0, 1, 0.9294118, 1,
-0.008121856, -1.770995, -4.094572, 0, 1, 0.9333333, 1,
-0.006319898, -1.011706, -2.722649, 0, 1, 0.9411765, 1,
-0.005823116, 0.6434797, -0.7442662, 0, 1, 0.945098, 1,
-0.001038493, 0.2421187, 0.6322595, 0, 1, 0.9529412, 1,
0.0001295711, 0.105116, -1.199798, 0, 1, 0.9568627, 1,
0.002580932, 0.4108071, -0.1076425, 0, 1, 0.9647059, 1,
0.003797206, 0.6959478, -0.5418336, 0, 1, 0.9686275, 1,
0.004047715, -0.120997, 3.170449, 0, 1, 0.9764706, 1,
0.004089213, 1.768627, 0.4506708, 0, 1, 0.9803922, 1,
0.004493001, -0.5944745, 3.217959, 0, 1, 0.9882353, 1,
0.004796744, -0.2168762, 2.575489, 0, 1, 0.9921569, 1,
0.00513693, 0.1846983, 1.4131, 0, 1, 1, 1,
0.01665911, -1.787098, 1.842664, 0, 0.9921569, 1, 1,
0.0216428, 2.331232, 0.06448304, 0, 0.9882353, 1, 1,
0.0227602, -0.4663417, 3.433435, 0, 0.9803922, 1, 1,
0.02307036, 0.2878344, 0.6466199, 0, 0.9764706, 1, 1,
0.0332913, -0.3357872, 4.356339, 0, 0.9686275, 1, 1,
0.03623752, -0.4596776, 1.4467, 0, 0.9647059, 1, 1,
0.04826827, -0.8517355, 3.816683, 0, 0.9568627, 1, 1,
0.05199118, 1.525388, 0.4642437, 0, 0.9529412, 1, 1,
0.05616389, 0.3900604, -0.07533091, 0, 0.945098, 1, 1,
0.05837479, -1.779025, 2.627188, 0, 0.9411765, 1, 1,
0.06040287, -0.05574009, 0.992274, 0, 0.9333333, 1, 1,
0.06298465, 1.104578, 0.08458126, 0, 0.9294118, 1, 1,
0.06719592, -0.04722645, 0.9400172, 0, 0.9215686, 1, 1,
0.06784207, 0.7746298, 0.5977348, 0, 0.9176471, 1, 1,
0.06827354, 0.6887479, 0.4517565, 0, 0.9098039, 1, 1,
0.06873427, -1.527107, 2.739933, 0, 0.9058824, 1, 1,
0.07392295, -0.3355266, 1.143026, 0, 0.8980392, 1, 1,
0.07795928, -0.2306081, 1.657089, 0, 0.8901961, 1, 1,
0.08131077, -0.4375893, 3.574266, 0, 0.8862745, 1, 1,
0.08247668, -0.7147111, 1.976199, 0, 0.8784314, 1, 1,
0.08473408, -0.3004647, 2.566106, 0, 0.8745098, 1, 1,
0.08514085, -0.2716942, 1.973034, 0, 0.8666667, 1, 1,
0.08607256, 0.3732285, 0.8159623, 0, 0.8627451, 1, 1,
0.08832464, 1.666769, 1.940096, 0, 0.854902, 1, 1,
0.09089942, -0.7944928, 2.39013, 0, 0.8509804, 1, 1,
0.09334178, -0.2830005, 3.258543, 0, 0.8431373, 1, 1,
0.09430004, -0.03514138, 2.553115, 0, 0.8392157, 1, 1,
0.1009652, -0.2652797, 3.605205, 0, 0.8313726, 1, 1,
0.1063991, 1.922893, 1.383453, 0, 0.827451, 1, 1,
0.1067298, 1.058892, 0.03794607, 0, 0.8196079, 1, 1,
0.1067599, -0.7386296, 2.26396, 0, 0.8156863, 1, 1,
0.110437, 0.8397415, 0.1595839, 0, 0.8078431, 1, 1,
0.1105666, 1.230372, 1.190642, 0, 0.8039216, 1, 1,
0.1118783, 0.5611075, -1.524951, 0, 0.7960784, 1, 1,
0.1128127, -0.4712919, 3.901691, 0, 0.7882353, 1, 1,
0.1134236, 0.9532469, 0.843435, 0, 0.7843137, 1, 1,
0.1155804, -1.035498, 4.300022, 0, 0.7764706, 1, 1,
0.1165197, 0.5961257, -0.08812105, 0, 0.772549, 1, 1,
0.1176208, -0.5712697, 2.983004, 0, 0.7647059, 1, 1,
0.1217933, -1.192819, 3.205976, 0, 0.7607843, 1, 1,
0.1221818, -1.296452, 3.407461, 0, 0.7529412, 1, 1,
0.1301999, -1.855947, 3.81147, 0, 0.7490196, 1, 1,
0.138677, -0.02111122, 2.756287, 0, 0.7411765, 1, 1,
0.1397711, 0.6999369, -0.1156665, 0, 0.7372549, 1, 1,
0.1398988, -0.08219275, 1.548432, 0, 0.7294118, 1, 1,
0.1410449, 1.44716, 0.5358026, 0, 0.7254902, 1, 1,
0.1420721, 1.186434, 1.040537, 0, 0.7176471, 1, 1,
0.1460366, 1.930229, 1.409043, 0, 0.7137255, 1, 1,
0.1469192, -0.8753984, 2.781248, 0, 0.7058824, 1, 1,
0.1483102, -1.11134, 1.797659, 0, 0.6980392, 1, 1,
0.1527891, -0.2786642, 0.9257132, 0, 0.6941177, 1, 1,
0.154023, 0.8361585, 0.7447904, 0, 0.6862745, 1, 1,
0.1584379, -0.6764488, 2.277695, 0, 0.682353, 1, 1,
0.1586587, -1.138233, 1.393941, 0, 0.6745098, 1, 1,
0.1609423, 0.5598035, -0.961539, 0, 0.6705883, 1, 1,
0.1626792, -0.207338, 2.952611, 0, 0.6627451, 1, 1,
0.164619, -1.085279, 1.560523, 0, 0.6588235, 1, 1,
0.1723991, 0.2482416, 0.7264215, 0, 0.6509804, 1, 1,
0.1746374, -0.9640608, 2.967687, 0, 0.6470588, 1, 1,
0.1748105, 0.4044683, 1.639258, 0, 0.6392157, 1, 1,
0.1748557, 1.259245, -0.182241, 0, 0.6352941, 1, 1,
0.1761605, 1.477398, -1.531678, 0, 0.627451, 1, 1,
0.1803058, 0.9442352, -1.658746, 0, 0.6235294, 1, 1,
0.1818233, 0.5519961, -1.50473, 0, 0.6156863, 1, 1,
0.1821783, -1.557194, 2.945056, 0, 0.6117647, 1, 1,
0.1838768, -0.4053837, 3.541411, 0, 0.6039216, 1, 1,
0.1857991, -1.02304, 2.459425, 0, 0.5960785, 1, 1,
0.1893326, -0.1074606, 1.924706, 0, 0.5921569, 1, 1,
0.1918688, -0.386685, 2.479765, 0, 0.5843138, 1, 1,
0.1969389, -1.595082, 4.422794, 0, 0.5803922, 1, 1,
0.198558, -0.06507051, 1.110106, 0, 0.572549, 1, 1,
0.1991082, -0.2436004, 2.111358, 0, 0.5686275, 1, 1,
0.2025103, 0.9584252, -1.129714, 0, 0.5607843, 1, 1,
0.2043433, 0.09015728, 0.9832662, 0, 0.5568628, 1, 1,
0.2065332, 1.660324, 0.8311005, 0, 0.5490196, 1, 1,
0.2112127, -0.1767069, 3.866418, 0, 0.5450981, 1, 1,
0.2223372, -0.08798032, 2.121208, 0, 0.5372549, 1, 1,
0.2226538, 0.7412959, 0.8774607, 0, 0.5333334, 1, 1,
0.2283547, -0.6684691, 0.07766934, 0, 0.5254902, 1, 1,
0.229641, 2.19188, -1.187565, 0, 0.5215687, 1, 1,
0.2329627, -0.7479692, 2.312421, 0, 0.5137255, 1, 1,
0.2331196, -0.5656756, 5.633666, 0, 0.509804, 1, 1,
0.2376678, 2.144979, 0.7630933, 0, 0.5019608, 1, 1,
0.2405408, -0.674736, 3.797132, 0, 0.4941176, 1, 1,
0.244637, -0.05239046, 1.634446, 0, 0.4901961, 1, 1,
0.2452358, -0.6020879, 5.016267, 0, 0.4823529, 1, 1,
0.248844, 1.010544, 1.053001, 0, 0.4784314, 1, 1,
0.2505726, 1.542466, 2.151998, 0, 0.4705882, 1, 1,
0.253457, 1.253038, 0.186424, 0, 0.4666667, 1, 1,
0.2574772, -0.7338277, 3.456418, 0, 0.4588235, 1, 1,
0.2582282, 0.06965916, 0.9106065, 0, 0.454902, 1, 1,
0.2602642, 0.7785519, -0.806865, 0, 0.4470588, 1, 1,
0.2630224, -1.045355, 3.597457, 0, 0.4431373, 1, 1,
0.2692231, 0.4890415, -0.6753041, 0, 0.4352941, 1, 1,
0.2704583, 0.1203461, 1.852041, 0, 0.4313726, 1, 1,
0.2711229, -0.5737957, 1.65197, 0, 0.4235294, 1, 1,
0.2729208, 1.359096, -0.06236541, 0, 0.4196078, 1, 1,
0.2807599, -0.5156637, 0.9645988, 0, 0.4117647, 1, 1,
0.284263, 0.5298895, 2.317497, 0, 0.4078431, 1, 1,
0.2854152, -0.1669482, 2.059941, 0, 0.4, 1, 1,
0.2863621, -0.5976402, 4.044852, 0, 0.3921569, 1, 1,
0.2864695, 0.120837, 2.368837, 0, 0.3882353, 1, 1,
0.288701, -0.5035727, 0.9720208, 0, 0.3803922, 1, 1,
0.2896055, 0.6063636, -0.1167717, 0, 0.3764706, 1, 1,
0.2896895, -0.09379625, 2.183621, 0, 0.3686275, 1, 1,
0.296657, 1.470392, 1.296825, 0, 0.3647059, 1, 1,
0.3000124, 2.054808, -1.42548, 0, 0.3568628, 1, 1,
0.3046511, -0.01195927, 2.431718, 0, 0.3529412, 1, 1,
0.3070452, 0.4406415, 0.7137398, 0, 0.345098, 1, 1,
0.3104818, 1.142215, -1.71141, 0, 0.3411765, 1, 1,
0.313336, 0.3079816, 1.491129, 0, 0.3333333, 1, 1,
0.315159, 0.8591539, -0.8806146, 0, 0.3294118, 1, 1,
0.3161153, 0.6241626, 0.1970513, 0, 0.3215686, 1, 1,
0.319277, 1.403788, 1.780475, 0, 0.3176471, 1, 1,
0.3242987, 2.647089, -0.5844504, 0, 0.3098039, 1, 1,
0.3288126, -0.1140787, 1.991556, 0, 0.3058824, 1, 1,
0.3357871, -0.07735812, 1.640872, 0, 0.2980392, 1, 1,
0.3364942, 0.2402331, 0.9733552, 0, 0.2901961, 1, 1,
0.3381696, 0.1120608, 0.5534136, 0, 0.2862745, 1, 1,
0.33902, 0.07202937, 1.348313, 0, 0.2784314, 1, 1,
0.3408583, -1.423092, 3.750618, 0, 0.2745098, 1, 1,
0.3416904, 1.030172, -3.221193, 0, 0.2666667, 1, 1,
0.3425248, -0.5364797, 2.322111, 0, 0.2627451, 1, 1,
0.3466955, 0.3038761, 1.036975, 0, 0.254902, 1, 1,
0.3519833, 1.224998, 1.835671, 0, 0.2509804, 1, 1,
0.3535964, -0.4514092, 4.303298, 0, 0.2431373, 1, 1,
0.3610348, 1.259695, 0.3972923, 0, 0.2392157, 1, 1,
0.3664838, -0.2136697, 3.013429, 0, 0.2313726, 1, 1,
0.3678988, 1.066467, -1.085641, 0, 0.227451, 1, 1,
0.3699568, 1.396845, -1.400157, 0, 0.2196078, 1, 1,
0.3733808, 0.5969672, 0.08000571, 0, 0.2156863, 1, 1,
0.3739212, 0.8340631, -0.06651091, 0, 0.2078431, 1, 1,
0.3751048, 1.397302, -0.3126855, 0, 0.2039216, 1, 1,
0.3767101, -0.3266398, 3.676349, 0, 0.1960784, 1, 1,
0.3793789, 1.004139, 0.9384164, 0, 0.1882353, 1, 1,
0.3810894, 2.23197, -0.1844454, 0, 0.1843137, 1, 1,
0.3844274, -0.06244045, 1.484848, 0, 0.1764706, 1, 1,
0.3902467, 0.2106111, 2.74043, 0, 0.172549, 1, 1,
0.3924484, -0.483851, 2.676472, 0, 0.1647059, 1, 1,
0.3928562, -1.034627, 2.529576, 0, 0.1607843, 1, 1,
0.3952985, -0.5247784, 2.051093, 0, 0.1529412, 1, 1,
0.3959639, 0.6653311, -0.6481214, 0, 0.1490196, 1, 1,
0.3974288, 1.532304, 0.6370004, 0, 0.1411765, 1, 1,
0.4000805, 1.356091, -1.471832, 0, 0.1372549, 1, 1,
0.4033368, 0.08166959, 1.2226, 0, 0.1294118, 1, 1,
0.4075571, -0.5180033, 0.9245444, 0, 0.1254902, 1, 1,
0.4121502, 0.3384027, 1.729795, 0, 0.1176471, 1, 1,
0.4122191, -1.371524, 2.9785, 0, 0.1137255, 1, 1,
0.41498, 0.8603141, 0.1863507, 0, 0.1058824, 1, 1,
0.4160454, 0.386427, 0.6846343, 0, 0.09803922, 1, 1,
0.4209598, -0.3576056, 4.245708, 0, 0.09411765, 1, 1,
0.4342996, -0.3952596, 1.15937, 0, 0.08627451, 1, 1,
0.4376955, 0.7864503, -1.627409, 0, 0.08235294, 1, 1,
0.4397688, -0.7861392, 2.623326, 0, 0.07450981, 1, 1,
0.4446227, 0.9883641, 0.2875039, 0, 0.07058824, 1, 1,
0.4455296, 0.2315161, -1.566163, 0, 0.0627451, 1, 1,
0.4486671, -0.8400277, 1.223594, 0, 0.05882353, 1, 1,
0.4501524, -0.4840814, 0.208975, 0, 0.05098039, 1, 1,
0.4531758, 1.750615, 2.373633, 0, 0.04705882, 1, 1,
0.456145, -0.07305603, 0.9022799, 0, 0.03921569, 1, 1,
0.4563974, 0.6303129, 0.3004463, 0, 0.03529412, 1, 1,
0.4568585, -1.022146, 1.211963, 0, 0.02745098, 1, 1,
0.4698687, -1.41425, 2.533558, 0, 0.02352941, 1, 1,
0.4743556, 0.1761597, 0.5560008, 0, 0.01568628, 1, 1,
0.4793615, -0.8310165, 1.520487, 0, 0.01176471, 1, 1,
0.4839505, -1.760534, 3.604803, 0, 0.003921569, 1, 1,
0.4879341, -0.6611084, 2.114474, 0.003921569, 0, 1, 1,
0.4889401, 0.941398, 1.908714, 0.007843138, 0, 1, 1,
0.4923332, -0.3603587, -0.04923094, 0.01568628, 0, 1, 1,
0.4962769, 0.5310223, 0.02428605, 0.01960784, 0, 1, 1,
0.4979691, -1.940137, 3.159607, 0.02745098, 0, 1, 1,
0.4993565, -0.3948371, 2.106801, 0.03137255, 0, 1, 1,
0.4995787, 0.7579906, 0.59185, 0.03921569, 0, 1, 1,
0.5002156, -0.8175527, 1.556858, 0.04313726, 0, 1, 1,
0.5004086, -0.3983341, 0.7790198, 0.05098039, 0, 1, 1,
0.5031623, -0.07578484, 2.119774, 0.05490196, 0, 1, 1,
0.5052475, -0.8056396, 3.487409, 0.0627451, 0, 1, 1,
0.5084654, 0.5079702, 1.725954, 0.06666667, 0, 1, 1,
0.5093616, -0.4802816, 2.505621, 0.07450981, 0, 1, 1,
0.5152143, 1.275963, -0.5313219, 0.07843138, 0, 1, 1,
0.5163512, -0.02868342, 1.509364, 0.08627451, 0, 1, 1,
0.5168791, 1.411807, -0.558552, 0.09019608, 0, 1, 1,
0.5169048, 1.711973, -1.273958, 0.09803922, 0, 1, 1,
0.517278, -0.4914626, 3.895987, 0.1058824, 0, 1, 1,
0.5185245, -0.4842287, 3.805892, 0.1098039, 0, 1, 1,
0.5186657, 0.2778325, 1.120681, 0.1176471, 0, 1, 1,
0.5196083, -0.09483796, 2.743295, 0.1215686, 0, 1, 1,
0.5229337, -0.7764109, 2.412117, 0.1294118, 0, 1, 1,
0.5252718, 0.9021547, 0.4927136, 0.1333333, 0, 1, 1,
0.5257582, -1.246948, 3.635139, 0.1411765, 0, 1, 1,
0.5282721, 0.148209, 2.389202, 0.145098, 0, 1, 1,
0.529141, 1.352748, -0.1902568, 0.1529412, 0, 1, 1,
0.5319377, 1.074658, 0.4651802, 0.1568628, 0, 1, 1,
0.5342727, 1.03658, 1.190205, 0.1647059, 0, 1, 1,
0.5359606, -0.8326248, 3.748508, 0.1686275, 0, 1, 1,
0.5365797, 1.492347, 0.5305426, 0.1764706, 0, 1, 1,
0.5399667, 0.3258503, -1.217739, 0.1803922, 0, 1, 1,
0.5427449, -0.2336444, 4.082591, 0.1882353, 0, 1, 1,
0.5503132, -2.829291, 0.7727272, 0.1921569, 0, 1, 1,
0.552004, -0.4539897, 3.041476, 0.2, 0, 1, 1,
0.5531277, -1.508305, 2.433539, 0.2078431, 0, 1, 1,
0.5540097, 0.1228873, 1.62805, 0.2117647, 0, 1, 1,
0.5565315, -2.676853, 4.010486, 0.2196078, 0, 1, 1,
0.5578339, -0.1896864, 1.665967, 0.2235294, 0, 1, 1,
0.5633029, -0.189609, 2.103219, 0.2313726, 0, 1, 1,
0.5637327, -0.5734969, 2.264309, 0.2352941, 0, 1, 1,
0.5647122, 2.485036, 0.8144494, 0.2431373, 0, 1, 1,
0.5746343, -0.2068338, 0.4677316, 0.2470588, 0, 1, 1,
0.5798334, -0.1782508, 2.312744, 0.254902, 0, 1, 1,
0.5807354, -0.7890772, 2.333136, 0.2588235, 0, 1, 1,
0.5841382, 2.103489, 0.2474115, 0.2666667, 0, 1, 1,
0.5861775, -2.404895, 3.280437, 0.2705882, 0, 1, 1,
0.5896195, 0.2888261, 2.227636, 0.2784314, 0, 1, 1,
0.589667, -0.3095534, 3.128475, 0.282353, 0, 1, 1,
0.5921422, -2.355268, 2.607481, 0.2901961, 0, 1, 1,
0.6007584, -2.028953, 2.316912, 0.2941177, 0, 1, 1,
0.6020494, 1.082937, -0.6667524, 0.3019608, 0, 1, 1,
0.6079809, -0.9865011, 3.266797, 0.3098039, 0, 1, 1,
0.6239079, -1.143617, 2.020487, 0.3137255, 0, 1, 1,
0.6254447, 0.08487465, 1.002626, 0.3215686, 0, 1, 1,
0.6283231, 1.070257, 2.40133, 0.3254902, 0, 1, 1,
0.629631, -0.7300534, 1.728608, 0.3333333, 0, 1, 1,
0.6363915, -1.028995, 2.720302, 0.3372549, 0, 1, 1,
0.6411421, 1.236255, 1.786325, 0.345098, 0, 1, 1,
0.6467653, 0.3366207, 0.005684055, 0.3490196, 0, 1, 1,
0.6488839, 0.4176596, 0.2592867, 0.3568628, 0, 1, 1,
0.6521661, -0.6246892, 0.5999898, 0.3607843, 0, 1, 1,
0.6586428, -1.779564, 2.085236, 0.3686275, 0, 1, 1,
0.6587949, -0.9702422, 2.579597, 0.372549, 0, 1, 1,
0.6602346, -0.07957352, 2.527077, 0.3803922, 0, 1, 1,
0.6640629, -0.1686445, 1.684473, 0.3843137, 0, 1, 1,
0.6683324, -1.309783, 1.731106, 0.3921569, 0, 1, 1,
0.6791639, 1.932985, 0.3437377, 0.3960784, 0, 1, 1,
0.6803316, 1.476434, -0.9886807, 0.4039216, 0, 1, 1,
0.6813751, -0.01281999, 2.18026, 0.4117647, 0, 1, 1,
0.6848653, 0.8882063, 0.8952833, 0.4156863, 0, 1, 1,
0.6867698, -1.077726, 1.187354, 0.4235294, 0, 1, 1,
0.6868488, -1.011694, 4.409531, 0.427451, 0, 1, 1,
0.6892322, 0.940097, -0.5763543, 0.4352941, 0, 1, 1,
0.6904517, -0.01469393, 2.905793, 0.4392157, 0, 1, 1,
0.6917031, -0.4729939, 3.341371, 0.4470588, 0, 1, 1,
0.6917614, 1.479719, 0.5875759, 0.4509804, 0, 1, 1,
0.6920463, -0.6737651, 2.785526, 0.4588235, 0, 1, 1,
0.6926736, 1.276317, -2.12654, 0.4627451, 0, 1, 1,
0.6957516, 0.3849638, 2.839022, 0.4705882, 0, 1, 1,
0.699975, -1.199269, 4.366313, 0.4745098, 0, 1, 1,
0.7026667, 0.1211835, 2.878959, 0.4823529, 0, 1, 1,
0.7040714, -0.5257136, 2.945625, 0.4862745, 0, 1, 1,
0.7052943, 1.356787, -0.3937025, 0.4941176, 0, 1, 1,
0.7070364, -1.24592, 2.632981, 0.5019608, 0, 1, 1,
0.7115704, -1.32562, 1.310458, 0.5058824, 0, 1, 1,
0.71311, -0.6179764, 2.381102, 0.5137255, 0, 1, 1,
0.7148108, -0.1953979, 1.471421, 0.5176471, 0, 1, 1,
0.7184097, -0.7349943, 3.3179, 0.5254902, 0, 1, 1,
0.7348031, -0.1632102, 4.029306, 0.5294118, 0, 1, 1,
0.7433488, 0.2388721, -0.02410047, 0.5372549, 0, 1, 1,
0.7500136, -0.04767837, 2.792224, 0.5411765, 0, 1, 1,
0.755643, -1.444395, 2.196628, 0.5490196, 0, 1, 1,
0.7586075, -1.084495, 2.743106, 0.5529412, 0, 1, 1,
0.7624255, 1.201669, -0.07804677, 0.5607843, 0, 1, 1,
0.7682923, 0.5235758, 0.4909328, 0.5647059, 0, 1, 1,
0.7742335, -0.8466772, 2.59602, 0.572549, 0, 1, 1,
0.7763051, -1.076485, 1.765543, 0.5764706, 0, 1, 1,
0.780375, 0.6259162, 0.9673039, 0.5843138, 0, 1, 1,
0.7830181, -1.989793, 0.7903701, 0.5882353, 0, 1, 1,
0.7856231, -0.5600731, 0.7594445, 0.5960785, 0, 1, 1,
0.7884672, -1.628042, 4.274754, 0.6039216, 0, 1, 1,
0.7970088, 1.918905, -0.2991485, 0.6078432, 0, 1, 1,
0.798224, -0.7747067, 2.467017, 0.6156863, 0, 1, 1,
0.7996409, 1.173626, 0.04257368, 0.6196079, 0, 1, 1,
0.8141771, -1.196779, 3.433851, 0.627451, 0, 1, 1,
0.8161902, -0.189339, 3.105675, 0.6313726, 0, 1, 1,
0.8170319, 1.477189, 0.6253691, 0.6392157, 0, 1, 1,
0.8200867, 0.8026432, 1.163589, 0.6431373, 0, 1, 1,
0.8206261, 0.3551703, 1.313421, 0.6509804, 0, 1, 1,
0.8213552, -0.3225631, 2.234766, 0.654902, 0, 1, 1,
0.8224586, 1.045099, 0.1820818, 0.6627451, 0, 1, 1,
0.822829, -1.056142, 3.133218, 0.6666667, 0, 1, 1,
0.8313341, 1.649143, 2.042761, 0.6745098, 0, 1, 1,
0.8313649, 1.446958, 2.082011, 0.6784314, 0, 1, 1,
0.8321278, 0.9019648, 1.166813, 0.6862745, 0, 1, 1,
0.8372888, -0.08972454, 1.877421, 0.6901961, 0, 1, 1,
0.8404193, 1.034387, -2.408609, 0.6980392, 0, 1, 1,
0.8422807, 0.8572741, 0.7262997, 0.7058824, 0, 1, 1,
0.8433135, 0.1563074, 2.034081, 0.7098039, 0, 1, 1,
0.843694, -1.381359, 2.33703, 0.7176471, 0, 1, 1,
0.8449883, -0.5951198, 1.708963, 0.7215686, 0, 1, 1,
0.8465613, 0.0541408, 2.593007, 0.7294118, 0, 1, 1,
0.8471953, -0.8291169, 1.686947, 0.7333333, 0, 1, 1,
0.8483908, 0.0890127, 0.8203996, 0.7411765, 0, 1, 1,
0.8486924, -0.2338531, 2.868385, 0.7450981, 0, 1, 1,
0.8493518, -1.272801, 2.219609, 0.7529412, 0, 1, 1,
0.8541848, -0.05216879, 3.155099, 0.7568628, 0, 1, 1,
0.8567703, -0.8653951, 1.339825, 0.7647059, 0, 1, 1,
0.8568329, 0.8398542, 2.548835, 0.7686275, 0, 1, 1,
0.8601125, -0.8885113, 2.860593, 0.7764706, 0, 1, 1,
0.8605917, 0.72346, 0.634662, 0.7803922, 0, 1, 1,
0.8649806, 0.5281868, 2.634556, 0.7882353, 0, 1, 1,
0.8700956, 1.089903, 1.749826, 0.7921569, 0, 1, 1,
0.8704877, 0.3258212, 0.5033482, 0.8, 0, 1, 1,
0.8721839, -0.3625243, 3.620714, 0.8078431, 0, 1, 1,
0.8808573, 2.122314, 1.631366, 0.8117647, 0, 1, 1,
0.8840883, 1.090377, 0.9226184, 0.8196079, 0, 1, 1,
0.884912, 0.4127944, -1.343276, 0.8235294, 0, 1, 1,
0.891322, -0.977176, 0.7998947, 0.8313726, 0, 1, 1,
0.8919182, 0.8306121, 1.079947, 0.8352941, 0, 1, 1,
0.8987317, -1.382966, 3.609497, 0.8431373, 0, 1, 1,
0.9003409, -0.2561496, 2.237264, 0.8470588, 0, 1, 1,
0.9008352, -0.02104918, 1.538419, 0.854902, 0, 1, 1,
0.9068261, -0.242617, 0.5009013, 0.8588235, 0, 1, 1,
0.9116917, 1.328121, 2.119157, 0.8666667, 0, 1, 1,
0.9120617, 0.04554119, 2.169767, 0.8705882, 0, 1, 1,
0.9172217, -1.65095, 3.771306, 0.8784314, 0, 1, 1,
0.9199317, 0.02500638, 1.62142, 0.8823529, 0, 1, 1,
0.9298077, -0.7577342, 1.095559, 0.8901961, 0, 1, 1,
0.930155, 1.874898, 0.7127506, 0.8941177, 0, 1, 1,
0.9432599, -0.1797689, 2.39284, 0.9019608, 0, 1, 1,
0.9492783, -2.6228, 3.726075, 0.9098039, 0, 1, 1,
0.9527141, 0.9387818, 1.00904, 0.9137255, 0, 1, 1,
0.9580995, -0.6602827, 2.129793, 0.9215686, 0, 1, 1,
0.9583138, -2.164722, 1.508727, 0.9254902, 0, 1, 1,
0.9613458, 0.07784951, 0.9902806, 0.9333333, 0, 1, 1,
0.9622802, 3.196046, 1.156783, 0.9372549, 0, 1, 1,
0.9630063, -0.6965879, 2.605587, 0.945098, 0, 1, 1,
0.9729744, 2.11073, -0.3087251, 0.9490196, 0, 1, 1,
0.9754853, -0.5484943, 2.49524, 0.9568627, 0, 1, 1,
0.9827, 2.348878, -0.3335567, 0.9607843, 0, 1, 1,
0.9865723, 1.695813, 0.2820747, 0.9686275, 0, 1, 1,
0.9878328, 0.1872115, 0.08939724, 0.972549, 0, 1, 1,
0.9879321, -0.7446033, 1.563173, 0.9803922, 0, 1, 1,
0.9885526, 1.457245, -0.5581825, 0.9843137, 0, 1, 1,
0.9943191, 0.2872065, 0.9295123, 0.9921569, 0, 1, 1,
0.9956511, 0.1237151, 1.400704, 0.9960784, 0, 1, 1,
1.002131, 0.1573567, 0.6852247, 1, 0, 0.9960784, 1,
1.006035, -1.215882, 1.342738, 1, 0, 0.9882353, 1,
1.008836, 1.59561, -0.2545436, 1, 0, 0.9843137, 1,
1.013572, 0.4272853, 1.834068, 1, 0, 0.9764706, 1,
1.015121, -1.725477, -0.3037721, 1, 0, 0.972549, 1,
1.017162, -0.7304568, 3.760339, 1, 0, 0.9647059, 1,
1.01978, -0.2353863, 2.886667, 1, 0, 0.9607843, 1,
1.020722, 1.627239, 1.796101, 1, 0, 0.9529412, 1,
1.023047, 0.1686255, 0.5981283, 1, 0, 0.9490196, 1,
1.030924, 0.6745955, 0.8028154, 1, 0, 0.9411765, 1,
1.033718, -1.569916, 1.669936, 1, 0, 0.9372549, 1,
1.038376, 1.089693, 1.14363, 1, 0, 0.9294118, 1,
1.03905, -0.1589604, 1.813158, 1, 0, 0.9254902, 1,
1.040087, -1.477954, 2.218718, 1, 0, 0.9176471, 1,
1.04324, -0.1398174, 0.4499025, 1, 0, 0.9137255, 1,
1.044352, 0.6427786, 0.5431852, 1, 0, 0.9058824, 1,
1.051355, 0.908297, 0.8570414, 1, 0, 0.9019608, 1,
1.053637, -0.8199061, 2.962067, 1, 0, 0.8941177, 1,
1.055176, 0.3221121, 0.1921885, 1, 0, 0.8862745, 1,
1.065369, 0.466668, 0.7445077, 1, 0, 0.8823529, 1,
1.06768, 0.912124, 0.9361911, 1, 0, 0.8745098, 1,
1.069286, -0.2485652, 0.3790118, 1, 0, 0.8705882, 1,
1.073953, -1.058282, 3.242839, 1, 0, 0.8627451, 1,
1.075272, 1.090629, 2.289394, 1, 0, 0.8588235, 1,
1.076725, -0.2692116, 0.8781726, 1, 0, 0.8509804, 1,
1.083176, 1.28582, 0.4321966, 1, 0, 0.8470588, 1,
1.084372, -2.010085, 3.848383, 1, 0, 0.8392157, 1,
1.086655, 1.884361, 0.6815433, 1, 0, 0.8352941, 1,
1.087463, 0.5881696, 1.571122, 1, 0, 0.827451, 1,
1.089916, -1.183329, 4.008449, 1, 0, 0.8235294, 1,
1.094278, 0.4277938, 0.5684488, 1, 0, 0.8156863, 1,
1.094869, -0.7438129, 2.442073, 1, 0, 0.8117647, 1,
1.097049, 0.6502555, 2.126998, 1, 0, 0.8039216, 1,
1.097779, -1.304069, 1.681748, 1, 0, 0.7960784, 1,
1.100092, 0.4584482, 1.245484, 1, 0, 0.7921569, 1,
1.121978, 0.08601325, 0.5337455, 1, 0, 0.7843137, 1,
1.128828, -0.8188511, 3.154181, 1, 0, 0.7803922, 1,
1.131079, -0.2394641, 1.135008, 1, 0, 0.772549, 1,
1.135987, 0.09667172, 1.145957, 1, 0, 0.7686275, 1,
1.153067, -0.4129163, 2.866741, 1, 0, 0.7607843, 1,
1.154962, -0.6752846, 2.184604, 1, 0, 0.7568628, 1,
1.157511, -0.08238902, 1.474371, 1, 0, 0.7490196, 1,
1.1648, 1.242597, 0.6416419, 1, 0, 0.7450981, 1,
1.1705, 1.065289, 1.531029, 1, 0, 0.7372549, 1,
1.174418, 1.495296, 0.3203984, 1, 0, 0.7333333, 1,
1.180134, 0.0246052, 1.652805, 1, 0, 0.7254902, 1,
1.18109, -1.133591, 1.44089, 1, 0, 0.7215686, 1,
1.18384, -0.007591821, 1.403517, 1, 0, 0.7137255, 1,
1.184217, -0.7114017, 2.079174, 1, 0, 0.7098039, 1,
1.185189, 0.04192154, 0.4135045, 1, 0, 0.7019608, 1,
1.185426, -0.6305193, 2.755513, 1, 0, 0.6941177, 1,
1.185907, 0.1781026, 0.8354365, 1, 0, 0.6901961, 1,
1.186314, -1.029235, 2.283508, 1, 0, 0.682353, 1,
1.189506, 0.1348286, 1.060836, 1, 0, 0.6784314, 1,
1.198272, -1.14996, 0.6015831, 1, 0, 0.6705883, 1,
1.205663, -0.2298053, 1.981578, 1, 0, 0.6666667, 1,
1.240171, 0.8708075, 2.273188, 1, 0, 0.6588235, 1,
1.242368, 1.497945, 1.033458, 1, 0, 0.654902, 1,
1.27023, -0.09780418, 2.078584, 1, 0, 0.6470588, 1,
1.27591, 0.09137508, 2.785202, 1, 0, 0.6431373, 1,
1.279209, -0.6419215, 2.340028, 1, 0, 0.6352941, 1,
1.27952, -1.359847, 3.50573, 1, 0, 0.6313726, 1,
1.286206, -1.234167, 3.595158, 1, 0, 0.6235294, 1,
1.295381, 1.623708, 0.8029003, 1, 0, 0.6196079, 1,
1.306806, -0.1264222, 2.72399, 1, 0, 0.6117647, 1,
1.316804, -0.6375157, 3.058851, 1, 0, 0.6078432, 1,
1.319433, 0.1586253, 3.422556, 1, 0, 0.6, 1,
1.319819, 1.268036, 1.194611, 1, 0, 0.5921569, 1,
1.330639, -0.6905192, 0.9522216, 1, 0, 0.5882353, 1,
1.330707, -0.8131724, 2.877022, 1, 0, 0.5803922, 1,
1.338833, 0.4651344, 1.854183, 1, 0, 0.5764706, 1,
1.356317, -0.4148611, 1.466672, 1, 0, 0.5686275, 1,
1.356871, -0.4784985, 1.553602, 1, 0, 0.5647059, 1,
1.366976, -1.248597, 3.138132, 1, 0, 0.5568628, 1,
1.373304, -0.2122398, 3.274494, 1, 0, 0.5529412, 1,
1.386785, -1.380759, 3.546087, 1, 0, 0.5450981, 1,
1.398265, -1.20519, 2.068156, 1, 0, 0.5411765, 1,
1.399242, -0.9599836, 2.8197, 1, 0, 0.5333334, 1,
1.40765, 0.5812158, 1.096126, 1, 0, 0.5294118, 1,
1.414079, -1.421693, 2.997526, 1, 0, 0.5215687, 1,
1.416947, -0.2618324, 2.156425, 1, 0, 0.5176471, 1,
1.418179, -0.003807434, 0.6193425, 1, 0, 0.509804, 1,
1.431951, -0.4611182, 1.549114, 1, 0, 0.5058824, 1,
1.443977, -0.3506407, 1.480624, 1, 0, 0.4980392, 1,
1.457487, -0.1711564, 0.4396245, 1, 0, 0.4901961, 1,
1.458417, 2.242692, -0.3806889, 1, 0, 0.4862745, 1,
1.466868, 0.5137061, 0.1485588, 1, 0, 0.4784314, 1,
1.46759, 0.0612227, -0.00196189, 1, 0, 0.4745098, 1,
1.470687, 0.9462735, 2.387539, 1, 0, 0.4666667, 1,
1.476753, 0.2317715, 2.404076, 1, 0, 0.4627451, 1,
1.480339, 1.502706, 2.942981, 1, 0, 0.454902, 1,
1.482912, 1.043231, 1.612465, 1, 0, 0.4509804, 1,
1.489003, 0.3662619, -0.2790399, 1, 0, 0.4431373, 1,
1.508894, 0.3688372, 0.258664, 1, 0, 0.4392157, 1,
1.546733, -0.03726162, 0.05519141, 1, 0, 0.4313726, 1,
1.561698, -0.7603668, 0.5439047, 1, 0, 0.427451, 1,
1.563707, -0.3511213, 3.543522, 1, 0, 0.4196078, 1,
1.567866, 0.870052, 0.09169774, 1, 0, 0.4156863, 1,
1.598505, -0.5014661, 0.8119971, 1, 0, 0.4078431, 1,
1.599629, -0.00509269, 0.1960611, 1, 0, 0.4039216, 1,
1.627689, 0.3342986, 0.9083463, 1, 0, 0.3960784, 1,
1.634222, -1.076985, 2.747517, 1, 0, 0.3882353, 1,
1.646203, 0.2682695, 1.559932, 1, 0, 0.3843137, 1,
1.650489, 1.157282, 1.468424, 1, 0, 0.3764706, 1,
1.654023, -0.2157869, 3.83717, 1, 0, 0.372549, 1,
1.658321, -1.32381, 2.089092, 1, 0, 0.3647059, 1,
1.660466, 0.1468501, 2.358052, 1, 0, 0.3607843, 1,
1.668248, 2.338073, 1.091953, 1, 0, 0.3529412, 1,
1.67183, 2.047352, 0.4279835, 1, 0, 0.3490196, 1,
1.685556, 0.2153417, 2.558429, 1, 0, 0.3411765, 1,
1.692008, -1.03916, 2.936804, 1, 0, 0.3372549, 1,
1.693752, 0.1207127, 1.705602, 1, 0, 0.3294118, 1,
1.694135, -0.7205001, 2.316723, 1, 0, 0.3254902, 1,
1.695729, -0.6343531, 1.089312, 1, 0, 0.3176471, 1,
1.707278, -0.23018, 1.349352, 1, 0, 0.3137255, 1,
1.722346, 0.5660379, 2.166191, 1, 0, 0.3058824, 1,
1.722968, 0.1926199, 3.865217, 1, 0, 0.2980392, 1,
1.723512, 1.240795, 1.822412, 1, 0, 0.2941177, 1,
1.726133, 1.275687, 0.3936018, 1, 0, 0.2862745, 1,
1.74161, -0.8334686, 1.656186, 1, 0, 0.282353, 1,
1.744584, -0.7966477, 2.617019, 1, 0, 0.2745098, 1,
1.751457, 0.1967735, 2.156184, 1, 0, 0.2705882, 1,
1.757174, -0.7371458, 2.823229, 1, 0, 0.2627451, 1,
1.784577, -0.4532307, 2.471367, 1, 0, 0.2588235, 1,
1.796212, -0.4878201, 2.064471, 1, 0, 0.2509804, 1,
1.822325, 1.002573, 2.779423, 1, 0, 0.2470588, 1,
1.84418, -0.3159584, 2.226495, 1, 0, 0.2392157, 1,
1.870954, -1.51784, 2.564698, 1, 0, 0.2352941, 1,
1.882317, -1.442478, 2.745753, 1, 0, 0.227451, 1,
1.892391, 0.06270844, 0.9997777, 1, 0, 0.2235294, 1,
1.897956, 0.3628224, 2.404912, 1, 0, 0.2156863, 1,
1.908627, 0.5089678, 2.137372, 1, 0, 0.2117647, 1,
1.91432, 1.318956, 1.96853, 1, 0, 0.2039216, 1,
1.946992, -0.2588852, 1.818793, 1, 0, 0.1960784, 1,
1.966788, -1.036258, 2.324349, 1, 0, 0.1921569, 1,
1.97811, -0.08599826, 1.218047, 1, 0, 0.1843137, 1,
1.984376, -2.781539, 1.002807, 1, 0, 0.1803922, 1,
1.98598, -0.301316, 1.847569, 1, 0, 0.172549, 1,
1.997887, 0.1220321, 1.659379, 1, 0, 0.1686275, 1,
2.008574, -1.078507, 1.700381, 1, 0, 0.1607843, 1,
2.038812, -0.3657511, 0.9284689, 1, 0, 0.1568628, 1,
2.056184, 0.2959982, 3.790855, 1, 0, 0.1490196, 1,
2.063123, -0.6213229, 1.94143, 1, 0, 0.145098, 1,
2.081019, -0.03679613, 2.133141, 1, 0, 0.1372549, 1,
2.081646, 0.8634189, -0.3165185, 1, 0, 0.1333333, 1,
2.11711, 0.1223772, 1.646185, 1, 0, 0.1254902, 1,
2.143176, -0.03944605, 2.27122, 1, 0, 0.1215686, 1,
2.177889, -0.1005756, 1.919493, 1, 0, 0.1137255, 1,
2.196784, 0.3844675, 0.2243178, 1, 0, 0.1098039, 1,
2.226619, -0.1916914, 0.6654053, 1, 0, 0.1019608, 1,
2.231938, 1.576702, 1.78637, 1, 0, 0.09411765, 1,
2.258367, -1.304615, 1.535, 1, 0, 0.09019608, 1,
2.38705, -0.3059815, 0.9564147, 1, 0, 0.08235294, 1,
2.409968, 0.7212109, 0.7013853, 1, 0, 0.07843138, 1,
2.520442, 1.923021, -0.4691516, 1, 0, 0.07058824, 1,
2.542435, -0.4707561, 1.794077, 1, 0, 0.06666667, 1,
2.559331, -0.4560092, 3.398885, 1, 0, 0.05882353, 1,
2.578776, 0.4693807, 2.569149, 1, 0, 0.05490196, 1,
2.592169, -2.174213, 2.541079, 1, 0, 0.04705882, 1,
2.741835, 0.2893286, -0.3747605, 1, 0, 0.04313726, 1,
2.772014, -0.004363953, 2.973362, 1, 0, 0.03529412, 1,
2.860563, 0.2892596, 2.566183, 1, 0, 0.03137255, 1,
2.909426, -0.1248158, -0.6109174, 1, 0, 0.02352941, 1,
3.105864, 1.47084, 0.1508954, 1, 0, 0.01960784, 1,
3.239594, 0.3136764, 0.0690972, 1, 0, 0.01176471, 1,
3.308719, 0.4475048, 0.1964409, 1, 0, 0.007843138, 1
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
-0.03839624, -3.850585, -8.056974, 0, -0.5, 0.5, 0.5,
-0.03839624, -3.850585, -8.056974, 1, -0.5, 0.5, 0.5,
-0.03839624, -3.850585, -8.056974, 1, 1.5, 0.5, 0.5,
-0.03839624, -3.850585, -8.056974, 0, 1.5, 0.5, 0.5
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
-4.520183, 0.1833775, -8.056974, 0, -0.5, 0.5, 0.5,
-4.520183, 0.1833775, -8.056974, 1, -0.5, 0.5, 0.5,
-4.520183, 0.1833775, -8.056974, 1, 1.5, 0.5, 0.5,
-4.520183, 0.1833775, -8.056974, 0, 1.5, 0.5, 0.5
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
-4.520183, -3.850585, -0.2195363, 0, -0.5, 0.5, 0.5,
-4.520183, -3.850585, -0.2195363, 1, -0.5, 0.5, 0.5,
-4.520183, -3.850585, -0.2195363, 1, 1.5, 0.5, 0.5,
-4.520183, -3.850585, -0.2195363, 0, 1.5, 0.5, 0.5
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
-3, -2.919671, -6.248335,
3, -2.919671, -6.248335,
-3, -2.919671, -6.248335,
-3, -3.074823, -6.549775,
-2, -2.919671, -6.248335,
-2, -3.074823, -6.549775,
-1, -2.919671, -6.248335,
-1, -3.074823, -6.549775,
0, -2.919671, -6.248335,
0, -3.074823, -6.549775,
1, -2.919671, -6.248335,
1, -3.074823, -6.549775,
2, -2.919671, -6.248335,
2, -3.074823, -6.549775,
3, -2.919671, -6.248335,
3, -3.074823, -6.549775
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
-3, -3.385128, -7.152655, 0, -0.5, 0.5, 0.5,
-3, -3.385128, -7.152655, 1, -0.5, 0.5, 0.5,
-3, -3.385128, -7.152655, 1, 1.5, 0.5, 0.5,
-3, -3.385128, -7.152655, 0, 1.5, 0.5, 0.5,
-2, -3.385128, -7.152655, 0, -0.5, 0.5, 0.5,
-2, -3.385128, -7.152655, 1, -0.5, 0.5, 0.5,
-2, -3.385128, -7.152655, 1, 1.5, 0.5, 0.5,
-2, -3.385128, -7.152655, 0, 1.5, 0.5, 0.5,
-1, -3.385128, -7.152655, 0, -0.5, 0.5, 0.5,
-1, -3.385128, -7.152655, 1, -0.5, 0.5, 0.5,
-1, -3.385128, -7.152655, 1, 1.5, 0.5, 0.5,
-1, -3.385128, -7.152655, 0, 1.5, 0.5, 0.5,
0, -3.385128, -7.152655, 0, -0.5, 0.5, 0.5,
0, -3.385128, -7.152655, 1, -0.5, 0.5, 0.5,
0, -3.385128, -7.152655, 1, 1.5, 0.5, 0.5,
0, -3.385128, -7.152655, 0, 1.5, 0.5, 0.5,
1, -3.385128, -7.152655, 0, -0.5, 0.5, 0.5,
1, -3.385128, -7.152655, 1, -0.5, 0.5, 0.5,
1, -3.385128, -7.152655, 1, 1.5, 0.5, 0.5,
1, -3.385128, -7.152655, 0, 1.5, 0.5, 0.5,
2, -3.385128, -7.152655, 0, -0.5, 0.5, 0.5,
2, -3.385128, -7.152655, 1, -0.5, 0.5, 0.5,
2, -3.385128, -7.152655, 1, 1.5, 0.5, 0.5,
2, -3.385128, -7.152655, 0, 1.5, 0.5, 0.5,
3, -3.385128, -7.152655, 0, -0.5, 0.5, 0.5,
3, -3.385128, -7.152655, 1, -0.5, 0.5, 0.5,
3, -3.385128, -7.152655, 1, 1.5, 0.5, 0.5,
3, -3.385128, -7.152655, 0, 1.5, 0.5, 0.5
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
-3.485925, -2, -6.248335,
-3.485925, 3, -6.248335,
-3.485925, -2, -6.248335,
-3.658301, -2, -6.549775,
-3.485925, -1, -6.248335,
-3.658301, -1, -6.549775,
-3.485925, 0, -6.248335,
-3.658301, 0, -6.549775,
-3.485925, 1, -6.248335,
-3.658301, 1, -6.549775,
-3.485925, 2, -6.248335,
-3.658301, 2, -6.549775,
-3.485925, 3, -6.248335,
-3.658301, 3, -6.549775
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
-4.003054, -2, -7.152655, 0, -0.5, 0.5, 0.5,
-4.003054, -2, -7.152655, 1, -0.5, 0.5, 0.5,
-4.003054, -2, -7.152655, 1, 1.5, 0.5, 0.5,
-4.003054, -2, -7.152655, 0, 1.5, 0.5, 0.5,
-4.003054, -1, -7.152655, 0, -0.5, 0.5, 0.5,
-4.003054, -1, -7.152655, 1, -0.5, 0.5, 0.5,
-4.003054, -1, -7.152655, 1, 1.5, 0.5, 0.5,
-4.003054, -1, -7.152655, 0, 1.5, 0.5, 0.5,
-4.003054, 0, -7.152655, 0, -0.5, 0.5, 0.5,
-4.003054, 0, -7.152655, 1, -0.5, 0.5, 0.5,
-4.003054, 0, -7.152655, 1, 1.5, 0.5, 0.5,
-4.003054, 0, -7.152655, 0, 1.5, 0.5, 0.5,
-4.003054, 1, -7.152655, 0, -0.5, 0.5, 0.5,
-4.003054, 1, -7.152655, 1, -0.5, 0.5, 0.5,
-4.003054, 1, -7.152655, 1, 1.5, 0.5, 0.5,
-4.003054, 1, -7.152655, 0, 1.5, 0.5, 0.5,
-4.003054, 2, -7.152655, 0, -0.5, 0.5, 0.5,
-4.003054, 2, -7.152655, 1, -0.5, 0.5, 0.5,
-4.003054, 2, -7.152655, 1, 1.5, 0.5, 0.5,
-4.003054, 2, -7.152655, 0, 1.5, 0.5, 0.5,
-4.003054, 3, -7.152655, 0, -0.5, 0.5, 0.5,
-4.003054, 3, -7.152655, 1, -0.5, 0.5, 0.5,
-4.003054, 3, -7.152655, 1, 1.5, 0.5, 0.5,
-4.003054, 3, -7.152655, 0, 1.5, 0.5, 0.5
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
-3.485925, -2.919671, -6,
-3.485925, -2.919671, 4,
-3.485925, -2.919671, -6,
-3.658301, -3.074823, -6,
-3.485925, -2.919671, -4,
-3.658301, -3.074823, -4,
-3.485925, -2.919671, -2,
-3.658301, -3.074823, -2,
-3.485925, -2.919671, 0,
-3.658301, -3.074823, 0,
-3.485925, -2.919671, 2,
-3.658301, -3.074823, 2,
-3.485925, -2.919671, 4,
-3.658301, -3.074823, 4
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
-4.003054, -3.385128, -6, 0, -0.5, 0.5, 0.5,
-4.003054, -3.385128, -6, 1, -0.5, 0.5, 0.5,
-4.003054, -3.385128, -6, 1, 1.5, 0.5, 0.5,
-4.003054, -3.385128, -6, 0, 1.5, 0.5, 0.5,
-4.003054, -3.385128, -4, 0, -0.5, 0.5, 0.5,
-4.003054, -3.385128, -4, 1, -0.5, 0.5, 0.5,
-4.003054, -3.385128, -4, 1, 1.5, 0.5, 0.5,
-4.003054, -3.385128, -4, 0, 1.5, 0.5, 0.5,
-4.003054, -3.385128, -2, 0, -0.5, 0.5, 0.5,
-4.003054, -3.385128, -2, 1, -0.5, 0.5, 0.5,
-4.003054, -3.385128, -2, 1, 1.5, 0.5, 0.5,
-4.003054, -3.385128, -2, 0, 1.5, 0.5, 0.5,
-4.003054, -3.385128, 0, 0, -0.5, 0.5, 0.5,
-4.003054, -3.385128, 0, 1, -0.5, 0.5, 0.5,
-4.003054, -3.385128, 0, 1, 1.5, 0.5, 0.5,
-4.003054, -3.385128, 0, 0, 1.5, 0.5, 0.5,
-4.003054, -3.385128, 2, 0, -0.5, 0.5, 0.5,
-4.003054, -3.385128, 2, 1, -0.5, 0.5, 0.5,
-4.003054, -3.385128, 2, 1, 1.5, 0.5, 0.5,
-4.003054, -3.385128, 2, 0, 1.5, 0.5, 0.5,
-4.003054, -3.385128, 4, 0, -0.5, 0.5, 0.5,
-4.003054, -3.385128, 4, 1, -0.5, 0.5, 0.5,
-4.003054, -3.385128, 4, 1, 1.5, 0.5, 0.5,
-4.003054, -3.385128, 4, 0, 1.5, 0.5, 0.5
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
-3.485925, -2.919671, -6.248335,
-3.485925, 3.286426, -6.248335,
-3.485925, -2.919671, 5.809262,
-3.485925, 3.286426, 5.809262,
-3.485925, -2.919671, -6.248335,
-3.485925, -2.919671, 5.809262,
-3.485925, 3.286426, -6.248335,
-3.485925, 3.286426, 5.809262,
-3.485925, -2.919671, -6.248335,
3.409132, -2.919671, -6.248335,
-3.485925, -2.919671, 5.809262,
3.409132, -2.919671, 5.809262,
-3.485925, 3.286426, -6.248335,
3.409132, 3.286426, -6.248335,
-3.485925, 3.286426, 5.809262,
3.409132, 3.286426, 5.809262,
3.409132, -2.919671, -6.248335,
3.409132, 3.286426, -6.248335,
3.409132, -2.919671, 5.809262,
3.409132, 3.286426, 5.809262,
3.409132, -2.919671, -6.248335,
3.409132, -2.919671, 5.809262,
3.409132, 3.286426, -6.248335,
3.409132, 3.286426, 5.809262
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
var radius = 8.123582;
var distance = 36.14273;
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
mvMatrix.translate( 0.03839624, -0.1833775, 0.2195363 );
mvMatrix.scale( 1.273866, 1.415282, 0.7284516 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.14273);
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
Dimilin<-read.table("Dimilin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dimilin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dimilin' not found
```

```r
y<-Dimilin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dimilin' not found
```

```r
z<-Dimilin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dimilin' not found
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
-3.385511, 0.6944451, -1.952631, 0, 0, 1, 1, 1,
-3.104032, 1.881163, -0.6168941, 1, 0, 0, 1, 1,
-2.84897, 0.5032893, 0.707822, 1, 0, 0, 1, 1,
-2.789666, 0.5263965, -1.502387, 1, 0, 0, 1, 1,
-2.615846, 0.7521827, -1.137642, 1, 0, 0, 1, 1,
-2.454249, -0.09245964, -0.5375845, 1, 0, 0, 1, 1,
-2.449574, 0.4136793, -4.539639, 0, 0, 0, 1, 1,
-2.428554, -0.08414516, -0.7197917, 0, 0, 0, 1, 1,
-2.419535, 2.819413, -0.8503668, 0, 0, 0, 1, 1,
-2.309793, 0.5539296, -2.180376, 0, 0, 0, 1, 1,
-2.199331, -0.4125233, -2.820791, 0, 0, 0, 1, 1,
-2.156817, 0.9908271, -1.352726, 0, 0, 0, 1, 1,
-2.153114, -1.138343, -1.144045, 0, 0, 0, 1, 1,
-2.135597, -1.860872, -0.3593653, 1, 1, 1, 1, 1,
-2.132025, 0.7684919, -1.029397, 1, 1, 1, 1, 1,
-2.106044, -0.01852866, -1.672805, 1, 1, 1, 1, 1,
-2.065392, -1.921757, -2.487213, 1, 1, 1, 1, 1,
-2.021762, -0.6302618, -2.144091, 1, 1, 1, 1, 1,
-2.015661, -1.259691, -3.879385, 1, 1, 1, 1, 1,
-1.988639, 0.3514043, -0.6837163, 1, 1, 1, 1, 1,
-1.984111, -1.106856, -0.5116745, 1, 1, 1, 1, 1,
-1.978615, -1.339727, -3.694355, 1, 1, 1, 1, 1,
-1.923716, -0.436352, -1.98529, 1, 1, 1, 1, 1,
-1.872534, 1.263841, -0.8570605, 1, 1, 1, 1, 1,
-1.847333, 1.048042, -1.724354, 1, 1, 1, 1, 1,
-1.842204, 0.7872318, -0.1839704, 1, 1, 1, 1, 1,
-1.827516, -0.5728785, -3.335372, 1, 1, 1, 1, 1,
-1.794629, 0.9206249, -1.126824, 1, 1, 1, 1, 1,
-1.789759, 1.035264, -2.324066, 0, 0, 1, 1, 1,
-1.780258, 1.084778, -2.28468, 1, 0, 0, 1, 1,
-1.737255, 0.6250975, -2.197448, 1, 0, 0, 1, 1,
-1.710121, 2.064222, -1.359215, 1, 0, 0, 1, 1,
-1.710058, 0.3762383, -0.2459767, 1, 0, 0, 1, 1,
-1.69622, -0.1253919, -2.40223, 1, 0, 0, 1, 1,
-1.695049, 0.3441758, -2.146334, 0, 0, 0, 1, 1,
-1.659944, 0.1714451, -0.8238493, 0, 0, 0, 1, 1,
-1.654433, 2.194629, 0.3430059, 0, 0, 0, 1, 1,
-1.649482, 1.700469, -0.8878967, 0, 0, 0, 1, 1,
-1.642868, 0.2604703, -1.040507, 0, 0, 0, 1, 1,
-1.637478, 0.145675, -2.811939, 0, 0, 0, 1, 1,
-1.627727, 0.2007687, -2.432891, 0, 0, 0, 1, 1,
-1.627107, -0.9249346, -1.030825, 1, 1, 1, 1, 1,
-1.606138, 0.5189266, -0.8290071, 1, 1, 1, 1, 1,
-1.595348, 0.4209828, -1.127138, 1, 1, 1, 1, 1,
-1.570666, -0.4808631, -1.068227, 1, 1, 1, 1, 1,
-1.560606, 1.161074, -1.928946, 1, 1, 1, 1, 1,
-1.558203, 0.439425, -1.680243, 1, 1, 1, 1, 1,
-1.546224, -1.304006, -1.412223, 1, 1, 1, 1, 1,
-1.542714, 0.6864247, -1.994158, 1, 1, 1, 1, 1,
-1.516553, 1.830538, -1.755023, 1, 1, 1, 1, 1,
-1.487656, 0.342887, -0.9253039, 1, 1, 1, 1, 1,
-1.48531, -0.5671831, -1.934637, 1, 1, 1, 1, 1,
-1.479737, 0.6805797, -0.6730588, 1, 1, 1, 1, 1,
-1.477418, -0.8506772, -2.882835, 1, 1, 1, 1, 1,
-1.473957, -0.03061786, -0.7920725, 1, 1, 1, 1, 1,
-1.470235, -0.1206683, -0.5745243, 1, 1, 1, 1, 1,
-1.454461, -0.356878, -2.025675, 0, 0, 1, 1, 1,
-1.450161, 1.575496, -1.538263, 1, 0, 0, 1, 1,
-1.441748, 0.4897834, -3.015143, 1, 0, 0, 1, 1,
-1.440822, 0.4060782, -0.5646721, 1, 0, 0, 1, 1,
-1.435814, 1.247952, -1.630114, 1, 0, 0, 1, 1,
-1.431261, 0.9689283, -1.878143, 1, 0, 0, 1, 1,
-1.429046, -1.553953, -1.833129, 0, 0, 0, 1, 1,
-1.428823, -0.9035167, -3.641064, 0, 0, 0, 1, 1,
-1.427565, -0.3924315, -2.473785, 0, 0, 0, 1, 1,
-1.403747, 0.667011, -0.973181, 0, 0, 0, 1, 1,
-1.403532, 0.5389745, -1.22709, 0, 0, 0, 1, 1,
-1.393627, -0.7103193, -3.45472, 0, 0, 0, 1, 1,
-1.361579, 0.2249388, -1.582026, 0, 0, 0, 1, 1,
-1.357508, 0.2429234, -2.878592, 1, 1, 1, 1, 1,
-1.351775, 1.517443, -2.88599, 1, 1, 1, 1, 1,
-1.325993, -0.2291203, -2.365099, 1, 1, 1, 1, 1,
-1.31568, 0.8260769, -2.401078, 1, 1, 1, 1, 1,
-1.31381, -1.043067, -0.3462906, 1, 1, 1, 1, 1,
-1.313341, -1.174623, -2.413274, 1, 1, 1, 1, 1,
-1.305073, -0.2564622, -1.266662, 1, 1, 1, 1, 1,
-1.305033, -0.7102094, -3.448551, 1, 1, 1, 1, 1,
-1.304901, 0.4500885, -1.731436, 1, 1, 1, 1, 1,
-1.286017, 0.709967, -1.908577, 1, 1, 1, 1, 1,
-1.285373, -1.433457, -1.763506, 1, 1, 1, 1, 1,
-1.27624, -0.1584287, -3.023688, 1, 1, 1, 1, 1,
-1.276153, 1.426932, 1.182394, 1, 1, 1, 1, 1,
-1.274805, 0.1557829, -0.8511862, 1, 1, 1, 1, 1,
-1.270204, -0.77147, -2.048091, 1, 1, 1, 1, 1,
-1.263451, 1.953334, 0.03071923, 0, 0, 1, 1, 1,
-1.263104, 1.427946, -2.340604, 1, 0, 0, 1, 1,
-1.245774, -0.01776956, -3.551569, 1, 0, 0, 1, 1,
-1.244243, 1.888212, 0.4703646, 1, 0, 0, 1, 1,
-1.237513, 0.4716086, 0.8023482, 1, 0, 0, 1, 1,
-1.232481, 0.08434315, -1.529139, 1, 0, 0, 1, 1,
-1.225945, -1.662303, -0.8207069, 0, 0, 0, 1, 1,
-1.225283, -0.75057, -1.651638, 0, 0, 0, 1, 1,
-1.225179, -1.951122, -3.054061, 0, 0, 0, 1, 1,
-1.217313, -0.7226967, -1.453339, 0, 0, 0, 1, 1,
-1.213126, 2.20729, -0.04179411, 0, 0, 0, 1, 1,
-1.212488, -1.203581, -1.453739, 0, 0, 0, 1, 1,
-1.204611, -1.023914, -1.611539, 0, 0, 0, 1, 1,
-1.200477, -0.2730288, -1.752832, 1, 1, 1, 1, 1,
-1.193044, 0.3799144, -1.319444, 1, 1, 1, 1, 1,
-1.186634, 1.379264, -1.017669, 1, 1, 1, 1, 1,
-1.178938, -1.146764, -4.260807, 1, 1, 1, 1, 1,
-1.17794, 0.1615717, -0.614054, 1, 1, 1, 1, 1,
-1.16636, -0.2436612, -1.167821, 1, 1, 1, 1, 1,
-1.166186, 0.3526115, -1.950979, 1, 1, 1, 1, 1,
-1.148321, -0.3018519, -2.727448, 1, 1, 1, 1, 1,
-1.141111, -0.5138105, -2.016968, 1, 1, 1, 1, 1,
-1.140662, -1.969072, -1.901865, 1, 1, 1, 1, 1,
-1.139238, -1.661696, -2.661875, 1, 1, 1, 1, 1,
-1.138846, 0.1762608, -1.210344, 1, 1, 1, 1, 1,
-1.137794, 0.8649126, -0.9220135, 1, 1, 1, 1, 1,
-1.137517, -0.1866097, -1.776776, 1, 1, 1, 1, 1,
-1.13277, -0.05882565, -1.210372, 1, 1, 1, 1, 1,
-1.131866, -0.4850561, -1.771672, 0, 0, 1, 1, 1,
-1.127016, -0.3393559, -0.5697317, 1, 0, 0, 1, 1,
-1.122703, 1.110268, -0.6838704, 1, 0, 0, 1, 1,
-1.114756, 1.65136, -1.736557, 1, 0, 0, 1, 1,
-1.112027, 0.01260858, -2.963139, 1, 0, 0, 1, 1,
-1.097121, -0.3080064, -1.879537, 1, 0, 0, 1, 1,
-1.096295, 2.063512, -0.9341961, 0, 0, 0, 1, 1,
-1.093293, 0.1207653, -1.633809, 0, 0, 0, 1, 1,
-1.089444, -0.9088295, -3.179847, 0, 0, 0, 1, 1,
-1.079643, -1.166136, -0.4901821, 0, 0, 0, 1, 1,
-1.078306, -0.4176198, -1.874632, 0, 0, 0, 1, 1,
-1.075764, -1.137764, -0.7104302, 0, 0, 0, 1, 1,
-1.068374, 0.5410028, 0.2733037, 0, 0, 0, 1, 1,
-1.068063, 0.3801723, -2.24237, 1, 1, 1, 1, 1,
-1.067937, -0.69008, -0.9197005, 1, 1, 1, 1, 1,
-1.063132, -1.794105, -3.493297, 1, 1, 1, 1, 1,
-1.056681, 0.9703243, -1.804771, 1, 1, 1, 1, 1,
-1.035986, -0.5448657, -4.462986, 1, 1, 1, 1, 1,
-1.031447, -1.983915, -3.510838, 1, 1, 1, 1, 1,
-1.028781, -1.2575, -1.205865, 1, 1, 1, 1, 1,
-1.017344, 0.006197502, -2.205142, 1, 1, 1, 1, 1,
-1.016907, 0.8424833, -0.3636472, 1, 1, 1, 1, 1,
-1.003519, -0.5425575, -1.830508, 1, 1, 1, 1, 1,
-1.000792, 1.463099, -1.183141, 1, 1, 1, 1, 1,
-0.998816, -0.4563308, -1.15589, 1, 1, 1, 1, 1,
-0.9954101, -2.570162, -5.458251, 1, 1, 1, 1, 1,
-0.9930389, 0.820032, -2.019649, 1, 1, 1, 1, 1,
-0.9895378, 0.02062299, -0.2326845, 1, 1, 1, 1, 1,
-0.9858648, -0.5267946, -1.578223, 0, 0, 1, 1, 1,
-0.9853918, -0.003920962, -0.9732084, 1, 0, 0, 1, 1,
-0.982889, 1.500889, -1.075987, 1, 0, 0, 1, 1,
-0.9805542, 0.1312257, -3.064938, 1, 0, 0, 1, 1,
-0.9777448, -0.8735268, -4.250126, 1, 0, 0, 1, 1,
-0.9763821, 0.3379127, -0.1442369, 1, 0, 0, 1, 1,
-0.9757521, 0.380863, -1.692072, 0, 0, 0, 1, 1,
-0.9708975, -0.6889219, -0.5118678, 0, 0, 0, 1, 1,
-0.9668197, 0.8030823, 1.16374, 0, 0, 0, 1, 1,
-0.9630121, -0.3637888, -0.8374218, 0, 0, 0, 1, 1,
-0.9570212, 0.3854139, 0.2128227, 0, 0, 0, 1, 1,
-0.9506099, -0.2326694, -4.097147, 0, 0, 0, 1, 1,
-0.9332588, 0.4714502, -0.6714318, 0, 0, 0, 1, 1,
-0.9332481, 0.510141, -1.661453, 1, 1, 1, 1, 1,
-0.9293624, 0.6158166, -1.579113, 1, 1, 1, 1, 1,
-0.9262583, -0.1955204, -1.799777, 1, 1, 1, 1, 1,
-0.9245498, -0.3680394, -1.622587, 1, 1, 1, 1, 1,
-0.9183061, 1.08984, -2.999934, 1, 1, 1, 1, 1,
-0.9139432, 0.07074853, -0.9572748, 1, 1, 1, 1, 1,
-0.9123884, -0.5994411, -3.314693, 1, 1, 1, 1, 1,
-0.9080358, -1.700519, -1.687385, 1, 1, 1, 1, 1,
-0.8990226, -0.9881683, -3.659365, 1, 1, 1, 1, 1,
-0.8918846, 1.874534, 0.02765048, 1, 1, 1, 1, 1,
-0.8915721, 0.4240889, -1.385459, 1, 1, 1, 1, 1,
-0.8888685, -0.4183123, -2.482173, 1, 1, 1, 1, 1,
-0.8874221, 0.6970163, -1.34885, 1, 1, 1, 1, 1,
-0.886848, 0.06728326, -1.789959, 1, 1, 1, 1, 1,
-0.8861965, 0.40167, -0.4073873, 1, 1, 1, 1, 1,
-0.8829682, -0.629844, -2.237187, 0, 0, 1, 1, 1,
-0.8786283, -0.7831878, -1.260925, 1, 0, 0, 1, 1,
-0.8776474, 0.2626314, -2.523352, 1, 0, 0, 1, 1,
-0.871774, -0.746617, -2.297495, 1, 0, 0, 1, 1,
-0.8696113, -0.05500453, -0.4338744, 1, 0, 0, 1, 1,
-0.8670514, 1.292475, -0.477726, 1, 0, 0, 1, 1,
-0.8644135, 0.326943, -2.316395, 0, 0, 0, 1, 1,
-0.8633701, -0.6049396, -2.598252, 0, 0, 0, 1, 1,
-0.8622103, 2.719978, -1.046493, 0, 0, 0, 1, 1,
-0.8530185, 0.6101696, -1.396971, 0, 0, 0, 1, 1,
-0.8511104, 1.236683, 0.4476434, 0, 0, 0, 1, 1,
-0.8490314, -0.6134163, -2.715283, 0, 0, 0, 1, 1,
-0.8327645, 0.4954374, -1.404579, 0, 0, 0, 1, 1,
-0.819804, -1.969048, -2.306798, 1, 1, 1, 1, 1,
-0.8187431, -0.09228506, -3.450753, 1, 1, 1, 1, 1,
-0.8149999, 1.030404, -1.770239, 1, 1, 1, 1, 1,
-0.8143679, -0.0776981, -0.9861695, 1, 1, 1, 1, 1,
-0.8139897, 0.7264899, -0.9853188, 1, 1, 1, 1, 1,
-0.812696, 1.414266, -0.5660252, 1, 1, 1, 1, 1,
-0.8100533, 1.122911, -1.057998, 1, 1, 1, 1, 1,
-0.8093565, -0.2440728, -3.342831, 1, 1, 1, 1, 1,
-0.7984121, -0.2162115, -1.266279, 1, 1, 1, 1, 1,
-0.7976491, 0.4041937, 0.3914522, 1, 1, 1, 1, 1,
-0.7961864, -0.8912756, -3.317693, 1, 1, 1, 1, 1,
-0.7956136, -0.8425233, -2.706852, 1, 1, 1, 1, 1,
-0.7892629, 0.3754866, -0.5283874, 1, 1, 1, 1, 1,
-0.7872622, -0.318261, -3.4729, 1, 1, 1, 1, 1,
-0.7812168, 0.97031, -0.7375384, 1, 1, 1, 1, 1,
-0.7783239, -2.542161, -3.760793, 0, 0, 1, 1, 1,
-0.7745533, 2.433308, -0.3712876, 1, 0, 0, 1, 1,
-0.7706877, -1.339471, -5.143476, 1, 0, 0, 1, 1,
-0.7698742, -0.5916376, -2.499366, 1, 0, 0, 1, 1,
-0.7677192, -0.4695469, -2.530807, 1, 0, 0, 1, 1,
-0.7648317, -0.3263729, -2.73925, 1, 0, 0, 1, 1,
-0.7629422, -0.8363224, -3.801472, 0, 0, 0, 1, 1,
-0.7611803, 0.06156394, -1.011859, 0, 0, 0, 1, 1,
-0.7483421, -0.7322751, -1.986935, 0, 0, 0, 1, 1,
-0.7463108, 1.157282, 2.276452, 0, 0, 0, 1, 1,
-0.7431103, -0.9384003, -0.6574413, 0, 0, 0, 1, 1,
-0.7340608, 0.03333539, -0.1865212, 0, 0, 0, 1, 1,
-0.7318996, 2.389694, -1.356899, 0, 0, 0, 1, 1,
-0.7314951, -0.6970957, -4.17247, 1, 1, 1, 1, 1,
-0.7289361, -0.2911903, -2.565229, 1, 1, 1, 1, 1,
-0.7272745, -0.124935, -1.755295, 1, 1, 1, 1, 1,
-0.7187251, -0.6517031, -2.731376, 1, 1, 1, 1, 1,
-0.7158161, -1.092023, -3.002084, 1, 1, 1, 1, 1,
-0.7157861, -1.68239, -1.933992, 1, 1, 1, 1, 1,
-0.7145281, 0.3365447, -0.9698973, 1, 1, 1, 1, 1,
-0.7128612, 0.248417, -1.360863, 1, 1, 1, 1, 1,
-0.7051498, -1.150255, -3.856859, 1, 1, 1, 1, 1,
-0.704868, 1.948151, 1.255651, 1, 1, 1, 1, 1,
-0.7026302, 0.05832801, -1.562046, 1, 1, 1, 1, 1,
-0.6982145, -0.7138927, -2.732001, 1, 1, 1, 1, 1,
-0.6957378, -0.1671989, -2.532419, 1, 1, 1, 1, 1,
-0.6945313, 1.656782, -1.350194, 1, 1, 1, 1, 1,
-0.6887509, -0.06649146, -2.378664, 1, 1, 1, 1, 1,
-0.6822331, -0.63157, -2.836709, 0, 0, 1, 1, 1,
-0.6784828, -0.4697607, -1.496148, 1, 0, 0, 1, 1,
-0.6730169, -0.9426898, -3.072648, 1, 0, 0, 1, 1,
-0.6680467, -0.6895439, -1.945979, 1, 0, 0, 1, 1,
-0.6631853, 0.1478281, -1.382214, 1, 0, 0, 1, 1,
-0.6596639, -0.7807351, -0.9946019, 1, 0, 0, 1, 1,
-0.65768, -0.5616184, -2.226944, 0, 0, 0, 1, 1,
-0.6561838, -0.7376819, -1.129332, 0, 0, 0, 1, 1,
-0.6542839, -0.2076992, -2.489626, 0, 0, 0, 1, 1,
-0.6465216, 0.6053476, 0.1455639, 0, 0, 0, 1, 1,
-0.6462455, 0.2465139, -1.673643, 0, 0, 0, 1, 1,
-0.6408204, 1.097873, -0.3071826, 0, 0, 0, 1, 1,
-0.6378718, 0.2522015, -1.015735, 0, 0, 0, 1, 1,
-0.636323, 0.777736, -1.623139, 1, 1, 1, 1, 1,
-0.6329395, -1.134479, -2.777673, 1, 1, 1, 1, 1,
-0.6299694, -1.148798, -2.057942, 1, 1, 1, 1, 1,
-0.62708, 0.5086245, -0.4095544, 1, 1, 1, 1, 1,
-0.6243959, 0.8540318, -0.05575264, 1, 1, 1, 1, 1,
-0.6239498, 1.158039, -0.7503638, 1, 1, 1, 1, 1,
-0.6235999, 0.3003395, -1.957914, 1, 1, 1, 1, 1,
-0.6172717, 1.112363, 0.9835427, 1, 1, 1, 1, 1,
-0.6102423, 1.214826, 0.8341485, 1, 1, 1, 1, 1,
-0.6094634, -1.195494, -4.094473, 1, 1, 1, 1, 1,
-0.6073675, -0.09394915, -3.128654, 1, 1, 1, 1, 1,
-0.6065656, 0.04395735, -1.601886, 1, 1, 1, 1, 1,
-0.6061832, -1.318238, -2.015606, 1, 1, 1, 1, 1,
-0.602929, -0.2123682, -2.651447, 1, 1, 1, 1, 1,
-0.6005266, 2.507378, 0.07079481, 1, 1, 1, 1, 1,
-0.5997478, -0.2232617, -0.5929436, 0, 0, 1, 1, 1,
-0.5985558, -1.226566, -2.810116, 1, 0, 0, 1, 1,
-0.5977867, 0.6252996, 0.2256586, 1, 0, 0, 1, 1,
-0.5974514, -1.395377, -1.879902, 1, 0, 0, 1, 1,
-0.5974442, -1.032659, -1.827485, 1, 0, 0, 1, 1,
-0.595315, 1.591609, 1.663633, 1, 0, 0, 1, 1,
-0.5943786, -1.238435, -3.632587, 0, 0, 0, 1, 1,
-0.5937546, -0.860123, -3.000554, 0, 0, 0, 1, 1,
-0.5900577, 0.7603838, -2.063008, 0, 0, 0, 1, 1,
-0.5895209, -0.7842383, -1.840478, 0, 0, 0, 1, 1,
-0.5891845, -0.262856, -3.082769, 0, 0, 0, 1, 1,
-0.5865569, -0.9343114, -3.177468, 0, 0, 0, 1, 1,
-0.5834303, 0.6240969, -1.831191, 0, 0, 0, 1, 1,
-0.579505, -2.439277, -3.63475, 1, 1, 1, 1, 1,
-0.5782505, -0.4420318, -3.911386, 1, 1, 1, 1, 1,
-0.5741758, 1.008742, 1.362007, 1, 1, 1, 1, 1,
-0.5735186, -0.5841171, -3.350935, 1, 1, 1, 1, 1,
-0.5717109, -0.1598157, -3.473966, 1, 1, 1, 1, 1,
-0.571527, -0.2477816, -2.982746, 1, 1, 1, 1, 1,
-0.570799, -0.6914332, -2.702144, 1, 1, 1, 1, 1,
-0.5676912, 0.7533289, -1.084571, 1, 1, 1, 1, 1,
-0.5591394, 2.077158, -1.099244, 1, 1, 1, 1, 1,
-0.5588605, -0.4287676, -2.254095, 1, 1, 1, 1, 1,
-0.5586485, -2.013451, -3.279378, 1, 1, 1, 1, 1,
-0.5582914, 0.8910703, 0.2287285, 1, 1, 1, 1, 1,
-0.5570054, 1.274087, -1.267875, 1, 1, 1, 1, 1,
-0.5548773, -0.195619, -0.6647127, 1, 1, 1, 1, 1,
-0.5493454, -0.3802494, -0.7359297, 1, 1, 1, 1, 1,
-0.5448924, 0.5875667, 0.2158765, 0, 0, 1, 1, 1,
-0.5355605, 2.516493, -1.029624, 1, 0, 0, 1, 1,
-0.5320778, 0.1388168, -1.846728, 1, 0, 0, 1, 1,
-0.5298028, 1.090498, -0.2846693, 1, 0, 0, 1, 1,
-0.5275722, 0.8081985, -0.2027495, 1, 0, 0, 1, 1,
-0.5257843, 0.7145839, -0.6568964, 1, 0, 0, 1, 1,
-0.5248513, -0.30633, -3.440474, 0, 0, 0, 1, 1,
-0.5204881, -0.4085999, -3.092678, 0, 0, 0, 1, 1,
-0.519609, 1.124937, -0.3585769, 0, 0, 0, 1, 1,
-0.5172268, -0.02646878, -1.58022, 0, 0, 0, 1, 1,
-0.5145262, -1.529951, -3.017077, 0, 0, 0, 1, 1,
-0.5123907, 1.613486, -1.262038, 0, 0, 0, 1, 1,
-0.5107186, -0.2644604, -1.9867, 0, 0, 0, 1, 1,
-0.5093777, 0.1780546, -1.629285, 1, 1, 1, 1, 1,
-0.5022317, 1.333514, -0.3226027, 1, 1, 1, 1, 1,
-0.5012316, -1.168859, -2.903897, 1, 1, 1, 1, 1,
-0.5010965, 0.5226076, -1.58126, 1, 1, 1, 1, 1,
-0.4935169, -0.2099729, -2.05502, 1, 1, 1, 1, 1,
-0.492781, 0.3588566, -2.617126, 1, 1, 1, 1, 1,
-0.4900474, -0.5242385, -2.928515, 1, 1, 1, 1, 1,
-0.4884101, -0.3288425, -1.043265, 1, 1, 1, 1, 1,
-0.485717, 1.268964, -0.8026208, 1, 1, 1, 1, 1,
-0.485272, -0.8409665, -3.463111, 1, 1, 1, 1, 1,
-0.4819748, 0.2099368, 0.4379209, 1, 1, 1, 1, 1,
-0.4774793, 0.501261, -0.5154833, 1, 1, 1, 1, 1,
-0.4668853, 0.5750901, -0.4485209, 1, 1, 1, 1, 1,
-0.4637934, -0.7014223, -1.039816, 1, 1, 1, 1, 1,
-0.4620367, -0.06129971, -1.796896, 1, 1, 1, 1, 1,
-0.4513885, 0.1562609, -0.9296696, 0, 0, 1, 1, 1,
-0.4512208, 1.697762, -0.7934523, 1, 0, 0, 1, 1,
-0.4508873, -0.5051181, -2.281704, 1, 0, 0, 1, 1,
-0.4503716, 1.047567, 0.0584457, 1, 0, 0, 1, 1,
-0.4482265, -1.136388, -5.203902, 1, 0, 0, 1, 1,
-0.4450999, -0.2319344, -1.990954, 1, 0, 0, 1, 1,
-0.4395682, -0.1088444, -2.643251, 0, 0, 0, 1, 1,
-0.4378435, -0.08614845, -1.462207, 0, 0, 0, 1, 1,
-0.4371269, -1.070108, -6.072739, 0, 0, 0, 1, 1,
-0.4353386, -1.240096, -4.282541, 0, 0, 0, 1, 1,
-0.4329133, -0.7350191, -4.366027, 0, 0, 0, 1, 1,
-0.4303648, -1.385852, -3.325198, 0, 0, 0, 1, 1,
-0.4277628, -0.8165752, -1.783301, 0, 0, 0, 1, 1,
-0.4273033, 0.05409328, -0.3815092, 1, 1, 1, 1, 1,
-0.4266793, 1.358245, 0.1728156, 1, 1, 1, 1, 1,
-0.4266369, -0.6958313, -3.49908, 1, 1, 1, 1, 1,
-0.4183326, 1.35782, -0.6951548, 1, 1, 1, 1, 1,
-0.4152783, 0.8132823, -1.618953, 1, 1, 1, 1, 1,
-0.4117065, 1.185922, -1.989409, 1, 1, 1, 1, 1,
-0.4094258, 0.4024672, -2.440518, 1, 1, 1, 1, 1,
-0.406009, -0.5887211, -2.553793, 1, 1, 1, 1, 1,
-0.4044843, 0.4999122, -1.086554, 1, 1, 1, 1, 1,
-0.4029766, 0.8638699, 0.01549033, 1, 1, 1, 1, 1,
-0.4016701, 0.2986041, -0.5152138, 1, 1, 1, 1, 1,
-0.4015364, -0.1294172, -3.639432, 1, 1, 1, 1, 1,
-0.3981355, 0.3924711, -0.131056, 1, 1, 1, 1, 1,
-0.3959869, -0.2079892, -3.581714, 1, 1, 1, 1, 1,
-0.3938348, -0.06056267, -0.9147397, 1, 1, 1, 1, 1,
-0.3927194, -1.748258, -1.959022, 0, 0, 1, 1, 1,
-0.3902968, 1.80007, -0.2144752, 1, 0, 0, 1, 1,
-0.3894543, 1.1074, 1.530479, 1, 0, 0, 1, 1,
-0.3860532, -0.6849074, -3.199689, 1, 0, 0, 1, 1,
-0.3846463, -0.8687339, -1.904612, 1, 0, 0, 1, 1,
-0.3844278, -0.1729765, 0.4880375, 1, 0, 0, 1, 1,
-0.3763691, -0.2093417, -2.610013, 0, 0, 0, 1, 1,
-0.3759088, 0.1099666, -1.829629, 0, 0, 0, 1, 1,
-0.3688792, -0.1252726, -1.021311, 0, 0, 0, 1, 1,
-0.3685485, -2.497886, -3.899926, 0, 0, 0, 1, 1,
-0.3634416, 1.401206, 1.120735, 0, 0, 0, 1, 1,
-0.3578488, 1.368154, 0.5552246, 0, 0, 0, 1, 1,
-0.3568448, 0.9258482, 0.9231051, 0, 0, 0, 1, 1,
-0.3560404, -0.4792676, -2.292903, 1, 1, 1, 1, 1,
-0.3541141, 1.441584, 0.7462174, 1, 1, 1, 1, 1,
-0.3516943, 1.005568, 0.5090073, 1, 1, 1, 1, 1,
-0.3505943, -0.4041962, -2.858993, 1, 1, 1, 1, 1,
-0.345174, 0.9455222, -1.545814, 1, 1, 1, 1, 1,
-0.3420641, 0.0883465, -2.277956, 1, 1, 1, 1, 1,
-0.3382517, 0.7311181, -1.072548, 1, 1, 1, 1, 1,
-0.3370711, -0.6532308, -2.804133, 1, 1, 1, 1, 1,
-0.3366167, 0.5488834, -4.063881, 1, 1, 1, 1, 1,
-0.3360622, -0.4741278, -1.459327, 1, 1, 1, 1, 1,
-0.3359473, -1.656489, -2.7872, 1, 1, 1, 1, 1,
-0.3352201, 0.8139738, -0.7084614, 1, 1, 1, 1, 1,
-0.3323833, -0.7147132, -2.814935, 1, 1, 1, 1, 1,
-0.3291708, -1.345359, -3.145795, 1, 1, 1, 1, 1,
-0.3255895, -0.6714202, -3.329104, 1, 1, 1, 1, 1,
-0.3234836, -0.003076303, -1.694209, 0, 0, 1, 1, 1,
-0.3228593, -0.9195107, -4.117297, 1, 0, 0, 1, 1,
-0.3225802, -0.80321, -1.317075, 1, 0, 0, 1, 1,
-0.319621, -0.877965, -1.629372, 1, 0, 0, 1, 1,
-0.3184515, 0.2741003, 0.897646, 1, 0, 0, 1, 1,
-0.3163278, 1.882529, -1.36355, 1, 0, 0, 1, 1,
-0.3056406, 0.9095053, 1.043299, 0, 0, 0, 1, 1,
-0.3011343, 1.076961, 0.4794315, 0, 0, 0, 1, 1,
-0.2903383, 0.5691461, -1.779153, 0, 0, 0, 1, 1,
-0.2888088, -1.116299, -4.42399, 0, 0, 0, 1, 1,
-0.2874486, -0.3765287, -2.173831, 0, 0, 0, 1, 1,
-0.2857276, 2.918952, -0.266353, 0, 0, 0, 1, 1,
-0.2826876, -0.3012633, -2.537142, 0, 0, 0, 1, 1,
-0.2815101, -1.535933, -2.80203, 1, 1, 1, 1, 1,
-0.2796018, 3.096045, 0.9824179, 1, 1, 1, 1, 1,
-0.2771566, -0.4471649, -2.291789, 1, 1, 1, 1, 1,
-0.2722197, 0.4395823, -0.3758869, 1, 1, 1, 1, 1,
-0.2682221, -0.565261, -2.64052, 1, 1, 1, 1, 1,
-0.2672254, -0.7674446, -1.862553, 1, 1, 1, 1, 1,
-0.2658719, 0.9068746, -0.3494086, 1, 1, 1, 1, 1,
-0.2610821, 0.3350877, -2.263788, 1, 1, 1, 1, 1,
-0.2585979, -1.158894, -3.197443, 1, 1, 1, 1, 1,
-0.2585817, 1.023753, 0.05364776, 1, 1, 1, 1, 1,
-0.2571944, 1.491232, -1.508361, 1, 1, 1, 1, 1,
-0.2556153, -0.226976, -2.834061, 1, 1, 1, 1, 1,
-0.2543801, 1.283318, -0.7297806, 1, 1, 1, 1, 1,
-0.2519506, -1.851422, -1.618356, 1, 1, 1, 1, 1,
-0.2472399, -0.2465741, -0.4448347, 1, 1, 1, 1, 1,
-0.2447345, -0.1913859, -1.27161, 0, 0, 1, 1, 1,
-0.2431512, 0.8254555, -1.495904, 1, 0, 0, 1, 1,
-0.2428625, -1.384691, -3.596952, 1, 0, 0, 1, 1,
-0.2426481, -0.06951326, -1.123728, 1, 0, 0, 1, 1,
-0.2335019, -2.367495, -3.45487, 1, 0, 0, 1, 1,
-0.2328942, -0.9654025, -3.132133, 1, 0, 0, 1, 1,
-0.2312927, 0.1979394, -0.1898059, 0, 0, 0, 1, 1,
-0.2291082, 1.749243, -1.759445, 0, 0, 0, 1, 1,
-0.2226975, -0.2940698, -2.3754, 0, 0, 0, 1, 1,
-0.2211978, 0.8427173, 0.2543647, 0, 0, 0, 1, 1,
-0.219999, 1.367601, -0.0168534, 0, 0, 0, 1, 1,
-0.2146897, 0.6115989, -0.9243855, 0, 0, 0, 1, 1,
-0.2101498, 1.036678, 0.4087663, 0, 0, 0, 1, 1,
-0.2096079, -1.289844, -3.38057, 1, 1, 1, 1, 1,
-0.2086928, 0.2835844, 0.6517474, 1, 1, 1, 1, 1,
-0.2082755, -1.275735, -4.425089, 1, 1, 1, 1, 1,
-0.2050141, 0.390227, -0.1134751, 1, 1, 1, 1, 1,
-0.204881, -0.9036299, -4.837071, 1, 1, 1, 1, 1,
-0.1984049, -0.4171916, -3.162563, 1, 1, 1, 1, 1,
-0.192113, 1.063894, 0.1415262, 1, 1, 1, 1, 1,
-0.1919808, 0.3522586, 0.6196341, 1, 1, 1, 1, 1,
-0.1914936, 0.5736488, -0.08959003, 1, 1, 1, 1, 1,
-0.1844147, -0.2614374, -1.903323, 1, 1, 1, 1, 1,
-0.182267, -0.5520467, -4.43927, 1, 1, 1, 1, 1,
-0.1812986, -0.3152042, -3.044246, 1, 1, 1, 1, 1,
-0.181256, 0.5491533, 1.210972, 1, 1, 1, 1, 1,
-0.1802693, 0.6707003, -1.962934, 1, 1, 1, 1, 1,
-0.1756438, -0.5641094, -3.020858, 1, 1, 1, 1, 1,
-0.1747638, -1.008301, -3.174123, 0, 0, 1, 1, 1,
-0.1738094, 0.6839933, -2.445709, 1, 0, 0, 1, 1,
-0.1734152, -1.211422, -3.20344, 1, 0, 0, 1, 1,
-0.1705176, -0.1558058, -3.483404, 1, 0, 0, 1, 1,
-0.1699558, -0.1110376, -2.053462, 1, 0, 0, 1, 1,
-0.1611434, 0.778614, -0.2499189, 1, 0, 0, 1, 1,
-0.1602624, -0.5736642, -3.233578, 0, 0, 0, 1, 1,
-0.1597787, -1.223683, -2.75273, 0, 0, 0, 1, 1,
-0.1590664, 0.5137334, -1.43889, 0, 0, 0, 1, 1,
-0.1586115, -0.6846123, -4.175074, 0, 0, 0, 1, 1,
-0.1544108, -0.236118, -4.662347, 0, 0, 0, 1, 1,
-0.1491419, -0.4721577, -2.539264, 0, 0, 0, 1, 1,
-0.1484531, 0.198005, -2.143843, 0, 0, 0, 1, 1,
-0.147725, 0.5665731, -0.2485369, 1, 1, 1, 1, 1,
-0.1446717, 1.920096, -0.7266157, 1, 1, 1, 1, 1,
-0.133858, -0.6723139, -2.68566, 1, 1, 1, 1, 1,
-0.1329339, 1.64382, 0.3082364, 1, 1, 1, 1, 1,
-0.1327428, 0.6832915, 0.3497943, 1, 1, 1, 1, 1,
-0.1299505, 0.6889234, 1.516523, 1, 1, 1, 1, 1,
-0.1242572, 1.501901, 0.8327036, 1, 1, 1, 1, 1,
-0.1209799, -0.8005046, -1.735862, 1, 1, 1, 1, 1,
-0.1191051, -1.181362, -1.676905, 1, 1, 1, 1, 1,
-0.1177365, 0.2973505, -1.457597, 1, 1, 1, 1, 1,
-0.1154263, 1.079131, 1.291573, 1, 1, 1, 1, 1,
-0.1102548, 0.09368611, -0.2526536, 1, 1, 1, 1, 1,
-0.1055495, -0.9443328, -2.232393, 1, 1, 1, 1, 1,
-0.1042517, -0.1247239, -2.52435, 1, 1, 1, 1, 1,
-0.1002098, -0.2968994, -3.554457, 1, 1, 1, 1, 1,
-0.09932826, -1.29924, -1.229591, 0, 0, 1, 1, 1,
-0.09787583, -2.001594, -2.340307, 1, 0, 0, 1, 1,
-0.09743526, 0.8866145, -1.948156, 1, 0, 0, 1, 1,
-0.09724017, 2.683891, 0.6683831, 1, 0, 0, 1, 1,
-0.09465444, -0.240439, -2.583601, 1, 0, 0, 1, 1,
-0.09413084, -0.3196113, -3.570069, 1, 0, 0, 1, 1,
-0.09061026, 0.2069371, -0.3825711, 0, 0, 0, 1, 1,
-0.08855095, 0.0208339, -1.544368, 0, 0, 0, 1, 1,
-0.08480889, -0.4281341, -2.23764, 0, 0, 0, 1, 1,
-0.07999087, -0.6536382, -2.41073, 0, 0, 0, 1, 1,
-0.07844622, 1.993229, -1.639011, 0, 0, 0, 1, 1,
-0.07675117, -0.7825, -4.266387, 0, 0, 0, 1, 1,
-0.0758574, -0.4714399, -2.885234, 0, 0, 0, 1, 1,
-0.07542366, 0.7076576, -1.229291, 1, 1, 1, 1, 1,
-0.07315816, -0.9632537, -1.409912, 1, 1, 1, 1, 1,
-0.06825478, 1.48252, 1.157987, 1, 1, 1, 1, 1,
-0.06721815, -1.341079, -2.876125, 1, 1, 1, 1, 1,
-0.06690791, -0.5622883, -3.696244, 1, 1, 1, 1, 1,
-0.06566951, 0.8136132, -0.9485223, 1, 1, 1, 1, 1,
-0.0655012, -0.4049121, -3.298609, 1, 1, 1, 1, 1,
-0.06281777, 0.7339779, 0.933315, 1, 1, 1, 1, 1,
-0.06235775, -1.465406, -4.671862, 1, 1, 1, 1, 1,
-0.06143847, -2.206782, -2.51563, 1, 1, 1, 1, 1,
-0.0607016, -1.854921, -2.39903, 1, 1, 1, 1, 1,
-0.0553969, 0.2457571, -1.004495, 1, 1, 1, 1, 1,
-0.04775239, -0.1917943, -1.789492, 1, 1, 1, 1, 1,
-0.04403888, 0.01453286, -1.221656, 1, 1, 1, 1, 1,
-0.04370424, -0.368975, -2.420218, 1, 1, 1, 1, 1,
-0.04288096, -0.1407185, -3.767081, 0, 0, 1, 1, 1,
-0.04233185, -0.9447411, -2.609243, 1, 0, 0, 1, 1,
-0.04035912, -1.650023, -1.739179, 1, 0, 0, 1, 1,
-0.03892633, 1.113967, -0.3494632, 1, 0, 0, 1, 1,
-0.03529181, 0.5011305, -0.7307425, 1, 0, 0, 1, 1,
-0.03283512, 0.0284418, -1.134771, 1, 0, 0, 1, 1,
-0.03270182, -0.1518434, -4.272715, 0, 0, 0, 1, 1,
-0.03190704, -1.125556, -0.8983611, 0, 0, 0, 1, 1,
-0.03093488, 0.09252057, 2.212546, 0, 0, 0, 1, 1,
-0.02508398, -0.7398816, -4.007842, 0, 0, 0, 1, 1,
-0.02297026, 0.8876484, -0.8178203, 0, 0, 0, 1, 1,
-0.02258006, -0.3994091, -2.574659, 0, 0, 0, 1, 1,
-0.01187019, -0.6353297, -3.174947, 0, 0, 0, 1, 1,
-0.008121856, -1.770995, -4.094572, 1, 1, 1, 1, 1,
-0.006319898, -1.011706, -2.722649, 1, 1, 1, 1, 1,
-0.005823116, 0.6434797, -0.7442662, 1, 1, 1, 1, 1,
-0.001038493, 0.2421187, 0.6322595, 1, 1, 1, 1, 1,
0.0001295711, 0.105116, -1.199798, 1, 1, 1, 1, 1,
0.002580932, 0.4108071, -0.1076425, 1, 1, 1, 1, 1,
0.003797206, 0.6959478, -0.5418336, 1, 1, 1, 1, 1,
0.004047715, -0.120997, 3.170449, 1, 1, 1, 1, 1,
0.004089213, 1.768627, 0.4506708, 1, 1, 1, 1, 1,
0.004493001, -0.5944745, 3.217959, 1, 1, 1, 1, 1,
0.004796744, -0.2168762, 2.575489, 1, 1, 1, 1, 1,
0.00513693, 0.1846983, 1.4131, 1, 1, 1, 1, 1,
0.01665911, -1.787098, 1.842664, 1, 1, 1, 1, 1,
0.0216428, 2.331232, 0.06448304, 1, 1, 1, 1, 1,
0.0227602, -0.4663417, 3.433435, 1, 1, 1, 1, 1,
0.02307036, 0.2878344, 0.6466199, 0, 0, 1, 1, 1,
0.0332913, -0.3357872, 4.356339, 1, 0, 0, 1, 1,
0.03623752, -0.4596776, 1.4467, 1, 0, 0, 1, 1,
0.04826827, -0.8517355, 3.816683, 1, 0, 0, 1, 1,
0.05199118, 1.525388, 0.4642437, 1, 0, 0, 1, 1,
0.05616389, 0.3900604, -0.07533091, 1, 0, 0, 1, 1,
0.05837479, -1.779025, 2.627188, 0, 0, 0, 1, 1,
0.06040287, -0.05574009, 0.992274, 0, 0, 0, 1, 1,
0.06298465, 1.104578, 0.08458126, 0, 0, 0, 1, 1,
0.06719592, -0.04722645, 0.9400172, 0, 0, 0, 1, 1,
0.06784207, 0.7746298, 0.5977348, 0, 0, 0, 1, 1,
0.06827354, 0.6887479, 0.4517565, 0, 0, 0, 1, 1,
0.06873427, -1.527107, 2.739933, 0, 0, 0, 1, 1,
0.07392295, -0.3355266, 1.143026, 1, 1, 1, 1, 1,
0.07795928, -0.2306081, 1.657089, 1, 1, 1, 1, 1,
0.08131077, -0.4375893, 3.574266, 1, 1, 1, 1, 1,
0.08247668, -0.7147111, 1.976199, 1, 1, 1, 1, 1,
0.08473408, -0.3004647, 2.566106, 1, 1, 1, 1, 1,
0.08514085, -0.2716942, 1.973034, 1, 1, 1, 1, 1,
0.08607256, 0.3732285, 0.8159623, 1, 1, 1, 1, 1,
0.08832464, 1.666769, 1.940096, 1, 1, 1, 1, 1,
0.09089942, -0.7944928, 2.39013, 1, 1, 1, 1, 1,
0.09334178, -0.2830005, 3.258543, 1, 1, 1, 1, 1,
0.09430004, -0.03514138, 2.553115, 1, 1, 1, 1, 1,
0.1009652, -0.2652797, 3.605205, 1, 1, 1, 1, 1,
0.1063991, 1.922893, 1.383453, 1, 1, 1, 1, 1,
0.1067298, 1.058892, 0.03794607, 1, 1, 1, 1, 1,
0.1067599, -0.7386296, 2.26396, 1, 1, 1, 1, 1,
0.110437, 0.8397415, 0.1595839, 0, 0, 1, 1, 1,
0.1105666, 1.230372, 1.190642, 1, 0, 0, 1, 1,
0.1118783, 0.5611075, -1.524951, 1, 0, 0, 1, 1,
0.1128127, -0.4712919, 3.901691, 1, 0, 0, 1, 1,
0.1134236, 0.9532469, 0.843435, 1, 0, 0, 1, 1,
0.1155804, -1.035498, 4.300022, 1, 0, 0, 1, 1,
0.1165197, 0.5961257, -0.08812105, 0, 0, 0, 1, 1,
0.1176208, -0.5712697, 2.983004, 0, 0, 0, 1, 1,
0.1217933, -1.192819, 3.205976, 0, 0, 0, 1, 1,
0.1221818, -1.296452, 3.407461, 0, 0, 0, 1, 1,
0.1301999, -1.855947, 3.81147, 0, 0, 0, 1, 1,
0.138677, -0.02111122, 2.756287, 0, 0, 0, 1, 1,
0.1397711, 0.6999369, -0.1156665, 0, 0, 0, 1, 1,
0.1398988, -0.08219275, 1.548432, 1, 1, 1, 1, 1,
0.1410449, 1.44716, 0.5358026, 1, 1, 1, 1, 1,
0.1420721, 1.186434, 1.040537, 1, 1, 1, 1, 1,
0.1460366, 1.930229, 1.409043, 1, 1, 1, 1, 1,
0.1469192, -0.8753984, 2.781248, 1, 1, 1, 1, 1,
0.1483102, -1.11134, 1.797659, 1, 1, 1, 1, 1,
0.1527891, -0.2786642, 0.9257132, 1, 1, 1, 1, 1,
0.154023, 0.8361585, 0.7447904, 1, 1, 1, 1, 1,
0.1584379, -0.6764488, 2.277695, 1, 1, 1, 1, 1,
0.1586587, -1.138233, 1.393941, 1, 1, 1, 1, 1,
0.1609423, 0.5598035, -0.961539, 1, 1, 1, 1, 1,
0.1626792, -0.207338, 2.952611, 1, 1, 1, 1, 1,
0.164619, -1.085279, 1.560523, 1, 1, 1, 1, 1,
0.1723991, 0.2482416, 0.7264215, 1, 1, 1, 1, 1,
0.1746374, -0.9640608, 2.967687, 1, 1, 1, 1, 1,
0.1748105, 0.4044683, 1.639258, 0, 0, 1, 1, 1,
0.1748557, 1.259245, -0.182241, 1, 0, 0, 1, 1,
0.1761605, 1.477398, -1.531678, 1, 0, 0, 1, 1,
0.1803058, 0.9442352, -1.658746, 1, 0, 0, 1, 1,
0.1818233, 0.5519961, -1.50473, 1, 0, 0, 1, 1,
0.1821783, -1.557194, 2.945056, 1, 0, 0, 1, 1,
0.1838768, -0.4053837, 3.541411, 0, 0, 0, 1, 1,
0.1857991, -1.02304, 2.459425, 0, 0, 0, 1, 1,
0.1893326, -0.1074606, 1.924706, 0, 0, 0, 1, 1,
0.1918688, -0.386685, 2.479765, 0, 0, 0, 1, 1,
0.1969389, -1.595082, 4.422794, 0, 0, 0, 1, 1,
0.198558, -0.06507051, 1.110106, 0, 0, 0, 1, 1,
0.1991082, -0.2436004, 2.111358, 0, 0, 0, 1, 1,
0.2025103, 0.9584252, -1.129714, 1, 1, 1, 1, 1,
0.2043433, 0.09015728, 0.9832662, 1, 1, 1, 1, 1,
0.2065332, 1.660324, 0.8311005, 1, 1, 1, 1, 1,
0.2112127, -0.1767069, 3.866418, 1, 1, 1, 1, 1,
0.2223372, -0.08798032, 2.121208, 1, 1, 1, 1, 1,
0.2226538, 0.7412959, 0.8774607, 1, 1, 1, 1, 1,
0.2283547, -0.6684691, 0.07766934, 1, 1, 1, 1, 1,
0.229641, 2.19188, -1.187565, 1, 1, 1, 1, 1,
0.2329627, -0.7479692, 2.312421, 1, 1, 1, 1, 1,
0.2331196, -0.5656756, 5.633666, 1, 1, 1, 1, 1,
0.2376678, 2.144979, 0.7630933, 1, 1, 1, 1, 1,
0.2405408, -0.674736, 3.797132, 1, 1, 1, 1, 1,
0.244637, -0.05239046, 1.634446, 1, 1, 1, 1, 1,
0.2452358, -0.6020879, 5.016267, 1, 1, 1, 1, 1,
0.248844, 1.010544, 1.053001, 1, 1, 1, 1, 1,
0.2505726, 1.542466, 2.151998, 0, 0, 1, 1, 1,
0.253457, 1.253038, 0.186424, 1, 0, 0, 1, 1,
0.2574772, -0.7338277, 3.456418, 1, 0, 0, 1, 1,
0.2582282, 0.06965916, 0.9106065, 1, 0, 0, 1, 1,
0.2602642, 0.7785519, -0.806865, 1, 0, 0, 1, 1,
0.2630224, -1.045355, 3.597457, 1, 0, 0, 1, 1,
0.2692231, 0.4890415, -0.6753041, 0, 0, 0, 1, 1,
0.2704583, 0.1203461, 1.852041, 0, 0, 0, 1, 1,
0.2711229, -0.5737957, 1.65197, 0, 0, 0, 1, 1,
0.2729208, 1.359096, -0.06236541, 0, 0, 0, 1, 1,
0.2807599, -0.5156637, 0.9645988, 0, 0, 0, 1, 1,
0.284263, 0.5298895, 2.317497, 0, 0, 0, 1, 1,
0.2854152, -0.1669482, 2.059941, 0, 0, 0, 1, 1,
0.2863621, -0.5976402, 4.044852, 1, 1, 1, 1, 1,
0.2864695, 0.120837, 2.368837, 1, 1, 1, 1, 1,
0.288701, -0.5035727, 0.9720208, 1, 1, 1, 1, 1,
0.2896055, 0.6063636, -0.1167717, 1, 1, 1, 1, 1,
0.2896895, -0.09379625, 2.183621, 1, 1, 1, 1, 1,
0.296657, 1.470392, 1.296825, 1, 1, 1, 1, 1,
0.3000124, 2.054808, -1.42548, 1, 1, 1, 1, 1,
0.3046511, -0.01195927, 2.431718, 1, 1, 1, 1, 1,
0.3070452, 0.4406415, 0.7137398, 1, 1, 1, 1, 1,
0.3104818, 1.142215, -1.71141, 1, 1, 1, 1, 1,
0.313336, 0.3079816, 1.491129, 1, 1, 1, 1, 1,
0.315159, 0.8591539, -0.8806146, 1, 1, 1, 1, 1,
0.3161153, 0.6241626, 0.1970513, 1, 1, 1, 1, 1,
0.319277, 1.403788, 1.780475, 1, 1, 1, 1, 1,
0.3242987, 2.647089, -0.5844504, 1, 1, 1, 1, 1,
0.3288126, -0.1140787, 1.991556, 0, 0, 1, 1, 1,
0.3357871, -0.07735812, 1.640872, 1, 0, 0, 1, 1,
0.3364942, 0.2402331, 0.9733552, 1, 0, 0, 1, 1,
0.3381696, 0.1120608, 0.5534136, 1, 0, 0, 1, 1,
0.33902, 0.07202937, 1.348313, 1, 0, 0, 1, 1,
0.3408583, -1.423092, 3.750618, 1, 0, 0, 1, 1,
0.3416904, 1.030172, -3.221193, 0, 0, 0, 1, 1,
0.3425248, -0.5364797, 2.322111, 0, 0, 0, 1, 1,
0.3466955, 0.3038761, 1.036975, 0, 0, 0, 1, 1,
0.3519833, 1.224998, 1.835671, 0, 0, 0, 1, 1,
0.3535964, -0.4514092, 4.303298, 0, 0, 0, 1, 1,
0.3610348, 1.259695, 0.3972923, 0, 0, 0, 1, 1,
0.3664838, -0.2136697, 3.013429, 0, 0, 0, 1, 1,
0.3678988, 1.066467, -1.085641, 1, 1, 1, 1, 1,
0.3699568, 1.396845, -1.400157, 1, 1, 1, 1, 1,
0.3733808, 0.5969672, 0.08000571, 1, 1, 1, 1, 1,
0.3739212, 0.8340631, -0.06651091, 1, 1, 1, 1, 1,
0.3751048, 1.397302, -0.3126855, 1, 1, 1, 1, 1,
0.3767101, -0.3266398, 3.676349, 1, 1, 1, 1, 1,
0.3793789, 1.004139, 0.9384164, 1, 1, 1, 1, 1,
0.3810894, 2.23197, -0.1844454, 1, 1, 1, 1, 1,
0.3844274, -0.06244045, 1.484848, 1, 1, 1, 1, 1,
0.3902467, 0.2106111, 2.74043, 1, 1, 1, 1, 1,
0.3924484, -0.483851, 2.676472, 1, 1, 1, 1, 1,
0.3928562, -1.034627, 2.529576, 1, 1, 1, 1, 1,
0.3952985, -0.5247784, 2.051093, 1, 1, 1, 1, 1,
0.3959639, 0.6653311, -0.6481214, 1, 1, 1, 1, 1,
0.3974288, 1.532304, 0.6370004, 1, 1, 1, 1, 1,
0.4000805, 1.356091, -1.471832, 0, 0, 1, 1, 1,
0.4033368, 0.08166959, 1.2226, 1, 0, 0, 1, 1,
0.4075571, -0.5180033, 0.9245444, 1, 0, 0, 1, 1,
0.4121502, 0.3384027, 1.729795, 1, 0, 0, 1, 1,
0.4122191, -1.371524, 2.9785, 1, 0, 0, 1, 1,
0.41498, 0.8603141, 0.1863507, 1, 0, 0, 1, 1,
0.4160454, 0.386427, 0.6846343, 0, 0, 0, 1, 1,
0.4209598, -0.3576056, 4.245708, 0, 0, 0, 1, 1,
0.4342996, -0.3952596, 1.15937, 0, 0, 0, 1, 1,
0.4376955, 0.7864503, -1.627409, 0, 0, 0, 1, 1,
0.4397688, -0.7861392, 2.623326, 0, 0, 0, 1, 1,
0.4446227, 0.9883641, 0.2875039, 0, 0, 0, 1, 1,
0.4455296, 0.2315161, -1.566163, 0, 0, 0, 1, 1,
0.4486671, -0.8400277, 1.223594, 1, 1, 1, 1, 1,
0.4501524, -0.4840814, 0.208975, 1, 1, 1, 1, 1,
0.4531758, 1.750615, 2.373633, 1, 1, 1, 1, 1,
0.456145, -0.07305603, 0.9022799, 1, 1, 1, 1, 1,
0.4563974, 0.6303129, 0.3004463, 1, 1, 1, 1, 1,
0.4568585, -1.022146, 1.211963, 1, 1, 1, 1, 1,
0.4698687, -1.41425, 2.533558, 1, 1, 1, 1, 1,
0.4743556, 0.1761597, 0.5560008, 1, 1, 1, 1, 1,
0.4793615, -0.8310165, 1.520487, 1, 1, 1, 1, 1,
0.4839505, -1.760534, 3.604803, 1, 1, 1, 1, 1,
0.4879341, -0.6611084, 2.114474, 1, 1, 1, 1, 1,
0.4889401, 0.941398, 1.908714, 1, 1, 1, 1, 1,
0.4923332, -0.3603587, -0.04923094, 1, 1, 1, 1, 1,
0.4962769, 0.5310223, 0.02428605, 1, 1, 1, 1, 1,
0.4979691, -1.940137, 3.159607, 1, 1, 1, 1, 1,
0.4993565, -0.3948371, 2.106801, 0, 0, 1, 1, 1,
0.4995787, 0.7579906, 0.59185, 1, 0, 0, 1, 1,
0.5002156, -0.8175527, 1.556858, 1, 0, 0, 1, 1,
0.5004086, -0.3983341, 0.7790198, 1, 0, 0, 1, 1,
0.5031623, -0.07578484, 2.119774, 1, 0, 0, 1, 1,
0.5052475, -0.8056396, 3.487409, 1, 0, 0, 1, 1,
0.5084654, 0.5079702, 1.725954, 0, 0, 0, 1, 1,
0.5093616, -0.4802816, 2.505621, 0, 0, 0, 1, 1,
0.5152143, 1.275963, -0.5313219, 0, 0, 0, 1, 1,
0.5163512, -0.02868342, 1.509364, 0, 0, 0, 1, 1,
0.5168791, 1.411807, -0.558552, 0, 0, 0, 1, 1,
0.5169048, 1.711973, -1.273958, 0, 0, 0, 1, 1,
0.517278, -0.4914626, 3.895987, 0, 0, 0, 1, 1,
0.5185245, -0.4842287, 3.805892, 1, 1, 1, 1, 1,
0.5186657, 0.2778325, 1.120681, 1, 1, 1, 1, 1,
0.5196083, -0.09483796, 2.743295, 1, 1, 1, 1, 1,
0.5229337, -0.7764109, 2.412117, 1, 1, 1, 1, 1,
0.5252718, 0.9021547, 0.4927136, 1, 1, 1, 1, 1,
0.5257582, -1.246948, 3.635139, 1, 1, 1, 1, 1,
0.5282721, 0.148209, 2.389202, 1, 1, 1, 1, 1,
0.529141, 1.352748, -0.1902568, 1, 1, 1, 1, 1,
0.5319377, 1.074658, 0.4651802, 1, 1, 1, 1, 1,
0.5342727, 1.03658, 1.190205, 1, 1, 1, 1, 1,
0.5359606, -0.8326248, 3.748508, 1, 1, 1, 1, 1,
0.5365797, 1.492347, 0.5305426, 1, 1, 1, 1, 1,
0.5399667, 0.3258503, -1.217739, 1, 1, 1, 1, 1,
0.5427449, -0.2336444, 4.082591, 1, 1, 1, 1, 1,
0.5503132, -2.829291, 0.7727272, 1, 1, 1, 1, 1,
0.552004, -0.4539897, 3.041476, 0, 0, 1, 1, 1,
0.5531277, -1.508305, 2.433539, 1, 0, 0, 1, 1,
0.5540097, 0.1228873, 1.62805, 1, 0, 0, 1, 1,
0.5565315, -2.676853, 4.010486, 1, 0, 0, 1, 1,
0.5578339, -0.1896864, 1.665967, 1, 0, 0, 1, 1,
0.5633029, -0.189609, 2.103219, 1, 0, 0, 1, 1,
0.5637327, -0.5734969, 2.264309, 0, 0, 0, 1, 1,
0.5647122, 2.485036, 0.8144494, 0, 0, 0, 1, 1,
0.5746343, -0.2068338, 0.4677316, 0, 0, 0, 1, 1,
0.5798334, -0.1782508, 2.312744, 0, 0, 0, 1, 1,
0.5807354, -0.7890772, 2.333136, 0, 0, 0, 1, 1,
0.5841382, 2.103489, 0.2474115, 0, 0, 0, 1, 1,
0.5861775, -2.404895, 3.280437, 0, 0, 0, 1, 1,
0.5896195, 0.2888261, 2.227636, 1, 1, 1, 1, 1,
0.589667, -0.3095534, 3.128475, 1, 1, 1, 1, 1,
0.5921422, -2.355268, 2.607481, 1, 1, 1, 1, 1,
0.6007584, -2.028953, 2.316912, 1, 1, 1, 1, 1,
0.6020494, 1.082937, -0.6667524, 1, 1, 1, 1, 1,
0.6079809, -0.9865011, 3.266797, 1, 1, 1, 1, 1,
0.6239079, -1.143617, 2.020487, 1, 1, 1, 1, 1,
0.6254447, 0.08487465, 1.002626, 1, 1, 1, 1, 1,
0.6283231, 1.070257, 2.40133, 1, 1, 1, 1, 1,
0.629631, -0.7300534, 1.728608, 1, 1, 1, 1, 1,
0.6363915, -1.028995, 2.720302, 1, 1, 1, 1, 1,
0.6411421, 1.236255, 1.786325, 1, 1, 1, 1, 1,
0.6467653, 0.3366207, 0.005684055, 1, 1, 1, 1, 1,
0.6488839, 0.4176596, 0.2592867, 1, 1, 1, 1, 1,
0.6521661, -0.6246892, 0.5999898, 1, 1, 1, 1, 1,
0.6586428, -1.779564, 2.085236, 0, 0, 1, 1, 1,
0.6587949, -0.9702422, 2.579597, 1, 0, 0, 1, 1,
0.6602346, -0.07957352, 2.527077, 1, 0, 0, 1, 1,
0.6640629, -0.1686445, 1.684473, 1, 0, 0, 1, 1,
0.6683324, -1.309783, 1.731106, 1, 0, 0, 1, 1,
0.6791639, 1.932985, 0.3437377, 1, 0, 0, 1, 1,
0.6803316, 1.476434, -0.9886807, 0, 0, 0, 1, 1,
0.6813751, -0.01281999, 2.18026, 0, 0, 0, 1, 1,
0.6848653, 0.8882063, 0.8952833, 0, 0, 0, 1, 1,
0.6867698, -1.077726, 1.187354, 0, 0, 0, 1, 1,
0.6868488, -1.011694, 4.409531, 0, 0, 0, 1, 1,
0.6892322, 0.940097, -0.5763543, 0, 0, 0, 1, 1,
0.6904517, -0.01469393, 2.905793, 0, 0, 0, 1, 1,
0.6917031, -0.4729939, 3.341371, 1, 1, 1, 1, 1,
0.6917614, 1.479719, 0.5875759, 1, 1, 1, 1, 1,
0.6920463, -0.6737651, 2.785526, 1, 1, 1, 1, 1,
0.6926736, 1.276317, -2.12654, 1, 1, 1, 1, 1,
0.6957516, 0.3849638, 2.839022, 1, 1, 1, 1, 1,
0.699975, -1.199269, 4.366313, 1, 1, 1, 1, 1,
0.7026667, 0.1211835, 2.878959, 1, 1, 1, 1, 1,
0.7040714, -0.5257136, 2.945625, 1, 1, 1, 1, 1,
0.7052943, 1.356787, -0.3937025, 1, 1, 1, 1, 1,
0.7070364, -1.24592, 2.632981, 1, 1, 1, 1, 1,
0.7115704, -1.32562, 1.310458, 1, 1, 1, 1, 1,
0.71311, -0.6179764, 2.381102, 1, 1, 1, 1, 1,
0.7148108, -0.1953979, 1.471421, 1, 1, 1, 1, 1,
0.7184097, -0.7349943, 3.3179, 1, 1, 1, 1, 1,
0.7348031, -0.1632102, 4.029306, 1, 1, 1, 1, 1,
0.7433488, 0.2388721, -0.02410047, 0, 0, 1, 1, 1,
0.7500136, -0.04767837, 2.792224, 1, 0, 0, 1, 1,
0.755643, -1.444395, 2.196628, 1, 0, 0, 1, 1,
0.7586075, -1.084495, 2.743106, 1, 0, 0, 1, 1,
0.7624255, 1.201669, -0.07804677, 1, 0, 0, 1, 1,
0.7682923, 0.5235758, 0.4909328, 1, 0, 0, 1, 1,
0.7742335, -0.8466772, 2.59602, 0, 0, 0, 1, 1,
0.7763051, -1.076485, 1.765543, 0, 0, 0, 1, 1,
0.780375, 0.6259162, 0.9673039, 0, 0, 0, 1, 1,
0.7830181, -1.989793, 0.7903701, 0, 0, 0, 1, 1,
0.7856231, -0.5600731, 0.7594445, 0, 0, 0, 1, 1,
0.7884672, -1.628042, 4.274754, 0, 0, 0, 1, 1,
0.7970088, 1.918905, -0.2991485, 0, 0, 0, 1, 1,
0.798224, -0.7747067, 2.467017, 1, 1, 1, 1, 1,
0.7996409, 1.173626, 0.04257368, 1, 1, 1, 1, 1,
0.8141771, -1.196779, 3.433851, 1, 1, 1, 1, 1,
0.8161902, -0.189339, 3.105675, 1, 1, 1, 1, 1,
0.8170319, 1.477189, 0.6253691, 1, 1, 1, 1, 1,
0.8200867, 0.8026432, 1.163589, 1, 1, 1, 1, 1,
0.8206261, 0.3551703, 1.313421, 1, 1, 1, 1, 1,
0.8213552, -0.3225631, 2.234766, 1, 1, 1, 1, 1,
0.8224586, 1.045099, 0.1820818, 1, 1, 1, 1, 1,
0.822829, -1.056142, 3.133218, 1, 1, 1, 1, 1,
0.8313341, 1.649143, 2.042761, 1, 1, 1, 1, 1,
0.8313649, 1.446958, 2.082011, 1, 1, 1, 1, 1,
0.8321278, 0.9019648, 1.166813, 1, 1, 1, 1, 1,
0.8372888, -0.08972454, 1.877421, 1, 1, 1, 1, 1,
0.8404193, 1.034387, -2.408609, 1, 1, 1, 1, 1,
0.8422807, 0.8572741, 0.7262997, 0, 0, 1, 1, 1,
0.8433135, 0.1563074, 2.034081, 1, 0, 0, 1, 1,
0.843694, -1.381359, 2.33703, 1, 0, 0, 1, 1,
0.8449883, -0.5951198, 1.708963, 1, 0, 0, 1, 1,
0.8465613, 0.0541408, 2.593007, 1, 0, 0, 1, 1,
0.8471953, -0.8291169, 1.686947, 1, 0, 0, 1, 1,
0.8483908, 0.0890127, 0.8203996, 0, 0, 0, 1, 1,
0.8486924, -0.2338531, 2.868385, 0, 0, 0, 1, 1,
0.8493518, -1.272801, 2.219609, 0, 0, 0, 1, 1,
0.8541848, -0.05216879, 3.155099, 0, 0, 0, 1, 1,
0.8567703, -0.8653951, 1.339825, 0, 0, 0, 1, 1,
0.8568329, 0.8398542, 2.548835, 0, 0, 0, 1, 1,
0.8601125, -0.8885113, 2.860593, 0, 0, 0, 1, 1,
0.8605917, 0.72346, 0.634662, 1, 1, 1, 1, 1,
0.8649806, 0.5281868, 2.634556, 1, 1, 1, 1, 1,
0.8700956, 1.089903, 1.749826, 1, 1, 1, 1, 1,
0.8704877, 0.3258212, 0.5033482, 1, 1, 1, 1, 1,
0.8721839, -0.3625243, 3.620714, 1, 1, 1, 1, 1,
0.8808573, 2.122314, 1.631366, 1, 1, 1, 1, 1,
0.8840883, 1.090377, 0.9226184, 1, 1, 1, 1, 1,
0.884912, 0.4127944, -1.343276, 1, 1, 1, 1, 1,
0.891322, -0.977176, 0.7998947, 1, 1, 1, 1, 1,
0.8919182, 0.8306121, 1.079947, 1, 1, 1, 1, 1,
0.8987317, -1.382966, 3.609497, 1, 1, 1, 1, 1,
0.9003409, -0.2561496, 2.237264, 1, 1, 1, 1, 1,
0.9008352, -0.02104918, 1.538419, 1, 1, 1, 1, 1,
0.9068261, -0.242617, 0.5009013, 1, 1, 1, 1, 1,
0.9116917, 1.328121, 2.119157, 1, 1, 1, 1, 1,
0.9120617, 0.04554119, 2.169767, 0, 0, 1, 1, 1,
0.9172217, -1.65095, 3.771306, 1, 0, 0, 1, 1,
0.9199317, 0.02500638, 1.62142, 1, 0, 0, 1, 1,
0.9298077, -0.7577342, 1.095559, 1, 0, 0, 1, 1,
0.930155, 1.874898, 0.7127506, 1, 0, 0, 1, 1,
0.9432599, -0.1797689, 2.39284, 1, 0, 0, 1, 1,
0.9492783, -2.6228, 3.726075, 0, 0, 0, 1, 1,
0.9527141, 0.9387818, 1.00904, 0, 0, 0, 1, 1,
0.9580995, -0.6602827, 2.129793, 0, 0, 0, 1, 1,
0.9583138, -2.164722, 1.508727, 0, 0, 0, 1, 1,
0.9613458, 0.07784951, 0.9902806, 0, 0, 0, 1, 1,
0.9622802, 3.196046, 1.156783, 0, 0, 0, 1, 1,
0.9630063, -0.6965879, 2.605587, 0, 0, 0, 1, 1,
0.9729744, 2.11073, -0.3087251, 1, 1, 1, 1, 1,
0.9754853, -0.5484943, 2.49524, 1, 1, 1, 1, 1,
0.9827, 2.348878, -0.3335567, 1, 1, 1, 1, 1,
0.9865723, 1.695813, 0.2820747, 1, 1, 1, 1, 1,
0.9878328, 0.1872115, 0.08939724, 1, 1, 1, 1, 1,
0.9879321, -0.7446033, 1.563173, 1, 1, 1, 1, 1,
0.9885526, 1.457245, -0.5581825, 1, 1, 1, 1, 1,
0.9943191, 0.2872065, 0.9295123, 1, 1, 1, 1, 1,
0.9956511, 0.1237151, 1.400704, 1, 1, 1, 1, 1,
1.002131, 0.1573567, 0.6852247, 1, 1, 1, 1, 1,
1.006035, -1.215882, 1.342738, 1, 1, 1, 1, 1,
1.008836, 1.59561, -0.2545436, 1, 1, 1, 1, 1,
1.013572, 0.4272853, 1.834068, 1, 1, 1, 1, 1,
1.015121, -1.725477, -0.3037721, 1, 1, 1, 1, 1,
1.017162, -0.7304568, 3.760339, 1, 1, 1, 1, 1,
1.01978, -0.2353863, 2.886667, 0, 0, 1, 1, 1,
1.020722, 1.627239, 1.796101, 1, 0, 0, 1, 1,
1.023047, 0.1686255, 0.5981283, 1, 0, 0, 1, 1,
1.030924, 0.6745955, 0.8028154, 1, 0, 0, 1, 1,
1.033718, -1.569916, 1.669936, 1, 0, 0, 1, 1,
1.038376, 1.089693, 1.14363, 1, 0, 0, 1, 1,
1.03905, -0.1589604, 1.813158, 0, 0, 0, 1, 1,
1.040087, -1.477954, 2.218718, 0, 0, 0, 1, 1,
1.04324, -0.1398174, 0.4499025, 0, 0, 0, 1, 1,
1.044352, 0.6427786, 0.5431852, 0, 0, 0, 1, 1,
1.051355, 0.908297, 0.8570414, 0, 0, 0, 1, 1,
1.053637, -0.8199061, 2.962067, 0, 0, 0, 1, 1,
1.055176, 0.3221121, 0.1921885, 0, 0, 0, 1, 1,
1.065369, 0.466668, 0.7445077, 1, 1, 1, 1, 1,
1.06768, 0.912124, 0.9361911, 1, 1, 1, 1, 1,
1.069286, -0.2485652, 0.3790118, 1, 1, 1, 1, 1,
1.073953, -1.058282, 3.242839, 1, 1, 1, 1, 1,
1.075272, 1.090629, 2.289394, 1, 1, 1, 1, 1,
1.076725, -0.2692116, 0.8781726, 1, 1, 1, 1, 1,
1.083176, 1.28582, 0.4321966, 1, 1, 1, 1, 1,
1.084372, -2.010085, 3.848383, 1, 1, 1, 1, 1,
1.086655, 1.884361, 0.6815433, 1, 1, 1, 1, 1,
1.087463, 0.5881696, 1.571122, 1, 1, 1, 1, 1,
1.089916, -1.183329, 4.008449, 1, 1, 1, 1, 1,
1.094278, 0.4277938, 0.5684488, 1, 1, 1, 1, 1,
1.094869, -0.7438129, 2.442073, 1, 1, 1, 1, 1,
1.097049, 0.6502555, 2.126998, 1, 1, 1, 1, 1,
1.097779, -1.304069, 1.681748, 1, 1, 1, 1, 1,
1.100092, 0.4584482, 1.245484, 0, 0, 1, 1, 1,
1.121978, 0.08601325, 0.5337455, 1, 0, 0, 1, 1,
1.128828, -0.8188511, 3.154181, 1, 0, 0, 1, 1,
1.131079, -0.2394641, 1.135008, 1, 0, 0, 1, 1,
1.135987, 0.09667172, 1.145957, 1, 0, 0, 1, 1,
1.153067, -0.4129163, 2.866741, 1, 0, 0, 1, 1,
1.154962, -0.6752846, 2.184604, 0, 0, 0, 1, 1,
1.157511, -0.08238902, 1.474371, 0, 0, 0, 1, 1,
1.1648, 1.242597, 0.6416419, 0, 0, 0, 1, 1,
1.1705, 1.065289, 1.531029, 0, 0, 0, 1, 1,
1.174418, 1.495296, 0.3203984, 0, 0, 0, 1, 1,
1.180134, 0.0246052, 1.652805, 0, 0, 0, 1, 1,
1.18109, -1.133591, 1.44089, 0, 0, 0, 1, 1,
1.18384, -0.007591821, 1.403517, 1, 1, 1, 1, 1,
1.184217, -0.7114017, 2.079174, 1, 1, 1, 1, 1,
1.185189, 0.04192154, 0.4135045, 1, 1, 1, 1, 1,
1.185426, -0.6305193, 2.755513, 1, 1, 1, 1, 1,
1.185907, 0.1781026, 0.8354365, 1, 1, 1, 1, 1,
1.186314, -1.029235, 2.283508, 1, 1, 1, 1, 1,
1.189506, 0.1348286, 1.060836, 1, 1, 1, 1, 1,
1.198272, -1.14996, 0.6015831, 1, 1, 1, 1, 1,
1.205663, -0.2298053, 1.981578, 1, 1, 1, 1, 1,
1.240171, 0.8708075, 2.273188, 1, 1, 1, 1, 1,
1.242368, 1.497945, 1.033458, 1, 1, 1, 1, 1,
1.27023, -0.09780418, 2.078584, 1, 1, 1, 1, 1,
1.27591, 0.09137508, 2.785202, 1, 1, 1, 1, 1,
1.279209, -0.6419215, 2.340028, 1, 1, 1, 1, 1,
1.27952, -1.359847, 3.50573, 1, 1, 1, 1, 1,
1.286206, -1.234167, 3.595158, 0, 0, 1, 1, 1,
1.295381, 1.623708, 0.8029003, 1, 0, 0, 1, 1,
1.306806, -0.1264222, 2.72399, 1, 0, 0, 1, 1,
1.316804, -0.6375157, 3.058851, 1, 0, 0, 1, 1,
1.319433, 0.1586253, 3.422556, 1, 0, 0, 1, 1,
1.319819, 1.268036, 1.194611, 1, 0, 0, 1, 1,
1.330639, -0.6905192, 0.9522216, 0, 0, 0, 1, 1,
1.330707, -0.8131724, 2.877022, 0, 0, 0, 1, 1,
1.338833, 0.4651344, 1.854183, 0, 0, 0, 1, 1,
1.356317, -0.4148611, 1.466672, 0, 0, 0, 1, 1,
1.356871, -0.4784985, 1.553602, 0, 0, 0, 1, 1,
1.366976, -1.248597, 3.138132, 0, 0, 0, 1, 1,
1.373304, -0.2122398, 3.274494, 0, 0, 0, 1, 1,
1.386785, -1.380759, 3.546087, 1, 1, 1, 1, 1,
1.398265, -1.20519, 2.068156, 1, 1, 1, 1, 1,
1.399242, -0.9599836, 2.8197, 1, 1, 1, 1, 1,
1.40765, 0.5812158, 1.096126, 1, 1, 1, 1, 1,
1.414079, -1.421693, 2.997526, 1, 1, 1, 1, 1,
1.416947, -0.2618324, 2.156425, 1, 1, 1, 1, 1,
1.418179, -0.003807434, 0.6193425, 1, 1, 1, 1, 1,
1.431951, -0.4611182, 1.549114, 1, 1, 1, 1, 1,
1.443977, -0.3506407, 1.480624, 1, 1, 1, 1, 1,
1.457487, -0.1711564, 0.4396245, 1, 1, 1, 1, 1,
1.458417, 2.242692, -0.3806889, 1, 1, 1, 1, 1,
1.466868, 0.5137061, 0.1485588, 1, 1, 1, 1, 1,
1.46759, 0.0612227, -0.00196189, 1, 1, 1, 1, 1,
1.470687, 0.9462735, 2.387539, 1, 1, 1, 1, 1,
1.476753, 0.2317715, 2.404076, 1, 1, 1, 1, 1,
1.480339, 1.502706, 2.942981, 0, 0, 1, 1, 1,
1.482912, 1.043231, 1.612465, 1, 0, 0, 1, 1,
1.489003, 0.3662619, -0.2790399, 1, 0, 0, 1, 1,
1.508894, 0.3688372, 0.258664, 1, 0, 0, 1, 1,
1.546733, -0.03726162, 0.05519141, 1, 0, 0, 1, 1,
1.561698, -0.7603668, 0.5439047, 1, 0, 0, 1, 1,
1.563707, -0.3511213, 3.543522, 0, 0, 0, 1, 1,
1.567866, 0.870052, 0.09169774, 0, 0, 0, 1, 1,
1.598505, -0.5014661, 0.8119971, 0, 0, 0, 1, 1,
1.599629, -0.00509269, 0.1960611, 0, 0, 0, 1, 1,
1.627689, 0.3342986, 0.9083463, 0, 0, 0, 1, 1,
1.634222, -1.076985, 2.747517, 0, 0, 0, 1, 1,
1.646203, 0.2682695, 1.559932, 0, 0, 0, 1, 1,
1.650489, 1.157282, 1.468424, 1, 1, 1, 1, 1,
1.654023, -0.2157869, 3.83717, 1, 1, 1, 1, 1,
1.658321, -1.32381, 2.089092, 1, 1, 1, 1, 1,
1.660466, 0.1468501, 2.358052, 1, 1, 1, 1, 1,
1.668248, 2.338073, 1.091953, 1, 1, 1, 1, 1,
1.67183, 2.047352, 0.4279835, 1, 1, 1, 1, 1,
1.685556, 0.2153417, 2.558429, 1, 1, 1, 1, 1,
1.692008, -1.03916, 2.936804, 1, 1, 1, 1, 1,
1.693752, 0.1207127, 1.705602, 1, 1, 1, 1, 1,
1.694135, -0.7205001, 2.316723, 1, 1, 1, 1, 1,
1.695729, -0.6343531, 1.089312, 1, 1, 1, 1, 1,
1.707278, -0.23018, 1.349352, 1, 1, 1, 1, 1,
1.722346, 0.5660379, 2.166191, 1, 1, 1, 1, 1,
1.722968, 0.1926199, 3.865217, 1, 1, 1, 1, 1,
1.723512, 1.240795, 1.822412, 1, 1, 1, 1, 1,
1.726133, 1.275687, 0.3936018, 0, 0, 1, 1, 1,
1.74161, -0.8334686, 1.656186, 1, 0, 0, 1, 1,
1.744584, -0.7966477, 2.617019, 1, 0, 0, 1, 1,
1.751457, 0.1967735, 2.156184, 1, 0, 0, 1, 1,
1.757174, -0.7371458, 2.823229, 1, 0, 0, 1, 1,
1.784577, -0.4532307, 2.471367, 1, 0, 0, 1, 1,
1.796212, -0.4878201, 2.064471, 0, 0, 0, 1, 1,
1.822325, 1.002573, 2.779423, 0, 0, 0, 1, 1,
1.84418, -0.3159584, 2.226495, 0, 0, 0, 1, 1,
1.870954, -1.51784, 2.564698, 0, 0, 0, 1, 1,
1.882317, -1.442478, 2.745753, 0, 0, 0, 1, 1,
1.892391, 0.06270844, 0.9997777, 0, 0, 0, 1, 1,
1.897956, 0.3628224, 2.404912, 0, 0, 0, 1, 1,
1.908627, 0.5089678, 2.137372, 1, 1, 1, 1, 1,
1.91432, 1.318956, 1.96853, 1, 1, 1, 1, 1,
1.946992, -0.2588852, 1.818793, 1, 1, 1, 1, 1,
1.966788, -1.036258, 2.324349, 1, 1, 1, 1, 1,
1.97811, -0.08599826, 1.218047, 1, 1, 1, 1, 1,
1.984376, -2.781539, 1.002807, 1, 1, 1, 1, 1,
1.98598, -0.301316, 1.847569, 1, 1, 1, 1, 1,
1.997887, 0.1220321, 1.659379, 1, 1, 1, 1, 1,
2.008574, -1.078507, 1.700381, 1, 1, 1, 1, 1,
2.038812, -0.3657511, 0.9284689, 1, 1, 1, 1, 1,
2.056184, 0.2959982, 3.790855, 1, 1, 1, 1, 1,
2.063123, -0.6213229, 1.94143, 1, 1, 1, 1, 1,
2.081019, -0.03679613, 2.133141, 1, 1, 1, 1, 1,
2.081646, 0.8634189, -0.3165185, 1, 1, 1, 1, 1,
2.11711, 0.1223772, 1.646185, 1, 1, 1, 1, 1,
2.143176, -0.03944605, 2.27122, 0, 0, 1, 1, 1,
2.177889, -0.1005756, 1.919493, 1, 0, 0, 1, 1,
2.196784, 0.3844675, 0.2243178, 1, 0, 0, 1, 1,
2.226619, -0.1916914, 0.6654053, 1, 0, 0, 1, 1,
2.231938, 1.576702, 1.78637, 1, 0, 0, 1, 1,
2.258367, -1.304615, 1.535, 1, 0, 0, 1, 1,
2.38705, -0.3059815, 0.9564147, 0, 0, 0, 1, 1,
2.409968, 0.7212109, 0.7013853, 0, 0, 0, 1, 1,
2.520442, 1.923021, -0.4691516, 0, 0, 0, 1, 1,
2.542435, -0.4707561, 1.794077, 0, 0, 0, 1, 1,
2.559331, -0.4560092, 3.398885, 0, 0, 0, 1, 1,
2.578776, 0.4693807, 2.569149, 0, 0, 0, 1, 1,
2.592169, -2.174213, 2.541079, 0, 0, 0, 1, 1,
2.741835, 0.2893286, -0.3747605, 1, 1, 1, 1, 1,
2.772014, -0.004363953, 2.973362, 1, 1, 1, 1, 1,
2.860563, 0.2892596, 2.566183, 1, 1, 1, 1, 1,
2.909426, -0.1248158, -0.6109174, 1, 1, 1, 1, 1,
3.105864, 1.47084, 0.1508954, 1, 1, 1, 1, 1,
3.239594, 0.3136764, 0.0690972, 1, 1, 1, 1, 1,
3.308719, 0.4475048, 0.1964409, 1, 1, 1, 1, 1
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
var radius = 9.958816;
var distance = 34.97992;
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
mvMatrix.translate( 0.03839636, -0.1833776, 0.2195363 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.97992);
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