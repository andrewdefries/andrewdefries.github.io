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
-2.753919, -0.9732762, -0.6749665, 1, 0, 0, 1,
-2.709388, 1.467868, 0.7876512, 1, 0.007843138, 0, 1,
-2.61634, -2.09392, -2.253839, 1, 0.01176471, 0, 1,
-2.604724, 0.07924571, -0.5793267, 1, 0.01960784, 0, 1,
-2.588607, 1.217057, -0.9364672, 1, 0.02352941, 0, 1,
-2.556032, -1.430511, -0.7094715, 1, 0.03137255, 0, 1,
-2.520176, -0.4143349, -1.148429, 1, 0.03529412, 0, 1,
-2.514891, -0.4919773, -1.337795, 1, 0.04313726, 0, 1,
-2.493304, -0.1740227, -1.957228, 1, 0.04705882, 0, 1,
-2.492369, -1.112878, -2.393183, 1, 0.05490196, 0, 1,
-2.453539, -0.3410566, -1.345841, 1, 0.05882353, 0, 1,
-2.342919, -0.02160057, -1.170659, 1, 0.06666667, 0, 1,
-2.28771, -0.159501, -1.587298, 1, 0.07058824, 0, 1,
-2.276002, -0.4331977, -1.115099, 1, 0.07843138, 0, 1,
-2.273296, -0.3851173, -2.506541, 1, 0.08235294, 0, 1,
-2.203276, 0.5060331, -1.878255, 1, 0.09019608, 0, 1,
-2.184833, -0.1182212, -1.410863, 1, 0.09411765, 0, 1,
-2.163529, 0.2198528, -1.513608, 1, 0.1019608, 0, 1,
-2.068256, 0.7805618, -2.068078, 1, 0.1098039, 0, 1,
-2.034052, 1.851358, -0.1858209, 1, 0.1137255, 0, 1,
-2.00713, -0.7735327, -1.617821, 1, 0.1215686, 0, 1,
-2.005056, -0.2549641, -0.8905907, 1, 0.1254902, 0, 1,
-1.98713, 0.3658139, -1.090827, 1, 0.1333333, 0, 1,
-1.986811, 0.4154344, -0.6138418, 1, 0.1372549, 0, 1,
-1.975545, -1.005534, -2.763795, 1, 0.145098, 0, 1,
-1.943605, 0.4775336, -1.308948, 1, 0.1490196, 0, 1,
-1.92487, 0.6043554, -1.209185, 1, 0.1568628, 0, 1,
-1.914155, -0.8979006, -0.9304057, 1, 0.1607843, 0, 1,
-1.911669, 0.7251001, 0.8524485, 1, 0.1686275, 0, 1,
-1.898541, 0.9678639, -2.233371, 1, 0.172549, 0, 1,
-1.892264, 1.27226, 0.836705, 1, 0.1803922, 0, 1,
-1.891968, -0.4180388, -2.080545, 1, 0.1843137, 0, 1,
-1.888861, 0.2126719, -2.757521, 1, 0.1921569, 0, 1,
-1.862849, -0.4101045, -0.6539466, 1, 0.1960784, 0, 1,
-1.855603, -1.843161, -2.493863, 1, 0.2039216, 0, 1,
-1.853361, 1.675342, -2.923546, 1, 0.2117647, 0, 1,
-1.825331, 0.5354315, -2.897127, 1, 0.2156863, 0, 1,
-1.8195, 0.545603, -0.7351353, 1, 0.2235294, 0, 1,
-1.816855, -1.143071, 0.01989702, 1, 0.227451, 0, 1,
-1.810877, 2.349685, -0.5525004, 1, 0.2352941, 0, 1,
-1.803978, 2.476343, -0.4232958, 1, 0.2392157, 0, 1,
-1.803319, 0.5194501, -0.6196187, 1, 0.2470588, 0, 1,
-1.786916, 0.2404724, -0.8148503, 1, 0.2509804, 0, 1,
-1.771995, -0.3990866, -1.08063, 1, 0.2588235, 0, 1,
-1.771727, 0.9573649, -1.230299, 1, 0.2627451, 0, 1,
-1.763049, -1.697656, -2.346844, 1, 0.2705882, 0, 1,
-1.761685, -0.35575, -1.478341, 1, 0.2745098, 0, 1,
-1.750508, 1.250902, 0.5152739, 1, 0.282353, 0, 1,
-1.744203, -0.09912812, -0.6246312, 1, 0.2862745, 0, 1,
-1.723719, -0.7025707, -2.955381, 1, 0.2941177, 0, 1,
-1.723482, -0.03039553, -3.185286, 1, 0.3019608, 0, 1,
-1.723298, 0.03962567, -2.129465, 1, 0.3058824, 0, 1,
-1.715972, -0.6091535, -2.185071, 1, 0.3137255, 0, 1,
-1.691007, -2.24567, -3.264543, 1, 0.3176471, 0, 1,
-1.688285, -0.2381482, -2.397326, 1, 0.3254902, 0, 1,
-1.648057, -0.8555351, -1.133881, 1, 0.3294118, 0, 1,
-1.641417, -1.065653, -2.673617, 1, 0.3372549, 0, 1,
-1.638496, -0.6320558, -2.491698, 1, 0.3411765, 0, 1,
-1.628552, -0.8716598, -2.438129, 1, 0.3490196, 0, 1,
-1.620383, -0.6565953, -2.259049, 1, 0.3529412, 0, 1,
-1.619197, -0.9343132, -3.165276, 1, 0.3607843, 0, 1,
-1.585892, -0.8418384, -3.34374, 1, 0.3647059, 0, 1,
-1.584885, -0.5991887, -2.210852, 1, 0.372549, 0, 1,
-1.57415, 1.141608, -1.035825, 1, 0.3764706, 0, 1,
-1.561938, -0.4707014, 0.1355915, 1, 0.3843137, 0, 1,
-1.558132, 0.8657297, -2.167871, 1, 0.3882353, 0, 1,
-1.554029, 1.493333, -1.014712, 1, 0.3960784, 0, 1,
-1.550893, -0.2670105, -2.106086, 1, 0.4039216, 0, 1,
-1.544663, -0.7227657, -2.650606, 1, 0.4078431, 0, 1,
-1.544234, -0.671308, -2.635451, 1, 0.4156863, 0, 1,
-1.543736, 0.6679096, -3.593418, 1, 0.4196078, 0, 1,
-1.542573, -0.7389458, -2.391139, 1, 0.427451, 0, 1,
-1.532502, 0.8772127, -0.6318958, 1, 0.4313726, 0, 1,
-1.529772, -0.5624428, -1.079738, 1, 0.4392157, 0, 1,
-1.52774, -0.3023285, -2.415836, 1, 0.4431373, 0, 1,
-1.522396, 0.1094232, -1.254687, 1, 0.4509804, 0, 1,
-1.517908, 1.788271, -0.9243172, 1, 0.454902, 0, 1,
-1.511078, 0.01034737, -2.164574, 1, 0.4627451, 0, 1,
-1.508414, 1.720495, -0.3057523, 1, 0.4666667, 0, 1,
-1.50556, 0.7491875, -2.884503, 1, 0.4745098, 0, 1,
-1.504421, 0.7266304, -0.5230907, 1, 0.4784314, 0, 1,
-1.499171, -1.653049, -3.673433, 1, 0.4862745, 0, 1,
-1.478248, 1.169263, -1.424108, 1, 0.4901961, 0, 1,
-1.475441, 0.2216176, -3.248649, 1, 0.4980392, 0, 1,
-1.467683, 1.032598, -0.7259438, 1, 0.5058824, 0, 1,
-1.462498, 1.081815, -2.112389, 1, 0.509804, 0, 1,
-1.457371, 0.6350536, -1.644598, 1, 0.5176471, 0, 1,
-1.437281, -0.8529257, -1.764879, 1, 0.5215687, 0, 1,
-1.428687, -1.439219, -1.381747, 1, 0.5294118, 0, 1,
-1.426461, 0.569675, -0.9081177, 1, 0.5333334, 0, 1,
-1.424007, 1.301587, -1.545912, 1, 0.5411765, 0, 1,
-1.423425, -1.445599, -1.884504, 1, 0.5450981, 0, 1,
-1.412831, -0.3393669, -1.161252, 1, 0.5529412, 0, 1,
-1.410619, 0.5890811, -1.785164, 1, 0.5568628, 0, 1,
-1.410166, -0.3650056, -1.831253, 1, 0.5647059, 0, 1,
-1.398479, -0.02782893, -1.916527, 1, 0.5686275, 0, 1,
-1.397279, 1.133166, -1.219562, 1, 0.5764706, 0, 1,
-1.392308, -1.549238, -3.489296, 1, 0.5803922, 0, 1,
-1.389091, -1.150853, -3.233571, 1, 0.5882353, 0, 1,
-1.36519, 0.01093064, -0.304888, 1, 0.5921569, 0, 1,
-1.361372, 0.283845, -0.9676439, 1, 0.6, 0, 1,
-1.359817, -0.7135227, -0.4085152, 1, 0.6078432, 0, 1,
-1.359726, 0.05448231, -1.0457, 1, 0.6117647, 0, 1,
-1.356382, -0.4569531, -0.9318501, 1, 0.6196079, 0, 1,
-1.355195, 1.529114, -1.096406, 1, 0.6235294, 0, 1,
-1.354028, 0.7342102, -0.191017, 1, 0.6313726, 0, 1,
-1.353232, 0.4674217, -1.573186, 1, 0.6352941, 0, 1,
-1.340497, 0.4975219, -0.2010908, 1, 0.6431373, 0, 1,
-1.335997, -0.04082813, -4.03699, 1, 0.6470588, 0, 1,
-1.331033, -0.1283881, 0.2938807, 1, 0.654902, 0, 1,
-1.327804, 0.9941504, -1.676598, 1, 0.6588235, 0, 1,
-1.314729, -0.8800606, -1.1965, 1, 0.6666667, 0, 1,
-1.297231, -0.2760671, -3.475603, 1, 0.6705883, 0, 1,
-1.292909, -0.3334939, -2.734066, 1, 0.6784314, 0, 1,
-1.292789, 0.9256816, -2.173519, 1, 0.682353, 0, 1,
-1.290952, -0.7634329, -3.51023, 1, 0.6901961, 0, 1,
-1.286098, 0.5954577, -1.319752, 1, 0.6941177, 0, 1,
-1.28076, 0.8539882, 0.1821158, 1, 0.7019608, 0, 1,
-1.276042, -0.8163232, -1.683523, 1, 0.7098039, 0, 1,
-1.269945, 0.5748946, -2.581331, 1, 0.7137255, 0, 1,
-1.266408, 0.3419879, -1.104925, 1, 0.7215686, 0, 1,
-1.26381, 0.6894844, -0.06492087, 1, 0.7254902, 0, 1,
-1.262269, -1.329101, -3.458174, 1, 0.7333333, 0, 1,
-1.255168, 2.275291, -1.287751, 1, 0.7372549, 0, 1,
-1.254616, 0.3137336, -1.218159, 1, 0.7450981, 0, 1,
-1.251018, 0.519227, -0.3504986, 1, 0.7490196, 0, 1,
-1.249197, 0.7432786, -1.14201, 1, 0.7568628, 0, 1,
-1.247112, 1.457682, -1.382759, 1, 0.7607843, 0, 1,
-1.244668, 0.08436838, -2.006923, 1, 0.7686275, 0, 1,
-1.243868, -1.440907, -2.50082, 1, 0.772549, 0, 1,
-1.216271, 1.329722, -1.225745, 1, 0.7803922, 0, 1,
-1.21353, -0.8953303, -1.818249, 1, 0.7843137, 0, 1,
-1.212647, 0.1421644, -2.738178, 1, 0.7921569, 0, 1,
-1.212555, -0.9601408, -1.764998, 1, 0.7960784, 0, 1,
-1.21224, -0.08093971, -1.328963, 1, 0.8039216, 0, 1,
-1.208264, 0.1130833, 0.7044524, 1, 0.8117647, 0, 1,
-1.198279, -1.141847, -2.239691, 1, 0.8156863, 0, 1,
-1.196046, -1.980902, -3.193767, 1, 0.8235294, 0, 1,
-1.193931, -0.2559799, -2.752388, 1, 0.827451, 0, 1,
-1.186258, 0.5246547, -1.612814, 1, 0.8352941, 0, 1,
-1.175827, -0.1537549, -0.7346508, 1, 0.8392157, 0, 1,
-1.17476, 0.4851488, -1.597738, 1, 0.8470588, 0, 1,
-1.169804, 1.880132, -3.050224, 1, 0.8509804, 0, 1,
-1.16735, -0.9361719, -4.243429, 1, 0.8588235, 0, 1,
-1.162648, -0.9538598, -1.238004, 1, 0.8627451, 0, 1,
-1.15576, -0.05813603, -2.459826, 1, 0.8705882, 0, 1,
-1.152975, 0.419343, -2.801274, 1, 0.8745098, 0, 1,
-1.145926, 0.739249, -2.007445, 1, 0.8823529, 0, 1,
-1.142612, 0.4514806, -2.699275, 1, 0.8862745, 0, 1,
-1.142466, 0.09416829, -2.850095, 1, 0.8941177, 0, 1,
-1.13665, -1.132881, -0.578599, 1, 0.8980392, 0, 1,
-1.133649, -1.420336, -2.561675, 1, 0.9058824, 0, 1,
-1.128744, 0.8217375, -1.089697, 1, 0.9137255, 0, 1,
-1.120082, 1.022397, 0.1532435, 1, 0.9176471, 0, 1,
-1.119399, 1.659693, 0.5290889, 1, 0.9254902, 0, 1,
-1.118811, -0.4827254, -2.654711, 1, 0.9294118, 0, 1,
-1.108208, -1.147067, -1.727328, 1, 0.9372549, 0, 1,
-1.107466, -1.525214, -2.258504, 1, 0.9411765, 0, 1,
-1.105116, 0.3212987, -2.547343, 1, 0.9490196, 0, 1,
-1.104662, -0.8190473, -3.766871, 1, 0.9529412, 0, 1,
-1.103265, -0.4917734, -3.708753, 1, 0.9607843, 0, 1,
-1.093383, -0.01481881, -1.636135, 1, 0.9647059, 0, 1,
-1.092291, -0.2272208, -0.6296001, 1, 0.972549, 0, 1,
-1.089167, 0.01345245, -0.9014324, 1, 0.9764706, 0, 1,
-1.086398, -1.53782, -3.840676, 1, 0.9843137, 0, 1,
-1.075202, 1.860045, -0.8803163, 1, 0.9882353, 0, 1,
-1.070034, -0.8453587, -1.619982, 1, 0.9960784, 0, 1,
-1.058355, -2.242554, -3.871393, 0.9960784, 1, 0, 1,
-1.05527, 1.220657, -0.4404911, 0.9921569, 1, 0, 1,
-1.0544, -1.092066, -2.157825, 0.9843137, 1, 0, 1,
-1.048968, -0.1661079, -2.08598, 0.9803922, 1, 0, 1,
-1.041388, 0.4192449, -0.6091669, 0.972549, 1, 0, 1,
-1.021579, -1.369969, -3.503432, 0.9686275, 1, 0, 1,
-1.018727, -0.8765888, -0.7396685, 0.9607843, 1, 0, 1,
-1.017275, -2.594668, -4.210804, 0.9568627, 1, 0, 1,
-1.016452, 0.08502606, -2.633212, 0.9490196, 1, 0, 1,
-1.013738, -0.5283735, -2.546746, 0.945098, 1, 0, 1,
-1.007688, 1.68728, -0.9158966, 0.9372549, 1, 0, 1,
-1.006677, 2.30751, 0.9379596, 0.9333333, 1, 0, 1,
-1.004471, -2.174351, -2.776368, 0.9254902, 1, 0, 1,
-1.004085, -2.604949, -2.066763, 0.9215686, 1, 0, 1,
-1.002937, -0.7257724, -3.396791, 0.9137255, 1, 0, 1,
-0.9963146, -0.8776305, -2.509747, 0.9098039, 1, 0, 1,
-0.9827316, 1.662138, -1.733863, 0.9019608, 1, 0, 1,
-0.9822564, 0.2205961, -0.9518296, 0.8941177, 1, 0, 1,
-0.9734474, 1.991968, -2.063593, 0.8901961, 1, 0, 1,
-0.972659, -0.4188899, -2.83742, 0.8823529, 1, 0, 1,
-0.9724255, 0.7244909, -1.430453, 0.8784314, 1, 0, 1,
-0.9529158, -0.7986966, -3.332549, 0.8705882, 1, 0, 1,
-0.9492216, -0.5675883, -2.672829, 0.8666667, 1, 0, 1,
-0.9431887, -1.359992, -3.200883, 0.8588235, 1, 0, 1,
-0.9265518, -0.20673, -1.939139, 0.854902, 1, 0, 1,
-0.9148139, 1.547871, 0.8627721, 0.8470588, 1, 0, 1,
-0.9122185, -1.072288, -0.3881305, 0.8431373, 1, 0, 1,
-0.9055879, -1.96491, -2.712151, 0.8352941, 1, 0, 1,
-0.9033922, -0.3879885, -2.140584, 0.8313726, 1, 0, 1,
-0.9030959, 0.1188186, -1.362176, 0.8235294, 1, 0, 1,
-0.8954247, 1.63381, -0.1503996, 0.8196079, 1, 0, 1,
-0.8950089, 0.01349322, -1.644509, 0.8117647, 1, 0, 1,
-0.8937458, -1.035509, -1.791019, 0.8078431, 1, 0, 1,
-0.8930868, 1.575804, -0.3879911, 0.8, 1, 0, 1,
-0.892886, 0.7289159, -1.406823, 0.7921569, 1, 0, 1,
-0.8908674, -1.258987, -4.202114, 0.7882353, 1, 0, 1,
-0.8868367, -0.8265166, -2.057107, 0.7803922, 1, 0, 1,
-0.8861742, 0.1043434, -1.622771, 0.7764706, 1, 0, 1,
-0.8814925, 0.7236949, -0.5835806, 0.7686275, 1, 0, 1,
-0.8744566, 1.502844, -0.7033326, 0.7647059, 1, 0, 1,
-0.872731, -0.2664356, -3.394472, 0.7568628, 1, 0, 1,
-0.865736, -0.4199132, -1.229978, 0.7529412, 1, 0, 1,
-0.8656056, 0.6591888, -0.4878002, 0.7450981, 1, 0, 1,
-0.859454, -0.7201605, -2.483179, 0.7411765, 1, 0, 1,
-0.8585402, -1.263206, -2.088446, 0.7333333, 1, 0, 1,
-0.8573368, 1.140625, 0.1624594, 0.7294118, 1, 0, 1,
-0.8570678, -1.468866, -2.816862, 0.7215686, 1, 0, 1,
-0.8568725, 1.264888, 0.2634868, 0.7176471, 1, 0, 1,
-0.8546216, -0.03630847, -0.3096045, 0.7098039, 1, 0, 1,
-0.8447779, -0.4118212, -2.19427, 0.7058824, 1, 0, 1,
-0.8442772, 0.4721845, -0.1024065, 0.6980392, 1, 0, 1,
-0.8435383, -1.8836, -3.38339, 0.6901961, 1, 0, 1,
-0.83915, 1.242836, -1.790328, 0.6862745, 1, 0, 1,
-0.8390528, -1.58532, -2.299673, 0.6784314, 1, 0, 1,
-0.8299035, 0.9815965, -0.55185, 0.6745098, 1, 0, 1,
-0.8186329, 0.7479661, -0.3365319, 0.6666667, 1, 0, 1,
-0.8181065, -0.9120091, -3.27171, 0.6627451, 1, 0, 1,
-0.8145616, -0.4874574, -2.964702, 0.654902, 1, 0, 1,
-0.8144075, 0.378244, 0.5582291, 0.6509804, 1, 0, 1,
-0.814001, 0.6864206, -2.056162, 0.6431373, 1, 0, 1,
-0.8107617, 0.8190918, -1.176594, 0.6392157, 1, 0, 1,
-0.8085487, -0.1108704, -2.999748, 0.6313726, 1, 0, 1,
-0.7984741, 1.366748, -0.6620265, 0.627451, 1, 0, 1,
-0.7944393, -0.1593051, -1.513228, 0.6196079, 1, 0, 1,
-0.7931582, -0.8551765, -2.135325, 0.6156863, 1, 0, 1,
-0.792021, 0.6701612, -1.199931, 0.6078432, 1, 0, 1,
-0.7903668, -1.32994, -3.309594, 0.6039216, 1, 0, 1,
-0.7889373, 1.013685, 0.3902856, 0.5960785, 1, 0, 1,
-0.788621, 0.01825773, -2.766012, 0.5882353, 1, 0, 1,
-0.7866899, -0.8177968, -4.232895, 0.5843138, 1, 0, 1,
-0.7859948, -0.7949983, -2.60367, 0.5764706, 1, 0, 1,
-0.7782317, 0.4895196, -1.621544, 0.572549, 1, 0, 1,
-0.7776403, 0.3432801, -1.736747, 0.5647059, 1, 0, 1,
-0.7733933, -0.594138, -4.079851, 0.5607843, 1, 0, 1,
-0.7729078, -1.436805, -2.345068, 0.5529412, 1, 0, 1,
-0.770533, -0.4077348, -2.576322, 0.5490196, 1, 0, 1,
-0.7677391, 0.1997318, -0.8820605, 0.5411765, 1, 0, 1,
-0.7626461, -1.312945, -2.484431, 0.5372549, 1, 0, 1,
-0.7519206, -0.3841447, -2.535289, 0.5294118, 1, 0, 1,
-0.7514845, -0.1810752, -0.9311132, 0.5254902, 1, 0, 1,
-0.744496, -0.1608792, -3.009458, 0.5176471, 1, 0, 1,
-0.7431412, 0.3158743, -0.3079145, 0.5137255, 1, 0, 1,
-0.7262995, -0.6274945, -1.159979, 0.5058824, 1, 0, 1,
-0.7227417, 0.2024752, -2.346145, 0.5019608, 1, 0, 1,
-0.7198069, -2.663204, -4.195733, 0.4941176, 1, 0, 1,
-0.7182315, -0.07913615, -2.240368, 0.4862745, 1, 0, 1,
-0.7097812, -0.08760992, -2.712656, 0.4823529, 1, 0, 1,
-0.7091986, -0.08196926, -3.3791, 0.4745098, 1, 0, 1,
-0.7090737, -0.7105395, -2.746021, 0.4705882, 1, 0, 1,
-0.7076148, 1.006034, -0.9604251, 0.4627451, 1, 0, 1,
-0.7052699, 0.4485724, -1.582782, 0.4588235, 1, 0, 1,
-0.6992734, -1.081017, -1.616659, 0.4509804, 1, 0, 1,
-0.6983506, -1.761482, -4.243451, 0.4470588, 1, 0, 1,
-0.69629, 0.6477447, -2.645424, 0.4392157, 1, 0, 1,
-0.6942627, -0.2326527, -1.783799, 0.4352941, 1, 0, 1,
-0.6932892, 0.09804966, -0.4597144, 0.427451, 1, 0, 1,
-0.6864166, -0.6681763, -1.97217, 0.4235294, 1, 0, 1,
-0.6859877, -0.2996394, -1.777696, 0.4156863, 1, 0, 1,
-0.6839502, 1.206432, -0.9272301, 0.4117647, 1, 0, 1,
-0.6833175, 1.01439, -1.241528, 0.4039216, 1, 0, 1,
-0.6829721, -0.8972155, -2.94478, 0.3960784, 1, 0, 1,
-0.6814995, -0.3318698, -2.892516, 0.3921569, 1, 0, 1,
-0.6784413, 1.095294, 1.061595, 0.3843137, 1, 0, 1,
-0.6776276, 0.5916406, -2.661391, 0.3803922, 1, 0, 1,
-0.6737715, -0.6026807, -1.272141, 0.372549, 1, 0, 1,
-0.6717333, -0.5148872, -4.045606, 0.3686275, 1, 0, 1,
-0.6597061, 1.629243, -1.736825, 0.3607843, 1, 0, 1,
-0.6590854, 2.251431, -0.008952601, 0.3568628, 1, 0, 1,
-0.6586866, 1.837324, -1.972458, 0.3490196, 1, 0, 1,
-0.6586704, -0.4115355, -1.873003, 0.345098, 1, 0, 1,
-0.6511628, -0.2528053, -3.33087, 0.3372549, 1, 0, 1,
-0.6459966, -0.008498766, -2.711212, 0.3333333, 1, 0, 1,
-0.6427378, -1.741365, -2.119854, 0.3254902, 1, 0, 1,
-0.6407265, 1.373436, -1.352325, 0.3215686, 1, 0, 1,
-0.6344163, -1.736745, -2.058458, 0.3137255, 1, 0, 1,
-0.6328454, 1.200162, -1.423807, 0.3098039, 1, 0, 1,
-0.6312552, 0.4608034, -2.240894, 0.3019608, 1, 0, 1,
-0.6305614, -0.7930417, -1.257046, 0.2941177, 1, 0, 1,
-0.6285262, -0.598845, -2.148243, 0.2901961, 1, 0, 1,
-0.6276184, 0.1996495, -0.5573969, 0.282353, 1, 0, 1,
-0.6234427, -0.4882711, -0.6480989, 0.2784314, 1, 0, 1,
-0.6230787, -0.711961, -1.044371, 0.2705882, 1, 0, 1,
-0.6082847, 3.092078, -0.5186452, 0.2666667, 1, 0, 1,
-0.6030976, -0.1370097, -3.938991, 0.2588235, 1, 0, 1,
-0.6023328, -1.777246, -0.9365493, 0.254902, 1, 0, 1,
-0.6004327, 0.2691957, -2.105669, 0.2470588, 1, 0, 1,
-0.5981436, -0.1210853, -1.98553, 0.2431373, 1, 0, 1,
-0.5961743, 0.616115, -1.647561, 0.2352941, 1, 0, 1,
-0.5948016, -0.03629766, -0.1305504, 0.2313726, 1, 0, 1,
-0.5929314, 1.06297, 0.5343736, 0.2235294, 1, 0, 1,
-0.5927232, -0.3910346, -3.309677, 0.2196078, 1, 0, 1,
-0.5916967, 0.6931812, -0.2274299, 0.2117647, 1, 0, 1,
-0.5904565, 1.155687, -0.8723809, 0.2078431, 1, 0, 1,
-0.590304, 0.08114569, -0.8461087, 0.2, 1, 0, 1,
-0.5873336, 1.717071, 0.9753087, 0.1921569, 1, 0, 1,
-0.5853878, 0.9792615, -0.3474126, 0.1882353, 1, 0, 1,
-0.5820289, -0.08526182, -2.120831, 0.1803922, 1, 0, 1,
-0.5812958, -1.422635, -1.87678, 0.1764706, 1, 0, 1,
-0.5766315, 0.6596564, -0.3038272, 0.1686275, 1, 0, 1,
-0.56931, 1.934535, -0.7836229, 0.1647059, 1, 0, 1,
-0.569032, 0.6095962, -0.8640968, 0.1568628, 1, 0, 1,
-0.5682576, -0.1823135, -2.523291, 0.1529412, 1, 0, 1,
-0.5640938, 0.3182124, -2.239465, 0.145098, 1, 0, 1,
-0.5536237, -0.2798028, -1.308221, 0.1411765, 1, 0, 1,
-0.5531143, 0.04024036, -0.09805374, 0.1333333, 1, 0, 1,
-0.5521521, -1.340085, -4.527949, 0.1294118, 1, 0, 1,
-0.5489625, 0.6453919, -1.212559, 0.1215686, 1, 0, 1,
-0.544924, -0.5652308, -2.159212, 0.1176471, 1, 0, 1,
-0.5332736, 0.790587, -0.2641944, 0.1098039, 1, 0, 1,
-0.5308918, -0.7946946, -3.405421, 0.1058824, 1, 0, 1,
-0.5283569, -1.198983, -2.422764, 0.09803922, 1, 0, 1,
-0.524258, -0.4585965, -2.906762, 0.09019608, 1, 0, 1,
-0.5237867, -0.2885341, -2.307522, 0.08627451, 1, 0, 1,
-0.5222906, 0.3444622, -2.266503, 0.07843138, 1, 0, 1,
-0.5180811, 0.5267608, 1.106667, 0.07450981, 1, 0, 1,
-0.5135551, 0.384442, -0.3580193, 0.06666667, 1, 0, 1,
-0.5122122, -0.4322772, -2.748553, 0.0627451, 1, 0, 1,
-0.5120566, -0.8918584, -0.9154388, 0.05490196, 1, 0, 1,
-0.5098214, 0.8113788, 0.4224145, 0.05098039, 1, 0, 1,
-0.5080287, -1.037736, -3.270062, 0.04313726, 1, 0, 1,
-0.5070461, -1.463696, -2.301572, 0.03921569, 1, 0, 1,
-0.5027405, -0.145973, -1.001604, 0.03137255, 1, 0, 1,
-0.502164, 0.3329864, -2.486497, 0.02745098, 1, 0, 1,
-0.497314, -0.7063778, -1.572884, 0.01960784, 1, 0, 1,
-0.4972731, -0.8877218, -1.696966, 0.01568628, 1, 0, 1,
-0.4930882, -1.940774, -2.415966, 0.007843138, 1, 0, 1,
-0.4927011, 0.6936673, -0.6233296, 0.003921569, 1, 0, 1,
-0.4921406, -0.2634357, -2.448919, 0, 1, 0.003921569, 1,
-0.4898099, -1.073771, -2.708935, 0, 1, 0.01176471, 1,
-0.4864312, 0.7802246, 0.9125637, 0, 1, 0.01568628, 1,
-0.4830163, 0.1464535, -2.944402, 0, 1, 0.02352941, 1,
-0.4716547, -2.132977, -2.149415, 0, 1, 0.02745098, 1,
-0.4707287, 1.441935, -0.9440756, 0, 1, 0.03529412, 1,
-0.464997, 1.232804, -1.243963, 0, 1, 0.03921569, 1,
-0.4603556, -0.4807895, -1.416331, 0, 1, 0.04705882, 1,
-0.4601627, -1.195972, -4.291949, 0, 1, 0.05098039, 1,
-0.4599091, -2.287997, -1.436494, 0, 1, 0.05882353, 1,
-0.457149, 1.046442, 1.60095, 0, 1, 0.0627451, 1,
-0.456788, 0.7107617, -0.06489959, 0, 1, 0.07058824, 1,
-0.452461, -0.6367284, -0.4699787, 0, 1, 0.07450981, 1,
-0.4523085, 0.3616691, -1.222104, 0, 1, 0.08235294, 1,
-0.447176, -2.163581, -1.041735, 0, 1, 0.08627451, 1,
-0.4413584, -0.6945521, -2.456483, 0, 1, 0.09411765, 1,
-0.43961, 0.9362624, 0.7625062, 0, 1, 0.1019608, 1,
-0.4338326, -0.9782519, -3.620164, 0, 1, 0.1058824, 1,
-0.426473, 0.7505817, -2.060968, 0, 1, 0.1137255, 1,
-0.4263729, -1.080893, -2.148012, 0, 1, 0.1176471, 1,
-0.4235404, -0.1837398, -0.9996144, 0, 1, 0.1254902, 1,
-0.4111597, -0.1203068, -1.706176, 0, 1, 0.1294118, 1,
-0.410205, 1.451104, -1.18625, 0, 1, 0.1372549, 1,
-0.4071061, 0.227862, -2.097544, 0, 1, 0.1411765, 1,
-0.4020092, 0.610936, -0.9775449, 0, 1, 0.1490196, 1,
-0.4004453, -0.3193733, -2.760453, 0, 1, 0.1529412, 1,
-0.3994029, 0.6034871, 0.6965237, 0, 1, 0.1607843, 1,
-0.3949461, 0.1290402, -2.663344, 0, 1, 0.1647059, 1,
-0.3896959, -1.326565, -1.942269, 0, 1, 0.172549, 1,
-0.3895901, -1.697587, -3.934532, 0, 1, 0.1764706, 1,
-0.386558, -0.5907954, -4.439157, 0, 1, 0.1843137, 1,
-0.3853694, -0.8656986, -2.772086, 0, 1, 0.1882353, 1,
-0.3852882, 0.9804963, -0.2879149, 0, 1, 0.1960784, 1,
-0.3845763, -0.988524, -1.750959, 0, 1, 0.2039216, 1,
-0.38269, -1.274404, -2.199174, 0, 1, 0.2078431, 1,
-0.3801158, 0.3630425, -0.5357416, 0, 1, 0.2156863, 1,
-0.3798546, 1.532157, 0.02860182, 0, 1, 0.2196078, 1,
-0.3765311, 0.3708232, -0.8297933, 0, 1, 0.227451, 1,
-0.3690453, 1.942843, -0.075055, 0, 1, 0.2313726, 1,
-0.3671991, -0.6560207, -3.726747, 0, 1, 0.2392157, 1,
-0.3668079, 1.106226, 0.6758038, 0, 1, 0.2431373, 1,
-0.3549151, 0.03963029, -1.865093, 0, 1, 0.2509804, 1,
-0.3513952, -1.567242, -2.831309, 0, 1, 0.254902, 1,
-0.3499521, -1.012066, -3.030076, 0, 1, 0.2627451, 1,
-0.348253, 0.7950593, -0.6949505, 0, 1, 0.2666667, 1,
-0.3476921, 0.8235314, -0.2632801, 0, 1, 0.2745098, 1,
-0.3473456, -0.3988164, -1.46068, 0, 1, 0.2784314, 1,
-0.3468623, 0.4721953, 0.4856002, 0, 1, 0.2862745, 1,
-0.3446614, 0.03061864, -1.248824, 0, 1, 0.2901961, 1,
-0.3355098, -0.9599479, -3.036148, 0, 1, 0.2980392, 1,
-0.3344645, 1.008078, 1.089764, 0, 1, 0.3058824, 1,
-0.3317301, 0.2477423, -2.186027, 0, 1, 0.3098039, 1,
-0.3315762, -0.8680365, -3.20418, 0, 1, 0.3176471, 1,
-0.3228812, 0.639344, 0.04896436, 0, 1, 0.3215686, 1,
-0.3207715, 0.5058972, -0.05982311, 0, 1, 0.3294118, 1,
-0.3161133, 0.9371414, -0.01224596, 0, 1, 0.3333333, 1,
-0.3150882, -0.3105219, -2.937063, 0, 1, 0.3411765, 1,
-0.3135788, 1.418268, 0.4826564, 0, 1, 0.345098, 1,
-0.3094979, 0.5018485, 0.7709984, 0, 1, 0.3529412, 1,
-0.309138, 0.2199867, -1.61922, 0, 1, 0.3568628, 1,
-0.3072386, -0.5483899, -2.583204, 0, 1, 0.3647059, 1,
-0.3059286, -0.8166136, -3.290635, 0, 1, 0.3686275, 1,
-0.3054256, -0.9136398, -3.008551, 0, 1, 0.3764706, 1,
-0.3034577, 0.4161533, -0.02436128, 0, 1, 0.3803922, 1,
-0.3005088, -1.23742, -2.530031, 0, 1, 0.3882353, 1,
-0.2999448, -2.247332, -4.756085, 0, 1, 0.3921569, 1,
-0.2996849, 0.5928532, -2.250686, 0, 1, 0.4, 1,
-0.2977522, 2.323403, 0.05888546, 0, 1, 0.4078431, 1,
-0.2927242, -0.6128261, -2.865629, 0, 1, 0.4117647, 1,
-0.290417, 0.1718613, -2.411072, 0, 1, 0.4196078, 1,
-0.2873556, 0.5716235, 0.3063596, 0, 1, 0.4235294, 1,
-0.2855004, 1.645624, -1.677944, 0, 1, 0.4313726, 1,
-0.2846515, 0.2665781, 0.3582392, 0, 1, 0.4352941, 1,
-0.2788785, 0.4357351, -1.330822, 0, 1, 0.4431373, 1,
-0.2782314, 0.06135038, -1.729666, 0, 1, 0.4470588, 1,
-0.2781421, -1.655833, -2.50059, 0, 1, 0.454902, 1,
-0.2770004, 0.2018483, -1.457803, 0, 1, 0.4588235, 1,
-0.2762175, -0.4974038, -3.383347, 0, 1, 0.4666667, 1,
-0.2713444, 1.692253, -0.5789418, 0, 1, 0.4705882, 1,
-0.2675633, 1.282369, -0.7824416, 0, 1, 0.4784314, 1,
-0.2638395, -0.8141438, -3.942426, 0, 1, 0.4823529, 1,
-0.2626299, 1.662112, -0.1472698, 0, 1, 0.4901961, 1,
-0.2614004, 0.5705072, -0.5233675, 0, 1, 0.4941176, 1,
-0.2607288, -0.6794755, -1.191231, 0, 1, 0.5019608, 1,
-0.256816, -0.500948, -1.33768, 0, 1, 0.509804, 1,
-0.2553317, 0.5019844, -1.69202, 0, 1, 0.5137255, 1,
-0.2551743, -0.5773817, -5.905338, 0, 1, 0.5215687, 1,
-0.2549284, -1.552846, -3.811522, 0, 1, 0.5254902, 1,
-0.2527834, -0.2981989, -0.9949406, 0, 1, 0.5333334, 1,
-0.2500367, 0.5987073, -1.672668, 0, 1, 0.5372549, 1,
-0.2456068, -0.7105038, -2.109462, 0, 1, 0.5450981, 1,
-0.2439042, -0.5607265, -4.071105, 0, 1, 0.5490196, 1,
-0.2416257, 0.6327308, 1.341563, 0, 1, 0.5568628, 1,
-0.2402964, 0.1960741, -0.8164551, 0, 1, 0.5607843, 1,
-0.2396855, -0.6717091, -3.409622, 0, 1, 0.5686275, 1,
-0.2392846, 0.193068, -0.6076615, 0, 1, 0.572549, 1,
-0.2353783, -1.044739, -1.849487, 0, 1, 0.5803922, 1,
-0.2338517, -1.26748, -3.797803, 0, 1, 0.5843138, 1,
-0.2316216, 0.5866662, -0.4745041, 0, 1, 0.5921569, 1,
-0.2274576, 0.1463093, -0.4202485, 0, 1, 0.5960785, 1,
-0.223667, 0.4971404, -0.8430391, 0, 1, 0.6039216, 1,
-0.221746, -1.45434, -4.113273, 0, 1, 0.6117647, 1,
-0.2206072, -0.7112457, -2.828015, 0, 1, 0.6156863, 1,
-0.2193146, 0.4487356, 0.3597244, 0, 1, 0.6235294, 1,
-0.2188013, -0.111444, -1.336291, 0, 1, 0.627451, 1,
-0.2170334, 0.2687992, -0.9470475, 0, 1, 0.6352941, 1,
-0.2130166, 0.1260024, -1.474823, 0, 1, 0.6392157, 1,
-0.2110978, -1.34364, -2.480204, 0, 1, 0.6470588, 1,
-0.2070514, 1.183183, 0.2394576, 0, 1, 0.6509804, 1,
-0.2067212, -0.2115802, -2.990432, 0, 1, 0.6588235, 1,
-0.2032206, 1.65337, 1.409776, 0, 1, 0.6627451, 1,
-0.2013618, -0.6145293, -1.549819, 0, 1, 0.6705883, 1,
-0.1997649, -0.1784168, -3.999204, 0, 1, 0.6745098, 1,
-0.1984285, -0.15649, -1.024213, 0, 1, 0.682353, 1,
-0.1963912, -1.589458, -1.25256, 0, 1, 0.6862745, 1,
-0.1954527, 1.692168, -1.708226, 0, 1, 0.6941177, 1,
-0.1953146, 0.678056, 0.6368965, 0, 1, 0.7019608, 1,
-0.1938017, -0.9519399, -4.996078, 0, 1, 0.7058824, 1,
-0.1899567, -2.273886, -3.355457, 0, 1, 0.7137255, 1,
-0.1882706, 1.090379, -0.8982787, 0, 1, 0.7176471, 1,
-0.1880401, -1.077989, -3.64985, 0, 1, 0.7254902, 1,
-0.1848552, 0.6428098, -0.08645743, 0, 1, 0.7294118, 1,
-0.1812508, 0.846399, -2.2583, 0, 1, 0.7372549, 1,
-0.1784866, -0.8639715, -4.143604, 0, 1, 0.7411765, 1,
-0.1719849, 0.3470007, -0.7499301, 0, 1, 0.7490196, 1,
-0.1710952, 0.7442586, -0.831807, 0, 1, 0.7529412, 1,
-0.1679991, -0.5054232, -4.943029, 0, 1, 0.7607843, 1,
-0.1619771, 0.03285653, -1.518113, 0, 1, 0.7647059, 1,
-0.157925, -0.1809165, -1.417237, 0, 1, 0.772549, 1,
-0.1545577, 0.1922802, -0.03847229, 0, 1, 0.7764706, 1,
-0.1465952, -0.2772941, -2.303429, 0, 1, 0.7843137, 1,
-0.141534, 1.18757, -1.35411, 0, 1, 0.7882353, 1,
-0.1406432, -1.33476, -3.386548, 0, 1, 0.7960784, 1,
-0.1387877, -0.6975911, -2.734865, 0, 1, 0.8039216, 1,
-0.1348729, -0.5024645, -3.21641, 0, 1, 0.8078431, 1,
-0.1298232, -0.9506814, -3.09965, 0, 1, 0.8156863, 1,
-0.1217593, -0.5229224, -1.07991, 0, 1, 0.8196079, 1,
-0.11758, -0.06630514, -1.580796, 0, 1, 0.827451, 1,
-0.1100555, -0.5504336, -4.488019, 0, 1, 0.8313726, 1,
-0.1041442, 1.280043, 0.03819112, 0, 1, 0.8392157, 1,
-0.1034797, 0.6158434, -0.9606768, 0, 1, 0.8431373, 1,
-0.09958628, 1.676259, -0.597448, 0, 1, 0.8509804, 1,
-0.09386355, -0.2983815, -2.972533, 0, 1, 0.854902, 1,
-0.0933792, -1.708466, -3.542918, 0, 1, 0.8627451, 1,
-0.08905006, -0.2706328, -3.218086, 0, 1, 0.8666667, 1,
-0.07435153, -1.24467, -2.898079, 0, 1, 0.8745098, 1,
-0.07096265, 0.7802521, -1.188276, 0, 1, 0.8784314, 1,
-0.07067247, 0.463676, 0.3154744, 0, 1, 0.8862745, 1,
-0.07032257, 0.6688947, 0.5163073, 0, 1, 0.8901961, 1,
-0.06884673, -0.02086139, -1.799187, 0, 1, 0.8980392, 1,
-0.06816996, -1.735381, -1.616087, 0, 1, 0.9058824, 1,
-0.06131746, 1.245011, -0.5860714, 0, 1, 0.9098039, 1,
-0.05650854, -0.213463, -4.723604, 0, 1, 0.9176471, 1,
-0.05593087, 0.3864938, -0.3922837, 0, 1, 0.9215686, 1,
-0.05573376, -0.2024665, -3.640306, 0, 1, 0.9294118, 1,
-0.0546281, -1.320596, -4.304894, 0, 1, 0.9333333, 1,
-0.05098133, -0.6822276, -3.011395, 0, 1, 0.9411765, 1,
-0.04718755, -0.5844603, -1.830152, 0, 1, 0.945098, 1,
-0.04697026, 1.309815, 0.5510278, 0, 1, 0.9529412, 1,
-0.045822, 0.337944, -0.797166, 0, 1, 0.9568627, 1,
-0.04421979, 0.6254014, -0.4169172, 0, 1, 0.9647059, 1,
-0.04380266, 0.1663273, -0.2643817, 0, 1, 0.9686275, 1,
-0.04375804, 2.207755, -1.341312, 0, 1, 0.9764706, 1,
-0.04198582, -2.20679, -2.736853, 0, 1, 0.9803922, 1,
-0.03426139, -1.343426, -2.581531, 0, 1, 0.9882353, 1,
-0.03368258, 1.595396, -0.1584561, 0, 1, 0.9921569, 1,
-0.03344363, 0.5826505, -1.571787, 0, 1, 1, 1,
-0.03133784, -0.8495952, -1.019788, 0, 0.9921569, 1, 1,
-0.02643944, 0.7092152, 0.3399588, 0, 0.9882353, 1, 1,
-0.02467774, 0.326068, 0.4165251, 0, 0.9803922, 1, 1,
-0.02122407, -0.6262379, -3.557017, 0, 0.9764706, 1, 1,
-0.01652079, 1.314731, -1.297634, 0, 0.9686275, 1, 1,
-0.01179725, -2.437629, -2.42498, 0, 0.9647059, 1, 1,
-0.01059475, 0.7088931, -0.0416639, 0, 0.9568627, 1, 1,
-0.008720843, 1.304618, -0.06118786, 0, 0.9529412, 1, 1,
-0.007374129, -0.7628509, -3.006441, 0, 0.945098, 1, 1,
-0.006802849, -1.348677, -3.092288, 0, 0.9411765, 1, 1,
-0.005135308, 0.2431032, -0.2328017, 0, 0.9333333, 1, 1,
0.002337686, -1.06146, 1.747671, 0, 0.9294118, 1, 1,
0.003693207, 0.9145499, -0.3946204, 0, 0.9215686, 1, 1,
0.004611009, -0.01371779, 3.030392, 0, 0.9176471, 1, 1,
0.0118999, 1.803998, 0.2296835, 0, 0.9098039, 1, 1,
0.0150681, 0.001022492, 0.8881921, 0, 0.9058824, 1, 1,
0.01530218, 1.433937, -0.6843724, 0, 0.8980392, 1, 1,
0.01582785, -0.03737472, 3.778502, 0, 0.8901961, 1, 1,
0.01721112, -0.6276398, 2.011332, 0, 0.8862745, 1, 1,
0.02686773, 0.4012492, -0.6006312, 0, 0.8784314, 1, 1,
0.02768964, 0.1514623, -0.07810394, 0, 0.8745098, 1, 1,
0.02818805, 0.8861648, -0.8738682, 0, 0.8666667, 1, 1,
0.02863009, 0.5503824, -1.048987, 0, 0.8627451, 1, 1,
0.0312116, 0.0202436, 1.103676, 0, 0.854902, 1, 1,
0.03139525, 0.4078993, 1.063455, 0, 0.8509804, 1, 1,
0.03586409, 2.256771, -0.8605787, 0, 0.8431373, 1, 1,
0.03624047, -1.205875, 2.767558, 0, 0.8392157, 1, 1,
0.03735722, -1.511451, 3.671548, 0, 0.8313726, 1, 1,
0.03931766, -0.5679051, 2.730118, 0, 0.827451, 1, 1,
0.0417379, -1.453384, 3.782745, 0, 0.8196079, 1, 1,
0.0441128, 0.2019932, 0.3196342, 0, 0.8156863, 1, 1,
0.04483147, -0.9210379, 4.006439, 0, 0.8078431, 1, 1,
0.04518285, -0.3930126, 4.034565, 0, 0.8039216, 1, 1,
0.04680088, -0.8927789, 3.451126, 0, 0.7960784, 1, 1,
0.04829173, 1.522725, -1.706517, 0, 0.7882353, 1, 1,
0.04895845, 3.283715, -0.5540196, 0, 0.7843137, 1, 1,
0.05372781, 0.8113107, 1.167035, 0, 0.7764706, 1, 1,
0.05751991, -1.086815, 2.224328, 0, 0.772549, 1, 1,
0.06029813, -0.9132771, 1.591608, 0, 0.7647059, 1, 1,
0.06079684, 1.228558, 0.921328, 0, 0.7607843, 1, 1,
0.07029764, 0.03660816, -0.454466, 0, 0.7529412, 1, 1,
0.07460446, 0.3279148, 0.2116407, 0, 0.7490196, 1, 1,
0.07516439, 0.6620662, -0.9328102, 0, 0.7411765, 1, 1,
0.07695483, -1.20876, 4.248808, 0, 0.7372549, 1, 1,
0.07818954, 0.1208644, 0.3957077, 0, 0.7294118, 1, 1,
0.07918216, -0.2446389, 3.911955, 0, 0.7254902, 1, 1,
0.07992282, 0.8591517, 1.011097, 0, 0.7176471, 1, 1,
0.08278334, -1.705847, 1.465588, 0, 0.7137255, 1, 1,
0.0841113, -0.4235146, 2.769855, 0, 0.7058824, 1, 1,
0.08556856, -0.9152316, 3.118998, 0, 0.6980392, 1, 1,
0.09053978, 0.5624071, -0.2479349, 0, 0.6941177, 1, 1,
0.09107735, -0.1233071, 3.747961, 0, 0.6862745, 1, 1,
0.09128661, 0.9826764, -0.3626329, 0, 0.682353, 1, 1,
0.09330986, -0.8071843, 4.990082, 0, 0.6745098, 1, 1,
0.09833524, -0.2114733, 3.296437, 0, 0.6705883, 1, 1,
0.1059507, -0.8086376, 2.931356, 0, 0.6627451, 1, 1,
0.1081154, -0.7765827, 3.555804, 0, 0.6588235, 1, 1,
0.1085889, -0.1455051, 2.041843, 0, 0.6509804, 1, 1,
0.1089215, -0.08636285, 2.832592, 0, 0.6470588, 1, 1,
0.1089349, -0.06914531, 0.9996139, 0, 0.6392157, 1, 1,
0.1096358, 0.1781947, 0.5581512, 0, 0.6352941, 1, 1,
0.1113655, -0.654595, 1.721162, 0, 0.627451, 1, 1,
0.1120273, 0.2684364, 1.241346, 0, 0.6235294, 1, 1,
0.1126962, 0.9820511, 0.02566809, 0, 0.6156863, 1, 1,
0.1193092, -0.2109285, 0.7838697, 0, 0.6117647, 1, 1,
0.1197516, 1.674225, -0.5706266, 0, 0.6039216, 1, 1,
0.1224471, 1.883081, -0.0947933, 0, 0.5960785, 1, 1,
0.1235844, 0.9607651, 1.559407, 0, 0.5921569, 1, 1,
0.1282406, -0.6839936, 3.097489, 0, 0.5843138, 1, 1,
0.1293539, 1.423652, -0.1830228, 0, 0.5803922, 1, 1,
0.1309223, -0.3510876, 2.607707, 0, 0.572549, 1, 1,
0.1315458, 1.354847, -1.228961, 0, 0.5686275, 1, 1,
0.1326556, 1.059163, 0.1011963, 0, 0.5607843, 1, 1,
0.1337423, -0.5365983, 2.206307, 0, 0.5568628, 1, 1,
0.1412812, -0.9330146, 2.80647, 0, 0.5490196, 1, 1,
0.1425215, 0.432583, 0.5166643, 0, 0.5450981, 1, 1,
0.1431987, 0.6949584, -0.2301028, 0, 0.5372549, 1, 1,
0.1516172, 0.05342849, -0.3821438, 0, 0.5333334, 1, 1,
0.152105, 1.034802, 0.7245787, 0, 0.5254902, 1, 1,
0.1534356, -0.04531468, 1.581872, 0, 0.5215687, 1, 1,
0.156922, -0.5404558, 4.05427, 0, 0.5137255, 1, 1,
0.157592, 1.609054, 0.561942, 0, 0.509804, 1, 1,
0.1634606, -0.3407755, 3.349552, 0, 0.5019608, 1, 1,
0.1641132, -0.1432682, 2.601148, 0, 0.4941176, 1, 1,
0.1677968, -0.9776167, 2.720547, 0, 0.4901961, 1, 1,
0.1689663, 0.9144671, 0.981508, 0, 0.4823529, 1, 1,
0.1703207, -1.549452, 2.756405, 0, 0.4784314, 1, 1,
0.1705403, 1.395236, -1.343686, 0, 0.4705882, 1, 1,
0.1750958, -0.5336156, 1.958474, 0, 0.4666667, 1, 1,
0.1806746, -0.2960404, 2.866994, 0, 0.4588235, 1, 1,
0.183694, 3.786756, 0.4203502, 0, 0.454902, 1, 1,
0.184035, -1.424129, 3.173499, 0, 0.4470588, 1, 1,
0.1868453, -0.4528553, 2.554953, 0, 0.4431373, 1, 1,
0.1888767, 0.1477024, -0.4618958, 0, 0.4352941, 1, 1,
0.1899396, -0.5272971, 3.92511, 0, 0.4313726, 1, 1,
0.1902407, -1.755682, 2.096627, 0, 0.4235294, 1, 1,
0.1966272, 0.0274462, 2.772238, 0, 0.4196078, 1, 1,
0.1977532, 0.08464483, 2.203445, 0, 0.4117647, 1, 1,
0.1990367, 0.1885801, 0.6224701, 0, 0.4078431, 1, 1,
0.2043554, -0.892153, 3.873394, 0, 0.4, 1, 1,
0.2077023, 0.2949592, 0.2845453, 0, 0.3921569, 1, 1,
0.2089959, -0.9811859, 3.327425, 0, 0.3882353, 1, 1,
0.2160414, -0.2828232, 2.253334, 0, 0.3803922, 1, 1,
0.2199598, 0.48904, 0.5114844, 0, 0.3764706, 1, 1,
0.2209631, -1.107249, 3.780348, 0, 0.3686275, 1, 1,
0.2244367, 2.236235, -1.488843, 0, 0.3647059, 1, 1,
0.2265389, -0.7951586, 1.254971, 0, 0.3568628, 1, 1,
0.2266391, -0.5200291, 5.327478, 0, 0.3529412, 1, 1,
0.2299812, -0.03625002, 1.209489, 0, 0.345098, 1, 1,
0.2309282, -0.1887506, 1.93566, 0, 0.3411765, 1, 1,
0.2318812, 1.354546, -1.53808, 0, 0.3333333, 1, 1,
0.2330372, -0.0738395, 2.317619, 0, 0.3294118, 1, 1,
0.2335622, -0.7498041, 3.960148, 0, 0.3215686, 1, 1,
0.2357501, 0.1872286, 2.69357, 0, 0.3176471, 1, 1,
0.236014, 1.779712, 1.14148, 0, 0.3098039, 1, 1,
0.2367669, -1.492188, 5.930429, 0, 0.3058824, 1, 1,
0.2403005, -0.8097478, 2.632845, 0, 0.2980392, 1, 1,
0.24056, -0.2563144, 3.551758, 0, 0.2901961, 1, 1,
0.2435433, 0.2338835, -0.07109078, 0, 0.2862745, 1, 1,
0.2490518, 1.237547, -2.030872, 0, 0.2784314, 1, 1,
0.2557849, -0.5602766, 5.117363, 0, 0.2745098, 1, 1,
0.2563629, -0.479221, 3.030119, 0, 0.2666667, 1, 1,
0.2567341, 0.08630926, 1.716932, 0, 0.2627451, 1, 1,
0.2635518, -0.9963179, 3.781833, 0, 0.254902, 1, 1,
0.264988, 0.09594225, 1.427576, 0, 0.2509804, 1, 1,
0.2744932, -0.9400465, 3.970389, 0, 0.2431373, 1, 1,
0.276535, -1.15604, 3.38502, 0, 0.2392157, 1, 1,
0.2790092, 0.1551196, 2.607898, 0, 0.2313726, 1, 1,
0.2828789, -0.9652274, 1.65459, 0, 0.227451, 1, 1,
0.2849509, -1.321177, 3.463626, 0, 0.2196078, 1, 1,
0.284993, -0.3812584, 3.28815, 0, 0.2156863, 1, 1,
0.2870854, 1.593909, -1.162262, 0, 0.2078431, 1, 1,
0.2896276, 0.3310843, 0.2899246, 0, 0.2039216, 1, 1,
0.2924437, 0.04299468, -0.1342945, 0, 0.1960784, 1, 1,
0.2940916, -0.8768079, 2.234849, 0, 0.1882353, 1, 1,
0.2964521, -0.4505475, 2.017009, 0, 0.1843137, 1, 1,
0.2986134, 0.01077068, 0.5358917, 0, 0.1764706, 1, 1,
0.3022061, 0.2537716, 2.187758, 0, 0.172549, 1, 1,
0.3042914, -1.064963, 2.698943, 0, 0.1647059, 1, 1,
0.3114092, 4.585501, -0.03661933, 0, 0.1607843, 1, 1,
0.3146114, 0.382017, -1.77312, 0, 0.1529412, 1, 1,
0.3193246, -0.3739614, 0.7112199, 0, 0.1490196, 1, 1,
0.3255768, 1.31161, 0.6639106, 0, 0.1411765, 1, 1,
0.3315018, 0.3296117, 0.4526097, 0, 0.1372549, 1, 1,
0.3315142, 0.7667419, -0.8031581, 0, 0.1294118, 1, 1,
0.3333897, 0.50157, -0.1863226, 0, 0.1254902, 1, 1,
0.3338154, -1.217854, 4.527754, 0, 0.1176471, 1, 1,
0.3346239, -0.7686676, 3.302344, 0, 0.1137255, 1, 1,
0.3428172, 0.8145683, -0.1313798, 0, 0.1058824, 1, 1,
0.3444043, -1.441422, 5.250502, 0, 0.09803922, 1, 1,
0.3465129, 1.124548, 0.4540499, 0, 0.09411765, 1, 1,
0.3472317, 2.279004, 0.1650326, 0, 0.08627451, 1, 1,
0.3475244, 1.048981, 0.4561546, 0, 0.08235294, 1, 1,
0.3515511, 2.165941, -0.3936208, 0, 0.07450981, 1, 1,
0.3525285, 2.470934, -0.6596736, 0, 0.07058824, 1, 1,
0.3567096, -1.114117, 4.622349, 0, 0.0627451, 1, 1,
0.3569947, 0.4339566, 1.820916, 0, 0.05882353, 1, 1,
0.3577088, -1.026862, 0.6698706, 0, 0.05098039, 1, 1,
0.358599, 0.31217, 0.5663247, 0, 0.04705882, 1, 1,
0.363649, -0.3182106, 1.566647, 0, 0.03921569, 1, 1,
0.3643235, 1.835275, -0.3509109, 0, 0.03529412, 1, 1,
0.3759651, 0.8433169, 1.731015, 0, 0.02745098, 1, 1,
0.3797336, -1.197775, 2.68364, 0, 0.02352941, 1, 1,
0.3801834, 0.1044298, 2.593664, 0, 0.01568628, 1, 1,
0.3823829, -1.51297, 3.54115, 0, 0.01176471, 1, 1,
0.3879652, -1.820846, 3.589713, 0, 0.003921569, 1, 1,
0.3884522, -0.6710863, 3.894805, 0.003921569, 0, 1, 1,
0.3892495, 0.9531465, -1.112833, 0.007843138, 0, 1, 1,
0.3894429, 0.1982037, 2.72921, 0.01568628, 0, 1, 1,
0.3902108, -0.845721, 3.07179, 0.01960784, 0, 1, 1,
0.39048, -2.477256, 2.385032, 0.02745098, 0, 1, 1,
0.3912429, 1.1696, 2.147698, 0.03137255, 0, 1, 1,
0.3928489, 0.6267428, 0.7245104, 0.03921569, 0, 1, 1,
0.3986377, -1.278086, 5.058899, 0.04313726, 0, 1, 1,
0.3996277, -0.7890689, 4.31973, 0.05098039, 0, 1, 1,
0.4004297, -1.167161, 2.046811, 0.05490196, 0, 1, 1,
0.4069493, 0.8517756, -0.6210726, 0.0627451, 0, 1, 1,
0.4071297, -0.6451383, 2.419421, 0.06666667, 0, 1, 1,
0.4071713, 0.2733627, 0.737221, 0.07450981, 0, 1, 1,
0.4103014, 1.812834, -0.3173772, 0.07843138, 0, 1, 1,
0.4120721, -0.1996021, 1.167064, 0.08627451, 0, 1, 1,
0.4141063, 0.6491213, -0.8787576, 0.09019608, 0, 1, 1,
0.4157588, 0.2623511, 0.4642285, 0.09803922, 0, 1, 1,
0.4160063, 0.6646724, 0.9883564, 0.1058824, 0, 1, 1,
0.4177787, 0.9035413, -0.3700131, 0.1098039, 0, 1, 1,
0.4220061, 0.7634392, -1.009012, 0.1176471, 0, 1, 1,
0.4304828, -0.5891884, 1.699241, 0.1215686, 0, 1, 1,
0.4320658, 0.5145149, 0.8869328, 0.1294118, 0, 1, 1,
0.4356698, -1.206232, 2.706276, 0.1333333, 0, 1, 1,
0.4415898, -0.495238, 1.821975, 0.1411765, 0, 1, 1,
0.4433871, -0.39811, 3.170012, 0.145098, 0, 1, 1,
0.4460922, -0.405596, 2.974843, 0.1529412, 0, 1, 1,
0.447014, -0.5035215, 3.421702, 0.1568628, 0, 1, 1,
0.4481558, 1.187906, 0.1965781, 0.1647059, 0, 1, 1,
0.4515249, -1.272369, 2.312526, 0.1686275, 0, 1, 1,
0.4547646, -0.1333889, 1.899405, 0.1764706, 0, 1, 1,
0.4556365, 0.5098467, 0.7364942, 0.1803922, 0, 1, 1,
0.4578261, -0.8046942, 2.252946, 0.1882353, 0, 1, 1,
0.460389, 1.099682, -0.7316081, 0.1921569, 0, 1, 1,
0.4646541, -2.3418, 3.534261, 0.2, 0, 1, 1,
0.4651452, -0.3381522, 3.083, 0.2078431, 0, 1, 1,
0.46742, 0.6707228, 0.5217856, 0.2117647, 0, 1, 1,
0.4686917, -0.6732913, 4.6515, 0.2196078, 0, 1, 1,
0.4704736, -0.2890583, 1.267279, 0.2235294, 0, 1, 1,
0.4723395, 0.7105155, 0.3244797, 0.2313726, 0, 1, 1,
0.4724175, 1.255562, 0.6371953, 0.2352941, 0, 1, 1,
0.4773072, -1.121067, 2.984442, 0.2431373, 0, 1, 1,
0.4794816, -1.763154, 2.690994, 0.2470588, 0, 1, 1,
0.4835479, 0.3907872, 1.759383, 0.254902, 0, 1, 1,
0.4867477, -0.4995509, 0.7802938, 0.2588235, 0, 1, 1,
0.4884145, -0.7296788, 1.548688, 0.2666667, 0, 1, 1,
0.4893059, -0.868294, 1.284949, 0.2705882, 0, 1, 1,
0.4894048, 0.558328, 1.329382, 0.2784314, 0, 1, 1,
0.4898642, 1.513113, 0.3987646, 0.282353, 0, 1, 1,
0.494303, 1.513079, 1.24127, 0.2901961, 0, 1, 1,
0.4943488, -0.0708096, 0.7925705, 0.2941177, 0, 1, 1,
0.4960353, -1.002712, 3.329406, 0.3019608, 0, 1, 1,
0.4980643, -0.4628693, 0.7266867, 0.3098039, 0, 1, 1,
0.5002685, 0.3908149, 2.158602, 0.3137255, 0, 1, 1,
0.5084746, 0.6846104, 1.351192, 0.3215686, 0, 1, 1,
0.5084981, 0.01593284, 1.459399, 0.3254902, 0, 1, 1,
0.5087822, -0.4773241, 1.471182, 0.3333333, 0, 1, 1,
0.5107344, 0.05951191, 1.999812, 0.3372549, 0, 1, 1,
0.5174683, -0.3068033, -0.06978475, 0.345098, 0, 1, 1,
0.5184932, -0.5129004, 4.231805, 0.3490196, 0, 1, 1,
0.5200914, -1.586331, 4.865123, 0.3568628, 0, 1, 1,
0.5285375, -0.590247, 0.3787345, 0.3607843, 0, 1, 1,
0.5289533, -1.145513, 2.587436, 0.3686275, 0, 1, 1,
0.5291368, 1.188914, 1.392765, 0.372549, 0, 1, 1,
0.5331461, -0.3843845, 0.4253638, 0.3803922, 0, 1, 1,
0.5367046, -1.69293, 5.258992, 0.3843137, 0, 1, 1,
0.5382102, -1.117233, 4.318836, 0.3921569, 0, 1, 1,
0.5386818, 0.4043767, 1.986977, 0.3960784, 0, 1, 1,
0.5445744, -0.5219048, 2.887734, 0.4039216, 0, 1, 1,
0.5468129, -0.1892255, 0.8256714, 0.4117647, 0, 1, 1,
0.5482748, -0.003303295, 1.448308, 0.4156863, 0, 1, 1,
0.5502965, -0.832974, 2.777708, 0.4235294, 0, 1, 1,
0.5584379, 1.114271, 1.056062, 0.427451, 0, 1, 1,
0.5616887, -1.071539, 0.1692501, 0.4352941, 0, 1, 1,
0.5622533, -1.366743, 2.118972, 0.4392157, 0, 1, 1,
0.5659989, -1.516117, 3.75293, 0.4470588, 0, 1, 1,
0.5660949, 0.7417613, -0.2640633, 0.4509804, 0, 1, 1,
0.5666227, -0.3747249, 3.336471, 0.4588235, 0, 1, 1,
0.5710801, -0.3497245, 1.05447, 0.4627451, 0, 1, 1,
0.5788541, 0.9777247, 2.467949, 0.4705882, 0, 1, 1,
0.5800901, 0.7572623, -1.459852, 0.4745098, 0, 1, 1,
0.5833212, -0.377341, -0.2294629, 0.4823529, 0, 1, 1,
0.588906, -1.353397, 2.745307, 0.4862745, 0, 1, 1,
0.5899175, 0.1980654, 1.876645, 0.4941176, 0, 1, 1,
0.594049, 0.05510528, 1.626271, 0.5019608, 0, 1, 1,
0.6007199, -0.1907546, 2.042415, 0.5058824, 0, 1, 1,
0.6046489, 1.063078, 1.658456, 0.5137255, 0, 1, 1,
0.60808, 0.8366185, 0.9076185, 0.5176471, 0, 1, 1,
0.6102656, -0.5125936, 2.719273, 0.5254902, 0, 1, 1,
0.6124982, -1.603578, 4.911619, 0.5294118, 0, 1, 1,
0.6125195, -0.5247864, 4.423888, 0.5372549, 0, 1, 1,
0.6147671, 0.003041936, 2.450876, 0.5411765, 0, 1, 1,
0.6152041, 0.5431987, 2.118336, 0.5490196, 0, 1, 1,
0.6204295, -0.1681354, 2.086236, 0.5529412, 0, 1, 1,
0.621572, 0.04698402, 0.9281204, 0.5607843, 0, 1, 1,
0.6224856, 0.4052232, 1.90781, 0.5647059, 0, 1, 1,
0.6248116, 0.684434, -0.5656414, 0.572549, 0, 1, 1,
0.6310552, 0.3314546, 1.532907, 0.5764706, 0, 1, 1,
0.6314422, 0.9597946, 1.612409, 0.5843138, 0, 1, 1,
0.633867, -0.6813596, 1.162871, 0.5882353, 0, 1, 1,
0.6361553, -0.9441572, 3.792957, 0.5960785, 0, 1, 1,
0.6362113, 0.4087707, 0.2936222, 0.6039216, 0, 1, 1,
0.6380818, -0.3829701, 0.1345688, 0.6078432, 0, 1, 1,
0.6389314, -0.2463408, 2.766083, 0.6156863, 0, 1, 1,
0.6482062, -1.08783, 2.307423, 0.6196079, 0, 1, 1,
0.6553634, 0.1283439, 2.563835, 0.627451, 0, 1, 1,
0.6563548, 0.5152537, 1.300164, 0.6313726, 0, 1, 1,
0.6593235, -1.033082, 3.978776, 0.6392157, 0, 1, 1,
0.6629037, 0.3991415, 0.7952135, 0.6431373, 0, 1, 1,
0.6630076, 1.361409, 1.002802, 0.6509804, 0, 1, 1,
0.6642911, -1.926868, 2.206789, 0.654902, 0, 1, 1,
0.6670234, 0.7462374, 1.166427, 0.6627451, 0, 1, 1,
0.6797641, 1.388207, 0.4337607, 0.6666667, 0, 1, 1,
0.680141, -0.37199, 3.331444, 0.6745098, 0, 1, 1,
0.6817223, 0.6038166, -0.1382724, 0.6784314, 0, 1, 1,
0.6843112, 1.023365, 0.4024737, 0.6862745, 0, 1, 1,
0.684538, 0.006219504, 1.626915, 0.6901961, 0, 1, 1,
0.6869445, -0.2781273, 0.3608254, 0.6980392, 0, 1, 1,
0.6912103, -0.6554251, 3.624542, 0.7058824, 0, 1, 1,
0.6917546, 0.03333309, 3.08223, 0.7098039, 0, 1, 1,
0.6919854, -0.8536727, 2.994458, 0.7176471, 0, 1, 1,
0.6933271, -0.4033917, 2.528305, 0.7215686, 0, 1, 1,
0.6993691, 1.829238, -0.1125109, 0.7294118, 0, 1, 1,
0.7017828, 0.233333, 3.115237, 0.7333333, 0, 1, 1,
0.7077388, -1.364684, 1.702631, 0.7411765, 0, 1, 1,
0.7114595, 0.3247181, 2.858679, 0.7450981, 0, 1, 1,
0.7140669, -0.9849652, 2.76356, 0.7529412, 0, 1, 1,
0.7164953, 0.7330991, 0.7063352, 0.7568628, 0, 1, 1,
0.7179288, -0.7243413, 2.964482, 0.7647059, 0, 1, 1,
0.7207625, 0.162317, 1.966311, 0.7686275, 0, 1, 1,
0.722779, 0.4293991, 0.9606152, 0.7764706, 0, 1, 1,
0.7371493, -1.116791, 3.047287, 0.7803922, 0, 1, 1,
0.7383748, -0.4971028, 1.154871, 0.7882353, 0, 1, 1,
0.7478226, 0.8884116, -1.074552, 0.7921569, 0, 1, 1,
0.7496207, 0.1216608, -1.161471, 0.8, 0, 1, 1,
0.7547693, -0.9537802, 3.302097, 0.8078431, 0, 1, 1,
0.7587844, 0.175916, 2.634074, 0.8117647, 0, 1, 1,
0.7659868, 0.006201005, 3.14378, 0.8196079, 0, 1, 1,
0.7662844, 0.280633, 1.274773, 0.8235294, 0, 1, 1,
0.7709412, 0.347369, 0.05965907, 0.8313726, 0, 1, 1,
0.7712526, 0.3436185, 0.3064847, 0.8352941, 0, 1, 1,
0.7741759, 0.3191268, 0.6127213, 0.8431373, 0, 1, 1,
0.7768912, -0.2963327, 2.323458, 0.8470588, 0, 1, 1,
0.7790644, -1.211658, 3.980964, 0.854902, 0, 1, 1,
0.7794986, 0.3229336, -0.9103293, 0.8588235, 0, 1, 1,
0.7835395, -1.060657, 1.446064, 0.8666667, 0, 1, 1,
0.7854722, -0.1682671, 2.358734, 0.8705882, 0, 1, 1,
0.7932541, -0.2653502, 2.110477, 0.8784314, 0, 1, 1,
0.7937864, 0.312058, 0.9354811, 0.8823529, 0, 1, 1,
0.798983, 0.4946582, 1.255377, 0.8901961, 0, 1, 1,
0.802882, -0.3899965, 0.08852622, 0.8941177, 0, 1, 1,
0.8034582, -2.528432, 2.267964, 0.9019608, 0, 1, 1,
0.8039929, 0.4231493, 2.082526, 0.9098039, 0, 1, 1,
0.8043954, 1.085415, 1.64857, 0.9137255, 0, 1, 1,
0.8120199, 0.9104385, -0.1698109, 0.9215686, 0, 1, 1,
0.8168803, -1.079775, 0.6864243, 0.9254902, 0, 1, 1,
0.8286489, 0.9881772, 1.480801, 0.9333333, 0, 1, 1,
0.8332859, 0.2758387, 2.061503, 0.9372549, 0, 1, 1,
0.8343295, 0.677924, 0.3692586, 0.945098, 0, 1, 1,
0.8385906, -1.395057, 2.412556, 0.9490196, 0, 1, 1,
0.8441256, -0.979665, 2.27685, 0.9568627, 0, 1, 1,
0.8517184, -1.508067, 3.307791, 0.9607843, 0, 1, 1,
0.8568329, 0.447155, 3.779702, 0.9686275, 0, 1, 1,
0.8570319, 0.052763, 0.9748701, 0.972549, 0, 1, 1,
0.8574607, 0.8726639, -0.8731446, 0.9803922, 0, 1, 1,
0.8583387, -1.117587, 3.023832, 0.9843137, 0, 1, 1,
0.8619167, -0.6017926, 0.9554474, 0.9921569, 0, 1, 1,
0.8696079, -0.8027064, 1.207301, 0.9960784, 0, 1, 1,
0.8716035, 0.9294602, -0.55451, 1, 0, 0.9960784, 1,
0.8735747, -0.08081704, 1.220035, 1, 0, 0.9882353, 1,
0.8805993, 0.9311434, 1.716624, 1, 0, 0.9843137, 1,
0.887686, -0.2612552, 1.579866, 1, 0, 0.9764706, 1,
0.8948454, 0.2938504, 1.368959, 1, 0, 0.972549, 1,
0.898902, -0.2914567, 3.094128, 1, 0, 0.9647059, 1,
0.9018729, -0.01365468, 2.61256, 1, 0, 0.9607843, 1,
0.9029313, 2.031509, 0.9155361, 1, 0, 0.9529412, 1,
0.9077895, 0.8430165, -0.264395, 1, 0, 0.9490196, 1,
0.9129556, 1.082622, -0.0668834, 1, 0, 0.9411765, 1,
0.9152536, 1.020172, -0.209116, 1, 0, 0.9372549, 1,
0.9259282, 0.08991307, 1.207822, 1, 0, 0.9294118, 1,
0.9273065, -0.8922492, 1.395495, 1, 0, 0.9254902, 1,
0.9289912, -0.1620981, 2.912879, 1, 0, 0.9176471, 1,
0.9403988, -0.0078928, 1.965659, 1, 0, 0.9137255, 1,
0.9407113, 0.8591948, 0.8844329, 1, 0, 0.9058824, 1,
0.9428186, -0.01100438, 2.623505, 1, 0, 0.9019608, 1,
0.9462791, -0.4129951, 0.5556744, 1, 0, 0.8941177, 1,
0.9550283, 0.5876853, 0.9026811, 1, 0, 0.8862745, 1,
0.9553077, -0.230748, 2.690974, 1, 0, 0.8823529, 1,
0.9579552, 0.1230153, 3.38205, 1, 0, 0.8745098, 1,
0.9589922, 1.593855, 0.5335654, 1, 0, 0.8705882, 1,
0.9617152, 1.722014, 1.772968, 1, 0, 0.8627451, 1,
0.9653118, 0.7550048, 1.198776, 1, 0, 0.8588235, 1,
0.971953, 0.09993199, 1.850239, 1, 0, 0.8509804, 1,
0.9734095, 0.4605777, 0.5489767, 1, 0, 0.8470588, 1,
0.9807467, -0.9207414, 2.100322, 1, 0, 0.8392157, 1,
0.9836295, 0.1865219, -0.8363414, 1, 0, 0.8352941, 1,
0.9870104, -1.289728, 3.040844, 1, 0, 0.827451, 1,
0.9901836, -0.09438424, 0.4179264, 1, 0, 0.8235294, 1,
0.9912375, -0.1489604, 2.370603, 1, 0, 0.8156863, 1,
0.9974231, -0.5971234, 1.743127, 1, 0, 0.8117647, 1,
0.9989428, 0.3127126, 2.511078, 1, 0, 0.8039216, 1,
1.004163, -1.013141, 1.79186, 1, 0, 0.7960784, 1,
1.004274, -1.250508, -0.2379432, 1, 0, 0.7921569, 1,
1.011143, 2.686473, 0.09038687, 1, 0, 0.7843137, 1,
1.018553, -1.195339, 1.877932, 1, 0, 0.7803922, 1,
1.020052, -0.9640006, 1.854295, 1, 0, 0.772549, 1,
1.031127, -0.01838, 1.593375, 1, 0, 0.7686275, 1,
1.031319, 2.568185, 1.246792, 1, 0, 0.7607843, 1,
1.033978, -1.320421, 3.085546, 1, 0, 0.7568628, 1,
1.035259, 1.803607, 0.107705, 1, 0, 0.7490196, 1,
1.047803, 1.684537, -0.2441193, 1, 0, 0.7450981, 1,
1.053341, -0.2717343, 2.614736, 1, 0, 0.7372549, 1,
1.058214, 0.4573221, 1.321349, 1, 0, 0.7333333, 1,
1.059223, 0.2891173, 0.05553152, 1, 0, 0.7254902, 1,
1.062618, -0.1658071, 1.644968, 1, 0, 0.7215686, 1,
1.06931, -1.167049, 3.298912, 1, 0, 0.7137255, 1,
1.074229, 0.4159839, 0.2751597, 1, 0, 0.7098039, 1,
1.082511, 1.377845, 2.612914, 1, 0, 0.7019608, 1,
1.084572, 0.007224943, 1.007041, 1, 0, 0.6941177, 1,
1.089153, 2.494358, -0.5889972, 1, 0, 0.6901961, 1,
1.09763, 1.059273, -0.1115486, 1, 0, 0.682353, 1,
1.099587, 0.5304211, 0.7388731, 1, 0, 0.6784314, 1,
1.112374, 1.510364, 0.8833682, 1, 0, 0.6705883, 1,
1.112911, 0.5136729, 2.832189, 1, 0, 0.6666667, 1,
1.116505, 1.731172, 1.251919, 1, 0, 0.6588235, 1,
1.120568, 0.3174684, 2.296834, 1, 0, 0.654902, 1,
1.136033, 0.4033436, 1.583414, 1, 0, 0.6470588, 1,
1.139846, 2.138056, 0.9555774, 1, 0, 0.6431373, 1,
1.141781, -0.0185569, 0.6384512, 1, 0, 0.6352941, 1,
1.141878, 0.1517826, -0.6934537, 1, 0, 0.6313726, 1,
1.142976, -1.341624, 2.868566, 1, 0, 0.6235294, 1,
1.145175, -0.2003182, 1.314645, 1, 0, 0.6196079, 1,
1.145753, 0.1482056, 1.408325, 1, 0, 0.6117647, 1,
1.145907, -0.9967816, 2.996994, 1, 0, 0.6078432, 1,
1.147908, -1.076885, 3.238545, 1, 0, 0.6, 1,
1.15937, 0.3267323, 1.563678, 1, 0, 0.5921569, 1,
1.159571, 1.331468, 0.4885119, 1, 0, 0.5882353, 1,
1.173351, 0.3979279, 0.5642176, 1, 0, 0.5803922, 1,
1.177729, 0.2141618, 1.657474, 1, 0, 0.5764706, 1,
1.189996, 3.147643, 0.40591, 1, 0, 0.5686275, 1,
1.195769, -1.211683, 1.904137, 1, 0, 0.5647059, 1,
1.208768, 0.7663573, 1.292179, 1, 0, 0.5568628, 1,
1.219405, -1.735435, 3.621697, 1, 0, 0.5529412, 1,
1.223269, -0.908361, 2.478822, 1, 0, 0.5450981, 1,
1.239758, 1.688367, 0.9720912, 1, 0, 0.5411765, 1,
1.243023, 0.6715699, 1.456906, 1, 0, 0.5333334, 1,
1.248194, -1.019986, 3.077125, 1, 0, 0.5294118, 1,
1.265117, -0.1692373, 2.602528, 1, 0, 0.5215687, 1,
1.276428, -0.04951654, 2.964711, 1, 0, 0.5176471, 1,
1.295164, 0.6086451, 2.259439, 1, 0, 0.509804, 1,
1.302723, 0.346306, 1.90151, 1, 0, 0.5058824, 1,
1.305899, -0.9610695, 1.676958, 1, 0, 0.4980392, 1,
1.30796, -1.278415, 2.983897, 1, 0, 0.4901961, 1,
1.324666, -0.9435573, 2.296254, 1, 0, 0.4862745, 1,
1.325158, -1.063312, 1.944007, 1, 0, 0.4784314, 1,
1.376185, 0.7519004, 1.430221, 1, 0, 0.4745098, 1,
1.393456, 0.4123822, 2.143455, 1, 0, 0.4666667, 1,
1.401417, -1.019719, 1.938076, 1, 0, 0.4627451, 1,
1.403136, 1.321128, -0.2403663, 1, 0, 0.454902, 1,
1.414288, -0.2783592, 2.029427, 1, 0, 0.4509804, 1,
1.420001, -1.386804, 4.456235, 1, 0, 0.4431373, 1,
1.424892, 0.8240106, 0.08278742, 1, 0, 0.4392157, 1,
1.43545, 0.487679, 1.677059, 1, 0, 0.4313726, 1,
1.460217, -1.816086, 2.101195, 1, 0, 0.427451, 1,
1.46244, 0.5892578, 1.89513, 1, 0, 0.4196078, 1,
1.465211, -1.627285, 2.513782, 1, 0, 0.4156863, 1,
1.467842, 1.338247, 1.650021, 1, 0, 0.4078431, 1,
1.473691, 0.4247481, 1.791453, 1, 0, 0.4039216, 1,
1.477392, -1.189021, 4.192579, 1, 0, 0.3960784, 1,
1.485166, -1.346811, 2.08347, 1, 0, 0.3882353, 1,
1.487896, 0.6836987, 0.9528373, 1, 0, 0.3843137, 1,
1.489719, 1.051794, 1.134607, 1, 0, 0.3764706, 1,
1.508837, 1.064063, 2.354352, 1, 0, 0.372549, 1,
1.539989, 0.4041553, 3.123866, 1, 0, 0.3647059, 1,
1.542241, 0.3209277, 0.5073422, 1, 0, 0.3607843, 1,
1.549243, 0.5003489, -1.088682, 1, 0, 0.3529412, 1,
1.559373, 1.884493, 2.160866, 1, 0, 0.3490196, 1,
1.567624, 0.119777, 2.054099, 1, 0, 0.3411765, 1,
1.572549, -0.007158424, 2.650082, 1, 0, 0.3372549, 1,
1.586178, -0.3786146, 2.173787, 1, 0, 0.3294118, 1,
1.593768, -0.2979023, 1.64849, 1, 0, 0.3254902, 1,
1.608866, 0.9980573, 2.748602, 1, 0, 0.3176471, 1,
1.609538, -0.777883, 2.130476, 1, 0, 0.3137255, 1,
1.609867, -1.088754, 3.034027, 1, 0, 0.3058824, 1,
1.613661, 2.119738, -0.6377792, 1, 0, 0.2980392, 1,
1.615741, 0.1526177, 0.6887614, 1, 0, 0.2941177, 1,
1.627351, 0.7178639, 0.008253716, 1, 0, 0.2862745, 1,
1.650669, -0.08684356, 2.223985, 1, 0, 0.282353, 1,
1.676976, -1.669204, 2.934331, 1, 0, 0.2745098, 1,
1.678885, 0.123636, 1.165526, 1, 0, 0.2705882, 1,
1.679151, 0.2821152, 0.9328963, 1, 0, 0.2627451, 1,
1.688532, 1.463316, -0.008370735, 1, 0, 0.2588235, 1,
1.698898, -2.141927, 1.770498, 1, 0, 0.2509804, 1,
1.741026, -0.8830411, 3.121332, 1, 0, 0.2470588, 1,
1.74139, 0.3027386, -0.1303242, 1, 0, 0.2392157, 1,
1.750761, -0.341439, 3.627908, 1, 0, 0.2352941, 1,
1.75613, -0.1481575, 1.580615, 1, 0, 0.227451, 1,
1.764005, -2.27979, 0.1835005, 1, 0, 0.2235294, 1,
1.778721, -0.226649, 2.199354, 1, 0, 0.2156863, 1,
1.783076, 0.4077665, 1.276578, 1, 0, 0.2117647, 1,
1.786626, -0.7882566, 1.392563, 1, 0, 0.2039216, 1,
1.804522, -0.002342572, 1.091703, 1, 0, 0.1960784, 1,
1.826608, 0.05970228, -0.424606, 1, 0, 0.1921569, 1,
1.833151, 2.44904, -0.8971053, 1, 0, 0.1843137, 1,
1.858406, -1.076355, 1.609549, 1, 0, 0.1803922, 1,
1.874997, -0.4731585, 2.20958, 1, 0, 0.172549, 1,
1.880383, 0.7041003, 0.4697485, 1, 0, 0.1686275, 1,
1.891365, 0.7157769, 0.3517395, 1, 0, 0.1607843, 1,
1.906552, -1.351034, 3.663931, 1, 0, 0.1568628, 1,
1.907691, -1.050747, 1.618276, 1, 0, 0.1490196, 1,
1.919576, 0.8561499, 2.515979, 1, 0, 0.145098, 1,
1.927944, -0.6755107, 1.886228, 1, 0, 0.1372549, 1,
1.991245, 0.1602708, 2.408174, 1, 0, 0.1333333, 1,
2.041575, -1.015827, 2.922276, 1, 0, 0.1254902, 1,
2.073938, 0.3116192, 2.587481, 1, 0, 0.1215686, 1,
2.083558, 0.5841891, 1.950028, 1, 0, 0.1137255, 1,
2.177826, -0.3285393, 4.141606, 1, 0, 0.1098039, 1,
2.183375, 0.1665342, 0.06739887, 1, 0, 0.1019608, 1,
2.19039, 0.3511473, 1.035637, 1, 0, 0.09411765, 1,
2.191642, 1.223893, 0.4553283, 1, 0, 0.09019608, 1,
2.19179, -1.486154, 2.679938, 1, 0, 0.08235294, 1,
2.215632, 2.151512, 0.8771662, 1, 0, 0.07843138, 1,
2.216073, -1.367981, 2.914761, 1, 0, 0.07058824, 1,
2.230658, 1.719385, 1.35311, 1, 0, 0.06666667, 1,
2.273044, 0.3515188, 1.287209, 1, 0, 0.05882353, 1,
2.288719, -0.42801, 2.425788, 1, 0, 0.05490196, 1,
2.301925, 0.7081336, 0.4884841, 1, 0, 0.04705882, 1,
2.319105, 0.847096, 1.101669, 1, 0, 0.04313726, 1,
2.37172, -0.5882928, 1.408489, 1, 0, 0.03529412, 1,
2.424084, 0.04232306, 1.580594, 1, 0, 0.03137255, 1,
2.427474, 0.3481071, 0.742453, 1, 0, 0.02352941, 1,
2.525593, 1.94183, 1.706575, 1, 0, 0.01960784, 1,
2.579938, 0.8926998, -0.42609, 1, 0, 0.01176471, 1,
2.81376, -1.696705, 1.621287, 1, 0, 0.007843138, 1
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
0.02992058, -3.89186, -7.9115, 0, -0.5, 0.5, 0.5,
0.02992058, -3.89186, -7.9115, 1, -0.5, 0.5, 0.5,
0.02992058, -3.89186, -7.9115, 1, 1.5, 0.5, 0.5,
0.02992058, -3.89186, -7.9115, 0, 1.5, 0.5, 0.5
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
-3.697641, 0.9611481, -7.9115, 0, -0.5, 0.5, 0.5,
-3.697641, 0.9611481, -7.9115, 1, -0.5, 0.5, 0.5,
-3.697641, 0.9611481, -7.9115, 1, 1.5, 0.5, 0.5,
-3.697641, 0.9611481, -7.9115, 0, 1.5, 0.5, 0.5
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
-3.697641, -3.89186, 0.01254582, 0, -0.5, 0.5, 0.5,
-3.697641, -3.89186, 0.01254582, 1, -0.5, 0.5, 0.5,
-3.697641, -3.89186, 0.01254582, 1, 1.5, 0.5, 0.5,
-3.697641, -3.89186, 0.01254582, 0, 1.5, 0.5, 0.5
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
-2, -2.771935, -6.082874,
2, -2.771935, -6.082874,
-2, -2.771935, -6.082874,
-2, -2.958589, -6.387645,
-1, -2.771935, -6.082874,
-1, -2.958589, -6.387645,
0, -2.771935, -6.082874,
0, -2.958589, -6.387645,
1, -2.771935, -6.082874,
1, -2.958589, -6.387645,
2, -2.771935, -6.082874,
2, -2.958589, -6.387645
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
-2, -3.331897, -6.997187, 0, -0.5, 0.5, 0.5,
-2, -3.331897, -6.997187, 1, -0.5, 0.5, 0.5,
-2, -3.331897, -6.997187, 1, 1.5, 0.5, 0.5,
-2, -3.331897, -6.997187, 0, 1.5, 0.5, 0.5,
-1, -3.331897, -6.997187, 0, -0.5, 0.5, 0.5,
-1, -3.331897, -6.997187, 1, -0.5, 0.5, 0.5,
-1, -3.331897, -6.997187, 1, 1.5, 0.5, 0.5,
-1, -3.331897, -6.997187, 0, 1.5, 0.5, 0.5,
0, -3.331897, -6.997187, 0, -0.5, 0.5, 0.5,
0, -3.331897, -6.997187, 1, -0.5, 0.5, 0.5,
0, -3.331897, -6.997187, 1, 1.5, 0.5, 0.5,
0, -3.331897, -6.997187, 0, 1.5, 0.5, 0.5,
1, -3.331897, -6.997187, 0, -0.5, 0.5, 0.5,
1, -3.331897, -6.997187, 1, -0.5, 0.5, 0.5,
1, -3.331897, -6.997187, 1, 1.5, 0.5, 0.5,
1, -3.331897, -6.997187, 0, 1.5, 0.5, 0.5,
2, -3.331897, -6.997187, 0, -0.5, 0.5, 0.5,
2, -3.331897, -6.997187, 1, -0.5, 0.5, 0.5,
2, -3.331897, -6.997187, 1, 1.5, 0.5, 0.5,
2, -3.331897, -6.997187, 0, 1.5, 0.5, 0.5
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
-2.837434, -2, -6.082874,
-2.837434, 4, -6.082874,
-2.837434, -2, -6.082874,
-2.980802, -2, -6.387645,
-2.837434, 0, -6.082874,
-2.980802, 0, -6.387645,
-2.837434, 2, -6.082874,
-2.980802, 2, -6.387645,
-2.837434, 4, -6.082874,
-2.980802, 4, -6.387645
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
"2",
"4"
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
-3.267538, -2, -6.997187, 0, -0.5, 0.5, 0.5,
-3.267538, -2, -6.997187, 1, -0.5, 0.5, 0.5,
-3.267538, -2, -6.997187, 1, 1.5, 0.5, 0.5,
-3.267538, -2, -6.997187, 0, 1.5, 0.5, 0.5,
-3.267538, 0, -6.997187, 0, -0.5, 0.5, 0.5,
-3.267538, 0, -6.997187, 1, -0.5, 0.5, 0.5,
-3.267538, 0, -6.997187, 1, 1.5, 0.5, 0.5,
-3.267538, 0, -6.997187, 0, 1.5, 0.5, 0.5,
-3.267538, 2, -6.997187, 0, -0.5, 0.5, 0.5,
-3.267538, 2, -6.997187, 1, -0.5, 0.5, 0.5,
-3.267538, 2, -6.997187, 1, 1.5, 0.5, 0.5,
-3.267538, 2, -6.997187, 0, 1.5, 0.5, 0.5,
-3.267538, 4, -6.997187, 0, -0.5, 0.5, 0.5,
-3.267538, 4, -6.997187, 1, -0.5, 0.5, 0.5,
-3.267538, 4, -6.997187, 1, 1.5, 0.5, 0.5,
-3.267538, 4, -6.997187, 0, 1.5, 0.5, 0.5
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
-2.837434, -2.771935, -4,
-2.837434, -2.771935, 4,
-2.837434, -2.771935, -4,
-2.980802, -2.958589, -4,
-2.837434, -2.771935, -2,
-2.980802, -2.958589, -2,
-2.837434, -2.771935, 0,
-2.980802, -2.958589, 0,
-2.837434, -2.771935, 2,
-2.980802, -2.958589, 2,
-2.837434, -2.771935, 4,
-2.980802, -2.958589, 4
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
-3.267538, -3.331897, -4, 0, -0.5, 0.5, 0.5,
-3.267538, -3.331897, -4, 1, -0.5, 0.5, 0.5,
-3.267538, -3.331897, -4, 1, 1.5, 0.5, 0.5,
-3.267538, -3.331897, -4, 0, 1.5, 0.5, 0.5,
-3.267538, -3.331897, -2, 0, -0.5, 0.5, 0.5,
-3.267538, -3.331897, -2, 1, -0.5, 0.5, 0.5,
-3.267538, -3.331897, -2, 1, 1.5, 0.5, 0.5,
-3.267538, -3.331897, -2, 0, 1.5, 0.5, 0.5,
-3.267538, -3.331897, 0, 0, -0.5, 0.5, 0.5,
-3.267538, -3.331897, 0, 1, -0.5, 0.5, 0.5,
-3.267538, -3.331897, 0, 1, 1.5, 0.5, 0.5,
-3.267538, -3.331897, 0, 0, 1.5, 0.5, 0.5,
-3.267538, -3.331897, 2, 0, -0.5, 0.5, 0.5,
-3.267538, -3.331897, 2, 1, -0.5, 0.5, 0.5,
-3.267538, -3.331897, 2, 1, 1.5, 0.5, 0.5,
-3.267538, -3.331897, 2, 0, 1.5, 0.5, 0.5,
-3.267538, -3.331897, 4, 0, -0.5, 0.5, 0.5,
-3.267538, -3.331897, 4, 1, -0.5, 0.5, 0.5,
-3.267538, -3.331897, 4, 1, 1.5, 0.5, 0.5,
-3.267538, -3.331897, 4, 0, 1.5, 0.5, 0.5
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
-2.837434, -2.771935, -6.082874,
-2.837434, 4.694232, -6.082874,
-2.837434, -2.771935, 6.107966,
-2.837434, 4.694232, 6.107966,
-2.837434, -2.771935, -6.082874,
-2.837434, -2.771935, 6.107966,
-2.837434, 4.694232, -6.082874,
-2.837434, 4.694232, 6.107966,
-2.837434, -2.771935, -6.082874,
2.897275, -2.771935, -6.082874,
-2.837434, -2.771935, 6.107966,
2.897275, -2.771935, 6.107966,
-2.837434, 4.694232, -6.082874,
2.897275, 4.694232, -6.082874,
-2.837434, 4.694232, 6.107966,
2.897275, 4.694232, 6.107966,
2.897275, -2.771935, -6.082874,
2.897275, 4.694232, -6.082874,
2.897275, -2.771935, 6.107966,
2.897275, 4.694232, 6.107966,
2.897275, -2.771935, -6.082874,
2.897275, -2.771935, 6.107966,
2.897275, 4.694232, -6.082874,
2.897275, 4.694232, 6.107966
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
var radius = 8.224811;
var distance = 36.59311;
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
mvMatrix.translate( -0.02992058, -0.9611481, -0.01254582 );
mvMatrix.scale( 1.550702, 1.191083, 0.7294679 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.59311);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Dinoterb<-read.table("Dinoterb.xyz")
```

```
## Error in read.table("Dinoterb.xyz"): no lines available in input
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
-2.753919, -0.9732762, -0.6749665, 0, 0, 1, 1, 1,
-2.709388, 1.467868, 0.7876512, 1, 0, 0, 1, 1,
-2.61634, -2.09392, -2.253839, 1, 0, 0, 1, 1,
-2.604724, 0.07924571, -0.5793267, 1, 0, 0, 1, 1,
-2.588607, 1.217057, -0.9364672, 1, 0, 0, 1, 1,
-2.556032, -1.430511, -0.7094715, 1, 0, 0, 1, 1,
-2.520176, -0.4143349, -1.148429, 0, 0, 0, 1, 1,
-2.514891, -0.4919773, -1.337795, 0, 0, 0, 1, 1,
-2.493304, -0.1740227, -1.957228, 0, 0, 0, 1, 1,
-2.492369, -1.112878, -2.393183, 0, 0, 0, 1, 1,
-2.453539, -0.3410566, -1.345841, 0, 0, 0, 1, 1,
-2.342919, -0.02160057, -1.170659, 0, 0, 0, 1, 1,
-2.28771, -0.159501, -1.587298, 0, 0, 0, 1, 1,
-2.276002, -0.4331977, -1.115099, 1, 1, 1, 1, 1,
-2.273296, -0.3851173, -2.506541, 1, 1, 1, 1, 1,
-2.203276, 0.5060331, -1.878255, 1, 1, 1, 1, 1,
-2.184833, -0.1182212, -1.410863, 1, 1, 1, 1, 1,
-2.163529, 0.2198528, -1.513608, 1, 1, 1, 1, 1,
-2.068256, 0.7805618, -2.068078, 1, 1, 1, 1, 1,
-2.034052, 1.851358, -0.1858209, 1, 1, 1, 1, 1,
-2.00713, -0.7735327, -1.617821, 1, 1, 1, 1, 1,
-2.005056, -0.2549641, -0.8905907, 1, 1, 1, 1, 1,
-1.98713, 0.3658139, -1.090827, 1, 1, 1, 1, 1,
-1.986811, 0.4154344, -0.6138418, 1, 1, 1, 1, 1,
-1.975545, -1.005534, -2.763795, 1, 1, 1, 1, 1,
-1.943605, 0.4775336, -1.308948, 1, 1, 1, 1, 1,
-1.92487, 0.6043554, -1.209185, 1, 1, 1, 1, 1,
-1.914155, -0.8979006, -0.9304057, 1, 1, 1, 1, 1,
-1.911669, 0.7251001, 0.8524485, 0, 0, 1, 1, 1,
-1.898541, 0.9678639, -2.233371, 1, 0, 0, 1, 1,
-1.892264, 1.27226, 0.836705, 1, 0, 0, 1, 1,
-1.891968, -0.4180388, -2.080545, 1, 0, 0, 1, 1,
-1.888861, 0.2126719, -2.757521, 1, 0, 0, 1, 1,
-1.862849, -0.4101045, -0.6539466, 1, 0, 0, 1, 1,
-1.855603, -1.843161, -2.493863, 0, 0, 0, 1, 1,
-1.853361, 1.675342, -2.923546, 0, 0, 0, 1, 1,
-1.825331, 0.5354315, -2.897127, 0, 0, 0, 1, 1,
-1.8195, 0.545603, -0.7351353, 0, 0, 0, 1, 1,
-1.816855, -1.143071, 0.01989702, 0, 0, 0, 1, 1,
-1.810877, 2.349685, -0.5525004, 0, 0, 0, 1, 1,
-1.803978, 2.476343, -0.4232958, 0, 0, 0, 1, 1,
-1.803319, 0.5194501, -0.6196187, 1, 1, 1, 1, 1,
-1.786916, 0.2404724, -0.8148503, 1, 1, 1, 1, 1,
-1.771995, -0.3990866, -1.08063, 1, 1, 1, 1, 1,
-1.771727, 0.9573649, -1.230299, 1, 1, 1, 1, 1,
-1.763049, -1.697656, -2.346844, 1, 1, 1, 1, 1,
-1.761685, -0.35575, -1.478341, 1, 1, 1, 1, 1,
-1.750508, 1.250902, 0.5152739, 1, 1, 1, 1, 1,
-1.744203, -0.09912812, -0.6246312, 1, 1, 1, 1, 1,
-1.723719, -0.7025707, -2.955381, 1, 1, 1, 1, 1,
-1.723482, -0.03039553, -3.185286, 1, 1, 1, 1, 1,
-1.723298, 0.03962567, -2.129465, 1, 1, 1, 1, 1,
-1.715972, -0.6091535, -2.185071, 1, 1, 1, 1, 1,
-1.691007, -2.24567, -3.264543, 1, 1, 1, 1, 1,
-1.688285, -0.2381482, -2.397326, 1, 1, 1, 1, 1,
-1.648057, -0.8555351, -1.133881, 1, 1, 1, 1, 1,
-1.641417, -1.065653, -2.673617, 0, 0, 1, 1, 1,
-1.638496, -0.6320558, -2.491698, 1, 0, 0, 1, 1,
-1.628552, -0.8716598, -2.438129, 1, 0, 0, 1, 1,
-1.620383, -0.6565953, -2.259049, 1, 0, 0, 1, 1,
-1.619197, -0.9343132, -3.165276, 1, 0, 0, 1, 1,
-1.585892, -0.8418384, -3.34374, 1, 0, 0, 1, 1,
-1.584885, -0.5991887, -2.210852, 0, 0, 0, 1, 1,
-1.57415, 1.141608, -1.035825, 0, 0, 0, 1, 1,
-1.561938, -0.4707014, 0.1355915, 0, 0, 0, 1, 1,
-1.558132, 0.8657297, -2.167871, 0, 0, 0, 1, 1,
-1.554029, 1.493333, -1.014712, 0, 0, 0, 1, 1,
-1.550893, -0.2670105, -2.106086, 0, 0, 0, 1, 1,
-1.544663, -0.7227657, -2.650606, 0, 0, 0, 1, 1,
-1.544234, -0.671308, -2.635451, 1, 1, 1, 1, 1,
-1.543736, 0.6679096, -3.593418, 1, 1, 1, 1, 1,
-1.542573, -0.7389458, -2.391139, 1, 1, 1, 1, 1,
-1.532502, 0.8772127, -0.6318958, 1, 1, 1, 1, 1,
-1.529772, -0.5624428, -1.079738, 1, 1, 1, 1, 1,
-1.52774, -0.3023285, -2.415836, 1, 1, 1, 1, 1,
-1.522396, 0.1094232, -1.254687, 1, 1, 1, 1, 1,
-1.517908, 1.788271, -0.9243172, 1, 1, 1, 1, 1,
-1.511078, 0.01034737, -2.164574, 1, 1, 1, 1, 1,
-1.508414, 1.720495, -0.3057523, 1, 1, 1, 1, 1,
-1.50556, 0.7491875, -2.884503, 1, 1, 1, 1, 1,
-1.504421, 0.7266304, -0.5230907, 1, 1, 1, 1, 1,
-1.499171, -1.653049, -3.673433, 1, 1, 1, 1, 1,
-1.478248, 1.169263, -1.424108, 1, 1, 1, 1, 1,
-1.475441, 0.2216176, -3.248649, 1, 1, 1, 1, 1,
-1.467683, 1.032598, -0.7259438, 0, 0, 1, 1, 1,
-1.462498, 1.081815, -2.112389, 1, 0, 0, 1, 1,
-1.457371, 0.6350536, -1.644598, 1, 0, 0, 1, 1,
-1.437281, -0.8529257, -1.764879, 1, 0, 0, 1, 1,
-1.428687, -1.439219, -1.381747, 1, 0, 0, 1, 1,
-1.426461, 0.569675, -0.9081177, 1, 0, 0, 1, 1,
-1.424007, 1.301587, -1.545912, 0, 0, 0, 1, 1,
-1.423425, -1.445599, -1.884504, 0, 0, 0, 1, 1,
-1.412831, -0.3393669, -1.161252, 0, 0, 0, 1, 1,
-1.410619, 0.5890811, -1.785164, 0, 0, 0, 1, 1,
-1.410166, -0.3650056, -1.831253, 0, 0, 0, 1, 1,
-1.398479, -0.02782893, -1.916527, 0, 0, 0, 1, 1,
-1.397279, 1.133166, -1.219562, 0, 0, 0, 1, 1,
-1.392308, -1.549238, -3.489296, 1, 1, 1, 1, 1,
-1.389091, -1.150853, -3.233571, 1, 1, 1, 1, 1,
-1.36519, 0.01093064, -0.304888, 1, 1, 1, 1, 1,
-1.361372, 0.283845, -0.9676439, 1, 1, 1, 1, 1,
-1.359817, -0.7135227, -0.4085152, 1, 1, 1, 1, 1,
-1.359726, 0.05448231, -1.0457, 1, 1, 1, 1, 1,
-1.356382, -0.4569531, -0.9318501, 1, 1, 1, 1, 1,
-1.355195, 1.529114, -1.096406, 1, 1, 1, 1, 1,
-1.354028, 0.7342102, -0.191017, 1, 1, 1, 1, 1,
-1.353232, 0.4674217, -1.573186, 1, 1, 1, 1, 1,
-1.340497, 0.4975219, -0.2010908, 1, 1, 1, 1, 1,
-1.335997, -0.04082813, -4.03699, 1, 1, 1, 1, 1,
-1.331033, -0.1283881, 0.2938807, 1, 1, 1, 1, 1,
-1.327804, 0.9941504, -1.676598, 1, 1, 1, 1, 1,
-1.314729, -0.8800606, -1.1965, 1, 1, 1, 1, 1,
-1.297231, -0.2760671, -3.475603, 0, 0, 1, 1, 1,
-1.292909, -0.3334939, -2.734066, 1, 0, 0, 1, 1,
-1.292789, 0.9256816, -2.173519, 1, 0, 0, 1, 1,
-1.290952, -0.7634329, -3.51023, 1, 0, 0, 1, 1,
-1.286098, 0.5954577, -1.319752, 1, 0, 0, 1, 1,
-1.28076, 0.8539882, 0.1821158, 1, 0, 0, 1, 1,
-1.276042, -0.8163232, -1.683523, 0, 0, 0, 1, 1,
-1.269945, 0.5748946, -2.581331, 0, 0, 0, 1, 1,
-1.266408, 0.3419879, -1.104925, 0, 0, 0, 1, 1,
-1.26381, 0.6894844, -0.06492087, 0, 0, 0, 1, 1,
-1.262269, -1.329101, -3.458174, 0, 0, 0, 1, 1,
-1.255168, 2.275291, -1.287751, 0, 0, 0, 1, 1,
-1.254616, 0.3137336, -1.218159, 0, 0, 0, 1, 1,
-1.251018, 0.519227, -0.3504986, 1, 1, 1, 1, 1,
-1.249197, 0.7432786, -1.14201, 1, 1, 1, 1, 1,
-1.247112, 1.457682, -1.382759, 1, 1, 1, 1, 1,
-1.244668, 0.08436838, -2.006923, 1, 1, 1, 1, 1,
-1.243868, -1.440907, -2.50082, 1, 1, 1, 1, 1,
-1.216271, 1.329722, -1.225745, 1, 1, 1, 1, 1,
-1.21353, -0.8953303, -1.818249, 1, 1, 1, 1, 1,
-1.212647, 0.1421644, -2.738178, 1, 1, 1, 1, 1,
-1.212555, -0.9601408, -1.764998, 1, 1, 1, 1, 1,
-1.21224, -0.08093971, -1.328963, 1, 1, 1, 1, 1,
-1.208264, 0.1130833, 0.7044524, 1, 1, 1, 1, 1,
-1.198279, -1.141847, -2.239691, 1, 1, 1, 1, 1,
-1.196046, -1.980902, -3.193767, 1, 1, 1, 1, 1,
-1.193931, -0.2559799, -2.752388, 1, 1, 1, 1, 1,
-1.186258, 0.5246547, -1.612814, 1, 1, 1, 1, 1,
-1.175827, -0.1537549, -0.7346508, 0, 0, 1, 1, 1,
-1.17476, 0.4851488, -1.597738, 1, 0, 0, 1, 1,
-1.169804, 1.880132, -3.050224, 1, 0, 0, 1, 1,
-1.16735, -0.9361719, -4.243429, 1, 0, 0, 1, 1,
-1.162648, -0.9538598, -1.238004, 1, 0, 0, 1, 1,
-1.15576, -0.05813603, -2.459826, 1, 0, 0, 1, 1,
-1.152975, 0.419343, -2.801274, 0, 0, 0, 1, 1,
-1.145926, 0.739249, -2.007445, 0, 0, 0, 1, 1,
-1.142612, 0.4514806, -2.699275, 0, 0, 0, 1, 1,
-1.142466, 0.09416829, -2.850095, 0, 0, 0, 1, 1,
-1.13665, -1.132881, -0.578599, 0, 0, 0, 1, 1,
-1.133649, -1.420336, -2.561675, 0, 0, 0, 1, 1,
-1.128744, 0.8217375, -1.089697, 0, 0, 0, 1, 1,
-1.120082, 1.022397, 0.1532435, 1, 1, 1, 1, 1,
-1.119399, 1.659693, 0.5290889, 1, 1, 1, 1, 1,
-1.118811, -0.4827254, -2.654711, 1, 1, 1, 1, 1,
-1.108208, -1.147067, -1.727328, 1, 1, 1, 1, 1,
-1.107466, -1.525214, -2.258504, 1, 1, 1, 1, 1,
-1.105116, 0.3212987, -2.547343, 1, 1, 1, 1, 1,
-1.104662, -0.8190473, -3.766871, 1, 1, 1, 1, 1,
-1.103265, -0.4917734, -3.708753, 1, 1, 1, 1, 1,
-1.093383, -0.01481881, -1.636135, 1, 1, 1, 1, 1,
-1.092291, -0.2272208, -0.6296001, 1, 1, 1, 1, 1,
-1.089167, 0.01345245, -0.9014324, 1, 1, 1, 1, 1,
-1.086398, -1.53782, -3.840676, 1, 1, 1, 1, 1,
-1.075202, 1.860045, -0.8803163, 1, 1, 1, 1, 1,
-1.070034, -0.8453587, -1.619982, 1, 1, 1, 1, 1,
-1.058355, -2.242554, -3.871393, 1, 1, 1, 1, 1,
-1.05527, 1.220657, -0.4404911, 0, 0, 1, 1, 1,
-1.0544, -1.092066, -2.157825, 1, 0, 0, 1, 1,
-1.048968, -0.1661079, -2.08598, 1, 0, 0, 1, 1,
-1.041388, 0.4192449, -0.6091669, 1, 0, 0, 1, 1,
-1.021579, -1.369969, -3.503432, 1, 0, 0, 1, 1,
-1.018727, -0.8765888, -0.7396685, 1, 0, 0, 1, 1,
-1.017275, -2.594668, -4.210804, 0, 0, 0, 1, 1,
-1.016452, 0.08502606, -2.633212, 0, 0, 0, 1, 1,
-1.013738, -0.5283735, -2.546746, 0, 0, 0, 1, 1,
-1.007688, 1.68728, -0.9158966, 0, 0, 0, 1, 1,
-1.006677, 2.30751, 0.9379596, 0, 0, 0, 1, 1,
-1.004471, -2.174351, -2.776368, 0, 0, 0, 1, 1,
-1.004085, -2.604949, -2.066763, 0, 0, 0, 1, 1,
-1.002937, -0.7257724, -3.396791, 1, 1, 1, 1, 1,
-0.9963146, -0.8776305, -2.509747, 1, 1, 1, 1, 1,
-0.9827316, 1.662138, -1.733863, 1, 1, 1, 1, 1,
-0.9822564, 0.2205961, -0.9518296, 1, 1, 1, 1, 1,
-0.9734474, 1.991968, -2.063593, 1, 1, 1, 1, 1,
-0.972659, -0.4188899, -2.83742, 1, 1, 1, 1, 1,
-0.9724255, 0.7244909, -1.430453, 1, 1, 1, 1, 1,
-0.9529158, -0.7986966, -3.332549, 1, 1, 1, 1, 1,
-0.9492216, -0.5675883, -2.672829, 1, 1, 1, 1, 1,
-0.9431887, -1.359992, -3.200883, 1, 1, 1, 1, 1,
-0.9265518, -0.20673, -1.939139, 1, 1, 1, 1, 1,
-0.9148139, 1.547871, 0.8627721, 1, 1, 1, 1, 1,
-0.9122185, -1.072288, -0.3881305, 1, 1, 1, 1, 1,
-0.9055879, -1.96491, -2.712151, 1, 1, 1, 1, 1,
-0.9033922, -0.3879885, -2.140584, 1, 1, 1, 1, 1,
-0.9030959, 0.1188186, -1.362176, 0, 0, 1, 1, 1,
-0.8954247, 1.63381, -0.1503996, 1, 0, 0, 1, 1,
-0.8950089, 0.01349322, -1.644509, 1, 0, 0, 1, 1,
-0.8937458, -1.035509, -1.791019, 1, 0, 0, 1, 1,
-0.8930868, 1.575804, -0.3879911, 1, 0, 0, 1, 1,
-0.892886, 0.7289159, -1.406823, 1, 0, 0, 1, 1,
-0.8908674, -1.258987, -4.202114, 0, 0, 0, 1, 1,
-0.8868367, -0.8265166, -2.057107, 0, 0, 0, 1, 1,
-0.8861742, 0.1043434, -1.622771, 0, 0, 0, 1, 1,
-0.8814925, 0.7236949, -0.5835806, 0, 0, 0, 1, 1,
-0.8744566, 1.502844, -0.7033326, 0, 0, 0, 1, 1,
-0.872731, -0.2664356, -3.394472, 0, 0, 0, 1, 1,
-0.865736, -0.4199132, -1.229978, 0, 0, 0, 1, 1,
-0.8656056, 0.6591888, -0.4878002, 1, 1, 1, 1, 1,
-0.859454, -0.7201605, -2.483179, 1, 1, 1, 1, 1,
-0.8585402, -1.263206, -2.088446, 1, 1, 1, 1, 1,
-0.8573368, 1.140625, 0.1624594, 1, 1, 1, 1, 1,
-0.8570678, -1.468866, -2.816862, 1, 1, 1, 1, 1,
-0.8568725, 1.264888, 0.2634868, 1, 1, 1, 1, 1,
-0.8546216, -0.03630847, -0.3096045, 1, 1, 1, 1, 1,
-0.8447779, -0.4118212, -2.19427, 1, 1, 1, 1, 1,
-0.8442772, 0.4721845, -0.1024065, 1, 1, 1, 1, 1,
-0.8435383, -1.8836, -3.38339, 1, 1, 1, 1, 1,
-0.83915, 1.242836, -1.790328, 1, 1, 1, 1, 1,
-0.8390528, -1.58532, -2.299673, 1, 1, 1, 1, 1,
-0.8299035, 0.9815965, -0.55185, 1, 1, 1, 1, 1,
-0.8186329, 0.7479661, -0.3365319, 1, 1, 1, 1, 1,
-0.8181065, -0.9120091, -3.27171, 1, 1, 1, 1, 1,
-0.8145616, -0.4874574, -2.964702, 0, 0, 1, 1, 1,
-0.8144075, 0.378244, 0.5582291, 1, 0, 0, 1, 1,
-0.814001, 0.6864206, -2.056162, 1, 0, 0, 1, 1,
-0.8107617, 0.8190918, -1.176594, 1, 0, 0, 1, 1,
-0.8085487, -0.1108704, -2.999748, 1, 0, 0, 1, 1,
-0.7984741, 1.366748, -0.6620265, 1, 0, 0, 1, 1,
-0.7944393, -0.1593051, -1.513228, 0, 0, 0, 1, 1,
-0.7931582, -0.8551765, -2.135325, 0, 0, 0, 1, 1,
-0.792021, 0.6701612, -1.199931, 0, 0, 0, 1, 1,
-0.7903668, -1.32994, -3.309594, 0, 0, 0, 1, 1,
-0.7889373, 1.013685, 0.3902856, 0, 0, 0, 1, 1,
-0.788621, 0.01825773, -2.766012, 0, 0, 0, 1, 1,
-0.7866899, -0.8177968, -4.232895, 0, 0, 0, 1, 1,
-0.7859948, -0.7949983, -2.60367, 1, 1, 1, 1, 1,
-0.7782317, 0.4895196, -1.621544, 1, 1, 1, 1, 1,
-0.7776403, 0.3432801, -1.736747, 1, 1, 1, 1, 1,
-0.7733933, -0.594138, -4.079851, 1, 1, 1, 1, 1,
-0.7729078, -1.436805, -2.345068, 1, 1, 1, 1, 1,
-0.770533, -0.4077348, -2.576322, 1, 1, 1, 1, 1,
-0.7677391, 0.1997318, -0.8820605, 1, 1, 1, 1, 1,
-0.7626461, -1.312945, -2.484431, 1, 1, 1, 1, 1,
-0.7519206, -0.3841447, -2.535289, 1, 1, 1, 1, 1,
-0.7514845, -0.1810752, -0.9311132, 1, 1, 1, 1, 1,
-0.744496, -0.1608792, -3.009458, 1, 1, 1, 1, 1,
-0.7431412, 0.3158743, -0.3079145, 1, 1, 1, 1, 1,
-0.7262995, -0.6274945, -1.159979, 1, 1, 1, 1, 1,
-0.7227417, 0.2024752, -2.346145, 1, 1, 1, 1, 1,
-0.7198069, -2.663204, -4.195733, 1, 1, 1, 1, 1,
-0.7182315, -0.07913615, -2.240368, 0, 0, 1, 1, 1,
-0.7097812, -0.08760992, -2.712656, 1, 0, 0, 1, 1,
-0.7091986, -0.08196926, -3.3791, 1, 0, 0, 1, 1,
-0.7090737, -0.7105395, -2.746021, 1, 0, 0, 1, 1,
-0.7076148, 1.006034, -0.9604251, 1, 0, 0, 1, 1,
-0.7052699, 0.4485724, -1.582782, 1, 0, 0, 1, 1,
-0.6992734, -1.081017, -1.616659, 0, 0, 0, 1, 1,
-0.6983506, -1.761482, -4.243451, 0, 0, 0, 1, 1,
-0.69629, 0.6477447, -2.645424, 0, 0, 0, 1, 1,
-0.6942627, -0.2326527, -1.783799, 0, 0, 0, 1, 1,
-0.6932892, 0.09804966, -0.4597144, 0, 0, 0, 1, 1,
-0.6864166, -0.6681763, -1.97217, 0, 0, 0, 1, 1,
-0.6859877, -0.2996394, -1.777696, 0, 0, 0, 1, 1,
-0.6839502, 1.206432, -0.9272301, 1, 1, 1, 1, 1,
-0.6833175, 1.01439, -1.241528, 1, 1, 1, 1, 1,
-0.6829721, -0.8972155, -2.94478, 1, 1, 1, 1, 1,
-0.6814995, -0.3318698, -2.892516, 1, 1, 1, 1, 1,
-0.6784413, 1.095294, 1.061595, 1, 1, 1, 1, 1,
-0.6776276, 0.5916406, -2.661391, 1, 1, 1, 1, 1,
-0.6737715, -0.6026807, -1.272141, 1, 1, 1, 1, 1,
-0.6717333, -0.5148872, -4.045606, 1, 1, 1, 1, 1,
-0.6597061, 1.629243, -1.736825, 1, 1, 1, 1, 1,
-0.6590854, 2.251431, -0.008952601, 1, 1, 1, 1, 1,
-0.6586866, 1.837324, -1.972458, 1, 1, 1, 1, 1,
-0.6586704, -0.4115355, -1.873003, 1, 1, 1, 1, 1,
-0.6511628, -0.2528053, -3.33087, 1, 1, 1, 1, 1,
-0.6459966, -0.008498766, -2.711212, 1, 1, 1, 1, 1,
-0.6427378, -1.741365, -2.119854, 1, 1, 1, 1, 1,
-0.6407265, 1.373436, -1.352325, 0, 0, 1, 1, 1,
-0.6344163, -1.736745, -2.058458, 1, 0, 0, 1, 1,
-0.6328454, 1.200162, -1.423807, 1, 0, 0, 1, 1,
-0.6312552, 0.4608034, -2.240894, 1, 0, 0, 1, 1,
-0.6305614, -0.7930417, -1.257046, 1, 0, 0, 1, 1,
-0.6285262, -0.598845, -2.148243, 1, 0, 0, 1, 1,
-0.6276184, 0.1996495, -0.5573969, 0, 0, 0, 1, 1,
-0.6234427, -0.4882711, -0.6480989, 0, 0, 0, 1, 1,
-0.6230787, -0.711961, -1.044371, 0, 0, 0, 1, 1,
-0.6082847, 3.092078, -0.5186452, 0, 0, 0, 1, 1,
-0.6030976, -0.1370097, -3.938991, 0, 0, 0, 1, 1,
-0.6023328, -1.777246, -0.9365493, 0, 0, 0, 1, 1,
-0.6004327, 0.2691957, -2.105669, 0, 0, 0, 1, 1,
-0.5981436, -0.1210853, -1.98553, 1, 1, 1, 1, 1,
-0.5961743, 0.616115, -1.647561, 1, 1, 1, 1, 1,
-0.5948016, -0.03629766, -0.1305504, 1, 1, 1, 1, 1,
-0.5929314, 1.06297, 0.5343736, 1, 1, 1, 1, 1,
-0.5927232, -0.3910346, -3.309677, 1, 1, 1, 1, 1,
-0.5916967, 0.6931812, -0.2274299, 1, 1, 1, 1, 1,
-0.5904565, 1.155687, -0.8723809, 1, 1, 1, 1, 1,
-0.590304, 0.08114569, -0.8461087, 1, 1, 1, 1, 1,
-0.5873336, 1.717071, 0.9753087, 1, 1, 1, 1, 1,
-0.5853878, 0.9792615, -0.3474126, 1, 1, 1, 1, 1,
-0.5820289, -0.08526182, -2.120831, 1, 1, 1, 1, 1,
-0.5812958, -1.422635, -1.87678, 1, 1, 1, 1, 1,
-0.5766315, 0.6596564, -0.3038272, 1, 1, 1, 1, 1,
-0.56931, 1.934535, -0.7836229, 1, 1, 1, 1, 1,
-0.569032, 0.6095962, -0.8640968, 1, 1, 1, 1, 1,
-0.5682576, -0.1823135, -2.523291, 0, 0, 1, 1, 1,
-0.5640938, 0.3182124, -2.239465, 1, 0, 0, 1, 1,
-0.5536237, -0.2798028, -1.308221, 1, 0, 0, 1, 1,
-0.5531143, 0.04024036, -0.09805374, 1, 0, 0, 1, 1,
-0.5521521, -1.340085, -4.527949, 1, 0, 0, 1, 1,
-0.5489625, 0.6453919, -1.212559, 1, 0, 0, 1, 1,
-0.544924, -0.5652308, -2.159212, 0, 0, 0, 1, 1,
-0.5332736, 0.790587, -0.2641944, 0, 0, 0, 1, 1,
-0.5308918, -0.7946946, -3.405421, 0, 0, 0, 1, 1,
-0.5283569, -1.198983, -2.422764, 0, 0, 0, 1, 1,
-0.524258, -0.4585965, -2.906762, 0, 0, 0, 1, 1,
-0.5237867, -0.2885341, -2.307522, 0, 0, 0, 1, 1,
-0.5222906, 0.3444622, -2.266503, 0, 0, 0, 1, 1,
-0.5180811, 0.5267608, 1.106667, 1, 1, 1, 1, 1,
-0.5135551, 0.384442, -0.3580193, 1, 1, 1, 1, 1,
-0.5122122, -0.4322772, -2.748553, 1, 1, 1, 1, 1,
-0.5120566, -0.8918584, -0.9154388, 1, 1, 1, 1, 1,
-0.5098214, 0.8113788, 0.4224145, 1, 1, 1, 1, 1,
-0.5080287, -1.037736, -3.270062, 1, 1, 1, 1, 1,
-0.5070461, -1.463696, -2.301572, 1, 1, 1, 1, 1,
-0.5027405, -0.145973, -1.001604, 1, 1, 1, 1, 1,
-0.502164, 0.3329864, -2.486497, 1, 1, 1, 1, 1,
-0.497314, -0.7063778, -1.572884, 1, 1, 1, 1, 1,
-0.4972731, -0.8877218, -1.696966, 1, 1, 1, 1, 1,
-0.4930882, -1.940774, -2.415966, 1, 1, 1, 1, 1,
-0.4927011, 0.6936673, -0.6233296, 1, 1, 1, 1, 1,
-0.4921406, -0.2634357, -2.448919, 1, 1, 1, 1, 1,
-0.4898099, -1.073771, -2.708935, 1, 1, 1, 1, 1,
-0.4864312, 0.7802246, 0.9125637, 0, 0, 1, 1, 1,
-0.4830163, 0.1464535, -2.944402, 1, 0, 0, 1, 1,
-0.4716547, -2.132977, -2.149415, 1, 0, 0, 1, 1,
-0.4707287, 1.441935, -0.9440756, 1, 0, 0, 1, 1,
-0.464997, 1.232804, -1.243963, 1, 0, 0, 1, 1,
-0.4603556, -0.4807895, -1.416331, 1, 0, 0, 1, 1,
-0.4601627, -1.195972, -4.291949, 0, 0, 0, 1, 1,
-0.4599091, -2.287997, -1.436494, 0, 0, 0, 1, 1,
-0.457149, 1.046442, 1.60095, 0, 0, 0, 1, 1,
-0.456788, 0.7107617, -0.06489959, 0, 0, 0, 1, 1,
-0.452461, -0.6367284, -0.4699787, 0, 0, 0, 1, 1,
-0.4523085, 0.3616691, -1.222104, 0, 0, 0, 1, 1,
-0.447176, -2.163581, -1.041735, 0, 0, 0, 1, 1,
-0.4413584, -0.6945521, -2.456483, 1, 1, 1, 1, 1,
-0.43961, 0.9362624, 0.7625062, 1, 1, 1, 1, 1,
-0.4338326, -0.9782519, -3.620164, 1, 1, 1, 1, 1,
-0.426473, 0.7505817, -2.060968, 1, 1, 1, 1, 1,
-0.4263729, -1.080893, -2.148012, 1, 1, 1, 1, 1,
-0.4235404, -0.1837398, -0.9996144, 1, 1, 1, 1, 1,
-0.4111597, -0.1203068, -1.706176, 1, 1, 1, 1, 1,
-0.410205, 1.451104, -1.18625, 1, 1, 1, 1, 1,
-0.4071061, 0.227862, -2.097544, 1, 1, 1, 1, 1,
-0.4020092, 0.610936, -0.9775449, 1, 1, 1, 1, 1,
-0.4004453, -0.3193733, -2.760453, 1, 1, 1, 1, 1,
-0.3994029, 0.6034871, 0.6965237, 1, 1, 1, 1, 1,
-0.3949461, 0.1290402, -2.663344, 1, 1, 1, 1, 1,
-0.3896959, -1.326565, -1.942269, 1, 1, 1, 1, 1,
-0.3895901, -1.697587, -3.934532, 1, 1, 1, 1, 1,
-0.386558, -0.5907954, -4.439157, 0, 0, 1, 1, 1,
-0.3853694, -0.8656986, -2.772086, 1, 0, 0, 1, 1,
-0.3852882, 0.9804963, -0.2879149, 1, 0, 0, 1, 1,
-0.3845763, -0.988524, -1.750959, 1, 0, 0, 1, 1,
-0.38269, -1.274404, -2.199174, 1, 0, 0, 1, 1,
-0.3801158, 0.3630425, -0.5357416, 1, 0, 0, 1, 1,
-0.3798546, 1.532157, 0.02860182, 0, 0, 0, 1, 1,
-0.3765311, 0.3708232, -0.8297933, 0, 0, 0, 1, 1,
-0.3690453, 1.942843, -0.075055, 0, 0, 0, 1, 1,
-0.3671991, -0.6560207, -3.726747, 0, 0, 0, 1, 1,
-0.3668079, 1.106226, 0.6758038, 0, 0, 0, 1, 1,
-0.3549151, 0.03963029, -1.865093, 0, 0, 0, 1, 1,
-0.3513952, -1.567242, -2.831309, 0, 0, 0, 1, 1,
-0.3499521, -1.012066, -3.030076, 1, 1, 1, 1, 1,
-0.348253, 0.7950593, -0.6949505, 1, 1, 1, 1, 1,
-0.3476921, 0.8235314, -0.2632801, 1, 1, 1, 1, 1,
-0.3473456, -0.3988164, -1.46068, 1, 1, 1, 1, 1,
-0.3468623, 0.4721953, 0.4856002, 1, 1, 1, 1, 1,
-0.3446614, 0.03061864, -1.248824, 1, 1, 1, 1, 1,
-0.3355098, -0.9599479, -3.036148, 1, 1, 1, 1, 1,
-0.3344645, 1.008078, 1.089764, 1, 1, 1, 1, 1,
-0.3317301, 0.2477423, -2.186027, 1, 1, 1, 1, 1,
-0.3315762, -0.8680365, -3.20418, 1, 1, 1, 1, 1,
-0.3228812, 0.639344, 0.04896436, 1, 1, 1, 1, 1,
-0.3207715, 0.5058972, -0.05982311, 1, 1, 1, 1, 1,
-0.3161133, 0.9371414, -0.01224596, 1, 1, 1, 1, 1,
-0.3150882, -0.3105219, -2.937063, 1, 1, 1, 1, 1,
-0.3135788, 1.418268, 0.4826564, 1, 1, 1, 1, 1,
-0.3094979, 0.5018485, 0.7709984, 0, 0, 1, 1, 1,
-0.309138, 0.2199867, -1.61922, 1, 0, 0, 1, 1,
-0.3072386, -0.5483899, -2.583204, 1, 0, 0, 1, 1,
-0.3059286, -0.8166136, -3.290635, 1, 0, 0, 1, 1,
-0.3054256, -0.9136398, -3.008551, 1, 0, 0, 1, 1,
-0.3034577, 0.4161533, -0.02436128, 1, 0, 0, 1, 1,
-0.3005088, -1.23742, -2.530031, 0, 0, 0, 1, 1,
-0.2999448, -2.247332, -4.756085, 0, 0, 0, 1, 1,
-0.2996849, 0.5928532, -2.250686, 0, 0, 0, 1, 1,
-0.2977522, 2.323403, 0.05888546, 0, 0, 0, 1, 1,
-0.2927242, -0.6128261, -2.865629, 0, 0, 0, 1, 1,
-0.290417, 0.1718613, -2.411072, 0, 0, 0, 1, 1,
-0.2873556, 0.5716235, 0.3063596, 0, 0, 0, 1, 1,
-0.2855004, 1.645624, -1.677944, 1, 1, 1, 1, 1,
-0.2846515, 0.2665781, 0.3582392, 1, 1, 1, 1, 1,
-0.2788785, 0.4357351, -1.330822, 1, 1, 1, 1, 1,
-0.2782314, 0.06135038, -1.729666, 1, 1, 1, 1, 1,
-0.2781421, -1.655833, -2.50059, 1, 1, 1, 1, 1,
-0.2770004, 0.2018483, -1.457803, 1, 1, 1, 1, 1,
-0.2762175, -0.4974038, -3.383347, 1, 1, 1, 1, 1,
-0.2713444, 1.692253, -0.5789418, 1, 1, 1, 1, 1,
-0.2675633, 1.282369, -0.7824416, 1, 1, 1, 1, 1,
-0.2638395, -0.8141438, -3.942426, 1, 1, 1, 1, 1,
-0.2626299, 1.662112, -0.1472698, 1, 1, 1, 1, 1,
-0.2614004, 0.5705072, -0.5233675, 1, 1, 1, 1, 1,
-0.2607288, -0.6794755, -1.191231, 1, 1, 1, 1, 1,
-0.256816, -0.500948, -1.33768, 1, 1, 1, 1, 1,
-0.2553317, 0.5019844, -1.69202, 1, 1, 1, 1, 1,
-0.2551743, -0.5773817, -5.905338, 0, 0, 1, 1, 1,
-0.2549284, -1.552846, -3.811522, 1, 0, 0, 1, 1,
-0.2527834, -0.2981989, -0.9949406, 1, 0, 0, 1, 1,
-0.2500367, 0.5987073, -1.672668, 1, 0, 0, 1, 1,
-0.2456068, -0.7105038, -2.109462, 1, 0, 0, 1, 1,
-0.2439042, -0.5607265, -4.071105, 1, 0, 0, 1, 1,
-0.2416257, 0.6327308, 1.341563, 0, 0, 0, 1, 1,
-0.2402964, 0.1960741, -0.8164551, 0, 0, 0, 1, 1,
-0.2396855, -0.6717091, -3.409622, 0, 0, 0, 1, 1,
-0.2392846, 0.193068, -0.6076615, 0, 0, 0, 1, 1,
-0.2353783, -1.044739, -1.849487, 0, 0, 0, 1, 1,
-0.2338517, -1.26748, -3.797803, 0, 0, 0, 1, 1,
-0.2316216, 0.5866662, -0.4745041, 0, 0, 0, 1, 1,
-0.2274576, 0.1463093, -0.4202485, 1, 1, 1, 1, 1,
-0.223667, 0.4971404, -0.8430391, 1, 1, 1, 1, 1,
-0.221746, -1.45434, -4.113273, 1, 1, 1, 1, 1,
-0.2206072, -0.7112457, -2.828015, 1, 1, 1, 1, 1,
-0.2193146, 0.4487356, 0.3597244, 1, 1, 1, 1, 1,
-0.2188013, -0.111444, -1.336291, 1, 1, 1, 1, 1,
-0.2170334, 0.2687992, -0.9470475, 1, 1, 1, 1, 1,
-0.2130166, 0.1260024, -1.474823, 1, 1, 1, 1, 1,
-0.2110978, -1.34364, -2.480204, 1, 1, 1, 1, 1,
-0.2070514, 1.183183, 0.2394576, 1, 1, 1, 1, 1,
-0.2067212, -0.2115802, -2.990432, 1, 1, 1, 1, 1,
-0.2032206, 1.65337, 1.409776, 1, 1, 1, 1, 1,
-0.2013618, -0.6145293, -1.549819, 1, 1, 1, 1, 1,
-0.1997649, -0.1784168, -3.999204, 1, 1, 1, 1, 1,
-0.1984285, -0.15649, -1.024213, 1, 1, 1, 1, 1,
-0.1963912, -1.589458, -1.25256, 0, 0, 1, 1, 1,
-0.1954527, 1.692168, -1.708226, 1, 0, 0, 1, 1,
-0.1953146, 0.678056, 0.6368965, 1, 0, 0, 1, 1,
-0.1938017, -0.9519399, -4.996078, 1, 0, 0, 1, 1,
-0.1899567, -2.273886, -3.355457, 1, 0, 0, 1, 1,
-0.1882706, 1.090379, -0.8982787, 1, 0, 0, 1, 1,
-0.1880401, -1.077989, -3.64985, 0, 0, 0, 1, 1,
-0.1848552, 0.6428098, -0.08645743, 0, 0, 0, 1, 1,
-0.1812508, 0.846399, -2.2583, 0, 0, 0, 1, 1,
-0.1784866, -0.8639715, -4.143604, 0, 0, 0, 1, 1,
-0.1719849, 0.3470007, -0.7499301, 0, 0, 0, 1, 1,
-0.1710952, 0.7442586, -0.831807, 0, 0, 0, 1, 1,
-0.1679991, -0.5054232, -4.943029, 0, 0, 0, 1, 1,
-0.1619771, 0.03285653, -1.518113, 1, 1, 1, 1, 1,
-0.157925, -0.1809165, -1.417237, 1, 1, 1, 1, 1,
-0.1545577, 0.1922802, -0.03847229, 1, 1, 1, 1, 1,
-0.1465952, -0.2772941, -2.303429, 1, 1, 1, 1, 1,
-0.141534, 1.18757, -1.35411, 1, 1, 1, 1, 1,
-0.1406432, -1.33476, -3.386548, 1, 1, 1, 1, 1,
-0.1387877, -0.6975911, -2.734865, 1, 1, 1, 1, 1,
-0.1348729, -0.5024645, -3.21641, 1, 1, 1, 1, 1,
-0.1298232, -0.9506814, -3.09965, 1, 1, 1, 1, 1,
-0.1217593, -0.5229224, -1.07991, 1, 1, 1, 1, 1,
-0.11758, -0.06630514, -1.580796, 1, 1, 1, 1, 1,
-0.1100555, -0.5504336, -4.488019, 1, 1, 1, 1, 1,
-0.1041442, 1.280043, 0.03819112, 1, 1, 1, 1, 1,
-0.1034797, 0.6158434, -0.9606768, 1, 1, 1, 1, 1,
-0.09958628, 1.676259, -0.597448, 1, 1, 1, 1, 1,
-0.09386355, -0.2983815, -2.972533, 0, 0, 1, 1, 1,
-0.0933792, -1.708466, -3.542918, 1, 0, 0, 1, 1,
-0.08905006, -0.2706328, -3.218086, 1, 0, 0, 1, 1,
-0.07435153, -1.24467, -2.898079, 1, 0, 0, 1, 1,
-0.07096265, 0.7802521, -1.188276, 1, 0, 0, 1, 1,
-0.07067247, 0.463676, 0.3154744, 1, 0, 0, 1, 1,
-0.07032257, 0.6688947, 0.5163073, 0, 0, 0, 1, 1,
-0.06884673, -0.02086139, -1.799187, 0, 0, 0, 1, 1,
-0.06816996, -1.735381, -1.616087, 0, 0, 0, 1, 1,
-0.06131746, 1.245011, -0.5860714, 0, 0, 0, 1, 1,
-0.05650854, -0.213463, -4.723604, 0, 0, 0, 1, 1,
-0.05593087, 0.3864938, -0.3922837, 0, 0, 0, 1, 1,
-0.05573376, -0.2024665, -3.640306, 0, 0, 0, 1, 1,
-0.0546281, -1.320596, -4.304894, 1, 1, 1, 1, 1,
-0.05098133, -0.6822276, -3.011395, 1, 1, 1, 1, 1,
-0.04718755, -0.5844603, -1.830152, 1, 1, 1, 1, 1,
-0.04697026, 1.309815, 0.5510278, 1, 1, 1, 1, 1,
-0.045822, 0.337944, -0.797166, 1, 1, 1, 1, 1,
-0.04421979, 0.6254014, -0.4169172, 1, 1, 1, 1, 1,
-0.04380266, 0.1663273, -0.2643817, 1, 1, 1, 1, 1,
-0.04375804, 2.207755, -1.341312, 1, 1, 1, 1, 1,
-0.04198582, -2.20679, -2.736853, 1, 1, 1, 1, 1,
-0.03426139, -1.343426, -2.581531, 1, 1, 1, 1, 1,
-0.03368258, 1.595396, -0.1584561, 1, 1, 1, 1, 1,
-0.03344363, 0.5826505, -1.571787, 1, 1, 1, 1, 1,
-0.03133784, -0.8495952, -1.019788, 1, 1, 1, 1, 1,
-0.02643944, 0.7092152, 0.3399588, 1, 1, 1, 1, 1,
-0.02467774, 0.326068, 0.4165251, 1, 1, 1, 1, 1,
-0.02122407, -0.6262379, -3.557017, 0, 0, 1, 1, 1,
-0.01652079, 1.314731, -1.297634, 1, 0, 0, 1, 1,
-0.01179725, -2.437629, -2.42498, 1, 0, 0, 1, 1,
-0.01059475, 0.7088931, -0.0416639, 1, 0, 0, 1, 1,
-0.008720843, 1.304618, -0.06118786, 1, 0, 0, 1, 1,
-0.007374129, -0.7628509, -3.006441, 1, 0, 0, 1, 1,
-0.006802849, -1.348677, -3.092288, 0, 0, 0, 1, 1,
-0.005135308, 0.2431032, -0.2328017, 0, 0, 0, 1, 1,
0.002337686, -1.06146, 1.747671, 0, 0, 0, 1, 1,
0.003693207, 0.9145499, -0.3946204, 0, 0, 0, 1, 1,
0.004611009, -0.01371779, 3.030392, 0, 0, 0, 1, 1,
0.0118999, 1.803998, 0.2296835, 0, 0, 0, 1, 1,
0.0150681, 0.001022492, 0.8881921, 0, 0, 0, 1, 1,
0.01530218, 1.433937, -0.6843724, 1, 1, 1, 1, 1,
0.01582785, -0.03737472, 3.778502, 1, 1, 1, 1, 1,
0.01721112, -0.6276398, 2.011332, 1, 1, 1, 1, 1,
0.02686773, 0.4012492, -0.6006312, 1, 1, 1, 1, 1,
0.02768964, 0.1514623, -0.07810394, 1, 1, 1, 1, 1,
0.02818805, 0.8861648, -0.8738682, 1, 1, 1, 1, 1,
0.02863009, 0.5503824, -1.048987, 1, 1, 1, 1, 1,
0.0312116, 0.0202436, 1.103676, 1, 1, 1, 1, 1,
0.03139525, 0.4078993, 1.063455, 1, 1, 1, 1, 1,
0.03586409, 2.256771, -0.8605787, 1, 1, 1, 1, 1,
0.03624047, -1.205875, 2.767558, 1, 1, 1, 1, 1,
0.03735722, -1.511451, 3.671548, 1, 1, 1, 1, 1,
0.03931766, -0.5679051, 2.730118, 1, 1, 1, 1, 1,
0.0417379, -1.453384, 3.782745, 1, 1, 1, 1, 1,
0.0441128, 0.2019932, 0.3196342, 1, 1, 1, 1, 1,
0.04483147, -0.9210379, 4.006439, 0, 0, 1, 1, 1,
0.04518285, -0.3930126, 4.034565, 1, 0, 0, 1, 1,
0.04680088, -0.8927789, 3.451126, 1, 0, 0, 1, 1,
0.04829173, 1.522725, -1.706517, 1, 0, 0, 1, 1,
0.04895845, 3.283715, -0.5540196, 1, 0, 0, 1, 1,
0.05372781, 0.8113107, 1.167035, 1, 0, 0, 1, 1,
0.05751991, -1.086815, 2.224328, 0, 0, 0, 1, 1,
0.06029813, -0.9132771, 1.591608, 0, 0, 0, 1, 1,
0.06079684, 1.228558, 0.921328, 0, 0, 0, 1, 1,
0.07029764, 0.03660816, -0.454466, 0, 0, 0, 1, 1,
0.07460446, 0.3279148, 0.2116407, 0, 0, 0, 1, 1,
0.07516439, 0.6620662, -0.9328102, 0, 0, 0, 1, 1,
0.07695483, -1.20876, 4.248808, 0, 0, 0, 1, 1,
0.07818954, 0.1208644, 0.3957077, 1, 1, 1, 1, 1,
0.07918216, -0.2446389, 3.911955, 1, 1, 1, 1, 1,
0.07992282, 0.8591517, 1.011097, 1, 1, 1, 1, 1,
0.08278334, -1.705847, 1.465588, 1, 1, 1, 1, 1,
0.0841113, -0.4235146, 2.769855, 1, 1, 1, 1, 1,
0.08556856, -0.9152316, 3.118998, 1, 1, 1, 1, 1,
0.09053978, 0.5624071, -0.2479349, 1, 1, 1, 1, 1,
0.09107735, -0.1233071, 3.747961, 1, 1, 1, 1, 1,
0.09128661, 0.9826764, -0.3626329, 1, 1, 1, 1, 1,
0.09330986, -0.8071843, 4.990082, 1, 1, 1, 1, 1,
0.09833524, -0.2114733, 3.296437, 1, 1, 1, 1, 1,
0.1059507, -0.8086376, 2.931356, 1, 1, 1, 1, 1,
0.1081154, -0.7765827, 3.555804, 1, 1, 1, 1, 1,
0.1085889, -0.1455051, 2.041843, 1, 1, 1, 1, 1,
0.1089215, -0.08636285, 2.832592, 1, 1, 1, 1, 1,
0.1089349, -0.06914531, 0.9996139, 0, 0, 1, 1, 1,
0.1096358, 0.1781947, 0.5581512, 1, 0, 0, 1, 1,
0.1113655, -0.654595, 1.721162, 1, 0, 0, 1, 1,
0.1120273, 0.2684364, 1.241346, 1, 0, 0, 1, 1,
0.1126962, 0.9820511, 0.02566809, 1, 0, 0, 1, 1,
0.1193092, -0.2109285, 0.7838697, 1, 0, 0, 1, 1,
0.1197516, 1.674225, -0.5706266, 0, 0, 0, 1, 1,
0.1224471, 1.883081, -0.0947933, 0, 0, 0, 1, 1,
0.1235844, 0.9607651, 1.559407, 0, 0, 0, 1, 1,
0.1282406, -0.6839936, 3.097489, 0, 0, 0, 1, 1,
0.1293539, 1.423652, -0.1830228, 0, 0, 0, 1, 1,
0.1309223, -0.3510876, 2.607707, 0, 0, 0, 1, 1,
0.1315458, 1.354847, -1.228961, 0, 0, 0, 1, 1,
0.1326556, 1.059163, 0.1011963, 1, 1, 1, 1, 1,
0.1337423, -0.5365983, 2.206307, 1, 1, 1, 1, 1,
0.1412812, -0.9330146, 2.80647, 1, 1, 1, 1, 1,
0.1425215, 0.432583, 0.5166643, 1, 1, 1, 1, 1,
0.1431987, 0.6949584, -0.2301028, 1, 1, 1, 1, 1,
0.1516172, 0.05342849, -0.3821438, 1, 1, 1, 1, 1,
0.152105, 1.034802, 0.7245787, 1, 1, 1, 1, 1,
0.1534356, -0.04531468, 1.581872, 1, 1, 1, 1, 1,
0.156922, -0.5404558, 4.05427, 1, 1, 1, 1, 1,
0.157592, 1.609054, 0.561942, 1, 1, 1, 1, 1,
0.1634606, -0.3407755, 3.349552, 1, 1, 1, 1, 1,
0.1641132, -0.1432682, 2.601148, 1, 1, 1, 1, 1,
0.1677968, -0.9776167, 2.720547, 1, 1, 1, 1, 1,
0.1689663, 0.9144671, 0.981508, 1, 1, 1, 1, 1,
0.1703207, -1.549452, 2.756405, 1, 1, 1, 1, 1,
0.1705403, 1.395236, -1.343686, 0, 0, 1, 1, 1,
0.1750958, -0.5336156, 1.958474, 1, 0, 0, 1, 1,
0.1806746, -0.2960404, 2.866994, 1, 0, 0, 1, 1,
0.183694, 3.786756, 0.4203502, 1, 0, 0, 1, 1,
0.184035, -1.424129, 3.173499, 1, 0, 0, 1, 1,
0.1868453, -0.4528553, 2.554953, 1, 0, 0, 1, 1,
0.1888767, 0.1477024, -0.4618958, 0, 0, 0, 1, 1,
0.1899396, -0.5272971, 3.92511, 0, 0, 0, 1, 1,
0.1902407, -1.755682, 2.096627, 0, 0, 0, 1, 1,
0.1966272, 0.0274462, 2.772238, 0, 0, 0, 1, 1,
0.1977532, 0.08464483, 2.203445, 0, 0, 0, 1, 1,
0.1990367, 0.1885801, 0.6224701, 0, 0, 0, 1, 1,
0.2043554, -0.892153, 3.873394, 0, 0, 0, 1, 1,
0.2077023, 0.2949592, 0.2845453, 1, 1, 1, 1, 1,
0.2089959, -0.9811859, 3.327425, 1, 1, 1, 1, 1,
0.2160414, -0.2828232, 2.253334, 1, 1, 1, 1, 1,
0.2199598, 0.48904, 0.5114844, 1, 1, 1, 1, 1,
0.2209631, -1.107249, 3.780348, 1, 1, 1, 1, 1,
0.2244367, 2.236235, -1.488843, 1, 1, 1, 1, 1,
0.2265389, -0.7951586, 1.254971, 1, 1, 1, 1, 1,
0.2266391, -0.5200291, 5.327478, 1, 1, 1, 1, 1,
0.2299812, -0.03625002, 1.209489, 1, 1, 1, 1, 1,
0.2309282, -0.1887506, 1.93566, 1, 1, 1, 1, 1,
0.2318812, 1.354546, -1.53808, 1, 1, 1, 1, 1,
0.2330372, -0.0738395, 2.317619, 1, 1, 1, 1, 1,
0.2335622, -0.7498041, 3.960148, 1, 1, 1, 1, 1,
0.2357501, 0.1872286, 2.69357, 1, 1, 1, 1, 1,
0.236014, 1.779712, 1.14148, 1, 1, 1, 1, 1,
0.2367669, -1.492188, 5.930429, 0, 0, 1, 1, 1,
0.2403005, -0.8097478, 2.632845, 1, 0, 0, 1, 1,
0.24056, -0.2563144, 3.551758, 1, 0, 0, 1, 1,
0.2435433, 0.2338835, -0.07109078, 1, 0, 0, 1, 1,
0.2490518, 1.237547, -2.030872, 1, 0, 0, 1, 1,
0.2557849, -0.5602766, 5.117363, 1, 0, 0, 1, 1,
0.2563629, -0.479221, 3.030119, 0, 0, 0, 1, 1,
0.2567341, 0.08630926, 1.716932, 0, 0, 0, 1, 1,
0.2635518, -0.9963179, 3.781833, 0, 0, 0, 1, 1,
0.264988, 0.09594225, 1.427576, 0, 0, 0, 1, 1,
0.2744932, -0.9400465, 3.970389, 0, 0, 0, 1, 1,
0.276535, -1.15604, 3.38502, 0, 0, 0, 1, 1,
0.2790092, 0.1551196, 2.607898, 0, 0, 0, 1, 1,
0.2828789, -0.9652274, 1.65459, 1, 1, 1, 1, 1,
0.2849509, -1.321177, 3.463626, 1, 1, 1, 1, 1,
0.284993, -0.3812584, 3.28815, 1, 1, 1, 1, 1,
0.2870854, 1.593909, -1.162262, 1, 1, 1, 1, 1,
0.2896276, 0.3310843, 0.2899246, 1, 1, 1, 1, 1,
0.2924437, 0.04299468, -0.1342945, 1, 1, 1, 1, 1,
0.2940916, -0.8768079, 2.234849, 1, 1, 1, 1, 1,
0.2964521, -0.4505475, 2.017009, 1, 1, 1, 1, 1,
0.2986134, 0.01077068, 0.5358917, 1, 1, 1, 1, 1,
0.3022061, 0.2537716, 2.187758, 1, 1, 1, 1, 1,
0.3042914, -1.064963, 2.698943, 1, 1, 1, 1, 1,
0.3114092, 4.585501, -0.03661933, 1, 1, 1, 1, 1,
0.3146114, 0.382017, -1.77312, 1, 1, 1, 1, 1,
0.3193246, -0.3739614, 0.7112199, 1, 1, 1, 1, 1,
0.3255768, 1.31161, 0.6639106, 1, 1, 1, 1, 1,
0.3315018, 0.3296117, 0.4526097, 0, 0, 1, 1, 1,
0.3315142, 0.7667419, -0.8031581, 1, 0, 0, 1, 1,
0.3333897, 0.50157, -0.1863226, 1, 0, 0, 1, 1,
0.3338154, -1.217854, 4.527754, 1, 0, 0, 1, 1,
0.3346239, -0.7686676, 3.302344, 1, 0, 0, 1, 1,
0.3428172, 0.8145683, -0.1313798, 1, 0, 0, 1, 1,
0.3444043, -1.441422, 5.250502, 0, 0, 0, 1, 1,
0.3465129, 1.124548, 0.4540499, 0, 0, 0, 1, 1,
0.3472317, 2.279004, 0.1650326, 0, 0, 0, 1, 1,
0.3475244, 1.048981, 0.4561546, 0, 0, 0, 1, 1,
0.3515511, 2.165941, -0.3936208, 0, 0, 0, 1, 1,
0.3525285, 2.470934, -0.6596736, 0, 0, 0, 1, 1,
0.3567096, -1.114117, 4.622349, 0, 0, 0, 1, 1,
0.3569947, 0.4339566, 1.820916, 1, 1, 1, 1, 1,
0.3577088, -1.026862, 0.6698706, 1, 1, 1, 1, 1,
0.358599, 0.31217, 0.5663247, 1, 1, 1, 1, 1,
0.363649, -0.3182106, 1.566647, 1, 1, 1, 1, 1,
0.3643235, 1.835275, -0.3509109, 1, 1, 1, 1, 1,
0.3759651, 0.8433169, 1.731015, 1, 1, 1, 1, 1,
0.3797336, -1.197775, 2.68364, 1, 1, 1, 1, 1,
0.3801834, 0.1044298, 2.593664, 1, 1, 1, 1, 1,
0.3823829, -1.51297, 3.54115, 1, 1, 1, 1, 1,
0.3879652, -1.820846, 3.589713, 1, 1, 1, 1, 1,
0.3884522, -0.6710863, 3.894805, 1, 1, 1, 1, 1,
0.3892495, 0.9531465, -1.112833, 1, 1, 1, 1, 1,
0.3894429, 0.1982037, 2.72921, 1, 1, 1, 1, 1,
0.3902108, -0.845721, 3.07179, 1, 1, 1, 1, 1,
0.39048, -2.477256, 2.385032, 1, 1, 1, 1, 1,
0.3912429, 1.1696, 2.147698, 0, 0, 1, 1, 1,
0.3928489, 0.6267428, 0.7245104, 1, 0, 0, 1, 1,
0.3986377, -1.278086, 5.058899, 1, 0, 0, 1, 1,
0.3996277, -0.7890689, 4.31973, 1, 0, 0, 1, 1,
0.4004297, -1.167161, 2.046811, 1, 0, 0, 1, 1,
0.4069493, 0.8517756, -0.6210726, 1, 0, 0, 1, 1,
0.4071297, -0.6451383, 2.419421, 0, 0, 0, 1, 1,
0.4071713, 0.2733627, 0.737221, 0, 0, 0, 1, 1,
0.4103014, 1.812834, -0.3173772, 0, 0, 0, 1, 1,
0.4120721, -0.1996021, 1.167064, 0, 0, 0, 1, 1,
0.4141063, 0.6491213, -0.8787576, 0, 0, 0, 1, 1,
0.4157588, 0.2623511, 0.4642285, 0, 0, 0, 1, 1,
0.4160063, 0.6646724, 0.9883564, 0, 0, 0, 1, 1,
0.4177787, 0.9035413, -0.3700131, 1, 1, 1, 1, 1,
0.4220061, 0.7634392, -1.009012, 1, 1, 1, 1, 1,
0.4304828, -0.5891884, 1.699241, 1, 1, 1, 1, 1,
0.4320658, 0.5145149, 0.8869328, 1, 1, 1, 1, 1,
0.4356698, -1.206232, 2.706276, 1, 1, 1, 1, 1,
0.4415898, -0.495238, 1.821975, 1, 1, 1, 1, 1,
0.4433871, -0.39811, 3.170012, 1, 1, 1, 1, 1,
0.4460922, -0.405596, 2.974843, 1, 1, 1, 1, 1,
0.447014, -0.5035215, 3.421702, 1, 1, 1, 1, 1,
0.4481558, 1.187906, 0.1965781, 1, 1, 1, 1, 1,
0.4515249, -1.272369, 2.312526, 1, 1, 1, 1, 1,
0.4547646, -0.1333889, 1.899405, 1, 1, 1, 1, 1,
0.4556365, 0.5098467, 0.7364942, 1, 1, 1, 1, 1,
0.4578261, -0.8046942, 2.252946, 1, 1, 1, 1, 1,
0.460389, 1.099682, -0.7316081, 1, 1, 1, 1, 1,
0.4646541, -2.3418, 3.534261, 0, 0, 1, 1, 1,
0.4651452, -0.3381522, 3.083, 1, 0, 0, 1, 1,
0.46742, 0.6707228, 0.5217856, 1, 0, 0, 1, 1,
0.4686917, -0.6732913, 4.6515, 1, 0, 0, 1, 1,
0.4704736, -0.2890583, 1.267279, 1, 0, 0, 1, 1,
0.4723395, 0.7105155, 0.3244797, 1, 0, 0, 1, 1,
0.4724175, 1.255562, 0.6371953, 0, 0, 0, 1, 1,
0.4773072, -1.121067, 2.984442, 0, 0, 0, 1, 1,
0.4794816, -1.763154, 2.690994, 0, 0, 0, 1, 1,
0.4835479, 0.3907872, 1.759383, 0, 0, 0, 1, 1,
0.4867477, -0.4995509, 0.7802938, 0, 0, 0, 1, 1,
0.4884145, -0.7296788, 1.548688, 0, 0, 0, 1, 1,
0.4893059, -0.868294, 1.284949, 0, 0, 0, 1, 1,
0.4894048, 0.558328, 1.329382, 1, 1, 1, 1, 1,
0.4898642, 1.513113, 0.3987646, 1, 1, 1, 1, 1,
0.494303, 1.513079, 1.24127, 1, 1, 1, 1, 1,
0.4943488, -0.0708096, 0.7925705, 1, 1, 1, 1, 1,
0.4960353, -1.002712, 3.329406, 1, 1, 1, 1, 1,
0.4980643, -0.4628693, 0.7266867, 1, 1, 1, 1, 1,
0.5002685, 0.3908149, 2.158602, 1, 1, 1, 1, 1,
0.5084746, 0.6846104, 1.351192, 1, 1, 1, 1, 1,
0.5084981, 0.01593284, 1.459399, 1, 1, 1, 1, 1,
0.5087822, -0.4773241, 1.471182, 1, 1, 1, 1, 1,
0.5107344, 0.05951191, 1.999812, 1, 1, 1, 1, 1,
0.5174683, -0.3068033, -0.06978475, 1, 1, 1, 1, 1,
0.5184932, -0.5129004, 4.231805, 1, 1, 1, 1, 1,
0.5200914, -1.586331, 4.865123, 1, 1, 1, 1, 1,
0.5285375, -0.590247, 0.3787345, 1, 1, 1, 1, 1,
0.5289533, -1.145513, 2.587436, 0, 0, 1, 1, 1,
0.5291368, 1.188914, 1.392765, 1, 0, 0, 1, 1,
0.5331461, -0.3843845, 0.4253638, 1, 0, 0, 1, 1,
0.5367046, -1.69293, 5.258992, 1, 0, 0, 1, 1,
0.5382102, -1.117233, 4.318836, 1, 0, 0, 1, 1,
0.5386818, 0.4043767, 1.986977, 1, 0, 0, 1, 1,
0.5445744, -0.5219048, 2.887734, 0, 0, 0, 1, 1,
0.5468129, -0.1892255, 0.8256714, 0, 0, 0, 1, 1,
0.5482748, -0.003303295, 1.448308, 0, 0, 0, 1, 1,
0.5502965, -0.832974, 2.777708, 0, 0, 0, 1, 1,
0.5584379, 1.114271, 1.056062, 0, 0, 0, 1, 1,
0.5616887, -1.071539, 0.1692501, 0, 0, 0, 1, 1,
0.5622533, -1.366743, 2.118972, 0, 0, 0, 1, 1,
0.5659989, -1.516117, 3.75293, 1, 1, 1, 1, 1,
0.5660949, 0.7417613, -0.2640633, 1, 1, 1, 1, 1,
0.5666227, -0.3747249, 3.336471, 1, 1, 1, 1, 1,
0.5710801, -0.3497245, 1.05447, 1, 1, 1, 1, 1,
0.5788541, 0.9777247, 2.467949, 1, 1, 1, 1, 1,
0.5800901, 0.7572623, -1.459852, 1, 1, 1, 1, 1,
0.5833212, -0.377341, -0.2294629, 1, 1, 1, 1, 1,
0.588906, -1.353397, 2.745307, 1, 1, 1, 1, 1,
0.5899175, 0.1980654, 1.876645, 1, 1, 1, 1, 1,
0.594049, 0.05510528, 1.626271, 1, 1, 1, 1, 1,
0.6007199, -0.1907546, 2.042415, 1, 1, 1, 1, 1,
0.6046489, 1.063078, 1.658456, 1, 1, 1, 1, 1,
0.60808, 0.8366185, 0.9076185, 1, 1, 1, 1, 1,
0.6102656, -0.5125936, 2.719273, 1, 1, 1, 1, 1,
0.6124982, -1.603578, 4.911619, 1, 1, 1, 1, 1,
0.6125195, -0.5247864, 4.423888, 0, 0, 1, 1, 1,
0.6147671, 0.003041936, 2.450876, 1, 0, 0, 1, 1,
0.6152041, 0.5431987, 2.118336, 1, 0, 0, 1, 1,
0.6204295, -0.1681354, 2.086236, 1, 0, 0, 1, 1,
0.621572, 0.04698402, 0.9281204, 1, 0, 0, 1, 1,
0.6224856, 0.4052232, 1.90781, 1, 0, 0, 1, 1,
0.6248116, 0.684434, -0.5656414, 0, 0, 0, 1, 1,
0.6310552, 0.3314546, 1.532907, 0, 0, 0, 1, 1,
0.6314422, 0.9597946, 1.612409, 0, 0, 0, 1, 1,
0.633867, -0.6813596, 1.162871, 0, 0, 0, 1, 1,
0.6361553, -0.9441572, 3.792957, 0, 0, 0, 1, 1,
0.6362113, 0.4087707, 0.2936222, 0, 0, 0, 1, 1,
0.6380818, -0.3829701, 0.1345688, 0, 0, 0, 1, 1,
0.6389314, -0.2463408, 2.766083, 1, 1, 1, 1, 1,
0.6482062, -1.08783, 2.307423, 1, 1, 1, 1, 1,
0.6553634, 0.1283439, 2.563835, 1, 1, 1, 1, 1,
0.6563548, 0.5152537, 1.300164, 1, 1, 1, 1, 1,
0.6593235, -1.033082, 3.978776, 1, 1, 1, 1, 1,
0.6629037, 0.3991415, 0.7952135, 1, 1, 1, 1, 1,
0.6630076, 1.361409, 1.002802, 1, 1, 1, 1, 1,
0.6642911, -1.926868, 2.206789, 1, 1, 1, 1, 1,
0.6670234, 0.7462374, 1.166427, 1, 1, 1, 1, 1,
0.6797641, 1.388207, 0.4337607, 1, 1, 1, 1, 1,
0.680141, -0.37199, 3.331444, 1, 1, 1, 1, 1,
0.6817223, 0.6038166, -0.1382724, 1, 1, 1, 1, 1,
0.6843112, 1.023365, 0.4024737, 1, 1, 1, 1, 1,
0.684538, 0.006219504, 1.626915, 1, 1, 1, 1, 1,
0.6869445, -0.2781273, 0.3608254, 1, 1, 1, 1, 1,
0.6912103, -0.6554251, 3.624542, 0, 0, 1, 1, 1,
0.6917546, 0.03333309, 3.08223, 1, 0, 0, 1, 1,
0.6919854, -0.8536727, 2.994458, 1, 0, 0, 1, 1,
0.6933271, -0.4033917, 2.528305, 1, 0, 0, 1, 1,
0.6993691, 1.829238, -0.1125109, 1, 0, 0, 1, 1,
0.7017828, 0.233333, 3.115237, 1, 0, 0, 1, 1,
0.7077388, -1.364684, 1.702631, 0, 0, 0, 1, 1,
0.7114595, 0.3247181, 2.858679, 0, 0, 0, 1, 1,
0.7140669, -0.9849652, 2.76356, 0, 0, 0, 1, 1,
0.7164953, 0.7330991, 0.7063352, 0, 0, 0, 1, 1,
0.7179288, -0.7243413, 2.964482, 0, 0, 0, 1, 1,
0.7207625, 0.162317, 1.966311, 0, 0, 0, 1, 1,
0.722779, 0.4293991, 0.9606152, 0, 0, 0, 1, 1,
0.7371493, -1.116791, 3.047287, 1, 1, 1, 1, 1,
0.7383748, -0.4971028, 1.154871, 1, 1, 1, 1, 1,
0.7478226, 0.8884116, -1.074552, 1, 1, 1, 1, 1,
0.7496207, 0.1216608, -1.161471, 1, 1, 1, 1, 1,
0.7547693, -0.9537802, 3.302097, 1, 1, 1, 1, 1,
0.7587844, 0.175916, 2.634074, 1, 1, 1, 1, 1,
0.7659868, 0.006201005, 3.14378, 1, 1, 1, 1, 1,
0.7662844, 0.280633, 1.274773, 1, 1, 1, 1, 1,
0.7709412, 0.347369, 0.05965907, 1, 1, 1, 1, 1,
0.7712526, 0.3436185, 0.3064847, 1, 1, 1, 1, 1,
0.7741759, 0.3191268, 0.6127213, 1, 1, 1, 1, 1,
0.7768912, -0.2963327, 2.323458, 1, 1, 1, 1, 1,
0.7790644, -1.211658, 3.980964, 1, 1, 1, 1, 1,
0.7794986, 0.3229336, -0.9103293, 1, 1, 1, 1, 1,
0.7835395, -1.060657, 1.446064, 1, 1, 1, 1, 1,
0.7854722, -0.1682671, 2.358734, 0, 0, 1, 1, 1,
0.7932541, -0.2653502, 2.110477, 1, 0, 0, 1, 1,
0.7937864, 0.312058, 0.9354811, 1, 0, 0, 1, 1,
0.798983, 0.4946582, 1.255377, 1, 0, 0, 1, 1,
0.802882, -0.3899965, 0.08852622, 1, 0, 0, 1, 1,
0.8034582, -2.528432, 2.267964, 1, 0, 0, 1, 1,
0.8039929, 0.4231493, 2.082526, 0, 0, 0, 1, 1,
0.8043954, 1.085415, 1.64857, 0, 0, 0, 1, 1,
0.8120199, 0.9104385, -0.1698109, 0, 0, 0, 1, 1,
0.8168803, -1.079775, 0.6864243, 0, 0, 0, 1, 1,
0.8286489, 0.9881772, 1.480801, 0, 0, 0, 1, 1,
0.8332859, 0.2758387, 2.061503, 0, 0, 0, 1, 1,
0.8343295, 0.677924, 0.3692586, 0, 0, 0, 1, 1,
0.8385906, -1.395057, 2.412556, 1, 1, 1, 1, 1,
0.8441256, -0.979665, 2.27685, 1, 1, 1, 1, 1,
0.8517184, -1.508067, 3.307791, 1, 1, 1, 1, 1,
0.8568329, 0.447155, 3.779702, 1, 1, 1, 1, 1,
0.8570319, 0.052763, 0.9748701, 1, 1, 1, 1, 1,
0.8574607, 0.8726639, -0.8731446, 1, 1, 1, 1, 1,
0.8583387, -1.117587, 3.023832, 1, 1, 1, 1, 1,
0.8619167, -0.6017926, 0.9554474, 1, 1, 1, 1, 1,
0.8696079, -0.8027064, 1.207301, 1, 1, 1, 1, 1,
0.8716035, 0.9294602, -0.55451, 1, 1, 1, 1, 1,
0.8735747, -0.08081704, 1.220035, 1, 1, 1, 1, 1,
0.8805993, 0.9311434, 1.716624, 1, 1, 1, 1, 1,
0.887686, -0.2612552, 1.579866, 1, 1, 1, 1, 1,
0.8948454, 0.2938504, 1.368959, 1, 1, 1, 1, 1,
0.898902, -0.2914567, 3.094128, 1, 1, 1, 1, 1,
0.9018729, -0.01365468, 2.61256, 0, 0, 1, 1, 1,
0.9029313, 2.031509, 0.9155361, 1, 0, 0, 1, 1,
0.9077895, 0.8430165, -0.264395, 1, 0, 0, 1, 1,
0.9129556, 1.082622, -0.0668834, 1, 0, 0, 1, 1,
0.9152536, 1.020172, -0.209116, 1, 0, 0, 1, 1,
0.9259282, 0.08991307, 1.207822, 1, 0, 0, 1, 1,
0.9273065, -0.8922492, 1.395495, 0, 0, 0, 1, 1,
0.9289912, -0.1620981, 2.912879, 0, 0, 0, 1, 1,
0.9403988, -0.0078928, 1.965659, 0, 0, 0, 1, 1,
0.9407113, 0.8591948, 0.8844329, 0, 0, 0, 1, 1,
0.9428186, -0.01100438, 2.623505, 0, 0, 0, 1, 1,
0.9462791, -0.4129951, 0.5556744, 0, 0, 0, 1, 1,
0.9550283, 0.5876853, 0.9026811, 0, 0, 0, 1, 1,
0.9553077, -0.230748, 2.690974, 1, 1, 1, 1, 1,
0.9579552, 0.1230153, 3.38205, 1, 1, 1, 1, 1,
0.9589922, 1.593855, 0.5335654, 1, 1, 1, 1, 1,
0.9617152, 1.722014, 1.772968, 1, 1, 1, 1, 1,
0.9653118, 0.7550048, 1.198776, 1, 1, 1, 1, 1,
0.971953, 0.09993199, 1.850239, 1, 1, 1, 1, 1,
0.9734095, 0.4605777, 0.5489767, 1, 1, 1, 1, 1,
0.9807467, -0.9207414, 2.100322, 1, 1, 1, 1, 1,
0.9836295, 0.1865219, -0.8363414, 1, 1, 1, 1, 1,
0.9870104, -1.289728, 3.040844, 1, 1, 1, 1, 1,
0.9901836, -0.09438424, 0.4179264, 1, 1, 1, 1, 1,
0.9912375, -0.1489604, 2.370603, 1, 1, 1, 1, 1,
0.9974231, -0.5971234, 1.743127, 1, 1, 1, 1, 1,
0.9989428, 0.3127126, 2.511078, 1, 1, 1, 1, 1,
1.004163, -1.013141, 1.79186, 1, 1, 1, 1, 1,
1.004274, -1.250508, -0.2379432, 0, 0, 1, 1, 1,
1.011143, 2.686473, 0.09038687, 1, 0, 0, 1, 1,
1.018553, -1.195339, 1.877932, 1, 0, 0, 1, 1,
1.020052, -0.9640006, 1.854295, 1, 0, 0, 1, 1,
1.031127, -0.01838, 1.593375, 1, 0, 0, 1, 1,
1.031319, 2.568185, 1.246792, 1, 0, 0, 1, 1,
1.033978, -1.320421, 3.085546, 0, 0, 0, 1, 1,
1.035259, 1.803607, 0.107705, 0, 0, 0, 1, 1,
1.047803, 1.684537, -0.2441193, 0, 0, 0, 1, 1,
1.053341, -0.2717343, 2.614736, 0, 0, 0, 1, 1,
1.058214, 0.4573221, 1.321349, 0, 0, 0, 1, 1,
1.059223, 0.2891173, 0.05553152, 0, 0, 0, 1, 1,
1.062618, -0.1658071, 1.644968, 0, 0, 0, 1, 1,
1.06931, -1.167049, 3.298912, 1, 1, 1, 1, 1,
1.074229, 0.4159839, 0.2751597, 1, 1, 1, 1, 1,
1.082511, 1.377845, 2.612914, 1, 1, 1, 1, 1,
1.084572, 0.007224943, 1.007041, 1, 1, 1, 1, 1,
1.089153, 2.494358, -0.5889972, 1, 1, 1, 1, 1,
1.09763, 1.059273, -0.1115486, 1, 1, 1, 1, 1,
1.099587, 0.5304211, 0.7388731, 1, 1, 1, 1, 1,
1.112374, 1.510364, 0.8833682, 1, 1, 1, 1, 1,
1.112911, 0.5136729, 2.832189, 1, 1, 1, 1, 1,
1.116505, 1.731172, 1.251919, 1, 1, 1, 1, 1,
1.120568, 0.3174684, 2.296834, 1, 1, 1, 1, 1,
1.136033, 0.4033436, 1.583414, 1, 1, 1, 1, 1,
1.139846, 2.138056, 0.9555774, 1, 1, 1, 1, 1,
1.141781, -0.0185569, 0.6384512, 1, 1, 1, 1, 1,
1.141878, 0.1517826, -0.6934537, 1, 1, 1, 1, 1,
1.142976, -1.341624, 2.868566, 0, 0, 1, 1, 1,
1.145175, -0.2003182, 1.314645, 1, 0, 0, 1, 1,
1.145753, 0.1482056, 1.408325, 1, 0, 0, 1, 1,
1.145907, -0.9967816, 2.996994, 1, 0, 0, 1, 1,
1.147908, -1.076885, 3.238545, 1, 0, 0, 1, 1,
1.15937, 0.3267323, 1.563678, 1, 0, 0, 1, 1,
1.159571, 1.331468, 0.4885119, 0, 0, 0, 1, 1,
1.173351, 0.3979279, 0.5642176, 0, 0, 0, 1, 1,
1.177729, 0.2141618, 1.657474, 0, 0, 0, 1, 1,
1.189996, 3.147643, 0.40591, 0, 0, 0, 1, 1,
1.195769, -1.211683, 1.904137, 0, 0, 0, 1, 1,
1.208768, 0.7663573, 1.292179, 0, 0, 0, 1, 1,
1.219405, -1.735435, 3.621697, 0, 0, 0, 1, 1,
1.223269, -0.908361, 2.478822, 1, 1, 1, 1, 1,
1.239758, 1.688367, 0.9720912, 1, 1, 1, 1, 1,
1.243023, 0.6715699, 1.456906, 1, 1, 1, 1, 1,
1.248194, -1.019986, 3.077125, 1, 1, 1, 1, 1,
1.265117, -0.1692373, 2.602528, 1, 1, 1, 1, 1,
1.276428, -0.04951654, 2.964711, 1, 1, 1, 1, 1,
1.295164, 0.6086451, 2.259439, 1, 1, 1, 1, 1,
1.302723, 0.346306, 1.90151, 1, 1, 1, 1, 1,
1.305899, -0.9610695, 1.676958, 1, 1, 1, 1, 1,
1.30796, -1.278415, 2.983897, 1, 1, 1, 1, 1,
1.324666, -0.9435573, 2.296254, 1, 1, 1, 1, 1,
1.325158, -1.063312, 1.944007, 1, 1, 1, 1, 1,
1.376185, 0.7519004, 1.430221, 1, 1, 1, 1, 1,
1.393456, 0.4123822, 2.143455, 1, 1, 1, 1, 1,
1.401417, -1.019719, 1.938076, 1, 1, 1, 1, 1,
1.403136, 1.321128, -0.2403663, 0, 0, 1, 1, 1,
1.414288, -0.2783592, 2.029427, 1, 0, 0, 1, 1,
1.420001, -1.386804, 4.456235, 1, 0, 0, 1, 1,
1.424892, 0.8240106, 0.08278742, 1, 0, 0, 1, 1,
1.43545, 0.487679, 1.677059, 1, 0, 0, 1, 1,
1.460217, -1.816086, 2.101195, 1, 0, 0, 1, 1,
1.46244, 0.5892578, 1.89513, 0, 0, 0, 1, 1,
1.465211, -1.627285, 2.513782, 0, 0, 0, 1, 1,
1.467842, 1.338247, 1.650021, 0, 0, 0, 1, 1,
1.473691, 0.4247481, 1.791453, 0, 0, 0, 1, 1,
1.477392, -1.189021, 4.192579, 0, 0, 0, 1, 1,
1.485166, -1.346811, 2.08347, 0, 0, 0, 1, 1,
1.487896, 0.6836987, 0.9528373, 0, 0, 0, 1, 1,
1.489719, 1.051794, 1.134607, 1, 1, 1, 1, 1,
1.508837, 1.064063, 2.354352, 1, 1, 1, 1, 1,
1.539989, 0.4041553, 3.123866, 1, 1, 1, 1, 1,
1.542241, 0.3209277, 0.5073422, 1, 1, 1, 1, 1,
1.549243, 0.5003489, -1.088682, 1, 1, 1, 1, 1,
1.559373, 1.884493, 2.160866, 1, 1, 1, 1, 1,
1.567624, 0.119777, 2.054099, 1, 1, 1, 1, 1,
1.572549, -0.007158424, 2.650082, 1, 1, 1, 1, 1,
1.586178, -0.3786146, 2.173787, 1, 1, 1, 1, 1,
1.593768, -0.2979023, 1.64849, 1, 1, 1, 1, 1,
1.608866, 0.9980573, 2.748602, 1, 1, 1, 1, 1,
1.609538, -0.777883, 2.130476, 1, 1, 1, 1, 1,
1.609867, -1.088754, 3.034027, 1, 1, 1, 1, 1,
1.613661, 2.119738, -0.6377792, 1, 1, 1, 1, 1,
1.615741, 0.1526177, 0.6887614, 1, 1, 1, 1, 1,
1.627351, 0.7178639, 0.008253716, 0, 0, 1, 1, 1,
1.650669, -0.08684356, 2.223985, 1, 0, 0, 1, 1,
1.676976, -1.669204, 2.934331, 1, 0, 0, 1, 1,
1.678885, 0.123636, 1.165526, 1, 0, 0, 1, 1,
1.679151, 0.2821152, 0.9328963, 1, 0, 0, 1, 1,
1.688532, 1.463316, -0.008370735, 1, 0, 0, 1, 1,
1.698898, -2.141927, 1.770498, 0, 0, 0, 1, 1,
1.741026, -0.8830411, 3.121332, 0, 0, 0, 1, 1,
1.74139, 0.3027386, -0.1303242, 0, 0, 0, 1, 1,
1.750761, -0.341439, 3.627908, 0, 0, 0, 1, 1,
1.75613, -0.1481575, 1.580615, 0, 0, 0, 1, 1,
1.764005, -2.27979, 0.1835005, 0, 0, 0, 1, 1,
1.778721, -0.226649, 2.199354, 0, 0, 0, 1, 1,
1.783076, 0.4077665, 1.276578, 1, 1, 1, 1, 1,
1.786626, -0.7882566, 1.392563, 1, 1, 1, 1, 1,
1.804522, -0.002342572, 1.091703, 1, 1, 1, 1, 1,
1.826608, 0.05970228, -0.424606, 1, 1, 1, 1, 1,
1.833151, 2.44904, -0.8971053, 1, 1, 1, 1, 1,
1.858406, -1.076355, 1.609549, 1, 1, 1, 1, 1,
1.874997, -0.4731585, 2.20958, 1, 1, 1, 1, 1,
1.880383, 0.7041003, 0.4697485, 1, 1, 1, 1, 1,
1.891365, 0.7157769, 0.3517395, 1, 1, 1, 1, 1,
1.906552, -1.351034, 3.663931, 1, 1, 1, 1, 1,
1.907691, -1.050747, 1.618276, 1, 1, 1, 1, 1,
1.919576, 0.8561499, 2.515979, 1, 1, 1, 1, 1,
1.927944, -0.6755107, 1.886228, 1, 1, 1, 1, 1,
1.991245, 0.1602708, 2.408174, 1, 1, 1, 1, 1,
2.041575, -1.015827, 2.922276, 1, 1, 1, 1, 1,
2.073938, 0.3116192, 2.587481, 0, 0, 1, 1, 1,
2.083558, 0.5841891, 1.950028, 1, 0, 0, 1, 1,
2.177826, -0.3285393, 4.141606, 1, 0, 0, 1, 1,
2.183375, 0.1665342, 0.06739887, 1, 0, 0, 1, 1,
2.19039, 0.3511473, 1.035637, 1, 0, 0, 1, 1,
2.191642, 1.223893, 0.4553283, 1, 0, 0, 1, 1,
2.19179, -1.486154, 2.679938, 0, 0, 0, 1, 1,
2.215632, 2.151512, 0.8771662, 0, 0, 0, 1, 1,
2.216073, -1.367981, 2.914761, 0, 0, 0, 1, 1,
2.230658, 1.719385, 1.35311, 0, 0, 0, 1, 1,
2.273044, 0.3515188, 1.287209, 0, 0, 0, 1, 1,
2.288719, -0.42801, 2.425788, 0, 0, 0, 1, 1,
2.301925, 0.7081336, 0.4884841, 0, 0, 0, 1, 1,
2.319105, 0.847096, 1.101669, 1, 1, 1, 1, 1,
2.37172, -0.5882928, 1.408489, 1, 1, 1, 1, 1,
2.424084, 0.04232306, 1.580594, 1, 1, 1, 1, 1,
2.427474, 0.3481071, 0.742453, 1, 1, 1, 1, 1,
2.525593, 1.94183, 1.706575, 1, 1, 1, 1, 1,
2.579938, 0.8926998, -0.42609, 1, 1, 1, 1, 1,
2.81376, -1.696705, 1.621287, 1, 1, 1, 1, 1
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
var radius = 10.05518;
var distance = 35.31839;
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
mvMatrix.translate( -0.02992058, -0.9611481, -0.01254582 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.31839);
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
