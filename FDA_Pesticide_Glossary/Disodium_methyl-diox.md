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
-3.062665, 0.7101187, -1.831314, 1, 0, 0, 1,
-2.987706, -0.7291975, -1.292725, 1, 0.007843138, 0, 1,
-2.859993, 0.4279423, -1.533283, 1, 0.01176471, 0, 1,
-2.832943, -0.874419, -2.62184, 1, 0.01960784, 0, 1,
-2.75869, 1.014018, -2.441985, 1, 0.02352941, 0, 1,
-2.573284, 0.2051223, -2.865915, 1, 0.03137255, 0, 1,
-2.531175, -0.01559065, -0.7360243, 1, 0.03529412, 0, 1,
-2.525272, -0.5151286, -3.802557, 1, 0.04313726, 0, 1,
-2.52123, -0.4384538, -2.103299, 1, 0.04705882, 0, 1,
-2.487133, 0.2931966, -2.359057, 1, 0.05490196, 0, 1,
-2.467466, 0.2785231, -1.181261, 1, 0.05882353, 0, 1,
-2.407806, -0.8103668, -0.9768897, 1, 0.06666667, 0, 1,
-2.402494, -0.9937748, -2.647456, 1, 0.07058824, 0, 1,
-2.366167, -1.368466, -0.7666155, 1, 0.07843138, 0, 1,
-2.352332, -0.5099778, -2.706836, 1, 0.08235294, 0, 1,
-2.323653, 1.12476, -0.8370412, 1, 0.09019608, 0, 1,
-2.28616, -1.092021, -1.446825, 1, 0.09411765, 0, 1,
-2.275416, 0.3512911, -1.944874, 1, 0.1019608, 0, 1,
-2.273147, 0.9271901, -1.84788, 1, 0.1098039, 0, 1,
-2.270928, -0.7000972, -2.908046, 1, 0.1137255, 0, 1,
-2.228806, 2.16544, -1.30089, 1, 0.1215686, 0, 1,
-2.187011, -0.3837074, -0.5972921, 1, 0.1254902, 0, 1,
-2.174297, 1.995412, -1.734119, 1, 0.1333333, 0, 1,
-2.172955, -1.621507, -4.176945, 1, 0.1372549, 0, 1,
-2.145409, 0.1118689, -1.7563, 1, 0.145098, 0, 1,
-2.050471, 0.02961411, -1.944634, 1, 0.1490196, 0, 1,
-1.987388, -1.42865, -2.270033, 1, 0.1568628, 0, 1,
-1.952302, -1.928485, -0.9073919, 1, 0.1607843, 0, 1,
-1.949309, 1.010629, -0.7659944, 1, 0.1686275, 0, 1,
-1.941557, -1.294064, -3.565073, 1, 0.172549, 0, 1,
-1.929455, -2.785848, -3.423315, 1, 0.1803922, 0, 1,
-1.916035, 0.5162156, -0.796393, 1, 0.1843137, 0, 1,
-1.889381, 0.1269359, -3.317448, 1, 0.1921569, 0, 1,
-1.853184, -0.5087229, -1.417473, 1, 0.1960784, 0, 1,
-1.823068, 2.155242, -1.350872, 1, 0.2039216, 0, 1,
-1.818784, 0.4230851, -3.243742, 1, 0.2117647, 0, 1,
-1.818081, -0.9693309, -2.363929, 1, 0.2156863, 0, 1,
-1.805471, -1.876602, 0.1926029, 1, 0.2235294, 0, 1,
-1.793915, 0.7639924, -1.410185, 1, 0.227451, 0, 1,
-1.789693, 0.6371135, -2.533405, 1, 0.2352941, 0, 1,
-1.776398, 0.6168234, -2.258097, 1, 0.2392157, 0, 1,
-1.742699, 0.1791891, -1.066964, 1, 0.2470588, 0, 1,
-1.740134, 0.7964314, -1.084359, 1, 0.2509804, 0, 1,
-1.739009, 0.7845394, -0.0386134, 1, 0.2588235, 0, 1,
-1.729885, 0.8492132, -0.3415015, 1, 0.2627451, 0, 1,
-1.726813, -0.6522458, -2.259564, 1, 0.2705882, 0, 1,
-1.725778, 1.497878, -0.523077, 1, 0.2745098, 0, 1,
-1.691556, -0.9017538, -1.837783, 1, 0.282353, 0, 1,
-1.685772, -1.079547, -0.5567851, 1, 0.2862745, 0, 1,
-1.682761, -0.3079427, -1.933411, 1, 0.2941177, 0, 1,
-1.6718, 0.310856, 0.2456788, 1, 0.3019608, 0, 1,
-1.66862, 1.537636, -1.433598, 1, 0.3058824, 0, 1,
-1.658048, 0.8631134, -1.854153, 1, 0.3137255, 0, 1,
-1.657491, -1.170961, -1.737036, 1, 0.3176471, 0, 1,
-1.650497, -0.1997315, -2.101882, 1, 0.3254902, 0, 1,
-1.648231, 0.1494258, -2.697409, 1, 0.3294118, 0, 1,
-1.644869, 0.4790095, 0.5648378, 1, 0.3372549, 0, 1,
-1.637711, 1.089338, -1.976709, 1, 0.3411765, 0, 1,
-1.63283, -0.8193483, -1.330214, 1, 0.3490196, 0, 1,
-1.628219, -0.5012304, -2.753863, 1, 0.3529412, 0, 1,
-1.623919, 0.8023189, -1.622543, 1, 0.3607843, 0, 1,
-1.623527, -0.801879, -2.211478, 1, 0.3647059, 0, 1,
-1.620192, 1.984482, 0.2438586, 1, 0.372549, 0, 1,
-1.617863, 0.671312, -0.8090931, 1, 0.3764706, 0, 1,
-1.600213, -0.7628367, -2.718702, 1, 0.3843137, 0, 1,
-1.57437, -0.2974292, -2.794633, 1, 0.3882353, 0, 1,
-1.562103, -1.174423, -1.16932, 1, 0.3960784, 0, 1,
-1.529454, -0.3157397, -1.283592, 1, 0.4039216, 0, 1,
-1.523282, 0.3238987, -1.73834, 1, 0.4078431, 0, 1,
-1.518706, 1.470158, -0.5603445, 1, 0.4156863, 0, 1,
-1.513816, -0.3547846, -0.928812, 1, 0.4196078, 0, 1,
-1.51238, 0.4920399, -0.2103277, 1, 0.427451, 0, 1,
-1.510465, -1.005086, -1.660154, 1, 0.4313726, 0, 1,
-1.49096, -0.8066306, -0.403863, 1, 0.4392157, 0, 1,
-1.47287, 0.4265174, -2.023616, 1, 0.4431373, 0, 1,
-1.458131, -0.5606115, -2.533278, 1, 0.4509804, 0, 1,
-1.456978, -0.132043, -1.03015, 1, 0.454902, 0, 1,
-1.441282, -0.06964085, -2.740986, 1, 0.4627451, 0, 1,
-1.436402, 0.2311999, -0.635437, 1, 0.4666667, 0, 1,
-1.416636, 1.097627, -1.571197, 1, 0.4745098, 0, 1,
-1.390933, -0.1461846, -1.877544, 1, 0.4784314, 0, 1,
-1.388012, -0.515443, -0.0458329, 1, 0.4862745, 0, 1,
-1.385889, -0.5979946, -2.815928, 1, 0.4901961, 0, 1,
-1.374912, -0.3899076, -2.506272, 1, 0.4980392, 0, 1,
-1.374638, 0.9644483, -0.3818065, 1, 0.5058824, 0, 1,
-1.370517, 1.188144, -0.7142281, 1, 0.509804, 0, 1,
-1.364857, -1.082363, -2.476196, 1, 0.5176471, 0, 1,
-1.362711, 0.8922909, -0.7416771, 1, 0.5215687, 0, 1,
-1.357635, -0.2186788, -1.797644, 1, 0.5294118, 0, 1,
-1.349284, 0.3294503, -0.8256832, 1, 0.5333334, 0, 1,
-1.346593, 0.4445253, -3.497015, 1, 0.5411765, 0, 1,
-1.340423, 0.9278647, -0.6939626, 1, 0.5450981, 0, 1,
-1.336659, 0.7534842, -3.912144, 1, 0.5529412, 0, 1,
-1.328692, 1.022933, -0.1324729, 1, 0.5568628, 0, 1,
-1.311849, 1.048661, -2.231654, 1, 0.5647059, 0, 1,
-1.300353, 2.442982, -1.311952, 1, 0.5686275, 0, 1,
-1.292132, 0.151838, -0.3483332, 1, 0.5764706, 0, 1,
-1.291404, 0.9703749, -0.152076, 1, 0.5803922, 0, 1,
-1.290596, -0.2137462, -2.54897, 1, 0.5882353, 0, 1,
-1.276681, -0.5390727, -0.3516347, 1, 0.5921569, 0, 1,
-1.273227, -0.8651716, -2.833124, 1, 0.6, 0, 1,
-1.270684, -0.2630976, -0.7528775, 1, 0.6078432, 0, 1,
-1.267997, -1.436008, -1.91555, 1, 0.6117647, 0, 1,
-1.267074, 1.114853, -0.3065794, 1, 0.6196079, 0, 1,
-1.263436, -0.34779, -3.120298, 1, 0.6235294, 0, 1,
-1.248764, -0.3780029, -1.521013, 1, 0.6313726, 0, 1,
-1.24423, 0.01615283, -1.326923, 1, 0.6352941, 0, 1,
-1.243094, 0.9952607, -2.162264, 1, 0.6431373, 0, 1,
-1.237907, 1.07504, -0.8918824, 1, 0.6470588, 0, 1,
-1.234695, 0.2637218, 0.1161358, 1, 0.654902, 0, 1,
-1.234167, -1.043472, -2.641633, 1, 0.6588235, 0, 1,
-1.218424, 1.423733, -0.02237235, 1, 0.6666667, 0, 1,
-1.216679, -0.9991392, -0.457995, 1, 0.6705883, 0, 1,
-1.203792, -1.195572, -2.883571, 1, 0.6784314, 0, 1,
-1.198903, 0.6755224, -1.222072, 1, 0.682353, 0, 1,
-1.193888, -2.08936, -1.196473, 1, 0.6901961, 0, 1,
-1.187939, -1.272249, -1.982323, 1, 0.6941177, 0, 1,
-1.180944, 0.1070414, -0.4742716, 1, 0.7019608, 0, 1,
-1.152361, 0.7874717, -0.4973644, 1, 0.7098039, 0, 1,
-1.150192, 0.2265841, -1.565985, 1, 0.7137255, 0, 1,
-1.149852, -0.975922, -2.235316, 1, 0.7215686, 0, 1,
-1.147474, -0.4343122, -1.658899, 1, 0.7254902, 0, 1,
-1.145974, 0.4262331, -0.3731942, 1, 0.7333333, 0, 1,
-1.136925, 1.079434, 0.7341712, 1, 0.7372549, 0, 1,
-1.125808, -0.2492616, -3.101734, 1, 0.7450981, 0, 1,
-1.107658, 0.832849, 1.120747, 1, 0.7490196, 0, 1,
-1.104882, -2.205802, -6.038485, 1, 0.7568628, 0, 1,
-1.104645, 0.5000587, -1.146307, 1, 0.7607843, 0, 1,
-1.103674, 0.8723785, 0.5179012, 1, 0.7686275, 0, 1,
-1.097692, -0.6173213, -1.733771, 1, 0.772549, 0, 1,
-1.080827, 0.1723277, -1.438172, 1, 0.7803922, 0, 1,
-1.072488, 0.889874, -1.422811, 1, 0.7843137, 0, 1,
-1.068177, -0.8149016, -4.192535, 1, 0.7921569, 0, 1,
-1.064511, -1.59835, -0.6598963, 1, 0.7960784, 0, 1,
-1.060214, 0.320438, -1.154791, 1, 0.8039216, 0, 1,
-1.058958, -1.246741, -1.641684, 1, 0.8117647, 0, 1,
-1.05725, 0.5490465, -2.181773, 1, 0.8156863, 0, 1,
-1.056166, -0.9479275, -3.520988, 1, 0.8235294, 0, 1,
-1.055919, 0.905655, -0.9800202, 1, 0.827451, 0, 1,
-1.053914, 0.9206873, -0.3947184, 1, 0.8352941, 0, 1,
-1.047546, -0.6694448, -1.403807, 1, 0.8392157, 0, 1,
-1.037611, 0.2312828, -0.9054834, 1, 0.8470588, 0, 1,
-1.03568, 0.8586415, -0.7099258, 1, 0.8509804, 0, 1,
-1.031384, -0.05230793, -1.563947, 1, 0.8588235, 0, 1,
-1.030755, 1.505267, 1.297207, 1, 0.8627451, 0, 1,
-1.028846, 1.351994, -0.618939, 1, 0.8705882, 0, 1,
-1.027407, -0.3016181, -3.331062, 1, 0.8745098, 0, 1,
-1.00984, -0.3014013, -3.264823, 1, 0.8823529, 0, 1,
-1.009541, -1.059627, -2.227894, 1, 0.8862745, 0, 1,
-0.9982772, 1.222525, -1.155868, 1, 0.8941177, 0, 1,
-0.9936525, -1.305166, -2.210308, 1, 0.8980392, 0, 1,
-0.9921303, 0.2553132, -3.370074, 1, 0.9058824, 0, 1,
-0.9775223, 0.1066239, -1.167159, 1, 0.9137255, 0, 1,
-0.9740731, 1.919375, -1.582028, 1, 0.9176471, 0, 1,
-0.9647831, 0.6898568, -0.6067414, 1, 0.9254902, 0, 1,
-0.95912, -0.2570186, -1.999792, 1, 0.9294118, 0, 1,
-0.9581589, 0.8116701, -2.732389, 1, 0.9372549, 0, 1,
-0.9562606, -0.337476, -0.09899059, 1, 0.9411765, 0, 1,
-0.9520168, -0.4328184, -0.9312297, 1, 0.9490196, 0, 1,
-0.9480839, 0.4006861, -0.926507, 1, 0.9529412, 0, 1,
-0.9456825, 1.054237, -1.687613, 1, 0.9607843, 0, 1,
-0.9368956, 0.7752057, -0.8675691, 1, 0.9647059, 0, 1,
-0.9340363, -0.6965715, -1.85877, 1, 0.972549, 0, 1,
-0.9303706, -0.0493518, -1.911035, 1, 0.9764706, 0, 1,
-0.9219959, 0.553696, -1.964875, 1, 0.9843137, 0, 1,
-0.91349, -0.4920058, -2.652115, 1, 0.9882353, 0, 1,
-0.9101965, -0.3470577, -1.714844, 1, 0.9960784, 0, 1,
-0.9034331, -1.184372, -2.47075, 0.9960784, 1, 0, 1,
-0.9021616, -0.9005252, -2.822361, 0.9921569, 1, 0, 1,
-0.8979978, -0.268733, -1.907991, 0.9843137, 1, 0, 1,
-0.8979759, -0.6633584, -3.140583, 0.9803922, 1, 0, 1,
-0.8947511, -1.527827, -2.967874, 0.972549, 1, 0, 1,
-0.8902124, 0.477376, -1.382285, 0.9686275, 1, 0, 1,
-0.8867911, -0.4107105, -2.34607, 0.9607843, 1, 0, 1,
-0.8670089, 0.5626589, -1.788387, 0.9568627, 1, 0, 1,
-0.8634534, -0.5756438, -1.788354, 0.9490196, 1, 0, 1,
-0.8619589, 1.740634, -1.968111, 0.945098, 1, 0, 1,
-0.8512663, -0.01769192, 0.1409234, 0.9372549, 1, 0, 1,
-0.8497888, 0.792191, 0.06000622, 0.9333333, 1, 0, 1,
-0.8432704, -0.01167148, -2.248862, 0.9254902, 1, 0, 1,
-0.8280008, -0.2808309, -0.8068798, 0.9215686, 1, 0, 1,
-0.8235194, 0.3772272, -2.192443, 0.9137255, 1, 0, 1,
-0.8212765, 0.9709397, -0.0984069, 0.9098039, 1, 0, 1,
-0.8192565, 0.0260493, -2.220267, 0.9019608, 1, 0, 1,
-0.8183744, 1.223093, -0.8657475, 0.8941177, 1, 0, 1,
-0.8182372, 1.023396, 0.7495988, 0.8901961, 1, 0, 1,
-0.8181616, -0.676225, -2.731105, 0.8823529, 1, 0, 1,
-0.817327, 1.348955, -1.496911, 0.8784314, 1, 0, 1,
-0.8123492, -1.644992, -2.482057, 0.8705882, 1, 0, 1,
-0.8066252, -1.245013, -2.944168, 0.8666667, 1, 0, 1,
-0.804679, 0.8030068, -0.9235981, 0.8588235, 1, 0, 1,
-0.8041241, 1.472589, -0.1842398, 0.854902, 1, 0, 1,
-0.8038136, -0.690903, -0.09661189, 0.8470588, 1, 0, 1,
-0.7959566, 0.6545975, -0.4928883, 0.8431373, 1, 0, 1,
-0.7942902, 0.04779509, -1.491277, 0.8352941, 1, 0, 1,
-0.7809193, 1.131137, 1.210804, 0.8313726, 1, 0, 1,
-0.7799824, -1.769196, -2.607357, 0.8235294, 1, 0, 1,
-0.7798042, 1.079284, 0.9561005, 0.8196079, 1, 0, 1,
-0.7756931, -0.5861378, -2.987569, 0.8117647, 1, 0, 1,
-0.7726149, 0.4049249, -1.688058, 0.8078431, 1, 0, 1,
-0.7726066, -2.086812, -2.880551, 0.8, 1, 0, 1,
-0.7702339, -0.1640944, -2.755527, 0.7921569, 1, 0, 1,
-0.7685269, -1.973975, -2.645738, 0.7882353, 1, 0, 1,
-0.7653963, 0.9429972, -1.844702, 0.7803922, 1, 0, 1,
-0.7648428, -0.3783005, -2.21523, 0.7764706, 1, 0, 1,
-0.7614499, 0.2718289, 1.104957, 0.7686275, 1, 0, 1,
-0.7561151, 2.221252, -0.648608, 0.7647059, 1, 0, 1,
-0.753648, -0.3642632, -1.634215, 0.7568628, 1, 0, 1,
-0.7518355, -0.3294064, -3.618022, 0.7529412, 1, 0, 1,
-0.7450203, -0.1761197, -2.512134, 0.7450981, 1, 0, 1,
-0.7449136, -0.0711401, -1.282033, 0.7411765, 1, 0, 1,
-0.7315226, -0.6278865, -1.097141, 0.7333333, 1, 0, 1,
-0.7284951, 0.05105933, -1.627794, 0.7294118, 1, 0, 1,
-0.7212761, -0.4981434, -3.690944, 0.7215686, 1, 0, 1,
-0.7206033, 0.4739885, -0.3976663, 0.7176471, 1, 0, 1,
-0.7203354, 0.3889946, -2.269396, 0.7098039, 1, 0, 1,
-0.7178249, -1.885268, -3.931486, 0.7058824, 1, 0, 1,
-0.7172955, -1.058589, -3.167815, 0.6980392, 1, 0, 1,
-0.710324, 0.4064259, -1.68938, 0.6901961, 1, 0, 1,
-0.7061812, -0.247126, -2.996636, 0.6862745, 1, 0, 1,
-0.7041306, -0.02242626, -1.260803, 0.6784314, 1, 0, 1,
-0.6986652, 0.767199, -2.682574, 0.6745098, 1, 0, 1,
-0.6963405, -1.879694, -3.145078, 0.6666667, 1, 0, 1,
-0.6923335, 0.01866314, -1.360162, 0.6627451, 1, 0, 1,
-0.6920567, -1.768447, -2.851699, 0.654902, 1, 0, 1,
-0.6872067, 0.3507745, 0.839306, 0.6509804, 1, 0, 1,
-0.6867961, 0.4681852, -1.253261, 0.6431373, 1, 0, 1,
-0.6852478, -0.2321599, -2.429764, 0.6392157, 1, 0, 1,
-0.6814081, -2.343686, -3.546581, 0.6313726, 1, 0, 1,
-0.6790293, -1.206146, -3.167593, 0.627451, 1, 0, 1,
-0.6713052, -0.1848151, -2.284155, 0.6196079, 1, 0, 1,
-0.6705232, 0.5495555, -2.321079, 0.6156863, 1, 0, 1,
-0.6670828, 2.318808, -0.2509219, 0.6078432, 1, 0, 1,
-0.665265, -0.8187766, -1.722246, 0.6039216, 1, 0, 1,
-0.6630743, 0.2294023, -1.245647, 0.5960785, 1, 0, 1,
-0.6615764, -0.3490729, -1.83381, 0.5882353, 1, 0, 1,
-0.6594478, -0.1158988, -2.649465, 0.5843138, 1, 0, 1,
-0.6584275, -1.810614, -1.317823, 0.5764706, 1, 0, 1,
-0.6513528, -0.1987222, -2.094584, 0.572549, 1, 0, 1,
-0.6502365, -1.546269, -2.747794, 0.5647059, 1, 0, 1,
-0.6500747, 1.055573, 0.1341894, 0.5607843, 1, 0, 1,
-0.6459721, 0.1696267, 0.1771067, 0.5529412, 1, 0, 1,
-0.6414716, 0.3111869, 0.4484498, 0.5490196, 1, 0, 1,
-0.6412123, 1.130051, -1.743709, 0.5411765, 1, 0, 1,
-0.6362517, 2.581702, -1.967121, 0.5372549, 1, 0, 1,
-0.6345622, -0.9333171, -1.892443, 0.5294118, 1, 0, 1,
-0.6313249, 0.04357812, -0.7295734, 0.5254902, 1, 0, 1,
-0.6222278, -1.060746, -1.90888, 0.5176471, 1, 0, 1,
-0.6219572, -1.168403, -2.587685, 0.5137255, 1, 0, 1,
-0.6210189, -0.5250821, -1.482524, 0.5058824, 1, 0, 1,
-0.62082, 0.8888469, -0.3058668, 0.5019608, 1, 0, 1,
-0.619355, -0.1669955, -0.5722402, 0.4941176, 1, 0, 1,
-0.6165494, -1.031137, -3.883742, 0.4862745, 1, 0, 1,
-0.6146038, 1.435349, -0.2116741, 0.4823529, 1, 0, 1,
-0.613265, 0.905332, -1.040754, 0.4745098, 1, 0, 1,
-0.6116764, -1.508541, -3.615861, 0.4705882, 1, 0, 1,
-0.6108969, -0.181748, -3.529158, 0.4627451, 1, 0, 1,
-0.609082, 0.1224561, -1.948088, 0.4588235, 1, 0, 1,
-0.608812, -0.4307008, -2.527474, 0.4509804, 1, 0, 1,
-0.6072462, -0.9792701, -2.276188, 0.4470588, 1, 0, 1,
-0.6048542, -0.7773184, -3.057295, 0.4392157, 1, 0, 1,
-0.6037628, 1.068904, 0.3634399, 0.4352941, 1, 0, 1,
-0.5969369, -2.195788, -3.4972, 0.427451, 1, 0, 1,
-0.5959996, 0.5818876, -0.4254749, 0.4235294, 1, 0, 1,
-0.5937477, 0.473385, -0.7063074, 0.4156863, 1, 0, 1,
-0.5917825, -0.366569, -1.144368, 0.4117647, 1, 0, 1,
-0.5868003, 1.562123, 1.001013, 0.4039216, 1, 0, 1,
-0.5846549, -0.1588006, -0.2474426, 0.3960784, 1, 0, 1,
-0.5827185, 0.696344, -1.944943, 0.3921569, 1, 0, 1,
-0.5782322, -0.4684869, -5.191191, 0.3843137, 1, 0, 1,
-0.5774109, -0.5075085, -3.351989, 0.3803922, 1, 0, 1,
-0.5766656, -1.083422, -2.734163, 0.372549, 1, 0, 1,
-0.5691032, -0.8508326, -2.800239, 0.3686275, 1, 0, 1,
-0.5676262, -1.146266, -4.632421, 0.3607843, 1, 0, 1,
-0.5643017, -0.05022288, -0.9529655, 0.3568628, 1, 0, 1,
-0.5620545, -0.7208306, -2.684366, 0.3490196, 1, 0, 1,
-0.5567188, -0.6416897, -1.419017, 0.345098, 1, 0, 1,
-0.5550826, 0.1736748, -2.067765, 0.3372549, 1, 0, 1,
-0.5524364, 0.9306718, -0.3907405, 0.3333333, 1, 0, 1,
-0.5524078, 0.08134609, -1.975021, 0.3254902, 1, 0, 1,
-0.5516014, -0.4010647, -2.163216, 0.3215686, 1, 0, 1,
-0.5499402, -0.3620809, -1.710477, 0.3137255, 1, 0, 1,
-0.5482783, -0.5182392, -4.693079, 0.3098039, 1, 0, 1,
-0.5434428, 0.3075205, -0.5207253, 0.3019608, 1, 0, 1,
-0.5426831, 1.52585, -1.668117, 0.2941177, 1, 0, 1,
-0.5412585, -0.5943655, -2.609483, 0.2901961, 1, 0, 1,
-0.5403641, -1.610788, -2.5309, 0.282353, 1, 0, 1,
-0.5367109, 0.1834533, 0.122373, 0.2784314, 1, 0, 1,
-0.5361192, -0.05865572, -4.027314, 0.2705882, 1, 0, 1,
-0.5333683, 0.3669924, -0.489178, 0.2666667, 1, 0, 1,
-0.5301293, 0.2084362, -1.162509, 0.2588235, 1, 0, 1,
-0.5294721, -0.3392906, -1.291028, 0.254902, 1, 0, 1,
-0.5294341, -0.9872535, -4.632751, 0.2470588, 1, 0, 1,
-0.5281508, -0.006357756, 0.3413848, 0.2431373, 1, 0, 1,
-0.5247223, 0.8808849, -1.637595, 0.2352941, 1, 0, 1,
-0.5237132, -0.1854524, -3.015325, 0.2313726, 1, 0, 1,
-0.5233958, 0.887508, -2.454709, 0.2235294, 1, 0, 1,
-0.5188465, -0.5768126, -1.868866, 0.2196078, 1, 0, 1,
-0.5159376, 0.3602401, -0.3899582, 0.2117647, 1, 0, 1,
-0.5155172, -0.2705229, -2.063655, 0.2078431, 1, 0, 1,
-0.5150378, 1.341888, 0.1347014, 0.2, 1, 0, 1,
-0.5148697, 0.5517421, -0.7086539, 0.1921569, 1, 0, 1,
-0.5137527, -1.70025, -3.304478, 0.1882353, 1, 0, 1,
-0.5060976, 0.6395211, -1.527102, 0.1803922, 1, 0, 1,
-0.5041658, 0.100141, -2.156015, 0.1764706, 1, 0, 1,
-0.503494, 1.30772, 1.229397, 0.1686275, 1, 0, 1,
-0.5033687, -0.9230902, -2.577065, 0.1647059, 1, 0, 1,
-0.4935415, 1.413275, 0.2126709, 0.1568628, 1, 0, 1,
-0.4910053, 1.662317, 0.5057765, 0.1529412, 1, 0, 1,
-0.4846112, -0.8821572, -2.203017, 0.145098, 1, 0, 1,
-0.4835471, 1.304106, -0.5676773, 0.1411765, 1, 0, 1,
-0.4834658, 1.97776, -1.012058, 0.1333333, 1, 0, 1,
-0.4812236, -0.5798287, -3.150035, 0.1294118, 1, 0, 1,
-0.4807707, -1.863549, -2.844259, 0.1215686, 1, 0, 1,
-0.4802639, -1.945005, -4.016942, 0.1176471, 1, 0, 1,
-0.4763046, -1.131529, -1.797416, 0.1098039, 1, 0, 1,
-0.4732923, -1.562877, -3.012465, 0.1058824, 1, 0, 1,
-0.4714926, 0.6921936, -0.536121, 0.09803922, 1, 0, 1,
-0.4704802, 1.618563, 0.8997687, 0.09019608, 1, 0, 1,
-0.4695945, -0.5515889, -2.805441, 0.08627451, 1, 0, 1,
-0.4684468, -1.707163, -2.453285, 0.07843138, 1, 0, 1,
-0.465189, -1.323565, -1.560429, 0.07450981, 1, 0, 1,
-0.4650629, -0.9729162, -1.646752, 0.06666667, 1, 0, 1,
-0.4619299, 0.1099191, -0.8321256, 0.0627451, 1, 0, 1,
-0.4611558, 0.6751852, -2.018624, 0.05490196, 1, 0, 1,
-0.4609867, -1.108527, -1.892037, 0.05098039, 1, 0, 1,
-0.4609559, -0.2097554, -4.281868, 0.04313726, 1, 0, 1,
-0.4605179, -0.2279379, -2.04851, 0.03921569, 1, 0, 1,
-0.4597563, -0.02867513, -2.136234, 0.03137255, 1, 0, 1,
-0.4549332, -0.7485281, -2.755372, 0.02745098, 1, 0, 1,
-0.4506725, 1.331197, -1.011953, 0.01960784, 1, 0, 1,
-0.4460216, 0.7027023, -1.668275, 0.01568628, 1, 0, 1,
-0.4429328, 0.2680118, -0.1685894, 0.007843138, 1, 0, 1,
-0.4385563, 0.1292727, -1.175899, 0.003921569, 1, 0, 1,
-0.4383364, -1.408515, -2.979579, 0, 1, 0.003921569, 1,
-0.433239, 0.8668686, -2.766307, 0, 1, 0.01176471, 1,
-0.4323964, -0.2038894, -1.398445, 0, 1, 0.01568628, 1,
-0.4286887, -1.477588, -1.8358, 0, 1, 0.02352941, 1,
-0.4186267, 0.2431716, -1.700488, 0, 1, 0.02745098, 1,
-0.415811, 0.5157129, -0.9660535, 0, 1, 0.03529412, 1,
-0.4130998, 0.9054151, -0.008499444, 0, 1, 0.03921569, 1,
-0.4111694, 0.5446593, 0.1074351, 0, 1, 0.04705882, 1,
-0.409727, -0.2163672, -1.658735, 0, 1, 0.05098039, 1,
-0.4091509, -0.194163, -2.412594, 0, 1, 0.05882353, 1,
-0.4083329, 0.08630858, -1.623365, 0, 1, 0.0627451, 1,
-0.4055037, -0.1670405, -2.51244, 0, 1, 0.07058824, 1,
-0.402753, -1.831912, -2.895862, 0, 1, 0.07450981, 1,
-0.3957139, 0.6856997, -0.1234385, 0, 1, 0.08235294, 1,
-0.3944255, 0.9801636, 0.6329951, 0, 1, 0.08627451, 1,
-0.3902612, -1.188607, -3.590051, 0, 1, 0.09411765, 1,
-0.389361, 0.6163249, -0.8764121, 0, 1, 0.1019608, 1,
-0.3887412, 0.531098, -1.246285, 0, 1, 0.1058824, 1,
-0.3883315, -2.115391, -3.601868, 0, 1, 0.1137255, 1,
-0.3875613, 1.029247, -1.233584, 0, 1, 0.1176471, 1,
-0.3857163, 1.163592, -0.9073936, 0, 1, 0.1254902, 1,
-0.3820482, -0.7458218, -1.694729, 0, 1, 0.1294118, 1,
-0.3805062, 0.04992891, -2.889774, 0, 1, 0.1372549, 1,
-0.3780703, -1.367007, -2.783642, 0, 1, 0.1411765, 1,
-0.3730565, 0.6714357, 0.3249528, 0, 1, 0.1490196, 1,
-0.3715565, -0.7927689, -0.7202572, 0, 1, 0.1529412, 1,
-0.3691241, -1.112963, -1.634815, 0, 1, 0.1607843, 1,
-0.3687121, 0.02547279, -1.846667, 0, 1, 0.1647059, 1,
-0.3648947, 1.276434, 1.089599, 0, 1, 0.172549, 1,
-0.3608876, -1.176638, -5.010957, 0, 1, 0.1764706, 1,
-0.3560373, 0.195778, -0.7629321, 0, 1, 0.1843137, 1,
-0.3558426, 2.323686, -0.2564401, 0, 1, 0.1882353, 1,
-0.3546384, 0.8265951, -0.7807987, 0, 1, 0.1960784, 1,
-0.3534027, 0.2186727, -1.130713, 0, 1, 0.2039216, 1,
-0.3530876, 0.7387484, 0.04197248, 0, 1, 0.2078431, 1,
-0.3510133, -1.890396, -3.092232, 0, 1, 0.2156863, 1,
-0.3490572, -0.6171529, -3.532568, 0, 1, 0.2196078, 1,
-0.3486772, 1.3234, 0.4143749, 0, 1, 0.227451, 1,
-0.3473905, -0.5118312, -2.411021, 0, 1, 0.2313726, 1,
-0.3472717, 0.5807683, 0.02015097, 0, 1, 0.2392157, 1,
-0.3445398, 0.09239884, 0.389037, 0, 1, 0.2431373, 1,
-0.3407815, -0.542747, -3.08613, 0, 1, 0.2509804, 1,
-0.3406105, -0.2304284, -4.547494, 0, 1, 0.254902, 1,
-0.3394446, 0.1917267, 1.037947, 0, 1, 0.2627451, 1,
-0.3386878, 0.7007483, -2.158857, 0, 1, 0.2666667, 1,
-0.3373785, 0.5436612, 0.7358589, 0, 1, 0.2745098, 1,
-0.3327982, -1.296925, -2.051839, 0, 1, 0.2784314, 1,
-0.330165, -0.1810286, -2.53136, 0, 1, 0.2862745, 1,
-0.3267504, -0.4132573, -3.193053, 0, 1, 0.2901961, 1,
-0.3113742, -2.361592, -3.307986, 0, 1, 0.2980392, 1,
-0.309523, -1.397725, -3.664675, 0, 1, 0.3058824, 1,
-0.3075946, 0.01333573, -0.7793291, 0, 1, 0.3098039, 1,
-0.3047837, -1.765405, -2.672677, 0, 1, 0.3176471, 1,
-0.3016844, 1.340521, -1.41415, 0, 1, 0.3215686, 1,
-0.2967159, -0.0001867941, -2.149311, 0, 1, 0.3294118, 1,
-0.2941756, -0.04786074, -1.282589, 0, 1, 0.3333333, 1,
-0.2940775, 0.9169306, -0.01551366, 0, 1, 0.3411765, 1,
-0.2921142, 0.2817689, 1.392495, 0, 1, 0.345098, 1,
-0.2917445, -0.3109035, -3.651152, 0, 1, 0.3529412, 1,
-0.2888842, 2.932077, -1.113897, 0, 1, 0.3568628, 1,
-0.2867537, 0.4307147, -1.767733, 0, 1, 0.3647059, 1,
-0.2838463, 0.008633311, -2.370806, 0, 1, 0.3686275, 1,
-0.2833666, -0.09301661, -0.9028105, 0, 1, 0.3764706, 1,
-0.2809135, 0.1212213, -1.54625, 0, 1, 0.3803922, 1,
-0.2783571, 0.2846957, -1.093831, 0, 1, 0.3882353, 1,
-0.2677313, -2.932874, -2.925819, 0, 1, 0.3921569, 1,
-0.2654192, 0.4901145, -0.8601347, 0, 1, 0.4, 1,
-0.2628146, -0.1805168, -3.100663, 0, 1, 0.4078431, 1,
-0.2619996, 1.07843, 0.7252085, 0, 1, 0.4117647, 1,
-0.2599928, -0.6242294, -1.577498, 0, 1, 0.4196078, 1,
-0.2595899, 0.8113056, 0.009079816, 0, 1, 0.4235294, 1,
-0.2581064, -0.4745326, -2.803588, 0, 1, 0.4313726, 1,
-0.2539914, 0.3171746, 0.2140929, 0, 1, 0.4352941, 1,
-0.2490588, 0.3689277, -1.222429, 0, 1, 0.4431373, 1,
-0.2469555, 1.025549, -1.023565, 0, 1, 0.4470588, 1,
-0.2451126, 0.8817695, 0.130028, 0, 1, 0.454902, 1,
-0.2449982, 1.504078, -1.741395, 0, 1, 0.4588235, 1,
-0.2445055, 0.06606884, -1.306582, 0, 1, 0.4666667, 1,
-0.2435065, 1.446393, -0.9334495, 0, 1, 0.4705882, 1,
-0.2426624, 1.045499, 1.122387, 0, 1, 0.4784314, 1,
-0.2403729, -1.807866, -1.860545, 0, 1, 0.4823529, 1,
-0.237133, 0.7388714, -1.224826, 0, 1, 0.4901961, 1,
-0.235849, 0.4495086, -0.6567316, 0, 1, 0.4941176, 1,
-0.2351184, -1.01122, -2.431334, 0, 1, 0.5019608, 1,
-0.2347009, 0.1767837, -0.8889144, 0, 1, 0.509804, 1,
-0.2318768, 0.9237302, -0.0498313, 0, 1, 0.5137255, 1,
-0.2294584, -0.5257473, -2.406048, 0, 1, 0.5215687, 1,
-0.22542, 0.5208201, -0.6964916, 0, 1, 0.5254902, 1,
-0.2242168, 1.165281, 0.910095, 0, 1, 0.5333334, 1,
-0.2231167, -1.019218, -2.954421, 0, 1, 0.5372549, 1,
-0.2165266, -0.3061038, -2.214024, 0, 1, 0.5450981, 1,
-0.2081636, 1.949453, 0.05463425, 0, 1, 0.5490196, 1,
-0.2040942, 0.5469736, -0.998711, 0, 1, 0.5568628, 1,
-0.201412, 0.2922611, -1.103339, 0, 1, 0.5607843, 1,
-0.2003452, -0.5484911, -2.756121, 0, 1, 0.5686275, 1,
-0.1971694, -0.1671196, -4.431519, 0, 1, 0.572549, 1,
-0.193928, 0.4492493, 0.9539768, 0, 1, 0.5803922, 1,
-0.1900267, -1.403821, -2.735527, 0, 1, 0.5843138, 1,
-0.1879164, -0.3392522, -4.416916, 0, 1, 0.5921569, 1,
-0.18754, 0.05091867, -0.2975756, 0, 1, 0.5960785, 1,
-0.1870381, -0.330018, -1.875886, 0, 1, 0.6039216, 1,
-0.1859873, -1.064374, -1.044186, 0, 1, 0.6117647, 1,
-0.1806708, -1.530838, -2.697436, 0, 1, 0.6156863, 1,
-0.1798993, 0.5611241, -1.266536, 0, 1, 0.6235294, 1,
-0.1796935, -0.9671474, -2.904459, 0, 1, 0.627451, 1,
-0.1745542, 0.4312123, 0.5029159, 0, 1, 0.6352941, 1,
-0.1664628, 0.6330312, -0.128045, 0, 1, 0.6392157, 1,
-0.1593805, 0.5544664, -0.7520933, 0, 1, 0.6470588, 1,
-0.1590647, 0.5228751, -1.528508, 0, 1, 0.6509804, 1,
-0.1551781, 1.1576, 0.5703717, 0, 1, 0.6588235, 1,
-0.1463893, 0.2292898, 0.8984821, 0, 1, 0.6627451, 1,
-0.1463804, -1.695489, -2.261647, 0, 1, 0.6705883, 1,
-0.1440242, -1.196203, -4.586723, 0, 1, 0.6745098, 1,
-0.140377, 0.9050856, 1.430557, 0, 1, 0.682353, 1,
-0.1358446, -1.030692, -3.375153, 0, 1, 0.6862745, 1,
-0.1307399, 0.9848952, -0.4930736, 0, 1, 0.6941177, 1,
-0.1304368, -0.2731473, -1.915275, 0, 1, 0.7019608, 1,
-0.1296738, 0.1389888, 0.9499996, 0, 1, 0.7058824, 1,
-0.1289525, 0.9714243, -0.9432563, 0, 1, 0.7137255, 1,
-0.1287607, -1.903138, -2.802008, 0, 1, 0.7176471, 1,
-0.1250218, 0.3444503, -0.9499977, 0, 1, 0.7254902, 1,
-0.1233087, -1.175963, -2.982333, 0, 1, 0.7294118, 1,
-0.1218665, 0.05012473, -0.540804, 0, 1, 0.7372549, 1,
-0.1203518, 2.981423, -0.3402109, 0, 1, 0.7411765, 1,
-0.1131666, 1.008066, -0.7677315, 0, 1, 0.7490196, 1,
-0.1039864, 1.630221, 0.4259406, 0, 1, 0.7529412, 1,
-0.1025411, 1.468546, -0.006340482, 0, 1, 0.7607843, 1,
-0.1018344, -0.07268941, -2.961543, 0, 1, 0.7647059, 1,
-0.1012263, -1.252017, -2.469608, 0, 1, 0.772549, 1,
-0.09768221, 1.345569, 0.2492329, 0, 1, 0.7764706, 1,
-0.09593689, 0.146452, -0.6053788, 0, 1, 0.7843137, 1,
-0.09524494, -0.6626131, -1.983428, 0, 1, 0.7882353, 1,
-0.08541499, 1.409447, -0.5321327, 0, 1, 0.7960784, 1,
-0.0783832, 1.606431, -1.792536, 0, 1, 0.8039216, 1,
-0.07443956, 0.8434803, -1.780246, 0, 1, 0.8078431, 1,
-0.07070915, -0.1162194, -2.422932, 0, 1, 0.8156863, 1,
-0.06841207, 0.4415371, 1.131322, 0, 1, 0.8196079, 1,
-0.06598698, -0.2297194, -1.695462, 0, 1, 0.827451, 1,
-0.06362648, 0.9311573, 0.01997166, 0, 1, 0.8313726, 1,
-0.06227132, -0.5886255, -1.602907, 0, 1, 0.8392157, 1,
-0.06055428, -1.658002, -2.189606, 0, 1, 0.8431373, 1,
-0.05723823, -1.13488, -2.901165, 0, 1, 0.8509804, 1,
-0.05327851, -1.124736, -3.385212, 0, 1, 0.854902, 1,
-0.05298181, 0.6776096, -0.6968542, 0, 1, 0.8627451, 1,
-0.05203816, 0.6790863, -0.9915717, 0, 1, 0.8666667, 1,
-0.05143533, -1.030896, -2.074255, 0, 1, 0.8745098, 1,
-0.05081116, 0.005606595, -1.8313, 0, 1, 0.8784314, 1,
-0.04466214, -0.8253471, -3.110438, 0, 1, 0.8862745, 1,
-0.04445845, -0.6954967, -2.401499, 0, 1, 0.8901961, 1,
-0.04362497, 0.0583564, -0.6496866, 0, 1, 0.8980392, 1,
-0.041468, -0.4280806, -2.761409, 0, 1, 0.9058824, 1,
-0.02936628, 0.4903553, 0.06168772, 0, 1, 0.9098039, 1,
-0.02621333, 0.06254887, 1.114662, 0, 1, 0.9176471, 1,
-0.02536423, -0.2647916, -1.671923, 0, 1, 0.9215686, 1,
-0.01864554, 1.137081, -1.718684, 0, 1, 0.9294118, 1,
-0.01514808, 0.3911949, -0.9667353, 0, 1, 0.9333333, 1,
-0.01125872, -0.8544828, -4.75563, 0, 1, 0.9411765, 1,
-0.007172771, 1.63417, 0.7882487, 0, 1, 0.945098, 1,
-0.002256604, -0.3287655, -3.288222, 0, 1, 0.9529412, 1,
-0.0001933576, -0.772835, -2.610214, 0, 1, 0.9568627, 1,
0.002608691, -0.7265308, 2.869635, 0, 1, 0.9647059, 1,
0.004937029, -0.9478303, 3.042673, 0, 1, 0.9686275, 1,
0.006181596, -1.019927, 2.608061, 0, 1, 0.9764706, 1,
0.007366213, 0.847805, -1.487655, 0, 1, 0.9803922, 1,
0.008998513, 2.25865, -1.024357, 0, 1, 0.9882353, 1,
0.009564837, -0.08344883, 5.134696, 0, 1, 0.9921569, 1,
0.01611866, 0.8146212, 0.9436622, 0, 1, 1, 1,
0.02180097, -1.416904, 2.397743, 0, 0.9921569, 1, 1,
0.02258787, -1.443223, 2.586411, 0, 0.9882353, 1, 1,
0.02310346, -0.07877709, 1.292647, 0, 0.9803922, 1, 1,
0.02460097, -0.1420283, 2.609994, 0, 0.9764706, 1, 1,
0.02519354, -1.374605, 3.474243, 0, 0.9686275, 1, 1,
0.02564422, -2.65704, 1.600211, 0, 0.9647059, 1, 1,
0.02587073, -0.3825788, 2.370678, 0, 0.9568627, 1, 1,
0.02600371, -0.08366772, 2.58512, 0, 0.9529412, 1, 1,
0.02723962, -0.05924734, 4.822385, 0, 0.945098, 1, 1,
0.03134464, -0.7684865, 3.655172, 0, 0.9411765, 1, 1,
0.03262202, 1.505375, -1.631133, 0, 0.9333333, 1, 1,
0.0429497, -0.4501663, 2.775294, 0, 0.9294118, 1, 1,
0.04524948, -0.682734, 2.201188, 0, 0.9215686, 1, 1,
0.04736828, 0.2637815, -0.9771331, 0, 0.9176471, 1, 1,
0.04956435, 0.8375211, -0.6768562, 0, 0.9098039, 1, 1,
0.0511089, -0.5774196, 5.244823, 0, 0.9058824, 1, 1,
0.0560151, -0.6261245, 3.990471, 0, 0.8980392, 1, 1,
0.05668587, -0.3009351, 1.474246, 0, 0.8901961, 1, 1,
0.05937414, 0.2058621, 0.7409294, 0, 0.8862745, 1, 1,
0.05980598, 0.7137963, 0.03611971, 0, 0.8784314, 1, 1,
0.05995202, 0.3091693, 2.331922, 0, 0.8745098, 1, 1,
0.06123987, 0.1537254, 2.541868, 0, 0.8666667, 1, 1,
0.06169321, -0.9386646, 1.733174, 0, 0.8627451, 1, 1,
0.06181571, -0.1875538, 3.103871, 0, 0.854902, 1, 1,
0.06239907, 0.4484252, 0.01612647, 0, 0.8509804, 1, 1,
0.07050508, -0.3327774, 2.31121, 0, 0.8431373, 1, 1,
0.07125111, -0.212419, 2.853366, 0, 0.8392157, 1, 1,
0.07177791, -0.7978299, 3.097122, 0, 0.8313726, 1, 1,
0.07194766, -1.707606, 2.446354, 0, 0.827451, 1, 1,
0.07247816, -0.305891, 3.757706, 0, 0.8196079, 1, 1,
0.07306976, 0.5997178, -0.02775139, 0, 0.8156863, 1, 1,
0.07843094, -2.749367, 2.897749, 0, 0.8078431, 1, 1,
0.07980454, -0.7452068, 1.982064, 0, 0.8039216, 1, 1,
0.08047863, -0.9605514, 2.941732, 0, 0.7960784, 1, 1,
0.08217991, 1.539965, 0.9268905, 0, 0.7882353, 1, 1,
0.08512452, -2.535215, 3.691962, 0, 0.7843137, 1, 1,
0.08983294, 0.05001571, 2.22926, 0, 0.7764706, 1, 1,
0.09132609, -0.01775951, 1.30738, 0, 0.772549, 1, 1,
0.09135581, -0.3973962, 2.828462, 0, 0.7647059, 1, 1,
0.09173623, -0.2032665, 3.622368, 0, 0.7607843, 1, 1,
0.09551026, 0.04107822, 1.580138, 0, 0.7529412, 1, 1,
0.09611634, -0.8334543, 4.648139, 0, 0.7490196, 1, 1,
0.09914801, 2.178368, -2.727443, 0, 0.7411765, 1, 1,
0.09953013, 1.1057, 0.4904436, 0, 0.7372549, 1, 1,
0.09996755, -0.4773752, 2.852969, 0, 0.7294118, 1, 1,
0.1041512, -1.443784, 2.018758, 0, 0.7254902, 1, 1,
0.1076897, 1.152566, 1.309242, 0, 0.7176471, 1, 1,
0.109967, 0.5011604, 0.06491526, 0, 0.7137255, 1, 1,
0.1153302, 0.5932547, 1.091598, 0, 0.7058824, 1, 1,
0.1161903, -0.4377598, 3.837792, 0, 0.6980392, 1, 1,
0.1176602, 0.01087109, 2.097829, 0, 0.6941177, 1, 1,
0.1179321, 1.635712, -2.072246, 0, 0.6862745, 1, 1,
0.1191177, 1.197754, 0.5263143, 0, 0.682353, 1, 1,
0.1201701, -0.830197, 2.161639, 0, 0.6745098, 1, 1,
0.1211051, -1.031169, 1.594733, 0, 0.6705883, 1, 1,
0.1239658, -1.616915, 2.650575, 0, 0.6627451, 1, 1,
0.1287596, 1.229762, 0.3290844, 0, 0.6588235, 1, 1,
0.1302285, -2.744255, 1.977461, 0, 0.6509804, 1, 1,
0.1306335, 1.100552, 1.204675, 0, 0.6470588, 1, 1,
0.1320029, 0.5486645, 0.7328888, 0, 0.6392157, 1, 1,
0.1322922, 0.6679575, 0.5834458, 0, 0.6352941, 1, 1,
0.1346842, 1.102887, -1.456976, 0, 0.627451, 1, 1,
0.1373799, 0.7776169, 1.43789, 0, 0.6235294, 1, 1,
0.1387514, 0.6915236, 1.611015, 0, 0.6156863, 1, 1,
0.1476019, 1.140431, -1.142166, 0, 0.6117647, 1, 1,
0.1492135, 1.221379, 1.018468, 0, 0.6039216, 1, 1,
0.1518224, 0.01262616, 3.914079, 0, 0.5960785, 1, 1,
0.155875, -0.8858976, 0.5794981, 0, 0.5921569, 1, 1,
0.1568929, -0.60786, 0.5152857, 0, 0.5843138, 1, 1,
0.1633067, -0.2638987, 1.435488, 0, 0.5803922, 1, 1,
0.1660086, 0.5030887, 1.164475, 0, 0.572549, 1, 1,
0.1664115, 0.3928834, 1.477631, 0, 0.5686275, 1, 1,
0.1676738, 0.6362149, -0.04932725, 0, 0.5607843, 1, 1,
0.1728823, 1.986791, 1.049278, 0, 0.5568628, 1, 1,
0.1851887, 0.8538839, 1.052982, 0, 0.5490196, 1, 1,
0.1887406, -0.9966907, 2.940409, 0, 0.5450981, 1, 1,
0.1927408, 0.8959302, 0.5628762, 0, 0.5372549, 1, 1,
0.1973343, 0.993544, 0.2482114, 0, 0.5333334, 1, 1,
0.2031066, -1.602491, 4.321743, 0, 0.5254902, 1, 1,
0.2061728, 0.4948561, -0.1266998, 0, 0.5215687, 1, 1,
0.2082497, 1.180343, 0.3128278, 0, 0.5137255, 1, 1,
0.2100218, -0.3158391, 3.56691, 0, 0.509804, 1, 1,
0.2144309, 1.531278, -1.912238, 0, 0.5019608, 1, 1,
0.220729, -0.08426674, 2.356635, 0, 0.4941176, 1, 1,
0.2213628, 1.680401, 1.012196, 0, 0.4901961, 1, 1,
0.221627, -0.4065379, 3.380841, 0, 0.4823529, 1, 1,
0.2227698, -0.2999127, 2.647357, 0, 0.4784314, 1, 1,
0.2231441, 0.9823032, -0.3480411, 0, 0.4705882, 1, 1,
0.2248142, 0.4120221, -0.4003162, 0, 0.4666667, 1, 1,
0.2275665, 0.2214175, 1.292906, 0, 0.4588235, 1, 1,
0.2286751, -0.01625747, 3.252225, 0, 0.454902, 1, 1,
0.2349981, -1.386303, 2.69142, 0, 0.4470588, 1, 1,
0.2357682, 0.6951107, 0.9382589, 0, 0.4431373, 1, 1,
0.2406756, 0.8227772, -0.3331763, 0, 0.4352941, 1, 1,
0.2417136, 1.056861, 0.8490328, 0, 0.4313726, 1, 1,
0.2420876, 0.02800861, 0.07111519, 0, 0.4235294, 1, 1,
0.2444856, 0.2979842, -0.6286726, 0, 0.4196078, 1, 1,
0.2513458, 1.721391, -0.3521017, 0, 0.4117647, 1, 1,
0.2549592, -0.161999, 2.201258, 0, 0.4078431, 1, 1,
0.2564466, 0.2844112, 0.8048321, 0, 0.4, 1, 1,
0.2564906, 1.555106, 0.3690796, 0, 0.3921569, 1, 1,
0.2571824, 0.1314661, 1.586242, 0, 0.3882353, 1, 1,
0.2595549, 0.6147343, 0.2451913, 0, 0.3803922, 1, 1,
0.2597582, 0.7222259, 0.2762643, 0, 0.3764706, 1, 1,
0.2626994, -0.4711758, 1.956127, 0, 0.3686275, 1, 1,
0.2630956, 1.626024, 0.07508442, 0, 0.3647059, 1, 1,
0.2633676, 1.921273, 0.2693587, 0, 0.3568628, 1, 1,
0.2671808, 0.4951086, 0.4293205, 0, 0.3529412, 1, 1,
0.2764934, -0.316404, 3.197915, 0, 0.345098, 1, 1,
0.279797, -1.529364, 1.693214, 0, 0.3411765, 1, 1,
0.2877269, 0.1021939, 2.339395, 0, 0.3333333, 1, 1,
0.2889539, 0.1847773, 1.190152, 0, 0.3294118, 1, 1,
0.2917575, 0.6432382, 1.700854, 0, 0.3215686, 1, 1,
0.2936868, 0.5876317, 2.445382, 0, 0.3176471, 1, 1,
0.2953052, -0.3445644, 2.999069, 0, 0.3098039, 1, 1,
0.2965158, 0.1316543, 3.218153, 0, 0.3058824, 1, 1,
0.3038158, -0.07721607, 1.660418, 0, 0.2980392, 1, 1,
0.3044149, 0.05458331, -0.04096829, 0, 0.2901961, 1, 1,
0.3060771, -1.139044, 2.908831, 0, 0.2862745, 1, 1,
0.3147746, -0.4988225, 1.45385, 0, 0.2784314, 1, 1,
0.3157728, 0.6824737, 0.6074973, 0, 0.2745098, 1, 1,
0.3185104, 0.9110876, -1.059533, 0, 0.2666667, 1, 1,
0.3241545, -0.06787097, 3.862915, 0, 0.2627451, 1, 1,
0.3242076, 0.8435348, 2.200485, 0, 0.254902, 1, 1,
0.3279413, 0.3964306, 2.059287, 0, 0.2509804, 1, 1,
0.3300414, -0.219046, 2.814471, 0, 0.2431373, 1, 1,
0.3355519, -0.5942746, 1.326975, 0, 0.2392157, 1, 1,
0.3364337, 1.185774, -0.2416512, 0, 0.2313726, 1, 1,
0.3373652, -1.514476, 4.558617, 0, 0.227451, 1, 1,
0.3387219, -0.7375517, 3.586055, 0, 0.2196078, 1, 1,
0.3430674, -0.6589595, 2.053722, 0, 0.2156863, 1, 1,
0.3435388, -0.3487542, 1.633224, 0, 0.2078431, 1, 1,
0.3441466, 0.4984711, 0.379027, 0, 0.2039216, 1, 1,
0.3447742, -0.8318161, 2.84862, 0, 0.1960784, 1, 1,
0.347528, 0.7723041, 1.029947, 0, 0.1882353, 1, 1,
0.3482179, -0.1490231, 2.013027, 0, 0.1843137, 1, 1,
0.3488499, 0.06924794, 0.6151256, 0, 0.1764706, 1, 1,
0.3565879, -0.1707691, 2.525891, 0, 0.172549, 1, 1,
0.3569742, -0.2797764, 0.9236785, 0, 0.1647059, 1, 1,
0.3653209, 0.1497595, 0.7179988, 0, 0.1607843, 1, 1,
0.3694765, -0.6639078, 2.260717, 0, 0.1529412, 1, 1,
0.3712016, -0.1961977, 3.267349, 0, 0.1490196, 1, 1,
0.3751684, 2.01283, 1.652524, 0, 0.1411765, 1, 1,
0.3765389, -1.688172, 4.428014, 0, 0.1372549, 1, 1,
0.3828085, -0.1913861, 0.3568766, 0, 0.1294118, 1, 1,
0.3835481, 0.4147223, 1.424349, 0, 0.1254902, 1, 1,
0.3864477, 0.7624862, 1.426864, 0, 0.1176471, 1, 1,
0.3887785, -0.2989159, 3.523653, 0, 0.1137255, 1, 1,
0.3946253, 1.662208, -0.01873005, 0, 0.1058824, 1, 1,
0.4018693, -0.5382563, 1.081271, 0, 0.09803922, 1, 1,
0.4020517, 0.1606425, 1.892842, 0, 0.09411765, 1, 1,
0.4041736, 1.27568, 0.7109419, 0, 0.08627451, 1, 1,
0.4054728, 0.3199011, 0.06226607, 0, 0.08235294, 1, 1,
0.4060119, 0.8390482, -1.584388, 0, 0.07450981, 1, 1,
0.4132009, 0.1314467, 2.304072, 0, 0.07058824, 1, 1,
0.4137422, 0.1071221, -0.1450648, 0, 0.0627451, 1, 1,
0.4138603, -0.09800543, -0.6970897, 0, 0.05882353, 1, 1,
0.414892, -1.685701, 4.585922, 0, 0.05098039, 1, 1,
0.4157601, 1.045177, 0.1655217, 0, 0.04705882, 1, 1,
0.4159898, -0.3924943, 1.009521, 0, 0.03921569, 1, 1,
0.424441, 1.168443, -1.184703, 0, 0.03529412, 1, 1,
0.4249098, 1.48097, 0.5612466, 0, 0.02745098, 1, 1,
0.43053, 0.5255846, -0.7031255, 0, 0.02352941, 1, 1,
0.4329603, 1.064278, 0.8599977, 0, 0.01568628, 1, 1,
0.4332882, 0.5215956, 0.767506, 0, 0.01176471, 1, 1,
0.4359217, -1.818387, 1.842177, 0, 0.003921569, 1, 1,
0.4438159, 0.6166697, 1.253113, 0.003921569, 0, 1, 1,
0.4479361, 0.09853055, 2.569613, 0.007843138, 0, 1, 1,
0.4484953, -0.7362409, 3.529297, 0.01568628, 0, 1, 1,
0.45133, -1.373755, 4.200276, 0.01960784, 0, 1, 1,
0.4519953, 2.292259, -0.08763161, 0.02745098, 0, 1, 1,
0.4532689, 0.8797398, 0.4656073, 0.03137255, 0, 1, 1,
0.4541585, 0.07988054, -0.7517086, 0.03921569, 0, 1, 1,
0.4581008, -0.2924786, 2.488867, 0.04313726, 0, 1, 1,
0.4583919, 0.1582381, 0.6115974, 0.05098039, 0, 1, 1,
0.4591092, -0.3901391, 2.191973, 0.05490196, 0, 1, 1,
0.4610363, 0.4705437, 0.614152, 0.0627451, 0, 1, 1,
0.4660446, -2.142311, 4.481223, 0.06666667, 0, 1, 1,
0.4671025, -0.3773468, 2.418218, 0.07450981, 0, 1, 1,
0.4727422, 0.3359238, 0.569559, 0.07843138, 0, 1, 1,
0.474147, 1.070455, 0.6318638, 0.08627451, 0, 1, 1,
0.4757379, -0.9050828, 4.741353, 0.09019608, 0, 1, 1,
0.4766231, 2.02619, 0.5987623, 0.09803922, 0, 1, 1,
0.4842644, -0.3445762, 1.413753, 0.1058824, 0, 1, 1,
0.485302, 0.9635782, 0.811312, 0.1098039, 0, 1, 1,
0.4868318, -0.3574672, 0.05161883, 0.1176471, 0, 1, 1,
0.4873454, -0.552624, 1.936193, 0.1215686, 0, 1, 1,
0.4882105, -2.444519, 2.318589, 0.1294118, 0, 1, 1,
0.4895403, 0.1986788, 0.6119938, 0.1333333, 0, 1, 1,
0.4906316, 1.182581, -0.0710386, 0.1411765, 0, 1, 1,
0.4914759, 0.9927126, 1.114584, 0.145098, 0, 1, 1,
0.4933299, 1.487728, -0.3636267, 0.1529412, 0, 1, 1,
0.4949989, -0.3543126, 3.353836, 0.1568628, 0, 1, 1,
0.5007439, -0.6322657, 2.897172, 0.1647059, 0, 1, 1,
0.5020409, -0.7779949, 1.633565, 0.1686275, 0, 1, 1,
0.5044001, -0.675538, 2.768766, 0.1764706, 0, 1, 1,
0.5056528, -0.268398, 1.868146, 0.1803922, 0, 1, 1,
0.5100039, -1.666427, 3.77533, 0.1882353, 0, 1, 1,
0.510193, 0.9076787, 0.8781511, 0.1921569, 0, 1, 1,
0.5120613, 0.4900221, 0.7564611, 0.2, 0, 1, 1,
0.5133448, -0.5126586, 1.719142, 0.2078431, 0, 1, 1,
0.5156764, 0.7100809, 1.593062, 0.2117647, 0, 1, 1,
0.5163896, -1.768047, 2.204421, 0.2196078, 0, 1, 1,
0.5203592, 1.087956, -0.5984109, 0.2235294, 0, 1, 1,
0.5206916, -2.065485, 2.302007, 0.2313726, 0, 1, 1,
0.5212682, 0.004412474, 2.051085, 0.2352941, 0, 1, 1,
0.5268756, -0.1563773, 0.007592394, 0.2431373, 0, 1, 1,
0.5300736, 0.7215976, 0.07938813, 0.2470588, 0, 1, 1,
0.5301465, -1.404072, 3.10949, 0.254902, 0, 1, 1,
0.5319559, -0.4506415, 3.993205, 0.2588235, 0, 1, 1,
0.5321394, 1.898526, 0.5232582, 0.2666667, 0, 1, 1,
0.5333356, -3.027865, 2.579146, 0.2705882, 0, 1, 1,
0.5382996, -0.1893641, 2.623751, 0.2784314, 0, 1, 1,
0.5417104, -0.950964, 2.672827, 0.282353, 0, 1, 1,
0.5441322, 1.051909, 0.9071283, 0.2901961, 0, 1, 1,
0.5512741, -0.4723419, 0.5392261, 0.2941177, 0, 1, 1,
0.5568314, -1.158536, 0.853561, 0.3019608, 0, 1, 1,
0.5577468, 1.203495, -0.2820309, 0.3098039, 0, 1, 1,
0.5594156, 1.024831, -0.1022232, 0.3137255, 0, 1, 1,
0.5620611, 0.530369, 0.5510557, 0.3215686, 0, 1, 1,
0.5639881, 0.818846, -0.276838, 0.3254902, 0, 1, 1,
0.5644699, 0.6307298, 0.9337134, 0.3333333, 0, 1, 1,
0.5715952, -0.1364006, 1.347134, 0.3372549, 0, 1, 1,
0.5725331, -1.373811, 3.467306, 0.345098, 0, 1, 1,
0.5731518, 0.1827509, 0.9232275, 0.3490196, 0, 1, 1,
0.5751336, 0.3439218, -0.5830997, 0.3568628, 0, 1, 1,
0.5842195, 1.942138, 2.133576, 0.3607843, 0, 1, 1,
0.5897099, -0.1587412, 2.065466, 0.3686275, 0, 1, 1,
0.5912027, -1.010222, 1.352283, 0.372549, 0, 1, 1,
0.5912726, -1.333251, 1.407655, 0.3803922, 0, 1, 1,
0.5982761, -0.5182044, 1.478466, 0.3843137, 0, 1, 1,
0.6006942, -0.2404329, 1.863377, 0.3921569, 0, 1, 1,
0.6019939, -0.4281366, 1.731045, 0.3960784, 0, 1, 1,
0.6034928, -0.9638147, 2.173045, 0.4039216, 0, 1, 1,
0.6050169, 1.410749, -0.8734682, 0.4117647, 0, 1, 1,
0.6055402, 0.9110059, -0.3969962, 0.4156863, 0, 1, 1,
0.6067778, -1.638258, 3.957534, 0.4235294, 0, 1, 1,
0.6072195, -0.5462198, 2.266951, 0.427451, 0, 1, 1,
0.607453, 0.775448, 0.8736933, 0.4352941, 0, 1, 1,
0.612008, 2.411124, 0.9088776, 0.4392157, 0, 1, 1,
0.6153119, 0.9258681, 1.539376, 0.4470588, 0, 1, 1,
0.6163535, -1.240179, 1.73436, 0.4509804, 0, 1, 1,
0.617064, -0.7638848, 2.227044, 0.4588235, 0, 1, 1,
0.6177308, -0.294314, 1.979628, 0.4627451, 0, 1, 1,
0.6315721, 1.657764, 0.309265, 0.4705882, 0, 1, 1,
0.6320005, -0.3000756, 2.20008, 0.4745098, 0, 1, 1,
0.6326743, 2.134553, -0.9202662, 0.4823529, 0, 1, 1,
0.6328542, -0.30916, 1.856945, 0.4862745, 0, 1, 1,
0.6334225, 0.04747526, -0.3472582, 0.4941176, 0, 1, 1,
0.6373274, -1.022004, 2.836324, 0.5019608, 0, 1, 1,
0.6396964, -0.3776796, 0.1286167, 0.5058824, 0, 1, 1,
0.6436511, -2.099689, 2.862051, 0.5137255, 0, 1, 1,
0.6469913, -0.4700162, 2.730936, 0.5176471, 0, 1, 1,
0.647756, -0.04444935, 3.772285, 0.5254902, 0, 1, 1,
0.6501503, 0.8959637, 1.042362, 0.5294118, 0, 1, 1,
0.6509644, 0.364673, 0.5703069, 0.5372549, 0, 1, 1,
0.6564707, 0.8371511, -0.2737753, 0.5411765, 0, 1, 1,
0.6568187, -1.012321, 2.124513, 0.5490196, 0, 1, 1,
0.6600834, 1.766036, 1.801182, 0.5529412, 0, 1, 1,
0.6612739, -0.8670929, 1.935148, 0.5607843, 0, 1, 1,
0.668942, 0.03231657, -1.382405, 0.5647059, 0, 1, 1,
0.6698426, 1.572044, 2.104216, 0.572549, 0, 1, 1,
0.6757462, -1.901416, 2.77493, 0.5764706, 0, 1, 1,
0.6819356, -0.5287634, 2.121308, 0.5843138, 0, 1, 1,
0.6847415, -0.1317578, 0.8210396, 0.5882353, 0, 1, 1,
0.6909283, -0.1415129, 2.459456, 0.5960785, 0, 1, 1,
0.6931388, 0.8459069, -0.3728586, 0.6039216, 0, 1, 1,
0.6933047, 0.7374417, 0.2083212, 0.6078432, 0, 1, 1,
0.6952771, 1.275021, 0.3036376, 0.6156863, 0, 1, 1,
0.7071388, -0.3951466, 2.718577, 0.6196079, 0, 1, 1,
0.710527, -1.005135, 1.169316, 0.627451, 0, 1, 1,
0.7126592, 0.6188965, 2.434027, 0.6313726, 0, 1, 1,
0.7253047, -0.5862589, 2.895627, 0.6392157, 0, 1, 1,
0.7255391, 0.0717676, 1.753833, 0.6431373, 0, 1, 1,
0.7255919, -1.664891, 2.391074, 0.6509804, 0, 1, 1,
0.7270017, -0.1705901, 1.866277, 0.654902, 0, 1, 1,
0.7293639, 0.0065836, 0.9852198, 0.6627451, 0, 1, 1,
0.7309079, 0.3825859, 1.928714, 0.6666667, 0, 1, 1,
0.7331352, -0.345249, 1.567008, 0.6745098, 0, 1, 1,
0.7372171, 0.09286218, -0.6507945, 0.6784314, 0, 1, 1,
0.7434154, 1.371042, 1.655651, 0.6862745, 0, 1, 1,
0.7497236, 1.162585, 1.777527, 0.6901961, 0, 1, 1,
0.7521763, 1.546069, 1.602101, 0.6980392, 0, 1, 1,
0.7531082, -0.2303559, 0.08027793, 0.7058824, 0, 1, 1,
0.7554081, 0.9444784, 0.3989456, 0.7098039, 0, 1, 1,
0.7554355, 0.8579756, 0.8507358, 0.7176471, 0, 1, 1,
0.7557998, 0.9512506, 0.780365, 0.7215686, 0, 1, 1,
0.7606937, -1.290501, 1.729151, 0.7294118, 0, 1, 1,
0.7610719, 0.2895557, 0.3059087, 0.7333333, 0, 1, 1,
0.7660281, -0.7633247, 1.747845, 0.7411765, 0, 1, 1,
0.7702867, 0.7729875, 0.7032714, 0.7450981, 0, 1, 1,
0.7736601, -1.821638, 4.092155, 0.7529412, 0, 1, 1,
0.7740232, 0.173316, 1.830331, 0.7568628, 0, 1, 1,
0.784889, 0.03318238, 2.789882, 0.7647059, 0, 1, 1,
0.7878892, 1.934912, -0.7297725, 0.7686275, 0, 1, 1,
0.7894417, -0.01250933, 1.511334, 0.7764706, 0, 1, 1,
0.7900789, -1.719095, 2.962626, 0.7803922, 0, 1, 1,
0.7931442, -1.995751, 1.626492, 0.7882353, 0, 1, 1,
0.795767, -0.6290418, 3.094138, 0.7921569, 0, 1, 1,
0.7979804, 0.2575386, 1.103173, 0.8, 0, 1, 1,
0.8076563, 1.502679, -0.8884841, 0.8078431, 0, 1, 1,
0.8078089, -0.4297813, 1.444867, 0.8117647, 0, 1, 1,
0.8108186, 0.09976443, 1.303809, 0.8196079, 0, 1, 1,
0.8137438, 0.364558, 2.079367, 0.8235294, 0, 1, 1,
0.8253692, -0.9522467, 2.686767, 0.8313726, 0, 1, 1,
0.8270192, -1.09197, 3.464309, 0.8352941, 0, 1, 1,
0.8302541, -0.3135924, 2.755067, 0.8431373, 0, 1, 1,
0.8330988, 2.516779, -0.4589244, 0.8470588, 0, 1, 1,
0.8366027, 0.003102615, 1.983075, 0.854902, 0, 1, 1,
0.8470982, 1.072386, 0.4704215, 0.8588235, 0, 1, 1,
0.8495297, 0.6451831, 1.343856, 0.8666667, 0, 1, 1,
0.8498955, 2.065917, 1.056518, 0.8705882, 0, 1, 1,
0.8559114, 0.806647, 0.4219538, 0.8784314, 0, 1, 1,
0.8564855, -0.7314944, 1.751032, 0.8823529, 0, 1, 1,
0.8594775, -0.05949328, 0.860666, 0.8901961, 0, 1, 1,
0.8607654, -0.2671445, 0.5933941, 0.8941177, 0, 1, 1,
0.8614118, 0.2162284, 1.620876, 0.9019608, 0, 1, 1,
0.8632661, -0.09802914, 3.025967, 0.9098039, 0, 1, 1,
0.8637118, 0.4955395, 1.252384, 0.9137255, 0, 1, 1,
0.8883282, -0.01111336, 3.966473, 0.9215686, 0, 1, 1,
0.8885508, 0.2821972, 3.450047, 0.9254902, 0, 1, 1,
0.895596, 0.1676475, 1.537605, 0.9333333, 0, 1, 1,
0.8958719, -1.244948, 2.803427, 0.9372549, 0, 1, 1,
0.9014254, -0.07557978, 0.2807886, 0.945098, 0, 1, 1,
0.9034399, -0.4145356, 1.495469, 0.9490196, 0, 1, 1,
0.9043404, 0.04351912, 2.147471, 0.9568627, 0, 1, 1,
0.9085428, -0.4240979, 0.8433515, 0.9607843, 0, 1, 1,
0.9103728, 0.4271002, 0.5140704, 0.9686275, 0, 1, 1,
0.9200864, 1.307653, 2.903528, 0.972549, 0, 1, 1,
0.9212236, 1.61704, 1.346768, 0.9803922, 0, 1, 1,
0.9233988, 0.8990786, 0.6786103, 0.9843137, 0, 1, 1,
0.9266581, 0.0916829, 0.7789583, 0.9921569, 0, 1, 1,
0.9270533, -0.3594278, 2.039276, 0.9960784, 0, 1, 1,
0.9301645, -0.7391375, 3.462983, 1, 0, 0.9960784, 1,
0.9338117, 0.1416707, 1.779553, 1, 0, 0.9882353, 1,
0.943975, -1.56097, 5.627158, 1, 0, 0.9843137, 1,
0.9444888, 0.6924851, 2.30127, 1, 0, 0.9764706, 1,
0.9485419, -0.2902047, 2.791742, 1, 0, 0.972549, 1,
0.9554309, 2.260356, -0.2867168, 1, 0, 0.9647059, 1,
0.9572417, 0.4959762, 2.567084, 1, 0, 0.9607843, 1,
0.9598088, -1.84747, 1.269919, 1, 0, 0.9529412, 1,
0.9640972, 0.05739876, 3.672917, 1, 0, 0.9490196, 1,
0.9665909, 0.6179428, 0.626825, 1, 0, 0.9411765, 1,
0.9669235, -2.190684, 1.464366, 1, 0, 0.9372549, 1,
0.9786883, 0.1343606, 1.361827, 1, 0, 0.9294118, 1,
0.9857807, -0.1093105, 2.030959, 1, 0, 0.9254902, 1,
0.9895586, -0.4799328, 0.5988572, 1, 0, 0.9176471, 1,
0.9913157, 0.06218499, 2.361243, 1, 0, 0.9137255, 1,
0.9980181, -0.02658271, 1.762771, 1, 0, 0.9058824, 1,
1.010253, -0.8627337, 2.592436, 1, 0, 0.9019608, 1,
1.013567, 1.973573, -0.8456591, 1, 0, 0.8941177, 1,
1.031141, -0.7917192, 1.161998, 1, 0, 0.8862745, 1,
1.036569, -0.4208495, 0.8784647, 1, 0, 0.8823529, 1,
1.041142, -1.611485, 2.668746, 1, 0, 0.8745098, 1,
1.047234, -1.50662, 3.045485, 1, 0, 0.8705882, 1,
1.047908, 0.3033272, 1.837915, 1, 0, 0.8627451, 1,
1.051124, -0.3433969, 2.905841, 1, 0, 0.8588235, 1,
1.05468, -1.284031, 3.217402, 1, 0, 0.8509804, 1,
1.056088, 1.082467, 0.5272859, 1, 0, 0.8470588, 1,
1.058106, 1.539712, 1.757084, 1, 0, 0.8392157, 1,
1.059508, -0.1584581, 1.604606, 1, 0, 0.8352941, 1,
1.0632, -1.00091, 3.086251, 1, 0, 0.827451, 1,
1.067422, -0.238906, 1.667949, 1, 0, 0.8235294, 1,
1.068928, 0.5398915, -0.2946795, 1, 0, 0.8156863, 1,
1.069271, 1.054068, 1.574178, 1, 0, 0.8117647, 1,
1.072412, 0.7927104, 0.9089137, 1, 0, 0.8039216, 1,
1.073177, 0.7850522, 0.5485507, 1, 0, 0.7960784, 1,
1.075836, 0.3017965, 2.160248, 1, 0, 0.7921569, 1,
1.084043, -1.083603, 2.042883, 1, 0, 0.7843137, 1,
1.08928, 1.351353, 1.48815, 1, 0, 0.7803922, 1,
1.090212, -0.5805351, 2.766423, 1, 0, 0.772549, 1,
1.095184, 0.2636226, 0.2461009, 1, 0, 0.7686275, 1,
1.098587, 0.4318033, 0.8109457, 1, 0, 0.7607843, 1,
1.103476, 0.5058854, 2.215956, 1, 0, 0.7568628, 1,
1.108722, 0.169439, 1.537092, 1, 0, 0.7490196, 1,
1.115954, -0.1046363, 3.942286, 1, 0, 0.7450981, 1,
1.116811, -0.7880329, 0.9264817, 1, 0, 0.7372549, 1,
1.11997, -0.2487669, 2.260171, 1, 0, 0.7333333, 1,
1.122484, 0.938868, -0.1330927, 1, 0, 0.7254902, 1,
1.125536, 0.104796, 2.225567, 1, 0, 0.7215686, 1,
1.128453, 0.7407919, -0.1618381, 1, 0, 0.7137255, 1,
1.1323, 0.7539413, 1.537727, 1, 0, 0.7098039, 1,
1.138495, 0.5491948, 1.776884, 1, 0, 0.7019608, 1,
1.145366, 1.077385, 0.2843143, 1, 0, 0.6941177, 1,
1.145433, -0.4628404, 1.110206, 1, 0, 0.6901961, 1,
1.147177, -0.91378, -0.2213363, 1, 0, 0.682353, 1,
1.150411, -0.7230172, 3.385286, 1, 0, 0.6784314, 1,
1.152704, 0.8953424, 0.4599252, 1, 0, 0.6705883, 1,
1.158883, 1.74641, 0.9752056, 1, 0, 0.6666667, 1,
1.164619, 1.285296, -0.6443065, 1, 0, 0.6588235, 1,
1.168664, 1.053033, -0.3308415, 1, 0, 0.654902, 1,
1.171423, -0.5599639, 1.712978, 1, 0, 0.6470588, 1,
1.172448, -0.5350356, 2.399473, 1, 0, 0.6431373, 1,
1.17293, -0.1842047, 1.943756, 1, 0, 0.6352941, 1,
1.190719, -0.26976, 2.253682, 1, 0, 0.6313726, 1,
1.195005, 1.962242, -1.325234, 1, 0, 0.6235294, 1,
1.19969, 0.0271191, 1.26609, 1, 0, 0.6196079, 1,
1.200142, 0.4538129, 0.9174526, 1, 0, 0.6117647, 1,
1.207164, 1.642876, 1.671817, 1, 0, 0.6078432, 1,
1.210695, -0.5794618, 2.658395, 1, 0, 0.6, 1,
1.213357, 0.1221745, 2.482448, 1, 0, 0.5921569, 1,
1.217968, 0.5600779, 1.107217, 1, 0, 0.5882353, 1,
1.218604, -0.8487918, 1.626786, 1, 0, 0.5803922, 1,
1.22417, 0.09650784, 1.502951, 1, 0, 0.5764706, 1,
1.226954, -0.7243242, 2.039402, 1, 0, 0.5686275, 1,
1.23692, -0.05199445, 3.264467, 1, 0, 0.5647059, 1,
1.244559, -0.2425707, 1.870168, 1, 0, 0.5568628, 1,
1.24756, 0.655804, -2.227987, 1, 0, 0.5529412, 1,
1.252037, -0.6986312, 3.682123, 1, 0, 0.5450981, 1,
1.26058, -1.716672, 2.582111, 1, 0, 0.5411765, 1,
1.26146, 0.4362709, 1.648953, 1, 0, 0.5333334, 1,
1.263956, 0.3737424, 2.284755, 1, 0, 0.5294118, 1,
1.265218, -2.018015, 2.405421, 1, 0, 0.5215687, 1,
1.271368, -1.047889, 4.212808, 1, 0, 0.5176471, 1,
1.285213, 0.4257686, 2.986699, 1, 0, 0.509804, 1,
1.29553, 1.161798, 0.5443218, 1, 0, 0.5058824, 1,
1.305332, -1.779568, 2.582337, 1, 0, 0.4980392, 1,
1.314434, -0.4305467, 3.848258, 1, 0, 0.4901961, 1,
1.315168, 1.18965, 2.081508, 1, 0, 0.4862745, 1,
1.317686, 0.5796682, -0.8299497, 1, 0, 0.4784314, 1,
1.325748, 0.3685974, 1.55565, 1, 0, 0.4745098, 1,
1.328992, -1.113583, 1.22106, 1, 0, 0.4666667, 1,
1.334279, -1.005964, 4.592058, 1, 0, 0.4627451, 1,
1.3344, 0.3939427, 0.5003735, 1, 0, 0.454902, 1,
1.334904, -2.187319, 1.85534, 1, 0, 0.4509804, 1,
1.354088, 0.6551124, 0.01426295, 1, 0, 0.4431373, 1,
1.360497, 0.1429698, 0.8669771, 1, 0, 0.4392157, 1,
1.388649, 0.1541281, 2.148437, 1, 0, 0.4313726, 1,
1.399194, -1.491225, 1.768092, 1, 0, 0.427451, 1,
1.400184, 0.3600297, 2.378191, 1, 0, 0.4196078, 1,
1.402102, 0.09217512, 1.167925, 1, 0, 0.4156863, 1,
1.412035, -1.397766, 2.003809, 1, 0, 0.4078431, 1,
1.420886, -0.816011, 2.335609, 1, 0, 0.4039216, 1,
1.43466, 0.2976651, 0.515842, 1, 0, 0.3960784, 1,
1.440591, -0.3027038, 2.288106, 1, 0, 0.3882353, 1,
1.442962, 1.570979, 2.786384, 1, 0, 0.3843137, 1,
1.445685, 0.01203956, 2.623605, 1, 0, 0.3764706, 1,
1.458346, -0.3848021, 2.556001, 1, 0, 0.372549, 1,
1.460251, -0.670585, 4.448096, 1, 0, 0.3647059, 1,
1.497159, 0.5488124, 0.8455104, 1, 0, 0.3607843, 1,
1.500262, -0.6322798, 3.675276, 1, 0, 0.3529412, 1,
1.502027, -1.42794, 2.507385, 1, 0, 0.3490196, 1,
1.511287, 0.0342235, 2.050723, 1, 0, 0.3411765, 1,
1.512972, -1.099211, 1.555553, 1, 0, 0.3372549, 1,
1.523018, 0.7029933, 1.479786, 1, 0, 0.3294118, 1,
1.533353, 0.5852628, 0.03974793, 1, 0, 0.3254902, 1,
1.550194, -0.9126443, 0.3515421, 1, 0, 0.3176471, 1,
1.570407, -1.176849, 1.67813, 1, 0, 0.3137255, 1,
1.574829, 0.2421347, 3.037854, 1, 0, 0.3058824, 1,
1.589251, -0.06984493, 2.941299, 1, 0, 0.2980392, 1,
1.603197, 0.6919925, 1.198464, 1, 0, 0.2941177, 1,
1.637341, -0.03155397, 0.8731254, 1, 0, 0.2862745, 1,
1.641244, -0.4871714, 3.959701, 1, 0, 0.282353, 1,
1.648967, -0.879547, 3.690408, 1, 0, 0.2745098, 1,
1.657267, -1.466245, 2.690271, 1, 0, 0.2705882, 1,
1.664164, 0.3478518, 2.472348, 1, 0, 0.2627451, 1,
1.664957, -0.6457759, 3.967604, 1, 0, 0.2588235, 1,
1.671635, 0.1359323, 1.021507, 1, 0, 0.2509804, 1,
1.689315, 0.7931386, 1.504462, 1, 0, 0.2470588, 1,
1.697606, 1.89861, 0.4117782, 1, 0, 0.2392157, 1,
1.707925, -0.0387293, 2.018406, 1, 0, 0.2352941, 1,
1.721696, -0.3299018, 1.17932, 1, 0, 0.227451, 1,
1.726487, -1.11662, 3.792756, 1, 0, 0.2235294, 1,
1.74222, 2.100124, 0.1739665, 1, 0, 0.2156863, 1,
1.751687, -0.8088735, 1.761508, 1, 0, 0.2117647, 1,
1.759338, -0.9165524, 3.736628, 1, 0, 0.2039216, 1,
1.78178, 0.07472983, 0.9899239, 1, 0, 0.1960784, 1,
1.784766, 0.3710778, 0.9209687, 1, 0, 0.1921569, 1,
1.792189, -0.2190851, 0.8634141, 1, 0, 0.1843137, 1,
1.801352, 0.3789633, 1.585131, 1, 0, 0.1803922, 1,
1.809076, -0.001074214, 3.583572, 1, 0, 0.172549, 1,
1.815222, 1.430062, 1.625595, 1, 0, 0.1686275, 1,
1.842874, 1.714644, 0.5406114, 1, 0, 0.1607843, 1,
1.846271, -0.3498598, 1.100097, 1, 0, 0.1568628, 1,
1.858566, 1.254519, 1.087551, 1, 0, 0.1490196, 1,
1.859951, -0.613242, 0.5412714, 1, 0, 0.145098, 1,
1.879468, 0.7853042, 0.5872533, 1, 0, 0.1372549, 1,
1.893024, -0.1595135, 0.00782753, 1, 0, 0.1333333, 1,
1.918857, -0.340362, 1.873129, 1, 0, 0.1254902, 1,
1.932351, -0.7785397, 2.251014, 1, 0, 0.1215686, 1,
1.955262, -1.974145, 3.632805, 1, 0, 0.1137255, 1,
1.961725, 0.4666978, 2.129688, 1, 0, 0.1098039, 1,
1.966459, 1.156708, 0.906855, 1, 0, 0.1019608, 1,
1.998505, 0.5100663, -0.2779622, 1, 0, 0.09411765, 1,
2.017582, -0.4259765, 3.346983, 1, 0, 0.09019608, 1,
2.056893, 1.218805, 1.444421, 1, 0, 0.08235294, 1,
2.172697, 0.1422006, 0.1463111, 1, 0, 0.07843138, 1,
2.25976, -1.788598, 1.086534, 1, 0, 0.07058824, 1,
2.290364, 0.310755, 1.706743, 1, 0, 0.06666667, 1,
2.321737, 1.590881, 3.77982, 1, 0, 0.05882353, 1,
2.364255, -1.00362, 3.446683, 1, 0, 0.05490196, 1,
2.378256, 2.077078, 0.08686677, 1, 0, 0.04705882, 1,
2.388462, 0.2600908, 1.976313, 1, 0, 0.04313726, 1,
2.700751, 0.7318556, 4.667442, 1, 0, 0.03529412, 1,
2.899679, -0.2951641, 1.759931, 1, 0, 0.03137255, 1,
2.977772, 0.5156729, 1.938939, 1, 0, 0.02352941, 1,
3.235084, -0.8663036, 2.805011, 1, 0, 0.01960784, 1,
3.367952, 1.57914, 0.4489801, 1, 0, 0.01176471, 1,
3.417145, -1.066295, 3.490382, 1, 0, 0.007843138, 1
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
0.1772401, -4.04644, -8.015812, 0, -0.5, 0.5, 0.5,
0.1772401, -4.04644, -8.015812, 1, -0.5, 0.5, 0.5,
0.1772401, -4.04644, -8.015812, 1, 1.5, 0.5, 0.5,
0.1772401, -4.04644, -8.015812, 0, 1.5, 0.5, 0.5
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
-4.160993, -0.02322137, -8.015812, 0, -0.5, 0.5, 0.5,
-4.160993, -0.02322137, -8.015812, 1, -0.5, 0.5, 0.5,
-4.160993, -0.02322137, -8.015812, 1, 1.5, 0.5, 0.5,
-4.160993, -0.02322137, -8.015812, 0, 1.5, 0.5, 0.5
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
-4.160993, -4.04644, -0.2056634, 0, -0.5, 0.5, 0.5,
-4.160993, -4.04644, -0.2056634, 1, -0.5, 0.5, 0.5,
-4.160993, -4.04644, -0.2056634, 1, 1.5, 0.5, 0.5,
-4.160993, -4.04644, -0.2056634, 0, 1.5, 0.5, 0.5
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
-3, -3.118005, -6.21347,
3, -3.118005, -6.21347,
-3, -3.118005, -6.21347,
-3, -3.272744, -6.51386,
-2, -3.118005, -6.21347,
-2, -3.272744, -6.51386,
-1, -3.118005, -6.21347,
-1, -3.272744, -6.51386,
0, -3.118005, -6.21347,
0, -3.272744, -6.51386,
1, -3.118005, -6.21347,
1, -3.272744, -6.51386,
2, -3.118005, -6.21347,
2, -3.272744, -6.51386,
3, -3.118005, -6.21347,
3, -3.272744, -6.51386
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
-3, -3.582222, -7.114641, 0, -0.5, 0.5, 0.5,
-3, -3.582222, -7.114641, 1, -0.5, 0.5, 0.5,
-3, -3.582222, -7.114641, 1, 1.5, 0.5, 0.5,
-3, -3.582222, -7.114641, 0, 1.5, 0.5, 0.5,
-2, -3.582222, -7.114641, 0, -0.5, 0.5, 0.5,
-2, -3.582222, -7.114641, 1, -0.5, 0.5, 0.5,
-2, -3.582222, -7.114641, 1, 1.5, 0.5, 0.5,
-2, -3.582222, -7.114641, 0, 1.5, 0.5, 0.5,
-1, -3.582222, -7.114641, 0, -0.5, 0.5, 0.5,
-1, -3.582222, -7.114641, 1, -0.5, 0.5, 0.5,
-1, -3.582222, -7.114641, 1, 1.5, 0.5, 0.5,
-1, -3.582222, -7.114641, 0, 1.5, 0.5, 0.5,
0, -3.582222, -7.114641, 0, -0.5, 0.5, 0.5,
0, -3.582222, -7.114641, 1, -0.5, 0.5, 0.5,
0, -3.582222, -7.114641, 1, 1.5, 0.5, 0.5,
0, -3.582222, -7.114641, 0, 1.5, 0.5, 0.5,
1, -3.582222, -7.114641, 0, -0.5, 0.5, 0.5,
1, -3.582222, -7.114641, 1, -0.5, 0.5, 0.5,
1, -3.582222, -7.114641, 1, 1.5, 0.5, 0.5,
1, -3.582222, -7.114641, 0, 1.5, 0.5, 0.5,
2, -3.582222, -7.114641, 0, -0.5, 0.5, 0.5,
2, -3.582222, -7.114641, 1, -0.5, 0.5, 0.5,
2, -3.582222, -7.114641, 1, 1.5, 0.5, 0.5,
2, -3.582222, -7.114641, 0, 1.5, 0.5, 0.5,
3, -3.582222, -7.114641, 0, -0.5, 0.5, 0.5,
3, -3.582222, -7.114641, 1, -0.5, 0.5, 0.5,
3, -3.582222, -7.114641, 1, 1.5, 0.5, 0.5,
3, -3.582222, -7.114641, 0, 1.5, 0.5, 0.5
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
-3.159862, -3, -6.21347,
-3.159862, 2, -6.21347,
-3.159862, -3, -6.21347,
-3.326717, -3, -6.51386,
-3.159862, -2, -6.21347,
-3.326717, -2, -6.51386,
-3.159862, -1, -6.21347,
-3.326717, -1, -6.51386,
-3.159862, 0, -6.21347,
-3.326717, 0, -6.51386,
-3.159862, 1, -6.21347,
-3.326717, 1, -6.51386,
-3.159862, 2, -6.21347,
-3.326717, 2, -6.51386
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
-3.660427, -3, -7.114641, 0, -0.5, 0.5, 0.5,
-3.660427, -3, -7.114641, 1, -0.5, 0.5, 0.5,
-3.660427, -3, -7.114641, 1, 1.5, 0.5, 0.5,
-3.660427, -3, -7.114641, 0, 1.5, 0.5, 0.5,
-3.660427, -2, -7.114641, 0, -0.5, 0.5, 0.5,
-3.660427, -2, -7.114641, 1, -0.5, 0.5, 0.5,
-3.660427, -2, -7.114641, 1, 1.5, 0.5, 0.5,
-3.660427, -2, -7.114641, 0, 1.5, 0.5, 0.5,
-3.660427, -1, -7.114641, 0, -0.5, 0.5, 0.5,
-3.660427, -1, -7.114641, 1, -0.5, 0.5, 0.5,
-3.660427, -1, -7.114641, 1, 1.5, 0.5, 0.5,
-3.660427, -1, -7.114641, 0, 1.5, 0.5, 0.5,
-3.660427, 0, -7.114641, 0, -0.5, 0.5, 0.5,
-3.660427, 0, -7.114641, 1, -0.5, 0.5, 0.5,
-3.660427, 0, -7.114641, 1, 1.5, 0.5, 0.5,
-3.660427, 0, -7.114641, 0, 1.5, 0.5, 0.5,
-3.660427, 1, -7.114641, 0, -0.5, 0.5, 0.5,
-3.660427, 1, -7.114641, 1, -0.5, 0.5, 0.5,
-3.660427, 1, -7.114641, 1, 1.5, 0.5, 0.5,
-3.660427, 1, -7.114641, 0, 1.5, 0.5, 0.5,
-3.660427, 2, -7.114641, 0, -0.5, 0.5, 0.5,
-3.660427, 2, -7.114641, 1, -0.5, 0.5, 0.5,
-3.660427, 2, -7.114641, 1, 1.5, 0.5, 0.5,
-3.660427, 2, -7.114641, 0, 1.5, 0.5, 0.5
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
-3.159862, -3.118005, -6,
-3.159862, -3.118005, 4,
-3.159862, -3.118005, -6,
-3.326717, -3.272744, -6,
-3.159862, -3.118005, -4,
-3.326717, -3.272744, -4,
-3.159862, -3.118005, -2,
-3.326717, -3.272744, -2,
-3.159862, -3.118005, 0,
-3.326717, -3.272744, 0,
-3.159862, -3.118005, 2,
-3.326717, -3.272744, 2,
-3.159862, -3.118005, 4,
-3.326717, -3.272744, 4
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
-3.660427, -3.582222, -6, 0, -0.5, 0.5, 0.5,
-3.660427, -3.582222, -6, 1, -0.5, 0.5, 0.5,
-3.660427, -3.582222, -6, 1, 1.5, 0.5, 0.5,
-3.660427, -3.582222, -6, 0, 1.5, 0.5, 0.5,
-3.660427, -3.582222, -4, 0, -0.5, 0.5, 0.5,
-3.660427, -3.582222, -4, 1, -0.5, 0.5, 0.5,
-3.660427, -3.582222, -4, 1, 1.5, 0.5, 0.5,
-3.660427, -3.582222, -4, 0, 1.5, 0.5, 0.5,
-3.660427, -3.582222, -2, 0, -0.5, 0.5, 0.5,
-3.660427, -3.582222, -2, 1, -0.5, 0.5, 0.5,
-3.660427, -3.582222, -2, 1, 1.5, 0.5, 0.5,
-3.660427, -3.582222, -2, 0, 1.5, 0.5, 0.5,
-3.660427, -3.582222, 0, 0, -0.5, 0.5, 0.5,
-3.660427, -3.582222, 0, 1, -0.5, 0.5, 0.5,
-3.660427, -3.582222, 0, 1, 1.5, 0.5, 0.5,
-3.660427, -3.582222, 0, 0, 1.5, 0.5, 0.5,
-3.660427, -3.582222, 2, 0, -0.5, 0.5, 0.5,
-3.660427, -3.582222, 2, 1, -0.5, 0.5, 0.5,
-3.660427, -3.582222, 2, 1, 1.5, 0.5, 0.5,
-3.660427, -3.582222, 2, 0, 1.5, 0.5, 0.5,
-3.660427, -3.582222, 4, 0, -0.5, 0.5, 0.5,
-3.660427, -3.582222, 4, 1, -0.5, 0.5, 0.5,
-3.660427, -3.582222, 4, 1, 1.5, 0.5, 0.5,
-3.660427, -3.582222, 4, 0, 1.5, 0.5, 0.5
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
-3.159862, -3.118005, -6.21347,
-3.159862, 3.071562, -6.21347,
-3.159862, -3.118005, 5.802143,
-3.159862, 3.071562, 5.802143,
-3.159862, -3.118005, -6.21347,
-3.159862, -3.118005, 5.802143,
-3.159862, 3.071562, -6.21347,
-3.159862, 3.071562, 5.802143,
-3.159862, -3.118005, -6.21347,
3.514342, -3.118005, -6.21347,
-3.159862, -3.118005, 5.802143,
3.514342, -3.118005, 5.802143,
-3.159862, 3.071562, -6.21347,
3.514342, 3.071562, -6.21347,
-3.159862, 3.071562, 5.802143,
3.514342, 3.071562, 5.802143,
3.514342, -3.118005, -6.21347,
3.514342, 3.071562, -6.21347,
3.514342, -3.118005, 5.802143,
3.514342, 3.071562, 5.802143,
3.514342, -3.118005, -6.21347,
3.514342, -3.118005, 5.802143,
3.514342, 3.071562, -6.21347,
3.514342, 3.071562, 5.802143
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
var radius = 8.049316;
var distance = 35.81232;
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
mvMatrix.translate( -0.1772401, 0.02322137, 0.2056634 );
mvMatrix.scale( 1.303987, 1.406088, 0.7243141 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.81232);
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
Disodium_methyl-diox<-read.table("Disodium_methyl-diox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Disodium_methyl-diox$V2
```

```
## Error in eval(expr, envir, enclos): object 'Disodium_methyl' not found
```

```r
y<-Disodium_methyl-diox$V3
```

```
## Error in eval(expr, envir, enclos): object 'Disodium_methyl' not found
```

```r
z<-Disodium_methyl-diox$V4
```

```
## Error in eval(expr, envir, enclos): object 'Disodium_methyl' not found
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
-3.062665, 0.7101187, -1.831314, 0, 0, 1, 1, 1,
-2.987706, -0.7291975, -1.292725, 1, 0, 0, 1, 1,
-2.859993, 0.4279423, -1.533283, 1, 0, 0, 1, 1,
-2.832943, -0.874419, -2.62184, 1, 0, 0, 1, 1,
-2.75869, 1.014018, -2.441985, 1, 0, 0, 1, 1,
-2.573284, 0.2051223, -2.865915, 1, 0, 0, 1, 1,
-2.531175, -0.01559065, -0.7360243, 0, 0, 0, 1, 1,
-2.525272, -0.5151286, -3.802557, 0, 0, 0, 1, 1,
-2.52123, -0.4384538, -2.103299, 0, 0, 0, 1, 1,
-2.487133, 0.2931966, -2.359057, 0, 0, 0, 1, 1,
-2.467466, 0.2785231, -1.181261, 0, 0, 0, 1, 1,
-2.407806, -0.8103668, -0.9768897, 0, 0, 0, 1, 1,
-2.402494, -0.9937748, -2.647456, 0, 0, 0, 1, 1,
-2.366167, -1.368466, -0.7666155, 1, 1, 1, 1, 1,
-2.352332, -0.5099778, -2.706836, 1, 1, 1, 1, 1,
-2.323653, 1.12476, -0.8370412, 1, 1, 1, 1, 1,
-2.28616, -1.092021, -1.446825, 1, 1, 1, 1, 1,
-2.275416, 0.3512911, -1.944874, 1, 1, 1, 1, 1,
-2.273147, 0.9271901, -1.84788, 1, 1, 1, 1, 1,
-2.270928, -0.7000972, -2.908046, 1, 1, 1, 1, 1,
-2.228806, 2.16544, -1.30089, 1, 1, 1, 1, 1,
-2.187011, -0.3837074, -0.5972921, 1, 1, 1, 1, 1,
-2.174297, 1.995412, -1.734119, 1, 1, 1, 1, 1,
-2.172955, -1.621507, -4.176945, 1, 1, 1, 1, 1,
-2.145409, 0.1118689, -1.7563, 1, 1, 1, 1, 1,
-2.050471, 0.02961411, -1.944634, 1, 1, 1, 1, 1,
-1.987388, -1.42865, -2.270033, 1, 1, 1, 1, 1,
-1.952302, -1.928485, -0.9073919, 1, 1, 1, 1, 1,
-1.949309, 1.010629, -0.7659944, 0, 0, 1, 1, 1,
-1.941557, -1.294064, -3.565073, 1, 0, 0, 1, 1,
-1.929455, -2.785848, -3.423315, 1, 0, 0, 1, 1,
-1.916035, 0.5162156, -0.796393, 1, 0, 0, 1, 1,
-1.889381, 0.1269359, -3.317448, 1, 0, 0, 1, 1,
-1.853184, -0.5087229, -1.417473, 1, 0, 0, 1, 1,
-1.823068, 2.155242, -1.350872, 0, 0, 0, 1, 1,
-1.818784, 0.4230851, -3.243742, 0, 0, 0, 1, 1,
-1.818081, -0.9693309, -2.363929, 0, 0, 0, 1, 1,
-1.805471, -1.876602, 0.1926029, 0, 0, 0, 1, 1,
-1.793915, 0.7639924, -1.410185, 0, 0, 0, 1, 1,
-1.789693, 0.6371135, -2.533405, 0, 0, 0, 1, 1,
-1.776398, 0.6168234, -2.258097, 0, 0, 0, 1, 1,
-1.742699, 0.1791891, -1.066964, 1, 1, 1, 1, 1,
-1.740134, 0.7964314, -1.084359, 1, 1, 1, 1, 1,
-1.739009, 0.7845394, -0.0386134, 1, 1, 1, 1, 1,
-1.729885, 0.8492132, -0.3415015, 1, 1, 1, 1, 1,
-1.726813, -0.6522458, -2.259564, 1, 1, 1, 1, 1,
-1.725778, 1.497878, -0.523077, 1, 1, 1, 1, 1,
-1.691556, -0.9017538, -1.837783, 1, 1, 1, 1, 1,
-1.685772, -1.079547, -0.5567851, 1, 1, 1, 1, 1,
-1.682761, -0.3079427, -1.933411, 1, 1, 1, 1, 1,
-1.6718, 0.310856, 0.2456788, 1, 1, 1, 1, 1,
-1.66862, 1.537636, -1.433598, 1, 1, 1, 1, 1,
-1.658048, 0.8631134, -1.854153, 1, 1, 1, 1, 1,
-1.657491, -1.170961, -1.737036, 1, 1, 1, 1, 1,
-1.650497, -0.1997315, -2.101882, 1, 1, 1, 1, 1,
-1.648231, 0.1494258, -2.697409, 1, 1, 1, 1, 1,
-1.644869, 0.4790095, 0.5648378, 0, 0, 1, 1, 1,
-1.637711, 1.089338, -1.976709, 1, 0, 0, 1, 1,
-1.63283, -0.8193483, -1.330214, 1, 0, 0, 1, 1,
-1.628219, -0.5012304, -2.753863, 1, 0, 0, 1, 1,
-1.623919, 0.8023189, -1.622543, 1, 0, 0, 1, 1,
-1.623527, -0.801879, -2.211478, 1, 0, 0, 1, 1,
-1.620192, 1.984482, 0.2438586, 0, 0, 0, 1, 1,
-1.617863, 0.671312, -0.8090931, 0, 0, 0, 1, 1,
-1.600213, -0.7628367, -2.718702, 0, 0, 0, 1, 1,
-1.57437, -0.2974292, -2.794633, 0, 0, 0, 1, 1,
-1.562103, -1.174423, -1.16932, 0, 0, 0, 1, 1,
-1.529454, -0.3157397, -1.283592, 0, 0, 0, 1, 1,
-1.523282, 0.3238987, -1.73834, 0, 0, 0, 1, 1,
-1.518706, 1.470158, -0.5603445, 1, 1, 1, 1, 1,
-1.513816, -0.3547846, -0.928812, 1, 1, 1, 1, 1,
-1.51238, 0.4920399, -0.2103277, 1, 1, 1, 1, 1,
-1.510465, -1.005086, -1.660154, 1, 1, 1, 1, 1,
-1.49096, -0.8066306, -0.403863, 1, 1, 1, 1, 1,
-1.47287, 0.4265174, -2.023616, 1, 1, 1, 1, 1,
-1.458131, -0.5606115, -2.533278, 1, 1, 1, 1, 1,
-1.456978, -0.132043, -1.03015, 1, 1, 1, 1, 1,
-1.441282, -0.06964085, -2.740986, 1, 1, 1, 1, 1,
-1.436402, 0.2311999, -0.635437, 1, 1, 1, 1, 1,
-1.416636, 1.097627, -1.571197, 1, 1, 1, 1, 1,
-1.390933, -0.1461846, -1.877544, 1, 1, 1, 1, 1,
-1.388012, -0.515443, -0.0458329, 1, 1, 1, 1, 1,
-1.385889, -0.5979946, -2.815928, 1, 1, 1, 1, 1,
-1.374912, -0.3899076, -2.506272, 1, 1, 1, 1, 1,
-1.374638, 0.9644483, -0.3818065, 0, 0, 1, 1, 1,
-1.370517, 1.188144, -0.7142281, 1, 0, 0, 1, 1,
-1.364857, -1.082363, -2.476196, 1, 0, 0, 1, 1,
-1.362711, 0.8922909, -0.7416771, 1, 0, 0, 1, 1,
-1.357635, -0.2186788, -1.797644, 1, 0, 0, 1, 1,
-1.349284, 0.3294503, -0.8256832, 1, 0, 0, 1, 1,
-1.346593, 0.4445253, -3.497015, 0, 0, 0, 1, 1,
-1.340423, 0.9278647, -0.6939626, 0, 0, 0, 1, 1,
-1.336659, 0.7534842, -3.912144, 0, 0, 0, 1, 1,
-1.328692, 1.022933, -0.1324729, 0, 0, 0, 1, 1,
-1.311849, 1.048661, -2.231654, 0, 0, 0, 1, 1,
-1.300353, 2.442982, -1.311952, 0, 0, 0, 1, 1,
-1.292132, 0.151838, -0.3483332, 0, 0, 0, 1, 1,
-1.291404, 0.9703749, -0.152076, 1, 1, 1, 1, 1,
-1.290596, -0.2137462, -2.54897, 1, 1, 1, 1, 1,
-1.276681, -0.5390727, -0.3516347, 1, 1, 1, 1, 1,
-1.273227, -0.8651716, -2.833124, 1, 1, 1, 1, 1,
-1.270684, -0.2630976, -0.7528775, 1, 1, 1, 1, 1,
-1.267997, -1.436008, -1.91555, 1, 1, 1, 1, 1,
-1.267074, 1.114853, -0.3065794, 1, 1, 1, 1, 1,
-1.263436, -0.34779, -3.120298, 1, 1, 1, 1, 1,
-1.248764, -0.3780029, -1.521013, 1, 1, 1, 1, 1,
-1.24423, 0.01615283, -1.326923, 1, 1, 1, 1, 1,
-1.243094, 0.9952607, -2.162264, 1, 1, 1, 1, 1,
-1.237907, 1.07504, -0.8918824, 1, 1, 1, 1, 1,
-1.234695, 0.2637218, 0.1161358, 1, 1, 1, 1, 1,
-1.234167, -1.043472, -2.641633, 1, 1, 1, 1, 1,
-1.218424, 1.423733, -0.02237235, 1, 1, 1, 1, 1,
-1.216679, -0.9991392, -0.457995, 0, 0, 1, 1, 1,
-1.203792, -1.195572, -2.883571, 1, 0, 0, 1, 1,
-1.198903, 0.6755224, -1.222072, 1, 0, 0, 1, 1,
-1.193888, -2.08936, -1.196473, 1, 0, 0, 1, 1,
-1.187939, -1.272249, -1.982323, 1, 0, 0, 1, 1,
-1.180944, 0.1070414, -0.4742716, 1, 0, 0, 1, 1,
-1.152361, 0.7874717, -0.4973644, 0, 0, 0, 1, 1,
-1.150192, 0.2265841, -1.565985, 0, 0, 0, 1, 1,
-1.149852, -0.975922, -2.235316, 0, 0, 0, 1, 1,
-1.147474, -0.4343122, -1.658899, 0, 0, 0, 1, 1,
-1.145974, 0.4262331, -0.3731942, 0, 0, 0, 1, 1,
-1.136925, 1.079434, 0.7341712, 0, 0, 0, 1, 1,
-1.125808, -0.2492616, -3.101734, 0, 0, 0, 1, 1,
-1.107658, 0.832849, 1.120747, 1, 1, 1, 1, 1,
-1.104882, -2.205802, -6.038485, 1, 1, 1, 1, 1,
-1.104645, 0.5000587, -1.146307, 1, 1, 1, 1, 1,
-1.103674, 0.8723785, 0.5179012, 1, 1, 1, 1, 1,
-1.097692, -0.6173213, -1.733771, 1, 1, 1, 1, 1,
-1.080827, 0.1723277, -1.438172, 1, 1, 1, 1, 1,
-1.072488, 0.889874, -1.422811, 1, 1, 1, 1, 1,
-1.068177, -0.8149016, -4.192535, 1, 1, 1, 1, 1,
-1.064511, -1.59835, -0.6598963, 1, 1, 1, 1, 1,
-1.060214, 0.320438, -1.154791, 1, 1, 1, 1, 1,
-1.058958, -1.246741, -1.641684, 1, 1, 1, 1, 1,
-1.05725, 0.5490465, -2.181773, 1, 1, 1, 1, 1,
-1.056166, -0.9479275, -3.520988, 1, 1, 1, 1, 1,
-1.055919, 0.905655, -0.9800202, 1, 1, 1, 1, 1,
-1.053914, 0.9206873, -0.3947184, 1, 1, 1, 1, 1,
-1.047546, -0.6694448, -1.403807, 0, 0, 1, 1, 1,
-1.037611, 0.2312828, -0.9054834, 1, 0, 0, 1, 1,
-1.03568, 0.8586415, -0.7099258, 1, 0, 0, 1, 1,
-1.031384, -0.05230793, -1.563947, 1, 0, 0, 1, 1,
-1.030755, 1.505267, 1.297207, 1, 0, 0, 1, 1,
-1.028846, 1.351994, -0.618939, 1, 0, 0, 1, 1,
-1.027407, -0.3016181, -3.331062, 0, 0, 0, 1, 1,
-1.00984, -0.3014013, -3.264823, 0, 0, 0, 1, 1,
-1.009541, -1.059627, -2.227894, 0, 0, 0, 1, 1,
-0.9982772, 1.222525, -1.155868, 0, 0, 0, 1, 1,
-0.9936525, -1.305166, -2.210308, 0, 0, 0, 1, 1,
-0.9921303, 0.2553132, -3.370074, 0, 0, 0, 1, 1,
-0.9775223, 0.1066239, -1.167159, 0, 0, 0, 1, 1,
-0.9740731, 1.919375, -1.582028, 1, 1, 1, 1, 1,
-0.9647831, 0.6898568, -0.6067414, 1, 1, 1, 1, 1,
-0.95912, -0.2570186, -1.999792, 1, 1, 1, 1, 1,
-0.9581589, 0.8116701, -2.732389, 1, 1, 1, 1, 1,
-0.9562606, -0.337476, -0.09899059, 1, 1, 1, 1, 1,
-0.9520168, -0.4328184, -0.9312297, 1, 1, 1, 1, 1,
-0.9480839, 0.4006861, -0.926507, 1, 1, 1, 1, 1,
-0.9456825, 1.054237, -1.687613, 1, 1, 1, 1, 1,
-0.9368956, 0.7752057, -0.8675691, 1, 1, 1, 1, 1,
-0.9340363, -0.6965715, -1.85877, 1, 1, 1, 1, 1,
-0.9303706, -0.0493518, -1.911035, 1, 1, 1, 1, 1,
-0.9219959, 0.553696, -1.964875, 1, 1, 1, 1, 1,
-0.91349, -0.4920058, -2.652115, 1, 1, 1, 1, 1,
-0.9101965, -0.3470577, -1.714844, 1, 1, 1, 1, 1,
-0.9034331, -1.184372, -2.47075, 1, 1, 1, 1, 1,
-0.9021616, -0.9005252, -2.822361, 0, 0, 1, 1, 1,
-0.8979978, -0.268733, -1.907991, 1, 0, 0, 1, 1,
-0.8979759, -0.6633584, -3.140583, 1, 0, 0, 1, 1,
-0.8947511, -1.527827, -2.967874, 1, 0, 0, 1, 1,
-0.8902124, 0.477376, -1.382285, 1, 0, 0, 1, 1,
-0.8867911, -0.4107105, -2.34607, 1, 0, 0, 1, 1,
-0.8670089, 0.5626589, -1.788387, 0, 0, 0, 1, 1,
-0.8634534, -0.5756438, -1.788354, 0, 0, 0, 1, 1,
-0.8619589, 1.740634, -1.968111, 0, 0, 0, 1, 1,
-0.8512663, -0.01769192, 0.1409234, 0, 0, 0, 1, 1,
-0.8497888, 0.792191, 0.06000622, 0, 0, 0, 1, 1,
-0.8432704, -0.01167148, -2.248862, 0, 0, 0, 1, 1,
-0.8280008, -0.2808309, -0.8068798, 0, 0, 0, 1, 1,
-0.8235194, 0.3772272, -2.192443, 1, 1, 1, 1, 1,
-0.8212765, 0.9709397, -0.0984069, 1, 1, 1, 1, 1,
-0.8192565, 0.0260493, -2.220267, 1, 1, 1, 1, 1,
-0.8183744, 1.223093, -0.8657475, 1, 1, 1, 1, 1,
-0.8182372, 1.023396, 0.7495988, 1, 1, 1, 1, 1,
-0.8181616, -0.676225, -2.731105, 1, 1, 1, 1, 1,
-0.817327, 1.348955, -1.496911, 1, 1, 1, 1, 1,
-0.8123492, -1.644992, -2.482057, 1, 1, 1, 1, 1,
-0.8066252, -1.245013, -2.944168, 1, 1, 1, 1, 1,
-0.804679, 0.8030068, -0.9235981, 1, 1, 1, 1, 1,
-0.8041241, 1.472589, -0.1842398, 1, 1, 1, 1, 1,
-0.8038136, -0.690903, -0.09661189, 1, 1, 1, 1, 1,
-0.7959566, 0.6545975, -0.4928883, 1, 1, 1, 1, 1,
-0.7942902, 0.04779509, -1.491277, 1, 1, 1, 1, 1,
-0.7809193, 1.131137, 1.210804, 1, 1, 1, 1, 1,
-0.7799824, -1.769196, -2.607357, 0, 0, 1, 1, 1,
-0.7798042, 1.079284, 0.9561005, 1, 0, 0, 1, 1,
-0.7756931, -0.5861378, -2.987569, 1, 0, 0, 1, 1,
-0.7726149, 0.4049249, -1.688058, 1, 0, 0, 1, 1,
-0.7726066, -2.086812, -2.880551, 1, 0, 0, 1, 1,
-0.7702339, -0.1640944, -2.755527, 1, 0, 0, 1, 1,
-0.7685269, -1.973975, -2.645738, 0, 0, 0, 1, 1,
-0.7653963, 0.9429972, -1.844702, 0, 0, 0, 1, 1,
-0.7648428, -0.3783005, -2.21523, 0, 0, 0, 1, 1,
-0.7614499, 0.2718289, 1.104957, 0, 0, 0, 1, 1,
-0.7561151, 2.221252, -0.648608, 0, 0, 0, 1, 1,
-0.753648, -0.3642632, -1.634215, 0, 0, 0, 1, 1,
-0.7518355, -0.3294064, -3.618022, 0, 0, 0, 1, 1,
-0.7450203, -0.1761197, -2.512134, 1, 1, 1, 1, 1,
-0.7449136, -0.0711401, -1.282033, 1, 1, 1, 1, 1,
-0.7315226, -0.6278865, -1.097141, 1, 1, 1, 1, 1,
-0.7284951, 0.05105933, -1.627794, 1, 1, 1, 1, 1,
-0.7212761, -0.4981434, -3.690944, 1, 1, 1, 1, 1,
-0.7206033, 0.4739885, -0.3976663, 1, 1, 1, 1, 1,
-0.7203354, 0.3889946, -2.269396, 1, 1, 1, 1, 1,
-0.7178249, -1.885268, -3.931486, 1, 1, 1, 1, 1,
-0.7172955, -1.058589, -3.167815, 1, 1, 1, 1, 1,
-0.710324, 0.4064259, -1.68938, 1, 1, 1, 1, 1,
-0.7061812, -0.247126, -2.996636, 1, 1, 1, 1, 1,
-0.7041306, -0.02242626, -1.260803, 1, 1, 1, 1, 1,
-0.6986652, 0.767199, -2.682574, 1, 1, 1, 1, 1,
-0.6963405, -1.879694, -3.145078, 1, 1, 1, 1, 1,
-0.6923335, 0.01866314, -1.360162, 1, 1, 1, 1, 1,
-0.6920567, -1.768447, -2.851699, 0, 0, 1, 1, 1,
-0.6872067, 0.3507745, 0.839306, 1, 0, 0, 1, 1,
-0.6867961, 0.4681852, -1.253261, 1, 0, 0, 1, 1,
-0.6852478, -0.2321599, -2.429764, 1, 0, 0, 1, 1,
-0.6814081, -2.343686, -3.546581, 1, 0, 0, 1, 1,
-0.6790293, -1.206146, -3.167593, 1, 0, 0, 1, 1,
-0.6713052, -0.1848151, -2.284155, 0, 0, 0, 1, 1,
-0.6705232, 0.5495555, -2.321079, 0, 0, 0, 1, 1,
-0.6670828, 2.318808, -0.2509219, 0, 0, 0, 1, 1,
-0.665265, -0.8187766, -1.722246, 0, 0, 0, 1, 1,
-0.6630743, 0.2294023, -1.245647, 0, 0, 0, 1, 1,
-0.6615764, -0.3490729, -1.83381, 0, 0, 0, 1, 1,
-0.6594478, -0.1158988, -2.649465, 0, 0, 0, 1, 1,
-0.6584275, -1.810614, -1.317823, 1, 1, 1, 1, 1,
-0.6513528, -0.1987222, -2.094584, 1, 1, 1, 1, 1,
-0.6502365, -1.546269, -2.747794, 1, 1, 1, 1, 1,
-0.6500747, 1.055573, 0.1341894, 1, 1, 1, 1, 1,
-0.6459721, 0.1696267, 0.1771067, 1, 1, 1, 1, 1,
-0.6414716, 0.3111869, 0.4484498, 1, 1, 1, 1, 1,
-0.6412123, 1.130051, -1.743709, 1, 1, 1, 1, 1,
-0.6362517, 2.581702, -1.967121, 1, 1, 1, 1, 1,
-0.6345622, -0.9333171, -1.892443, 1, 1, 1, 1, 1,
-0.6313249, 0.04357812, -0.7295734, 1, 1, 1, 1, 1,
-0.6222278, -1.060746, -1.90888, 1, 1, 1, 1, 1,
-0.6219572, -1.168403, -2.587685, 1, 1, 1, 1, 1,
-0.6210189, -0.5250821, -1.482524, 1, 1, 1, 1, 1,
-0.62082, 0.8888469, -0.3058668, 1, 1, 1, 1, 1,
-0.619355, -0.1669955, -0.5722402, 1, 1, 1, 1, 1,
-0.6165494, -1.031137, -3.883742, 0, 0, 1, 1, 1,
-0.6146038, 1.435349, -0.2116741, 1, 0, 0, 1, 1,
-0.613265, 0.905332, -1.040754, 1, 0, 0, 1, 1,
-0.6116764, -1.508541, -3.615861, 1, 0, 0, 1, 1,
-0.6108969, -0.181748, -3.529158, 1, 0, 0, 1, 1,
-0.609082, 0.1224561, -1.948088, 1, 0, 0, 1, 1,
-0.608812, -0.4307008, -2.527474, 0, 0, 0, 1, 1,
-0.6072462, -0.9792701, -2.276188, 0, 0, 0, 1, 1,
-0.6048542, -0.7773184, -3.057295, 0, 0, 0, 1, 1,
-0.6037628, 1.068904, 0.3634399, 0, 0, 0, 1, 1,
-0.5969369, -2.195788, -3.4972, 0, 0, 0, 1, 1,
-0.5959996, 0.5818876, -0.4254749, 0, 0, 0, 1, 1,
-0.5937477, 0.473385, -0.7063074, 0, 0, 0, 1, 1,
-0.5917825, -0.366569, -1.144368, 1, 1, 1, 1, 1,
-0.5868003, 1.562123, 1.001013, 1, 1, 1, 1, 1,
-0.5846549, -0.1588006, -0.2474426, 1, 1, 1, 1, 1,
-0.5827185, 0.696344, -1.944943, 1, 1, 1, 1, 1,
-0.5782322, -0.4684869, -5.191191, 1, 1, 1, 1, 1,
-0.5774109, -0.5075085, -3.351989, 1, 1, 1, 1, 1,
-0.5766656, -1.083422, -2.734163, 1, 1, 1, 1, 1,
-0.5691032, -0.8508326, -2.800239, 1, 1, 1, 1, 1,
-0.5676262, -1.146266, -4.632421, 1, 1, 1, 1, 1,
-0.5643017, -0.05022288, -0.9529655, 1, 1, 1, 1, 1,
-0.5620545, -0.7208306, -2.684366, 1, 1, 1, 1, 1,
-0.5567188, -0.6416897, -1.419017, 1, 1, 1, 1, 1,
-0.5550826, 0.1736748, -2.067765, 1, 1, 1, 1, 1,
-0.5524364, 0.9306718, -0.3907405, 1, 1, 1, 1, 1,
-0.5524078, 0.08134609, -1.975021, 1, 1, 1, 1, 1,
-0.5516014, -0.4010647, -2.163216, 0, 0, 1, 1, 1,
-0.5499402, -0.3620809, -1.710477, 1, 0, 0, 1, 1,
-0.5482783, -0.5182392, -4.693079, 1, 0, 0, 1, 1,
-0.5434428, 0.3075205, -0.5207253, 1, 0, 0, 1, 1,
-0.5426831, 1.52585, -1.668117, 1, 0, 0, 1, 1,
-0.5412585, -0.5943655, -2.609483, 1, 0, 0, 1, 1,
-0.5403641, -1.610788, -2.5309, 0, 0, 0, 1, 1,
-0.5367109, 0.1834533, 0.122373, 0, 0, 0, 1, 1,
-0.5361192, -0.05865572, -4.027314, 0, 0, 0, 1, 1,
-0.5333683, 0.3669924, -0.489178, 0, 0, 0, 1, 1,
-0.5301293, 0.2084362, -1.162509, 0, 0, 0, 1, 1,
-0.5294721, -0.3392906, -1.291028, 0, 0, 0, 1, 1,
-0.5294341, -0.9872535, -4.632751, 0, 0, 0, 1, 1,
-0.5281508, -0.006357756, 0.3413848, 1, 1, 1, 1, 1,
-0.5247223, 0.8808849, -1.637595, 1, 1, 1, 1, 1,
-0.5237132, -0.1854524, -3.015325, 1, 1, 1, 1, 1,
-0.5233958, 0.887508, -2.454709, 1, 1, 1, 1, 1,
-0.5188465, -0.5768126, -1.868866, 1, 1, 1, 1, 1,
-0.5159376, 0.3602401, -0.3899582, 1, 1, 1, 1, 1,
-0.5155172, -0.2705229, -2.063655, 1, 1, 1, 1, 1,
-0.5150378, 1.341888, 0.1347014, 1, 1, 1, 1, 1,
-0.5148697, 0.5517421, -0.7086539, 1, 1, 1, 1, 1,
-0.5137527, -1.70025, -3.304478, 1, 1, 1, 1, 1,
-0.5060976, 0.6395211, -1.527102, 1, 1, 1, 1, 1,
-0.5041658, 0.100141, -2.156015, 1, 1, 1, 1, 1,
-0.503494, 1.30772, 1.229397, 1, 1, 1, 1, 1,
-0.5033687, -0.9230902, -2.577065, 1, 1, 1, 1, 1,
-0.4935415, 1.413275, 0.2126709, 1, 1, 1, 1, 1,
-0.4910053, 1.662317, 0.5057765, 0, 0, 1, 1, 1,
-0.4846112, -0.8821572, -2.203017, 1, 0, 0, 1, 1,
-0.4835471, 1.304106, -0.5676773, 1, 0, 0, 1, 1,
-0.4834658, 1.97776, -1.012058, 1, 0, 0, 1, 1,
-0.4812236, -0.5798287, -3.150035, 1, 0, 0, 1, 1,
-0.4807707, -1.863549, -2.844259, 1, 0, 0, 1, 1,
-0.4802639, -1.945005, -4.016942, 0, 0, 0, 1, 1,
-0.4763046, -1.131529, -1.797416, 0, 0, 0, 1, 1,
-0.4732923, -1.562877, -3.012465, 0, 0, 0, 1, 1,
-0.4714926, 0.6921936, -0.536121, 0, 0, 0, 1, 1,
-0.4704802, 1.618563, 0.8997687, 0, 0, 0, 1, 1,
-0.4695945, -0.5515889, -2.805441, 0, 0, 0, 1, 1,
-0.4684468, -1.707163, -2.453285, 0, 0, 0, 1, 1,
-0.465189, -1.323565, -1.560429, 1, 1, 1, 1, 1,
-0.4650629, -0.9729162, -1.646752, 1, 1, 1, 1, 1,
-0.4619299, 0.1099191, -0.8321256, 1, 1, 1, 1, 1,
-0.4611558, 0.6751852, -2.018624, 1, 1, 1, 1, 1,
-0.4609867, -1.108527, -1.892037, 1, 1, 1, 1, 1,
-0.4609559, -0.2097554, -4.281868, 1, 1, 1, 1, 1,
-0.4605179, -0.2279379, -2.04851, 1, 1, 1, 1, 1,
-0.4597563, -0.02867513, -2.136234, 1, 1, 1, 1, 1,
-0.4549332, -0.7485281, -2.755372, 1, 1, 1, 1, 1,
-0.4506725, 1.331197, -1.011953, 1, 1, 1, 1, 1,
-0.4460216, 0.7027023, -1.668275, 1, 1, 1, 1, 1,
-0.4429328, 0.2680118, -0.1685894, 1, 1, 1, 1, 1,
-0.4385563, 0.1292727, -1.175899, 1, 1, 1, 1, 1,
-0.4383364, -1.408515, -2.979579, 1, 1, 1, 1, 1,
-0.433239, 0.8668686, -2.766307, 1, 1, 1, 1, 1,
-0.4323964, -0.2038894, -1.398445, 0, 0, 1, 1, 1,
-0.4286887, -1.477588, -1.8358, 1, 0, 0, 1, 1,
-0.4186267, 0.2431716, -1.700488, 1, 0, 0, 1, 1,
-0.415811, 0.5157129, -0.9660535, 1, 0, 0, 1, 1,
-0.4130998, 0.9054151, -0.008499444, 1, 0, 0, 1, 1,
-0.4111694, 0.5446593, 0.1074351, 1, 0, 0, 1, 1,
-0.409727, -0.2163672, -1.658735, 0, 0, 0, 1, 1,
-0.4091509, -0.194163, -2.412594, 0, 0, 0, 1, 1,
-0.4083329, 0.08630858, -1.623365, 0, 0, 0, 1, 1,
-0.4055037, -0.1670405, -2.51244, 0, 0, 0, 1, 1,
-0.402753, -1.831912, -2.895862, 0, 0, 0, 1, 1,
-0.3957139, 0.6856997, -0.1234385, 0, 0, 0, 1, 1,
-0.3944255, 0.9801636, 0.6329951, 0, 0, 0, 1, 1,
-0.3902612, -1.188607, -3.590051, 1, 1, 1, 1, 1,
-0.389361, 0.6163249, -0.8764121, 1, 1, 1, 1, 1,
-0.3887412, 0.531098, -1.246285, 1, 1, 1, 1, 1,
-0.3883315, -2.115391, -3.601868, 1, 1, 1, 1, 1,
-0.3875613, 1.029247, -1.233584, 1, 1, 1, 1, 1,
-0.3857163, 1.163592, -0.9073936, 1, 1, 1, 1, 1,
-0.3820482, -0.7458218, -1.694729, 1, 1, 1, 1, 1,
-0.3805062, 0.04992891, -2.889774, 1, 1, 1, 1, 1,
-0.3780703, -1.367007, -2.783642, 1, 1, 1, 1, 1,
-0.3730565, 0.6714357, 0.3249528, 1, 1, 1, 1, 1,
-0.3715565, -0.7927689, -0.7202572, 1, 1, 1, 1, 1,
-0.3691241, -1.112963, -1.634815, 1, 1, 1, 1, 1,
-0.3687121, 0.02547279, -1.846667, 1, 1, 1, 1, 1,
-0.3648947, 1.276434, 1.089599, 1, 1, 1, 1, 1,
-0.3608876, -1.176638, -5.010957, 1, 1, 1, 1, 1,
-0.3560373, 0.195778, -0.7629321, 0, 0, 1, 1, 1,
-0.3558426, 2.323686, -0.2564401, 1, 0, 0, 1, 1,
-0.3546384, 0.8265951, -0.7807987, 1, 0, 0, 1, 1,
-0.3534027, 0.2186727, -1.130713, 1, 0, 0, 1, 1,
-0.3530876, 0.7387484, 0.04197248, 1, 0, 0, 1, 1,
-0.3510133, -1.890396, -3.092232, 1, 0, 0, 1, 1,
-0.3490572, -0.6171529, -3.532568, 0, 0, 0, 1, 1,
-0.3486772, 1.3234, 0.4143749, 0, 0, 0, 1, 1,
-0.3473905, -0.5118312, -2.411021, 0, 0, 0, 1, 1,
-0.3472717, 0.5807683, 0.02015097, 0, 0, 0, 1, 1,
-0.3445398, 0.09239884, 0.389037, 0, 0, 0, 1, 1,
-0.3407815, -0.542747, -3.08613, 0, 0, 0, 1, 1,
-0.3406105, -0.2304284, -4.547494, 0, 0, 0, 1, 1,
-0.3394446, 0.1917267, 1.037947, 1, 1, 1, 1, 1,
-0.3386878, 0.7007483, -2.158857, 1, 1, 1, 1, 1,
-0.3373785, 0.5436612, 0.7358589, 1, 1, 1, 1, 1,
-0.3327982, -1.296925, -2.051839, 1, 1, 1, 1, 1,
-0.330165, -0.1810286, -2.53136, 1, 1, 1, 1, 1,
-0.3267504, -0.4132573, -3.193053, 1, 1, 1, 1, 1,
-0.3113742, -2.361592, -3.307986, 1, 1, 1, 1, 1,
-0.309523, -1.397725, -3.664675, 1, 1, 1, 1, 1,
-0.3075946, 0.01333573, -0.7793291, 1, 1, 1, 1, 1,
-0.3047837, -1.765405, -2.672677, 1, 1, 1, 1, 1,
-0.3016844, 1.340521, -1.41415, 1, 1, 1, 1, 1,
-0.2967159, -0.0001867941, -2.149311, 1, 1, 1, 1, 1,
-0.2941756, -0.04786074, -1.282589, 1, 1, 1, 1, 1,
-0.2940775, 0.9169306, -0.01551366, 1, 1, 1, 1, 1,
-0.2921142, 0.2817689, 1.392495, 1, 1, 1, 1, 1,
-0.2917445, -0.3109035, -3.651152, 0, 0, 1, 1, 1,
-0.2888842, 2.932077, -1.113897, 1, 0, 0, 1, 1,
-0.2867537, 0.4307147, -1.767733, 1, 0, 0, 1, 1,
-0.2838463, 0.008633311, -2.370806, 1, 0, 0, 1, 1,
-0.2833666, -0.09301661, -0.9028105, 1, 0, 0, 1, 1,
-0.2809135, 0.1212213, -1.54625, 1, 0, 0, 1, 1,
-0.2783571, 0.2846957, -1.093831, 0, 0, 0, 1, 1,
-0.2677313, -2.932874, -2.925819, 0, 0, 0, 1, 1,
-0.2654192, 0.4901145, -0.8601347, 0, 0, 0, 1, 1,
-0.2628146, -0.1805168, -3.100663, 0, 0, 0, 1, 1,
-0.2619996, 1.07843, 0.7252085, 0, 0, 0, 1, 1,
-0.2599928, -0.6242294, -1.577498, 0, 0, 0, 1, 1,
-0.2595899, 0.8113056, 0.009079816, 0, 0, 0, 1, 1,
-0.2581064, -0.4745326, -2.803588, 1, 1, 1, 1, 1,
-0.2539914, 0.3171746, 0.2140929, 1, 1, 1, 1, 1,
-0.2490588, 0.3689277, -1.222429, 1, 1, 1, 1, 1,
-0.2469555, 1.025549, -1.023565, 1, 1, 1, 1, 1,
-0.2451126, 0.8817695, 0.130028, 1, 1, 1, 1, 1,
-0.2449982, 1.504078, -1.741395, 1, 1, 1, 1, 1,
-0.2445055, 0.06606884, -1.306582, 1, 1, 1, 1, 1,
-0.2435065, 1.446393, -0.9334495, 1, 1, 1, 1, 1,
-0.2426624, 1.045499, 1.122387, 1, 1, 1, 1, 1,
-0.2403729, -1.807866, -1.860545, 1, 1, 1, 1, 1,
-0.237133, 0.7388714, -1.224826, 1, 1, 1, 1, 1,
-0.235849, 0.4495086, -0.6567316, 1, 1, 1, 1, 1,
-0.2351184, -1.01122, -2.431334, 1, 1, 1, 1, 1,
-0.2347009, 0.1767837, -0.8889144, 1, 1, 1, 1, 1,
-0.2318768, 0.9237302, -0.0498313, 1, 1, 1, 1, 1,
-0.2294584, -0.5257473, -2.406048, 0, 0, 1, 1, 1,
-0.22542, 0.5208201, -0.6964916, 1, 0, 0, 1, 1,
-0.2242168, 1.165281, 0.910095, 1, 0, 0, 1, 1,
-0.2231167, -1.019218, -2.954421, 1, 0, 0, 1, 1,
-0.2165266, -0.3061038, -2.214024, 1, 0, 0, 1, 1,
-0.2081636, 1.949453, 0.05463425, 1, 0, 0, 1, 1,
-0.2040942, 0.5469736, -0.998711, 0, 0, 0, 1, 1,
-0.201412, 0.2922611, -1.103339, 0, 0, 0, 1, 1,
-0.2003452, -0.5484911, -2.756121, 0, 0, 0, 1, 1,
-0.1971694, -0.1671196, -4.431519, 0, 0, 0, 1, 1,
-0.193928, 0.4492493, 0.9539768, 0, 0, 0, 1, 1,
-0.1900267, -1.403821, -2.735527, 0, 0, 0, 1, 1,
-0.1879164, -0.3392522, -4.416916, 0, 0, 0, 1, 1,
-0.18754, 0.05091867, -0.2975756, 1, 1, 1, 1, 1,
-0.1870381, -0.330018, -1.875886, 1, 1, 1, 1, 1,
-0.1859873, -1.064374, -1.044186, 1, 1, 1, 1, 1,
-0.1806708, -1.530838, -2.697436, 1, 1, 1, 1, 1,
-0.1798993, 0.5611241, -1.266536, 1, 1, 1, 1, 1,
-0.1796935, -0.9671474, -2.904459, 1, 1, 1, 1, 1,
-0.1745542, 0.4312123, 0.5029159, 1, 1, 1, 1, 1,
-0.1664628, 0.6330312, -0.128045, 1, 1, 1, 1, 1,
-0.1593805, 0.5544664, -0.7520933, 1, 1, 1, 1, 1,
-0.1590647, 0.5228751, -1.528508, 1, 1, 1, 1, 1,
-0.1551781, 1.1576, 0.5703717, 1, 1, 1, 1, 1,
-0.1463893, 0.2292898, 0.8984821, 1, 1, 1, 1, 1,
-0.1463804, -1.695489, -2.261647, 1, 1, 1, 1, 1,
-0.1440242, -1.196203, -4.586723, 1, 1, 1, 1, 1,
-0.140377, 0.9050856, 1.430557, 1, 1, 1, 1, 1,
-0.1358446, -1.030692, -3.375153, 0, 0, 1, 1, 1,
-0.1307399, 0.9848952, -0.4930736, 1, 0, 0, 1, 1,
-0.1304368, -0.2731473, -1.915275, 1, 0, 0, 1, 1,
-0.1296738, 0.1389888, 0.9499996, 1, 0, 0, 1, 1,
-0.1289525, 0.9714243, -0.9432563, 1, 0, 0, 1, 1,
-0.1287607, -1.903138, -2.802008, 1, 0, 0, 1, 1,
-0.1250218, 0.3444503, -0.9499977, 0, 0, 0, 1, 1,
-0.1233087, -1.175963, -2.982333, 0, 0, 0, 1, 1,
-0.1218665, 0.05012473, -0.540804, 0, 0, 0, 1, 1,
-0.1203518, 2.981423, -0.3402109, 0, 0, 0, 1, 1,
-0.1131666, 1.008066, -0.7677315, 0, 0, 0, 1, 1,
-0.1039864, 1.630221, 0.4259406, 0, 0, 0, 1, 1,
-0.1025411, 1.468546, -0.006340482, 0, 0, 0, 1, 1,
-0.1018344, -0.07268941, -2.961543, 1, 1, 1, 1, 1,
-0.1012263, -1.252017, -2.469608, 1, 1, 1, 1, 1,
-0.09768221, 1.345569, 0.2492329, 1, 1, 1, 1, 1,
-0.09593689, 0.146452, -0.6053788, 1, 1, 1, 1, 1,
-0.09524494, -0.6626131, -1.983428, 1, 1, 1, 1, 1,
-0.08541499, 1.409447, -0.5321327, 1, 1, 1, 1, 1,
-0.0783832, 1.606431, -1.792536, 1, 1, 1, 1, 1,
-0.07443956, 0.8434803, -1.780246, 1, 1, 1, 1, 1,
-0.07070915, -0.1162194, -2.422932, 1, 1, 1, 1, 1,
-0.06841207, 0.4415371, 1.131322, 1, 1, 1, 1, 1,
-0.06598698, -0.2297194, -1.695462, 1, 1, 1, 1, 1,
-0.06362648, 0.9311573, 0.01997166, 1, 1, 1, 1, 1,
-0.06227132, -0.5886255, -1.602907, 1, 1, 1, 1, 1,
-0.06055428, -1.658002, -2.189606, 1, 1, 1, 1, 1,
-0.05723823, -1.13488, -2.901165, 1, 1, 1, 1, 1,
-0.05327851, -1.124736, -3.385212, 0, 0, 1, 1, 1,
-0.05298181, 0.6776096, -0.6968542, 1, 0, 0, 1, 1,
-0.05203816, 0.6790863, -0.9915717, 1, 0, 0, 1, 1,
-0.05143533, -1.030896, -2.074255, 1, 0, 0, 1, 1,
-0.05081116, 0.005606595, -1.8313, 1, 0, 0, 1, 1,
-0.04466214, -0.8253471, -3.110438, 1, 0, 0, 1, 1,
-0.04445845, -0.6954967, -2.401499, 0, 0, 0, 1, 1,
-0.04362497, 0.0583564, -0.6496866, 0, 0, 0, 1, 1,
-0.041468, -0.4280806, -2.761409, 0, 0, 0, 1, 1,
-0.02936628, 0.4903553, 0.06168772, 0, 0, 0, 1, 1,
-0.02621333, 0.06254887, 1.114662, 0, 0, 0, 1, 1,
-0.02536423, -0.2647916, -1.671923, 0, 0, 0, 1, 1,
-0.01864554, 1.137081, -1.718684, 0, 0, 0, 1, 1,
-0.01514808, 0.3911949, -0.9667353, 1, 1, 1, 1, 1,
-0.01125872, -0.8544828, -4.75563, 1, 1, 1, 1, 1,
-0.007172771, 1.63417, 0.7882487, 1, 1, 1, 1, 1,
-0.002256604, -0.3287655, -3.288222, 1, 1, 1, 1, 1,
-0.0001933576, -0.772835, -2.610214, 1, 1, 1, 1, 1,
0.002608691, -0.7265308, 2.869635, 1, 1, 1, 1, 1,
0.004937029, -0.9478303, 3.042673, 1, 1, 1, 1, 1,
0.006181596, -1.019927, 2.608061, 1, 1, 1, 1, 1,
0.007366213, 0.847805, -1.487655, 1, 1, 1, 1, 1,
0.008998513, 2.25865, -1.024357, 1, 1, 1, 1, 1,
0.009564837, -0.08344883, 5.134696, 1, 1, 1, 1, 1,
0.01611866, 0.8146212, 0.9436622, 1, 1, 1, 1, 1,
0.02180097, -1.416904, 2.397743, 1, 1, 1, 1, 1,
0.02258787, -1.443223, 2.586411, 1, 1, 1, 1, 1,
0.02310346, -0.07877709, 1.292647, 1, 1, 1, 1, 1,
0.02460097, -0.1420283, 2.609994, 0, 0, 1, 1, 1,
0.02519354, -1.374605, 3.474243, 1, 0, 0, 1, 1,
0.02564422, -2.65704, 1.600211, 1, 0, 0, 1, 1,
0.02587073, -0.3825788, 2.370678, 1, 0, 0, 1, 1,
0.02600371, -0.08366772, 2.58512, 1, 0, 0, 1, 1,
0.02723962, -0.05924734, 4.822385, 1, 0, 0, 1, 1,
0.03134464, -0.7684865, 3.655172, 0, 0, 0, 1, 1,
0.03262202, 1.505375, -1.631133, 0, 0, 0, 1, 1,
0.0429497, -0.4501663, 2.775294, 0, 0, 0, 1, 1,
0.04524948, -0.682734, 2.201188, 0, 0, 0, 1, 1,
0.04736828, 0.2637815, -0.9771331, 0, 0, 0, 1, 1,
0.04956435, 0.8375211, -0.6768562, 0, 0, 0, 1, 1,
0.0511089, -0.5774196, 5.244823, 0, 0, 0, 1, 1,
0.0560151, -0.6261245, 3.990471, 1, 1, 1, 1, 1,
0.05668587, -0.3009351, 1.474246, 1, 1, 1, 1, 1,
0.05937414, 0.2058621, 0.7409294, 1, 1, 1, 1, 1,
0.05980598, 0.7137963, 0.03611971, 1, 1, 1, 1, 1,
0.05995202, 0.3091693, 2.331922, 1, 1, 1, 1, 1,
0.06123987, 0.1537254, 2.541868, 1, 1, 1, 1, 1,
0.06169321, -0.9386646, 1.733174, 1, 1, 1, 1, 1,
0.06181571, -0.1875538, 3.103871, 1, 1, 1, 1, 1,
0.06239907, 0.4484252, 0.01612647, 1, 1, 1, 1, 1,
0.07050508, -0.3327774, 2.31121, 1, 1, 1, 1, 1,
0.07125111, -0.212419, 2.853366, 1, 1, 1, 1, 1,
0.07177791, -0.7978299, 3.097122, 1, 1, 1, 1, 1,
0.07194766, -1.707606, 2.446354, 1, 1, 1, 1, 1,
0.07247816, -0.305891, 3.757706, 1, 1, 1, 1, 1,
0.07306976, 0.5997178, -0.02775139, 1, 1, 1, 1, 1,
0.07843094, -2.749367, 2.897749, 0, 0, 1, 1, 1,
0.07980454, -0.7452068, 1.982064, 1, 0, 0, 1, 1,
0.08047863, -0.9605514, 2.941732, 1, 0, 0, 1, 1,
0.08217991, 1.539965, 0.9268905, 1, 0, 0, 1, 1,
0.08512452, -2.535215, 3.691962, 1, 0, 0, 1, 1,
0.08983294, 0.05001571, 2.22926, 1, 0, 0, 1, 1,
0.09132609, -0.01775951, 1.30738, 0, 0, 0, 1, 1,
0.09135581, -0.3973962, 2.828462, 0, 0, 0, 1, 1,
0.09173623, -0.2032665, 3.622368, 0, 0, 0, 1, 1,
0.09551026, 0.04107822, 1.580138, 0, 0, 0, 1, 1,
0.09611634, -0.8334543, 4.648139, 0, 0, 0, 1, 1,
0.09914801, 2.178368, -2.727443, 0, 0, 0, 1, 1,
0.09953013, 1.1057, 0.4904436, 0, 0, 0, 1, 1,
0.09996755, -0.4773752, 2.852969, 1, 1, 1, 1, 1,
0.1041512, -1.443784, 2.018758, 1, 1, 1, 1, 1,
0.1076897, 1.152566, 1.309242, 1, 1, 1, 1, 1,
0.109967, 0.5011604, 0.06491526, 1, 1, 1, 1, 1,
0.1153302, 0.5932547, 1.091598, 1, 1, 1, 1, 1,
0.1161903, -0.4377598, 3.837792, 1, 1, 1, 1, 1,
0.1176602, 0.01087109, 2.097829, 1, 1, 1, 1, 1,
0.1179321, 1.635712, -2.072246, 1, 1, 1, 1, 1,
0.1191177, 1.197754, 0.5263143, 1, 1, 1, 1, 1,
0.1201701, -0.830197, 2.161639, 1, 1, 1, 1, 1,
0.1211051, -1.031169, 1.594733, 1, 1, 1, 1, 1,
0.1239658, -1.616915, 2.650575, 1, 1, 1, 1, 1,
0.1287596, 1.229762, 0.3290844, 1, 1, 1, 1, 1,
0.1302285, -2.744255, 1.977461, 1, 1, 1, 1, 1,
0.1306335, 1.100552, 1.204675, 1, 1, 1, 1, 1,
0.1320029, 0.5486645, 0.7328888, 0, 0, 1, 1, 1,
0.1322922, 0.6679575, 0.5834458, 1, 0, 0, 1, 1,
0.1346842, 1.102887, -1.456976, 1, 0, 0, 1, 1,
0.1373799, 0.7776169, 1.43789, 1, 0, 0, 1, 1,
0.1387514, 0.6915236, 1.611015, 1, 0, 0, 1, 1,
0.1476019, 1.140431, -1.142166, 1, 0, 0, 1, 1,
0.1492135, 1.221379, 1.018468, 0, 0, 0, 1, 1,
0.1518224, 0.01262616, 3.914079, 0, 0, 0, 1, 1,
0.155875, -0.8858976, 0.5794981, 0, 0, 0, 1, 1,
0.1568929, -0.60786, 0.5152857, 0, 0, 0, 1, 1,
0.1633067, -0.2638987, 1.435488, 0, 0, 0, 1, 1,
0.1660086, 0.5030887, 1.164475, 0, 0, 0, 1, 1,
0.1664115, 0.3928834, 1.477631, 0, 0, 0, 1, 1,
0.1676738, 0.6362149, -0.04932725, 1, 1, 1, 1, 1,
0.1728823, 1.986791, 1.049278, 1, 1, 1, 1, 1,
0.1851887, 0.8538839, 1.052982, 1, 1, 1, 1, 1,
0.1887406, -0.9966907, 2.940409, 1, 1, 1, 1, 1,
0.1927408, 0.8959302, 0.5628762, 1, 1, 1, 1, 1,
0.1973343, 0.993544, 0.2482114, 1, 1, 1, 1, 1,
0.2031066, -1.602491, 4.321743, 1, 1, 1, 1, 1,
0.2061728, 0.4948561, -0.1266998, 1, 1, 1, 1, 1,
0.2082497, 1.180343, 0.3128278, 1, 1, 1, 1, 1,
0.2100218, -0.3158391, 3.56691, 1, 1, 1, 1, 1,
0.2144309, 1.531278, -1.912238, 1, 1, 1, 1, 1,
0.220729, -0.08426674, 2.356635, 1, 1, 1, 1, 1,
0.2213628, 1.680401, 1.012196, 1, 1, 1, 1, 1,
0.221627, -0.4065379, 3.380841, 1, 1, 1, 1, 1,
0.2227698, -0.2999127, 2.647357, 1, 1, 1, 1, 1,
0.2231441, 0.9823032, -0.3480411, 0, 0, 1, 1, 1,
0.2248142, 0.4120221, -0.4003162, 1, 0, 0, 1, 1,
0.2275665, 0.2214175, 1.292906, 1, 0, 0, 1, 1,
0.2286751, -0.01625747, 3.252225, 1, 0, 0, 1, 1,
0.2349981, -1.386303, 2.69142, 1, 0, 0, 1, 1,
0.2357682, 0.6951107, 0.9382589, 1, 0, 0, 1, 1,
0.2406756, 0.8227772, -0.3331763, 0, 0, 0, 1, 1,
0.2417136, 1.056861, 0.8490328, 0, 0, 0, 1, 1,
0.2420876, 0.02800861, 0.07111519, 0, 0, 0, 1, 1,
0.2444856, 0.2979842, -0.6286726, 0, 0, 0, 1, 1,
0.2513458, 1.721391, -0.3521017, 0, 0, 0, 1, 1,
0.2549592, -0.161999, 2.201258, 0, 0, 0, 1, 1,
0.2564466, 0.2844112, 0.8048321, 0, 0, 0, 1, 1,
0.2564906, 1.555106, 0.3690796, 1, 1, 1, 1, 1,
0.2571824, 0.1314661, 1.586242, 1, 1, 1, 1, 1,
0.2595549, 0.6147343, 0.2451913, 1, 1, 1, 1, 1,
0.2597582, 0.7222259, 0.2762643, 1, 1, 1, 1, 1,
0.2626994, -0.4711758, 1.956127, 1, 1, 1, 1, 1,
0.2630956, 1.626024, 0.07508442, 1, 1, 1, 1, 1,
0.2633676, 1.921273, 0.2693587, 1, 1, 1, 1, 1,
0.2671808, 0.4951086, 0.4293205, 1, 1, 1, 1, 1,
0.2764934, -0.316404, 3.197915, 1, 1, 1, 1, 1,
0.279797, -1.529364, 1.693214, 1, 1, 1, 1, 1,
0.2877269, 0.1021939, 2.339395, 1, 1, 1, 1, 1,
0.2889539, 0.1847773, 1.190152, 1, 1, 1, 1, 1,
0.2917575, 0.6432382, 1.700854, 1, 1, 1, 1, 1,
0.2936868, 0.5876317, 2.445382, 1, 1, 1, 1, 1,
0.2953052, -0.3445644, 2.999069, 1, 1, 1, 1, 1,
0.2965158, 0.1316543, 3.218153, 0, 0, 1, 1, 1,
0.3038158, -0.07721607, 1.660418, 1, 0, 0, 1, 1,
0.3044149, 0.05458331, -0.04096829, 1, 0, 0, 1, 1,
0.3060771, -1.139044, 2.908831, 1, 0, 0, 1, 1,
0.3147746, -0.4988225, 1.45385, 1, 0, 0, 1, 1,
0.3157728, 0.6824737, 0.6074973, 1, 0, 0, 1, 1,
0.3185104, 0.9110876, -1.059533, 0, 0, 0, 1, 1,
0.3241545, -0.06787097, 3.862915, 0, 0, 0, 1, 1,
0.3242076, 0.8435348, 2.200485, 0, 0, 0, 1, 1,
0.3279413, 0.3964306, 2.059287, 0, 0, 0, 1, 1,
0.3300414, -0.219046, 2.814471, 0, 0, 0, 1, 1,
0.3355519, -0.5942746, 1.326975, 0, 0, 0, 1, 1,
0.3364337, 1.185774, -0.2416512, 0, 0, 0, 1, 1,
0.3373652, -1.514476, 4.558617, 1, 1, 1, 1, 1,
0.3387219, -0.7375517, 3.586055, 1, 1, 1, 1, 1,
0.3430674, -0.6589595, 2.053722, 1, 1, 1, 1, 1,
0.3435388, -0.3487542, 1.633224, 1, 1, 1, 1, 1,
0.3441466, 0.4984711, 0.379027, 1, 1, 1, 1, 1,
0.3447742, -0.8318161, 2.84862, 1, 1, 1, 1, 1,
0.347528, 0.7723041, 1.029947, 1, 1, 1, 1, 1,
0.3482179, -0.1490231, 2.013027, 1, 1, 1, 1, 1,
0.3488499, 0.06924794, 0.6151256, 1, 1, 1, 1, 1,
0.3565879, -0.1707691, 2.525891, 1, 1, 1, 1, 1,
0.3569742, -0.2797764, 0.9236785, 1, 1, 1, 1, 1,
0.3653209, 0.1497595, 0.7179988, 1, 1, 1, 1, 1,
0.3694765, -0.6639078, 2.260717, 1, 1, 1, 1, 1,
0.3712016, -0.1961977, 3.267349, 1, 1, 1, 1, 1,
0.3751684, 2.01283, 1.652524, 1, 1, 1, 1, 1,
0.3765389, -1.688172, 4.428014, 0, 0, 1, 1, 1,
0.3828085, -0.1913861, 0.3568766, 1, 0, 0, 1, 1,
0.3835481, 0.4147223, 1.424349, 1, 0, 0, 1, 1,
0.3864477, 0.7624862, 1.426864, 1, 0, 0, 1, 1,
0.3887785, -0.2989159, 3.523653, 1, 0, 0, 1, 1,
0.3946253, 1.662208, -0.01873005, 1, 0, 0, 1, 1,
0.4018693, -0.5382563, 1.081271, 0, 0, 0, 1, 1,
0.4020517, 0.1606425, 1.892842, 0, 0, 0, 1, 1,
0.4041736, 1.27568, 0.7109419, 0, 0, 0, 1, 1,
0.4054728, 0.3199011, 0.06226607, 0, 0, 0, 1, 1,
0.4060119, 0.8390482, -1.584388, 0, 0, 0, 1, 1,
0.4132009, 0.1314467, 2.304072, 0, 0, 0, 1, 1,
0.4137422, 0.1071221, -0.1450648, 0, 0, 0, 1, 1,
0.4138603, -0.09800543, -0.6970897, 1, 1, 1, 1, 1,
0.414892, -1.685701, 4.585922, 1, 1, 1, 1, 1,
0.4157601, 1.045177, 0.1655217, 1, 1, 1, 1, 1,
0.4159898, -0.3924943, 1.009521, 1, 1, 1, 1, 1,
0.424441, 1.168443, -1.184703, 1, 1, 1, 1, 1,
0.4249098, 1.48097, 0.5612466, 1, 1, 1, 1, 1,
0.43053, 0.5255846, -0.7031255, 1, 1, 1, 1, 1,
0.4329603, 1.064278, 0.8599977, 1, 1, 1, 1, 1,
0.4332882, 0.5215956, 0.767506, 1, 1, 1, 1, 1,
0.4359217, -1.818387, 1.842177, 1, 1, 1, 1, 1,
0.4438159, 0.6166697, 1.253113, 1, 1, 1, 1, 1,
0.4479361, 0.09853055, 2.569613, 1, 1, 1, 1, 1,
0.4484953, -0.7362409, 3.529297, 1, 1, 1, 1, 1,
0.45133, -1.373755, 4.200276, 1, 1, 1, 1, 1,
0.4519953, 2.292259, -0.08763161, 1, 1, 1, 1, 1,
0.4532689, 0.8797398, 0.4656073, 0, 0, 1, 1, 1,
0.4541585, 0.07988054, -0.7517086, 1, 0, 0, 1, 1,
0.4581008, -0.2924786, 2.488867, 1, 0, 0, 1, 1,
0.4583919, 0.1582381, 0.6115974, 1, 0, 0, 1, 1,
0.4591092, -0.3901391, 2.191973, 1, 0, 0, 1, 1,
0.4610363, 0.4705437, 0.614152, 1, 0, 0, 1, 1,
0.4660446, -2.142311, 4.481223, 0, 0, 0, 1, 1,
0.4671025, -0.3773468, 2.418218, 0, 0, 0, 1, 1,
0.4727422, 0.3359238, 0.569559, 0, 0, 0, 1, 1,
0.474147, 1.070455, 0.6318638, 0, 0, 0, 1, 1,
0.4757379, -0.9050828, 4.741353, 0, 0, 0, 1, 1,
0.4766231, 2.02619, 0.5987623, 0, 0, 0, 1, 1,
0.4842644, -0.3445762, 1.413753, 0, 0, 0, 1, 1,
0.485302, 0.9635782, 0.811312, 1, 1, 1, 1, 1,
0.4868318, -0.3574672, 0.05161883, 1, 1, 1, 1, 1,
0.4873454, -0.552624, 1.936193, 1, 1, 1, 1, 1,
0.4882105, -2.444519, 2.318589, 1, 1, 1, 1, 1,
0.4895403, 0.1986788, 0.6119938, 1, 1, 1, 1, 1,
0.4906316, 1.182581, -0.0710386, 1, 1, 1, 1, 1,
0.4914759, 0.9927126, 1.114584, 1, 1, 1, 1, 1,
0.4933299, 1.487728, -0.3636267, 1, 1, 1, 1, 1,
0.4949989, -0.3543126, 3.353836, 1, 1, 1, 1, 1,
0.5007439, -0.6322657, 2.897172, 1, 1, 1, 1, 1,
0.5020409, -0.7779949, 1.633565, 1, 1, 1, 1, 1,
0.5044001, -0.675538, 2.768766, 1, 1, 1, 1, 1,
0.5056528, -0.268398, 1.868146, 1, 1, 1, 1, 1,
0.5100039, -1.666427, 3.77533, 1, 1, 1, 1, 1,
0.510193, 0.9076787, 0.8781511, 1, 1, 1, 1, 1,
0.5120613, 0.4900221, 0.7564611, 0, 0, 1, 1, 1,
0.5133448, -0.5126586, 1.719142, 1, 0, 0, 1, 1,
0.5156764, 0.7100809, 1.593062, 1, 0, 0, 1, 1,
0.5163896, -1.768047, 2.204421, 1, 0, 0, 1, 1,
0.5203592, 1.087956, -0.5984109, 1, 0, 0, 1, 1,
0.5206916, -2.065485, 2.302007, 1, 0, 0, 1, 1,
0.5212682, 0.004412474, 2.051085, 0, 0, 0, 1, 1,
0.5268756, -0.1563773, 0.007592394, 0, 0, 0, 1, 1,
0.5300736, 0.7215976, 0.07938813, 0, 0, 0, 1, 1,
0.5301465, -1.404072, 3.10949, 0, 0, 0, 1, 1,
0.5319559, -0.4506415, 3.993205, 0, 0, 0, 1, 1,
0.5321394, 1.898526, 0.5232582, 0, 0, 0, 1, 1,
0.5333356, -3.027865, 2.579146, 0, 0, 0, 1, 1,
0.5382996, -0.1893641, 2.623751, 1, 1, 1, 1, 1,
0.5417104, -0.950964, 2.672827, 1, 1, 1, 1, 1,
0.5441322, 1.051909, 0.9071283, 1, 1, 1, 1, 1,
0.5512741, -0.4723419, 0.5392261, 1, 1, 1, 1, 1,
0.5568314, -1.158536, 0.853561, 1, 1, 1, 1, 1,
0.5577468, 1.203495, -0.2820309, 1, 1, 1, 1, 1,
0.5594156, 1.024831, -0.1022232, 1, 1, 1, 1, 1,
0.5620611, 0.530369, 0.5510557, 1, 1, 1, 1, 1,
0.5639881, 0.818846, -0.276838, 1, 1, 1, 1, 1,
0.5644699, 0.6307298, 0.9337134, 1, 1, 1, 1, 1,
0.5715952, -0.1364006, 1.347134, 1, 1, 1, 1, 1,
0.5725331, -1.373811, 3.467306, 1, 1, 1, 1, 1,
0.5731518, 0.1827509, 0.9232275, 1, 1, 1, 1, 1,
0.5751336, 0.3439218, -0.5830997, 1, 1, 1, 1, 1,
0.5842195, 1.942138, 2.133576, 1, 1, 1, 1, 1,
0.5897099, -0.1587412, 2.065466, 0, 0, 1, 1, 1,
0.5912027, -1.010222, 1.352283, 1, 0, 0, 1, 1,
0.5912726, -1.333251, 1.407655, 1, 0, 0, 1, 1,
0.5982761, -0.5182044, 1.478466, 1, 0, 0, 1, 1,
0.6006942, -0.2404329, 1.863377, 1, 0, 0, 1, 1,
0.6019939, -0.4281366, 1.731045, 1, 0, 0, 1, 1,
0.6034928, -0.9638147, 2.173045, 0, 0, 0, 1, 1,
0.6050169, 1.410749, -0.8734682, 0, 0, 0, 1, 1,
0.6055402, 0.9110059, -0.3969962, 0, 0, 0, 1, 1,
0.6067778, -1.638258, 3.957534, 0, 0, 0, 1, 1,
0.6072195, -0.5462198, 2.266951, 0, 0, 0, 1, 1,
0.607453, 0.775448, 0.8736933, 0, 0, 0, 1, 1,
0.612008, 2.411124, 0.9088776, 0, 0, 0, 1, 1,
0.6153119, 0.9258681, 1.539376, 1, 1, 1, 1, 1,
0.6163535, -1.240179, 1.73436, 1, 1, 1, 1, 1,
0.617064, -0.7638848, 2.227044, 1, 1, 1, 1, 1,
0.6177308, -0.294314, 1.979628, 1, 1, 1, 1, 1,
0.6315721, 1.657764, 0.309265, 1, 1, 1, 1, 1,
0.6320005, -0.3000756, 2.20008, 1, 1, 1, 1, 1,
0.6326743, 2.134553, -0.9202662, 1, 1, 1, 1, 1,
0.6328542, -0.30916, 1.856945, 1, 1, 1, 1, 1,
0.6334225, 0.04747526, -0.3472582, 1, 1, 1, 1, 1,
0.6373274, -1.022004, 2.836324, 1, 1, 1, 1, 1,
0.6396964, -0.3776796, 0.1286167, 1, 1, 1, 1, 1,
0.6436511, -2.099689, 2.862051, 1, 1, 1, 1, 1,
0.6469913, -0.4700162, 2.730936, 1, 1, 1, 1, 1,
0.647756, -0.04444935, 3.772285, 1, 1, 1, 1, 1,
0.6501503, 0.8959637, 1.042362, 1, 1, 1, 1, 1,
0.6509644, 0.364673, 0.5703069, 0, 0, 1, 1, 1,
0.6564707, 0.8371511, -0.2737753, 1, 0, 0, 1, 1,
0.6568187, -1.012321, 2.124513, 1, 0, 0, 1, 1,
0.6600834, 1.766036, 1.801182, 1, 0, 0, 1, 1,
0.6612739, -0.8670929, 1.935148, 1, 0, 0, 1, 1,
0.668942, 0.03231657, -1.382405, 1, 0, 0, 1, 1,
0.6698426, 1.572044, 2.104216, 0, 0, 0, 1, 1,
0.6757462, -1.901416, 2.77493, 0, 0, 0, 1, 1,
0.6819356, -0.5287634, 2.121308, 0, 0, 0, 1, 1,
0.6847415, -0.1317578, 0.8210396, 0, 0, 0, 1, 1,
0.6909283, -0.1415129, 2.459456, 0, 0, 0, 1, 1,
0.6931388, 0.8459069, -0.3728586, 0, 0, 0, 1, 1,
0.6933047, 0.7374417, 0.2083212, 0, 0, 0, 1, 1,
0.6952771, 1.275021, 0.3036376, 1, 1, 1, 1, 1,
0.7071388, -0.3951466, 2.718577, 1, 1, 1, 1, 1,
0.710527, -1.005135, 1.169316, 1, 1, 1, 1, 1,
0.7126592, 0.6188965, 2.434027, 1, 1, 1, 1, 1,
0.7253047, -0.5862589, 2.895627, 1, 1, 1, 1, 1,
0.7255391, 0.0717676, 1.753833, 1, 1, 1, 1, 1,
0.7255919, -1.664891, 2.391074, 1, 1, 1, 1, 1,
0.7270017, -0.1705901, 1.866277, 1, 1, 1, 1, 1,
0.7293639, 0.0065836, 0.9852198, 1, 1, 1, 1, 1,
0.7309079, 0.3825859, 1.928714, 1, 1, 1, 1, 1,
0.7331352, -0.345249, 1.567008, 1, 1, 1, 1, 1,
0.7372171, 0.09286218, -0.6507945, 1, 1, 1, 1, 1,
0.7434154, 1.371042, 1.655651, 1, 1, 1, 1, 1,
0.7497236, 1.162585, 1.777527, 1, 1, 1, 1, 1,
0.7521763, 1.546069, 1.602101, 1, 1, 1, 1, 1,
0.7531082, -0.2303559, 0.08027793, 0, 0, 1, 1, 1,
0.7554081, 0.9444784, 0.3989456, 1, 0, 0, 1, 1,
0.7554355, 0.8579756, 0.8507358, 1, 0, 0, 1, 1,
0.7557998, 0.9512506, 0.780365, 1, 0, 0, 1, 1,
0.7606937, -1.290501, 1.729151, 1, 0, 0, 1, 1,
0.7610719, 0.2895557, 0.3059087, 1, 0, 0, 1, 1,
0.7660281, -0.7633247, 1.747845, 0, 0, 0, 1, 1,
0.7702867, 0.7729875, 0.7032714, 0, 0, 0, 1, 1,
0.7736601, -1.821638, 4.092155, 0, 0, 0, 1, 1,
0.7740232, 0.173316, 1.830331, 0, 0, 0, 1, 1,
0.784889, 0.03318238, 2.789882, 0, 0, 0, 1, 1,
0.7878892, 1.934912, -0.7297725, 0, 0, 0, 1, 1,
0.7894417, -0.01250933, 1.511334, 0, 0, 0, 1, 1,
0.7900789, -1.719095, 2.962626, 1, 1, 1, 1, 1,
0.7931442, -1.995751, 1.626492, 1, 1, 1, 1, 1,
0.795767, -0.6290418, 3.094138, 1, 1, 1, 1, 1,
0.7979804, 0.2575386, 1.103173, 1, 1, 1, 1, 1,
0.8076563, 1.502679, -0.8884841, 1, 1, 1, 1, 1,
0.8078089, -0.4297813, 1.444867, 1, 1, 1, 1, 1,
0.8108186, 0.09976443, 1.303809, 1, 1, 1, 1, 1,
0.8137438, 0.364558, 2.079367, 1, 1, 1, 1, 1,
0.8253692, -0.9522467, 2.686767, 1, 1, 1, 1, 1,
0.8270192, -1.09197, 3.464309, 1, 1, 1, 1, 1,
0.8302541, -0.3135924, 2.755067, 1, 1, 1, 1, 1,
0.8330988, 2.516779, -0.4589244, 1, 1, 1, 1, 1,
0.8366027, 0.003102615, 1.983075, 1, 1, 1, 1, 1,
0.8470982, 1.072386, 0.4704215, 1, 1, 1, 1, 1,
0.8495297, 0.6451831, 1.343856, 1, 1, 1, 1, 1,
0.8498955, 2.065917, 1.056518, 0, 0, 1, 1, 1,
0.8559114, 0.806647, 0.4219538, 1, 0, 0, 1, 1,
0.8564855, -0.7314944, 1.751032, 1, 0, 0, 1, 1,
0.8594775, -0.05949328, 0.860666, 1, 0, 0, 1, 1,
0.8607654, -0.2671445, 0.5933941, 1, 0, 0, 1, 1,
0.8614118, 0.2162284, 1.620876, 1, 0, 0, 1, 1,
0.8632661, -0.09802914, 3.025967, 0, 0, 0, 1, 1,
0.8637118, 0.4955395, 1.252384, 0, 0, 0, 1, 1,
0.8883282, -0.01111336, 3.966473, 0, 0, 0, 1, 1,
0.8885508, 0.2821972, 3.450047, 0, 0, 0, 1, 1,
0.895596, 0.1676475, 1.537605, 0, 0, 0, 1, 1,
0.8958719, -1.244948, 2.803427, 0, 0, 0, 1, 1,
0.9014254, -0.07557978, 0.2807886, 0, 0, 0, 1, 1,
0.9034399, -0.4145356, 1.495469, 1, 1, 1, 1, 1,
0.9043404, 0.04351912, 2.147471, 1, 1, 1, 1, 1,
0.9085428, -0.4240979, 0.8433515, 1, 1, 1, 1, 1,
0.9103728, 0.4271002, 0.5140704, 1, 1, 1, 1, 1,
0.9200864, 1.307653, 2.903528, 1, 1, 1, 1, 1,
0.9212236, 1.61704, 1.346768, 1, 1, 1, 1, 1,
0.9233988, 0.8990786, 0.6786103, 1, 1, 1, 1, 1,
0.9266581, 0.0916829, 0.7789583, 1, 1, 1, 1, 1,
0.9270533, -0.3594278, 2.039276, 1, 1, 1, 1, 1,
0.9301645, -0.7391375, 3.462983, 1, 1, 1, 1, 1,
0.9338117, 0.1416707, 1.779553, 1, 1, 1, 1, 1,
0.943975, -1.56097, 5.627158, 1, 1, 1, 1, 1,
0.9444888, 0.6924851, 2.30127, 1, 1, 1, 1, 1,
0.9485419, -0.2902047, 2.791742, 1, 1, 1, 1, 1,
0.9554309, 2.260356, -0.2867168, 1, 1, 1, 1, 1,
0.9572417, 0.4959762, 2.567084, 0, 0, 1, 1, 1,
0.9598088, -1.84747, 1.269919, 1, 0, 0, 1, 1,
0.9640972, 0.05739876, 3.672917, 1, 0, 0, 1, 1,
0.9665909, 0.6179428, 0.626825, 1, 0, 0, 1, 1,
0.9669235, -2.190684, 1.464366, 1, 0, 0, 1, 1,
0.9786883, 0.1343606, 1.361827, 1, 0, 0, 1, 1,
0.9857807, -0.1093105, 2.030959, 0, 0, 0, 1, 1,
0.9895586, -0.4799328, 0.5988572, 0, 0, 0, 1, 1,
0.9913157, 0.06218499, 2.361243, 0, 0, 0, 1, 1,
0.9980181, -0.02658271, 1.762771, 0, 0, 0, 1, 1,
1.010253, -0.8627337, 2.592436, 0, 0, 0, 1, 1,
1.013567, 1.973573, -0.8456591, 0, 0, 0, 1, 1,
1.031141, -0.7917192, 1.161998, 0, 0, 0, 1, 1,
1.036569, -0.4208495, 0.8784647, 1, 1, 1, 1, 1,
1.041142, -1.611485, 2.668746, 1, 1, 1, 1, 1,
1.047234, -1.50662, 3.045485, 1, 1, 1, 1, 1,
1.047908, 0.3033272, 1.837915, 1, 1, 1, 1, 1,
1.051124, -0.3433969, 2.905841, 1, 1, 1, 1, 1,
1.05468, -1.284031, 3.217402, 1, 1, 1, 1, 1,
1.056088, 1.082467, 0.5272859, 1, 1, 1, 1, 1,
1.058106, 1.539712, 1.757084, 1, 1, 1, 1, 1,
1.059508, -0.1584581, 1.604606, 1, 1, 1, 1, 1,
1.0632, -1.00091, 3.086251, 1, 1, 1, 1, 1,
1.067422, -0.238906, 1.667949, 1, 1, 1, 1, 1,
1.068928, 0.5398915, -0.2946795, 1, 1, 1, 1, 1,
1.069271, 1.054068, 1.574178, 1, 1, 1, 1, 1,
1.072412, 0.7927104, 0.9089137, 1, 1, 1, 1, 1,
1.073177, 0.7850522, 0.5485507, 1, 1, 1, 1, 1,
1.075836, 0.3017965, 2.160248, 0, 0, 1, 1, 1,
1.084043, -1.083603, 2.042883, 1, 0, 0, 1, 1,
1.08928, 1.351353, 1.48815, 1, 0, 0, 1, 1,
1.090212, -0.5805351, 2.766423, 1, 0, 0, 1, 1,
1.095184, 0.2636226, 0.2461009, 1, 0, 0, 1, 1,
1.098587, 0.4318033, 0.8109457, 1, 0, 0, 1, 1,
1.103476, 0.5058854, 2.215956, 0, 0, 0, 1, 1,
1.108722, 0.169439, 1.537092, 0, 0, 0, 1, 1,
1.115954, -0.1046363, 3.942286, 0, 0, 0, 1, 1,
1.116811, -0.7880329, 0.9264817, 0, 0, 0, 1, 1,
1.11997, -0.2487669, 2.260171, 0, 0, 0, 1, 1,
1.122484, 0.938868, -0.1330927, 0, 0, 0, 1, 1,
1.125536, 0.104796, 2.225567, 0, 0, 0, 1, 1,
1.128453, 0.7407919, -0.1618381, 1, 1, 1, 1, 1,
1.1323, 0.7539413, 1.537727, 1, 1, 1, 1, 1,
1.138495, 0.5491948, 1.776884, 1, 1, 1, 1, 1,
1.145366, 1.077385, 0.2843143, 1, 1, 1, 1, 1,
1.145433, -0.4628404, 1.110206, 1, 1, 1, 1, 1,
1.147177, -0.91378, -0.2213363, 1, 1, 1, 1, 1,
1.150411, -0.7230172, 3.385286, 1, 1, 1, 1, 1,
1.152704, 0.8953424, 0.4599252, 1, 1, 1, 1, 1,
1.158883, 1.74641, 0.9752056, 1, 1, 1, 1, 1,
1.164619, 1.285296, -0.6443065, 1, 1, 1, 1, 1,
1.168664, 1.053033, -0.3308415, 1, 1, 1, 1, 1,
1.171423, -0.5599639, 1.712978, 1, 1, 1, 1, 1,
1.172448, -0.5350356, 2.399473, 1, 1, 1, 1, 1,
1.17293, -0.1842047, 1.943756, 1, 1, 1, 1, 1,
1.190719, -0.26976, 2.253682, 1, 1, 1, 1, 1,
1.195005, 1.962242, -1.325234, 0, 0, 1, 1, 1,
1.19969, 0.0271191, 1.26609, 1, 0, 0, 1, 1,
1.200142, 0.4538129, 0.9174526, 1, 0, 0, 1, 1,
1.207164, 1.642876, 1.671817, 1, 0, 0, 1, 1,
1.210695, -0.5794618, 2.658395, 1, 0, 0, 1, 1,
1.213357, 0.1221745, 2.482448, 1, 0, 0, 1, 1,
1.217968, 0.5600779, 1.107217, 0, 0, 0, 1, 1,
1.218604, -0.8487918, 1.626786, 0, 0, 0, 1, 1,
1.22417, 0.09650784, 1.502951, 0, 0, 0, 1, 1,
1.226954, -0.7243242, 2.039402, 0, 0, 0, 1, 1,
1.23692, -0.05199445, 3.264467, 0, 0, 0, 1, 1,
1.244559, -0.2425707, 1.870168, 0, 0, 0, 1, 1,
1.24756, 0.655804, -2.227987, 0, 0, 0, 1, 1,
1.252037, -0.6986312, 3.682123, 1, 1, 1, 1, 1,
1.26058, -1.716672, 2.582111, 1, 1, 1, 1, 1,
1.26146, 0.4362709, 1.648953, 1, 1, 1, 1, 1,
1.263956, 0.3737424, 2.284755, 1, 1, 1, 1, 1,
1.265218, -2.018015, 2.405421, 1, 1, 1, 1, 1,
1.271368, -1.047889, 4.212808, 1, 1, 1, 1, 1,
1.285213, 0.4257686, 2.986699, 1, 1, 1, 1, 1,
1.29553, 1.161798, 0.5443218, 1, 1, 1, 1, 1,
1.305332, -1.779568, 2.582337, 1, 1, 1, 1, 1,
1.314434, -0.4305467, 3.848258, 1, 1, 1, 1, 1,
1.315168, 1.18965, 2.081508, 1, 1, 1, 1, 1,
1.317686, 0.5796682, -0.8299497, 1, 1, 1, 1, 1,
1.325748, 0.3685974, 1.55565, 1, 1, 1, 1, 1,
1.328992, -1.113583, 1.22106, 1, 1, 1, 1, 1,
1.334279, -1.005964, 4.592058, 1, 1, 1, 1, 1,
1.3344, 0.3939427, 0.5003735, 0, 0, 1, 1, 1,
1.334904, -2.187319, 1.85534, 1, 0, 0, 1, 1,
1.354088, 0.6551124, 0.01426295, 1, 0, 0, 1, 1,
1.360497, 0.1429698, 0.8669771, 1, 0, 0, 1, 1,
1.388649, 0.1541281, 2.148437, 1, 0, 0, 1, 1,
1.399194, -1.491225, 1.768092, 1, 0, 0, 1, 1,
1.400184, 0.3600297, 2.378191, 0, 0, 0, 1, 1,
1.402102, 0.09217512, 1.167925, 0, 0, 0, 1, 1,
1.412035, -1.397766, 2.003809, 0, 0, 0, 1, 1,
1.420886, -0.816011, 2.335609, 0, 0, 0, 1, 1,
1.43466, 0.2976651, 0.515842, 0, 0, 0, 1, 1,
1.440591, -0.3027038, 2.288106, 0, 0, 0, 1, 1,
1.442962, 1.570979, 2.786384, 0, 0, 0, 1, 1,
1.445685, 0.01203956, 2.623605, 1, 1, 1, 1, 1,
1.458346, -0.3848021, 2.556001, 1, 1, 1, 1, 1,
1.460251, -0.670585, 4.448096, 1, 1, 1, 1, 1,
1.497159, 0.5488124, 0.8455104, 1, 1, 1, 1, 1,
1.500262, -0.6322798, 3.675276, 1, 1, 1, 1, 1,
1.502027, -1.42794, 2.507385, 1, 1, 1, 1, 1,
1.511287, 0.0342235, 2.050723, 1, 1, 1, 1, 1,
1.512972, -1.099211, 1.555553, 1, 1, 1, 1, 1,
1.523018, 0.7029933, 1.479786, 1, 1, 1, 1, 1,
1.533353, 0.5852628, 0.03974793, 1, 1, 1, 1, 1,
1.550194, -0.9126443, 0.3515421, 1, 1, 1, 1, 1,
1.570407, -1.176849, 1.67813, 1, 1, 1, 1, 1,
1.574829, 0.2421347, 3.037854, 1, 1, 1, 1, 1,
1.589251, -0.06984493, 2.941299, 1, 1, 1, 1, 1,
1.603197, 0.6919925, 1.198464, 1, 1, 1, 1, 1,
1.637341, -0.03155397, 0.8731254, 0, 0, 1, 1, 1,
1.641244, -0.4871714, 3.959701, 1, 0, 0, 1, 1,
1.648967, -0.879547, 3.690408, 1, 0, 0, 1, 1,
1.657267, -1.466245, 2.690271, 1, 0, 0, 1, 1,
1.664164, 0.3478518, 2.472348, 1, 0, 0, 1, 1,
1.664957, -0.6457759, 3.967604, 1, 0, 0, 1, 1,
1.671635, 0.1359323, 1.021507, 0, 0, 0, 1, 1,
1.689315, 0.7931386, 1.504462, 0, 0, 0, 1, 1,
1.697606, 1.89861, 0.4117782, 0, 0, 0, 1, 1,
1.707925, -0.0387293, 2.018406, 0, 0, 0, 1, 1,
1.721696, -0.3299018, 1.17932, 0, 0, 0, 1, 1,
1.726487, -1.11662, 3.792756, 0, 0, 0, 1, 1,
1.74222, 2.100124, 0.1739665, 0, 0, 0, 1, 1,
1.751687, -0.8088735, 1.761508, 1, 1, 1, 1, 1,
1.759338, -0.9165524, 3.736628, 1, 1, 1, 1, 1,
1.78178, 0.07472983, 0.9899239, 1, 1, 1, 1, 1,
1.784766, 0.3710778, 0.9209687, 1, 1, 1, 1, 1,
1.792189, -0.2190851, 0.8634141, 1, 1, 1, 1, 1,
1.801352, 0.3789633, 1.585131, 1, 1, 1, 1, 1,
1.809076, -0.001074214, 3.583572, 1, 1, 1, 1, 1,
1.815222, 1.430062, 1.625595, 1, 1, 1, 1, 1,
1.842874, 1.714644, 0.5406114, 1, 1, 1, 1, 1,
1.846271, -0.3498598, 1.100097, 1, 1, 1, 1, 1,
1.858566, 1.254519, 1.087551, 1, 1, 1, 1, 1,
1.859951, -0.613242, 0.5412714, 1, 1, 1, 1, 1,
1.879468, 0.7853042, 0.5872533, 1, 1, 1, 1, 1,
1.893024, -0.1595135, 0.00782753, 1, 1, 1, 1, 1,
1.918857, -0.340362, 1.873129, 1, 1, 1, 1, 1,
1.932351, -0.7785397, 2.251014, 0, 0, 1, 1, 1,
1.955262, -1.974145, 3.632805, 1, 0, 0, 1, 1,
1.961725, 0.4666978, 2.129688, 1, 0, 0, 1, 1,
1.966459, 1.156708, 0.906855, 1, 0, 0, 1, 1,
1.998505, 0.5100663, -0.2779622, 1, 0, 0, 1, 1,
2.017582, -0.4259765, 3.346983, 1, 0, 0, 1, 1,
2.056893, 1.218805, 1.444421, 0, 0, 0, 1, 1,
2.172697, 0.1422006, 0.1463111, 0, 0, 0, 1, 1,
2.25976, -1.788598, 1.086534, 0, 0, 0, 1, 1,
2.290364, 0.310755, 1.706743, 0, 0, 0, 1, 1,
2.321737, 1.590881, 3.77982, 0, 0, 0, 1, 1,
2.364255, -1.00362, 3.446683, 0, 0, 0, 1, 1,
2.378256, 2.077078, 0.08686677, 0, 0, 0, 1, 1,
2.388462, 0.2600908, 1.976313, 1, 1, 1, 1, 1,
2.700751, 0.7318556, 4.667442, 1, 1, 1, 1, 1,
2.899679, -0.2951641, 1.759931, 1, 1, 1, 1, 1,
2.977772, 0.5156729, 1.938939, 1, 1, 1, 1, 1,
3.235084, -0.8663036, 2.805011, 1, 1, 1, 1, 1,
3.367952, 1.57914, 0.4489801, 1, 1, 1, 1, 1,
3.417145, -1.066295, 3.490382, 1, 1, 1, 1, 1
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
var radius = 9.881736;
var distance = 34.70918;
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
mvMatrix.translate( -0.1772399, 0.02322137, 0.2056634 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.70918);
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