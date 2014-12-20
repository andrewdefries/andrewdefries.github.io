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
-3.682176, -0.7046151, -2.931717, 1, 0, 0, 1,
-3.211432, -0.06386273, -2.08082, 1, 0.007843138, 0, 1,
-2.907699, 1.059461, -0.08673521, 1, 0.01176471, 0, 1,
-2.741519, 1.326432, 0.7058066, 1, 0.01960784, 0, 1,
-2.726598, 0.2708564, -0.5019705, 1, 0.02352941, 0, 1,
-2.48371, 0.9827175, -1.131138, 1, 0.03137255, 0, 1,
-2.481384, -0.8481374, 0.3648929, 1, 0.03529412, 0, 1,
-2.459879, -0.3348413, -1.165052, 1, 0.04313726, 0, 1,
-2.413532, -1.71347, -3.578057, 1, 0.04705882, 0, 1,
-2.309129, -1.530784, -2.817218, 1, 0.05490196, 0, 1,
-2.247974, -0.08616057, -2.211015, 1, 0.05882353, 0, 1,
-2.215417, 0.06346043, -0.9750086, 1, 0.06666667, 0, 1,
-2.198859, 1.486827, -0.9919732, 1, 0.07058824, 0, 1,
-2.187002, 0.4412456, -0.4557258, 1, 0.07843138, 0, 1,
-2.176601, 1.326416, -0.3244928, 1, 0.08235294, 0, 1,
-2.144678, 1.081149, -3.411574, 1, 0.09019608, 0, 1,
-2.144429, -0.3772537, -2.797633, 1, 0.09411765, 0, 1,
-2.11867, -1.584993, -3.258902, 1, 0.1019608, 0, 1,
-2.11669, -0.27528, -1.608641, 1, 0.1098039, 0, 1,
-2.111332, -0.629741, -1.801964, 1, 0.1137255, 0, 1,
-2.103923, 0.3051511, -3.429622, 1, 0.1215686, 0, 1,
-2.091788, -0.8570018, -3.800891, 1, 0.1254902, 0, 1,
-2.087026, 1.011919, -0.3726415, 1, 0.1333333, 0, 1,
-2.08305, 0.9894404, 0.274532, 1, 0.1372549, 0, 1,
-2.070312, -1.457917, -2.889584, 1, 0.145098, 0, 1,
-2.046756, -0.7264817, -1.087642, 1, 0.1490196, 0, 1,
-2.025374, -1.696553, -0.9393891, 1, 0.1568628, 0, 1,
-2.015158, -0.1024031, -2.235579, 1, 0.1607843, 0, 1,
-2.007271, 0.3203108, -1.290125, 1, 0.1686275, 0, 1,
-1.997267, -1.25328, -2.862125, 1, 0.172549, 0, 1,
-1.996812, -1.603244, -3.427399, 1, 0.1803922, 0, 1,
-1.987772, 1.599495, 0.9023193, 1, 0.1843137, 0, 1,
-1.979079, 0.02352636, -2.037271, 1, 0.1921569, 0, 1,
-1.965042, 0.07927493, -1.944657, 1, 0.1960784, 0, 1,
-1.959441, 2.221551, 0.7849934, 1, 0.2039216, 0, 1,
-1.945148, 0.2231446, -1.759073, 1, 0.2117647, 0, 1,
-1.9054, 1.375361, -0.8109562, 1, 0.2156863, 0, 1,
-1.893441, 0.534696, -1.490316, 1, 0.2235294, 0, 1,
-1.877868, 1.510646, -1.724024, 1, 0.227451, 0, 1,
-1.868203, 0.3282624, -0.8092757, 1, 0.2352941, 0, 1,
-1.825045, 0.3715996, -1.177656, 1, 0.2392157, 0, 1,
-1.819487, -0.4487482, -2.897029, 1, 0.2470588, 0, 1,
-1.788008, -0.9637688, -3.297071, 1, 0.2509804, 0, 1,
-1.76133, -1.269475, -2.155763, 1, 0.2588235, 0, 1,
-1.740297, 0.01795777, -1.300848, 1, 0.2627451, 0, 1,
-1.721739, -0.8169184, -1.604047, 1, 0.2705882, 0, 1,
-1.718922, 1.894754, -2.503232, 1, 0.2745098, 0, 1,
-1.714543, -1.103221, -3.52728, 1, 0.282353, 0, 1,
-1.699323, 0.7089729, -1.964182, 1, 0.2862745, 0, 1,
-1.693485, -1.854158, -2.586292, 1, 0.2941177, 0, 1,
-1.670924, -0.1255708, -0.5349949, 1, 0.3019608, 0, 1,
-1.669224, -1.769592, -2.190945, 1, 0.3058824, 0, 1,
-1.66818, 0.4920039, -2.052729, 1, 0.3137255, 0, 1,
-1.665776, -1.506708, -2.484557, 1, 0.3176471, 0, 1,
-1.653944, -0.1920243, -0.5821661, 1, 0.3254902, 0, 1,
-1.649444, -0.3185748, -1.230593, 1, 0.3294118, 0, 1,
-1.648286, 0.5833967, -1.78725, 1, 0.3372549, 0, 1,
-1.628486, 1.168772, -1.678274, 1, 0.3411765, 0, 1,
-1.620476, -0.4303404, -2.552644, 1, 0.3490196, 0, 1,
-1.617089, 1.931748, -0.3251708, 1, 0.3529412, 0, 1,
-1.601625, 1.266182, -1.291582, 1, 0.3607843, 0, 1,
-1.58839, 0.2338738, -0.4204807, 1, 0.3647059, 0, 1,
-1.577097, 0.9682925, -1.24098, 1, 0.372549, 0, 1,
-1.564356, 0.8139622, -0.9386384, 1, 0.3764706, 0, 1,
-1.555827, -0.2181723, -2.583695, 1, 0.3843137, 0, 1,
-1.551165, 0.2796832, -3.105399, 1, 0.3882353, 0, 1,
-1.549239, -2.1137, -0.9161615, 1, 0.3960784, 0, 1,
-1.545329, -0.3917202, -2.243784, 1, 0.4039216, 0, 1,
-1.529628, 1.210124, -1.589954, 1, 0.4078431, 0, 1,
-1.517165, -0.8207801, -1.580896, 1, 0.4156863, 0, 1,
-1.503519, -1.813931, -1.681925, 1, 0.4196078, 0, 1,
-1.503289, 0.4514625, -0.9108701, 1, 0.427451, 0, 1,
-1.500928, 0.430782, -1.705981, 1, 0.4313726, 0, 1,
-1.493966, 0.2737249, -1.351867, 1, 0.4392157, 0, 1,
-1.492659, -0.1102809, 0.2463133, 1, 0.4431373, 0, 1,
-1.484254, 0.1037882, -1.466732, 1, 0.4509804, 0, 1,
-1.4663, -0.3271061, -1.307485, 1, 0.454902, 0, 1,
-1.461372, -0.6703936, -1.231135, 1, 0.4627451, 0, 1,
-1.45752, -0.6512659, -1.909244, 1, 0.4666667, 0, 1,
-1.456406, -0.4777155, -1.392078, 1, 0.4745098, 0, 1,
-1.450576, 1.403135, -1.14428, 1, 0.4784314, 0, 1,
-1.442798, -0.6079528, -2.132823, 1, 0.4862745, 0, 1,
-1.440956, -0.5849652, -0.8699751, 1, 0.4901961, 0, 1,
-1.436311, 1.218493, -2.084777, 1, 0.4980392, 0, 1,
-1.435755, -1.696865, -3.595409, 1, 0.5058824, 0, 1,
-1.432378, -0.9620339, -2.271252, 1, 0.509804, 0, 1,
-1.422168, 2.616669, -0.5813777, 1, 0.5176471, 0, 1,
-1.419982, 1.128885, -2.011584, 1, 0.5215687, 0, 1,
-1.404549, 1.709482, -1.034543, 1, 0.5294118, 0, 1,
-1.400939, -0.1896544, -3.977857, 1, 0.5333334, 0, 1,
-1.398465, 0.732891, -0.8009182, 1, 0.5411765, 0, 1,
-1.39504, 1.491338, -0.7361717, 1, 0.5450981, 0, 1,
-1.386868, -0.542861, -1.690567, 1, 0.5529412, 0, 1,
-1.385638, 2.022133, -0.8773451, 1, 0.5568628, 0, 1,
-1.378627, 0.3676851, -1.819073, 1, 0.5647059, 0, 1,
-1.376393, 0.278481, 0.2659274, 1, 0.5686275, 0, 1,
-1.375754, 1.264788, -1.095965, 1, 0.5764706, 0, 1,
-1.369038, 0.1420462, -2.230493, 1, 0.5803922, 0, 1,
-1.367071, 1.478724, 0.130206, 1, 0.5882353, 0, 1,
-1.354082, -0.2873046, -1.779036, 1, 0.5921569, 0, 1,
-1.352774, -0.3600028, -1.598686, 1, 0.6, 0, 1,
-1.350922, 0.6710804, -0.6049443, 1, 0.6078432, 0, 1,
-1.348126, 0.7588303, -1.118454, 1, 0.6117647, 0, 1,
-1.346498, -1.868828, -3.234313, 1, 0.6196079, 0, 1,
-1.340383, -0.6872578, -2.957829, 1, 0.6235294, 0, 1,
-1.336913, -0.08137657, -1.60351, 1, 0.6313726, 0, 1,
-1.334651, -0.6733179, -2.199732, 1, 0.6352941, 0, 1,
-1.323912, 0.7234424, -0.1465554, 1, 0.6431373, 0, 1,
-1.319554, -1.21465, -2.562014, 1, 0.6470588, 0, 1,
-1.318948, 0.6195251, 0.4503682, 1, 0.654902, 0, 1,
-1.312987, -0.8604417, -1.442909, 1, 0.6588235, 0, 1,
-1.304329, 0.4125316, -0.6851327, 1, 0.6666667, 0, 1,
-1.301392, -0.9550998, -3.336172, 1, 0.6705883, 0, 1,
-1.295083, -1.017568, -3.515647, 1, 0.6784314, 0, 1,
-1.284302, 0.390686, -0.7560928, 1, 0.682353, 0, 1,
-1.281819, -2.262802, -2.22538, 1, 0.6901961, 0, 1,
-1.279424, 0.5073417, -2.629118, 1, 0.6941177, 0, 1,
-1.266267, 0.03721141, -2.448449, 1, 0.7019608, 0, 1,
-1.25909, -1.350399, -4.730382, 1, 0.7098039, 0, 1,
-1.255959, -0.2248918, -1.737323, 1, 0.7137255, 0, 1,
-1.252552, 0.531605, -0.8157043, 1, 0.7215686, 0, 1,
-1.252166, -0.5396115, -2.956438, 1, 0.7254902, 0, 1,
-1.242039, -1.169155, -2.253644, 1, 0.7333333, 0, 1,
-1.232743, -0.736644, -1.284426, 1, 0.7372549, 0, 1,
-1.227897, 0.8843457, -0.8643346, 1, 0.7450981, 0, 1,
-1.225614, -1.38568, -2.275924, 1, 0.7490196, 0, 1,
-1.223879, 2.454542, 0.08556107, 1, 0.7568628, 0, 1,
-1.220706, -0.1815489, -0.06694046, 1, 0.7607843, 0, 1,
-1.21945, 1.402182, 0.6305502, 1, 0.7686275, 0, 1,
-1.215464, 0.5927524, -1.060945, 1, 0.772549, 0, 1,
-1.215057, -1.577167, -2.67278, 1, 0.7803922, 0, 1,
-1.211591, 0.1328863, -1.559628, 1, 0.7843137, 0, 1,
-1.209887, -0.6418191, -2.581807, 1, 0.7921569, 0, 1,
-1.208056, 1.702445, 0.4574949, 1, 0.7960784, 0, 1,
-1.205519, 0.5323103, 0.2073568, 1, 0.8039216, 0, 1,
-1.205138, 0.7468095, -1.856732, 1, 0.8117647, 0, 1,
-1.202616, -0.512203, -3.845357, 1, 0.8156863, 0, 1,
-1.199412, 0.9140778, -0.6200448, 1, 0.8235294, 0, 1,
-1.198863, -0.5968021, -2.575231, 1, 0.827451, 0, 1,
-1.186646, -1.541317, -2.582161, 1, 0.8352941, 0, 1,
-1.185632, -0.3440571, -1.204249, 1, 0.8392157, 0, 1,
-1.184402, -0.2382222, -1.455884, 1, 0.8470588, 0, 1,
-1.178011, 0.5560007, -2.282703, 1, 0.8509804, 0, 1,
-1.176228, 0.07852811, -0.1631082, 1, 0.8588235, 0, 1,
-1.172136, -0.1680637, -1.784343, 1, 0.8627451, 0, 1,
-1.169333, -0.2376597, 0.09506328, 1, 0.8705882, 0, 1,
-1.168472, -1.514453, -2.576215, 1, 0.8745098, 0, 1,
-1.168307, 0.07407214, -0.9524847, 1, 0.8823529, 0, 1,
-1.167023, 0.06322023, 0.5356016, 1, 0.8862745, 0, 1,
-1.166703, -0.1353119, -1.198508, 1, 0.8941177, 0, 1,
-1.1653, 0.6371082, -1.353171, 1, 0.8980392, 0, 1,
-1.148249, -1.883716, -0.6963714, 1, 0.9058824, 0, 1,
-1.146044, -0.9378626, -2.144982, 1, 0.9137255, 0, 1,
-1.118568, -1.035002, -1.529267, 1, 0.9176471, 0, 1,
-1.113562, 0.8999324, -0.4239795, 1, 0.9254902, 0, 1,
-1.101411, 0.5069183, -2.82329, 1, 0.9294118, 0, 1,
-1.101191, -0.8438548, -0.477807, 1, 0.9372549, 0, 1,
-1.100365, -0.7824426, -2.118367, 1, 0.9411765, 0, 1,
-1.094075, 2.534829, -0.2251593, 1, 0.9490196, 0, 1,
-1.087125, 2.121686, 1.428319, 1, 0.9529412, 0, 1,
-1.086348, -0.9271396, -0.6342996, 1, 0.9607843, 0, 1,
-1.086013, -1.000179, -2.023146, 1, 0.9647059, 0, 1,
-1.074018, 1.24401, -0.07517371, 1, 0.972549, 0, 1,
-1.070354, -0.3487063, -3.408629, 1, 0.9764706, 0, 1,
-1.063964, -0.9134957, -4.163737, 1, 0.9843137, 0, 1,
-1.059251, 2.360884, -0.3342083, 1, 0.9882353, 0, 1,
-1.04543, 0.07000692, -1.388969, 1, 0.9960784, 0, 1,
-1.043943, 1.895256, -0.5627557, 0.9960784, 1, 0, 1,
-1.042268, 0.4419276, -2.481311, 0.9921569, 1, 0, 1,
-1.040444, 1.185565, -1.68212, 0.9843137, 1, 0, 1,
-1.037041, 0.6377599, -1.219718, 0.9803922, 1, 0, 1,
-1.027756, 0.9185157, -0.8814048, 0.972549, 1, 0, 1,
-1.023366, -0.1859321, -0.5791228, 0.9686275, 1, 0, 1,
-1.023358, -0.09402127, -3.727332, 0.9607843, 1, 0, 1,
-1.020943, -0.2154377, -1.807816, 0.9568627, 1, 0, 1,
-1.018034, 1.648057, -1.041939, 0.9490196, 1, 0, 1,
-1.013384, -2.702442, -3.620673, 0.945098, 1, 0, 1,
-1.012128, 0.03847698, -2.366793, 0.9372549, 1, 0, 1,
-1.008143, -0.3854051, -1.195868, 0.9333333, 1, 0, 1,
-1.003536, 1.068009, -0.419277, 0.9254902, 1, 0, 1,
-0.9873052, -2.216802, -4.04911, 0.9215686, 1, 0, 1,
-0.9803154, -1.44228, -0.7273574, 0.9137255, 1, 0, 1,
-0.9797118, 1.712776, -0.009551958, 0.9098039, 1, 0, 1,
-0.9746447, -0.7419578, -1.321949, 0.9019608, 1, 0, 1,
-0.9659349, -0.1235714, -1.735558, 0.8941177, 1, 0, 1,
-0.9651247, 0.08299357, -0.8481645, 0.8901961, 1, 0, 1,
-0.9648175, 0.2156963, -3.531794, 0.8823529, 1, 0, 1,
-0.9625022, -0.3492666, -1.342464, 0.8784314, 1, 0, 1,
-0.9617915, -1.09698, -2.279205, 0.8705882, 1, 0, 1,
-0.9605234, 0.01583781, -0.1864491, 0.8666667, 1, 0, 1,
-0.9583318, -0.6286581, -0.2668993, 0.8588235, 1, 0, 1,
-0.9545358, 0.8683307, 0.4586533, 0.854902, 1, 0, 1,
-0.9535227, -0.8549789, -4.026088, 0.8470588, 1, 0, 1,
-0.9525532, -0.6136535, -3.923357, 0.8431373, 1, 0, 1,
-0.9514146, -0.5225737, -3.160024, 0.8352941, 1, 0, 1,
-0.9488168, 1.380421, -2.955762, 0.8313726, 1, 0, 1,
-0.9458256, 1.155976, -1.830946, 0.8235294, 1, 0, 1,
-0.9448276, 0.9533695, -0.8414895, 0.8196079, 1, 0, 1,
-0.9410167, 0.5528287, 0.106449, 0.8117647, 1, 0, 1,
-0.9304477, -1.389704, -0.8965732, 0.8078431, 1, 0, 1,
-0.9301705, -0.1424763, -2.758062, 0.8, 1, 0, 1,
-0.9218632, -1.107483, -3.959993, 0.7921569, 1, 0, 1,
-0.9068018, -1.231948, -2.443979, 0.7882353, 1, 0, 1,
-0.9031184, 0.4259267, -2.039706, 0.7803922, 1, 0, 1,
-0.9029214, -0.05403827, -2.123904, 0.7764706, 1, 0, 1,
-0.9028845, 0.7891334, -1.049023, 0.7686275, 1, 0, 1,
-0.9002508, -0.04458486, -1.905357, 0.7647059, 1, 0, 1,
-0.8980155, 1.807572, -1.402652, 0.7568628, 1, 0, 1,
-0.8979967, 0.819411, -1.247478, 0.7529412, 1, 0, 1,
-0.8967068, -2.276136, -2.202649, 0.7450981, 1, 0, 1,
-0.8945673, -0.5927266, -0.6549681, 0.7411765, 1, 0, 1,
-0.883709, -1.021849, -0.7381571, 0.7333333, 1, 0, 1,
-0.8760291, -0.2090319, -0.279902, 0.7294118, 1, 0, 1,
-0.8731406, -1.283902, -2.911074, 0.7215686, 1, 0, 1,
-0.8693646, 1.673509, -0.352346, 0.7176471, 1, 0, 1,
-0.8669466, 0.7774189, -1.351477, 0.7098039, 1, 0, 1,
-0.8621052, 0.1056084, 1.327713, 0.7058824, 1, 0, 1,
-0.852055, -1.171566, -3.61512, 0.6980392, 1, 0, 1,
-0.8520094, 0.5303212, -3.181971, 0.6901961, 1, 0, 1,
-0.847612, 1.209219, 0.2569554, 0.6862745, 1, 0, 1,
-0.8473483, -2.091013, -3.536201, 0.6784314, 1, 0, 1,
-0.8428721, -0.03177356, -2.004688, 0.6745098, 1, 0, 1,
-0.8382882, -2.352531, -1.646107, 0.6666667, 1, 0, 1,
-0.8373957, 2.018121, -0.3853235, 0.6627451, 1, 0, 1,
-0.8292993, -0.851473, -1.55951, 0.654902, 1, 0, 1,
-0.8266824, 2.710109, -0.3185162, 0.6509804, 1, 0, 1,
-0.8238183, 0.07606292, -0.8878627, 0.6431373, 1, 0, 1,
-0.822853, 0.602511, -1.766118, 0.6392157, 1, 0, 1,
-0.8158573, -1.661107, -3.833665, 0.6313726, 1, 0, 1,
-0.8087426, -0.4535866, -2.146379, 0.627451, 1, 0, 1,
-0.7972267, -0.08319881, -1.43561, 0.6196079, 1, 0, 1,
-0.7904821, -1.020993, -3.494874, 0.6156863, 1, 0, 1,
-0.790221, 0.74452, -1.61378, 0.6078432, 1, 0, 1,
-0.789474, 0.6816677, -0.6175861, 0.6039216, 1, 0, 1,
-0.7860057, 0.440704, -0.4758116, 0.5960785, 1, 0, 1,
-0.7709258, 0.6162395, -0.8905326, 0.5882353, 1, 0, 1,
-0.7597708, 0.0337619, -0.7854217, 0.5843138, 1, 0, 1,
-0.7595502, -0.4847986, -1.965859, 0.5764706, 1, 0, 1,
-0.7543515, -0.2289361, -1.686456, 0.572549, 1, 0, 1,
-0.7483224, -0.6167236, -2.147121, 0.5647059, 1, 0, 1,
-0.746147, -0.7660744, -1.667705, 0.5607843, 1, 0, 1,
-0.7430483, 0.1764455, -1.200639, 0.5529412, 1, 0, 1,
-0.7391776, 0.3987097, -0.08870582, 0.5490196, 1, 0, 1,
-0.7376752, 0.6367956, -0.9209311, 0.5411765, 1, 0, 1,
-0.7299128, 0.7118114, -2.330335, 0.5372549, 1, 0, 1,
-0.726725, 0.1861661, -1.269298, 0.5294118, 1, 0, 1,
-0.7174434, 1.286314, 0.1082695, 0.5254902, 1, 0, 1,
-0.7151905, -0.08263659, -2.298132, 0.5176471, 1, 0, 1,
-0.7093898, -0.1303807, -1.133126, 0.5137255, 1, 0, 1,
-0.7065753, -0.7580415, -1.207355, 0.5058824, 1, 0, 1,
-0.7009312, -0.20021, -1.349304, 0.5019608, 1, 0, 1,
-0.6991727, -0.2045567, -0.4288449, 0.4941176, 1, 0, 1,
-0.6963573, 0.2239404, -1.308653, 0.4862745, 1, 0, 1,
-0.6946397, 0.4177817, -2.270995, 0.4823529, 1, 0, 1,
-0.6935079, 0.9917654, 0.1033665, 0.4745098, 1, 0, 1,
-0.6918423, 1.010597, -0.9502705, 0.4705882, 1, 0, 1,
-0.6907437, -0.2587401, -2.00905, 0.4627451, 1, 0, 1,
-0.6900948, -0.1351522, -2.352127, 0.4588235, 1, 0, 1,
-0.6899146, 1.036083, 0.009833761, 0.4509804, 1, 0, 1,
-0.6817312, 0.1401299, -3.07731, 0.4470588, 1, 0, 1,
-0.6793673, 1.065672, -0.110487, 0.4392157, 1, 0, 1,
-0.6722977, -1.52963, -3.288868, 0.4352941, 1, 0, 1,
-0.6620383, 0.5499187, -2.63559, 0.427451, 1, 0, 1,
-0.6613999, 1.122224, -0.4661653, 0.4235294, 1, 0, 1,
-0.6609441, -1.564176, -2.310113, 0.4156863, 1, 0, 1,
-0.6609243, 1.102499, -0.05836608, 0.4117647, 1, 0, 1,
-0.6565357, 0.4830994, -1.724195, 0.4039216, 1, 0, 1,
-0.6535025, 0.9983417, -0.4570789, 0.3960784, 1, 0, 1,
-0.6490713, -0.1749068, -2.492526, 0.3921569, 1, 0, 1,
-0.6471804, 0.7886932, -0.4033535, 0.3843137, 1, 0, 1,
-0.6429825, -1.311335, -3.256958, 0.3803922, 1, 0, 1,
-0.6420562, -0.2924245, -2.751251, 0.372549, 1, 0, 1,
-0.6414823, 0.6828114, 0.9249195, 0.3686275, 1, 0, 1,
-0.6335247, -1.143892, -2.83871, 0.3607843, 1, 0, 1,
-0.6218938, -0.5562417, -3.00368, 0.3568628, 1, 0, 1,
-0.6207143, 0.02775722, -2.100525, 0.3490196, 1, 0, 1,
-0.6195437, 0.1272758, -0.1120335, 0.345098, 1, 0, 1,
-0.6158614, -1.861501, -3.235009, 0.3372549, 1, 0, 1,
-0.6154706, 0.104329, -1.773867, 0.3333333, 1, 0, 1,
-0.6088442, -0.2813875, -3.253075, 0.3254902, 1, 0, 1,
-0.604441, 0.7718576, -1.119128, 0.3215686, 1, 0, 1,
-0.6017818, -0.7835292, -1.526839, 0.3137255, 1, 0, 1,
-0.5975962, -1.0272, -2.838177, 0.3098039, 1, 0, 1,
-0.5959297, -1.440981, -2.934977, 0.3019608, 1, 0, 1,
-0.5936426, -1.534219, -3.021773, 0.2941177, 1, 0, 1,
-0.5818371, -0.310801, -1.543074, 0.2901961, 1, 0, 1,
-0.5817172, -0.5225154, -1.582245, 0.282353, 1, 0, 1,
-0.5799752, 2.801649, -1.195831, 0.2784314, 1, 0, 1,
-0.5786743, 0.1276736, -1.372481, 0.2705882, 1, 0, 1,
-0.5757313, -0.6423522, -2.005926, 0.2666667, 1, 0, 1,
-0.5729943, 0.6129582, -1.569332, 0.2588235, 1, 0, 1,
-0.5682851, -0.5008581, -2.253486, 0.254902, 1, 0, 1,
-0.5662675, -0.540342, -3.474482, 0.2470588, 1, 0, 1,
-0.5642009, -0.2647059, -1.565348, 0.2431373, 1, 0, 1,
-0.5585276, 0.7435963, -2.083243, 0.2352941, 1, 0, 1,
-0.5582589, -0.7408271, -0.1723981, 0.2313726, 1, 0, 1,
-0.5542303, 0.7094904, -0.6087368, 0.2235294, 1, 0, 1,
-0.5463363, 0.2718314, -1.630003, 0.2196078, 1, 0, 1,
-0.5459065, -0.09062245, -2.876, 0.2117647, 1, 0, 1,
-0.541333, -0.7291172, -3.13325, 0.2078431, 1, 0, 1,
-0.5408484, -0.8550078, -1.679028, 0.2, 1, 0, 1,
-0.5364562, -1.512188, -2.976542, 0.1921569, 1, 0, 1,
-0.534335, -0.5953392, -3.443043, 0.1882353, 1, 0, 1,
-0.5330523, 0.02521507, -1.564628, 0.1803922, 1, 0, 1,
-0.5287, 0.07553836, -1.356948, 0.1764706, 1, 0, 1,
-0.522639, 1.292681, 0.3479657, 0.1686275, 1, 0, 1,
-0.5224265, -0.7342491, -3.821194, 0.1647059, 1, 0, 1,
-0.5223337, 1.82418, -0.3693678, 0.1568628, 1, 0, 1,
-0.5209135, -0.5165846, -2.319232, 0.1529412, 1, 0, 1,
-0.5157294, 0.146437, -2.328752, 0.145098, 1, 0, 1,
-0.5128838, 1.183878, -1.501355, 0.1411765, 1, 0, 1,
-0.5114831, -0.1582227, -1.226813, 0.1333333, 1, 0, 1,
-0.5096977, -0.457205, -1.067001, 0.1294118, 1, 0, 1,
-0.5049743, -2.494974, -1.608791, 0.1215686, 1, 0, 1,
-0.4998097, -0.01102829, -1.249851, 0.1176471, 1, 0, 1,
-0.4900329, -1.664133, -2.94574, 0.1098039, 1, 0, 1,
-0.4858491, 1.030251, -0.1975426, 0.1058824, 1, 0, 1,
-0.4834791, 0.1127037, -1.210402, 0.09803922, 1, 0, 1,
-0.4828425, 0.4655817, -1.220903, 0.09019608, 1, 0, 1,
-0.4809943, 0.9848109, -0.6960574, 0.08627451, 1, 0, 1,
-0.4808789, -2.063448, -3.540691, 0.07843138, 1, 0, 1,
-0.4698957, 1.622541, -0.1648029, 0.07450981, 1, 0, 1,
-0.4659813, -0.5520619, -2.992392, 0.06666667, 1, 0, 1,
-0.4627314, 0.7670231, -0.3419134, 0.0627451, 1, 0, 1,
-0.45503, -1.789973, -2.091297, 0.05490196, 1, 0, 1,
-0.4531533, 2.122803, -0.14842, 0.05098039, 1, 0, 1,
-0.4527218, 0.5128207, 2.261038, 0.04313726, 1, 0, 1,
-0.4513575, -0.1056103, -1.387704, 0.03921569, 1, 0, 1,
-0.449609, -1.006282, -2.262046, 0.03137255, 1, 0, 1,
-0.4476614, 0.2093369, -0.3394439, 0.02745098, 1, 0, 1,
-0.4473747, -1.170604, -2.146835, 0.01960784, 1, 0, 1,
-0.4437117, -0.6259678, -3.269848, 0.01568628, 1, 0, 1,
-0.438968, 0.8584315, -1.241339, 0.007843138, 1, 0, 1,
-0.4352644, -0.8275276, -2.115167, 0.003921569, 1, 0, 1,
-0.4325902, 2.342879, 0.6572739, 0, 1, 0.003921569, 1,
-0.4259801, 0.9672254, -0.7207973, 0, 1, 0.01176471, 1,
-0.4257191, 0.8027976, -1.241401, 0, 1, 0.01568628, 1,
-0.4251003, -0.5584489, -3.394328, 0, 1, 0.02352941, 1,
-0.4229104, -1.584814, -4.102071, 0, 1, 0.02745098, 1,
-0.4226553, 1.566617, -0.9145406, 0, 1, 0.03529412, 1,
-0.4174536, 0.08427523, -1.488885, 0, 1, 0.03921569, 1,
-0.4173752, 0.4381464, -0.7744395, 0, 1, 0.04705882, 1,
-0.408718, 0.0725462, -2.15403, 0, 1, 0.05098039, 1,
-0.4058049, -0.3276721, -3.659134, 0, 1, 0.05882353, 1,
-0.4021002, 0.4369518, -0.1991132, 0, 1, 0.0627451, 1,
-0.4015217, 1.170696, 0.5663526, 0, 1, 0.07058824, 1,
-0.4004198, 0.206558, -1.657179, 0, 1, 0.07450981, 1,
-0.3954453, -3.015497, -2.542006, 0, 1, 0.08235294, 1,
-0.3942704, 0.8479621, -0.5054033, 0, 1, 0.08627451, 1,
-0.3927414, 0.8360481, -0.2407772, 0, 1, 0.09411765, 1,
-0.3926497, -2.843079, -3.194654, 0, 1, 0.1019608, 1,
-0.3867778, 1.570077, -0.4641343, 0, 1, 0.1058824, 1,
-0.3827223, -1.041285, -4.19726, 0, 1, 0.1137255, 1,
-0.3823062, 0.2269168, -0.0249851, 0, 1, 0.1176471, 1,
-0.3799303, 0.2013251, -0.6796257, 0, 1, 0.1254902, 1,
-0.3734311, -0.5013056, -2.754174, 0, 1, 0.1294118, 1,
-0.3689786, 1.086473, -0.2270908, 0, 1, 0.1372549, 1,
-0.3688859, -0.1263387, -0.01062528, 0, 1, 0.1411765, 1,
-0.3677144, -0.3542719, -0.1924225, 0, 1, 0.1490196, 1,
-0.3656965, -1.442576, -3.180109, 0, 1, 0.1529412, 1,
-0.3611816, -0.2975574, -1.724041, 0, 1, 0.1607843, 1,
-0.3606976, -1.041845, -2.500674, 0, 1, 0.1647059, 1,
-0.359593, 0.1936738, -2.606543, 0, 1, 0.172549, 1,
-0.3585467, -0.6738756, -5.983964, 0, 1, 0.1764706, 1,
-0.3551153, -0.08053825, -2.368222, 0, 1, 0.1843137, 1,
-0.3547607, 0.350888, -2.280047, 0, 1, 0.1882353, 1,
-0.349606, -0.5301371, -2.556483, 0, 1, 0.1960784, 1,
-0.3466994, -0.08852652, -0.1321913, 0, 1, 0.2039216, 1,
-0.3461912, -1.136416, -4.713541, 0, 1, 0.2078431, 1,
-0.3425784, -1.263065, -2.762125, 0, 1, 0.2156863, 1,
-0.3422837, -0.04139856, -1.156779, 0, 1, 0.2196078, 1,
-0.3401227, 1.475123, 0.04629695, 0, 1, 0.227451, 1,
-0.3381973, -0.6730247, -1.945262, 0, 1, 0.2313726, 1,
-0.3378608, 0.2245903, -1.446148, 0, 1, 0.2392157, 1,
-0.3353411, -0.7058513, -2.221387, 0, 1, 0.2431373, 1,
-0.3316417, 1.229294, -0.2158952, 0, 1, 0.2509804, 1,
-0.3298402, -0.5676982, -1.423599, 0, 1, 0.254902, 1,
-0.3242621, -1.223836, -3.684413, 0, 1, 0.2627451, 1,
-0.3199845, 0.642494, -1.834479, 0, 1, 0.2666667, 1,
-0.3098069, 0.4440397, -0.4689102, 0, 1, 0.2745098, 1,
-0.30705, 0.6304327, -2.366291, 0, 1, 0.2784314, 1,
-0.30323, 1.591428, -0.1968266, 0, 1, 0.2862745, 1,
-0.3017843, -1.892011, -4.245255, 0, 1, 0.2901961, 1,
-0.3002331, 0.7426059, -0.2863739, 0, 1, 0.2980392, 1,
-0.2995911, 2.491628, -0.6375859, 0, 1, 0.3058824, 1,
-0.2952389, 1.022607, -0.7205814, 0, 1, 0.3098039, 1,
-0.294848, -0.3403078, -0.9438198, 0, 1, 0.3176471, 1,
-0.2929564, -0.6265996, -1.706922, 0, 1, 0.3215686, 1,
-0.2889349, -0.6529873, -2.411456, 0, 1, 0.3294118, 1,
-0.2876484, -0.6858497, -2.999271, 0, 1, 0.3333333, 1,
-0.2870919, -1.642073, -2.322036, 0, 1, 0.3411765, 1,
-0.2863772, 1.197209, 0.2535902, 0, 1, 0.345098, 1,
-0.2853328, -0.1645, -3.255352, 0, 1, 0.3529412, 1,
-0.2820369, 0.7357492, -0.2451383, 0, 1, 0.3568628, 1,
-0.27569, -0.006201274, -0.8894112, 0, 1, 0.3647059, 1,
-0.2723407, -0.7179967, -2.509345, 0, 1, 0.3686275, 1,
-0.27204, -0.01667361, -1.758813, 0, 1, 0.3764706, 1,
-0.2708342, -1.792574, -3.763093, 0, 1, 0.3803922, 1,
-0.2689359, 0.8236847, 0.5885263, 0, 1, 0.3882353, 1,
-0.2683486, 1.047633, -0.9907118, 0, 1, 0.3921569, 1,
-0.2659185, 0.9585031, -0.5579079, 0, 1, 0.4, 1,
-0.2639076, 0.7298244, -0.04837376, 0, 1, 0.4078431, 1,
-0.2633717, -0.01617053, -1.676317, 0, 1, 0.4117647, 1,
-0.2629375, -1.021777, -3.704125, 0, 1, 0.4196078, 1,
-0.2568464, 0.5975583, -0.006788904, 0, 1, 0.4235294, 1,
-0.2483485, 1.706353, -0.5853525, 0, 1, 0.4313726, 1,
-0.243741, -1.828881, -1.917074, 0, 1, 0.4352941, 1,
-0.2427192, -0.1258097, -0.8450602, 0, 1, 0.4431373, 1,
-0.2413813, 0.7296233, -0.1726372, 0, 1, 0.4470588, 1,
-0.2391863, -1.040169, -2.356891, 0, 1, 0.454902, 1,
-0.2379389, -2.324771, -1.994436, 0, 1, 0.4588235, 1,
-0.2367906, 1.389174, 0.5983151, 0, 1, 0.4666667, 1,
-0.2362347, -0.4113051, -1.925919, 0, 1, 0.4705882, 1,
-0.2326671, 0.8689038, -0.9087242, 0, 1, 0.4784314, 1,
-0.2292624, 0.3188881, 0.8237812, 0, 1, 0.4823529, 1,
-0.2274408, -0.4633195, -1.980408, 0, 1, 0.4901961, 1,
-0.2216927, 0.6272973, 0.05076022, 0, 1, 0.4941176, 1,
-0.2188928, 0.9766224, 0.2680275, 0, 1, 0.5019608, 1,
-0.2166974, -0.8861854, -2.127092, 0, 1, 0.509804, 1,
-0.2122228, -0.9666159, -2.779297, 0, 1, 0.5137255, 1,
-0.2078384, 0.3941938, 1.6797, 0, 1, 0.5215687, 1,
-0.2062769, 1.054588, 1.339613, 0, 1, 0.5254902, 1,
-0.2061503, 0.3223272, -0.2091963, 0, 1, 0.5333334, 1,
-0.2058276, 0.6839173, -0.6798438, 0, 1, 0.5372549, 1,
-0.2054639, -1.075248, -1.817516, 0, 1, 0.5450981, 1,
-0.2047465, -1.283991, -4.124219, 0, 1, 0.5490196, 1,
-0.2045437, -0.4393843, -1.468974, 0, 1, 0.5568628, 1,
-0.2027638, 0.8701913, -2.139259, 0, 1, 0.5607843, 1,
-0.2023561, 2.002526, 0.9658058, 0, 1, 0.5686275, 1,
-0.2010645, -0.776483, -5.555229, 0, 1, 0.572549, 1,
-0.1957142, 1.805297, 0.01329219, 0, 1, 0.5803922, 1,
-0.1875036, -1.827516, -3.730667, 0, 1, 0.5843138, 1,
-0.1813702, -0.2913534, -4.063643, 0, 1, 0.5921569, 1,
-0.1726022, 0.1625008, 1.530217, 0, 1, 0.5960785, 1,
-0.1720709, -1.443042, -2.283898, 0, 1, 0.6039216, 1,
-0.1697019, -0.2502846, -2.777035, 0, 1, 0.6117647, 1,
-0.16832, -0.8943082, -3.230081, 0, 1, 0.6156863, 1,
-0.1683126, -0.3416322, -1.038851, 0, 1, 0.6235294, 1,
-0.1674195, 0.5803099, 0.1897666, 0, 1, 0.627451, 1,
-0.1659559, 0.44539, -1.196769, 0, 1, 0.6352941, 1,
-0.1628164, -0.31685, -2.384171, 0, 1, 0.6392157, 1,
-0.1546504, 0.6776501, -0.3897416, 0, 1, 0.6470588, 1,
-0.1466719, -1.237314, -2.586126, 0, 1, 0.6509804, 1,
-0.141736, -1.346269, -4.043505, 0, 1, 0.6588235, 1,
-0.1395088, 0.1794274, 1.465296, 0, 1, 0.6627451, 1,
-0.1392061, 0.8766485, 1.000452, 0, 1, 0.6705883, 1,
-0.1371475, -0.4344586, -3.763321, 0, 1, 0.6745098, 1,
-0.1371139, -0.6983288, -2.932029, 0, 1, 0.682353, 1,
-0.1333897, 1.513233, 0.1474534, 0, 1, 0.6862745, 1,
-0.1290259, 0.3255626, -0.2167257, 0, 1, 0.6941177, 1,
-0.1272253, -0.4862069, -2.858437, 0, 1, 0.7019608, 1,
-0.1230152, 0.08303054, -0.8301861, 0, 1, 0.7058824, 1,
-0.1151751, 0.4085398, 0.04573789, 0, 1, 0.7137255, 1,
-0.1131492, -0.0655159, -0.47846, 0, 1, 0.7176471, 1,
-0.1100916, 0.1796502, -1.022236, 0, 1, 0.7254902, 1,
-0.1042228, 1.582507, -0.2320576, 0, 1, 0.7294118, 1,
-0.1030831, 0.2119811, -1.984005, 0, 1, 0.7372549, 1,
-0.1022088, 1.202421, -0.1612562, 0, 1, 0.7411765, 1,
-0.1006815, 0.8510622, 1.564709, 0, 1, 0.7490196, 1,
-0.09629139, 0.3403562, -0.06294228, 0, 1, 0.7529412, 1,
-0.09495895, -0.01580452, -1.386275, 0, 1, 0.7607843, 1,
-0.09277081, -0.6927537, -1.186361, 0, 1, 0.7647059, 1,
-0.09240652, 1.308508, 0.05483979, 0, 1, 0.772549, 1,
-0.09185523, 0.1464492, -1.088608, 0, 1, 0.7764706, 1,
-0.08939449, 0.6913084, 0.5815134, 0, 1, 0.7843137, 1,
-0.08343273, -1.381861, -4.595944, 0, 1, 0.7882353, 1,
-0.08336172, -0.4075564, -2.776772, 0, 1, 0.7960784, 1,
-0.08062246, -0.05047172, -2.00428, 0, 1, 0.8039216, 1,
-0.08010577, -0.864017, -3.761585, 0, 1, 0.8078431, 1,
-0.08000556, 1.084377, 1.235479, 0, 1, 0.8156863, 1,
-0.07790183, -0.3601885, -2.73195, 0, 1, 0.8196079, 1,
-0.07703471, 2.6414, -0.9737048, 0, 1, 0.827451, 1,
-0.07314161, 0.2399824, 0.06725334, 0, 1, 0.8313726, 1,
-0.06905555, 0.7837767, -0.1149862, 0, 1, 0.8392157, 1,
-0.06878406, 0.8264424, -0.2249658, 0, 1, 0.8431373, 1,
-0.0664167, -0.1339543, -2.339174, 0, 1, 0.8509804, 1,
-0.06546763, 1.261035, -1.747693, 0, 1, 0.854902, 1,
-0.0625091, 0.5392098, -0.5074224, 0, 1, 0.8627451, 1,
-0.06115644, 0.4577067, 0.3727779, 0, 1, 0.8666667, 1,
-0.05838258, -0.4535899, -5.249347, 0, 1, 0.8745098, 1,
-0.05725236, 0.1014716, 0.05859421, 0, 1, 0.8784314, 1,
-0.05544656, -0.04892741, -0.4157795, 0, 1, 0.8862745, 1,
-0.05238917, -1.60016, -1.199101, 0, 1, 0.8901961, 1,
-0.04876869, 0.7911112, 0.6952299, 0, 1, 0.8980392, 1,
-0.04614192, -0.1331726, -3.033067, 0, 1, 0.9058824, 1,
-0.04572438, 2.423556, -0.3583819, 0, 1, 0.9098039, 1,
-0.04562688, -0.9888888, -2.31574, 0, 1, 0.9176471, 1,
-0.04446204, -0.5292442, -2.142918, 0, 1, 0.9215686, 1,
-0.04439519, -0.5986101, -2.804583, 0, 1, 0.9294118, 1,
-0.04321269, -0.1748236, -1.982895, 0, 1, 0.9333333, 1,
-0.0425357, -0.0966657, -3.233391, 0, 1, 0.9411765, 1,
-0.03687963, 0.5779345, -0.2080533, 0, 1, 0.945098, 1,
-0.03600021, 2.3497, 0.6494393, 0, 1, 0.9529412, 1,
-0.03588028, 0.1718159, 1.571347, 0, 1, 0.9568627, 1,
-0.03097318, -0.003748028, -1.797454, 0, 1, 0.9647059, 1,
-0.0302646, -0.002452725, -1.232252, 0, 1, 0.9686275, 1,
-0.02982454, 0.140436, 0.8675715, 0, 1, 0.9764706, 1,
-0.02947963, 0.595744, -0.3700878, 0, 1, 0.9803922, 1,
-0.02476752, 1.312304, -1.693281, 0, 1, 0.9882353, 1,
-0.02451079, 0.3899843, -0.8030214, 0, 1, 0.9921569, 1,
-0.02264985, -0.6917953, -4.655184, 0, 1, 1, 1,
-0.0197563, -2.679469, -2.950526, 0, 0.9921569, 1, 1,
-0.01816261, 0.2539565, 0.08995392, 0, 0.9882353, 1, 1,
-0.0152392, 1.650929, 0.2559111, 0, 0.9803922, 1, 1,
-0.01319436, -1.021898, -3.158751, 0, 0.9764706, 1, 1,
-0.01311874, 0.965854, 0.1444079, 0, 0.9686275, 1, 1,
-0.01217202, -0.9269618, -3.720831, 0, 0.9647059, 1, 1,
-0.01087605, 0.104399, -0.9717473, 0, 0.9568627, 1, 1,
-0.00515028, -1.462163, -3.425315, 0, 0.9529412, 1, 1,
-0.004991096, -0.03490429, -3.237644, 0, 0.945098, 1, 1,
-0.0006517496, 0.6343747, -2.021396, 0, 0.9411765, 1, 1,
0.0004373782, 0.6079419, 1.879096, 0, 0.9333333, 1, 1,
0.002942021, -1.637032, 4.766529, 0, 0.9294118, 1, 1,
0.003786384, -1.146332, 2.751235, 0, 0.9215686, 1, 1,
0.009344113, -1.351528, 4.795282, 0, 0.9176471, 1, 1,
0.01581165, 0.08988982, 0.08491997, 0, 0.9098039, 1, 1,
0.01764669, -0.3351104, 2.878949, 0, 0.9058824, 1, 1,
0.02094068, -0.2897669, 2.192971, 0, 0.8980392, 1, 1,
0.022992, -1.781158, 3.043082, 0, 0.8901961, 1, 1,
0.02322537, -0.1304538, 1.922272, 0, 0.8862745, 1, 1,
0.02522274, -0.4352273, 3.085672, 0, 0.8784314, 1, 1,
0.02604911, 0.4392442, 0.07626244, 0, 0.8745098, 1, 1,
0.02936209, 0.5695524, 0.07018784, 0, 0.8666667, 1, 1,
0.0294837, -1.033795, 3.589278, 0, 0.8627451, 1, 1,
0.03121196, 1.061083, -0.5890943, 0, 0.854902, 1, 1,
0.03131767, -1.376149, 1.985561, 0, 0.8509804, 1, 1,
0.03332506, 0.2400205, -0.6561858, 0, 0.8431373, 1, 1,
0.03417959, 0.9132284, -0.3463942, 0, 0.8392157, 1, 1,
0.03778708, 0.3915132, 0.5855426, 0, 0.8313726, 1, 1,
0.04030307, -1.077415, 3.200391, 0, 0.827451, 1, 1,
0.0404335, 0.2325493, 0.3447237, 0, 0.8196079, 1, 1,
0.04105135, -2.117711, 2.718863, 0, 0.8156863, 1, 1,
0.04258181, 0.8557371, -1.476541, 0, 0.8078431, 1, 1,
0.04726755, -1.213098, 2.609557, 0, 0.8039216, 1, 1,
0.04754073, 0.07699128, 0.7538082, 0, 0.7960784, 1, 1,
0.04886355, 1.089215, -0.5945116, 0, 0.7882353, 1, 1,
0.05425837, 0.7961906, 0.4417768, 0, 0.7843137, 1, 1,
0.05458678, 0.5016833, -0.07220838, 0, 0.7764706, 1, 1,
0.05522852, 1.122149, 0.9267532, 0, 0.772549, 1, 1,
0.06132888, 0.3576601, 2.417198, 0, 0.7647059, 1, 1,
0.06335565, 3.356137, -0.183347, 0, 0.7607843, 1, 1,
0.06450022, 1.838235, 1.084282, 0, 0.7529412, 1, 1,
0.06578512, 1.346105, 0.5035561, 0, 0.7490196, 1, 1,
0.06684433, 0.6790103, 1.77926, 0, 0.7411765, 1, 1,
0.07016522, -1.12218, 3.9216, 0, 0.7372549, 1, 1,
0.07021613, -0.9351071, 4.079054, 0, 0.7294118, 1, 1,
0.07587933, -0.6274165, 2.2818, 0, 0.7254902, 1, 1,
0.07633634, 0.03818132, 0.8487657, 0, 0.7176471, 1, 1,
0.08046257, 0.4797885, -0.2709754, 0, 0.7137255, 1, 1,
0.08143436, -0.04354459, 0.7784247, 0, 0.7058824, 1, 1,
0.08249871, 0.9192534, 0.9548651, 0, 0.6980392, 1, 1,
0.08301041, -0.5885046, 4.199949, 0, 0.6941177, 1, 1,
0.08726785, 1.041369, -0.7357492, 0, 0.6862745, 1, 1,
0.08978882, -0.7234026, 3.004521, 0, 0.682353, 1, 1,
0.09059554, -0.8009233, 3.645642, 0, 0.6745098, 1, 1,
0.09175901, 0.8637775, -0.2820943, 0, 0.6705883, 1, 1,
0.09285963, -0.7466173, 2.819244, 0, 0.6627451, 1, 1,
0.1059099, -0.9278543, 3.263175, 0, 0.6588235, 1, 1,
0.1070299, -0.73985, 2.123985, 0, 0.6509804, 1, 1,
0.1085867, -0.3442387, 2.683388, 0, 0.6470588, 1, 1,
0.1102494, -0.06227878, 2.840962, 0, 0.6392157, 1, 1,
0.110678, 2.250975, -0.2871641, 0, 0.6352941, 1, 1,
0.1130347, 0.4229992, -1.297604, 0, 0.627451, 1, 1,
0.1172397, -0.06612539, 1.796105, 0, 0.6235294, 1, 1,
0.1185526, -1.367934, 3.216911, 0, 0.6156863, 1, 1,
0.1222036, 0.5716289, -0.2033812, 0, 0.6117647, 1, 1,
0.1226289, 0.2930988, -0.05869202, 0, 0.6039216, 1, 1,
0.1238213, -0.2193712, 3.018929, 0, 0.5960785, 1, 1,
0.1254962, -0.1362108, 3.120559, 0, 0.5921569, 1, 1,
0.1370455, 0.2237696, 2.212457, 0, 0.5843138, 1, 1,
0.1377778, -0.6545065, 3.178517, 0, 0.5803922, 1, 1,
0.1389018, -0.1915891, 0.7867981, 0, 0.572549, 1, 1,
0.1390674, 0.8553914, -0.6304601, 0, 0.5686275, 1, 1,
0.1397669, 0.8553569, 1.945984, 0, 0.5607843, 1, 1,
0.1461022, 0.8205642, -0.4378419, 0, 0.5568628, 1, 1,
0.1461134, -0.4394282, 3.144758, 0, 0.5490196, 1, 1,
0.1493088, -0.7322571, 3.672245, 0, 0.5450981, 1, 1,
0.1562466, -0.9634435, 5.36228, 0, 0.5372549, 1, 1,
0.1636848, -2.716081, 3.758401, 0, 0.5333334, 1, 1,
0.165419, -1.743254, 2.399933, 0, 0.5254902, 1, 1,
0.1655117, 1.591293, 0.2326941, 0, 0.5215687, 1, 1,
0.1660628, -0.1561502, 3.606986, 0, 0.5137255, 1, 1,
0.1675517, -1.083735, 3.499525, 0, 0.509804, 1, 1,
0.1726489, 1.053947, -0.5238599, 0, 0.5019608, 1, 1,
0.1758571, -1.362929, 2.901726, 0, 0.4941176, 1, 1,
0.1763477, -2.266636, 1.691169, 0, 0.4901961, 1, 1,
0.1769354, 0.4890197, 0.8776044, 0, 0.4823529, 1, 1,
0.1818897, 2.513287, -0.4029613, 0, 0.4784314, 1, 1,
0.1822239, 0.509091, 0.382693, 0, 0.4705882, 1, 1,
0.1890875, -0.3649604, 2.052095, 0, 0.4666667, 1, 1,
0.1920276, 0.4884687, 0.8697518, 0, 0.4588235, 1, 1,
0.192575, -0.1813266, 3.077393, 0, 0.454902, 1, 1,
0.1940405, 2.417557, 0.5812652, 0, 0.4470588, 1, 1,
0.1954678, -1.963451, 3.861417, 0, 0.4431373, 1, 1,
0.1961973, -0.5252853, 4.35554, 0, 0.4352941, 1, 1,
0.1967131, 1.222413, 0.727766, 0, 0.4313726, 1, 1,
0.1993301, 0.4941814, 0.4325585, 0, 0.4235294, 1, 1,
0.2054981, -0.1145811, 0.2683748, 0, 0.4196078, 1, 1,
0.2106399, 1.236552, -1.193642, 0, 0.4117647, 1, 1,
0.211006, 2.603164, 0.7310262, 0, 0.4078431, 1, 1,
0.2118475, 0.1185351, 1.822206, 0, 0.4, 1, 1,
0.2118901, 0.9367373, 0.07892133, 0, 0.3921569, 1, 1,
0.2143768, -0.7968776, 2.51738, 0, 0.3882353, 1, 1,
0.2157773, 1.683528, 0.1713099, 0, 0.3803922, 1, 1,
0.216965, 0.8444039, 0.3399429, 0, 0.3764706, 1, 1,
0.2239755, -1.256547, 3.517362, 0, 0.3686275, 1, 1,
0.225296, -1.208565, 2.503911, 0, 0.3647059, 1, 1,
0.2261241, -0.8373676, 5.40777, 0, 0.3568628, 1, 1,
0.2296203, -1.871413, 2.874171, 0, 0.3529412, 1, 1,
0.2343016, 2.280768, -1.633624, 0, 0.345098, 1, 1,
0.2346543, -0.4566909, 3.011809, 0, 0.3411765, 1, 1,
0.236873, 0.6151764, 1.262508, 0, 0.3333333, 1, 1,
0.2373413, -0.3670791, 2.59467, 0, 0.3294118, 1, 1,
0.2412475, 1.505124, -0.1150777, 0, 0.3215686, 1, 1,
0.2444124, -0.2254409, 3.526286, 0, 0.3176471, 1, 1,
0.2483496, -0.7054988, 2.921392, 0, 0.3098039, 1, 1,
0.2485098, -0.4882986, 4.40493, 0, 0.3058824, 1, 1,
0.2502028, -1.285005, 2.674848, 0, 0.2980392, 1, 1,
0.2513307, 0.4971697, 1.764592, 0, 0.2901961, 1, 1,
0.252684, -1.254265, 2.168332, 0, 0.2862745, 1, 1,
0.2557951, 0.4175035, -0.06547891, 0, 0.2784314, 1, 1,
0.2566532, 0.5289569, 0.9623106, 0, 0.2745098, 1, 1,
0.2584556, 0.6909315, 0.03908845, 0, 0.2666667, 1, 1,
0.2621834, 1.427105, 0.06372508, 0, 0.2627451, 1, 1,
0.2645376, 1.080255, -0.569895, 0, 0.254902, 1, 1,
0.2664333, -1.134824, 2.038848, 0, 0.2509804, 1, 1,
0.2682034, 0.1712321, 0.7608548, 0, 0.2431373, 1, 1,
0.2712079, 0.1394062, 2.698003, 0, 0.2392157, 1, 1,
0.2716424, -0.9039766, 2.405376, 0, 0.2313726, 1, 1,
0.2737927, 0.4927541, 0.1851478, 0, 0.227451, 1, 1,
0.2743614, -2.479717, 4.763144, 0, 0.2196078, 1, 1,
0.2765094, 0.3142599, 0.9677166, 0, 0.2156863, 1, 1,
0.277322, -0.5822845, 2.461008, 0, 0.2078431, 1, 1,
0.2805827, 1.350481, 1.213575, 0, 0.2039216, 1, 1,
0.2817029, 0.5221965, 2.670407, 0, 0.1960784, 1, 1,
0.2826414, 0.02023329, -0.06556926, 0, 0.1882353, 1, 1,
0.2872539, -0.7006367, 2.630807, 0, 0.1843137, 1, 1,
0.2894458, 0.6922318, 1.220813, 0, 0.1764706, 1, 1,
0.2923822, 0.7223343, 2.525112, 0, 0.172549, 1, 1,
0.2993529, -0.1763853, 0.8512184, 0, 0.1647059, 1, 1,
0.3006197, 0.1973788, 0.3537245, 0, 0.1607843, 1, 1,
0.3015558, -0.1218368, 1.46789, 0, 0.1529412, 1, 1,
0.3058277, -0.7116721, 2.08356, 0, 0.1490196, 1, 1,
0.3128344, -1.611343, 3.135046, 0, 0.1411765, 1, 1,
0.3131773, 0.2316366, 0.8967866, 0, 0.1372549, 1, 1,
0.3164813, -0.8253676, 4.09366, 0, 0.1294118, 1, 1,
0.3165026, 0.3856605, -0.3094317, 0, 0.1254902, 1, 1,
0.3167981, -0.8917373, 3.610289, 0, 0.1176471, 1, 1,
0.3247017, 1.791833, 0.7932895, 0, 0.1137255, 1, 1,
0.3261912, -1.098215, 3.33018, 0, 0.1058824, 1, 1,
0.3383317, -1.991565, 3.508116, 0, 0.09803922, 1, 1,
0.3383405, -0.3936472, 2.146477, 0, 0.09411765, 1, 1,
0.3385566, 0.1911269, 0.7560689, 0, 0.08627451, 1, 1,
0.3411337, 0.6464913, 2.326252, 0, 0.08235294, 1, 1,
0.3424762, -0.7466246, 4.545667, 0, 0.07450981, 1, 1,
0.3456962, 0.4046624, 0.1620069, 0, 0.07058824, 1, 1,
0.3482388, 1.033662, 0.3751207, 0, 0.0627451, 1, 1,
0.3514161, -0.9948502, 3.067422, 0, 0.05882353, 1, 1,
0.3514575, 0.1792551, 1.295336, 0, 0.05098039, 1, 1,
0.3521384, -1.314345, 2.185702, 0, 0.04705882, 1, 1,
0.3564751, 2.111141, -0.8099784, 0, 0.03921569, 1, 1,
0.3577216, -1.50161, 3.683793, 0, 0.03529412, 1, 1,
0.3603093, 0.5212549, -0.6057937, 0, 0.02745098, 1, 1,
0.3660493, 1.491512, 2.321299, 0, 0.02352941, 1, 1,
0.3679413, -1.296966, -0.008498027, 0, 0.01568628, 1, 1,
0.3695675, -1.204103, 3.348322, 0, 0.01176471, 1, 1,
0.3699975, -1.52792, 2.304495, 0, 0.003921569, 1, 1,
0.3788764, 0.2164755, -0.6841578, 0.003921569, 0, 1, 1,
0.3814127, 0.5007027, 1.253768, 0.007843138, 0, 1, 1,
0.3823915, -0.2071026, 2.18786, 0.01568628, 0, 1, 1,
0.3830615, 1.229179, 0.3355289, 0.01960784, 0, 1, 1,
0.384385, -0.7697374, 4.78707, 0.02745098, 0, 1, 1,
0.3913432, -0.8083508, 2.422762, 0.03137255, 0, 1, 1,
0.3933305, -1.167338, 2.404378, 0.03921569, 0, 1, 1,
0.3979044, 0.4790331, 0.06678806, 0.04313726, 0, 1, 1,
0.4003105, -1.463359, 2.827515, 0.05098039, 0, 1, 1,
0.401634, 2.681967, -0.6690673, 0.05490196, 0, 1, 1,
0.4035077, 0.4539624, 0.5867696, 0.0627451, 0, 1, 1,
0.4106461, 1.330848, 1.497766, 0.06666667, 0, 1, 1,
0.4120616, 0.3101092, 0.06553103, 0.07450981, 0, 1, 1,
0.4131452, 2.0563, -0.632233, 0.07843138, 0, 1, 1,
0.4140945, -1.52729, 2.993342, 0.08627451, 0, 1, 1,
0.4142249, 2.020892, 2.029577, 0.09019608, 0, 1, 1,
0.4151734, 0.5576525, 0.827911, 0.09803922, 0, 1, 1,
0.428842, 0.750639, 1.406324, 0.1058824, 0, 1, 1,
0.4314971, -0.5041543, 2.729526, 0.1098039, 0, 1, 1,
0.4325725, 0.4303647, 2.908702, 0.1176471, 0, 1, 1,
0.4368736, 1.003902, 0.7905673, 0.1215686, 0, 1, 1,
0.436936, 0.9422749, -0.6678728, 0.1294118, 0, 1, 1,
0.4455668, -0.8835896, 4.421579, 0.1333333, 0, 1, 1,
0.4459378, 0.182799, 1.871891, 0.1411765, 0, 1, 1,
0.4601175, -0.2422172, 1.397698, 0.145098, 0, 1, 1,
0.462648, 0.5010388, 0.8143728, 0.1529412, 0, 1, 1,
0.4640995, 1.265436, 0.4681477, 0.1568628, 0, 1, 1,
0.4647099, -0.4537559, 2.022321, 0.1647059, 0, 1, 1,
0.4683196, -0.4531983, 1.663229, 0.1686275, 0, 1, 1,
0.4699642, -0.330122, 0.9385137, 0.1764706, 0, 1, 1,
0.4756247, -0.6592079, 1.914767, 0.1803922, 0, 1, 1,
0.4810043, -0.4297062, 2.149624, 0.1882353, 0, 1, 1,
0.4828426, 0.08955471, 1.51019, 0.1921569, 0, 1, 1,
0.4837642, -0.4050869, 1.157335, 0.2, 0, 1, 1,
0.4863067, -0.08905671, 2.278367, 0.2078431, 0, 1, 1,
0.4946574, -1.329875, 3.087936, 0.2117647, 0, 1, 1,
0.4995657, -0.5196087, 4.149121, 0.2196078, 0, 1, 1,
0.5000407, -0.9059305, 3.624834, 0.2235294, 0, 1, 1,
0.5009706, -0.9329526, 3.959366, 0.2313726, 0, 1, 1,
0.5066677, 0.197591, 1.987349, 0.2352941, 0, 1, 1,
0.5093664, -0.7749314, 3.617593, 0.2431373, 0, 1, 1,
0.5166098, 0.455654, -0.1189234, 0.2470588, 0, 1, 1,
0.523239, -0.8161923, 0.978943, 0.254902, 0, 1, 1,
0.5239847, -0.8910274, 3.26206, 0.2588235, 0, 1, 1,
0.5264387, 0.3633598, 0.7816101, 0.2666667, 0, 1, 1,
0.5271021, 1.352658, 1.873467, 0.2705882, 0, 1, 1,
0.5281412, -0.7399939, 3.155569, 0.2784314, 0, 1, 1,
0.5292701, -0.5914574, 1.866559, 0.282353, 0, 1, 1,
0.5327383, 1.109169, 1.31873, 0.2901961, 0, 1, 1,
0.5344092, -0.05747005, 0.3098846, 0.2941177, 0, 1, 1,
0.5361821, 0.7950283, -0.0111705, 0.3019608, 0, 1, 1,
0.5387964, 2.03095, -0.1499557, 0.3098039, 0, 1, 1,
0.5388181, 0.5614419, -2.136767, 0.3137255, 0, 1, 1,
0.5390425, 0.0315681, 1.343314, 0.3215686, 0, 1, 1,
0.5392623, -0.7833109, 2.695389, 0.3254902, 0, 1, 1,
0.5408427, -1.102102, 3.587822, 0.3333333, 0, 1, 1,
0.5424671, 0.7067119, 0.3329287, 0.3372549, 0, 1, 1,
0.5450081, 0.1809913, 2.663622, 0.345098, 0, 1, 1,
0.5474415, 0.7979161, 1.040577, 0.3490196, 0, 1, 1,
0.5479448, 1.100056, 1.502524, 0.3568628, 0, 1, 1,
0.5523638, 0.5755896, 1.865203, 0.3607843, 0, 1, 1,
0.5610961, 1.174984, 1.110639, 0.3686275, 0, 1, 1,
0.5645923, -1.50329, 2.988065, 0.372549, 0, 1, 1,
0.5703688, -1.076379, 2.747505, 0.3803922, 0, 1, 1,
0.5712897, -1.358523, 3.616234, 0.3843137, 0, 1, 1,
0.5829197, -0.1386869, 1.919344, 0.3921569, 0, 1, 1,
0.5839417, -1.075281, 2.045989, 0.3960784, 0, 1, 1,
0.5849307, -0.644861, 3.051446, 0.4039216, 0, 1, 1,
0.5888177, 0.7145, 1.639263, 0.4117647, 0, 1, 1,
0.5914971, -0.522536, 2.924605, 0.4156863, 0, 1, 1,
0.5917916, 1.82118, 0.2507765, 0.4235294, 0, 1, 1,
0.5920552, 0.4731776, 1.16731, 0.427451, 0, 1, 1,
0.6025724, 0.6840916, 0.184698, 0.4352941, 0, 1, 1,
0.6028875, -0.3969188, 0.821753, 0.4392157, 0, 1, 1,
0.6079978, -0.5516699, 3.255585, 0.4470588, 0, 1, 1,
0.6086634, 0.5634753, 2.070765, 0.4509804, 0, 1, 1,
0.6145399, -0.02732702, 1.002383, 0.4588235, 0, 1, 1,
0.6161392, -1.704978, 0.5300986, 0.4627451, 0, 1, 1,
0.6205596, -0.5625103, 2.494314, 0.4705882, 0, 1, 1,
0.6239263, -0.2797796, 1.384418, 0.4745098, 0, 1, 1,
0.6250076, 0.5213608, 1.575887, 0.4823529, 0, 1, 1,
0.6265225, -1.055638, 2.618824, 0.4862745, 0, 1, 1,
0.6275694, -0.1732436, 2.453325, 0.4941176, 0, 1, 1,
0.6288285, -0.3151194, 2.735929, 0.5019608, 0, 1, 1,
0.6310225, -0.9527152, 2.187825, 0.5058824, 0, 1, 1,
0.6332107, 0.4062305, -0.03400453, 0.5137255, 0, 1, 1,
0.6338534, 1.247532, 1.189628, 0.5176471, 0, 1, 1,
0.6364788, 0.4113476, 2.02009, 0.5254902, 0, 1, 1,
0.6382511, -0.463006, 1.948667, 0.5294118, 0, 1, 1,
0.639439, -1.641298, 2.270612, 0.5372549, 0, 1, 1,
0.6407396, -0.9178904, 0.9872759, 0.5411765, 0, 1, 1,
0.6407539, -1.262865, 3.139553, 0.5490196, 0, 1, 1,
0.6417665, -0.932916, 2.769886, 0.5529412, 0, 1, 1,
0.6458588, -0.3744712, 1.398099, 0.5607843, 0, 1, 1,
0.6500036, 0.1454006, 0.0835661, 0.5647059, 0, 1, 1,
0.6610253, 0.8907413, -1.092953, 0.572549, 0, 1, 1,
0.6642003, 1.895954, 0.2990972, 0.5764706, 0, 1, 1,
0.6680253, -1.075655, 1.686399, 0.5843138, 0, 1, 1,
0.668799, 0.2705035, 0.7318792, 0.5882353, 0, 1, 1,
0.6743704, 1.295949, 0.02048712, 0.5960785, 0, 1, 1,
0.6758991, 0.6409971, 1.843468, 0.6039216, 0, 1, 1,
0.6781511, -0.6533913, 1.340525, 0.6078432, 0, 1, 1,
0.6840312, 1.071709, 0.4184378, 0.6156863, 0, 1, 1,
0.6886006, 0.7527362, -1.18194, 0.6196079, 0, 1, 1,
0.6915868, -0.02488979, 0.8684903, 0.627451, 0, 1, 1,
0.7073824, 1.172511, 0.07916684, 0.6313726, 0, 1, 1,
0.7073869, -2.592635, 1.059131, 0.6392157, 0, 1, 1,
0.7107604, 0.2636889, 0.354472, 0.6431373, 0, 1, 1,
0.7120661, 1.799118, 0.4556539, 0.6509804, 0, 1, 1,
0.7150078, -0.5436605, 3.345608, 0.654902, 0, 1, 1,
0.7188432, 0.639125, 0.497541, 0.6627451, 0, 1, 1,
0.7240465, 0.2657149, 0.7665378, 0.6666667, 0, 1, 1,
0.7240714, -1.162468, 3.278764, 0.6745098, 0, 1, 1,
0.7317315, -0.09350213, 2.234598, 0.6784314, 0, 1, 1,
0.7327328, 1.148262, 2.412653, 0.6862745, 0, 1, 1,
0.7348294, 0.3634522, -0.8281516, 0.6901961, 0, 1, 1,
0.7368582, 1.265292, 1.344396, 0.6980392, 0, 1, 1,
0.7475004, 1.442601, 0.3018088, 0.7058824, 0, 1, 1,
0.7544965, -0.5013129, 3.094096, 0.7098039, 0, 1, 1,
0.7581492, -0.206999, 2.906304, 0.7176471, 0, 1, 1,
0.7593207, -0.727942, 1.561133, 0.7215686, 0, 1, 1,
0.7595736, -0.1381353, 2.369454, 0.7294118, 0, 1, 1,
0.7610316, 0.2890425, -0.3723333, 0.7333333, 0, 1, 1,
0.7690826, 0.07108537, 0.8923752, 0.7411765, 0, 1, 1,
0.7751458, -2.360919, 0.2295899, 0.7450981, 0, 1, 1,
0.7759115, 0.9686425, 2.81831, 0.7529412, 0, 1, 1,
0.7788591, -0.588732, 2.755851, 0.7568628, 0, 1, 1,
0.7794906, 0.5081224, 0.8642767, 0.7647059, 0, 1, 1,
0.7806004, 0.6816468, 0.06076275, 0.7686275, 0, 1, 1,
0.785724, 0.3677932, -0.7334567, 0.7764706, 0, 1, 1,
0.7892699, 0.7094852, 0.03982693, 0.7803922, 0, 1, 1,
0.7946074, 1.455254, 1.61814, 0.7882353, 0, 1, 1,
0.8076092, 0.4631644, 0.4272949, 0.7921569, 0, 1, 1,
0.8095667, -0.129023, 2.469911, 0.8, 0, 1, 1,
0.8117548, -0.3491521, 0.769402, 0.8078431, 0, 1, 1,
0.8178967, 0.364347, 1.328403, 0.8117647, 0, 1, 1,
0.8223075, 0.929217, 1.579995, 0.8196079, 0, 1, 1,
0.8252963, -0.1632089, 2.643678, 0.8235294, 0, 1, 1,
0.8260741, -0.8832136, 1.059879, 0.8313726, 0, 1, 1,
0.8275588, 0.002899125, 2.250086, 0.8352941, 0, 1, 1,
0.8286488, 0.8596293, 0.06397125, 0.8431373, 0, 1, 1,
0.8299974, 0.4321925, 0.3746091, 0.8470588, 0, 1, 1,
0.8370304, -1.822897, 2.604672, 0.854902, 0, 1, 1,
0.8381948, -0.6231533, 2.56415, 0.8588235, 0, 1, 1,
0.8397991, 0.2215758, 1.818455, 0.8666667, 0, 1, 1,
0.8419564, -0.5542516, 3.965446, 0.8705882, 0, 1, 1,
0.8456726, 1.006189, 0.8990179, 0.8784314, 0, 1, 1,
0.8498892, 0.03066311, 1.429762, 0.8823529, 0, 1, 1,
0.8562545, 1.550285, 1.39275, 0.8901961, 0, 1, 1,
0.8688796, -0.3940386, 2.032702, 0.8941177, 0, 1, 1,
0.8753023, -1.611047, 2.876155, 0.9019608, 0, 1, 1,
0.8763451, -0.7711256, 0.7927591, 0.9098039, 0, 1, 1,
0.8776416, 0.204323, 0.6678026, 0.9137255, 0, 1, 1,
0.8830528, 2.30247, 1.084445, 0.9215686, 0, 1, 1,
0.8831907, -0.6804457, 2.093487, 0.9254902, 0, 1, 1,
0.889325, 1.792352, 0.2958445, 0.9333333, 0, 1, 1,
0.9017869, -0.3082855, 1.323105, 0.9372549, 0, 1, 1,
0.901938, -0.01508329, 1.493638, 0.945098, 0, 1, 1,
0.9019598, -0.8105912, 2.769181, 0.9490196, 0, 1, 1,
0.9030023, -1.016125, 4.785698, 0.9568627, 0, 1, 1,
0.9052025, 0.6735278, 0.009438897, 0.9607843, 0, 1, 1,
0.9087933, 0.07182877, 0.8260689, 0.9686275, 0, 1, 1,
0.9162049, 0.6889179, -0.9782792, 0.972549, 0, 1, 1,
0.9186347, 0.1028771, 0.5534221, 0.9803922, 0, 1, 1,
0.9229736, 0.831524, -0.09581875, 0.9843137, 0, 1, 1,
0.9234809, -0.8718665, 2.408396, 0.9921569, 0, 1, 1,
0.9270715, -0.4629696, 0.8295384, 0.9960784, 0, 1, 1,
0.927111, 0.9482914, 0.6850277, 1, 0, 0.9960784, 1,
0.9289765, -0.9938743, 2.428475, 1, 0, 0.9882353, 1,
0.9307418, -1.235583, 1.313504, 1, 0, 0.9843137, 1,
0.932921, 1.605238, -2.163453, 1, 0, 0.9764706, 1,
0.9347103, 0.6871552, 1.404441, 1, 0, 0.972549, 1,
0.9437991, -0.4891024, 1.656153, 1, 0, 0.9647059, 1,
0.9440248, 0.04902951, 0.5168033, 1, 0, 0.9607843, 1,
0.9527286, -1.284862, 0.710238, 1, 0, 0.9529412, 1,
0.9634597, -0.1674452, 0.9899182, 1, 0, 0.9490196, 1,
0.9691654, 0.7213487, 2.71351, 1, 0, 0.9411765, 1,
0.9709225, 2.319777, -0.305394, 1, 0, 0.9372549, 1,
0.9728838, 0.1685364, 2.191742, 1, 0, 0.9294118, 1,
0.9742833, 0.8839352, 2.360458, 1, 0, 0.9254902, 1,
0.9751043, -0.6724966, 3.737683, 1, 0, 0.9176471, 1,
0.9755021, -0.9704906, 2.119961, 1, 0, 0.9137255, 1,
0.9788618, 0.01686516, 2.2793, 1, 0, 0.9058824, 1,
0.9790081, 0.9327991, 0.9359229, 1, 0, 0.9019608, 1,
0.979903, -1.376983, 4.595361, 1, 0, 0.8941177, 1,
0.9881852, -1.47766, 2.497445, 1, 0, 0.8862745, 1,
1.000658, 0.2765881, 2.913132, 1, 0, 0.8823529, 1,
1.011893, -0.1465661, 3.011258, 1, 0, 0.8745098, 1,
1.01248, 0.09793737, 0.3164925, 1, 0, 0.8705882, 1,
1.017626, -0.2133466, 0.9582486, 1, 0, 0.8627451, 1,
1.017765, 0.2140274, 3.609477, 1, 0, 0.8588235, 1,
1.022018, -0.006772929, 2.794348, 1, 0, 0.8509804, 1,
1.022258, -0.8050647, 1.823964, 1, 0, 0.8470588, 1,
1.026931, 2.373496, 1.359423, 1, 0, 0.8392157, 1,
1.032751, 0.379334, -0.7002991, 1, 0, 0.8352941, 1,
1.038491, -0.1667344, 1.972403, 1, 0, 0.827451, 1,
1.043932, 1.546846, -0.3262874, 1, 0, 0.8235294, 1,
1.045354, 0.1201995, 1.001972, 1, 0, 0.8156863, 1,
1.046788, 0.1208915, 1.066467, 1, 0, 0.8117647, 1,
1.050949, 0.3560053, 2.672949, 1, 0, 0.8039216, 1,
1.051003, 0.5568041, 0.8809758, 1, 0, 0.7960784, 1,
1.052967, 0.6640591, 1.16829, 1, 0, 0.7921569, 1,
1.057434, 0.313204, 1.605824, 1, 0, 0.7843137, 1,
1.066083, 0.3951084, 1.05084, 1, 0, 0.7803922, 1,
1.06904, 0.2834897, 0.5201591, 1, 0, 0.772549, 1,
1.075159, 0.2434456, 0.552406, 1, 0, 0.7686275, 1,
1.077587, 0.2243178, 0.9769726, 1, 0, 0.7607843, 1,
1.083757, 0.2898714, 0.3925831, 1, 0, 0.7568628, 1,
1.090383, -0.3606491, 2.447454, 1, 0, 0.7490196, 1,
1.092154, 1.046591, -0.943842, 1, 0, 0.7450981, 1,
1.096759, -0.1641663, 0.208378, 1, 0, 0.7372549, 1,
1.101176, -1.965591, 2.587733, 1, 0, 0.7333333, 1,
1.101667, 0.4852234, 1.26213, 1, 0, 0.7254902, 1,
1.105028, -1.253351, 3.75504, 1, 0, 0.7215686, 1,
1.106955, -0.6535466, 2.442681, 1, 0, 0.7137255, 1,
1.111034, 1.555385, 1.045049, 1, 0, 0.7098039, 1,
1.115238, 0.6014799, -0.7405434, 1, 0, 0.7019608, 1,
1.12716, 0.04862287, 1.200388, 1, 0, 0.6941177, 1,
1.128747, -1.05277, 0.9774191, 1, 0, 0.6901961, 1,
1.136137, -2.213029, 1.936602, 1, 0, 0.682353, 1,
1.14503, 0.3360991, 1.28141, 1, 0, 0.6784314, 1,
1.165236, 0.3774337, 1.490006, 1, 0, 0.6705883, 1,
1.173101, -0.206612, 1.419726, 1, 0, 0.6666667, 1,
1.175066, -0.7237039, 3.52014, 1, 0, 0.6588235, 1,
1.178965, 0.2622965, 1.854525, 1, 0, 0.654902, 1,
1.191807, -0.338802, 1.378379, 1, 0, 0.6470588, 1,
1.196071, 1.161139, -0.4045327, 1, 0, 0.6431373, 1,
1.199386, -0.4425447, 2.913845, 1, 0, 0.6352941, 1,
1.199929, -0.4343324, 0.7705864, 1, 0, 0.6313726, 1,
1.202462, -1.116349, 4.007443, 1, 0, 0.6235294, 1,
1.20516, -0.4980289, 1.986974, 1, 0, 0.6196079, 1,
1.208375, -0.497016, 1.789093, 1, 0, 0.6117647, 1,
1.216343, 0.3275405, 0.6892937, 1, 0, 0.6078432, 1,
1.233176, 1.043078, 1.698328, 1, 0, 0.6, 1,
1.233954, -0.3552507, 1.069072, 1, 0, 0.5921569, 1,
1.239411, -1.18996, 4.158909, 1, 0, 0.5882353, 1,
1.240424, 0.2636261, 1.808827, 1, 0, 0.5803922, 1,
1.250145, -1.255768, 2.454932, 1, 0, 0.5764706, 1,
1.254206, 0.6215289, -0.571496, 1, 0, 0.5686275, 1,
1.25791, 0.823625, 0.8913909, 1, 0, 0.5647059, 1,
1.269731, 1.50691, 0.4424689, 1, 0, 0.5568628, 1,
1.270274, 0.4599687, 0.08417112, 1, 0, 0.5529412, 1,
1.277099, -0.4221977, 2.275017, 1, 0, 0.5450981, 1,
1.282276, -1.614201, 4.799469, 1, 0, 0.5411765, 1,
1.301216, 0.5409505, 2.16617, 1, 0, 0.5333334, 1,
1.301277, 1.533269, 0.7919721, 1, 0, 0.5294118, 1,
1.303463, -1.243399, 1.859097, 1, 0, 0.5215687, 1,
1.305627, 0.4502965, 1.357387, 1, 0, 0.5176471, 1,
1.317686, -2.123416, 2.763882, 1, 0, 0.509804, 1,
1.336377, 0.3342203, 2.381737, 1, 0, 0.5058824, 1,
1.338294, -0.08126464, 0.869535, 1, 0, 0.4980392, 1,
1.353862, -0.9699727, 1.895457, 1, 0, 0.4901961, 1,
1.372776, -0.1991248, 0.6621258, 1, 0, 0.4862745, 1,
1.383615, 0.8331705, 1.557496, 1, 0, 0.4784314, 1,
1.389071, 3.963662, 0.247706, 1, 0, 0.4745098, 1,
1.408175, -0.4673163, 2.317294, 1, 0, 0.4666667, 1,
1.42093, -0.3946399, 2.879037, 1, 0, 0.4627451, 1,
1.422346, -0.1815893, 1.996009, 1, 0, 0.454902, 1,
1.423055, 1.040083, 1.191877, 1, 0, 0.4509804, 1,
1.423606, 0.7952792, 2.122787, 1, 0, 0.4431373, 1,
1.445697, 0.02060976, 2.993088, 1, 0, 0.4392157, 1,
1.45322, -0.9501002, 2.018835, 1, 0, 0.4313726, 1,
1.453615, 1.160148, -0.7571999, 1, 0, 0.427451, 1,
1.457374, -0.06451986, 3.19937, 1, 0, 0.4196078, 1,
1.457466, -0.953336, 1.820113, 1, 0, 0.4156863, 1,
1.466114, 0.02672848, 1.462763, 1, 0, 0.4078431, 1,
1.470125, -1.154602, 2.462486, 1, 0, 0.4039216, 1,
1.478261, -1.009957, 3.177496, 1, 0, 0.3960784, 1,
1.479828, -0.0431089, 1.671948, 1, 0, 0.3882353, 1,
1.481481, 1.81288, 1.440068, 1, 0, 0.3843137, 1,
1.50503, -0.05730534, -0.3038129, 1, 0, 0.3764706, 1,
1.515636, 0.7454821, 1.348034, 1, 0, 0.372549, 1,
1.528657, 1.517624, 1.411654, 1, 0, 0.3647059, 1,
1.541375, -0.2844183, 2.28196, 1, 0, 0.3607843, 1,
1.544933, -1.306534, 2.285099, 1, 0, 0.3529412, 1,
1.546847, -0.04508163, 2.710092, 1, 0, 0.3490196, 1,
1.555396, 0.4631675, 0.520873, 1, 0, 0.3411765, 1,
1.560271, -0.1015582, 2.989979, 1, 0, 0.3372549, 1,
1.560682, 1.579791, 1.479951, 1, 0, 0.3294118, 1,
1.570203, -0.392321, -0.03302368, 1, 0, 0.3254902, 1,
1.583049, -0.8306282, 1.338337, 1, 0, 0.3176471, 1,
1.58328, -0.08694862, 2.676513, 1, 0, 0.3137255, 1,
1.613716, 1.341564, 0.8016632, 1, 0, 0.3058824, 1,
1.638604, -1.658288, 1.411635, 1, 0, 0.2980392, 1,
1.639694, -0.5773507, 0.8903876, 1, 0, 0.2941177, 1,
1.649048, 0.8063941, 0.790395, 1, 0, 0.2862745, 1,
1.663401, -0.1585374, 2.062499, 1, 0, 0.282353, 1,
1.671142, -0.6292751, 0.8839551, 1, 0, 0.2745098, 1,
1.700542, 1.70347, 0.4367773, 1, 0, 0.2705882, 1,
1.703955, 0.587124, 0.8507972, 1, 0, 0.2627451, 1,
1.724904, 0.06047406, 1.301207, 1, 0, 0.2588235, 1,
1.748411, 0.545358, 3.222688, 1, 0, 0.2509804, 1,
1.806481, -0.234962, 2.806906, 1, 0, 0.2470588, 1,
1.825894, 1.359297, 1.461664, 1, 0, 0.2392157, 1,
1.851453, -0.4178535, 1.274242, 1, 0, 0.2352941, 1,
1.860948, -0.607845, 2.752693, 1, 0, 0.227451, 1,
1.86099, -1.281867, 2.574447, 1, 0, 0.2235294, 1,
1.874913, -0.3303865, 2.895613, 1, 0, 0.2156863, 1,
1.880812, 0.6946471, 1.970103, 1, 0, 0.2117647, 1,
1.914619, 0.507315, 0.7534381, 1, 0, 0.2039216, 1,
1.93967, -0.4552607, 1.155393, 1, 0, 0.1960784, 1,
1.947669, -0.4379971, 2.472006, 1, 0, 0.1921569, 1,
1.975566, -0.5548915, 1.019829, 1, 0, 0.1843137, 1,
1.982482, 0.8926589, 1.815766, 1, 0, 0.1803922, 1,
1.996715, 1.690253, 0.2685425, 1, 0, 0.172549, 1,
2.005571, 0.8655331, -0.5881107, 1, 0, 0.1686275, 1,
2.007908, -0.1038706, 2.771194, 1, 0, 0.1607843, 1,
2.00876, 0.628313, 1.244103, 1, 0, 0.1568628, 1,
2.010786, -0.2068554, 1.973198, 1, 0, 0.1490196, 1,
2.011319, -1.429599, 1.853893, 1, 0, 0.145098, 1,
2.033038, -2.027931, 2.365132, 1, 0, 0.1372549, 1,
2.065745, 0.5892513, 0.6298379, 1, 0, 0.1333333, 1,
2.068956, 0.02090307, 2.632951, 1, 0, 0.1254902, 1,
2.087933, 0.4827403, 1.39056, 1, 0, 0.1215686, 1,
2.105936, -1.987376, 1.914621, 1, 0, 0.1137255, 1,
2.114908, -2.024291, 2.332063, 1, 0, 0.1098039, 1,
2.132829, -1.890825, 2.590194, 1, 0, 0.1019608, 1,
2.143767, -0.8386791, 1.276688, 1, 0, 0.09411765, 1,
2.171072, -0.605065, 1.268318, 1, 0, 0.09019608, 1,
2.175491, -0.5943424, 2.006794, 1, 0, 0.08235294, 1,
2.194594, -1.819372, 2.817734, 1, 0, 0.07843138, 1,
2.250357, -1.107873, 1.965926, 1, 0, 0.07058824, 1,
2.271865, 0.754658, 0.9885937, 1, 0, 0.06666667, 1,
2.277133, -0.1566722, 0.2518358, 1, 0, 0.05882353, 1,
2.321198, 1.745609, 2.61466, 1, 0, 0.05490196, 1,
2.334494, 0.7301905, 0.0316023, 1, 0, 0.04705882, 1,
2.353785, 0.888369, -0.4614729, 1, 0, 0.04313726, 1,
2.389024, 0.3797818, 2.140226, 1, 0, 0.03529412, 1,
2.442567, 0.3532831, 2.168709, 1, 0, 0.03137255, 1,
2.448578, 0.04251567, 2.608526, 1, 0, 0.02352941, 1,
2.543581, 0.7252391, 2.174513, 1, 0, 0.01960784, 1,
2.570458, -1.364543, 3.052354, 1, 0, 0.01176471, 1,
3.247741, -0.5283899, 1.839183, 1, 0, 0.007843138, 1
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
-0.2172171, -4.198464, -7.914864, 0, -0.5, 0.5, 0.5,
-0.2172171, -4.198464, -7.914864, 1, -0.5, 0.5, 0.5,
-0.2172171, -4.198464, -7.914864, 1, 1.5, 0.5, 0.5,
-0.2172171, -4.198464, -7.914864, 0, 1.5, 0.5, 0.5
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
-4.856797, 0.4740824, -7.914864, 0, -0.5, 0.5, 0.5,
-4.856797, 0.4740824, -7.914864, 1, -0.5, 0.5, 0.5,
-4.856797, 0.4740824, -7.914864, 1, 1.5, 0.5, 0.5,
-4.856797, 0.4740824, -7.914864, 0, 1.5, 0.5, 0.5
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
-4.856797, -4.198464, -0.2880974, 0, -0.5, 0.5, 0.5,
-4.856797, -4.198464, -0.2880974, 1, -0.5, 0.5, 0.5,
-4.856797, -4.198464, -0.2880974, 1, 1.5, 0.5, 0.5,
-4.856797, -4.198464, -0.2880974, 0, 1.5, 0.5, 0.5
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
-3, -3.120184, -6.15484,
3, -3.120184, -6.15484,
-3, -3.120184, -6.15484,
-3, -3.299898, -6.448178,
-2, -3.120184, -6.15484,
-2, -3.299898, -6.448178,
-1, -3.120184, -6.15484,
-1, -3.299898, -6.448178,
0, -3.120184, -6.15484,
0, -3.299898, -6.448178,
1, -3.120184, -6.15484,
1, -3.299898, -6.448178,
2, -3.120184, -6.15484,
2, -3.299898, -6.448178,
3, -3.120184, -6.15484,
3, -3.299898, -6.448178
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
-3, -3.659324, -7.034852, 0, -0.5, 0.5, 0.5,
-3, -3.659324, -7.034852, 1, -0.5, 0.5, 0.5,
-3, -3.659324, -7.034852, 1, 1.5, 0.5, 0.5,
-3, -3.659324, -7.034852, 0, 1.5, 0.5, 0.5,
-2, -3.659324, -7.034852, 0, -0.5, 0.5, 0.5,
-2, -3.659324, -7.034852, 1, -0.5, 0.5, 0.5,
-2, -3.659324, -7.034852, 1, 1.5, 0.5, 0.5,
-2, -3.659324, -7.034852, 0, 1.5, 0.5, 0.5,
-1, -3.659324, -7.034852, 0, -0.5, 0.5, 0.5,
-1, -3.659324, -7.034852, 1, -0.5, 0.5, 0.5,
-1, -3.659324, -7.034852, 1, 1.5, 0.5, 0.5,
-1, -3.659324, -7.034852, 0, 1.5, 0.5, 0.5,
0, -3.659324, -7.034852, 0, -0.5, 0.5, 0.5,
0, -3.659324, -7.034852, 1, -0.5, 0.5, 0.5,
0, -3.659324, -7.034852, 1, 1.5, 0.5, 0.5,
0, -3.659324, -7.034852, 0, 1.5, 0.5, 0.5,
1, -3.659324, -7.034852, 0, -0.5, 0.5, 0.5,
1, -3.659324, -7.034852, 1, -0.5, 0.5, 0.5,
1, -3.659324, -7.034852, 1, 1.5, 0.5, 0.5,
1, -3.659324, -7.034852, 0, 1.5, 0.5, 0.5,
2, -3.659324, -7.034852, 0, -0.5, 0.5, 0.5,
2, -3.659324, -7.034852, 1, -0.5, 0.5, 0.5,
2, -3.659324, -7.034852, 1, 1.5, 0.5, 0.5,
2, -3.659324, -7.034852, 0, 1.5, 0.5, 0.5,
3, -3.659324, -7.034852, 0, -0.5, 0.5, 0.5,
3, -3.659324, -7.034852, 1, -0.5, 0.5, 0.5,
3, -3.659324, -7.034852, 1, 1.5, 0.5, 0.5,
3, -3.659324, -7.034852, 0, 1.5, 0.5, 0.5
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
-3.786124, -3, -6.15484,
-3.786124, 3, -6.15484,
-3.786124, -3, -6.15484,
-3.96457, -3, -6.448178,
-3.786124, -2, -6.15484,
-3.96457, -2, -6.448178,
-3.786124, -1, -6.15484,
-3.96457, -1, -6.448178,
-3.786124, 0, -6.15484,
-3.96457, 0, -6.448178,
-3.786124, 1, -6.15484,
-3.96457, 1, -6.448178,
-3.786124, 2, -6.15484,
-3.96457, 2, -6.448178,
-3.786124, 3, -6.15484,
-3.96457, 3, -6.448178
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
-4.321461, -3, -7.034852, 0, -0.5, 0.5, 0.5,
-4.321461, -3, -7.034852, 1, -0.5, 0.5, 0.5,
-4.321461, -3, -7.034852, 1, 1.5, 0.5, 0.5,
-4.321461, -3, -7.034852, 0, 1.5, 0.5, 0.5,
-4.321461, -2, -7.034852, 0, -0.5, 0.5, 0.5,
-4.321461, -2, -7.034852, 1, -0.5, 0.5, 0.5,
-4.321461, -2, -7.034852, 1, 1.5, 0.5, 0.5,
-4.321461, -2, -7.034852, 0, 1.5, 0.5, 0.5,
-4.321461, -1, -7.034852, 0, -0.5, 0.5, 0.5,
-4.321461, -1, -7.034852, 1, -0.5, 0.5, 0.5,
-4.321461, -1, -7.034852, 1, 1.5, 0.5, 0.5,
-4.321461, -1, -7.034852, 0, 1.5, 0.5, 0.5,
-4.321461, 0, -7.034852, 0, -0.5, 0.5, 0.5,
-4.321461, 0, -7.034852, 1, -0.5, 0.5, 0.5,
-4.321461, 0, -7.034852, 1, 1.5, 0.5, 0.5,
-4.321461, 0, -7.034852, 0, 1.5, 0.5, 0.5,
-4.321461, 1, -7.034852, 0, -0.5, 0.5, 0.5,
-4.321461, 1, -7.034852, 1, -0.5, 0.5, 0.5,
-4.321461, 1, -7.034852, 1, 1.5, 0.5, 0.5,
-4.321461, 1, -7.034852, 0, 1.5, 0.5, 0.5,
-4.321461, 2, -7.034852, 0, -0.5, 0.5, 0.5,
-4.321461, 2, -7.034852, 1, -0.5, 0.5, 0.5,
-4.321461, 2, -7.034852, 1, 1.5, 0.5, 0.5,
-4.321461, 2, -7.034852, 0, 1.5, 0.5, 0.5,
-4.321461, 3, -7.034852, 0, -0.5, 0.5, 0.5,
-4.321461, 3, -7.034852, 1, -0.5, 0.5, 0.5,
-4.321461, 3, -7.034852, 1, 1.5, 0.5, 0.5,
-4.321461, 3, -7.034852, 0, 1.5, 0.5, 0.5
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
-3.786124, -3.120184, -4,
-3.786124, -3.120184, 4,
-3.786124, -3.120184, -4,
-3.96457, -3.299898, -4,
-3.786124, -3.120184, -2,
-3.96457, -3.299898, -2,
-3.786124, -3.120184, 0,
-3.96457, -3.299898, 0,
-3.786124, -3.120184, 2,
-3.96457, -3.299898, 2,
-3.786124, -3.120184, 4,
-3.96457, -3.299898, 4
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
-4.321461, -3.659324, -4, 0, -0.5, 0.5, 0.5,
-4.321461, -3.659324, -4, 1, -0.5, 0.5, 0.5,
-4.321461, -3.659324, -4, 1, 1.5, 0.5, 0.5,
-4.321461, -3.659324, -4, 0, 1.5, 0.5, 0.5,
-4.321461, -3.659324, -2, 0, -0.5, 0.5, 0.5,
-4.321461, -3.659324, -2, 1, -0.5, 0.5, 0.5,
-4.321461, -3.659324, -2, 1, 1.5, 0.5, 0.5,
-4.321461, -3.659324, -2, 0, 1.5, 0.5, 0.5,
-4.321461, -3.659324, 0, 0, -0.5, 0.5, 0.5,
-4.321461, -3.659324, 0, 1, -0.5, 0.5, 0.5,
-4.321461, -3.659324, 0, 1, 1.5, 0.5, 0.5,
-4.321461, -3.659324, 0, 0, 1.5, 0.5, 0.5,
-4.321461, -3.659324, 2, 0, -0.5, 0.5, 0.5,
-4.321461, -3.659324, 2, 1, -0.5, 0.5, 0.5,
-4.321461, -3.659324, 2, 1, 1.5, 0.5, 0.5,
-4.321461, -3.659324, 2, 0, 1.5, 0.5, 0.5,
-4.321461, -3.659324, 4, 0, -0.5, 0.5, 0.5,
-4.321461, -3.659324, 4, 1, -0.5, 0.5, 0.5,
-4.321461, -3.659324, 4, 1, 1.5, 0.5, 0.5,
-4.321461, -3.659324, 4, 0, 1.5, 0.5, 0.5
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
-3.786124, -3.120184, -6.15484,
-3.786124, 4.068349, -6.15484,
-3.786124, -3.120184, 5.578646,
-3.786124, 4.068349, 5.578646,
-3.786124, -3.120184, -6.15484,
-3.786124, -3.120184, 5.578646,
-3.786124, 4.068349, -6.15484,
-3.786124, 4.068349, 5.578646,
-3.786124, -3.120184, -6.15484,
3.35169, -3.120184, -6.15484,
-3.786124, -3.120184, 5.578646,
3.35169, -3.120184, 5.578646,
-3.786124, 4.068349, -6.15484,
3.35169, 4.068349, -6.15484,
-3.786124, 4.068349, 5.578646,
3.35169, 4.068349, 5.578646,
3.35169, -3.120184, -6.15484,
3.35169, 4.068349, -6.15484,
3.35169, -3.120184, 5.578646,
3.35169, 4.068349, 5.578646,
3.35169, -3.120184, -6.15484,
3.35169, -3.120184, 5.578646,
3.35169, 4.068349, -6.15484,
3.35169, 4.068349, 5.578646
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
var radius = 8.277528;
var distance = 36.82766;
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
mvMatrix.translate( 0.2172171, -0.4740824, 0.2880974 );
mvMatrix.scale( 1.253861, 1.245014, 0.7627593 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.82766);
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
Dioxathion<-read.table("Dioxathion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dioxathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dioxathion' not found
```

```r
y<-Dioxathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dioxathion' not found
```

```r
z<-Dioxathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dioxathion' not found
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
-3.682176, -0.7046151, -2.931717, 0, 0, 1, 1, 1,
-3.211432, -0.06386273, -2.08082, 1, 0, 0, 1, 1,
-2.907699, 1.059461, -0.08673521, 1, 0, 0, 1, 1,
-2.741519, 1.326432, 0.7058066, 1, 0, 0, 1, 1,
-2.726598, 0.2708564, -0.5019705, 1, 0, 0, 1, 1,
-2.48371, 0.9827175, -1.131138, 1, 0, 0, 1, 1,
-2.481384, -0.8481374, 0.3648929, 0, 0, 0, 1, 1,
-2.459879, -0.3348413, -1.165052, 0, 0, 0, 1, 1,
-2.413532, -1.71347, -3.578057, 0, 0, 0, 1, 1,
-2.309129, -1.530784, -2.817218, 0, 0, 0, 1, 1,
-2.247974, -0.08616057, -2.211015, 0, 0, 0, 1, 1,
-2.215417, 0.06346043, -0.9750086, 0, 0, 0, 1, 1,
-2.198859, 1.486827, -0.9919732, 0, 0, 0, 1, 1,
-2.187002, 0.4412456, -0.4557258, 1, 1, 1, 1, 1,
-2.176601, 1.326416, -0.3244928, 1, 1, 1, 1, 1,
-2.144678, 1.081149, -3.411574, 1, 1, 1, 1, 1,
-2.144429, -0.3772537, -2.797633, 1, 1, 1, 1, 1,
-2.11867, -1.584993, -3.258902, 1, 1, 1, 1, 1,
-2.11669, -0.27528, -1.608641, 1, 1, 1, 1, 1,
-2.111332, -0.629741, -1.801964, 1, 1, 1, 1, 1,
-2.103923, 0.3051511, -3.429622, 1, 1, 1, 1, 1,
-2.091788, -0.8570018, -3.800891, 1, 1, 1, 1, 1,
-2.087026, 1.011919, -0.3726415, 1, 1, 1, 1, 1,
-2.08305, 0.9894404, 0.274532, 1, 1, 1, 1, 1,
-2.070312, -1.457917, -2.889584, 1, 1, 1, 1, 1,
-2.046756, -0.7264817, -1.087642, 1, 1, 1, 1, 1,
-2.025374, -1.696553, -0.9393891, 1, 1, 1, 1, 1,
-2.015158, -0.1024031, -2.235579, 1, 1, 1, 1, 1,
-2.007271, 0.3203108, -1.290125, 0, 0, 1, 1, 1,
-1.997267, -1.25328, -2.862125, 1, 0, 0, 1, 1,
-1.996812, -1.603244, -3.427399, 1, 0, 0, 1, 1,
-1.987772, 1.599495, 0.9023193, 1, 0, 0, 1, 1,
-1.979079, 0.02352636, -2.037271, 1, 0, 0, 1, 1,
-1.965042, 0.07927493, -1.944657, 1, 0, 0, 1, 1,
-1.959441, 2.221551, 0.7849934, 0, 0, 0, 1, 1,
-1.945148, 0.2231446, -1.759073, 0, 0, 0, 1, 1,
-1.9054, 1.375361, -0.8109562, 0, 0, 0, 1, 1,
-1.893441, 0.534696, -1.490316, 0, 0, 0, 1, 1,
-1.877868, 1.510646, -1.724024, 0, 0, 0, 1, 1,
-1.868203, 0.3282624, -0.8092757, 0, 0, 0, 1, 1,
-1.825045, 0.3715996, -1.177656, 0, 0, 0, 1, 1,
-1.819487, -0.4487482, -2.897029, 1, 1, 1, 1, 1,
-1.788008, -0.9637688, -3.297071, 1, 1, 1, 1, 1,
-1.76133, -1.269475, -2.155763, 1, 1, 1, 1, 1,
-1.740297, 0.01795777, -1.300848, 1, 1, 1, 1, 1,
-1.721739, -0.8169184, -1.604047, 1, 1, 1, 1, 1,
-1.718922, 1.894754, -2.503232, 1, 1, 1, 1, 1,
-1.714543, -1.103221, -3.52728, 1, 1, 1, 1, 1,
-1.699323, 0.7089729, -1.964182, 1, 1, 1, 1, 1,
-1.693485, -1.854158, -2.586292, 1, 1, 1, 1, 1,
-1.670924, -0.1255708, -0.5349949, 1, 1, 1, 1, 1,
-1.669224, -1.769592, -2.190945, 1, 1, 1, 1, 1,
-1.66818, 0.4920039, -2.052729, 1, 1, 1, 1, 1,
-1.665776, -1.506708, -2.484557, 1, 1, 1, 1, 1,
-1.653944, -0.1920243, -0.5821661, 1, 1, 1, 1, 1,
-1.649444, -0.3185748, -1.230593, 1, 1, 1, 1, 1,
-1.648286, 0.5833967, -1.78725, 0, 0, 1, 1, 1,
-1.628486, 1.168772, -1.678274, 1, 0, 0, 1, 1,
-1.620476, -0.4303404, -2.552644, 1, 0, 0, 1, 1,
-1.617089, 1.931748, -0.3251708, 1, 0, 0, 1, 1,
-1.601625, 1.266182, -1.291582, 1, 0, 0, 1, 1,
-1.58839, 0.2338738, -0.4204807, 1, 0, 0, 1, 1,
-1.577097, 0.9682925, -1.24098, 0, 0, 0, 1, 1,
-1.564356, 0.8139622, -0.9386384, 0, 0, 0, 1, 1,
-1.555827, -0.2181723, -2.583695, 0, 0, 0, 1, 1,
-1.551165, 0.2796832, -3.105399, 0, 0, 0, 1, 1,
-1.549239, -2.1137, -0.9161615, 0, 0, 0, 1, 1,
-1.545329, -0.3917202, -2.243784, 0, 0, 0, 1, 1,
-1.529628, 1.210124, -1.589954, 0, 0, 0, 1, 1,
-1.517165, -0.8207801, -1.580896, 1, 1, 1, 1, 1,
-1.503519, -1.813931, -1.681925, 1, 1, 1, 1, 1,
-1.503289, 0.4514625, -0.9108701, 1, 1, 1, 1, 1,
-1.500928, 0.430782, -1.705981, 1, 1, 1, 1, 1,
-1.493966, 0.2737249, -1.351867, 1, 1, 1, 1, 1,
-1.492659, -0.1102809, 0.2463133, 1, 1, 1, 1, 1,
-1.484254, 0.1037882, -1.466732, 1, 1, 1, 1, 1,
-1.4663, -0.3271061, -1.307485, 1, 1, 1, 1, 1,
-1.461372, -0.6703936, -1.231135, 1, 1, 1, 1, 1,
-1.45752, -0.6512659, -1.909244, 1, 1, 1, 1, 1,
-1.456406, -0.4777155, -1.392078, 1, 1, 1, 1, 1,
-1.450576, 1.403135, -1.14428, 1, 1, 1, 1, 1,
-1.442798, -0.6079528, -2.132823, 1, 1, 1, 1, 1,
-1.440956, -0.5849652, -0.8699751, 1, 1, 1, 1, 1,
-1.436311, 1.218493, -2.084777, 1, 1, 1, 1, 1,
-1.435755, -1.696865, -3.595409, 0, 0, 1, 1, 1,
-1.432378, -0.9620339, -2.271252, 1, 0, 0, 1, 1,
-1.422168, 2.616669, -0.5813777, 1, 0, 0, 1, 1,
-1.419982, 1.128885, -2.011584, 1, 0, 0, 1, 1,
-1.404549, 1.709482, -1.034543, 1, 0, 0, 1, 1,
-1.400939, -0.1896544, -3.977857, 1, 0, 0, 1, 1,
-1.398465, 0.732891, -0.8009182, 0, 0, 0, 1, 1,
-1.39504, 1.491338, -0.7361717, 0, 0, 0, 1, 1,
-1.386868, -0.542861, -1.690567, 0, 0, 0, 1, 1,
-1.385638, 2.022133, -0.8773451, 0, 0, 0, 1, 1,
-1.378627, 0.3676851, -1.819073, 0, 0, 0, 1, 1,
-1.376393, 0.278481, 0.2659274, 0, 0, 0, 1, 1,
-1.375754, 1.264788, -1.095965, 0, 0, 0, 1, 1,
-1.369038, 0.1420462, -2.230493, 1, 1, 1, 1, 1,
-1.367071, 1.478724, 0.130206, 1, 1, 1, 1, 1,
-1.354082, -0.2873046, -1.779036, 1, 1, 1, 1, 1,
-1.352774, -0.3600028, -1.598686, 1, 1, 1, 1, 1,
-1.350922, 0.6710804, -0.6049443, 1, 1, 1, 1, 1,
-1.348126, 0.7588303, -1.118454, 1, 1, 1, 1, 1,
-1.346498, -1.868828, -3.234313, 1, 1, 1, 1, 1,
-1.340383, -0.6872578, -2.957829, 1, 1, 1, 1, 1,
-1.336913, -0.08137657, -1.60351, 1, 1, 1, 1, 1,
-1.334651, -0.6733179, -2.199732, 1, 1, 1, 1, 1,
-1.323912, 0.7234424, -0.1465554, 1, 1, 1, 1, 1,
-1.319554, -1.21465, -2.562014, 1, 1, 1, 1, 1,
-1.318948, 0.6195251, 0.4503682, 1, 1, 1, 1, 1,
-1.312987, -0.8604417, -1.442909, 1, 1, 1, 1, 1,
-1.304329, 0.4125316, -0.6851327, 1, 1, 1, 1, 1,
-1.301392, -0.9550998, -3.336172, 0, 0, 1, 1, 1,
-1.295083, -1.017568, -3.515647, 1, 0, 0, 1, 1,
-1.284302, 0.390686, -0.7560928, 1, 0, 0, 1, 1,
-1.281819, -2.262802, -2.22538, 1, 0, 0, 1, 1,
-1.279424, 0.5073417, -2.629118, 1, 0, 0, 1, 1,
-1.266267, 0.03721141, -2.448449, 1, 0, 0, 1, 1,
-1.25909, -1.350399, -4.730382, 0, 0, 0, 1, 1,
-1.255959, -0.2248918, -1.737323, 0, 0, 0, 1, 1,
-1.252552, 0.531605, -0.8157043, 0, 0, 0, 1, 1,
-1.252166, -0.5396115, -2.956438, 0, 0, 0, 1, 1,
-1.242039, -1.169155, -2.253644, 0, 0, 0, 1, 1,
-1.232743, -0.736644, -1.284426, 0, 0, 0, 1, 1,
-1.227897, 0.8843457, -0.8643346, 0, 0, 0, 1, 1,
-1.225614, -1.38568, -2.275924, 1, 1, 1, 1, 1,
-1.223879, 2.454542, 0.08556107, 1, 1, 1, 1, 1,
-1.220706, -0.1815489, -0.06694046, 1, 1, 1, 1, 1,
-1.21945, 1.402182, 0.6305502, 1, 1, 1, 1, 1,
-1.215464, 0.5927524, -1.060945, 1, 1, 1, 1, 1,
-1.215057, -1.577167, -2.67278, 1, 1, 1, 1, 1,
-1.211591, 0.1328863, -1.559628, 1, 1, 1, 1, 1,
-1.209887, -0.6418191, -2.581807, 1, 1, 1, 1, 1,
-1.208056, 1.702445, 0.4574949, 1, 1, 1, 1, 1,
-1.205519, 0.5323103, 0.2073568, 1, 1, 1, 1, 1,
-1.205138, 0.7468095, -1.856732, 1, 1, 1, 1, 1,
-1.202616, -0.512203, -3.845357, 1, 1, 1, 1, 1,
-1.199412, 0.9140778, -0.6200448, 1, 1, 1, 1, 1,
-1.198863, -0.5968021, -2.575231, 1, 1, 1, 1, 1,
-1.186646, -1.541317, -2.582161, 1, 1, 1, 1, 1,
-1.185632, -0.3440571, -1.204249, 0, 0, 1, 1, 1,
-1.184402, -0.2382222, -1.455884, 1, 0, 0, 1, 1,
-1.178011, 0.5560007, -2.282703, 1, 0, 0, 1, 1,
-1.176228, 0.07852811, -0.1631082, 1, 0, 0, 1, 1,
-1.172136, -0.1680637, -1.784343, 1, 0, 0, 1, 1,
-1.169333, -0.2376597, 0.09506328, 1, 0, 0, 1, 1,
-1.168472, -1.514453, -2.576215, 0, 0, 0, 1, 1,
-1.168307, 0.07407214, -0.9524847, 0, 0, 0, 1, 1,
-1.167023, 0.06322023, 0.5356016, 0, 0, 0, 1, 1,
-1.166703, -0.1353119, -1.198508, 0, 0, 0, 1, 1,
-1.1653, 0.6371082, -1.353171, 0, 0, 0, 1, 1,
-1.148249, -1.883716, -0.6963714, 0, 0, 0, 1, 1,
-1.146044, -0.9378626, -2.144982, 0, 0, 0, 1, 1,
-1.118568, -1.035002, -1.529267, 1, 1, 1, 1, 1,
-1.113562, 0.8999324, -0.4239795, 1, 1, 1, 1, 1,
-1.101411, 0.5069183, -2.82329, 1, 1, 1, 1, 1,
-1.101191, -0.8438548, -0.477807, 1, 1, 1, 1, 1,
-1.100365, -0.7824426, -2.118367, 1, 1, 1, 1, 1,
-1.094075, 2.534829, -0.2251593, 1, 1, 1, 1, 1,
-1.087125, 2.121686, 1.428319, 1, 1, 1, 1, 1,
-1.086348, -0.9271396, -0.6342996, 1, 1, 1, 1, 1,
-1.086013, -1.000179, -2.023146, 1, 1, 1, 1, 1,
-1.074018, 1.24401, -0.07517371, 1, 1, 1, 1, 1,
-1.070354, -0.3487063, -3.408629, 1, 1, 1, 1, 1,
-1.063964, -0.9134957, -4.163737, 1, 1, 1, 1, 1,
-1.059251, 2.360884, -0.3342083, 1, 1, 1, 1, 1,
-1.04543, 0.07000692, -1.388969, 1, 1, 1, 1, 1,
-1.043943, 1.895256, -0.5627557, 1, 1, 1, 1, 1,
-1.042268, 0.4419276, -2.481311, 0, 0, 1, 1, 1,
-1.040444, 1.185565, -1.68212, 1, 0, 0, 1, 1,
-1.037041, 0.6377599, -1.219718, 1, 0, 0, 1, 1,
-1.027756, 0.9185157, -0.8814048, 1, 0, 0, 1, 1,
-1.023366, -0.1859321, -0.5791228, 1, 0, 0, 1, 1,
-1.023358, -0.09402127, -3.727332, 1, 0, 0, 1, 1,
-1.020943, -0.2154377, -1.807816, 0, 0, 0, 1, 1,
-1.018034, 1.648057, -1.041939, 0, 0, 0, 1, 1,
-1.013384, -2.702442, -3.620673, 0, 0, 0, 1, 1,
-1.012128, 0.03847698, -2.366793, 0, 0, 0, 1, 1,
-1.008143, -0.3854051, -1.195868, 0, 0, 0, 1, 1,
-1.003536, 1.068009, -0.419277, 0, 0, 0, 1, 1,
-0.9873052, -2.216802, -4.04911, 0, 0, 0, 1, 1,
-0.9803154, -1.44228, -0.7273574, 1, 1, 1, 1, 1,
-0.9797118, 1.712776, -0.009551958, 1, 1, 1, 1, 1,
-0.9746447, -0.7419578, -1.321949, 1, 1, 1, 1, 1,
-0.9659349, -0.1235714, -1.735558, 1, 1, 1, 1, 1,
-0.9651247, 0.08299357, -0.8481645, 1, 1, 1, 1, 1,
-0.9648175, 0.2156963, -3.531794, 1, 1, 1, 1, 1,
-0.9625022, -0.3492666, -1.342464, 1, 1, 1, 1, 1,
-0.9617915, -1.09698, -2.279205, 1, 1, 1, 1, 1,
-0.9605234, 0.01583781, -0.1864491, 1, 1, 1, 1, 1,
-0.9583318, -0.6286581, -0.2668993, 1, 1, 1, 1, 1,
-0.9545358, 0.8683307, 0.4586533, 1, 1, 1, 1, 1,
-0.9535227, -0.8549789, -4.026088, 1, 1, 1, 1, 1,
-0.9525532, -0.6136535, -3.923357, 1, 1, 1, 1, 1,
-0.9514146, -0.5225737, -3.160024, 1, 1, 1, 1, 1,
-0.9488168, 1.380421, -2.955762, 1, 1, 1, 1, 1,
-0.9458256, 1.155976, -1.830946, 0, 0, 1, 1, 1,
-0.9448276, 0.9533695, -0.8414895, 1, 0, 0, 1, 1,
-0.9410167, 0.5528287, 0.106449, 1, 0, 0, 1, 1,
-0.9304477, -1.389704, -0.8965732, 1, 0, 0, 1, 1,
-0.9301705, -0.1424763, -2.758062, 1, 0, 0, 1, 1,
-0.9218632, -1.107483, -3.959993, 1, 0, 0, 1, 1,
-0.9068018, -1.231948, -2.443979, 0, 0, 0, 1, 1,
-0.9031184, 0.4259267, -2.039706, 0, 0, 0, 1, 1,
-0.9029214, -0.05403827, -2.123904, 0, 0, 0, 1, 1,
-0.9028845, 0.7891334, -1.049023, 0, 0, 0, 1, 1,
-0.9002508, -0.04458486, -1.905357, 0, 0, 0, 1, 1,
-0.8980155, 1.807572, -1.402652, 0, 0, 0, 1, 1,
-0.8979967, 0.819411, -1.247478, 0, 0, 0, 1, 1,
-0.8967068, -2.276136, -2.202649, 1, 1, 1, 1, 1,
-0.8945673, -0.5927266, -0.6549681, 1, 1, 1, 1, 1,
-0.883709, -1.021849, -0.7381571, 1, 1, 1, 1, 1,
-0.8760291, -0.2090319, -0.279902, 1, 1, 1, 1, 1,
-0.8731406, -1.283902, -2.911074, 1, 1, 1, 1, 1,
-0.8693646, 1.673509, -0.352346, 1, 1, 1, 1, 1,
-0.8669466, 0.7774189, -1.351477, 1, 1, 1, 1, 1,
-0.8621052, 0.1056084, 1.327713, 1, 1, 1, 1, 1,
-0.852055, -1.171566, -3.61512, 1, 1, 1, 1, 1,
-0.8520094, 0.5303212, -3.181971, 1, 1, 1, 1, 1,
-0.847612, 1.209219, 0.2569554, 1, 1, 1, 1, 1,
-0.8473483, -2.091013, -3.536201, 1, 1, 1, 1, 1,
-0.8428721, -0.03177356, -2.004688, 1, 1, 1, 1, 1,
-0.8382882, -2.352531, -1.646107, 1, 1, 1, 1, 1,
-0.8373957, 2.018121, -0.3853235, 1, 1, 1, 1, 1,
-0.8292993, -0.851473, -1.55951, 0, 0, 1, 1, 1,
-0.8266824, 2.710109, -0.3185162, 1, 0, 0, 1, 1,
-0.8238183, 0.07606292, -0.8878627, 1, 0, 0, 1, 1,
-0.822853, 0.602511, -1.766118, 1, 0, 0, 1, 1,
-0.8158573, -1.661107, -3.833665, 1, 0, 0, 1, 1,
-0.8087426, -0.4535866, -2.146379, 1, 0, 0, 1, 1,
-0.7972267, -0.08319881, -1.43561, 0, 0, 0, 1, 1,
-0.7904821, -1.020993, -3.494874, 0, 0, 0, 1, 1,
-0.790221, 0.74452, -1.61378, 0, 0, 0, 1, 1,
-0.789474, 0.6816677, -0.6175861, 0, 0, 0, 1, 1,
-0.7860057, 0.440704, -0.4758116, 0, 0, 0, 1, 1,
-0.7709258, 0.6162395, -0.8905326, 0, 0, 0, 1, 1,
-0.7597708, 0.0337619, -0.7854217, 0, 0, 0, 1, 1,
-0.7595502, -0.4847986, -1.965859, 1, 1, 1, 1, 1,
-0.7543515, -0.2289361, -1.686456, 1, 1, 1, 1, 1,
-0.7483224, -0.6167236, -2.147121, 1, 1, 1, 1, 1,
-0.746147, -0.7660744, -1.667705, 1, 1, 1, 1, 1,
-0.7430483, 0.1764455, -1.200639, 1, 1, 1, 1, 1,
-0.7391776, 0.3987097, -0.08870582, 1, 1, 1, 1, 1,
-0.7376752, 0.6367956, -0.9209311, 1, 1, 1, 1, 1,
-0.7299128, 0.7118114, -2.330335, 1, 1, 1, 1, 1,
-0.726725, 0.1861661, -1.269298, 1, 1, 1, 1, 1,
-0.7174434, 1.286314, 0.1082695, 1, 1, 1, 1, 1,
-0.7151905, -0.08263659, -2.298132, 1, 1, 1, 1, 1,
-0.7093898, -0.1303807, -1.133126, 1, 1, 1, 1, 1,
-0.7065753, -0.7580415, -1.207355, 1, 1, 1, 1, 1,
-0.7009312, -0.20021, -1.349304, 1, 1, 1, 1, 1,
-0.6991727, -0.2045567, -0.4288449, 1, 1, 1, 1, 1,
-0.6963573, 0.2239404, -1.308653, 0, 0, 1, 1, 1,
-0.6946397, 0.4177817, -2.270995, 1, 0, 0, 1, 1,
-0.6935079, 0.9917654, 0.1033665, 1, 0, 0, 1, 1,
-0.6918423, 1.010597, -0.9502705, 1, 0, 0, 1, 1,
-0.6907437, -0.2587401, -2.00905, 1, 0, 0, 1, 1,
-0.6900948, -0.1351522, -2.352127, 1, 0, 0, 1, 1,
-0.6899146, 1.036083, 0.009833761, 0, 0, 0, 1, 1,
-0.6817312, 0.1401299, -3.07731, 0, 0, 0, 1, 1,
-0.6793673, 1.065672, -0.110487, 0, 0, 0, 1, 1,
-0.6722977, -1.52963, -3.288868, 0, 0, 0, 1, 1,
-0.6620383, 0.5499187, -2.63559, 0, 0, 0, 1, 1,
-0.6613999, 1.122224, -0.4661653, 0, 0, 0, 1, 1,
-0.6609441, -1.564176, -2.310113, 0, 0, 0, 1, 1,
-0.6609243, 1.102499, -0.05836608, 1, 1, 1, 1, 1,
-0.6565357, 0.4830994, -1.724195, 1, 1, 1, 1, 1,
-0.6535025, 0.9983417, -0.4570789, 1, 1, 1, 1, 1,
-0.6490713, -0.1749068, -2.492526, 1, 1, 1, 1, 1,
-0.6471804, 0.7886932, -0.4033535, 1, 1, 1, 1, 1,
-0.6429825, -1.311335, -3.256958, 1, 1, 1, 1, 1,
-0.6420562, -0.2924245, -2.751251, 1, 1, 1, 1, 1,
-0.6414823, 0.6828114, 0.9249195, 1, 1, 1, 1, 1,
-0.6335247, -1.143892, -2.83871, 1, 1, 1, 1, 1,
-0.6218938, -0.5562417, -3.00368, 1, 1, 1, 1, 1,
-0.6207143, 0.02775722, -2.100525, 1, 1, 1, 1, 1,
-0.6195437, 0.1272758, -0.1120335, 1, 1, 1, 1, 1,
-0.6158614, -1.861501, -3.235009, 1, 1, 1, 1, 1,
-0.6154706, 0.104329, -1.773867, 1, 1, 1, 1, 1,
-0.6088442, -0.2813875, -3.253075, 1, 1, 1, 1, 1,
-0.604441, 0.7718576, -1.119128, 0, 0, 1, 1, 1,
-0.6017818, -0.7835292, -1.526839, 1, 0, 0, 1, 1,
-0.5975962, -1.0272, -2.838177, 1, 0, 0, 1, 1,
-0.5959297, -1.440981, -2.934977, 1, 0, 0, 1, 1,
-0.5936426, -1.534219, -3.021773, 1, 0, 0, 1, 1,
-0.5818371, -0.310801, -1.543074, 1, 0, 0, 1, 1,
-0.5817172, -0.5225154, -1.582245, 0, 0, 0, 1, 1,
-0.5799752, 2.801649, -1.195831, 0, 0, 0, 1, 1,
-0.5786743, 0.1276736, -1.372481, 0, 0, 0, 1, 1,
-0.5757313, -0.6423522, -2.005926, 0, 0, 0, 1, 1,
-0.5729943, 0.6129582, -1.569332, 0, 0, 0, 1, 1,
-0.5682851, -0.5008581, -2.253486, 0, 0, 0, 1, 1,
-0.5662675, -0.540342, -3.474482, 0, 0, 0, 1, 1,
-0.5642009, -0.2647059, -1.565348, 1, 1, 1, 1, 1,
-0.5585276, 0.7435963, -2.083243, 1, 1, 1, 1, 1,
-0.5582589, -0.7408271, -0.1723981, 1, 1, 1, 1, 1,
-0.5542303, 0.7094904, -0.6087368, 1, 1, 1, 1, 1,
-0.5463363, 0.2718314, -1.630003, 1, 1, 1, 1, 1,
-0.5459065, -0.09062245, -2.876, 1, 1, 1, 1, 1,
-0.541333, -0.7291172, -3.13325, 1, 1, 1, 1, 1,
-0.5408484, -0.8550078, -1.679028, 1, 1, 1, 1, 1,
-0.5364562, -1.512188, -2.976542, 1, 1, 1, 1, 1,
-0.534335, -0.5953392, -3.443043, 1, 1, 1, 1, 1,
-0.5330523, 0.02521507, -1.564628, 1, 1, 1, 1, 1,
-0.5287, 0.07553836, -1.356948, 1, 1, 1, 1, 1,
-0.522639, 1.292681, 0.3479657, 1, 1, 1, 1, 1,
-0.5224265, -0.7342491, -3.821194, 1, 1, 1, 1, 1,
-0.5223337, 1.82418, -0.3693678, 1, 1, 1, 1, 1,
-0.5209135, -0.5165846, -2.319232, 0, 0, 1, 1, 1,
-0.5157294, 0.146437, -2.328752, 1, 0, 0, 1, 1,
-0.5128838, 1.183878, -1.501355, 1, 0, 0, 1, 1,
-0.5114831, -0.1582227, -1.226813, 1, 0, 0, 1, 1,
-0.5096977, -0.457205, -1.067001, 1, 0, 0, 1, 1,
-0.5049743, -2.494974, -1.608791, 1, 0, 0, 1, 1,
-0.4998097, -0.01102829, -1.249851, 0, 0, 0, 1, 1,
-0.4900329, -1.664133, -2.94574, 0, 0, 0, 1, 1,
-0.4858491, 1.030251, -0.1975426, 0, 0, 0, 1, 1,
-0.4834791, 0.1127037, -1.210402, 0, 0, 0, 1, 1,
-0.4828425, 0.4655817, -1.220903, 0, 0, 0, 1, 1,
-0.4809943, 0.9848109, -0.6960574, 0, 0, 0, 1, 1,
-0.4808789, -2.063448, -3.540691, 0, 0, 0, 1, 1,
-0.4698957, 1.622541, -0.1648029, 1, 1, 1, 1, 1,
-0.4659813, -0.5520619, -2.992392, 1, 1, 1, 1, 1,
-0.4627314, 0.7670231, -0.3419134, 1, 1, 1, 1, 1,
-0.45503, -1.789973, -2.091297, 1, 1, 1, 1, 1,
-0.4531533, 2.122803, -0.14842, 1, 1, 1, 1, 1,
-0.4527218, 0.5128207, 2.261038, 1, 1, 1, 1, 1,
-0.4513575, -0.1056103, -1.387704, 1, 1, 1, 1, 1,
-0.449609, -1.006282, -2.262046, 1, 1, 1, 1, 1,
-0.4476614, 0.2093369, -0.3394439, 1, 1, 1, 1, 1,
-0.4473747, -1.170604, -2.146835, 1, 1, 1, 1, 1,
-0.4437117, -0.6259678, -3.269848, 1, 1, 1, 1, 1,
-0.438968, 0.8584315, -1.241339, 1, 1, 1, 1, 1,
-0.4352644, -0.8275276, -2.115167, 1, 1, 1, 1, 1,
-0.4325902, 2.342879, 0.6572739, 1, 1, 1, 1, 1,
-0.4259801, 0.9672254, -0.7207973, 1, 1, 1, 1, 1,
-0.4257191, 0.8027976, -1.241401, 0, 0, 1, 1, 1,
-0.4251003, -0.5584489, -3.394328, 1, 0, 0, 1, 1,
-0.4229104, -1.584814, -4.102071, 1, 0, 0, 1, 1,
-0.4226553, 1.566617, -0.9145406, 1, 0, 0, 1, 1,
-0.4174536, 0.08427523, -1.488885, 1, 0, 0, 1, 1,
-0.4173752, 0.4381464, -0.7744395, 1, 0, 0, 1, 1,
-0.408718, 0.0725462, -2.15403, 0, 0, 0, 1, 1,
-0.4058049, -0.3276721, -3.659134, 0, 0, 0, 1, 1,
-0.4021002, 0.4369518, -0.1991132, 0, 0, 0, 1, 1,
-0.4015217, 1.170696, 0.5663526, 0, 0, 0, 1, 1,
-0.4004198, 0.206558, -1.657179, 0, 0, 0, 1, 1,
-0.3954453, -3.015497, -2.542006, 0, 0, 0, 1, 1,
-0.3942704, 0.8479621, -0.5054033, 0, 0, 0, 1, 1,
-0.3927414, 0.8360481, -0.2407772, 1, 1, 1, 1, 1,
-0.3926497, -2.843079, -3.194654, 1, 1, 1, 1, 1,
-0.3867778, 1.570077, -0.4641343, 1, 1, 1, 1, 1,
-0.3827223, -1.041285, -4.19726, 1, 1, 1, 1, 1,
-0.3823062, 0.2269168, -0.0249851, 1, 1, 1, 1, 1,
-0.3799303, 0.2013251, -0.6796257, 1, 1, 1, 1, 1,
-0.3734311, -0.5013056, -2.754174, 1, 1, 1, 1, 1,
-0.3689786, 1.086473, -0.2270908, 1, 1, 1, 1, 1,
-0.3688859, -0.1263387, -0.01062528, 1, 1, 1, 1, 1,
-0.3677144, -0.3542719, -0.1924225, 1, 1, 1, 1, 1,
-0.3656965, -1.442576, -3.180109, 1, 1, 1, 1, 1,
-0.3611816, -0.2975574, -1.724041, 1, 1, 1, 1, 1,
-0.3606976, -1.041845, -2.500674, 1, 1, 1, 1, 1,
-0.359593, 0.1936738, -2.606543, 1, 1, 1, 1, 1,
-0.3585467, -0.6738756, -5.983964, 1, 1, 1, 1, 1,
-0.3551153, -0.08053825, -2.368222, 0, 0, 1, 1, 1,
-0.3547607, 0.350888, -2.280047, 1, 0, 0, 1, 1,
-0.349606, -0.5301371, -2.556483, 1, 0, 0, 1, 1,
-0.3466994, -0.08852652, -0.1321913, 1, 0, 0, 1, 1,
-0.3461912, -1.136416, -4.713541, 1, 0, 0, 1, 1,
-0.3425784, -1.263065, -2.762125, 1, 0, 0, 1, 1,
-0.3422837, -0.04139856, -1.156779, 0, 0, 0, 1, 1,
-0.3401227, 1.475123, 0.04629695, 0, 0, 0, 1, 1,
-0.3381973, -0.6730247, -1.945262, 0, 0, 0, 1, 1,
-0.3378608, 0.2245903, -1.446148, 0, 0, 0, 1, 1,
-0.3353411, -0.7058513, -2.221387, 0, 0, 0, 1, 1,
-0.3316417, 1.229294, -0.2158952, 0, 0, 0, 1, 1,
-0.3298402, -0.5676982, -1.423599, 0, 0, 0, 1, 1,
-0.3242621, -1.223836, -3.684413, 1, 1, 1, 1, 1,
-0.3199845, 0.642494, -1.834479, 1, 1, 1, 1, 1,
-0.3098069, 0.4440397, -0.4689102, 1, 1, 1, 1, 1,
-0.30705, 0.6304327, -2.366291, 1, 1, 1, 1, 1,
-0.30323, 1.591428, -0.1968266, 1, 1, 1, 1, 1,
-0.3017843, -1.892011, -4.245255, 1, 1, 1, 1, 1,
-0.3002331, 0.7426059, -0.2863739, 1, 1, 1, 1, 1,
-0.2995911, 2.491628, -0.6375859, 1, 1, 1, 1, 1,
-0.2952389, 1.022607, -0.7205814, 1, 1, 1, 1, 1,
-0.294848, -0.3403078, -0.9438198, 1, 1, 1, 1, 1,
-0.2929564, -0.6265996, -1.706922, 1, 1, 1, 1, 1,
-0.2889349, -0.6529873, -2.411456, 1, 1, 1, 1, 1,
-0.2876484, -0.6858497, -2.999271, 1, 1, 1, 1, 1,
-0.2870919, -1.642073, -2.322036, 1, 1, 1, 1, 1,
-0.2863772, 1.197209, 0.2535902, 1, 1, 1, 1, 1,
-0.2853328, -0.1645, -3.255352, 0, 0, 1, 1, 1,
-0.2820369, 0.7357492, -0.2451383, 1, 0, 0, 1, 1,
-0.27569, -0.006201274, -0.8894112, 1, 0, 0, 1, 1,
-0.2723407, -0.7179967, -2.509345, 1, 0, 0, 1, 1,
-0.27204, -0.01667361, -1.758813, 1, 0, 0, 1, 1,
-0.2708342, -1.792574, -3.763093, 1, 0, 0, 1, 1,
-0.2689359, 0.8236847, 0.5885263, 0, 0, 0, 1, 1,
-0.2683486, 1.047633, -0.9907118, 0, 0, 0, 1, 1,
-0.2659185, 0.9585031, -0.5579079, 0, 0, 0, 1, 1,
-0.2639076, 0.7298244, -0.04837376, 0, 0, 0, 1, 1,
-0.2633717, -0.01617053, -1.676317, 0, 0, 0, 1, 1,
-0.2629375, -1.021777, -3.704125, 0, 0, 0, 1, 1,
-0.2568464, 0.5975583, -0.006788904, 0, 0, 0, 1, 1,
-0.2483485, 1.706353, -0.5853525, 1, 1, 1, 1, 1,
-0.243741, -1.828881, -1.917074, 1, 1, 1, 1, 1,
-0.2427192, -0.1258097, -0.8450602, 1, 1, 1, 1, 1,
-0.2413813, 0.7296233, -0.1726372, 1, 1, 1, 1, 1,
-0.2391863, -1.040169, -2.356891, 1, 1, 1, 1, 1,
-0.2379389, -2.324771, -1.994436, 1, 1, 1, 1, 1,
-0.2367906, 1.389174, 0.5983151, 1, 1, 1, 1, 1,
-0.2362347, -0.4113051, -1.925919, 1, 1, 1, 1, 1,
-0.2326671, 0.8689038, -0.9087242, 1, 1, 1, 1, 1,
-0.2292624, 0.3188881, 0.8237812, 1, 1, 1, 1, 1,
-0.2274408, -0.4633195, -1.980408, 1, 1, 1, 1, 1,
-0.2216927, 0.6272973, 0.05076022, 1, 1, 1, 1, 1,
-0.2188928, 0.9766224, 0.2680275, 1, 1, 1, 1, 1,
-0.2166974, -0.8861854, -2.127092, 1, 1, 1, 1, 1,
-0.2122228, -0.9666159, -2.779297, 1, 1, 1, 1, 1,
-0.2078384, 0.3941938, 1.6797, 0, 0, 1, 1, 1,
-0.2062769, 1.054588, 1.339613, 1, 0, 0, 1, 1,
-0.2061503, 0.3223272, -0.2091963, 1, 0, 0, 1, 1,
-0.2058276, 0.6839173, -0.6798438, 1, 0, 0, 1, 1,
-0.2054639, -1.075248, -1.817516, 1, 0, 0, 1, 1,
-0.2047465, -1.283991, -4.124219, 1, 0, 0, 1, 1,
-0.2045437, -0.4393843, -1.468974, 0, 0, 0, 1, 1,
-0.2027638, 0.8701913, -2.139259, 0, 0, 0, 1, 1,
-0.2023561, 2.002526, 0.9658058, 0, 0, 0, 1, 1,
-0.2010645, -0.776483, -5.555229, 0, 0, 0, 1, 1,
-0.1957142, 1.805297, 0.01329219, 0, 0, 0, 1, 1,
-0.1875036, -1.827516, -3.730667, 0, 0, 0, 1, 1,
-0.1813702, -0.2913534, -4.063643, 0, 0, 0, 1, 1,
-0.1726022, 0.1625008, 1.530217, 1, 1, 1, 1, 1,
-0.1720709, -1.443042, -2.283898, 1, 1, 1, 1, 1,
-0.1697019, -0.2502846, -2.777035, 1, 1, 1, 1, 1,
-0.16832, -0.8943082, -3.230081, 1, 1, 1, 1, 1,
-0.1683126, -0.3416322, -1.038851, 1, 1, 1, 1, 1,
-0.1674195, 0.5803099, 0.1897666, 1, 1, 1, 1, 1,
-0.1659559, 0.44539, -1.196769, 1, 1, 1, 1, 1,
-0.1628164, -0.31685, -2.384171, 1, 1, 1, 1, 1,
-0.1546504, 0.6776501, -0.3897416, 1, 1, 1, 1, 1,
-0.1466719, -1.237314, -2.586126, 1, 1, 1, 1, 1,
-0.141736, -1.346269, -4.043505, 1, 1, 1, 1, 1,
-0.1395088, 0.1794274, 1.465296, 1, 1, 1, 1, 1,
-0.1392061, 0.8766485, 1.000452, 1, 1, 1, 1, 1,
-0.1371475, -0.4344586, -3.763321, 1, 1, 1, 1, 1,
-0.1371139, -0.6983288, -2.932029, 1, 1, 1, 1, 1,
-0.1333897, 1.513233, 0.1474534, 0, 0, 1, 1, 1,
-0.1290259, 0.3255626, -0.2167257, 1, 0, 0, 1, 1,
-0.1272253, -0.4862069, -2.858437, 1, 0, 0, 1, 1,
-0.1230152, 0.08303054, -0.8301861, 1, 0, 0, 1, 1,
-0.1151751, 0.4085398, 0.04573789, 1, 0, 0, 1, 1,
-0.1131492, -0.0655159, -0.47846, 1, 0, 0, 1, 1,
-0.1100916, 0.1796502, -1.022236, 0, 0, 0, 1, 1,
-0.1042228, 1.582507, -0.2320576, 0, 0, 0, 1, 1,
-0.1030831, 0.2119811, -1.984005, 0, 0, 0, 1, 1,
-0.1022088, 1.202421, -0.1612562, 0, 0, 0, 1, 1,
-0.1006815, 0.8510622, 1.564709, 0, 0, 0, 1, 1,
-0.09629139, 0.3403562, -0.06294228, 0, 0, 0, 1, 1,
-0.09495895, -0.01580452, -1.386275, 0, 0, 0, 1, 1,
-0.09277081, -0.6927537, -1.186361, 1, 1, 1, 1, 1,
-0.09240652, 1.308508, 0.05483979, 1, 1, 1, 1, 1,
-0.09185523, 0.1464492, -1.088608, 1, 1, 1, 1, 1,
-0.08939449, 0.6913084, 0.5815134, 1, 1, 1, 1, 1,
-0.08343273, -1.381861, -4.595944, 1, 1, 1, 1, 1,
-0.08336172, -0.4075564, -2.776772, 1, 1, 1, 1, 1,
-0.08062246, -0.05047172, -2.00428, 1, 1, 1, 1, 1,
-0.08010577, -0.864017, -3.761585, 1, 1, 1, 1, 1,
-0.08000556, 1.084377, 1.235479, 1, 1, 1, 1, 1,
-0.07790183, -0.3601885, -2.73195, 1, 1, 1, 1, 1,
-0.07703471, 2.6414, -0.9737048, 1, 1, 1, 1, 1,
-0.07314161, 0.2399824, 0.06725334, 1, 1, 1, 1, 1,
-0.06905555, 0.7837767, -0.1149862, 1, 1, 1, 1, 1,
-0.06878406, 0.8264424, -0.2249658, 1, 1, 1, 1, 1,
-0.0664167, -0.1339543, -2.339174, 1, 1, 1, 1, 1,
-0.06546763, 1.261035, -1.747693, 0, 0, 1, 1, 1,
-0.0625091, 0.5392098, -0.5074224, 1, 0, 0, 1, 1,
-0.06115644, 0.4577067, 0.3727779, 1, 0, 0, 1, 1,
-0.05838258, -0.4535899, -5.249347, 1, 0, 0, 1, 1,
-0.05725236, 0.1014716, 0.05859421, 1, 0, 0, 1, 1,
-0.05544656, -0.04892741, -0.4157795, 1, 0, 0, 1, 1,
-0.05238917, -1.60016, -1.199101, 0, 0, 0, 1, 1,
-0.04876869, 0.7911112, 0.6952299, 0, 0, 0, 1, 1,
-0.04614192, -0.1331726, -3.033067, 0, 0, 0, 1, 1,
-0.04572438, 2.423556, -0.3583819, 0, 0, 0, 1, 1,
-0.04562688, -0.9888888, -2.31574, 0, 0, 0, 1, 1,
-0.04446204, -0.5292442, -2.142918, 0, 0, 0, 1, 1,
-0.04439519, -0.5986101, -2.804583, 0, 0, 0, 1, 1,
-0.04321269, -0.1748236, -1.982895, 1, 1, 1, 1, 1,
-0.0425357, -0.0966657, -3.233391, 1, 1, 1, 1, 1,
-0.03687963, 0.5779345, -0.2080533, 1, 1, 1, 1, 1,
-0.03600021, 2.3497, 0.6494393, 1, 1, 1, 1, 1,
-0.03588028, 0.1718159, 1.571347, 1, 1, 1, 1, 1,
-0.03097318, -0.003748028, -1.797454, 1, 1, 1, 1, 1,
-0.0302646, -0.002452725, -1.232252, 1, 1, 1, 1, 1,
-0.02982454, 0.140436, 0.8675715, 1, 1, 1, 1, 1,
-0.02947963, 0.595744, -0.3700878, 1, 1, 1, 1, 1,
-0.02476752, 1.312304, -1.693281, 1, 1, 1, 1, 1,
-0.02451079, 0.3899843, -0.8030214, 1, 1, 1, 1, 1,
-0.02264985, -0.6917953, -4.655184, 1, 1, 1, 1, 1,
-0.0197563, -2.679469, -2.950526, 1, 1, 1, 1, 1,
-0.01816261, 0.2539565, 0.08995392, 1, 1, 1, 1, 1,
-0.0152392, 1.650929, 0.2559111, 1, 1, 1, 1, 1,
-0.01319436, -1.021898, -3.158751, 0, 0, 1, 1, 1,
-0.01311874, 0.965854, 0.1444079, 1, 0, 0, 1, 1,
-0.01217202, -0.9269618, -3.720831, 1, 0, 0, 1, 1,
-0.01087605, 0.104399, -0.9717473, 1, 0, 0, 1, 1,
-0.00515028, -1.462163, -3.425315, 1, 0, 0, 1, 1,
-0.004991096, -0.03490429, -3.237644, 1, 0, 0, 1, 1,
-0.0006517496, 0.6343747, -2.021396, 0, 0, 0, 1, 1,
0.0004373782, 0.6079419, 1.879096, 0, 0, 0, 1, 1,
0.002942021, -1.637032, 4.766529, 0, 0, 0, 1, 1,
0.003786384, -1.146332, 2.751235, 0, 0, 0, 1, 1,
0.009344113, -1.351528, 4.795282, 0, 0, 0, 1, 1,
0.01581165, 0.08988982, 0.08491997, 0, 0, 0, 1, 1,
0.01764669, -0.3351104, 2.878949, 0, 0, 0, 1, 1,
0.02094068, -0.2897669, 2.192971, 1, 1, 1, 1, 1,
0.022992, -1.781158, 3.043082, 1, 1, 1, 1, 1,
0.02322537, -0.1304538, 1.922272, 1, 1, 1, 1, 1,
0.02522274, -0.4352273, 3.085672, 1, 1, 1, 1, 1,
0.02604911, 0.4392442, 0.07626244, 1, 1, 1, 1, 1,
0.02936209, 0.5695524, 0.07018784, 1, 1, 1, 1, 1,
0.0294837, -1.033795, 3.589278, 1, 1, 1, 1, 1,
0.03121196, 1.061083, -0.5890943, 1, 1, 1, 1, 1,
0.03131767, -1.376149, 1.985561, 1, 1, 1, 1, 1,
0.03332506, 0.2400205, -0.6561858, 1, 1, 1, 1, 1,
0.03417959, 0.9132284, -0.3463942, 1, 1, 1, 1, 1,
0.03778708, 0.3915132, 0.5855426, 1, 1, 1, 1, 1,
0.04030307, -1.077415, 3.200391, 1, 1, 1, 1, 1,
0.0404335, 0.2325493, 0.3447237, 1, 1, 1, 1, 1,
0.04105135, -2.117711, 2.718863, 1, 1, 1, 1, 1,
0.04258181, 0.8557371, -1.476541, 0, 0, 1, 1, 1,
0.04726755, -1.213098, 2.609557, 1, 0, 0, 1, 1,
0.04754073, 0.07699128, 0.7538082, 1, 0, 0, 1, 1,
0.04886355, 1.089215, -0.5945116, 1, 0, 0, 1, 1,
0.05425837, 0.7961906, 0.4417768, 1, 0, 0, 1, 1,
0.05458678, 0.5016833, -0.07220838, 1, 0, 0, 1, 1,
0.05522852, 1.122149, 0.9267532, 0, 0, 0, 1, 1,
0.06132888, 0.3576601, 2.417198, 0, 0, 0, 1, 1,
0.06335565, 3.356137, -0.183347, 0, 0, 0, 1, 1,
0.06450022, 1.838235, 1.084282, 0, 0, 0, 1, 1,
0.06578512, 1.346105, 0.5035561, 0, 0, 0, 1, 1,
0.06684433, 0.6790103, 1.77926, 0, 0, 0, 1, 1,
0.07016522, -1.12218, 3.9216, 0, 0, 0, 1, 1,
0.07021613, -0.9351071, 4.079054, 1, 1, 1, 1, 1,
0.07587933, -0.6274165, 2.2818, 1, 1, 1, 1, 1,
0.07633634, 0.03818132, 0.8487657, 1, 1, 1, 1, 1,
0.08046257, 0.4797885, -0.2709754, 1, 1, 1, 1, 1,
0.08143436, -0.04354459, 0.7784247, 1, 1, 1, 1, 1,
0.08249871, 0.9192534, 0.9548651, 1, 1, 1, 1, 1,
0.08301041, -0.5885046, 4.199949, 1, 1, 1, 1, 1,
0.08726785, 1.041369, -0.7357492, 1, 1, 1, 1, 1,
0.08978882, -0.7234026, 3.004521, 1, 1, 1, 1, 1,
0.09059554, -0.8009233, 3.645642, 1, 1, 1, 1, 1,
0.09175901, 0.8637775, -0.2820943, 1, 1, 1, 1, 1,
0.09285963, -0.7466173, 2.819244, 1, 1, 1, 1, 1,
0.1059099, -0.9278543, 3.263175, 1, 1, 1, 1, 1,
0.1070299, -0.73985, 2.123985, 1, 1, 1, 1, 1,
0.1085867, -0.3442387, 2.683388, 1, 1, 1, 1, 1,
0.1102494, -0.06227878, 2.840962, 0, 0, 1, 1, 1,
0.110678, 2.250975, -0.2871641, 1, 0, 0, 1, 1,
0.1130347, 0.4229992, -1.297604, 1, 0, 0, 1, 1,
0.1172397, -0.06612539, 1.796105, 1, 0, 0, 1, 1,
0.1185526, -1.367934, 3.216911, 1, 0, 0, 1, 1,
0.1222036, 0.5716289, -0.2033812, 1, 0, 0, 1, 1,
0.1226289, 0.2930988, -0.05869202, 0, 0, 0, 1, 1,
0.1238213, -0.2193712, 3.018929, 0, 0, 0, 1, 1,
0.1254962, -0.1362108, 3.120559, 0, 0, 0, 1, 1,
0.1370455, 0.2237696, 2.212457, 0, 0, 0, 1, 1,
0.1377778, -0.6545065, 3.178517, 0, 0, 0, 1, 1,
0.1389018, -0.1915891, 0.7867981, 0, 0, 0, 1, 1,
0.1390674, 0.8553914, -0.6304601, 0, 0, 0, 1, 1,
0.1397669, 0.8553569, 1.945984, 1, 1, 1, 1, 1,
0.1461022, 0.8205642, -0.4378419, 1, 1, 1, 1, 1,
0.1461134, -0.4394282, 3.144758, 1, 1, 1, 1, 1,
0.1493088, -0.7322571, 3.672245, 1, 1, 1, 1, 1,
0.1562466, -0.9634435, 5.36228, 1, 1, 1, 1, 1,
0.1636848, -2.716081, 3.758401, 1, 1, 1, 1, 1,
0.165419, -1.743254, 2.399933, 1, 1, 1, 1, 1,
0.1655117, 1.591293, 0.2326941, 1, 1, 1, 1, 1,
0.1660628, -0.1561502, 3.606986, 1, 1, 1, 1, 1,
0.1675517, -1.083735, 3.499525, 1, 1, 1, 1, 1,
0.1726489, 1.053947, -0.5238599, 1, 1, 1, 1, 1,
0.1758571, -1.362929, 2.901726, 1, 1, 1, 1, 1,
0.1763477, -2.266636, 1.691169, 1, 1, 1, 1, 1,
0.1769354, 0.4890197, 0.8776044, 1, 1, 1, 1, 1,
0.1818897, 2.513287, -0.4029613, 1, 1, 1, 1, 1,
0.1822239, 0.509091, 0.382693, 0, 0, 1, 1, 1,
0.1890875, -0.3649604, 2.052095, 1, 0, 0, 1, 1,
0.1920276, 0.4884687, 0.8697518, 1, 0, 0, 1, 1,
0.192575, -0.1813266, 3.077393, 1, 0, 0, 1, 1,
0.1940405, 2.417557, 0.5812652, 1, 0, 0, 1, 1,
0.1954678, -1.963451, 3.861417, 1, 0, 0, 1, 1,
0.1961973, -0.5252853, 4.35554, 0, 0, 0, 1, 1,
0.1967131, 1.222413, 0.727766, 0, 0, 0, 1, 1,
0.1993301, 0.4941814, 0.4325585, 0, 0, 0, 1, 1,
0.2054981, -0.1145811, 0.2683748, 0, 0, 0, 1, 1,
0.2106399, 1.236552, -1.193642, 0, 0, 0, 1, 1,
0.211006, 2.603164, 0.7310262, 0, 0, 0, 1, 1,
0.2118475, 0.1185351, 1.822206, 0, 0, 0, 1, 1,
0.2118901, 0.9367373, 0.07892133, 1, 1, 1, 1, 1,
0.2143768, -0.7968776, 2.51738, 1, 1, 1, 1, 1,
0.2157773, 1.683528, 0.1713099, 1, 1, 1, 1, 1,
0.216965, 0.8444039, 0.3399429, 1, 1, 1, 1, 1,
0.2239755, -1.256547, 3.517362, 1, 1, 1, 1, 1,
0.225296, -1.208565, 2.503911, 1, 1, 1, 1, 1,
0.2261241, -0.8373676, 5.40777, 1, 1, 1, 1, 1,
0.2296203, -1.871413, 2.874171, 1, 1, 1, 1, 1,
0.2343016, 2.280768, -1.633624, 1, 1, 1, 1, 1,
0.2346543, -0.4566909, 3.011809, 1, 1, 1, 1, 1,
0.236873, 0.6151764, 1.262508, 1, 1, 1, 1, 1,
0.2373413, -0.3670791, 2.59467, 1, 1, 1, 1, 1,
0.2412475, 1.505124, -0.1150777, 1, 1, 1, 1, 1,
0.2444124, -0.2254409, 3.526286, 1, 1, 1, 1, 1,
0.2483496, -0.7054988, 2.921392, 1, 1, 1, 1, 1,
0.2485098, -0.4882986, 4.40493, 0, 0, 1, 1, 1,
0.2502028, -1.285005, 2.674848, 1, 0, 0, 1, 1,
0.2513307, 0.4971697, 1.764592, 1, 0, 0, 1, 1,
0.252684, -1.254265, 2.168332, 1, 0, 0, 1, 1,
0.2557951, 0.4175035, -0.06547891, 1, 0, 0, 1, 1,
0.2566532, 0.5289569, 0.9623106, 1, 0, 0, 1, 1,
0.2584556, 0.6909315, 0.03908845, 0, 0, 0, 1, 1,
0.2621834, 1.427105, 0.06372508, 0, 0, 0, 1, 1,
0.2645376, 1.080255, -0.569895, 0, 0, 0, 1, 1,
0.2664333, -1.134824, 2.038848, 0, 0, 0, 1, 1,
0.2682034, 0.1712321, 0.7608548, 0, 0, 0, 1, 1,
0.2712079, 0.1394062, 2.698003, 0, 0, 0, 1, 1,
0.2716424, -0.9039766, 2.405376, 0, 0, 0, 1, 1,
0.2737927, 0.4927541, 0.1851478, 1, 1, 1, 1, 1,
0.2743614, -2.479717, 4.763144, 1, 1, 1, 1, 1,
0.2765094, 0.3142599, 0.9677166, 1, 1, 1, 1, 1,
0.277322, -0.5822845, 2.461008, 1, 1, 1, 1, 1,
0.2805827, 1.350481, 1.213575, 1, 1, 1, 1, 1,
0.2817029, 0.5221965, 2.670407, 1, 1, 1, 1, 1,
0.2826414, 0.02023329, -0.06556926, 1, 1, 1, 1, 1,
0.2872539, -0.7006367, 2.630807, 1, 1, 1, 1, 1,
0.2894458, 0.6922318, 1.220813, 1, 1, 1, 1, 1,
0.2923822, 0.7223343, 2.525112, 1, 1, 1, 1, 1,
0.2993529, -0.1763853, 0.8512184, 1, 1, 1, 1, 1,
0.3006197, 0.1973788, 0.3537245, 1, 1, 1, 1, 1,
0.3015558, -0.1218368, 1.46789, 1, 1, 1, 1, 1,
0.3058277, -0.7116721, 2.08356, 1, 1, 1, 1, 1,
0.3128344, -1.611343, 3.135046, 1, 1, 1, 1, 1,
0.3131773, 0.2316366, 0.8967866, 0, 0, 1, 1, 1,
0.3164813, -0.8253676, 4.09366, 1, 0, 0, 1, 1,
0.3165026, 0.3856605, -0.3094317, 1, 0, 0, 1, 1,
0.3167981, -0.8917373, 3.610289, 1, 0, 0, 1, 1,
0.3247017, 1.791833, 0.7932895, 1, 0, 0, 1, 1,
0.3261912, -1.098215, 3.33018, 1, 0, 0, 1, 1,
0.3383317, -1.991565, 3.508116, 0, 0, 0, 1, 1,
0.3383405, -0.3936472, 2.146477, 0, 0, 0, 1, 1,
0.3385566, 0.1911269, 0.7560689, 0, 0, 0, 1, 1,
0.3411337, 0.6464913, 2.326252, 0, 0, 0, 1, 1,
0.3424762, -0.7466246, 4.545667, 0, 0, 0, 1, 1,
0.3456962, 0.4046624, 0.1620069, 0, 0, 0, 1, 1,
0.3482388, 1.033662, 0.3751207, 0, 0, 0, 1, 1,
0.3514161, -0.9948502, 3.067422, 1, 1, 1, 1, 1,
0.3514575, 0.1792551, 1.295336, 1, 1, 1, 1, 1,
0.3521384, -1.314345, 2.185702, 1, 1, 1, 1, 1,
0.3564751, 2.111141, -0.8099784, 1, 1, 1, 1, 1,
0.3577216, -1.50161, 3.683793, 1, 1, 1, 1, 1,
0.3603093, 0.5212549, -0.6057937, 1, 1, 1, 1, 1,
0.3660493, 1.491512, 2.321299, 1, 1, 1, 1, 1,
0.3679413, -1.296966, -0.008498027, 1, 1, 1, 1, 1,
0.3695675, -1.204103, 3.348322, 1, 1, 1, 1, 1,
0.3699975, -1.52792, 2.304495, 1, 1, 1, 1, 1,
0.3788764, 0.2164755, -0.6841578, 1, 1, 1, 1, 1,
0.3814127, 0.5007027, 1.253768, 1, 1, 1, 1, 1,
0.3823915, -0.2071026, 2.18786, 1, 1, 1, 1, 1,
0.3830615, 1.229179, 0.3355289, 1, 1, 1, 1, 1,
0.384385, -0.7697374, 4.78707, 1, 1, 1, 1, 1,
0.3913432, -0.8083508, 2.422762, 0, 0, 1, 1, 1,
0.3933305, -1.167338, 2.404378, 1, 0, 0, 1, 1,
0.3979044, 0.4790331, 0.06678806, 1, 0, 0, 1, 1,
0.4003105, -1.463359, 2.827515, 1, 0, 0, 1, 1,
0.401634, 2.681967, -0.6690673, 1, 0, 0, 1, 1,
0.4035077, 0.4539624, 0.5867696, 1, 0, 0, 1, 1,
0.4106461, 1.330848, 1.497766, 0, 0, 0, 1, 1,
0.4120616, 0.3101092, 0.06553103, 0, 0, 0, 1, 1,
0.4131452, 2.0563, -0.632233, 0, 0, 0, 1, 1,
0.4140945, -1.52729, 2.993342, 0, 0, 0, 1, 1,
0.4142249, 2.020892, 2.029577, 0, 0, 0, 1, 1,
0.4151734, 0.5576525, 0.827911, 0, 0, 0, 1, 1,
0.428842, 0.750639, 1.406324, 0, 0, 0, 1, 1,
0.4314971, -0.5041543, 2.729526, 1, 1, 1, 1, 1,
0.4325725, 0.4303647, 2.908702, 1, 1, 1, 1, 1,
0.4368736, 1.003902, 0.7905673, 1, 1, 1, 1, 1,
0.436936, 0.9422749, -0.6678728, 1, 1, 1, 1, 1,
0.4455668, -0.8835896, 4.421579, 1, 1, 1, 1, 1,
0.4459378, 0.182799, 1.871891, 1, 1, 1, 1, 1,
0.4601175, -0.2422172, 1.397698, 1, 1, 1, 1, 1,
0.462648, 0.5010388, 0.8143728, 1, 1, 1, 1, 1,
0.4640995, 1.265436, 0.4681477, 1, 1, 1, 1, 1,
0.4647099, -0.4537559, 2.022321, 1, 1, 1, 1, 1,
0.4683196, -0.4531983, 1.663229, 1, 1, 1, 1, 1,
0.4699642, -0.330122, 0.9385137, 1, 1, 1, 1, 1,
0.4756247, -0.6592079, 1.914767, 1, 1, 1, 1, 1,
0.4810043, -0.4297062, 2.149624, 1, 1, 1, 1, 1,
0.4828426, 0.08955471, 1.51019, 1, 1, 1, 1, 1,
0.4837642, -0.4050869, 1.157335, 0, 0, 1, 1, 1,
0.4863067, -0.08905671, 2.278367, 1, 0, 0, 1, 1,
0.4946574, -1.329875, 3.087936, 1, 0, 0, 1, 1,
0.4995657, -0.5196087, 4.149121, 1, 0, 0, 1, 1,
0.5000407, -0.9059305, 3.624834, 1, 0, 0, 1, 1,
0.5009706, -0.9329526, 3.959366, 1, 0, 0, 1, 1,
0.5066677, 0.197591, 1.987349, 0, 0, 0, 1, 1,
0.5093664, -0.7749314, 3.617593, 0, 0, 0, 1, 1,
0.5166098, 0.455654, -0.1189234, 0, 0, 0, 1, 1,
0.523239, -0.8161923, 0.978943, 0, 0, 0, 1, 1,
0.5239847, -0.8910274, 3.26206, 0, 0, 0, 1, 1,
0.5264387, 0.3633598, 0.7816101, 0, 0, 0, 1, 1,
0.5271021, 1.352658, 1.873467, 0, 0, 0, 1, 1,
0.5281412, -0.7399939, 3.155569, 1, 1, 1, 1, 1,
0.5292701, -0.5914574, 1.866559, 1, 1, 1, 1, 1,
0.5327383, 1.109169, 1.31873, 1, 1, 1, 1, 1,
0.5344092, -0.05747005, 0.3098846, 1, 1, 1, 1, 1,
0.5361821, 0.7950283, -0.0111705, 1, 1, 1, 1, 1,
0.5387964, 2.03095, -0.1499557, 1, 1, 1, 1, 1,
0.5388181, 0.5614419, -2.136767, 1, 1, 1, 1, 1,
0.5390425, 0.0315681, 1.343314, 1, 1, 1, 1, 1,
0.5392623, -0.7833109, 2.695389, 1, 1, 1, 1, 1,
0.5408427, -1.102102, 3.587822, 1, 1, 1, 1, 1,
0.5424671, 0.7067119, 0.3329287, 1, 1, 1, 1, 1,
0.5450081, 0.1809913, 2.663622, 1, 1, 1, 1, 1,
0.5474415, 0.7979161, 1.040577, 1, 1, 1, 1, 1,
0.5479448, 1.100056, 1.502524, 1, 1, 1, 1, 1,
0.5523638, 0.5755896, 1.865203, 1, 1, 1, 1, 1,
0.5610961, 1.174984, 1.110639, 0, 0, 1, 1, 1,
0.5645923, -1.50329, 2.988065, 1, 0, 0, 1, 1,
0.5703688, -1.076379, 2.747505, 1, 0, 0, 1, 1,
0.5712897, -1.358523, 3.616234, 1, 0, 0, 1, 1,
0.5829197, -0.1386869, 1.919344, 1, 0, 0, 1, 1,
0.5839417, -1.075281, 2.045989, 1, 0, 0, 1, 1,
0.5849307, -0.644861, 3.051446, 0, 0, 0, 1, 1,
0.5888177, 0.7145, 1.639263, 0, 0, 0, 1, 1,
0.5914971, -0.522536, 2.924605, 0, 0, 0, 1, 1,
0.5917916, 1.82118, 0.2507765, 0, 0, 0, 1, 1,
0.5920552, 0.4731776, 1.16731, 0, 0, 0, 1, 1,
0.6025724, 0.6840916, 0.184698, 0, 0, 0, 1, 1,
0.6028875, -0.3969188, 0.821753, 0, 0, 0, 1, 1,
0.6079978, -0.5516699, 3.255585, 1, 1, 1, 1, 1,
0.6086634, 0.5634753, 2.070765, 1, 1, 1, 1, 1,
0.6145399, -0.02732702, 1.002383, 1, 1, 1, 1, 1,
0.6161392, -1.704978, 0.5300986, 1, 1, 1, 1, 1,
0.6205596, -0.5625103, 2.494314, 1, 1, 1, 1, 1,
0.6239263, -0.2797796, 1.384418, 1, 1, 1, 1, 1,
0.6250076, 0.5213608, 1.575887, 1, 1, 1, 1, 1,
0.6265225, -1.055638, 2.618824, 1, 1, 1, 1, 1,
0.6275694, -0.1732436, 2.453325, 1, 1, 1, 1, 1,
0.6288285, -0.3151194, 2.735929, 1, 1, 1, 1, 1,
0.6310225, -0.9527152, 2.187825, 1, 1, 1, 1, 1,
0.6332107, 0.4062305, -0.03400453, 1, 1, 1, 1, 1,
0.6338534, 1.247532, 1.189628, 1, 1, 1, 1, 1,
0.6364788, 0.4113476, 2.02009, 1, 1, 1, 1, 1,
0.6382511, -0.463006, 1.948667, 1, 1, 1, 1, 1,
0.639439, -1.641298, 2.270612, 0, 0, 1, 1, 1,
0.6407396, -0.9178904, 0.9872759, 1, 0, 0, 1, 1,
0.6407539, -1.262865, 3.139553, 1, 0, 0, 1, 1,
0.6417665, -0.932916, 2.769886, 1, 0, 0, 1, 1,
0.6458588, -0.3744712, 1.398099, 1, 0, 0, 1, 1,
0.6500036, 0.1454006, 0.0835661, 1, 0, 0, 1, 1,
0.6610253, 0.8907413, -1.092953, 0, 0, 0, 1, 1,
0.6642003, 1.895954, 0.2990972, 0, 0, 0, 1, 1,
0.6680253, -1.075655, 1.686399, 0, 0, 0, 1, 1,
0.668799, 0.2705035, 0.7318792, 0, 0, 0, 1, 1,
0.6743704, 1.295949, 0.02048712, 0, 0, 0, 1, 1,
0.6758991, 0.6409971, 1.843468, 0, 0, 0, 1, 1,
0.6781511, -0.6533913, 1.340525, 0, 0, 0, 1, 1,
0.6840312, 1.071709, 0.4184378, 1, 1, 1, 1, 1,
0.6886006, 0.7527362, -1.18194, 1, 1, 1, 1, 1,
0.6915868, -0.02488979, 0.8684903, 1, 1, 1, 1, 1,
0.7073824, 1.172511, 0.07916684, 1, 1, 1, 1, 1,
0.7073869, -2.592635, 1.059131, 1, 1, 1, 1, 1,
0.7107604, 0.2636889, 0.354472, 1, 1, 1, 1, 1,
0.7120661, 1.799118, 0.4556539, 1, 1, 1, 1, 1,
0.7150078, -0.5436605, 3.345608, 1, 1, 1, 1, 1,
0.7188432, 0.639125, 0.497541, 1, 1, 1, 1, 1,
0.7240465, 0.2657149, 0.7665378, 1, 1, 1, 1, 1,
0.7240714, -1.162468, 3.278764, 1, 1, 1, 1, 1,
0.7317315, -0.09350213, 2.234598, 1, 1, 1, 1, 1,
0.7327328, 1.148262, 2.412653, 1, 1, 1, 1, 1,
0.7348294, 0.3634522, -0.8281516, 1, 1, 1, 1, 1,
0.7368582, 1.265292, 1.344396, 1, 1, 1, 1, 1,
0.7475004, 1.442601, 0.3018088, 0, 0, 1, 1, 1,
0.7544965, -0.5013129, 3.094096, 1, 0, 0, 1, 1,
0.7581492, -0.206999, 2.906304, 1, 0, 0, 1, 1,
0.7593207, -0.727942, 1.561133, 1, 0, 0, 1, 1,
0.7595736, -0.1381353, 2.369454, 1, 0, 0, 1, 1,
0.7610316, 0.2890425, -0.3723333, 1, 0, 0, 1, 1,
0.7690826, 0.07108537, 0.8923752, 0, 0, 0, 1, 1,
0.7751458, -2.360919, 0.2295899, 0, 0, 0, 1, 1,
0.7759115, 0.9686425, 2.81831, 0, 0, 0, 1, 1,
0.7788591, -0.588732, 2.755851, 0, 0, 0, 1, 1,
0.7794906, 0.5081224, 0.8642767, 0, 0, 0, 1, 1,
0.7806004, 0.6816468, 0.06076275, 0, 0, 0, 1, 1,
0.785724, 0.3677932, -0.7334567, 0, 0, 0, 1, 1,
0.7892699, 0.7094852, 0.03982693, 1, 1, 1, 1, 1,
0.7946074, 1.455254, 1.61814, 1, 1, 1, 1, 1,
0.8076092, 0.4631644, 0.4272949, 1, 1, 1, 1, 1,
0.8095667, -0.129023, 2.469911, 1, 1, 1, 1, 1,
0.8117548, -0.3491521, 0.769402, 1, 1, 1, 1, 1,
0.8178967, 0.364347, 1.328403, 1, 1, 1, 1, 1,
0.8223075, 0.929217, 1.579995, 1, 1, 1, 1, 1,
0.8252963, -0.1632089, 2.643678, 1, 1, 1, 1, 1,
0.8260741, -0.8832136, 1.059879, 1, 1, 1, 1, 1,
0.8275588, 0.002899125, 2.250086, 1, 1, 1, 1, 1,
0.8286488, 0.8596293, 0.06397125, 1, 1, 1, 1, 1,
0.8299974, 0.4321925, 0.3746091, 1, 1, 1, 1, 1,
0.8370304, -1.822897, 2.604672, 1, 1, 1, 1, 1,
0.8381948, -0.6231533, 2.56415, 1, 1, 1, 1, 1,
0.8397991, 0.2215758, 1.818455, 1, 1, 1, 1, 1,
0.8419564, -0.5542516, 3.965446, 0, 0, 1, 1, 1,
0.8456726, 1.006189, 0.8990179, 1, 0, 0, 1, 1,
0.8498892, 0.03066311, 1.429762, 1, 0, 0, 1, 1,
0.8562545, 1.550285, 1.39275, 1, 0, 0, 1, 1,
0.8688796, -0.3940386, 2.032702, 1, 0, 0, 1, 1,
0.8753023, -1.611047, 2.876155, 1, 0, 0, 1, 1,
0.8763451, -0.7711256, 0.7927591, 0, 0, 0, 1, 1,
0.8776416, 0.204323, 0.6678026, 0, 0, 0, 1, 1,
0.8830528, 2.30247, 1.084445, 0, 0, 0, 1, 1,
0.8831907, -0.6804457, 2.093487, 0, 0, 0, 1, 1,
0.889325, 1.792352, 0.2958445, 0, 0, 0, 1, 1,
0.9017869, -0.3082855, 1.323105, 0, 0, 0, 1, 1,
0.901938, -0.01508329, 1.493638, 0, 0, 0, 1, 1,
0.9019598, -0.8105912, 2.769181, 1, 1, 1, 1, 1,
0.9030023, -1.016125, 4.785698, 1, 1, 1, 1, 1,
0.9052025, 0.6735278, 0.009438897, 1, 1, 1, 1, 1,
0.9087933, 0.07182877, 0.8260689, 1, 1, 1, 1, 1,
0.9162049, 0.6889179, -0.9782792, 1, 1, 1, 1, 1,
0.9186347, 0.1028771, 0.5534221, 1, 1, 1, 1, 1,
0.9229736, 0.831524, -0.09581875, 1, 1, 1, 1, 1,
0.9234809, -0.8718665, 2.408396, 1, 1, 1, 1, 1,
0.9270715, -0.4629696, 0.8295384, 1, 1, 1, 1, 1,
0.927111, 0.9482914, 0.6850277, 1, 1, 1, 1, 1,
0.9289765, -0.9938743, 2.428475, 1, 1, 1, 1, 1,
0.9307418, -1.235583, 1.313504, 1, 1, 1, 1, 1,
0.932921, 1.605238, -2.163453, 1, 1, 1, 1, 1,
0.9347103, 0.6871552, 1.404441, 1, 1, 1, 1, 1,
0.9437991, -0.4891024, 1.656153, 1, 1, 1, 1, 1,
0.9440248, 0.04902951, 0.5168033, 0, 0, 1, 1, 1,
0.9527286, -1.284862, 0.710238, 1, 0, 0, 1, 1,
0.9634597, -0.1674452, 0.9899182, 1, 0, 0, 1, 1,
0.9691654, 0.7213487, 2.71351, 1, 0, 0, 1, 1,
0.9709225, 2.319777, -0.305394, 1, 0, 0, 1, 1,
0.9728838, 0.1685364, 2.191742, 1, 0, 0, 1, 1,
0.9742833, 0.8839352, 2.360458, 0, 0, 0, 1, 1,
0.9751043, -0.6724966, 3.737683, 0, 0, 0, 1, 1,
0.9755021, -0.9704906, 2.119961, 0, 0, 0, 1, 1,
0.9788618, 0.01686516, 2.2793, 0, 0, 0, 1, 1,
0.9790081, 0.9327991, 0.9359229, 0, 0, 0, 1, 1,
0.979903, -1.376983, 4.595361, 0, 0, 0, 1, 1,
0.9881852, -1.47766, 2.497445, 0, 0, 0, 1, 1,
1.000658, 0.2765881, 2.913132, 1, 1, 1, 1, 1,
1.011893, -0.1465661, 3.011258, 1, 1, 1, 1, 1,
1.01248, 0.09793737, 0.3164925, 1, 1, 1, 1, 1,
1.017626, -0.2133466, 0.9582486, 1, 1, 1, 1, 1,
1.017765, 0.2140274, 3.609477, 1, 1, 1, 1, 1,
1.022018, -0.006772929, 2.794348, 1, 1, 1, 1, 1,
1.022258, -0.8050647, 1.823964, 1, 1, 1, 1, 1,
1.026931, 2.373496, 1.359423, 1, 1, 1, 1, 1,
1.032751, 0.379334, -0.7002991, 1, 1, 1, 1, 1,
1.038491, -0.1667344, 1.972403, 1, 1, 1, 1, 1,
1.043932, 1.546846, -0.3262874, 1, 1, 1, 1, 1,
1.045354, 0.1201995, 1.001972, 1, 1, 1, 1, 1,
1.046788, 0.1208915, 1.066467, 1, 1, 1, 1, 1,
1.050949, 0.3560053, 2.672949, 1, 1, 1, 1, 1,
1.051003, 0.5568041, 0.8809758, 1, 1, 1, 1, 1,
1.052967, 0.6640591, 1.16829, 0, 0, 1, 1, 1,
1.057434, 0.313204, 1.605824, 1, 0, 0, 1, 1,
1.066083, 0.3951084, 1.05084, 1, 0, 0, 1, 1,
1.06904, 0.2834897, 0.5201591, 1, 0, 0, 1, 1,
1.075159, 0.2434456, 0.552406, 1, 0, 0, 1, 1,
1.077587, 0.2243178, 0.9769726, 1, 0, 0, 1, 1,
1.083757, 0.2898714, 0.3925831, 0, 0, 0, 1, 1,
1.090383, -0.3606491, 2.447454, 0, 0, 0, 1, 1,
1.092154, 1.046591, -0.943842, 0, 0, 0, 1, 1,
1.096759, -0.1641663, 0.208378, 0, 0, 0, 1, 1,
1.101176, -1.965591, 2.587733, 0, 0, 0, 1, 1,
1.101667, 0.4852234, 1.26213, 0, 0, 0, 1, 1,
1.105028, -1.253351, 3.75504, 0, 0, 0, 1, 1,
1.106955, -0.6535466, 2.442681, 1, 1, 1, 1, 1,
1.111034, 1.555385, 1.045049, 1, 1, 1, 1, 1,
1.115238, 0.6014799, -0.7405434, 1, 1, 1, 1, 1,
1.12716, 0.04862287, 1.200388, 1, 1, 1, 1, 1,
1.128747, -1.05277, 0.9774191, 1, 1, 1, 1, 1,
1.136137, -2.213029, 1.936602, 1, 1, 1, 1, 1,
1.14503, 0.3360991, 1.28141, 1, 1, 1, 1, 1,
1.165236, 0.3774337, 1.490006, 1, 1, 1, 1, 1,
1.173101, -0.206612, 1.419726, 1, 1, 1, 1, 1,
1.175066, -0.7237039, 3.52014, 1, 1, 1, 1, 1,
1.178965, 0.2622965, 1.854525, 1, 1, 1, 1, 1,
1.191807, -0.338802, 1.378379, 1, 1, 1, 1, 1,
1.196071, 1.161139, -0.4045327, 1, 1, 1, 1, 1,
1.199386, -0.4425447, 2.913845, 1, 1, 1, 1, 1,
1.199929, -0.4343324, 0.7705864, 1, 1, 1, 1, 1,
1.202462, -1.116349, 4.007443, 0, 0, 1, 1, 1,
1.20516, -0.4980289, 1.986974, 1, 0, 0, 1, 1,
1.208375, -0.497016, 1.789093, 1, 0, 0, 1, 1,
1.216343, 0.3275405, 0.6892937, 1, 0, 0, 1, 1,
1.233176, 1.043078, 1.698328, 1, 0, 0, 1, 1,
1.233954, -0.3552507, 1.069072, 1, 0, 0, 1, 1,
1.239411, -1.18996, 4.158909, 0, 0, 0, 1, 1,
1.240424, 0.2636261, 1.808827, 0, 0, 0, 1, 1,
1.250145, -1.255768, 2.454932, 0, 0, 0, 1, 1,
1.254206, 0.6215289, -0.571496, 0, 0, 0, 1, 1,
1.25791, 0.823625, 0.8913909, 0, 0, 0, 1, 1,
1.269731, 1.50691, 0.4424689, 0, 0, 0, 1, 1,
1.270274, 0.4599687, 0.08417112, 0, 0, 0, 1, 1,
1.277099, -0.4221977, 2.275017, 1, 1, 1, 1, 1,
1.282276, -1.614201, 4.799469, 1, 1, 1, 1, 1,
1.301216, 0.5409505, 2.16617, 1, 1, 1, 1, 1,
1.301277, 1.533269, 0.7919721, 1, 1, 1, 1, 1,
1.303463, -1.243399, 1.859097, 1, 1, 1, 1, 1,
1.305627, 0.4502965, 1.357387, 1, 1, 1, 1, 1,
1.317686, -2.123416, 2.763882, 1, 1, 1, 1, 1,
1.336377, 0.3342203, 2.381737, 1, 1, 1, 1, 1,
1.338294, -0.08126464, 0.869535, 1, 1, 1, 1, 1,
1.353862, -0.9699727, 1.895457, 1, 1, 1, 1, 1,
1.372776, -0.1991248, 0.6621258, 1, 1, 1, 1, 1,
1.383615, 0.8331705, 1.557496, 1, 1, 1, 1, 1,
1.389071, 3.963662, 0.247706, 1, 1, 1, 1, 1,
1.408175, -0.4673163, 2.317294, 1, 1, 1, 1, 1,
1.42093, -0.3946399, 2.879037, 1, 1, 1, 1, 1,
1.422346, -0.1815893, 1.996009, 0, 0, 1, 1, 1,
1.423055, 1.040083, 1.191877, 1, 0, 0, 1, 1,
1.423606, 0.7952792, 2.122787, 1, 0, 0, 1, 1,
1.445697, 0.02060976, 2.993088, 1, 0, 0, 1, 1,
1.45322, -0.9501002, 2.018835, 1, 0, 0, 1, 1,
1.453615, 1.160148, -0.7571999, 1, 0, 0, 1, 1,
1.457374, -0.06451986, 3.19937, 0, 0, 0, 1, 1,
1.457466, -0.953336, 1.820113, 0, 0, 0, 1, 1,
1.466114, 0.02672848, 1.462763, 0, 0, 0, 1, 1,
1.470125, -1.154602, 2.462486, 0, 0, 0, 1, 1,
1.478261, -1.009957, 3.177496, 0, 0, 0, 1, 1,
1.479828, -0.0431089, 1.671948, 0, 0, 0, 1, 1,
1.481481, 1.81288, 1.440068, 0, 0, 0, 1, 1,
1.50503, -0.05730534, -0.3038129, 1, 1, 1, 1, 1,
1.515636, 0.7454821, 1.348034, 1, 1, 1, 1, 1,
1.528657, 1.517624, 1.411654, 1, 1, 1, 1, 1,
1.541375, -0.2844183, 2.28196, 1, 1, 1, 1, 1,
1.544933, -1.306534, 2.285099, 1, 1, 1, 1, 1,
1.546847, -0.04508163, 2.710092, 1, 1, 1, 1, 1,
1.555396, 0.4631675, 0.520873, 1, 1, 1, 1, 1,
1.560271, -0.1015582, 2.989979, 1, 1, 1, 1, 1,
1.560682, 1.579791, 1.479951, 1, 1, 1, 1, 1,
1.570203, -0.392321, -0.03302368, 1, 1, 1, 1, 1,
1.583049, -0.8306282, 1.338337, 1, 1, 1, 1, 1,
1.58328, -0.08694862, 2.676513, 1, 1, 1, 1, 1,
1.613716, 1.341564, 0.8016632, 1, 1, 1, 1, 1,
1.638604, -1.658288, 1.411635, 1, 1, 1, 1, 1,
1.639694, -0.5773507, 0.8903876, 1, 1, 1, 1, 1,
1.649048, 0.8063941, 0.790395, 0, 0, 1, 1, 1,
1.663401, -0.1585374, 2.062499, 1, 0, 0, 1, 1,
1.671142, -0.6292751, 0.8839551, 1, 0, 0, 1, 1,
1.700542, 1.70347, 0.4367773, 1, 0, 0, 1, 1,
1.703955, 0.587124, 0.8507972, 1, 0, 0, 1, 1,
1.724904, 0.06047406, 1.301207, 1, 0, 0, 1, 1,
1.748411, 0.545358, 3.222688, 0, 0, 0, 1, 1,
1.806481, -0.234962, 2.806906, 0, 0, 0, 1, 1,
1.825894, 1.359297, 1.461664, 0, 0, 0, 1, 1,
1.851453, -0.4178535, 1.274242, 0, 0, 0, 1, 1,
1.860948, -0.607845, 2.752693, 0, 0, 0, 1, 1,
1.86099, -1.281867, 2.574447, 0, 0, 0, 1, 1,
1.874913, -0.3303865, 2.895613, 0, 0, 0, 1, 1,
1.880812, 0.6946471, 1.970103, 1, 1, 1, 1, 1,
1.914619, 0.507315, 0.7534381, 1, 1, 1, 1, 1,
1.93967, -0.4552607, 1.155393, 1, 1, 1, 1, 1,
1.947669, -0.4379971, 2.472006, 1, 1, 1, 1, 1,
1.975566, -0.5548915, 1.019829, 1, 1, 1, 1, 1,
1.982482, 0.8926589, 1.815766, 1, 1, 1, 1, 1,
1.996715, 1.690253, 0.2685425, 1, 1, 1, 1, 1,
2.005571, 0.8655331, -0.5881107, 1, 1, 1, 1, 1,
2.007908, -0.1038706, 2.771194, 1, 1, 1, 1, 1,
2.00876, 0.628313, 1.244103, 1, 1, 1, 1, 1,
2.010786, -0.2068554, 1.973198, 1, 1, 1, 1, 1,
2.011319, -1.429599, 1.853893, 1, 1, 1, 1, 1,
2.033038, -2.027931, 2.365132, 1, 1, 1, 1, 1,
2.065745, 0.5892513, 0.6298379, 1, 1, 1, 1, 1,
2.068956, 0.02090307, 2.632951, 1, 1, 1, 1, 1,
2.087933, 0.4827403, 1.39056, 0, 0, 1, 1, 1,
2.105936, -1.987376, 1.914621, 1, 0, 0, 1, 1,
2.114908, -2.024291, 2.332063, 1, 0, 0, 1, 1,
2.132829, -1.890825, 2.590194, 1, 0, 0, 1, 1,
2.143767, -0.8386791, 1.276688, 1, 0, 0, 1, 1,
2.171072, -0.605065, 1.268318, 1, 0, 0, 1, 1,
2.175491, -0.5943424, 2.006794, 0, 0, 0, 1, 1,
2.194594, -1.819372, 2.817734, 0, 0, 0, 1, 1,
2.250357, -1.107873, 1.965926, 0, 0, 0, 1, 1,
2.271865, 0.754658, 0.9885937, 0, 0, 0, 1, 1,
2.277133, -0.1566722, 0.2518358, 0, 0, 0, 1, 1,
2.321198, 1.745609, 2.61466, 0, 0, 0, 1, 1,
2.334494, 0.7301905, 0.0316023, 0, 0, 0, 1, 1,
2.353785, 0.888369, -0.4614729, 1, 1, 1, 1, 1,
2.389024, 0.3797818, 2.140226, 1, 1, 1, 1, 1,
2.442567, 0.3532831, 2.168709, 1, 1, 1, 1, 1,
2.448578, 0.04251567, 2.608526, 1, 1, 1, 1, 1,
2.543581, 0.7252391, 2.174513, 1, 1, 1, 1, 1,
2.570458, -1.364543, 3.052354, 1, 1, 1, 1, 1,
3.247741, -0.5283899, 1.839183, 1, 1, 1, 1, 1
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
var radius = 10.13713;
var distance = 35.60625;
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
mvMatrix.translate( 0.217217, -0.4740822, 0.2880974 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.60625);
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
