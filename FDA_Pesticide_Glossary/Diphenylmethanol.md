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
-3.045196, -0.5306215, -4.221306, 1, 0, 0, 1,
-2.945662, -0.8854504, -2.358879, 1, 0.007843138, 0, 1,
-2.642573, 0.9048326, -1.164612, 1, 0.01176471, 0, 1,
-2.586885, 1.094666, 0.8035673, 1, 0.01960784, 0, 1,
-2.574089, 2.484525, -2.097771, 1, 0.02352941, 0, 1,
-2.537616, -1.010935, -2.085973, 1, 0.03137255, 0, 1,
-2.439375, 1.180644, -0.2353868, 1, 0.03529412, 0, 1,
-2.375722, 0.9697805, -0.665526, 1, 0.04313726, 0, 1,
-2.267213, 0.3834338, -2.896151, 1, 0.04705882, 0, 1,
-2.228582, -0.385879, -1.929229, 1, 0.05490196, 0, 1,
-2.215398, 1.088233, -0.3976365, 1, 0.05882353, 0, 1,
-2.214908, -0.7463012, -2.887491, 1, 0.06666667, 0, 1,
-2.209609, -0.7662585, -3.232949, 1, 0.07058824, 0, 1,
-2.185269, -0.2995731, -2.468451, 1, 0.07843138, 0, 1,
-2.171528, -0.6851003, -2.144958, 1, 0.08235294, 0, 1,
-2.147338, 1.125497, 0.1282832, 1, 0.09019608, 0, 1,
-1.937846, 0.3638496, -1.994399, 1, 0.09411765, 0, 1,
-1.933402, -0.5366589, 0.3374617, 1, 0.1019608, 0, 1,
-1.889253, 0.7160491, -1.583248, 1, 0.1098039, 0, 1,
-1.829287, 0.5976748, -0.9456774, 1, 0.1137255, 0, 1,
-1.816881, 0.05960023, -2.217367, 1, 0.1215686, 0, 1,
-1.815549, -0.9595635, -0.8078302, 1, 0.1254902, 0, 1,
-1.771973, -0.07005309, -4.072989, 1, 0.1333333, 0, 1,
-1.74452, -0.3003969, -1.122855, 1, 0.1372549, 0, 1,
-1.744239, -1.868063, -3.81443, 1, 0.145098, 0, 1,
-1.739846, -1.034933, -0.8751552, 1, 0.1490196, 0, 1,
-1.736382, -0.6106707, -1.435541, 1, 0.1568628, 0, 1,
-1.721159, -3.047378, -2.977658, 1, 0.1607843, 0, 1,
-1.720527, -0.1609809, 0.2127978, 1, 0.1686275, 0, 1,
-1.715024, -1.769561, -0.4911506, 1, 0.172549, 0, 1,
-1.714471, -0.6733761, -1.211862, 1, 0.1803922, 0, 1,
-1.713339, -0.3399225, -2.9697, 1, 0.1843137, 0, 1,
-1.68562, 0.01596933, -0.9050105, 1, 0.1921569, 0, 1,
-1.683216, 2.105407, -1.353999, 1, 0.1960784, 0, 1,
-1.681832, -0.9120243, -0.9142744, 1, 0.2039216, 0, 1,
-1.676585, 0.9449479, -2.043505, 1, 0.2117647, 0, 1,
-1.668812, -0.9719636, -0.6882023, 1, 0.2156863, 0, 1,
-1.668773, -0.8310667, -2.70424, 1, 0.2235294, 0, 1,
-1.664679, -0.5985681, -1.131091, 1, 0.227451, 0, 1,
-1.651037, -0.5637155, -2.438152, 1, 0.2352941, 0, 1,
-1.644859, 0.6157489, -1.503142, 1, 0.2392157, 0, 1,
-1.643536, 0.4438773, -1.314258, 1, 0.2470588, 0, 1,
-1.633736, -0.3447708, 0.6988937, 1, 0.2509804, 0, 1,
-1.632354, 0.6803246, -0.503709, 1, 0.2588235, 0, 1,
-1.62987, -0.908094, -4.487654, 1, 0.2627451, 0, 1,
-1.628939, -0.1122823, -0.3576336, 1, 0.2705882, 0, 1,
-1.607545, -1.162491, -2.778641, 1, 0.2745098, 0, 1,
-1.60684, -1.108177, -2.150215, 1, 0.282353, 0, 1,
-1.596951, 1.30968, -3.11915, 1, 0.2862745, 0, 1,
-1.595502, -0.2433646, -1.113311, 1, 0.2941177, 0, 1,
-1.592513, -0.9194617, -1.573436, 1, 0.3019608, 0, 1,
-1.585497, -0.02220451, 0.5583355, 1, 0.3058824, 0, 1,
-1.56899, -0.3134492, -3.121794, 1, 0.3137255, 0, 1,
-1.567362, 0.6175171, -0.3978743, 1, 0.3176471, 0, 1,
-1.565798, -0.6146214, -1.641214, 1, 0.3254902, 0, 1,
-1.55767, 0.2185262, -1.102258, 1, 0.3294118, 0, 1,
-1.553836, -0.6770471, -3.643838, 1, 0.3372549, 0, 1,
-1.551129, -0.3830443, -2.077701, 1, 0.3411765, 0, 1,
-1.540522, -1.086857, -0.1628123, 1, 0.3490196, 0, 1,
-1.538624, 0.4739504, -1.966018, 1, 0.3529412, 0, 1,
-1.529171, -0.5282631, -0.7382768, 1, 0.3607843, 0, 1,
-1.51527, 0.6213045, 1.608305, 1, 0.3647059, 0, 1,
-1.510312, -0.5356659, -0.5936124, 1, 0.372549, 0, 1,
-1.492005, -0.2431862, -0.4640991, 1, 0.3764706, 0, 1,
-1.482104, 1.947067, -2.070248, 1, 0.3843137, 0, 1,
-1.464833, -1.183683, -0.3586241, 1, 0.3882353, 0, 1,
-1.45491, -0.8725008, -1.549889, 1, 0.3960784, 0, 1,
-1.44259, -0.6736367, -2.884809, 1, 0.4039216, 0, 1,
-1.43149, 0.9103297, -0.5910434, 1, 0.4078431, 0, 1,
-1.421263, 0.7494886, -1.857614, 1, 0.4156863, 0, 1,
-1.420892, -0.2689755, -3.980564, 1, 0.4196078, 0, 1,
-1.417389, 2.154688, -0.7558095, 1, 0.427451, 0, 1,
-1.40861, -0.2463623, 0.8362268, 1, 0.4313726, 0, 1,
-1.408565, -0.9888178, -1.924904, 1, 0.4392157, 0, 1,
-1.403125, 0.8802428, -0.4152331, 1, 0.4431373, 0, 1,
-1.389826, 0.2463792, 0.2420948, 1, 0.4509804, 0, 1,
-1.388878, -2.200496, -4.04383, 1, 0.454902, 0, 1,
-1.3862, -1.266644, -2.674522, 1, 0.4627451, 0, 1,
-1.365868, 1.311545, -1.299902, 1, 0.4666667, 0, 1,
-1.349753, 0.656275, -0.242237, 1, 0.4745098, 0, 1,
-1.337337, 0.5980161, -1.731691, 1, 0.4784314, 0, 1,
-1.334551, -0.3512364, -2.557023, 1, 0.4862745, 0, 1,
-1.330349, 0.8082991, -1.259022, 1, 0.4901961, 0, 1,
-1.328503, -0.3380755, -1.96585, 1, 0.4980392, 0, 1,
-1.299727, -0.4839742, -0.6009341, 1, 0.5058824, 0, 1,
-1.299067, -1.304852, -1.397566, 1, 0.509804, 0, 1,
-1.296739, 1.781159, -0.7472938, 1, 0.5176471, 0, 1,
-1.289393, 1.30522, 1.138386, 1, 0.5215687, 0, 1,
-1.28923, 0.4868713, -1.23344, 1, 0.5294118, 0, 1,
-1.286798, 1.32625, -0.9428496, 1, 0.5333334, 0, 1,
-1.284049, 0.3397136, -0.7091843, 1, 0.5411765, 0, 1,
-1.279879, -1.880182, -2.361097, 1, 0.5450981, 0, 1,
-1.275633, 1.420222, -0.689241, 1, 0.5529412, 0, 1,
-1.271828, -1.136895, -1.511089, 1, 0.5568628, 0, 1,
-1.255675, -0.1744434, -1.478812, 1, 0.5647059, 0, 1,
-1.24104, 1.5961, 0.4611922, 1, 0.5686275, 0, 1,
-1.240594, -0.8687441, -3.833336, 1, 0.5764706, 0, 1,
-1.234763, 0.4642747, 0.6674647, 1, 0.5803922, 0, 1,
-1.222422, 1.813613, -1.664194, 1, 0.5882353, 0, 1,
-1.220996, 0.05652134, -1.714258, 1, 0.5921569, 0, 1,
-1.210395, 1.167027, 0.5791345, 1, 0.6, 0, 1,
-1.208701, -0.8734434, -3.202874, 1, 0.6078432, 0, 1,
-1.206469, 0.2319527, -0.06444848, 1, 0.6117647, 0, 1,
-1.200823, -1.215019, -2.551149, 1, 0.6196079, 0, 1,
-1.19943, 1.456314, -1.879817, 1, 0.6235294, 0, 1,
-1.196701, -0.2143463, -1.47825, 1, 0.6313726, 0, 1,
-1.193217, 0.4624563, 0.9980346, 1, 0.6352941, 0, 1,
-1.18229, -0.8318549, -1.111068, 1, 0.6431373, 0, 1,
-1.18202, 0.05422666, -2.755203, 1, 0.6470588, 0, 1,
-1.175469, -0.5743626, -0.3897272, 1, 0.654902, 0, 1,
-1.174109, 0.4794157, -1.603389, 1, 0.6588235, 0, 1,
-1.173444, 0.5205478, -0.8029265, 1, 0.6666667, 0, 1,
-1.171677, -0.5608267, -0.8039891, 1, 0.6705883, 0, 1,
-1.163671, 1.089123, -0.7323446, 1, 0.6784314, 0, 1,
-1.16096, 1.499434, -1.261675, 1, 0.682353, 0, 1,
-1.158291, 0.2506466, -2.002689, 1, 0.6901961, 0, 1,
-1.153509, 0.258423, -2.038837, 1, 0.6941177, 0, 1,
-1.143146, 0.3374513, -1.129716, 1, 0.7019608, 0, 1,
-1.142946, 0.2262653, -0.4169298, 1, 0.7098039, 0, 1,
-1.1419, 2.020079, -0.7706988, 1, 0.7137255, 0, 1,
-1.140702, -1.087736, -3.18109, 1, 0.7215686, 0, 1,
-1.137262, -0.1304144, -3.434272, 1, 0.7254902, 0, 1,
-1.132095, -1.206601, -2.049967, 1, 0.7333333, 0, 1,
-1.129699, -0.563427, -2.640846, 1, 0.7372549, 0, 1,
-1.121951, -0.1293542, -1.999517, 1, 0.7450981, 0, 1,
-1.121586, 0.7174009, -2.084039, 1, 0.7490196, 0, 1,
-1.117573, -0.1042738, -1.58378, 1, 0.7568628, 0, 1,
-1.115107, -0.1531935, -3.78691, 1, 0.7607843, 0, 1,
-1.111219, -0.4843752, -3.460693, 1, 0.7686275, 0, 1,
-1.107875, -0.02552412, -3.584771, 1, 0.772549, 0, 1,
-1.102355, 0.6675844, -1.424095, 1, 0.7803922, 0, 1,
-1.100286, -1.069976, -2.042769, 1, 0.7843137, 0, 1,
-1.090844, 0.2234282, -1.261424, 1, 0.7921569, 0, 1,
-1.090703, -0.4919398, -0.2960266, 1, 0.7960784, 0, 1,
-1.090309, -0.5308912, -0.5328432, 1, 0.8039216, 0, 1,
-1.087763, 1.349657, -0.357875, 1, 0.8117647, 0, 1,
-1.086766, -0.2962314, -4.860572, 1, 0.8156863, 0, 1,
-1.084929, 2.258661, -1.709754, 1, 0.8235294, 0, 1,
-1.084189, -0.4244142, -2.714035, 1, 0.827451, 0, 1,
-1.082726, 1.094915, -2.280861, 1, 0.8352941, 0, 1,
-1.073969, -0.4111669, -1.758567, 1, 0.8392157, 0, 1,
-1.071156, 1.969173, -1.008626, 1, 0.8470588, 0, 1,
-1.067157, -0.2788148, -3.006966, 1, 0.8509804, 0, 1,
-1.061364, 0.459605, -3.191642, 1, 0.8588235, 0, 1,
-1.058684, 0.30908, -1.228944, 1, 0.8627451, 0, 1,
-1.056766, 0.9378514, -1.204949, 1, 0.8705882, 0, 1,
-1.054056, -0.34232, -1.816016, 1, 0.8745098, 0, 1,
-1.049773, -1.723565, -0.9064291, 1, 0.8823529, 0, 1,
-1.048227, -1.958568, -2.385597, 1, 0.8862745, 0, 1,
-1.035068, -0.2082002, -3.494639, 1, 0.8941177, 0, 1,
-1.030822, 0.5089743, -0.03905224, 1, 0.8980392, 0, 1,
-1.024339, 0.3701824, 0.02657507, 1, 0.9058824, 0, 1,
-1.01831, 1.136822, -1.797405, 1, 0.9137255, 0, 1,
-1.015815, 0.6929531, -0.7915968, 1, 0.9176471, 0, 1,
-1.00928, 2.502461, 1.602409, 1, 0.9254902, 0, 1,
-1.00813, 0.8043911, -0.7917152, 1, 0.9294118, 0, 1,
-1.00706, 0.1428903, -1.295676, 1, 0.9372549, 0, 1,
-1.003543, 0.6140632, 0.6786054, 1, 0.9411765, 0, 1,
-1.003489, -0.7363292, -1.214688, 1, 0.9490196, 0, 1,
-1.003478, 1.122464, -0.780359, 1, 0.9529412, 0, 1,
-1.001263, -1.615038, -2.864709, 1, 0.9607843, 0, 1,
-1.000824, 1.580635, 0.6782143, 1, 0.9647059, 0, 1,
-0.9984968, -0.9833355, -3.266339, 1, 0.972549, 0, 1,
-0.9984562, 0.6497291, -1.150595, 1, 0.9764706, 0, 1,
-0.9984466, -0.6344444, -1.543062, 1, 0.9843137, 0, 1,
-0.9975574, 1.784481, 1.166666, 1, 0.9882353, 0, 1,
-0.9956645, -0.5709823, -2.681491, 1, 0.9960784, 0, 1,
-0.9937829, 0.9232442, 0.2214111, 0.9960784, 1, 0, 1,
-0.9879215, 0.6529229, -1.356113, 0.9921569, 1, 0, 1,
-0.9836657, -0.1688118, -2.164718, 0.9843137, 1, 0, 1,
-0.9810514, -0.04290077, -0.9562649, 0.9803922, 1, 0, 1,
-0.977243, -0.4386978, -0.9024578, 0.972549, 1, 0, 1,
-0.9772047, 0.01560564, -1.782722, 0.9686275, 1, 0, 1,
-0.9695621, 1.533734, -1.977411, 0.9607843, 1, 0, 1,
-0.9689699, -1.413028, -3.036874, 0.9568627, 1, 0, 1,
-0.964977, 1.150485, 1.320287, 0.9490196, 1, 0, 1,
-0.9595206, 0.6562318, -1.202336, 0.945098, 1, 0, 1,
-0.9592531, 1.440669, -2.273844, 0.9372549, 1, 0, 1,
-0.9568914, 0.07930038, -0.8536705, 0.9333333, 1, 0, 1,
-0.9560612, -1.910312, -3.179893, 0.9254902, 1, 0, 1,
-0.949771, -2.651654, -4.09865, 0.9215686, 1, 0, 1,
-0.9454222, 0.3553204, -1.967734, 0.9137255, 1, 0, 1,
-0.9382778, 0.9576768, -2.020139, 0.9098039, 1, 0, 1,
-0.9316501, 0.01384486, -0.02779133, 0.9019608, 1, 0, 1,
-0.9255977, -1.074917, -1.335916, 0.8941177, 1, 0, 1,
-0.9198958, 0.4915985, -1.552168, 0.8901961, 1, 0, 1,
-0.9122423, -0.6187292, -1.280577, 0.8823529, 1, 0, 1,
-0.9073361, -0.7386278, -3.879243, 0.8784314, 1, 0, 1,
-0.9060802, -0.8249167, -2.651409, 0.8705882, 1, 0, 1,
-0.9035091, -0.4530461, -0.8488197, 0.8666667, 1, 0, 1,
-0.9031778, -0.04660796, -1.19002, 0.8588235, 1, 0, 1,
-0.9024507, -0.4416781, -2.832748, 0.854902, 1, 0, 1,
-0.901853, -1.439503, -2.988084, 0.8470588, 1, 0, 1,
-0.89457, -1.042035, -2.41602, 0.8431373, 1, 0, 1,
-0.8930799, 0.07587859, -1.344813, 0.8352941, 1, 0, 1,
-0.8924725, 0.6407409, -3.050025, 0.8313726, 1, 0, 1,
-0.8917167, -1.127152, -1.775143, 0.8235294, 1, 0, 1,
-0.8878562, 0.8812479, -2.225469, 0.8196079, 1, 0, 1,
-0.8870882, 0.587928, -0.7050556, 0.8117647, 1, 0, 1,
-0.8855206, -0.538752, -1.926924, 0.8078431, 1, 0, 1,
-0.8839649, -1.051711, -2.047982, 0.8, 1, 0, 1,
-0.8834187, 0.6880485, -0.07239322, 0.7921569, 1, 0, 1,
-0.8829592, -0.8408151, -1.428449, 0.7882353, 1, 0, 1,
-0.880379, 0.3722413, 0.2012484, 0.7803922, 1, 0, 1,
-0.877929, -0.8960143, -4.422394, 0.7764706, 1, 0, 1,
-0.8721325, 0.8475823, -0.6713858, 0.7686275, 1, 0, 1,
-0.8700001, -0.919034, -0.2893669, 0.7647059, 1, 0, 1,
-0.8594741, -0.2644558, -2.25039, 0.7568628, 1, 0, 1,
-0.8527687, -0.3272503, -1.331985, 0.7529412, 1, 0, 1,
-0.8503262, -1.251148, -2.345279, 0.7450981, 1, 0, 1,
-0.8483163, 0.2716964, -0.471586, 0.7411765, 1, 0, 1,
-0.8424982, -0.3795705, -2.228985, 0.7333333, 1, 0, 1,
-0.8399178, 0.701817, -0.5378075, 0.7294118, 1, 0, 1,
-0.8372, 0.6577766, -2.243304, 0.7215686, 1, 0, 1,
-0.8314345, -1.646503, -1.882563, 0.7176471, 1, 0, 1,
-0.8306565, -1.306659, -0.7115701, 0.7098039, 1, 0, 1,
-0.827761, 1.516736, 1.225175, 0.7058824, 1, 0, 1,
-0.8242537, -0.2495209, -1.48573, 0.6980392, 1, 0, 1,
-0.8138319, 0.6701192, -0.9276571, 0.6901961, 1, 0, 1,
-0.80138, 0.1535547, -1.036723, 0.6862745, 1, 0, 1,
-0.8004593, -1.981363, -1.988563, 0.6784314, 1, 0, 1,
-0.7917409, -0.7420969, -0.3190993, 0.6745098, 1, 0, 1,
-0.7877923, 0.3758031, -2.013968, 0.6666667, 1, 0, 1,
-0.7868077, 1.485045, -0.4413066, 0.6627451, 1, 0, 1,
-0.7806922, 0.3419835, -0.4824943, 0.654902, 1, 0, 1,
-0.778869, 0.01263439, -1.685051, 0.6509804, 1, 0, 1,
-0.7762692, -0.7238846, -2.253637, 0.6431373, 1, 0, 1,
-0.7706346, -0.02604337, -1.700339, 0.6392157, 1, 0, 1,
-0.7625326, 0.05527911, -1.326809, 0.6313726, 1, 0, 1,
-0.7621626, 0.101726, -1.032964, 0.627451, 1, 0, 1,
-0.7618315, -0.5127008, -2.699627, 0.6196079, 1, 0, 1,
-0.7616044, -1.748665, -1.498069, 0.6156863, 1, 0, 1,
-0.761577, 0.5363823, -1.446935, 0.6078432, 1, 0, 1,
-0.7585815, 0.08443598, -3.596534, 0.6039216, 1, 0, 1,
-0.7585748, 0.3750514, -0.1521633, 0.5960785, 1, 0, 1,
-0.7583686, -0.304681, -2.845775, 0.5882353, 1, 0, 1,
-0.7549146, 0.1091346, -1.139606, 0.5843138, 1, 0, 1,
-0.754577, -0.3003167, -1.545755, 0.5764706, 1, 0, 1,
-0.7502052, -2.464537, -1.987409, 0.572549, 1, 0, 1,
-0.7438923, -0.5769754, -0.5000466, 0.5647059, 1, 0, 1,
-0.7392368, 1.121413, -2.143419, 0.5607843, 1, 0, 1,
-0.7377456, -1.559523, -2.72807, 0.5529412, 1, 0, 1,
-0.7372002, -0.1309401, -2.547651, 0.5490196, 1, 0, 1,
-0.7358243, 0.3555105, -1.511373, 0.5411765, 1, 0, 1,
-0.7337925, 0.5560811, 1.19966, 0.5372549, 1, 0, 1,
-0.7305027, -0.1076296, -0.6308634, 0.5294118, 1, 0, 1,
-0.726265, -0.3288004, -1.976988, 0.5254902, 1, 0, 1,
-0.7206572, -0.5867048, -0.7971334, 0.5176471, 1, 0, 1,
-0.7184513, 1.090968, -0.7323868, 0.5137255, 1, 0, 1,
-0.7121436, 0.7817621, -2.177593, 0.5058824, 1, 0, 1,
-0.7094945, -0.8620045, -0.5354577, 0.5019608, 1, 0, 1,
-0.7093082, 0.5267263, -0.853287, 0.4941176, 1, 0, 1,
-0.7088106, 0.5591761, -1.701804, 0.4862745, 1, 0, 1,
-0.7081979, 1.061083, -1.269247, 0.4823529, 1, 0, 1,
-0.7031839, -0.7035992, -1.823954, 0.4745098, 1, 0, 1,
-0.7026853, -1.144135, -2.245597, 0.4705882, 1, 0, 1,
-0.7018652, -0.6277359, -2.431218, 0.4627451, 1, 0, 1,
-0.6998717, 0.3353986, -1.193779, 0.4588235, 1, 0, 1,
-0.6934236, 0.8317884, 0.610747, 0.4509804, 1, 0, 1,
-0.6792437, -0.9983573, -3.693985, 0.4470588, 1, 0, 1,
-0.6730245, 1.153718, -0.001362058, 0.4392157, 1, 0, 1,
-0.6729556, 0.03541899, -2.072929, 0.4352941, 1, 0, 1,
-0.6686777, 1.568934, -1.352643, 0.427451, 1, 0, 1,
-0.6678286, 0.6143667, -2.262907, 0.4235294, 1, 0, 1,
-0.666786, 0.6729038, -0.04208199, 0.4156863, 1, 0, 1,
-0.6639648, 0.3695033, -1.691975, 0.4117647, 1, 0, 1,
-0.6635987, 1.055825, -1.1512, 0.4039216, 1, 0, 1,
-0.6633828, 1.288765, -1.577394, 0.3960784, 1, 0, 1,
-0.660216, 0.925206, 0.6785458, 0.3921569, 1, 0, 1,
-0.6588631, -0.2824516, -1.356008, 0.3843137, 1, 0, 1,
-0.6577479, -0.3640911, -2.733835, 0.3803922, 1, 0, 1,
-0.6550477, -1.251761, -2.338336, 0.372549, 1, 0, 1,
-0.6532682, -0.670746, -2.729163, 0.3686275, 1, 0, 1,
-0.6505763, -0.2572448, -1.645742, 0.3607843, 1, 0, 1,
-0.6500203, -0.5021853, -2.562127, 0.3568628, 1, 0, 1,
-0.6487581, 0.5101044, -1.213965, 0.3490196, 1, 0, 1,
-0.6486623, 0.104261, 0.2382102, 0.345098, 1, 0, 1,
-0.643365, -0.3327779, -2.784909, 0.3372549, 1, 0, 1,
-0.6341808, -0.2455638, -1.811297, 0.3333333, 1, 0, 1,
-0.6321444, -0.6454805, -3.385782, 0.3254902, 1, 0, 1,
-0.6319395, -1.744855, -3.951239, 0.3215686, 1, 0, 1,
-0.629523, 0.02708917, -1.016052, 0.3137255, 1, 0, 1,
-0.6283526, -1.353199, -1.799126, 0.3098039, 1, 0, 1,
-0.6282943, -0.3973314, -2.758424, 0.3019608, 1, 0, 1,
-0.6267364, -1.324766, -1.965028, 0.2941177, 1, 0, 1,
-0.6226028, 1.460803, -0.346563, 0.2901961, 1, 0, 1,
-0.6207188, 0.9581873, -0.007954934, 0.282353, 1, 0, 1,
-0.6168276, 1.195568, -0.629891, 0.2784314, 1, 0, 1,
-0.6159903, -1.803266, -5.714288, 0.2705882, 1, 0, 1,
-0.6126209, -0.517131, -2.023768, 0.2666667, 1, 0, 1,
-0.6108009, 0.03887277, -1.985048, 0.2588235, 1, 0, 1,
-0.6033505, 0.4171238, -0.3094472, 0.254902, 1, 0, 1,
-0.6013405, -0.02040508, 0.2854647, 0.2470588, 1, 0, 1,
-0.5922914, -1.276603, -4.142195, 0.2431373, 1, 0, 1,
-0.5920126, 0.9713799, 0.4392372, 0.2352941, 1, 0, 1,
-0.5913294, 0.3831427, -0.04567571, 0.2313726, 1, 0, 1,
-0.5912138, -1.162003, -3.645252, 0.2235294, 1, 0, 1,
-0.5873289, -1.305261, -1.727192, 0.2196078, 1, 0, 1,
-0.5871527, -1.32991, -3.40045, 0.2117647, 1, 0, 1,
-0.5776598, 0.2319811, -1.783952, 0.2078431, 1, 0, 1,
-0.5768116, -0.2067629, -0.5267283, 0.2, 1, 0, 1,
-0.5710998, -0.3593422, -2.704548, 0.1921569, 1, 0, 1,
-0.5648025, -0.6096996, -2.468231, 0.1882353, 1, 0, 1,
-0.5634273, 0.2073274, -1.080997, 0.1803922, 1, 0, 1,
-0.5615001, -1.158205, -1.299659, 0.1764706, 1, 0, 1,
-0.5599477, 0.2612772, -0.2457532, 0.1686275, 1, 0, 1,
-0.5549994, -0.8135113, -2.414888, 0.1647059, 1, 0, 1,
-0.5539362, 0.8390611, 1.005769, 0.1568628, 1, 0, 1,
-0.5509375, 0.1243021, -1.483853, 0.1529412, 1, 0, 1,
-0.5475757, 0.8853117, 0.8185374, 0.145098, 1, 0, 1,
-0.543322, 1.703066, -1.293477, 0.1411765, 1, 0, 1,
-0.5432616, -1.040293, -2.779581, 0.1333333, 1, 0, 1,
-0.5426141, -2.149095, -0.9219905, 0.1294118, 1, 0, 1,
-0.539058, 0.2037718, 1.318877, 0.1215686, 1, 0, 1,
-0.536466, -2.646618, -2.970149, 0.1176471, 1, 0, 1,
-0.5362716, -1.024711, -3.973831, 0.1098039, 1, 0, 1,
-0.5258845, 0.800302, -0.9084593, 0.1058824, 1, 0, 1,
-0.5214189, 0.51219, -1.764376, 0.09803922, 1, 0, 1,
-0.5202268, 0.7204311, 0.5293754, 0.09019608, 1, 0, 1,
-0.5155162, 1.904782, -1.460559, 0.08627451, 1, 0, 1,
-0.5101732, -0.8267701, -1.521443, 0.07843138, 1, 0, 1,
-0.5082121, -0.3401186, -0.3655225, 0.07450981, 1, 0, 1,
-0.503486, -0.3491706, -2.423613, 0.06666667, 1, 0, 1,
-0.5026606, -1.050237, -4.301819, 0.0627451, 1, 0, 1,
-0.4999446, 2.108822, 0.05478364, 0.05490196, 1, 0, 1,
-0.4940411, -0.3360705, 0.09902129, 0.05098039, 1, 0, 1,
-0.4910192, -0.8832597, -3.595838, 0.04313726, 1, 0, 1,
-0.4842051, -0.9143173, -2.875372, 0.03921569, 1, 0, 1,
-0.47697, -1.999361, -4.916935, 0.03137255, 1, 0, 1,
-0.4760684, 1.18426, -1.0959, 0.02745098, 1, 0, 1,
-0.4689443, -0.1493392, -2.266798, 0.01960784, 1, 0, 1,
-0.4657799, 1.07544, -0.842989, 0.01568628, 1, 0, 1,
-0.4637875, 1.777701, -0.3038189, 0.007843138, 1, 0, 1,
-0.4607641, -1.310224, -3.011992, 0.003921569, 1, 0, 1,
-0.4599281, -0.2060747, -0.9087317, 0, 1, 0.003921569, 1,
-0.4598385, -0.9759362, -4.223522, 0, 1, 0.01176471, 1,
-0.4596099, 1.354641, -1.451846, 0, 1, 0.01568628, 1,
-0.4514706, 1.557777, 0.5338609, 0, 1, 0.02352941, 1,
-0.4450725, 0.4103376, -0.1810175, 0, 1, 0.02745098, 1,
-0.4435955, -0.7814586, -2.694538, 0, 1, 0.03529412, 1,
-0.441629, -0.7384455, -3.258195, 0, 1, 0.03921569, 1,
-0.4395143, -0.7155992, -2.818985, 0, 1, 0.04705882, 1,
-0.4392597, 1.978574, 1.606754, 0, 1, 0.05098039, 1,
-0.4376753, -0.2581597, -2.406687, 0, 1, 0.05882353, 1,
-0.4343456, -1.03384, -3.296452, 0, 1, 0.0627451, 1,
-0.4343153, -0.6421442, -3.14894, 0, 1, 0.07058824, 1,
-0.430625, 0.06533388, -2.483474, 0, 1, 0.07450981, 1,
-0.428159, -0.505814, -4.259294, 0, 1, 0.08235294, 1,
-0.4278847, 0.05919032, -1.426572, 0, 1, 0.08627451, 1,
-0.4264016, 0.5885339, -2.331458, 0, 1, 0.09411765, 1,
-0.4211216, 0.6231253, -1.365853, 0, 1, 0.1019608, 1,
-0.4201719, -1.608012, -2.121463, 0, 1, 0.1058824, 1,
-0.4190154, -0.7453691, -1.252578, 0, 1, 0.1137255, 1,
-0.4183311, -1.190151, -2.913908, 0, 1, 0.1176471, 1,
-0.41716, -0.09076881, -1.426325, 0, 1, 0.1254902, 1,
-0.4139086, 1.431135, 0.4419417, 0, 1, 0.1294118, 1,
-0.4125727, 0.508617, -1.994151, 0, 1, 0.1372549, 1,
-0.4119999, -0.3637898, -1.489004, 0, 1, 0.1411765, 1,
-0.4078808, -0.017748, -0.3715151, 0, 1, 0.1490196, 1,
-0.4061621, 0.1896155, -0.6022606, 0, 1, 0.1529412, 1,
-0.4040219, 1.351521, 0.05972778, 0, 1, 0.1607843, 1,
-0.4002184, -0.1183696, -3.420486, 0, 1, 0.1647059, 1,
-0.399707, 1.099229, -0.9794686, 0, 1, 0.172549, 1,
-0.3972083, 1.150711, 0.08022872, 0, 1, 0.1764706, 1,
-0.3948897, -0.9799721, -3.777503, 0, 1, 0.1843137, 1,
-0.3942887, -1.288989, -1.990973, 0, 1, 0.1882353, 1,
-0.3903731, 2.171955, 1.843011, 0, 1, 0.1960784, 1,
-0.3879573, 0.8051689, -0.2076364, 0, 1, 0.2039216, 1,
-0.3872696, 0.4486686, -0.4396205, 0, 1, 0.2078431, 1,
-0.3852916, -1.319007, -3.73283, 0, 1, 0.2156863, 1,
-0.3850576, -0.826188, -1.31626, 0, 1, 0.2196078, 1,
-0.3794799, -1.057248, -1.623601, 0, 1, 0.227451, 1,
-0.3754238, 2.103739, -0.009661281, 0, 1, 0.2313726, 1,
-0.372051, -1.448928, -4.936229, 0, 1, 0.2392157, 1,
-0.3690699, -0.7805437, -3.369489, 0, 1, 0.2431373, 1,
-0.3598939, -0.869292, -3.162483, 0, 1, 0.2509804, 1,
-0.3526134, 0.2334605, -2.916311, 0, 1, 0.254902, 1,
-0.3501687, -0.998133, -2.088194, 0, 1, 0.2627451, 1,
-0.3487472, -0.9917031, -3.978205, 0, 1, 0.2666667, 1,
-0.3473071, -1.810505, -3.772918, 0, 1, 0.2745098, 1,
-0.3410647, 0.2153421, -1.503258, 0, 1, 0.2784314, 1,
-0.3373725, 0.6084106, -2.697708, 0, 1, 0.2862745, 1,
-0.3319351, -0.8092182, -3.083838, 0, 1, 0.2901961, 1,
-0.3284306, 0.5588881, -1.377779, 0, 1, 0.2980392, 1,
-0.3274156, -0.7992561, -3.747989, 0, 1, 0.3058824, 1,
-0.32479, -0.771852, -2.954747, 0, 1, 0.3098039, 1,
-0.3246402, -1.847211, -1.339466, 0, 1, 0.3176471, 1,
-0.3199029, -1.348458, -4.495388, 0, 1, 0.3215686, 1,
-0.3159032, 0.1980174, 0.3630942, 0, 1, 0.3294118, 1,
-0.3152749, 1.073096, 0.8675154, 0, 1, 0.3333333, 1,
-0.3130744, -0.1025366, -0.5448858, 0, 1, 0.3411765, 1,
-0.3115498, 0.5106283, -0.1413299, 0, 1, 0.345098, 1,
-0.311469, -0.4241877, -2.012393, 0, 1, 0.3529412, 1,
-0.3063603, 0.6189311, 0.01653044, 0, 1, 0.3568628, 1,
-0.3058681, -1.362743, -2.961937, 0, 1, 0.3647059, 1,
-0.3038243, 1.019064, 1.183416, 0, 1, 0.3686275, 1,
-0.2991525, -0.5930914, -1.980669, 0, 1, 0.3764706, 1,
-0.2981565, -0.5513504, -4.155536, 0, 1, 0.3803922, 1,
-0.2972696, -0.8247864, -3.496217, 0, 1, 0.3882353, 1,
-0.2940719, -1.779888, -5.005397, 0, 1, 0.3921569, 1,
-0.29281, -0.4157464, -4.858331, 0, 1, 0.4, 1,
-0.2920419, 0.2827054, -1.289145, 0, 1, 0.4078431, 1,
-0.2894399, 0.08286154, -1.414024, 0, 1, 0.4117647, 1,
-0.2862576, 0.114428, 1.048115, 0, 1, 0.4196078, 1,
-0.2853921, 0.6284513, 0.4109499, 0, 1, 0.4235294, 1,
-0.2846723, -1.172975, -3.716733, 0, 1, 0.4313726, 1,
-0.2819477, -0.4432314, -4.193854, 0, 1, 0.4352941, 1,
-0.2750123, 0.05718929, -0.4419345, 0, 1, 0.4431373, 1,
-0.2732812, -0.2976141, -2.371782, 0, 1, 0.4470588, 1,
-0.2679167, 0.9126493, -0.7767442, 0, 1, 0.454902, 1,
-0.266651, -1.7499, -1.900645, 0, 1, 0.4588235, 1,
-0.2640216, -0.7068055, -2.63799, 0, 1, 0.4666667, 1,
-0.2610246, -0.3316874, -2.696525, 0, 1, 0.4705882, 1,
-0.2600642, -1.519492, -4.38613, 0, 1, 0.4784314, 1,
-0.2581207, 0.946821, -1.371918, 0, 1, 0.4823529, 1,
-0.2578724, 0.7394959, -0.7909899, 0, 1, 0.4901961, 1,
-0.2548411, 0.6279432, -0.01739259, 0, 1, 0.4941176, 1,
-0.2540403, -0.7271297, -2.121484, 0, 1, 0.5019608, 1,
-0.2523152, -0.5277935, -2.336613, 0, 1, 0.509804, 1,
-0.2511754, 0.131057, -1.6764, 0, 1, 0.5137255, 1,
-0.248797, 0.2465008, -0.8852522, 0, 1, 0.5215687, 1,
-0.2422421, 1.237914, -1.256899, 0, 1, 0.5254902, 1,
-0.2421297, -1.857919, -2.185875, 0, 1, 0.5333334, 1,
-0.2409132, -1.520485, -3.774131, 0, 1, 0.5372549, 1,
-0.24048, 0.1122707, 0.4875482, 0, 1, 0.5450981, 1,
-0.2383803, 0.3930975, -0.0709615, 0, 1, 0.5490196, 1,
-0.2369761, -0.501745, -2.870472, 0, 1, 0.5568628, 1,
-0.2363152, -0.2268962, -1.536037, 0, 1, 0.5607843, 1,
-0.2316939, -0.2703558, -1.655841, 0, 1, 0.5686275, 1,
-0.2293334, 0.9454991, 1.43298, 0, 1, 0.572549, 1,
-0.221985, 1.282547, -0.0369233, 0, 1, 0.5803922, 1,
-0.2187862, 1.311222, -3.211007, 0, 1, 0.5843138, 1,
-0.2178997, -1.482488, -4.644981, 0, 1, 0.5921569, 1,
-0.2147316, 1.156789, -2.595223, 0, 1, 0.5960785, 1,
-0.213699, -0.5266266, -3.881015, 0, 1, 0.6039216, 1,
-0.213422, 1.093993, 0.107364, 0, 1, 0.6117647, 1,
-0.2091902, 0.2426017, -0.2898135, 0, 1, 0.6156863, 1,
-0.2049135, 0.6614157, -1.478783, 0, 1, 0.6235294, 1,
-0.2047797, 0.0336462, -2.216386, 0, 1, 0.627451, 1,
-0.2002272, -0.8403615, -3.124858, 0, 1, 0.6352941, 1,
-0.1986545, 0.4523609, 0.5962233, 0, 1, 0.6392157, 1,
-0.1959164, -0.1156866, -2.602777, 0, 1, 0.6470588, 1,
-0.1946236, 0.4831605, 0.4097732, 0, 1, 0.6509804, 1,
-0.1941149, 0.3746337, -1.43295, 0, 1, 0.6588235, 1,
-0.1916353, -0.7759717, -2.157565, 0, 1, 0.6627451, 1,
-0.1898533, -1.009667, -2.997561, 0, 1, 0.6705883, 1,
-0.1884225, -0.3832091, -2.508854, 0, 1, 0.6745098, 1,
-0.1841596, 0.7726769, -0.511776, 0, 1, 0.682353, 1,
-0.1832221, -0.8375705, -3.406522, 0, 1, 0.6862745, 1,
-0.1805716, -0.2306365, -2.245642, 0, 1, 0.6941177, 1,
-0.1789315, 0.5021529, 0.6028805, 0, 1, 0.7019608, 1,
-0.1780868, 0.9482698, -2.492526, 0, 1, 0.7058824, 1,
-0.1761967, -0.3162219, -1.166402, 0, 1, 0.7137255, 1,
-0.1758734, 1.475308, 0.2241164, 0, 1, 0.7176471, 1,
-0.1732887, -1.150005, -4.028207, 0, 1, 0.7254902, 1,
-0.1730193, -0.1033534, -2.587929, 0, 1, 0.7294118, 1,
-0.1729216, -1.580258, -4.25123, 0, 1, 0.7372549, 1,
-0.1656947, 0.2263677, -0.5264361, 0, 1, 0.7411765, 1,
-0.1652848, 0.6576912, 0.8561208, 0, 1, 0.7490196, 1,
-0.1614675, -0.2243576, -1.683635, 0, 1, 0.7529412, 1,
-0.1533137, 0.5241889, -0.3361154, 0, 1, 0.7607843, 1,
-0.1512843, -0.4447436, -2.382305, 0, 1, 0.7647059, 1,
-0.1463649, -1.430035, -2.89743, 0, 1, 0.772549, 1,
-0.1418104, -0.6929199, -2.869674, 0, 1, 0.7764706, 1,
-0.1397239, -0.8786697, -0.7709728, 0, 1, 0.7843137, 1,
-0.1328983, -0.4094926, -3.345235, 0, 1, 0.7882353, 1,
-0.1318954, 0.4931593, -0.04599985, 0, 1, 0.7960784, 1,
-0.1309576, -0.04001977, -3.30815, 0, 1, 0.8039216, 1,
-0.12962, 0.4588528, 1.105217, 0, 1, 0.8078431, 1,
-0.1259041, 1.578096, -2.167898, 0, 1, 0.8156863, 1,
-0.1231579, -1.351071, -3.371914, 0, 1, 0.8196079, 1,
-0.120742, 0.1120656, 0.5010937, 0, 1, 0.827451, 1,
-0.1200838, -0.7713862, -3.406798, 0, 1, 0.8313726, 1,
-0.1177012, -0.7271719, -2.211793, 0, 1, 0.8392157, 1,
-0.1159852, 1.004351, 0.01318085, 0, 1, 0.8431373, 1,
-0.1153326, -0.8893848, -3.047317, 0, 1, 0.8509804, 1,
-0.112256, -0.08065694, -0.2794249, 0, 1, 0.854902, 1,
-0.1090478, -1.080805, -3.475688, 0, 1, 0.8627451, 1,
-0.1081669, 0.241906, 0.08793818, 0, 1, 0.8666667, 1,
-0.1030391, -0.596235, -2.478401, 0, 1, 0.8745098, 1,
-0.1014596, -0.2957259, -2.253296, 0, 1, 0.8784314, 1,
-0.09944198, -0.3636788, -3.299209, 0, 1, 0.8862745, 1,
-0.09938519, -0.3379863, -2.956819, 0, 1, 0.8901961, 1,
-0.0957868, 1.690662, -0.4137792, 0, 1, 0.8980392, 1,
-0.09399801, -0.794765, -3.800971, 0, 1, 0.9058824, 1,
-0.09268688, 1.211878, 0.609053, 0, 1, 0.9098039, 1,
-0.08932662, 0.3299849, -1.300409, 0, 1, 0.9176471, 1,
-0.08819696, 1.026085, 0.5056892, 0, 1, 0.9215686, 1,
-0.08696045, -0.6017279, -3.249686, 0, 1, 0.9294118, 1,
-0.08480677, -0.02659454, -1.330644, 0, 1, 0.9333333, 1,
-0.0828575, -1.708208, -3.081162, 0, 1, 0.9411765, 1,
-0.07985733, 0.2664008, -1.650485, 0, 1, 0.945098, 1,
-0.07365675, -0.2304704, -2.548702, 0, 1, 0.9529412, 1,
-0.06864642, 0.5911645, -0.4073672, 0, 1, 0.9568627, 1,
-0.0583168, -2.168028, -3.256594, 0, 1, 0.9647059, 1,
-0.05702097, -1.449962, -3.012213, 0, 1, 0.9686275, 1,
-0.04931488, -0.3786964, -3.284057, 0, 1, 0.9764706, 1,
-0.04467089, -0.9606649, -3.7989, 0, 1, 0.9803922, 1,
-0.04060213, 2.299046, 0.1088746, 0, 1, 0.9882353, 1,
-0.03703658, 0.7200862, -1.72515, 0, 1, 0.9921569, 1,
-0.0360877, -0.4074496, -5.01208, 0, 1, 1, 1,
-0.03196009, 0.1215955, -0.04250001, 0, 0.9921569, 1, 1,
-0.02902476, -1.152315, -3.755934, 0, 0.9882353, 1, 1,
-0.02841797, 2.312422, -0.05196002, 0, 0.9803922, 1, 1,
-0.02525029, -0.5607128, -4.700982, 0, 0.9764706, 1, 1,
-0.01938541, 0.1534949, -0.4334244, 0, 0.9686275, 1, 1,
-0.01360883, -0.8524829, -1.564427, 0, 0.9647059, 1, 1,
-0.01130279, 0.5803026, -0.2409422, 0, 0.9568627, 1, 1,
-0.01066382, 0.1360624, -0.2973458, 0, 0.9529412, 1, 1,
-0.01002343, 2.313148, -0.4374881, 0, 0.945098, 1, 1,
-0.00970398, -2.643022, -2.150056, 0, 0.9411765, 1, 1,
-0.007395655, 0.9005083, 0.1889127, 0, 0.9333333, 1, 1,
-0.004114014, -0.4492023, -3.421307, 0, 0.9294118, 1, 1,
-0.003750719, 0.3852101, 0.03044108, 0, 0.9215686, 1, 1,
-0.001696935, -0.8650904, -3.559614, 0, 0.9176471, 1, 1,
0.001867845, -0.8661102, 4.199811, 0, 0.9098039, 1, 1,
0.002160781, 0.8188046, -1.356119, 0, 0.9058824, 1, 1,
0.003161994, -0.2701523, 1.566088, 0, 0.8980392, 1, 1,
0.004832365, -0.9058865, 1.717593, 0, 0.8901961, 1, 1,
0.008808335, 0.7554686, 0.6381408, 0, 0.8862745, 1, 1,
0.0097351, 1.453646, -0.2338175, 0, 0.8784314, 1, 1,
0.0117313, -0.761394, 4.111991, 0, 0.8745098, 1, 1,
0.0177184, -0.2539854, 2.221416, 0, 0.8666667, 1, 1,
0.01784136, -0.2491803, 3.579836, 0, 0.8627451, 1, 1,
0.01887544, 1.967489, -1.169974, 0, 0.854902, 1, 1,
0.02228638, 0.2117295, -0.50823, 0, 0.8509804, 1, 1,
0.02609184, 1.251011, -0.6473579, 0, 0.8431373, 1, 1,
0.02805489, 2.238766, -0.363191, 0, 0.8392157, 1, 1,
0.03033747, 0.05622495, 0.7363434, 0, 0.8313726, 1, 1,
0.0309687, -0.4688374, 0.9413483, 0, 0.827451, 1, 1,
0.03451128, -0.5556101, 2.244596, 0, 0.8196079, 1, 1,
0.04682827, 2.227381, -1.262589, 0, 0.8156863, 1, 1,
0.04705104, -0.4139636, 0.7673518, 0, 0.8078431, 1, 1,
0.04808429, -0.8305087, 2.303642, 0, 0.8039216, 1, 1,
0.05610445, -1.254228, 3.015116, 0, 0.7960784, 1, 1,
0.05906687, -1.107298, 0.3525773, 0, 0.7882353, 1, 1,
0.05916274, -1.07965, 5.287059, 0, 0.7843137, 1, 1,
0.06413151, 0.2199999, 0.7577907, 0, 0.7764706, 1, 1,
0.07097702, 0.3870549, -1.138606, 0, 0.772549, 1, 1,
0.07123049, 1.096726, -0.7109404, 0, 0.7647059, 1, 1,
0.07160803, 1.82106, -0.8442862, 0, 0.7607843, 1, 1,
0.073769, 1.314668, 0.4900574, 0, 0.7529412, 1, 1,
0.0755089, 0.3628812, 0.3919825, 0, 0.7490196, 1, 1,
0.07592164, 0.1760744, 1.211636, 0, 0.7411765, 1, 1,
0.07935022, 0.7086575, -1.03269, 0, 0.7372549, 1, 1,
0.08077405, 0.1364747, 0.9364239, 0, 0.7294118, 1, 1,
0.08093262, -0.09937162, 4.121819, 0, 0.7254902, 1, 1,
0.08945114, -2.656, 1.105555, 0, 0.7176471, 1, 1,
0.09386854, 1.83692, 0.8930863, 0, 0.7137255, 1, 1,
0.09850724, -0.7495649, 3.534209, 0, 0.7058824, 1, 1,
0.0991791, -0.283391, 1.985727, 0, 0.6980392, 1, 1,
0.1001718, -0.009311702, 3.153233, 0, 0.6941177, 1, 1,
0.1014533, 1.592219, 0.2855166, 0, 0.6862745, 1, 1,
0.1015623, -1.327769, 1.483606, 0, 0.682353, 1, 1,
0.1016891, -0.6477875, 3.693819, 0, 0.6745098, 1, 1,
0.1056944, 0.5683268, 1.091193, 0, 0.6705883, 1, 1,
0.1061768, 1.071607, -0.3058956, 0, 0.6627451, 1, 1,
0.109337, 0.6434309, 0.4095945, 0, 0.6588235, 1, 1,
0.1101033, -0.6386914, 3.153692, 0, 0.6509804, 1, 1,
0.1113557, 0.2412233, -0.2181022, 0, 0.6470588, 1, 1,
0.1159819, 1.496978, 0.8332528, 0, 0.6392157, 1, 1,
0.1164445, -2.010981, 2.186606, 0, 0.6352941, 1, 1,
0.1174951, 0.5064791, 0.9778295, 0, 0.627451, 1, 1,
0.1183917, -1.532224, 2.308242, 0, 0.6235294, 1, 1,
0.1202863, 1.036993, -0.9578505, 0, 0.6156863, 1, 1,
0.1206916, 0.1563239, 0.4363314, 0, 0.6117647, 1, 1,
0.1210263, 1.791251, -0.6407906, 0, 0.6039216, 1, 1,
0.1259852, 3.014042, -0.6371773, 0, 0.5960785, 1, 1,
0.128914, -0.9526412, 1.514143, 0, 0.5921569, 1, 1,
0.1294179, -0.743744, 3.436323, 0, 0.5843138, 1, 1,
0.1333748, 0.833615, 0.6919569, 0, 0.5803922, 1, 1,
0.1428522, -0.6780705, 4.03786, 0, 0.572549, 1, 1,
0.1474717, 0.8358753, 0.3256342, 0, 0.5686275, 1, 1,
0.1507789, -0.2801789, 3.108551, 0, 0.5607843, 1, 1,
0.1528139, 0.3193559, 1.716128, 0, 0.5568628, 1, 1,
0.1528957, 1.639504, 0.5159072, 0, 0.5490196, 1, 1,
0.1548598, 1.092645, 2.551856, 0, 0.5450981, 1, 1,
0.1574721, -0.02537348, 2.704099, 0, 0.5372549, 1, 1,
0.1598735, -0.4560426, 2.116302, 0, 0.5333334, 1, 1,
0.1608545, 0.3371756, -0.4766556, 0, 0.5254902, 1, 1,
0.1610738, -1.380357, 3.047392, 0, 0.5215687, 1, 1,
0.1628449, 0.4699701, 0.8238681, 0, 0.5137255, 1, 1,
0.1633685, 1.30125, -2.13428, 0, 0.509804, 1, 1,
0.1651724, -0.3058811, 2.161193, 0, 0.5019608, 1, 1,
0.1674194, 0.1946669, 0.9672854, 0, 0.4941176, 1, 1,
0.1705572, -0.2153306, 3.520285, 0, 0.4901961, 1, 1,
0.1755055, 0.7049822, -1.934808, 0, 0.4823529, 1, 1,
0.1766741, 0.8376278, 1.07216, 0, 0.4784314, 1, 1,
0.1778354, -1.188107, 3.146726, 0, 0.4705882, 1, 1,
0.1784705, -1.87076, 3.320662, 0, 0.4666667, 1, 1,
0.1792527, 0.1691047, 0.4433029, 0, 0.4588235, 1, 1,
0.1817779, -0.292173, 1.270266, 0, 0.454902, 1, 1,
0.1824285, 0.5776174, 0.4272189, 0, 0.4470588, 1, 1,
0.1830482, 0.7985364, 0.9584695, 0, 0.4431373, 1, 1,
0.1905262, -1.744765, 2.677859, 0, 0.4352941, 1, 1,
0.1944761, -1.565326, 2.455581, 0, 0.4313726, 1, 1,
0.2060348, -0.4100614, 2.324911, 0, 0.4235294, 1, 1,
0.2206971, 0.6648402, -0.7387692, 0, 0.4196078, 1, 1,
0.2212971, -2.145408, 1.434341, 0, 0.4117647, 1, 1,
0.2225672, -0.2891508, 2.558515, 0, 0.4078431, 1, 1,
0.2230338, 0.2168895, -1.037407, 0, 0.4, 1, 1,
0.2235539, 0.08940537, 2.501325, 0, 0.3921569, 1, 1,
0.2241863, -0.02997176, 1.918541, 0, 0.3882353, 1, 1,
0.2275866, 0.2427734, 3.120667, 0, 0.3803922, 1, 1,
0.2312719, -0.5004458, 2.987834, 0, 0.3764706, 1, 1,
0.2371932, 0.3925065, 2.027186, 0, 0.3686275, 1, 1,
0.2389456, -0.07707475, 1.172661, 0, 0.3647059, 1, 1,
0.2395866, -0.7750112, 1.097397, 0, 0.3568628, 1, 1,
0.2400927, -1.138397, 4.294439, 0, 0.3529412, 1, 1,
0.2406178, -1.083593, 2.598101, 0, 0.345098, 1, 1,
0.2411687, 1.045739, -0.6507568, 0, 0.3411765, 1, 1,
0.244368, 0.8880209, 0.7556212, 0, 0.3333333, 1, 1,
0.2446265, 0.4986926, -0.4120176, 0, 0.3294118, 1, 1,
0.2539148, 1.414621, 0.5279971, 0, 0.3215686, 1, 1,
0.2580031, 1.100274, 0.8587415, 0, 0.3176471, 1, 1,
0.2580296, 0.2492931, -0.6138697, 0, 0.3098039, 1, 1,
0.2596939, -2.426942, 3.462197, 0, 0.3058824, 1, 1,
0.2637996, -1.199397, 4.064252, 0, 0.2980392, 1, 1,
0.264402, 0.2084738, 3.088487, 0, 0.2901961, 1, 1,
0.2681791, -0.003073499, 2.707032, 0, 0.2862745, 1, 1,
0.2703126, -0.6556339, 1.489683, 0, 0.2784314, 1, 1,
0.2715461, -0.1203518, 1.899157, 0, 0.2745098, 1, 1,
0.2717326, 0.208519, 1.235405, 0, 0.2666667, 1, 1,
0.2753575, -1.609933, 2.73702, 0, 0.2627451, 1, 1,
0.2755133, 1.262011, -0.2690452, 0, 0.254902, 1, 1,
0.2818863, -0.930044, 4.299866, 0, 0.2509804, 1, 1,
0.2858306, -0.1983647, 2.196039, 0, 0.2431373, 1, 1,
0.2864085, -0.306876, 1.417756, 0, 0.2392157, 1, 1,
0.2891985, 1.673546, -0.6099482, 0, 0.2313726, 1, 1,
0.2963939, -0.56736, 2.233333, 0, 0.227451, 1, 1,
0.2968864, -1.590363, 4.440033, 0, 0.2196078, 1, 1,
0.3008979, 1.107484, -0.46281, 0, 0.2156863, 1, 1,
0.3024636, 0.1139999, 0.3689011, 0, 0.2078431, 1, 1,
0.3041209, 0.5336799, 0.155735, 0, 0.2039216, 1, 1,
0.3069392, 0.2509137, 0.3246676, 0, 0.1960784, 1, 1,
0.3125722, 0.966079, -0.6772289, 0, 0.1882353, 1, 1,
0.3143962, 1.825023, -0.6800457, 0, 0.1843137, 1, 1,
0.3161876, -1.386963, 2.469038, 0, 0.1764706, 1, 1,
0.3164284, -1.156915, 0.7643468, 0, 0.172549, 1, 1,
0.3207967, -0.8746459, 1.813119, 0, 0.1647059, 1, 1,
0.3247974, -0.8270886, 3.063198, 0, 0.1607843, 1, 1,
0.3252315, 0.5040666, -0.3460889, 0, 0.1529412, 1, 1,
0.3263122, 1.493205, 0.213865, 0, 0.1490196, 1, 1,
0.3280551, 0.8133679, 0.2627953, 0, 0.1411765, 1, 1,
0.3286726, 0.2443362, 1.361954, 0, 0.1372549, 1, 1,
0.3348586, 1.963042, 1.999495, 0, 0.1294118, 1, 1,
0.3393781, 1.612491, -0.7614589, 0, 0.1254902, 1, 1,
0.3433747, 0.09982706, 1.25569, 0, 0.1176471, 1, 1,
0.3487853, -0.2204275, 2.248781, 0, 0.1137255, 1, 1,
0.3488117, 0.4013268, 1.419742, 0, 0.1058824, 1, 1,
0.3525061, 0.001438309, 4.49952, 0, 0.09803922, 1, 1,
0.3537585, -0.6552605, 3.687359, 0, 0.09411765, 1, 1,
0.3590043, 0.126181, 1.443996, 0, 0.08627451, 1, 1,
0.3674936, 0.9362165, 0.2168376, 0, 0.08235294, 1, 1,
0.3683297, 0.3650057, 1.883415, 0, 0.07450981, 1, 1,
0.3688032, -0.3340251, 2.564993, 0, 0.07058824, 1, 1,
0.3707241, -0.3036337, 1.690215, 0, 0.0627451, 1, 1,
0.3710903, -0.8755345, 1.640444, 0, 0.05882353, 1, 1,
0.3720389, -0.4360857, 2.185151, 0, 0.05098039, 1, 1,
0.3748972, 0.9603264, 0.1808247, 0, 0.04705882, 1, 1,
0.378707, 0.3227427, 1.317883, 0, 0.03921569, 1, 1,
0.3790858, -0.3292825, 2.539685, 0, 0.03529412, 1, 1,
0.3798679, 1.266762, 0.9502056, 0, 0.02745098, 1, 1,
0.3839072, -2.061445, 2.569078, 0, 0.02352941, 1, 1,
0.3938298, 0.0951333, 1.835084, 0, 0.01568628, 1, 1,
0.3941188, 2.582802, -0.3992727, 0, 0.01176471, 1, 1,
0.394356, -0.1862396, 2.636854, 0, 0.003921569, 1, 1,
0.3969502, -0.9340154, 1.789901, 0.003921569, 0, 1, 1,
0.3979447, 0.514285, 0.5868048, 0.007843138, 0, 1, 1,
0.4015303, -0.2522226, 2.257482, 0.01568628, 0, 1, 1,
0.4062329, 1.742114, -1.191136, 0.01960784, 0, 1, 1,
0.4077325, -0.1986926, 2.218536, 0.02745098, 0, 1, 1,
0.416597, 0.067548, 1.924582, 0.03137255, 0, 1, 1,
0.4216926, -0.6524906, 1.853768, 0.03921569, 0, 1, 1,
0.4233775, -0.4988139, 3.066663, 0.04313726, 0, 1, 1,
0.4247914, 0.2774341, 1.949171, 0.05098039, 0, 1, 1,
0.4258589, -0.5735514, 1.027644, 0.05490196, 0, 1, 1,
0.4278399, 0.3651739, 2.577001, 0.0627451, 0, 1, 1,
0.4356433, -0.8020432, 2.815471, 0.06666667, 0, 1, 1,
0.4460261, -0.4705642, 3.105827, 0.07450981, 0, 1, 1,
0.4514549, -0.4542088, 2.760612, 0.07843138, 0, 1, 1,
0.4540758, 0.6755741, 1.271933, 0.08627451, 0, 1, 1,
0.458605, -0.6180861, 1.569947, 0.09019608, 0, 1, 1,
0.4643349, 0.4328729, 3.188165, 0.09803922, 0, 1, 1,
0.466795, -1.685364, 3.231337, 0.1058824, 0, 1, 1,
0.467978, 0.6351057, 1.270928, 0.1098039, 0, 1, 1,
0.4746754, 1.10837, -0.06618552, 0.1176471, 0, 1, 1,
0.4772282, 1.06329, 0.9782071, 0.1215686, 0, 1, 1,
0.4810924, -0.111383, 2.994318, 0.1294118, 0, 1, 1,
0.4815425, -0.06581713, 2.019118, 0.1333333, 0, 1, 1,
0.4846906, -0.5598516, 1.467752, 0.1411765, 0, 1, 1,
0.4847287, 0.2006811, 2.808376, 0.145098, 0, 1, 1,
0.4854577, 0.3312144, 1.995987, 0.1529412, 0, 1, 1,
0.4857456, 1.168632, -0.6246859, 0.1568628, 0, 1, 1,
0.4914818, -0.2507192, 2.017224, 0.1647059, 0, 1, 1,
0.4921718, -0.5633915, 0.6411917, 0.1686275, 0, 1, 1,
0.4923186, 0.8595234, -1.246969, 0.1764706, 0, 1, 1,
0.4973744, 0.5456086, 1.556034, 0.1803922, 0, 1, 1,
0.4989453, 1.456861, -1.256723, 0.1882353, 0, 1, 1,
0.4990977, -0.7744671, 3.457885, 0.1921569, 0, 1, 1,
0.5057009, -1.651495, 1.243499, 0.2, 0, 1, 1,
0.507206, 0.6307622, 1.511844, 0.2078431, 0, 1, 1,
0.5079113, -0.5702198, 3.353236, 0.2117647, 0, 1, 1,
0.508759, 0.5036854, -0.952073, 0.2196078, 0, 1, 1,
0.518867, -1.773775, 2.818464, 0.2235294, 0, 1, 1,
0.5193368, -0.7217045, 3.373098, 0.2313726, 0, 1, 1,
0.5226572, -0.5777568, 2.200565, 0.2352941, 0, 1, 1,
0.525914, -0.199105, 2.04835, 0.2431373, 0, 1, 1,
0.5265818, 0.4020781, -0.1257156, 0.2470588, 0, 1, 1,
0.5274047, -0.7791951, 1.849066, 0.254902, 0, 1, 1,
0.5275116, 0.5207959, -1.119864, 0.2588235, 0, 1, 1,
0.5295307, 0.05432989, 0.7685812, 0.2666667, 0, 1, 1,
0.5304936, 0.8237594, 0.8619323, 0.2705882, 0, 1, 1,
0.5313281, 0.9353675, 0.1023162, 0.2784314, 0, 1, 1,
0.5335767, 0.7409225, 0.755908, 0.282353, 0, 1, 1,
0.5351851, 0.9363114, -0.1659793, 0.2901961, 0, 1, 1,
0.5476433, -1.384576, 2.81738, 0.2941177, 0, 1, 1,
0.5489033, -0.7389024, 2.942986, 0.3019608, 0, 1, 1,
0.5496419, -1.81738, 1.655086, 0.3098039, 0, 1, 1,
0.5520938, -1.763965, 1.249143, 0.3137255, 0, 1, 1,
0.5638539, -0.4484898, 3.398063, 0.3215686, 0, 1, 1,
0.5682525, -0.4918135, 2.669187, 0.3254902, 0, 1, 1,
0.5696046, 0.136372, 1.486567, 0.3333333, 0, 1, 1,
0.5729342, 0.05251364, 0.1751652, 0.3372549, 0, 1, 1,
0.5778044, 0.2366847, 1.099148, 0.345098, 0, 1, 1,
0.5815372, 0.875972, 0.4086894, 0.3490196, 0, 1, 1,
0.5823269, -0.007591074, 0.3321432, 0.3568628, 0, 1, 1,
0.5857384, -0.1767541, 1.804754, 0.3607843, 0, 1, 1,
0.60029, -1.928351, 0.08004564, 0.3686275, 0, 1, 1,
0.6029891, 1.112692, 0.6874499, 0.372549, 0, 1, 1,
0.6041024, -0.2422557, 3.615485, 0.3803922, 0, 1, 1,
0.6076405, -0.2735524, 2.076141, 0.3843137, 0, 1, 1,
0.6090981, -1.031911, 3.819105, 0.3921569, 0, 1, 1,
0.6183004, 1.485543, 1.373633, 0.3960784, 0, 1, 1,
0.6185065, -1.482343, 2.425707, 0.4039216, 0, 1, 1,
0.6211705, -0.5918782, 1.323394, 0.4117647, 0, 1, 1,
0.6216659, -0.1836346, 0.9398201, 0.4156863, 0, 1, 1,
0.6217418, 1.058405, 1.958698, 0.4235294, 0, 1, 1,
0.6231304, -0.7277064, 2.089757, 0.427451, 0, 1, 1,
0.6237497, -0.9307889, 1.575321, 0.4352941, 0, 1, 1,
0.6270363, 1.166321, 0.9996607, 0.4392157, 0, 1, 1,
0.6288313, 1.153378, 2.514596, 0.4470588, 0, 1, 1,
0.6297095, 0.4757278, -0.5530643, 0.4509804, 0, 1, 1,
0.6368107, 0.4558899, 0.9517876, 0.4588235, 0, 1, 1,
0.637237, 0.1052442, 1.435542, 0.4627451, 0, 1, 1,
0.6410205, -0.1625871, 2.666749, 0.4705882, 0, 1, 1,
0.646534, 1.81128, -1.033513, 0.4745098, 0, 1, 1,
0.6575917, 1.57239, 0.6401086, 0.4823529, 0, 1, 1,
0.6576233, 0.5064505, -1.081129, 0.4862745, 0, 1, 1,
0.6623894, 0.6906141, 1.491712, 0.4941176, 0, 1, 1,
0.665208, -0.2655993, 2.903945, 0.5019608, 0, 1, 1,
0.6678479, -0.4815457, 1.013682, 0.5058824, 0, 1, 1,
0.6702152, -0.03119176, 0.9258564, 0.5137255, 0, 1, 1,
0.6703469, -0.6205721, 0.3921641, 0.5176471, 0, 1, 1,
0.6830714, -0.04666308, 2.504838, 0.5254902, 0, 1, 1,
0.6875462, -0.04773001, 1.243233, 0.5294118, 0, 1, 1,
0.6899613, 0.6988495, 0.2381775, 0.5372549, 0, 1, 1,
0.693074, 0.678513, 1.233107, 0.5411765, 0, 1, 1,
0.6939651, 0.1912305, 2.239427, 0.5490196, 0, 1, 1,
0.7020538, -0.5729791, 2.069038, 0.5529412, 0, 1, 1,
0.7034326, 0.7221299, 1.906881, 0.5607843, 0, 1, 1,
0.7092208, -2.606715, 2.881709, 0.5647059, 0, 1, 1,
0.7114629, -0.8713019, 2.948972, 0.572549, 0, 1, 1,
0.7126215, 0.4073844, 0.7168568, 0.5764706, 0, 1, 1,
0.7169495, 0.1243679, 1.722248, 0.5843138, 0, 1, 1,
0.7193338, -0.3747928, 2.184671, 0.5882353, 0, 1, 1,
0.7203488, -0.3009585, 0.8504657, 0.5960785, 0, 1, 1,
0.721277, 1.137358, 0.2326866, 0.6039216, 0, 1, 1,
0.7215492, 0.7681026, -0.4656185, 0.6078432, 0, 1, 1,
0.7254877, 0.2594326, 0.7309359, 0.6156863, 0, 1, 1,
0.7301585, -0.2213725, 2.304084, 0.6196079, 0, 1, 1,
0.7326475, 0.9855697, -0.5321347, 0.627451, 0, 1, 1,
0.7364567, -2.103715, 1.546481, 0.6313726, 0, 1, 1,
0.7437434, 1.265128, 0.1821984, 0.6392157, 0, 1, 1,
0.7492021, -0.2592346, 2.644132, 0.6431373, 0, 1, 1,
0.7494502, 0.5152797, 0.3888536, 0.6509804, 0, 1, 1,
0.750268, 0.02153159, 0.6846772, 0.654902, 0, 1, 1,
0.750315, -1.410568, 2.309057, 0.6627451, 0, 1, 1,
0.7531419, -1.097882, 3.051187, 0.6666667, 0, 1, 1,
0.7578403, -1.159385, 4.090682, 0.6745098, 0, 1, 1,
0.7590338, 0.4432099, -0.5859107, 0.6784314, 0, 1, 1,
0.7621553, 0.09435276, 2.096743, 0.6862745, 0, 1, 1,
0.763739, -1.906107, 3.399062, 0.6901961, 0, 1, 1,
0.7713525, -0.5823935, 2.682029, 0.6980392, 0, 1, 1,
0.7755819, -0.9912374, 1.908031, 0.7058824, 0, 1, 1,
0.8052219, -0.02017242, 1.915886, 0.7098039, 0, 1, 1,
0.8073547, 1.098633, -0.4427762, 0.7176471, 0, 1, 1,
0.8081282, -0.8038462, 3.408933, 0.7215686, 0, 1, 1,
0.8093678, -0.3262059, 2.543849, 0.7294118, 0, 1, 1,
0.8122873, -0.9835326, 1.785294, 0.7333333, 0, 1, 1,
0.812958, -0.3041781, 2.54493, 0.7411765, 0, 1, 1,
0.8135594, -0.4544638, 1.872381, 0.7450981, 0, 1, 1,
0.816232, -0.5682581, 1.973044, 0.7529412, 0, 1, 1,
0.8168179, -0.5130494, 1.345592, 0.7568628, 0, 1, 1,
0.8253307, -2.035936, 1.874363, 0.7647059, 0, 1, 1,
0.8260118, -0.2297113, 1.84463, 0.7686275, 0, 1, 1,
0.829903, 0.342232, -0.142277, 0.7764706, 0, 1, 1,
0.8331543, 0.2286973, -0.7717293, 0.7803922, 0, 1, 1,
0.8404643, -0.01290118, 2.833996, 0.7882353, 0, 1, 1,
0.8413707, 1.88274, -0.7506196, 0.7921569, 0, 1, 1,
0.8419392, -1.041585, 3.947859, 0.8, 0, 1, 1,
0.8439803, 0.2266556, 0.3954916, 0.8078431, 0, 1, 1,
0.8490241, 0.8212432, 2.264195, 0.8117647, 0, 1, 1,
0.849206, -0.04708461, 1.997251, 0.8196079, 0, 1, 1,
0.8521611, -0.9303862, 2.121449, 0.8235294, 0, 1, 1,
0.854389, 1.770651, 1.410905, 0.8313726, 0, 1, 1,
0.8549397, -0.4803539, 3.622682, 0.8352941, 0, 1, 1,
0.8561288, 0.2856045, 0.02721811, 0.8431373, 0, 1, 1,
0.8575148, 1.19019, 1.410162, 0.8470588, 0, 1, 1,
0.8629532, 1.335063, 1.801481, 0.854902, 0, 1, 1,
0.8643517, 0.8349957, 0.9933017, 0.8588235, 0, 1, 1,
0.8691533, 1.073422, -1.214349, 0.8666667, 0, 1, 1,
0.8709257, 1.04335, 0.8522422, 0.8705882, 0, 1, 1,
0.8761472, -0.1800458, 2.431695, 0.8784314, 0, 1, 1,
0.8788779, 2.251119, -0.133675, 0.8823529, 0, 1, 1,
0.8791699, 1.612986, 1.653148, 0.8901961, 0, 1, 1,
0.8798843, -0.5045057, 1.539876, 0.8941177, 0, 1, 1,
0.8805098, 2.110776, -0.009401769, 0.9019608, 0, 1, 1,
0.881744, -0.677632, 2.339236, 0.9098039, 0, 1, 1,
0.8845761, 0.4771032, 0.1779368, 0.9137255, 0, 1, 1,
0.8856437, -0.3937601, 2.736442, 0.9215686, 0, 1, 1,
0.889331, -1.111472, 2.745116, 0.9254902, 0, 1, 1,
0.8946627, 0.1731135, 2.037246, 0.9333333, 0, 1, 1,
0.8986384, -0.7920378, 4.452339, 0.9372549, 0, 1, 1,
0.8996875, -2.173836, 2.328667, 0.945098, 0, 1, 1,
0.9052057, -1.538943, 2.423013, 0.9490196, 0, 1, 1,
0.9097071, 0.6928999, 1.053612, 0.9568627, 0, 1, 1,
0.9160979, -2.47893, 4.399063, 0.9607843, 0, 1, 1,
0.9191219, -0.6165785, 1.138605, 0.9686275, 0, 1, 1,
0.9205371, 1.026754, 1.48722, 0.972549, 0, 1, 1,
0.9205698, 2.186777, 0.6705003, 0.9803922, 0, 1, 1,
0.9241139, 2.124819, -1.242257, 0.9843137, 0, 1, 1,
0.9261267, 1.92478, 0.895814, 0.9921569, 0, 1, 1,
0.9399872, -0.5259801, 1.645024, 0.9960784, 0, 1, 1,
0.9401662, 0.1531363, 1.663934, 1, 0, 0.9960784, 1,
0.9661777, 0.4338014, 0.7160397, 1, 0, 0.9882353, 1,
0.9670205, -0.5718176, 3.3133, 1, 0, 0.9843137, 1,
0.96793, -1.640862, 1.82398, 1, 0, 0.9764706, 1,
0.9846902, 1.534636, -1.157334, 1, 0, 0.972549, 1,
0.9948657, -2.282498, 2.443262, 1, 0, 0.9647059, 1,
0.9983619, 1.133544, -0.6135324, 1, 0, 0.9607843, 1,
1.012067, -0.4919728, 2.903783, 1, 0, 0.9529412, 1,
1.013989, 1.006052, -0.5078809, 1, 0, 0.9490196, 1,
1.0165, -0.1707965, -0.9063356, 1, 0, 0.9411765, 1,
1.020342, 0.4145422, 0.4707583, 1, 0, 0.9372549, 1,
1.029597, -0.6339795, 3.574229, 1, 0, 0.9294118, 1,
1.030342, -0.2396535, 0.1042183, 1, 0, 0.9254902, 1,
1.032711, 0.8497609, 2.196429, 1, 0, 0.9176471, 1,
1.03663, 1.306237, -0.6953036, 1, 0, 0.9137255, 1,
1.04161, -0.9287354, 2.910089, 1, 0, 0.9058824, 1,
1.042621, -0.9596753, 1.405754, 1, 0, 0.9019608, 1,
1.042974, -0.4329232, 1.938201, 1, 0, 0.8941177, 1,
1.046045, 0.4663702, 1.246816, 1, 0, 0.8862745, 1,
1.065534, 0.702631, 1.799459, 1, 0, 0.8823529, 1,
1.067002, -0.5481197, 1.598247, 1, 0, 0.8745098, 1,
1.078745, 0.6433746, 2.312106, 1, 0, 0.8705882, 1,
1.088968, -0.7223114, 0.8616094, 1, 0, 0.8627451, 1,
1.091208, 0.9515807, 0.9454811, 1, 0, 0.8588235, 1,
1.091385, -1.896921, 1.614466, 1, 0, 0.8509804, 1,
1.097152, -0.9134886, 2.054353, 1, 0, 0.8470588, 1,
1.103063, -0.5657972, 1.676422, 1, 0, 0.8392157, 1,
1.103679, -0.9191541, 4.101626, 1, 0, 0.8352941, 1,
1.109837, 0.3338946, 3.638526, 1, 0, 0.827451, 1,
1.114359, -0.4001075, 4.227999, 1, 0, 0.8235294, 1,
1.122082, 1.51712, 1.380583, 1, 0, 0.8156863, 1,
1.122223, 1.306786, 0.3256792, 1, 0, 0.8117647, 1,
1.122881, 0.07279878, 1.085083, 1, 0, 0.8039216, 1,
1.124024, 0.685421, 0.2995308, 1, 0, 0.7960784, 1,
1.137076, 1.722471, 0.4993328, 1, 0, 0.7921569, 1,
1.137166, 1.018461, 0.4667834, 1, 0, 0.7843137, 1,
1.138112, -0.1995427, 1.779909, 1, 0, 0.7803922, 1,
1.138866, -0.1572029, 0.4071071, 1, 0, 0.772549, 1,
1.139142, -0.2228518, 3.262712, 1, 0, 0.7686275, 1,
1.141276, 1.199591, 1.211601, 1, 0, 0.7607843, 1,
1.146084, -0.2657503, 2.248858, 1, 0, 0.7568628, 1,
1.148114, 0.1345838, 1.242727, 1, 0, 0.7490196, 1,
1.148965, -0.652407, 1.289053, 1, 0, 0.7450981, 1,
1.153345, 0.8376015, 0.682507, 1, 0, 0.7372549, 1,
1.156973, -1.18294, 1.632389, 1, 0, 0.7333333, 1,
1.157878, -1.437557, 3.328117, 1, 0, 0.7254902, 1,
1.159551, -0.08263186, 1.720753, 1, 0, 0.7215686, 1,
1.163739, -1.237608, 2.117467, 1, 0, 0.7137255, 1,
1.165536, 1.708738, 0.3259795, 1, 0, 0.7098039, 1,
1.167631, 1.112903, 0.6253108, 1, 0, 0.7019608, 1,
1.171088, -0.8391675, 4.725253, 1, 0, 0.6941177, 1,
1.184924, 0.9338647, 0.5508043, 1, 0, 0.6901961, 1,
1.187231, -0.757604, 2.926828, 1, 0, 0.682353, 1,
1.187355, -1.07848, 4.114484, 1, 0, 0.6784314, 1,
1.224717, -0.3779846, 3.792149, 1, 0, 0.6705883, 1,
1.235381, -0.2307661, 2.19485, 1, 0, 0.6666667, 1,
1.236747, 0.695913, 0.448723, 1, 0, 0.6588235, 1,
1.242971, -0.05167578, 1.156306, 1, 0, 0.654902, 1,
1.255154, -0.5134324, 0.5986499, 1, 0, 0.6470588, 1,
1.260436, 0.7518747, -0.4197332, 1, 0, 0.6431373, 1,
1.264872, 1.619391, 0.591459, 1, 0, 0.6352941, 1,
1.270285, 0.1661019, 3.796525, 1, 0, 0.6313726, 1,
1.270429, -0.7680556, 1.895961, 1, 0, 0.6235294, 1,
1.27632, -0.9313085, 0.4507559, 1, 0, 0.6196079, 1,
1.281581, -0.8348134, 1.565308, 1, 0, 0.6117647, 1,
1.284175, 0.8929206, 0.08042554, 1, 0, 0.6078432, 1,
1.291111, 0.239559, 0.1391561, 1, 0, 0.6, 1,
1.29276, 1.464465, 1.177733, 1, 0, 0.5921569, 1,
1.296314, 2.520086, -0.8137466, 1, 0, 0.5882353, 1,
1.298005, 0.2681855, 0.868908, 1, 0, 0.5803922, 1,
1.299314, -0.6881154, 2.915203, 1, 0, 0.5764706, 1,
1.301156, 0.4333713, 3.066951, 1, 0, 0.5686275, 1,
1.301748, -1.078864, 1.493342, 1, 0, 0.5647059, 1,
1.308357, 0.2647089, 2.004535, 1, 0, 0.5568628, 1,
1.31048, -0.06861521, 1.079075, 1, 0, 0.5529412, 1,
1.311152, -0.1275209, 0.6912896, 1, 0, 0.5450981, 1,
1.314368, 0.2602025, 1.915414, 1, 0, 0.5411765, 1,
1.319918, -1.364254, 0.7038698, 1, 0, 0.5333334, 1,
1.331236, 0.129351, 1.711946, 1, 0, 0.5294118, 1,
1.339489, 1.175412, 1.261565, 1, 0, 0.5215687, 1,
1.342027, -0.8232006, 1.948901, 1, 0, 0.5176471, 1,
1.347641, 1.206695, 2.063093, 1, 0, 0.509804, 1,
1.347945, 0.6835167, 0.3243527, 1, 0, 0.5058824, 1,
1.348852, -1.997116, 2.724407, 1, 0, 0.4980392, 1,
1.3495, -1.30991, 2.924444, 1, 0, 0.4901961, 1,
1.349765, -1.395877, 3.298027, 1, 0, 0.4862745, 1,
1.350961, 2.76124, 1.446368, 1, 0, 0.4784314, 1,
1.362141, -0.1374891, 1.455501, 1, 0, 0.4745098, 1,
1.378603, -1.539933, 1.672728, 1, 0, 0.4666667, 1,
1.378727, 0.07167491, 1.591672, 1, 0, 0.4627451, 1,
1.379037, -0.1192497, 1.728911, 1, 0, 0.454902, 1,
1.379842, -0.2906162, 1.077222, 1, 0, 0.4509804, 1,
1.382595, -1.493606, 1.184191, 1, 0, 0.4431373, 1,
1.394976, -0.9541487, 1.962336, 1, 0, 0.4392157, 1,
1.430709, -0.6974923, 2.428264, 1, 0, 0.4313726, 1,
1.43627, -1.588458, 1.474582, 1, 0, 0.427451, 1,
1.440227, 1.07411, 0.4101968, 1, 0, 0.4196078, 1,
1.454672, 0.04091329, 0.3790468, 1, 0, 0.4156863, 1,
1.461332, -0.08403461, 1.708837, 1, 0, 0.4078431, 1,
1.463631, 1.066718, -0.1519567, 1, 0, 0.4039216, 1,
1.467901, 1.745231, 1.924101, 1, 0, 0.3960784, 1,
1.503116, -0.1669065, 2.129531, 1, 0, 0.3882353, 1,
1.503862, 0.09164595, 2.23489, 1, 0, 0.3843137, 1,
1.515699, 0.4572152, 3.775238, 1, 0, 0.3764706, 1,
1.519486, -1.302594, 2.438504, 1, 0, 0.372549, 1,
1.523458, -0.1882595, 2.798631, 1, 0, 0.3647059, 1,
1.555462, 0.1033907, 0.8031466, 1, 0, 0.3607843, 1,
1.561797, -0.7028584, 3.073378, 1, 0, 0.3529412, 1,
1.566543, 0.1041043, 0.862657, 1, 0, 0.3490196, 1,
1.568287, 1.02283, 1.741124, 1, 0, 0.3411765, 1,
1.596116, 1.711511, -0.7220264, 1, 0, 0.3372549, 1,
1.600139, 0.2708024, 0.3360775, 1, 0, 0.3294118, 1,
1.61637, 0.3548241, -0.8359857, 1, 0, 0.3254902, 1,
1.626757, -0.07221992, 1.904145, 1, 0, 0.3176471, 1,
1.629254, -0.7706051, 2.438419, 1, 0, 0.3137255, 1,
1.629303, -1.534375, 3.313154, 1, 0, 0.3058824, 1,
1.635662, 0.001423678, 1.984345, 1, 0, 0.2980392, 1,
1.637141, 0.136628, 0.6553741, 1, 0, 0.2941177, 1,
1.648989, 1.581755, -0.04396387, 1, 0, 0.2862745, 1,
1.653308, 1.218236, 0.7033021, 1, 0, 0.282353, 1,
1.664596, -0.9810758, 3.657945, 1, 0, 0.2745098, 1,
1.665359, -1.777461, 1.011033, 1, 0, 0.2705882, 1,
1.668515, -1.73608, 2.387483, 1, 0, 0.2627451, 1,
1.682858, -0.06999233, 3.335897, 1, 0, 0.2588235, 1,
1.687359, -0.1364673, 2.692747, 1, 0, 0.2509804, 1,
1.704857, 0.2641919, 1.932432, 1, 0, 0.2470588, 1,
1.706973, -0.08330434, 0.9570201, 1, 0, 0.2392157, 1,
1.711732, -0.9398578, 2.585301, 1, 0, 0.2352941, 1,
1.729705, -0.1202814, 1.416999, 1, 0, 0.227451, 1,
1.730021, 1.17922, 1.798139, 1, 0, 0.2235294, 1,
1.744632, -0.2430873, 1.088814, 1, 0, 0.2156863, 1,
1.747059, 0.8363831, 0.8434682, 1, 0, 0.2117647, 1,
1.758436, -1.381691, 2.623581, 1, 0, 0.2039216, 1,
1.762396, -0.3320138, -0.1223839, 1, 0, 0.1960784, 1,
1.767088, 0.7309388, 0.615818, 1, 0, 0.1921569, 1,
1.770653, -0.1432742, 0.5926319, 1, 0, 0.1843137, 1,
1.780205, -0.4288006, 1.339806, 1, 0, 0.1803922, 1,
1.799188, -1.070242, 1.983932, 1, 0, 0.172549, 1,
1.818817, -1.906343, 1.535924, 1, 0, 0.1686275, 1,
1.839385, 0.9833889, 1.825264, 1, 0, 0.1607843, 1,
1.850486, -0.8999859, -0.312034, 1, 0, 0.1568628, 1,
1.860604, -2.050486, 2.320782, 1, 0, 0.1490196, 1,
1.881636, -0.5562577, 1.038074, 1, 0, 0.145098, 1,
1.882389, -0.2581058, 1.88502, 1, 0, 0.1372549, 1,
1.901745, 1.641283, 3.223479, 1, 0, 0.1333333, 1,
1.91225, 0.6613768, 2.390169, 1, 0, 0.1254902, 1,
1.934504, 0.374065, 2.75741, 1, 0, 0.1215686, 1,
1.941367, 1.076123, 0.8075863, 1, 0, 0.1137255, 1,
1.980489, -0.496792, 2.531593, 1, 0, 0.1098039, 1,
2.108371, 0.3185551, 1.622584, 1, 0, 0.1019608, 1,
2.122819, 0.1201652, 0.8249468, 1, 0, 0.09411765, 1,
2.133184, 1.625331, 0.4139543, 1, 0, 0.09019608, 1,
2.142788, 0.200164, 0.3311745, 1, 0, 0.08235294, 1,
2.181269, -0.2722189, 1.741926, 1, 0, 0.07843138, 1,
2.183129, 2.204171, 0.7209101, 1, 0, 0.07058824, 1,
2.205744, 0.4046535, 4.009642, 1, 0, 0.06666667, 1,
2.232983, 2.434324, 0.3556709, 1, 0, 0.05882353, 1,
2.242658, -0.2764105, 1.035438, 1, 0, 0.05490196, 1,
2.303698, -0.06248088, 1.057478, 1, 0, 0.04705882, 1,
2.332371, -0.3406252, 1.631544, 1, 0, 0.04313726, 1,
2.534961, -0.44338, 3.72831, 1, 0, 0.03529412, 1,
2.751932, -1.284238, 1.450868, 1, 0, 0.03137255, 1,
2.792556, -0.1408431, 1.079405, 1, 0, 0.02352941, 1,
2.962408, -0.303838, 1.226529, 1, 0, 0.01960784, 1,
3.153987, -0.3370418, 1.528059, 1, 0, 0.01176471, 1,
3.503826, -1.441041, 1.295265, 1, 0, 0.007843138, 1
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
0.2293153, -4.074789, -7.579017, 0, -0.5, 0.5, 0.5,
0.2293153, -4.074789, -7.579017, 1, -0.5, 0.5, 0.5,
0.2293153, -4.074789, -7.579017, 1, 1.5, 0.5, 0.5,
0.2293153, -4.074789, -7.579017, 0, 1.5, 0.5, 0.5
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
-4.155255, -0.01666784, -7.579017, 0, -0.5, 0.5, 0.5,
-4.155255, -0.01666784, -7.579017, 1, -0.5, 0.5, 0.5,
-4.155255, -0.01666784, -7.579017, 1, 1.5, 0.5, 0.5,
-4.155255, -0.01666784, -7.579017, 0, 1.5, 0.5, 0.5
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
-4.155255, -4.074789, -0.2136147, 0, -0.5, 0.5, 0.5,
-4.155255, -4.074789, -0.2136147, 1, -0.5, 0.5, 0.5,
-4.155255, -4.074789, -0.2136147, 1, 1.5, 0.5, 0.5,
-4.155255, -4.074789, -0.2136147, 0, 1.5, 0.5, 0.5
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
-3, -3.138299, -5.879308,
3, -3.138299, -5.879308,
-3, -3.138299, -5.879308,
-3, -3.294381, -6.162593,
-2, -3.138299, -5.879308,
-2, -3.294381, -6.162593,
-1, -3.138299, -5.879308,
-1, -3.294381, -6.162593,
0, -3.138299, -5.879308,
0, -3.294381, -6.162593,
1, -3.138299, -5.879308,
1, -3.294381, -6.162593,
2, -3.138299, -5.879308,
2, -3.294381, -6.162593,
3, -3.138299, -5.879308,
3, -3.294381, -6.162593
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
-3, -3.606544, -6.729163, 0, -0.5, 0.5, 0.5,
-3, -3.606544, -6.729163, 1, -0.5, 0.5, 0.5,
-3, -3.606544, -6.729163, 1, 1.5, 0.5, 0.5,
-3, -3.606544, -6.729163, 0, 1.5, 0.5, 0.5,
-2, -3.606544, -6.729163, 0, -0.5, 0.5, 0.5,
-2, -3.606544, -6.729163, 1, -0.5, 0.5, 0.5,
-2, -3.606544, -6.729163, 1, 1.5, 0.5, 0.5,
-2, -3.606544, -6.729163, 0, 1.5, 0.5, 0.5,
-1, -3.606544, -6.729163, 0, -0.5, 0.5, 0.5,
-1, -3.606544, -6.729163, 1, -0.5, 0.5, 0.5,
-1, -3.606544, -6.729163, 1, 1.5, 0.5, 0.5,
-1, -3.606544, -6.729163, 0, 1.5, 0.5, 0.5,
0, -3.606544, -6.729163, 0, -0.5, 0.5, 0.5,
0, -3.606544, -6.729163, 1, -0.5, 0.5, 0.5,
0, -3.606544, -6.729163, 1, 1.5, 0.5, 0.5,
0, -3.606544, -6.729163, 0, 1.5, 0.5, 0.5,
1, -3.606544, -6.729163, 0, -0.5, 0.5, 0.5,
1, -3.606544, -6.729163, 1, -0.5, 0.5, 0.5,
1, -3.606544, -6.729163, 1, 1.5, 0.5, 0.5,
1, -3.606544, -6.729163, 0, 1.5, 0.5, 0.5,
2, -3.606544, -6.729163, 0, -0.5, 0.5, 0.5,
2, -3.606544, -6.729163, 1, -0.5, 0.5, 0.5,
2, -3.606544, -6.729163, 1, 1.5, 0.5, 0.5,
2, -3.606544, -6.729163, 0, 1.5, 0.5, 0.5,
3, -3.606544, -6.729163, 0, -0.5, 0.5, 0.5,
3, -3.606544, -6.729163, 1, -0.5, 0.5, 0.5,
3, -3.606544, -6.729163, 1, 1.5, 0.5, 0.5,
3, -3.606544, -6.729163, 0, 1.5, 0.5, 0.5
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
-3.143431, -3, -5.879308,
-3.143431, 3, -5.879308,
-3.143431, -3, -5.879308,
-3.312068, -3, -6.162593,
-3.143431, -2, -5.879308,
-3.312068, -2, -6.162593,
-3.143431, -1, -5.879308,
-3.312068, -1, -6.162593,
-3.143431, 0, -5.879308,
-3.312068, 0, -6.162593,
-3.143431, 1, -5.879308,
-3.312068, 1, -6.162593,
-3.143431, 2, -5.879308,
-3.312068, 2, -6.162593,
-3.143431, 3, -5.879308,
-3.312068, 3, -6.162593
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
-3.649343, -3, -6.729163, 0, -0.5, 0.5, 0.5,
-3.649343, -3, -6.729163, 1, -0.5, 0.5, 0.5,
-3.649343, -3, -6.729163, 1, 1.5, 0.5, 0.5,
-3.649343, -3, -6.729163, 0, 1.5, 0.5, 0.5,
-3.649343, -2, -6.729163, 0, -0.5, 0.5, 0.5,
-3.649343, -2, -6.729163, 1, -0.5, 0.5, 0.5,
-3.649343, -2, -6.729163, 1, 1.5, 0.5, 0.5,
-3.649343, -2, -6.729163, 0, 1.5, 0.5, 0.5,
-3.649343, -1, -6.729163, 0, -0.5, 0.5, 0.5,
-3.649343, -1, -6.729163, 1, -0.5, 0.5, 0.5,
-3.649343, -1, -6.729163, 1, 1.5, 0.5, 0.5,
-3.649343, -1, -6.729163, 0, 1.5, 0.5, 0.5,
-3.649343, 0, -6.729163, 0, -0.5, 0.5, 0.5,
-3.649343, 0, -6.729163, 1, -0.5, 0.5, 0.5,
-3.649343, 0, -6.729163, 1, 1.5, 0.5, 0.5,
-3.649343, 0, -6.729163, 0, 1.5, 0.5, 0.5,
-3.649343, 1, -6.729163, 0, -0.5, 0.5, 0.5,
-3.649343, 1, -6.729163, 1, -0.5, 0.5, 0.5,
-3.649343, 1, -6.729163, 1, 1.5, 0.5, 0.5,
-3.649343, 1, -6.729163, 0, 1.5, 0.5, 0.5,
-3.649343, 2, -6.729163, 0, -0.5, 0.5, 0.5,
-3.649343, 2, -6.729163, 1, -0.5, 0.5, 0.5,
-3.649343, 2, -6.729163, 1, 1.5, 0.5, 0.5,
-3.649343, 2, -6.729163, 0, 1.5, 0.5, 0.5,
-3.649343, 3, -6.729163, 0, -0.5, 0.5, 0.5,
-3.649343, 3, -6.729163, 1, -0.5, 0.5, 0.5,
-3.649343, 3, -6.729163, 1, 1.5, 0.5, 0.5,
-3.649343, 3, -6.729163, 0, 1.5, 0.5, 0.5
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
-3.143431, -3.138299, -4,
-3.143431, -3.138299, 4,
-3.143431, -3.138299, -4,
-3.312068, -3.294381, -4,
-3.143431, -3.138299, -2,
-3.312068, -3.294381, -2,
-3.143431, -3.138299, 0,
-3.312068, -3.294381, 0,
-3.143431, -3.138299, 2,
-3.312068, -3.294381, 2,
-3.143431, -3.138299, 4,
-3.312068, -3.294381, 4
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
-3.649343, -3.606544, -4, 0, -0.5, 0.5, 0.5,
-3.649343, -3.606544, -4, 1, -0.5, 0.5, 0.5,
-3.649343, -3.606544, -4, 1, 1.5, 0.5, 0.5,
-3.649343, -3.606544, -4, 0, 1.5, 0.5, 0.5,
-3.649343, -3.606544, -2, 0, -0.5, 0.5, 0.5,
-3.649343, -3.606544, -2, 1, -0.5, 0.5, 0.5,
-3.649343, -3.606544, -2, 1, 1.5, 0.5, 0.5,
-3.649343, -3.606544, -2, 0, 1.5, 0.5, 0.5,
-3.649343, -3.606544, 0, 0, -0.5, 0.5, 0.5,
-3.649343, -3.606544, 0, 1, -0.5, 0.5, 0.5,
-3.649343, -3.606544, 0, 1, 1.5, 0.5, 0.5,
-3.649343, -3.606544, 0, 0, 1.5, 0.5, 0.5,
-3.649343, -3.606544, 2, 0, -0.5, 0.5, 0.5,
-3.649343, -3.606544, 2, 1, -0.5, 0.5, 0.5,
-3.649343, -3.606544, 2, 1, 1.5, 0.5, 0.5,
-3.649343, -3.606544, 2, 0, 1.5, 0.5, 0.5,
-3.649343, -3.606544, 4, 0, -0.5, 0.5, 0.5,
-3.649343, -3.606544, 4, 1, -0.5, 0.5, 0.5,
-3.649343, -3.606544, 4, 1, 1.5, 0.5, 0.5,
-3.649343, -3.606544, 4, 0, 1.5, 0.5, 0.5
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
-3.143431, -3.138299, -5.879308,
-3.143431, 3.104964, -5.879308,
-3.143431, -3.138299, 5.452079,
-3.143431, 3.104964, 5.452079,
-3.143431, -3.138299, -5.879308,
-3.143431, -3.138299, 5.452079,
-3.143431, 3.104964, -5.879308,
-3.143431, 3.104964, 5.452079,
-3.143431, -3.138299, -5.879308,
3.602062, -3.138299, -5.879308,
-3.143431, -3.138299, 5.452079,
3.602062, -3.138299, 5.452079,
-3.143431, 3.104964, -5.879308,
3.602062, 3.104964, -5.879308,
-3.143431, 3.104964, 5.452079,
3.602062, 3.104964, 5.452079,
3.602062, -3.138299, -5.879308,
3.602062, 3.104964, -5.879308,
3.602062, -3.138299, 5.452079,
3.602062, 3.104964, 5.452079,
3.602062, -3.138299, -5.879308,
3.602062, -3.138299, 5.452079,
3.602062, 3.104964, -5.879308,
3.602062, 3.104964, 5.452079
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
var radius = 7.791001;
var distance = 34.66304;
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
mvMatrix.translate( -0.2293153, 0.01666784, 0.2136147 );
mvMatrix.scale( 1.248802, 1.34926, 0.7434025 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66304);
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
Diphenylmethanol<-read.table("Diphenylmethanol.xyz", skip=1)
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
-3.045196, -0.5306215, -4.221306, 0, 0, 1, 1, 1,
-2.945662, -0.8854504, -2.358879, 1, 0, 0, 1, 1,
-2.642573, 0.9048326, -1.164612, 1, 0, 0, 1, 1,
-2.586885, 1.094666, 0.8035673, 1, 0, 0, 1, 1,
-2.574089, 2.484525, -2.097771, 1, 0, 0, 1, 1,
-2.537616, -1.010935, -2.085973, 1, 0, 0, 1, 1,
-2.439375, 1.180644, -0.2353868, 0, 0, 0, 1, 1,
-2.375722, 0.9697805, -0.665526, 0, 0, 0, 1, 1,
-2.267213, 0.3834338, -2.896151, 0, 0, 0, 1, 1,
-2.228582, -0.385879, -1.929229, 0, 0, 0, 1, 1,
-2.215398, 1.088233, -0.3976365, 0, 0, 0, 1, 1,
-2.214908, -0.7463012, -2.887491, 0, 0, 0, 1, 1,
-2.209609, -0.7662585, -3.232949, 0, 0, 0, 1, 1,
-2.185269, -0.2995731, -2.468451, 1, 1, 1, 1, 1,
-2.171528, -0.6851003, -2.144958, 1, 1, 1, 1, 1,
-2.147338, 1.125497, 0.1282832, 1, 1, 1, 1, 1,
-1.937846, 0.3638496, -1.994399, 1, 1, 1, 1, 1,
-1.933402, -0.5366589, 0.3374617, 1, 1, 1, 1, 1,
-1.889253, 0.7160491, -1.583248, 1, 1, 1, 1, 1,
-1.829287, 0.5976748, -0.9456774, 1, 1, 1, 1, 1,
-1.816881, 0.05960023, -2.217367, 1, 1, 1, 1, 1,
-1.815549, -0.9595635, -0.8078302, 1, 1, 1, 1, 1,
-1.771973, -0.07005309, -4.072989, 1, 1, 1, 1, 1,
-1.74452, -0.3003969, -1.122855, 1, 1, 1, 1, 1,
-1.744239, -1.868063, -3.81443, 1, 1, 1, 1, 1,
-1.739846, -1.034933, -0.8751552, 1, 1, 1, 1, 1,
-1.736382, -0.6106707, -1.435541, 1, 1, 1, 1, 1,
-1.721159, -3.047378, -2.977658, 1, 1, 1, 1, 1,
-1.720527, -0.1609809, 0.2127978, 0, 0, 1, 1, 1,
-1.715024, -1.769561, -0.4911506, 1, 0, 0, 1, 1,
-1.714471, -0.6733761, -1.211862, 1, 0, 0, 1, 1,
-1.713339, -0.3399225, -2.9697, 1, 0, 0, 1, 1,
-1.68562, 0.01596933, -0.9050105, 1, 0, 0, 1, 1,
-1.683216, 2.105407, -1.353999, 1, 0, 0, 1, 1,
-1.681832, -0.9120243, -0.9142744, 0, 0, 0, 1, 1,
-1.676585, 0.9449479, -2.043505, 0, 0, 0, 1, 1,
-1.668812, -0.9719636, -0.6882023, 0, 0, 0, 1, 1,
-1.668773, -0.8310667, -2.70424, 0, 0, 0, 1, 1,
-1.664679, -0.5985681, -1.131091, 0, 0, 0, 1, 1,
-1.651037, -0.5637155, -2.438152, 0, 0, 0, 1, 1,
-1.644859, 0.6157489, -1.503142, 0, 0, 0, 1, 1,
-1.643536, 0.4438773, -1.314258, 1, 1, 1, 1, 1,
-1.633736, -0.3447708, 0.6988937, 1, 1, 1, 1, 1,
-1.632354, 0.6803246, -0.503709, 1, 1, 1, 1, 1,
-1.62987, -0.908094, -4.487654, 1, 1, 1, 1, 1,
-1.628939, -0.1122823, -0.3576336, 1, 1, 1, 1, 1,
-1.607545, -1.162491, -2.778641, 1, 1, 1, 1, 1,
-1.60684, -1.108177, -2.150215, 1, 1, 1, 1, 1,
-1.596951, 1.30968, -3.11915, 1, 1, 1, 1, 1,
-1.595502, -0.2433646, -1.113311, 1, 1, 1, 1, 1,
-1.592513, -0.9194617, -1.573436, 1, 1, 1, 1, 1,
-1.585497, -0.02220451, 0.5583355, 1, 1, 1, 1, 1,
-1.56899, -0.3134492, -3.121794, 1, 1, 1, 1, 1,
-1.567362, 0.6175171, -0.3978743, 1, 1, 1, 1, 1,
-1.565798, -0.6146214, -1.641214, 1, 1, 1, 1, 1,
-1.55767, 0.2185262, -1.102258, 1, 1, 1, 1, 1,
-1.553836, -0.6770471, -3.643838, 0, 0, 1, 1, 1,
-1.551129, -0.3830443, -2.077701, 1, 0, 0, 1, 1,
-1.540522, -1.086857, -0.1628123, 1, 0, 0, 1, 1,
-1.538624, 0.4739504, -1.966018, 1, 0, 0, 1, 1,
-1.529171, -0.5282631, -0.7382768, 1, 0, 0, 1, 1,
-1.51527, 0.6213045, 1.608305, 1, 0, 0, 1, 1,
-1.510312, -0.5356659, -0.5936124, 0, 0, 0, 1, 1,
-1.492005, -0.2431862, -0.4640991, 0, 0, 0, 1, 1,
-1.482104, 1.947067, -2.070248, 0, 0, 0, 1, 1,
-1.464833, -1.183683, -0.3586241, 0, 0, 0, 1, 1,
-1.45491, -0.8725008, -1.549889, 0, 0, 0, 1, 1,
-1.44259, -0.6736367, -2.884809, 0, 0, 0, 1, 1,
-1.43149, 0.9103297, -0.5910434, 0, 0, 0, 1, 1,
-1.421263, 0.7494886, -1.857614, 1, 1, 1, 1, 1,
-1.420892, -0.2689755, -3.980564, 1, 1, 1, 1, 1,
-1.417389, 2.154688, -0.7558095, 1, 1, 1, 1, 1,
-1.40861, -0.2463623, 0.8362268, 1, 1, 1, 1, 1,
-1.408565, -0.9888178, -1.924904, 1, 1, 1, 1, 1,
-1.403125, 0.8802428, -0.4152331, 1, 1, 1, 1, 1,
-1.389826, 0.2463792, 0.2420948, 1, 1, 1, 1, 1,
-1.388878, -2.200496, -4.04383, 1, 1, 1, 1, 1,
-1.3862, -1.266644, -2.674522, 1, 1, 1, 1, 1,
-1.365868, 1.311545, -1.299902, 1, 1, 1, 1, 1,
-1.349753, 0.656275, -0.242237, 1, 1, 1, 1, 1,
-1.337337, 0.5980161, -1.731691, 1, 1, 1, 1, 1,
-1.334551, -0.3512364, -2.557023, 1, 1, 1, 1, 1,
-1.330349, 0.8082991, -1.259022, 1, 1, 1, 1, 1,
-1.328503, -0.3380755, -1.96585, 1, 1, 1, 1, 1,
-1.299727, -0.4839742, -0.6009341, 0, 0, 1, 1, 1,
-1.299067, -1.304852, -1.397566, 1, 0, 0, 1, 1,
-1.296739, 1.781159, -0.7472938, 1, 0, 0, 1, 1,
-1.289393, 1.30522, 1.138386, 1, 0, 0, 1, 1,
-1.28923, 0.4868713, -1.23344, 1, 0, 0, 1, 1,
-1.286798, 1.32625, -0.9428496, 1, 0, 0, 1, 1,
-1.284049, 0.3397136, -0.7091843, 0, 0, 0, 1, 1,
-1.279879, -1.880182, -2.361097, 0, 0, 0, 1, 1,
-1.275633, 1.420222, -0.689241, 0, 0, 0, 1, 1,
-1.271828, -1.136895, -1.511089, 0, 0, 0, 1, 1,
-1.255675, -0.1744434, -1.478812, 0, 0, 0, 1, 1,
-1.24104, 1.5961, 0.4611922, 0, 0, 0, 1, 1,
-1.240594, -0.8687441, -3.833336, 0, 0, 0, 1, 1,
-1.234763, 0.4642747, 0.6674647, 1, 1, 1, 1, 1,
-1.222422, 1.813613, -1.664194, 1, 1, 1, 1, 1,
-1.220996, 0.05652134, -1.714258, 1, 1, 1, 1, 1,
-1.210395, 1.167027, 0.5791345, 1, 1, 1, 1, 1,
-1.208701, -0.8734434, -3.202874, 1, 1, 1, 1, 1,
-1.206469, 0.2319527, -0.06444848, 1, 1, 1, 1, 1,
-1.200823, -1.215019, -2.551149, 1, 1, 1, 1, 1,
-1.19943, 1.456314, -1.879817, 1, 1, 1, 1, 1,
-1.196701, -0.2143463, -1.47825, 1, 1, 1, 1, 1,
-1.193217, 0.4624563, 0.9980346, 1, 1, 1, 1, 1,
-1.18229, -0.8318549, -1.111068, 1, 1, 1, 1, 1,
-1.18202, 0.05422666, -2.755203, 1, 1, 1, 1, 1,
-1.175469, -0.5743626, -0.3897272, 1, 1, 1, 1, 1,
-1.174109, 0.4794157, -1.603389, 1, 1, 1, 1, 1,
-1.173444, 0.5205478, -0.8029265, 1, 1, 1, 1, 1,
-1.171677, -0.5608267, -0.8039891, 0, 0, 1, 1, 1,
-1.163671, 1.089123, -0.7323446, 1, 0, 0, 1, 1,
-1.16096, 1.499434, -1.261675, 1, 0, 0, 1, 1,
-1.158291, 0.2506466, -2.002689, 1, 0, 0, 1, 1,
-1.153509, 0.258423, -2.038837, 1, 0, 0, 1, 1,
-1.143146, 0.3374513, -1.129716, 1, 0, 0, 1, 1,
-1.142946, 0.2262653, -0.4169298, 0, 0, 0, 1, 1,
-1.1419, 2.020079, -0.7706988, 0, 0, 0, 1, 1,
-1.140702, -1.087736, -3.18109, 0, 0, 0, 1, 1,
-1.137262, -0.1304144, -3.434272, 0, 0, 0, 1, 1,
-1.132095, -1.206601, -2.049967, 0, 0, 0, 1, 1,
-1.129699, -0.563427, -2.640846, 0, 0, 0, 1, 1,
-1.121951, -0.1293542, -1.999517, 0, 0, 0, 1, 1,
-1.121586, 0.7174009, -2.084039, 1, 1, 1, 1, 1,
-1.117573, -0.1042738, -1.58378, 1, 1, 1, 1, 1,
-1.115107, -0.1531935, -3.78691, 1, 1, 1, 1, 1,
-1.111219, -0.4843752, -3.460693, 1, 1, 1, 1, 1,
-1.107875, -0.02552412, -3.584771, 1, 1, 1, 1, 1,
-1.102355, 0.6675844, -1.424095, 1, 1, 1, 1, 1,
-1.100286, -1.069976, -2.042769, 1, 1, 1, 1, 1,
-1.090844, 0.2234282, -1.261424, 1, 1, 1, 1, 1,
-1.090703, -0.4919398, -0.2960266, 1, 1, 1, 1, 1,
-1.090309, -0.5308912, -0.5328432, 1, 1, 1, 1, 1,
-1.087763, 1.349657, -0.357875, 1, 1, 1, 1, 1,
-1.086766, -0.2962314, -4.860572, 1, 1, 1, 1, 1,
-1.084929, 2.258661, -1.709754, 1, 1, 1, 1, 1,
-1.084189, -0.4244142, -2.714035, 1, 1, 1, 1, 1,
-1.082726, 1.094915, -2.280861, 1, 1, 1, 1, 1,
-1.073969, -0.4111669, -1.758567, 0, 0, 1, 1, 1,
-1.071156, 1.969173, -1.008626, 1, 0, 0, 1, 1,
-1.067157, -0.2788148, -3.006966, 1, 0, 0, 1, 1,
-1.061364, 0.459605, -3.191642, 1, 0, 0, 1, 1,
-1.058684, 0.30908, -1.228944, 1, 0, 0, 1, 1,
-1.056766, 0.9378514, -1.204949, 1, 0, 0, 1, 1,
-1.054056, -0.34232, -1.816016, 0, 0, 0, 1, 1,
-1.049773, -1.723565, -0.9064291, 0, 0, 0, 1, 1,
-1.048227, -1.958568, -2.385597, 0, 0, 0, 1, 1,
-1.035068, -0.2082002, -3.494639, 0, 0, 0, 1, 1,
-1.030822, 0.5089743, -0.03905224, 0, 0, 0, 1, 1,
-1.024339, 0.3701824, 0.02657507, 0, 0, 0, 1, 1,
-1.01831, 1.136822, -1.797405, 0, 0, 0, 1, 1,
-1.015815, 0.6929531, -0.7915968, 1, 1, 1, 1, 1,
-1.00928, 2.502461, 1.602409, 1, 1, 1, 1, 1,
-1.00813, 0.8043911, -0.7917152, 1, 1, 1, 1, 1,
-1.00706, 0.1428903, -1.295676, 1, 1, 1, 1, 1,
-1.003543, 0.6140632, 0.6786054, 1, 1, 1, 1, 1,
-1.003489, -0.7363292, -1.214688, 1, 1, 1, 1, 1,
-1.003478, 1.122464, -0.780359, 1, 1, 1, 1, 1,
-1.001263, -1.615038, -2.864709, 1, 1, 1, 1, 1,
-1.000824, 1.580635, 0.6782143, 1, 1, 1, 1, 1,
-0.9984968, -0.9833355, -3.266339, 1, 1, 1, 1, 1,
-0.9984562, 0.6497291, -1.150595, 1, 1, 1, 1, 1,
-0.9984466, -0.6344444, -1.543062, 1, 1, 1, 1, 1,
-0.9975574, 1.784481, 1.166666, 1, 1, 1, 1, 1,
-0.9956645, -0.5709823, -2.681491, 1, 1, 1, 1, 1,
-0.9937829, 0.9232442, 0.2214111, 1, 1, 1, 1, 1,
-0.9879215, 0.6529229, -1.356113, 0, 0, 1, 1, 1,
-0.9836657, -0.1688118, -2.164718, 1, 0, 0, 1, 1,
-0.9810514, -0.04290077, -0.9562649, 1, 0, 0, 1, 1,
-0.977243, -0.4386978, -0.9024578, 1, 0, 0, 1, 1,
-0.9772047, 0.01560564, -1.782722, 1, 0, 0, 1, 1,
-0.9695621, 1.533734, -1.977411, 1, 0, 0, 1, 1,
-0.9689699, -1.413028, -3.036874, 0, 0, 0, 1, 1,
-0.964977, 1.150485, 1.320287, 0, 0, 0, 1, 1,
-0.9595206, 0.6562318, -1.202336, 0, 0, 0, 1, 1,
-0.9592531, 1.440669, -2.273844, 0, 0, 0, 1, 1,
-0.9568914, 0.07930038, -0.8536705, 0, 0, 0, 1, 1,
-0.9560612, -1.910312, -3.179893, 0, 0, 0, 1, 1,
-0.949771, -2.651654, -4.09865, 0, 0, 0, 1, 1,
-0.9454222, 0.3553204, -1.967734, 1, 1, 1, 1, 1,
-0.9382778, 0.9576768, -2.020139, 1, 1, 1, 1, 1,
-0.9316501, 0.01384486, -0.02779133, 1, 1, 1, 1, 1,
-0.9255977, -1.074917, -1.335916, 1, 1, 1, 1, 1,
-0.9198958, 0.4915985, -1.552168, 1, 1, 1, 1, 1,
-0.9122423, -0.6187292, -1.280577, 1, 1, 1, 1, 1,
-0.9073361, -0.7386278, -3.879243, 1, 1, 1, 1, 1,
-0.9060802, -0.8249167, -2.651409, 1, 1, 1, 1, 1,
-0.9035091, -0.4530461, -0.8488197, 1, 1, 1, 1, 1,
-0.9031778, -0.04660796, -1.19002, 1, 1, 1, 1, 1,
-0.9024507, -0.4416781, -2.832748, 1, 1, 1, 1, 1,
-0.901853, -1.439503, -2.988084, 1, 1, 1, 1, 1,
-0.89457, -1.042035, -2.41602, 1, 1, 1, 1, 1,
-0.8930799, 0.07587859, -1.344813, 1, 1, 1, 1, 1,
-0.8924725, 0.6407409, -3.050025, 1, 1, 1, 1, 1,
-0.8917167, -1.127152, -1.775143, 0, 0, 1, 1, 1,
-0.8878562, 0.8812479, -2.225469, 1, 0, 0, 1, 1,
-0.8870882, 0.587928, -0.7050556, 1, 0, 0, 1, 1,
-0.8855206, -0.538752, -1.926924, 1, 0, 0, 1, 1,
-0.8839649, -1.051711, -2.047982, 1, 0, 0, 1, 1,
-0.8834187, 0.6880485, -0.07239322, 1, 0, 0, 1, 1,
-0.8829592, -0.8408151, -1.428449, 0, 0, 0, 1, 1,
-0.880379, 0.3722413, 0.2012484, 0, 0, 0, 1, 1,
-0.877929, -0.8960143, -4.422394, 0, 0, 0, 1, 1,
-0.8721325, 0.8475823, -0.6713858, 0, 0, 0, 1, 1,
-0.8700001, -0.919034, -0.2893669, 0, 0, 0, 1, 1,
-0.8594741, -0.2644558, -2.25039, 0, 0, 0, 1, 1,
-0.8527687, -0.3272503, -1.331985, 0, 0, 0, 1, 1,
-0.8503262, -1.251148, -2.345279, 1, 1, 1, 1, 1,
-0.8483163, 0.2716964, -0.471586, 1, 1, 1, 1, 1,
-0.8424982, -0.3795705, -2.228985, 1, 1, 1, 1, 1,
-0.8399178, 0.701817, -0.5378075, 1, 1, 1, 1, 1,
-0.8372, 0.6577766, -2.243304, 1, 1, 1, 1, 1,
-0.8314345, -1.646503, -1.882563, 1, 1, 1, 1, 1,
-0.8306565, -1.306659, -0.7115701, 1, 1, 1, 1, 1,
-0.827761, 1.516736, 1.225175, 1, 1, 1, 1, 1,
-0.8242537, -0.2495209, -1.48573, 1, 1, 1, 1, 1,
-0.8138319, 0.6701192, -0.9276571, 1, 1, 1, 1, 1,
-0.80138, 0.1535547, -1.036723, 1, 1, 1, 1, 1,
-0.8004593, -1.981363, -1.988563, 1, 1, 1, 1, 1,
-0.7917409, -0.7420969, -0.3190993, 1, 1, 1, 1, 1,
-0.7877923, 0.3758031, -2.013968, 1, 1, 1, 1, 1,
-0.7868077, 1.485045, -0.4413066, 1, 1, 1, 1, 1,
-0.7806922, 0.3419835, -0.4824943, 0, 0, 1, 1, 1,
-0.778869, 0.01263439, -1.685051, 1, 0, 0, 1, 1,
-0.7762692, -0.7238846, -2.253637, 1, 0, 0, 1, 1,
-0.7706346, -0.02604337, -1.700339, 1, 0, 0, 1, 1,
-0.7625326, 0.05527911, -1.326809, 1, 0, 0, 1, 1,
-0.7621626, 0.101726, -1.032964, 1, 0, 0, 1, 1,
-0.7618315, -0.5127008, -2.699627, 0, 0, 0, 1, 1,
-0.7616044, -1.748665, -1.498069, 0, 0, 0, 1, 1,
-0.761577, 0.5363823, -1.446935, 0, 0, 0, 1, 1,
-0.7585815, 0.08443598, -3.596534, 0, 0, 0, 1, 1,
-0.7585748, 0.3750514, -0.1521633, 0, 0, 0, 1, 1,
-0.7583686, -0.304681, -2.845775, 0, 0, 0, 1, 1,
-0.7549146, 0.1091346, -1.139606, 0, 0, 0, 1, 1,
-0.754577, -0.3003167, -1.545755, 1, 1, 1, 1, 1,
-0.7502052, -2.464537, -1.987409, 1, 1, 1, 1, 1,
-0.7438923, -0.5769754, -0.5000466, 1, 1, 1, 1, 1,
-0.7392368, 1.121413, -2.143419, 1, 1, 1, 1, 1,
-0.7377456, -1.559523, -2.72807, 1, 1, 1, 1, 1,
-0.7372002, -0.1309401, -2.547651, 1, 1, 1, 1, 1,
-0.7358243, 0.3555105, -1.511373, 1, 1, 1, 1, 1,
-0.7337925, 0.5560811, 1.19966, 1, 1, 1, 1, 1,
-0.7305027, -0.1076296, -0.6308634, 1, 1, 1, 1, 1,
-0.726265, -0.3288004, -1.976988, 1, 1, 1, 1, 1,
-0.7206572, -0.5867048, -0.7971334, 1, 1, 1, 1, 1,
-0.7184513, 1.090968, -0.7323868, 1, 1, 1, 1, 1,
-0.7121436, 0.7817621, -2.177593, 1, 1, 1, 1, 1,
-0.7094945, -0.8620045, -0.5354577, 1, 1, 1, 1, 1,
-0.7093082, 0.5267263, -0.853287, 1, 1, 1, 1, 1,
-0.7088106, 0.5591761, -1.701804, 0, 0, 1, 1, 1,
-0.7081979, 1.061083, -1.269247, 1, 0, 0, 1, 1,
-0.7031839, -0.7035992, -1.823954, 1, 0, 0, 1, 1,
-0.7026853, -1.144135, -2.245597, 1, 0, 0, 1, 1,
-0.7018652, -0.6277359, -2.431218, 1, 0, 0, 1, 1,
-0.6998717, 0.3353986, -1.193779, 1, 0, 0, 1, 1,
-0.6934236, 0.8317884, 0.610747, 0, 0, 0, 1, 1,
-0.6792437, -0.9983573, -3.693985, 0, 0, 0, 1, 1,
-0.6730245, 1.153718, -0.001362058, 0, 0, 0, 1, 1,
-0.6729556, 0.03541899, -2.072929, 0, 0, 0, 1, 1,
-0.6686777, 1.568934, -1.352643, 0, 0, 0, 1, 1,
-0.6678286, 0.6143667, -2.262907, 0, 0, 0, 1, 1,
-0.666786, 0.6729038, -0.04208199, 0, 0, 0, 1, 1,
-0.6639648, 0.3695033, -1.691975, 1, 1, 1, 1, 1,
-0.6635987, 1.055825, -1.1512, 1, 1, 1, 1, 1,
-0.6633828, 1.288765, -1.577394, 1, 1, 1, 1, 1,
-0.660216, 0.925206, 0.6785458, 1, 1, 1, 1, 1,
-0.6588631, -0.2824516, -1.356008, 1, 1, 1, 1, 1,
-0.6577479, -0.3640911, -2.733835, 1, 1, 1, 1, 1,
-0.6550477, -1.251761, -2.338336, 1, 1, 1, 1, 1,
-0.6532682, -0.670746, -2.729163, 1, 1, 1, 1, 1,
-0.6505763, -0.2572448, -1.645742, 1, 1, 1, 1, 1,
-0.6500203, -0.5021853, -2.562127, 1, 1, 1, 1, 1,
-0.6487581, 0.5101044, -1.213965, 1, 1, 1, 1, 1,
-0.6486623, 0.104261, 0.2382102, 1, 1, 1, 1, 1,
-0.643365, -0.3327779, -2.784909, 1, 1, 1, 1, 1,
-0.6341808, -0.2455638, -1.811297, 1, 1, 1, 1, 1,
-0.6321444, -0.6454805, -3.385782, 1, 1, 1, 1, 1,
-0.6319395, -1.744855, -3.951239, 0, 0, 1, 1, 1,
-0.629523, 0.02708917, -1.016052, 1, 0, 0, 1, 1,
-0.6283526, -1.353199, -1.799126, 1, 0, 0, 1, 1,
-0.6282943, -0.3973314, -2.758424, 1, 0, 0, 1, 1,
-0.6267364, -1.324766, -1.965028, 1, 0, 0, 1, 1,
-0.6226028, 1.460803, -0.346563, 1, 0, 0, 1, 1,
-0.6207188, 0.9581873, -0.007954934, 0, 0, 0, 1, 1,
-0.6168276, 1.195568, -0.629891, 0, 0, 0, 1, 1,
-0.6159903, -1.803266, -5.714288, 0, 0, 0, 1, 1,
-0.6126209, -0.517131, -2.023768, 0, 0, 0, 1, 1,
-0.6108009, 0.03887277, -1.985048, 0, 0, 0, 1, 1,
-0.6033505, 0.4171238, -0.3094472, 0, 0, 0, 1, 1,
-0.6013405, -0.02040508, 0.2854647, 0, 0, 0, 1, 1,
-0.5922914, -1.276603, -4.142195, 1, 1, 1, 1, 1,
-0.5920126, 0.9713799, 0.4392372, 1, 1, 1, 1, 1,
-0.5913294, 0.3831427, -0.04567571, 1, 1, 1, 1, 1,
-0.5912138, -1.162003, -3.645252, 1, 1, 1, 1, 1,
-0.5873289, -1.305261, -1.727192, 1, 1, 1, 1, 1,
-0.5871527, -1.32991, -3.40045, 1, 1, 1, 1, 1,
-0.5776598, 0.2319811, -1.783952, 1, 1, 1, 1, 1,
-0.5768116, -0.2067629, -0.5267283, 1, 1, 1, 1, 1,
-0.5710998, -0.3593422, -2.704548, 1, 1, 1, 1, 1,
-0.5648025, -0.6096996, -2.468231, 1, 1, 1, 1, 1,
-0.5634273, 0.2073274, -1.080997, 1, 1, 1, 1, 1,
-0.5615001, -1.158205, -1.299659, 1, 1, 1, 1, 1,
-0.5599477, 0.2612772, -0.2457532, 1, 1, 1, 1, 1,
-0.5549994, -0.8135113, -2.414888, 1, 1, 1, 1, 1,
-0.5539362, 0.8390611, 1.005769, 1, 1, 1, 1, 1,
-0.5509375, 0.1243021, -1.483853, 0, 0, 1, 1, 1,
-0.5475757, 0.8853117, 0.8185374, 1, 0, 0, 1, 1,
-0.543322, 1.703066, -1.293477, 1, 0, 0, 1, 1,
-0.5432616, -1.040293, -2.779581, 1, 0, 0, 1, 1,
-0.5426141, -2.149095, -0.9219905, 1, 0, 0, 1, 1,
-0.539058, 0.2037718, 1.318877, 1, 0, 0, 1, 1,
-0.536466, -2.646618, -2.970149, 0, 0, 0, 1, 1,
-0.5362716, -1.024711, -3.973831, 0, 0, 0, 1, 1,
-0.5258845, 0.800302, -0.9084593, 0, 0, 0, 1, 1,
-0.5214189, 0.51219, -1.764376, 0, 0, 0, 1, 1,
-0.5202268, 0.7204311, 0.5293754, 0, 0, 0, 1, 1,
-0.5155162, 1.904782, -1.460559, 0, 0, 0, 1, 1,
-0.5101732, -0.8267701, -1.521443, 0, 0, 0, 1, 1,
-0.5082121, -0.3401186, -0.3655225, 1, 1, 1, 1, 1,
-0.503486, -0.3491706, -2.423613, 1, 1, 1, 1, 1,
-0.5026606, -1.050237, -4.301819, 1, 1, 1, 1, 1,
-0.4999446, 2.108822, 0.05478364, 1, 1, 1, 1, 1,
-0.4940411, -0.3360705, 0.09902129, 1, 1, 1, 1, 1,
-0.4910192, -0.8832597, -3.595838, 1, 1, 1, 1, 1,
-0.4842051, -0.9143173, -2.875372, 1, 1, 1, 1, 1,
-0.47697, -1.999361, -4.916935, 1, 1, 1, 1, 1,
-0.4760684, 1.18426, -1.0959, 1, 1, 1, 1, 1,
-0.4689443, -0.1493392, -2.266798, 1, 1, 1, 1, 1,
-0.4657799, 1.07544, -0.842989, 1, 1, 1, 1, 1,
-0.4637875, 1.777701, -0.3038189, 1, 1, 1, 1, 1,
-0.4607641, -1.310224, -3.011992, 1, 1, 1, 1, 1,
-0.4599281, -0.2060747, -0.9087317, 1, 1, 1, 1, 1,
-0.4598385, -0.9759362, -4.223522, 1, 1, 1, 1, 1,
-0.4596099, 1.354641, -1.451846, 0, 0, 1, 1, 1,
-0.4514706, 1.557777, 0.5338609, 1, 0, 0, 1, 1,
-0.4450725, 0.4103376, -0.1810175, 1, 0, 0, 1, 1,
-0.4435955, -0.7814586, -2.694538, 1, 0, 0, 1, 1,
-0.441629, -0.7384455, -3.258195, 1, 0, 0, 1, 1,
-0.4395143, -0.7155992, -2.818985, 1, 0, 0, 1, 1,
-0.4392597, 1.978574, 1.606754, 0, 0, 0, 1, 1,
-0.4376753, -0.2581597, -2.406687, 0, 0, 0, 1, 1,
-0.4343456, -1.03384, -3.296452, 0, 0, 0, 1, 1,
-0.4343153, -0.6421442, -3.14894, 0, 0, 0, 1, 1,
-0.430625, 0.06533388, -2.483474, 0, 0, 0, 1, 1,
-0.428159, -0.505814, -4.259294, 0, 0, 0, 1, 1,
-0.4278847, 0.05919032, -1.426572, 0, 0, 0, 1, 1,
-0.4264016, 0.5885339, -2.331458, 1, 1, 1, 1, 1,
-0.4211216, 0.6231253, -1.365853, 1, 1, 1, 1, 1,
-0.4201719, -1.608012, -2.121463, 1, 1, 1, 1, 1,
-0.4190154, -0.7453691, -1.252578, 1, 1, 1, 1, 1,
-0.4183311, -1.190151, -2.913908, 1, 1, 1, 1, 1,
-0.41716, -0.09076881, -1.426325, 1, 1, 1, 1, 1,
-0.4139086, 1.431135, 0.4419417, 1, 1, 1, 1, 1,
-0.4125727, 0.508617, -1.994151, 1, 1, 1, 1, 1,
-0.4119999, -0.3637898, -1.489004, 1, 1, 1, 1, 1,
-0.4078808, -0.017748, -0.3715151, 1, 1, 1, 1, 1,
-0.4061621, 0.1896155, -0.6022606, 1, 1, 1, 1, 1,
-0.4040219, 1.351521, 0.05972778, 1, 1, 1, 1, 1,
-0.4002184, -0.1183696, -3.420486, 1, 1, 1, 1, 1,
-0.399707, 1.099229, -0.9794686, 1, 1, 1, 1, 1,
-0.3972083, 1.150711, 0.08022872, 1, 1, 1, 1, 1,
-0.3948897, -0.9799721, -3.777503, 0, 0, 1, 1, 1,
-0.3942887, -1.288989, -1.990973, 1, 0, 0, 1, 1,
-0.3903731, 2.171955, 1.843011, 1, 0, 0, 1, 1,
-0.3879573, 0.8051689, -0.2076364, 1, 0, 0, 1, 1,
-0.3872696, 0.4486686, -0.4396205, 1, 0, 0, 1, 1,
-0.3852916, -1.319007, -3.73283, 1, 0, 0, 1, 1,
-0.3850576, -0.826188, -1.31626, 0, 0, 0, 1, 1,
-0.3794799, -1.057248, -1.623601, 0, 0, 0, 1, 1,
-0.3754238, 2.103739, -0.009661281, 0, 0, 0, 1, 1,
-0.372051, -1.448928, -4.936229, 0, 0, 0, 1, 1,
-0.3690699, -0.7805437, -3.369489, 0, 0, 0, 1, 1,
-0.3598939, -0.869292, -3.162483, 0, 0, 0, 1, 1,
-0.3526134, 0.2334605, -2.916311, 0, 0, 0, 1, 1,
-0.3501687, -0.998133, -2.088194, 1, 1, 1, 1, 1,
-0.3487472, -0.9917031, -3.978205, 1, 1, 1, 1, 1,
-0.3473071, -1.810505, -3.772918, 1, 1, 1, 1, 1,
-0.3410647, 0.2153421, -1.503258, 1, 1, 1, 1, 1,
-0.3373725, 0.6084106, -2.697708, 1, 1, 1, 1, 1,
-0.3319351, -0.8092182, -3.083838, 1, 1, 1, 1, 1,
-0.3284306, 0.5588881, -1.377779, 1, 1, 1, 1, 1,
-0.3274156, -0.7992561, -3.747989, 1, 1, 1, 1, 1,
-0.32479, -0.771852, -2.954747, 1, 1, 1, 1, 1,
-0.3246402, -1.847211, -1.339466, 1, 1, 1, 1, 1,
-0.3199029, -1.348458, -4.495388, 1, 1, 1, 1, 1,
-0.3159032, 0.1980174, 0.3630942, 1, 1, 1, 1, 1,
-0.3152749, 1.073096, 0.8675154, 1, 1, 1, 1, 1,
-0.3130744, -0.1025366, -0.5448858, 1, 1, 1, 1, 1,
-0.3115498, 0.5106283, -0.1413299, 1, 1, 1, 1, 1,
-0.311469, -0.4241877, -2.012393, 0, 0, 1, 1, 1,
-0.3063603, 0.6189311, 0.01653044, 1, 0, 0, 1, 1,
-0.3058681, -1.362743, -2.961937, 1, 0, 0, 1, 1,
-0.3038243, 1.019064, 1.183416, 1, 0, 0, 1, 1,
-0.2991525, -0.5930914, -1.980669, 1, 0, 0, 1, 1,
-0.2981565, -0.5513504, -4.155536, 1, 0, 0, 1, 1,
-0.2972696, -0.8247864, -3.496217, 0, 0, 0, 1, 1,
-0.2940719, -1.779888, -5.005397, 0, 0, 0, 1, 1,
-0.29281, -0.4157464, -4.858331, 0, 0, 0, 1, 1,
-0.2920419, 0.2827054, -1.289145, 0, 0, 0, 1, 1,
-0.2894399, 0.08286154, -1.414024, 0, 0, 0, 1, 1,
-0.2862576, 0.114428, 1.048115, 0, 0, 0, 1, 1,
-0.2853921, 0.6284513, 0.4109499, 0, 0, 0, 1, 1,
-0.2846723, -1.172975, -3.716733, 1, 1, 1, 1, 1,
-0.2819477, -0.4432314, -4.193854, 1, 1, 1, 1, 1,
-0.2750123, 0.05718929, -0.4419345, 1, 1, 1, 1, 1,
-0.2732812, -0.2976141, -2.371782, 1, 1, 1, 1, 1,
-0.2679167, 0.9126493, -0.7767442, 1, 1, 1, 1, 1,
-0.266651, -1.7499, -1.900645, 1, 1, 1, 1, 1,
-0.2640216, -0.7068055, -2.63799, 1, 1, 1, 1, 1,
-0.2610246, -0.3316874, -2.696525, 1, 1, 1, 1, 1,
-0.2600642, -1.519492, -4.38613, 1, 1, 1, 1, 1,
-0.2581207, 0.946821, -1.371918, 1, 1, 1, 1, 1,
-0.2578724, 0.7394959, -0.7909899, 1, 1, 1, 1, 1,
-0.2548411, 0.6279432, -0.01739259, 1, 1, 1, 1, 1,
-0.2540403, -0.7271297, -2.121484, 1, 1, 1, 1, 1,
-0.2523152, -0.5277935, -2.336613, 1, 1, 1, 1, 1,
-0.2511754, 0.131057, -1.6764, 1, 1, 1, 1, 1,
-0.248797, 0.2465008, -0.8852522, 0, 0, 1, 1, 1,
-0.2422421, 1.237914, -1.256899, 1, 0, 0, 1, 1,
-0.2421297, -1.857919, -2.185875, 1, 0, 0, 1, 1,
-0.2409132, -1.520485, -3.774131, 1, 0, 0, 1, 1,
-0.24048, 0.1122707, 0.4875482, 1, 0, 0, 1, 1,
-0.2383803, 0.3930975, -0.0709615, 1, 0, 0, 1, 1,
-0.2369761, -0.501745, -2.870472, 0, 0, 0, 1, 1,
-0.2363152, -0.2268962, -1.536037, 0, 0, 0, 1, 1,
-0.2316939, -0.2703558, -1.655841, 0, 0, 0, 1, 1,
-0.2293334, 0.9454991, 1.43298, 0, 0, 0, 1, 1,
-0.221985, 1.282547, -0.0369233, 0, 0, 0, 1, 1,
-0.2187862, 1.311222, -3.211007, 0, 0, 0, 1, 1,
-0.2178997, -1.482488, -4.644981, 0, 0, 0, 1, 1,
-0.2147316, 1.156789, -2.595223, 1, 1, 1, 1, 1,
-0.213699, -0.5266266, -3.881015, 1, 1, 1, 1, 1,
-0.213422, 1.093993, 0.107364, 1, 1, 1, 1, 1,
-0.2091902, 0.2426017, -0.2898135, 1, 1, 1, 1, 1,
-0.2049135, 0.6614157, -1.478783, 1, 1, 1, 1, 1,
-0.2047797, 0.0336462, -2.216386, 1, 1, 1, 1, 1,
-0.2002272, -0.8403615, -3.124858, 1, 1, 1, 1, 1,
-0.1986545, 0.4523609, 0.5962233, 1, 1, 1, 1, 1,
-0.1959164, -0.1156866, -2.602777, 1, 1, 1, 1, 1,
-0.1946236, 0.4831605, 0.4097732, 1, 1, 1, 1, 1,
-0.1941149, 0.3746337, -1.43295, 1, 1, 1, 1, 1,
-0.1916353, -0.7759717, -2.157565, 1, 1, 1, 1, 1,
-0.1898533, -1.009667, -2.997561, 1, 1, 1, 1, 1,
-0.1884225, -0.3832091, -2.508854, 1, 1, 1, 1, 1,
-0.1841596, 0.7726769, -0.511776, 1, 1, 1, 1, 1,
-0.1832221, -0.8375705, -3.406522, 0, 0, 1, 1, 1,
-0.1805716, -0.2306365, -2.245642, 1, 0, 0, 1, 1,
-0.1789315, 0.5021529, 0.6028805, 1, 0, 0, 1, 1,
-0.1780868, 0.9482698, -2.492526, 1, 0, 0, 1, 1,
-0.1761967, -0.3162219, -1.166402, 1, 0, 0, 1, 1,
-0.1758734, 1.475308, 0.2241164, 1, 0, 0, 1, 1,
-0.1732887, -1.150005, -4.028207, 0, 0, 0, 1, 1,
-0.1730193, -0.1033534, -2.587929, 0, 0, 0, 1, 1,
-0.1729216, -1.580258, -4.25123, 0, 0, 0, 1, 1,
-0.1656947, 0.2263677, -0.5264361, 0, 0, 0, 1, 1,
-0.1652848, 0.6576912, 0.8561208, 0, 0, 0, 1, 1,
-0.1614675, -0.2243576, -1.683635, 0, 0, 0, 1, 1,
-0.1533137, 0.5241889, -0.3361154, 0, 0, 0, 1, 1,
-0.1512843, -0.4447436, -2.382305, 1, 1, 1, 1, 1,
-0.1463649, -1.430035, -2.89743, 1, 1, 1, 1, 1,
-0.1418104, -0.6929199, -2.869674, 1, 1, 1, 1, 1,
-0.1397239, -0.8786697, -0.7709728, 1, 1, 1, 1, 1,
-0.1328983, -0.4094926, -3.345235, 1, 1, 1, 1, 1,
-0.1318954, 0.4931593, -0.04599985, 1, 1, 1, 1, 1,
-0.1309576, -0.04001977, -3.30815, 1, 1, 1, 1, 1,
-0.12962, 0.4588528, 1.105217, 1, 1, 1, 1, 1,
-0.1259041, 1.578096, -2.167898, 1, 1, 1, 1, 1,
-0.1231579, -1.351071, -3.371914, 1, 1, 1, 1, 1,
-0.120742, 0.1120656, 0.5010937, 1, 1, 1, 1, 1,
-0.1200838, -0.7713862, -3.406798, 1, 1, 1, 1, 1,
-0.1177012, -0.7271719, -2.211793, 1, 1, 1, 1, 1,
-0.1159852, 1.004351, 0.01318085, 1, 1, 1, 1, 1,
-0.1153326, -0.8893848, -3.047317, 1, 1, 1, 1, 1,
-0.112256, -0.08065694, -0.2794249, 0, 0, 1, 1, 1,
-0.1090478, -1.080805, -3.475688, 1, 0, 0, 1, 1,
-0.1081669, 0.241906, 0.08793818, 1, 0, 0, 1, 1,
-0.1030391, -0.596235, -2.478401, 1, 0, 0, 1, 1,
-0.1014596, -0.2957259, -2.253296, 1, 0, 0, 1, 1,
-0.09944198, -0.3636788, -3.299209, 1, 0, 0, 1, 1,
-0.09938519, -0.3379863, -2.956819, 0, 0, 0, 1, 1,
-0.0957868, 1.690662, -0.4137792, 0, 0, 0, 1, 1,
-0.09399801, -0.794765, -3.800971, 0, 0, 0, 1, 1,
-0.09268688, 1.211878, 0.609053, 0, 0, 0, 1, 1,
-0.08932662, 0.3299849, -1.300409, 0, 0, 0, 1, 1,
-0.08819696, 1.026085, 0.5056892, 0, 0, 0, 1, 1,
-0.08696045, -0.6017279, -3.249686, 0, 0, 0, 1, 1,
-0.08480677, -0.02659454, -1.330644, 1, 1, 1, 1, 1,
-0.0828575, -1.708208, -3.081162, 1, 1, 1, 1, 1,
-0.07985733, 0.2664008, -1.650485, 1, 1, 1, 1, 1,
-0.07365675, -0.2304704, -2.548702, 1, 1, 1, 1, 1,
-0.06864642, 0.5911645, -0.4073672, 1, 1, 1, 1, 1,
-0.0583168, -2.168028, -3.256594, 1, 1, 1, 1, 1,
-0.05702097, -1.449962, -3.012213, 1, 1, 1, 1, 1,
-0.04931488, -0.3786964, -3.284057, 1, 1, 1, 1, 1,
-0.04467089, -0.9606649, -3.7989, 1, 1, 1, 1, 1,
-0.04060213, 2.299046, 0.1088746, 1, 1, 1, 1, 1,
-0.03703658, 0.7200862, -1.72515, 1, 1, 1, 1, 1,
-0.0360877, -0.4074496, -5.01208, 1, 1, 1, 1, 1,
-0.03196009, 0.1215955, -0.04250001, 1, 1, 1, 1, 1,
-0.02902476, -1.152315, -3.755934, 1, 1, 1, 1, 1,
-0.02841797, 2.312422, -0.05196002, 1, 1, 1, 1, 1,
-0.02525029, -0.5607128, -4.700982, 0, 0, 1, 1, 1,
-0.01938541, 0.1534949, -0.4334244, 1, 0, 0, 1, 1,
-0.01360883, -0.8524829, -1.564427, 1, 0, 0, 1, 1,
-0.01130279, 0.5803026, -0.2409422, 1, 0, 0, 1, 1,
-0.01066382, 0.1360624, -0.2973458, 1, 0, 0, 1, 1,
-0.01002343, 2.313148, -0.4374881, 1, 0, 0, 1, 1,
-0.00970398, -2.643022, -2.150056, 0, 0, 0, 1, 1,
-0.007395655, 0.9005083, 0.1889127, 0, 0, 0, 1, 1,
-0.004114014, -0.4492023, -3.421307, 0, 0, 0, 1, 1,
-0.003750719, 0.3852101, 0.03044108, 0, 0, 0, 1, 1,
-0.001696935, -0.8650904, -3.559614, 0, 0, 0, 1, 1,
0.001867845, -0.8661102, 4.199811, 0, 0, 0, 1, 1,
0.002160781, 0.8188046, -1.356119, 0, 0, 0, 1, 1,
0.003161994, -0.2701523, 1.566088, 1, 1, 1, 1, 1,
0.004832365, -0.9058865, 1.717593, 1, 1, 1, 1, 1,
0.008808335, 0.7554686, 0.6381408, 1, 1, 1, 1, 1,
0.0097351, 1.453646, -0.2338175, 1, 1, 1, 1, 1,
0.0117313, -0.761394, 4.111991, 1, 1, 1, 1, 1,
0.0177184, -0.2539854, 2.221416, 1, 1, 1, 1, 1,
0.01784136, -0.2491803, 3.579836, 1, 1, 1, 1, 1,
0.01887544, 1.967489, -1.169974, 1, 1, 1, 1, 1,
0.02228638, 0.2117295, -0.50823, 1, 1, 1, 1, 1,
0.02609184, 1.251011, -0.6473579, 1, 1, 1, 1, 1,
0.02805489, 2.238766, -0.363191, 1, 1, 1, 1, 1,
0.03033747, 0.05622495, 0.7363434, 1, 1, 1, 1, 1,
0.0309687, -0.4688374, 0.9413483, 1, 1, 1, 1, 1,
0.03451128, -0.5556101, 2.244596, 1, 1, 1, 1, 1,
0.04682827, 2.227381, -1.262589, 1, 1, 1, 1, 1,
0.04705104, -0.4139636, 0.7673518, 0, 0, 1, 1, 1,
0.04808429, -0.8305087, 2.303642, 1, 0, 0, 1, 1,
0.05610445, -1.254228, 3.015116, 1, 0, 0, 1, 1,
0.05906687, -1.107298, 0.3525773, 1, 0, 0, 1, 1,
0.05916274, -1.07965, 5.287059, 1, 0, 0, 1, 1,
0.06413151, 0.2199999, 0.7577907, 1, 0, 0, 1, 1,
0.07097702, 0.3870549, -1.138606, 0, 0, 0, 1, 1,
0.07123049, 1.096726, -0.7109404, 0, 0, 0, 1, 1,
0.07160803, 1.82106, -0.8442862, 0, 0, 0, 1, 1,
0.073769, 1.314668, 0.4900574, 0, 0, 0, 1, 1,
0.0755089, 0.3628812, 0.3919825, 0, 0, 0, 1, 1,
0.07592164, 0.1760744, 1.211636, 0, 0, 0, 1, 1,
0.07935022, 0.7086575, -1.03269, 0, 0, 0, 1, 1,
0.08077405, 0.1364747, 0.9364239, 1, 1, 1, 1, 1,
0.08093262, -0.09937162, 4.121819, 1, 1, 1, 1, 1,
0.08945114, -2.656, 1.105555, 1, 1, 1, 1, 1,
0.09386854, 1.83692, 0.8930863, 1, 1, 1, 1, 1,
0.09850724, -0.7495649, 3.534209, 1, 1, 1, 1, 1,
0.0991791, -0.283391, 1.985727, 1, 1, 1, 1, 1,
0.1001718, -0.009311702, 3.153233, 1, 1, 1, 1, 1,
0.1014533, 1.592219, 0.2855166, 1, 1, 1, 1, 1,
0.1015623, -1.327769, 1.483606, 1, 1, 1, 1, 1,
0.1016891, -0.6477875, 3.693819, 1, 1, 1, 1, 1,
0.1056944, 0.5683268, 1.091193, 1, 1, 1, 1, 1,
0.1061768, 1.071607, -0.3058956, 1, 1, 1, 1, 1,
0.109337, 0.6434309, 0.4095945, 1, 1, 1, 1, 1,
0.1101033, -0.6386914, 3.153692, 1, 1, 1, 1, 1,
0.1113557, 0.2412233, -0.2181022, 1, 1, 1, 1, 1,
0.1159819, 1.496978, 0.8332528, 0, 0, 1, 1, 1,
0.1164445, -2.010981, 2.186606, 1, 0, 0, 1, 1,
0.1174951, 0.5064791, 0.9778295, 1, 0, 0, 1, 1,
0.1183917, -1.532224, 2.308242, 1, 0, 0, 1, 1,
0.1202863, 1.036993, -0.9578505, 1, 0, 0, 1, 1,
0.1206916, 0.1563239, 0.4363314, 1, 0, 0, 1, 1,
0.1210263, 1.791251, -0.6407906, 0, 0, 0, 1, 1,
0.1259852, 3.014042, -0.6371773, 0, 0, 0, 1, 1,
0.128914, -0.9526412, 1.514143, 0, 0, 0, 1, 1,
0.1294179, -0.743744, 3.436323, 0, 0, 0, 1, 1,
0.1333748, 0.833615, 0.6919569, 0, 0, 0, 1, 1,
0.1428522, -0.6780705, 4.03786, 0, 0, 0, 1, 1,
0.1474717, 0.8358753, 0.3256342, 0, 0, 0, 1, 1,
0.1507789, -0.2801789, 3.108551, 1, 1, 1, 1, 1,
0.1528139, 0.3193559, 1.716128, 1, 1, 1, 1, 1,
0.1528957, 1.639504, 0.5159072, 1, 1, 1, 1, 1,
0.1548598, 1.092645, 2.551856, 1, 1, 1, 1, 1,
0.1574721, -0.02537348, 2.704099, 1, 1, 1, 1, 1,
0.1598735, -0.4560426, 2.116302, 1, 1, 1, 1, 1,
0.1608545, 0.3371756, -0.4766556, 1, 1, 1, 1, 1,
0.1610738, -1.380357, 3.047392, 1, 1, 1, 1, 1,
0.1628449, 0.4699701, 0.8238681, 1, 1, 1, 1, 1,
0.1633685, 1.30125, -2.13428, 1, 1, 1, 1, 1,
0.1651724, -0.3058811, 2.161193, 1, 1, 1, 1, 1,
0.1674194, 0.1946669, 0.9672854, 1, 1, 1, 1, 1,
0.1705572, -0.2153306, 3.520285, 1, 1, 1, 1, 1,
0.1755055, 0.7049822, -1.934808, 1, 1, 1, 1, 1,
0.1766741, 0.8376278, 1.07216, 1, 1, 1, 1, 1,
0.1778354, -1.188107, 3.146726, 0, 0, 1, 1, 1,
0.1784705, -1.87076, 3.320662, 1, 0, 0, 1, 1,
0.1792527, 0.1691047, 0.4433029, 1, 0, 0, 1, 1,
0.1817779, -0.292173, 1.270266, 1, 0, 0, 1, 1,
0.1824285, 0.5776174, 0.4272189, 1, 0, 0, 1, 1,
0.1830482, 0.7985364, 0.9584695, 1, 0, 0, 1, 1,
0.1905262, -1.744765, 2.677859, 0, 0, 0, 1, 1,
0.1944761, -1.565326, 2.455581, 0, 0, 0, 1, 1,
0.2060348, -0.4100614, 2.324911, 0, 0, 0, 1, 1,
0.2206971, 0.6648402, -0.7387692, 0, 0, 0, 1, 1,
0.2212971, -2.145408, 1.434341, 0, 0, 0, 1, 1,
0.2225672, -0.2891508, 2.558515, 0, 0, 0, 1, 1,
0.2230338, 0.2168895, -1.037407, 0, 0, 0, 1, 1,
0.2235539, 0.08940537, 2.501325, 1, 1, 1, 1, 1,
0.2241863, -0.02997176, 1.918541, 1, 1, 1, 1, 1,
0.2275866, 0.2427734, 3.120667, 1, 1, 1, 1, 1,
0.2312719, -0.5004458, 2.987834, 1, 1, 1, 1, 1,
0.2371932, 0.3925065, 2.027186, 1, 1, 1, 1, 1,
0.2389456, -0.07707475, 1.172661, 1, 1, 1, 1, 1,
0.2395866, -0.7750112, 1.097397, 1, 1, 1, 1, 1,
0.2400927, -1.138397, 4.294439, 1, 1, 1, 1, 1,
0.2406178, -1.083593, 2.598101, 1, 1, 1, 1, 1,
0.2411687, 1.045739, -0.6507568, 1, 1, 1, 1, 1,
0.244368, 0.8880209, 0.7556212, 1, 1, 1, 1, 1,
0.2446265, 0.4986926, -0.4120176, 1, 1, 1, 1, 1,
0.2539148, 1.414621, 0.5279971, 1, 1, 1, 1, 1,
0.2580031, 1.100274, 0.8587415, 1, 1, 1, 1, 1,
0.2580296, 0.2492931, -0.6138697, 1, 1, 1, 1, 1,
0.2596939, -2.426942, 3.462197, 0, 0, 1, 1, 1,
0.2637996, -1.199397, 4.064252, 1, 0, 0, 1, 1,
0.264402, 0.2084738, 3.088487, 1, 0, 0, 1, 1,
0.2681791, -0.003073499, 2.707032, 1, 0, 0, 1, 1,
0.2703126, -0.6556339, 1.489683, 1, 0, 0, 1, 1,
0.2715461, -0.1203518, 1.899157, 1, 0, 0, 1, 1,
0.2717326, 0.208519, 1.235405, 0, 0, 0, 1, 1,
0.2753575, -1.609933, 2.73702, 0, 0, 0, 1, 1,
0.2755133, 1.262011, -0.2690452, 0, 0, 0, 1, 1,
0.2818863, -0.930044, 4.299866, 0, 0, 0, 1, 1,
0.2858306, -0.1983647, 2.196039, 0, 0, 0, 1, 1,
0.2864085, -0.306876, 1.417756, 0, 0, 0, 1, 1,
0.2891985, 1.673546, -0.6099482, 0, 0, 0, 1, 1,
0.2963939, -0.56736, 2.233333, 1, 1, 1, 1, 1,
0.2968864, -1.590363, 4.440033, 1, 1, 1, 1, 1,
0.3008979, 1.107484, -0.46281, 1, 1, 1, 1, 1,
0.3024636, 0.1139999, 0.3689011, 1, 1, 1, 1, 1,
0.3041209, 0.5336799, 0.155735, 1, 1, 1, 1, 1,
0.3069392, 0.2509137, 0.3246676, 1, 1, 1, 1, 1,
0.3125722, 0.966079, -0.6772289, 1, 1, 1, 1, 1,
0.3143962, 1.825023, -0.6800457, 1, 1, 1, 1, 1,
0.3161876, -1.386963, 2.469038, 1, 1, 1, 1, 1,
0.3164284, -1.156915, 0.7643468, 1, 1, 1, 1, 1,
0.3207967, -0.8746459, 1.813119, 1, 1, 1, 1, 1,
0.3247974, -0.8270886, 3.063198, 1, 1, 1, 1, 1,
0.3252315, 0.5040666, -0.3460889, 1, 1, 1, 1, 1,
0.3263122, 1.493205, 0.213865, 1, 1, 1, 1, 1,
0.3280551, 0.8133679, 0.2627953, 1, 1, 1, 1, 1,
0.3286726, 0.2443362, 1.361954, 0, 0, 1, 1, 1,
0.3348586, 1.963042, 1.999495, 1, 0, 0, 1, 1,
0.3393781, 1.612491, -0.7614589, 1, 0, 0, 1, 1,
0.3433747, 0.09982706, 1.25569, 1, 0, 0, 1, 1,
0.3487853, -0.2204275, 2.248781, 1, 0, 0, 1, 1,
0.3488117, 0.4013268, 1.419742, 1, 0, 0, 1, 1,
0.3525061, 0.001438309, 4.49952, 0, 0, 0, 1, 1,
0.3537585, -0.6552605, 3.687359, 0, 0, 0, 1, 1,
0.3590043, 0.126181, 1.443996, 0, 0, 0, 1, 1,
0.3674936, 0.9362165, 0.2168376, 0, 0, 0, 1, 1,
0.3683297, 0.3650057, 1.883415, 0, 0, 0, 1, 1,
0.3688032, -0.3340251, 2.564993, 0, 0, 0, 1, 1,
0.3707241, -0.3036337, 1.690215, 0, 0, 0, 1, 1,
0.3710903, -0.8755345, 1.640444, 1, 1, 1, 1, 1,
0.3720389, -0.4360857, 2.185151, 1, 1, 1, 1, 1,
0.3748972, 0.9603264, 0.1808247, 1, 1, 1, 1, 1,
0.378707, 0.3227427, 1.317883, 1, 1, 1, 1, 1,
0.3790858, -0.3292825, 2.539685, 1, 1, 1, 1, 1,
0.3798679, 1.266762, 0.9502056, 1, 1, 1, 1, 1,
0.3839072, -2.061445, 2.569078, 1, 1, 1, 1, 1,
0.3938298, 0.0951333, 1.835084, 1, 1, 1, 1, 1,
0.3941188, 2.582802, -0.3992727, 1, 1, 1, 1, 1,
0.394356, -0.1862396, 2.636854, 1, 1, 1, 1, 1,
0.3969502, -0.9340154, 1.789901, 1, 1, 1, 1, 1,
0.3979447, 0.514285, 0.5868048, 1, 1, 1, 1, 1,
0.4015303, -0.2522226, 2.257482, 1, 1, 1, 1, 1,
0.4062329, 1.742114, -1.191136, 1, 1, 1, 1, 1,
0.4077325, -0.1986926, 2.218536, 1, 1, 1, 1, 1,
0.416597, 0.067548, 1.924582, 0, 0, 1, 1, 1,
0.4216926, -0.6524906, 1.853768, 1, 0, 0, 1, 1,
0.4233775, -0.4988139, 3.066663, 1, 0, 0, 1, 1,
0.4247914, 0.2774341, 1.949171, 1, 0, 0, 1, 1,
0.4258589, -0.5735514, 1.027644, 1, 0, 0, 1, 1,
0.4278399, 0.3651739, 2.577001, 1, 0, 0, 1, 1,
0.4356433, -0.8020432, 2.815471, 0, 0, 0, 1, 1,
0.4460261, -0.4705642, 3.105827, 0, 0, 0, 1, 1,
0.4514549, -0.4542088, 2.760612, 0, 0, 0, 1, 1,
0.4540758, 0.6755741, 1.271933, 0, 0, 0, 1, 1,
0.458605, -0.6180861, 1.569947, 0, 0, 0, 1, 1,
0.4643349, 0.4328729, 3.188165, 0, 0, 0, 1, 1,
0.466795, -1.685364, 3.231337, 0, 0, 0, 1, 1,
0.467978, 0.6351057, 1.270928, 1, 1, 1, 1, 1,
0.4746754, 1.10837, -0.06618552, 1, 1, 1, 1, 1,
0.4772282, 1.06329, 0.9782071, 1, 1, 1, 1, 1,
0.4810924, -0.111383, 2.994318, 1, 1, 1, 1, 1,
0.4815425, -0.06581713, 2.019118, 1, 1, 1, 1, 1,
0.4846906, -0.5598516, 1.467752, 1, 1, 1, 1, 1,
0.4847287, 0.2006811, 2.808376, 1, 1, 1, 1, 1,
0.4854577, 0.3312144, 1.995987, 1, 1, 1, 1, 1,
0.4857456, 1.168632, -0.6246859, 1, 1, 1, 1, 1,
0.4914818, -0.2507192, 2.017224, 1, 1, 1, 1, 1,
0.4921718, -0.5633915, 0.6411917, 1, 1, 1, 1, 1,
0.4923186, 0.8595234, -1.246969, 1, 1, 1, 1, 1,
0.4973744, 0.5456086, 1.556034, 1, 1, 1, 1, 1,
0.4989453, 1.456861, -1.256723, 1, 1, 1, 1, 1,
0.4990977, -0.7744671, 3.457885, 1, 1, 1, 1, 1,
0.5057009, -1.651495, 1.243499, 0, 0, 1, 1, 1,
0.507206, 0.6307622, 1.511844, 1, 0, 0, 1, 1,
0.5079113, -0.5702198, 3.353236, 1, 0, 0, 1, 1,
0.508759, 0.5036854, -0.952073, 1, 0, 0, 1, 1,
0.518867, -1.773775, 2.818464, 1, 0, 0, 1, 1,
0.5193368, -0.7217045, 3.373098, 1, 0, 0, 1, 1,
0.5226572, -0.5777568, 2.200565, 0, 0, 0, 1, 1,
0.525914, -0.199105, 2.04835, 0, 0, 0, 1, 1,
0.5265818, 0.4020781, -0.1257156, 0, 0, 0, 1, 1,
0.5274047, -0.7791951, 1.849066, 0, 0, 0, 1, 1,
0.5275116, 0.5207959, -1.119864, 0, 0, 0, 1, 1,
0.5295307, 0.05432989, 0.7685812, 0, 0, 0, 1, 1,
0.5304936, 0.8237594, 0.8619323, 0, 0, 0, 1, 1,
0.5313281, 0.9353675, 0.1023162, 1, 1, 1, 1, 1,
0.5335767, 0.7409225, 0.755908, 1, 1, 1, 1, 1,
0.5351851, 0.9363114, -0.1659793, 1, 1, 1, 1, 1,
0.5476433, -1.384576, 2.81738, 1, 1, 1, 1, 1,
0.5489033, -0.7389024, 2.942986, 1, 1, 1, 1, 1,
0.5496419, -1.81738, 1.655086, 1, 1, 1, 1, 1,
0.5520938, -1.763965, 1.249143, 1, 1, 1, 1, 1,
0.5638539, -0.4484898, 3.398063, 1, 1, 1, 1, 1,
0.5682525, -0.4918135, 2.669187, 1, 1, 1, 1, 1,
0.5696046, 0.136372, 1.486567, 1, 1, 1, 1, 1,
0.5729342, 0.05251364, 0.1751652, 1, 1, 1, 1, 1,
0.5778044, 0.2366847, 1.099148, 1, 1, 1, 1, 1,
0.5815372, 0.875972, 0.4086894, 1, 1, 1, 1, 1,
0.5823269, -0.007591074, 0.3321432, 1, 1, 1, 1, 1,
0.5857384, -0.1767541, 1.804754, 1, 1, 1, 1, 1,
0.60029, -1.928351, 0.08004564, 0, 0, 1, 1, 1,
0.6029891, 1.112692, 0.6874499, 1, 0, 0, 1, 1,
0.6041024, -0.2422557, 3.615485, 1, 0, 0, 1, 1,
0.6076405, -0.2735524, 2.076141, 1, 0, 0, 1, 1,
0.6090981, -1.031911, 3.819105, 1, 0, 0, 1, 1,
0.6183004, 1.485543, 1.373633, 1, 0, 0, 1, 1,
0.6185065, -1.482343, 2.425707, 0, 0, 0, 1, 1,
0.6211705, -0.5918782, 1.323394, 0, 0, 0, 1, 1,
0.6216659, -0.1836346, 0.9398201, 0, 0, 0, 1, 1,
0.6217418, 1.058405, 1.958698, 0, 0, 0, 1, 1,
0.6231304, -0.7277064, 2.089757, 0, 0, 0, 1, 1,
0.6237497, -0.9307889, 1.575321, 0, 0, 0, 1, 1,
0.6270363, 1.166321, 0.9996607, 0, 0, 0, 1, 1,
0.6288313, 1.153378, 2.514596, 1, 1, 1, 1, 1,
0.6297095, 0.4757278, -0.5530643, 1, 1, 1, 1, 1,
0.6368107, 0.4558899, 0.9517876, 1, 1, 1, 1, 1,
0.637237, 0.1052442, 1.435542, 1, 1, 1, 1, 1,
0.6410205, -0.1625871, 2.666749, 1, 1, 1, 1, 1,
0.646534, 1.81128, -1.033513, 1, 1, 1, 1, 1,
0.6575917, 1.57239, 0.6401086, 1, 1, 1, 1, 1,
0.6576233, 0.5064505, -1.081129, 1, 1, 1, 1, 1,
0.6623894, 0.6906141, 1.491712, 1, 1, 1, 1, 1,
0.665208, -0.2655993, 2.903945, 1, 1, 1, 1, 1,
0.6678479, -0.4815457, 1.013682, 1, 1, 1, 1, 1,
0.6702152, -0.03119176, 0.9258564, 1, 1, 1, 1, 1,
0.6703469, -0.6205721, 0.3921641, 1, 1, 1, 1, 1,
0.6830714, -0.04666308, 2.504838, 1, 1, 1, 1, 1,
0.6875462, -0.04773001, 1.243233, 1, 1, 1, 1, 1,
0.6899613, 0.6988495, 0.2381775, 0, 0, 1, 1, 1,
0.693074, 0.678513, 1.233107, 1, 0, 0, 1, 1,
0.6939651, 0.1912305, 2.239427, 1, 0, 0, 1, 1,
0.7020538, -0.5729791, 2.069038, 1, 0, 0, 1, 1,
0.7034326, 0.7221299, 1.906881, 1, 0, 0, 1, 1,
0.7092208, -2.606715, 2.881709, 1, 0, 0, 1, 1,
0.7114629, -0.8713019, 2.948972, 0, 0, 0, 1, 1,
0.7126215, 0.4073844, 0.7168568, 0, 0, 0, 1, 1,
0.7169495, 0.1243679, 1.722248, 0, 0, 0, 1, 1,
0.7193338, -0.3747928, 2.184671, 0, 0, 0, 1, 1,
0.7203488, -0.3009585, 0.8504657, 0, 0, 0, 1, 1,
0.721277, 1.137358, 0.2326866, 0, 0, 0, 1, 1,
0.7215492, 0.7681026, -0.4656185, 0, 0, 0, 1, 1,
0.7254877, 0.2594326, 0.7309359, 1, 1, 1, 1, 1,
0.7301585, -0.2213725, 2.304084, 1, 1, 1, 1, 1,
0.7326475, 0.9855697, -0.5321347, 1, 1, 1, 1, 1,
0.7364567, -2.103715, 1.546481, 1, 1, 1, 1, 1,
0.7437434, 1.265128, 0.1821984, 1, 1, 1, 1, 1,
0.7492021, -0.2592346, 2.644132, 1, 1, 1, 1, 1,
0.7494502, 0.5152797, 0.3888536, 1, 1, 1, 1, 1,
0.750268, 0.02153159, 0.6846772, 1, 1, 1, 1, 1,
0.750315, -1.410568, 2.309057, 1, 1, 1, 1, 1,
0.7531419, -1.097882, 3.051187, 1, 1, 1, 1, 1,
0.7578403, -1.159385, 4.090682, 1, 1, 1, 1, 1,
0.7590338, 0.4432099, -0.5859107, 1, 1, 1, 1, 1,
0.7621553, 0.09435276, 2.096743, 1, 1, 1, 1, 1,
0.763739, -1.906107, 3.399062, 1, 1, 1, 1, 1,
0.7713525, -0.5823935, 2.682029, 1, 1, 1, 1, 1,
0.7755819, -0.9912374, 1.908031, 0, 0, 1, 1, 1,
0.8052219, -0.02017242, 1.915886, 1, 0, 0, 1, 1,
0.8073547, 1.098633, -0.4427762, 1, 0, 0, 1, 1,
0.8081282, -0.8038462, 3.408933, 1, 0, 0, 1, 1,
0.8093678, -0.3262059, 2.543849, 1, 0, 0, 1, 1,
0.8122873, -0.9835326, 1.785294, 1, 0, 0, 1, 1,
0.812958, -0.3041781, 2.54493, 0, 0, 0, 1, 1,
0.8135594, -0.4544638, 1.872381, 0, 0, 0, 1, 1,
0.816232, -0.5682581, 1.973044, 0, 0, 0, 1, 1,
0.8168179, -0.5130494, 1.345592, 0, 0, 0, 1, 1,
0.8253307, -2.035936, 1.874363, 0, 0, 0, 1, 1,
0.8260118, -0.2297113, 1.84463, 0, 0, 0, 1, 1,
0.829903, 0.342232, -0.142277, 0, 0, 0, 1, 1,
0.8331543, 0.2286973, -0.7717293, 1, 1, 1, 1, 1,
0.8404643, -0.01290118, 2.833996, 1, 1, 1, 1, 1,
0.8413707, 1.88274, -0.7506196, 1, 1, 1, 1, 1,
0.8419392, -1.041585, 3.947859, 1, 1, 1, 1, 1,
0.8439803, 0.2266556, 0.3954916, 1, 1, 1, 1, 1,
0.8490241, 0.8212432, 2.264195, 1, 1, 1, 1, 1,
0.849206, -0.04708461, 1.997251, 1, 1, 1, 1, 1,
0.8521611, -0.9303862, 2.121449, 1, 1, 1, 1, 1,
0.854389, 1.770651, 1.410905, 1, 1, 1, 1, 1,
0.8549397, -0.4803539, 3.622682, 1, 1, 1, 1, 1,
0.8561288, 0.2856045, 0.02721811, 1, 1, 1, 1, 1,
0.8575148, 1.19019, 1.410162, 1, 1, 1, 1, 1,
0.8629532, 1.335063, 1.801481, 1, 1, 1, 1, 1,
0.8643517, 0.8349957, 0.9933017, 1, 1, 1, 1, 1,
0.8691533, 1.073422, -1.214349, 1, 1, 1, 1, 1,
0.8709257, 1.04335, 0.8522422, 0, 0, 1, 1, 1,
0.8761472, -0.1800458, 2.431695, 1, 0, 0, 1, 1,
0.8788779, 2.251119, -0.133675, 1, 0, 0, 1, 1,
0.8791699, 1.612986, 1.653148, 1, 0, 0, 1, 1,
0.8798843, -0.5045057, 1.539876, 1, 0, 0, 1, 1,
0.8805098, 2.110776, -0.009401769, 1, 0, 0, 1, 1,
0.881744, -0.677632, 2.339236, 0, 0, 0, 1, 1,
0.8845761, 0.4771032, 0.1779368, 0, 0, 0, 1, 1,
0.8856437, -0.3937601, 2.736442, 0, 0, 0, 1, 1,
0.889331, -1.111472, 2.745116, 0, 0, 0, 1, 1,
0.8946627, 0.1731135, 2.037246, 0, 0, 0, 1, 1,
0.8986384, -0.7920378, 4.452339, 0, 0, 0, 1, 1,
0.8996875, -2.173836, 2.328667, 0, 0, 0, 1, 1,
0.9052057, -1.538943, 2.423013, 1, 1, 1, 1, 1,
0.9097071, 0.6928999, 1.053612, 1, 1, 1, 1, 1,
0.9160979, -2.47893, 4.399063, 1, 1, 1, 1, 1,
0.9191219, -0.6165785, 1.138605, 1, 1, 1, 1, 1,
0.9205371, 1.026754, 1.48722, 1, 1, 1, 1, 1,
0.9205698, 2.186777, 0.6705003, 1, 1, 1, 1, 1,
0.9241139, 2.124819, -1.242257, 1, 1, 1, 1, 1,
0.9261267, 1.92478, 0.895814, 1, 1, 1, 1, 1,
0.9399872, -0.5259801, 1.645024, 1, 1, 1, 1, 1,
0.9401662, 0.1531363, 1.663934, 1, 1, 1, 1, 1,
0.9661777, 0.4338014, 0.7160397, 1, 1, 1, 1, 1,
0.9670205, -0.5718176, 3.3133, 1, 1, 1, 1, 1,
0.96793, -1.640862, 1.82398, 1, 1, 1, 1, 1,
0.9846902, 1.534636, -1.157334, 1, 1, 1, 1, 1,
0.9948657, -2.282498, 2.443262, 1, 1, 1, 1, 1,
0.9983619, 1.133544, -0.6135324, 0, 0, 1, 1, 1,
1.012067, -0.4919728, 2.903783, 1, 0, 0, 1, 1,
1.013989, 1.006052, -0.5078809, 1, 0, 0, 1, 1,
1.0165, -0.1707965, -0.9063356, 1, 0, 0, 1, 1,
1.020342, 0.4145422, 0.4707583, 1, 0, 0, 1, 1,
1.029597, -0.6339795, 3.574229, 1, 0, 0, 1, 1,
1.030342, -0.2396535, 0.1042183, 0, 0, 0, 1, 1,
1.032711, 0.8497609, 2.196429, 0, 0, 0, 1, 1,
1.03663, 1.306237, -0.6953036, 0, 0, 0, 1, 1,
1.04161, -0.9287354, 2.910089, 0, 0, 0, 1, 1,
1.042621, -0.9596753, 1.405754, 0, 0, 0, 1, 1,
1.042974, -0.4329232, 1.938201, 0, 0, 0, 1, 1,
1.046045, 0.4663702, 1.246816, 0, 0, 0, 1, 1,
1.065534, 0.702631, 1.799459, 1, 1, 1, 1, 1,
1.067002, -0.5481197, 1.598247, 1, 1, 1, 1, 1,
1.078745, 0.6433746, 2.312106, 1, 1, 1, 1, 1,
1.088968, -0.7223114, 0.8616094, 1, 1, 1, 1, 1,
1.091208, 0.9515807, 0.9454811, 1, 1, 1, 1, 1,
1.091385, -1.896921, 1.614466, 1, 1, 1, 1, 1,
1.097152, -0.9134886, 2.054353, 1, 1, 1, 1, 1,
1.103063, -0.5657972, 1.676422, 1, 1, 1, 1, 1,
1.103679, -0.9191541, 4.101626, 1, 1, 1, 1, 1,
1.109837, 0.3338946, 3.638526, 1, 1, 1, 1, 1,
1.114359, -0.4001075, 4.227999, 1, 1, 1, 1, 1,
1.122082, 1.51712, 1.380583, 1, 1, 1, 1, 1,
1.122223, 1.306786, 0.3256792, 1, 1, 1, 1, 1,
1.122881, 0.07279878, 1.085083, 1, 1, 1, 1, 1,
1.124024, 0.685421, 0.2995308, 1, 1, 1, 1, 1,
1.137076, 1.722471, 0.4993328, 0, 0, 1, 1, 1,
1.137166, 1.018461, 0.4667834, 1, 0, 0, 1, 1,
1.138112, -0.1995427, 1.779909, 1, 0, 0, 1, 1,
1.138866, -0.1572029, 0.4071071, 1, 0, 0, 1, 1,
1.139142, -0.2228518, 3.262712, 1, 0, 0, 1, 1,
1.141276, 1.199591, 1.211601, 1, 0, 0, 1, 1,
1.146084, -0.2657503, 2.248858, 0, 0, 0, 1, 1,
1.148114, 0.1345838, 1.242727, 0, 0, 0, 1, 1,
1.148965, -0.652407, 1.289053, 0, 0, 0, 1, 1,
1.153345, 0.8376015, 0.682507, 0, 0, 0, 1, 1,
1.156973, -1.18294, 1.632389, 0, 0, 0, 1, 1,
1.157878, -1.437557, 3.328117, 0, 0, 0, 1, 1,
1.159551, -0.08263186, 1.720753, 0, 0, 0, 1, 1,
1.163739, -1.237608, 2.117467, 1, 1, 1, 1, 1,
1.165536, 1.708738, 0.3259795, 1, 1, 1, 1, 1,
1.167631, 1.112903, 0.6253108, 1, 1, 1, 1, 1,
1.171088, -0.8391675, 4.725253, 1, 1, 1, 1, 1,
1.184924, 0.9338647, 0.5508043, 1, 1, 1, 1, 1,
1.187231, -0.757604, 2.926828, 1, 1, 1, 1, 1,
1.187355, -1.07848, 4.114484, 1, 1, 1, 1, 1,
1.224717, -0.3779846, 3.792149, 1, 1, 1, 1, 1,
1.235381, -0.2307661, 2.19485, 1, 1, 1, 1, 1,
1.236747, 0.695913, 0.448723, 1, 1, 1, 1, 1,
1.242971, -0.05167578, 1.156306, 1, 1, 1, 1, 1,
1.255154, -0.5134324, 0.5986499, 1, 1, 1, 1, 1,
1.260436, 0.7518747, -0.4197332, 1, 1, 1, 1, 1,
1.264872, 1.619391, 0.591459, 1, 1, 1, 1, 1,
1.270285, 0.1661019, 3.796525, 1, 1, 1, 1, 1,
1.270429, -0.7680556, 1.895961, 0, 0, 1, 1, 1,
1.27632, -0.9313085, 0.4507559, 1, 0, 0, 1, 1,
1.281581, -0.8348134, 1.565308, 1, 0, 0, 1, 1,
1.284175, 0.8929206, 0.08042554, 1, 0, 0, 1, 1,
1.291111, 0.239559, 0.1391561, 1, 0, 0, 1, 1,
1.29276, 1.464465, 1.177733, 1, 0, 0, 1, 1,
1.296314, 2.520086, -0.8137466, 0, 0, 0, 1, 1,
1.298005, 0.2681855, 0.868908, 0, 0, 0, 1, 1,
1.299314, -0.6881154, 2.915203, 0, 0, 0, 1, 1,
1.301156, 0.4333713, 3.066951, 0, 0, 0, 1, 1,
1.301748, -1.078864, 1.493342, 0, 0, 0, 1, 1,
1.308357, 0.2647089, 2.004535, 0, 0, 0, 1, 1,
1.31048, -0.06861521, 1.079075, 0, 0, 0, 1, 1,
1.311152, -0.1275209, 0.6912896, 1, 1, 1, 1, 1,
1.314368, 0.2602025, 1.915414, 1, 1, 1, 1, 1,
1.319918, -1.364254, 0.7038698, 1, 1, 1, 1, 1,
1.331236, 0.129351, 1.711946, 1, 1, 1, 1, 1,
1.339489, 1.175412, 1.261565, 1, 1, 1, 1, 1,
1.342027, -0.8232006, 1.948901, 1, 1, 1, 1, 1,
1.347641, 1.206695, 2.063093, 1, 1, 1, 1, 1,
1.347945, 0.6835167, 0.3243527, 1, 1, 1, 1, 1,
1.348852, -1.997116, 2.724407, 1, 1, 1, 1, 1,
1.3495, -1.30991, 2.924444, 1, 1, 1, 1, 1,
1.349765, -1.395877, 3.298027, 1, 1, 1, 1, 1,
1.350961, 2.76124, 1.446368, 1, 1, 1, 1, 1,
1.362141, -0.1374891, 1.455501, 1, 1, 1, 1, 1,
1.378603, -1.539933, 1.672728, 1, 1, 1, 1, 1,
1.378727, 0.07167491, 1.591672, 1, 1, 1, 1, 1,
1.379037, -0.1192497, 1.728911, 0, 0, 1, 1, 1,
1.379842, -0.2906162, 1.077222, 1, 0, 0, 1, 1,
1.382595, -1.493606, 1.184191, 1, 0, 0, 1, 1,
1.394976, -0.9541487, 1.962336, 1, 0, 0, 1, 1,
1.430709, -0.6974923, 2.428264, 1, 0, 0, 1, 1,
1.43627, -1.588458, 1.474582, 1, 0, 0, 1, 1,
1.440227, 1.07411, 0.4101968, 0, 0, 0, 1, 1,
1.454672, 0.04091329, 0.3790468, 0, 0, 0, 1, 1,
1.461332, -0.08403461, 1.708837, 0, 0, 0, 1, 1,
1.463631, 1.066718, -0.1519567, 0, 0, 0, 1, 1,
1.467901, 1.745231, 1.924101, 0, 0, 0, 1, 1,
1.503116, -0.1669065, 2.129531, 0, 0, 0, 1, 1,
1.503862, 0.09164595, 2.23489, 0, 0, 0, 1, 1,
1.515699, 0.4572152, 3.775238, 1, 1, 1, 1, 1,
1.519486, -1.302594, 2.438504, 1, 1, 1, 1, 1,
1.523458, -0.1882595, 2.798631, 1, 1, 1, 1, 1,
1.555462, 0.1033907, 0.8031466, 1, 1, 1, 1, 1,
1.561797, -0.7028584, 3.073378, 1, 1, 1, 1, 1,
1.566543, 0.1041043, 0.862657, 1, 1, 1, 1, 1,
1.568287, 1.02283, 1.741124, 1, 1, 1, 1, 1,
1.596116, 1.711511, -0.7220264, 1, 1, 1, 1, 1,
1.600139, 0.2708024, 0.3360775, 1, 1, 1, 1, 1,
1.61637, 0.3548241, -0.8359857, 1, 1, 1, 1, 1,
1.626757, -0.07221992, 1.904145, 1, 1, 1, 1, 1,
1.629254, -0.7706051, 2.438419, 1, 1, 1, 1, 1,
1.629303, -1.534375, 3.313154, 1, 1, 1, 1, 1,
1.635662, 0.001423678, 1.984345, 1, 1, 1, 1, 1,
1.637141, 0.136628, 0.6553741, 1, 1, 1, 1, 1,
1.648989, 1.581755, -0.04396387, 0, 0, 1, 1, 1,
1.653308, 1.218236, 0.7033021, 1, 0, 0, 1, 1,
1.664596, -0.9810758, 3.657945, 1, 0, 0, 1, 1,
1.665359, -1.777461, 1.011033, 1, 0, 0, 1, 1,
1.668515, -1.73608, 2.387483, 1, 0, 0, 1, 1,
1.682858, -0.06999233, 3.335897, 1, 0, 0, 1, 1,
1.687359, -0.1364673, 2.692747, 0, 0, 0, 1, 1,
1.704857, 0.2641919, 1.932432, 0, 0, 0, 1, 1,
1.706973, -0.08330434, 0.9570201, 0, 0, 0, 1, 1,
1.711732, -0.9398578, 2.585301, 0, 0, 0, 1, 1,
1.729705, -0.1202814, 1.416999, 0, 0, 0, 1, 1,
1.730021, 1.17922, 1.798139, 0, 0, 0, 1, 1,
1.744632, -0.2430873, 1.088814, 0, 0, 0, 1, 1,
1.747059, 0.8363831, 0.8434682, 1, 1, 1, 1, 1,
1.758436, -1.381691, 2.623581, 1, 1, 1, 1, 1,
1.762396, -0.3320138, -0.1223839, 1, 1, 1, 1, 1,
1.767088, 0.7309388, 0.615818, 1, 1, 1, 1, 1,
1.770653, -0.1432742, 0.5926319, 1, 1, 1, 1, 1,
1.780205, -0.4288006, 1.339806, 1, 1, 1, 1, 1,
1.799188, -1.070242, 1.983932, 1, 1, 1, 1, 1,
1.818817, -1.906343, 1.535924, 1, 1, 1, 1, 1,
1.839385, 0.9833889, 1.825264, 1, 1, 1, 1, 1,
1.850486, -0.8999859, -0.312034, 1, 1, 1, 1, 1,
1.860604, -2.050486, 2.320782, 1, 1, 1, 1, 1,
1.881636, -0.5562577, 1.038074, 1, 1, 1, 1, 1,
1.882389, -0.2581058, 1.88502, 1, 1, 1, 1, 1,
1.901745, 1.641283, 3.223479, 1, 1, 1, 1, 1,
1.91225, 0.6613768, 2.390169, 1, 1, 1, 1, 1,
1.934504, 0.374065, 2.75741, 0, 0, 1, 1, 1,
1.941367, 1.076123, 0.8075863, 1, 0, 0, 1, 1,
1.980489, -0.496792, 2.531593, 1, 0, 0, 1, 1,
2.108371, 0.3185551, 1.622584, 1, 0, 0, 1, 1,
2.122819, 0.1201652, 0.8249468, 1, 0, 0, 1, 1,
2.133184, 1.625331, 0.4139543, 1, 0, 0, 1, 1,
2.142788, 0.200164, 0.3311745, 0, 0, 0, 1, 1,
2.181269, -0.2722189, 1.741926, 0, 0, 0, 1, 1,
2.183129, 2.204171, 0.7209101, 0, 0, 0, 1, 1,
2.205744, 0.4046535, 4.009642, 0, 0, 0, 1, 1,
2.232983, 2.434324, 0.3556709, 0, 0, 0, 1, 1,
2.242658, -0.2764105, 1.035438, 0, 0, 0, 1, 1,
2.303698, -0.06248088, 1.057478, 0, 0, 0, 1, 1,
2.332371, -0.3406252, 1.631544, 1, 1, 1, 1, 1,
2.534961, -0.44338, 3.72831, 1, 1, 1, 1, 1,
2.751932, -1.284238, 1.450868, 1, 1, 1, 1, 1,
2.792556, -0.1408431, 1.079405, 1, 1, 1, 1, 1,
2.962408, -0.303838, 1.226529, 1, 1, 1, 1, 1,
3.153987, -0.3370418, 1.528059, 1, 1, 1, 1, 1,
3.503826, -1.441041, 1.295265, 1, 1, 1, 1, 1
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
var radius = 9.638462;
var distance = 33.85469;
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
mvMatrix.translate( -0.2293153, 0.01666784, 0.2136147 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.85469);
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
