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
-3.474776, -1.021546, -1.589763, 1, 0, 0, 1,
-3.452471, 1.054518, -1.282476, 1, 0.007843138, 0, 1,
-2.990368, -0.6972032, -2.290721, 1, 0.01176471, 0, 1,
-2.86119, 0.6439134, -2.280524, 1, 0.01960784, 0, 1,
-2.811034, -0.9903637, -3.119672, 1, 0.02352941, 0, 1,
-2.675029, 0.1411353, -1.529642, 1, 0.03137255, 0, 1,
-2.522907, 0.6019107, -0.8580233, 1, 0.03529412, 0, 1,
-2.391984, -0.4169821, -3.082773, 1, 0.04313726, 0, 1,
-2.35649, -0.0699341, -0.4122895, 1, 0.04705882, 0, 1,
-2.305064, -0.9386084, -2.050043, 1, 0.05490196, 0, 1,
-2.271232, -0.5859214, -1.757919, 1, 0.05882353, 0, 1,
-2.217415, 0.4195217, -1.300449, 1, 0.06666667, 0, 1,
-2.094397, 1.012058, -0.01095642, 1, 0.07058824, 0, 1,
-2.079505, 1.501001, -0.2290142, 1, 0.07843138, 0, 1,
-2.056843, -1.662219, -2.437768, 1, 0.08235294, 0, 1,
-2.047107, 1.321884, 0.2836666, 1, 0.09019608, 0, 1,
-2.029512, 0.4192306, -1.004596, 1, 0.09411765, 0, 1,
-2.018352, 2.805876, -1.033072, 1, 0.1019608, 0, 1,
-1.982557, -0.1725538, -0.8404651, 1, 0.1098039, 0, 1,
-1.977673, 1.015112, -0.261963, 1, 0.1137255, 0, 1,
-1.974765, 1.82976, -2.32721, 1, 0.1215686, 0, 1,
-1.972019, -1.349175, -2.166052, 1, 0.1254902, 0, 1,
-1.969562, -0.2097465, -1.553001, 1, 0.1333333, 0, 1,
-1.968235, -0.6496518, -0.9530426, 1, 0.1372549, 0, 1,
-1.931676, -0.2758928, 0.1703613, 1, 0.145098, 0, 1,
-1.921753, -2.146342, -2.732216, 1, 0.1490196, 0, 1,
-1.908112, -1.441162, -0.3548047, 1, 0.1568628, 0, 1,
-1.902974, -0.8029965, -3.241398, 1, 0.1607843, 0, 1,
-1.881767, 0.4339135, -0.6734754, 1, 0.1686275, 0, 1,
-1.879356, -0.319202, -1.868025, 1, 0.172549, 0, 1,
-1.877316, -0.7318302, -3.503736, 1, 0.1803922, 0, 1,
-1.846829, -0.9353684, -2.023637, 1, 0.1843137, 0, 1,
-1.842862, -3.007425, -2.730586, 1, 0.1921569, 0, 1,
-1.839792, 0.6675978, -0.05763609, 1, 0.1960784, 0, 1,
-1.835527, 0.1095326, -0.4428258, 1, 0.2039216, 0, 1,
-1.822085, -0.4196313, -2.420236, 1, 0.2117647, 0, 1,
-1.819163, 0.4983487, -0.02385705, 1, 0.2156863, 0, 1,
-1.764672, 0.4353116, -1.453316, 1, 0.2235294, 0, 1,
-1.763423, 0.4208771, -1.169092, 1, 0.227451, 0, 1,
-1.762279, -1.364704, -1.426382, 1, 0.2352941, 0, 1,
-1.759131, -1.52451, -3.204317, 1, 0.2392157, 0, 1,
-1.741852, 0.4761281, -0.1336851, 1, 0.2470588, 0, 1,
-1.713943, 2.438291, -0.07742925, 1, 0.2509804, 0, 1,
-1.708252, 0.6941525, -3.222256, 1, 0.2588235, 0, 1,
-1.699713, -1.791795, -2.63172, 1, 0.2627451, 0, 1,
-1.698391, -0.2917574, -1.347654, 1, 0.2705882, 0, 1,
-1.691154, 0.9384679, -0.9456299, 1, 0.2745098, 0, 1,
-1.681168, -0.9862618, -2.751335, 1, 0.282353, 0, 1,
-1.679083, 0.9660972, -0.9911871, 1, 0.2862745, 0, 1,
-1.674495, -1.616968, -3.210814, 1, 0.2941177, 0, 1,
-1.673728, -2.035125, -3.495694, 1, 0.3019608, 0, 1,
-1.672644, 0.4736345, -0.8295636, 1, 0.3058824, 0, 1,
-1.660151, 2.43159, 0.8215113, 1, 0.3137255, 0, 1,
-1.653717, 0.2545007, -1.998528, 1, 0.3176471, 0, 1,
-1.647177, 1.268064, -1.616746, 1, 0.3254902, 0, 1,
-1.643174, -0.7589149, -0.7537539, 1, 0.3294118, 0, 1,
-1.635975, -0.8402285, -2.655548, 1, 0.3372549, 0, 1,
-1.625699, 0.05350298, -0.5050018, 1, 0.3411765, 0, 1,
-1.622969, 0.6410194, -1.010152, 1, 0.3490196, 0, 1,
-1.59274, -0.4869995, -2.944965, 1, 0.3529412, 0, 1,
-1.586375, 1.661942, 1.430107, 1, 0.3607843, 0, 1,
-1.582224, -0.6462081, -1.567814, 1, 0.3647059, 0, 1,
-1.57741, 1.153524, -0.5181414, 1, 0.372549, 0, 1,
-1.56587, -0.5294214, -0.6461754, 1, 0.3764706, 0, 1,
-1.559996, -0.1633349, -1.764273, 1, 0.3843137, 0, 1,
-1.552842, -1.415057, -1.273551, 1, 0.3882353, 0, 1,
-1.55259, -0.03640357, -0.6186401, 1, 0.3960784, 0, 1,
-1.551759, -1.467589, -2.696713, 1, 0.4039216, 0, 1,
-1.53742, -0.9766555, -1.218427, 1, 0.4078431, 0, 1,
-1.536571, 1.471358, -1.240548, 1, 0.4156863, 0, 1,
-1.524356, 1.561862, -0.8832354, 1, 0.4196078, 0, 1,
-1.514863, -0.3305828, -1.125351, 1, 0.427451, 0, 1,
-1.507763, -0.1485167, -2.267312, 1, 0.4313726, 0, 1,
-1.495443, 0.02564431, -3.698676, 1, 0.4392157, 0, 1,
-1.488361, -0.3610353, -3.197725, 1, 0.4431373, 0, 1,
-1.472004, -0.3666134, -0.2750451, 1, 0.4509804, 0, 1,
-1.458171, -1.701311, -1.857663, 1, 0.454902, 0, 1,
-1.445199, -0.9233445, -0.5786355, 1, 0.4627451, 0, 1,
-1.438945, -1.497447, -2.328588, 1, 0.4666667, 0, 1,
-1.436855, 0.1582679, -0.8576698, 1, 0.4745098, 0, 1,
-1.436243, -1.568478, -2.605625, 1, 0.4784314, 0, 1,
-1.434143, 1.107126, -3.013819, 1, 0.4862745, 0, 1,
-1.424896, -0.8798329, -2.748035, 1, 0.4901961, 0, 1,
-1.404976, 1.874806, 1.061864, 1, 0.4980392, 0, 1,
-1.38994, 0.8823169, -1.608426, 1, 0.5058824, 0, 1,
-1.378226, 0.1480088, -0.2956793, 1, 0.509804, 0, 1,
-1.374901, 1.736192, -1.429976, 1, 0.5176471, 0, 1,
-1.362706, 1.102784, -0.2181363, 1, 0.5215687, 0, 1,
-1.359989, -0.7984718, -2.923842, 1, 0.5294118, 0, 1,
-1.358543, -0.2243589, -1.867217, 1, 0.5333334, 0, 1,
-1.352001, 0.6298724, 0.2390935, 1, 0.5411765, 0, 1,
-1.350016, -0.5930831, -2.742087, 1, 0.5450981, 0, 1,
-1.347135, 0.2091701, -1.221919, 1, 0.5529412, 0, 1,
-1.345139, 0.5563247, -1.0739, 1, 0.5568628, 0, 1,
-1.334956, -0.6705611, -1.839036, 1, 0.5647059, 0, 1,
-1.33229, -0.1892595, -1.721122, 1, 0.5686275, 0, 1,
-1.329393, 0.108462, -2.383403, 1, 0.5764706, 0, 1,
-1.328252, 1.417623, -0.9359707, 1, 0.5803922, 0, 1,
-1.327404, 0.7394596, 0.5023186, 1, 0.5882353, 0, 1,
-1.319396, 0.3128012, -1.34457, 1, 0.5921569, 0, 1,
-1.318867, 0.474136, -0.5441099, 1, 0.6, 0, 1,
-1.318191, 0.4877004, -3.325502, 1, 0.6078432, 0, 1,
-1.312095, -0.06015888, -2.142772, 1, 0.6117647, 0, 1,
-1.308585, -1.762511, -2.267377, 1, 0.6196079, 0, 1,
-1.304448, 0.9434834, -1.454248, 1, 0.6235294, 0, 1,
-1.296464, 1.144648, -1.547077, 1, 0.6313726, 0, 1,
-1.280487, -1.233196, -3.574247, 1, 0.6352941, 0, 1,
-1.266014, -1.064164, -2.247203, 1, 0.6431373, 0, 1,
-1.266004, -0.3957131, -2.071864, 1, 0.6470588, 0, 1,
-1.265511, 0.008365655, -2.977802, 1, 0.654902, 0, 1,
-1.264464, -2.374231, -0.9414966, 1, 0.6588235, 0, 1,
-1.264269, 0.221958, 0.03886754, 1, 0.6666667, 0, 1,
-1.25809, -0.4941998, -1.557889, 1, 0.6705883, 0, 1,
-1.256306, 0.9510959, 0.02648818, 1, 0.6784314, 0, 1,
-1.243079, -1.102494, -0.8368683, 1, 0.682353, 0, 1,
-1.235711, -0.2264898, -2.435917, 1, 0.6901961, 0, 1,
-1.234707, -0.4428259, -3.267722, 1, 0.6941177, 0, 1,
-1.225716, -0.03197928, -1.791881, 1, 0.7019608, 0, 1,
-1.223581, 0.9230862, -0.3468404, 1, 0.7098039, 0, 1,
-1.223282, -0.07418516, -0.7649294, 1, 0.7137255, 0, 1,
-1.205245, 0.009514664, -2.165813, 1, 0.7215686, 0, 1,
-1.201792, -0.7170027, -3.657475, 1, 0.7254902, 0, 1,
-1.191487, -0.6996216, -2.125156, 1, 0.7333333, 0, 1,
-1.191303, -0.2766662, -2.835079, 1, 0.7372549, 0, 1,
-1.182319, -0.3739944, -2.558319, 1, 0.7450981, 0, 1,
-1.161247, 1.039368, -1.173687, 1, 0.7490196, 0, 1,
-1.161224, 0.1999282, -1.754532, 1, 0.7568628, 0, 1,
-1.150759, -0.2456273, -2.796326, 1, 0.7607843, 0, 1,
-1.147141, 0.8281065, 0.5982287, 1, 0.7686275, 0, 1,
-1.137741, -0.1430927, -0.8338454, 1, 0.772549, 0, 1,
-1.129025, 0.02579137, -1.752142, 1, 0.7803922, 0, 1,
-1.125312, -1.565635, -1.144549, 1, 0.7843137, 0, 1,
-1.121345, 0.7425834, -0.08666492, 1, 0.7921569, 0, 1,
-1.119886, -1.159318, -2.636217, 1, 0.7960784, 0, 1,
-1.118008, -1.023327, -1.214599, 1, 0.8039216, 0, 1,
-1.109392, -0.7538524, -3.873383, 1, 0.8117647, 0, 1,
-1.107531, -0.07823735, -2.23188, 1, 0.8156863, 0, 1,
-1.106997, -0.4679307, -0.6400507, 1, 0.8235294, 0, 1,
-1.106533, -1.65319, -2.844834, 1, 0.827451, 0, 1,
-1.104834, 0.4832979, -3.218916, 1, 0.8352941, 0, 1,
-1.097244, 0.6145266, -1.510658, 1, 0.8392157, 0, 1,
-1.070454, -1.579207, -1.576297, 1, 0.8470588, 0, 1,
-1.069273, 1.059305, -1.146046, 1, 0.8509804, 0, 1,
-1.068622, 0.5752625, -1.012263, 1, 0.8588235, 0, 1,
-1.065254, -0.1025331, -2.511821, 1, 0.8627451, 0, 1,
-1.053881, -0.1187653, -3.27969, 1, 0.8705882, 0, 1,
-1.053448, -1.496437, -1.986022, 1, 0.8745098, 0, 1,
-1.052373, 1.879518, 0.9442164, 1, 0.8823529, 0, 1,
-1.051131, 1.684546, 1.450758, 1, 0.8862745, 0, 1,
-1.036392, -0.7657675, -1.650862, 1, 0.8941177, 0, 1,
-1.026663, 0.4102939, -0.9314872, 1, 0.8980392, 0, 1,
-1.025361, 0.666507, -0.7932965, 1, 0.9058824, 0, 1,
-1.009495, -0.5769525, 0.1957028, 1, 0.9137255, 0, 1,
-1.008648, 0.2219036, 0.3284356, 1, 0.9176471, 0, 1,
-1.008374, 0.8280489, -0.1317583, 1, 0.9254902, 0, 1,
-1.007625, 0.3646227, 0.1774278, 1, 0.9294118, 0, 1,
-0.9982632, 1.089646, 0.145695, 1, 0.9372549, 0, 1,
-0.9812945, 1.056273, -0.9031875, 1, 0.9411765, 0, 1,
-0.9725646, -1.573518, -2.0989, 1, 0.9490196, 0, 1,
-0.9663494, -0.3015707, -1.694934, 1, 0.9529412, 0, 1,
-0.964357, 1.100174, -1.13794, 1, 0.9607843, 0, 1,
-0.9602518, 1.480742, 0.5986565, 1, 0.9647059, 0, 1,
-0.9548709, 0.664945, -3.296459, 1, 0.972549, 0, 1,
-0.9522011, 1.260757, 0.09373606, 1, 0.9764706, 0, 1,
-0.9413972, 0.4596163, -0.632816, 1, 0.9843137, 0, 1,
-0.9413056, -1.02288, -2.713181, 1, 0.9882353, 0, 1,
-0.9392084, -0.5402302, -2.120382, 1, 0.9960784, 0, 1,
-0.9275737, 0.1467162, -2.571526, 0.9960784, 1, 0, 1,
-0.9214914, -0.3789432, -2.515337, 0.9921569, 1, 0, 1,
-0.9133371, -0.5831832, -1.929647, 0.9843137, 1, 0, 1,
-0.9117063, -0.6045771, -3.703224, 0.9803922, 1, 0, 1,
-0.9024842, 1.039124, 0.02369907, 0.972549, 1, 0, 1,
-0.900456, -2.942945, -2.179975, 0.9686275, 1, 0, 1,
-0.8979093, 0.0282139, -2.495095, 0.9607843, 1, 0, 1,
-0.8956094, 0.2697122, -0.9949183, 0.9568627, 1, 0, 1,
-0.8890124, -0.7671775, -1.925925, 0.9490196, 1, 0, 1,
-0.8843907, -1.858972, -4.088802, 0.945098, 1, 0, 1,
-0.8835472, 1.998039, 0.1797242, 0.9372549, 1, 0, 1,
-0.8811417, 1.393354, -0.1786521, 0.9333333, 1, 0, 1,
-0.8809652, -0.1859897, -1.868258, 0.9254902, 1, 0, 1,
-0.8709736, 0.2562259, -0.1295511, 0.9215686, 1, 0, 1,
-0.8703275, 0.09158617, -1.878168, 0.9137255, 1, 0, 1,
-0.8619692, 0.6344792, -1.473124, 0.9098039, 1, 0, 1,
-0.8521647, -0.7420797, -2.834754, 0.9019608, 1, 0, 1,
-0.8503423, 2.462969, 0.2746521, 0.8941177, 1, 0, 1,
-0.8469247, 0.7770102, -0.8139746, 0.8901961, 1, 0, 1,
-0.8430515, 0.2240499, -0.2871906, 0.8823529, 1, 0, 1,
-0.8349783, -0.5961833, -2.928852, 0.8784314, 1, 0, 1,
-0.8342901, 1.349971, -0.8641775, 0.8705882, 1, 0, 1,
-0.8334507, 0.1345422, -0.08313651, 0.8666667, 1, 0, 1,
-0.8313324, 1.273283, -0.748924, 0.8588235, 1, 0, 1,
-0.8301455, 0.05550819, -1.14693, 0.854902, 1, 0, 1,
-0.8244393, 1.129324, -1.779966, 0.8470588, 1, 0, 1,
-0.8193783, -0.3269966, -4.095162, 0.8431373, 1, 0, 1,
-0.8125968, -1.896198, -4.623669, 0.8352941, 1, 0, 1,
-0.809221, 0.2158382, -0.9334918, 0.8313726, 1, 0, 1,
-0.8076603, -0.7211127, -2.618944, 0.8235294, 1, 0, 1,
-0.806213, 0.026962, -1.998145, 0.8196079, 1, 0, 1,
-0.7972152, -0.4044728, -2.134718, 0.8117647, 1, 0, 1,
-0.7952691, -1.290039, -2.976377, 0.8078431, 1, 0, 1,
-0.781179, 0.1376155, -0.04709002, 0.8, 1, 0, 1,
-0.7798165, -1.752921, -2.494824, 0.7921569, 1, 0, 1,
-0.7786385, 1.069181, 1.175905, 0.7882353, 1, 0, 1,
-0.7774162, 1.106974, -2.101443, 0.7803922, 1, 0, 1,
-0.7720457, 0.8909966, 0.979882, 0.7764706, 1, 0, 1,
-0.7713946, 0.07293288, -1.41268, 0.7686275, 1, 0, 1,
-0.7650186, 2.015688, -1.684743, 0.7647059, 1, 0, 1,
-0.7646678, 2.736371, 0.8990498, 0.7568628, 1, 0, 1,
-0.7634128, -0.9683116, -2.195403, 0.7529412, 1, 0, 1,
-0.7614908, 1.846927, 0.01369985, 0.7450981, 1, 0, 1,
-0.7613108, -1.736278, -2.122414, 0.7411765, 1, 0, 1,
-0.7603303, -1.321267, -2.796852, 0.7333333, 1, 0, 1,
-0.7561791, 0.6983482, 0.5301876, 0.7294118, 1, 0, 1,
-0.7514131, -0.1971255, -1.596968, 0.7215686, 1, 0, 1,
-0.7475467, 0.4538161, -1.474282, 0.7176471, 1, 0, 1,
-0.7421085, 0.7763336, -2.460478, 0.7098039, 1, 0, 1,
-0.7357295, 0.5929394, 1.006283, 0.7058824, 1, 0, 1,
-0.735049, 1.145668, -0.3436306, 0.6980392, 1, 0, 1,
-0.7341332, 1.332452, -0.8139384, 0.6901961, 1, 0, 1,
-0.7337434, -0.801256, -1.104315, 0.6862745, 1, 0, 1,
-0.7334788, 0.01389126, -0.2292238, 0.6784314, 1, 0, 1,
-0.7280564, -0.5087106, -0.9455486, 0.6745098, 1, 0, 1,
-0.7268746, -0.1755274, -0.9786587, 0.6666667, 1, 0, 1,
-0.7248024, -1.47983, -2.80835, 0.6627451, 1, 0, 1,
-0.7121497, -0.4511017, -1.410785, 0.654902, 1, 0, 1,
-0.7121126, 1.088197, -0.9414278, 0.6509804, 1, 0, 1,
-0.7118077, -0.3491845, -3.999943, 0.6431373, 1, 0, 1,
-0.7113442, -0.8970723, -1.31151, 0.6392157, 1, 0, 1,
-0.710979, 1.966715, -0.1410914, 0.6313726, 1, 0, 1,
-0.7091454, -0.0002899254, -2.290668, 0.627451, 1, 0, 1,
-0.7023566, 0.4519578, -2.078975, 0.6196079, 1, 0, 1,
-0.6992797, 0.7793809, -0.7952596, 0.6156863, 1, 0, 1,
-0.6896693, 0.1390021, -0.2800669, 0.6078432, 1, 0, 1,
-0.6859945, -0.6035922, -0.7297267, 0.6039216, 1, 0, 1,
-0.6821598, -0.03179553, -2.082822, 0.5960785, 1, 0, 1,
-0.6782514, 0.9917058, -0.5896417, 0.5882353, 1, 0, 1,
-0.6725904, -0.4002727, -2.127264, 0.5843138, 1, 0, 1,
-0.6716438, 0.685336, -1.232398, 0.5764706, 1, 0, 1,
-0.670886, 1.250596, -2.203267, 0.572549, 1, 0, 1,
-0.6698218, 1.039034, -0.4394383, 0.5647059, 1, 0, 1,
-0.6674268, -1.489358, -0.4672986, 0.5607843, 1, 0, 1,
-0.665013, -0.3765985, -0.1961734, 0.5529412, 1, 0, 1,
-0.660183, 1.14391, -0.6206101, 0.5490196, 1, 0, 1,
-0.656774, 0.5217974, -0.2702962, 0.5411765, 1, 0, 1,
-0.6498455, -0.03391124, -1.708143, 0.5372549, 1, 0, 1,
-0.647773, -0.3357224, -1.792372, 0.5294118, 1, 0, 1,
-0.6473842, 0.6782531, -2.30198, 0.5254902, 1, 0, 1,
-0.6448991, 0.6518388, -1.523159, 0.5176471, 1, 0, 1,
-0.6415789, -0.0488785, -2.967312, 0.5137255, 1, 0, 1,
-0.6404585, 1.126916, -0.3457268, 0.5058824, 1, 0, 1,
-0.637695, -1.902293, -3.783229, 0.5019608, 1, 0, 1,
-0.6364707, 0.9015522, -0.008882389, 0.4941176, 1, 0, 1,
-0.6304656, 1.076363, -1.992409, 0.4862745, 1, 0, 1,
-0.6264938, 0.1916416, -1.732095, 0.4823529, 1, 0, 1,
-0.6261017, 0.8507007, -3.158396, 0.4745098, 1, 0, 1,
-0.6213305, 1.309976, -1.123219, 0.4705882, 1, 0, 1,
-0.6148183, -0.1321864, -1.709576, 0.4627451, 1, 0, 1,
-0.6099888, 0.2294681, -0.8134645, 0.4588235, 1, 0, 1,
-0.6062679, -0.6647704, -2.867857, 0.4509804, 1, 0, 1,
-0.6060819, -0.3876601, -0.9412503, 0.4470588, 1, 0, 1,
-0.5927671, -2.253164, -3.165893, 0.4392157, 1, 0, 1,
-0.5898758, -0.3555592, -2.66555, 0.4352941, 1, 0, 1,
-0.5840809, 1.461159, 0.8283406, 0.427451, 1, 0, 1,
-0.5830151, -0.3811248, -1.923255, 0.4235294, 1, 0, 1,
-0.5827298, 0.5204965, -0.7868287, 0.4156863, 1, 0, 1,
-0.5819099, 0.8161606, -1.564867, 0.4117647, 1, 0, 1,
-0.5810059, -0.03354565, -0.4391586, 0.4039216, 1, 0, 1,
-0.5784076, 0.5602474, 0.7262887, 0.3960784, 1, 0, 1,
-0.5783281, 0.1707411, -1.024171, 0.3921569, 1, 0, 1,
-0.5711763, 1.790976, -1.644438, 0.3843137, 1, 0, 1,
-0.5698144, 0.2362285, -2.554471, 0.3803922, 1, 0, 1,
-0.568417, 0.7147692, -1.445282, 0.372549, 1, 0, 1,
-0.5664523, 0.7848406, -1.539272, 0.3686275, 1, 0, 1,
-0.5656992, -0.06279472, -0.9798136, 0.3607843, 1, 0, 1,
-0.5633472, 1.454094, -0.4098021, 0.3568628, 1, 0, 1,
-0.5631487, 0.2813143, -1.330931, 0.3490196, 1, 0, 1,
-0.5506825, -0.0172839, -0.6893808, 0.345098, 1, 0, 1,
-0.550001, 1.879923, 0.6159694, 0.3372549, 1, 0, 1,
-0.539601, 0.4084115, 0.04391209, 0.3333333, 1, 0, 1,
-0.5391721, 0.8957971, -0.8600314, 0.3254902, 1, 0, 1,
-0.5345836, -1.120263, -2.54646, 0.3215686, 1, 0, 1,
-0.531363, 0.7055272, -0.3572266, 0.3137255, 1, 0, 1,
-0.5308392, 0.3332009, -1.270999, 0.3098039, 1, 0, 1,
-0.5290027, 0.4986759, -0.05107013, 0.3019608, 1, 0, 1,
-0.5284264, 1.12197, -0.1303354, 0.2941177, 1, 0, 1,
-0.5251239, -0.3778299, -2.32141, 0.2901961, 1, 0, 1,
-0.5193381, 0.9274931, -0.5022321, 0.282353, 1, 0, 1,
-0.5176554, -1.696194, -3.551927, 0.2784314, 1, 0, 1,
-0.5168551, -1.046357, -4.236069, 0.2705882, 1, 0, 1,
-0.5143024, 0.8877965, 1.004241, 0.2666667, 1, 0, 1,
-0.5134648, -0.9099625, -3.501596, 0.2588235, 1, 0, 1,
-0.5064139, -1.533252, -3.49218, 0.254902, 1, 0, 1,
-0.5061578, -0.1458573, -2.188476, 0.2470588, 1, 0, 1,
-0.5044166, -0.2013239, -3.251965, 0.2431373, 1, 0, 1,
-0.5026546, -1.165009, -0.8042678, 0.2352941, 1, 0, 1,
-0.5008115, 0.159848, -1.348787, 0.2313726, 1, 0, 1,
-0.4982991, -0.5986933, -2.844878, 0.2235294, 1, 0, 1,
-0.4975358, -0.8487123, -2.507566, 0.2196078, 1, 0, 1,
-0.494882, 0.06517383, -1.402333, 0.2117647, 1, 0, 1,
-0.4923542, 1.10206, 0.4114735, 0.2078431, 1, 0, 1,
-0.4907186, 0.3716064, -0.5065613, 0.2, 1, 0, 1,
-0.489597, -0.2032432, -2.599182, 0.1921569, 1, 0, 1,
-0.4846822, -0.01184157, -2.283318, 0.1882353, 1, 0, 1,
-0.4785563, 0.6025893, -0.02340976, 0.1803922, 1, 0, 1,
-0.4741875, -0.8497507, -2.533558, 0.1764706, 1, 0, 1,
-0.4698553, -0.5133485, -3.136134, 0.1686275, 1, 0, 1,
-0.4663015, 0.9682569, -1.227613, 0.1647059, 1, 0, 1,
-0.4653803, -0.1946631, -0.5974821, 0.1568628, 1, 0, 1,
-0.4626714, 1.362602, 0.483252, 0.1529412, 1, 0, 1,
-0.4620247, -0.3458579, -3.225288, 0.145098, 1, 0, 1,
-0.4584807, -0.3544788, -2.588631, 0.1411765, 1, 0, 1,
-0.4568896, -0.4282406, -1.096731, 0.1333333, 1, 0, 1,
-0.4544914, -1.405928, -1.502581, 0.1294118, 1, 0, 1,
-0.4536144, -0.4283039, -2.250183, 0.1215686, 1, 0, 1,
-0.4521859, -1.726791, -2.900972, 0.1176471, 1, 0, 1,
-0.4487635, 0.9901735, 1.193658, 0.1098039, 1, 0, 1,
-0.44781, 0.355701, -2.229662, 0.1058824, 1, 0, 1,
-0.4471623, 0.04282914, 0.2131448, 0.09803922, 1, 0, 1,
-0.4371023, -0.06800539, -2.068291, 0.09019608, 1, 0, 1,
-0.4349748, 0.0835652, -3.217374, 0.08627451, 1, 0, 1,
-0.4341381, -1.484431, -2.852432, 0.07843138, 1, 0, 1,
-0.433067, 0.1075472, 0.6774901, 0.07450981, 1, 0, 1,
-0.4324032, 0.4330662, -1.015503, 0.06666667, 1, 0, 1,
-0.4307154, 1.03266, -0.6351159, 0.0627451, 1, 0, 1,
-0.4275548, 1.506154, -0.0881236, 0.05490196, 1, 0, 1,
-0.4250209, 0.2687591, -0.3188969, 0.05098039, 1, 0, 1,
-0.4245973, 0.6833106, 0.4778135, 0.04313726, 1, 0, 1,
-0.4243904, 0.620437, 0.8980404, 0.03921569, 1, 0, 1,
-0.4226384, 0.3523578, -0.4790456, 0.03137255, 1, 0, 1,
-0.4190822, 0.2641929, -2.639489, 0.02745098, 1, 0, 1,
-0.4172813, -0.2126458, -2.75964, 0.01960784, 1, 0, 1,
-0.4172582, 0.7728478, 0.03818446, 0.01568628, 1, 0, 1,
-0.4159566, 0.3875316, -1.22781, 0.007843138, 1, 0, 1,
-0.414742, 0.7242332, 0.01699479, 0.003921569, 1, 0, 1,
-0.4111548, 0.8202658, 0.07272056, 0, 1, 0.003921569, 1,
-0.4088635, 0.1813678, -1.794726, 0, 1, 0.01176471, 1,
-0.4065442, -0.5514987, -2.704742, 0, 1, 0.01568628, 1,
-0.4006308, -2.330876, -2.320017, 0, 1, 0.02352941, 1,
-0.3964971, -0.3648252, -2.703087, 0, 1, 0.02745098, 1,
-0.3943235, 0.1995991, -1.531222, 0, 1, 0.03529412, 1,
-0.3903715, -0.474043, -1.65489, 0, 1, 0.03921569, 1,
-0.3835339, 2.012647, 0.3807581, 0, 1, 0.04705882, 1,
-0.3763708, -0.2190406, -0.9077649, 0, 1, 0.05098039, 1,
-0.3726006, -0.6756126, -1.706948, 0, 1, 0.05882353, 1,
-0.3695407, 0.1868472, -2.729939, 0, 1, 0.0627451, 1,
-0.3681067, -0.6838702, -3.642064, 0, 1, 0.07058824, 1,
-0.3666078, -0.7784582, -1.347363, 0, 1, 0.07450981, 1,
-0.3596372, -0.1502499, -1.971327, 0, 1, 0.08235294, 1,
-0.3586252, 1.700875, 0.345056, 0, 1, 0.08627451, 1,
-0.3478637, -1.228396, -0.4784804, 0, 1, 0.09411765, 1,
-0.3471776, -0.5371563, -2.297689, 0, 1, 0.1019608, 1,
-0.342744, 1.131929, -0.6439027, 0, 1, 0.1058824, 1,
-0.3421277, 1.407079, 0.4989945, 0, 1, 0.1137255, 1,
-0.34025, -0.5857576, -2.022727, 0, 1, 0.1176471, 1,
-0.3357505, 0.1537088, -1.826197, 0, 1, 0.1254902, 1,
-0.3284688, 0.3742622, -0.3850845, 0, 1, 0.1294118, 1,
-0.3273713, -0.1980403, -2.719377, 0, 1, 0.1372549, 1,
-0.3271141, 1.765157, -1.286563, 0, 1, 0.1411765, 1,
-0.3250362, 0.2145997, -2.314671, 0, 1, 0.1490196, 1,
-0.3232418, -0.5062528, -3.650605, 0, 1, 0.1529412, 1,
-0.3229376, -1.631636, -3.868599, 0, 1, 0.1607843, 1,
-0.3229221, 0.2893938, -1.759188, 0, 1, 0.1647059, 1,
-0.3178196, 0.5957967, 1.508703, 0, 1, 0.172549, 1,
-0.3111049, -0.5672072, -4.225861, 0, 1, 0.1764706, 1,
-0.3086731, -1.995016, -3.475981, 0, 1, 0.1843137, 1,
-0.302766, 0.6312683, -0.9771631, 0, 1, 0.1882353, 1,
-0.2995066, 0.1780095, -1.168892, 0, 1, 0.1960784, 1,
-0.2970841, -0.2463558, -1.154258, 0, 1, 0.2039216, 1,
-0.2962382, -0.8094586, -3.865666, 0, 1, 0.2078431, 1,
-0.2941698, 1.058485, -0.6938433, 0, 1, 0.2156863, 1,
-0.2919924, -1.322652, -3.869564, 0, 1, 0.2196078, 1,
-0.2918708, -1.252882, -2.502186, 0, 1, 0.227451, 1,
-0.2861864, -0.08113965, -2.300582, 0, 1, 0.2313726, 1,
-0.2855341, 1.504409, -2.125941, 0, 1, 0.2392157, 1,
-0.2842266, -0.1830323, -2.220912, 0, 1, 0.2431373, 1,
-0.2823077, -0.7611919, -3.573649, 0, 1, 0.2509804, 1,
-0.2719316, 0.5579364, -0.2395814, 0, 1, 0.254902, 1,
-0.2711957, 0.3575618, -0.4593952, 0, 1, 0.2627451, 1,
-0.2709227, 1.997202, 1.002651, 0, 1, 0.2666667, 1,
-0.2668827, 2.425702, 0.4758279, 0, 1, 0.2745098, 1,
-0.2657022, -0.1853303, -0.5650043, 0, 1, 0.2784314, 1,
-0.2584567, -0.8899467, -3.011941, 0, 1, 0.2862745, 1,
-0.2546419, 0.8615656, -1.424741, 0, 1, 0.2901961, 1,
-0.2532343, 2.226211, 0.1592993, 0, 1, 0.2980392, 1,
-0.2499176, 2.155872, -0.6595613, 0, 1, 0.3058824, 1,
-0.2470295, 1.028272, -0.166697, 0, 1, 0.3098039, 1,
-0.2457796, 0.5698454, -1.323467, 0, 1, 0.3176471, 1,
-0.2448569, -0.2993102, -2.347557, 0, 1, 0.3215686, 1,
-0.2437621, -0.9248347, -2.335791, 0, 1, 0.3294118, 1,
-0.2385821, 0.7887709, 1.277833, 0, 1, 0.3333333, 1,
-0.233564, -3.029371, -4.503588, 0, 1, 0.3411765, 1,
-0.2313577, -0.157949, -1.128651, 0, 1, 0.345098, 1,
-0.2305259, 0.1464051, -0.2099715, 0, 1, 0.3529412, 1,
-0.2300424, -0.332857, -2.324627, 0, 1, 0.3568628, 1,
-0.2181808, -0.2948812, -0.8578908, 0, 1, 0.3647059, 1,
-0.2177638, 0.9330396, -1.34888, 0, 1, 0.3686275, 1,
-0.2175023, 0.8839446, 0.07998911, 0, 1, 0.3764706, 1,
-0.2149, -0.5556155, -4.734199, 0, 1, 0.3803922, 1,
-0.2099806, 1.578963, 0.2335669, 0, 1, 0.3882353, 1,
-0.2093238, 0.3214649, -0.7654327, 0, 1, 0.3921569, 1,
-0.2052514, 1.759131, -1.035921, 0, 1, 0.4, 1,
-0.2027861, 0.8470971, -0.7152836, 0, 1, 0.4078431, 1,
-0.200787, 0.2560653, -0.7947942, 0, 1, 0.4117647, 1,
-0.2007835, 1.062804, 0.2499991, 0, 1, 0.4196078, 1,
-0.2003431, 1.040781, 0.2218488, 0, 1, 0.4235294, 1,
-0.199945, 0.09760764, -1.116215, 0, 1, 0.4313726, 1,
-0.1995765, 1.111974, -0.4131775, 0, 1, 0.4352941, 1,
-0.1955637, -1.670089, -1.686961, 0, 1, 0.4431373, 1,
-0.1942609, -0.3077842, -2.43825, 0, 1, 0.4470588, 1,
-0.1931505, -0.1976279, -2.872788, 0, 1, 0.454902, 1,
-0.1926123, -0.09521884, -1.488603, 0, 1, 0.4588235, 1,
-0.1922574, 0.5935072, -0.4477802, 0, 1, 0.4666667, 1,
-0.185529, -0.5839478, -2.193684, 0, 1, 0.4705882, 1,
-0.1843205, 1.199887, -0.5189201, 0, 1, 0.4784314, 1,
-0.1829758, -1.668824, -3.695928, 0, 1, 0.4823529, 1,
-0.1813651, 1.512762, 0.4567516, 0, 1, 0.4901961, 1,
-0.1796185, -0.2486304, -1.99545, 0, 1, 0.4941176, 1,
-0.178651, -0.2980858, -3.507691, 0, 1, 0.5019608, 1,
-0.1776442, -1.619434, -3.357185, 0, 1, 0.509804, 1,
-0.1753165, 0.9895447, -1.986139, 0, 1, 0.5137255, 1,
-0.1689712, -1.33978, -3.614705, 0, 1, 0.5215687, 1,
-0.1622938, 0.07777219, 0.05776744, 0, 1, 0.5254902, 1,
-0.1586575, 1.927524, -0.2476469, 0, 1, 0.5333334, 1,
-0.1557499, -1.007852, -3.820907, 0, 1, 0.5372549, 1,
-0.1554791, -0.4013169, -2.281449, 0, 1, 0.5450981, 1,
-0.1495153, 0.3034009, -2.433642, 0, 1, 0.5490196, 1,
-0.1452112, 1.33148, -0.17712, 0, 1, 0.5568628, 1,
-0.1447489, 0.9567398, 0.6123611, 0, 1, 0.5607843, 1,
-0.1442077, 2.014497, -1.381525, 0, 1, 0.5686275, 1,
-0.1410635, -0.09443949, -3.099209, 0, 1, 0.572549, 1,
-0.1359387, 0.5605872, 0.3633473, 0, 1, 0.5803922, 1,
-0.1334641, 0.07687018, -1.539677, 0, 1, 0.5843138, 1,
-0.1317749, -0.8489102, -3.438535, 0, 1, 0.5921569, 1,
-0.1314009, 0.01382461, -0.5893135, 0, 1, 0.5960785, 1,
-0.1274073, -1.434528, -0.5162806, 0, 1, 0.6039216, 1,
-0.1260919, 0.6872207, -0.01427504, 0, 1, 0.6117647, 1,
-0.1248364, -1.397769, -4.735667, 0, 1, 0.6156863, 1,
-0.1215356, -0.04753197, -1.564198, 0, 1, 0.6235294, 1,
-0.1204014, -0.9081067, -1.802075, 0, 1, 0.627451, 1,
-0.1202864, -0.7705087, -4.730011, 0, 1, 0.6352941, 1,
-0.1190255, -0.2641419, -1.848066, 0, 1, 0.6392157, 1,
-0.1159305, -0.4887784, -3.686624, 0, 1, 0.6470588, 1,
-0.1077052, 0.9051981, 0.5274786, 0, 1, 0.6509804, 1,
-0.1017823, -0.6957433, -2.892011, 0, 1, 0.6588235, 1,
-0.100858, 0.8694964, -0.2978184, 0, 1, 0.6627451, 1,
-0.1008409, 0.2704451, 0.4830012, 0, 1, 0.6705883, 1,
-0.1007395, -1.632192, -2.751438, 0, 1, 0.6745098, 1,
-0.100694, 0.4582, 0.5372432, 0, 1, 0.682353, 1,
-0.09985911, -1.410419, -1.890223, 0, 1, 0.6862745, 1,
-0.0982528, -1.235151, -3.675593, 0, 1, 0.6941177, 1,
-0.09631851, 1.859617, 1.239726, 0, 1, 0.7019608, 1,
-0.08697287, -0.8129897, -3.589762, 0, 1, 0.7058824, 1,
-0.08400058, -0.1572955, -3.240613, 0, 1, 0.7137255, 1,
-0.0811323, 1.925499, 1.096944, 0, 1, 0.7176471, 1,
-0.0787592, -1.505258, -2.583593, 0, 1, 0.7254902, 1,
-0.07601075, 1.69314, 0.2006555, 0, 1, 0.7294118, 1,
-0.07203415, 0.6361582, -1.030826, 0, 1, 0.7372549, 1,
-0.07037723, 0.4866142, 1.395791, 0, 1, 0.7411765, 1,
-0.06742892, -0.7244149, -4.654723, 0, 1, 0.7490196, 1,
-0.06199036, -2.807068, -3.036253, 0, 1, 0.7529412, 1,
-0.0604608, 1.148214, -0.191822, 0, 1, 0.7607843, 1,
-0.05971849, 0.7218724, 1.383866, 0, 1, 0.7647059, 1,
-0.05172506, -0.1918511, -1.738844, 0, 1, 0.772549, 1,
-0.04820926, 1.413652, -0.06238423, 0, 1, 0.7764706, 1,
-0.04806297, -0.7223054, -2.79963, 0, 1, 0.7843137, 1,
-0.04717274, 1.004829, -0.3916993, 0, 1, 0.7882353, 1,
-0.04647909, 0.3649541, -1.667154, 0, 1, 0.7960784, 1,
-0.0457634, -1.442143, -3.616203, 0, 1, 0.8039216, 1,
-0.04448965, -1.394036, -2.394523, 0, 1, 0.8078431, 1,
-0.03998626, 0.6066563, -0.851441, 0, 1, 0.8156863, 1,
-0.03980885, -1.15798, -3.585653, 0, 1, 0.8196079, 1,
-0.03898375, -0.6594524, -3.076782, 0, 1, 0.827451, 1,
-0.03207616, -0.8183906, -4.236871, 0, 1, 0.8313726, 1,
-0.03086798, -0.7901238, -3.539469, 0, 1, 0.8392157, 1,
-0.02968107, 0.1306422, 0.6279632, 0, 1, 0.8431373, 1,
-0.02923561, 0.8669341, 1.053854, 0, 1, 0.8509804, 1,
-0.02255178, 0.537966, 1.130785, 0, 1, 0.854902, 1,
-0.02087556, -1.429414, -3.579965, 0, 1, 0.8627451, 1,
-0.02081847, -1.079531, -3.759013, 0, 1, 0.8666667, 1,
-0.02078055, -0.8269952, -4.234777, 0, 1, 0.8745098, 1,
-0.01663679, -0.8856419, -3.497952, 0, 1, 0.8784314, 1,
-0.01386301, -0.4218749, -1.857131, 0, 1, 0.8862745, 1,
-0.01381209, -1.895067, -3.691771, 0, 1, 0.8901961, 1,
-0.01353529, -0.9652771, -4.898099, 0, 1, 0.8980392, 1,
-0.01276177, 1.491076, 1.120039, 0, 1, 0.9058824, 1,
-0.009202857, -0.4956279, -1.592878, 0, 1, 0.9098039, 1,
-0.007582699, 0.7890777, 1.789773, 0, 1, 0.9176471, 1,
-0.005962667, -0.8992236, -1.916103, 0, 1, 0.9215686, 1,
-0.005012838, 0.6602197, -1.757026, 0, 1, 0.9294118, 1,
-0.004929517, -0.2326198, -3.900685, 0, 1, 0.9333333, 1,
-0.000347097, 1.349365, -0.2380384, 0, 1, 0.9411765, 1,
0.006017329, -0.8691314, 2.542593, 0, 1, 0.945098, 1,
0.006337307, 0.3488731, 2.45647, 0, 1, 0.9529412, 1,
0.006468588, -1.134983, 2.745849, 0, 1, 0.9568627, 1,
0.01042925, -0.21696, 2.552061, 0, 1, 0.9647059, 1,
0.01046224, -1.076411, 3.939453, 0, 1, 0.9686275, 1,
0.01284646, -0.8310413, 2.875851, 0, 1, 0.9764706, 1,
0.01753592, -0.9347631, 4.377476, 0, 1, 0.9803922, 1,
0.01781501, 0.2315002, -1.086464, 0, 1, 0.9882353, 1,
0.01782154, 2.322094, 0.07288026, 0, 1, 0.9921569, 1,
0.01852311, -1.905384, 2.416682, 0, 1, 1, 1,
0.02159176, 0.6583564, -0.2287335, 0, 0.9921569, 1, 1,
0.02574115, -0.109056, 1.412035, 0, 0.9882353, 1, 1,
0.02954497, 0.8962623, -0.5528549, 0, 0.9803922, 1, 1,
0.03104099, -0.4315169, 3.867714, 0, 0.9764706, 1, 1,
0.03211136, 0.2202458, 1.10876, 0, 0.9686275, 1, 1,
0.03312272, 0.05088383, 0.3100628, 0, 0.9647059, 1, 1,
0.03502578, 0.6776037, 0.5271525, 0, 0.9568627, 1, 1,
0.0362395, -1.092045, 3.942762, 0, 0.9529412, 1, 1,
0.03689013, -0.00934297, 1.670453, 0, 0.945098, 1, 1,
0.03756144, 0.6576003, -0.91087, 0, 0.9411765, 1, 1,
0.04344269, -1.514666, 3.801933, 0, 0.9333333, 1, 1,
0.04673904, -1.975619, 4.179149, 0, 0.9294118, 1, 1,
0.04921731, 0.8356489, -1.743711, 0, 0.9215686, 1, 1,
0.04973423, -1.63122, 2.455371, 0, 0.9176471, 1, 1,
0.05292915, 2.46575, -0.6372222, 0, 0.9098039, 1, 1,
0.05600012, 0.1080876, -0.3021397, 0, 0.9058824, 1, 1,
0.05732545, 1.545403, -0.01993912, 0, 0.8980392, 1, 1,
0.05774267, -0.1871436, 4.208952, 0, 0.8901961, 1, 1,
0.05932739, -0.5975909, 3.054199, 0, 0.8862745, 1, 1,
0.06022085, 0.1340165, -0.3313724, 0, 0.8784314, 1, 1,
0.0640421, -0.2440627, 0.8130693, 0, 0.8745098, 1, 1,
0.06996416, 0.1836314, 0.02098975, 0, 0.8666667, 1, 1,
0.07003238, -0.9861617, 4.05757, 0, 0.8627451, 1, 1,
0.07748921, -1.008319, 2.112142, 0, 0.854902, 1, 1,
0.0776922, -1.329163, 2.829411, 0, 0.8509804, 1, 1,
0.07804503, -1.150285, 2.695006, 0, 0.8431373, 1, 1,
0.08201843, -0.4524671, 2.615873, 0, 0.8392157, 1, 1,
0.08292688, 0.5498304, -0.08694175, 0, 0.8313726, 1, 1,
0.08353983, 0.4692507, -1.700645, 0, 0.827451, 1, 1,
0.0842858, -0.8568268, 3.164949, 0, 0.8196079, 1, 1,
0.08621, 1.048166, 0.2368763, 0, 0.8156863, 1, 1,
0.08700363, -0.3051313, 2.021001, 0, 0.8078431, 1, 1,
0.08839158, 0.03642627, -0.5760748, 0, 0.8039216, 1, 1,
0.09125419, 1.407257, 0.1848385, 0, 0.7960784, 1, 1,
0.09323467, -2.200533, 2.325304, 0, 0.7882353, 1, 1,
0.09375467, -0.5659289, 2.044049, 0, 0.7843137, 1, 1,
0.09405663, 0.8307487, -2.078618, 0, 0.7764706, 1, 1,
0.09593602, 0.1020233, 0.2179524, 0, 0.772549, 1, 1,
0.1013912, 0.079347, 0.4298986, 0, 0.7647059, 1, 1,
0.1019248, 0.67166, 1.354098, 0, 0.7607843, 1, 1,
0.1028517, 0.8344644, 1.405203, 0, 0.7529412, 1, 1,
0.1051138, 1.726444, -1.250647, 0, 0.7490196, 1, 1,
0.1053338, -0.5768591, 1.599441, 0, 0.7411765, 1, 1,
0.110365, 0.4599676, 1.7981, 0, 0.7372549, 1, 1,
0.1129946, 1.478119, 2.672838, 0, 0.7294118, 1, 1,
0.1131198, 1.584941, 0.1416196, 0, 0.7254902, 1, 1,
0.1138614, -0.1681477, 3.119413, 0, 0.7176471, 1, 1,
0.1139687, -0.7136403, 4.674789, 0, 0.7137255, 1, 1,
0.1148754, -0.4648259, 2.877513, 0, 0.7058824, 1, 1,
0.11499, -0.9422936, 2.373303, 0, 0.6980392, 1, 1,
0.1156177, 0.1488505, -0.3962972, 0, 0.6941177, 1, 1,
0.1252747, 2.180481, 0.9518243, 0, 0.6862745, 1, 1,
0.1281526, -1.101128, 2.690798, 0, 0.682353, 1, 1,
0.1297371, -0.8255813, 2.632163, 0, 0.6745098, 1, 1,
0.1324631, -0.2359899, 5.110606, 0, 0.6705883, 1, 1,
0.1384466, 0.3522529, -0.6322778, 0, 0.6627451, 1, 1,
0.1414342, 0.2994006, 1.145146, 0, 0.6588235, 1, 1,
0.1483289, -0.1016378, 2.599689, 0, 0.6509804, 1, 1,
0.1566983, 0.7700168, -0.2887652, 0, 0.6470588, 1, 1,
0.1624079, 0.5451601, -1.464085, 0, 0.6392157, 1, 1,
0.1645294, 1.10192, 0.7679941, 0, 0.6352941, 1, 1,
0.1699142, -1.118681, 3.394392, 0, 0.627451, 1, 1,
0.1740096, 0.6464062, -0.2710907, 0, 0.6235294, 1, 1,
0.1761114, -0.7711983, 5.31556, 0, 0.6156863, 1, 1,
0.1781115, 0.2704183, 0.3687965, 0, 0.6117647, 1, 1,
0.180099, 0.4238838, 1.838777, 0, 0.6039216, 1, 1,
0.1843777, -0.555259, 3.484921, 0, 0.5960785, 1, 1,
0.1859426, -1.080542, 1.873563, 0, 0.5921569, 1, 1,
0.1871573, 0.4842155, 1.531721, 0, 0.5843138, 1, 1,
0.1889943, 0.2322319, -1.631036, 0, 0.5803922, 1, 1,
0.1908041, -1.919227, 2.018348, 0, 0.572549, 1, 1,
0.1960811, -0.8450177, 4.888427, 0, 0.5686275, 1, 1,
0.1966403, 1.463967, 1.191479, 0, 0.5607843, 1, 1,
0.1996739, 0.00199446, 1.242165, 0, 0.5568628, 1, 1,
0.2017057, 0.6813448, 0.9429324, 0, 0.5490196, 1, 1,
0.2049745, -1.716709, 2.674926, 0, 0.5450981, 1, 1,
0.2079322, -0.1085163, 2.031564, 0, 0.5372549, 1, 1,
0.2111379, -1.253266, 3.679573, 0, 0.5333334, 1, 1,
0.211895, 0.1519688, -0.5080141, 0, 0.5254902, 1, 1,
0.2150293, -1.034426, 2.394699, 0, 0.5215687, 1, 1,
0.2176656, -1.214769, 2.896631, 0, 0.5137255, 1, 1,
0.2187884, -0.1782164, 2.597419, 0, 0.509804, 1, 1,
0.2189081, 1.635732, 0.8044788, 0, 0.5019608, 1, 1,
0.225638, -0.529835, 4.345166, 0, 0.4941176, 1, 1,
0.2275552, 0.3841487, 1.832908, 0, 0.4901961, 1, 1,
0.2285981, -0.1955051, 1.500733, 0, 0.4823529, 1, 1,
0.2286717, 1.15138, 0.2608967, 0, 0.4784314, 1, 1,
0.2286824, -1.576238, 1.669435, 0, 0.4705882, 1, 1,
0.2331944, 1.04176, 0.01563372, 0, 0.4666667, 1, 1,
0.2334519, 0.4669603, -1.065832, 0, 0.4588235, 1, 1,
0.2394286, 0.367355, 2.179918, 0, 0.454902, 1, 1,
0.2402834, 1.50145, 1.50771, 0, 0.4470588, 1, 1,
0.2408924, -0.3749745, 2.668985, 0, 0.4431373, 1, 1,
0.2440534, 0.04745455, 0.7572589, 0, 0.4352941, 1, 1,
0.2446496, 0.9479081, 0.6114971, 0, 0.4313726, 1, 1,
0.2462425, -1.123875, 3.310943, 0, 0.4235294, 1, 1,
0.248185, -1.103003, 3.612826, 0, 0.4196078, 1, 1,
0.2540171, -1.833243, 4.110926, 0, 0.4117647, 1, 1,
0.2549433, -0.6219209, 2.786251, 0, 0.4078431, 1, 1,
0.2564807, 0.1583226, 0.7085975, 0, 0.4, 1, 1,
0.2593123, 0.2049255, -0.2753304, 0, 0.3921569, 1, 1,
0.2631958, -0.3959077, 2.935123, 0, 0.3882353, 1, 1,
0.2654568, 0.2750415, 2.32256, 0, 0.3803922, 1, 1,
0.2665664, 1.528706, -0.1205952, 0, 0.3764706, 1, 1,
0.2698194, 0.1514297, 0.1166995, 0, 0.3686275, 1, 1,
0.2737885, -1.47131, 1.947062, 0, 0.3647059, 1, 1,
0.2745311, 0.9257219, -0.2778556, 0, 0.3568628, 1, 1,
0.2799174, -0.3843447, 4.295833, 0, 0.3529412, 1, 1,
0.2813078, 0.9459979, 1.448696, 0, 0.345098, 1, 1,
0.2879271, -1.665143, 2.172642, 0, 0.3411765, 1, 1,
0.2884216, 0.6435606, 1.990309, 0, 0.3333333, 1, 1,
0.2919617, -0.7659838, 3.067353, 0, 0.3294118, 1, 1,
0.2925574, -2.214229, 3.111264, 0, 0.3215686, 1, 1,
0.2947322, 0.7325839, 1.205143, 0, 0.3176471, 1, 1,
0.2964185, 0.02939268, 1.106769, 0, 0.3098039, 1, 1,
0.3001247, -2.306913, 3.165454, 0, 0.3058824, 1, 1,
0.3041206, 0.9544876, -0.9195048, 0, 0.2980392, 1, 1,
0.3071146, -0.4542737, 3.550577, 0, 0.2901961, 1, 1,
0.308465, 1.225895, -0.1628405, 0, 0.2862745, 1, 1,
0.309217, -1.319984, 3.324051, 0, 0.2784314, 1, 1,
0.3107455, 1.655865, -0.1286488, 0, 0.2745098, 1, 1,
0.3182509, 0.7484429, 0.3767334, 0, 0.2666667, 1, 1,
0.3228043, -0.7892958, 1.66272, 0, 0.2627451, 1, 1,
0.3258773, -1.388374, 2.949224, 0, 0.254902, 1, 1,
0.3304008, -0.1885304, 2.480243, 0, 0.2509804, 1, 1,
0.3399116, -0.6039332, 2.746145, 0, 0.2431373, 1, 1,
0.3454125, 0.5579752, -0.9568888, 0, 0.2392157, 1, 1,
0.3472346, -0.9206956, 4.769955, 0, 0.2313726, 1, 1,
0.3477305, 0.4686548, 0.002811001, 0, 0.227451, 1, 1,
0.349422, 0.4148539, 1.271939, 0, 0.2196078, 1, 1,
0.3506813, -1.078057, 1.029396, 0, 0.2156863, 1, 1,
0.3509873, 0.3288956, 0.0660593, 0, 0.2078431, 1, 1,
0.351913, 0.7484438, 0.1413572, 0, 0.2039216, 1, 1,
0.3530279, -0.7656666, 2.917993, 0, 0.1960784, 1, 1,
0.3598467, -0.1702509, 4.600669, 0, 0.1882353, 1, 1,
0.3604489, 1.023024, -2.509023, 0, 0.1843137, 1, 1,
0.3653365, -0.03486889, 2.407041, 0, 0.1764706, 1, 1,
0.365475, -0.5954005, 2.361809, 0, 0.172549, 1, 1,
0.3690251, -0.06521186, 2.509482, 0, 0.1647059, 1, 1,
0.3699332, 0.3297838, -1.129812, 0, 0.1607843, 1, 1,
0.3744246, 0.6951228, 0.4840246, 0, 0.1529412, 1, 1,
0.3768872, 0.04662437, 1.537573, 0, 0.1490196, 1, 1,
0.377535, -0.2583838, 1.709151, 0, 0.1411765, 1, 1,
0.3802222, -0.3238155, 1.632605, 0, 0.1372549, 1, 1,
0.3846508, 1.097609, -0.3634222, 0, 0.1294118, 1, 1,
0.3882385, 0.1405685, 1.778696, 0, 0.1254902, 1, 1,
0.3914942, -1.71194, 2.625504, 0, 0.1176471, 1, 1,
0.3930671, 1.786628, 2.336246, 0, 0.1137255, 1, 1,
0.3939683, 0.4566814, 0.7551444, 0, 0.1058824, 1, 1,
0.4000461, -0.3251039, 1.441056, 0, 0.09803922, 1, 1,
0.4014371, -0.7769393, 3.936946, 0, 0.09411765, 1, 1,
0.4039831, 0.6401269, 1.564123, 0, 0.08627451, 1, 1,
0.4056699, -0.9218605, 1.866638, 0, 0.08235294, 1, 1,
0.4064403, 0.9835261, 0.7802565, 0, 0.07450981, 1, 1,
0.4082607, 0.7826807, 0.1658351, 0, 0.07058824, 1, 1,
0.4128283, -0.4010037, 1.60894, 0, 0.0627451, 1, 1,
0.4167083, -1.070543, 3.377835, 0, 0.05882353, 1, 1,
0.418598, 1.109686, -0.3182142, 0, 0.05098039, 1, 1,
0.4210709, 0.6041072, -0.8219057, 0, 0.04705882, 1, 1,
0.4219669, 0.472582, 0.6086584, 0, 0.03921569, 1, 1,
0.4252164, 0.956293, -0.3405882, 0, 0.03529412, 1, 1,
0.4267009, 0.1544646, 0.8686296, 0, 0.02745098, 1, 1,
0.4290883, 2.265366, 0.3653708, 0, 0.02352941, 1, 1,
0.4303289, 2.259764, 0.6128021, 0, 0.01568628, 1, 1,
0.4307642, -0.8854936, 2.82311, 0, 0.01176471, 1, 1,
0.4333306, 0.664619, 0.7769737, 0, 0.003921569, 1, 1,
0.434958, -0.2004288, 2.786096, 0.003921569, 0, 1, 1,
0.4356596, -1.504904, 3.530144, 0.007843138, 0, 1, 1,
0.4372991, -2.026889, 2.544464, 0.01568628, 0, 1, 1,
0.4382693, -0.844035, 3.383789, 0.01960784, 0, 1, 1,
0.4400028, 0.3942503, 2.23089, 0.02745098, 0, 1, 1,
0.4402458, -0.01695185, 0.7299865, 0.03137255, 0, 1, 1,
0.4421506, -0.8018174, 3.665452, 0.03921569, 0, 1, 1,
0.4455683, 0.1019188, -0.3092355, 0.04313726, 0, 1, 1,
0.4458386, 1.383014, -0.1381592, 0.05098039, 0, 1, 1,
0.4464517, -0.2966374, 1.276838, 0.05490196, 0, 1, 1,
0.4490749, -0.4679401, 3.057652, 0.0627451, 0, 1, 1,
0.4497984, -1.141025, 3.23856, 0.06666667, 0, 1, 1,
0.4593819, -1.058873, 3.439247, 0.07450981, 0, 1, 1,
0.4597247, -0.7604196, 2.172374, 0.07843138, 0, 1, 1,
0.4632181, -0.1881253, 3.394111, 0.08627451, 0, 1, 1,
0.4693896, -0.7394013, 2.950142, 0.09019608, 0, 1, 1,
0.4723189, -0.1583585, 1.864672, 0.09803922, 0, 1, 1,
0.4797213, -1.574394, 3.629029, 0.1058824, 0, 1, 1,
0.4803154, 0.02856528, 2.241762, 0.1098039, 0, 1, 1,
0.4834896, 0.219844, -1.835579, 0.1176471, 0, 1, 1,
0.4841807, 0.6964909, -1.063896, 0.1215686, 0, 1, 1,
0.4843178, -0.1725386, 0.776651, 0.1294118, 0, 1, 1,
0.4855421, -1.471925, 3.620051, 0.1333333, 0, 1, 1,
0.4856307, -2.112547, 3.394497, 0.1411765, 0, 1, 1,
0.4862049, -0.8700843, 4.023985, 0.145098, 0, 1, 1,
0.4871841, 0.5375525, 0.07321648, 0.1529412, 0, 1, 1,
0.4872672, -2.14044, 1.410908, 0.1568628, 0, 1, 1,
0.4893176, -0.1401916, 2.644034, 0.1647059, 0, 1, 1,
0.4898511, -0.2881315, 1.891186, 0.1686275, 0, 1, 1,
0.4928369, -2.05228, 2.810804, 0.1764706, 0, 1, 1,
0.4933943, 0.1384347, 1.585187, 0.1803922, 0, 1, 1,
0.4953023, -0.6291528, 2.162776, 0.1882353, 0, 1, 1,
0.4966854, -0.4704751, 1.483214, 0.1921569, 0, 1, 1,
0.5045504, 0.7749491, 2.880872, 0.2, 0, 1, 1,
0.5055381, 0.3822288, 1.716114, 0.2078431, 0, 1, 1,
0.5055715, 0.09787816, 0.1532041, 0.2117647, 0, 1, 1,
0.5090703, -0.3923023, 1.888647, 0.2196078, 0, 1, 1,
0.5104916, 0.3714185, 0.9509829, 0.2235294, 0, 1, 1,
0.5106059, -1.1966, 3.515471, 0.2313726, 0, 1, 1,
0.5117169, 0.7530075, 0.511136, 0.2352941, 0, 1, 1,
0.5117476, 1.033065, 0.4095455, 0.2431373, 0, 1, 1,
0.5122911, -0.8269653, 2.079292, 0.2470588, 0, 1, 1,
0.5194549, -1.711868, 1.689418, 0.254902, 0, 1, 1,
0.5204451, -1.229461, 3.443771, 0.2588235, 0, 1, 1,
0.5247726, -0.9251152, 2.202934, 0.2666667, 0, 1, 1,
0.5260881, -0.4776243, 3.447431, 0.2705882, 0, 1, 1,
0.5277786, 1.033168, 1.045345, 0.2784314, 0, 1, 1,
0.5285551, -0.979293, 2.668837, 0.282353, 0, 1, 1,
0.5324853, -0.6186703, 1.019289, 0.2901961, 0, 1, 1,
0.5337656, 0.1953905, 1.13387, 0.2941177, 0, 1, 1,
0.5373213, -1.677092, 3.031933, 0.3019608, 0, 1, 1,
0.5448347, 0.4645945, 0.7230627, 0.3098039, 0, 1, 1,
0.5486291, -2.648835, 2.94455, 0.3137255, 0, 1, 1,
0.552588, 0.600472, -0.6474122, 0.3215686, 0, 1, 1,
0.5611951, -0.9271938, 1.886523, 0.3254902, 0, 1, 1,
0.5629388, -0.6957546, 4.508636, 0.3333333, 0, 1, 1,
0.5643272, 0.9381085, -0.08225805, 0.3372549, 0, 1, 1,
0.5645382, -1.472578, 3.376432, 0.345098, 0, 1, 1,
0.5710667, -0.3288459, 3.92956, 0.3490196, 0, 1, 1,
0.5738156, 1.125766, 1.595781, 0.3568628, 0, 1, 1,
0.5755273, -0.2213282, 1.233855, 0.3607843, 0, 1, 1,
0.5764416, -1.425162, 2.32749, 0.3686275, 0, 1, 1,
0.5792193, -0.5041437, 2.04407, 0.372549, 0, 1, 1,
0.5820811, -0.01571419, 1.964682, 0.3803922, 0, 1, 1,
0.5836567, 0.494391, 1.079529, 0.3843137, 0, 1, 1,
0.592774, 0.6613674, 1.704207, 0.3921569, 0, 1, 1,
0.5939042, 1.1137, 0.8978096, 0.3960784, 0, 1, 1,
0.5941115, 1.155124, -0.5116883, 0.4039216, 0, 1, 1,
0.5985159, -0.488399, 2.487637, 0.4117647, 0, 1, 1,
0.6014698, 1.608902, -1.555662, 0.4156863, 0, 1, 1,
0.6033335, 0.3353082, 0.3351547, 0.4235294, 0, 1, 1,
0.6036014, -1.444091, 3.836453, 0.427451, 0, 1, 1,
0.603781, 0.244143, -0.6396162, 0.4352941, 0, 1, 1,
0.6050302, -0.7547679, 4.137599, 0.4392157, 0, 1, 1,
0.6085374, 0.8696501, 2.01865, 0.4470588, 0, 1, 1,
0.610068, -0.6268052, -0.001511592, 0.4509804, 0, 1, 1,
0.6103059, -1.064811, 0.683238, 0.4588235, 0, 1, 1,
0.6122503, -0.2725317, 1.497336, 0.4627451, 0, 1, 1,
0.6142985, -0.6850262, 1.277234, 0.4705882, 0, 1, 1,
0.6156105, 0.1907682, 2.840683, 0.4745098, 0, 1, 1,
0.6174764, -0.7799904, 1.725602, 0.4823529, 0, 1, 1,
0.6187658, 0.1807784, 1.121488, 0.4862745, 0, 1, 1,
0.6210815, -0.2416703, 2.580321, 0.4941176, 0, 1, 1,
0.6296465, 1.256338, -0.2093924, 0.5019608, 0, 1, 1,
0.6314957, 0.4512583, 0.7796178, 0.5058824, 0, 1, 1,
0.6325904, -2.097584, 2.371899, 0.5137255, 0, 1, 1,
0.6500202, -2.333269, 1.291755, 0.5176471, 0, 1, 1,
0.6536064, 0.2936154, 1.226702, 0.5254902, 0, 1, 1,
0.6538631, -1.289273, 3.369725, 0.5294118, 0, 1, 1,
0.6544529, 0.9147957, 0.5194619, 0.5372549, 0, 1, 1,
0.6631784, 0.08298559, 0.3271151, 0.5411765, 0, 1, 1,
0.669579, 0.4889499, 0.8087693, 0.5490196, 0, 1, 1,
0.6726254, -0.1410934, -0.02936382, 0.5529412, 0, 1, 1,
0.6838626, -1.3223, 4.807302, 0.5607843, 0, 1, 1,
0.6866284, -0.1000229, 1.389313, 0.5647059, 0, 1, 1,
0.6871779, -0.3509683, 1.929686, 0.572549, 0, 1, 1,
0.6923249, -0.6313404, 3.386382, 0.5764706, 0, 1, 1,
0.6959035, 0.263731, 1.736807, 0.5843138, 0, 1, 1,
0.6995323, -1.085045, 1.951788, 0.5882353, 0, 1, 1,
0.7002304, -0.506444, 4.122183, 0.5960785, 0, 1, 1,
0.7062135, -0.7962078, 2.41604, 0.6039216, 0, 1, 1,
0.706942, -1.289692, 3.734234, 0.6078432, 0, 1, 1,
0.7108498, -0.8885841, 2.522156, 0.6156863, 0, 1, 1,
0.7117029, 1.518688, 1.320954, 0.6196079, 0, 1, 1,
0.7144424, -1.091064, 2.651643, 0.627451, 0, 1, 1,
0.7182588, 1.272794, 0.8065836, 0.6313726, 0, 1, 1,
0.7283145, -0.2016741, 0.7502925, 0.6392157, 0, 1, 1,
0.7283698, 1.341251, 0.05497934, 0.6431373, 0, 1, 1,
0.7293026, 1.454917, -0.2528084, 0.6509804, 0, 1, 1,
0.7314589, 1.769681, 2.266256, 0.654902, 0, 1, 1,
0.7331541, 0.1830259, 1.734676, 0.6627451, 0, 1, 1,
0.7338896, 1.825567, 0.2967212, 0.6666667, 0, 1, 1,
0.7347592, -1.337182, 2.903777, 0.6745098, 0, 1, 1,
0.7352149, -0.4207421, 1.895819, 0.6784314, 0, 1, 1,
0.7354985, -0.248901, 2.321423, 0.6862745, 0, 1, 1,
0.7355772, -0.3610575, 1.965732, 0.6901961, 0, 1, 1,
0.7425143, -0.2765656, 0.5869368, 0.6980392, 0, 1, 1,
0.7436103, -1.350022, 2.98284, 0.7058824, 0, 1, 1,
0.7438263, -1.337181, 3.314252, 0.7098039, 0, 1, 1,
0.7466856, 0.6471592, 1.682705, 0.7176471, 0, 1, 1,
0.7538364, 0.2921818, -1.126722, 0.7215686, 0, 1, 1,
0.7547364, -0.1772469, 1.945675, 0.7294118, 0, 1, 1,
0.7558175, 0.850194, 0.7964922, 0.7333333, 0, 1, 1,
0.7619755, -0.8389506, 1.991603, 0.7411765, 0, 1, 1,
0.7629266, 0.8207725, 0.262775, 0.7450981, 0, 1, 1,
0.7653986, 0.6719016, 0.02032807, 0.7529412, 0, 1, 1,
0.7830877, 1.116433, 1.68918, 0.7568628, 0, 1, 1,
0.7855853, 0.5566233, 1.167655, 0.7647059, 0, 1, 1,
0.7863491, -0.6473566, 1.690354, 0.7686275, 0, 1, 1,
0.79096, 0.7700393, -0.3475093, 0.7764706, 0, 1, 1,
0.7930149, 1.117471, 0.05099944, 0.7803922, 0, 1, 1,
0.793169, -0.3900839, 1.741248, 0.7882353, 0, 1, 1,
0.8011372, -1.200449, 1.199823, 0.7921569, 0, 1, 1,
0.8260357, -0.422211, 1.619178, 0.8, 0, 1, 1,
0.8287834, 0.109849, 1.660896, 0.8078431, 0, 1, 1,
0.8302705, -0.002310397, 2.444118, 0.8117647, 0, 1, 1,
0.8313156, 0.03520037, 1.005789, 0.8196079, 0, 1, 1,
0.8360145, -0.1970506, 2.457675, 0.8235294, 0, 1, 1,
0.8378155, -0.1163476, 1.779307, 0.8313726, 0, 1, 1,
0.8385927, 0.3661031, 2.853579, 0.8352941, 0, 1, 1,
0.8418965, 0.3163016, 0.8608732, 0.8431373, 0, 1, 1,
0.8440583, 0.03187958, 1.63064, 0.8470588, 0, 1, 1,
0.8440776, 1.264084, 0.2329155, 0.854902, 0, 1, 1,
0.8532804, 0.7758267, 1.130555, 0.8588235, 0, 1, 1,
0.8539848, -0.2278612, 2.333632, 0.8666667, 0, 1, 1,
0.857762, 0.5490259, -0.1799533, 0.8705882, 0, 1, 1,
0.858465, 0.07385536, 1.860429, 0.8784314, 0, 1, 1,
0.8688332, 0.002823132, 2.942227, 0.8823529, 0, 1, 1,
0.8721315, 0.317151, 3.799027, 0.8901961, 0, 1, 1,
0.8731622, 0.7111508, 0.9686041, 0.8941177, 0, 1, 1,
0.8793455, 1.98991, 1.176883, 0.9019608, 0, 1, 1,
0.8818647, 0.1501778, 0.7230204, 0.9098039, 0, 1, 1,
0.8824683, 1.181425, 0.6484253, 0.9137255, 0, 1, 1,
0.9004392, 0.1372193, 2.287279, 0.9215686, 0, 1, 1,
0.9020267, -0.2574486, 1.104237, 0.9254902, 0, 1, 1,
0.9031331, 1.195407, 1.143227, 0.9333333, 0, 1, 1,
0.9075399, 0.5960908, 2.351758, 0.9372549, 0, 1, 1,
0.9092131, 0.7814575, 1.546952, 0.945098, 0, 1, 1,
0.9106057, -0.1565769, 2.865386, 0.9490196, 0, 1, 1,
0.9123113, -1.412132, 2.255209, 0.9568627, 0, 1, 1,
0.9137657, -0.03790755, 1.231493, 0.9607843, 0, 1, 1,
0.9152089, -1.240674, 4.00518, 0.9686275, 0, 1, 1,
0.9298895, 2.271616, 0.7884298, 0.972549, 0, 1, 1,
0.9396635, 0.950321, 0.3463177, 0.9803922, 0, 1, 1,
0.9440628, 0.4268198, 2.92426, 0.9843137, 0, 1, 1,
0.9443998, 1.728323, 0.2723934, 0.9921569, 0, 1, 1,
0.9445212, 0.764098, 0.08592517, 0.9960784, 0, 1, 1,
0.9466081, -0.05820981, 2.303173, 1, 0, 0.9960784, 1,
0.9556385, 0.8892215, -0.9012852, 1, 0, 0.9882353, 1,
0.9557136, 0.6808174, 1.340246, 1, 0, 0.9843137, 1,
0.95662, 1.396693, -0.5699224, 1, 0, 0.9764706, 1,
0.9569825, 0.3239547, 1.74134, 1, 0, 0.972549, 1,
0.9591141, 0.4259755, 1.861055, 1, 0, 0.9647059, 1,
0.9610808, 0.2940212, 1.021017, 1, 0, 0.9607843, 1,
0.9643828, -0.1107799, 1.306329, 1, 0, 0.9529412, 1,
0.9763384, 0.406778, 0.9734815, 1, 0, 0.9490196, 1,
0.9846637, 0.04999098, 2.124667, 1, 0, 0.9411765, 1,
0.9854928, 0.01110183, 2.972275, 1, 0, 0.9372549, 1,
0.9912706, 0.9933305, 0.4363628, 1, 0, 0.9294118, 1,
0.9922594, -0.1900241, 0.8631235, 1, 0, 0.9254902, 1,
0.9959102, 0.232669, 0.151527, 1, 0, 0.9176471, 1,
1.002851, -0.9809039, 0.1270283, 1, 0, 0.9137255, 1,
1.011193, -1.294267, 0.912688, 1, 0, 0.9058824, 1,
1.012345, 1.085045, -0.2185404, 1, 0, 0.9019608, 1,
1.016958, -0.9979032, 1.399859, 1, 0, 0.8941177, 1,
1.02505, 0.3011241, -0.2230211, 1, 0, 0.8862745, 1,
1.02772, -0.6376603, 1.935801, 1, 0, 0.8823529, 1,
1.056037, -0.4139793, 2.769706, 1, 0, 0.8745098, 1,
1.068892, -0.5199677, 2.177519, 1, 0, 0.8705882, 1,
1.074676, -1.11884, 0.8159413, 1, 0, 0.8627451, 1,
1.074902, 0.08202086, 0.1411814, 1, 0, 0.8588235, 1,
1.080711, -0.8017948, 2.991666, 1, 0, 0.8509804, 1,
1.082275, 0.8696667, 0.6264036, 1, 0, 0.8470588, 1,
1.084359, -1.500987, 2.676906, 1, 0, 0.8392157, 1,
1.102519, 0.9212686, -0.5759835, 1, 0, 0.8352941, 1,
1.106557, 1.905497, -0.4612921, 1, 0, 0.827451, 1,
1.109063, -1.06886, 1.315667, 1, 0, 0.8235294, 1,
1.116649, 0.729547, 1.891199, 1, 0, 0.8156863, 1,
1.118946, 1.759527, 1.834116, 1, 0, 0.8117647, 1,
1.119092, 0.87362, -0.1853453, 1, 0, 0.8039216, 1,
1.119374, -0.6418501, 2.124588, 1, 0, 0.7960784, 1,
1.122908, -1.079591, 1.941621, 1, 0, 0.7921569, 1,
1.123098, -2.275678, 3.739812, 1, 0, 0.7843137, 1,
1.124245, 2.708412, 0.5597959, 1, 0, 0.7803922, 1,
1.125139, -0.3742631, 2.785185, 1, 0, 0.772549, 1,
1.12749, 0.7340893, 2.080106, 1, 0, 0.7686275, 1,
1.13377, -0.9277341, 1.319735, 1, 0, 0.7607843, 1,
1.138571, -1.088249, 0.4274998, 1, 0, 0.7568628, 1,
1.143787, -0.3227821, 0.7592102, 1, 0, 0.7490196, 1,
1.145742, 2.313115, 1.821791, 1, 0, 0.7450981, 1,
1.152971, -0.6123649, 0.8526196, 1, 0, 0.7372549, 1,
1.159699, -1.524793, 3.06826, 1, 0, 0.7333333, 1,
1.163238, 0.313181, 2.934187, 1, 0, 0.7254902, 1,
1.16793, -1.039836, 3.523006, 1, 0, 0.7215686, 1,
1.173168, 0.1659582, 2.490479, 1, 0, 0.7137255, 1,
1.179566, 1.703589, -0.04241279, 1, 0, 0.7098039, 1,
1.183263, 1.077398, 2.126097, 1, 0, 0.7019608, 1,
1.187284, -1.295251, 2.102646, 1, 0, 0.6941177, 1,
1.188348, 0.2186759, 1.290056, 1, 0, 0.6901961, 1,
1.192304, 0.05218878, 2.2762, 1, 0, 0.682353, 1,
1.196963, -0.07018954, 1.465413, 1, 0, 0.6784314, 1,
1.197232, -0.1121802, 1.813091, 1, 0, 0.6705883, 1,
1.200373, 0.7869202, 0.7293996, 1, 0, 0.6666667, 1,
1.201025, 0.7511051, 1.907053, 1, 0, 0.6588235, 1,
1.209826, 1.518335, 0.9001839, 1, 0, 0.654902, 1,
1.21024, -0.1637046, 0.6827787, 1, 0, 0.6470588, 1,
1.211694, 1.281598, 0.3157758, 1, 0, 0.6431373, 1,
1.216415, -0.1146517, 1.22654, 1, 0, 0.6352941, 1,
1.219741, -1.129635, 2.248941, 1, 0, 0.6313726, 1,
1.221362, 0.1925347, 0.9620059, 1, 0, 0.6235294, 1,
1.229606, 0.7763967, 0.5248128, 1, 0, 0.6196079, 1,
1.229803, -0.295867, 1.922473, 1, 0, 0.6117647, 1,
1.231445, -0.3168769, 2.618456, 1, 0, 0.6078432, 1,
1.231608, -0.8228688, 0.7222189, 1, 0, 0.6, 1,
1.234087, -0.3945841, 1.237368, 1, 0, 0.5921569, 1,
1.23411, -0.4806466, 1.879931, 1, 0, 0.5882353, 1,
1.238577, 0.6958275, -1.064005, 1, 0, 0.5803922, 1,
1.248682, -0.2814888, 2.099308, 1, 0, 0.5764706, 1,
1.256853, 0.4471785, 2.20098, 1, 0, 0.5686275, 1,
1.271981, -0.5595402, 1.021314, 1, 0, 0.5647059, 1,
1.288492, 0.5547282, 0.4372986, 1, 0, 0.5568628, 1,
1.28928, -1.289212, 2.926487, 1, 0, 0.5529412, 1,
1.289699, -1.06367, 1.116881, 1, 0, 0.5450981, 1,
1.293007, 0.5835288, 0.6251593, 1, 0, 0.5411765, 1,
1.301225, 0.6289656, 0.2967288, 1, 0, 0.5333334, 1,
1.305815, 0.09556003, 1.416959, 1, 0, 0.5294118, 1,
1.318193, 0.6488357, 0.1328969, 1, 0, 0.5215687, 1,
1.337058, 1.313204, 1.391767, 1, 0, 0.5176471, 1,
1.338321, 1.240216, 1.717109, 1, 0, 0.509804, 1,
1.353924, -0.166715, 0.7772061, 1, 0, 0.5058824, 1,
1.354384, -0.2113972, 0.4163369, 1, 0, 0.4980392, 1,
1.375079, 0.2350064, 1.819503, 1, 0, 0.4901961, 1,
1.386711, -0.6866715, 2.373869, 1, 0, 0.4862745, 1,
1.397455, -0.4129102, 2.362237, 1, 0, 0.4784314, 1,
1.405651, 1.122946, 0.1409416, 1, 0, 0.4745098, 1,
1.421636, -0.3452659, 0.408271, 1, 0, 0.4666667, 1,
1.424367, -2.301603, 1.612106, 1, 0, 0.4627451, 1,
1.424646, 1.056514, 0.2727764, 1, 0, 0.454902, 1,
1.430412, 0.8849444, 1.282134, 1, 0, 0.4509804, 1,
1.438498, 1.117957, 1.835496, 1, 0, 0.4431373, 1,
1.441901, -0.7677705, 3.999955, 1, 0, 0.4392157, 1,
1.442245, -0.8698903, 3.294532, 1, 0, 0.4313726, 1,
1.443288, 1.718882, 1.049498, 1, 0, 0.427451, 1,
1.459735, 0.5416132, 2.045183, 1, 0, 0.4196078, 1,
1.463836, 0.5860496, 1.652456, 1, 0, 0.4156863, 1,
1.465164, 0.5940215, 1.31402, 1, 0, 0.4078431, 1,
1.470559, 0.6059605, -0.5185257, 1, 0, 0.4039216, 1,
1.477424, 0.9484444, 0.6363664, 1, 0, 0.3960784, 1,
1.484773, -0.3745581, 1.336661, 1, 0, 0.3882353, 1,
1.489764, 2.0997, 1.569918, 1, 0, 0.3843137, 1,
1.490055, 0.03143827, 1.845325, 1, 0, 0.3764706, 1,
1.492027, 0.320613, 3.308749, 1, 0, 0.372549, 1,
1.492293, -0.2896191, 1.54798, 1, 0, 0.3647059, 1,
1.494097, 0.7462067, 0.1939659, 1, 0, 0.3607843, 1,
1.504411, -0.05789651, 0.7706173, 1, 0, 0.3529412, 1,
1.512857, 1.192153, 3.282727, 1, 0, 0.3490196, 1,
1.523902, 0.4253263, 2.952623, 1, 0, 0.3411765, 1,
1.537325, -0.7520772, 1.674312, 1, 0, 0.3372549, 1,
1.544872, 1.189252, -0.8305289, 1, 0, 0.3294118, 1,
1.561881, -0.5296278, 1.459795, 1, 0, 0.3254902, 1,
1.565335, -0.1756413, 3.148515, 1, 0, 0.3176471, 1,
1.568698, 0.5939311, 1.661415, 1, 0, 0.3137255, 1,
1.593396, 0.08883888, 2.027242, 1, 0, 0.3058824, 1,
1.614955, 0.4316992, 1.185883, 1, 0, 0.2980392, 1,
1.632647, 0.5669585, 0.9803081, 1, 0, 0.2941177, 1,
1.633518, 1.005038, 0.02260723, 1, 0, 0.2862745, 1,
1.639712, -1.042238, 0.567038, 1, 0, 0.282353, 1,
1.640767, 0.8560463, 0.2112437, 1, 0, 0.2745098, 1,
1.656911, -0.2746622, 3.03293, 1, 0, 0.2705882, 1,
1.669938, -0.8421437, 1.743117, 1, 0, 0.2627451, 1,
1.6786, 1.972693, -0.979064, 1, 0, 0.2588235, 1,
1.688241, -0.1348349, 1.399419, 1, 0, 0.2509804, 1,
1.741431, -1.269713, 2.000718, 1, 0, 0.2470588, 1,
1.748981, -1.277234, 2.150853, 1, 0, 0.2392157, 1,
1.760951, -1.618997, 2.993716, 1, 0, 0.2352941, 1,
1.770556, 0.5891782, 1.550031, 1, 0, 0.227451, 1,
1.806798, -0.414834, 1.565544, 1, 0, 0.2235294, 1,
1.811656, 0.5902433, 2.834997, 1, 0, 0.2156863, 1,
1.835157, -0.2504233, 1.600288, 1, 0, 0.2117647, 1,
1.841545, 0.6977054, 0.2309834, 1, 0, 0.2039216, 1,
1.849148, -1.091067, 2.000191, 1, 0, 0.1960784, 1,
1.861949, 0.5963444, 2.040047, 1, 0, 0.1921569, 1,
1.868637, 0.8631154, 1.153538, 1, 0, 0.1843137, 1,
1.911984, 0.04934541, 2.849944, 1, 0, 0.1803922, 1,
1.982767, 1.785141, 0.645072, 1, 0, 0.172549, 1,
1.989753, 0.7419968, -1.626709, 1, 0, 0.1686275, 1,
1.9958, 0.03171361, -0.1981634, 1, 0, 0.1607843, 1,
2.031707, 0.4240473, 3.524033, 1, 0, 0.1568628, 1,
2.031797, -0.3577599, 1.237958, 1, 0, 0.1490196, 1,
2.036331, 0.1394043, 0.5062205, 1, 0, 0.145098, 1,
2.0633, 2.077894, 1.043492, 1, 0, 0.1372549, 1,
2.085601, -0.7019083, 0.5169036, 1, 0, 0.1333333, 1,
2.109459, 1.262757, -0.2987627, 1, 0, 0.1254902, 1,
2.160042, 0.2910322, 0.1910661, 1, 0, 0.1215686, 1,
2.189145, 0.2465101, 0.5464875, 1, 0, 0.1137255, 1,
2.196336, 1.953912, 1.346363, 1, 0, 0.1098039, 1,
2.251377, 0.2941515, 0.8795662, 1, 0, 0.1019608, 1,
2.277006, -0.9380232, 1.609412, 1, 0, 0.09411765, 1,
2.290847, 2.015331, 1.977051, 1, 0, 0.09019608, 1,
2.376752, -0.3918753, 0.8032275, 1, 0, 0.08235294, 1,
2.377222, -0.6704425, 1.818002, 1, 0, 0.07843138, 1,
2.381224, -0.4118127, 3.49147, 1, 0, 0.07058824, 1,
2.391141, -0.330171, 2.356047, 1, 0, 0.06666667, 1,
2.397776, -1.526792, 1.614449, 1, 0, 0.05882353, 1,
2.429885, -1.199403, 1.862553, 1, 0, 0.05490196, 1,
2.520376, 0.3285774, 1.402694, 1, 0, 0.04705882, 1,
2.535338, -1.80941, 1.825945, 1, 0, 0.04313726, 1,
2.552002, -0.05293643, 1.92532, 1, 0, 0.03529412, 1,
2.914133, 0.735044, 1.622453, 1, 0, 0.03137255, 1,
2.933064, 0.7266849, 1.50896, 1, 0, 0.02352941, 1,
3.020762, -1.246624, 2.883815, 1, 0, 0.01960784, 1,
3.266571, -0.1761059, 1.125695, 1, 0, 0.01176471, 1,
3.443849, 0.6027315, -0.2447515, 1, 0, 0.007843138, 1
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
-0.01546347, -4.018445, -6.629315, 0, -0.5, 0.5, 0.5,
-0.01546347, -4.018445, -6.629315, 1, -0.5, 0.5, 0.5,
-0.01546347, -4.018445, -6.629315, 1, 1.5, 0.5, 0.5,
-0.01546347, -4.018445, -6.629315, 0, 1.5, 0.5, 0.5
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
-4.647483, -0.1117473, -6.629315, 0, -0.5, 0.5, 0.5,
-4.647483, -0.1117473, -6.629315, 1, -0.5, 0.5, 0.5,
-4.647483, -0.1117473, -6.629315, 1, 1.5, 0.5, 0.5,
-4.647483, -0.1117473, -6.629315, 0, 1.5, 0.5, 0.5
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
-4.647483, -4.018445, 0.2087302, 0, -0.5, 0.5, 0.5,
-4.647483, -4.018445, 0.2087302, 1, -0.5, 0.5, 0.5,
-4.647483, -4.018445, 0.2087302, 1, 1.5, 0.5, 0.5,
-4.647483, -4.018445, 0.2087302, 0, 1.5, 0.5, 0.5
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
-3, -3.1169, -5.051304,
3, -3.1169, -5.051304,
-3, -3.1169, -5.051304,
-3, -3.267157, -5.314306,
-2, -3.1169, -5.051304,
-2, -3.267157, -5.314306,
-1, -3.1169, -5.051304,
-1, -3.267157, -5.314306,
0, -3.1169, -5.051304,
0, -3.267157, -5.314306,
1, -3.1169, -5.051304,
1, -3.267157, -5.314306,
2, -3.1169, -5.051304,
2, -3.267157, -5.314306,
3, -3.1169, -5.051304,
3, -3.267157, -5.314306
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
-3, -3.567672, -5.84031, 0, -0.5, 0.5, 0.5,
-3, -3.567672, -5.84031, 1, -0.5, 0.5, 0.5,
-3, -3.567672, -5.84031, 1, 1.5, 0.5, 0.5,
-3, -3.567672, -5.84031, 0, 1.5, 0.5, 0.5,
-2, -3.567672, -5.84031, 0, -0.5, 0.5, 0.5,
-2, -3.567672, -5.84031, 1, -0.5, 0.5, 0.5,
-2, -3.567672, -5.84031, 1, 1.5, 0.5, 0.5,
-2, -3.567672, -5.84031, 0, 1.5, 0.5, 0.5,
-1, -3.567672, -5.84031, 0, -0.5, 0.5, 0.5,
-1, -3.567672, -5.84031, 1, -0.5, 0.5, 0.5,
-1, -3.567672, -5.84031, 1, 1.5, 0.5, 0.5,
-1, -3.567672, -5.84031, 0, 1.5, 0.5, 0.5,
0, -3.567672, -5.84031, 0, -0.5, 0.5, 0.5,
0, -3.567672, -5.84031, 1, -0.5, 0.5, 0.5,
0, -3.567672, -5.84031, 1, 1.5, 0.5, 0.5,
0, -3.567672, -5.84031, 0, 1.5, 0.5, 0.5,
1, -3.567672, -5.84031, 0, -0.5, 0.5, 0.5,
1, -3.567672, -5.84031, 1, -0.5, 0.5, 0.5,
1, -3.567672, -5.84031, 1, 1.5, 0.5, 0.5,
1, -3.567672, -5.84031, 0, 1.5, 0.5, 0.5,
2, -3.567672, -5.84031, 0, -0.5, 0.5, 0.5,
2, -3.567672, -5.84031, 1, -0.5, 0.5, 0.5,
2, -3.567672, -5.84031, 1, 1.5, 0.5, 0.5,
2, -3.567672, -5.84031, 0, 1.5, 0.5, 0.5,
3, -3.567672, -5.84031, 0, -0.5, 0.5, 0.5,
3, -3.567672, -5.84031, 1, -0.5, 0.5, 0.5,
3, -3.567672, -5.84031, 1, 1.5, 0.5, 0.5,
3, -3.567672, -5.84031, 0, 1.5, 0.5, 0.5
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
-3.578555, -3, -5.051304,
-3.578555, 2, -5.051304,
-3.578555, -3, -5.051304,
-3.75671, -3, -5.314306,
-3.578555, -2, -5.051304,
-3.75671, -2, -5.314306,
-3.578555, -1, -5.051304,
-3.75671, -1, -5.314306,
-3.578555, 0, -5.051304,
-3.75671, 0, -5.314306,
-3.578555, 1, -5.051304,
-3.75671, 1, -5.314306,
-3.578555, 2, -5.051304,
-3.75671, 2, -5.314306
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
-4.113019, -3, -5.84031, 0, -0.5, 0.5, 0.5,
-4.113019, -3, -5.84031, 1, -0.5, 0.5, 0.5,
-4.113019, -3, -5.84031, 1, 1.5, 0.5, 0.5,
-4.113019, -3, -5.84031, 0, 1.5, 0.5, 0.5,
-4.113019, -2, -5.84031, 0, -0.5, 0.5, 0.5,
-4.113019, -2, -5.84031, 1, -0.5, 0.5, 0.5,
-4.113019, -2, -5.84031, 1, 1.5, 0.5, 0.5,
-4.113019, -2, -5.84031, 0, 1.5, 0.5, 0.5,
-4.113019, -1, -5.84031, 0, -0.5, 0.5, 0.5,
-4.113019, -1, -5.84031, 1, -0.5, 0.5, 0.5,
-4.113019, -1, -5.84031, 1, 1.5, 0.5, 0.5,
-4.113019, -1, -5.84031, 0, 1.5, 0.5, 0.5,
-4.113019, 0, -5.84031, 0, -0.5, 0.5, 0.5,
-4.113019, 0, -5.84031, 1, -0.5, 0.5, 0.5,
-4.113019, 0, -5.84031, 1, 1.5, 0.5, 0.5,
-4.113019, 0, -5.84031, 0, 1.5, 0.5, 0.5,
-4.113019, 1, -5.84031, 0, -0.5, 0.5, 0.5,
-4.113019, 1, -5.84031, 1, -0.5, 0.5, 0.5,
-4.113019, 1, -5.84031, 1, 1.5, 0.5, 0.5,
-4.113019, 1, -5.84031, 0, 1.5, 0.5, 0.5,
-4.113019, 2, -5.84031, 0, -0.5, 0.5, 0.5,
-4.113019, 2, -5.84031, 1, -0.5, 0.5, 0.5,
-4.113019, 2, -5.84031, 1, 1.5, 0.5, 0.5,
-4.113019, 2, -5.84031, 0, 1.5, 0.5, 0.5
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
-3.578555, -3.1169, -4,
-3.578555, -3.1169, 4,
-3.578555, -3.1169, -4,
-3.75671, -3.267157, -4,
-3.578555, -3.1169, -2,
-3.75671, -3.267157, -2,
-3.578555, -3.1169, 0,
-3.75671, -3.267157, 0,
-3.578555, -3.1169, 2,
-3.75671, -3.267157, 2,
-3.578555, -3.1169, 4,
-3.75671, -3.267157, 4
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
-4.113019, -3.567672, -4, 0, -0.5, 0.5, 0.5,
-4.113019, -3.567672, -4, 1, -0.5, 0.5, 0.5,
-4.113019, -3.567672, -4, 1, 1.5, 0.5, 0.5,
-4.113019, -3.567672, -4, 0, 1.5, 0.5, 0.5,
-4.113019, -3.567672, -2, 0, -0.5, 0.5, 0.5,
-4.113019, -3.567672, -2, 1, -0.5, 0.5, 0.5,
-4.113019, -3.567672, -2, 1, 1.5, 0.5, 0.5,
-4.113019, -3.567672, -2, 0, 1.5, 0.5, 0.5,
-4.113019, -3.567672, 0, 0, -0.5, 0.5, 0.5,
-4.113019, -3.567672, 0, 1, -0.5, 0.5, 0.5,
-4.113019, -3.567672, 0, 1, 1.5, 0.5, 0.5,
-4.113019, -3.567672, 0, 0, 1.5, 0.5, 0.5,
-4.113019, -3.567672, 2, 0, -0.5, 0.5, 0.5,
-4.113019, -3.567672, 2, 1, -0.5, 0.5, 0.5,
-4.113019, -3.567672, 2, 1, 1.5, 0.5, 0.5,
-4.113019, -3.567672, 2, 0, 1.5, 0.5, 0.5,
-4.113019, -3.567672, 4, 0, -0.5, 0.5, 0.5,
-4.113019, -3.567672, 4, 1, -0.5, 0.5, 0.5,
-4.113019, -3.567672, 4, 1, 1.5, 0.5, 0.5,
-4.113019, -3.567672, 4, 0, 1.5, 0.5, 0.5
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
-3.578555, -3.1169, -5.051304,
-3.578555, 2.893405, -5.051304,
-3.578555, -3.1169, 5.468765,
-3.578555, 2.893405, 5.468765,
-3.578555, -3.1169, -5.051304,
-3.578555, -3.1169, 5.468765,
-3.578555, 2.893405, -5.051304,
-3.578555, 2.893405, 5.468765,
-3.578555, -3.1169, -5.051304,
3.547628, -3.1169, -5.051304,
-3.578555, -3.1169, 5.468765,
3.547628, -3.1169, 5.468765,
-3.578555, 2.893405, -5.051304,
3.547628, 2.893405, -5.051304,
-3.578555, 2.893405, 5.468765,
3.547628, 2.893405, 5.468765,
3.547628, -3.1169, -5.051304,
3.547628, 2.893405, -5.051304,
3.547628, -3.1169, 5.468765,
3.547628, 2.893405, 5.468765,
3.547628, -3.1169, -5.051304,
3.547628, -3.1169, 5.468765,
3.547628, 2.893405, -5.051304,
3.547628, 2.893405, 5.468765
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
var radius = 7.505763;
var distance = 33.39399;
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
mvMatrix.translate( 0.01546347, 0.1117473, -0.2087302 );
mvMatrix.scale( 1.138811, 1.350244, 0.7714188 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.39399);
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
Dimilin<-read.table("Dimilin.xyz")
```

```
## Error in read.table("Dimilin.xyz"): no lines available in input
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
-3.474776, -1.021546, -1.589763, 0, 0, 1, 1, 1,
-3.452471, 1.054518, -1.282476, 1, 0, 0, 1, 1,
-2.990368, -0.6972032, -2.290721, 1, 0, 0, 1, 1,
-2.86119, 0.6439134, -2.280524, 1, 0, 0, 1, 1,
-2.811034, -0.9903637, -3.119672, 1, 0, 0, 1, 1,
-2.675029, 0.1411353, -1.529642, 1, 0, 0, 1, 1,
-2.522907, 0.6019107, -0.8580233, 0, 0, 0, 1, 1,
-2.391984, -0.4169821, -3.082773, 0, 0, 0, 1, 1,
-2.35649, -0.0699341, -0.4122895, 0, 0, 0, 1, 1,
-2.305064, -0.9386084, -2.050043, 0, 0, 0, 1, 1,
-2.271232, -0.5859214, -1.757919, 0, 0, 0, 1, 1,
-2.217415, 0.4195217, -1.300449, 0, 0, 0, 1, 1,
-2.094397, 1.012058, -0.01095642, 0, 0, 0, 1, 1,
-2.079505, 1.501001, -0.2290142, 1, 1, 1, 1, 1,
-2.056843, -1.662219, -2.437768, 1, 1, 1, 1, 1,
-2.047107, 1.321884, 0.2836666, 1, 1, 1, 1, 1,
-2.029512, 0.4192306, -1.004596, 1, 1, 1, 1, 1,
-2.018352, 2.805876, -1.033072, 1, 1, 1, 1, 1,
-1.982557, -0.1725538, -0.8404651, 1, 1, 1, 1, 1,
-1.977673, 1.015112, -0.261963, 1, 1, 1, 1, 1,
-1.974765, 1.82976, -2.32721, 1, 1, 1, 1, 1,
-1.972019, -1.349175, -2.166052, 1, 1, 1, 1, 1,
-1.969562, -0.2097465, -1.553001, 1, 1, 1, 1, 1,
-1.968235, -0.6496518, -0.9530426, 1, 1, 1, 1, 1,
-1.931676, -0.2758928, 0.1703613, 1, 1, 1, 1, 1,
-1.921753, -2.146342, -2.732216, 1, 1, 1, 1, 1,
-1.908112, -1.441162, -0.3548047, 1, 1, 1, 1, 1,
-1.902974, -0.8029965, -3.241398, 1, 1, 1, 1, 1,
-1.881767, 0.4339135, -0.6734754, 0, 0, 1, 1, 1,
-1.879356, -0.319202, -1.868025, 1, 0, 0, 1, 1,
-1.877316, -0.7318302, -3.503736, 1, 0, 0, 1, 1,
-1.846829, -0.9353684, -2.023637, 1, 0, 0, 1, 1,
-1.842862, -3.007425, -2.730586, 1, 0, 0, 1, 1,
-1.839792, 0.6675978, -0.05763609, 1, 0, 0, 1, 1,
-1.835527, 0.1095326, -0.4428258, 0, 0, 0, 1, 1,
-1.822085, -0.4196313, -2.420236, 0, 0, 0, 1, 1,
-1.819163, 0.4983487, -0.02385705, 0, 0, 0, 1, 1,
-1.764672, 0.4353116, -1.453316, 0, 0, 0, 1, 1,
-1.763423, 0.4208771, -1.169092, 0, 0, 0, 1, 1,
-1.762279, -1.364704, -1.426382, 0, 0, 0, 1, 1,
-1.759131, -1.52451, -3.204317, 0, 0, 0, 1, 1,
-1.741852, 0.4761281, -0.1336851, 1, 1, 1, 1, 1,
-1.713943, 2.438291, -0.07742925, 1, 1, 1, 1, 1,
-1.708252, 0.6941525, -3.222256, 1, 1, 1, 1, 1,
-1.699713, -1.791795, -2.63172, 1, 1, 1, 1, 1,
-1.698391, -0.2917574, -1.347654, 1, 1, 1, 1, 1,
-1.691154, 0.9384679, -0.9456299, 1, 1, 1, 1, 1,
-1.681168, -0.9862618, -2.751335, 1, 1, 1, 1, 1,
-1.679083, 0.9660972, -0.9911871, 1, 1, 1, 1, 1,
-1.674495, -1.616968, -3.210814, 1, 1, 1, 1, 1,
-1.673728, -2.035125, -3.495694, 1, 1, 1, 1, 1,
-1.672644, 0.4736345, -0.8295636, 1, 1, 1, 1, 1,
-1.660151, 2.43159, 0.8215113, 1, 1, 1, 1, 1,
-1.653717, 0.2545007, -1.998528, 1, 1, 1, 1, 1,
-1.647177, 1.268064, -1.616746, 1, 1, 1, 1, 1,
-1.643174, -0.7589149, -0.7537539, 1, 1, 1, 1, 1,
-1.635975, -0.8402285, -2.655548, 0, 0, 1, 1, 1,
-1.625699, 0.05350298, -0.5050018, 1, 0, 0, 1, 1,
-1.622969, 0.6410194, -1.010152, 1, 0, 0, 1, 1,
-1.59274, -0.4869995, -2.944965, 1, 0, 0, 1, 1,
-1.586375, 1.661942, 1.430107, 1, 0, 0, 1, 1,
-1.582224, -0.6462081, -1.567814, 1, 0, 0, 1, 1,
-1.57741, 1.153524, -0.5181414, 0, 0, 0, 1, 1,
-1.56587, -0.5294214, -0.6461754, 0, 0, 0, 1, 1,
-1.559996, -0.1633349, -1.764273, 0, 0, 0, 1, 1,
-1.552842, -1.415057, -1.273551, 0, 0, 0, 1, 1,
-1.55259, -0.03640357, -0.6186401, 0, 0, 0, 1, 1,
-1.551759, -1.467589, -2.696713, 0, 0, 0, 1, 1,
-1.53742, -0.9766555, -1.218427, 0, 0, 0, 1, 1,
-1.536571, 1.471358, -1.240548, 1, 1, 1, 1, 1,
-1.524356, 1.561862, -0.8832354, 1, 1, 1, 1, 1,
-1.514863, -0.3305828, -1.125351, 1, 1, 1, 1, 1,
-1.507763, -0.1485167, -2.267312, 1, 1, 1, 1, 1,
-1.495443, 0.02564431, -3.698676, 1, 1, 1, 1, 1,
-1.488361, -0.3610353, -3.197725, 1, 1, 1, 1, 1,
-1.472004, -0.3666134, -0.2750451, 1, 1, 1, 1, 1,
-1.458171, -1.701311, -1.857663, 1, 1, 1, 1, 1,
-1.445199, -0.9233445, -0.5786355, 1, 1, 1, 1, 1,
-1.438945, -1.497447, -2.328588, 1, 1, 1, 1, 1,
-1.436855, 0.1582679, -0.8576698, 1, 1, 1, 1, 1,
-1.436243, -1.568478, -2.605625, 1, 1, 1, 1, 1,
-1.434143, 1.107126, -3.013819, 1, 1, 1, 1, 1,
-1.424896, -0.8798329, -2.748035, 1, 1, 1, 1, 1,
-1.404976, 1.874806, 1.061864, 1, 1, 1, 1, 1,
-1.38994, 0.8823169, -1.608426, 0, 0, 1, 1, 1,
-1.378226, 0.1480088, -0.2956793, 1, 0, 0, 1, 1,
-1.374901, 1.736192, -1.429976, 1, 0, 0, 1, 1,
-1.362706, 1.102784, -0.2181363, 1, 0, 0, 1, 1,
-1.359989, -0.7984718, -2.923842, 1, 0, 0, 1, 1,
-1.358543, -0.2243589, -1.867217, 1, 0, 0, 1, 1,
-1.352001, 0.6298724, 0.2390935, 0, 0, 0, 1, 1,
-1.350016, -0.5930831, -2.742087, 0, 0, 0, 1, 1,
-1.347135, 0.2091701, -1.221919, 0, 0, 0, 1, 1,
-1.345139, 0.5563247, -1.0739, 0, 0, 0, 1, 1,
-1.334956, -0.6705611, -1.839036, 0, 0, 0, 1, 1,
-1.33229, -0.1892595, -1.721122, 0, 0, 0, 1, 1,
-1.329393, 0.108462, -2.383403, 0, 0, 0, 1, 1,
-1.328252, 1.417623, -0.9359707, 1, 1, 1, 1, 1,
-1.327404, 0.7394596, 0.5023186, 1, 1, 1, 1, 1,
-1.319396, 0.3128012, -1.34457, 1, 1, 1, 1, 1,
-1.318867, 0.474136, -0.5441099, 1, 1, 1, 1, 1,
-1.318191, 0.4877004, -3.325502, 1, 1, 1, 1, 1,
-1.312095, -0.06015888, -2.142772, 1, 1, 1, 1, 1,
-1.308585, -1.762511, -2.267377, 1, 1, 1, 1, 1,
-1.304448, 0.9434834, -1.454248, 1, 1, 1, 1, 1,
-1.296464, 1.144648, -1.547077, 1, 1, 1, 1, 1,
-1.280487, -1.233196, -3.574247, 1, 1, 1, 1, 1,
-1.266014, -1.064164, -2.247203, 1, 1, 1, 1, 1,
-1.266004, -0.3957131, -2.071864, 1, 1, 1, 1, 1,
-1.265511, 0.008365655, -2.977802, 1, 1, 1, 1, 1,
-1.264464, -2.374231, -0.9414966, 1, 1, 1, 1, 1,
-1.264269, 0.221958, 0.03886754, 1, 1, 1, 1, 1,
-1.25809, -0.4941998, -1.557889, 0, 0, 1, 1, 1,
-1.256306, 0.9510959, 0.02648818, 1, 0, 0, 1, 1,
-1.243079, -1.102494, -0.8368683, 1, 0, 0, 1, 1,
-1.235711, -0.2264898, -2.435917, 1, 0, 0, 1, 1,
-1.234707, -0.4428259, -3.267722, 1, 0, 0, 1, 1,
-1.225716, -0.03197928, -1.791881, 1, 0, 0, 1, 1,
-1.223581, 0.9230862, -0.3468404, 0, 0, 0, 1, 1,
-1.223282, -0.07418516, -0.7649294, 0, 0, 0, 1, 1,
-1.205245, 0.009514664, -2.165813, 0, 0, 0, 1, 1,
-1.201792, -0.7170027, -3.657475, 0, 0, 0, 1, 1,
-1.191487, -0.6996216, -2.125156, 0, 0, 0, 1, 1,
-1.191303, -0.2766662, -2.835079, 0, 0, 0, 1, 1,
-1.182319, -0.3739944, -2.558319, 0, 0, 0, 1, 1,
-1.161247, 1.039368, -1.173687, 1, 1, 1, 1, 1,
-1.161224, 0.1999282, -1.754532, 1, 1, 1, 1, 1,
-1.150759, -0.2456273, -2.796326, 1, 1, 1, 1, 1,
-1.147141, 0.8281065, 0.5982287, 1, 1, 1, 1, 1,
-1.137741, -0.1430927, -0.8338454, 1, 1, 1, 1, 1,
-1.129025, 0.02579137, -1.752142, 1, 1, 1, 1, 1,
-1.125312, -1.565635, -1.144549, 1, 1, 1, 1, 1,
-1.121345, 0.7425834, -0.08666492, 1, 1, 1, 1, 1,
-1.119886, -1.159318, -2.636217, 1, 1, 1, 1, 1,
-1.118008, -1.023327, -1.214599, 1, 1, 1, 1, 1,
-1.109392, -0.7538524, -3.873383, 1, 1, 1, 1, 1,
-1.107531, -0.07823735, -2.23188, 1, 1, 1, 1, 1,
-1.106997, -0.4679307, -0.6400507, 1, 1, 1, 1, 1,
-1.106533, -1.65319, -2.844834, 1, 1, 1, 1, 1,
-1.104834, 0.4832979, -3.218916, 1, 1, 1, 1, 1,
-1.097244, 0.6145266, -1.510658, 0, 0, 1, 1, 1,
-1.070454, -1.579207, -1.576297, 1, 0, 0, 1, 1,
-1.069273, 1.059305, -1.146046, 1, 0, 0, 1, 1,
-1.068622, 0.5752625, -1.012263, 1, 0, 0, 1, 1,
-1.065254, -0.1025331, -2.511821, 1, 0, 0, 1, 1,
-1.053881, -0.1187653, -3.27969, 1, 0, 0, 1, 1,
-1.053448, -1.496437, -1.986022, 0, 0, 0, 1, 1,
-1.052373, 1.879518, 0.9442164, 0, 0, 0, 1, 1,
-1.051131, 1.684546, 1.450758, 0, 0, 0, 1, 1,
-1.036392, -0.7657675, -1.650862, 0, 0, 0, 1, 1,
-1.026663, 0.4102939, -0.9314872, 0, 0, 0, 1, 1,
-1.025361, 0.666507, -0.7932965, 0, 0, 0, 1, 1,
-1.009495, -0.5769525, 0.1957028, 0, 0, 0, 1, 1,
-1.008648, 0.2219036, 0.3284356, 1, 1, 1, 1, 1,
-1.008374, 0.8280489, -0.1317583, 1, 1, 1, 1, 1,
-1.007625, 0.3646227, 0.1774278, 1, 1, 1, 1, 1,
-0.9982632, 1.089646, 0.145695, 1, 1, 1, 1, 1,
-0.9812945, 1.056273, -0.9031875, 1, 1, 1, 1, 1,
-0.9725646, -1.573518, -2.0989, 1, 1, 1, 1, 1,
-0.9663494, -0.3015707, -1.694934, 1, 1, 1, 1, 1,
-0.964357, 1.100174, -1.13794, 1, 1, 1, 1, 1,
-0.9602518, 1.480742, 0.5986565, 1, 1, 1, 1, 1,
-0.9548709, 0.664945, -3.296459, 1, 1, 1, 1, 1,
-0.9522011, 1.260757, 0.09373606, 1, 1, 1, 1, 1,
-0.9413972, 0.4596163, -0.632816, 1, 1, 1, 1, 1,
-0.9413056, -1.02288, -2.713181, 1, 1, 1, 1, 1,
-0.9392084, -0.5402302, -2.120382, 1, 1, 1, 1, 1,
-0.9275737, 0.1467162, -2.571526, 1, 1, 1, 1, 1,
-0.9214914, -0.3789432, -2.515337, 0, 0, 1, 1, 1,
-0.9133371, -0.5831832, -1.929647, 1, 0, 0, 1, 1,
-0.9117063, -0.6045771, -3.703224, 1, 0, 0, 1, 1,
-0.9024842, 1.039124, 0.02369907, 1, 0, 0, 1, 1,
-0.900456, -2.942945, -2.179975, 1, 0, 0, 1, 1,
-0.8979093, 0.0282139, -2.495095, 1, 0, 0, 1, 1,
-0.8956094, 0.2697122, -0.9949183, 0, 0, 0, 1, 1,
-0.8890124, -0.7671775, -1.925925, 0, 0, 0, 1, 1,
-0.8843907, -1.858972, -4.088802, 0, 0, 0, 1, 1,
-0.8835472, 1.998039, 0.1797242, 0, 0, 0, 1, 1,
-0.8811417, 1.393354, -0.1786521, 0, 0, 0, 1, 1,
-0.8809652, -0.1859897, -1.868258, 0, 0, 0, 1, 1,
-0.8709736, 0.2562259, -0.1295511, 0, 0, 0, 1, 1,
-0.8703275, 0.09158617, -1.878168, 1, 1, 1, 1, 1,
-0.8619692, 0.6344792, -1.473124, 1, 1, 1, 1, 1,
-0.8521647, -0.7420797, -2.834754, 1, 1, 1, 1, 1,
-0.8503423, 2.462969, 0.2746521, 1, 1, 1, 1, 1,
-0.8469247, 0.7770102, -0.8139746, 1, 1, 1, 1, 1,
-0.8430515, 0.2240499, -0.2871906, 1, 1, 1, 1, 1,
-0.8349783, -0.5961833, -2.928852, 1, 1, 1, 1, 1,
-0.8342901, 1.349971, -0.8641775, 1, 1, 1, 1, 1,
-0.8334507, 0.1345422, -0.08313651, 1, 1, 1, 1, 1,
-0.8313324, 1.273283, -0.748924, 1, 1, 1, 1, 1,
-0.8301455, 0.05550819, -1.14693, 1, 1, 1, 1, 1,
-0.8244393, 1.129324, -1.779966, 1, 1, 1, 1, 1,
-0.8193783, -0.3269966, -4.095162, 1, 1, 1, 1, 1,
-0.8125968, -1.896198, -4.623669, 1, 1, 1, 1, 1,
-0.809221, 0.2158382, -0.9334918, 1, 1, 1, 1, 1,
-0.8076603, -0.7211127, -2.618944, 0, 0, 1, 1, 1,
-0.806213, 0.026962, -1.998145, 1, 0, 0, 1, 1,
-0.7972152, -0.4044728, -2.134718, 1, 0, 0, 1, 1,
-0.7952691, -1.290039, -2.976377, 1, 0, 0, 1, 1,
-0.781179, 0.1376155, -0.04709002, 1, 0, 0, 1, 1,
-0.7798165, -1.752921, -2.494824, 1, 0, 0, 1, 1,
-0.7786385, 1.069181, 1.175905, 0, 0, 0, 1, 1,
-0.7774162, 1.106974, -2.101443, 0, 0, 0, 1, 1,
-0.7720457, 0.8909966, 0.979882, 0, 0, 0, 1, 1,
-0.7713946, 0.07293288, -1.41268, 0, 0, 0, 1, 1,
-0.7650186, 2.015688, -1.684743, 0, 0, 0, 1, 1,
-0.7646678, 2.736371, 0.8990498, 0, 0, 0, 1, 1,
-0.7634128, -0.9683116, -2.195403, 0, 0, 0, 1, 1,
-0.7614908, 1.846927, 0.01369985, 1, 1, 1, 1, 1,
-0.7613108, -1.736278, -2.122414, 1, 1, 1, 1, 1,
-0.7603303, -1.321267, -2.796852, 1, 1, 1, 1, 1,
-0.7561791, 0.6983482, 0.5301876, 1, 1, 1, 1, 1,
-0.7514131, -0.1971255, -1.596968, 1, 1, 1, 1, 1,
-0.7475467, 0.4538161, -1.474282, 1, 1, 1, 1, 1,
-0.7421085, 0.7763336, -2.460478, 1, 1, 1, 1, 1,
-0.7357295, 0.5929394, 1.006283, 1, 1, 1, 1, 1,
-0.735049, 1.145668, -0.3436306, 1, 1, 1, 1, 1,
-0.7341332, 1.332452, -0.8139384, 1, 1, 1, 1, 1,
-0.7337434, -0.801256, -1.104315, 1, 1, 1, 1, 1,
-0.7334788, 0.01389126, -0.2292238, 1, 1, 1, 1, 1,
-0.7280564, -0.5087106, -0.9455486, 1, 1, 1, 1, 1,
-0.7268746, -0.1755274, -0.9786587, 1, 1, 1, 1, 1,
-0.7248024, -1.47983, -2.80835, 1, 1, 1, 1, 1,
-0.7121497, -0.4511017, -1.410785, 0, 0, 1, 1, 1,
-0.7121126, 1.088197, -0.9414278, 1, 0, 0, 1, 1,
-0.7118077, -0.3491845, -3.999943, 1, 0, 0, 1, 1,
-0.7113442, -0.8970723, -1.31151, 1, 0, 0, 1, 1,
-0.710979, 1.966715, -0.1410914, 1, 0, 0, 1, 1,
-0.7091454, -0.0002899254, -2.290668, 1, 0, 0, 1, 1,
-0.7023566, 0.4519578, -2.078975, 0, 0, 0, 1, 1,
-0.6992797, 0.7793809, -0.7952596, 0, 0, 0, 1, 1,
-0.6896693, 0.1390021, -0.2800669, 0, 0, 0, 1, 1,
-0.6859945, -0.6035922, -0.7297267, 0, 0, 0, 1, 1,
-0.6821598, -0.03179553, -2.082822, 0, 0, 0, 1, 1,
-0.6782514, 0.9917058, -0.5896417, 0, 0, 0, 1, 1,
-0.6725904, -0.4002727, -2.127264, 0, 0, 0, 1, 1,
-0.6716438, 0.685336, -1.232398, 1, 1, 1, 1, 1,
-0.670886, 1.250596, -2.203267, 1, 1, 1, 1, 1,
-0.6698218, 1.039034, -0.4394383, 1, 1, 1, 1, 1,
-0.6674268, -1.489358, -0.4672986, 1, 1, 1, 1, 1,
-0.665013, -0.3765985, -0.1961734, 1, 1, 1, 1, 1,
-0.660183, 1.14391, -0.6206101, 1, 1, 1, 1, 1,
-0.656774, 0.5217974, -0.2702962, 1, 1, 1, 1, 1,
-0.6498455, -0.03391124, -1.708143, 1, 1, 1, 1, 1,
-0.647773, -0.3357224, -1.792372, 1, 1, 1, 1, 1,
-0.6473842, 0.6782531, -2.30198, 1, 1, 1, 1, 1,
-0.6448991, 0.6518388, -1.523159, 1, 1, 1, 1, 1,
-0.6415789, -0.0488785, -2.967312, 1, 1, 1, 1, 1,
-0.6404585, 1.126916, -0.3457268, 1, 1, 1, 1, 1,
-0.637695, -1.902293, -3.783229, 1, 1, 1, 1, 1,
-0.6364707, 0.9015522, -0.008882389, 1, 1, 1, 1, 1,
-0.6304656, 1.076363, -1.992409, 0, 0, 1, 1, 1,
-0.6264938, 0.1916416, -1.732095, 1, 0, 0, 1, 1,
-0.6261017, 0.8507007, -3.158396, 1, 0, 0, 1, 1,
-0.6213305, 1.309976, -1.123219, 1, 0, 0, 1, 1,
-0.6148183, -0.1321864, -1.709576, 1, 0, 0, 1, 1,
-0.6099888, 0.2294681, -0.8134645, 1, 0, 0, 1, 1,
-0.6062679, -0.6647704, -2.867857, 0, 0, 0, 1, 1,
-0.6060819, -0.3876601, -0.9412503, 0, 0, 0, 1, 1,
-0.5927671, -2.253164, -3.165893, 0, 0, 0, 1, 1,
-0.5898758, -0.3555592, -2.66555, 0, 0, 0, 1, 1,
-0.5840809, 1.461159, 0.8283406, 0, 0, 0, 1, 1,
-0.5830151, -0.3811248, -1.923255, 0, 0, 0, 1, 1,
-0.5827298, 0.5204965, -0.7868287, 0, 0, 0, 1, 1,
-0.5819099, 0.8161606, -1.564867, 1, 1, 1, 1, 1,
-0.5810059, -0.03354565, -0.4391586, 1, 1, 1, 1, 1,
-0.5784076, 0.5602474, 0.7262887, 1, 1, 1, 1, 1,
-0.5783281, 0.1707411, -1.024171, 1, 1, 1, 1, 1,
-0.5711763, 1.790976, -1.644438, 1, 1, 1, 1, 1,
-0.5698144, 0.2362285, -2.554471, 1, 1, 1, 1, 1,
-0.568417, 0.7147692, -1.445282, 1, 1, 1, 1, 1,
-0.5664523, 0.7848406, -1.539272, 1, 1, 1, 1, 1,
-0.5656992, -0.06279472, -0.9798136, 1, 1, 1, 1, 1,
-0.5633472, 1.454094, -0.4098021, 1, 1, 1, 1, 1,
-0.5631487, 0.2813143, -1.330931, 1, 1, 1, 1, 1,
-0.5506825, -0.0172839, -0.6893808, 1, 1, 1, 1, 1,
-0.550001, 1.879923, 0.6159694, 1, 1, 1, 1, 1,
-0.539601, 0.4084115, 0.04391209, 1, 1, 1, 1, 1,
-0.5391721, 0.8957971, -0.8600314, 1, 1, 1, 1, 1,
-0.5345836, -1.120263, -2.54646, 0, 0, 1, 1, 1,
-0.531363, 0.7055272, -0.3572266, 1, 0, 0, 1, 1,
-0.5308392, 0.3332009, -1.270999, 1, 0, 0, 1, 1,
-0.5290027, 0.4986759, -0.05107013, 1, 0, 0, 1, 1,
-0.5284264, 1.12197, -0.1303354, 1, 0, 0, 1, 1,
-0.5251239, -0.3778299, -2.32141, 1, 0, 0, 1, 1,
-0.5193381, 0.9274931, -0.5022321, 0, 0, 0, 1, 1,
-0.5176554, -1.696194, -3.551927, 0, 0, 0, 1, 1,
-0.5168551, -1.046357, -4.236069, 0, 0, 0, 1, 1,
-0.5143024, 0.8877965, 1.004241, 0, 0, 0, 1, 1,
-0.5134648, -0.9099625, -3.501596, 0, 0, 0, 1, 1,
-0.5064139, -1.533252, -3.49218, 0, 0, 0, 1, 1,
-0.5061578, -0.1458573, -2.188476, 0, 0, 0, 1, 1,
-0.5044166, -0.2013239, -3.251965, 1, 1, 1, 1, 1,
-0.5026546, -1.165009, -0.8042678, 1, 1, 1, 1, 1,
-0.5008115, 0.159848, -1.348787, 1, 1, 1, 1, 1,
-0.4982991, -0.5986933, -2.844878, 1, 1, 1, 1, 1,
-0.4975358, -0.8487123, -2.507566, 1, 1, 1, 1, 1,
-0.494882, 0.06517383, -1.402333, 1, 1, 1, 1, 1,
-0.4923542, 1.10206, 0.4114735, 1, 1, 1, 1, 1,
-0.4907186, 0.3716064, -0.5065613, 1, 1, 1, 1, 1,
-0.489597, -0.2032432, -2.599182, 1, 1, 1, 1, 1,
-0.4846822, -0.01184157, -2.283318, 1, 1, 1, 1, 1,
-0.4785563, 0.6025893, -0.02340976, 1, 1, 1, 1, 1,
-0.4741875, -0.8497507, -2.533558, 1, 1, 1, 1, 1,
-0.4698553, -0.5133485, -3.136134, 1, 1, 1, 1, 1,
-0.4663015, 0.9682569, -1.227613, 1, 1, 1, 1, 1,
-0.4653803, -0.1946631, -0.5974821, 1, 1, 1, 1, 1,
-0.4626714, 1.362602, 0.483252, 0, 0, 1, 1, 1,
-0.4620247, -0.3458579, -3.225288, 1, 0, 0, 1, 1,
-0.4584807, -0.3544788, -2.588631, 1, 0, 0, 1, 1,
-0.4568896, -0.4282406, -1.096731, 1, 0, 0, 1, 1,
-0.4544914, -1.405928, -1.502581, 1, 0, 0, 1, 1,
-0.4536144, -0.4283039, -2.250183, 1, 0, 0, 1, 1,
-0.4521859, -1.726791, -2.900972, 0, 0, 0, 1, 1,
-0.4487635, 0.9901735, 1.193658, 0, 0, 0, 1, 1,
-0.44781, 0.355701, -2.229662, 0, 0, 0, 1, 1,
-0.4471623, 0.04282914, 0.2131448, 0, 0, 0, 1, 1,
-0.4371023, -0.06800539, -2.068291, 0, 0, 0, 1, 1,
-0.4349748, 0.0835652, -3.217374, 0, 0, 0, 1, 1,
-0.4341381, -1.484431, -2.852432, 0, 0, 0, 1, 1,
-0.433067, 0.1075472, 0.6774901, 1, 1, 1, 1, 1,
-0.4324032, 0.4330662, -1.015503, 1, 1, 1, 1, 1,
-0.4307154, 1.03266, -0.6351159, 1, 1, 1, 1, 1,
-0.4275548, 1.506154, -0.0881236, 1, 1, 1, 1, 1,
-0.4250209, 0.2687591, -0.3188969, 1, 1, 1, 1, 1,
-0.4245973, 0.6833106, 0.4778135, 1, 1, 1, 1, 1,
-0.4243904, 0.620437, 0.8980404, 1, 1, 1, 1, 1,
-0.4226384, 0.3523578, -0.4790456, 1, 1, 1, 1, 1,
-0.4190822, 0.2641929, -2.639489, 1, 1, 1, 1, 1,
-0.4172813, -0.2126458, -2.75964, 1, 1, 1, 1, 1,
-0.4172582, 0.7728478, 0.03818446, 1, 1, 1, 1, 1,
-0.4159566, 0.3875316, -1.22781, 1, 1, 1, 1, 1,
-0.414742, 0.7242332, 0.01699479, 1, 1, 1, 1, 1,
-0.4111548, 0.8202658, 0.07272056, 1, 1, 1, 1, 1,
-0.4088635, 0.1813678, -1.794726, 1, 1, 1, 1, 1,
-0.4065442, -0.5514987, -2.704742, 0, 0, 1, 1, 1,
-0.4006308, -2.330876, -2.320017, 1, 0, 0, 1, 1,
-0.3964971, -0.3648252, -2.703087, 1, 0, 0, 1, 1,
-0.3943235, 0.1995991, -1.531222, 1, 0, 0, 1, 1,
-0.3903715, -0.474043, -1.65489, 1, 0, 0, 1, 1,
-0.3835339, 2.012647, 0.3807581, 1, 0, 0, 1, 1,
-0.3763708, -0.2190406, -0.9077649, 0, 0, 0, 1, 1,
-0.3726006, -0.6756126, -1.706948, 0, 0, 0, 1, 1,
-0.3695407, 0.1868472, -2.729939, 0, 0, 0, 1, 1,
-0.3681067, -0.6838702, -3.642064, 0, 0, 0, 1, 1,
-0.3666078, -0.7784582, -1.347363, 0, 0, 0, 1, 1,
-0.3596372, -0.1502499, -1.971327, 0, 0, 0, 1, 1,
-0.3586252, 1.700875, 0.345056, 0, 0, 0, 1, 1,
-0.3478637, -1.228396, -0.4784804, 1, 1, 1, 1, 1,
-0.3471776, -0.5371563, -2.297689, 1, 1, 1, 1, 1,
-0.342744, 1.131929, -0.6439027, 1, 1, 1, 1, 1,
-0.3421277, 1.407079, 0.4989945, 1, 1, 1, 1, 1,
-0.34025, -0.5857576, -2.022727, 1, 1, 1, 1, 1,
-0.3357505, 0.1537088, -1.826197, 1, 1, 1, 1, 1,
-0.3284688, 0.3742622, -0.3850845, 1, 1, 1, 1, 1,
-0.3273713, -0.1980403, -2.719377, 1, 1, 1, 1, 1,
-0.3271141, 1.765157, -1.286563, 1, 1, 1, 1, 1,
-0.3250362, 0.2145997, -2.314671, 1, 1, 1, 1, 1,
-0.3232418, -0.5062528, -3.650605, 1, 1, 1, 1, 1,
-0.3229376, -1.631636, -3.868599, 1, 1, 1, 1, 1,
-0.3229221, 0.2893938, -1.759188, 1, 1, 1, 1, 1,
-0.3178196, 0.5957967, 1.508703, 1, 1, 1, 1, 1,
-0.3111049, -0.5672072, -4.225861, 1, 1, 1, 1, 1,
-0.3086731, -1.995016, -3.475981, 0, 0, 1, 1, 1,
-0.302766, 0.6312683, -0.9771631, 1, 0, 0, 1, 1,
-0.2995066, 0.1780095, -1.168892, 1, 0, 0, 1, 1,
-0.2970841, -0.2463558, -1.154258, 1, 0, 0, 1, 1,
-0.2962382, -0.8094586, -3.865666, 1, 0, 0, 1, 1,
-0.2941698, 1.058485, -0.6938433, 1, 0, 0, 1, 1,
-0.2919924, -1.322652, -3.869564, 0, 0, 0, 1, 1,
-0.2918708, -1.252882, -2.502186, 0, 0, 0, 1, 1,
-0.2861864, -0.08113965, -2.300582, 0, 0, 0, 1, 1,
-0.2855341, 1.504409, -2.125941, 0, 0, 0, 1, 1,
-0.2842266, -0.1830323, -2.220912, 0, 0, 0, 1, 1,
-0.2823077, -0.7611919, -3.573649, 0, 0, 0, 1, 1,
-0.2719316, 0.5579364, -0.2395814, 0, 0, 0, 1, 1,
-0.2711957, 0.3575618, -0.4593952, 1, 1, 1, 1, 1,
-0.2709227, 1.997202, 1.002651, 1, 1, 1, 1, 1,
-0.2668827, 2.425702, 0.4758279, 1, 1, 1, 1, 1,
-0.2657022, -0.1853303, -0.5650043, 1, 1, 1, 1, 1,
-0.2584567, -0.8899467, -3.011941, 1, 1, 1, 1, 1,
-0.2546419, 0.8615656, -1.424741, 1, 1, 1, 1, 1,
-0.2532343, 2.226211, 0.1592993, 1, 1, 1, 1, 1,
-0.2499176, 2.155872, -0.6595613, 1, 1, 1, 1, 1,
-0.2470295, 1.028272, -0.166697, 1, 1, 1, 1, 1,
-0.2457796, 0.5698454, -1.323467, 1, 1, 1, 1, 1,
-0.2448569, -0.2993102, -2.347557, 1, 1, 1, 1, 1,
-0.2437621, -0.9248347, -2.335791, 1, 1, 1, 1, 1,
-0.2385821, 0.7887709, 1.277833, 1, 1, 1, 1, 1,
-0.233564, -3.029371, -4.503588, 1, 1, 1, 1, 1,
-0.2313577, -0.157949, -1.128651, 1, 1, 1, 1, 1,
-0.2305259, 0.1464051, -0.2099715, 0, 0, 1, 1, 1,
-0.2300424, -0.332857, -2.324627, 1, 0, 0, 1, 1,
-0.2181808, -0.2948812, -0.8578908, 1, 0, 0, 1, 1,
-0.2177638, 0.9330396, -1.34888, 1, 0, 0, 1, 1,
-0.2175023, 0.8839446, 0.07998911, 1, 0, 0, 1, 1,
-0.2149, -0.5556155, -4.734199, 1, 0, 0, 1, 1,
-0.2099806, 1.578963, 0.2335669, 0, 0, 0, 1, 1,
-0.2093238, 0.3214649, -0.7654327, 0, 0, 0, 1, 1,
-0.2052514, 1.759131, -1.035921, 0, 0, 0, 1, 1,
-0.2027861, 0.8470971, -0.7152836, 0, 0, 0, 1, 1,
-0.200787, 0.2560653, -0.7947942, 0, 0, 0, 1, 1,
-0.2007835, 1.062804, 0.2499991, 0, 0, 0, 1, 1,
-0.2003431, 1.040781, 0.2218488, 0, 0, 0, 1, 1,
-0.199945, 0.09760764, -1.116215, 1, 1, 1, 1, 1,
-0.1995765, 1.111974, -0.4131775, 1, 1, 1, 1, 1,
-0.1955637, -1.670089, -1.686961, 1, 1, 1, 1, 1,
-0.1942609, -0.3077842, -2.43825, 1, 1, 1, 1, 1,
-0.1931505, -0.1976279, -2.872788, 1, 1, 1, 1, 1,
-0.1926123, -0.09521884, -1.488603, 1, 1, 1, 1, 1,
-0.1922574, 0.5935072, -0.4477802, 1, 1, 1, 1, 1,
-0.185529, -0.5839478, -2.193684, 1, 1, 1, 1, 1,
-0.1843205, 1.199887, -0.5189201, 1, 1, 1, 1, 1,
-0.1829758, -1.668824, -3.695928, 1, 1, 1, 1, 1,
-0.1813651, 1.512762, 0.4567516, 1, 1, 1, 1, 1,
-0.1796185, -0.2486304, -1.99545, 1, 1, 1, 1, 1,
-0.178651, -0.2980858, -3.507691, 1, 1, 1, 1, 1,
-0.1776442, -1.619434, -3.357185, 1, 1, 1, 1, 1,
-0.1753165, 0.9895447, -1.986139, 1, 1, 1, 1, 1,
-0.1689712, -1.33978, -3.614705, 0, 0, 1, 1, 1,
-0.1622938, 0.07777219, 0.05776744, 1, 0, 0, 1, 1,
-0.1586575, 1.927524, -0.2476469, 1, 0, 0, 1, 1,
-0.1557499, -1.007852, -3.820907, 1, 0, 0, 1, 1,
-0.1554791, -0.4013169, -2.281449, 1, 0, 0, 1, 1,
-0.1495153, 0.3034009, -2.433642, 1, 0, 0, 1, 1,
-0.1452112, 1.33148, -0.17712, 0, 0, 0, 1, 1,
-0.1447489, 0.9567398, 0.6123611, 0, 0, 0, 1, 1,
-0.1442077, 2.014497, -1.381525, 0, 0, 0, 1, 1,
-0.1410635, -0.09443949, -3.099209, 0, 0, 0, 1, 1,
-0.1359387, 0.5605872, 0.3633473, 0, 0, 0, 1, 1,
-0.1334641, 0.07687018, -1.539677, 0, 0, 0, 1, 1,
-0.1317749, -0.8489102, -3.438535, 0, 0, 0, 1, 1,
-0.1314009, 0.01382461, -0.5893135, 1, 1, 1, 1, 1,
-0.1274073, -1.434528, -0.5162806, 1, 1, 1, 1, 1,
-0.1260919, 0.6872207, -0.01427504, 1, 1, 1, 1, 1,
-0.1248364, -1.397769, -4.735667, 1, 1, 1, 1, 1,
-0.1215356, -0.04753197, -1.564198, 1, 1, 1, 1, 1,
-0.1204014, -0.9081067, -1.802075, 1, 1, 1, 1, 1,
-0.1202864, -0.7705087, -4.730011, 1, 1, 1, 1, 1,
-0.1190255, -0.2641419, -1.848066, 1, 1, 1, 1, 1,
-0.1159305, -0.4887784, -3.686624, 1, 1, 1, 1, 1,
-0.1077052, 0.9051981, 0.5274786, 1, 1, 1, 1, 1,
-0.1017823, -0.6957433, -2.892011, 1, 1, 1, 1, 1,
-0.100858, 0.8694964, -0.2978184, 1, 1, 1, 1, 1,
-0.1008409, 0.2704451, 0.4830012, 1, 1, 1, 1, 1,
-0.1007395, -1.632192, -2.751438, 1, 1, 1, 1, 1,
-0.100694, 0.4582, 0.5372432, 1, 1, 1, 1, 1,
-0.09985911, -1.410419, -1.890223, 0, 0, 1, 1, 1,
-0.0982528, -1.235151, -3.675593, 1, 0, 0, 1, 1,
-0.09631851, 1.859617, 1.239726, 1, 0, 0, 1, 1,
-0.08697287, -0.8129897, -3.589762, 1, 0, 0, 1, 1,
-0.08400058, -0.1572955, -3.240613, 1, 0, 0, 1, 1,
-0.0811323, 1.925499, 1.096944, 1, 0, 0, 1, 1,
-0.0787592, -1.505258, -2.583593, 0, 0, 0, 1, 1,
-0.07601075, 1.69314, 0.2006555, 0, 0, 0, 1, 1,
-0.07203415, 0.6361582, -1.030826, 0, 0, 0, 1, 1,
-0.07037723, 0.4866142, 1.395791, 0, 0, 0, 1, 1,
-0.06742892, -0.7244149, -4.654723, 0, 0, 0, 1, 1,
-0.06199036, -2.807068, -3.036253, 0, 0, 0, 1, 1,
-0.0604608, 1.148214, -0.191822, 0, 0, 0, 1, 1,
-0.05971849, 0.7218724, 1.383866, 1, 1, 1, 1, 1,
-0.05172506, -0.1918511, -1.738844, 1, 1, 1, 1, 1,
-0.04820926, 1.413652, -0.06238423, 1, 1, 1, 1, 1,
-0.04806297, -0.7223054, -2.79963, 1, 1, 1, 1, 1,
-0.04717274, 1.004829, -0.3916993, 1, 1, 1, 1, 1,
-0.04647909, 0.3649541, -1.667154, 1, 1, 1, 1, 1,
-0.0457634, -1.442143, -3.616203, 1, 1, 1, 1, 1,
-0.04448965, -1.394036, -2.394523, 1, 1, 1, 1, 1,
-0.03998626, 0.6066563, -0.851441, 1, 1, 1, 1, 1,
-0.03980885, -1.15798, -3.585653, 1, 1, 1, 1, 1,
-0.03898375, -0.6594524, -3.076782, 1, 1, 1, 1, 1,
-0.03207616, -0.8183906, -4.236871, 1, 1, 1, 1, 1,
-0.03086798, -0.7901238, -3.539469, 1, 1, 1, 1, 1,
-0.02968107, 0.1306422, 0.6279632, 1, 1, 1, 1, 1,
-0.02923561, 0.8669341, 1.053854, 1, 1, 1, 1, 1,
-0.02255178, 0.537966, 1.130785, 0, 0, 1, 1, 1,
-0.02087556, -1.429414, -3.579965, 1, 0, 0, 1, 1,
-0.02081847, -1.079531, -3.759013, 1, 0, 0, 1, 1,
-0.02078055, -0.8269952, -4.234777, 1, 0, 0, 1, 1,
-0.01663679, -0.8856419, -3.497952, 1, 0, 0, 1, 1,
-0.01386301, -0.4218749, -1.857131, 1, 0, 0, 1, 1,
-0.01381209, -1.895067, -3.691771, 0, 0, 0, 1, 1,
-0.01353529, -0.9652771, -4.898099, 0, 0, 0, 1, 1,
-0.01276177, 1.491076, 1.120039, 0, 0, 0, 1, 1,
-0.009202857, -0.4956279, -1.592878, 0, 0, 0, 1, 1,
-0.007582699, 0.7890777, 1.789773, 0, 0, 0, 1, 1,
-0.005962667, -0.8992236, -1.916103, 0, 0, 0, 1, 1,
-0.005012838, 0.6602197, -1.757026, 0, 0, 0, 1, 1,
-0.004929517, -0.2326198, -3.900685, 1, 1, 1, 1, 1,
-0.000347097, 1.349365, -0.2380384, 1, 1, 1, 1, 1,
0.006017329, -0.8691314, 2.542593, 1, 1, 1, 1, 1,
0.006337307, 0.3488731, 2.45647, 1, 1, 1, 1, 1,
0.006468588, -1.134983, 2.745849, 1, 1, 1, 1, 1,
0.01042925, -0.21696, 2.552061, 1, 1, 1, 1, 1,
0.01046224, -1.076411, 3.939453, 1, 1, 1, 1, 1,
0.01284646, -0.8310413, 2.875851, 1, 1, 1, 1, 1,
0.01753592, -0.9347631, 4.377476, 1, 1, 1, 1, 1,
0.01781501, 0.2315002, -1.086464, 1, 1, 1, 1, 1,
0.01782154, 2.322094, 0.07288026, 1, 1, 1, 1, 1,
0.01852311, -1.905384, 2.416682, 1, 1, 1, 1, 1,
0.02159176, 0.6583564, -0.2287335, 1, 1, 1, 1, 1,
0.02574115, -0.109056, 1.412035, 1, 1, 1, 1, 1,
0.02954497, 0.8962623, -0.5528549, 1, 1, 1, 1, 1,
0.03104099, -0.4315169, 3.867714, 0, 0, 1, 1, 1,
0.03211136, 0.2202458, 1.10876, 1, 0, 0, 1, 1,
0.03312272, 0.05088383, 0.3100628, 1, 0, 0, 1, 1,
0.03502578, 0.6776037, 0.5271525, 1, 0, 0, 1, 1,
0.0362395, -1.092045, 3.942762, 1, 0, 0, 1, 1,
0.03689013, -0.00934297, 1.670453, 1, 0, 0, 1, 1,
0.03756144, 0.6576003, -0.91087, 0, 0, 0, 1, 1,
0.04344269, -1.514666, 3.801933, 0, 0, 0, 1, 1,
0.04673904, -1.975619, 4.179149, 0, 0, 0, 1, 1,
0.04921731, 0.8356489, -1.743711, 0, 0, 0, 1, 1,
0.04973423, -1.63122, 2.455371, 0, 0, 0, 1, 1,
0.05292915, 2.46575, -0.6372222, 0, 0, 0, 1, 1,
0.05600012, 0.1080876, -0.3021397, 0, 0, 0, 1, 1,
0.05732545, 1.545403, -0.01993912, 1, 1, 1, 1, 1,
0.05774267, -0.1871436, 4.208952, 1, 1, 1, 1, 1,
0.05932739, -0.5975909, 3.054199, 1, 1, 1, 1, 1,
0.06022085, 0.1340165, -0.3313724, 1, 1, 1, 1, 1,
0.0640421, -0.2440627, 0.8130693, 1, 1, 1, 1, 1,
0.06996416, 0.1836314, 0.02098975, 1, 1, 1, 1, 1,
0.07003238, -0.9861617, 4.05757, 1, 1, 1, 1, 1,
0.07748921, -1.008319, 2.112142, 1, 1, 1, 1, 1,
0.0776922, -1.329163, 2.829411, 1, 1, 1, 1, 1,
0.07804503, -1.150285, 2.695006, 1, 1, 1, 1, 1,
0.08201843, -0.4524671, 2.615873, 1, 1, 1, 1, 1,
0.08292688, 0.5498304, -0.08694175, 1, 1, 1, 1, 1,
0.08353983, 0.4692507, -1.700645, 1, 1, 1, 1, 1,
0.0842858, -0.8568268, 3.164949, 1, 1, 1, 1, 1,
0.08621, 1.048166, 0.2368763, 1, 1, 1, 1, 1,
0.08700363, -0.3051313, 2.021001, 0, 0, 1, 1, 1,
0.08839158, 0.03642627, -0.5760748, 1, 0, 0, 1, 1,
0.09125419, 1.407257, 0.1848385, 1, 0, 0, 1, 1,
0.09323467, -2.200533, 2.325304, 1, 0, 0, 1, 1,
0.09375467, -0.5659289, 2.044049, 1, 0, 0, 1, 1,
0.09405663, 0.8307487, -2.078618, 1, 0, 0, 1, 1,
0.09593602, 0.1020233, 0.2179524, 0, 0, 0, 1, 1,
0.1013912, 0.079347, 0.4298986, 0, 0, 0, 1, 1,
0.1019248, 0.67166, 1.354098, 0, 0, 0, 1, 1,
0.1028517, 0.8344644, 1.405203, 0, 0, 0, 1, 1,
0.1051138, 1.726444, -1.250647, 0, 0, 0, 1, 1,
0.1053338, -0.5768591, 1.599441, 0, 0, 0, 1, 1,
0.110365, 0.4599676, 1.7981, 0, 0, 0, 1, 1,
0.1129946, 1.478119, 2.672838, 1, 1, 1, 1, 1,
0.1131198, 1.584941, 0.1416196, 1, 1, 1, 1, 1,
0.1138614, -0.1681477, 3.119413, 1, 1, 1, 1, 1,
0.1139687, -0.7136403, 4.674789, 1, 1, 1, 1, 1,
0.1148754, -0.4648259, 2.877513, 1, 1, 1, 1, 1,
0.11499, -0.9422936, 2.373303, 1, 1, 1, 1, 1,
0.1156177, 0.1488505, -0.3962972, 1, 1, 1, 1, 1,
0.1252747, 2.180481, 0.9518243, 1, 1, 1, 1, 1,
0.1281526, -1.101128, 2.690798, 1, 1, 1, 1, 1,
0.1297371, -0.8255813, 2.632163, 1, 1, 1, 1, 1,
0.1324631, -0.2359899, 5.110606, 1, 1, 1, 1, 1,
0.1384466, 0.3522529, -0.6322778, 1, 1, 1, 1, 1,
0.1414342, 0.2994006, 1.145146, 1, 1, 1, 1, 1,
0.1483289, -0.1016378, 2.599689, 1, 1, 1, 1, 1,
0.1566983, 0.7700168, -0.2887652, 1, 1, 1, 1, 1,
0.1624079, 0.5451601, -1.464085, 0, 0, 1, 1, 1,
0.1645294, 1.10192, 0.7679941, 1, 0, 0, 1, 1,
0.1699142, -1.118681, 3.394392, 1, 0, 0, 1, 1,
0.1740096, 0.6464062, -0.2710907, 1, 0, 0, 1, 1,
0.1761114, -0.7711983, 5.31556, 1, 0, 0, 1, 1,
0.1781115, 0.2704183, 0.3687965, 1, 0, 0, 1, 1,
0.180099, 0.4238838, 1.838777, 0, 0, 0, 1, 1,
0.1843777, -0.555259, 3.484921, 0, 0, 0, 1, 1,
0.1859426, -1.080542, 1.873563, 0, 0, 0, 1, 1,
0.1871573, 0.4842155, 1.531721, 0, 0, 0, 1, 1,
0.1889943, 0.2322319, -1.631036, 0, 0, 0, 1, 1,
0.1908041, -1.919227, 2.018348, 0, 0, 0, 1, 1,
0.1960811, -0.8450177, 4.888427, 0, 0, 0, 1, 1,
0.1966403, 1.463967, 1.191479, 1, 1, 1, 1, 1,
0.1996739, 0.00199446, 1.242165, 1, 1, 1, 1, 1,
0.2017057, 0.6813448, 0.9429324, 1, 1, 1, 1, 1,
0.2049745, -1.716709, 2.674926, 1, 1, 1, 1, 1,
0.2079322, -0.1085163, 2.031564, 1, 1, 1, 1, 1,
0.2111379, -1.253266, 3.679573, 1, 1, 1, 1, 1,
0.211895, 0.1519688, -0.5080141, 1, 1, 1, 1, 1,
0.2150293, -1.034426, 2.394699, 1, 1, 1, 1, 1,
0.2176656, -1.214769, 2.896631, 1, 1, 1, 1, 1,
0.2187884, -0.1782164, 2.597419, 1, 1, 1, 1, 1,
0.2189081, 1.635732, 0.8044788, 1, 1, 1, 1, 1,
0.225638, -0.529835, 4.345166, 1, 1, 1, 1, 1,
0.2275552, 0.3841487, 1.832908, 1, 1, 1, 1, 1,
0.2285981, -0.1955051, 1.500733, 1, 1, 1, 1, 1,
0.2286717, 1.15138, 0.2608967, 1, 1, 1, 1, 1,
0.2286824, -1.576238, 1.669435, 0, 0, 1, 1, 1,
0.2331944, 1.04176, 0.01563372, 1, 0, 0, 1, 1,
0.2334519, 0.4669603, -1.065832, 1, 0, 0, 1, 1,
0.2394286, 0.367355, 2.179918, 1, 0, 0, 1, 1,
0.2402834, 1.50145, 1.50771, 1, 0, 0, 1, 1,
0.2408924, -0.3749745, 2.668985, 1, 0, 0, 1, 1,
0.2440534, 0.04745455, 0.7572589, 0, 0, 0, 1, 1,
0.2446496, 0.9479081, 0.6114971, 0, 0, 0, 1, 1,
0.2462425, -1.123875, 3.310943, 0, 0, 0, 1, 1,
0.248185, -1.103003, 3.612826, 0, 0, 0, 1, 1,
0.2540171, -1.833243, 4.110926, 0, 0, 0, 1, 1,
0.2549433, -0.6219209, 2.786251, 0, 0, 0, 1, 1,
0.2564807, 0.1583226, 0.7085975, 0, 0, 0, 1, 1,
0.2593123, 0.2049255, -0.2753304, 1, 1, 1, 1, 1,
0.2631958, -0.3959077, 2.935123, 1, 1, 1, 1, 1,
0.2654568, 0.2750415, 2.32256, 1, 1, 1, 1, 1,
0.2665664, 1.528706, -0.1205952, 1, 1, 1, 1, 1,
0.2698194, 0.1514297, 0.1166995, 1, 1, 1, 1, 1,
0.2737885, -1.47131, 1.947062, 1, 1, 1, 1, 1,
0.2745311, 0.9257219, -0.2778556, 1, 1, 1, 1, 1,
0.2799174, -0.3843447, 4.295833, 1, 1, 1, 1, 1,
0.2813078, 0.9459979, 1.448696, 1, 1, 1, 1, 1,
0.2879271, -1.665143, 2.172642, 1, 1, 1, 1, 1,
0.2884216, 0.6435606, 1.990309, 1, 1, 1, 1, 1,
0.2919617, -0.7659838, 3.067353, 1, 1, 1, 1, 1,
0.2925574, -2.214229, 3.111264, 1, 1, 1, 1, 1,
0.2947322, 0.7325839, 1.205143, 1, 1, 1, 1, 1,
0.2964185, 0.02939268, 1.106769, 1, 1, 1, 1, 1,
0.3001247, -2.306913, 3.165454, 0, 0, 1, 1, 1,
0.3041206, 0.9544876, -0.9195048, 1, 0, 0, 1, 1,
0.3071146, -0.4542737, 3.550577, 1, 0, 0, 1, 1,
0.308465, 1.225895, -0.1628405, 1, 0, 0, 1, 1,
0.309217, -1.319984, 3.324051, 1, 0, 0, 1, 1,
0.3107455, 1.655865, -0.1286488, 1, 0, 0, 1, 1,
0.3182509, 0.7484429, 0.3767334, 0, 0, 0, 1, 1,
0.3228043, -0.7892958, 1.66272, 0, 0, 0, 1, 1,
0.3258773, -1.388374, 2.949224, 0, 0, 0, 1, 1,
0.3304008, -0.1885304, 2.480243, 0, 0, 0, 1, 1,
0.3399116, -0.6039332, 2.746145, 0, 0, 0, 1, 1,
0.3454125, 0.5579752, -0.9568888, 0, 0, 0, 1, 1,
0.3472346, -0.9206956, 4.769955, 0, 0, 0, 1, 1,
0.3477305, 0.4686548, 0.002811001, 1, 1, 1, 1, 1,
0.349422, 0.4148539, 1.271939, 1, 1, 1, 1, 1,
0.3506813, -1.078057, 1.029396, 1, 1, 1, 1, 1,
0.3509873, 0.3288956, 0.0660593, 1, 1, 1, 1, 1,
0.351913, 0.7484438, 0.1413572, 1, 1, 1, 1, 1,
0.3530279, -0.7656666, 2.917993, 1, 1, 1, 1, 1,
0.3598467, -0.1702509, 4.600669, 1, 1, 1, 1, 1,
0.3604489, 1.023024, -2.509023, 1, 1, 1, 1, 1,
0.3653365, -0.03486889, 2.407041, 1, 1, 1, 1, 1,
0.365475, -0.5954005, 2.361809, 1, 1, 1, 1, 1,
0.3690251, -0.06521186, 2.509482, 1, 1, 1, 1, 1,
0.3699332, 0.3297838, -1.129812, 1, 1, 1, 1, 1,
0.3744246, 0.6951228, 0.4840246, 1, 1, 1, 1, 1,
0.3768872, 0.04662437, 1.537573, 1, 1, 1, 1, 1,
0.377535, -0.2583838, 1.709151, 1, 1, 1, 1, 1,
0.3802222, -0.3238155, 1.632605, 0, 0, 1, 1, 1,
0.3846508, 1.097609, -0.3634222, 1, 0, 0, 1, 1,
0.3882385, 0.1405685, 1.778696, 1, 0, 0, 1, 1,
0.3914942, -1.71194, 2.625504, 1, 0, 0, 1, 1,
0.3930671, 1.786628, 2.336246, 1, 0, 0, 1, 1,
0.3939683, 0.4566814, 0.7551444, 1, 0, 0, 1, 1,
0.4000461, -0.3251039, 1.441056, 0, 0, 0, 1, 1,
0.4014371, -0.7769393, 3.936946, 0, 0, 0, 1, 1,
0.4039831, 0.6401269, 1.564123, 0, 0, 0, 1, 1,
0.4056699, -0.9218605, 1.866638, 0, 0, 0, 1, 1,
0.4064403, 0.9835261, 0.7802565, 0, 0, 0, 1, 1,
0.4082607, 0.7826807, 0.1658351, 0, 0, 0, 1, 1,
0.4128283, -0.4010037, 1.60894, 0, 0, 0, 1, 1,
0.4167083, -1.070543, 3.377835, 1, 1, 1, 1, 1,
0.418598, 1.109686, -0.3182142, 1, 1, 1, 1, 1,
0.4210709, 0.6041072, -0.8219057, 1, 1, 1, 1, 1,
0.4219669, 0.472582, 0.6086584, 1, 1, 1, 1, 1,
0.4252164, 0.956293, -0.3405882, 1, 1, 1, 1, 1,
0.4267009, 0.1544646, 0.8686296, 1, 1, 1, 1, 1,
0.4290883, 2.265366, 0.3653708, 1, 1, 1, 1, 1,
0.4303289, 2.259764, 0.6128021, 1, 1, 1, 1, 1,
0.4307642, -0.8854936, 2.82311, 1, 1, 1, 1, 1,
0.4333306, 0.664619, 0.7769737, 1, 1, 1, 1, 1,
0.434958, -0.2004288, 2.786096, 1, 1, 1, 1, 1,
0.4356596, -1.504904, 3.530144, 1, 1, 1, 1, 1,
0.4372991, -2.026889, 2.544464, 1, 1, 1, 1, 1,
0.4382693, -0.844035, 3.383789, 1, 1, 1, 1, 1,
0.4400028, 0.3942503, 2.23089, 1, 1, 1, 1, 1,
0.4402458, -0.01695185, 0.7299865, 0, 0, 1, 1, 1,
0.4421506, -0.8018174, 3.665452, 1, 0, 0, 1, 1,
0.4455683, 0.1019188, -0.3092355, 1, 0, 0, 1, 1,
0.4458386, 1.383014, -0.1381592, 1, 0, 0, 1, 1,
0.4464517, -0.2966374, 1.276838, 1, 0, 0, 1, 1,
0.4490749, -0.4679401, 3.057652, 1, 0, 0, 1, 1,
0.4497984, -1.141025, 3.23856, 0, 0, 0, 1, 1,
0.4593819, -1.058873, 3.439247, 0, 0, 0, 1, 1,
0.4597247, -0.7604196, 2.172374, 0, 0, 0, 1, 1,
0.4632181, -0.1881253, 3.394111, 0, 0, 0, 1, 1,
0.4693896, -0.7394013, 2.950142, 0, 0, 0, 1, 1,
0.4723189, -0.1583585, 1.864672, 0, 0, 0, 1, 1,
0.4797213, -1.574394, 3.629029, 0, 0, 0, 1, 1,
0.4803154, 0.02856528, 2.241762, 1, 1, 1, 1, 1,
0.4834896, 0.219844, -1.835579, 1, 1, 1, 1, 1,
0.4841807, 0.6964909, -1.063896, 1, 1, 1, 1, 1,
0.4843178, -0.1725386, 0.776651, 1, 1, 1, 1, 1,
0.4855421, -1.471925, 3.620051, 1, 1, 1, 1, 1,
0.4856307, -2.112547, 3.394497, 1, 1, 1, 1, 1,
0.4862049, -0.8700843, 4.023985, 1, 1, 1, 1, 1,
0.4871841, 0.5375525, 0.07321648, 1, 1, 1, 1, 1,
0.4872672, -2.14044, 1.410908, 1, 1, 1, 1, 1,
0.4893176, -0.1401916, 2.644034, 1, 1, 1, 1, 1,
0.4898511, -0.2881315, 1.891186, 1, 1, 1, 1, 1,
0.4928369, -2.05228, 2.810804, 1, 1, 1, 1, 1,
0.4933943, 0.1384347, 1.585187, 1, 1, 1, 1, 1,
0.4953023, -0.6291528, 2.162776, 1, 1, 1, 1, 1,
0.4966854, -0.4704751, 1.483214, 1, 1, 1, 1, 1,
0.5045504, 0.7749491, 2.880872, 0, 0, 1, 1, 1,
0.5055381, 0.3822288, 1.716114, 1, 0, 0, 1, 1,
0.5055715, 0.09787816, 0.1532041, 1, 0, 0, 1, 1,
0.5090703, -0.3923023, 1.888647, 1, 0, 0, 1, 1,
0.5104916, 0.3714185, 0.9509829, 1, 0, 0, 1, 1,
0.5106059, -1.1966, 3.515471, 1, 0, 0, 1, 1,
0.5117169, 0.7530075, 0.511136, 0, 0, 0, 1, 1,
0.5117476, 1.033065, 0.4095455, 0, 0, 0, 1, 1,
0.5122911, -0.8269653, 2.079292, 0, 0, 0, 1, 1,
0.5194549, -1.711868, 1.689418, 0, 0, 0, 1, 1,
0.5204451, -1.229461, 3.443771, 0, 0, 0, 1, 1,
0.5247726, -0.9251152, 2.202934, 0, 0, 0, 1, 1,
0.5260881, -0.4776243, 3.447431, 0, 0, 0, 1, 1,
0.5277786, 1.033168, 1.045345, 1, 1, 1, 1, 1,
0.5285551, -0.979293, 2.668837, 1, 1, 1, 1, 1,
0.5324853, -0.6186703, 1.019289, 1, 1, 1, 1, 1,
0.5337656, 0.1953905, 1.13387, 1, 1, 1, 1, 1,
0.5373213, -1.677092, 3.031933, 1, 1, 1, 1, 1,
0.5448347, 0.4645945, 0.7230627, 1, 1, 1, 1, 1,
0.5486291, -2.648835, 2.94455, 1, 1, 1, 1, 1,
0.552588, 0.600472, -0.6474122, 1, 1, 1, 1, 1,
0.5611951, -0.9271938, 1.886523, 1, 1, 1, 1, 1,
0.5629388, -0.6957546, 4.508636, 1, 1, 1, 1, 1,
0.5643272, 0.9381085, -0.08225805, 1, 1, 1, 1, 1,
0.5645382, -1.472578, 3.376432, 1, 1, 1, 1, 1,
0.5710667, -0.3288459, 3.92956, 1, 1, 1, 1, 1,
0.5738156, 1.125766, 1.595781, 1, 1, 1, 1, 1,
0.5755273, -0.2213282, 1.233855, 1, 1, 1, 1, 1,
0.5764416, -1.425162, 2.32749, 0, 0, 1, 1, 1,
0.5792193, -0.5041437, 2.04407, 1, 0, 0, 1, 1,
0.5820811, -0.01571419, 1.964682, 1, 0, 0, 1, 1,
0.5836567, 0.494391, 1.079529, 1, 0, 0, 1, 1,
0.592774, 0.6613674, 1.704207, 1, 0, 0, 1, 1,
0.5939042, 1.1137, 0.8978096, 1, 0, 0, 1, 1,
0.5941115, 1.155124, -0.5116883, 0, 0, 0, 1, 1,
0.5985159, -0.488399, 2.487637, 0, 0, 0, 1, 1,
0.6014698, 1.608902, -1.555662, 0, 0, 0, 1, 1,
0.6033335, 0.3353082, 0.3351547, 0, 0, 0, 1, 1,
0.6036014, -1.444091, 3.836453, 0, 0, 0, 1, 1,
0.603781, 0.244143, -0.6396162, 0, 0, 0, 1, 1,
0.6050302, -0.7547679, 4.137599, 0, 0, 0, 1, 1,
0.6085374, 0.8696501, 2.01865, 1, 1, 1, 1, 1,
0.610068, -0.6268052, -0.001511592, 1, 1, 1, 1, 1,
0.6103059, -1.064811, 0.683238, 1, 1, 1, 1, 1,
0.6122503, -0.2725317, 1.497336, 1, 1, 1, 1, 1,
0.6142985, -0.6850262, 1.277234, 1, 1, 1, 1, 1,
0.6156105, 0.1907682, 2.840683, 1, 1, 1, 1, 1,
0.6174764, -0.7799904, 1.725602, 1, 1, 1, 1, 1,
0.6187658, 0.1807784, 1.121488, 1, 1, 1, 1, 1,
0.6210815, -0.2416703, 2.580321, 1, 1, 1, 1, 1,
0.6296465, 1.256338, -0.2093924, 1, 1, 1, 1, 1,
0.6314957, 0.4512583, 0.7796178, 1, 1, 1, 1, 1,
0.6325904, -2.097584, 2.371899, 1, 1, 1, 1, 1,
0.6500202, -2.333269, 1.291755, 1, 1, 1, 1, 1,
0.6536064, 0.2936154, 1.226702, 1, 1, 1, 1, 1,
0.6538631, -1.289273, 3.369725, 1, 1, 1, 1, 1,
0.6544529, 0.9147957, 0.5194619, 0, 0, 1, 1, 1,
0.6631784, 0.08298559, 0.3271151, 1, 0, 0, 1, 1,
0.669579, 0.4889499, 0.8087693, 1, 0, 0, 1, 1,
0.6726254, -0.1410934, -0.02936382, 1, 0, 0, 1, 1,
0.6838626, -1.3223, 4.807302, 1, 0, 0, 1, 1,
0.6866284, -0.1000229, 1.389313, 1, 0, 0, 1, 1,
0.6871779, -0.3509683, 1.929686, 0, 0, 0, 1, 1,
0.6923249, -0.6313404, 3.386382, 0, 0, 0, 1, 1,
0.6959035, 0.263731, 1.736807, 0, 0, 0, 1, 1,
0.6995323, -1.085045, 1.951788, 0, 0, 0, 1, 1,
0.7002304, -0.506444, 4.122183, 0, 0, 0, 1, 1,
0.7062135, -0.7962078, 2.41604, 0, 0, 0, 1, 1,
0.706942, -1.289692, 3.734234, 0, 0, 0, 1, 1,
0.7108498, -0.8885841, 2.522156, 1, 1, 1, 1, 1,
0.7117029, 1.518688, 1.320954, 1, 1, 1, 1, 1,
0.7144424, -1.091064, 2.651643, 1, 1, 1, 1, 1,
0.7182588, 1.272794, 0.8065836, 1, 1, 1, 1, 1,
0.7283145, -0.2016741, 0.7502925, 1, 1, 1, 1, 1,
0.7283698, 1.341251, 0.05497934, 1, 1, 1, 1, 1,
0.7293026, 1.454917, -0.2528084, 1, 1, 1, 1, 1,
0.7314589, 1.769681, 2.266256, 1, 1, 1, 1, 1,
0.7331541, 0.1830259, 1.734676, 1, 1, 1, 1, 1,
0.7338896, 1.825567, 0.2967212, 1, 1, 1, 1, 1,
0.7347592, -1.337182, 2.903777, 1, 1, 1, 1, 1,
0.7352149, -0.4207421, 1.895819, 1, 1, 1, 1, 1,
0.7354985, -0.248901, 2.321423, 1, 1, 1, 1, 1,
0.7355772, -0.3610575, 1.965732, 1, 1, 1, 1, 1,
0.7425143, -0.2765656, 0.5869368, 1, 1, 1, 1, 1,
0.7436103, -1.350022, 2.98284, 0, 0, 1, 1, 1,
0.7438263, -1.337181, 3.314252, 1, 0, 0, 1, 1,
0.7466856, 0.6471592, 1.682705, 1, 0, 0, 1, 1,
0.7538364, 0.2921818, -1.126722, 1, 0, 0, 1, 1,
0.7547364, -0.1772469, 1.945675, 1, 0, 0, 1, 1,
0.7558175, 0.850194, 0.7964922, 1, 0, 0, 1, 1,
0.7619755, -0.8389506, 1.991603, 0, 0, 0, 1, 1,
0.7629266, 0.8207725, 0.262775, 0, 0, 0, 1, 1,
0.7653986, 0.6719016, 0.02032807, 0, 0, 0, 1, 1,
0.7830877, 1.116433, 1.68918, 0, 0, 0, 1, 1,
0.7855853, 0.5566233, 1.167655, 0, 0, 0, 1, 1,
0.7863491, -0.6473566, 1.690354, 0, 0, 0, 1, 1,
0.79096, 0.7700393, -0.3475093, 0, 0, 0, 1, 1,
0.7930149, 1.117471, 0.05099944, 1, 1, 1, 1, 1,
0.793169, -0.3900839, 1.741248, 1, 1, 1, 1, 1,
0.8011372, -1.200449, 1.199823, 1, 1, 1, 1, 1,
0.8260357, -0.422211, 1.619178, 1, 1, 1, 1, 1,
0.8287834, 0.109849, 1.660896, 1, 1, 1, 1, 1,
0.8302705, -0.002310397, 2.444118, 1, 1, 1, 1, 1,
0.8313156, 0.03520037, 1.005789, 1, 1, 1, 1, 1,
0.8360145, -0.1970506, 2.457675, 1, 1, 1, 1, 1,
0.8378155, -0.1163476, 1.779307, 1, 1, 1, 1, 1,
0.8385927, 0.3661031, 2.853579, 1, 1, 1, 1, 1,
0.8418965, 0.3163016, 0.8608732, 1, 1, 1, 1, 1,
0.8440583, 0.03187958, 1.63064, 1, 1, 1, 1, 1,
0.8440776, 1.264084, 0.2329155, 1, 1, 1, 1, 1,
0.8532804, 0.7758267, 1.130555, 1, 1, 1, 1, 1,
0.8539848, -0.2278612, 2.333632, 1, 1, 1, 1, 1,
0.857762, 0.5490259, -0.1799533, 0, 0, 1, 1, 1,
0.858465, 0.07385536, 1.860429, 1, 0, 0, 1, 1,
0.8688332, 0.002823132, 2.942227, 1, 0, 0, 1, 1,
0.8721315, 0.317151, 3.799027, 1, 0, 0, 1, 1,
0.8731622, 0.7111508, 0.9686041, 1, 0, 0, 1, 1,
0.8793455, 1.98991, 1.176883, 1, 0, 0, 1, 1,
0.8818647, 0.1501778, 0.7230204, 0, 0, 0, 1, 1,
0.8824683, 1.181425, 0.6484253, 0, 0, 0, 1, 1,
0.9004392, 0.1372193, 2.287279, 0, 0, 0, 1, 1,
0.9020267, -0.2574486, 1.104237, 0, 0, 0, 1, 1,
0.9031331, 1.195407, 1.143227, 0, 0, 0, 1, 1,
0.9075399, 0.5960908, 2.351758, 0, 0, 0, 1, 1,
0.9092131, 0.7814575, 1.546952, 0, 0, 0, 1, 1,
0.9106057, -0.1565769, 2.865386, 1, 1, 1, 1, 1,
0.9123113, -1.412132, 2.255209, 1, 1, 1, 1, 1,
0.9137657, -0.03790755, 1.231493, 1, 1, 1, 1, 1,
0.9152089, -1.240674, 4.00518, 1, 1, 1, 1, 1,
0.9298895, 2.271616, 0.7884298, 1, 1, 1, 1, 1,
0.9396635, 0.950321, 0.3463177, 1, 1, 1, 1, 1,
0.9440628, 0.4268198, 2.92426, 1, 1, 1, 1, 1,
0.9443998, 1.728323, 0.2723934, 1, 1, 1, 1, 1,
0.9445212, 0.764098, 0.08592517, 1, 1, 1, 1, 1,
0.9466081, -0.05820981, 2.303173, 1, 1, 1, 1, 1,
0.9556385, 0.8892215, -0.9012852, 1, 1, 1, 1, 1,
0.9557136, 0.6808174, 1.340246, 1, 1, 1, 1, 1,
0.95662, 1.396693, -0.5699224, 1, 1, 1, 1, 1,
0.9569825, 0.3239547, 1.74134, 1, 1, 1, 1, 1,
0.9591141, 0.4259755, 1.861055, 1, 1, 1, 1, 1,
0.9610808, 0.2940212, 1.021017, 0, 0, 1, 1, 1,
0.9643828, -0.1107799, 1.306329, 1, 0, 0, 1, 1,
0.9763384, 0.406778, 0.9734815, 1, 0, 0, 1, 1,
0.9846637, 0.04999098, 2.124667, 1, 0, 0, 1, 1,
0.9854928, 0.01110183, 2.972275, 1, 0, 0, 1, 1,
0.9912706, 0.9933305, 0.4363628, 1, 0, 0, 1, 1,
0.9922594, -0.1900241, 0.8631235, 0, 0, 0, 1, 1,
0.9959102, 0.232669, 0.151527, 0, 0, 0, 1, 1,
1.002851, -0.9809039, 0.1270283, 0, 0, 0, 1, 1,
1.011193, -1.294267, 0.912688, 0, 0, 0, 1, 1,
1.012345, 1.085045, -0.2185404, 0, 0, 0, 1, 1,
1.016958, -0.9979032, 1.399859, 0, 0, 0, 1, 1,
1.02505, 0.3011241, -0.2230211, 0, 0, 0, 1, 1,
1.02772, -0.6376603, 1.935801, 1, 1, 1, 1, 1,
1.056037, -0.4139793, 2.769706, 1, 1, 1, 1, 1,
1.068892, -0.5199677, 2.177519, 1, 1, 1, 1, 1,
1.074676, -1.11884, 0.8159413, 1, 1, 1, 1, 1,
1.074902, 0.08202086, 0.1411814, 1, 1, 1, 1, 1,
1.080711, -0.8017948, 2.991666, 1, 1, 1, 1, 1,
1.082275, 0.8696667, 0.6264036, 1, 1, 1, 1, 1,
1.084359, -1.500987, 2.676906, 1, 1, 1, 1, 1,
1.102519, 0.9212686, -0.5759835, 1, 1, 1, 1, 1,
1.106557, 1.905497, -0.4612921, 1, 1, 1, 1, 1,
1.109063, -1.06886, 1.315667, 1, 1, 1, 1, 1,
1.116649, 0.729547, 1.891199, 1, 1, 1, 1, 1,
1.118946, 1.759527, 1.834116, 1, 1, 1, 1, 1,
1.119092, 0.87362, -0.1853453, 1, 1, 1, 1, 1,
1.119374, -0.6418501, 2.124588, 1, 1, 1, 1, 1,
1.122908, -1.079591, 1.941621, 0, 0, 1, 1, 1,
1.123098, -2.275678, 3.739812, 1, 0, 0, 1, 1,
1.124245, 2.708412, 0.5597959, 1, 0, 0, 1, 1,
1.125139, -0.3742631, 2.785185, 1, 0, 0, 1, 1,
1.12749, 0.7340893, 2.080106, 1, 0, 0, 1, 1,
1.13377, -0.9277341, 1.319735, 1, 0, 0, 1, 1,
1.138571, -1.088249, 0.4274998, 0, 0, 0, 1, 1,
1.143787, -0.3227821, 0.7592102, 0, 0, 0, 1, 1,
1.145742, 2.313115, 1.821791, 0, 0, 0, 1, 1,
1.152971, -0.6123649, 0.8526196, 0, 0, 0, 1, 1,
1.159699, -1.524793, 3.06826, 0, 0, 0, 1, 1,
1.163238, 0.313181, 2.934187, 0, 0, 0, 1, 1,
1.16793, -1.039836, 3.523006, 0, 0, 0, 1, 1,
1.173168, 0.1659582, 2.490479, 1, 1, 1, 1, 1,
1.179566, 1.703589, -0.04241279, 1, 1, 1, 1, 1,
1.183263, 1.077398, 2.126097, 1, 1, 1, 1, 1,
1.187284, -1.295251, 2.102646, 1, 1, 1, 1, 1,
1.188348, 0.2186759, 1.290056, 1, 1, 1, 1, 1,
1.192304, 0.05218878, 2.2762, 1, 1, 1, 1, 1,
1.196963, -0.07018954, 1.465413, 1, 1, 1, 1, 1,
1.197232, -0.1121802, 1.813091, 1, 1, 1, 1, 1,
1.200373, 0.7869202, 0.7293996, 1, 1, 1, 1, 1,
1.201025, 0.7511051, 1.907053, 1, 1, 1, 1, 1,
1.209826, 1.518335, 0.9001839, 1, 1, 1, 1, 1,
1.21024, -0.1637046, 0.6827787, 1, 1, 1, 1, 1,
1.211694, 1.281598, 0.3157758, 1, 1, 1, 1, 1,
1.216415, -0.1146517, 1.22654, 1, 1, 1, 1, 1,
1.219741, -1.129635, 2.248941, 1, 1, 1, 1, 1,
1.221362, 0.1925347, 0.9620059, 0, 0, 1, 1, 1,
1.229606, 0.7763967, 0.5248128, 1, 0, 0, 1, 1,
1.229803, -0.295867, 1.922473, 1, 0, 0, 1, 1,
1.231445, -0.3168769, 2.618456, 1, 0, 0, 1, 1,
1.231608, -0.8228688, 0.7222189, 1, 0, 0, 1, 1,
1.234087, -0.3945841, 1.237368, 1, 0, 0, 1, 1,
1.23411, -0.4806466, 1.879931, 0, 0, 0, 1, 1,
1.238577, 0.6958275, -1.064005, 0, 0, 0, 1, 1,
1.248682, -0.2814888, 2.099308, 0, 0, 0, 1, 1,
1.256853, 0.4471785, 2.20098, 0, 0, 0, 1, 1,
1.271981, -0.5595402, 1.021314, 0, 0, 0, 1, 1,
1.288492, 0.5547282, 0.4372986, 0, 0, 0, 1, 1,
1.28928, -1.289212, 2.926487, 0, 0, 0, 1, 1,
1.289699, -1.06367, 1.116881, 1, 1, 1, 1, 1,
1.293007, 0.5835288, 0.6251593, 1, 1, 1, 1, 1,
1.301225, 0.6289656, 0.2967288, 1, 1, 1, 1, 1,
1.305815, 0.09556003, 1.416959, 1, 1, 1, 1, 1,
1.318193, 0.6488357, 0.1328969, 1, 1, 1, 1, 1,
1.337058, 1.313204, 1.391767, 1, 1, 1, 1, 1,
1.338321, 1.240216, 1.717109, 1, 1, 1, 1, 1,
1.353924, -0.166715, 0.7772061, 1, 1, 1, 1, 1,
1.354384, -0.2113972, 0.4163369, 1, 1, 1, 1, 1,
1.375079, 0.2350064, 1.819503, 1, 1, 1, 1, 1,
1.386711, -0.6866715, 2.373869, 1, 1, 1, 1, 1,
1.397455, -0.4129102, 2.362237, 1, 1, 1, 1, 1,
1.405651, 1.122946, 0.1409416, 1, 1, 1, 1, 1,
1.421636, -0.3452659, 0.408271, 1, 1, 1, 1, 1,
1.424367, -2.301603, 1.612106, 1, 1, 1, 1, 1,
1.424646, 1.056514, 0.2727764, 0, 0, 1, 1, 1,
1.430412, 0.8849444, 1.282134, 1, 0, 0, 1, 1,
1.438498, 1.117957, 1.835496, 1, 0, 0, 1, 1,
1.441901, -0.7677705, 3.999955, 1, 0, 0, 1, 1,
1.442245, -0.8698903, 3.294532, 1, 0, 0, 1, 1,
1.443288, 1.718882, 1.049498, 1, 0, 0, 1, 1,
1.459735, 0.5416132, 2.045183, 0, 0, 0, 1, 1,
1.463836, 0.5860496, 1.652456, 0, 0, 0, 1, 1,
1.465164, 0.5940215, 1.31402, 0, 0, 0, 1, 1,
1.470559, 0.6059605, -0.5185257, 0, 0, 0, 1, 1,
1.477424, 0.9484444, 0.6363664, 0, 0, 0, 1, 1,
1.484773, -0.3745581, 1.336661, 0, 0, 0, 1, 1,
1.489764, 2.0997, 1.569918, 0, 0, 0, 1, 1,
1.490055, 0.03143827, 1.845325, 1, 1, 1, 1, 1,
1.492027, 0.320613, 3.308749, 1, 1, 1, 1, 1,
1.492293, -0.2896191, 1.54798, 1, 1, 1, 1, 1,
1.494097, 0.7462067, 0.1939659, 1, 1, 1, 1, 1,
1.504411, -0.05789651, 0.7706173, 1, 1, 1, 1, 1,
1.512857, 1.192153, 3.282727, 1, 1, 1, 1, 1,
1.523902, 0.4253263, 2.952623, 1, 1, 1, 1, 1,
1.537325, -0.7520772, 1.674312, 1, 1, 1, 1, 1,
1.544872, 1.189252, -0.8305289, 1, 1, 1, 1, 1,
1.561881, -0.5296278, 1.459795, 1, 1, 1, 1, 1,
1.565335, -0.1756413, 3.148515, 1, 1, 1, 1, 1,
1.568698, 0.5939311, 1.661415, 1, 1, 1, 1, 1,
1.593396, 0.08883888, 2.027242, 1, 1, 1, 1, 1,
1.614955, 0.4316992, 1.185883, 1, 1, 1, 1, 1,
1.632647, 0.5669585, 0.9803081, 1, 1, 1, 1, 1,
1.633518, 1.005038, 0.02260723, 0, 0, 1, 1, 1,
1.639712, -1.042238, 0.567038, 1, 0, 0, 1, 1,
1.640767, 0.8560463, 0.2112437, 1, 0, 0, 1, 1,
1.656911, -0.2746622, 3.03293, 1, 0, 0, 1, 1,
1.669938, -0.8421437, 1.743117, 1, 0, 0, 1, 1,
1.6786, 1.972693, -0.979064, 1, 0, 0, 1, 1,
1.688241, -0.1348349, 1.399419, 0, 0, 0, 1, 1,
1.741431, -1.269713, 2.000718, 0, 0, 0, 1, 1,
1.748981, -1.277234, 2.150853, 0, 0, 0, 1, 1,
1.760951, -1.618997, 2.993716, 0, 0, 0, 1, 1,
1.770556, 0.5891782, 1.550031, 0, 0, 0, 1, 1,
1.806798, -0.414834, 1.565544, 0, 0, 0, 1, 1,
1.811656, 0.5902433, 2.834997, 0, 0, 0, 1, 1,
1.835157, -0.2504233, 1.600288, 1, 1, 1, 1, 1,
1.841545, 0.6977054, 0.2309834, 1, 1, 1, 1, 1,
1.849148, -1.091067, 2.000191, 1, 1, 1, 1, 1,
1.861949, 0.5963444, 2.040047, 1, 1, 1, 1, 1,
1.868637, 0.8631154, 1.153538, 1, 1, 1, 1, 1,
1.911984, 0.04934541, 2.849944, 1, 1, 1, 1, 1,
1.982767, 1.785141, 0.645072, 1, 1, 1, 1, 1,
1.989753, 0.7419968, -1.626709, 1, 1, 1, 1, 1,
1.9958, 0.03171361, -0.1981634, 1, 1, 1, 1, 1,
2.031707, 0.4240473, 3.524033, 1, 1, 1, 1, 1,
2.031797, -0.3577599, 1.237958, 1, 1, 1, 1, 1,
2.036331, 0.1394043, 0.5062205, 1, 1, 1, 1, 1,
2.0633, 2.077894, 1.043492, 1, 1, 1, 1, 1,
2.085601, -0.7019083, 0.5169036, 1, 1, 1, 1, 1,
2.109459, 1.262757, -0.2987627, 1, 1, 1, 1, 1,
2.160042, 0.2910322, 0.1910661, 0, 0, 1, 1, 1,
2.189145, 0.2465101, 0.5464875, 1, 0, 0, 1, 1,
2.196336, 1.953912, 1.346363, 1, 0, 0, 1, 1,
2.251377, 0.2941515, 0.8795662, 1, 0, 0, 1, 1,
2.277006, -0.9380232, 1.609412, 1, 0, 0, 1, 1,
2.290847, 2.015331, 1.977051, 1, 0, 0, 1, 1,
2.376752, -0.3918753, 0.8032275, 0, 0, 0, 1, 1,
2.377222, -0.6704425, 1.818002, 0, 0, 0, 1, 1,
2.381224, -0.4118127, 3.49147, 0, 0, 0, 1, 1,
2.391141, -0.330171, 2.356047, 0, 0, 0, 1, 1,
2.397776, -1.526792, 1.614449, 0, 0, 0, 1, 1,
2.429885, -1.199403, 1.862553, 0, 0, 0, 1, 1,
2.520376, 0.3285774, 1.402694, 0, 0, 0, 1, 1,
2.535338, -1.80941, 1.825945, 1, 1, 1, 1, 1,
2.552002, -0.05293643, 1.92532, 1, 1, 1, 1, 1,
2.914133, 0.735044, 1.622453, 1, 1, 1, 1, 1,
2.933064, 0.7266849, 1.50896, 1, 1, 1, 1, 1,
3.020762, -1.246624, 2.883815, 1, 1, 1, 1, 1,
3.266571, -0.1761059, 1.125695, 1, 1, 1, 1, 1,
3.443849, 0.6027315, -0.2447515, 1, 1, 1, 1, 1
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
var radius = 9.367881;
var distance = 32.90429;
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
mvMatrix.translate( 0.01546359, 0.1117474, -0.2087302 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.90429);
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
