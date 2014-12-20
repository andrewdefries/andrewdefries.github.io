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
-2.602237, -0.812846, -1.472654, 1, 0, 0, 1,
-2.60182, 0.7103577, -0.4786302, 1, 0.007843138, 0, 1,
-2.568178, -1.325071, -4.42461, 1, 0.01176471, 0, 1,
-2.514575, -1.465014, -3.582011, 1, 0.01960784, 0, 1,
-2.511511, -1.288525, -1.174681, 1, 0.02352941, 0, 1,
-2.449733, -0.5927975, -1.948431, 1, 0.03137255, 0, 1,
-2.430849, -1.922332, -0.5535711, 1, 0.03529412, 0, 1,
-2.423631, -0.8487667, -2.691684, 1, 0.04313726, 0, 1,
-2.372889, -1.828581, -1.32595, 1, 0.04705882, 0, 1,
-2.356467, 1.374615, -0.8208668, 1, 0.05490196, 0, 1,
-2.338332, 1.856957, -0.7480432, 1, 0.05882353, 0, 1,
-2.312629, -1.621311, -2.16183, 1, 0.06666667, 0, 1,
-2.295264, 0.6073524, -1.266181, 1, 0.07058824, 0, 1,
-2.283403, 1.516131, -0.1340656, 1, 0.07843138, 0, 1,
-2.271897, 0.8040434, -2.673359, 1, 0.08235294, 0, 1,
-2.271221, 0.3603566, -1.239005, 1, 0.09019608, 0, 1,
-2.237948, 0.4696817, -3.522502, 1, 0.09411765, 0, 1,
-2.236133, 0.7444263, -1.732966, 1, 0.1019608, 0, 1,
-2.18867, -1.111661, -3.656795, 1, 0.1098039, 0, 1,
-2.188282, -0.338278, -3.261918, 1, 0.1137255, 0, 1,
-2.144822, -1.154246, -1.688902, 1, 0.1215686, 0, 1,
-2.138952, -0.002193794, -1.018598, 1, 0.1254902, 0, 1,
-2.119279, -0.2407766, 0.1711807, 1, 0.1333333, 0, 1,
-2.110463, -0.6558646, -3.190154, 1, 0.1372549, 0, 1,
-2.096376, 1.925363, -0.9789447, 1, 0.145098, 0, 1,
-2.077555, 0.8687973, -2.38337, 1, 0.1490196, 0, 1,
-2.071001, 0.3965693, -1.613428, 1, 0.1568628, 0, 1,
-2.058628, 1.842266, -0.8916436, 1, 0.1607843, 0, 1,
-1.992769, 1.179971, -1.031498, 1, 0.1686275, 0, 1,
-1.992178, -1.197992, -1.749824, 1, 0.172549, 0, 1,
-1.968076, -0.7311398, -1.525035, 1, 0.1803922, 0, 1,
-1.962814, -0.3410709, -1.969511, 1, 0.1843137, 0, 1,
-1.959753, -0.05057144, -1.031508, 1, 0.1921569, 0, 1,
-1.957418, -0.3433439, -1.627005, 1, 0.1960784, 0, 1,
-1.95297, -0.05361825, -0.4654622, 1, 0.2039216, 0, 1,
-1.946105, -0.1015524, 0.7667304, 1, 0.2117647, 0, 1,
-1.919672, -0.1033398, -1.876741, 1, 0.2156863, 0, 1,
-1.90725, -0.2950636, -1.983164, 1, 0.2235294, 0, 1,
-1.885269, -0.3457181, -1.72347, 1, 0.227451, 0, 1,
-1.878542, 0.7425779, -0.3274131, 1, 0.2352941, 0, 1,
-1.854045, -0.6358696, -1.210227, 1, 0.2392157, 0, 1,
-1.825237, -0.005764015, -1.040625, 1, 0.2470588, 0, 1,
-1.813868, 0.5345673, 0.2615601, 1, 0.2509804, 0, 1,
-1.798147, 2.214766, -0.9297689, 1, 0.2588235, 0, 1,
-1.796914, -0.4195689, -0.6450523, 1, 0.2627451, 0, 1,
-1.762965, -0.08691757, -1.233104, 1, 0.2705882, 0, 1,
-1.743717, -0.1121109, -0.7391035, 1, 0.2745098, 0, 1,
-1.735225, -0.2155289, -0.7807582, 1, 0.282353, 0, 1,
-1.722089, -0.6654873, -2.655554, 1, 0.2862745, 0, 1,
-1.711495, -0.297072, -1.009397, 1, 0.2941177, 0, 1,
-1.695705, -0.4168244, -1.269556, 1, 0.3019608, 0, 1,
-1.690198, 0.6270743, -1.675944, 1, 0.3058824, 0, 1,
-1.679442, 0.4872968, -2.039271, 1, 0.3137255, 0, 1,
-1.630076, 0.8172808, -2.162749, 1, 0.3176471, 0, 1,
-1.612538, -0.2962478, -1.822334, 1, 0.3254902, 0, 1,
-1.587899, -0.1431182, -2.516228, 1, 0.3294118, 0, 1,
-1.586935, -0.6839712, -1.022278, 1, 0.3372549, 0, 1,
-1.566541, -0.1312964, -0.9779259, 1, 0.3411765, 0, 1,
-1.56545, -0.1263463, -0.3490553, 1, 0.3490196, 0, 1,
-1.548325, 0.5390373, -1.769381, 1, 0.3529412, 0, 1,
-1.542109, 0.7051083, -0.3767659, 1, 0.3607843, 0, 1,
-1.536242, -0.5464844, -5.218505, 1, 0.3647059, 0, 1,
-1.525847, 0.4632517, -1.385885, 1, 0.372549, 0, 1,
-1.497962, 0.5290249, 1.221166, 1, 0.3764706, 0, 1,
-1.49426, 1.118501, -2.299731, 1, 0.3843137, 0, 1,
-1.490824, 0.2584795, -2.125458, 1, 0.3882353, 0, 1,
-1.489941, -0.248211, -2.005005, 1, 0.3960784, 0, 1,
-1.47987, -0.06952222, -1.71989, 1, 0.4039216, 0, 1,
-1.479733, 0.56615, -2.401884, 1, 0.4078431, 0, 1,
-1.472755, 1.545906, -2.725869, 1, 0.4156863, 0, 1,
-1.469431, -0.2811745, -1.636944, 1, 0.4196078, 0, 1,
-1.463248, -0.03123293, -1.737947, 1, 0.427451, 0, 1,
-1.45682, -0.2095051, -2.669451, 1, 0.4313726, 0, 1,
-1.447781, 1.663148, -0.9282525, 1, 0.4392157, 0, 1,
-1.446129, -0.2353499, -1.574183, 1, 0.4431373, 0, 1,
-1.44551, 2.595402, 1.352323, 1, 0.4509804, 0, 1,
-1.436579, -1.370967, -1.394646, 1, 0.454902, 0, 1,
-1.434147, 0.8973895, 0.4303216, 1, 0.4627451, 0, 1,
-1.434016, 0.6337223, -0.5846878, 1, 0.4666667, 0, 1,
-1.415581, -1.271583, -2.218426, 1, 0.4745098, 0, 1,
-1.412408, -0.208883, -2.393959, 1, 0.4784314, 0, 1,
-1.401506, 0.5805382, -1.275725, 1, 0.4862745, 0, 1,
-1.395636, -0.5282515, -3.126482, 1, 0.4901961, 0, 1,
-1.395394, -0.9805564, -0.3840432, 1, 0.4980392, 0, 1,
-1.390674, 1.4524, -1.065539, 1, 0.5058824, 0, 1,
-1.37683, 0.3416796, -1.706449, 1, 0.509804, 0, 1,
-1.376565, -1.819059, -4.702937, 1, 0.5176471, 0, 1,
-1.367633, 2.025125, 1.280867, 1, 0.5215687, 0, 1,
-1.356324, -1.110645, -0.786612, 1, 0.5294118, 0, 1,
-1.338805, -0.2730139, -0.9656004, 1, 0.5333334, 0, 1,
-1.338694, -0.6786872, -2.805053, 1, 0.5411765, 0, 1,
-1.338685, 0.1533539, -0.5482652, 1, 0.5450981, 0, 1,
-1.335988, 1.127701, 0.7805976, 1, 0.5529412, 0, 1,
-1.32992, 1.475513, -0.003707258, 1, 0.5568628, 0, 1,
-1.315669, -1.699856, -3.4006, 1, 0.5647059, 0, 1,
-1.307067, 2.097323, -1.46438, 1, 0.5686275, 0, 1,
-1.302467, -0.5788491, -2.985703, 1, 0.5764706, 0, 1,
-1.292813, 0.5096813, -0.8314273, 1, 0.5803922, 0, 1,
-1.283782, -0.8629579, -1.242134, 1, 0.5882353, 0, 1,
-1.279947, -0.4532537, -3.098027, 1, 0.5921569, 0, 1,
-1.27626, -0.6967274, -1.374793, 1, 0.6, 0, 1,
-1.267353, 0.2963577, -1.198313, 1, 0.6078432, 0, 1,
-1.254568, -0.9591196, -1.405982, 1, 0.6117647, 0, 1,
-1.247329, 1.346256, -0.1280166, 1, 0.6196079, 0, 1,
-1.245433, -1.572842, -2.609398, 1, 0.6235294, 0, 1,
-1.231937, -0.7802547, -2.231918, 1, 0.6313726, 0, 1,
-1.227052, -0.7316399, -1.541778, 1, 0.6352941, 0, 1,
-1.22153, -1.229828, -1.59195, 1, 0.6431373, 0, 1,
-1.207966, 0.8864341, -1.243369, 1, 0.6470588, 0, 1,
-1.194701, -1.023254, -3.224615, 1, 0.654902, 0, 1,
-1.193666, 0.3444005, -3.342186, 1, 0.6588235, 0, 1,
-1.192795, -1.180756, -2.957099, 1, 0.6666667, 0, 1,
-1.177425, -0.8967595, -2.194218, 1, 0.6705883, 0, 1,
-1.167856, -1.472103, -4.371204, 1, 0.6784314, 0, 1,
-1.167641, 0.7993842, -1.227143, 1, 0.682353, 0, 1,
-1.16727, 0.741676, -0.870981, 1, 0.6901961, 0, 1,
-1.155959, 2.037761, -0.839474, 1, 0.6941177, 0, 1,
-1.155318, -3.488239, -3.590946, 1, 0.7019608, 0, 1,
-1.14947, 0.2652166, 0.8284877, 1, 0.7098039, 0, 1,
-1.143752, 0.4845043, -1.871099, 1, 0.7137255, 0, 1,
-1.1407, -1.227677, -2.804486, 1, 0.7215686, 0, 1,
-1.139169, 0.09992819, -2.868061, 1, 0.7254902, 0, 1,
-1.135744, -0.07080245, -1.187217, 1, 0.7333333, 0, 1,
-1.13453, 0.3845138, 0.04602139, 1, 0.7372549, 0, 1,
-1.123272, 1.622169, -0.757601, 1, 0.7450981, 0, 1,
-1.118818, 1.21834, -1.586031, 1, 0.7490196, 0, 1,
-1.116704, 0.4623355, -1.991076, 1, 0.7568628, 0, 1,
-1.110684, -0.4651344, -1.115215, 1, 0.7607843, 0, 1,
-1.109657, 0.2052123, -2.046596, 1, 0.7686275, 0, 1,
-1.105133, 0.2463307, -3.060376, 1, 0.772549, 0, 1,
-1.09915, 0.7856718, 0.908884, 1, 0.7803922, 0, 1,
-1.080233, 0.3130679, -1.900959, 1, 0.7843137, 0, 1,
-1.077569, -0.4236287, -1.382728, 1, 0.7921569, 0, 1,
-1.063286, -0.2907048, -2.236991, 1, 0.7960784, 0, 1,
-1.060156, 0.4424506, 0.8498276, 1, 0.8039216, 0, 1,
-1.054465, -0.5996164, -1.251674, 1, 0.8117647, 0, 1,
-1.051947, -1.564214, -1.419839, 1, 0.8156863, 0, 1,
-1.048156, 2.083316, -0.1496957, 1, 0.8235294, 0, 1,
-1.043894, -0.4294817, -1.22909, 1, 0.827451, 0, 1,
-1.043303, -0.2269835, -1.095953, 1, 0.8352941, 0, 1,
-1.042275, 1.188946, -0.9369022, 1, 0.8392157, 0, 1,
-1.0391, -0.8069377, -2.42178, 1, 0.8470588, 0, 1,
-1.036015, 0.2597916, -0.9771277, 1, 0.8509804, 0, 1,
-1.034353, -1.632812, -0.4444836, 1, 0.8588235, 0, 1,
-1.030442, 1.08312, 0.1915918, 1, 0.8627451, 0, 1,
-1.028941, -0.156359, -2.67178, 1, 0.8705882, 0, 1,
-1.025949, -1.420259, -2.369907, 1, 0.8745098, 0, 1,
-1.020458, 0.07907782, -1.329295, 1, 0.8823529, 0, 1,
-1.018085, -0.0634131, -2.589781, 1, 0.8862745, 0, 1,
-1.017893, -0.6966769, -2.404853, 1, 0.8941177, 0, 1,
-1.012295, -0.1244518, -1.085496, 1, 0.8980392, 0, 1,
-1.010474, 0.4352945, -0.8138965, 1, 0.9058824, 0, 1,
-1.006082, -0.7921489, -4.790212, 1, 0.9137255, 0, 1,
-1.002653, 0.6342233, -1.881317, 1, 0.9176471, 0, 1,
-0.9992256, -0.02229923, -1.572486, 1, 0.9254902, 0, 1,
-0.9958688, -2.116499, -4.003241, 1, 0.9294118, 0, 1,
-0.9735598, 0.2132078, -2.237982, 1, 0.9372549, 0, 1,
-0.9581602, -1.014123, -1.818644, 1, 0.9411765, 0, 1,
-0.9471539, -1.768125, -0.9938425, 1, 0.9490196, 0, 1,
-0.9326651, 1.296282, -0.2282122, 1, 0.9529412, 0, 1,
-0.9317983, 0.8774346, -0.7608246, 1, 0.9607843, 0, 1,
-0.9305195, 0.6733355, -1.790863, 1, 0.9647059, 0, 1,
-0.9284545, -1.145049, -3.650277, 1, 0.972549, 0, 1,
-0.9234917, -0.4156415, -1.371821, 1, 0.9764706, 0, 1,
-0.9184482, 0.01528838, -1.820952, 1, 0.9843137, 0, 1,
-0.9125447, -0.221633, -1.910326, 1, 0.9882353, 0, 1,
-0.9124106, -0.357035, -1.868445, 1, 0.9960784, 0, 1,
-0.910215, -1.40341, -1.394124, 0.9960784, 1, 0, 1,
-0.9099803, 0.2791913, -1.188139, 0.9921569, 1, 0, 1,
-0.9016206, -0.9409819, -2.229863, 0.9843137, 1, 0, 1,
-0.8909818, -0.2233137, -1.442119, 0.9803922, 1, 0, 1,
-0.8891084, -1.494313, -2.372437, 0.972549, 1, 0, 1,
-0.8844344, -1.186293, -1.718291, 0.9686275, 1, 0, 1,
-0.8802586, 1.030426, -0.2243354, 0.9607843, 1, 0, 1,
-0.8777516, -0.7696828, -1.019129, 0.9568627, 1, 0, 1,
-0.8706938, 0.9669486, -1.284716, 0.9490196, 1, 0, 1,
-0.8620232, 0.6001027, -1.097503, 0.945098, 1, 0, 1,
-0.8591013, -1.115171, -2.250708, 0.9372549, 1, 0, 1,
-0.8546156, 1.138195, -1.438543, 0.9333333, 1, 0, 1,
-0.8507184, -0.6510808, -2.354569, 0.9254902, 1, 0, 1,
-0.8479111, -0.04193548, -2.002291, 0.9215686, 1, 0, 1,
-0.8477906, 1.330357, -2.721439, 0.9137255, 1, 0, 1,
-0.8428474, -0.1116465, -0.9823025, 0.9098039, 1, 0, 1,
-0.8424398, 0.3559833, -0.790139, 0.9019608, 1, 0, 1,
-0.8383815, -0.5276659, -3.010654, 0.8941177, 1, 0, 1,
-0.8356704, -1.013573, -2.672121, 0.8901961, 1, 0, 1,
-0.8346202, -0.06805827, -1.689181, 0.8823529, 1, 0, 1,
-0.8285854, 0.2215378, -1.377165, 0.8784314, 1, 0, 1,
-0.8277789, -0.902528, -2.346944, 0.8705882, 1, 0, 1,
-0.8273188, 0.5553709, -1.458683, 0.8666667, 1, 0, 1,
-0.8262175, 0.4306087, -1.921002, 0.8588235, 1, 0, 1,
-0.8247274, -1.259566, -2.445944, 0.854902, 1, 0, 1,
-0.8245245, 0.8824696, -1.23512, 0.8470588, 1, 0, 1,
-0.8213769, 0.2752658, -1.351441, 0.8431373, 1, 0, 1,
-0.8193449, -0.6294761, -1.786634, 0.8352941, 1, 0, 1,
-0.8191522, 1.220308, 0.3444487, 0.8313726, 1, 0, 1,
-0.8189512, 0.07928533, -1.158813, 0.8235294, 1, 0, 1,
-0.8187165, 0.08802999, 0.05938046, 0.8196079, 1, 0, 1,
-0.8187101, -0.03366437, -0.5317524, 0.8117647, 1, 0, 1,
-0.8161678, -0.34917, -2.769672, 0.8078431, 1, 0, 1,
-0.8158745, -1.28296, -2.930091, 0.8, 1, 0, 1,
-0.8141708, -0.9276232, -4.117653, 0.7921569, 1, 0, 1,
-0.8048705, -2.82684, -3.471422, 0.7882353, 1, 0, 1,
-0.8001525, -0.669004, -2.828083, 0.7803922, 1, 0, 1,
-0.7983118, 0.6703917, -0.5301247, 0.7764706, 1, 0, 1,
-0.7928478, -1.503392, -2.379909, 0.7686275, 1, 0, 1,
-0.7897866, 0.8460824, -1.439995, 0.7647059, 1, 0, 1,
-0.7896526, 1.336764, 0.4390686, 0.7568628, 1, 0, 1,
-0.7842546, -0.62288, -1.490743, 0.7529412, 1, 0, 1,
-0.78367, 1.337799, -1.267584, 0.7450981, 1, 0, 1,
-0.7833608, -0.9248238, -2.763984, 0.7411765, 1, 0, 1,
-0.7827581, -0.9203377, -1.968586, 0.7333333, 1, 0, 1,
-0.7798998, 0.9616273, -1.656152, 0.7294118, 1, 0, 1,
-0.7795516, -1.286502, -2.744936, 0.7215686, 1, 0, 1,
-0.7779272, 0.231454, -1.854696, 0.7176471, 1, 0, 1,
-0.76766, -1.038883, -3.995458, 0.7098039, 1, 0, 1,
-0.7633686, 0.5080051, -1.716393, 0.7058824, 1, 0, 1,
-0.7626619, 2.132197, -0.9983017, 0.6980392, 1, 0, 1,
-0.7605737, -0.1964226, -2.085504, 0.6901961, 1, 0, 1,
-0.7588797, 0.7704579, -0.7850202, 0.6862745, 1, 0, 1,
-0.758841, -0.4369036, -1.740964, 0.6784314, 1, 0, 1,
-0.7570021, -2.451593, -2.398667, 0.6745098, 1, 0, 1,
-0.7553027, -1.500596, -4.261656, 0.6666667, 1, 0, 1,
-0.7552324, -0.6513893, -4.361516, 0.6627451, 1, 0, 1,
-0.7527951, 1.370721, -1.846382, 0.654902, 1, 0, 1,
-0.7525506, 1.013299, 1.469473, 0.6509804, 1, 0, 1,
-0.7437322, 1.052595, -0.7817386, 0.6431373, 1, 0, 1,
-0.740017, 0.03827835, -2.983948, 0.6392157, 1, 0, 1,
-0.739166, -0.7816235, -3.657715, 0.6313726, 1, 0, 1,
-0.7380422, -1.040323, -2.455976, 0.627451, 1, 0, 1,
-0.7368016, -0.4302221, -2.481502, 0.6196079, 1, 0, 1,
-0.736213, -0.2113046, -3.11867, 0.6156863, 1, 0, 1,
-0.7321824, 0.243246, -1.627333, 0.6078432, 1, 0, 1,
-0.7195855, 1.004922, 0.5378149, 0.6039216, 1, 0, 1,
-0.7004187, 1.742619, 1.329251, 0.5960785, 1, 0, 1,
-0.692991, 1.540555, -1.619696, 0.5882353, 1, 0, 1,
-0.6922106, 0.2489484, -1.082717, 0.5843138, 1, 0, 1,
-0.6872128, 1.740324, -1.260471, 0.5764706, 1, 0, 1,
-0.6836812, -0.8734561, -1.281921, 0.572549, 1, 0, 1,
-0.6721857, -0.8462042, -1.037935, 0.5647059, 1, 0, 1,
-0.6659131, -0.5713136, -2.175769, 0.5607843, 1, 0, 1,
-0.6653996, 0.3316596, -0.7379941, 0.5529412, 1, 0, 1,
-0.664925, -2.157422, -3.848986, 0.5490196, 1, 0, 1,
-0.66332, -0.6060793, -2.871288, 0.5411765, 1, 0, 1,
-0.6617616, -1.554847, -4.107684, 0.5372549, 1, 0, 1,
-0.6606446, -0.4124856, -1.862473, 0.5294118, 1, 0, 1,
-0.6605439, -0.256356, -2.451461, 0.5254902, 1, 0, 1,
-0.6538585, 0.04914481, -0.8363969, 0.5176471, 1, 0, 1,
-0.6518693, 2.117293, -0.05982623, 0.5137255, 1, 0, 1,
-0.6509562, 0.3244408, -0.9529988, 0.5058824, 1, 0, 1,
-0.6509514, 0.1475693, 0.5878981, 0.5019608, 1, 0, 1,
-0.6503386, -1.662337, -6.221716, 0.4941176, 1, 0, 1,
-0.6496968, 0.5922486, -3.353551, 0.4862745, 1, 0, 1,
-0.6489897, 0.1171943, -0.3027369, 0.4823529, 1, 0, 1,
-0.6458266, -1.567202, -3.081655, 0.4745098, 1, 0, 1,
-0.6450053, -0.3512749, -2.115176, 0.4705882, 1, 0, 1,
-0.6438863, 0.4507834, -1.027667, 0.4627451, 1, 0, 1,
-0.6435603, -0.6168775, -2.437155, 0.4588235, 1, 0, 1,
-0.6433191, 1.142149, -1.558306, 0.4509804, 1, 0, 1,
-0.6432129, 1.764175, -2.917907, 0.4470588, 1, 0, 1,
-0.6272956, 0.09544576, -1.895147, 0.4392157, 1, 0, 1,
-0.6256692, -0.1285504, -2.428561, 0.4352941, 1, 0, 1,
-0.624177, -0.5503535, -1.522333, 0.427451, 1, 0, 1,
-0.6203895, -0.6764697, -2.524581, 0.4235294, 1, 0, 1,
-0.6203408, 0.2752078, -1.783922, 0.4156863, 1, 0, 1,
-0.618798, -1.975972, -2.51445, 0.4117647, 1, 0, 1,
-0.618335, -1.446376, -5.563078, 0.4039216, 1, 0, 1,
-0.6171296, 0.8041534, -1.033191, 0.3960784, 1, 0, 1,
-0.6159127, 0.6014543, -0.1451392, 0.3921569, 1, 0, 1,
-0.6056041, 1.120123, 0.2808424, 0.3843137, 1, 0, 1,
-0.6029449, 1.354105, 0.2105391, 0.3803922, 1, 0, 1,
-0.6015767, 2.357424, -2.50095, 0.372549, 1, 0, 1,
-0.5999482, -1.55039, -2.809131, 0.3686275, 1, 0, 1,
-0.597611, -0.7938223, -3.609408, 0.3607843, 1, 0, 1,
-0.5960945, 0.5275754, -0.7074701, 0.3568628, 1, 0, 1,
-0.5957405, 0.02819038, -1.811613, 0.3490196, 1, 0, 1,
-0.5882499, 2.584858, 0.8084016, 0.345098, 1, 0, 1,
-0.5877339, -0.5805355, -3.228016, 0.3372549, 1, 0, 1,
-0.5870295, -0.2637922, -2.701409, 0.3333333, 1, 0, 1,
-0.5768315, -0.7742214, -2.279896, 0.3254902, 1, 0, 1,
-0.5765506, -1.408949, -3.426167, 0.3215686, 1, 0, 1,
-0.5742576, 0.1111037, 0.2734, 0.3137255, 1, 0, 1,
-0.5739346, -1.465079, -1.727054, 0.3098039, 1, 0, 1,
-0.5714586, 1.613933, -0.6280932, 0.3019608, 1, 0, 1,
-0.5712959, -0.8354473, -3.505011, 0.2941177, 1, 0, 1,
-0.5712222, -0.2134277, -2.431055, 0.2901961, 1, 0, 1,
-0.5681366, 0.7586748, 0.6786605, 0.282353, 1, 0, 1,
-0.567902, 1.438823, -0.3406955, 0.2784314, 1, 0, 1,
-0.5605764, -0.05149936, -0.9619034, 0.2705882, 1, 0, 1,
-0.5589513, 0.1640725, -0.2841901, 0.2666667, 1, 0, 1,
-0.5546094, -0.7806319, -2.774273, 0.2588235, 1, 0, 1,
-0.5522828, -1.495208, -2.025563, 0.254902, 1, 0, 1,
-0.5512889, 0.760024, -0.6107702, 0.2470588, 1, 0, 1,
-0.5509168, -0.4668308, -2.780153, 0.2431373, 1, 0, 1,
-0.5502081, 0.07558562, -1.407766, 0.2352941, 1, 0, 1,
-0.5497735, -0.05578913, -1.901016, 0.2313726, 1, 0, 1,
-0.544781, -0.5966742, -2.671662, 0.2235294, 1, 0, 1,
-0.5423471, -2.073319, -2.537054, 0.2196078, 1, 0, 1,
-0.5416104, 0.3698674, -1.853094, 0.2117647, 1, 0, 1,
-0.5334214, -0.4884996, -1.641402, 0.2078431, 1, 0, 1,
-0.5326262, -1.353482, -2.358859, 0.2, 1, 0, 1,
-0.5186529, 0.000430509, -2.114757, 0.1921569, 1, 0, 1,
-0.5121289, 0.3929964, -0.2211025, 0.1882353, 1, 0, 1,
-0.5097106, 0.4829718, 0.7323765, 0.1803922, 1, 0, 1,
-0.5079197, -1.579492, -2.336859, 0.1764706, 1, 0, 1,
-0.5078698, 1.14135, 0.2553156, 0.1686275, 1, 0, 1,
-0.5066324, 2.007878, -1.458709, 0.1647059, 1, 0, 1,
-0.5061664, -1.68432, -2.681034, 0.1568628, 1, 0, 1,
-0.5051559, 1.324996, -0.7240903, 0.1529412, 1, 0, 1,
-0.4989828, 0.3168959, -2.308106, 0.145098, 1, 0, 1,
-0.4983741, -0.6997981, -1.560007, 0.1411765, 1, 0, 1,
-0.4978473, -0.6098874, -1.842874, 0.1333333, 1, 0, 1,
-0.4950763, -0.9323962, -3.139406, 0.1294118, 1, 0, 1,
-0.4920998, 0.2104266, -2.987893, 0.1215686, 1, 0, 1,
-0.4920374, 0.7325393, 0.6288443, 0.1176471, 1, 0, 1,
-0.491669, 0.8920308, -0.4276704, 0.1098039, 1, 0, 1,
-0.4914635, 0.8106645, -2.087376, 0.1058824, 1, 0, 1,
-0.4853935, -0.3377649, -2.57955, 0.09803922, 1, 0, 1,
-0.4846769, 0.9070007, 0.8924731, 0.09019608, 1, 0, 1,
-0.4785778, 0.1246293, -1.712416, 0.08627451, 1, 0, 1,
-0.4752129, -0.1426246, -2.829862, 0.07843138, 1, 0, 1,
-0.4741772, -0.6553499, -2.022431, 0.07450981, 1, 0, 1,
-0.473043, -0.6423106, -2.512492, 0.06666667, 1, 0, 1,
-0.4724566, -0.3014724, -0.1448861, 0.0627451, 1, 0, 1,
-0.467691, -0.6752926, -0.06000874, 0.05490196, 1, 0, 1,
-0.4665878, -0.4253953, -3.813128, 0.05098039, 1, 0, 1,
-0.4545622, -0.2970093, 0.005138887, 0.04313726, 1, 0, 1,
-0.4534052, -0.6368687, -2.615688, 0.03921569, 1, 0, 1,
-0.4513913, -0.08929134, -0.6344065, 0.03137255, 1, 0, 1,
-0.44958, -0.1850805, -2.466403, 0.02745098, 1, 0, 1,
-0.4441728, 0.4081966, -2.80307, 0.01960784, 1, 0, 1,
-0.4441622, -1.307216, -2.076571, 0.01568628, 1, 0, 1,
-0.4406401, -0.1255072, -2.895882, 0.007843138, 1, 0, 1,
-0.439918, 1.119131, 0.243944, 0.003921569, 1, 0, 1,
-0.4340815, 0.3225076, -1.93905, 0, 1, 0.003921569, 1,
-0.4309737, 1.35576, -0.5369297, 0, 1, 0.01176471, 1,
-0.4291791, 0.8309088, -0.8815093, 0, 1, 0.01568628, 1,
-0.4251658, -1.352319, -3.286094, 0, 1, 0.02352941, 1,
-0.4216054, -1.12265, -3.771004, 0, 1, 0.02745098, 1,
-0.4176395, -0.01537914, 0.7364295, 0, 1, 0.03529412, 1,
-0.4139035, 1.089013, 0.3901154, 0, 1, 0.03921569, 1,
-0.4095603, 1.650945, -1.070864, 0, 1, 0.04705882, 1,
-0.4074851, -0.2048906, -2.396513, 0, 1, 0.05098039, 1,
-0.4031641, 0.1726646, 0.1655722, 0, 1, 0.05882353, 1,
-0.4026413, -0.6381477, -0.5210682, 0, 1, 0.0627451, 1,
-0.4018371, 0.3036063, -1.694345, 0, 1, 0.07058824, 1,
-0.395993, -1.485056, -1.080734, 0, 1, 0.07450981, 1,
-0.3923659, -1.17985, -3.965825, 0, 1, 0.08235294, 1,
-0.3912527, 1.761466, -0.8298917, 0, 1, 0.08627451, 1,
-0.3911804, -0.1008281, -2.090037, 0, 1, 0.09411765, 1,
-0.3893096, -0.1383041, -1.417841, 0, 1, 0.1019608, 1,
-0.3844168, 0.7047529, -0.7875433, 0, 1, 0.1058824, 1,
-0.3842473, 0.177876, -1.820261, 0, 1, 0.1137255, 1,
-0.3833942, -0.08688304, -1.683172, 0, 1, 0.1176471, 1,
-0.3805889, 0.8633205, -0.02318281, 0, 1, 0.1254902, 1,
-0.3778427, -0.9717299, -2.714009, 0, 1, 0.1294118, 1,
-0.3735846, 0.09651071, -1.807288, 0, 1, 0.1372549, 1,
-0.3734563, -0.97811, -2.502504, 0, 1, 0.1411765, 1,
-0.3651734, 1.232897, 0.2852108, 0, 1, 0.1490196, 1,
-0.3619504, 0.1073353, -1.264379, 0, 1, 0.1529412, 1,
-0.3552039, 0.07927284, -0.4388946, 0, 1, 0.1607843, 1,
-0.3538148, 0.5867853, -0.6397483, 0, 1, 0.1647059, 1,
-0.3501838, -1.16096, -3.971341, 0, 1, 0.172549, 1,
-0.3471825, -0.9628244, -3.017286, 0, 1, 0.1764706, 1,
-0.3461794, -0.8416751, -4.827896, 0, 1, 0.1843137, 1,
-0.3406761, 1.095449, 0.4731147, 0, 1, 0.1882353, 1,
-0.3400388, -0.5005996, -4.059025, 0, 1, 0.1960784, 1,
-0.3383524, 0.3036346, -0.187998, 0, 1, 0.2039216, 1,
-0.3378204, -1.717929, -3.858416, 0, 1, 0.2078431, 1,
-0.336308, -0.5336312, -1.066023, 0, 1, 0.2156863, 1,
-0.3351013, 0.6105394, -0.3004507, 0, 1, 0.2196078, 1,
-0.3302373, 0.6573991, -2.55614, 0, 1, 0.227451, 1,
-0.3272862, 0.1519426, -1.169144, 0, 1, 0.2313726, 1,
-0.3247485, -0.6321785, -1.590559, 0, 1, 0.2392157, 1,
-0.3222415, 1.02024, -1.69156, 0, 1, 0.2431373, 1,
-0.3196568, 0.2442671, 0.5787739, 0, 1, 0.2509804, 1,
-0.3191891, -0.918009, -1.841282, 0, 1, 0.254902, 1,
-0.3164726, -0.2023886, -1.351319, 0, 1, 0.2627451, 1,
-0.315236, 0.07811345, -2.634929, 0, 1, 0.2666667, 1,
-0.3106175, 0.3486737, -0.9714021, 0, 1, 0.2745098, 1,
-0.3103415, -0.5989365, -0.9952583, 0, 1, 0.2784314, 1,
-0.3086496, -2.108942, -1.401055, 0, 1, 0.2862745, 1,
-0.2976037, 3.770695, -1.653127, 0, 1, 0.2901961, 1,
-0.2937002, 0.6430133, -0.7908035, 0, 1, 0.2980392, 1,
-0.2934421, 0.7219847, 0.4165289, 0, 1, 0.3058824, 1,
-0.2920991, -1.584092, -4.12308, 0, 1, 0.3098039, 1,
-0.2856668, -1.401808, -0.7905611, 0, 1, 0.3176471, 1,
-0.2826306, -0.0134745, -2.88747, 0, 1, 0.3215686, 1,
-0.2823362, -0.2082458, -1.634281, 0, 1, 0.3294118, 1,
-0.2795053, 1.174662, -0.4627944, 0, 1, 0.3333333, 1,
-0.2771344, 1.575119, -1.980638, 0, 1, 0.3411765, 1,
-0.2754389, -1.078481, -1.891653, 0, 1, 0.345098, 1,
-0.2722299, -0.7120138, -2.864166, 0, 1, 0.3529412, 1,
-0.2721295, -1.374814, -2.130487, 0, 1, 0.3568628, 1,
-0.2686535, -1.651066, -2.11732, 0, 1, 0.3647059, 1,
-0.2679323, 0.6281792, 0.8426041, 0, 1, 0.3686275, 1,
-0.2661847, -0.7366874, -2.148619, 0, 1, 0.3764706, 1,
-0.2654944, 0.1953248, -0.6680822, 0, 1, 0.3803922, 1,
-0.2640363, 0.7757956, -0.1506098, 0, 1, 0.3882353, 1,
-0.2632965, -1.536954, -4.818695, 0, 1, 0.3921569, 1,
-0.2623376, -0.3222545, -2.818961, 0, 1, 0.4, 1,
-0.2610137, 0.8442777, -0.7391504, 0, 1, 0.4078431, 1,
-0.2607758, -0.5300647, -2.459433, 0, 1, 0.4117647, 1,
-0.2521318, 0.5277404, -0.5361592, 0, 1, 0.4196078, 1,
-0.2480305, 0.4037275, 0.8798969, 0, 1, 0.4235294, 1,
-0.2451961, -0.4790903, -3.621163, 0, 1, 0.4313726, 1,
-0.2437679, 1.692594, -0.3617054, 0, 1, 0.4352941, 1,
-0.2397428, -1.08132, -2.974935, 0, 1, 0.4431373, 1,
-0.2376875, -0.3607301, -1.975026, 0, 1, 0.4470588, 1,
-0.2353326, 0.3585535, 0.5376426, 0, 1, 0.454902, 1,
-0.2322552, -1.864699, -2.490016, 0, 1, 0.4588235, 1,
-0.227447, 0.7417635, 0.9276793, 0, 1, 0.4666667, 1,
-0.2221101, 0.03543561, -1.398162, 0, 1, 0.4705882, 1,
-0.2209953, -0.152731, -2.316932, 0, 1, 0.4784314, 1,
-0.2195935, 0.5391864, 0.7128323, 0, 1, 0.4823529, 1,
-0.2190799, 0.1690391, -1.416003, 0, 1, 0.4901961, 1,
-0.2170187, -1.962524, -3.288265, 0, 1, 0.4941176, 1,
-0.2156276, -0.9383371, -3.745967, 0, 1, 0.5019608, 1,
-0.2125299, 0.5599813, 1.524773, 0, 1, 0.509804, 1,
-0.2117215, 0.7605478, -0.9238249, 0, 1, 0.5137255, 1,
-0.2114629, -0.2248289, -2.603613, 0, 1, 0.5215687, 1,
-0.2086343, 1.447035, -0.314199, 0, 1, 0.5254902, 1,
-0.2081563, 3.175124, 0.5613215, 0, 1, 0.5333334, 1,
-0.2003365, -1.244982, -1.419238, 0, 1, 0.5372549, 1,
-0.1990418, -1.060378, -2.40201, 0, 1, 0.5450981, 1,
-0.1957681, 0.1981757, -2.179762, 0, 1, 0.5490196, 1,
-0.1955519, 1.310921, 0.9275612, 0, 1, 0.5568628, 1,
-0.1926243, -0.2467459, -2.021692, 0, 1, 0.5607843, 1,
-0.1894686, -0.05778709, -1.513812, 0, 1, 0.5686275, 1,
-0.1870929, 1.078119, 0.548214, 0, 1, 0.572549, 1,
-0.1870485, -0.1375397, -0.8137109, 0, 1, 0.5803922, 1,
-0.1864505, 0.7002311, 0.5293074, 0, 1, 0.5843138, 1,
-0.186416, -0.6302356, -1.899273, 0, 1, 0.5921569, 1,
-0.183047, -0.1252464, -1.889255, 0, 1, 0.5960785, 1,
-0.1825008, 0.8210308, -0.2499076, 0, 1, 0.6039216, 1,
-0.1787228, -0.7780681, -0.372542, 0, 1, 0.6117647, 1,
-0.1763178, -0.7029884, -2.330575, 0, 1, 0.6156863, 1,
-0.1754239, -1.097992, -2.226908, 0, 1, 0.6235294, 1,
-0.1686335, 0.5978352, -0.311684, 0, 1, 0.627451, 1,
-0.166097, -0.3381286, -2.425078, 0, 1, 0.6352941, 1,
-0.1641345, -1.444876, -4.048336, 0, 1, 0.6392157, 1,
-0.1619318, 0.6732106, 0.4945562, 0, 1, 0.6470588, 1,
-0.1612778, -0.3777948, -3.271857, 0, 1, 0.6509804, 1,
-0.1604656, -1.714935, -5.095432, 0, 1, 0.6588235, 1,
-0.1584613, -0.784826, -3.183001, 0, 1, 0.6627451, 1,
-0.1513168, 0.232025, -0.326539, 0, 1, 0.6705883, 1,
-0.1448646, -0.04424407, -2.535135, 0, 1, 0.6745098, 1,
-0.1369774, -0.6201411, -4.072526, 0, 1, 0.682353, 1,
-0.1320267, -1.599632, -3.968318, 0, 1, 0.6862745, 1,
-0.1316886, -0.3560601, -2.575779, 0, 1, 0.6941177, 1,
-0.1315621, -0.6028736, -4.237971, 0, 1, 0.7019608, 1,
-0.1262901, -0.9884988, -3.589293, 0, 1, 0.7058824, 1,
-0.114669, -0.5368184, -1.689439, 0, 1, 0.7137255, 1,
-0.1130052, -0.2699662, -1.308936, 0, 1, 0.7176471, 1,
-0.1109647, 3.287193, -0.6887572, 0, 1, 0.7254902, 1,
-0.1078235, -0.01533519, -0.8520052, 0, 1, 0.7294118, 1,
-0.1071689, 0.2826451, -1.586531, 0, 1, 0.7372549, 1,
-0.1043222, -0.2110022, -4.050025, 0, 1, 0.7411765, 1,
-0.1039347, 0.1615452, 0.9178925, 0, 1, 0.7490196, 1,
-0.103649, -0.3142188, -4.516198, 0, 1, 0.7529412, 1,
-0.1005333, -0.9111129, -4.418578, 0, 1, 0.7607843, 1,
-0.09840283, -0.0719045, -2.383009, 0, 1, 0.7647059, 1,
-0.09751549, 0.6830547, -0.04283262, 0, 1, 0.772549, 1,
-0.09715084, 0.06815797, -1.066211, 0, 1, 0.7764706, 1,
-0.09343773, 0.8287157, 2.199935, 0, 1, 0.7843137, 1,
-0.09126215, -1.376374, -1.287365, 0, 1, 0.7882353, 1,
-0.09081069, 0.009831754, -1.540016, 0, 1, 0.7960784, 1,
-0.08382237, -0.439218, -2.326133, 0, 1, 0.8039216, 1,
-0.08377451, 0.3991695, 1.046587, 0, 1, 0.8078431, 1,
-0.08360776, -0.9536346, -1.477465, 0, 1, 0.8156863, 1,
-0.08356857, 0.8167448, 1.426747, 0, 1, 0.8196079, 1,
-0.0823457, -0.4614767, -1.58822, 0, 1, 0.827451, 1,
-0.08162683, -0.3936689, -3.255073, 0, 1, 0.8313726, 1,
-0.07883411, -0.1487536, -4.256444, 0, 1, 0.8392157, 1,
-0.07623671, -1.24498, -3.192311, 0, 1, 0.8431373, 1,
-0.07349622, -0.2780319, -4.058241, 0, 1, 0.8509804, 1,
-0.07334883, -0.2769425, -5.251529, 0, 1, 0.854902, 1,
-0.05996757, -1.058217, -0.126251, 0, 1, 0.8627451, 1,
-0.05099377, -1.646296, -1.900616, 0, 1, 0.8666667, 1,
-0.04384183, 0.2613547, -0.7576483, 0, 1, 0.8745098, 1,
-0.04232594, 0.5866846, 0.8660802, 0, 1, 0.8784314, 1,
-0.03992305, -0.8894351, -4.198545, 0, 1, 0.8862745, 1,
-0.03791143, 0.7987163, 0.6956918, 0, 1, 0.8901961, 1,
-0.02690601, 0.9558581, -0.2773093, 0, 1, 0.8980392, 1,
-0.02660473, -1.086131, -5.658083, 0, 1, 0.9058824, 1,
-0.02555781, -0.626424, -3.035629, 0, 1, 0.9098039, 1,
-0.02471121, -0.6664698, -4.749825, 0, 1, 0.9176471, 1,
-0.02089755, 0.3999222, -2.081172, 0, 1, 0.9215686, 1,
-0.01116884, 0.02261496, -2.210814, 0, 1, 0.9294118, 1,
-0.004212628, -1.221651, -2.020377, 0, 1, 0.9333333, 1,
-0.003031515, -0.05832367, -3.712639, 0, 1, 0.9411765, 1,
-0.002783187, 0.3896824, 0.1476327, 0, 1, 0.945098, 1,
-0.002377057, 0.3873676, 0.3695452, 0, 1, 0.9529412, 1,
-0.001919873, -0.9384636, -2.499543, 0, 1, 0.9568627, 1,
0.001268813, -0.7262133, 3.260578, 0, 1, 0.9647059, 1,
0.006654985, 0.1903935, 1.597757, 0, 1, 0.9686275, 1,
0.01413446, 0.4004935, 0.1957476, 0, 1, 0.9764706, 1,
0.01472015, -0.1324389, 4.147615, 0, 1, 0.9803922, 1,
0.02193093, 0.3470246, -0.8093094, 0, 1, 0.9882353, 1,
0.02465374, 0.7205079, -0.4108775, 0, 1, 0.9921569, 1,
0.02860371, 0.1968582, 0.8353729, 0, 1, 1, 1,
0.03235521, -0.2470345, 2.206047, 0, 0.9921569, 1, 1,
0.03260565, 1.061717, -0.01636017, 0, 0.9882353, 1, 1,
0.0354348, 1.431327, -0.3586179, 0, 0.9803922, 1, 1,
0.03784429, -0.1918379, 2.685637, 0, 0.9764706, 1, 1,
0.03991725, 1.116222, -0.04607416, 0, 0.9686275, 1, 1,
0.04558184, -0.7849581, 2.690815, 0, 0.9647059, 1, 1,
0.04773653, 0.5205326, 0.1827506, 0, 0.9568627, 1, 1,
0.04862229, 0.2586204, -0.1728289, 0, 0.9529412, 1, 1,
0.04886591, 0.8522153, -0.4701311, 0, 0.945098, 1, 1,
0.05287353, -0.2321873, 4.162696, 0, 0.9411765, 1, 1,
0.05331168, -0.09166238, 2.043019, 0, 0.9333333, 1, 1,
0.05548545, -0.9215176, 2.767949, 0, 0.9294118, 1, 1,
0.05684088, 0.4665213, 1.340495, 0, 0.9215686, 1, 1,
0.06632619, 0.2809384, 1.497342, 0, 0.9176471, 1, 1,
0.06841864, -0.5951886, 4.433611, 0, 0.9098039, 1, 1,
0.06861615, -0.03964932, 2.395724, 0, 0.9058824, 1, 1,
0.06951512, 0.230366, 1.868001, 0, 0.8980392, 1, 1,
0.07168802, -0.1996326, 3.451239, 0, 0.8901961, 1, 1,
0.07348148, -1.250925, 3.806769, 0, 0.8862745, 1, 1,
0.07432107, -0.903627, 4.008878, 0, 0.8784314, 1, 1,
0.07777045, -0.2606099, 4.711259, 0, 0.8745098, 1, 1,
0.07874263, -0.8041226, 2.554226, 0, 0.8666667, 1, 1,
0.08509293, 1.098025, -1.017365, 0, 0.8627451, 1, 1,
0.08689618, 0.2345471, -0.05142791, 0, 0.854902, 1, 1,
0.09302725, 0.8825284, 1.514725, 0, 0.8509804, 1, 1,
0.09333842, -0.561433, 3.047137, 0, 0.8431373, 1, 1,
0.1000115, -1.159885, 1.475513, 0, 0.8392157, 1, 1,
0.1043434, -0.6978163, 3.183746, 0, 0.8313726, 1, 1,
0.1067232, 0.675945, 1.098913, 0, 0.827451, 1, 1,
0.1067587, -0.7707459, 3.081031, 0, 0.8196079, 1, 1,
0.1091183, -0.4532184, 3.392275, 0, 0.8156863, 1, 1,
0.110259, -1.174612, 2.924858, 0, 0.8078431, 1, 1,
0.1138226, 0.01026213, 1.508732, 0, 0.8039216, 1, 1,
0.1157919, 0.4247867, 1.472155, 0, 0.7960784, 1, 1,
0.118519, 0.170441, 0.4866003, 0, 0.7882353, 1, 1,
0.1223244, 1.078877, -1.122605, 0, 0.7843137, 1, 1,
0.1240299, 0.8401929, 0.1641086, 0, 0.7764706, 1, 1,
0.1275422, -0.02566917, 1.616288, 0, 0.772549, 1, 1,
0.1295467, -2.384329, 1.979392, 0, 0.7647059, 1, 1,
0.132434, -2.511514, 3.220019, 0, 0.7607843, 1, 1,
0.1340324, 0.514116, 1.694969, 0, 0.7529412, 1, 1,
0.1348988, 1.737668, 1.076342, 0, 0.7490196, 1, 1,
0.136135, -0.6451114, 1.986209, 0, 0.7411765, 1, 1,
0.1363344, -0.7321199, 2.746051, 0, 0.7372549, 1, 1,
0.1418478, 0.4122021, 0.166935, 0, 0.7294118, 1, 1,
0.1499676, 0.5541493, 0.6375442, 0, 0.7254902, 1, 1,
0.1510684, 0.2457596, 1.322715, 0, 0.7176471, 1, 1,
0.1565314, 1.419395, -0.1879048, 0, 0.7137255, 1, 1,
0.1568992, -1.470111, 3.123714, 0, 0.7058824, 1, 1,
0.1706214, -0.4224264, 2.346177, 0, 0.6980392, 1, 1,
0.1709296, 0.2089516, 0.6573305, 0, 0.6941177, 1, 1,
0.1745166, 0.1350857, 1.901949, 0, 0.6862745, 1, 1,
0.1750433, 0.9777429, 0.1871634, 0, 0.682353, 1, 1,
0.1764375, -0.7730711, 2.508241, 0, 0.6745098, 1, 1,
0.1795143, -0.9983162, 3.111281, 0, 0.6705883, 1, 1,
0.1818883, -1.195271, 2.550375, 0, 0.6627451, 1, 1,
0.1850125, -1.086872, 2.653778, 0, 0.6588235, 1, 1,
0.1892115, 0.2095398, 1.738496, 0, 0.6509804, 1, 1,
0.1911835, -1.311971, 1.430713, 0, 0.6470588, 1, 1,
0.1995385, -1.230372, 1.847154, 0, 0.6392157, 1, 1,
0.2013862, 0.8100606, -0.1784633, 0, 0.6352941, 1, 1,
0.20375, 0.1516811, 1.319184, 0, 0.627451, 1, 1,
0.2058479, -1.674126, 4.085232, 0, 0.6235294, 1, 1,
0.2082693, -0.519233, 3.996716, 0, 0.6156863, 1, 1,
0.2093973, 1.171679, 0.6139283, 0, 0.6117647, 1, 1,
0.2121356, 1.047094, 1.099979, 0, 0.6039216, 1, 1,
0.2129942, 0.9796708, 0.3875288, 0, 0.5960785, 1, 1,
0.2133836, -0.03892879, 2.878652, 0, 0.5921569, 1, 1,
0.2135636, 0.1592877, 0.3689791, 0, 0.5843138, 1, 1,
0.2141542, -0.6472386, 3.197637, 0, 0.5803922, 1, 1,
0.2149564, 0.7788903, 0.7108647, 0, 0.572549, 1, 1,
0.2188355, 0.2271383, 1.944091, 0, 0.5686275, 1, 1,
0.2288886, 0.7496531, -0.3988813, 0, 0.5607843, 1, 1,
0.2312491, -0.8715037, 1.461671, 0, 0.5568628, 1, 1,
0.2417315, -0.3171163, 1.834405, 0, 0.5490196, 1, 1,
0.2442094, 0.8797767, 0.08183352, 0, 0.5450981, 1, 1,
0.246342, 0.4962474, 1.475855, 0, 0.5372549, 1, 1,
0.2476065, 0.6331379, 0.4771106, 0, 0.5333334, 1, 1,
0.2535514, -2.222471, 3.590598, 0, 0.5254902, 1, 1,
0.2560846, 0.7025545, -1.346789, 0, 0.5215687, 1, 1,
0.2576581, 0.5369773, 1.765811, 0, 0.5137255, 1, 1,
0.2607372, -0.584798, 1.803622, 0, 0.509804, 1, 1,
0.2625062, -0.06658942, 2.252335, 0, 0.5019608, 1, 1,
0.2647569, -0.6262845, 2.244098, 0, 0.4941176, 1, 1,
0.2662804, -0.8939127, 2.607573, 0, 0.4901961, 1, 1,
0.2679899, -1.157159, 1.588825, 0, 0.4823529, 1, 1,
0.268424, 0.7394493, 2.752751, 0, 0.4784314, 1, 1,
0.2768328, 0.2092584, 2.03466, 0, 0.4705882, 1, 1,
0.2773021, -0.3190925, 1.925645, 0, 0.4666667, 1, 1,
0.278432, -0.7987886, 2.693988, 0, 0.4588235, 1, 1,
0.2798505, -0.08941569, 3.704986, 0, 0.454902, 1, 1,
0.2829612, -0.410586, 2.460427, 0, 0.4470588, 1, 1,
0.2856964, -0.6656756, 1.114904, 0, 0.4431373, 1, 1,
0.2897443, 0.2149858, 2.025876, 0, 0.4352941, 1, 1,
0.2898659, -0.1970098, 1.097284, 0, 0.4313726, 1, 1,
0.2926636, -0.5441073, 2.371877, 0, 0.4235294, 1, 1,
0.2968383, 0.403583, 0.7341805, 0, 0.4196078, 1, 1,
0.2986903, 0.5197372, 0.09541143, 0, 0.4117647, 1, 1,
0.3004632, -1.343767, 3.339643, 0, 0.4078431, 1, 1,
0.3026531, -1.166761, 2.471352, 0, 0.4, 1, 1,
0.3044403, -0.3210284, 1.619204, 0, 0.3921569, 1, 1,
0.3076717, 1.287559, 0.7708499, 0, 0.3882353, 1, 1,
0.3082331, 0.08390492, 2.367127, 0, 0.3803922, 1, 1,
0.3089181, -1.008241, 3.722993, 0, 0.3764706, 1, 1,
0.310094, -0.0675959, 2.536571, 0, 0.3686275, 1, 1,
0.3107185, -0.4436851, 2.285599, 0, 0.3647059, 1, 1,
0.3160509, 2.13459, 0.2522437, 0, 0.3568628, 1, 1,
0.3163801, 1.015963, -1.734008, 0, 0.3529412, 1, 1,
0.3208903, -0.2551116, 0.7336256, 0, 0.345098, 1, 1,
0.3236055, -0.6831586, 1.841337, 0, 0.3411765, 1, 1,
0.3244832, 0.6308839, 0.2248728, 0, 0.3333333, 1, 1,
0.3284681, 1.240542, 0.9425465, 0, 0.3294118, 1, 1,
0.3287095, 1.037036, -2.86786, 0, 0.3215686, 1, 1,
0.3328212, -0.4286108, 2.966653, 0, 0.3176471, 1, 1,
0.337183, 0.2609164, 0.790236, 0, 0.3098039, 1, 1,
0.3381854, 0.9447223, 1.314225, 0, 0.3058824, 1, 1,
0.3394398, 0.05285184, 1.346805, 0, 0.2980392, 1, 1,
0.3434507, 0.9910841, 1.363035, 0, 0.2901961, 1, 1,
0.3480578, 1.783243, -1.128456, 0, 0.2862745, 1, 1,
0.3558996, 0.6929893, -0.677337, 0, 0.2784314, 1, 1,
0.3569085, -0.896131, 4.009112, 0, 0.2745098, 1, 1,
0.3580371, 0.5938335, 0.5480597, 0, 0.2666667, 1, 1,
0.358233, -0.5158365, 1.856491, 0, 0.2627451, 1, 1,
0.359141, 0.3023143, 1.260155, 0, 0.254902, 1, 1,
0.3599717, -0.388998, 1.690688, 0, 0.2509804, 1, 1,
0.3620711, -1.654632, 4.728762, 0, 0.2431373, 1, 1,
0.3632877, 1.523079, 0.9465939, 0, 0.2392157, 1, 1,
0.3647184, -0.2012034, 2.87019, 0, 0.2313726, 1, 1,
0.3726907, -0.3495186, 1.081982, 0, 0.227451, 1, 1,
0.373965, 0.2987618, -0.2726336, 0, 0.2196078, 1, 1,
0.3757347, 0.9889327, -0.1859615, 0, 0.2156863, 1, 1,
0.3778245, -1.111456, 1.693921, 0, 0.2078431, 1, 1,
0.3826261, -0.8154843, 3.236365, 0, 0.2039216, 1, 1,
0.3872102, 2.165297, 0.2920656, 0, 0.1960784, 1, 1,
0.3893551, -1.282419, 2.884265, 0, 0.1882353, 1, 1,
0.3948549, 0.287867, 1.306869, 0, 0.1843137, 1, 1,
0.3980484, 0.6311911, 1.791305, 0, 0.1764706, 1, 1,
0.3987201, -0.7857911, 1.561819, 0, 0.172549, 1, 1,
0.3992116, 1.461062, 1.150523, 0, 0.1647059, 1, 1,
0.4079147, -0.3150304, 4.007094, 0, 0.1607843, 1, 1,
0.4082145, -0.5011806, 2.912139, 0, 0.1529412, 1, 1,
0.4127463, 1.584006, 1.148638, 0, 0.1490196, 1, 1,
0.4143678, 1.520285, 1.763073, 0, 0.1411765, 1, 1,
0.4145175, -0.9670851, 3.103222, 0, 0.1372549, 1, 1,
0.4251091, 0.988147, 0.3434845, 0, 0.1294118, 1, 1,
0.4292155, 0.098929, 1.386703, 0, 0.1254902, 1, 1,
0.4342892, -0.5730307, 3.85503, 0, 0.1176471, 1, 1,
0.4358204, 0.6171746, 2.592689, 0, 0.1137255, 1, 1,
0.4379705, 0.2570099, 1.223893, 0, 0.1058824, 1, 1,
0.4413168, -0.8720298, 3.148557, 0, 0.09803922, 1, 1,
0.4474569, -0.1963388, 2.440741, 0, 0.09411765, 1, 1,
0.4500914, 0.2831401, 1.541989, 0, 0.08627451, 1, 1,
0.4533311, -1.805789, 2.556231, 0, 0.08235294, 1, 1,
0.4561791, -0.6403301, 2.442517, 0, 0.07450981, 1, 1,
0.4636487, 0.8395271, -0.5176674, 0, 0.07058824, 1, 1,
0.4642317, 0.03511754, 3.106381, 0, 0.0627451, 1, 1,
0.4655088, 0.1296904, 2.231168, 0, 0.05882353, 1, 1,
0.4672437, 0.3168774, 2.326021, 0, 0.05098039, 1, 1,
0.468023, -2.817129, 4.626395, 0, 0.04705882, 1, 1,
0.4791764, 1.752826, 0.9757904, 0, 0.03921569, 1, 1,
0.4828065, -0.06444249, 2.961108, 0, 0.03529412, 1, 1,
0.4840422, 2.433861, 0.7863573, 0, 0.02745098, 1, 1,
0.4846013, -1.017465, 2.945465, 0, 0.02352941, 1, 1,
0.4868541, -0.7391776, 3.069235, 0, 0.01568628, 1, 1,
0.4870519, 0.07470805, 2.698537, 0, 0.01176471, 1, 1,
0.4871517, -0.9756168, 2.135484, 0, 0.003921569, 1, 1,
0.4894377, 1.054912, -0.4332168, 0.003921569, 0, 1, 1,
0.4908015, 0.2721527, 1.808437, 0.007843138, 0, 1, 1,
0.4945113, 0.616201, 0.5686072, 0.01568628, 0, 1, 1,
0.4952709, -0.3385645, 2.861705, 0.01960784, 0, 1, 1,
0.498223, -1.258663, 3.064279, 0.02745098, 0, 1, 1,
0.4996315, -0.4432898, 3.495184, 0.03137255, 0, 1, 1,
0.5034539, -1.034485, 1.795035, 0.03921569, 0, 1, 1,
0.5045438, -0.8448408, 2.477491, 0.04313726, 0, 1, 1,
0.5095376, 0.9804201, 0.2908914, 0.05098039, 0, 1, 1,
0.5143977, -0.2997135, 4.264796, 0.05490196, 0, 1, 1,
0.5163455, -0.627342, 1.764037, 0.0627451, 0, 1, 1,
0.5177016, 1.704723, -0.6337898, 0.06666667, 0, 1, 1,
0.5216563, 1.819494, 0.7928867, 0.07450981, 0, 1, 1,
0.5227365, -0.9027882, 1.231344, 0.07843138, 0, 1, 1,
0.5232147, -1.093187, 3.209146, 0.08627451, 0, 1, 1,
0.5270527, 1.362251, 1.559437, 0.09019608, 0, 1, 1,
0.5291923, 0.5848417, 1.164642, 0.09803922, 0, 1, 1,
0.5292479, 0.7553647, 0.3011393, 0.1058824, 0, 1, 1,
0.5332587, 0.379135, 1.921597, 0.1098039, 0, 1, 1,
0.5394737, 0.9213601, -0.2895737, 0.1176471, 0, 1, 1,
0.5513417, -1.284044, 2.467305, 0.1215686, 0, 1, 1,
0.5514768, 1.05874, 1.741487, 0.1294118, 0, 1, 1,
0.5533882, 0.7486699, 0.6221045, 0.1333333, 0, 1, 1,
0.553528, 1.103509, 0.7362215, 0.1411765, 0, 1, 1,
0.5543864, 0.2617085, 1.099094, 0.145098, 0, 1, 1,
0.5556884, 0.6171563, -0.7104918, 0.1529412, 0, 1, 1,
0.5620931, 1.022427, -0.4025629, 0.1568628, 0, 1, 1,
0.5625063, -0.1452494, 0.6171045, 0.1647059, 0, 1, 1,
0.5691712, 0.8778124, 1.604815, 0.1686275, 0, 1, 1,
0.5710691, -1.205307, 3.946711, 0.1764706, 0, 1, 1,
0.5725957, -0.1179471, 0.3699901, 0.1803922, 0, 1, 1,
0.5746872, 0.09767539, 0.5863348, 0.1882353, 0, 1, 1,
0.5779797, -1.336228, 2.780699, 0.1921569, 0, 1, 1,
0.5819843, -1.891828, 2.962697, 0.2, 0, 1, 1,
0.582207, -0.5325433, 1.837104, 0.2078431, 0, 1, 1,
0.5865395, -0.4107626, 1.6595, 0.2117647, 0, 1, 1,
0.5881028, -0.1640986, 1.091553, 0.2196078, 0, 1, 1,
0.5926054, 0.3775868, 0.05726701, 0.2235294, 0, 1, 1,
0.5939348, -0.4965549, 1.52971, 0.2313726, 0, 1, 1,
0.5940359, 0.7552189, -0.05833629, 0.2352941, 0, 1, 1,
0.5949146, 1.174728, -1.802715, 0.2431373, 0, 1, 1,
0.5954546, -0.3048296, 1.543822, 0.2470588, 0, 1, 1,
0.597293, 1.319411, 0.533084, 0.254902, 0, 1, 1,
0.6093157, -0.5929758, 0.2169739, 0.2588235, 0, 1, 1,
0.6115149, 0.932558, 0.1414913, 0.2666667, 0, 1, 1,
0.6144283, 2.201913, 0.005215063, 0.2705882, 0, 1, 1,
0.6157307, -1.291994, 2.103755, 0.2784314, 0, 1, 1,
0.6159723, -1.662874, 1.501932, 0.282353, 0, 1, 1,
0.6162532, -0.2174467, 2.01598, 0.2901961, 0, 1, 1,
0.6192131, -0.02099362, 1.899078, 0.2941177, 0, 1, 1,
0.6230313, -1.193089, 3.111304, 0.3019608, 0, 1, 1,
0.6256626, -0.6512027, 1.033214, 0.3098039, 0, 1, 1,
0.6282389, 1.428838, -0.5519014, 0.3137255, 0, 1, 1,
0.6326647, -1.128111, 2.918199, 0.3215686, 0, 1, 1,
0.6445026, -1.859904, 2.737116, 0.3254902, 0, 1, 1,
0.6475416, 1.508024, -0.4853432, 0.3333333, 0, 1, 1,
0.6517992, 0.7390093, 1.834027, 0.3372549, 0, 1, 1,
0.6530665, -0.842617, 3.307429, 0.345098, 0, 1, 1,
0.6541576, -0.8851364, 2.534923, 0.3490196, 0, 1, 1,
0.6579171, -0.3914429, 3.181634, 0.3568628, 0, 1, 1,
0.6586099, 0.8346941, 0.9325631, 0.3607843, 0, 1, 1,
0.6590733, 0.5317248, 0.5927033, 0.3686275, 0, 1, 1,
0.6596872, -1.650656, 2.842341, 0.372549, 0, 1, 1,
0.6600329, -0.2465259, 3.034748, 0.3803922, 0, 1, 1,
0.6627583, 0.6176203, 0.5439206, 0.3843137, 0, 1, 1,
0.6643775, -2.65859, 0.7770271, 0.3921569, 0, 1, 1,
0.6651437, -2.12762, 3.546554, 0.3960784, 0, 1, 1,
0.6667571, 0.468514, 0.1644603, 0.4039216, 0, 1, 1,
0.6687583, -0.2449234, 1.555521, 0.4117647, 0, 1, 1,
0.6704105, 0.9177721, 0.8592022, 0.4156863, 0, 1, 1,
0.6708608, 1.047065, 1.747378, 0.4235294, 0, 1, 1,
0.6708903, 0.8725784, -0.02817665, 0.427451, 0, 1, 1,
0.6721033, -1.95895, 2.506457, 0.4352941, 0, 1, 1,
0.6763541, -0.4355307, 1.778759, 0.4392157, 0, 1, 1,
0.67676, -1.703895, 2.962776, 0.4470588, 0, 1, 1,
0.6803936, -0.6076159, 0.9817055, 0.4509804, 0, 1, 1,
0.6840301, 0.1174977, 0.9294293, 0.4588235, 0, 1, 1,
0.6868788, 0.02303026, 1.618224, 0.4627451, 0, 1, 1,
0.6887787, -1.074149, 3.246736, 0.4705882, 0, 1, 1,
0.6888306, 0.5904486, 1.259362, 0.4745098, 0, 1, 1,
0.6893542, 0.3138595, -0.0573189, 0.4823529, 0, 1, 1,
0.6943733, -0.1732153, 0.7426211, 0.4862745, 0, 1, 1,
0.6944457, -1.654751, 1.18927, 0.4941176, 0, 1, 1,
0.6944758, 0.7821434, 1.69039, 0.5019608, 0, 1, 1,
0.6969064, -0.3246027, 1.350629, 0.5058824, 0, 1, 1,
0.6974495, 1.822176, 0.153228, 0.5137255, 0, 1, 1,
0.7001123, -0.8710459, 1.833454, 0.5176471, 0, 1, 1,
0.7003934, 1.353973, 3.279345, 0.5254902, 0, 1, 1,
0.7015279, 0.9451984, 0.01129233, 0.5294118, 0, 1, 1,
0.7028863, -1.775208, 3.779406, 0.5372549, 0, 1, 1,
0.7065493, -0.7958868, 3.569274, 0.5411765, 0, 1, 1,
0.7147017, 0.09049828, 1.579467, 0.5490196, 0, 1, 1,
0.715983, -0.1176483, 1.692042, 0.5529412, 0, 1, 1,
0.7183954, 2.111153, 0.3269305, 0.5607843, 0, 1, 1,
0.7259148, 0.5979366, 1.671947, 0.5647059, 0, 1, 1,
0.7279595, 0.248316, 0.7183479, 0.572549, 0, 1, 1,
0.7280649, 0.4742795, 0.6074958, 0.5764706, 0, 1, 1,
0.7306216, -2.502042, 2.155462, 0.5843138, 0, 1, 1,
0.7367598, -0.1121844, 0.7347062, 0.5882353, 0, 1, 1,
0.7395201, -0.738866, 1.039044, 0.5960785, 0, 1, 1,
0.7431537, 0.6184821, 0.1894922, 0.6039216, 0, 1, 1,
0.7448115, 0.3206367, 0.812216, 0.6078432, 0, 1, 1,
0.7449013, -0.4724404, 1.228954, 0.6156863, 0, 1, 1,
0.745449, -1.123684, 1.385197, 0.6196079, 0, 1, 1,
0.7454872, -1.182642, 3.070528, 0.627451, 0, 1, 1,
0.7469252, 0.5211874, -0.7839968, 0.6313726, 0, 1, 1,
0.7543131, -1.995845, 2.219075, 0.6392157, 0, 1, 1,
0.7586638, 2.208482, -1.560639, 0.6431373, 0, 1, 1,
0.766835, 0.157221, 1.520846, 0.6509804, 0, 1, 1,
0.7674651, -0.8613915, -0.02610844, 0.654902, 0, 1, 1,
0.7680284, 0.1509277, 0.9142923, 0.6627451, 0, 1, 1,
0.7715165, -1.099515, 0.9353105, 0.6666667, 0, 1, 1,
0.7734516, 1.361174, -0.9149411, 0.6745098, 0, 1, 1,
0.7747997, 0.2862951, 1.061398, 0.6784314, 0, 1, 1,
0.7753524, 0.498199, 0.4306338, 0.6862745, 0, 1, 1,
0.785709, -2.046613, 3.506014, 0.6901961, 0, 1, 1,
0.7869713, -0.7791013, 2.63823, 0.6980392, 0, 1, 1,
0.7960135, 0.3657477, 2.22966, 0.7058824, 0, 1, 1,
0.7990362, 1.066082, 0.750618, 0.7098039, 0, 1, 1,
0.8111506, -0.1142104, 1.829179, 0.7176471, 0, 1, 1,
0.8126418, -1.393695, 2.52663, 0.7215686, 0, 1, 1,
0.8155592, -2.062681, 2.466466, 0.7294118, 0, 1, 1,
0.8178414, 1.582402, -0.3788348, 0.7333333, 0, 1, 1,
0.8188251, 0.5287548, 0.9204129, 0.7411765, 0, 1, 1,
0.8198057, 0.8451111, -0.04543582, 0.7450981, 0, 1, 1,
0.8213782, 1.081482, 1.749503, 0.7529412, 0, 1, 1,
0.8222373, -2.318843, 0.09521429, 0.7568628, 0, 1, 1,
0.8223826, -0.07594862, 0.4425938, 0.7647059, 0, 1, 1,
0.8233491, 1.645871, 0.958854, 0.7686275, 0, 1, 1,
0.824382, -0.5290905, 3.330213, 0.7764706, 0, 1, 1,
0.8264419, -0.782273, 2.198939, 0.7803922, 0, 1, 1,
0.8284733, -1.367014, 1.856347, 0.7882353, 0, 1, 1,
0.8308754, -0.292661, 0.9534703, 0.7921569, 0, 1, 1,
0.8342857, -0.355386, 2.154709, 0.8, 0, 1, 1,
0.8366065, -1.990293, 2.366547, 0.8078431, 0, 1, 1,
0.8411268, -1.085837, 2.830733, 0.8117647, 0, 1, 1,
0.8447896, -0.2665358, 2.484431, 0.8196079, 0, 1, 1,
0.8456326, 0.2415415, -0.1298311, 0.8235294, 0, 1, 1,
0.8474908, 2.718304, -0.6342854, 0.8313726, 0, 1, 1,
0.8489384, 0.3264358, -0.2168147, 0.8352941, 0, 1, 1,
0.8489786, -1.448, 2.223836, 0.8431373, 0, 1, 1,
0.862674, 0.6875552, 2.080133, 0.8470588, 0, 1, 1,
0.8651647, 0.1620718, 1.260167, 0.854902, 0, 1, 1,
0.8658919, 0.5676561, 1.371834, 0.8588235, 0, 1, 1,
0.8675619, -0.3423857, 1.041207, 0.8666667, 0, 1, 1,
0.8725474, -0.6766384, 1.250203, 0.8705882, 0, 1, 1,
0.8734403, 0.8472693, 2.600219, 0.8784314, 0, 1, 1,
0.886999, -0.8685886, 1.610705, 0.8823529, 0, 1, 1,
0.8891349, 0.4794831, 1.228909, 0.8901961, 0, 1, 1,
0.8906634, 0.2941352, 2.000048, 0.8941177, 0, 1, 1,
0.8975416, -1.777136, 1.941354, 0.9019608, 0, 1, 1,
0.8994853, 0.2282874, 2.651586, 0.9098039, 0, 1, 1,
0.9007784, 0.02890463, 2.266838, 0.9137255, 0, 1, 1,
0.908277, 2.207559, 1.582785, 0.9215686, 0, 1, 1,
0.9125403, -0.2367627, -1.168777, 0.9254902, 0, 1, 1,
0.9152672, 2.207657, 0.5246979, 0.9333333, 0, 1, 1,
0.9157135, 1.372625, 2.618701, 0.9372549, 0, 1, 1,
0.9162357, -1.615867, 2.9199, 0.945098, 0, 1, 1,
0.9164189, 0.4579735, 2.361938, 0.9490196, 0, 1, 1,
0.9310148, -0.6544243, 2.465886, 0.9568627, 0, 1, 1,
0.9315752, 0.2876021, 1.960629, 0.9607843, 0, 1, 1,
0.9467559, 0.5231062, 1.922444, 0.9686275, 0, 1, 1,
0.9472402, -0.3289874, 0.8467022, 0.972549, 0, 1, 1,
0.9508564, -0.6181383, 0.07378279, 0.9803922, 0, 1, 1,
0.955655, 0.3787952, 2.510548, 0.9843137, 0, 1, 1,
0.958671, 1.045512, 0.1208777, 0.9921569, 0, 1, 1,
0.9660636, 0.06079307, 3.797703, 0.9960784, 0, 1, 1,
0.968636, -0.3434133, 1.177491, 1, 0, 0.9960784, 1,
0.9733782, 0.5042949, 1.252692, 1, 0, 0.9882353, 1,
0.9772144, 0.1035683, 2.018306, 1, 0, 0.9843137, 1,
0.9795154, 0.5404414, -0.323833, 1, 0, 0.9764706, 1,
0.9813355, 1.506535, -1.263245, 1, 0, 0.972549, 1,
0.9832147, 0.2553684, 0.7515879, 1, 0, 0.9647059, 1,
0.9871274, 0.8180729, 0.08826578, 1, 0, 0.9607843, 1,
0.989181, -0.0957654, 1.967343, 1, 0, 0.9529412, 1,
0.9912499, -0.7198738, -0.6100374, 1, 0, 0.9490196, 1,
0.9950132, -1.20609, 3.797486, 1, 0, 0.9411765, 1,
0.995294, 0.1598047, 2.665576, 1, 0, 0.9372549, 1,
1.007117, 0.9817827, 1.966928, 1, 0, 0.9294118, 1,
1.009832, 1.132549, -0.5779746, 1, 0, 0.9254902, 1,
1.047171, 0.4800999, 1.782687, 1, 0, 0.9176471, 1,
1.056016, -0.7559902, 1.224076, 1, 0, 0.9137255, 1,
1.059521, -2.396519, 2.94835, 1, 0, 0.9058824, 1,
1.059971, 1.74543, 1.551897, 1, 0, 0.9019608, 1,
1.064698, 0.9449419, 1.489908, 1, 0, 0.8941177, 1,
1.066147, 0.3394765, 0.5485117, 1, 0, 0.8862745, 1,
1.066859, 1.203719, 3.218831, 1, 0, 0.8823529, 1,
1.073192, 0.7442328, 1.994566, 1, 0, 0.8745098, 1,
1.07447, -0.1053111, 1.06258, 1, 0, 0.8705882, 1,
1.077169, -1.438764, 2.785188, 1, 0, 0.8627451, 1,
1.080824, 1.541055, 1.231066, 1, 0, 0.8588235, 1,
1.08089, -0.2887617, 2.187393, 1, 0, 0.8509804, 1,
1.081891, -1.009355, 3.213213, 1, 0, 0.8470588, 1,
1.081933, -0.073944, 1.391634, 1, 0, 0.8392157, 1,
1.091027, -0.2776999, 3.226036, 1, 0, 0.8352941, 1,
1.092982, -0.1003403, 1.523969, 1, 0, 0.827451, 1,
1.111961, -0.1567386, 2.37624, 1, 0, 0.8235294, 1,
1.115363, -0.6920796, 2.2463, 1, 0, 0.8156863, 1,
1.118179, -0.1653499, 2.475725, 1, 0, 0.8117647, 1,
1.119442, 0.004909624, 1.0571, 1, 0, 0.8039216, 1,
1.124849, -0.908479, 1.92271, 1, 0, 0.7960784, 1,
1.142434, 1.299397, 0.6594882, 1, 0, 0.7921569, 1,
1.145288, -2.034031, 3.319941, 1, 0, 0.7843137, 1,
1.149207, -1.436301, 2.407922, 1, 0, 0.7803922, 1,
1.16081, 0.4537608, 2.006539, 1, 0, 0.772549, 1,
1.185501, -0.1684162, 2.608401, 1, 0, 0.7686275, 1,
1.194047, -1.172127, 3.156421, 1, 0, 0.7607843, 1,
1.201639, 0.3978482, 0.3287588, 1, 0, 0.7568628, 1,
1.210879, 1.519866, 0.2266706, 1, 0, 0.7490196, 1,
1.211702, -0.4650391, 2.12474, 1, 0, 0.7450981, 1,
1.216084, 0.5663788, 2.234813, 1, 0, 0.7372549, 1,
1.220981, 0.9764643, 2.330566, 1, 0, 0.7333333, 1,
1.222819, -0.1999144, 3.249702, 1, 0, 0.7254902, 1,
1.223745, 1.746468, 0.6002214, 1, 0, 0.7215686, 1,
1.230598, -0.3552078, 2.168986, 1, 0, 0.7137255, 1,
1.247978, 0.3629353, -0.09397248, 1, 0, 0.7098039, 1,
1.253702, -0.136338, 1.613948, 1, 0, 0.7019608, 1,
1.264946, 0.6975651, 2.564894, 1, 0, 0.6941177, 1,
1.265939, -0.732804, 2.493587, 1, 0, 0.6901961, 1,
1.266317, -1.457684, 2.837883, 1, 0, 0.682353, 1,
1.268698, 1.465304, -0.0274392, 1, 0, 0.6784314, 1,
1.27067, -1.294796, 0.5831348, 1, 0, 0.6705883, 1,
1.281224, 3.947998, 0.08480117, 1, 0, 0.6666667, 1,
1.282177, -0.3829884, 2.648476, 1, 0, 0.6588235, 1,
1.288646, -0.05464808, 0.1882038, 1, 0, 0.654902, 1,
1.291329, -0.07852413, -1.033858, 1, 0, 0.6470588, 1,
1.296703, -0.4125368, 3.069037, 1, 0, 0.6431373, 1,
1.301235, 0.7482129, 3.206346, 1, 0, 0.6352941, 1,
1.302857, 0.736039, -1.126118, 1, 0, 0.6313726, 1,
1.309761, -0.3230543, 1.113424, 1, 0, 0.6235294, 1,
1.326315, 1.43478, 0.973951, 1, 0, 0.6196079, 1,
1.326889, -1.392182, 2.348044, 1, 0, 0.6117647, 1,
1.343691, -1.646502, 2.754084, 1, 0, 0.6078432, 1,
1.344416, 1.013147, 0.324423, 1, 0, 0.6, 1,
1.349137, -0.3864314, 1.01099, 1, 0, 0.5921569, 1,
1.350352, 0.8415465, 0.7500532, 1, 0, 0.5882353, 1,
1.356306, -2.590896, 1.687247, 1, 0, 0.5803922, 1,
1.368066, 1.195129, 0.8794322, 1, 0, 0.5764706, 1,
1.368713, -0.220579, 1.912817, 1, 0, 0.5686275, 1,
1.375715, -0.134756, 0.8978804, 1, 0, 0.5647059, 1,
1.380192, 0.2262744, -0.4649996, 1, 0, 0.5568628, 1,
1.388653, 0.8506004, 0.8450795, 1, 0, 0.5529412, 1,
1.395659, 1.576212, -1.096757, 1, 0, 0.5450981, 1,
1.396572, 0.7086352, 1.529276, 1, 0, 0.5411765, 1,
1.405692, -0.2744915, 1.822069, 1, 0, 0.5333334, 1,
1.429151, -0.1326271, 0.7966281, 1, 0, 0.5294118, 1,
1.43497, -0.7311191, 1.638648, 1, 0, 0.5215687, 1,
1.438947, -1.951734, 2.226283, 1, 0, 0.5176471, 1,
1.439723, -0.5671949, 1.191178, 1, 0, 0.509804, 1,
1.44415, 1.036173, 0.8872712, 1, 0, 0.5058824, 1,
1.447015, 0.5410291, -0.09417368, 1, 0, 0.4980392, 1,
1.451746, 0.1160681, 1.836796, 1, 0, 0.4901961, 1,
1.462287, -0.2737277, 1.31854, 1, 0, 0.4862745, 1,
1.463505, -0.5518177, 1.901877, 1, 0, 0.4784314, 1,
1.485699, 1.293073, -1.282412, 1, 0, 0.4745098, 1,
1.486311, 0.08179665, 1.841935, 1, 0, 0.4666667, 1,
1.491206, 1.454303, 0.1285561, 1, 0, 0.4627451, 1,
1.49991, -0.2386526, 4.193796, 1, 0, 0.454902, 1,
1.50259, 0.6158085, 0.2442419, 1, 0, 0.4509804, 1,
1.516444, 1.015511, 1.451203, 1, 0, 0.4431373, 1,
1.518012, -0.6133865, 2.026049, 1, 0, 0.4392157, 1,
1.523308, -0.9900776, 0.650955, 1, 0, 0.4313726, 1,
1.550161, 1.101599, 1.523799, 1, 0, 0.427451, 1,
1.555925, 1.175112, 2.24301, 1, 0, 0.4196078, 1,
1.561133, -0.180566, 3.499427, 1, 0, 0.4156863, 1,
1.564102, 0.2095304, 1.056268, 1, 0, 0.4078431, 1,
1.573002, 1.095183, 0.3247124, 1, 0, 0.4039216, 1,
1.594356, 0.1505964, -0.7529105, 1, 0, 0.3960784, 1,
1.614143, 0.003784931, 2.005211, 1, 0, 0.3882353, 1,
1.616836, -0.4372464, 2.618732, 1, 0, 0.3843137, 1,
1.61999, -1.598012, 2.624859, 1, 0, 0.3764706, 1,
1.620509, 0.6426779, 0.8758187, 1, 0, 0.372549, 1,
1.626395, -0.8404073, 1.665996, 1, 0, 0.3647059, 1,
1.631386, 0.1084348, 2.14504, 1, 0, 0.3607843, 1,
1.63567, -0.6996959, 2.716888, 1, 0, 0.3529412, 1,
1.638401, 1.24959, 0.1403696, 1, 0, 0.3490196, 1,
1.654612, 0.5907792, 1.081013, 1, 0, 0.3411765, 1,
1.672969, 1.285586, 0.3458707, 1, 0, 0.3372549, 1,
1.678054, 0.06764273, 2.208675, 1, 0, 0.3294118, 1,
1.682562, 0.6605643, 1.52931, 1, 0, 0.3254902, 1,
1.689819, 2.213031, 2.193207, 1, 0, 0.3176471, 1,
1.694378, -1.527028, 2.179019, 1, 0, 0.3137255, 1,
1.694704, 0.1837377, 0.9009951, 1, 0, 0.3058824, 1,
1.699808, -1.912683, 0.9670597, 1, 0, 0.2980392, 1,
1.704302, 0.7003555, 1.101539, 1, 0, 0.2941177, 1,
1.709, -0.8992274, 1.86994, 1, 0, 0.2862745, 1,
1.725222, 0.1910916, 2.724241, 1, 0, 0.282353, 1,
1.734388, 1.310865, 0.8110862, 1, 0, 0.2745098, 1,
1.738665, -1.711996, 1.795244, 1, 0, 0.2705882, 1,
1.745654, 0.03258093, 0.8583293, 1, 0, 0.2627451, 1,
1.748648, 1.959023, -0.03128055, 1, 0, 0.2588235, 1,
1.775496, 1.248503, 0.5479251, 1, 0, 0.2509804, 1,
1.799667, 1.083625, 0.6119203, 1, 0, 0.2470588, 1,
1.807722, 0.462151, 1.638022, 1, 0, 0.2392157, 1,
1.809093, 0.3473916, 2.603246, 1, 0, 0.2352941, 1,
1.849008, 1.45093, 1.504816, 1, 0, 0.227451, 1,
1.850233, -1.395232, 4.363746, 1, 0, 0.2235294, 1,
1.85542, -0.6412337, 1.717902, 1, 0, 0.2156863, 1,
1.861642, 0.8659199, 1.665621, 1, 0, 0.2117647, 1,
1.869022, 0.3342417, 0.7317411, 1, 0, 0.2039216, 1,
1.883554, -2.138989, 1.576132, 1, 0, 0.1960784, 1,
1.892202, 0.4854018, 1.607006, 1, 0, 0.1921569, 1,
1.928793, -0.01747248, 1.031971, 1, 0, 0.1843137, 1,
1.94179, 0.4887987, 0.2247846, 1, 0, 0.1803922, 1,
1.942994, -0.9681458, 1.963263, 1, 0, 0.172549, 1,
1.9724, 0.2089364, 2.291711, 1, 0, 0.1686275, 1,
1.975458, -0.5444857, 2.054054, 1, 0, 0.1607843, 1,
1.976607, -0.1106992, 2.532454, 1, 0, 0.1568628, 1,
1.987058, 0.78004, 0.04508406, 1, 0, 0.1490196, 1,
1.998995, 1.43048, 0.2357253, 1, 0, 0.145098, 1,
2.028905, -0.6204748, 3.286515, 1, 0, 0.1372549, 1,
2.030503, 0.5846869, 1.140557, 1, 0, 0.1333333, 1,
2.043426, 1.507307, -0.4172554, 1, 0, 0.1254902, 1,
2.04366, 1.752405, 0.9140432, 1, 0, 0.1215686, 1,
2.074183, -0.3956504, 2.551095, 1, 0, 0.1137255, 1,
2.122, -0.03800394, 3.313522, 1, 0, 0.1098039, 1,
2.140123, -1.281695, -0.008438991, 1, 0, 0.1019608, 1,
2.14412, 0.8771039, 0.7383266, 1, 0, 0.09411765, 1,
2.177091, 0.2775871, 1.14711, 1, 0, 0.09019608, 1,
2.17862, 0.4710555, 1.646715, 1, 0, 0.08235294, 1,
2.194516, -0.2408463, 1.727749, 1, 0, 0.07843138, 1,
2.242246, -0.8299995, 1.469324, 1, 0, 0.07058824, 1,
2.274993, -1.460943, 1.357337, 1, 0, 0.06666667, 1,
2.304129, 1.47457, 0.5335333, 1, 0, 0.05882353, 1,
2.313501, 0.9142311, 0.2316255, 1, 0, 0.05490196, 1,
2.363813, 1.244789, 1.870187, 1, 0, 0.04705882, 1,
2.368014, -0.9760726, 1.321542, 1, 0, 0.04313726, 1,
2.53768, 2.067468, -0.6646526, 1, 0, 0.03529412, 1,
2.544768, 0.5121677, 0.4436021, 1, 0, 0.03137255, 1,
2.573788, 0.3583756, 2.762668, 1, 0, 0.02352941, 1,
2.698608, -0.6154088, 2.6816, 1, 0, 0.01960784, 1,
2.699877, 0.1125436, 1.906415, 1, 0, 0.01176471, 1,
3.032219, 0.1366407, 2.019216, 1, 0, 0.007843138, 1
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
0.2149915, -4.748681, -8.077823, 0, -0.5, 0.5, 0.5,
0.2149915, -4.748681, -8.077823, 1, -0.5, 0.5, 0.5,
0.2149915, -4.748681, -8.077823, 1, 1.5, 0.5, 0.5,
0.2149915, -4.748681, -8.077823, 0, 1.5, 0.5, 0.5
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
-3.557277, 0.2298796, -8.077823, 0, -0.5, 0.5, 0.5,
-3.557277, 0.2298796, -8.077823, 1, -0.5, 0.5, 0.5,
-3.557277, 0.2298796, -8.077823, 1, 1.5, 0.5, 0.5,
-3.557277, 0.2298796, -8.077823, 0, 1.5, 0.5, 0.5
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
-3.557277, -4.748681, -0.7464771, 0, -0.5, 0.5, 0.5,
-3.557277, -4.748681, -0.7464771, 1, -0.5, 0.5, 0.5,
-3.557277, -4.748681, -0.7464771, 1, 1.5, 0.5, 0.5,
-3.557277, -4.748681, -0.7464771, 0, 1.5, 0.5, 0.5
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
-2, -3.599782, -6.385973,
3, -3.599782, -6.385973,
-2, -3.599782, -6.385973,
-2, -3.791265, -6.667948,
-1, -3.599782, -6.385973,
-1, -3.791265, -6.667948,
0, -3.599782, -6.385973,
0, -3.791265, -6.667948,
1, -3.599782, -6.385973,
1, -3.791265, -6.667948,
2, -3.599782, -6.385973,
2, -3.791265, -6.667948,
3, -3.599782, -6.385973,
3, -3.791265, -6.667948
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
-2, -4.174232, -7.231898, 0, -0.5, 0.5, 0.5,
-2, -4.174232, -7.231898, 1, -0.5, 0.5, 0.5,
-2, -4.174232, -7.231898, 1, 1.5, 0.5, 0.5,
-2, -4.174232, -7.231898, 0, 1.5, 0.5, 0.5,
-1, -4.174232, -7.231898, 0, -0.5, 0.5, 0.5,
-1, -4.174232, -7.231898, 1, -0.5, 0.5, 0.5,
-1, -4.174232, -7.231898, 1, 1.5, 0.5, 0.5,
-1, -4.174232, -7.231898, 0, 1.5, 0.5, 0.5,
0, -4.174232, -7.231898, 0, -0.5, 0.5, 0.5,
0, -4.174232, -7.231898, 1, -0.5, 0.5, 0.5,
0, -4.174232, -7.231898, 1, 1.5, 0.5, 0.5,
0, -4.174232, -7.231898, 0, 1.5, 0.5, 0.5,
1, -4.174232, -7.231898, 0, -0.5, 0.5, 0.5,
1, -4.174232, -7.231898, 1, -0.5, 0.5, 0.5,
1, -4.174232, -7.231898, 1, 1.5, 0.5, 0.5,
1, -4.174232, -7.231898, 0, 1.5, 0.5, 0.5,
2, -4.174232, -7.231898, 0, -0.5, 0.5, 0.5,
2, -4.174232, -7.231898, 1, -0.5, 0.5, 0.5,
2, -4.174232, -7.231898, 1, 1.5, 0.5, 0.5,
2, -4.174232, -7.231898, 0, 1.5, 0.5, 0.5,
3, -4.174232, -7.231898, 0, -0.5, 0.5, 0.5,
3, -4.174232, -7.231898, 1, -0.5, 0.5, 0.5,
3, -4.174232, -7.231898, 1, 1.5, 0.5, 0.5,
3, -4.174232, -7.231898, 0, 1.5, 0.5, 0.5
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
-2.686753, -2, -6.385973,
-2.686753, 2, -6.385973,
-2.686753, -2, -6.385973,
-2.831841, -2, -6.667948,
-2.686753, 0, -6.385973,
-2.831841, 0, -6.667948,
-2.686753, 2, -6.385973,
-2.831841, 2, -6.667948
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
-3.122015, -2, -7.231898, 0, -0.5, 0.5, 0.5,
-3.122015, -2, -7.231898, 1, -0.5, 0.5, 0.5,
-3.122015, -2, -7.231898, 1, 1.5, 0.5, 0.5,
-3.122015, -2, -7.231898, 0, 1.5, 0.5, 0.5,
-3.122015, 0, -7.231898, 0, -0.5, 0.5, 0.5,
-3.122015, 0, -7.231898, 1, -0.5, 0.5, 0.5,
-3.122015, 0, -7.231898, 1, 1.5, 0.5, 0.5,
-3.122015, 0, -7.231898, 0, 1.5, 0.5, 0.5,
-3.122015, 2, -7.231898, 0, -0.5, 0.5, 0.5,
-3.122015, 2, -7.231898, 1, -0.5, 0.5, 0.5,
-3.122015, 2, -7.231898, 1, 1.5, 0.5, 0.5,
-3.122015, 2, -7.231898, 0, 1.5, 0.5, 0.5
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
-2.686753, -3.599782, -6,
-2.686753, -3.599782, 4,
-2.686753, -3.599782, -6,
-2.831841, -3.791265, -6,
-2.686753, -3.599782, -4,
-2.831841, -3.791265, -4,
-2.686753, -3.599782, -2,
-2.831841, -3.791265, -2,
-2.686753, -3.599782, 0,
-2.831841, -3.791265, 0,
-2.686753, -3.599782, 2,
-2.831841, -3.791265, 2,
-2.686753, -3.599782, 4,
-2.831841, -3.791265, 4
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
-3.122015, -4.174232, -6, 0, -0.5, 0.5, 0.5,
-3.122015, -4.174232, -6, 1, -0.5, 0.5, 0.5,
-3.122015, -4.174232, -6, 1, 1.5, 0.5, 0.5,
-3.122015, -4.174232, -6, 0, 1.5, 0.5, 0.5,
-3.122015, -4.174232, -4, 0, -0.5, 0.5, 0.5,
-3.122015, -4.174232, -4, 1, -0.5, 0.5, 0.5,
-3.122015, -4.174232, -4, 1, 1.5, 0.5, 0.5,
-3.122015, -4.174232, -4, 0, 1.5, 0.5, 0.5,
-3.122015, -4.174232, -2, 0, -0.5, 0.5, 0.5,
-3.122015, -4.174232, -2, 1, -0.5, 0.5, 0.5,
-3.122015, -4.174232, -2, 1, 1.5, 0.5, 0.5,
-3.122015, -4.174232, -2, 0, 1.5, 0.5, 0.5,
-3.122015, -4.174232, 0, 0, -0.5, 0.5, 0.5,
-3.122015, -4.174232, 0, 1, -0.5, 0.5, 0.5,
-3.122015, -4.174232, 0, 1, 1.5, 0.5, 0.5,
-3.122015, -4.174232, 0, 0, 1.5, 0.5, 0.5,
-3.122015, -4.174232, 2, 0, -0.5, 0.5, 0.5,
-3.122015, -4.174232, 2, 1, -0.5, 0.5, 0.5,
-3.122015, -4.174232, 2, 1, 1.5, 0.5, 0.5,
-3.122015, -4.174232, 2, 0, 1.5, 0.5, 0.5,
-3.122015, -4.174232, 4, 0, -0.5, 0.5, 0.5,
-3.122015, -4.174232, 4, 1, -0.5, 0.5, 0.5,
-3.122015, -4.174232, 4, 1, 1.5, 0.5, 0.5,
-3.122015, -4.174232, 4, 0, 1.5, 0.5, 0.5
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
-2.686753, -3.599782, -6.385973,
-2.686753, 4.059541, -6.385973,
-2.686753, -3.599782, 4.893019,
-2.686753, 4.059541, 4.893019,
-2.686753, -3.599782, -6.385973,
-2.686753, -3.599782, 4.893019,
-2.686753, 4.059541, -6.385973,
-2.686753, 4.059541, 4.893019,
-2.686753, -3.599782, -6.385973,
3.116736, -3.599782, -6.385973,
-2.686753, -3.599782, 4.893019,
3.116736, -3.599782, 4.893019,
-2.686753, 4.059541, -6.385973,
3.116736, 4.059541, -6.385973,
-2.686753, 4.059541, 4.893019,
3.116736, 4.059541, 4.893019,
3.116736, -3.599782, -6.385973,
3.116736, 4.059541, -6.385973,
3.116736, -3.599782, 4.893019,
3.116736, 4.059541, 4.893019,
3.116736, -3.599782, -6.385973,
3.116736, -3.599782, 4.893019,
3.116736, 4.059541, -6.385973,
3.116736, 4.059541, 4.893019
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
var radius = 7.912313;
var distance = 35.20278;
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
mvMatrix.translate( -0.2149915, -0.2298796, 0.7464771 );
mvMatrix.scale( 1.474104, 1.116933, 0.7584851 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.20278);
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
Dinotefuran<-read.table("Dinotefuran.xyz")
```

```
## Error in read.table("Dinotefuran.xyz"): no lines available in input
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
-2.602237, -0.812846, -1.472654, 0, 0, 1, 1, 1,
-2.60182, 0.7103577, -0.4786302, 1, 0, 0, 1, 1,
-2.568178, -1.325071, -4.42461, 1, 0, 0, 1, 1,
-2.514575, -1.465014, -3.582011, 1, 0, 0, 1, 1,
-2.511511, -1.288525, -1.174681, 1, 0, 0, 1, 1,
-2.449733, -0.5927975, -1.948431, 1, 0, 0, 1, 1,
-2.430849, -1.922332, -0.5535711, 0, 0, 0, 1, 1,
-2.423631, -0.8487667, -2.691684, 0, 0, 0, 1, 1,
-2.372889, -1.828581, -1.32595, 0, 0, 0, 1, 1,
-2.356467, 1.374615, -0.8208668, 0, 0, 0, 1, 1,
-2.338332, 1.856957, -0.7480432, 0, 0, 0, 1, 1,
-2.312629, -1.621311, -2.16183, 0, 0, 0, 1, 1,
-2.295264, 0.6073524, -1.266181, 0, 0, 0, 1, 1,
-2.283403, 1.516131, -0.1340656, 1, 1, 1, 1, 1,
-2.271897, 0.8040434, -2.673359, 1, 1, 1, 1, 1,
-2.271221, 0.3603566, -1.239005, 1, 1, 1, 1, 1,
-2.237948, 0.4696817, -3.522502, 1, 1, 1, 1, 1,
-2.236133, 0.7444263, -1.732966, 1, 1, 1, 1, 1,
-2.18867, -1.111661, -3.656795, 1, 1, 1, 1, 1,
-2.188282, -0.338278, -3.261918, 1, 1, 1, 1, 1,
-2.144822, -1.154246, -1.688902, 1, 1, 1, 1, 1,
-2.138952, -0.002193794, -1.018598, 1, 1, 1, 1, 1,
-2.119279, -0.2407766, 0.1711807, 1, 1, 1, 1, 1,
-2.110463, -0.6558646, -3.190154, 1, 1, 1, 1, 1,
-2.096376, 1.925363, -0.9789447, 1, 1, 1, 1, 1,
-2.077555, 0.8687973, -2.38337, 1, 1, 1, 1, 1,
-2.071001, 0.3965693, -1.613428, 1, 1, 1, 1, 1,
-2.058628, 1.842266, -0.8916436, 1, 1, 1, 1, 1,
-1.992769, 1.179971, -1.031498, 0, 0, 1, 1, 1,
-1.992178, -1.197992, -1.749824, 1, 0, 0, 1, 1,
-1.968076, -0.7311398, -1.525035, 1, 0, 0, 1, 1,
-1.962814, -0.3410709, -1.969511, 1, 0, 0, 1, 1,
-1.959753, -0.05057144, -1.031508, 1, 0, 0, 1, 1,
-1.957418, -0.3433439, -1.627005, 1, 0, 0, 1, 1,
-1.95297, -0.05361825, -0.4654622, 0, 0, 0, 1, 1,
-1.946105, -0.1015524, 0.7667304, 0, 0, 0, 1, 1,
-1.919672, -0.1033398, -1.876741, 0, 0, 0, 1, 1,
-1.90725, -0.2950636, -1.983164, 0, 0, 0, 1, 1,
-1.885269, -0.3457181, -1.72347, 0, 0, 0, 1, 1,
-1.878542, 0.7425779, -0.3274131, 0, 0, 0, 1, 1,
-1.854045, -0.6358696, -1.210227, 0, 0, 0, 1, 1,
-1.825237, -0.005764015, -1.040625, 1, 1, 1, 1, 1,
-1.813868, 0.5345673, 0.2615601, 1, 1, 1, 1, 1,
-1.798147, 2.214766, -0.9297689, 1, 1, 1, 1, 1,
-1.796914, -0.4195689, -0.6450523, 1, 1, 1, 1, 1,
-1.762965, -0.08691757, -1.233104, 1, 1, 1, 1, 1,
-1.743717, -0.1121109, -0.7391035, 1, 1, 1, 1, 1,
-1.735225, -0.2155289, -0.7807582, 1, 1, 1, 1, 1,
-1.722089, -0.6654873, -2.655554, 1, 1, 1, 1, 1,
-1.711495, -0.297072, -1.009397, 1, 1, 1, 1, 1,
-1.695705, -0.4168244, -1.269556, 1, 1, 1, 1, 1,
-1.690198, 0.6270743, -1.675944, 1, 1, 1, 1, 1,
-1.679442, 0.4872968, -2.039271, 1, 1, 1, 1, 1,
-1.630076, 0.8172808, -2.162749, 1, 1, 1, 1, 1,
-1.612538, -0.2962478, -1.822334, 1, 1, 1, 1, 1,
-1.587899, -0.1431182, -2.516228, 1, 1, 1, 1, 1,
-1.586935, -0.6839712, -1.022278, 0, 0, 1, 1, 1,
-1.566541, -0.1312964, -0.9779259, 1, 0, 0, 1, 1,
-1.56545, -0.1263463, -0.3490553, 1, 0, 0, 1, 1,
-1.548325, 0.5390373, -1.769381, 1, 0, 0, 1, 1,
-1.542109, 0.7051083, -0.3767659, 1, 0, 0, 1, 1,
-1.536242, -0.5464844, -5.218505, 1, 0, 0, 1, 1,
-1.525847, 0.4632517, -1.385885, 0, 0, 0, 1, 1,
-1.497962, 0.5290249, 1.221166, 0, 0, 0, 1, 1,
-1.49426, 1.118501, -2.299731, 0, 0, 0, 1, 1,
-1.490824, 0.2584795, -2.125458, 0, 0, 0, 1, 1,
-1.489941, -0.248211, -2.005005, 0, 0, 0, 1, 1,
-1.47987, -0.06952222, -1.71989, 0, 0, 0, 1, 1,
-1.479733, 0.56615, -2.401884, 0, 0, 0, 1, 1,
-1.472755, 1.545906, -2.725869, 1, 1, 1, 1, 1,
-1.469431, -0.2811745, -1.636944, 1, 1, 1, 1, 1,
-1.463248, -0.03123293, -1.737947, 1, 1, 1, 1, 1,
-1.45682, -0.2095051, -2.669451, 1, 1, 1, 1, 1,
-1.447781, 1.663148, -0.9282525, 1, 1, 1, 1, 1,
-1.446129, -0.2353499, -1.574183, 1, 1, 1, 1, 1,
-1.44551, 2.595402, 1.352323, 1, 1, 1, 1, 1,
-1.436579, -1.370967, -1.394646, 1, 1, 1, 1, 1,
-1.434147, 0.8973895, 0.4303216, 1, 1, 1, 1, 1,
-1.434016, 0.6337223, -0.5846878, 1, 1, 1, 1, 1,
-1.415581, -1.271583, -2.218426, 1, 1, 1, 1, 1,
-1.412408, -0.208883, -2.393959, 1, 1, 1, 1, 1,
-1.401506, 0.5805382, -1.275725, 1, 1, 1, 1, 1,
-1.395636, -0.5282515, -3.126482, 1, 1, 1, 1, 1,
-1.395394, -0.9805564, -0.3840432, 1, 1, 1, 1, 1,
-1.390674, 1.4524, -1.065539, 0, 0, 1, 1, 1,
-1.37683, 0.3416796, -1.706449, 1, 0, 0, 1, 1,
-1.376565, -1.819059, -4.702937, 1, 0, 0, 1, 1,
-1.367633, 2.025125, 1.280867, 1, 0, 0, 1, 1,
-1.356324, -1.110645, -0.786612, 1, 0, 0, 1, 1,
-1.338805, -0.2730139, -0.9656004, 1, 0, 0, 1, 1,
-1.338694, -0.6786872, -2.805053, 0, 0, 0, 1, 1,
-1.338685, 0.1533539, -0.5482652, 0, 0, 0, 1, 1,
-1.335988, 1.127701, 0.7805976, 0, 0, 0, 1, 1,
-1.32992, 1.475513, -0.003707258, 0, 0, 0, 1, 1,
-1.315669, -1.699856, -3.4006, 0, 0, 0, 1, 1,
-1.307067, 2.097323, -1.46438, 0, 0, 0, 1, 1,
-1.302467, -0.5788491, -2.985703, 0, 0, 0, 1, 1,
-1.292813, 0.5096813, -0.8314273, 1, 1, 1, 1, 1,
-1.283782, -0.8629579, -1.242134, 1, 1, 1, 1, 1,
-1.279947, -0.4532537, -3.098027, 1, 1, 1, 1, 1,
-1.27626, -0.6967274, -1.374793, 1, 1, 1, 1, 1,
-1.267353, 0.2963577, -1.198313, 1, 1, 1, 1, 1,
-1.254568, -0.9591196, -1.405982, 1, 1, 1, 1, 1,
-1.247329, 1.346256, -0.1280166, 1, 1, 1, 1, 1,
-1.245433, -1.572842, -2.609398, 1, 1, 1, 1, 1,
-1.231937, -0.7802547, -2.231918, 1, 1, 1, 1, 1,
-1.227052, -0.7316399, -1.541778, 1, 1, 1, 1, 1,
-1.22153, -1.229828, -1.59195, 1, 1, 1, 1, 1,
-1.207966, 0.8864341, -1.243369, 1, 1, 1, 1, 1,
-1.194701, -1.023254, -3.224615, 1, 1, 1, 1, 1,
-1.193666, 0.3444005, -3.342186, 1, 1, 1, 1, 1,
-1.192795, -1.180756, -2.957099, 1, 1, 1, 1, 1,
-1.177425, -0.8967595, -2.194218, 0, 0, 1, 1, 1,
-1.167856, -1.472103, -4.371204, 1, 0, 0, 1, 1,
-1.167641, 0.7993842, -1.227143, 1, 0, 0, 1, 1,
-1.16727, 0.741676, -0.870981, 1, 0, 0, 1, 1,
-1.155959, 2.037761, -0.839474, 1, 0, 0, 1, 1,
-1.155318, -3.488239, -3.590946, 1, 0, 0, 1, 1,
-1.14947, 0.2652166, 0.8284877, 0, 0, 0, 1, 1,
-1.143752, 0.4845043, -1.871099, 0, 0, 0, 1, 1,
-1.1407, -1.227677, -2.804486, 0, 0, 0, 1, 1,
-1.139169, 0.09992819, -2.868061, 0, 0, 0, 1, 1,
-1.135744, -0.07080245, -1.187217, 0, 0, 0, 1, 1,
-1.13453, 0.3845138, 0.04602139, 0, 0, 0, 1, 1,
-1.123272, 1.622169, -0.757601, 0, 0, 0, 1, 1,
-1.118818, 1.21834, -1.586031, 1, 1, 1, 1, 1,
-1.116704, 0.4623355, -1.991076, 1, 1, 1, 1, 1,
-1.110684, -0.4651344, -1.115215, 1, 1, 1, 1, 1,
-1.109657, 0.2052123, -2.046596, 1, 1, 1, 1, 1,
-1.105133, 0.2463307, -3.060376, 1, 1, 1, 1, 1,
-1.09915, 0.7856718, 0.908884, 1, 1, 1, 1, 1,
-1.080233, 0.3130679, -1.900959, 1, 1, 1, 1, 1,
-1.077569, -0.4236287, -1.382728, 1, 1, 1, 1, 1,
-1.063286, -0.2907048, -2.236991, 1, 1, 1, 1, 1,
-1.060156, 0.4424506, 0.8498276, 1, 1, 1, 1, 1,
-1.054465, -0.5996164, -1.251674, 1, 1, 1, 1, 1,
-1.051947, -1.564214, -1.419839, 1, 1, 1, 1, 1,
-1.048156, 2.083316, -0.1496957, 1, 1, 1, 1, 1,
-1.043894, -0.4294817, -1.22909, 1, 1, 1, 1, 1,
-1.043303, -0.2269835, -1.095953, 1, 1, 1, 1, 1,
-1.042275, 1.188946, -0.9369022, 0, 0, 1, 1, 1,
-1.0391, -0.8069377, -2.42178, 1, 0, 0, 1, 1,
-1.036015, 0.2597916, -0.9771277, 1, 0, 0, 1, 1,
-1.034353, -1.632812, -0.4444836, 1, 0, 0, 1, 1,
-1.030442, 1.08312, 0.1915918, 1, 0, 0, 1, 1,
-1.028941, -0.156359, -2.67178, 1, 0, 0, 1, 1,
-1.025949, -1.420259, -2.369907, 0, 0, 0, 1, 1,
-1.020458, 0.07907782, -1.329295, 0, 0, 0, 1, 1,
-1.018085, -0.0634131, -2.589781, 0, 0, 0, 1, 1,
-1.017893, -0.6966769, -2.404853, 0, 0, 0, 1, 1,
-1.012295, -0.1244518, -1.085496, 0, 0, 0, 1, 1,
-1.010474, 0.4352945, -0.8138965, 0, 0, 0, 1, 1,
-1.006082, -0.7921489, -4.790212, 0, 0, 0, 1, 1,
-1.002653, 0.6342233, -1.881317, 1, 1, 1, 1, 1,
-0.9992256, -0.02229923, -1.572486, 1, 1, 1, 1, 1,
-0.9958688, -2.116499, -4.003241, 1, 1, 1, 1, 1,
-0.9735598, 0.2132078, -2.237982, 1, 1, 1, 1, 1,
-0.9581602, -1.014123, -1.818644, 1, 1, 1, 1, 1,
-0.9471539, -1.768125, -0.9938425, 1, 1, 1, 1, 1,
-0.9326651, 1.296282, -0.2282122, 1, 1, 1, 1, 1,
-0.9317983, 0.8774346, -0.7608246, 1, 1, 1, 1, 1,
-0.9305195, 0.6733355, -1.790863, 1, 1, 1, 1, 1,
-0.9284545, -1.145049, -3.650277, 1, 1, 1, 1, 1,
-0.9234917, -0.4156415, -1.371821, 1, 1, 1, 1, 1,
-0.9184482, 0.01528838, -1.820952, 1, 1, 1, 1, 1,
-0.9125447, -0.221633, -1.910326, 1, 1, 1, 1, 1,
-0.9124106, -0.357035, -1.868445, 1, 1, 1, 1, 1,
-0.910215, -1.40341, -1.394124, 1, 1, 1, 1, 1,
-0.9099803, 0.2791913, -1.188139, 0, 0, 1, 1, 1,
-0.9016206, -0.9409819, -2.229863, 1, 0, 0, 1, 1,
-0.8909818, -0.2233137, -1.442119, 1, 0, 0, 1, 1,
-0.8891084, -1.494313, -2.372437, 1, 0, 0, 1, 1,
-0.8844344, -1.186293, -1.718291, 1, 0, 0, 1, 1,
-0.8802586, 1.030426, -0.2243354, 1, 0, 0, 1, 1,
-0.8777516, -0.7696828, -1.019129, 0, 0, 0, 1, 1,
-0.8706938, 0.9669486, -1.284716, 0, 0, 0, 1, 1,
-0.8620232, 0.6001027, -1.097503, 0, 0, 0, 1, 1,
-0.8591013, -1.115171, -2.250708, 0, 0, 0, 1, 1,
-0.8546156, 1.138195, -1.438543, 0, 0, 0, 1, 1,
-0.8507184, -0.6510808, -2.354569, 0, 0, 0, 1, 1,
-0.8479111, -0.04193548, -2.002291, 0, 0, 0, 1, 1,
-0.8477906, 1.330357, -2.721439, 1, 1, 1, 1, 1,
-0.8428474, -0.1116465, -0.9823025, 1, 1, 1, 1, 1,
-0.8424398, 0.3559833, -0.790139, 1, 1, 1, 1, 1,
-0.8383815, -0.5276659, -3.010654, 1, 1, 1, 1, 1,
-0.8356704, -1.013573, -2.672121, 1, 1, 1, 1, 1,
-0.8346202, -0.06805827, -1.689181, 1, 1, 1, 1, 1,
-0.8285854, 0.2215378, -1.377165, 1, 1, 1, 1, 1,
-0.8277789, -0.902528, -2.346944, 1, 1, 1, 1, 1,
-0.8273188, 0.5553709, -1.458683, 1, 1, 1, 1, 1,
-0.8262175, 0.4306087, -1.921002, 1, 1, 1, 1, 1,
-0.8247274, -1.259566, -2.445944, 1, 1, 1, 1, 1,
-0.8245245, 0.8824696, -1.23512, 1, 1, 1, 1, 1,
-0.8213769, 0.2752658, -1.351441, 1, 1, 1, 1, 1,
-0.8193449, -0.6294761, -1.786634, 1, 1, 1, 1, 1,
-0.8191522, 1.220308, 0.3444487, 1, 1, 1, 1, 1,
-0.8189512, 0.07928533, -1.158813, 0, 0, 1, 1, 1,
-0.8187165, 0.08802999, 0.05938046, 1, 0, 0, 1, 1,
-0.8187101, -0.03366437, -0.5317524, 1, 0, 0, 1, 1,
-0.8161678, -0.34917, -2.769672, 1, 0, 0, 1, 1,
-0.8158745, -1.28296, -2.930091, 1, 0, 0, 1, 1,
-0.8141708, -0.9276232, -4.117653, 1, 0, 0, 1, 1,
-0.8048705, -2.82684, -3.471422, 0, 0, 0, 1, 1,
-0.8001525, -0.669004, -2.828083, 0, 0, 0, 1, 1,
-0.7983118, 0.6703917, -0.5301247, 0, 0, 0, 1, 1,
-0.7928478, -1.503392, -2.379909, 0, 0, 0, 1, 1,
-0.7897866, 0.8460824, -1.439995, 0, 0, 0, 1, 1,
-0.7896526, 1.336764, 0.4390686, 0, 0, 0, 1, 1,
-0.7842546, -0.62288, -1.490743, 0, 0, 0, 1, 1,
-0.78367, 1.337799, -1.267584, 1, 1, 1, 1, 1,
-0.7833608, -0.9248238, -2.763984, 1, 1, 1, 1, 1,
-0.7827581, -0.9203377, -1.968586, 1, 1, 1, 1, 1,
-0.7798998, 0.9616273, -1.656152, 1, 1, 1, 1, 1,
-0.7795516, -1.286502, -2.744936, 1, 1, 1, 1, 1,
-0.7779272, 0.231454, -1.854696, 1, 1, 1, 1, 1,
-0.76766, -1.038883, -3.995458, 1, 1, 1, 1, 1,
-0.7633686, 0.5080051, -1.716393, 1, 1, 1, 1, 1,
-0.7626619, 2.132197, -0.9983017, 1, 1, 1, 1, 1,
-0.7605737, -0.1964226, -2.085504, 1, 1, 1, 1, 1,
-0.7588797, 0.7704579, -0.7850202, 1, 1, 1, 1, 1,
-0.758841, -0.4369036, -1.740964, 1, 1, 1, 1, 1,
-0.7570021, -2.451593, -2.398667, 1, 1, 1, 1, 1,
-0.7553027, -1.500596, -4.261656, 1, 1, 1, 1, 1,
-0.7552324, -0.6513893, -4.361516, 1, 1, 1, 1, 1,
-0.7527951, 1.370721, -1.846382, 0, 0, 1, 1, 1,
-0.7525506, 1.013299, 1.469473, 1, 0, 0, 1, 1,
-0.7437322, 1.052595, -0.7817386, 1, 0, 0, 1, 1,
-0.740017, 0.03827835, -2.983948, 1, 0, 0, 1, 1,
-0.739166, -0.7816235, -3.657715, 1, 0, 0, 1, 1,
-0.7380422, -1.040323, -2.455976, 1, 0, 0, 1, 1,
-0.7368016, -0.4302221, -2.481502, 0, 0, 0, 1, 1,
-0.736213, -0.2113046, -3.11867, 0, 0, 0, 1, 1,
-0.7321824, 0.243246, -1.627333, 0, 0, 0, 1, 1,
-0.7195855, 1.004922, 0.5378149, 0, 0, 0, 1, 1,
-0.7004187, 1.742619, 1.329251, 0, 0, 0, 1, 1,
-0.692991, 1.540555, -1.619696, 0, 0, 0, 1, 1,
-0.6922106, 0.2489484, -1.082717, 0, 0, 0, 1, 1,
-0.6872128, 1.740324, -1.260471, 1, 1, 1, 1, 1,
-0.6836812, -0.8734561, -1.281921, 1, 1, 1, 1, 1,
-0.6721857, -0.8462042, -1.037935, 1, 1, 1, 1, 1,
-0.6659131, -0.5713136, -2.175769, 1, 1, 1, 1, 1,
-0.6653996, 0.3316596, -0.7379941, 1, 1, 1, 1, 1,
-0.664925, -2.157422, -3.848986, 1, 1, 1, 1, 1,
-0.66332, -0.6060793, -2.871288, 1, 1, 1, 1, 1,
-0.6617616, -1.554847, -4.107684, 1, 1, 1, 1, 1,
-0.6606446, -0.4124856, -1.862473, 1, 1, 1, 1, 1,
-0.6605439, -0.256356, -2.451461, 1, 1, 1, 1, 1,
-0.6538585, 0.04914481, -0.8363969, 1, 1, 1, 1, 1,
-0.6518693, 2.117293, -0.05982623, 1, 1, 1, 1, 1,
-0.6509562, 0.3244408, -0.9529988, 1, 1, 1, 1, 1,
-0.6509514, 0.1475693, 0.5878981, 1, 1, 1, 1, 1,
-0.6503386, -1.662337, -6.221716, 1, 1, 1, 1, 1,
-0.6496968, 0.5922486, -3.353551, 0, 0, 1, 1, 1,
-0.6489897, 0.1171943, -0.3027369, 1, 0, 0, 1, 1,
-0.6458266, -1.567202, -3.081655, 1, 0, 0, 1, 1,
-0.6450053, -0.3512749, -2.115176, 1, 0, 0, 1, 1,
-0.6438863, 0.4507834, -1.027667, 1, 0, 0, 1, 1,
-0.6435603, -0.6168775, -2.437155, 1, 0, 0, 1, 1,
-0.6433191, 1.142149, -1.558306, 0, 0, 0, 1, 1,
-0.6432129, 1.764175, -2.917907, 0, 0, 0, 1, 1,
-0.6272956, 0.09544576, -1.895147, 0, 0, 0, 1, 1,
-0.6256692, -0.1285504, -2.428561, 0, 0, 0, 1, 1,
-0.624177, -0.5503535, -1.522333, 0, 0, 0, 1, 1,
-0.6203895, -0.6764697, -2.524581, 0, 0, 0, 1, 1,
-0.6203408, 0.2752078, -1.783922, 0, 0, 0, 1, 1,
-0.618798, -1.975972, -2.51445, 1, 1, 1, 1, 1,
-0.618335, -1.446376, -5.563078, 1, 1, 1, 1, 1,
-0.6171296, 0.8041534, -1.033191, 1, 1, 1, 1, 1,
-0.6159127, 0.6014543, -0.1451392, 1, 1, 1, 1, 1,
-0.6056041, 1.120123, 0.2808424, 1, 1, 1, 1, 1,
-0.6029449, 1.354105, 0.2105391, 1, 1, 1, 1, 1,
-0.6015767, 2.357424, -2.50095, 1, 1, 1, 1, 1,
-0.5999482, -1.55039, -2.809131, 1, 1, 1, 1, 1,
-0.597611, -0.7938223, -3.609408, 1, 1, 1, 1, 1,
-0.5960945, 0.5275754, -0.7074701, 1, 1, 1, 1, 1,
-0.5957405, 0.02819038, -1.811613, 1, 1, 1, 1, 1,
-0.5882499, 2.584858, 0.8084016, 1, 1, 1, 1, 1,
-0.5877339, -0.5805355, -3.228016, 1, 1, 1, 1, 1,
-0.5870295, -0.2637922, -2.701409, 1, 1, 1, 1, 1,
-0.5768315, -0.7742214, -2.279896, 1, 1, 1, 1, 1,
-0.5765506, -1.408949, -3.426167, 0, 0, 1, 1, 1,
-0.5742576, 0.1111037, 0.2734, 1, 0, 0, 1, 1,
-0.5739346, -1.465079, -1.727054, 1, 0, 0, 1, 1,
-0.5714586, 1.613933, -0.6280932, 1, 0, 0, 1, 1,
-0.5712959, -0.8354473, -3.505011, 1, 0, 0, 1, 1,
-0.5712222, -0.2134277, -2.431055, 1, 0, 0, 1, 1,
-0.5681366, 0.7586748, 0.6786605, 0, 0, 0, 1, 1,
-0.567902, 1.438823, -0.3406955, 0, 0, 0, 1, 1,
-0.5605764, -0.05149936, -0.9619034, 0, 0, 0, 1, 1,
-0.5589513, 0.1640725, -0.2841901, 0, 0, 0, 1, 1,
-0.5546094, -0.7806319, -2.774273, 0, 0, 0, 1, 1,
-0.5522828, -1.495208, -2.025563, 0, 0, 0, 1, 1,
-0.5512889, 0.760024, -0.6107702, 0, 0, 0, 1, 1,
-0.5509168, -0.4668308, -2.780153, 1, 1, 1, 1, 1,
-0.5502081, 0.07558562, -1.407766, 1, 1, 1, 1, 1,
-0.5497735, -0.05578913, -1.901016, 1, 1, 1, 1, 1,
-0.544781, -0.5966742, -2.671662, 1, 1, 1, 1, 1,
-0.5423471, -2.073319, -2.537054, 1, 1, 1, 1, 1,
-0.5416104, 0.3698674, -1.853094, 1, 1, 1, 1, 1,
-0.5334214, -0.4884996, -1.641402, 1, 1, 1, 1, 1,
-0.5326262, -1.353482, -2.358859, 1, 1, 1, 1, 1,
-0.5186529, 0.000430509, -2.114757, 1, 1, 1, 1, 1,
-0.5121289, 0.3929964, -0.2211025, 1, 1, 1, 1, 1,
-0.5097106, 0.4829718, 0.7323765, 1, 1, 1, 1, 1,
-0.5079197, -1.579492, -2.336859, 1, 1, 1, 1, 1,
-0.5078698, 1.14135, 0.2553156, 1, 1, 1, 1, 1,
-0.5066324, 2.007878, -1.458709, 1, 1, 1, 1, 1,
-0.5061664, -1.68432, -2.681034, 1, 1, 1, 1, 1,
-0.5051559, 1.324996, -0.7240903, 0, 0, 1, 1, 1,
-0.4989828, 0.3168959, -2.308106, 1, 0, 0, 1, 1,
-0.4983741, -0.6997981, -1.560007, 1, 0, 0, 1, 1,
-0.4978473, -0.6098874, -1.842874, 1, 0, 0, 1, 1,
-0.4950763, -0.9323962, -3.139406, 1, 0, 0, 1, 1,
-0.4920998, 0.2104266, -2.987893, 1, 0, 0, 1, 1,
-0.4920374, 0.7325393, 0.6288443, 0, 0, 0, 1, 1,
-0.491669, 0.8920308, -0.4276704, 0, 0, 0, 1, 1,
-0.4914635, 0.8106645, -2.087376, 0, 0, 0, 1, 1,
-0.4853935, -0.3377649, -2.57955, 0, 0, 0, 1, 1,
-0.4846769, 0.9070007, 0.8924731, 0, 0, 0, 1, 1,
-0.4785778, 0.1246293, -1.712416, 0, 0, 0, 1, 1,
-0.4752129, -0.1426246, -2.829862, 0, 0, 0, 1, 1,
-0.4741772, -0.6553499, -2.022431, 1, 1, 1, 1, 1,
-0.473043, -0.6423106, -2.512492, 1, 1, 1, 1, 1,
-0.4724566, -0.3014724, -0.1448861, 1, 1, 1, 1, 1,
-0.467691, -0.6752926, -0.06000874, 1, 1, 1, 1, 1,
-0.4665878, -0.4253953, -3.813128, 1, 1, 1, 1, 1,
-0.4545622, -0.2970093, 0.005138887, 1, 1, 1, 1, 1,
-0.4534052, -0.6368687, -2.615688, 1, 1, 1, 1, 1,
-0.4513913, -0.08929134, -0.6344065, 1, 1, 1, 1, 1,
-0.44958, -0.1850805, -2.466403, 1, 1, 1, 1, 1,
-0.4441728, 0.4081966, -2.80307, 1, 1, 1, 1, 1,
-0.4441622, -1.307216, -2.076571, 1, 1, 1, 1, 1,
-0.4406401, -0.1255072, -2.895882, 1, 1, 1, 1, 1,
-0.439918, 1.119131, 0.243944, 1, 1, 1, 1, 1,
-0.4340815, 0.3225076, -1.93905, 1, 1, 1, 1, 1,
-0.4309737, 1.35576, -0.5369297, 1, 1, 1, 1, 1,
-0.4291791, 0.8309088, -0.8815093, 0, 0, 1, 1, 1,
-0.4251658, -1.352319, -3.286094, 1, 0, 0, 1, 1,
-0.4216054, -1.12265, -3.771004, 1, 0, 0, 1, 1,
-0.4176395, -0.01537914, 0.7364295, 1, 0, 0, 1, 1,
-0.4139035, 1.089013, 0.3901154, 1, 0, 0, 1, 1,
-0.4095603, 1.650945, -1.070864, 1, 0, 0, 1, 1,
-0.4074851, -0.2048906, -2.396513, 0, 0, 0, 1, 1,
-0.4031641, 0.1726646, 0.1655722, 0, 0, 0, 1, 1,
-0.4026413, -0.6381477, -0.5210682, 0, 0, 0, 1, 1,
-0.4018371, 0.3036063, -1.694345, 0, 0, 0, 1, 1,
-0.395993, -1.485056, -1.080734, 0, 0, 0, 1, 1,
-0.3923659, -1.17985, -3.965825, 0, 0, 0, 1, 1,
-0.3912527, 1.761466, -0.8298917, 0, 0, 0, 1, 1,
-0.3911804, -0.1008281, -2.090037, 1, 1, 1, 1, 1,
-0.3893096, -0.1383041, -1.417841, 1, 1, 1, 1, 1,
-0.3844168, 0.7047529, -0.7875433, 1, 1, 1, 1, 1,
-0.3842473, 0.177876, -1.820261, 1, 1, 1, 1, 1,
-0.3833942, -0.08688304, -1.683172, 1, 1, 1, 1, 1,
-0.3805889, 0.8633205, -0.02318281, 1, 1, 1, 1, 1,
-0.3778427, -0.9717299, -2.714009, 1, 1, 1, 1, 1,
-0.3735846, 0.09651071, -1.807288, 1, 1, 1, 1, 1,
-0.3734563, -0.97811, -2.502504, 1, 1, 1, 1, 1,
-0.3651734, 1.232897, 0.2852108, 1, 1, 1, 1, 1,
-0.3619504, 0.1073353, -1.264379, 1, 1, 1, 1, 1,
-0.3552039, 0.07927284, -0.4388946, 1, 1, 1, 1, 1,
-0.3538148, 0.5867853, -0.6397483, 1, 1, 1, 1, 1,
-0.3501838, -1.16096, -3.971341, 1, 1, 1, 1, 1,
-0.3471825, -0.9628244, -3.017286, 1, 1, 1, 1, 1,
-0.3461794, -0.8416751, -4.827896, 0, 0, 1, 1, 1,
-0.3406761, 1.095449, 0.4731147, 1, 0, 0, 1, 1,
-0.3400388, -0.5005996, -4.059025, 1, 0, 0, 1, 1,
-0.3383524, 0.3036346, -0.187998, 1, 0, 0, 1, 1,
-0.3378204, -1.717929, -3.858416, 1, 0, 0, 1, 1,
-0.336308, -0.5336312, -1.066023, 1, 0, 0, 1, 1,
-0.3351013, 0.6105394, -0.3004507, 0, 0, 0, 1, 1,
-0.3302373, 0.6573991, -2.55614, 0, 0, 0, 1, 1,
-0.3272862, 0.1519426, -1.169144, 0, 0, 0, 1, 1,
-0.3247485, -0.6321785, -1.590559, 0, 0, 0, 1, 1,
-0.3222415, 1.02024, -1.69156, 0, 0, 0, 1, 1,
-0.3196568, 0.2442671, 0.5787739, 0, 0, 0, 1, 1,
-0.3191891, -0.918009, -1.841282, 0, 0, 0, 1, 1,
-0.3164726, -0.2023886, -1.351319, 1, 1, 1, 1, 1,
-0.315236, 0.07811345, -2.634929, 1, 1, 1, 1, 1,
-0.3106175, 0.3486737, -0.9714021, 1, 1, 1, 1, 1,
-0.3103415, -0.5989365, -0.9952583, 1, 1, 1, 1, 1,
-0.3086496, -2.108942, -1.401055, 1, 1, 1, 1, 1,
-0.2976037, 3.770695, -1.653127, 1, 1, 1, 1, 1,
-0.2937002, 0.6430133, -0.7908035, 1, 1, 1, 1, 1,
-0.2934421, 0.7219847, 0.4165289, 1, 1, 1, 1, 1,
-0.2920991, -1.584092, -4.12308, 1, 1, 1, 1, 1,
-0.2856668, -1.401808, -0.7905611, 1, 1, 1, 1, 1,
-0.2826306, -0.0134745, -2.88747, 1, 1, 1, 1, 1,
-0.2823362, -0.2082458, -1.634281, 1, 1, 1, 1, 1,
-0.2795053, 1.174662, -0.4627944, 1, 1, 1, 1, 1,
-0.2771344, 1.575119, -1.980638, 1, 1, 1, 1, 1,
-0.2754389, -1.078481, -1.891653, 1, 1, 1, 1, 1,
-0.2722299, -0.7120138, -2.864166, 0, 0, 1, 1, 1,
-0.2721295, -1.374814, -2.130487, 1, 0, 0, 1, 1,
-0.2686535, -1.651066, -2.11732, 1, 0, 0, 1, 1,
-0.2679323, 0.6281792, 0.8426041, 1, 0, 0, 1, 1,
-0.2661847, -0.7366874, -2.148619, 1, 0, 0, 1, 1,
-0.2654944, 0.1953248, -0.6680822, 1, 0, 0, 1, 1,
-0.2640363, 0.7757956, -0.1506098, 0, 0, 0, 1, 1,
-0.2632965, -1.536954, -4.818695, 0, 0, 0, 1, 1,
-0.2623376, -0.3222545, -2.818961, 0, 0, 0, 1, 1,
-0.2610137, 0.8442777, -0.7391504, 0, 0, 0, 1, 1,
-0.2607758, -0.5300647, -2.459433, 0, 0, 0, 1, 1,
-0.2521318, 0.5277404, -0.5361592, 0, 0, 0, 1, 1,
-0.2480305, 0.4037275, 0.8798969, 0, 0, 0, 1, 1,
-0.2451961, -0.4790903, -3.621163, 1, 1, 1, 1, 1,
-0.2437679, 1.692594, -0.3617054, 1, 1, 1, 1, 1,
-0.2397428, -1.08132, -2.974935, 1, 1, 1, 1, 1,
-0.2376875, -0.3607301, -1.975026, 1, 1, 1, 1, 1,
-0.2353326, 0.3585535, 0.5376426, 1, 1, 1, 1, 1,
-0.2322552, -1.864699, -2.490016, 1, 1, 1, 1, 1,
-0.227447, 0.7417635, 0.9276793, 1, 1, 1, 1, 1,
-0.2221101, 0.03543561, -1.398162, 1, 1, 1, 1, 1,
-0.2209953, -0.152731, -2.316932, 1, 1, 1, 1, 1,
-0.2195935, 0.5391864, 0.7128323, 1, 1, 1, 1, 1,
-0.2190799, 0.1690391, -1.416003, 1, 1, 1, 1, 1,
-0.2170187, -1.962524, -3.288265, 1, 1, 1, 1, 1,
-0.2156276, -0.9383371, -3.745967, 1, 1, 1, 1, 1,
-0.2125299, 0.5599813, 1.524773, 1, 1, 1, 1, 1,
-0.2117215, 0.7605478, -0.9238249, 1, 1, 1, 1, 1,
-0.2114629, -0.2248289, -2.603613, 0, 0, 1, 1, 1,
-0.2086343, 1.447035, -0.314199, 1, 0, 0, 1, 1,
-0.2081563, 3.175124, 0.5613215, 1, 0, 0, 1, 1,
-0.2003365, -1.244982, -1.419238, 1, 0, 0, 1, 1,
-0.1990418, -1.060378, -2.40201, 1, 0, 0, 1, 1,
-0.1957681, 0.1981757, -2.179762, 1, 0, 0, 1, 1,
-0.1955519, 1.310921, 0.9275612, 0, 0, 0, 1, 1,
-0.1926243, -0.2467459, -2.021692, 0, 0, 0, 1, 1,
-0.1894686, -0.05778709, -1.513812, 0, 0, 0, 1, 1,
-0.1870929, 1.078119, 0.548214, 0, 0, 0, 1, 1,
-0.1870485, -0.1375397, -0.8137109, 0, 0, 0, 1, 1,
-0.1864505, 0.7002311, 0.5293074, 0, 0, 0, 1, 1,
-0.186416, -0.6302356, -1.899273, 0, 0, 0, 1, 1,
-0.183047, -0.1252464, -1.889255, 1, 1, 1, 1, 1,
-0.1825008, 0.8210308, -0.2499076, 1, 1, 1, 1, 1,
-0.1787228, -0.7780681, -0.372542, 1, 1, 1, 1, 1,
-0.1763178, -0.7029884, -2.330575, 1, 1, 1, 1, 1,
-0.1754239, -1.097992, -2.226908, 1, 1, 1, 1, 1,
-0.1686335, 0.5978352, -0.311684, 1, 1, 1, 1, 1,
-0.166097, -0.3381286, -2.425078, 1, 1, 1, 1, 1,
-0.1641345, -1.444876, -4.048336, 1, 1, 1, 1, 1,
-0.1619318, 0.6732106, 0.4945562, 1, 1, 1, 1, 1,
-0.1612778, -0.3777948, -3.271857, 1, 1, 1, 1, 1,
-0.1604656, -1.714935, -5.095432, 1, 1, 1, 1, 1,
-0.1584613, -0.784826, -3.183001, 1, 1, 1, 1, 1,
-0.1513168, 0.232025, -0.326539, 1, 1, 1, 1, 1,
-0.1448646, -0.04424407, -2.535135, 1, 1, 1, 1, 1,
-0.1369774, -0.6201411, -4.072526, 1, 1, 1, 1, 1,
-0.1320267, -1.599632, -3.968318, 0, 0, 1, 1, 1,
-0.1316886, -0.3560601, -2.575779, 1, 0, 0, 1, 1,
-0.1315621, -0.6028736, -4.237971, 1, 0, 0, 1, 1,
-0.1262901, -0.9884988, -3.589293, 1, 0, 0, 1, 1,
-0.114669, -0.5368184, -1.689439, 1, 0, 0, 1, 1,
-0.1130052, -0.2699662, -1.308936, 1, 0, 0, 1, 1,
-0.1109647, 3.287193, -0.6887572, 0, 0, 0, 1, 1,
-0.1078235, -0.01533519, -0.8520052, 0, 0, 0, 1, 1,
-0.1071689, 0.2826451, -1.586531, 0, 0, 0, 1, 1,
-0.1043222, -0.2110022, -4.050025, 0, 0, 0, 1, 1,
-0.1039347, 0.1615452, 0.9178925, 0, 0, 0, 1, 1,
-0.103649, -0.3142188, -4.516198, 0, 0, 0, 1, 1,
-0.1005333, -0.9111129, -4.418578, 0, 0, 0, 1, 1,
-0.09840283, -0.0719045, -2.383009, 1, 1, 1, 1, 1,
-0.09751549, 0.6830547, -0.04283262, 1, 1, 1, 1, 1,
-0.09715084, 0.06815797, -1.066211, 1, 1, 1, 1, 1,
-0.09343773, 0.8287157, 2.199935, 1, 1, 1, 1, 1,
-0.09126215, -1.376374, -1.287365, 1, 1, 1, 1, 1,
-0.09081069, 0.009831754, -1.540016, 1, 1, 1, 1, 1,
-0.08382237, -0.439218, -2.326133, 1, 1, 1, 1, 1,
-0.08377451, 0.3991695, 1.046587, 1, 1, 1, 1, 1,
-0.08360776, -0.9536346, -1.477465, 1, 1, 1, 1, 1,
-0.08356857, 0.8167448, 1.426747, 1, 1, 1, 1, 1,
-0.0823457, -0.4614767, -1.58822, 1, 1, 1, 1, 1,
-0.08162683, -0.3936689, -3.255073, 1, 1, 1, 1, 1,
-0.07883411, -0.1487536, -4.256444, 1, 1, 1, 1, 1,
-0.07623671, -1.24498, -3.192311, 1, 1, 1, 1, 1,
-0.07349622, -0.2780319, -4.058241, 1, 1, 1, 1, 1,
-0.07334883, -0.2769425, -5.251529, 0, 0, 1, 1, 1,
-0.05996757, -1.058217, -0.126251, 1, 0, 0, 1, 1,
-0.05099377, -1.646296, -1.900616, 1, 0, 0, 1, 1,
-0.04384183, 0.2613547, -0.7576483, 1, 0, 0, 1, 1,
-0.04232594, 0.5866846, 0.8660802, 1, 0, 0, 1, 1,
-0.03992305, -0.8894351, -4.198545, 1, 0, 0, 1, 1,
-0.03791143, 0.7987163, 0.6956918, 0, 0, 0, 1, 1,
-0.02690601, 0.9558581, -0.2773093, 0, 0, 0, 1, 1,
-0.02660473, -1.086131, -5.658083, 0, 0, 0, 1, 1,
-0.02555781, -0.626424, -3.035629, 0, 0, 0, 1, 1,
-0.02471121, -0.6664698, -4.749825, 0, 0, 0, 1, 1,
-0.02089755, 0.3999222, -2.081172, 0, 0, 0, 1, 1,
-0.01116884, 0.02261496, -2.210814, 0, 0, 0, 1, 1,
-0.004212628, -1.221651, -2.020377, 1, 1, 1, 1, 1,
-0.003031515, -0.05832367, -3.712639, 1, 1, 1, 1, 1,
-0.002783187, 0.3896824, 0.1476327, 1, 1, 1, 1, 1,
-0.002377057, 0.3873676, 0.3695452, 1, 1, 1, 1, 1,
-0.001919873, -0.9384636, -2.499543, 1, 1, 1, 1, 1,
0.001268813, -0.7262133, 3.260578, 1, 1, 1, 1, 1,
0.006654985, 0.1903935, 1.597757, 1, 1, 1, 1, 1,
0.01413446, 0.4004935, 0.1957476, 1, 1, 1, 1, 1,
0.01472015, -0.1324389, 4.147615, 1, 1, 1, 1, 1,
0.02193093, 0.3470246, -0.8093094, 1, 1, 1, 1, 1,
0.02465374, 0.7205079, -0.4108775, 1, 1, 1, 1, 1,
0.02860371, 0.1968582, 0.8353729, 1, 1, 1, 1, 1,
0.03235521, -0.2470345, 2.206047, 1, 1, 1, 1, 1,
0.03260565, 1.061717, -0.01636017, 1, 1, 1, 1, 1,
0.0354348, 1.431327, -0.3586179, 1, 1, 1, 1, 1,
0.03784429, -0.1918379, 2.685637, 0, 0, 1, 1, 1,
0.03991725, 1.116222, -0.04607416, 1, 0, 0, 1, 1,
0.04558184, -0.7849581, 2.690815, 1, 0, 0, 1, 1,
0.04773653, 0.5205326, 0.1827506, 1, 0, 0, 1, 1,
0.04862229, 0.2586204, -0.1728289, 1, 0, 0, 1, 1,
0.04886591, 0.8522153, -0.4701311, 1, 0, 0, 1, 1,
0.05287353, -0.2321873, 4.162696, 0, 0, 0, 1, 1,
0.05331168, -0.09166238, 2.043019, 0, 0, 0, 1, 1,
0.05548545, -0.9215176, 2.767949, 0, 0, 0, 1, 1,
0.05684088, 0.4665213, 1.340495, 0, 0, 0, 1, 1,
0.06632619, 0.2809384, 1.497342, 0, 0, 0, 1, 1,
0.06841864, -0.5951886, 4.433611, 0, 0, 0, 1, 1,
0.06861615, -0.03964932, 2.395724, 0, 0, 0, 1, 1,
0.06951512, 0.230366, 1.868001, 1, 1, 1, 1, 1,
0.07168802, -0.1996326, 3.451239, 1, 1, 1, 1, 1,
0.07348148, -1.250925, 3.806769, 1, 1, 1, 1, 1,
0.07432107, -0.903627, 4.008878, 1, 1, 1, 1, 1,
0.07777045, -0.2606099, 4.711259, 1, 1, 1, 1, 1,
0.07874263, -0.8041226, 2.554226, 1, 1, 1, 1, 1,
0.08509293, 1.098025, -1.017365, 1, 1, 1, 1, 1,
0.08689618, 0.2345471, -0.05142791, 1, 1, 1, 1, 1,
0.09302725, 0.8825284, 1.514725, 1, 1, 1, 1, 1,
0.09333842, -0.561433, 3.047137, 1, 1, 1, 1, 1,
0.1000115, -1.159885, 1.475513, 1, 1, 1, 1, 1,
0.1043434, -0.6978163, 3.183746, 1, 1, 1, 1, 1,
0.1067232, 0.675945, 1.098913, 1, 1, 1, 1, 1,
0.1067587, -0.7707459, 3.081031, 1, 1, 1, 1, 1,
0.1091183, -0.4532184, 3.392275, 1, 1, 1, 1, 1,
0.110259, -1.174612, 2.924858, 0, 0, 1, 1, 1,
0.1138226, 0.01026213, 1.508732, 1, 0, 0, 1, 1,
0.1157919, 0.4247867, 1.472155, 1, 0, 0, 1, 1,
0.118519, 0.170441, 0.4866003, 1, 0, 0, 1, 1,
0.1223244, 1.078877, -1.122605, 1, 0, 0, 1, 1,
0.1240299, 0.8401929, 0.1641086, 1, 0, 0, 1, 1,
0.1275422, -0.02566917, 1.616288, 0, 0, 0, 1, 1,
0.1295467, -2.384329, 1.979392, 0, 0, 0, 1, 1,
0.132434, -2.511514, 3.220019, 0, 0, 0, 1, 1,
0.1340324, 0.514116, 1.694969, 0, 0, 0, 1, 1,
0.1348988, 1.737668, 1.076342, 0, 0, 0, 1, 1,
0.136135, -0.6451114, 1.986209, 0, 0, 0, 1, 1,
0.1363344, -0.7321199, 2.746051, 0, 0, 0, 1, 1,
0.1418478, 0.4122021, 0.166935, 1, 1, 1, 1, 1,
0.1499676, 0.5541493, 0.6375442, 1, 1, 1, 1, 1,
0.1510684, 0.2457596, 1.322715, 1, 1, 1, 1, 1,
0.1565314, 1.419395, -0.1879048, 1, 1, 1, 1, 1,
0.1568992, -1.470111, 3.123714, 1, 1, 1, 1, 1,
0.1706214, -0.4224264, 2.346177, 1, 1, 1, 1, 1,
0.1709296, 0.2089516, 0.6573305, 1, 1, 1, 1, 1,
0.1745166, 0.1350857, 1.901949, 1, 1, 1, 1, 1,
0.1750433, 0.9777429, 0.1871634, 1, 1, 1, 1, 1,
0.1764375, -0.7730711, 2.508241, 1, 1, 1, 1, 1,
0.1795143, -0.9983162, 3.111281, 1, 1, 1, 1, 1,
0.1818883, -1.195271, 2.550375, 1, 1, 1, 1, 1,
0.1850125, -1.086872, 2.653778, 1, 1, 1, 1, 1,
0.1892115, 0.2095398, 1.738496, 1, 1, 1, 1, 1,
0.1911835, -1.311971, 1.430713, 1, 1, 1, 1, 1,
0.1995385, -1.230372, 1.847154, 0, 0, 1, 1, 1,
0.2013862, 0.8100606, -0.1784633, 1, 0, 0, 1, 1,
0.20375, 0.1516811, 1.319184, 1, 0, 0, 1, 1,
0.2058479, -1.674126, 4.085232, 1, 0, 0, 1, 1,
0.2082693, -0.519233, 3.996716, 1, 0, 0, 1, 1,
0.2093973, 1.171679, 0.6139283, 1, 0, 0, 1, 1,
0.2121356, 1.047094, 1.099979, 0, 0, 0, 1, 1,
0.2129942, 0.9796708, 0.3875288, 0, 0, 0, 1, 1,
0.2133836, -0.03892879, 2.878652, 0, 0, 0, 1, 1,
0.2135636, 0.1592877, 0.3689791, 0, 0, 0, 1, 1,
0.2141542, -0.6472386, 3.197637, 0, 0, 0, 1, 1,
0.2149564, 0.7788903, 0.7108647, 0, 0, 0, 1, 1,
0.2188355, 0.2271383, 1.944091, 0, 0, 0, 1, 1,
0.2288886, 0.7496531, -0.3988813, 1, 1, 1, 1, 1,
0.2312491, -0.8715037, 1.461671, 1, 1, 1, 1, 1,
0.2417315, -0.3171163, 1.834405, 1, 1, 1, 1, 1,
0.2442094, 0.8797767, 0.08183352, 1, 1, 1, 1, 1,
0.246342, 0.4962474, 1.475855, 1, 1, 1, 1, 1,
0.2476065, 0.6331379, 0.4771106, 1, 1, 1, 1, 1,
0.2535514, -2.222471, 3.590598, 1, 1, 1, 1, 1,
0.2560846, 0.7025545, -1.346789, 1, 1, 1, 1, 1,
0.2576581, 0.5369773, 1.765811, 1, 1, 1, 1, 1,
0.2607372, -0.584798, 1.803622, 1, 1, 1, 1, 1,
0.2625062, -0.06658942, 2.252335, 1, 1, 1, 1, 1,
0.2647569, -0.6262845, 2.244098, 1, 1, 1, 1, 1,
0.2662804, -0.8939127, 2.607573, 1, 1, 1, 1, 1,
0.2679899, -1.157159, 1.588825, 1, 1, 1, 1, 1,
0.268424, 0.7394493, 2.752751, 1, 1, 1, 1, 1,
0.2768328, 0.2092584, 2.03466, 0, 0, 1, 1, 1,
0.2773021, -0.3190925, 1.925645, 1, 0, 0, 1, 1,
0.278432, -0.7987886, 2.693988, 1, 0, 0, 1, 1,
0.2798505, -0.08941569, 3.704986, 1, 0, 0, 1, 1,
0.2829612, -0.410586, 2.460427, 1, 0, 0, 1, 1,
0.2856964, -0.6656756, 1.114904, 1, 0, 0, 1, 1,
0.2897443, 0.2149858, 2.025876, 0, 0, 0, 1, 1,
0.2898659, -0.1970098, 1.097284, 0, 0, 0, 1, 1,
0.2926636, -0.5441073, 2.371877, 0, 0, 0, 1, 1,
0.2968383, 0.403583, 0.7341805, 0, 0, 0, 1, 1,
0.2986903, 0.5197372, 0.09541143, 0, 0, 0, 1, 1,
0.3004632, -1.343767, 3.339643, 0, 0, 0, 1, 1,
0.3026531, -1.166761, 2.471352, 0, 0, 0, 1, 1,
0.3044403, -0.3210284, 1.619204, 1, 1, 1, 1, 1,
0.3076717, 1.287559, 0.7708499, 1, 1, 1, 1, 1,
0.3082331, 0.08390492, 2.367127, 1, 1, 1, 1, 1,
0.3089181, -1.008241, 3.722993, 1, 1, 1, 1, 1,
0.310094, -0.0675959, 2.536571, 1, 1, 1, 1, 1,
0.3107185, -0.4436851, 2.285599, 1, 1, 1, 1, 1,
0.3160509, 2.13459, 0.2522437, 1, 1, 1, 1, 1,
0.3163801, 1.015963, -1.734008, 1, 1, 1, 1, 1,
0.3208903, -0.2551116, 0.7336256, 1, 1, 1, 1, 1,
0.3236055, -0.6831586, 1.841337, 1, 1, 1, 1, 1,
0.3244832, 0.6308839, 0.2248728, 1, 1, 1, 1, 1,
0.3284681, 1.240542, 0.9425465, 1, 1, 1, 1, 1,
0.3287095, 1.037036, -2.86786, 1, 1, 1, 1, 1,
0.3328212, -0.4286108, 2.966653, 1, 1, 1, 1, 1,
0.337183, 0.2609164, 0.790236, 1, 1, 1, 1, 1,
0.3381854, 0.9447223, 1.314225, 0, 0, 1, 1, 1,
0.3394398, 0.05285184, 1.346805, 1, 0, 0, 1, 1,
0.3434507, 0.9910841, 1.363035, 1, 0, 0, 1, 1,
0.3480578, 1.783243, -1.128456, 1, 0, 0, 1, 1,
0.3558996, 0.6929893, -0.677337, 1, 0, 0, 1, 1,
0.3569085, -0.896131, 4.009112, 1, 0, 0, 1, 1,
0.3580371, 0.5938335, 0.5480597, 0, 0, 0, 1, 1,
0.358233, -0.5158365, 1.856491, 0, 0, 0, 1, 1,
0.359141, 0.3023143, 1.260155, 0, 0, 0, 1, 1,
0.3599717, -0.388998, 1.690688, 0, 0, 0, 1, 1,
0.3620711, -1.654632, 4.728762, 0, 0, 0, 1, 1,
0.3632877, 1.523079, 0.9465939, 0, 0, 0, 1, 1,
0.3647184, -0.2012034, 2.87019, 0, 0, 0, 1, 1,
0.3726907, -0.3495186, 1.081982, 1, 1, 1, 1, 1,
0.373965, 0.2987618, -0.2726336, 1, 1, 1, 1, 1,
0.3757347, 0.9889327, -0.1859615, 1, 1, 1, 1, 1,
0.3778245, -1.111456, 1.693921, 1, 1, 1, 1, 1,
0.3826261, -0.8154843, 3.236365, 1, 1, 1, 1, 1,
0.3872102, 2.165297, 0.2920656, 1, 1, 1, 1, 1,
0.3893551, -1.282419, 2.884265, 1, 1, 1, 1, 1,
0.3948549, 0.287867, 1.306869, 1, 1, 1, 1, 1,
0.3980484, 0.6311911, 1.791305, 1, 1, 1, 1, 1,
0.3987201, -0.7857911, 1.561819, 1, 1, 1, 1, 1,
0.3992116, 1.461062, 1.150523, 1, 1, 1, 1, 1,
0.4079147, -0.3150304, 4.007094, 1, 1, 1, 1, 1,
0.4082145, -0.5011806, 2.912139, 1, 1, 1, 1, 1,
0.4127463, 1.584006, 1.148638, 1, 1, 1, 1, 1,
0.4143678, 1.520285, 1.763073, 1, 1, 1, 1, 1,
0.4145175, -0.9670851, 3.103222, 0, 0, 1, 1, 1,
0.4251091, 0.988147, 0.3434845, 1, 0, 0, 1, 1,
0.4292155, 0.098929, 1.386703, 1, 0, 0, 1, 1,
0.4342892, -0.5730307, 3.85503, 1, 0, 0, 1, 1,
0.4358204, 0.6171746, 2.592689, 1, 0, 0, 1, 1,
0.4379705, 0.2570099, 1.223893, 1, 0, 0, 1, 1,
0.4413168, -0.8720298, 3.148557, 0, 0, 0, 1, 1,
0.4474569, -0.1963388, 2.440741, 0, 0, 0, 1, 1,
0.4500914, 0.2831401, 1.541989, 0, 0, 0, 1, 1,
0.4533311, -1.805789, 2.556231, 0, 0, 0, 1, 1,
0.4561791, -0.6403301, 2.442517, 0, 0, 0, 1, 1,
0.4636487, 0.8395271, -0.5176674, 0, 0, 0, 1, 1,
0.4642317, 0.03511754, 3.106381, 0, 0, 0, 1, 1,
0.4655088, 0.1296904, 2.231168, 1, 1, 1, 1, 1,
0.4672437, 0.3168774, 2.326021, 1, 1, 1, 1, 1,
0.468023, -2.817129, 4.626395, 1, 1, 1, 1, 1,
0.4791764, 1.752826, 0.9757904, 1, 1, 1, 1, 1,
0.4828065, -0.06444249, 2.961108, 1, 1, 1, 1, 1,
0.4840422, 2.433861, 0.7863573, 1, 1, 1, 1, 1,
0.4846013, -1.017465, 2.945465, 1, 1, 1, 1, 1,
0.4868541, -0.7391776, 3.069235, 1, 1, 1, 1, 1,
0.4870519, 0.07470805, 2.698537, 1, 1, 1, 1, 1,
0.4871517, -0.9756168, 2.135484, 1, 1, 1, 1, 1,
0.4894377, 1.054912, -0.4332168, 1, 1, 1, 1, 1,
0.4908015, 0.2721527, 1.808437, 1, 1, 1, 1, 1,
0.4945113, 0.616201, 0.5686072, 1, 1, 1, 1, 1,
0.4952709, -0.3385645, 2.861705, 1, 1, 1, 1, 1,
0.498223, -1.258663, 3.064279, 1, 1, 1, 1, 1,
0.4996315, -0.4432898, 3.495184, 0, 0, 1, 1, 1,
0.5034539, -1.034485, 1.795035, 1, 0, 0, 1, 1,
0.5045438, -0.8448408, 2.477491, 1, 0, 0, 1, 1,
0.5095376, 0.9804201, 0.2908914, 1, 0, 0, 1, 1,
0.5143977, -0.2997135, 4.264796, 1, 0, 0, 1, 1,
0.5163455, -0.627342, 1.764037, 1, 0, 0, 1, 1,
0.5177016, 1.704723, -0.6337898, 0, 0, 0, 1, 1,
0.5216563, 1.819494, 0.7928867, 0, 0, 0, 1, 1,
0.5227365, -0.9027882, 1.231344, 0, 0, 0, 1, 1,
0.5232147, -1.093187, 3.209146, 0, 0, 0, 1, 1,
0.5270527, 1.362251, 1.559437, 0, 0, 0, 1, 1,
0.5291923, 0.5848417, 1.164642, 0, 0, 0, 1, 1,
0.5292479, 0.7553647, 0.3011393, 0, 0, 0, 1, 1,
0.5332587, 0.379135, 1.921597, 1, 1, 1, 1, 1,
0.5394737, 0.9213601, -0.2895737, 1, 1, 1, 1, 1,
0.5513417, -1.284044, 2.467305, 1, 1, 1, 1, 1,
0.5514768, 1.05874, 1.741487, 1, 1, 1, 1, 1,
0.5533882, 0.7486699, 0.6221045, 1, 1, 1, 1, 1,
0.553528, 1.103509, 0.7362215, 1, 1, 1, 1, 1,
0.5543864, 0.2617085, 1.099094, 1, 1, 1, 1, 1,
0.5556884, 0.6171563, -0.7104918, 1, 1, 1, 1, 1,
0.5620931, 1.022427, -0.4025629, 1, 1, 1, 1, 1,
0.5625063, -0.1452494, 0.6171045, 1, 1, 1, 1, 1,
0.5691712, 0.8778124, 1.604815, 1, 1, 1, 1, 1,
0.5710691, -1.205307, 3.946711, 1, 1, 1, 1, 1,
0.5725957, -0.1179471, 0.3699901, 1, 1, 1, 1, 1,
0.5746872, 0.09767539, 0.5863348, 1, 1, 1, 1, 1,
0.5779797, -1.336228, 2.780699, 1, 1, 1, 1, 1,
0.5819843, -1.891828, 2.962697, 0, 0, 1, 1, 1,
0.582207, -0.5325433, 1.837104, 1, 0, 0, 1, 1,
0.5865395, -0.4107626, 1.6595, 1, 0, 0, 1, 1,
0.5881028, -0.1640986, 1.091553, 1, 0, 0, 1, 1,
0.5926054, 0.3775868, 0.05726701, 1, 0, 0, 1, 1,
0.5939348, -0.4965549, 1.52971, 1, 0, 0, 1, 1,
0.5940359, 0.7552189, -0.05833629, 0, 0, 0, 1, 1,
0.5949146, 1.174728, -1.802715, 0, 0, 0, 1, 1,
0.5954546, -0.3048296, 1.543822, 0, 0, 0, 1, 1,
0.597293, 1.319411, 0.533084, 0, 0, 0, 1, 1,
0.6093157, -0.5929758, 0.2169739, 0, 0, 0, 1, 1,
0.6115149, 0.932558, 0.1414913, 0, 0, 0, 1, 1,
0.6144283, 2.201913, 0.005215063, 0, 0, 0, 1, 1,
0.6157307, -1.291994, 2.103755, 1, 1, 1, 1, 1,
0.6159723, -1.662874, 1.501932, 1, 1, 1, 1, 1,
0.6162532, -0.2174467, 2.01598, 1, 1, 1, 1, 1,
0.6192131, -0.02099362, 1.899078, 1, 1, 1, 1, 1,
0.6230313, -1.193089, 3.111304, 1, 1, 1, 1, 1,
0.6256626, -0.6512027, 1.033214, 1, 1, 1, 1, 1,
0.6282389, 1.428838, -0.5519014, 1, 1, 1, 1, 1,
0.6326647, -1.128111, 2.918199, 1, 1, 1, 1, 1,
0.6445026, -1.859904, 2.737116, 1, 1, 1, 1, 1,
0.6475416, 1.508024, -0.4853432, 1, 1, 1, 1, 1,
0.6517992, 0.7390093, 1.834027, 1, 1, 1, 1, 1,
0.6530665, -0.842617, 3.307429, 1, 1, 1, 1, 1,
0.6541576, -0.8851364, 2.534923, 1, 1, 1, 1, 1,
0.6579171, -0.3914429, 3.181634, 1, 1, 1, 1, 1,
0.6586099, 0.8346941, 0.9325631, 1, 1, 1, 1, 1,
0.6590733, 0.5317248, 0.5927033, 0, 0, 1, 1, 1,
0.6596872, -1.650656, 2.842341, 1, 0, 0, 1, 1,
0.6600329, -0.2465259, 3.034748, 1, 0, 0, 1, 1,
0.6627583, 0.6176203, 0.5439206, 1, 0, 0, 1, 1,
0.6643775, -2.65859, 0.7770271, 1, 0, 0, 1, 1,
0.6651437, -2.12762, 3.546554, 1, 0, 0, 1, 1,
0.6667571, 0.468514, 0.1644603, 0, 0, 0, 1, 1,
0.6687583, -0.2449234, 1.555521, 0, 0, 0, 1, 1,
0.6704105, 0.9177721, 0.8592022, 0, 0, 0, 1, 1,
0.6708608, 1.047065, 1.747378, 0, 0, 0, 1, 1,
0.6708903, 0.8725784, -0.02817665, 0, 0, 0, 1, 1,
0.6721033, -1.95895, 2.506457, 0, 0, 0, 1, 1,
0.6763541, -0.4355307, 1.778759, 0, 0, 0, 1, 1,
0.67676, -1.703895, 2.962776, 1, 1, 1, 1, 1,
0.6803936, -0.6076159, 0.9817055, 1, 1, 1, 1, 1,
0.6840301, 0.1174977, 0.9294293, 1, 1, 1, 1, 1,
0.6868788, 0.02303026, 1.618224, 1, 1, 1, 1, 1,
0.6887787, -1.074149, 3.246736, 1, 1, 1, 1, 1,
0.6888306, 0.5904486, 1.259362, 1, 1, 1, 1, 1,
0.6893542, 0.3138595, -0.0573189, 1, 1, 1, 1, 1,
0.6943733, -0.1732153, 0.7426211, 1, 1, 1, 1, 1,
0.6944457, -1.654751, 1.18927, 1, 1, 1, 1, 1,
0.6944758, 0.7821434, 1.69039, 1, 1, 1, 1, 1,
0.6969064, -0.3246027, 1.350629, 1, 1, 1, 1, 1,
0.6974495, 1.822176, 0.153228, 1, 1, 1, 1, 1,
0.7001123, -0.8710459, 1.833454, 1, 1, 1, 1, 1,
0.7003934, 1.353973, 3.279345, 1, 1, 1, 1, 1,
0.7015279, 0.9451984, 0.01129233, 1, 1, 1, 1, 1,
0.7028863, -1.775208, 3.779406, 0, 0, 1, 1, 1,
0.7065493, -0.7958868, 3.569274, 1, 0, 0, 1, 1,
0.7147017, 0.09049828, 1.579467, 1, 0, 0, 1, 1,
0.715983, -0.1176483, 1.692042, 1, 0, 0, 1, 1,
0.7183954, 2.111153, 0.3269305, 1, 0, 0, 1, 1,
0.7259148, 0.5979366, 1.671947, 1, 0, 0, 1, 1,
0.7279595, 0.248316, 0.7183479, 0, 0, 0, 1, 1,
0.7280649, 0.4742795, 0.6074958, 0, 0, 0, 1, 1,
0.7306216, -2.502042, 2.155462, 0, 0, 0, 1, 1,
0.7367598, -0.1121844, 0.7347062, 0, 0, 0, 1, 1,
0.7395201, -0.738866, 1.039044, 0, 0, 0, 1, 1,
0.7431537, 0.6184821, 0.1894922, 0, 0, 0, 1, 1,
0.7448115, 0.3206367, 0.812216, 0, 0, 0, 1, 1,
0.7449013, -0.4724404, 1.228954, 1, 1, 1, 1, 1,
0.745449, -1.123684, 1.385197, 1, 1, 1, 1, 1,
0.7454872, -1.182642, 3.070528, 1, 1, 1, 1, 1,
0.7469252, 0.5211874, -0.7839968, 1, 1, 1, 1, 1,
0.7543131, -1.995845, 2.219075, 1, 1, 1, 1, 1,
0.7586638, 2.208482, -1.560639, 1, 1, 1, 1, 1,
0.766835, 0.157221, 1.520846, 1, 1, 1, 1, 1,
0.7674651, -0.8613915, -0.02610844, 1, 1, 1, 1, 1,
0.7680284, 0.1509277, 0.9142923, 1, 1, 1, 1, 1,
0.7715165, -1.099515, 0.9353105, 1, 1, 1, 1, 1,
0.7734516, 1.361174, -0.9149411, 1, 1, 1, 1, 1,
0.7747997, 0.2862951, 1.061398, 1, 1, 1, 1, 1,
0.7753524, 0.498199, 0.4306338, 1, 1, 1, 1, 1,
0.785709, -2.046613, 3.506014, 1, 1, 1, 1, 1,
0.7869713, -0.7791013, 2.63823, 1, 1, 1, 1, 1,
0.7960135, 0.3657477, 2.22966, 0, 0, 1, 1, 1,
0.7990362, 1.066082, 0.750618, 1, 0, 0, 1, 1,
0.8111506, -0.1142104, 1.829179, 1, 0, 0, 1, 1,
0.8126418, -1.393695, 2.52663, 1, 0, 0, 1, 1,
0.8155592, -2.062681, 2.466466, 1, 0, 0, 1, 1,
0.8178414, 1.582402, -0.3788348, 1, 0, 0, 1, 1,
0.8188251, 0.5287548, 0.9204129, 0, 0, 0, 1, 1,
0.8198057, 0.8451111, -0.04543582, 0, 0, 0, 1, 1,
0.8213782, 1.081482, 1.749503, 0, 0, 0, 1, 1,
0.8222373, -2.318843, 0.09521429, 0, 0, 0, 1, 1,
0.8223826, -0.07594862, 0.4425938, 0, 0, 0, 1, 1,
0.8233491, 1.645871, 0.958854, 0, 0, 0, 1, 1,
0.824382, -0.5290905, 3.330213, 0, 0, 0, 1, 1,
0.8264419, -0.782273, 2.198939, 1, 1, 1, 1, 1,
0.8284733, -1.367014, 1.856347, 1, 1, 1, 1, 1,
0.8308754, -0.292661, 0.9534703, 1, 1, 1, 1, 1,
0.8342857, -0.355386, 2.154709, 1, 1, 1, 1, 1,
0.8366065, -1.990293, 2.366547, 1, 1, 1, 1, 1,
0.8411268, -1.085837, 2.830733, 1, 1, 1, 1, 1,
0.8447896, -0.2665358, 2.484431, 1, 1, 1, 1, 1,
0.8456326, 0.2415415, -0.1298311, 1, 1, 1, 1, 1,
0.8474908, 2.718304, -0.6342854, 1, 1, 1, 1, 1,
0.8489384, 0.3264358, -0.2168147, 1, 1, 1, 1, 1,
0.8489786, -1.448, 2.223836, 1, 1, 1, 1, 1,
0.862674, 0.6875552, 2.080133, 1, 1, 1, 1, 1,
0.8651647, 0.1620718, 1.260167, 1, 1, 1, 1, 1,
0.8658919, 0.5676561, 1.371834, 1, 1, 1, 1, 1,
0.8675619, -0.3423857, 1.041207, 1, 1, 1, 1, 1,
0.8725474, -0.6766384, 1.250203, 0, 0, 1, 1, 1,
0.8734403, 0.8472693, 2.600219, 1, 0, 0, 1, 1,
0.886999, -0.8685886, 1.610705, 1, 0, 0, 1, 1,
0.8891349, 0.4794831, 1.228909, 1, 0, 0, 1, 1,
0.8906634, 0.2941352, 2.000048, 1, 0, 0, 1, 1,
0.8975416, -1.777136, 1.941354, 1, 0, 0, 1, 1,
0.8994853, 0.2282874, 2.651586, 0, 0, 0, 1, 1,
0.9007784, 0.02890463, 2.266838, 0, 0, 0, 1, 1,
0.908277, 2.207559, 1.582785, 0, 0, 0, 1, 1,
0.9125403, -0.2367627, -1.168777, 0, 0, 0, 1, 1,
0.9152672, 2.207657, 0.5246979, 0, 0, 0, 1, 1,
0.9157135, 1.372625, 2.618701, 0, 0, 0, 1, 1,
0.9162357, -1.615867, 2.9199, 0, 0, 0, 1, 1,
0.9164189, 0.4579735, 2.361938, 1, 1, 1, 1, 1,
0.9310148, -0.6544243, 2.465886, 1, 1, 1, 1, 1,
0.9315752, 0.2876021, 1.960629, 1, 1, 1, 1, 1,
0.9467559, 0.5231062, 1.922444, 1, 1, 1, 1, 1,
0.9472402, -0.3289874, 0.8467022, 1, 1, 1, 1, 1,
0.9508564, -0.6181383, 0.07378279, 1, 1, 1, 1, 1,
0.955655, 0.3787952, 2.510548, 1, 1, 1, 1, 1,
0.958671, 1.045512, 0.1208777, 1, 1, 1, 1, 1,
0.9660636, 0.06079307, 3.797703, 1, 1, 1, 1, 1,
0.968636, -0.3434133, 1.177491, 1, 1, 1, 1, 1,
0.9733782, 0.5042949, 1.252692, 1, 1, 1, 1, 1,
0.9772144, 0.1035683, 2.018306, 1, 1, 1, 1, 1,
0.9795154, 0.5404414, -0.323833, 1, 1, 1, 1, 1,
0.9813355, 1.506535, -1.263245, 1, 1, 1, 1, 1,
0.9832147, 0.2553684, 0.7515879, 1, 1, 1, 1, 1,
0.9871274, 0.8180729, 0.08826578, 0, 0, 1, 1, 1,
0.989181, -0.0957654, 1.967343, 1, 0, 0, 1, 1,
0.9912499, -0.7198738, -0.6100374, 1, 0, 0, 1, 1,
0.9950132, -1.20609, 3.797486, 1, 0, 0, 1, 1,
0.995294, 0.1598047, 2.665576, 1, 0, 0, 1, 1,
1.007117, 0.9817827, 1.966928, 1, 0, 0, 1, 1,
1.009832, 1.132549, -0.5779746, 0, 0, 0, 1, 1,
1.047171, 0.4800999, 1.782687, 0, 0, 0, 1, 1,
1.056016, -0.7559902, 1.224076, 0, 0, 0, 1, 1,
1.059521, -2.396519, 2.94835, 0, 0, 0, 1, 1,
1.059971, 1.74543, 1.551897, 0, 0, 0, 1, 1,
1.064698, 0.9449419, 1.489908, 0, 0, 0, 1, 1,
1.066147, 0.3394765, 0.5485117, 0, 0, 0, 1, 1,
1.066859, 1.203719, 3.218831, 1, 1, 1, 1, 1,
1.073192, 0.7442328, 1.994566, 1, 1, 1, 1, 1,
1.07447, -0.1053111, 1.06258, 1, 1, 1, 1, 1,
1.077169, -1.438764, 2.785188, 1, 1, 1, 1, 1,
1.080824, 1.541055, 1.231066, 1, 1, 1, 1, 1,
1.08089, -0.2887617, 2.187393, 1, 1, 1, 1, 1,
1.081891, -1.009355, 3.213213, 1, 1, 1, 1, 1,
1.081933, -0.073944, 1.391634, 1, 1, 1, 1, 1,
1.091027, -0.2776999, 3.226036, 1, 1, 1, 1, 1,
1.092982, -0.1003403, 1.523969, 1, 1, 1, 1, 1,
1.111961, -0.1567386, 2.37624, 1, 1, 1, 1, 1,
1.115363, -0.6920796, 2.2463, 1, 1, 1, 1, 1,
1.118179, -0.1653499, 2.475725, 1, 1, 1, 1, 1,
1.119442, 0.004909624, 1.0571, 1, 1, 1, 1, 1,
1.124849, -0.908479, 1.92271, 1, 1, 1, 1, 1,
1.142434, 1.299397, 0.6594882, 0, 0, 1, 1, 1,
1.145288, -2.034031, 3.319941, 1, 0, 0, 1, 1,
1.149207, -1.436301, 2.407922, 1, 0, 0, 1, 1,
1.16081, 0.4537608, 2.006539, 1, 0, 0, 1, 1,
1.185501, -0.1684162, 2.608401, 1, 0, 0, 1, 1,
1.194047, -1.172127, 3.156421, 1, 0, 0, 1, 1,
1.201639, 0.3978482, 0.3287588, 0, 0, 0, 1, 1,
1.210879, 1.519866, 0.2266706, 0, 0, 0, 1, 1,
1.211702, -0.4650391, 2.12474, 0, 0, 0, 1, 1,
1.216084, 0.5663788, 2.234813, 0, 0, 0, 1, 1,
1.220981, 0.9764643, 2.330566, 0, 0, 0, 1, 1,
1.222819, -0.1999144, 3.249702, 0, 0, 0, 1, 1,
1.223745, 1.746468, 0.6002214, 0, 0, 0, 1, 1,
1.230598, -0.3552078, 2.168986, 1, 1, 1, 1, 1,
1.247978, 0.3629353, -0.09397248, 1, 1, 1, 1, 1,
1.253702, -0.136338, 1.613948, 1, 1, 1, 1, 1,
1.264946, 0.6975651, 2.564894, 1, 1, 1, 1, 1,
1.265939, -0.732804, 2.493587, 1, 1, 1, 1, 1,
1.266317, -1.457684, 2.837883, 1, 1, 1, 1, 1,
1.268698, 1.465304, -0.0274392, 1, 1, 1, 1, 1,
1.27067, -1.294796, 0.5831348, 1, 1, 1, 1, 1,
1.281224, 3.947998, 0.08480117, 1, 1, 1, 1, 1,
1.282177, -0.3829884, 2.648476, 1, 1, 1, 1, 1,
1.288646, -0.05464808, 0.1882038, 1, 1, 1, 1, 1,
1.291329, -0.07852413, -1.033858, 1, 1, 1, 1, 1,
1.296703, -0.4125368, 3.069037, 1, 1, 1, 1, 1,
1.301235, 0.7482129, 3.206346, 1, 1, 1, 1, 1,
1.302857, 0.736039, -1.126118, 1, 1, 1, 1, 1,
1.309761, -0.3230543, 1.113424, 0, 0, 1, 1, 1,
1.326315, 1.43478, 0.973951, 1, 0, 0, 1, 1,
1.326889, -1.392182, 2.348044, 1, 0, 0, 1, 1,
1.343691, -1.646502, 2.754084, 1, 0, 0, 1, 1,
1.344416, 1.013147, 0.324423, 1, 0, 0, 1, 1,
1.349137, -0.3864314, 1.01099, 1, 0, 0, 1, 1,
1.350352, 0.8415465, 0.7500532, 0, 0, 0, 1, 1,
1.356306, -2.590896, 1.687247, 0, 0, 0, 1, 1,
1.368066, 1.195129, 0.8794322, 0, 0, 0, 1, 1,
1.368713, -0.220579, 1.912817, 0, 0, 0, 1, 1,
1.375715, -0.134756, 0.8978804, 0, 0, 0, 1, 1,
1.380192, 0.2262744, -0.4649996, 0, 0, 0, 1, 1,
1.388653, 0.8506004, 0.8450795, 0, 0, 0, 1, 1,
1.395659, 1.576212, -1.096757, 1, 1, 1, 1, 1,
1.396572, 0.7086352, 1.529276, 1, 1, 1, 1, 1,
1.405692, -0.2744915, 1.822069, 1, 1, 1, 1, 1,
1.429151, -0.1326271, 0.7966281, 1, 1, 1, 1, 1,
1.43497, -0.7311191, 1.638648, 1, 1, 1, 1, 1,
1.438947, -1.951734, 2.226283, 1, 1, 1, 1, 1,
1.439723, -0.5671949, 1.191178, 1, 1, 1, 1, 1,
1.44415, 1.036173, 0.8872712, 1, 1, 1, 1, 1,
1.447015, 0.5410291, -0.09417368, 1, 1, 1, 1, 1,
1.451746, 0.1160681, 1.836796, 1, 1, 1, 1, 1,
1.462287, -0.2737277, 1.31854, 1, 1, 1, 1, 1,
1.463505, -0.5518177, 1.901877, 1, 1, 1, 1, 1,
1.485699, 1.293073, -1.282412, 1, 1, 1, 1, 1,
1.486311, 0.08179665, 1.841935, 1, 1, 1, 1, 1,
1.491206, 1.454303, 0.1285561, 1, 1, 1, 1, 1,
1.49991, -0.2386526, 4.193796, 0, 0, 1, 1, 1,
1.50259, 0.6158085, 0.2442419, 1, 0, 0, 1, 1,
1.516444, 1.015511, 1.451203, 1, 0, 0, 1, 1,
1.518012, -0.6133865, 2.026049, 1, 0, 0, 1, 1,
1.523308, -0.9900776, 0.650955, 1, 0, 0, 1, 1,
1.550161, 1.101599, 1.523799, 1, 0, 0, 1, 1,
1.555925, 1.175112, 2.24301, 0, 0, 0, 1, 1,
1.561133, -0.180566, 3.499427, 0, 0, 0, 1, 1,
1.564102, 0.2095304, 1.056268, 0, 0, 0, 1, 1,
1.573002, 1.095183, 0.3247124, 0, 0, 0, 1, 1,
1.594356, 0.1505964, -0.7529105, 0, 0, 0, 1, 1,
1.614143, 0.003784931, 2.005211, 0, 0, 0, 1, 1,
1.616836, -0.4372464, 2.618732, 0, 0, 0, 1, 1,
1.61999, -1.598012, 2.624859, 1, 1, 1, 1, 1,
1.620509, 0.6426779, 0.8758187, 1, 1, 1, 1, 1,
1.626395, -0.8404073, 1.665996, 1, 1, 1, 1, 1,
1.631386, 0.1084348, 2.14504, 1, 1, 1, 1, 1,
1.63567, -0.6996959, 2.716888, 1, 1, 1, 1, 1,
1.638401, 1.24959, 0.1403696, 1, 1, 1, 1, 1,
1.654612, 0.5907792, 1.081013, 1, 1, 1, 1, 1,
1.672969, 1.285586, 0.3458707, 1, 1, 1, 1, 1,
1.678054, 0.06764273, 2.208675, 1, 1, 1, 1, 1,
1.682562, 0.6605643, 1.52931, 1, 1, 1, 1, 1,
1.689819, 2.213031, 2.193207, 1, 1, 1, 1, 1,
1.694378, -1.527028, 2.179019, 1, 1, 1, 1, 1,
1.694704, 0.1837377, 0.9009951, 1, 1, 1, 1, 1,
1.699808, -1.912683, 0.9670597, 1, 1, 1, 1, 1,
1.704302, 0.7003555, 1.101539, 1, 1, 1, 1, 1,
1.709, -0.8992274, 1.86994, 0, 0, 1, 1, 1,
1.725222, 0.1910916, 2.724241, 1, 0, 0, 1, 1,
1.734388, 1.310865, 0.8110862, 1, 0, 0, 1, 1,
1.738665, -1.711996, 1.795244, 1, 0, 0, 1, 1,
1.745654, 0.03258093, 0.8583293, 1, 0, 0, 1, 1,
1.748648, 1.959023, -0.03128055, 1, 0, 0, 1, 1,
1.775496, 1.248503, 0.5479251, 0, 0, 0, 1, 1,
1.799667, 1.083625, 0.6119203, 0, 0, 0, 1, 1,
1.807722, 0.462151, 1.638022, 0, 0, 0, 1, 1,
1.809093, 0.3473916, 2.603246, 0, 0, 0, 1, 1,
1.849008, 1.45093, 1.504816, 0, 0, 0, 1, 1,
1.850233, -1.395232, 4.363746, 0, 0, 0, 1, 1,
1.85542, -0.6412337, 1.717902, 0, 0, 0, 1, 1,
1.861642, 0.8659199, 1.665621, 1, 1, 1, 1, 1,
1.869022, 0.3342417, 0.7317411, 1, 1, 1, 1, 1,
1.883554, -2.138989, 1.576132, 1, 1, 1, 1, 1,
1.892202, 0.4854018, 1.607006, 1, 1, 1, 1, 1,
1.928793, -0.01747248, 1.031971, 1, 1, 1, 1, 1,
1.94179, 0.4887987, 0.2247846, 1, 1, 1, 1, 1,
1.942994, -0.9681458, 1.963263, 1, 1, 1, 1, 1,
1.9724, 0.2089364, 2.291711, 1, 1, 1, 1, 1,
1.975458, -0.5444857, 2.054054, 1, 1, 1, 1, 1,
1.976607, -0.1106992, 2.532454, 1, 1, 1, 1, 1,
1.987058, 0.78004, 0.04508406, 1, 1, 1, 1, 1,
1.998995, 1.43048, 0.2357253, 1, 1, 1, 1, 1,
2.028905, -0.6204748, 3.286515, 1, 1, 1, 1, 1,
2.030503, 0.5846869, 1.140557, 1, 1, 1, 1, 1,
2.043426, 1.507307, -0.4172554, 1, 1, 1, 1, 1,
2.04366, 1.752405, 0.9140432, 0, 0, 1, 1, 1,
2.074183, -0.3956504, 2.551095, 1, 0, 0, 1, 1,
2.122, -0.03800394, 3.313522, 1, 0, 0, 1, 1,
2.140123, -1.281695, -0.008438991, 1, 0, 0, 1, 1,
2.14412, 0.8771039, 0.7383266, 1, 0, 0, 1, 1,
2.177091, 0.2775871, 1.14711, 1, 0, 0, 1, 1,
2.17862, 0.4710555, 1.646715, 0, 0, 0, 1, 1,
2.194516, -0.2408463, 1.727749, 0, 0, 0, 1, 1,
2.242246, -0.8299995, 1.469324, 0, 0, 0, 1, 1,
2.274993, -1.460943, 1.357337, 0, 0, 0, 1, 1,
2.304129, 1.47457, 0.5335333, 0, 0, 0, 1, 1,
2.313501, 0.9142311, 0.2316255, 0, 0, 0, 1, 1,
2.363813, 1.244789, 1.870187, 0, 0, 0, 1, 1,
2.368014, -0.9760726, 1.321542, 1, 1, 1, 1, 1,
2.53768, 2.067468, -0.6646526, 1, 1, 1, 1, 1,
2.544768, 0.5121677, 0.4436021, 1, 1, 1, 1, 1,
2.573788, 0.3583756, 2.762668, 1, 1, 1, 1, 1,
2.698608, -0.6154088, 2.6816, 1, 1, 1, 1, 1,
2.699877, 0.1125436, 1.906415, 1, 1, 1, 1, 1,
3.032219, 0.1366407, 2.019216, 1, 1, 1, 1, 1
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
var radius = 9.762188;
var distance = 34.28927;
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
mvMatrix.translate( -0.2149915, -0.2298799, 0.7464771 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.28927);
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
