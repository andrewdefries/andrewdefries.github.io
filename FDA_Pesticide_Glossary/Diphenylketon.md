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
-2.67633, -0.3778545, -2.932708, 1, 0, 0, 1,
-2.64509, -0.7951601, -2.102368, 1, 0.007843138, 0, 1,
-2.61258, -0.292573, -2.138748, 1, 0.01176471, 0, 1,
-2.233524, -2.625022, -1.143957, 1, 0.01960784, 0, 1,
-2.200698, -0.425347, -2.700214, 1, 0.02352941, 0, 1,
-2.196868, -0.4707721, -0.6276754, 1, 0.03137255, 0, 1,
-2.150063, -1.947002, -1.789591, 1, 0.03529412, 0, 1,
-2.10761, -0.06773562, -1.557985, 1, 0.04313726, 0, 1,
-2.074811, 0.5429919, -1.690048, 1, 0.04705882, 0, 1,
-2.068635, 1.886152, -2.590375, 1, 0.05490196, 0, 1,
-2.066619, -2.031078, -1.186979, 1, 0.05882353, 0, 1,
-2.040764, 0.2716587, -0.4947722, 1, 0.06666667, 0, 1,
-1.971059, -1.395224, -2.136071, 1, 0.07058824, 0, 1,
-1.948003, -0.05211385, -0.5114836, 1, 0.07843138, 0, 1,
-1.922889, 0.4152236, -0.8196942, 1, 0.08235294, 0, 1,
-1.90933, 0.8343554, -0.6260615, 1, 0.09019608, 0, 1,
-1.900733, 1.222579, -2.224386, 1, 0.09411765, 0, 1,
-1.873818, -0.2390172, -0.8974593, 1, 0.1019608, 0, 1,
-1.867446, -0.9923151, -2.893396, 1, 0.1098039, 0, 1,
-1.862297, -0.2199305, -1.370962, 1, 0.1137255, 0, 1,
-1.842132, 0.3834634, -1.866355, 1, 0.1215686, 0, 1,
-1.828887, 0.5832364, -0.4002795, 1, 0.1254902, 0, 1,
-1.808305, -1.012319, -2.300811, 1, 0.1333333, 0, 1,
-1.763121, 0.9939954, -0.6161336, 1, 0.1372549, 0, 1,
-1.709994, 0.3118038, -1.076082, 1, 0.145098, 0, 1,
-1.704441, 1.232422, 0.1639461, 1, 0.1490196, 0, 1,
-1.698363, 0.458179, -1.945201, 1, 0.1568628, 0, 1,
-1.68912, 0.5057819, -0.8920701, 1, 0.1607843, 0, 1,
-1.677278, -0.8803487, -1.350796, 1, 0.1686275, 0, 1,
-1.671993, 0.7008844, 0.05937054, 1, 0.172549, 0, 1,
-1.656574, 0.4153121, -1.999284, 1, 0.1803922, 0, 1,
-1.648591, -0.5987405, -1.081114, 1, 0.1843137, 0, 1,
-1.636979, 0.05240845, -2.197039, 1, 0.1921569, 0, 1,
-1.616243, -1.765951, -4.57791, 1, 0.1960784, 0, 1,
-1.615832, 1.56726, -1.376243, 1, 0.2039216, 0, 1,
-1.608672, 0.9618601, -0.1003244, 1, 0.2117647, 0, 1,
-1.607411, -0.452191, -4.649762, 1, 0.2156863, 0, 1,
-1.569612, 1.445176, -1.687024, 1, 0.2235294, 0, 1,
-1.552925, -0.6811128, -1.789714, 1, 0.227451, 0, 1,
-1.542367, -2.25527, -1.750904, 1, 0.2352941, 0, 1,
-1.532483, -0.7840849, -0.8409408, 1, 0.2392157, 0, 1,
-1.532477, -1.43555, -1.972685, 1, 0.2470588, 0, 1,
-1.529497, 0.7282895, 1.474256, 1, 0.2509804, 0, 1,
-1.525801, -0.2946008, -0.2437955, 1, 0.2588235, 0, 1,
-1.521678, -0.7042429, -1.509543, 1, 0.2627451, 0, 1,
-1.512957, -1.530169, -2.40438, 1, 0.2705882, 0, 1,
-1.505998, -0.692642, -1.298721, 1, 0.2745098, 0, 1,
-1.488182, -0.5872089, -1.480226, 1, 0.282353, 0, 1,
-1.484012, 1.142142, -1.274468, 1, 0.2862745, 0, 1,
-1.482222, 0.07187669, -0.9668301, 1, 0.2941177, 0, 1,
-1.475942, 1.77279, -0.6118012, 1, 0.3019608, 0, 1,
-1.469688, 1.057734, -0.8202637, 1, 0.3058824, 0, 1,
-1.45208, -0.1002077, -2.86052, 1, 0.3137255, 0, 1,
-1.451191, 0.7197892, -0.1214662, 1, 0.3176471, 0, 1,
-1.450269, 0.2651284, -1.51591, 1, 0.3254902, 0, 1,
-1.450052, -0.82954, -3.289982, 1, 0.3294118, 0, 1,
-1.445585, 0.4624168, -0.7511451, 1, 0.3372549, 0, 1,
-1.444594, -0.9338993, 0.02562283, 1, 0.3411765, 0, 1,
-1.438108, -0.3328742, -1.803689, 1, 0.3490196, 0, 1,
-1.433413, -0.4623636, -1.514537, 1, 0.3529412, 0, 1,
-1.431885, -0.1930505, -2.768291, 1, 0.3607843, 0, 1,
-1.417048, -0.463514, -2.626477, 1, 0.3647059, 0, 1,
-1.413275, -2.184611, -2.226504, 1, 0.372549, 0, 1,
-1.412105, -0.4705606, -1.160278, 1, 0.3764706, 0, 1,
-1.410757, -0.703346, -1.997183, 1, 0.3843137, 0, 1,
-1.397995, -0.1482179, -1.014395, 1, 0.3882353, 0, 1,
-1.390001, -1.072969, -1.652924, 1, 0.3960784, 0, 1,
-1.388612, 1.297304, -2.029655, 1, 0.4039216, 0, 1,
-1.386799, 0.4274191, -0.828933, 1, 0.4078431, 0, 1,
-1.367473, 0.4115042, -0.9608697, 1, 0.4156863, 0, 1,
-1.361745, -1.267533, -1.536303, 1, 0.4196078, 0, 1,
-1.360451, -1.085332, -1.438014, 1, 0.427451, 0, 1,
-1.354028, -0.1043346, -1.761208, 1, 0.4313726, 0, 1,
-1.353264, 1.588178, -0.7133106, 1, 0.4392157, 0, 1,
-1.337597, 0.9923905, -1.20677, 1, 0.4431373, 0, 1,
-1.327422, -0.6298937, -1.912285, 1, 0.4509804, 0, 1,
-1.323844, 1.354529, 0.372886, 1, 0.454902, 0, 1,
-1.310478, 0.3014334, -2.245045, 1, 0.4627451, 0, 1,
-1.308325, -1.095405, -3.720658, 1, 0.4666667, 0, 1,
-1.301774, -1.779438, -3.137901, 1, 0.4745098, 0, 1,
-1.300342, -1.703446, -1.97241, 1, 0.4784314, 0, 1,
-1.294087, 0.6604672, -1.4694, 1, 0.4862745, 0, 1,
-1.289469, -1.093175, -0.8515068, 1, 0.4901961, 0, 1,
-1.287943, -1.836095, -1.068889, 1, 0.4980392, 0, 1,
-1.28689, 0.2170456, -3.174716, 1, 0.5058824, 0, 1,
-1.275288, -0.3950018, -1.949325, 1, 0.509804, 0, 1,
-1.273895, 0.3331718, -1.726683, 1, 0.5176471, 0, 1,
-1.269155, 0.3660583, -2.814801, 1, 0.5215687, 0, 1,
-1.26417, 0.9500095, -0.9055792, 1, 0.5294118, 0, 1,
-1.253213, 1.679065, 0.1758234, 1, 0.5333334, 0, 1,
-1.251044, -0.9710094, -2.033538, 1, 0.5411765, 0, 1,
-1.240238, 0.7065256, -1.364931, 1, 0.5450981, 0, 1,
-1.239874, 0.3297107, 0.244554, 1, 0.5529412, 0, 1,
-1.225972, -1.427531, -2.981991, 1, 0.5568628, 0, 1,
-1.221916, 0.002066442, -2.300645, 1, 0.5647059, 0, 1,
-1.210667, 0.00713589, -2.094838, 1, 0.5686275, 0, 1,
-1.205449, -2.54074, -4.210454, 1, 0.5764706, 0, 1,
-1.198761, 1.662683, -1.284756, 1, 0.5803922, 0, 1,
-1.188958, 1.822863, -0.5986353, 1, 0.5882353, 0, 1,
-1.188619, 0.02947747, -2.923621, 1, 0.5921569, 0, 1,
-1.185395, -0.6216636, -1.174106, 1, 0.6, 0, 1,
-1.179717, -1.732166, -3.945131, 1, 0.6078432, 0, 1,
-1.178789, 0.5614243, -0.9274041, 1, 0.6117647, 0, 1,
-1.174925, -1.195136, -1.995097, 1, 0.6196079, 0, 1,
-1.158568, 0.4352056, -0.9851444, 1, 0.6235294, 0, 1,
-1.156003, -0.2086186, -1.465391, 1, 0.6313726, 0, 1,
-1.153853, -2.552321, -3.087099, 1, 0.6352941, 0, 1,
-1.152476, -0.6958104, -0.5050429, 1, 0.6431373, 0, 1,
-1.140072, -1.035507, -2.786726, 1, 0.6470588, 0, 1,
-1.137779, 0.0573623, -2.068401, 1, 0.654902, 0, 1,
-1.13702, 1.18992, -1.469366, 1, 0.6588235, 0, 1,
-1.134549, -2.664474, -3.036045, 1, 0.6666667, 0, 1,
-1.122797, 0.7320437, -1.120398, 1, 0.6705883, 0, 1,
-1.118364, 0.5184528, -0.672828, 1, 0.6784314, 0, 1,
-1.116298, 0.6507846, -1.457979, 1, 0.682353, 0, 1,
-1.115636, -0.9501787, -1.431697, 1, 0.6901961, 0, 1,
-1.111401, -0.942157, -3.16827, 1, 0.6941177, 0, 1,
-1.109227, 0.7591652, -2.108106, 1, 0.7019608, 0, 1,
-1.102075, -0.4772255, -2.644577, 1, 0.7098039, 0, 1,
-1.099734, 0.2252634, -1.156799, 1, 0.7137255, 0, 1,
-1.09708, -0.2711967, -1.478108, 1, 0.7215686, 0, 1,
-1.095795, -1.335423, -1.594667, 1, 0.7254902, 0, 1,
-1.094114, -0.9888284, -4.13266, 1, 0.7333333, 0, 1,
-1.09324, 0.1545599, 0.6004954, 1, 0.7372549, 0, 1,
-1.083931, -0.8232746, -3.734738, 1, 0.7450981, 0, 1,
-1.073456, -0.7073454, -1.542631, 1, 0.7490196, 0, 1,
-1.071105, 1.052192, 0.166202, 1, 0.7568628, 0, 1,
-1.070879, -0.9407906, -2.691636, 1, 0.7607843, 0, 1,
-1.061144, -0.4240401, -1.736487, 1, 0.7686275, 0, 1,
-1.052359, 0.2379007, -0.5873232, 1, 0.772549, 0, 1,
-1.048, 0.6253493, -2.214099, 1, 0.7803922, 0, 1,
-1.039871, 0.7508228, 0.115828, 1, 0.7843137, 0, 1,
-1.039712, -1.435721, -2.458074, 1, 0.7921569, 0, 1,
-1.035191, 0.9507023, 0.8157201, 1, 0.7960784, 0, 1,
-1.031712, 0.06034748, -2.206168, 1, 0.8039216, 0, 1,
-1.025571, -2.049686, -2.299557, 1, 0.8117647, 0, 1,
-1.025158, 1.761982, 0.7330414, 1, 0.8156863, 0, 1,
-1.024512, 2.006438, -0.5359635, 1, 0.8235294, 0, 1,
-1.020863, -0.9302292, -3.905649, 1, 0.827451, 0, 1,
-1.02019, 1.0517, -0.09730881, 1, 0.8352941, 0, 1,
-1.018222, 1.158762, 0.3277309, 1, 0.8392157, 0, 1,
-1.016452, -1.891702, -1.660791, 1, 0.8470588, 0, 1,
-1.013587, -0.2671483, -1.829186, 1, 0.8509804, 0, 1,
-1.012622, -0.3881198, -0.294247, 1, 0.8588235, 0, 1,
-1.008323, 0.8643863, 0.4352088, 1, 0.8627451, 0, 1,
-1.002378, 1.430247, 0.8681327, 1, 0.8705882, 0, 1,
-0.9989843, -0.919151, -1.801736, 1, 0.8745098, 0, 1,
-0.9939531, 0.1553, -0.5463538, 1, 0.8823529, 0, 1,
-0.9914567, 0.6976962, -0.5987922, 1, 0.8862745, 0, 1,
-0.9871986, -0.4430279, -2.702901, 1, 0.8941177, 0, 1,
-0.9870988, -0.7372053, -1.433454, 1, 0.8980392, 0, 1,
-0.9869041, 1.172374, -0.6841177, 1, 0.9058824, 0, 1,
-0.9798779, 0.8322854, -1.880897, 1, 0.9137255, 0, 1,
-0.9795161, 1.977694, -0.6382784, 1, 0.9176471, 0, 1,
-0.9736965, -0.8918247, -2.806982, 1, 0.9254902, 0, 1,
-0.9711724, 1.474152, -1.230086, 1, 0.9294118, 0, 1,
-0.9707494, -1.311951, -3.04875, 1, 0.9372549, 0, 1,
-0.9655961, -1.021299, -0.4516566, 1, 0.9411765, 0, 1,
-0.9569266, -0.7161411, -1.747901, 1, 0.9490196, 0, 1,
-0.9531131, 2.686463, 0.1714855, 1, 0.9529412, 0, 1,
-0.9497237, -2.30873, -2.339564, 1, 0.9607843, 0, 1,
-0.9486684, 0.9417915, -1.431308, 1, 0.9647059, 0, 1,
-0.9472775, -0.7096868, -2.2483, 1, 0.972549, 0, 1,
-0.9454205, 0.8771992, 0.09581827, 1, 0.9764706, 0, 1,
-0.944794, -0.7702856, -3.40806, 1, 0.9843137, 0, 1,
-0.9441302, 1.90944, 0.640469, 1, 0.9882353, 0, 1,
-0.9369288, 1.346204, -0.326543, 1, 0.9960784, 0, 1,
-0.9366739, 0.9459692, -1.032355, 0.9960784, 1, 0, 1,
-0.9246907, 1.13884, -2.150331, 0.9921569, 1, 0, 1,
-0.9211484, -0.1373907, -2.214, 0.9843137, 1, 0, 1,
-0.9129503, -0.7293702, -1.635193, 0.9803922, 1, 0, 1,
-0.9092589, 1.779927, -0.7562203, 0.972549, 1, 0, 1,
-0.9079677, 0.4945514, -2.426193, 0.9686275, 1, 0, 1,
-0.9067033, 0.7682513, -0.7432572, 0.9607843, 1, 0, 1,
-0.9055524, -0.02324802, -1.138808, 0.9568627, 1, 0, 1,
-0.8950134, 1.274774, 1.129034, 0.9490196, 1, 0, 1,
-0.8922452, 1.107276, -1.172175, 0.945098, 1, 0, 1,
-0.8782886, 0.3865943, -0.5377117, 0.9372549, 1, 0, 1,
-0.8775574, 0.382607, 0.1920776, 0.9333333, 1, 0, 1,
-0.8725023, -2.301137, -0.1437678, 0.9254902, 1, 0, 1,
-0.863561, 0.9459048, -2.883887, 0.9215686, 1, 0, 1,
-0.8560093, -0.6187339, -4.698464, 0.9137255, 1, 0, 1,
-0.854341, 0.6952991, -0.4570718, 0.9098039, 1, 0, 1,
-0.8456715, -0.9560084, -2.146554, 0.9019608, 1, 0, 1,
-0.8443054, -0.8360141, -2.123045, 0.8941177, 1, 0, 1,
-0.8428382, 0.3618675, -0.760774, 0.8901961, 1, 0, 1,
-0.840288, 0.3374822, -2.422218, 0.8823529, 1, 0, 1,
-0.8400813, -0.4496091, -1.570567, 0.8784314, 1, 0, 1,
-0.8383185, 0.7495116, 0.04062824, 0.8705882, 1, 0, 1,
-0.8363771, -1.364847, -2.706161, 0.8666667, 1, 0, 1,
-0.8302782, -1.166938, -1.265059, 0.8588235, 1, 0, 1,
-0.8287443, 1.805187, -0.9242379, 0.854902, 1, 0, 1,
-0.8271442, 0.8570112, 0.07346836, 0.8470588, 1, 0, 1,
-0.8199579, 0.4271254, -1.189001, 0.8431373, 1, 0, 1,
-0.816057, -1.367787, -1.536581, 0.8352941, 1, 0, 1,
-0.8137909, -1.413805, -2.430119, 0.8313726, 1, 0, 1,
-0.808318, 2.319018, 0.2781263, 0.8235294, 1, 0, 1,
-0.8081746, 0.2454671, -0.4728536, 0.8196079, 1, 0, 1,
-0.8057879, -0.7540489, -0.4135247, 0.8117647, 1, 0, 1,
-0.8033347, -0.9885275, -2.498209, 0.8078431, 1, 0, 1,
-0.8005756, -1.12932, -2.097479, 0.8, 1, 0, 1,
-0.8003801, -0.7337377, -2.96615, 0.7921569, 1, 0, 1,
-0.7981588, 1.165824, 0.2716907, 0.7882353, 1, 0, 1,
-0.7943773, 0.3734033, 0.833457, 0.7803922, 1, 0, 1,
-0.7926218, -0.1921317, -2.520869, 0.7764706, 1, 0, 1,
-0.7802188, 0.807357, -1.077689, 0.7686275, 1, 0, 1,
-0.7798141, -1.922708, -2.836278, 0.7647059, 1, 0, 1,
-0.7795888, -0.5705477, -2.921833, 0.7568628, 1, 0, 1,
-0.7781537, 0.1145155, -0.8986538, 0.7529412, 1, 0, 1,
-0.7771131, -1.079111, 0.2441397, 0.7450981, 1, 0, 1,
-0.7767981, -0.6477463, -2.800534, 0.7411765, 1, 0, 1,
-0.776579, 0.7528935, 0.1407017, 0.7333333, 1, 0, 1,
-0.7656333, -2.190399, -2.010717, 0.7294118, 1, 0, 1,
-0.7625421, -0.2584668, -3.557986, 0.7215686, 1, 0, 1,
-0.7587194, -0.938335, -2.112566, 0.7176471, 1, 0, 1,
-0.7515748, -0.8065506, -3.52963, 0.7098039, 1, 0, 1,
-0.7511282, 0.3718254, -0.6344036, 0.7058824, 1, 0, 1,
-0.7492193, 0.3646399, -1.013081, 0.6980392, 1, 0, 1,
-0.7477355, -0.6009764, -1.625636, 0.6901961, 1, 0, 1,
-0.7422237, -0.4917141, -1.00373, 0.6862745, 1, 0, 1,
-0.7396274, 0.5762923, -2.179336, 0.6784314, 1, 0, 1,
-0.7380799, -1.451561, -2.985756, 0.6745098, 1, 0, 1,
-0.7348228, 0.7965384, 1.517211, 0.6666667, 1, 0, 1,
-0.7330365, -1.054615, -3.909691, 0.6627451, 1, 0, 1,
-0.731534, -0.216015, -1.711485, 0.654902, 1, 0, 1,
-0.727689, 0.0677507, -1.324233, 0.6509804, 1, 0, 1,
-0.7272949, 0.01454079, -2.36193, 0.6431373, 1, 0, 1,
-0.7231189, 0.3579336, 0.7452553, 0.6392157, 1, 0, 1,
-0.7196547, -1.6946, -3.579588, 0.6313726, 1, 0, 1,
-0.718821, -1.732815, -1.780991, 0.627451, 1, 0, 1,
-0.7165951, 0.2171553, -2.009144, 0.6196079, 1, 0, 1,
-0.714587, 0.3957887, 0.5658592, 0.6156863, 1, 0, 1,
-0.7123824, 0.1198994, -0.6553553, 0.6078432, 1, 0, 1,
-0.7120339, 1.353859, -1.210192, 0.6039216, 1, 0, 1,
-0.7106634, 1.023476, -0.7176672, 0.5960785, 1, 0, 1,
-0.7073212, -0.7348148, -3.237677, 0.5882353, 1, 0, 1,
-0.7064961, -0.4161747, -2.608952, 0.5843138, 1, 0, 1,
-0.7029288, 0.06942107, 0.05068654, 0.5764706, 1, 0, 1,
-0.7012088, 0.9725177, -1.362827, 0.572549, 1, 0, 1,
-0.6986107, -1.498063, -2.367363, 0.5647059, 1, 0, 1,
-0.6916447, 0.08126807, -1.943024, 0.5607843, 1, 0, 1,
-0.6872767, 1.382163, -0.7548215, 0.5529412, 1, 0, 1,
-0.6851584, 0.1512018, -1.995329, 0.5490196, 1, 0, 1,
-0.6772304, -0.2713808, -2.913506, 0.5411765, 1, 0, 1,
-0.6716977, -0.5452976, -1.592428, 0.5372549, 1, 0, 1,
-0.6708307, 0.2512736, -1.510925, 0.5294118, 1, 0, 1,
-0.6594141, -0.2073333, -1.085921, 0.5254902, 1, 0, 1,
-0.648052, 1.011986, -2.189723, 0.5176471, 1, 0, 1,
-0.6474677, 0.1216814, -0.7547244, 0.5137255, 1, 0, 1,
-0.6472105, -0.9490648, -3.465413, 0.5058824, 1, 0, 1,
-0.6364115, 1.016748, 1.175096, 0.5019608, 1, 0, 1,
-0.6321263, -0.3327048, -0.6947414, 0.4941176, 1, 0, 1,
-0.6292679, -0.538811, -3.68147, 0.4862745, 1, 0, 1,
-0.6268225, 0.9332134, -0.04365142, 0.4823529, 1, 0, 1,
-0.6260045, 0.8360991, -1.643316, 0.4745098, 1, 0, 1,
-0.6258074, -0.3352004, -2.443746, 0.4705882, 1, 0, 1,
-0.6256044, -0.3951834, -1.157196, 0.4627451, 1, 0, 1,
-0.625028, 1.599795, -0.4088959, 0.4588235, 1, 0, 1,
-0.623467, -0.5775176, -3.579919, 0.4509804, 1, 0, 1,
-0.6147512, -0.4077001, -2.360612, 0.4470588, 1, 0, 1,
-0.6134171, -0.1443711, -2.599639, 0.4392157, 1, 0, 1,
-0.6099017, -0.1087032, -1.232393, 0.4352941, 1, 0, 1,
-0.6035239, -1.175866, -2.485961, 0.427451, 1, 0, 1,
-0.5986834, -0.3864539, -0.9506668, 0.4235294, 1, 0, 1,
-0.5936198, 0.8304712, -1.71623, 0.4156863, 1, 0, 1,
-0.5762413, -0.7899346, -2.702713, 0.4117647, 1, 0, 1,
-0.5734129, -0.8927235, -2.581782, 0.4039216, 1, 0, 1,
-0.5725793, 0.2120718, -1.05076, 0.3960784, 1, 0, 1,
-0.5700008, 0.70372, -0.1889685, 0.3921569, 1, 0, 1,
-0.5689111, -0.65115, -2.021821, 0.3843137, 1, 0, 1,
-0.5647327, -0.2997754, -2.176567, 0.3803922, 1, 0, 1,
-0.5634279, 1.018577, -1.301485, 0.372549, 1, 0, 1,
-0.5610346, 1.327827, 0.178787, 0.3686275, 1, 0, 1,
-0.5578861, 0.4197462, -1.200914, 0.3607843, 1, 0, 1,
-0.5539551, 0.9553144, -0.7560388, 0.3568628, 1, 0, 1,
-0.5507427, 0.1223388, -1.394359, 0.3490196, 1, 0, 1,
-0.5454979, -0.3881916, -1.570203, 0.345098, 1, 0, 1,
-0.5414639, -0.5470134, -1.881193, 0.3372549, 1, 0, 1,
-0.5392491, -2.370865, -3.573217, 0.3333333, 1, 0, 1,
-0.5388074, 0.3365758, -1.989781, 0.3254902, 1, 0, 1,
-0.5372407, -1.065093, -2.906979, 0.3215686, 1, 0, 1,
-0.5313579, -1.368684, -0.2609557, 0.3137255, 1, 0, 1,
-0.5294573, 0.1100646, -2.153116, 0.3098039, 1, 0, 1,
-0.5284386, -0.03316608, -2.068084, 0.3019608, 1, 0, 1,
-0.5284255, 1.59386, -1.196241, 0.2941177, 1, 0, 1,
-0.5261856, 0.4813081, -1.335633, 0.2901961, 1, 0, 1,
-0.5188761, -0.5946136, -2.255367, 0.282353, 1, 0, 1,
-0.5180227, 0.06646801, -3.2284, 0.2784314, 1, 0, 1,
-0.507878, -1.000665, -1.600215, 0.2705882, 1, 0, 1,
-0.5068495, -0.9389014, -3.369624, 0.2666667, 1, 0, 1,
-0.504091, 0.2779713, -0.7869127, 0.2588235, 1, 0, 1,
-0.5035048, 0.4844562, -0.5696153, 0.254902, 1, 0, 1,
-0.5024443, -0.2039376, -1.020274, 0.2470588, 1, 0, 1,
-0.4983554, 0.615472, -1.195713, 0.2431373, 1, 0, 1,
-0.4975379, 1.044899, -0.06419383, 0.2352941, 1, 0, 1,
-0.4915314, -0.5912321, -1.731568, 0.2313726, 1, 0, 1,
-0.4900854, -0.06300158, -0.07421594, 0.2235294, 1, 0, 1,
-0.4846934, -0.2811138, -2.465365, 0.2196078, 1, 0, 1,
-0.4760389, -0.3815885, -4.27898, 0.2117647, 1, 0, 1,
-0.474876, -1.099958, -3.496732, 0.2078431, 1, 0, 1,
-0.4742453, -0.4289467, -3.714379, 0.2, 1, 0, 1,
-0.4738879, 0.7972442, -0.5320637, 0.1921569, 1, 0, 1,
-0.4735199, 0.5035063, -0.2606779, 0.1882353, 1, 0, 1,
-0.4730069, -2.344741, -4.227046, 0.1803922, 1, 0, 1,
-0.4722326, -0.516394, -0.9409021, 0.1764706, 1, 0, 1,
-0.471118, 0.4839695, -0.402245, 0.1686275, 1, 0, 1,
-0.466792, 0.5262234, -1.583016, 0.1647059, 1, 0, 1,
-0.4664796, 1.308129, -0.4589205, 0.1568628, 1, 0, 1,
-0.4641214, -0.8980978, -2.640604, 0.1529412, 1, 0, 1,
-0.4599583, 0.2212211, -1.478614, 0.145098, 1, 0, 1,
-0.4575564, -0.9141627, -2.622052, 0.1411765, 1, 0, 1,
-0.4566912, 0.7993613, -0.1296227, 0.1333333, 1, 0, 1,
-0.45468, 0.9397754, -0.3611466, 0.1294118, 1, 0, 1,
-0.4531106, -0.6024613, -2.278078, 0.1215686, 1, 0, 1,
-0.4468168, -1.402542, -1.553268, 0.1176471, 1, 0, 1,
-0.4459458, 0.7608747, -1.884072, 0.1098039, 1, 0, 1,
-0.4404817, 0.531031, -1.379813, 0.1058824, 1, 0, 1,
-0.4379527, -0.428455, -3.41793, 0.09803922, 1, 0, 1,
-0.431472, 0.4972772, -1.384777, 0.09019608, 1, 0, 1,
-0.4304759, 1.132412, 0.3050078, 0.08627451, 1, 0, 1,
-0.4286557, -0.7715185, -2.044183, 0.07843138, 1, 0, 1,
-0.4278969, -0.1746924, -1.177994, 0.07450981, 1, 0, 1,
-0.4276935, 1.29445, 0.9262344, 0.06666667, 1, 0, 1,
-0.4260267, -0.3269784, -3.442339, 0.0627451, 1, 0, 1,
-0.4240409, -0.9048594, -1.935694, 0.05490196, 1, 0, 1,
-0.4231593, -1.15073, -1.492405, 0.05098039, 1, 0, 1,
-0.4183863, -1.037489, -2.637665, 0.04313726, 1, 0, 1,
-0.4020875, 0.6080296, -0.3479245, 0.03921569, 1, 0, 1,
-0.3991875, 1.446736, -0.7938588, 0.03137255, 1, 0, 1,
-0.397679, -0.5376838, -1.752389, 0.02745098, 1, 0, 1,
-0.3931811, -0.07074659, -1.721409, 0.01960784, 1, 0, 1,
-0.3886488, -0.3661573, -4.732939, 0.01568628, 1, 0, 1,
-0.3816314, 0.6993504, -0.8698004, 0.007843138, 1, 0, 1,
-0.3775636, 1.314328, 0.6787358, 0.003921569, 1, 0, 1,
-0.3695872, 0.7447379, -0.2410876, 0, 1, 0.003921569, 1,
-0.3693645, -0.7681789, -3.864693, 0, 1, 0.01176471, 1,
-0.3688625, -0.7061183, -2.317043, 0, 1, 0.01568628, 1,
-0.3680286, -2.712283, -4.630444, 0, 1, 0.02352941, 1,
-0.3676939, -0.2498612, -1.947568, 0, 1, 0.02745098, 1,
-0.3638664, -1.42456, -2.897732, 0, 1, 0.03529412, 1,
-0.3618586, -1.237008, -1.799317, 0, 1, 0.03921569, 1,
-0.360533, -0.4067492, -4.064585, 0, 1, 0.04705882, 1,
-0.3585511, 0.912005, 0.1708356, 0, 1, 0.05098039, 1,
-0.3562911, 2.365674, 1.311863, 0, 1, 0.05882353, 1,
-0.3559934, -0.2440288, -2.651428, 0, 1, 0.0627451, 1,
-0.3544125, 0.2770315, -2.028736, 0, 1, 0.07058824, 1,
-0.3525405, -1.015158, -2.108526, 0, 1, 0.07450981, 1,
-0.3518417, 0.5420628, -1.613447, 0, 1, 0.08235294, 1,
-0.3500348, 0.3867443, -1.288441, 0, 1, 0.08627451, 1,
-0.3462901, -1.181225, -2.834662, 0, 1, 0.09411765, 1,
-0.3459502, 0.5478672, -0.7267498, 0, 1, 0.1019608, 1,
-0.3453802, 0.1546818, -2.298875, 0, 1, 0.1058824, 1,
-0.3453249, 0.4831189, -1.022213, 0, 1, 0.1137255, 1,
-0.3444698, -0.3372955, -3.427129, 0, 1, 0.1176471, 1,
-0.3437497, -0.5633128, -1.199774, 0, 1, 0.1254902, 1,
-0.3368121, 0.2721198, -1.883477, 0, 1, 0.1294118, 1,
-0.3361337, -0.1259093, -2.576927, 0, 1, 0.1372549, 1,
-0.3346853, 1.51059, -1.472539, 0, 1, 0.1411765, 1,
-0.3339945, 0.009155571, -2.207608, 0, 1, 0.1490196, 1,
-0.3323573, 0.3655085, -2.427441, 0, 1, 0.1529412, 1,
-0.3302009, -0.5178257, -3.878313, 0, 1, 0.1607843, 1,
-0.3249461, 0.2029929, -0.3985122, 0, 1, 0.1647059, 1,
-0.3248422, 0.4899552, 0.2069495, 0, 1, 0.172549, 1,
-0.3248238, -1.436781, -2.382119, 0, 1, 0.1764706, 1,
-0.3213134, -0.08781384, -2.528681, 0, 1, 0.1843137, 1,
-0.3201058, -1.476443, -1.791329, 0, 1, 0.1882353, 1,
-0.3169444, 0.4551535, -0.09727592, 0, 1, 0.1960784, 1,
-0.3139231, 1.003754, 0.7224371, 0, 1, 0.2039216, 1,
-0.3117715, 0.4970903, -0.2779637, 0, 1, 0.2078431, 1,
-0.3095644, 0.8547862, -0.6660661, 0, 1, 0.2156863, 1,
-0.306413, 0.8241403, 0.06232121, 0, 1, 0.2196078, 1,
-0.3039264, -0.09161036, -2.510823, 0, 1, 0.227451, 1,
-0.3009756, 0.5716397, -0.8767556, 0, 1, 0.2313726, 1,
-0.2982645, 1.346227, -0.2380808, 0, 1, 0.2392157, 1,
-0.297676, -1.106422, -3.46734, 0, 1, 0.2431373, 1,
-0.2974643, 0.2995264, -0.552097, 0, 1, 0.2509804, 1,
-0.2954289, 1.382141, 0.3756727, 0, 1, 0.254902, 1,
-0.2929447, -0.3423241, -1.747474, 0, 1, 0.2627451, 1,
-0.2918247, -1.363465, -2.054456, 0, 1, 0.2666667, 1,
-0.2911005, -0.1881179, -3.816768, 0, 1, 0.2745098, 1,
-0.289492, 0.5258511, -1.489496, 0, 1, 0.2784314, 1,
-0.2885145, 0.567708, 0.7515986, 0, 1, 0.2862745, 1,
-0.2772869, 0.8730767, -1.155195, 0, 1, 0.2901961, 1,
-0.271404, 0.8201614, 0.1511533, 0, 1, 0.2980392, 1,
-0.2713213, -1.783612, -3.973933, 0, 1, 0.3058824, 1,
-0.26994, 0.374565, -2.107465, 0, 1, 0.3098039, 1,
-0.2661532, -0.7916432, -1.923925, 0, 1, 0.3176471, 1,
-0.2657561, -0.9769838, -2.778011, 0, 1, 0.3215686, 1,
-0.2584519, -0.8424994, -3.102395, 0, 1, 0.3294118, 1,
-0.2563734, -0.7335535, -1.950153, 0, 1, 0.3333333, 1,
-0.2523512, -1.410379, -2.601236, 0, 1, 0.3411765, 1,
-0.2518438, 0.1165733, -1.564775, 0, 1, 0.345098, 1,
-0.2476259, -1.247138, -3.345865, 0, 1, 0.3529412, 1,
-0.2467984, 0.9177427, -0.415834, 0, 1, 0.3568628, 1,
-0.246442, 0.6065414, -0.6748384, 0, 1, 0.3647059, 1,
-0.2462793, 0.2039942, -1.645809, 0, 1, 0.3686275, 1,
-0.2345146, -0.0552854, -2.060724, 0, 1, 0.3764706, 1,
-0.2342122, -0.5593061, -2.66205, 0, 1, 0.3803922, 1,
-0.233307, 1.321818, 0.676723, 0, 1, 0.3882353, 1,
-0.2328967, 1.057353, -0.5422122, 0, 1, 0.3921569, 1,
-0.2296915, -0.9132673, -2.96117, 0, 1, 0.4, 1,
-0.227134, -1.617663, -2.2715, 0, 1, 0.4078431, 1,
-0.2195283, -0.4695381, -3.256544, 0, 1, 0.4117647, 1,
-0.2189703, 2.282244, 0.5987788, 0, 1, 0.4196078, 1,
-0.2185153, 0.5693757, 1.064942, 0, 1, 0.4235294, 1,
-0.2170445, 0.6078262, -0.7045656, 0, 1, 0.4313726, 1,
-0.2167119, 0.822732, -0.3460864, 0, 1, 0.4352941, 1,
-0.2133799, -0.4432589, -1.344189, 0, 1, 0.4431373, 1,
-0.2125039, 1.445081, -0.9457588, 0, 1, 0.4470588, 1,
-0.2086729, -0.5749916, -2.483389, 0, 1, 0.454902, 1,
-0.2081987, 0.7751602, -0.0471661, 0, 1, 0.4588235, 1,
-0.2074635, -0.09251942, -2.575369, 0, 1, 0.4666667, 1,
-0.2026725, 0.2941278, 0.08418728, 0, 1, 0.4705882, 1,
-0.2021746, -0.1738391, -2.492818, 0, 1, 0.4784314, 1,
-0.198581, -0.9183014, -1.655836, 0, 1, 0.4823529, 1,
-0.1975494, -0.4450192, -5.306273, 0, 1, 0.4901961, 1,
-0.1947519, 0.2714235, -0.2753553, 0, 1, 0.4941176, 1,
-0.1934663, -0.530168, -2.790326, 0, 1, 0.5019608, 1,
-0.1850857, -1.156655, -2.35875, 0, 1, 0.509804, 1,
-0.1795555, -0.775255, -5.681132, 0, 1, 0.5137255, 1,
-0.173885, 0.3482926, -0.7781431, 0, 1, 0.5215687, 1,
-0.1688157, 1.046189, -0.2397264, 0, 1, 0.5254902, 1,
-0.1669096, 1.570136, 0.2923322, 0, 1, 0.5333334, 1,
-0.1649462, -0.4209389, -3.926336, 0, 1, 0.5372549, 1,
-0.1584495, -0.7443057, -2.563385, 0, 1, 0.5450981, 1,
-0.1512098, 0.8285005, 0.8262414, 0, 1, 0.5490196, 1,
-0.1503832, 1.537713, 1.220476, 0, 1, 0.5568628, 1,
-0.1483615, -0.6100245, -1.979789, 0, 1, 0.5607843, 1,
-0.1363179, -0.2499774, -2.555791, 0, 1, 0.5686275, 1,
-0.1341086, -0.9963635, -5.080201, 0, 1, 0.572549, 1,
-0.1328788, 1.064052, -0.2555671, 0, 1, 0.5803922, 1,
-0.1303993, 0.8407159, 0.1627364, 0, 1, 0.5843138, 1,
-0.1300551, 0.8749669, -3.023479, 0, 1, 0.5921569, 1,
-0.127217, -1.117625, -4.030007, 0, 1, 0.5960785, 1,
-0.125056, 0.5554861, -0.2533719, 0, 1, 0.6039216, 1,
-0.1245456, 0.1976772, 0.1237475, 0, 1, 0.6117647, 1,
-0.1150307, 1.469621, -1.017944, 0, 1, 0.6156863, 1,
-0.1119007, -0.7008289, -6.396172, 0, 1, 0.6235294, 1,
-0.1051382, 1.557186, 0.6368546, 0, 1, 0.627451, 1,
-0.1048321, 0.5692223, -1.485043, 0, 1, 0.6352941, 1,
-0.08700892, 0.4990645, -2.651099, 0, 1, 0.6392157, 1,
-0.08653799, 1.259406, 1.187144, 0, 1, 0.6470588, 1,
-0.08091833, 0.9783927, -1.048906, 0, 1, 0.6509804, 1,
-0.07995531, -0.8556473, -1.319716, 0, 1, 0.6588235, 1,
-0.07880358, 1.078039, -1.351945, 0, 1, 0.6627451, 1,
-0.0760396, -0.540226, -3.469754, 0, 1, 0.6705883, 1,
-0.07579682, 1.405839, -0.1700961, 0, 1, 0.6745098, 1,
-0.06993663, -0.230575, -3.993815, 0, 1, 0.682353, 1,
-0.06906784, -0.045873, -2.336819, 0, 1, 0.6862745, 1,
-0.06785611, 1.481467, 0.8770836, 0, 1, 0.6941177, 1,
-0.06774157, -1.351624, -4.530787, 0, 1, 0.7019608, 1,
-0.06677908, 1.15669, -0.557874, 0, 1, 0.7058824, 1,
-0.06595717, 1.137496, 0.2943474, 0, 1, 0.7137255, 1,
-0.06172837, -1.672003, -4.017773, 0, 1, 0.7176471, 1,
-0.05995889, -0.2775424, -3.385415, 0, 1, 0.7254902, 1,
-0.05469792, -1.311486, -1.511216, 0, 1, 0.7294118, 1,
-0.05418358, -0.7424804, -3.675206, 0, 1, 0.7372549, 1,
-0.05253688, -0.5183215, -2.891455, 0, 1, 0.7411765, 1,
-0.05199597, 0.1825067, -0.2291323, 0, 1, 0.7490196, 1,
-0.05183219, 0.110004, 1.05617, 0, 1, 0.7529412, 1,
-0.0515562, 1.368538, 0.05233379, 0, 1, 0.7607843, 1,
-0.0501831, 0.7435454, -0.2354074, 0, 1, 0.7647059, 1,
-0.04895743, -0.715498, -3.164258, 0, 1, 0.772549, 1,
-0.04876934, 0.9690908, -0.2036989, 0, 1, 0.7764706, 1,
-0.04079394, 0.3649059, 0.5298778, 0, 1, 0.7843137, 1,
-0.03965735, 0.354319, -1.049794, 0, 1, 0.7882353, 1,
-0.03934674, 0.8757675, -0.9460633, 0, 1, 0.7960784, 1,
-0.03345191, 1.322367, -0.4784595, 0, 1, 0.8039216, 1,
-0.03312094, 1.140455, 1.10479, 0, 1, 0.8078431, 1,
-0.02865764, -0.8276789, -4.609111, 0, 1, 0.8156863, 1,
-0.02862219, -0.05360344, -2.679154, 0, 1, 0.8196079, 1,
-0.02242904, -0.2840253, -3.455841, 0, 1, 0.827451, 1,
-0.01977854, 1.190014, 1.176594, 0, 1, 0.8313726, 1,
-0.01833943, -0.9512743, -3.438262, 0, 1, 0.8392157, 1,
-0.01815216, -0.5567253, -1.312134, 0, 1, 0.8431373, 1,
-0.01598523, 0.3205468, -0.008729734, 0, 1, 0.8509804, 1,
-0.01237658, 2.562297, -0.02416271, 0, 1, 0.854902, 1,
-0.004874383, 0.2653373, 0.01451329, 0, 1, 0.8627451, 1,
-0.002781689, 0.7985457, -2.418366, 0, 1, 0.8666667, 1,
-0.002753474, 0.7066473, -0.9058489, 0, 1, 0.8745098, 1,
-0.001011015, -1.558104, -3.154758, 0, 1, 0.8784314, 1,
0.002207809, -0.3595901, 4.873034, 0, 1, 0.8862745, 1,
0.002433331, 0.6597782, 0.1233078, 0, 1, 0.8901961, 1,
0.002561423, -1.119135, 3.021415, 0, 1, 0.8980392, 1,
0.003142708, -2.050984, 3.28648, 0, 1, 0.9058824, 1,
0.003926429, -0.3005281, 2.450354, 0, 1, 0.9098039, 1,
0.007467885, -1.144913, 1.316334, 0, 1, 0.9176471, 1,
0.009291178, -0.3974175, 3.271245, 0, 1, 0.9215686, 1,
0.01096381, 0.4736584, 0.4966672, 0, 1, 0.9294118, 1,
0.01215511, 0.7811995, 0.6161316, 0, 1, 0.9333333, 1,
0.01261017, -0.245135, 4.431685, 0, 1, 0.9411765, 1,
0.01565054, 1.361983, -1.060689, 0, 1, 0.945098, 1,
0.01945827, -1.787491, 0.9011582, 0, 1, 0.9529412, 1,
0.02020321, 0.2913862, 1.472007, 0, 1, 0.9568627, 1,
0.02100388, -1.106276, 4.115171, 0, 1, 0.9647059, 1,
0.0217131, 1.626063, 0.9046322, 0, 1, 0.9686275, 1,
0.0239395, 0.7070251, 0.09420249, 0, 1, 0.9764706, 1,
0.02612634, 2.087282, 0.3882469, 0, 1, 0.9803922, 1,
0.0297956, -1.124867, 1.656163, 0, 1, 0.9882353, 1,
0.03234578, -0.5018918, 2.145089, 0, 1, 0.9921569, 1,
0.03618908, 0.158953, -0.08524536, 0, 1, 1, 1,
0.03649807, 1.370192, 1.406536, 0, 0.9921569, 1, 1,
0.040329, -1.104138, 5.355186, 0, 0.9882353, 1, 1,
0.04051078, 1.332337, -0.6533938, 0, 0.9803922, 1, 1,
0.04103864, -1.583356, 4.565552, 0, 0.9764706, 1, 1,
0.04350291, -1.666181, 2.974894, 0, 0.9686275, 1, 1,
0.04606523, -1.025229, 1.968649, 0, 0.9647059, 1, 1,
0.046257, -0.2234974, 2.553998, 0, 0.9568627, 1, 1,
0.05039194, -0.04133049, 3.107263, 0, 0.9529412, 1, 1,
0.05127086, 0.1605765, 1.008673, 0, 0.945098, 1, 1,
0.05599066, 0.1874086, -0.3314522, 0, 0.9411765, 1, 1,
0.05722371, 0.2499517, 0.8416793, 0, 0.9333333, 1, 1,
0.06109457, -0.4592995, 2.816634, 0, 0.9294118, 1, 1,
0.06260469, -0.8236071, 3.798563, 0, 0.9215686, 1, 1,
0.06896118, 1.512988, -0.672936, 0, 0.9176471, 1, 1,
0.06946821, -0.5576791, 3.163462, 0, 0.9098039, 1, 1,
0.06973598, 0.4873823, -0.04606489, 0, 0.9058824, 1, 1,
0.07167703, -1.507604, 2.000688, 0, 0.8980392, 1, 1,
0.08641618, -0.0454202, 1.956236, 0, 0.8901961, 1, 1,
0.08826276, -1.474008, 3.690485, 0, 0.8862745, 1, 1,
0.09047489, -0.3897356, 1.503181, 0, 0.8784314, 1, 1,
0.09334358, 2.042661, 2.641851, 0, 0.8745098, 1, 1,
0.09555896, -2.962191, 4.444388, 0, 0.8666667, 1, 1,
0.09592807, -0.271831, 4.553653, 0, 0.8627451, 1, 1,
0.1000378, 0.2455218, -0.9735644, 0, 0.854902, 1, 1,
0.1029219, -0.1384121, 3.692543, 0, 0.8509804, 1, 1,
0.1047621, 0.9703939, 0.243503, 0, 0.8431373, 1, 1,
0.1062997, 1.502831, 0.0997152, 0, 0.8392157, 1, 1,
0.1076403, -1.576497, 3.831954, 0, 0.8313726, 1, 1,
0.113347, -0.4292217, 3.795766, 0, 0.827451, 1, 1,
0.1151462, -1.273394, 3.052347, 0, 0.8196079, 1, 1,
0.1155344, -0.5151902, 2.362183, 0, 0.8156863, 1, 1,
0.1190764, -0.9730858, 2.373954, 0, 0.8078431, 1, 1,
0.1205491, 0.1610326, -0.3760208, 0, 0.8039216, 1, 1,
0.1224831, 1.683708, 0.474771, 0, 0.7960784, 1, 1,
0.1237943, -1.048202, 1.83368, 0, 0.7882353, 1, 1,
0.1257523, 0.03060756, 1.124274, 0, 0.7843137, 1, 1,
0.1276867, 0.6199427, 1.684799, 0, 0.7764706, 1, 1,
0.1289546, 0.4287574, 1.672754, 0, 0.772549, 1, 1,
0.1289733, 0.5623065, -0.6626643, 0, 0.7647059, 1, 1,
0.1357573, -0.5566723, 3.166268, 0, 0.7607843, 1, 1,
0.1363073, -0.6891257, 2.191734, 0, 0.7529412, 1, 1,
0.1430127, -0.952538, 2.531349, 0, 0.7490196, 1, 1,
0.1432968, 0.2104673, 2.072142, 0, 0.7411765, 1, 1,
0.1448075, -1.091267, 2.352824, 0, 0.7372549, 1, 1,
0.1448706, -0.1205429, 1.862022, 0, 0.7294118, 1, 1,
0.1475085, -0.5198122, 2.213216, 0, 0.7254902, 1, 1,
0.1488844, -0.1692874, 1.382388, 0, 0.7176471, 1, 1,
0.1489936, 0.8144891, 0.06801243, 0, 0.7137255, 1, 1,
0.150645, -0.6527888, 1.960956, 0, 0.7058824, 1, 1,
0.1507365, -2.584595, 2.288584, 0, 0.6980392, 1, 1,
0.1511189, 0.5765938, 1.27725, 0, 0.6941177, 1, 1,
0.1577625, -0.1249797, 3.836702, 0, 0.6862745, 1, 1,
0.160021, 1.633172, 0.1426745, 0, 0.682353, 1, 1,
0.1659276, -0.5064886, 3.589271, 0, 0.6745098, 1, 1,
0.1669396, 0.653249, 0.5883887, 0, 0.6705883, 1, 1,
0.1688601, -0.2972698, 1.841872, 0, 0.6627451, 1, 1,
0.1694678, 0.03653428, 1.283507, 0, 0.6588235, 1, 1,
0.1697579, -0.6213264, 2.695867, 0, 0.6509804, 1, 1,
0.1738786, -0.2901274, 4.458143, 0, 0.6470588, 1, 1,
0.1754586, 1.606779, 0.2567223, 0, 0.6392157, 1, 1,
0.1777492, 1.040287, -2.693659, 0, 0.6352941, 1, 1,
0.1802783, 1.665874, 0.9576715, 0, 0.627451, 1, 1,
0.1875186, -1.085966, 3.396314, 0, 0.6235294, 1, 1,
0.1905526, -1.166668, 2.074642, 0, 0.6156863, 1, 1,
0.1907022, -0.3360857, 1.820627, 0, 0.6117647, 1, 1,
0.1909537, -0.439483, 3.037032, 0, 0.6039216, 1, 1,
0.1923067, -0.9926164, 1.713001, 0, 0.5960785, 1, 1,
0.1924494, -0.502066, 3.501824, 0, 0.5921569, 1, 1,
0.194864, -1.004153, 2.101243, 0, 0.5843138, 1, 1,
0.1956136, 0.9295933, 0.8279276, 0, 0.5803922, 1, 1,
0.1967026, -2.179437, 2.510898, 0, 0.572549, 1, 1,
0.1996759, -0.8427858, 3.143014, 0, 0.5686275, 1, 1,
0.2015991, 0.3242967, 1.973388, 0, 0.5607843, 1, 1,
0.2053297, -0.5878387, 2.746085, 0, 0.5568628, 1, 1,
0.2056048, 0.3682808, 0.9112775, 0, 0.5490196, 1, 1,
0.2087127, 1.035898, 0.613246, 0, 0.5450981, 1, 1,
0.2095385, -0.6091362, 2.941248, 0, 0.5372549, 1, 1,
0.2129754, -0.0526189, 1.559718, 0, 0.5333334, 1, 1,
0.2210674, -0.4444164, 3.721443, 0, 0.5254902, 1, 1,
0.221923, -0.1256876, 3.259902, 0, 0.5215687, 1, 1,
0.224401, 0.8627661, 0.9293102, 0, 0.5137255, 1, 1,
0.2263896, 0.1322985, 1.437386, 0, 0.509804, 1, 1,
0.2301506, -1.472699, 2.029533, 0, 0.5019608, 1, 1,
0.2424589, 0.4684061, 1.545432, 0, 0.4941176, 1, 1,
0.2472543, 1.212324, -0.2498926, 0, 0.4901961, 1, 1,
0.2491082, -0.4885058, 1.771923, 0, 0.4823529, 1, 1,
0.2513855, -0.4284643, 3.994824, 0, 0.4784314, 1, 1,
0.2533421, 0.7390847, -0.08545639, 0, 0.4705882, 1, 1,
0.2570776, 0.6260824, -0.8501123, 0, 0.4666667, 1, 1,
0.2605863, -0.2941424, 5.619271, 0, 0.4588235, 1, 1,
0.261385, 0.366979, 0.4107305, 0, 0.454902, 1, 1,
0.2652294, -0.3505101, 1.296073, 0, 0.4470588, 1, 1,
0.2660806, -0.8034067, 2.336408, 0, 0.4431373, 1, 1,
0.2669293, -0.4531792, 1.974633, 0, 0.4352941, 1, 1,
0.2706941, -1.392638, 3.938105, 0, 0.4313726, 1, 1,
0.2707484, 1.020003, 0.4948263, 0, 0.4235294, 1, 1,
0.2709946, -0.5024113, 2.016269, 0, 0.4196078, 1, 1,
0.2716423, -0.3059408, 0.8072954, 0, 0.4117647, 1, 1,
0.2761185, -1.458847, 3.076308, 0, 0.4078431, 1, 1,
0.2810644, -1.028724, 4.660878, 0, 0.4, 1, 1,
0.2834863, 1.698469, 0.1857255, 0, 0.3921569, 1, 1,
0.2853192, -0.5790641, 2.462607, 0, 0.3882353, 1, 1,
0.2853668, -0.628624, 2.008632, 0, 0.3803922, 1, 1,
0.2859446, -0.1296591, 2.225553, 0, 0.3764706, 1, 1,
0.2872389, -0.05316208, 0.672325, 0, 0.3686275, 1, 1,
0.2891066, 0.1119519, 1.209566, 0, 0.3647059, 1, 1,
0.2928379, 0.091219, 1.373108, 0, 0.3568628, 1, 1,
0.2975555, -2.675321, 2.559286, 0, 0.3529412, 1, 1,
0.3000543, 0.6059501, 1.588647, 0, 0.345098, 1, 1,
0.3012941, -0.8028156, 2.546217, 0, 0.3411765, 1, 1,
0.3023608, -1.689168, 2.303642, 0, 0.3333333, 1, 1,
0.3074394, -0.6650262, 3.15785, 0, 0.3294118, 1, 1,
0.308062, 0.504984, 0.8922272, 0, 0.3215686, 1, 1,
0.3158933, 0.538586, 2.236914, 0, 0.3176471, 1, 1,
0.3200159, 1.448496, -0.2585631, 0, 0.3098039, 1, 1,
0.3233908, 2.311477, -0.1105788, 0, 0.3058824, 1, 1,
0.3245776, -0.5512754, 0.977392, 0, 0.2980392, 1, 1,
0.3251264, 0.6943002, -0.5254055, 0, 0.2901961, 1, 1,
0.3259071, -1.154936, 3.15074, 0, 0.2862745, 1, 1,
0.3347644, -0.09195297, 2.980047, 0, 0.2784314, 1, 1,
0.339597, 1.951898, 2.400149, 0, 0.2745098, 1, 1,
0.343912, 0.005092662, 2.649601, 0, 0.2666667, 1, 1,
0.3478512, 0.5947388, 0.7376586, 0, 0.2627451, 1, 1,
0.3496349, 1.710869, 2.642617, 0, 0.254902, 1, 1,
0.3513967, -1.750396, 4.160617, 0, 0.2509804, 1, 1,
0.3518295, 0.9061981, 0.7996184, 0, 0.2431373, 1, 1,
0.3549776, -0.3144688, 1.800983, 0, 0.2392157, 1, 1,
0.3697248, -0.05822509, 1.120148, 0, 0.2313726, 1, 1,
0.3725137, -0.5073514, 1.671907, 0, 0.227451, 1, 1,
0.3742542, -1.166689, 4.884762, 0, 0.2196078, 1, 1,
0.3749982, 0.2488441, 1.781996, 0, 0.2156863, 1, 1,
0.3784365, -0.778621, 1.233652, 0, 0.2078431, 1, 1,
0.3796, -0.1306687, 1.821879, 0, 0.2039216, 1, 1,
0.3828379, -0.909315, 2.728674, 0, 0.1960784, 1, 1,
0.3849613, 1.242908, 0.2780194, 0, 0.1882353, 1, 1,
0.3891842, -0.538433, 3.343178, 0, 0.1843137, 1, 1,
0.3920057, 0.175335, 0.6795014, 0, 0.1764706, 1, 1,
0.3974533, 0.8956769, 0.9595465, 0, 0.172549, 1, 1,
0.3979501, 0.09691105, 1.160807, 0, 0.1647059, 1, 1,
0.4020487, -0.138934, 0.5173355, 0, 0.1607843, 1, 1,
0.4104906, 0.2875833, 0.5183857, 0, 0.1529412, 1, 1,
0.4110314, -0.03422045, 2.87971, 0, 0.1490196, 1, 1,
0.4144796, -1.584719, 3.859428, 0, 0.1411765, 1, 1,
0.4152367, 0.1309084, 1.53652, 0, 0.1372549, 1, 1,
0.4188914, 0.3881069, 1.15094, 0, 0.1294118, 1, 1,
0.4194636, 0.1432233, 1.436579, 0, 0.1254902, 1, 1,
0.4230172, -2.046897, 2.012584, 0, 0.1176471, 1, 1,
0.423355, 0.9824522, 0.2505368, 0, 0.1137255, 1, 1,
0.4292986, -2.260113, 3.193751, 0, 0.1058824, 1, 1,
0.4333964, -1.367967, 1.439215, 0, 0.09803922, 1, 1,
0.4360297, 0.3363328, 1.778669, 0, 0.09411765, 1, 1,
0.4362409, 1.427295, 0.9564936, 0, 0.08627451, 1, 1,
0.4374239, 1.123534, 1.731663, 0, 0.08235294, 1, 1,
0.4396126, 0.4295954, -1.708341, 0, 0.07450981, 1, 1,
0.4440637, 0.6866652, 0.08842798, 0, 0.07058824, 1, 1,
0.4442044, 0.2608168, 1.77414, 0, 0.0627451, 1, 1,
0.4477181, -1.120767, 3.429623, 0, 0.05882353, 1, 1,
0.4535815, 0.1409, 1.990483, 0, 0.05098039, 1, 1,
0.4537925, -0.5898051, 1.822585, 0, 0.04705882, 1, 1,
0.4538287, -0.6892381, 3.553195, 0, 0.03921569, 1, 1,
0.4596952, -0.2824618, 3.076677, 0, 0.03529412, 1, 1,
0.4599057, 0.1813487, 2.45826, 0, 0.02745098, 1, 1,
0.4627535, -0.547403, -0.00611787, 0, 0.02352941, 1, 1,
0.4676295, -0.1042486, 0.7813267, 0, 0.01568628, 1, 1,
0.4683639, 1.44939, -0.3694914, 0, 0.01176471, 1, 1,
0.4736305, -0.3951567, 3.031024, 0, 0.003921569, 1, 1,
0.4863262, -0.2030972, 0.9725534, 0.003921569, 0, 1, 1,
0.4901731, -1.206772, 3.925654, 0.007843138, 0, 1, 1,
0.4923362, -0.4876901, 1.167066, 0.01568628, 0, 1, 1,
0.4991642, -0.9561442, 1.781595, 0.01960784, 0, 1, 1,
0.5027711, 0.2652008, 1.051111, 0.02745098, 0, 1, 1,
0.5072091, 0.2574784, 0.7875491, 0.03137255, 0, 1, 1,
0.5154182, -0.1976912, -0.0956979, 0.03921569, 0, 1, 1,
0.5178692, -0.8626643, 1.131022, 0.04313726, 0, 1, 1,
0.5203859, -1.88507, 1.823027, 0.05098039, 0, 1, 1,
0.5212408, 0.6179076, -0.2932136, 0.05490196, 0, 1, 1,
0.5252463, -0.7697983, 3.477189, 0.0627451, 0, 1, 1,
0.5277918, 0.6358315, 0.1040544, 0.06666667, 0, 1, 1,
0.5299525, 0.5328313, 0.7868055, 0.07450981, 0, 1, 1,
0.5347412, 0.9714654, 2.218932, 0.07843138, 0, 1, 1,
0.5350223, 1.192822, -0.9284427, 0.08627451, 0, 1, 1,
0.5370761, -0.06333042, 0.8118379, 0.09019608, 0, 1, 1,
0.5402053, 0.07795605, 2.078064, 0.09803922, 0, 1, 1,
0.5431604, -0.394528, 1.682059, 0.1058824, 0, 1, 1,
0.5467476, -0.5072409, 3.559805, 0.1098039, 0, 1, 1,
0.5476433, -0.6166981, 2.649945, 0.1176471, 0, 1, 1,
0.5491064, 0.1732989, 0.9262147, 0.1215686, 0, 1, 1,
0.551228, 2.002091, -0.04050831, 0.1294118, 0, 1, 1,
0.5513036, 0.7726122, -0.1469387, 0.1333333, 0, 1, 1,
0.552412, 0.4491355, 1.517158, 0.1411765, 0, 1, 1,
0.5568632, -0.9886469, 4.045148, 0.145098, 0, 1, 1,
0.5591639, -0.4812312, 2.726692, 0.1529412, 0, 1, 1,
0.5595563, -0.04184084, 4.310946, 0.1568628, 0, 1, 1,
0.5596878, 0.7944348, 1.784357, 0.1647059, 0, 1, 1,
0.5640373, -0.9139885, 1.55928, 0.1686275, 0, 1, 1,
0.5664922, 0.7623841, 0.2108026, 0.1764706, 0, 1, 1,
0.5676025, 0.3301121, 1.251127, 0.1803922, 0, 1, 1,
0.5754171, 0.4288144, -0.03411745, 0.1882353, 0, 1, 1,
0.5766025, 0.8572648, -0.8673257, 0.1921569, 0, 1, 1,
0.5817288, -0.9019477, 2.954876, 0.2, 0, 1, 1,
0.5826273, -0.2400574, 4.016664, 0.2078431, 0, 1, 1,
0.5897003, -1.298562, 3.612959, 0.2117647, 0, 1, 1,
0.5926555, 1.419187, 0.9012488, 0.2196078, 0, 1, 1,
0.5944456, 0.00856893, 3.071742, 0.2235294, 0, 1, 1,
0.5962298, 0.1361085, 1.703435, 0.2313726, 0, 1, 1,
0.6003537, 0.9365631, 0.1664323, 0.2352941, 0, 1, 1,
0.6047199, -0.4102797, 2.552074, 0.2431373, 0, 1, 1,
0.6047432, 0.7497129, -0.16855, 0.2470588, 0, 1, 1,
0.6089551, 1.253975, 0.4078498, 0.254902, 0, 1, 1,
0.6132627, -0.8990211, 0.3165784, 0.2588235, 0, 1, 1,
0.632143, 0.6874155, 0.7715544, 0.2666667, 0, 1, 1,
0.6353701, 0.4305273, -0.3803361, 0.2705882, 0, 1, 1,
0.6399742, 1.201091, 0.7443041, 0.2784314, 0, 1, 1,
0.6412073, 2.102226, 0.6674197, 0.282353, 0, 1, 1,
0.650276, -0.9034654, 1.664396, 0.2901961, 0, 1, 1,
0.6529339, -0.5936068, 2.427298, 0.2941177, 0, 1, 1,
0.654518, 0.09732196, 1.778872, 0.3019608, 0, 1, 1,
0.6545325, -0.374985, 1.063286, 0.3098039, 0, 1, 1,
0.654934, 0.5466423, 0.7577056, 0.3137255, 0, 1, 1,
0.6583586, 2.565327, 1.36724, 0.3215686, 0, 1, 1,
0.6594566, -0.8289747, 2.585352, 0.3254902, 0, 1, 1,
0.6652311, -0.4410885, 0.9957719, 0.3333333, 0, 1, 1,
0.6673001, 1.115508, -0.2688688, 0.3372549, 0, 1, 1,
0.6694413, -0.6206486, 3.855264, 0.345098, 0, 1, 1,
0.6695094, 0.6514795, 1.369578, 0.3490196, 0, 1, 1,
0.671347, -1.77004, 2.642259, 0.3568628, 0, 1, 1,
0.6833919, -0.6440908, 1.821915, 0.3607843, 0, 1, 1,
0.6834911, -0.3039875, 2.267304, 0.3686275, 0, 1, 1,
0.6859839, 0.5475906, 1.10691, 0.372549, 0, 1, 1,
0.688408, -1.169093, 3.445181, 0.3803922, 0, 1, 1,
0.6896451, -0.3855708, 2.661723, 0.3843137, 0, 1, 1,
0.6940579, 1.40357, -0.4829568, 0.3921569, 0, 1, 1,
0.6950897, -1.175246, 3.031914, 0.3960784, 0, 1, 1,
0.6989916, -1.115251, 3.712727, 0.4039216, 0, 1, 1,
0.7070039, 0.6610756, -0.1232035, 0.4117647, 0, 1, 1,
0.7110247, 0.6095773, -1.408317, 0.4156863, 0, 1, 1,
0.7178265, -0.6161857, 1.223905, 0.4235294, 0, 1, 1,
0.7183275, 0.732509, 0.8720672, 0.427451, 0, 1, 1,
0.7203779, 2.27718, -0.201326, 0.4352941, 0, 1, 1,
0.725456, -0.7843577, 2.00534, 0.4392157, 0, 1, 1,
0.7256177, 0.5719258, 0.5917067, 0.4470588, 0, 1, 1,
0.7444668, 0.05314654, 1.285674, 0.4509804, 0, 1, 1,
0.7454343, 0.1592315, 1.357464, 0.4588235, 0, 1, 1,
0.745676, -1.573594, 2.866209, 0.4627451, 0, 1, 1,
0.7468644, 3.168133, 0.735516, 0.4705882, 0, 1, 1,
0.7482262, 0.3691528, 0.7906088, 0.4745098, 0, 1, 1,
0.7603468, 1.869204, 0.2274307, 0.4823529, 0, 1, 1,
0.7738218, -1.303158, 2.74166, 0.4862745, 0, 1, 1,
0.7762927, -1.151294, 4.393441, 0.4941176, 0, 1, 1,
0.7796842, -0.3541254, 3.240791, 0.5019608, 0, 1, 1,
0.7799945, 0.6602341, 0.4760203, 0.5058824, 0, 1, 1,
0.7826207, 0.3500258, 2.967837, 0.5137255, 0, 1, 1,
0.7838173, 0.0488346, 2.289576, 0.5176471, 0, 1, 1,
0.7897969, 0.8111746, 1.604906, 0.5254902, 0, 1, 1,
0.7912725, -0.06019986, 2.748429, 0.5294118, 0, 1, 1,
0.7988425, -0.1502698, 2.174407, 0.5372549, 0, 1, 1,
0.8032783, -1.14996, 1.387195, 0.5411765, 0, 1, 1,
0.8055565, -1.006698, 0.9602145, 0.5490196, 0, 1, 1,
0.8065845, 0.6682338, 0.4883199, 0.5529412, 0, 1, 1,
0.8070693, 2.44679, 0.7404892, 0.5607843, 0, 1, 1,
0.807332, 0.1810615, 0.4840276, 0.5647059, 0, 1, 1,
0.8075833, -0.5796077, 2.580979, 0.572549, 0, 1, 1,
0.8085789, 0.6804433, 1.716123, 0.5764706, 0, 1, 1,
0.8101831, -0.9798926, 2.72633, 0.5843138, 0, 1, 1,
0.8106626, -1.714727, 2.629444, 0.5882353, 0, 1, 1,
0.8144152, 0.5436164, -1.330328, 0.5960785, 0, 1, 1,
0.8160157, 1.023531, -0.1213912, 0.6039216, 0, 1, 1,
0.8172421, -2.014612, 2.600648, 0.6078432, 0, 1, 1,
0.8176608, 1.015457, -0.0444019, 0.6156863, 0, 1, 1,
0.819645, -0.3601033, 1.78688, 0.6196079, 0, 1, 1,
0.8209199, 0.6836237, 1.708533, 0.627451, 0, 1, 1,
0.8227115, -0.5699953, 1.250584, 0.6313726, 0, 1, 1,
0.8269562, -0.711382, 0.2356132, 0.6392157, 0, 1, 1,
0.829623, 0.6874984, -0.2144656, 0.6431373, 0, 1, 1,
0.8322079, 0.879392, -1.017354, 0.6509804, 0, 1, 1,
0.833944, -0.9071835, 1.713856, 0.654902, 0, 1, 1,
0.8510396, -0.6953776, 2.21481, 0.6627451, 0, 1, 1,
0.8513993, 0.8764287, 0.8341945, 0.6666667, 0, 1, 1,
0.8525541, 1.142597, 0.1953047, 0.6745098, 0, 1, 1,
0.8557422, -1.317594, 1.402104, 0.6784314, 0, 1, 1,
0.8573021, -1.042765, 2.823073, 0.6862745, 0, 1, 1,
0.8605798, -0.9135769, -0.5982099, 0.6901961, 0, 1, 1,
0.8607196, 1.120479, 0.7377536, 0.6980392, 0, 1, 1,
0.8608527, 0.1550905, 0.896815, 0.7058824, 0, 1, 1,
0.8744091, -0.7818705, 2.788325, 0.7098039, 0, 1, 1,
0.8750147, -0.3581401, 1.366065, 0.7176471, 0, 1, 1,
0.8795565, -0.8141406, 3.348927, 0.7215686, 0, 1, 1,
0.8921202, -1.696067, 3.52056, 0.7294118, 0, 1, 1,
0.8981692, -0.4943722, 2.01822, 0.7333333, 0, 1, 1,
0.9044902, 1.763071, -0.1747802, 0.7411765, 0, 1, 1,
0.9069607, -0.4953246, 1.707995, 0.7450981, 0, 1, 1,
0.9091267, 1.335327, 0.07508241, 0.7529412, 0, 1, 1,
0.9148556, 0.779998, 1.580833, 0.7568628, 0, 1, 1,
0.9186622, 0.5672423, 1.849225, 0.7647059, 0, 1, 1,
0.9232556, -0.763393, 2.817956, 0.7686275, 0, 1, 1,
0.9264062, 0.001368212, 3.00782, 0.7764706, 0, 1, 1,
0.9371389, 0.1076302, 0.1358082, 0.7803922, 0, 1, 1,
0.9384289, 0.7730729, 1.242982, 0.7882353, 0, 1, 1,
0.9391563, 0.2205635, 0.5374552, 0.7921569, 0, 1, 1,
0.9490935, -0.4026232, 1.695183, 0.8, 0, 1, 1,
0.954605, -1.712587, 1.907957, 0.8078431, 0, 1, 1,
0.9550653, 0.3672017, 1.706453, 0.8117647, 0, 1, 1,
0.9594963, -1.712134, 1.879105, 0.8196079, 0, 1, 1,
0.9607112, 1.698195, -0.4540684, 0.8235294, 0, 1, 1,
0.9608382, 0.3726787, 0.2793027, 0.8313726, 0, 1, 1,
0.9650682, 0.295075, 0.3010276, 0.8352941, 0, 1, 1,
0.9687082, 0.5965385, 2.13512, 0.8431373, 0, 1, 1,
0.9776264, 2.290966, 0.9621156, 0.8470588, 0, 1, 1,
0.9793066, 0.2385033, 0.3288288, 0.854902, 0, 1, 1,
0.9832479, 0.9489523, 2.448632, 0.8588235, 0, 1, 1,
0.9864292, -0.149969, 2.231769, 0.8666667, 0, 1, 1,
0.9895351, 0.5100631, 3.392604, 0.8705882, 0, 1, 1,
0.991407, -0.07256919, 1.687709, 0.8784314, 0, 1, 1,
0.9964282, -0.6535381, 2.505041, 0.8823529, 0, 1, 1,
0.9981096, -0.6123723, 1.281426, 0.8901961, 0, 1, 1,
0.998911, -0.09710436, 1.091343, 0.8941177, 0, 1, 1,
1.001988, 0.05420823, 0.4505339, 0.9019608, 0, 1, 1,
1.002256, 0.7088282, -0.2289804, 0.9098039, 0, 1, 1,
1.004241, 0.8949156, 1.481691, 0.9137255, 0, 1, 1,
1.005057, -0.9139434, 1.423878, 0.9215686, 0, 1, 1,
1.008977, 1.899317, 0.3590411, 0.9254902, 0, 1, 1,
1.009776, 0.3774106, 0.2275241, 0.9333333, 0, 1, 1,
1.010071, 1.317326, 3.459745, 0.9372549, 0, 1, 1,
1.034758, -1.128614, 1.146206, 0.945098, 0, 1, 1,
1.037619, -1.983165, 3.456268, 0.9490196, 0, 1, 1,
1.038951, -1.231964, 3.339108, 0.9568627, 0, 1, 1,
1.047414, 0.5309332, 1.540548, 0.9607843, 0, 1, 1,
1.047488, -0.9884552, 3.058764, 0.9686275, 0, 1, 1,
1.054486, -0.6564218, 2.857775, 0.972549, 0, 1, 1,
1.061596, 0.1579269, 2.407355, 0.9803922, 0, 1, 1,
1.062995, -0.1321477, 2.993424, 0.9843137, 0, 1, 1,
1.06397, 1.501204, -0.04764564, 0.9921569, 0, 1, 1,
1.066138, 1.435372, -0.551666, 0.9960784, 0, 1, 1,
1.066248, -0.3100662, 1.645511, 1, 0, 0.9960784, 1,
1.071452, 0.1245485, 2.849934, 1, 0, 0.9882353, 1,
1.072202, -0.212497, 1.796242, 1, 0, 0.9843137, 1,
1.076716, 0.1742022, 2.533796, 1, 0, 0.9764706, 1,
1.077628, 0.1640698, 1.426207, 1, 0, 0.972549, 1,
1.07917, 0.7018117, 2.632959, 1, 0, 0.9647059, 1,
1.080053, -0.6423421, 3.098585, 1, 0, 0.9607843, 1,
1.082928, 0.1430535, 1.370599, 1, 0, 0.9529412, 1,
1.08472, -0.3772134, 2.018472, 1, 0, 0.9490196, 1,
1.087448, -0.4302995, 0.8879895, 1, 0, 0.9411765, 1,
1.09183, 1.100079, -0.4033077, 1, 0, 0.9372549, 1,
1.095318, 1.527279, 0.08985108, 1, 0, 0.9294118, 1,
1.097911, 1.634002, -1.053874, 1, 0, 0.9254902, 1,
1.098519, 0.7123514, 1.671271, 1, 0, 0.9176471, 1,
1.119584, -0.4219807, 2.106746, 1, 0, 0.9137255, 1,
1.127762, 0.8944923, 2.06831, 1, 0, 0.9058824, 1,
1.129641, -0.4263661, 2.463204, 1, 0, 0.9019608, 1,
1.156779, 0.5911672, 0.806659, 1, 0, 0.8941177, 1,
1.157618, -0.1041108, 3.006815, 1, 0, 0.8862745, 1,
1.158591, 0.5352585, 1.382542, 1, 0, 0.8823529, 1,
1.160708, 2.074649, 0.2271793, 1, 0, 0.8745098, 1,
1.161874, 0.622376, 2.916401, 1, 0, 0.8705882, 1,
1.164494, 1.337151, 2.026079, 1, 0, 0.8627451, 1,
1.167665, 0.8953542, -0.07340997, 1, 0, 0.8588235, 1,
1.171985, -0.3064587, 1.455319, 1, 0, 0.8509804, 1,
1.180027, 0.05853885, 0.8105635, 1, 0, 0.8470588, 1,
1.187686, 1.10009, 1.570044, 1, 0, 0.8392157, 1,
1.198699, -1.284762, 2.529317, 1, 0, 0.8352941, 1,
1.199334, -0.3417487, 2.708679, 1, 0, 0.827451, 1,
1.206699, -0.7866616, 2.841282, 1, 0, 0.8235294, 1,
1.208134, -2.073462, 2.881563, 1, 0, 0.8156863, 1,
1.21007, 2.344471, -0.2825565, 1, 0, 0.8117647, 1,
1.211092, -0.572243, 2.755933, 1, 0, 0.8039216, 1,
1.211944, -0.1054546, 1.652667, 1, 0, 0.7960784, 1,
1.213594, -0.1272905, 1.226333, 1, 0, 0.7921569, 1,
1.217522, 0.036033, 1.632648, 1, 0, 0.7843137, 1,
1.218899, 2.052368, 1.366898, 1, 0, 0.7803922, 1,
1.230953, -1.165901, 4.283077, 1, 0, 0.772549, 1,
1.241396, 0.1329258, 1.365404, 1, 0, 0.7686275, 1,
1.241615, -0.1976927, 4.175245, 1, 0, 0.7607843, 1,
1.243201, 1.385961, 2.27362, 1, 0, 0.7568628, 1,
1.246493, -0.5991195, 0.2636578, 1, 0, 0.7490196, 1,
1.252814, -0.3004962, 1.169934, 1, 0, 0.7450981, 1,
1.265168, -0.5506579, 3.058529, 1, 0, 0.7372549, 1,
1.266914, -0.579236, 1.779429, 1, 0, 0.7333333, 1,
1.270832, 0.00384937, -0.6030839, 1, 0, 0.7254902, 1,
1.273858, 1.432096, 0.8763263, 1, 0, 0.7215686, 1,
1.280335, -0.1943626, 1.263506, 1, 0, 0.7137255, 1,
1.282734, -1.670616, 2.528391, 1, 0, 0.7098039, 1,
1.284964, 0.2066575, 2.840117, 1, 0, 0.7019608, 1,
1.287524, 3.520441, -1.993486, 1, 0, 0.6941177, 1,
1.289293, -0.6301994, 2.724617, 1, 0, 0.6901961, 1,
1.296569, -0.3834897, 1.508898, 1, 0, 0.682353, 1,
1.30267, 1.088694, 1.421824, 1, 0, 0.6784314, 1,
1.305462, 0.8006353, 1.11052, 1, 0, 0.6705883, 1,
1.313988, -0.3889383, 1.551284, 1, 0, 0.6666667, 1,
1.330618, 0.196627, -0.0917344, 1, 0, 0.6588235, 1,
1.334252, 0.4160816, 0.08485344, 1, 0, 0.654902, 1,
1.33499, -1.077701, 1.045233, 1, 0, 0.6470588, 1,
1.335621, -0.7045643, 1.42663, 1, 0, 0.6431373, 1,
1.355193, -0.03659853, 0.7373015, 1, 0, 0.6352941, 1,
1.356053, -0.1031032, 0.2187016, 1, 0, 0.6313726, 1,
1.361655, 0.6358338, 1.506583, 1, 0, 0.6235294, 1,
1.362891, 1.256197, 1.124086, 1, 0, 0.6196079, 1,
1.364602, 1.176307, 1.671632, 1, 0, 0.6117647, 1,
1.376173, 0.4688215, 1.546674, 1, 0, 0.6078432, 1,
1.377236, -1.551676, 2.469147, 1, 0, 0.6, 1,
1.378144, 0.7931316, 1.143003, 1, 0, 0.5921569, 1,
1.382217, 0.1371845, 1.551956, 1, 0, 0.5882353, 1,
1.383674, -0.1710529, 0.9807092, 1, 0, 0.5803922, 1,
1.385339, 1.014551, 1.387137, 1, 0, 0.5764706, 1,
1.387283, 0.1577347, 1.303769, 1, 0, 0.5686275, 1,
1.38878, -0.3282706, 0.2270551, 1, 0, 0.5647059, 1,
1.398117, 1.245999, 0.9864102, 1, 0, 0.5568628, 1,
1.400081, -0.417478, 3.220027, 1, 0, 0.5529412, 1,
1.401668, 0.6387805, 2.792976, 1, 0, 0.5450981, 1,
1.40332, -0.4551015, 0.5874303, 1, 0, 0.5411765, 1,
1.412612, 1.996474, -0.372898, 1, 0, 0.5333334, 1,
1.415341, -0.1513745, 2.391607, 1, 0, 0.5294118, 1,
1.417323, -2.737001, 2.612473, 1, 0, 0.5215687, 1,
1.418157, -0.08042651, 4.023036, 1, 0, 0.5176471, 1,
1.423464, 0.9732875, 1.448465, 1, 0, 0.509804, 1,
1.432467, 0.116426, 0.9177259, 1, 0, 0.5058824, 1,
1.451334, -1.108627, 2.132165, 1, 0, 0.4980392, 1,
1.454124, 0.04675964, 3.234973, 1, 0, 0.4901961, 1,
1.454917, -0.9183478, 2.072214, 1, 0, 0.4862745, 1,
1.456206, -0.9165238, 1.638857, 1, 0, 0.4784314, 1,
1.457267, 1.480541, -0.4882109, 1, 0, 0.4745098, 1,
1.47064, -1.417039, 3.361337, 1, 0, 0.4666667, 1,
1.488966, -0.1934502, 1.532065, 1, 0, 0.4627451, 1,
1.492355, -1.066987, 2.166733, 1, 0, 0.454902, 1,
1.501661, 0.3074814, 1.001068, 1, 0, 0.4509804, 1,
1.51989, 0.05742718, 0.827911, 1, 0, 0.4431373, 1,
1.524419, -0.04310892, 1.141844, 1, 0, 0.4392157, 1,
1.530205, 0.05167717, 3.725021, 1, 0, 0.4313726, 1,
1.534534, 0.6959453, 0.5013345, 1, 0, 0.427451, 1,
1.535018, 0.1985495, -0.04247732, 1, 0, 0.4196078, 1,
1.537799, -0.7069943, 3.124902, 1, 0, 0.4156863, 1,
1.549705, -0.7976173, 1.233876, 1, 0, 0.4078431, 1,
1.556701, -0.1100423, -0.3928299, 1, 0, 0.4039216, 1,
1.559821, 0.09090501, 0.6830104, 1, 0, 0.3960784, 1,
1.567109, 0.9232972, 2.382424, 1, 0, 0.3882353, 1,
1.587725, 1.325823, 1.883087, 1, 0, 0.3843137, 1,
1.598187, -0.06092509, 1.346737, 1, 0, 0.3764706, 1,
1.601472, 0.6392091, 1.540734, 1, 0, 0.372549, 1,
1.612961, 0.718222, -0.3926243, 1, 0, 0.3647059, 1,
1.623765, 0.3288806, 1.292225, 1, 0, 0.3607843, 1,
1.628611, 1.30913, 1.648219, 1, 0, 0.3529412, 1,
1.645081, -1.813491, 2.845475, 1, 0, 0.3490196, 1,
1.649156, -2.078692, 1.4398, 1, 0, 0.3411765, 1,
1.651371, -0.09419126, -0.4916824, 1, 0, 0.3372549, 1,
1.671679, -0.6112992, 2.424986, 1, 0, 0.3294118, 1,
1.701086, -0.7245677, 1.935177, 1, 0, 0.3254902, 1,
1.706623, -1.112075, 2.368595, 1, 0, 0.3176471, 1,
1.708232, 0.6445378, 1.127213, 1, 0, 0.3137255, 1,
1.708879, -0.6484433, 1.419194, 1, 0, 0.3058824, 1,
1.71323, 0.5396821, -0.274229, 1, 0, 0.2980392, 1,
1.736207, 0.009082505, 0.9271736, 1, 0, 0.2941177, 1,
1.738955, -2.058987, 2.67976, 1, 0, 0.2862745, 1,
1.744594, 0.7052409, 1.631891, 1, 0, 0.282353, 1,
1.749419, -1.766368, 1.008019, 1, 0, 0.2745098, 1,
1.755925, -0.7826571, 2.541588, 1, 0, 0.2705882, 1,
1.767421, -0.4157951, 1.53219, 1, 0, 0.2627451, 1,
1.773126, -0.7149545, 2.549654, 1, 0, 0.2588235, 1,
1.784983, -0.4412051, 1.495399, 1, 0, 0.2509804, 1,
1.801916, -0.1880087, 0.4620271, 1, 0, 0.2470588, 1,
1.808562, -0.2339349, 1.662646, 1, 0, 0.2392157, 1,
1.822151, 0.8066265, 0.7807174, 1, 0, 0.2352941, 1,
1.822842, -1.552303, 1.329313, 1, 0, 0.227451, 1,
1.841966, 2.483514, 1.631648, 1, 0, 0.2235294, 1,
1.844791, 0.9195104, -0.1340362, 1, 0, 0.2156863, 1,
1.848553, -0.9241792, 2.808799, 1, 0, 0.2117647, 1,
1.853292, 0.3978461, 1.391521, 1, 0, 0.2039216, 1,
1.855005, 0.5214958, 3.677443, 1, 0, 0.1960784, 1,
1.862348, -1.967052, 2.414753, 1, 0, 0.1921569, 1,
1.910817, 1.866182, 1.278518, 1, 0, 0.1843137, 1,
1.920341, -1.29037, 0.8083683, 1, 0, 0.1803922, 1,
1.922032, 1.016033, 0.6212209, 1, 0, 0.172549, 1,
1.934841, -1.997534, 1.311699, 1, 0, 0.1686275, 1,
1.94595, 0.5677879, 1.791712, 1, 0, 0.1607843, 1,
1.978344, 0.01279982, 1.530526, 1, 0, 0.1568628, 1,
1.991735, -0.600893, 2.378983, 1, 0, 0.1490196, 1,
2.011108, 0.5633058, 2.948516, 1, 0, 0.145098, 1,
2.013142, -1.29821, 2.649867, 1, 0, 0.1372549, 1,
2.020764, -0.09502758, 1.930758, 1, 0, 0.1333333, 1,
2.073039, -1.569075, 2.511575, 1, 0, 0.1254902, 1,
2.074178, 0.5754119, 1.9229, 1, 0, 0.1215686, 1,
2.093421, -0.3620196, 2.180871, 1, 0, 0.1137255, 1,
2.10012, 0.2318764, 1.495414, 1, 0, 0.1098039, 1,
2.11167, 0.407767, 1.486515, 1, 0, 0.1019608, 1,
2.14508, -0.8963929, 3.597764, 1, 0, 0.09411765, 1,
2.158404, -0.6685191, 2.95524, 1, 0, 0.09019608, 1,
2.187258, 0.1323897, 1.977273, 1, 0, 0.08235294, 1,
2.196028, 0.698474, 2.07327, 1, 0, 0.07843138, 1,
2.203445, 0.02822349, 2.120907, 1, 0, 0.07058824, 1,
2.227271, 1.672045, 0.99806, 1, 0, 0.06666667, 1,
2.280299, 1.370381, 1.851708, 1, 0, 0.05882353, 1,
2.294581, 0.5214717, 1.235638, 1, 0, 0.05490196, 1,
2.299086, -1.210973, 1.718741, 1, 0, 0.04705882, 1,
2.506775, 0.5510088, 1.623342, 1, 0, 0.04313726, 1,
2.603722, -0.2846217, 2.256437, 1, 0, 0.03529412, 1,
2.678973, -0.2047761, 1.186356, 1, 0, 0.03137255, 1,
2.708183, -0.6387081, 1.213497, 1, 0, 0.02352941, 1,
2.7572, -0.2965927, 0.4200804, 1, 0, 0.01960784, 1,
2.81924, -0.07292043, 1.823169, 1, 0, 0.01176471, 1,
2.839939, 1.397852, -0.107954, 1, 0, 0.007843138, 1
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
0.08180475, -4.060997, -8.43279, 0, -0.5, 0.5, 0.5,
0.08180475, -4.060997, -8.43279, 1, -0.5, 0.5, 0.5,
0.08180475, -4.060997, -8.43279, 1, 1.5, 0.5, 0.5,
0.08180475, -4.060997, -8.43279, 0, 1.5, 0.5, 0.5
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
-3.611337, 0.2791251, -8.43279, 0, -0.5, 0.5, 0.5,
-3.611337, 0.2791251, -8.43279, 1, -0.5, 0.5, 0.5,
-3.611337, 0.2791251, -8.43279, 1, 1.5, 0.5, 0.5,
-3.611337, 0.2791251, -8.43279, 0, 1.5, 0.5, 0.5
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
-3.611337, -4.060997, -0.3884506, 0, -0.5, 0.5, 0.5,
-3.611337, -4.060997, -0.3884506, 1, -0.5, 0.5, 0.5,
-3.611337, -4.060997, -0.3884506, 1, 1.5, 0.5, 0.5,
-3.611337, -4.060997, -0.3884506, 0, 1.5, 0.5, 0.5
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
-2, -3.05943, -6.576404,
2, -3.05943, -6.576404,
-2, -3.05943, -6.576404,
-2, -3.226358, -6.885801,
-1, -3.05943, -6.576404,
-1, -3.226358, -6.885801,
0, -3.05943, -6.576404,
0, -3.226358, -6.885801,
1, -3.05943, -6.576404,
1, -3.226358, -6.885801,
2, -3.05943, -6.576404,
2, -3.226358, -6.885801
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
-2, -3.560214, -7.504597, 0, -0.5, 0.5, 0.5,
-2, -3.560214, -7.504597, 1, -0.5, 0.5, 0.5,
-2, -3.560214, -7.504597, 1, 1.5, 0.5, 0.5,
-2, -3.560214, -7.504597, 0, 1.5, 0.5, 0.5,
-1, -3.560214, -7.504597, 0, -0.5, 0.5, 0.5,
-1, -3.560214, -7.504597, 1, -0.5, 0.5, 0.5,
-1, -3.560214, -7.504597, 1, 1.5, 0.5, 0.5,
-1, -3.560214, -7.504597, 0, 1.5, 0.5, 0.5,
0, -3.560214, -7.504597, 0, -0.5, 0.5, 0.5,
0, -3.560214, -7.504597, 1, -0.5, 0.5, 0.5,
0, -3.560214, -7.504597, 1, 1.5, 0.5, 0.5,
0, -3.560214, -7.504597, 0, 1.5, 0.5, 0.5,
1, -3.560214, -7.504597, 0, -0.5, 0.5, 0.5,
1, -3.560214, -7.504597, 1, -0.5, 0.5, 0.5,
1, -3.560214, -7.504597, 1, 1.5, 0.5, 0.5,
1, -3.560214, -7.504597, 0, 1.5, 0.5, 0.5,
2, -3.560214, -7.504597, 0, -0.5, 0.5, 0.5,
2, -3.560214, -7.504597, 1, -0.5, 0.5, 0.5,
2, -3.560214, -7.504597, 1, 1.5, 0.5, 0.5,
2, -3.560214, -7.504597, 0, 1.5, 0.5, 0.5
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
-2.759074, -2, -6.576404,
-2.759074, 3, -6.576404,
-2.759074, -2, -6.576404,
-2.901118, -2, -6.885801,
-2.759074, -1, -6.576404,
-2.901118, -1, -6.885801,
-2.759074, 0, -6.576404,
-2.901118, 0, -6.885801,
-2.759074, 1, -6.576404,
-2.901118, 1, -6.885801,
-2.759074, 2, -6.576404,
-2.901118, 2, -6.885801,
-2.759074, 3, -6.576404,
-2.901118, 3, -6.885801
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
-3.185206, -2, -7.504597, 0, -0.5, 0.5, 0.5,
-3.185206, -2, -7.504597, 1, -0.5, 0.5, 0.5,
-3.185206, -2, -7.504597, 1, 1.5, 0.5, 0.5,
-3.185206, -2, -7.504597, 0, 1.5, 0.5, 0.5,
-3.185206, -1, -7.504597, 0, -0.5, 0.5, 0.5,
-3.185206, -1, -7.504597, 1, -0.5, 0.5, 0.5,
-3.185206, -1, -7.504597, 1, 1.5, 0.5, 0.5,
-3.185206, -1, -7.504597, 0, 1.5, 0.5, 0.5,
-3.185206, 0, -7.504597, 0, -0.5, 0.5, 0.5,
-3.185206, 0, -7.504597, 1, -0.5, 0.5, 0.5,
-3.185206, 0, -7.504597, 1, 1.5, 0.5, 0.5,
-3.185206, 0, -7.504597, 0, 1.5, 0.5, 0.5,
-3.185206, 1, -7.504597, 0, -0.5, 0.5, 0.5,
-3.185206, 1, -7.504597, 1, -0.5, 0.5, 0.5,
-3.185206, 1, -7.504597, 1, 1.5, 0.5, 0.5,
-3.185206, 1, -7.504597, 0, 1.5, 0.5, 0.5,
-3.185206, 2, -7.504597, 0, -0.5, 0.5, 0.5,
-3.185206, 2, -7.504597, 1, -0.5, 0.5, 0.5,
-3.185206, 2, -7.504597, 1, 1.5, 0.5, 0.5,
-3.185206, 2, -7.504597, 0, 1.5, 0.5, 0.5,
-3.185206, 3, -7.504597, 0, -0.5, 0.5, 0.5,
-3.185206, 3, -7.504597, 1, -0.5, 0.5, 0.5,
-3.185206, 3, -7.504597, 1, 1.5, 0.5, 0.5,
-3.185206, 3, -7.504597, 0, 1.5, 0.5, 0.5
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
-2.759074, -3.05943, -6,
-2.759074, -3.05943, 4,
-2.759074, -3.05943, -6,
-2.901118, -3.226358, -6,
-2.759074, -3.05943, -4,
-2.901118, -3.226358, -4,
-2.759074, -3.05943, -2,
-2.901118, -3.226358, -2,
-2.759074, -3.05943, 0,
-2.901118, -3.226358, 0,
-2.759074, -3.05943, 2,
-2.901118, -3.226358, 2,
-2.759074, -3.05943, 4,
-2.901118, -3.226358, 4
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
-3.185206, -3.560214, -6, 0, -0.5, 0.5, 0.5,
-3.185206, -3.560214, -6, 1, -0.5, 0.5, 0.5,
-3.185206, -3.560214, -6, 1, 1.5, 0.5, 0.5,
-3.185206, -3.560214, -6, 0, 1.5, 0.5, 0.5,
-3.185206, -3.560214, -4, 0, -0.5, 0.5, 0.5,
-3.185206, -3.560214, -4, 1, -0.5, 0.5, 0.5,
-3.185206, -3.560214, -4, 1, 1.5, 0.5, 0.5,
-3.185206, -3.560214, -4, 0, 1.5, 0.5, 0.5,
-3.185206, -3.560214, -2, 0, -0.5, 0.5, 0.5,
-3.185206, -3.560214, -2, 1, -0.5, 0.5, 0.5,
-3.185206, -3.560214, -2, 1, 1.5, 0.5, 0.5,
-3.185206, -3.560214, -2, 0, 1.5, 0.5, 0.5,
-3.185206, -3.560214, 0, 0, -0.5, 0.5, 0.5,
-3.185206, -3.560214, 0, 1, -0.5, 0.5, 0.5,
-3.185206, -3.560214, 0, 1, 1.5, 0.5, 0.5,
-3.185206, -3.560214, 0, 0, 1.5, 0.5, 0.5,
-3.185206, -3.560214, 2, 0, -0.5, 0.5, 0.5,
-3.185206, -3.560214, 2, 1, -0.5, 0.5, 0.5,
-3.185206, -3.560214, 2, 1, 1.5, 0.5, 0.5,
-3.185206, -3.560214, 2, 0, 1.5, 0.5, 0.5,
-3.185206, -3.560214, 4, 0, -0.5, 0.5, 0.5,
-3.185206, -3.560214, 4, 1, -0.5, 0.5, 0.5,
-3.185206, -3.560214, 4, 1, 1.5, 0.5, 0.5,
-3.185206, -3.560214, 4, 0, 1.5, 0.5, 0.5
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
-2.759074, -3.05943, -6.576404,
-2.759074, 3.617681, -6.576404,
-2.759074, -3.05943, 5.799502,
-2.759074, 3.617681, 5.799502,
-2.759074, -3.05943, -6.576404,
-2.759074, -3.05943, 5.799502,
-2.759074, 3.617681, -6.576404,
-2.759074, 3.617681, 5.799502,
-2.759074, -3.05943, -6.576404,
2.922683, -3.05943, -6.576404,
-2.759074, -3.05943, 5.799502,
2.922683, -3.05943, 5.799502,
-2.759074, 3.617681, -6.576404,
2.922683, 3.617681, -6.576404,
-2.759074, 3.617681, 5.799502,
2.922683, 3.617681, 5.799502,
2.922683, -3.05943, -6.576404,
2.922683, 3.617681, -6.576404,
2.922683, -3.05943, 5.799502,
2.922683, 3.617681, 5.799502,
2.922683, -3.05943, -6.576404,
2.922683, -3.05943, 5.799502,
2.922683, 3.617681, -6.576404,
2.922683, 3.617681, 5.799502
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
var radius = 8.098731;
var distance = 36.03217;
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
mvMatrix.translate( -0.08180475, -0.2791251, 0.3884506 );
mvMatrix.scale( 1.541162, 1.311422, 0.7075447 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.03217);
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
Diphenylketon<-read.table("Diphenylketon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.67633, -0.3778545, -2.932708, 0, 0, 1, 1, 1,
-2.64509, -0.7951601, -2.102368, 1, 0, 0, 1, 1,
-2.61258, -0.292573, -2.138748, 1, 0, 0, 1, 1,
-2.233524, -2.625022, -1.143957, 1, 0, 0, 1, 1,
-2.200698, -0.425347, -2.700214, 1, 0, 0, 1, 1,
-2.196868, -0.4707721, -0.6276754, 1, 0, 0, 1, 1,
-2.150063, -1.947002, -1.789591, 0, 0, 0, 1, 1,
-2.10761, -0.06773562, -1.557985, 0, 0, 0, 1, 1,
-2.074811, 0.5429919, -1.690048, 0, 0, 0, 1, 1,
-2.068635, 1.886152, -2.590375, 0, 0, 0, 1, 1,
-2.066619, -2.031078, -1.186979, 0, 0, 0, 1, 1,
-2.040764, 0.2716587, -0.4947722, 0, 0, 0, 1, 1,
-1.971059, -1.395224, -2.136071, 0, 0, 0, 1, 1,
-1.948003, -0.05211385, -0.5114836, 1, 1, 1, 1, 1,
-1.922889, 0.4152236, -0.8196942, 1, 1, 1, 1, 1,
-1.90933, 0.8343554, -0.6260615, 1, 1, 1, 1, 1,
-1.900733, 1.222579, -2.224386, 1, 1, 1, 1, 1,
-1.873818, -0.2390172, -0.8974593, 1, 1, 1, 1, 1,
-1.867446, -0.9923151, -2.893396, 1, 1, 1, 1, 1,
-1.862297, -0.2199305, -1.370962, 1, 1, 1, 1, 1,
-1.842132, 0.3834634, -1.866355, 1, 1, 1, 1, 1,
-1.828887, 0.5832364, -0.4002795, 1, 1, 1, 1, 1,
-1.808305, -1.012319, -2.300811, 1, 1, 1, 1, 1,
-1.763121, 0.9939954, -0.6161336, 1, 1, 1, 1, 1,
-1.709994, 0.3118038, -1.076082, 1, 1, 1, 1, 1,
-1.704441, 1.232422, 0.1639461, 1, 1, 1, 1, 1,
-1.698363, 0.458179, -1.945201, 1, 1, 1, 1, 1,
-1.68912, 0.5057819, -0.8920701, 1, 1, 1, 1, 1,
-1.677278, -0.8803487, -1.350796, 0, 0, 1, 1, 1,
-1.671993, 0.7008844, 0.05937054, 1, 0, 0, 1, 1,
-1.656574, 0.4153121, -1.999284, 1, 0, 0, 1, 1,
-1.648591, -0.5987405, -1.081114, 1, 0, 0, 1, 1,
-1.636979, 0.05240845, -2.197039, 1, 0, 0, 1, 1,
-1.616243, -1.765951, -4.57791, 1, 0, 0, 1, 1,
-1.615832, 1.56726, -1.376243, 0, 0, 0, 1, 1,
-1.608672, 0.9618601, -0.1003244, 0, 0, 0, 1, 1,
-1.607411, -0.452191, -4.649762, 0, 0, 0, 1, 1,
-1.569612, 1.445176, -1.687024, 0, 0, 0, 1, 1,
-1.552925, -0.6811128, -1.789714, 0, 0, 0, 1, 1,
-1.542367, -2.25527, -1.750904, 0, 0, 0, 1, 1,
-1.532483, -0.7840849, -0.8409408, 0, 0, 0, 1, 1,
-1.532477, -1.43555, -1.972685, 1, 1, 1, 1, 1,
-1.529497, 0.7282895, 1.474256, 1, 1, 1, 1, 1,
-1.525801, -0.2946008, -0.2437955, 1, 1, 1, 1, 1,
-1.521678, -0.7042429, -1.509543, 1, 1, 1, 1, 1,
-1.512957, -1.530169, -2.40438, 1, 1, 1, 1, 1,
-1.505998, -0.692642, -1.298721, 1, 1, 1, 1, 1,
-1.488182, -0.5872089, -1.480226, 1, 1, 1, 1, 1,
-1.484012, 1.142142, -1.274468, 1, 1, 1, 1, 1,
-1.482222, 0.07187669, -0.9668301, 1, 1, 1, 1, 1,
-1.475942, 1.77279, -0.6118012, 1, 1, 1, 1, 1,
-1.469688, 1.057734, -0.8202637, 1, 1, 1, 1, 1,
-1.45208, -0.1002077, -2.86052, 1, 1, 1, 1, 1,
-1.451191, 0.7197892, -0.1214662, 1, 1, 1, 1, 1,
-1.450269, 0.2651284, -1.51591, 1, 1, 1, 1, 1,
-1.450052, -0.82954, -3.289982, 1, 1, 1, 1, 1,
-1.445585, 0.4624168, -0.7511451, 0, 0, 1, 1, 1,
-1.444594, -0.9338993, 0.02562283, 1, 0, 0, 1, 1,
-1.438108, -0.3328742, -1.803689, 1, 0, 0, 1, 1,
-1.433413, -0.4623636, -1.514537, 1, 0, 0, 1, 1,
-1.431885, -0.1930505, -2.768291, 1, 0, 0, 1, 1,
-1.417048, -0.463514, -2.626477, 1, 0, 0, 1, 1,
-1.413275, -2.184611, -2.226504, 0, 0, 0, 1, 1,
-1.412105, -0.4705606, -1.160278, 0, 0, 0, 1, 1,
-1.410757, -0.703346, -1.997183, 0, 0, 0, 1, 1,
-1.397995, -0.1482179, -1.014395, 0, 0, 0, 1, 1,
-1.390001, -1.072969, -1.652924, 0, 0, 0, 1, 1,
-1.388612, 1.297304, -2.029655, 0, 0, 0, 1, 1,
-1.386799, 0.4274191, -0.828933, 0, 0, 0, 1, 1,
-1.367473, 0.4115042, -0.9608697, 1, 1, 1, 1, 1,
-1.361745, -1.267533, -1.536303, 1, 1, 1, 1, 1,
-1.360451, -1.085332, -1.438014, 1, 1, 1, 1, 1,
-1.354028, -0.1043346, -1.761208, 1, 1, 1, 1, 1,
-1.353264, 1.588178, -0.7133106, 1, 1, 1, 1, 1,
-1.337597, 0.9923905, -1.20677, 1, 1, 1, 1, 1,
-1.327422, -0.6298937, -1.912285, 1, 1, 1, 1, 1,
-1.323844, 1.354529, 0.372886, 1, 1, 1, 1, 1,
-1.310478, 0.3014334, -2.245045, 1, 1, 1, 1, 1,
-1.308325, -1.095405, -3.720658, 1, 1, 1, 1, 1,
-1.301774, -1.779438, -3.137901, 1, 1, 1, 1, 1,
-1.300342, -1.703446, -1.97241, 1, 1, 1, 1, 1,
-1.294087, 0.6604672, -1.4694, 1, 1, 1, 1, 1,
-1.289469, -1.093175, -0.8515068, 1, 1, 1, 1, 1,
-1.287943, -1.836095, -1.068889, 1, 1, 1, 1, 1,
-1.28689, 0.2170456, -3.174716, 0, 0, 1, 1, 1,
-1.275288, -0.3950018, -1.949325, 1, 0, 0, 1, 1,
-1.273895, 0.3331718, -1.726683, 1, 0, 0, 1, 1,
-1.269155, 0.3660583, -2.814801, 1, 0, 0, 1, 1,
-1.26417, 0.9500095, -0.9055792, 1, 0, 0, 1, 1,
-1.253213, 1.679065, 0.1758234, 1, 0, 0, 1, 1,
-1.251044, -0.9710094, -2.033538, 0, 0, 0, 1, 1,
-1.240238, 0.7065256, -1.364931, 0, 0, 0, 1, 1,
-1.239874, 0.3297107, 0.244554, 0, 0, 0, 1, 1,
-1.225972, -1.427531, -2.981991, 0, 0, 0, 1, 1,
-1.221916, 0.002066442, -2.300645, 0, 0, 0, 1, 1,
-1.210667, 0.00713589, -2.094838, 0, 0, 0, 1, 1,
-1.205449, -2.54074, -4.210454, 0, 0, 0, 1, 1,
-1.198761, 1.662683, -1.284756, 1, 1, 1, 1, 1,
-1.188958, 1.822863, -0.5986353, 1, 1, 1, 1, 1,
-1.188619, 0.02947747, -2.923621, 1, 1, 1, 1, 1,
-1.185395, -0.6216636, -1.174106, 1, 1, 1, 1, 1,
-1.179717, -1.732166, -3.945131, 1, 1, 1, 1, 1,
-1.178789, 0.5614243, -0.9274041, 1, 1, 1, 1, 1,
-1.174925, -1.195136, -1.995097, 1, 1, 1, 1, 1,
-1.158568, 0.4352056, -0.9851444, 1, 1, 1, 1, 1,
-1.156003, -0.2086186, -1.465391, 1, 1, 1, 1, 1,
-1.153853, -2.552321, -3.087099, 1, 1, 1, 1, 1,
-1.152476, -0.6958104, -0.5050429, 1, 1, 1, 1, 1,
-1.140072, -1.035507, -2.786726, 1, 1, 1, 1, 1,
-1.137779, 0.0573623, -2.068401, 1, 1, 1, 1, 1,
-1.13702, 1.18992, -1.469366, 1, 1, 1, 1, 1,
-1.134549, -2.664474, -3.036045, 1, 1, 1, 1, 1,
-1.122797, 0.7320437, -1.120398, 0, 0, 1, 1, 1,
-1.118364, 0.5184528, -0.672828, 1, 0, 0, 1, 1,
-1.116298, 0.6507846, -1.457979, 1, 0, 0, 1, 1,
-1.115636, -0.9501787, -1.431697, 1, 0, 0, 1, 1,
-1.111401, -0.942157, -3.16827, 1, 0, 0, 1, 1,
-1.109227, 0.7591652, -2.108106, 1, 0, 0, 1, 1,
-1.102075, -0.4772255, -2.644577, 0, 0, 0, 1, 1,
-1.099734, 0.2252634, -1.156799, 0, 0, 0, 1, 1,
-1.09708, -0.2711967, -1.478108, 0, 0, 0, 1, 1,
-1.095795, -1.335423, -1.594667, 0, 0, 0, 1, 1,
-1.094114, -0.9888284, -4.13266, 0, 0, 0, 1, 1,
-1.09324, 0.1545599, 0.6004954, 0, 0, 0, 1, 1,
-1.083931, -0.8232746, -3.734738, 0, 0, 0, 1, 1,
-1.073456, -0.7073454, -1.542631, 1, 1, 1, 1, 1,
-1.071105, 1.052192, 0.166202, 1, 1, 1, 1, 1,
-1.070879, -0.9407906, -2.691636, 1, 1, 1, 1, 1,
-1.061144, -0.4240401, -1.736487, 1, 1, 1, 1, 1,
-1.052359, 0.2379007, -0.5873232, 1, 1, 1, 1, 1,
-1.048, 0.6253493, -2.214099, 1, 1, 1, 1, 1,
-1.039871, 0.7508228, 0.115828, 1, 1, 1, 1, 1,
-1.039712, -1.435721, -2.458074, 1, 1, 1, 1, 1,
-1.035191, 0.9507023, 0.8157201, 1, 1, 1, 1, 1,
-1.031712, 0.06034748, -2.206168, 1, 1, 1, 1, 1,
-1.025571, -2.049686, -2.299557, 1, 1, 1, 1, 1,
-1.025158, 1.761982, 0.7330414, 1, 1, 1, 1, 1,
-1.024512, 2.006438, -0.5359635, 1, 1, 1, 1, 1,
-1.020863, -0.9302292, -3.905649, 1, 1, 1, 1, 1,
-1.02019, 1.0517, -0.09730881, 1, 1, 1, 1, 1,
-1.018222, 1.158762, 0.3277309, 0, 0, 1, 1, 1,
-1.016452, -1.891702, -1.660791, 1, 0, 0, 1, 1,
-1.013587, -0.2671483, -1.829186, 1, 0, 0, 1, 1,
-1.012622, -0.3881198, -0.294247, 1, 0, 0, 1, 1,
-1.008323, 0.8643863, 0.4352088, 1, 0, 0, 1, 1,
-1.002378, 1.430247, 0.8681327, 1, 0, 0, 1, 1,
-0.9989843, -0.919151, -1.801736, 0, 0, 0, 1, 1,
-0.9939531, 0.1553, -0.5463538, 0, 0, 0, 1, 1,
-0.9914567, 0.6976962, -0.5987922, 0, 0, 0, 1, 1,
-0.9871986, -0.4430279, -2.702901, 0, 0, 0, 1, 1,
-0.9870988, -0.7372053, -1.433454, 0, 0, 0, 1, 1,
-0.9869041, 1.172374, -0.6841177, 0, 0, 0, 1, 1,
-0.9798779, 0.8322854, -1.880897, 0, 0, 0, 1, 1,
-0.9795161, 1.977694, -0.6382784, 1, 1, 1, 1, 1,
-0.9736965, -0.8918247, -2.806982, 1, 1, 1, 1, 1,
-0.9711724, 1.474152, -1.230086, 1, 1, 1, 1, 1,
-0.9707494, -1.311951, -3.04875, 1, 1, 1, 1, 1,
-0.9655961, -1.021299, -0.4516566, 1, 1, 1, 1, 1,
-0.9569266, -0.7161411, -1.747901, 1, 1, 1, 1, 1,
-0.9531131, 2.686463, 0.1714855, 1, 1, 1, 1, 1,
-0.9497237, -2.30873, -2.339564, 1, 1, 1, 1, 1,
-0.9486684, 0.9417915, -1.431308, 1, 1, 1, 1, 1,
-0.9472775, -0.7096868, -2.2483, 1, 1, 1, 1, 1,
-0.9454205, 0.8771992, 0.09581827, 1, 1, 1, 1, 1,
-0.944794, -0.7702856, -3.40806, 1, 1, 1, 1, 1,
-0.9441302, 1.90944, 0.640469, 1, 1, 1, 1, 1,
-0.9369288, 1.346204, -0.326543, 1, 1, 1, 1, 1,
-0.9366739, 0.9459692, -1.032355, 1, 1, 1, 1, 1,
-0.9246907, 1.13884, -2.150331, 0, 0, 1, 1, 1,
-0.9211484, -0.1373907, -2.214, 1, 0, 0, 1, 1,
-0.9129503, -0.7293702, -1.635193, 1, 0, 0, 1, 1,
-0.9092589, 1.779927, -0.7562203, 1, 0, 0, 1, 1,
-0.9079677, 0.4945514, -2.426193, 1, 0, 0, 1, 1,
-0.9067033, 0.7682513, -0.7432572, 1, 0, 0, 1, 1,
-0.9055524, -0.02324802, -1.138808, 0, 0, 0, 1, 1,
-0.8950134, 1.274774, 1.129034, 0, 0, 0, 1, 1,
-0.8922452, 1.107276, -1.172175, 0, 0, 0, 1, 1,
-0.8782886, 0.3865943, -0.5377117, 0, 0, 0, 1, 1,
-0.8775574, 0.382607, 0.1920776, 0, 0, 0, 1, 1,
-0.8725023, -2.301137, -0.1437678, 0, 0, 0, 1, 1,
-0.863561, 0.9459048, -2.883887, 0, 0, 0, 1, 1,
-0.8560093, -0.6187339, -4.698464, 1, 1, 1, 1, 1,
-0.854341, 0.6952991, -0.4570718, 1, 1, 1, 1, 1,
-0.8456715, -0.9560084, -2.146554, 1, 1, 1, 1, 1,
-0.8443054, -0.8360141, -2.123045, 1, 1, 1, 1, 1,
-0.8428382, 0.3618675, -0.760774, 1, 1, 1, 1, 1,
-0.840288, 0.3374822, -2.422218, 1, 1, 1, 1, 1,
-0.8400813, -0.4496091, -1.570567, 1, 1, 1, 1, 1,
-0.8383185, 0.7495116, 0.04062824, 1, 1, 1, 1, 1,
-0.8363771, -1.364847, -2.706161, 1, 1, 1, 1, 1,
-0.8302782, -1.166938, -1.265059, 1, 1, 1, 1, 1,
-0.8287443, 1.805187, -0.9242379, 1, 1, 1, 1, 1,
-0.8271442, 0.8570112, 0.07346836, 1, 1, 1, 1, 1,
-0.8199579, 0.4271254, -1.189001, 1, 1, 1, 1, 1,
-0.816057, -1.367787, -1.536581, 1, 1, 1, 1, 1,
-0.8137909, -1.413805, -2.430119, 1, 1, 1, 1, 1,
-0.808318, 2.319018, 0.2781263, 0, 0, 1, 1, 1,
-0.8081746, 0.2454671, -0.4728536, 1, 0, 0, 1, 1,
-0.8057879, -0.7540489, -0.4135247, 1, 0, 0, 1, 1,
-0.8033347, -0.9885275, -2.498209, 1, 0, 0, 1, 1,
-0.8005756, -1.12932, -2.097479, 1, 0, 0, 1, 1,
-0.8003801, -0.7337377, -2.96615, 1, 0, 0, 1, 1,
-0.7981588, 1.165824, 0.2716907, 0, 0, 0, 1, 1,
-0.7943773, 0.3734033, 0.833457, 0, 0, 0, 1, 1,
-0.7926218, -0.1921317, -2.520869, 0, 0, 0, 1, 1,
-0.7802188, 0.807357, -1.077689, 0, 0, 0, 1, 1,
-0.7798141, -1.922708, -2.836278, 0, 0, 0, 1, 1,
-0.7795888, -0.5705477, -2.921833, 0, 0, 0, 1, 1,
-0.7781537, 0.1145155, -0.8986538, 0, 0, 0, 1, 1,
-0.7771131, -1.079111, 0.2441397, 1, 1, 1, 1, 1,
-0.7767981, -0.6477463, -2.800534, 1, 1, 1, 1, 1,
-0.776579, 0.7528935, 0.1407017, 1, 1, 1, 1, 1,
-0.7656333, -2.190399, -2.010717, 1, 1, 1, 1, 1,
-0.7625421, -0.2584668, -3.557986, 1, 1, 1, 1, 1,
-0.7587194, -0.938335, -2.112566, 1, 1, 1, 1, 1,
-0.7515748, -0.8065506, -3.52963, 1, 1, 1, 1, 1,
-0.7511282, 0.3718254, -0.6344036, 1, 1, 1, 1, 1,
-0.7492193, 0.3646399, -1.013081, 1, 1, 1, 1, 1,
-0.7477355, -0.6009764, -1.625636, 1, 1, 1, 1, 1,
-0.7422237, -0.4917141, -1.00373, 1, 1, 1, 1, 1,
-0.7396274, 0.5762923, -2.179336, 1, 1, 1, 1, 1,
-0.7380799, -1.451561, -2.985756, 1, 1, 1, 1, 1,
-0.7348228, 0.7965384, 1.517211, 1, 1, 1, 1, 1,
-0.7330365, -1.054615, -3.909691, 1, 1, 1, 1, 1,
-0.731534, -0.216015, -1.711485, 0, 0, 1, 1, 1,
-0.727689, 0.0677507, -1.324233, 1, 0, 0, 1, 1,
-0.7272949, 0.01454079, -2.36193, 1, 0, 0, 1, 1,
-0.7231189, 0.3579336, 0.7452553, 1, 0, 0, 1, 1,
-0.7196547, -1.6946, -3.579588, 1, 0, 0, 1, 1,
-0.718821, -1.732815, -1.780991, 1, 0, 0, 1, 1,
-0.7165951, 0.2171553, -2.009144, 0, 0, 0, 1, 1,
-0.714587, 0.3957887, 0.5658592, 0, 0, 0, 1, 1,
-0.7123824, 0.1198994, -0.6553553, 0, 0, 0, 1, 1,
-0.7120339, 1.353859, -1.210192, 0, 0, 0, 1, 1,
-0.7106634, 1.023476, -0.7176672, 0, 0, 0, 1, 1,
-0.7073212, -0.7348148, -3.237677, 0, 0, 0, 1, 1,
-0.7064961, -0.4161747, -2.608952, 0, 0, 0, 1, 1,
-0.7029288, 0.06942107, 0.05068654, 1, 1, 1, 1, 1,
-0.7012088, 0.9725177, -1.362827, 1, 1, 1, 1, 1,
-0.6986107, -1.498063, -2.367363, 1, 1, 1, 1, 1,
-0.6916447, 0.08126807, -1.943024, 1, 1, 1, 1, 1,
-0.6872767, 1.382163, -0.7548215, 1, 1, 1, 1, 1,
-0.6851584, 0.1512018, -1.995329, 1, 1, 1, 1, 1,
-0.6772304, -0.2713808, -2.913506, 1, 1, 1, 1, 1,
-0.6716977, -0.5452976, -1.592428, 1, 1, 1, 1, 1,
-0.6708307, 0.2512736, -1.510925, 1, 1, 1, 1, 1,
-0.6594141, -0.2073333, -1.085921, 1, 1, 1, 1, 1,
-0.648052, 1.011986, -2.189723, 1, 1, 1, 1, 1,
-0.6474677, 0.1216814, -0.7547244, 1, 1, 1, 1, 1,
-0.6472105, -0.9490648, -3.465413, 1, 1, 1, 1, 1,
-0.6364115, 1.016748, 1.175096, 1, 1, 1, 1, 1,
-0.6321263, -0.3327048, -0.6947414, 1, 1, 1, 1, 1,
-0.6292679, -0.538811, -3.68147, 0, 0, 1, 1, 1,
-0.6268225, 0.9332134, -0.04365142, 1, 0, 0, 1, 1,
-0.6260045, 0.8360991, -1.643316, 1, 0, 0, 1, 1,
-0.6258074, -0.3352004, -2.443746, 1, 0, 0, 1, 1,
-0.6256044, -0.3951834, -1.157196, 1, 0, 0, 1, 1,
-0.625028, 1.599795, -0.4088959, 1, 0, 0, 1, 1,
-0.623467, -0.5775176, -3.579919, 0, 0, 0, 1, 1,
-0.6147512, -0.4077001, -2.360612, 0, 0, 0, 1, 1,
-0.6134171, -0.1443711, -2.599639, 0, 0, 0, 1, 1,
-0.6099017, -0.1087032, -1.232393, 0, 0, 0, 1, 1,
-0.6035239, -1.175866, -2.485961, 0, 0, 0, 1, 1,
-0.5986834, -0.3864539, -0.9506668, 0, 0, 0, 1, 1,
-0.5936198, 0.8304712, -1.71623, 0, 0, 0, 1, 1,
-0.5762413, -0.7899346, -2.702713, 1, 1, 1, 1, 1,
-0.5734129, -0.8927235, -2.581782, 1, 1, 1, 1, 1,
-0.5725793, 0.2120718, -1.05076, 1, 1, 1, 1, 1,
-0.5700008, 0.70372, -0.1889685, 1, 1, 1, 1, 1,
-0.5689111, -0.65115, -2.021821, 1, 1, 1, 1, 1,
-0.5647327, -0.2997754, -2.176567, 1, 1, 1, 1, 1,
-0.5634279, 1.018577, -1.301485, 1, 1, 1, 1, 1,
-0.5610346, 1.327827, 0.178787, 1, 1, 1, 1, 1,
-0.5578861, 0.4197462, -1.200914, 1, 1, 1, 1, 1,
-0.5539551, 0.9553144, -0.7560388, 1, 1, 1, 1, 1,
-0.5507427, 0.1223388, -1.394359, 1, 1, 1, 1, 1,
-0.5454979, -0.3881916, -1.570203, 1, 1, 1, 1, 1,
-0.5414639, -0.5470134, -1.881193, 1, 1, 1, 1, 1,
-0.5392491, -2.370865, -3.573217, 1, 1, 1, 1, 1,
-0.5388074, 0.3365758, -1.989781, 1, 1, 1, 1, 1,
-0.5372407, -1.065093, -2.906979, 0, 0, 1, 1, 1,
-0.5313579, -1.368684, -0.2609557, 1, 0, 0, 1, 1,
-0.5294573, 0.1100646, -2.153116, 1, 0, 0, 1, 1,
-0.5284386, -0.03316608, -2.068084, 1, 0, 0, 1, 1,
-0.5284255, 1.59386, -1.196241, 1, 0, 0, 1, 1,
-0.5261856, 0.4813081, -1.335633, 1, 0, 0, 1, 1,
-0.5188761, -0.5946136, -2.255367, 0, 0, 0, 1, 1,
-0.5180227, 0.06646801, -3.2284, 0, 0, 0, 1, 1,
-0.507878, -1.000665, -1.600215, 0, 0, 0, 1, 1,
-0.5068495, -0.9389014, -3.369624, 0, 0, 0, 1, 1,
-0.504091, 0.2779713, -0.7869127, 0, 0, 0, 1, 1,
-0.5035048, 0.4844562, -0.5696153, 0, 0, 0, 1, 1,
-0.5024443, -0.2039376, -1.020274, 0, 0, 0, 1, 1,
-0.4983554, 0.615472, -1.195713, 1, 1, 1, 1, 1,
-0.4975379, 1.044899, -0.06419383, 1, 1, 1, 1, 1,
-0.4915314, -0.5912321, -1.731568, 1, 1, 1, 1, 1,
-0.4900854, -0.06300158, -0.07421594, 1, 1, 1, 1, 1,
-0.4846934, -0.2811138, -2.465365, 1, 1, 1, 1, 1,
-0.4760389, -0.3815885, -4.27898, 1, 1, 1, 1, 1,
-0.474876, -1.099958, -3.496732, 1, 1, 1, 1, 1,
-0.4742453, -0.4289467, -3.714379, 1, 1, 1, 1, 1,
-0.4738879, 0.7972442, -0.5320637, 1, 1, 1, 1, 1,
-0.4735199, 0.5035063, -0.2606779, 1, 1, 1, 1, 1,
-0.4730069, -2.344741, -4.227046, 1, 1, 1, 1, 1,
-0.4722326, -0.516394, -0.9409021, 1, 1, 1, 1, 1,
-0.471118, 0.4839695, -0.402245, 1, 1, 1, 1, 1,
-0.466792, 0.5262234, -1.583016, 1, 1, 1, 1, 1,
-0.4664796, 1.308129, -0.4589205, 1, 1, 1, 1, 1,
-0.4641214, -0.8980978, -2.640604, 0, 0, 1, 1, 1,
-0.4599583, 0.2212211, -1.478614, 1, 0, 0, 1, 1,
-0.4575564, -0.9141627, -2.622052, 1, 0, 0, 1, 1,
-0.4566912, 0.7993613, -0.1296227, 1, 0, 0, 1, 1,
-0.45468, 0.9397754, -0.3611466, 1, 0, 0, 1, 1,
-0.4531106, -0.6024613, -2.278078, 1, 0, 0, 1, 1,
-0.4468168, -1.402542, -1.553268, 0, 0, 0, 1, 1,
-0.4459458, 0.7608747, -1.884072, 0, 0, 0, 1, 1,
-0.4404817, 0.531031, -1.379813, 0, 0, 0, 1, 1,
-0.4379527, -0.428455, -3.41793, 0, 0, 0, 1, 1,
-0.431472, 0.4972772, -1.384777, 0, 0, 0, 1, 1,
-0.4304759, 1.132412, 0.3050078, 0, 0, 0, 1, 1,
-0.4286557, -0.7715185, -2.044183, 0, 0, 0, 1, 1,
-0.4278969, -0.1746924, -1.177994, 1, 1, 1, 1, 1,
-0.4276935, 1.29445, 0.9262344, 1, 1, 1, 1, 1,
-0.4260267, -0.3269784, -3.442339, 1, 1, 1, 1, 1,
-0.4240409, -0.9048594, -1.935694, 1, 1, 1, 1, 1,
-0.4231593, -1.15073, -1.492405, 1, 1, 1, 1, 1,
-0.4183863, -1.037489, -2.637665, 1, 1, 1, 1, 1,
-0.4020875, 0.6080296, -0.3479245, 1, 1, 1, 1, 1,
-0.3991875, 1.446736, -0.7938588, 1, 1, 1, 1, 1,
-0.397679, -0.5376838, -1.752389, 1, 1, 1, 1, 1,
-0.3931811, -0.07074659, -1.721409, 1, 1, 1, 1, 1,
-0.3886488, -0.3661573, -4.732939, 1, 1, 1, 1, 1,
-0.3816314, 0.6993504, -0.8698004, 1, 1, 1, 1, 1,
-0.3775636, 1.314328, 0.6787358, 1, 1, 1, 1, 1,
-0.3695872, 0.7447379, -0.2410876, 1, 1, 1, 1, 1,
-0.3693645, -0.7681789, -3.864693, 1, 1, 1, 1, 1,
-0.3688625, -0.7061183, -2.317043, 0, 0, 1, 1, 1,
-0.3680286, -2.712283, -4.630444, 1, 0, 0, 1, 1,
-0.3676939, -0.2498612, -1.947568, 1, 0, 0, 1, 1,
-0.3638664, -1.42456, -2.897732, 1, 0, 0, 1, 1,
-0.3618586, -1.237008, -1.799317, 1, 0, 0, 1, 1,
-0.360533, -0.4067492, -4.064585, 1, 0, 0, 1, 1,
-0.3585511, 0.912005, 0.1708356, 0, 0, 0, 1, 1,
-0.3562911, 2.365674, 1.311863, 0, 0, 0, 1, 1,
-0.3559934, -0.2440288, -2.651428, 0, 0, 0, 1, 1,
-0.3544125, 0.2770315, -2.028736, 0, 0, 0, 1, 1,
-0.3525405, -1.015158, -2.108526, 0, 0, 0, 1, 1,
-0.3518417, 0.5420628, -1.613447, 0, 0, 0, 1, 1,
-0.3500348, 0.3867443, -1.288441, 0, 0, 0, 1, 1,
-0.3462901, -1.181225, -2.834662, 1, 1, 1, 1, 1,
-0.3459502, 0.5478672, -0.7267498, 1, 1, 1, 1, 1,
-0.3453802, 0.1546818, -2.298875, 1, 1, 1, 1, 1,
-0.3453249, 0.4831189, -1.022213, 1, 1, 1, 1, 1,
-0.3444698, -0.3372955, -3.427129, 1, 1, 1, 1, 1,
-0.3437497, -0.5633128, -1.199774, 1, 1, 1, 1, 1,
-0.3368121, 0.2721198, -1.883477, 1, 1, 1, 1, 1,
-0.3361337, -0.1259093, -2.576927, 1, 1, 1, 1, 1,
-0.3346853, 1.51059, -1.472539, 1, 1, 1, 1, 1,
-0.3339945, 0.009155571, -2.207608, 1, 1, 1, 1, 1,
-0.3323573, 0.3655085, -2.427441, 1, 1, 1, 1, 1,
-0.3302009, -0.5178257, -3.878313, 1, 1, 1, 1, 1,
-0.3249461, 0.2029929, -0.3985122, 1, 1, 1, 1, 1,
-0.3248422, 0.4899552, 0.2069495, 1, 1, 1, 1, 1,
-0.3248238, -1.436781, -2.382119, 1, 1, 1, 1, 1,
-0.3213134, -0.08781384, -2.528681, 0, 0, 1, 1, 1,
-0.3201058, -1.476443, -1.791329, 1, 0, 0, 1, 1,
-0.3169444, 0.4551535, -0.09727592, 1, 0, 0, 1, 1,
-0.3139231, 1.003754, 0.7224371, 1, 0, 0, 1, 1,
-0.3117715, 0.4970903, -0.2779637, 1, 0, 0, 1, 1,
-0.3095644, 0.8547862, -0.6660661, 1, 0, 0, 1, 1,
-0.306413, 0.8241403, 0.06232121, 0, 0, 0, 1, 1,
-0.3039264, -0.09161036, -2.510823, 0, 0, 0, 1, 1,
-0.3009756, 0.5716397, -0.8767556, 0, 0, 0, 1, 1,
-0.2982645, 1.346227, -0.2380808, 0, 0, 0, 1, 1,
-0.297676, -1.106422, -3.46734, 0, 0, 0, 1, 1,
-0.2974643, 0.2995264, -0.552097, 0, 0, 0, 1, 1,
-0.2954289, 1.382141, 0.3756727, 0, 0, 0, 1, 1,
-0.2929447, -0.3423241, -1.747474, 1, 1, 1, 1, 1,
-0.2918247, -1.363465, -2.054456, 1, 1, 1, 1, 1,
-0.2911005, -0.1881179, -3.816768, 1, 1, 1, 1, 1,
-0.289492, 0.5258511, -1.489496, 1, 1, 1, 1, 1,
-0.2885145, 0.567708, 0.7515986, 1, 1, 1, 1, 1,
-0.2772869, 0.8730767, -1.155195, 1, 1, 1, 1, 1,
-0.271404, 0.8201614, 0.1511533, 1, 1, 1, 1, 1,
-0.2713213, -1.783612, -3.973933, 1, 1, 1, 1, 1,
-0.26994, 0.374565, -2.107465, 1, 1, 1, 1, 1,
-0.2661532, -0.7916432, -1.923925, 1, 1, 1, 1, 1,
-0.2657561, -0.9769838, -2.778011, 1, 1, 1, 1, 1,
-0.2584519, -0.8424994, -3.102395, 1, 1, 1, 1, 1,
-0.2563734, -0.7335535, -1.950153, 1, 1, 1, 1, 1,
-0.2523512, -1.410379, -2.601236, 1, 1, 1, 1, 1,
-0.2518438, 0.1165733, -1.564775, 1, 1, 1, 1, 1,
-0.2476259, -1.247138, -3.345865, 0, 0, 1, 1, 1,
-0.2467984, 0.9177427, -0.415834, 1, 0, 0, 1, 1,
-0.246442, 0.6065414, -0.6748384, 1, 0, 0, 1, 1,
-0.2462793, 0.2039942, -1.645809, 1, 0, 0, 1, 1,
-0.2345146, -0.0552854, -2.060724, 1, 0, 0, 1, 1,
-0.2342122, -0.5593061, -2.66205, 1, 0, 0, 1, 1,
-0.233307, 1.321818, 0.676723, 0, 0, 0, 1, 1,
-0.2328967, 1.057353, -0.5422122, 0, 0, 0, 1, 1,
-0.2296915, -0.9132673, -2.96117, 0, 0, 0, 1, 1,
-0.227134, -1.617663, -2.2715, 0, 0, 0, 1, 1,
-0.2195283, -0.4695381, -3.256544, 0, 0, 0, 1, 1,
-0.2189703, 2.282244, 0.5987788, 0, 0, 0, 1, 1,
-0.2185153, 0.5693757, 1.064942, 0, 0, 0, 1, 1,
-0.2170445, 0.6078262, -0.7045656, 1, 1, 1, 1, 1,
-0.2167119, 0.822732, -0.3460864, 1, 1, 1, 1, 1,
-0.2133799, -0.4432589, -1.344189, 1, 1, 1, 1, 1,
-0.2125039, 1.445081, -0.9457588, 1, 1, 1, 1, 1,
-0.2086729, -0.5749916, -2.483389, 1, 1, 1, 1, 1,
-0.2081987, 0.7751602, -0.0471661, 1, 1, 1, 1, 1,
-0.2074635, -0.09251942, -2.575369, 1, 1, 1, 1, 1,
-0.2026725, 0.2941278, 0.08418728, 1, 1, 1, 1, 1,
-0.2021746, -0.1738391, -2.492818, 1, 1, 1, 1, 1,
-0.198581, -0.9183014, -1.655836, 1, 1, 1, 1, 1,
-0.1975494, -0.4450192, -5.306273, 1, 1, 1, 1, 1,
-0.1947519, 0.2714235, -0.2753553, 1, 1, 1, 1, 1,
-0.1934663, -0.530168, -2.790326, 1, 1, 1, 1, 1,
-0.1850857, -1.156655, -2.35875, 1, 1, 1, 1, 1,
-0.1795555, -0.775255, -5.681132, 1, 1, 1, 1, 1,
-0.173885, 0.3482926, -0.7781431, 0, 0, 1, 1, 1,
-0.1688157, 1.046189, -0.2397264, 1, 0, 0, 1, 1,
-0.1669096, 1.570136, 0.2923322, 1, 0, 0, 1, 1,
-0.1649462, -0.4209389, -3.926336, 1, 0, 0, 1, 1,
-0.1584495, -0.7443057, -2.563385, 1, 0, 0, 1, 1,
-0.1512098, 0.8285005, 0.8262414, 1, 0, 0, 1, 1,
-0.1503832, 1.537713, 1.220476, 0, 0, 0, 1, 1,
-0.1483615, -0.6100245, -1.979789, 0, 0, 0, 1, 1,
-0.1363179, -0.2499774, -2.555791, 0, 0, 0, 1, 1,
-0.1341086, -0.9963635, -5.080201, 0, 0, 0, 1, 1,
-0.1328788, 1.064052, -0.2555671, 0, 0, 0, 1, 1,
-0.1303993, 0.8407159, 0.1627364, 0, 0, 0, 1, 1,
-0.1300551, 0.8749669, -3.023479, 0, 0, 0, 1, 1,
-0.127217, -1.117625, -4.030007, 1, 1, 1, 1, 1,
-0.125056, 0.5554861, -0.2533719, 1, 1, 1, 1, 1,
-0.1245456, 0.1976772, 0.1237475, 1, 1, 1, 1, 1,
-0.1150307, 1.469621, -1.017944, 1, 1, 1, 1, 1,
-0.1119007, -0.7008289, -6.396172, 1, 1, 1, 1, 1,
-0.1051382, 1.557186, 0.6368546, 1, 1, 1, 1, 1,
-0.1048321, 0.5692223, -1.485043, 1, 1, 1, 1, 1,
-0.08700892, 0.4990645, -2.651099, 1, 1, 1, 1, 1,
-0.08653799, 1.259406, 1.187144, 1, 1, 1, 1, 1,
-0.08091833, 0.9783927, -1.048906, 1, 1, 1, 1, 1,
-0.07995531, -0.8556473, -1.319716, 1, 1, 1, 1, 1,
-0.07880358, 1.078039, -1.351945, 1, 1, 1, 1, 1,
-0.0760396, -0.540226, -3.469754, 1, 1, 1, 1, 1,
-0.07579682, 1.405839, -0.1700961, 1, 1, 1, 1, 1,
-0.06993663, -0.230575, -3.993815, 1, 1, 1, 1, 1,
-0.06906784, -0.045873, -2.336819, 0, 0, 1, 1, 1,
-0.06785611, 1.481467, 0.8770836, 1, 0, 0, 1, 1,
-0.06774157, -1.351624, -4.530787, 1, 0, 0, 1, 1,
-0.06677908, 1.15669, -0.557874, 1, 0, 0, 1, 1,
-0.06595717, 1.137496, 0.2943474, 1, 0, 0, 1, 1,
-0.06172837, -1.672003, -4.017773, 1, 0, 0, 1, 1,
-0.05995889, -0.2775424, -3.385415, 0, 0, 0, 1, 1,
-0.05469792, -1.311486, -1.511216, 0, 0, 0, 1, 1,
-0.05418358, -0.7424804, -3.675206, 0, 0, 0, 1, 1,
-0.05253688, -0.5183215, -2.891455, 0, 0, 0, 1, 1,
-0.05199597, 0.1825067, -0.2291323, 0, 0, 0, 1, 1,
-0.05183219, 0.110004, 1.05617, 0, 0, 0, 1, 1,
-0.0515562, 1.368538, 0.05233379, 0, 0, 0, 1, 1,
-0.0501831, 0.7435454, -0.2354074, 1, 1, 1, 1, 1,
-0.04895743, -0.715498, -3.164258, 1, 1, 1, 1, 1,
-0.04876934, 0.9690908, -0.2036989, 1, 1, 1, 1, 1,
-0.04079394, 0.3649059, 0.5298778, 1, 1, 1, 1, 1,
-0.03965735, 0.354319, -1.049794, 1, 1, 1, 1, 1,
-0.03934674, 0.8757675, -0.9460633, 1, 1, 1, 1, 1,
-0.03345191, 1.322367, -0.4784595, 1, 1, 1, 1, 1,
-0.03312094, 1.140455, 1.10479, 1, 1, 1, 1, 1,
-0.02865764, -0.8276789, -4.609111, 1, 1, 1, 1, 1,
-0.02862219, -0.05360344, -2.679154, 1, 1, 1, 1, 1,
-0.02242904, -0.2840253, -3.455841, 1, 1, 1, 1, 1,
-0.01977854, 1.190014, 1.176594, 1, 1, 1, 1, 1,
-0.01833943, -0.9512743, -3.438262, 1, 1, 1, 1, 1,
-0.01815216, -0.5567253, -1.312134, 1, 1, 1, 1, 1,
-0.01598523, 0.3205468, -0.008729734, 1, 1, 1, 1, 1,
-0.01237658, 2.562297, -0.02416271, 0, 0, 1, 1, 1,
-0.004874383, 0.2653373, 0.01451329, 1, 0, 0, 1, 1,
-0.002781689, 0.7985457, -2.418366, 1, 0, 0, 1, 1,
-0.002753474, 0.7066473, -0.9058489, 1, 0, 0, 1, 1,
-0.001011015, -1.558104, -3.154758, 1, 0, 0, 1, 1,
0.002207809, -0.3595901, 4.873034, 1, 0, 0, 1, 1,
0.002433331, 0.6597782, 0.1233078, 0, 0, 0, 1, 1,
0.002561423, -1.119135, 3.021415, 0, 0, 0, 1, 1,
0.003142708, -2.050984, 3.28648, 0, 0, 0, 1, 1,
0.003926429, -0.3005281, 2.450354, 0, 0, 0, 1, 1,
0.007467885, -1.144913, 1.316334, 0, 0, 0, 1, 1,
0.009291178, -0.3974175, 3.271245, 0, 0, 0, 1, 1,
0.01096381, 0.4736584, 0.4966672, 0, 0, 0, 1, 1,
0.01215511, 0.7811995, 0.6161316, 1, 1, 1, 1, 1,
0.01261017, -0.245135, 4.431685, 1, 1, 1, 1, 1,
0.01565054, 1.361983, -1.060689, 1, 1, 1, 1, 1,
0.01945827, -1.787491, 0.9011582, 1, 1, 1, 1, 1,
0.02020321, 0.2913862, 1.472007, 1, 1, 1, 1, 1,
0.02100388, -1.106276, 4.115171, 1, 1, 1, 1, 1,
0.0217131, 1.626063, 0.9046322, 1, 1, 1, 1, 1,
0.0239395, 0.7070251, 0.09420249, 1, 1, 1, 1, 1,
0.02612634, 2.087282, 0.3882469, 1, 1, 1, 1, 1,
0.0297956, -1.124867, 1.656163, 1, 1, 1, 1, 1,
0.03234578, -0.5018918, 2.145089, 1, 1, 1, 1, 1,
0.03618908, 0.158953, -0.08524536, 1, 1, 1, 1, 1,
0.03649807, 1.370192, 1.406536, 1, 1, 1, 1, 1,
0.040329, -1.104138, 5.355186, 1, 1, 1, 1, 1,
0.04051078, 1.332337, -0.6533938, 1, 1, 1, 1, 1,
0.04103864, -1.583356, 4.565552, 0, 0, 1, 1, 1,
0.04350291, -1.666181, 2.974894, 1, 0, 0, 1, 1,
0.04606523, -1.025229, 1.968649, 1, 0, 0, 1, 1,
0.046257, -0.2234974, 2.553998, 1, 0, 0, 1, 1,
0.05039194, -0.04133049, 3.107263, 1, 0, 0, 1, 1,
0.05127086, 0.1605765, 1.008673, 1, 0, 0, 1, 1,
0.05599066, 0.1874086, -0.3314522, 0, 0, 0, 1, 1,
0.05722371, 0.2499517, 0.8416793, 0, 0, 0, 1, 1,
0.06109457, -0.4592995, 2.816634, 0, 0, 0, 1, 1,
0.06260469, -0.8236071, 3.798563, 0, 0, 0, 1, 1,
0.06896118, 1.512988, -0.672936, 0, 0, 0, 1, 1,
0.06946821, -0.5576791, 3.163462, 0, 0, 0, 1, 1,
0.06973598, 0.4873823, -0.04606489, 0, 0, 0, 1, 1,
0.07167703, -1.507604, 2.000688, 1, 1, 1, 1, 1,
0.08641618, -0.0454202, 1.956236, 1, 1, 1, 1, 1,
0.08826276, -1.474008, 3.690485, 1, 1, 1, 1, 1,
0.09047489, -0.3897356, 1.503181, 1, 1, 1, 1, 1,
0.09334358, 2.042661, 2.641851, 1, 1, 1, 1, 1,
0.09555896, -2.962191, 4.444388, 1, 1, 1, 1, 1,
0.09592807, -0.271831, 4.553653, 1, 1, 1, 1, 1,
0.1000378, 0.2455218, -0.9735644, 1, 1, 1, 1, 1,
0.1029219, -0.1384121, 3.692543, 1, 1, 1, 1, 1,
0.1047621, 0.9703939, 0.243503, 1, 1, 1, 1, 1,
0.1062997, 1.502831, 0.0997152, 1, 1, 1, 1, 1,
0.1076403, -1.576497, 3.831954, 1, 1, 1, 1, 1,
0.113347, -0.4292217, 3.795766, 1, 1, 1, 1, 1,
0.1151462, -1.273394, 3.052347, 1, 1, 1, 1, 1,
0.1155344, -0.5151902, 2.362183, 1, 1, 1, 1, 1,
0.1190764, -0.9730858, 2.373954, 0, 0, 1, 1, 1,
0.1205491, 0.1610326, -0.3760208, 1, 0, 0, 1, 1,
0.1224831, 1.683708, 0.474771, 1, 0, 0, 1, 1,
0.1237943, -1.048202, 1.83368, 1, 0, 0, 1, 1,
0.1257523, 0.03060756, 1.124274, 1, 0, 0, 1, 1,
0.1276867, 0.6199427, 1.684799, 1, 0, 0, 1, 1,
0.1289546, 0.4287574, 1.672754, 0, 0, 0, 1, 1,
0.1289733, 0.5623065, -0.6626643, 0, 0, 0, 1, 1,
0.1357573, -0.5566723, 3.166268, 0, 0, 0, 1, 1,
0.1363073, -0.6891257, 2.191734, 0, 0, 0, 1, 1,
0.1430127, -0.952538, 2.531349, 0, 0, 0, 1, 1,
0.1432968, 0.2104673, 2.072142, 0, 0, 0, 1, 1,
0.1448075, -1.091267, 2.352824, 0, 0, 0, 1, 1,
0.1448706, -0.1205429, 1.862022, 1, 1, 1, 1, 1,
0.1475085, -0.5198122, 2.213216, 1, 1, 1, 1, 1,
0.1488844, -0.1692874, 1.382388, 1, 1, 1, 1, 1,
0.1489936, 0.8144891, 0.06801243, 1, 1, 1, 1, 1,
0.150645, -0.6527888, 1.960956, 1, 1, 1, 1, 1,
0.1507365, -2.584595, 2.288584, 1, 1, 1, 1, 1,
0.1511189, 0.5765938, 1.27725, 1, 1, 1, 1, 1,
0.1577625, -0.1249797, 3.836702, 1, 1, 1, 1, 1,
0.160021, 1.633172, 0.1426745, 1, 1, 1, 1, 1,
0.1659276, -0.5064886, 3.589271, 1, 1, 1, 1, 1,
0.1669396, 0.653249, 0.5883887, 1, 1, 1, 1, 1,
0.1688601, -0.2972698, 1.841872, 1, 1, 1, 1, 1,
0.1694678, 0.03653428, 1.283507, 1, 1, 1, 1, 1,
0.1697579, -0.6213264, 2.695867, 1, 1, 1, 1, 1,
0.1738786, -0.2901274, 4.458143, 1, 1, 1, 1, 1,
0.1754586, 1.606779, 0.2567223, 0, 0, 1, 1, 1,
0.1777492, 1.040287, -2.693659, 1, 0, 0, 1, 1,
0.1802783, 1.665874, 0.9576715, 1, 0, 0, 1, 1,
0.1875186, -1.085966, 3.396314, 1, 0, 0, 1, 1,
0.1905526, -1.166668, 2.074642, 1, 0, 0, 1, 1,
0.1907022, -0.3360857, 1.820627, 1, 0, 0, 1, 1,
0.1909537, -0.439483, 3.037032, 0, 0, 0, 1, 1,
0.1923067, -0.9926164, 1.713001, 0, 0, 0, 1, 1,
0.1924494, -0.502066, 3.501824, 0, 0, 0, 1, 1,
0.194864, -1.004153, 2.101243, 0, 0, 0, 1, 1,
0.1956136, 0.9295933, 0.8279276, 0, 0, 0, 1, 1,
0.1967026, -2.179437, 2.510898, 0, 0, 0, 1, 1,
0.1996759, -0.8427858, 3.143014, 0, 0, 0, 1, 1,
0.2015991, 0.3242967, 1.973388, 1, 1, 1, 1, 1,
0.2053297, -0.5878387, 2.746085, 1, 1, 1, 1, 1,
0.2056048, 0.3682808, 0.9112775, 1, 1, 1, 1, 1,
0.2087127, 1.035898, 0.613246, 1, 1, 1, 1, 1,
0.2095385, -0.6091362, 2.941248, 1, 1, 1, 1, 1,
0.2129754, -0.0526189, 1.559718, 1, 1, 1, 1, 1,
0.2210674, -0.4444164, 3.721443, 1, 1, 1, 1, 1,
0.221923, -0.1256876, 3.259902, 1, 1, 1, 1, 1,
0.224401, 0.8627661, 0.9293102, 1, 1, 1, 1, 1,
0.2263896, 0.1322985, 1.437386, 1, 1, 1, 1, 1,
0.2301506, -1.472699, 2.029533, 1, 1, 1, 1, 1,
0.2424589, 0.4684061, 1.545432, 1, 1, 1, 1, 1,
0.2472543, 1.212324, -0.2498926, 1, 1, 1, 1, 1,
0.2491082, -0.4885058, 1.771923, 1, 1, 1, 1, 1,
0.2513855, -0.4284643, 3.994824, 1, 1, 1, 1, 1,
0.2533421, 0.7390847, -0.08545639, 0, 0, 1, 1, 1,
0.2570776, 0.6260824, -0.8501123, 1, 0, 0, 1, 1,
0.2605863, -0.2941424, 5.619271, 1, 0, 0, 1, 1,
0.261385, 0.366979, 0.4107305, 1, 0, 0, 1, 1,
0.2652294, -0.3505101, 1.296073, 1, 0, 0, 1, 1,
0.2660806, -0.8034067, 2.336408, 1, 0, 0, 1, 1,
0.2669293, -0.4531792, 1.974633, 0, 0, 0, 1, 1,
0.2706941, -1.392638, 3.938105, 0, 0, 0, 1, 1,
0.2707484, 1.020003, 0.4948263, 0, 0, 0, 1, 1,
0.2709946, -0.5024113, 2.016269, 0, 0, 0, 1, 1,
0.2716423, -0.3059408, 0.8072954, 0, 0, 0, 1, 1,
0.2761185, -1.458847, 3.076308, 0, 0, 0, 1, 1,
0.2810644, -1.028724, 4.660878, 0, 0, 0, 1, 1,
0.2834863, 1.698469, 0.1857255, 1, 1, 1, 1, 1,
0.2853192, -0.5790641, 2.462607, 1, 1, 1, 1, 1,
0.2853668, -0.628624, 2.008632, 1, 1, 1, 1, 1,
0.2859446, -0.1296591, 2.225553, 1, 1, 1, 1, 1,
0.2872389, -0.05316208, 0.672325, 1, 1, 1, 1, 1,
0.2891066, 0.1119519, 1.209566, 1, 1, 1, 1, 1,
0.2928379, 0.091219, 1.373108, 1, 1, 1, 1, 1,
0.2975555, -2.675321, 2.559286, 1, 1, 1, 1, 1,
0.3000543, 0.6059501, 1.588647, 1, 1, 1, 1, 1,
0.3012941, -0.8028156, 2.546217, 1, 1, 1, 1, 1,
0.3023608, -1.689168, 2.303642, 1, 1, 1, 1, 1,
0.3074394, -0.6650262, 3.15785, 1, 1, 1, 1, 1,
0.308062, 0.504984, 0.8922272, 1, 1, 1, 1, 1,
0.3158933, 0.538586, 2.236914, 1, 1, 1, 1, 1,
0.3200159, 1.448496, -0.2585631, 1, 1, 1, 1, 1,
0.3233908, 2.311477, -0.1105788, 0, 0, 1, 1, 1,
0.3245776, -0.5512754, 0.977392, 1, 0, 0, 1, 1,
0.3251264, 0.6943002, -0.5254055, 1, 0, 0, 1, 1,
0.3259071, -1.154936, 3.15074, 1, 0, 0, 1, 1,
0.3347644, -0.09195297, 2.980047, 1, 0, 0, 1, 1,
0.339597, 1.951898, 2.400149, 1, 0, 0, 1, 1,
0.343912, 0.005092662, 2.649601, 0, 0, 0, 1, 1,
0.3478512, 0.5947388, 0.7376586, 0, 0, 0, 1, 1,
0.3496349, 1.710869, 2.642617, 0, 0, 0, 1, 1,
0.3513967, -1.750396, 4.160617, 0, 0, 0, 1, 1,
0.3518295, 0.9061981, 0.7996184, 0, 0, 0, 1, 1,
0.3549776, -0.3144688, 1.800983, 0, 0, 0, 1, 1,
0.3697248, -0.05822509, 1.120148, 0, 0, 0, 1, 1,
0.3725137, -0.5073514, 1.671907, 1, 1, 1, 1, 1,
0.3742542, -1.166689, 4.884762, 1, 1, 1, 1, 1,
0.3749982, 0.2488441, 1.781996, 1, 1, 1, 1, 1,
0.3784365, -0.778621, 1.233652, 1, 1, 1, 1, 1,
0.3796, -0.1306687, 1.821879, 1, 1, 1, 1, 1,
0.3828379, -0.909315, 2.728674, 1, 1, 1, 1, 1,
0.3849613, 1.242908, 0.2780194, 1, 1, 1, 1, 1,
0.3891842, -0.538433, 3.343178, 1, 1, 1, 1, 1,
0.3920057, 0.175335, 0.6795014, 1, 1, 1, 1, 1,
0.3974533, 0.8956769, 0.9595465, 1, 1, 1, 1, 1,
0.3979501, 0.09691105, 1.160807, 1, 1, 1, 1, 1,
0.4020487, -0.138934, 0.5173355, 1, 1, 1, 1, 1,
0.4104906, 0.2875833, 0.5183857, 1, 1, 1, 1, 1,
0.4110314, -0.03422045, 2.87971, 1, 1, 1, 1, 1,
0.4144796, -1.584719, 3.859428, 1, 1, 1, 1, 1,
0.4152367, 0.1309084, 1.53652, 0, 0, 1, 1, 1,
0.4188914, 0.3881069, 1.15094, 1, 0, 0, 1, 1,
0.4194636, 0.1432233, 1.436579, 1, 0, 0, 1, 1,
0.4230172, -2.046897, 2.012584, 1, 0, 0, 1, 1,
0.423355, 0.9824522, 0.2505368, 1, 0, 0, 1, 1,
0.4292986, -2.260113, 3.193751, 1, 0, 0, 1, 1,
0.4333964, -1.367967, 1.439215, 0, 0, 0, 1, 1,
0.4360297, 0.3363328, 1.778669, 0, 0, 0, 1, 1,
0.4362409, 1.427295, 0.9564936, 0, 0, 0, 1, 1,
0.4374239, 1.123534, 1.731663, 0, 0, 0, 1, 1,
0.4396126, 0.4295954, -1.708341, 0, 0, 0, 1, 1,
0.4440637, 0.6866652, 0.08842798, 0, 0, 0, 1, 1,
0.4442044, 0.2608168, 1.77414, 0, 0, 0, 1, 1,
0.4477181, -1.120767, 3.429623, 1, 1, 1, 1, 1,
0.4535815, 0.1409, 1.990483, 1, 1, 1, 1, 1,
0.4537925, -0.5898051, 1.822585, 1, 1, 1, 1, 1,
0.4538287, -0.6892381, 3.553195, 1, 1, 1, 1, 1,
0.4596952, -0.2824618, 3.076677, 1, 1, 1, 1, 1,
0.4599057, 0.1813487, 2.45826, 1, 1, 1, 1, 1,
0.4627535, -0.547403, -0.00611787, 1, 1, 1, 1, 1,
0.4676295, -0.1042486, 0.7813267, 1, 1, 1, 1, 1,
0.4683639, 1.44939, -0.3694914, 1, 1, 1, 1, 1,
0.4736305, -0.3951567, 3.031024, 1, 1, 1, 1, 1,
0.4863262, -0.2030972, 0.9725534, 1, 1, 1, 1, 1,
0.4901731, -1.206772, 3.925654, 1, 1, 1, 1, 1,
0.4923362, -0.4876901, 1.167066, 1, 1, 1, 1, 1,
0.4991642, -0.9561442, 1.781595, 1, 1, 1, 1, 1,
0.5027711, 0.2652008, 1.051111, 1, 1, 1, 1, 1,
0.5072091, 0.2574784, 0.7875491, 0, 0, 1, 1, 1,
0.5154182, -0.1976912, -0.0956979, 1, 0, 0, 1, 1,
0.5178692, -0.8626643, 1.131022, 1, 0, 0, 1, 1,
0.5203859, -1.88507, 1.823027, 1, 0, 0, 1, 1,
0.5212408, 0.6179076, -0.2932136, 1, 0, 0, 1, 1,
0.5252463, -0.7697983, 3.477189, 1, 0, 0, 1, 1,
0.5277918, 0.6358315, 0.1040544, 0, 0, 0, 1, 1,
0.5299525, 0.5328313, 0.7868055, 0, 0, 0, 1, 1,
0.5347412, 0.9714654, 2.218932, 0, 0, 0, 1, 1,
0.5350223, 1.192822, -0.9284427, 0, 0, 0, 1, 1,
0.5370761, -0.06333042, 0.8118379, 0, 0, 0, 1, 1,
0.5402053, 0.07795605, 2.078064, 0, 0, 0, 1, 1,
0.5431604, -0.394528, 1.682059, 0, 0, 0, 1, 1,
0.5467476, -0.5072409, 3.559805, 1, 1, 1, 1, 1,
0.5476433, -0.6166981, 2.649945, 1, 1, 1, 1, 1,
0.5491064, 0.1732989, 0.9262147, 1, 1, 1, 1, 1,
0.551228, 2.002091, -0.04050831, 1, 1, 1, 1, 1,
0.5513036, 0.7726122, -0.1469387, 1, 1, 1, 1, 1,
0.552412, 0.4491355, 1.517158, 1, 1, 1, 1, 1,
0.5568632, -0.9886469, 4.045148, 1, 1, 1, 1, 1,
0.5591639, -0.4812312, 2.726692, 1, 1, 1, 1, 1,
0.5595563, -0.04184084, 4.310946, 1, 1, 1, 1, 1,
0.5596878, 0.7944348, 1.784357, 1, 1, 1, 1, 1,
0.5640373, -0.9139885, 1.55928, 1, 1, 1, 1, 1,
0.5664922, 0.7623841, 0.2108026, 1, 1, 1, 1, 1,
0.5676025, 0.3301121, 1.251127, 1, 1, 1, 1, 1,
0.5754171, 0.4288144, -0.03411745, 1, 1, 1, 1, 1,
0.5766025, 0.8572648, -0.8673257, 1, 1, 1, 1, 1,
0.5817288, -0.9019477, 2.954876, 0, 0, 1, 1, 1,
0.5826273, -0.2400574, 4.016664, 1, 0, 0, 1, 1,
0.5897003, -1.298562, 3.612959, 1, 0, 0, 1, 1,
0.5926555, 1.419187, 0.9012488, 1, 0, 0, 1, 1,
0.5944456, 0.00856893, 3.071742, 1, 0, 0, 1, 1,
0.5962298, 0.1361085, 1.703435, 1, 0, 0, 1, 1,
0.6003537, 0.9365631, 0.1664323, 0, 0, 0, 1, 1,
0.6047199, -0.4102797, 2.552074, 0, 0, 0, 1, 1,
0.6047432, 0.7497129, -0.16855, 0, 0, 0, 1, 1,
0.6089551, 1.253975, 0.4078498, 0, 0, 0, 1, 1,
0.6132627, -0.8990211, 0.3165784, 0, 0, 0, 1, 1,
0.632143, 0.6874155, 0.7715544, 0, 0, 0, 1, 1,
0.6353701, 0.4305273, -0.3803361, 0, 0, 0, 1, 1,
0.6399742, 1.201091, 0.7443041, 1, 1, 1, 1, 1,
0.6412073, 2.102226, 0.6674197, 1, 1, 1, 1, 1,
0.650276, -0.9034654, 1.664396, 1, 1, 1, 1, 1,
0.6529339, -0.5936068, 2.427298, 1, 1, 1, 1, 1,
0.654518, 0.09732196, 1.778872, 1, 1, 1, 1, 1,
0.6545325, -0.374985, 1.063286, 1, 1, 1, 1, 1,
0.654934, 0.5466423, 0.7577056, 1, 1, 1, 1, 1,
0.6583586, 2.565327, 1.36724, 1, 1, 1, 1, 1,
0.6594566, -0.8289747, 2.585352, 1, 1, 1, 1, 1,
0.6652311, -0.4410885, 0.9957719, 1, 1, 1, 1, 1,
0.6673001, 1.115508, -0.2688688, 1, 1, 1, 1, 1,
0.6694413, -0.6206486, 3.855264, 1, 1, 1, 1, 1,
0.6695094, 0.6514795, 1.369578, 1, 1, 1, 1, 1,
0.671347, -1.77004, 2.642259, 1, 1, 1, 1, 1,
0.6833919, -0.6440908, 1.821915, 1, 1, 1, 1, 1,
0.6834911, -0.3039875, 2.267304, 0, 0, 1, 1, 1,
0.6859839, 0.5475906, 1.10691, 1, 0, 0, 1, 1,
0.688408, -1.169093, 3.445181, 1, 0, 0, 1, 1,
0.6896451, -0.3855708, 2.661723, 1, 0, 0, 1, 1,
0.6940579, 1.40357, -0.4829568, 1, 0, 0, 1, 1,
0.6950897, -1.175246, 3.031914, 1, 0, 0, 1, 1,
0.6989916, -1.115251, 3.712727, 0, 0, 0, 1, 1,
0.7070039, 0.6610756, -0.1232035, 0, 0, 0, 1, 1,
0.7110247, 0.6095773, -1.408317, 0, 0, 0, 1, 1,
0.7178265, -0.6161857, 1.223905, 0, 0, 0, 1, 1,
0.7183275, 0.732509, 0.8720672, 0, 0, 0, 1, 1,
0.7203779, 2.27718, -0.201326, 0, 0, 0, 1, 1,
0.725456, -0.7843577, 2.00534, 0, 0, 0, 1, 1,
0.7256177, 0.5719258, 0.5917067, 1, 1, 1, 1, 1,
0.7444668, 0.05314654, 1.285674, 1, 1, 1, 1, 1,
0.7454343, 0.1592315, 1.357464, 1, 1, 1, 1, 1,
0.745676, -1.573594, 2.866209, 1, 1, 1, 1, 1,
0.7468644, 3.168133, 0.735516, 1, 1, 1, 1, 1,
0.7482262, 0.3691528, 0.7906088, 1, 1, 1, 1, 1,
0.7603468, 1.869204, 0.2274307, 1, 1, 1, 1, 1,
0.7738218, -1.303158, 2.74166, 1, 1, 1, 1, 1,
0.7762927, -1.151294, 4.393441, 1, 1, 1, 1, 1,
0.7796842, -0.3541254, 3.240791, 1, 1, 1, 1, 1,
0.7799945, 0.6602341, 0.4760203, 1, 1, 1, 1, 1,
0.7826207, 0.3500258, 2.967837, 1, 1, 1, 1, 1,
0.7838173, 0.0488346, 2.289576, 1, 1, 1, 1, 1,
0.7897969, 0.8111746, 1.604906, 1, 1, 1, 1, 1,
0.7912725, -0.06019986, 2.748429, 1, 1, 1, 1, 1,
0.7988425, -0.1502698, 2.174407, 0, 0, 1, 1, 1,
0.8032783, -1.14996, 1.387195, 1, 0, 0, 1, 1,
0.8055565, -1.006698, 0.9602145, 1, 0, 0, 1, 1,
0.8065845, 0.6682338, 0.4883199, 1, 0, 0, 1, 1,
0.8070693, 2.44679, 0.7404892, 1, 0, 0, 1, 1,
0.807332, 0.1810615, 0.4840276, 1, 0, 0, 1, 1,
0.8075833, -0.5796077, 2.580979, 0, 0, 0, 1, 1,
0.8085789, 0.6804433, 1.716123, 0, 0, 0, 1, 1,
0.8101831, -0.9798926, 2.72633, 0, 0, 0, 1, 1,
0.8106626, -1.714727, 2.629444, 0, 0, 0, 1, 1,
0.8144152, 0.5436164, -1.330328, 0, 0, 0, 1, 1,
0.8160157, 1.023531, -0.1213912, 0, 0, 0, 1, 1,
0.8172421, -2.014612, 2.600648, 0, 0, 0, 1, 1,
0.8176608, 1.015457, -0.0444019, 1, 1, 1, 1, 1,
0.819645, -0.3601033, 1.78688, 1, 1, 1, 1, 1,
0.8209199, 0.6836237, 1.708533, 1, 1, 1, 1, 1,
0.8227115, -0.5699953, 1.250584, 1, 1, 1, 1, 1,
0.8269562, -0.711382, 0.2356132, 1, 1, 1, 1, 1,
0.829623, 0.6874984, -0.2144656, 1, 1, 1, 1, 1,
0.8322079, 0.879392, -1.017354, 1, 1, 1, 1, 1,
0.833944, -0.9071835, 1.713856, 1, 1, 1, 1, 1,
0.8510396, -0.6953776, 2.21481, 1, 1, 1, 1, 1,
0.8513993, 0.8764287, 0.8341945, 1, 1, 1, 1, 1,
0.8525541, 1.142597, 0.1953047, 1, 1, 1, 1, 1,
0.8557422, -1.317594, 1.402104, 1, 1, 1, 1, 1,
0.8573021, -1.042765, 2.823073, 1, 1, 1, 1, 1,
0.8605798, -0.9135769, -0.5982099, 1, 1, 1, 1, 1,
0.8607196, 1.120479, 0.7377536, 1, 1, 1, 1, 1,
0.8608527, 0.1550905, 0.896815, 0, 0, 1, 1, 1,
0.8744091, -0.7818705, 2.788325, 1, 0, 0, 1, 1,
0.8750147, -0.3581401, 1.366065, 1, 0, 0, 1, 1,
0.8795565, -0.8141406, 3.348927, 1, 0, 0, 1, 1,
0.8921202, -1.696067, 3.52056, 1, 0, 0, 1, 1,
0.8981692, -0.4943722, 2.01822, 1, 0, 0, 1, 1,
0.9044902, 1.763071, -0.1747802, 0, 0, 0, 1, 1,
0.9069607, -0.4953246, 1.707995, 0, 0, 0, 1, 1,
0.9091267, 1.335327, 0.07508241, 0, 0, 0, 1, 1,
0.9148556, 0.779998, 1.580833, 0, 0, 0, 1, 1,
0.9186622, 0.5672423, 1.849225, 0, 0, 0, 1, 1,
0.9232556, -0.763393, 2.817956, 0, 0, 0, 1, 1,
0.9264062, 0.001368212, 3.00782, 0, 0, 0, 1, 1,
0.9371389, 0.1076302, 0.1358082, 1, 1, 1, 1, 1,
0.9384289, 0.7730729, 1.242982, 1, 1, 1, 1, 1,
0.9391563, 0.2205635, 0.5374552, 1, 1, 1, 1, 1,
0.9490935, -0.4026232, 1.695183, 1, 1, 1, 1, 1,
0.954605, -1.712587, 1.907957, 1, 1, 1, 1, 1,
0.9550653, 0.3672017, 1.706453, 1, 1, 1, 1, 1,
0.9594963, -1.712134, 1.879105, 1, 1, 1, 1, 1,
0.9607112, 1.698195, -0.4540684, 1, 1, 1, 1, 1,
0.9608382, 0.3726787, 0.2793027, 1, 1, 1, 1, 1,
0.9650682, 0.295075, 0.3010276, 1, 1, 1, 1, 1,
0.9687082, 0.5965385, 2.13512, 1, 1, 1, 1, 1,
0.9776264, 2.290966, 0.9621156, 1, 1, 1, 1, 1,
0.9793066, 0.2385033, 0.3288288, 1, 1, 1, 1, 1,
0.9832479, 0.9489523, 2.448632, 1, 1, 1, 1, 1,
0.9864292, -0.149969, 2.231769, 1, 1, 1, 1, 1,
0.9895351, 0.5100631, 3.392604, 0, 0, 1, 1, 1,
0.991407, -0.07256919, 1.687709, 1, 0, 0, 1, 1,
0.9964282, -0.6535381, 2.505041, 1, 0, 0, 1, 1,
0.9981096, -0.6123723, 1.281426, 1, 0, 0, 1, 1,
0.998911, -0.09710436, 1.091343, 1, 0, 0, 1, 1,
1.001988, 0.05420823, 0.4505339, 1, 0, 0, 1, 1,
1.002256, 0.7088282, -0.2289804, 0, 0, 0, 1, 1,
1.004241, 0.8949156, 1.481691, 0, 0, 0, 1, 1,
1.005057, -0.9139434, 1.423878, 0, 0, 0, 1, 1,
1.008977, 1.899317, 0.3590411, 0, 0, 0, 1, 1,
1.009776, 0.3774106, 0.2275241, 0, 0, 0, 1, 1,
1.010071, 1.317326, 3.459745, 0, 0, 0, 1, 1,
1.034758, -1.128614, 1.146206, 0, 0, 0, 1, 1,
1.037619, -1.983165, 3.456268, 1, 1, 1, 1, 1,
1.038951, -1.231964, 3.339108, 1, 1, 1, 1, 1,
1.047414, 0.5309332, 1.540548, 1, 1, 1, 1, 1,
1.047488, -0.9884552, 3.058764, 1, 1, 1, 1, 1,
1.054486, -0.6564218, 2.857775, 1, 1, 1, 1, 1,
1.061596, 0.1579269, 2.407355, 1, 1, 1, 1, 1,
1.062995, -0.1321477, 2.993424, 1, 1, 1, 1, 1,
1.06397, 1.501204, -0.04764564, 1, 1, 1, 1, 1,
1.066138, 1.435372, -0.551666, 1, 1, 1, 1, 1,
1.066248, -0.3100662, 1.645511, 1, 1, 1, 1, 1,
1.071452, 0.1245485, 2.849934, 1, 1, 1, 1, 1,
1.072202, -0.212497, 1.796242, 1, 1, 1, 1, 1,
1.076716, 0.1742022, 2.533796, 1, 1, 1, 1, 1,
1.077628, 0.1640698, 1.426207, 1, 1, 1, 1, 1,
1.07917, 0.7018117, 2.632959, 1, 1, 1, 1, 1,
1.080053, -0.6423421, 3.098585, 0, 0, 1, 1, 1,
1.082928, 0.1430535, 1.370599, 1, 0, 0, 1, 1,
1.08472, -0.3772134, 2.018472, 1, 0, 0, 1, 1,
1.087448, -0.4302995, 0.8879895, 1, 0, 0, 1, 1,
1.09183, 1.100079, -0.4033077, 1, 0, 0, 1, 1,
1.095318, 1.527279, 0.08985108, 1, 0, 0, 1, 1,
1.097911, 1.634002, -1.053874, 0, 0, 0, 1, 1,
1.098519, 0.7123514, 1.671271, 0, 0, 0, 1, 1,
1.119584, -0.4219807, 2.106746, 0, 0, 0, 1, 1,
1.127762, 0.8944923, 2.06831, 0, 0, 0, 1, 1,
1.129641, -0.4263661, 2.463204, 0, 0, 0, 1, 1,
1.156779, 0.5911672, 0.806659, 0, 0, 0, 1, 1,
1.157618, -0.1041108, 3.006815, 0, 0, 0, 1, 1,
1.158591, 0.5352585, 1.382542, 1, 1, 1, 1, 1,
1.160708, 2.074649, 0.2271793, 1, 1, 1, 1, 1,
1.161874, 0.622376, 2.916401, 1, 1, 1, 1, 1,
1.164494, 1.337151, 2.026079, 1, 1, 1, 1, 1,
1.167665, 0.8953542, -0.07340997, 1, 1, 1, 1, 1,
1.171985, -0.3064587, 1.455319, 1, 1, 1, 1, 1,
1.180027, 0.05853885, 0.8105635, 1, 1, 1, 1, 1,
1.187686, 1.10009, 1.570044, 1, 1, 1, 1, 1,
1.198699, -1.284762, 2.529317, 1, 1, 1, 1, 1,
1.199334, -0.3417487, 2.708679, 1, 1, 1, 1, 1,
1.206699, -0.7866616, 2.841282, 1, 1, 1, 1, 1,
1.208134, -2.073462, 2.881563, 1, 1, 1, 1, 1,
1.21007, 2.344471, -0.2825565, 1, 1, 1, 1, 1,
1.211092, -0.572243, 2.755933, 1, 1, 1, 1, 1,
1.211944, -0.1054546, 1.652667, 1, 1, 1, 1, 1,
1.213594, -0.1272905, 1.226333, 0, 0, 1, 1, 1,
1.217522, 0.036033, 1.632648, 1, 0, 0, 1, 1,
1.218899, 2.052368, 1.366898, 1, 0, 0, 1, 1,
1.230953, -1.165901, 4.283077, 1, 0, 0, 1, 1,
1.241396, 0.1329258, 1.365404, 1, 0, 0, 1, 1,
1.241615, -0.1976927, 4.175245, 1, 0, 0, 1, 1,
1.243201, 1.385961, 2.27362, 0, 0, 0, 1, 1,
1.246493, -0.5991195, 0.2636578, 0, 0, 0, 1, 1,
1.252814, -0.3004962, 1.169934, 0, 0, 0, 1, 1,
1.265168, -0.5506579, 3.058529, 0, 0, 0, 1, 1,
1.266914, -0.579236, 1.779429, 0, 0, 0, 1, 1,
1.270832, 0.00384937, -0.6030839, 0, 0, 0, 1, 1,
1.273858, 1.432096, 0.8763263, 0, 0, 0, 1, 1,
1.280335, -0.1943626, 1.263506, 1, 1, 1, 1, 1,
1.282734, -1.670616, 2.528391, 1, 1, 1, 1, 1,
1.284964, 0.2066575, 2.840117, 1, 1, 1, 1, 1,
1.287524, 3.520441, -1.993486, 1, 1, 1, 1, 1,
1.289293, -0.6301994, 2.724617, 1, 1, 1, 1, 1,
1.296569, -0.3834897, 1.508898, 1, 1, 1, 1, 1,
1.30267, 1.088694, 1.421824, 1, 1, 1, 1, 1,
1.305462, 0.8006353, 1.11052, 1, 1, 1, 1, 1,
1.313988, -0.3889383, 1.551284, 1, 1, 1, 1, 1,
1.330618, 0.196627, -0.0917344, 1, 1, 1, 1, 1,
1.334252, 0.4160816, 0.08485344, 1, 1, 1, 1, 1,
1.33499, -1.077701, 1.045233, 1, 1, 1, 1, 1,
1.335621, -0.7045643, 1.42663, 1, 1, 1, 1, 1,
1.355193, -0.03659853, 0.7373015, 1, 1, 1, 1, 1,
1.356053, -0.1031032, 0.2187016, 1, 1, 1, 1, 1,
1.361655, 0.6358338, 1.506583, 0, 0, 1, 1, 1,
1.362891, 1.256197, 1.124086, 1, 0, 0, 1, 1,
1.364602, 1.176307, 1.671632, 1, 0, 0, 1, 1,
1.376173, 0.4688215, 1.546674, 1, 0, 0, 1, 1,
1.377236, -1.551676, 2.469147, 1, 0, 0, 1, 1,
1.378144, 0.7931316, 1.143003, 1, 0, 0, 1, 1,
1.382217, 0.1371845, 1.551956, 0, 0, 0, 1, 1,
1.383674, -0.1710529, 0.9807092, 0, 0, 0, 1, 1,
1.385339, 1.014551, 1.387137, 0, 0, 0, 1, 1,
1.387283, 0.1577347, 1.303769, 0, 0, 0, 1, 1,
1.38878, -0.3282706, 0.2270551, 0, 0, 0, 1, 1,
1.398117, 1.245999, 0.9864102, 0, 0, 0, 1, 1,
1.400081, -0.417478, 3.220027, 0, 0, 0, 1, 1,
1.401668, 0.6387805, 2.792976, 1, 1, 1, 1, 1,
1.40332, -0.4551015, 0.5874303, 1, 1, 1, 1, 1,
1.412612, 1.996474, -0.372898, 1, 1, 1, 1, 1,
1.415341, -0.1513745, 2.391607, 1, 1, 1, 1, 1,
1.417323, -2.737001, 2.612473, 1, 1, 1, 1, 1,
1.418157, -0.08042651, 4.023036, 1, 1, 1, 1, 1,
1.423464, 0.9732875, 1.448465, 1, 1, 1, 1, 1,
1.432467, 0.116426, 0.9177259, 1, 1, 1, 1, 1,
1.451334, -1.108627, 2.132165, 1, 1, 1, 1, 1,
1.454124, 0.04675964, 3.234973, 1, 1, 1, 1, 1,
1.454917, -0.9183478, 2.072214, 1, 1, 1, 1, 1,
1.456206, -0.9165238, 1.638857, 1, 1, 1, 1, 1,
1.457267, 1.480541, -0.4882109, 1, 1, 1, 1, 1,
1.47064, -1.417039, 3.361337, 1, 1, 1, 1, 1,
1.488966, -0.1934502, 1.532065, 1, 1, 1, 1, 1,
1.492355, -1.066987, 2.166733, 0, 0, 1, 1, 1,
1.501661, 0.3074814, 1.001068, 1, 0, 0, 1, 1,
1.51989, 0.05742718, 0.827911, 1, 0, 0, 1, 1,
1.524419, -0.04310892, 1.141844, 1, 0, 0, 1, 1,
1.530205, 0.05167717, 3.725021, 1, 0, 0, 1, 1,
1.534534, 0.6959453, 0.5013345, 1, 0, 0, 1, 1,
1.535018, 0.1985495, -0.04247732, 0, 0, 0, 1, 1,
1.537799, -0.7069943, 3.124902, 0, 0, 0, 1, 1,
1.549705, -0.7976173, 1.233876, 0, 0, 0, 1, 1,
1.556701, -0.1100423, -0.3928299, 0, 0, 0, 1, 1,
1.559821, 0.09090501, 0.6830104, 0, 0, 0, 1, 1,
1.567109, 0.9232972, 2.382424, 0, 0, 0, 1, 1,
1.587725, 1.325823, 1.883087, 0, 0, 0, 1, 1,
1.598187, -0.06092509, 1.346737, 1, 1, 1, 1, 1,
1.601472, 0.6392091, 1.540734, 1, 1, 1, 1, 1,
1.612961, 0.718222, -0.3926243, 1, 1, 1, 1, 1,
1.623765, 0.3288806, 1.292225, 1, 1, 1, 1, 1,
1.628611, 1.30913, 1.648219, 1, 1, 1, 1, 1,
1.645081, -1.813491, 2.845475, 1, 1, 1, 1, 1,
1.649156, -2.078692, 1.4398, 1, 1, 1, 1, 1,
1.651371, -0.09419126, -0.4916824, 1, 1, 1, 1, 1,
1.671679, -0.6112992, 2.424986, 1, 1, 1, 1, 1,
1.701086, -0.7245677, 1.935177, 1, 1, 1, 1, 1,
1.706623, -1.112075, 2.368595, 1, 1, 1, 1, 1,
1.708232, 0.6445378, 1.127213, 1, 1, 1, 1, 1,
1.708879, -0.6484433, 1.419194, 1, 1, 1, 1, 1,
1.71323, 0.5396821, -0.274229, 1, 1, 1, 1, 1,
1.736207, 0.009082505, 0.9271736, 1, 1, 1, 1, 1,
1.738955, -2.058987, 2.67976, 0, 0, 1, 1, 1,
1.744594, 0.7052409, 1.631891, 1, 0, 0, 1, 1,
1.749419, -1.766368, 1.008019, 1, 0, 0, 1, 1,
1.755925, -0.7826571, 2.541588, 1, 0, 0, 1, 1,
1.767421, -0.4157951, 1.53219, 1, 0, 0, 1, 1,
1.773126, -0.7149545, 2.549654, 1, 0, 0, 1, 1,
1.784983, -0.4412051, 1.495399, 0, 0, 0, 1, 1,
1.801916, -0.1880087, 0.4620271, 0, 0, 0, 1, 1,
1.808562, -0.2339349, 1.662646, 0, 0, 0, 1, 1,
1.822151, 0.8066265, 0.7807174, 0, 0, 0, 1, 1,
1.822842, -1.552303, 1.329313, 0, 0, 0, 1, 1,
1.841966, 2.483514, 1.631648, 0, 0, 0, 1, 1,
1.844791, 0.9195104, -0.1340362, 0, 0, 0, 1, 1,
1.848553, -0.9241792, 2.808799, 1, 1, 1, 1, 1,
1.853292, 0.3978461, 1.391521, 1, 1, 1, 1, 1,
1.855005, 0.5214958, 3.677443, 1, 1, 1, 1, 1,
1.862348, -1.967052, 2.414753, 1, 1, 1, 1, 1,
1.910817, 1.866182, 1.278518, 1, 1, 1, 1, 1,
1.920341, -1.29037, 0.8083683, 1, 1, 1, 1, 1,
1.922032, 1.016033, 0.6212209, 1, 1, 1, 1, 1,
1.934841, -1.997534, 1.311699, 1, 1, 1, 1, 1,
1.94595, 0.5677879, 1.791712, 1, 1, 1, 1, 1,
1.978344, 0.01279982, 1.530526, 1, 1, 1, 1, 1,
1.991735, -0.600893, 2.378983, 1, 1, 1, 1, 1,
2.011108, 0.5633058, 2.948516, 1, 1, 1, 1, 1,
2.013142, -1.29821, 2.649867, 1, 1, 1, 1, 1,
2.020764, -0.09502758, 1.930758, 1, 1, 1, 1, 1,
2.073039, -1.569075, 2.511575, 1, 1, 1, 1, 1,
2.074178, 0.5754119, 1.9229, 0, 0, 1, 1, 1,
2.093421, -0.3620196, 2.180871, 1, 0, 0, 1, 1,
2.10012, 0.2318764, 1.495414, 1, 0, 0, 1, 1,
2.11167, 0.407767, 1.486515, 1, 0, 0, 1, 1,
2.14508, -0.8963929, 3.597764, 1, 0, 0, 1, 1,
2.158404, -0.6685191, 2.95524, 1, 0, 0, 1, 1,
2.187258, 0.1323897, 1.977273, 0, 0, 0, 1, 1,
2.196028, 0.698474, 2.07327, 0, 0, 0, 1, 1,
2.203445, 0.02822349, 2.120907, 0, 0, 0, 1, 1,
2.227271, 1.672045, 0.99806, 0, 0, 0, 1, 1,
2.280299, 1.370381, 1.851708, 0, 0, 0, 1, 1,
2.294581, 0.5214717, 1.235638, 0, 0, 0, 1, 1,
2.299086, -1.210973, 1.718741, 0, 0, 0, 1, 1,
2.506775, 0.5510088, 1.623342, 1, 1, 1, 1, 1,
2.603722, -0.2846217, 2.256437, 1, 1, 1, 1, 1,
2.678973, -0.2047761, 1.186356, 1, 1, 1, 1, 1,
2.708183, -0.6387081, 1.213497, 1, 1, 1, 1, 1,
2.7572, -0.2965927, 0.4200804, 1, 1, 1, 1, 1,
2.81924, -0.07292043, 1.823169, 1, 1, 1, 1, 1,
2.839939, 1.397852, -0.107954, 1, 1, 1, 1, 1
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
var radius = 9.913466;
var distance = 34.82063;
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
mvMatrix.translate( -0.08180475, -0.2791251, 0.3884506 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82063);
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
