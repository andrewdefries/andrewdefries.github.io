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
-3.105945, 1.131363, -0.7743683, 1, 0, 0, 1,
-2.900406, 1.921224, -1.379417, 1, 0.007843138, 0, 1,
-2.800531, 0.7674714, -0.02492541, 1, 0.01176471, 0, 1,
-2.49595, -1.859537, -1.202738, 1, 0.01960784, 0, 1,
-2.460995, 0.7058279, -2.939068, 1, 0.02352941, 0, 1,
-2.348736, 0.5287136, -0.9566088, 1, 0.03137255, 0, 1,
-2.337988, 1.237309, 0.0593943, 1, 0.03529412, 0, 1,
-2.319649, 0.6509383, -2.066206, 1, 0.04313726, 0, 1,
-2.255477, 2.235875, -0.4649892, 1, 0.04705882, 0, 1,
-2.226832, -1.347348, -2.265607, 1, 0.05490196, 0, 1,
-2.206563, 1.501471, -1.264862, 1, 0.05882353, 0, 1,
-2.165389, -2.579286, -3.213571, 1, 0.06666667, 0, 1,
-2.144244, -0.7755204, -4.423653, 1, 0.07058824, 0, 1,
-2.127753, -0.05927074, -2.238979, 1, 0.07843138, 0, 1,
-2.125592, 0.6234726, -0.4299606, 1, 0.08235294, 0, 1,
-2.122347, -0.1738525, -1.999618, 1, 0.09019608, 0, 1,
-2.049385, -0.5202261, -1.57817, 1, 0.09411765, 0, 1,
-2.036075, 1.500865, -1.353706, 1, 0.1019608, 0, 1,
-2.033674, -1.313969, -2.366942, 1, 0.1098039, 0, 1,
-2.022562, -0.5235041, -1.595977, 1, 0.1137255, 0, 1,
-2.019248, 0.3613867, -1.709824, 1, 0.1215686, 0, 1,
-2.00665, 1.497266, -0.3471001, 1, 0.1254902, 0, 1,
-1.996675, -0.1995559, -1.034156, 1, 0.1333333, 0, 1,
-1.983528, 0.9831553, 0.312564, 1, 0.1372549, 0, 1,
-1.983272, 0.2749523, -1.899094, 1, 0.145098, 0, 1,
-1.967963, 1.643753, -0.3455257, 1, 0.1490196, 0, 1,
-1.964668, 2.78655, -1.127488, 1, 0.1568628, 0, 1,
-1.955616, 0.1885562, -2.358299, 1, 0.1607843, 0, 1,
-1.940129, -0.9051307, -1.63389, 1, 0.1686275, 0, 1,
-1.937584, 0.3801538, -2.556094, 1, 0.172549, 0, 1,
-1.93285, 0.5082064, -2.179073, 1, 0.1803922, 0, 1,
-1.907676, -0.01169454, 0.02164602, 1, 0.1843137, 0, 1,
-1.880541, -0.1574369, -2.776279, 1, 0.1921569, 0, 1,
-1.858508, -1.027307, -2.587104, 1, 0.1960784, 0, 1,
-1.847041, 0.585308, -1.154926, 1, 0.2039216, 0, 1,
-1.839348, -0.7593264, -2.108349, 1, 0.2117647, 0, 1,
-1.837507, -0.6157418, -2.185818, 1, 0.2156863, 0, 1,
-1.836736, -0.6442951, -2.115975, 1, 0.2235294, 0, 1,
-1.832859, 0.5576831, -0.9310169, 1, 0.227451, 0, 1,
-1.819324, 0.693785, -0.5358708, 1, 0.2352941, 0, 1,
-1.818424, 0.2841021, -1.790711, 1, 0.2392157, 0, 1,
-1.813114, -0.5816703, -1.697859, 1, 0.2470588, 0, 1,
-1.791144, -0.03880674, -2.12138, 1, 0.2509804, 0, 1,
-1.740874, 2.262001, -0.2815076, 1, 0.2588235, 0, 1,
-1.728073, -1.160543, -2.438015, 1, 0.2627451, 0, 1,
-1.723276, -0.1580911, -1.585526, 1, 0.2705882, 0, 1,
-1.690929, 0.1761825, -2.17032, 1, 0.2745098, 0, 1,
-1.662239, 0.452947, -1.116137, 1, 0.282353, 0, 1,
-1.655077, -0.3816414, -0.310409, 1, 0.2862745, 0, 1,
-1.647134, 0.8058386, -1.163252, 1, 0.2941177, 0, 1,
-1.64409, -0.5750121, -0.7856772, 1, 0.3019608, 0, 1,
-1.640678, 1.230727, 0.5419716, 1, 0.3058824, 0, 1,
-1.620856, 0.7018318, -3.036767, 1, 0.3137255, 0, 1,
-1.604239, 0.321095, -2.510205, 1, 0.3176471, 0, 1,
-1.604103, 0.2141354, -1.387779, 1, 0.3254902, 0, 1,
-1.601955, 0.9331573, -0.8586831, 1, 0.3294118, 0, 1,
-1.601257, 1.607275, -1.474386, 1, 0.3372549, 0, 1,
-1.589937, -0.4887653, -4.972717, 1, 0.3411765, 0, 1,
-1.578506, 0.9288719, -0.1122897, 1, 0.3490196, 0, 1,
-1.575053, 0.5402883, 0.9519493, 1, 0.3529412, 0, 1,
-1.563185, -1.189791, -2.850618, 1, 0.3607843, 0, 1,
-1.552153, 0.6572419, -1.655041, 1, 0.3647059, 0, 1,
-1.534938, 0.3369636, -1.5284, 1, 0.372549, 0, 1,
-1.519343, -1.358756, -1.838207, 1, 0.3764706, 0, 1,
-1.486199, 0.2863188, -1.631396, 1, 0.3843137, 0, 1,
-1.484577, 0.7855761, 0.01365895, 1, 0.3882353, 0, 1,
-1.47898, -0.07896069, 0.459695, 1, 0.3960784, 0, 1,
-1.459841, 0.7396104, -3.439853, 1, 0.4039216, 0, 1,
-1.452268, 0.433153, -0.7938728, 1, 0.4078431, 0, 1,
-1.437076, -0.4586705, -0.4168664, 1, 0.4156863, 0, 1,
-1.433722, 1.186033, 0.06640705, 1, 0.4196078, 0, 1,
-1.422564, -0.6948833, -1.771524, 1, 0.427451, 0, 1,
-1.401645, -1.073196, -4.279827, 1, 0.4313726, 0, 1,
-1.394341, 1.19421, -1.009762, 1, 0.4392157, 0, 1,
-1.387186, 0.04944374, -2.656804, 1, 0.4431373, 0, 1,
-1.372481, 0.328744, -0.8945897, 1, 0.4509804, 0, 1,
-1.364619, 0.1942564, -2.197239, 1, 0.454902, 0, 1,
-1.362785, 0.002406833, -0.4099154, 1, 0.4627451, 0, 1,
-1.359235, -0.01439074, -0.5010027, 1, 0.4666667, 0, 1,
-1.33807, -0.360822, -3.591497, 1, 0.4745098, 0, 1,
-1.325568, -0.4532143, -1.145909, 1, 0.4784314, 0, 1,
-1.322289, -0.05149716, -1.896603, 1, 0.4862745, 0, 1,
-1.318244, -0.4699017, -1.530888, 1, 0.4901961, 0, 1,
-1.306241, -1.793601, -2.327202, 1, 0.4980392, 0, 1,
-1.305178, 0.08880121, -1.799614, 1, 0.5058824, 0, 1,
-1.301265, 0.3696526, -2.084011, 1, 0.509804, 0, 1,
-1.294934, -0.8594768, -2.923654, 1, 0.5176471, 0, 1,
-1.291769, -1.752128, -2.597607, 1, 0.5215687, 0, 1,
-1.275938, -1.528237, -2.124383, 1, 0.5294118, 0, 1,
-1.27383, -0.2254955, -1.52392, 1, 0.5333334, 0, 1,
-1.271962, -0.1466069, -0.5186983, 1, 0.5411765, 0, 1,
-1.256905, -0.01922402, -1.222068, 1, 0.5450981, 0, 1,
-1.241501, 0.1479109, -2.318544, 1, 0.5529412, 0, 1,
-1.232675, 0.8953757, -0.296919, 1, 0.5568628, 0, 1,
-1.232583, -0.836811, -1.324049, 1, 0.5647059, 0, 1,
-1.220689, 0.8192803, -0.6012675, 1, 0.5686275, 0, 1,
-1.212077, 1.071181, -1.265472, 1, 0.5764706, 0, 1,
-1.19589, 1.068811, -2.965105, 1, 0.5803922, 0, 1,
-1.195049, -2.303595, -1.055356, 1, 0.5882353, 0, 1,
-1.194301, -0.3277652, -2.184499, 1, 0.5921569, 0, 1,
-1.190404, -0.4777221, -2.314686, 1, 0.6, 0, 1,
-1.184585, -1.392054, -3.023652, 1, 0.6078432, 0, 1,
-1.180866, 0.538228, -2.514285, 1, 0.6117647, 0, 1,
-1.172966, -0.4122016, -0.5748937, 1, 0.6196079, 0, 1,
-1.165745, -1.058519, -0.7183485, 1, 0.6235294, 0, 1,
-1.165267, -0.1526497, -2.377465, 1, 0.6313726, 0, 1,
-1.162962, -0.9059395, -0.6817809, 1, 0.6352941, 0, 1,
-1.152814, -0.552997, -1.540165, 1, 0.6431373, 0, 1,
-1.14117, 1.025539, -1.649578, 1, 0.6470588, 0, 1,
-1.139517, 0.5573532, -0.3304467, 1, 0.654902, 0, 1,
-1.137451, -0.373729, -1.68008, 1, 0.6588235, 0, 1,
-1.135351, -1.140449, -2.708848, 1, 0.6666667, 0, 1,
-1.1347, 2.247791, -0.8094254, 1, 0.6705883, 0, 1,
-1.134232, -2.003213, -1.557855, 1, 0.6784314, 0, 1,
-1.13186, -0.8561888, -2.505702, 1, 0.682353, 0, 1,
-1.120192, -0.4698345, -2.403553, 1, 0.6901961, 0, 1,
-1.118351, -1.174096, -1.827441, 1, 0.6941177, 0, 1,
-1.118288, -0.7517505, -0.9789488, 1, 0.7019608, 0, 1,
-1.115431, 1.653783, -0.7846043, 1, 0.7098039, 0, 1,
-1.114867, -1.803281, -2.917979, 1, 0.7137255, 0, 1,
-1.111227, 0.1975133, 1.327372, 1, 0.7215686, 0, 1,
-1.105465, -0.1435919, -0.06630109, 1, 0.7254902, 0, 1,
-1.090645, -0.3916125, -2.807164, 1, 0.7333333, 0, 1,
-1.090108, 0.2409913, -2.153917, 1, 0.7372549, 0, 1,
-1.083355, -2.804228, -3.822942, 1, 0.7450981, 0, 1,
-1.079132, -0.7391123, -2.61998, 1, 0.7490196, 0, 1,
-1.078892, 0.351734, -2.895383, 1, 0.7568628, 0, 1,
-1.071869, 0.2587094, -0.4729921, 1, 0.7607843, 0, 1,
-1.071291, 0.02072666, -1.04616, 1, 0.7686275, 0, 1,
-1.070425, 1.891023, -1.396118, 1, 0.772549, 0, 1,
-1.066487, 0.8180921, -0.9485924, 1, 0.7803922, 0, 1,
-1.060784, -0.2829649, -1.361642, 1, 0.7843137, 0, 1,
-1.055372, 0.5557387, 0.01841356, 1, 0.7921569, 0, 1,
-1.051816, -1.32804, -2.412834, 1, 0.7960784, 0, 1,
-1.047497, -0.3897196, -1.743915, 1, 0.8039216, 0, 1,
-1.045548, -0.08939918, -2.850731, 1, 0.8117647, 0, 1,
-1.044221, 0.6724437, -1.238623, 1, 0.8156863, 0, 1,
-1.043078, -0.2406363, -0.8528256, 1, 0.8235294, 0, 1,
-1.040605, 1.759724, -1.89317, 1, 0.827451, 0, 1,
-1.036526, 0.7094299, -0.6939472, 1, 0.8352941, 0, 1,
-1.033242, -1.291689, -3.269948, 1, 0.8392157, 0, 1,
-1.023009, -2.08594, -4.185971, 1, 0.8470588, 0, 1,
-1.022635, -0.009726825, -1.06287, 1, 0.8509804, 0, 1,
-1.016693, 0.6139472, -0.5508223, 1, 0.8588235, 0, 1,
-1.011237, 0.04769412, -1.328384, 1, 0.8627451, 0, 1,
-1.007534, -0.1589812, -1.3965, 1, 0.8705882, 0, 1,
-1.005893, -1.145051, -3.44821, 1, 0.8745098, 0, 1,
-1.004826, 0.1630931, -0.07911289, 1, 0.8823529, 0, 1,
-1.003279, 1.513992, 0.1660078, 1, 0.8862745, 0, 1,
-1.002695, 1.101503, -0.202436, 1, 0.8941177, 0, 1,
-1.00055, 1.218901, 0.4962144, 1, 0.8980392, 0, 1,
-0.9910744, 0.7974245, -1.24081, 1, 0.9058824, 0, 1,
-0.9905853, -0.8546013, -3.672351, 1, 0.9137255, 0, 1,
-0.9873058, -0.8728669, -2.819057, 1, 0.9176471, 0, 1,
-0.9787341, -0.003160803, -3.738411, 1, 0.9254902, 0, 1,
-0.9733387, 1.760634, 1.599043, 1, 0.9294118, 0, 1,
-0.9732188, -1.098605, -2.565807, 1, 0.9372549, 0, 1,
-0.9728292, -0.9329156, -3.443411, 1, 0.9411765, 0, 1,
-0.9726631, -1.359728, -0.8687284, 1, 0.9490196, 0, 1,
-0.9712605, 0.08639795, -2.698767, 1, 0.9529412, 0, 1,
-0.9688334, 1.433676, -1.95689, 1, 0.9607843, 0, 1,
-0.9643083, -1.523741, -3.878301, 1, 0.9647059, 0, 1,
-0.9623955, -0.5675553, -2.285981, 1, 0.972549, 0, 1,
-0.9590674, -1.684632, -2.567645, 1, 0.9764706, 0, 1,
-0.9583625, -0.6373754, -1.250877, 1, 0.9843137, 0, 1,
-0.9545534, 0.425585, -1.48129, 1, 0.9882353, 0, 1,
-0.95445, -0.9892472, -1.642293, 1, 0.9960784, 0, 1,
-0.9475769, 0.6049928, -1.734678, 0.9960784, 1, 0, 1,
-0.9364819, -0.3636633, -3.294994, 0.9921569, 1, 0, 1,
-0.9326515, 0.255017, -1.92575, 0.9843137, 1, 0, 1,
-0.9310584, -0.2536281, -0.1664817, 0.9803922, 1, 0, 1,
-0.9235253, 1.29915, 0.3325367, 0.972549, 1, 0, 1,
-0.9177592, 0.9954242, -1.81489, 0.9686275, 1, 0, 1,
-0.9173918, 1.323125, -3.221721, 0.9607843, 1, 0, 1,
-0.9134005, 0.7593523, -0.8984045, 0.9568627, 1, 0, 1,
-0.9030634, 1.236209, -0.4611285, 0.9490196, 1, 0, 1,
-0.8999137, -0.2431419, -1.20772, 0.945098, 1, 0, 1,
-0.8938054, -0.2583568, -2.620725, 0.9372549, 1, 0, 1,
-0.8876715, 0.08322302, -0.5438183, 0.9333333, 1, 0, 1,
-0.8851286, 0.09490231, -1.620875, 0.9254902, 1, 0, 1,
-0.8789847, -0.4408493, -0.1597182, 0.9215686, 1, 0, 1,
-0.8783478, -1.916228, -1.668375, 0.9137255, 1, 0, 1,
-0.8757602, -0.8014541, -3.26783, 0.9098039, 1, 0, 1,
-0.8738059, 1.197214, 0.415714, 0.9019608, 1, 0, 1,
-0.8653385, -0.5628782, -1.416953, 0.8941177, 1, 0, 1,
-0.862797, -0.8533392, -2.037092, 0.8901961, 1, 0, 1,
-0.8603457, -0.4454062, -0.7764674, 0.8823529, 1, 0, 1,
-0.8567864, -0.5071415, -2.671568, 0.8784314, 1, 0, 1,
-0.8535439, -0.4762322, -2.492158, 0.8705882, 1, 0, 1,
-0.8534153, -0.2310355, -1.407297, 0.8666667, 1, 0, 1,
-0.8531275, 1.124122, -0.797295, 0.8588235, 1, 0, 1,
-0.851707, -0.4149761, -3.1975, 0.854902, 1, 0, 1,
-0.844101, -0.3097984, -2.12173, 0.8470588, 1, 0, 1,
-0.8422385, 0.733068, -1.545597, 0.8431373, 1, 0, 1,
-0.8374566, -0.2421887, -3.78386, 0.8352941, 1, 0, 1,
-0.8318829, -0.05351797, -1.144787, 0.8313726, 1, 0, 1,
-0.8307104, 1.281122, 0.6240889, 0.8235294, 1, 0, 1,
-0.8288168, 0.2305305, -1.756245, 0.8196079, 1, 0, 1,
-0.8270743, 0.128738, -2.05815, 0.8117647, 1, 0, 1,
-0.8139538, -0.6321285, -2.11532, 0.8078431, 1, 0, 1,
-0.811235, 0.4309615, -1.314687, 0.8, 1, 0, 1,
-0.8076699, 1.329232, -0.9457958, 0.7921569, 1, 0, 1,
-0.8046825, -0.05483744, -1.416227, 0.7882353, 1, 0, 1,
-0.7963235, -2.593574, -3.303084, 0.7803922, 1, 0, 1,
-0.7960415, 0.5552462, -1.884212, 0.7764706, 1, 0, 1,
-0.7903254, 0.4160272, -0.8556042, 0.7686275, 1, 0, 1,
-0.7890162, 0.5473097, -0.348578, 0.7647059, 1, 0, 1,
-0.7845939, 0.5022099, -1.594351, 0.7568628, 1, 0, 1,
-0.7811985, -0.6955264, -2.343761, 0.7529412, 1, 0, 1,
-0.7788447, 0.5241953, -0.2499555, 0.7450981, 1, 0, 1,
-0.7786333, -0.2271294, -1.63266, 0.7411765, 1, 0, 1,
-0.7775129, -0.8331328, -2.484947, 0.7333333, 1, 0, 1,
-0.7744641, -0.3168273, -3.978085, 0.7294118, 1, 0, 1,
-0.7742181, 0.7814492, -1.77178, 0.7215686, 1, 0, 1,
-0.7742144, 0.2960568, -0.8040786, 0.7176471, 1, 0, 1,
-0.7736061, -0.5549867, -0.1634198, 0.7098039, 1, 0, 1,
-0.77188, -0.01781753, -0.5436432, 0.7058824, 1, 0, 1,
-0.7634521, -0.03790945, -0.1432249, 0.6980392, 1, 0, 1,
-0.7627531, 0.117064, -1.166923, 0.6901961, 1, 0, 1,
-0.7514006, 0.5511162, -0.3102073, 0.6862745, 1, 0, 1,
-0.7512641, -1.161649, -3.079041, 0.6784314, 1, 0, 1,
-0.7496665, -0.36662, -1.551367, 0.6745098, 1, 0, 1,
-0.7490709, -0.009885443, -2.981727, 0.6666667, 1, 0, 1,
-0.7484841, -0.3885915, -1.039479, 0.6627451, 1, 0, 1,
-0.7399508, -0.3616803, -2.801629, 0.654902, 1, 0, 1,
-0.73002, 0.6385452, -1.848182, 0.6509804, 1, 0, 1,
-0.7291448, -1.045198, -2.30303, 0.6431373, 1, 0, 1,
-0.7280362, -0.7478591, -2.940871, 0.6392157, 1, 0, 1,
-0.7246135, 0.02807406, -1.56603, 0.6313726, 1, 0, 1,
-0.7199394, -0.6292244, -0.8971017, 0.627451, 1, 0, 1,
-0.703028, 0.01758934, -0.1549746, 0.6196079, 1, 0, 1,
-0.7019124, -0.08433798, -2.893649, 0.6156863, 1, 0, 1,
-0.6993782, 0.6688124, -2.374985, 0.6078432, 1, 0, 1,
-0.694289, -1.748772, -3.292127, 0.6039216, 1, 0, 1,
-0.6933647, -0.3824036, -3.453305, 0.5960785, 1, 0, 1,
-0.6918957, 0.8670422, 1.224964, 0.5882353, 1, 0, 1,
-0.6879801, -0.1765843, -2.195755, 0.5843138, 1, 0, 1,
-0.6852292, 0.3638148, -1.03562, 0.5764706, 1, 0, 1,
-0.6849799, -1.212788, -3.225724, 0.572549, 1, 0, 1,
-0.6844093, 0.2867195, -0.3481986, 0.5647059, 1, 0, 1,
-0.6777452, 0.8910993, -1.077394, 0.5607843, 1, 0, 1,
-0.6694484, -0.8105879, -2.441614, 0.5529412, 1, 0, 1,
-0.6636721, 0.2052203, -0.8506812, 0.5490196, 1, 0, 1,
-0.6628661, 0.2672791, -1.590279, 0.5411765, 1, 0, 1,
-0.6604938, -0.1543711, -1.359915, 0.5372549, 1, 0, 1,
-0.6579666, -0.4267846, -3.791313, 0.5294118, 1, 0, 1,
-0.6573285, 0.9814033, -0.6453058, 0.5254902, 1, 0, 1,
-0.6554143, 0.588648, -0.4179243, 0.5176471, 1, 0, 1,
-0.6471251, 1.029514, 0.4306704, 0.5137255, 1, 0, 1,
-0.6448649, 0.2546279, -2.28719, 0.5058824, 1, 0, 1,
-0.644202, 0.2451441, -0.9131697, 0.5019608, 1, 0, 1,
-0.6401458, 0.03656882, -1.811839, 0.4941176, 1, 0, 1,
-0.6391361, -1.010941, -0.9456504, 0.4862745, 1, 0, 1,
-0.6382655, -1.18388, -1.978509, 0.4823529, 1, 0, 1,
-0.638007, 0.0984297, -1.567948, 0.4745098, 1, 0, 1,
-0.636804, 0.2790899, -3.021877, 0.4705882, 1, 0, 1,
-0.6351339, -1.869345, -4.253246, 0.4627451, 1, 0, 1,
-0.6333485, 0.8384694, -0.895828, 0.4588235, 1, 0, 1,
-0.6285856, 0.6274344, -2.822639, 0.4509804, 1, 0, 1,
-0.6276779, -0.9021556, -4.455009, 0.4470588, 1, 0, 1,
-0.6271406, -1.506031, -0.4874458, 0.4392157, 1, 0, 1,
-0.6217508, 0.3019887, -1.558562, 0.4352941, 1, 0, 1,
-0.6168102, 0.005535106, -2.251025, 0.427451, 1, 0, 1,
-0.6124259, 1.110831, -1.553329, 0.4235294, 1, 0, 1,
-0.6108239, 0.1690814, -0.3433481, 0.4156863, 1, 0, 1,
-0.6106267, 0.7129689, 1.199567, 0.4117647, 1, 0, 1,
-0.6085397, -0.4241421, -2.979585, 0.4039216, 1, 0, 1,
-0.6077926, -0.9611548, -2.175533, 0.3960784, 1, 0, 1,
-0.6074675, -0.7912983, -1.337094, 0.3921569, 1, 0, 1,
-0.6049647, 1.032461, -1.891947, 0.3843137, 1, 0, 1,
-0.6025029, 1.918465, 1.570084, 0.3803922, 1, 0, 1,
-0.5993737, 0.9972956, -1.089818, 0.372549, 1, 0, 1,
-0.5891904, 0.3740123, -0.8173813, 0.3686275, 1, 0, 1,
-0.5836384, -0.3420239, -3.543636, 0.3607843, 1, 0, 1,
-0.5834244, -0.7281657, -0.9617386, 0.3568628, 1, 0, 1,
-0.5827637, -1.239112, -3.401054, 0.3490196, 1, 0, 1,
-0.5826187, -0.8513072, -1.930556, 0.345098, 1, 0, 1,
-0.5785729, 0.2115872, -0.9080115, 0.3372549, 1, 0, 1,
-0.5752768, -0.7518277, -2.787425, 0.3333333, 1, 0, 1,
-0.568976, 0.717487, -0.1377288, 0.3254902, 1, 0, 1,
-0.565904, -0.3079235, -1.822007, 0.3215686, 1, 0, 1,
-0.5648943, 0.2334282, -0.3449399, 0.3137255, 1, 0, 1,
-0.5609663, -1.500539, -2.038974, 0.3098039, 1, 0, 1,
-0.5579826, -0.2065395, -0.9691907, 0.3019608, 1, 0, 1,
-0.550782, -0.8139153, -1.525791, 0.2941177, 1, 0, 1,
-0.5407943, -0.4804285, -3.930263, 0.2901961, 1, 0, 1,
-0.5374231, -0.7385877, -1.432008, 0.282353, 1, 0, 1,
-0.5356442, -1.531197, -4.439372, 0.2784314, 1, 0, 1,
-0.5345209, -0.7381597, -3.737087, 0.2705882, 1, 0, 1,
-0.5337559, -0.1478473, -0.6090927, 0.2666667, 1, 0, 1,
-0.5333375, 0.5677714, 0.6628995, 0.2588235, 1, 0, 1,
-0.5298452, 0.7245927, -2.302011, 0.254902, 1, 0, 1,
-0.5293264, 0.04866084, -3.053126, 0.2470588, 1, 0, 1,
-0.5274351, -0.9691672, -3.473905, 0.2431373, 1, 0, 1,
-0.5259022, 0.3764935, -0.7293496, 0.2352941, 1, 0, 1,
-0.5185987, -0.0614145, -2.851141, 0.2313726, 1, 0, 1,
-0.5178646, 0.985889, 0.3139552, 0.2235294, 1, 0, 1,
-0.5114469, -0.2679667, -2.10229, 0.2196078, 1, 0, 1,
-0.5110727, -0.464553, -1.911441, 0.2117647, 1, 0, 1,
-0.5039487, -0.6555083, -2.707031, 0.2078431, 1, 0, 1,
-0.4992453, 0.1136816, 0.3144288, 0.2, 1, 0, 1,
-0.4964543, 0.7390196, 2.297359, 0.1921569, 1, 0, 1,
-0.4935478, 1.528054, 0.689324, 0.1882353, 1, 0, 1,
-0.4908509, -1.020979, -2.604143, 0.1803922, 1, 0, 1,
-0.4834824, -0.9895728, -3.376885, 0.1764706, 1, 0, 1,
-0.4832818, 0.1346714, -1.490409, 0.1686275, 1, 0, 1,
-0.4824775, 0.2534595, 9.655357e-05, 0.1647059, 1, 0, 1,
-0.4817418, -0.4964132, -3.521701, 0.1568628, 1, 0, 1,
-0.4814478, 0.02546003, -1.291208, 0.1529412, 1, 0, 1,
-0.4805559, 1.521599, -0.04966318, 0.145098, 1, 0, 1,
-0.4804343, 0.5550049, -0.4140998, 0.1411765, 1, 0, 1,
-0.479404, -0.8758804, -4.009889, 0.1333333, 1, 0, 1,
-0.4767812, 0.2510929, -3.422678, 0.1294118, 1, 0, 1,
-0.4763232, 0.7880324, -2.14847, 0.1215686, 1, 0, 1,
-0.4759049, -0.09990004, -1.717448, 0.1176471, 1, 0, 1,
-0.474577, 0.774203, -2.786065, 0.1098039, 1, 0, 1,
-0.4734353, -0.01630146, -1.328386, 0.1058824, 1, 0, 1,
-0.4661417, 0.8814012, 0.455164, 0.09803922, 1, 0, 1,
-0.4623243, -1.141714, -3.104496, 0.09019608, 1, 0, 1,
-0.4604575, -0.6761817, -3.065711, 0.08627451, 1, 0, 1,
-0.4588175, -2.072229, -1.70861, 0.07843138, 1, 0, 1,
-0.4579376, 0.4423778, -0.05987378, 0.07450981, 1, 0, 1,
-0.4565089, 2.267217, 0.2469023, 0.06666667, 1, 0, 1,
-0.4507654, -0.2608671, -1.07922, 0.0627451, 1, 0, 1,
-0.4437341, -1.654667, -3.565805, 0.05490196, 1, 0, 1,
-0.4425222, -0.3108734, -1.698441, 0.05098039, 1, 0, 1,
-0.4411647, -1.093647, -3.80228, 0.04313726, 1, 0, 1,
-0.4396179, 1.097015, 0.299635, 0.03921569, 1, 0, 1,
-0.4387376, -0.1389522, -2.125598, 0.03137255, 1, 0, 1,
-0.4325043, 0.5751873, -1.545567, 0.02745098, 1, 0, 1,
-0.4281376, -0.3823345, -2.600876, 0.01960784, 1, 0, 1,
-0.4224998, 0.05834644, -1.531637, 0.01568628, 1, 0, 1,
-0.4208181, -0.9035435, -3.085118, 0.007843138, 1, 0, 1,
-0.4164088, -1.231522, -1.835957, 0.003921569, 1, 0, 1,
-0.4159829, -0.70126, -1.501643, 0, 1, 0.003921569, 1,
-0.41096, -0.6019887, -2.949838, 0, 1, 0.01176471, 1,
-0.4108309, -1.86669, -2.202008, 0, 1, 0.01568628, 1,
-0.4070035, -0.1846179, -0.8853968, 0, 1, 0.02352941, 1,
-0.4036684, -0.002234327, -1.44425, 0, 1, 0.02745098, 1,
-0.4011857, -0.03675992, -2.375723, 0, 1, 0.03529412, 1,
-0.3983133, 0.9415836, 0.3031992, 0, 1, 0.03921569, 1,
-0.3957638, -0.01350449, 0.703797, 0, 1, 0.04705882, 1,
-0.3956962, 0.3477707, -1.153847, 0, 1, 0.05098039, 1,
-0.392038, 0.4099617, -0.8516797, 0, 1, 0.05882353, 1,
-0.3896358, 0.7821513, -0.4833803, 0, 1, 0.0627451, 1,
-0.3887395, -1.461717, -2.602844, 0, 1, 0.07058824, 1,
-0.3864906, 0.03302023, -0.6644013, 0, 1, 0.07450981, 1,
-0.3811225, -0.3629902, -1.83326, 0, 1, 0.08235294, 1,
-0.3790541, -0.03683044, -2.987857, 0, 1, 0.08627451, 1,
-0.3783627, -0.596645, -1.593384, 0, 1, 0.09411765, 1,
-0.3756619, 0.168647, -0.5797973, 0, 1, 0.1019608, 1,
-0.3753859, 0.6670901, 0.1727749, 0, 1, 0.1058824, 1,
-0.3711063, 0.01618511, -0.604798, 0, 1, 0.1137255, 1,
-0.3710868, -0.02833363, -2.181918, 0, 1, 0.1176471, 1,
-0.3706787, 2.054105, -1.104753, 0, 1, 0.1254902, 1,
-0.370122, -0.8876216, -2.171468, 0, 1, 0.1294118, 1,
-0.3646303, 0.8034964, -0.9313874, 0, 1, 0.1372549, 1,
-0.3626094, 0.5574567, -0.9529195, 0, 1, 0.1411765, 1,
-0.3620229, 1.078537, 0.1366246, 0, 1, 0.1490196, 1,
-0.3603211, -0.3041448, -3.614883, 0, 1, 0.1529412, 1,
-0.3579825, 1.377133, 0.2459715, 0, 1, 0.1607843, 1,
-0.3568625, -0.8280145, -3.215712, 0, 1, 0.1647059, 1,
-0.3487933, 0.4113465, -1.043968, 0, 1, 0.172549, 1,
-0.3465519, 0.4840719, -0.2699281, 0, 1, 0.1764706, 1,
-0.341293, -0.6236183, -5.14722, 0, 1, 0.1843137, 1,
-0.33992, -0.2269345, -2.997866, 0, 1, 0.1882353, 1,
-0.3364262, -0.9194546, -3.627776, 0, 1, 0.1960784, 1,
-0.3335848, 1.010126, 0.2428059, 0, 1, 0.2039216, 1,
-0.319609, 2.184922, -0.7311902, 0, 1, 0.2078431, 1,
-0.3187287, -0.4088056, -2.733492, 0, 1, 0.2156863, 1,
-0.31183, 1.113357, 0.3185687, 0, 1, 0.2196078, 1,
-0.3106386, 0.1706573, -1.364606, 0, 1, 0.227451, 1,
-0.3059902, 0.5611203, -2.09402, 0, 1, 0.2313726, 1,
-0.3057462, 1.416526, -1.03654, 0, 1, 0.2392157, 1,
-0.302269, 0.3156862, 0.8591015, 0, 1, 0.2431373, 1,
-0.2960753, 1.089382, 0.7202105, 0, 1, 0.2509804, 1,
-0.2928706, -0.6043393, -3.239049, 0, 1, 0.254902, 1,
-0.2892233, -1.505714, -4.080697, 0, 1, 0.2627451, 1,
-0.2885762, -0.8061127, -2.850017, 0, 1, 0.2666667, 1,
-0.286058, -1.109828, -2.366033, 0, 1, 0.2745098, 1,
-0.2849825, -0.3007868, -1.57156, 0, 1, 0.2784314, 1,
-0.2825586, 0.3004566, -0.7443368, 0, 1, 0.2862745, 1,
-0.2797475, 1.611799, 0.03101816, 0, 1, 0.2901961, 1,
-0.279681, -1.460045, -2.93816, 0, 1, 0.2980392, 1,
-0.2793337, 1.050735, 0.4315906, 0, 1, 0.3058824, 1,
-0.2790433, 1.229339, -0.7404366, 0, 1, 0.3098039, 1,
-0.2774127, -1.45743, -3.742723, 0, 1, 0.3176471, 1,
-0.274567, 2.355613, -1.31346, 0, 1, 0.3215686, 1,
-0.2738031, 0.1653848, 0.05586013, 0, 1, 0.3294118, 1,
-0.2636604, -0.1878516, -2.334043, 0, 1, 0.3333333, 1,
-0.2622741, 0.7745904, -1.940466, 0, 1, 0.3411765, 1,
-0.2575436, -0.2119403, -1.420518, 0, 1, 0.345098, 1,
-0.2566624, -0.8120468, -3.391392, 0, 1, 0.3529412, 1,
-0.2564108, -0.2486527, -3.832934, 0, 1, 0.3568628, 1,
-0.2513249, 0.477084, -0.770097, 0, 1, 0.3647059, 1,
-0.2506033, 1.666767, -0.9118974, 0, 1, 0.3686275, 1,
-0.248762, -0.755404, -2.888155, 0, 1, 0.3764706, 1,
-0.2453907, 0.5529319, -1.003762, 0, 1, 0.3803922, 1,
-0.243019, 1.047529, -1.093376, 0, 1, 0.3882353, 1,
-0.2425991, 0.7094159, 0.182661, 0, 1, 0.3921569, 1,
-0.2418693, -2.248016, -1.205221, 0, 1, 0.4, 1,
-0.2374268, -0.5424539, -1.293523, 0, 1, 0.4078431, 1,
-0.2358044, -1.929008, -2.368242, 0, 1, 0.4117647, 1,
-0.2348125, -0.06667, -1.998943, 0, 1, 0.4196078, 1,
-0.2275571, -0.1417694, -2.253428, 0, 1, 0.4235294, 1,
-0.2260701, 0.08290636, -1.902295, 0, 1, 0.4313726, 1,
-0.2213412, 0.1496803, -0.9950709, 0, 1, 0.4352941, 1,
-0.2208281, 0.2551192, -2.657757, 0, 1, 0.4431373, 1,
-0.2197406, 0.217662, -0.7879516, 0, 1, 0.4470588, 1,
-0.2173894, -0.08896112, -1.984564, 0, 1, 0.454902, 1,
-0.2166606, 0.6634545, -0.01189458, 0, 1, 0.4588235, 1,
-0.2159531, -0.5418487, -2.681324, 0, 1, 0.4666667, 1,
-0.215189, 0.6101723, -1.515348, 0, 1, 0.4705882, 1,
-0.2119693, -0.2388514, -5.252593, 0, 1, 0.4784314, 1,
-0.208049, 1.149781, -1.013585, 0, 1, 0.4823529, 1,
-0.2009039, -1.078819, -3.498209, 0, 1, 0.4901961, 1,
-0.2006809, -0.1972341, -4.024693, 0, 1, 0.4941176, 1,
-0.1995223, -1.608576, -3.913711, 0, 1, 0.5019608, 1,
-0.1989416, 0.02089138, -0.8972313, 0, 1, 0.509804, 1,
-0.1984313, -0.02663942, -0.3855267, 0, 1, 0.5137255, 1,
-0.1971111, -0.320402, -3.66419, 0, 1, 0.5215687, 1,
-0.1939472, 0.6554117, 0.8052725, 0, 1, 0.5254902, 1,
-0.1916635, -0.5455678, -3.440363, 0, 1, 0.5333334, 1,
-0.1822024, -0.3279288, -3.368452, 0, 1, 0.5372549, 1,
-0.181202, 1.242482, -0.4349916, 0, 1, 0.5450981, 1,
-0.1781776, -0.5308658, -3.434451, 0, 1, 0.5490196, 1,
-0.1780173, 0.4496813, -1.225424, 0, 1, 0.5568628, 1,
-0.1644964, -0.02053115, -2.782611, 0, 1, 0.5607843, 1,
-0.1640335, 0.4614747, -1.139557, 0, 1, 0.5686275, 1,
-0.1635747, -0.2916357, -3.568866, 0, 1, 0.572549, 1,
-0.1611593, -1.243245, -4.087973, 0, 1, 0.5803922, 1,
-0.1608633, 0.06952962, -3.059371, 0, 1, 0.5843138, 1,
-0.1599252, 0.3695228, -0.04619372, 0, 1, 0.5921569, 1,
-0.1597807, -1.90739, -2.221354, 0, 1, 0.5960785, 1,
-0.155611, 0.1137633, 0.105134, 0, 1, 0.6039216, 1,
-0.1548754, 0.4418211, -1.589213, 0, 1, 0.6117647, 1,
-0.1406857, 0.9280916, -1.232326, 0, 1, 0.6156863, 1,
-0.1361384, 0.07656902, -1.012219, 0, 1, 0.6235294, 1,
-0.1315498, 0.3232212, -0.8575956, 0, 1, 0.627451, 1,
-0.1315311, 0.5067083, 0.7542396, 0, 1, 0.6352941, 1,
-0.1308433, -1.826649, -3.044113, 0, 1, 0.6392157, 1,
-0.1296296, 2.017415, -0.6776769, 0, 1, 0.6470588, 1,
-0.124218, -1.035274, -4.090252, 0, 1, 0.6509804, 1,
-0.122136, -0.1401792, -1.941832, 0, 1, 0.6588235, 1,
-0.1217843, 0.498127, -1.624689, 0, 1, 0.6627451, 1,
-0.0954747, -0.06548818, -3.154707, 0, 1, 0.6705883, 1,
-0.0942753, 0.7960178, -0.6130015, 0, 1, 0.6745098, 1,
-0.09422311, 0.4697053, 0.9213347, 0, 1, 0.682353, 1,
-0.09417816, 0.1533791, 0.3494168, 0, 1, 0.6862745, 1,
-0.09393725, -0.5567714, -1.250185, 0, 1, 0.6941177, 1,
-0.09218284, -1.62819, -3.426151, 0, 1, 0.7019608, 1,
-0.0888203, 0.1351406, -0.173273, 0, 1, 0.7058824, 1,
-0.08745924, -1.195849, -2.82941, 0, 1, 0.7137255, 1,
-0.08287005, 0.3019774, -0.7815182, 0, 1, 0.7176471, 1,
-0.08286122, -1.304116, -3.262344, 0, 1, 0.7254902, 1,
-0.08127604, -0.2858723, -3.14554, 0, 1, 0.7294118, 1,
-0.08076646, -1.024107, -4.088558, 0, 1, 0.7372549, 1,
-0.07699944, -0.1472601, -2.702097, 0, 1, 0.7411765, 1,
-0.07690378, -1.762926, -3.573115, 0, 1, 0.7490196, 1,
-0.07670189, -0.02467142, -1.052517, 0, 1, 0.7529412, 1,
-0.0764431, -0.9340722, -3.726145, 0, 1, 0.7607843, 1,
-0.06698518, -0.9196929, -4.145527, 0, 1, 0.7647059, 1,
-0.06652829, -0.1986457, -2.87347, 0, 1, 0.772549, 1,
-0.06199264, -1.067022, -2.729894, 0, 1, 0.7764706, 1,
-0.06082525, -0.2776134, -2.750851, 0, 1, 0.7843137, 1,
-0.060772, 2.017035, 0.6730834, 0, 1, 0.7882353, 1,
-0.05778594, -0.467074, -3.589016, 0, 1, 0.7960784, 1,
-0.05028538, 0.2963755, 0.4680639, 0, 1, 0.8039216, 1,
-0.04620158, -0.02983429, -0.3957507, 0, 1, 0.8078431, 1,
-0.04539626, 0.6726487, -1.631055, 0, 1, 0.8156863, 1,
-0.04270876, -0.5769626, -2.795149, 0, 1, 0.8196079, 1,
-0.0417342, -0.6519343, -3.144439, 0, 1, 0.827451, 1,
-0.04104488, 0.5232041, -1.104614, 0, 1, 0.8313726, 1,
-0.04008124, 2.657578, -0.233164, 0, 1, 0.8392157, 1,
-0.03950152, 0.4522182, -0.8839567, 0, 1, 0.8431373, 1,
-0.03885446, -1.035353, -1.211971, 0, 1, 0.8509804, 1,
-0.03861033, 0.5231987, -2.046657, 0, 1, 0.854902, 1,
-0.03856288, 0.2820371, -0.7144449, 0, 1, 0.8627451, 1,
-0.02839642, -1.359044, -3.861665, 0, 1, 0.8666667, 1,
-0.02564879, 0.2801483, 1.197613, 0, 1, 0.8745098, 1,
-0.0189372, -0.9475526, -2.852355, 0, 1, 0.8784314, 1,
-0.01255189, -0.4784319, -4.270018, 0, 1, 0.8862745, 1,
-0.003491634, 1.139819, -0.04744086, 0, 1, 0.8901961, 1,
-3.452044e-05, 0.3727078, 0.4236147, 0, 1, 0.8980392, 1,
0.001450989, 2.148371, 1.56535, 0, 1, 0.9058824, 1,
0.002501166, 1.664535, -0.9815415, 0, 1, 0.9098039, 1,
0.005152842, -2.136774, 1.347134, 0, 1, 0.9176471, 1,
0.006168202, -1.328044, 3.715002, 0, 1, 0.9215686, 1,
0.02821155, -0.6722751, 4.789435, 0, 1, 0.9294118, 1,
0.03107146, 0.758848, 0.9155202, 0, 1, 0.9333333, 1,
0.03176953, -0.5655755, 1.485444, 0, 1, 0.9411765, 1,
0.03776779, 0.5708553, 1.94248, 0, 1, 0.945098, 1,
0.03951, -0.1067748, 1.416263, 0, 1, 0.9529412, 1,
0.03959598, -0.768632, 4.760174, 0, 1, 0.9568627, 1,
0.03960539, 0.6838354, 0.7498584, 0, 1, 0.9647059, 1,
0.04211115, 0.4252809, 1.263361, 0, 1, 0.9686275, 1,
0.04396082, -0.2995274, 3.475301, 0, 1, 0.9764706, 1,
0.0462911, 0.8318486, 0.01438429, 0, 1, 0.9803922, 1,
0.04660414, 2.709022, -1.61511, 0, 1, 0.9882353, 1,
0.04796892, -0.05710925, 3.896439, 0, 1, 0.9921569, 1,
0.04860112, -0.7729169, 3.416438, 0, 1, 1, 1,
0.04866497, -1.271241, 3.100542, 0, 0.9921569, 1, 1,
0.05155646, 0.5332596, -1.422659, 0, 0.9882353, 1, 1,
0.05178342, 0.2375314, -0.666344, 0, 0.9803922, 1, 1,
0.05212323, 0.5430998, -0.006772859, 0, 0.9764706, 1, 1,
0.05529153, 0.1318535, 0.2968518, 0, 0.9686275, 1, 1,
0.05630665, 0.1726528, 0.4460619, 0, 0.9647059, 1, 1,
0.05762419, -2.133606, 2.288804, 0, 0.9568627, 1, 1,
0.06612477, 1.203744, 0.9148555, 0, 0.9529412, 1, 1,
0.07825385, 1.131927, 0.9083281, 0, 0.945098, 1, 1,
0.07970076, -0.2235255, 2.186471, 0, 0.9411765, 1, 1,
0.08183724, -0.9786847, 3.453754, 0, 0.9333333, 1, 1,
0.08195316, 0.06869245, 0.9920986, 0, 0.9294118, 1, 1,
0.08282936, 0.07716922, 1.683981, 0, 0.9215686, 1, 1,
0.08437325, -0.7394346, 5.117063, 0, 0.9176471, 1, 1,
0.08674914, 0.7905402, 1.650727, 0, 0.9098039, 1, 1,
0.08676378, -0.2002974, 2.199516, 0, 0.9058824, 1, 1,
0.09097475, 1.296192, 1.716254, 0, 0.8980392, 1, 1,
0.09604761, 2.82666, -0.8565163, 0, 0.8901961, 1, 1,
0.09794392, -1.171265, 3.643301, 0, 0.8862745, 1, 1,
0.09813746, 0.5643812, 0.02809014, 0, 0.8784314, 1, 1,
0.1020946, -0.2750725, 4.144001, 0, 0.8745098, 1, 1,
0.1125087, 0.9553344, 0.1438654, 0, 0.8666667, 1, 1,
0.1159585, -4.261342, 4.75491, 0, 0.8627451, 1, 1,
0.1206295, 0.1535576, 0.9741795, 0, 0.854902, 1, 1,
0.1251285, -1.850803, 1.771359, 0, 0.8509804, 1, 1,
0.1306586, -1.37026, 3.715905, 0, 0.8431373, 1, 1,
0.1347807, 0.2418001, 1.127691, 0, 0.8392157, 1, 1,
0.1353917, 0.4515153, 1.404359, 0, 0.8313726, 1, 1,
0.1390638, 0.189007, 0.73918, 0, 0.827451, 1, 1,
0.1398738, 1.256268, 0.1239628, 0, 0.8196079, 1, 1,
0.1439959, 0.5219675, 0.9504014, 0, 0.8156863, 1, 1,
0.1458031, 0.1172863, 0.340243, 0, 0.8078431, 1, 1,
0.147039, -0.6143112, 3.300091, 0, 0.8039216, 1, 1,
0.1500314, 1.715372, 0.5946409, 0, 0.7960784, 1, 1,
0.1556126, -0.5849194, 3.508219, 0, 0.7882353, 1, 1,
0.1600338, -0.5331085, 2.513501, 0, 0.7843137, 1, 1,
0.1614432, 0.5109352, 2.571836, 0, 0.7764706, 1, 1,
0.1628464, -0.1581918, 1.724547, 0, 0.772549, 1, 1,
0.167112, 0.7073238, -1.539484, 0, 0.7647059, 1, 1,
0.1673067, 0.6312383, -1.778564, 0, 0.7607843, 1, 1,
0.1712526, 1.163429, 1.332156, 0, 0.7529412, 1, 1,
0.1737153, -0.08013928, 1.554675, 0, 0.7490196, 1, 1,
0.174583, 0.0698887, 0.9895062, 0, 0.7411765, 1, 1,
0.1789524, 0.9854284, -0.1519181, 0, 0.7372549, 1, 1,
0.1789948, 0.566348, 0.6519352, 0, 0.7294118, 1, 1,
0.1835303, -2.367069, 1.90611, 0, 0.7254902, 1, 1,
0.1865127, -0.7297811, 2.907446, 0, 0.7176471, 1, 1,
0.192164, -1.157548, 2.653952, 0, 0.7137255, 1, 1,
0.1932854, 2.487592, 0.6980497, 0, 0.7058824, 1, 1,
0.1940071, 1.118141, -0.2580402, 0, 0.6980392, 1, 1,
0.1992001, -0.3198971, 1.501696, 0, 0.6941177, 1, 1,
0.1992866, -0.13128, 3.185903, 0, 0.6862745, 1, 1,
0.1998071, 0.1582617, 2.158127, 0, 0.682353, 1, 1,
0.2042287, 0.5647191, 0.2774655, 0, 0.6745098, 1, 1,
0.2045893, -0.9961604, 4.108607, 0, 0.6705883, 1, 1,
0.2070155, 0.6139129, -1.648037, 0, 0.6627451, 1, 1,
0.2144012, 0.3242216, 0.7703387, 0, 0.6588235, 1, 1,
0.2144047, -1.077055, 1.865459, 0, 0.6509804, 1, 1,
0.2159304, -1.033912, 3.397068, 0, 0.6470588, 1, 1,
0.2165691, -1.113188, 5.022735, 0, 0.6392157, 1, 1,
0.2226743, -1.030874, 3.986429, 0, 0.6352941, 1, 1,
0.2227698, 0.01541711, 2.322619, 0, 0.627451, 1, 1,
0.2239638, 0.4918344, -0.06518731, 0, 0.6235294, 1, 1,
0.2248889, -0.05242735, 0.6006579, 0, 0.6156863, 1, 1,
0.2286331, 1.614406, 0.7694906, 0, 0.6117647, 1, 1,
0.2298225, 1.007599, -0.3531355, 0, 0.6039216, 1, 1,
0.2311965, -1.038131, 1.92498, 0, 0.5960785, 1, 1,
0.2444562, 0.5282056, 0.9996013, 0, 0.5921569, 1, 1,
0.2448876, 0.197911, 1.779962, 0, 0.5843138, 1, 1,
0.2494769, 0.6819307, -1.852132, 0, 0.5803922, 1, 1,
0.2512081, 2.897467, -0.6630685, 0, 0.572549, 1, 1,
0.2545553, -1.077758, 4.00575, 0, 0.5686275, 1, 1,
0.2611775, 0.560366, -0.2677167, 0, 0.5607843, 1, 1,
0.2647133, 1.196662, 0.982887, 0, 0.5568628, 1, 1,
0.2654437, 0.3714323, 1.038075, 0, 0.5490196, 1, 1,
0.2656887, -0.4326707, 2.401274, 0, 0.5450981, 1, 1,
0.2661055, 2.162055, -0.1473491, 0, 0.5372549, 1, 1,
0.274128, 0.2288932, 2.386768, 0, 0.5333334, 1, 1,
0.277877, -0.2494862, 1.492237, 0, 0.5254902, 1, 1,
0.2799623, -0.3670619, 3.958993, 0, 0.5215687, 1, 1,
0.2815166, -0.270806, 1.038456, 0, 0.5137255, 1, 1,
0.2846876, -1.445147, 2.741984, 0, 0.509804, 1, 1,
0.2935368, 0.100655, 1.936691, 0, 0.5019608, 1, 1,
0.297282, -0.959228, 2.651553, 0, 0.4941176, 1, 1,
0.2981894, -0.0337236, 0.7400135, 0, 0.4901961, 1, 1,
0.2997553, -1.298106, 3.672354, 0, 0.4823529, 1, 1,
0.3014399, -0.1476893, 1.861113, 0, 0.4784314, 1, 1,
0.3019297, -1.630407, 1.977766, 0, 0.4705882, 1, 1,
0.3046071, -1.970559, 1.693281, 0, 0.4666667, 1, 1,
0.3047835, -0.2848613, 4.24753, 0, 0.4588235, 1, 1,
0.3056165, 0.9040418, -0.3482477, 0, 0.454902, 1, 1,
0.3082331, 0.4001629, 0.1520593, 0, 0.4470588, 1, 1,
0.3094504, -1.277066, 2.879139, 0, 0.4431373, 1, 1,
0.3131736, 0.1474027, 0.2291188, 0, 0.4352941, 1, 1,
0.3163296, -0.3119029, 2.983468, 0, 0.4313726, 1, 1,
0.3190031, 0.4947353, 1.32729, 0, 0.4235294, 1, 1,
0.3199711, 0.3803245, 0.370591, 0, 0.4196078, 1, 1,
0.3219901, 1.028406, 1.787966, 0, 0.4117647, 1, 1,
0.3228047, -1.963745, 3.209192, 0, 0.4078431, 1, 1,
0.325768, 0.2129988, 0.5764572, 0, 0.4, 1, 1,
0.3275782, -0.71398, 3.871102, 0, 0.3921569, 1, 1,
0.3287737, -1.468308, 2.970784, 0, 0.3882353, 1, 1,
0.3296739, 1.257585, -0.07006656, 0, 0.3803922, 1, 1,
0.34014, -1.521052, 2.694012, 0, 0.3764706, 1, 1,
0.3423833, 0.7317907, 1.729017, 0, 0.3686275, 1, 1,
0.3486421, 0.4075291, 0.08979519, 0, 0.3647059, 1, 1,
0.3521763, -0.5327301, 2.130632, 0, 0.3568628, 1, 1,
0.3583947, -1.096471, 1.492435, 0, 0.3529412, 1, 1,
0.362702, -0.2510241, 0.9310018, 0, 0.345098, 1, 1,
0.3663298, -1.016315, 2.918885, 0, 0.3411765, 1, 1,
0.369896, 0.2109443, 1.937884, 0, 0.3333333, 1, 1,
0.3750963, 0.5661842, -0.1438306, 0, 0.3294118, 1, 1,
0.3762367, 0.7017092, 1.794588, 0, 0.3215686, 1, 1,
0.3766233, -0.5387058, 2.666455, 0, 0.3176471, 1, 1,
0.3856632, -0.1246429, -0.02787461, 0, 0.3098039, 1, 1,
0.3891138, 0.9430643, 1.779887, 0, 0.3058824, 1, 1,
0.3910012, 0.2353496, 1.227291, 0, 0.2980392, 1, 1,
0.3940929, 0.3056495, -1.195625, 0, 0.2901961, 1, 1,
0.3956431, 1.081144, -0.3643643, 0, 0.2862745, 1, 1,
0.3969012, -1.182486, 3.949786, 0, 0.2784314, 1, 1,
0.3976609, 0.767256, 0.4896593, 0, 0.2745098, 1, 1,
0.3982751, -0.9074227, 1.575773, 0, 0.2666667, 1, 1,
0.3993256, 2.012835, -0.5819916, 0, 0.2627451, 1, 1,
0.4021851, 0.1877059, 0.74884, 0, 0.254902, 1, 1,
0.40596, 1.848177, 0.1824973, 0, 0.2509804, 1, 1,
0.4107129, 0.7375209, 1.003428, 0, 0.2431373, 1, 1,
0.4113281, -1.160348, 2.714065, 0, 0.2392157, 1, 1,
0.414272, 0.06701364, 1.886666, 0, 0.2313726, 1, 1,
0.4163267, 1.380121, 0.4538662, 0, 0.227451, 1, 1,
0.4224713, -0.4334705, 2.608578, 0, 0.2196078, 1, 1,
0.42777, 0.1846433, -0.8760791, 0, 0.2156863, 1, 1,
0.4302383, -1.016099, 2.096051, 0, 0.2078431, 1, 1,
0.4334311, 0.3136452, 0.2639433, 0, 0.2039216, 1, 1,
0.4347402, 0.6055439, -0.9914812, 0, 0.1960784, 1, 1,
0.4394845, 0.53141, 0.2870109, 0, 0.1882353, 1, 1,
0.441594, 0.008416716, 1.615389, 0, 0.1843137, 1, 1,
0.4475912, -0.568715, 4.509368, 0, 0.1764706, 1, 1,
0.4487056, -0.0103511, 1.296918, 0, 0.172549, 1, 1,
0.4521801, 2.304823, 0.4400485, 0, 0.1647059, 1, 1,
0.4548917, -0.4328998, 3.017724, 0, 0.1607843, 1, 1,
0.4575671, 0.7978795, 0.05429262, 0, 0.1529412, 1, 1,
0.4575913, -1.65803, 2.189512, 0, 0.1490196, 1, 1,
0.4602178, 0.0329097, 2.305024, 0, 0.1411765, 1, 1,
0.460267, 0.5710247, 0.9122137, 0, 0.1372549, 1, 1,
0.4621492, -0.9895404, 4.134434, 0, 0.1294118, 1, 1,
0.4633815, -0.316565, 2.341594, 0, 0.1254902, 1, 1,
0.4651209, 0.4101349, 1.557922, 0, 0.1176471, 1, 1,
0.4706543, 0.4330451, 0.3442103, 0, 0.1137255, 1, 1,
0.4722353, -2.003532, 3.84545, 0, 0.1058824, 1, 1,
0.4733584, -0.5861415, 2.623687, 0, 0.09803922, 1, 1,
0.4741315, 0.3627711, 2.09907, 0, 0.09411765, 1, 1,
0.474451, 0.3259072, 0.3783626, 0, 0.08627451, 1, 1,
0.474728, 0.5479091, 1.234869, 0, 0.08235294, 1, 1,
0.4749253, 0.9642352, 0.8935601, 0, 0.07450981, 1, 1,
0.4773808, 0.1061671, 0.09896692, 0, 0.07058824, 1, 1,
0.4845527, 1.408372, 0.1998204, 0, 0.0627451, 1, 1,
0.4868252, -0.206819, 2.96721, 0, 0.05882353, 1, 1,
0.4908189, 1.471775, 2.025966, 0, 0.05098039, 1, 1,
0.4942387, 0.3409464, 1.102733, 0, 0.04705882, 1, 1,
0.4966452, 0.2304432, 0.6674963, 0, 0.03921569, 1, 1,
0.5011381, -0.6399137, 2.03687, 0, 0.03529412, 1, 1,
0.5017963, 0.7843791, 0.3191828, 0, 0.02745098, 1, 1,
0.5027241, 0.4744868, 1.498208, 0, 0.02352941, 1, 1,
0.509389, -0.9187163, 1.486683, 0, 0.01568628, 1, 1,
0.5172977, 0.6634969, 0.1048651, 0, 0.01176471, 1, 1,
0.5173108, 2.490699, 0.4078239, 0, 0.003921569, 1, 1,
0.5177456, 0.07215549, 1.394922, 0.003921569, 0, 1, 1,
0.5188196, -0.07776834, 2.451006, 0.007843138, 0, 1, 1,
0.5202168, 0.1667792, 1.609887, 0.01568628, 0, 1, 1,
0.5212591, -1.112888, 3.136454, 0.01960784, 0, 1, 1,
0.531514, 1.669908, 0.3811458, 0.02745098, 0, 1, 1,
0.532986, -1.319583, 2.490148, 0.03137255, 0, 1, 1,
0.5331655, -0.9154963, 1.890379, 0.03921569, 0, 1, 1,
0.5370258, -0.530658, 2.013958, 0.04313726, 0, 1, 1,
0.5371481, 1.60623, 1.36967, 0.05098039, 0, 1, 1,
0.5376432, 0.7565515, 0.4496914, 0.05490196, 0, 1, 1,
0.5459021, 0.7941915, 1.513679, 0.0627451, 0, 1, 1,
0.5465459, 0.6158933, 1.085687, 0.06666667, 0, 1, 1,
0.5469774, 1.061293, -1.489526, 0.07450981, 0, 1, 1,
0.5475641, -0.1096385, 3.489928, 0.07843138, 0, 1, 1,
0.5478125, 0.9961365, -0.2788529, 0.08627451, 0, 1, 1,
0.5524208, 1.494972, -0.1886841, 0.09019608, 0, 1, 1,
0.553948, 0.3192725, 0.7185474, 0.09803922, 0, 1, 1,
0.5562181, -0.6938347, 2.083465, 0.1058824, 0, 1, 1,
0.5567163, -0.3807411, 1.469473, 0.1098039, 0, 1, 1,
0.558978, 0.2236549, 0.8321593, 0.1176471, 0, 1, 1,
0.5598723, -0.2623695, 2.604357, 0.1215686, 0, 1, 1,
0.5627778, -0.5048992, 2.22297, 0.1294118, 0, 1, 1,
0.5681744, -0.3465326, 0.2358393, 0.1333333, 0, 1, 1,
0.5704652, -0.2549707, 3.029663, 0.1411765, 0, 1, 1,
0.5727857, 0.345347, -0.308542, 0.145098, 0, 1, 1,
0.5737436, 1.268965, 3.156298, 0.1529412, 0, 1, 1,
0.5742205, 0.2582817, -0.03969623, 0.1568628, 0, 1, 1,
0.578616, 0.5972774, 1.044397, 0.1647059, 0, 1, 1,
0.5810764, 0.4452733, 1.898391, 0.1686275, 0, 1, 1,
0.5817177, -1.720125, 2.109136, 0.1764706, 0, 1, 1,
0.5818913, -0.124349, 2.352623, 0.1803922, 0, 1, 1,
0.5823517, -0.09754828, 2.064661, 0.1882353, 0, 1, 1,
0.5860868, -0.4498078, 1.59604, 0.1921569, 0, 1, 1,
0.5895722, 0.2458832, 0.6724908, 0.2, 0, 1, 1,
0.5937907, 0.1506874, 2.268387, 0.2078431, 0, 1, 1,
0.5947015, -1.45664, 1.637394, 0.2117647, 0, 1, 1,
0.594831, 2.133617, -0.3849996, 0.2196078, 0, 1, 1,
0.5966076, 0.4720584, -0.1689292, 0.2235294, 0, 1, 1,
0.6003709, -1.949714, 2.130239, 0.2313726, 0, 1, 1,
0.6029804, 0.782356, 2.164913, 0.2352941, 0, 1, 1,
0.614447, -0.433722, 1.28886, 0.2431373, 0, 1, 1,
0.6194234, -0.4732449, 3.141878, 0.2470588, 0, 1, 1,
0.6287061, 0.6235687, 0.2311303, 0.254902, 0, 1, 1,
0.6287752, 1.269437, -0.5910468, 0.2588235, 0, 1, 1,
0.6325091, 0.8984529, 1.825817, 0.2666667, 0, 1, 1,
0.6358675, -0.5991586, 1.305924, 0.2705882, 0, 1, 1,
0.6362474, -0.0402504, 1.069833, 0.2784314, 0, 1, 1,
0.6407044, 0.7121416, -0.9042753, 0.282353, 0, 1, 1,
0.6492932, -0.04711441, 1.150036, 0.2901961, 0, 1, 1,
0.6517534, -1.195275, 2.021315, 0.2941177, 0, 1, 1,
0.6523218, -1.006155, 1.654094, 0.3019608, 0, 1, 1,
0.6530882, 0.1554823, 1.922559, 0.3098039, 0, 1, 1,
0.6571674, -0.3902943, 2.396781, 0.3137255, 0, 1, 1,
0.6584927, -1.490606, 2.664843, 0.3215686, 0, 1, 1,
0.6597639, -0.8301126, 2.067145, 0.3254902, 0, 1, 1,
0.6605903, 0.1044659, -1.715789, 0.3333333, 0, 1, 1,
0.6618318, 1.527854, -0.1482144, 0.3372549, 0, 1, 1,
0.6642876, -0.7715953, 3.696936, 0.345098, 0, 1, 1,
0.665392, 1.104054, 3.86544, 0.3490196, 0, 1, 1,
0.666075, 0.5092179, 1.11043, 0.3568628, 0, 1, 1,
0.6673005, -1.730449, 3.457781, 0.3607843, 0, 1, 1,
0.6735104, -0.8104082, 1.244061, 0.3686275, 0, 1, 1,
0.6866123, -1.653324, 3.273252, 0.372549, 0, 1, 1,
0.6880879, -0.1354225, 2.17722, 0.3803922, 0, 1, 1,
0.6944514, -0.1253571, 1.62028, 0.3843137, 0, 1, 1,
0.6946972, 1.60718, 0.05806877, 0.3921569, 0, 1, 1,
0.6949653, 1.368372, -1.206702, 0.3960784, 0, 1, 1,
0.6973692, -1.78641, 2.405729, 0.4039216, 0, 1, 1,
0.6985963, 0.13487, 0.4792648, 0.4117647, 0, 1, 1,
0.6994647, -0.3452222, 2.306112, 0.4156863, 0, 1, 1,
0.6998514, 1.130034, 1.215552, 0.4235294, 0, 1, 1,
0.7020335, 0.1889578, 1.988129, 0.427451, 0, 1, 1,
0.7036793, -0.4391231, 4.12518, 0.4352941, 0, 1, 1,
0.7036821, 1.961625, 1.308542, 0.4392157, 0, 1, 1,
0.7072486, 1.156505, 0.218348, 0.4470588, 0, 1, 1,
0.7112441, 0.07207183, 2.764419, 0.4509804, 0, 1, 1,
0.7113656, -0.7113034, 3.226648, 0.4588235, 0, 1, 1,
0.7131123, -1.141867, 2.665296, 0.4627451, 0, 1, 1,
0.7157596, -0.3112582, 0.7346774, 0.4705882, 0, 1, 1,
0.7166106, 0.04347566, 2.143465, 0.4745098, 0, 1, 1,
0.7172912, -0.2677131, 2.155509, 0.4823529, 0, 1, 1,
0.728877, -0.5062642, 1.30309, 0.4862745, 0, 1, 1,
0.7358444, -1.086355, 0.9761522, 0.4941176, 0, 1, 1,
0.7418974, 0.7235203, 0.5287882, 0.5019608, 0, 1, 1,
0.742116, -0.6454175, 2.886834, 0.5058824, 0, 1, 1,
0.7440071, -3.111896, 0.7924742, 0.5137255, 0, 1, 1,
0.7446484, 1.134408, 1.491741, 0.5176471, 0, 1, 1,
0.7467114, -0.6784853, 2.041357, 0.5254902, 0, 1, 1,
0.7488601, -1.007019, 0.9379025, 0.5294118, 0, 1, 1,
0.7499272, 0.2240504, 0.3084129, 0.5372549, 0, 1, 1,
0.7593668, 1.321477, 0.6923255, 0.5411765, 0, 1, 1,
0.7634774, 0.1274449, 1.789434, 0.5490196, 0, 1, 1,
0.7636628, 0.3953192, 1.582217, 0.5529412, 0, 1, 1,
0.7648374, 0.8062792, 0.9815034, 0.5607843, 0, 1, 1,
0.7674831, 1.53903, 2.946361, 0.5647059, 0, 1, 1,
0.7687077, -1.4625, 3.060105, 0.572549, 0, 1, 1,
0.7698018, -0.8769339, 3.699989, 0.5764706, 0, 1, 1,
0.7718799, 0.1400809, 1.969432, 0.5843138, 0, 1, 1,
0.7758776, -1.875678, 2.546256, 0.5882353, 0, 1, 1,
0.7841435, 3.310674, -0.9378734, 0.5960785, 0, 1, 1,
0.7883384, -0.2768887, 1.790304, 0.6039216, 0, 1, 1,
0.7915708, -0.7897294, 1.716186, 0.6078432, 0, 1, 1,
0.8027808, -0.6469993, 0.7134866, 0.6156863, 0, 1, 1,
0.8032311, 0.676451, 1.524833, 0.6196079, 0, 1, 1,
0.807949, -0.04776347, 0.5996192, 0.627451, 0, 1, 1,
0.8088396, 2.150306, 0.8132472, 0.6313726, 0, 1, 1,
0.809245, -1.819531, 1.915723, 0.6392157, 0, 1, 1,
0.8134316, 1.851638, 2.56686, 0.6431373, 0, 1, 1,
0.8181178, -0.02411637, 1.626365, 0.6509804, 0, 1, 1,
0.8187575, 1.268629, 0.2999781, 0.654902, 0, 1, 1,
0.819555, 0.8561034, -0.6176112, 0.6627451, 0, 1, 1,
0.8219253, 0.35029, 2.095876, 0.6666667, 0, 1, 1,
0.8267344, -0.09592383, 2.263524, 0.6745098, 0, 1, 1,
0.8285027, -0.01718563, 0.5438116, 0.6784314, 0, 1, 1,
0.8285866, -0.7134426, 2.752051, 0.6862745, 0, 1, 1,
0.8410802, -1.138408, 3.1448, 0.6901961, 0, 1, 1,
0.8422506, 0.9712146, 0.6088255, 0.6980392, 0, 1, 1,
0.8440073, -0.5814307, 2.121247, 0.7058824, 0, 1, 1,
0.8462083, 0.1789241, 0.6208169, 0.7098039, 0, 1, 1,
0.8501083, -1.937087, 2.319265, 0.7176471, 0, 1, 1,
0.8530808, 1.01358, 0.8378029, 0.7215686, 0, 1, 1,
0.8541856, -0.6036663, 1.891014, 0.7294118, 0, 1, 1,
0.8543151, -0.3516264, 3.901505, 0.7333333, 0, 1, 1,
0.8625948, 0.2808184, 2.836056, 0.7411765, 0, 1, 1,
0.8644397, 0.6734002, -0.2202594, 0.7450981, 0, 1, 1,
0.8747508, -0.4352822, 0.1741042, 0.7529412, 0, 1, 1,
0.8773587, -0.8689663, 3.221473, 0.7568628, 0, 1, 1,
0.8796105, -0.9027426, 1.830643, 0.7647059, 0, 1, 1,
0.8802336, 0.2210715, 2.645388, 0.7686275, 0, 1, 1,
0.8832596, -1.400199, 1.839955, 0.7764706, 0, 1, 1,
0.8887011, -0.5546269, 1.615376, 0.7803922, 0, 1, 1,
0.8941026, 0.2163449, 2.35876, 0.7882353, 0, 1, 1,
0.8942382, 1.207001, 0.6553359, 0.7921569, 0, 1, 1,
0.9064397, -0.8114982, 3.273792, 0.8, 0, 1, 1,
0.9072262, 1.147644, -0.6442046, 0.8078431, 0, 1, 1,
0.9100561, 2.241395, -0.4145484, 0.8117647, 0, 1, 1,
0.9167688, -0.3267015, 1.619526, 0.8196079, 0, 1, 1,
0.9174515, 0.2334809, 2.562317, 0.8235294, 0, 1, 1,
0.917823, 0.9231099, -0.5276277, 0.8313726, 0, 1, 1,
0.9193558, -1.091502, 1.090221, 0.8352941, 0, 1, 1,
0.9229128, -0.3253641, 1.599288, 0.8431373, 0, 1, 1,
0.9297711, -0.5618128, 1.817608, 0.8470588, 0, 1, 1,
0.9433156, 0.2367032, 0.2381006, 0.854902, 0, 1, 1,
0.9437758, -0.2922342, -1.20275, 0.8588235, 0, 1, 1,
0.9545625, -0.1085416, 1.537306, 0.8666667, 0, 1, 1,
0.9548933, -1.172644, 2.862113, 0.8705882, 0, 1, 1,
0.9672352, 0.8126323, 1.044627, 0.8784314, 0, 1, 1,
0.9681328, -0.456315, 2.2088, 0.8823529, 0, 1, 1,
0.9806174, 1.192096, 0.3651115, 0.8901961, 0, 1, 1,
0.9813006, 0.4578779, 2.269691, 0.8941177, 0, 1, 1,
0.98489, 1.29415, 1.798852, 0.9019608, 0, 1, 1,
0.9860626, -0.4820045, 2.28075, 0.9098039, 0, 1, 1,
0.9872667, 0.9738125, 0.640736, 0.9137255, 0, 1, 1,
0.9899152, -0.7002913, 3.586955, 0.9215686, 0, 1, 1,
0.9958558, 1.184256, 0.6744698, 0.9254902, 0, 1, 1,
0.9960042, 0.575262, 0.7949727, 0.9333333, 0, 1, 1,
0.9982824, 0.164337, 1.415505, 0.9372549, 0, 1, 1,
0.9986819, -0.6324902, 0.8266735, 0.945098, 0, 1, 1,
1.003101, 1.294988, -0.2612269, 0.9490196, 0, 1, 1,
1.003379, -1.261751, 2.44934, 0.9568627, 0, 1, 1,
1.007754, 1.633919, 0.6487536, 0.9607843, 0, 1, 1,
1.01505, 1.047741, -0.07518595, 0.9686275, 0, 1, 1,
1.015437, -0.6204445, 3.193375, 0.972549, 0, 1, 1,
1.017193, 0.9403306, 0.4054208, 0.9803922, 0, 1, 1,
1.0184, -0.6059272, 0.959307, 0.9843137, 0, 1, 1,
1.022236, -0.08573663, 1.822744, 0.9921569, 0, 1, 1,
1.024297, 1.168817, 0.6758846, 0.9960784, 0, 1, 1,
1.0289, 2.786819, 0.1933706, 1, 0, 0.9960784, 1,
1.037428, -1.721514, 2.736969, 1, 0, 0.9882353, 1,
1.038225, 0.5848229, 1.595587, 1, 0, 0.9843137, 1,
1.039484, 0.7449861, 1.796155, 1, 0, 0.9764706, 1,
1.044983, -0.5734608, 3.786936, 1, 0, 0.972549, 1,
1.047862, 0.6531985, 0.3458892, 1, 0, 0.9647059, 1,
1.054599, -1.189219, 2.948546, 1, 0, 0.9607843, 1,
1.055599, -0.5513708, 1.344936, 1, 0, 0.9529412, 1,
1.057628, 0.2491418, 0.5781621, 1, 0, 0.9490196, 1,
1.059083, 1.478979, 2.9776, 1, 0, 0.9411765, 1,
1.064119, 1.071533, 1.545795, 1, 0, 0.9372549, 1,
1.072011, -0.515062, 2.014001, 1, 0, 0.9294118, 1,
1.072061, 0.5561892, 2.40821, 1, 0, 0.9254902, 1,
1.074695, -0.1176262, 1.317969, 1, 0, 0.9176471, 1,
1.078543, 0.5470019, 1.346451, 1, 0, 0.9137255, 1,
1.078998, -0.01467352, 2.738507, 1, 0, 0.9058824, 1,
1.08152, -0.286938, 3.924292, 1, 0, 0.9019608, 1,
1.090786, -0.6018891, 2.128327, 1, 0, 0.8941177, 1,
1.093497, 0.4965976, 0.02987252, 1, 0, 0.8862745, 1,
1.097085, -0.1124237, 1.534511, 1, 0, 0.8823529, 1,
1.101046, 1.725335, -0.3871606, 1, 0, 0.8745098, 1,
1.109693, -0.1211844, 1.36668, 1, 0, 0.8705882, 1,
1.112539, 0.04480227, 1.298574, 1, 0, 0.8627451, 1,
1.114775, -0.5793575, -0.1826069, 1, 0, 0.8588235, 1,
1.118194, -1.349487, 3.275017, 1, 0, 0.8509804, 1,
1.119958, 0.6507085, 0.298694, 1, 0, 0.8470588, 1,
1.120217, 0.2021636, 1.295337, 1, 0, 0.8392157, 1,
1.127936, 0.7614119, -0.07080448, 1, 0, 0.8352941, 1,
1.131748, 0.03738134, 1.690518, 1, 0, 0.827451, 1,
1.13409, -1.418965, 1.994702, 1, 0, 0.8235294, 1,
1.136449, 0.7616988, 2.249241, 1, 0, 0.8156863, 1,
1.144849, -1.667497, 2.916009, 1, 0, 0.8117647, 1,
1.151923, -0.5760131, 1.523723, 1, 0, 0.8039216, 1,
1.153037, 1.188876, 1.132893, 1, 0, 0.7960784, 1,
1.153466, -0.230259, 1.665226, 1, 0, 0.7921569, 1,
1.155868, 1.734954, 1.501577, 1, 0, 0.7843137, 1,
1.157787, -1.677027, 1.91475, 1, 0, 0.7803922, 1,
1.165383, 0.579857, 2.117248, 1, 0, 0.772549, 1,
1.165559, 1.289201, 1.925974, 1, 0, 0.7686275, 1,
1.178782, -0.7144595, 1.991913, 1, 0, 0.7607843, 1,
1.180928, -0.3077218, 1.304742, 1, 0, 0.7568628, 1,
1.186223, 0.692175, 0.1211136, 1, 0, 0.7490196, 1,
1.18656, 0.835196, 1.308664, 1, 0, 0.7450981, 1,
1.202166, -0.5391695, 1.04387, 1, 0, 0.7372549, 1,
1.205387, -0.6858512, 3.592494, 1, 0, 0.7333333, 1,
1.205552, 0.3058208, 2.485189, 1, 0, 0.7254902, 1,
1.207528, 0.7152689, 0.8591916, 1, 0, 0.7215686, 1,
1.208604, -0.6487105, 3.277208, 1, 0, 0.7137255, 1,
1.208977, 0.2130562, 3.076195, 1, 0, 0.7098039, 1,
1.209887, 0.3364326, 0.012443, 1, 0, 0.7019608, 1,
1.211713, 1.415626, 0.1784121, 1, 0, 0.6941177, 1,
1.216246, -0.6966186, 4.334892, 1, 0, 0.6901961, 1,
1.218494, -2.126753, 3.008605, 1, 0, 0.682353, 1,
1.219301, 2.361681, -1.749851, 1, 0, 0.6784314, 1,
1.227579, -2.601566, 3.351593, 1, 0, 0.6705883, 1,
1.230008, 1.07686, -0.3689936, 1, 0, 0.6666667, 1,
1.233897, 0.4362014, -0.5590429, 1, 0, 0.6588235, 1,
1.250225, 0.5812222, 0.2856098, 1, 0, 0.654902, 1,
1.268961, 0.4296433, 2.371784, 1, 0, 0.6470588, 1,
1.269844, 0.2094822, 1.160277, 1, 0, 0.6431373, 1,
1.276142, -0.2987291, 0.3785977, 1, 0, 0.6352941, 1,
1.28052, 0.06922457, 1.061121, 1, 0, 0.6313726, 1,
1.283911, -1.508103, 2.682783, 1, 0, 0.6235294, 1,
1.292405, 0.04511374, 1.370257, 1, 0, 0.6196079, 1,
1.294692, 2.36009, 1.462674, 1, 0, 0.6117647, 1,
1.298845, -0.0231567, 1.01313, 1, 0, 0.6078432, 1,
1.305601, 1.656846, 0.2461162, 1, 0, 0.6, 1,
1.313769, -1.067036, 0.6675465, 1, 0, 0.5921569, 1,
1.327838, -0.1320409, 1.832111, 1, 0, 0.5882353, 1,
1.328882, 0.4175917, 1.628832, 1, 0, 0.5803922, 1,
1.331847, -0.05174502, 0.266123, 1, 0, 0.5764706, 1,
1.338918, -0.1942656, 2.858813, 1, 0, 0.5686275, 1,
1.345345, -0.1449609, 1.613626, 1, 0, 0.5647059, 1,
1.356884, -0.1188617, 1.541449, 1, 0, 0.5568628, 1,
1.378841, 2.244689, 0.8163148, 1, 0, 0.5529412, 1,
1.3801, -0.9678738, 3.965044, 1, 0, 0.5450981, 1,
1.403176, 1.279372, 1.908752, 1, 0, 0.5411765, 1,
1.403742, 0.1322192, 3.081089, 1, 0, 0.5333334, 1,
1.406914, 1.074706, 0.1801407, 1, 0, 0.5294118, 1,
1.413225, 0.05750269, 0.7587171, 1, 0, 0.5215687, 1,
1.417654, 0.6258287, -0.2379995, 1, 0, 0.5176471, 1,
1.425406, -0.3730823, 0.4524113, 1, 0, 0.509804, 1,
1.440822, -1.448019, 1.603819, 1, 0, 0.5058824, 1,
1.456706, 0.2248784, 0.3712384, 1, 0, 0.4980392, 1,
1.458609, 0.5059958, 1.730968, 1, 0, 0.4901961, 1,
1.461446, -0.464508, 1.745023, 1, 0, 0.4862745, 1,
1.475408, -0.5442591, 3.855326, 1, 0, 0.4784314, 1,
1.479443, 0.1907692, 0.8840727, 1, 0, 0.4745098, 1,
1.48113, -0.4429977, 2.479565, 1, 0, 0.4666667, 1,
1.487744, -0.8449413, 2.726241, 1, 0, 0.4627451, 1,
1.494104, -2.053688, 2.040747, 1, 0, 0.454902, 1,
1.495346, -1.622915, 2.573389, 1, 0, 0.4509804, 1,
1.497631, -1.611427, 2.886861, 1, 0, 0.4431373, 1,
1.498529, -0.1769608, 3.318791, 1, 0, 0.4392157, 1,
1.500865, 0.1859659, 1.408027, 1, 0, 0.4313726, 1,
1.501088, -0.02883625, 2.111786, 1, 0, 0.427451, 1,
1.506792, 1.168348, 1.578338, 1, 0, 0.4196078, 1,
1.510857, 0.4990928, -1.076602, 1, 0, 0.4156863, 1,
1.515314, 1.037074, 2.059554, 1, 0, 0.4078431, 1,
1.520457, -0.04596983, 1.038244, 1, 0, 0.4039216, 1,
1.521895, -0.2652635, 0.8184071, 1, 0, 0.3960784, 1,
1.524294, -1.612091, 3.142816, 1, 0, 0.3882353, 1,
1.526106, 1.507907, 1.987521, 1, 0, 0.3843137, 1,
1.539915, 1.883887, -0.1565997, 1, 0, 0.3764706, 1,
1.541215, 1.592725, 0.2673213, 1, 0, 0.372549, 1,
1.54589, -0.1280328, 2.001401, 1, 0, 0.3647059, 1,
1.548188, 2.034963, 0.4126955, 1, 0, 0.3607843, 1,
1.551723, -0.7117355, 2.084336, 1, 0, 0.3529412, 1,
1.559937, -0.4345195, 0.9050018, 1, 0, 0.3490196, 1,
1.570957, 0.6313295, 1.416835, 1, 0, 0.3411765, 1,
1.583647, 0.2476728, 1.577404, 1, 0, 0.3372549, 1,
1.591633, -0.9175839, 1.75808, 1, 0, 0.3294118, 1,
1.60191, 1.249287, 1.568564, 1, 0, 0.3254902, 1,
1.608199, 0.3712092, 0.6270615, 1, 0, 0.3176471, 1,
1.630827, 0.3860047, 0.5205683, 1, 0, 0.3137255, 1,
1.634481, -0.24844, 1.590561, 1, 0, 0.3058824, 1,
1.667115, -0.2831901, 1.90226, 1, 0, 0.2980392, 1,
1.670223, -1.152688, 0.8655604, 1, 0, 0.2941177, 1,
1.67944, 0.2498517, 1.614254, 1, 0, 0.2862745, 1,
1.692946, -0.01941142, 1.307062, 1, 0, 0.282353, 1,
1.696934, -1.180358, 1.098775, 1, 0, 0.2745098, 1,
1.71649, 0.6301513, 2.437314, 1, 0, 0.2705882, 1,
1.717784, 0.3490369, 0.6689168, 1, 0, 0.2627451, 1,
1.719863, -1.506827, 3.885622, 1, 0, 0.2588235, 1,
1.72678, -0.3352725, 2.774819, 1, 0, 0.2509804, 1,
1.744975, 0.833524, -0.6878459, 1, 0, 0.2470588, 1,
1.765705, 1.714771, 1.311532, 1, 0, 0.2392157, 1,
1.773454, -0.9293174, 2.465192, 1, 0, 0.2352941, 1,
1.789725, -0.2744155, 1.781272, 1, 0, 0.227451, 1,
1.840058, -0.4642256, 3.325729, 1, 0, 0.2235294, 1,
1.876847, -1.414283, 3.481244, 1, 0, 0.2156863, 1,
1.93265, -1.020466, -1.004787, 1, 0, 0.2117647, 1,
1.949827, -0.2981302, 1.405807, 1, 0, 0.2039216, 1,
1.965276, -1.008878, 1.766263, 1, 0, 0.1960784, 1,
1.969555, 0.8323004, 0.9832998, 1, 0, 0.1921569, 1,
2.024201, -0.4587232, 0.392036, 1, 0, 0.1843137, 1,
2.030436, -1.395904, 2.001497, 1, 0, 0.1803922, 1,
2.043012, 0.4149328, 1.176667, 1, 0, 0.172549, 1,
2.094359, -0.5972595, 2.543305, 1, 0, 0.1686275, 1,
2.104203, -2.000344, 1.837016, 1, 0, 0.1607843, 1,
2.118248, 0.3749948, 1.385324, 1, 0, 0.1568628, 1,
2.12459, 1.005171, 0.8810372, 1, 0, 0.1490196, 1,
2.12462, 0.8795122, 1.014944, 1, 0, 0.145098, 1,
2.142048, 0.450585, 1.736708, 1, 0, 0.1372549, 1,
2.178521, 0.8713037, 2.852372, 1, 0, 0.1333333, 1,
2.184734, -0.7205932, 1.565175, 1, 0, 0.1254902, 1,
2.209253, 0.3856654, 2.462838, 1, 0, 0.1215686, 1,
2.254235, -0.3678601, 1.25024, 1, 0, 0.1137255, 1,
2.28102, 0.7139021, 1.054932, 1, 0, 0.1098039, 1,
2.323112, -1.455395, 1.628371, 1, 0, 0.1019608, 1,
2.334044, -1.044474, 0.8598998, 1, 0, 0.09411765, 1,
2.334801, -0.3088217, 2.137549, 1, 0, 0.09019608, 1,
2.346381, 1.092178, 1.870414, 1, 0, 0.08235294, 1,
2.406277, 0.7684128, 1.395279, 1, 0, 0.07843138, 1,
2.418457, 0.2016216, 3.208833, 1, 0, 0.07058824, 1,
2.426691, -1.128039, 1.013767, 1, 0, 0.06666667, 1,
2.445024, -0.3032685, 2.135249, 1, 0, 0.05882353, 1,
2.473805, -0.3694865, 2.331789, 1, 0, 0.05490196, 1,
2.497303, 0.02225104, 2.789824, 1, 0, 0.04705882, 1,
2.505225, 0.09744782, 3.072976, 1, 0, 0.04313726, 1,
2.530681, -0.3805441, 1.675389, 1, 0, 0.03529412, 1,
2.54369, -1.003998, -0.7835235, 1, 0, 0.03137255, 1,
2.545738, 1.909051, 1.659818, 1, 0, 0.02352941, 1,
2.627521, -1.601031, 0.7999884, 1, 0, 0.01960784, 1,
2.879583, 0.002619314, 2.082767, 1, 0, 0.01176471, 1,
2.939616, -0.5058946, 0.6317286, 1, 0, 0.007843138, 1
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
-0.08316433, -5.544799, -7.01025, 0, -0.5, 0.5, 0.5,
-0.08316433, -5.544799, -7.01025, 1, -0.5, 0.5, 0.5,
-0.08316433, -5.544799, -7.01025, 1, 1.5, 0.5, 0.5,
-0.08316433, -5.544799, -7.01025, 0, 1.5, 0.5, 0.5
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
-4.130668, -0.4753342, -7.01025, 0, -0.5, 0.5, 0.5,
-4.130668, -0.4753342, -7.01025, 1, -0.5, 0.5, 0.5,
-4.130668, -0.4753342, -7.01025, 1, 1.5, 0.5, 0.5,
-4.130668, -0.4753342, -7.01025, 0, 1.5, 0.5, 0.5
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
-4.130668, -5.544799, -0.067765, 0, -0.5, 0.5, 0.5,
-4.130668, -5.544799, -0.067765, 1, -0.5, 0.5, 0.5,
-4.130668, -5.544799, -0.067765, 1, 1.5, 0.5, 0.5,
-4.130668, -5.544799, -0.067765, 0, 1.5, 0.5, 0.5
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
-3, -4.374922, -5.408138,
2, -4.374922, -5.408138,
-3, -4.374922, -5.408138,
-3, -4.569901, -5.675157,
-2, -4.374922, -5.408138,
-2, -4.569901, -5.675157,
-1, -4.374922, -5.408138,
-1, -4.569901, -5.675157,
0, -4.374922, -5.408138,
0, -4.569901, -5.675157,
1, -4.374922, -5.408138,
1, -4.569901, -5.675157,
2, -4.374922, -5.408138,
2, -4.569901, -5.675157
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
-3, -4.95986, -6.209194, 0, -0.5, 0.5, 0.5,
-3, -4.95986, -6.209194, 1, -0.5, 0.5, 0.5,
-3, -4.95986, -6.209194, 1, 1.5, 0.5, 0.5,
-3, -4.95986, -6.209194, 0, 1.5, 0.5, 0.5,
-2, -4.95986, -6.209194, 0, -0.5, 0.5, 0.5,
-2, -4.95986, -6.209194, 1, -0.5, 0.5, 0.5,
-2, -4.95986, -6.209194, 1, 1.5, 0.5, 0.5,
-2, -4.95986, -6.209194, 0, 1.5, 0.5, 0.5,
-1, -4.95986, -6.209194, 0, -0.5, 0.5, 0.5,
-1, -4.95986, -6.209194, 1, -0.5, 0.5, 0.5,
-1, -4.95986, -6.209194, 1, 1.5, 0.5, 0.5,
-1, -4.95986, -6.209194, 0, 1.5, 0.5, 0.5,
0, -4.95986, -6.209194, 0, -0.5, 0.5, 0.5,
0, -4.95986, -6.209194, 1, -0.5, 0.5, 0.5,
0, -4.95986, -6.209194, 1, 1.5, 0.5, 0.5,
0, -4.95986, -6.209194, 0, 1.5, 0.5, 0.5,
1, -4.95986, -6.209194, 0, -0.5, 0.5, 0.5,
1, -4.95986, -6.209194, 1, -0.5, 0.5, 0.5,
1, -4.95986, -6.209194, 1, 1.5, 0.5, 0.5,
1, -4.95986, -6.209194, 0, 1.5, 0.5, 0.5,
2, -4.95986, -6.209194, 0, -0.5, 0.5, 0.5,
2, -4.95986, -6.209194, 1, -0.5, 0.5, 0.5,
2, -4.95986, -6.209194, 1, 1.5, 0.5, 0.5,
2, -4.95986, -6.209194, 0, 1.5, 0.5, 0.5
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
-3.196629, -4, -5.408138,
-3.196629, 2, -5.408138,
-3.196629, -4, -5.408138,
-3.352302, -4, -5.675157,
-3.196629, -2, -5.408138,
-3.352302, -2, -5.675157,
-3.196629, 0, -5.408138,
-3.352302, 0, -5.675157,
-3.196629, 2, -5.408138,
-3.352302, 2, -5.675157
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
"-4",
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
-3.663648, -4, -6.209194, 0, -0.5, 0.5, 0.5,
-3.663648, -4, -6.209194, 1, -0.5, 0.5, 0.5,
-3.663648, -4, -6.209194, 1, 1.5, 0.5, 0.5,
-3.663648, -4, -6.209194, 0, 1.5, 0.5, 0.5,
-3.663648, -2, -6.209194, 0, -0.5, 0.5, 0.5,
-3.663648, -2, -6.209194, 1, -0.5, 0.5, 0.5,
-3.663648, -2, -6.209194, 1, 1.5, 0.5, 0.5,
-3.663648, -2, -6.209194, 0, 1.5, 0.5, 0.5,
-3.663648, 0, -6.209194, 0, -0.5, 0.5, 0.5,
-3.663648, 0, -6.209194, 1, -0.5, 0.5, 0.5,
-3.663648, 0, -6.209194, 1, 1.5, 0.5, 0.5,
-3.663648, 0, -6.209194, 0, 1.5, 0.5, 0.5,
-3.663648, 2, -6.209194, 0, -0.5, 0.5, 0.5,
-3.663648, 2, -6.209194, 1, -0.5, 0.5, 0.5,
-3.663648, 2, -6.209194, 1, 1.5, 0.5, 0.5,
-3.663648, 2, -6.209194, 0, 1.5, 0.5, 0.5
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
-3.196629, -4.374922, -4,
-3.196629, -4.374922, 4,
-3.196629, -4.374922, -4,
-3.352302, -4.569901, -4,
-3.196629, -4.374922, -2,
-3.352302, -4.569901, -2,
-3.196629, -4.374922, 0,
-3.352302, -4.569901, 0,
-3.196629, -4.374922, 2,
-3.352302, -4.569901, 2,
-3.196629, -4.374922, 4,
-3.352302, -4.569901, 4
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
-3.663648, -4.95986, -4, 0, -0.5, 0.5, 0.5,
-3.663648, -4.95986, -4, 1, -0.5, 0.5, 0.5,
-3.663648, -4.95986, -4, 1, 1.5, 0.5, 0.5,
-3.663648, -4.95986, -4, 0, 1.5, 0.5, 0.5,
-3.663648, -4.95986, -2, 0, -0.5, 0.5, 0.5,
-3.663648, -4.95986, -2, 1, -0.5, 0.5, 0.5,
-3.663648, -4.95986, -2, 1, 1.5, 0.5, 0.5,
-3.663648, -4.95986, -2, 0, 1.5, 0.5, 0.5,
-3.663648, -4.95986, 0, 0, -0.5, 0.5, 0.5,
-3.663648, -4.95986, 0, 1, -0.5, 0.5, 0.5,
-3.663648, -4.95986, 0, 1, 1.5, 0.5, 0.5,
-3.663648, -4.95986, 0, 0, 1.5, 0.5, 0.5,
-3.663648, -4.95986, 2, 0, -0.5, 0.5, 0.5,
-3.663648, -4.95986, 2, 1, -0.5, 0.5, 0.5,
-3.663648, -4.95986, 2, 1, 1.5, 0.5, 0.5,
-3.663648, -4.95986, 2, 0, 1.5, 0.5, 0.5,
-3.663648, -4.95986, 4, 0, -0.5, 0.5, 0.5,
-3.663648, -4.95986, 4, 1, -0.5, 0.5, 0.5,
-3.663648, -4.95986, 4, 1, 1.5, 0.5, 0.5,
-3.663648, -4.95986, 4, 0, 1.5, 0.5, 0.5
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
-3.196629, -4.374922, -5.408138,
-3.196629, 3.424254, -5.408138,
-3.196629, -4.374922, 5.272608,
-3.196629, 3.424254, 5.272608,
-3.196629, -4.374922, -5.408138,
-3.196629, -4.374922, 5.272608,
-3.196629, 3.424254, -5.408138,
-3.196629, 3.424254, 5.272608,
-3.196629, -4.374922, -5.408138,
3.0303, -4.374922, -5.408138,
-3.196629, -4.374922, 5.272608,
3.0303, -4.374922, 5.272608,
-3.196629, 3.424254, -5.408138,
3.0303, 3.424254, -5.408138,
-3.196629, 3.424254, 5.272608,
3.0303, 3.424254, 5.272608,
3.0303, -4.374922, -5.408138,
3.0303, 3.424254, -5.408138,
3.0303, -4.374922, 5.272608,
3.0303, 3.424254, 5.272608,
3.0303, -4.374922, -5.408138,
3.0303, -4.374922, 5.272608,
3.0303, 3.424254, -5.408138,
3.0303, 3.424254, 5.272608
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
var radius = 7.805622;
var distance = 34.72809;
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
mvMatrix.translate( 0.08316433, 0.4753342, 0.067765 );
mvMatrix.scale( 1.355338, 1.082113, 0.7901688 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.72809);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Dinotefuran<-read.table("Dinotefuran.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dinotefuran$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dinotefuran' not found
```

```r
y<-Dinotefuran$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dinotefuran' not found
```

```r
z<-Dinotefuran$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dinotefuran' not found
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
-3.105945, 1.131363, -0.7743683, 0, 0, 1, 1, 1,
-2.900406, 1.921224, -1.379417, 1, 0, 0, 1, 1,
-2.800531, 0.7674714, -0.02492541, 1, 0, 0, 1, 1,
-2.49595, -1.859537, -1.202738, 1, 0, 0, 1, 1,
-2.460995, 0.7058279, -2.939068, 1, 0, 0, 1, 1,
-2.348736, 0.5287136, -0.9566088, 1, 0, 0, 1, 1,
-2.337988, 1.237309, 0.0593943, 0, 0, 0, 1, 1,
-2.319649, 0.6509383, -2.066206, 0, 0, 0, 1, 1,
-2.255477, 2.235875, -0.4649892, 0, 0, 0, 1, 1,
-2.226832, -1.347348, -2.265607, 0, 0, 0, 1, 1,
-2.206563, 1.501471, -1.264862, 0, 0, 0, 1, 1,
-2.165389, -2.579286, -3.213571, 0, 0, 0, 1, 1,
-2.144244, -0.7755204, -4.423653, 0, 0, 0, 1, 1,
-2.127753, -0.05927074, -2.238979, 1, 1, 1, 1, 1,
-2.125592, 0.6234726, -0.4299606, 1, 1, 1, 1, 1,
-2.122347, -0.1738525, -1.999618, 1, 1, 1, 1, 1,
-2.049385, -0.5202261, -1.57817, 1, 1, 1, 1, 1,
-2.036075, 1.500865, -1.353706, 1, 1, 1, 1, 1,
-2.033674, -1.313969, -2.366942, 1, 1, 1, 1, 1,
-2.022562, -0.5235041, -1.595977, 1, 1, 1, 1, 1,
-2.019248, 0.3613867, -1.709824, 1, 1, 1, 1, 1,
-2.00665, 1.497266, -0.3471001, 1, 1, 1, 1, 1,
-1.996675, -0.1995559, -1.034156, 1, 1, 1, 1, 1,
-1.983528, 0.9831553, 0.312564, 1, 1, 1, 1, 1,
-1.983272, 0.2749523, -1.899094, 1, 1, 1, 1, 1,
-1.967963, 1.643753, -0.3455257, 1, 1, 1, 1, 1,
-1.964668, 2.78655, -1.127488, 1, 1, 1, 1, 1,
-1.955616, 0.1885562, -2.358299, 1, 1, 1, 1, 1,
-1.940129, -0.9051307, -1.63389, 0, 0, 1, 1, 1,
-1.937584, 0.3801538, -2.556094, 1, 0, 0, 1, 1,
-1.93285, 0.5082064, -2.179073, 1, 0, 0, 1, 1,
-1.907676, -0.01169454, 0.02164602, 1, 0, 0, 1, 1,
-1.880541, -0.1574369, -2.776279, 1, 0, 0, 1, 1,
-1.858508, -1.027307, -2.587104, 1, 0, 0, 1, 1,
-1.847041, 0.585308, -1.154926, 0, 0, 0, 1, 1,
-1.839348, -0.7593264, -2.108349, 0, 0, 0, 1, 1,
-1.837507, -0.6157418, -2.185818, 0, 0, 0, 1, 1,
-1.836736, -0.6442951, -2.115975, 0, 0, 0, 1, 1,
-1.832859, 0.5576831, -0.9310169, 0, 0, 0, 1, 1,
-1.819324, 0.693785, -0.5358708, 0, 0, 0, 1, 1,
-1.818424, 0.2841021, -1.790711, 0, 0, 0, 1, 1,
-1.813114, -0.5816703, -1.697859, 1, 1, 1, 1, 1,
-1.791144, -0.03880674, -2.12138, 1, 1, 1, 1, 1,
-1.740874, 2.262001, -0.2815076, 1, 1, 1, 1, 1,
-1.728073, -1.160543, -2.438015, 1, 1, 1, 1, 1,
-1.723276, -0.1580911, -1.585526, 1, 1, 1, 1, 1,
-1.690929, 0.1761825, -2.17032, 1, 1, 1, 1, 1,
-1.662239, 0.452947, -1.116137, 1, 1, 1, 1, 1,
-1.655077, -0.3816414, -0.310409, 1, 1, 1, 1, 1,
-1.647134, 0.8058386, -1.163252, 1, 1, 1, 1, 1,
-1.64409, -0.5750121, -0.7856772, 1, 1, 1, 1, 1,
-1.640678, 1.230727, 0.5419716, 1, 1, 1, 1, 1,
-1.620856, 0.7018318, -3.036767, 1, 1, 1, 1, 1,
-1.604239, 0.321095, -2.510205, 1, 1, 1, 1, 1,
-1.604103, 0.2141354, -1.387779, 1, 1, 1, 1, 1,
-1.601955, 0.9331573, -0.8586831, 1, 1, 1, 1, 1,
-1.601257, 1.607275, -1.474386, 0, 0, 1, 1, 1,
-1.589937, -0.4887653, -4.972717, 1, 0, 0, 1, 1,
-1.578506, 0.9288719, -0.1122897, 1, 0, 0, 1, 1,
-1.575053, 0.5402883, 0.9519493, 1, 0, 0, 1, 1,
-1.563185, -1.189791, -2.850618, 1, 0, 0, 1, 1,
-1.552153, 0.6572419, -1.655041, 1, 0, 0, 1, 1,
-1.534938, 0.3369636, -1.5284, 0, 0, 0, 1, 1,
-1.519343, -1.358756, -1.838207, 0, 0, 0, 1, 1,
-1.486199, 0.2863188, -1.631396, 0, 0, 0, 1, 1,
-1.484577, 0.7855761, 0.01365895, 0, 0, 0, 1, 1,
-1.47898, -0.07896069, 0.459695, 0, 0, 0, 1, 1,
-1.459841, 0.7396104, -3.439853, 0, 0, 0, 1, 1,
-1.452268, 0.433153, -0.7938728, 0, 0, 0, 1, 1,
-1.437076, -0.4586705, -0.4168664, 1, 1, 1, 1, 1,
-1.433722, 1.186033, 0.06640705, 1, 1, 1, 1, 1,
-1.422564, -0.6948833, -1.771524, 1, 1, 1, 1, 1,
-1.401645, -1.073196, -4.279827, 1, 1, 1, 1, 1,
-1.394341, 1.19421, -1.009762, 1, 1, 1, 1, 1,
-1.387186, 0.04944374, -2.656804, 1, 1, 1, 1, 1,
-1.372481, 0.328744, -0.8945897, 1, 1, 1, 1, 1,
-1.364619, 0.1942564, -2.197239, 1, 1, 1, 1, 1,
-1.362785, 0.002406833, -0.4099154, 1, 1, 1, 1, 1,
-1.359235, -0.01439074, -0.5010027, 1, 1, 1, 1, 1,
-1.33807, -0.360822, -3.591497, 1, 1, 1, 1, 1,
-1.325568, -0.4532143, -1.145909, 1, 1, 1, 1, 1,
-1.322289, -0.05149716, -1.896603, 1, 1, 1, 1, 1,
-1.318244, -0.4699017, -1.530888, 1, 1, 1, 1, 1,
-1.306241, -1.793601, -2.327202, 1, 1, 1, 1, 1,
-1.305178, 0.08880121, -1.799614, 0, 0, 1, 1, 1,
-1.301265, 0.3696526, -2.084011, 1, 0, 0, 1, 1,
-1.294934, -0.8594768, -2.923654, 1, 0, 0, 1, 1,
-1.291769, -1.752128, -2.597607, 1, 0, 0, 1, 1,
-1.275938, -1.528237, -2.124383, 1, 0, 0, 1, 1,
-1.27383, -0.2254955, -1.52392, 1, 0, 0, 1, 1,
-1.271962, -0.1466069, -0.5186983, 0, 0, 0, 1, 1,
-1.256905, -0.01922402, -1.222068, 0, 0, 0, 1, 1,
-1.241501, 0.1479109, -2.318544, 0, 0, 0, 1, 1,
-1.232675, 0.8953757, -0.296919, 0, 0, 0, 1, 1,
-1.232583, -0.836811, -1.324049, 0, 0, 0, 1, 1,
-1.220689, 0.8192803, -0.6012675, 0, 0, 0, 1, 1,
-1.212077, 1.071181, -1.265472, 0, 0, 0, 1, 1,
-1.19589, 1.068811, -2.965105, 1, 1, 1, 1, 1,
-1.195049, -2.303595, -1.055356, 1, 1, 1, 1, 1,
-1.194301, -0.3277652, -2.184499, 1, 1, 1, 1, 1,
-1.190404, -0.4777221, -2.314686, 1, 1, 1, 1, 1,
-1.184585, -1.392054, -3.023652, 1, 1, 1, 1, 1,
-1.180866, 0.538228, -2.514285, 1, 1, 1, 1, 1,
-1.172966, -0.4122016, -0.5748937, 1, 1, 1, 1, 1,
-1.165745, -1.058519, -0.7183485, 1, 1, 1, 1, 1,
-1.165267, -0.1526497, -2.377465, 1, 1, 1, 1, 1,
-1.162962, -0.9059395, -0.6817809, 1, 1, 1, 1, 1,
-1.152814, -0.552997, -1.540165, 1, 1, 1, 1, 1,
-1.14117, 1.025539, -1.649578, 1, 1, 1, 1, 1,
-1.139517, 0.5573532, -0.3304467, 1, 1, 1, 1, 1,
-1.137451, -0.373729, -1.68008, 1, 1, 1, 1, 1,
-1.135351, -1.140449, -2.708848, 1, 1, 1, 1, 1,
-1.1347, 2.247791, -0.8094254, 0, 0, 1, 1, 1,
-1.134232, -2.003213, -1.557855, 1, 0, 0, 1, 1,
-1.13186, -0.8561888, -2.505702, 1, 0, 0, 1, 1,
-1.120192, -0.4698345, -2.403553, 1, 0, 0, 1, 1,
-1.118351, -1.174096, -1.827441, 1, 0, 0, 1, 1,
-1.118288, -0.7517505, -0.9789488, 1, 0, 0, 1, 1,
-1.115431, 1.653783, -0.7846043, 0, 0, 0, 1, 1,
-1.114867, -1.803281, -2.917979, 0, 0, 0, 1, 1,
-1.111227, 0.1975133, 1.327372, 0, 0, 0, 1, 1,
-1.105465, -0.1435919, -0.06630109, 0, 0, 0, 1, 1,
-1.090645, -0.3916125, -2.807164, 0, 0, 0, 1, 1,
-1.090108, 0.2409913, -2.153917, 0, 0, 0, 1, 1,
-1.083355, -2.804228, -3.822942, 0, 0, 0, 1, 1,
-1.079132, -0.7391123, -2.61998, 1, 1, 1, 1, 1,
-1.078892, 0.351734, -2.895383, 1, 1, 1, 1, 1,
-1.071869, 0.2587094, -0.4729921, 1, 1, 1, 1, 1,
-1.071291, 0.02072666, -1.04616, 1, 1, 1, 1, 1,
-1.070425, 1.891023, -1.396118, 1, 1, 1, 1, 1,
-1.066487, 0.8180921, -0.9485924, 1, 1, 1, 1, 1,
-1.060784, -0.2829649, -1.361642, 1, 1, 1, 1, 1,
-1.055372, 0.5557387, 0.01841356, 1, 1, 1, 1, 1,
-1.051816, -1.32804, -2.412834, 1, 1, 1, 1, 1,
-1.047497, -0.3897196, -1.743915, 1, 1, 1, 1, 1,
-1.045548, -0.08939918, -2.850731, 1, 1, 1, 1, 1,
-1.044221, 0.6724437, -1.238623, 1, 1, 1, 1, 1,
-1.043078, -0.2406363, -0.8528256, 1, 1, 1, 1, 1,
-1.040605, 1.759724, -1.89317, 1, 1, 1, 1, 1,
-1.036526, 0.7094299, -0.6939472, 1, 1, 1, 1, 1,
-1.033242, -1.291689, -3.269948, 0, 0, 1, 1, 1,
-1.023009, -2.08594, -4.185971, 1, 0, 0, 1, 1,
-1.022635, -0.009726825, -1.06287, 1, 0, 0, 1, 1,
-1.016693, 0.6139472, -0.5508223, 1, 0, 0, 1, 1,
-1.011237, 0.04769412, -1.328384, 1, 0, 0, 1, 1,
-1.007534, -0.1589812, -1.3965, 1, 0, 0, 1, 1,
-1.005893, -1.145051, -3.44821, 0, 0, 0, 1, 1,
-1.004826, 0.1630931, -0.07911289, 0, 0, 0, 1, 1,
-1.003279, 1.513992, 0.1660078, 0, 0, 0, 1, 1,
-1.002695, 1.101503, -0.202436, 0, 0, 0, 1, 1,
-1.00055, 1.218901, 0.4962144, 0, 0, 0, 1, 1,
-0.9910744, 0.7974245, -1.24081, 0, 0, 0, 1, 1,
-0.9905853, -0.8546013, -3.672351, 0, 0, 0, 1, 1,
-0.9873058, -0.8728669, -2.819057, 1, 1, 1, 1, 1,
-0.9787341, -0.003160803, -3.738411, 1, 1, 1, 1, 1,
-0.9733387, 1.760634, 1.599043, 1, 1, 1, 1, 1,
-0.9732188, -1.098605, -2.565807, 1, 1, 1, 1, 1,
-0.9728292, -0.9329156, -3.443411, 1, 1, 1, 1, 1,
-0.9726631, -1.359728, -0.8687284, 1, 1, 1, 1, 1,
-0.9712605, 0.08639795, -2.698767, 1, 1, 1, 1, 1,
-0.9688334, 1.433676, -1.95689, 1, 1, 1, 1, 1,
-0.9643083, -1.523741, -3.878301, 1, 1, 1, 1, 1,
-0.9623955, -0.5675553, -2.285981, 1, 1, 1, 1, 1,
-0.9590674, -1.684632, -2.567645, 1, 1, 1, 1, 1,
-0.9583625, -0.6373754, -1.250877, 1, 1, 1, 1, 1,
-0.9545534, 0.425585, -1.48129, 1, 1, 1, 1, 1,
-0.95445, -0.9892472, -1.642293, 1, 1, 1, 1, 1,
-0.9475769, 0.6049928, -1.734678, 1, 1, 1, 1, 1,
-0.9364819, -0.3636633, -3.294994, 0, 0, 1, 1, 1,
-0.9326515, 0.255017, -1.92575, 1, 0, 0, 1, 1,
-0.9310584, -0.2536281, -0.1664817, 1, 0, 0, 1, 1,
-0.9235253, 1.29915, 0.3325367, 1, 0, 0, 1, 1,
-0.9177592, 0.9954242, -1.81489, 1, 0, 0, 1, 1,
-0.9173918, 1.323125, -3.221721, 1, 0, 0, 1, 1,
-0.9134005, 0.7593523, -0.8984045, 0, 0, 0, 1, 1,
-0.9030634, 1.236209, -0.4611285, 0, 0, 0, 1, 1,
-0.8999137, -0.2431419, -1.20772, 0, 0, 0, 1, 1,
-0.8938054, -0.2583568, -2.620725, 0, 0, 0, 1, 1,
-0.8876715, 0.08322302, -0.5438183, 0, 0, 0, 1, 1,
-0.8851286, 0.09490231, -1.620875, 0, 0, 0, 1, 1,
-0.8789847, -0.4408493, -0.1597182, 0, 0, 0, 1, 1,
-0.8783478, -1.916228, -1.668375, 1, 1, 1, 1, 1,
-0.8757602, -0.8014541, -3.26783, 1, 1, 1, 1, 1,
-0.8738059, 1.197214, 0.415714, 1, 1, 1, 1, 1,
-0.8653385, -0.5628782, -1.416953, 1, 1, 1, 1, 1,
-0.862797, -0.8533392, -2.037092, 1, 1, 1, 1, 1,
-0.8603457, -0.4454062, -0.7764674, 1, 1, 1, 1, 1,
-0.8567864, -0.5071415, -2.671568, 1, 1, 1, 1, 1,
-0.8535439, -0.4762322, -2.492158, 1, 1, 1, 1, 1,
-0.8534153, -0.2310355, -1.407297, 1, 1, 1, 1, 1,
-0.8531275, 1.124122, -0.797295, 1, 1, 1, 1, 1,
-0.851707, -0.4149761, -3.1975, 1, 1, 1, 1, 1,
-0.844101, -0.3097984, -2.12173, 1, 1, 1, 1, 1,
-0.8422385, 0.733068, -1.545597, 1, 1, 1, 1, 1,
-0.8374566, -0.2421887, -3.78386, 1, 1, 1, 1, 1,
-0.8318829, -0.05351797, -1.144787, 1, 1, 1, 1, 1,
-0.8307104, 1.281122, 0.6240889, 0, 0, 1, 1, 1,
-0.8288168, 0.2305305, -1.756245, 1, 0, 0, 1, 1,
-0.8270743, 0.128738, -2.05815, 1, 0, 0, 1, 1,
-0.8139538, -0.6321285, -2.11532, 1, 0, 0, 1, 1,
-0.811235, 0.4309615, -1.314687, 1, 0, 0, 1, 1,
-0.8076699, 1.329232, -0.9457958, 1, 0, 0, 1, 1,
-0.8046825, -0.05483744, -1.416227, 0, 0, 0, 1, 1,
-0.7963235, -2.593574, -3.303084, 0, 0, 0, 1, 1,
-0.7960415, 0.5552462, -1.884212, 0, 0, 0, 1, 1,
-0.7903254, 0.4160272, -0.8556042, 0, 0, 0, 1, 1,
-0.7890162, 0.5473097, -0.348578, 0, 0, 0, 1, 1,
-0.7845939, 0.5022099, -1.594351, 0, 0, 0, 1, 1,
-0.7811985, -0.6955264, -2.343761, 0, 0, 0, 1, 1,
-0.7788447, 0.5241953, -0.2499555, 1, 1, 1, 1, 1,
-0.7786333, -0.2271294, -1.63266, 1, 1, 1, 1, 1,
-0.7775129, -0.8331328, -2.484947, 1, 1, 1, 1, 1,
-0.7744641, -0.3168273, -3.978085, 1, 1, 1, 1, 1,
-0.7742181, 0.7814492, -1.77178, 1, 1, 1, 1, 1,
-0.7742144, 0.2960568, -0.8040786, 1, 1, 1, 1, 1,
-0.7736061, -0.5549867, -0.1634198, 1, 1, 1, 1, 1,
-0.77188, -0.01781753, -0.5436432, 1, 1, 1, 1, 1,
-0.7634521, -0.03790945, -0.1432249, 1, 1, 1, 1, 1,
-0.7627531, 0.117064, -1.166923, 1, 1, 1, 1, 1,
-0.7514006, 0.5511162, -0.3102073, 1, 1, 1, 1, 1,
-0.7512641, -1.161649, -3.079041, 1, 1, 1, 1, 1,
-0.7496665, -0.36662, -1.551367, 1, 1, 1, 1, 1,
-0.7490709, -0.009885443, -2.981727, 1, 1, 1, 1, 1,
-0.7484841, -0.3885915, -1.039479, 1, 1, 1, 1, 1,
-0.7399508, -0.3616803, -2.801629, 0, 0, 1, 1, 1,
-0.73002, 0.6385452, -1.848182, 1, 0, 0, 1, 1,
-0.7291448, -1.045198, -2.30303, 1, 0, 0, 1, 1,
-0.7280362, -0.7478591, -2.940871, 1, 0, 0, 1, 1,
-0.7246135, 0.02807406, -1.56603, 1, 0, 0, 1, 1,
-0.7199394, -0.6292244, -0.8971017, 1, 0, 0, 1, 1,
-0.703028, 0.01758934, -0.1549746, 0, 0, 0, 1, 1,
-0.7019124, -0.08433798, -2.893649, 0, 0, 0, 1, 1,
-0.6993782, 0.6688124, -2.374985, 0, 0, 0, 1, 1,
-0.694289, -1.748772, -3.292127, 0, 0, 0, 1, 1,
-0.6933647, -0.3824036, -3.453305, 0, 0, 0, 1, 1,
-0.6918957, 0.8670422, 1.224964, 0, 0, 0, 1, 1,
-0.6879801, -0.1765843, -2.195755, 0, 0, 0, 1, 1,
-0.6852292, 0.3638148, -1.03562, 1, 1, 1, 1, 1,
-0.6849799, -1.212788, -3.225724, 1, 1, 1, 1, 1,
-0.6844093, 0.2867195, -0.3481986, 1, 1, 1, 1, 1,
-0.6777452, 0.8910993, -1.077394, 1, 1, 1, 1, 1,
-0.6694484, -0.8105879, -2.441614, 1, 1, 1, 1, 1,
-0.6636721, 0.2052203, -0.8506812, 1, 1, 1, 1, 1,
-0.6628661, 0.2672791, -1.590279, 1, 1, 1, 1, 1,
-0.6604938, -0.1543711, -1.359915, 1, 1, 1, 1, 1,
-0.6579666, -0.4267846, -3.791313, 1, 1, 1, 1, 1,
-0.6573285, 0.9814033, -0.6453058, 1, 1, 1, 1, 1,
-0.6554143, 0.588648, -0.4179243, 1, 1, 1, 1, 1,
-0.6471251, 1.029514, 0.4306704, 1, 1, 1, 1, 1,
-0.6448649, 0.2546279, -2.28719, 1, 1, 1, 1, 1,
-0.644202, 0.2451441, -0.9131697, 1, 1, 1, 1, 1,
-0.6401458, 0.03656882, -1.811839, 1, 1, 1, 1, 1,
-0.6391361, -1.010941, -0.9456504, 0, 0, 1, 1, 1,
-0.6382655, -1.18388, -1.978509, 1, 0, 0, 1, 1,
-0.638007, 0.0984297, -1.567948, 1, 0, 0, 1, 1,
-0.636804, 0.2790899, -3.021877, 1, 0, 0, 1, 1,
-0.6351339, -1.869345, -4.253246, 1, 0, 0, 1, 1,
-0.6333485, 0.8384694, -0.895828, 1, 0, 0, 1, 1,
-0.6285856, 0.6274344, -2.822639, 0, 0, 0, 1, 1,
-0.6276779, -0.9021556, -4.455009, 0, 0, 0, 1, 1,
-0.6271406, -1.506031, -0.4874458, 0, 0, 0, 1, 1,
-0.6217508, 0.3019887, -1.558562, 0, 0, 0, 1, 1,
-0.6168102, 0.005535106, -2.251025, 0, 0, 0, 1, 1,
-0.6124259, 1.110831, -1.553329, 0, 0, 0, 1, 1,
-0.6108239, 0.1690814, -0.3433481, 0, 0, 0, 1, 1,
-0.6106267, 0.7129689, 1.199567, 1, 1, 1, 1, 1,
-0.6085397, -0.4241421, -2.979585, 1, 1, 1, 1, 1,
-0.6077926, -0.9611548, -2.175533, 1, 1, 1, 1, 1,
-0.6074675, -0.7912983, -1.337094, 1, 1, 1, 1, 1,
-0.6049647, 1.032461, -1.891947, 1, 1, 1, 1, 1,
-0.6025029, 1.918465, 1.570084, 1, 1, 1, 1, 1,
-0.5993737, 0.9972956, -1.089818, 1, 1, 1, 1, 1,
-0.5891904, 0.3740123, -0.8173813, 1, 1, 1, 1, 1,
-0.5836384, -0.3420239, -3.543636, 1, 1, 1, 1, 1,
-0.5834244, -0.7281657, -0.9617386, 1, 1, 1, 1, 1,
-0.5827637, -1.239112, -3.401054, 1, 1, 1, 1, 1,
-0.5826187, -0.8513072, -1.930556, 1, 1, 1, 1, 1,
-0.5785729, 0.2115872, -0.9080115, 1, 1, 1, 1, 1,
-0.5752768, -0.7518277, -2.787425, 1, 1, 1, 1, 1,
-0.568976, 0.717487, -0.1377288, 1, 1, 1, 1, 1,
-0.565904, -0.3079235, -1.822007, 0, 0, 1, 1, 1,
-0.5648943, 0.2334282, -0.3449399, 1, 0, 0, 1, 1,
-0.5609663, -1.500539, -2.038974, 1, 0, 0, 1, 1,
-0.5579826, -0.2065395, -0.9691907, 1, 0, 0, 1, 1,
-0.550782, -0.8139153, -1.525791, 1, 0, 0, 1, 1,
-0.5407943, -0.4804285, -3.930263, 1, 0, 0, 1, 1,
-0.5374231, -0.7385877, -1.432008, 0, 0, 0, 1, 1,
-0.5356442, -1.531197, -4.439372, 0, 0, 0, 1, 1,
-0.5345209, -0.7381597, -3.737087, 0, 0, 0, 1, 1,
-0.5337559, -0.1478473, -0.6090927, 0, 0, 0, 1, 1,
-0.5333375, 0.5677714, 0.6628995, 0, 0, 0, 1, 1,
-0.5298452, 0.7245927, -2.302011, 0, 0, 0, 1, 1,
-0.5293264, 0.04866084, -3.053126, 0, 0, 0, 1, 1,
-0.5274351, -0.9691672, -3.473905, 1, 1, 1, 1, 1,
-0.5259022, 0.3764935, -0.7293496, 1, 1, 1, 1, 1,
-0.5185987, -0.0614145, -2.851141, 1, 1, 1, 1, 1,
-0.5178646, 0.985889, 0.3139552, 1, 1, 1, 1, 1,
-0.5114469, -0.2679667, -2.10229, 1, 1, 1, 1, 1,
-0.5110727, -0.464553, -1.911441, 1, 1, 1, 1, 1,
-0.5039487, -0.6555083, -2.707031, 1, 1, 1, 1, 1,
-0.4992453, 0.1136816, 0.3144288, 1, 1, 1, 1, 1,
-0.4964543, 0.7390196, 2.297359, 1, 1, 1, 1, 1,
-0.4935478, 1.528054, 0.689324, 1, 1, 1, 1, 1,
-0.4908509, -1.020979, -2.604143, 1, 1, 1, 1, 1,
-0.4834824, -0.9895728, -3.376885, 1, 1, 1, 1, 1,
-0.4832818, 0.1346714, -1.490409, 1, 1, 1, 1, 1,
-0.4824775, 0.2534595, 9.655357e-05, 1, 1, 1, 1, 1,
-0.4817418, -0.4964132, -3.521701, 1, 1, 1, 1, 1,
-0.4814478, 0.02546003, -1.291208, 0, 0, 1, 1, 1,
-0.4805559, 1.521599, -0.04966318, 1, 0, 0, 1, 1,
-0.4804343, 0.5550049, -0.4140998, 1, 0, 0, 1, 1,
-0.479404, -0.8758804, -4.009889, 1, 0, 0, 1, 1,
-0.4767812, 0.2510929, -3.422678, 1, 0, 0, 1, 1,
-0.4763232, 0.7880324, -2.14847, 1, 0, 0, 1, 1,
-0.4759049, -0.09990004, -1.717448, 0, 0, 0, 1, 1,
-0.474577, 0.774203, -2.786065, 0, 0, 0, 1, 1,
-0.4734353, -0.01630146, -1.328386, 0, 0, 0, 1, 1,
-0.4661417, 0.8814012, 0.455164, 0, 0, 0, 1, 1,
-0.4623243, -1.141714, -3.104496, 0, 0, 0, 1, 1,
-0.4604575, -0.6761817, -3.065711, 0, 0, 0, 1, 1,
-0.4588175, -2.072229, -1.70861, 0, 0, 0, 1, 1,
-0.4579376, 0.4423778, -0.05987378, 1, 1, 1, 1, 1,
-0.4565089, 2.267217, 0.2469023, 1, 1, 1, 1, 1,
-0.4507654, -0.2608671, -1.07922, 1, 1, 1, 1, 1,
-0.4437341, -1.654667, -3.565805, 1, 1, 1, 1, 1,
-0.4425222, -0.3108734, -1.698441, 1, 1, 1, 1, 1,
-0.4411647, -1.093647, -3.80228, 1, 1, 1, 1, 1,
-0.4396179, 1.097015, 0.299635, 1, 1, 1, 1, 1,
-0.4387376, -0.1389522, -2.125598, 1, 1, 1, 1, 1,
-0.4325043, 0.5751873, -1.545567, 1, 1, 1, 1, 1,
-0.4281376, -0.3823345, -2.600876, 1, 1, 1, 1, 1,
-0.4224998, 0.05834644, -1.531637, 1, 1, 1, 1, 1,
-0.4208181, -0.9035435, -3.085118, 1, 1, 1, 1, 1,
-0.4164088, -1.231522, -1.835957, 1, 1, 1, 1, 1,
-0.4159829, -0.70126, -1.501643, 1, 1, 1, 1, 1,
-0.41096, -0.6019887, -2.949838, 1, 1, 1, 1, 1,
-0.4108309, -1.86669, -2.202008, 0, 0, 1, 1, 1,
-0.4070035, -0.1846179, -0.8853968, 1, 0, 0, 1, 1,
-0.4036684, -0.002234327, -1.44425, 1, 0, 0, 1, 1,
-0.4011857, -0.03675992, -2.375723, 1, 0, 0, 1, 1,
-0.3983133, 0.9415836, 0.3031992, 1, 0, 0, 1, 1,
-0.3957638, -0.01350449, 0.703797, 1, 0, 0, 1, 1,
-0.3956962, 0.3477707, -1.153847, 0, 0, 0, 1, 1,
-0.392038, 0.4099617, -0.8516797, 0, 0, 0, 1, 1,
-0.3896358, 0.7821513, -0.4833803, 0, 0, 0, 1, 1,
-0.3887395, -1.461717, -2.602844, 0, 0, 0, 1, 1,
-0.3864906, 0.03302023, -0.6644013, 0, 0, 0, 1, 1,
-0.3811225, -0.3629902, -1.83326, 0, 0, 0, 1, 1,
-0.3790541, -0.03683044, -2.987857, 0, 0, 0, 1, 1,
-0.3783627, -0.596645, -1.593384, 1, 1, 1, 1, 1,
-0.3756619, 0.168647, -0.5797973, 1, 1, 1, 1, 1,
-0.3753859, 0.6670901, 0.1727749, 1, 1, 1, 1, 1,
-0.3711063, 0.01618511, -0.604798, 1, 1, 1, 1, 1,
-0.3710868, -0.02833363, -2.181918, 1, 1, 1, 1, 1,
-0.3706787, 2.054105, -1.104753, 1, 1, 1, 1, 1,
-0.370122, -0.8876216, -2.171468, 1, 1, 1, 1, 1,
-0.3646303, 0.8034964, -0.9313874, 1, 1, 1, 1, 1,
-0.3626094, 0.5574567, -0.9529195, 1, 1, 1, 1, 1,
-0.3620229, 1.078537, 0.1366246, 1, 1, 1, 1, 1,
-0.3603211, -0.3041448, -3.614883, 1, 1, 1, 1, 1,
-0.3579825, 1.377133, 0.2459715, 1, 1, 1, 1, 1,
-0.3568625, -0.8280145, -3.215712, 1, 1, 1, 1, 1,
-0.3487933, 0.4113465, -1.043968, 1, 1, 1, 1, 1,
-0.3465519, 0.4840719, -0.2699281, 1, 1, 1, 1, 1,
-0.341293, -0.6236183, -5.14722, 0, 0, 1, 1, 1,
-0.33992, -0.2269345, -2.997866, 1, 0, 0, 1, 1,
-0.3364262, -0.9194546, -3.627776, 1, 0, 0, 1, 1,
-0.3335848, 1.010126, 0.2428059, 1, 0, 0, 1, 1,
-0.319609, 2.184922, -0.7311902, 1, 0, 0, 1, 1,
-0.3187287, -0.4088056, -2.733492, 1, 0, 0, 1, 1,
-0.31183, 1.113357, 0.3185687, 0, 0, 0, 1, 1,
-0.3106386, 0.1706573, -1.364606, 0, 0, 0, 1, 1,
-0.3059902, 0.5611203, -2.09402, 0, 0, 0, 1, 1,
-0.3057462, 1.416526, -1.03654, 0, 0, 0, 1, 1,
-0.302269, 0.3156862, 0.8591015, 0, 0, 0, 1, 1,
-0.2960753, 1.089382, 0.7202105, 0, 0, 0, 1, 1,
-0.2928706, -0.6043393, -3.239049, 0, 0, 0, 1, 1,
-0.2892233, -1.505714, -4.080697, 1, 1, 1, 1, 1,
-0.2885762, -0.8061127, -2.850017, 1, 1, 1, 1, 1,
-0.286058, -1.109828, -2.366033, 1, 1, 1, 1, 1,
-0.2849825, -0.3007868, -1.57156, 1, 1, 1, 1, 1,
-0.2825586, 0.3004566, -0.7443368, 1, 1, 1, 1, 1,
-0.2797475, 1.611799, 0.03101816, 1, 1, 1, 1, 1,
-0.279681, -1.460045, -2.93816, 1, 1, 1, 1, 1,
-0.2793337, 1.050735, 0.4315906, 1, 1, 1, 1, 1,
-0.2790433, 1.229339, -0.7404366, 1, 1, 1, 1, 1,
-0.2774127, -1.45743, -3.742723, 1, 1, 1, 1, 1,
-0.274567, 2.355613, -1.31346, 1, 1, 1, 1, 1,
-0.2738031, 0.1653848, 0.05586013, 1, 1, 1, 1, 1,
-0.2636604, -0.1878516, -2.334043, 1, 1, 1, 1, 1,
-0.2622741, 0.7745904, -1.940466, 1, 1, 1, 1, 1,
-0.2575436, -0.2119403, -1.420518, 1, 1, 1, 1, 1,
-0.2566624, -0.8120468, -3.391392, 0, 0, 1, 1, 1,
-0.2564108, -0.2486527, -3.832934, 1, 0, 0, 1, 1,
-0.2513249, 0.477084, -0.770097, 1, 0, 0, 1, 1,
-0.2506033, 1.666767, -0.9118974, 1, 0, 0, 1, 1,
-0.248762, -0.755404, -2.888155, 1, 0, 0, 1, 1,
-0.2453907, 0.5529319, -1.003762, 1, 0, 0, 1, 1,
-0.243019, 1.047529, -1.093376, 0, 0, 0, 1, 1,
-0.2425991, 0.7094159, 0.182661, 0, 0, 0, 1, 1,
-0.2418693, -2.248016, -1.205221, 0, 0, 0, 1, 1,
-0.2374268, -0.5424539, -1.293523, 0, 0, 0, 1, 1,
-0.2358044, -1.929008, -2.368242, 0, 0, 0, 1, 1,
-0.2348125, -0.06667, -1.998943, 0, 0, 0, 1, 1,
-0.2275571, -0.1417694, -2.253428, 0, 0, 0, 1, 1,
-0.2260701, 0.08290636, -1.902295, 1, 1, 1, 1, 1,
-0.2213412, 0.1496803, -0.9950709, 1, 1, 1, 1, 1,
-0.2208281, 0.2551192, -2.657757, 1, 1, 1, 1, 1,
-0.2197406, 0.217662, -0.7879516, 1, 1, 1, 1, 1,
-0.2173894, -0.08896112, -1.984564, 1, 1, 1, 1, 1,
-0.2166606, 0.6634545, -0.01189458, 1, 1, 1, 1, 1,
-0.2159531, -0.5418487, -2.681324, 1, 1, 1, 1, 1,
-0.215189, 0.6101723, -1.515348, 1, 1, 1, 1, 1,
-0.2119693, -0.2388514, -5.252593, 1, 1, 1, 1, 1,
-0.208049, 1.149781, -1.013585, 1, 1, 1, 1, 1,
-0.2009039, -1.078819, -3.498209, 1, 1, 1, 1, 1,
-0.2006809, -0.1972341, -4.024693, 1, 1, 1, 1, 1,
-0.1995223, -1.608576, -3.913711, 1, 1, 1, 1, 1,
-0.1989416, 0.02089138, -0.8972313, 1, 1, 1, 1, 1,
-0.1984313, -0.02663942, -0.3855267, 1, 1, 1, 1, 1,
-0.1971111, -0.320402, -3.66419, 0, 0, 1, 1, 1,
-0.1939472, 0.6554117, 0.8052725, 1, 0, 0, 1, 1,
-0.1916635, -0.5455678, -3.440363, 1, 0, 0, 1, 1,
-0.1822024, -0.3279288, -3.368452, 1, 0, 0, 1, 1,
-0.181202, 1.242482, -0.4349916, 1, 0, 0, 1, 1,
-0.1781776, -0.5308658, -3.434451, 1, 0, 0, 1, 1,
-0.1780173, 0.4496813, -1.225424, 0, 0, 0, 1, 1,
-0.1644964, -0.02053115, -2.782611, 0, 0, 0, 1, 1,
-0.1640335, 0.4614747, -1.139557, 0, 0, 0, 1, 1,
-0.1635747, -0.2916357, -3.568866, 0, 0, 0, 1, 1,
-0.1611593, -1.243245, -4.087973, 0, 0, 0, 1, 1,
-0.1608633, 0.06952962, -3.059371, 0, 0, 0, 1, 1,
-0.1599252, 0.3695228, -0.04619372, 0, 0, 0, 1, 1,
-0.1597807, -1.90739, -2.221354, 1, 1, 1, 1, 1,
-0.155611, 0.1137633, 0.105134, 1, 1, 1, 1, 1,
-0.1548754, 0.4418211, -1.589213, 1, 1, 1, 1, 1,
-0.1406857, 0.9280916, -1.232326, 1, 1, 1, 1, 1,
-0.1361384, 0.07656902, -1.012219, 1, 1, 1, 1, 1,
-0.1315498, 0.3232212, -0.8575956, 1, 1, 1, 1, 1,
-0.1315311, 0.5067083, 0.7542396, 1, 1, 1, 1, 1,
-0.1308433, -1.826649, -3.044113, 1, 1, 1, 1, 1,
-0.1296296, 2.017415, -0.6776769, 1, 1, 1, 1, 1,
-0.124218, -1.035274, -4.090252, 1, 1, 1, 1, 1,
-0.122136, -0.1401792, -1.941832, 1, 1, 1, 1, 1,
-0.1217843, 0.498127, -1.624689, 1, 1, 1, 1, 1,
-0.0954747, -0.06548818, -3.154707, 1, 1, 1, 1, 1,
-0.0942753, 0.7960178, -0.6130015, 1, 1, 1, 1, 1,
-0.09422311, 0.4697053, 0.9213347, 1, 1, 1, 1, 1,
-0.09417816, 0.1533791, 0.3494168, 0, 0, 1, 1, 1,
-0.09393725, -0.5567714, -1.250185, 1, 0, 0, 1, 1,
-0.09218284, -1.62819, -3.426151, 1, 0, 0, 1, 1,
-0.0888203, 0.1351406, -0.173273, 1, 0, 0, 1, 1,
-0.08745924, -1.195849, -2.82941, 1, 0, 0, 1, 1,
-0.08287005, 0.3019774, -0.7815182, 1, 0, 0, 1, 1,
-0.08286122, -1.304116, -3.262344, 0, 0, 0, 1, 1,
-0.08127604, -0.2858723, -3.14554, 0, 0, 0, 1, 1,
-0.08076646, -1.024107, -4.088558, 0, 0, 0, 1, 1,
-0.07699944, -0.1472601, -2.702097, 0, 0, 0, 1, 1,
-0.07690378, -1.762926, -3.573115, 0, 0, 0, 1, 1,
-0.07670189, -0.02467142, -1.052517, 0, 0, 0, 1, 1,
-0.0764431, -0.9340722, -3.726145, 0, 0, 0, 1, 1,
-0.06698518, -0.9196929, -4.145527, 1, 1, 1, 1, 1,
-0.06652829, -0.1986457, -2.87347, 1, 1, 1, 1, 1,
-0.06199264, -1.067022, -2.729894, 1, 1, 1, 1, 1,
-0.06082525, -0.2776134, -2.750851, 1, 1, 1, 1, 1,
-0.060772, 2.017035, 0.6730834, 1, 1, 1, 1, 1,
-0.05778594, -0.467074, -3.589016, 1, 1, 1, 1, 1,
-0.05028538, 0.2963755, 0.4680639, 1, 1, 1, 1, 1,
-0.04620158, -0.02983429, -0.3957507, 1, 1, 1, 1, 1,
-0.04539626, 0.6726487, -1.631055, 1, 1, 1, 1, 1,
-0.04270876, -0.5769626, -2.795149, 1, 1, 1, 1, 1,
-0.0417342, -0.6519343, -3.144439, 1, 1, 1, 1, 1,
-0.04104488, 0.5232041, -1.104614, 1, 1, 1, 1, 1,
-0.04008124, 2.657578, -0.233164, 1, 1, 1, 1, 1,
-0.03950152, 0.4522182, -0.8839567, 1, 1, 1, 1, 1,
-0.03885446, -1.035353, -1.211971, 1, 1, 1, 1, 1,
-0.03861033, 0.5231987, -2.046657, 0, 0, 1, 1, 1,
-0.03856288, 0.2820371, -0.7144449, 1, 0, 0, 1, 1,
-0.02839642, -1.359044, -3.861665, 1, 0, 0, 1, 1,
-0.02564879, 0.2801483, 1.197613, 1, 0, 0, 1, 1,
-0.0189372, -0.9475526, -2.852355, 1, 0, 0, 1, 1,
-0.01255189, -0.4784319, -4.270018, 1, 0, 0, 1, 1,
-0.003491634, 1.139819, -0.04744086, 0, 0, 0, 1, 1,
-3.452044e-05, 0.3727078, 0.4236147, 0, 0, 0, 1, 1,
0.001450989, 2.148371, 1.56535, 0, 0, 0, 1, 1,
0.002501166, 1.664535, -0.9815415, 0, 0, 0, 1, 1,
0.005152842, -2.136774, 1.347134, 0, 0, 0, 1, 1,
0.006168202, -1.328044, 3.715002, 0, 0, 0, 1, 1,
0.02821155, -0.6722751, 4.789435, 0, 0, 0, 1, 1,
0.03107146, 0.758848, 0.9155202, 1, 1, 1, 1, 1,
0.03176953, -0.5655755, 1.485444, 1, 1, 1, 1, 1,
0.03776779, 0.5708553, 1.94248, 1, 1, 1, 1, 1,
0.03951, -0.1067748, 1.416263, 1, 1, 1, 1, 1,
0.03959598, -0.768632, 4.760174, 1, 1, 1, 1, 1,
0.03960539, 0.6838354, 0.7498584, 1, 1, 1, 1, 1,
0.04211115, 0.4252809, 1.263361, 1, 1, 1, 1, 1,
0.04396082, -0.2995274, 3.475301, 1, 1, 1, 1, 1,
0.0462911, 0.8318486, 0.01438429, 1, 1, 1, 1, 1,
0.04660414, 2.709022, -1.61511, 1, 1, 1, 1, 1,
0.04796892, -0.05710925, 3.896439, 1, 1, 1, 1, 1,
0.04860112, -0.7729169, 3.416438, 1, 1, 1, 1, 1,
0.04866497, -1.271241, 3.100542, 1, 1, 1, 1, 1,
0.05155646, 0.5332596, -1.422659, 1, 1, 1, 1, 1,
0.05178342, 0.2375314, -0.666344, 1, 1, 1, 1, 1,
0.05212323, 0.5430998, -0.006772859, 0, 0, 1, 1, 1,
0.05529153, 0.1318535, 0.2968518, 1, 0, 0, 1, 1,
0.05630665, 0.1726528, 0.4460619, 1, 0, 0, 1, 1,
0.05762419, -2.133606, 2.288804, 1, 0, 0, 1, 1,
0.06612477, 1.203744, 0.9148555, 1, 0, 0, 1, 1,
0.07825385, 1.131927, 0.9083281, 1, 0, 0, 1, 1,
0.07970076, -0.2235255, 2.186471, 0, 0, 0, 1, 1,
0.08183724, -0.9786847, 3.453754, 0, 0, 0, 1, 1,
0.08195316, 0.06869245, 0.9920986, 0, 0, 0, 1, 1,
0.08282936, 0.07716922, 1.683981, 0, 0, 0, 1, 1,
0.08437325, -0.7394346, 5.117063, 0, 0, 0, 1, 1,
0.08674914, 0.7905402, 1.650727, 0, 0, 0, 1, 1,
0.08676378, -0.2002974, 2.199516, 0, 0, 0, 1, 1,
0.09097475, 1.296192, 1.716254, 1, 1, 1, 1, 1,
0.09604761, 2.82666, -0.8565163, 1, 1, 1, 1, 1,
0.09794392, -1.171265, 3.643301, 1, 1, 1, 1, 1,
0.09813746, 0.5643812, 0.02809014, 1, 1, 1, 1, 1,
0.1020946, -0.2750725, 4.144001, 1, 1, 1, 1, 1,
0.1125087, 0.9553344, 0.1438654, 1, 1, 1, 1, 1,
0.1159585, -4.261342, 4.75491, 1, 1, 1, 1, 1,
0.1206295, 0.1535576, 0.9741795, 1, 1, 1, 1, 1,
0.1251285, -1.850803, 1.771359, 1, 1, 1, 1, 1,
0.1306586, -1.37026, 3.715905, 1, 1, 1, 1, 1,
0.1347807, 0.2418001, 1.127691, 1, 1, 1, 1, 1,
0.1353917, 0.4515153, 1.404359, 1, 1, 1, 1, 1,
0.1390638, 0.189007, 0.73918, 1, 1, 1, 1, 1,
0.1398738, 1.256268, 0.1239628, 1, 1, 1, 1, 1,
0.1439959, 0.5219675, 0.9504014, 1, 1, 1, 1, 1,
0.1458031, 0.1172863, 0.340243, 0, 0, 1, 1, 1,
0.147039, -0.6143112, 3.300091, 1, 0, 0, 1, 1,
0.1500314, 1.715372, 0.5946409, 1, 0, 0, 1, 1,
0.1556126, -0.5849194, 3.508219, 1, 0, 0, 1, 1,
0.1600338, -0.5331085, 2.513501, 1, 0, 0, 1, 1,
0.1614432, 0.5109352, 2.571836, 1, 0, 0, 1, 1,
0.1628464, -0.1581918, 1.724547, 0, 0, 0, 1, 1,
0.167112, 0.7073238, -1.539484, 0, 0, 0, 1, 1,
0.1673067, 0.6312383, -1.778564, 0, 0, 0, 1, 1,
0.1712526, 1.163429, 1.332156, 0, 0, 0, 1, 1,
0.1737153, -0.08013928, 1.554675, 0, 0, 0, 1, 1,
0.174583, 0.0698887, 0.9895062, 0, 0, 0, 1, 1,
0.1789524, 0.9854284, -0.1519181, 0, 0, 0, 1, 1,
0.1789948, 0.566348, 0.6519352, 1, 1, 1, 1, 1,
0.1835303, -2.367069, 1.90611, 1, 1, 1, 1, 1,
0.1865127, -0.7297811, 2.907446, 1, 1, 1, 1, 1,
0.192164, -1.157548, 2.653952, 1, 1, 1, 1, 1,
0.1932854, 2.487592, 0.6980497, 1, 1, 1, 1, 1,
0.1940071, 1.118141, -0.2580402, 1, 1, 1, 1, 1,
0.1992001, -0.3198971, 1.501696, 1, 1, 1, 1, 1,
0.1992866, -0.13128, 3.185903, 1, 1, 1, 1, 1,
0.1998071, 0.1582617, 2.158127, 1, 1, 1, 1, 1,
0.2042287, 0.5647191, 0.2774655, 1, 1, 1, 1, 1,
0.2045893, -0.9961604, 4.108607, 1, 1, 1, 1, 1,
0.2070155, 0.6139129, -1.648037, 1, 1, 1, 1, 1,
0.2144012, 0.3242216, 0.7703387, 1, 1, 1, 1, 1,
0.2144047, -1.077055, 1.865459, 1, 1, 1, 1, 1,
0.2159304, -1.033912, 3.397068, 1, 1, 1, 1, 1,
0.2165691, -1.113188, 5.022735, 0, 0, 1, 1, 1,
0.2226743, -1.030874, 3.986429, 1, 0, 0, 1, 1,
0.2227698, 0.01541711, 2.322619, 1, 0, 0, 1, 1,
0.2239638, 0.4918344, -0.06518731, 1, 0, 0, 1, 1,
0.2248889, -0.05242735, 0.6006579, 1, 0, 0, 1, 1,
0.2286331, 1.614406, 0.7694906, 1, 0, 0, 1, 1,
0.2298225, 1.007599, -0.3531355, 0, 0, 0, 1, 1,
0.2311965, -1.038131, 1.92498, 0, 0, 0, 1, 1,
0.2444562, 0.5282056, 0.9996013, 0, 0, 0, 1, 1,
0.2448876, 0.197911, 1.779962, 0, 0, 0, 1, 1,
0.2494769, 0.6819307, -1.852132, 0, 0, 0, 1, 1,
0.2512081, 2.897467, -0.6630685, 0, 0, 0, 1, 1,
0.2545553, -1.077758, 4.00575, 0, 0, 0, 1, 1,
0.2611775, 0.560366, -0.2677167, 1, 1, 1, 1, 1,
0.2647133, 1.196662, 0.982887, 1, 1, 1, 1, 1,
0.2654437, 0.3714323, 1.038075, 1, 1, 1, 1, 1,
0.2656887, -0.4326707, 2.401274, 1, 1, 1, 1, 1,
0.2661055, 2.162055, -0.1473491, 1, 1, 1, 1, 1,
0.274128, 0.2288932, 2.386768, 1, 1, 1, 1, 1,
0.277877, -0.2494862, 1.492237, 1, 1, 1, 1, 1,
0.2799623, -0.3670619, 3.958993, 1, 1, 1, 1, 1,
0.2815166, -0.270806, 1.038456, 1, 1, 1, 1, 1,
0.2846876, -1.445147, 2.741984, 1, 1, 1, 1, 1,
0.2935368, 0.100655, 1.936691, 1, 1, 1, 1, 1,
0.297282, -0.959228, 2.651553, 1, 1, 1, 1, 1,
0.2981894, -0.0337236, 0.7400135, 1, 1, 1, 1, 1,
0.2997553, -1.298106, 3.672354, 1, 1, 1, 1, 1,
0.3014399, -0.1476893, 1.861113, 1, 1, 1, 1, 1,
0.3019297, -1.630407, 1.977766, 0, 0, 1, 1, 1,
0.3046071, -1.970559, 1.693281, 1, 0, 0, 1, 1,
0.3047835, -0.2848613, 4.24753, 1, 0, 0, 1, 1,
0.3056165, 0.9040418, -0.3482477, 1, 0, 0, 1, 1,
0.3082331, 0.4001629, 0.1520593, 1, 0, 0, 1, 1,
0.3094504, -1.277066, 2.879139, 1, 0, 0, 1, 1,
0.3131736, 0.1474027, 0.2291188, 0, 0, 0, 1, 1,
0.3163296, -0.3119029, 2.983468, 0, 0, 0, 1, 1,
0.3190031, 0.4947353, 1.32729, 0, 0, 0, 1, 1,
0.3199711, 0.3803245, 0.370591, 0, 0, 0, 1, 1,
0.3219901, 1.028406, 1.787966, 0, 0, 0, 1, 1,
0.3228047, -1.963745, 3.209192, 0, 0, 0, 1, 1,
0.325768, 0.2129988, 0.5764572, 0, 0, 0, 1, 1,
0.3275782, -0.71398, 3.871102, 1, 1, 1, 1, 1,
0.3287737, -1.468308, 2.970784, 1, 1, 1, 1, 1,
0.3296739, 1.257585, -0.07006656, 1, 1, 1, 1, 1,
0.34014, -1.521052, 2.694012, 1, 1, 1, 1, 1,
0.3423833, 0.7317907, 1.729017, 1, 1, 1, 1, 1,
0.3486421, 0.4075291, 0.08979519, 1, 1, 1, 1, 1,
0.3521763, -0.5327301, 2.130632, 1, 1, 1, 1, 1,
0.3583947, -1.096471, 1.492435, 1, 1, 1, 1, 1,
0.362702, -0.2510241, 0.9310018, 1, 1, 1, 1, 1,
0.3663298, -1.016315, 2.918885, 1, 1, 1, 1, 1,
0.369896, 0.2109443, 1.937884, 1, 1, 1, 1, 1,
0.3750963, 0.5661842, -0.1438306, 1, 1, 1, 1, 1,
0.3762367, 0.7017092, 1.794588, 1, 1, 1, 1, 1,
0.3766233, -0.5387058, 2.666455, 1, 1, 1, 1, 1,
0.3856632, -0.1246429, -0.02787461, 1, 1, 1, 1, 1,
0.3891138, 0.9430643, 1.779887, 0, 0, 1, 1, 1,
0.3910012, 0.2353496, 1.227291, 1, 0, 0, 1, 1,
0.3940929, 0.3056495, -1.195625, 1, 0, 0, 1, 1,
0.3956431, 1.081144, -0.3643643, 1, 0, 0, 1, 1,
0.3969012, -1.182486, 3.949786, 1, 0, 0, 1, 1,
0.3976609, 0.767256, 0.4896593, 1, 0, 0, 1, 1,
0.3982751, -0.9074227, 1.575773, 0, 0, 0, 1, 1,
0.3993256, 2.012835, -0.5819916, 0, 0, 0, 1, 1,
0.4021851, 0.1877059, 0.74884, 0, 0, 0, 1, 1,
0.40596, 1.848177, 0.1824973, 0, 0, 0, 1, 1,
0.4107129, 0.7375209, 1.003428, 0, 0, 0, 1, 1,
0.4113281, -1.160348, 2.714065, 0, 0, 0, 1, 1,
0.414272, 0.06701364, 1.886666, 0, 0, 0, 1, 1,
0.4163267, 1.380121, 0.4538662, 1, 1, 1, 1, 1,
0.4224713, -0.4334705, 2.608578, 1, 1, 1, 1, 1,
0.42777, 0.1846433, -0.8760791, 1, 1, 1, 1, 1,
0.4302383, -1.016099, 2.096051, 1, 1, 1, 1, 1,
0.4334311, 0.3136452, 0.2639433, 1, 1, 1, 1, 1,
0.4347402, 0.6055439, -0.9914812, 1, 1, 1, 1, 1,
0.4394845, 0.53141, 0.2870109, 1, 1, 1, 1, 1,
0.441594, 0.008416716, 1.615389, 1, 1, 1, 1, 1,
0.4475912, -0.568715, 4.509368, 1, 1, 1, 1, 1,
0.4487056, -0.0103511, 1.296918, 1, 1, 1, 1, 1,
0.4521801, 2.304823, 0.4400485, 1, 1, 1, 1, 1,
0.4548917, -0.4328998, 3.017724, 1, 1, 1, 1, 1,
0.4575671, 0.7978795, 0.05429262, 1, 1, 1, 1, 1,
0.4575913, -1.65803, 2.189512, 1, 1, 1, 1, 1,
0.4602178, 0.0329097, 2.305024, 1, 1, 1, 1, 1,
0.460267, 0.5710247, 0.9122137, 0, 0, 1, 1, 1,
0.4621492, -0.9895404, 4.134434, 1, 0, 0, 1, 1,
0.4633815, -0.316565, 2.341594, 1, 0, 0, 1, 1,
0.4651209, 0.4101349, 1.557922, 1, 0, 0, 1, 1,
0.4706543, 0.4330451, 0.3442103, 1, 0, 0, 1, 1,
0.4722353, -2.003532, 3.84545, 1, 0, 0, 1, 1,
0.4733584, -0.5861415, 2.623687, 0, 0, 0, 1, 1,
0.4741315, 0.3627711, 2.09907, 0, 0, 0, 1, 1,
0.474451, 0.3259072, 0.3783626, 0, 0, 0, 1, 1,
0.474728, 0.5479091, 1.234869, 0, 0, 0, 1, 1,
0.4749253, 0.9642352, 0.8935601, 0, 0, 0, 1, 1,
0.4773808, 0.1061671, 0.09896692, 0, 0, 0, 1, 1,
0.4845527, 1.408372, 0.1998204, 0, 0, 0, 1, 1,
0.4868252, -0.206819, 2.96721, 1, 1, 1, 1, 1,
0.4908189, 1.471775, 2.025966, 1, 1, 1, 1, 1,
0.4942387, 0.3409464, 1.102733, 1, 1, 1, 1, 1,
0.4966452, 0.2304432, 0.6674963, 1, 1, 1, 1, 1,
0.5011381, -0.6399137, 2.03687, 1, 1, 1, 1, 1,
0.5017963, 0.7843791, 0.3191828, 1, 1, 1, 1, 1,
0.5027241, 0.4744868, 1.498208, 1, 1, 1, 1, 1,
0.509389, -0.9187163, 1.486683, 1, 1, 1, 1, 1,
0.5172977, 0.6634969, 0.1048651, 1, 1, 1, 1, 1,
0.5173108, 2.490699, 0.4078239, 1, 1, 1, 1, 1,
0.5177456, 0.07215549, 1.394922, 1, 1, 1, 1, 1,
0.5188196, -0.07776834, 2.451006, 1, 1, 1, 1, 1,
0.5202168, 0.1667792, 1.609887, 1, 1, 1, 1, 1,
0.5212591, -1.112888, 3.136454, 1, 1, 1, 1, 1,
0.531514, 1.669908, 0.3811458, 1, 1, 1, 1, 1,
0.532986, -1.319583, 2.490148, 0, 0, 1, 1, 1,
0.5331655, -0.9154963, 1.890379, 1, 0, 0, 1, 1,
0.5370258, -0.530658, 2.013958, 1, 0, 0, 1, 1,
0.5371481, 1.60623, 1.36967, 1, 0, 0, 1, 1,
0.5376432, 0.7565515, 0.4496914, 1, 0, 0, 1, 1,
0.5459021, 0.7941915, 1.513679, 1, 0, 0, 1, 1,
0.5465459, 0.6158933, 1.085687, 0, 0, 0, 1, 1,
0.5469774, 1.061293, -1.489526, 0, 0, 0, 1, 1,
0.5475641, -0.1096385, 3.489928, 0, 0, 0, 1, 1,
0.5478125, 0.9961365, -0.2788529, 0, 0, 0, 1, 1,
0.5524208, 1.494972, -0.1886841, 0, 0, 0, 1, 1,
0.553948, 0.3192725, 0.7185474, 0, 0, 0, 1, 1,
0.5562181, -0.6938347, 2.083465, 0, 0, 0, 1, 1,
0.5567163, -0.3807411, 1.469473, 1, 1, 1, 1, 1,
0.558978, 0.2236549, 0.8321593, 1, 1, 1, 1, 1,
0.5598723, -0.2623695, 2.604357, 1, 1, 1, 1, 1,
0.5627778, -0.5048992, 2.22297, 1, 1, 1, 1, 1,
0.5681744, -0.3465326, 0.2358393, 1, 1, 1, 1, 1,
0.5704652, -0.2549707, 3.029663, 1, 1, 1, 1, 1,
0.5727857, 0.345347, -0.308542, 1, 1, 1, 1, 1,
0.5737436, 1.268965, 3.156298, 1, 1, 1, 1, 1,
0.5742205, 0.2582817, -0.03969623, 1, 1, 1, 1, 1,
0.578616, 0.5972774, 1.044397, 1, 1, 1, 1, 1,
0.5810764, 0.4452733, 1.898391, 1, 1, 1, 1, 1,
0.5817177, -1.720125, 2.109136, 1, 1, 1, 1, 1,
0.5818913, -0.124349, 2.352623, 1, 1, 1, 1, 1,
0.5823517, -0.09754828, 2.064661, 1, 1, 1, 1, 1,
0.5860868, -0.4498078, 1.59604, 1, 1, 1, 1, 1,
0.5895722, 0.2458832, 0.6724908, 0, 0, 1, 1, 1,
0.5937907, 0.1506874, 2.268387, 1, 0, 0, 1, 1,
0.5947015, -1.45664, 1.637394, 1, 0, 0, 1, 1,
0.594831, 2.133617, -0.3849996, 1, 0, 0, 1, 1,
0.5966076, 0.4720584, -0.1689292, 1, 0, 0, 1, 1,
0.6003709, -1.949714, 2.130239, 1, 0, 0, 1, 1,
0.6029804, 0.782356, 2.164913, 0, 0, 0, 1, 1,
0.614447, -0.433722, 1.28886, 0, 0, 0, 1, 1,
0.6194234, -0.4732449, 3.141878, 0, 0, 0, 1, 1,
0.6287061, 0.6235687, 0.2311303, 0, 0, 0, 1, 1,
0.6287752, 1.269437, -0.5910468, 0, 0, 0, 1, 1,
0.6325091, 0.8984529, 1.825817, 0, 0, 0, 1, 1,
0.6358675, -0.5991586, 1.305924, 0, 0, 0, 1, 1,
0.6362474, -0.0402504, 1.069833, 1, 1, 1, 1, 1,
0.6407044, 0.7121416, -0.9042753, 1, 1, 1, 1, 1,
0.6492932, -0.04711441, 1.150036, 1, 1, 1, 1, 1,
0.6517534, -1.195275, 2.021315, 1, 1, 1, 1, 1,
0.6523218, -1.006155, 1.654094, 1, 1, 1, 1, 1,
0.6530882, 0.1554823, 1.922559, 1, 1, 1, 1, 1,
0.6571674, -0.3902943, 2.396781, 1, 1, 1, 1, 1,
0.6584927, -1.490606, 2.664843, 1, 1, 1, 1, 1,
0.6597639, -0.8301126, 2.067145, 1, 1, 1, 1, 1,
0.6605903, 0.1044659, -1.715789, 1, 1, 1, 1, 1,
0.6618318, 1.527854, -0.1482144, 1, 1, 1, 1, 1,
0.6642876, -0.7715953, 3.696936, 1, 1, 1, 1, 1,
0.665392, 1.104054, 3.86544, 1, 1, 1, 1, 1,
0.666075, 0.5092179, 1.11043, 1, 1, 1, 1, 1,
0.6673005, -1.730449, 3.457781, 1, 1, 1, 1, 1,
0.6735104, -0.8104082, 1.244061, 0, 0, 1, 1, 1,
0.6866123, -1.653324, 3.273252, 1, 0, 0, 1, 1,
0.6880879, -0.1354225, 2.17722, 1, 0, 0, 1, 1,
0.6944514, -0.1253571, 1.62028, 1, 0, 0, 1, 1,
0.6946972, 1.60718, 0.05806877, 1, 0, 0, 1, 1,
0.6949653, 1.368372, -1.206702, 1, 0, 0, 1, 1,
0.6973692, -1.78641, 2.405729, 0, 0, 0, 1, 1,
0.6985963, 0.13487, 0.4792648, 0, 0, 0, 1, 1,
0.6994647, -0.3452222, 2.306112, 0, 0, 0, 1, 1,
0.6998514, 1.130034, 1.215552, 0, 0, 0, 1, 1,
0.7020335, 0.1889578, 1.988129, 0, 0, 0, 1, 1,
0.7036793, -0.4391231, 4.12518, 0, 0, 0, 1, 1,
0.7036821, 1.961625, 1.308542, 0, 0, 0, 1, 1,
0.7072486, 1.156505, 0.218348, 1, 1, 1, 1, 1,
0.7112441, 0.07207183, 2.764419, 1, 1, 1, 1, 1,
0.7113656, -0.7113034, 3.226648, 1, 1, 1, 1, 1,
0.7131123, -1.141867, 2.665296, 1, 1, 1, 1, 1,
0.7157596, -0.3112582, 0.7346774, 1, 1, 1, 1, 1,
0.7166106, 0.04347566, 2.143465, 1, 1, 1, 1, 1,
0.7172912, -0.2677131, 2.155509, 1, 1, 1, 1, 1,
0.728877, -0.5062642, 1.30309, 1, 1, 1, 1, 1,
0.7358444, -1.086355, 0.9761522, 1, 1, 1, 1, 1,
0.7418974, 0.7235203, 0.5287882, 1, 1, 1, 1, 1,
0.742116, -0.6454175, 2.886834, 1, 1, 1, 1, 1,
0.7440071, -3.111896, 0.7924742, 1, 1, 1, 1, 1,
0.7446484, 1.134408, 1.491741, 1, 1, 1, 1, 1,
0.7467114, -0.6784853, 2.041357, 1, 1, 1, 1, 1,
0.7488601, -1.007019, 0.9379025, 1, 1, 1, 1, 1,
0.7499272, 0.2240504, 0.3084129, 0, 0, 1, 1, 1,
0.7593668, 1.321477, 0.6923255, 1, 0, 0, 1, 1,
0.7634774, 0.1274449, 1.789434, 1, 0, 0, 1, 1,
0.7636628, 0.3953192, 1.582217, 1, 0, 0, 1, 1,
0.7648374, 0.8062792, 0.9815034, 1, 0, 0, 1, 1,
0.7674831, 1.53903, 2.946361, 1, 0, 0, 1, 1,
0.7687077, -1.4625, 3.060105, 0, 0, 0, 1, 1,
0.7698018, -0.8769339, 3.699989, 0, 0, 0, 1, 1,
0.7718799, 0.1400809, 1.969432, 0, 0, 0, 1, 1,
0.7758776, -1.875678, 2.546256, 0, 0, 0, 1, 1,
0.7841435, 3.310674, -0.9378734, 0, 0, 0, 1, 1,
0.7883384, -0.2768887, 1.790304, 0, 0, 0, 1, 1,
0.7915708, -0.7897294, 1.716186, 0, 0, 0, 1, 1,
0.8027808, -0.6469993, 0.7134866, 1, 1, 1, 1, 1,
0.8032311, 0.676451, 1.524833, 1, 1, 1, 1, 1,
0.807949, -0.04776347, 0.5996192, 1, 1, 1, 1, 1,
0.8088396, 2.150306, 0.8132472, 1, 1, 1, 1, 1,
0.809245, -1.819531, 1.915723, 1, 1, 1, 1, 1,
0.8134316, 1.851638, 2.56686, 1, 1, 1, 1, 1,
0.8181178, -0.02411637, 1.626365, 1, 1, 1, 1, 1,
0.8187575, 1.268629, 0.2999781, 1, 1, 1, 1, 1,
0.819555, 0.8561034, -0.6176112, 1, 1, 1, 1, 1,
0.8219253, 0.35029, 2.095876, 1, 1, 1, 1, 1,
0.8267344, -0.09592383, 2.263524, 1, 1, 1, 1, 1,
0.8285027, -0.01718563, 0.5438116, 1, 1, 1, 1, 1,
0.8285866, -0.7134426, 2.752051, 1, 1, 1, 1, 1,
0.8410802, -1.138408, 3.1448, 1, 1, 1, 1, 1,
0.8422506, 0.9712146, 0.6088255, 1, 1, 1, 1, 1,
0.8440073, -0.5814307, 2.121247, 0, 0, 1, 1, 1,
0.8462083, 0.1789241, 0.6208169, 1, 0, 0, 1, 1,
0.8501083, -1.937087, 2.319265, 1, 0, 0, 1, 1,
0.8530808, 1.01358, 0.8378029, 1, 0, 0, 1, 1,
0.8541856, -0.6036663, 1.891014, 1, 0, 0, 1, 1,
0.8543151, -0.3516264, 3.901505, 1, 0, 0, 1, 1,
0.8625948, 0.2808184, 2.836056, 0, 0, 0, 1, 1,
0.8644397, 0.6734002, -0.2202594, 0, 0, 0, 1, 1,
0.8747508, -0.4352822, 0.1741042, 0, 0, 0, 1, 1,
0.8773587, -0.8689663, 3.221473, 0, 0, 0, 1, 1,
0.8796105, -0.9027426, 1.830643, 0, 0, 0, 1, 1,
0.8802336, 0.2210715, 2.645388, 0, 0, 0, 1, 1,
0.8832596, -1.400199, 1.839955, 0, 0, 0, 1, 1,
0.8887011, -0.5546269, 1.615376, 1, 1, 1, 1, 1,
0.8941026, 0.2163449, 2.35876, 1, 1, 1, 1, 1,
0.8942382, 1.207001, 0.6553359, 1, 1, 1, 1, 1,
0.9064397, -0.8114982, 3.273792, 1, 1, 1, 1, 1,
0.9072262, 1.147644, -0.6442046, 1, 1, 1, 1, 1,
0.9100561, 2.241395, -0.4145484, 1, 1, 1, 1, 1,
0.9167688, -0.3267015, 1.619526, 1, 1, 1, 1, 1,
0.9174515, 0.2334809, 2.562317, 1, 1, 1, 1, 1,
0.917823, 0.9231099, -0.5276277, 1, 1, 1, 1, 1,
0.9193558, -1.091502, 1.090221, 1, 1, 1, 1, 1,
0.9229128, -0.3253641, 1.599288, 1, 1, 1, 1, 1,
0.9297711, -0.5618128, 1.817608, 1, 1, 1, 1, 1,
0.9433156, 0.2367032, 0.2381006, 1, 1, 1, 1, 1,
0.9437758, -0.2922342, -1.20275, 1, 1, 1, 1, 1,
0.9545625, -0.1085416, 1.537306, 1, 1, 1, 1, 1,
0.9548933, -1.172644, 2.862113, 0, 0, 1, 1, 1,
0.9672352, 0.8126323, 1.044627, 1, 0, 0, 1, 1,
0.9681328, -0.456315, 2.2088, 1, 0, 0, 1, 1,
0.9806174, 1.192096, 0.3651115, 1, 0, 0, 1, 1,
0.9813006, 0.4578779, 2.269691, 1, 0, 0, 1, 1,
0.98489, 1.29415, 1.798852, 1, 0, 0, 1, 1,
0.9860626, -0.4820045, 2.28075, 0, 0, 0, 1, 1,
0.9872667, 0.9738125, 0.640736, 0, 0, 0, 1, 1,
0.9899152, -0.7002913, 3.586955, 0, 0, 0, 1, 1,
0.9958558, 1.184256, 0.6744698, 0, 0, 0, 1, 1,
0.9960042, 0.575262, 0.7949727, 0, 0, 0, 1, 1,
0.9982824, 0.164337, 1.415505, 0, 0, 0, 1, 1,
0.9986819, -0.6324902, 0.8266735, 0, 0, 0, 1, 1,
1.003101, 1.294988, -0.2612269, 1, 1, 1, 1, 1,
1.003379, -1.261751, 2.44934, 1, 1, 1, 1, 1,
1.007754, 1.633919, 0.6487536, 1, 1, 1, 1, 1,
1.01505, 1.047741, -0.07518595, 1, 1, 1, 1, 1,
1.015437, -0.6204445, 3.193375, 1, 1, 1, 1, 1,
1.017193, 0.9403306, 0.4054208, 1, 1, 1, 1, 1,
1.0184, -0.6059272, 0.959307, 1, 1, 1, 1, 1,
1.022236, -0.08573663, 1.822744, 1, 1, 1, 1, 1,
1.024297, 1.168817, 0.6758846, 1, 1, 1, 1, 1,
1.0289, 2.786819, 0.1933706, 1, 1, 1, 1, 1,
1.037428, -1.721514, 2.736969, 1, 1, 1, 1, 1,
1.038225, 0.5848229, 1.595587, 1, 1, 1, 1, 1,
1.039484, 0.7449861, 1.796155, 1, 1, 1, 1, 1,
1.044983, -0.5734608, 3.786936, 1, 1, 1, 1, 1,
1.047862, 0.6531985, 0.3458892, 1, 1, 1, 1, 1,
1.054599, -1.189219, 2.948546, 0, 0, 1, 1, 1,
1.055599, -0.5513708, 1.344936, 1, 0, 0, 1, 1,
1.057628, 0.2491418, 0.5781621, 1, 0, 0, 1, 1,
1.059083, 1.478979, 2.9776, 1, 0, 0, 1, 1,
1.064119, 1.071533, 1.545795, 1, 0, 0, 1, 1,
1.072011, -0.515062, 2.014001, 1, 0, 0, 1, 1,
1.072061, 0.5561892, 2.40821, 0, 0, 0, 1, 1,
1.074695, -0.1176262, 1.317969, 0, 0, 0, 1, 1,
1.078543, 0.5470019, 1.346451, 0, 0, 0, 1, 1,
1.078998, -0.01467352, 2.738507, 0, 0, 0, 1, 1,
1.08152, -0.286938, 3.924292, 0, 0, 0, 1, 1,
1.090786, -0.6018891, 2.128327, 0, 0, 0, 1, 1,
1.093497, 0.4965976, 0.02987252, 0, 0, 0, 1, 1,
1.097085, -0.1124237, 1.534511, 1, 1, 1, 1, 1,
1.101046, 1.725335, -0.3871606, 1, 1, 1, 1, 1,
1.109693, -0.1211844, 1.36668, 1, 1, 1, 1, 1,
1.112539, 0.04480227, 1.298574, 1, 1, 1, 1, 1,
1.114775, -0.5793575, -0.1826069, 1, 1, 1, 1, 1,
1.118194, -1.349487, 3.275017, 1, 1, 1, 1, 1,
1.119958, 0.6507085, 0.298694, 1, 1, 1, 1, 1,
1.120217, 0.2021636, 1.295337, 1, 1, 1, 1, 1,
1.127936, 0.7614119, -0.07080448, 1, 1, 1, 1, 1,
1.131748, 0.03738134, 1.690518, 1, 1, 1, 1, 1,
1.13409, -1.418965, 1.994702, 1, 1, 1, 1, 1,
1.136449, 0.7616988, 2.249241, 1, 1, 1, 1, 1,
1.144849, -1.667497, 2.916009, 1, 1, 1, 1, 1,
1.151923, -0.5760131, 1.523723, 1, 1, 1, 1, 1,
1.153037, 1.188876, 1.132893, 1, 1, 1, 1, 1,
1.153466, -0.230259, 1.665226, 0, 0, 1, 1, 1,
1.155868, 1.734954, 1.501577, 1, 0, 0, 1, 1,
1.157787, -1.677027, 1.91475, 1, 0, 0, 1, 1,
1.165383, 0.579857, 2.117248, 1, 0, 0, 1, 1,
1.165559, 1.289201, 1.925974, 1, 0, 0, 1, 1,
1.178782, -0.7144595, 1.991913, 1, 0, 0, 1, 1,
1.180928, -0.3077218, 1.304742, 0, 0, 0, 1, 1,
1.186223, 0.692175, 0.1211136, 0, 0, 0, 1, 1,
1.18656, 0.835196, 1.308664, 0, 0, 0, 1, 1,
1.202166, -0.5391695, 1.04387, 0, 0, 0, 1, 1,
1.205387, -0.6858512, 3.592494, 0, 0, 0, 1, 1,
1.205552, 0.3058208, 2.485189, 0, 0, 0, 1, 1,
1.207528, 0.7152689, 0.8591916, 0, 0, 0, 1, 1,
1.208604, -0.6487105, 3.277208, 1, 1, 1, 1, 1,
1.208977, 0.2130562, 3.076195, 1, 1, 1, 1, 1,
1.209887, 0.3364326, 0.012443, 1, 1, 1, 1, 1,
1.211713, 1.415626, 0.1784121, 1, 1, 1, 1, 1,
1.216246, -0.6966186, 4.334892, 1, 1, 1, 1, 1,
1.218494, -2.126753, 3.008605, 1, 1, 1, 1, 1,
1.219301, 2.361681, -1.749851, 1, 1, 1, 1, 1,
1.227579, -2.601566, 3.351593, 1, 1, 1, 1, 1,
1.230008, 1.07686, -0.3689936, 1, 1, 1, 1, 1,
1.233897, 0.4362014, -0.5590429, 1, 1, 1, 1, 1,
1.250225, 0.5812222, 0.2856098, 1, 1, 1, 1, 1,
1.268961, 0.4296433, 2.371784, 1, 1, 1, 1, 1,
1.269844, 0.2094822, 1.160277, 1, 1, 1, 1, 1,
1.276142, -0.2987291, 0.3785977, 1, 1, 1, 1, 1,
1.28052, 0.06922457, 1.061121, 1, 1, 1, 1, 1,
1.283911, -1.508103, 2.682783, 0, 0, 1, 1, 1,
1.292405, 0.04511374, 1.370257, 1, 0, 0, 1, 1,
1.294692, 2.36009, 1.462674, 1, 0, 0, 1, 1,
1.298845, -0.0231567, 1.01313, 1, 0, 0, 1, 1,
1.305601, 1.656846, 0.2461162, 1, 0, 0, 1, 1,
1.313769, -1.067036, 0.6675465, 1, 0, 0, 1, 1,
1.327838, -0.1320409, 1.832111, 0, 0, 0, 1, 1,
1.328882, 0.4175917, 1.628832, 0, 0, 0, 1, 1,
1.331847, -0.05174502, 0.266123, 0, 0, 0, 1, 1,
1.338918, -0.1942656, 2.858813, 0, 0, 0, 1, 1,
1.345345, -0.1449609, 1.613626, 0, 0, 0, 1, 1,
1.356884, -0.1188617, 1.541449, 0, 0, 0, 1, 1,
1.378841, 2.244689, 0.8163148, 0, 0, 0, 1, 1,
1.3801, -0.9678738, 3.965044, 1, 1, 1, 1, 1,
1.403176, 1.279372, 1.908752, 1, 1, 1, 1, 1,
1.403742, 0.1322192, 3.081089, 1, 1, 1, 1, 1,
1.406914, 1.074706, 0.1801407, 1, 1, 1, 1, 1,
1.413225, 0.05750269, 0.7587171, 1, 1, 1, 1, 1,
1.417654, 0.6258287, -0.2379995, 1, 1, 1, 1, 1,
1.425406, -0.3730823, 0.4524113, 1, 1, 1, 1, 1,
1.440822, -1.448019, 1.603819, 1, 1, 1, 1, 1,
1.456706, 0.2248784, 0.3712384, 1, 1, 1, 1, 1,
1.458609, 0.5059958, 1.730968, 1, 1, 1, 1, 1,
1.461446, -0.464508, 1.745023, 1, 1, 1, 1, 1,
1.475408, -0.5442591, 3.855326, 1, 1, 1, 1, 1,
1.479443, 0.1907692, 0.8840727, 1, 1, 1, 1, 1,
1.48113, -0.4429977, 2.479565, 1, 1, 1, 1, 1,
1.487744, -0.8449413, 2.726241, 1, 1, 1, 1, 1,
1.494104, -2.053688, 2.040747, 0, 0, 1, 1, 1,
1.495346, -1.622915, 2.573389, 1, 0, 0, 1, 1,
1.497631, -1.611427, 2.886861, 1, 0, 0, 1, 1,
1.498529, -0.1769608, 3.318791, 1, 0, 0, 1, 1,
1.500865, 0.1859659, 1.408027, 1, 0, 0, 1, 1,
1.501088, -0.02883625, 2.111786, 1, 0, 0, 1, 1,
1.506792, 1.168348, 1.578338, 0, 0, 0, 1, 1,
1.510857, 0.4990928, -1.076602, 0, 0, 0, 1, 1,
1.515314, 1.037074, 2.059554, 0, 0, 0, 1, 1,
1.520457, -0.04596983, 1.038244, 0, 0, 0, 1, 1,
1.521895, -0.2652635, 0.8184071, 0, 0, 0, 1, 1,
1.524294, -1.612091, 3.142816, 0, 0, 0, 1, 1,
1.526106, 1.507907, 1.987521, 0, 0, 0, 1, 1,
1.539915, 1.883887, -0.1565997, 1, 1, 1, 1, 1,
1.541215, 1.592725, 0.2673213, 1, 1, 1, 1, 1,
1.54589, -0.1280328, 2.001401, 1, 1, 1, 1, 1,
1.548188, 2.034963, 0.4126955, 1, 1, 1, 1, 1,
1.551723, -0.7117355, 2.084336, 1, 1, 1, 1, 1,
1.559937, -0.4345195, 0.9050018, 1, 1, 1, 1, 1,
1.570957, 0.6313295, 1.416835, 1, 1, 1, 1, 1,
1.583647, 0.2476728, 1.577404, 1, 1, 1, 1, 1,
1.591633, -0.9175839, 1.75808, 1, 1, 1, 1, 1,
1.60191, 1.249287, 1.568564, 1, 1, 1, 1, 1,
1.608199, 0.3712092, 0.6270615, 1, 1, 1, 1, 1,
1.630827, 0.3860047, 0.5205683, 1, 1, 1, 1, 1,
1.634481, -0.24844, 1.590561, 1, 1, 1, 1, 1,
1.667115, -0.2831901, 1.90226, 1, 1, 1, 1, 1,
1.670223, -1.152688, 0.8655604, 1, 1, 1, 1, 1,
1.67944, 0.2498517, 1.614254, 0, 0, 1, 1, 1,
1.692946, -0.01941142, 1.307062, 1, 0, 0, 1, 1,
1.696934, -1.180358, 1.098775, 1, 0, 0, 1, 1,
1.71649, 0.6301513, 2.437314, 1, 0, 0, 1, 1,
1.717784, 0.3490369, 0.6689168, 1, 0, 0, 1, 1,
1.719863, -1.506827, 3.885622, 1, 0, 0, 1, 1,
1.72678, -0.3352725, 2.774819, 0, 0, 0, 1, 1,
1.744975, 0.833524, -0.6878459, 0, 0, 0, 1, 1,
1.765705, 1.714771, 1.311532, 0, 0, 0, 1, 1,
1.773454, -0.9293174, 2.465192, 0, 0, 0, 1, 1,
1.789725, -0.2744155, 1.781272, 0, 0, 0, 1, 1,
1.840058, -0.4642256, 3.325729, 0, 0, 0, 1, 1,
1.876847, -1.414283, 3.481244, 0, 0, 0, 1, 1,
1.93265, -1.020466, -1.004787, 1, 1, 1, 1, 1,
1.949827, -0.2981302, 1.405807, 1, 1, 1, 1, 1,
1.965276, -1.008878, 1.766263, 1, 1, 1, 1, 1,
1.969555, 0.8323004, 0.9832998, 1, 1, 1, 1, 1,
2.024201, -0.4587232, 0.392036, 1, 1, 1, 1, 1,
2.030436, -1.395904, 2.001497, 1, 1, 1, 1, 1,
2.043012, 0.4149328, 1.176667, 1, 1, 1, 1, 1,
2.094359, -0.5972595, 2.543305, 1, 1, 1, 1, 1,
2.104203, -2.000344, 1.837016, 1, 1, 1, 1, 1,
2.118248, 0.3749948, 1.385324, 1, 1, 1, 1, 1,
2.12459, 1.005171, 0.8810372, 1, 1, 1, 1, 1,
2.12462, 0.8795122, 1.014944, 1, 1, 1, 1, 1,
2.142048, 0.450585, 1.736708, 1, 1, 1, 1, 1,
2.178521, 0.8713037, 2.852372, 1, 1, 1, 1, 1,
2.184734, -0.7205932, 1.565175, 1, 1, 1, 1, 1,
2.209253, 0.3856654, 2.462838, 0, 0, 1, 1, 1,
2.254235, -0.3678601, 1.25024, 1, 0, 0, 1, 1,
2.28102, 0.7139021, 1.054932, 1, 0, 0, 1, 1,
2.323112, -1.455395, 1.628371, 1, 0, 0, 1, 1,
2.334044, -1.044474, 0.8598998, 1, 0, 0, 1, 1,
2.334801, -0.3088217, 2.137549, 1, 0, 0, 1, 1,
2.346381, 1.092178, 1.870414, 0, 0, 0, 1, 1,
2.406277, 0.7684128, 1.395279, 0, 0, 0, 1, 1,
2.418457, 0.2016216, 3.208833, 0, 0, 0, 1, 1,
2.426691, -1.128039, 1.013767, 0, 0, 0, 1, 1,
2.445024, -0.3032685, 2.135249, 0, 0, 0, 1, 1,
2.473805, -0.3694865, 2.331789, 0, 0, 0, 1, 1,
2.497303, 0.02225104, 2.789824, 0, 0, 0, 1, 1,
2.505225, 0.09744782, 3.072976, 1, 1, 1, 1, 1,
2.530681, -0.3805441, 1.675389, 1, 1, 1, 1, 1,
2.54369, -1.003998, -0.7835235, 1, 1, 1, 1, 1,
2.545738, 1.909051, 1.659818, 1, 1, 1, 1, 1,
2.627521, -1.601031, 0.7999884, 1, 1, 1, 1, 1,
2.879583, 0.002619314, 2.082767, 1, 1, 1, 1, 1,
2.939616, -0.5058946, 0.6317286, 1, 1, 1, 1, 1
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
var radius = 9.673794;
var distance = 33.97879;
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
mvMatrix.translate( 0.08316433, 0.4753342, 0.067765 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97879);
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
