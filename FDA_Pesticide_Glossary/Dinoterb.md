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
-3.290492, 2.163826, -0.4373602, 1, 0, 0, 1,
-2.868018, 1.717641, -0.4586707, 1, 0.007843138, 0, 1,
-2.595036, 0.1086996, -2.099451, 1, 0.01176471, 0, 1,
-2.559714, -0.840681, -3.015367, 1, 0.01960784, 0, 1,
-2.413537, 0.6637269, -2.12955, 1, 0.02352941, 0, 1,
-2.411088, 1.105277, -0.08454785, 1, 0.03137255, 0, 1,
-2.357304, -0.08147812, -1.286522, 1, 0.03529412, 0, 1,
-2.292271, -0.6979856, -0.6168145, 1, 0.04313726, 0, 1,
-2.291431, 0.5331628, -1.583105, 1, 0.04705882, 0, 1,
-2.284186, -0.6630949, -2.686851, 1, 0.05490196, 0, 1,
-2.27448, -1.714429, -2.558308, 1, 0.05882353, 0, 1,
-2.222819, 1.017193, -2.371224, 1, 0.06666667, 0, 1,
-2.143049, -0.7511255, -3.21611, 1, 0.07058824, 0, 1,
-2.142709, -0.177055, -0.8263027, 1, 0.07843138, 0, 1,
-2.110493, 0.3387857, -1.590734, 1, 0.08235294, 0, 1,
-2.026024, 1.002462, -0.4376289, 1, 0.09019608, 0, 1,
-2.00025, 0.1369226, -2.074771, 1, 0.09411765, 0, 1,
-1.987305, 0.1695569, 0.4339407, 1, 0.1019608, 0, 1,
-1.964449, -0.5780285, -2.724637, 1, 0.1098039, 0, 1,
-1.957193, -0.147438, -1.724401, 1, 0.1137255, 0, 1,
-1.953742, 1.332436, -0.5171769, 1, 0.1215686, 0, 1,
-1.943032, 0.03073224, -1.518029, 1, 0.1254902, 0, 1,
-1.931314, 0.5037106, -2.533597, 1, 0.1333333, 0, 1,
-1.859066, -0.4020822, -2.177095, 1, 0.1372549, 0, 1,
-1.840252, 0.09377594, -1.857665, 1, 0.145098, 0, 1,
-1.824134, 0.9444025, 1.157506, 1, 0.1490196, 0, 1,
-1.809951, -0.2140664, -0.01143726, 1, 0.1568628, 0, 1,
-1.789847, -1.306635, -1.226001, 1, 0.1607843, 0, 1,
-1.779757, 0.3815534, -2.22795, 1, 0.1686275, 0, 1,
-1.777737, 1.367612, -0.2894024, 1, 0.172549, 0, 1,
-1.768441, 0.2668268, -3.012473, 1, 0.1803922, 0, 1,
-1.753597, -1.726975, -2.648191, 1, 0.1843137, 0, 1,
-1.74554, 0.7047822, -2.614369, 1, 0.1921569, 0, 1,
-1.733122, -0.4414489, -1.835151, 1, 0.1960784, 0, 1,
-1.714691, -0.1716583, -0.313523, 1, 0.2039216, 0, 1,
-1.713744, -0.9781001, -2.345301, 1, 0.2117647, 0, 1,
-1.705913, -1.03989, -2.647912, 1, 0.2156863, 0, 1,
-1.703124, 0.3670745, -0.9779798, 1, 0.2235294, 0, 1,
-1.681952, 1.749406, -0.731409, 1, 0.227451, 0, 1,
-1.681036, 0.8086427, 0.1019916, 1, 0.2352941, 0, 1,
-1.670676, 0.7757369, -0.3765873, 1, 0.2392157, 0, 1,
-1.657933, 0.3055364, -2.588595, 1, 0.2470588, 0, 1,
-1.649898, 0.1486627, -2.506238, 1, 0.2509804, 0, 1,
-1.6159, -0.4961384, -1.025011, 1, 0.2588235, 0, 1,
-1.608407, 0.8871781, -2.934963, 1, 0.2627451, 0, 1,
-1.599339, 0.4826391, -1.427745, 1, 0.2705882, 0, 1,
-1.594941, -0.8501689, -2.38492, 1, 0.2745098, 0, 1,
-1.585731, -0.5216773, -0.4450431, 1, 0.282353, 0, 1,
-1.57723, -1.989958, -1.166976, 1, 0.2862745, 0, 1,
-1.566822, -1.408127, -1.023775, 1, 0.2941177, 0, 1,
-1.558682, -0.7705895, -0.5096874, 1, 0.3019608, 0, 1,
-1.554978, -0.5191713, -1.832347, 1, 0.3058824, 0, 1,
-1.548483, 0.931425, -0.1491699, 1, 0.3137255, 0, 1,
-1.541557, 0.1480929, -0.6891595, 1, 0.3176471, 0, 1,
-1.525573, -0.6769873, -0.7838669, 1, 0.3254902, 0, 1,
-1.523937, 1.138227, 0.01598361, 1, 0.3294118, 0, 1,
-1.509851, -0.0387319, -2.309923, 1, 0.3372549, 0, 1,
-1.505088, 1.048836, 0.01653989, 1, 0.3411765, 0, 1,
-1.496879, 1.029186, -0.3404379, 1, 0.3490196, 0, 1,
-1.496372, -0.6978333, -1.958362, 1, 0.3529412, 0, 1,
-1.494421, -1.814144, -2.936917, 1, 0.3607843, 0, 1,
-1.474127, 1.477407, -0.1269275, 1, 0.3647059, 0, 1,
-1.472926, 1.155189, -1.05113, 1, 0.372549, 0, 1,
-1.468872, -0.9994413, -2.414661, 1, 0.3764706, 0, 1,
-1.462825, -0.4350698, -1.340836, 1, 0.3843137, 0, 1,
-1.460078, 0.9332122, 0.4503604, 1, 0.3882353, 0, 1,
-1.437497, -2.197345, -2.931914, 1, 0.3960784, 0, 1,
-1.435496, 0.1868947, -3.442586, 1, 0.4039216, 0, 1,
-1.432575, 1.717204, 0.5043743, 1, 0.4078431, 0, 1,
-1.427525, -0.7567183, -2.832341, 1, 0.4156863, 0, 1,
-1.42546, 1.585971, -0.4626508, 1, 0.4196078, 0, 1,
-1.416529, -0.1371268, -1.5193, 1, 0.427451, 0, 1,
-1.413803, -0.9976146, -3.884354, 1, 0.4313726, 0, 1,
-1.40796, -1.252438, -2.58549, 1, 0.4392157, 0, 1,
-1.406595, -0.7852506, -1.79999, 1, 0.4431373, 0, 1,
-1.392444, 1.716357, -0.5595038, 1, 0.4509804, 0, 1,
-1.38417, 0.19015, -0.7185992, 1, 0.454902, 0, 1,
-1.369867, 1.786842, -1.474642, 1, 0.4627451, 0, 1,
-1.361279, -0.4106322, -1.435393, 1, 0.4666667, 0, 1,
-1.357006, -1.313052, -3.441054, 1, 0.4745098, 0, 1,
-1.345489, -0.05867634, -3.151355, 1, 0.4784314, 0, 1,
-1.344735, 1.465853, 1.150429, 1, 0.4862745, 0, 1,
-1.334331, 0.1538701, -2.284192, 1, 0.4901961, 0, 1,
-1.330643, -0.4117876, -2.435674, 1, 0.4980392, 0, 1,
-1.32811, 0.5849177, -0.2502025, 1, 0.5058824, 0, 1,
-1.327338, -0.383542, -1.50768, 1, 0.509804, 0, 1,
-1.324376, -0.2324437, -2.623532, 1, 0.5176471, 0, 1,
-1.32182, -0.4609478, -2.487443, 1, 0.5215687, 0, 1,
-1.306248, 0.6690124, -1.050274, 1, 0.5294118, 0, 1,
-1.301446, 0.7045823, -2.06179, 1, 0.5333334, 0, 1,
-1.300333, 0.181118, -0.9969462, 1, 0.5411765, 0, 1,
-1.298072, -0.6845249, 0.2447248, 1, 0.5450981, 0, 1,
-1.29573, -0.6801961, -1.624477, 1, 0.5529412, 0, 1,
-1.295096, 1.31884, -0.2110477, 1, 0.5568628, 0, 1,
-1.291905, -1.272541, -2.716325, 1, 0.5647059, 0, 1,
-1.286328, -0.01660068, -1.460235, 1, 0.5686275, 0, 1,
-1.284209, -0.6982, -2.749602, 1, 0.5764706, 0, 1,
-1.277013, -1.307546, -4.209789, 1, 0.5803922, 0, 1,
-1.273225, 2.058493, 0.1219273, 1, 0.5882353, 0, 1,
-1.261894, 0.8897716, -1.879323, 1, 0.5921569, 0, 1,
-1.255059, -1.150958, -3.163979, 1, 0.6, 0, 1,
-1.247882, 1.537432, -1.481852, 1, 0.6078432, 0, 1,
-1.241117, 0.1402717, -0.7620385, 1, 0.6117647, 0, 1,
-1.2397, -0.4893765, -0.6110063, 1, 0.6196079, 0, 1,
-1.238671, -2.094541, -2.371997, 1, 0.6235294, 0, 1,
-1.238518, -0.4906201, -2.886153, 1, 0.6313726, 0, 1,
-1.232199, -0.321066, -2.620247, 1, 0.6352941, 0, 1,
-1.229324, -1.221568, -4.364146, 1, 0.6431373, 0, 1,
-1.222017, 0.01933795, -1.457802, 1, 0.6470588, 0, 1,
-1.209822, -0.3008876, -1.059998, 1, 0.654902, 0, 1,
-1.207918, 0.3623593, -0.2793018, 1, 0.6588235, 0, 1,
-1.192815, -0.696959, -4.166534, 1, 0.6666667, 0, 1,
-1.192556, -0.5959863, -2.404708, 1, 0.6705883, 0, 1,
-1.192223, -1.19888, -2.807009, 1, 0.6784314, 0, 1,
-1.181143, -1.07581, -2.113545, 1, 0.682353, 0, 1,
-1.170795, 0.9319971, -1.517978, 1, 0.6901961, 0, 1,
-1.16401, -0.6231893, -2.487021, 1, 0.6941177, 0, 1,
-1.159761, -0.8914626, -1.589281, 1, 0.7019608, 0, 1,
-1.152967, -0.5137799, -1.454331, 1, 0.7098039, 0, 1,
-1.15238, 0.680653, -1.486213, 1, 0.7137255, 0, 1,
-1.152254, 0.1777267, -3.929324, 1, 0.7215686, 0, 1,
-1.149198, 0.3929465, -1.895586, 1, 0.7254902, 0, 1,
-1.140231, -0.1322128, -0.1161527, 1, 0.7333333, 0, 1,
-1.135652, -0.6541452, -1.647808, 1, 0.7372549, 0, 1,
-1.13225, -1.095307, -3.384782, 1, 0.7450981, 0, 1,
-1.131764, 0.8069425, -1.492526, 1, 0.7490196, 0, 1,
-1.127732, 0.164153, -2.424254, 1, 0.7568628, 0, 1,
-1.12178, 0.711755, -0.1851725, 1, 0.7607843, 0, 1,
-1.11699, 0.6306332, -0.4030431, 1, 0.7686275, 0, 1,
-1.115424, -0.4540029, -2.492364, 1, 0.772549, 0, 1,
-1.11409, 2.817423, 1.872887, 1, 0.7803922, 0, 1,
-1.105905, -0.3715598, -1.503744, 1, 0.7843137, 0, 1,
-1.105582, -0.2296477, -2.185511, 1, 0.7921569, 0, 1,
-1.103989, 1.502771, 0.3461753, 1, 0.7960784, 0, 1,
-1.103191, -0.9935893, -2.585099, 1, 0.8039216, 0, 1,
-1.103102, -1.648808, -2.015544, 1, 0.8117647, 0, 1,
-1.091027, 2.028708, -1.006642, 1, 0.8156863, 0, 1,
-1.084093, 0.8645998, -0.9786875, 1, 0.8235294, 0, 1,
-1.082791, -0.1112467, -1.783278, 1, 0.827451, 0, 1,
-1.076578, 2.251964, -0.3210573, 1, 0.8352941, 0, 1,
-1.075759, -0.8085261, -1.177102, 1, 0.8392157, 0, 1,
-1.067256, 0.1522419, 0.1033006, 1, 0.8470588, 0, 1,
-1.065954, -0.7905013, -1.42968, 1, 0.8509804, 0, 1,
-1.060087, 1.209425, -0.1914316, 1, 0.8588235, 0, 1,
-1.053411, 0.1253929, -0.8078192, 1, 0.8627451, 0, 1,
-1.051179, 0.04014377, -0.4034976, 1, 0.8705882, 0, 1,
-1.05076, -0.0779356, -1.517546, 1, 0.8745098, 0, 1,
-1.046895, -0.5522444, 0.135773, 1, 0.8823529, 0, 1,
-1.046889, -0.3874226, -0.4715534, 1, 0.8862745, 0, 1,
-1.042734, 0.1496367, -2.819745, 1, 0.8941177, 0, 1,
-1.033887, 0.4003275, -1.440483, 1, 0.8980392, 0, 1,
-1.030935, -0.8414226, -3.161326, 1, 0.9058824, 0, 1,
-1.026451, 0.8944864, -0.6917699, 1, 0.9137255, 0, 1,
-1.025935, 2.435451, -0.5429692, 1, 0.9176471, 0, 1,
-1.025422, -1.699748, -2.124152, 1, 0.9254902, 0, 1,
-1.021532, -0.32407, -4.097275, 1, 0.9294118, 0, 1,
-1.0198, -1.913004, -3.154189, 1, 0.9372549, 0, 1,
-1.015383, -0.9394414, -1.683054, 1, 0.9411765, 0, 1,
-1.010614, 1.454687, -0.6798353, 1, 0.9490196, 0, 1,
-1.00268, 0.3238046, -1.725265, 1, 0.9529412, 0, 1,
-1.00186, 0.6111577, 1.045002, 1, 0.9607843, 0, 1,
-0.9998687, -1.217073, -3.148118, 1, 0.9647059, 0, 1,
-0.9993283, -0.2665746, -1.816727, 1, 0.972549, 0, 1,
-0.9934108, -0.7052703, -3.287291, 1, 0.9764706, 0, 1,
-0.991898, -0.1965584, -1.296498, 1, 0.9843137, 0, 1,
-0.9897252, 0.9202253, -3.422894, 1, 0.9882353, 0, 1,
-0.989227, -1.071445, -2.997884, 1, 0.9960784, 0, 1,
-0.9885849, 0.2774218, -1.494416, 0.9960784, 1, 0, 1,
-0.9880028, 1.976127, 0.5570688, 0.9921569, 1, 0, 1,
-0.9866031, 1.557976, 0.1702944, 0.9843137, 1, 0, 1,
-0.9855741, 0.3901176, -1.164697, 0.9803922, 1, 0, 1,
-0.9852059, 2.308143, -0.3955296, 0.972549, 1, 0, 1,
-0.9702755, -0.5072356, -3.138469, 0.9686275, 1, 0, 1,
-0.9699189, -0.7927074, -3.730426, 0.9607843, 1, 0, 1,
-0.9666194, 1.656556, -1.791587, 0.9568627, 1, 0, 1,
-0.9647968, -0.4161885, -1.061781, 0.9490196, 1, 0, 1,
-0.9603549, 1.148186, -0.2570101, 0.945098, 1, 0, 1,
-0.9398746, -0.5144437, -2.247469, 0.9372549, 1, 0, 1,
-0.9353293, -0.3382452, -1.832743, 0.9333333, 1, 0, 1,
-0.9320982, -0.4887489, -2.506333, 0.9254902, 1, 0, 1,
-0.9313528, 0.9308936, 0.2712639, 0.9215686, 1, 0, 1,
-0.9284915, -0.8963653, -3.265107, 0.9137255, 1, 0, 1,
-0.9236502, 1.050205, -0.4767239, 0.9098039, 1, 0, 1,
-0.9232515, -0.6276691, -2.408203, 0.9019608, 1, 0, 1,
-0.9211982, 0.4308963, -0.3554153, 0.8941177, 1, 0, 1,
-0.9197561, -0.1854272, -3.086594, 0.8901961, 1, 0, 1,
-0.9162963, 0.01696373, -1.094427, 0.8823529, 1, 0, 1,
-0.9131545, 0.3544657, -0.3927201, 0.8784314, 1, 0, 1,
-0.9130614, -0.9278446, -2.826095, 0.8705882, 1, 0, 1,
-0.9126722, 0.6710933, -1.075357, 0.8666667, 1, 0, 1,
-0.9116588, 2.655741, -1.615373, 0.8588235, 1, 0, 1,
-0.9104109, -0.4615702, -4.574253, 0.854902, 1, 0, 1,
-0.9099896, -0.3260627, -1.322961, 0.8470588, 1, 0, 1,
-0.9053563, 1.229201, -1.115119, 0.8431373, 1, 0, 1,
-0.9016959, -0.4652737, -1.961428, 0.8352941, 1, 0, 1,
-0.9008833, 0.2549186, -0.4593952, 0.8313726, 1, 0, 1,
-0.9006232, 1.049531, -1.056242, 0.8235294, 1, 0, 1,
-0.8961822, 0.5091586, -2.107646, 0.8196079, 1, 0, 1,
-0.8917865, -1.307774, -1.874095, 0.8117647, 1, 0, 1,
-0.8843733, -0.1816113, -0.5443426, 0.8078431, 1, 0, 1,
-0.8728195, -1.373637, 0.5448835, 0.8, 1, 0, 1,
-0.8712167, 0.4286539, -2.422054, 0.7921569, 1, 0, 1,
-0.8709696, 1.211854, -0.3685771, 0.7882353, 1, 0, 1,
-0.8529691, -1.818951, -2.6983, 0.7803922, 1, 0, 1,
-0.8529667, -0.7515291, -2.720005, 0.7764706, 1, 0, 1,
-0.8492815, 0.2238013, -2.185277, 0.7686275, 1, 0, 1,
-0.8453221, 0.1326178, -2.026426, 0.7647059, 1, 0, 1,
-0.8437046, -1.042297, -1.686266, 0.7568628, 1, 0, 1,
-0.8362978, 0.01040109, -1.689943, 0.7529412, 1, 0, 1,
-0.8309523, -0.3909763, -2.739975, 0.7450981, 1, 0, 1,
-0.8237962, 0.6032043, -1.392278, 0.7411765, 1, 0, 1,
-0.8217266, 0.26401, -0.8761122, 0.7333333, 1, 0, 1,
-0.8131414, -0.4779491, -2.021534, 0.7294118, 1, 0, 1,
-0.8115216, 0.7515286, -2.552545, 0.7215686, 1, 0, 1,
-0.8085269, -0.1454645, -2.636689, 0.7176471, 1, 0, 1,
-0.7999121, -0.2066873, -1.431977, 0.7098039, 1, 0, 1,
-0.7990491, -0.290805, -3.146947, 0.7058824, 1, 0, 1,
-0.7880889, -0.2792831, -0.9245478, 0.6980392, 1, 0, 1,
-0.7867295, -0.1292927, -1.378484, 0.6901961, 1, 0, 1,
-0.7816008, 0.3354339, -1.707378, 0.6862745, 1, 0, 1,
-0.7792663, 0.511897, -0.6485648, 0.6784314, 1, 0, 1,
-0.7759544, 0.8652198, -0.3542371, 0.6745098, 1, 0, 1,
-0.7759059, 0.6894765, -1.474175, 0.6666667, 1, 0, 1,
-0.7704234, 0.474536, -1.062358, 0.6627451, 1, 0, 1,
-0.7696323, -1.48229, -3.16885, 0.654902, 1, 0, 1,
-0.7668605, 2.370369, 0.4900812, 0.6509804, 1, 0, 1,
-0.7664636, 1.174544, -1.242118, 0.6431373, 1, 0, 1,
-0.7594084, 0.4594737, -0.3827733, 0.6392157, 1, 0, 1,
-0.7548977, 1.212405, 0.1259409, 0.6313726, 1, 0, 1,
-0.7476486, -0.5824354, -3.74215, 0.627451, 1, 0, 1,
-0.744626, -0.1053286, -2.865757, 0.6196079, 1, 0, 1,
-0.7383776, 1.122522, -1.674402, 0.6156863, 1, 0, 1,
-0.7307795, -0.5948877, -3.928948, 0.6078432, 1, 0, 1,
-0.7295662, 0.4687663, -2.14915, 0.6039216, 1, 0, 1,
-0.7221507, 0.7400203, -0.330789, 0.5960785, 1, 0, 1,
-0.7112297, -0.9894051, -2.396003, 0.5882353, 1, 0, 1,
-0.7097309, 0.2479332, 0.3220187, 0.5843138, 1, 0, 1,
-0.7025378, 1.143234, -0.819423, 0.5764706, 1, 0, 1,
-0.6990921, 0.1140451, -0.3772359, 0.572549, 1, 0, 1,
-0.6972318, 0.3908463, -2.133569, 0.5647059, 1, 0, 1,
-0.6916071, 0.3319053, -2.736053, 0.5607843, 1, 0, 1,
-0.6909997, -0.04758821, 0.07007042, 0.5529412, 1, 0, 1,
-0.674832, 1.452608, 1.642112, 0.5490196, 1, 0, 1,
-0.6712825, 0.01062244, -0.5604931, 0.5411765, 1, 0, 1,
-0.6707546, 0.7314978, -1.108929, 0.5372549, 1, 0, 1,
-0.6630371, -0.7206146, -2.970417, 0.5294118, 1, 0, 1,
-0.6626574, 0.8034708, -0.4543241, 0.5254902, 1, 0, 1,
-0.652724, 0.7276692, 0.5420536, 0.5176471, 1, 0, 1,
-0.6504143, 1.483148, -0.4774677, 0.5137255, 1, 0, 1,
-0.6491283, 1.287131, 0.006678235, 0.5058824, 1, 0, 1,
-0.6426939, 0.01591604, -2.399975, 0.5019608, 1, 0, 1,
-0.6401708, -1.97723, -2.302353, 0.4941176, 1, 0, 1,
-0.6387063, -0.8738492, -1.625453, 0.4862745, 1, 0, 1,
-0.6384031, 0.5873701, -0.2481326, 0.4823529, 1, 0, 1,
-0.6378698, 0.7039167, -0.4802522, 0.4745098, 1, 0, 1,
-0.6364788, -2.058252, -4.255756, 0.4705882, 1, 0, 1,
-0.6339801, -0.01774707, -5.042886, 0.4627451, 1, 0, 1,
-0.6297892, -0.8031541, -1.877439, 0.4588235, 1, 0, 1,
-0.6272771, 0.982318, -1.016611, 0.4509804, 1, 0, 1,
-0.6220263, 0.1917419, -2.325917, 0.4470588, 1, 0, 1,
-0.6207732, -0.8963203, -1.754344, 0.4392157, 1, 0, 1,
-0.6151122, 0.170226, 0.005638558, 0.4352941, 1, 0, 1,
-0.6084549, -1.765022, -3.030569, 0.427451, 1, 0, 1,
-0.605129, 1.452015, -0.2054738, 0.4235294, 1, 0, 1,
-0.603941, -0.6443577, -1.42028, 0.4156863, 1, 0, 1,
-0.6012949, 1.126309, -0.8041347, 0.4117647, 1, 0, 1,
-0.594434, -2.445733, -3.28585, 0.4039216, 1, 0, 1,
-0.5940843, 0.6792922, -0.4585947, 0.3960784, 1, 0, 1,
-0.589264, -0.2632556, -2.342659, 0.3921569, 1, 0, 1,
-0.5774854, -0.08196706, -3.035984, 0.3843137, 1, 0, 1,
-0.5773328, -0.4888011, -4.844719, 0.3803922, 1, 0, 1,
-0.5766806, -0.6342081, -2.590021, 0.372549, 1, 0, 1,
-0.5721589, 1.129118, -0.3948974, 0.3686275, 1, 0, 1,
-0.571612, 0.2057164, -1.559911, 0.3607843, 1, 0, 1,
-0.57091, 0.0962109, -0.9072305, 0.3568628, 1, 0, 1,
-0.5596074, 1.322433, -0.6888276, 0.3490196, 1, 0, 1,
-0.5594534, -0.2358497, -1.505679, 0.345098, 1, 0, 1,
-0.5591654, 2.190516, -0.7080906, 0.3372549, 1, 0, 1,
-0.5575325, 0.1930728, -0.1334938, 0.3333333, 1, 0, 1,
-0.5548081, -1.723609, -2.29992, 0.3254902, 1, 0, 1,
-0.5547387, -1.696957, -0.9139636, 0.3215686, 1, 0, 1,
-0.5531703, -1.187153, -2.479863, 0.3137255, 1, 0, 1,
-0.5506848, 0.06287593, -2.341632, 0.3098039, 1, 0, 1,
-0.5437424, 0.1080052, -0.3707088, 0.3019608, 1, 0, 1,
-0.5430236, -0.6557623, -3.421054, 0.2941177, 1, 0, 1,
-0.5416735, -0.5001695, -1.808096, 0.2901961, 1, 0, 1,
-0.5405789, -1.127131, -3.104427, 0.282353, 1, 0, 1,
-0.539309, 1.997647, -0.4380244, 0.2784314, 1, 0, 1,
-0.5381282, -0.0608409, -1.426873, 0.2705882, 1, 0, 1,
-0.5318993, -1.946608, -2.945781, 0.2666667, 1, 0, 1,
-0.5317159, -1.007203, -1.897196, 0.2588235, 1, 0, 1,
-0.5298278, -2.541438, -2.876103, 0.254902, 1, 0, 1,
-0.5296631, -0.5784985, -2.296748, 0.2470588, 1, 0, 1,
-0.5290938, -1.37835, -1.182397, 0.2431373, 1, 0, 1,
-0.5258527, 0.3592733, -2.119475, 0.2352941, 1, 0, 1,
-0.5245964, -0.4784875, -1.859477, 0.2313726, 1, 0, 1,
-0.522754, -0.2621073, -2.651757, 0.2235294, 1, 0, 1,
-0.5162054, 0.1230423, -2.478293, 0.2196078, 1, 0, 1,
-0.5152394, 1.450531, -0.6676146, 0.2117647, 1, 0, 1,
-0.5126929, -0.07446339, -0.6440281, 0.2078431, 1, 0, 1,
-0.5095966, 0.8693369, -0.6835521, 0.2, 1, 0, 1,
-0.5024177, 0.04582203, -2.033243, 0.1921569, 1, 0, 1,
-0.5008366, 0.2494361, -2.737131, 0.1882353, 1, 0, 1,
-0.4961281, 0.09323439, -0.3780106, 0.1803922, 1, 0, 1,
-0.4957803, 0.007428154, -1.956919, 0.1764706, 1, 0, 1,
-0.4948481, 0.1835673, -1.63291, 0.1686275, 1, 0, 1,
-0.4942411, -1.784038, -3.622941, 0.1647059, 1, 0, 1,
-0.4921407, -0.8189237, -2.391512, 0.1568628, 1, 0, 1,
-0.491688, 0.81952, -1.777845, 0.1529412, 1, 0, 1,
-0.4836116, -0.3996765, -3.629482, 0.145098, 1, 0, 1,
-0.4806604, 1.406178, -0.6713005, 0.1411765, 1, 0, 1,
-0.4790582, -0.7833201, -2.080095, 0.1333333, 1, 0, 1,
-0.4782511, -0.4912483, -3.131238, 0.1294118, 1, 0, 1,
-0.4781353, 0.9163377, 1.214477, 0.1215686, 1, 0, 1,
-0.4767691, 0.7218943, -2.282295, 0.1176471, 1, 0, 1,
-0.4756407, -1.212218, -3.912616, 0.1098039, 1, 0, 1,
-0.474243, 0.7585442, -1.440497, 0.1058824, 1, 0, 1,
-0.4732524, 1.304093, -1.974918, 0.09803922, 1, 0, 1,
-0.463278, -1.876959, -4.225013, 0.09019608, 1, 0, 1,
-0.4622113, -1.946242, -4.076003, 0.08627451, 1, 0, 1,
-0.4599926, -0.08751658, -1.700252, 0.07843138, 1, 0, 1,
-0.4586364, 0.5074689, 0.04188094, 0.07450981, 1, 0, 1,
-0.4545326, -3.290393, -0.9364654, 0.06666667, 1, 0, 1,
-0.4527028, -3.217213, -0.9681103, 0.0627451, 1, 0, 1,
-0.4503883, -0.8877947, -1.974914, 0.05490196, 1, 0, 1,
-0.4502716, 0.3636755, -0.7263919, 0.05098039, 1, 0, 1,
-0.4500916, -1.016236, -2.963226, 0.04313726, 1, 0, 1,
-0.4496539, -1.060277, -1.54003, 0.03921569, 1, 0, 1,
-0.4482009, 0.6487743, -0.1689415, 0.03137255, 1, 0, 1,
-0.4473214, 2.058948, -0.4995269, 0.02745098, 1, 0, 1,
-0.446149, 0.4754965, -1.218896, 0.01960784, 1, 0, 1,
-0.4459345, -0.3475319, -1.710606, 0.01568628, 1, 0, 1,
-0.4422579, -1.006525, -2.126608, 0.007843138, 1, 0, 1,
-0.4374671, -0.5060077, -3.418995, 0.003921569, 1, 0, 1,
-0.4297435, 0.276192, 0.07012828, 0, 1, 0.003921569, 1,
-0.4211115, -0.104138, -1.350684, 0, 1, 0.01176471, 1,
-0.4190533, -0.3359784, -3.300179, 0, 1, 0.01568628, 1,
-0.4188758, 0.1844095, 0.3616504, 0, 1, 0.02352941, 1,
-0.4149211, 0.4613352, 0.1264244, 0, 1, 0.02745098, 1,
-0.40981, -0.05485493, -3.777012, 0, 1, 0.03529412, 1,
-0.4084735, 0.6833996, 0.5671773, 0, 1, 0.03921569, 1,
-0.4082725, -0.8548409, -1.437262, 0, 1, 0.04705882, 1,
-0.4016235, 1.562182, -2.509915, 0, 1, 0.05098039, 1,
-0.3965732, -1.355187, -2.040136, 0, 1, 0.05882353, 1,
-0.3958625, -0.6770642, -2.283223, 0, 1, 0.0627451, 1,
-0.3926748, 0.4664542, 0.8353962, 0, 1, 0.07058824, 1,
-0.3863443, 0.7022407, -1.553578, 0, 1, 0.07450981, 1,
-0.384124, 0.1995217, -2.646734, 0, 1, 0.08235294, 1,
-0.3820109, -0.8942946, -3.421441, 0, 1, 0.08627451, 1,
-0.3748765, -0.794802, -1.931617, 0, 1, 0.09411765, 1,
-0.3746207, 0.3673223, -1.526347, 0, 1, 0.1019608, 1,
-0.3724058, 0.08027223, -1.907837, 0, 1, 0.1058824, 1,
-0.3629446, -1.056733, -2.510126, 0, 1, 0.1137255, 1,
-0.3620527, 0.1228141, -2.174658, 0, 1, 0.1176471, 1,
-0.358995, 2.519713, -0.3106691, 0, 1, 0.1254902, 1,
-0.3579283, -1.004735, -3.303153, 0, 1, 0.1294118, 1,
-0.3577013, -1.184726, -1.953452, 0, 1, 0.1372549, 1,
-0.3546021, 0.7386299, -1.450641, 0, 1, 0.1411765, 1,
-0.353616, 1.348791, -0.02119826, 0, 1, 0.1490196, 1,
-0.3517466, -0.4159502, -2.808894, 0, 1, 0.1529412, 1,
-0.3507025, 1.617223, 1.056582, 0, 1, 0.1607843, 1,
-0.3505005, -0.7575187, 0.08311202, 0, 1, 0.1647059, 1,
-0.3486942, -0.07369733, -2.573626, 0, 1, 0.172549, 1,
-0.3476826, -0.0335571, -3.398393, 0, 1, 0.1764706, 1,
-0.346725, 0.1107443, -2.556658, 0, 1, 0.1843137, 1,
-0.3453334, -1.302376, -2.42717, 0, 1, 0.1882353, 1,
-0.3434812, -1.408912, -3.368766, 0, 1, 0.1960784, 1,
-0.3405978, -0.4022083, -1.781821, 0, 1, 0.2039216, 1,
-0.3398676, -1.57522, -3.828657, 0, 1, 0.2078431, 1,
-0.3397096, -0.9968642, -3.252209, 0, 1, 0.2156863, 1,
-0.3303257, 0.6274188, -1.478658, 0, 1, 0.2196078, 1,
-0.3251602, 1.070629, -0.05366867, 0, 1, 0.227451, 1,
-0.3236366, -0.2034457, -3.745371, 0, 1, 0.2313726, 1,
-0.3225349, -0.5808131, -1.789009, 0, 1, 0.2392157, 1,
-0.3182796, 0.08080995, -0.3970346, 0, 1, 0.2431373, 1,
-0.3120375, -1.338092, -2.535494, 0, 1, 0.2509804, 1,
-0.3097304, -0.3798488, -1.040992, 0, 1, 0.254902, 1,
-0.3020042, 0.8208451, -1.025852, 0, 1, 0.2627451, 1,
-0.3005811, 0.1464107, -2.100337, 0, 1, 0.2666667, 1,
-0.300232, -1.056804, -4.022047, 0, 1, 0.2745098, 1,
-0.2934387, -0.3985473, -3.869885, 0, 1, 0.2784314, 1,
-0.2918986, 0.6209427, -0.2412506, 0, 1, 0.2862745, 1,
-0.2912866, -0.6169752, -1.67022, 0, 1, 0.2901961, 1,
-0.290584, 0.8238892, 1.258055, 0, 1, 0.2980392, 1,
-0.2878254, 0.4051652, -0.140065, 0, 1, 0.3058824, 1,
-0.2863199, -1.102481, -3.620833, 0, 1, 0.3098039, 1,
-0.2772778, -0.5293127, -4.65453, 0, 1, 0.3176471, 1,
-0.2751103, -1.213089, -2.078091, 0, 1, 0.3215686, 1,
-0.2715414, 1.469046, -0.5805688, 0, 1, 0.3294118, 1,
-0.2698289, 0.1438789, -1.374829, 0, 1, 0.3333333, 1,
-0.2691577, 1.139558, -0.9073836, 0, 1, 0.3411765, 1,
-0.2689531, 0.2981866, 1.135859, 0, 1, 0.345098, 1,
-0.2676727, -1.612167, -4.05193, 0, 1, 0.3529412, 1,
-0.2645096, 0.8658973, -1.597468, 0, 1, 0.3568628, 1,
-0.2629922, -0.9485739, -2.995925, 0, 1, 0.3647059, 1,
-0.2616385, -0.1862573, -3.17017, 0, 1, 0.3686275, 1,
-0.2596167, 1.068938, -1.136646, 0, 1, 0.3764706, 1,
-0.2546312, -0.4968123, -2.273781, 0, 1, 0.3803922, 1,
-0.2542149, 0.6347856, -0.2147021, 0, 1, 0.3882353, 1,
-0.2484682, 0.9329473, -0.2511228, 0, 1, 0.3921569, 1,
-0.2383745, -0.6168976, -2.90205, 0, 1, 0.4, 1,
-0.2343482, 0.8106018, -0.168306, 0, 1, 0.4078431, 1,
-0.2321455, -1.586652, -2.878449, 0, 1, 0.4117647, 1,
-0.2316123, -0.7567742, -5.381127, 0, 1, 0.4196078, 1,
-0.2305532, -0.4207158, -2.532469, 0, 1, 0.4235294, 1,
-0.2279335, 1.477774, 0.7112216, 0, 1, 0.4313726, 1,
-0.2272111, -0.9899783, -1.154645, 0, 1, 0.4352941, 1,
-0.2267362, 0.6195304, 1.883226, 0, 1, 0.4431373, 1,
-0.2229316, -0.1071486, -1.700422, 0, 1, 0.4470588, 1,
-0.2215215, -0.5141283, -1.865498, 0, 1, 0.454902, 1,
-0.2137741, 0.2380321, -1.49851, 0, 1, 0.4588235, 1,
-0.211716, -0.4793069, -1.442958, 0, 1, 0.4666667, 1,
-0.2112012, 0.3375099, 0.8708314, 0, 1, 0.4705882, 1,
-0.2018716, -0.3796198, -2.283718, 0, 1, 0.4784314, 1,
-0.2000995, -1.053559, -3.230429, 0, 1, 0.4823529, 1,
-0.1954553, 0.04393937, -3.145056, 0, 1, 0.4901961, 1,
-0.1924557, -1.713842, -2.942359, 0, 1, 0.4941176, 1,
-0.1881181, -0.1043012, -1.194182, 0, 1, 0.5019608, 1,
-0.1846247, -0.2026006, -0.9079737, 0, 1, 0.509804, 1,
-0.1837997, 0.1214272, -1.999325, 0, 1, 0.5137255, 1,
-0.1781746, 0.6605328, -1.193245, 0, 1, 0.5215687, 1,
-0.1713836, -0.1488129, -0.8931657, 0, 1, 0.5254902, 1,
-0.1680723, 1.399243, -0.4227077, 0, 1, 0.5333334, 1,
-0.1650852, 0.5748945, 0.1402739, 0, 1, 0.5372549, 1,
-0.1615003, 0.1286585, -1.702913, 0, 1, 0.5450981, 1,
-0.1596192, -1.797775, -3.145424, 0, 1, 0.5490196, 1,
-0.1580672, 0.3097988, -0.663355, 0, 1, 0.5568628, 1,
-0.156166, 0.3018179, 0.9747051, 0, 1, 0.5607843, 1,
-0.1537285, -0.2935549, -2.359599, 0, 1, 0.5686275, 1,
-0.1533686, 0.7589234, -1.350384, 0, 1, 0.572549, 1,
-0.1529044, -0.2269808, -4.051259, 0, 1, 0.5803922, 1,
-0.1525278, -0.2786852, -2.629372, 0, 1, 0.5843138, 1,
-0.1488706, -0.1977735, -3.835336, 0, 1, 0.5921569, 1,
-0.1482522, -0.3292056, -3.538544, 0, 1, 0.5960785, 1,
-0.1476516, -1.112188, -3.341633, 0, 1, 0.6039216, 1,
-0.14242, -0.1080812, -0.372332, 0, 1, 0.6117647, 1,
-0.1417465, -2.038654, -1.560079, 0, 1, 0.6156863, 1,
-0.139907, 0.6520854, -1.043502, 0, 1, 0.6235294, 1,
-0.1373138, -0.4291967, -4.640064, 0, 1, 0.627451, 1,
-0.1357646, 0.4994919, 0.8220708, 0, 1, 0.6352941, 1,
-0.1318407, -0.4971632, -2.233845, 0, 1, 0.6392157, 1,
-0.1304988, -1.002355, -5.104983, 0, 1, 0.6470588, 1,
-0.1301459, 1.034189, 0.1368687, 0, 1, 0.6509804, 1,
-0.1286208, -0.8787208, -3.885413, 0, 1, 0.6588235, 1,
-0.127157, 0.7556212, -0.995888, 0, 1, 0.6627451, 1,
-0.1263874, -1.886364, -3.147836, 0, 1, 0.6705883, 1,
-0.1237689, 1.588018, -0.4755794, 0, 1, 0.6745098, 1,
-0.1206287, -0.6100446, -3.075596, 0, 1, 0.682353, 1,
-0.1183207, -1.321138, -1.881201, 0, 1, 0.6862745, 1,
-0.1172066, 0.6617512, 0.1603125, 0, 1, 0.6941177, 1,
-0.1167075, -0.512944, -3.045111, 0, 1, 0.7019608, 1,
-0.1153963, 1.114801, -0.393861, 0, 1, 0.7058824, 1,
-0.1123828, -0.7274121, -2.612467, 0, 1, 0.7137255, 1,
-0.1100273, -0.2124978, -2.371948, 0, 1, 0.7176471, 1,
-0.1051786, 0.03753366, -0.8845357, 0, 1, 0.7254902, 1,
-0.1026911, 0.3266695, -0.9423339, 0, 1, 0.7294118, 1,
-0.1012384, -0.4956118, -3.757527, 0, 1, 0.7372549, 1,
-0.1009717, -2.230113, -2.614191, 0, 1, 0.7411765, 1,
-0.09996305, -0.3737291, -2.369934, 0, 1, 0.7490196, 1,
-0.09810007, -0.6913922, -3.386376, 0, 1, 0.7529412, 1,
-0.09717843, 2.449296, 0.102876, 0, 1, 0.7607843, 1,
-0.09358606, -1.116779, -3.639445, 0, 1, 0.7647059, 1,
-0.09068168, -0.7891281, -4.985234, 0, 1, 0.772549, 1,
-0.08463784, -1.296679, -3.949854, 0, 1, 0.7764706, 1,
-0.08390095, -0.03074261, -1.147817, 0, 1, 0.7843137, 1,
-0.08040452, -0.3002741, -2.870498, 0, 1, 0.7882353, 1,
-0.07895371, -1.905519, -1.875744, 0, 1, 0.7960784, 1,
-0.07555512, -0.4443512, -1.647432, 0, 1, 0.8039216, 1,
-0.07200542, 0.6359923, -0.9870825, 0, 1, 0.8078431, 1,
-0.07178559, 0.03862207, -1.70584, 0, 1, 0.8156863, 1,
-0.06721699, -1.141453, -5.83549, 0, 1, 0.8196079, 1,
-0.06545658, -0.5716134, -2.251778, 0, 1, 0.827451, 1,
-0.06486552, 2.565228, 1.153007, 0, 1, 0.8313726, 1,
-0.06129532, -0.4920247, -4.145705, 0, 1, 0.8392157, 1,
-0.05945371, -0.6167458, -1.788978, 0, 1, 0.8431373, 1,
-0.05866857, 0.360824, 1.580828, 0, 1, 0.8509804, 1,
-0.05692558, -1.986656, -3.008932, 0, 1, 0.854902, 1,
-0.04722706, -1.840332, -4.096151, 0, 1, 0.8627451, 1,
-0.04158503, 0.6357948, -1.413898, 0, 1, 0.8666667, 1,
-0.04141907, -1.258009, -1.336014, 0, 1, 0.8745098, 1,
-0.0400641, 0.9448513, 0.1686201, 0, 1, 0.8784314, 1,
-0.03600661, -1.01816, -4.278393, 0, 1, 0.8862745, 1,
-0.03520834, -0.6929526, -1.997676, 0, 1, 0.8901961, 1,
-0.0339205, 0.9856417, 0.198172, 0, 1, 0.8980392, 1,
-0.03094846, -1.883055, -3.961778, 0, 1, 0.9058824, 1,
-0.02995735, -0.2462965, -2.55184, 0, 1, 0.9098039, 1,
-0.02914133, 0.693069, 0.8762773, 0, 1, 0.9176471, 1,
-0.01798724, -0.07421476, -2.448462, 0, 1, 0.9215686, 1,
-0.01664994, 2.414535, -0.03969233, 0, 1, 0.9294118, 1,
-0.01447734, 0.8264891, -1.238044, 0, 1, 0.9333333, 1,
-0.008757404, 0.1855503, -0.08439962, 0, 1, 0.9411765, 1,
-0.007033619, 0.3411455, 1.128896, 0, 1, 0.945098, 1,
-0.006760202, 0.6277065, -0.4825221, 0, 1, 0.9529412, 1,
-0.004590108, 2.046373, -1.833059, 0, 1, 0.9568627, 1,
-0.004198084, 1.821997, -1.168393, 0, 1, 0.9647059, 1,
-0.003356409, -1.071835, -3.41937, 0, 1, 0.9686275, 1,
0.001352637, -2.057319, 3.920569, 0, 1, 0.9764706, 1,
0.002580913, 0.4752391, -0.5653374, 0, 1, 0.9803922, 1,
0.003119989, -0.492861, 4.557299, 0, 1, 0.9882353, 1,
0.003857193, -1.659586, 3.593869, 0, 1, 0.9921569, 1,
0.005960576, 0.2985677, -0.331173, 0, 1, 1, 1,
0.01362427, -0.2301432, 3.757922, 0, 0.9921569, 1, 1,
0.01429649, 0.3642995, -0.6201734, 0, 0.9882353, 1, 1,
0.01446045, 1.132825, -0.5368603, 0, 0.9803922, 1, 1,
0.02006203, 0.5901253, 1.097245, 0, 0.9764706, 1, 1,
0.0228778, 0.9848492, 0.4093127, 0, 0.9686275, 1, 1,
0.02613178, 0.5155646, 0.5817031, 0, 0.9647059, 1, 1,
0.02661951, -1.881916, 2.686736, 0, 0.9568627, 1, 1,
0.0286856, 0.255343, -0.8258786, 0, 0.9529412, 1, 1,
0.03273685, -0.4570355, 3.76764, 0, 0.945098, 1, 1,
0.03400761, -0.01961823, 1.912399, 0, 0.9411765, 1, 1,
0.03948417, -1.603535, 2.405321, 0, 0.9333333, 1, 1,
0.04293754, -0.8058551, 1.602661, 0, 0.9294118, 1, 1,
0.04568682, 2.078022, -1.690449, 0, 0.9215686, 1, 1,
0.04838092, 1.669484, -0.2379572, 0, 0.9176471, 1, 1,
0.04842104, 0.01426126, 3.232637, 0, 0.9098039, 1, 1,
0.04957463, -0.7333276, 4.485128, 0, 0.9058824, 1, 1,
0.05246659, -0.847831, 2.693607, 0, 0.8980392, 1, 1,
0.05661819, 2.157505, 0.9969409, 0, 0.8901961, 1, 1,
0.0592701, -0.4155498, 2.404041, 0, 0.8862745, 1, 1,
0.05934722, -1.157552, 2.414088, 0, 0.8784314, 1, 1,
0.05975141, 1.454515, -0.2721869, 0, 0.8745098, 1, 1,
0.0677257, -0.2364278, 3.074077, 0, 0.8666667, 1, 1,
0.06987142, -0.6448796, 3.153497, 0, 0.8627451, 1, 1,
0.07177728, 1.392946, 0.04076527, 0, 0.854902, 1, 1,
0.0729614, -1.746512, 3.013741, 0, 0.8509804, 1, 1,
0.07419887, -1.24158, 4.590048, 0, 0.8431373, 1, 1,
0.07553177, 0.5921685, 1.419547, 0, 0.8392157, 1, 1,
0.07629706, -1.628459, 2.63169, 0, 0.8313726, 1, 1,
0.07679705, -0.8535135, 3.722461, 0, 0.827451, 1, 1,
0.0798493, -1.397025, 3.356402, 0, 0.8196079, 1, 1,
0.08309799, 0.6419157, 0.05241938, 0, 0.8156863, 1, 1,
0.08342522, 0.3081438, 0.5440348, 0, 0.8078431, 1, 1,
0.08381854, 0.8756746, -2.06014, 0, 0.8039216, 1, 1,
0.09199182, -1.215589, 3.255733, 0, 0.7960784, 1, 1,
0.09414404, -0.4657549, 3.598122, 0, 0.7882353, 1, 1,
0.09430362, 0.8099223, 0.06991037, 0, 0.7843137, 1, 1,
0.09794643, 1.988315, -0.3176602, 0, 0.7764706, 1, 1,
0.1033828, -0.461567, 2.883833, 0, 0.772549, 1, 1,
0.1044374, 0.1170822, 1.95328, 0, 0.7647059, 1, 1,
0.1049346, 0.136153, 0.06229962, 0, 0.7607843, 1, 1,
0.1067455, -1.218126, 2.053994, 0, 0.7529412, 1, 1,
0.1135712, 1.114109, -0.2062242, 0, 0.7490196, 1, 1,
0.1142945, 2.56031, -0.7083724, 0, 0.7411765, 1, 1,
0.1150161, -0.2880569, 1.665481, 0, 0.7372549, 1, 1,
0.1156515, -0.1529461, 2.045179, 0, 0.7294118, 1, 1,
0.1164367, -1.002607, 3.808094, 0, 0.7254902, 1, 1,
0.1186222, 0.4213172, 1.216572, 0, 0.7176471, 1, 1,
0.1293179, -0.4699125, 4.395884, 0, 0.7137255, 1, 1,
0.1300345, 1.341285, 0.5654975, 0, 0.7058824, 1, 1,
0.1344139, -0.1349251, 3.736854, 0, 0.6980392, 1, 1,
0.1381, 0.4810087, 1.06408, 0, 0.6941177, 1, 1,
0.1384254, -0.3384294, 3.306253, 0, 0.6862745, 1, 1,
0.1403547, 0.01506484, 0.3523276, 0, 0.682353, 1, 1,
0.1418693, 0.5138517, -0.6638437, 0, 0.6745098, 1, 1,
0.1462696, -0.4978562, 2.295933, 0, 0.6705883, 1, 1,
0.1471281, -1.775723, 2.553553, 0, 0.6627451, 1, 1,
0.149426, 0.4841887, -1.396265, 0, 0.6588235, 1, 1,
0.1516148, -0.9209764, 2.383048, 0, 0.6509804, 1, 1,
0.1530224, 0.5689275, -0.9603981, 0, 0.6470588, 1, 1,
0.1538519, -0.9967653, 2.096279, 0, 0.6392157, 1, 1,
0.1581154, -1.701158, 2.780765, 0, 0.6352941, 1, 1,
0.1582151, -0.6734458, 2.999475, 0, 0.627451, 1, 1,
0.1591311, 0.4175174, 0.2136283, 0, 0.6235294, 1, 1,
0.1594001, -0.6970357, 1.575312, 0, 0.6156863, 1, 1,
0.1604598, -0.8685357, 3.135059, 0, 0.6117647, 1, 1,
0.1605067, -0.5827994, 1.999668, 0, 0.6039216, 1, 1,
0.1613614, -0.6464214, 2.021617, 0, 0.5960785, 1, 1,
0.1623408, -0.004101339, 0.3624585, 0, 0.5921569, 1, 1,
0.1630074, 0.7756451, -0.1973529, 0, 0.5843138, 1, 1,
0.1645316, -0.569489, 5.442023, 0, 0.5803922, 1, 1,
0.1687606, -0.1132894, 1.120727, 0, 0.572549, 1, 1,
0.1723729, -1.239247, 1.55773, 0, 0.5686275, 1, 1,
0.1750897, 0.9659587, 0.1864855, 0, 0.5607843, 1, 1,
0.1753921, 0.6310699, -0.07626108, 0, 0.5568628, 1, 1,
0.1763105, 0.561338, -0.2690652, 0, 0.5490196, 1, 1,
0.1775786, -0.4115358, 3.062577, 0, 0.5450981, 1, 1,
0.1804794, 0.7530426, 1.047528, 0, 0.5372549, 1, 1,
0.1822291, -0.6454592, 3.188058, 0, 0.5333334, 1, 1,
0.1836587, -0.9394081, 4.038045, 0, 0.5254902, 1, 1,
0.1851489, -0.06635673, 2.99577, 0, 0.5215687, 1, 1,
0.1859901, -0.88485, 2.033299, 0, 0.5137255, 1, 1,
0.1918741, -0.08155791, 2.897006, 0, 0.509804, 1, 1,
0.1958653, 0.1177713, 0.7502905, 0, 0.5019608, 1, 1,
0.1960728, 3.130145, 0.1610606, 0, 0.4941176, 1, 1,
0.1982985, -1.993407, 2.809649, 0, 0.4901961, 1, 1,
0.1998236, -0.7196705, 3.512733, 0, 0.4823529, 1, 1,
0.2026029, 0.9977431, 1.630275, 0, 0.4784314, 1, 1,
0.2074968, 0.2356616, -0.3822265, 0, 0.4705882, 1, 1,
0.209197, -0.06658228, 2.027492, 0, 0.4666667, 1, 1,
0.2095006, 0.2931927, 2.632414, 0, 0.4588235, 1, 1,
0.2194903, -1.364866, 3.020227, 0, 0.454902, 1, 1,
0.2223681, 0.5187231, -0.4936599, 0, 0.4470588, 1, 1,
0.2243466, -0.2795796, 3.314016, 0, 0.4431373, 1, 1,
0.2262338, -0.2249523, 2.09281, 0, 0.4352941, 1, 1,
0.2355745, 0.5837478, 1.231762, 0, 0.4313726, 1, 1,
0.2394343, 0.4940851, 1.749631, 0, 0.4235294, 1, 1,
0.2480253, 0.5039621, -0.64767, 0, 0.4196078, 1, 1,
0.2491971, 0.439592, -0.1491879, 0, 0.4117647, 1, 1,
0.2504003, -0.9655361, 2.895521, 0, 0.4078431, 1, 1,
0.2532607, 1.505683, -0.6431407, 0, 0.4, 1, 1,
0.2544809, -1.35447, 1.704245, 0, 0.3921569, 1, 1,
0.254932, 0.5015882, -1.418028, 0, 0.3882353, 1, 1,
0.256685, 0.3001941, 0.3073213, 0, 0.3803922, 1, 1,
0.261002, -0.8127062, 3.10311, 0, 0.3764706, 1, 1,
0.2615795, -0.6508082, 3.509102, 0, 0.3686275, 1, 1,
0.2657014, -0.406179, 0.730635, 0, 0.3647059, 1, 1,
0.2658349, 1.05704, -0.8827044, 0, 0.3568628, 1, 1,
0.2706879, -0.2161291, 2.659838, 0, 0.3529412, 1, 1,
0.2710979, -1.791111, 1.356258, 0, 0.345098, 1, 1,
0.2744756, 1.118666, 1.88608, 0, 0.3411765, 1, 1,
0.2773777, 0.1984728, 1.505111, 0, 0.3333333, 1, 1,
0.2789797, -0.5211034, 5.289231, 0, 0.3294118, 1, 1,
0.2844687, -0.2190266, 2.892313, 0, 0.3215686, 1, 1,
0.2855956, -1.114265, 2.018343, 0, 0.3176471, 1, 1,
0.2908859, 1.807526, 0.9895639, 0, 0.3098039, 1, 1,
0.2912809, 0.9596968, 0.4772854, 0, 0.3058824, 1, 1,
0.2928241, -0.738212, 2.960904, 0, 0.2980392, 1, 1,
0.2943611, 0.2236055, 2.792757, 0, 0.2901961, 1, 1,
0.2960786, -0.3349458, 0.2247666, 0, 0.2862745, 1, 1,
0.2965103, -1.677298, 3.249129, 0, 0.2784314, 1, 1,
0.2975588, 0.1144979, 1.066001, 0, 0.2745098, 1, 1,
0.297703, 0.027098, 2.678038, 0, 0.2666667, 1, 1,
0.2977097, -0.6096719, 3.893524, 0, 0.2627451, 1, 1,
0.2981253, 0.6271719, 1.728011, 0, 0.254902, 1, 1,
0.3007802, -0.6603159, 3.889089, 0, 0.2509804, 1, 1,
0.3011134, -0.9667557, 2.258631, 0, 0.2431373, 1, 1,
0.3021592, 0.6350883, 2.068783, 0, 0.2392157, 1, 1,
0.3038885, -1.497425, 4.046301, 0, 0.2313726, 1, 1,
0.3109611, -0.7689233, 2.086238, 0, 0.227451, 1, 1,
0.3114375, -0.7852257, 1.836251, 0, 0.2196078, 1, 1,
0.3121506, 1.808571, 0.6953052, 0, 0.2156863, 1, 1,
0.3132063, 0.3138005, 1.050429, 0, 0.2078431, 1, 1,
0.3171441, -0.04200123, 3.248417, 0, 0.2039216, 1, 1,
0.3180641, -0.271066, 3.461728, 0, 0.1960784, 1, 1,
0.3195165, -0.3434586, 3.594694, 0, 0.1882353, 1, 1,
0.319593, -0.9390539, 4.047572, 0, 0.1843137, 1, 1,
0.3199284, -0.2883016, 1.610355, 0, 0.1764706, 1, 1,
0.321239, 1.200928, 1.99574, 0, 0.172549, 1, 1,
0.3229558, -1.557282, 1.493621, 0, 0.1647059, 1, 1,
0.3282906, 1.608941, 0.8106248, 0, 0.1607843, 1, 1,
0.3297386, -0.07137403, 1.172772, 0, 0.1529412, 1, 1,
0.330316, 1.284294, -0.2524592, 0, 0.1490196, 1, 1,
0.3325976, 0.4302903, 0.3716607, 0, 0.1411765, 1, 1,
0.3363452, -0.5066234, 2.620682, 0, 0.1372549, 1, 1,
0.3363459, -0.9202548, 3.089227, 0, 0.1294118, 1, 1,
0.3374593, -0.6150151, 1.718331, 0, 0.1254902, 1, 1,
0.3377645, 0.753881, -0.8550809, 0, 0.1176471, 1, 1,
0.3384045, 0.9383428, 1.263602, 0, 0.1137255, 1, 1,
0.3409854, 0.2075873, 0.4139572, 0, 0.1058824, 1, 1,
0.3435822, 1.052903, -0.1925362, 0, 0.09803922, 1, 1,
0.3508056, 1.540473, -2.485895, 0, 0.09411765, 1, 1,
0.3518079, -0.1804786, 1.863852, 0, 0.08627451, 1, 1,
0.3614985, -1.654891, 3.094805, 0, 0.08235294, 1, 1,
0.3618893, 2.040175, 0.1795804, 0, 0.07450981, 1, 1,
0.3628058, 1.923089, 0.6968613, 0, 0.07058824, 1, 1,
0.3635553, -1.409724, 3.76042, 0, 0.0627451, 1, 1,
0.3644292, 0.03464038, 0.08317342, 0, 0.05882353, 1, 1,
0.3685018, -0.04146173, 2.939066, 0, 0.05098039, 1, 1,
0.3697416, -0.4705374, 2.226822, 0, 0.04705882, 1, 1,
0.370056, 0.69414, 0.206703, 0, 0.03921569, 1, 1,
0.3762705, -0.7531486, 3.888298, 0, 0.03529412, 1, 1,
0.3773671, -0.8900422, 3.443755, 0, 0.02745098, 1, 1,
0.3781729, 0.3459359, -2.067111, 0, 0.02352941, 1, 1,
0.3789909, -0.9102616, 2.469713, 0, 0.01568628, 1, 1,
0.3834141, -0.1083047, 2.752437, 0, 0.01176471, 1, 1,
0.3838532, -2.836082, 2.33318, 0, 0.003921569, 1, 1,
0.3925286, 1.913147, -0.4280908, 0.003921569, 0, 1, 1,
0.3934831, 0.893783, -2.062952, 0.007843138, 0, 1, 1,
0.4001862, -0.3977111, 2.280525, 0.01568628, 0, 1, 1,
0.4031961, -2.505178, 0.8095659, 0.01960784, 0, 1, 1,
0.4062363, 0.3498875, 0.1649872, 0.02745098, 0, 1, 1,
0.4085821, 0.4120565, 1.32029, 0.03137255, 0, 1, 1,
0.4095422, -0.6568722, 1.830461, 0.03921569, 0, 1, 1,
0.4103092, 1.561701, 1.321754, 0.04313726, 0, 1, 1,
0.4103317, 0.01429086, 2.046587, 0.05098039, 0, 1, 1,
0.4108543, -1.281249, 1.608268, 0.05490196, 0, 1, 1,
0.4116475, -1.840508, 2.430223, 0.0627451, 0, 1, 1,
0.4132772, -0.6605392, 1.403626, 0.06666667, 0, 1, 1,
0.4213349, -1.006147, 2.888555, 0.07450981, 0, 1, 1,
0.4249263, 2.115891, 0.3333593, 0.07843138, 0, 1, 1,
0.4318423, 0.4847935, 2.505599, 0.08627451, 0, 1, 1,
0.4342846, 1.302646, 0.2590698, 0.09019608, 0, 1, 1,
0.4343532, -0.2341001, 1.389107, 0.09803922, 0, 1, 1,
0.4373782, 2.198, 0.9827681, 0.1058824, 0, 1, 1,
0.4375, 0.08832117, 1.61971, 0.1098039, 0, 1, 1,
0.4454295, -0.3370114, 2.126592, 0.1176471, 0, 1, 1,
0.4496934, 0.9372028, 0.2601105, 0.1215686, 0, 1, 1,
0.4535956, -0.4042825, 0.8167465, 0.1294118, 0, 1, 1,
0.458988, 0.4302501, 1.298967, 0.1333333, 0, 1, 1,
0.4638953, 0.1167876, 1.66968, 0.1411765, 0, 1, 1,
0.4650594, 1.224629, 0.387553, 0.145098, 0, 1, 1,
0.4664821, -0.2427286, 2.780567, 0.1529412, 0, 1, 1,
0.4672759, 0.167147, 2.723462, 0.1568628, 0, 1, 1,
0.4738809, -1.079112, 1.307355, 0.1647059, 0, 1, 1,
0.4753158, -0.09594918, 0.9103515, 0.1686275, 0, 1, 1,
0.4765347, 0.1540102, 0.3175914, 0.1764706, 0, 1, 1,
0.4766874, 0.6696333, 1.846798, 0.1803922, 0, 1, 1,
0.4769345, 0.9998562, -0.657681, 0.1882353, 0, 1, 1,
0.4800785, -0.1609141, 1.369647, 0.1921569, 0, 1, 1,
0.4809273, -1.005291, 3.573441, 0.2, 0, 1, 1,
0.484122, -0.6590236, 2.081359, 0.2078431, 0, 1, 1,
0.4879235, 0.3249832, 0.1513628, 0.2117647, 0, 1, 1,
0.4906163, 1.253485, 1.842793, 0.2196078, 0, 1, 1,
0.4936464, -0.7795042, 2.927452, 0.2235294, 0, 1, 1,
0.4948412, -0.7938148, 3.676514, 0.2313726, 0, 1, 1,
0.4958961, -0.7578294, 3.834575, 0.2352941, 0, 1, 1,
0.4979103, -0.2924625, 3.877016, 0.2431373, 0, 1, 1,
0.506117, 1.803737, 1.165963, 0.2470588, 0, 1, 1,
0.5082282, -0.8926594, 1.909919, 0.254902, 0, 1, 1,
0.5095977, -0.3298446, 2.916718, 0.2588235, 0, 1, 1,
0.512078, 0.564151, 0.9938464, 0.2666667, 0, 1, 1,
0.5121709, 0.6189903, 2.400381, 0.2705882, 0, 1, 1,
0.5131994, -0.6777279, 3.129758, 0.2784314, 0, 1, 1,
0.518427, 0.008956173, 0.170316, 0.282353, 0, 1, 1,
0.5184675, 0.7096493, 1.295703, 0.2901961, 0, 1, 1,
0.5288262, -0.2030581, 3.36289, 0.2941177, 0, 1, 1,
0.5306062, -0.3034043, 1.486882, 0.3019608, 0, 1, 1,
0.5374752, 0.5855718, 0.6312943, 0.3098039, 0, 1, 1,
0.5389882, 1.406739, -0.05949004, 0.3137255, 0, 1, 1,
0.5393098, -0.05708061, 1.124268, 0.3215686, 0, 1, 1,
0.5399831, -0.1846955, 1.986161, 0.3254902, 0, 1, 1,
0.5411599, 0.5062601, 0.3947473, 0.3333333, 0, 1, 1,
0.5423483, 0.7771941, 1.187916, 0.3372549, 0, 1, 1,
0.5429024, -0.5618643, 3.018965, 0.345098, 0, 1, 1,
0.5497307, -0.1476056, 4.168783, 0.3490196, 0, 1, 1,
0.5526426, -1.29973, 2.204599, 0.3568628, 0, 1, 1,
0.5582938, 0.6578984, 2.661738, 0.3607843, 0, 1, 1,
0.561468, 0.7138011, 0.5688073, 0.3686275, 0, 1, 1,
0.5661995, -0.5878141, 3.236699, 0.372549, 0, 1, 1,
0.5664667, 1.898404, 0.7727637, 0.3803922, 0, 1, 1,
0.5768712, 0.1663472, 0.3435143, 0.3843137, 0, 1, 1,
0.57886, 0.2648976, 1.729937, 0.3921569, 0, 1, 1,
0.5858277, -1.660501, 2.840853, 0.3960784, 0, 1, 1,
0.5965126, -0.01670862, 1.342728, 0.4039216, 0, 1, 1,
0.5970495, 0.3574415, 2.856053, 0.4117647, 0, 1, 1,
0.5997204, -0.06291745, 0.2471963, 0.4156863, 0, 1, 1,
0.6018645, -0.1007933, 1.533749, 0.4235294, 0, 1, 1,
0.6019185, 0.03767824, 1.454673, 0.427451, 0, 1, 1,
0.6045699, -1.320366, 1.986116, 0.4352941, 0, 1, 1,
0.6056932, 0.163905, 0.7362003, 0.4392157, 0, 1, 1,
0.6064615, -0.3990521, 2.25483, 0.4470588, 0, 1, 1,
0.6156471, 2.920816, -0.1338148, 0.4509804, 0, 1, 1,
0.623855, 0.2883369, 1.099709, 0.4588235, 0, 1, 1,
0.6246484, -1.154973, 4.900518, 0.4627451, 0, 1, 1,
0.6260411, -0.2049948, 2.399555, 0.4705882, 0, 1, 1,
0.627464, 0.881278, 0.5082981, 0.4745098, 0, 1, 1,
0.6305952, -0.4685372, 2.003207, 0.4823529, 0, 1, 1,
0.6425301, 0.05272539, -0.1791766, 0.4862745, 0, 1, 1,
0.6431674, -1.042974, 2.668001, 0.4941176, 0, 1, 1,
0.6434571, 0.9457293, 1.726236, 0.5019608, 0, 1, 1,
0.6454263, -0.1271332, 1.73046, 0.5058824, 0, 1, 1,
0.6456938, 1.044695, 1.175482, 0.5137255, 0, 1, 1,
0.6514531, 0.174656, -0.1074054, 0.5176471, 0, 1, 1,
0.6528643, -0.06170011, 0.7915704, 0.5254902, 0, 1, 1,
0.6555763, -0.6115168, 2.167454, 0.5294118, 0, 1, 1,
0.6648292, 0.2326785, 2.33473, 0.5372549, 0, 1, 1,
0.6659877, -0.9293005, 2.460767, 0.5411765, 0, 1, 1,
0.6668511, 0.4059609, 1.687828, 0.5490196, 0, 1, 1,
0.6738536, -2.634027, 3.166224, 0.5529412, 0, 1, 1,
0.6753263, -0.08026419, 3.381354, 0.5607843, 0, 1, 1,
0.6756647, -1.6735, 4.651199, 0.5647059, 0, 1, 1,
0.6806634, -0.07482003, 1.525578, 0.572549, 0, 1, 1,
0.6863273, -0.03747753, 1.669337, 0.5764706, 0, 1, 1,
0.686491, 1.455906, 0.2202617, 0.5843138, 0, 1, 1,
0.6938583, 0.1588037, 0.4833967, 0.5882353, 0, 1, 1,
0.6966114, 0.2290041, 2.143636, 0.5960785, 0, 1, 1,
0.6968165, 0.4437438, 0.005238851, 0.6039216, 0, 1, 1,
0.7075876, -1.602518, 2.238645, 0.6078432, 0, 1, 1,
0.7109727, -0.7542388, 3.430544, 0.6156863, 0, 1, 1,
0.7136056, 0.263776, 0.4208919, 0.6196079, 0, 1, 1,
0.7151495, 0.2388398, 2.782255, 0.627451, 0, 1, 1,
0.7152081, 1.193142, 0.7110963, 0.6313726, 0, 1, 1,
0.7162168, 1.091567, 0.1103733, 0.6392157, 0, 1, 1,
0.716903, -0.6106034, 2.349058, 0.6431373, 0, 1, 1,
0.7172647, 0.2397716, 0.1519648, 0.6509804, 0, 1, 1,
0.7197922, -1.205543, 1.044607, 0.654902, 0, 1, 1,
0.723839, -1.359396, 1.197512, 0.6627451, 0, 1, 1,
0.7240729, -1.252786, 2.174292, 0.6666667, 0, 1, 1,
0.7246454, -0.4526283, 2.602015, 0.6745098, 0, 1, 1,
0.7259001, -0.5342523, 2.216496, 0.6784314, 0, 1, 1,
0.7260837, 1.573717, 2.916264, 0.6862745, 0, 1, 1,
0.7262651, 1.085954, 0.9388654, 0.6901961, 0, 1, 1,
0.732173, -1.022825, 3.643868, 0.6980392, 0, 1, 1,
0.7362217, -0.1738861, 2.63807, 0.7058824, 0, 1, 1,
0.7427675, 0.0885106, 1.159954, 0.7098039, 0, 1, 1,
0.7450014, 0.4705075, -0.2753137, 0.7176471, 0, 1, 1,
0.7485737, -0.2373545, 2.631943, 0.7215686, 0, 1, 1,
0.7509027, 1.266645, 1.140916, 0.7294118, 0, 1, 1,
0.7515763, 0.4379036, 2.826844, 0.7333333, 0, 1, 1,
0.7674885, 0.735141, 1.015944, 0.7411765, 0, 1, 1,
0.768997, -0.2468138, 0.9268307, 0.7450981, 0, 1, 1,
0.769383, -0.6534237, 2.154772, 0.7529412, 0, 1, 1,
0.7787197, -0.0824516, 2.935112, 0.7568628, 0, 1, 1,
0.7807027, -1.623159, 2.078835, 0.7647059, 0, 1, 1,
0.7809804, 1.729192, 1.151257, 0.7686275, 0, 1, 1,
0.7885378, 2.29136, 0.6487765, 0.7764706, 0, 1, 1,
0.7900958, 0.1426893, 1.271211, 0.7803922, 0, 1, 1,
0.7903707, -0.06603669, 0.473274, 0.7882353, 0, 1, 1,
0.7942157, 0.04647509, 1.025094, 0.7921569, 0, 1, 1,
0.7990559, -0.5076571, 2.986383, 0.8, 0, 1, 1,
0.8020695, 0.08758356, 1.395783, 0.8078431, 0, 1, 1,
0.8032749, -2.252434, 3.797428, 0.8117647, 0, 1, 1,
0.8105311, 0.2238517, 1.331685, 0.8196079, 0, 1, 1,
0.813624, 0.7790076, 0.4882582, 0.8235294, 0, 1, 1,
0.818364, -1.202747, 4.478977, 0.8313726, 0, 1, 1,
0.8187426, 0.08332335, 3.49096, 0.8352941, 0, 1, 1,
0.8211226, -0.7527443, 1.805534, 0.8431373, 0, 1, 1,
0.8214296, 0.7468027, 0.5410661, 0.8470588, 0, 1, 1,
0.8237541, 0.4378735, -1.342222, 0.854902, 0, 1, 1,
0.8313192, 0.102888, -1.263934, 0.8588235, 0, 1, 1,
0.840461, -0.6082674, 1.618696, 0.8666667, 0, 1, 1,
0.8430234, -0.6383758, 3.813431, 0.8705882, 0, 1, 1,
0.8521487, -2.232684e-05, 1.71023, 0.8784314, 0, 1, 1,
0.8537123, -0.9556243, 2.61226, 0.8823529, 0, 1, 1,
0.8624311, 0.3483194, 2.716665, 0.8901961, 0, 1, 1,
0.8658577, 0.06309228, 1.396764, 0.8941177, 0, 1, 1,
0.8667056, 0.8839256, 0.8432207, 0.9019608, 0, 1, 1,
0.8722863, -1.509459, 2.963876, 0.9098039, 0, 1, 1,
0.8806512, -0.319732, 2.158765, 0.9137255, 0, 1, 1,
0.882141, -0.8934814, 1.880835, 0.9215686, 0, 1, 1,
0.8826326, -0.9243638, 1.570142, 0.9254902, 0, 1, 1,
0.8846388, -0.752451, 0.9438779, 0.9333333, 0, 1, 1,
0.8858841, 1.297274, -0.1170756, 0.9372549, 0, 1, 1,
0.8885282, 1.6927, 0.439371, 0.945098, 0, 1, 1,
0.89456, -1.449326, 3.038642, 0.9490196, 0, 1, 1,
0.8946975, -0.5119664, 2.430231, 0.9568627, 0, 1, 1,
0.8983617, 1.617632, 0.5269991, 0.9607843, 0, 1, 1,
0.9024334, 0.7178962, 2.738844, 0.9686275, 0, 1, 1,
0.9164571, -0.9886903, 2.246703, 0.972549, 0, 1, 1,
0.9335253, -0.6042648, 2.380465, 0.9803922, 0, 1, 1,
0.9373363, 0.1799756, 1.201922, 0.9843137, 0, 1, 1,
0.9416131, 1.061167, 0.7482446, 0.9921569, 0, 1, 1,
0.9454254, -0.2254613, 1.878626, 0.9960784, 0, 1, 1,
0.9468971, -0.4906762, 2.920342, 1, 0, 0.9960784, 1,
0.956972, 1.298849, 1.524561, 1, 0, 0.9882353, 1,
0.9596673, -1.617848, -0.3728049, 1, 0, 0.9843137, 1,
0.9664424, 1.165776, 0.6860053, 1, 0, 0.9764706, 1,
0.9716216, 1.050046, 0.3460312, 1, 0, 0.972549, 1,
0.9732021, -0.3210028, 1.22496, 1, 0, 0.9647059, 1,
0.9766358, -0.3475022, 1.70707, 1, 0, 0.9607843, 1,
0.9782217, -1.019787, 2.926734, 1, 0, 0.9529412, 1,
0.979982, 0.5668345, 0.3832924, 1, 0, 0.9490196, 1,
0.9800637, 0.6884357, 0.687907, 1, 0, 0.9411765, 1,
0.9884022, -0.10341, 0.2588814, 1, 0, 0.9372549, 1,
0.989184, -1.074833, 0.03680552, 1, 0, 0.9294118, 1,
0.9908642, -0.1786755, 1.671877, 1, 0, 0.9254902, 1,
0.9928938, 0.1188893, 3.604334, 1, 0, 0.9176471, 1,
0.9959348, -1.046409, 1.774609, 1, 0, 0.9137255, 1,
1.016062, 0.09953535, 2.24271, 1, 0, 0.9058824, 1,
1.025988, -1.649942, 3.538183, 1, 0, 0.9019608, 1,
1.029717, 0.9444363, -0.7352893, 1, 0, 0.8941177, 1,
1.03282, 1.233101, 0.4949549, 1, 0, 0.8862745, 1,
1.034151, -0.8961527, 2.852159, 1, 0, 0.8823529, 1,
1.036043, 0.5136404, 0.3524058, 1, 0, 0.8745098, 1,
1.037518, -1.452945, 3.277665, 1, 0, 0.8705882, 1,
1.039938, 0.5247107, 1.724103, 1, 0, 0.8627451, 1,
1.043522, -0.8364884, 2.061481, 1, 0, 0.8588235, 1,
1.050606, 0.6962066, 0.9846816, 1, 0, 0.8509804, 1,
1.059063, -1.096098, 2.210066, 1, 0, 0.8470588, 1,
1.077117, -0.8199849, 1.646018, 1, 0, 0.8392157, 1,
1.083237, 0.2532124, 0.9018513, 1, 0, 0.8352941, 1,
1.084304, -1.302229, 2.619022, 1, 0, 0.827451, 1,
1.093082, -0.4070371, 1.857487, 1, 0, 0.8235294, 1,
1.094915, -0.7980354, 3.891958, 1, 0, 0.8156863, 1,
1.107679, 0.3644867, 0.7790046, 1, 0, 0.8117647, 1,
1.109333, -0.3402361, 2.999071, 1, 0, 0.8039216, 1,
1.116172, 0.5985092, 0.4301446, 1, 0, 0.7960784, 1,
1.116224, 0.8466573, 0.5353862, 1, 0, 0.7921569, 1,
1.120064, 0.4777547, 0.0567545, 1, 0, 0.7843137, 1,
1.120969, 1.126966, 1.410464, 1, 0, 0.7803922, 1,
1.124244, 0.9721729, 2.194396, 1, 0, 0.772549, 1,
1.132774, -0.1408729, 4.039183, 1, 0, 0.7686275, 1,
1.141781, -0.831683, 2.007668, 1, 0, 0.7607843, 1,
1.144947, 0.6844006, 0.5045131, 1, 0, 0.7568628, 1,
1.146234, -1.0222, 1.601303, 1, 0, 0.7490196, 1,
1.154815, 0.1219418, 2.311519, 1, 0, 0.7450981, 1,
1.157496, 0.6807998, 0.4993044, 1, 0, 0.7372549, 1,
1.16025, -0.51191, 2.823871, 1, 0, 0.7333333, 1,
1.165116, -0.6107673, 2.311728, 1, 0, 0.7254902, 1,
1.165345, -1.238519, 1.629133, 1, 0, 0.7215686, 1,
1.181271, 0.6155947, 0.7939416, 1, 0, 0.7137255, 1,
1.185644, 0.614718, 1.822278, 1, 0, 0.7098039, 1,
1.189212, 1.214216, -0.01195711, 1, 0, 0.7019608, 1,
1.192085, 0.978803, 0.4823605, 1, 0, 0.6941177, 1,
1.194517, 1.561351, 0.6245537, 1, 0, 0.6901961, 1,
1.196473, -0.2436992, 1.36901, 1, 0, 0.682353, 1,
1.199343, 0.4279803, 2.588722, 1, 0, 0.6784314, 1,
1.199406, 0.8469767, -0.4734368, 1, 0, 0.6705883, 1,
1.209271, -0.2833867, 1.723308, 1, 0, 0.6666667, 1,
1.211844, 0.8180045, 0.7500976, 1, 0, 0.6588235, 1,
1.21281, 0.3930388, 1.251956, 1, 0, 0.654902, 1,
1.217548, -0.4504172, 1.263351, 1, 0, 0.6470588, 1,
1.235443, -0.2766117, 2.00497, 1, 0, 0.6431373, 1,
1.238976, -1.035904, 2.702985, 1, 0, 0.6352941, 1,
1.248024, 0.3562036, 1.063269, 1, 0, 0.6313726, 1,
1.253872, 0.4874744, 1.736318, 1, 0, 0.6235294, 1,
1.254042, -0.650641, 2.177006, 1, 0, 0.6196079, 1,
1.26262, -1.065485, 2.04971, 1, 0, 0.6117647, 1,
1.263195, 1.786427, 1.180034, 1, 0, 0.6078432, 1,
1.264836, 0.6362873, 0.561358, 1, 0, 0.6, 1,
1.274879, 0.7729404, 1.640112, 1, 0, 0.5921569, 1,
1.280723, -0.5790321, 0.9357163, 1, 0, 0.5882353, 1,
1.284572, 0.1589337, 2.266604, 1, 0, 0.5803922, 1,
1.285362, -1.40246, 3.903382, 1, 0, 0.5764706, 1,
1.286585, -0.05539194, 2.526683, 1, 0, 0.5686275, 1,
1.292084, 0.5378181, 0.7597471, 1, 0, 0.5647059, 1,
1.29533, 0.9169934, 0.924077, 1, 0, 0.5568628, 1,
1.295577, 0.6988838, 1.533283, 1, 0, 0.5529412, 1,
1.306534, -0.7715669, 2.656739, 1, 0, 0.5450981, 1,
1.306866, 0.1963579, 0.4649905, 1, 0, 0.5411765, 1,
1.315146, -1.168001, 2.932899, 1, 0, 0.5333334, 1,
1.321575, 2.111998, 1.2231, 1, 0, 0.5294118, 1,
1.324283, -1.020642, 2.26705, 1, 0, 0.5215687, 1,
1.326058, -0.5545582, 2.29511, 1, 0, 0.5176471, 1,
1.330145, -0.9626753, 0.8326877, 1, 0, 0.509804, 1,
1.34444, -1.403293, 1.967151, 1, 0, 0.5058824, 1,
1.346223, 0.2239333, 1.026027, 1, 0, 0.4980392, 1,
1.352837, 0.09844896, 2.740538, 1, 0, 0.4901961, 1,
1.353551, 0.238033, 3.560657, 1, 0, 0.4862745, 1,
1.36211, 0.2526816, 1.050631, 1, 0, 0.4784314, 1,
1.369165, -1.339469, 3.632111, 1, 0, 0.4745098, 1,
1.379717, -0.5465069, 1.616327, 1, 0, 0.4666667, 1,
1.380025, 0.3804547, -0.3714231, 1, 0, 0.4627451, 1,
1.384657, 0.1409524, 3.403965, 1, 0, 0.454902, 1,
1.390175, 0.2009797, 0.1766833, 1, 0, 0.4509804, 1,
1.390944, -2.595579, 2.382004, 1, 0, 0.4431373, 1,
1.395366, -0.6548157, 2.250382, 1, 0, 0.4392157, 1,
1.396377, -0.9419035, 1.27043, 1, 0, 0.4313726, 1,
1.40644, 0.5219029, 1.163195, 1, 0, 0.427451, 1,
1.407336, -2.461346, 1.625357, 1, 0, 0.4196078, 1,
1.437922, 0.2260035, -0.8868737, 1, 0, 0.4156863, 1,
1.44342, 1.684962, 0.07056426, 1, 0, 0.4078431, 1,
1.451639, 0.07127604, 4.112932, 1, 0, 0.4039216, 1,
1.452688, 2.418611, 1.577986, 1, 0, 0.3960784, 1,
1.457119, -1.042739, 0.06527368, 1, 0, 0.3882353, 1,
1.457905, 0.5040708, 0.8073625, 1, 0, 0.3843137, 1,
1.470403, 1.62797, 1.777059, 1, 0, 0.3764706, 1,
1.477184, 0.1892854, 1.381165, 1, 0, 0.372549, 1,
1.484169, -0.6829664, 0.4599736, 1, 0, 0.3647059, 1,
1.489281, -0.3727772, 2.531648, 1, 0, 0.3607843, 1,
1.50467, -1.718253, 3.288555, 1, 0, 0.3529412, 1,
1.506099, 0.664264, 0.9204162, 1, 0, 0.3490196, 1,
1.511354, -0.7537072, 1.28824, 1, 0, 0.3411765, 1,
1.524509, -0.729883, 2.282092, 1, 0, 0.3372549, 1,
1.528285, 1.16651, 0.4747556, 1, 0, 0.3294118, 1,
1.535673, 1.390213, 0.001307948, 1, 0, 0.3254902, 1,
1.540146, -1.121617, 1.812119, 1, 0, 0.3176471, 1,
1.54352, 0.3548693, 1.799528, 1, 0, 0.3137255, 1,
1.570743, 0.6698138, 1.360316, 1, 0, 0.3058824, 1,
1.58548, 1.662061, 0.4856319, 1, 0, 0.2980392, 1,
1.597918, 0.6821027, 0.03869236, 1, 0, 0.2941177, 1,
1.604406, -0.1839462, 0.09561469, 1, 0, 0.2862745, 1,
1.617998, -0.5723335, 1.373119, 1, 0, 0.282353, 1,
1.635841, 0.4809826, 1.255973, 1, 0, 0.2745098, 1,
1.67431, -0.3871652, 2.586407, 1, 0, 0.2705882, 1,
1.676279, 0.4083791, 4.146695, 1, 0, 0.2627451, 1,
1.706273, 0.4885139, 0.4989242, 1, 0, 0.2588235, 1,
1.70629, 1.140966, 1.804305, 1, 0, 0.2509804, 1,
1.715009, -0.2163269, 0.5161635, 1, 0, 0.2470588, 1,
1.716506, -0.6867522, 2.99095, 1, 0, 0.2392157, 1,
1.720654, 0.8108565, 1.988837, 1, 0, 0.2352941, 1,
1.721331, 0.2277593, 1.366603, 1, 0, 0.227451, 1,
1.730391, 0.343634, 2.644496, 1, 0, 0.2235294, 1,
1.733256, 0.1652088, 0.8394877, 1, 0, 0.2156863, 1,
1.741429, -0.2051423, 1.454761, 1, 0, 0.2117647, 1,
1.748647, 0.2012484, 3.421128, 1, 0, 0.2039216, 1,
1.750941, -0.7317812, 0.9823572, 1, 0, 0.1960784, 1,
1.752488, 0.4032584, 0.4219382, 1, 0, 0.1921569, 1,
1.779678, -0.7832666, 2.540461, 1, 0, 0.1843137, 1,
1.789792, -0.7599293, 4.43315, 1, 0, 0.1803922, 1,
1.860456, 0.3722247, -0.4144703, 1, 0, 0.172549, 1,
1.893477, 0.1093436, 2.451454, 1, 0, 0.1686275, 1,
1.903396, -1.159469, 3.140097, 1, 0, 0.1607843, 1,
1.903695, -0.2794228, 1.598149, 1, 0, 0.1568628, 1,
1.909454, -0.08747407, 2.860222, 1, 0, 0.1490196, 1,
1.941006, 1.552053, 1.41619, 1, 0, 0.145098, 1,
1.949289, 0.1656675, 0.0899255, 1, 0, 0.1372549, 1,
1.979136, -0.2782086, -0.4671174, 1, 0, 0.1333333, 1,
1.98705, -0.8890259, 1.519122, 1, 0, 0.1254902, 1,
2.05784, -0.3412617, 2.524983, 1, 0, 0.1215686, 1,
2.080942, 0.5362163, 1.667783, 1, 0, 0.1137255, 1,
2.081156, -0.7118359, 1.325954, 1, 0, 0.1098039, 1,
2.085763, 1.561388, 2.02322, 1, 0, 0.1019608, 1,
2.176979, 0.2670511, 3.202823, 1, 0, 0.09411765, 1,
2.201533, -0.141579, 3.078606, 1, 0, 0.09019608, 1,
2.217822, 1.383714, 2.996833, 1, 0, 0.08235294, 1,
2.228963, 1.34719, 0.9751897, 1, 0, 0.07843138, 1,
2.333475, 1.023319, 0.5536593, 1, 0, 0.07058824, 1,
2.402074, 0.2887069, 0.5438498, 1, 0, 0.06666667, 1,
2.437378, 0.5626135, -0.1858353, 1, 0, 0.05882353, 1,
2.473946, 0.06556143, 1.31418, 1, 0, 0.05490196, 1,
2.497863, 1.782462, 2.318359, 1, 0, 0.04705882, 1,
2.54961, -0.4549847, 1.105512, 1, 0, 0.04313726, 1,
2.590346, -0.3816814, 0.6973608, 1, 0, 0.03529412, 1,
2.75237, -1.94672, 1.280574, 1, 0, 0.03137255, 1,
2.77492, 1.517933, 2.650117, 1, 0, 0.02352941, 1,
2.798532, 0.6924788, 3.080746, 1, 0, 0.01960784, 1,
2.811649, -0.6365755, 0.9017009, 1, 0, 0.01176471, 1,
3.161415, 0.6208664, 1.931013, 1, 0, 0.007843138, 1
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
-0.0645386, -4.378675, -7.747028, 0, -0.5, 0.5, 0.5,
-0.0645386, -4.378675, -7.747028, 1, -0.5, 0.5, 0.5,
-0.0645386, -4.378675, -7.747028, 1, 1.5, 0.5, 0.5,
-0.0645386, -4.378675, -7.747028, 0, 1.5, 0.5, 0.5
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
-4.38409, -0.08012402, -7.747028, 0, -0.5, 0.5, 0.5,
-4.38409, -0.08012402, -7.747028, 1, -0.5, 0.5, 0.5,
-4.38409, -0.08012402, -7.747028, 1, 1.5, 0.5, 0.5,
-4.38409, -0.08012402, -7.747028, 0, 1.5, 0.5, 0.5
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
-4.38409, -4.378675, -0.1967335, 0, -0.5, 0.5, 0.5,
-4.38409, -4.378675, -0.1967335, 1, -0.5, 0.5, 0.5,
-4.38409, -4.378675, -0.1967335, 1, 1.5, 0.5, 0.5,
-4.38409, -4.378675, -0.1967335, 0, 1.5, 0.5, 0.5
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
-3, -3.386701, -6.004653,
3, -3.386701, -6.004653,
-3, -3.386701, -6.004653,
-3, -3.55203, -6.295048,
-2, -3.386701, -6.004653,
-2, -3.55203, -6.295048,
-1, -3.386701, -6.004653,
-1, -3.55203, -6.295048,
0, -3.386701, -6.004653,
0, -3.55203, -6.295048,
1, -3.386701, -6.004653,
1, -3.55203, -6.295048,
2, -3.386701, -6.004653,
2, -3.55203, -6.295048,
3, -3.386701, -6.004653,
3, -3.55203, -6.295048
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
-3, -3.882688, -6.87584, 0, -0.5, 0.5, 0.5,
-3, -3.882688, -6.87584, 1, -0.5, 0.5, 0.5,
-3, -3.882688, -6.87584, 1, 1.5, 0.5, 0.5,
-3, -3.882688, -6.87584, 0, 1.5, 0.5, 0.5,
-2, -3.882688, -6.87584, 0, -0.5, 0.5, 0.5,
-2, -3.882688, -6.87584, 1, -0.5, 0.5, 0.5,
-2, -3.882688, -6.87584, 1, 1.5, 0.5, 0.5,
-2, -3.882688, -6.87584, 0, 1.5, 0.5, 0.5,
-1, -3.882688, -6.87584, 0, -0.5, 0.5, 0.5,
-1, -3.882688, -6.87584, 1, -0.5, 0.5, 0.5,
-1, -3.882688, -6.87584, 1, 1.5, 0.5, 0.5,
-1, -3.882688, -6.87584, 0, 1.5, 0.5, 0.5,
0, -3.882688, -6.87584, 0, -0.5, 0.5, 0.5,
0, -3.882688, -6.87584, 1, -0.5, 0.5, 0.5,
0, -3.882688, -6.87584, 1, 1.5, 0.5, 0.5,
0, -3.882688, -6.87584, 0, 1.5, 0.5, 0.5,
1, -3.882688, -6.87584, 0, -0.5, 0.5, 0.5,
1, -3.882688, -6.87584, 1, -0.5, 0.5, 0.5,
1, -3.882688, -6.87584, 1, 1.5, 0.5, 0.5,
1, -3.882688, -6.87584, 0, 1.5, 0.5, 0.5,
2, -3.882688, -6.87584, 0, -0.5, 0.5, 0.5,
2, -3.882688, -6.87584, 1, -0.5, 0.5, 0.5,
2, -3.882688, -6.87584, 1, 1.5, 0.5, 0.5,
2, -3.882688, -6.87584, 0, 1.5, 0.5, 0.5,
3, -3.882688, -6.87584, 0, -0.5, 0.5, 0.5,
3, -3.882688, -6.87584, 1, -0.5, 0.5, 0.5,
3, -3.882688, -6.87584, 1, 1.5, 0.5, 0.5,
3, -3.882688, -6.87584, 0, 1.5, 0.5, 0.5
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
-3.387271, -3, -6.004653,
-3.387271, 3, -6.004653,
-3.387271, -3, -6.004653,
-3.553407, -3, -6.295048,
-3.387271, -2, -6.004653,
-3.553407, -2, -6.295048,
-3.387271, -1, -6.004653,
-3.553407, -1, -6.295048,
-3.387271, 0, -6.004653,
-3.553407, 0, -6.295048,
-3.387271, 1, -6.004653,
-3.553407, 1, -6.295048,
-3.387271, 2, -6.004653,
-3.553407, 2, -6.295048,
-3.387271, 3, -6.004653,
-3.553407, 3, -6.295048
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
-3.885681, -3, -6.87584, 0, -0.5, 0.5, 0.5,
-3.885681, -3, -6.87584, 1, -0.5, 0.5, 0.5,
-3.885681, -3, -6.87584, 1, 1.5, 0.5, 0.5,
-3.885681, -3, -6.87584, 0, 1.5, 0.5, 0.5,
-3.885681, -2, -6.87584, 0, -0.5, 0.5, 0.5,
-3.885681, -2, -6.87584, 1, -0.5, 0.5, 0.5,
-3.885681, -2, -6.87584, 1, 1.5, 0.5, 0.5,
-3.885681, -2, -6.87584, 0, 1.5, 0.5, 0.5,
-3.885681, -1, -6.87584, 0, -0.5, 0.5, 0.5,
-3.885681, -1, -6.87584, 1, -0.5, 0.5, 0.5,
-3.885681, -1, -6.87584, 1, 1.5, 0.5, 0.5,
-3.885681, -1, -6.87584, 0, 1.5, 0.5, 0.5,
-3.885681, 0, -6.87584, 0, -0.5, 0.5, 0.5,
-3.885681, 0, -6.87584, 1, -0.5, 0.5, 0.5,
-3.885681, 0, -6.87584, 1, 1.5, 0.5, 0.5,
-3.885681, 0, -6.87584, 0, 1.5, 0.5, 0.5,
-3.885681, 1, -6.87584, 0, -0.5, 0.5, 0.5,
-3.885681, 1, -6.87584, 1, -0.5, 0.5, 0.5,
-3.885681, 1, -6.87584, 1, 1.5, 0.5, 0.5,
-3.885681, 1, -6.87584, 0, 1.5, 0.5, 0.5,
-3.885681, 2, -6.87584, 0, -0.5, 0.5, 0.5,
-3.885681, 2, -6.87584, 1, -0.5, 0.5, 0.5,
-3.885681, 2, -6.87584, 1, 1.5, 0.5, 0.5,
-3.885681, 2, -6.87584, 0, 1.5, 0.5, 0.5,
-3.885681, 3, -6.87584, 0, -0.5, 0.5, 0.5,
-3.885681, 3, -6.87584, 1, -0.5, 0.5, 0.5,
-3.885681, 3, -6.87584, 1, 1.5, 0.5, 0.5,
-3.885681, 3, -6.87584, 0, 1.5, 0.5, 0.5
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
-3.387271, -3.386701, -4,
-3.387271, -3.386701, 4,
-3.387271, -3.386701, -4,
-3.553407, -3.55203, -4,
-3.387271, -3.386701, -2,
-3.553407, -3.55203, -2,
-3.387271, -3.386701, 0,
-3.553407, -3.55203, 0,
-3.387271, -3.386701, 2,
-3.553407, -3.55203, 2,
-3.387271, -3.386701, 4,
-3.553407, -3.55203, 4
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
-3.885681, -3.882688, -4, 0, -0.5, 0.5, 0.5,
-3.885681, -3.882688, -4, 1, -0.5, 0.5, 0.5,
-3.885681, -3.882688, -4, 1, 1.5, 0.5, 0.5,
-3.885681, -3.882688, -4, 0, 1.5, 0.5, 0.5,
-3.885681, -3.882688, -2, 0, -0.5, 0.5, 0.5,
-3.885681, -3.882688, -2, 1, -0.5, 0.5, 0.5,
-3.885681, -3.882688, -2, 1, 1.5, 0.5, 0.5,
-3.885681, -3.882688, -2, 0, 1.5, 0.5, 0.5,
-3.885681, -3.882688, 0, 0, -0.5, 0.5, 0.5,
-3.885681, -3.882688, 0, 1, -0.5, 0.5, 0.5,
-3.885681, -3.882688, 0, 1, 1.5, 0.5, 0.5,
-3.885681, -3.882688, 0, 0, 1.5, 0.5, 0.5,
-3.885681, -3.882688, 2, 0, -0.5, 0.5, 0.5,
-3.885681, -3.882688, 2, 1, -0.5, 0.5, 0.5,
-3.885681, -3.882688, 2, 1, 1.5, 0.5, 0.5,
-3.885681, -3.882688, 2, 0, 1.5, 0.5, 0.5,
-3.885681, -3.882688, 4, 0, -0.5, 0.5, 0.5,
-3.885681, -3.882688, 4, 1, -0.5, 0.5, 0.5,
-3.885681, -3.882688, 4, 1, 1.5, 0.5, 0.5,
-3.885681, -3.882688, 4, 0, 1.5, 0.5, 0.5
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
-3.387271, -3.386701, -6.004653,
-3.387271, 3.226453, -6.004653,
-3.387271, -3.386701, 5.611186,
-3.387271, 3.226453, 5.611186,
-3.387271, -3.386701, -6.004653,
-3.387271, -3.386701, 5.611186,
-3.387271, 3.226453, -6.004653,
-3.387271, 3.226453, 5.611186,
-3.387271, -3.386701, -6.004653,
3.258194, -3.386701, -6.004653,
-3.387271, -3.386701, 5.611186,
3.258194, -3.386701, 5.611186,
-3.387271, 3.226453, -6.004653,
3.258194, 3.226453, -6.004653,
-3.387271, 3.226453, 5.611186,
3.258194, 3.226453, 5.611186,
3.258194, -3.386701, -6.004653,
3.258194, 3.226453, -6.004653,
3.258194, -3.386701, 5.611186,
3.258194, 3.226453, 5.611186,
3.258194, -3.386701, -6.004653,
3.258194, -3.386701, 5.611186,
3.258194, 3.226453, -6.004653,
3.258194, 3.226453, 5.611186
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
var radius = 7.970878;
var distance = 35.46334;
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
mvMatrix.translate( 0.0645386, 0.08012402, 0.1967335 );
mvMatrix.scale( 1.296865, 1.303201, 0.7419413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46334);
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
Dinoterb<-read.table("Dinoterb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dinoterb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dinoterb' not found
```

```r
y<-Dinoterb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dinoterb' not found
```

```r
z<-Dinoterb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dinoterb' not found
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
-3.290492, 2.163826, -0.4373602, 0, 0, 1, 1, 1,
-2.868018, 1.717641, -0.4586707, 1, 0, 0, 1, 1,
-2.595036, 0.1086996, -2.099451, 1, 0, 0, 1, 1,
-2.559714, -0.840681, -3.015367, 1, 0, 0, 1, 1,
-2.413537, 0.6637269, -2.12955, 1, 0, 0, 1, 1,
-2.411088, 1.105277, -0.08454785, 1, 0, 0, 1, 1,
-2.357304, -0.08147812, -1.286522, 0, 0, 0, 1, 1,
-2.292271, -0.6979856, -0.6168145, 0, 0, 0, 1, 1,
-2.291431, 0.5331628, -1.583105, 0, 0, 0, 1, 1,
-2.284186, -0.6630949, -2.686851, 0, 0, 0, 1, 1,
-2.27448, -1.714429, -2.558308, 0, 0, 0, 1, 1,
-2.222819, 1.017193, -2.371224, 0, 0, 0, 1, 1,
-2.143049, -0.7511255, -3.21611, 0, 0, 0, 1, 1,
-2.142709, -0.177055, -0.8263027, 1, 1, 1, 1, 1,
-2.110493, 0.3387857, -1.590734, 1, 1, 1, 1, 1,
-2.026024, 1.002462, -0.4376289, 1, 1, 1, 1, 1,
-2.00025, 0.1369226, -2.074771, 1, 1, 1, 1, 1,
-1.987305, 0.1695569, 0.4339407, 1, 1, 1, 1, 1,
-1.964449, -0.5780285, -2.724637, 1, 1, 1, 1, 1,
-1.957193, -0.147438, -1.724401, 1, 1, 1, 1, 1,
-1.953742, 1.332436, -0.5171769, 1, 1, 1, 1, 1,
-1.943032, 0.03073224, -1.518029, 1, 1, 1, 1, 1,
-1.931314, 0.5037106, -2.533597, 1, 1, 1, 1, 1,
-1.859066, -0.4020822, -2.177095, 1, 1, 1, 1, 1,
-1.840252, 0.09377594, -1.857665, 1, 1, 1, 1, 1,
-1.824134, 0.9444025, 1.157506, 1, 1, 1, 1, 1,
-1.809951, -0.2140664, -0.01143726, 1, 1, 1, 1, 1,
-1.789847, -1.306635, -1.226001, 1, 1, 1, 1, 1,
-1.779757, 0.3815534, -2.22795, 0, 0, 1, 1, 1,
-1.777737, 1.367612, -0.2894024, 1, 0, 0, 1, 1,
-1.768441, 0.2668268, -3.012473, 1, 0, 0, 1, 1,
-1.753597, -1.726975, -2.648191, 1, 0, 0, 1, 1,
-1.74554, 0.7047822, -2.614369, 1, 0, 0, 1, 1,
-1.733122, -0.4414489, -1.835151, 1, 0, 0, 1, 1,
-1.714691, -0.1716583, -0.313523, 0, 0, 0, 1, 1,
-1.713744, -0.9781001, -2.345301, 0, 0, 0, 1, 1,
-1.705913, -1.03989, -2.647912, 0, 0, 0, 1, 1,
-1.703124, 0.3670745, -0.9779798, 0, 0, 0, 1, 1,
-1.681952, 1.749406, -0.731409, 0, 0, 0, 1, 1,
-1.681036, 0.8086427, 0.1019916, 0, 0, 0, 1, 1,
-1.670676, 0.7757369, -0.3765873, 0, 0, 0, 1, 1,
-1.657933, 0.3055364, -2.588595, 1, 1, 1, 1, 1,
-1.649898, 0.1486627, -2.506238, 1, 1, 1, 1, 1,
-1.6159, -0.4961384, -1.025011, 1, 1, 1, 1, 1,
-1.608407, 0.8871781, -2.934963, 1, 1, 1, 1, 1,
-1.599339, 0.4826391, -1.427745, 1, 1, 1, 1, 1,
-1.594941, -0.8501689, -2.38492, 1, 1, 1, 1, 1,
-1.585731, -0.5216773, -0.4450431, 1, 1, 1, 1, 1,
-1.57723, -1.989958, -1.166976, 1, 1, 1, 1, 1,
-1.566822, -1.408127, -1.023775, 1, 1, 1, 1, 1,
-1.558682, -0.7705895, -0.5096874, 1, 1, 1, 1, 1,
-1.554978, -0.5191713, -1.832347, 1, 1, 1, 1, 1,
-1.548483, 0.931425, -0.1491699, 1, 1, 1, 1, 1,
-1.541557, 0.1480929, -0.6891595, 1, 1, 1, 1, 1,
-1.525573, -0.6769873, -0.7838669, 1, 1, 1, 1, 1,
-1.523937, 1.138227, 0.01598361, 1, 1, 1, 1, 1,
-1.509851, -0.0387319, -2.309923, 0, 0, 1, 1, 1,
-1.505088, 1.048836, 0.01653989, 1, 0, 0, 1, 1,
-1.496879, 1.029186, -0.3404379, 1, 0, 0, 1, 1,
-1.496372, -0.6978333, -1.958362, 1, 0, 0, 1, 1,
-1.494421, -1.814144, -2.936917, 1, 0, 0, 1, 1,
-1.474127, 1.477407, -0.1269275, 1, 0, 0, 1, 1,
-1.472926, 1.155189, -1.05113, 0, 0, 0, 1, 1,
-1.468872, -0.9994413, -2.414661, 0, 0, 0, 1, 1,
-1.462825, -0.4350698, -1.340836, 0, 0, 0, 1, 1,
-1.460078, 0.9332122, 0.4503604, 0, 0, 0, 1, 1,
-1.437497, -2.197345, -2.931914, 0, 0, 0, 1, 1,
-1.435496, 0.1868947, -3.442586, 0, 0, 0, 1, 1,
-1.432575, 1.717204, 0.5043743, 0, 0, 0, 1, 1,
-1.427525, -0.7567183, -2.832341, 1, 1, 1, 1, 1,
-1.42546, 1.585971, -0.4626508, 1, 1, 1, 1, 1,
-1.416529, -0.1371268, -1.5193, 1, 1, 1, 1, 1,
-1.413803, -0.9976146, -3.884354, 1, 1, 1, 1, 1,
-1.40796, -1.252438, -2.58549, 1, 1, 1, 1, 1,
-1.406595, -0.7852506, -1.79999, 1, 1, 1, 1, 1,
-1.392444, 1.716357, -0.5595038, 1, 1, 1, 1, 1,
-1.38417, 0.19015, -0.7185992, 1, 1, 1, 1, 1,
-1.369867, 1.786842, -1.474642, 1, 1, 1, 1, 1,
-1.361279, -0.4106322, -1.435393, 1, 1, 1, 1, 1,
-1.357006, -1.313052, -3.441054, 1, 1, 1, 1, 1,
-1.345489, -0.05867634, -3.151355, 1, 1, 1, 1, 1,
-1.344735, 1.465853, 1.150429, 1, 1, 1, 1, 1,
-1.334331, 0.1538701, -2.284192, 1, 1, 1, 1, 1,
-1.330643, -0.4117876, -2.435674, 1, 1, 1, 1, 1,
-1.32811, 0.5849177, -0.2502025, 0, 0, 1, 1, 1,
-1.327338, -0.383542, -1.50768, 1, 0, 0, 1, 1,
-1.324376, -0.2324437, -2.623532, 1, 0, 0, 1, 1,
-1.32182, -0.4609478, -2.487443, 1, 0, 0, 1, 1,
-1.306248, 0.6690124, -1.050274, 1, 0, 0, 1, 1,
-1.301446, 0.7045823, -2.06179, 1, 0, 0, 1, 1,
-1.300333, 0.181118, -0.9969462, 0, 0, 0, 1, 1,
-1.298072, -0.6845249, 0.2447248, 0, 0, 0, 1, 1,
-1.29573, -0.6801961, -1.624477, 0, 0, 0, 1, 1,
-1.295096, 1.31884, -0.2110477, 0, 0, 0, 1, 1,
-1.291905, -1.272541, -2.716325, 0, 0, 0, 1, 1,
-1.286328, -0.01660068, -1.460235, 0, 0, 0, 1, 1,
-1.284209, -0.6982, -2.749602, 0, 0, 0, 1, 1,
-1.277013, -1.307546, -4.209789, 1, 1, 1, 1, 1,
-1.273225, 2.058493, 0.1219273, 1, 1, 1, 1, 1,
-1.261894, 0.8897716, -1.879323, 1, 1, 1, 1, 1,
-1.255059, -1.150958, -3.163979, 1, 1, 1, 1, 1,
-1.247882, 1.537432, -1.481852, 1, 1, 1, 1, 1,
-1.241117, 0.1402717, -0.7620385, 1, 1, 1, 1, 1,
-1.2397, -0.4893765, -0.6110063, 1, 1, 1, 1, 1,
-1.238671, -2.094541, -2.371997, 1, 1, 1, 1, 1,
-1.238518, -0.4906201, -2.886153, 1, 1, 1, 1, 1,
-1.232199, -0.321066, -2.620247, 1, 1, 1, 1, 1,
-1.229324, -1.221568, -4.364146, 1, 1, 1, 1, 1,
-1.222017, 0.01933795, -1.457802, 1, 1, 1, 1, 1,
-1.209822, -0.3008876, -1.059998, 1, 1, 1, 1, 1,
-1.207918, 0.3623593, -0.2793018, 1, 1, 1, 1, 1,
-1.192815, -0.696959, -4.166534, 1, 1, 1, 1, 1,
-1.192556, -0.5959863, -2.404708, 0, 0, 1, 1, 1,
-1.192223, -1.19888, -2.807009, 1, 0, 0, 1, 1,
-1.181143, -1.07581, -2.113545, 1, 0, 0, 1, 1,
-1.170795, 0.9319971, -1.517978, 1, 0, 0, 1, 1,
-1.16401, -0.6231893, -2.487021, 1, 0, 0, 1, 1,
-1.159761, -0.8914626, -1.589281, 1, 0, 0, 1, 1,
-1.152967, -0.5137799, -1.454331, 0, 0, 0, 1, 1,
-1.15238, 0.680653, -1.486213, 0, 0, 0, 1, 1,
-1.152254, 0.1777267, -3.929324, 0, 0, 0, 1, 1,
-1.149198, 0.3929465, -1.895586, 0, 0, 0, 1, 1,
-1.140231, -0.1322128, -0.1161527, 0, 0, 0, 1, 1,
-1.135652, -0.6541452, -1.647808, 0, 0, 0, 1, 1,
-1.13225, -1.095307, -3.384782, 0, 0, 0, 1, 1,
-1.131764, 0.8069425, -1.492526, 1, 1, 1, 1, 1,
-1.127732, 0.164153, -2.424254, 1, 1, 1, 1, 1,
-1.12178, 0.711755, -0.1851725, 1, 1, 1, 1, 1,
-1.11699, 0.6306332, -0.4030431, 1, 1, 1, 1, 1,
-1.115424, -0.4540029, -2.492364, 1, 1, 1, 1, 1,
-1.11409, 2.817423, 1.872887, 1, 1, 1, 1, 1,
-1.105905, -0.3715598, -1.503744, 1, 1, 1, 1, 1,
-1.105582, -0.2296477, -2.185511, 1, 1, 1, 1, 1,
-1.103989, 1.502771, 0.3461753, 1, 1, 1, 1, 1,
-1.103191, -0.9935893, -2.585099, 1, 1, 1, 1, 1,
-1.103102, -1.648808, -2.015544, 1, 1, 1, 1, 1,
-1.091027, 2.028708, -1.006642, 1, 1, 1, 1, 1,
-1.084093, 0.8645998, -0.9786875, 1, 1, 1, 1, 1,
-1.082791, -0.1112467, -1.783278, 1, 1, 1, 1, 1,
-1.076578, 2.251964, -0.3210573, 1, 1, 1, 1, 1,
-1.075759, -0.8085261, -1.177102, 0, 0, 1, 1, 1,
-1.067256, 0.1522419, 0.1033006, 1, 0, 0, 1, 1,
-1.065954, -0.7905013, -1.42968, 1, 0, 0, 1, 1,
-1.060087, 1.209425, -0.1914316, 1, 0, 0, 1, 1,
-1.053411, 0.1253929, -0.8078192, 1, 0, 0, 1, 1,
-1.051179, 0.04014377, -0.4034976, 1, 0, 0, 1, 1,
-1.05076, -0.0779356, -1.517546, 0, 0, 0, 1, 1,
-1.046895, -0.5522444, 0.135773, 0, 0, 0, 1, 1,
-1.046889, -0.3874226, -0.4715534, 0, 0, 0, 1, 1,
-1.042734, 0.1496367, -2.819745, 0, 0, 0, 1, 1,
-1.033887, 0.4003275, -1.440483, 0, 0, 0, 1, 1,
-1.030935, -0.8414226, -3.161326, 0, 0, 0, 1, 1,
-1.026451, 0.8944864, -0.6917699, 0, 0, 0, 1, 1,
-1.025935, 2.435451, -0.5429692, 1, 1, 1, 1, 1,
-1.025422, -1.699748, -2.124152, 1, 1, 1, 1, 1,
-1.021532, -0.32407, -4.097275, 1, 1, 1, 1, 1,
-1.0198, -1.913004, -3.154189, 1, 1, 1, 1, 1,
-1.015383, -0.9394414, -1.683054, 1, 1, 1, 1, 1,
-1.010614, 1.454687, -0.6798353, 1, 1, 1, 1, 1,
-1.00268, 0.3238046, -1.725265, 1, 1, 1, 1, 1,
-1.00186, 0.6111577, 1.045002, 1, 1, 1, 1, 1,
-0.9998687, -1.217073, -3.148118, 1, 1, 1, 1, 1,
-0.9993283, -0.2665746, -1.816727, 1, 1, 1, 1, 1,
-0.9934108, -0.7052703, -3.287291, 1, 1, 1, 1, 1,
-0.991898, -0.1965584, -1.296498, 1, 1, 1, 1, 1,
-0.9897252, 0.9202253, -3.422894, 1, 1, 1, 1, 1,
-0.989227, -1.071445, -2.997884, 1, 1, 1, 1, 1,
-0.9885849, 0.2774218, -1.494416, 1, 1, 1, 1, 1,
-0.9880028, 1.976127, 0.5570688, 0, 0, 1, 1, 1,
-0.9866031, 1.557976, 0.1702944, 1, 0, 0, 1, 1,
-0.9855741, 0.3901176, -1.164697, 1, 0, 0, 1, 1,
-0.9852059, 2.308143, -0.3955296, 1, 0, 0, 1, 1,
-0.9702755, -0.5072356, -3.138469, 1, 0, 0, 1, 1,
-0.9699189, -0.7927074, -3.730426, 1, 0, 0, 1, 1,
-0.9666194, 1.656556, -1.791587, 0, 0, 0, 1, 1,
-0.9647968, -0.4161885, -1.061781, 0, 0, 0, 1, 1,
-0.9603549, 1.148186, -0.2570101, 0, 0, 0, 1, 1,
-0.9398746, -0.5144437, -2.247469, 0, 0, 0, 1, 1,
-0.9353293, -0.3382452, -1.832743, 0, 0, 0, 1, 1,
-0.9320982, -0.4887489, -2.506333, 0, 0, 0, 1, 1,
-0.9313528, 0.9308936, 0.2712639, 0, 0, 0, 1, 1,
-0.9284915, -0.8963653, -3.265107, 1, 1, 1, 1, 1,
-0.9236502, 1.050205, -0.4767239, 1, 1, 1, 1, 1,
-0.9232515, -0.6276691, -2.408203, 1, 1, 1, 1, 1,
-0.9211982, 0.4308963, -0.3554153, 1, 1, 1, 1, 1,
-0.9197561, -0.1854272, -3.086594, 1, 1, 1, 1, 1,
-0.9162963, 0.01696373, -1.094427, 1, 1, 1, 1, 1,
-0.9131545, 0.3544657, -0.3927201, 1, 1, 1, 1, 1,
-0.9130614, -0.9278446, -2.826095, 1, 1, 1, 1, 1,
-0.9126722, 0.6710933, -1.075357, 1, 1, 1, 1, 1,
-0.9116588, 2.655741, -1.615373, 1, 1, 1, 1, 1,
-0.9104109, -0.4615702, -4.574253, 1, 1, 1, 1, 1,
-0.9099896, -0.3260627, -1.322961, 1, 1, 1, 1, 1,
-0.9053563, 1.229201, -1.115119, 1, 1, 1, 1, 1,
-0.9016959, -0.4652737, -1.961428, 1, 1, 1, 1, 1,
-0.9008833, 0.2549186, -0.4593952, 1, 1, 1, 1, 1,
-0.9006232, 1.049531, -1.056242, 0, 0, 1, 1, 1,
-0.8961822, 0.5091586, -2.107646, 1, 0, 0, 1, 1,
-0.8917865, -1.307774, -1.874095, 1, 0, 0, 1, 1,
-0.8843733, -0.1816113, -0.5443426, 1, 0, 0, 1, 1,
-0.8728195, -1.373637, 0.5448835, 1, 0, 0, 1, 1,
-0.8712167, 0.4286539, -2.422054, 1, 0, 0, 1, 1,
-0.8709696, 1.211854, -0.3685771, 0, 0, 0, 1, 1,
-0.8529691, -1.818951, -2.6983, 0, 0, 0, 1, 1,
-0.8529667, -0.7515291, -2.720005, 0, 0, 0, 1, 1,
-0.8492815, 0.2238013, -2.185277, 0, 0, 0, 1, 1,
-0.8453221, 0.1326178, -2.026426, 0, 0, 0, 1, 1,
-0.8437046, -1.042297, -1.686266, 0, 0, 0, 1, 1,
-0.8362978, 0.01040109, -1.689943, 0, 0, 0, 1, 1,
-0.8309523, -0.3909763, -2.739975, 1, 1, 1, 1, 1,
-0.8237962, 0.6032043, -1.392278, 1, 1, 1, 1, 1,
-0.8217266, 0.26401, -0.8761122, 1, 1, 1, 1, 1,
-0.8131414, -0.4779491, -2.021534, 1, 1, 1, 1, 1,
-0.8115216, 0.7515286, -2.552545, 1, 1, 1, 1, 1,
-0.8085269, -0.1454645, -2.636689, 1, 1, 1, 1, 1,
-0.7999121, -0.2066873, -1.431977, 1, 1, 1, 1, 1,
-0.7990491, -0.290805, -3.146947, 1, 1, 1, 1, 1,
-0.7880889, -0.2792831, -0.9245478, 1, 1, 1, 1, 1,
-0.7867295, -0.1292927, -1.378484, 1, 1, 1, 1, 1,
-0.7816008, 0.3354339, -1.707378, 1, 1, 1, 1, 1,
-0.7792663, 0.511897, -0.6485648, 1, 1, 1, 1, 1,
-0.7759544, 0.8652198, -0.3542371, 1, 1, 1, 1, 1,
-0.7759059, 0.6894765, -1.474175, 1, 1, 1, 1, 1,
-0.7704234, 0.474536, -1.062358, 1, 1, 1, 1, 1,
-0.7696323, -1.48229, -3.16885, 0, 0, 1, 1, 1,
-0.7668605, 2.370369, 0.4900812, 1, 0, 0, 1, 1,
-0.7664636, 1.174544, -1.242118, 1, 0, 0, 1, 1,
-0.7594084, 0.4594737, -0.3827733, 1, 0, 0, 1, 1,
-0.7548977, 1.212405, 0.1259409, 1, 0, 0, 1, 1,
-0.7476486, -0.5824354, -3.74215, 1, 0, 0, 1, 1,
-0.744626, -0.1053286, -2.865757, 0, 0, 0, 1, 1,
-0.7383776, 1.122522, -1.674402, 0, 0, 0, 1, 1,
-0.7307795, -0.5948877, -3.928948, 0, 0, 0, 1, 1,
-0.7295662, 0.4687663, -2.14915, 0, 0, 0, 1, 1,
-0.7221507, 0.7400203, -0.330789, 0, 0, 0, 1, 1,
-0.7112297, -0.9894051, -2.396003, 0, 0, 0, 1, 1,
-0.7097309, 0.2479332, 0.3220187, 0, 0, 0, 1, 1,
-0.7025378, 1.143234, -0.819423, 1, 1, 1, 1, 1,
-0.6990921, 0.1140451, -0.3772359, 1, 1, 1, 1, 1,
-0.6972318, 0.3908463, -2.133569, 1, 1, 1, 1, 1,
-0.6916071, 0.3319053, -2.736053, 1, 1, 1, 1, 1,
-0.6909997, -0.04758821, 0.07007042, 1, 1, 1, 1, 1,
-0.674832, 1.452608, 1.642112, 1, 1, 1, 1, 1,
-0.6712825, 0.01062244, -0.5604931, 1, 1, 1, 1, 1,
-0.6707546, 0.7314978, -1.108929, 1, 1, 1, 1, 1,
-0.6630371, -0.7206146, -2.970417, 1, 1, 1, 1, 1,
-0.6626574, 0.8034708, -0.4543241, 1, 1, 1, 1, 1,
-0.652724, 0.7276692, 0.5420536, 1, 1, 1, 1, 1,
-0.6504143, 1.483148, -0.4774677, 1, 1, 1, 1, 1,
-0.6491283, 1.287131, 0.006678235, 1, 1, 1, 1, 1,
-0.6426939, 0.01591604, -2.399975, 1, 1, 1, 1, 1,
-0.6401708, -1.97723, -2.302353, 1, 1, 1, 1, 1,
-0.6387063, -0.8738492, -1.625453, 0, 0, 1, 1, 1,
-0.6384031, 0.5873701, -0.2481326, 1, 0, 0, 1, 1,
-0.6378698, 0.7039167, -0.4802522, 1, 0, 0, 1, 1,
-0.6364788, -2.058252, -4.255756, 1, 0, 0, 1, 1,
-0.6339801, -0.01774707, -5.042886, 1, 0, 0, 1, 1,
-0.6297892, -0.8031541, -1.877439, 1, 0, 0, 1, 1,
-0.6272771, 0.982318, -1.016611, 0, 0, 0, 1, 1,
-0.6220263, 0.1917419, -2.325917, 0, 0, 0, 1, 1,
-0.6207732, -0.8963203, -1.754344, 0, 0, 0, 1, 1,
-0.6151122, 0.170226, 0.005638558, 0, 0, 0, 1, 1,
-0.6084549, -1.765022, -3.030569, 0, 0, 0, 1, 1,
-0.605129, 1.452015, -0.2054738, 0, 0, 0, 1, 1,
-0.603941, -0.6443577, -1.42028, 0, 0, 0, 1, 1,
-0.6012949, 1.126309, -0.8041347, 1, 1, 1, 1, 1,
-0.594434, -2.445733, -3.28585, 1, 1, 1, 1, 1,
-0.5940843, 0.6792922, -0.4585947, 1, 1, 1, 1, 1,
-0.589264, -0.2632556, -2.342659, 1, 1, 1, 1, 1,
-0.5774854, -0.08196706, -3.035984, 1, 1, 1, 1, 1,
-0.5773328, -0.4888011, -4.844719, 1, 1, 1, 1, 1,
-0.5766806, -0.6342081, -2.590021, 1, 1, 1, 1, 1,
-0.5721589, 1.129118, -0.3948974, 1, 1, 1, 1, 1,
-0.571612, 0.2057164, -1.559911, 1, 1, 1, 1, 1,
-0.57091, 0.0962109, -0.9072305, 1, 1, 1, 1, 1,
-0.5596074, 1.322433, -0.6888276, 1, 1, 1, 1, 1,
-0.5594534, -0.2358497, -1.505679, 1, 1, 1, 1, 1,
-0.5591654, 2.190516, -0.7080906, 1, 1, 1, 1, 1,
-0.5575325, 0.1930728, -0.1334938, 1, 1, 1, 1, 1,
-0.5548081, -1.723609, -2.29992, 1, 1, 1, 1, 1,
-0.5547387, -1.696957, -0.9139636, 0, 0, 1, 1, 1,
-0.5531703, -1.187153, -2.479863, 1, 0, 0, 1, 1,
-0.5506848, 0.06287593, -2.341632, 1, 0, 0, 1, 1,
-0.5437424, 0.1080052, -0.3707088, 1, 0, 0, 1, 1,
-0.5430236, -0.6557623, -3.421054, 1, 0, 0, 1, 1,
-0.5416735, -0.5001695, -1.808096, 1, 0, 0, 1, 1,
-0.5405789, -1.127131, -3.104427, 0, 0, 0, 1, 1,
-0.539309, 1.997647, -0.4380244, 0, 0, 0, 1, 1,
-0.5381282, -0.0608409, -1.426873, 0, 0, 0, 1, 1,
-0.5318993, -1.946608, -2.945781, 0, 0, 0, 1, 1,
-0.5317159, -1.007203, -1.897196, 0, 0, 0, 1, 1,
-0.5298278, -2.541438, -2.876103, 0, 0, 0, 1, 1,
-0.5296631, -0.5784985, -2.296748, 0, 0, 0, 1, 1,
-0.5290938, -1.37835, -1.182397, 1, 1, 1, 1, 1,
-0.5258527, 0.3592733, -2.119475, 1, 1, 1, 1, 1,
-0.5245964, -0.4784875, -1.859477, 1, 1, 1, 1, 1,
-0.522754, -0.2621073, -2.651757, 1, 1, 1, 1, 1,
-0.5162054, 0.1230423, -2.478293, 1, 1, 1, 1, 1,
-0.5152394, 1.450531, -0.6676146, 1, 1, 1, 1, 1,
-0.5126929, -0.07446339, -0.6440281, 1, 1, 1, 1, 1,
-0.5095966, 0.8693369, -0.6835521, 1, 1, 1, 1, 1,
-0.5024177, 0.04582203, -2.033243, 1, 1, 1, 1, 1,
-0.5008366, 0.2494361, -2.737131, 1, 1, 1, 1, 1,
-0.4961281, 0.09323439, -0.3780106, 1, 1, 1, 1, 1,
-0.4957803, 0.007428154, -1.956919, 1, 1, 1, 1, 1,
-0.4948481, 0.1835673, -1.63291, 1, 1, 1, 1, 1,
-0.4942411, -1.784038, -3.622941, 1, 1, 1, 1, 1,
-0.4921407, -0.8189237, -2.391512, 1, 1, 1, 1, 1,
-0.491688, 0.81952, -1.777845, 0, 0, 1, 1, 1,
-0.4836116, -0.3996765, -3.629482, 1, 0, 0, 1, 1,
-0.4806604, 1.406178, -0.6713005, 1, 0, 0, 1, 1,
-0.4790582, -0.7833201, -2.080095, 1, 0, 0, 1, 1,
-0.4782511, -0.4912483, -3.131238, 1, 0, 0, 1, 1,
-0.4781353, 0.9163377, 1.214477, 1, 0, 0, 1, 1,
-0.4767691, 0.7218943, -2.282295, 0, 0, 0, 1, 1,
-0.4756407, -1.212218, -3.912616, 0, 0, 0, 1, 1,
-0.474243, 0.7585442, -1.440497, 0, 0, 0, 1, 1,
-0.4732524, 1.304093, -1.974918, 0, 0, 0, 1, 1,
-0.463278, -1.876959, -4.225013, 0, 0, 0, 1, 1,
-0.4622113, -1.946242, -4.076003, 0, 0, 0, 1, 1,
-0.4599926, -0.08751658, -1.700252, 0, 0, 0, 1, 1,
-0.4586364, 0.5074689, 0.04188094, 1, 1, 1, 1, 1,
-0.4545326, -3.290393, -0.9364654, 1, 1, 1, 1, 1,
-0.4527028, -3.217213, -0.9681103, 1, 1, 1, 1, 1,
-0.4503883, -0.8877947, -1.974914, 1, 1, 1, 1, 1,
-0.4502716, 0.3636755, -0.7263919, 1, 1, 1, 1, 1,
-0.4500916, -1.016236, -2.963226, 1, 1, 1, 1, 1,
-0.4496539, -1.060277, -1.54003, 1, 1, 1, 1, 1,
-0.4482009, 0.6487743, -0.1689415, 1, 1, 1, 1, 1,
-0.4473214, 2.058948, -0.4995269, 1, 1, 1, 1, 1,
-0.446149, 0.4754965, -1.218896, 1, 1, 1, 1, 1,
-0.4459345, -0.3475319, -1.710606, 1, 1, 1, 1, 1,
-0.4422579, -1.006525, -2.126608, 1, 1, 1, 1, 1,
-0.4374671, -0.5060077, -3.418995, 1, 1, 1, 1, 1,
-0.4297435, 0.276192, 0.07012828, 1, 1, 1, 1, 1,
-0.4211115, -0.104138, -1.350684, 1, 1, 1, 1, 1,
-0.4190533, -0.3359784, -3.300179, 0, 0, 1, 1, 1,
-0.4188758, 0.1844095, 0.3616504, 1, 0, 0, 1, 1,
-0.4149211, 0.4613352, 0.1264244, 1, 0, 0, 1, 1,
-0.40981, -0.05485493, -3.777012, 1, 0, 0, 1, 1,
-0.4084735, 0.6833996, 0.5671773, 1, 0, 0, 1, 1,
-0.4082725, -0.8548409, -1.437262, 1, 0, 0, 1, 1,
-0.4016235, 1.562182, -2.509915, 0, 0, 0, 1, 1,
-0.3965732, -1.355187, -2.040136, 0, 0, 0, 1, 1,
-0.3958625, -0.6770642, -2.283223, 0, 0, 0, 1, 1,
-0.3926748, 0.4664542, 0.8353962, 0, 0, 0, 1, 1,
-0.3863443, 0.7022407, -1.553578, 0, 0, 0, 1, 1,
-0.384124, 0.1995217, -2.646734, 0, 0, 0, 1, 1,
-0.3820109, -0.8942946, -3.421441, 0, 0, 0, 1, 1,
-0.3748765, -0.794802, -1.931617, 1, 1, 1, 1, 1,
-0.3746207, 0.3673223, -1.526347, 1, 1, 1, 1, 1,
-0.3724058, 0.08027223, -1.907837, 1, 1, 1, 1, 1,
-0.3629446, -1.056733, -2.510126, 1, 1, 1, 1, 1,
-0.3620527, 0.1228141, -2.174658, 1, 1, 1, 1, 1,
-0.358995, 2.519713, -0.3106691, 1, 1, 1, 1, 1,
-0.3579283, -1.004735, -3.303153, 1, 1, 1, 1, 1,
-0.3577013, -1.184726, -1.953452, 1, 1, 1, 1, 1,
-0.3546021, 0.7386299, -1.450641, 1, 1, 1, 1, 1,
-0.353616, 1.348791, -0.02119826, 1, 1, 1, 1, 1,
-0.3517466, -0.4159502, -2.808894, 1, 1, 1, 1, 1,
-0.3507025, 1.617223, 1.056582, 1, 1, 1, 1, 1,
-0.3505005, -0.7575187, 0.08311202, 1, 1, 1, 1, 1,
-0.3486942, -0.07369733, -2.573626, 1, 1, 1, 1, 1,
-0.3476826, -0.0335571, -3.398393, 1, 1, 1, 1, 1,
-0.346725, 0.1107443, -2.556658, 0, 0, 1, 1, 1,
-0.3453334, -1.302376, -2.42717, 1, 0, 0, 1, 1,
-0.3434812, -1.408912, -3.368766, 1, 0, 0, 1, 1,
-0.3405978, -0.4022083, -1.781821, 1, 0, 0, 1, 1,
-0.3398676, -1.57522, -3.828657, 1, 0, 0, 1, 1,
-0.3397096, -0.9968642, -3.252209, 1, 0, 0, 1, 1,
-0.3303257, 0.6274188, -1.478658, 0, 0, 0, 1, 1,
-0.3251602, 1.070629, -0.05366867, 0, 0, 0, 1, 1,
-0.3236366, -0.2034457, -3.745371, 0, 0, 0, 1, 1,
-0.3225349, -0.5808131, -1.789009, 0, 0, 0, 1, 1,
-0.3182796, 0.08080995, -0.3970346, 0, 0, 0, 1, 1,
-0.3120375, -1.338092, -2.535494, 0, 0, 0, 1, 1,
-0.3097304, -0.3798488, -1.040992, 0, 0, 0, 1, 1,
-0.3020042, 0.8208451, -1.025852, 1, 1, 1, 1, 1,
-0.3005811, 0.1464107, -2.100337, 1, 1, 1, 1, 1,
-0.300232, -1.056804, -4.022047, 1, 1, 1, 1, 1,
-0.2934387, -0.3985473, -3.869885, 1, 1, 1, 1, 1,
-0.2918986, 0.6209427, -0.2412506, 1, 1, 1, 1, 1,
-0.2912866, -0.6169752, -1.67022, 1, 1, 1, 1, 1,
-0.290584, 0.8238892, 1.258055, 1, 1, 1, 1, 1,
-0.2878254, 0.4051652, -0.140065, 1, 1, 1, 1, 1,
-0.2863199, -1.102481, -3.620833, 1, 1, 1, 1, 1,
-0.2772778, -0.5293127, -4.65453, 1, 1, 1, 1, 1,
-0.2751103, -1.213089, -2.078091, 1, 1, 1, 1, 1,
-0.2715414, 1.469046, -0.5805688, 1, 1, 1, 1, 1,
-0.2698289, 0.1438789, -1.374829, 1, 1, 1, 1, 1,
-0.2691577, 1.139558, -0.9073836, 1, 1, 1, 1, 1,
-0.2689531, 0.2981866, 1.135859, 1, 1, 1, 1, 1,
-0.2676727, -1.612167, -4.05193, 0, 0, 1, 1, 1,
-0.2645096, 0.8658973, -1.597468, 1, 0, 0, 1, 1,
-0.2629922, -0.9485739, -2.995925, 1, 0, 0, 1, 1,
-0.2616385, -0.1862573, -3.17017, 1, 0, 0, 1, 1,
-0.2596167, 1.068938, -1.136646, 1, 0, 0, 1, 1,
-0.2546312, -0.4968123, -2.273781, 1, 0, 0, 1, 1,
-0.2542149, 0.6347856, -0.2147021, 0, 0, 0, 1, 1,
-0.2484682, 0.9329473, -0.2511228, 0, 0, 0, 1, 1,
-0.2383745, -0.6168976, -2.90205, 0, 0, 0, 1, 1,
-0.2343482, 0.8106018, -0.168306, 0, 0, 0, 1, 1,
-0.2321455, -1.586652, -2.878449, 0, 0, 0, 1, 1,
-0.2316123, -0.7567742, -5.381127, 0, 0, 0, 1, 1,
-0.2305532, -0.4207158, -2.532469, 0, 0, 0, 1, 1,
-0.2279335, 1.477774, 0.7112216, 1, 1, 1, 1, 1,
-0.2272111, -0.9899783, -1.154645, 1, 1, 1, 1, 1,
-0.2267362, 0.6195304, 1.883226, 1, 1, 1, 1, 1,
-0.2229316, -0.1071486, -1.700422, 1, 1, 1, 1, 1,
-0.2215215, -0.5141283, -1.865498, 1, 1, 1, 1, 1,
-0.2137741, 0.2380321, -1.49851, 1, 1, 1, 1, 1,
-0.211716, -0.4793069, -1.442958, 1, 1, 1, 1, 1,
-0.2112012, 0.3375099, 0.8708314, 1, 1, 1, 1, 1,
-0.2018716, -0.3796198, -2.283718, 1, 1, 1, 1, 1,
-0.2000995, -1.053559, -3.230429, 1, 1, 1, 1, 1,
-0.1954553, 0.04393937, -3.145056, 1, 1, 1, 1, 1,
-0.1924557, -1.713842, -2.942359, 1, 1, 1, 1, 1,
-0.1881181, -0.1043012, -1.194182, 1, 1, 1, 1, 1,
-0.1846247, -0.2026006, -0.9079737, 1, 1, 1, 1, 1,
-0.1837997, 0.1214272, -1.999325, 1, 1, 1, 1, 1,
-0.1781746, 0.6605328, -1.193245, 0, 0, 1, 1, 1,
-0.1713836, -0.1488129, -0.8931657, 1, 0, 0, 1, 1,
-0.1680723, 1.399243, -0.4227077, 1, 0, 0, 1, 1,
-0.1650852, 0.5748945, 0.1402739, 1, 0, 0, 1, 1,
-0.1615003, 0.1286585, -1.702913, 1, 0, 0, 1, 1,
-0.1596192, -1.797775, -3.145424, 1, 0, 0, 1, 1,
-0.1580672, 0.3097988, -0.663355, 0, 0, 0, 1, 1,
-0.156166, 0.3018179, 0.9747051, 0, 0, 0, 1, 1,
-0.1537285, -0.2935549, -2.359599, 0, 0, 0, 1, 1,
-0.1533686, 0.7589234, -1.350384, 0, 0, 0, 1, 1,
-0.1529044, -0.2269808, -4.051259, 0, 0, 0, 1, 1,
-0.1525278, -0.2786852, -2.629372, 0, 0, 0, 1, 1,
-0.1488706, -0.1977735, -3.835336, 0, 0, 0, 1, 1,
-0.1482522, -0.3292056, -3.538544, 1, 1, 1, 1, 1,
-0.1476516, -1.112188, -3.341633, 1, 1, 1, 1, 1,
-0.14242, -0.1080812, -0.372332, 1, 1, 1, 1, 1,
-0.1417465, -2.038654, -1.560079, 1, 1, 1, 1, 1,
-0.139907, 0.6520854, -1.043502, 1, 1, 1, 1, 1,
-0.1373138, -0.4291967, -4.640064, 1, 1, 1, 1, 1,
-0.1357646, 0.4994919, 0.8220708, 1, 1, 1, 1, 1,
-0.1318407, -0.4971632, -2.233845, 1, 1, 1, 1, 1,
-0.1304988, -1.002355, -5.104983, 1, 1, 1, 1, 1,
-0.1301459, 1.034189, 0.1368687, 1, 1, 1, 1, 1,
-0.1286208, -0.8787208, -3.885413, 1, 1, 1, 1, 1,
-0.127157, 0.7556212, -0.995888, 1, 1, 1, 1, 1,
-0.1263874, -1.886364, -3.147836, 1, 1, 1, 1, 1,
-0.1237689, 1.588018, -0.4755794, 1, 1, 1, 1, 1,
-0.1206287, -0.6100446, -3.075596, 1, 1, 1, 1, 1,
-0.1183207, -1.321138, -1.881201, 0, 0, 1, 1, 1,
-0.1172066, 0.6617512, 0.1603125, 1, 0, 0, 1, 1,
-0.1167075, -0.512944, -3.045111, 1, 0, 0, 1, 1,
-0.1153963, 1.114801, -0.393861, 1, 0, 0, 1, 1,
-0.1123828, -0.7274121, -2.612467, 1, 0, 0, 1, 1,
-0.1100273, -0.2124978, -2.371948, 1, 0, 0, 1, 1,
-0.1051786, 0.03753366, -0.8845357, 0, 0, 0, 1, 1,
-0.1026911, 0.3266695, -0.9423339, 0, 0, 0, 1, 1,
-0.1012384, -0.4956118, -3.757527, 0, 0, 0, 1, 1,
-0.1009717, -2.230113, -2.614191, 0, 0, 0, 1, 1,
-0.09996305, -0.3737291, -2.369934, 0, 0, 0, 1, 1,
-0.09810007, -0.6913922, -3.386376, 0, 0, 0, 1, 1,
-0.09717843, 2.449296, 0.102876, 0, 0, 0, 1, 1,
-0.09358606, -1.116779, -3.639445, 1, 1, 1, 1, 1,
-0.09068168, -0.7891281, -4.985234, 1, 1, 1, 1, 1,
-0.08463784, -1.296679, -3.949854, 1, 1, 1, 1, 1,
-0.08390095, -0.03074261, -1.147817, 1, 1, 1, 1, 1,
-0.08040452, -0.3002741, -2.870498, 1, 1, 1, 1, 1,
-0.07895371, -1.905519, -1.875744, 1, 1, 1, 1, 1,
-0.07555512, -0.4443512, -1.647432, 1, 1, 1, 1, 1,
-0.07200542, 0.6359923, -0.9870825, 1, 1, 1, 1, 1,
-0.07178559, 0.03862207, -1.70584, 1, 1, 1, 1, 1,
-0.06721699, -1.141453, -5.83549, 1, 1, 1, 1, 1,
-0.06545658, -0.5716134, -2.251778, 1, 1, 1, 1, 1,
-0.06486552, 2.565228, 1.153007, 1, 1, 1, 1, 1,
-0.06129532, -0.4920247, -4.145705, 1, 1, 1, 1, 1,
-0.05945371, -0.6167458, -1.788978, 1, 1, 1, 1, 1,
-0.05866857, 0.360824, 1.580828, 1, 1, 1, 1, 1,
-0.05692558, -1.986656, -3.008932, 0, 0, 1, 1, 1,
-0.04722706, -1.840332, -4.096151, 1, 0, 0, 1, 1,
-0.04158503, 0.6357948, -1.413898, 1, 0, 0, 1, 1,
-0.04141907, -1.258009, -1.336014, 1, 0, 0, 1, 1,
-0.0400641, 0.9448513, 0.1686201, 1, 0, 0, 1, 1,
-0.03600661, -1.01816, -4.278393, 1, 0, 0, 1, 1,
-0.03520834, -0.6929526, -1.997676, 0, 0, 0, 1, 1,
-0.0339205, 0.9856417, 0.198172, 0, 0, 0, 1, 1,
-0.03094846, -1.883055, -3.961778, 0, 0, 0, 1, 1,
-0.02995735, -0.2462965, -2.55184, 0, 0, 0, 1, 1,
-0.02914133, 0.693069, 0.8762773, 0, 0, 0, 1, 1,
-0.01798724, -0.07421476, -2.448462, 0, 0, 0, 1, 1,
-0.01664994, 2.414535, -0.03969233, 0, 0, 0, 1, 1,
-0.01447734, 0.8264891, -1.238044, 1, 1, 1, 1, 1,
-0.008757404, 0.1855503, -0.08439962, 1, 1, 1, 1, 1,
-0.007033619, 0.3411455, 1.128896, 1, 1, 1, 1, 1,
-0.006760202, 0.6277065, -0.4825221, 1, 1, 1, 1, 1,
-0.004590108, 2.046373, -1.833059, 1, 1, 1, 1, 1,
-0.004198084, 1.821997, -1.168393, 1, 1, 1, 1, 1,
-0.003356409, -1.071835, -3.41937, 1, 1, 1, 1, 1,
0.001352637, -2.057319, 3.920569, 1, 1, 1, 1, 1,
0.002580913, 0.4752391, -0.5653374, 1, 1, 1, 1, 1,
0.003119989, -0.492861, 4.557299, 1, 1, 1, 1, 1,
0.003857193, -1.659586, 3.593869, 1, 1, 1, 1, 1,
0.005960576, 0.2985677, -0.331173, 1, 1, 1, 1, 1,
0.01362427, -0.2301432, 3.757922, 1, 1, 1, 1, 1,
0.01429649, 0.3642995, -0.6201734, 1, 1, 1, 1, 1,
0.01446045, 1.132825, -0.5368603, 1, 1, 1, 1, 1,
0.02006203, 0.5901253, 1.097245, 0, 0, 1, 1, 1,
0.0228778, 0.9848492, 0.4093127, 1, 0, 0, 1, 1,
0.02613178, 0.5155646, 0.5817031, 1, 0, 0, 1, 1,
0.02661951, -1.881916, 2.686736, 1, 0, 0, 1, 1,
0.0286856, 0.255343, -0.8258786, 1, 0, 0, 1, 1,
0.03273685, -0.4570355, 3.76764, 1, 0, 0, 1, 1,
0.03400761, -0.01961823, 1.912399, 0, 0, 0, 1, 1,
0.03948417, -1.603535, 2.405321, 0, 0, 0, 1, 1,
0.04293754, -0.8058551, 1.602661, 0, 0, 0, 1, 1,
0.04568682, 2.078022, -1.690449, 0, 0, 0, 1, 1,
0.04838092, 1.669484, -0.2379572, 0, 0, 0, 1, 1,
0.04842104, 0.01426126, 3.232637, 0, 0, 0, 1, 1,
0.04957463, -0.7333276, 4.485128, 0, 0, 0, 1, 1,
0.05246659, -0.847831, 2.693607, 1, 1, 1, 1, 1,
0.05661819, 2.157505, 0.9969409, 1, 1, 1, 1, 1,
0.0592701, -0.4155498, 2.404041, 1, 1, 1, 1, 1,
0.05934722, -1.157552, 2.414088, 1, 1, 1, 1, 1,
0.05975141, 1.454515, -0.2721869, 1, 1, 1, 1, 1,
0.0677257, -0.2364278, 3.074077, 1, 1, 1, 1, 1,
0.06987142, -0.6448796, 3.153497, 1, 1, 1, 1, 1,
0.07177728, 1.392946, 0.04076527, 1, 1, 1, 1, 1,
0.0729614, -1.746512, 3.013741, 1, 1, 1, 1, 1,
0.07419887, -1.24158, 4.590048, 1, 1, 1, 1, 1,
0.07553177, 0.5921685, 1.419547, 1, 1, 1, 1, 1,
0.07629706, -1.628459, 2.63169, 1, 1, 1, 1, 1,
0.07679705, -0.8535135, 3.722461, 1, 1, 1, 1, 1,
0.0798493, -1.397025, 3.356402, 1, 1, 1, 1, 1,
0.08309799, 0.6419157, 0.05241938, 1, 1, 1, 1, 1,
0.08342522, 0.3081438, 0.5440348, 0, 0, 1, 1, 1,
0.08381854, 0.8756746, -2.06014, 1, 0, 0, 1, 1,
0.09199182, -1.215589, 3.255733, 1, 0, 0, 1, 1,
0.09414404, -0.4657549, 3.598122, 1, 0, 0, 1, 1,
0.09430362, 0.8099223, 0.06991037, 1, 0, 0, 1, 1,
0.09794643, 1.988315, -0.3176602, 1, 0, 0, 1, 1,
0.1033828, -0.461567, 2.883833, 0, 0, 0, 1, 1,
0.1044374, 0.1170822, 1.95328, 0, 0, 0, 1, 1,
0.1049346, 0.136153, 0.06229962, 0, 0, 0, 1, 1,
0.1067455, -1.218126, 2.053994, 0, 0, 0, 1, 1,
0.1135712, 1.114109, -0.2062242, 0, 0, 0, 1, 1,
0.1142945, 2.56031, -0.7083724, 0, 0, 0, 1, 1,
0.1150161, -0.2880569, 1.665481, 0, 0, 0, 1, 1,
0.1156515, -0.1529461, 2.045179, 1, 1, 1, 1, 1,
0.1164367, -1.002607, 3.808094, 1, 1, 1, 1, 1,
0.1186222, 0.4213172, 1.216572, 1, 1, 1, 1, 1,
0.1293179, -0.4699125, 4.395884, 1, 1, 1, 1, 1,
0.1300345, 1.341285, 0.5654975, 1, 1, 1, 1, 1,
0.1344139, -0.1349251, 3.736854, 1, 1, 1, 1, 1,
0.1381, 0.4810087, 1.06408, 1, 1, 1, 1, 1,
0.1384254, -0.3384294, 3.306253, 1, 1, 1, 1, 1,
0.1403547, 0.01506484, 0.3523276, 1, 1, 1, 1, 1,
0.1418693, 0.5138517, -0.6638437, 1, 1, 1, 1, 1,
0.1462696, -0.4978562, 2.295933, 1, 1, 1, 1, 1,
0.1471281, -1.775723, 2.553553, 1, 1, 1, 1, 1,
0.149426, 0.4841887, -1.396265, 1, 1, 1, 1, 1,
0.1516148, -0.9209764, 2.383048, 1, 1, 1, 1, 1,
0.1530224, 0.5689275, -0.9603981, 1, 1, 1, 1, 1,
0.1538519, -0.9967653, 2.096279, 0, 0, 1, 1, 1,
0.1581154, -1.701158, 2.780765, 1, 0, 0, 1, 1,
0.1582151, -0.6734458, 2.999475, 1, 0, 0, 1, 1,
0.1591311, 0.4175174, 0.2136283, 1, 0, 0, 1, 1,
0.1594001, -0.6970357, 1.575312, 1, 0, 0, 1, 1,
0.1604598, -0.8685357, 3.135059, 1, 0, 0, 1, 1,
0.1605067, -0.5827994, 1.999668, 0, 0, 0, 1, 1,
0.1613614, -0.6464214, 2.021617, 0, 0, 0, 1, 1,
0.1623408, -0.004101339, 0.3624585, 0, 0, 0, 1, 1,
0.1630074, 0.7756451, -0.1973529, 0, 0, 0, 1, 1,
0.1645316, -0.569489, 5.442023, 0, 0, 0, 1, 1,
0.1687606, -0.1132894, 1.120727, 0, 0, 0, 1, 1,
0.1723729, -1.239247, 1.55773, 0, 0, 0, 1, 1,
0.1750897, 0.9659587, 0.1864855, 1, 1, 1, 1, 1,
0.1753921, 0.6310699, -0.07626108, 1, 1, 1, 1, 1,
0.1763105, 0.561338, -0.2690652, 1, 1, 1, 1, 1,
0.1775786, -0.4115358, 3.062577, 1, 1, 1, 1, 1,
0.1804794, 0.7530426, 1.047528, 1, 1, 1, 1, 1,
0.1822291, -0.6454592, 3.188058, 1, 1, 1, 1, 1,
0.1836587, -0.9394081, 4.038045, 1, 1, 1, 1, 1,
0.1851489, -0.06635673, 2.99577, 1, 1, 1, 1, 1,
0.1859901, -0.88485, 2.033299, 1, 1, 1, 1, 1,
0.1918741, -0.08155791, 2.897006, 1, 1, 1, 1, 1,
0.1958653, 0.1177713, 0.7502905, 1, 1, 1, 1, 1,
0.1960728, 3.130145, 0.1610606, 1, 1, 1, 1, 1,
0.1982985, -1.993407, 2.809649, 1, 1, 1, 1, 1,
0.1998236, -0.7196705, 3.512733, 1, 1, 1, 1, 1,
0.2026029, 0.9977431, 1.630275, 1, 1, 1, 1, 1,
0.2074968, 0.2356616, -0.3822265, 0, 0, 1, 1, 1,
0.209197, -0.06658228, 2.027492, 1, 0, 0, 1, 1,
0.2095006, 0.2931927, 2.632414, 1, 0, 0, 1, 1,
0.2194903, -1.364866, 3.020227, 1, 0, 0, 1, 1,
0.2223681, 0.5187231, -0.4936599, 1, 0, 0, 1, 1,
0.2243466, -0.2795796, 3.314016, 1, 0, 0, 1, 1,
0.2262338, -0.2249523, 2.09281, 0, 0, 0, 1, 1,
0.2355745, 0.5837478, 1.231762, 0, 0, 0, 1, 1,
0.2394343, 0.4940851, 1.749631, 0, 0, 0, 1, 1,
0.2480253, 0.5039621, -0.64767, 0, 0, 0, 1, 1,
0.2491971, 0.439592, -0.1491879, 0, 0, 0, 1, 1,
0.2504003, -0.9655361, 2.895521, 0, 0, 0, 1, 1,
0.2532607, 1.505683, -0.6431407, 0, 0, 0, 1, 1,
0.2544809, -1.35447, 1.704245, 1, 1, 1, 1, 1,
0.254932, 0.5015882, -1.418028, 1, 1, 1, 1, 1,
0.256685, 0.3001941, 0.3073213, 1, 1, 1, 1, 1,
0.261002, -0.8127062, 3.10311, 1, 1, 1, 1, 1,
0.2615795, -0.6508082, 3.509102, 1, 1, 1, 1, 1,
0.2657014, -0.406179, 0.730635, 1, 1, 1, 1, 1,
0.2658349, 1.05704, -0.8827044, 1, 1, 1, 1, 1,
0.2706879, -0.2161291, 2.659838, 1, 1, 1, 1, 1,
0.2710979, -1.791111, 1.356258, 1, 1, 1, 1, 1,
0.2744756, 1.118666, 1.88608, 1, 1, 1, 1, 1,
0.2773777, 0.1984728, 1.505111, 1, 1, 1, 1, 1,
0.2789797, -0.5211034, 5.289231, 1, 1, 1, 1, 1,
0.2844687, -0.2190266, 2.892313, 1, 1, 1, 1, 1,
0.2855956, -1.114265, 2.018343, 1, 1, 1, 1, 1,
0.2908859, 1.807526, 0.9895639, 1, 1, 1, 1, 1,
0.2912809, 0.9596968, 0.4772854, 0, 0, 1, 1, 1,
0.2928241, -0.738212, 2.960904, 1, 0, 0, 1, 1,
0.2943611, 0.2236055, 2.792757, 1, 0, 0, 1, 1,
0.2960786, -0.3349458, 0.2247666, 1, 0, 0, 1, 1,
0.2965103, -1.677298, 3.249129, 1, 0, 0, 1, 1,
0.2975588, 0.1144979, 1.066001, 1, 0, 0, 1, 1,
0.297703, 0.027098, 2.678038, 0, 0, 0, 1, 1,
0.2977097, -0.6096719, 3.893524, 0, 0, 0, 1, 1,
0.2981253, 0.6271719, 1.728011, 0, 0, 0, 1, 1,
0.3007802, -0.6603159, 3.889089, 0, 0, 0, 1, 1,
0.3011134, -0.9667557, 2.258631, 0, 0, 0, 1, 1,
0.3021592, 0.6350883, 2.068783, 0, 0, 0, 1, 1,
0.3038885, -1.497425, 4.046301, 0, 0, 0, 1, 1,
0.3109611, -0.7689233, 2.086238, 1, 1, 1, 1, 1,
0.3114375, -0.7852257, 1.836251, 1, 1, 1, 1, 1,
0.3121506, 1.808571, 0.6953052, 1, 1, 1, 1, 1,
0.3132063, 0.3138005, 1.050429, 1, 1, 1, 1, 1,
0.3171441, -0.04200123, 3.248417, 1, 1, 1, 1, 1,
0.3180641, -0.271066, 3.461728, 1, 1, 1, 1, 1,
0.3195165, -0.3434586, 3.594694, 1, 1, 1, 1, 1,
0.319593, -0.9390539, 4.047572, 1, 1, 1, 1, 1,
0.3199284, -0.2883016, 1.610355, 1, 1, 1, 1, 1,
0.321239, 1.200928, 1.99574, 1, 1, 1, 1, 1,
0.3229558, -1.557282, 1.493621, 1, 1, 1, 1, 1,
0.3282906, 1.608941, 0.8106248, 1, 1, 1, 1, 1,
0.3297386, -0.07137403, 1.172772, 1, 1, 1, 1, 1,
0.330316, 1.284294, -0.2524592, 1, 1, 1, 1, 1,
0.3325976, 0.4302903, 0.3716607, 1, 1, 1, 1, 1,
0.3363452, -0.5066234, 2.620682, 0, 0, 1, 1, 1,
0.3363459, -0.9202548, 3.089227, 1, 0, 0, 1, 1,
0.3374593, -0.6150151, 1.718331, 1, 0, 0, 1, 1,
0.3377645, 0.753881, -0.8550809, 1, 0, 0, 1, 1,
0.3384045, 0.9383428, 1.263602, 1, 0, 0, 1, 1,
0.3409854, 0.2075873, 0.4139572, 1, 0, 0, 1, 1,
0.3435822, 1.052903, -0.1925362, 0, 0, 0, 1, 1,
0.3508056, 1.540473, -2.485895, 0, 0, 0, 1, 1,
0.3518079, -0.1804786, 1.863852, 0, 0, 0, 1, 1,
0.3614985, -1.654891, 3.094805, 0, 0, 0, 1, 1,
0.3618893, 2.040175, 0.1795804, 0, 0, 0, 1, 1,
0.3628058, 1.923089, 0.6968613, 0, 0, 0, 1, 1,
0.3635553, -1.409724, 3.76042, 0, 0, 0, 1, 1,
0.3644292, 0.03464038, 0.08317342, 1, 1, 1, 1, 1,
0.3685018, -0.04146173, 2.939066, 1, 1, 1, 1, 1,
0.3697416, -0.4705374, 2.226822, 1, 1, 1, 1, 1,
0.370056, 0.69414, 0.206703, 1, 1, 1, 1, 1,
0.3762705, -0.7531486, 3.888298, 1, 1, 1, 1, 1,
0.3773671, -0.8900422, 3.443755, 1, 1, 1, 1, 1,
0.3781729, 0.3459359, -2.067111, 1, 1, 1, 1, 1,
0.3789909, -0.9102616, 2.469713, 1, 1, 1, 1, 1,
0.3834141, -0.1083047, 2.752437, 1, 1, 1, 1, 1,
0.3838532, -2.836082, 2.33318, 1, 1, 1, 1, 1,
0.3925286, 1.913147, -0.4280908, 1, 1, 1, 1, 1,
0.3934831, 0.893783, -2.062952, 1, 1, 1, 1, 1,
0.4001862, -0.3977111, 2.280525, 1, 1, 1, 1, 1,
0.4031961, -2.505178, 0.8095659, 1, 1, 1, 1, 1,
0.4062363, 0.3498875, 0.1649872, 1, 1, 1, 1, 1,
0.4085821, 0.4120565, 1.32029, 0, 0, 1, 1, 1,
0.4095422, -0.6568722, 1.830461, 1, 0, 0, 1, 1,
0.4103092, 1.561701, 1.321754, 1, 0, 0, 1, 1,
0.4103317, 0.01429086, 2.046587, 1, 0, 0, 1, 1,
0.4108543, -1.281249, 1.608268, 1, 0, 0, 1, 1,
0.4116475, -1.840508, 2.430223, 1, 0, 0, 1, 1,
0.4132772, -0.6605392, 1.403626, 0, 0, 0, 1, 1,
0.4213349, -1.006147, 2.888555, 0, 0, 0, 1, 1,
0.4249263, 2.115891, 0.3333593, 0, 0, 0, 1, 1,
0.4318423, 0.4847935, 2.505599, 0, 0, 0, 1, 1,
0.4342846, 1.302646, 0.2590698, 0, 0, 0, 1, 1,
0.4343532, -0.2341001, 1.389107, 0, 0, 0, 1, 1,
0.4373782, 2.198, 0.9827681, 0, 0, 0, 1, 1,
0.4375, 0.08832117, 1.61971, 1, 1, 1, 1, 1,
0.4454295, -0.3370114, 2.126592, 1, 1, 1, 1, 1,
0.4496934, 0.9372028, 0.2601105, 1, 1, 1, 1, 1,
0.4535956, -0.4042825, 0.8167465, 1, 1, 1, 1, 1,
0.458988, 0.4302501, 1.298967, 1, 1, 1, 1, 1,
0.4638953, 0.1167876, 1.66968, 1, 1, 1, 1, 1,
0.4650594, 1.224629, 0.387553, 1, 1, 1, 1, 1,
0.4664821, -0.2427286, 2.780567, 1, 1, 1, 1, 1,
0.4672759, 0.167147, 2.723462, 1, 1, 1, 1, 1,
0.4738809, -1.079112, 1.307355, 1, 1, 1, 1, 1,
0.4753158, -0.09594918, 0.9103515, 1, 1, 1, 1, 1,
0.4765347, 0.1540102, 0.3175914, 1, 1, 1, 1, 1,
0.4766874, 0.6696333, 1.846798, 1, 1, 1, 1, 1,
0.4769345, 0.9998562, -0.657681, 1, 1, 1, 1, 1,
0.4800785, -0.1609141, 1.369647, 1, 1, 1, 1, 1,
0.4809273, -1.005291, 3.573441, 0, 0, 1, 1, 1,
0.484122, -0.6590236, 2.081359, 1, 0, 0, 1, 1,
0.4879235, 0.3249832, 0.1513628, 1, 0, 0, 1, 1,
0.4906163, 1.253485, 1.842793, 1, 0, 0, 1, 1,
0.4936464, -0.7795042, 2.927452, 1, 0, 0, 1, 1,
0.4948412, -0.7938148, 3.676514, 1, 0, 0, 1, 1,
0.4958961, -0.7578294, 3.834575, 0, 0, 0, 1, 1,
0.4979103, -0.2924625, 3.877016, 0, 0, 0, 1, 1,
0.506117, 1.803737, 1.165963, 0, 0, 0, 1, 1,
0.5082282, -0.8926594, 1.909919, 0, 0, 0, 1, 1,
0.5095977, -0.3298446, 2.916718, 0, 0, 0, 1, 1,
0.512078, 0.564151, 0.9938464, 0, 0, 0, 1, 1,
0.5121709, 0.6189903, 2.400381, 0, 0, 0, 1, 1,
0.5131994, -0.6777279, 3.129758, 1, 1, 1, 1, 1,
0.518427, 0.008956173, 0.170316, 1, 1, 1, 1, 1,
0.5184675, 0.7096493, 1.295703, 1, 1, 1, 1, 1,
0.5288262, -0.2030581, 3.36289, 1, 1, 1, 1, 1,
0.5306062, -0.3034043, 1.486882, 1, 1, 1, 1, 1,
0.5374752, 0.5855718, 0.6312943, 1, 1, 1, 1, 1,
0.5389882, 1.406739, -0.05949004, 1, 1, 1, 1, 1,
0.5393098, -0.05708061, 1.124268, 1, 1, 1, 1, 1,
0.5399831, -0.1846955, 1.986161, 1, 1, 1, 1, 1,
0.5411599, 0.5062601, 0.3947473, 1, 1, 1, 1, 1,
0.5423483, 0.7771941, 1.187916, 1, 1, 1, 1, 1,
0.5429024, -0.5618643, 3.018965, 1, 1, 1, 1, 1,
0.5497307, -0.1476056, 4.168783, 1, 1, 1, 1, 1,
0.5526426, -1.29973, 2.204599, 1, 1, 1, 1, 1,
0.5582938, 0.6578984, 2.661738, 1, 1, 1, 1, 1,
0.561468, 0.7138011, 0.5688073, 0, 0, 1, 1, 1,
0.5661995, -0.5878141, 3.236699, 1, 0, 0, 1, 1,
0.5664667, 1.898404, 0.7727637, 1, 0, 0, 1, 1,
0.5768712, 0.1663472, 0.3435143, 1, 0, 0, 1, 1,
0.57886, 0.2648976, 1.729937, 1, 0, 0, 1, 1,
0.5858277, -1.660501, 2.840853, 1, 0, 0, 1, 1,
0.5965126, -0.01670862, 1.342728, 0, 0, 0, 1, 1,
0.5970495, 0.3574415, 2.856053, 0, 0, 0, 1, 1,
0.5997204, -0.06291745, 0.2471963, 0, 0, 0, 1, 1,
0.6018645, -0.1007933, 1.533749, 0, 0, 0, 1, 1,
0.6019185, 0.03767824, 1.454673, 0, 0, 0, 1, 1,
0.6045699, -1.320366, 1.986116, 0, 0, 0, 1, 1,
0.6056932, 0.163905, 0.7362003, 0, 0, 0, 1, 1,
0.6064615, -0.3990521, 2.25483, 1, 1, 1, 1, 1,
0.6156471, 2.920816, -0.1338148, 1, 1, 1, 1, 1,
0.623855, 0.2883369, 1.099709, 1, 1, 1, 1, 1,
0.6246484, -1.154973, 4.900518, 1, 1, 1, 1, 1,
0.6260411, -0.2049948, 2.399555, 1, 1, 1, 1, 1,
0.627464, 0.881278, 0.5082981, 1, 1, 1, 1, 1,
0.6305952, -0.4685372, 2.003207, 1, 1, 1, 1, 1,
0.6425301, 0.05272539, -0.1791766, 1, 1, 1, 1, 1,
0.6431674, -1.042974, 2.668001, 1, 1, 1, 1, 1,
0.6434571, 0.9457293, 1.726236, 1, 1, 1, 1, 1,
0.6454263, -0.1271332, 1.73046, 1, 1, 1, 1, 1,
0.6456938, 1.044695, 1.175482, 1, 1, 1, 1, 1,
0.6514531, 0.174656, -0.1074054, 1, 1, 1, 1, 1,
0.6528643, -0.06170011, 0.7915704, 1, 1, 1, 1, 1,
0.6555763, -0.6115168, 2.167454, 1, 1, 1, 1, 1,
0.6648292, 0.2326785, 2.33473, 0, 0, 1, 1, 1,
0.6659877, -0.9293005, 2.460767, 1, 0, 0, 1, 1,
0.6668511, 0.4059609, 1.687828, 1, 0, 0, 1, 1,
0.6738536, -2.634027, 3.166224, 1, 0, 0, 1, 1,
0.6753263, -0.08026419, 3.381354, 1, 0, 0, 1, 1,
0.6756647, -1.6735, 4.651199, 1, 0, 0, 1, 1,
0.6806634, -0.07482003, 1.525578, 0, 0, 0, 1, 1,
0.6863273, -0.03747753, 1.669337, 0, 0, 0, 1, 1,
0.686491, 1.455906, 0.2202617, 0, 0, 0, 1, 1,
0.6938583, 0.1588037, 0.4833967, 0, 0, 0, 1, 1,
0.6966114, 0.2290041, 2.143636, 0, 0, 0, 1, 1,
0.6968165, 0.4437438, 0.005238851, 0, 0, 0, 1, 1,
0.7075876, -1.602518, 2.238645, 0, 0, 0, 1, 1,
0.7109727, -0.7542388, 3.430544, 1, 1, 1, 1, 1,
0.7136056, 0.263776, 0.4208919, 1, 1, 1, 1, 1,
0.7151495, 0.2388398, 2.782255, 1, 1, 1, 1, 1,
0.7152081, 1.193142, 0.7110963, 1, 1, 1, 1, 1,
0.7162168, 1.091567, 0.1103733, 1, 1, 1, 1, 1,
0.716903, -0.6106034, 2.349058, 1, 1, 1, 1, 1,
0.7172647, 0.2397716, 0.1519648, 1, 1, 1, 1, 1,
0.7197922, -1.205543, 1.044607, 1, 1, 1, 1, 1,
0.723839, -1.359396, 1.197512, 1, 1, 1, 1, 1,
0.7240729, -1.252786, 2.174292, 1, 1, 1, 1, 1,
0.7246454, -0.4526283, 2.602015, 1, 1, 1, 1, 1,
0.7259001, -0.5342523, 2.216496, 1, 1, 1, 1, 1,
0.7260837, 1.573717, 2.916264, 1, 1, 1, 1, 1,
0.7262651, 1.085954, 0.9388654, 1, 1, 1, 1, 1,
0.732173, -1.022825, 3.643868, 1, 1, 1, 1, 1,
0.7362217, -0.1738861, 2.63807, 0, 0, 1, 1, 1,
0.7427675, 0.0885106, 1.159954, 1, 0, 0, 1, 1,
0.7450014, 0.4705075, -0.2753137, 1, 0, 0, 1, 1,
0.7485737, -0.2373545, 2.631943, 1, 0, 0, 1, 1,
0.7509027, 1.266645, 1.140916, 1, 0, 0, 1, 1,
0.7515763, 0.4379036, 2.826844, 1, 0, 0, 1, 1,
0.7674885, 0.735141, 1.015944, 0, 0, 0, 1, 1,
0.768997, -0.2468138, 0.9268307, 0, 0, 0, 1, 1,
0.769383, -0.6534237, 2.154772, 0, 0, 0, 1, 1,
0.7787197, -0.0824516, 2.935112, 0, 0, 0, 1, 1,
0.7807027, -1.623159, 2.078835, 0, 0, 0, 1, 1,
0.7809804, 1.729192, 1.151257, 0, 0, 0, 1, 1,
0.7885378, 2.29136, 0.6487765, 0, 0, 0, 1, 1,
0.7900958, 0.1426893, 1.271211, 1, 1, 1, 1, 1,
0.7903707, -0.06603669, 0.473274, 1, 1, 1, 1, 1,
0.7942157, 0.04647509, 1.025094, 1, 1, 1, 1, 1,
0.7990559, -0.5076571, 2.986383, 1, 1, 1, 1, 1,
0.8020695, 0.08758356, 1.395783, 1, 1, 1, 1, 1,
0.8032749, -2.252434, 3.797428, 1, 1, 1, 1, 1,
0.8105311, 0.2238517, 1.331685, 1, 1, 1, 1, 1,
0.813624, 0.7790076, 0.4882582, 1, 1, 1, 1, 1,
0.818364, -1.202747, 4.478977, 1, 1, 1, 1, 1,
0.8187426, 0.08332335, 3.49096, 1, 1, 1, 1, 1,
0.8211226, -0.7527443, 1.805534, 1, 1, 1, 1, 1,
0.8214296, 0.7468027, 0.5410661, 1, 1, 1, 1, 1,
0.8237541, 0.4378735, -1.342222, 1, 1, 1, 1, 1,
0.8313192, 0.102888, -1.263934, 1, 1, 1, 1, 1,
0.840461, -0.6082674, 1.618696, 1, 1, 1, 1, 1,
0.8430234, -0.6383758, 3.813431, 0, 0, 1, 1, 1,
0.8521487, -2.232684e-05, 1.71023, 1, 0, 0, 1, 1,
0.8537123, -0.9556243, 2.61226, 1, 0, 0, 1, 1,
0.8624311, 0.3483194, 2.716665, 1, 0, 0, 1, 1,
0.8658577, 0.06309228, 1.396764, 1, 0, 0, 1, 1,
0.8667056, 0.8839256, 0.8432207, 1, 0, 0, 1, 1,
0.8722863, -1.509459, 2.963876, 0, 0, 0, 1, 1,
0.8806512, -0.319732, 2.158765, 0, 0, 0, 1, 1,
0.882141, -0.8934814, 1.880835, 0, 0, 0, 1, 1,
0.8826326, -0.9243638, 1.570142, 0, 0, 0, 1, 1,
0.8846388, -0.752451, 0.9438779, 0, 0, 0, 1, 1,
0.8858841, 1.297274, -0.1170756, 0, 0, 0, 1, 1,
0.8885282, 1.6927, 0.439371, 0, 0, 0, 1, 1,
0.89456, -1.449326, 3.038642, 1, 1, 1, 1, 1,
0.8946975, -0.5119664, 2.430231, 1, 1, 1, 1, 1,
0.8983617, 1.617632, 0.5269991, 1, 1, 1, 1, 1,
0.9024334, 0.7178962, 2.738844, 1, 1, 1, 1, 1,
0.9164571, -0.9886903, 2.246703, 1, 1, 1, 1, 1,
0.9335253, -0.6042648, 2.380465, 1, 1, 1, 1, 1,
0.9373363, 0.1799756, 1.201922, 1, 1, 1, 1, 1,
0.9416131, 1.061167, 0.7482446, 1, 1, 1, 1, 1,
0.9454254, -0.2254613, 1.878626, 1, 1, 1, 1, 1,
0.9468971, -0.4906762, 2.920342, 1, 1, 1, 1, 1,
0.956972, 1.298849, 1.524561, 1, 1, 1, 1, 1,
0.9596673, -1.617848, -0.3728049, 1, 1, 1, 1, 1,
0.9664424, 1.165776, 0.6860053, 1, 1, 1, 1, 1,
0.9716216, 1.050046, 0.3460312, 1, 1, 1, 1, 1,
0.9732021, -0.3210028, 1.22496, 1, 1, 1, 1, 1,
0.9766358, -0.3475022, 1.70707, 0, 0, 1, 1, 1,
0.9782217, -1.019787, 2.926734, 1, 0, 0, 1, 1,
0.979982, 0.5668345, 0.3832924, 1, 0, 0, 1, 1,
0.9800637, 0.6884357, 0.687907, 1, 0, 0, 1, 1,
0.9884022, -0.10341, 0.2588814, 1, 0, 0, 1, 1,
0.989184, -1.074833, 0.03680552, 1, 0, 0, 1, 1,
0.9908642, -0.1786755, 1.671877, 0, 0, 0, 1, 1,
0.9928938, 0.1188893, 3.604334, 0, 0, 0, 1, 1,
0.9959348, -1.046409, 1.774609, 0, 0, 0, 1, 1,
1.016062, 0.09953535, 2.24271, 0, 0, 0, 1, 1,
1.025988, -1.649942, 3.538183, 0, 0, 0, 1, 1,
1.029717, 0.9444363, -0.7352893, 0, 0, 0, 1, 1,
1.03282, 1.233101, 0.4949549, 0, 0, 0, 1, 1,
1.034151, -0.8961527, 2.852159, 1, 1, 1, 1, 1,
1.036043, 0.5136404, 0.3524058, 1, 1, 1, 1, 1,
1.037518, -1.452945, 3.277665, 1, 1, 1, 1, 1,
1.039938, 0.5247107, 1.724103, 1, 1, 1, 1, 1,
1.043522, -0.8364884, 2.061481, 1, 1, 1, 1, 1,
1.050606, 0.6962066, 0.9846816, 1, 1, 1, 1, 1,
1.059063, -1.096098, 2.210066, 1, 1, 1, 1, 1,
1.077117, -0.8199849, 1.646018, 1, 1, 1, 1, 1,
1.083237, 0.2532124, 0.9018513, 1, 1, 1, 1, 1,
1.084304, -1.302229, 2.619022, 1, 1, 1, 1, 1,
1.093082, -0.4070371, 1.857487, 1, 1, 1, 1, 1,
1.094915, -0.7980354, 3.891958, 1, 1, 1, 1, 1,
1.107679, 0.3644867, 0.7790046, 1, 1, 1, 1, 1,
1.109333, -0.3402361, 2.999071, 1, 1, 1, 1, 1,
1.116172, 0.5985092, 0.4301446, 1, 1, 1, 1, 1,
1.116224, 0.8466573, 0.5353862, 0, 0, 1, 1, 1,
1.120064, 0.4777547, 0.0567545, 1, 0, 0, 1, 1,
1.120969, 1.126966, 1.410464, 1, 0, 0, 1, 1,
1.124244, 0.9721729, 2.194396, 1, 0, 0, 1, 1,
1.132774, -0.1408729, 4.039183, 1, 0, 0, 1, 1,
1.141781, -0.831683, 2.007668, 1, 0, 0, 1, 1,
1.144947, 0.6844006, 0.5045131, 0, 0, 0, 1, 1,
1.146234, -1.0222, 1.601303, 0, 0, 0, 1, 1,
1.154815, 0.1219418, 2.311519, 0, 0, 0, 1, 1,
1.157496, 0.6807998, 0.4993044, 0, 0, 0, 1, 1,
1.16025, -0.51191, 2.823871, 0, 0, 0, 1, 1,
1.165116, -0.6107673, 2.311728, 0, 0, 0, 1, 1,
1.165345, -1.238519, 1.629133, 0, 0, 0, 1, 1,
1.181271, 0.6155947, 0.7939416, 1, 1, 1, 1, 1,
1.185644, 0.614718, 1.822278, 1, 1, 1, 1, 1,
1.189212, 1.214216, -0.01195711, 1, 1, 1, 1, 1,
1.192085, 0.978803, 0.4823605, 1, 1, 1, 1, 1,
1.194517, 1.561351, 0.6245537, 1, 1, 1, 1, 1,
1.196473, -0.2436992, 1.36901, 1, 1, 1, 1, 1,
1.199343, 0.4279803, 2.588722, 1, 1, 1, 1, 1,
1.199406, 0.8469767, -0.4734368, 1, 1, 1, 1, 1,
1.209271, -0.2833867, 1.723308, 1, 1, 1, 1, 1,
1.211844, 0.8180045, 0.7500976, 1, 1, 1, 1, 1,
1.21281, 0.3930388, 1.251956, 1, 1, 1, 1, 1,
1.217548, -0.4504172, 1.263351, 1, 1, 1, 1, 1,
1.235443, -0.2766117, 2.00497, 1, 1, 1, 1, 1,
1.238976, -1.035904, 2.702985, 1, 1, 1, 1, 1,
1.248024, 0.3562036, 1.063269, 1, 1, 1, 1, 1,
1.253872, 0.4874744, 1.736318, 0, 0, 1, 1, 1,
1.254042, -0.650641, 2.177006, 1, 0, 0, 1, 1,
1.26262, -1.065485, 2.04971, 1, 0, 0, 1, 1,
1.263195, 1.786427, 1.180034, 1, 0, 0, 1, 1,
1.264836, 0.6362873, 0.561358, 1, 0, 0, 1, 1,
1.274879, 0.7729404, 1.640112, 1, 0, 0, 1, 1,
1.280723, -0.5790321, 0.9357163, 0, 0, 0, 1, 1,
1.284572, 0.1589337, 2.266604, 0, 0, 0, 1, 1,
1.285362, -1.40246, 3.903382, 0, 0, 0, 1, 1,
1.286585, -0.05539194, 2.526683, 0, 0, 0, 1, 1,
1.292084, 0.5378181, 0.7597471, 0, 0, 0, 1, 1,
1.29533, 0.9169934, 0.924077, 0, 0, 0, 1, 1,
1.295577, 0.6988838, 1.533283, 0, 0, 0, 1, 1,
1.306534, -0.7715669, 2.656739, 1, 1, 1, 1, 1,
1.306866, 0.1963579, 0.4649905, 1, 1, 1, 1, 1,
1.315146, -1.168001, 2.932899, 1, 1, 1, 1, 1,
1.321575, 2.111998, 1.2231, 1, 1, 1, 1, 1,
1.324283, -1.020642, 2.26705, 1, 1, 1, 1, 1,
1.326058, -0.5545582, 2.29511, 1, 1, 1, 1, 1,
1.330145, -0.9626753, 0.8326877, 1, 1, 1, 1, 1,
1.34444, -1.403293, 1.967151, 1, 1, 1, 1, 1,
1.346223, 0.2239333, 1.026027, 1, 1, 1, 1, 1,
1.352837, 0.09844896, 2.740538, 1, 1, 1, 1, 1,
1.353551, 0.238033, 3.560657, 1, 1, 1, 1, 1,
1.36211, 0.2526816, 1.050631, 1, 1, 1, 1, 1,
1.369165, -1.339469, 3.632111, 1, 1, 1, 1, 1,
1.379717, -0.5465069, 1.616327, 1, 1, 1, 1, 1,
1.380025, 0.3804547, -0.3714231, 1, 1, 1, 1, 1,
1.384657, 0.1409524, 3.403965, 0, 0, 1, 1, 1,
1.390175, 0.2009797, 0.1766833, 1, 0, 0, 1, 1,
1.390944, -2.595579, 2.382004, 1, 0, 0, 1, 1,
1.395366, -0.6548157, 2.250382, 1, 0, 0, 1, 1,
1.396377, -0.9419035, 1.27043, 1, 0, 0, 1, 1,
1.40644, 0.5219029, 1.163195, 1, 0, 0, 1, 1,
1.407336, -2.461346, 1.625357, 0, 0, 0, 1, 1,
1.437922, 0.2260035, -0.8868737, 0, 0, 0, 1, 1,
1.44342, 1.684962, 0.07056426, 0, 0, 0, 1, 1,
1.451639, 0.07127604, 4.112932, 0, 0, 0, 1, 1,
1.452688, 2.418611, 1.577986, 0, 0, 0, 1, 1,
1.457119, -1.042739, 0.06527368, 0, 0, 0, 1, 1,
1.457905, 0.5040708, 0.8073625, 0, 0, 0, 1, 1,
1.470403, 1.62797, 1.777059, 1, 1, 1, 1, 1,
1.477184, 0.1892854, 1.381165, 1, 1, 1, 1, 1,
1.484169, -0.6829664, 0.4599736, 1, 1, 1, 1, 1,
1.489281, -0.3727772, 2.531648, 1, 1, 1, 1, 1,
1.50467, -1.718253, 3.288555, 1, 1, 1, 1, 1,
1.506099, 0.664264, 0.9204162, 1, 1, 1, 1, 1,
1.511354, -0.7537072, 1.28824, 1, 1, 1, 1, 1,
1.524509, -0.729883, 2.282092, 1, 1, 1, 1, 1,
1.528285, 1.16651, 0.4747556, 1, 1, 1, 1, 1,
1.535673, 1.390213, 0.001307948, 1, 1, 1, 1, 1,
1.540146, -1.121617, 1.812119, 1, 1, 1, 1, 1,
1.54352, 0.3548693, 1.799528, 1, 1, 1, 1, 1,
1.570743, 0.6698138, 1.360316, 1, 1, 1, 1, 1,
1.58548, 1.662061, 0.4856319, 1, 1, 1, 1, 1,
1.597918, 0.6821027, 0.03869236, 1, 1, 1, 1, 1,
1.604406, -0.1839462, 0.09561469, 0, 0, 1, 1, 1,
1.617998, -0.5723335, 1.373119, 1, 0, 0, 1, 1,
1.635841, 0.4809826, 1.255973, 1, 0, 0, 1, 1,
1.67431, -0.3871652, 2.586407, 1, 0, 0, 1, 1,
1.676279, 0.4083791, 4.146695, 1, 0, 0, 1, 1,
1.706273, 0.4885139, 0.4989242, 1, 0, 0, 1, 1,
1.70629, 1.140966, 1.804305, 0, 0, 0, 1, 1,
1.715009, -0.2163269, 0.5161635, 0, 0, 0, 1, 1,
1.716506, -0.6867522, 2.99095, 0, 0, 0, 1, 1,
1.720654, 0.8108565, 1.988837, 0, 0, 0, 1, 1,
1.721331, 0.2277593, 1.366603, 0, 0, 0, 1, 1,
1.730391, 0.343634, 2.644496, 0, 0, 0, 1, 1,
1.733256, 0.1652088, 0.8394877, 0, 0, 0, 1, 1,
1.741429, -0.2051423, 1.454761, 1, 1, 1, 1, 1,
1.748647, 0.2012484, 3.421128, 1, 1, 1, 1, 1,
1.750941, -0.7317812, 0.9823572, 1, 1, 1, 1, 1,
1.752488, 0.4032584, 0.4219382, 1, 1, 1, 1, 1,
1.779678, -0.7832666, 2.540461, 1, 1, 1, 1, 1,
1.789792, -0.7599293, 4.43315, 1, 1, 1, 1, 1,
1.860456, 0.3722247, -0.4144703, 1, 1, 1, 1, 1,
1.893477, 0.1093436, 2.451454, 1, 1, 1, 1, 1,
1.903396, -1.159469, 3.140097, 1, 1, 1, 1, 1,
1.903695, -0.2794228, 1.598149, 1, 1, 1, 1, 1,
1.909454, -0.08747407, 2.860222, 1, 1, 1, 1, 1,
1.941006, 1.552053, 1.41619, 1, 1, 1, 1, 1,
1.949289, 0.1656675, 0.0899255, 1, 1, 1, 1, 1,
1.979136, -0.2782086, -0.4671174, 1, 1, 1, 1, 1,
1.98705, -0.8890259, 1.519122, 1, 1, 1, 1, 1,
2.05784, -0.3412617, 2.524983, 0, 0, 1, 1, 1,
2.080942, 0.5362163, 1.667783, 1, 0, 0, 1, 1,
2.081156, -0.7118359, 1.325954, 1, 0, 0, 1, 1,
2.085763, 1.561388, 2.02322, 1, 0, 0, 1, 1,
2.176979, 0.2670511, 3.202823, 1, 0, 0, 1, 1,
2.201533, -0.141579, 3.078606, 1, 0, 0, 1, 1,
2.217822, 1.383714, 2.996833, 0, 0, 0, 1, 1,
2.228963, 1.34719, 0.9751897, 0, 0, 0, 1, 1,
2.333475, 1.023319, 0.5536593, 0, 0, 0, 1, 1,
2.402074, 0.2887069, 0.5438498, 0, 0, 0, 1, 1,
2.437378, 0.5626135, -0.1858353, 0, 0, 0, 1, 1,
2.473946, 0.06556143, 1.31418, 0, 0, 0, 1, 1,
2.497863, 1.782462, 2.318359, 0, 0, 0, 1, 1,
2.54961, -0.4549847, 1.105512, 1, 1, 1, 1, 1,
2.590346, -0.3816814, 0.6973608, 1, 1, 1, 1, 1,
2.75237, -1.94672, 1.280574, 1, 1, 1, 1, 1,
2.77492, 1.517933, 2.650117, 1, 1, 1, 1, 1,
2.798532, 0.6924788, 3.080746, 1, 1, 1, 1, 1,
2.811649, -0.6365755, 0.9017009, 1, 1, 1, 1, 1,
3.161415, 0.6208664, 1.931013, 1, 1, 1, 1, 1
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
var radius = 9.817655;
var distance = 34.48409;
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
mvMatrix.translate( 0.06453848, 0.08012414, 0.1967335 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.48409);
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