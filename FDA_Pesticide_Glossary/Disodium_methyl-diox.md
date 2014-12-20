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
-3.584115, 1.27032, 0.4768299, 1, 0, 0, 1,
-3.358651, 0.1324775, -1.655358, 1, 0.007843138, 0, 1,
-3.229024, 1.640103, -0.8200908, 1, 0.01176471, 0, 1,
-2.931479, -0.9786683, -1.344828, 1, 0.01960784, 0, 1,
-2.806318, -0.7082291, -2.071791, 1, 0.02352941, 0, 1,
-2.721431, 0.2918289, -0.5133188, 1, 0.03137255, 0, 1,
-2.581118, 0.6541988, -1.061877, 1, 0.03529412, 0, 1,
-2.551838, 0.7140958, -0.4674253, 1, 0.04313726, 0, 1,
-2.494358, -0.1539433, -1.719777, 1, 0.04705882, 0, 1,
-2.417124, 0.7538979, -3.674928, 1, 0.05490196, 0, 1,
-2.328721, -0.2410897, -3.371808, 1, 0.05882353, 0, 1,
-2.313895, -1.869328, -2.879122, 1, 0.06666667, 0, 1,
-2.312786, -2.431064, -1.682652, 1, 0.07058824, 0, 1,
-2.311984, -0.1315934, -2.489069, 1, 0.07843138, 0, 1,
-2.295831, 0.5816238, -1.50179, 1, 0.08235294, 0, 1,
-2.283706, -1.350989, -1.782581, 1, 0.09019608, 0, 1,
-2.215218, 0.4515236, -1.197401, 1, 0.09411765, 0, 1,
-2.180865, -0.2049923, -2.090481, 1, 0.1019608, 0, 1,
-2.142159, -1.465541, -1.312533, 1, 0.1098039, 0, 1,
-2.122484, -0.705, -2.665093, 1, 0.1137255, 0, 1,
-2.118395, 0.7252378, -0.4093564, 1, 0.1215686, 0, 1,
-2.116625, 0.5327647, 0.1201041, 1, 0.1254902, 0, 1,
-2.069424, 1.304191, 1.814133, 1, 0.1333333, 0, 1,
-2.012825, 1.319724, -0.9663275, 1, 0.1372549, 0, 1,
-1.977403, 0.6957868, -1.984136, 1, 0.145098, 0, 1,
-1.974869, 1.639841, 1.071476, 1, 0.1490196, 0, 1,
-1.912765, -1.103944, 1.391671, 1, 0.1568628, 0, 1,
-1.883368, -0.6160004, -0.602903, 1, 0.1607843, 0, 1,
-1.874203, -0.4031329, -1.234839, 1, 0.1686275, 0, 1,
-1.872509, -0.9081314, -2.190443, 1, 0.172549, 0, 1,
-1.842944, -0.8532091, -0.5351376, 1, 0.1803922, 0, 1,
-1.816986, 0.8273195, -1.555317, 1, 0.1843137, 0, 1,
-1.762067, 1.103384, -1.098504, 1, 0.1921569, 0, 1,
-1.752119, -0.08259451, -2.597557, 1, 0.1960784, 0, 1,
-1.712895, 1.844804, -0.4564214, 1, 0.2039216, 0, 1,
-1.687046, -0.07945681, -0.6924979, 1, 0.2117647, 0, 1,
-1.683867, 0.3199942, -2.189342, 1, 0.2156863, 0, 1,
-1.656356, -0.5871589, -1.145857, 1, 0.2235294, 0, 1,
-1.647168, 0.5606653, -4.308886, 1, 0.227451, 0, 1,
-1.647098, 0.320853, -0.6846517, 1, 0.2352941, 0, 1,
-1.640101, 0.5225136, -1.496907, 1, 0.2392157, 0, 1,
-1.636221, 0.107678, -0.1596887, 1, 0.2470588, 0, 1,
-1.632928, -0.7868518, -1.573339, 1, 0.2509804, 0, 1,
-1.631402, 0.7125439, -1.575077, 1, 0.2588235, 0, 1,
-1.626805, -0.7092499, -1.163706, 1, 0.2627451, 0, 1,
-1.613176, 0.6049264, -1.446167, 1, 0.2705882, 0, 1,
-1.599172, 1.070606, -1.013863, 1, 0.2745098, 0, 1,
-1.567917, 0.9521696, 0.1389343, 1, 0.282353, 0, 1,
-1.566281, 0.7050059, -2.152842, 1, 0.2862745, 0, 1,
-1.563697, 0.5092971, -1.170602, 1, 0.2941177, 0, 1,
-1.541455, 0.935098, -0.1087763, 1, 0.3019608, 0, 1,
-1.53315, 0.9639024, -1.483657, 1, 0.3058824, 0, 1,
-1.526062, 0.6764159, -1.262223, 1, 0.3137255, 0, 1,
-1.517178, 0.1351599, -3.295504, 1, 0.3176471, 0, 1,
-1.513867, -0.1095751, -3.43235, 1, 0.3254902, 0, 1,
-1.511038, 0.2635738, -1.076915, 1, 0.3294118, 0, 1,
-1.506748, -0.9112937, -3.036845, 1, 0.3372549, 0, 1,
-1.501053, -1.046164, -4.257381, 1, 0.3411765, 0, 1,
-1.496258, -0.3117332, -1.883778, 1, 0.3490196, 0, 1,
-1.489857, 0.3856049, -1.803275, 1, 0.3529412, 0, 1,
-1.487462, -1.411455, -1.91016, 1, 0.3607843, 0, 1,
-1.462794, -0.7101284, -1.159566, 1, 0.3647059, 0, 1,
-1.458144, -0.5116786, -2.942163, 1, 0.372549, 0, 1,
-1.457642, 0.2579922, -0.6810892, 1, 0.3764706, 0, 1,
-1.453794, -0.2215307, -2.229217, 1, 0.3843137, 0, 1,
-1.437294, -0.01147968, -1.19987, 1, 0.3882353, 0, 1,
-1.428162, 0.5901182, -1.197783, 1, 0.3960784, 0, 1,
-1.4101, -2.538244, -1.277749, 1, 0.4039216, 0, 1,
-1.393173, 0.494534, -0.8808627, 1, 0.4078431, 0, 1,
-1.393066, 1.031515, -1.28064, 1, 0.4156863, 0, 1,
-1.392968, 0.6613711, -1.609526, 1, 0.4196078, 0, 1,
-1.3862, 0.3843322, 0.186768, 1, 0.427451, 0, 1,
-1.384005, -0.06552061, -1.080017, 1, 0.4313726, 0, 1,
-1.379917, 0.2763237, -2.057084, 1, 0.4392157, 0, 1,
-1.379629, -1.780201, -2.410386, 1, 0.4431373, 0, 1,
-1.377875, 0.005512188, 0.07425937, 1, 0.4509804, 0, 1,
-1.376895, 0.07081477, -2.074219, 1, 0.454902, 0, 1,
-1.37462, 0.6870272, -1.559875, 1, 0.4627451, 0, 1,
-1.370095, -1.789213, -1.725935, 1, 0.4666667, 0, 1,
-1.338017, -0.593551, -2.798447, 1, 0.4745098, 0, 1,
-1.33152, 0.4555734, 0.5258169, 1, 0.4784314, 0, 1,
-1.325312, 0.4368019, -1.156594, 1, 0.4862745, 0, 1,
-1.307174, -0.5618567, -1.81996, 1, 0.4901961, 0, 1,
-1.306256, -2.827267, -2.174558, 1, 0.4980392, 0, 1,
-1.284091, 0.3157213, 0.4952329, 1, 0.5058824, 0, 1,
-1.279548, 1.47984, -0.7090486, 1, 0.509804, 0, 1,
-1.273597, -1.258912, -3.428619, 1, 0.5176471, 0, 1,
-1.272324, -0.01390346, -0.7260507, 1, 0.5215687, 0, 1,
-1.270041, -2.303631, -2.336594, 1, 0.5294118, 0, 1,
-1.269016, 1.383815, -0.6982344, 1, 0.5333334, 0, 1,
-1.264365, 1.304054, 1.023816, 1, 0.5411765, 0, 1,
-1.26144, 1.069717, 0.5629526, 1, 0.5450981, 0, 1,
-1.261114, -0.4649807, -2.476193, 1, 0.5529412, 0, 1,
-1.256929, 0.1883566, -1.748909, 1, 0.5568628, 0, 1,
-1.254001, 1.598949, -0.6370597, 1, 0.5647059, 0, 1,
-1.252089, 1.295689, 1.122577, 1, 0.5686275, 0, 1,
-1.245225, -0.227961, -2.13769, 1, 0.5764706, 0, 1,
-1.244115, 0.9066438, 0.5964379, 1, 0.5803922, 0, 1,
-1.235869, -0.5516002, -1.515544, 1, 0.5882353, 0, 1,
-1.23463, 1.418773, -2.177969, 1, 0.5921569, 0, 1,
-1.220525, -0.8993151, -3.537213, 1, 0.6, 0, 1,
-1.218516, 0.2696681, -2.840039, 1, 0.6078432, 0, 1,
-1.211578, -1.367005, -2.977603, 1, 0.6117647, 0, 1,
-1.18942, -0.2366592, -2.999038, 1, 0.6196079, 0, 1,
-1.187614, 1.479131, -0.04525352, 1, 0.6235294, 0, 1,
-1.169408, -0.2789014, -1.679055, 1, 0.6313726, 0, 1,
-1.162182, 1.662894, -2.07128, 1, 0.6352941, 0, 1,
-1.159616, 1.777109, 0.6012143, 1, 0.6431373, 0, 1,
-1.155249, -0.8691875, -1.659401, 1, 0.6470588, 0, 1,
-1.153995, -0.3780149, -1.61192, 1, 0.654902, 0, 1,
-1.140762, -0.7046453, -3.12437, 1, 0.6588235, 0, 1,
-1.135324, 1.839715, -0.7225344, 1, 0.6666667, 0, 1,
-1.13428, 1.587034, -1.482661, 1, 0.6705883, 0, 1,
-1.132114, 1.335403, -0.3748799, 1, 0.6784314, 0, 1,
-1.131887, 0.2948532, -1.43293, 1, 0.682353, 0, 1,
-1.131878, 1.080599, 0.5982388, 1, 0.6901961, 0, 1,
-1.128992, -0.4899088, -2.181811, 1, 0.6941177, 0, 1,
-1.127798, 2.633213, -0.03192714, 1, 0.7019608, 0, 1,
-1.114286, -0.6733353, -4.089577, 1, 0.7098039, 0, 1,
-1.110292, -0.5503657, -2.649171, 1, 0.7137255, 0, 1,
-1.109351, -0.3023362, -3.066686, 1, 0.7215686, 0, 1,
-1.109199, -1.19243, -3.52604, 1, 0.7254902, 0, 1,
-1.105902, -1.297865, -2.546216, 1, 0.7333333, 0, 1,
-1.101063, -0.7523088, -3.68491, 1, 0.7372549, 0, 1,
-1.095603, 1.23716, -1.499411, 1, 0.7450981, 0, 1,
-1.095305, -1.355958, -1.169219, 1, 0.7490196, 0, 1,
-1.089605, -0.9287401, -0.6744275, 1, 0.7568628, 0, 1,
-1.088799, -1.710659, -2.897191, 1, 0.7607843, 0, 1,
-1.086179, -0.3718884, -1.025413, 1, 0.7686275, 0, 1,
-1.083804, -0.4207847, -1.485596, 1, 0.772549, 0, 1,
-1.078264, -0.08100092, -3.64149, 1, 0.7803922, 0, 1,
-1.073803, -1.816823, -1.990025, 1, 0.7843137, 0, 1,
-1.068426, -0.3224293, -1.58181, 1, 0.7921569, 0, 1,
-1.064452, 0.7109445, -1.462171, 1, 0.7960784, 0, 1,
-1.062247, 1.216774, -0.8757184, 1, 0.8039216, 0, 1,
-1.061011, -0.1186418, -0.9223936, 1, 0.8117647, 0, 1,
-1.05302, -0.122461, -0.9371195, 1, 0.8156863, 0, 1,
-1.052207, -0.001103202, -1.012902, 1, 0.8235294, 0, 1,
-1.052014, -2.288323, -2.911943, 1, 0.827451, 0, 1,
-1.034358, 0.5707208, -1.299359, 1, 0.8352941, 0, 1,
-1.030909, 1.496283, 0.7313249, 1, 0.8392157, 0, 1,
-1.029287, 0.5441015, -2.684108, 1, 0.8470588, 0, 1,
-1.028544, -1.001778, -2.13934, 1, 0.8509804, 0, 1,
-1.026692, -0.4687687, -1.9225, 1, 0.8588235, 0, 1,
-1.025627, -0.8362098, -0.5800713, 1, 0.8627451, 0, 1,
-1.024034, 0.5318434, -0.4806121, 1, 0.8705882, 0, 1,
-1.023705, 0.3099621, -0.8881329, 1, 0.8745098, 0, 1,
-1.020224, -0.01514283, 0.2194438, 1, 0.8823529, 0, 1,
-1.010452, -1.03706, -0.8124944, 1, 0.8862745, 0, 1,
-1.003402, 0.5568919, -2.38772, 1, 0.8941177, 0, 1,
-1.000929, 1.47865, -1.300166, 1, 0.8980392, 0, 1,
-1.000017, 0.5647027, 0.5883037, 1, 0.9058824, 0, 1,
-0.9976248, -0.5055733, -2.264538, 1, 0.9137255, 0, 1,
-0.9925122, -0.2969634, -2.898116, 1, 0.9176471, 0, 1,
-0.9922805, 0.4965134, -1.444483, 1, 0.9254902, 0, 1,
-0.9918442, 0.3630459, -0.8843268, 1, 0.9294118, 0, 1,
-0.9916739, -1.446403, -2.317456, 1, 0.9372549, 0, 1,
-0.9914989, -1.616749, -2.092656, 1, 0.9411765, 0, 1,
-0.9905316, -0.9316648, -2.151005, 1, 0.9490196, 0, 1,
-0.9841232, -0.2359997, -1.104822, 1, 0.9529412, 0, 1,
-0.9837641, 0.2479455, -0.3054508, 1, 0.9607843, 0, 1,
-0.9815891, -0.343918, -2.528952, 1, 0.9647059, 0, 1,
-0.9768552, -0.1121664, -0.6886497, 1, 0.972549, 0, 1,
-0.9711639, -0.6848539, -2.216628, 1, 0.9764706, 0, 1,
-0.9694296, -0.7871899, -1.800974, 1, 0.9843137, 0, 1,
-0.9683114, 0.4811296, -0.4334611, 1, 0.9882353, 0, 1,
-0.9679, -1.040483, -2.078576, 1, 0.9960784, 0, 1,
-0.9622251, -0.08607241, -1.015599, 0.9960784, 1, 0, 1,
-0.9575656, 0.8558578, -1.251154, 0.9921569, 1, 0, 1,
-0.9508297, -1.892826, -3.526571, 0.9843137, 1, 0, 1,
-0.9484466, -1.258281, -3.935475, 0.9803922, 1, 0, 1,
-0.9449366, 0.5356381, 0.04745519, 0.972549, 1, 0, 1,
-0.9420773, -0.3765669, -2.442615, 0.9686275, 1, 0, 1,
-0.9419326, -0.0430237, -2.080122, 0.9607843, 1, 0, 1,
-0.9341631, 2.3129, -0.2112835, 0.9568627, 1, 0, 1,
-0.9331898, 0.2760099, -2.771303, 0.9490196, 1, 0, 1,
-0.9328143, -0.6530549, -3.069703, 0.945098, 1, 0, 1,
-0.9272985, -1.20837, -1.86011, 0.9372549, 1, 0, 1,
-0.9219545, 2.407187, 0.04010516, 0.9333333, 1, 0, 1,
-0.9187222, -2.16252, -2.22885, 0.9254902, 1, 0, 1,
-0.9176015, -0.4746905, -0.100942, 0.9215686, 1, 0, 1,
-0.9159689, 0.05906152, -1.253045, 0.9137255, 1, 0, 1,
-0.9142434, 1.274795, -1.731879, 0.9098039, 1, 0, 1,
-0.9130995, 0.8375589, 1.863503, 0.9019608, 1, 0, 1,
-0.9103977, -0.7275742, -2.52016, 0.8941177, 1, 0, 1,
-0.9083732, 0.7579738, -1.061334, 0.8901961, 1, 0, 1,
-0.9065242, 0.8331609, -0.8465034, 0.8823529, 1, 0, 1,
-0.9037543, -1.152423, -3.376311, 0.8784314, 1, 0, 1,
-0.9024406, -0.701219, -1.016308, 0.8705882, 1, 0, 1,
-0.9020138, -0.7527258, -2.247496, 0.8666667, 1, 0, 1,
-0.8967294, -0.7783552, -2.14761, 0.8588235, 1, 0, 1,
-0.8919092, 0.7395317, -0.4907265, 0.854902, 1, 0, 1,
-0.8909217, -1.017112, -2.918138, 0.8470588, 1, 0, 1,
-0.8831665, -0.7296374, -1.6631, 0.8431373, 1, 0, 1,
-0.8803855, 2.400585, 0.09324415, 0.8352941, 1, 0, 1,
-0.8758401, 1.654956, -0.1920428, 0.8313726, 1, 0, 1,
-0.8685966, -0.1974391, -0.8656632, 0.8235294, 1, 0, 1,
-0.8676448, -0.4925726, -2.09542, 0.8196079, 1, 0, 1,
-0.8654377, 0.3466172, -1.100721, 0.8117647, 1, 0, 1,
-0.8573205, 0.2798474, -1.132077, 0.8078431, 1, 0, 1,
-0.8375291, 0.08065132, 1.123386, 0.8, 1, 0, 1,
-0.8373868, 0.381155, -2.295951, 0.7921569, 1, 0, 1,
-0.8314416, -1.273351, -0.7350182, 0.7882353, 1, 0, 1,
-0.8286604, -1.43622, -2.461707, 0.7803922, 1, 0, 1,
-0.827063, 0.3872753, -1.680765, 0.7764706, 1, 0, 1,
-0.8232332, 1.071297, -1.589524, 0.7686275, 1, 0, 1,
-0.8216947, -0.3203256, -1.679725, 0.7647059, 1, 0, 1,
-0.8187836, 0.09339359, 0.1157236, 0.7568628, 1, 0, 1,
-0.8162181, -0.8248209, -0.7790232, 0.7529412, 1, 0, 1,
-0.8158838, 0.7443672, -1.647127, 0.7450981, 1, 0, 1,
-0.8149943, 0.1080709, -1.041137, 0.7411765, 1, 0, 1,
-0.8138404, 0.8541404, -3.775265, 0.7333333, 1, 0, 1,
-0.8088605, 1.236367, -0.5764591, 0.7294118, 1, 0, 1,
-0.7983929, 0.9691902, 0.935128, 0.7215686, 1, 0, 1,
-0.7927544, -0.4988202, -0.3911375, 0.7176471, 1, 0, 1,
-0.7859948, 0.273622, -1.751486, 0.7098039, 1, 0, 1,
-0.7835062, 0.4529336, 0.7333392, 0.7058824, 1, 0, 1,
-0.7820714, 0.9109295, -1.482236, 0.6980392, 1, 0, 1,
-0.7806014, -0.2412024, -2.223364, 0.6901961, 1, 0, 1,
-0.7738711, -0.9288475, -1.149891, 0.6862745, 1, 0, 1,
-0.7736608, 0.003399314, -1.797257, 0.6784314, 1, 0, 1,
-0.7723453, 1.137097, 0.2151168, 0.6745098, 1, 0, 1,
-0.7712954, 0.4823858, -2.804237, 0.6666667, 1, 0, 1,
-0.7707224, 0.1919761, -2.63376, 0.6627451, 1, 0, 1,
-0.7679784, -0.09161212, -1.167372, 0.654902, 1, 0, 1,
-0.7651361, 1.591333, -2.594337, 0.6509804, 1, 0, 1,
-0.7630163, 0.05955349, -3.73154, 0.6431373, 1, 0, 1,
-0.7480534, -0.5150786, -0.1043641, 0.6392157, 1, 0, 1,
-0.7447549, 1.964663, -0.08711108, 0.6313726, 1, 0, 1,
-0.74422, 0.4032433, 0.05473045, 0.627451, 1, 0, 1,
-0.7418849, -0.5231014, -3.106998, 0.6196079, 1, 0, 1,
-0.7322786, 1.556947, -1.149596, 0.6156863, 1, 0, 1,
-0.7291293, -2.263954, -2.864714, 0.6078432, 1, 0, 1,
-0.725715, -0.6369432, -1.825056, 0.6039216, 1, 0, 1,
-0.7229114, 1.449935, -1.090986, 0.5960785, 1, 0, 1,
-0.7151508, 0.1516207, -2.420545, 0.5882353, 1, 0, 1,
-0.7144333, 1.009346, -1.006375, 0.5843138, 1, 0, 1,
-0.7135023, -1.492349, -3.175092, 0.5764706, 1, 0, 1,
-0.7099307, 0.3959608, -2.720328, 0.572549, 1, 0, 1,
-0.7086079, 1.036966, -2.115724, 0.5647059, 1, 0, 1,
-0.7064617, -2.135949, -3.086779, 0.5607843, 1, 0, 1,
-0.6984272, -0.04548942, 0.3291256, 0.5529412, 1, 0, 1,
-0.6974653, 1.527531, 2.022006, 0.5490196, 1, 0, 1,
-0.6973972, 1.090253, 1.379427, 0.5411765, 1, 0, 1,
-0.6935277, -0.158062, -2.629027, 0.5372549, 1, 0, 1,
-0.6931942, 1.179081, -0.774952, 0.5294118, 1, 0, 1,
-0.6927683, -0.4906801, -1.588072, 0.5254902, 1, 0, 1,
-0.6920679, -0.2303813, -0.315982, 0.5176471, 1, 0, 1,
-0.6834714, 0.7773189, 0.07709336, 0.5137255, 1, 0, 1,
-0.6791022, -0.7846857, -2.10707, 0.5058824, 1, 0, 1,
-0.6790372, -0.08339355, -2.331798, 0.5019608, 1, 0, 1,
-0.6778911, -0.1400139, -1.383441, 0.4941176, 1, 0, 1,
-0.67366, -0.313579, -2.2615, 0.4862745, 1, 0, 1,
-0.6713778, -1.212197, -2.26907, 0.4823529, 1, 0, 1,
-0.6701688, 0.03184298, -1.067656, 0.4745098, 1, 0, 1,
-0.6677374, 0.5266055, -1.098854, 0.4705882, 1, 0, 1,
-0.6676481, 1.310347, -1.131075, 0.4627451, 1, 0, 1,
-0.6653228, 0.8454735, -0.4190118, 0.4588235, 1, 0, 1,
-0.6613274, -0.5406466, 0.09436615, 0.4509804, 1, 0, 1,
-0.6504121, 0.8376309, -1.866392, 0.4470588, 1, 0, 1,
-0.6481022, -0.4693693, -1.748133, 0.4392157, 1, 0, 1,
-0.6469702, -0.8263117, -2.820019, 0.4352941, 1, 0, 1,
-0.642642, 0.1233838, -1.242748, 0.427451, 1, 0, 1,
-0.6419852, 0.7707304, -0.2449031, 0.4235294, 1, 0, 1,
-0.6382007, -0.2449432, -1.987674, 0.4156863, 1, 0, 1,
-0.6351554, 0.38229, -2.306085, 0.4117647, 1, 0, 1,
-0.6347312, 1.082774, -1.853258, 0.4039216, 1, 0, 1,
-0.6329511, 1.784371, -0.9021227, 0.3960784, 1, 0, 1,
-0.6321482, -0.155483, -2.443494, 0.3921569, 1, 0, 1,
-0.6311218, 1.139049, -0.6179674, 0.3843137, 1, 0, 1,
-0.6300895, -0.1056242, -2.832652, 0.3803922, 1, 0, 1,
-0.6267253, -0.3944419, -3.340446, 0.372549, 1, 0, 1,
-0.625701, -0.360745, -2.706261, 0.3686275, 1, 0, 1,
-0.6242347, -1.475013, -2.616036, 0.3607843, 1, 0, 1,
-0.6224367, 0.1694064, -2.79731, 0.3568628, 1, 0, 1,
-0.613501, -0.2081065, -0.2968469, 0.3490196, 1, 0, 1,
-0.6105526, 0.8488998, -1.388809, 0.345098, 1, 0, 1,
-0.6092019, 2.717566, 0.5636669, 0.3372549, 1, 0, 1,
-0.6080652, 1.788781, -1.005806, 0.3333333, 1, 0, 1,
-0.6067404, 0.3773896, -0.3501725, 0.3254902, 1, 0, 1,
-0.6040706, -2.422386, -2.497805, 0.3215686, 1, 0, 1,
-0.6023763, -0.9971551, -2.988856, 0.3137255, 1, 0, 1,
-0.6020876, 0.8496516, 0.08844191, 0.3098039, 1, 0, 1,
-0.5982766, -0.0005093992, -3.342255, 0.3019608, 1, 0, 1,
-0.5914212, 1.678729, -0.6047879, 0.2941177, 1, 0, 1,
-0.5899035, 0.8245717, 0.9907549, 0.2901961, 1, 0, 1,
-0.5855066, 1.100726, -2.293295, 0.282353, 1, 0, 1,
-0.5834346, -0.0914882, -0.7843721, 0.2784314, 1, 0, 1,
-0.5834103, -1.231479, -1.676823, 0.2705882, 1, 0, 1,
-0.5784207, -0.3376002, -2.042012, 0.2666667, 1, 0, 1,
-0.5782357, -1.49278, -3.529124, 0.2588235, 1, 0, 1,
-0.576975, 1.060265, -0.7403453, 0.254902, 1, 0, 1,
-0.574653, -0.3115394, -2.840948, 0.2470588, 1, 0, 1,
-0.571693, -0.9048938, -2.478479, 0.2431373, 1, 0, 1,
-0.5691897, -0.8185132, -2.38939, 0.2352941, 1, 0, 1,
-0.5625325, -1.265842, -3.952083, 0.2313726, 1, 0, 1,
-0.5598044, 0.1112508, -1.795169, 0.2235294, 1, 0, 1,
-0.5578532, -0.5064186, -2.96167, 0.2196078, 1, 0, 1,
-0.5572821, -1.976895, -2.030097, 0.2117647, 1, 0, 1,
-0.5571542, 0.3787696, -1.055996, 0.2078431, 1, 0, 1,
-0.5569019, 1.388179, -1.49762, 0.2, 1, 0, 1,
-0.5550244, -1.893902, -1.842869, 0.1921569, 1, 0, 1,
-0.5526852, 0.9372129, -1.429404, 0.1882353, 1, 0, 1,
-0.5486581, -0.1312297, -0.6230925, 0.1803922, 1, 0, 1,
-0.5426126, -0.6719325, -2.720047, 0.1764706, 1, 0, 1,
-0.5385922, -0.760601, 0.3116398, 0.1686275, 1, 0, 1,
-0.5360662, 1.101019, 1.15089, 0.1647059, 1, 0, 1,
-0.5355605, 0.05408343, -2.690888, 0.1568628, 1, 0, 1,
-0.5335727, -0.2021164, 0.8031634, 0.1529412, 1, 0, 1,
-0.5234662, 0.3488779, -1.6273, 0.145098, 1, 0, 1,
-0.5224241, -0.6551408, -2.758044, 0.1411765, 1, 0, 1,
-0.5221887, -0.05022074, -2.763968, 0.1333333, 1, 0, 1,
-0.5126598, -0.2240547, -3.371158, 0.1294118, 1, 0, 1,
-0.5124656, 1.324932, 0.06812414, 0.1215686, 1, 0, 1,
-0.5089236, -0.6855365, 0.3163806, 0.1176471, 1, 0, 1,
-0.5077026, 1.484639, 0.2620449, 0.1098039, 1, 0, 1,
-0.5076182, -0.6113056, -0.9958676, 0.1058824, 1, 0, 1,
-0.5012654, 0.08047037, -0.4905645, 0.09803922, 1, 0, 1,
-0.4986356, 0.5970547, -1.155983, 0.09019608, 1, 0, 1,
-0.4919831, 0.5247096, 0.5671936, 0.08627451, 1, 0, 1,
-0.4896846, 0.03327835, -1.852735, 0.07843138, 1, 0, 1,
-0.4887844, 1.005135, -1.385895, 0.07450981, 1, 0, 1,
-0.4852642, 0.403117, -2.756954, 0.06666667, 1, 0, 1,
-0.4761581, -0.4112786, -2.035464, 0.0627451, 1, 0, 1,
-0.4757432, 1.031642, -0.4578415, 0.05490196, 1, 0, 1,
-0.4727955, 1.840185, 0.105256, 0.05098039, 1, 0, 1,
-0.4727783, 1.719587, -1.061066, 0.04313726, 1, 0, 1,
-0.4689232, 1.517312, -0.5495414, 0.03921569, 1, 0, 1,
-0.4659706, 0.1916211, 0.3711365, 0.03137255, 1, 0, 1,
-0.4630063, -0.1688353, -3.072699, 0.02745098, 1, 0, 1,
-0.456449, 0.6014637, 0.4684235, 0.01960784, 1, 0, 1,
-0.4560109, 0.6291494, 0.6879318, 0.01568628, 1, 0, 1,
-0.4479719, 0.2371796, -2.252328, 0.007843138, 1, 0, 1,
-0.4415337, -1.037889, -3.035527, 0.003921569, 1, 0, 1,
-0.4382968, -0.5152205, -1.65218, 0, 1, 0.003921569, 1,
-0.4372548, -0.9993767, -4.307796, 0, 1, 0.01176471, 1,
-0.4353564, 0.625834, -1.569137, 0, 1, 0.01568628, 1,
-0.4332045, -0.959563, -3.726094, 0, 1, 0.02352941, 1,
-0.4260984, 0.9865637, -1.138656, 0, 1, 0.02745098, 1,
-0.4259188, -0.07605865, 0.7340165, 0, 1, 0.03529412, 1,
-0.4230182, 1.853731, -1.382201, 0, 1, 0.03921569, 1,
-0.4225075, 1.448124, -1.815203, 0, 1, 0.04705882, 1,
-0.4221773, 0.08533923, -3.266823, 0, 1, 0.05098039, 1,
-0.4203089, -0.2402869, -3.041493, 0, 1, 0.05882353, 1,
-0.4200396, -0.9288538, -3.186121, 0, 1, 0.0627451, 1,
-0.4200227, -0.5683042, -3.054711, 0, 1, 0.07058824, 1,
-0.4162264, -0.3913786, -2.844665, 0, 1, 0.07450981, 1,
-0.4112532, -1.171693, -4.131498, 0, 1, 0.08235294, 1,
-0.4105727, 1.639994, -2.048636, 0, 1, 0.08627451, 1,
-0.4043076, 0.944146, -0.7041481, 0, 1, 0.09411765, 1,
-0.3930838, -1.899229, -3.382989, 0, 1, 0.1019608, 1,
-0.3927546, 0.4012192, -2.720241, 0, 1, 0.1058824, 1,
-0.3923089, 1.35206, -0.02141762, 0, 1, 0.1137255, 1,
-0.3917984, -0.1005967, -1.473031, 0, 1, 0.1176471, 1,
-0.3911846, 1.052938, -1.06542, 0, 1, 0.1254902, 1,
-0.3885967, -1.127034, -2.857537, 0, 1, 0.1294118, 1,
-0.3842693, -0.1386922, -2.088843, 0, 1, 0.1372549, 1,
-0.3811364, 1.16669, -1.040395, 0, 1, 0.1411765, 1,
-0.3803317, -1.608516, -3.364028, 0, 1, 0.1490196, 1,
-0.3788732, -0.3251477, -1.025558, 0, 1, 0.1529412, 1,
-0.3778036, -0.9804649, -2.182658, 0, 1, 0.1607843, 1,
-0.376843, 0.7918172, 0.1308205, 0, 1, 0.1647059, 1,
-0.3767259, -1.922776, -4.102018, 0, 1, 0.172549, 1,
-0.3753152, -0.2034359, -1.627276, 0, 1, 0.1764706, 1,
-0.3741923, -0.6117612, -3.055012, 0, 1, 0.1843137, 1,
-0.3718275, -0.2967288, -2.415723, 0, 1, 0.1882353, 1,
-0.3707325, -1.343019, -3.838997, 0, 1, 0.1960784, 1,
-0.3683127, 0.06796206, -1.178606, 0, 1, 0.2039216, 1,
-0.3617908, 0.3888832, -0.9679397, 0, 1, 0.2078431, 1,
-0.3603357, -0.8988322, -3.609024, 0, 1, 0.2156863, 1,
-0.3598331, -0.2856576, -2.324663, 0, 1, 0.2196078, 1,
-0.3533108, -0.6583709, -3.038611, 0, 1, 0.227451, 1,
-0.3505082, 1.069292, 1.022267, 0, 1, 0.2313726, 1,
-0.3464225, 1.233231, -1.943374, 0, 1, 0.2392157, 1,
-0.3448404, 0.1008126, -1.036891, 0, 1, 0.2431373, 1,
-0.3321262, 1.310973, -0.2407957, 0, 1, 0.2509804, 1,
-0.3313238, -0.2943612, -1.841368, 0, 1, 0.254902, 1,
-0.3259574, 1.238032, -0.01191768, 0, 1, 0.2627451, 1,
-0.3235226, 0.8845121, 1.565515, 0, 1, 0.2666667, 1,
-0.3195505, 0.9511713, -1.232499, 0, 1, 0.2745098, 1,
-0.3179032, 0.7539692, 0.8296626, 0, 1, 0.2784314, 1,
-0.31654, -0.02454147, 0.2129868, 0, 1, 0.2862745, 1,
-0.3106332, -0.09150949, -1.892318, 0, 1, 0.2901961, 1,
-0.306089, 0.3502167, -0.3905075, 0, 1, 0.2980392, 1,
-0.301336, -0.4150641, -3.324309, 0, 1, 0.3058824, 1,
-0.2927434, -1.258545, -3.197283, 0, 1, 0.3098039, 1,
-0.2901414, -1.052744, -2.876827, 0, 1, 0.3176471, 1,
-0.289099, -0.7657903, -2.016989, 0, 1, 0.3215686, 1,
-0.2880177, 1.527467, 0.4756386, 0, 1, 0.3294118, 1,
-0.2879031, 0.1948504, -0.1921478, 0, 1, 0.3333333, 1,
-0.2859901, -1.684123, -2.554949, 0, 1, 0.3411765, 1,
-0.2852178, 2.771009, 0.2726841, 0, 1, 0.345098, 1,
-0.2838547, -0.4547854, -2.524014, 0, 1, 0.3529412, 1,
-0.2809904, 0.9807909, 0.1338597, 0, 1, 0.3568628, 1,
-0.2775034, -0.08899074, -0.5384549, 0, 1, 0.3647059, 1,
-0.2752475, -0.9861493, -3.402959, 0, 1, 0.3686275, 1,
-0.2671927, -0.02225876, -2.571387, 0, 1, 0.3764706, 1,
-0.264519, 0.5157779, 1.4583, 0, 1, 0.3803922, 1,
-0.2638904, -0.2178283, -1.221491, 0, 1, 0.3882353, 1,
-0.2629361, -1.476851, -3.522688, 0, 1, 0.3921569, 1,
-0.2600354, 0.363397, -0.2627299, 0, 1, 0.4, 1,
-0.2573232, -1.436844, -3.428068, 0, 1, 0.4078431, 1,
-0.2555061, 0.8266194, 0.524392, 0, 1, 0.4117647, 1,
-0.2517541, 0.6049554, 0.6671292, 0, 1, 0.4196078, 1,
-0.2505135, -0.3675822, -1.848653, 0, 1, 0.4235294, 1,
-0.2446936, -1.810355, -4.317307, 0, 1, 0.4313726, 1,
-0.243802, 2.606232, 0.8032929, 0, 1, 0.4352941, 1,
-0.2387233, -0.1527675, -2.848464, 0, 1, 0.4431373, 1,
-0.2382821, -1.439789, -3.708673, 0, 1, 0.4470588, 1,
-0.2316828, 1.321095, -1.458953, 0, 1, 0.454902, 1,
-0.229169, -0.2039703, -1.013595, 0, 1, 0.4588235, 1,
-0.2289681, -0.363782, -2.626589, 0, 1, 0.4666667, 1,
-0.2245436, 0.07047442, -2.778983, 0, 1, 0.4705882, 1,
-0.2228213, -2.597962, -3.401498, 0, 1, 0.4784314, 1,
-0.2217534, -1.218676, -3.71338, 0, 1, 0.4823529, 1,
-0.2191677, 0.2811185, -3.236366, 0, 1, 0.4901961, 1,
-0.2163051, -0.5908476, -1.927309, 0, 1, 0.4941176, 1,
-0.2161317, -0.2740843, -2.973888, 0, 1, 0.5019608, 1,
-0.2141289, 0.9771959, -0.9160154, 0, 1, 0.509804, 1,
-0.2121903, 2.892157, -1.123566, 0, 1, 0.5137255, 1,
-0.2117456, -2.352128, -0.265845, 0, 1, 0.5215687, 1,
-0.2088086, -1.159427, -1.931218, 0, 1, 0.5254902, 1,
-0.2064009, 0.1954719, -1.843748, 0, 1, 0.5333334, 1,
-0.2062365, -2.615549, -3.859318, 0, 1, 0.5372549, 1,
-0.2047382, 0.02524028, -1.092048, 0, 1, 0.5450981, 1,
-0.2026103, -0.7724954, -2.531739, 0, 1, 0.5490196, 1,
-0.1997035, 0.1200701, 1.082529, 0, 1, 0.5568628, 1,
-0.1990504, 0.7727685, -0.5988712, 0, 1, 0.5607843, 1,
-0.1989127, -1.271763, -2.895532, 0, 1, 0.5686275, 1,
-0.1975858, -0.558741, -3.556274, 0, 1, 0.572549, 1,
-0.1949935, -0.1104516, -3.126502, 0, 1, 0.5803922, 1,
-0.1930074, -0.4912736, -3.709385, 0, 1, 0.5843138, 1,
-0.1880079, 1.671828, -0.3159709, 0, 1, 0.5921569, 1,
-0.182414, 0.3518773, -0.0106032, 0, 1, 0.5960785, 1,
-0.1800835, 0.3833004, -0.9543282, 0, 1, 0.6039216, 1,
-0.1761491, -0.3082358, -3.947593, 0, 1, 0.6117647, 1,
-0.1749767, -0.1285058, -2.912257, 0, 1, 0.6156863, 1,
-0.1731804, -0.2036877, -1.62905, 0, 1, 0.6235294, 1,
-0.170876, -0.7146677, -1.553351, 0, 1, 0.627451, 1,
-0.1678613, -0.2105659, -3.195162, 0, 1, 0.6352941, 1,
-0.1648343, -0.3434654, -0.6146947, 0, 1, 0.6392157, 1,
-0.1612368, 0.01874056, -2.986967, 0, 1, 0.6470588, 1,
-0.1588792, -0.7535218, -1.940422, 0, 1, 0.6509804, 1,
-0.1562034, 1.806185, 1.67018, 0, 1, 0.6588235, 1,
-0.1488394, -1.252308, -3.504877, 0, 1, 0.6627451, 1,
-0.147413, 1.572375, -0.714989, 0, 1, 0.6705883, 1,
-0.1468976, -0.5299996, -2.07655, 0, 1, 0.6745098, 1,
-0.1460735, 0.1766317, -0.5892054, 0, 1, 0.682353, 1,
-0.1458234, 1.120478, -0.1105018, 0, 1, 0.6862745, 1,
-0.1431442, 0.9400191, -1.774926, 0, 1, 0.6941177, 1,
-0.1429633, -0.06249764, -2.814936, 0, 1, 0.7019608, 1,
-0.141803, 0.8042595, 0.6306257, 0, 1, 0.7058824, 1,
-0.140691, -1.00655, -4.241008, 0, 1, 0.7137255, 1,
-0.1336618, -1.581114, -2.996833, 0, 1, 0.7176471, 1,
-0.1334579, -0.1375609, -2.340201, 0, 1, 0.7254902, 1,
-0.1247535, -0.05695018, -2.688684, 0, 1, 0.7294118, 1,
-0.1242474, -0.5403158, -3.676262, 0, 1, 0.7372549, 1,
-0.1228098, 0.2525061, -0.7321491, 0, 1, 0.7411765, 1,
-0.1225921, -1.970014, -4.0267, 0, 1, 0.7490196, 1,
-0.1223673, -1.317378, -3.109004, 0, 1, 0.7529412, 1,
-0.120948, 0.01347746, -2.076586, 0, 1, 0.7607843, 1,
-0.120195, 0.4151328, 0.3772041, 0, 1, 0.7647059, 1,
-0.120132, 0.7400607, 0.2660773, 0, 1, 0.772549, 1,
-0.1196724, 1.367211, 0.358114, 0, 1, 0.7764706, 1,
-0.1088029, 1.093828, -0.7041603, 0, 1, 0.7843137, 1,
-0.1064081, -0.2682572, -4.832657, 0, 1, 0.7882353, 1,
-0.1032502, 0.7272701, 0.8116311, 0, 1, 0.7960784, 1,
-0.1013306, 0.7648324, 0.294219, 0, 1, 0.8039216, 1,
-0.09844203, 1.775079, 1.265917, 0, 1, 0.8078431, 1,
-0.09691262, -0.6157327, -4.194182, 0, 1, 0.8156863, 1,
-0.09658231, 0.879164, -1.758654, 0, 1, 0.8196079, 1,
-0.09446356, 0.7816975, 0.1122038, 0, 1, 0.827451, 1,
-0.0926929, 0.8961712, 0.01137777, 0, 1, 0.8313726, 1,
-0.08676533, 0.703055, -2.65038, 0, 1, 0.8392157, 1,
-0.08587486, -1.073667, -1.586962, 0, 1, 0.8431373, 1,
-0.07762641, 1.503487, 0.0215904, 0, 1, 0.8509804, 1,
-0.07207789, -0.1868588, -1.127051, 0, 1, 0.854902, 1,
-0.06608646, -0.9498157, -2.860544, 0, 1, 0.8627451, 1,
-0.06571686, -0.1202088, -4.183755, 0, 1, 0.8666667, 1,
-0.06266849, 0.1000576, 0.977016, 0, 1, 0.8745098, 1,
-0.06032773, -0.7506083, -3.669024, 0, 1, 0.8784314, 1,
-0.05813294, -0.891309, -2.323607, 0, 1, 0.8862745, 1,
-0.05684993, -1.897017, -1.765259, 0, 1, 0.8901961, 1,
-0.0553721, 1.981522, 0.9665198, 0, 1, 0.8980392, 1,
-0.05057739, 0.397965, -0.9682827, 0, 1, 0.9058824, 1,
-0.04711715, -0.8696263, -2.134175, 0, 1, 0.9098039, 1,
-0.04512723, 0.004228101, -1.050104, 0, 1, 0.9176471, 1,
-0.0420136, 0.7304235, -0.3151576, 0, 1, 0.9215686, 1,
-0.04036778, -1.508475, -3.344741, 0, 1, 0.9294118, 1,
-0.04034067, 1.370548, -1.643256, 0, 1, 0.9333333, 1,
-0.03531524, -0.4192424, -3.222298, 0, 1, 0.9411765, 1,
-0.0316742, -0.9676717, -3.407451, 0, 1, 0.945098, 1,
-0.02991428, 1.711483, -1.259479, 0, 1, 0.9529412, 1,
-0.02765411, 1.106259, 1.795733, 0, 1, 0.9568627, 1,
-0.01810958, 1.981136, -1.052857, 0, 1, 0.9647059, 1,
-0.0162075, -0.7739301, -2.435199, 0, 1, 0.9686275, 1,
-0.004750801, 0.2147001, -0.5895912, 0, 1, 0.9764706, 1,
-0.002269819, -0.07452768, -1.2746, 0, 1, 0.9803922, 1,
0.0008409821, 1.732997, -1.088219, 0, 1, 0.9882353, 1,
0.0009587171, 0.5789838, -0.135045, 0, 1, 0.9921569, 1,
0.004072108, -0.2026849, 3.821414, 0, 1, 1, 1,
0.01155531, 1.195096, -1.923446, 0, 0.9921569, 1, 1,
0.01350883, -0.6865873, 3.972759, 0, 0.9882353, 1, 1,
0.01507442, -0.2407705, 2.443122, 0, 0.9803922, 1, 1,
0.01709033, 2.232469, -0.5952805, 0, 0.9764706, 1, 1,
0.01763397, -0.8185264, 2.261835, 0, 0.9686275, 1, 1,
0.02083212, -0.3968271, 3.421239, 0, 0.9647059, 1, 1,
0.02199917, -0.4045752, 2.450681, 0, 0.9568627, 1, 1,
0.03311079, -0.1724997, 2.761201, 0, 0.9529412, 1, 1,
0.03705678, 1.681963, -1.965623, 0, 0.945098, 1, 1,
0.0387341, 0.05813003, -0.03031175, 0, 0.9411765, 1, 1,
0.04397039, -1.050238, 4.190162, 0, 0.9333333, 1, 1,
0.04766147, -0.9402483, 2.572266, 0, 0.9294118, 1, 1,
0.04893588, 1.200046, 0.1598361, 0, 0.9215686, 1, 1,
0.04999525, -0.04179493, 3.499811, 0, 0.9176471, 1, 1,
0.05689547, -0.3949638, 2.652777, 0, 0.9098039, 1, 1,
0.05690155, -0.6425207, 3.686784, 0, 0.9058824, 1, 1,
0.05811562, 0.335076, 0.1621387, 0, 0.8980392, 1, 1,
0.06116518, -1.728612, 1.68419, 0, 0.8901961, 1, 1,
0.0613742, -1.237658, 3.560812, 0, 0.8862745, 1, 1,
0.06895743, -0.3899148, 1.567402, 0, 0.8784314, 1, 1,
0.06964529, 1.733882, 0.9834788, 0, 0.8745098, 1, 1,
0.0705513, -0.6326217, 4.890183, 0, 0.8666667, 1, 1,
0.07447694, 1.224433, -1.678882, 0, 0.8627451, 1, 1,
0.07468345, -1.212095, 5.070886, 0, 0.854902, 1, 1,
0.07677713, -0.9386135, 2.471442, 0, 0.8509804, 1, 1,
0.07755475, 0.8301267, 0.7897155, 0, 0.8431373, 1, 1,
0.08133328, -0.8967878, 0.7977495, 0, 0.8392157, 1, 1,
0.09063356, -0.7838485, 3.135068, 0, 0.8313726, 1, 1,
0.09202846, -0.6902323, 4.283836, 0, 0.827451, 1, 1,
0.09524911, 0.7415492, 2.136806, 0, 0.8196079, 1, 1,
0.1030509, -0.7538826, 2.827822, 0, 0.8156863, 1, 1,
0.1056466, -0.3720957, 2.498256, 0, 0.8078431, 1, 1,
0.1074024, -0.5403286, 3.922055, 0, 0.8039216, 1, 1,
0.1110347, 1.105461, -0.2229816, 0, 0.7960784, 1, 1,
0.1136982, -0.6369351, 3.249015, 0, 0.7882353, 1, 1,
0.1142981, 0.4900393, -0.4217083, 0, 0.7843137, 1, 1,
0.1145683, 0.6214594, 0.9994104, 0, 0.7764706, 1, 1,
0.1172235, 1.512838, 0.3197983, 0, 0.772549, 1, 1,
0.1218932, -1.479469, 3.613878, 0, 0.7647059, 1, 1,
0.1224663, -0.5028983, 4.453056, 0, 0.7607843, 1, 1,
0.1229217, -1.09477, 3.52669, 0, 0.7529412, 1, 1,
0.1241278, 0.271459, -0.4116069, 0, 0.7490196, 1, 1,
0.1246479, 0.3735647, 0.3698287, 0, 0.7411765, 1, 1,
0.1259896, 0.2098226, -0.3223252, 0, 0.7372549, 1, 1,
0.1261534, -0.627522, 4.509946, 0, 0.7294118, 1, 1,
0.1262333, -0.9470558, 3.445263, 0, 0.7254902, 1, 1,
0.1266097, -0.3422382, 2.713316, 0, 0.7176471, 1, 1,
0.1297792, -0.5089287, 3.191902, 0, 0.7137255, 1, 1,
0.1321807, 1.98973, 0.5970768, 0, 0.7058824, 1, 1,
0.1328454, -0.6357707, 3.754698, 0, 0.6980392, 1, 1,
0.1355282, -1.967871, 2.247221, 0, 0.6941177, 1, 1,
0.137537, 0.09202372, 0.9031358, 0, 0.6862745, 1, 1,
0.1384898, -0.2117247, 4.098399, 0, 0.682353, 1, 1,
0.1436466, 0.2902097, -0.918234, 0, 0.6745098, 1, 1,
0.143839, 2.125309, 0.4247179, 0, 0.6705883, 1, 1,
0.1476569, 0.761344, 0.9428512, 0, 0.6627451, 1, 1,
0.1562183, 0.1667387, 0.4365608, 0, 0.6588235, 1, 1,
0.1569918, 0.8322926, 1.584303, 0, 0.6509804, 1, 1,
0.160458, 1.046207, 0.5373434, 0, 0.6470588, 1, 1,
0.161729, -0.9579428, 2.658288, 0, 0.6392157, 1, 1,
0.1619888, -0.8664936, 3.099274, 0, 0.6352941, 1, 1,
0.1629935, -2.289096, 2.834851, 0, 0.627451, 1, 1,
0.1633624, -1.585172, 1.386105, 0, 0.6235294, 1, 1,
0.1719378, -0.3257455, 2.360947, 0, 0.6156863, 1, 1,
0.1738594, -0.1204711, 2.082558, 0, 0.6117647, 1, 1,
0.174795, -2.838022, 3.363369, 0, 0.6039216, 1, 1,
0.1767373, 1.186727, -0.4199669, 0, 0.5960785, 1, 1,
0.180905, -0.1537849, 1.297342, 0, 0.5921569, 1, 1,
0.1827467, -1.143401, 1.873014, 0, 0.5843138, 1, 1,
0.1877356, -0.01148143, 1.345682, 0, 0.5803922, 1, 1,
0.1889907, -1.534632, 4.050465, 0, 0.572549, 1, 1,
0.1890794, 0.3514069, 1.177462, 0, 0.5686275, 1, 1,
0.1915181, -0.1113001, 1.220148, 0, 0.5607843, 1, 1,
0.1921973, -2.224849, 2.419336, 0, 0.5568628, 1, 1,
0.1929067, 0.712132, 2.095337, 0, 0.5490196, 1, 1,
0.1938272, -1.022372, 2.963889, 0, 0.5450981, 1, 1,
0.1987553, 0.5745842, 0.2317736, 0, 0.5372549, 1, 1,
0.2017162, 0.1781922, -0.1797221, 0, 0.5333334, 1, 1,
0.2056836, 0.1174559, -0.04017309, 0, 0.5254902, 1, 1,
0.2075437, -1.440079, 1.249233, 0, 0.5215687, 1, 1,
0.208862, 2.596727, -0.640234, 0, 0.5137255, 1, 1,
0.210681, 0.3798467, 2.136408, 0, 0.509804, 1, 1,
0.2147147, -0.2852295, 2.068907, 0, 0.5019608, 1, 1,
0.2154138, 0.2195251, 1.428989, 0, 0.4941176, 1, 1,
0.2198294, 1.302875, 0.7306685, 0, 0.4901961, 1, 1,
0.2203865, 0.5205706, -0.2556495, 0, 0.4823529, 1, 1,
0.2264334, -0.3661603, 3.154809, 0, 0.4784314, 1, 1,
0.2272725, 0.6654946, 0.5482835, 0, 0.4705882, 1, 1,
0.2317563, 0.424886, 0.1784419, 0, 0.4666667, 1, 1,
0.2370234, 0.2998397, -0.1088351, 0, 0.4588235, 1, 1,
0.2384559, 1.122251, 1.667303, 0, 0.454902, 1, 1,
0.2389491, 0.4448578, 0.5722402, 0, 0.4470588, 1, 1,
0.2390333, -0.4134413, 1.287319, 0, 0.4431373, 1, 1,
0.2419429, -0.2439323, 2.489077, 0, 0.4352941, 1, 1,
0.2449139, -0.5481565, 2.930594, 0, 0.4313726, 1, 1,
0.2463506, -0.875571, 3.16101, 0, 0.4235294, 1, 1,
0.2502921, -0.38137, 2.923824, 0, 0.4196078, 1, 1,
0.2512217, -0.4841792, 2.107732, 0, 0.4117647, 1, 1,
0.2524665, 1.691392, -0.5121706, 0, 0.4078431, 1, 1,
0.257337, 0.05895296, 1.987982, 0, 0.4, 1, 1,
0.2635138, 1.110144, -0.7570138, 0, 0.3921569, 1, 1,
0.2704724, 0.5225692, -0.08854278, 0, 0.3882353, 1, 1,
0.2727033, 0.5223321, 1.209262, 0, 0.3803922, 1, 1,
0.273029, 0.863534, 0.05521112, 0, 0.3764706, 1, 1,
0.2756578, -0.5313213, 3.888366, 0, 0.3686275, 1, 1,
0.2763374, 2.548388, -0.7254475, 0, 0.3647059, 1, 1,
0.2847497, -1.105005, 0.9168624, 0, 0.3568628, 1, 1,
0.2866682, 0.8708931, 0.935602, 0, 0.3529412, 1, 1,
0.2867729, -0.371325, 2.16234, 0, 0.345098, 1, 1,
0.2878073, 1.246052, -0.4905208, 0, 0.3411765, 1, 1,
0.2878729, 0.6639585, 0.5224271, 0, 0.3333333, 1, 1,
0.2928059, 0.03945713, 1.476326, 0, 0.3294118, 1, 1,
0.2937035, -0.6091761, 1.105766, 0, 0.3215686, 1, 1,
0.2979988, -0.9021884, 2.690704, 0, 0.3176471, 1, 1,
0.2985266, 0.2591085, -0.04798449, 0, 0.3098039, 1, 1,
0.3018441, -1.014237, 2.105424, 0, 0.3058824, 1, 1,
0.3037181, 0.07164694, 2.028171, 0, 0.2980392, 1, 1,
0.3076726, -0.6297707, 3.618856, 0, 0.2901961, 1, 1,
0.3078784, 0.2204457, 4.075167, 0, 0.2862745, 1, 1,
0.3092456, 0.5312594, 0.4621816, 0, 0.2784314, 1, 1,
0.312358, 1.392384, 2.148447, 0, 0.2745098, 1, 1,
0.3177362, -1.404038, 2.109211, 0, 0.2666667, 1, 1,
0.3208455, 1.096061, 1.051047, 0, 0.2627451, 1, 1,
0.3249273, 0.251918, 0.7989694, 0, 0.254902, 1, 1,
0.3255818, 0.4664778, 2.205219, 0, 0.2509804, 1, 1,
0.3258481, 0.05701884, 0.06629653, 0, 0.2431373, 1, 1,
0.3359859, -1.341674, 2.296856, 0, 0.2392157, 1, 1,
0.3360878, 0.2471168, 0.9726895, 0, 0.2313726, 1, 1,
0.3372578, 1.591909, 0.2218159, 0, 0.227451, 1, 1,
0.3380542, -0.7813424, 2.59965, 0, 0.2196078, 1, 1,
0.3417341, -0.5466285, 3.603336, 0, 0.2156863, 1, 1,
0.3447263, -1.103258, 2.535601, 0, 0.2078431, 1, 1,
0.3467036, 0.7147919, -0.6638334, 0, 0.2039216, 1, 1,
0.3501258, 1.442017, 1.066109, 0, 0.1960784, 1, 1,
0.3512098, -0.02023167, 1.084816, 0, 0.1882353, 1, 1,
0.3529108, 0.1701631, 1.405309, 0, 0.1843137, 1, 1,
0.3531546, -0.3213992, 1.86103, 0, 0.1764706, 1, 1,
0.3553089, 0.1890488, 1.048141, 0, 0.172549, 1, 1,
0.3574484, 0.4122745, 0.9035543, 0, 0.1647059, 1, 1,
0.3599734, 0.4622168, 0.53749, 0, 0.1607843, 1, 1,
0.3602257, 0.8955741, 0.4104401, 0, 0.1529412, 1, 1,
0.3630427, 0.6701962, 0.6107137, 0, 0.1490196, 1, 1,
0.3648824, -1.964598, 2.438062, 0, 0.1411765, 1, 1,
0.3686268, -0.4582237, 2.256095, 0, 0.1372549, 1, 1,
0.3686558, 1.458017, 2.168799, 0, 0.1294118, 1, 1,
0.3694634, -1.391496, 1.647487, 0, 0.1254902, 1, 1,
0.3701459, -0.4244904, 2.84418, 0, 0.1176471, 1, 1,
0.3746237, 0.2468541, 1.153584, 0, 0.1137255, 1, 1,
0.376958, 0.6023901, 1.444369, 0, 0.1058824, 1, 1,
0.3803956, 0.1712248, 1.504965, 0, 0.09803922, 1, 1,
0.3833714, 0.8346968, 2.490451, 0, 0.09411765, 1, 1,
0.3834305, 0.181046, 2.606168, 0, 0.08627451, 1, 1,
0.3873823, 0.7301332, -0.4425588, 0, 0.08235294, 1, 1,
0.3904809, -1.710833, 1.801094, 0, 0.07450981, 1, 1,
0.3916711, 0.5785707, 0.07682861, 0, 0.07058824, 1, 1,
0.3920327, 1.520989, 0.6793493, 0, 0.0627451, 1, 1,
0.3964849, -0.4859164, 0.6929345, 0, 0.05882353, 1, 1,
0.3991172, -0.7944665, 2.66514, 0, 0.05098039, 1, 1,
0.3994892, 0.2355359, 1.244131, 0, 0.04705882, 1, 1,
0.4009203, 0.79984, 1.324872, 0, 0.03921569, 1, 1,
0.4041879, -0.7567558, -0.1171096, 0, 0.03529412, 1, 1,
0.4065694, 0.06084139, 2.022282, 0, 0.02745098, 1, 1,
0.4082373, -2.184255, 1.46523, 0, 0.02352941, 1, 1,
0.4085119, -0.9302476, 4.58057, 0, 0.01568628, 1, 1,
0.4151566, -0.7557435, 2.933919, 0, 0.01176471, 1, 1,
0.4158528, -0.1182175, 3.213045, 0, 0.003921569, 1, 1,
0.4204936, 1.693939, 0.8276665, 0.003921569, 0, 1, 1,
0.4212952, -1.237557, 3.263322, 0.007843138, 0, 1, 1,
0.4248289, 0.2187369, -0.03376566, 0.01568628, 0, 1, 1,
0.4249313, 0.625991, 0.3780583, 0.01960784, 0, 1, 1,
0.4291722, -0.3998094, 2.266922, 0.02745098, 0, 1, 1,
0.4311364, -0.8935173, 1.993849, 0.03137255, 0, 1, 1,
0.4350782, -0.494203, 3.684864, 0.03921569, 0, 1, 1,
0.4370396, -1.408828, 2.313505, 0.04313726, 0, 1, 1,
0.4396641, -1.709479, 3.045267, 0.05098039, 0, 1, 1,
0.4441271, -1.142923, 2.288234, 0.05490196, 0, 1, 1,
0.4513419, 0.3571234, 0.7424794, 0.0627451, 0, 1, 1,
0.4531479, -0.2900653, 0.7928417, 0.06666667, 0, 1, 1,
0.4536199, 0.3416436, 0.8270593, 0.07450981, 0, 1, 1,
0.4554158, 0.134361, 0.4206344, 0.07843138, 0, 1, 1,
0.4585009, -1.008814, 2.146574, 0.08627451, 0, 1, 1,
0.4586572, 3.049821, 0.2539149, 0.09019608, 0, 1, 1,
0.4618559, -0.5359969, 2.757606, 0.09803922, 0, 1, 1,
0.4620058, -0.04448668, 3.346392, 0.1058824, 0, 1, 1,
0.4688329, 0.5057445, 0.3888036, 0.1098039, 0, 1, 1,
0.4761228, 0.4212267, 0.7376206, 0.1176471, 0, 1, 1,
0.4812199, -2.325332, 3.591964, 0.1215686, 0, 1, 1,
0.4882115, -1.669959, 2.293076, 0.1294118, 0, 1, 1,
0.4899831, 0.442196, 2.117612, 0.1333333, 0, 1, 1,
0.5010888, -0.3375433, 1.842134, 0.1411765, 0, 1, 1,
0.5032125, -0.5340973, 3.520232, 0.145098, 0, 1, 1,
0.5062011, -0.2097694, 1.347691, 0.1529412, 0, 1, 1,
0.5113859, 0.1097675, 0.8608249, 0.1568628, 0, 1, 1,
0.5114963, -1.300839, 2.134357, 0.1647059, 0, 1, 1,
0.5118712, 1.372615, 0.2382562, 0.1686275, 0, 1, 1,
0.511923, -1.154609, 2.606833, 0.1764706, 0, 1, 1,
0.5119604, 0.8927715, 1.048328, 0.1803922, 0, 1, 1,
0.5154499, -1.289172, 3.932141, 0.1882353, 0, 1, 1,
0.5155864, 0.5441201, -1.275469, 0.1921569, 0, 1, 1,
0.5165916, -1.547785, 4.392875, 0.2, 0, 1, 1,
0.5209903, 1.631692, 0.01978589, 0.2078431, 0, 1, 1,
0.5221369, -0.2463692, -0.336381, 0.2117647, 0, 1, 1,
0.527808, 0.1061379, 2.847674, 0.2196078, 0, 1, 1,
0.5308127, 0.7572281, 2.111213, 0.2235294, 0, 1, 1,
0.5318507, -0.4817481, 2.658409, 0.2313726, 0, 1, 1,
0.5345864, -1.332584, 3.447595, 0.2352941, 0, 1, 1,
0.534714, 0.6697207, -1.108921, 0.2431373, 0, 1, 1,
0.537053, -0.2858962, 2.713821, 0.2470588, 0, 1, 1,
0.5371013, -0.2530787, 1.27098, 0.254902, 0, 1, 1,
0.5438905, 0.5636096, 1.322402, 0.2588235, 0, 1, 1,
0.5452442, 1.010729, 2.368096, 0.2666667, 0, 1, 1,
0.5475895, -0.6997339, 2.645129, 0.2705882, 0, 1, 1,
0.5498829, -0.3887594, 1.153042, 0.2784314, 0, 1, 1,
0.5514827, -1.219133, 2.795995, 0.282353, 0, 1, 1,
0.5563187, 0.4306988, 1.679268, 0.2901961, 0, 1, 1,
0.5594534, -0.1597482, -0.185077, 0.2941177, 0, 1, 1,
0.562613, -0.160972, 1.841147, 0.3019608, 0, 1, 1,
0.5628484, -1.219616, 4.013293, 0.3098039, 0, 1, 1,
0.56594, 0.7215047, 0.7074923, 0.3137255, 0, 1, 1,
0.5765004, 0.5368821, 1.433384, 0.3215686, 0, 1, 1,
0.5775553, 1.732386, -2.163949, 0.3254902, 0, 1, 1,
0.5777658, -0.6099202, 2.944138, 0.3333333, 0, 1, 1,
0.5858229, 0.6582012, 0.4773457, 0.3372549, 0, 1, 1,
0.587436, 0.9008847, 0.1613311, 0.345098, 0, 1, 1,
0.5874663, 0.5632598, 0.1450452, 0.3490196, 0, 1, 1,
0.5905227, 1.592743, 1.466682, 0.3568628, 0, 1, 1,
0.592135, -0.5390433, 2.576028, 0.3607843, 0, 1, 1,
0.5936379, -0.5233623, 3.225655, 0.3686275, 0, 1, 1,
0.5946817, -0.4342646, 2.271587, 0.372549, 0, 1, 1,
0.5954491, -0.8106617, 2.658038, 0.3803922, 0, 1, 1,
0.5957948, 0.2378192, 0.2339169, 0.3843137, 0, 1, 1,
0.6012271, 0.3556031, 1.029088, 0.3921569, 0, 1, 1,
0.6069422, 1.559016, 1.564514, 0.3960784, 0, 1, 1,
0.6160725, -0.3375562, 1.989973, 0.4039216, 0, 1, 1,
0.6169091, -2.551049, 2.367519, 0.4117647, 0, 1, 1,
0.6247196, 1.391698, -0.04742648, 0.4156863, 0, 1, 1,
0.6355799, -0.8182643, 2.726269, 0.4235294, 0, 1, 1,
0.6468216, 2.235794, 0.9805723, 0.427451, 0, 1, 1,
0.6509366, 0.5079152, 1.016016, 0.4352941, 0, 1, 1,
0.6544958, 0.1957078, 0.8608171, 0.4392157, 0, 1, 1,
0.6550701, -0.0773546, 1.787396, 0.4470588, 0, 1, 1,
0.65602, -0.6686949, 2.730634, 0.4509804, 0, 1, 1,
0.6563802, 0.2829922, 2.002786, 0.4588235, 0, 1, 1,
0.661768, 0.7023307, -0.4237302, 0.4627451, 0, 1, 1,
0.6721756, -0.2508098, 2.061221, 0.4705882, 0, 1, 1,
0.6751471, 2.243459, 0.4977373, 0.4745098, 0, 1, 1,
0.6765566, 1.873583, 1.194289, 0.4823529, 0, 1, 1,
0.6863708, -0.1951504, 2.666637, 0.4862745, 0, 1, 1,
0.6869851, -0.9906734, 1.631667, 0.4941176, 0, 1, 1,
0.69846, -1.39192, 3.383902, 0.5019608, 0, 1, 1,
0.7154852, -0.3281523, 2.243206, 0.5058824, 0, 1, 1,
0.7292977, 0.03494248, 2.298071, 0.5137255, 0, 1, 1,
0.7298694, -1.696202, 1.848912, 0.5176471, 0, 1, 1,
0.7311842, 0.546359, 1.633686, 0.5254902, 0, 1, 1,
0.7356087, 0.72565, 0.8208593, 0.5294118, 0, 1, 1,
0.7380064, 2.149789, 0.8551311, 0.5372549, 0, 1, 1,
0.739078, -1.040246, 3.862435, 0.5411765, 0, 1, 1,
0.7393321, -1.200732, 3.642074, 0.5490196, 0, 1, 1,
0.7400638, -0.8135157, 1.497181, 0.5529412, 0, 1, 1,
0.7417714, 1.530048, 0.0722749, 0.5607843, 0, 1, 1,
0.7437456, -0.207124, 1.348505, 0.5647059, 0, 1, 1,
0.7538342, 0.1872869, 2.015877, 0.572549, 0, 1, 1,
0.7541837, -0.5282835, 2.47428, 0.5764706, 0, 1, 1,
0.7543541, -0.9420835, 1.614894, 0.5843138, 0, 1, 1,
0.7548082, 0.6971317, 0.609652, 0.5882353, 0, 1, 1,
0.7552407, -0.2560347, 3.442666, 0.5960785, 0, 1, 1,
0.7558602, 0.742103, 1.271282, 0.6039216, 0, 1, 1,
0.7567194, -0.9027081, 3.195881, 0.6078432, 0, 1, 1,
0.7567369, 1.772009, 1.234424, 0.6156863, 0, 1, 1,
0.7577382, -0.3178023, 1.26917, 0.6196079, 0, 1, 1,
0.7577578, -1.203553, 2.677892, 0.627451, 0, 1, 1,
0.7603174, 0.2701379, 0.2156986, 0.6313726, 0, 1, 1,
0.7643591, -0.7625574, 1.88463, 0.6392157, 0, 1, 1,
0.7654973, 1.13872, -0.5428514, 0.6431373, 0, 1, 1,
0.7790897, -0.5560372, 1.229925, 0.6509804, 0, 1, 1,
0.780569, -0.07401338, 2.753922, 0.654902, 0, 1, 1,
0.7845497, 1.67796, -0.6491529, 0.6627451, 0, 1, 1,
0.7870283, -0.4104949, 0.9348251, 0.6666667, 0, 1, 1,
0.7889132, -0.8573205, 2.880208, 0.6745098, 0, 1, 1,
0.7891493, 1.31659, 0.5305371, 0.6784314, 0, 1, 1,
0.7911165, 0.67595, 1.120955, 0.6862745, 0, 1, 1,
0.7919533, -0.6415258, 1.969643, 0.6901961, 0, 1, 1,
0.7933289, 0.1955926, 0.3809906, 0.6980392, 0, 1, 1,
0.7941911, 0.8940477, 0.9635097, 0.7058824, 0, 1, 1,
0.7963735, -0.3240976, 2.121419, 0.7098039, 0, 1, 1,
0.7992065, 0.2531593, 1.149921, 0.7176471, 0, 1, 1,
0.7996573, -1.350599, 3.090765, 0.7215686, 0, 1, 1,
0.8016439, -2.007849, 1.555404, 0.7294118, 0, 1, 1,
0.8049127, 1.76398, 0.2022764, 0.7333333, 0, 1, 1,
0.8062878, -0.8135546, 2.408148, 0.7411765, 0, 1, 1,
0.810115, 0.1466471, 1.831152, 0.7450981, 0, 1, 1,
0.8162962, -1.542099, 1.685685, 0.7529412, 0, 1, 1,
0.8189201, -0.5399857, 3.051689, 0.7568628, 0, 1, 1,
0.8193902, 0.6207745, 1.060981, 0.7647059, 0, 1, 1,
0.8208702, 0.5660816, 0.5279477, 0.7686275, 0, 1, 1,
0.8284737, -0.9764308, 2.136485, 0.7764706, 0, 1, 1,
0.8327605, 1.335989, -0.7407286, 0.7803922, 0, 1, 1,
0.8329965, -1.876096, 2.358668, 0.7882353, 0, 1, 1,
0.8370642, 0.8197752, -1.360732, 0.7921569, 0, 1, 1,
0.8409878, 0.767261, 0.8843541, 0.8, 0, 1, 1,
0.8496782, 0.7686056, 0.1536869, 0.8078431, 0, 1, 1,
0.8512421, 0.6637412, 1.182927, 0.8117647, 0, 1, 1,
0.8516207, -1.353965, 2.046073, 0.8196079, 0, 1, 1,
0.8523803, 0.01673709, 1.562663, 0.8235294, 0, 1, 1,
0.8608159, 0.271068, 1.18833, 0.8313726, 0, 1, 1,
0.8617738, 0.9399546, -1.137495, 0.8352941, 0, 1, 1,
0.8635457, -1.071017, 3.377808, 0.8431373, 0, 1, 1,
0.8700016, 0.3598097, 0.3289184, 0.8470588, 0, 1, 1,
0.8712287, -1.040262, 2.391949, 0.854902, 0, 1, 1,
0.8716642, -0.2238757, 2.879111, 0.8588235, 0, 1, 1,
0.877439, -0.03214987, 1.468542, 0.8666667, 0, 1, 1,
0.8798075, 0.1332456, 0.6587359, 0.8705882, 0, 1, 1,
0.8835566, 0.4816754, -0.5399929, 0.8784314, 0, 1, 1,
0.8835764, 0.622154, -0.1691514, 0.8823529, 0, 1, 1,
0.88669, -1.088028, 2.855896, 0.8901961, 0, 1, 1,
0.891221, 0.1995223, 0.10942, 0.8941177, 0, 1, 1,
0.8957098, -1.99538, 2.013032, 0.9019608, 0, 1, 1,
0.910038, 1.852826, -0.1379163, 0.9098039, 0, 1, 1,
0.9160771, 1.948974, 0.1052008, 0.9137255, 0, 1, 1,
0.9203097, -0.6395757, 1.524221, 0.9215686, 0, 1, 1,
0.9208515, -0.1064625, 2.228277, 0.9254902, 0, 1, 1,
0.925274, 0.2734233, 1.47642, 0.9333333, 0, 1, 1,
0.9269802, 1.547792, 1.674607, 0.9372549, 0, 1, 1,
0.9279321, -0.3270707, 0.8494953, 0.945098, 0, 1, 1,
0.9471402, 0.4731548, 2.216341, 0.9490196, 0, 1, 1,
0.9491263, 0.08417898, -0.04365012, 0.9568627, 0, 1, 1,
0.9552136, -0.5161047, 2.748694, 0.9607843, 0, 1, 1,
0.9597297, -0.6666456, 3.364511, 0.9686275, 0, 1, 1,
0.9638426, -0.185099, 1.310514, 0.972549, 0, 1, 1,
0.964825, -0.0795669, 2.361509, 0.9803922, 0, 1, 1,
0.9702392, 0.7051253, 2.384967, 0.9843137, 0, 1, 1,
0.9728618, -1.154308, 2.882612, 0.9921569, 0, 1, 1,
0.9750617, 0.9547685, 0.8480121, 0.9960784, 0, 1, 1,
0.9772722, 0.6820626, 0.9419593, 1, 0, 0.9960784, 1,
0.9797504, 0.4143484, 3.303027, 1, 0, 0.9882353, 1,
0.9814275, 1.102585, 1.827812, 1, 0, 0.9843137, 1,
0.9830372, -0.2622354, 1.040127, 1, 0, 0.9764706, 1,
0.9880224, 0.6863497, 1.304945, 1, 0, 0.972549, 1,
0.9896442, -1.045931, 2.190916, 1, 0, 0.9647059, 1,
1.000988, -0.1711306, 2.517853, 1, 0, 0.9607843, 1,
1.002689, -0.8610447, 0.8913072, 1, 0, 0.9529412, 1,
1.006938, -0.9545401, 3.488787, 1, 0, 0.9490196, 1,
1.015055, 1.899874, 0.5018929, 1, 0, 0.9411765, 1,
1.016067, -2.175144, 1.129218, 1, 0, 0.9372549, 1,
1.019332, 0.1356621, 3.09049, 1, 0, 0.9294118, 1,
1.019761, -2.721888, 3.910839, 1, 0, 0.9254902, 1,
1.025062, 0.2612083, -0.3632945, 1, 0, 0.9176471, 1,
1.025709, -0.7634923, 2.313507, 1, 0, 0.9137255, 1,
1.026095, -0.813207, 2.261877, 1, 0, 0.9058824, 1,
1.02661, 1.66891, 0.867332, 1, 0, 0.9019608, 1,
1.027889, 2.0577, 0.05352309, 1, 0, 0.8941177, 1,
1.032629, -0.5150084, 3.405984, 1, 0, 0.8862745, 1,
1.034249, -0.3556835, 0.09911422, 1, 0, 0.8823529, 1,
1.036613, 0.249846, 2.317644, 1, 0, 0.8745098, 1,
1.044952, -0.2953563, 3.351047, 1, 0, 0.8705882, 1,
1.045894, -1.168805, 3.47826, 1, 0, 0.8627451, 1,
1.059988, -1.234704, 2.69289, 1, 0, 0.8588235, 1,
1.060212, -0.9474906, 2.625839, 1, 0, 0.8509804, 1,
1.06821, -0.9111444, 2.264166, 1, 0, 0.8470588, 1,
1.070386, -0.1597764, 1.805811, 1, 0, 0.8392157, 1,
1.087572, 1.447772, 1.855764, 1, 0, 0.8352941, 1,
1.091525, -0.4750328, 1.664412, 1, 0, 0.827451, 1,
1.092814, -0.2763655, 2.965112, 1, 0, 0.8235294, 1,
1.097343, 1.141173, 0.549547, 1, 0, 0.8156863, 1,
1.103331, -0.2774127, 1.528533, 1, 0, 0.8117647, 1,
1.115662, -0.7267237, 1.590132, 1, 0, 0.8039216, 1,
1.117304, -0.6501346, 0.883131, 1, 0, 0.7960784, 1,
1.119063, -0.1297393, 1.420256, 1, 0, 0.7921569, 1,
1.119254, -0.3728722, 1.159786, 1, 0, 0.7843137, 1,
1.12062, 0.36993, -0.1942893, 1, 0, 0.7803922, 1,
1.122971, 0.1615302, -0.004777623, 1, 0, 0.772549, 1,
1.123008, 0.1145694, 0.9404582, 1, 0, 0.7686275, 1,
1.131322, -1.203878, 3.142181, 1, 0, 0.7607843, 1,
1.134309, -0.6800487, 1.843927, 1, 0, 0.7568628, 1,
1.144189, 1.380211, 1.935258, 1, 0, 0.7490196, 1,
1.14873, 1.174763, 0.8337896, 1, 0, 0.7450981, 1,
1.152038, 0.4665878, -0.581679, 1, 0, 0.7372549, 1,
1.160673, -0.01509749, 2.929052, 1, 0, 0.7333333, 1,
1.160909, -0.2316103, 2.938199, 1, 0, 0.7254902, 1,
1.161342, 0.1171067, 3.36825, 1, 0, 0.7215686, 1,
1.166959, -0.8961318, 4.050969, 1, 0, 0.7137255, 1,
1.175866, -1.826025, 3.065431, 1, 0, 0.7098039, 1,
1.185169, -0.7229614, 4.74974, 1, 0, 0.7019608, 1,
1.192461, -0.4263485, 0.3512306, 1, 0, 0.6941177, 1,
1.193561, 1.517307, -0.01839213, 1, 0, 0.6901961, 1,
1.193647, -1.256199, 1.916142, 1, 0, 0.682353, 1,
1.197914, 1.671959, -0.703446, 1, 0, 0.6784314, 1,
1.204792, 0.2428067, 1.460772, 1, 0, 0.6705883, 1,
1.217629, -1.029489, 2.661049, 1, 0, 0.6666667, 1,
1.219156, -0.04563062, 1.966078, 1, 0, 0.6588235, 1,
1.219224, -1.309078, 2.064368, 1, 0, 0.654902, 1,
1.224578, -2.011048, 4.554494, 1, 0, 0.6470588, 1,
1.235512, 0.3749007, 2.363487, 1, 0, 0.6431373, 1,
1.236448, 1.617256, 0.7045348, 1, 0, 0.6352941, 1,
1.236979, 0.4993822, 1.244794, 1, 0, 0.6313726, 1,
1.24146, 0.4340198, 1.01847, 1, 0, 0.6235294, 1,
1.242446, 0.1776159, 1.669091, 1, 0, 0.6196079, 1,
1.244865, -0.3205955, 1.307247, 1, 0, 0.6117647, 1,
1.246143, 1.104351, 1.669952, 1, 0, 0.6078432, 1,
1.246415, -0.4594844, 2.475015, 1, 0, 0.6, 1,
1.252866, 0.8422128, 2.719881, 1, 0, 0.5921569, 1,
1.262415, 2.432386, -0.9275112, 1, 0, 0.5882353, 1,
1.262586, -0.01993654, 0.9251276, 1, 0, 0.5803922, 1,
1.266708, -1.406823, 2.414817, 1, 0, 0.5764706, 1,
1.273896, 1.094772, 1.081971, 1, 0, 0.5686275, 1,
1.280528, 0.5965082, 1.513323, 1, 0, 0.5647059, 1,
1.285406, -0.2196626, 2.042596, 1, 0, 0.5568628, 1,
1.290227, 0.1900443, 0.05582473, 1, 0, 0.5529412, 1,
1.302502, -0.2051541, 1.522492, 1, 0, 0.5450981, 1,
1.302977, 0.6009207, 1.859836, 1, 0, 0.5411765, 1,
1.310599, -2.138929, 0.9118087, 1, 0, 0.5333334, 1,
1.314381, -0.8316996, 1.706823, 1, 0, 0.5294118, 1,
1.321473, 0.002264475, 1.804411, 1, 0, 0.5215687, 1,
1.326815, -0.5556177, -0.3942292, 1, 0, 0.5176471, 1,
1.327653, 1.490743, 1.146534, 1, 0, 0.509804, 1,
1.33214, -1.286078, 3.059281, 1, 0, 0.5058824, 1,
1.335763, 2.654228, 0.3902649, 1, 0, 0.4980392, 1,
1.344866, 0.04439363, 0.8659045, 1, 0, 0.4901961, 1,
1.354923, -1.293438, 1.293348, 1, 0, 0.4862745, 1,
1.355586, -0.244642, 0.7532118, 1, 0, 0.4784314, 1,
1.358093, -1.63793, 1.968794, 1, 0, 0.4745098, 1,
1.368193, 1.968282, 0.8687218, 1, 0, 0.4666667, 1,
1.381409, -0.3013997, 1.581562, 1, 0, 0.4627451, 1,
1.383258, 1.121364, -0.01133164, 1, 0, 0.454902, 1,
1.386678, 0.08086859, 2.604408, 1, 0, 0.4509804, 1,
1.393416, 2.200545, 0.5495888, 1, 0, 0.4431373, 1,
1.394067, -2.010833, 4.518645, 1, 0, 0.4392157, 1,
1.396786, 1.682936, -0.6179355, 1, 0, 0.4313726, 1,
1.417549, 0.3534954, 3.721962, 1, 0, 0.427451, 1,
1.422364, -1.338557, 2.631256, 1, 0, 0.4196078, 1,
1.427375, 0.8446923, -1.424344, 1, 0, 0.4156863, 1,
1.427936, 0.624903, 1.344462, 1, 0, 0.4078431, 1,
1.430901, -0.5241284, 2.229617, 1, 0, 0.4039216, 1,
1.432953, -0.818711, 2.117037, 1, 0, 0.3960784, 1,
1.453166, -0.3567992, 2.016912, 1, 0, 0.3882353, 1,
1.47202, -0.05014221, 2.121868, 1, 0, 0.3843137, 1,
1.480064, 2.193558, 1.355114, 1, 0, 0.3764706, 1,
1.480286, -0.2275124, 1.127744, 1, 0, 0.372549, 1,
1.490388, 0.3128678, 0.07291429, 1, 0, 0.3647059, 1,
1.497252, -0.2617112, 3.616679, 1, 0, 0.3607843, 1,
1.515342, -0.4204329, 2.584071, 1, 0, 0.3529412, 1,
1.53186, -1.571106, 1.799913, 1, 0, 0.3490196, 1,
1.532955, -0.03298858, 2.160703, 1, 0, 0.3411765, 1,
1.54221, 0.7690973, 1.95901, 1, 0, 0.3372549, 1,
1.549304, -0.9269622, 1.305538, 1, 0, 0.3294118, 1,
1.562101, -0.4593679, 2.032336, 1, 0, 0.3254902, 1,
1.567281, -1.602479, 3.237006, 1, 0, 0.3176471, 1,
1.57125, 0.4555503, 1.258077, 1, 0, 0.3137255, 1,
1.572049, -0.5694394, 2.376044, 1, 0, 0.3058824, 1,
1.598047, 0.1013341, 0.6845109, 1, 0, 0.2980392, 1,
1.618216, 1.909268, 0.3833505, 1, 0, 0.2941177, 1,
1.629464, 1.746674, 0.0453146, 1, 0, 0.2862745, 1,
1.643957, 0.268977, 1.983239, 1, 0, 0.282353, 1,
1.645058, 1.521924, 0.6944272, 1, 0, 0.2745098, 1,
1.648902, 0.004523036, 2.115851, 1, 0, 0.2705882, 1,
1.659849, 0.7144296, 1.605598, 1, 0, 0.2627451, 1,
1.667819, -0.5095575, 1.870749, 1, 0, 0.2588235, 1,
1.677517, -1.140164, 3.377482, 1, 0, 0.2509804, 1,
1.678467, 1.094864, 0.8613095, 1, 0, 0.2470588, 1,
1.684903, -0.1266501, 0.2961527, 1, 0, 0.2392157, 1,
1.700325, -0.4633336, 2.664462, 1, 0, 0.2352941, 1,
1.70806, -0.2172637, 0.02736107, 1, 0, 0.227451, 1,
1.73718, -0.5284349, 2.662211, 1, 0, 0.2235294, 1,
1.74254, 0.07306606, 1.870718, 1, 0, 0.2156863, 1,
1.757778, 2.036278, -0.4338312, 1, 0, 0.2117647, 1,
1.758217, -0.7519271, 2.589276, 1, 0, 0.2039216, 1,
1.773137, 1.245712, 1.411017, 1, 0, 0.1960784, 1,
1.774639, -0.3777552, 1.409705, 1, 0, 0.1921569, 1,
1.835769, -0.522909, 0.9041722, 1, 0, 0.1843137, 1,
1.851568, 0.3653335, 2.041008, 1, 0, 0.1803922, 1,
1.867761, -0.5492417, 1.425237, 1, 0, 0.172549, 1,
1.892016, 0.6557437, 0.1853514, 1, 0, 0.1686275, 1,
1.895673, 0.6109275, 2.6816, 1, 0, 0.1607843, 1,
1.960733, -0.5582815, 0.2642468, 1, 0, 0.1568628, 1,
2.056188, 0.05099897, 1.189938, 1, 0, 0.1490196, 1,
2.059221, 0.4304402, 1.674409, 1, 0, 0.145098, 1,
2.066323, -0.8745549, 2.803799, 1, 0, 0.1372549, 1,
2.074581, -0.3849734, 3.490099, 1, 0, 0.1333333, 1,
2.07527, -0.8281185, 0.5042863, 1, 0, 0.1254902, 1,
2.096164, -1.961053, 3.573848, 1, 0, 0.1215686, 1,
2.136647, -1.6566, 0.6546106, 1, 0, 0.1137255, 1,
2.13837, 1.306366, 1.155481, 1, 0, 0.1098039, 1,
2.164809, -0.7548954, 2.775441, 1, 0, 0.1019608, 1,
2.233178, -0.3605532, 0.065419, 1, 0, 0.09411765, 1,
2.233337, -1.531897, 3.457339, 1, 0, 0.09019608, 1,
2.25113, 1.52085, 0.4490408, 1, 0, 0.08235294, 1,
2.254855, -0.1188376, -1.810674, 1, 0, 0.07843138, 1,
2.305482, 0.07332078, 2.672331, 1, 0, 0.07058824, 1,
2.346772, -0.1350297, 1.2085, 1, 0, 0.06666667, 1,
2.356832, 0.3695108, 1.495738, 1, 0, 0.05882353, 1,
2.378167, 0.5392706, 1.206923, 1, 0, 0.05490196, 1,
2.389481, -1.270258, 0.9951891, 1, 0, 0.04705882, 1,
2.393407, 0.04652472, 1.946048, 1, 0, 0.04313726, 1,
2.571559, 2.087205, 0.467523, 1, 0, 0.03529412, 1,
2.591925, -0.2290408, 1.432286, 1, 0, 0.03137255, 1,
2.629792, -1.186783, 2.677895, 1, 0, 0.02352941, 1,
2.753566, -1.603976, 1.454082, 1, 0, 0.01960784, 1,
2.902741, -0.9153906, 2.338224, 1, 0, 0.01176471, 1,
3.109797, 0.1298414, 1.682831, 1, 0, 0.007843138, 1
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
-0.2371593, -3.836011, -6.511307, 0, -0.5, 0.5, 0.5,
-0.2371593, -3.836011, -6.511307, 1, -0.5, 0.5, 0.5,
-0.2371593, -3.836011, -6.511307, 1, 1.5, 0.5, 0.5,
-0.2371593, -3.836011, -6.511307, 0, 1.5, 0.5, 0.5
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
-4.718733, 0.1058998, -6.511307, 0, -0.5, 0.5, 0.5,
-4.718733, 0.1058998, -6.511307, 1, -0.5, 0.5, 0.5,
-4.718733, 0.1058998, -6.511307, 1, 1.5, 0.5, 0.5,
-4.718733, 0.1058998, -6.511307, 0, 1.5, 0.5, 0.5
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
-4.718733, -3.836011, 0.1191146, 0, -0.5, 0.5, 0.5,
-4.718733, -3.836011, 0.1191146, 1, -0.5, 0.5, 0.5,
-4.718733, -3.836011, 0.1191146, 1, 1.5, 0.5, 0.5,
-4.718733, -3.836011, 0.1191146, 0, 1.5, 0.5, 0.5
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
-3, -2.926339, -4.98121,
3, -2.926339, -4.98121,
-3, -2.926339, -4.98121,
-3, -3.077951, -5.236226,
-2, -2.926339, -4.98121,
-2, -3.077951, -5.236226,
-1, -2.926339, -4.98121,
-1, -3.077951, -5.236226,
0, -2.926339, -4.98121,
0, -3.077951, -5.236226,
1, -2.926339, -4.98121,
1, -3.077951, -5.236226,
2, -2.926339, -4.98121,
2, -3.077951, -5.236226,
3, -2.926339, -4.98121,
3, -3.077951, -5.236226
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
-3, -3.381175, -5.746259, 0, -0.5, 0.5, 0.5,
-3, -3.381175, -5.746259, 1, -0.5, 0.5, 0.5,
-3, -3.381175, -5.746259, 1, 1.5, 0.5, 0.5,
-3, -3.381175, -5.746259, 0, 1.5, 0.5, 0.5,
-2, -3.381175, -5.746259, 0, -0.5, 0.5, 0.5,
-2, -3.381175, -5.746259, 1, -0.5, 0.5, 0.5,
-2, -3.381175, -5.746259, 1, 1.5, 0.5, 0.5,
-2, -3.381175, -5.746259, 0, 1.5, 0.5, 0.5,
-1, -3.381175, -5.746259, 0, -0.5, 0.5, 0.5,
-1, -3.381175, -5.746259, 1, -0.5, 0.5, 0.5,
-1, -3.381175, -5.746259, 1, 1.5, 0.5, 0.5,
-1, -3.381175, -5.746259, 0, 1.5, 0.5, 0.5,
0, -3.381175, -5.746259, 0, -0.5, 0.5, 0.5,
0, -3.381175, -5.746259, 1, -0.5, 0.5, 0.5,
0, -3.381175, -5.746259, 1, 1.5, 0.5, 0.5,
0, -3.381175, -5.746259, 0, 1.5, 0.5, 0.5,
1, -3.381175, -5.746259, 0, -0.5, 0.5, 0.5,
1, -3.381175, -5.746259, 1, -0.5, 0.5, 0.5,
1, -3.381175, -5.746259, 1, 1.5, 0.5, 0.5,
1, -3.381175, -5.746259, 0, 1.5, 0.5, 0.5,
2, -3.381175, -5.746259, 0, -0.5, 0.5, 0.5,
2, -3.381175, -5.746259, 1, -0.5, 0.5, 0.5,
2, -3.381175, -5.746259, 1, 1.5, 0.5, 0.5,
2, -3.381175, -5.746259, 0, 1.5, 0.5, 0.5,
3, -3.381175, -5.746259, 0, -0.5, 0.5, 0.5,
3, -3.381175, -5.746259, 1, -0.5, 0.5, 0.5,
3, -3.381175, -5.746259, 1, 1.5, 0.5, 0.5,
3, -3.381175, -5.746259, 0, 1.5, 0.5, 0.5
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
-3.684524, -2, -4.98121,
-3.684524, 3, -4.98121,
-3.684524, -2, -4.98121,
-3.856892, -2, -5.236226,
-3.684524, -1, -4.98121,
-3.856892, -1, -5.236226,
-3.684524, 0, -4.98121,
-3.856892, 0, -5.236226,
-3.684524, 1, -4.98121,
-3.856892, 1, -5.236226,
-3.684524, 2, -4.98121,
-3.856892, 2, -5.236226,
-3.684524, 3, -4.98121,
-3.856892, 3, -5.236226
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
-4.201628, -2, -5.746259, 0, -0.5, 0.5, 0.5,
-4.201628, -2, -5.746259, 1, -0.5, 0.5, 0.5,
-4.201628, -2, -5.746259, 1, 1.5, 0.5, 0.5,
-4.201628, -2, -5.746259, 0, 1.5, 0.5, 0.5,
-4.201628, -1, -5.746259, 0, -0.5, 0.5, 0.5,
-4.201628, -1, -5.746259, 1, -0.5, 0.5, 0.5,
-4.201628, -1, -5.746259, 1, 1.5, 0.5, 0.5,
-4.201628, -1, -5.746259, 0, 1.5, 0.5, 0.5,
-4.201628, 0, -5.746259, 0, -0.5, 0.5, 0.5,
-4.201628, 0, -5.746259, 1, -0.5, 0.5, 0.5,
-4.201628, 0, -5.746259, 1, 1.5, 0.5, 0.5,
-4.201628, 0, -5.746259, 0, 1.5, 0.5, 0.5,
-4.201628, 1, -5.746259, 0, -0.5, 0.5, 0.5,
-4.201628, 1, -5.746259, 1, -0.5, 0.5, 0.5,
-4.201628, 1, -5.746259, 1, 1.5, 0.5, 0.5,
-4.201628, 1, -5.746259, 0, 1.5, 0.5, 0.5,
-4.201628, 2, -5.746259, 0, -0.5, 0.5, 0.5,
-4.201628, 2, -5.746259, 1, -0.5, 0.5, 0.5,
-4.201628, 2, -5.746259, 1, 1.5, 0.5, 0.5,
-4.201628, 2, -5.746259, 0, 1.5, 0.5, 0.5,
-4.201628, 3, -5.746259, 0, -0.5, 0.5, 0.5,
-4.201628, 3, -5.746259, 1, -0.5, 0.5, 0.5,
-4.201628, 3, -5.746259, 1, 1.5, 0.5, 0.5,
-4.201628, 3, -5.746259, 0, 1.5, 0.5, 0.5
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
-3.684524, -2.926339, -4,
-3.684524, -2.926339, 4,
-3.684524, -2.926339, -4,
-3.856892, -3.077951, -4,
-3.684524, -2.926339, -2,
-3.856892, -3.077951, -2,
-3.684524, -2.926339, 0,
-3.856892, -3.077951, 0,
-3.684524, -2.926339, 2,
-3.856892, -3.077951, 2,
-3.684524, -2.926339, 4,
-3.856892, -3.077951, 4
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
-4.201628, -3.381175, -4, 0, -0.5, 0.5, 0.5,
-4.201628, -3.381175, -4, 1, -0.5, 0.5, 0.5,
-4.201628, -3.381175, -4, 1, 1.5, 0.5, 0.5,
-4.201628, -3.381175, -4, 0, 1.5, 0.5, 0.5,
-4.201628, -3.381175, -2, 0, -0.5, 0.5, 0.5,
-4.201628, -3.381175, -2, 1, -0.5, 0.5, 0.5,
-4.201628, -3.381175, -2, 1, 1.5, 0.5, 0.5,
-4.201628, -3.381175, -2, 0, 1.5, 0.5, 0.5,
-4.201628, -3.381175, 0, 0, -0.5, 0.5, 0.5,
-4.201628, -3.381175, 0, 1, -0.5, 0.5, 0.5,
-4.201628, -3.381175, 0, 1, 1.5, 0.5, 0.5,
-4.201628, -3.381175, 0, 0, 1.5, 0.5, 0.5,
-4.201628, -3.381175, 2, 0, -0.5, 0.5, 0.5,
-4.201628, -3.381175, 2, 1, -0.5, 0.5, 0.5,
-4.201628, -3.381175, 2, 1, 1.5, 0.5, 0.5,
-4.201628, -3.381175, 2, 0, 1.5, 0.5, 0.5,
-4.201628, -3.381175, 4, 0, -0.5, 0.5, 0.5,
-4.201628, -3.381175, 4, 1, -0.5, 0.5, 0.5,
-4.201628, -3.381175, 4, 1, 1.5, 0.5, 0.5,
-4.201628, -3.381175, 4, 0, 1.5, 0.5, 0.5
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
-3.684524, -2.926339, -4.98121,
-3.684524, 3.138139, -4.98121,
-3.684524, -2.926339, 5.21944,
-3.684524, 3.138139, 5.21944,
-3.684524, -2.926339, -4.98121,
-3.684524, -2.926339, 5.21944,
-3.684524, 3.138139, -4.98121,
-3.684524, 3.138139, 5.21944,
-3.684524, -2.926339, -4.98121,
3.210205, -2.926339, -4.98121,
-3.684524, -2.926339, 5.21944,
3.210205, -2.926339, 5.21944,
-3.684524, 3.138139, -4.98121,
3.210205, 3.138139, -4.98121,
-3.684524, 3.138139, 5.21944,
3.210205, 3.138139, 5.21944,
3.210205, -2.926339, -4.98121,
3.210205, 3.138139, -4.98121,
3.210205, -2.926339, 5.21944,
3.210205, 3.138139, 5.21944,
3.210205, -2.926339, -4.98121,
3.210205, -2.926339, 5.21944,
3.210205, 3.138139, -4.98121,
3.210205, 3.138139, 5.21944
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
var radius = 7.328743;
var distance = 32.60641;
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
mvMatrix.translate( 0.2371593, -0.1058998, -0.1191146 );
mvMatrix.scale( 1.149281, 1.306622, 0.7768114 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.60641);
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
Disodium_methyl-diox<-read.table("Disodium_methyl-diox.xyz")
```

```
## Error in read.table("Disodium_methyl-diox.xyz"): no lines available in input
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
-3.584115, 1.27032, 0.4768299, 0, 0, 1, 1, 1,
-3.358651, 0.1324775, -1.655358, 1, 0, 0, 1, 1,
-3.229024, 1.640103, -0.8200908, 1, 0, 0, 1, 1,
-2.931479, -0.9786683, -1.344828, 1, 0, 0, 1, 1,
-2.806318, -0.7082291, -2.071791, 1, 0, 0, 1, 1,
-2.721431, 0.2918289, -0.5133188, 1, 0, 0, 1, 1,
-2.581118, 0.6541988, -1.061877, 0, 0, 0, 1, 1,
-2.551838, 0.7140958, -0.4674253, 0, 0, 0, 1, 1,
-2.494358, -0.1539433, -1.719777, 0, 0, 0, 1, 1,
-2.417124, 0.7538979, -3.674928, 0, 0, 0, 1, 1,
-2.328721, -0.2410897, -3.371808, 0, 0, 0, 1, 1,
-2.313895, -1.869328, -2.879122, 0, 0, 0, 1, 1,
-2.312786, -2.431064, -1.682652, 0, 0, 0, 1, 1,
-2.311984, -0.1315934, -2.489069, 1, 1, 1, 1, 1,
-2.295831, 0.5816238, -1.50179, 1, 1, 1, 1, 1,
-2.283706, -1.350989, -1.782581, 1, 1, 1, 1, 1,
-2.215218, 0.4515236, -1.197401, 1, 1, 1, 1, 1,
-2.180865, -0.2049923, -2.090481, 1, 1, 1, 1, 1,
-2.142159, -1.465541, -1.312533, 1, 1, 1, 1, 1,
-2.122484, -0.705, -2.665093, 1, 1, 1, 1, 1,
-2.118395, 0.7252378, -0.4093564, 1, 1, 1, 1, 1,
-2.116625, 0.5327647, 0.1201041, 1, 1, 1, 1, 1,
-2.069424, 1.304191, 1.814133, 1, 1, 1, 1, 1,
-2.012825, 1.319724, -0.9663275, 1, 1, 1, 1, 1,
-1.977403, 0.6957868, -1.984136, 1, 1, 1, 1, 1,
-1.974869, 1.639841, 1.071476, 1, 1, 1, 1, 1,
-1.912765, -1.103944, 1.391671, 1, 1, 1, 1, 1,
-1.883368, -0.6160004, -0.602903, 1, 1, 1, 1, 1,
-1.874203, -0.4031329, -1.234839, 0, 0, 1, 1, 1,
-1.872509, -0.9081314, -2.190443, 1, 0, 0, 1, 1,
-1.842944, -0.8532091, -0.5351376, 1, 0, 0, 1, 1,
-1.816986, 0.8273195, -1.555317, 1, 0, 0, 1, 1,
-1.762067, 1.103384, -1.098504, 1, 0, 0, 1, 1,
-1.752119, -0.08259451, -2.597557, 1, 0, 0, 1, 1,
-1.712895, 1.844804, -0.4564214, 0, 0, 0, 1, 1,
-1.687046, -0.07945681, -0.6924979, 0, 0, 0, 1, 1,
-1.683867, 0.3199942, -2.189342, 0, 0, 0, 1, 1,
-1.656356, -0.5871589, -1.145857, 0, 0, 0, 1, 1,
-1.647168, 0.5606653, -4.308886, 0, 0, 0, 1, 1,
-1.647098, 0.320853, -0.6846517, 0, 0, 0, 1, 1,
-1.640101, 0.5225136, -1.496907, 0, 0, 0, 1, 1,
-1.636221, 0.107678, -0.1596887, 1, 1, 1, 1, 1,
-1.632928, -0.7868518, -1.573339, 1, 1, 1, 1, 1,
-1.631402, 0.7125439, -1.575077, 1, 1, 1, 1, 1,
-1.626805, -0.7092499, -1.163706, 1, 1, 1, 1, 1,
-1.613176, 0.6049264, -1.446167, 1, 1, 1, 1, 1,
-1.599172, 1.070606, -1.013863, 1, 1, 1, 1, 1,
-1.567917, 0.9521696, 0.1389343, 1, 1, 1, 1, 1,
-1.566281, 0.7050059, -2.152842, 1, 1, 1, 1, 1,
-1.563697, 0.5092971, -1.170602, 1, 1, 1, 1, 1,
-1.541455, 0.935098, -0.1087763, 1, 1, 1, 1, 1,
-1.53315, 0.9639024, -1.483657, 1, 1, 1, 1, 1,
-1.526062, 0.6764159, -1.262223, 1, 1, 1, 1, 1,
-1.517178, 0.1351599, -3.295504, 1, 1, 1, 1, 1,
-1.513867, -0.1095751, -3.43235, 1, 1, 1, 1, 1,
-1.511038, 0.2635738, -1.076915, 1, 1, 1, 1, 1,
-1.506748, -0.9112937, -3.036845, 0, 0, 1, 1, 1,
-1.501053, -1.046164, -4.257381, 1, 0, 0, 1, 1,
-1.496258, -0.3117332, -1.883778, 1, 0, 0, 1, 1,
-1.489857, 0.3856049, -1.803275, 1, 0, 0, 1, 1,
-1.487462, -1.411455, -1.91016, 1, 0, 0, 1, 1,
-1.462794, -0.7101284, -1.159566, 1, 0, 0, 1, 1,
-1.458144, -0.5116786, -2.942163, 0, 0, 0, 1, 1,
-1.457642, 0.2579922, -0.6810892, 0, 0, 0, 1, 1,
-1.453794, -0.2215307, -2.229217, 0, 0, 0, 1, 1,
-1.437294, -0.01147968, -1.19987, 0, 0, 0, 1, 1,
-1.428162, 0.5901182, -1.197783, 0, 0, 0, 1, 1,
-1.4101, -2.538244, -1.277749, 0, 0, 0, 1, 1,
-1.393173, 0.494534, -0.8808627, 0, 0, 0, 1, 1,
-1.393066, 1.031515, -1.28064, 1, 1, 1, 1, 1,
-1.392968, 0.6613711, -1.609526, 1, 1, 1, 1, 1,
-1.3862, 0.3843322, 0.186768, 1, 1, 1, 1, 1,
-1.384005, -0.06552061, -1.080017, 1, 1, 1, 1, 1,
-1.379917, 0.2763237, -2.057084, 1, 1, 1, 1, 1,
-1.379629, -1.780201, -2.410386, 1, 1, 1, 1, 1,
-1.377875, 0.005512188, 0.07425937, 1, 1, 1, 1, 1,
-1.376895, 0.07081477, -2.074219, 1, 1, 1, 1, 1,
-1.37462, 0.6870272, -1.559875, 1, 1, 1, 1, 1,
-1.370095, -1.789213, -1.725935, 1, 1, 1, 1, 1,
-1.338017, -0.593551, -2.798447, 1, 1, 1, 1, 1,
-1.33152, 0.4555734, 0.5258169, 1, 1, 1, 1, 1,
-1.325312, 0.4368019, -1.156594, 1, 1, 1, 1, 1,
-1.307174, -0.5618567, -1.81996, 1, 1, 1, 1, 1,
-1.306256, -2.827267, -2.174558, 1, 1, 1, 1, 1,
-1.284091, 0.3157213, 0.4952329, 0, 0, 1, 1, 1,
-1.279548, 1.47984, -0.7090486, 1, 0, 0, 1, 1,
-1.273597, -1.258912, -3.428619, 1, 0, 0, 1, 1,
-1.272324, -0.01390346, -0.7260507, 1, 0, 0, 1, 1,
-1.270041, -2.303631, -2.336594, 1, 0, 0, 1, 1,
-1.269016, 1.383815, -0.6982344, 1, 0, 0, 1, 1,
-1.264365, 1.304054, 1.023816, 0, 0, 0, 1, 1,
-1.26144, 1.069717, 0.5629526, 0, 0, 0, 1, 1,
-1.261114, -0.4649807, -2.476193, 0, 0, 0, 1, 1,
-1.256929, 0.1883566, -1.748909, 0, 0, 0, 1, 1,
-1.254001, 1.598949, -0.6370597, 0, 0, 0, 1, 1,
-1.252089, 1.295689, 1.122577, 0, 0, 0, 1, 1,
-1.245225, -0.227961, -2.13769, 0, 0, 0, 1, 1,
-1.244115, 0.9066438, 0.5964379, 1, 1, 1, 1, 1,
-1.235869, -0.5516002, -1.515544, 1, 1, 1, 1, 1,
-1.23463, 1.418773, -2.177969, 1, 1, 1, 1, 1,
-1.220525, -0.8993151, -3.537213, 1, 1, 1, 1, 1,
-1.218516, 0.2696681, -2.840039, 1, 1, 1, 1, 1,
-1.211578, -1.367005, -2.977603, 1, 1, 1, 1, 1,
-1.18942, -0.2366592, -2.999038, 1, 1, 1, 1, 1,
-1.187614, 1.479131, -0.04525352, 1, 1, 1, 1, 1,
-1.169408, -0.2789014, -1.679055, 1, 1, 1, 1, 1,
-1.162182, 1.662894, -2.07128, 1, 1, 1, 1, 1,
-1.159616, 1.777109, 0.6012143, 1, 1, 1, 1, 1,
-1.155249, -0.8691875, -1.659401, 1, 1, 1, 1, 1,
-1.153995, -0.3780149, -1.61192, 1, 1, 1, 1, 1,
-1.140762, -0.7046453, -3.12437, 1, 1, 1, 1, 1,
-1.135324, 1.839715, -0.7225344, 1, 1, 1, 1, 1,
-1.13428, 1.587034, -1.482661, 0, 0, 1, 1, 1,
-1.132114, 1.335403, -0.3748799, 1, 0, 0, 1, 1,
-1.131887, 0.2948532, -1.43293, 1, 0, 0, 1, 1,
-1.131878, 1.080599, 0.5982388, 1, 0, 0, 1, 1,
-1.128992, -0.4899088, -2.181811, 1, 0, 0, 1, 1,
-1.127798, 2.633213, -0.03192714, 1, 0, 0, 1, 1,
-1.114286, -0.6733353, -4.089577, 0, 0, 0, 1, 1,
-1.110292, -0.5503657, -2.649171, 0, 0, 0, 1, 1,
-1.109351, -0.3023362, -3.066686, 0, 0, 0, 1, 1,
-1.109199, -1.19243, -3.52604, 0, 0, 0, 1, 1,
-1.105902, -1.297865, -2.546216, 0, 0, 0, 1, 1,
-1.101063, -0.7523088, -3.68491, 0, 0, 0, 1, 1,
-1.095603, 1.23716, -1.499411, 0, 0, 0, 1, 1,
-1.095305, -1.355958, -1.169219, 1, 1, 1, 1, 1,
-1.089605, -0.9287401, -0.6744275, 1, 1, 1, 1, 1,
-1.088799, -1.710659, -2.897191, 1, 1, 1, 1, 1,
-1.086179, -0.3718884, -1.025413, 1, 1, 1, 1, 1,
-1.083804, -0.4207847, -1.485596, 1, 1, 1, 1, 1,
-1.078264, -0.08100092, -3.64149, 1, 1, 1, 1, 1,
-1.073803, -1.816823, -1.990025, 1, 1, 1, 1, 1,
-1.068426, -0.3224293, -1.58181, 1, 1, 1, 1, 1,
-1.064452, 0.7109445, -1.462171, 1, 1, 1, 1, 1,
-1.062247, 1.216774, -0.8757184, 1, 1, 1, 1, 1,
-1.061011, -0.1186418, -0.9223936, 1, 1, 1, 1, 1,
-1.05302, -0.122461, -0.9371195, 1, 1, 1, 1, 1,
-1.052207, -0.001103202, -1.012902, 1, 1, 1, 1, 1,
-1.052014, -2.288323, -2.911943, 1, 1, 1, 1, 1,
-1.034358, 0.5707208, -1.299359, 1, 1, 1, 1, 1,
-1.030909, 1.496283, 0.7313249, 0, 0, 1, 1, 1,
-1.029287, 0.5441015, -2.684108, 1, 0, 0, 1, 1,
-1.028544, -1.001778, -2.13934, 1, 0, 0, 1, 1,
-1.026692, -0.4687687, -1.9225, 1, 0, 0, 1, 1,
-1.025627, -0.8362098, -0.5800713, 1, 0, 0, 1, 1,
-1.024034, 0.5318434, -0.4806121, 1, 0, 0, 1, 1,
-1.023705, 0.3099621, -0.8881329, 0, 0, 0, 1, 1,
-1.020224, -0.01514283, 0.2194438, 0, 0, 0, 1, 1,
-1.010452, -1.03706, -0.8124944, 0, 0, 0, 1, 1,
-1.003402, 0.5568919, -2.38772, 0, 0, 0, 1, 1,
-1.000929, 1.47865, -1.300166, 0, 0, 0, 1, 1,
-1.000017, 0.5647027, 0.5883037, 0, 0, 0, 1, 1,
-0.9976248, -0.5055733, -2.264538, 0, 0, 0, 1, 1,
-0.9925122, -0.2969634, -2.898116, 1, 1, 1, 1, 1,
-0.9922805, 0.4965134, -1.444483, 1, 1, 1, 1, 1,
-0.9918442, 0.3630459, -0.8843268, 1, 1, 1, 1, 1,
-0.9916739, -1.446403, -2.317456, 1, 1, 1, 1, 1,
-0.9914989, -1.616749, -2.092656, 1, 1, 1, 1, 1,
-0.9905316, -0.9316648, -2.151005, 1, 1, 1, 1, 1,
-0.9841232, -0.2359997, -1.104822, 1, 1, 1, 1, 1,
-0.9837641, 0.2479455, -0.3054508, 1, 1, 1, 1, 1,
-0.9815891, -0.343918, -2.528952, 1, 1, 1, 1, 1,
-0.9768552, -0.1121664, -0.6886497, 1, 1, 1, 1, 1,
-0.9711639, -0.6848539, -2.216628, 1, 1, 1, 1, 1,
-0.9694296, -0.7871899, -1.800974, 1, 1, 1, 1, 1,
-0.9683114, 0.4811296, -0.4334611, 1, 1, 1, 1, 1,
-0.9679, -1.040483, -2.078576, 1, 1, 1, 1, 1,
-0.9622251, -0.08607241, -1.015599, 1, 1, 1, 1, 1,
-0.9575656, 0.8558578, -1.251154, 0, 0, 1, 1, 1,
-0.9508297, -1.892826, -3.526571, 1, 0, 0, 1, 1,
-0.9484466, -1.258281, -3.935475, 1, 0, 0, 1, 1,
-0.9449366, 0.5356381, 0.04745519, 1, 0, 0, 1, 1,
-0.9420773, -0.3765669, -2.442615, 1, 0, 0, 1, 1,
-0.9419326, -0.0430237, -2.080122, 1, 0, 0, 1, 1,
-0.9341631, 2.3129, -0.2112835, 0, 0, 0, 1, 1,
-0.9331898, 0.2760099, -2.771303, 0, 0, 0, 1, 1,
-0.9328143, -0.6530549, -3.069703, 0, 0, 0, 1, 1,
-0.9272985, -1.20837, -1.86011, 0, 0, 0, 1, 1,
-0.9219545, 2.407187, 0.04010516, 0, 0, 0, 1, 1,
-0.9187222, -2.16252, -2.22885, 0, 0, 0, 1, 1,
-0.9176015, -0.4746905, -0.100942, 0, 0, 0, 1, 1,
-0.9159689, 0.05906152, -1.253045, 1, 1, 1, 1, 1,
-0.9142434, 1.274795, -1.731879, 1, 1, 1, 1, 1,
-0.9130995, 0.8375589, 1.863503, 1, 1, 1, 1, 1,
-0.9103977, -0.7275742, -2.52016, 1, 1, 1, 1, 1,
-0.9083732, 0.7579738, -1.061334, 1, 1, 1, 1, 1,
-0.9065242, 0.8331609, -0.8465034, 1, 1, 1, 1, 1,
-0.9037543, -1.152423, -3.376311, 1, 1, 1, 1, 1,
-0.9024406, -0.701219, -1.016308, 1, 1, 1, 1, 1,
-0.9020138, -0.7527258, -2.247496, 1, 1, 1, 1, 1,
-0.8967294, -0.7783552, -2.14761, 1, 1, 1, 1, 1,
-0.8919092, 0.7395317, -0.4907265, 1, 1, 1, 1, 1,
-0.8909217, -1.017112, -2.918138, 1, 1, 1, 1, 1,
-0.8831665, -0.7296374, -1.6631, 1, 1, 1, 1, 1,
-0.8803855, 2.400585, 0.09324415, 1, 1, 1, 1, 1,
-0.8758401, 1.654956, -0.1920428, 1, 1, 1, 1, 1,
-0.8685966, -0.1974391, -0.8656632, 0, 0, 1, 1, 1,
-0.8676448, -0.4925726, -2.09542, 1, 0, 0, 1, 1,
-0.8654377, 0.3466172, -1.100721, 1, 0, 0, 1, 1,
-0.8573205, 0.2798474, -1.132077, 1, 0, 0, 1, 1,
-0.8375291, 0.08065132, 1.123386, 1, 0, 0, 1, 1,
-0.8373868, 0.381155, -2.295951, 1, 0, 0, 1, 1,
-0.8314416, -1.273351, -0.7350182, 0, 0, 0, 1, 1,
-0.8286604, -1.43622, -2.461707, 0, 0, 0, 1, 1,
-0.827063, 0.3872753, -1.680765, 0, 0, 0, 1, 1,
-0.8232332, 1.071297, -1.589524, 0, 0, 0, 1, 1,
-0.8216947, -0.3203256, -1.679725, 0, 0, 0, 1, 1,
-0.8187836, 0.09339359, 0.1157236, 0, 0, 0, 1, 1,
-0.8162181, -0.8248209, -0.7790232, 0, 0, 0, 1, 1,
-0.8158838, 0.7443672, -1.647127, 1, 1, 1, 1, 1,
-0.8149943, 0.1080709, -1.041137, 1, 1, 1, 1, 1,
-0.8138404, 0.8541404, -3.775265, 1, 1, 1, 1, 1,
-0.8088605, 1.236367, -0.5764591, 1, 1, 1, 1, 1,
-0.7983929, 0.9691902, 0.935128, 1, 1, 1, 1, 1,
-0.7927544, -0.4988202, -0.3911375, 1, 1, 1, 1, 1,
-0.7859948, 0.273622, -1.751486, 1, 1, 1, 1, 1,
-0.7835062, 0.4529336, 0.7333392, 1, 1, 1, 1, 1,
-0.7820714, 0.9109295, -1.482236, 1, 1, 1, 1, 1,
-0.7806014, -0.2412024, -2.223364, 1, 1, 1, 1, 1,
-0.7738711, -0.9288475, -1.149891, 1, 1, 1, 1, 1,
-0.7736608, 0.003399314, -1.797257, 1, 1, 1, 1, 1,
-0.7723453, 1.137097, 0.2151168, 1, 1, 1, 1, 1,
-0.7712954, 0.4823858, -2.804237, 1, 1, 1, 1, 1,
-0.7707224, 0.1919761, -2.63376, 1, 1, 1, 1, 1,
-0.7679784, -0.09161212, -1.167372, 0, 0, 1, 1, 1,
-0.7651361, 1.591333, -2.594337, 1, 0, 0, 1, 1,
-0.7630163, 0.05955349, -3.73154, 1, 0, 0, 1, 1,
-0.7480534, -0.5150786, -0.1043641, 1, 0, 0, 1, 1,
-0.7447549, 1.964663, -0.08711108, 1, 0, 0, 1, 1,
-0.74422, 0.4032433, 0.05473045, 1, 0, 0, 1, 1,
-0.7418849, -0.5231014, -3.106998, 0, 0, 0, 1, 1,
-0.7322786, 1.556947, -1.149596, 0, 0, 0, 1, 1,
-0.7291293, -2.263954, -2.864714, 0, 0, 0, 1, 1,
-0.725715, -0.6369432, -1.825056, 0, 0, 0, 1, 1,
-0.7229114, 1.449935, -1.090986, 0, 0, 0, 1, 1,
-0.7151508, 0.1516207, -2.420545, 0, 0, 0, 1, 1,
-0.7144333, 1.009346, -1.006375, 0, 0, 0, 1, 1,
-0.7135023, -1.492349, -3.175092, 1, 1, 1, 1, 1,
-0.7099307, 0.3959608, -2.720328, 1, 1, 1, 1, 1,
-0.7086079, 1.036966, -2.115724, 1, 1, 1, 1, 1,
-0.7064617, -2.135949, -3.086779, 1, 1, 1, 1, 1,
-0.6984272, -0.04548942, 0.3291256, 1, 1, 1, 1, 1,
-0.6974653, 1.527531, 2.022006, 1, 1, 1, 1, 1,
-0.6973972, 1.090253, 1.379427, 1, 1, 1, 1, 1,
-0.6935277, -0.158062, -2.629027, 1, 1, 1, 1, 1,
-0.6931942, 1.179081, -0.774952, 1, 1, 1, 1, 1,
-0.6927683, -0.4906801, -1.588072, 1, 1, 1, 1, 1,
-0.6920679, -0.2303813, -0.315982, 1, 1, 1, 1, 1,
-0.6834714, 0.7773189, 0.07709336, 1, 1, 1, 1, 1,
-0.6791022, -0.7846857, -2.10707, 1, 1, 1, 1, 1,
-0.6790372, -0.08339355, -2.331798, 1, 1, 1, 1, 1,
-0.6778911, -0.1400139, -1.383441, 1, 1, 1, 1, 1,
-0.67366, -0.313579, -2.2615, 0, 0, 1, 1, 1,
-0.6713778, -1.212197, -2.26907, 1, 0, 0, 1, 1,
-0.6701688, 0.03184298, -1.067656, 1, 0, 0, 1, 1,
-0.6677374, 0.5266055, -1.098854, 1, 0, 0, 1, 1,
-0.6676481, 1.310347, -1.131075, 1, 0, 0, 1, 1,
-0.6653228, 0.8454735, -0.4190118, 1, 0, 0, 1, 1,
-0.6613274, -0.5406466, 0.09436615, 0, 0, 0, 1, 1,
-0.6504121, 0.8376309, -1.866392, 0, 0, 0, 1, 1,
-0.6481022, -0.4693693, -1.748133, 0, 0, 0, 1, 1,
-0.6469702, -0.8263117, -2.820019, 0, 0, 0, 1, 1,
-0.642642, 0.1233838, -1.242748, 0, 0, 0, 1, 1,
-0.6419852, 0.7707304, -0.2449031, 0, 0, 0, 1, 1,
-0.6382007, -0.2449432, -1.987674, 0, 0, 0, 1, 1,
-0.6351554, 0.38229, -2.306085, 1, 1, 1, 1, 1,
-0.6347312, 1.082774, -1.853258, 1, 1, 1, 1, 1,
-0.6329511, 1.784371, -0.9021227, 1, 1, 1, 1, 1,
-0.6321482, -0.155483, -2.443494, 1, 1, 1, 1, 1,
-0.6311218, 1.139049, -0.6179674, 1, 1, 1, 1, 1,
-0.6300895, -0.1056242, -2.832652, 1, 1, 1, 1, 1,
-0.6267253, -0.3944419, -3.340446, 1, 1, 1, 1, 1,
-0.625701, -0.360745, -2.706261, 1, 1, 1, 1, 1,
-0.6242347, -1.475013, -2.616036, 1, 1, 1, 1, 1,
-0.6224367, 0.1694064, -2.79731, 1, 1, 1, 1, 1,
-0.613501, -0.2081065, -0.2968469, 1, 1, 1, 1, 1,
-0.6105526, 0.8488998, -1.388809, 1, 1, 1, 1, 1,
-0.6092019, 2.717566, 0.5636669, 1, 1, 1, 1, 1,
-0.6080652, 1.788781, -1.005806, 1, 1, 1, 1, 1,
-0.6067404, 0.3773896, -0.3501725, 1, 1, 1, 1, 1,
-0.6040706, -2.422386, -2.497805, 0, 0, 1, 1, 1,
-0.6023763, -0.9971551, -2.988856, 1, 0, 0, 1, 1,
-0.6020876, 0.8496516, 0.08844191, 1, 0, 0, 1, 1,
-0.5982766, -0.0005093992, -3.342255, 1, 0, 0, 1, 1,
-0.5914212, 1.678729, -0.6047879, 1, 0, 0, 1, 1,
-0.5899035, 0.8245717, 0.9907549, 1, 0, 0, 1, 1,
-0.5855066, 1.100726, -2.293295, 0, 0, 0, 1, 1,
-0.5834346, -0.0914882, -0.7843721, 0, 0, 0, 1, 1,
-0.5834103, -1.231479, -1.676823, 0, 0, 0, 1, 1,
-0.5784207, -0.3376002, -2.042012, 0, 0, 0, 1, 1,
-0.5782357, -1.49278, -3.529124, 0, 0, 0, 1, 1,
-0.576975, 1.060265, -0.7403453, 0, 0, 0, 1, 1,
-0.574653, -0.3115394, -2.840948, 0, 0, 0, 1, 1,
-0.571693, -0.9048938, -2.478479, 1, 1, 1, 1, 1,
-0.5691897, -0.8185132, -2.38939, 1, 1, 1, 1, 1,
-0.5625325, -1.265842, -3.952083, 1, 1, 1, 1, 1,
-0.5598044, 0.1112508, -1.795169, 1, 1, 1, 1, 1,
-0.5578532, -0.5064186, -2.96167, 1, 1, 1, 1, 1,
-0.5572821, -1.976895, -2.030097, 1, 1, 1, 1, 1,
-0.5571542, 0.3787696, -1.055996, 1, 1, 1, 1, 1,
-0.5569019, 1.388179, -1.49762, 1, 1, 1, 1, 1,
-0.5550244, -1.893902, -1.842869, 1, 1, 1, 1, 1,
-0.5526852, 0.9372129, -1.429404, 1, 1, 1, 1, 1,
-0.5486581, -0.1312297, -0.6230925, 1, 1, 1, 1, 1,
-0.5426126, -0.6719325, -2.720047, 1, 1, 1, 1, 1,
-0.5385922, -0.760601, 0.3116398, 1, 1, 1, 1, 1,
-0.5360662, 1.101019, 1.15089, 1, 1, 1, 1, 1,
-0.5355605, 0.05408343, -2.690888, 1, 1, 1, 1, 1,
-0.5335727, -0.2021164, 0.8031634, 0, 0, 1, 1, 1,
-0.5234662, 0.3488779, -1.6273, 1, 0, 0, 1, 1,
-0.5224241, -0.6551408, -2.758044, 1, 0, 0, 1, 1,
-0.5221887, -0.05022074, -2.763968, 1, 0, 0, 1, 1,
-0.5126598, -0.2240547, -3.371158, 1, 0, 0, 1, 1,
-0.5124656, 1.324932, 0.06812414, 1, 0, 0, 1, 1,
-0.5089236, -0.6855365, 0.3163806, 0, 0, 0, 1, 1,
-0.5077026, 1.484639, 0.2620449, 0, 0, 0, 1, 1,
-0.5076182, -0.6113056, -0.9958676, 0, 0, 0, 1, 1,
-0.5012654, 0.08047037, -0.4905645, 0, 0, 0, 1, 1,
-0.4986356, 0.5970547, -1.155983, 0, 0, 0, 1, 1,
-0.4919831, 0.5247096, 0.5671936, 0, 0, 0, 1, 1,
-0.4896846, 0.03327835, -1.852735, 0, 0, 0, 1, 1,
-0.4887844, 1.005135, -1.385895, 1, 1, 1, 1, 1,
-0.4852642, 0.403117, -2.756954, 1, 1, 1, 1, 1,
-0.4761581, -0.4112786, -2.035464, 1, 1, 1, 1, 1,
-0.4757432, 1.031642, -0.4578415, 1, 1, 1, 1, 1,
-0.4727955, 1.840185, 0.105256, 1, 1, 1, 1, 1,
-0.4727783, 1.719587, -1.061066, 1, 1, 1, 1, 1,
-0.4689232, 1.517312, -0.5495414, 1, 1, 1, 1, 1,
-0.4659706, 0.1916211, 0.3711365, 1, 1, 1, 1, 1,
-0.4630063, -0.1688353, -3.072699, 1, 1, 1, 1, 1,
-0.456449, 0.6014637, 0.4684235, 1, 1, 1, 1, 1,
-0.4560109, 0.6291494, 0.6879318, 1, 1, 1, 1, 1,
-0.4479719, 0.2371796, -2.252328, 1, 1, 1, 1, 1,
-0.4415337, -1.037889, -3.035527, 1, 1, 1, 1, 1,
-0.4382968, -0.5152205, -1.65218, 1, 1, 1, 1, 1,
-0.4372548, -0.9993767, -4.307796, 1, 1, 1, 1, 1,
-0.4353564, 0.625834, -1.569137, 0, 0, 1, 1, 1,
-0.4332045, -0.959563, -3.726094, 1, 0, 0, 1, 1,
-0.4260984, 0.9865637, -1.138656, 1, 0, 0, 1, 1,
-0.4259188, -0.07605865, 0.7340165, 1, 0, 0, 1, 1,
-0.4230182, 1.853731, -1.382201, 1, 0, 0, 1, 1,
-0.4225075, 1.448124, -1.815203, 1, 0, 0, 1, 1,
-0.4221773, 0.08533923, -3.266823, 0, 0, 0, 1, 1,
-0.4203089, -0.2402869, -3.041493, 0, 0, 0, 1, 1,
-0.4200396, -0.9288538, -3.186121, 0, 0, 0, 1, 1,
-0.4200227, -0.5683042, -3.054711, 0, 0, 0, 1, 1,
-0.4162264, -0.3913786, -2.844665, 0, 0, 0, 1, 1,
-0.4112532, -1.171693, -4.131498, 0, 0, 0, 1, 1,
-0.4105727, 1.639994, -2.048636, 0, 0, 0, 1, 1,
-0.4043076, 0.944146, -0.7041481, 1, 1, 1, 1, 1,
-0.3930838, -1.899229, -3.382989, 1, 1, 1, 1, 1,
-0.3927546, 0.4012192, -2.720241, 1, 1, 1, 1, 1,
-0.3923089, 1.35206, -0.02141762, 1, 1, 1, 1, 1,
-0.3917984, -0.1005967, -1.473031, 1, 1, 1, 1, 1,
-0.3911846, 1.052938, -1.06542, 1, 1, 1, 1, 1,
-0.3885967, -1.127034, -2.857537, 1, 1, 1, 1, 1,
-0.3842693, -0.1386922, -2.088843, 1, 1, 1, 1, 1,
-0.3811364, 1.16669, -1.040395, 1, 1, 1, 1, 1,
-0.3803317, -1.608516, -3.364028, 1, 1, 1, 1, 1,
-0.3788732, -0.3251477, -1.025558, 1, 1, 1, 1, 1,
-0.3778036, -0.9804649, -2.182658, 1, 1, 1, 1, 1,
-0.376843, 0.7918172, 0.1308205, 1, 1, 1, 1, 1,
-0.3767259, -1.922776, -4.102018, 1, 1, 1, 1, 1,
-0.3753152, -0.2034359, -1.627276, 1, 1, 1, 1, 1,
-0.3741923, -0.6117612, -3.055012, 0, 0, 1, 1, 1,
-0.3718275, -0.2967288, -2.415723, 1, 0, 0, 1, 1,
-0.3707325, -1.343019, -3.838997, 1, 0, 0, 1, 1,
-0.3683127, 0.06796206, -1.178606, 1, 0, 0, 1, 1,
-0.3617908, 0.3888832, -0.9679397, 1, 0, 0, 1, 1,
-0.3603357, -0.8988322, -3.609024, 1, 0, 0, 1, 1,
-0.3598331, -0.2856576, -2.324663, 0, 0, 0, 1, 1,
-0.3533108, -0.6583709, -3.038611, 0, 0, 0, 1, 1,
-0.3505082, 1.069292, 1.022267, 0, 0, 0, 1, 1,
-0.3464225, 1.233231, -1.943374, 0, 0, 0, 1, 1,
-0.3448404, 0.1008126, -1.036891, 0, 0, 0, 1, 1,
-0.3321262, 1.310973, -0.2407957, 0, 0, 0, 1, 1,
-0.3313238, -0.2943612, -1.841368, 0, 0, 0, 1, 1,
-0.3259574, 1.238032, -0.01191768, 1, 1, 1, 1, 1,
-0.3235226, 0.8845121, 1.565515, 1, 1, 1, 1, 1,
-0.3195505, 0.9511713, -1.232499, 1, 1, 1, 1, 1,
-0.3179032, 0.7539692, 0.8296626, 1, 1, 1, 1, 1,
-0.31654, -0.02454147, 0.2129868, 1, 1, 1, 1, 1,
-0.3106332, -0.09150949, -1.892318, 1, 1, 1, 1, 1,
-0.306089, 0.3502167, -0.3905075, 1, 1, 1, 1, 1,
-0.301336, -0.4150641, -3.324309, 1, 1, 1, 1, 1,
-0.2927434, -1.258545, -3.197283, 1, 1, 1, 1, 1,
-0.2901414, -1.052744, -2.876827, 1, 1, 1, 1, 1,
-0.289099, -0.7657903, -2.016989, 1, 1, 1, 1, 1,
-0.2880177, 1.527467, 0.4756386, 1, 1, 1, 1, 1,
-0.2879031, 0.1948504, -0.1921478, 1, 1, 1, 1, 1,
-0.2859901, -1.684123, -2.554949, 1, 1, 1, 1, 1,
-0.2852178, 2.771009, 0.2726841, 1, 1, 1, 1, 1,
-0.2838547, -0.4547854, -2.524014, 0, 0, 1, 1, 1,
-0.2809904, 0.9807909, 0.1338597, 1, 0, 0, 1, 1,
-0.2775034, -0.08899074, -0.5384549, 1, 0, 0, 1, 1,
-0.2752475, -0.9861493, -3.402959, 1, 0, 0, 1, 1,
-0.2671927, -0.02225876, -2.571387, 1, 0, 0, 1, 1,
-0.264519, 0.5157779, 1.4583, 1, 0, 0, 1, 1,
-0.2638904, -0.2178283, -1.221491, 0, 0, 0, 1, 1,
-0.2629361, -1.476851, -3.522688, 0, 0, 0, 1, 1,
-0.2600354, 0.363397, -0.2627299, 0, 0, 0, 1, 1,
-0.2573232, -1.436844, -3.428068, 0, 0, 0, 1, 1,
-0.2555061, 0.8266194, 0.524392, 0, 0, 0, 1, 1,
-0.2517541, 0.6049554, 0.6671292, 0, 0, 0, 1, 1,
-0.2505135, -0.3675822, -1.848653, 0, 0, 0, 1, 1,
-0.2446936, -1.810355, -4.317307, 1, 1, 1, 1, 1,
-0.243802, 2.606232, 0.8032929, 1, 1, 1, 1, 1,
-0.2387233, -0.1527675, -2.848464, 1, 1, 1, 1, 1,
-0.2382821, -1.439789, -3.708673, 1, 1, 1, 1, 1,
-0.2316828, 1.321095, -1.458953, 1, 1, 1, 1, 1,
-0.229169, -0.2039703, -1.013595, 1, 1, 1, 1, 1,
-0.2289681, -0.363782, -2.626589, 1, 1, 1, 1, 1,
-0.2245436, 0.07047442, -2.778983, 1, 1, 1, 1, 1,
-0.2228213, -2.597962, -3.401498, 1, 1, 1, 1, 1,
-0.2217534, -1.218676, -3.71338, 1, 1, 1, 1, 1,
-0.2191677, 0.2811185, -3.236366, 1, 1, 1, 1, 1,
-0.2163051, -0.5908476, -1.927309, 1, 1, 1, 1, 1,
-0.2161317, -0.2740843, -2.973888, 1, 1, 1, 1, 1,
-0.2141289, 0.9771959, -0.9160154, 1, 1, 1, 1, 1,
-0.2121903, 2.892157, -1.123566, 1, 1, 1, 1, 1,
-0.2117456, -2.352128, -0.265845, 0, 0, 1, 1, 1,
-0.2088086, -1.159427, -1.931218, 1, 0, 0, 1, 1,
-0.2064009, 0.1954719, -1.843748, 1, 0, 0, 1, 1,
-0.2062365, -2.615549, -3.859318, 1, 0, 0, 1, 1,
-0.2047382, 0.02524028, -1.092048, 1, 0, 0, 1, 1,
-0.2026103, -0.7724954, -2.531739, 1, 0, 0, 1, 1,
-0.1997035, 0.1200701, 1.082529, 0, 0, 0, 1, 1,
-0.1990504, 0.7727685, -0.5988712, 0, 0, 0, 1, 1,
-0.1989127, -1.271763, -2.895532, 0, 0, 0, 1, 1,
-0.1975858, -0.558741, -3.556274, 0, 0, 0, 1, 1,
-0.1949935, -0.1104516, -3.126502, 0, 0, 0, 1, 1,
-0.1930074, -0.4912736, -3.709385, 0, 0, 0, 1, 1,
-0.1880079, 1.671828, -0.3159709, 0, 0, 0, 1, 1,
-0.182414, 0.3518773, -0.0106032, 1, 1, 1, 1, 1,
-0.1800835, 0.3833004, -0.9543282, 1, 1, 1, 1, 1,
-0.1761491, -0.3082358, -3.947593, 1, 1, 1, 1, 1,
-0.1749767, -0.1285058, -2.912257, 1, 1, 1, 1, 1,
-0.1731804, -0.2036877, -1.62905, 1, 1, 1, 1, 1,
-0.170876, -0.7146677, -1.553351, 1, 1, 1, 1, 1,
-0.1678613, -0.2105659, -3.195162, 1, 1, 1, 1, 1,
-0.1648343, -0.3434654, -0.6146947, 1, 1, 1, 1, 1,
-0.1612368, 0.01874056, -2.986967, 1, 1, 1, 1, 1,
-0.1588792, -0.7535218, -1.940422, 1, 1, 1, 1, 1,
-0.1562034, 1.806185, 1.67018, 1, 1, 1, 1, 1,
-0.1488394, -1.252308, -3.504877, 1, 1, 1, 1, 1,
-0.147413, 1.572375, -0.714989, 1, 1, 1, 1, 1,
-0.1468976, -0.5299996, -2.07655, 1, 1, 1, 1, 1,
-0.1460735, 0.1766317, -0.5892054, 1, 1, 1, 1, 1,
-0.1458234, 1.120478, -0.1105018, 0, 0, 1, 1, 1,
-0.1431442, 0.9400191, -1.774926, 1, 0, 0, 1, 1,
-0.1429633, -0.06249764, -2.814936, 1, 0, 0, 1, 1,
-0.141803, 0.8042595, 0.6306257, 1, 0, 0, 1, 1,
-0.140691, -1.00655, -4.241008, 1, 0, 0, 1, 1,
-0.1336618, -1.581114, -2.996833, 1, 0, 0, 1, 1,
-0.1334579, -0.1375609, -2.340201, 0, 0, 0, 1, 1,
-0.1247535, -0.05695018, -2.688684, 0, 0, 0, 1, 1,
-0.1242474, -0.5403158, -3.676262, 0, 0, 0, 1, 1,
-0.1228098, 0.2525061, -0.7321491, 0, 0, 0, 1, 1,
-0.1225921, -1.970014, -4.0267, 0, 0, 0, 1, 1,
-0.1223673, -1.317378, -3.109004, 0, 0, 0, 1, 1,
-0.120948, 0.01347746, -2.076586, 0, 0, 0, 1, 1,
-0.120195, 0.4151328, 0.3772041, 1, 1, 1, 1, 1,
-0.120132, 0.7400607, 0.2660773, 1, 1, 1, 1, 1,
-0.1196724, 1.367211, 0.358114, 1, 1, 1, 1, 1,
-0.1088029, 1.093828, -0.7041603, 1, 1, 1, 1, 1,
-0.1064081, -0.2682572, -4.832657, 1, 1, 1, 1, 1,
-0.1032502, 0.7272701, 0.8116311, 1, 1, 1, 1, 1,
-0.1013306, 0.7648324, 0.294219, 1, 1, 1, 1, 1,
-0.09844203, 1.775079, 1.265917, 1, 1, 1, 1, 1,
-0.09691262, -0.6157327, -4.194182, 1, 1, 1, 1, 1,
-0.09658231, 0.879164, -1.758654, 1, 1, 1, 1, 1,
-0.09446356, 0.7816975, 0.1122038, 1, 1, 1, 1, 1,
-0.0926929, 0.8961712, 0.01137777, 1, 1, 1, 1, 1,
-0.08676533, 0.703055, -2.65038, 1, 1, 1, 1, 1,
-0.08587486, -1.073667, -1.586962, 1, 1, 1, 1, 1,
-0.07762641, 1.503487, 0.0215904, 1, 1, 1, 1, 1,
-0.07207789, -0.1868588, -1.127051, 0, 0, 1, 1, 1,
-0.06608646, -0.9498157, -2.860544, 1, 0, 0, 1, 1,
-0.06571686, -0.1202088, -4.183755, 1, 0, 0, 1, 1,
-0.06266849, 0.1000576, 0.977016, 1, 0, 0, 1, 1,
-0.06032773, -0.7506083, -3.669024, 1, 0, 0, 1, 1,
-0.05813294, -0.891309, -2.323607, 1, 0, 0, 1, 1,
-0.05684993, -1.897017, -1.765259, 0, 0, 0, 1, 1,
-0.0553721, 1.981522, 0.9665198, 0, 0, 0, 1, 1,
-0.05057739, 0.397965, -0.9682827, 0, 0, 0, 1, 1,
-0.04711715, -0.8696263, -2.134175, 0, 0, 0, 1, 1,
-0.04512723, 0.004228101, -1.050104, 0, 0, 0, 1, 1,
-0.0420136, 0.7304235, -0.3151576, 0, 0, 0, 1, 1,
-0.04036778, -1.508475, -3.344741, 0, 0, 0, 1, 1,
-0.04034067, 1.370548, -1.643256, 1, 1, 1, 1, 1,
-0.03531524, -0.4192424, -3.222298, 1, 1, 1, 1, 1,
-0.0316742, -0.9676717, -3.407451, 1, 1, 1, 1, 1,
-0.02991428, 1.711483, -1.259479, 1, 1, 1, 1, 1,
-0.02765411, 1.106259, 1.795733, 1, 1, 1, 1, 1,
-0.01810958, 1.981136, -1.052857, 1, 1, 1, 1, 1,
-0.0162075, -0.7739301, -2.435199, 1, 1, 1, 1, 1,
-0.004750801, 0.2147001, -0.5895912, 1, 1, 1, 1, 1,
-0.002269819, -0.07452768, -1.2746, 1, 1, 1, 1, 1,
0.0008409821, 1.732997, -1.088219, 1, 1, 1, 1, 1,
0.0009587171, 0.5789838, -0.135045, 1, 1, 1, 1, 1,
0.004072108, -0.2026849, 3.821414, 1, 1, 1, 1, 1,
0.01155531, 1.195096, -1.923446, 1, 1, 1, 1, 1,
0.01350883, -0.6865873, 3.972759, 1, 1, 1, 1, 1,
0.01507442, -0.2407705, 2.443122, 1, 1, 1, 1, 1,
0.01709033, 2.232469, -0.5952805, 0, 0, 1, 1, 1,
0.01763397, -0.8185264, 2.261835, 1, 0, 0, 1, 1,
0.02083212, -0.3968271, 3.421239, 1, 0, 0, 1, 1,
0.02199917, -0.4045752, 2.450681, 1, 0, 0, 1, 1,
0.03311079, -0.1724997, 2.761201, 1, 0, 0, 1, 1,
0.03705678, 1.681963, -1.965623, 1, 0, 0, 1, 1,
0.0387341, 0.05813003, -0.03031175, 0, 0, 0, 1, 1,
0.04397039, -1.050238, 4.190162, 0, 0, 0, 1, 1,
0.04766147, -0.9402483, 2.572266, 0, 0, 0, 1, 1,
0.04893588, 1.200046, 0.1598361, 0, 0, 0, 1, 1,
0.04999525, -0.04179493, 3.499811, 0, 0, 0, 1, 1,
0.05689547, -0.3949638, 2.652777, 0, 0, 0, 1, 1,
0.05690155, -0.6425207, 3.686784, 0, 0, 0, 1, 1,
0.05811562, 0.335076, 0.1621387, 1, 1, 1, 1, 1,
0.06116518, -1.728612, 1.68419, 1, 1, 1, 1, 1,
0.0613742, -1.237658, 3.560812, 1, 1, 1, 1, 1,
0.06895743, -0.3899148, 1.567402, 1, 1, 1, 1, 1,
0.06964529, 1.733882, 0.9834788, 1, 1, 1, 1, 1,
0.0705513, -0.6326217, 4.890183, 1, 1, 1, 1, 1,
0.07447694, 1.224433, -1.678882, 1, 1, 1, 1, 1,
0.07468345, -1.212095, 5.070886, 1, 1, 1, 1, 1,
0.07677713, -0.9386135, 2.471442, 1, 1, 1, 1, 1,
0.07755475, 0.8301267, 0.7897155, 1, 1, 1, 1, 1,
0.08133328, -0.8967878, 0.7977495, 1, 1, 1, 1, 1,
0.09063356, -0.7838485, 3.135068, 1, 1, 1, 1, 1,
0.09202846, -0.6902323, 4.283836, 1, 1, 1, 1, 1,
0.09524911, 0.7415492, 2.136806, 1, 1, 1, 1, 1,
0.1030509, -0.7538826, 2.827822, 1, 1, 1, 1, 1,
0.1056466, -0.3720957, 2.498256, 0, 0, 1, 1, 1,
0.1074024, -0.5403286, 3.922055, 1, 0, 0, 1, 1,
0.1110347, 1.105461, -0.2229816, 1, 0, 0, 1, 1,
0.1136982, -0.6369351, 3.249015, 1, 0, 0, 1, 1,
0.1142981, 0.4900393, -0.4217083, 1, 0, 0, 1, 1,
0.1145683, 0.6214594, 0.9994104, 1, 0, 0, 1, 1,
0.1172235, 1.512838, 0.3197983, 0, 0, 0, 1, 1,
0.1218932, -1.479469, 3.613878, 0, 0, 0, 1, 1,
0.1224663, -0.5028983, 4.453056, 0, 0, 0, 1, 1,
0.1229217, -1.09477, 3.52669, 0, 0, 0, 1, 1,
0.1241278, 0.271459, -0.4116069, 0, 0, 0, 1, 1,
0.1246479, 0.3735647, 0.3698287, 0, 0, 0, 1, 1,
0.1259896, 0.2098226, -0.3223252, 0, 0, 0, 1, 1,
0.1261534, -0.627522, 4.509946, 1, 1, 1, 1, 1,
0.1262333, -0.9470558, 3.445263, 1, 1, 1, 1, 1,
0.1266097, -0.3422382, 2.713316, 1, 1, 1, 1, 1,
0.1297792, -0.5089287, 3.191902, 1, 1, 1, 1, 1,
0.1321807, 1.98973, 0.5970768, 1, 1, 1, 1, 1,
0.1328454, -0.6357707, 3.754698, 1, 1, 1, 1, 1,
0.1355282, -1.967871, 2.247221, 1, 1, 1, 1, 1,
0.137537, 0.09202372, 0.9031358, 1, 1, 1, 1, 1,
0.1384898, -0.2117247, 4.098399, 1, 1, 1, 1, 1,
0.1436466, 0.2902097, -0.918234, 1, 1, 1, 1, 1,
0.143839, 2.125309, 0.4247179, 1, 1, 1, 1, 1,
0.1476569, 0.761344, 0.9428512, 1, 1, 1, 1, 1,
0.1562183, 0.1667387, 0.4365608, 1, 1, 1, 1, 1,
0.1569918, 0.8322926, 1.584303, 1, 1, 1, 1, 1,
0.160458, 1.046207, 0.5373434, 1, 1, 1, 1, 1,
0.161729, -0.9579428, 2.658288, 0, 0, 1, 1, 1,
0.1619888, -0.8664936, 3.099274, 1, 0, 0, 1, 1,
0.1629935, -2.289096, 2.834851, 1, 0, 0, 1, 1,
0.1633624, -1.585172, 1.386105, 1, 0, 0, 1, 1,
0.1719378, -0.3257455, 2.360947, 1, 0, 0, 1, 1,
0.1738594, -0.1204711, 2.082558, 1, 0, 0, 1, 1,
0.174795, -2.838022, 3.363369, 0, 0, 0, 1, 1,
0.1767373, 1.186727, -0.4199669, 0, 0, 0, 1, 1,
0.180905, -0.1537849, 1.297342, 0, 0, 0, 1, 1,
0.1827467, -1.143401, 1.873014, 0, 0, 0, 1, 1,
0.1877356, -0.01148143, 1.345682, 0, 0, 0, 1, 1,
0.1889907, -1.534632, 4.050465, 0, 0, 0, 1, 1,
0.1890794, 0.3514069, 1.177462, 0, 0, 0, 1, 1,
0.1915181, -0.1113001, 1.220148, 1, 1, 1, 1, 1,
0.1921973, -2.224849, 2.419336, 1, 1, 1, 1, 1,
0.1929067, 0.712132, 2.095337, 1, 1, 1, 1, 1,
0.1938272, -1.022372, 2.963889, 1, 1, 1, 1, 1,
0.1987553, 0.5745842, 0.2317736, 1, 1, 1, 1, 1,
0.2017162, 0.1781922, -0.1797221, 1, 1, 1, 1, 1,
0.2056836, 0.1174559, -0.04017309, 1, 1, 1, 1, 1,
0.2075437, -1.440079, 1.249233, 1, 1, 1, 1, 1,
0.208862, 2.596727, -0.640234, 1, 1, 1, 1, 1,
0.210681, 0.3798467, 2.136408, 1, 1, 1, 1, 1,
0.2147147, -0.2852295, 2.068907, 1, 1, 1, 1, 1,
0.2154138, 0.2195251, 1.428989, 1, 1, 1, 1, 1,
0.2198294, 1.302875, 0.7306685, 1, 1, 1, 1, 1,
0.2203865, 0.5205706, -0.2556495, 1, 1, 1, 1, 1,
0.2264334, -0.3661603, 3.154809, 1, 1, 1, 1, 1,
0.2272725, 0.6654946, 0.5482835, 0, 0, 1, 1, 1,
0.2317563, 0.424886, 0.1784419, 1, 0, 0, 1, 1,
0.2370234, 0.2998397, -0.1088351, 1, 0, 0, 1, 1,
0.2384559, 1.122251, 1.667303, 1, 0, 0, 1, 1,
0.2389491, 0.4448578, 0.5722402, 1, 0, 0, 1, 1,
0.2390333, -0.4134413, 1.287319, 1, 0, 0, 1, 1,
0.2419429, -0.2439323, 2.489077, 0, 0, 0, 1, 1,
0.2449139, -0.5481565, 2.930594, 0, 0, 0, 1, 1,
0.2463506, -0.875571, 3.16101, 0, 0, 0, 1, 1,
0.2502921, -0.38137, 2.923824, 0, 0, 0, 1, 1,
0.2512217, -0.4841792, 2.107732, 0, 0, 0, 1, 1,
0.2524665, 1.691392, -0.5121706, 0, 0, 0, 1, 1,
0.257337, 0.05895296, 1.987982, 0, 0, 0, 1, 1,
0.2635138, 1.110144, -0.7570138, 1, 1, 1, 1, 1,
0.2704724, 0.5225692, -0.08854278, 1, 1, 1, 1, 1,
0.2727033, 0.5223321, 1.209262, 1, 1, 1, 1, 1,
0.273029, 0.863534, 0.05521112, 1, 1, 1, 1, 1,
0.2756578, -0.5313213, 3.888366, 1, 1, 1, 1, 1,
0.2763374, 2.548388, -0.7254475, 1, 1, 1, 1, 1,
0.2847497, -1.105005, 0.9168624, 1, 1, 1, 1, 1,
0.2866682, 0.8708931, 0.935602, 1, 1, 1, 1, 1,
0.2867729, -0.371325, 2.16234, 1, 1, 1, 1, 1,
0.2878073, 1.246052, -0.4905208, 1, 1, 1, 1, 1,
0.2878729, 0.6639585, 0.5224271, 1, 1, 1, 1, 1,
0.2928059, 0.03945713, 1.476326, 1, 1, 1, 1, 1,
0.2937035, -0.6091761, 1.105766, 1, 1, 1, 1, 1,
0.2979988, -0.9021884, 2.690704, 1, 1, 1, 1, 1,
0.2985266, 0.2591085, -0.04798449, 1, 1, 1, 1, 1,
0.3018441, -1.014237, 2.105424, 0, 0, 1, 1, 1,
0.3037181, 0.07164694, 2.028171, 1, 0, 0, 1, 1,
0.3076726, -0.6297707, 3.618856, 1, 0, 0, 1, 1,
0.3078784, 0.2204457, 4.075167, 1, 0, 0, 1, 1,
0.3092456, 0.5312594, 0.4621816, 1, 0, 0, 1, 1,
0.312358, 1.392384, 2.148447, 1, 0, 0, 1, 1,
0.3177362, -1.404038, 2.109211, 0, 0, 0, 1, 1,
0.3208455, 1.096061, 1.051047, 0, 0, 0, 1, 1,
0.3249273, 0.251918, 0.7989694, 0, 0, 0, 1, 1,
0.3255818, 0.4664778, 2.205219, 0, 0, 0, 1, 1,
0.3258481, 0.05701884, 0.06629653, 0, 0, 0, 1, 1,
0.3359859, -1.341674, 2.296856, 0, 0, 0, 1, 1,
0.3360878, 0.2471168, 0.9726895, 0, 0, 0, 1, 1,
0.3372578, 1.591909, 0.2218159, 1, 1, 1, 1, 1,
0.3380542, -0.7813424, 2.59965, 1, 1, 1, 1, 1,
0.3417341, -0.5466285, 3.603336, 1, 1, 1, 1, 1,
0.3447263, -1.103258, 2.535601, 1, 1, 1, 1, 1,
0.3467036, 0.7147919, -0.6638334, 1, 1, 1, 1, 1,
0.3501258, 1.442017, 1.066109, 1, 1, 1, 1, 1,
0.3512098, -0.02023167, 1.084816, 1, 1, 1, 1, 1,
0.3529108, 0.1701631, 1.405309, 1, 1, 1, 1, 1,
0.3531546, -0.3213992, 1.86103, 1, 1, 1, 1, 1,
0.3553089, 0.1890488, 1.048141, 1, 1, 1, 1, 1,
0.3574484, 0.4122745, 0.9035543, 1, 1, 1, 1, 1,
0.3599734, 0.4622168, 0.53749, 1, 1, 1, 1, 1,
0.3602257, 0.8955741, 0.4104401, 1, 1, 1, 1, 1,
0.3630427, 0.6701962, 0.6107137, 1, 1, 1, 1, 1,
0.3648824, -1.964598, 2.438062, 1, 1, 1, 1, 1,
0.3686268, -0.4582237, 2.256095, 0, 0, 1, 1, 1,
0.3686558, 1.458017, 2.168799, 1, 0, 0, 1, 1,
0.3694634, -1.391496, 1.647487, 1, 0, 0, 1, 1,
0.3701459, -0.4244904, 2.84418, 1, 0, 0, 1, 1,
0.3746237, 0.2468541, 1.153584, 1, 0, 0, 1, 1,
0.376958, 0.6023901, 1.444369, 1, 0, 0, 1, 1,
0.3803956, 0.1712248, 1.504965, 0, 0, 0, 1, 1,
0.3833714, 0.8346968, 2.490451, 0, 0, 0, 1, 1,
0.3834305, 0.181046, 2.606168, 0, 0, 0, 1, 1,
0.3873823, 0.7301332, -0.4425588, 0, 0, 0, 1, 1,
0.3904809, -1.710833, 1.801094, 0, 0, 0, 1, 1,
0.3916711, 0.5785707, 0.07682861, 0, 0, 0, 1, 1,
0.3920327, 1.520989, 0.6793493, 0, 0, 0, 1, 1,
0.3964849, -0.4859164, 0.6929345, 1, 1, 1, 1, 1,
0.3991172, -0.7944665, 2.66514, 1, 1, 1, 1, 1,
0.3994892, 0.2355359, 1.244131, 1, 1, 1, 1, 1,
0.4009203, 0.79984, 1.324872, 1, 1, 1, 1, 1,
0.4041879, -0.7567558, -0.1171096, 1, 1, 1, 1, 1,
0.4065694, 0.06084139, 2.022282, 1, 1, 1, 1, 1,
0.4082373, -2.184255, 1.46523, 1, 1, 1, 1, 1,
0.4085119, -0.9302476, 4.58057, 1, 1, 1, 1, 1,
0.4151566, -0.7557435, 2.933919, 1, 1, 1, 1, 1,
0.4158528, -0.1182175, 3.213045, 1, 1, 1, 1, 1,
0.4204936, 1.693939, 0.8276665, 1, 1, 1, 1, 1,
0.4212952, -1.237557, 3.263322, 1, 1, 1, 1, 1,
0.4248289, 0.2187369, -0.03376566, 1, 1, 1, 1, 1,
0.4249313, 0.625991, 0.3780583, 1, 1, 1, 1, 1,
0.4291722, -0.3998094, 2.266922, 1, 1, 1, 1, 1,
0.4311364, -0.8935173, 1.993849, 0, 0, 1, 1, 1,
0.4350782, -0.494203, 3.684864, 1, 0, 0, 1, 1,
0.4370396, -1.408828, 2.313505, 1, 0, 0, 1, 1,
0.4396641, -1.709479, 3.045267, 1, 0, 0, 1, 1,
0.4441271, -1.142923, 2.288234, 1, 0, 0, 1, 1,
0.4513419, 0.3571234, 0.7424794, 1, 0, 0, 1, 1,
0.4531479, -0.2900653, 0.7928417, 0, 0, 0, 1, 1,
0.4536199, 0.3416436, 0.8270593, 0, 0, 0, 1, 1,
0.4554158, 0.134361, 0.4206344, 0, 0, 0, 1, 1,
0.4585009, -1.008814, 2.146574, 0, 0, 0, 1, 1,
0.4586572, 3.049821, 0.2539149, 0, 0, 0, 1, 1,
0.4618559, -0.5359969, 2.757606, 0, 0, 0, 1, 1,
0.4620058, -0.04448668, 3.346392, 0, 0, 0, 1, 1,
0.4688329, 0.5057445, 0.3888036, 1, 1, 1, 1, 1,
0.4761228, 0.4212267, 0.7376206, 1, 1, 1, 1, 1,
0.4812199, -2.325332, 3.591964, 1, 1, 1, 1, 1,
0.4882115, -1.669959, 2.293076, 1, 1, 1, 1, 1,
0.4899831, 0.442196, 2.117612, 1, 1, 1, 1, 1,
0.5010888, -0.3375433, 1.842134, 1, 1, 1, 1, 1,
0.5032125, -0.5340973, 3.520232, 1, 1, 1, 1, 1,
0.5062011, -0.2097694, 1.347691, 1, 1, 1, 1, 1,
0.5113859, 0.1097675, 0.8608249, 1, 1, 1, 1, 1,
0.5114963, -1.300839, 2.134357, 1, 1, 1, 1, 1,
0.5118712, 1.372615, 0.2382562, 1, 1, 1, 1, 1,
0.511923, -1.154609, 2.606833, 1, 1, 1, 1, 1,
0.5119604, 0.8927715, 1.048328, 1, 1, 1, 1, 1,
0.5154499, -1.289172, 3.932141, 1, 1, 1, 1, 1,
0.5155864, 0.5441201, -1.275469, 1, 1, 1, 1, 1,
0.5165916, -1.547785, 4.392875, 0, 0, 1, 1, 1,
0.5209903, 1.631692, 0.01978589, 1, 0, 0, 1, 1,
0.5221369, -0.2463692, -0.336381, 1, 0, 0, 1, 1,
0.527808, 0.1061379, 2.847674, 1, 0, 0, 1, 1,
0.5308127, 0.7572281, 2.111213, 1, 0, 0, 1, 1,
0.5318507, -0.4817481, 2.658409, 1, 0, 0, 1, 1,
0.5345864, -1.332584, 3.447595, 0, 0, 0, 1, 1,
0.534714, 0.6697207, -1.108921, 0, 0, 0, 1, 1,
0.537053, -0.2858962, 2.713821, 0, 0, 0, 1, 1,
0.5371013, -0.2530787, 1.27098, 0, 0, 0, 1, 1,
0.5438905, 0.5636096, 1.322402, 0, 0, 0, 1, 1,
0.5452442, 1.010729, 2.368096, 0, 0, 0, 1, 1,
0.5475895, -0.6997339, 2.645129, 0, 0, 0, 1, 1,
0.5498829, -0.3887594, 1.153042, 1, 1, 1, 1, 1,
0.5514827, -1.219133, 2.795995, 1, 1, 1, 1, 1,
0.5563187, 0.4306988, 1.679268, 1, 1, 1, 1, 1,
0.5594534, -0.1597482, -0.185077, 1, 1, 1, 1, 1,
0.562613, -0.160972, 1.841147, 1, 1, 1, 1, 1,
0.5628484, -1.219616, 4.013293, 1, 1, 1, 1, 1,
0.56594, 0.7215047, 0.7074923, 1, 1, 1, 1, 1,
0.5765004, 0.5368821, 1.433384, 1, 1, 1, 1, 1,
0.5775553, 1.732386, -2.163949, 1, 1, 1, 1, 1,
0.5777658, -0.6099202, 2.944138, 1, 1, 1, 1, 1,
0.5858229, 0.6582012, 0.4773457, 1, 1, 1, 1, 1,
0.587436, 0.9008847, 0.1613311, 1, 1, 1, 1, 1,
0.5874663, 0.5632598, 0.1450452, 1, 1, 1, 1, 1,
0.5905227, 1.592743, 1.466682, 1, 1, 1, 1, 1,
0.592135, -0.5390433, 2.576028, 1, 1, 1, 1, 1,
0.5936379, -0.5233623, 3.225655, 0, 0, 1, 1, 1,
0.5946817, -0.4342646, 2.271587, 1, 0, 0, 1, 1,
0.5954491, -0.8106617, 2.658038, 1, 0, 0, 1, 1,
0.5957948, 0.2378192, 0.2339169, 1, 0, 0, 1, 1,
0.6012271, 0.3556031, 1.029088, 1, 0, 0, 1, 1,
0.6069422, 1.559016, 1.564514, 1, 0, 0, 1, 1,
0.6160725, -0.3375562, 1.989973, 0, 0, 0, 1, 1,
0.6169091, -2.551049, 2.367519, 0, 0, 0, 1, 1,
0.6247196, 1.391698, -0.04742648, 0, 0, 0, 1, 1,
0.6355799, -0.8182643, 2.726269, 0, 0, 0, 1, 1,
0.6468216, 2.235794, 0.9805723, 0, 0, 0, 1, 1,
0.6509366, 0.5079152, 1.016016, 0, 0, 0, 1, 1,
0.6544958, 0.1957078, 0.8608171, 0, 0, 0, 1, 1,
0.6550701, -0.0773546, 1.787396, 1, 1, 1, 1, 1,
0.65602, -0.6686949, 2.730634, 1, 1, 1, 1, 1,
0.6563802, 0.2829922, 2.002786, 1, 1, 1, 1, 1,
0.661768, 0.7023307, -0.4237302, 1, 1, 1, 1, 1,
0.6721756, -0.2508098, 2.061221, 1, 1, 1, 1, 1,
0.6751471, 2.243459, 0.4977373, 1, 1, 1, 1, 1,
0.6765566, 1.873583, 1.194289, 1, 1, 1, 1, 1,
0.6863708, -0.1951504, 2.666637, 1, 1, 1, 1, 1,
0.6869851, -0.9906734, 1.631667, 1, 1, 1, 1, 1,
0.69846, -1.39192, 3.383902, 1, 1, 1, 1, 1,
0.7154852, -0.3281523, 2.243206, 1, 1, 1, 1, 1,
0.7292977, 0.03494248, 2.298071, 1, 1, 1, 1, 1,
0.7298694, -1.696202, 1.848912, 1, 1, 1, 1, 1,
0.7311842, 0.546359, 1.633686, 1, 1, 1, 1, 1,
0.7356087, 0.72565, 0.8208593, 1, 1, 1, 1, 1,
0.7380064, 2.149789, 0.8551311, 0, 0, 1, 1, 1,
0.739078, -1.040246, 3.862435, 1, 0, 0, 1, 1,
0.7393321, -1.200732, 3.642074, 1, 0, 0, 1, 1,
0.7400638, -0.8135157, 1.497181, 1, 0, 0, 1, 1,
0.7417714, 1.530048, 0.0722749, 1, 0, 0, 1, 1,
0.7437456, -0.207124, 1.348505, 1, 0, 0, 1, 1,
0.7538342, 0.1872869, 2.015877, 0, 0, 0, 1, 1,
0.7541837, -0.5282835, 2.47428, 0, 0, 0, 1, 1,
0.7543541, -0.9420835, 1.614894, 0, 0, 0, 1, 1,
0.7548082, 0.6971317, 0.609652, 0, 0, 0, 1, 1,
0.7552407, -0.2560347, 3.442666, 0, 0, 0, 1, 1,
0.7558602, 0.742103, 1.271282, 0, 0, 0, 1, 1,
0.7567194, -0.9027081, 3.195881, 0, 0, 0, 1, 1,
0.7567369, 1.772009, 1.234424, 1, 1, 1, 1, 1,
0.7577382, -0.3178023, 1.26917, 1, 1, 1, 1, 1,
0.7577578, -1.203553, 2.677892, 1, 1, 1, 1, 1,
0.7603174, 0.2701379, 0.2156986, 1, 1, 1, 1, 1,
0.7643591, -0.7625574, 1.88463, 1, 1, 1, 1, 1,
0.7654973, 1.13872, -0.5428514, 1, 1, 1, 1, 1,
0.7790897, -0.5560372, 1.229925, 1, 1, 1, 1, 1,
0.780569, -0.07401338, 2.753922, 1, 1, 1, 1, 1,
0.7845497, 1.67796, -0.6491529, 1, 1, 1, 1, 1,
0.7870283, -0.4104949, 0.9348251, 1, 1, 1, 1, 1,
0.7889132, -0.8573205, 2.880208, 1, 1, 1, 1, 1,
0.7891493, 1.31659, 0.5305371, 1, 1, 1, 1, 1,
0.7911165, 0.67595, 1.120955, 1, 1, 1, 1, 1,
0.7919533, -0.6415258, 1.969643, 1, 1, 1, 1, 1,
0.7933289, 0.1955926, 0.3809906, 1, 1, 1, 1, 1,
0.7941911, 0.8940477, 0.9635097, 0, 0, 1, 1, 1,
0.7963735, -0.3240976, 2.121419, 1, 0, 0, 1, 1,
0.7992065, 0.2531593, 1.149921, 1, 0, 0, 1, 1,
0.7996573, -1.350599, 3.090765, 1, 0, 0, 1, 1,
0.8016439, -2.007849, 1.555404, 1, 0, 0, 1, 1,
0.8049127, 1.76398, 0.2022764, 1, 0, 0, 1, 1,
0.8062878, -0.8135546, 2.408148, 0, 0, 0, 1, 1,
0.810115, 0.1466471, 1.831152, 0, 0, 0, 1, 1,
0.8162962, -1.542099, 1.685685, 0, 0, 0, 1, 1,
0.8189201, -0.5399857, 3.051689, 0, 0, 0, 1, 1,
0.8193902, 0.6207745, 1.060981, 0, 0, 0, 1, 1,
0.8208702, 0.5660816, 0.5279477, 0, 0, 0, 1, 1,
0.8284737, -0.9764308, 2.136485, 0, 0, 0, 1, 1,
0.8327605, 1.335989, -0.7407286, 1, 1, 1, 1, 1,
0.8329965, -1.876096, 2.358668, 1, 1, 1, 1, 1,
0.8370642, 0.8197752, -1.360732, 1, 1, 1, 1, 1,
0.8409878, 0.767261, 0.8843541, 1, 1, 1, 1, 1,
0.8496782, 0.7686056, 0.1536869, 1, 1, 1, 1, 1,
0.8512421, 0.6637412, 1.182927, 1, 1, 1, 1, 1,
0.8516207, -1.353965, 2.046073, 1, 1, 1, 1, 1,
0.8523803, 0.01673709, 1.562663, 1, 1, 1, 1, 1,
0.8608159, 0.271068, 1.18833, 1, 1, 1, 1, 1,
0.8617738, 0.9399546, -1.137495, 1, 1, 1, 1, 1,
0.8635457, -1.071017, 3.377808, 1, 1, 1, 1, 1,
0.8700016, 0.3598097, 0.3289184, 1, 1, 1, 1, 1,
0.8712287, -1.040262, 2.391949, 1, 1, 1, 1, 1,
0.8716642, -0.2238757, 2.879111, 1, 1, 1, 1, 1,
0.877439, -0.03214987, 1.468542, 1, 1, 1, 1, 1,
0.8798075, 0.1332456, 0.6587359, 0, 0, 1, 1, 1,
0.8835566, 0.4816754, -0.5399929, 1, 0, 0, 1, 1,
0.8835764, 0.622154, -0.1691514, 1, 0, 0, 1, 1,
0.88669, -1.088028, 2.855896, 1, 0, 0, 1, 1,
0.891221, 0.1995223, 0.10942, 1, 0, 0, 1, 1,
0.8957098, -1.99538, 2.013032, 1, 0, 0, 1, 1,
0.910038, 1.852826, -0.1379163, 0, 0, 0, 1, 1,
0.9160771, 1.948974, 0.1052008, 0, 0, 0, 1, 1,
0.9203097, -0.6395757, 1.524221, 0, 0, 0, 1, 1,
0.9208515, -0.1064625, 2.228277, 0, 0, 0, 1, 1,
0.925274, 0.2734233, 1.47642, 0, 0, 0, 1, 1,
0.9269802, 1.547792, 1.674607, 0, 0, 0, 1, 1,
0.9279321, -0.3270707, 0.8494953, 0, 0, 0, 1, 1,
0.9471402, 0.4731548, 2.216341, 1, 1, 1, 1, 1,
0.9491263, 0.08417898, -0.04365012, 1, 1, 1, 1, 1,
0.9552136, -0.5161047, 2.748694, 1, 1, 1, 1, 1,
0.9597297, -0.6666456, 3.364511, 1, 1, 1, 1, 1,
0.9638426, -0.185099, 1.310514, 1, 1, 1, 1, 1,
0.964825, -0.0795669, 2.361509, 1, 1, 1, 1, 1,
0.9702392, 0.7051253, 2.384967, 1, 1, 1, 1, 1,
0.9728618, -1.154308, 2.882612, 1, 1, 1, 1, 1,
0.9750617, 0.9547685, 0.8480121, 1, 1, 1, 1, 1,
0.9772722, 0.6820626, 0.9419593, 1, 1, 1, 1, 1,
0.9797504, 0.4143484, 3.303027, 1, 1, 1, 1, 1,
0.9814275, 1.102585, 1.827812, 1, 1, 1, 1, 1,
0.9830372, -0.2622354, 1.040127, 1, 1, 1, 1, 1,
0.9880224, 0.6863497, 1.304945, 1, 1, 1, 1, 1,
0.9896442, -1.045931, 2.190916, 1, 1, 1, 1, 1,
1.000988, -0.1711306, 2.517853, 0, 0, 1, 1, 1,
1.002689, -0.8610447, 0.8913072, 1, 0, 0, 1, 1,
1.006938, -0.9545401, 3.488787, 1, 0, 0, 1, 1,
1.015055, 1.899874, 0.5018929, 1, 0, 0, 1, 1,
1.016067, -2.175144, 1.129218, 1, 0, 0, 1, 1,
1.019332, 0.1356621, 3.09049, 1, 0, 0, 1, 1,
1.019761, -2.721888, 3.910839, 0, 0, 0, 1, 1,
1.025062, 0.2612083, -0.3632945, 0, 0, 0, 1, 1,
1.025709, -0.7634923, 2.313507, 0, 0, 0, 1, 1,
1.026095, -0.813207, 2.261877, 0, 0, 0, 1, 1,
1.02661, 1.66891, 0.867332, 0, 0, 0, 1, 1,
1.027889, 2.0577, 0.05352309, 0, 0, 0, 1, 1,
1.032629, -0.5150084, 3.405984, 0, 0, 0, 1, 1,
1.034249, -0.3556835, 0.09911422, 1, 1, 1, 1, 1,
1.036613, 0.249846, 2.317644, 1, 1, 1, 1, 1,
1.044952, -0.2953563, 3.351047, 1, 1, 1, 1, 1,
1.045894, -1.168805, 3.47826, 1, 1, 1, 1, 1,
1.059988, -1.234704, 2.69289, 1, 1, 1, 1, 1,
1.060212, -0.9474906, 2.625839, 1, 1, 1, 1, 1,
1.06821, -0.9111444, 2.264166, 1, 1, 1, 1, 1,
1.070386, -0.1597764, 1.805811, 1, 1, 1, 1, 1,
1.087572, 1.447772, 1.855764, 1, 1, 1, 1, 1,
1.091525, -0.4750328, 1.664412, 1, 1, 1, 1, 1,
1.092814, -0.2763655, 2.965112, 1, 1, 1, 1, 1,
1.097343, 1.141173, 0.549547, 1, 1, 1, 1, 1,
1.103331, -0.2774127, 1.528533, 1, 1, 1, 1, 1,
1.115662, -0.7267237, 1.590132, 1, 1, 1, 1, 1,
1.117304, -0.6501346, 0.883131, 1, 1, 1, 1, 1,
1.119063, -0.1297393, 1.420256, 0, 0, 1, 1, 1,
1.119254, -0.3728722, 1.159786, 1, 0, 0, 1, 1,
1.12062, 0.36993, -0.1942893, 1, 0, 0, 1, 1,
1.122971, 0.1615302, -0.004777623, 1, 0, 0, 1, 1,
1.123008, 0.1145694, 0.9404582, 1, 0, 0, 1, 1,
1.131322, -1.203878, 3.142181, 1, 0, 0, 1, 1,
1.134309, -0.6800487, 1.843927, 0, 0, 0, 1, 1,
1.144189, 1.380211, 1.935258, 0, 0, 0, 1, 1,
1.14873, 1.174763, 0.8337896, 0, 0, 0, 1, 1,
1.152038, 0.4665878, -0.581679, 0, 0, 0, 1, 1,
1.160673, -0.01509749, 2.929052, 0, 0, 0, 1, 1,
1.160909, -0.2316103, 2.938199, 0, 0, 0, 1, 1,
1.161342, 0.1171067, 3.36825, 0, 0, 0, 1, 1,
1.166959, -0.8961318, 4.050969, 1, 1, 1, 1, 1,
1.175866, -1.826025, 3.065431, 1, 1, 1, 1, 1,
1.185169, -0.7229614, 4.74974, 1, 1, 1, 1, 1,
1.192461, -0.4263485, 0.3512306, 1, 1, 1, 1, 1,
1.193561, 1.517307, -0.01839213, 1, 1, 1, 1, 1,
1.193647, -1.256199, 1.916142, 1, 1, 1, 1, 1,
1.197914, 1.671959, -0.703446, 1, 1, 1, 1, 1,
1.204792, 0.2428067, 1.460772, 1, 1, 1, 1, 1,
1.217629, -1.029489, 2.661049, 1, 1, 1, 1, 1,
1.219156, -0.04563062, 1.966078, 1, 1, 1, 1, 1,
1.219224, -1.309078, 2.064368, 1, 1, 1, 1, 1,
1.224578, -2.011048, 4.554494, 1, 1, 1, 1, 1,
1.235512, 0.3749007, 2.363487, 1, 1, 1, 1, 1,
1.236448, 1.617256, 0.7045348, 1, 1, 1, 1, 1,
1.236979, 0.4993822, 1.244794, 1, 1, 1, 1, 1,
1.24146, 0.4340198, 1.01847, 0, 0, 1, 1, 1,
1.242446, 0.1776159, 1.669091, 1, 0, 0, 1, 1,
1.244865, -0.3205955, 1.307247, 1, 0, 0, 1, 1,
1.246143, 1.104351, 1.669952, 1, 0, 0, 1, 1,
1.246415, -0.4594844, 2.475015, 1, 0, 0, 1, 1,
1.252866, 0.8422128, 2.719881, 1, 0, 0, 1, 1,
1.262415, 2.432386, -0.9275112, 0, 0, 0, 1, 1,
1.262586, -0.01993654, 0.9251276, 0, 0, 0, 1, 1,
1.266708, -1.406823, 2.414817, 0, 0, 0, 1, 1,
1.273896, 1.094772, 1.081971, 0, 0, 0, 1, 1,
1.280528, 0.5965082, 1.513323, 0, 0, 0, 1, 1,
1.285406, -0.2196626, 2.042596, 0, 0, 0, 1, 1,
1.290227, 0.1900443, 0.05582473, 0, 0, 0, 1, 1,
1.302502, -0.2051541, 1.522492, 1, 1, 1, 1, 1,
1.302977, 0.6009207, 1.859836, 1, 1, 1, 1, 1,
1.310599, -2.138929, 0.9118087, 1, 1, 1, 1, 1,
1.314381, -0.8316996, 1.706823, 1, 1, 1, 1, 1,
1.321473, 0.002264475, 1.804411, 1, 1, 1, 1, 1,
1.326815, -0.5556177, -0.3942292, 1, 1, 1, 1, 1,
1.327653, 1.490743, 1.146534, 1, 1, 1, 1, 1,
1.33214, -1.286078, 3.059281, 1, 1, 1, 1, 1,
1.335763, 2.654228, 0.3902649, 1, 1, 1, 1, 1,
1.344866, 0.04439363, 0.8659045, 1, 1, 1, 1, 1,
1.354923, -1.293438, 1.293348, 1, 1, 1, 1, 1,
1.355586, -0.244642, 0.7532118, 1, 1, 1, 1, 1,
1.358093, -1.63793, 1.968794, 1, 1, 1, 1, 1,
1.368193, 1.968282, 0.8687218, 1, 1, 1, 1, 1,
1.381409, -0.3013997, 1.581562, 1, 1, 1, 1, 1,
1.383258, 1.121364, -0.01133164, 0, 0, 1, 1, 1,
1.386678, 0.08086859, 2.604408, 1, 0, 0, 1, 1,
1.393416, 2.200545, 0.5495888, 1, 0, 0, 1, 1,
1.394067, -2.010833, 4.518645, 1, 0, 0, 1, 1,
1.396786, 1.682936, -0.6179355, 1, 0, 0, 1, 1,
1.417549, 0.3534954, 3.721962, 1, 0, 0, 1, 1,
1.422364, -1.338557, 2.631256, 0, 0, 0, 1, 1,
1.427375, 0.8446923, -1.424344, 0, 0, 0, 1, 1,
1.427936, 0.624903, 1.344462, 0, 0, 0, 1, 1,
1.430901, -0.5241284, 2.229617, 0, 0, 0, 1, 1,
1.432953, -0.818711, 2.117037, 0, 0, 0, 1, 1,
1.453166, -0.3567992, 2.016912, 0, 0, 0, 1, 1,
1.47202, -0.05014221, 2.121868, 0, 0, 0, 1, 1,
1.480064, 2.193558, 1.355114, 1, 1, 1, 1, 1,
1.480286, -0.2275124, 1.127744, 1, 1, 1, 1, 1,
1.490388, 0.3128678, 0.07291429, 1, 1, 1, 1, 1,
1.497252, -0.2617112, 3.616679, 1, 1, 1, 1, 1,
1.515342, -0.4204329, 2.584071, 1, 1, 1, 1, 1,
1.53186, -1.571106, 1.799913, 1, 1, 1, 1, 1,
1.532955, -0.03298858, 2.160703, 1, 1, 1, 1, 1,
1.54221, 0.7690973, 1.95901, 1, 1, 1, 1, 1,
1.549304, -0.9269622, 1.305538, 1, 1, 1, 1, 1,
1.562101, -0.4593679, 2.032336, 1, 1, 1, 1, 1,
1.567281, -1.602479, 3.237006, 1, 1, 1, 1, 1,
1.57125, 0.4555503, 1.258077, 1, 1, 1, 1, 1,
1.572049, -0.5694394, 2.376044, 1, 1, 1, 1, 1,
1.598047, 0.1013341, 0.6845109, 1, 1, 1, 1, 1,
1.618216, 1.909268, 0.3833505, 1, 1, 1, 1, 1,
1.629464, 1.746674, 0.0453146, 0, 0, 1, 1, 1,
1.643957, 0.268977, 1.983239, 1, 0, 0, 1, 1,
1.645058, 1.521924, 0.6944272, 1, 0, 0, 1, 1,
1.648902, 0.004523036, 2.115851, 1, 0, 0, 1, 1,
1.659849, 0.7144296, 1.605598, 1, 0, 0, 1, 1,
1.667819, -0.5095575, 1.870749, 1, 0, 0, 1, 1,
1.677517, -1.140164, 3.377482, 0, 0, 0, 1, 1,
1.678467, 1.094864, 0.8613095, 0, 0, 0, 1, 1,
1.684903, -0.1266501, 0.2961527, 0, 0, 0, 1, 1,
1.700325, -0.4633336, 2.664462, 0, 0, 0, 1, 1,
1.70806, -0.2172637, 0.02736107, 0, 0, 0, 1, 1,
1.73718, -0.5284349, 2.662211, 0, 0, 0, 1, 1,
1.74254, 0.07306606, 1.870718, 0, 0, 0, 1, 1,
1.757778, 2.036278, -0.4338312, 1, 1, 1, 1, 1,
1.758217, -0.7519271, 2.589276, 1, 1, 1, 1, 1,
1.773137, 1.245712, 1.411017, 1, 1, 1, 1, 1,
1.774639, -0.3777552, 1.409705, 1, 1, 1, 1, 1,
1.835769, -0.522909, 0.9041722, 1, 1, 1, 1, 1,
1.851568, 0.3653335, 2.041008, 1, 1, 1, 1, 1,
1.867761, -0.5492417, 1.425237, 1, 1, 1, 1, 1,
1.892016, 0.6557437, 0.1853514, 1, 1, 1, 1, 1,
1.895673, 0.6109275, 2.6816, 1, 1, 1, 1, 1,
1.960733, -0.5582815, 0.2642468, 1, 1, 1, 1, 1,
2.056188, 0.05099897, 1.189938, 1, 1, 1, 1, 1,
2.059221, 0.4304402, 1.674409, 1, 1, 1, 1, 1,
2.066323, -0.8745549, 2.803799, 1, 1, 1, 1, 1,
2.074581, -0.3849734, 3.490099, 1, 1, 1, 1, 1,
2.07527, -0.8281185, 0.5042863, 1, 1, 1, 1, 1,
2.096164, -1.961053, 3.573848, 0, 0, 1, 1, 1,
2.136647, -1.6566, 0.6546106, 1, 0, 0, 1, 1,
2.13837, 1.306366, 1.155481, 1, 0, 0, 1, 1,
2.164809, -0.7548954, 2.775441, 1, 0, 0, 1, 1,
2.233178, -0.3605532, 0.065419, 1, 0, 0, 1, 1,
2.233337, -1.531897, 3.457339, 1, 0, 0, 1, 1,
2.25113, 1.52085, 0.4490408, 0, 0, 0, 1, 1,
2.254855, -0.1188376, -1.810674, 0, 0, 0, 1, 1,
2.305482, 0.07332078, 2.672331, 0, 0, 0, 1, 1,
2.346772, -0.1350297, 1.2085, 0, 0, 0, 1, 1,
2.356832, 0.3695108, 1.495738, 0, 0, 0, 1, 1,
2.378167, 0.5392706, 1.206923, 0, 0, 0, 1, 1,
2.389481, -1.270258, 0.9951891, 0, 0, 0, 1, 1,
2.393407, 0.04652472, 1.946048, 1, 1, 1, 1, 1,
2.571559, 2.087205, 0.467523, 1, 1, 1, 1, 1,
2.591925, -0.2290408, 1.432286, 1, 1, 1, 1, 1,
2.629792, -1.186783, 2.677895, 1, 1, 1, 1, 1,
2.753566, -1.603976, 1.454082, 1, 1, 1, 1, 1,
2.902741, -0.9153906, 2.338224, 1, 1, 1, 1, 1,
3.109797, 0.1298414, 1.682831, 1, 1, 1, 1, 1
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
var radius = 9.194982;
var distance = 32.29699;
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
mvMatrix.translate( 0.2371593, -0.1058998, -0.1191146 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.29699);
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
