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
-3.389128, 0.5886758, -0.5253499, 1, 0, 0, 1,
-3.135753, 0.06187933, -2.105506, 1, 0.007843138, 0, 1,
-2.947292, 0.2763735, -1.018715, 1, 0.01176471, 0, 1,
-2.892312, -0.2708703, -0.997872, 1, 0.01960784, 0, 1,
-2.697483, -0.5441791, -2.866841, 1, 0.02352941, 0, 1,
-2.610433, -0.4142976, -1.877992, 1, 0.03137255, 0, 1,
-2.608883, 0.3039322, -3.065221, 1, 0.03529412, 0, 1,
-2.527426, -0.5405253, -0.8965302, 1, 0.04313726, 0, 1,
-2.493438, -0.18061, -2.668869, 1, 0.04705882, 0, 1,
-2.474194, -0.9221714, -1.600829, 1, 0.05490196, 0, 1,
-2.419248, 1.169796, -0.4166458, 1, 0.05882353, 0, 1,
-2.366469, 1.448196, -1.184651, 1, 0.06666667, 0, 1,
-2.308258, 0.2654516, 0.4511614, 1, 0.07058824, 0, 1,
-2.280398, 1.238379, -0.9371159, 1, 0.07843138, 0, 1,
-2.232066, 0.8226098, -0.7489369, 1, 0.08235294, 0, 1,
-2.219118, 0.7446803, -1.215231, 1, 0.09019608, 0, 1,
-2.179211, 0.7276704, -0.4762009, 1, 0.09411765, 0, 1,
-2.144923, 0.1691383, -1.73588, 1, 0.1019608, 0, 1,
-2.139718, -0.3191522, -2.451811, 1, 0.1098039, 0, 1,
-2.117645, 0.6891825, -1.725843, 1, 0.1137255, 0, 1,
-2.109588, -0.9209831, -3.069257, 1, 0.1215686, 0, 1,
-2.076832, 0.06630386, -0.104105, 1, 0.1254902, 0, 1,
-2.058227, -0.725599, -2.734512, 1, 0.1333333, 0, 1,
-2.055115, 1.536991, -2.092607, 1, 0.1372549, 0, 1,
-2.053576, 0.1417006, -1.398774, 1, 0.145098, 0, 1,
-2.052296, 1.884663, -0.8861558, 1, 0.1490196, 0, 1,
-2.04329, -0.7009263, -1.704064, 1, 0.1568628, 0, 1,
-2.042992, -0.6560826, -1.942426, 1, 0.1607843, 0, 1,
-2.031246, -0.7010882, -1.538201, 1, 0.1686275, 0, 1,
-2.008879, 0.8978013, 0.006140327, 1, 0.172549, 0, 1,
-1.982268, -1.431601, -3.407956, 1, 0.1803922, 0, 1,
-1.936451, 1.029018, -0.6475981, 1, 0.1843137, 0, 1,
-1.933403, 1.110239, -0.6438946, 1, 0.1921569, 0, 1,
-1.930417, -0.05212307, -1.89526, 1, 0.1960784, 0, 1,
-1.902006, 1.061253, -1.864869, 1, 0.2039216, 0, 1,
-1.897639, 1.899063, -0.2134597, 1, 0.2117647, 0, 1,
-1.883491, 0.9772958, 0.6604438, 1, 0.2156863, 0, 1,
-1.842109, 0.7460321, -0.6557628, 1, 0.2235294, 0, 1,
-1.836163, 1.015026, -0.03711239, 1, 0.227451, 0, 1,
-1.825141, -0.8988113, -2.315417, 1, 0.2352941, 0, 1,
-1.823769, -1.125999, -1.390938, 1, 0.2392157, 0, 1,
-1.808591, -0.6784589, -0.9279355, 1, 0.2470588, 0, 1,
-1.806363, -2.378161, -1.872855, 1, 0.2509804, 0, 1,
-1.805956, 1.294156, -0.5103183, 1, 0.2588235, 0, 1,
-1.801958, 0.9991504, -0.1007733, 1, 0.2627451, 0, 1,
-1.768364, -1.134643, -3.632085, 1, 0.2705882, 0, 1,
-1.75084, -0.1925423, -2.41204, 1, 0.2745098, 0, 1,
-1.728347, 2.159184, 0.02011575, 1, 0.282353, 0, 1,
-1.713631, -0.6345471, -1.215049, 1, 0.2862745, 0, 1,
-1.679034, 1.433904, -1.21709, 1, 0.2941177, 0, 1,
-1.669485, -0.3779038, -2.528587, 1, 0.3019608, 0, 1,
-1.668392, 1.158634, -1.114712, 1, 0.3058824, 0, 1,
-1.666202, -0.4351579, -1.495151, 1, 0.3137255, 0, 1,
-1.644767, -0.3446154, -0.2828843, 1, 0.3176471, 0, 1,
-1.633924, -0.1932033, -2.324626, 1, 0.3254902, 0, 1,
-1.62902, -0.09724509, -3.437083, 1, 0.3294118, 0, 1,
-1.628523, 0.05829332, -2.211136, 1, 0.3372549, 0, 1,
-1.625501, -0.6299813, -3.349803, 1, 0.3411765, 0, 1,
-1.623816, 0.8558502, -1.494262, 1, 0.3490196, 0, 1,
-1.606397, -0.9807803, -4.179095, 1, 0.3529412, 0, 1,
-1.603102, 0.794818, -1.652492, 1, 0.3607843, 0, 1,
-1.596229, -0.7910522, -2.18011, 1, 0.3647059, 0, 1,
-1.592519, 1.27371, -2.672941, 1, 0.372549, 0, 1,
-1.575787, 1.940902, -1.425556, 1, 0.3764706, 0, 1,
-1.575063, 0.4129263, -0.2202289, 1, 0.3843137, 0, 1,
-1.561417, -0.2056373, -1.286108, 1, 0.3882353, 0, 1,
-1.555083, 0.2841447, -0.8617135, 1, 0.3960784, 0, 1,
-1.551311, -2.422048, -1.143888, 1, 0.4039216, 0, 1,
-1.544741, -0.8498141, -1.049675, 1, 0.4078431, 0, 1,
-1.525371, 0.4302244, 0.9067203, 1, 0.4156863, 0, 1,
-1.523052, -0.3675845, -2.654468, 1, 0.4196078, 0, 1,
-1.520032, 0.1999519, -1.259296, 1, 0.427451, 0, 1,
-1.516405, 0.07963981, -0.2661232, 1, 0.4313726, 0, 1,
-1.508514, 0.2952913, -0.2331119, 1, 0.4392157, 0, 1,
-1.505666, -0.5834394, -0.6603565, 1, 0.4431373, 0, 1,
-1.500661, 0.3740508, -1.407619, 1, 0.4509804, 0, 1,
-1.488895, -0.4728935, -1.999149, 1, 0.454902, 0, 1,
-1.479395, -0.575101, -1.899551, 1, 0.4627451, 0, 1,
-1.47768, 2.032483, 0.9782037, 1, 0.4666667, 0, 1,
-1.475879, 0.8762488, -0.9908684, 1, 0.4745098, 0, 1,
-1.463962, -0.5027297, -2.412413, 1, 0.4784314, 0, 1,
-1.456475, 1.83962, -0.2488566, 1, 0.4862745, 0, 1,
-1.446846, 0.8384075, -0.8993437, 1, 0.4901961, 0, 1,
-1.438926, -0.6591669, -3.196844, 1, 0.4980392, 0, 1,
-1.436357, 1.177279, -0.9853929, 1, 0.5058824, 0, 1,
-1.422308, -1.44415, -0.8356799, 1, 0.509804, 0, 1,
-1.39381, -0.4527556, -1.432168, 1, 0.5176471, 0, 1,
-1.390348, -2.240379, -4.634854, 1, 0.5215687, 0, 1,
-1.381387, 0.8147223, -0.7357521, 1, 0.5294118, 0, 1,
-1.381225, -0.1889758, -2.594339, 1, 0.5333334, 0, 1,
-1.378421, -0.7739228, -2.531059, 1, 0.5411765, 0, 1,
-1.37477, -0.8364211, -2.91055, 1, 0.5450981, 0, 1,
-1.368201, -2.021378, -4.51782, 1, 0.5529412, 0, 1,
-1.360449, -0.4558068, -0.7313564, 1, 0.5568628, 0, 1,
-1.356402, -1.370667, -2.32817, 1, 0.5647059, 0, 1,
-1.352806, 0.6709473, -1.105439, 1, 0.5686275, 0, 1,
-1.338565, -1.403383, -1.070561, 1, 0.5764706, 0, 1,
-1.335333, -1.183355, -0.7520703, 1, 0.5803922, 0, 1,
-1.333062, -0.3439974, -3.386407, 1, 0.5882353, 0, 1,
-1.316257, -0.973658, -2.248707, 1, 0.5921569, 0, 1,
-1.307281, 1.228157, -0.9790527, 1, 0.6, 0, 1,
-1.306778, 1.280366, -0.2403864, 1, 0.6078432, 0, 1,
-1.300198, -2.668911, -2.863653, 1, 0.6117647, 0, 1,
-1.292274, -0.7656494, -1.876474, 1, 0.6196079, 0, 1,
-1.288525, -1.140081, -3.062214, 1, 0.6235294, 0, 1,
-1.280842, -0.7611402, -0.04459302, 1, 0.6313726, 0, 1,
-1.273797, -1.292372, -1.124727, 1, 0.6352941, 0, 1,
-1.27269, -0.320269, -2.361199, 1, 0.6431373, 0, 1,
-1.258441, -1.450406, -2.670579, 1, 0.6470588, 0, 1,
-1.25407, 1.523144, 0.5525985, 1, 0.654902, 0, 1,
-1.24382, -0.4986517, -1.554185, 1, 0.6588235, 0, 1,
-1.214764, -0.1950044, -0.2855782, 1, 0.6666667, 0, 1,
-1.208874, -0.385373, -0.9433486, 1, 0.6705883, 0, 1,
-1.208378, 0.5984958, -0.5627909, 1, 0.6784314, 0, 1,
-1.191756, 1.860397, 0.6295737, 1, 0.682353, 0, 1,
-1.190431, -0.5064608, -2.586058, 1, 0.6901961, 0, 1,
-1.188392, 0.188997, -1.051139, 1, 0.6941177, 0, 1,
-1.181183, -0.7956688, 0.1614101, 1, 0.7019608, 0, 1,
-1.169038, -0.1033258, -2.13589, 1, 0.7098039, 0, 1,
-1.166626, 0.5088525, -0.4014049, 1, 0.7137255, 0, 1,
-1.162324, 0.539008, -0.6339589, 1, 0.7215686, 0, 1,
-1.161943, -1.832463, -3.488942, 1, 0.7254902, 0, 1,
-1.161908, -0.1565232, 0.46637, 1, 0.7333333, 0, 1,
-1.156018, 0.4827147, -0.9248989, 1, 0.7372549, 0, 1,
-1.13864, 0.4477535, -0.9237651, 1, 0.7450981, 0, 1,
-1.133378, 0.5006388, -0.6673002, 1, 0.7490196, 0, 1,
-1.125768, 1.007004, -0.6083357, 1, 0.7568628, 0, 1,
-1.118344, -2.027918, -2.945612, 1, 0.7607843, 0, 1,
-1.117812, -0.6508213, -2.008299, 1, 0.7686275, 0, 1,
-1.114135, 0.03241714, -1.086409, 1, 0.772549, 0, 1,
-1.105792, -1.105825, -1.201816, 1, 0.7803922, 0, 1,
-1.105705, 0.9206243, -2.406173, 1, 0.7843137, 0, 1,
-1.103979, 0.1917375, 0.590707, 1, 0.7921569, 0, 1,
-1.098076, -0.8226315, -2.801547, 1, 0.7960784, 0, 1,
-1.094035, 0.4684328, -1.228185, 1, 0.8039216, 0, 1,
-1.085151, 0.3536621, -2.173599, 1, 0.8117647, 0, 1,
-1.079803, -3.708694, -4.161096, 1, 0.8156863, 0, 1,
-1.064992, -0.7337165, -1.389948, 1, 0.8235294, 0, 1,
-1.064266, 0.4764611, -0.9299529, 1, 0.827451, 0, 1,
-1.063252, -1.663099, -2.629451, 1, 0.8352941, 0, 1,
-1.063158, -1.106768, -1.785453, 1, 0.8392157, 0, 1,
-1.061507, -0.4207841, -1.78378, 1, 0.8470588, 0, 1,
-1.061467, -0.6820154, -1.707703, 1, 0.8509804, 0, 1,
-1.055182, 0.09251416, -1.75635, 1, 0.8588235, 0, 1,
-1.054213, 1.75189, -1.332333, 1, 0.8627451, 0, 1,
-1.052902, 0.3513384, -0.7559443, 1, 0.8705882, 0, 1,
-1.052834, -0.02684401, -2.245254, 1, 0.8745098, 0, 1,
-1.047921, -0.02621211, -2.914321, 1, 0.8823529, 0, 1,
-1.047227, 1.062394, -2.48817, 1, 0.8862745, 0, 1,
-1.047147, -1.27077, -1.79695, 1, 0.8941177, 0, 1,
-1.033062, 1.182295, 0.08179642, 1, 0.8980392, 0, 1,
-1.033054, 0.06172209, -1.871953, 1, 0.9058824, 0, 1,
-1.029971, 1.581732, -0.1010391, 1, 0.9137255, 0, 1,
-1.017877, -0.910782, -2.601058, 1, 0.9176471, 0, 1,
-1.017149, -0.502084, -2.982587, 1, 0.9254902, 0, 1,
-1.015733, -1.297281, -3.530879, 1, 0.9294118, 0, 1,
-1.000511, -0.8678302, -2.062264, 1, 0.9372549, 0, 1,
-0.9992735, -0.2485065, -2.788403, 1, 0.9411765, 0, 1,
-0.9983894, 0.04988331, -1.259006, 1, 0.9490196, 0, 1,
-0.9954051, 0.1849437, -0.2123485, 1, 0.9529412, 0, 1,
-0.9936852, -0.2434576, -3.783522, 1, 0.9607843, 0, 1,
-0.9913583, -0.02418729, -2.954133, 1, 0.9647059, 0, 1,
-0.9901797, -1.474598, -2.600665, 1, 0.972549, 0, 1,
-0.9894587, 0.7155523, -2.135475, 1, 0.9764706, 0, 1,
-0.9822651, 1.510629, 0.9093125, 1, 0.9843137, 0, 1,
-0.9808612, -0.3796588, -2.292684, 1, 0.9882353, 0, 1,
-0.9755152, -0.1769609, -2.440279, 1, 0.9960784, 0, 1,
-0.9605294, -1.485733, -5.221045, 0.9960784, 1, 0, 1,
-0.9602465, 0.1280234, -0.5757625, 0.9921569, 1, 0, 1,
-0.9582863, -0.242579, -2.840233, 0.9843137, 1, 0, 1,
-0.9415022, 0.2807094, -0.4565486, 0.9803922, 1, 0, 1,
-0.9322739, -0.6240978, -3.157352, 0.972549, 1, 0, 1,
-0.9256541, -0.02391315, -0.1376932, 0.9686275, 1, 0, 1,
-0.9247658, 1.038592, 0.3646183, 0.9607843, 1, 0, 1,
-0.9222171, -0.592189, -2.775598, 0.9568627, 1, 0, 1,
-0.9208742, 0.08917008, -2.953744, 0.9490196, 1, 0, 1,
-0.9145953, -0.04215369, -1.604867, 0.945098, 1, 0, 1,
-0.913334, -0.8526338, -3.96595, 0.9372549, 1, 0, 1,
-0.910262, -0.632544, -2.139082, 0.9333333, 1, 0, 1,
-0.907488, -0.04672225, -1.18464, 0.9254902, 1, 0, 1,
-0.9074024, 0.324168, -1.74295, 0.9215686, 1, 0, 1,
-0.9071034, 0.8963279, 0.3160516, 0.9137255, 1, 0, 1,
-0.9067949, 0.2349252, -1.059914, 0.9098039, 1, 0, 1,
-0.8987011, -0.7053504, -3.271416, 0.9019608, 1, 0, 1,
-0.8973217, 1.158528, -0.8990918, 0.8941177, 1, 0, 1,
-0.8972427, 0.4618759, -2.801348, 0.8901961, 1, 0, 1,
-0.8947479, -0.7522492, -2.085611, 0.8823529, 1, 0, 1,
-0.8915022, 0.7167836, -0.4460265, 0.8784314, 1, 0, 1,
-0.8871213, 0.4899169, 0.5636774, 0.8705882, 1, 0, 1,
-0.8848127, -0.05917623, -1.039254, 0.8666667, 1, 0, 1,
-0.8821385, -0.990397, -2.44269, 0.8588235, 1, 0, 1,
-0.8816379, -0.9757843, -3.013192, 0.854902, 1, 0, 1,
-0.8807373, 0.538691, -1.128589, 0.8470588, 1, 0, 1,
-0.8742645, -0.2213828, -1.335445, 0.8431373, 1, 0, 1,
-0.868248, 0.3090787, -2.085046, 0.8352941, 1, 0, 1,
-0.8638375, 0.9419285, -0.8421036, 0.8313726, 1, 0, 1,
-0.8592759, -0.94677, -1.735786, 0.8235294, 1, 0, 1,
-0.8575693, 0.7504898, -0.6202878, 0.8196079, 1, 0, 1,
-0.8492189, 0.537357, -2.177133, 0.8117647, 1, 0, 1,
-0.8398789, -0.280272, -2.57537, 0.8078431, 1, 0, 1,
-0.8398063, -0.4756225, -3.013699, 0.8, 1, 0, 1,
-0.837432, 0.8150196, -0.902972, 0.7921569, 1, 0, 1,
-0.8352022, 0.5292603, -0.7046583, 0.7882353, 1, 0, 1,
-0.833155, -1.0521, -3.827404, 0.7803922, 1, 0, 1,
-0.8216495, -0.7977769, -4.069023, 0.7764706, 1, 0, 1,
-0.8214914, 0.3267541, -2.781173, 0.7686275, 1, 0, 1,
-0.8194106, 0.8302034, 1.120064, 0.7647059, 1, 0, 1,
-0.815839, -1.544203, -2.976685, 0.7568628, 1, 0, 1,
-0.801576, -1.0181, -1.690436, 0.7529412, 1, 0, 1,
-0.8004719, -1.155976, -2.06399, 0.7450981, 1, 0, 1,
-0.8002494, -0.2746967, -1.83664, 0.7411765, 1, 0, 1,
-0.7960849, -1.390995, -2.284485, 0.7333333, 1, 0, 1,
-0.7958564, 1.843771, -0.689142, 0.7294118, 1, 0, 1,
-0.7954761, -1.124478, -3.962798, 0.7215686, 1, 0, 1,
-0.7929029, -1.403553, -3.258013, 0.7176471, 1, 0, 1,
-0.7919007, -0.154833, -1.965914, 0.7098039, 1, 0, 1,
-0.7881386, -0.9501463, -2.25718, 0.7058824, 1, 0, 1,
-0.7878125, 0.5246236, 0.3164582, 0.6980392, 1, 0, 1,
-0.7857478, 1.175231, -0.6842325, 0.6901961, 1, 0, 1,
-0.7785998, -0.222614, -1.986591, 0.6862745, 1, 0, 1,
-0.7761801, 0.572402, -0.7556324, 0.6784314, 1, 0, 1,
-0.7708562, -1.414798, -2.102271, 0.6745098, 1, 0, 1,
-0.7675486, 0.6285339, -2.729964, 0.6666667, 1, 0, 1,
-0.7628736, 2.616421, -1.948762, 0.6627451, 1, 0, 1,
-0.7617242, -0.04888138, -1.337417, 0.654902, 1, 0, 1,
-0.7586007, 0.1972043, -0.2972361, 0.6509804, 1, 0, 1,
-0.7580665, -1.521982, -2.058146, 0.6431373, 1, 0, 1,
-0.7580371, 0.6533496, -1.116879, 0.6392157, 1, 0, 1,
-0.7566738, -1.525514, -3.385252, 0.6313726, 1, 0, 1,
-0.7534434, -0.2715922, -1.817125, 0.627451, 1, 0, 1,
-0.7492465, 1.116482, -0.5384122, 0.6196079, 1, 0, 1,
-0.7487307, 0.3794251, -2.221291, 0.6156863, 1, 0, 1,
-0.7457709, -0.3375363, -1.604039, 0.6078432, 1, 0, 1,
-0.742874, 0.7313465, -2.471031, 0.6039216, 1, 0, 1,
-0.7378618, -0.07354581, -1.831411, 0.5960785, 1, 0, 1,
-0.7330198, 1.732311, -0.4499703, 0.5882353, 1, 0, 1,
-0.7245235, -0.7704296, -3.56683, 0.5843138, 1, 0, 1,
-0.7223648, 0.2229, -1.131425, 0.5764706, 1, 0, 1,
-0.7196425, 0.1222284, 0.6859533, 0.572549, 1, 0, 1,
-0.7184616, -1.746988, -4.638517, 0.5647059, 1, 0, 1,
-0.7003745, -0.8514578, -1.672718, 0.5607843, 1, 0, 1,
-0.6996653, 0.1899467, -0.5499036, 0.5529412, 1, 0, 1,
-0.6983024, 0.7847481, -2.496712, 0.5490196, 1, 0, 1,
-0.6961309, -2.088452, -0.01066275, 0.5411765, 1, 0, 1,
-0.6954032, 1.663865, -0.659824, 0.5372549, 1, 0, 1,
-0.6925166, -0.715521, -1.042283, 0.5294118, 1, 0, 1,
-0.6895337, 0.5103367, -1.306143, 0.5254902, 1, 0, 1,
-0.6818452, 0.7154415, -2.487993, 0.5176471, 1, 0, 1,
-0.6712935, 1.410458, -1.061426, 0.5137255, 1, 0, 1,
-0.6673698, -0.6046432, -0.2775521, 0.5058824, 1, 0, 1,
-0.6555052, 0.5829365, -1.547034, 0.5019608, 1, 0, 1,
-0.6548865, 0.2644075, -0.5433349, 0.4941176, 1, 0, 1,
-0.6526408, -0.7328844, -2.020567, 0.4862745, 1, 0, 1,
-0.6519642, 1.284741, 0.2995193, 0.4823529, 1, 0, 1,
-0.649527, 0.2861838, -0.2475405, 0.4745098, 1, 0, 1,
-0.6479543, 0.1738467, -2.063598, 0.4705882, 1, 0, 1,
-0.6472303, -1.04938, -2.614863, 0.4627451, 1, 0, 1,
-0.642822, -0.5058918, -1.068097, 0.4588235, 1, 0, 1,
-0.6416209, -1.043247, -4.754636, 0.4509804, 1, 0, 1,
-0.6361157, -0.06222971, -1.236189, 0.4470588, 1, 0, 1,
-0.6349024, 0.3881595, -0.6405267, 0.4392157, 1, 0, 1,
-0.6346133, -0.02985001, -3.947748, 0.4352941, 1, 0, 1,
-0.6320217, 0.5071394, -1.554195, 0.427451, 1, 0, 1,
-0.6257757, 0.7613325, -2.231673, 0.4235294, 1, 0, 1,
-0.6251267, -0.1227282, -1.401876, 0.4156863, 1, 0, 1,
-0.6246761, 0.2948408, 0.9331552, 0.4117647, 1, 0, 1,
-0.6183841, 1.361658, 0.008639307, 0.4039216, 1, 0, 1,
-0.6176642, 0.6257224, -1.879026, 0.3960784, 1, 0, 1,
-0.6156656, 0.8032163, -2.076731, 0.3921569, 1, 0, 1,
-0.6147009, 0.6078591, 0.4563027, 0.3843137, 1, 0, 1,
-0.6088966, -0.9480689, -1.583985, 0.3803922, 1, 0, 1,
-0.5987568, -0.04394858, -2.045663, 0.372549, 1, 0, 1,
-0.5982702, 1.415734, 0.9005738, 0.3686275, 1, 0, 1,
-0.5982599, -1.115638, -4.459887, 0.3607843, 1, 0, 1,
-0.5934502, 0.4421269, 0.8159874, 0.3568628, 1, 0, 1,
-0.5933056, -1.319098, -1.596573, 0.3490196, 1, 0, 1,
-0.5916885, 0.4005693, -1.743274, 0.345098, 1, 0, 1,
-0.5834402, -1.050496, -4.453988, 0.3372549, 1, 0, 1,
-0.5821805, -0.7236801, -0.8702666, 0.3333333, 1, 0, 1,
-0.5766916, -1.611577, -3.970237, 0.3254902, 1, 0, 1,
-0.5756126, 0.5185112, -1.701916, 0.3215686, 1, 0, 1,
-0.574055, 2.307399, -0.9033204, 0.3137255, 1, 0, 1,
-0.5732616, -0.06975153, -2.695207, 0.3098039, 1, 0, 1,
-0.5715259, 1.467878, 0.1727309, 0.3019608, 1, 0, 1,
-0.5642917, -1.29193, -1.93083, 0.2941177, 1, 0, 1,
-0.5631047, 0.3402243, 0.03510179, 0.2901961, 1, 0, 1,
-0.5582165, 1.562991, 0.6079743, 0.282353, 1, 0, 1,
-0.555484, 0.4858758, -0.2527978, 0.2784314, 1, 0, 1,
-0.5539851, 0.620644, -0.8729209, 0.2705882, 1, 0, 1,
-0.5529553, -1.739507, -4.93581, 0.2666667, 1, 0, 1,
-0.5454293, 1.25619, 1.024977, 0.2588235, 1, 0, 1,
-0.5414591, -0.2396248, -3.200159, 0.254902, 1, 0, 1,
-0.5399995, -0.5178198, -3.551444, 0.2470588, 1, 0, 1,
-0.5370131, -1.281616, -1.619944, 0.2431373, 1, 0, 1,
-0.5261725, -0.05295986, -2.613686, 0.2352941, 1, 0, 1,
-0.525615, -1.428623, -1.768433, 0.2313726, 1, 0, 1,
-0.5253813, -1.418563, -2.733265, 0.2235294, 1, 0, 1,
-0.5242938, 0.1199973, -1.555021, 0.2196078, 1, 0, 1,
-0.5231507, -1.569162, -1.943322, 0.2117647, 1, 0, 1,
-0.5217836, 0.2183546, -0.8036643, 0.2078431, 1, 0, 1,
-0.5215923, 1.088716, -0.7672328, 0.2, 1, 0, 1,
-0.5194847, 1.866076, 1.193242, 0.1921569, 1, 0, 1,
-0.5191656, 0.192882, -0.5571954, 0.1882353, 1, 0, 1,
-0.5176771, -0.3662672, -2.279215, 0.1803922, 1, 0, 1,
-0.5162027, 1.386086, -0.9394065, 0.1764706, 1, 0, 1,
-0.5135196, 2.818343, -0.2454787, 0.1686275, 1, 0, 1,
-0.5123771, -0.1385064, -0.8431062, 0.1647059, 1, 0, 1,
-0.5121153, 1.341392, -0.5873232, 0.1568628, 1, 0, 1,
-0.5072885, -0.02061809, -0.8895282, 0.1529412, 1, 0, 1,
-0.5068143, 0.485295, -0.1683029, 0.145098, 1, 0, 1,
-0.5056402, 1.733293, 0.7600152, 0.1411765, 1, 0, 1,
-0.4965393, -0.6542318, -3.780746, 0.1333333, 1, 0, 1,
-0.4919942, -0.7960609, -1.873669, 0.1294118, 1, 0, 1,
-0.4914004, -0.7487861, -3.087258, 0.1215686, 1, 0, 1,
-0.4912113, -0.1150178, -2.24545, 0.1176471, 1, 0, 1,
-0.4896064, -0.3156636, -1.991877, 0.1098039, 1, 0, 1,
-0.4860643, -1.001389, -3.370615, 0.1058824, 1, 0, 1,
-0.4800239, 0.02675406, -1.692408, 0.09803922, 1, 0, 1,
-0.4791431, 1.303173, -0.3596822, 0.09019608, 1, 0, 1,
-0.4782033, -0.729433, -1.990121, 0.08627451, 1, 0, 1,
-0.4735772, 2.820449, 0.2692787, 0.07843138, 1, 0, 1,
-0.4685329, 0.8149725, 2.098088, 0.07450981, 1, 0, 1,
-0.4681203, 1.56622, -0.7045876, 0.06666667, 1, 0, 1,
-0.4652717, -1.665982, -2.022571, 0.0627451, 1, 0, 1,
-0.4651393, 0.2254527, -1.309739, 0.05490196, 1, 0, 1,
-0.4645638, 1.296014, -0.2109715, 0.05098039, 1, 0, 1,
-0.4637466, -0.9177639, -3.61485, 0.04313726, 1, 0, 1,
-0.4624971, -0.8430682, -1.853668, 0.03921569, 1, 0, 1,
-0.462359, -1.441134, -3.840211, 0.03137255, 1, 0, 1,
-0.4604204, -0.6758641, -2.655623, 0.02745098, 1, 0, 1,
-0.4509586, -0.1406486, -1.942083, 0.01960784, 1, 0, 1,
-0.4407461, 0.9328746, -1.535222, 0.01568628, 1, 0, 1,
-0.438922, 1.089936, -0.05984897, 0.007843138, 1, 0, 1,
-0.4376361, 0.8402227, 0.3172189, 0.003921569, 1, 0, 1,
-0.4366999, -0.3259348, -1.303471, 0, 1, 0.003921569, 1,
-0.4334299, -0.2195373, -1.971454, 0, 1, 0.01176471, 1,
-0.4282179, -0.9869596, -3.344891, 0, 1, 0.01568628, 1,
-0.421323, -0.5296634, -2.610907, 0, 1, 0.02352941, 1,
-0.4198217, -1.911058, -4.99289, 0, 1, 0.02745098, 1,
-0.4196567, -0.3425873, -2.280121, 0, 1, 0.03529412, 1,
-0.4170182, 0.137002, -2.27855, 0, 1, 0.03921569, 1,
-0.4138026, 0.3140028, -1.171784, 0, 1, 0.04705882, 1,
-0.4134791, 0.7167011, 0.4356765, 0, 1, 0.05098039, 1,
-0.4126964, 0.3571207, -0.754598, 0, 1, 0.05882353, 1,
-0.407521, 0.8828339, 2.267111, 0, 1, 0.0627451, 1,
-0.4065559, -0.03435035, -2.153421, 0, 1, 0.07058824, 1,
-0.4050857, 0.3389881, -1.919498, 0, 1, 0.07450981, 1,
-0.4007401, -1.631455, -3.041054, 0, 1, 0.08235294, 1,
-0.3994202, 1.257968, -1.160892, 0, 1, 0.08627451, 1,
-0.3985879, 2.23666, 0.7405113, 0, 1, 0.09411765, 1,
-0.3956764, -0.6378105, -1.50963, 0, 1, 0.1019608, 1,
-0.3912651, 0.7195232, -1.824001, 0, 1, 0.1058824, 1,
-0.3882197, -0.6819884, -3.081784, 0, 1, 0.1137255, 1,
-0.3826774, -0.3648672, -2.174897, 0, 1, 0.1176471, 1,
-0.3811579, 0.7614485, -0.1122213, 0, 1, 0.1254902, 1,
-0.3807627, 0.6492343, 0.5115855, 0, 1, 0.1294118, 1,
-0.3724751, -0.6686521, -4.591512, 0, 1, 0.1372549, 1,
-0.3707772, -0.0009592084, -1.206408, 0, 1, 0.1411765, 1,
-0.367125, -0.2558786, -2.151895, 0, 1, 0.1490196, 1,
-0.3641593, -1.511681, -2.487143, 0, 1, 0.1529412, 1,
-0.3637255, 0.5474292, -1.268707, 0, 1, 0.1607843, 1,
-0.3535191, 1.205723, -0.8076947, 0, 1, 0.1647059, 1,
-0.3525147, -0.2821732, -2.392755, 0, 1, 0.172549, 1,
-0.3450783, -0.5794097, -2.013983, 0, 1, 0.1764706, 1,
-0.3441741, -0.5854858, -1.752006, 0, 1, 0.1843137, 1,
-0.3435865, 1.717741, 1.359335, 0, 1, 0.1882353, 1,
-0.3428207, -0.560335, -3.236378, 0, 1, 0.1960784, 1,
-0.34188, -0.3937669, -1.20292, 0, 1, 0.2039216, 1,
-0.3391339, 1.06038, 1.854028, 0, 1, 0.2078431, 1,
-0.3383549, -1.659369, -1.769404, 0, 1, 0.2156863, 1,
-0.3357217, 0.946753, -1.441482, 0, 1, 0.2196078, 1,
-0.3346443, 0.3518395, -0.3648085, 0, 1, 0.227451, 1,
-0.332834, 0.6005468, 0.2429576, 0, 1, 0.2313726, 1,
-0.3274868, 1.185512, 0.2265507, 0, 1, 0.2392157, 1,
-0.3273515, -1.497101, -5.619053, 0, 1, 0.2431373, 1,
-0.327107, -0.1901511, -3.251167, 0, 1, 0.2509804, 1,
-0.3264353, 0.9299577, -0.4041139, 0, 1, 0.254902, 1,
-0.3232209, -0.592541, -2.928113, 0, 1, 0.2627451, 1,
-0.3186391, 0.7292419, -1.353323, 0, 1, 0.2666667, 1,
-0.3180549, -0.597075, -1.65291, 0, 1, 0.2745098, 1,
-0.3168525, -0.1970955, -2.380888, 0, 1, 0.2784314, 1,
-0.3151223, 1.182322, -0.4014881, 0, 1, 0.2862745, 1,
-0.3109642, 0.4025906, -0.3080604, 0, 1, 0.2901961, 1,
-0.3107741, -2.095549, -4.061444, 0, 1, 0.2980392, 1,
-0.2979327, 0.5980616, -1.096664, 0, 1, 0.3058824, 1,
-0.2975408, 0.8318899, -0.0794788, 0, 1, 0.3098039, 1,
-0.2957965, 1.182819, -0.1073367, 0, 1, 0.3176471, 1,
-0.2921361, -0.200231, -0.9873379, 0, 1, 0.3215686, 1,
-0.2908698, 1.53805, 0.3192058, 0, 1, 0.3294118, 1,
-0.2892867, 0.5929092, -1.472495, 0, 1, 0.3333333, 1,
-0.2880957, -1.156785, -3.06057, 0, 1, 0.3411765, 1,
-0.286897, -1.214017, -4.648438, 0, 1, 0.345098, 1,
-0.2815594, 0.04804436, -0.7629938, 0, 1, 0.3529412, 1,
-0.2771209, 0.8026, 0.2592091, 0, 1, 0.3568628, 1,
-0.2755238, 0.2620617, 0.6905375, 0, 1, 0.3647059, 1,
-0.2749101, 1.988877, 0.1822032, 0, 1, 0.3686275, 1,
-0.2722493, 1.073749, 1.379266, 0, 1, 0.3764706, 1,
-0.2678403, 0.1554115, -0.6528687, 0, 1, 0.3803922, 1,
-0.2669753, 2.084381, 0.3659064, 0, 1, 0.3882353, 1,
-0.2655228, 0.6766791, 1.669615, 0, 1, 0.3921569, 1,
-0.2637752, -1.416609, -3.665763, 0, 1, 0.4, 1,
-0.262152, -1.384738, -3.415353, 0, 1, 0.4078431, 1,
-0.2620289, -0.5979779, -1.053461, 0, 1, 0.4117647, 1,
-0.2608163, 1.052546, 0.3845631, 0, 1, 0.4196078, 1,
-0.2600831, -0.7311864, -4.433623, 0, 1, 0.4235294, 1,
-0.2598032, -1.89508, -3.472401, 0, 1, 0.4313726, 1,
-0.2581595, 0.4541334, 1.870147, 0, 1, 0.4352941, 1,
-0.2570421, -2.610177, -3.506077, 0, 1, 0.4431373, 1,
-0.2512687, 1.384441, 0.3125499, 0, 1, 0.4470588, 1,
-0.2504067, -0.3852214, -0.9958125, 0, 1, 0.454902, 1,
-0.248953, -0.5442588, -2.270066, 0, 1, 0.4588235, 1,
-0.2416904, -0.1302044, -2.465276, 0, 1, 0.4666667, 1,
-0.2384284, -0.3133791, -2.173779, 0, 1, 0.4705882, 1,
-0.2318, -1.714169, -4.149222, 0, 1, 0.4784314, 1,
-0.2230525, -0.005989206, -4.160774, 0, 1, 0.4823529, 1,
-0.2230072, -1.241854, -3.368649, 0, 1, 0.4901961, 1,
-0.2224876, 0.4852014, -0.5936752, 0, 1, 0.4941176, 1,
-0.2201289, 0.7013823, 0.2434835, 0, 1, 0.5019608, 1,
-0.2182935, -0.8109424, -3.036006, 0, 1, 0.509804, 1,
-0.2142105, -0.5607156, -3.932103, 0, 1, 0.5137255, 1,
-0.2136317, 1.685946, -0.4994028, 0, 1, 0.5215687, 1,
-0.2134669, -0.8684851, -2.906606, 0, 1, 0.5254902, 1,
-0.2001906, 0.4397662, -0.276378, 0, 1, 0.5333334, 1,
-0.1991293, -1.219911, -1.411639, 0, 1, 0.5372549, 1,
-0.1915829, 0.4200988, -0.6473845, 0, 1, 0.5450981, 1,
-0.185244, -0.9447641, -2.213618, 0, 1, 0.5490196, 1,
-0.1850682, -0.5871769, -2.053559, 0, 1, 0.5568628, 1,
-0.1847559, 1.779124, 1.23366, 0, 1, 0.5607843, 1,
-0.1845499, -0.7752253, -2.872127, 0, 1, 0.5686275, 1,
-0.1842138, 0.9827011, 0.1594188, 0, 1, 0.572549, 1,
-0.182442, 0.3572215, 3.243316, 0, 1, 0.5803922, 1,
-0.1823305, -0.4207596, -4.161385, 0, 1, 0.5843138, 1,
-0.1780717, 0.08967927, -1.270295, 0, 1, 0.5921569, 1,
-0.1748628, -0.129479, -3.090699, 0, 1, 0.5960785, 1,
-0.1721312, 0.1853921, -0.3526128, 0, 1, 0.6039216, 1,
-0.1712782, 0.298122, -2.510452, 0, 1, 0.6117647, 1,
-0.1633469, -0.1121644, -2.883, 0, 1, 0.6156863, 1,
-0.1627083, -0.7781994, -4.298433, 0, 1, 0.6235294, 1,
-0.1608507, 0.6394147, 0.6742949, 0, 1, 0.627451, 1,
-0.1595773, -1.355584, -1.958692, 0, 1, 0.6352941, 1,
-0.1524022, 0.6080238, -0.9943215, 0, 1, 0.6392157, 1,
-0.1518177, -0.7758701, -3.832115, 0, 1, 0.6470588, 1,
-0.1403018, -0.4668921, -4.567019, 0, 1, 0.6509804, 1,
-0.1394083, -1.879385, -2.794348, 0, 1, 0.6588235, 1,
-0.1365832, 1.145798, 2.070053, 0, 1, 0.6627451, 1,
-0.1351337, 0.3637263, 1.419831, 0, 1, 0.6705883, 1,
-0.1340583, -0.4448897, -2.283411, 0, 1, 0.6745098, 1,
-0.1307295, -1.351842, -5.330271, 0, 1, 0.682353, 1,
-0.1267996, 1.217621, 1.333057, 0, 1, 0.6862745, 1,
-0.1263295, 2.169167, -0.6940254, 0, 1, 0.6941177, 1,
-0.1198411, -0.1543914, -1.155523, 0, 1, 0.7019608, 1,
-0.1193048, -0.7747328, -2.002908, 0, 1, 0.7058824, 1,
-0.1182269, -0.1570322, -3.710363, 0, 1, 0.7137255, 1,
-0.1162287, -0.7030365, -2.55196, 0, 1, 0.7176471, 1,
-0.1153388, -0.2807895, -3.445187, 0, 1, 0.7254902, 1,
-0.1151138, 0.5254453, 1.708032, 0, 1, 0.7294118, 1,
-0.1106182, 1.444075, -0.2472349, 0, 1, 0.7372549, 1,
-0.1099327, -0.5077803, -3.415491, 0, 1, 0.7411765, 1,
-0.1072135, 1.41218, -0.9088104, 0, 1, 0.7490196, 1,
-0.1055053, -0.2019047, -2.922505, 0, 1, 0.7529412, 1,
-0.104804, -0.8893924, -4.762397, 0, 1, 0.7607843, 1,
-0.1036911, 0.04802866, -1.339528, 0, 1, 0.7647059, 1,
-0.09362773, 1.43505, -0.4519533, 0, 1, 0.772549, 1,
-0.09260028, -1.180123, -2.129526, 0, 1, 0.7764706, 1,
-0.08865754, 1.533728, -0.06847622, 0, 1, 0.7843137, 1,
-0.08790065, -0.6669163, -2.353444, 0, 1, 0.7882353, 1,
-0.08786255, -0.6674227, -2.030866, 0, 1, 0.7960784, 1,
-0.08335516, 0.1217791, -0.3597573, 0, 1, 0.8039216, 1,
-0.08000971, -0.6597343, -3.822408, 0, 1, 0.8078431, 1,
-0.07799511, -0.57367, -3.611367, 0, 1, 0.8156863, 1,
-0.07274267, -0.4767476, -2.715003, 0, 1, 0.8196079, 1,
-0.06534947, 1.719593, 0.241769, 0, 1, 0.827451, 1,
-0.06470505, -1.420107, -1.581265, 0, 1, 0.8313726, 1,
-0.06282457, -0.1908454, -1.875557, 0, 1, 0.8392157, 1,
-0.06091941, 0.7999889, -0.7065784, 0, 1, 0.8431373, 1,
-0.06019588, 0.423762, -0.2537951, 0, 1, 0.8509804, 1,
-0.05849607, 0.2319858, 0.4853383, 0, 1, 0.854902, 1,
-0.0584938, -0.6638762, -2.426174, 0, 1, 0.8627451, 1,
-0.05755199, -0.06432257, -2.920312, 0, 1, 0.8666667, 1,
-0.05503155, -0.06859211, -1.738976, 0, 1, 0.8745098, 1,
-0.05436905, 1.106451, -1.150061, 0, 1, 0.8784314, 1,
-0.05392286, 0.7523844, 0.6765128, 0, 1, 0.8862745, 1,
-0.05210916, 1.025253, -1.73052, 0, 1, 0.8901961, 1,
-0.05193748, 0.1405312, -2.790752, 0, 1, 0.8980392, 1,
-0.05141623, 0.2330654, -0.5548202, 0, 1, 0.9058824, 1,
-0.05025362, -0.2609035, -3.287949, 0, 1, 0.9098039, 1,
-0.04858726, 2.088363, 0.1823895, 0, 1, 0.9176471, 1,
-0.04640662, -0.7962767, -3.799007, 0, 1, 0.9215686, 1,
-0.045561, 1.095895, -0.3950733, 0, 1, 0.9294118, 1,
-0.0450092, 0.3012308, 0.9079086, 0, 1, 0.9333333, 1,
-0.04404079, -1.068174, -3.998015, 0, 1, 0.9411765, 1,
-0.04310692, -0.3982072, -3.798007, 0, 1, 0.945098, 1,
-0.04200754, 0.1671429, 0.1918505, 0, 1, 0.9529412, 1,
-0.0409353, -0.3057858, -0.81213, 0, 1, 0.9568627, 1,
-0.03951165, -1.447665, -4.604137, 0, 1, 0.9647059, 1,
-0.03321159, -0.8542616, -4.286783, 0, 1, 0.9686275, 1,
-0.03207748, 0.9701768, -0.8443666, 0, 1, 0.9764706, 1,
-0.03199908, 0.3120528, -1.856611, 0, 1, 0.9803922, 1,
-0.03027139, 1.096716, 0.8078051, 0, 1, 0.9882353, 1,
-0.0286428, 0.2467089, -1.010025, 0, 1, 0.9921569, 1,
-0.02825318, 0.8237664, -0.5866619, 0, 1, 1, 1,
-0.02731074, -0.1029269, -3.285227, 0, 0.9921569, 1, 1,
-0.02635804, -3.315717, -4.530169, 0, 0.9882353, 1, 1,
-0.02183939, -1.112871, -3.373669, 0, 0.9803922, 1, 1,
-0.0145305, -0.2703215, -3.222541, 0, 0.9764706, 1, 1,
-0.01326437, 0.7340928, -1.684168, 0, 0.9686275, 1, 1,
-0.01079448, -0.5937592, -1.43007, 0, 0.9647059, 1, 1,
-0.01029343, 1.383622, 0.05509077, 0, 0.9568627, 1, 1,
-0.006374586, -1.835339, -3.901703, 0, 0.9529412, 1, 1,
-0.005610629, -0.3574055, -3.599779, 0, 0.945098, 1, 1,
-0.002440069, 0.4174277, -1.292351, 0, 0.9411765, 1, 1,
-0.001459608, 0.5699289, -1.581647, 0, 0.9333333, 1, 1,
-0.001312857, -0.08662346, -3.898757, 0, 0.9294118, 1, 1,
0.004749164, 0.4636642, -0.9538484, 0, 0.9215686, 1, 1,
0.006375267, 0.6679625, -0.6280532, 0, 0.9176471, 1, 1,
0.01093488, 0.5915337, 1.917053, 0, 0.9098039, 1, 1,
0.01295222, -0.3874074, 2.179822, 0, 0.9058824, 1, 1,
0.01335821, 0.831103, 0.866967, 0, 0.8980392, 1, 1,
0.01415267, 0.6683211, -0.1462792, 0, 0.8901961, 1, 1,
0.01783004, 2.296765, -0.1774199, 0, 0.8862745, 1, 1,
0.02009568, 0.3138915, -0.6475965, 0, 0.8784314, 1, 1,
0.02237502, 0.6407471, -0.7531874, 0, 0.8745098, 1, 1,
0.02594719, -1.251946, 1.890311, 0, 0.8666667, 1, 1,
0.02858146, 1.422364, 1.249588, 0, 0.8627451, 1, 1,
0.03031976, -1.887838, 4.390479, 0, 0.854902, 1, 1,
0.03312314, 0.6912833, 0.986878, 0, 0.8509804, 1, 1,
0.0333098, 0.4183505, -0.1407666, 0, 0.8431373, 1, 1,
0.04178556, -0.0294143, 3.459653, 0, 0.8392157, 1, 1,
0.0420338, 1.160946, 0.4319337, 0, 0.8313726, 1, 1,
0.04378578, 1.445063, 1.46177, 0, 0.827451, 1, 1,
0.04410267, 0.01821163, 0.7859737, 0, 0.8196079, 1, 1,
0.04591405, -1.69051, 2.370081, 0, 0.8156863, 1, 1,
0.04733791, -0.04170628, 2.644457, 0, 0.8078431, 1, 1,
0.04746041, -0.06821298, 3.302677, 0, 0.8039216, 1, 1,
0.0486477, -0.9973686, 1.962424, 0, 0.7960784, 1, 1,
0.05076904, 1.475547, 0.9883966, 0, 0.7882353, 1, 1,
0.05361991, -1.392983, 2.818382, 0, 0.7843137, 1, 1,
0.05465188, 0.5075672, 0.5255563, 0, 0.7764706, 1, 1,
0.06482772, -2.052822, 3.422693, 0, 0.772549, 1, 1,
0.06495693, 0.5230412, -0.8612913, 0, 0.7647059, 1, 1,
0.06659193, -0.9111998, 4.195285, 0, 0.7607843, 1, 1,
0.0687367, 1.827465, 0.1048154, 0, 0.7529412, 1, 1,
0.07015236, -0.4404877, 2.378202, 0, 0.7490196, 1, 1,
0.07145896, 0.04419048, 0.9180509, 0, 0.7411765, 1, 1,
0.07183293, 0.2204368, -0.8708097, 0, 0.7372549, 1, 1,
0.07484951, -0.2451036, 3.404146, 0, 0.7294118, 1, 1,
0.07565089, 1.085641, 1.527068, 0, 0.7254902, 1, 1,
0.08031174, 0.7436649, 0.3315753, 0, 0.7176471, 1, 1,
0.08508467, 0.7527528, 0.8222899, 0, 0.7137255, 1, 1,
0.08752859, -0.9007823, 4.611988, 0, 0.7058824, 1, 1,
0.08791391, -0.14872, 1.877073, 0, 0.6980392, 1, 1,
0.08881418, -0.1941674, 1.713351, 0, 0.6941177, 1, 1,
0.08938811, 2.10705, -1.297286, 0, 0.6862745, 1, 1,
0.09969135, -0.8827919, 1.932778, 0, 0.682353, 1, 1,
0.1003247, 0.7928073, 0.6654739, 0, 0.6745098, 1, 1,
0.1031387, -2.144788, 4.968684, 0, 0.6705883, 1, 1,
0.1067424, -0.5731689, 3.59322, 0, 0.6627451, 1, 1,
0.1101863, -1.291167, 2.317246, 0, 0.6588235, 1, 1,
0.1142539, 1.304832, -0.3364657, 0, 0.6509804, 1, 1,
0.1160658, -0.6826794, 2.311757, 0, 0.6470588, 1, 1,
0.1178174, -0.5802281, 2.167646, 0, 0.6392157, 1, 1,
0.1234805, 1.720251, 0.556757, 0, 0.6352941, 1, 1,
0.1236294, -0.8945697, 3.447468, 0, 0.627451, 1, 1,
0.1240356, -2.32545, 1.314495, 0, 0.6235294, 1, 1,
0.1256729, -0.7032261, 2.221177, 0, 0.6156863, 1, 1,
0.1294356, -0.8776513, 3.183707, 0, 0.6117647, 1, 1,
0.1375365, 0.1391, 0.6830174, 0, 0.6039216, 1, 1,
0.1377916, -2.867669, 3.709016, 0, 0.5960785, 1, 1,
0.1381186, -1.462734, 4.205778, 0, 0.5921569, 1, 1,
0.1397349, -1.948727, 1.763963, 0, 0.5843138, 1, 1,
0.1443822, 0.8174163, 0.7172116, 0, 0.5803922, 1, 1,
0.1446849, -1.084806, 3.207181, 0, 0.572549, 1, 1,
0.145603, -1.821319, 4.02285, 0, 0.5686275, 1, 1,
0.1479147, -0.27523, 3.964529, 0, 0.5607843, 1, 1,
0.1497055, 0.3543672, 0.9451663, 0, 0.5568628, 1, 1,
0.1497242, -0.3478409, 2.082549, 0, 0.5490196, 1, 1,
0.1519186, 0.09063853, -0.1959515, 0, 0.5450981, 1, 1,
0.1530032, 0.7957716, -0.8398767, 0, 0.5372549, 1, 1,
0.1541454, 1.126866, -0.06819241, 0, 0.5333334, 1, 1,
0.1553096, 0.7674606, -0.4005698, 0, 0.5254902, 1, 1,
0.157339, 0.1839954, 0.3122701, 0, 0.5215687, 1, 1,
0.160169, -0.6385508, 2.419731, 0, 0.5137255, 1, 1,
0.1645777, 2.076596, -1.155489, 0, 0.509804, 1, 1,
0.1679232, -1.741, 0.4988914, 0, 0.5019608, 1, 1,
0.1711052, 0.2593947, 0.5795373, 0, 0.4941176, 1, 1,
0.1713635, -1.023307, 2.144605, 0, 0.4901961, 1, 1,
0.1739954, -1.453765, 2.743312, 0, 0.4823529, 1, 1,
0.1756598, -1.014284, 2.75426, 0, 0.4784314, 1, 1,
0.175989, 0.5814421, 1.320018, 0, 0.4705882, 1, 1,
0.1776006, 0.8626091, -0.3957914, 0, 0.4666667, 1, 1,
0.1788008, -1.905516, 0.3892056, 0, 0.4588235, 1, 1,
0.1807491, -0.3019611, 0.9818733, 0, 0.454902, 1, 1,
0.190503, 0.07480557, 1.605629, 0, 0.4470588, 1, 1,
0.1923777, -0.7888106, 2.403823, 0, 0.4431373, 1, 1,
0.2028538, 0.5228493, -0.2630361, 0, 0.4352941, 1, 1,
0.2041071, -1.209718, 1.667211, 0, 0.4313726, 1, 1,
0.2061349, -0.2186825, 1.561543, 0, 0.4235294, 1, 1,
0.2073779, 2.207027, 2.193082, 0, 0.4196078, 1, 1,
0.209417, -0.6812392, 3.675835, 0, 0.4117647, 1, 1,
0.2147374, -0.302762, 4.288811, 0, 0.4078431, 1, 1,
0.2210316, 0.3469946, -1.03412, 0, 0.4, 1, 1,
0.2257051, 1.157038, -0.3570257, 0, 0.3921569, 1, 1,
0.2259549, 0.8293487, 0.4689257, 0, 0.3882353, 1, 1,
0.231268, -1.001157, 3.752352, 0, 0.3803922, 1, 1,
0.2323252, 0.9810166, 2.009909, 0, 0.3764706, 1, 1,
0.2382907, 0.3756435, 1.999285, 0, 0.3686275, 1, 1,
0.2399218, 0.5666909, 0.3024694, 0, 0.3647059, 1, 1,
0.2404053, 0.6515272, 0.4355908, 0, 0.3568628, 1, 1,
0.2422135, -1.935862, 2.798127, 0, 0.3529412, 1, 1,
0.2437137, -1.834084, 1.760759, 0, 0.345098, 1, 1,
0.2445504, 0.1806998, 2.480972, 0, 0.3411765, 1, 1,
0.2515734, 1.059908, -1.144157, 0, 0.3333333, 1, 1,
0.2519903, -0.02654038, 1.583231, 0, 0.3294118, 1, 1,
0.2554217, -0.3213212, 2.580948, 0, 0.3215686, 1, 1,
0.2561817, -1.774508, 2.233771, 0, 0.3176471, 1, 1,
0.2580089, -1.669914, 3.678089, 0, 0.3098039, 1, 1,
0.2586361, 0.1532429, 2.376122, 0, 0.3058824, 1, 1,
0.268498, 1.18039, 1.120112, 0, 0.2980392, 1, 1,
0.2723176, 2.247245, 0.1313393, 0, 0.2901961, 1, 1,
0.272872, 1.19561, 0.331618, 0, 0.2862745, 1, 1,
0.2742608, 0.3587595, 0.8326981, 0, 0.2784314, 1, 1,
0.276992, 0.2504697, 0.1966109, 0, 0.2745098, 1, 1,
0.277832, 0.6395423, 0.4154489, 0, 0.2666667, 1, 1,
0.278435, 2.814404, 1.329962, 0, 0.2627451, 1, 1,
0.2785943, 0.04986033, 2.544804, 0, 0.254902, 1, 1,
0.2836854, 0.2876237, 1.512492, 0, 0.2509804, 1, 1,
0.2859352, -1.269835, 3.376857, 0, 0.2431373, 1, 1,
0.2894073, -0.2353068, 0.8302262, 0, 0.2392157, 1, 1,
0.2897555, -1.100907, 3.494185, 0, 0.2313726, 1, 1,
0.2927743, 0.385468, 0.6870769, 0, 0.227451, 1, 1,
0.2953717, -1.056633, 1.389762, 0, 0.2196078, 1, 1,
0.2956498, -1.907038, 3.219588, 0, 0.2156863, 1, 1,
0.2988086, 0.3100481, 1.398481, 0, 0.2078431, 1, 1,
0.2995519, -0.1894938, 2.220314, 0, 0.2039216, 1, 1,
0.3097978, 0.7971811, 0.3306119, 0, 0.1960784, 1, 1,
0.3119871, -0.098999, 2.47528, 0, 0.1882353, 1, 1,
0.3145651, -0.2883068, 1.225412, 0, 0.1843137, 1, 1,
0.3153348, 1.056907, -0.7595113, 0, 0.1764706, 1, 1,
0.3208978, -0.5428107, 2.174361, 0, 0.172549, 1, 1,
0.3282643, -0.5364293, 1.438432, 0, 0.1647059, 1, 1,
0.3288442, -0.5464363, 3.910025, 0, 0.1607843, 1, 1,
0.3354925, -1.116228, 2.625866, 0, 0.1529412, 1, 1,
0.3354996, 1.877115, -0.02441538, 0, 0.1490196, 1, 1,
0.3359582, 0.2378611, 1.31482, 0, 0.1411765, 1, 1,
0.3387245, -0.2568952, 1.454827, 0, 0.1372549, 1, 1,
0.3407441, 0.8056818, 1.458665, 0, 0.1294118, 1, 1,
0.3488489, 0.2562524, 0.3275644, 0, 0.1254902, 1, 1,
0.3511014, -0.8551267, 3.554707, 0, 0.1176471, 1, 1,
0.3528504, 0.7019876, -1.006105, 0, 0.1137255, 1, 1,
0.3539126, 0.6137576, 0.903035, 0, 0.1058824, 1, 1,
0.3548174, 1.447097, 1.99051, 0, 0.09803922, 1, 1,
0.3573594, -0.4736319, 3.223156, 0, 0.09411765, 1, 1,
0.3581062, 0.5399194, -0.8000372, 0, 0.08627451, 1, 1,
0.3586843, -0.6630455, 1.304144, 0, 0.08235294, 1, 1,
0.3599176, -0.810482, 2.549828, 0, 0.07450981, 1, 1,
0.3601599, 0.8045099, 0.1966275, 0, 0.07058824, 1, 1,
0.3639715, 1.765975, -0.7799062, 0, 0.0627451, 1, 1,
0.3655156, -0.961559, 1.915832, 0, 0.05882353, 1, 1,
0.3703709, -0.8782997, 3.425282, 0, 0.05098039, 1, 1,
0.376784, 0.5286587, -1.337546, 0, 0.04705882, 1, 1,
0.3797776, -0.12811, 2.636854, 0, 0.03921569, 1, 1,
0.3804019, 0.1715908, 1.471463, 0, 0.03529412, 1, 1,
0.3821207, 0.4541813, 1.872165, 0, 0.02745098, 1, 1,
0.3852389, -0.6215675, 4.994672, 0, 0.02352941, 1, 1,
0.3949013, -1.230613, 4.126307, 0, 0.01568628, 1, 1,
0.4022489, 1.034629, -0.3067265, 0, 0.01176471, 1, 1,
0.4034425, -0.004286298, 2.373452, 0, 0.003921569, 1, 1,
0.4095892, 1.639326, 0.684145, 0.003921569, 0, 1, 1,
0.411033, 0.2878269, 0.1182994, 0.007843138, 0, 1, 1,
0.4119873, 1.140618, 1.435708, 0.01568628, 0, 1, 1,
0.4130793, -0.1323127, 1.780224, 0.01960784, 0, 1, 1,
0.4192796, -1.373563, 2.495352, 0.02745098, 0, 1, 1,
0.4283752, -0.9763442, 3.148577, 0.03137255, 0, 1, 1,
0.4344071, -0.9826553, 2.924987, 0.03921569, 0, 1, 1,
0.4350047, -0.5553476, 4.017066, 0.04313726, 0, 1, 1,
0.4385385, 0.7992058, 0.7420647, 0.05098039, 0, 1, 1,
0.4418188, -0.3352216, 2.419025, 0.05490196, 0, 1, 1,
0.4428176, -0.184175, 1.993155, 0.0627451, 0, 1, 1,
0.4460166, -0.6982192, 3.177908, 0.06666667, 0, 1, 1,
0.4503159, -0.4059025, 3.920643, 0.07450981, 0, 1, 1,
0.4510607, 0.4528199, -0.09762595, 0.07843138, 0, 1, 1,
0.455261, 0.1717718, 1.646611, 0.08627451, 0, 1, 1,
0.4568674, 1.005244, 0.7720038, 0.09019608, 0, 1, 1,
0.457913, -0.2583078, 1.775668, 0.09803922, 0, 1, 1,
0.4588097, 0.3813802, -1.147155, 0.1058824, 0, 1, 1,
0.4598389, -1.810135, 3.877862, 0.1098039, 0, 1, 1,
0.4708728, -1.21532, 3.202677, 0.1176471, 0, 1, 1,
0.472483, 0.2767824, 2.26761, 0.1215686, 0, 1, 1,
0.4829005, -0.8240327, 3.124707, 0.1294118, 0, 1, 1,
0.4852349, -0.4641759, 2.805617, 0.1333333, 0, 1, 1,
0.4853115, -0.4639685, 2.629695, 0.1411765, 0, 1, 1,
0.4915488, 1.028639, -0.8456149, 0.145098, 0, 1, 1,
0.491758, -1.668305, 3.49206, 0.1529412, 0, 1, 1,
0.4948848, -1.772535, 3.715385, 0.1568628, 0, 1, 1,
0.4974434, -1.617809, 1.912802, 0.1647059, 0, 1, 1,
0.4998716, -0.9973852, 2.458412, 0.1686275, 0, 1, 1,
0.5106897, 0.4818806, -0.08591223, 0.1764706, 0, 1, 1,
0.5107663, -1.909259, 2.307753, 0.1803922, 0, 1, 1,
0.5194536, 0.9271328, 0.9074758, 0.1882353, 0, 1, 1,
0.5217455, 0.7219655, 1.004631, 0.1921569, 0, 1, 1,
0.5221259, 0.1538859, 1.447479, 0.2, 0, 1, 1,
0.5222293, 0.3904655, 1.148478, 0.2078431, 0, 1, 1,
0.5229433, -1.302184, 2.818516, 0.2117647, 0, 1, 1,
0.5244113, -0.7164738, 1.491391, 0.2196078, 0, 1, 1,
0.5274552, -1.433216, 3.303894, 0.2235294, 0, 1, 1,
0.5374522, 1.833968, 0.1617496, 0.2313726, 0, 1, 1,
0.5379228, -1.527365, 2.608325, 0.2352941, 0, 1, 1,
0.5411159, 0.515511, 0.6438932, 0.2431373, 0, 1, 1,
0.5417593, 0.6284546, 2.180216, 0.2470588, 0, 1, 1,
0.5422725, 0.147923, 1.470656, 0.254902, 0, 1, 1,
0.5434231, -0.5008674, 2.513107, 0.2588235, 0, 1, 1,
0.5438042, 2.496022, 0.08417766, 0.2666667, 0, 1, 1,
0.5480066, 0.1667141, 1.354889, 0.2705882, 0, 1, 1,
0.5538754, -0.3526644, 3.281456, 0.2784314, 0, 1, 1,
0.5550641, 0.7833937, 0.3931058, 0.282353, 0, 1, 1,
0.5574614, 1.176803, -0.3491651, 0.2901961, 0, 1, 1,
0.5629387, -1.166476, 3.88146, 0.2941177, 0, 1, 1,
0.5639522, -0.9918681, 3.588715, 0.3019608, 0, 1, 1,
0.5643085, -0.9185928, 1.626927, 0.3098039, 0, 1, 1,
0.5672187, -0.09235407, 1.152652, 0.3137255, 0, 1, 1,
0.5714592, 1.004571, 0.7706413, 0.3215686, 0, 1, 1,
0.5773407, -0.968751, 4.09305, 0.3254902, 0, 1, 1,
0.5782236, 0.171912, 1.212631, 0.3333333, 0, 1, 1,
0.5798787, 0.8308192, 1.075061, 0.3372549, 0, 1, 1,
0.5834537, 0.5413431, -0.09405634, 0.345098, 0, 1, 1,
0.5835968, -0.4123311, 1.707804, 0.3490196, 0, 1, 1,
0.5870337, -0.01581578, 1.863665, 0.3568628, 0, 1, 1,
0.5901895, 1.638146, 1.265495, 0.3607843, 0, 1, 1,
0.5936105, 0.9870744, 1.783329, 0.3686275, 0, 1, 1,
0.5989581, -1.184185, 1.132976, 0.372549, 0, 1, 1,
0.6023858, 1.068321, 1.30519, 0.3803922, 0, 1, 1,
0.6030481, -0.1095974, 2.367771, 0.3843137, 0, 1, 1,
0.6055635, -0.6138748, 2.901637, 0.3921569, 0, 1, 1,
0.6074048, 0.3022055, 1.044672, 0.3960784, 0, 1, 1,
0.6149754, 0.6026614, 0.5059478, 0.4039216, 0, 1, 1,
0.6169849, -0.03772014, 1.111932, 0.4117647, 0, 1, 1,
0.6299253, -0.07779181, 3.598451, 0.4156863, 0, 1, 1,
0.6349292, -0.3445955, 3.002418, 0.4235294, 0, 1, 1,
0.6374214, -0.02813169, 2.7938, 0.427451, 0, 1, 1,
0.6380442, 1.799169, 0.45362, 0.4352941, 0, 1, 1,
0.639843, -0.1608718, 1.307347, 0.4392157, 0, 1, 1,
0.6402006, 0.2017561, -0.8175296, 0.4470588, 0, 1, 1,
0.6402477, 0.6353969, -1.415215, 0.4509804, 0, 1, 1,
0.6407047, 0.787299, 0.758477, 0.4588235, 0, 1, 1,
0.6535334, 0.267632, 1.980398, 0.4627451, 0, 1, 1,
0.6601316, -0.05743385, 0.6978078, 0.4705882, 0, 1, 1,
0.6620796, 0.4520754, 1.607605, 0.4745098, 0, 1, 1,
0.6632969, 0.7015595, 0.6332259, 0.4823529, 0, 1, 1,
0.6648217, -0.1504915, 1.77616, 0.4862745, 0, 1, 1,
0.6664717, 0.3696301, 1.856755, 0.4941176, 0, 1, 1,
0.6699814, -0.2242783, 2.970479, 0.5019608, 0, 1, 1,
0.6737241, -0.1989704, 3.123159, 0.5058824, 0, 1, 1,
0.6755862, -0.0847229, 0.6142449, 0.5137255, 0, 1, 1,
0.6769428, 0.828118, 1.748341, 0.5176471, 0, 1, 1,
0.6801387, 0.2497141, 1.217228, 0.5254902, 0, 1, 1,
0.6822932, -0.05771066, 2.692316, 0.5294118, 0, 1, 1,
0.6842234, 0.4782535, 1.062807, 0.5372549, 0, 1, 1,
0.6869238, -0.3079021, -0.1166953, 0.5411765, 0, 1, 1,
0.6933416, -0.5141171, 1.376432, 0.5490196, 0, 1, 1,
0.693607, 1.346388, 0.2481245, 0.5529412, 0, 1, 1,
0.6944431, -1.81635, 3.414447, 0.5607843, 0, 1, 1,
0.6969852, 0.6020269, 0.6671926, 0.5647059, 0, 1, 1,
0.6987808, 1.668475, 1.238816, 0.572549, 0, 1, 1,
0.7027324, -0.9493705, 2.521015, 0.5764706, 0, 1, 1,
0.7033387, -0.02557312, 2.05914, 0.5843138, 0, 1, 1,
0.7129482, -0.1969992, -0.03573013, 0.5882353, 0, 1, 1,
0.7131941, 1.945773, 0.2895589, 0.5960785, 0, 1, 1,
0.7140974, 0.2280975, -0.3159192, 0.6039216, 0, 1, 1,
0.717022, 0.2445723, 3.322992, 0.6078432, 0, 1, 1,
0.7257407, 0.3198311, 0.8521676, 0.6156863, 0, 1, 1,
0.7272379, -0.597119, 1.713508, 0.6196079, 0, 1, 1,
0.7348862, 2.562781, 0.7563428, 0.627451, 0, 1, 1,
0.7374498, -1.269156, 2.08594, 0.6313726, 0, 1, 1,
0.7375357, -0.759537, 2.270447, 0.6392157, 0, 1, 1,
0.7399865, -1.636052, 3.453263, 0.6431373, 0, 1, 1,
0.7406541, 0.9705166, 1.161741, 0.6509804, 0, 1, 1,
0.7481467, 0.6143283, -0.6398641, 0.654902, 0, 1, 1,
0.7484014, -0.004773452, 1.727885, 0.6627451, 0, 1, 1,
0.7517688, 0.6042274, 2.898769, 0.6666667, 0, 1, 1,
0.7594986, -0.9760247, 2.944968, 0.6745098, 0, 1, 1,
0.7619373, -0.0435812, 3.036524, 0.6784314, 0, 1, 1,
0.7676533, 0.7805687, 1.25611, 0.6862745, 0, 1, 1,
0.7678083, -1.95702, 2.883533, 0.6901961, 0, 1, 1,
0.7696659, 0.5711436, 1.400982, 0.6980392, 0, 1, 1,
0.7699485, 0.7361578, 0.0777413, 0.7058824, 0, 1, 1,
0.7719494, -0.2200822, 3.506185, 0.7098039, 0, 1, 1,
0.7722486, 0.3762195, 0.4505994, 0.7176471, 0, 1, 1,
0.7890831, -1.471367, 1.72539, 0.7215686, 0, 1, 1,
0.7897484, 0.7334698, 0.2836952, 0.7294118, 0, 1, 1,
0.7977032, 0.8430696, -0.6992893, 0.7333333, 0, 1, 1,
0.8007565, -2.168871, 2.994316, 0.7411765, 0, 1, 1,
0.8085919, 0.5218937, 2.171892, 0.7450981, 0, 1, 1,
0.813108, 0.07869291, -0.4640502, 0.7529412, 0, 1, 1,
0.8139161, -0.7131332, 2.217594, 0.7568628, 0, 1, 1,
0.8143107, -0.588851, 3.947073, 0.7647059, 0, 1, 1,
0.8172176, -0.572272, 0.516843, 0.7686275, 0, 1, 1,
0.8173169, 0.6367622, -0.7178501, 0.7764706, 0, 1, 1,
0.8173903, -0.3088748, 0.99837, 0.7803922, 0, 1, 1,
0.8285587, -0.0400205, 1.769025, 0.7882353, 0, 1, 1,
0.8437072, 0.3069369, 3.387495, 0.7921569, 0, 1, 1,
0.853104, -0.7229372, 1.392659, 0.8, 0, 1, 1,
0.8606231, -1.627435, 2.151744, 0.8078431, 0, 1, 1,
0.8623561, 0.1958527, 2.555641, 0.8117647, 0, 1, 1,
0.86476, -0.636584, 0.8833382, 0.8196079, 0, 1, 1,
0.8669286, -0.5099081, 1.612217, 0.8235294, 0, 1, 1,
0.8704713, -1.505553, 4.000089, 0.8313726, 0, 1, 1,
0.8726228, -1.564385, 2.989602, 0.8352941, 0, 1, 1,
0.8735173, -0.4200494, 2.24418, 0.8431373, 0, 1, 1,
0.8747492, -0.3776107, 2.679681, 0.8470588, 0, 1, 1,
0.8760186, -0.6196322, 4.048028, 0.854902, 0, 1, 1,
0.8781785, 0.6811519, 0.5685142, 0.8588235, 0, 1, 1,
0.8811916, 0.4318978, 1.607228, 0.8666667, 0, 1, 1,
0.8856985, -0.9980603, 1.086472, 0.8705882, 0, 1, 1,
0.8880016, -0.3476822, 2.117874, 0.8784314, 0, 1, 1,
0.8935851, -0.721983, 1.143154, 0.8823529, 0, 1, 1,
0.8943686, -0.5883722, -0.5754202, 0.8901961, 0, 1, 1,
0.9007619, 2.101146, 1.446276, 0.8941177, 0, 1, 1,
0.90154, 0.1864904, 0.4304381, 0.9019608, 0, 1, 1,
0.9025176, -0.4687071, 2.742301, 0.9098039, 0, 1, 1,
0.9175516, 1.947035, -0.5476502, 0.9137255, 0, 1, 1,
0.9175706, -0.659866, 3.529251, 0.9215686, 0, 1, 1,
0.9194447, -0.04360173, 2.68246, 0.9254902, 0, 1, 1,
0.9204826, -1.123477, 1.336607, 0.9333333, 0, 1, 1,
0.9290158, -0.03080411, 0.6232543, 0.9372549, 0, 1, 1,
0.9387467, 0.5205466, 1.687541, 0.945098, 0, 1, 1,
0.939212, 1.29461, 0.7859933, 0.9490196, 0, 1, 1,
0.9408246, 0.1820516, 0.7904323, 0.9568627, 0, 1, 1,
0.946868, 0.621012, 1.511588, 0.9607843, 0, 1, 1,
0.9472504, -0.6245016, 2.310488, 0.9686275, 0, 1, 1,
0.9473591, -0.8237612, 2.088027, 0.972549, 0, 1, 1,
0.9476956, -0.3640251, 0.1996768, 0.9803922, 0, 1, 1,
0.9505527, 0.4014792, 0.5325198, 0.9843137, 0, 1, 1,
0.9508346, 0.6532874, 1.323598, 0.9921569, 0, 1, 1,
0.9513716, 0.8679295, 1.307595, 0.9960784, 0, 1, 1,
0.9578457, 1.977271, 0.129404, 1, 0, 0.9960784, 1,
0.9592506, -0.8906474, 3.665789, 1, 0, 0.9882353, 1,
0.9611129, -1.380842, 2.99053, 1, 0, 0.9843137, 1,
0.9635365, 0.3599544, 1.624757, 1, 0, 0.9764706, 1,
0.9696782, 0.2385841, 1.523759, 1, 0, 0.972549, 1,
0.9715582, -0.8317739, 1.813354, 1, 0, 0.9647059, 1,
0.972277, 1.108657, 0.5388849, 1, 0, 0.9607843, 1,
0.9786191, -0.5598781, 0.91838, 1, 0, 0.9529412, 1,
0.9791455, 1.750326, -0.6213578, 1, 0, 0.9490196, 1,
0.9802069, 0.1703483, 1.02661, 1, 0, 0.9411765, 1,
0.9829956, -0.7990181, 1.84961, 1, 0, 0.9372549, 1,
0.9863814, 2.502436, 1.090255, 1, 0, 0.9294118, 1,
0.9871601, -0.6257334, 1.140644, 1, 0, 0.9254902, 1,
0.9888031, 0.3382113, 0.1130191, 1, 0, 0.9176471, 1,
0.9944541, -0.07378446, 1.047229, 1, 0, 0.9137255, 1,
0.999049, -1.91118, 2.455173, 1, 0, 0.9058824, 1,
1.004845, 0.5995501, 1.181282, 1, 0, 0.9019608, 1,
1.005468, 1.073774, 0.3287328, 1, 0, 0.8941177, 1,
1.006655, 0.5080891, 2.130678, 1, 0, 0.8862745, 1,
1.00671, 2.49582, -0.2707695, 1, 0, 0.8823529, 1,
1.009212, 0.1365817, 1.335196, 1, 0, 0.8745098, 1,
1.009223, -1.352746, 2.505646, 1, 0, 0.8705882, 1,
1.020093, 0.03224465, 1.496503, 1, 0, 0.8627451, 1,
1.021276, -0.2186717, 1.792522, 1, 0, 0.8588235, 1,
1.022967, 0.2359479, 2.051502, 1, 0, 0.8509804, 1,
1.034797, 0.7428994, 0.4925394, 1, 0, 0.8470588, 1,
1.036043, -0.6202683, 2.890992, 1, 0, 0.8392157, 1,
1.038092, -2.338594, 2.938957, 1, 0, 0.8352941, 1,
1.041165, 0.481516, 1.205929, 1, 0, 0.827451, 1,
1.044976, -0.3764706, 2.123346, 1, 0, 0.8235294, 1,
1.045486, -1.258439, 0.2733028, 1, 0, 0.8156863, 1,
1.047222, 0.6596916, 1.939783, 1, 0, 0.8117647, 1,
1.056828, 1.016087, -0.3399235, 1, 0, 0.8039216, 1,
1.077896, 2.726531, 0.3107102, 1, 0, 0.7960784, 1,
1.081365, 0.3882343, -0.03280484, 1, 0, 0.7921569, 1,
1.08655, -1.196885, 1.26222, 1, 0, 0.7843137, 1,
1.089948, 0.9748707, 0.8985248, 1, 0, 0.7803922, 1,
1.093059, -2.154046, 2.942564, 1, 0, 0.772549, 1,
1.098492, 0.2191892, 2.159599, 1, 0, 0.7686275, 1,
1.103542, 1.268345, 2.375381, 1, 0, 0.7607843, 1,
1.110771, 0.5472356, 0.2749981, 1, 0, 0.7568628, 1,
1.115688, -0.6871982, 1.628723, 1, 0, 0.7490196, 1,
1.116959, 0.3469148, 1.466804, 1, 0, 0.7450981, 1,
1.121537, -1.944005, 4.366638, 1, 0, 0.7372549, 1,
1.124161, 0.7029312, 1.239096, 1, 0, 0.7333333, 1,
1.128035, 1.831077, 1.292872, 1, 0, 0.7254902, 1,
1.131067, 0.01483247, 2.37521, 1, 0, 0.7215686, 1,
1.134245, -0.5351275, 0.242656, 1, 0, 0.7137255, 1,
1.138751, 0.7302092, 1.303455, 1, 0, 0.7098039, 1,
1.147273, -0.6742392, 2.609359, 1, 0, 0.7019608, 1,
1.156449, -1.140247, 0.9909138, 1, 0, 0.6941177, 1,
1.158105, 1.709031, -0.6940181, 1, 0, 0.6901961, 1,
1.164343, -1.438943, 0.7969097, 1, 0, 0.682353, 1,
1.171827, 0.9378832, -0.8755251, 1, 0, 0.6784314, 1,
1.188615, -1.450199, 3.167866, 1, 0, 0.6705883, 1,
1.188964, 0.1931422, 1.60528, 1, 0, 0.6666667, 1,
1.197595, 1.558101, -0.1996538, 1, 0, 0.6588235, 1,
1.202267, 0.1627924, 2.845825, 1, 0, 0.654902, 1,
1.211312, -1.027134, -0.371583, 1, 0, 0.6470588, 1,
1.216937, -1.390902, 0.9622797, 1, 0, 0.6431373, 1,
1.224446, -0.6367549, 2.403232, 1, 0, 0.6352941, 1,
1.227808, 0.05131929, 0.7510713, 1, 0, 0.6313726, 1,
1.254173, -0.06802345, 2.290683, 1, 0, 0.6235294, 1,
1.258497, 0.9312491, 0.4478268, 1, 0, 0.6196079, 1,
1.262169, -1.166854, 1.261731, 1, 0, 0.6117647, 1,
1.274111, 1.865955, -0.907886, 1, 0, 0.6078432, 1,
1.282091, -0.4307885, 2.011324, 1, 0, 0.6, 1,
1.283707, -0.008336852, 2.866646, 1, 0, 0.5921569, 1,
1.287541, 0.2469185, 0.8019977, 1, 0, 0.5882353, 1,
1.323756, -1.225675, 3.525218, 1, 0, 0.5803922, 1,
1.326387, 0.02599478, 1.125511, 1, 0, 0.5764706, 1,
1.334427, 0.07817288, 3.41196, 1, 0, 0.5686275, 1,
1.335343, 0.9106963, 1.717247, 1, 0, 0.5647059, 1,
1.33784, 0.8201376, 0.4572724, 1, 0, 0.5568628, 1,
1.33813, 0.2482162, 0.5983327, 1, 0, 0.5529412, 1,
1.346089, -0.6408426, 2.198119, 1, 0, 0.5450981, 1,
1.358021, 2.130339, -3.138809, 1, 0, 0.5411765, 1,
1.368356, 0.05351694, 0.4256709, 1, 0, 0.5333334, 1,
1.374239, 0.4872429, 0.6505308, 1, 0, 0.5294118, 1,
1.378036, -0.1717722, 2.970839, 1, 0, 0.5215687, 1,
1.378899, -0.5381636, 1.350445, 1, 0, 0.5176471, 1,
1.392347, -1.88006, 2.357446, 1, 0, 0.509804, 1,
1.41404, 1.127971, 1.724689, 1, 0, 0.5058824, 1,
1.419512, 0.8104093, 0.9172631, 1, 0, 0.4980392, 1,
1.422985, -0.8190646, 3.070793, 1, 0, 0.4901961, 1,
1.437859, -2.205387, 1.858885, 1, 0, 0.4862745, 1,
1.441501, 0.8799347, 1.642041, 1, 0, 0.4784314, 1,
1.457282, -0.7178066, 2.633568, 1, 0, 0.4745098, 1,
1.459728, -0.9293634, 3.608497, 1, 0, 0.4666667, 1,
1.496974, -0.5978059, 2.505447, 1, 0, 0.4627451, 1,
1.505117, -0.6541475, 1.165396, 1, 0, 0.454902, 1,
1.51431, 0.6594509, 2.198332, 1, 0, 0.4509804, 1,
1.528833, -2.484829, 3.331711, 1, 0, 0.4431373, 1,
1.529842, 1.110099, 2.188001, 1, 0, 0.4392157, 1,
1.553395, -1.312118, 3.85475, 1, 0, 0.4313726, 1,
1.576443, 0.4816242, 1.946784, 1, 0, 0.427451, 1,
1.585307, 1.050979, 0.3713071, 1, 0, 0.4196078, 1,
1.600727, -1.395509, 2.149687, 1, 0, 0.4156863, 1,
1.60089, 0.440971, 1.809561, 1, 0, 0.4078431, 1,
1.614123, -0.3852306, 0.8581577, 1, 0, 0.4039216, 1,
1.619856, -0.508245, 3.238185, 1, 0, 0.3960784, 1,
1.643173, -1.82749, 2.356459, 1, 0, 0.3882353, 1,
1.654582, 1.335688, 1.498259, 1, 0, 0.3843137, 1,
1.659576, 0.7979099, 1.741157, 1, 0, 0.3764706, 1,
1.660735, -2.12782, 1.360275, 1, 0, 0.372549, 1,
1.663489, -1.099096, 2.81002, 1, 0, 0.3647059, 1,
1.669096, -1.620156, 1.888718, 1, 0, 0.3607843, 1,
1.674722, 0.105014, 0.6819603, 1, 0, 0.3529412, 1,
1.675683, -0.08202581, -0.03310777, 1, 0, 0.3490196, 1,
1.678027, 0.1088153, 0.1263603, 1, 0, 0.3411765, 1,
1.681645, 2.059101, -0.2588766, 1, 0, 0.3372549, 1,
1.681647, 0.6443716, 2.406132, 1, 0, 0.3294118, 1,
1.686547, -0.7399756, 2.981428, 1, 0, 0.3254902, 1,
1.693269, -1.233462, 2.556123, 1, 0, 0.3176471, 1,
1.69379, 0.6628714, 3.519448, 1, 0, 0.3137255, 1,
1.701251, -0.1394162, 1.831969, 1, 0, 0.3058824, 1,
1.717494, 1.735909, 2.250542, 1, 0, 0.2980392, 1,
1.726506, 0.07590994, 2.424181, 1, 0, 0.2941177, 1,
1.731906, -0.7055146, 2.364923, 1, 0, 0.2862745, 1,
1.745178, 2.005048, 1.701281, 1, 0, 0.282353, 1,
1.745523, 0.8796322, 1.179218, 1, 0, 0.2745098, 1,
1.764425, -0.2846621, 0.2622634, 1, 0, 0.2705882, 1,
1.767957, 0.8574246, 2.449891, 1, 0, 0.2627451, 1,
1.785619, -0.1324452, 1.376734, 1, 0, 0.2588235, 1,
1.792454, 1.290399, -0.1443641, 1, 0, 0.2509804, 1,
1.795002, -1.299432, 0.6108888, 1, 0, 0.2470588, 1,
1.796022, -0.64432, 4.883946, 1, 0, 0.2392157, 1,
1.803753, 0.4344848, 1.263897, 1, 0, 0.2352941, 1,
1.829022, -2.664658, 4.844702, 1, 0, 0.227451, 1,
1.831074, 1.688285, 1.793493, 1, 0, 0.2235294, 1,
1.837938, 0.5353165, 2.016592, 1, 0, 0.2156863, 1,
1.856357, -0.3793532, 2.237904, 1, 0, 0.2117647, 1,
1.863325, 0.09949932, 2.089538, 1, 0, 0.2039216, 1,
1.871076, -2.778154, 1.411971, 1, 0, 0.1960784, 1,
1.875609, 0.2720317, 2.944752, 1, 0, 0.1921569, 1,
1.888645, -1.782154, 1.131334, 1, 0, 0.1843137, 1,
1.91748, 0.166086, 0.2822974, 1, 0, 0.1803922, 1,
1.921376, 1.845581, -0.3673226, 1, 0, 0.172549, 1,
1.932707, -0.3580853, 2.401605, 1, 0, 0.1686275, 1,
1.93277, -1.309264, 0.4209294, 1, 0, 0.1607843, 1,
1.952924, 1.051038, 0.4905623, 1, 0, 0.1568628, 1,
1.963507, 1.057655, 0.9031911, 1, 0, 0.1490196, 1,
1.969862, -0.3537381, 3.175649, 1, 0, 0.145098, 1,
1.988458, 0.178171, 0.5470305, 1, 0, 0.1372549, 1,
2.034027, 1.012623, 0.8634737, 1, 0, 0.1333333, 1,
2.035424, 0.3440601, 2.466839, 1, 0, 0.1254902, 1,
2.043615, -0.2960975, 1.453935, 1, 0, 0.1215686, 1,
2.076367, -0.5341161, 1.070633, 1, 0, 0.1137255, 1,
2.08387, 1.008001, -0.614943, 1, 0, 0.1098039, 1,
2.084188, 1.567314, 1.083824, 1, 0, 0.1019608, 1,
2.111057, -0.673633, 2.088984, 1, 0, 0.09411765, 1,
2.158354, -1.089201, 3.020505, 1, 0, 0.09019608, 1,
2.160873, -0.7863148, 2.322553, 1, 0, 0.08235294, 1,
2.179223, 1.168125, 1.637843, 1, 0, 0.07843138, 1,
2.202247, -0.5526044, 2.415253, 1, 0, 0.07058824, 1,
2.251707, -0.4100363, 1.436396, 1, 0, 0.06666667, 1,
2.261917, -0.379917, 2.637994, 1, 0, 0.05882353, 1,
2.306805, 0.5841705, 1.727029, 1, 0, 0.05490196, 1,
2.361481, -1.250512, 3.10618, 1, 0, 0.04705882, 1,
2.37123, 0.3989865, 3.366203, 1, 0, 0.04313726, 1,
2.400281, 2.073343, 1.615117, 1, 0, 0.03529412, 1,
2.451386, 0.2729304, 1.601996, 1, 0, 0.03137255, 1,
2.51604, -0.4111776, 0.9435873, 1, 0, 0.02352941, 1,
2.546581, -1.394807, 1.197609, 1, 0, 0.01960784, 1,
2.879029, 0.3958919, 0.7225501, 1, 0, 0.01176471, 1,
3.26933, -0.4210513, 2.624385, 1, 0, 0.007843138, 1
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
-0.05989885, -4.815383, -7.418079, 0, -0.5, 0.5, 0.5,
-0.05989885, -4.815383, -7.418079, 1, -0.5, 0.5, 0.5,
-0.05989885, -4.815383, -7.418079, 1, 1.5, 0.5, 0.5,
-0.05989885, -4.815383, -7.418079, 0, 1.5, 0.5, 0.5
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
-4.517736, -0.4441223, -7.418079, 0, -0.5, 0.5, 0.5,
-4.517736, -0.4441223, -7.418079, 1, -0.5, 0.5, 0.5,
-4.517736, -0.4441223, -7.418079, 1, 1.5, 0.5, 0.5,
-4.517736, -0.4441223, -7.418079, 0, 1.5, 0.5, 0.5
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
-4.517736, -4.815383, -0.3121905, 0, -0.5, 0.5, 0.5,
-4.517736, -4.815383, -0.3121905, 1, -0.5, 0.5, 0.5,
-4.517736, -4.815383, -0.3121905, 1, 1.5, 0.5, 0.5,
-4.517736, -4.815383, -0.3121905, 0, 1.5, 0.5, 0.5
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
-3, -3.806631, -5.778259,
3, -3.806631, -5.778259,
-3, -3.806631, -5.778259,
-3, -3.974756, -6.051562,
-2, -3.806631, -5.778259,
-2, -3.974756, -6.051562,
-1, -3.806631, -5.778259,
-1, -3.974756, -6.051562,
0, -3.806631, -5.778259,
0, -3.974756, -6.051562,
1, -3.806631, -5.778259,
1, -3.974756, -6.051562,
2, -3.806631, -5.778259,
2, -3.974756, -6.051562,
3, -3.806631, -5.778259,
3, -3.974756, -6.051562
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
-3, -4.311007, -6.598169, 0, -0.5, 0.5, 0.5,
-3, -4.311007, -6.598169, 1, -0.5, 0.5, 0.5,
-3, -4.311007, -6.598169, 1, 1.5, 0.5, 0.5,
-3, -4.311007, -6.598169, 0, 1.5, 0.5, 0.5,
-2, -4.311007, -6.598169, 0, -0.5, 0.5, 0.5,
-2, -4.311007, -6.598169, 1, -0.5, 0.5, 0.5,
-2, -4.311007, -6.598169, 1, 1.5, 0.5, 0.5,
-2, -4.311007, -6.598169, 0, 1.5, 0.5, 0.5,
-1, -4.311007, -6.598169, 0, -0.5, 0.5, 0.5,
-1, -4.311007, -6.598169, 1, -0.5, 0.5, 0.5,
-1, -4.311007, -6.598169, 1, 1.5, 0.5, 0.5,
-1, -4.311007, -6.598169, 0, 1.5, 0.5, 0.5,
0, -4.311007, -6.598169, 0, -0.5, 0.5, 0.5,
0, -4.311007, -6.598169, 1, -0.5, 0.5, 0.5,
0, -4.311007, -6.598169, 1, 1.5, 0.5, 0.5,
0, -4.311007, -6.598169, 0, 1.5, 0.5, 0.5,
1, -4.311007, -6.598169, 0, -0.5, 0.5, 0.5,
1, -4.311007, -6.598169, 1, -0.5, 0.5, 0.5,
1, -4.311007, -6.598169, 1, 1.5, 0.5, 0.5,
1, -4.311007, -6.598169, 0, 1.5, 0.5, 0.5,
2, -4.311007, -6.598169, 0, -0.5, 0.5, 0.5,
2, -4.311007, -6.598169, 1, -0.5, 0.5, 0.5,
2, -4.311007, -6.598169, 1, 1.5, 0.5, 0.5,
2, -4.311007, -6.598169, 0, 1.5, 0.5, 0.5,
3, -4.311007, -6.598169, 0, -0.5, 0.5, 0.5,
3, -4.311007, -6.598169, 1, -0.5, 0.5, 0.5,
3, -4.311007, -6.598169, 1, 1.5, 0.5, 0.5,
3, -4.311007, -6.598169, 0, 1.5, 0.5, 0.5
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
-3.489005, -3, -5.778259,
-3.489005, 2, -5.778259,
-3.489005, -3, -5.778259,
-3.66046, -3, -6.051562,
-3.489005, -2, -5.778259,
-3.66046, -2, -6.051562,
-3.489005, -1, -5.778259,
-3.66046, -1, -6.051562,
-3.489005, 0, -5.778259,
-3.66046, 0, -6.051562,
-3.489005, 1, -5.778259,
-3.66046, 1, -6.051562,
-3.489005, 2, -5.778259,
-3.66046, 2, -6.051562
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
-4.00337, -3, -6.598169, 0, -0.5, 0.5, 0.5,
-4.00337, -3, -6.598169, 1, -0.5, 0.5, 0.5,
-4.00337, -3, -6.598169, 1, 1.5, 0.5, 0.5,
-4.00337, -3, -6.598169, 0, 1.5, 0.5, 0.5,
-4.00337, -2, -6.598169, 0, -0.5, 0.5, 0.5,
-4.00337, -2, -6.598169, 1, -0.5, 0.5, 0.5,
-4.00337, -2, -6.598169, 1, 1.5, 0.5, 0.5,
-4.00337, -2, -6.598169, 0, 1.5, 0.5, 0.5,
-4.00337, -1, -6.598169, 0, -0.5, 0.5, 0.5,
-4.00337, -1, -6.598169, 1, -0.5, 0.5, 0.5,
-4.00337, -1, -6.598169, 1, 1.5, 0.5, 0.5,
-4.00337, -1, -6.598169, 0, 1.5, 0.5, 0.5,
-4.00337, 0, -6.598169, 0, -0.5, 0.5, 0.5,
-4.00337, 0, -6.598169, 1, -0.5, 0.5, 0.5,
-4.00337, 0, -6.598169, 1, 1.5, 0.5, 0.5,
-4.00337, 0, -6.598169, 0, 1.5, 0.5, 0.5,
-4.00337, 1, -6.598169, 0, -0.5, 0.5, 0.5,
-4.00337, 1, -6.598169, 1, -0.5, 0.5, 0.5,
-4.00337, 1, -6.598169, 1, 1.5, 0.5, 0.5,
-4.00337, 1, -6.598169, 0, 1.5, 0.5, 0.5,
-4.00337, 2, -6.598169, 0, -0.5, 0.5, 0.5,
-4.00337, 2, -6.598169, 1, -0.5, 0.5, 0.5,
-4.00337, 2, -6.598169, 1, 1.5, 0.5, 0.5,
-4.00337, 2, -6.598169, 0, 1.5, 0.5, 0.5
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
-3.489005, -3.806631, -4,
-3.489005, -3.806631, 4,
-3.489005, -3.806631, -4,
-3.66046, -3.974756, -4,
-3.489005, -3.806631, -2,
-3.66046, -3.974756, -2,
-3.489005, -3.806631, 0,
-3.66046, -3.974756, 0,
-3.489005, -3.806631, 2,
-3.66046, -3.974756, 2,
-3.489005, -3.806631, 4,
-3.66046, -3.974756, 4
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
-4.00337, -4.311007, -4, 0, -0.5, 0.5, 0.5,
-4.00337, -4.311007, -4, 1, -0.5, 0.5, 0.5,
-4.00337, -4.311007, -4, 1, 1.5, 0.5, 0.5,
-4.00337, -4.311007, -4, 0, 1.5, 0.5, 0.5,
-4.00337, -4.311007, -2, 0, -0.5, 0.5, 0.5,
-4.00337, -4.311007, -2, 1, -0.5, 0.5, 0.5,
-4.00337, -4.311007, -2, 1, 1.5, 0.5, 0.5,
-4.00337, -4.311007, -2, 0, 1.5, 0.5, 0.5,
-4.00337, -4.311007, 0, 0, -0.5, 0.5, 0.5,
-4.00337, -4.311007, 0, 1, -0.5, 0.5, 0.5,
-4.00337, -4.311007, 0, 1, 1.5, 0.5, 0.5,
-4.00337, -4.311007, 0, 0, 1.5, 0.5, 0.5,
-4.00337, -4.311007, 2, 0, -0.5, 0.5, 0.5,
-4.00337, -4.311007, 2, 1, -0.5, 0.5, 0.5,
-4.00337, -4.311007, 2, 1, 1.5, 0.5, 0.5,
-4.00337, -4.311007, 2, 0, 1.5, 0.5, 0.5,
-4.00337, -4.311007, 4, 0, -0.5, 0.5, 0.5,
-4.00337, -4.311007, 4, 1, -0.5, 0.5, 0.5,
-4.00337, -4.311007, 4, 1, 1.5, 0.5, 0.5,
-4.00337, -4.311007, 4, 0, 1.5, 0.5, 0.5
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
-3.489005, -3.806631, -5.778259,
-3.489005, 2.918386, -5.778259,
-3.489005, -3.806631, 5.153878,
-3.489005, 2.918386, 5.153878,
-3.489005, -3.806631, -5.778259,
-3.489005, -3.806631, 5.153878,
-3.489005, 2.918386, -5.778259,
-3.489005, 2.918386, 5.153878,
-3.489005, -3.806631, -5.778259,
3.369207, -3.806631, -5.778259,
-3.489005, -3.806631, 5.153878,
3.369207, -3.806631, 5.153878,
-3.489005, 2.918386, -5.778259,
3.369207, 2.918386, -5.778259,
-3.489005, 2.918386, 5.153878,
3.369207, 2.918386, 5.153878,
3.369207, -3.806631, -5.778259,
3.369207, 2.918386, -5.778259,
3.369207, -3.806631, 5.153878,
3.369207, 2.918386, 5.153878,
3.369207, -3.806631, -5.778259,
3.369207, -3.806631, 5.153878,
3.369207, 2.918386, -5.778259,
3.369207, 2.918386, 5.153878
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
var radius = 7.770702;
var distance = 34.57273;
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
mvMatrix.translate( 0.05989885, 0.4441223, 0.3121905 );
mvMatrix.scale( 1.225077, 1.24934, 0.7685447 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.57273);
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
Diphenylketon<-read.table("Diphenylketon.xyz")
```

```
## Error in read.table("Diphenylketon.xyz"): no lines available in input
```

```r
x<-Diphenylketon$V2
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylketon' not found
```

```r
y<-Diphenylketon$V3
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylketon' not found
```

```r
z<-Diphenylketon$V4
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylketon' not found
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
-3.389128, 0.5886758, -0.5253499, 0, 0, 1, 1, 1,
-3.135753, 0.06187933, -2.105506, 1, 0, 0, 1, 1,
-2.947292, 0.2763735, -1.018715, 1, 0, 0, 1, 1,
-2.892312, -0.2708703, -0.997872, 1, 0, 0, 1, 1,
-2.697483, -0.5441791, -2.866841, 1, 0, 0, 1, 1,
-2.610433, -0.4142976, -1.877992, 1, 0, 0, 1, 1,
-2.608883, 0.3039322, -3.065221, 0, 0, 0, 1, 1,
-2.527426, -0.5405253, -0.8965302, 0, 0, 0, 1, 1,
-2.493438, -0.18061, -2.668869, 0, 0, 0, 1, 1,
-2.474194, -0.9221714, -1.600829, 0, 0, 0, 1, 1,
-2.419248, 1.169796, -0.4166458, 0, 0, 0, 1, 1,
-2.366469, 1.448196, -1.184651, 0, 0, 0, 1, 1,
-2.308258, 0.2654516, 0.4511614, 0, 0, 0, 1, 1,
-2.280398, 1.238379, -0.9371159, 1, 1, 1, 1, 1,
-2.232066, 0.8226098, -0.7489369, 1, 1, 1, 1, 1,
-2.219118, 0.7446803, -1.215231, 1, 1, 1, 1, 1,
-2.179211, 0.7276704, -0.4762009, 1, 1, 1, 1, 1,
-2.144923, 0.1691383, -1.73588, 1, 1, 1, 1, 1,
-2.139718, -0.3191522, -2.451811, 1, 1, 1, 1, 1,
-2.117645, 0.6891825, -1.725843, 1, 1, 1, 1, 1,
-2.109588, -0.9209831, -3.069257, 1, 1, 1, 1, 1,
-2.076832, 0.06630386, -0.104105, 1, 1, 1, 1, 1,
-2.058227, -0.725599, -2.734512, 1, 1, 1, 1, 1,
-2.055115, 1.536991, -2.092607, 1, 1, 1, 1, 1,
-2.053576, 0.1417006, -1.398774, 1, 1, 1, 1, 1,
-2.052296, 1.884663, -0.8861558, 1, 1, 1, 1, 1,
-2.04329, -0.7009263, -1.704064, 1, 1, 1, 1, 1,
-2.042992, -0.6560826, -1.942426, 1, 1, 1, 1, 1,
-2.031246, -0.7010882, -1.538201, 0, 0, 1, 1, 1,
-2.008879, 0.8978013, 0.006140327, 1, 0, 0, 1, 1,
-1.982268, -1.431601, -3.407956, 1, 0, 0, 1, 1,
-1.936451, 1.029018, -0.6475981, 1, 0, 0, 1, 1,
-1.933403, 1.110239, -0.6438946, 1, 0, 0, 1, 1,
-1.930417, -0.05212307, -1.89526, 1, 0, 0, 1, 1,
-1.902006, 1.061253, -1.864869, 0, 0, 0, 1, 1,
-1.897639, 1.899063, -0.2134597, 0, 0, 0, 1, 1,
-1.883491, 0.9772958, 0.6604438, 0, 0, 0, 1, 1,
-1.842109, 0.7460321, -0.6557628, 0, 0, 0, 1, 1,
-1.836163, 1.015026, -0.03711239, 0, 0, 0, 1, 1,
-1.825141, -0.8988113, -2.315417, 0, 0, 0, 1, 1,
-1.823769, -1.125999, -1.390938, 0, 0, 0, 1, 1,
-1.808591, -0.6784589, -0.9279355, 1, 1, 1, 1, 1,
-1.806363, -2.378161, -1.872855, 1, 1, 1, 1, 1,
-1.805956, 1.294156, -0.5103183, 1, 1, 1, 1, 1,
-1.801958, 0.9991504, -0.1007733, 1, 1, 1, 1, 1,
-1.768364, -1.134643, -3.632085, 1, 1, 1, 1, 1,
-1.75084, -0.1925423, -2.41204, 1, 1, 1, 1, 1,
-1.728347, 2.159184, 0.02011575, 1, 1, 1, 1, 1,
-1.713631, -0.6345471, -1.215049, 1, 1, 1, 1, 1,
-1.679034, 1.433904, -1.21709, 1, 1, 1, 1, 1,
-1.669485, -0.3779038, -2.528587, 1, 1, 1, 1, 1,
-1.668392, 1.158634, -1.114712, 1, 1, 1, 1, 1,
-1.666202, -0.4351579, -1.495151, 1, 1, 1, 1, 1,
-1.644767, -0.3446154, -0.2828843, 1, 1, 1, 1, 1,
-1.633924, -0.1932033, -2.324626, 1, 1, 1, 1, 1,
-1.62902, -0.09724509, -3.437083, 1, 1, 1, 1, 1,
-1.628523, 0.05829332, -2.211136, 0, 0, 1, 1, 1,
-1.625501, -0.6299813, -3.349803, 1, 0, 0, 1, 1,
-1.623816, 0.8558502, -1.494262, 1, 0, 0, 1, 1,
-1.606397, -0.9807803, -4.179095, 1, 0, 0, 1, 1,
-1.603102, 0.794818, -1.652492, 1, 0, 0, 1, 1,
-1.596229, -0.7910522, -2.18011, 1, 0, 0, 1, 1,
-1.592519, 1.27371, -2.672941, 0, 0, 0, 1, 1,
-1.575787, 1.940902, -1.425556, 0, 0, 0, 1, 1,
-1.575063, 0.4129263, -0.2202289, 0, 0, 0, 1, 1,
-1.561417, -0.2056373, -1.286108, 0, 0, 0, 1, 1,
-1.555083, 0.2841447, -0.8617135, 0, 0, 0, 1, 1,
-1.551311, -2.422048, -1.143888, 0, 0, 0, 1, 1,
-1.544741, -0.8498141, -1.049675, 0, 0, 0, 1, 1,
-1.525371, 0.4302244, 0.9067203, 1, 1, 1, 1, 1,
-1.523052, -0.3675845, -2.654468, 1, 1, 1, 1, 1,
-1.520032, 0.1999519, -1.259296, 1, 1, 1, 1, 1,
-1.516405, 0.07963981, -0.2661232, 1, 1, 1, 1, 1,
-1.508514, 0.2952913, -0.2331119, 1, 1, 1, 1, 1,
-1.505666, -0.5834394, -0.6603565, 1, 1, 1, 1, 1,
-1.500661, 0.3740508, -1.407619, 1, 1, 1, 1, 1,
-1.488895, -0.4728935, -1.999149, 1, 1, 1, 1, 1,
-1.479395, -0.575101, -1.899551, 1, 1, 1, 1, 1,
-1.47768, 2.032483, 0.9782037, 1, 1, 1, 1, 1,
-1.475879, 0.8762488, -0.9908684, 1, 1, 1, 1, 1,
-1.463962, -0.5027297, -2.412413, 1, 1, 1, 1, 1,
-1.456475, 1.83962, -0.2488566, 1, 1, 1, 1, 1,
-1.446846, 0.8384075, -0.8993437, 1, 1, 1, 1, 1,
-1.438926, -0.6591669, -3.196844, 1, 1, 1, 1, 1,
-1.436357, 1.177279, -0.9853929, 0, 0, 1, 1, 1,
-1.422308, -1.44415, -0.8356799, 1, 0, 0, 1, 1,
-1.39381, -0.4527556, -1.432168, 1, 0, 0, 1, 1,
-1.390348, -2.240379, -4.634854, 1, 0, 0, 1, 1,
-1.381387, 0.8147223, -0.7357521, 1, 0, 0, 1, 1,
-1.381225, -0.1889758, -2.594339, 1, 0, 0, 1, 1,
-1.378421, -0.7739228, -2.531059, 0, 0, 0, 1, 1,
-1.37477, -0.8364211, -2.91055, 0, 0, 0, 1, 1,
-1.368201, -2.021378, -4.51782, 0, 0, 0, 1, 1,
-1.360449, -0.4558068, -0.7313564, 0, 0, 0, 1, 1,
-1.356402, -1.370667, -2.32817, 0, 0, 0, 1, 1,
-1.352806, 0.6709473, -1.105439, 0, 0, 0, 1, 1,
-1.338565, -1.403383, -1.070561, 0, 0, 0, 1, 1,
-1.335333, -1.183355, -0.7520703, 1, 1, 1, 1, 1,
-1.333062, -0.3439974, -3.386407, 1, 1, 1, 1, 1,
-1.316257, -0.973658, -2.248707, 1, 1, 1, 1, 1,
-1.307281, 1.228157, -0.9790527, 1, 1, 1, 1, 1,
-1.306778, 1.280366, -0.2403864, 1, 1, 1, 1, 1,
-1.300198, -2.668911, -2.863653, 1, 1, 1, 1, 1,
-1.292274, -0.7656494, -1.876474, 1, 1, 1, 1, 1,
-1.288525, -1.140081, -3.062214, 1, 1, 1, 1, 1,
-1.280842, -0.7611402, -0.04459302, 1, 1, 1, 1, 1,
-1.273797, -1.292372, -1.124727, 1, 1, 1, 1, 1,
-1.27269, -0.320269, -2.361199, 1, 1, 1, 1, 1,
-1.258441, -1.450406, -2.670579, 1, 1, 1, 1, 1,
-1.25407, 1.523144, 0.5525985, 1, 1, 1, 1, 1,
-1.24382, -0.4986517, -1.554185, 1, 1, 1, 1, 1,
-1.214764, -0.1950044, -0.2855782, 1, 1, 1, 1, 1,
-1.208874, -0.385373, -0.9433486, 0, 0, 1, 1, 1,
-1.208378, 0.5984958, -0.5627909, 1, 0, 0, 1, 1,
-1.191756, 1.860397, 0.6295737, 1, 0, 0, 1, 1,
-1.190431, -0.5064608, -2.586058, 1, 0, 0, 1, 1,
-1.188392, 0.188997, -1.051139, 1, 0, 0, 1, 1,
-1.181183, -0.7956688, 0.1614101, 1, 0, 0, 1, 1,
-1.169038, -0.1033258, -2.13589, 0, 0, 0, 1, 1,
-1.166626, 0.5088525, -0.4014049, 0, 0, 0, 1, 1,
-1.162324, 0.539008, -0.6339589, 0, 0, 0, 1, 1,
-1.161943, -1.832463, -3.488942, 0, 0, 0, 1, 1,
-1.161908, -0.1565232, 0.46637, 0, 0, 0, 1, 1,
-1.156018, 0.4827147, -0.9248989, 0, 0, 0, 1, 1,
-1.13864, 0.4477535, -0.9237651, 0, 0, 0, 1, 1,
-1.133378, 0.5006388, -0.6673002, 1, 1, 1, 1, 1,
-1.125768, 1.007004, -0.6083357, 1, 1, 1, 1, 1,
-1.118344, -2.027918, -2.945612, 1, 1, 1, 1, 1,
-1.117812, -0.6508213, -2.008299, 1, 1, 1, 1, 1,
-1.114135, 0.03241714, -1.086409, 1, 1, 1, 1, 1,
-1.105792, -1.105825, -1.201816, 1, 1, 1, 1, 1,
-1.105705, 0.9206243, -2.406173, 1, 1, 1, 1, 1,
-1.103979, 0.1917375, 0.590707, 1, 1, 1, 1, 1,
-1.098076, -0.8226315, -2.801547, 1, 1, 1, 1, 1,
-1.094035, 0.4684328, -1.228185, 1, 1, 1, 1, 1,
-1.085151, 0.3536621, -2.173599, 1, 1, 1, 1, 1,
-1.079803, -3.708694, -4.161096, 1, 1, 1, 1, 1,
-1.064992, -0.7337165, -1.389948, 1, 1, 1, 1, 1,
-1.064266, 0.4764611, -0.9299529, 1, 1, 1, 1, 1,
-1.063252, -1.663099, -2.629451, 1, 1, 1, 1, 1,
-1.063158, -1.106768, -1.785453, 0, 0, 1, 1, 1,
-1.061507, -0.4207841, -1.78378, 1, 0, 0, 1, 1,
-1.061467, -0.6820154, -1.707703, 1, 0, 0, 1, 1,
-1.055182, 0.09251416, -1.75635, 1, 0, 0, 1, 1,
-1.054213, 1.75189, -1.332333, 1, 0, 0, 1, 1,
-1.052902, 0.3513384, -0.7559443, 1, 0, 0, 1, 1,
-1.052834, -0.02684401, -2.245254, 0, 0, 0, 1, 1,
-1.047921, -0.02621211, -2.914321, 0, 0, 0, 1, 1,
-1.047227, 1.062394, -2.48817, 0, 0, 0, 1, 1,
-1.047147, -1.27077, -1.79695, 0, 0, 0, 1, 1,
-1.033062, 1.182295, 0.08179642, 0, 0, 0, 1, 1,
-1.033054, 0.06172209, -1.871953, 0, 0, 0, 1, 1,
-1.029971, 1.581732, -0.1010391, 0, 0, 0, 1, 1,
-1.017877, -0.910782, -2.601058, 1, 1, 1, 1, 1,
-1.017149, -0.502084, -2.982587, 1, 1, 1, 1, 1,
-1.015733, -1.297281, -3.530879, 1, 1, 1, 1, 1,
-1.000511, -0.8678302, -2.062264, 1, 1, 1, 1, 1,
-0.9992735, -0.2485065, -2.788403, 1, 1, 1, 1, 1,
-0.9983894, 0.04988331, -1.259006, 1, 1, 1, 1, 1,
-0.9954051, 0.1849437, -0.2123485, 1, 1, 1, 1, 1,
-0.9936852, -0.2434576, -3.783522, 1, 1, 1, 1, 1,
-0.9913583, -0.02418729, -2.954133, 1, 1, 1, 1, 1,
-0.9901797, -1.474598, -2.600665, 1, 1, 1, 1, 1,
-0.9894587, 0.7155523, -2.135475, 1, 1, 1, 1, 1,
-0.9822651, 1.510629, 0.9093125, 1, 1, 1, 1, 1,
-0.9808612, -0.3796588, -2.292684, 1, 1, 1, 1, 1,
-0.9755152, -0.1769609, -2.440279, 1, 1, 1, 1, 1,
-0.9605294, -1.485733, -5.221045, 1, 1, 1, 1, 1,
-0.9602465, 0.1280234, -0.5757625, 0, 0, 1, 1, 1,
-0.9582863, -0.242579, -2.840233, 1, 0, 0, 1, 1,
-0.9415022, 0.2807094, -0.4565486, 1, 0, 0, 1, 1,
-0.9322739, -0.6240978, -3.157352, 1, 0, 0, 1, 1,
-0.9256541, -0.02391315, -0.1376932, 1, 0, 0, 1, 1,
-0.9247658, 1.038592, 0.3646183, 1, 0, 0, 1, 1,
-0.9222171, -0.592189, -2.775598, 0, 0, 0, 1, 1,
-0.9208742, 0.08917008, -2.953744, 0, 0, 0, 1, 1,
-0.9145953, -0.04215369, -1.604867, 0, 0, 0, 1, 1,
-0.913334, -0.8526338, -3.96595, 0, 0, 0, 1, 1,
-0.910262, -0.632544, -2.139082, 0, 0, 0, 1, 1,
-0.907488, -0.04672225, -1.18464, 0, 0, 0, 1, 1,
-0.9074024, 0.324168, -1.74295, 0, 0, 0, 1, 1,
-0.9071034, 0.8963279, 0.3160516, 1, 1, 1, 1, 1,
-0.9067949, 0.2349252, -1.059914, 1, 1, 1, 1, 1,
-0.8987011, -0.7053504, -3.271416, 1, 1, 1, 1, 1,
-0.8973217, 1.158528, -0.8990918, 1, 1, 1, 1, 1,
-0.8972427, 0.4618759, -2.801348, 1, 1, 1, 1, 1,
-0.8947479, -0.7522492, -2.085611, 1, 1, 1, 1, 1,
-0.8915022, 0.7167836, -0.4460265, 1, 1, 1, 1, 1,
-0.8871213, 0.4899169, 0.5636774, 1, 1, 1, 1, 1,
-0.8848127, -0.05917623, -1.039254, 1, 1, 1, 1, 1,
-0.8821385, -0.990397, -2.44269, 1, 1, 1, 1, 1,
-0.8816379, -0.9757843, -3.013192, 1, 1, 1, 1, 1,
-0.8807373, 0.538691, -1.128589, 1, 1, 1, 1, 1,
-0.8742645, -0.2213828, -1.335445, 1, 1, 1, 1, 1,
-0.868248, 0.3090787, -2.085046, 1, 1, 1, 1, 1,
-0.8638375, 0.9419285, -0.8421036, 1, 1, 1, 1, 1,
-0.8592759, -0.94677, -1.735786, 0, 0, 1, 1, 1,
-0.8575693, 0.7504898, -0.6202878, 1, 0, 0, 1, 1,
-0.8492189, 0.537357, -2.177133, 1, 0, 0, 1, 1,
-0.8398789, -0.280272, -2.57537, 1, 0, 0, 1, 1,
-0.8398063, -0.4756225, -3.013699, 1, 0, 0, 1, 1,
-0.837432, 0.8150196, -0.902972, 1, 0, 0, 1, 1,
-0.8352022, 0.5292603, -0.7046583, 0, 0, 0, 1, 1,
-0.833155, -1.0521, -3.827404, 0, 0, 0, 1, 1,
-0.8216495, -0.7977769, -4.069023, 0, 0, 0, 1, 1,
-0.8214914, 0.3267541, -2.781173, 0, 0, 0, 1, 1,
-0.8194106, 0.8302034, 1.120064, 0, 0, 0, 1, 1,
-0.815839, -1.544203, -2.976685, 0, 0, 0, 1, 1,
-0.801576, -1.0181, -1.690436, 0, 0, 0, 1, 1,
-0.8004719, -1.155976, -2.06399, 1, 1, 1, 1, 1,
-0.8002494, -0.2746967, -1.83664, 1, 1, 1, 1, 1,
-0.7960849, -1.390995, -2.284485, 1, 1, 1, 1, 1,
-0.7958564, 1.843771, -0.689142, 1, 1, 1, 1, 1,
-0.7954761, -1.124478, -3.962798, 1, 1, 1, 1, 1,
-0.7929029, -1.403553, -3.258013, 1, 1, 1, 1, 1,
-0.7919007, -0.154833, -1.965914, 1, 1, 1, 1, 1,
-0.7881386, -0.9501463, -2.25718, 1, 1, 1, 1, 1,
-0.7878125, 0.5246236, 0.3164582, 1, 1, 1, 1, 1,
-0.7857478, 1.175231, -0.6842325, 1, 1, 1, 1, 1,
-0.7785998, -0.222614, -1.986591, 1, 1, 1, 1, 1,
-0.7761801, 0.572402, -0.7556324, 1, 1, 1, 1, 1,
-0.7708562, -1.414798, -2.102271, 1, 1, 1, 1, 1,
-0.7675486, 0.6285339, -2.729964, 1, 1, 1, 1, 1,
-0.7628736, 2.616421, -1.948762, 1, 1, 1, 1, 1,
-0.7617242, -0.04888138, -1.337417, 0, 0, 1, 1, 1,
-0.7586007, 0.1972043, -0.2972361, 1, 0, 0, 1, 1,
-0.7580665, -1.521982, -2.058146, 1, 0, 0, 1, 1,
-0.7580371, 0.6533496, -1.116879, 1, 0, 0, 1, 1,
-0.7566738, -1.525514, -3.385252, 1, 0, 0, 1, 1,
-0.7534434, -0.2715922, -1.817125, 1, 0, 0, 1, 1,
-0.7492465, 1.116482, -0.5384122, 0, 0, 0, 1, 1,
-0.7487307, 0.3794251, -2.221291, 0, 0, 0, 1, 1,
-0.7457709, -0.3375363, -1.604039, 0, 0, 0, 1, 1,
-0.742874, 0.7313465, -2.471031, 0, 0, 0, 1, 1,
-0.7378618, -0.07354581, -1.831411, 0, 0, 0, 1, 1,
-0.7330198, 1.732311, -0.4499703, 0, 0, 0, 1, 1,
-0.7245235, -0.7704296, -3.56683, 0, 0, 0, 1, 1,
-0.7223648, 0.2229, -1.131425, 1, 1, 1, 1, 1,
-0.7196425, 0.1222284, 0.6859533, 1, 1, 1, 1, 1,
-0.7184616, -1.746988, -4.638517, 1, 1, 1, 1, 1,
-0.7003745, -0.8514578, -1.672718, 1, 1, 1, 1, 1,
-0.6996653, 0.1899467, -0.5499036, 1, 1, 1, 1, 1,
-0.6983024, 0.7847481, -2.496712, 1, 1, 1, 1, 1,
-0.6961309, -2.088452, -0.01066275, 1, 1, 1, 1, 1,
-0.6954032, 1.663865, -0.659824, 1, 1, 1, 1, 1,
-0.6925166, -0.715521, -1.042283, 1, 1, 1, 1, 1,
-0.6895337, 0.5103367, -1.306143, 1, 1, 1, 1, 1,
-0.6818452, 0.7154415, -2.487993, 1, 1, 1, 1, 1,
-0.6712935, 1.410458, -1.061426, 1, 1, 1, 1, 1,
-0.6673698, -0.6046432, -0.2775521, 1, 1, 1, 1, 1,
-0.6555052, 0.5829365, -1.547034, 1, 1, 1, 1, 1,
-0.6548865, 0.2644075, -0.5433349, 1, 1, 1, 1, 1,
-0.6526408, -0.7328844, -2.020567, 0, 0, 1, 1, 1,
-0.6519642, 1.284741, 0.2995193, 1, 0, 0, 1, 1,
-0.649527, 0.2861838, -0.2475405, 1, 0, 0, 1, 1,
-0.6479543, 0.1738467, -2.063598, 1, 0, 0, 1, 1,
-0.6472303, -1.04938, -2.614863, 1, 0, 0, 1, 1,
-0.642822, -0.5058918, -1.068097, 1, 0, 0, 1, 1,
-0.6416209, -1.043247, -4.754636, 0, 0, 0, 1, 1,
-0.6361157, -0.06222971, -1.236189, 0, 0, 0, 1, 1,
-0.6349024, 0.3881595, -0.6405267, 0, 0, 0, 1, 1,
-0.6346133, -0.02985001, -3.947748, 0, 0, 0, 1, 1,
-0.6320217, 0.5071394, -1.554195, 0, 0, 0, 1, 1,
-0.6257757, 0.7613325, -2.231673, 0, 0, 0, 1, 1,
-0.6251267, -0.1227282, -1.401876, 0, 0, 0, 1, 1,
-0.6246761, 0.2948408, 0.9331552, 1, 1, 1, 1, 1,
-0.6183841, 1.361658, 0.008639307, 1, 1, 1, 1, 1,
-0.6176642, 0.6257224, -1.879026, 1, 1, 1, 1, 1,
-0.6156656, 0.8032163, -2.076731, 1, 1, 1, 1, 1,
-0.6147009, 0.6078591, 0.4563027, 1, 1, 1, 1, 1,
-0.6088966, -0.9480689, -1.583985, 1, 1, 1, 1, 1,
-0.5987568, -0.04394858, -2.045663, 1, 1, 1, 1, 1,
-0.5982702, 1.415734, 0.9005738, 1, 1, 1, 1, 1,
-0.5982599, -1.115638, -4.459887, 1, 1, 1, 1, 1,
-0.5934502, 0.4421269, 0.8159874, 1, 1, 1, 1, 1,
-0.5933056, -1.319098, -1.596573, 1, 1, 1, 1, 1,
-0.5916885, 0.4005693, -1.743274, 1, 1, 1, 1, 1,
-0.5834402, -1.050496, -4.453988, 1, 1, 1, 1, 1,
-0.5821805, -0.7236801, -0.8702666, 1, 1, 1, 1, 1,
-0.5766916, -1.611577, -3.970237, 1, 1, 1, 1, 1,
-0.5756126, 0.5185112, -1.701916, 0, 0, 1, 1, 1,
-0.574055, 2.307399, -0.9033204, 1, 0, 0, 1, 1,
-0.5732616, -0.06975153, -2.695207, 1, 0, 0, 1, 1,
-0.5715259, 1.467878, 0.1727309, 1, 0, 0, 1, 1,
-0.5642917, -1.29193, -1.93083, 1, 0, 0, 1, 1,
-0.5631047, 0.3402243, 0.03510179, 1, 0, 0, 1, 1,
-0.5582165, 1.562991, 0.6079743, 0, 0, 0, 1, 1,
-0.555484, 0.4858758, -0.2527978, 0, 0, 0, 1, 1,
-0.5539851, 0.620644, -0.8729209, 0, 0, 0, 1, 1,
-0.5529553, -1.739507, -4.93581, 0, 0, 0, 1, 1,
-0.5454293, 1.25619, 1.024977, 0, 0, 0, 1, 1,
-0.5414591, -0.2396248, -3.200159, 0, 0, 0, 1, 1,
-0.5399995, -0.5178198, -3.551444, 0, 0, 0, 1, 1,
-0.5370131, -1.281616, -1.619944, 1, 1, 1, 1, 1,
-0.5261725, -0.05295986, -2.613686, 1, 1, 1, 1, 1,
-0.525615, -1.428623, -1.768433, 1, 1, 1, 1, 1,
-0.5253813, -1.418563, -2.733265, 1, 1, 1, 1, 1,
-0.5242938, 0.1199973, -1.555021, 1, 1, 1, 1, 1,
-0.5231507, -1.569162, -1.943322, 1, 1, 1, 1, 1,
-0.5217836, 0.2183546, -0.8036643, 1, 1, 1, 1, 1,
-0.5215923, 1.088716, -0.7672328, 1, 1, 1, 1, 1,
-0.5194847, 1.866076, 1.193242, 1, 1, 1, 1, 1,
-0.5191656, 0.192882, -0.5571954, 1, 1, 1, 1, 1,
-0.5176771, -0.3662672, -2.279215, 1, 1, 1, 1, 1,
-0.5162027, 1.386086, -0.9394065, 1, 1, 1, 1, 1,
-0.5135196, 2.818343, -0.2454787, 1, 1, 1, 1, 1,
-0.5123771, -0.1385064, -0.8431062, 1, 1, 1, 1, 1,
-0.5121153, 1.341392, -0.5873232, 1, 1, 1, 1, 1,
-0.5072885, -0.02061809, -0.8895282, 0, 0, 1, 1, 1,
-0.5068143, 0.485295, -0.1683029, 1, 0, 0, 1, 1,
-0.5056402, 1.733293, 0.7600152, 1, 0, 0, 1, 1,
-0.4965393, -0.6542318, -3.780746, 1, 0, 0, 1, 1,
-0.4919942, -0.7960609, -1.873669, 1, 0, 0, 1, 1,
-0.4914004, -0.7487861, -3.087258, 1, 0, 0, 1, 1,
-0.4912113, -0.1150178, -2.24545, 0, 0, 0, 1, 1,
-0.4896064, -0.3156636, -1.991877, 0, 0, 0, 1, 1,
-0.4860643, -1.001389, -3.370615, 0, 0, 0, 1, 1,
-0.4800239, 0.02675406, -1.692408, 0, 0, 0, 1, 1,
-0.4791431, 1.303173, -0.3596822, 0, 0, 0, 1, 1,
-0.4782033, -0.729433, -1.990121, 0, 0, 0, 1, 1,
-0.4735772, 2.820449, 0.2692787, 0, 0, 0, 1, 1,
-0.4685329, 0.8149725, 2.098088, 1, 1, 1, 1, 1,
-0.4681203, 1.56622, -0.7045876, 1, 1, 1, 1, 1,
-0.4652717, -1.665982, -2.022571, 1, 1, 1, 1, 1,
-0.4651393, 0.2254527, -1.309739, 1, 1, 1, 1, 1,
-0.4645638, 1.296014, -0.2109715, 1, 1, 1, 1, 1,
-0.4637466, -0.9177639, -3.61485, 1, 1, 1, 1, 1,
-0.4624971, -0.8430682, -1.853668, 1, 1, 1, 1, 1,
-0.462359, -1.441134, -3.840211, 1, 1, 1, 1, 1,
-0.4604204, -0.6758641, -2.655623, 1, 1, 1, 1, 1,
-0.4509586, -0.1406486, -1.942083, 1, 1, 1, 1, 1,
-0.4407461, 0.9328746, -1.535222, 1, 1, 1, 1, 1,
-0.438922, 1.089936, -0.05984897, 1, 1, 1, 1, 1,
-0.4376361, 0.8402227, 0.3172189, 1, 1, 1, 1, 1,
-0.4366999, -0.3259348, -1.303471, 1, 1, 1, 1, 1,
-0.4334299, -0.2195373, -1.971454, 1, 1, 1, 1, 1,
-0.4282179, -0.9869596, -3.344891, 0, 0, 1, 1, 1,
-0.421323, -0.5296634, -2.610907, 1, 0, 0, 1, 1,
-0.4198217, -1.911058, -4.99289, 1, 0, 0, 1, 1,
-0.4196567, -0.3425873, -2.280121, 1, 0, 0, 1, 1,
-0.4170182, 0.137002, -2.27855, 1, 0, 0, 1, 1,
-0.4138026, 0.3140028, -1.171784, 1, 0, 0, 1, 1,
-0.4134791, 0.7167011, 0.4356765, 0, 0, 0, 1, 1,
-0.4126964, 0.3571207, -0.754598, 0, 0, 0, 1, 1,
-0.407521, 0.8828339, 2.267111, 0, 0, 0, 1, 1,
-0.4065559, -0.03435035, -2.153421, 0, 0, 0, 1, 1,
-0.4050857, 0.3389881, -1.919498, 0, 0, 0, 1, 1,
-0.4007401, -1.631455, -3.041054, 0, 0, 0, 1, 1,
-0.3994202, 1.257968, -1.160892, 0, 0, 0, 1, 1,
-0.3985879, 2.23666, 0.7405113, 1, 1, 1, 1, 1,
-0.3956764, -0.6378105, -1.50963, 1, 1, 1, 1, 1,
-0.3912651, 0.7195232, -1.824001, 1, 1, 1, 1, 1,
-0.3882197, -0.6819884, -3.081784, 1, 1, 1, 1, 1,
-0.3826774, -0.3648672, -2.174897, 1, 1, 1, 1, 1,
-0.3811579, 0.7614485, -0.1122213, 1, 1, 1, 1, 1,
-0.3807627, 0.6492343, 0.5115855, 1, 1, 1, 1, 1,
-0.3724751, -0.6686521, -4.591512, 1, 1, 1, 1, 1,
-0.3707772, -0.0009592084, -1.206408, 1, 1, 1, 1, 1,
-0.367125, -0.2558786, -2.151895, 1, 1, 1, 1, 1,
-0.3641593, -1.511681, -2.487143, 1, 1, 1, 1, 1,
-0.3637255, 0.5474292, -1.268707, 1, 1, 1, 1, 1,
-0.3535191, 1.205723, -0.8076947, 1, 1, 1, 1, 1,
-0.3525147, -0.2821732, -2.392755, 1, 1, 1, 1, 1,
-0.3450783, -0.5794097, -2.013983, 1, 1, 1, 1, 1,
-0.3441741, -0.5854858, -1.752006, 0, 0, 1, 1, 1,
-0.3435865, 1.717741, 1.359335, 1, 0, 0, 1, 1,
-0.3428207, -0.560335, -3.236378, 1, 0, 0, 1, 1,
-0.34188, -0.3937669, -1.20292, 1, 0, 0, 1, 1,
-0.3391339, 1.06038, 1.854028, 1, 0, 0, 1, 1,
-0.3383549, -1.659369, -1.769404, 1, 0, 0, 1, 1,
-0.3357217, 0.946753, -1.441482, 0, 0, 0, 1, 1,
-0.3346443, 0.3518395, -0.3648085, 0, 0, 0, 1, 1,
-0.332834, 0.6005468, 0.2429576, 0, 0, 0, 1, 1,
-0.3274868, 1.185512, 0.2265507, 0, 0, 0, 1, 1,
-0.3273515, -1.497101, -5.619053, 0, 0, 0, 1, 1,
-0.327107, -0.1901511, -3.251167, 0, 0, 0, 1, 1,
-0.3264353, 0.9299577, -0.4041139, 0, 0, 0, 1, 1,
-0.3232209, -0.592541, -2.928113, 1, 1, 1, 1, 1,
-0.3186391, 0.7292419, -1.353323, 1, 1, 1, 1, 1,
-0.3180549, -0.597075, -1.65291, 1, 1, 1, 1, 1,
-0.3168525, -0.1970955, -2.380888, 1, 1, 1, 1, 1,
-0.3151223, 1.182322, -0.4014881, 1, 1, 1, 1, 1,
-0.3109642, 0.4025906, -0.3080604, 1, 1, 1, 1, 1,
-0.3107741, -2.095549, -4.061444, 1, 1, 1, 1, 1,
-0.2979327, 0.5980616, -1.096664, 1, 1, 1, 1, 1,
-0.2975408, 0.8318899, -0.0794788, 1, 1, 1, 1, 1,
-0.2957965, 1.182819, -0.1073367, 1, 1, 1, 1, 1,
-0.2921361, -0.200231, -0.9873379, 1, 1, 1, 1, 1,
-0.2908698, 1.53805, 0.3192058, 1, 1, 1, 1, 1,
-0.2892867, 0.5929092, -1.472495, 1, 1, 1, 1, 1,
-0.2880957, -1.156785, -3.06057, 1, 1, 1, 1, 1,
-0.286897, -1.214017, -4.648438, 1, 1, 1, 1, 1,
-0.2815594, 0.04804436, -0.7629938, 0, 0, 1, 1, 1,
-0.2771209, 0.8026, 0.2592091, 1, 0, 0, 1, 1,
-0.2755238, 0.2620617, 0.6905375, 1, 0, 0, 1, 1,
-0.2749101, 1.988877, 0.1822032, 1, 0, 0, 1, 1,
-0.2722493, 1.073749, 1.379266, 1, 0, 0, 1, 1,
-0.2678403, 0.1554115, -0.6528687, 1, 0, 0, 1, 1,
-0.2669753, 2.084381, 0.3659064, 0, 0, 0, 1, 1,
-0.2655228, 0.6766791, 1.669615, 0, 0, 0, 1, 1,
-0.2637752, -1.416609, -3.665763, 0, 0, 0, 1, 1,
-0.262152, -1.384738, -3.415353, 0, 0, 0, 1, 1,
-0.2620289, -0.5979779, -1.053461, 0, 0, 0, 1, 1,
-0.2608163, 1.052546, 0.3845631, 0, 0, 0, 1, 1,
-0.2600831, -0.7311864, -4.433623, 0, 0, 0, 1, 1,
-0.2598032, -1.89508, -3.472401, 1, 1, 1, 1, 1,
-0.2581595, 0.4541334, 1.870147, 1, 1, 1, 1, 1,
-0.2570421, -2.610177, -3.506077, 1, 1, 1, 1, 1,
-0.2512687, 1.384441, 0.3125499, 1, 1, 1, 1, 1,
-0.2504067, -0.3852214, -0.9958125, 1, 1, 1, 1, 1,
-0.248953, -0.5442588, -2.270066, 1, 1, 1, 1, 1,
-0.2416904, -0.1302044, -2.465276, 1, 1, 1, 1, 1,
-0.2384284, -0.3133791, -2.173779, 1, 1, 1, 1, 1,
-0.2318, -1.714169, -4.149222, 1, 1, 1, 1, 1,
-0.2230525, -0.005989206, -4.160774, 1, 1, 1, 1, 1,
-0.2230072, -1.241854, -3.368649, 1, 1, 1, 1, 1,
-0.2224876, 0.4852014, -0.5936752, 1, 1, 1, 1, 1,
-0.2201289, 0.7013823, 0.2434835, 1, 1, 1, 1, 1,
-0.2182935, -0.8109424, -3.036006, 1, 1, 1, 1, 1,
-0.2142105, -0.5607156, -3.932103, 1, 1, 1, 1, 1,
-0.2136317, 1.685946, -0.4994028, 0, 0, 1, 1, 1,
-0.2134669, -0.8684851, -2.906606, 1, 0, 0, 1, 1,
-0.2001906, 0.4397662, -0.276378, 1, 0, 0, 1, 1,
-0.1991293, -1.219911, -1.411639, 1, 0, 0, 1, 1,
-0.1915829, 0.4200988, -0.6473845, 1, 0, 0, 1, 1,
-0.185244, -0.9447641, -2.213618, 1, 0, 0, 1, 1,
-0.1850682, -0.5871769, -2.053559, 0, 0, 0, 1, 1,
-0.1847559, 1.779124, 1.23366, 0, 0, 0, 1, 1,
-0.1845499, -0.7752253, -2.872127, 0, 0, 0, 1, 1,
-0.1842138, 0.9827011, 0.1594188, 0, 0, 0, 1, 1,
-0.182442, 0.3572215, 3.243316, 0, 0, 0, 1, 1,
-0.1823305, -0.4207596, -4.161385, 0, 0, 0, 1, 1,
-0.1780717, 0.08967927, -1.270295, 0, 0, 0, 1, 1,
-0.1748628, -0.129479, -3.090699, 1, 1, 1, 1, 1,
-0.1721312, 0.1853921, -0.3526128, 1, 1, 1, 1, 1,
-0.1712782, 0.298122, -2.510452, 1, 1, 1, 1, 1,
-0.1633469, -0.1121644, -2.883, 1, 1, 1, 1, 1,
-0.1627083, -0.7781994, -4.298433, 1, 1, 1, 1, 1,
-0.1608507, 0.6394147, 0.6742949, 1, 1, 1, 1, 1,
-0.1595773, -1.355584, -1.958692, 1, 1, 1, 1, 1,
-0.1524022, 0.6080238, -0.9943215, 1, 1, 1, 1, 1,
-0.1518177, -0.7758701, -3.832115, 1, 1, 1, 1, 1,
-0.1403018, -0.4668921, -4.567019, 1, 1, 1, 1, 1,
-0.1394083, -1.879385, -2.794348, 1, 1, 1, 1, 1,
-0.1365832, 1.145798, 2.070053, 1, 1, 1, 1, 1,
-0.1351337, 0.3637263, 1.419831, 1, 1, 1, 1, 1,
-0.1340583, -0.4448897, -2.283411, 1, 1, 1, 1, 1,
-0.1307295, -1.351842, -5.330271, 1, 1, 1, 1, 1,
-0.1267996, 1.217621, 1.333057, 0, 0, 1, 1, 1,
-0.1263295, 2.169167, -0.6940254, 1, 0, 0, 1, 1,
-0.1198411, -0.1543914, -1.155523, 1, 0, 0, 1, 1,
-0.1193048, -0.7747328, -2.002908, 1, 0, 0, 1, 1,
-0.1182269, -0.1570322, -3.710363, 1, 0, 0, 1, 1,
-0.1162287, -0.7030365, -2.55196, 1, 0, 0, 1, 1,
-0.1153388, -0.2807895, -3.445187, 0, 0, 0, 1, 1,
-0.1151138, 0.5254453, 1.708032, 0, 0, 0, 1, 1,
-0.1106182, 1.444075, -0.2472349, 0, 0, 0, 1, 1,
-0.1099327, -0.5077803, -3.415491, 0, 0, 0, 1, 1,
-0.1072135, 1.41218, -0.9088104, 0, 0, 0, 1, 1,
-0.1055053, -0.2019047, -2.922505, 0, 0, 0, 1, 1,
-0.104804, -0.8893924, -4.762397, 0, 0, 0, 1, 1,
-0.1036911, 0.04802866, -1.339528, 1, 1, 1, 1, 1,
-0.09362773, 1.43505, -0.4519533, 1, 1, 1, 1, 1,
-0.09260028, -1.180123, -2.129526, 1, 1, 1, 1, 1,
-0.08865754, 1.533728, -0.06847622, 1, 1, 1, 1, 1,
-0.08790065, -0.6669163, -2.353444, 1, 1, 1, 1, 1,
-0.08786255, -0.6674227, -2.030866, 1, 1, 1, 1, 1,
-0.08335516, 0.1217791, -0.3597573, 1, 1, 1, 1, 1,
-0.08000971, -0.6597343, -3.822408, 1, 1, 1, 1, 1,
-0.07799511, -0.57367, -3.611367, 1, 1, 1, 1, 1,
-0.07274267, -0.4767476, -2.715003, 1, 1, 1, 1, 1,
-0.06534947, 1.719593, 0.241769, 1, 1, 1, 1, 1,
-0.06470505, -1.420107, -1.581265, 1, 1, 1, 1, 1,
-0.06282457, -0.1908454, -1.875557, 1, 1, 1, 1, 1,
-0.06091941, 0.7999889, -0.7065784, 1, 1, 1, 1, 1,
-0.06019588, 0.423762, -0.2537951, 1, 1, 1, 1, 1,
-0.05849607, 0.2319858, 0.4853383, 0, 0, 1, 1, 1,
-0.0584938, -0.6638762, -2.426174, 1, 0, 0, 1, 1,
-0.05755199, -0.06432257, -2.920312, 1, 0, 0, 1, 1,
-0.05503155, -0.06859211, -1.738976, 1, 0, 0, 1, 1,
-0.05436905, 1.106451, -1.150061, 1, 0, 0, 1, 1,
-0.05392286, 0.7523844, 0.6765128, 1, 0, 0, 1, 1,
-0.05210916, 1.025253, -1.73052, 0, 0, 0, 1, 1,
-0.05193748, 0.1405312, -2.790752, 0, 0, 0, 1, 1,
-0.05141623, 0.2330654, -0.5548202, 0, 0, 0, 1, 1,
-0.05025362, -0.2609035, -3.287949, 0, 0, 0, 1, 1,
-0.04858726, 2.088363, 0.1823895, 0, 0, 0, 1, 1,
-0.04640662, -0.7962767, -3.799007, 0, 0, 0, 1, 1,
-0.045561, 1.095895, -0.3950733, 0, 0, 0, 1, 1,
-0.0450092, 0.3012308, 0.9079086, 1, 1, 1, 1, 1,
-0.04404079, -1.068174, -3.998015, 1, 1, 1, 1, 1,
-0.04310692, -0.3982072, -3.798007, 1, 1, 1, 1, 1,
-0.04200754, 0.1671429, 0.1918505, 1, 1, 1, 1, 1,
-0.0409353, -0.3057858, -0.81213, 1, 1, 1, 1, 1,
-0.03951165, -1.447665, -4.604137, 1, 1, 1, 1, 1,
-0.03321159, -0.8542616, -4.286783, 1, 1, 1, 1, 1,
-0.03207748, 0.9701768, -0.8443666, 1, 1, 1, 1, 1,
-0.03199908, 0.3120528, -1.856611, 1, 1, 1, 1, 1,
-0.03027139, 1.096716, 0.8078051, 1, 1, 1, 1, 1,
-0.0286428, 0.2467089, -1.010025, 1, 1, 1, 1, 1,
-0.02825318, 0.8237664, -0.5866619, 1, 1, 1, 1, 1,
-0.02731074, -0.1029269, -3.285227, 1, 1, 1, 1, 1,
-0.02635804, -3.315717, -4.530169, 1, 1, 1, 1, 1,
-0.02183939, -1.112871, -3.373669, 1, 1, 1, 1, 1,
-0.0145305, -0.2703215, -3.222541, 0, 0, 1, 1, 1,
-0.01326437, 0.7340928, -1.684168, 1, 0, 0, 1, 1,
-0.01079448, -0.5937592, -1.43007, 1, 0, 0, 1, 1,
-0.01029343, 1.383622, 0.05509077, 1, 0, 0, 1, 1,
-0.006374586, -1.835339, -3.901703, 1, 0, 0, 1, 1,
-0.005610629, -0.3574055, -3.599779, 1, 0, 0, 1, 1,
-0.002440069, 0.4174277, -1.292351, 0, 0, 0, 1, 1,
-0.001459608, 0.5699289, -1.581647, 0, 0, 0, 1, 1,
-0.001312857, -0.08662346, -3.898757, 0, 0, 0, 1, 1,
0.004749164, 0.4636642, -0.9538484, 0, 0, 0, 1, 1,
0.006375267, 0.6679625, -0.6280532, 0, 0, 0, 1, 1,
0.01093488, 0.5915337, 1.917053, 0, 0, 0, 1, 1,
0.01295222, -0.3874074, 2.179822, 0, 0, 0, 1, 1,
0.01335821, 0.831103, 0.866967, 1, 1, 1, 1, 1,
0.01415267, 0.6683211, -0.1462792, 1, 1, 1, 1, 1,
0.01783004, 2.296765, -0.1774199, 1, 1, 1, 1, 1,
0.02009568, 0.3138915, -0.6475965, 1, 1, 1, 1, 1,
0.02237502, 0.6407471, -0.7531874, 1, 1, 1, 1, 1,
0.02594719, -1.251946, 1.890311, 1, 1, 1, 1, 1,
0.02858146, 1.422364, 1.249588, 1, 1, 1, 1, 1,
0.03031976, -1.887838, 4.390479, 1, 1, 1, 1, 1,
0.03312314, 0.6912833, 0.986878, 1, 1, 1, 1, 1,
0.0333098, 0.4183505, -0.1407666, 1, 1, 1, 1, 1,
0.04178556, -0.0294143, 3.459653, 1, 1, 1, 1, 1,
0.0420338, 1.160946, 0.4319337, 1, 1, 1, 1, 1,
0.04378578, 1.445063, 1.46177, 1, 1, 1, 1, 1,
0.04410267, 0.01821163, 0.7859737, 1, 1, 1, 1, 1,
0.04591405, -1.69051, 2.370081, 1, 1, 1, 1, 1,
0.04733791, -0.04170628, 2.644457, 0, 0, 1, 1, 1,
0.04746041, -0.06821298, 3.302677, 1, 0, 0, 1, 1,
0.0486477, -0.9973686, 1.962424, 1, 0, 0, 1, 1,
0.05076904, 1.475547, 0.9883966, 1, 0, 0, 1, 1,
0.05361991, -1.392983, 2.818382, 1, 0, 0, 1, 1,
0.05465188, 0.5075672, 0.5255563, 1, 0, 0, 1, 1,
0.06482772, -2.052822, 3.422693, 0, 0, 0, 1, 1,
0.06495693, 0.5230412, -0.8612913, 0, 0, 0, 1, 1,
0.06659193, -0.9111998, 4.195285, 0, 0, 0, 1, 1,
0.0687367, 1.827465, 0.1048154, 0, 0, 0, 1, 1,
0.07015236, -0.4404877, 2.378202, 0, 0, 0, 1, 1,
0.07145896, 0.04419048, 0.9180509, 0, 0, 0, 1, 1,
0.07183293, 0.2204368, -0.8708097, 0, 0, 0, 1, 1,
0.07484951, -0.2451036, 3.404146, 1, 1, 1, 1, 1,
0.07565089, 1.085641, 1.527068, 1, 1, 1, 1, 1,
0.08031174, 0.7436649, 0.3315753, 1, 1, 1, 1, 1,
0.08508467, 0.7527528, 0.8222899, 1, 1, 1, 1, 1,
0.08752859, -0.9007823, 4.611988, 1, 1, 1, 1, 1,
0.08791391, -0.14872, 1.877073, 1, 1, 1, 1, 1,
0.08881418, -0.1941674, 1.713351, 1, 1, 1, 1, 1,
0.08938811, 2.10705, -1.297286, 1, 1, 1, 1, 1,
0.09969135, -0.8827919, 1.932778, 1, 1, 1, 1, 1,
0.1003247, 0.7928073, 0.6654739, 1, 1, 1, 1, 1,
0.1031387, -2.144788, 4.968684, 1, 1, 1, 1, 1,
0.1067424, -0.5731689, 3.59322, 1, 1, 1, 1, 1,
0.1101863, -1.291167, 2.317246, 1, 1, 1, 1, 1,
0.1142539, 1.304832, -0.3364657, 1, 1, 1, 1, 1,
0.1160658, -0.6826794, 2.311757, 1, 1, 1, 1, 1,
0.1178174, -0.5802281, 2.167646, 0, 0, 1, 1, 1,
0.1234805, 1.720251, 0.556757, 1, 0, 0, 1, 1,
0.1236294, -0.8945697, 3.447468, 1, 0, 0, 1, 1,
0.1240356, -2.32545, 1.314495, 1, 0, 0, 1, 1,
0.1256729, -0.7032261, 2.221177, 1, 0, 0, 1, 1,
0.1294356, -0.8776513, 3.183707, 1, 0, 0, 1, 1,
0.1375365, 0.1391, 0.6830174, 0, 0, 0, 1, 1,
0.1377916, -2.867669, 3.709016, 0, 0, 0, 1, 1,
0.1381186, -1.462734, 4.205778, 0, 0, 0, 1, 1,
0.1397349, -1.948727, 1.763963, 0, 0, 0, 1, 1,
0.1443822, 0.8174163, 0.7172116, 0, 0, 0, 1, 1,
0.1446849, -1.084806, 3.207181, 0, 0, 0, 1, 1,
0.145603, -1.821319, 4.02285, 0, 0, 0, 1, 1,
0.1479147, -0.27523, 3.964529, 1, 1, 1, 1, 1,
0.1497055, 0.3543672, 0.9451663, 1, 1, 1, 1, 1,
0.1497242, -0.3478409, 2.082549, 1, 1, 1, 1, 1,
0.1519186, 0.09063853, -0.1959515, 1, 1, 1, 1, 1,
0.1530032, 0.7957716, -0.8398767, 1, 1, 1, 1, 1,
0.1541454, 1.126866, -0.06819241, 1, 1, 1, 1, 1,
0.1553096, 0.7674606, -0.4005698, 1, 1, 1, 1, 1,
0.157339, 0.1839954, 0.3122701, 1, 1, 1, 1, 1,
0.160169, -0.6385508, 2.419731, 1, 1, 1, 1, 1,
0.1645777, 2.076596, -1.155489, 1, 1, 1, 1, 1,
0.1679232, -1.741, 0.4988914, 1, 1, 1, 1, 1,
0.1711052, 0.2593947, 0.5795373, 1, 1, 1, 1, 1,
0.1713635, -1.023307, 2.144605, 1, 1, 1, 1, 1,
0.1739954, -1.453765, 2.743312, 1, 1, 1, 1, 1,
0.1756598, -1.014284, 2.75426, 1, 1, 1, 1, 1,
0.175989, 0.5814421, 1.320018, 0, 0, 1, 1, 1,
0.1776006, 0.8626091, -0.3957914, 1, 0, 0, 1, 1,
0.1788008, -1.905516, 0.3892056, 1, 0, 0, 1, 1,
0.1807491, -0.3019611, 0.9818733, 1, 0, 0, 1, 1,
0.190503, 0.07480557, 1.605629, 1, 0, 0, 1, 1,
0.1923777, -0.7888106, 2.403823, 1, 0, 0, 1, 1,
0.2028538, 0.5228493, -0.2630361, 0, 0, 0, 1, 1,
0.2041071, -1.209718, 1.667211, 0, 0, 0, 1, 1,
0.2061349, -0.2186825, 1.561543, 0, 0, 0, 1, 1,
0.2073779, 2.207027, 2.193082, 0, 0, 0, 1, 1,
0.209417, -0.6812392, 3.675835, 0, 0, 0, 1, 1,
0.2147374, -0.302762, 4.288811, 0, 0, 0, 1, 1,
0.2210316, 0.3469946, -1.03412, 0, 0, 0, 1, 1,
0.2257051, 1.157038, -0.3570257, 1, 1, 1, 1, 1,
0.2259549, 0.8293487, 0.4689257, 1, 1, 1, 1, 1,
0.231268, -1.001157, 3.752352, 1, 1, 1, 1, 1,
0.2323252, 0.9810166, 2.009909, 1, 1, 1, 1, 1,
0.2382907, 0.3756435, 1.999285, 1, 1, 1, 1, 1,
0.2399218, 0.5666909, 0.3024694, 1, 1, 1, 1, 1,
0.2404053, 0.6515272, 0.4355908, 1, 1, 1, 1, 1,
0.2422135, -1.935862, 2.798127, 1, 1, 1, 1, 1,
0.2437137, -1.834084, 1.760759, 1, 1, 1, 1, 1,
0.2445504, 0.1806998, 2.480972, 1, 1, 1, 1, 1,
0.2515734, 1.059908, -1.144157, 1, 1, 1, 1, 1,
0.2519903, -0.02654038, 1.583231, 1, 1, 1, 1, 1,
0.2554217, -0.3213212, 2.580948, 1, 1, 1, 1, 1,
0.2561817, -1.774508, 2.233771, 1, 1, 1, 1, 1,
0.2580089, -1.669914, 3.678089, 1, 1, 1, 1, 1,
0.2586361, 0.1532429, 2.376122, 0, 0, 1, 1, 1,
0.268498, 1.18039, 1.120112, 1, 0, 0, 1, 1,
0.2723176, 2.247245, 0.1313393, 1, 0, 0, 1, 1,
0.272872, 1.19561, 0.331618, 1, 0, 0, 1, 1,
0.2742608, 0.3587595, 0.8326981, 1, 0, 0, 1, 1,
0.276992, 0.2504697, 0.1966109, 1, 0, 0, 1, 1,
0.277832, 0.6395423, 0.4154489, 0, 0, 0, 1, 1,
0.278435, 2.814404, 1.329962, 0, 0, 0, 1, 1,
0.2785943, 0.04986033, 2.544804, 0, 0, 0, 1, 1,
0.2836854, 0.2876237, 1.512492, 0, 0, 0, 1, 1,
0.2859352, -1.269835, 3.376857, 0, 0, 0, 1, 1,
0.2894073, -0.2353068, 0.8302262, 0, 0, 0, 1, 1,
0.2897555, -1.100907, 3.494185, 0, 0, 0, 1, 1,
0.2927743, 0.385468, 0.6870769, 1, 1, 1, 1, 1,
0.2953717, -1.056633, 1.389762, 1, 1, 1, 1, 1,
0.2956498, -1.907038, 3.219588, 1, 1, 1, 1, 1,
0.2988086, 0.3100481, 1.398481, 1, 1, 1, 1, 1,
0.2995519, -0.1894938, 2.220314, 1, 1, 1, 1, 1,
0.3097978, 0.7971811, 0.3306119, 1, 1, 1, 1, 1,
0.3119871, -0.098999, 2.47528, 1, 1, 1, 1, 1,
0.3145651, -0.2883068, 1.225412, 1, 1, 1, 1, 1,
0.3153348, 1.056907, -0.7595113, 1, 1, 1, 1, 1,
0.3208978, -0.5428107, 2.174361, 1, 1, 1, 1, 1,
0.3282643, -0.5364293, 1.438432, 1, 1, 1, 1, 1,
0.3288442, -0.5464363, 3.910025, 1, 1, 1, 1, 1,
0.3354925, -1.116228, 2.625866, 1, 1, 1, 1, 1,
0.3354996, 1.877115, -0.02441538, 1, 1, 1, 1, 1,
0.3359582, 0.2378611, 1.31482, 1, 1, 1, 1, 1,
0.3387245, -0.2568952, 1.454827, 0, 0, 1, 1, 1,
0.3407441, 0.8056818, 1.458665, 1, 0, 0, 1, 1,
0.3488489, 0.2562524, 0.3275644, 1, 0, 0, 1, 1,
0.3511014, -0.8551267, 3.554707, 1, 0, 0, 1, 1,
0.3528504, 0.7019876, -1.006105, 1, 0, 0, 1, 1,
0.3539126, 0.6137576, 0.903035, 1, 0, 0, 1, 1,
0.3548174, 1.447097, 1.99051, 0, 0, 0, 1, 1,
0.3573594, -0.4736319, 3.223156, 0, 0, 0, 1, 1,
0.3581062, 0.5399194, -0.8000372, 0, 0, 0, 1, 1,
0.3586843, -0.6630455, 1.304144, 0, 0, 0, 1, 1,
0.3599176, -0.810482, 2.549828, 0, 0, 0, 1, 1,
0.3601599, 0.8045099, 0.1966275, 0, 0, 0, 1, 1,
0.3639715, 1.765975, -0.7799062, 0, 0, 0, 1, 1,
0.3655156, -0.961559, 1.915832, 1, 1, 1, 1, 1,
0.3703709, -0.8782997, 3.425282, 1, 1, 1, 1, 1,
0.376784, 0.5286587, -1.337546, 1, 1, 1, 1, 1,
0.3797776, -0.12811, 2.636854, 1, 1, 1, 1, 1,
0.3804019, 0.1715908, 1.471463, 1, 1, 1, 1, 1,
0.3821207, 0.4541813, 1.872165, 1, 1, 1, 1, 1,
0.3852389, -0.6215675, 4.994672, 1, 1, 1, 1, 1,
0.3949013, -1.230613, 4.126307, 1, 1, 1, 1, 1,
0.4022489, 1.034629, -0.3067265, 1, 1, 1, 1, 1,
0.4034425, -0.004286298, 2.373452, 1, 1, 1, 1, 1,
0.4095892, 1.639326, 0.684145, 1, 1, 1, 1, 1,
0.411033, 0.2878269, 0.1182994, 1, 1, 1, 1, 1,
0.4119873, 1.140618, 1.435708, 1, 1, 1, 1, 1,
0.4130793, -0.1323127, 1.780224, 1, 1, 1, 1, 1,
0.4192796, -1.373563, 2.495352, 1, 1, 1, 1, 1,
0.4283752, -0.9763442, 3.148577, 0, 0, 1, 1, 1,
0.4344071, -0.9826553, 2.924987, 1, 0, 0, 1, 1,
0.4350047, -0.5553476, 4.017066, 1, 0, 0, 1, 1,
0.4385385, 0.7992058, 0.7420647, 1, 0, 0, 1, 1,
0.4418188, -0.3352216, 2.419025, 1, 0, 0, 1, 1,
0.4428176, -0.184175, 1.993155, 1, 0, 0, 1, 1,
0.4460166, -0.6982192, 3.177908, 0, 0, 0, 1, 1,
0.4503159, -0.4059025, 3.920643, 0, 0, 0, 1, 1,
0.4510607, 0.4528199, -0.09762595, 0, 0, 0, 1, 1,
0.455261, 0.1717718, 1.646611, 0, 0, 0, 1, 1,
0.4568674, 1.005244, 0.7720038, 0, 0, 0, 1, 1,
0.457913, -0.2583078, 1.775668, 0, 0, 0, 1, 1,
0.4588097, 0.3813802, -1.147155, 0, 0, 0, 1, 1,
0.4598389, -1.810135, 3.877862, 1, 1, 1, 1, 1,
0.4708728, -1.21532, 3.202677, 1, 1, 1, 1, 1,
0.472483, 0.2767824, 2.26761, 1, 1, 1, 1, 1,
0.4829005, -0.8240327, 3.124707, 1, 1, 1, 1, 1,
0.4852349, -0.4641759, 2.805617, 1, 1, 1, 1, 1,
0.4853115, -0.4639685, 2.629695, 1, 1, 1, 1, 1,
0.4915488, 1.028639, -0.8456149, 1, 1, 1, 1, 1,
0.491758, -1.668305, 3.49206, 1, 1, 1, 1, 1,
0.4948848, -1.772535, 3.715385, 1, 1, 1, 1, 1,
0.4974434, -1.617809, 1.912802, 1, 1, 1, 1, 1,
0.4998716, -0.9973852, 2.458412, 1, 1, 1, 1, 1,
0.5106897, 0.4818806, -0.08591223, 1, 1, 1, 1, 1,
0.5107663, -1.909259, 2.307753, 1, 1, 1, 1, 1,
0.5194536, 0.9271328, 0.9074758, 1, 1, 1, 1, 1,
0.5217455, 0.7219655, 1.004631, 1, 1, 1, 1, 1,
0.5221259, 0.1538859, 1.447479, 0, 0, 1, 1, 1,
0.5222293, 0.3904655, 1.148478, 1, 0, 0, 1, 1,
0.5229433, -1.302184, 2.818516, 1, 0, 0, 1, 1,
0.5244113, -0.7164738, 1.491391, 1, 0, 0, 1, 1,
0.5274552, -1.433216, 3.303894, 1, 0, 0, 1, 1,
0.5374522, 1.833968, 0.1617496, 1, 0, 0, 1, 1,
0.5379228, -1.527365, 2.608325, 0, 0, 0, 1, 1,
0.5411159, 0.515511, 0.6438932, 0, 0, 0, 1, 1,
0.5417593, 0.6284546, 2.180216, 0, 0, 0, 1, 1,
0.5422725, 0.147923, 1.470656, 0, 0, 0, 1, 1,
0.5434231, -0.5008674, 2.513107, 0, 0, 0, 1, 1,
0.5438042, 2.496022, 0.08417766, 0, 0, 0, 1, 1,
0.5480066, 0.1667141, 1.354889, 0, 0, 0, 1, 1,
0.5538754, -0.3526644, 3.281456, 1, 1, 1, 1, 1,
0.5550641, 0.7833937, 0.3931058, 1, 1, 1, 1, 1,
0.5574614, 1.176803, -0.3491651, 1, 1, 1, 1, 1,
0.5629387, -1.166476, 3.88146, 1, 1, 1, 1, 1,
0.5639522, -0.9918681, 3.588715, 1, 1, 1, 1, 1,
0.5643085, -0.9185928, 1.626927, 1, 1, 1, 1, 1,
0.5672187, -0.09235407, 1.152652, 1, 1, 1, 1, 1,
0.5714592, 1.004571, 0.7706413, 1, 1, 1, 1, 1,
0.5773407, -0.968751, 4.09305, 1, 1, 1, 1, 1,
0.5782236, 0.171912, 1.212631, 1, 1, 1, 1, 1,
0.5798787, 0.8308192, 1.075061, 1, 1, 1, 1, 1,
0.5834537, 0.5413431, -0.09405634, 1, 1, 1, 1, 1,
0.5835968, -0.4123311, 1.707804, 1, 1, 1, 1, 1,
0.5870337, -0.01581578, 1.863665, 1, 1, 1, 1, 1,
0.5901895, 1.638146, 1.265495, 1, 1, 1, 1, 1,
0.5936105, 0.9870744, 1.783329, 0, 0, 1, 1, 1,
0.5989581, -1.184185, 1.132976, 1, 0, 0, 1, 1,
0.6023858, 1.068321, 1.30519, 1, 0, 0, 1, 1,
0.6030481, -0.1095974, 2.367771, 1, 0, 0, 1, 1,
0.6055635, -0.6138748, 2.901637, 1, 0, 0, 1, 1,
0.6074048, 0.3022055, 1.044672, 1, 0, 0, 1, 1,
0.6149754, 0.6026614, 0.5059478, 0, 0, 0, 1, 1,
0.6169849, -0.03772014, 1.111932, 0, 0, 0, 1, 1,
0.6299253, -0.07779181, 3.598451, 0, 0, 0, 1, 1,
0.6349292, -0.3445955, 3.002418, 0, 0, 0, 1, 1,
0.6374214, -0.02813169, 2.7938, 0, 0, 0, 1, 1,
0.6380442, 1.799169, 0.45362, 0, 0, 0, 1, 1,
0.639843, -0.1608718, 1.307347, 0, 0, 0, 1, 1,
0.6402006, 0.2017561, -0.8175296, 1, 1, 1, 1, 1,
0.6402477, 0.6353969, -1.415215, 1, 1, 1, 1, 1,
0.6407047, 0.787299, 0.758477, 1, 1, 1, 1, 1,
0.6535334, 0.267632, 1.980398, 1, 1, 1, 1, 1,
0.6601316, -0.05743385, 0.6978078, 1, 1, 1, 1, 1,
0.6620796, 0.4520754, 1.607605, 1, 1, 1, 1, 1,
0.6632969, 0.7015595, 0.6332259, 1, 1, 1, 1, 1,
0.6648217, -0.1504915, 1.77616, 1, 1, 1, 1, 1,
0.6664717, 0.3696301, 1.856755, 1, 1, 1, 1, 1,
0.6699814, -0.2242783, 2.970479, 1, 1, 1, 1, 1,
0.6737241, -0.1989704, 3.123159, 1, 1, 1, 1, 1,
0.6755862, -0.0847229, 0.6142449, 1, 1, 1, 1, 1,
0.6769428, 0.828118, 1.748341, 1, 1, 1, 1, 1,
0.6801387, 0.2497141, 1.217228, 1, 1, 1, 1, 1,
0.6822932, -0.05771066, 2.692316, 1, 1, 1, 1, 1,
0.6842234, 0.4782535, 1.062807, 0, 0, 1, 1, 1,
0.6869238, -0.3079021, -0.1166953, 1, 0, 0, 1, 1,
0.6933416, -0.5141171, 1.376432, 1, 0, 0, 1, 1,
0.693607, 1.346388, 0.2481245, 1, 0, 0, 1, 1,
0.6944431, -1.81635, 3.414447, 1, 0, 0, 1, 1,
0.6969852, 0.6020269, 0.6671926, 1, 0, 0, 1, 1,
0.6987808, 1.668475, 1.238816, 0, 0, 0, 1, 1,
0.7027324, -0.9493705, 2.521015, 0, 0, 0, 1, 1,
0.7033387, -0.02557312, 2.05914, 0, 0, 0, 1, 1,
0.7129482, -0.1969992, -0.03573013, 0, 0, 0, 1, 1,
0.7131941, 1.945773, 0.2895589, 0, 0, 0, 1, 1,
0.7140974, 0.2280975, -0.3159192, 0, 0, 0, 1, 1,
0.717022, 0.2445723, 3.322992, 0, 0, 0, 1, 1,
0.7257407, 0.3198311, 0.8521676, 1, 1, 1, 1, 1,
0.7272379, -0.597119, 1.713508, 1, 1, 1, 1, 1,
0.7348862, 2.562781, 0.7563428, 1, 1, 1, 1, 1,
0.7374498, -1.269156, 2.08594, 1, 1, 1, 1, 1,
0.7375357, -0.759537, 2.270447, 1, 1, 1, 1, 1,
0.7399865, -1.636052, 3.453263, 1, 1, 1, 1, 1,
0.7406541, 0.9705166, 1.161741, 1, 1, 1, 1, 1,
0.7481467, 0.6143283, -0.6398641, 1, 1, 1, 1, 1,
0.7484014, -0.004773452, 1.727885, 1, 1, 1, 1, 1,
0.7517688, 0.6042274, 2.898769, 1, 1, 1, 1, 1,
0.7594986, -0.9760247, 2.944968, 1, 1, 1, 1, 1,
0.7619373, -0.0435812, 3.036524, 1, 1, 1, 1, 1,
0.7676533, 0.7805687, 1.25611, 1, 1, 1, 1, 1,
0.7678083, -1.95702, 2.883533, 1, 1, 1, 1, 1,
0.7696659, 0.5711436, 1.400982, 1, 1, 1, 1, 1,
0.7699485, 0.7361578, 0.0777413, 0, 0, 1, 1, 1,
0.7719494, -0.2200822, 3.506185, 1, 0, 0, 1, 1,
0.7722486, 0.3762195, 0.4505994, 1, 0, 0, 1, 1,
0.7890831, -1.471367, 1.72539, 1, 0, 0, 1, 1,
0.7897484, 0.7334698, 0.2836952, 1, 0, 0, 1, 1,
0.7977032, 0.8430696, -0.6992893, 1, 0, 0, 1, 1,
0.8007565, -2.168871, 2.994316, 0, 0, 0, 1, 1,
0.8085919, 0.5218937, 2.171892, 0, 0, 0, 1, 1,
0.813108, 0.07869291, -0.4640502, 0, 0, 0, 1, 1,
0.8139161, -0.7131332, 2.217594, 0, 0, 0, 1, 1,
0.8143107, -0.588851, 3.947073, 0, 0, 0, 1, 1,
0.8172176, -0.572272, 0.516843, 0, 0, 0, 1, 1,
0.8173169, 0.6367622, -0.7178501, 0, 0, 0, 1, 1,
0.8173903, -0.3088748, 0.99837, 1, 1, 1, 1, 1,
0.8285587, -0.0400205, 1.769025, 1, 1, 1, 1, 1,
0.8437072, 0.3069369, 3.387495, 1, 1, 1, 1, 1,
0.853104, -0.7229372, 1.392659, 1, 1, 1, 1, 1,
0.8606231, -1.627435, 2.151744, 1, 1, 1, 1, 1,
0.8623561, 0.1958527, 2.555641, 1, 1, 1, 1, 1,
0.86476, -0.636584, 0.8833382, 1, 1, 1, 1, 1,
0.8669286, -0.5099081, 1.612217, 1, 1, 1, 1, 1,
0.8704713, -1.505553, 4.000089, 1, 1, 1, 1, 1,
0.8726228, -1.564385, 2.989602, 1, 1, 1, 1, 1,
0.8735173, -0.4200494, 2.24418, 1, 1, 1, 1, 1,
0.8747492, -0.3776107, 2.679681, 1, 1, 1, 1, 1,
0.8760186, -0.6196322, 4.048028, 1, 1, 1, 1, 1,
0.8781785, 0.6811519, 0.5685142, 1, 1, 1, 1, 1,
0.8811916, 0.4318978, 1.607228, 1, 1, 1, 1, 1,
0.8856985, -0.9980603, 1.086472, 0, 0, 1, 1, 1,
0.8880016, -0.3476822, 2.117874, 1, 0, 0, 1, 1,
0.8935851, -0.721983, 1.143154, 1, 0, 0, 1, 1,
0.8943686, -0.5883722, -0.5754202, 1, 0, 0, 1, 1,
0.9007619, 2.101146, 1.446276, 1, 0, 0, 1, 1,
0.90154, 0.1864904, 0.4304381, 1, 0, 0, 1, 1,
0.9025176, -0.4687071, 2.742301, 0, 0, 0, 1, 1,
0.9175516, 1.947035, -0.5476502, 0, 0, 0, 1, 1,
0.9175706, -0.659866, 3.529251, 0, 0, 0, 1, 1,
0.9194447, -0.04360173, 2.68246, 0, 0, 0, 1, 1,
0.9204826, -1.123477, 1.336607, 0, 0, 0, 1, 1,
0.9290158, -0.03080411, 0.6232543, 0, 0, 0, 1, 1,
0.9387467, 0.5205466, 1.687541, 0, 0, 0, 1, 1,
0.939212, 1.29461, 0.7859933, 1, 1, 1, 1, 1,
0.9408246, 0.1820516, 0.7904323, 1, 1, 1, 1, 1,
0.946868, 0.621012, 1.511588, 1, 1, 1, 1, 1,
0.9472504, -0.6245016, 2.310488, 1, 1, 1, 1, 1,
0.9473591, -0.8237612, 2.088027, 1, 1, 1, 1, 1,
0.9476956, -0.3640251, 0.1996768, 1, 1, 1, 1, 1,
0.9505527, 0.4014792, 0.5325198, 1, 1, 1, 1, 1,
0.9508346, 0.6532874, 1.323598, 1, 1, 1, 1, 1,
0.9513716, 0.8679295, 1.307595, 1, 1, 1, 1, 1,
0.9578457, 1.977271, 0.129404, 1, 1, 1, 1, 1,
0.9592506, -0.8906474, 3.665789, 1, 1, 1, 1, 1,
0.9611129, -1.380842, 2.99053, 1, 1, 1, 1, 1,
0.9635365, 0.3599544, 1.624757, 1, 1, 1, 1, 1,
0.9696782, 0.2385841, 1.523759, 1, 1, 1, 1, 1,
0.9715582, -0.8317739, 1.813354, 1, 1, 1, 1, 1,
0.972277, 1.108657, 0.5388849, 0, 0, 1, 1, 1,
0.9786191, -0.5598781, 0.91838, 1, 0, 0, 1, 1,
0.9791455, 1.750326, -0.6213578, 1, 0, 0, 1, 1,
0.9802069, 0.1703483, 1.02661, 1, 0, 0, 1, 1,
0.9829956, -0.7990181, 1.84961, 1, 0, 0, 1, 1,
0.9863814, 2.502436, 1.090255, 1, 0, 0, 1, 1,
0.9871601, -0.6257334, 1.140644, 0, 0, 0, 1, 1,
0.9888031, 0.3382113, 0.1130191, 0, 0, 0, 1, 1,
0.9944541, -0.07378446, 1.047229, 0, 0, 0, 1, 1,
0.999049, -1.91118, 2.455173, 0, 0, 0, 1, 1,
1.004845, 0.5995501, 1.181282, 0, 0, 0, 1, 1,
1.005468, 1.073774, 0.3287328, 0, 0, 0, 1, 1,
1.006655, 0.5080891, 2.130678, 0, 0, 0, 1, 1,
1.00671, 2.49582, -0.2707695, 1, 1, 1, 1, 1,
1.009212, 0.1365817, 1.335196, 1, 1, 1, 1, 1,
1.009223, -1.352746, 2.505646, 1, 1, 1, 1, 1,
1.020093, 0.03224465, 1.496503, 1, 1, 1, 1, 1,
1.021276, -0.2186717, 1.792522, 1, 1, 1, 1, 1,
1.022967, 0.2359479, 2.051502, 1, 1, 1, 1, 1,
1.034797, 0.7428994, 0.4925394, 1, 1, 1, 1, 1,
1.036043, -0.6202683, 2.890992, 1, 1, 1, 1, 1,
1.038092, -2.338594, 2.938957, 1, 1, 1, 1, 1,
1.041165, 0.481516, 1.205929, 1, 1, 1, 1, 1,
1.044976, -0.3764706, 2.123346, 1, 1, 1, 1, 1,
1.045486, -1.258439, 0.2733028, 1, 1, 1, 1, 1,
1.047222, 0.6596916, 1.939783, 1, 1, 1, 1, 1,
1.056828, 1.016087, -0.3399235, 1, 1, 1, 1, 1,
1.077896, 2.726531, 0.3107102, 1, 1, 1, 1, 1,
1.081365, 0.3882343, -0.03280484, 0, 0, 1, 1, 1,
1.08655, -1.196885, 1.26222, 1, 0, 0, 1, 1,
1.089948, 0.9748707, 0.8985248, 1, 0, 0, 1, 1,
1.093059, -2.154046, 2.942564, 1, 0, 0, 1, 1,
1.098492, 0.2191892, 2.159599, 1, 0, 0, 1, 1,
1.103542, 1.268345, 2.375381, 1, 0, 0, 1, 1,
1.110771, 0.5472356, 0.2749981, 0, 0, 0, 1, 1,
1.115688, -0.6871982, 1.628723, 0, 0, 0, 1, 1,
1.116959, 0.3469148, 1.466804, 0, 0, 0, 1, 1,
1.121537, -1.944005, 4.366638, 0, 0, 0, 1, 1,
1.124161, 0.7029312, 1.239096, 0, 0, 0, 1, 1,
1.128035, 1.831077, 1.292872, 0, 0, 0, 1, 1,
1.131067, 0.01483247, 2.37521, 0, 0, 0, 1, 1,
1.134245, -0.5351275, 0.242656, 1, 1, 1, 1, 1,
1.138751, 0.7302092, 1.303455, 1, 1, 1, 1, 1,
1.147273, -0.6742392, 2.609359, 1, 1, 1, 1, 1,
1.156449, -1.140247, 0.9909138, 1, 1, 1, 1, 1,
1.158105, 1.709031, -0.6940181, 1, 1, 1, 1, 1,
1.164343, -1.438943, 0.7969097, 1, 1, 1, 1, 1,
1.171827, 0.9378832, -0.8755251, 1, 1, 1, 1, 1,
1.188615, -1.450199, 3.167866, 1, 1, 1, 1, 1,
1.188964, 0.1931422, 1.60528, 1, 1, 1, 1, 1,
1.197595, 1.558101, -0.1996538, 1, 1, 1, 1, 1,
1.202267, 0.1627924, 2.845825, 1, 1, 1, 1, 1,
1.211312, -1.027134, -0.371583, 1, 1, 1, 1, 1,
1.216937, -1.390902, 0.9622797, 1, 1, 1, 1, 1,
1.224446, -0.6367549, 2.403232, 1, 1, 1, 1, 1,
1.227808, 0.05131929, 0.7510713, 1, 1, 1, 1, 1,
1.254173, -0.06802345, 2.290683, 0, 0, 1, 1, 1,
1.258497, 0.9312491, 0.4478268, 1, 0, 0, 1, 1,
1.262169, -1.166854, 1.261731, 1, 0, 0, 1, 1,
1.274111, 1.865955, -0.907886, 1, 0, 0, 1, 1,
1.282091, -0.4307885, 2.011324, 1, 0, 0, 1, 1,
1.283707, -0.008336852, 2.866646, 1, 0, 0, 1, 1,
1.287541, 0.2469185, 0.8019977, 0, 0, 0, 1, 1,
1.323756, -1.225675, 3.525218, 0, 0, 0, 1, 1,
1.326387, 0.02599478, 1.125511, 0, 0, 0, 1, 1,
1.334427, 0.07817288, 3.41196, 0, 0, 0, 1, 1,
1.335343, 0.9106963, 1.717247, 0, 0, 0, 1, 1,
1.33784, 0.8201376, 0.4572724, 0, 0, 0, 1, 1,
1.33813, 0.2482162, 0.5983327, 0, 0, 0, 1, 1,
1.346089, -0.6408426, 2.198119, 1, 1, 1, 1, 1,
1.358021, 2.130339, -3.138809, 1, 1, 1, 1, 1,
1.368356, 0.05351694, 0.4256709, 1, 1, 1, 1, 1,
1.374239, 0.4872429, 0.6505308, 1, 1, 1, 1, 1,
1.378036, -0.1717722, 2.970839, 1, 1, 1, 1, 1,
1.378899, -0.5381636, 1.350445, 1, 1, 1, 1, 1,
1.392347, -1.88006, 2.357446, 1, 1, 1, 1, 1,
1.41404, 1.127971, 1.724689, 1, 1, 1, 1, 1,
1.419512, 0.8104093, 0.9172631, 1, 1, 1, 1, 1,
1.422985, -0.8190646, 3.070793, 1, 1, 1, 1, 1,
1.437859, -2.205387, 1.858885, 1, 1, 1, 1, 1,
1.441501, 0.8799347, 1.642041, 1, 1, 1, 1, 1,
1.457282, -0.7178066, 2.633568, 1, 1, 1, 1, 1,
1.459728, -0.9293634, 3.608497, 1, 1, 1, 1, 1,
1.496974, -0.5978059, 2.505447, 1, 1, 1, 1, 1,
1.505117, -0.6541475, 1.165396, 0, 0, 1, 1, 1,
1.51431, 0.6594509, 2.198332, 1, 0, 0, 1, 1,
1.528833, -2.484829, 3.331711, 1, 0, 0, 1, 1,
1.529842, 1.110099, 2.188001, 1, 0, 0, 1, 1,
1.553395, -1.312118, 3.85475, 1, 0, 0, 1, 1,
1.576443, 0.4816242, 1.946784, 1, 0, 0, 1, 1,
1.585307, 1.050979, 0.3713071, 0, 0, 0, 1, 1,
1.600727, -1.395509, 2.149687, 0, 0, 0, 1, 1,
1.60089, 0.440971, 1.809561, 0, 0, 0, 1, 1,
1.614123, -0.3852306, 0.8581577, 0, 0, 0, 1, 1,
1.619856, -0.508245, 3.238185, 0, 0, 0, 1, 1,
1.643173, -1.82749, 2.356459, 0, 0, 0, 1, 1,
1.654582, 1.335688, 1.498259, 0, 0, 0, 1, 1,
1.659576, 0.7979099, 1.741157, 1, 1, 1, 1, 1,
1.660735, -2.12782, 1.360275, 1, 1, 1, 1, 1,
1.663489, -1.099096, 2.81002, 1, 1, 1, 1, 1,
1.669096, -1.620156, 1.888718, 1, 1, 1, 1, 1,
1.674722, 0.105014, 0.6819603, 1, 1, 1, 1, 1,
1.675683, -0.08202581, -0.03310777, 1, 1, 1, 1, 1,
1.678027, 0.1088153, 0.1263603, 1, 1, 1, 1, 1,
1.681645, 2.059101, -0.2588766, 1, 1, 1, 1, 1,
1.681647, 0.6443716, 2.406132, 1, 1, 1, 1, 1,
1.686547, -0.7399756, 2.981428, 1, 1, 1, 1, 1,
1.693269, -1.233462, 2.556123, 1, 1, 1, 1, 1,
1.69379, 0.6628714, 3.519448, 1, 1, 1, 1, 1,
1.701251, -0.1394162, 1.831969, 1, 1, 1, 1, 1,
1.717494, 1.735909, 2.250542, 1, 1, 1, 1, 1,
1.726506, 0.07590994, 2.424181, 1, 1, 1, 1, 1,
1.731906, -0.7055146, 2.364923, 0, 0, 1, 1, 1,
1.745178, 2.005048, 1.701281, 1, 0, 0, 1, 1,
1.745523, 0.8796322, 1.179218, 1, 0, 0, 1, 1,
1.764425, -0.2846621, 0.2622634, 1, 0, 0, 1, 1,
1.767957, 0.8574246, 2.449891, 1, 0, 0, 1, 1,
1.785619, -0.1324452, 1.376734, 1, 0, 0, 1, 1,
1.792454, 1.290399, -0.1443641, 0, 0, 0, 1, 1,
1.795002, -1.299432, 0.6108888, 0, 0, 0, 1, 1,
1.796022, -0.64432, 4.883946, 0, 0, 0, 1, 1,
1.803753, 0.4344848, 1.263897, 0, 0, 0, 1, 1,
1.829022, -2.664658, 4.844702, 0, 0, 0, 1, 1,
1.831074, 1.688285, 1.793493, 0, 0, 0, 1, 1,
1.837938, 0.5353165, 2.016592, 0, 0, 0, 1, 1,
1.856357, -0.3793532, 2.237904, 1, 1, 1, 1, 1,
1.863325, 0.09949932, 2.089538, 1, 1, 1, 1, 1,
1.871076, -2.778154, 1.411971, 1, 1, 1, 1, 1,
1.875609, 0.2720317, 2.944752, 1, 1, 1, 1, 1,
1.888645, -1.782154, 1.131334, 1, 1, 1, 1, 1,
1.91748, 0.166086, 0.2822974, 1, 1, 1, 1, 1,
1.921376, 1.845581, -0.3673226, 1, 1, 1, 1, 1,
1.932707, -0.3580853, 2.401605, 1, 1, 1, 1, 1,
1.93277, -1.309264, 0.4209294, 1, 1, 1, 1, 1,
1.952924, 1.051038, 0.4905623, 1, 1, 1, 1, 1,
1.963507, 1.057655, 0.9031911, 1, 1, 1, 1, 1,
1.969862, -0.3537381, 3.175649, 1, 1, 1, 1, 1,
1.988458, 0.178171, 0.5470305, 1, 1, 1, 1, 1,
2.034027, 1.012623, 0.8634737, 1, 1, 1, 1, 1,
2.035424, 0.3440601, 2.466839, 1, 1, 1, 1, 1,
2.043615, -0.2960975, 1.453935, 0, 0, 1, 1, 1,
2.076367, -0.5341161, 1.070633, 1, 0, 0, 1, 1,
2.08387, 1.008001, -0.614943, 1, 0, 0, 1, 1,
2.084188, 1.567314, 1.083824, 1, 0, 0, 1, 1,
2.111057, -0.673633, 2.088984, 1, 0, 0, 1, 1,
2.158354, -1.089201, 3.020505, 1, 0, 0, 1, 1,
2.160873, -0.7863148, 2.322553, 0, 0, 0, 1, 1,
2.179223, 1.168125, 1.637843, 0, 0, 0, 1, 1,
2.202247, -0.5526044, 2.415253, 0, 0, 0, 1, 1,
2.251707, -0.4100363, 1.436396, 0, 0, 0, 1, 1,
2.261917, -0.379917, 2.637994, 0, 0, 0, 1, 1,
2.306805, 0.5841705, 1.727029, 0, 0, 0, 1, 1,
2.361481, -1.250512, 3.10618, 0, 0, 0, 1, 1,
2.37123, 0.3989865, 3.366203, 1, 1, 1, 1, 1,
2.400281, 2.073343, 1.615117, 1, 1, 1, 1, 1,
2.451386, 0.2729304, 1.601996, 1, 1, 1, 1, 1,
2.51604, -0.4111776, 0.9435873, 1, 1, 1, 1, 1,
2.546581, -1.394807, 1.197609, 1, 1, 1, 1, 1,
2.879029, 0.3958919, 0.7225501, 1, 1, 1, 1, 1,
3.26933, -0.4210513, 2.624385, 1, 1, 1, 1, 1
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
var radius = 9.633972;
var distance = 33.83892;
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
mvMatrix.translate( 0.05989885, 0.4441222, 0.3121905 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.83892);
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
