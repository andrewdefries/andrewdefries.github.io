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
-2.765267, -2.894337, -1.15665, 1, 0, 0, 1,
-2.720776, 0.7585231, -2.53075, 1, 0.007843138, 0, 1,
-2.598371, -0.7312307, -1.813312, 1, 0.01176471, 0, 1,
-2.436733, -0.8081419, -2.705172, 1, 0.01960784, 0, 1,
-2.415359, -2.421255, -2.910982, 1, 0.02352941, 0, 1,
-2.337208, -0.910687, -3.23666, 1, 0.03137255, 0, 1,
-2.32435, 0.6637385, -2.02387, 1, 0.03529412, 0, 1,
-2.313908, 0.4345496, -0.289474, 1, 0.04313726, 0, 1,
-2.295824, -0.9486495, -2.45396, 1, 0.04705882, 0, 1,
-2.283222, -0.3431223, -2.171957, 1, 0.05490196, 0, 1,
-2.282116, 0.3705928, -0.227241, 1, 0.05882353, 0, 1,
-2.238386, -0.5378878, -1.732909, 1, 0.06666667, 0, 1,
-2.220026, -1.786713, -3.150303, 1, 0.07058824, 0, 1,
-2.184476, -0.6951013, -1.133539, 1, 0.07843138, 0, 1,
-2.126934, 1.049584, -1.182087, 1, 0.08235294, 0, 1,
-2.093264, -0.8779081, -4.334441, 1, 0.09019608, 0, 1,
-2.074122, -0.8718722, -1.827543, 1, 0.09411765, 0, 1,
-1.931384, -0.6466529, -2.37115, 1, 0.1019608, 0, 1,
-1.904827, 1.35914, 0.2940834, 1, 0.1098039, 0, 1,
-1.895658, -0.393939, -3.503564, 1, 0.1137255, 0, 1,
-1.88144, 0.968454, -1.275249, 1, 0.1215686, 0, 1,
-1.872581, 1.188639, -2.606555, 1, 0.1254902, 0, 1,
-1.86585, -0.6023591, -0.3939115, 1, 0.1333333, 0, 1,
-1.848157, 0.5754176, -2.351521, 1, 0.1372549, 0, 1,
-1.844657, -1.189209, -1.700439, 1, 0.145098, 0, 1,
-1.820185, -0.02630354, -0.7691341, 1, 0.1490196, 0, 1,
-1.818839, 0.8430126, -0.6155099, 1, 0.1568628, 0, 1,
-1.801631, 2.933226, 0.4963312, 1, 0.1607843, 0, 1,
-1.782526, -0.3962925, -0.4701038, 1, 0.1686275, 0, 1,
-1.759959, -0.4115241, -1.317902, 1, 0.172549, 0, 1,
-1.737541, 0.3571196, -1.918396, 1, 0.1803922, 0, 1,
-1.731446, 0.9179581, -1.28133, 1, 0.1843137, 0, 1,
-1.72964, 0.1289804, -1.316018, 1, 0.1921569, 0, 1,
-1.718773, -1.973931, -1.369101, 1, 0.1960784, 0, 1,
-1.684771, 2.913309, -0.4809741, 1, 0.2039216, 0, 1,
-1.684296, 0.709864, -0.3771839, 1, 0.2117647, 0, 1,
-1.676646, 0.9277244, -1.116549, 1, 0.2156863, 0, 1,
-1.631472, -1.113107, -1.253964, 1, 0.2235294, 0, 1,
-1.628652, -0.2683565, -2.040649, 1, 0.227451, 0, 1,
-1.627836, 0.2388771, -0.9353188, 1, 0.2352941, 0, 1,
-1.624619, 3.73546, -0.3147671, 1, 0.2392157, 0, 1,
-1.622923, 0.9219792, -0.1615474, 1, 0.2470588, 0, 1,
-1.620812, 1.638242, -2.009933, 1, 0.2509804, 0, 1,
-1.618842, 0.3317967, -1.947869, 1, 0.2588235, 0, 1,
-1.605162, 0.1986207, -2.09176, 1, 0.2627451, 0, 1,
-1.601337, 0.8145725, -1.820957, 1, 0.2705882, 0, 1,
-1.591954, 0.2590733, -2.312037, 1, 0.2745098, 0, 1,
-1.576631, -0.2663725, -3.821846, 1, 0.282353, 0, 1,
-1.56329, 0.8973566, -1.132525, 1, 0.2862745, 0, 1,
-1.55981, -0.0375576, -0.7270589, 1, 0.2941177, 0, 1,
-1.549195, 0.4806757, -1.697486, 1, 0.3019608, 0, 1,
-1.548277, -0.3952511, -1.317482, 1, 0.3058824, 0, 1,
-1.524288, -1.20875, -0.5277656, 1, 0.3137255, 0, 1,
-1.517819, 1.084702, -1.526749, 1, 0.3176471, 0, 1,
-1.51063, -2.077266, -2.097393, 1, 0.3254902, 0, 1,
-1.504573, 0.353011, -3.236046, 1, 0.3294118, 0, 1,
-1.501214, 0.1920711, -1.829052, 1, 0.3372549, 0, 1,
-1.49335, -0.6145825, -1.202129, 1, 0.3411765, 0, 1,
-1.491547, 0.5069282, -1.342971, 1, 0.3490196, 0, 1,
-1.483816, 0.5471687, -2.050851, 1, 0.3529412, 0, 1,
-1.446332, 0.5265679, -1.456762, 1, 0.3607843, 0, 1,
-1.44578, -0.5846459, -1.65178, 1, 0.3647059, 0, 1,
-1.418785, -0.8118345, -3.026311, 1, 0.372549, 0, 1,
-1.410793, -1.136656, -0.4108695, 1, 0.3764706, 0, 1,
-1.403601, 0.7603986, -1.819064, 1, 0.3843137, 0, 1,
-1.397182, 0.4191924, -1.525409, 1, 0.3882353, 0, 1,
-1.388364, 1.069182, -1.87974, 1, 0.3960784, 0, 1,
-1.388011, 1.584593, -0.2353816, 1, 0.4039216, 0, 1,
-1.387775, -0.2929958, -2.578386, 1, 0.4078431, 0, 1,
-1.361041, 0.65102, -1.010549, 1, 0.4156863, 0, 1,
-1.357169, -0.7207762, -0.4726519, 1, 0.4196078, 0, 1,
-1.346832, 0.1826103, 1.23206, 1, 0.427451, 0, 1,
-1.307898, 0.4921714, -1.878979, 1, 0.4313726, 0, 1,
-1.306583, 0.4385425, -3.294631, 1, 0.4392157, 0, 1,
-1.304769, -0.9259026, -2.216856, 1, 0.4431373, 0, 1,
-1.289853, 0.07299903, -3.00514, 1, 0.4509804, 0, 1,
-1.283426, 0.004754094, -1.392234, 1, 0.454902, 0, 1,
-1.278048, 0.8728111, -1.887473, 1, 0.4627451, 0, 1,
-1.26794, 0.3907102, -1.374516, 1, 0.4666667, 0, 1,
-1.261375, 1.188527, -1.351321, 1, 0.4745098, 0, 1,
-1.260953, 0.3830972, -0.728923, 1, 0.4784314, 0, 1,
-1.257926, -1.344185, -2.496442, 1, 0.4862745, 0, 1,
-1.257036, 1.404768, -0.8293856, 1, 0.4901961, 0, 1,
-1.25591, 0.03507316, -0.6717839, 1, 0.4980392, 0, 1,
-1.244602, 0.03093175, -0.8853683, 1, 0.5058824, 0, 1,
-1.239457, 0.6824555, -0.2860943, 1, 0.509804, 0, 1,
-1.238643, 1.297328, -1.560475, 1, 0.5176471, 0, 1,
-1.238639, 0.9932615, -1.205927, 1, 0.5215687, 0, 1,
-1.234135, -0.6579337, -1.439341, 1, 0.5294118, 0, 1,
-1.226297, -1.666457, -2.403478, 1, 0.5333334, 0, 1,
-1.223781, 0.4791718, -0.8377178, 1, 0.5411765, 0, 1,
-1.221032, -0.6696534, -2.161169, 1, 0.5450981, 0, 1,
-1.219154, -0.800636, -4.439969, 1, 0.5529412, 0, 1,
-1.206682, -0.4904638, -4.372715, 1, 0.5568628, 0, 1,
-1.197122, 0.875659, -2.597091, 1, 0.5647059, 0, 1,
-1.195817, 1.702114, -1.267419, 1, 0.5686275, 0, 1,
-1.194925, 0.9185108, -1.640741, 1, 0.5764706, 0, 1,
-1.193757, -0.02238116, -0.6864005, 1, 0.5803922, 0, 1,
-1.189748, -0.1158159, -2.53199, 1, 0.5882353, 0, 1,
-1.18506, 1.019008, -1.88229, 1, 0.5921569, 0, 1,
-1.17822, -0.1048831, 0.05631449, 1, 0.6, 0, 1,
-1.176871, -0.1542076, -1.603295, 1, 0.6078432, 0, 1,
-1.175744, 0.3091886, -3.46525, 1, 0.6117647, 0, 1,
-1.172421, -0.1729634, -2.994835, 1, 0.6196079, 0, 1,
-1.171913, 0.9061657, -2.532854, 1, 0.6235294, 0, 1,
-1.170293, -0.7906317, -2.171314, 1, 0.6313726, 0, 1,
-1.168433, 0.450063, -1.565061, 1, 0.6352941, 0, 1,
-1.166387, 0.7701764, -2.542027, 1, 0.6431373, 0, 1,
-1.164404, -1.589893, -1.705541, 1, 0.6470588, 0, 1,
-1.163607, 0.9472148, -1.700889, 1, 0.654902, 0, 1,
-1.162492, -0.1574868, -1.958709, 1, 0.6588235, 0, 1,
-1.160568, 0.1193265, -1.653223, 1, 0.6666667, 0, 1,
-1.160556, 2.729869, -0.0375342, 1, 0.6705883, 0, 1,
-1.157871, -0.5884677, -1.212875, 1, 0.6784314, 0, 1,
-1.144766, -0.3688404, -2.446332, 1, 0.682353, 0, 1,
-1.135316, 0.5148576, -0.9923742, 1, 0.6901961, 0, 1,
-1.134503, 0.8729157, -0.4215818, 1, 0.6941177, 0, 1,
-1.122764, 0.5345882, -2.095514, 1, 0.7019608, 0, 1,
-1.119732, 1.553512, -1.633501, 1, 0.7098039, 0, 1,
-1.109892, -1.220681, -2.495895, 1, 0.7137255, 0, 1,
-1.108428, -2.009079, -2.630468, 1, 0.7215686, 0, 1,
-1.103962, -0.381466, -4.235084, 1, 0.7254902, 0, 1,
-1.100468, -0.2304947, -0.5137805, 1, 0.7333333, 0, 1,
-1.099714, 0.4025273, -2.286478, 1, 0.7372549, 0, 1,
-1.098906, 1.112575, -1.047373, 1, 0.7450981, 0, 1,
-1.098382, 0.7142853, -1.075548, 1, 0.7490196, 0, 1,
-1.097743, -0.7400077, -0.2124628, 1, 0.7568628, 0, 1,
-1.093538, -0.02683497, -1.410943, 1, 0.7607843, 0, 1,
-1.090822, -0.3164825, -2.517772, 1, 0.7686275, 0, 1,
-1.084962, -2.868451, -3.838106, 1, 0.772549, 0, 1,
-1.078049, -1.291605, -1.022619, 1, 0.7803922, 0, 1,
-1.069258, 0.1507961, -1.187131, 1, 0.7843137, 0, 1,
-1.065705, 1.868697, -0.6622484, 1, 0.7921569, 0, 1,
-1.057453, -0.7748733, -2.807306, 1, 0.7960784, 0, 1,
-1.051129, -1.491841, -3.876019, 1, 0.8039216, 0, 1,
-1.049078, -0.8334135, -3.002985, 1, 0.8117647, 0, 1,
-1.04621, -0.6411102, -2.332775, 1, 0.8156863, 0, 1,
-1.043616, 0.2084617, -2.325294, 1, 0.8235294, 0, 1,
-1.040376, 0.1505281, -1.378509, 1, 0.827451, 0, 1,
-1.036476, -1.054552, -2.807405, 1, 0.8352941, 0, 1,
-1.02951, -1.630847, -2.946067, 1, 0.8392157, 0, 1,
-1.029339, -0.2988577, -2.22076, 1, 0.8470588, 0, 1,
-1.028268, -1.47171, -0.6718188, 1, 0.8509804, 0, 1,
-1.028066, -1.307012, -2.858347, 1, 0.8588235, 0, 1,
-1.023162, 1.060517, -1.466867, 1, 0.8627451, 0, 1,
-1.021844, -2.31197, -2.26867, 1, 0.8705882, 0, 1,
-1.02014, -1.229468, -2.529826, 1, 0.8745098, 0, 1,
-1.017227, 0.6959333, 0.07766839, 1, 0.8823529, 0, 1,
-1.014851, -1.319709, -3.562767, 1, 0.8862745, 0, 1,
-1.013077, -0.760711, -3.380096, 1, 0.8941177, 0, 1,
-1.010498, 0.4617366, -0.7168015, 1, 0.8980392, 0, 1,
-1.009326, 1.261487, -0.27899, 1, 0.9058824, 0, 1,
-1.002808, 0.8192744, -0.08253268, 1, 0.9137255, 0, 1,
-0.9951456, 0.4428725, -0.2882027, 1, 0.9176471, 0, 1,
-0.9905713, 0.5099331, -0.01747686, 1, 0.9254902, 0, 1,
-0.979039, -0.1354067, -1.699792, 1, 0.9294118, 0, 1,
-0.9777207, -0.7598729, -2.159277, 1, 0.9372549, 0, 1,
-0.9728149, -0.8561701, -1.439413, 1, 0.9411765, 0, 1,
-0.9673317, -1.363533, -3.395397, 1, 0.9490196, 0, 1,
-0.9603519, 0.4757071, 0.6850121, 1, 0.9529412, 0, 1,
-0.9592993, -1.358192, -4.162644, 1, 0.9607843, 0, 1,
-0.9576896, 0.3127424, -0.124137, 1, 0.9647059, 0, 1,
-0.9571998, 0.1016074, -1.960065, 1, 0.972549, 0, 1,
-0.9543033, -1.544245, -3.531785, 1, 0.9764706, 0, 1,
-0.9487109, 0.2660714, -0.03736096, 1, 0.9843137, 0, 1,
-0.9481457, -0.3920258, -1.389425, 1, 0.9882353, 0, 1,
-0.9427884, 0.3271839, -1.981993, 1, 0.9960784, 0, 1,
-0.9285257, -0.3611276, -1.725737, 0.9960784, 1, 0, 1,
-0.9237041, 1.345769, 0.5661966, 0.9921569, 1, 0, 1,
-0.9234935, 1.757364, 0.5603188, 0.9843137, 1, 0, 1,
-0.923267, -0.8572153, -1.631727, 0.9803922, 1, 0, 1,
-0.9211485, 1.221407, -0.4778831, 0.972549, 1, 0, 1,
-0.9201709, 1.656708, -1.078861, 0.9686275, 1, 0, 1,
-0.9080425, 0.06385011, -1.44798, 0.9607843, 1, 0, 1,
-0.9048305, 1.01253, -0.4850034, 0.9568627, 1, 0, 1,
-0.9004765, -1.062572, -2.212849, 0.9490196, 1, 0, 1,
-0.8983648, 0.5692254, 0.2359323, 0.945098, 1, 0, 1,
-0.8911775, -0.2031633, -1.640219, 0.9372549, 1, 0, 1,
-0.8888118, -0.4577574, -1.481912, 0.9333333, 1, 0, 1,
-0.8887447, -1.226018, -3.786295, 0.9254902, 1, 0, 1,
-0.8874509, 0.110373, -1.20516, 0.9215686, 1, 0, 1,
-0.8873081, -0.1689491, -0.4062131, 0.9137255, 1, 0, 1,
-0.8863217, -0.6254402, -3.672561, 0.9098039, 1, 0, 1,
-0.8851943, -1.271186, -2.691557, 0.9019608, 1, 0, 1,
-0.8847434, 0.5110214, -0.2373102, 0.8941177, 1, 0, 1,
-0.883705, -1.275773, -4.630083, 0.8901961, 1, 0, 1,
-0.8819175, 0.1413279, -2.340487, 0.8823529, 1, 0, 1,
-0.8725737, -0.433165, -0.7577636, 0.8784314, 1, 0, 1,
-0.8721108, -1.022553, -1.467059, 0.8705882, 1, 0, 1,
-0.8711178, 0.1198558, -0.3705793, 0.8666667, 1, 0, 1,
-0.8682656, 0.004741685, -1.261236, 0.8588235, 1, 0, 1,
-0.8681344, -0.771058, -1.500515, 0.854902, 1, 0, 1,
-0.8622385, -0.127396, 0.1123948, 0.8470588, 1, 0, 1,
-0.8555424, -0.8995807, -2.460347, 0.8431373, 1, 0, 1,
-0.8543752, -0.2594815, -1.049109, 0.8352941, 1, 0, 1,
-0.8455499, -0.9456104, -2.645113, 0.8313726, 1, 0, 1,
-0.8432299, 1.092682, -1.090634, 0.8235294, 1, 0, 1,
-0.8418048, -1.508652, -1.172724, 0.8196079, 1, 0, 1,
-0.8410898, -1.300281, -0.5343593, 0.8117647, 1, 0, 1,
-0.8337274, 0.4079187, -0.3399453, 0.8078431, 1, 0, 1,
-0.8315468, -0.04711413, -0.9964417, 0.8, 1, 0, 1,
-0.8291214, -0.6377103, -2.635226, 0.7921569, 1, 0, 1,
-0.8276722, -0.5621856, -2.726139, 0.7882353, 1, 0, 1,
-0.8258561, 0.8298065, -1.97776, 0.7803922, 1, 0, 1,
-0.8250265, 0.4074469, -1.040443, 0.7764706, 1, 0, 1,
-0.8100249, -1.343372, -3.331276, 0.7686275, 1, 0, 1,
-0.8079143, 0.890233, 0.0992163, 0.7647059, 1, 0, 1,
-0.8035436, -0.8604812, -2.962239, 0.7568628, 1, 0, 1,
-0.8033904, 0.2342682, -3.056942, 0.7529412, 1, 0, 1,
-0.8000247, 1.336399, 0.3271843, 0.7450981, 1, 0, 1,
-0.7934433, -0.04568341, -3.49982, 0.7411765, 1, 0, 1,
-0.7897077, -1.667838, -2.954715, 0.7333333, 1, 0, 1,
-0.7858425, -0.6439382, -2.041662, 0.7294118, 1, 0, 1,
-0.7804639, 0.01067068, -1.663231, 0.7215686, 1, 0, 1,
-0.7770464, 0.3886769, 0.1587599, 0.7176471, 1, 0, 1,
-0.7719071, 1.396224, 0.05645612, 0.7098039, 1, 0, 1,
-0.7694811, -1.80334, -2.179723, 0.7058824, 1, 0, 1,
-0.7691734, 1.064688, 0.4695873, 0.6980392, 1, 0, 1,
-0.7659065, 1.577752, -0.9077384, 0.6901961, 1, 0, 1,
-0.7639452, 1.085393, 1.166188, 0.6862745, 1, 0, 1,
-0.7633492, -0.3934181, -2.397185, 0.6784314, 1, 0, 1,
-0.7628458, -1.399613, -3.368753, 0.6745098, 1, 0, 1,
-0.7613976, -0.5016579, -2.72183, 0.6666667, 1, 0, 1,
-0.7563668, -0.3785458, -2.847927, 0.6627451, 1, 0, 1,
-0.7524272, -1.048015, -0.9349349, 0.654902, 1, 0, 1,
-0.7512449, 0.7865244, 0.1986344, 0.6509804, 1, 0, 1,
-0.7414408, -1.622467, -2.112729, 0.6431373, 1, 0, 1,
-0.7395661, -0.9637171, -3.387836, 0.6392157, 1, 0, 1,
-0.7374874, 1.087768, 1.69851, 0.6313726, 1, 0, 1,
-0.7369036, 1.121688, -0.9552945, 0.627451, 1, 0, 1,
-0.7052172, -0.6375172, -2.390064, 0.6196079, 1, 0, 1,
-0.7009701, 0.5847773, -0.8482338, 0.6156863, 1, 0, 1,
-0.6980276, -0.02247027, -1.539879, 0.6078432, 1, 0, 1,
-0.6970419, -0.9944525, -2.673969, 0.6039216, 1, 0, 1,
-0.6958101, 1.462976, 0.6147707, 0.5960785, 1, 0, 1,
-0.6902539, -1.806411, -2.686236, 0.5882353, 1, 0, 1,
-0.6888762, -1.017429, -2.878154, 0.5843138, 1, 0, 1,
-0.6881006, -1.831583, -1.419659, 0.5764706, 1, 0, 1,
-0.6839862, -1.241352, -0.6065203, 0.572549, 1, 0, 1,
-0.6817222, -0.02230031, -2.945985, 0.5647059, 1, 0, 1,
-0.6797488, -0.4216205, -2.506373, 0.5607843, 1, 0, 1,
-0.6712309, 1.131974, -0.9932387, 0.5529412, 1, 0, 1,
-0.6647563, -0.480038, -0.3306838, 0.5490196, 1, 0, 1,
-0.6633092, 0.259882, -3.334371, 0.5411765, 1, 0, 1,
-0.6623771, 1.028798, -1.000857, 0.5372549, 1, 0, 1,
-0.6545365, 0.5789331, -0.9303138, 0.5294118, 1, 0, 1,
-0.6489812, 0.0653609, -1.073297, 0.5254902, 1, 0, 1,
-0.6488645, 1.303436, -0.6009545, 0.5176471, 1, 0, 1,
-0.6456546, -0.07621662, -1.056073, 0.5137255, 1, 0, 1,
-0.6424266, 0.3410391, -0.4206658, 0.5058824, 1, 0, 1,
-0.6417113, -1.334194, -0.8848738, 0.5019608, 1, 0, 1,
-0.6394905, -0.03538001, -2.413323, 0.4941176, 1, 0, 1,
-0.6339915, -1.953029, -2.85497, 0.4862745, 1, 0, 1,
-0.6329195, -1.637471, -2.314039, 0.4823529, 1, 0, 1,
-0.6320048, 1.714272, 0.1508815, 0.4745098, 1, 0, 1,
-0.6288397, -1.688282, -4.748849, 0.4705882, 1, 0, 1,
-0.6266246, 0.8433071, -0.3666032, 0.4627451, 1, 0, 1,
-0.6260589, -0.7832515, -2.689272, 0.4588235, 1, 0, 1,
-0.6245074, -1.029204, -1.349448, 0.4509804, 1, 0, 1,
-0.6184453, 0.8912607, -0.7749215, 0.4470588, 1, 0, 1,
-0.6181188, -0.589854, -2.332294, 0.4392157, 1, 0, 1,
-0.6084101, -2.483655, -2.359675, 0.4352941, 1, 0, 1,
-0.6072698, 0.9863953, -0.3039649, 0.427451, 1, 0, 1,
-0.6062113, 1.845362, -1.212071, 0.4235294, 1, 0, 1,
-0.6058029, -0.03188371, -1.630643, 0.4156863, 1, 0, 1,
-0.5962849, 1.056932, -0.02930839, 0.4117647, 1, 0, 1,
-0.5961592, -0.9023328, -0.9961956, 0.4039216, 1, 0, 1,
-0.595735, -1.265139, -4.160865, 0.3960784, 1, 0, 1,
-0.5886523, -2.44691, -4.871836, 0.3921569, 1, 0, 1,
-0.5873197, -1.474327, -3.649296, 0.3843137, 1, 0, 1,
-0.580546, 0.6264176, -2.041167, 0.3803922, 1, 0, 1,
-0.5779027, -0.02833547, -1.958944, 0.372549, 1, 0, 1,
-0.5749046, -0.6571213, -3.386639, 0.3686275, 1, 0, 1,
-0.5648735, 1.080829, -0.3503943, 0.3607843, 1, 0, 1,
-0.561834, -0.6331387, -2.985145, 0.3568628, 1, 0, 1,
-0.5586885, -0.2066027, -4.007489, 0.3490196, 1, 0, 1,
-0.5541896, 0.965279, 0.6860247, 0.345098, 1, 0, 1,
-0.5532505, 0.3033846, -0.6874825, 0.3372549, 1, 0, 1,
-0.5523011, -0.9099856, -3.075473, 0.3333333, 1, 0, 1,
-0.5520985, -2.002662, -3.698992, 0.3254902, 1, 0, 1,
-0.5482013, 0.5265577, -1.590148, 0.3215686, 1, 0, 1,
-0.542963, 1.257091, 0.2925503, 0.3137255, 1, 0, 1,
-0.5405063, -0.9272974, -1.604189, 0.3098039, 1, 0, 1,
-0.5393482, 1.286139, 1.242261, 0.3019608, 1, 0, 1,
-0.5390708, -0.5232548, -2.620007, 0.2941177, 1, 0, 1,
-0.5390171, 1.570836, -0.497616, 0.2901961, 1, 0, 1,
-0.5387237, 1.143303, 0.6534046, 0.282353, 1, 0, 1,
-0.5362502, -0.605573, -3.10989, 0.2784314, 1, 0, 1,
-0.5337325, 0.8018396, -0.01898763, 0.2705882, 1, 0, 1,
-0.5293248, -0.01075938, -1.580664, 0.2666667, 1, 0, 1,
-0.5280409, 1.474969, 0.4997814, 0.2588235, 1, 0, 1,
-0.527235, -0.3893303, -2.834358, 0.254902, 1, 0, 1,
-0.5234167, 1.420745, -0.8481112, 0.2470588, 1, 0, 1,
-0.5224752, 0.570309, -1.283448, 0.2431373, 1, 0, 1,
-0.5209349, 0.5226023, -0.898769, 0.2352941, 1, 0, 1,
-0.5183948, 1.602377, 0.6661659, 0.2313726, 1, 0, 1,
-0.5176774, -0.1556794, -1.971193, 0.2235294, 1, 0, 1,
-0.517563, 0.6137835, 0.8897732, 0.2196078, 1, 0, 1,
-0.5131868, 1.259078, -1.295774, 0.2117647, 1, 0, 1,
-0.5124831, -0.2530538, -2.381628, 0.2078431, 1, 0, 1,
-0.5105979, 1.472296, -0.4984995, 0.2, 1, 0, 1,
-0.5103711, 0.8480608, 0.2422698, 0.1921569, 1, 0, 1,
-0.5060959, -0.8010183, -1.977072, 0.1882353, 1, 0, 1,
-0.4992728, 1.020704, -1.472071, 0.1803922, 1, 0, 1,
-0.4988296, 0.3752573, 0.8035541, 0.1764706, 1, 0, 1,
-0.4975873, 1.167122, 0.6766933, 0.1686275, 1, 0, 1,
-0.4964393, 0.7746922, -0.1804285, 0.1647059, 1, 0, 1,
-0.4910424, 0.1625502, -1.568109, 0.1568628, 1, 0, 1,
-0.4895562, -1.488899, -5.221259, 0.1529412, 1, 0, 1,
-0.4874604, -1.556543, -2.312564, 0.145098, 1, 0, 1,
-0.4846388, -0.7734413, -2.923055, 0.1411765, 1, 0, 1,
-0.483549, -0.114326, -0.1608464, 0.1333333, 1, 0, 1,
-0.4807791, 0.231005, -1.735405, 0.1294118, 1, 0, 1,
-0.4790787, 0.5949907, 0.3845955, 0.1215686, 1, 0, 1,
-0.4774106, -1.311543, -2.881958, 0.1176471, 1, 0, 1,
-0.474583, -1.110505, -1.174605, 0.1098039, 1, 0, 1,
-0.4742473, -0.1370938, -2.872613, 0.1058824, 1, 0, 1,
-0.4739275, -0.4208986, -3.03719, 0.09803922, 1, 0, 1,
-0.4730527, -0.5768223, -1.902473, 0.09019608, 1, 0, 1,
-0.4718136, 0.4801191, -0.6436644, 0.08627451, 1, 0, 1,
-0.4715572, 0.02933499, -0.300898, 0.07843138, 1, 0, 1,
-0.4707945, 1.009781, -2.098879, 0.07450981, 1, 0, 1,
-0.4694784, 0.5037403, -0.9189708, 0.06666667, 1, 0, 1,
-0.4651359, -0.3923273, -2.156702, 0.0627451, 1, 0, 1,
-0.4614405, -2.55883, -3.211732, 0.05490196, 1, 0, 1,
-0.4595991, -0.9913898, -1.11394, 0.05098039, 1, 0, 1,
-0.4551118, -0.4602337, -2.626188, 0.04313726, 1, 0, 1,
-0.4545367, 0.0005173032, -2.601405, 0.03921569, 1, 0, 1,
-0.4527577, 1.214346, 0.7539127, 0.03137255, 1, 0, 1,
-0.4513767, -0.297493, -3.124637, 0.02745098, 1, 0, 1,
-0.4480259, 1.924821, 0.1504052, 0.01960784, 1, 0, 1,
-0.4479153, -0.5145951, -3.9823, 0.01568628, 1, 0, 1,
-0.4442443, 0.9006518, 0.2455733, 0.007843138, 1, 0, 1,
-0.4438571, 0.3763348, -2.22006, 0.003921569, 1, 0, 1,
-0.4428323, 0.5915742, -1.570919, 0, 1, 0.003921569, 1,
-0.4423395, 1.345267, -1.39759, 0, 1, 0.01176471, 1,
-0.437051, -1.39424, -3.996432, 0, 1, 0.01568628, 1,
-0.4250336, -0.5420033, -1.481979, 0, 1, 0.02352941, 1,
-0.4241504, -1.40621, -4.609034, 0, 1, 0.02745098, 1,
-0.42254, 1.16264, -0.6782808, 0, 1, 0.03529412, 1,
-0.4224739, 0.6238163, -0.2435842, 0, 1, 0.03921569, 1,
-0.4212559, -0.7109876, -2.039755, 0, 1, 0.04705882, 1,
-0.4198385, 0.9126403, -0.8147987, 0, 1, 0.05098039, 1,
-0.4178502, -2.381697, -0.6123177, 0, 1, 0.05882353, 1,
-0.4166379, 0.1969663, -1.057857, 0, 1, 0.0627451, 1,
-0.4107611, 0.6835451, -0.5841306, 0, 1, 0.07058824, 1,
-0.4099476, 1.215669, 0.2797323, 0, 1, 0.07450981, 1,
-0.4084297, 0.6672528, 1.463636, 0, 1, 0.08235294, 1,
-0.4030524, 0.7321557, -1.127444, 0, 1, 0.08627451, 1,
-0.401492, -2.259938, -3.576724, 0, 1, 0.09411765, 1,
-0.3991751, -0.4568864, -3.249724, 0, 1, 0.1019608, 1,
-0.3982212, -0.6594586, -5.093872, 0, 1, 0.1058824, 1,
-0.3968845, -0.3687786, -3.042234, 0, 1, 0.1137255, 1,
-0.3954186, 1.059001, -0.572379, 0, 1, 0.1176471, 1,
-0.3911919, -0.5637065, -2.660118, 0, 1, 0.1254902, 1,
-0.3907083, -0.9804111, -4.60445, 0, 1, 0.1294118, 1,
-0.385368, -0.4356252, -3.05428, 0, 1, 0.1372549, 1,
-0.3823603, -0.8835006, -1.914, 0, 1, 0.1411765, 1,
-0.3791236, -1.00279, -3.814095, 0, 1, 0.1490196, 1,
-0.3787833, 0.09326655, -3.327943, 0, 1, 0.1529412, 1,
-0.3640317, 0.6897357, 0.04554946, 0, 1, 0.1607843, 1,
-0.3600427, 0.9308293, -0.371837, 0, 1, 0.1647059, 1,
-0.3596861, -0.884675, -2.257486, 0, 1, 0.172549, 1,
-0.3582487, -0.05868426, -2.043832, 0, 1, 0.1764706, 1,
-0.3549054, -0.4508078, -3.516098, 0, 1, 0.1843137, 1,
-0.3542404, 2.203458, 0.6828969, 0, 1, 0.1882353, 1,
-0.3479802, 0.8462303, -1.325741, 0, 1, 0.1960784, 1,
-0.3448579, -0.5161101, -2.635074, 0, 1, 0.2039216, 1,
-0.3423634, 0.6356205, 0.5030695, 0, 1, 0.2078431, 1,
-0.3406625, 0.2618159, -2.463384, 0, 1, 0.2156863, 1,
-0.3386759, -1.289123, -2.391987, 0, 1, 0.2196078, 1,
-0.3225205, 0.9914168, -1.919421, 0, 1, 0.227451, 1,
-0.3178363, -1.057157, -4.600063, 0, 1, 0.2313726, 1,
-0.3159068, 0.9347072, 1.703653, 0, 1, 0.2392157, 1,
-0.3150512, 1.689979, 0.6111397, 0, 1, 0.2431373, 1,
-0.3149606, 0.7247965, -2.203853, 0, 1, 0.2509804, 1,
-0.3061344, -1.076477, -0.901734, 0, 1, 0.254902, 1,
-0.3042522, -0.4448706, -0.7938408, 0, 1, 0.2627451, 1,
-0.2996041, -1.091006, -4.248129, 0, 1, 0.2666667, 1,
-0.2953362, 0.4555377, -1.531759, 0, 1, 0.2745098, 1,
-0.2927446, -0.4617867, -2.275852, 0, 1, 0.2784314, 1,
-0.2905571, -0.06871498, -2.895733, 0, 1, 0.2862745, 1,
-0.2898687, -0.3488681, -2.886109, 0, 1, 0.2901961, 1,
-0.2883737, 1.564337, -1.09669, 0, 1, 0.2980392, 1,
-0.2868621, 0.2708658, -1.399182, 0, 1, 0.3058824, 1,
-0.2866164, -0.6701207, -2.670528, 0, 1, 0.3098039, 1,
-0.284896, 0.02804097, -3.733555, 0, 1, 0.3176471, 1,
-0.2790771, 1.757594, -0.5402628, 0, 1, 0.3215686, 1,
-0.2780848, 0.7087561, -0.3463388, 0, 1, 0.3294118, 1,
-0.273059, 0.2256498, 1.466494, 0, 1, 0.3333333, 1,
-0.2729185, 1.401646, -0.8905164, 0, 1, 0.3411765, 1,
-0.2725691, 0.8657558, 1.75517, 0, 1, 0.345098, 1,
-0.2708691, -0.7208399, -3.737065, 0, 1, 0.3529412, 1,
-0.2646339, 0.239861, 0.838537, 0, 1, 0.3568628, 1,
-0.2631605, -1.268098, -3.536585, 0, 1, 0.3647059, 1,
-0.262791, -1.570287, -1.400535, 0, 1, 0.3686275, 1,
-0.2615992, 0.8332123, 1.077834, 0, 1, 0.3764706, 1,
-0.257233, 0.5561754, -0.7128928, 0, 1, 0.3803922, 1,
-0.2569937, -2.251263, -4.314304, 0, 1, 0.3882353, 1,
-0.2557791, -1.207194, -1.9312, 0, 1, 0.3921569, 1,
-0.2490016, -0.8005616, -3.440095, 0, 1, 0.4, 1,
-0.248555, 1.37859, 0.08157446, 0, 1, 0.4078431, 1,
-0.2467651, 1.337103, -0.5052917, 0, 1, 0.4117647, 1,
-0.2466299, 0.7966174, -0.493825, 0, 1, 0.4196078, 1,
-0.2410516, -0.7889176, -4.994709, 0, 1, 0.4235294, 1,
-0.241018, -1.696323, -3.222262, 0, 1, 0.4313726, 1,
-0.24093, -0.900487, -2.495712, 0, 1, 0.4352941, 1,
-0.2383229, -0.2440963, -2.945505, 0, 1, 0.4431373, 1,
-0.235561, 2.033682, -0.5558588, 0, 1, 0.4470588, 1,
-0.219462, 0.04374347, -0.5582298, 0, 1, 0.454902, 1,
-0.2173838, 1.129128, 0.04612374, 0, 1, 0.4588235, 1,
-0.2140795, -0.05862966, -2.605102, 0, 1, 0.4666667, 1,
-0.2066914, -0.9190262, -2.30695, 0, 1, 0.4705882, 1,
-0.2019065, 1.029875, -0.5896703, 0, 1, 0.4784314, 1,
-0.201817, -0.8700097, -2.406457, 0, 1, 0.4823529, 1,
-0.1991513, -0.925759, -2.361186, 0, 1, 0.4901961, 1,
-0.1975728, -0.3009097, -4.338725, 0, 1, 0.4941176, 1,
-0.1972557, -0.5790799, -1.903195, 0, 1, 0.5019608, 1,
-0.192972, -0.693528, -2.834565, 0, 1, 0.509804, 1,
-0.1913091, 0.0149666, -2.924441, 0, 1, 0.5137255, 1,
-0.1897397, 1.000021, -1.521629, 0, 1, 0.5215687, 1,
-0.1895806, 0.4776369, -1.459361, 0, 1, 0.5254902, 1,
-0.1890989, -1.060086, -3.129109, 0, 1, 0.5333334, 1,
-0.1878055, 0.4574255, -0.3066449, 0, 1, 0.5372549, 1,
-0.185463, 1.47267, 0.7877243, 0, 1, 0.5450981, 1,
-0.1837823, -0.6706334, -3.179058, 0, 1, 0.5490196, 1,
-0.1835608, 0.2106548, -2.322188, 0, 1, 0.5568628, 1,
-0.1814943, 1.62144, 0.3393084, 0, 1, 0.5607843, 1,
-0.1732911, -1.201181, -2.614209, 0, 1, 0.5686275, 1,
-0.1725394, -0.8777499, -3.030231, 0, 1, 0.572549, 1,
-0.1720127, 0.8182392, 0.110699, 0, 1, 0.5803922, 1,
-0.1669307, -0.3395893, -2.925525, 0, 1, 0.5843138, 1,
-0.1667209, 1.115191, 0.9535567, 0, 1, 0.5921569, 1,
-0.1631225, 1.601332, 0.6823034, 0, 1, 0.5960785, 1,
-0.1623845, -0.6512847, -3.601382, 0, 1, 0.6039216, 1,
-0.1596985, 1.015182, -1.202941, 0, 1, 0.6117647, 1,
-0.157814, 1.237921, 1.731054, 0, 1, 0.6156863, 1,
-0.1521425, 0.6969157, -2.375735, 0, 1, 0.6235294, 1,
-0.1476558, 1.870714, -1.741006, 0, 1, 0.627451, 1,
-0.1413156, 0.1207333, 1.189219, 0, 1, 0.6352941, 1,
-0.1380095, 0.4568576, -0.884827, 0, 1, 0.6392157, 1,
-0.1292733, 0.5517528, 1.302203, 0, 1, 0.6470588, 1,
-0.1284262, 0.6905649, -0.1631266, 0, 1, 0.6509804, 1,
-0.128199, 0.8894253, -1.318364, 0, 1, 0.6588235, 1,
-0.128038, 0.8849077, 0.6188121, 0, 1, 0.6627451, 1,
-0.1276223, -1.430864, -3.105879, 0, 1, 0.6705883, 1,
-0.1240685, 0.2017022, -1.572689, 0, 1, 0.6745098, 1,
-0.1191439, 0.8995246, -0.7998932, 0, 1, 0.682353, 1,
-0.1156521, -0.4402467, -4.968731, 0, 1, 0.6862745, 1,
-0.11439, -1.127438, -3.264764, 0, 1, 0.6941177, 1,
-0.1090221, -0.969645, -1.3527, 0, 1, 0.7019608, 1,
-0.1051364, -0.6318635, -3.014791, 0, 1, 0.7058824, 1,
-0.1035729, -0.2847273, -2.456682, 0, 1, 0.7137255, 1,
-0.1025632, -0.5184047, -3.603328, 0, 1, 0.7176471, 1,
-0.09815903, 1.144234, 1.78289, 0, 1, 0.7254902, 1,
-0.09597766, -1.708083, -2.883228, 0, 1, 0.7294118, 1,
-0.0959477, -0.3183303, -2.550943, 0, 1, 0.7372549, 1,
-0.09305913, -2.29319, -3.519083, 0, 1, 0.7411765, 1,
-0.09007717, 0.6544735, -1.459514, 0, 1, 0.7490196, 1,
-0.07991085, 1.34074, 0.5996462, 0, 1, 0.7529412, 1,
-0.07958031, -0.6281525, -3.77684, 0, 1, 0.7607843, 1,
-0.0755109, -0.1607639, -3.942543, 0, 1, 0.7647059, 1,
-0.07264062, 0.5786703, -1.703228, 0, 1, 0.772549, 1,
-0.07096206, -3.125203, -3.961228, 0, 1, 0.7764706, 1,
-0.06977454, -0.6326443, -2.908187, 0, 1, 0.7843137, 1,
-0.06558505, 2.72382, 0.5109789, 0, 1, 0.7882353, 1,
-0.06414238, -0.4555893, -2.795873, 0, 1, 0.7960784, 1,
-0.06214735, -0.7974095, -2.86434, 0, 1, 0.8039216, 1,
-0.06136753, -1.047249, -4.0608, 0, 1, 0.8078431, 1,
-0.06053342, 0.5510941, -1.282031, 0, 1, 0.8156863, 1,
-0.05953259, 0.545868, -1.418615, 0, 1, 0.8196079, 1,
-0.05939107, 0.7738716, -0.3721361, 0, 1, 0.827451, 1,
-0.05416906, -0.4902017, -2.93555, 0, 1, 0.8313726, 1,
-0.05310062, -0.264832, -2.397362, 0, 1, 0.8392157, 1,
-0.0529558, -0.8365313, -2.952343, 0, 1, 0.8431373, 1,
-0.0508041, -2.91891, -2.688506, 0, 1, 0.8509804, 1,
-0.04840649, -0.7689433, -6.159593, 0, 1, 0.854902, 1,
-0.04816987, -1.166924, -3.351527, 0, 1, 0.8627451, 1,
-0.04315403, 1.989491, 0.02362677, 0, 1, 0.8666667, 1,
-0.04271176, -0.1928161, -1.390147, 0, 1, 0.8745098, 1,
-0.03918292, 0.4010753, -0.8201712, 0, 1, 0.8784314, 1,
-0.03716013, -0.1858135, -2.982001, 0, 1, 0.8862745, 1,
-0.02824546, 0.03852544, -1.888045, 0, 1, 0.8901961, 1,
-0.02809211, 1.582227, -1.082582, 0, 1, 0.8980392, 1,
-0.01961567, -1.014425, -2.880115, 0, 1, 0.9058824, 1,
-0.01598861, 1.190865, -0.9339762, 0, 1, 0.9098039, 1,
-0.01585844, 1.701869, 0.1336052, 0, 1, 0.9176471, 1,
-0.01580191, -2.104704, -2.505295, 0, 1, 0.9215686, 1,
-0.01312555, -0.2056437, -2.60106, 0, 1, 0.9294118, 1,
-0.01234264, 0.007537568, -1.479721, 0, 1, 0.9333333, 1,
-0.01163823, 0.6268753, 0.8972625, 0, 1, 0.9411765, 1,
-0.009323456, -1.233742, -1.909107, 0, 1, 0.945098, 1,
-0.007543136, -1.57795, -3.44524, 0, 1, 0.9529412, 1,
-0.005466864, 1.373572, 0.2454153, 0, 1, 0.9568627, 1,
-0.005117592, -1.786815, -4.470013, 0, 1, 0.9647059, 1,
-0.003240437, -4.241479, -2.253552, 0, 1, 0.9686275, 1,
-0.000597117, 1.452693, -0.08734856, 0, 1, 0.9764706, 1,
0.0004340834, 0.8174913, -0.4873462, 0, 1, 0.9803922, 1,
0.002894238, -0.6827276, 2.402944, 0, 1, 0.9882353, 1,
0.006035915, 0.1082332, -3.426846, 0, 1, 0.9921569, 1,
0.007142972, -0.4544624, 4.426364, 0, 1, 1, 1,
0.01657813, 0.8630012, 0.3515648, 0, 0.9921569, 1, 1,
0.01809911, -1.659139, 2.485563, 0, 0.9882353, 1, 1,
0.02113971, -0.1380939, 2.465616, 0, 0.9803922, 1, 1,
0.02332555, -0.1353047, 1.480021, 0, 0.9764706, 1, 1,
0.02384188, -0.5255973, 3.014654, 0, 0.9686275, 1, 1,
0.0251352, 0.8555355, 0.9063244, 0, 0.9647059, 1, 1,
0.02681424, 1.067945, -0.5981179, 0, 0.9568627, 1, 1,
0.02800666, 0.6080471, 1.576159, 0, 0.9529412, 1, 1,
0.02967376, 0.5351728, 1.221924, 0, 0.945098, 1, 1,
0.03939776, -1.469853, 3.229965, 0, 0.9411765, 1, 1,
0.04326267, 1.915989, 1.965717, 0, 0.9333333, 1, 1,
0.04515929, -1.273289, 4.166273, 0, 0.9294118, 1, 1,
0.04903673, -0.1787065, 1.696411, 0, 0.9215686, 1, 1,
0.04998479, 1.145671, -1.934043, 0, 0.9176471, 1, 1,
0.05347404, -0.9332047, 2.925768, 0, 0.9098039, 1, 1,
0.05737099, -0.757578, 3.251937, 0, 0.9058824, 1, 1,
0.05911522, 0.4432558, 1.404131, 0, 0.8980392, 1, 1,
0.05928698, -1.699954, 3.083156, 0, 0.8901961, 1, 1,
0.05990818, -1.763179, 2.677236, 0, 0.8862745, 1, 1,
0.059939, -0.1476524, 4.380745, 0, 0.8784314, 1, 1,
0.061414, -0.8561619, 3.21588, 0, 0.8745098, 1, 1,
0.06191054, 0.4387023, -0.9348829, 0, 0.8666667, 1, 1,
0.06571801, -0.9386221, 2.613562, 0, 0.8627451, 1, 1,
0.06585642, 0.7779933, -0.8794373, 0, 0.854902, 1, 1,
0.06596749, 1.881298, 1.242603, 0, 0.8509804, 1, 1,
0.0678196, -0.6093477, 2.088077, 0, 0.8431373, 1, 1,
0.07649554, -0.1595793, 4.927073, 0, 0.8392157, 1, 1,
0.09061014, 0.906555, 0.13687, 0, 0.8313726, 1, 1,
0.09194203, -0.4778311, 3.39771, 0, 0.827451, 1, 1,
0.09335161, -1.085401, 2.174303, 0, 0.8196079, 1, 1,
0.09435939, -0.6737932, 2.670968, 0, 0.8156863, 1, 1,
0.09724355, 0.2623357, -0.3389265, 0, 0.8078431, 1, 1,
0.09818757, -1.097175, 2.734463, 0, 0.8039216, 1, 1,
0.100731, -0.293189, 2.347489, 0, 0.7960784, 1, 1,
0.1010997, -0.7212117, 1.360366, 0, 0.7882353, 1, 1,
0.1099309, -0.8111116, 3.003827, 0, 0.7843137, 1, 1,
0.1107772, -1.014578, 2.814498, 0, 0.7764706, 1, 1,
0.1108338, 0.3402867, 0.5835088, 0, 0.772549, 1, 1,
0.1126208, 7.305599e-05, 1.48065, 0, 0.7647059, 1, 1,
0.1128112, -0.4133501, 2.800129, 0, 0.7607843, 1, 1,
0.1154999, -1.100036, 3.276577, 0, 0.7529412, 1, 1,
0.1175768, 0.8700894, -1.273936, 0, 0.7490196, 1, 1,
0.1200159, -0.1770653, 2.638315, 0, 0.7411765, 1, 1,
0.1226663, -0.225388, 3.815139, 0, 0.7372549, 1, 1,
0.1232756, 0.6785963, 0.4706488, 0, 0.7294118, 1, 1,
0.1257446, -0.3480538, 2.5083, 0, 0.7254902, 1, 1,
0.1288914, 0.7567026, 0.8854261, 0, 0.7176471, 1, 1,
0.1309224, -0.03094629, 1.900901, 0, 0.7137255, 1, 1,
0.1327832, 1.880831, -0.04844165, 0, 0.7058824, 1, 1,
0.1334649, -0.3201189, 2.469491, 0, 0.6980392, 1, 1,
0.1337315, 0.2783429, 0.3169997, 0, 0.6941177, 1, 1,
0.1371463, -0.988133, 2.685462, 0, 0.6862745, 1, 1,
0.1375665, 0.4351121, 0.457654, 0, 0.682353, 1, 1,
0.1379214, -1.776892, 4.450646, 0, 0.6745098, 1, 1,
0.1428292, 0.7379944, 0.1388306, 0, 0.6705883, 1, 1,
0.1510598, -0.5603731, 1.663492, 0, 0.6627451, 1, 1,
0.151915, 0.4790918, 1.006201, 0, 0.6588235, 1, 1,
0.1537747, 0.1063553, 2.463959, 0, 0.6509804, 1, 1,
0.1602146, -0.8179669, 3.348086, 0, 0.6470588, 1, 1,
0.1610193, 0.215459, 0.122648, 0, 0.6392157, 1, 1,
0.161386, 0.05212792, 3.202389, 0, 0.6352941, 1, 1,
0.1631173, 0.1195607, 0.4878239, 0, 0.627451, 1, 1,
0.1635055, 0.03311099, 1.834589, 0, 0.6235294, 1, 1,
0.1643539, 0.8701782, 0.6485184, 0, 0.6156863, 1, 1,
0.1672232, 0.05770364, 1.719508, 0, 0.6117647, 1, 1,
0.1696704, -0.3475834, 2.095938, 0, 0.6039216, 1, 1,
0.1730405, -1.007698, 3.793374, 0, 0.5960785, 1, 1,
0.1747583, -0.5652902, 2.092052, 0, 0.5921569, 1, 1,
0.1771002, 0.1210001, -1.430922, 0, 0.5843138, 1, 1,
0.182992, 0.691772, 1.189141, 0, 0.5803922, 1, 1,
0.1844442, -0.2416856, 3.942798, 0, 0.572549, 1, 1,
0.1851642, 1.508569, 1.225101, 0, 0.5686275, 1, 1,
0.1854414, -0.9803933, 2.079601, 0, 0.5607843, 1, 1,
0.1871718, -0.1121628, 1.094909, 0, 0.5568628, 1, 1,
0.1876406, 0.6868219, -0.1995264, 0, 0.5490196, 1, 1,
0.1877569, 1.513677, -1.417867, 0, 0.5450981, 1, 1,
0.188378, 0.7762989, 0.4051084, 0, 0.5372549, 1, 1,
0.1934396, 2.59299, -0.1362454, 0, 0.5333334, 1, 1,
0.1980856, 0.6368471, 1.268061, 0, 0.5254902, 1, 1,
0.1980938, -0.3293407, 2.718344, 0, 0.5215687, 1, 1,
0.1989179, 0.05340654, 1.556718, 0, 0.5137255, 1, 1,
0.2005373, 0.3752682, 0.3694882, 0, 0.509804, 1, 1,
0.2069626, -0.7128305, 1.751638, 0, 0.5019608, 1, 1,
0.2109873, 0.9986575, 1.649222, 0, 0.4941176, 1, 1,
0.2123792, 1.030148, 1.437586, 0, 0.4901961, 1, 1,
0.223459, -1.724092, 4.032041, 0, 0.4823529, 1, 1,
0.2254973, -0.1461243, 1.141602, 0, 0.4784314, 1, 1,
0.2294268, 1.66951, 1.402332, 0, 0.4705882, 1, 1,
0.2347109, 1.602484, -0.1704875, 0, 0.4666667, 1, 1,
0.2358338, 1.154685, -0.01738411, 0, 0.4588235, 1, 1,
0.2389099, -1.605208, 2.819922, 0, 0.454902, 1, 1,
0.2391335, -0.08877914, 1.916114, 0, 0.4470588, 1, 1,
0.2419018, -0.8860423, 2.843394, 0, 0.4431373, 1, 1,
0.2429876, 0.5805278, -1.35026, 0, 0.4352941, 1, 1,
0.2434932, -0.7119503, 3.120158, 0, 0.4313726, 1, 1,
0.2436311, -0.8808195, 3.281127, 0, 0.4235294, 1, 1,
0.2487957, 0.4514641, 1.201238, 0, 0.4196078, 1, 1,
0.2501213, 0.3941802, 2.59865, 0, 0.4117647, 1, 1,
0.2559624, -0.8201834, 3.396486, 0, 0.4078431, 1, 1,
0.2614364, 0.2502242, 2.078264, 0, 0.4, 1, 1,
0.2615377, 0.9229732, 1.430113, 0, 0.3921569, 1, 1,
0.2645449, 0.5625862, 0.6435231, 0, 0.3882353, 1, 1,
0.2684263, 0.7112166, 0.1444598, 0, 0.3803922, 1, 1,
0.2688128, 0.2179393, 0.8822176, 0, 0.3764706, 1, 1,
0.269822, 1.243355, -0.5756269, 0, 0.3686275, 1, 1,
0.2701901, 0.7097055, 0.6988013, 0, 0.3647059, 1, 1,
0.2705508, -1.025576, 3.501241, 0, 0.3568628, 1, 1,
0.2712483, 0.1295001, 0.4533707, 0, 0.3529412, 1, 1,
0.2714927, -1.402503, 1.570593, 0, 0.345098, 1, 1,
0.2718827, 2.223446, 0.08914147, 0, 0.3411765, 1, 1,
0.2736129, 0.006700426, 1.258997, 0, 0.3333333, 1, 1,
0.2846738, -0.05625079, 1.1448, 0, 0.3294118, 1, 1,
0.2925631, -0.2532241, 1.795019, 0, 0.3215686, 1, 1,
0.2951228, -1.909057, 2.596484, 0, 0.3176471, 1, 1,
0.2959989, -0.4550173, 1.363407, 0, 0.3098039, 1, 1,
0.3011648, -1.014491, 1.803159, 0, 0.3058824, 1, 1,
0.301486, -0.7228854, 1.499982, 0, 0.2980392, 1, 1,
0.3047508, 1.900698, 0.3278262, 0, 0.2901961, 1, 1,
0.307865, -0.3057796, 3.889649, 0, 0.2862745, 1, 1,
0.3193633, -2.735452, 3.183167, 0, 0.2784314, 1, 1,
0.3206736, 0.05581963, 1.843235, 0, 0.2745098, 1, 1,
0.3213786, -2.461124, 3.955635, 0, 0.2666667, 1, 1,
0.3227943, -0.06883493, 1.120698, 0, 0.2627451, 1, 1,
0.3234747, 0.3935276, 0.2231879, 0, 0.254902, 1, 1,
0.3258702, -0.1496084, -0.1932099, 0, 0.2509804, 1, 1,
0.3298166, 0.3284892, 2.164884, 0, 0.2431373, 1, 1,
0.3303198, 0.1629141, 3.05205, 0, 0.2392157, 1, 1,
0.3312921, -1.05202, 3.034266, 0, 0.2313726, 1, 1,
0.3314187, 0.09297335, 1.687454, 0, 0.227451, 1, 1,
0.3333907, -1.045053, 1.30681, 0, 0.2196078, 1, 1,
0.3388445, 1.141951, 2.062159, 0, 0.2156863, 1, 1,
0.3418243, -1.653557, 3.309254, 0, 0.2078431, 1, 1,
0.3441591, -0.6736025, 4.254282, 0, 0.2039216, 1, 1,
0.3512172, -0.4672294, 2.485203, 0, 0.1960784, 1, 1,
0.3529042, -0.2141242, 0.6803817, 0, 0.1882353, 1, 1,
0.3535754, -0.3488956, 1.724805, 0, 0.1843137, 1, 1,
0.355788, 0.599092, 0.2931732, 0, 0.1764706, 1, 1,
0.3638396, -1.040707, -0.4505345, 0, 0.172549, 1, 1,
0.36632, 1.518834, 0.7497514, 0, 0.1647059, 1, 1,
0.3678384, 1.532892, -0.4094074, 0, 0.1607843, 1, 1,
0.3687802, 0.6539091, 1.372444, 0, 0.1529412, 1, 1,
0.3719328, 0.3072536, 0.6059213, 0, 0.1490196, 1, 1,
0.3723532, -2.978933, 2.868643, 0, 0.1411765, 1, 1,
0.3768732, 0.5298239, 1.05427, 0, 0.1372549, 1, 1,
0.3780154, 0.8776652, 1.172466, 0, 0.1294118, 1, 1,
0.3801721, 0.2182087, 2.978446, 0, 0.1254902, 1, 1,
0.3848108, 0.01033347, 0.3792316, 0, 0.1176471, 1, 1,
0.3929724, -1.314426, 4.048166, 0, 0.1137255, 1, 1,
0.3949315, 0.6838985, 0.2127354, 0, 0.1058824, 1, 1,
0.39772, -0.6200348, 2.354857, 0, 0.09803922, 1, 1,
0.3985287, 1.015363, 1.731208, 0, 0.09411765, 1, 1,
0.3999327, 0.1882536, 1.38007, 0, 0.08627451, 1, 1,
0.400394, -0.2810652, 1.987475, 0, 0.08235294, 1, 1,
0.4017512, -2.727008, 2.715142, 0, 0.07450981, 1, 1,
0.4054692, 1.604067, 0.03138234, 0, 0.07058824, 1, 1,
0.4158278, -1.703221, 3.807915, 0, 0.0627451, 1, 1,
0.421077, -0.3770357, 1.464939, 0, 0.05882353, 1, 1,
0.4231679, -0.1861804, 1.058835, 0, 0.05098039, 1, 1,
0.4279493, 0.4907347, -0.2395011, 0, 0.04705882, 1, 1,
0.4306345, 0.07675493, 0.2506079, 0, 0.03921569, 1, 1,
0.4329914, 0.2675377, 0.0914529, 0, 0.03529412, 1, 1,
0.4339041, 0.9860112, 0.2817317, 0, 0.02745098, 1, 1,
0.4362241, 1.360059, 0.5980307, 0, 0.02352941, 1, 1,
0.4378236, 0.8707151, -0.8206773, 0, 0.01568628, 1, 1,
0.4382381, -0.07382211, 2.603097, 0, 0.01176471, 1, 1,
0.4425453, -0.2469598, 1.95761, 0, 0.003921569, 1, 1,
0.4428731, 0.9021325, 1.426334, 0.003921569, 0, 1, 1,
0.4429657, 1.193676, 0.9022248, 0.007843138, 0, 1, 1,
0.4478223, -1.224915, 3.118981, 0.01568628, 0, 1, 1,
0.4506824, 0.04986699, 2.573675, 0.01960784, 0, 1, 1,
0.4537251, -0.6679003, 1.779589, 0.02745098, 0, 1, 1,
0.4559956, -0.1042408, 0.1331938, 0.03137255, 0, 1, 1,
0.4589285, 0.9400715, 1.217193, 0.03921569, 0, 1, 1,
0.4594162, 0.7624929, -0.6970556, 0.04313726, 0, 1, 1,
0.4617035, -1.964663, 3.565579, 0.05098039, 0, 1, 1,
0.4660302, -1.066923, 1.74633, 0.05490196, 0, 1, 1,
0.4673925, -1.415462, 2.04051, 0.0627451, 0, 1, 1,
0.4706511, 1.988303, 0.2074457, 0.06666667, 0, 1, 1,
0.4808171, 0.6587541, 0.1053697, 0.07450981, 0, 1, 1,
0.4822072, 0.5367222, 2.149276, 0.07843138, 0, 1, 1,
0.483733, 1.501494, 2.291936, 0.08627451, 0, 1, 1,
0.4838466, 0.7017369, 1.618398, 0.09019608, 0, 1, 1,
0.4876789, 1.649938, 0.4117526, 0.09803922, 0, 1, 1,
0.4888188, 1.273385, -0.7210596, 0.1058824, 0, 1, 1,
0.4950972, 0.2490678, 2.64184, 0.1098039, 0, 1, 1,
0.4965906, -0.2068519, 1.081688, 0.1176471, 0, 1, 1,
0.4987867, -0.2782605, 0.6422715, 0.1215686, 0, 1, 1,
0.5038537, -1.79417, 3.023815, 0.1294118, 0, 1, 1,
0.5094856, 0.228257, -0.8001521, 0.1333333, 0, 1, 1,
0.5144554, -1.287002, 1.9956, 0.1411765, 0, 1, 1,
0.521916, 0.604726, 1.229842, 0.145098, 0, 1, 1,
0.5233415, -0.6047494, 1.23587, 0.1529412, 0, 1, 1,
0.5236105, 1.839594, 0.02835131, 0.1568628, 0, 1, 1,
0.5254484, -0.6421011, 1.24581, 0.1647059, 0, 1, 1,
0.5281805, 0.5640947, -0.02799358, 0.1686275, 0, 1, 1,
0.5317055, 0.8859031, -1.664788, 0.1764706, 0, 1, 1,
0.5367854, -0.4904267, 4.834329, 0.1803922, 0, 1, 1,
0.5373912, 0.8269562, 2.781726, 0.1882353, 0, 1, 1,
0.5481108, 2.217223, 0.4344054, 0.1921569, 0, 1, 1,
0.5495144, 0.2558254, 1.481709, 0.2, 0, 1, 1,
0.551151, -0.4085463, 1.813603, 0.2078431, 0, 1, 1,
0.5547124, 1.409696, 0.1379238, 0.2117647, 0, 1, 1,
0.5554858, 0.07667512, 0.9188865, 0.2196078, 0, 1, 1,
0.5565904, -1.118654, 2.426567, 0.2235294, 0, 1, 1,
0.5607387, 0.3168586, 1.456731, 0.2313726, 0, 1, 1,
0.5639154, 1.990357, 0.4317787, 0.2352941, 0, 1, 1,
0.5641317, 0.6424493, 0.8661885, 0.2431373, 0, 1, 1,
0.569476, -0.1277241, 2.181449, 0.2470588, 0, 1, 1,
0.5728146, -1.073254, 3.421168, 0.254902, 0, 1, 1,
0.584839, -1.402418, 5.112236, 0.2588235, 0, 1, 1,
0.5869613, 1.029241, 0.5991637, 0.2666667, 0, 1, 1,
0.5876275, -0.3413045, 1.395381, 0.2705882, 0, 1, 1,
0.5916531, 0.8768567, -0.06860266, 0.2784314, 0, 1, 1,
0.5931848, -0.6185585, 1.836805, 0.282353, 0, 1, 1,
0.5932907, -0.1947178, 2.129496, 0.2901961, 0, 1, 1,
0.5962905, -1.011943, 2.646205, 0.2941177, 0, 1, 1,
0.596794, 0.365489, 0.9090879, 0.3019608, 0, 1, 1,
0.5974535, 1.999869, -0.6568284, 0.3098039, 0, 1, 1,
0.6011151, -2.452918, 3.214453, 0.3137255, 0, 1, 1,
0.6028149, 2.38629, -1.068447, 0.3215686, 0, 1, 1,
0.607917, -0.07704511, 3.596849, 0.3254902, 0, 1, 1,
0.60833, -0.5667796, 2.728727, 0.3333333, 0, 1, 1,
0.6125078, -1.057106, 1.115768, 0.3372549, 0, 1, 1,
0.6162238, 1.706809, 0.7270393, 0.345098, 0, 1, 1,
0.6202244, -1.329539, 2.323614, 0.3490196, 0, 1, 1,
0.6209844, -0.04058663, 1.943384, 0.3568628, 0, 1, 1,
0.622253, -1.299098, 2.126379, 0.3607843, 0, 1, 1,
0.6223338, 0.1855182, 2.34461, 0.3686275, 0, 1, 1,
0.6238015, 0.7963336, 1.698852, 0.372549, 0, 1, 1,
0.6297901, -1.188675, 2.566657, 0.3803922, 0, 1, 1,
0.6322425, 0.8377597, 0.6107212, 0.3843137, 0, 1, 1,
0.6324797, -1.078636, 3.387412, 0.3921569, 0, 1, 1,
0.6354007, -1.793331, 1.469384, 0.3960784, 0, 1, 1,
0.6391838, -0.1648145, 1.139055, 0.4039216, 0, 1, 1,
0.6442972, 0.617609, 1.663784, 0.4117647, 0, 1, 1,
0.6459337, 0.04100322, -0.07480292, 0.4156863, 0, 1, 1,
0.647599, -0.2814902, 1.585995, 0.4235294, 0, 1, 1,
0.6521769, 1.590024, -1.139819, 0.427451, 0, 1, 1,
0.6572983, -1.83177, 2.386594, 0.4352941, 0, 1, 1,
0.6573256, 0.04882, 1.20102, 0.4392157, 0, 1, 1,
0.6593069, -1.368275, 3.05398, 0.4470588, 0, 1, 1,
0.6594286, -0.7274534, 2.006163, 0.4509804, 0, 1, 1,
0.6608121, -0.3035447, 1.976314, 0.4588235, 0, 1, 1,
0.6741587, -1.290298, 2.760856, 0.4627451, 0, 1, 1,
0.6779956, 0.06182794, -0.02508627, 0.4705882, 0, 1, 1,
0.6795974, 0.383717, 1.844336, 0.4745098, 0, 1, 1,
0.6931994, 0.09697222, 3.63891, 0.4823529, 0, 1, 1,
0.6970578, -0.1337052, 1.842762, 0.4862745, 0, 1, 1,
0.6989382, 0.9762384, 0.9071557, 0.4941176, 0, 1, 1,
0.7011063, 1.142705, 1.633756, 0.5019608, 0, 1, 1,
0.7189038, 1.557954, -1.142426, 0.5058824, 0, 1, 1,
0.727491, 0.1435176, 1.179241, 0.5137255, 0, 1, 1,
0.7280525, 1.493934, 0.1583007, 0.5176471, 0, 1, 1,
0.728098, -0.3609257, 1.928598, 0.5254902, 0, 1, 1,
0.7296925, -1.17023, 3.270605, 0.5294118, 0, 1, 1,
0.7305791, 1.701735, 1.403687, 0.5372549, 0, 1, 1,
0.7382584, 1.036362, 0.6136138, 0.5411765, 0, 1, 1,
0.739243, 0.3234698, -0.5985315, 0.5490196, 0, 1, 1,
0.7453337, -0.123813, 0.875903, 0.5529412, 0, 1, 1,
0.7509088, 0.1457726, 1.123004, 0.5607843, 0, 1, 1,
0.7531437, 1.308853, 1.947721, 0.5647059, 0, 1, 1,
0.7545863, -0.8267112, 1.819688, 0.572549, 0, 1, 1,
0.769303, 1.441187, 1.72837, 0.5764706, 0, 1, 1,
0.7715214, -0.9395652, 2.87249, 0.5843138, 0, 1, 1,
0.7715487, -0.06798773, 1.245177, 0.5882353, 0, 1, 1,
0.7717851, -0.935526, 1.382513, 0.5960785, 0, 1, 1,
0.7728593, 0.03620481, 1.354402, 0.6039216, 0, 1, 1,
0.7728716, 0.1331858, 3.179065, 0.6078432, 0, 1, 1,
0.7765566, 0.9725105, -0.03219579, 0.6156863, 0, 1, 1,
0.7801617, 0.3648992, 0.2905492, 0.6196079, 0, 1, 1,
0.7811217, 2.169713, 1.194525, 0.627451, 0, 1, 1,
0.7818539, -0.4135821, 2.568033, 0.6313726, 0, 1, 1,
0.783368, 1.126322, 0.7994735, 0.6392157, 0, 1, 1,
0.7841293, 0.964339, 0.04152608, 0.6431373, 0, 1, 1,
0.7851766, -0.4327608, 2.382792, 0.6509804, 0, 1, 1,
0.7855061, 0.1783084, 1.675455, 0.654902, 0, 1, 1,
0.7884039, 0.8522853, 1.586907, 0.6627451, 0, 1, 1,
0.7944981, 1.594752, 1.172941, 0.6666667, 0, 1, 1,
0.7974986, 1.296602, 0.2754864, 0.6745098, 0, 1, 1,
0.8028348, 0.6607691, 0.2047206, 0.6784314, 0, 1, 1,
0.8070652, 0.6895514, 0.2873135, 0.6862745, 0, 1, 1,
0.8089688, -0.3465409, 0.9026178, 0.6901961, 0, 1, 1,
0.8207523, 0.9139832, 3.69219, 0.6980392, 0, 1, 1,
0.8227672, 2.048728, 1.831384, 0.7058824, 0, 1, 1,
0.8281707, 0.270712, 1.252003, 0.7098039, 0, 1, 1,
0.8355963, 0.6647129, 2.308137, 0.7176471, 0, 1, 1,
0.8461655, -0.6927618, 2.811916, 0.7215686, 0, 1, 1,
0.8473678, 0.7192099, 0.6040547, 0.7294118, 0, 1, 1,
0.8482729, 0.3645083, 0.4168324, 0.7333333, 0, 1, 1,
0.8493175, 0.7618034, -0.05734989, 0.7411765, 0, 1, 1,
0.8555238, -0.6277194, 1.957851, 0.7450981, 0, 1, 1,
0.8653549, -1.047804, 1.064555, 0.7529412, 0, 1, 1,
0.8657607, 1.42278, 0.284473, 0.7568628, 0, 1, 1,
0.8665211, -1.049294, 2.976358, 0.7647059, 0, 1, 1,
0.8710827, 1.915364, 0.5897466, 0.7686275, 0, 1, 1,
0.8722991, 0.3564393, 0.1999937, 0.7764706, 0, 1, 1,
0.8764572, 0.3748809, 0.9431854, 0.7803922, 0, 1, 1,
0.8775613, -2.555367, 2.997505, 0.7882353, 0, 1, 1,
0.8786152, -1.016119, 1.989426, 0.7921569, 0, 1, 1,
0.8806437, 0.3416018, -0.7400025, 0.8, 0, 1, 1,
0.8830934, -0.9868366, 2.629472, 0.8078431, 0, 1, 1,
0.8831118, -0.7803349, 0.4131978, 0.8117647, 0, 1, 1,
0.8834172, -1.164708, 2.281022, 0.8196079, 0, 1, 1,
0.8897294, -1.535534, 3.799363, 0.8235294, 0, 1, 1,
0.8969117, -1.392066, 4.022761, 0.8313726, 0, 1, 1,
0.9053345, 0.6503412, 0.9185501, 0.8352941, 0, 1, 1,
0.9054682, 1.627205, 0.5259214, 0.8431373, 0, 1, 1,
0.9135639, -0.6013801, 3.168655, 0.8470588, 0, 1, 1,
0.9189599, -0.630798, -0.0984309, 0.854902, 0, 1, 1,
0.9192675, -0.3781399, 0.07317484, 0.8588235, 0, 1, 1,
0.9251022, -0.9852526, 1.820926, 0.8666667, 0, 1, 1,
0.9264264, 0.7140452, 0.8801497, 0.8705882, 0, 1, 1,
0.9275218, -2.21816, 3.687541, 0.8784314, 0, 1, 1,
0.9353899, 0.4051174, 1.048034, 0.8823529, 0, 1, 1,
0.9385927, 1.775988, 1.709801, 0.8901961, 0, 1, 1,
0.9407082, -0.0768318, 1.171672, 0.8941177, 0, 1, 1,
0.9574709, -0.9624097, 2.941619, 0.9019608, 0, 1, 1,
0.9680949, -0.5678313, 2.35636, 0.9098039, 0, 1, 1,
0.9697911, 0.03774142, 2.178608, 0.9137255, 0, 1, 1,
0.9729212, -0.7446183, 2.914206, 0.9215686, 0, 1, 1,
0.9754252, 0.7424303, 0.2847727, 0.9254902, 0, 1, 1,
0.9758548, -1.348788, 3.249568, 0.9333333, 0, 1, 1,
0.9764373, 0.3311281, 1.728001, 0.9372549, 0, 1, 1,
0.9792241, 0.4663921, 1.001028, 0.945098, 0, 1, 1,
0.9807209, -0.4711192, 0.6921585, 0.9490196, 0, 1, 1,
0.983631, -0.3961418, 1.463976, 0.9568627, 0, 1, 1,
0.9868817, 0.6808739, 0.7547578, 0.9607843, 0, 1, 1,
0.9929219, -1.169703, 2.05875, 0.9686275, 0, 1, 1,
0.9962731, 0.6879705, 0.4431249, 0.972549, 0, 1, 1,
0.998058, -0.09438132, 2.41917, 0.9803922, 0, 1, 1,
1.000656, -1.76485, 2.302114, 0.9843137, 0, 1, 1,
1.004463, 0.9345952, 0.5796065, 0.9921569, 0, 1, 1,
1.005957, -0.9316858, 0.9284981, 0.9960784, 0, 1, 1,
1.019264, 0.8718618, -0.2862913, 1, 0, 0.9960784, 1,
1.019868, 0.2835156, -0.369801, 1, 0, 0.9882353, 1,
1.02107, 0.4130832, 1.714201, 1, 0, 0.9843137, 1,
1.026401, 0.9609347, -0.02537907, 1, 0, 0.9764706, 1,
1.028412, -1.373601, 2.566109, 1, 0, 0.972549, 1,
1.029043, 0.6532933, 0.08887332, 1, 0, 0.9647059, 1,
1.04628, -1.968823, 4.163657, 1, 0, 0.9607843, 1,
1.046433, 0.8281325, -1.099796, 1, 0, 0.9529412, 1,
1.048627, 0.1343622, 2.496104, 1, 0, 0.9490196, 1,
1.05037, -0.218343, 0.7262065, 1, 0, 0.9411765, 1,
1.056085, 0.5503632, 0.9133906, 1, 0, 0.9372549, 1,
1.057524, 1.345496, 1.160784, 1, 0, 0.9294118, 1,
1.062352, 0.6647409, 0.5856281, 1, 0, 0.9254902, 1,
1.064389, -0.5659306, 3.65852, 1, 0, 0.9176471, 1,
1.072588, -0.4006173, 1.88881, 1, 0, 0.9137255, 1,
1.07545, 1.085392, 1.226132, 1, 0, 0.9058824, 1,
1.082774, -0.4822398, 2.085451, 1, 0, 0.9019608, 1,
1.087796, -0.2470825, 1.51718, 1, 0, 0.8941177, 1,
1.089272, -2.345494, -0.4615968, 1, 0, 0.8862745, 1,
1.098789, -0.4400404, 2.289308, 1, 0, 0.8823529, 1,
1.099613, 0.2913251, 2.118513, 1, 0, 0.8745098, 1,
1.11015, -1.426882, 3.17124, 1, 0, 0.8705882, 1,
1.112874, -1.351847, 1.43687, 1, 0, 0.8627451, 1,
1.116219, -2.100007, 2.35408, 1, 0, 0.8588235, 1,
1.117198, -0.9637942, 2.598313, 1, 0, 0.8509804, 1,
1.120632, -1.266033, 1.915866, 1, 0, 0.8470588, 1,
1.12459, -0.8638591, 1.864682, 1, 0, 0.8392157, 1,
1.138124, 1.271951, -0.01726393, 1, 0, 0.8352941, 1,
1.143448, 0.2865306, 0.7725159, 1, 0, 0.827451, 1,
1.150437, 0.09182134, 0.05851151, 1, 0, 0.8235294, 1,
1.15186, -1.897078, 0.3390184, 1, 0, 0.8156863, 1,
1.154553, -1.58049, 3.722423, 1, 0, 0.8117647, 1,
1.155837, -0.2155004, 0.09884702, 1, 0, 0.8039216, 1,
1.158507, 0.6588992, -0.01901126, 1, 0, 0.7960784, 1,
1.162122, -0.8608851, 1.212137, 1, 0, 0.7921569, 1,
1.163507, 0.3517554, 0.1622086, 1, 0, 0.7843137, 1,
1.182933, -0.9570614, 2.056528, 1, 0, 0.7803922, 1,
1.205205, 0.5914462, 1.038567, 1, 0, 0.772549, 1,
1.214844, -0.6611838, 3.925879, 1, 0, 0.7686275, 1,
1.21924, -0.4090277, 2.431791, 1, 0, 0.7607843, 1,
1.223906, 0.2817643, 1.534828, 1, 0, 0.7568628, 1,
1.229748, -0.2640951, 2.76533, 1, 0, 0.7490196, 1,
1.238658, 1.076747, 0.3553012, 1, 0, 0.7450981, 1,
1.249282, -0.9125037, 1.174466, 1, 0, 0.7372549, 1,
1.249488, -0.9476182, 0.193534, 1, 0, 0.7333333, 1,
1.251163, -0.6115107, 1.039398, 1, 0, 0.7254902, 1,
1.252714, -0.5786056, 1.099152, 1, 0, 0.7215686, 1,
1.252992, 1.129135, 1.349218, 1, 0, 0.7137255, 1,
1.25329, 0.4255214, 1.969235, 1, 0, 0.7098039, 1,
1.253327, -0.7806606, 1.438805, 1, 0, 0.7019608, 1,
1.253425, 0.3496878, 1.868235, 1, 0, 0.6941177, 1,
1.254213, 1.246145, 0.9848387, 1, 0, 0.6901961, 1,
1.26257, 0.2770454, 0.1361359, 1, 0, 0.682353, 1,
1.266696, -1.681958, 3.705649, 1, 0, 0.6784314, 1,
1.278497, 0.7933114, 1.209316, 1, 0, 0.6705883, 1,
1.281887, -0.800448, 1.41392, 1, 0, 0.6666667, 1,
1.294517, 1.51638, 1.423773, 1, 0, 0.6588235, 1,
1.300406, 0.2520925, 1.759597, 1, 0, 0.654902, 1,
1.305465, -0.4420187, -0.7720718, 1, 0, 0.6470588, 1,
1.308871, 0.6656338, 0.8619049, 1, 0, 0.6431373, 1,
1.321519, 2.253726, 0.7894559, 1, 0, 0.6352941, 1,
1.327304, 0.9145597, 1.914819, 1, 0, 0.6313726, 1,
1.328637, 0.8611667, 1.973779, 1, 0, 0.6235294, 1,
1.333338, -0.8237753, 2.220737, 1, 0, 0.6196079, 1,
1.336335, 0.7337874, -0.1539922, 1, 0, 0.6117647, 1,
1.347093, -0.7452908, 3.290117, 1, 0, 0.6078432, 1,
1.347518, 2.163578, 0.4640726, 1, 0, 0.6, 1,
1.348937, -0.6391313, 4.579192, 1, 0, 0.5921569, 1,
1.35474, 0.4443754, 0.5559078, 1, 0, 0.5882353, 1,
1.36131, 0.7153553, 0.7877907, 1, 0, 0.5803922, 1,
1.365222, -0.1115803, -0.07001197, 1, 0, 0.5764706, 1,
1.377971, -1.652892, 2.455406, 1, 0, 0.5686275, 1,
1.383897, -0.6942161, 0.9311182, 1, 0, 0.5647059, 1,
1.395785, -0.6776244, 2.991994, 1, 0, 0.5568628, 1,
1.408521, -0.07701644, 0.4386366, 1, 0, 0.5529412, 1,
1.409309, -0.05629291, 1.665554, 1, 0, 0.5450981, 1,
1.413058, -0.08244594, 1.399156, 1, 0, 0.5411765, 1,
1.414498, 1.567606, 1.608967, 1, 0, 0.5333334, 1,
1.416824, -0.3919385, 2.942702, 1, 0, 0.5294118, 1,
1.420182, -1.341283, 3.026174, 1, 0, 0.5215687, 1,
1.421155, -0.2704853, 3.011001, 1, 0, 0.5176471, 1,
1.426008, 0.147685, 1.839672, 1, 0, 0.509804, 1,
1.43855, 0.6347603, 0.5588809, 1, 0, 0.5058824, 1,
1.453218, 0.5530959, 0.9859831, 1, 0, 0.4980392, 1,
1.460106, 0.299652, -0.08863277, 1, 0, 0.4901961, 1,
1.474288, -1.050556, 1.874947, 1, 0, 0.4862745, 1,
1.476797, 0.8816604, -0.1375903, 1, 0, 0.4784314, 1,
1.493734, -1.240101, 1.47034, 1, 0, 0.4745098, 1,
1.497959, 0.3708009, 0.4582963, 1, 0, 0.4666667, 1,
1.498153, 1.668008, 2.572572, 1, 0, 0.4627451, 1,
1.50659, -1.248957, 2.650606, 1, 0, 0.454902, 1,
1.520843, 0.0316528, 1.825359, 1, 0, 0.4509804, 1,
1.521708, -0.4748844, 0.4321228, 1, 0, 0.4431373, 1,
1.52293, -0.5105256, 0.6659591, 1, 0, 0.4392157, 1,
1.524298, 0.4699067, 0.1055962, 1, 0, 0.4313726, 1,
1.540842, -1.184291, 2.865325, 1, 0, 0.427451, 1,
1.545858, -1.050515, 0.6842178, 1, 0, 0.4196078, 1,
1.55518, -0.805463, 1.516642, 1, 0, 0.4156863, 1,
1.568799, -0.2361967, 1.37034, 1, 0, 0.4078431, 1,
1.570667, 0.5462949, 0.6909638, 1, 0, 0.4039216, 1,
1.580241, 1.312051, 0.6799125, 1, 0, 0.3960784, 1,
1.590223, -0.9952158, 0.08495761, 1, 0, 0.3882353, 1,
1.592912, 1.642527, -0.573744, 1, 0, 0.3843137, 1,
1.599876, 0.6205211, -0.1886837, 1, 0, 0.3764706, 1,
1.600424, -0.6523935, 2.153787, 1, 0, 0.372549, 1,
1.611718, 0.5875319, 1.336982, 1, 0, 0.3647059, 1,
1.663167, 0.7100179, 0.2713719, 1, 0, 0.3607843, 1,
1.687591, 1.72463, 1.077755, 1, 0, 0.3529412, 1,
1.744136, 0.0744618, 0.9684074, 1, 0, 0.3490196, 1,
1.744532, -0.8301871, 1.502783, 1, 0, 0.3411765, 1,
1.772844, 0.5410584, 1.099246, 1, 0, 0.3372549, 1,
1.778152, -0.3843032, 0.3380493, 1, 0, 0.3294118, 1,
1.782897, -0.3754905, 2.603511, 1, 0, 0.3254902, 1,
1.789701, 1.514306, 2.635311, 1, 0, 0.3176471, 1,
1.79563, -1.021805, 0.5319732, 1, 0, 0.3137255, 1,
1.802932, 0.4891126, 0.5759292, 1, 0, 0.3058824, 1,
1.806241, -0.1975837, 0.06479193, 1, 0, 0.2980392, 1,
1.808548, -0.6353329, 2.44004, 1, 0, 0.2941177, 1,
1.825574, 1.056062, 1.292905, 1, 0, 0.2862745, 1,
1.825945, 1.731567, 1.022859, 1, 0, 0.282353, 1,
1.832581, -0.8044195, 2.217276, 1, 0, 0.2745098, 1,
1.833979, 0.2561432, 1.813312, 1, 0, 0.2705882, 1,
1.834505, 0.358268, -0.3739206, 1, 0, 0.2627451, 1,
1.839598, 1.437313, 1.840599, 1, 0, 0.2588235, 1,
1.847505, -0.155741, 2.014951, 1, 0, 0.2509804, 1,
1.848597, -0.06246812, 1.383879, 1, 0, 0.2470588, 1,
1.864613, -2.333041, 2.431451, 1, 0, 0.2392157, 1,
1.87749, -0.09504089, -0.08010672, 1, 0, 0.2352941, 1,
1.884656, 1.623832, 1.12343, 1, 0, 0.227451, 1,
1.887593, -0.2321009, 1.932764, 1, 0, 0.2235294, 1,
1.908444, 0.7981331, 0.9856223, 1, 0, 0.2156863, 1,
1.92849, -1.571171, 0.6394666, 1, 0, 0.2117647, 1,
1.929561, 0.3523615, 1.669936, 1, 0, 0.2039216, 1,
1.935075, -0.6306202, 2.302034, 1, 0, 0.1960784, 1,
1.936249, -0.7939447, 2.243466, 1, 0, 0.1921569, 1,
1.955113, -0.5858441, 1.254002, 1, 0, 0.1843137, 1,
1.97, 0.3291016, 1.127577, 1, 0, 0.1803922, 1,
1.977723, 0.6358976, 1.82565, 1, 0, 0.172549, 1,
1.985896, 0.4409742, 0.8596606, 1, 0, 0.1686275, 1,
1.987495, -0.1390408, 1.417508, 1, 0, 0.1607843, 1,
2.013411, -1.319038, 3.110681, 1, 0, 0.1568628, 1,
2.028549, -1.108518, 1.004478, 1, 0, 0.1490196, 1,
2.041466, -0.1961058, -0.07937431, 1, 0, 0.145098, 1,
2.049751, -1.40123, 3.47923, 1, 0, 0.1372549, 1,
2.054881, 0.8670061, 2.570688, 1, 0, 0.1333333, 1,
2.062119, 1.407425, 1.207301, 1, 0, 0.1254902, 1,
2.083519, -0.2764854, 1.739927, 1, 0, 0.1215686, 1,
2.106364, -1.187611, 3.284739, 1, 0, 0.1137255, 1,
2.138546, 0.07522859, 0.5719848, 1, 0, 0.1098039, 1,
2.171041, -0.09170219, 0.3184249, 1, 0, 0.1019608, 1,
2.181632, -0.5184425, 2.856383, 1, 0, 0.09411765, 1,
2.323459, 1.858651, 0.286068, 1, 0, 0.09019608, 1,
2.356904, 0.3610156, 1.239453, 1, 0, 0.08235294, 1,
2.358728, 1.013095, 0.6476214, 1, 0, 0.07843138, 1,
2.376542, 1.295075, 1.689416, 1, 0, 0.07058824, 1,
2.385777, -0.9628317, 1.813676, 1, 0, 0.06666667, 1,
2.387907, 0.7152319, 1.021961, 1, 0, 0.05882353, 1,
2.398116, -1.224648, 2.747971, 1, 0, 0.05490196, 1,
2.460131, -1.232028, -0.1111396, 1, 0, 0.04705882, 1,
2.549984, 0.4417411, 3.320392, 1, 0, 0.04313726, 1,
2.594975, 1.053804, 0.183558, 1, 0, 0.03529412, 1,
2.685474, -1.651957, 2.145355, 1, 0, 0.03137255, 1,
2.70304, -0.2569248, 1.888522, 1, 0, 0.02352941, 1,
2.984993, -0.4990965, 1.173606, 1, 0, 0.01960784, 1,
3.338283, -0.8770277, 1.926503, 1, 0, 0.01176471, 1,
3.531044, -1.626509, 1.170962, 1, 0, 0.007843138, 1
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
0.3828887, -5.59357, -8.070168, 0, -0.5, 0.5, 0.5,
0.3828887, -5.59357, -8.070168, 1, -0.5, 0.5, 0.5,
0.3828887, -5.59357, -8.070168, 1, 1.5, 0.5, 0.5,
0.3828887, -5.59357, -8.070168, 0, 1.5, 0.5, 0.5
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
-3.832492, -0.2530096, -8.070168, 0, -0.5, 0.5, 0.5,
-3.832492, -0.2530096, -8.070168, 1, -0.5, 0.5, 0.5,
-3.832492, -0.2530096, -8.070168, 1, 1.5, 0.5, 0.5,
-3.832492, -0.2530096, -8.070168, 0, 1.5, 0.5, 0.5
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
-3.832492, -5.59357, -0.5236783, 0, -0.5, 0.5, 0.5,
-3.832492, -5.59357, -0.5236783, 1, -0.5, 0.5, 0.5,
-3.832492, -5.59357, -0.5236783, 1, 1.5, 0.5, 0.5,
-3.832492, -5.59357, -0.5236783, 0, 1.5, 0.5, 0.5
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
-2, -4.361133, -6.32867,
3, -4.361133, -6.32867,
-2, -4.361133, -6.32867,
-2, -4.566539, -6.61892,
-1, -4.361133, -6.32867,
-1, -4.566539, -6.61892,
0, -4.361133, -6.32867,
0, -4.566539, -6.61892,
1, -4.361133, -6.32867,
1, -4.566539, -6.61892,
2, -4.361133, -6.32867,
2, -4.566539, -6.61892,
3, -4.361133, -6.32867,
3, -4.566539, -6.61892
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
-2, -4.977352, -7.199419, 0, -0.5, 0.5, 0.5,
-2, -4.977352, -7.199419, 1, -0.5, 0.5, 0.5,
-2, -4.977352, -7.199419, 1, 1.5, 0.5, 0.5,
-2, -4.977352, -7.199419, 0, 1.5, 0.5, 0.5,
-1, -4.977352, -7.199419, 0, -0.5, 0.5, 0.5,
-1, -4.977352, -7.199419, 1, -0.5, 0.5, 0.5,
-1, -4.977352, -7.199419, 1, 1.5, 0.5, 0.5,
-1, -4.977352, -7.199419, 0, 1.5, 0.5, 0.5,
0, -4.977352, -7.199419, 0, -0.5, 0.5, 0.5,
0, -4.977352, -7.199419, 1, -0.5, 0.5, 0.5,
0, -4.977352, -7.199419, 1, 1.5, 0.5, 0.5,
0, -4.977352, -7.199419, 0, 1.5, 0.5, 0.5,
1, -4.977352, -7.199419, 0, -0.5, 0.5, 0.5,
1, -4.977352, -7.199419, 1, -0.5, 0.5, 0.5,
1, -4.977352, -7.199419, 1, 1.5, 0.5, 0.5,
1, -4.977352, -7.199419, 0, 1.5, 0.5, 0.5,
2, -4.977352, -7.199419, 0, -0.5, 0.5, 0.5,
2, -4.977352, -7.199419, 1, -0.5, 0.5, 0.5,
2, -4.977352, -7.199419, 1, 1.5, 0.5, 0.5,
2, -4.977352, -7.199419, 0, 1.5, 0.5, 0.5,
3, -4.977352, -7.199419, 0, -0.5, 0.5, 0.5,
3, -4.977352, -7.199419, 1, -0.5, 0.5, 0.5,
3, -4.977352, -7.199419, 1, 1.5, 0.5, 0.5,
3, -4.977352, -7.199419, 0, 1.5, 0.5, 0.5
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
-2.859712, -4, -6.32867,
-2.859712, 2, -6.32867,
-2.859712, -4, -6.32867,
-3.021842, -4, -6.61892,
-2.859712, -2, -6.32867,
-3.021842, -2, -6.61892,
-2.859712, 0, -6.32867,
-3.021842, 0, -6.61892,
-2.859712, 2, -6.32867,
-3.021842, 2, -6.61892
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
-3.346102, -4, -7.199419, 0, -0.5, 0.5, 0.5,
-3.346102, -4, -7.199419, 1, -0.5, 0.5, 0.5,
-3.346102, -4, -7.199419, 1, 1.5, 0.5, 0.5,
-3.346102, -4, -7.199419, 0, 1.5, 0.5, 0.5,
-3.346102, -2, -7.199419, 0, -0.5, 0.5, 0.5,
-3.346102, -2, -7.199419, 1, -0.5, 0.5, 0.5,
-3.346102, -2, -7.199419, 1, 1.5, 0.5, 0.5,
-3.346102, -2, -7.199419, 0, 1.5, 0.5, 0.5,
-3.346102, 0, -7.199419, 0, -0.5, 0.5, 0.5,
-3.346102, 0, -7.199419, 1, -0.5, 0.5, 0.5,
-3.346102, 0, -7.199419, 1, 1.5, 0.5, 0.5,
-3.346102, 0, -7.199419, 0, 1.5, 0.5, 0.5,
-3.346102, 2, -7.199419, 0, -0.5, 0.5, 0.5,
-3.346102, 2, -7.199419, 1, -0.5, 0.5, 0.5,
-3.346102, 2, -7.199419, 1, 1.5, 0.5, 0.5,
-3.346102, 2, -7.199419, 0, 1.5, 0.5, 0.5
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
-2.859712, -4.361133, -6,
-2.859712, -4.361133, 4,
-2.859712, -4.361133, -6,
-3.021842, -4.566539, -6,
-2.859712, -4.361133, -4,
-3.021842, -4.566539, -4,
-2.859712, -4.361133, -2,
-3.021842, -4.566539, -2,
-2.859712, -4.361133, 0,
-3.021842, -4.566539, 0,
-2.859712, -4.361133, 2,
-3.021842, -4.566539, 2,
-2.859712, -4.361133, 4,
-3.021842, -4.566539, 4
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
-3.346102, -4.977352, -6, 0, -0.5, 0.5, 0.5,
-3.346102, -4.977352, -6, 1, -0.5, 0.5, 0.5,
-3.346102, -4.977352, -6, 1, 1.5, 0.5, 0.5,
-3.346102, -4.977352, -6, 0, 1.5, 0.5, 0.5,
-3.346102, -4.977352, -4, 0, -0.5, 0.5, 0.5,
-3.346102, -4.977352, -4, 1, -0.5, 0.5, 0.5,
-3.346102, -4.977352, -4, 1, 1.5, 0.5, 0.5,
-3.346102, -4.977352, -4, 0, 1.5, 0.5, 0.5,
-3.346102, -4.977352, -2, 0, -0.5, 0.5, 0.5,
-3.346102, -4.977352, -2, 1, -0.5, 0.5, 0.5,
-3.346102, -4.977352, -2, 1, 1.5, 0.5, 0.5,
-3.346102, -4.977352, -2, 0, 1.5, 0.5, 0.5,
-3.346102, -4.977352, 0, 0, -0.5, 0.5, 0.5,
-3.346102, -4.977352, 0, 1, -0.5, 0.5, 0.5,
-3.346102, -4.977352, 0, 1, 1.5, 0.5, 0.5,
-3.346102, -4.977352, 0, 0, 1.5, 0.5, 0.5,
-3.346102, -4.977352, 2, 0, -0.5, 0.5, 0.5,
-3.346102, -4.977352, 2, 1, -0.5, 0.5, 0.5,
-3.346102, -4.977352, 2, 1, 1.5, 0.5, 0.5,
-3.346102, -4.977352, 2, 0, 1.5, 0.5, 0.5,
-3.346102, -4.977352, 4, 0, -0.5, 0.5, 0.5,
-3.346102, -4.977352, 4, 1, -0.5, 0.5, 0.5,
-3.346102, -4.977352, 4, 1, 1.5, 0.5, 0.5,
-3.346102, -4.977352, 4, 0, 1.5, 0.5, 0.5
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
-2.859712, -4.361133, -6.32867,
-2.859712, 3.855114, -6.32867,
-2.859712, -4.361133, 5.281313,
-2.859712, 3.855114, 5.281313,
-2.859712, -4.361133, -6.32867,
-2.859712, -4.361133, 5.281313,
-2.859712, 3.855114, -6.32867,
-2.859712, 3.855114, 5.281313,
-2.859712, -4.361133, -6.32867,
3.625489, -4.361133, -6.32867,
-2.859712, -4.361133, 5.281313,
3.625489, -4.361133, 5.281313,
-2.859712, 3.855114, -6.32867,
3.625489, 3.855114, -6.32867,
-2.859712, 3.855114, 5.281313,
3.625489, 3.855114, 5.281313,
3.625489, -4.361133, -6.32867,
3.625489, 3.855114, -6.32867,
3.625489, -4.361133, 5.281313,
3.625489, 3.855114, 5.281313,
3.625489, -4.361133, -6.32867,
3.625489, -4.361133, 5.281313,
3.625489, 3.855114, -6.32867,
3.625489, 3.855114, 5.281313
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
var radius = 8.34713;
var distance = 37.13733;
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
mvMatrix.translate( -0.3828887, 0.2530096, 0.5236783 );
mvMatrix.scale( 1.391643, 1.098443, 0.7773552 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.13733);
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
Diphenylketon<-read.table("Diphenylketon.xyz", skip=1)
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
-2.765267, -2.894337, -1.15665, 0, 0, 1, 1, 1,
-2.720776, 0.7585231, -2.53075, 1, 0, 0, 1, 1,
-2.598371, -0.7312307, -1.813312, 1, 0, 0, 1, 1,
-2.436733, -0.8081419, -2.705172, 1, 0, 0, 1, 1,
-2.415359, -2.421255, -2.910982, 1, 0, 0, 1, 1,
-2.337208, -0.910687, -3.23666, 1, 0, 0, 1, 1,
-2.32435, 0.6637385, -2.02387, 0, 0, 0, 1, 1,
-2.313908, 0.4345496, -0.289474, 0, 0, 0, 1, 1,
-2.295824, -0.9486495, -2.45396, 0, 0, 0, 1, 1,
-2.283222, -0.3431223, -2.171957, 0, 0, 0, 1, 1,
-2.282116, 0.3705928, -0.227241, 0, 0, 0, 1, 1,
-2.238386, -0.5378878, -1.732909, 0, 0, 0, 1, 1,
-2.220026, -1.786713, -3.150303, 0, 0, 0, 1, 1,
-2.184476, -0.6951013, -1.133539, 1, 1, 1, 1, 1,
-2.126934, 1.049584, -1.182087, 1, 1, 1, 1, 1,
-2.093264, -0.8779081, -4.334441, 1, 1, 1, 1, 1,
-2.074122, -0.8718722, -1.827543, 1, 1, 1, 1, 1,
-1.931384, -0.6466529, -2.37115, 1, 1, 1, 1, 1,
-1.904827, 1.35914, 0.2940834, 1, 1, 1, 1, 1,
-1.895658, -0.393939, -3.503564, 1, 1, 1, 1, 1,
-1.88144, 0.968454, -1.275249, 1, 1, 1, 1, 1,
-1.872581, 1.188639, -2.606555, 1, 1, 1, 1, 1,
-1.86585, -0.6023591, -0.3939115, 1, 1, 1, 1, 1,
-1.848157, 0.5754176, -2.351521, 1, 1, 1, 1, 1,
-1.844657, -1.189209, -1.700439, 1, 1, 1, 1, 1,
-1.820185, -0.02630354, -0.7691341, 1, 1, 1, 1, 1,
-1.818839, 0.8430126, -0.6155099, 1, 1, 1, 1, 1,
-1.801631, 2.933226, 0.4963312, 1, 1, 1, 1, 1,
-1.782526, -0.3962925, -0.4701038, 0, 0, 1, 1, 1,
-1.759959, -0.4115241, -1.317902, 1, 0, 0, 1, 1,
-1.737541, 0.3571196, -1.918396, 1, 0, 0, 1, 1,
-1.731446, 0.9179581, -1.28133, 1, 0, 0, 1, 1,
-1.72964, 0.1289804, -1.316018, 1, 0, 0, 1, 1,
-1.718773, -1.973931, -1.369101, 1, 0, 0, 1, 1,
-1.684771, 2.913309, -0.4809741, 0, 0, 0, 1, 1,
-1.684296, 0.709864, -0.3771839, 0, 0, 0, 1, 1,
-1.676646, 0.9277244, -1.116549, 0, 0, 0, 1, 1,
-1.631472, -1.113107, -1.253964, 0, 0, 0, 1, 1,
-1.628652, -0.2683565, -2.040649, 0, 0, 0, 1, 1,
-1.627836, 0.2388771, -0.9353188, 0, 0, 0, 1, 1,
-1.624619, 3.73546, -0.3147671, 0, 0, 0, 1, 1,
-1.622923, 0.9219792, -0.1615474, 1, 1, 1, 1, 1,
-1.620812, 1.638242, -2.009933, 1, 1, 1, 1, 1,
-1.618842, 0.3317967, -1.947869, 1, 1, 1, 1, 1,
-1.605162, 0.1986207, -2.09176, 1, 1, 1, 1, 1,
-1.601337, 0.8145725, -1.820957, 1, 1, 1, 1, 1,
-1.591954, 0.2590733, -2.312037, 1, 1, 1, 1, 1,
-1.576631, -0.2663725, -3.821846, 1, 1, 1, 1, 1,
-1.56329, 0.8973566, -1.132525, 1, 1, 1, 1, 1,
-1.55981, -0.0375576, -0.7270589, 1, 1, 1, 1, 1,
-1.549195, 0.4806757, -1.697486, 1, 1, 1, 1, 1,
-1.548277, -0.3952511, -1.317482, 1, 1, 1, 1, 1,
-1.524288, -1.20875, -0.5277656, 1, 1, 1, 1, 1,
-1.517819, 1.084702, -1.526749, 1, 1, 1, 1, 1,
-1.51063, -2.077266, -2.097393, 1, 1, 1, 1, 1,
-1.504573, 0.353011, -3.236046, 1, 1, 1, 1, 1,
-1.501214, 0.1920711, -1.829052, 0, 0, 1, 1, 1,
-1.49335, -0.6145825, -1.202129, 1, 0, 0, 1, 1,
-1.491547, 0.5069282, -1.342971, 1, 0, 0, 1, 1,
-1.483816, 0.5471687, -2.050851, 1, 0, 0, 1, 1,
-1.446332, 0.5265679, -1.456762, 1, 0, 0, 1, 1,
-1.44578, -0.5846459, -1.65178, 1, 0, 0, 1, 1,
-1.418785, -0.8118345, -3.026311, 0, 0, 0, 1, 1,
-1.410793, -1.136656, -0.4108695, 0, 0, 0, 1, 1,
-1.403601, 0.7603986, -1.819064, 0, 0, 0, 1, 1,
-1.397182, 0.4191924, -1.525409, 0, 0, 0, 1, 1,
-1.388364, 1.069182, -1.87974, 0, 0, 0, 1, 1,
-1.388011, 1.584593, -0.2353816, 0, 0, 0, 1, 1,
-1.387775, -0.2929958, -2.578386, 0, 0, 0, 1, 1,
-1.361041, 0.65102, -1.010549, 1, 1, 1, 1, 1,
-1.357169, -0.7207762, -0.4726519, 1, 1, 1, 1, 1,
-1.346832, 0.1826103, 1.23206, 1, 1, 1, 1, 1,
-1.307898, 0.4921714, -1.878979, 1, 1, 1, 1, 1,
-1.306583, 0.4385425, -3.294631, 1, 1, 1, 1, 1,
-1.304769, -0.9259026, -2.216856, 1, 1, 1, 1, 1,
-1.289853, 0.07299903, -3.00514, 1, 1, 1, 1, 1,
-1.283426, 0.004754094, -1.392234, 1, 1, 1, 1, 1,
-1.278048, 0.8728111, -1.887473, 1, 1, 1, 1, 1,
-1.26794, 0.3907102, -1.374516, 1, 1, 1, 1, 1,
-1.261375, 1.188527, -1.351321, 1, 1, 1, 1, 1,
-1.260953, 0.3830972, -0.728923, 1, 1, 1, 1, 1,
-1.257926, -1.344185, -2.496442, 1, 1, 1, 1, 1,
-1.257036, 1.404768, -0.8293856, 1, 1, 1, 1, 1,
-1.25591, 0.03507316, -0.6717839, 1, 1, 1, 1, 1,
-1.244602, 0.03093175, -0.8853683, 0, 0, 1, 1, 1,
-1.239457, 0.6824555, -0.2860943, 1, 0, 0, 1, 1,
-1.238643, 1.297328, -1.560475, 1, 0, 0, 1, 1,
-1.238639, 0.9932615, -1.205927, 1, 0, 0, 1, 1,
-1.234135, -0.6579337, -1.439341, 1, 0, 0, 1, 1,
-1.226297, -1.666457, -2.403478, 1, 0, 0, 1, 1,
-1.223781, 0.4791718, -0.8377178, 0, 0, 0, 1, 1,
-1.221032, -0.6696534, -2.161169, 0, 0, 0, 1, 1,
-1.219154, -0.800636, -4.439969, 0, 0, 0, 1, 1,
-1.206682, -0.4904638, -4.372715, 0, 0, 0, 1, 1,
-1.197122, 0.875659, -2.597091, 0, 0, 0, 1, 1,
-1.195817, 1.702114, -1.267419, 0, 0, 0, 1, 1,
-1.194925, 0.9185108, -1.640741, 0, 0, 0, 1, 1,
-1.193757, -0.02238116, -0.6864005, 1, 1, 1, 1, 1,
-1.189748, -0.1158159, -2.53199, 1, 1, 1, 1, 1,
-1.18506, 1.019008, -1.88229, 1, 1, 1, 1, 1,
-1.17822, -0.1048831, 0.05631449, 1, 1, 1, 1, 1,
-1.176871, -0.1542076, -1.603295, 1, 1, 1, 1, 1,
-1.175744, 0.3091886, -3.46525, 1, 1, 1, 1, 1,
-1.172421, -0.1729634, -2.994835, 1, 1, 1, 1, 1,
-1.171913, 0.9061657, -2.532854, 1, 1, 1, 1, 1,
-1.170293, -0.7906317, -2.171314, 1, 1, 1, 1, 1,
-1.168433, 0.450063, -1.565061, 1, 1, 1, 1, 1,
-1.166387, 0.7701764, -2.542027, 1, 1, 1, 1, 1,
-1.164404, -1.589893, -1.705541, 1, 1, 1, 1, 1,
-1.163607, 0.9472148, -1.700889, 1, 1, 1, 1, 1,
-1.162492, -0.1574868, -1.958709, 1, 1, 1, 1, 1,
-1.160568, 0.1193265, -1.653223, 1, 1, 1, 1, 1,
-1.160556, 2.729869, -0.0375342, 0, 0, 1, 1, 1,
-1.157871, -0.5884677, -1.212875, 1, 0, 0, 1, 1,
-1.144766, -0.3688404, -2.446332, 1, 0, 0, 1, 1,
-1.135316, 0.5148576, -0.9923742, 1, 0, 0, 1, 1,
-1.134503, 0.8729157, -0.4215818, 1, 0, 0, 1, 1,
-1.122764, 0.5345882, -2.095514, 1, 0, 0, 1, 1,
-1.119732, 1.553512, -1.633501, 0, 0, 0, 1, 1,
-1.109892, -1.220681, -2.495895, 0, 0, 0, 1, 1,
-1.108428, -2.009079, -2.630468, 0, 0, 0, 1, 1,
-1.103962, -0.381466, -4.235084, 0, 0, 0, 1, 1,
-1.100468, -0.2304947, -0.5137805, 0, 0, 0, 1, 1,
-1.099714, 0.4025273, -2.286478, 0, 0, 0, 1, 1,
-1.098906, 1.112575, -1.047373, 0, 0, 0, 1, 1,
-1.098382, 0.7142853, -1.075548, 1, 1, 1, 1, 1,
-1.097743, -0.7400077, -0.2124628, 1, 1, 1, 1, 1,
-1.093538, -0.02683497, -1.410943, 1, 1, 1, 1, 1,
-1.090822, -0.3164825, -2.517772, 1, 1, 1, 1, 1,
-1.084962, -2.868451, -3.838106, 1, 1, 1, 1, 1,
-1.078049, -1.291605, -1.022619, 1, 1, 1, 1, 1,
-1.069258, 0.1507961, -1.187131, 1, 1, 1, 1, 1,
-1.065705, 1.868697, -0.6622484, 1, 1, 1, 1, 1,
-1.057453, -0.7748733, -2.807306, 1, 1, 1, 1, 1,
-1.051129, -1.491841, -3.876019, 1, 1, 1, 1, 1,
-1.049078, -0.8334135, -3.002985, 1, 1, 1, 1, 1,
-1.04621, -0.6411102, -2.332775, 1, 1, 1, 1, 1,
-1.043616, 0.2084617, -2.325294, 1, 1, 1, 1, 1,
-1.040376, 0.1505281, -1.378509, 1, 1, 1, 1, 1,
-1.036476, -1.054552, -2.807405, 1, 1, 1, 1, 1,
-1.02951, -1.630847, -2.946067, 0, 0, 1, 1, 1,
-1.029339, -0.2988577, -2.22076, 1, 0, 0, 1, 1,
-1.028268, -1.47171, -0.6718188, 1, 0, 0, 1, 1,
-1.028066, -1.307012, -2.858347, 1, 0, 0, 1, 1,
-1.023162, 1.060517, -1.466867, 1, 0, 0, 1, 1,
-1.021844, -2.31197, -2.26867, 1, 0, 0, 1, 1,
-1.02014, -1.229468, -2.529826, 0, 0, 0, 1, 1,
-1.017227, 0.6959333, 0.07766839, 0, 0, 0, 1, 1,
-1.014851, -1.319709, -3.562767, 0, 0, 0, 1, 1,
-1.013077, -0.760711, -3.380096, 0, 0, 0, 1, 1,
-1.010498, 0.4617366, -0.7168015, 0, 0, 0, 1, 1,
-1.009326, 1.261487, -0.27899, 0, 0, 0, 1, 1,
-1.002808, 0.8192744, -0.08253268, 0, 0, 0, 1, 1,
-0.9951456, 0.4428725, -0.2882027, 1, 1, 1, 1, 1,
-0.9905713, 0.5099331, -0.01747686, 1, 1, 1, 1, 1,
-0.979039, -0.1354067, -1.699792, 1, 1, 1, 1, 1,
-0.9777207, -0.7598729, -2.159277, 1, 1, 1, 1, 1,
-0.9728149, -0.8561701, -1.439413, 1, 1, 1, 1, 1,
-0.9673317, -1.363533, -3.395397, 1, 1, 1, 1, 1,
-0.9603519, 0.4757071, 0.6850121, 1, 1, 1, 1, 1,
-0.9592993, -1.358192, -4.162644, 1, 1, 1, 1, 1,
-0.9576896, 0.3127424, -0.124137, 1, 1, 1, 1, 1,
-0.9571998, 0.1016074, -1.960065, 1, 1, 1, 1, 1,
-0.9543033, -1.544245, -3.531785, 1, 1, 1, 1, 1,
-0.9487109, 0.2660714, -0.03736096, 1, 1, 1, 1, 1,
-0.9481457, -0.3920258, -1.389425, 1, 1, 1, 1, 1,
-0.9427884, 0.3271839, -1.981993, 1, 1, 1, 1, 1,
-0.9285257, -0.3611276, -1.725737, 1, 1, 1, 1, 1,
-0.9237041, 1.345769, 0.5661966, 0, 0, 1, 1, 1,
-0.9234935, 1.757364, 0.5603188, 1, 0, 0, 1, 1,
-0.923267, -0.8572153, -1.631727, 1, 0, 0, 1, 1,
-0.9211485, 1.221407, -0.4778831, 1, 0, 0, 1, 1,
-0.9201709, 1.656708, -1.078861, 1, 0, 0, 1, 1,
-0.9080425, 0.06385011, -1.44798, 1, 0, 0, 1, 1,
-0.9048305, 1.01253, -0.4850034, 0, 0, 0, 1, 1,
-0.9004765, -1.062572, -2.212849, 0, 0, 0, 1, 1,
-0.8983648, 0.5692254, 0.2359323, 0, 0, 0, 1, 1,
-0.8911775, -0.2031633, -1.640219, 0, 0, 0, 1, 1,
-0.8888118, -0.4577574, -1.481912, 0, 0, 0, 1, 1,
-0.8887447, -1.226018, -3.786295, 0, 0, 0, 1, 1,
-0.8874509, 0.110373, -1.20516, 0, 0, 0, 1, 1,
-0.8873081, -0.1689491, -0.4062131, 1, 1, 1, 1, 1,
-0.8863217, -0.6254402, -3.672561, 1, 1, 1, 1, 1,
-0.8851943, -1.271186, -2.691557, 1, 1, 1, 1, 1,
-0.8847434, 0.5110214, -0.2373102, 1, 1, 1, 1, 1,
-0.883705, -1.275773, -4.630083, 1, 1, 1, 1, 1,
-0.8819175, 0.1413279, -2.340487, 1, 1, 1, 1, 1,
-0.8725737, -0.433165, -0.7577636, 1, 1, 1, 1, 1,
-0.8721108, -1.022553, -1.467059, 1, 1, 1, 1, 1,
-0.8711178, 0.1198558, -0.3705793, 1, 1, 1, 1, 1,
-0.8682656, 0.004741685, -1.261236, 1, 1, 1, 1, 1,
-0.8681344, -0.771058, -1.500515, 1, 1, 1, 1, 1,
-0.8622385, -0.127396, 0.1123948, 1, 1, 1, 1, 1,
-0.8555424, -0.8995807, -2.460347, 1, 1, 1, 1, 1,
-0.8543752, -0.2594815, -1.049109, 1, 1, 1, 1, 1,
-0.8455499, -0.9456104, -2.645113, 1, 1, 1, 1, 1,
-0.8432299, 1.092682, -1.090634, 0, 0, 1, 1, 1,
-0.8418048, -1.508652, -1.172724, 1, 0, 0, 1, 1,
-0.8410898, -1.300281, -0.5343593, 1, 0, 0, 1, 1,
-0.8337274, 0.4079187, -0.3399453, 1, 0, 0, 1, 1,
-0.8315468, -0.04711413, -0.9964417, 1, 0, 0, 1, 1,
-0.8291214, -0.6377103, -2.635226, 1, 0, 0, 1, 1,
-0.8276722, -0.5621856, -2.726139, 0, 0, 0, 1, 1,
-0.8258561, 0.8298065, -1.97776, 0, 0, 0, 1, 1,
-0.8250265, 0.4074469, -1.040443, 0, 0, 0, 1, 1,
-0.8100249, -1.343372, -3.331276, 0, 0, 0, 1, 1,
-0.8079143, 0.890233, 0.0992163, 0, 0, 0, 1, 1,
-0.8035436, -0.8604812, -2.962239, 0, 0, 0, 1, 1,
-0.8033904, 0.2342682, -3.056942, 0, 0, 0, 1, 1,
-0.8000247, 1.336399, 0.3271843, 1, 1, 1, 1, 1,
-0.7934433, -0.04568341, -3.49982, 1, 1, 1, 1, 1,
-0.7897077, -1.667838, -2.954715, 1, 1, 1, 1, 1,
-0.7858425, -0.6439382, -2.041662, 1, 1, 1, 1, 1,
-0.7804639, 0.01067068, -1.663231, 1, 1, 1, 1, 1,
-0.7770464, 0.3886769, 0.1587599, 1, 1, 1, 1, 1,
-0.7719071, 1.396224, 0.05645612, 1, 1, 1, 1, 1,
-0.7694811, -1.80334, -2.179723, 1, 1, 1, 1, 1,
-0.7691734, 1.064688, 0.4695873, 1, 1, 1, 1, 1,
-0.7659065, 1.577752, -0.9077384, 1, 1, 1, 1, 1,
-0.7639452, 1.085393, 1.166188, 1, 1, 1, 1, 1,
-0.7633492, -0.3934181, -2.397185, 1, 1, 1, 1, 1,
-0.7628458, -1.399613, -3.368753, 1, 1, 1, 1, 1,
-0.7613976, -0.5016579, -2.72183, 1, 1, 1, 1, 1,
-0.7563668, -0.3785458, -2.847927, 1, 1, 1, 1, 1,
-0.7524272, -1.048015, -0.9349349, 0, 0, 1, 1, 1,
-0.7512449, 0.7865244, 0.1986344, 1, 0, 0, 1, 1,
-0.7414408, -1.622467, -2.112729, 1, 0, 0, 1, 1,
-0.7395661, -0.9637171, -3.387836, 1, 0, 0, 1, 1,
-0.7374874, 1.087768, 1.69851, 1, 0, 0, 1, 1,
-0.7369036, 1.121688, -0.9552945, 1, 0, 0, 1, 1,
-0.7052172, -0.6375172, -2.390064, 0, 0, 0, 1, 1,
-0.7009701, 0.5847773, -0.8482338, 0, 0, 0, 1, 1,
-0.6980276, -0.02247027, -1.539879, 0, 0, 0, 1, 1,
-0.6970419, -0.9944525, -2.673969, 0, 0, 0, 1, 1,
-0.6958101, 1.462976, 0.6147707, 0, 0, 0, 1, 1,
-0.6902539, -1.806411, -2.686236, 0, 0, 0, 1, 1,
-0.6888762, -1.017429, -2.878154, 0, 0, 0, 1, 1,
-0.6881006, -1.831583, -1.419659, 1, 1, 1, 1, 1,
-0.6839862, -1.241352, -0.6065203, 1, 1, 1, 1, 1,
-0.6817222, -0.02230031, -2.945985, 1, 1, 1, 1, 1,
-0.6797488, -0.4216205, -2.506373, 1, 1, 1, 1, 1,
-0.6712309, 1.131974, -0.9932387, 1, 1, 1, 1, 1,
-0.6647563, -0.480038, -0.3306838, 1, 1, 1, 1, 1,
-0.6633092, 0.259882, -3.334371, 1, 1, 1, 1, 1,
-0.6623771, 1.028798, -1.000857, 1, 1, 1, 1, 1,
-0.6545365, 0.5789331, -0.9303138, 1, 1, 1, 1, 1,
-0.6489812, 0.0653609, -1.073297, 1, 1, 1, 1, 1,
-0.6488645, 1.303436, -0.6009545, 1, 1, 1, 1, 1,
-0.6456546, -0.07621662, -1.056073, 1, 1, 1, 1, 1,
-0.6424266, 0.3410391, -0.4206658, 1, 1, 1, 1, 1,
-0.6417113, -1.334194, -0.8848738, 1, 1, 1, 1, 1,
-0.6394905, -0.03538001, -2.413323, 1, 1, 1, 1, 1,
-0.6339915, -1.953029, -2.85497, 0, 0, 1, 1, 1,
-0.6329195, -1.637471, -2.314039, 1, 0, 0, 1, 1,
-0.6320048, 1.714272, 0.1508815, 1, 0, 0, 1, 1,
-0.6288397, -1.688282, -4.748849, 1, 0, 0, 1, 1,
-0.6266246, 0.8433071, -0.3666032, 1, 0, 0, 1, 1,
-0.6260589, -0.7832515, -2.689272, 1, 0, 0, 1, 1,
-0.6245074, -1.029204, -1.349448, 0, 0, 0, 1, 1,
-0.6184453, 0.8912607, -0.7749215, 0, 0, 0, 1, 1,
-0.6181188, -0.589854, -2.332294, 0, 0, 0, 1, 1,
-0.6084101, -2.483655, -2.359675, 0, 0, 0, 1, 1,
-0.6072698, 0.9863953, -0.3039649, 0, 0, 0, 1, 1,
-0.6062113, 1.845362, -1.212071, 0, 0, 0, 1, 1,
-0.6058029, -0.03188371, -1.630643, 0, 0, 0, 1, 1,
-0.5962849, 1.056932, -0.02930839, 1, 1, 1, 1, 1,
-0.5961592, -0.9023328, -0.9961956, 1, 1, 1, 1, 1,
-0.595735, -1.265139, -4.160865, 1, 1, 1, 1, 1,
-0.5886523, -2.44691, -4.871836, 1, 1, 1, 1, 1,
-0.5873197, -1.474327, -3.649296, 1, 1, 1, 1, 1,
-0.580546, 0.6264176, -2.041167, 1, 1, 1, 1, 1,
-0.5779027, -0.02833547, -1.958944, 1, 1, 1, 1, 1,
-0.5749046, -0.6571213, -3.386639, 1, 1, 1, 1, 1,
-0.5648735, 1.080829, -0.3503943, 1, 1, 1, 1, 1,
-0.561834, -0.6331387, -2.985145, 1, 1, 1, 1, 1,
-0.5586885, -0.2066027, -4.007489, 1, 1, 1, 1, 1,
-0.5541896, 0.965279, 0.6860247, 1, 1, 1, 1, 1,
-0.5532505, 0.3033846, -0.6874825, 1, 1, 1, 1, 1,
-0.5523011, -0.9099856, -3.075473, 1, 1, 1, 1, 1,
-0.5520985, -2.002662, -3.698992, 1, 1, 1, 1, 1,
-0.5482013, 0.5265577, -1.590148, 0, 0, 1, 1, 1,
-0.542963, 1.257091, 0.2925503, 1, 0, 0, 1, 1,
-0.5405063, -0.9272974, -1.604189, 1, 0, 0, 1, 1,
-0.5393482, 1.286139, 1.242261, 1, 0, 0, 1, 1,
-0.5390708, -0.5232548, -2.620007, 1, 0, 0, 1, 1,
-0.5390171, 1.570836, -0.497616, 1, 0, 0, 1, 1,
-0.5387237, 1.143303, 0.6534046, 0, 0, 0, 1, 1,
-0.5362502, -0.605573, -3.10989, 0, 0, 0, 1, 1,
-0.5337325, 0.8018396, -0.01898763, 0, 0, 0, 1, 1,
-0.5293248, -0.01075938, -1.580664, 0, 0, 0, 1, 1,
-0.5280409, 1.474969, 0.4997814, 0, 0, 0, 1, 1,
-0.527235, -0.3893303, -2.834358, 0, 0, 0, 1, 1,
-0.5234167, 1.420745, -0.8481112, 0, 0, 0, 1, 1,
-0.5224752, 0.570309, -1.283448, 1, 1, 1, 1, 1,
-0.5209349, 0.5226023, -0.898769, 1, 1, 1, 1, 1,
-0.5183948, 1.602377, 0.6661659, 1, 1, 1, 1, 1,
-0.5176774, -0.1556794, -1.971193, 1, 1, 1, 1, 1,
-0.517563, 0.6137835, 0.8897732, 1, 1, 1, 1, 1,
-0.5131868, 1.259078, -1.295774, 1, 1, 1, 1, 1,
-0.5124831, -0.2530538, -2.381628, 1, 1, 1, 1, 1,
-0.5105979, 1.472296, -0.4984995, 1, 1, 1, 1, 1,
-0.5103711, 0.8480608, 0.2422698, 1, 1, 1, 1, 1,
-0.5060959, -0.8010183, -1.977072, 1, 1, 1, 1, 1,
-0.4992728, 1.020704, -1.472071, 1, 1, 1, 1, 1,
-0.4988296, 0.3752573, 0.8035541, 1, 1, 1, 1, 1,
-0.4975873, 1.167122, 0.6766933, 1, 1, 1, 1, 1,
-0.4964393, 0.7746922, -0.1804285, 1, 1, 1, 1, 1,
-0.4910424, 0.1625502, -1.568109, 1, 1, 1, 1, 1,
-0.4895562, -1.488899, -5.221259, 0, 0, 1, 1, 1,
-0.4874604, -1.556543, -2.312564, 1, 0, 0, 1, 1,
-0.4846388, -0.7734413, -2.923055, 1, 0, 0, 1, 1,
-0.483549, -0.114326, -0.1608464, 1, 0, 0, 1, 1,
-0.4807791, 0.231005, -1.735405, 1, 0, 0, 1, 1,
-0.4790787, 0.5949907, 0.3845955, 1, 0, 0, 1, 1,
-0.4774106, -1.311543, -2.881958, 0, 0, 0, 1, 1,
-0.474583, -1.110505, -1.174605, 0, 0, 0, 1, 1,
-0.4742473, -0.1370938, -2.872613, 0, 0, 0, 1, 1,
-0.4739275, -0.4208986, -3.03719, 0, 0, 0, 1, 1,
-0.4730527, -0.5768223, -1.902473, 0, 0, 0, 1, 1,
-0.4718136, 0.4801191, -0.6436644, 0, 0, 0, 1, 1,
-0.4715572, 0.02933499, -0.300898, 0, 0, 0, 1, 1,
-0.4707945, 1.009781, -2.098879, 1, 1, 1, 1, 1,
-0.4694784, 0.5037403, -0.9189708, 1, 1, 1, 1, 1,
-0.4651359, -0.3923273, -2.156702, 1, 1, 1, 1, 1,
-0.4614405, -2.55883, -3.211732, 1, 1, 1, 1, 1,
-0.4595991, -0.9913898, -1.11394, 1, 1, 1, 1, 1,
-0.4551118, -0.4602337, -2.626188, 1, 1, 1, 1, 1,
-0.4545367, 0.0005173032, -2.601405, 1, 1, 1, 1, 1,
-0.4527577, 1.214346, 0.7539127, 1, 1, 1, 1, 1,
-0.4513767, -0.297493, -3.124637, 1, 1, 1, 1, 1,
-0.4480259, 1.924821, 0.1504052, 1, 1, 1, 1, 1,
-0.4479153, -0.5145951, -3.9823, 1, 1, 1, 1, 1,
-0.4442443, 0.9006518, 0.2455733, 1, 1, 1, 1, 1,
-0.4438571, 0.3763348, -2.22006, 1, 1, 1, 1, 1,
-0.4428323, 0.5915742, -1.570919, 1, 1, 1, 1, 1,
-0.4423395, 1.345267, -1.39759, 1, 1, 1, 1, 1,
-0.437051, -1.39424, -3.996432, 0, 0, 1, 1, 1,
-0.4250336, -0.5420033, -1.481979, 1, 0, 0, 1, 1,
-0.4241504, -1.40621, -4.609034, 1, 0, 0, 1, 1,
-0.42254, 1.16264, -0.6782808, 1, 0, 0, 1, 1,
-0.4224739, 0.6238163, -0.2435842, 1, 0, 0, 1, 1,
-0.4212559, -0.7109876, -2.039755, 1, 0, 0, 1, 1,
-0.4198385, 0.9126403, -0.8147987, 0, 0, 0, 1, 1,
-0.4178502, -2.381697, -0.6123177, 0, 0, 0, 1, 1,
-0.4166379, 0.1969663, -1.057857, 0, 0, 0, 1, 1,
-0.4107611, 0.6835451, -0.5841306, 0, 0, 0, 1, 1,
-0.4099476, 1.215669, 0.2797323, 0, 0, 0, 1, 1,
-0.4084297, 0.6672528, 1.463636, 0, 0, 0, 1, 1,
-0.4030524, 0.7321557, -1.127444, 0, 0, 0, 1, 1,
-0.401492, -2.259938, -3.576724, 1, 1, 1, 1, 1,
-0.3991751, -0.4568864, -3.249724, 1, 1, 1, 1, 1,
-0.3982212, -0.6594586, -5.093872, 1, 1, 1, 1, 1,
-0.3968845, -0.3687786, -3.042234, 1, 1, 1, 1, 1,
-0.3954186, 1.059001, -0.572379, 1, 1, 1, 1, 1,
-0.3911919, -0.5637065, -2.660118, 1, 1, 1, 1, 1,
-0.3907083, -0.9804111, -4.60445, 1, 1, 1, 1, 1,
-0.385368, -0.4356252, -3.05428, 1, 1, 1, 1, 1,
-0.3823603, -0.8835006, -1.914, 1, 1, 1, 1, 1,
-0.3791236, -1.00279, -3.814095, 1, 1, 1, 1, 1,
-0.3787833, 0.09326655, -3.327943, 1, 1, 1, 1, 1,
-0.3640317, 0.6897357, 0.04554946, 1, 1, 1, 1, 1,
-0.3600427, 0.9308293, -0.371837, 1, 1, 1, 1, 1,
-0.3596861, -0.884675, -2.257486, 1, 1, 1, 1, 1,
-0.3582487, -0.05868426, -2.043832, 1, 1, 1, 1, 1,
-0.3549054, -0.4508078, -3.516098, 0, 0, 1, 1, 1,
-0.3542404, 2.203458, 0.6828969, 1, 0, 0, 1, 1,
-0.3479802, 0.8462303, -1.325741, 1, 0, 0, 1, 1,
-0.3448579, -0.5161101, -2.635074, 1, 0, 0, 1, 1,
-0.3423634, 0.6356205, 0.5030695, 1, 0, 0, 1, 1,
-0.3406625, 0.2618159, -2.463384, 1, 0, 0, 1, 1,
-0.3386759, -1.289123, -2.391987, 0, 0, 0, 1, 1,
-0.3225205, 0.9914168, -1.919421, 0, 0, 0, 1, 1,
-0.3178363, -1.057157, -4.600063, 0, 0, 0, 1, 1,
-0.3159068, 0.9347072, 1.703653, 0, 0, 0, 1, 1,
-0.3150512, 1.689979, 0.6111397, 0, 0, 0, 1, 1,
-0.3149606, 0.7247965, -2.203853, 0, 0, 0, 1, 1,
-0.3061344, -1.076477, -0.901734, 0, 0, 0, 1, 1,
-0.3042522, -0.4448706, -0.7938408, 1, 1, 1, 1, 1,
-0.2996041, -1.091006, -4.248129, 1, 1, 1, 1, 1,
-0.2953362, 0.4555377, -1.531759, 1, 1, 1, 1, 1,
-0.2927446, -0.4617867, -2.275852, 1, 1, 1, 1, 1,
-0.2905571, -0.06871498, -2.895733, 1, 1, 1, 1, 1,
-0.2898687, -0.3488681, -2.886109, 1, 1, 1, 1, 1,
-0.2883737, 1.564337, -1.09669, 1, 1, 1, 1, 1,
-0.2868621, 0.2708658, -1.399182, 1, 1, 1, 1, 1,
-0.2866164, -0.6701207, -2.670528, 1, 1, 1, 1, 1,
-0.284896, 0.02804097, -3.733555, 1, 1, 1, 1, 1,
-0.2790771, 1.757594, -0.5402628, 1, 1, 1, 1, 1,
-0.2780848, 0.7087561, -0.3463388, 1, 1, 1, 1, 1,
-0.273059, 0.2256498, 1.466494, 1, 1, 1, 1, 1,
-0.2729185, 1.401646, -0.8905164, 1, 1, 1, 1, 1,
-0.2725691, 0.8657558, 1.75517, 1, 1, 1, 1, 1,
-0.2708691, -0.7208399, -3.737065, 0, 0, 1, 1, 1,
-0.2646339, 0.239861, 0.838537, 1, 0, 0, 1, 1,
-0.2631605, -1.268098, -3.536585, 1, 0, 0, 1, 1,
-0.262791, -1.570287, -1.400535, 1, 0, 0, 1, 1,
-0.2615992, 0.8332123, 1.077834, 1, 0, 0, 1, 1,
-0.257233, 0.5561754, -0.7128928, 1, 0, 0, 1, 1,
-0.2569937, -2.251263, -4.314304, 0, 0, 0, 1, 1,
-0.2557791, -1.207194, -1.9312, 0, 0, 0, 1, 1,
-0.2490016, -0.8005616, -3.440095, 0, 0, 0, 1, 1,
-0.248555, 1.37859, 0.08157446, 0, 0, 0, 1, 1,
-0.2467651, 1.337103, -0.5052917, 0, 0, 0, 1, 1,
-0.2466299, 0.7966174, -0.493825, 0, 0, 0, 1, 1,
-0.2410516, -0.7889176, -4.994709, 0, 0, 0, 1, 1,
-0.241018, -1.696323, -3.222262, 1, 1, 1, 1, 1,
-0.24093, -0.900487, -2.495712, 1, 1, 1, 1, 1,
-0.2383229, -0.2440963, -2.945505, 1, 1, 1, 1, 1,
-0.235561, 2.033682, -0.5558588, 1, 1, 1, 1, 1,
-0.219462, 0.04374347, -0.5582298, 1, 1, 1, 1, 1,
-0.2173838, 1.129128, 0.04612374, 1, 1, 1, 1, 1,
-0.2140795, -0.05862966, -2.605102, 1, 1, 1, 1, 1,
-0.2066914, -0.9190262, -2.30695, 1, 1, 1, 1, 1,
-0.2019065, 1.029875, -0.5896703, 1, 1, 1, 1, 1,
-0.201817, -0.8700097, -2.406457, 1, 1, 1, 1, 1,
-0.1991513, -0.925759, -2.361186, 1, 1, 1, 1, 1,
-0.1975728, -0.3009097, -4.338725, 1, 1, 1, 1, 1,
-0.1972557, -0.5790799, -1.903195, 1, 1, 1, 1, 1,
-0.192972, -0.693528, -2.834565, 1, 1, 1, 1, 1,
-0.1913091, 0.0149666, -2.924441, 1, 1, 1, 1, 1,
-0.1897397, 1.000021, -1.521629, 0, 0, 1, 1, 1,
-0.1895806, 0.4776369, -1.459361, 1, 0, 0, 1, 1,
-0.1890989, -1.060086, -3.129109, 1, 0, 0, 1, 1,
-0.1878055, 0.4574255, -0.3066449, 1, 0, 0, 1, 1,
-0.185463, 1.47267, 0.7877243, 1, 0, 0, 1, 1,
-0.1837823, -0.6706334, -3.179058, 1, 0, 0, 1, 1,
-0.1835608, 0.2106548, -2.322188, 0, 0, 0, 1, 1,
-0.1814943, 1.62144, 0.3393084, 0, 0, 0, 1, 1,
-0.1732911, -1.201181, -2.614209, 0, 0, 0, 1, 1,
-0.1725394, -0.8777499, -3.030231, 0, 0, 0, 1, 1,
-0.1720127, 0.8182392, 0.110699, 0, 0, 0, 1, 1,
-0.1669307, -0.3395893, -2.925525, 0, 0, 0, 1, 1,
-0.1667209, 1.115191, 0.9535567, 0, 0, 0, 1, 1,
-0.1631225, 1.601332, 0.6823034, 1, 1, 1, 1, 1,
-0.1623845, -0.6512847, -3.601382, 1, 1, 1, 1, 1,
-0.1596985, 1.015182, -1.202941, 1, 1, 1, 1, 1,
-0.157814, 1.237921, 1.731054, 1, 1, 1, 1, 1,
-0.1521425, 0.6969157, -2.375735, 1, 1, 1, 1, 1,
-0.1476558, 1.870714, -1.741006, 1, 1, 1, 1, 1,
-0.1413156, 0.1207333, 1.189219, 1, 1, 1, 1, 1,
-0.1380095, 0.4568576, -0.884827, 1, 1, 1, 1, 1,
-0.1292733, 0.5517528, 1.302203, 1, 1, 1, 1, 1,
-0.1284262, 0.6905649, -0.1631266, 1, 1, 1, 1, 1,
-0.128199, 0.8894253, -1.318364, 1, 1, 1, 1, 1,
-0.128038, 0.8849077, 0.6188121, 1, 1, 1, 1, 1,
-0.1276223, -1.430864, -3.105879, 1, 1, 1, 1, 1,
-0.1240685, 0.2017022, -1.572689, 1, 1, 1, 1, 1,
-0.1191439, 0.8995246, -0.7998932, 1, 1, 1, 1, 1,
-0.1156521, -0.4402467, -4.968731, 0, 0, 1, 1, 1,
-0.11439, -1.127438, -3.264764, 1, 0, 0, 1, 1,
-0.1090221, -0.969645, -1.3527, 1, 0, 0, 1, 1,
-0.1051364, -0.6318635, -3.014791, 1, 0, 0, 1, 1,
-0.1035729, -0.2847273, -2.456682, 1, 0, 0, 1, 1,
-0.1025632, -0.5184047, -3.603328, 1, 0, 0, 1, 1,
-0.09815903, 1.144234, 1.78289, 0, 0, 0, 1, 1,
-0.09597766, -1.708083, -2.883228, 0, 0, 0, 1, 1,
-0.0959477, -0.3183303, -2.550943, 0, 0, 0, 1, 1,
-0.09305913, -2.29319, -3.519083, 0, 0, 0, 1, 1,
-0.09007717, 0.6544735, -1.459514, 0, 0, 0, 1, 1,
-0.07991085, 1.34074, 0.5996462, 0, 0, 0, 1, 1,
-0.07958031, -0.6281525, -3.77684, 0, 0, 0, 1, 1,
-0.0755109, -0.1607639, -3.942543, 1, 1, 1, 1, 1,
-0.07264062, 0.5786703, -1.703228, 1, 1, 1, 1, 1,
-0.07096206, -3.125203, -3.961228, 1, 1, 1, 1, 1,
-0.06977454, -0.6326443, -2.908187, 1, 1, 1, 1, 1,
-0.06558505, 2.72382, 0.5109789, 1, 1, 1, 1, 1,
-0.06414238, -0.4555893, -2.795873, 1, 1, 1, 1, 1,
-0.06214735, -0.7974095, -2.86434, 1, 1, 1, 1, 1,
-0.06136753, -1.047249, -4.0608, 1, 1, 1, 1, 1,
-0.06053342, 0.5510941, -1.282031, 1, 1, 1, 1, 1,
-0.05953259, 0.545868, -1.418615, 1, 1, 1, 1, 1,
-0.05939107, 0.7738716, -0.3721361, 1, 1, 1, 1, 1,
-0.05416906, -0.4902017, -2.93555, 1, 1, 1, 1, 1,
-0.05310062, -0.264832, -2.397362, 1, 1, 1, 1, 1,
-0.0529558, -0.8365313, -2.952343, 1, 1, 1, 1, 1,
-0.0508041, -2.91891, -2.688506, 1, 1, 1, 1, 1,
-0.04840649, -0.7689433, -6.159593, 0, 0, 1, 1, 1,
-0.04816987, -1.166924, -3.351527, 1, 0, 0, 1, 1,
-0.04315403, 1.989491, 0.02362677, 1, 0, 0, 1, 1,
-0.04271176, -0.1928161, -1.390147, 1, 0, 0, 1, 1,
-0.03918292, 0.4010753, -0.8201712, 1, 0, 0, 1, 1,
-0.03716013, -0.1858135, -2.982001, 1, 0, 0, 1, 1,
-0.02824546, 0.03852544, -1.888045, 0, 0, 0, 1, 1,
-0.02809211, 1.582227, -1.082582, 0, 0, 0, 1, 1,
-0.01961567, -1.014425, -2.880115, 0, 0, 0, 1, 1,
-0.01598861, 1.190865, -0.9339762, 0, 0, 0, 1, 1,
-0.01585844, 1.701869, 0.1336052, 0, 0, 0, 1, 1,
-0.01580191, -2.104704, -2.505295, 0, 0, 0, 1, 1,
-0.01312555, -0.2056437, -2.60106, 0, 0, 0, 1, 1,
-0.01234264, 0.007537568, -1.479721, 1, 1, 1, 1, 1,
-0.01163823, 0.6268753, 0.8972625, 1, 1, 1, 1, 1,
-0.009323456, -1.233742, -1.909107, 1, 1, 1, 1, 1,
-0.007543136, -1.57795, -3.44524, 1, 1, 1, 1, 1,
-0.005466864, 1.373572, 0.2454153, 1, 1, 1, 1, 1,
-0.005117592, -1.786815, -4.470013, 1, 1, 1, 1, 1,
-0.003240437, -4.241479, -2.253552, 1, 1, 1, 1, 1,
-0.000597117, 1.452693, -0.08734856, 1, 1, 1, 1, 1,
0.0004340834, 0.8174913, -0.4873462, 1, 1, 1, 1, 1,
0.002894238, -0.6827276, 2.402944, 1, 1, 1, 1, 1,
0.006035915, 0.1082332, -3.426846, 1, 1, 1, 1, 1,
0.007142972, -0.4544624, 4.426364, 1, 1, 1, 1, 1,
0.01657813, 0.8630012, 0.3515648, 1, 1, 1, 1, 1,
0.01809911, -1.659139, 2.485563, 1, 1, 1, 1, 1,
0.02113971, -0.1380939, 2.465616, 1, 1, 1, 1, 1,
0.02332555, -0.1353047, 1.480021, 0, 0, 1, 1, 1,
0.02384188, -0.5255973, 3.014654, 1, 0, 0, 1, 1,
0.0251352, 0.8555355, 0.9063244, 1, 0, 0, 1, 1,
0.02681424, 1.067945, -0.5981179, 1, 0, 0, 1, 1,
0.02800666, 0.6080471, 1.576159, 1, 0, 0, 1, 1,
0.02967376, 0.5351728, 1.221924, 1, 0, 0, 1, 1,
0.03939776, -1.469853, 3.229965, 0, 0, 0, 1, 1,
0.04326267, 1.915989, 1.965717, 0, 0, 0, 1, 1,
0.04515929, -1.273289, 4.166273, 0, 0, 0, 1, 1,
0.04903673, -0.1787065, 1.696411, 0, 0, 0, 1, 1,
0.04998479, 1.145671, -1.934043, 0, 0, 0, 1, 1,
0.05347404, -0.9332047, 2.925768, 0, 0, 0, 1, 1,
0.05737099, -0.757578, 3.251937, 0, 0, 0, 1, 1,
0.05911522, 0.4432558, 1.404131, 1, 1, 1, 1, 1,
0.05928698, -1.699954, 3.083156, 1, 1, 1, 1, 1,
0.05990818, -1.763179, 2.677236, 1, 1, 1, 1, 1,
0.059939, -0.1476524, 4.380745, 1, 1, 1, 1, 1,
0.061414, -0.8561619, 3.21588, 1, 1, 1, 1, 1,
0.06191054, 0.4387023, -0.9348829, 1, 1, 1, 1, 1,
0.06571801, -0.9386221, 2.613562, 1, 1, 1, 1, 1,
0.06585642, 0.7779933, -0.8794373, 1, 1, 1, 1, 1,
0.06596749, 1.881298, 1.242603, 1, 1, 1, 1, 1,
0.0678196, -0.6093477, 2.088077, 1, 1, 1, 1, 1,
0.07649554, -0.1595793, 4.927073, 1, 1, 1, 1, 1,
0.09061014, 0.906555, 0.13687, 1, 1, 1, 1, 1,
0.09194203, -0.4778311, 3.39771, 1, 1, 1, 1, 1,
0.09335161, -1.085401, 2.174303, 1, 1, 1, 1, 1,
0.09435939, -0.6737932, 2.670968, 1, 1, 1, 1, 1,
0.09724355, 0.2623357, -0.3389265, 0, 0, 1, 1, 1,
0.09818757, -1.097175, 2.734463, 1, 0, 0, 1, 1,
0.100731, -0.293189, 2.347489, 1, 0, 0, 1, 1,
0.1010997, -0.7212117, 1.360366, 1, 0, 0, 1, 1,
0.1099309, -0.8111116, 3.003827, 1, 0, 0, 1, 1,
0.1107772, -1.014578, 2.814498, 1, 0, 0, 1, 1,
0.1108338, 0.3402867, 0.5835088, 0, 0, 0, 1, 1,
0.1126208, 7.305599e-05, 1.48065, 0, 0, 0, 1, 1,
0.1128112, -0.4133501, 2.800129, 0, 0, 0, 1, 1,
0.1154999, -1.100036, 3.276577, 0, 0, 0, 1, 1,
0.1175768, 0.8700894, -1.273936, 0, 0, 0, 1, 1,
0.1200159, -0.1770653, 2.638315, 0, 0, 0, 1, 1,
0.1226663, -0.225388, 3.815139, 0, 0, 0, 1, 1,
0.1232756, 0.6785963, 0.4706488, 1, 1, 1, 1, 1,
0.1257446, -0.3480538, 2.5083, 1, 1, 1, 1, 1,
0.1288914, 0.7567026, 0.8854261, 1, 1, 1, 1, 1,
0.1309224, -0.03094629, 1.900901, 1, 1, 1, 1, 1,
0.1327832, 1.880831, -0.04844165, 1, 1, 1, 1, 1,
0.1334649, -0.3201189, 2.469491, 1, 1, 1, 1, 1,
0.1337315, 0.2783429, 0.3169997, 1, 1, 1, 1, 1,
0.1371463, -0.988133, 2.685462, 1, 1, 1, 1, 1,
0.1375665, 0.4351121, 0.457654, 1, 1, 1, 1, 1,
0.1379214, -1.776892, 4.450646, 1, 1, 1, 1, 1,
0.1428292, 0.7379944, 0.1388306, 1, 1, 1, 1, 1,
0.1510598, -0.5603731, 1.663492, 1, 1, 1, 1, 1,
0.151915, 0.4790918, 1.006201, 1, 1, 1, 1, 1,
0.1537747, 0.1063553, 2.463959, 1, 1, 1, 1, 1,
0.1602146, -0.8179669, 3.348086, 1, 1, 1, 1, 1,
0.1610193, 0.215459, 0.122648, 0, 0, 1, 1, 1,
0.161386, 0.05212792, 3.202389, 1, 0, 0, 1, 1,
0.1631173, 0.1195607, 0.4878239, 1, 0, 0, 1, 1,
0.1635055, 0.03311099, 1.834589, 1, 0, 0, 1, 1,
0.1643539, 0.8701782, 0.6485184, 1, 0, 0, 1, 1,
0.1672232, 0.05770364, 1.719508, 1, 0, 0, 1, 1,
0.1696704, -0.3475834, 2.095938, 0, 0, 0, 1, 1,
0.1730405, -1.007698, 3.793374, 0, 0, 0, 1, 1,
0.1747583, -0.5652902, 2.092052, 0, 0, 0, 1, 1,
0.1771002, 0.1210001, -1.430922, 0, 0, 0, 1, 1,
0.182992, 0.691772, 1.189141, 0, 0, 0, 1, 1,
0.1844442, -0.2416856, 3.942798, 0, 0, 0, 1, 1,
0.1851642, 1.508569, 1.225101, 0, 0, 0, 1, 1,
0.1854414, -0.9803933, 2.079601, 1, 1, 1, 1, 1,
0.1871718, -0.1121628, 1.094909, 1, 1, 1, 1, 1,
0.1876406, 0.6868219, -0.1995264, 1, 1, 1, 1, 1,
0.1877569, 1.513677, -1.417867, 1, 1, 1, 1, 1,
0.188378, 0.7762989, 0.4051084, 1, 1, 1, 1, 1,
0.1934396, 2.59299, -0.1362454, 1, 1, 1, 1, 1,
0.1980856, 0.6368471, 1.268061, 1, 1, 1, 1, 1,
0.1980938, -0.3293407, 2.718344, 1, 1, 1, 1, 1,
0.1989179, 0.05340654, 1.556718, 1, 1, 1, 1, 1,
0.2005373, 0.3752682, 0.3694882, 1, 1, 1, 1, 1,
0.2069626, -0.7128305, 1.751638, 1, 1, 1, 1, 1,
0.2109873, 0.9986575, 1.649222, 1, 1, 1, 1, 1,
0.2123792, 1.030148, 1.437586, 1, 1, 1, 1, 1,
0.223459, -1.724092, 4.032041, 1, 1, 1, 1, 1,
0.2254973, -0.1461243, 1.141602, 1, 1, 1, 1, 1,
0.2294268, 1.66951, 1.402332, 0, 0, 1, 1, 1,
0.2347109, 1.602484, -0.1704875, 1, 0, 0, 1, 1,
0.2358338, 1.154685, -0.01738411, 1, 0, 0, 1, 1,
0.2389099, -1.605208, 2.819922, 1, 0, 0, 1, 1,
0.2391335, -0.08877914, 1.916114, 1, 0, 0, 1, 1,
0.2419018, -0.8860423, 2.843394, 1, 0, 0, 1, 1,
0.2429876, 0.5805278, -1.35026, 0, 0, 0, 1, 1,
0.2434932, -0.7119503, 3.120158, 0, 0, 0, 1, 1,
0.2436311, -0.8808195, 3.281127, 0, 0, 0, 1, 1,
0.2487957, 0.4514641, 1.201238, 0, 0, 0, 1, 1,
0.2501213, 0.3941802, 2.59865, 0, 0, 0, 1, 1,
0.2559624, -0.8201834, 3.396486, 0, 0, 0, 1, 1,
0.2614364, 0.2502242, 2.078264, 0, 0, 0, 1, 1,
0.2615377, 0.9229732, 1.430113, 1, 1, 1, 1, 1,
0.2645449, 0.5625862, 0.6435231, 1, 1, 1, 1, 1,
0.2684263, 0.7112166, 0.1444598, 1, 1, 1, 1, 1,
0.2688128, 0.2179393, 0.8822176, 1, 1, 1, 1, 1,
0.269822, 1.243355, -0.5756269, 1, 1, 1, 1, 1,
0.2701901, 0.7097055, 0.6988013, 1, 1, 1, 1, 1,
0.2705508, -1.025576, 3.501241, 1, 1, 1, 1, 1,
0.2712483, 0.1295001, 0.4533707, 1, 1, 1, 1, 1,
0.2714927, -1.402503, 1.570593, 1, 1, 1, 1, 1,
0.2718827, 2.223446, 0.08914147, 1, 1, 1, 1, 1,
0.2736129, 0.006700426, 1.258997, 1, 1, 1, 1, 1,
0.2846738, -0.05625079, 1.1448, 1, 1, 1, 1, 1,
0.2925631, -0.2532241, 1.795019, 1, 1, 1, 1, 1,
0.2951228, -1.909057, 2.596484, 1, 1, 1, 1, 1,
0.2959989, -0.4550173, 1.363407, 1, 1, 1, 1, 1,
0.3011648, -1.014491, 1.803159, 0, 0, 1, 1, 1,
0.301486, -0.7228854, 1.499982, 1, 0, 0, 1, 1,
0.3047508, 1.900698, 0.3278262, 1, 0, 0, 1, 1,
0.307865, -0.3057796, 3.889649, 1, 0, 0, 1, 1,
0.3193633, -2.735452, 3.183167, 1, 0, 0, 1, 1,
0.3206736, 0.05581963, 1.843235, 1, 0, 0, 1, 1,
0.3213786, -2.461124, 3.955635, 0, 0, 0, 1, 1,
0.3227943, -0.06883493, 1.120698, 0, 0, 0, 1, 1,
0.3234747, 0.3935276, 0.2231879, 0, 0, 0, 1, 1,
0.3258702, -0.1496084, -0.1932099, 0, 0, 0, 1, 1,
0.3298166, 0.3284892, 2.164884, 0, 0, 0, 1, 1,
0.3303198, 0.1629141, 3.05205, 0, 0, 0, 1, 1,
0.3312921, -1.05202, 3.034266, 0, 0, 0, 1, 1,
0.3314187, 0.09297335, 1.687454, 1, 1, 1, 1, 1,
0.3333907, -1.045053, 1.30681, 1, 1, 1, 1, 1,
0.3388445, 1.141951, 2.062159, 1, 1, 1, 1, 1,
0.3418243, -1.653557, 3.309254, 1, 1, 1, 1, 1,
0.3441591, -0.6736025, 4.254282, 1, 1, 1, 1, 1,
0.3512172, -0.4672294, 2.485203, 1, 1, 1, 1, 1,
0.3529042, -0.2141242, 0.6803817, 1, 1, 1, 1, 1,
0.3535754, -0.3488956, 1.724805, 1, 1, 1, 1, 1,
0.355788, 0.599092, 0.2931732, 1, 1, 1, 1, 1,
0.3638396, -1.040707, -0.4505345, 1, 1, 1, 1, 1,
0.36632, 1.518834, 0.7497514, 1, 1, 1, 1, 1,
0.3678384, 1.532892, -0.4094074, 1, 1, 1, 1, 1,
0.3687802, 0.6539091, 1.372444, 1, 1, 1, 1, 1,
0.3719328, 0.3072536, 0.6059213, 1, 1, 1, 1, 1,
0.3723532, -2.978933, 2.868643, 1, 1, 1, 1, 1,
0.3768732, 0.5298239, 1.05427, 0, 0, 1, 1, 1,
0.3780154, 0.8776652, 1.172466, 1, 0, 0, 1, 1,
0.3801721, 0.2182087, 2.978446, 1, 0, 0, 1, 1,
0.3848108, 0.01033347, 0.3792316, 1, 0, 0, 1, 1,
0.3929724, -1.314426, 4.048166, 1, 0, 0, 1, 1,
0.3949315, 0.6838985, 0.2127354, 1, 0, 0, 1, 1,
0.39772, -0.6200348, 2.354857, 0, 0, 0, 1, 1,
0.3985287, 1.015363, 1.731208, 0, 0, 0, 1, 1,
0.3999327, 0.1882536, 1.38007, 0, 0, 0, 1, 1,
0.400394, -0.2810652, 1.987475, 0, 0, 0, 1, 1,
0.4017512, -2.727008, 2.715142, 0, 0, 0, 1, 1,
0.4054692, 1.604067, 0.03138234, 0, 0, 0, 1, 1,
0.4158278, -1.703221, 3.807915, 0, 0, 0, 1, 1,
0.421077, -0.3770357, 1.464939, 1, 1, 1, 1, 1,
0.4231679, -0.1861804, 1.058835, 1, 1, 1, 1, 1,
0.4279493, 0.4907347, -0.2395011, 1, 1, 1, 1, 1,
0.4306345, 0.07675493, 0.2506079, 1, 1, 1, 1, 1,
0.4329914, 0.2675377, 0.0914529, 1, 1, 1, 1, 1,
0.4339041, 0.9860112, 0.2817317, 1, 1, 1, 1, 1,
0.4362241, 1.360059, 0.5980307, 1, 1, 1, 1, 1,
0.4378236, 0.8707151, -0.8206773, 1, 1, 1, 1, 1,
0.4382381, -0.07382211, 2.603097, 1, 1, 1, 1, 1,
0.4425453, -0.2469598, 1.95761, 1, 1, 1, 1, 1,
0.4428731, 0.9021325, 1.426334, 1, 1, 1, 1, 1,
0.4429657, 1.193676, 0.9022248, 1, 1, 1, 1, 1,
0.4478223, -1.224915, 3.118981, 1, 1, 1, 1, 1,
0.4506824, 0.04986699, 2.573675, 1, 1, 1, 1, 1,
0.4537251, -0.6679003, 1.779589, 1, 1, 1, 1, 1,
0.4559956, -0.1042408, 0.1331938, 0, 0, 1, 1, 1,
0.4589285, 0.9400715, 1.217193, 1, 0, 0, 1, 1,
0.4594162, 0.7624929, -0.6970556, 1, 0, 0, 1, 1,
0.4617035, -1.964663, 3.565579, 1, 0, 0, 1, 1,
0.4660302, -1.066923, 1.74633, 1, 0, 0, 1, 1,
0.4673925, -1.415462, 2.04051, 1, 0, 0, 1, 1,
0.4706511, 1.988303, 0.2074457, 0, 0, 0, 1, 1,
0.4808171, 0.6587541, 0.1053697, 0, 0, 0, 1, 1,
0.4822072, 0.5367222, 2.149276, 0, 0, 0, 1, 1,
0.483733, 1.501494, 2.291936, 0, 0, 0, 1, 1,
0.4838466, 0.7017369, 1.618398, 0, 0, 0, 1, 1,
0.4876789, 1.649938, 0.4117526, 0, 0, 0, 1, 1,
0.4888188, 1.273385, -0.7210596, 0, 0, 0, 1, 1,
0.4950972, 0.2490678, 2.64184, 1, 1, 1, 1, 1,
0.4965906, -0.2068519, 1.081688, 1, 1, 1, 1, 1,
0.4987867, -0.2782605, 0.6422715, 1, 1, 1, 1, 1,
0.5038537, -1.79417, 3.023815, 1, 1, 1, 1, 1,
0.5094856, 0.228257, -0.8001521, 1, 1, 1, 1, 1,
0.5144554, -1.287002, 1.9956, 1, 1, 1, 1, 1,
0.521916, 0.604726, 1.229842, 1, 1, 1, 1, 1,
0.5233415, -0.6047494, 1.23587, 1, 1, 1, 1, 1,
0.5236105, 1.839594, 0.02835131, 1, 1, 1, 1, 1,
0.5254484, -0.6421011, 1.24581, 1, 1, 1, 1, 1,
0.5281805, 0.5640947, -0.02799358, 1, 1, 1, 1, 1,
0.5317055, 0.8859031, -1.664788, 1, 1, 1, 1, 1,
0.5367854, -0.4904267, 4.834329, 1, 1, 1, 1, 1,
0.5373912, 0.8269562, 2.781726, 1, 1, 1, 1, 1,
0.5481108, 2.217223, 0.4344054, 1, 1, 1, 1, 1,
0.5495144, 0.2558254, 1.481709, 0, 0, 1, 1, 1,
0.551151, -0.4085463, 1.813603, 1, 0, 0, 1, 1,
0.5547124, 1.409696, 0.1379238, 1, 0, 0, 1, 1,
0.5554858, 0.07667512, 0.9188865, 1, 0, 0, 1, 1,
0.5565904, -1.118654, 2.426567, 1, 0, 0, 1, 1,
0.5607387, 0.3168586, 1.456731, 1, 0, 0, 1, 1,
0.5639154, 1.990357, 0.4317787, 0, 0, 0, 1, 1,
0.5641317, 0.6424493, 0.8661885, 0, 0, 0, 1, 1,
0.569476, -0.1277241, 2.181449, 0, 0, 0, 1, 1,
0.5728146, -1.073254, 3.421168, 0, 0, 0, 1, 1,
0.584839, -1.402418, 5.112236, 0, 0, 0, 1, 1,
0.5869613, 1.029241, 0.5991637, 0, 0, 0, 1, 1,
0.5876275, -0.3413045, 1.395381, 0, 0, 0, 1, 1,
0.5916531, 0.8768567, -0.06860266, 1, 1, 1, 1, 1,
0.5931848, -0.6185585, 1.836805, 1, 1, 1, 1, 1,
0.5932907, -0.1947178, 2.129496, 1, 1, 1, 1, 1,
0.5962905, -1.011943, 2.646205, 1, 1, 1, 1, 1,
0.596794, 0.365489, 0.9090879, 1, 1, 1, 1, 1,
0.5974535, 1.999869, -0.6568284, 1, 1, 1, 1, 1,
0.6011151, -2.452918, 3.214453, 1, 1, 1, 1, 1,
0.6028149, 2.38629, -1.068447, 1, 1, 1, 1, 1,
0.607917, -0.07704511, 3.596849, 1, 1, 1, 1, 1,
0.60833, -0.5667796, 2.728727, 1, 1, 1, 1, 1,
0.6125078, -1.057106, 1.115768, 1, 1, 1, 1, 1,
0.6162238, 1.706809, 0.7270393, 1, 1, 1, 1, 1,
0.6202244, -1.329539, 2.323614, 1, 1, 1, 1, 1,
0.6209844, -0.04058663, 1.943384, 1, 1, 1, 1, 1,
0.622253, -1.299098, 2.126379, 1, 1, 1, 1, 1,
0.6223338, 0.1855182, 2.34461, 0, 0, 1, 1, 1,
0.6238015, 0.7963336, 1.698852, 1, 0, 0, 1, 1,
0.6297901, -1.188675, 2.566657, 1, 0, 0, 1, 1,
0.6322425, 0.8377597, 0.6107212, 1, 0, 0, 1, 1,
0.6324797, -1.078636, 3.387412, 1, 0, 0, 1, 1,
0.6354007, -1.793331, 1.469384, 1, 0, 0, 1, 1,
0.6391838, -0.1648145, 1.139055, 0, 0, 0, 1, 1,
0.6442972, 0.617609, 1.663784, 0, 0, 0, 1, 1,
0.6459337, 0.04100322, -0.07480292, 0, 0, 0, 1, 1,
0.647599, -0.2814902, 1.585995, 0, 0, 0, 1, 1,
0.6521769, 1.590024, -1.139819, 0, 0, 0, 1, 1,
0.6572983, -1.83177, 2.386594, 0, 0, 0, 1, 1,
0.6573256, 0.04882, 1.20102, 0, 0, 0, 1, 1,
0.6593069, -1.368275, 3.05398, 1, 1, 1, 1, 1,
0.6594286, -0.7274534, 2.006163, 1, 1, 1, 1, 1,
0.6608121, -0.3035447, 1.976314, 1, 1, 1, 1, 1,
0.6741587, -1.290298, 2.760856, 1, 1, 1, 1, 1,
0.6779956, 0.06182794, -0.02508627, 1, 1, 1, 1, 1,
0.6795974, 0.383717, 1.844336, 1, 1, 1, 1, 1,
0.6931994, 0.09697222, 3.63891, 1, 1, 1, 1, 1,
0.6970578, -0.1337052, 1.842762, 1, 1, 1, 1, 1,
0.6989382, 0.9762384, 0.9071557, 1, 1, 1, 1, 1,
0.7011063, 1.142705, 1.633756, 1, 1, 1, 1, 1,
0.7189038, 1.557954, -1.142426, 1, 1, 1, 1, 1,
0.727491, 0.1435176, 1.179241, 1, 1, 1, 1, 1,
0.7280525, 1.493934, 0.1583007, 1, 1, 1, 1, 1,
0.728098, -0.3609257, 1.928598, 1, 1, 1, 1, 1,
0.7296925, -1.17023, 3.270605, 1, 1, 1, 1, 1,
0.7305791, 1.701735, 1.403687, 0, 0, 1, 1, 1,
0.7382584, 1.036362, 0.6136138, 1, 0, 0, 1, 1,
0.739243, 0.3234698, -0.5985315, 1, 0, 0, 1, 1,
0.7453337, -0.123813, 0.875903, 1, 0, 0, 1, 1,
0.7509088, 0.1457726, 1.123004, 1, 0, 0, 1, 1,
0.7531437, 1.308853, 1.947721, 1, 0, 0, 1, 1,
0.7545863, -0.8267112, 1.819688, 0, 0, 0, 1, 1,
0.769303, 1.441187, 1.72837, 0, 0, 0, 1, 1,
0.7715214, -0.9395652, 2.87249, 0, 0, 0, 1, 1,
0.7715487, -0.06798773, 1.245177, 0, 0, 0, 1, 1,
0.7717851, -0.935526, 1.382513, 0, 0, 0, 1, 1,
0.7728593, 0.03620481, 1.354402, 0, 0, 0, 1, 1,
0.7728716, 0.1331858, 3.179065, 0, 0, 0, 1, 1,
0.7765566, 0.9725105, -0.03219579, 1, 1, 1, 1, 1,
0.7801617, 0.3648992, 0.2905492, 1, 1, 1, 1, 1,
0.7811217, 2.169713, 1.194525, 1, 1, 1, 1, 1,
0.7818539, -0.4135821, 2.568033, 1, 1, 1, 1, 1,
0.783368, 1.126322, 0.7994735, 1, 1, 1, 1, 1,
0.7841293, 0.964339, 0.04152608, 1, 1, 1, 1, 1,
0.7851766, -0.4327608, 2.382792, 1, 1, 1, 1, 1,
0.7855061, 0.1783084, 1.675455, 1, 1, 1, 1, 1,
0.7884039, 0.8522853, 1.586907, 1, 1, 1, 1, 1,
0.7944981, 1.594752, 1.172941, 1, 1, 1, 1, 1,
0.7974986, 1.296602, 0.2754864, 1, 1, 1, 1, 1,
0.8028348, 0.6607691, 0.2047206, 1, 1, 1, 1, 1,
0.8070652, 0.6895514, 0.2873135, 1, 1, 1, 1, 1,
0.8089688, -0.3465409, 0.9026178, 1, 1, 1, 1, 1,
0.8207523, 0.9139832, 3.69219, 1, 1, 1, 1, 1,
0.8227672, 2.048728, 1.831384, 0, 0, 1, 1, 1,
0.8281707, 0.270712, 1.252003, 1, 0, 0, 1, 1,
0.8355963, 0.6647129, 2.308137, 1, 0, 0, 1, 1,
0.8461655, -0.6927618, 2.811916, 1, 0, 0, 1, 1,
0.8473678, 0.7192099, 0.6040547, 1, 0, 0, 1, 1,
0.8482729, 0.3645083, 0.4168324, 1, 0, 0, 1, 1,
0.8493175, 0.7618034, -0.05734989, 0, 0, 0, 1, 1,
0.8555238, -0.6277194, 1.957851, 0, 0, 0, 1, 1,
0.8653549, -1.047804, 1.064555, 0, 0, 0, 1, 1,
0.8657607, 1.42278, 0.284473, 0, 0, 0, 1, 1,
0.8665211, -1.049294, 2.976358, 0, 0, 0, 1, 1,
0.8710827, 1.915364, 0.5897466, 0, 0, 0, 1, 1,
0.8722991, 0.3564393, 0.1999937, 0, 0, 0, 1, 1,
0.8764572, 0.3748809, 0.9431854, 1, 1, 1, 1, 1,
0.8775613, -2.555367, 2.997505, 1, 1, 1, 1, 1,
0.8786152, -1.016119, 1.989426, 1, 1, 1, 1, 1,
0.8806437, 0.3416018, -0.7400025, 1, 1, 1, 1, 1,
0.8830934, -0.9868366, 2.629472, 1, 1, 1, 1, 1,
0.8831118, -0.7803349, 0.4131978, 1, 1, 1, 1, 1,
0.8834172, -1.164708, 2.281022, 1, 1, 1, 1, 1,
0.8897294, -1.535534, 3.799363, 1, 1, 1, 1, 1,
0.8969117, -1.392066, 4.022761, 1, 1, 1, 1, 1,
0.9053345, 0.6503412, 0.9185501, 1, 1, 1, 1, 1,
0.9054682, 1.627205, 0.5259214, 1, 1, 1, 1, 1,
0.9135639, -0.6013801, 3.168655, 1, 1, 1, 1, 1,
0.9189599, -0.630798, -0.0984309, 1, 1, 1, 1, 1,
0.9192675, -0.3781399, 0.07317484, 1, 1, 1, 1, 1,
0.9251022, -0.9852526, 1.820926, 1, 1, 1, 1, 1,
0.9264264, 0.7140452, 0.8801497, 0, 0, 1, 1, 1,
0.9275218, -2.21816, 3.687541, 1, 0, 0, 1, 1,
0.9353899, 0.4051174, 1.048034, 1, 0, 0, 1, 1,
0.9385927, 1.775988, 1.709801, 1, 0, 0, 1, 1,
0.9407082, -0.0768318, 1.171672, 1, 0, 0, 1, 1,
0.9574709, -0.9624097, 2.941619, 1, 0, 0, 1, 1,
0.9680949, -0.5678313, 2.35636, 0, 0, 0, 1, 1,
0.9697911, 0.03774142, 2.178608, 0, 0, 0, 1, 1,
0.9729212, -0.7446183, 2.914206, 0, 0, 0, 1, 1,
0.9754252, 0.7424303, 0.2847727, 0, 0, 0, 1, 1,
0.9758548, -1.348788, 3.249568, 0, 0, 0, 1, 1,
0.9764373, 0.3311281, 1.728001, 0, 0, 0, 1, 1,
0.9792241, 0.4663921, 1.001028, 0, 0, 0, 1, 1,
0.9807209, -0.4711192, 0.6921585, 1, 1, 1, 1, 1,
0.983631, -0.3961418, 1.463976, 1, 1, 1, 1, 1,
0.9868817, 0.6808739, 0.7547578, 1, 1, 1, 1, 1,
0.9929219, -1.169703, 2.05875, 1, 1, 1, 1, 1,
0.9962731, 0.6879705, 0.4431249, 1, 1, 1, 1, 1,
0.998058, -0.09438132, 2.41917, 1, 1, 1, 1, 1,
1.000656, -1.76485, 2.302114, 1, 1, 1, 1, 1,
1.004463, 0.9345952, 0.5796065, 1, 1, 1, 1, 1,
1.005957, -0.9316858, 0.9284981, 1, 1, 1, 1, 1,
1.019264, 0.8718618, -0.2862913, 1, 1, 1, 1, 1,
1.019868, 0.2835156, -0.369801, 1, 1, 1, 1, 1,
1.02107, 0.4130832, 1.714201, 1, 1, 1, 1, 1,
1.026401, 0.9609347, -0.02537907, 1, 1, 1, 1, 1,
1.028412, -1.373601, 2.566109, 1, 1, 1, 1, 1,
1.029043, 0.6532933, 0.08887332, 1, 1, 1, 1, 1,
1.04628, -1.968823, 4.163657, 0, 0, 1, 1, 1,
1.046433, 0.8281325, -1.099796, 1, 0, 0, 1, 1,
1.048627, 0.1343622, 2.496104, 1, 0, 0, 1, 1,
1.05037, -0.218343, 0.7262065, 1, 0, 0, 1, 1,
1.056085, 0.5503632, 0.9133906, 1, 0, 0, 1, 1,
1.057524, 1.345496, 1.160784, 1, 0, 0, 1, 1,
1.062352, 0.6647409, 0.5856281, 0, 0, 0, 1, 1,
1.064389, -0.5659306, 3.65852, 0, 0, 0, 1, 1,
1.072588, -0.4006173, 1.88881, 0, 0, 0, 1, 1,
1.07545, 1.085392, 1.226132, 0, 0, 0, 1, 1,
1.082774, -0.4822398, 2.085451, 0, 0, 0, 1, 1,
1.087796, -0.2470825, 1.51718, 0, 0, 0, 1, 1,
1.089272, -2.345494, -0.4615968, 0, 0, 0, 1, 1,
1.098789, -0.4400404, 2.289308, 1, 1, 1, 1, 1,
1.099613, 0.2913251, 2.118513, 1, 1, 1, 1, 1,
1.11015, -1.426882, 3.17124, 1, 1, 1, 1, 1,
1.112874, -1.351847, 1.43687, 1, 1, 1, 1, 1,
1.116219, -2.100007, 2.35408, 1, 1, 1, 1, 1,
1.117198, -0.9637942, 2.598313, 1, 1, 1, 1, 1,
1.120632, -1.266033, 1.915866, 1, 1, 1, 1, 1,
1.12459, -0.8638591, 1.864682, 1, 1, 1, 1, 1,
1.138124, 1.271951, -0.01726393, 1, 1, 1, 1, 1,
1.143448, 0.2865306, 0.7725159, 1, 1, 1, 1, 1,
1.150437, 0.09182134, 0.05851151, 1, 1, 1, 1, 1,
1.15186, -1.897078, 0.3390184, 1, 1, 1, 1, 1,
1.154553, -1.58049, 3.722423, 1, 1, 1, 1, 1,
1.155837, -0.2155004, 0.09884702, 1, 1, 1, 1, 1,
1.158507, 0.6588992, -0.01901126, 1, 1, 1, 1, 1,
1.162122, -0.8608851, 1.212137, 0, 0, 1, 1, 1,
1.163507, 0.3517554, 0.1622086, 1, 0, 0, 1, 1,
1.182933, -0.9570614, 2.056528, 1, 0, 0, 1, 1,
1.205205, 0.5914462, 1.038567, 1, 0, 0, 1, 1,
1.214844, -0.6611838, 3.925879, 1, 0, 0, 1, 1,
1.21924, -0.4090277, 2.431791, 1, 0, 0, 1, 1,
1.223906, 0.2817643, 1.534828, 0, 0, 0, 1, 1,
1.229748, -0.2640951, 2.76533, 0, 0, 0, 1, 1,
1.238658, 1.076747, 0.3553012, 0, 0, 0, 1, 1,
1.249282, -0.9125037, 1.174466, 0, 0, 0, 1, 1,
1.249488, -0.9476182, 0.193534, 0, 0, 0, 1, 1,
1.251163, -0.6115107, 1.039398, 0, 0, 0, 1, 1,
1.252714, -0.5786056, 1.099152, 0, 0, 0, 1, 1,
1.252992, 1.129135, 1.349218, 1, 1, 1, 1, 1,
1.25329, 0.4255214, 1.969235, 1, 1, 1, 1, 1,
1.253327, -0.7806606, 1.438805, 1, 1, 1, 1, 1,
1.253425, 0.3496878, 1.868235, 1, 1, 1, 1, 1,
1.254213, 1.246145, 0.9848387, 1, 1, 1, 1, 1,
1.26257, 0.2770454, 0.1361359, 1, 1, 1, 1, 1,
1.266696, -1.681958, 3.705649, 1, 1, 1, 1, 1,
1.278497, 0.7933114, 1.209316, 1, 1, 1, 1, 1,
1.281887, -0.800448, 1.41392, 1, 1, 1, 1, 1,
1.294517, 1.51638, 1.423773, 1, 1, 1, 1, 1,
1.300406, 0.2520925, 1.759597, 1, 1, 1, 1, 1,
1.305465, -0.4420187, -0.7720718, 1, 1, 1, 1, 1,
1.308871, 0.6656338, 0.8619049, 1, 1, 1, 1, 1,
1.321519, 2.253726, 0.7894559, 1, 1, 1, 1, 1,
1.327304, 0.9145597, 1.914819, 1, 1, 1, 1, 1,
1.328637, 0.8611667, 1.973779, 0, 0, 1, 1, 1,
1.333338, -0.8237753, 2.220737, 1, 0, 0, 1, 1,
1.336335, 0.7337874, -0.1539922, 1, 0, 0, 1, 1,
1.347093, -0.7452908, 3.290117, 1, 0, 0, 1, 1,
1.347518, 2.163578, 0.4640726, 1, 0, 0, 1, 1,
1.348937, -0.6391313, 4.579192, 1, 0, 0, 1, 1,
1.35474, 0.4443754, 0.5559078, 0, 0, 0, 1, 1,
1.36131, 0.7153553, 0.7877907, 0, 0, 0, 1, 1,
1.365222, -0.1115803, -0.07001197, 0, 0, 0, 1, 1,
1.377971, -1.652892, 2.455406, 0, 0, 0, 1, 1,
1.383897, -0.6942161, 0.9311182, 0, 0, 0, 1, 1,
1.395785, -0.6776244, 2.991994, 0, 0, 0, 1, 1,
1.408521, -0.07701644, 0.4386366, 0, 0, 0, 1, 1,
1.409309, -0.05629291, 1.665554, 1, 1, 1, 1, 1,
1.413058, -0.08244594, 1.399156, 1, 1, 1, 1, 1,
1.414498, 1.567606, 1.608967, 1, 1, 1, 1, 1,
1.416824, -0.3919385, 2.942702, 1, 1, 1, 1, 1,
1.420182, -1.341283, 3.026174, 1, 1, 1, 1, 1,
1.421155, -0.2704853, 3.011001, 1, 1, 1, 1, 1,
1.426008, 0.147685, 1.839672, 1, 1, 1, 1, 1,
1.43855, 0.6347603, 0.5588809, 1, 1, 1, 1, 1,
1.453218, 0.5530959, 0.9859831, 1, 1, 1, 1, 1,
1.460106, 0.299652, -0.08863277, 1, 1, 1, 1, 1,
1.474288, -1.050556, 1.874947, 1, 1, 1, 1, 1,
1.476797, 0.8816604, -0.1375903, 1, 1, 1, 1, 1,
1.493734, -1.240101, 1.47034, 1, 1, 1, 1, 1,
1.497959, 0.3708009, 0.4582963, 1, 1, 1, 1, 1,
1.498153, 1.668008, 2.572572, 1, 1, 1, 1, 1,
1.50659, -1.248957, 2.650606, 0, 0, 1, 1, 1,
1.520843, 0.0316528, 1.825359, 1, 0, 0, 1, 1,
1.521708, -0.4748844, 0.4321228, 1, 0, 0, 1, 1,
1.52293, -0.5105256, 0.6659591, 1, 0, 0, 1, 1,
1.524298, 0.4699067, 0.1055962, 1, 0, 0, 1, 1,
1.540842, -1.184291, 2.865325, 1, 0, 0, 1, 1,
1.545858, -1.050515, 0.6842178, 0, 0, 0, 1, 1,
1.55518, -0.805463, 1.516642, 0, 0, 0, 1, 1,
1.568799, -0.2361967, 1.37034, 0, 0, 0, 1, 1,
1.570667, 0.5462949, 0.6909638, 0, 0, 0, 1, 1,
1.580241, 1.312051, 0.6799125, 0, 0, 0, 1, 1,
1.590223, -0.9952158, 0.08495761, 0, 0, 0, 1, 1,
1.592912, 1.642527, -0.573744, 0, 0, 0, 1, 1,
1.599876, 0.6205211, -0.1886837, 1, 1, 1, 1, 1,
1.600424, -0.6523935, 2.153787, 1, 1, 1, 1, 1,
1.611718, 0.5875319, 1.336982, 1, 1, 1, 1, 1,
1.663167, 0.7100179, 0.2713719, 1, 1, 1, 1, 1,
1.687591, 1.72463, 1.077755, 1, 1, 1, 1, 1,
1.744136, 0.0744618, 0.9684074, 1, 1, 1, 1, 1,
1.744532, -0.8301871, 1.502783, 1, 1, 1, 1, 1,
1.772844, 0.5410584, 1.099246, 1, 1, 1, 1, 1,
1.778152, -0.3843032, 0.3380493, 1, 1, 1, 1, 1,
1.782897, -0.3754905, 2.603511, 1, 1, 1, 1, 1,
1.789701, 1.514306, 2.635311, 1, 1, 1, 1, 1,
1.79563, -1.021805, 0.5319732, 1, 1, 1, 1, 1,
1.802932, 0.4891126, 0.5759292, 1, 1, 1, 1, 1,
1.806241, -0.1975837, 0.06479193, 1, 1, 1, 1, 1,
1.808548, -0.6353329, 2.44004, 1, 1, 1, 1, 1,
1.825574, 1.056062, 1.292905, 0, 0, 1, 1, 1,
1.825945, 1.731567, 1.022859, 1, 0, 0, 1, 1,
1.832581, -0.8044195, 2.217276, 1, 0, 0, 1, 1,
1.833979, 0.2561432, 1.813312, 1, 0, 0, 1, 1,
1.834505, 0.358268, -0.3739206, 1, 0, 0, 1, 1,
1.839598, 1.437313, 1.840599, 1, 0, 0, 1, 1,
1.847505, -0.155741, 2.014951, 0, 0, 0, 1, 1,
1.848597, -0.06246812, 1.383879, 0, 0, 0, 1, 1,
1.864613, -2.333041, 2.431451, 0, 0, 0, 1, 1,
1.87749, -0.09504089, -0.08010672, 0, 0, 0, 1, 1,
1.884656, 1.623832, 1.12343, 0, 0, 0, 1, 1,
1.887593, -0.2321009, 1.932764, 0, 0, 0, 1, 1,
1.908444, 0.7981331, 0.9856223, 0, 0, 0, 1, 1,
1.92849, -1.571171, 0.6394666, 1, 1, 1, 1, 1,
1.929561, 0.3523615, 1.669936, 1, 1, 1, 1, 1,
1.935075, -0.6306202, 2.302034, 1, 1, 1, 1, 1,
1.936249, -0.7939447, 2.243466, 1, 1, 1, 1, 1,
1.955113, -0.5858441, 1.254002, 1, 1, 1, 1, 1,
1.97, 0.3291016, 1.127577, 1, 1, 1, 1, 1,
1.977723, 0.6358976, 1.82565, 1, 1, 1, 1, 1,
1.985896, 0.4409742, 0.8596606, 1, 1, 1, 1, 1,
1.987495, -0.1390408, 1.417508, 1, 1, 1, 1, 1,
2.013411, -1.319038, 3.110681, 1, 1, 1, 1, 1,
2.028549, -1.108518, 1.004478, 1, 1, 1, 1, 1,
2.041466, -0.1961058, -0.07937431, 1, 1, 1, 1, 1,
2.049751, -1.40123, 3.47923, 1, 1, 1, 1, 1,
2.054881, 0.8670061, 2.570688, 1, 1, 1, 1, 1,
2.062119, 1.407425, 1.207301, 1, 1, 1, 1, 1,
2.083519, -0.2764854, 1.739927, 0, 0, 1, 1, 1,
2.106364, -1.187611, 3.284739, 1, 0, 0, 1, 1,
2.138546, 0.07522859, 0.5719848, 1, 0, 0, 1, 1,
2.171041, -0.09170219, 0.3184249, 1, 0, 0, 1, 1,
2.181632, -0.5184425, 2.856383, 1, 0, 0, 1, 1,
2.323459, 1.858651, 0.286068, 1, 0, 0, 1, 1,
2.356904, 0.3610156, 1.239453, 0, 0, 0, 1, 1,
2.358728, 1.013095, 0.6476214, 0, 0, 0, 1, 1,
2.376542, 1.295075, 1.689416, 0, 0, 0, 1, 1,
2.385777, -0.9628317, 1.813676, 0, 0, 0, 1, 1,
2.387907, 0.7152319, 1.021961, 0, 0, 0, 1, 1,
2.398116, -1.224648, 2.747971, 0, 0, 0, 1, 1,
2.460131, -1.232028, -0.1111396, 0, 0, 0, 1, 1,
2.549984, 0.4417411, 3.320392, 1, 1, 1, 1, 1,
2.594975, 1.053804, 0.183558, 1, 1, 1, 1, 1,
2.685474, -1.651957, 2.145355, 1, 1, 1, 1, 1,
2.70304, -0.2569248, 1.888522, 1, 1, 1, 1, 1,
2.984993, -0.4990965, 1.173606, 1, 1, 1, 1, 1,
3.338283, -0.8770277, 1.926503, 1, 1, 1, 1, 1,
3.531044, -1.626509, 1.170962, 1, 1, 1, 1, 1
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
var radius = 10.20853;
var distance = 35.85704;
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
mvMatrix.translate( -0.3828886, 0.2530096, 0.5236783 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.85704);
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
