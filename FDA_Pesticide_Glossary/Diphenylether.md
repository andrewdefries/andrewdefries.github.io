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
-3.275713, 0.3689696, -3.094891, 1, 0, 0, 1,
-3.083542, -0.207954, -3.85959, 1, 0.007843138, 0, 1,
-3.013655, -0.165758, -1.33785, 1, 0.01176471, 0, 1,
-2.97395, -0.1027198, -2.425974, 1, 0.01960784, 0, 1,
-2.515435, 0.369001, -2.686958, 1, 0.02352941, 0, 1,
-2.479447, 0.1913929, -1.567113, 1, 0.03137255, 0, 1,
-2.453043, 1.142232, -0.9480203, 1, 0.03529412, 0, 1,
-2.407093, -0.1183875, -1.436897, 1, 0.04313726, 0, 1,
-2.308266, 0.2442943, -1.406106, 1, 0.04705882, 0, 1,
-2.28985, -2.168516, -2.888564, 1, 0.05490196, 0, 1,
-2.281771, 0.2180083, -2.527515, 1, 0.05882353, 0, 1,
-2.278497, -0.2515317, -0.4596149, 1, 0.06666667, 0, 1,
-2.257182, -1.244359, -2.401433, 1, 0.07058824, 0, 1,
-2.242726, -0.1723105, -0.8850952, 1, 0.07843138, 0, 1,
-2.236261, -0.9776331, -0.6730327, 1, 0.08235294, 0, 1,
-2.235034, -1.405531, -1.755863, 1, 0.09019608, 0, 1,
-2.211426, -0.7794477, -1.699568, 1, 0.09411765, 0, 1,
-2.178868, 1.470214, -1.771837, 1, 0.1019608, 0, 1,
-2.170484, 0.4770509, -1.285294, 1, 0.1098039, 0, 1,
-2.149975, 0.4231573, -1.783238, 1, 0.1137255, 0, 1,
-2.089992, -0.07856985, -1.196675, 1, 0.1215686, 0, 1,
-2.083586, 0.8818766, -2.330076, 1, 0.1254902, 0, 1,
-2.080843, -0.8424185, -2.8844, 1, 0.1333333, 0, 1,
-2.074232, -1.005223, -1.97376, 1, 0.1372549, 0, 1,
-2.068976, 0.1335272, -1.137976, 1, 0.145098, 0, 1,
-1.998049, -0.08162598, -0.1073454, 1, 0.1490196, 0, 1,
-1.964309, 0.7637069, -1.44654, 1, 0.1568628, 0, 1,
-1.962523, 1.61816, -1.12231, 1, 0.1607843, 0, 1,
-1.944506, 1.669756, -0.6454536, 1, 0.1686275, 0, 1,
-1.943665, 0.7560467, -0.5457037, 1, 0.172549, 0, 1,
-1.935751, -0.02905814, -2.237386, 1, 0.1803922, 0, 1,
-1.934158, 0.02437518, -1.485809, 1, 0.1843137, 0, 1,
-1.929015, -0.8581038, -1.364796, 1, 0.1921569, 0, 1,
-1.921791, 0.3759314, -0.8018318, 1, 0.1960784, 0, 1,
-1.916086, -0.5128205, -0.5864976, 1, 0.2039216, 0, 1,
-1.904056, 1.637204, 1.992896, 1, 0.2117647, 0, 1,
-1.900746, 1.683401, 0.5815416, 1, 0.2156863, 0, 1,
-1.87741, 1.102402, 0.80832, 1, 0.2235294, 0, 1,
-1.865805, 0.9368507, -0.9523984, 1, 0.227451, 0, 1,
-1.85784, 2.345507, -0.03215853, 1, 0.2352941, 0, 1,
-1.857079, -2.241521, -2.449687, 1, 0.2392157, 0, 1,
-1.848328, -0.8050088, -3.601865, 1, 0.2470588, 0, 1,
-1.846715, 1.307064, -1.27763, 1, 0.2509804, 0, 1,
-1.844759, 1.176349, -0.3909198, 1, 0.2588235, 0, 1,
-1.840106, -0.1856231, -4.090834, 1, 0.2627451, 0, 1,
-1.813817, -0.1327267, -2.690315, 1, 0.2705882, 0, 1,
-1.808931, 0.2542739, -3.855884, 1, 0.2745098, 0, 1,
-1.779194, -0.1012544, -1.258098, 1, 0.282353, 0, 1,
-1.772427, 1.3357, 0.5291176, 1, 0.2862745, 0, 1,
-1.757965, -1.540849, -3.38142, 1, 0.2941177, 0, 1,
-1.748792, -0.9793371, -1.305409, 1, 0.3019608, 0, 1,
-1.739988, -0.672099, -0.4105148, 1, 0.3058824, 0, 1,
-1.711184, -0.09668458, -2.191436, 1, 0.3137255, 0, 1,
-1.704417, -0.3266839, -2.841095, 1, 0.3176471, 0, 1,
-1.697681, 0.4312893, -1.282728, 1, 0.3254902, 0, 1,
-1.695553, -1.284713, -1.415471, 1, 0.3294118, 0, 1,
-1.678717, 0.5990521, -1.545789, 1, 0.3372549, 0, 1,
-1.659341, -1.585657, -1.850898, 1, 0.3411765, 0, 1,
-1.650678, -0.1639314, -0.09066503, 1, 0.3490196, 0, 1,
-1.648221, 1.030741, -1.688002, 1, 0.3529412, 0, 1,
-1.645074, 1.968426, -1.167981, 1, 0.3607843, 0, 1,
-1.621139, -0.2048839, -3.197125, 1, 0.3647059, 0, 1,
-1.619803, -0.266675, -2.011445, 1, 0.372549, 0, 1,
-1.577291, 0.8280495, -1.406467, 1, 0.3764706, 0, 1,
-1.569538, -0.06142112, -0.9753749, 1, 0.3843137, 0, 1,
-1.566137, -1.303088, -2.114411, 1, 0.3882353, 0, 1,
-1.56116, -0.2908686, -0.7848135, 1, 0.3960784, 0, 1,
-1.551034, -0.09470766, -1.646558, 1, 0.4039216, 0, 1,
-1.546486, -1.367289, -3.265088, 1, 0.4078431, 0, 1,
-1.530657, 2.144132, 0.2514879, 1, 0.4156863, 0, 1,
-1.491714, 0.2676456, -1.322663, 1, 0.4196078, 0, 1,
-1.491239, -1.694676, -2.359248, 1, 0.427451, 0, 1,
-1.475927, -2.419741, -2.141308, 1, 0.4313726, 0, 1,
-1.472937, 0.5501614, -1.978956, 1, 0.4392157, 0, 1,
-1.437579, -0.237327, -1.194529, 1, 0.4431373, 0, 1,
-1.434805, -0.01091896, -1.513146, 1, 0.4509804, 0, 1,
-1.427246, -0.9174275, -3.260119, 1, 0.454902, 0, 1,
-1.417586, 1.603012, -0.9274821, 1, 0.4627451, 0, 1,
-1.415432, 1.328487, 0.08107459, 1, 0.4666667, 0, 1,
-1.402734, 0.3989422, -1.536532, 1, 0.4745098, 0, 1,
-1.401752, -0.9297836, -0.8030247, 1, 0.4784314, 0, 1,
-1.399368, -0.2651142, -2.712551, 1, 0.4862745, 0, 1,
-1.384953, -0.1678108, -2.34159, 1, 0.4901961, 0, 1,
-1.383048, 1.142183, 0.7272413, 1, 0.4980392, 0, 1,
-1.380449, 0.3228336, -0.8289515, 1, 0.5058824, 0, 1,
-1.373432, 1.708387, -0.5890617, 1, 0.509804, 0, 1,
-1.357666, -0.3750003, -4.341896, 1, 0.5176471, 0, 1,
-1.352437, 0.7755877, 0.5844383, 1, 0.5215687, 0, 1,
-1.346017, 0.3264864, 0.01375085, 1, 0.5294118, 0, 1,
-1.345492, -0.110516, -1.293614, 1, 0.5333334, 0, 1,
-1.33457, -0.02842522, -2.286889, 1, 0.5411765, 0, 1,
-1.324246, -0.272838, -2.147235, 1, 0.5450981, 0, 1,
-1.314934, -0.01004578, 0.1668393, 1, 0.5529412, 0, 1,
-1.314005, 0.9647092, -0.4393821, 1, 0.5568628, 0, 1,
-1.313782, 1.704006, -1.586227, 1, 0.5647059, 0, 1,
-1.310313, 0.8305184, -1.841351, 1, 0.5686275, 0, 1,
-1.304007, 0.0691845, -0.5378755, 1, 0.5764706, 0, 1,
-1.293858, 0.08381411, -1.51861, 1, 0.5803922, 0, 1,
-1.290632, 0.4924435, -1.389153, 1, 0.5882353, 0, 1,
-1.283937, 1.979985, 0.6464258, 1, 0.5921569, 0, 1,
-1.279544, -1.813614, -2.725073, 1, 0.6, 0, 1,
-1.275475, 1.172888, -0.1055412, 1, 0.6078432, 0, 1,
-1.270953, -0.4517933, -0.1403748, 1, 0.6117647, 0, 1,
-1.256501, 0.7182674, -1.132796, 1, 0.6196079, 0, 1,
-1.249107, 1.515443, -1.21321, 1, 0.6235294, 0, 1,
-1.244467, 0.9351582, -0.5312517, 1, 0.6313726, 0, 1,
-1.243911, -0.3751958, -1.755393, 1, 0.6352941, 0, 1,
-1.242749, 0.6063132, 0.7679636, 1, 0.6431373, 0, 1,
-1.237786, -2.0632, -2.474117, 1, 0.6470588, 0, 1,
-1.223366, -1.515386, -1.968626, 1, 0.654902, 0, 1,
-1.220583, 0.4198849, -3.496421, 1, 0.6588235, 0, 1,
-1.218372, 0.1967009, -1.052837, 1, 0.6666667, 0, 1,
-1.212455, -1.565001, -4.374444, 1, 0.6705883, 0, 1,
-1.208322, -0.15163, -1.341982, 1, 0.6784314, 0, 1,
-1.205806, 1.236713, -0.9385881, 1, 0.682353, 0, 1,
-1.202674, -0.08182713, -0.05575446, 1, 0.6901961, 0, 1,
-1.199436, 2.941408, -0.6250641, 1, 0.6941177, 0, 1,
-1.196649, -0.4718123, -0.8986534, 1, 0.7019608, 0, 1,
-1.193518, 1.060306, -1.814384, 1, 0.7098039, 0, 1,
-1.190728, -0.1509933, -2.401397, 1, 0.7137255, 0, 1,
-1.184315, 1.653055, -0.7486876, 1, 0.7215686, 0, 1,
-1.180677, -0.6906906, -1.987279, 1, 0.7254902, 0, 1,
-1.177083, -0.3117613, -2.554533, 1, 0.7333333, 0, 1,
-1.162946, 0.1007393, -2.059582, 1, 0.7372549, 0, 1,
-1.161294, 0.6277853, -2.156884, 1, 0.7450981, 0, 1,
-1.147678, -0.5893559, -2.930573, 1, 0.7490196, 0, 1,
-1.139379, 0.866005, -1.288908, 1, 0.7568628, 0, 1,
-1.137487, 0.783642, -0.01642751, 1, 0.7607843, 0, 1,
-1.134329, 0.5375246, -1.599763, 1, 0.7686275, 0, 1,
-1.133967, -1.302893, -2.898648, 1, 0.772549, 0, 1,
-1.1275, -0.3726319, -4.940629, 1, 0.7803922, 0, 1,
-1.1225, 0.1229206, 0.1760223, 1, 0.7843137, 0, 1,
-1.121904, -0.3908361, -2.377811, 1, 0.7921569, 0, 1,
-1.117386, -0.827739, -4.304015, 1, 0.7960784, 0, 1,
-1.116112, 0.4157311, -0.9091508, 1, 0.8039216, 0, 1,
-1.102019, -0.05953155, -0.505299, 1, 0.8117647, 0, 1,
-1.099994, 1.361933, -0.8245136, 1, 0.8156863, 0, 1,
-1.097435, -0.5799124, -1.32195, 1, 0.8235294, 0, 1,
-1.09516, -0.3732937, -1.759139, 1, 0.827451, 0, 1,
-1.085444, 0.511242, -0.8778274, 1, 0.8352941, 0, 1,
-1.081522, 0.5322664, -2.736461, 1, 0.8392157, 0, 1,
-1.079716, 0.9242346, 0.3099692, 1, 0.8470588, 0, 1,
-1.078067, 0.09710233, -1.593387, 1, 0.8509804, 0, 1,
-1.076655, 0.2711283, -1.230542, 1, 0.8588235, 0, 1,
-1.064299, -0.1610888, -2.239846, 1, 0.8627451, 0, 1,
-1.063594, -1.602942, -3.195816, 1, 0.8705882, 0, 1,
-1.036582, 0.04263949, -1.496615, 1, 0.8745098, 0, 1,
-1.036197, 0.2080624, -2.103283, 1, 0.8823529, 0, 1,
-1.027533, -0.4744355, -2.796966, 1, 0.8862745, 0, 1,
-1.024964, 0.039307, -0.5882757, 1, 0.8941177, 0, 1,
-1.021865, 0.344418, -3.925631, 1, 0.8980392, 0, 1,
-1.015513, 0.1253261, -1.602453, 1, 0.9058824, 0, 1,
-1.015065, 0.1337628, -1.384056, 1, 0.9137255, 0, 1,
-1.01237, -0.2739567, -2.187518, 1, 0.9176471, 0, 1,
-1.009621, 0.2117267, -2.23085, 1, 0.9254902, 0, 1,
-1.003328, -0.4703436, -2.15698, 1, 0.9294118, 0, 1,
-0.9890798, 0.6890736, -0.847791, 1, 0.9372549, 0, 1,
-0.9835296, -0.08812547, -1.138344, 1, 0.9411765, 0, 1,
-0.9712429, -1.386496, -1.879243, 1, 0.9490196, 0, 1,
-0.9637055, -0.1366832, 0.04855623, 1, 0.9529412, 0, 1,
-0.9628649, 1.114806, -0.6945423, 1, 0.9607843, 0, 1,
-0.9620485, 0.04869039, -3.363603, 1, 0.9647059, 0, 1,
-0.9604433, 0.08492333, -2.209427, 1, 0.972549, 0, 1,
-0.9463376, -0.4075515, -0.424928, 1, 0.9764706, 0, 1,
-0.9410322, 0.9048403, -1.786398, 1, 0.9843137, 0, 1,
-0.940104, 0.447125, 1.418777, 1, 0.9882353, 0, 1,
-0.9358693, -0.5186816, -2.739371, 1, 0.9960784, 0, 1,
-0.9300081, -1.067317, -3.430153, 0.9960784, 1, 0, 1,
-0.9267556, -1.222783, -2.424581, 0.9921569, 1, 0, 1,
-0.9216965, 0.1844499, -2.292239, 0.9843137, 1, 0, 1,
-0.913451, -0.1954398, -0.9849942, 0.9803922, 1, 0, 1,
-0.9116964, 0.2469256, -1.586199, 0.972549, 1, 0, 1,
-0.9061648, 0.2532122, -0.7806941, 0.9686275, 1, 0, 1,
-0.8972013, -1.926688, -2.922536, 0.9607843, 1, 0, 1,
-0.8953694, -0.3567051, -2.447003, 0.9568627, 1, 0, 1,
-0.8927696, 0.107069, -2.521374, 0.9490196, 1, 0, 1,
-0.8811567, -0.9312716, -4.189488, 0.945098, 1, 0, 1,
-0.8728271, -0.9411958, -2.545755, 0.9372549, 1, 0, 1,
-0.870196, 1.425028, -0.7169769, 0.9333333, 1, 0, 1,
-0.8691616, 0.4814084, -0.1401322, 0.9254902, 1, 0, 1,
-0.8669394, 0.6939129, -1.146396, 0.9215686, 1, 0, 1,
-0.8649597, 0.7659163, -0.7020299, 0.9137255, 1, 0, 1,
-0.8632334, -1.628994, -1.335934, 0.9098039, 1, 0, 1,
-0.8606486, -0.8414578, -2.472774, 0.9019608, 1, 0, 1,
-0.8606443, 0.2604672, -0.8697536, 0.8941177, 1, 0, 1,
-0.8562389, -0.1116927, -1.182052, 0.8901961, 1, 0, 1,
-0.8547841, 1.148773, -0.1014449, 0.8823529, 1, 0, 1,
-0.8507903, 0.6944395, -2.104406, 0.8784314, 1, 0, 1,
-0.8495034, 0.7790844, 0.4123386, 0.8705882, 1, 0, 1,
-0.8455822, -0.8064607, -2.648552, 0.8666667, 1, 0, 1,
-0.8296935, -0.6022044, -1.483686, 0.8588235, 1, 0, 1,
-0.8197721, -1.235839, -4.311721, 0.854902, 1, 0, 1,
-0.8150204, 0.7375889, -0.3387321, 0.8470588, 1, 0, 1,
-0.8069627, -2.350026, -3.083798, 0.8431373, 1, 0, 1,
-0.802673, 0.8270751, -0.7921144, 0.8352941, 1, 0, 1,
-0.8015477, 0.9286155, 0.310689, 0.8313726, 1, 0, 1,
-0.7981973, -0.7242095, -0.8109715, 0.8235294, 1, 0, 1,
-0.7971129, 0.7630485, -1.361549, 0.8196079, 1, 0, 1,
-0.7925408, -1.007801, -2.301498, 0.8117647, 1, 0, 1,
-0.7885364, 0.09720941, -2.030786, 0.8078431, 1, 0, 1,
-0.7858005, -0.2406388, -1.293149, 0.8, 1, 0, 1,
-0.7835048, 0.5125563, -1.548704, 0.7921569, 1, 0, 1,
-0.7826781, -0.9923407, -2.401142, 0.7882353, 1, 0, 1,
-0.764049, -0.4336427, -3.371251, 0.7803922, 1, 0, 1,
-0.7635463, 1.108177, 0.6043685, 0.7764706, 1, 0, 1,
-0.7619742, -0.1765565, -2.765944, 0.7686275, 1, 0, 1,
-0.7574957, -1.530032, -0.5714959, 0.7647059, 1, 0, 1,
-0.7568681, 0.9671525, -2.279292, 0.7568628, 1, 0, 1,
-0.7561121, 0.5249015, -1.169749, 0.7529412, 1, 0, 1,
-0.7464671, 1.067329, -1.263727, 0.7450981, 1, 0, 1,
-0.7425875, 2.490827, 2.261461, 0.7411765, 1, 0, 1,
-0.7383524, 0.4239527, -1.227953, 0.7333333, 1, 0, 1,
-0.738283, -0.7572426, -2.658413, 0.7294118, 1, 0, 1,
-0.7323319, 0.4938482, -1.477915, 0.7215686, 1, 0, 1,
-0.7297518, -0.8434117, -3.046443, 0.7176471, 1, 0, 1,
-0.7291969, -0.2100313, -1.858334, 0.7098039, 1, 0, 1,
-0.7285312, 0.5577343, -0.06702269, 0.7058824, 1, 0, 1,
-0.7278616, 1.042053, -0.7012606, 0.6980392, 1, 0, 1,
-0.7188567, -0.6364865, -1.326123, 0.6901961, 1, 0, 1,
-0.7146801, -0.6422715, -2.252681, 0.6862745, 1, 0, 1,
-0.7138972, -0.7414474, -1.863534, 0.6784314, 1, 0, 1,
-0.7130337, -0.4018849, -0.6661245, 0.6745098, 1, 0, 1,
-0.7038422, 0.5417882, -1.18531, 0.6666667, 1, 0, 1,
-0.7021675, 1.151516, 0.1073115, 0.6627451, 1, 0, 1,
-0.6873836, 0.5492492, -0.9534398, 0.654902, 1, 0, 1,
-0.6858612, 0.1952845, -1.579054, 0.6509804, 1, 0, 1,
-0.6847142, -0.8604156, -2.312639, 0.6431373, 1, 0, 1,
-0.6819764, -0.4625236, -2.275665, 0.6392157, 1, 0, 1,
-0.6739982, 1.027238, 0.7282046, 0.6313726, 1, 0, 1,
-0.6714889, 0.07570861, -0.5309251, 0.627451, 1, 0, 1,
-0.6655062, -2.594495, -3.939453, 0.6196079, 1, 0, 1,
-0.6653582, -1.597744, -2.590241, 0.6156863, 1, 0, 1,
-0.6652454, 0.5529085, -1.444633, 0.6078432, 1, 0, 1,
-0.663848, 0.5199296, -1.094182, 0.6039216, 1, 0, 1,
-0.6625878, -0.9963745, -3.515981, 0.5960785, 1, 0, 1,
-0.6588408, -0.4252442, -1.57408, 0.5882353, 1, 0, 1,
-0.6585245, -0.9902576, -2.460422, 0.5843138, 1, 0, 1,
-0.6565574, 0.3716564, -0.7987955, 0.5764706, 1, 0, 1,
-0.6554382, -1.324219, -1.673064, 0.572549, 1, 0, 1,
-0.6479197, -0.8775029, -0.9991264, 0.5647059, 1, 0, 1,
-0.6465739, 0.30429, -1.123854, 0.5607843, 1, 0, 1,
-0.6463842, -1.915023, -2.648586, 0.5529412, 1, 0, 1,
-0.6457602, -0.6151433, -1.914613, 0.5490196, 1, 0, 1,
-0.6390793, 0.3908619, -1.901617, 0.5411765, 1, 0, 1,
-0.6379195, 1.036623, 0.09007649, 0.5372549, 1, 0, 1,
-0.6345717, -0.6780367, -1.322638, 0.5294118, 1, 0, 1,
-0.6272479, 0.9539142, 0.3375229, 0.5254902, 1, 0, 1,
-0.6214777, 0.380523, -0.8675801, 0.5176471, 1, 0, 1,
-0.6120268, -1.485103, -4.445956, 0.5137255, 1, 0, 1,
-0.6101806, 0.2240535, -1.16306, 0.5058824, 1, 0, 1,
-0.6074002, -0.8522011, -3.611981, 0.5019608, 1, 0, 1,
-0.6069879, -0.0727815, -1.175635, 0.4941176, 1, 0, 1,
-0.6041891, 0.2412741, -0.9976709, 0.4862745, 1, 0, 1,
-0.591984, 1.36594, -0.7570258, 0.4823529, 1, 0, 1,
-0.5894719, -0.9328364, -2.993271, 0.4745098, 1, 0, 1,
-0.5876341, -0.992794, -2.752849, 0.4705882, 1, 0, 1,
-0.5867584, -0.3943929, -1.144541, 0.4627451, 1, 0, 1,
-0.5821251, -1.542817, -2.824998, 0.4588235, 1, 0, 1,
-0.5809133, 2.763931, -0.2913702, 0.4509804, 1, 0, 1,
-0.5797657, -0.4944844, -4.414413, 0.4470588, 1, 0, 1,
-0.5762165, -1.291767, -3.213683, 0.4392157, 1, 0, 1,
-0.5758657, 1.207487, -2.148088, 0.4352941, 1, 0, 1,
-0.5710797, 1.389785, -1.434175, 0.427451, 1, 0, 1,
-0.5636928, 0.7034377, -1.904312, 0.4235294, 1, 0, 1,
-0.5631961, 0.354289, -0.9502649, 0.4156863, 1, 0, 1,
-0.562052, 0.9658942, -2.09202, 0.4117647, 1, 0, 1,
-0.561857, -1.531424, -2.484314, 0.4039216, 1, 0, 1,
-0.5566559, 0.5518366, -0.3389344, 0.3960784, 1, 0, 1,
-0.5480968, 0.2084865, 0.7210957, 0.3921569, 1, 0, 1,
-0.5463852, -0.4866244, -3.055002, 0.3843137, 1, 0, 1,
-0.5403317, -1.837979, -2.781922, 0.3803922, 1, 0, 1,
-0.5355172, -0.9197397, -2.345762, 0.372549, 1, 0, 1,
-0.5349514, 0.1122734, -1.774243, 0.3686275, 1, 0, 1,
-0.5301659, 1.717397, -1.559383, 0.3607843, 1, 0, 1,
-0.5278856, -0.6601013, -2.057789, 0.3568628, 1, 0, 1,
-0.5254371, -0.751278, -2.992265, 0.3490196, 1, 0, 1,
-0.5216121, -0.3982732, -2.455961, 0.345098, 1, 0, 1,
-0.5207797, -2.598683, -0.8229868, 0.3372549, 1, 0, 1,
-0.5184769, -0.8054053, -2.183357, 0.3333333, 1, 0, 1,
-0.5157974, -0.7096174, -2.710705, 0.3254902, 1, 0, 1,
-0.5077747, 1.085117, -0.2535204, 0.3215686, 1, 0, 1,
-0.5034019, 0.2907586, -1.138537, 0.3137255, 1, 0, 1,
-0.4930529, -1.770493, -4.665525, 0.3098039, 1, 0, 1,
-0.4927418, -0.2791312, -3.080892, 0.3019608, 1, 0, 1,
-0.4926772, 1.287104, 0.5857735, 0.2941177, 1, 0, 1,
-0.4912917, 0.7007922, 0.2787271, 0.2901961, 1, 0, 1,
-0.4881996, -1.174193, -1.864142, 0.282353, 1, 0, 1,
-0.4845379, 0.9431881, -0.2573538, 0.2784314, 1, 0, 1,
-0.4837535, 0.03226262, -1.363787, 0.2705882, 1, 0, 1,
-0.4785461, 0.8206819, 0.5287477, 0.2666667, 1, 0, 1,
-0.4740303, -0.4115705, -2.676792, 0.2588235, 1, 0, 1,
-0.4721343, 0.6076055, -0.575458, 0.254902, 1, 0, 1,
-0.4659512, -0.3395278, -2.156302, 0.2470588, 1, 0, 1,
-0.4658502, 0.4284375, -0.5007578, 0.2431373, 1, 0, 1,
-0.4642299, 2.199381, -0.8799902, 0.2352941, 1, 0, 1,
-0.4640194, 0.449987, 1.356947, 0.2313726, 1, 0, 1,
-0.4633409, 1.398553, -1.079097, 0.2235294, 1, 0, 1,
-0.4607571, -0.8336579, -2.129441, 0.2196078, 1, 0, 1,
-0.4585049, -0.2328945, -2.798596, 0.2117647, 1, 0, 1,
-0.4579958, -1.431944, -4.16398, 0.2078431, 1, 0, 1,
-0.4577165, 0.5843185, -0.1460734, 0.2, 1, 0, 1,
-0.4527853, -0.872083, -1.308955, 0.1921569, 1, 0, 1,
-0.4475793, 1.295291, 0.3559486, 0.1882353, 1, 0, 1,
-0.4474342, 0.230947, -1.262455, 0.1803922, 1, 0, 1,
-0.4416322, -1.00102, -2.319472, 0.1764706, 1, 0, 1,
-0.4408671, -1.044131, -2.489091, 0.1686275, 1, 0, 1,
-0.4396448, 1.638159, 0.3604191, 0.1647059, 1, 0, 1,
-0.4334874, -2.126331, -2.945968, 0.1568628, 1, 0, 1,
-0.4233897, -0.6830183, -2.302065, 0.1529412, 1, 0, 1,
-0.4130454, 0.2245848, -2.125685, 0.145098, 1, 0, 1,
-0.4073575, -0.873033, -1.892313, 0.1411765, 1, 0, 1,
-0.4047128, -0.2417195, -0.9996329, 0.1333333, 1, 0, 1,
-0.3992288, 0.3490207, -1.894329, 0.1294118, 1, 0, 1,
-0.397085, -1.306152, -2.701191, 0.1215686, 1, 0, 1,
-0.3963292, 0.8272383, 0.1306763, 0.1176471, 1, 0, 1,
-0.3949884, -0.7468709, -4.961003, 0.1098039, 1, 0, 1,
-0.3929496, -1.359152, -2.351197, 0.1058824, 1, 0, 1,
-0.3911375, -1.423075, -1.986408, 0.09803922, 1, 0, 1,
-0.3844064, 0.2210244, -1.445027, 0.09019608, 1, 0, 1,
-0.3814819, -0.06198557, -2.052834, 0.08627451, 1, 0, 1,
-0.3802018, 0.67284, -0.8817621, 0.07843138, 1, 0, 1,
-0.3652167, -1.331941, -4.017532, 0.07450981, 1, 0, 1,
-0.3646697, -0.785704, -3.581832, 0.06666667, 1, 0, 1,
-0.3623898, -2.537165, -3.906014, 0.0627451, 1, 0, 1,
-0.3617189, -1.350543, -2.048789, 0.05490196, 1, 0, 1,
-0.3610051, -0.1199594, -2.831002, 0.05098039, 1, 0, 1,
-0.359186, 0.5257275, -2.209094, 0.04313726, 1, 0, 1,
-0.3588241, 0.09524076, -1.652544, 0.03921569, 1, 0, 1,
-0.3560153, 0.07709602, -0.564588, 0.03137255, 1, 0, 1,
-0.3550294, 0.1808508, 0.6409847, 0.02745098, 1, 0, 1,
-0.3538939, -0.2745111, -2.152342, 0.01960784, 1, 0, 1,
-0.3483942, 0.3740715, -0.0497342, 0.01568628, 1, 0, 1,
-0.3465597, 0.8768786, -0.4516179, 0.007843138, 1, 0, 1,
-0.3449908, -0.09531406, -2.964955, 0.003921569, 1, 0, 1,
-0.3448402, -1.435865, -1.605527, 0, 1, 0.003921569, 1,
-0.3444279, -1.105112, -2.018537, 0, 1, 0.01176471, 1,
-0.343558, 1.657417, -0.2896374, 0, 1, 0.01568628, 1,
-0.3394092, 1.253798, 0.4462637, 0, 1, 0.02352941, 1,
-0.335937, -0.2106372, -4.561999, 0, 1, 0.02745098, 1,
-0.3349482, -0.6359918, -2.946875, 0, 1, 0.03529412, 1,
-0.3323968, -1.333098, -5.306293, 0, 1, 0.03921569, 1,
-0.3314639, 1.845567, -0.5431809, 0, 1, 0.04705882, 1,
-0.3298351, -0.4735904, -1.722404, 0, 1, 0.05098039, 1,
-0.3271184, -0.7766975, -1.559787, 0, 1, 0.05882353, 1,
-0.3198785, 1.115846, 0.1885499, 0, 1, 0.0627451, 1,
-0.3174015, 0.2226272, 0.2955832, 0, 1, 0.07058824, 1,
-0.3145043, 0.9390566, -0.8912434, 0, 1, 0.07450981, 1,
-0.3106687, 2.293008, -0.2966799, 0, 1, 0.08235294, 1,
-0.3102543, 0.1315682, -0.4235576, 0, 1, 0.08627451, 1,
-0.3077493, -0.1811359, -2.307441, 0, 1, 0.09411765, 1,
-0.3002178, 2.159808, 0.6591138, 0, 1, 0.1019608, 1,
-0.2977721, -0.8584944, -2.415085, 0, 1, 0.1058824, 1,
-0.2971141, -0.405109, -5.575092, 0, 1, 0.1137255, 1,
-0.2938258, -0.2176549, -1.669308, 0, 1, 0.1176471, 1,
-0.293806, 1.476206, -1.421515, 0, 1, 0.1254902, 1,
-0.2928955, -1.24071, -2.702626, 0, 1, 0.1294118, 1,
-0.2883182, 0.483232, -1.746325, 0, 1, 0.1372549, 1,
-0.278783, 0.2726334, -0.5273137, 0, 1, 0.1411765, 1,
-0.2775536, 2.227603, -0.3026439, 0, 1, 0.1490196, 1,
-0.2766041, -1.805543, -3.900273, 0, 1, 0.1529412, 1,
-0.2716619, 0.2898149, -1.800546, 0, 1, 0.1607843, 1,
-0.2689223, -0.7901513, -4.985511, 0, 1, 0.1647059, 1,
-0.2671999, -0.5595045, -1.440798, 0, 1, 0.172549, 1,
-0.2601723, -0.972234, -3.632895, 0, 1, 0.1764706, 1,
-0.2573608, -0.2131195, -0.8447246, 0, 1, 0.1843137, 1,
-0.2541258, 0.5710563, 0.259381, 0, 1, 0.1882353, 1,
-0.2517151, -0.7460302, -1.92547, 0, 1, 0.1960784, 1,
-0.2493681, -1.350778, -2.510506, 0, 1, 0.2039216, 1,
-0.2455124, 0.586971, -0.4389427, 0, 1, 0.2078431, 1,
-0.2434385, 0.8800281, -0.3956401, 0, 1, 0.2156863, 1,
-0.237959, -0.7307891, -2.357456, 0, 1, 0.2196078, 1,
-0.2326838, -1.324965, -1.866611, 0, 1, 0.227451, 1,
-0.2316027, -1.341176, -2.417116, 0, 1, 0.2313726, 1,
-0.229366, 2.009892, -0.7005547, 0, 1, 0.2392157, 1,
-0.2289896, 1.606475, -0.1837513, 0, 1, 0.2431373, 1,
-0.2244409, 0.520687, -3.311257, 0, 1, 0.2509804, 1,
-0.2239153, -1.072261, -2.842027, 0, 1, 0.254902, 1,
-0.2229791, 0.4099838, -0.2251901, 0, 1, 0.2627451, 1,
-0.214488, -0.6448683, -2.857833, 0, 1, 0.2666667, 1,
-0.2131746, -2.425626, -4.524974, 0, 1, 0.2745098, 1,
-0.2121148, 0.7082316, -0.3516319, 0, 1, 0.2784314, 1,
-0.2121042, 0.3600396, -1.17434, 0, 1, 0.2862745, 1,
-0.2119421, 1.385859, -1.029877, 0, 1, 0.2901961, 1,
-0.1965267, -2.23906, -4.368317, 0, 1, 0.2980392, 1,
-0.195448, -0.7164499, -2.447647, 0, 1, 0.3058824, 1,
-0.192052, 0.7630153, -1.248426, 0, 1, 0.3098039, 1,
-0.1912614, 0.9378756, -0.2930672, 0, 1, 0.3176471, 1,
-0.1911317, -1.759714, -2.613503, 0, 1, 0.3215686, 1,
-0.1889277, -0.6438559, -3.823592, 0, 1, 0.3294118, 1,
-0.1827874, 0.3484369, 0.4604779, 0, 1, 0.3333333, 1,
-0.1822188, -0.3328077, -3.16456, 0, 1, 0.3411765, 1,
-0.1803376, 2.407238, 0.2503235, 0, 1, 0.345098, 1,
-0.1798298, -1.083784, -2.335194, 0, 1, 0.3529412, 1,
-0.1745321, -0.4882514, -3.191864, 0, 1, 0.3568628, 1,
-0.1723361, 1.162431, 0.1752851, 0, 1, 0.3647059, 1,
-0.1720676, -0.5462345, -2.213981, 0, 1, 0.3686275, 1,
-0.1719589, 0.4460692, 0.3964646, 0, 1, 0.3764706, 1,
-0.1699752, 1.126952, 0.3318271, 0, 1, 0.3803922, 1,
-0.169266, 0.612136, 2.509555, 0, 1, 0.3882353, 1,
-0.1681265, 0.0004816234, -3.474298, 0, 1, 0.3921569, 1,
-0.1645441, -0.9372268, -2.513319, 0, 1, 0.4, 1,
-0.1625232, -0.3021101, -3.742466, 0, 1, 0.4078431, 1,
-0.1622482, 0.07308169, 0.5839325, 0, 1, 0.4117647, 1,
-0.1605143, -1.169142, -2.186022, 0, 1, 0.4196078, 1,
-0.15735, 0.1695455, -1.351215, 0, 1, 0.4235294, 1,
-0.1572278, -0.05748292, -0.6133067, 0, 1, 0.4313726, 1,
-0.1511054, -0.2882945, -3.140105, 0, 1, 0.4352941, 1,
-0.1491767, 0.9498403, -0.1887152, 0, 1, 0.4431373, 1,
-0.1467252, -2.201129, -3.706702, 0, 1, 0.4470588, 1,
-0.1399314, -0.3928258, -1.757143, 0, 1, 0.454902, 1,
-0.138789, -0.2152445, -2.119009, 0, 1, 0.4588235, 1,
-0.1385904, 1.113598, -0.1546683, 0, 1, 0.4666667, 1,
-0.1367394, -1.054285, -4.203638, 0, 1, 0.4705882, 1,
-0.131607, -1.391999, -4.037645, 0, 1, 0.4784314, 1,
-0.1286361, -1.18813, -4.243472, 0, 1, 0.4823529, 1,
-0.1221562, 1.110145, -0.3242221, 0, 1, 0.4901961, 1,
-0.1205005, 0.6229041, 0.3792392, 0, 1, 0.4941176, 1,
-0.119544, -0.2080824, -1.887762, 0, 1, 0.5019608, 1,
-0.1190641, -1.349911, -3.382662, 0, 1, 0.509804, 1,
-0.1187527, -1.75167, -3.756797, 0, 1, 0.5137255, 1,
-0.114348, 0.1170862, -1.184767, 0, 1, 0.5215687, 1,
-0.1010221, -0.9035596, -2.561614, 0, 1, 0.5254902, 1,
-0.09571238, 0.4186387, 0.2344631, 0, 1, 0.5333334, 1,
-0.09135971, 0.2857686, -1.452834, 0, 1, 0.5372549, 1,
-0.09001698, 2.078235, -0.5623235, 0, 1, 0.5450981, 1,
-0.08909729, 0.7516183, -1.103987, 0, 1, 0.5490196, 1,
-0.08840437, -1.288906, -2.968174, 0, 1, 0.5568628, 1,
-0.08833569, -0.9602668, -2.004722, 0, 1, 0.5607843, 1,
-0.08475768, 0.08706638, -2.551575, 0, 1, 0.5686275, 1,
-0.08369674, -0.6630982, -3.107717, 0, 1, 0.572549, 1,
-0.08151793, 0.5706888, -0.4769211, 0, 1, 0.5803922, 1,
-0.07905558, -0.1548339, -3.401845, 0, 1, 0.5843138, 1,
-0.07794766, 0.2011812, -1.650583, 0, 1, 0.5921569, 1,
-0.07490414, 0.1338667, -3.22353, 0, 1, 0.5960785, 1,
-0.0670195, 0.7247043, 0.9266562, 0, 1, 0.6039216, 1,
-0.0626756, 0.8564116, 0.8664052, 0, 1, 0.6117647, 1,
-0.06117113, 0.4375969, -1.189399, 0, 1, 0.6156863, 1,
-0.06087859, -1.280024, -2.349509, 0, 1, 0.6235294, 1,
-0.0596704, 0.04556327, -0.295081, 0, 1, 0.627451, 1,
-0.05840031, -0.03455471, -3.053044, 0, 1, 0.6352941, 1,
-0.0570951, 0.2130812, 2.467367, 0, 1, 0.6392157, 1,
-0.05431267, 0.2754968, -1.03604, 0, 1, 0.6470588, 1,
-0.04957793, 0.8408815, -0.5745339, 0, 1, 0.6509804, 1,
-0.04807214, 1.854114, -0.3166914, 0, 1, 0.6588235, 1,
-0.04789823, 0.1395993, -3.149909, 0, 1, 0.6627451, 1,
-0.0478791, 1.469931, -1.939085, 0, 1, 0.6705883, 1,
-0.04530929, -1.282779, -3.717781, 0, 1, 0.6745098, 1,
-0.04509934, 1.435813, 0.5269298, 0, 1, 0.682353, 1,
-0.04484642, 0.1954257, -0.1717176, 0, 1, 0.6862745, 1,
-0.03415582, 0.7826262, -0.155319, 0, 1, 0.6941177, 1,
-0.02677503, -1.655112, -5.526654, 0, 1, 0.7019608, 1,
-0.02325713, -0.9200475, -2.892222, 0, 1, 0.7058824, 1,
-0.02289802, 1.213688, 0.1029019, 0, 1, 0.7137255, 1,
-0.01922128, 0.327854, -0.1718095, 0, 1, 0.7176471, 1,
-0.01580727, -0.2725419, -3.747477, 0, 1, 0.7254902, 1,
-0.01519587, -0.3823996, -3.5812, 0, 1, 0.7294118, 1,
-0.01460066, 1.02785, 1.216, 0, 1, 0.7372549, 1,
-0.0109053, 0.3865068, -2.237052, 0, 1, 0.7411765, 1,
-0.01054477, 0.04875842, -2.640829, 0, 1, 0.7490196, 1,
-0.008043646, 0.6686692, -0.2880753, 0, 1, 0.7529412, 1,
-0.0061848, 1.361633, 0.6183974, 0, 1, 0.7607843, 1,
-0.0001888147, 0.7907059, -0.363676, 0, 1, 0.7647059, 1,
0.002161942, 0.5693156, 0.8059975, 0, 1, 0.772549, 1,
0.003029557, 1.477757, -0.1439398, 0, 1, 0.7764706, 1,
0.003435003, -0.6238531, 3.262119, 0, 1, 0.7843137, 1,
0.003600858, 0.2757564, -0.8391147, 0, 1, 0.7882353, 1,
0.007628903, -0.04096111, 2.453729, 0, 1, 0.7960784, 1,
0.01014968, 0.9506219, 2.18485, 0, 1, 0.8039216, 1,
0.01205632, 0.1610868, 1.225188, 0, 1, 0.8078431, 1,
0.0173842, -0.1466492, 2.398753, 0, 1, 0.8156863, 1,
0.01898895, 0.2135515, -0.6182274, 0, 1, 0.8196079, 1,
0.01978869, -0.8119078, 2.595314, 0, 1, 0.827451, 1,
0.02412304, -0.2736075, 1.70948, 0, 1, 0.8313726, 1,
0.02918738, -0.9247641, 3.398795, 0, 1, 0.8392157, 1,
0.03408262, -1.638176, 4.720242, 0, 1, 0.8431373, 1,
0.04043487, 0.909532, -0.9542168, 0, 1, 0.8509804, 1,
0.04308906, 0.7908159, 0.4070984, 0, 1, 0.854902, 1,
0.04411935, 2.111834, 0.9383605, 0, 1, 0.8627451, 1,
0.04604658, 0.06324847, 1.820083, 0, 1, 0.8666667, 1,
0.04999825, 1.836896, 0.5222332, 0, 1, 0.8745098, 1,
0.0510134, -0.182632, 3.438368, 0, 1, 0.8784314, 1,
0.05138231, 0.3526355, 2.149261, 0, 1, 0.8862745, 1,
0.0572709, -0.6656494, 2.938975, 0, 1, 0.8901961, 1,
0.06360731, 0.9787335, 0.1845897, 0, 1, 0.8980392, 1,
0.06479195, -0.2255046, 4.56855, 0, 1, 0.9058824, 1,
0.0659052, -2.37554, 3.414071, 0, 1, 0.9098039, 1,
0.06659697, -1.060238, 4.168085, 0, 1, 0.9176471, 1,
0.06744178, -1.352776, 4.098491, 0, 1, 0.9215686, 1,
0.06799934, 1.255243, 1.418966, 0, 1, 0.9294118, 1,
0.07057619, 1.062789, -0.464122, 0, 1, 0.9333333, 1,
0.07083218, -0.1708931, 2.610389, 0, 1, 0.9411765, 1,
0.07238343, 1.404175, 1.552601, 0, 1, 0.945098, 1,
0.07316534, -0.2579083, 2.791086, 0, 1, 0.9529412, 1,
0.0732808, -0.2483076, 2.827707, 0, 1, 0.9568627, 1,
0.08574799, 2.094129, -1.468977, 0, 1, 0.9647059, 1,
0.08873129, -0.1762328, 3.683927, 0, 1, 0.9686275, 1,
0.0889791, -0.09198585, 2.926937, 0, 1, 0.9764706, 1,
0.08955834, 0.09777533, 1.050249, 0, 1, 0.9803922, 1,
0.09163909, -0.06791754, 3.663372, 0, 1, 0.9882353, 1,
0.09416484, -1.402909, 4.255332, 0, 1, 0.9921569, 1,
0.09542668, -0.2922094, 3.514226, 0, 1, 1, 1,
0.09900313, 0.3142938, -0.6073428, 0, 0.9921569, 1, 1,
0.101887, 1.643077, 1.707973, 0, 0.9882353, 1, 1,
0.106541, 1.363262, -1.015256, 0, 0.9803922, 1, 1,
0.1163992, -2.773149, 1.483232, 0, 0.9764706, 1, 1,
0.1224043, -0.1875675, 1.75945, 0, 0.9686275, 1, 1,
0.1260159, 0.3230701, -0.2190943, 0, 0.9647059, 1, 1,
0.1263961, -2.015032, 3.589576, 0, 0.9568627, 1, 1,
0.1305417, -1.270629, 3.821708, 0, 0.9529412, 1, 1,
0.13232, -0.136502, 2.174764, 0, 0.945098, 1, 1,
0.1328072, 0.2299753, 0.5267158, 0, 0.9411765, 1, 1,
0.1335114, 0.6784237, 1.010575, 0, 0.9333333, 1, 1,
0.1351829, -0.8297151, 3.365253, 0, 0.9294118, 1, 1,
0.1372488, 0.1160686, -1.646122, 0, 0.9215686, 1, 1,
0.139407, 0.1023152, 0.7442093, 0, 0.9176471, 1, 1,
0.1410649, 0.3136497, -1.07592, 0, 0.9098039, 1, 1,
0.1429501, -0.2857716, 3.428246, 0, 0.9058824, 1, 1,
0.1505405, 0.06749972, 0.9473379, 0, 0.8980392, 1, 1,
0.1524702, -0.5309509, 2.922651, 0, 0.8901961, 1, 1,
0.1529462, 0.0628875, 0.0009178003, 0, 0.8862745, 1, 1,
0.1557647, -0.1471989, 2.868784, 0, 0.8784314, 1, 1,
0.1573177, -1.509125, 3.39254, 0, 0.8745098, 1, 1,
0.1615302, 0.6494619, 0.9011019, 0, 0.8666667, 1, 1,
0.1620072, -1.05448, 3.223612, 0, 0.8627451, 1, 1,
0.1623569, -1.47147, 4.853971, 0, 0.854902, 1, 1,
0.1623703, -0.4533183, 3.189164, 0, 0.8509804, 1, 1,
0.1636285, 0.3378241, 1.342345, 0, 0.8431373, 1, 1,
0.1652244, 0.7806864, -0.4200605, 0, 0.8392157, 1, 1,
0.1657049, 0.8346817, 0.2408888, 0, 0.8313726, 1, 1,
0.1712895, -0.6886537, 2.305283, 0, 0.827451, 1, 1,
0.174304, 0.4363823, -0.2768499, 0, 0.8196079, 1, 1,
0.1799504, 0.9193712, 0.04478212, 0, 0.8156863, 1, 1,
0.1821591, -1.098557, 1.840593, 0, 0.8078431, 1, 1,
0.1844449, 0.4353216, -0.1744491, 0, 0.8039216, 1, 1,
0.1847284, 0.8224061, 1.399982, 0, 0.7960784, 1, 1,
0.1869335, 0.3883878, 0.6649957, 0, 0.7882353, 1, 1,
0.1888312, 1.254152, 0.04473959, 0, 0.7843137, 1, 1,
0.1926863, -1.58908, 3.286369, 0, 0.7764706, 1, 1,
0.1963617, -0.5074795, 2.245561, 0, 0.772549, 1, 1,
0.1966871, -1.296502, 2.64471, 0, 0.7647059, 1, 1,
0.1986268, -1.540516, 2.645074, 0, 0.7607843, 1, 1,
0.2022505, 1.503771, -1.556757, 0, 0.7529412, 1, 1,
0.2049669, -0.1023602, 1.07642, 0, 0.7490196, 1, 1,
0.2066648, 1.415033, 0.1191423, 0, 0.7411765, 1, 1,
0.2066655, 0.4033725, -0.6564612, 0, 0.7372549, 1, 1,
0.2073239, -1.412352, 4.121329, 0, 0.7294118, 1, 1,
0.220012, 1.783482, -1.838369, 0, 0.7254902, 1, 1,
0.2218674, 0.5385462, -1.320137, 0, 0.7176471, 1, 1,
0.2221622, -0.6015253, 3.706527, 0, 0.7137255, 1, 1,
0.2229618, -0.3265464, 5.117625, 0, 0.7058824, 1, 1,
0.2241111, -1.641776, 2.829125, 0, 0.6980392, 1, 1,
0.2262104, 0.9411257, -0.6551608, 0, 0.6941177, 1, 1,
0.2308319, 0.7339088, -0.282134, 0, 0.6862745, 1, 1,
0.2334578, -0.455249, 2.686719, 0, 0.682353, 1, 1,
0.2344614, -0.1271791, 1.654129, 0, 0.6745098, 1, 1,
0.2407183, 2.446503, 0.3335843, 0, 0.6705883, 1, 1,
0.2435927, -1.748197, 3.524186, 0, 0.6627451, 1, 1,
0.2446734, 0.5232888, 2.245622, 0, 0.6588235, 1, 1,
0.2459645, 0.3178813, -0.7206711, 0, 0.6509804, 1, 1,
0.2460482, -0.752489, 3.042975, 0, 0.6470588, 1, 1,
0.2493066, -0.5372924, 3.947455, 0, 0.6392157, 1, 1,
0.2525572, -2.232675, 4.005872, 0, 0.6352941, 1, 1,
0.2536706, -2.234291, 4.852852, 0, 0.627451, 1, 1,
0.2552272, 0.5594432, -1.396633, 0, 0.6235294, 1, 1,
0.2631248, -0.5209197, 4.295347, 0, 0.6156863, 1, 1,
0.2679446, -0.4814738, 3.475607, 0, 0.6117647, 1, 1,
0.2693641, 0.2659004, -0.0262488, 0, 0.6039216, 1, 1,
0.2695101, 1.184412, 0.2950689, 0, 0.5960785, 1, 1,
0.2706436, -0.04472611, 1.096702, 0, 0.5921569, 1, 1,
0.2720149, -0.9104775, 3.704979, 0, 0.5843138, 1, 1,
0.2787627, -0.9217454, 2.477705, 0, 0.5803922, 1, 1,
0.2790311, -0.02399733, 1.011345, 0, 0.572549, 1, 1,
0.2797222, 0.207141, 0.2748805, 0, 0.5686275, 1, 1,
0.2811055, 1.437868, 0.7784222, 0, 0.5607843, 1, 1,
0.2835267, -1.178892, 4.037704, 0, 0.5568628, 1, 1,
0.2854624, -0.2171825, 2.666697, 0, 0.5490196, 1, 1,
0.2861531, 0.3996193, 1.567638, 0, 0.5450981, 1, 1,
0.2862436, -0.9506858, 3.928543, 0, 0.5372549, 1, 1,
0.2891543, -0.8384868, 1.213154, 0, 0.5333334, 1, 1,
0.2898171, -1.268765, 2.483775, 0, 0.5254902, 1, 1,
0.2909836, -0.04707579, 0.2093988, 0, 0.5215687, 1, 1,
0.2936111, -1.27029, 2.008194, 0, 0.5137255, 1, 1,
0.29722, -0.000217982, 2.410279, 0, 0.509804, 1, 1,
0.2988807, 1.84009, 1.751736, 0, 0.5019608, 1, 1,
0.3038121, 0.3511214, 1.946607, 0, 0.4941176, 1, 1,
0.304417, -1.480504, 3.448064, 0, 0.4901961, 1, 1,
0.3047538, -0.3455341, 2.940225, 0, 0.4823529, 1, 1,
0.3060707, -2.569301, 3.462069, 0, 0.4784314, 1, 1,
0.3066761, -0.1698162, 2.661311, 0, 0.4705882, 1, 1,
0.3070706, -0.7422993, 4.347996, 0, 0.4666667, 1, 1,
0.3089231, 0.2709525, -1.407416, 0, 0.4588235, 1, 1,
0.31051, -0.9889506, 2.163764, 0, 0.454902, 1, 1,
0.3139727, 1.593427, 1.378274, 0, 0.4470588, 1, 1,
0.3144611, -1.220809, 3.081348, 0, 0.4431373, 1, 1,
0.3186539, 1.508641, 0.662134, 0, 0.4352941, 1, 1,
0.319272, 0.7742612, 0.4050523, 0, 0.4313726, 1, 1,
0.319655, -1.376847, 2.684521, 0, 0.4235294, 1, 1,
0.3215173, -1.965553, 2.024149, 0, 0.4196078, 1, 1,
0.3217701, -0.6948133, 1.969895, 0, 0.4117647, 1, 1,
0.3236982, -1.871372, 3.613783, 0, 0.4078431, 1, 1,
0.326418, -1.048129, 3.539625, 0, 0.4, 1, 1,
0.3280306, -0.6019728, 2.87673, 0, 0.3921569, 1, 1,
0.3296347, -1.82635, 2.037235, 0, 0.3882353, 1, 1,
0.344236, 0.8350291, 0.8694495, 0, 0.3803922, 1, 1,
0.3497554, 0.454107, 1.009165, 0, 0.3764706, 1, 1,
0.3502213, 0.6863758, 1.239621, 0, 0.3686275, 1, 1,
0.3511904, -1.431529, 5.98715, 0, 0.3647059, 1, 1,
0.3539589, 0.6052179, 0.04843871, 0, 0.3568628, 1, 1,
0.3557947, -2.023261, 3.392433, 0, 0.3529412, 1, 1,
0.3562652, 0.1388033, -0.08919959, 0, 0.345098, 1, 1,
0.3564666, 0.08461779, 1.612357, 0, 0.3411765, 1, 1,
0.3606379, 0.6358443, 0.4335167, 0, 0.3333333, 1, 1,
0.3655102, -0.8129222, 2.660879, 0, 0.3294118, 1, 1,
0.3681725, 0.1937484, 2.806365, 0, 0.3215686, 1, 1,
0.3711458, -0.8033074, 3.510966, 0, 0.3176471, 1, 1,
0.373377, 1.783337, -0.3338319, 0, 0.3098039, 1, 1,
0.3766179, -1.380335, 3.227261, 0, 0.3058824, 1, 1,
0.3767625, -0.06685402, 0.353406, 0, 0.2980392, 1, 1,
0.3773506, 0.1705954, 0.6670499, 0, 0.2901961, 1, 1,
0.3775638, -0.7800822, 2.462374, 0, 0.2862745, 1, 1,
0.3779077, -0.4910308, 0.3205501, 0, 0.2784314, 1, 1,
0.3782897, 1.471593, 0.04728881, 0, 0.2745098, 1, 1,
0.378344, 0.3575059, 1.291833, 0, 0.2666667, 1, 1,
0.3790266, 0.325067, 1.463584, 0, 0.2627451, 1, 1,
0.382473, -0.473102, 1.754296, 0, 0.254902, 1, 1,
0.3899041, 0.2905256, 0.558912, 0, 0.2509804, 1, 1,
0.3968355, 0.09446196, 1.384073, 0, 0.2431373, 1, 1,
0.397294, 0.5652441, -0.658093, 0, 0.2392157, 1, 1,
0.3984999, -0.9995859, 3.201073, 0, 0.2313726, 1, 1,
0.4035447, 0.9384102, 0.005676403, 0, 0.227451, 1, 1,
0.411092, -0.5269349, 1.520742, 0, 0.2196078, 1, 1,
0.4113551, 1.809834, 0.1400225, 0, 0.2156863, 1, 1,
0.4126344, 0.6275992, 1.100741, 0, 0.2078431, 1, 1,
0.4126638, 0.2423611, 0.4131161, 0, 0.2039216, 1, 1,
0.4128138, -2.217655, 1.757499, 0, 0.1960784, 1, 1,
0.4149015, -0.6404387, 2.919381, 0, 0.1882353, 1, 1,
0.41725, 0.137031, 2.45026, 0, 0.1843137, 1, 1,
0.4187308, -0.8981203, 3.753187, 0, 0.1764706, 1, 1,
0.4260668, -2.107606, 2.761618, 0, 0.172549, 1, 1,
0.4269208, 0.9223035, 0.8065376, 0, 0.1647059, 1, 1,
0.4300988, -0.8544147, 2.50857, 0, 0.1607843, 1, 1,
0.4305664, 0.5194464, 0.3979418, 0, 0.1529412, 1, 1,
0.4344893, 1.418989, -2.552042, 0, 0.1490196, 1, 1,
0.4361028, -1.617229, 2.053302, 0, 0.1411765, 1, 1,
0.4369971, 0.5669604, 0.6298136, 0, 0.1372549, 1, 1,
0.4386862, 0.05596356, 1.00389, 0, 0.1294118, 1, 1,
0.439947, 1.52272, 0.2517982, 0, 0.1254902, 1, 1,
0.4400336, -1.223515, 2.758406, 0, 0.1176471, 1, 1,
0.4433034, -0.7172707, 2.917233, 0, 0.1137255, 1, 1,
0.4500835, -0.08637138, 3.900631, 0, 0.1058824, 1, 1,
0.4523695, 1.596623, 1.080165, 0, 0.09803922, 1, 1,
0.4540083, 1.254241, 0.4520788, 0, 0.09411765, 1, 1,
0.4564723, -1.351714, 1.472933, 0, 0.08627451, 1, 1,
0.4570184, 1.089731, 0.3820594, 0, 0.08235294, 1, 1,
0.4582263, 0.1829529, 0.2901331, 0, 0.07450981, 1, 1,
0.4585006, -0.7877869, 3.014028, 0, 0.07058824, 1, 1,
0.4585217, 0.4806045, 0.5983982, 0, 0.0627451, 1, 1,
0.4590362, 1.883037, 1.732965, 0, 0.05882353, 1, 1,
0.4648566, -0.4747031, 1.915228, 0, 0.05098039, 1, 1,
0.4657856, 0.822026, -0.1208885, 0, 0.04705882, 1, 1,
0.4687854, -0.2066863, 1.131738, 0, 0.03921569, 1, 1,
0.4689046, -1.167935, 3.642026, 0, 0.03529412, 1, 1,
0.4696624, -1.527566, 2.528424, 0, 0.02745098, 1, 1,
0.4718026, 0.004739686, 1.64425, 0, 0.02352941, 1, 1,
0.475126, -1.805105, 2.538834, 0, 0.01568628, 1, 1,
0.4800611, 0.05618189, -0.1679, 0, 0.01176471, 1, 1,
0.4822218, 2.121896, -0.04994412, 0, 0.003921569, 1, 1,
0.4830944, 0.4812614, 1.832634, 0.003921569, 0, 1, 1,
0.4859515, 1.494811, 1.06311, 0.007843138, 0, 1, 1,
0.4892117, -0.7636096, 3.973037, 0.01568628, 0, 1, 1,
0.4905596, -1.708464, 3.130299, 0.01960784, 0, 1, 1,
0.4929725, 0.6671942, -0.4517365, 0.02745098, 0, 1, 1,
0.4950513, 1.877229, 1.304788, 0.03137255, 0, 1, 1,
0.5023412, -1.440676, 2.592916, 0.03921569, 0, 1, 1,
0.5024317, -0.1393493, 1.177932, 0.04313726, 0, 1, 1,
0.5050946, -1.209898, 1.765018, 0.05098039, 0, 1, 1,
0.5113719, -0.3371527, 2.833467, 0.05490196, 0, 1, 1,
0.5164084, -1.301506, 2.701477, 0.0627451, 0, 1, 1,
0.5187361, 1.600577, 1.308479, 0.06666667, 0, 1, 1,
0.520685, 0.3116431, 0.08394347, 0.07450981, 0, 1, 1,
0.5266094, -1.811291, 5.188999, 0.07843138, 0, 1, 1,
0.5267261, 1.171831, -0.8850684, 0.08627451, 0, 1, 1,
0.5277469, 0.08242868, 0.3188513, 0.09019608, 0, 1, 1,
0.5291653, 2.493261, 0.3402831, 0.09803922, 0, 1, 1,
0.5297896, -0.5742661, 1.348726, 0.1058824, 0, 1, 1,
0.5316236, 1.245841, 0.2934852, 0.1098039, 0, 1, 1,
0.5318018, -0.9560632, 2.809252, 0.1176471, 0, 1, 1,
0.5384825, -0.2590064, 1.857167, 0.1215686, 0, 1, 1,
0.54184, -1.805182, 2.114594, 0.1294118, 0, 1, 1,
0.5442303, 0.4849672, 0.6750191, 0.1333333, 0, 1, 1,
0.5450995, 1.036128, 0.2263743, 0.1411765, 0, 1, 1,
0.5453833, 0.5177596, 1.355949, 0.145098, 0, 1, 1,
0.5515869, -0.9551321, 2.012199, 0.1529412, 0, 1, 1,
0.5541086, 1.184894, 0.003957057, 0.1568628, 0, 1, 1,
0.5666391, 0.01490318, -0.1692055, 0.1647059, 0, 1, 1,
0.5683605, -1.186965, 2.966384, 0.1686275, 0, 1, 1,
0.5704612, -0.2636847, 0.6804397, 0.1764706, 0, 1, 1,
0.571708, -0.4736713, 2.957973, 0.1803922, 0, 1, 1,
0.5757097, -0.5550641, 2.337156, 0.1882353, 0, 1, 1,
0.5809273, -0.2777871, 2.631402, 0.1921569, 0, 1, 1,
0.5830217, -1.963087, 2.17239, 0.2, 0, 1, 1,
0.5886442, -0.7463822, 1.466232, 0.2078431, 0, 1, 1,
0.5894365, 1.267212, 1.230632, 0.2117647, 0, 1, 1,
0.5913495, 0.02893275, 1.882006, 0.2196078, 0, 1, 1,
0.5925508, 1.160719, -0.1815521, 0.2235294, 0, 1, 1,
0.5956988, 1.145546, 2.548107, 0.2313726, 0, 1, 1,
0.5965145, -0.2149015, 3.158015, 0.2352941, 0, 1, 1,
0.5982064, 0.03411645, 1.699194, 0.2431373, 0, 1, 1,
0.598321, -0.1427468, 3.121335, 0.2470588, 0, 1, 1,
0.6020281, 0.4766445, 1.344874, 0.254902, 0, 1, 1,
0.6021649, -0.01249424, 2.246878, 0.2588235, 0, 1, 1,
0.6071668, 0.6902307, 1.721241, 0.2666667, 0, 1, 1,
0.6125054, 2.457751, 0.2464951, 0.2705882, 0, 1, 1,
0.6160287, -1.133329, 1.834136, 0.2784314, 0, 1, 1,
0.6192136, 2.341249, -0.4552633, 0.282353, 0, 1, 1,
0.6196697, -0.4043031, 2.628539, 0.2901961, 0, 1, 1,
0.6207631, -0.2515464, 0.3792495, 0.2941177, 0, 1, 1,
0.6282288, 0.09265422, 1.637198, 0.3019608, 0, 1, 1,
0.6283227, 0.5862865, -0.03769174, 0.3098039, 0, 1, 1,
0.6312127, -1.037264, 3.406458, 0.3137255, 0, 1, 1,
0.6330929, -0.03692076, -0.1158963, 0.3215686, 0, 1, 1,
0.6334955, 0.4589244, -1.499555, 0.3254902, 0, 1, 1,
0.6335983, 1.778493, 1.637146, 0.3333333, 0, 1, 1,
0.6369579, 0.1194755, 2.875724, 0.3372549, 0, 1, 1,
0.638351, -1.731956, 1.436189, 0.345098, 0, 1, 1,
0.6390691, 0.183652, 0.3839762, 0.3490196, 0, 1, 1,
0.6393095, 0.9243174, -0.4526573, 0.3568628, 0, 1, 1,
0.6414099, 0.3930901, 1.630008, 0.3607843, 0, 1, 1,
0.6423962, -0.03204964, 3.134956, 0.3686275, 0, 1, 1,
0.6427944, 2.102451, -0.1167684, 0.372549, 0, 1, 1,
0.6435258, -0.07119952, 1.604762, 0.3803922, 0, 1, 1,
0.6440944, -0.3794217, 2.200686, 0.3843137, 0, 1, 1,
0.6485566, -0.2262541, 2.666547, 0.3921569, 0, 1, 1,
0.6490463, 0.3557758, 0.7991743, 0.3960784, 0, 1, 1,
0.6492355, 1.209248, 1.62662, 0.4039216, 0, 1, 1,
0.6504484, 0.7939175, 0.9346546, 0.4117647, 0, 1, 1,
0.6516407, -0.01876009, 1.423485, 0.4156863, 0, 1, 1,
0.6542617, 0.2791159, 3.211615, 0.4235294, 0, 1, 1,
0.6592344, -0.5391229, 1.072135, 0.427451, 0, 1, 1,
0.6630657, 0.4782004, 2.322979, 0.4352941, 0, 1, 1,
0.6679412, 0.05762594, 2.028283, 0.4392157, 0, 1, 1,
0.6691051, 0.5743692, 0.3181693, 0.4470588, 0, 1, 1,
0.6695703, -0.1420668, 3.043152, 0.4509804, 0, 1, 1,
0.6711618, 0.04315748, 3.128106, 0.4588235, 0, 1, 1,
0.6798518, 0.5540587, 2.132399, 0.4627451, 0, 1, 1,
0.6850722, 0.3208115, 1.178734, 0.4705882, 0, 1, 1,
0.6879062, 1.724216, 1.003892, 0.4745098, 0, 1, 1,
0.6902356, -0.2982879, -0.1920228, 0.4823529, 0, 1, 1,
0.692306, 1.468431, 0.7605286, 0.4862745, 0, 1, 1,
0.6976816, -0.2196735, 1.474895, 0.4941176, 0, 1, 1,
0.7001501, -0.3059717, -1.408141, 0.5019608, 0, 1, 1,
0.7042778, -0.9129847, 3.767229, 0.5058824, 0, 1, 1,
0.7050251, -0.5371838, 2.430018, 0.5137255, 0, 1, 1,
0.7059608, 0.1646749, 0.8741229, 0.5176471, 0, 1, 1,
0.7104232, -1.220318, 3.104293, 0.5254902, 0, 1, 1,
0.7117692, 1.060223, -0.484304, 0.5294118, 0, 1, 1,
0.7154644, -0.7562242, 3.177452, 0.5372549, 0, 1, 1,
0.7159596, 0.5626125, 2.108285, 0.5411765, 0, 1, 1,
0.7178619, 0.2009265, 1.464362, 0.5490196, 0, 1, 1,
0.7356278, -1.330603, 2.896171, 0.5529412, 0, 1, 1,
0.7366636, -1.28688, 3.034081, 0.5607843, 0, 1, 1,
0.7378218, -1.590473, 1.850081, 0.5647059, 0, 1, 1,
0.7381883, 2.128057, 0.5960358, 0.572549, 0, 1, 1,
0.7421293, -0.7663375, 2.074124, 0.5764706, 0, 1, 1,
0.7491502, 0.7846195, 2.182048, 0.5843138, 0, 1, 1,
0.7530108, -0.2492393, 0.1138076, 0.5882353, 0, 1, 1,
0.7549019, 0.2957267, 1.643393, 0.5960785, 0, 1, 1,
0.7550889, -0.9168081, 2.093294, 0.6039216, 0, 1, 1,
0.7559722, -0.3102323, 3.179526, 0.6078432, 0, 1, 1,
0.7560833, 0.9812552, 2.205707, 0.6156863, 0, 1, 1,
0.7594162, 0.6504117, 1.014212, 0.6196079, 0, 1, 1,
0.7643171, 0.7277224, 0.2448474, 0.627451, 0, 1, 1,
0.7746719, 1.923573, 0.05957789, 0.6313726, 0, 1, 1,
0.7815208, -0.2351556, 3.609197, 0.6392157, 0, 1, 1,
0.7817997, 0.3276596, 2.574223, 0.6431373, 0, 1, 1,
0.7822778, 2.014942, 0.2723299, 0.6509804, 0, 1, 1,
0.7836141, 0.1391355, -0.4719236, 0.654902, 0, 1, 1,
0.7920416, -0.01663767, 1.895677, 0.6627451, 0, 1, 1,
0.7929861, -0.5055126, 3.687465, 0.6666667, 0, 1, 1,
0.7938883, 2.301149, 0.9390818, 0.6745098, 0, 1, 1,
0.7955784, -0.7669389, 3.443498, 0.6784314, 0, 1, 1,
0.7985707, -1.112423, 2.13319, 0.6862745, 0, 1, 1,
0.8019233, 1.550353, 0.8445107, 0.6901961, 0, 1, 1,
0.8048084, 0.724007, 2.197627, 0.6980392, 0, 1, 1,
0.8270798, 0.3237606, 2.295483, 0.7058824, 0, 1, 1,
0.827628, 1.789803, -0.5671592, 0.7098039, 0, 1, 1,
0.8309791, 0.475021, 1.249315, 0.7176471, 0, 1, 1,
0.8311559, -0.8468955, 0.4455464, 0.7215686, 0, 1, 1,
0.8351582, -0.5585628, 6.144857, 0.7294118, 0, 1, 1,
0.8392397, 1.17706, 3.431402, 0.7333333, 0, 1, 1,
0.8414195, 0.7881803, 0.04509576, 0.7411765, 0, 1, 1,
0.8445294, 0.09906574, -0.4112832, 0.7450981, 0, 1, 1,
0.8453405, 1.03871, 1.977142, 0.7529412, 0, 1, 1,
0.8484879, -0.6800259, 1.007513, 0.7568628, 0, 1, 1,
0.8509041, 1.013063, 1.785106, 0.7647059, 0, 1, 1,
0.8531635, -0.05124182, 2.011452, 0.7686275, 0, 1, 1,
0.853924, 1.548562, -0.5798601, 0.7764706, 0, 1, 1,
0.8577046, -0.1035415, 0.3366602, 0.7803922, 0, 1, 1,
0.8614803, -0.4506356, 2.212127, 0.7882353, 0, 1, 1,
0.8661762, -1.503617, 2.276834, 0.7921569, 0, 1, 1,
0.8694775, -2.378379, 3.008523, 0.8, 0, 1, 1,
0.8764699, -1.824595, 3.878115, 0.8078431, 0, 1, 1,
0.8779169, -0.4766842, 4.337751, 0.8117647, 0, 1, 1,
0.8797721, 2.094714, -1.913301, 0.8196079, 0, 1, 1,
0.8799453, -1.844493, 0.5921782, 0.8235294, 0, 1, 1,
0.883005, 1.372126, 0.9022927, 0.8313726, 0, 1, 1,
0.8847585, 0.9982257, 0.1473366, 0.8352941, 0, 1, 1,
0.8956253, 0.5236235, 0.6030778, 0.8431373, 0, 1, 1,
0.9004396, 0.5036501, 0.8915347, 0.8470588, 0, 1, 1,
0.906758, 0.2789254, 1.472828, 0.854902, 0, 1, 1,
0.9068335, -1.847327, 4.60229, 0.8588235, 0, 1, 1,
0.9070388, 1.424351, 1.073145, 0.8666667, 0, 1, 1,
0.9076101, 0.412209, 0.6374, 0.8705882, 0, 1, 1,
0.9094694, -1.339414, 1.902682, 0.8784314, 0, 1, 1,
0.9199823, -0.46947, 1.462658, 0.8823529, 0, 1, 1,
0.9230088, 0.974079, 1.465206, 0.8901961, 0, 1, 1,
0.9243311, -0.6467907, 1.594499, 0.8941177, 0, 1, 1,
0.9296055, 1.936108, 0.6738586, 0.9019608, 0, 1, 1,
0.9344932, 0.3756309, 0.2465292, 0.9098039, 0, 1, 1,
0.9358621, 1.618896, 1.738524, 0.9137255, 0, 1, 1,
0.9367957, -0.3360849, 0.6568661, 0.9215686, 0, 1, 1,
0.9428391, 1.260268, 0.4833448, 0.9254902, 0, 1, 1,
0.945499, 0.03754369, 1.461224, 0.9333333, 0, 1, 1,
0.9467449, 1.160551, -0.02871517, 0.9372549, 0, 1, 1,
0.9545971, 0.5411052, -0.09581947, 0.945098, 0, 1, 1,
0.9606051, -0.5924339, 1.534326, 0.9490196, 0, 1, 1,
0.9615842, 0.1428993, -0.7829607, 0.9568627, 0, 1, 1,
0.9641769, -0.5982686, 2.2407, 0.9607843, 0, 1, 1,
0.9660721, 1.242951, 0.3873637, 0.9686275, 0, 1, 1,
0.966124, 0.1621607, 1.993071, 0.972549, 0, 1, 1,
0.9678747, 1.304292, 1.084137, 0.9803922, 0, 1, 1,
0.9806266, -0.2118264, 1.946534, 0.9843137, 0, 1, 1,
0.9832348, -1.511535, 1.561304, 0.9921569, 0, 1, 1,
0.9870002, 2.438286, 2.218572, 0.9960784, 0, 1, 1,
0.9874194, 1.898848, -0.4815624, 1, 0, 0.9960784, 1,
0.9883541, -0.9694872, 1.198099, 1, 0, 0.9882353, 1,
0.9917848, 1.486861, -0.5444776, 1, 0, 0.9843137, 1,
0.9950981, 0.4190085, 0.6097215, 1, 0, 0.9764706, 1,
0.9971861, -0.9934242, 2.17048, 1, 0, 0.972549, 1,
0.9975967, -0.6134195, 1.703846, 1, 0, 0.9647059, 1,
0.9987302, 0.313242, 1.844831, 1, 0, 0.9607843, 1,
1.000967, -0.5315399, 3.409968, 1, 0, 0.9529412, 1,
1.004353, -0.2664193, 2.539882, 1, 0, 0.9490196, 1,
1.007719, 0.5635893, 2.084334, 1, 0, 0.9411765, 1,
1.009119, -1.145871, 1.539793, 1, 0, 0.9372549, 1,
1.012915, -1.243085, 2.692888, 1, 0, 0.9294118, 1,
1.019183, 0.2085608, 1.234588, 1, 0, 0.9254902, 1,
1.029226, 0.503297, 0.2072496, 1, 0, 0.9176471, 1,
1.050342, 1.001095, 0.399657, 1, 0, 0.9137255, 1,
1.051711, 0.5482832, 0.349782, 1, 0, 0.9058824, 1,
1.058729, 0.2691204, -0.4653581, 1, 0, 0.9019608, 1,
1.060972, -0.3764411, 1.090975, 1, 0, 0.8941177, 1,
1.062914, -0.8034845, 1.70465, 1, 0, 0.8862745, 1,
1.074603, -1.127292, 3.197191, 1, 0, 0.8823529, 1,
1.087097, -0.7187459, 1.601583, 1, 0, 0.8745098, 1,
1.092548, -1.374485, 2.18676, 1, 0, 0.8705882, 1,
1.094556, -0.384158, 1.803046, 1, 0, 0.8627451, 1,
1.098419, -1.086354, 0.8772576, 1, 0, 0.8588235, 1,
1.105388, -1.428214, 1.654863, 1, 0, 0.8509804, 1,
1.105989, -1.144495, 1.411272, 1, 0, 0.8470588, 1,
1.107239, -0.6079013, 1.460963, 1, 0, 0.8392157, 1,
1.11575, 1.107707, 1.922421, 1, 0, 0.8352941, 1,
1.123888, 0.100894, 2.077927, 1, 0, 0.827451, 1,
1.126156, -0.133649, 1.208983, 1, 0, 0.8235294, 1,
1.130834, 0.9495198, 1.060684, 1, 0, 0.8156863, 1,
1.134384, 0.8731827, 0.7050618, 1, 0, 0.8117647, 1,
1.135273, 1.659123, 1.089424, 1, 0, 0.8039216, 1,
1.136357, -0.8797238, 1.472061, 1, 0, 0.7960784, 1,
1.153177, 0.5784423, 1.546768, 1, 0, 0.7921569, 1,
1.15785, -0.705272, 2.511498, 1, 0, 0.7843137, 1,
1.167017, 1.304979, -0.00489592, 1, 0, 0.7803922, 1,
1.176311, 1.664389, 0.4307727, 1, 0, 0.772549, 1,
1.17774, 1.027272, 0.06689348, 1, 0, 0.7686275, 1,
1.180499, 1.132807, 1.659447, 1, 0, 0.7607843, 1,
1.185065, 0.4471644, -0.1158871, 1, 0, 0.7568628, 1,
1.200654, -0.534842, 2.630348, 1, 0, 0.7490196, 1,
1.204315, 0.8982266, 0.2879101, 1, 0, 0.7450981, 1,
1.210702, 1.737261, 1.416773, 1, 0, 0.7372549, 1,
1.2112, -1.35091, 3.322123, 1, 0, 0.7333333, 1,
1.228761, 1.972007, 0.3925604, 1, 0, 0.7254902, 1,
1.229738, -1.224808, 2.598003, 1, 0, 0.7215686, 1,
1.238312, 0.6257449, 2.27239, 1, 0, 0.7137255, 1,
1.238925, -0.4274549, 0.4810923, 1, 0, 0.7098039, 1,
1.251793, -0.7240493, 2.032897, 1, 0, 0.7019608, 1,
1.256117, 0.7322093, -0.7874416, 1, 0, 0.6941177, 1,
1.260232, -2.981332, 2.56011, 1, 0, 0.6901961, 1,
1.268878, 0.2807601, 1.270212, 1, 0, 0.682353, 1,
1.273568, -0.4749849, 0.9827211, 1, 0, 0.6784314, 1,
1.282112, 0.7502666, 0.5643155, 1, 0, 0.6705883, 1,
1.283536, 1.291127, 2.304925, 1, 0, 0.6666667, 1,
1.284079, 0.8528624, 1.070148, 1, 0, 0.6588235, 1,
1.285475, 0.8669299, 0.3412117, 1, 0, 0.654902, 1,
1.28851, -0.7096878, 3.480626, 1, 0, 0.6470588, 1,
1.290678, -0.03531373, 3.024399, 1, 0, 0.6431373, 1,
1.295326, -0.3767442, 1.542494, 1, 0, 0.6352941, 1,
1.297506, 0.2334806, 0.7518483, 1, 0, 0.6313726, 1,
1.303333, 0.8998402, 2.229197, 1, 0, 0.6235294, 1,
1.304179, 0.213727, 0.2808967, 1, 0, 0.6196079, 1,
1.309038, -0.6647223, 3.565008, 1, 0, 0.6117647, 1,
1.315118, -0.2553503, 0.06361269, 1, 0, 0.6078432, 1,
1.31619, -0.6065168, 2.195209, 1, 0, 0.6, 1,
1.319188, 1.230834, 1.333546, 1, 0, 0.5921569, 1,
1.320831, -0.4076794, 2.015773, 1, 0, 0.5882353, 1,
1.334119, -2.485862, 4.644803, 1, 0, 0.5803922, 1,
1.345657, 0.2749846, 2.091097, 1, 0, 0.5764706, 1,
1.350047, 1.862821, 1.494582, 1, 0, 0.5686275, 1,
1.356721, -0.2057082, 1.037956, 1, 0, 0.5647059, 1,
1.362928, -0.5742593, 2.328594, 1, 0, 0.5568628, 1,
1.363337, 0.4336294, 1.77255, 1, 0, 0.5529412, 1,
1.366425, -0.07814641, 1.483295, 1, 0, 0.5450981, 1,
1.382517, -1.363466, 1.71144, 1, 0, 0.5411765, 1,
1.389382, -1.136896, 1.522591, 1, 0, 0.5333334, 1,
1.399673, 0.3738519, 1.051226, 1, 0, 0.5294118, 1,
1.402295, -0.2246194, 3.19182, 1, 0, 0.5215687, 1,
1.42154, -0.1560457, 1.858022, 1, 0, 0.5176471, 1,
1.438764, -0.2495454, 1.280503, 1, 0, 0.509804, 1,
1.445807, 1.174668, 1.260515, 1, 0, 0.5058824, 1,
1.462171, -1.084874, 2.972244, 1, 0, 0.4980392, 1,
1.462472, 0.7024361, 0.8812973, 1, 0, 0.4901961, 1,
1.47584, 0.1277313, 0.128205, 1, 0, 0.4862745, 1,
1.4826, 1.326919, 1.339279, 1, 0, 0.4784314, 1,
1.486162, 2.087712, 0.4929797, 1, 0, 0.4745098, 1,
1.489326, -0.1799866, 1.904065, 1, 0, 0.4666667, 1,
1.504463, 0.4878573, 2.230659, 1, 0, 0.4627451, 1,
1.509116, -1.634452, 3.907924, 1, 0, 0.454902, 1,
1.512372, 1.321024, 1.079399, 1, 0, 0.4509804, 1,
1.523873, 0.4038793, -0.1154472, 1, 0, 0.4431373, 1,
1.524082, 2.079899, 0.7119384, 1, 0, 0.4392157, 1,
1.535172, 0.5963764, 0.3516003, 1, 0, 0.4313726, 1,
1.545442, 1.276298, 1.318653, 1, 0, 0.427451, 1,
1.548607, 0.1500416, 2.181884, 1, 0, 0.4196078, 1,
1.562567, 1.002943, 0.4342512, 1, 0, 0.4156863, 1,
1.573455, 1.764199, 2.379967, 1, 0, 0.4078431, 1,
1.574901, -0.6385992, 1.926558, 1, 0, 0.4039216, 1,
1.597286, 0.2573474, 0.9072262, 1, 0, 0.3960784, 1,
1.598255, -1.270246, 3.520269, 1, 0, 0.3882353, 1,
1.604694, -2.006452, 1.618273, 1, 0, 0.3843137, 1,
1.613208, 0.3446028, 0.6860425, 1, 0, 0.3764706, 1,
1.617176, -1.418489, 2.07664, 1, 0, 0.372549, 1,
1.623622, 1.182377, 1.112574, 1, 0, 0.3647059, 1,
1.629747, 0.9726552, 2.782967, 1, 0, 0.3607843, 1,
1.642761, -0.169618, 1.616046, 1, 0, 0.3529412, 1,
1.653312, 0.1266021, 1.762283, 1, 0, 0.3490196, 1,
1.65852, -1.214503, 1.296874, 1, 0, 0.3411765, 1,
1.67881, 0.7924756, -0.3681007, 1, 0, 0.3372549, 1,
1.681865, -1.294834, 0.5008141, 1, 0, 0.3294118, 1,
1.68303, 1.578888, 3.954796, 1, 0, 0.3254902, 1,
1.703006, 0.9343637, -0.9075121, 1, 0, 0.3176471, 1,
1.704202, 0.09296061, -0.2074751, 1, 0, 0.3137255, 1,
1.708032, 0.218912, 0.7901242, 1, 0, 0.3058824, 1,
1.722646, 0.5150602, -0.225815, 1, 0, 0.2980392, 1,
1.724161, 0.2752859, 1.727499, 1, 0, 0.2941177, 1,
1.740665, -0.1674389, -0.04116111, 1, 0, 0.2862745, 1,
1.756735, 1.484519, 0.8863987, 1, 0, 0.282353, 1,
1.767387, -1.073408, 2.310796, 1, 0, 0.2745098, 1,
1.793924, -1.517653, 1.836808, 1, 0, 0.2705882, 1,
1.803854, 0.6327379, 1.860764, 1, 0, 0.2627451, 1,
1.807309, 0.3525575, 0.6236112, 1, 0, 0.2588235, 1,
1.816246, -0.3982967, -0.5820162, 1, 0, 0.2509804, 1,
1.818445, -1.327189, 1.818874, 1, 0, 0.2470588, 1,
1.82947, -1.284584, 2.637644, 1, 0, 0.2392157, 1,
1.853036, 0.3750187, 3.116525, 1, 0, 0.2352941, 1,
1.866718, -1.081747, 2.272704, 1, 0, 0.227451, 1,
1.867275, 1.540007, 2.258828, 1, 0, 0.2235294, 1,
1.878682, -0.1246568, 3.177649, 1, 0, 0.2156863, 1,
1.897572, -0.725257, 3.645813, 1, 0, 0.2117647, 1,
1.959201, 0.4013938, 1.125386, 1, 0, 0.2039216, 1,
1.960123, -0.5027292, 2.832332, 1, 0, 0.1960784, 1,
1.988244, 0.6595901, -0.8431133, 1, 0, 0.1921569, 1,
2.000457, -0.6825234, 2.701451, 1, 0, 0.1843137, 1,
2.030147, 0.7762306, 1.377865, 1, 0, 0.1803922, 1,
2.065301, -0.4129533, 1.173881, 1, 0, 0.172549, 1,
2.083721, 1.187732, 0.5098832, 1, 0, 0.1686275, 1,
2.088288, -0.24791, 2.397835, 1, 0, 0.1607843, 1,
2.122545, -0.6576737, 2.165021, 1, 0, 0.1568628, 1,
2.124931, 0.1493427, -0.3586337, 1, 0, 0.1490196, 1,
2.132661, 0.221595, 1.19693, 1, 0, 0.145098, 1,
2.145529, -1.05796, 2.504523, 1, 0, 0.1372549, 1,
2.15659, -0.2938549, 1.051488, 1, 0, 0.1333333, 1,
2.165718, 0.2302186, 1.977992, 1, 0, 0.1254902, 1,
2.191389, -0.3730936, 1.116664, 1, 0, 0.1215686, 1,
2.196116, 0.3519482, -1.047229, 1, 0, 0.1137255, 1,
2.211725, -0.8291155, 2.72391, 1, 0, 0.1098039, 1,
2.241389, -0.1280928, 2.664659, 1, 0, 0.1019608, 1,
2.246467, -0.3318031, 1.543196, 1, 0, 0.09411765, 1,
2.252114, 0.02572683, 0.3705831, 1, 0, 0.09019608, 1,
2.369287, -1.468331, 2.995356, 1, 0, 0.08235294, 1,
2.370344, -0.2018039, 1.626627, 1, 0, 0.07843138, 1,
2.408756, -0.536752, 0.2587601, 1, 0, 0.07058824, 1,
2.41146, 0.7149323, -0.6595383, 1, 0, 0.06666667, 1,
2.426147, -0.1180355, -0.9583457, 1, 0, 0.05882353, 1,
2.430611, 0.83294, 0.5988923, 1, 0, 0.05490196, 1,
2.442362, -0.5127571, 1.989045, 1, 0, 0.04705882, 1,
2.466266, -0.7425345, 2.73682, 1, 0, 0.04313726, 1,
2.491076, 1.285156, 1.314164, 1, 0, 0.03529412, 1,
2.561554, 0.573002, 0.01625924, 1, 0, 0.03137255, 1,
2.630433, -1.204241, 0.8306953, 1, 0, 0.02352941, 1,
2.655047, -1.29042, 3.897124, 1, 0, 0.01960784, 1,
2.768197, -1.489515, 0.7992687, 1, 0, 0.01176471, 1,
2.819007, 0.4991016, -0.9605598, 1, 0, 0.007843138, 1
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
-0.2283533, -3.985236, -7.561624, 0, -0.5, 0.5, 0.5,
-0.2283533, -3.985236, -7.561624, 1, -0.5, 0.5, 0.5,
-0.2283533, -3.985236, -7.561624, 1, 1.5, 0.5, 0.5,
-0.2283533, -3.985236, -7.561624, 0, 1.5, 0.5, 0.5
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
-4.308769, -0.01996219, -7.561624, 0, -0.5, 0.5, 0.5,
-4.308769, -0.01996219, -7.561624, 1, -0.5, 0.5, 0.5,
-4.308769, -0.01996219, -7.561624, 1, 1.5, 0.5, 0.5,
-4.308769, -0.01996219, -7.561624, 0, 1.5, 0.5, 0.5
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
-4.308769, -3.985236, 0.2848825, 0, -0.5, 0.5, 0.5,
-4.308769, -3.985236, 0.2848825, 1, -0.5, 0.5, 0.5,
-4.308769, -3.985236, 0.2848825, 1, 1.5, 0.5, 0.5,
-4.308769, -3.985236, 0.2848825, 0, 1.5, 0.5, 0.5
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
-3, -3.070173, -5.750892,
2, -3.070173, -5.750892,
-3, -3.070173, -5.750892,
-3, -3.222684, -6.05268,
-2, -3.070173, -5.750892,
-2, -3.222684, -6.05268,
-1, -3.070173, -5.750892,
-1, -3.222684, -6.05268,
0, -3.070173, -5.750892,
0, -3.222684, -6.05268,
1, -3.070173, -5.750892,
1, -3.222684, -6.05268,
2, -3.070173, -5.750892,
2, -3.222684, -6.05268
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
-3, -3.527705, -6.656258, 0, -0.5, 0.5, 0.5,
-3, -3.527705, -6.656258, 1, -0.5, 0.5, 0.5,
-3, -3.527705, -6.656258, 1, 1.5, 0.5, 0.5,
-3, -3.527705, -6.656258, 0, 1.5, 0.5, 0.5,
-2, -3.527705, -6.656258, 0, -0.5, 0.5, 0.5,
-2, -3.527705, -6.656258, 1, -0.5, 0.5, 0.5,
-2, -3.527705, -6.656258, 1, 1.5, 0.5, 0.5,
-2, -3.527705, -6.656258, 0, 1.5, 0.5, 0.5,
-1, -3.527705, -6.656258, 0, -0.5, 0.5, 0.5,
-1, -3.527705, -6.656258, 1, -0.5, 0.5, 0.5,
-1, -3.527705, -6.656258, 1, 1.5, 0.5, 0.5,
-1, -3.527705, -6.656258, 0, 1.5, 0.5, 0.5,
0, -3.527705, -6.656258, 0, -0.5, 0.5, 0.5,
0, -3.527705, -6.656258, 1, -0.5, 0.5, 0.5,
0, -3.527705, -6.656258, 1, 1.5, 0.5, 0.5,
0, -3.527705, -6.656258, 0, 1.5, 0.5, 0.5,
1, -3.527705, -6.656258, 0, -0.5, 0.5, 0.5,
1, -3.527705, -6.656258, 1, -0.5, 0.5, 0.5,
1, -3.527705, -6.656258, 1, 1.5, 0.5, 0.5,
1, -3.527705, -6.656258, 0, 1.5, 0.5, 0.5,
2, -3.527705, -6.656258, 0, -0.5, 0.5, 0.5,
2, -3.527705, -6.656258, 1, -0.5, 0.5, 0.5,
2, -3.527705, -6.656258, 1, 1.5, 0.5, 0.5,
2, -3.527705, -6.656258, 0, 1.5, 0.5, 0.5
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
-3.367134, -2, -5.750892,
-3.367134, 2, -5.750892,
-3.367134, -2, -5.750892,
-3.524073, -2, -6.05268,
-3.367134, -1, -5.750892,
-3.524073, -1, -6.05268,
-3.367134, 0, -5.750892,
-3.524073, 0, -6.05268,
-3.367134, 1, -5.750892,
-3.524073, 1, -6.05268,
-3.367134, 2, -5.750892,
-3.524073, 2, -6.05268
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
-3.837951, -2, -6.656258, 0, -0.5, 0.5, 0.5,
-3.837951, -2, -6.656258, 1, -0.5, 0.5, 0.5,
-3.837951, -2, -6.656258, 1, 1.5, 0.5, 0.5,
-3.837951, -2, -6.656258, 0, 1.5, 0.5, 0.5,
-3.837951, -1, -6.656258, 0, -0.5, 0.5, 0.5,
-3.837951, -1, -6.656258, 1, -0.5, 0.5, 0.5,
-3.837951, -1, -6.656258, 1, 1.5, 0.5, 0.5,
-3.837951, -1, -6.656258, 0, 1.5, 0.5, 0.5,
-3.837951, 0, -6.656258, 0, -0.5, 0.5, 0.5,
-3.837951, 0, -6.656258, 1, -0.5, 0.5, 0.5,
-3.837951, 0, -6.656258, 1, 1.5, 0.5, 0.5,
-3.837951, 0, -6.656258, 0, 1.5, 0.5, 0.5,
-3.837951, 1, -6.656258, 0, -0.5, 0.5, 0.5,
-3.837951, 1, -6.656258, 1, -0.5, 0.5, 0.5,
-3.837951, 1, -6.656258, 1, 1.5, 0.5, 0.5,
-3.837951, 1, -6.656258, 0, 1.5, 0.5, 0.5,
-3.837951, 2, -6.656258, 0, -0.5, 0.5, 0.5,
-3.837951, 2, -6.656258, 1, -0.5, 0.5, 0.5,
-3.837951, 2, -6.656258, 1, 1.5, 0.5, 0.5,
-3.837951, 2, -6.656258, 0, 1.5, 0.5, 0.5
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
-3.367134, -3.070173, -4,
-3.367134, -3.070173, 6,
-3.367134, -3.070173, -4,
-3.524073, -3.222684, -4,
-3.367134, -3.070173, -2,
-3.524073, -3.222684, -2,
-3.367134, -3.070173, 0,
-3.524073, -3.222684, 0,
-3.367134, -3.070173, 2,
-3.524073, -3.222684, 2,
-3.367134, -3.070173, 4,
-3.524073, -3.222684, 4,
-3.367134, -3.070173, 6,
-3.524073, -3.222684, 6
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
"4",
"6"
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
-3.837951, -3.527705, -4, 0, -0.5, 0.5, 0.5,
-3.837951, -3.527705, -4, 1, -0.5, 0.5, 0.5,
-3.837951, -3.527705, -4, 1, 1.5, 0.5, 0.5,
-3.837951, -3.527705, -4, 0, 1.5, 0.5, 0.5,
-3.837951, -3.527705, -2, 0, -0.5, 0.5, 0.5,
-3.837951, -3.527705, -2, 1, -0.5, 0.5, 0.5,
-3.837951, -3.527705, -2, 1, 1.5, 0.5, 0.5,
-3.837951, -3.527705, -2, 0, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 0, 0, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 0, 1, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 0, 1, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 0, 0, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 2, 0, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 2, 1, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 2, 1, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 2, 0, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 4, 0, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 4, 1, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 4, 1, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 4, 0, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 6, 0, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 6, 1, -0.5, 0.5, 0.5,
-3.837951, -3.527705, 6, 1, 1.5, 0.5, 0.5,
-3.837951, -3.527705, 6, 0, 1.5, 0.5, 0.5
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
-3.367134, -3.070173, -5.750892,
-3.367134, 3.030249, -5.750892,
-3.367134, -3.070173, 6.320657,
-3.367134, 3.030249, 6.320657,
-3.367134, -3.070173, -5.750892,
-3.367134, -3.070173, 6.320657,
-3.367134, 3.030249, -5.750892,
-3.367134, 3.030249, 6.320657,
-3.367134, -3.070173, -5.750892,
2.910428, -3.070173, -5.750892,
-3.367134, -3.070173, 6.320657,
2.910428, -3.070173, 6.320657,
-3.367134, 3.030249, -5.750892,
2.910428, 3.030249, -5.750892,
-3.367134, 3.030249, 6.320657,
2.910428, 3.030249, 6.320657,
2.910428, -3.070173, -5.750892,
2.910428, 3.030249, -5.750892,
2.910428, -3.070173, 6.320657,
2.910428, 3.030249, 6.320657,
2.910428, -3.070173, -5.750892,
2.910428, -3.070173, 6.320657,
2.910428, 3.030249, -5.750892,
2.910428, 3.030249, 6.320657
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
var radius = 7.962315;
var distance = 35.42524;
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
mvMatrix.translate( 0.2283533, 0.01996219, -0.2848825 );
mvMatrix.scale( 1.371394, 1.411216, 0.7131655 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.42524);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Diphenylether<-read.table("Diphenylether.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Diphenylether$V2
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylether' not found
```

```r
y<-Diphenylether$V3
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylether' not found
```

```r
z<-Diphenylether$V4
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylether' not found
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
-3.275713, 0.3689696, -3.094891, 0, 0, 1, 1, 1,
-3.083542, -0.207954, -3.85959, 1, 0, 0, 1, 1,
-3.013655, -0.165758, -1.33785, 1, 0, 0, 1, 1,
-2.97395, -0.1027198, -2.425974, 1, 0, 0, 1, 1,
-2.515435, 0.369001, -2.686958, 1, 0, 0, 1, 1,
-2.479447, 0.1913929, -1.567113, 1, 0, 0, 1, 1,
-2.453043, 1.142232, -0.9480203, 0, 0, 0, 1, 1,
-2.407093, -0.1183875, -1.436897, 0, 0, 0, 1, 1,
-2.308266, 0.2442943, -1.406106, 0, 0, 0, 1, 1,
-2.28985, -2.168516, -2.888564, 0, 0, 0, 1, 1,
-2.281771, 0.2180083, -2.527515, 0, 0, 0, 1, 1,
-2.278497, -0.2515317, -0.4596149, 0, 0, 0, 1, 1,
-2.257182, -1.244359, -2.401433, 0, 0, 0, 1, 1,
-2.242726, -0.1723105, -0.8850952, 1, 1, 1, 1, 1,
-2.236261, -0.9776331, -0.6730327, 1, 1, 1, 1, 1,
-2.235034, -1.405531, -1.755863, 1, 1, 1, 1, 1,
-2.211426, -0.7794477, -1.699568, 1, 1, 1, 1, 1,
-2.178868, 1.470214, -1.771837, 1, 1, 1, 1, 1,
-2.170484, 0.4770509, -1.285294, 1, 1, 1, 1, 1,
-2.149975, 0.4231573, -1.783238, 1, 1, 1, 1, 1,
-2.089992, -0.07856985, -1.196675, 1, 1, 1, 1, 1,
-2.083586, 0.8818766, -2.330076, 1, 1, 1, 1, 1,
-2.080843, -0.8424185, -2.8844, 1, 1, 1, 1, 1,
-2.074232, -1.005223, -1.97376, 1, 1, 1, 1, 1,
-2.068976, 0.1335272, -1.137976, 1, 1, 1, 1, 1,
-1.998049, -0.08162598, -0.1073454, 1, 1, 1, 1, 1,
-1.964309, 0.7637069, -1.44654, 1, 1, 1, 1, 1,
-1.962523, 1.61816, -1.12231, 1, 1, 1, 1, 1,
-1.944506, 1.669756, -0.6454536, 0, 0, 1, 1, 1,
-1.943665, 0.7560467, -0.5457037, 1, 0, 0, 1, 1,
-1.935751, -0.02905814, -2.237386, 1, 0, 0, 1, 1,
-1.934158, 0.02437518, -1.485809, 1, 0, 0, 1, 1,
-1.929015, -0.8581038, -1.364796, 1, 0, 0, 1, 1,
-1.921791, 0.3759314, -0.8018318, 1, 0, 0, 1, 1,
-1.916086, -0.5128205, -0.5864976, 0, 0, 0, 1, 1,
-1.904056, 1.637204, 1.992896, 0, 0, 0, 1, 1,
-1.900746, 1.683401, 0.5815416, 0, 0, 0, 1, 1,
-1.87741, 1.102402, 0.80832, 0, 0, 0, 1, 1,
-1.865805, 0.9368507, -0.9523984, 0, 0, 0, 1, 1,
-1.85784, 2.345507, -0.03215853, 0, 0, 0, 1, 1,
-1.857079, -2.241521, -2.449687, 0, 0, 0, 1, 1,
-1.848328, -0.8050088, -3.601865, 1, 1, 1, 1, 1,
-1.846715, 1.307064, -1.27763, 1, 1, 1, 1, 1,
-1.844759, 1.176349, -0.3909198, 1, 1, 1, 1, 1,
-1.840106, -0.1856231, -4.090834, 1, 1, 1, 1, 1,
-1.813817, -0.1327267, -2.690315, 1, 1, 1, 1, 1,
-1.808931, 0.2542739, -3.855884, 1, 1, 1, 1, 1,
-1.779194, -0.1012544, -1.258098, 1, 1, 1, 1, 1,
-1.772427, 1.3357, 0.5291176, 1, 1, 1, 1, 1,
-1.757965, -1.540849, -3.38142, 1, 1, 1, 1, 1,
-1.748792, -0.9793371, -1.305409, 1, 1, 1, 1, 1,
-1.739988, -0.672099, -0.4105148, 1, 1, 1, 1, 1,
-1.711184, -0.09668458, -2.191436, 1, 1, 1, 1, 1,
-1.704417, -0.3266839, -2.841095, 1, 1, 1, 1, 1,
-1.697681, 0.4312893, -1.282728, 1, 1, 1, 1, 1,
-1.695553, -1.284713, -1.415471, 1, 1, 1, 1, 1,
-1.678717, 0.5990521, -1.545789, 0, 0, 1, 1, 1,
-1.659341, -1.585657, -1.850898, 1, 0, 0, 1, 1,
-1.650678, -0.1639314, -0.09066503, 1, 0, 0, 1, 1,
-1.648221, 1.030741, -1.688002, 1, 0, 0, 1, 1,
-1.645074, 1.968426, -1.167981, 1, 0, 0, 1, 1,
-1.621139, -0.2048839, -3.197125, 1, 0, 0, 1, 1,
-1.619803, -0.266675, -2.011445, 0, 0, 0, 1, 1,
-1.577291, 0.8280495, -1.406467, 0, 0, 0, 1, 1,
-1.569538, -0.06142112, -0.9753749, 0, 0, 0, 1, 1,
-1.566137, -1.303088, -2.114411, 0, 0, 0, 1, 1,
-1.56116, -0.2908686, -0.7848135, 0, 0, 0, 1, 1,
-1.551034, -0.09470766, -1.646558, 0, 0, 0, 1, 1,
-1.546486, -1.367289, -3.265088, 0, 0, 0, 1, 1,
-1.530657, 2.144132, 0.2514879, 1, 1, 1, 1, 1,
-1.491714, 0.2676456, -1.322663, 1, 1, 1, 1, 1,
-1.491239, -1.694676, -2.359248, 1, 1, 1, 1, 1,
-1.475927, -2.419741, -2.141308, 1, 1, 1, 1, 1,
-1.472937, 0.5501614, -1.978956, 1, 1, 1, 1, 1,
-1.437579, -0.237327, -1.194529, 1, 1, 1, 1, 1,
-1.434805, -0.01091896, -1.513146, 1, 1, 1, 1, 1,
-1.427246, -0.9174275, -3.260119, 1, 1, 1, 1, 1,
-1.417586, 1.603012, -0.9274821, 1, 1, 1, 1, 1,
-1.415432, 1.328487, 0.08107459, 1, 1, 1, 1, 1,
-1.402734, 0.3989422, -1.536532, 1, 1, 1, 1, 1,
-1.401752, -0.9297836, -0.8030247, 1, 1, 1, 1, 1,
-1.399368, -0.2651142, -2.712551, 1, 1, 1, 1, 1,
-1.384953, -0.1678108, -2.34159, 1, 1, 1, 1, 1,
-1.383048, 1.142183, 0.7272413, 1, 1, 1, 1, 1,
-1.380449, 0.3228336, -0.8289515, 0, 0, 1, 1, 1,
-1.373432, 1.708387, -0.5890617, 1, 0, 0, 1, 1,
-1.357666, -0.3750003, -4.341896, 1, 0, 0, 1, 1,
-1.352437, 0.7755877, 0.5844383, 1, 0, 0, 1, 1,
-1.346017, 0.3264864, 0.01375085, 1, 0, 0, 1, 1,
-1.345492, -0.110516, -1.293614, 1, 0, 0, 1, 1,
-1.33457, -0.02842522, -2.286889, 0, 0, 0, 1, 1,
-1.324246, -0.272838, -2.147235, 0, 0, 0, 1, 1,
-1.314934, -0.01004578, 0.1668393, 0, 0, 0, 1, 1,
-1.314005, 0.9647092, -0.4393821, 0, 0, 0, 1, 1,
-1.313782, 1.704006, -1.586227, 0, 0, 0, 1, 1,
-1.310313, 0.8305184, -1.841351, 0, 0, 0, 1, 1,
-1.304007, 0.0691845, -0.5378755, 0, 0, 0, 1, 1,
-1.293858, 0.08381411, -1.51861, 1, 1, 1, 1, 1,
-1.290632, 0.4924435, -1.389153, 1, 1, 1, 1, 1,
-1.283937, 1.979985, 0.6464258, 1, 1, 1, 1, 1,
-1.279544, -1.813614, -2.725073, 1, 1, 1, 1, 1,
-1.275475, 1.172888, -0.1055412, 1, 1, 1, 1, 1,
-1.270953, -0.4517933, -0.1403748, 1, 1, 1, 1, 1,
-1.256501, 0.7182674, -1.132796, 1, 1, 1, 1, 1,
-1.249107, 1.515443, -1.21321, 1, 1, 1, 1, 1,
-1.244467, 0.9351582, -0.5312517, 1, 1, 1, 1, 1,
-1.243911, -0.3751958, -1.755393, 1, 1, 1, 1, 1,
-1.242749, 0.6063132, 0.7679636, 1, 1, 1, 1, 1,
-1.237786, -2.0632, -2.474117, 1, 1, 1, 1, 1,
-1.223366, -1.515386, -1.968626, 1, 1, 1, 1, 1,
-1.220583, 0.4198849, -3.496421, 1, 1, 1, 1, 1,
-1.218372, 0.1967009, -1.052837, 1, 1, 1, 1, 1,
-1.212455, -1.565001, -4.374444, 0, 0, 1, 1, 1,
-1.208322, -0.15163, -1.341982, 1, 0, 0, 1, 1,
-1.205806, 1.236713, -0.9385881, 1, 0, 0, 1, 1,
-1.202674, -0.08182713, -0.05575446, 1, 0, 0, 1, 1,
-1.199436, 2.941408, -0.6250641, 1, 0, 0, 1, 1,
-1.196649, -0.4718123, -0.8986534, 1, 0, 0, 1, 1,
-1.193518, 1.060306, -1.814384, 0, 0, 0, 1, 1,
-1.190728, -0.1509933, -2.401397, 0, 0, 0, 1, 1,
-1.184315, 1.653055, -0.7486876, 0, 0, 0, 1, 1,
-1.180677, -0.6906906, -1.987279, 0, 0, 0, 1, 1,
-1.177083, -0.3117613, -2.554533, 0, 0, 0, 1, 1,
-1.162946, 0.1007393, -2.059582, 0, 0, 0, 1, 1,
-1.161294, 0.6277853, -2.156884, 0, 0, 0, 1, 1,
-1.147678, -0.5893559, -2.930573, 1, 1, 1, 1, 1,
-1.139379, 0.866005, -1.288908, 1, 1, 1, 1, 1,
-1.137487, 0.783642, -0.01642751, 1, 1, 1, 1, 1,
-1.134329, 0.5375246, -1.599763, 1, 1, 1, 1, 1,
-1.133967, -1.302893, -2.898648, 1, 1, 1, 1, 1,
-1.1275, -0.3726319, -4.940629, 1, 1, 1, 1, 1,
-1.1225, 0.1229206, 0.1760223, 1, 1, 1, 1, 1,
-1.121904, -0.3908361, -2.377811, 1, 1, 1, 1, 1,
-1.117386, -0.827739, -4.304015, 1, 1, 1, 1, 1,
-1.116112, 0.4157311, -0.9091508, 1, 1, 1, 1, 1,
-1.102019, -0.05953155, -0.505299, 1, 1, 1, 1, 1,
-1.099994, 1.361933, -0.8245136, 1, 1, 1, 1, 1,
-1.097435, -0.5799124, -1.32195, 1, 1, 1, 1, 1,
-1.09516, -0.3732937, -1.759139, 1, 1, 1, 1, 1,
-1.085444, 0.511242, -0.8778274, 1, 1, 1, 1, 1,
-1.081522, 0.5322664, -2.736461, 0, 0, 1, 1, 1,
-1.079716, 0.9242346, 0.3099692, 1, 0, 0, 1, 1,
-1.078067, 0.09710233, -1.593387, 1, 0, 0, 1, 1,
-1.076655, 0.2711283, -1.230542, 1, 0, 0, 1, 1,
-1.064299, -0.1610888, -2.239846, 1, 0, 0, 1, 1,
-1.063594, -1.602942, -3.195816, 1, 0, 0, 1, 1,
-1.036582, 0.04263949, -1.496615, 0, 0, 0, 1, 1,
-1.036197, 0.2080624, -2.103283, 0, 0, 0, 1, 1,
-1.027533, -0.4744355, -2.796966, 0, 0, 0, 1, 1,
-1.024964, 0.039307, -0.5882757, 0, 0, 0, 1, 1,
-1.021865, 0.344418, -3.925631, 0, 0, 0, 1, 1,
-1.015513, 0.1253261, -1.602453, 0, 0, 0, 1, 1,
-1.015065, 0.1337628, -1.384056, 0, 0, 0, 1, 1,
-1.01237, -0.2739567, -2.187518, 1, 1, 1, 1, 1,
-1.009621, 0.2117267, -2.23085, 1, 1, 1, 1, 1,
-1.003328, -0.4703436, -2.15698, 1, 1, 1, 1, 1,
-0.9890798, 0.6890736, -0.847791, 1, 1, 1, 1, 1,
-0.9835296, -0.08812547, -1.138344, 1, 1, 1, 1, 1,
-0.9712429, -1.386496, -1.879243, 1, 1, 1, 1, 1,
-0.9637055, -0.1366832, 0.04855623, 1, 1, 1, 1, 1,
-0.9628649, 1.114806, -0.6945423, 1, 1, 1, 1, 1,
-0.9620485, 0.04869039, -3.363603, 1, 1, 1, 1, 1,
-0.9604433, 0.08492333, -2.209427, 1, 1, 1, 1, 1,
-0.9463376, -0.4075515, -0.424928, 1, 1, 1, 1, 1,
-0.9410322, 0.9048403, -1.786398, 1, 1, 1, 1, 1,
-0.940104, 0.447125, 1.418777, 1, 1, 1, 1, 1,
-0.9358693, -0.5186816, -2.739371, 1, 1, 1, 1, 1,
-0.9300081, -1.067317, -3.430153, 1, 1, 1, 1, 1,
-0.9267556, -1.222783, -2.424581, 0, 0, 1, 1, 1,
-0.9216965, 0.1844499, -2.292239, 1, 0, 0, 1, 1,
-0.913451, -0.1954398, -0.9849942, 1, 0, 0, 1, 1,
-0.9116964, 0.2469256, -1.586199, 1, 0, 0, 1, 1,
-0.9061648, 0.2532122, -0.7806941, 1, 0, 0, 1, 1,
-0.8972013, -1.926688, -2.922536, 1, 0, 0, 1, 1,
-0.8953694, -0.3567051, -2.447003, 0, 0, 0, 1, 1,
-0.8927696, 0.107069, -2.521374, 0, 0, 0, 1, 1,
-0.8811567, -0.9312716, -4.189488, 0, 0, 0, 1, 1,
-0.8728271, -0.9411958, -2.545755, 0, 0, 0, 1, 1,
-0.870196, 1.425028, -0.7169769, 0, 0, 0, 1, 1,
-0.8691616, 0.4814084, -0.1401322, 0, 0, 0, 1, 1,
-0.8669394, 0.6939129, -1.146396, 0, 0, 0, 1, 1,
-0.8649597, 0.7659163, -0.7020299, 1, 1, 1, 1, 1,
-0.8632334, -1.628994, -1.335934, 1, 1, 1, 1, 1,
-0.8606486, -0.8414578, -2.472774, 1, 1, 1, 1, 1,
-0.8606443, 0.2604672, -0.8697536, 1, 1, 1, 1, 1,
-0.8562389, -0.1116927, -1.182052, 1, 1, 1, 1, 1,
-0.8547841, 1.148773, -0.1014449, 1, 1, 1, 1, 1,
-0.8507903, 0.6944395, -2.104406, 1, 1, 1, 1, 1,
-0.8495034, 0.7790844, 0.4123386, 1, 1, 1, 1, 1,
-0.8455822, -0.8064607, -2.648552, 1, 1, 1, 1, 1,
-0.8296935, -0.6022044, -1.483686, 1, 1, 1, 1, 1,
-0.8197721, -1.235839, -4.311721, 1, 1, 1, 1, 1,
-0.8150204, 0.7375889, -0.3387321, 1, 1, 1, 1, 1,
-0.8069627, -2.350026, -3.083798, 1, 1, 1, 1, 1,
-0.802673, 0.8270751, -0.7921144, 1, 1, 1, 1, 1,
-0.8015477, 0.9286155, 0.310689, 1, 1, 1, 1, 1,
-0.7981973, -0.7242095, -0.8109715, 0, 0, 1, 1, 1,
-0.7971129, 0.7630485, -1.361549, 1, 0, 0, 1, 1,
-0.7925408, -1.007801, -2.301498, 1, 0, 0, 1, 1,
-0.7885364, 0.09720941, -2.030786, 1, 0, 0, 1, 1,
-0.7858005, -0.2406388, -1.293149, 1, 0, 0, 1, 1,
-0.7835048, 0.5125563, -1.548704, 1, 0, 0, 1, 1,
-0.7826781, -0.9923407, -2.401142, 0, 0, 0, 1, 1,
-0.764049, -0.4336427, -3.371251, 0, 0, 0, 1, 1,
-0.7635463, 1.108177, 0.6043685, 0, 0, 0, 1, 1,
-0.7619742, -0.1765565, -2.765944, 0, 0, 0, 1, 1,
-0.7574957, -1.530032, -0.5714959, 0, 0, 0, 1, 1,
-0.7568681, 0.9671525, -2.279292, 0, 0, 0, 1, 1,
-0.7561121, 0.5249015, -1.169749, 0, 0, 0, 1, 1,
-0.7464671, 1.067329, -1.263727, 1, 1, 1, 1, 1,
-0.7425875, 2.490827, 2.261461, 1, 1, 1, 1, 1,
-0.7383524, 0.4239527, -1.227953, 1, 1, 1, 1, 1,
-0.738283, -0.7572426, -2.658413, 1, 1, 1, 1, 1,
-0.7323319, 0.4938482, -1.477915, 1, 1, 1, 1, 1,
-0.7297518, -0.8434117, -3.046443, 1, 1, 1, 1, 1,
-0.7291969, -0.2100313, -1.858334, 1, 1, 1, 1, 1,
-0.7285312, 0.5577343, -0.06702269, 1, 1, 1, 1, 1,
-0.7278616, 1.042053, -0.7012606, 1, 1, 1, 1, 1,
-0.7188567, -0.6364865, -1.326123, 1, 1, 1, 1, 1,
-0.7146801, -0.6422715, -2.252681, 1, 1, 1, 1, 1,
-0.7138972, -0.7414474, -1.863534, 1, 1, 1, 1, 1,
-0.7130337, -0.4018849, -0.6661245, 1, 1, 1, 1, 1,
-0.7038422, 0.5417882, -1.18531, 1, 1, 1, 1, 1,
-0.7021675, 1.151516, 0.1073115, 1, 1, 1, 1, 1,
-0.6873836, 0.5492492, -0.9534398, 0, 0, 1, 1, 1,
-0.6858612, 0.1952845, -1.579054, 1, 0, 0, 1, 1,
-0.6847142, -0.8604156, -2.312639, 1, 0, 0, 1, 1,
-0.6819764, -0.4625236, -2.275665, 1, 0, 0, 1, 1,
-0.6739982, 1.027238, 0.7282046, 1, 0, 0, 1, 1,
-0.6714889, 0.07570861, -0.5309251, 1, 0, 0, 1, 1,
-0.6655062, -2.594495, -3.939453, 0, 0, 0, 1, 1,
-0.6653582, -1.597744, -2.590241, 0, 0, 0, 1, 1,
-0.6652454, 0.5529085, -1.444633, 0, 0, 0, 1, 1,
-0.663848, 0.5199296, -1.094182, 0, 0, 0, 1, 1,
-0.6625878, -0.9963745, -3.515981, 0, 0, 0, 1, 1,
-0.6588408, -0.4252442, -1.57408, 0, 0, 0, 1, 1,
-0.6585245, -0.9902576, -2.460422, 0, 0, 0, 1, 1,
-0.6565574, 0.3716564, -0.7987955, 1, 1, 1, 1, 1,
-0.6554382, -1.324219, -1.673064, 1, 1, 1, 1, 1,
-0.6479197, -0.8775029, -0.9991264, 1, 1, 1, 1, 1,
-0.6465739, 0.30429, -1.123854, 1, 1, 1, 1, 1,
-0.6463842, -1.915023, -2.648586, 1, 1, 1, 1, 1,
-0.6457602, -0.6151433, -1.914613, 1, 1, 1, 1, 1,
-0.6390793, 0.3908619, -1.901617, 1, 1, 1, 1, 1,
-0.6379195, 1.036623, 0.09007649, 1, 1, 1, 1, 1,
-0.6345717, -0.6780367, -1.322638, 1, 1, 1, 1, 1,
-0.6272479, 0.9539142, 0.3375229, 1, 1, 1, 1, 1,
-0.6214777, 0.380523, -0.8675801, 1, 1, 1, 1, 1,
-0.6120268, -1.485103, -4.445956, 1, 1, 1, 1, 1,
-0.6101806, 0.2240535, -1.16306, 1, 1, 1, 1, 1,
-0.6074002, -0.8522011, -3.611981, 1, 1, 1, 1, 1,
-0.6069879, -0.0727815, -1.175635, 1, 1, 1, 1, 1,
-0.6041891, 0.2412741, -0.9976709, 0, 0, 1, 1, 1,
-0.591984, 1.36594, -0.7570258, 1, 0, 0, 1, 1,
-0.5894719, -0.9328364, -2.993271, 1, 0, 0, 1, 1,
-0.5876341, -0.992794, -2.752849, 1, 0, 0, 1, 1,
-0.5867584, -0.3943929, -1.144541, 1, 0, 0, 1, 1,
-0.5821251, -1.542817, -2.824998, 1, 0, 0, 1, 1,
-0.5809133, 2.763931, -0.2913702, 0, 0, 0, 1, 1,
-0.5797657, -0.4944844, -4.414413, 0, 0, 0, 1, 1,
-0.5762165, -1.291767, -3.213683, 0, 0, 0, 1, 1,
-0.5758657, 1.207487, -2.148088, 0, 0, 0, 1, 1,
-0.5710797, 1.389785, -1.434175, 0, 0, 0, 1, 1,
-0.5636928, 0.7034377, -1.904312, 0, 0, 0, 1, 1,
-0.5631961, 0.354289, -0.9502649, 0, 0, 0, 1, 1,
-0.562052, 0.9658942, -2.09202, 1, 1, 1, 1, 1,
-0.561857, -1.531424, -2.484314, 1, 1, 1, 1, 1,
-0.5566559, 0.5518366, -0.3389344, 1, 1, 1, 1, 1,
-0.5480968, 0.2084865, 0.7210957, 1, 1, 1, 1, 1,
-0.5463852, -0.4866244, -3.055002, 1, 1, 1, 1, 1,
-0.5403317, -1.837979, -2.781922, 1, 1, 1, 1, 1,
-0.5355172, -0.9197397, -2.345762, 1, 1, 1, 1, 1,
-0.5349514, 0.1122734, -1.774243, 1, 1, 1, 1, 1,
-0.5301659, 1.717397, -1.559383, 1, 1, 1, 1, 1,
-0.5278856, -0.6601013, -2.057789, 1, 1, 1, 1, 1,
-0.5254371, -0.751278, -2.992265, 1, 1, 1, 1, 1,
-0.5216121, -0.3982732, -2.455961, 1, 1, 1, 1, 1,
-0.5207797, -2.598683, -0.8229868, 1, 1, 1, 1, 1,
-0.5184769, -0.8054053, -2.183357, 1, 1, 1, 1, 1,
-0.5157974, -0.7096174, -2.710705, 1, 1, 1, 1, 1,
-0.5077747, 1.085117, -0.2535204, 0, 0, 1, 1, 1,
-0.5034019, 0.2907586, -1.138537, 1, 0, 0, 1, 1,
-0.4930529, -1.770493, -4.665525, 1, 0, 0, 1, 1,
-0.4927418, -0.2791312, -3.080892, 1, 0, 0, 1, 1,
-0.4926772, 1.287104, 0.5857735, 1, 0, 0, 1, 1,
-0.4912917, 0.7007922, 0.2787271, 1, 0, 0, 1, 1,
-0.4881996, -1.174193, -1.864142, 0, 0, 0, 1, 1,
-0.4845379, 0.9431881, -0.2573538, 0, 0, 0, 1, 1,
-0.4837535, 0.03226262, -1.363787, 0, 0, 0, 1, 1,
-0.4785461, 0.8206819, 0.5287477, 0, 0, 0, 1, 1,
-0.4740303, -0.4115705, -2.676792, 0, 0, 0, 1, 1,
-0.4721343, 0.6076055, -0.575458, 0, 0, 0, 1, 1,
-0.4659512, -0.3395278, -2.156302, 0, 0, 0, 1, 1,
-0.4658502, 0.4284375, -0.5007578, 1, 1, 1, 1, 1,
-0.4642299, 2.199381, -0.8799902, 1, 1, 1, 1, 1,
-0.4640194, 0.449987, 1.356947, 1, 1, 1, 1, 1,
-0.4633409, 1.398553, -1.079097, 1, 1, 1, 1, 1,
-0.4607571, -0.8336579, -2.129441, 1, 1, 1, 1, 1,
-0.4585049, -0.2328945, -2.798596, 1, 1, 1, 1, 1,
-0.4579958, -1.431944, -4.16398, 1, 1, 1, 1, 1,
-0.4577165, 0.5843185, -0.1460734, 1, 1, 1, 1, 1,
-0.4527853, -0.872083, -1.308955, 1, 1, 1, 1, 1,
-0.4475793, 1.295291, 0.3559486, 1, 1, 1, 1, 1,
-0.4474342, 0.230947, -1.262455, 1, 1, 1, 1, 1,
-0.4416322, -1.00102, -2.319472, 1, 1, 1, 1, 1,
-0.4408671, -1.044131, -2.489091, 1, 1, 1, 1, 1,
-0.4396448, 1.638159, 0.3604191, 1, 1, 1, 1, 1,
-0.4334874, -2.126331, -2.945968, 1, 1, 1, 1, 1,
-0.4233897, -0.6830183, -2.302065, 0, 0, 1, 1, 1,
-0.4130454, 0.2245848, -2.125685, 1, 0, 0, 1, 1,
-0.4073575, -0.873033, -1.892313, 1, 0, 0, 1, 1,
-0.4047128, -0.2417195, -0.9996329, 1, 0, 0, 1, 1,
-0.3992288, 0.3490207, -1.894329, 1, 0, 0, 1, 1,
-0.397085, -1.306152, -2.701191, 1, 0, 0, 1, 1,
-0.3963292, 0.8272383, 0.1306763, 0, 0, 0, 1, 1,
-0.3949884, -0.7468709, -4.961003, 0, 0, 0, 1, 1,
-0.3929496, -1.359152, -2.351197, 0, 0, 0, 1, 1,
-0.3911375, -1.423075, -1.986408, 0, 0, 0, 1, 1,
-0.3844064, 0.2210244, -1.445027, 0, 0, 0, 1, 1,
-0.3814819, -0.06198557, -2.052834, 0, 0, 0, 1, 1,
-0.3802018, 0.67284, -0.8817621, 0, 0, 0, 1, 1,
-0.3652167, -1.331941, -4.017532, 1, 1, 1, 1, 1,
-0.3646697, -0.785704, -3.581832, 1, 1, 1, 1, 1,
-0.3623898, -2.537165, -3.906014, 1, 1, 1, 1, 1,
-0.3617189, -1.350543, -2.048789, 1, 1, 1, 1, 1,
-0.3610051, -0.1199594, -2.831002, 1, 1, 1, 1, 1,
-0.359186, 0.5257275, -2.209094, 1, 1, 1, 1, 1,
-0.3588241, 0.09524076, -1.652544, 1, 1, 1, 1, 1,
-0.3560153, 0.07709602, -0.564588, 1, 1, 1, 1, 1,
-0.3550294, 0.1808508, 0.6409847, 1, 1, 1, 1, 1,
-0.3538939, -0.2745111, -2.152342, 1, 1, 1, 1, 1,
-0.3483942, 0.3740715, -0.0497342, 1, 1, 1, 1, 1,
-0.3465597, 0.8768786, -0.4516179, 1, 1, 1, 1, 1,
-0.3449908, -0.09531406, -2.964955, 1, 1, 1, 1, 1,
-0.3448402, -1.435865, -1.605527, 1, 1, 1, 1, 1,
-0.3444279, -1.105112, -2.018537, 1, 1, 1, 1, 1,
-0.343558, 1.657417, -0.2896374, 0, 0, 1, 1, 1,
-0.3394092, 1.253798, 0.4462637, 1, 0, 0, 1, 1,
-0.335937, -0.2106372, -4.561999, 1, 0, 0, 1, 1,
-0.3349482, -0.6359918, -2.946875, 1, 0, 0, 1, 1,
-0.3323968, -1.333098, -5.306293, 1, 0, 0, 1, 1,
-0.3314639, 1.845567, -0.5431809, 1, 0, 0, 1, 1,
-0.3298351, -0.4735904, -1.722404, 0, 0, 0, 1, 1,
-0.3271184, -0.7766975, -1.559787, 0, 0, 0, 1, 1,
-0.3198785, 1.115846, 0.1885499, 0, 0, 0, 1, 1,
-0.3174015, 0.2226272, 0.2955832, 0, 0, 0, 1, 1,
-0.3145043, 0.9390566, -0.8912434, 0, 0, 0, 1, 1,
-0.3106687, 2.293008, -0.2966799, 0, 0, 0, 1, 1,
-0.3102543, 0.1315682, -0.4235576, 0, 0, 0, 1, 1,
-0.3077493, -0.1811359, -2.307441, 1, 1, 1, 1, 1,
-0.3002178, 2.159808, 0.6591138, 1, 1, 1, 1, 1,
-0.2977721, -0.8584944, -2.415085, 1, 1, 1, 1, 1,
-0.2971141, -0.405109, -5.575092, 1, 1, 1, 1, 1,
-0.2938258, -0.2176549, -1.669308, 1, 1, 1, 1, 1,
-0.293806, 1.476206, -1.421515, 1, 1, 1, 1, 1,
-0.2928955, -1.24071, -2.702626, 1, 1, 1, 1, 1,
-0.2883182, 0.483232, -1.746325, 1, 1, 1, 1, 1,
-0.278783, 0.2726334, -0.5273137, 1, 1, 1, 1, 1,
-0.2775536, 2.227603, -0.3026439, 1, 1, 1, 1, 1,
-0.2766041, -1.805543, -3.900273, 1, 1, 1, 1, 1,
-0.2716619, 0.2898149, -1.800546, 1, 1, 1, 1, 1,
-0.2689223, -0.7901513, -4.985511, 1, 1, 1, 1, 1,
-0.2671999, -0.5595045, -1.440798, 1, 1, 1, 1, 1,
-0.2601723, -0.972234, -3.632895, 1, 1, 1, 1, 1,
-0.2573608, -0.2131195, -0.8447246, 0, 0, 1, 1, 1,
-0.2541258, 0.5710563, 0.259381, 1, 0, 0, 1, 1,
-0.2517151, -0.7460302, -1.92547, 1, 0, 0, 1, 1,
-0.2493681, -1.350778, -2.510506, 1, 0, 0, 1, 1,
-0.2455124, 0.586971, -0.4389427, 1, 0, 0, 1, 1,
-0.2434385, 0.8800281, -0.3956401, 1, 0, 0, 1, 1,
-0.237959, -0.7307891, -2.357456, 0, 0, 0, 1, 1,
-0.2326838, -1.324965, -1.866611, 0, 0, 0, 1, 1,
-0.2316027, -1.341176, -2.417116, 0, 0, 0, 1, 1,
-0.229366, 2.009892, -0.7005547, 0, 0, 0, 1, 1,
-0.2289896, 1.606475, -0.1837513, 0, 0, 0, 1, 1,
-0.2244409, 0.520687, -3.311257, 0, 0, 0, 1, 1,
-0.2239153, -1.072261, -2.842027, 0, 0, 0, 1, 1,
-0.2229791, 0.4099838, -0.2251901, 1, 1, 1, 1, 1,
-0.214488, -0.6448683, -2.857833, 1, 1, 1, 1, 1,
-0.2131746, -2.425626, -4.524974, 1, 1, 1, 1, 1,
-0.2121148, 0.7082316, -0.3516319, 1, 1, 1, 1, 1,
-0.2121042, 0.3600396, -1.17434, 1, 1, 1, 1, 1,
-0.2119421, 1.385859, -1.029877, 1, 1, 1, 1, 1,
-0.1965267, -2.23906, -4.368317, 1, 1, 1, 1, 1,
-0.195448, -0.7164499, -2.447647, 1, 1, 1, 1, 1,
-0.192052, 0.7630153, -1.248426, 1, 1, 1, 1, 1,
-0.1912614, 0.9378756, -0.2930672, 1, 1, 1, 1, 1,
-0.1911317, -1.759714, -2.613503, 1, 1, 1, 1, 1,
-0.1889277, -0.6438559, -3.823592, 1, 1, 1, 1, 1,
-0.1827874, 0.3484369, 0.4604779, 1, 1, 1, 1, 1,
-0.1822188, -0.3328077, -3.16456, 1, 1, 1, 1, 1,
-0.1803376, 2.407238, 0.2503235, 1, 1, 1, 1, 1,
-0.1798298, -1.083784, -2.335194, 0, 0, 1, 1, 1,
-0.1745321, -0.4882514, -3.191864, 1, 0, 0, 1, 1,
-0.1723361, 1.162431, 0.1752851, 1, 0, 0, 1, 1,
-0.1720676, -0.5462345, -2.213981, 1, 0, 0, 1, 1,
-0.1719589, 0.4460692, 0.3964646, 1, 0, 0, 1, 1,
-0.1699752, 1.126952, 0.3318271, 1, 0, 0, 1, 1,
-0.169266, 0.612136, 2.509555, 0, 0, 0, 1, 1,
-0.1681265, 0.0004816234, -3.474298, 0, 0, 0, 1, 1,
-0.1645441, -0.9372268, -2.513319, 0, 0, 0, 1, 1,
-0.1625232, -0.3021101, -3.742466, 0, 0, 0, 1, 1,
-0.1622482, 0.07308169, 0.5839325, 0, 0, 0, 1, 1,
-0.1605143, -1.169142, -2.186022, 0, 0, 0, 1, 1,
-0.15735, 0.1695455, -1.351215, 0, 0, 0, 1, 1,
-0.1572278, -0.05748292, -0.6133067, 1, 1, 1, 1, 1,
-0.1511054, -0.2882945, -3.140105, 1, 1, 1, 1, 1,
-0.1491767, 0.9498403, -0.1887152, 1, 1, 1, 1, 1,
-0.1467252, -2.201129, -3.706702, 1, 1, 1, 1, 1,
-0.1399314, -0.3928258, -1.757143, 1, 1, 1, 1, 1,
-0.138789, -0.2152445, -2.119009, 1, 1, 1, 1, 1,
-0.1385904, 1.113598, -0.1546683, 1, 1, 1, 1, 1,
-0.1367394, -1.054285, -4.203638, 1, 1, 1, 1, 1,
-0.131607, -1.391999, -4.037645, 1, 1, 1, 1, 1,
-0.1286361, -1.18813, -4.243472, 1, 1, 1, 1, 1,
-0.1221562, 1.110145, -0.3242221, 1, 1, 1, 1, 1,
-0.1205005, 0.6229041, 0.3792392, 1, 1, 1, 1, 1,
-0.119544, -0.2080824, -1.887762, 1, 1, 1, 1, 1,
-0.1190641, -1.349911, -3.382662, 1, 1, 1, 1, 1,
-0.1187527, -1.75167, -3.756797, 1, 1, 1, 1, 1,
-0.114348, 0.1170862, -1.184767, 0, 0, 1, 1, 1,
-0.1010221, -0.9035596, -2.561614, 1, 0, 0, 1, 1,
-0.09571238, 0.4186387, 0.2344631, 1, 0, 0, 1, 1,
-0.09135971, 0.2857686, -1.452834, 1, 0, 0, 1, 1,
-0.09001698, 2.078235, -0.5623235, 1, 0, 0, 1, 1,
-0.08909729, 0.7516183, -1.103987, 1, 0, 0, 1, 1,
-0.08840437, -1.288906, -2.968174, 0, 0, 0, 1, 1,
-0.08833569, -0.9602668, -2.004722, 0, 0, 0, 1, 1,
-0.08475768, 0.08706638, -2.551575, 0, 0, 0, 1, 1,
-0.08369674, -0.6630982, -3.107717, 0, 0, 0, 1, 1,
-0.08151793, 0.5706888, -0.4769211, 0, 0, 0, 1, 1,
-0.07905558, -0.1548339, -3.401845, 0, 0, 0, 1, 1,
-0.07794766, 0.2011812, -1.650583, 0, 0, 0, 1, 1,
-0.07490414, 0.1338667, -3.22353, 1, 1, 1, 1, 1,
-0.0670195, 0.7247043, 0.9266562, 1, 1, 1, 1, 1,
-0.0626756, 0.8564116, 0.8664052, 1, 1, 1, 1, 1,
-0.06117113, 0.4375969, -1.189399, 1, 1, 1, 1, 1,
-0.06087859, -1.280024, -2.349509, 1, 1, 1, 1, 1,
-0.0596704, 0.04556327, -0.295081, 1, 1, 1, 1, 1,
-0.05840031, -0.03455471, -3.053044, 1, 1, 1, 1, 1,
-0.0570951, 0.2130812, 2.467367, 1, 1, 1, 1, 1,
-0.05431267, 0.2754968, -1.03604, 1, 1, 1, 1, 1,
-0.04957793, 0.8408815, -0.5745339, 1, 1, 1, 1, 1,
-0.04807214, 1.854114, -0.3166914, 1, 1, 1, 1, 1,
-0.04789823, 0.1395993, -3.149909, 1, 1, 1, 1, 1,
-0.0478791, 1.469931, -1.939085, 1, 1, 1, 1, 1,
-0.04530929, -1.282779, -3.717781, 1, 1, 1, 1, 1,
-0.04509934, 1.435813, 0.5269298, 1, 1, 1, 1, 1,
-0.04484642, 0.1954257, -0.1717176, 0, 0, 1, 1, 1,
-0.03415582, 0.7826262, -0.155319, 1, 0, 0, 1, 1,
-0.02677503, -1.655112, -5.526654, 1, 0, 0, 1, 1,
-0.02325713, -0.9200475, -2.892222, 1, 0, 0, 1, 1,
-0.02289802, 1.213688, 0.1029019, 1, 0, 0, 1, 1,
-0.01922128, 0.327854, -0.1718095, 1, 0, 0, 1, 1,
-0.01580727, -0.2725419, -3.747477, 0, 0, 0, 1, 1,
-0.01519587, -0.3823996, -3.5812, 0, 0, 0, 1, 1,
-0.01460066, 1.02785, 1.216, 0, 0, 0, 1, 1,
-0.0109053, 0.3865068, -2.237052, 0, 0, 0, 1, 1,
-0.01054477, 0.04875842, -2.640829, 0, 0, 0, 1, 1,
-0.008043646, 0.6686692, -0.2880753, 0, 0, 0, 1, 1,
-0.0061848, 1.361633, 0.6183974, 0, 0, 0, 1, 1,
-0.0001888147, 0.7907059, -0.363676, 1, 1, 1, 1, 1,
0.002161942, 0.5693156, 0.8059975, 1, 1, 1, 1, 1,
0.003029557, 1.477757, -0.1439398, 1, 1, 1, 1, 1,
0.003435003, -0.6238531, 3.262119, 1, 1, 1, 1, 1,
0.003600858, 0.2757564, -0.8391147, 1, 1, 1, 1, 1,
0.007628903, -0.04096111, 2.453729, 1, 1, 1, 1, 1,
0.01014968, 0.9506219, 2.18485, 1, 1, 1, 1, 1,
0.01205632, 0.1610868, 1.225188, 1, 1, 1, 1, 1,
0.0173842, -0.1466492, 2.398753, 1, 1, 1, 1, 1,
0.01898895, 0.2135515, -0.6182274, 1, 1, 1, 1, 1,
0.01978869, -0.8119078, 2.595314, 1, 1, 1, 1, 1,
0.02412304, -0.2736075, 1.70948, 1, 1, 1, 1, 1,
0.02918738, -0.9247641, 3.398795, 1, 1, 1, 1, 1,
0.03408262, -1.638176, 4.720242, 1, 1, 1, 1, 1,
0.04043487, 0.909532, -0.9542168, 1, 1, 1, 1, 1,
0.04308906, 0.7908159, 0.4070984, 0, 0, 1, 1, 1,
0.04411935, 2.111834, 0.9383605, 1, 0, 0, 1, 1,
0.04604658, 0.06324847, 1.820083, 1, 0, 0, 1, 1,
0.04999825, 1.836896, 0.5222332, 1, 0, 0, 1, 1,
0.0510134, -0.182632, 3.438368, 1, 0, 0, 1, 1,
0.05138231, 0.3526355, 2.149261, 1, 0, 0, 1, 1,
0.0572709, -0.6656494, 2.938975, 0, 0, 0, 1, 1,
0.06360731, 0.9787335, 0.1845897, 0, 0, 0, 1, 1,
0.06479195, -0.2255046, 4.56855, 0, 0, 0, 1, 1,
0.0659052, -2.37554, 3.414071, 0, 0, 0, 1, 1,
0.06659697, -1.060238, 4.168085, 0, 0, 0, 1, 1,
0.06744178, -1.352776, 4.098491, 0, 0, 0, 1, 1,
0.06799934, 1.255243, 1.418966, 0, 0, 0, 1, 1,
0.07057619, 1.062789, -0.464122, 1, 1, 1, 1, 1,
0.07083218, -0.1708931, 2.610389, 1, 1, 1, 1, 1,
0.07238343, 1.404175, 1.552601, 1, 1, 1, 1, 1,
0.07316534, -0.2579083, 2.791086, 1, 1, 1, 1, 1,
0.0732808, -0.2483076, 2.827707, 1, 1, 1, 1, 1,
0.08574799, 2.094129, -1.468977, 1, 1, 1, 1, 1,
0.08873129, -0.1762328, 3.683927, 1, 1, 1, 1, 1,
0.0889791, -0.09198585, 2.926937, 1, 1, 1, 1, 1,
0.08955834, 0.09777533, 1.050249, 1, 1, 1, 1, 1,
0.09163909, -0.06791754, 3.663372, 1, 1, 1, 1, 1,
0.09416484, -1.402909, 4.255332, 1, 1, 1, 1, 1,
0.09542668, -0.2922094, 3.514226, 1, 1, 1, 1, 1,
0.09900313, 0.3142938, -0.6073428, 1, 1, 1, 1, 1,
0.101887, 1.643077, 1.707973, 1, 1, 1, 1, 1,
0.106541, 1.363262, -1.015256, 1, 1, 1, 1, 1,
0.1163992, -2.773149, 1.483232, 0, 0, 1, 1, 1,
0.1224043, -0.1875675, 1.75945, 1, 0, 0, 1, 1,
0.1260159, 0.3230701, -0.2190943, 1, 0, 0, 1, 1,
0.1263961, -2.015032, 3.589576, 1, 0, 0, 1, 1,
0.1305417, -1.270629, 3.821708, 1, 0, 0, 1, 1,
0.13232, -0.136502, 2.174764, 1, 0, 0, 1, 1,
0.1328072, 0.2299753, 0.5267158, 0, 0, 0, 1, 1,
0.1335114, 0.6784237, 1.010575, 0, 0, 0, 1, 1,
0.1351829, -0.8297151, 3.365253, 0, 0, 0, 1, 1,
0.1372488, 0.1160686, -1.646122, 0, 0, 0, 1, 1,
0.139407, 0.1023152, 0.7442093, 0, 0, 0, 1, 1,
0.1410649, 0.3136497, -1.07592, 0, 0, 0, 1, 1,
0.1429501, -0.2857716, 3.428246, 0, 0, 0, 1, 1,
0.1505405, 0.06749972, 0.9473379, 1, 1, 1, 1, 1,
0.1524702, -0.5309509, 2.922651, 1, 1, 1, 1, 1,
0.1529462, 0.0628875, 0.0009178003, 1, 1, 1, 1, 1,
0.1557647, -0.1471989, 2.868784, 1, 1, 1, 1, 1,
0.1573177, -1.509125, 3.39254, 1, 1, 1, 1, 1,
0.1615302, 0.6494619, 0.9011019, 1, 1, 1, 1, 1,
0.1620072, -1.05448, 3.223612, 1, 1, 1, 1, 1,
0.1623569, -1.47147, 4.853971, 1, 1, 1, 1, 1,
0.1623703, -0.4533183, 3.189164, 1, 1, 1, 1, 1,
0.1636285, 0.3378241, 1.342345, 1, 1, 1, 1, 1,
0.1652244, 0.7806864, -0.4200605, 1, 1, 1, 1, 1,
0.1657049, 0.8346817, 0.2408888, 1, 1, 1, 1, 1,
0.1712895, -0.6886537, 2.305283, 1, 1, 1, 1, 1,
0.174304, 0.4363823, -0.2768499, 1, 1, 1, 1, 1,
0.1799504, 0.9193712, 0.04478212, 1, 1, 1, 1, 1,
0.1821591, -1.098557, 1.840593, 0, 0, 1, 1, 1,
0.1844449, 0.4353216, -0.1744491, 1, 0, 0, 1, 1,
0.1847284, 0.8224061, 1.399982, 1, 0, 0, 1, 1,
0.1869335, 0.3883878, 0.6649957, 1, 0, 0, 1, 1,
0.1888312, 1.254152, 0.04473959, 1, 0, 0, 1, 1,
0.1926863, -1.58908, 3.286369, 1, 0, 0, 1, 1,
0.1963617, -0.5074795, 2.245561, 0, 0, 0, 1, 1,
0.1966871, -1.296502, 2.64471, 0, 0, 0, 1, 1,
0.1986268, -1.540516, 2.645074, 0, 0, 0, 1, 1,
0.2022505, 1.503771, -1.556757, 0, 0, 0, 1, 1,
0.2049669, -0.1023602, 1.07642, 0, 0, 0, 1, 1,
0.2066648, 1.415033, 0.1191423, 0, 0, 0, 1, 1,
0.2066655, 0.4033725, -0.6564612, 0, 0, 0, 1, 1,
0.2073239, -1.412352, 4.121329, 1, 1, 1, 1, 1,
0.220012, 1.783482, -1.838369, 1, 1, 1, 1, 1,
0.2218674, 0.5385462, -1.320137, 1, 1, 1, 1, 1,
0.2221622, -0.6015253, 3.706527, 1, 1, 1, 1, 1,
0.2229618, -0.3265464, 5.117625, 1, 1, 1, 1, 1,
0.2241111, -1.641776, 2.829125, 1, 1, 1, 1, 1,
0.2262104, 0.9411257, -0.6551608, 1, 1, 1, 1, 1,
0.2308319, 0.7339088, -0.282134, 1, 1, 1, 1, 1,
0.2334578, -0.455249, 2.686719, 1, 1, 1, 1, 1,
0.2344614, -0.1271791, 1.654129, 1, 1, 1, 1, 1,
0.2407183, 2.446503, 0.3335843, 1, 1, 1, 1, 1,
0.2435927, -1.748197, 3.524186, 1, 1, 1, 1, 1,
0.2446734, 0.5232888, 2.245622, 1, 1, 1, 1, 1,
0.2459645, 0.3178813, -0.7206711, 1, 1, 1, 1, 1,
0.2460482, -0.752489, 3.042975, 1, 1, 1, 1, 1,
0.2493066, -0.5372924, 3.947455, 0, 0, 1, 1, 1,
0.2525572, -2.232675, 4.005872, 1, 0, 0, 1, 1,
0.2536706, -2.234291, 4.852852, 1, 0, 0, 1, 1,
0.2552272, 0.5594432, -1.396633, 1, 0, 0, 1, 1,
0.2631248, -0.5209197, 4.295347, 1, 0, 0, 1, 1,
0.2679446, -0.4814738, 3.475607, 1, 0, 0, 1, 1,
0.2693641, 0.2659004, -0.0262488, 0, 0, 0, 1, 1,
0.2695101, 1.184412, 0.2950689, 0, 0, 0, 1, 1,
0.2706436, -0.04472611, 1.096702, 0, 0, 0, 1, 1,
0.2720149, -0.9104775, 3.704979, 0, 0, 0, 1, 1,
0.2787627, -0.9217454, 2.477705, 0, 0, 0, 1, 1,
0.2790311, -0.02399733, 1.011345, 0, 0, 0, 1, 1,
0.2797222, 0.207141, 0.2748805, 0, 0, 0, 1, 1,
0.2811055, 1.437868, 0.7784222, 1, 1, 1, 1, 1,
0.2835267, -1.178892, 4.037704, 1, 1, 1, 1, 1,
0.2854624, -0.2171825, 2.666697, 1, 1, 1, 1, 1,
0.2861531, 0.3996193, 1.567638, 1, 1, 1, 1, 1,
0.2862436, -0.9506858, 3.928543, 1, 1, 1, 1, 1,
0.2891543, -0.8384868, 1.213154, 1, 1, 1, 1, 1,
0.2898171, -1.268765, 2.483775, 1, 1, 1, 1, 1,
0.2909836, -0.04707579, 0.2093988, 1, 1, 1, 1, 1,
0.2936111, -1.27029, 2.008194, 1, 1, 1, 1, 1,
0.29722, -0.000217982, 2.410279, 1, 1, 1, 1, 1,
0.2988807, 1.84009, 1.751736, 1, 1, 1, 1, 1,
0.3038121, 0.3511214, 1.946607, 1, 1, 1, 1, 1,
0.304417, -1.480504, 3.448064, 1, 1, 1, 1, 1,
0.3047538, -0.3455341, 2.940225, 1, 1, 1, 1, 1,
0.3060707, -2.569301, 3.462069, 1, 1, 1, 1, 1,
0.3066761, -0.1698162, 2.661311, 0, 0, 1, 1, 1,
0.3070706, -0.7422993, 4.347996, 1, 0, 0, 1, 1,
0.3089231, 0.2709525, -1.407416, 1, 0, 0, 1, 1,
0.31051, -0.9889506, 2.163764, 1, 0, 0, 1, 1,
0.3139727, 1.593427, 1.378274, 1, 0, 0, 1, 1,
0.3144611, -1.220809, 3.081348, 1, 0, 0, 1, 1,
0.3186539, 1.508641, 0.662134, 0, 0, 0, 1, 1,
0.319272, 0.7742612, 0.4050523, 0, 0, 0, 1, 1,
0.319655, -1.376847, 2.684521, 0, 0, 0, 1, 1,
0.3215173, -1.965553, 2.024149, 0, 0, 0, 1, 1,
0.3217701, -0.6948133, 1.969895, 0, 0, 0, 1, 1,
0.3236982, -1.871372, 3.613783, 0, 0, 0, 1, 1,
0.326418, -1.048129, 3.539625, 0, 0, 0, 1, 1,
0.3280306, -0.6019728, 2.87673, 1, 1, 1, 1, 1,
0.3296347, -1.82635, 2.037235, 1, 1, 1, 1, 1,
0.344236, 0.8350291, 0.8694495, 1, 1, 1, 1, 1,
0.3497554, 0.454107, 1.009165, 1, 1, 1, 1, 1,
0.3502213, 0.6863758, 1.239621, 1, 1, 1, 1, 1,
0.3511904, -1.431529, 5.98715, 1, 1, 1, 1, 1,
0.3539589, 0.6052179, 0.04843871, 1, 1, 1, 1, 1,
0.3557947, -2.023261, 3.392433, 1, 1, 1, 1, 1,
0.3562652, 0.1388033, -0.08919959, 1, 1, 1, 1, 1,
0.3564666, 0.08461779, 1.612357, 1, 1, 1, 1, 1,
0.3606379, 0.6358443, 0.4335167, 1, 1, 1, 1, 1,
0.3655102, -0.8129222, 2.660879, 1, 1, 1, 1, 1,
0.3681725, 0.1937484, 2.806365, 1, 1, 1, 1, 1,
0.3711458, -0.8033074, 3.510966, 1, 1, 1, 1, 1,
0.373377, 1.783337, -0.3338319, 1, 1, 1, 1, 1,
0.3766179, -1.380335, 3.227261, 0, 0, 1, 1, 1,
0.3767625, -0.06685402, 0.353406, 1, 0, 0, 1, 1,
0.3773506, 0.1705954, 0.6670499, 1, 0, 0, 1, 1,
0.3775638, -0.7800822, 2.462374, 1, 0, 0, 1, 1,
0.3779077, -0.4910308, 0.3205501, 1, 0, 0, 1, 1,
0.3782897, 1.471593, 0.04728881, 1, 0, 0, 1, 1,
0.378344, 0.3575059, 1.291833, 0, 0, 0, 1, 1,
0.3790266, 0.325067, 1.463584, 0, 0, 0, 1, 1,
0.382473, -0.473102, 1.754296, 0, 0, 0, 1, 1,
0.3899041, 0.2905256, 0.558912, 0, 0, 0, 1, 1,
0.3968355, 0.09446196, 1.384073, 0, 0, 0, 1, 1,
0.397294, 0.5652441, -0.658093, 0, 0, 0, 1, 1,
0.3984999, -0.9995859, 3.201073, 0, 0, 0, 1, 1,
0.4035447, 0.9384102, 0.005676403, 1, 1, 1, 1, 1,
0.411092, -0.5269349, 1.520742, 1, 1, 1, 1, 1,
0.4113551, 1.809834, 0.1400225, 1, 1, 1, 1, 1,
0.4126344, 0.6275992, 1.100741, 1, 1, 1, 1, 1,
0.4126638, 0.2423611, 0.4131161, 1, 1, 1, 1, 1,
0.4128138, -2.217655, 1.757499, 1, 1, 1, 1, 1,
0.4149015, -0.6404387, 2.919381, 1, 1, 1, 1, 1,
0.41725, 0.137031, 2.45026, 1, 1, 1, 1, 1,
0.4187308, -0.8981203, 3.753187, 1, 1, 1, 1, 1,
0.4260668, -2.107606, 2.761618, 1, 1, 1, 1, 1,
0.4269208, 0.9223035, 0.8065376, 1, 1, 1, 1, 1,
0.4300988, -0.8544147, 2.50857, 1, 1, 1, 1, 1,
0.4305664, 0.5194464, 0.3979418, 1, 1, 1, 1, 1,
0.4344893, 1.418989, -2.552042, 1, 1, 1, 1, 1,
0.4361028, -1.617229, 2.053302, 1, 1, 1, 1, 1,
0.4369971, 0.5669604, 0.6298136, 0, 0, 1, 1, 1,
0.4386862, 0.05596356, 1.00389, 1, 0, 0, 1, 1,
0.439947, 1.52272, 0.2517982, 1, 0, 0, 1, 1,
0.4400336, -1.223515, 2.758406, 1, 0, 0, 1, 1,
0.4433034, -0.7172707, 2.917233, 1, 0, 0, 1, 1,
0.4500835, -0.08637138, 3.900631, 1, 0, 0, 1, 1,
0.4523695, 1.596623, 1.080165, 0, 0, 0, 1, 1,
0.4540083, 1.254241, 0.4520788, 0, 0, 0, 1, 1,
0.4564723, -1.351714, 1.472933, 0, 0, 0, 1, 1,
0.4570184, 1.089731, 0.3820594, 0, 0, 0, 1, 1,
0.4582263, 0.1829529, 0.2901331, 0, 0, 0, 1, 1,
0.4585006, -0.7877869, 3.014028, 0, 0, 0, 1, 1,
0.4585217, 0.4806045, 0.5983982, 0, 0, 0, 1, 1,
0.4590362, 1.883037, 1.732965, 1, 1, 1, 1, 1,
0.4648566, -0.4747031, 1.915228, 1, 1, 1, 1, 1,
0.4657856, 0.822026, -0.1208885, 1, 1, 1, 1, 1,
0.4687854, -0.2066863, 1.131738, 1, 1, 1, 1, 1,
0.4689046, -1.167935, 3.642026, 1, 1, 1, 1, 1,
0.4696624, -1.527566, 2.528424, 1, 1, 1, 1, 1,
0.4718026, 0.004739686, 1.64425, 1, 1, 1, 1, 1,
0.475126, -1.805105, 2.538834, 1, 1, 1, 1, 1,
0.4800611, 0.05618189, -0.1679, 1, 1, 1, 1, 1,
0.4822218, 2.121896, -0.04994412, 1, 1, 1, 1, 1,
0.4830944, 0.4812614, 1.832634, 1, 1, 1, 1, 1,
0.4859515, 1.494811, 1.06311, 1, 1, 1, 1, 1,
0.4892117, -0.7636096, 3.973037, 1, 1, 1, 1, 1,
0.4905596, -1.708464, 3.130299, 1, 1, 1, 1, 1,
0.4929725, 0.6671942, -0.4517365, 1, 1, 1, 1, 1,
0.4950513, 1.877229, 1.304788, 0, 0, 1, 1, 1,
0.5023412, -1.440676, 2.592916, 1, 0, 0, 1, 1,
0.5024317, -0.1393493, 1.177932, 1, 0, 0, 1, 1,
0.5050946, -1.209898, 1.765018, 1, 0, 0, 1, 1,
0.5113719, -0.3371527, 2.833467, 1, 0, 0, 1, 1,
0.5164084, -1.301506, 2.701477, 1, 0, 0, 1, 1,
0.5187361, 1.600577, 1.308479, 0, 0, 0, 1, 1,
0.520685, 0.3116431, 0.08394347, 0, 0, 0, 1, 1,
0.5266094, -1.811291, 5.188999, 0, 0, 0, 1, 1,
0.5267261, 1.171831, -0.8850684, 0, 0, 0, 1, 1,
0.5277469, 0.08242868, 0.3188513, 0, 0, 0, 1, 1,
0.5291653, 2.493261, 0.3402831, 0, 0, 0, 1, 1,
0.5297896, -0.5742661, 1.348726, 0, 0, 0, 1, 1,
0.5316236, 1.245841, 0.2934852, 1, 1, 1, 1, 1,
0.5318018, -0.9560632, 2.809252, 1, 1, 1, 1, 1,
0.5384825, -0.2590064, 1.857167, 1, 1, 1, 1, 1,
0.54184, -1.805182, 2.114594, 1, 1, 1, 1, 1,
0.5442303, 0.4849672, 0.6750191, 1, 1, 1, 1, 1,
0.5450995, 1.036128, 0.2263743, 1, 1, 1, 1, 1,
0.5453833, 0.5177596, 1.355949, 1, 1, 1, 1, 1,
0.5515869, -0.9551321, 2.012199, 1, 1, 1, 1, 1,
0.5541086, 1.184894, 0.003957057, 1, 1, 1, 1, 1,
0.5666391, 0.01490318, -0.1692055, 1, 1, 1, 1, 1,
0.5683605, -1.186965, 2.966384, 1, 1, 1, 1, 1,
0.5704612, -0.2636847, 0.6804397, 1, 1, 1, 1, 1,
0.571708, -0.4736713, 2.957973, 1, 1, 1, 1, 1,
0.5757097, -0.5550641, 2.337156, 1, 1, 1, 1, 1,
0.5809273, -0.2777871, 2.631402, 1, 1, 1, 1, 1,
0.5830217, -1.963087, 2.17239, 0, 0, 1, 1, 1,
0.5886442, -0.7463822, 1.466232, 1, 0, 0, 1, 1,
0.5894365, 1.267212, 1.230632, 1, 0, 0, 1, 1,
0.5913495, 0.02893275, 1.882006, 1, 0, 0, 1, 1,
0.5925508, 1.160719, -0.1815521, 1, 0, 0, 1, 1,
0.5956988, 1.145546, 2.548107, 1, 0, 0, 1, 1,
0.5965145, -0.2149015, 3.158015, 0, 0, 0, 1, 1,
0.5982064, 0.03411645, 1.699194, 0, 0, 0, 1, 1,
0.598321, -0.1427468, 3.121335, 0, 0, 0, 1, 1,
0.6020281, 0.4766445, 1.344874, 0, 0, 0, 1, 1,
0.6021649, -0.01249424, 2.246878, 0, 0, 0, 1, 1,
0.6071668, 0.6902307, 1.721241, 0, 0, 0, 1, 1,
0.6125054, 2.457751, 0.2464951, 0, 0, 0, 1, 1,
0.6160287, -1.133329, 1.834136, 1, 1, 1, 1, 1,
0.6192136, 2.341249, -0.4552633, 1, 1, 1, 1, 1,
0.6196697, -0.4043031, 2.628539, 1, 1, 1, 1, 1,
0.6207631, -0.2515464, 0.3792495, 1, 1, 1, 1, 1,
0.6282288, 0.09265422, 1.637198, 1, 1, 1, 1, 1,
0.6283227, 0.5862865, -0.03769174, 1, 1, 1, 1, 1,
0.6312127, -1.037264, 3.406458, 1, 1, 1, 1, 1,
0.6330929, -0.03692076, -0.1158963, 1, 1, 1, 1, 1,
0.6334955, 0.4589244, -1.499555, 1, 1, 1, 1, 1,
0.6335983, 1.778493, 1.637146, 1, 1, 1, 1, 1,
0.6369579, 0.1194755, 2.875724, 1, 1, 1, 1, 1,
0.638351, -1.731956, 1.436189, 1, 1, 1, 1, 1,
0.6390691, 0.183652, 0.3839762, 1, 1, 1, 1, 1,
0.6393095, 0.9243174, -0.4526573, 1, 1, 1, 1, 1,
0.6414099, 0.3930901, 1.630008, 1, 1, 1, 1, 1,
0.6423962, -0.03204964, 3.134956, 0, 0, 1, 1, 1,
0.6427944, 2.102451, -0.1167684, 1, 0, 0, 1, 1,
0.6435258, -0.07119952, 1.604762, 1, 0, 0, 1, 1,
0.6440944, -0.3794217, 2.200686, 1, 0, 0, 1, 1,
0.6485566, -0.2262541, 2.666547, 1, 0, 0, 1, 1,
0.6490463, 0.3557758, 0.7991743, 1, 0, 0, 1, 1,
0.6492355, 1.209248, 1.62662, 0, 0, 0, 1, 1,
0.6504484, 0.7939175, 0.9346546, 0, 0, 0, 1, 1,
0.6516407, -0.01876009, 1.423485, 0, 0, 0, 1, 1,
0.6542617, 0.2791159, 3.211615, 0, 0, 0, 1, 1,
0.6592344, -0.5391229, 1.072135, 0, 0, 0, 1, 1,
0.6630657, 0.4782004, 2.322979, 0, 0, 0, 1, 1,
0.6679412, 0.05762594, 2.028283, 0, 0, 0, 1, 1,
0.6691051, 0.5743692, 0.3181693, 1, 1, 1, 1, 1,
0.6695703, -0.1420668, 3.043152, 1, 1, 1, 1, 1,
0.6711618, 0.04315748, 3.128106, 1, 1, 1, 1, 1,
0.6798518, 0.5540587, 2.132399, 1, 1, 1, 1, 1,
0.6850722, 0.3208115, 1.178734, 1, 1, 1, 1, 1,
0.6879062, 1.724216, 1.003892, 1, 1, 1, 1, 1,
0.6902356, -0.2982879, -0.1920228, 1, 1, 1, 1, 1,
0.692306, 1.468431, 0.7605286, 1, 1, 1, 1, 1,
0.6976816, -0.2196735, 1.474895, 1, 1, 1, 1, 1,
0.7001501, -0.3059717, -1.408141, 1, 1, 1, 1, 1,
0.7042778, -0.9129847, 3.767229, 1, 1, 1, 1, 1,
0.7050251, -0.5371838, 2.430018, 1, 1, 1, 1, 1,
0.7059608, 0.1646749, 0.8741229, 1, 1, 1, 1, 1,
0.7104232, -1.220318, 3.104293, 1, 1, 1, 1, 1,
0.7117692, 1.060223, -0.484304, 1, 1, 1, 1, 1,
0.7154644, -0.7562242, 3.177452, 0, 0, 1, 1, 1,
0.7159596, 0.5626125, 2.108285, 1, 0, 0, 1, 1,
0.7178619, 0.2009265, 1.464362, 1, 0, 0, 1, 1,
0.7356278, -1.330603, 2.896171, 1, 0, 0, 1, 1,
0.7366636, -1.28688, 3.034081, 1, 0, 0, 1, 1,
0.7378218, -1.590473, 1.850081, 1, 0, 0, 1, 1,
0.7381883, 2.128057, 0.5960358, 0, 0, 0, 1, 1,
0.7421293, -0.7663375, 2.074124, 0, 0, 0, 1, 1,
0.7491502, 0.7846195, 2.182048, 0, 0, 0, 1, 1,
0.7530108, -0.2492393, 0.1138076, 0, 0, 0, 1, 1,
0.7549019, 0.2957267, 1.643393, 0, 0, 0, 1, 1,
0.7550889, -0.9168081, 2.093294, 0, 0, 0, 1, 1,
0.7559722, -0.3102323, 3.179526, 0, 0, 0, 1, 1,
0.7560833, 0.9812552, 2.205707, 1, 1, 1, 1, 1,
0.7594162, 0.6504117, 1.014212, 1, 1, 1, 1, 1,
0.7643171, 0.7277224, 0.2448474, 1, 1, 1, 1, 1,
0.7746719, 1.923573, 0.05957789, 1, 1, 1, 1, 1,
0.7815208, -0.2351556, 3.609197, 1, 1, 1, 1, 1,
0.7817997, 0.3276596, 2.574223, 1, 1, 1, 1, 1,
0.7822778, 2.014942, 0.2723299, 1, 1, 1, 1, 1,
0.7836141, 0.1391355, -0.4719236, 1, 1, 1, 1, 1,
0.7920416, -0.01663767, 1.895677, 1, 1, 1, 1, 1,
0.7929861, -0.5055126, 3.687465, 1, 1, 1, 1, 1,
0.7938883, 2.301149, 0.9390818, 1, 1, 1, 1, 1,
0.7955784, -0.7669389, 3.443498, 1, 1, 1, 1, 1,
0.7985707, -1.112423, 2.13319, 1, 1, 1, 1, 1,
0.8019233, 1.550353, 0.8445107, 1, 1, 1, 1, 1,
0.8048084, 0.724007, 2.197627, 1, 1, 1, 1, 1,
0.8270798, 0.3237606, 2.295483, 0, 0, 1, 1, 1,
0.827628, 1.789803, -0.5671592, 1, 0, 0, 1, 1,
0.8309791, 0.475021, 1.249315, 1, 0, 0, 1, 1,
0.8311559, -0.8468955, 0.4455464, 1, 0, 0, 1, 1,
0.8351582, -0.5585628, 6.144857, 1, 0, 0, 1, 1,
0.8392397, 1.17706, 3.431402, 1, 0, 0, 1, 1,
0.8414195, 0.7881803, 0.04509576, 0, 0, 0, 1, 1,
0.8445294, 0.09906574, -0.4112832, 0, 0, 0, 1, 1,
0.8453405, 1.03871, 1.977142, 0, 0, 0, 1, 1,
0.8484879, -0.6800259, 1.007513, 0, 0, 0, 1, 1,
0.8509041, 1.013063, 1.785106, 0, 0, 0, 1, 1,
0.8531635, -0.05124182, 2.011452, 0, 0, 0, 1, 1,
0.853924, 1.548562, -0.5798601, 0, 0, 0, 1, 1,
0.8577046, -0.1035415, 0.3366602, 1, 1, 1, 1, 1,
0.8614803, -0.4506356, 2.212127, 1, 1, 1, 1, 1,
0.8661762, -1.503617, 2.276834, 1, 1, 1, 1, 1,
0.8694775, -2.378379, 3.008523, 1, 1, 1, 1, 1,
0.8764699, -1.824595, 3.878115, 1, 1, 1, 1, 1,
0.8779169, -0.4766842, 4.337751, 1, 1, 1, 1, 1,
0.8797721, 2.094714, -1.913301, 1, 1, 1, 1, 1,
0.8799453, -1.844493, 0.5921782, 1, 1, 1, 1, 1,
0.883005, 1.372126, 0.9022927, 1, 1, 1, 1, 1,
0.8847585, 0.9982257, 0.1473366, 1, 1, 1, 1, 1,
0.8956253, 0.5236235, 0.6030778, 1, 1, 1, 1, 1,
0.9004396, 0.5036501, 0.8915347, 1, 1, 1, 1, 1,
0.906758, 0.2789254, 1.472828, 1, 1, 1, 1, 1,
0.9068335, -1.847327, 4.60229, 1, 1, 1, 1, 1,
0.9070388, 1.424351, 1.073145, 1, 1, 1, 1, 1,
0.9076101, 0.412209, 0.6374, 0, 0, 1, 1, 1,
0.9094694, -1.339414, 1.902682, 1, 0, 0, 1, 1,
0.9199823, -0.46947, 1.462658, 1, 0, 0, 1, 1,
0.9230088, 0.974079, 1.465206, 1, 0, 0, 1, 1,
0.9243311, -0.6467907, 1.594499, 1, 0, 0, 1, 1,
0.9296055, 1.936108, 0.6738586, 1, 0, 0, 1, 1,
0.9344932, 0.3756309, 0.2465292, 0, 0, 0, 1, 1,
0.9358621, 1.618896, 1.738524, 0, 0, 0, 1, 1,
0.9367957, -0.3360849, 0.6568661, 0, 0, 0, 1, 1,
0.9428391, 1.260268, 0.4833448, 0, 0, 0, 1, 1,
0.945499, 0.03754369, 1.461224, 0, 0, 0, 1, 1,
0.9467449, 1.160551, -0.02871517, 0, 0, 0, 1, 1,
0.9545971, 0.5411052, -0.09581947, 0, 0, 0, 1, 1,
0.9606051, -0.5924339, 1.534326, 1, 1, 1, 1, 1,
0.9615842, 0.1428993, -0.7829607, 1, 1, 1, 1, 1,
0.9641769, -0.5982686, 2.2407, 1, 1, 1, 1, 1,
0.9660721, 1.242951, 0.3873637, 1, 1, 1, 1, 1,
0.966124, 0.1621607, 1.993071, 1, 1, 1, 1, 1,
0.9678747, 1.304292, 1.084137, 1, 1, 1, 1, 1,
0.9806266, -0.2118264, 1.946534, 1, 1, 1, 1, 1,
0.9832348, -1.511535, 1.561304, 1, 1, 1, 1, 1,
0.9870002, 2.438286, 2.218572, 1, 1, 1, 1, 1,
0.9874194, 1.898848, -0.4815624, 1, 1, 1, 1, 1,
0.9883541, -0.9694872, 1.198099, 1, 1, 1, 1, 1,
0.9917848, 1.486861, -0.5444776, 1, 1, 1, 1, 1,
0.9950981, 0.4190085, 0.6097215, 1, 1, 1, 1, 1,
0.9971861, -0.9934242, 2.17048, 1, 1, 1, 1, 1,
0.9975967, -0.6134195, 1.703846, 1, 1, 1, 1, 1,
0.9987302, 0.313242, 1.844831, 0, 0, 1, 1, 1,
1.000967, -0.5315399, 3.409968, 1, 0, 0, 1, 1,
1.004353, -0.2664193, 2.539882, 1, 0, 0, 1, 1,
1.007719, 0.5635893, 2.084334, 1, 0, 0, 1, 1,
1.009119, -1.145871, 1.539793, 1, 0, 0, 1, 1,
1.012915, -1.243085, 2.692888, 1, 0, 0, 1, 1,
1.019183, 0.2085608, 1.234588, 0, 0, 0, 1, 1,
1.029226, 0.503297, 0.2072496, 0, 0, 0, 1, 1,
1.050342, 1.001095, 0.399657, 0, 0, 0, 1, 1,
1.051711, 0.5482832, 0.349782, 0, 0, 0, 1, 1,
1.058729, 0.2691204, -0.4653581, 0, 0, 0, 1, 1,
1.060972, -0.3764411, 1.090975, 0, 0, 0, 1, 1,
1.062914, -0.8034845, 1.70465, 0, 0, 0, 1, 1,
1.074603, -1.127292, 3.197191, 1, 1, 1, 1, 1,
1.087097, -0.7187459, 1.601583, 1, 1, 1, 1, 1,
1.092548, -1.374485, 2.18676, 1, 1, 1, 1, 1,
1.094556, -0.384158, 1.803046, 1, 1, 1, 1, 1,
1.098419, -1.086354, 0.8772576, 1, 1, 1, 1, 1,
1.105388, -1.428214, 1.654863, 1, 1, 1, 1, 1,
1.105989, -1.144495, 1.411272, 1, 1, 1, 1, 1,
1.107239, -0.6079013, 1.460963, 1, 1, 1, 1, 1,
1.11575, 1.107707, 1.922421, 1, 1, 1, 1, 1,
1.123888, 0.100894, 2.077927, 1, 1, 1, 1, 1,
1.126156, -0.133649, 1.208983, 1, 1, 1, 1, 1,
1.130834, 0.9495198, 1.060684, 1, 1, 1, 1, 1,
1.134384, 0.8731827, 0.7050618, 1, 1, 1, 1, 1,
1.135273, 1.659123, 1.089424, 1, 1, 1, 1, 1,
1.136357, -0.8797238, 1.472061, 1, 1, 1, 1, 1,
1.153177, 0.5784423, 1.546768, 0, 0, 1, 1, 1,
1.15785, -0.705272, 2.511498, 1, 0, 0, 1, 1,
1.167017, 1.304979, -0.00489592, 1, 0, 0, 1, 1,
1.176311, 1.664389, 0.4307727, 1, 0, 0, 1, 1,
1.17774, 1.027272, 0.06689348, 1, 0, 0, 1, 1,
1.180499, 1.132807, 1.659447, 1, 0, 0, 1, 1,
1.185065, 0.4471644, -0.1158871, 0, 0, 0, 1, 1,
1.200654, -0.534842, 2.630348, 0, 0, 0, 1, 1,
1.204315, 0.8982266, 0.2879101, 0, 0, 0, 1, 1,
1.210702, 1.737261, 1.416773, 0, 0, 0, 1, 1,
1.2112, -1.35091, 3.322123, 0, 0, 0, 1, 1,
1.228761, 1.972007, 0.3925604, 0, 0, 0, 1, 1,
1.229738, -1.224808, 2.598003, 0, 0, 0, 1, 1,
1.238312, 0.6257449, 2.27239, 1, 1, 1, 1, 1,
1.238925, -0.4274549, 0.4810923, 1, 1, 1, 1, 1,
1.251793, -0.7240493, 2.032897, 1, 1, 1, 1, 1,
1.256117, 0.7322093, -0.7874416, 1, 1, 1, 1, 1,
1.260232, -2.981332, 2.56011, 1, 1, 1, 1, 1,
1.268878, 0.2807601, 1.270212, 1, 1, 1, 1, 1,
1.273568, -0.4749849, 0.9827211, 1, 1, 1, 1, 1,
1.282112, 0.7502666, 0.5643155, 1, 1, 1, 1, 1,
1.283536, 1.291127, 2.304925, 1, 1, 1, 1, 1,
1.284079, 0.8528624, 1.070148, 1, 1, 1, 1, 1,
1.285475, 0.8669299, 0.3412117, 1, 1, 1, 1, 1,
1.28851, -0.7096878, 3.480626, 1, 1, 1, 1, 1,
1.290678, -0.03531373, 3.024399, 1, 1, 1, 1, 1,
1.295326, -0.3767442, 1.542494, 1, 1, 1, 1, 1,
1.297506, 0.2334806, 0.7518483, 1, 1, 1, 1, 1,
1.303333, 0.8998402, 2.229197, 0, 0, 1, 1, 1,
1.304179, 0.213727, 0.2808967, 1, 0, 0, 1, 1,
1.309038, -0.6647223, 3.565008, 1, 0, 0, 1, 1,
1.315118, -0.2553503, 0.06361269, 1, 0, 0, 1, 1,
1.31619, -0.6065168, 2.195209, 1, 0, 0, 1, 1,
1.319188, 1.230834, 1.333546, 1, 0, 0, 1, 1,
1.320831, -0.4076794, 2.015773, 0, 0, 0, 1, 1,
1.334119, -2.485862, 4.644803, 0, 0, 0, 1, 1,
1.345657, 0.2749846, 2.091097, 0, 0, 0, 1, 1,
1.350047, 1.862821, 1.494582, 0, 0, 0, 1, 1,
1.356721, -0.2057082, 1.037956, 0, 0, 0, 1, 1,
1.362928, -0.5742593, 2.328594, 0, 0, 0, 1, 1,
1.363337, 0.4336294, 1.77255, 0, 0, 0, 1, 1,
1.366425, -0.07814641, 1.483295, 1, 1, 1, 1, 1,
1.382517, -1.363466, 1.71144, 1, 1, 1, 1, 1,
1.389382, -1.136896, 1.522591, 1, 1, 1, 1, 1,
1.399673, 0.3738519, 1.051226, 1, 1, 1, 1, 1,
1.402295, -0.2246194, 3.19182, 1, 1, 1, 1, 1,
1.42154, -0.1560457, 1.858022, 1, 1, 1, 1, 1,
1.438764, -0.2495454, 1.280503, 1, 1, 1, 1, 1,
1.445807, 1.174668, 1.260515, 1, 1, 1, 1, 1,
1.462171, -1.084874, 2.972244, 1, 1, 1, 1, 1,
1.462472, 0.7024361, 0.8812973, 1, 1, 1, 1, 1,
1.47584, 0.1277313, 0.128205, 1, 1, 1, 1, 1,
1.4826, 1.326919, 1.339279, 1, 1, 1, 1, 1,
1.486162, 2.087712, 0.4929797, 1, 1, 1, 1, 1,
1.489326, -0.1799866, 1.904065, 1, 1, 1, 1, 1,
1.504463, 0.4878573, 2.230659, 1, 1, 1, 1, 1,
1.509116, -1.634452, 3.907924, 0, 0, 1, 1, 1,
1.512372, 1.321024, 1.079399, 1, 0, 0, 1, 1,
1.523873, 0.4038793, -0.1154472, 1, 0, 0, 1, 1,
1.524082, 2.079899, 0.7119384, 1, 0, 0, 1, 1,
1.535172, 0.5963764, 0.3516003, 1, 0, 0, 1, 1,
1.545442, 1.276298, 1.318653, 1, 0, 0, 1, 1,
1.548607, 0.1500416, 2.181884, 0, 0, 0, 1, 1,
1.562567, 1.002943, 0.4342512, 0, 0, 0, 1, 1,
1.573455, 1.764199, 2.379967, 0, 0, 0, 1, 1,
1.574901, -0.6385992, 1.926558, 0, 0, 0, 1, 1,
1.597286, 0.2573474, 0.9072262, 0, 0, 0, 1, 1,
1.598255, -1.270246, 3.520269, 0, 0, 0, 1, 1,
1.604694, -2.006452, 1.618273, 0, 0, 0, 1, 1,
1.613208, 0.3446028, 0.6860425, 1, 1, 1, 1, 1,
1.617176, -1.418489, 2.07664, 1, 1, 1, 1, 1,
1.623622, 1.182377, 1.112574, 1, 1, 1, 1, 1,
1.629747, 0.9726552, 2.782967, 1, 1, 1, 1, 1,
1.642761, -0.169618, 1.616046, 1, 1, 1, 1, 1,
1.653312, 0.1266021, 1.762283, 1, 1, 1, 1, 1,
1.65852, -1.214503, 1.296874, 1, 1, 1, 1, 1,
1.67881, 0.7924756, -0.3681007, 1, 1, 1, 1, 1,
1.681865, -1.294834, 0.5008141, 1, 1, 1, 1, 1,
1.68303, 1.578888, 3.954796, 1, 1, 1, 1, 1,
1.703006, 0.9343637, -0.9075121, 1, 1, 1, 1, 1,
1.704202, 0.09296061, -0.2074751, 1, 1, 1, 1, 1,
1.708032, 0.218912, 0.7901242, 1, 1, 1, 1, 1,
1.722646, 0.5150602, -0.225815, 1, 1, 1, 1, 1,
1.724161, 0.2752859, 1.727499, 1, 1, 1, 1, 1,
1.740665, -0.1674389, -0.04116111, 0, 0, 1, 1, 1,
1.756735, 1.484519, 0.8863987, 1, 0, 0, 1, 1,
1.767387, -1.073408, 2.310796, 1, 0, 0, 1, 1,
1.793924, -1.517653, 1.836808, 1, 0, 0, 1, 1,
1.803854, 0.6327379, 1.860764, 1, 0, 0, 1, 1,
1.807309, 0.3525575, 0.6236112, 1, 0, 0, 1, 1,
1.816246, -0.3982967, -0.5820162, 0, 0, 0, 1, 1,
1.818445, -1.327189, 1.818874, 0, 0, 0, 1, 1,
1.82947, -1.284584, 2.637644, 0, 0, 0, 1, 1,
1.853036, 0.3750187, 3.116525, 0, 0, 0, 1, 1,
1.866718, -1.081747, 2.272704, 0, 0, 0, 1, 1,
1.867275, 1.540007, 2.258828, 0, 0, 0, 1, 1,
1.878682, -0.1246568, 3.177649, 0, 0, 0, 1, 1,
1.897572, -0.725257, 3.645813, 1, 1, 1, 1, 1,
1.959201, 0.4013938, 1.125386, 1, 1, 1, 1, 1,
1.960123, -0.5027292, 2.832332, 1, 1, 1, 1, 1,
1.988244, 0.6595901, -0.8431133, 1, 1, 1, 1, 1,
2.000457, -0.6825234, 2.701451, 1, 1, 1, 1, 1,
2.030147, 0.7762306, 1.377865, 1, 1, 1, 1, 1,
2.065301, -0.4129533, 1.173881, 1, 1, 1, 1, 1,
2.083721, 1.187732, 0.5098832, 1, 1, 1, 1, 1,
2.088288, -0.24791, 2.397835, 1, 1, 1, 1, 1,
2.122545, -0.6576737, 2.165021, 1, 1, 1, 1, 1,
2.124931, 0.1493427, -0.3586337, 1, 1, 1, 1, 1,
2.132661, 0.221595, 1.19693, 1, 1, 1, 1, 1,
2.145529, -1.05796, 2.504523, 1, 1, 1, 1, 1,
2.15659, -0.2938549, 1.051488, 1, 1, 1, 1, 1,
2.165718, 0.2302186, 1.977992, 1, 1, 1, 1, 1,
2.191389, -0.3730936, 1.116664, 0, 0, 1, 1, 1,
2.196116, 0.3519482, -1.047229, 1, 0, 0, 1, 1,
2.211725, -0.8291155, 2.72391, 1, 0, 0, 1, 1,
2.241389, -0.1280928, 2.664659, 1, 0, 0, 1, 1,
2.246467, -0.3318031, 1.543196, 1, 0, 0, 1, 1,
2.252114, 0.02572683, 0.3705831, 1, 0, 0, 1, 1,
2.369287, -1.468331, 2.995356, 0, 0, 0, 1, 1,
2.370344, -0.2018039, 1.626627, 0, 0, 0, 1, 1,
2.408756, -0.536752, 0.2587601, 0, 0, 0, 1, 1,
2.41146, 0.7149323, -0.6595383, 0, 0, 0, 1, 1,
2.426147, -0.1180355, -0.9583457, 0, 0, 0, 1, 1,
2.430611, 0.83294, 0.5988923, 0, 0, 0, 1, 1,
2.442362, -0.5127571, 1.989045, 0, 0, 0, 1, 1,
2.466266, -0.7425345, 2.73682, 1, 1, 1, 1, 1,
2.491076, 1.285156, 1.314164, 1, 1, 1, 1, 1,
2.561554, 0.573002, 0.01625924, 1, 1, 1, 1, 1,
2.630433, -1.204241, 0.8306953, 1, 1, 1, 1, 1,
2.655047, -1.29042, 3.897124, 1, 1, 1, 1, 1,
2.768197, -1.489515, 0.7992687, 1, 1, 1, 1, 1,
2.819007, 0.4991016, -0.9605598, 1, 1, 1, 1, 1
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
var radius = 9.78523;
var distance = 34.3702;
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
mvMatrix.translate( 0.2283533, 0.01996219, -0.2848825 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.3702);
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
