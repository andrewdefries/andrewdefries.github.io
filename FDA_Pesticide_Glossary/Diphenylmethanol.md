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
-2.973681, 1.049627, -1.12009, 1, 0, 0, 1,
-2.473318, 0.07263504, -2.755524, 1, 0.007843138, 0, 1,
-2.416809, 0.6649277, -0.4083452, 1, 0.01176471, 0, 1,
-2.413054, -0.9097129, -3.307927, 1, 0.01960784, 0, 1,
-2.408317, -1.327705, -2.056488, 1, 0.02352941, 0, 1,
-2.374644, -0.04330108, -2.788709, 1, 0.03137255, 0, 1,
-2.257066, 0.3087752, 0.3272864, 1, 0.03529412, 0, 1,
-2.249354, 0.03362779, -2.194764, 1, 0.04313726, 0, 1,
-2.20402, 0.3439796, -1.092895, 1, 0.04705882, 0, 1,
-2.195374, -0.2452326, -2.946851, 1, 0.05490196, 0, 1,
-2.186826, -0.9821759, -2.748877, 1, 0.05882353, 0, 1,
-2.158042, 0.8272933, -0.1379821, 1, 0.06666667, 0, 1,
-2.143708, 0.2037631, 0.2524449, 1, 0.07058824, 0, 1,
-2.139459, 1.291265, -2.030084, 1, 0.07843138, 0, 1,
-2.073399, -1.182617, -1.666563, 1, 0.08235294, 0, 1,
-2.027263, -1.980165, -2.756842, 1, 0.09019608, 0, 1,
-2.020778, 0.7269934, -3.663897, 1, 0.09411765, 0, 1,
-2.0078, -1.266281, -2.650968, 1, 0.1019608, 0, 1,
-1.999889, 0.3314695, -2.38786, 1, 0.1098039, 0, 1,
-1.960086, 1.210284, -1.855789, 1, 0.1137255, 0, 1,
-1.958989, 0.1449824, -0.2007676, 1, 0.1215686, 0, 1,
-1.92652, -1.253875, -2.374285, 1, 0.1254902, 0, 1,
-1.909302, -1.055522, -1.989338, 1, 0.1333333, 0, 1,
-1.893287, 1.423012, -1.763045, 1, 0.1372549, 0, 1,
-1.88496, 2.113514, -2.323872, 1, 0.145098, 0, 1,
-1.857747, -1.809293, -1.166573, 1, 0.1490196, 0, 1,
-1.82561, 0.01004596, -1.227505, 1, 0.1568628, 0, 1,
-1.813082, 0.882602, -1.612142, 1, 0.1607843, 0, 1,
-1.80191, -1.596583, -2.487366, 1, 0.1686275, 0, 1,
-1.80155, -0.9629319, -1.884328, 1, 0.172549, 0, 1,
-1.797234, 2.058489, -0.485636, 1, 0.1803922, 0, 1,
-1.795941, -0.8809614, -2.853112, 1, 0.1843137, 0, 1,
-1.791586, 1.084154, -0.830979, 1, 0.1921569, 0, 1,
-1.785334, 0.4070948, -2.306216, 1, 0.1960784, 0, 1,
-1.784476, 1.210756, -0.7806846, 1, 0.2039216, 0, 1,
-1.782701, -0.9963589, -2.709621, 1, 0.2117647, 0, 1,
-1.781611, 0.1777313, -0.9528117, 1, 0.2156863, 0, 1,
-1.776393, -0.05100084, -0.917827, 1, 0.2235294, 0, 1,
-1.766886, 0.6311195, -0.802788, 1, 0.227451, 0, 1,
-1.758406, -1.398104, -2.406101, 1, 0.2352941, 0, 1,
-1.710364, -0.8777143, -3.049159, 1, 0.2392157, 0, 1,
-1.699118, -0.7857025, -1.092293, 1, 0.2470588, 0, 1,
-1.693132, -0.526232, -2.616459, 1, 0.2509804, 0, 1,
-1.686416, 1.763267, 0.748989, 1, 0.2588235, 0, 1,
-1.675307, -1.615201, -1.091067, 1, 0.2627451, 0, 1,
-1.672227, 0.424674, -1.401718, 1, 0.2705882, 0, 1,
-1.666062, -1.047341, -3.125308, 1, 0.2745098, 0, 1,
-1.661885, -1.483738, -1.239403, 1, 0.282353, 0, 1,
-1.651534, 1.406371, -1.502589, 1, 0.2862745, 0, 1,
-1.633457, 1.330271, -0.09588898, 1, 0.2941177, 0, 1,
-1.619156, -1.550901, -4.284889, 1, 0.3019608, 0, 1,
-1.589974, -1.18475, -2.735755, 1, 0.3058824, 0, 1,
-1.589966, 0.4335853, -1.656352, 1, 0.3137255, 0, 1,
-1.587683, -0.4456905, -1.47895, 1, 0.3176471, 0, 1,
-1.587384, -0.2794425, -1.14409, 1, 0.3254902, 0, 1,
-1.583471, 0.350799, -1.88644, 1, 0.3294118, 0, 1,
-1.574124, -0.9128216, -0.5828521, 1, 0.3372549, 0, 1,
-1.573184, 0.04439526, -1.810078, 1, 0.3411765, 0, 1,
-1.568717, -0.3353773, -1.243545, 1, 0.3490196, 0, 1,
-1.565326, 0.1580454, -1.446968, 1, 0.3529412, 0, 1,
-1.54705, -0.4034454, -1.561861, 1, 0.3607843, 0, 1,
-1.546414, 2.379572, -0.528834, 1, 0.3647059, 0, 1,
-1.527951, 0.01244629, -2.39466, 1, 0.372549, 0, 1,
-1.523478, -0.88732, -1.232599, 1, 0.3764706, 0, 1,
-1.521069, -0.7848356, -0.2116975, 1, 0.3843137, 0, 1,
-1.480119, -0.3535561, -1.5918, 1, 0.3882353, 0, 1,
-1.47946, -2.14651, -3.383912, 1, 0.3960784, 0, 1,
-1.478299, 0.908541, -1.673029, 1, 0.4039216, 0, 1,
-1.47275, 0.53716, -0.958186, 1, 0.4078431, 0, 1,
-1.46541, -1.198977, -2.064105, 1, 0.4156863, 0, 1,
-1.457471, -0.4002748, -2.752795, 1, 0.4196078, 0, 1,
-1.437406, -1.622071, -1.32212, 1, 0.427451, 0, 1,
-1.436602, 0.4011571, -0.6293471, 1, 0.4313726, 0, 1,
-1.436, 2.147991, -1.184885, 1, 0.4392157, 0, 1,
-1.434746, -0.1138431, -0.9038458, 1, 0.4431373, 0, 1,
-1.4163, 0.147459, -1.68718, 1, 0.4509804, 0, 1,
-1.414705, 0.6284477, -0.3963472, 1, 0.454902, 0, 1,
-1.407552, -0.517176, -1.939789, 1, 0.4627451, 0, 1,
-1.406021, 1.611652, -1.069185, 1, 0.4666667, 0, 1,
-1.382757, -0.400804, -1.77664, 1, 0.4745098, 0, 1,
-1.378479, 0.8098118, -2.862584, 1, 0.4784314, 0, 1,
-1.372448, -0.619135, -2.346061, 1, 0.4862745, 0, 1,
-1.369694, -2.202423, -1.199164, 1, 0.4901961, 0, 1,
-1.365281, 1.253171, -2.6208, 1, 0.4980392, 0, 1,
-1.363886, -0.5098009, -0.787306, 1, 0.5058824, 0, 1,
-1.351105, -1.756435, -2.577596, 1, 0.509804, 0, 1,
-1.350448, 1.115843, -0.4980024, 1, 0.5176471, 0, 1,
-1.348272, 0.0475168, 0.4282419, 1, 0.5215687, 0, 1,
-1.343331, 0.9041, -0.9598622, 1, 0.5294118, 0, 1,
-1.342571, -0.1901197, -0.585618, 1, 0.5333334, 0, 1,
-1.335324, 0.4882944, -1.374988, 1, 0.5411765, 0, 1,
-1.328107, 0.2189021, -1.530512, 1, 0.5450981, 0, 1,
-1.32673, 0.5570394, -0.2762997, 1, 0.5529412, 0, 1,
-1.319002, -0.623112, -3.221801, 1, 0.5568628, 0, 1,
-1.310777, 1.32873, -0.003551132, 1, 0.5647059, 0, 1,
-1.308481, -0.1284703, -2.113895, 1, 0.5686275, 0, 1,
-1.307026, 1.903842, -1.971504, 1, 0.5764706, 0, 1,
-1.305435, -0.9461213, -3.760322, 1, 0.5803922, 0, 1,
-1.302682, -0.739008, -1.133067, 1, 0.5882353, 0, 1,
-1.296884, -1.271805, -3.139535, 1, 0.5921569, 0, 1,
-1.294324, 0.5322164, -1.516147, 1, 0.6, 0, 1,
-1.292601, 0.1084544, -0.1343946, 1, 0.6078432, 0, 1,
-1.288375, -0.5554184, -2.51332, 1, 0.6117647, 0, 1,
-1.278925, -1.925169, -1.659292, 1, 0.6196079, 0, 1,
-1.269551, -0.3922418, -1.60964, 1, 0.6235294, 0, 1,
-1.264535, -0.876143, -2.804353, 1, 0.6313726, 0, 1,
-1.247433, 1.742477, -2.53348, 1, 0.6352941, 0, 1,
-1.246134, -1.246239, -1.021548, 1, 0.6431373, 0, 1,
-1.233398, -0.4989404, -1.054827, 1, 0.6470588, 0, 1,
-1.227248, -0.5695205, -0.9947155, 1, 0.654902, 0, 1,
-1.221901, -0.2112947, -1.465173, 1, 0.6588235, 0, 1,
-1.215618, 0.5120076, -1.835713, 1, 0.6666667, 0, 1,
-1.212568, -0.39814, -3.226391, 1, 0.6705883, 0, 1,
-1.205148, -0.8052218, -1.935986, 1, 0.6784314, 0, 1,
-1.20142, 0.2563435, -1.738473, 1, 0.682353, 0, 1,
-1.191952, 0.5162721, -2.206283, 1, 0.6901961, 0, 1,
-1.191303, 1.482285, 0.1606498, 1, 0.6941177, 0, 1,
-1.184922, 0.199665, -0.3807294, 1, 0.7019608, 0, 1,
-1.171735, 0.364855, -0.5273428, 1, 0.7098039, 0, 1,
-1.170914, 0.2849268, -1.898435, 1, 0.7137255, 0, 1,
-1.166481, 0.7759131, -2.772505, 1, 0.7215686, 0, 1,
-1.154601, 1.046769, 0.05664255, 1, 0.7254902, 0, 1,
-1.148419, 0.7606869, 0.5335607, 1, 0.7333333, 0, 1,
-1.145782, 0.103596, -2.396199, 1, 0.7372549, 0, 1,
-1.145427, -1.010659, -2.528217, 1, 0.7450981, 0, 1,
-1.144805, -0.4755537, -4.697853, 1, 0.7490196, 0, 1,
-1.143631, 1.165867, 0.01101315, 1, 0.7568628, 0, 1,
-1.143585, 0.5546789, -1.035194, 1, 0.7607843, 0, 1,
-1.12845, -0.2205089, -2.953472, 1, 0.7686275, 0, 1,
-1.123245, 0.4627019, -2.241428, 1, 0.772549, 0, 1,
-1.121186, 0.2115174, -1.028479, 1, 0.7803922, 0, 1,
-1.119904, -0.8162385, -1.681909, 1, 0.7843137, 0, 1,
-1.115076, 0.4003738, 0.5855, 1, 0.7921569, 0, 1,
-1.112277, -0.1216194, -2.119426, 1, 0.7960784, 0, 1,
-1.088369, 1.554345, -0.1105515, 1, 0.8039216, 0, 1,
-1.083642, 0.5027637, 0.5812362, 1, 0.8117647, 0, 1,
-1.074826, -0.003864317, -1.536703, 1, 0.8156863, 0, 1,
-1.074319, 0.2047498, 1.119993, 1, 0.8235294, 0, 1,
-1.073432, 0.736007, -0.3524353, 1, 0.827451, 0, 1,
-1.070874, 1.790055, -0.8735845, 1, 0.8352941, 0, 1,
-1.060228, 0.02755681, -3.194439, 1, 0.8392157, 0, 1,
-1.054736, 1.078465, -0.3722429, 1, 0.8470588, 0, 1,
-1.047339, -1.25593, 0.1610994, 1, 0.8509804, 0, 1,
-1.043119, 0.5767966, -0.538652, 1, 0.8588235, 0, 1,
-1.038838, 0.4717757, -1.93068, 1, 0.8627451, 0, 1,
-1.037736, -1.4823, -3.099301, 1, 0.8705882, 0, 1,
-1.0373, 1.608895, -1.682174, 1, 0.8745098, 0, 1,
-1.034798, 1.293197, -1.99652, 1, 0.8823529, 0, 1,
-1.033554, 0.970938, -0.3619926, 1, 0.8862745, 0, 1,
-1.033219, -0.4489489, -2.208411, 1, 0.8941177, 0, 1,
-1.028949, 1.178791, -1.528752, 1, 0.8980392, 0, 1,
-1.01961, 0.5716508, -2.790526, 1, 0.9058824, 0, 1,
-1.018366, 2.299435, -0.08289974, 1, 0.9137255, 0, 1,
-1.008627, -0.9603578, -1.959444, 1, 0.9176471, 0, 1,
-0.9970387, -1.738676, -4.652774, 1, 0.9254902, 0, 1,
-0.9929885, -1.483462, -3.17527, 1, 0.9294118, 0, 1,
-0.9815823, 0.03314016, -1.084471, 1, 0.9372549, 0, 1,
-0.9813186, 0.2132367, -1.060737, 1, 0.9411765, 0, 1,
-0.9772012, -0.02676963, -1.181553, 1, 0.9490196, 0, 1,
-0.9740088, 0.7333126, -1.733444, 1, 0.9529412, 0, 1,
-0.9718323, -1.231992, -3.489607, 1, 0.9607843, 0, 1,
-0.9677125, 0.6675496, -2.091431, 1, 0.9647059, 0, 1,
-0.9632571, -0.4417942, -3.121461, 1, 0.972549, 0, 1,
-0.9622842, -0.4747002, -3.530304, 1, 0.9764706, 0, 1,
-0.9536394, -0.9373834, -3.824482, 1, 0.9843137, 0, 1,
-0.9519112, 0.2929853, -1.615407, 1, 0.9882353, 0, 1,
-0.9471713, -0.5228847, -1.435583, 1, 0.9960784, 0, 1,
-0.9422657, 0.5176368, -0.4529541, 0.9960784, 1, 0, 1,
-0.9389573, -0.6363, -1.177884, 0.9921569, 1, 0, 1,
-0.921139, -0.2822768, -2.388176, 0.9843137, 1, 0, 1,
-0.9209238, 0.1572826, -2.124149, 0.9803922, 1, 0, 1,
-0.9117584, -0.1949601, -1.913729, 0.972549, 1, 0, 1,
-0.9095756, 1.333133, 1.136676, 0.9686275, 1, 0, 1,
-0.9064332, 0.7487812, -1.537076, 0.9607843, 1, 0, 1,
-0.9057689, -1.191531, -2.271653, 0.9568627, 1, 0, 1,
-0.8993089, 0.4745443, -1.848495, 0.9490196, 1, 0, 1,
-0.8955738, 1.051983, 0.9180845, 0.945098, 1, 0, 1,
-0.8880663, -0.6700575, -3.086595, 0.9372549, 1, 0, 1,
-0.8775527, -1.103215, -3.158708, 0.9333333, 1, 0, 1,
-0.8675016, -1.243154, -3.429702, 0.9254902, 1, 0, 1,
-0.8674511, 0.3711884, -0.792344, 0.9215686, 1, 0, 1,
-0.8657559, 1.468127, -1.222516, 0.9137255, 1, 0, 1,
-0.8641334, 0.3662205, -2.111275, 0.9098039, 1, 0, 1,
-0.857025, -0.7625807, -2.04374, 0.9019608, 1, 0, 1,
-0.8550912, 1.148952, -0.1813864, 0.8941177, 1, 0, 1,
-0.8510117, -0.2450879, -2.796746, 0.8901961, 1, 0, 1,
-0.8377452, 0.462958, -1.193317, 0.8823529, 1, 0, 1,
-0.8339916, 0.6094965, -3.236043, 0.8784314, 1, 0, 1,
-0.830272, -0.4166359, -2.140743, 0.8705882, 1, 0, 1,
-0.828595, -0.03433616, -1.651748, 0.8666667, 1, 0, 1,
-0.8248219, 0.16573, -0.963394, 0.8588235, 1, 0, 1,
-0.8223663, 0.1328023, -3.865757, 0.854902, 1, 0, 1,
-0.8205847, -1.19682, -2.261066, 0.8470588, 1, 0, 1,
-0.8198543, 0.9236699, -1.461108, 0.8431373, 1, 0, 1,
-0.8186623, 0.938421, 0.4532825, 0.8352941, 1, 0, 1,
-0.8175742, -0.4309962, -1.792223, 0.8313726, 1, 0, 1,
-0.8135277, 0.8509753, -0.7961056, 0.8235294, 1, 0, 1,
-0.8126217, -2.150487, -2.631146, 0.8196079, 1, 0, 1,
-0.8082539, 0.2962894, -2.647823, 0.8117647, 1, 0, 1,
-0.8061774, -1.16304, -0.2361908, 0.8078431, 1, 0, 1,
-0.8037794, -0.4072087, -2.374336, 0.8, 1, 0, 1,
-0.8000346, -0.3993974, -1.379588, 0.7921569, 1, 0, 1,
-0.7987897, 0.5285708, -1.934117, 0.7882353, 1, 0, 1,
-0.7960385, 0.1457973, -0.8799551, 0.7803922, 1, 0, 1,
-0.7919818, 1.297993, -0.6609184, 0.7764706, 1, 0, 1,
-0.7871833, -0.2491853, -1.190172, 0.7686275, 1, 0, 1,
-0.7770371, 0.4373068, -2.504154, 0.7647059, 1, 0, 1,
-0.7767145, 0.2593802, -0.782007, 0.7568628, 1, 0, 1,
-0.7745142, -1.053142, -2.129427, 0.7529412, 1, 0, 1,
-0.7680652, -1.159631, -4.254313, 0.7450981, 1, 0, 1,
-0.7679977, -0.8776402, -3.481895, 0.7411765, 1, 0, 1,
-0.7679215, -1.54663, -1.433754, 0.7333333, 1, 0, 1,
-0.7629149, 0.8850998, -0.728441, 0.7294118, 1, 0, 1,
-0.7612274, 0.08397274, -2.378037, 0.7215686, 1, 0, 1,
-0.7594455, -0.595681, -3.237872, 0.7176471, 1, 0, 1,
-0.7560999, -0.2758494, -0.9992728, 0.7098039, 1, 0, 1,
-0.7531987, 0.4103146, -0.5577924, 0.7058824, 1, 0, 1,
-0.7522669, 0.1839553, -1.865329, 0.6980392, 1, 0, 1,
-0.7472776, 0.9391534, -1.050766, 0.6901961, 1, 0, 1,
-0.7457727, 0.002145315, -0.7118254, 0.6862745, 1, 0, 1,
-0.7450007, -0.9764497, -2.352838, 0.6784314, 1, 0, 1,
-0.7414834, 0.1445201, -0.6312101, 0.6745098, 1, 0, 1,
-0.7407742, -0.5728684, -2.459746, 0.6666667, 1, 0, 1,
-0.7403294, -0.3220759, -0.1148643, 0.6627451, 1, 0, 1,
-0.7402629, 0.4271291, -1.377446, 0.654902, 1, 0, 1,
-0.7367108, 0.1135014, -0.8663186, 0.6509804, 1, 0, 1,
-0.7334542, -0.1426014, -3.857123, 0.6431373, 1, 0, 1,
-0.7302376, -0.2081854, -2.475731, 0.6392157, 1, 0, 1,
-0.7295101, 0.5002291, 0.09025239, 0.6313726, 1, 0, 1,
-0.7294959, -2.043089, -3.938977, 0.627451, 1, 0, 1,
-0.7227792, 0.5388229, -1.484384, 0.6196079, 1, 0, 1,
-0.7212107, 0.2957444, 0.1068241, 0.6156863, 1, 0, 1,
-0.718842, -0.1132218, -2.455543, 0.6078432, 1, 0, 1,
-0.7184808, 0.3019504, -4.502038, 0.6039216, 1, 0, 1,
-0.7173029, -1.23941, -3.25449, 0.5960785, 1, 0, 1,
-0.717222, -1.248685, -1.621867, 0.5882353, 1, 0, 1,
-0.7095565, -0.9878576, -4.232833, 0.5843138, 1, 0, 1,
-0.7076207, 1.016295, 0.6797475, 0.5764706, 1, 0, 1,
-0.7074018, 0.2177522, -2.424165, 0.572549, 1, 0, 1,
-0.7067217, -0.3091866, -2.806813, 0.5647059, 1, 0, 1,
-0.7045749, -1.301116, -1.771758, 0.5607843, 1, 0, 1,
-0.7029949, 0.8101152, -1.711525, 0.5529412, 1, 0, 1,
-0.7027777, 0.1613346, 0.4160909, 0.5490196, 1, 0, 1,
-0.7027296, -0.2729304, -1.508872, 0.5411765, 1, 0, 1,
-0.7020192, -1.18743, -2.231684, 0.5372549, 1, 0, 1,
-0.6999007, 2.420572, -0.7422519, 0.5294118, 1, 0, 1,
-0.6986971, -0.5382375, -3.70434, 0.5254902, 1, 0, 1,
-0.6915159, -0.3737458, -1.62325, 0.5176471, 1, 0, 1,
-0.6899516, 0.268013, -0.2249814, 0.5137255, 1, 0, 1,
-0.6881223, 0.1398959, -0.0654925, 0.5058824, 1, 0, 1,
-0.686615, -0.4864402, -1.538602, 0.5019608, 1, 0, 1,
-0.6847242, -1.511475, -1.869614, 0.4941176, 1, 0, 1,
-0.6828216, 1.948655, 0.6836414, 0.4862745, 1, 0, 1,
-0.6810586, 0.605328, -1.117252, 0.4823529, 1, 0, 1,
-0.6784561, -1.650676, -2.153646, 0.4745098, 1, 0, 1,
-0.6700801, 0.3354388, -1.324196, 0.4705882, 1, 0, 1,
-0.6687583, 0.1940998, -0.4936193, 0.4627451, 1, 0, 1,
-0.6673736, -0.7458247, -3.075796, 0.4588235, 1, 0, 1,
-0.6650888, 0.4035027, -2.014527, 0.4509804, 1, 0, 1,
-0.6616004, 0.5934034, -0.8389079, 0.4470588, 1, 0, 1,
-0.6567413, 1.387016, 0.1255177, 0.4392157, 1, 0, 1,
-0.6554249, 1.361923, -1.417974, 0.4352941, 1, 0, 1,
-0.6544166, -1.167651, -2.326078, 0.427451, 1, 0, 1,
-0.6500153, 1.502543, 0.3688572, 0.4235294, 1, 0, 1,
-0.6457041, -1.889238, -2.207893, 0.4156863, 1, 0, 1,
-0.6441431, 1.578232, -1.629959, 0.4117647, 1, 0, 1,
-0.6414068, 0.7129102, -1.928791, 0.4039216, 1, 0, 1,
-0.6376277, 0.2218971, -0.9234414, 0.3960784, 1, 0, 1,
-0.6308191, -2.103997, -2.144627, 0.3921569, 1, 0, 1,
-0.6305472, -0.6876566, -2.253518, 0.3843137, 1, 0, 1,
-0.628891, 0.3322262, 0.1200908, 0.3803922, 1, 0, 1,
-0.6259472, -1.439301, -2.600529, 0.372549, 1, 0, 1,
-0.6239158, -0.006228247, -1.824171, 0.3686275, 1, 0, 1,
-0.6217149, -1.766409, -3.164325, 0.3607843, 1, 0, 1,
-0.6158766, -0.8739724, -2.175635, 0.3568628, 1, 0, 1,
-0.6154563, 0.07805283, -0.7395414, 0.3490196, 1, 0, 1,
-0.6073889, -0.8678405, -2.215226, 0.345098, 1, 0, 1,
-0.6055676, 0.4160252, -2.031429, 0.3372549, 1, 0, 1,
-0.6039727, 0.2792539, 0.9957469, 0.3333333, 1, 0, 1,
-0.5935102, -0.1752761, -1.690418, 0.3254902, 1, 0, 1,
-0.5907603, 0.2498701, -2.32649, 0.3215686, 1, 0, 1,
-0.5899814, 0.195367, -0.1932725, 0.3137255, 1, 0, 1,
-0.589298, 0.8895475, -0.6634702, 0.3098039, 1, 0, 1,
-0.5851074, -0.2472228, -1.269345, 0.3019608, 1, 0, 1,
-0.5795751, 1.818944, 0.5447428, 0.2941177, 1, 0, 1,
-0.5779417, 0.5320497, -0.6828937, 0.2901961, 1, 0, 1,
-0.5750064, -0.3177232, -2.644552, 0.282353, 1, 0, 1,
-0.5695202, -0.4936967, -2.216732, 0.2784314, 1, 0, 1,
-0.5688493, 0.9557359, -0.4899468, 0.2705882, 1, 0, 1,
-0.562308, 1.136252, 0.7561481, 0.2666667, 1, 0, 1,
-0.5621672, -1.243678, -2.362666, 0.2588235, 1, 0, 1,
-0.5599864, 0.4831779, -0.8753639, 0.254902, 1, 0, 1,
-0.5567217, 0.6591226, 0.4856177, 0.2470588, 1, 0, 1,
-0.556125, -0.4714839, -2.167983, 0.2431373, 1, 0, 1,
-0.5543925, 0.5347655, -1.570418, 0.2352941, 1, 0, 1,
-0.5537368, 1.308526, -0.469077, 0.2313726, 1, 0, 1,
-0.5468706, -1.546006, -1.815458, 0.2235294, 1, 0, 1,
-0.5468539, 0.499243, 0.009842628, 0.2196078, 1, 0, 1,
-0.5381945, 0.2059959, -2.460795, 0.2117647, 1, 0, 1,
-0.5347075, -0.8113818, -1.56998, 0.2078431, 1, 0, 1,
-0.5343552, 1.15514, -1.707122, 0.2, 1, 0, 1,
-0.5306381, 1.099049, -1.153102, 0.1921569, 1, 0, 1,
-0.5295269, -2.485247, -3.020534, 0.1882353, 1, 0, 1,
-0.5294243, -0.5087439, -1.822188, 0.1803922, 1, 0, 1,
-0.5286967, -0.4828463, -2.460315, 0.1764706, 1, 0, 1,
-0.5267919, 0.3909973, -2.725614, 0.1686275, 1, 0, 1,
-0.5246577, -0.7246174, -2.928049, 0.1647059, 1, 0, 1,
-0.5237756, -0.3150199, -0.5763559, 0.1568628, 1, 0, 1,
-0.5231221, 1.380528, 0.3103841, 0.1529412, 1, 0, 1,
-0.5220572, 1.035392, -0.2820822, 0.145098, 1, 0, 1,
-0.5219564, 1.189003, 0.5463029, 0.1411765, 1, 0, 1,
-0.5166386, 0.4998964, -1.101781, 0.1333333, 1, 0, 1,
-0.509582, 0.2436107, 0.8243757, 0.1294118, 1, 0, 1,
-0.5075278, -0.6709282, -2.221886, 0.1215686, 1, 0, 1,
-0.5062941, -1.049548, -2.185373, 0.1176471, 1, 0, 1,
-0.5060079, -0.6811889, -1.524142, 0.1098039, 1, 0, 1,
-0.4944645, -0.3599517, -2.282365, 0.1058824, 1, 0, 1,
-0.4925797, 0.6969271, 0.2770132, 0.09803922, 1, 0, 1,
-0.490356, 0.1640441, -1.654633, 0.09019608, 1, 0, 1,
-0.489336, 0.1852809, -1.430812, 0.08627451, 1, 0, 1,
-0.4851578, -0.7711344, -1.090568, 0.07843138, 1, 0, 1,
-0.4835751, -1.513386, -2.35988, 0.07450981, 1, 0, 1,
-0.4833211, -0.7638025, -2.515879, 0.06666667, 1, 0, 1,
-0.4826141, -0.4799031, -2.747225, 0.0627451, 1, 0, 1,
-0.4817283, -1.321973, 0.07388289, 0.05490196, 1, 0, 1,
-0.4789037, 0.7434872, 0.6233817, 0.05098039, 1, 0, 1,
-0.474957, -0.1286075, -0.7583676, 0.04313726, 1, 0, 1,
-0.4727643, -0.1100044, -2.947341, 0.03921569, 1, 0, 1,
-0.4720877, -0.3535221, -1.763113, 0.03137255, 1, 0, 1,
-0.4682009, -2.230151, -2.451025, 0.02745098, 1, 0, 1,
-0.4651179, 0.2058269, -0.5382957, 0.01960784, 1, 0, 1,
-0.4615842, 0.07341416, -0.9381345, 0.01568628, 1, 0, 1,
-0.4579121, -0.913459, -1.582003, 0.007843138, 1, 0, 1,
-0.4572811, -0.5748554, -3.014606, 0.003921569, 1, 0, 1,
-0.4556068, 0.1537812, 0.02572697, 0, 1, 0.003921569, 1,
-0.454641, -0.04645205, -1.018294, 0, 1, 0.01176471, 1,
-0.4521488, -0.38236, -1.765045, 0, 1, 0.01568628, 1,
-0.4504835, -0.4929487, -2.104155, 0, 1, 0.02352941, 1,
-0.4498893, 2.117584, 1.989851, 0, 1, 0.02745098, 1,
-0.4457691, 0.1776427, -0.7196957, 0, 1, 0.03529412, 1,
-0.4448197, 1.57504, -0.4870369, 0, 1, 0.03921569, 1,
-0.4424201, -0.3309505, -5.055586, 0, 1, 0.04705882, 1,
-0.4365025, 1.674374, -0.07854133, 0, 1, 0.05098039, 1,
-0.4318724, -0.04580373, -2.177155, 0, 1, 0.05882353, 1,
-0.4273689, 2.157079, -1.498857, 0, 1, 0.0627451, 1,
-0.4272837, 1.193397, -0.1530047, 0, 1, 0.07058824, 1,
-0.4272593, -1.380988, -3.516071, 0, 1, 0.07450981, 1,
-0.4235004, -0.7587035, -3.79765, 0, 1, 0.08235294, 1,
-0.4212958, -0.3314535, -2.227796, 0, 1, 0.08627451, 1,
-0.4207431, -0.3669063, -0.9062059, 0, 1, 0.09411765, 1,
-0.4200334, -0.5472692, -3.430519, 0, 1, 0.1019608, 1,
-0.41761, -0.1319575, -2.869133, 0, 1, 0.1058824, 1,
-0.4164546, 1.050086, -0.9112645, 0, 1, 0.1137255, 1,
-0.4098826, -0.7158401, -3.721869, 0, 1, 0.1176471, 1,
-0.4002706, 0.3374837, 0.5392807, 0, 1, 0.1254902, 1,
-0.3999952, -1.131595, -2.919954, 0, 1, 0.1294118, 1,
-0.3967804, -1.355077, -3.567331, 0, 1, 0.1372549, 1,
-0.3909755, 0.4451869, -1.598714, 0, 1, 0.1411765, 1,
-0.3888883, 0.4671844, 0.03482119, 0, 1, 0.1490196, 1,
-0.3820194, -0.7046248, -5.195392, 0, 1, 0.1529412, 1,
-0.3793515, 0.4240902, -0.9534591, 0, 1, 0.1607843, 1,
-0.3736867, 0.3884919, -0.05441914, 0, 1, 0.1647059, 1,
-0.3730382, -0.1226296, -0.9286187, 0, 1, 0.172549, 1,
-0.3703119, 0.4901014, -0.9455558, 0, 1, 0.1764706, 1,
-0.3696842, 0.2094377, -0.7926428, 0, 1, 0.1843137, 1,
-0.3654612, 0.4323501, -1.261383, 0, 1, 0.1882353, 1,
-0.3635105, 0.890238, -0.7665163, 0, 1, 0.1960784, 1,
-0.3568609, 0.5766689, -1.467712, 0, 1, 0.2039216, 1,
-0.3529591, 0.7564828, -0.7719442, 0, 1, 0.2078431, 1,
-0.3455593, -0.5517296, -3.564654, 0, 1, 0.2156863, 1,
-0.3435479, -0.5089938, -2.613753, 0, 1, 0.2196078, 1,
-0.343211, -0.7926469, -4.255529, 0, 1, 0.227451, 1,
-0.342032, 0.6749576, -0.06770916, 0, 1, 0.2313726, 1,
-0.338226, -0.1801213, -3.180629, 0, 1, 0.2392157, 1,
-0.3371121, 0.4807229, -1.811449, 0, 1, 0.2431373, 1,
-0.3348874, 0.568671, -0.9978194, 0, 1, 0.2509804, 1,
-0.3308257, 0.09831724, -2.573158, 0, 1, 0.254902, 1,
-0.3306912, -0.3038883, -0.8172814, 0, 1, 0.2627451, 1,
-0.3294592, -0.07878455, 0.1122429, 0, 1, 0.2666667, 1,
-0.3278339, 0.05019147, -2.450371, 0, 1, 0.2745098, 1,
-0.3249794, -1.010971, -4.335658, 0, 1, 0.2784314, 1,
-0.3222615, 0.413956, -0.02973404, 0, 1, 0.2862745, 1,
-0.3196178, -0.183436, -2.779325, 0, 1, 0.2901961, 1,
-0.3122801, 0.1637449, 0.8699931, 0, 1, 0.2980392, 1,
-0.3098191, 0.312668, -0.7429326, 0, 1, 0.3058824, 1,
-0.3086456, -1.788965, -3.944842, 0, 1, 0.3098039, 1,
-0.3075739, -2.417759, -3.805848, 0, 1, 0.3176471, 1,
-0.3073691, -0.7439135, -3.219347, 0, 1, 0.3215686, 1,
-0.3066263, -0.6257084, -2.185838, 0, 1, 0.3294118, 1,
-0.3050045, -0.3819328, -1.987505, 0, 1, 0.3333333, 1,
-0.3029763, 0.4099869, -1.790655, 0, 1, 0.3411765, 1,
-0.2936813, 1.713677, -0.5196669, 0, 1, 0.345098, 1,
-0.2923513, -0.4085178, -1.491692, 0, 1, 0.3529412, 1,
-0.2879308, 2.522651, -2.605412, 0, 1, 0.3568628, 1,
-0.2872508, -2.447369, -3.067413, 0, 1, 0.3647059, 1,
-0.2781892, 0.0008833189, -2.254385, 0, 1, 0.3686275, 1,
-0.2771674, 0.01992336, -1.554217, 0, 1, 0.3764706, 1,
-0.2713475, -0.4044311, -2.528316, 0, 1, 0.3803922, 1,
-0.2711638, 0.4085811, 0.582528, 0, 1, 0.3882353, 1,
-0.2710238, 0.8738587, 0.06104412, 0, 1, 0.3921569, 1,
-0.2698291, -1.349775, -2.127448, 0, 1, 0.4, 1,
-0.2640752, -1.724172, -4.165953, 0, 1, 0.4078431, 1,
-0.2548387, 0.3057662, -0.6707813, 0, 1, 0.4117647, 1,
-0.2527585, -0.7724316, -2.297488, 0, 1, 0.4196078, 1,
-0.2508897, 0.7631524, 0.1408143, 0, 1, 0.4235294, 1,
-0.2473255, -1.672836, -3.164, 0, 1, 0.4313726, 1,
-0.2463708, 0.369799, -2.42227, 0, 1, 0.4352941, 1,
-0.2450467, -0.6770658, -4.775262, 0, 1, 0.4431373, 1,
-0.2445748, 3.405387, -1.035814, 0, 1, 0.4470588, 1,
-0.2416162, 0.5669369, -0.03770199, 0, 1, 0.454902, 1,
-0.2408473, 2.081689, -0.6450035, 0, 1, 0.4588235, 1,
-0.2403994, 0.5999902, 0.4221602, 0, 1, 0.4666667, 1,
-0.2292387, -0.1000742, -2.083577, 0, 1, 0.4705882, 1,
-0.2285849, 1.257859, 0.3820952, 0, 1, 0.4784314, 1,
-0.2283298, 0.8045855, -0.6467586, 0, 1, 0.4823529, 1,
-0.225562, -0.4757872, -0.9314293, 0, 1, 0.4901961, 1,
-0.2224778, -1.142199, -2.207883, 0, 1, 0.4941176, 1,
-0.222183, -0.2608745, -2.608631, 0, 1, 0.5019608, 1,
-0.221522, 0.1908494, 0.957783, 0, 1, 0.509804, 1,
-0.220939, 0.5025909, -1.061313, 0, 1, 0.5137255, 1,
-0.2144163, 0.6084457, -0.4207862, 0, 1, 0.5215687, 1,
-0.212467, 0.2439041, -0.6906819, 0, 1, 0.5254902, 1,
-0.2120422, -1.53147, -2.726197, 0, 1, 0.5333334, 1,
-0.2087935, 0.6849341, 1.66429, 0, 1, 0.5372549, 1,
-0.2040581, -0.6037849, -4.57104, 0, 1, 0.5450981, 1,
-0.2031315, 0.4542531, -0.3463843, 0, 1, 0.5490196, 1,
-0.2020101, -1.491025, -4.296823, 0, 1, 0.5568628, 1,
-0.1997236, -0.8834541, -4.661811, 0, 1, 0.5607843, 1,
-0.1981471, 0.3172963, -0.2782066, 0, 1, 0.5686275, 1,
-0.19091, -0.4279107, -2.339077, 0, 1, 0.572549, 1,
-0.1908754, 0.6536788, -0.03819421, 0, 1, 0.5803922, 1,
-0.1904315, -1.075287, -1.504152, 0, 1, 0.5843138, 1,
-0.1893644, -1.035015, -1.839921, 0, 1, 0.5921569, 1,
-0.1873295, -0.321559, -2.378478, 0, 1, 0.5960785, 1,
-0.1862043, 1.049783, 0.09297791, 0, 1, 0.6039216, 1,
-0.1842699, 0.1512828, -0.8348639, 0, 1, 0.6117647, 1,
-0.1836878, -0.3523639, -0.9910133, 0, 1, 0.6156863, 1,
-0.1825768, 0.4100082, 0.4052249, 0, 1, 0.6235294, 1,
-0.1818704, -0.9913387, -2.537113, 0, 1, 0.627451, 1,
-0.1818036, -0.1141126, -1.168524, 0, 1, 0.6352941, 1,
-0.1747847, -0.2318629, -3.458122, 0, 1, 0.6392157, 1,
-0.1741056, 0.1452601, -1.079898, 0, 1, 0.6470588, 1,
-0.1722578, -2.273086, -3.296438, 0, 1, 0.6509804, 1,
-0.1664504, 3.504704, -0.3966778, 0, 1, 0.6588235, 1,
-0.1576366, -0.4822449, -2.638366, 0, 1, 0.6627451, 1,
-0.1564458, -1.803064, -1.927419, 0, 1, 0.6705883, 1,
-0.1555017, 0.5550784, -0.5580356, 0, 1, 0.6745098, 1,
-0.1552963, 0.3844258, 0.8974723, 0, 1, 0.682353, 1,
-0.1529226, 1.186817, 0.8131218, 0, 1, 0.6862745, 1,
-0.1493806, 0.6260622, -0.9281479, 0, 1, 0.6941177, 1,
-0.1474498, 0.8255678, 0.3553644, 0, 1, 0.7019608, 1,
-0.1464503, 0.4419199, -2.213681, 0, 1, 0.7058824, 1,
-0.1447441, -0.6884282, -1.438501, 0, 1, 0.7137255, 1,
-0.143989, 1.37666, 0.7830406, 0, 1, 0.7176471, 1,
-0.1420957, -0.6640828, -2.741738, 0, 1, 0.7254902, 1,
-0.1341726, 0.1731421, 0.8034574, 0, 1, 0.7294118, 1,
-0.1245591, -0.07393537, -2.713048, 0, 1, 0.7372549, 1,
-0.1179854, -0.4548343, -1.671499, 0, 1, 0.7411765, 1,
-0.1176719, 0.9535535, -0.579892, 0, 1, 0.7490196, 1,
-0.1166283, -0.8470116, -2.269792, 0, 1, 0.7529412, 1,
-0.1164479, -0.6334904, -3.55172, 0, 1, 0.7607843, 1,
-0.110887, -0.3889003, -1.178297, 0, 1, 0.7647059, 1,
-0.1079044, -1.678897, -3.658357, 0, 1, 0.772549, 1,
-0.1069181, -0.1083436, -2.3733, 0, 1, 0.7764706, 1,
-0.1014207, -2.408996, -2.791669, 0, 1, 0.7843137, 1,
-0.09862369, 0.4817575, 1.236242, 0, 1, 0.7882353, 1,
-0.09704224, 0.2504342, -0.5503391, 0, 1, 0.7960784, 1,
-0.09578669, 1.012303, 0.4493584, 0, 1, 0.8039216, 1,
-0.09429077, 0.3265954, -0.7110708, 0, 1, 0.8078431, 1,
-0.09380784, -0.3163715, -3.30872, 0, 1, 0.8156863, 1,
-0.09281317, -0.855835, -2.152505, 0, 1, 0.8196079, 1,
-0.09220694, 1.673295, 0.9181567, 0, 1, 0.827451, 1,
-0.09133545, -0.180462, -0.9304768, 0, 1, 0.8313726, 1,
-0.08977609, 0.3133327, -0.6837515, 0, 1, 0.8392157, 1,
-0.08814847, 0.3246459, -0.1751888, 0, 1, 0.8431373, 1,
-0.08559133, -0.2257721, -2.639402, 0, 1, 0.8509804, 1,
-0.085376, -0.06545452, -2.387379, 0, 1, 0.854902, 1,
-0.0813896, 0.7647503, -0.9991987, 0, 1, 0.8627451, 1,
-0.07976065, 1.114549, 0.6115994, 0, 1, 0.8666667, 1,
-0.07843319, 0.06212387, -1.197774, 0, 1, 0.8745098, 1,
-0.07544452, 0.5934299, -1.873114, 0, 1, 0.8784314, 1,
-0.07444553, -0.1132986, -4.801965, 0, 1, 0.8862745, 1,
-0.07073171, 0.7885332, -1.098449, 0, 1, 0.8901961, 1,
-0.06789583, -0.2828867, -2.709245, 0, 1, 0.8980392, 1,
-0.06677413, 0.2556604, 0.2102041, 0, 1, 0.9058824, 1,
-0.06506994, -2.925351, -4.641315, 0, 1, 0.9098039, 1,
-0.06353333, -1.255961, -1.340464, 0, 1, 0.9176471, 1,
-0.06314193, -0.6686566, -2.550295, 0, 1, 0.9215686, 1,
-0.06201625, 0.6541613, 0.2118279, 0, 1, 0.9294118, 1,
-0.06160937, 0.3471685, 0.340911, 0, 1, 0.9333333, 1,
-0.05613349, -0.6437054, -1.728369, 0, 1, 0.9411765, 1,
-0.05486233, -1.973083, -3.356071, 0, 1, 0.945098, 1,
-0.05443751, -0.8366756, -3.439449, 0, 1, 0.9529412, 1,
-0.05329222, -1.613158, -4.690259, 0, 1, 0.9568627, 1,
-0.0481184, 0.7535686, -1.877574, 0, 1, 0.9647059, 1,
-0.04810893, -0.6273094, -3.45911, 0, 1, 0.9686275, 1,
-0.04158184, 0.2730387, 0.380531, 0, 1, 0.9764706, 1,
-0.0390317, -2.472935, -3.737524, 0, 1, 0.9803922, 1,
-0.0373812, -0.1312679, -2.830485, 0, 1, 0.9882353, 1,
-0.03473361, -0.3713852, -2.381275, 0, 1, 0.9921569, 1,
-0.03004595, -1.183938, -4.540322, 0, 1, 1, 1,
-0.02677127, -0.4449434, -3.777577, 0, 0.9921569, 1, 1,
-0.02552484, 0.09426517, 0.5422841, 0, 0.9882353, 1, 1,
-0.02119094, 0.6763689, 1.168729, 0, 0.9803922, 1, 1,
-0.01398686, -0.1464299, -3.606439, 0, 0.9764706, 1, 1,
-0.0137155, -0.6798083, -3.502938, 0, 0.9686275, 1, 1,
0.004177185, 0.04821507, -0.8135389, 0, 0.9647059, 1, 1,
0.005465866, 0.5979767, -1.356651, 0, 0.9568627, 1, 1,
0.005907597, -0.7614335, 2.905546, 0, 0.9529412, 1, 1,
0.01075635, -0.008062504, 2.534017, 0, 0.945098, 1, 1,
0.01210824, -0.940973, 4.757782, 0, 0.9411765, 1, 1,
0.01303353, -1.665139, 2.271522, 0, 0.9333333, 1, 1,
0.01415511, 0.7814413, -0.1308717, 0, 0.9294118, 1, 1,
0.01992572, 1.866604, -1.65757, 0, 0.9215686, 1, 1,
0.02821354, 0.4269972, 1.088384, 0, 0.9176471, 1, 1,
0.03026122, -0.3047384, 0.4447967, 0, 0.9098039, 1, 1,
0.0320648, -0.03113341, 2.219419, 0, 0.9058824, 1, 1,
0.03609393, -0.9501423, 1.802218, 0, 0.8980392, 1, 1,
0.03641244, 1.244852, 1.541193, 0, 0.8901961, 1, 1,
0.04011354, 1.135521, -1.29724, 0, 0.8862745, 1, 1,
0.04303049, -0.1093559, 4.161966, 0, 0.8784314, 1, 1,
0.04466216, -0.330017, 2.752247, 0, 0.8745098, 1, 1,
0.04518772, 0.4033636, 0.8663493, 0, 0.8666667, 1, 1,
0.05000735, -0.7985124, 3.751039, 0, 0.8627451, 1, 1,
0.05545733, -0.01557049, 1.154258, 0, 0.854902, 1, 1,
0.05628415, -2.030737, 3.038496, 0, 0.8509804, 1, 1,
0.057692, 0.7826485, -0.2264658, 0, 0.8431373, 1, 1,
0.05800533, 1.288214, -0.2269103, 0, 0.8392157, 1, 1,
0.06075028, 1.320383, 0.1713717, 0, 0.8313726, 1, 1,
0.06437705, 0.3206206, -0.8793655, 0, 0.827451, 1, 1,
0.06995662, 0.02133993, 0.0048794, 0, 0.8196079, 1, 1,
0.07198507, -0.6447877, 3.583037, 0, 0.8156863, 1, 1,
0.07997077, -0.6321908, 4.805289, 0, 0.8078431, 1, 1,
0.08207859, 0.06741887, 1.103545, 0, 0.8039216, 1, 1,
0.08383954, -1.320737, 2.828913, 0, 0.7960784, 1, 1,
0.08517159, -1.288047, 5.781723, 0, 0.7882353, 1, 1,
0.08586267, 0.1607234, -0.03108982, 0, 0.7843137, 1, 1,
0.08987403, 1.51738, 1.638409, 0, 0.7764706, 1, 1,
0.09568131, 1.275506, 0.1931584, 0, 0.772549, 1, 1,
0.09572437, 0.1046745, 0.5666775, 0, 0.7647059, 1, 1,
0.09724318, -0.1382376, 2.568962, 0, 0.7607843, 1, 1,
0.1014756, -0.4242584, 3.506598, 0, 0.7529412, 1, 1,
0.1039353, 0.2613803, 0.533361, 0, 0.7490196, 1, 1,
0.1056806, -0.8252689, 2.798594, 0, 0.7411765, 1, 1,
0.106135, 0.09233959, 1.017601, 0, 0.7372549, 1, 1,
0.1095775, 1.8963, -0.7002495, 0, 0.7294118, 1, 1,
0.1123297, -0.8853024, 1.767924, 0, 0.7254902, 1, 1,
0.1266514, 0.1365914, 0.3468078, 0, 0.7176471, 1, 1,
0.1292726, -0.3180201, 2.191335, 0, 0.7137255, 1, 1,
0.1296927, 1.389372, -0.7161678, 0, 0.7058824, 1, 1,
0.1365829, 0.8096134, -0.5054547, 0, 0.6980392, 1, 1,
0.1387702, -0.4441822, 4.14944, 0, 0.6941177, 1, 1,
0.1409528, 0.1458803, 0.3025495, 0, 0.6862745, 1, 1,
0.1422338, 0.1098405, 1.383987, 0, 0.682353, 1, 1,
0.1458064, 0.237666, 1.184895, 0, 0.6745098, 1, 1,
0.1508327, -0.9412127, 3.728217, 0, 0.6705883, 1, 1,
0.1574525, 0.4906012, -1.164545, 0, 0.6627451, 1, 1,
0.1652986, -0.3450369, 0.963963, 0, 0.6588235, 1, 1,
0.166907, 1.128104, -0.1171325, 0, 0.6509804, 1, 1,
0.1698827, 1.007595, 0.3734121, 0, 0.6470588, 1, 1,
0.1802853, 0.8900328, -0.7862372, 0, 0.6392157, 1, 1,
0.1878865, 1.002555, -0.3915422, 0, 0.6352941, 1, 1,
0.1883423, 0.2295172, 1.476717, 0, 0.627451, 1, 1,
0.193221, -1.245833, 4.597305, 0, 0.6235294, 1, 1,
0.1966431, 0.4955129, 0.06033457, 0, 0.6156863, 1, 1,
0.2002477, 0.2861608, 1.330948, 0, 0.6117647, 1, 1,
0.2066707, 3.243322, 0.03537888, 0, 0.6039216, 1, 1,
0.2081803, 0.0244811, 2.022129, 0, 0.5960785, 1, 1,
0.2095052, 0.5923694, -0.4171167, 0, 0.5921569, 1, 1,
0.21001, 0.02595487, 3.094214, 0, 0.5843138, 1, 1,
0.2103304, -1.210778, 2.735475, 0, 0.5803922, 1, 1,
0.2125704, 1.687921, 0.8225892, 0, 0.572549, 1, 1,
0.2130602, 0.03111705, 1.132315, 0, 0.5686275, 1, 1,
0.2137001, -0.1885363, 0.8330927, 0, 0.5607843, 1, 1,
0.21484, 0.9456618, 0.7858509, 0, 0.5568628, 1, 1,
0.2156629, -1.586657, 4.737734, 0, 0.5490196, 1, 1,
0.2203671, -0.04592206, 2.195916, 0, 0.5450981, 1, 1,
0.2215646, 0.2736508, 1.035829, 0, 0.5372549, 1, 1,
0.2234893, -0.8938617, 1.871634, 0, 0.5333334, 1, 1,
0.2238133, 0.991339, -1.187473, 0, 0.5254902, 1, 1,
0.2238689, -1.549612, 4.557412, 0, 0.5215687, 1, 1,
0.2251389, 0.1044115, 0.02950149, 0, 0.5137255, 1, 1,
0.2254926, 0.4417605, 1.486787, 0, 0.509804, 1, 1,
0.2255828, 0.06506122, 2.444014, 0, 0.5019608, 1, 1,
0.2257092, -0.7920968, 3.08745, 0, 0.4941176, 1, 1,
0.22736, 0.914946, 1.435048, 0, 0.4901961, 1, 1,
0.2284211, -1.508262, 3.294903, 0, 0.4823529, 1, 1,
0.2295178, 1.465841, 1.346935, 0, 0.4784314, 1, 1,
0.2322695, -0.5511578, 1.676066, 0, 0.4705882, 1, 1,
0.2323924, 1.112772, -0.6985683, 0, 0.4666667, 1, 1,
0.23295, -1.040049, 2.65374, 0, 0.4588235, 1, 1,
0.2331473, 0.1270323, 1.023654, 0, 0.454902, 1, 1,
0.2355097, -1.158942, 1.857889, 0, 0.4470588, 1, 1,
0.2369885, 0.2354241, -0.7418122, 0, 0.4431373, 1, 1,
0.2396, -0.2382651, 1.330619, 0, 0.4352941, 1, 1,
0.2412282, -0.6054307, 2.787896, 0, 0.4313726, 1, 1,
0.2414377, -1.385379, 3.126294, 0, 0.4235294, 1, 1,
0.2438231, -0.6100901, 1.465581, 0, 0.4196078, 1, 1,
0.2469188, 0.2454194, 0.4806665, 0, 0.4117647, 1, 1,
0.2536559, -0.8533419, 2.343378, 0, 0.4078431, 1, 1,
0.2558971, -0.04560822, 0.5462332, 0, 0.4, 1, 1,
0.2646051, 1.703937, -0.09593578, 0, 0.3921569, 1, 1,
0.2692621, 0.5683866, 0.3986665, 0, 0.3882353, 1, 1,
0.2704856, -3.886771, 4.57227, 0, 0.3803922, 1, 1,
0.2708495, -1.488617, 4.289523, 0, 0.3764706, 1, 1,
0.2711917, -0.9156771, 4.024633, 0, 0.3686275, 1, 1,
0.2716443, -0.7712232, 3.265027, 0, 0.3647059, 1, 1,
0.2747643, 1.131439, 0.3732753, 0, 0.3568628, 1, 1,
0.2782994, -1.185538, 4.796407, 0, 0.3529412, 1, 1,
0.2784833, 0.5166311, 0.2261151, 0, 0.345098, 1, 1,
0.2796893, -0.3123743, 0.9941108, 0, 0.3411765, 1, 1,
0.2806448, -0.3752278, 3.443962, 0, 0.3333333, 1, 1,
0.2841324, 0.03562088, 1.513457, 0, 0.3294118, 1, 1,
0.2862659, 0.7387941, 1.763305, 0, 0.3215686, 1, 1,
0.2863995, 1.360276, 2.177933, 0, 0.3176471, 1, 1,
0.2883345, -1.957054, 2.959411, 0, 0.3098039, 1, 1,
0.2910945, 1.141717, 0.6236119, 0, 0.3058824, 1, 1,
0.2912592, -0.8104423, 3.421671, 0, 0.2980392, 1, 1,
0.292638, 0.4360462, 2.541191, 0, 0.2901961, 1, 1,
0.2938019, 0.5039985, -0.7372237, 0, 0.2862745, 1, 1,
0.304082, -0.6285262, 2.841621, 0, 0.2784314, 1, 1,
0.3045637, 2.595231, 1.521336, 0, 0.2745098, 1, 1,
0.306426, 1.305179, -0.2153865, 0, 0.2666667, 1, 1,
0.3095298, -1.151029, 1.298397, 0, 0.2627451, 1, 1,
0.3124289, 1.420479, -0.06584828, 0, 0.254902, 1, 1,
0.3146976, -0.5458036, 3.504635, 0, 0.2509804, 1, 1,
0.3179937, 0.2981948, -0.177261, 0, 0.2431373, 1, 1,
0.3219767, 0.252253, 0.355051, 0, 0.2392157, 1, 1,
0.3224635, -0.4320679, 3.083982, 0, 0.2313726, 1, 1,
0.3233543, -0.401232, 3.477054, 0, 0.227451, 1, 1,
0.3251963, -1.670345, 1.338137, 0, 0.2196078, 1, 1,
0.3269615, 0.0880942, 1.518201, 0, 0.2156863, 1, 1,
0.3326707, 0.5386207, 1.514891, 0, 0.2078431, 1, 1,
0.3419127, -2.134906, 3.991727, 0, 0.2039216, 1, 1,
0.3426964, 0.263907, 0.9606311, 0, 0.1960784, 1, 1,
0.3522343, 0.499446, -0.1684661, 0, 0.1882353, 1, 1,
0.3527507, -0.4216399, 1.683238, 0, 0.1843137, 1, 1,
0.3572283, -0.9131734, 4.639397, 0, 0.1764706, 1, 1,
0.3582911, -0.1264838, 0.56123, 0, 0.172549, 1, 1,
0.3600262, 0.1409859, -0.3272721, 0, 0.1647059, 1, 1,
0.3619076, 0.4618717, 0.7129071, 0, 0.1607843, 1, 1,
0.3675053, -0.563024, 0.4016908, 0, 0.1529412, 1, 1,
0.3696117, -1.981346, 3.614686, 0, 0.1490196, 1, 1,
0.3706686, 0.4205685, -0.06559748, 0, 0.1411765, 1, 1,
0.3758516, -0.1321745, 1.10223, 0, 0.1372549, 1, 1,
0.3762298, 0.2429914, -0.1111091, 0, 0.1294118, 1, 1,
0.3801154, 0.833827, 1.645844, 0, 0.1254902, 1, 1,
0.3843252, -0.03317585, 0.8401422, 0, 0.1176471, 1, 1,
0.3885319, 0.2795263, 1.136347, 0, 0.1137255, 1, 1,
0.3889271, -1.289002, 2.467113, 0, 0.1058824, 1, 1,
0.3920957, 1.093217, -0.5209019, 0, 0.09803922, 1, 1,
0.3971487, -2.123962, 2.685969, 0, 0.09411765, 1, 1,
0.3986226, 1.113798, 1.26381, 0, 0.08627451, 1, 1,
0.4004502, 1.636755, -0.4738347, 0, 0.08235294, 1, 1,
0.4076812, -0.7529296, 2.267712, 0, 0.07450981, 1, 1,
0.4115853, 1.126938, 0.07267129, 0, 0.07058824, 1, 1,
0.4172944, -0.9532362, 3.888696, 0, 0.0627451, 1, 1,
0.4191692, 0.8404716, 0.5116251, 0, 0.05882353, 1, 1,
0.4211589, -0.5258086, 2.398488, 0, 0.05098039, 1, 1,
0.4282408, 0.6058543, 2.144035, 0, 0.04705882, 1, 1,
0.4288912, -1.515228, 3.544746, 0, 0.03921569, 1, 1,
0.4321635, 0.4395607, 1.789538, 0, 0.03529412, 1, 1,
0.433585, 1.570193, 0.07977194, 0, 0.02745098, 1, 1,
0.4353395, -0.3569064, 0.2063439, 0, 0.02352941, 1, 1,
0.4355076, -2.047011, 4.184505, 0, 0.01568628, 1, 1,
0.4526753, -0.3089644, 2.599227, 0, 0.01176471, 1, 1,
0.4556123, 0.4787535, 1.214448, 0, 0.003921569, 1, 1,
0.4580607, 0.9936994, 1.853797, 0.003921569, 0, 1, 1,
0.4635603, -1.01333, 2.994855, 0.007843138, 0, 1, 1,
0.4642716, 0.05905362, 1.260314, 0.01568628, 0, 1, 1,
0.4754128, -1.03629, 3.093581, 0.01960784, 0, 1, 1,
0.4859261, -0.8388321, 2.714162, 0.02745098, 0, 1, 1,
0.4876221, 0.4649388, 1.459405, 0.03137255, 0, 1, 1,
0.4971592, -0.3987084, 1.295711, 0.03921569, 0, 1, 1,
0.4973564, 0.6579411, 3.135579, 0.04313726, 0, 1, 1,
0.497466, 1.415456, -0.7996725, 0.05098039, 0, 1, 1,
0.4986529, 0.5482312, 0.325607, 0.05490196, 0, 1, 1,
0.5021064, 0.520913, 1.167797, 0.0627451, 0, 1, 1,
0.5060302, 0.348198, 0.8835031, 0.06666667, 0, 1, 1,
0.5066722, 0.1742941, 2.718438, 0.07450981, 0, 1, 1,
0.5084753, -0.1464564, 4.21054, 0.07843138, 0, 1, 1,
0.5091847, -1.109722, 2.339229, 0.08627451, 0, 1, 1,
0.5098822, -0.2304479, 1.664124, 0.09019608, 0, 1, 1,
0.5112742, 0.6389264, 0.7146416, 0.09803922, 0, 1, 1,
0.5125419, -0.6693257, 0.4887304, 0.1058824, 0, 1, 1,
0.5131809, -1.690116, 2.718774, 0.1098039, 0, 1, 1,
0.5190389, 2.411582, 0.1706111, 0.1176471, 0, 1, 1,
0.5302725, -0.1293821, -0.003824524, 0.1215686, 0, 1, 1,
0.5317218, 0.3139407, 0.0540252, 0.1294118, 0, 1, 1,
0.5325491, 0.0289191, 1.463331, 0.1333333, 0, 1, 1,
0.5334786, -0.8713272, 2.023816, 0.1411765, 0, 1, 1,
0.5349464, 0.7981876, -0.931211, 0.145098, 0, 1, 1,
0.5361552, 0.08639892, 2.108436, 0.1529412, 0, 1, 1,
0.5413564, -0.2744203, 3.04822, 0.1568628, 0, 1, 1,
0.5425816, -0.9968534, 1.970476, 0.1647059, 0, 1, 1,
0.5426933, -0.3732003, 1.207991, 0.1686275, 0, 1, 1,
0.5466281, -1.138163, 2.227226, 0.1764706, 0, 1, 1,
0.5467423, -0.9123523, 3.550965, 0.1803922, 0, 1, 1,
0.54726, 0.6713927, -0.02837078, 0.1882353, 0, 1, 1,
0.5478879, 0.3425336, 0.539488, 0.1921569, 0, 1, 1,
0.5555993, 0.9431191, 1.256557, 0.2, 0, 1, 1,
0.55562, -0.208488, 1.055105, 0.2078431, 0, 1, 1,
0.5578483, 0.07549348, 0.8073386, 0.2117647, 0, 1, 1,
0.5615856, -0.837191, 3.110386, 0.2196078, 0, 1, 1,
0.5620473, -1.436059, 3.700659, 0.2235294, 0, 1, 1,
0.5641854, -0.5993643, 2.860059, 0.2313726, 0, 1, 1,
0.5654863, -0.09185454, 1.864648, 0.2352941, 0, 1, 1,
0.5668714, -1.506065, 3.340871, 0.2431373, 0, 1, 1,
0.568268, -1.500439, 3.852128, 0.2470588, 0, 1, 1,
0.5745116, -0.9289498, 3.581646, 0.254902, 0, 1, 1,
0.5808164, -1.508211, 2.560335, 0.2588235, 0, 1, 1,
0.5828626, -1.516829, 1.913624, 0.2666667, 0, 1, 1,
0.5865941, -0.4868293, 1.348567, 0.2705882, 0, 1, 1,
0.5888558, -1.724373, 4.37347, 0.2784314, 0, 1, 1,
0.589746, 0.3019901, 2.204787, 0.282353, 0, 1, 1,
0.5969079, -0.7254405, 4.432657, 0.2901961, 0, 1, 1,
0.6041237, 0.9926869, -0.7034526, 0.2941177, 0, 1, 1,
0.6079715, 1.586091, 1.313093, 0.3019608, 0, 1, 1,
0.6087099, -1.320352, 2.574375, 0.3098039, 0, 1, 1,
0.6097006, -0.6145324, 3.074093, 0.3137255, 0, 1, 1,
0.6123977, 0.9392943, 0.5706865, 0.3215686, 0, 1, 1,
0.6150305, 0.8534241, 0.1108646, 0.3254902, 0, 1, 1,
0.6229609, -1.529742, 3.346422, 0.3333333, 0, 1, 1,
0.6239887, -0.4472517, 0.963803, 0.3372549, 0, 1, 1,
0.6294236, 0.3981414, 0.3657972, 0.345098, 0, 1, 1,
0.630034, 1.967128, -0.4155656, 0.3490196, 0, 1, 1,
0.6304186, -1.051909, 1.991861, 0.3568628, 0, 1, 1,
0.6333757, -1.879866, 1.826033, 0.3607843, 0, 1, 1,
0.6334035, -0.1515554, 2.350038, 0.3686275, 0, 1, 1,
0.6411677, 0.009346299, 1.393019, 0.372549, 0, 1, 1,
0.6441092, -3.208059, 3.581861, 0.3803922, 0, 1, 1,
0.6467194, -0.3585054, -1.09484, 0.3843137, 0, 1, 1,
0.647373, 0.6587433, 1.85365, 0.3921569, 0, 1, 1,
0.6496722, 0.1145816, 1.324743, 0.3960784, 0, 1, 1,
0.6515906, 0.5328802, 3.128878, 0.4039216, 0, 1, 1,
0.6605932, 0.03546187, 0.7290811, 0.4117647, 0, 1, 1,
0.6616769, 1.064301, 0.9859596, 0.4156863, 0, 1, 1,
0.6654266, 0.4130975, 2.557878, 0.4235294, 0, 1, 1,
0.6682452, 0.6209161, -0.05944433, 0.427451, 0, 1, 1,
0.6771551, -0.7374243, 1.07349, 0.4352941, 0, 1, 1,
0.6778409, 0.8565178, 0.1426636, 0.4392157, 0, 1, 1,
0.6802407, -1.232106, 3.26032, 0.4470588, 0, 1, 1,
0.6836143, -0.7351937, 2.2307, 0.4509804, 0, 1, 1,
0.6841506, 0.02954573, 0.9117938, 0.4588235, 0, 1, 1,
0.6851449, 1.37619, -0.4326058, 0.4627451, 0, 1, 1,
0.6895895, -0.6039748, 3.425215, 0.4705882, 0, 1, 1,
0.6900805, 1.105341, 1.152212, 0.4745098, 0, 1, 1,
0.6912497, 1.378596, -0.443301, 0.4823529, 0, 1, 1,
0.6932973, 1.427913, 0.8163518, 0.4862745, 0, 1, 1,
0.6956832, -0.0909184, 1.412529, 0.4941176, 0, 1, 1,
0.7006081, -0.4485819, 1.766353, 0.5019608, 0, 1, 1,
0.7015406, -1.080821, 1.490612, 0.5058824, 0, 1, 1,
0.7023358, 0.8431906, 0.7008377, 0.5137255, 0, 1, 1,
0.7024696, -0.9742626, 2.581435, 0.5176471, 0, 1, 1,
0.7044734, 2.365872, -2.463537, 0.5254902, 0, 1, 1,
0.7153959, 0.07290889, 2.306093, 0.5294118, 0, 1, 1,
0.717959, 0.06246788, 0.4506839, 0.5372549, 0, 1, 1,
0.7192393, -1.847849, 3.088686, 0.5411765, 0, 1, 1,
0.722077, 0.1140576, 0.07567049, 0.5490196, 0, 1, 1,
0.7221434, -1.050908, 4.721718, 0.5529412, 0, 1, 1,
0.7226574, 0.1138339, -0.6253279, 0.5607843, 0, 1, 1,
0.7266945, -0.5311962, 2.568026, 0.5647059, 0, 1, 1,
0.7318834, -1.844668, 2.288181, 0.572549, 0, 1, 1,
0.7396845, -0.3902755, 3.834579, 0.5764706, 0, 1, 1,
0.7438858, 1.478949, -1.766209, 0.5843138, 0, 1, 1,
0.7473887, 0.1050355, 3.975102, 0.5882353, 0, 1, 1,
0.7484999, 1.223081, 0.1083063, 0.5960785, 0, 1, 1,
0.7563328, 0.6653903, -0.9169199, 0.6039216, 0, 1, 1,
0.7569144, -0.4543841, 1.988204, 0.6078432, 0, 1, 1,
0.7598888, 0.799705, -0.07905497, 0.6156863, 0, 1, 1,
0.7659211, 0.3715276, 2.262555, 0.6196079, 0, 1, 1,
0.7673107, -1.120561, 3.303813, 0.627451, 0, 1, 1,
0.7689394, -0.2809897, 1.926074, 0.6313726, 0, 1, 1,
0.7716796, -1.747793, 2.734943, 0.6392157, 0, 1, 1,
0.7720271, -0.1985822, 2.000901, 0.6431373, 0, 1, 1,
0.7743763, 1.730888, 0.2532739, 0.6509804, 0, 1, 1,
0.7783797, 0.7720882, -0.4161133, 0.654902, 0, 1, 1,
0.7789794, -1.580809, 1.929877, 0.6627451, 0, 1, 1,
0.7799348, 0.4063903, 3.633877, 0.6666667, 0, 1, 1,
0.7805704, 1.145369, 1.863695, 0.6745098, 0, 1, 1,
0.7813555, 0.3192653, 1.653545, 0.6784314, 0, 1, 1,
0.7871895, -0.005441956, 2.471793, 0.6862745, 0, 1, 1,
0.7887934, 0.4447367, 1.260743, 0.6901961, 0, 1, 1,
0.7953905, 0.7825334, 2.306298, 0.6980392, 0, 1, 1,
0.7995386, -1.550088, 2.166569, 0.7058824, 0, 1, 1,
0.8163638, -2.859247, 1.346518, 0.7098039, 0, 1, 1,
0.8198878, -0.06088809, 2.483449, 0.7176471, 0, 1, 1,
0.8199073, -0.6931656, 0.8458964, 0.7215686, 0, 1, 1,
0.8233678, 2.9509, 2.154066, 0.7294118, 0, 1, 1,
0.8256635, 0.9857143, 2.361344, 0.7333333, 0, 1, 1,
0.8318724, -0.4386985, 1.798707, 0.7411765, 0, 1, 1,
0.832399, 1.699577, -0.760383, 0.7450981, 0, 1, 1,
0.8325315, 0.3742118, 1.491925, 0.7529412, 0, 1, 1,
0.8348542, 0.4472329, 0.8908614, 0.7568628, 0, 1, 1,
0.8368083, 2.114023, 0.9164254, 0.7647059, 0, 1, 1,
0.8436258, -0.3216226, 2.875576, 0.7686275, 0, 1, 1,
0.8441896, -1.33871, 2.003094, 0.7764706, 0, 1, 1,
0.8453248, -0.8432893, 2.953727, 0.7803922, 0, 1, 1,
0.8542689, 0.008390114, 2.262203, 0.7882353, 0, 1, 1,
0.8551415, 1.610467, 1.09055, 0.7921569, 0, 1, 1,
0.8561805, 1.015578, 1.315488, 0.8, 0, 1, 1,
0.8574672, 0.214054, 2.260796, 0.8078431, 0, 1, 1,
0.858748, -0.4897456, 3.262047, 0.8117647, 0, 1, 1,
0.8604278, 0.2761558, 2.498463, 0.8196079, 0, 1, 1,
0.8614572, 1.442757, 0.6195326, 0.8235294, 0, 1, 1,
0.8645216, 0.1678049, 0.4697371, 0.8313726, 0, 1, 1,
0.8678116, 2.140915, 0.4123554, 0.8352941, 0, 1, 1,
0.8776433, 0.02269101, 0.9734195, 0.8431373, 0, 1, 1,
0.877668, 2.68667, -1.2174, 0.8470588, 0, 1, 1,
0.8864015, 0.3194108, 2.253281, 0.854902, 0, 1, 1,
0.892975, 0.9679835, 0.1234225, 0.8588235, 0, 1, 1,
0.893088, -1.556855, 1.615706, 0.8666667, 0, 1, 1,
0.895383, -0.4268863, 1.306941, 0.8705882, 0, 1, 1,
0.8967113, 0.3713218, 0.5831758, 0.8784314, 0, 1, 1,
0.901621, -0.8390558, 3.400705, 0.8823529, 0, 1, 1,
0.9018698, 0.06089792, 2.925344, 0.8901961, 0, 1, 1,
0.9020084, 1.625548, 2.864927, 0.8941177, 0, 1, 1,
0.9149459, 0.9967052, 0.2833744, 0.9019608, 0, 1, 1,
0.9188146, -0.07119155, 1.181327, 0.9098039, 0, 1, 1,
0.9230455, -0.4574282, 2.941823, 0.9137255, 0, 1, 1,
0.9238346, 1.394806, 1.183255, 0.9215686, 0, 1, 1,
0.9254848, 0.5506081, 0.4044375, 0.9254902, 0, 1, 1,
0.9316901, -0.007990375, 1.564672, 0.9333333, 0, 1, 1,
0.9361367, 0.1866147, 2.553946, 0.9372549, 0, 1, 1,
0.9363757, -0.6688279, 2.670315, 0.945098, 0, 1, 1,
0.9364654, 0.6804069, 0.4020744, 0.9490196, 0, 1, 1,
0.939523, -1.375686, 1.452053, 0.9568627, 0, 1, 1,
0.9412956, 0.2116914, 1.681639, 0.9607843, 0, 1, 1,
0.9418474, -0.479817, 1.917937, 0.9686275, 0, 1, 1,
0.9425792, -0.3212757, 3.331228, 0.972549, 0, 1, 1,
0.9436481, -1.423436, 1.785553, 0.9803922, 0, 1, 1,
0.9461174, 2.232068, 1.424288, 0.9843137, 0, 1, 1,
0.9483702, 0.5561032, 1.132513, 0.9921569, 0, 1, 1,
0.9547834, 0.8245234, -1.899715, 0.9960784, 0, 1, 1,
0.956213, -0.4720821, 0.8625129, 1, 0, 0.9960784, 1,
0.9603335, -0.2258502, 2.020211, 1, 0, 0.9882353, 1,
0.9611188, -1.397859, 1.110466, 1, 0, 0.9843137, 1,
0.9649156, 0.3467285, 1.777546, 1, 0, 0.9764706, 1,
0.965904, 2.200676, 0.6116818, 1, 0, 0.972549, 1,
0.9661493, 0.6595054, 3.816422, 1, 0, 0.9647059, 1,
0.9676387, 1.385906, 1.254765, 1, 0, 0.9607843, 1,
0.9731492, 0.717412, 1.845969, 1, 0, 0.9529412, 1,
0.9764017, 0.8497774, 0.4329419, 1, 0, 0.9490196, 1,
0.9782814, 0.6287764, 1.922775, 1, 0, 0.9411765, 1,
0.981682, 0.5375837, 2.169948, 1, 0, 0.9372549, 1,
0.9828433, -0.6159165, 2.490344, 1, 0, 0.9294118, 1,
0.9861813, -0.1754309, 0.146, 1, 0, 0.9254902, 1,
0.9905089, 0.2842948, 2.065221, 1, 0, 0.9176471, 1,
0.9963731, -0.2145763, 2.165267, 1, 0, 0.9137255, 1,
0.9965327, -1.135072, 2.010055, 1, 0, 0.9058824, 1,
1.001674, -0.2142449, 1.407994, 1, 0, 0.9019608, 1,
1.002324, 0.1081334, 2.742698, 1, 0, 0.8941177, 1,
1.006349, -0.9615098, 1.548877, 1, 0, 0.8862745, 1,
1.015317, 1.007986, 1.054998, 1, 0, 0.8823529, 1,
1.016932, -0.5154463, 1.32433, 1, 0, 0.8745098, 1,
1.017, 1.070928, 1.70706, 1, 0, 0.8705882, 1,
1.033459, 0.08413704, 1.46385, 1, 0, 0.8627451, 1,
1.034862, 0.6655967, 0.4210138, 1, 0, 0.8588235, 1,
1.043548, 1.289417, -0.1857655, 1, 0, 0.8509804, 1,
1.048029, -0.1089644, -0.2180834, 1, 0, 0.8470588, 1,
1.048276, 1.743389, 0.3104978, 1, 0, 0.8392157, 1,
1.049081, -0.5865679, 1.840882, 1, 0, 0.8352941, 1,
1.05533, 1.959866, -0.1427509, 1, 0, 0.827451, 1,
1.074958, -0.129569, 3.508593, 1, 0, 0.8235294, 1,
1.082038, 0.883385, 0.4928468, 1, 0, 0.8156863, 1,
1.107591, -1.271585, 4.47589, 1, 0, 0.8117647, 1,
1.109551, -0.5361237, 0.6160673, 1, 0, 0.8039216, 1,
1.112907, 0.3548585, -0.3001682, 1, 0, 0.7960784, 1,
1.118593, 0.2609501, 2.980923, 1, 0, 0.7921569, 1,
1.134769, -0.2538654, 2.951938, 1, 0, 0.7843137, 1,
1.135006, -1.776032, 2.996796, 1, 0, 0.7803922, 1,
1.142078, 0.07477393, 1.461924, 1, 0, 0.772549, 1,
1.143148, 1.787099, 0.2128979, 1, 0, 0.7686275, 1,
1.145659, 0.5931108, 0.9406912, 1, 0, 0.7607843, 1,
1.147631, 1.683365, 0.2791806, 1, 0, 0.7568628, 1,
1.148239, 0.548, 1.867572, 1, 0, 0.7490196, 1,
1.154858, -1.109988, 2.338402, 1, 0, 0.7450981, 1,
1.155926, 1.25634, 2.966105, 1, 0, 0.7372549, 1,
1.167014, 0.2266764, 2.091778, 1, 0, 0.7333333, 1,
1.184734, 0.0288696, 4.543362, 1, 0, 0.7254902, 1,
1.18707, 0.8350956, 1.449369, 1, 0, 0.7215686, 1,
1.188732, 0.7011056, 0.8409252, 1, 0, 0.7137255, 1,
1.191956, 2.68096, 0.1639297, 1, 0, 0.7098039, 1,
1.193587, 0.1878861, 1.60726, 1, 0, 0.7019608, 1,
1.1964, -0.5217862, 0.4417813, 1, 0, 0.6941177, 1,
1.200396, -0.9636036, 2.541255, 1, 0, 0.6901961, 1,
1.204276, -0.6875452, 1.916074, 1, 0, 0.682353, 1,
1.208362, 0.01177796, -0.1020448, 1, 0, 0.6784314, 1,
1.228407, -1.198323, 2.375307, 1, 0, 0.6705883, 1,
1.232638, 0.08969404, 0.1479201, 1, 0, 0.6666667, 1,
1.238703, -0.09361476, -0.8327575, 1, 0, 0.6588235, 1,
1.241354, -0.6547651, 0.789914, 1, 0, 0.654902, 1,
1.247498, -1.135116, 1.572278, 1, 0, 0.6470588, 1,
1.255537, -0.3665251, 1.324029, 1, 0, 0.6431373, 1,
1.257457, -1.047779, 2.674591, 1, 0, 0.6352941, 1,
1.270499, 1.345515, 0.8474523, 1, 0, 0.6313726, 1,
1.277067, 0.09911593, 1.957212, 1, 0, 0.6235294, 1,
1.279617, 1.087119, 0.272921, 1, 0, 0.6196079, 1,
1.286946, -1.343878, 0.5323752, 1, 0, 0.6117647, 1,
1.295092, -0.06727204, 1.462218, 1, 0, 0.6078432, 1,
1.31511, 0.3543339, 0.9754105, 1, 0, 0.6, 1,
1.320026, -1.263696, 1.801442, 1, 0, 0.5921569, 1,
1.321419, 0.03342529, 1.096459, 1, 0, 0.5882353, 1,
1.324886, -0.7047123, 1.777357, 1, 0, 0.5803922, 1,
1.32556, 0.5012937, 2.720522, 1, 0, 0.5764706, 1,
1.330988, -2.661745, 2.198079, 1, 0, 0.5686275, 1,
1.336188, -0.1135746, 1.361598, 1, 0, 0.5647059, 1,
1.337768, 1.38401, 0.8936501, 1, 0, 0.5568628, 1,
1.343126, -0.813013, 1.38067, 1, 0, 0.5529412, 1,
1.345354, -0.001706257, 2.22131, 1, 0, 0.5450981, 1,
1.347453, 0.7487029, 1.39015, 1, 0, 0.5411765, 1,
1.349462, -0.6498635, 2.308021, 1, 0, 0.5333334, 1,
1.35662, 1.151756, 1.569584, 1, 0, 0.5294118, 1,
1.357071, -0.1822208, 2.290121, 1, 0, 0.5215687, 1,
1.35919, -2.439019, 1.881326, 1, 0, 0.5176471, 1,
1.360184, 0.2235485, 0.7966468, 1, 0, 0.509804, 1,
1.365505, -0.9994773, 2.843472, 1, 0, 0.5058824, 1,
1.366442, 0.09309107, 1.663045, 1, 0, 0.4980392, 1,
1.376088, 0.1649704, 2.420809, 1, 0, 0.4901961, 1,
1.377188, -0.07395452, 3.173869, 1, 0, 0.4862745, 1,
1.38308, -0.6588319, 1.854953, 1, 0, 0.4784314, 1,
1.388325, -0.8901895, 2.320881, 1, 0, 0.4745098, 1,
1.391811, -1.753035, 1.497421, 1, 0, 0.4666667, 1,
1.400613, -0.6505708, 1.12046, 1, 0, 0.4627451, 1,
1.40136, 0.112856, 0.6510047, 1, 0, 0.454902, 1,
1.403664, 0.1603217, 1.362515, 1, 0, 0.4509804, 1,
1.405097, -2.23525, 3.661592, 1, 0, 0.4431373, 1,
1.406427, 0.5690338, 1.300282, 1, 0, 0.4392157, 1,
1.410855, 0.1817155, 1.567003, 1, 0, 0.4313726, 1,
1.424805, -1.64362, 2.508231, 1, 0, 0.427451, 1,
1.430266, 0.8426816, -1.247938, 1, 0, 0.4196078, 1,
1.438195, 1.079594, -0.5119604, 1, 0, 0.4156863, 1,
1.44152, 0.9842258, 0.5293545, 1, 0, 0.4078431, 1,
1.448641, -0.4200999, 3.558296, 1, 0, 0.4039216, 1,
1.471949, 0.8310778, 1.511761, 1, 0, 0.3960784, 1,
1.483923, 1.50697, 0.4114647, 1, 0, 0.3882353, 1,
1.508026, 1.018635, -0.7363355, 1, 0, 0.3843137, 1,
1.508872, -0.4585406, 3.624966, 1, 0, 0.3764706, 1,
1.509802, -1.429455, 3.073491, 1, 0, 0.372549, 1,
1.509947, 0.1148564, 3.654685, 1, 0, 0.3647059, 1,
1.510195, 0.1784963, 0.8787791, 1, 0, 0.3607843, 1,
1.513275, 0.8135803, 2.460185, 1, 0, 0.3529412, 1,
1.518556, 1.956878, 0.4673281, 1, 0, 0.3490196, 1,
1.542635, 1.136903, 1.233363, 1, 0, 0.3411765, 1,
1.545361, -1.778269, 1.553077, 1, 0, 0.3372549, 1,
1.548329, 0.3978986, 2.803706, 1, 0, 0.3294118, 1,
1.549278, 0.5796549, 1.907861, 1, 0, 0.3254902, 1,
1.560694, -0.5906823, 1.868645, 1, 0, 0.3176471, 1,
1.57583, 1.100069, 0.3505031, 1, 0, 0.3137255, 1,
1.609646, 0.2997001, 0.3399652, 1, 0, 0.3058824, 1,
1.616615, 1.229503, 0.41065, 1, 0, 0.2980392, 1,
1.624012, 0.01536815, 0.4629477, 1, 0, 0.2941177, 1,
1.628745, -0.5568005, 0.9737685, 1, 0, 0.2862745, 1,
1.643422, 0.5298856, 1.216958, 1, 0, 0.282353, 1,
1.661885, -2.595091, 2.811962, 1, 0, 0.2745098, 1,
1.669082, 1.484404, -0.01193538, 1, 0, 0.2705882, 1,
1.670795, 0.914471, -0.4488529, 1, 0, 0.2627451, 1,
1.689178, -0.9925669, 3.53648, 1, 0, 0.2588235, 1,
1.696169, 1.532976, -0.1877281, 1, 0, 0.2509804, 1,
1.707376, 0.2570826, 0.7604654, 1, 0, 0.2470588, 1,
1.708637, 0.4065619, 1.148255, 1, 0, 0.2392157, 1,
1.72542, -1.329217, 2.405488, 1, 0, 0.2352941, 1,
1.728231, 0.8430882, 1.756243, 1, 0, 0.227451, 1,
1.730382, -0.214226, 1.12818, 1, 0, 0.2235294, 1,
1.733898, 1.478453, 2.552438, 1, 0, 0.2156863, 1,
1.736352, -0.4727453, 1.163862, 1, 0, 0.2117647, 1,
1.761717, -0.835815, -0.4360575, 1, 0, 0.2039216, 1,
1.788165, -1.071195, 2.666916, 1, 0, 0.1960784, 1,
1.789143, -0.7106768, 0.5750859, 1, 0, 0.1921569, 1,
1.791778, 0.06208276, 3.380337, 1, 0, 0.1843137, 1,
1.814734, 0.6731119, 2.20077, 1, 0, 0.1803922, 1,
1.81995, 0.4294377, 1.411759, 1, 0, 0.172549, 1,
1.836963, -0.359567, 0.9484699, 1, 0, 0.1686275, 1,
1.861008, 0.2479823, -0.1125793, 1, 0, 0.1607843, 1,
1.86426, 2.420191, 2.611773, 1, 0, 0.1568628, 1,
1.915897, -0.250131, 4.046169, 1, 0, 0.1490196, 1,
1.919497, -0.8649507, 2.004307, 1, 0, 0.145098, 1,
1.955883, -0.4898435, 1.478159, 1, 0, 0.1372549, 1,
1.99225, 1.244369, 1.982444, 1, 0, 0.1333333, 1,
2.015137, -1.900006, 2.430033, 1, 0, 0.1254902, 1,
2.017513, 0.2268879, 0.4415958, 1, 0, 0.1215686, 1,
2.043673, 0.8660163, 1.363851, 1, 0, 0.1137255, 1,
2.058471, 0.4963091, 0.723016, 1, 0, 0.1098039, 1,
2.09846, -0.8135253, 2.748774, 1, 0, 0.1019608, 1,
2.106125, -1.730064, 3.016826, 1, 0, 0.09411765, 1,
2.114344, 0.5540797, 1.598188, 1, 0, 0.09019608, 1,
2.153296, 0.1581009, 3.44077, 1, 0, 0.08235294, 1,
2.201454, -0.5946448, 2.740666, 1, 0, 0.07843138, 1,
2.211303, -1.948711, 2.729453, 1, 0, 0.07058824, 1,
2.219372, 0.1577572, 1.30332, 1, 0, 0.06666667, 1,
2.269671, 0.1360541, 1.353802, 1, 0, 0.05882353, 1,
2.272246, 0.2636729, 1.902623, 1, 0, 0.05490196, 1,
2.305017, -0.4177775, 2.54658, 1, 0, 0.04705882, 1,
2.384988, -0.2395492, 0.7048811, 1, 0, 0.04313726, 1,
2.403262, -1.992689, 2.738277, 1, 0, 0.03529412, 1,
2.559239, -1.328778, 3.391282, 1, 0, 0.03137255, 1,
2.677278, -0.8360681, 2.65324, 1, 0, 0.02352941, 1,
2.727496, 0.8264723, 0.9233263, 1, 0, 0.01960784, 1,
2.730575, 0.4918495, 1.628129, 1, 0, 0.01176471, 1,
2.778276, -0.7378509, 1.263578, 1, 0, 0.007843138, 1
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
-0.09770238, -5.139627, -7.056013, 0, -0.5, 0.5, 0.5,
-0.09770238, -5.139627, -7.056013, 1, -0.5, 0.5, 0.5,
-0.09770238, -5.139627, -7.056013, 1, 1.5, 0.5, 0.5,
-0.09770238, -5.139627, -7.056013, 0, 1.5, 0.5, 0.5
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
-3.948638, -0.1910337, -7.056013, 0, -0.5, 0.5, 0.5,
-3.948638, -0.1910337, -7.056013, 1, -0.5, 0.5, 0.5,
-3.948638, -0.1910337, -7.056013, 1, 1.5, 0.5, 0.5,
-3.948638, -0.1910337, -7.056013, 0, 1.5, 0.5, 0.5
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
-3.948638, -5.139627, 0.2931654, 0, -0.5, 0.5, 0.5,
-3.948638, -5.139627, 0.2931654, 1, -0.5, 0.5, 0.5,
-3.948638, -5.139627, 0.2931654, 1, 1.5, 0.5, 0.5,
-3.948638, -5.139627, 0.2931654, 0, 1.5, 0.5, 0.5
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
-2, -3.997643, -5.360049,
2, -3.997643, -5.360049,
-2, -3.997643, -5.360049,
-2, -4.187974, -5.64271,
-1, -3.997643, -5.360049,
-1, -4.187974, -5.64271,
0, -3.997643, -5.360049,
0, -4.187974, -5.64271,
1, -3.997643, -5.360049,
1, -4.187974, -5.64271,
2, -3.997643, -5.360049,
2, -4.187974, -5.64271
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
-2, -4.568635, -6.208031, 0, -0.5, 0.5, 0.5,
-2, -4.568635, -6.208031, 1, -0.5, 0.5, 0.5,
-2, -4.568635, -6.208031, 1, 1.5, 0.5, 0.5,
-2, -4.568635, -6.208031, 0, 1.5, 0.5, 0.5,
-1, -4.568635, -6.208031, 0, -0.5, 0.5, 0.5,
-1, -4.568635, -6.208031, 1, -0.5, 0.5, 0.5,
-1, -4.568635, -6.208031, 1, 1.5, 0.5, 0.5,
-1, -4.568635, -6.208031, 0, 1.5, 0.5, 0.5,
0, -4.568635, -6.208031, 0, -0.5, 0.5, 0.5,
0, -4.568635, -6.208031, 1, -0.5, 0.5, 0.5,
0, -4.568635, -6.208031, 1, 1.5, 0.5, 0.5,
0, -4.568635, -6.208031, 0, 1.5, 0.5, 0.5,
1, -4.568635, -6.208031, 0, -0.5, 0.5, 0.5,
1, -4.568635, -6.208031, 1, -0.5, 0.5, 0.5,
1, -4.568635, -6.208031, 1, 1.5, 0.5, 0.5,
1, -4.568635, -6.208031, 0, 1.5, 0.5, 0.5,
2, -4.568635, -6.208031, 0, -0.5, 0.5, 0.5,
2, -4.568635, -6.208031, 1, -0.5, 0.5, 0.5,
2, -4.568635, -6.208031, 1, 1.5, 0.5, 0.5,
2, -4.568635, -6.208031, 0, 1.5, 0.5, 0.5
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
-3.05996, -2, -5.360049,
-3.05996, 2, -5.360049,
-3.05996, -2, -5.360049,
-3.208073, -2, -5.64271,
-3.05996, 0, -5.360049,
-3.208073, 0, -5.64271,
-3.05996, 2, -5.360049,
-3.208073, 2, -5.64271
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
-3.504299, -2, -6.208031, 0, -0.5, 0.5, 0.5,
-3.504299, -2, -6.208031, 1, -0.5, 0.5, 0.5,
-3.504299, -2, -6.208031, 1, 1.5, 0.5, 0.5,
-3.504299, -2, -6.208031, 0, 1.5, 0.5, 0.5,
-3.504299, 0, -6.208031, 0, -0.5, 0.5, 0.5,
-3.504299, 0, -6.208031, 1, -0.5, 0.5, 0.5,
-3.504299, 0, -6.208031, 1, 1.5, 0.5, 0.5,
-3.504299, 0, -6.208031, 0, 1.5, 0.5, 0.5,
-3.504299, 2, -6.208031, 0, -0.5, 0.5, 0.5,
-3.504299, 2, -6.208031, 1, -0.5, 0.5, 0.5,
-3.504299, 2, -6.208031, 1, 1.5, 0.5, 0.5,
-3.504299, 2, -6.208031, 0, 1.5, 0.5, 0.5
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
-3.05996, -3.997643, -4,
-3.05996, -3.997643, 4,
-3.05996, -3.997643, -4,
-3.208073, -4.187974, -4,
-3.05996, -3.997643, -2,
-3.208073, -4.187974, -2,
-3.05996, -3.997643, 0,
-3.208073, -4.187974, 0,
-3.05996, -3.997643, 2,
-3.208073, -4.187974, 2,
-3.05996, -3.997643, 4,
-3.208073, -4.187974, 4
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
-3.504299, -4.568635, -4, 0, -0.5, 0.5, 0.5,
-3.504299, -4.568635, -4, 1, -0.5, 0.5, 0.5,
-3.504299, -4.568635, -4, 1, 1.5, 0.5, 0.5,
-3.504299, -4.568635, -4, 0, 1.5, 0.5, 0.5,
-3.504299, -4.568635, -2, 0, -0.5, 0.5, 0.5,
-3.504299, -4.568635, -2, 1, -0.5, 0.5, 0.5,
-3.504299, -4.568635, -2, 1, 1.5, 0.5, 0.5,
-3.504299, -4.568635, -2, 0, 1.5, 0.5, 0.5,
-3.504299, -4.568635, 0, 0, -0.5, 0.5, 0.5,
-3.504299, -4.568635, 0, 1, -0.5, 0.5, 0.5,
-3.504299, -4.568635, 0, 1, 1.5, 0.5, 0.5,
-3.504299, -4.568635, 0, 0, 1.5, 0.5, 0.5,
-3.504299, -4.568635, 2, 0, -0.5, 0.5, 0.5,
-3.504299, -4.568635, 2, 1, -0.5, 0.5, 0.5,
-3.504299, -4.568635, 2, 1, 1.5, 0.5, 0.5,
-3.504299, -4.568635, 2, 0, 1.5, 0.5, 0.5,
-3.504299, -4.568635, 4, 0, -0.5, 0.5, 0.5,
-3.504299, -4.568635, 4, 1, -0.5, 0.5, 0.5,
-3.504299, -4.568635, 4, 1, 1.5, 0.5, 0.5,
-3.504299, -4.568635, 4, 0, 1.5, 0.5, 0.5
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
-3.05996, -3.997643, -5.360049,
-3.05996, 3.615576, -5.360049,
-3.05996, -3.997643, 5.94638,
-3.05996, 3.615576, 5.94638,
-3.05996, -3.997643, -5.360049,
-3.05996, -3.997643, 5.94638,
-3.05996, 3.615576, -5.360049,
-3.05996, 3.615576, 5.94638,
-3.05996, -3.997643, -5.360049,
2.864556, -3.997643, -5.360049,
-3.05996, -3.997643, 5.94638,
2.864556, -3.997643, 5.94638,
-3.05996, 3.615576, -5.360049,
2.864556, 3.615576, -5.360049,
-3.05996, 3.615576, 5.94638,
2.864556, 3.615576, 5.94638,
2.864556, -3.997643, -5.360049,
2.864556, 3.615576, -5.360049,
2.864556, -3.997643, 5.94638,
2.864556, 3.615576, 5.94638,
2.864556, -3.997643, -5.360049,
2.864556, -3.997643, 5.94638,
2.864556, 3.615576, -5.360049,
2.864556, 3.615576, 5.94638
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
var radius = 7.93633;
var distance = 35.30963;
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
mvMatrix.translate( 0.09770238, 0.1910337, -0.2931654 );
mvMatrix.scale( 1.448374, 1.127107, 0.7589413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.30963);
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
Diphenylmethanol<-read.table("Diphenylmethanol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Diphenylmethanol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylmethanol' not found
```

```r
y<-Diphenylmethanol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylmethanol' not found
```

```r
z<-Diphenylmethanol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Diphenylmethanol' not found
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
-2.973681, 1.049627, -1.12009, 0, 0, 1, 1, 1,
-2.473318, 0.07263504, -2.755524, 1, 0, 0, 1, 1,
-2.416809, 0.6649277, -0.4083452, 1, 0, 0, 1, 1,
-2.413054, -0.9097129, -3.307927, 1, 0, 0, 1, 1,
-2.408317, -1.327705, -2.056488, 1, 0, 0, 1, 1,
-2.374644, -0.04330108, -2.788709, 1, 0, 0, 1, 1,
-2.257066, 0.3087752, 0.3272864, 0, 0, 0, 1, 1,
-2.249354, 0.03362779, -2.194764, 0, 0, 0, 1, 1,
-2.20402, 0.3439796, -1.092895, 0, 0, 0, 1, 1,
-2.195374, -0.2452326, -2.946851, 0, 0, 0, 1, 1,
-2.186826, -0.9821759, -2.748877, 0, 0, 0, 1, 1,
-2.158042, 0.8272933, -0.1379821, 0, 0, 0, 1, 1,
-2.143708, 0.2037631, 0.2524449, 0, 0, 0, 1, 1,
-2.139459, 1.291265, -2.030084, 1, 1, 1, 1, 1,
-2.073399, -1.182617, -1.666563, 1, 1, 1, 1, 1,
-2.027263, -1.980165, -2.756842, 1, 1, 1, 1, 1,
-2.020778, 0.7269934, -3.663897, 1, 1, 1, 1, 1,
-2.0078, -1.266281, -2.650968, 1, 1, 1, 1, 1,
-1.999889, 0.3314695, -2.38786, 1, 1, 1, 1, 1,
-1.960086, 1.210284, -1.855789, 1, 1, 1, 1, 1,
-1.958989, 0.1449824, -0.2007676, 1, 1, 1, 1, 1,
-1.92652, -1.253875, -2.374285, 1, 1, 1, 1, 1,
-1.909302, -1.055522, -1.989338, 1, 1, 1, 1, 1,
-1.893287, 1.423012, -1.763045, 1, 1, 1, 1, 1,
-1.88496, 2.113514, -2.323872, 1, 1, 1, 1, 1,
-1.857747, -1.809293, -1.166573, 1, 1, 1, 1, 1,
-1.82561, 0.01004596, -1.227505, 1, 1, 1, 1, 1,
-1.813082, 0.882602, -1.612142, 1, 1, 1, 1, 1,
-1.80191, -1.596583, -2.487366, 0, 0, 1, 1, 1,
-1.80155, -0.9629319, -1.884328, 1, 0, 0, 1, 1,
-1.797234, 2.058489, -0.485636, 1, 0, 0, 1, 1,
-1.795941, -0.8809614, -2.853112, 1, 0, 0, 1, 1,
-1.791586, 1.084154, -0.830979, 1, 0, 0, 1, 1,
-1.785334, 0.4070948, -2.306216, 1, 0, 0, 1, 1,
-1.784476, 1.210756, -0.7806846, 0, 0, 0, 1, 1,
-1.782701, -0.9963589, -2.709621, 0, 0, 0, 1, 1,
-1.781611, 0.1777313, -0.9528117, 0, 0, 0, 1, 1,
-1.776393, -0.05100084, -0.917827, 0, 0, 0, 1, 1,
-1.766886, 0.6311195, -0.802788, 0, 0, 0, 1, 1,
-1.758406, -1.398104, -2.406101, 0, 0, 0, 1, 1,
-1.710364, -0.8777143, -3.049159, 0, 0, 0, 1, 1,
-1.699118, -0.7857025, -1.092293, 1, 1, 1, 1, 1,
-1.693132, -0.526232, -2.616459, 1, 1, 1, 1, 1,
-1.686416, 1.763267, 0.748989, 1, 1, 1, 1, 1,
-1.675307, -1.615201, -1.091067, 1, 1, 1, 1, 1,
-1.672227, 0.424674, -1.401718, 1, 1, 1, 1, 1,
-1.666062, -1.047341, -3.125308, 1, 1, 1, 1, 1,
-1.661885, -1.483738, -1.239403, 1, 1, 1, 1, 1,
-1.651534, 1.406371, -1.502589, 1, 1, 1, 1, 1,
-1.633457, 1.330271, -0.09588898, 1, 1, 1, 1, 1,
-1.619156, -1.550901, -4.284889, 1, 1, 1, 1, 1,
-1.589974, -1.18475, -2.735755, 1, 1, 1, 1, 1,
-1.589966, 0.4335853, -1.656352, 1, 1, 1, 1, 1,
-1.587683, -0.4456905, -1.47895, 1, 1, 1, 1, 1,
-1.587384, -0.2794425, -1.14409, 1, 1, 1, 1, 1,
-1.583471, 0.350799, -1.88644, 1, 1, 1, 1, 1,
-1.574124, -0.9128216, -0.5828521, 0, 0, 1, 1, 1,
-1.573184, 0.04439526, -1.810078, 1, 0, 0, 1, 1,
-1.568717, -0.3353773, -1.243545, 1, 0, 0, 1, 1,
-1.565326, 0.1580454, -1.446968, 1, 0, 0, 1, 1,
-1.54705, -0.4034454, -1.561861, 1, 0, 0, 1, 1,
-1.546414, 2.379572, -0.528834, 1, 0, 0, 1, 1,
-1.527951, 0.01244629, -2.39466, 0, 0, 0, 1, 1,
-1.523478, -0.88732, -1.232599, 0, 0, 0, 1, 1,
-1.521069, -0.7848356, -0.2116975, 0, 0, 0, 1, 1,
-1.480119, -0.3535561, -1.5918, 0, 0, 0, 1, 1,
-1.47946, -2.14651, -3.383912, 0, 0, 0, 1, 1,
-1.478299, 0.908541, -1.673029, 0, 0, 0, 1, 1,
-1.47275, 0.53716, -0.958186, 0, 0, 0, 1, 1,
-1.46541, -1.198977, -2.064105, 1, 1, 1, 1, 1,
-1.457471, -0.4002748, -2.752795, 1, 1, 1, 1, 1,
-1.437406, -1.622071, -1.32212, 1, 1, 1, 1, 1,
-1.436602, 0.4011571, -0.6293471, 1, 1, 1, 1, 1,
-1.436, 2.147991, -1.184885, 1, 1, 1, 1, 1,
-1.434746, -0.1138431, -0.9038458, 1, 1, 1, 1, 1,
-1.4163, 0.147459, -1.68718, 1, 1, 1, 1, 1,
-1.414705, 0.6284477, -0.3963472, 1, 1, 1, 1, 1,
-1.407552, -0.517176, -1.939789, 1, 1, 1, 1, 1,
-1.406021, 1.611652, -1.069185, 1, 1, 1, 1, 1,
-1.382757, -0.400804, -1.77664, 1, 1, 1, 1, 1,
-1.378479, 0.8098118, -2.862584, 1, 1, 1, 1, 1,
-1.372448, -0.619135, -2.346061, 1, 1, 1, 1, 1,
-1.369694, -2.202423, -1.199164, 1, 1, 1, 1, 1,
-1.365281, 1.253171, -2.6208, 1, 1, 1, 1, 1,
-1.363886, -0.5098009, -0.787306, 0, 0, 1, 1, 1,
-1.351105, -1.756435, -2.577596, 1, 0, 0, 1, 1,
-1.350448, 1.115843, -0.4980024, 1, 0, 0, 1, 1,
-1.348272, 0.0475168, 0.4282419, 1, 0, 0, 1, 1,
-1.343331, 0.9041, -0.9598622, 1, 0, 0, 1, 1,
-1.342571, -0.1901197, -0.585618, 1, 0, 0, 1, 1,
-1.335324, 0.4882944, -1.374988, 0, 0, 0, 1, 1,
-1.328107, 0.2189021, -1.530512, 0, 0, 0, 1, 1,
-1.32673, 0.5570394, -0.2762997, 0, 0, 0, 1, 1,
-1.319002, -0.623112, -3.221801, 0, 0, 0, 1, 1,
-1.310777, 1.32873, -0.003551132, 0, 0, 0, 1, 1,
-1.308481, -0.1284703, -2.113895, 0, 0, 0, 1, 1,
-1.307026, 1.903842, -1.971504, 0, 0, 0, 1, 1,
-1.305435, -0.9461213, -3.760322, 1, 1, 1, 1, 1,
-1.302682, -0.739008, -1.133067, 1, 1, 1, 1, 1,
-1.296884, -1.271805, -3.139535, 1, 1, 1, 1, 1,
-1.294324, 0.5322164, -1.516147, 1, 1, 1, 1, 1,
-1.292601, 0.1084544, -0.1343946, 1, 1, 1, 1, 1,
-1.288375, -0.5554184, -2.51332, 1, 1, 1, 1, 1,
-1.278925, -1.925169, -1.659292, 1, 1, 1, 1, 1,
-1.269551, -0.3922418, -1.60964, 1, 1, 1, 1, 1,
-1.264535, -0.876143, -2.804353, 1, 1, 1, 1, 1,
-1.247433, 1.742477, -2.53348, 1, 1, 1, 1, 1,
-1.246134, -1.246239, -1.021548, 1, 1, 1, 1, 1,
-1.233398, -0.4989404, -1.054827, 1, 1, 1, 1, 1,
-1.227248, -0.5695205, -0.9947155, 1, 1, 1, 1, 1,
-1.221901, -0.2112947, -1.465173, 1, 1, 1, 1, 1,
-1.215618, 0.5120076, -1.835713, 1, 1, 1, 1, 1,
-1.212568, -0.39814, -3.226391, 0, 0, 1, 1, 1,
-1.205148, -0.8052218, -1.935986, 1, 0, 0, 1, 1,
-1.20142, 0.2563435, -1.738473, 1, 0, 0, 1, 1,
-1.191952, 0.5162721, -2.206283, 1, 0, 0, 1, 1,
-1.191303, 1.482285, 0.1606498, 1, 0, 0, 1, 1,
-1.184922, 0.199665, -0.3807294, 1, 0, 0, 1, 1,
-1.171735, 0.364855, -0.5273428, 0, 0, 0, 1, 1,
-1.170914, 0.2849268, -1.898435, 0, 0, 0, 1, 1,
-1.166481, 0.7759131, -2.772505, 0, 0, 0, 1, 1,
-1.154601, 1.046769, 0.05664255, 0, 0, 0, 1, 1,
-1.148419, 0.7606869, 0.5335607, 0, 0, 0, 1, 1,
-1.145782, 0.103596, -2.396199, 0, 0, 0, 1, 1,
-1.145427, -1.010659, -2.528217, 0, 0, 0, 1, 1,
-1.144805, -0.4755537, -4.697853, 1, 1, 1, 1, 1,
-1.143631, 1.165867, 0.01101315, 1, 1, 1, 1, 1,
-1.143585, 0.5546789, -1.035194, 1, 1, 1, 1, 1,
-1.12845, -0.2205089, -2.953472, 1, 1, 1, 1, 1,
-1.123245, 0.4627019, -2.241428, 1, 1, 1, 1, 1,
-1.121186, 0.2115174, -1.028479, 1, 1, 1, 1, 1,
-1.119904, -0.8162385, -1.681909, 1, 1, 1, 1, 1,
-1.115076, 0.4003738, 0.5855, 1, 1, 1, 1, 1,
-1.112277, -0.1216194, -2.119426, 1, 1, 1, 1, 1,
-1.088369, 1.554345, -0.1105515, 1, 1, 1, 1, 1,
-1.083642, 0.5027637, 0.5812362, 1, 1, 1, 1, 1,
-1.074826, -0.003864317, -1.536703, 1, 1, 1, 1, 1,
-1.074319, 0.2047498, 1.119993, 1, 1, 1, 1, 1,
-1.073432, 0.736007, -0.3524353, 1, 1, 1, 1, 1,
-1.070874, 1.790055, -0.8735845, 1, 1, 1, 1, 1,
-1.060228, 0.02755681, -3.194439, 0, 0, 1, 1, 1,
-1.054736, 1.078465, -0.3722429, 1, 0, 0, 1, 1,
-1.047339, -1.25593, 0.1610994, 1, 0, 0, 1, 1,
-1.043119, 0.5767966, -0.538652, 1, 0, 0, 1, 1,
-1.038838, 0.4717757, -1.93068, 1, 0, 0, 1, 1,
-1.037736, -1.4823, -3.099301, 1, 0, 0, 1, 1,
-1.0373, 1.608895, -1.682174, 0, 0, 0, 1, 1,
-1.034798, 1.293197, -1.99652, 0, 0, 0, 1, 1,
-1.033554, 0.970938, -0.3619926, 0, 0, 0, 1, 1,
-1.033219, -0.4489489, -2.208411, 0, 0, 0, 1, 1,
-1.028949, 1.178791, -1.528752, 0, 0, 0, 1, 1,
-1.01961, 0.5716508, -2.790526, 0, 0, 0, 1, 1,
-1.018366, 2.299435, -0.08289974, 0, 0, 0, 1, 1,
-1.008627, -0.9603578, -1.959444, 1, 1, 1, 1, 1,
-0.9970387, -1.738676, -4.652774, 1, 1, 1, 1, 1,
-0.9929885, -1.483462, -3.17527, 1, 1, 1, 1, 1,
-0.9815823, 0.03314016, -1.084471, 1, 1, 1, 1, 1,
-0.9813186, 0.2132367, -1.060737, 1, 1, 1, 1, 1,
-0.9772012, -0.02676963, -1.181553, 1, 1, 1, 1, 1,
-0.9740088, 0.7333126, -1.733444, 1, 1, 1, 1, 1,
-0.9718323, -1.231992, -3.489607, 1, 1, 1, 1, 1,
-0.9677125, 0.6675496, -2.091431, 1, 1, 1, 1, 1,
-0.9632571, -0.4417942, -3.121461, 1, 1, 1, 1, 1,
-0.9622842, -0.4747002, -3.530304, 1, 1, 1, 1, 1,
-0.9536394, -0.9373834, -3.824482, 1, 1, 1, 1, 1,
-0.9519112, 0.2929853, -1.615407, 1, 1, 1, 1, 1,
-0.9471713, -0.5228847, -1.435583, 1, 1, 1, 1, 1,
-0.9422657, 0.5176368, -0.4529541, 1, 1, 1, 1, 1,
-0.9389573, -0.6363, -1.177884, 0, 0, 1, 1, 1,
-0.921139, -0.2822768, -2.388176, 1, 0, 0, 1, 1,
-0.9209238, 0.1572826, -2.124149, 1, 0, 0, 1, 1,
-0.9117584, -0.1949601, -1.913729, 1, 0, 0, 1, 1,
-0.9095756, 1.333133, 1.136676, 1, 0, 0, 1, 1,
-0.9064332, 0.7487812, -1.537076, 1, 0, 0, 1, 1,
-0.9057689, -1.191531, -2.271653, 0, 0, 0, 1, 1,
-0.8993089, 0.4745443, -1.848495, 0, 0, 0, 1, 1,
-0.8955738, 1.051983, 0.9180845, 0, 0, 0, 1, 1,
-0.8880663, -0.6700575, -3.086595, 0, 0, 0, 1, 1,
-0.8775527, -1.103215, -3.158708, 0, 0, 0, 1, 1,
-0.8675016, -1.243154, -3.429702, 0, 0, 0, 1, 1,
-0.8674511, 0.3711884, -0.792344, 0, 0, 0, 1, 1,
-0.8657559, 1.468127, -1.222516, 1, 1, 1, 1, 1,
-0.8641334, 0.3662205, -2.111275, 1, 1, 1, 1, 1,
-0.857025, -0.7625807, -2.04374, 1, 1, 1, 1, 1,
-0.8550912, 1.148952, -0.1813864, 1, 1, 1, 1, 1,
-0.8510117, -0.2450879, -2.796746, 1, 1, 1, 1, 1,
-0.8377452, 0.462958, -1.193317, 1, 1, 1, 1, 1,
-0.8339916, 0.6094965, -3.236043, 1, 1, 1, 1, 1,
-0.830272, -0.4166359, -2.140743, 1, 1, 1, 1, 1,
-0.828595, -0.03433616, -1.651748, 1, 1, 1, 1, 1,
-0.8248219, 0.16573, -0.963394, 1, 1, 1, 1, 1,
-0.8223663, 0.1328023, -3.865757, 1, 1, 1, 1, 1,
-0.8205847, -1.19682, -2.261066, 1, 1, 1, 1, 1,
-0.8198543, 0.9236699, -1.461108, 1, 1, 1, 1, 1,
-0.8186623, 0.938421, 0.4532825, 1, 1, 1, 1, 1,
-0.8175742, -0.4309962, -1.792223, 1, 1, 1, 1, 1,
-0.8135277, 0.8509753, -0.7961056, 0, 0, 1, 1, 1,
-0.8126217, -2.150487, -2.631146, 1, 0, 0, 1, 1,
-0.8082539, 0.2962894, -2.647823, 1, 0, 0, 1, 1,
-0.8061774, -1.16304, -0.2361908, 1, 0, 0, 1, 1,
-0.8037794, -0.4072087, -2.374336, 1, 0, 0, 1, 1,
-0.8000346, -0.3993974, -1.379588, 1, 0, 0, 1, 1,
-0.7987897, 0.5285708, -1.934117, 0, 0, 0, 1, 1,
-0.7960385, 0.1457973, -0.8799551, 0, 0, 0, 1, 1,
-0.7919818, 1.297993, -0.6609184, 0, 0, 0, 1, 1,
-0.7871833, -0.2491853, -1.190172, 0, 0, 0, 1, 1,
-0.7770371, 0.4373068, -2.504154, 0, 0, 0, 1, 1,
-0.7767145, 0.2593802, -0.782007, 0, 0, 0, 1, 1,
-0.7745142, -1.053142, -2.129427, 0, 0, 0, 1, 1,
-0.7680652, -1.159631, -4.254313, 1, 1, 1, 1, 1,
-0.7679977, -0.8776402, -3.481895, 1, 1, 1, 1, 1,
-0.7679215, -1.54663, -1.433754, 1, 1, 1, 1, 1,
-0.7629149, 0.8850998, -0.728441, 1, 1, 1, 1, 1,
-0.7612274, 0.08397274, -2.378037, 1, 1, 1, 1, 1,
-0.7594455, -0.595681, -3.237872, 1, 1, 1, 1, 1,
-0.7560999, -0.2758494, -0.9992728, 1, 1, 1, 1, 1,
-0.7531987, 0.4103146, -0.5577924, 1, 1, 1, 1, 1,
-0.7522669, 0.1839553, -1.865329, 1, 1, 1, 1, 1,
-0.7472776, 0.9391534, -1.050766, 1, 1, 1, 1, 1,
-0.7457727, 0.002145315, -0.7118254, 1, 1, 1, 1, 1,
-0.7450007, -0.9764497, -2.352838, 1, 1, 1, 1, 1,
-0.7414834, 0.1445201, -0.6312101, 1, 1, 1, 1, 1,
-0.7407742, -0.5728684, -2.459746, 1, 1, 1, 1, 1,
-0.7403294, -0.3220759, -0.1148643, 1, 1, 1, 1, 1,
-0.7402629, 0.4271291, -1.377446, 0, 0, 1, 1, 1,
-0.7367108, 0.1135014, -0.8663186, 1, 0, 0, 1, 1,
-0.7334542, -0.1426014, -3.857123, 1, 0, 0, 1, 1,
-0.7302376, -0.2081854, -2.475731, 1, 0, 0, 1, 1,
-0.7295101, 0.5002291, 0.09025239, 1, 0, 0, 1, 1,
-0.7294959, -2.043089, -3.938977, 1, 0, 0, 1, 1,
-0.7227792, 0.5388229, -1.484384, 0, 0, 0, 1, 1,
-0.7212107, 0.2957444, 0.1068241, 0, 0, 0, 1, 1,
-0.718842, -0.1132218, -2.455543, 0, 0, 0, 1, 1,
-0.7184808, 0.3019504, -4.502038, 0, 0, 0, 1, 1,
-0.7173029, -1.23941, -3.25449, 0, 0, 0, 1, 1,
-0.717222, -1.248685, -1.621867, 0, 0, 0, 1, 1,
-0.7095565, -0.9878576, -4.232833, 0, 0, 0, 1, 1,
-0.7076207, 1.016295, 0.6797475, 1, 1, 1, 1, 1,
-0.7074018, 0.2177522, -2.424165, 1, 1, 1, 1, 1,
-0.7067217, -0.3091866, -2.806813, 1, 1, 1, 1, 1,
-0.7045749, -1.301116, -1.771758, 1, 1, 1, 1, 1,
-0.7029949, 0.8101152, -1.711525, 1, 1, 1, 1, 1,
-0.7027777, 0.1613346, 0.4160909, 1, 1, 1, 1, 1,
-0.7027296, -0.2729304, -1.508872, 1, 1, 1, 1, 1,
-0.7020192, -1.18743, -2.231684, 1, 1, 1, 1, 1,
-0.6999007, 2.420572, -0.7422519, 1, 1, 1, 1, 1,
-0.6986971, -0.5382375, -3.70434, 1, 1, 1, 1, 1,
-0.6915159, -0.3737458, -1.62325, 1, 1, 1, 1, 1,
-0.6899516, 0.268013, -0.2249814, 1, 1, 1, 1, 1,
-0.6881223, 0.1398959, -0.0654925, 1, 1, 1, 1, 1,
-0.686615, -0.4864402, -1.538602, 1, 1, 1, 1, 1,
-0.6847242, -1.511475, -1.869614, 1, 1, 1, 1, 1,
-0.6828216, 1.948655, 0.6836414, 0, 0, 1, 1, 1,
-0.6810586, 0.605328, -1.117252, 1, 0, 0, 1, 1,
-0.6784561, -1.650676, -2.153646, 1, 0, 0, 1, 1,
-0.6700801, 0.3354388, -1.324196, 1, 0, 0, 1, 1,
-0.6687583, 0.1940998, -0.4936193, 1, 0, 0, 1, 1,
-0.6673736, -0.7458247, -3.075796, 1, 0, 0, 1, 1,
-0.6650888, 0.4035027, -2.014527, 0, 0, 0, 1, 1,
-0.6616004, 0.5934034, -0.8389079, 0, 0, 0, 1, 1,
-0.6567413, 1.387016, 0.1255177, 0, 0, 0, 1, 1,
-0.6554249, 1.361923, -1.417974, 0, 0, 0, 1, 1,
-0.6544166, -1.167651, -2.326078, 0, 0, 0, 1, 1,
-0.6500153, 1.502543, 0.3688572, 0, 0, 0, 1, 1,
-0.6457041, -1.889238, -2.207893, 0, 0, 0, 1, 1,
-0.6441431, 1.578232, -1.629959, 1, 1, 1, 1, 1,
-0.6414068, 0.7129102, -1.928791, 1, 1, 1, 1, 1,
-0.6376277, 0.2218971, -0.9234414, 1, 1, 1, 1, 1,
-0.6308191, -2.103997, -2.144627, 1, 1, 1, 1, 1,
-0.6305472, -0.6876566, -2.253518, 1, 1, 1, 1, 1,
-0.628891, 0.3322262, 0.1200908, 1, 1, 1, 1, 1,
-0.6259472, -1.439301, -2.600529, 1, 1, 1, 1, 1,
-0.6239158, -0.006228247, -1.824171, 1, 1, 1, 1, 1,
-0.6217149, -1.766409, -3.164325, 1, 1, 1, 1, 1,
-0.6158766, -0.8739724, -2.175635, 1, 1, 1, 1, 1,
-0.6154563, 0.07805283, -0.7395414, 1, 1, 1, 1, 1,
-0.6073889, -0.8678405, -2.215226, 1, 1, 1, 1, 1,
-0.6055676, 0.4160252, -2.031429, 1, 1, 1, 1, 1,
-0.6039727, 0.2792539, 0.9957469, 1, 1, 1, 1, 1,
-0.5935102, -0.1752761, -1.690418, 1, 1, 1, 1, 1,
-0.5907603, 0.2498701, -2.32649, 0, 0, 1, 1, 1,
-0.5899814, 0.195367, -0.1932725, 1, 0, 0, 1, 1,
-0.589298, 0.8895475, -0.6634702, 1, 0, 0, 1, 1,
-0.5851074, -0.2472228, -1.269345, 1, 0, 0, 1, 1,
-0.5795751, 1.818944, 0.5447428, 1, 0, 0, 1, 1,
-0.5779417, 0.5320497, -0.6828937, 1, 0, 0, 1, 1,
-0.5750064, -0.3177232, -2.644552, 0, 0, 0, 1, 1,
-0.5695202, -0.4936967, -2.216732, 0, 0, 0, 1, 1,
-0.5688493, 0.9557359, -0.4899468, 0, 0, 0, 1, 1,
-0.562308, 1.136252, 0.7561481, 0, 0, 0, 1, 1,
-0.5621672, -1.243678, -2.362666, 0, 0, 0, 1, 1,
-0.5599864, 0.4831779, -0.8753639, 0, 0, 0, 1, 1,
-0.5567217, 0.6591226, 0.4856177, 0, 0, 0, 1, 1,
-0.556125, -0.4714839, -2.167983, 1, 1, 1, 1, 1,
-0.5543925, 0.5347655, -1.570418, 1, 1, 1, 1, 1,
-0.5537368, 1.308526, -0.469077, 1, 1, 1, 1, 1,
-0.5468706, -1.546006, -1.815458, 1, 1, 1, 1, 1,
-0.5468539, 0.499243, 0.009842628, 1, 1, 1, 1, 1,
-0.5381945, 0.2059959, -2.460795, 1, 1, 1, 1, 1,
-0.5347075, -0.8113818, -1.56998, 1, 1, 1, 1, 1,
-0.5343552, 1.15514, -1.707122, 1, 1, 1, 1, 1,
-0.5306381, 1.099049, -1.153102, 1, 1, 1, 1, 1,
-0.5295269, -2.485247, -3.020534, 1, 1, 1, 1, 1,
-0.5294243, -0.5087439, -1.822188, 1, 1, 1, 1, 1,
-0.5286967, -0.4828463, -2.460315, 1, 1, 1, 1, 1,
-0.5267919, 0.3909973, -2.725614, 1, 1, 1, 1, 1,
-0.5246577, -0.7246174, -2.928049, 1, 1, 1, 1, 1,
-0.5237756, -0.3150199, -0.5763559, 1, 1, 1, 1, 1,
-0.5231221, 1.380528, 0.3103841, 0, 0, 1, 1, 1,
-0.5220572, 1.035392, -0.2820822, 1, 0, 0, 1, 1,
-0.5219564, 1.189003, 0.5463029, 1, 0, 0, 1, 1,
-0.5166386, 0.4998964, -1.101781, 1, 0, 0, 1, 1,
-0.509582, 0.2436107, 0.8243757, 1, 0, 0, 1, 1,
-0.5075278, -0.6709282, -2.221886, 1, 0, 0, 1, 1,
-0.5062941, -1.049548, -2.185373, 0, 0, 0, 1, 1,
-0.5060079, -0.6811889, -1.524142, 0, 0, 0, 1, 1,
-0.4944645, -0.3599517, -2.282365, 0, 0, 0, 1, 1,
-0.4925797, 0.6969271, 0.2770132, 0, 0, 0, 1, 1,
-0.490356, 0.1640441, -1.654633, 0, 0, 0, 1, 1,
-0.489336, 0.1852809, -1.430812, 0, 0, 0, 1, 1,
-0.4851578, -0.7711344, -1.090568, 0, 0, 0, 1, 1,
-0.4835751, -1.513386, -2.35988, 1, 1, 1, 1, 1,
-0.4833211, -0.7638025, -2.515879, 1, 1, 1, 1, 1,
-0.4826141, -0.4799031, -2.747225, 1, 1, 1, 1, 1,
-0.4817283, -1.321973, 0.07388289, 1, 1, 1, 1, 1,
-0.4789037, 0.7434872, 0.6233817, 1, 1, 1, 1, 1,
-0.474957, -0.1286075, -0.7583676, 1, 1, 1, 1, 1,
-0.4727643, -0.1100044, -2.947341, 1, 1, 1, 1, 1,
-0.4720877, -0.3535221, -1.763113, 1, 1, 1, 1, 1,
-0.4682009, -2.230151, -2.451025, 1, 1, 1, 1, 1,
-0.4651179, 0.2058269, -0.5382957, 1, 1, 1, 1, 1,
-0.4615842, 0.07341416, -0.9381345, 1, 1, 1, 1, 1,
-0.4579121, -0.913459, -1.582003, 1, 1, 1, 1, 1,
-0.4572811, -0.5748554, -3.014606, 1, 1, 1, 1, 1,
-0.4556068, 0.1537812, 0.02572697, 1, 1, 1, 1, 1,
-0.454641, -0.04645205, -1.018294, 1, 1, 1, 1, 1,
-0.4521488, -0.38236, -1.765045, 0, 0, 1, 1, 1,
-0.4504835, -0.4929487, -2.104155, 1, 0, 0, 1, 1,
-0.4498893, 2.117584, 1.989851, 1, 0, 0, 1, 1,
-0.4457691, 0.1776427, -0.7196957, 1, 0, 0, 1, 1,
-0.4448197, 1.57504, -0.4870369, 1, 0, 0, 1, 1,
-0.4424201, -0.3309505, -5.055586, 1, 0, 0, 1, 1,
-0.4365025, 1.674374, -0.07854133, 0, 0, 0, 1, 1,
-0.4318724, -0.04580373, -2.177155, 0, 0, 0, 1, 1,
-0.4273689, 2.157079, -1.498857, 0, 0, 0, 1, 1,
-0.4272837, 1.193397, -0.1530047, 0, 0, 0, 1, 1,
-0.4272593, -1.380988, -3.516071, 0, 0, 0, 1, 1,
-0.4235004, -0.7587035, -3.79765, 0, 0, 0, 1, 1,
-0.4212958, -0.3314535, -2.227796, 0, 0, 0, 1, 1,
-0.4207431, -0.3669063, -0.9062059, 1, 1, 1, 1, 1,
-0.4200334, -0.5472692, -3.430519, 1, 1, 1, 1, 1,
-0.41761, -0.1319575, -2.869133, 1, 1, 1, 1, 1,
-0.4164546, 1.050086, -0.9112645, 1, 1, 1, 1, 1,
-0.4098826, -0.7158401, -3.721869, 1, 1, 1, 1, 1,
-0.4002706, 0.3374837, 0.5392807, 1, 1, 1, 1, 1,
-0.3999952, -1.131595, -2.919954, 1, 1, 1, 1, 1,
-0.3967804, -1.355077, -3.567331, 1, 1, 1, 1, 1,
-0.3909755, 0.4451869, -1.598714, 1, 1, 1, 1, 1,
-0.3888883, 0.4671844, 0.03482119, 1, 1, 1, 1, 1,
-0.3820194, -0.7046248, -5.195392, 1, 1, 1, 1, 1,
-0.3793515, 0.4240902, -0.9534591, 1, 1, 1, 1, 1,
-0.3736867, 0.3884919, -0.05441914, 1, 1, 1, 1, 1,
-0.3730382, -0.1226296, -0.9286187, 1, 1, 1, 1, 1,
-0.3703119, 0.4901014, -0.9455558, 1, 1, 1, 1, 1,
-0.3696842, 0.2094377, -0.7926428, 0, 0, 1, 1, 1,
-0.3654612, 0.4323501, -1.261383, 1, 0, 0, 1, 1,
-0.3635105, 0.890238, -0.7665163, 1, 0, 0, 1, 1,
-0.3568609, 0.5766689, -1.467712, 1, 0, 0, 1, 1,
-0.3529591, 0.7564828, -0.7719442, 1, 0, 0, 1, 1,
-0.3455593, -0.5517296, -3.564654, 1, 0, 0, 1, 1,
-0.3435479, -0.5089938, -2.613753, 0, 0, 0, 1, 1,
-0.343211, -0.7926469, -4.255529, 0, 0, 0, 1, 1,
-0.342032, 0.6749576, -0.06770916, 0, 0, 0, 1, 1,
-0.338226, -0.1801213, -3.180629, 0, 0, 0, 1, 1,
-0.3371121, 0.4807229, -1.811449, 0, 0, 0, 1, 1,
-0.3348874, 0.568671, -0.9978194, 0, 0, 0, 1, 1,
-0.3308257, 0.09831724, -2.573158, 0, 0, 0, 1, 1,
-0.3306912, -0.3038883, -0.8172814, 1, 1, 1, 1, 1,
-0.3294592, -0.07878455, 0.1122429, 1, 1, 1, 1, 1,
-0.3278339, 0.05019147, -2.450371, 1, 1, 1, 1, 1,
-0.3249794, -1.010971, -4.335658, 1, 1, 1, 1, 1,
-0.3222615, 0.413956, -0.02973404, 1, 1, 1, 1, 1,
-0.3196178, -0.183436, -2.779325, 1, 1, 1, 1, 1,
-0.3122801, 0.1637449, 0.8699931, 1, 1, 1, 1, 1,
-0.3098191, 0.312668, -0.7429326, 1, 1, 1, 1, 1,
-0.3086456, -1.788965, -3.944842, 1, 1, 1, 1, 1,
-0.3075739, -2.417759, -3.805848, 1, 1, 1, 1, 1,
-0.3073691, -0.7439135, -3.219347, 1, 1, 1, 1, 1,
-0.3066263, -0.6257084, -2.185838, 1, 1, 1, 1, 1,
-0.3050045, -0.3819328, -1.987505, 1, 1, 1, 1, 1,
-0.3029763, 0.4099869, -1.790655, 1, 1, 1, 1, 1,
-0.2936813, 1.713677, -0.5196669, 1, 1, 1, 1, 1,
-0.2923513, -0.4085178, -1.491692, 0, 0, 1, 1, 1,
-0.2879308, 2.522651, -2.605412, 1, 0, 0, 1, 1,
-0.2872508, -2.447369, -3.067413, 1, 0, 0, 1, 1,
-0.2781892, 0.0008833189, -2.254385, 1, 0, 0, 1, 1,
-0.2771674, 0.01992336, -1.554217, 1, 0, 0, 1, 1,
-0.2713475, -0.4044311, -2.528316, 1, 0, 0, 1, 1,
-0.2711638, 0.4085811, 0.582528, 0, 0, 0, 1, 1,
-0.2710238, 0.8738587, 0.06104412, 0, 0, 0, 1, 1,
-0.2698291, -1.349775, -2.127448, 0, 0, 0, 1, 1,
-0.2640752, -1.724172, -4.165953, 0, 0, 0, 1, 1,
-0.2548387, 0.3057662, -0.6707813, 0, 0, 0, 1, 1,
-0.2527585, -0.7724316, -2.297488, 0, 0, 0, 1, 1,
-0.2508897, 0.7631524, 0.1408143, 0, 0, 0, 1, 1,
-0.2473255, -1.672836, -3.164, 1, 1, 1, 1, 1,
-0.2463708, 0.369799, -2.42227, 1, 1, 1, 1, 1,
-0.2450467, -0.6770658, -4.775262, 1, 1, 1, 1, 1,
-0.2445748, 3.405387, -1.035814, 1, 1, 1, 1, 1,
-0.2416162, 0.5669369, -0.03770199, 1, 1, 1, 1, 1,
-0.2408473, 2.081689, -0.6450035, 1, 1, 1, 1, 1,
-0.2403994, 0.5999902, 0.4221602, 1, 1, 1, 1, 1,
-0.2292387, -0.1000742, -2.083577, 1, 1, 1, 1, 1,
-0.2285849, 1.257859, 0.3820952, 1, 1, 1, 1, 1,
-0.2283298, 0.8045855, -0.6467586, 1, 1, 1, 1, 1,
-0.225562, -0.4757872, -0.9314293, 1, 1, 1, 1, 1,
-0.2224778, -1.142199, -2.207883, 1, 1, 1, 1, 1,
-0.222183, -0.2608745, -2.608631, 1, 1, 1, 1, 1,
-0.221522, 0.1908494, 0.957783, 1, 1, 1, 1, 1,
-0.220939, 0.5025909, -1.061313, 1, 1, 1, 1, 1,
-0.2144163, 0.6084457, -0.4207862, 0, 0, 1, 1, 1,
-0.212467, 0.2439041, -0.6906819, 1, 0, 0, 1, 1,
-0.2120422, -1.53147, -2.726197, 1, 0, 0, 1, 1,
-0.2087935, 0.6849341, 1.66429, 1, 0, 0, 1, 1,
-0.2040581, -0.6037849, -4.57104, 1, 0, 0, 1, 1,
-0.2031315, 0.4542531, -0.3463843, 1, 0, 0, 1, 1,
-0.2020101, -1.491025, -4.296823, 0, 0, 0, 1, 1,
-0.1997236, -0.8834541, -4.661811, 0, 0, 0, 1, 1,
-0.1981471, 0.3172963, -0.2782066, 0, 0, 0, 1, 1,
-0.19091, -0.4279107, -2.339077, 0, 0, 0, 1, 1,
-0.1908754, 0.6536788, -0.03819421, 0, 0, 0, 1, 1,
-0.1904315, -1.075287, -1.504152, 0, 0, 0, 1, 1,
-0.1893644, -1.035015, -1.839921, 0, 0, 0, 1, 1,
-0.1873295, -0.321559, -2.378478, 1, 1, 1, 1, 1,
-0.1862043, 1.049783, 0.09297791, 1, 1, 1, 1, 1,
-0.1842699, 0.1512828, -0.8348639, 1, 1, 1, 1, 1,
-0.1836878, -0.3523639, -0.9910133, 1, 1, 1, 1, 1,
-0.1825768, 0.4100082, 0.4052249, 1, 1, 1, 1, 1,
-0.1818704, -0.9913387, -2.537113, 1, 1, 1, 1, 1,
-0.1818036, -0.1141126, -1.168524, 1, 1, 1, 1, 1,
-0.1747847, -0.2318629, -3.458122, 1, 1, 1, 1, 1,
-0.1741056, 0.1452601, -1.079898, 1, 1, 1, 1, 1,
-0.1722578, -2.273086, -3.296438, 1, 1, 1, 1, 1,
-0.1664504, 3.504704, -0.3966778, 1, 1, 1, 1, 1,
-0.1576366, -0.4822449, -2.638366, 1, 1, 1, 1, 1,
-0.1564458, -1.803064, -1.927419, 1, 1, 1, 1, 1,
-0.1555017, 0.5550784, -0.5580356, 1, 1, 1, 1, 1,
-0.1552963, 0.3844258, 0.8974723, 1, 1, 1, 1, 1,
-0.1529226, 1.186817, 0.8131218, 0, 0, 1, 1, 1,
-0.1493806, 0.6260622, -0.9281479, 1, 0, 0, 1, 1,
-0.1474498, 0.8255678, 0.3553644, 1, 0, 0, 1, 1,
-0.1464503, 0.4419199, -2.213681, 1, 0, 0, 1, 1,
-0.1447441, -0.6884282, -1.438501, 1, 0, 0, 1, 1,
-0.143989, 1.37666, 0.7830406, 1, 0, 0, 1, 1,
-0.1420957, -0.6640828, -2.741738, 0, 0, 0, 1, 1,
-0.1341726, 0.1731421, 0.8034574, 0, 0, 0, 1, 1,
-0.1245591, -0.07393537, -2.713048, 0, 0, 0, 1, 1,
-0.1179854, -0.4548343, -1.671499, 0, 0, 0, 1, 1,
-0.1176719, 0.9535535, -0.579892, 0, 0, 0, 1, 1,
-0.1166283, -0.8470116, -2.269792, 0, 0, 0, 1, 1,
-0.1164479, -0.6334904, -3.55172, 0, 0, 0, 1, 1,
-0.110887, -0.3889003, -1.178297, 1, 1, 1, 1, 1,
-0.1079044, -1.678897, -3.658357, 1, 1, 1, 1, 1,
-0.1069181, -0.1083436, -2.3733, 1, 1, 1, 1, 1,
-0.1014207, -2.408996, -2.791669, 1, 1, 1, 1, 1,
-0.09862369, 0.4817575, 1.236242, 1, 1, 1, 1, 1,
-0.09704224, 0.2504342, -0.5503391, 1, 1, 1, 1, 1,
-0.09578669, 1.012303, 0.4493584, 1, 1, 1, 1, 1,
-0.09429077, 0.3265954, -0.7110708, 1, 1, 1, 1, 1,
-0.09380784, -0.3163715, -3.30872, 1, 1, 1, 1, 1,
-0.09281317, -0.855835, -2.152505, 1, 1, 1, 1, 1,
-0.09220694, 1.673295, 0.9181567, 1, 1, 1, 1, 1,
-0.09133545, -0.180462, -0.9304768, 1, 1, 1, 1, 1,
-0.08977609, 0.3133327, -0.6837515, 1, 1, 1, 1, 1,
-0.08814847, 0.3246459, -0.1751888, 1, 1, 1, 1, 1,
-0.08559133, -0.2257721, -2.639402, 1, 1, 1, 1, 1,
-0.085376, -0.06545452, -2.387379, 0, 0, 1, 1, 1,
-0.0813896, 0.7647503, -0.9991987, 1, 0, 0, 1, 1,
-0.07976065, 1.114549, 0.6115994, 1, 0, 0, 1, 1,
-0.07843319, 0.06212387, -1.197774, 1, 0, 0, 1, 1,
-0.07544452, 0.5934299, -1.873114, 1, 0, 0, 1, 1,
-0.07444553, -0.1132986, -4.801965, 1, 0, 0, 1, 1,
-0.07073171, 0.7885332, -1.098449, 0, 0, 0, 1, 1,
-0.06789583, -0.2828867, -2.709245, 0, 0, 0, 1, 1,
-0.06677413, 0.2556604, 0.2102041, 0, 0, 0, 1, 1,
-0.06506994, -2.925351, -4.641315, 0, 0, 0, 1, 1,
-0.06353333, -1.255961, -1.340464, 0, 0, 0, 1, 1,
-0.06314193, -0.6686566, -2.550295, 0, 0, 0, 1, 1,
-0.06201625, 0.6541613, 0.2118279, 0, 0, 0, 1, 1,
-0.06160937, 0.3471685, 0.340911, 1, 1, 1, 1, 1,
-0.05613349, -0.6437054, -1.728369, 1, 1, 1, 1, 1,
-0.05486233, -1.973083, -3.356071, 1, 1, 1, 1, 1,
-0.05443751, -0.8366756, -3.439449, 1, 1, 1, 1, 1,
-0.05329222, -1.613158, -4.690259, 1, 1, 1, 1, 1,
-0.0481184, 0.7535686, -1.877574, 1, 1, 1, 1, 1,
-0.04810893, -0.6273094, -3.45911, 1, 1, 1, 1, 1,
-0.04158184, 0.2730387, 0.380531, 1, 1, 1, 1, 1,
-0.0390317, -2.472935, -3.737524, 1, 1, 1, 1, 1,
-0.0373812, -0.1312679, -2.830485, 1, 1, 1, 1, 1,
-0.03473361, -0.3713852, -2.381275, 1, 1, 1, 1, 1,
-0.03004595, -1.183938, -4.540322, 1, 1, 1, 1, 1,
-0.02677127, -0.4449434, -3.777577, 1, 1, 1, 1, 1,
-0.02552484, 0.09426517, 0.5422841, 1, 1, 1, 1, 1,
-0.02119094, 0.6763689, 1.168729, 1, 1, 1, 1, 1,
-0.01398686, -0.1464299, -3.606439, 0, 0, 1, 1, 1,
-0.0137155, -0.6798083, -3.502938, 1, 0, 0, 1, 1,
0.004177185, 0.04821507, -0.8135389, 1, 0, 0, 1, 1,
0.005465866, 0.5979767, -1.356651, 1, 0, 0, 1, 1,
0.005907597, -0.7614335, 2.905546, 1, 0, 0, 1, 1,
0.01075635, -0.008062504, 2.534017, 1, 0, 0, 1, 1,
0.01210824, -0.940973, 4.757782, 0, 0, 0, 1, 1,
0.01303353, -1.665139, 2.271522, 0, 0, 0, 1, 1,
0.01415511, 0.7814413, -0.1308717, 0, 0, 0, 1, 1,
0.01992572, 1.866604, -1.65757, 0, 0, 0, 1, 1,
0.02821354, 0.4269972, 1.088384, 0, 0, 0, 1, 1,
0.03026122, -0.3047384, 0.4447967, 0, 0, 0, 1, 1,
0.0320648, -0.03113341, 2.219419, 0, 0, 0, 1, 1,
0.03609393, -0.9501423, 1.802218, 1, 1, 1, 1, 1,
0.03641244, 1.244852, 1.541193, 1, 1, 1, 1, 1,
0.04011354, 1.135521, -1.29724, 1, 1, 1, 1, 1,
0.04303049, -0.1093559, 4.161966, 1, 1, 1, 1, 1,
0.04466216, -0.330017, 2.752247, 1, 1, 1, 1, 1,
0.04518772, 0.4033636, 0.8663493, 1, 1, 1, 1, 1,
0.05000735, -0.7985124, 3.751039, 1, 1, 1, 1, 1,
0.05545733, -0.01557049, 1.154258, 1, 1, 1, 1, 1,
0.05628415, -2.030737, 3.038496, 1, 1, 1, 1, 1,
0.057692, 0.7826485, -0.2264658, 1, 1, 1, 1, 1,
0.05800533, 1.288214, -0.2269103, 1, 1, 1, 1, 1,
0.06075028, 1.320383, 0.1713717, 1, 1, 1, 1, 1,
0.06437705, 0.3206206, -0.8793655, 1, 1, 1, 1, 1,
0.06995662, 0.02133993, 0.0048794, 1, 1, 1, 1, 1,
0.07198507, -0.6447877, 3.583037, 1, 1, 1, 1, 1,
0.07997077, -0.6321908, 4.805289, 0, 0, 1, 1, 1,
0.08207859, 0.06741887, 1.103545, 1, 0, 0, 1, 1,
0.08383954, -1.320737, 2.828913, 1, 0, 0, 1, 1,
0.08517159, -1.288047, 5.781723, 1, 0, 0, 1, 1,
0.08586267, 0.1607234, -0.03108982, 1, 0, 0, 1, 1,
0.08987403, 1.51738, 1.638409, 1, 0, 0, 1, 1,
0.09568131, 1.275506, 0.1931584, 0, 0, 0, 1, 1,
0.09572437, 0.1046745, 0.5666775, 0, 0, 0, 1, 1,
0.09724318, -0.1382376, 2.568962, 0, 0, 0, 1, 1,
0.1014756, -0.4242584, 3.506598, 0, 0, 0, 1, 1,
0.1039353, 0.2613803, 0.533361, 0, 0, 0, 1, 1,
0.1056806, -0.8252689, 2.798594, 0, 0, 0, 1, 1,
0.106135, 0.09233959, 1.017601, 0, 0, 0, 1, 1,
0.1095775, 1.8963, -0.7002495, 1, 1, 1, 1, 1,
0.1123297, -0.8853024, 1.767924, 1, 1, 1, 1, 1,
0.1266514, 0.1365914, 0.3468078, 1, 1, 1, 1, 1,
0.1292726, -0.3180201, 2.191335, 1, 1, 1, 1, 1,
0.1296927, 1.389372, -0.7161678, 1, 1, 1, 1, 1,
0.1365829, 0.8096134, -0.5054547, 1, 1, 1, 1, 1,
0.1387702, -0.4441822, 4.14944, 1, 1, 1, 1, 1,
0.1409528, 0.1458803, 0.3025495, 1, 1, 1, 1, 1,
0.1422338, 0.1098405, 1.383987, 1, 1, 1, 1, 1,
0.1458064, 0.237666, 1.184895, 1, 1, 1, 1, 1,
0.1508327, -0.9412127, 3.728217, 1, 1, 1, 1, 1,
0.1574525, 0.4906012, -1.164545, 1, 1, 1, 1, 1,
0.1652986, -0.3450369, 0.963963, 1, 1, 1, 1, 1,
0.166907, 1.128104, -0.1171325, 1, 1, 1, 1, 1,
0.1698827, 1.007595, 0.3734121, 1, 1, 1, 1, 1,
0.1802853, 0.8900328, -0.7862372, 0, 0, 1, 1, 1,
0.1878865, 1.002555, -0.3915422, 1, 0, 0, 1, 1,
0.1883423, 0.2295172, 1.476717, 1, 0, 0, 1, 1,
0.193221, -1.245833, 4.597305, 1, 0, 0, 1, 1,
0.1966431, 0.4955129, 0.06033457, 1, 0, 0, 1, 1,
0.2002477, 0.2861608, 1.330948, 1, 0, 0, 1, 1,
0.2066707, 3.243322, 0.03537888, 0, 0, 0, 1, 1,
0.2081803, 0.0244811, 2.022129, 0, 0, 0, 1, 1,
0.2095052, 0.5923694, -0.4171167, 0, 0, 0, 1, 1,
0.21001, 0.02595487, 3.094214, 0, 0, 0, 1, 1,
0.2103304, -1.210778, 2.735475, 0, 0, 0, 1, 1,
0.2125704, 1.687921, 0.8225892, 0, 0, 0, 1, 1,
0.2130602, 0.03111705, 1.132315, 0, 0, 0, 1, 1,
0.2137001, -0.1885363, 0.8330927, 1, 1, 1, 1, 1,
0.21484, 0.9456618, 0.7858509, 1, 1, 1, 1, 1,
0.2156629, -1.586657, 4.737734, 1, 1, 1, 1, 1,
0.2203671, -0.04592206, 2.195916, 1, 1, 1, 1, 1,
0.2215646, 0.2736508, 1.035829, 1, 1, 1, 1, 1,
0.2234893, -0.8938617, 1.871634, 1, 1, 1, 1, 1,
0.2238133, 0.991339, -1.187473, 1, 1, 1, 1, 1,
0.2238689, -1.549612, 4.557412, 1, 1, 1, 1, 1,
0.2251389, 0.1044115, 0.02950149, 1, 1, 1, 1, 1,
0.2254926, 0.4417605, 1.486787, 1, 1, 1, 1, 1,
0.2255828, 0.06506122, 2.444014, 1, 1, 1, 1, 1,
0.2257092, -0.7920968, 3.08745, 1, 1, 1, 1, 1,
0.22736, 0.914946, 1.435048, 1, 1, 1, 1, 1,
0.2284211, -1.508262, 3.294903, 1, 1, 1, 1, 1,
0.2295178, 1.465841, 1.346935, 1, 1, 1, 1, 1,
0.2322695, -0.5511578, 1.676066, 0, 0, 1, 1, 1,
0.2323924, 1.112772, -0.6985683, 1, 0, 0, 1, 1,
0.23295, -1.040049, 2.65374, 1, 0, 0, 1, 1,
0.2331473, 0.1270323, 1.023654, 1, 0, 0, 1, 1,
0.2355097, -1.158942, 1.857889, 1, 0, 0, 1, 1,
0.2369885, 0.2354241, -0.7418122, 1, 0, 0, 1, 1,
0.2396, -0.2382651, 1.330619, 0, 0, 0, 1, 1,
0.2412282, -0.6054307, 2.787896, 0, 0, 0, 1, 1,
0.2414377, -1.385379, 3.126294, 0, 0, 0, 1, 1,
0.2438231, -0.6100901, 1.465581, 0, 0, 0, 1, 1,
0.2469188, 0.2454194, 0.4806665, 0, 0, 0, 1, 1,
0.2536559, -0.8533419, 2.343378, 0, 0, 0, 1, 1,
0.2558971, -0.04560822, 0.5462332, 0, 0, 0, 1, 1,
0.2646051, 1.703937, -0.09593578, 1, 1, 1, 1, 1,
0.2692621, 0.5683866, 0.3986665, 1, 1, 1, 1, 1,
0.2704856, -3.886771, 4.57227, 1, 1, 1, 1, 1,
0.2708495, -1.488617, 4.289523, 1, 1, 1, 1, 1,
0.2711917, -0.9156771, 4.024633, 1, 1, 1, 1, 1,
0.2716443, -0.7712232, 3.265027, 1, 1, 1, 1, 1,
0.2747643, 1.131439, 0.3732753, 1, 1, 1, 1, 1,
0.2782994, -1.185538, 4.796407, 1, 1, 1, 1, 1,
0.2784833, 0.5166311, 0.2261151, 1, 1, 1, 1, 1,
0.2796893, -0.3123743, 0.9941108, 1, 1, 1, 1, 1,
0.2806448, -0.3752278, 3.443962, 1, 1, 1, 1, 1,
0.2841324, 0.03562088, 1.513457, 1, 1, 1, 1, 1,
0.2862659, 0.7387941, 1.763305, 1, 1, 1, 1, 1,
0.2863995, 1.360276, 2.177933, 1, 1, 1, 1, 1,
0.2883345, -1.957054, 2.959411, 1, 1, 1, 1, 1,
0.2910945, 1.141717, 0.6236119, 0, 0, 1, 1, 1,
0.2912592, -0.8104423, 3.421671, 1, 0, 0, 1, 1,
0.292638, 0.4360462, 2.541191, 1, 0, 0, 1, 1,
0.2938019, 0.5039985, -0.7372237, 1, 0, 0, 1, 1,
0.304082, -0.6285262, 2.841621, 1, 0, 0, 1, 1,
0.3045637, 2.595231, 1.521336, 1, 0, 0, 1, 1,
0.306426, 1.305179, -0.2153865, 0, 0, 0, 1, 1,
0.3095298, -1.151029, 1.298397, 0, 0, 0, 1, 1,
0.3124289, 1.420479, -0.06584828, 0, 0, 0, 1, 1,
0.3146976, -0.5458036, 3.504635, 0, 0, 0, 1, 1,
0.3179937, 0.2981948, -0.177261, 0, 0, 0, 1, 1,
0.3219767, 0.252253, 0.355051, 0, 0, 0, 1, 1,
0.3224635, -0.4320679, 3.083982, 0, 0, 0, 1, 1,
0.3233543, -0.401232, 3.477054, 1, 1, 1, 1, 1,
0.3251963, -1.670345, 1.338137, 1, 1, 1, 1, 1,
0.3269615, 0.0880942, 1.518201, 1, 1, 1, 1, 1,
0.3326707, 0.5386207, 1.514891, 1, 1, 1, 1, 1,
0.3419127, -2.134906, 3.991727, 1, 1, 1, 1, 1,
0.3426964, 0.263907, 0.9606311, 1, 1, 1, 1, 1,
0.3522343, 0.499446, -0.1684661, 1, 1, 1, 1, 1,
0.3527507, -0.4216399, 1.683238, 1, 1, 1, 1, 1,
0.3572283, -0.9131734, 4.639397, 1, 1, 1, 1, 1,
0.3582911, -0.1264838, 0.56123, 1, 1, 1, 1, 1,
0.3600262, 0.1409859, -0.3272721, 1, 1, 1, 1, 1,
0.3619076, 0.4618717, 0.7129071, 1, 1, 1, 1, 1,
0.3675053, -0.563024, 0.4016908, 1, 1, 1, 1, 1,
0.3696117, -1.981346, 3.614686, 1, 1, 1, 1, 1,
0.3706686, 0.4205685, -0.06559748, 1, 1, 1, 1, 1,
0.3758516, -0.1321745, 1.10223, 0, 0, 1, 1, 1,
0.3762298, 0.2429914, -0.1111091, 1, 0, 0, 1, 1,
0.3801154, 0.833827, 1.645844, 1, 0, 0, 1, 1,
0.3843252, -0.03317585, 0.8401422, 1, 0, 0, 1, 1,
0.3885319, 0.2795263, 1.136347, 1, 0, 0, 1, 1,
0.3889271, -1.289002, 2.467113, 1, 0, 0, 1, 1,
0.3920957, 1.093217, -0.5209019, 0, 0, 0, 1, 1,
0.3971487, -2.123962, 2.685969, 0, 0, 0, 1, 1,
0.3986226, 1.113798, 1.26381, 0, 0, 0, 1, 1,
0.4004502, 1.636755, -0.4738347, 0, 0, 0, 1, 1,
0.4076812, -0.7529296, 2.267712, 0, 0, 0, 1, 1,
0.4115853, 1.126938, 0.07267129, 0, 0, 0, 1, 1,
0.4172944, -0.9532362, 3.888696, 0, 0, 0, 1, 1,
0.4191692, 0.8404716, 0.5116251, 1, 1, 1, 1, 1,
0.4211589, -0.5258086, 2.398488, 1, 1, 1, 1, 1,
0.4282408, 0.6058543, 2.144035, 1, 1, 1, 1, 1,
0.4288912, -1.515228, 3.544746, 1, 1, 1, 1, 1,
0.4321635, 0.4395607, 1.789538, 1, 1, 1, 1, 1,
0.433585, 1.570193, 0.07977194, 1, 1, 1, 1, 1,
0.4353395, -0.3569064, 0.2063439, 1, 1, 1, 1, 1,
0.4355076, -2.047011, 4.184505, 1, 1, 1, 1, 1,
0.4526753, -0.3089644, 2.599227, 1, 1, 1, 1, 1,
0.4556123, 0.4787535, 1.214448, 1, 1, 1, 1, 1,
0.4580607, 0.9936994, 1.853797, 1, 1, 1, 1, 1,
0.4635603, -1.01333, 2.994855, 1, 1, 1, 1, 1,
0.4642716, 0.05905362, 1.260314, 1, 1, 1, 1, 1,
0.4754128, -1.03629, 3.093581, 1, 1, 1, 1, 1,
0.4859261, -0.8388321, 2.714162, 1, 1, 1, 1, 1,
0.4876221, 0.4649388, 1.459405, 0, 0, 1, 1, 1,
0.4971592, -0.3987084, 1.295711, 1, 0, 0, 1, 1,
0.4973564, 0.6579411, 3.135579, 1, 0, 0, 1, 1,
0.497466, 1.415456, -0.7996725, 1, 0, 0, 1, 1,
0.4986529, 0.5482312, 0.325607, 1, 0, 0, 1, 1,
0.5021064, 0.520913, 1.167797, 1, 0, 0, 1, 1,
0.5060302, 0.348198, 0.8835031, 0, 0, 0, 1, 1,
0.5066722, 0.1742941, 2.718438, 0, 0, 0, 1, 1,
0.5084753, -0.1464564, 4.21054, 0, 0, 0, 1, 1,
0.5091847, -1.109722, 2.339229, 0, 0, 0, 1, 1,
0.5098822, -0.2304479, 1.664124, 0, 0, 0, 1, 1,
0.5112742, 0.6389264, 0.7146416, 0, 0, 0, 1, 1,
0.5125419, -0.6693257, 0.4887304, 0, 0, 0, 1, 1,
0.5131809, -1.690116, 2.718774, 1, 1, 1, 1, 1,
0.5190389, 2.411582, 0.1706111, 1, 1, 1, 1, 1,
0.5302725, -0.1293821, -0.003824524, 1, 1, 1, 1, 1,
0.5317218, 0.3139407, 0.0540252, 1, 1, 1, 1, 1,
0.5325491, 0.0289191, 1.463331, 1, 1, 1, 1, 1,
0.5334786, -0.8713272, 2.023816, 1, 1, 1, 1, 1,
0.5349464, 0.7981876, -0.931211, 1, 1, 1, 1, 1,
0.5361552, 0.08639892, 2.108436, 1, 1, 1, 1, 1,
0.5413564, -0.2744203, 3.04822, 1, 1, 1, 1, 1,
0.5425816, -0.9968534, 1.970476, 1, 1, 1, 1, 1,
0.5426933, -0.3732003, 1.207991, 1, 1, 1, 1, 1,
0.5466281, -1.138163, 2.227226, 1, 1, 1, 1, 1,
0.5467423, -0.9123523, 3.550965, 1, 1, 1, 1, 1,
0.54726, 0.6713927, -0.02837078, 1, 1, 1, 1, 1,
0.5478879, 0.3425336, 0.539488, 1, 1, 1, 1, 1,
0.5555993, 0.9431191, 1.256557, 0, 0, 1, 1, 1,
0.55562, -0.208488, 1.055105, 1, 0, 0, 1, 1,
0.5578483, 0.07549348, 0.8073386, 1, 0, 0, 1, 1,
0.5615856, -0.837191, 3.110386, 1, 0, 0, 1, 1,
0.5620473, -1.436059, 3.700659, 1, 0, 0, 1, 1,
0.5641854, -0.5993643, 2.860059, 1, 0, 0, 1, 1,
0.5654863, -0.09185454, 1.864648, 0, 0, 0, 1, 1,
0.5668714, -1.506065, 3.340871, 0, 0, 0, 1, 1,
0.568268, -1.500439, 3.852128, 0, 0, 0, 1, 1,
0.5745116, -0.9289498, 3.581646, 0, 0, 0, 1, 1,
0.5808164, -1.508211, 2.560335, 0, 0, 0, 1, 1,
0.5828626, -1.516829, 1.913624, 0, 0, 0, 1, 1,
0.5865941, -0.4868293, 1.348567, 0, 0, 0, 1, 1,
0.5888558, -1.724373, 4.37347, 1, 1, 1, 1, 1,
0.589746, 0.3019901, 2.204787, 1, 1, 1, 1, 1,
0.5969079, -0.7254405, 4.432657, 1, 1, 1, 1, 1,
0.6041237, 0.9926869, -0.7034526, 1, 1, 1, 1, 1,
0.6079715, 1.586091, 1.313093, 1, 1, 1, 1, 1,
0.6087099, -1.320352, 2.574375, 1, 1, 1, 1, 1,
0.6097006, -0.6145324, 3.074093, 1, 1, 1, 1, 1,
0.6123977, 0.9392943, 0.5706865, 1, 1, 1, 1, 1,
0.6150305, 0.8534241, 0.1108646, 1, 1, 1, 1, 1,
0.6229609, -1.529742, 3.346422, 1, 1, 1, 1, 1,
0.6239887, -0.4472517, 0.963803, 1, 1, 1, 1, 1,
0.6294236, 0.3981414, 0.3657972, 1, 1, 1, 1, 1,
0.630034, 1.967128, -0.4155656, 1, 1, 1, 1, 1,
0.6304186, -1.051909, 1.991861, 1, 1, 1, 1, 1,
0.6333757, -1.879866, 1.826033, 1, 1, 1, 1, 1,
0.6334035, -0.1515554, 2.350038, 0, 0, 1, 1, 1,
0.6411677, 0.009346299, 1.393019, 1, 0, 0, 1, 1,
0.6441092, -3.208059, 3.581861, 1, 0, 0, 1, 1,
0.6467194, -0.3585054, -1.09484, 1, 0, 0, 1, 1,
0.647373, 0.6587433, 1.85365, 1, 0, 0, 1, 1,
0.6496722, 0.1145816, 1.324743, 1, 0, 0, 1, 1,
0.6515906, 0.5328802, 3.128878, 0, 0, 0, 1, 1,
0.6605932, 0.03546187, 0.7290811, 0, 0, 0, 1, 1,
0.6616769, 1.064301, 0.9859596, 0, 0, 0, 1, 1,
0.6654266, 0.4130975, 2.557878, 0, 0, 0, 1, 1,
0.6682452, 0.6209161, -0.05944433, 0, 0, 0, 1, 1,
0.6771551, -0.7374243, 1.07349, 0, 0, 0, 1, 1,
0.6778409, 0.8565178, 0.1426636, 0, 0, 0, 1, 1,
0.6802407, -1.232106, 3.26032, 1, 1, 1, 1, 1,
0.6836143, -0.7351937, 2.2307, 1, 1, 1, 1, 1,
0.6841506, 0.02954573, 0.9117938, 1, 1, 1, 1, 1,
0.6851449, 1.37619, -0.4326058, 1, 1, 1, 1, 1,
0.6895895, -0.6039748, 3.425215, 1, 1, 1, 1, 1,
0.6900805, 1.105341, 1.152212, 1, 1, 1, 1, 1,
0.6912497, 1.378596, -0.443301, 1, 1, 1, 1, 1,
0.6932973, 1.427913, 0.8163518, 1, 1, 1, 1, 1,
0.6956832, -0.0909184, 1.412529, 1, 1, 1, 1, 1,
0.7006081, -0.4485819, 1.766353, 1, 1, 1, 1, 1,
0.7015406, -1.080821, 1.490612, 1, 1, 1, 1, 1,
0.7023358, 0.8431906, 0.7008377, 1, 1, 1, 1, 1,
0.7024696, -0.9742626, 2.581435, 1, 1, 1, 1, 1,
0.7044734, 2.365872, -2.463537, 1, 1, 1, 1, 1,
0.7153959, 0.07290889, 2.306093, 1, 1, 1, 1, 1,
0.717959, 0.06246788, 0.4506839, 0, 0, 1, 1, 1,
0.7192393, -1.847849, 3.088686, 1, 0, 0, 1, 1,
0.722077, 0.1140576, 0.07567049, 1, 0, 0, 1, 1,
0.7221434, -1.050908, 4.721718, 1, 0, 0, 1, 1,
0.7226574, 0.1138339, -0.6253279, 1, 0, 0, 1, 1,
0.7266945, -0.5311962, 2.568026, 1, 0, 0, 1, 1,
0.7318834, -1.844668, 2.288181, 0, 0, 0, 1, 1,
0.7396845, -0.3902755, 3.834579, 0, 0, 0, 1, 1,
0.7438858, 1.478949, -1.766209, 0, 0, 0, 1, 1,
0.7473887, 0.1050355, 3.975102, 0, 0, 0, 1, 1,
0.7484999, 1.223081, 0.1083063, 0, 0, 0, 1, 1,
0.7563328, 0.6653903, -0.9169199, 0, 0, 0, 1, 1,
0.7569144, -0.4543841, 1.988204, 0, 0, 0, 1, 1,
0.7598888, 0.799705, -0.07905497, 1, 1, 1, 1, 1,
0.7659211, 0.3715276, 2.262555, 1, 1, 1, 1, 1,
0.7673107, -1.120561, 3.303813, 1, 1, 1, 1, 1,
0.7689394, -0.2809897, 1.926074, 1, 1, 1, 1, 1,
0.7716796, -1.747793, 2.734943, 1, 1, 1, 1, 1,
0.7720271, -0.1985822, 2.000901, 1, 1, 1, 1, 1,
0.7743763, 1.730888, 0.2532739, 1, 1, 1, 1, 1,
0.7783797, 0.7720882, -0.4161133, 1, 1, 1, 1, 1,
0.7789794, -1.580809, 1.929877, 1, 1, 1, 1, 1,
0.7799348, 0.4063903, 3.633877, 1, 1, 1, 1, 1,
0.7805704, 1.145369, 1.863695, 1, 1, 1, 1, 1,
0.7813555, 0.3192653, 1.653545, 1, 1, 1, 1, 1,
0.7871895, -0.005441956, 2.471793, 1, 1, 1, 1, 1,
0.7887934, 0.4447367, 1.260743, 1, 1, 1, 1, 1,
0.7953905, 0.7825334, 2.306298, 1, 1, 1, 1, 1,
0.7995386, -1.550088, 2.166569, 0, 0, 1, 1, 1,
0.8163638, -2.859247, 1.346518, 1, 0, 0, 1, 1,
0.8198878, -0.06088809, 2.483449, 1, 0, 0, 1, 1,
0.8199073, -0.6931656, 0.8458964, 1, 0, 0, 1, 1,
0.8233678, 2.9509, 2.154066, 1, 0, 0, 1, 1,
0.8256635, 0.9857143, 2.361344, 1, 0, 0, 1, 1,
0.8318724, -0.4386985, 1.798707, 0, 0, 0, 1, 1,
0.832399, 1.699577, -0.760383, 0, 0, 0, 1, 1,
0.8325315, 0.3742118, 1.491925, 0, 0, 0, 1, 1,
0.8348542, 0.4472329, 0.8908614, 0, 0, 0, 1, 1,
0.8368083, 2.114023, 0.9164254, 0, 0, 0, 1, 1,
0.8436258, -0.3216226, 2.875576, 0, 0, 0, 1, 1,
0.8441896, -1.33871, 2.003094, 0, 0, 0, 1, 1,
0.8453248, -0.8432893, 2.953727, 1, 1, 1, 1, 1,
0.8542689, 0.008390114, 2.262203, 1, 1, 1, 1, 1,
0.8551415, 1.610467, 1.09055, 1, 1, 1, 1, 1,
0.8561805, 1.015578, 1.315488, 1, 1, 1, 1, 1,
0.8574672, 0.214054, 2.260796, 1, 1, 1, 1, 1,
0.858748, -0.4897456, 3.262047, 1, 1, 1, 1, 1,
0.8604278, 0.2761558, 2.498463, 1, 1, 1, 1, 1,
0.8614572, 1.442757, 0.6195326, 1, 1, 1, 1, 1,
0.8645216, 0.1678049, 0.4697371, 1, 1, 1, 1, 1,
0.8678116, 2.140915, 0.4123554, 1, 1, 1, 1, 1,
0.8776433, 0.02269101, 0.9734195, 1, 1, 1, 1, 1,
0.877668, 2.68667, -1.2174, 1, 1, 1, 1, 1,
0.8864015, 0.3194108, 2.253281, 1, 1, 1, 1, 1,
0.892975, 0.9679835, 0.1234225, 1, 1, 1, 1, 1,
0.893088, -1.556855, 1.615706, 1, 1, 1, 1, 1,
0.895383, -0.4268863, 1.306941, 0, 0, 1, 1, 1,
0.8967113, 0.3713218, 0.5831758, 1, 0, 0, 1, 1,
0.901621, -0.8390558, 3.400705, 1, 0, 0, 1, 1,
0.9018698, 0.06089792, 2.925344, 1, 0, 0, 1, 1,
0.9020084, 1.625548, 2.864927, 1, 0, 0, 1, 1,
0.9149459, 0.9967052, 0.2833744, 1, 0, 0, 1, 1,
0.9188146, -0.07119155, 1.181327, 0, 0, 0, 1, 1,
0.9230455, -0.4574282, 2.941823, 0, 0, 0, 1, 1,
0.9238346, 1.394806, 1.183255, 0, 0, 0, 1, 1,
0.9254848, 0.5506081, 0.4044375, 0, 0, 0, 1, 1,
0.9316901, -0.007990375, 1.564672, 0, 0, 0, 1, 1,
0.9361367, 0.1866147, 2.553946, 0, 0, 0, 1, 1,
0.9363757, -0.6688279, 2.670315, 0, 0, 0, 1, 1,
0.9364654, 0.6804069, 0.4020744, 1, 1, 1, 1, 1,
0.939523, -1.375686, 1.452053, 1, 1, 1, 1, 1,
0.9412956, 0.2116914, 1.681639, 1, 1, 1, 1, 1,
0.9418474, -0.479817, 1.917937, 1, 1, 1, 1, 1,
0.9425792, -0.3212757, 3.331228, 1, 1, 1, 1, 1,
0.9436481, -1.423436, 1.785553, 1, 1, 1, 1, 1,
0.9461174, 2.232068, 1.424288, 1, 1, 1, 1, 1,
0.9483702, 0.5561032, 1.132513, 1, 1, 1, 1, 1,
0.9547834, 0.8245234, -1.899715, 1, 1, 1, 1, 1,
0.956213, -0.4720821, 0.8625129, 1, 1, 1, 1, 1,
0.9603335, -0.2258502, 2.020211, 1, 1, 1, 1, 1,
0.9611188, -1.397859, 1.110466, 1, 1, 1, 1, 1,
0.9649156, 0.3467285, 1.777546, 1, 1, 1, 1, 1,
0.965904, 2.200676, 0.6116818, 1, 1, 1, 1, 1,
0.9661493, 0.6595054, 3.816422, 1, 1, 1, 1, 1,
0.9676387, 1.385906, 1.254765, 0, 0, 1, 1, 1,
0.9731492, 0.717412, 1.845969, 1, 0, 0, 1, 1,
0.9764017, 0.8497774, 0.4329419, 1, 0, 0, 1, 1,
0.9782814, 0.6287764, 1.922775, 1, 0, 0, 1, 1,
0.981682, 0.5375837, 2.169948, 1, 0, 0, 1, 1,
0.9828433, -0.6159165, 2.490344, 1, 0, 0, 1, 1,
0.9861813, -0.1754309, 0.146, 0, 0, 0, 1, 1,
0.9905089, 0.2842948, 2.065221, 0, 0, 0, 1, 1,
0.9963731, -0.2145763, 2.165267, 0, 0, 0, 1, 1,
0.9965327, -1.135072, 2.010055, 0, 0, 0, 1, 1,
1.001674, -0.2142449, 1.407994, 0, 0, 0, 1, 1,
1.002324, 0.1081334, 2.742698, 0, 0, 0, 1, 1,
1.006349, -0.9615098, 1.548877, 0, 0, 0, 1, 1,
1.015317, 1.007986, 1.054998, 1, 1, 1, 1, 1,
1.016932, -0.5154463, 1.32433, 1, 1, 1, 1, 1,
1.017, 1.070928, 1.70706, 1, 1, 1, 1, 1,
1.033459, 0.08413704, 1.46385, 1, 1, 1, 1, 1,
1.034862, 0.6655967, 0.4210138, 1, 1, 1, 1, 1,
1.043548, 1.289417, -0.1857655, 1, 1, 1, 1, 1,
1.048029, -0.1089644, -0.2180834, 1, 1, 1, 1, 1,
1.048276, 1.743389, 0.3104978, 1, 1, 1, 1, 1,
1.049081, -0.5865679, 1.840882, 1, 1, 1, 1, 1,
1.05533, 1.959866, -0.1427509, 1, 1, 1, 1, 1,
1.074958, -0.129569, 3.508593, 1, 1, 1, 1, 1,
1.082038, 0.883385, 0.4928468, 1, 1, 1, 1, 1,
1.107591, -1.271585, 4.47589, 1, 1, 1, 1, 1,
1.109551, -0.5361237, 0.6160673, 1, 1, 1, 1, 1,
1.112907, 0.3548585, -0.3001682, 1, 1, 1, 1, 1,
1.118593, 0.2609501, 2.980923, 0, 0, 1, 1, 1,
1.134769, -0.2538654, 2.951938, 1, 0, 0, 1, 1,
1.135006, -1.776032, 2.996796, 1, 0, 0, 1, 1,
1.142078, 0.07477393, 1.461924, 1, 0, 0, 1, 1,
1.143148, 1.787099, 0.2128979, 1, 0, 0, 1, 1,
1.145659, 0.5931108, 0.9406912, 1, 0, 0, 1, 1,
1.147631, 1.683365, 0.2791806, 0, 0, 0, 1, 1,
1.148239, 0.548, 1.867572, 0, 0, 0, 1, 1,
1.154858, -1.109988, 2.338402, 0, 0, 0, 1, 1,
1.155926, 1.25634, 2.966105, 0, 0, 0, 1, 1,
1.167014, 0.2266764, 2.091778, 0, 0, 0, 1, 1,
1.184734, 0.0288696, 4.543362, 0, 0, 0, 1, 1,
1.18707, 0.8350956, 1.449369, 0, 0, 0, 1, 1,
1.188732, 0.7011056, 0.8409252, 1, 1, 1, 1, 1,
1.191956, 2.68096, 0.1639297, 1, 1, 1, 1, 1,
1.193587, 0.1878861, 1.60726, 1, 1, 1, 1, 1,
1.1964, -0.5217862, 0.4417813, 1, 1, 1, 1, 1,
1.200396, -0.9636036, 2.541255, 1, 1, 1, 1, 1,
1.204276, -0.6875452, 1.916074, 1, 1, 1, 1, 1,
1.208362, 0.01177796, -0.1020448, 1, 1, 1, 1, 1,
1.228407, -1.198323, 2.375307, 1, 1, 1, 1, 1,
1.232638, 0.08969404, 0.1479201, 1, 1, 1, 1, 1,
1.238703, -0.09361476, -0.8327575, 1, 1, 1, 1, 1,
1.241354, -0.6547651, 0.789914, 1, 1, 1, 1, 1,
1.247498, -1.135116, 1.572278, 1, 1, 1, 1, 1,
1.255537, -0.3665251, 1.324029, 1, 1, 1, 1, 1,
1.257457, -1.047779, 2.674591, 1, 1, 1, 1, 1,
1.270499, 1.345515, 0.8474523, 1, 1, 1, 1, 1,
1.277067, 0.09911593, 1.957212, 0, 0, 1, 1, 1,
1.279617, 1.087119, 0.272921, 1, 0, 0, 1, 1,
1.286946, -1.343878, 0.5323752, 1, 0, 0, 1, 1,
1.295092, -0.06727204, 1.462218, 1, 0, 0, 1, 1,
1.31511, 0.3543339, 0.9754105, 1, 0, 0, 1, 1,
1.320026, -1.263696, 1.801442, 1, 0, 0, 1, 1,
1.321419, 0.03342529, 1.096459, 0, 0, 0, 1, 1,
1.324886, -0.7047123, 1.777357, 0, 0, 0, 1, 1,
1.32556, 0.5012937, 2.720522, 0, 0, 0, 1, 1,
1.330988, -2.661745, 2.198079, 0, 0, 0, 1, 1,
1.336188, -0.1135746, 1.361598, 0, 0, 0, 1, 1,
1.337768, 1.38401, 0.8936501, 0, 0, 0, 1, 1,
1.343126, -0.813013, 1.38067, 0, 0, 0, 1, 1,
1.345354, -0.001706257, 2.22131, 1, 1, 1, 1, 1,
1.347453, 0.7487029, 1.39015, 1, 1, 1, 1, 1,
1.349462, -0.6498635, 2.308021, 1, 1, 1, 1, 1,
1.35662, 1.151756, 1.569584, 1, 1, 1, 1, 1,
1.357071, -0.1822208, 2.290121, 1, 1, 1, 1, 1,
1.35919, -2.439019, 1.881326, 1, 1, 1, 1, 1,
1.360184, 0.2235485, 0.7966468, 1, 1, 1, 1, 1,
1.365505, -0.9994773, 2.843472, 1, 1, 1, 1, 1,
1.366442, 0.09309107, 1.663045, 1, 1, 1, 1, 1,
1.376088, 0.1649704, 2.420809, 1, 1, 1, 1, 1,
1.377188, -0.07395452, 3.173869, 1, 1, 1, 1, 1,
1.38308, -0.6588319, 1.854953, 1, 1, 1, 1, 1,
1.388325, -0.8901895, 2.320881, 1, 1, 1, 1, 1,
1.391811, -1.753035, 1.497421, 1, 1, 1, 1, 1,
1.400613, -0.6505708, 1.12046, 1, 1, 1, 1, 1,
1.40136, 0.112856, 0.6510047, 0, 0, 1, 1, 1,
1.403664, 0.1603217, 1.362515, 1, 0, 0, 1, 1,
1.405097, -2.23525, 3.661592, 1, 0, 0, 1, 1,
1.406427, 0.5690338, 1.300282, 1, 0, 0, 1, 1,
1.410855, 0.1817155, 1.567003, 1, 0, 0, 1, 1,
1.424805, -1.64362, 2.508231, 1, 0, 0, 1, 1,
1.430266, 0.8426816, -1.247938, 0, 0, 0, 1, 1,
1.438195, 1.079594, -0.5119604, 0, 0, 0, 1, 1,
1.44152, 0.9842258, 0.5293545, 0, 0, 0, 1, 1,
1.448641, -0.4200999, 3.558296, 0, 0, 0, 1, 1,
1.471949, 0.8310778, 1.511761, 0, 0, 0, 1, 1,
1.483923, 1.50697, 0.4114647, 0, 0, 0, 1, 1,
1.508026, 1.018635, -0.7363355, 0, 0, 0, 1, 1,
1.508872, -0.4585406, 3.624966, 1, 1, 1, 1, 1,
1.509802, -1.429455, 3.073491, 1, 1, 1, 1, 1,
1.509947, 0.1148564, 3.654685, 1, 1, 1, 1, 1,
1.510195, 0.1784963, 0.8787791, 1, 1, 1, 1, 1,
1.513275, 0.8135803, 2.460185, 1, 1, 1, 1, 1,
1.518556, 1.956878, 0.4673281, 1, 1, 1, 1, 1,
1.542635, 1.136903, 1.233363, 1, 1, 1, 1, 1,
1.545361, -1.778269, 1.553077, 1, 1, 1, 1, 1,
1.548329, 0.3978986, 2.803706, 1, 1, 1, 1, 1,
1.549278, 0.5796549, 1.907861, 1, 1, 1, 1, 1,
1.560694, -0.5906823, 1.868645, 1, 1, 1, 1, 1,
1.57583, 1.100069, 0.3505031, 1, 1, 1, 1, 1,
1.609646, 0.2997001, 0.3399652, 1, 1, 1, 1, 1,
1.616615, 1.229503, 0.41065, 1, 1, 1, 1, 1,
1.624012, 0.01536815, 0.4629477, 1, 1, 1, 1, 1,
1.628745, -0.5568005, 0.9737685, 0, 0, 1, 1, 1,
1.643422, 0.5298856, 1.216958, 1, 0, 0, 1, 1,
1.661885, -2.595091, 2.811962, 1, 0, 0, 1, 1,
1.669082, 1.484404, -0.01193538, 1, 0, 0, 1, 1,
1.670795, 0.914471, -0.4488529, 1, 0, 0, 1, 1,
1.689178, -0.9925669, 3.53648, 1, 0, 0, 1, 1,
1.696169, 1.532976, -0.1877281, 0, 0, 0, 1, 1,
1.707376, 0.2570826, 0.7604654, 0, 0, 0, 1, 1,
1.708637, 0.4065619, 1.148255, 0, 0, 0, 1, 1,
1.72542, -1.329217, 2.405488, 0, 0, 0, 1, 1,
1.728231, 0.8430882, 1.756243, 0, 0, 0, 1, 1,
1.730382, -0.214226, 1.12818, 0, 0, 0, 1, 1,
1.733898, 1.478453, 2.552438, 0, 0, 0, 1, 1,
1.736352, -0.4727453, 1.163862, 1, 1, 1, 1, 1,
1.761717, -0.835815, -0.4360575, 1, 1, 1, 1, 1,
1.788165, -1.071195, 2.666916, 1, 1, 1, 1, 1,
1.789143, -0.7106768, 0.5750859, 1, 1, 1, 1, 1,
1.791778, 0.06208276, 3.380337, 1, 1, 1, 1, 1,
1.814734, 0.6731119, 2.20077, 1, 1, 1, 1, 1,
1.81995, 0.4294377, 1.411759, 1, 1, 1, 1, 1,
1.836963, -0.359567, 0.9484699, 1, 1, 1, 1, 1,
1.861008, 0.2479823, -0.1125793, 1, 1, 1, 1, 1,
1.86426, 2.420191, 2.611773, 1, 1, 1, 1, 1,
1.915897, -0.250131, 4.046169, 1, 1, 1, 1, 1,
1.919497, -0.8649507, 2.004307, 1, 1, 1, 1, 1,
1.955883, -0.4898435, 1.478159, 1, 1, 1, 1, 1,
1.99225, 1.244369, 1.982444, 1, 1, 1, 1, 1,
2.015137, -1.900006, 2.430033, 1, 1, 1, 1, 1,
2.017513, 0.2268879, 0.4415958, 0, 0, 1, 1, 1,
2.043673, 0.8660163, 1.363851, 1, 0, 0, 1, 1,
2.058471, 0.4963091, 0.723016, 1, 0, 0, 1, 1,
2.09846, -0.8135253, 2.748774, 1, 0, 0, 1, 1,
2.106125, -1.730064, 3.016826, 1, 0, 0, 1, 1,
2.114344, 0.5540797, 1.598188, 1, 0, 0, 1, 1,
2.153296, 0.1581009, 3.44077, 0, 0, 0, 1, 1,
2.201454, -0.5946448, 2.740666, 0, 0, 0, 1, 1,
2.211303, -1.948711, 2.729453, 0, 0, 0, 1, 1,
2.219372, 0.1577572, 1.30332, 0, 0, 0, 1, 1,
2.269671, 0.1360541, 1.353802, 0, 0, 0, 1, 1,
2.272246, 0.2636729, 1.902623, 0, 0, 0, 1, 1,
2.305017, -0.4177775, 2.54658, 0, 0, 0, 1, 1,
2.384988, -0.2395492, 0.7048811, 1, 1, 1, 1, 1,
2.403262, -1.992689, 2.738277, 1, 1, 1, 1, 1,
2.559239, -1.328778, 3.391282, 1, 1, 1, 1, 1,
2.677278, -0.8360681, 2.65324, 1, 1, 1, 1, 1,
2.727496, 0.8264723, 0.9233263, 1, 1, 1, 1, 1,
2.730575, 0.4918495, 1.628129, 1, 1, 1, 1, 1,
2.778276, -0.7378509, 1.263578, 1, 1, 1, 1, 1
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
var radius = 9.787808;
var distance = 34.37926;
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
mvMatrix.translate( 0.09770238, 0.1910336, -0.2931654 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37926);
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
