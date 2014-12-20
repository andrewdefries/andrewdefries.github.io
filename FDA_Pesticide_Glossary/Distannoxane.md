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
-3.336052, -1.526533, -1.525701, 1, 0, 0, 1,
-3.135295, -0.290763, -1.894133, 1, 0.007843138, 0, 1,
-2.638968, -1.656178, -1.873025, 1, 0.01176471, 0, 1,
-2.603977, 1.874716, 0.275078, 1, 0.01960784, 0, 1,
-2.581668, -0.7669494, 0.03013029, 1, 0.02352941, 0, 1,
-2.535535, 0.5101768, -1.737337, 1, 0.03137255, 0, 1,
-2.499641, 0.3911003, -0.8633611, 1, 0.03529412, 0, 1,
-2.48982, 0.3225887, -1.776026, 1, 0.04313726, 0, 1,
-2.4519, 0.6485869, -2.13488, 1, 0.04705882, 0, 1,
-2.377651, -0.7881298, -2.813385, 1, 0.05490196, 0, 1,
-2.320603, -0.3047918, -2.175405, 1, 0.05882353, 0, 1,
-2.279549, -0.3865971, -2.234596, 1, 0.06666667, 0, 1,
-2.279215, 0.9730495, -1.790486, 1, 0.07058824, 0, 1,
-2.261937, -0.569091, -2.605203, 1, 0.07843138, 0, 1,
-2.247735, 0.216919, -1.665319, 1, 0.08235294, 0, 1,
-2.234088, -0.396245, -2.410846, 1, 0.09019608, 0, 1,
-2.1989, -1.322662, -0.8824665, 1, 0.09411765, 0, 1,
-2.164643, -0.2865196, -3.040002, 1, 0.1019608, 0, 1,
-2.156043, -0.4826451, -2.558089, 1, 0.1098039, 0, 1,
-2.106743, -0.0968478, -1.748112, 1, 0.1137255, 0, 1,
-2.057249, 0.9571234, -0.7951936, 1, 0.1215686, 0, 1,
-2.041888, -0.313336, -1.520965, 1, 0.1254902, 0, 1,
-2.01782, -0.2934201, -0.8837923, 1, 0.1333333, 0, 1,
-2.008333, 0.04344848, -0.1089666, 1, 0.1372549, 0, 1,
-2.003405, 0.3337857, -0.7468107, 1, 0.145098, 0, 1,
-1.984953, 0.09890187, -3.043159, 1, 0.1490196, 0, 1,
-1.975429, -0.1146906, -1.3966, 1, 0.1568628, 0, 1,
-1.968741, 0.229688, -1.907535, 1, 0.1607843, 0, 1,
-1.962991, -1.151998, -3.702811, 1, 0.1686275, 0, 1,
-1.929178, -0.9263796, -1.019613, 1, 0.172549, 0, 1,
-1.922597, -2.598721, -1.784797, 1, 0.1803922, 0, 1,
-1.914746, -0.001345767, -0.6937515, 1, 0.1843137, 0, 1,
-1.910145, 0.433406, -1.856405, 1, 0.1921569, 0, 1,
-1.905171, 1.83889, -1.717465, 1, 0.1960784, 0, 1,
-1.896115, 0.2181026, -1.665883, 1, 0.2039216, 0, 1,
-1.834347, -0.925069, -1.813236, 1, 0.2117647, 0, 1,
-1.8228, -1.147749, -3.789599, 1, 0.2156863, 0, 1,
-1.778323, -0.8140845, -3.212108, 1, 0.2235294, 0, 1,
-1.777106, -0.2508835, -2.000201, 1, 0.227451, 0, 1,
-1.768776, -0.3589627, 0.6504502, 1, 0.2352941, 0, 1,
-1.763282, -0.06776448, -1.508959, 1, 0.2392157, 0, 1,
-1.762183, -0.6728275, -2.347942, 1, 0.2470588, 0, 1,
-1.751317, -0.8311353, -3.405499, 1, 0.2509804, 0, 1,
-1.749783, -0.4657758, -1.877128, 1, 0.2588235, 0, 1,
-1.744556, 0.4553073, -2.285589, 1, 0.2627451, 0, 1,
-1.744368, -1.246835, -3.221105, 1, 0.2705882, 0, 1,
-1.729616, 0.7857069, -0.6929939, 1, 0.2745098, 0, 1,
-1.71683, 1.577228, -1.222323, 1, 0.282353, 0, 1,
-1.715977, 1.539687, -1.389156, 1, 0.2862745, 0, 1,
-1.703323, -0.260498, -2.295568, 1, 0.2941177, 0, 1,
-1.691486, 1.575407, -0.201983, 1, 0.3019608, 0, 1,
-1.684697, 1.065981, -0.683261, 1, 0.3058824, 0, 1,
-1.676132, -0.1150016, -1.585052, 1, 0.3137255, 0, 1,
-1.667925, 0.2292088, -1.121371, 1, 0.3176471, 0, 1,
-1.662118, -1.380331, -1.878562, 1, 0.3254902, 0, 1,
-1.643531, -0.2070022, -0.5832255, 1, 0.3294118, 0, 1,
-1.631674, 1.49792, -2.786275, 1, 0.3372549, 0, 1,
-1.626937, -2.011086, -3.728784, 1, 0.3411765, 0, 1,
-1.625954, -0.4520521, -0.7309127, 1, 0.3490196, 0, 1,
-1.624316, -0.9386187, -1.927992, 1, 0.3529412, 0, 1,
-1.621358, 1.652213, -0.502986, 1, 0.3607843, 0, 1,
-1.603857, 0.6031234, -0.2552049, 1, 0.3647059, 0, 1,
-1.595721, -0.3852933, -0.6387004, 1, 0.372549, 0, 1,
-1.577198, 0.4935546, -1.938969, 1, 0.3764706, 0, 1,
-1.573258, 0.3991339, -0.2584464, 1, 0.3843137, 0, 1,
-1.573166, -0.7768937, -2.557818, 1, 0.3882353, 0, 1,
-1.571206, -0.2181954, -0.606335, 1, 0.3960784, 0, 1,
-1.567651, -0.9036044, -1.801228, 1, 0.4039216, 0, 1,
-1.561655, -0.6339274, -1.325849, 1, 0.4078431, 0, 1,
-1.555231, 1.37423, -0.1270998, 1, 0.4156863, 0, 1,
-1.539872, 0.9398344, -2.935195, 1, 0.4196078, 0, 1,
-1.530592, -0.9234533, -0.6924824, 1, 0.427451, 0, 1,
-1.529371, -0.836975, -2.699203, 1, 0.4313726, 0, 1,
-1.526538, 0.5813968, -1.435842, 1, 0.4392157, 0, 1,
-1.516958, 1.935475, -0.47736, 1, 0.4431373, 0, 1,
-1.488834, -1.227076, -1.3405, 1, 0.4509804, 0, 1,
-1.478467, -0.1995664, -1.781518, 1, 0.454902, 0, 1,
-1.472623, 1.024899, -2.439052, 1, 0.4627451, 0, 1,
-1.445298, 0.2171817, -1.224956, 1, 0.4666667, 0, 1,
-1.444491, 1.172976, -0.817941, 1, 0.4745098, 0, 1,
-1.438954, -0.544678, -0.8299214, 1, 0.4784314, 0, 1,
-1.412829, -0.4214221, -3.252427, 1, 0.4862745, 0, 1,
-1.412582, 1.724938, -1.580707, 1, 0.4901961, 0, 1,
-1.403109, 0.2365843, 0.05625954, 1, 0.4980392, 0, 1,
-1.398716, -0.5410284, -3.098361, 1, 0.5058824, 0, 1,
-1.389954, -1.111801, -2.836818, 1, 0.509804, 0, 1,
-1.387606, -1.436858, -3.418047, 1, 0.5176471, 0, 1,
-1.36724, -1.507064, -2.57808, 1, 0.5215687, 0, 1,
-1.367175, -0.1106312, -2.257933, 1, 0.5294118, 0, 1,
-1.348594, 0.3786773, -1.004457, 1, 0.5333334, 0, 1,
-1.34147, -0.05643782, -0.4076185, 1, 0.5411765, 0, 1,
-1.340196, 1.55223, -0.361919, 1, 0.5450981, 0, 1,
-1.33966, -1.725521, -1.311668, 1, 0.5529412, 0, 1,
-1.332895, -0.4038819, -1.198346, 1, 0.5568628, 0, 1,
-1.331929, -0.8703608, -2.916874, 1, 0.5647059, 0, 1,
-1.327995, 0.1610679, -2.259719, 1, 0.5686275, 0, 1,
-1.323907, 0.6661364, -2.173832, 1, 0.5764706, 0, 1,
-1.319142, -0.6972327, -1.079221, 1, 0.5803922, 0, 1,
-1.31046, 0.3373769, -1.39189, 1, 0.5882353, 0, 1,
-1.309798, -1.432016, -3.533197, 1, 0.5921569, 0, 1,
-1.309078, 1.037978, -0.3137494, 1, 0.6, 0, 1,
-1.305622, 1.129477, -0.2301455, 1, 0.6078432, 0, 1,
-1.305465, -1.431216, -0.5752072, 1, 0.6117647, 0, 1,
-1.303363, 1.387751, -0.8624623, 1, 0.6196079, 0, 1,
-1.302081, -1.75681, -2.965769, 1, 0.6235294, 0, 1,
-1.291971, 1.616072, -0.1850935, 1, 0.6313726, 0, 1,
-1.280133, -0.2322402, -0.85068, 1, 0.6352941, 0, 1,
-1.269646, 0.6814112, -0.5963588, 1, 0.6431373, 0, 1,
-1.267481, -0.3943158, -2.29202, 1, 0.6470588, 0, 1,
-1.259251, -0.170084, -2.319671, 1, 0.654902, 0, 1,
-1.257027, -0.406842, -0.9416171, 1, 0.6588235, 0, 1,
-1.256855, 0.8486926, -1.055497, 1, 0.6666667, 0, 1,
-1.254871, -0.4418088, -1.409999, 1, 0.6705883, 0, 1,
-1.247862, 0.5043632, -0.1345962, 1, 0.6784314, 0, 1,
-1.244668, -0.06035206, -3.087468, 1, 0.682353, 0, 1,
-1.225973, -0.7641164, -1.850512, 1, 0.6901961, 0, 1,
-1.225143, 0.244146, -0.9569077, 1, 0.6941177, 0, 1,
-1.211681, 0.6484765, -1.030316, 1, 0.7019608, 0, 1,
-1.205973, -0.2381581, -0.6264001, 1, 0.7098039, 0, 1,
-1.19137, -0.04603332, -0.3398712, 1, 0.7137255, 0, 1,
-1.189149, -1.346302, -1.086733, 1, 0.7215686, 0, 1,
-1.182239, 0.3628311, -0.6931399, 1, 0.7254902, 0, 1,
-1.18096, -0.2165796, -0.4147271, 1, 0.7333333, 0, 1,
-1.178182, 0.06563249, -1.075348, 1, 0.7372549, 0, 1,
-1.15583, 0.1409149, -1.745356, 1, 0.7450981, 0, 1,
-1.146454, -0.8609683, -2.584946, 1, 0.7490196, 0, 1,
-1.123425, -0.3333656, -1.408587, 1, 0.7568628, 0, 1,
-1.122411, 0.4577099, -2.233582, 1, 0.7607843, 0, 1,
-1.120264, 2.25882, -0.6927805, 1, 0.7686275, 0, 1,
-1.115993, -0.9044113, -3.112245, 1, 0.772549, 0, 1,
-1.113071, -1.192661, -2.153761, 1, 0.7803922, 0, 1,
-1.112238, -1.705669, -3.523505, 1, 0.7843137, 0, 1,
-1.112094, 1.787585, 0.240792, 1, 0.7921569, 0, 1,
-1.104276, 1.319247, -0.5905963, 1, 0.7960784, 0, 1,
-1.097257, 1.01528, -0.3904527, 1, 0.8039216, 0, 1,
-1.090949, -0.4420621, -1.810008, 1, 0.8117647, 0, 1,
-1.090522, -2.035776, -2.651811, 1, 0.8156863, 0, 1,
-1.088001, -1.446999, -2.453636, 1, 0.8235294, 0, 1,
-1.084029, -0.756043, -2.872736, 1, 0.827451, 0, 1,
-1.080655, -0.04066877, -3.008096, 1, 0.8352941, 0, 1,
-1.077711, 0.5951842, -1.248689, 1, 0.8392157, 0, 1,
-1.07497, 0.2671956, -1.060708, 1, 0.8470588, 0, 1,
-1.074647, -0.2308797, -2.189756, 1, 0.8509804, 0, 1,
-1.071241, -0.2325677, -2.322923, 1, 0.8588235, 0, 1,
-1.064008, 0.9993269, -0.5932553, 1, 0.8627451, 0, 1,
-1.063183, -2.112302, -2.180309, 1, 0.8705882, 0, 1,
-1.048666, -0.07714267, -1.417552, 1, 0.8745098, 0, 1,
-1.048553, 0.03029854, -0.4418092, 1, 0.8823529, 0, 1,
-1.045021, 1.970043, 0.2589644, 1, 0.8862745, 0, 1,
-1.037952, 0.006374882, 0.129208, 1, 0.8941177, 0, 1,
-1.030149, -0.883507, -2.169603, 1, 0.8980392, 0, 1,
-1.029881, 0.2187267, -0.7270113, 1, 0.9058824, 0, 1,
-1.018675, -1.932074, -2.891774, 1, 0.9137255, 0, 1,
-1.017558, -1.948916, -1.652863, 1, 0.9176471, 0, 1,
-1.010566, 0.4588062, -1.340205, 1, 0.9254902, 0, 1,
-1.009153, 0.8180241, 0.4633266, 1, 0.9294118, 0, 1,
-1.005084, 1.089098, -1.26587, 1, 0.9372549, 0, 1,
-0.9844945, 0.9544008, -1.398391, 1, 0.9411765, 0, 1,
-0.9667518, -2.045199, -4.043323, 1, 0.9490196, 0, 1,
-0.9632528, 0.08004688, -0.3104258, 1, 0.9529412, 0, 1,
-0.9632286, -1.871962, -2.725977, 1, 0.9607843, 0, 1,
-0.9592999, -0.99735, -3.122503, 1, 0.9647059, 0, 1,
-0.9574658, -0.2556552, -3.668118, 1, 0.972549, 0, 1,
-0.9557694, 0.4628851, -1.005842, 1, 0.9764706, 0, 1,
-0.9472473, -0.6744292, -2.787649, 1, 0.9843137, 0, 1,
-0.9466479, -0.7443118, -2.609227, 1, 0.9882353, 0, 1,
-0.9319286, 0.5488991, -0.952909, 1, 0.9960784, 0, 1,
-0.9271396, -1.138596, -1.206477, 0.9960784, 1, 0, 1,
-0.9223844, 0.3039145, -2.541063, 0.9921569, 1, 0, 1,
-0.9223235, -0.2780726, -0.9221768, 0.9843137, 1, 0, 1,
-0.916516, -0.800783, -0.7411955, 0.9803922, 1, 0, 1,
-0.909664, 0.9910055, -2.844227, 0.972549, 1, 0, 1,
-0.9055054, 1.36532, -1.446669, 0.9686275, 1, 0, 1,
-0.9021873, 3.154348, -0.5291257, 0.9607843, 1, 0, 1,
-0.9019307, 0.06732464, 0.002487232, 0.9568627, 1, 0, 1,
-0.9015085, -0.7072908, -2.95956, 0.9490196, 1, 0, 1,
-0.9013613, -1.428711, -2.165833, 0.945098, 1, 0, 1,
-0.9011627, -0.7453264, -2.091107, 0.9372549, 1, 0, 1,
-0.8939385, -0.2130424, -2.912691, 0.9333333, 1, 0, 1,
-0.8926806, -0.8172011, -1.713825, 0.9254902, 1, 0, 1,
-0.8907298, 1.126007, -1.98858, 0.9215686, 1, 0, 1,
-0.8898035, -0.1878543, -2.990894, 0.9137255, 1, 0, 1,
-0.8881571, -0.02862424, -1.619593, 0.9098039, 1, 0, 1,
-0.8845117, 1.902307, 0.9762486, 0.9019608, 1, 0, 1,
-0.8790088, -0.196149, -2.090217, 0.8941177, 1, 0, 1,
-0.8754376, 1.038996, -1.169228, 0.8901961, 1, 0, 1,
-0.8738722, 1.237238, -1.301382, 0.8823529, 1, 0, 1,
-0.8700332, 1.864737, -2.109239, 0.8784314, 1, 0, 1,
-0.8659392, 0.5663869, -2.260392, 0.8705882, 1, 0, 1,
-0.8628842, -0.3043369, -1.372797, 0.8666667, 1, 0, 1,
-0.8616128, -0.1164536, -2.334562, 0.8588235, 1, 0, 1,
-0.8600031, 0.1207925, -0.6871997, 0.854902, 1, 0, 1,
-0.8558893, -0.5901253, -2.404304, 0.8470588, 1, 0, 1,
-0.8541555, 0.547738, -2.044426, 0.8431373, 1, 0, 1,
-0.853651, 0.4756863, -2.020762, 0.8352941, 1, 0, 1,
-0.8534916, -2.401079, -3.329687, 0.8313726, 1, 0, 1,
-0.8500486, 0.3999234, -1.34524, 0.8235294, 1, 0, 1,
-0.8486932, 0.05340042, -2.162299, 0.8196079, 1, 0, 1,
-0.845347, 1.207629, -0.9064413, 0.8117647, 1, 0, 1,
-0.8441074, -1.107533, -0.8781344, 0.8078431, 1, 0, 1,
-0.8434821, -0.4645235, -3.484038, 0.8, 1, 0, 1,
-0.8356463, 0.4334103, -2.327341, 0.7921569, 1, 0, 1,
-0.8320645, 1.26908, 0.195815, 0.7882353, 1, 0, 1,
-0.8309056, 1.216589, -1.058892, 0.7803922, 1, 0, 1,
-0.8300834, -1.148701, -2.21212, 0.7764706, 1, 0, 1,
-0.8249487, 0.07468087, -0.2931843, 0.7686275, 1, 0, 1,
-0.8231164, 0.8094487, -1.483368, 0.7647059, 1, 0, 1,
-0.8231031, -0.1751345, -2.184247, 0.7568628, 1, 0, 1,
-0.816237, -1.230158, -3.136244, 0.7529412, 1, 0, 1,
-0.8156723, 0.1725979, -1.785416, 0.7450981, 1, 0, 1,
-0.8119729, 0.4283258, -3.023809, 0.7411765, 1, 0, 1,
-0.8064274, -0.7704995, -1.089341, 0.7333333, 1, 0, 1,
-0.8029784, -0.1753521, -3.141217, 0.7294118, 1, 0, 1,
-0.8006594, -2.088583, -3.80046, 0.7215686, 1, 0, 1,
-0.798588, 0.005088792, -1.632246, 0.7176471, 1, 0, 1,
-0.7972146, 0.2478361, -1.671285, 0.7098039, 1, 0, 1,
-0.7892308, 0.01612429, 0.2812886, 0.7058824, 1, 0, 1,
-0.7871601, -0.8471528, -2.985558, 0.6980392, 1, 0, 1,
-0.7838303, 0.6879601, -1.161521, 0.6901961, 1, 0, 1,
-0.782993, 0.5812042, -1.619197, 0.6862745, 1, 0, 1,
-0.7796933, 0.7199261, -0.9653966, 0.6784314, 1, 0, 1,
-0.7778526, 0.8900873, -2.314455, 0.6745098, 1, 0, 1,
-0.7735099, 0.3920977, -0.3294089, 0.6666667, 1, 0, 1,
-0.7727763, -0.006892159, -0.7304416, 0.6627451, 1, 0, 1,
-0.7586315, -0.7835998, -1.542347, 0.654902, 1, 0, 1,
-0.7486153, -2.334079, -2.622486, 0.6509804, 1, 0, 1,
-0.7483196, -0.9418348, -0.5223402, 0.6431373, 1, 0, 1,
-0.748063, 0.6884468, -2.298406, 0.6392157, 1, 0, 1,
-0.7471142, 1.149099, 0.3064696, 0.6313726, 1, 0, 1,
-0.7469848, 0.6935011, 1.270253, 0.627451, 1, 0, 1,
-0.746265, 0.9141256, -1.260767, 0.6196079, 1, 0, 1,
-0.7417816, 1.630688, -1.141706, 0.6156863, 1, 0, 1,
-0.7298046, 0.2908739, -0.6276374, 0.6078432, 1, 0, 1,
-0.7265522, 1.059014, -0.5073324, 0.6039216, 1, 0, 1,
-0.7185128, 0.1966663, -0.05433564, 0.5960785, 1, 0, 1,
-0.715891, 1.835643, -0.7376373, 0.5882353, 1, 0, 1,
-0.7134272, -2.011189, -0.9876949, 0.5843138, 1, 0, 1,
-0.7120742, -0.2896598, -1.183089, 0.5764706, 1, 0, 1,
-0.7088102, 1.215858, -0.3215926, 0.572549, 1, 0, 1,
-0.7075505, -0.9776283, -3.798641, 0.5647059, 1, 0, 1,
-0.7071614, 0.1841326, -1.686932, 0.5607843, 1, 0, 1,
-0.7053333, -0.06784248, -1.172757, 0.5529412, 1, 0, 1,
-0.7052952, -1.139881, -2.822025, 0.5490196, 1, 0, 1,
-0.7032662, -1.966927, -2.348212, 0.5411765, 1, 0, 1,
-0.6999664, -1.124343, -3.720108, 0.5372549, 1, 0, 1,
-0.6998555, -1.52434, -3.254649, 0.5294118, 1, 0, 1,
-0.694196, 0.4145955, 0.7041416, 0.5254902, 1, 0, 1,
-0.6939499, 0.3329742, 0.6482728, 0.5176471, 1, 0, 1,
-0.6938899, -0.7133619, -1.279303, 0.5137255, 1, 0, 1,
-0.6916861, 0.4142429, -0.5621673, 0.5058824, 1, 0, 1,
-0.6915122, -0.5711702, -2.707103, 0.5019608, 1, 0, 1,
-0.6914561, 1.564411, 1.60411, 0.4941176, 1, 0, 1,
-0.6881796, -0.4758787, -2.928121, 0.4862745, 1, 0, 1,
-0.6868911, -0.06172583, -0.5611299, 0.4823529, 1, 0, 1,
-0.6841778, 0.4081823, -0.8172826, 0.4745098, 1, 0, 1,
-0.6825122, 0.8918942, -1.122499, 0.4705882, 1, 0, 1,
-0.6784805, -0.339554, -2.43209, 0.4627451, 1, 0, 1,
-0.6754769, 0.08052012, -1.593036, 0.4588235, 1, 0, 1,
-0.6733792, -0.5670652, -2.264653, 0.4509804, 1, 0, 1,
-0.6663073, -0.6421342, -1.711733, 0.4470588, 1, 0, 1,
-0.6608998, -1.951937, -2.93118, 0.4392157, 1, 0, 1,
-0.660213, 0.2978831, -1.228677, 0.4352941, 1, 0, 1,
-0.6598848, 0.9231114, -1.995105, 0.427451, 1, 0, 1,
-0.6573011, -1.537885, -4.124646, 0.4235294, 1, 0, 1,
-0.6493058, -1.718886, -3.198285, 0.4156863, 1, 0, 1,
-0.6489326, -0.1518236, -1.519495, 0.4117647, 1, 0, 1,
-0.6455905, 0.6501817, 0.9683287, 0.4039216, 1, 0, 1,
-0.644969, 0.6447993, -0.1144911, 0.3960784, 1, 0, 1,
-0.6449014, 0.6576567, -0.08400436, 0.3921569, 1, 0, 1,
-0.6440573, 0.3331187, -0.903721, 0.3843137, 1, 0, 1,
-0.6439095, -1.399717, 0.7123253, 0.3803922, 1, 0, 1,
-0.6433445, 0.5667622, -1.666098, 0.372549, 1, 0, 1,
-0.639155, -0.1286119, -2.703733, 0.3686275, 1, 0, 1,
-0.6350851, -3.436091, -2.027903, 0.3607843, 1, 0, 1,
-0.6340013, 1.758165, 1.022654, 0.3568628, 1, 0, 1,
-0.6269254, 0.5162277, -0.6713465, 0.3490196, 1, 0, 1,
-0.6246755, -1.747503, -2.697201, 0.345098, 1, 0, 1,
-0.622184, 0.4830335, -0.758774, 0.3372549, 1, 0, 1,
-0.6193085, 1.345981, -0.8624944, 0.3333333, 1, 0, 1,
-0.617842, -1.064734, -2.766817, 0.3254902, 1, 0, 1,
-0.6167342, 1.538804, 0.1294308, 0.3215686, 1, 0, 1,
-0.6156298, 0.435078, 1.385434, 0.3137255, 1, 0, 1,
-0.6155224, 1.320274, -0.1223552, 0.3098039, 1, 0, 1,
-0.6148469, -0.1680494, -2.336666, 0.3019608, 1, 0, 1,
-0.6122324, -0.4725754, -2.471274, 0.2941177, 1, 0, 1,
-0.6034798, -0.0336023, -1.76456, 0.2901961, 1, 0, 1,
-0.5999653, -1.568861, -5.158223, 0.282353, 1, 0, 1,
-0.5982878, 2.199939, 0.5684918, 0.2784314, 1, 0, 1,
-0.5968, -1.945534, -4.671107, 0.2705882, 1, 0, 1,
-0.5944588, -0.4106047, -1.964992, 0.2666667, 1, 0, 1,
-0.590035, 1.073806, -0.9413028, 0.2588235, 1, 0, 1,
-0.5847774, 0.2079104, -1.445206, 0.254902, 1, 0, 1,
-0.5840726, -0.7221956, -3.410835, 0.2470588, 1, 0, 1,
-0.5829932, -1.030309, -3.048579, 0.2431373, 1, 0, 1,
-0.5751317, 1.194954, -0.9687082, 0.2352941, 1, 0, 1,
-0.5704349, -0.3339169, -1.355603, 0.2313726, 1, 0, 1,
-0.5674617, 0.6296786, 0.07947217, 0.2235294, 1, 0, 1,
-0.5652442, 1.325302, 1.330818, 0.2196078, 1, 0, 1,
-0.5634565, 0.07132075, -0.6182216, 0.2117647, 1, 0, 1,
-0.5633269, 0.1170464, -1.688094, 0.2078431, 1, 0, 1,
-0.5628325, 0.4591389, -0.03955265, 0.2, 1, 0, 1,
-0.5620685, -1.793544, -3.167476, 0.1921569, 1, 0, 1,
-0.5595998, 0.6687455, -1.029948, 0.1882353, 1, 0, 1,
-0.5578978, 2.201913, 0.5941352, 0.1803922, 1, 0, 1,
-0.5523579, -0.4621418, -1.363818, 0.1764706, 1, 0, 1,
-0.5501889, -0.5967751, -2.537246, 0.1686275, 1, 0, 1,
-0.5481851, -1.206088, -3.679491, 0.1647059, 1, 0, 1,
-0.5469144, -0.9953976, -4.068138, 0.1568628, 1, 0, 1,
-0.5463666, 1.170046, 0.1222613, 0.1529412, 1, 0, 1,
-0.5411969, -0.3568484, -3.054617, 0.145098, 1, 0, 1,
-0.5391498, -0.3597018, -2.269667, 0.1411765, 1, 0, 1,
-0.5355962, 0.2244129, -1.559312, 0.1333333, 1, 0, 1,
-0.5355082, -0.1078235, -0.6199614, 0.1294118, 1, 0, 1,
-0.5343977, 0.5695185, -0.9137217, 0.1215686, 1, 0, 1,
-0.5322528, -1.490034, -3.060838, 0.1176471, 1, 0, 1,
-0.5284898, 1.064044, -0.2243832, 0.1098039, 1, 0, 1,
-0.521586, -0.3032424, -1.928139, 0.1058824, 1, 0, 1,
-0.5162146, 1.152434, 0.2086342, 0.09803922, 1, 0, 1,
-0.5160789, 0.5498805, 0.4209836, 0.09019608, 1, 0, 1,
-0.5150524, -1.728801, -4.130124, 0.08627451, 1, 0, 1,
-0.5138454, -0.07533634, -1.393045, 0.07843138, 1, 0, 1,
-0.5130914, -0.6390412, -1.303764, 0.07450981, 1, 0, 1,
-0.4987501, -0.419671, -2.348002, 0.06666667, 1, 0, 1,
-0.498388, 0.1459066, -1.326231, 0.0627451, 1, 0, 1,
-0.490204, -0.5964754, -3.088644, 0.05490196, 1, 0, 1,
-0.489468, -0.008148359, -0.9541299, 0.05098039, 1, 0, 1,
-0.4837834, 0.7469392, 1.302094, 0.04313726, 1, 0, 1,
-0.4836327, -0.3760538, -3.48051, 0.03921569, 1, 0, 1,
-0.4822879, -1.268331, -0.90416, 0.03137255, 1, 0, 1,
-0.4822767, 1.766474, -1.33394, 0.02745098, 1, 0, 1,
-0.4818069, 1.043953, 1.419152, 0.01960784, 1, 0, 1,
-0.4812913, -1.521024, -1.805914, 0.01568628, 1, 0, 1,
-0.4772253, -0.08087696, -1.950582, 0.007843138, 1, 0, 1,
-0.4715201, -1.281693, -1.868607, 0.003921569, 1, 0, 1,
-0.469375, 0.1709374, -1.360891, 0, 1, 0.003921569, 1,
-0.4678058, 1.134609, 0.2838499, 0, 1, 0.01176471, 1,
-0.4592331, 1.332719, -0.8630953, 0, 1, 0.01568628, 1,
-0.4591042, 0.7967911, -0.4792157, 0, 1, 0.02352941, 1,
-0.4546558, -2.109129, -3.874863, 0, 1, 0.02745098, 1,
-0.4529718, -1.284636, -3.442183, 0, 1, 0.03529412, 1,
-0.4516694, -1.42576, -2.96955, 0, 1, 0.03921569, 1,
-0.4510223, -0.7213852, -2.695524, 0, 1, 0.04705882, 1,
-0.448355, -1.956104, -2.328909, 0, 1, 0.05098039, 1,
-0.4446381, 0.2917549, -2.391078, 0, 1, 0.05882353, 1,
-0.4439675, 1.570828, -1.212, 0, 1, 0.0627451, 1,
-0.4376126, -1.355498, -2.642682, 0, 1, 0.07058824, 1,
-0.4354178, 1.938942, 0.7912848, 0, 1, 0.07450981, 1,
-0.4322211, 2.880597, -1.822317, 0, 1, 0.08235294, 1,
-0.4319257, -0.1802457, -2.581288, 0, 1, 0.08627451, 1,
-0.4309086, 0.2213528, -3.568501, 0, 1, 0.09411765, 1,
-0.4287255, 1.000914, -0.1541204, 0, 1, 0.1019608, 1,
-0.4267177, 0.8887541, -1.038615, 0, 1, 0.1058824, 1,
-0.4250512, -1.062184, -4.591425, 0, 1, 0.1137255, 1,
-0.4249916, -0.4486197, -2.4317, 0, 1, 0.1176471, 1,
-0.4245923, -0.03215769, -1.064983, 0, 1, 0.1254902, 1,
-0.4234421, -0.7558056, -3.219225, 0, 1, 0.1294118, 1,
-0.4224823, 0.6760905, -0.6956525, 0, 1, 0.1372549, 1,
-0.4224755, 0.2525919, -2.076216, 0, 1, 0.1411765, 1,
-0.4219189, 0.7611277, -1.115612, 0, 1, 0.1490196, 1,
-0.4214252, 1.31276, -0.1989337, 0, 1, 0.1529412, 1,
-0.41305, -0.9463341, -1.959071, 0, 1, 0.1607843, 1,
-0.4126559, -0.03100767, -1.209795, 0, 1, 0.1647059, 1,
-0.4053979, 0.3816614, 0.3786966, 0, 1, 0.172549, 1,
-0.4051495, 0.4685565, -0.09218613, 0, 1, 0.1764706, 1,
-0.4043239, -0.8920797, -2.30357, 0, 1, 0.1843137, 1,
-0.4043178, 1.957424, 0.1682904, 0, 1, 0.1882353, 1,
-0.4034868, -1.100198, -2.912698, 0, 1, 0.1960784, 1,
-0.3922519, -1.183302, -2.830923, 0, 1, 0.2039216, 1,
-0.3905098, -0.2096999, -0.8776283, 0, 1, 0.2078431, 1,
-0.3882876, 0.3430972, -1.135929, 0, 1, 0.2156863, 1,
-0.3848916, -0.3048303, -1.83636, 0, 1, 0.2196078, 1,
-0.3811372, 0.1198425, -2.501095, 0, 1, 0.227451, 1,
-0.3807862, -0.6056278, -4.650745, 0, 1, 0.2313726, 1,
-0.3795448, -0.7902678, -1.559443, 0, 1, 0.2392157, 1,
-0.3783406, 1.275281, -0.8123103, 0, 1, 0.2431373, 1,
-0.375809, -1.696363, -2.938721, 0, 1, 0.2509804, 1,
-0.3726693, -1.284413, -1.69925, 0, 1, 0.254902, 1,
-0.3653274, 1.612223, 0.2868867, 0, 1, 0.2627451, 1,
-0.3601642, 0.09624232, -0.3835585, 0, 1, 0.2666667, 1,
-0.3569118, 0.1516336, -0.8259897, 0, 1, 0.2745098, 1,
-0.352406, -0.873093, -1.047243, 0, 1, 0.2784314, 1,
-0.3475324, 1.135904, -0.1127543, 0, 1, 0.2862745, 1,
-0.3355349, -1.480567, -3.026735, 0, 1, 0.2901961, 1,
-0.3335717, 0.6476854, -0.1549214, 0, 1, 0.2980392, 1,
-0.3329058, 0.3520111, 1.186322, 0, 1, 0.3058824, 1,
-0.3328116, -0.05300021, -1.088778, 0, 1, 0.3098039, 1,
-0.3318835, 0.3312932, -1.051371, 0, 1, 0.3176471, 1,
-0.325375, -0.3752201, -1.25832, 0, 1, 0.3215686, 1,
-0.3252092, -0.4218476, -2.050789, 0, 1, 0.3294118, 1,
-0.3228724, 1.445782, 0.244697, 0, 1, 0.3333333, 1,
-0.3201322, 1.159787, -0.3223002, 0, 1, 0.3411765, 1,
-0.319001, -0.6764985, -1.319644, 0, 1, 0.345098, 1,
-0.3146575, -0.2263422, -1.768458, 0, 1, 0.3529412, 1,
-0.3129249, -0.5874186, -1.070875, 0, 1, 0.3568628, 1,
-0.305319, 1.21129, -1.280941, 0, 1, 0.3647059, 1,
-0.3028122, 1.441871, -1.239111, 0, 1, 0.3686275, 1,
-0.3021272, 0.5730276, -1.816861, 0, 1, 0.3764706, 1,
-0.301016, 0.1592076, -0.1215011, 0, 1, 0.3803922, 1,
-0.3008869, 0.347186, -0.2924094, 0, 1, 0.3882353, 1,
-0.2975388, 0.4387341, -1.15681, 0, 1, 0.3921569, 1,
-0.2965581, -1.178045, -4.25702, 0, 1, 0.4, 1,
-0.2958623, -0.5531539, -4.439292, 0, 1, 0.4078431, 1,
-0.2854001, -0.6469143, -2.089389, 0, 1, 0.4117647, 1,
-0.2804944, 0.1676886, -2.788725, 0, 1, 0.4196078, 1,
-0.2789276, 0.4136022, -0.7942602, 0, 1, 0.4235294, 1,
-0.2786154, -1.169108, -2.221994, 0, 1, 0.4313726, 1,
-0.2778516, -1.598351, -4.447846, 0, 1, 0.4352941, 1,
-0.2776081, 1.85659, 0.3563571, 0, 1, 0.4431373, 1,
-0.273342, 0.2814907, -0.7563441, 0, 1, 0.4470588, 1,
-0.2725517, 0.232049, 1.55105, 0, 1, 0.454902, 1,
-0.2676333, 1.37023, 0.3015105, 0, 1, 0.4588235, 1,
-0.2674254, 0.6818699, -0.3245092, 0, 1, 0.4666667, 1,
-0.2661169, -0.112014, -2.196604, 0, 1, 0.4705882, 1,
-0.2620362, -1.34464, -1.974415, 0, 1, 0.4784314, 1,
-0.2591834, 1.646089, -0.8246779, 0, 1, 0.4823529, 1,
-0.2547697, 1.222858, 0.90118, 0, 1, 0.4901961, 1,
-0.2530533, 0.6126127, -0.04979937, 0, 1, 0.4941176, 1,
-0.2524616, 1.652433, -0.6925929, 0, 1, 0.5019608, 1,
-0.2490837, -0.936647, -3.486903, 0, 1, 0.509804, 1,
-0.2489383, -1.416862, -1.58255, 0, 1, 0.5137255, 1,
-0.248344, 1.302366, -0.1399685, 0, 1, 0.5215687, 1,
-0.2467855, -2.300815, -2.894358, 0, 1, 0.5254902, 1,
-0.2453332, -0.04858727, 0.9232182, 0, 1, 0.5333334, 1,
-0.2439604, -0.1572606, -3.35055, 0, 1, 0.5372549, 1,
-0.2435221, -0.9937533, -4.062856, 0, 1, 0.5450981, 1,
-0.2396081, 0.6440544, 1.022837, 0, 1, 0.5490196, 1,
-0.2319876, -0.1153918, -2.326303, 0, 1, 0.5568628, 1,
-0.2265068, 1.106238, -0.5777785, 0, 1, 0.5607843, 1,
-0.2246786, 0.2749602, 0.3739323, 0, 1, 0.5686275, 1,
-0.2203389, 1.625751, -0.6493705, 0, 1, 0.572549, 1,
-0.2167322, 0.1437685, -1.350521, 0, 1, 0.5803922, 1,
-0.2133459, 0.4530972, -0.3471239, 0, 1, 0.5843138, 1,
-0.2096482, -0.6478543, -1.962821, 0, 1, 0.5921569, 1,
-0.2076969, -0.7272419, -3.030374, 0, 1, 0.5960785, 1,
-0.2074049, 0.03096914, -1.694621, 0, 1, 0.6039216, 1,
-0.2027096, 0.4595183, 1.236241, 0, 1, 0.6117647, 1,
-0.2009658, -0.8177163, -2.517371, 0, 1, 0.6156863, 1,
-0.1967599, -1.161799, -4.397092, 0, 1, 0.6235294, 1,
-0.1964174, -0.4005198, -2.560032, 0, 1, 0.627451, 1,
-0.195247, 0.2826446, -1.490692, 0, 1, 0.6352941, 1,
-0.1931603, -0.590322, -4.876185, 0, 1, 0.6392157, 1,
-0.1911277, 0.24764, -0.6281795, 0, 1, 0.6470588, 1,
-0.1888727, -1.05029, -3.764138, 0, 1, 0.6509804, 1,
-0.1866823, 1.6675, -0.4518539, 0, 1, 0.6588235, 1,
-0.1824372, 0.3063008, 0.5814525, 0, 1, 0.6627451, 1,
-0.176233, -0.5634019, -4.1489, 0, 1, 0.6705883, 1,
-0.1750355, -0.02416142, -0.798656, 0, 1, 0.6745098, 1,
-0.1748517, -1.058094, -1.468444, 0, 1, 0.682353, 1,
-0.1740562, 1.160448, -0.1234654, 0, 1, 0.6862745, 1,
-0.1738334, -0.1429756, -2.852449, 0, 1, 0.6941177, 1,
-0.1692129, -0.6472205, -3.803037, 0, 1, 0.7019608, 1,
-0.1683888, -0.2170213, -2.516903, 0, 1, 0.7058824, 1,
-0.1678696, 1.984323, 0.2315717, 0, 1, 0.7137255, 1,
-0.164097, -1.399747, -1.391558, 0, 1, 0.7176471, 1,
-0.1593604, -0.1572262, -2.92089, 0, 1, 0.7254902, 1,
-0.1575012, 0.3668554, 0.05049083, 0, 1, 0.7294118, 1,
-0.1558111, 1.477876, 0.08691899, 0, 1, 0.7372549, 1,
-0.1521448, 0.5351724, 1.283094, 0, 1, 0.7411765, 1,
-0.1512957, 0.6348457, -0.1156468, 0, 1, 0.7490196, 1,
-0.1505676, -1.294165, -2.126649, 0, 1, 0.7529412, 1,
-0.1458549, -0.4530223, -2.610999, 0, 1, 0.7607843, 1,
-0.1456002, -0.9588278, -2.132856, 0, 1, 0.7647059, 1,
-0.1426167, 0.6289357, 0.8420663, 0, 1, 0.772549, 1,
-0.1382149, -0.6014825, -3.049247, 0, 1, 0.7764706, 1,
-0.1380407, 2.06235, 0.9837289, 0, 1, 0.7843137, 1,
-0.1324597, 0.6217189, 0.4547986, 0, 1, 0.7882353, 1,
-0.1307797, -0.6783916, -3.374907, 0, 1, 0.7960784, 1,
-0.1302316, -0.7615967, -3.385117, 0, 1, 0.8039216, 1,
-0.1282389, 0.9844524, 0.1779863, 0, 1, 0.8078431, 1,
-0.1275836, 0.06445266, -4.230381, 0, 1, 0.8156863, 1,
-0.1273579, 0.6487571, 1.387085, 0, 1, 0.8196079, 1,
-0.1203323, -0.476083, -3.274146, 0, 1, 0.827451, 1,
-0.1156973, 0.3643156, -1.271325, 0, 1, 0.8313726, 1,
-0.1150138, 0.512469, -1.882914, 0, 1, 0.8392157, 1,
-0.114729, -0.5526133, -4.258444, 0, 1, 0.8431373, 1,
-0.1137551, 2.184129, -1.342543, 0, 1, 0.8509804, 1,
-0.1129521, 0.2628865, -0.7820025, 0, 1, 0.854902, 1,
-0.1126697, -0.8922884, -1.25998, 0, 1, 0.8627451, 1,
-0.1113455, -0.8203042, -2.955406, 0, 1, 0.8666667, 1,
-0.1077019, 0.09244868, -0.1854184, 0, 1, 0.8745098, 1,
-0.1025037, -3.30215, -2.402459, 0, 1, 0.8784314, 1,
-0.1018168, -2.414618, -3.665533, 0, 1, 0.8862745, 1,
-0.1016825, 2.178473, 1.640258, 0, 1, 0.8901961, 1,
-0.09792557, 0.2953566, -1.347432, 0, 1, 0.8980392, 1,
-0.09210513, -0.1969245, -2.70955, 0, 1, 0.9058824, 1,
-0.08966758, 0.1982743, -0.6863912, 0, 1, 0.9098039, 1,
-0.08864981, 0.09491105, -0.2692773, 0, 1, 0.9176471, 1,
-0.08782053, 1.851829, -0.04533114, 0, 1, 0.9215686, 1,
-0.08085522, -0.3794719, -2.226113, 0, 1, 0.9294118, 1,
-0.07986306, -1.479191, -1.748285, 0, 1, 0.9333333, 1,
-0.07918076, 0.1588692, -0.7677472, 0, 1, 0.9411765, 1,
-0.0750225, 0.3027737, -2.309699, 0, 1, 0.945098, 1,
-0.07148499, 0.264331, 1.062223, 0, 1, 0.9529412, 1,
-0.07037272, -0.5104563, -3.100388, 0, 1, 0.9568627, 1,
-0.06943746, 0.05635919, -2.797296, 0, 1, 0.9647059, 1,
-0.06664257, -0.1832893, -2.513076, 0, 1, 0.9686275, 1,
-0.06624233, 0.06833324, -0.8821561, 0, 1, 0.9764706, 1,
-0.06539211, 0.2228688, -1.138385, 0, 1, 0.9803922, 1,
-0.06388801, -1.893063, -4.152456, 0, 1, 0.9882353, 1,
-0.05085875, 0.1911407, -0.974637, 0, 1, 0.9921569, 1,
-0.04994883, -0.3871485, -2.213753, 0, 1, 1, 1,
-0.04490001, 1.985868, -0.3887824, 0, 0.9921569, 1, 1,
-0.03958387, -2.076375, -2.253946, 0, 0.9882353, 1, 1,
-0.03671844, 0.2177888, -0.9729473, 0, 0.9803922, 1, 1,
-0.03533701, 0.8604845, -1.022508, 0, 0.9764706, 1, 1,
-0.0349543, 0.09976915, 0.3516725, 0, 0.9686275, 1, 1,
-0.02174404, 1.612487, 0.9619567, 0, 0.9647059, 1, 1,
-0.02122036, -0.02547758, -4.095004, 0, 0.9568627, 1, 1,
-0.02093674, 1.207007, -0.27283, 0, 0.9529412, 1, 1,
-0.01993078, 1.780786, 0.7297781, 0, 0.945098, 1, 1,
-0.01827029, 0.2656436, -0.8241088, 0, 0.9411765, 1, 1,
-0.01731393, -1.154249, -2.686182, 0, 0.9333333, 1, 1,
-0.01661207, -0.1489595, -1.635019, 0, 0.9294118, 1, 1,
-0.01302377, -1.343426, -1.930482, 0, 0.9215686, 1, 1,
-0.01039455, -1.113637, -4.035074, 0, 0.9176471, 1, 1,
-0.00794415, -0.5254644, -2.354969, 0, 0.9098039, 1, 1,
-0.006124489, -0.6581793, -3.239465, 0, 0.9058824, 1, 1,
-0.001675839, 1.000142, 0.2297826, 0, 0.8980392, 1, 1,
0.001585, -0.5803747, 2.796036, 0, 0.8901961, 1, 1,
0.001666699, 0.2088414, -0.1598381, 0, 0.8862745, 1, 1,
0.007063064, 0.2809962, 2.477998, 0, 0.8784314, 1, 1,
0.00869253, 0.4566417, -0.9546029, 0, 0.8745098, 1, 1,
0.01327789, 1.124276, -1.537269, 0, 0.8666667, 1, 1,
0.01350325, 0.887041, 2.170966, 0, 0.8627451, 1, 1,
0.01481764, 2.365169, 0.3412457, 0, 0.854902, 1, 1,
0.01599284, -0.6926206, 2.955693, 0, 0.8509804, 1, 1,
0.01646351, 0.08252214, -0.4745537, 0, 0.8431373, 1, 1,
0.01754031, -0.2478538, 0.8476284, 0, 0.8392157, 1, 1,
0.01859561, 0.2545213, -0.324535, 0, 0.8313726, 1, 1,
0.02205209, -2.002981, 2.944871, 0, 0.827451, 1, 1,
0.02326337, -0.7716035, 3.180378, 0, 0.8196079, 1, 1,
0.02362587, -1.036911, 0.6048725, 0, 0.8156863, 1, 1,
0.02814506, 0.3490889, -0.1877128, 0, 0.8078431, 1, 1,
0.02822237, 0.6315722, -0.6395575, 0, 0.8039216, 1, 1,
0.02878819, 0.05700712, 0.2541898, 0, 0.7960784, 1, 1,
0.03405651, 0.2536805, -0.5042051, 0, 0.7882353, 1, 1,
0.03857512, -0.4060137, 3.385466, 0, 0.7843137, 1, 1,
0.03914865, -0.5173434, 3.302702, 0, 0.7764706, 1, 1,
0.04135217, -2.080582, 4.413168, 0, 0.772549, 1, 1,
0.04643185, 0.04551847, 1.765549, 0, 0.7647059, 1, 1,
0.05252047, 1.44724, -0.4560405, 0, 0.7607843, 1, 1,
0.05294227, 0.5862058, -0.5544502, 0, 0.7529412, 1, 1,
0.05640567, -2.460635, 3.174185, 0, 0.7490196, 1, 1,
0.05671626, -0.147733, 1.764836, 0, 0.7411765, 1, 1,
0.06988303, -0.7263184, 3.354393, 0, 0.7372549, 1, 1,
0.07738841, 0.4238115, 0.6230227, 0, 0.7294118, 1, 1,
0.07899228, 1.383167, 0.7463752, 0, 0.7254902, 1, 1,
0.08252808, -1.07204, 3.536121, 0, 0.7176471, 1, 1,
0.08437534, 0.4382767, 2.112731, 0, 0.7137255, 1, 1,
0.08531861, 0.3698861, 1.002432, 0, 0.7058824, 1, 1,
0.08536758, -1.445588, 1.952756, 0, 0.6980392, 1, 1,
0.090138, 0.1451974, -0.05097701, 0, 0.6941177, 1, 1,
0.09133824, -0.4303258, 4.643106, 0, 0.6862745, 1, 1,
0.09373366, 1.124612, 0.06854482, 0, 0.682353, 1, 1,
0.09404351, 0.6919715, 0.5757395, 0, 0.6745098, 1, 1,
0.09565543, 1.363446, 0.1093146, 0, 0.6705883, 1, 1,
0.09892258, 0.636624, -1.077739, 0, 0.6627451, 1, 1,
0.103413, 0.2943456, -0.2592129, 0, 0.6588235, 1, 1,
0.1034395, 0.551605, -0.4447336, 0, 0.6509804, 1, 1,
0.1040732, -1.075029, 2.720841, 0, 0.6470588, 1, 1,
0.1085988, -0.2648671, 1.349871, 0, 0.6392157, 1, 1,
0.109314, 0.858505, 0.0245276, 0, 0.6352941, 1, 1,
0.1105238, -0.1561681, 1.731909, 0, 0.627451, 1, 1,
0.1124502, 0.1834066, -0.3196587, 0, 0.6235294, 1, 1,
0.1159432, 0.5106882, -0.1575971, 0, 0.6156863, 1, 1,
0.115959, -2.255575, 1.63349, 0, 0.6117647, 1, 1,
0.1168411, 0.4883877, -0.08152962, 0, 0.6039216, 1, 1,
0.1177369, 0.8608261, 0.8078707, 0, 0.5960785, 1, 1,
0.1182821, 0.02983511, 3.123409, 0, 0.5921569, 1, 1,
0.1193953, -0.3899192, 2.898268, 0, 0.5843138, 1, 1,
0.1214698, -0.4191126, 2.530807, 0, 0.5803922, 1, 1,
0.124218, 0.8553683, 1.180471, 0, 0.572549, 1, 1,
0.1252536, -0.4471734, 3.239537, 0, 0.5686275, 1, 1,
0.125486, 0.4902312, 1.239894, 0, 0.5607843, 1, 1,
0.1317564, -1.299458, 2.156339, 0, 0.5568628, 1, 1,
0.1330227, -0.7492394, 2.67974, 0, 0.5490196, 1, 1,
0.1331471, -0.4343472, 1.186176, 0, 0.5450981, 1, 1,
0.1348164, -0.3260105, 3.360676, 0, 0.5372549, 1, 1,
0.139518, 0.4214682, 1.177182, 0, 0.5333334, 1, 1,
0.1397808, -0.2377899, 3.18084, 0, 0.5254902, 1, 1,
0.1399033, -0.6016201, 2.354704, 0, 0.5215687, 1, 1,
0.1441686, 1.375699, -2.622402, 0, 0.5137255, 1, 1,
0.1532414, -0.3910604, 3.521577, 0, 0.509804, 1, 1,
0.1616163, -0.2621124, 2.108704, 0, 0.5019608, 1, 1,
0.1736144, -0.6284871, 2.533007, 0, 0.4941176, 1, 1,
0.1773706, 0.6015559, 0.5695146, 0, 0.4901961, 1, 1,
0.1800452, -1.264594, 3.765055, 0, 0.4823529, 1, 1,
0.1849567, -0.9996672, 3.407021, 0, 0.4784314, 1, 1,
0.1927973, -0.7023811, 2.930226, 0, 0.4705882, 1, 1,
0.2001388, 0.7333858, -0.1417836, 0, 0.4666667, 1, 1,
0.2049079, 1.232099, -0.3982107, 0, 0.4588235, 1, 1,
0.2051952, 0.5866928, 0.7879856, 0, 0.454902, 1, 1,
0.2105576, -1.803886, 3.245602, 0, 0.4470588, 1, 1,
0.2175948, -0.08115207, 1.975982, 0, 0.4431373, 1, 1,
0.2189498, -1.793677, 3.384847, 0, 0.4352941, 1, 1,
0.2196542, -0.1030362, 1.872244, 0, 0.4313726, 1, 1,
0.221972, 0.7851238, -0.7080457, 0, 0.4235294, 1, 1,
0.2222143, 1.30125, -0.9013987, 0, 0.4196078, 1, 1,
0.2224857, 1.752655, 0.4703664, 0, 0.4117647, 1, 1,
0.2302375, -1.714883, 3.306763, 0, 0.4078431, 1, 1,
0.2345849, 0.2572765, 0.9836181, 0, 0.4, 1, 1,
0.2360572, -0.6541394, 2.518187, 0, 0.3921569, 1, 1,
0.2362602, -1.035776, 3.665428, 0, 0.3882353, 1, 1,
0.2370753, -1.748613, 1.640805, 0, 0.3803922, 1, 1,
0.2383722, -2.263942, 3.521045, 0, 0.3764706, 1, 1,
0.2388324, 0.4873205, 1.111115, 0, 0.3686275, 1, 1,
0.2391016, 0.1924955, 0.5849288, 0, 0.3647059, 1, 1,
0.2430524, -0.486833, 2.728997, 0, 0.3568628, 1, 1,
0.2458133, 0.5591664, -0.2450504, 0, 0.3529412, 1, 1,
0.2469005, 1.442676, 0.6936, 0, 0.345098, 1, 1,
0.2490353, -0.4694926, 3.741723, 0, 0.3411765, 1, 1,
0.2520433, 0.6321822, 1.280195, 0, 0.3333333, 1, 1,
0.2522089, 2.071899, -0.4320896, 0, 0.3294118, 1, 1,
0.2523775, -0.3378912, 2.756214, 0, 0.3215686, 1, 1,
0.2540285, -1.295964, 2.424211, 0, 0.3176471, 1, 1,
0.2568235, -0.3631924, 1.527951, 0, 0.3098039, 1, 1,
0.2571765, 0.8557135, -0.9183629, 0, 0.3058824, 1, 1,
0.257899, 0.3080729, 1.674135, 0, 0.2980392, 1, 1,
0.2591995, 0.6774943, 0.1742438, 0, 0.2901961, 1, 1,
0.2593037, -1.65953, 4.158198, 0, 0.2862745, 1, 1,
0.2605103, 0.9171827, -0.5877523, 0, 0.2784314, 1, 1,
0.2606973, 1.099106, -0.3156807, 0, 0.2745098, 1, 1,
0.261911, -0.5657242, 4.716955, 0, 0.2666667, 1, 1,
0.2623621, -1.373042, 3.386353, 0, 0.2627451, 1, 1,
0.2633959, -0.6555262, 3.681629, 0, 0.254902, 1, 1,
0.2636148, -0.6333945, 3.365825, 0, 0.2509804, 1, 1,
0.2677935, 1.099112, -0.1144293, 0, 0.2431373, 1, 1,
0.2688489, 0.175785, 0.7611057, 0, 0.2392157, 1, 1,
0.269182, -1.502136, 2.885817, 0, 0.2313726, 1, 1,
0.2715967, -0.6613839, 1.865369, 0, 0.227451, 1, 1,
0.2776561, -1.97964, 2.088935, 0, 0.2196078, 1, 1,
0.2823506, 0.6251536, 1.130663, 0, 0.2156863, 1, 1,
0.2835001, 0.835324, 1.561356, 0, 0.2078431, 1, 1,
0.2851048, -0.2080731, 0.7197216, 0, 0.2039216, 1, 1,
0.3007047, 1.149621, 0.8132784, 0, 0.1960784, 1, 1,
0.3013559, -0.1028592, 1.489426, 0, 0.1882353, 1, 1,
0.3020962, 1.009008, 0.3381335, 0, 0.1843137, 1, 1,
0.3177936, -0.02566135, 1.161719, 0, 0.1764706, 1, 1,
0.3187466, 0.8482412, -0.7560207, 0, 0.172549, 1, 1,
0.3196539, 1.001417, -0.04676788, 0, 0.1647059, 1, 1,
0.3208048, 0.07311574, 3.07689, 0, 0.1607843, 1, 1,
0.3236354, -0.4899193, 2.375263, 0, 0.1529412, 1, 1,
0.3266745, -0.4160822, 2.542139, 0, 0.1490196, 1, 1,
0.3326527, -0.3802764, 4.05347, 0, 0.1411765, 1, 1,
0.3339397, 1.054491, 0.7951654, 0, 0.1372549, 1, 1,
0.3371059, -0.5679378, 3.445065, 0, 0.1294118, 1, 1,
0.3375189, -0.222739, 2.159567, 0, 0.1254902, 1, 1,
0.3378892, -0.4514427, 1.652996, 0, 0.1176471, 1, 1,
0.3389943, 0.4121099, -0.09687428, 0, 0.1137255, 1, 1,
0.3412417, 0.002683306, 1.168293, 0, 0.1058824, 1, 1,
0.3455581, 1.286665, 0.5753821, 0, 0.09803922, 1, 1,
0.3509444, -0.5755921, 2.230385, 0, 0.09411765, 1, 1,
0.3535278, 1.526679, 1.444157, 0, 0.08627451, 1, 1,
0.3548973, 1.120533, -1.191708, 0, 0.08235294, 1, 1,
0.3618086, -1.026531, 2.036473, 0, 0.07450981, 1, 1,
0.3633545, -0.2465385, 2.929686, 0, 0.07058824, 1, 1,
0.3635729, 0.06645259, 2.188106, 0, 0.0627451, 1, 1,
0.3661851, -0.2233625, 2.195511, 0, 0.05882353, 1, 1,
0.3715822, 0.567157, 0.9506243, 0, 0.05098039, 1, 1,
0.3730802, 0.4196991, 0.0009572098, 0, 0.04705882, 1, 1,
0.3754555, -0.3343156, 1.182293, 0, 0.03921569, 1, 1,
0.3766324, 0.07201185, 1.613781, 0, 0.03529412, 1, 1,
0.3798604, 1.444536, 1.076017, 0, 0.02745098, 1, 1,
0.380004, -0.6100978, 2.552859, 0, 0.02352941, 1, 1,
0.3841479, 0.8056071, 0.02140329, 0, 0.01568628, 1, 1,
0.3913393, 0.8987332, -1.027984, 0, 0.01176471, 1, 1,
0.3987393, 0.7602878, 0.2942879, 0, 0.003921569, 1, 1,
0.3989471, -3.456657, 3.660581, 0.003921569, 0, 1, 1,
0.4010093, 0.01205032, 1.873864, 0.007843138, 0, 1, 1,
0.4065689, -1.289066, 3.475416, 0.01568628, 0, 1, 1,
0.4115347, -1.059104, 5.597372, 0.01960784, 0, 1, 1,
0.4123176, 0.3617069, 0.005785371, 0.02745098, 0, 1, 1,
0.4135188, -0.7726952, 2.440247, 0.03137255, 0, 1, 1,
0.4180656, -1.646932, 2.920557, 0.03921569, 0, 1, 1,
0.4228791, -0.4416683, 1.972574, 0.04313726, 0, 1, 1,
0.4337076, -0.1214814, 2.40992, 0.05098039, 0, 1, 1,
0.4339756, 0.1538563, 3.053335, 0.05490196, 0, 1, 1,
0.4349804, -0.06602342, 1.009702, 0.0627451, 0, 1, 1,
0.4361472, 0.09915077, 0.8268335, 0.06666667, 0, 1, 1,
0.4366618, -0.6907806, 3.082131, 0.07450981, 0, 1, 1,
0.4388629, 0.03848834, 0.239653, 0.07843138, 0, 1, 1,
0.4389553, 0.05889622, 1.61815, 0.08627451, 0, 1, 1,
0.4437045, -1.747891, 2.329942, 0.09019608, 0, 1, 1,
0.4452072, 0.3852203, 2.469925, 0.09803922, 0, 1, 1,
0.4512977, -1.827191, 2.63461, 0.1058824, 0, 1, 1,
0.4517236, -0.2163234, 1.315818, 0.1098039, 0, 1, 1,
0.4526291, 1.20975, -0.9639625, 0.1176471, 0, 1, 1,
0.4540672, -1.239666, 2.26735, 0.1215686, 0, 1, 1,
0.4550267, 0.1944727, -0.1916397, 0.1294118, 0, 1, 1,
0.4607649, -0.8605287, 3.034971, 0.1333333, 0, 1, 1,
0.4619871, -0.6328253, 3.590053, 0.1411765, 0, 1, 1,
0.4621955, 0.3450236, 0.9948922, 0.145098, 0, 1, 1,
0.4662621, 1.75842, 0.2789875, 0.1529412, 0, 1, 1,
0.475347, -0.223057, 1.806503, 0.1568628, 0, 1, 1,
0.4772311, -1.140449, 3.622272, 0.1647059, 0, 1, 1,
0.4856349, -0.6366152, 3.875558, 0.1686275, 0, 1, 1,
0.4880278, -0.04209482, 0.5909771, 0.1764706, 0, 1, 1,
0.4901366, -0.2365242, 2.268473, 0.1803922, 0, 1, 1,
0.4957034, 1.58373, 1.030131, 0.1882353, 0, 1, 1,
0.498654, 0.2378252, 1.103348, 0.1921569, 0, 1, 1,
0.5027279, 0.2147065, -0.03473694, 0.2, 0, 1, 1,
0.5080405, -0.159411, 2.586588, 0.2078431, 0, 1, 1,
0.5089873, -1.081318, 1.910692, 0.2117647, 0, 1, 1,
0.5127752, 0.6785198, 1.211947, 0.2196078, 0, 1, 1,
0.5129444, 0.4399626, 0.3844298, 0.2235294, 0, 1, 1,
0.5130832, -1.687913, 2.606046, 0.2313726, 0, 1, 1,
0.5170239, -2.81859, 3.041183, 0.2352941, 0, 1, 1,
0.5188571, -0.8157717, 3.19098, 0.2431373, 0, 1, 1,
0.5197538, -0.4575361, 1.672445, 0.2470588, 0, 1, 1,
0.521255, 0.4047443, 0.07766841, 0.254902, 0, 1, 1,
0.5250688, -0.7093019, 1.560741, 0.2588235, 0, 1, 1,
0.5342434, -0.07371594, 2.606796, 0.2666667, 0, 1, 1,
0.5458449, -0.7197918, 2.232225, 0.2705882, 0, 1, 1,
0.5465689, 1.225874, 0.9403018, 0.2784314, 0, 1, 1,
0.5466818, -0.3821074, 2.530756, 0.282353, 0, 1, 1,
0.5484813, 0.5970325, 2.142792, 0.2901961, 0, 1, 1,
0.5498765, 0.1586454, 1.468431, 0.2941177, 0, 1, 1,
0.5551598, -0.6893624, 1.247313, 0.3019608, 0, 1, 1,
0.5591748, 0.9265139, -0.3852654, 0.3098039, 0, 1, 1,
0.5621278, -1.521394, 2.078989, 0.3137255, 0, 1, 1,
0.5704209, -0.6906942, 3.395783, 0.3215686, 0, 1, 1,
0.5750424, 2.322373, 1.4868, 0.3254902, 0, 1, 1,
0.5784128, 0.009396585, 1.923545, 0.3333333, 0, 1, 1,
0.5829362, 0.7820912, 0.5578893, 0.3372549, 0, 1, 1,
0.5857125, 0.1536154, -1.209486, 0.345098, 0, 1, 1,
0.5871786, 0.03136707, 1.52438, 0.3490196, 0, 1, 1,
0.587692, -0.1390664, 2.049052, 0.3568628, 0, 1, 1,
0.5912156, 0.5011309, -0.7221192, 0.3607843, 0, 1, 1,
0.5916108, 1.059092, 1.856577, 0.3686275, 0, 1, 1,
0.5944127, -0.9546483, 4.408117, 0.372549, 0, 1, 1,
0.5967261, -1.55228, 2.711068, 0.3803922, 0, 1, 1,
0.5990591, 0.4267108, -2.200005, 0.3843137, 0, 1, 1,
0.6047604, 1.486358, -0.3163785, 0.3921569, 0, 1, 1,
0.604924, 1.456805, -0.2735467, 0.3960784, 0, 1, 1,
0.6070563, -0.8886552, 1.845248, 0.4039216, 0, 1, 1,
0.6077022, -0.8582479, 3.717478, 0.4117647, 0, 1, 1,
0.6077972, -0.0585481, 0.07741491, 0.4156863, 0, 1, 1,
0.6138573, 1.180828, -0.4134284, 0.4235294, 0, 1, 1,
0.6165416, 0.3307445, 0.2973526, 0.427451, 0, 1, 1,
0.6187123, 0.1032523, 0.8943471, 0.4352941, 0, 1, 1,
0.620694, -1.327489, 1.660956, 0.4392157, 0, 1, 1,
0.6213372, 0.7072301, 1.432621, 0.4470588, 0, 1, 1,
0.6272928, 1.344785, 0.6229625, 0.4509804, 0, 1, 1,
0.6288562, -0.3224339, 2.159482, 0.4588235, 0, 1, 1,
0.62939, -0.005978008, 0.1508201, 0.4627451, 0, 1, 1,
0.6317432, -0.5217039, 2.089564, 0.4705882, 0, 1, 1,
0.6372678, -1.509799, 2.845304, 0.4745098, 0, 1, 1,
0.6399469, 0.04451857, 2.772275, 0.4823529, 0, 1, 1,
0.6408498, 1.200832, 1.833102, 0.4862745, 0, 1, 1,
0.6416677, 0.7703658, 0.7753575, 0.4941176, 0, 1, 1,
0.6433358, 0.1525824, 2.919022, 0.5019608, 0, 1, 1,
0.6470099, -0.9750875, 2.307301, 0.5058824, 0, 1, 1,
0.6594399, 0.4934797, 0.7341129, 0.5137255, 0, 1, 1,
0.6605265, 1.183143, 1.968812, 0.5176471, 0, 1, 1,
0.660794, 0.938527, 0.8118439, 0.5254902, 0, 1, 1,
0.6652677, 0.8522001, 0.3546765, 0.5294118, 0, 1, 1,
0.6702238, 0.0450507, 1.049047, 0.5372549, 0, 1, 1,
0.6705292, 0.7121896, 0.8748368, 0.5411765, 0, 1, 1,
0.6725172, 0.9896731, 0.06173161, 0.5490196, 0, 1, 1,
0.6765027, 0.4751938, 0.3998526, 0.5529412, 0, 1, 1,
0.6771288, -0.672242, 1.786103, 0.5607843, 0, 1, 1,
0.6784823, 0.8454096, 0.9913509, 0.5647059, 0, 1, 1,
0.6851307, 0.3629473, -0.1758583, 0.572549, 0, 1, 1,
0.6881565, 1.600375, 0.007978606, 0.5764706, 0, 1, 1,
0.6927072, -1.655569, 3.698865, 0.5843138, 0, 1, 1,
0.6936581, -1.10201, 2.093657, 0.5882353, 0, 1, 1,
0.6989105, 1.574007, -0.5603569, 0.5960785, 0, 1, 1,
0.7004573, 0.9155138, 0.9282492, 0.6039216, 0, 1, 1,
0.7119895, 0.4098573, 1.475992, 0.6078432, 0, 1, 1,
0.7128481, -1.471216, 3.198601, 0.6156863, 0, 1, 1,
0.7148253, 0.1412282, 2.464733, 0.6196079, 0, 1, 1,
0.7159347, -1.999766, 2.075522, 0.627451, 0, 1, 1,
0.719413, -0.796997, 2.09565, 0.6313726, 0, 1, 1,
0.7196755, -1.53853, 2.959052, 0.6392157, 0, 1, 1,
0.7222329, -1.759444, 2.929786, 0.6431373, 0, 1, 1,
0.7237062, 0.7172613, -0.5419986, 0.6509804, 0, 1, 1,
0.7244312, -0.6841701, 0.5726711, 0.654902, 0, 1, 1,
0.7248059, -1.444452, 2.853017, 0.6627451, 0, 1, 1,
0.7388242, -0.713286, 1.936543, 0.6666667, 0, 1, 1,
0.7446665, 1.475211, 0.5382949, 0.6745098, 0, 1, 1,
0.7448153, -0.8871647, 1.103214, 0.6784314, 0, 1, 1,
0.7477505, 1.238186, 0.226387, 0.6862745, 0, 1, 1,
0.7490724, -1.544616, 1.267999, 0.6901961, 0, 1, 1,
0.7498205, 0.1765492, 2.037713, 0.6980392, 0, 1, 1,
0.7546241, 1.032579, 0.5698339, 0.7058824, 0, 1, 1,
0.7550819, 0.4136759, 1.241835, 0.7098039, 0, 1, 1,
0.7579378, -0.2971207, 2.950832, 0.7176471, 0, 1, 1,
0.7622882, -0.02990626, 2.724032, 0.7215686, 0, 1, 1,
0.7639518, 0.5803488, 2.137076, 0.7294118, 0, 1, 1,
0.768881, -0.5890908, 2.674235, 0.7333333, 0, 1, 1,
0.7712284, 0.3778304, -0.1447532, 0.7411765, 0, 1, 1,
0.7722778, 0.6357082, -0.2920356, 0.7450981, 0, 1, 1,
0.7790469, 0.7107216, 0.8033382, 0.7529412, 0, 1, 1,
0.7808122, 0.6327658, 0.5460411, 0.7568628, 0, 1, 1,
0.7819124, 0.3418576, 1.306316, 0.7647059, 0, 1, 1,
0.784795, 0.9424229, -0.1074415, 0.7686275, 0, 1, 1,
0.7885867, -0.242132, 2.472225, 0.7764706, 0, 1, 1,
0.7896991, -0.536501, 1.661898, 0.7803922, 0, 1, 1,
0.7907059, -1.040787, 1.872697, 0.7882353, 0, 1, 1,
0.7942889, -1.259708, 3.984824, 0.7921569, 0, 1, 1,
0.7967925, -0.1965059, 2.614321, 0.8, 0, 1, 1,
0.7978057, -1.06844, 3.255782, 0.8078431, 0, 1, 1,
0.8031242, -0.3966925, 1.919892, 0.8117647, 0, 1, 1,
0.8032306, -1.009828, 2.502972, 0.8196079, 0, 1, 1,
0.8072762, 1.86883, 0.254298, 0.8235294, 0, 1, 1,
0.8078288, -1.534916, 2.718495, 0.8313726, 0, 1, 1,
0.8122515, 1.145478, -0.8994838, 0.8352941, 0, 1, 1,
0.8180317, -1.471848, 1.243721, 0.8431373, 0, 1, 1,
0.8201861, -0.1619048, 0.6107273, 0.8470588, 0, 1, 1,
0.8217151, -0.3029472, 1.622197, 0.854902, 0, 1, 1,
0.8217982, -0.4810132, 1.675583, 0.8588235, 0, 1, 1,
0.824855, 0.4118069, 0.5373657, 0.8666667, 0, 1, 1,
0.8254709, 0.7343612, 2.212972, 0.8705882, 0, 1, 1,
0.8258579, 0.5588132, 0.8420501, 0.8784314, 0, 1, 1,
0.8326262, -0.03415634, 0.9824871, 0.8823529, 0, 1, 1,
0.8362, 0.3651312, -1.217189, 0.8901961, 0, 1, 1,
0.8405824, -0.7558374, 1.796361, 0.8941177, 0, 1, 1,
0.8464756, 1.663482, 0.6768836, 0.9019608, 0, 1, 1,
0.8555556, -0.8608873, 2.194501, 0.9098039, 0, 1, 1,
0.8571224, 0.2692195, 1.984501, 0.9137255, 0, 1, 1,
0.8622274, 0.3675358, 1.512748, 0.9215686, 0, 1, 1,
0.8632742, -0.4016499, 3.314096, 0.9254902, 0, 1, 1,
0.8709218, 0.3948943, 0.7959065, 0.9333333, 0, 1, 1,
0.8722014, 0.02421535, 3.652045, 0.9372549, 0, 1, 1,
0.8723451, 0.4810199, 2.047426, 0.945098, 0, 1, 1,
0.8779285, 0.7069525, -0.1594456, 0.9490196, 0, 1, 1,
0.8800523, 0.2699082, 0.2957059, 0.9568627, 0, 1, 1,
0.8828982, -0.3860663, 0.7887293, 0.9607843, 0, 1, 1,
0.884437, -0.8878512, 2.415417, 0.9686275, 0, 1, 1,
0.8851572, -0.4292062, 2.005809, 0.972549, 0, 1, 1,
0.8852746, -1.044481, 1.161925, 0.9803922, 0, 1, 1,
0.8862092, -0.4165114, 0.9377438, 0.9843137, 0, 1, 1,
0.8911137, 0.3538404, 0.7627665, 0.9921569, 0, 1, 1,
0.8953229, 0.4878448, 1.631245, 0.9960784, 0, 1, 1,
0.8987435, 0.5119182, 1.13886, 1, 0, 0.9960784, 1,
0.9231586, 0.8521981, -0.1544929, 1, 0, 0.9882353, 1,
0.9411725, -0.8004661, 1.331057, 1, 0, 0.9843137, 1,
0.9424762, -0.02129993, 2.806725, 1, 0, 0.9764706, 1,
0.943445, -0.489619, 3.048252, 1, 0, 0.972549, 1,
0.9455932, -0.1048755, 1.74428, 1, 0, 0.9647059, 1,
0.9469851, -1.359365, 2.938514, 1, 0, 0.9607843, 1,
0.950232, -1.701481, 3.561201, 1, 0, 0.9529412, 1,
0.9513474, 1.05171, 1.291452, 1, 0, 0.9490196, 1,
0.9601911, -1.463154, 0.5964215, 1, 0, 0.9411765, 1,
0.9742311, 1.07877, -0.192609, 1, 0, 0.9372549, 1,
0.9754551, 0.8471634, 0.5617929, 1, 0, 0.9294118, 1,
0.9797952, -1.453933, 3.571887, 1, 0, 0.9254902, 1,
0.9941036, -0.3912424, 3.442883, 1, 0, 0.9176471, 1,
1.006757, 0.8264058, 1.453305, 1, 0, 0.9137255, 1,
1.006815, -0.8810836, 3.171162, 1, 0, 0.9058824, 1,
1.011114, -0.2218175, 3.733212, 1, 0, 0.9019608, 1,
1.014826, -0.628883, 2.022141, 1, 0, 0.8941177, 1,
1.020911, -0.3269061, 4.354875, 1, 0, 0.8862745, 1,
1.021862, 1.034097, 1.249237, 1, 0, 0.8823529, 1,
1.027367, -0.4034036, 3.720116, 1, 0, 0.8745098, 1,
1.028903, 0.6259619, 1.194121, 1, 0, 0.8705882, 1,
1.032051, -0.5542808, 1.120036, 1, 0, 0.8627451, 1,
1.053935, -0.1840787, 1.531834, 1, 0, 0.8588235, 1,
1.055683, -0.6698673, 4.125016, 1, 0, 0.8509804, 1,
1.057557, 0.8386799, 0.5885991, 1, 0, 0.8470588, 1,
1.062399, 1.556081, 1.548847, 1, 0, 0.8392157, 1,
1.067331, 0.03124648, 2.323504, 1, 0, 0.8352941, 1,
1.072159, 1.02469, 1.700588, 1, 0, 0.827451, 1,
1.083424, 0.4104274, 1.015478, 1, 0, 0.8235294, 1,
1.086563, 0.6469033, 1.30241, 1, 0, 0.8156863, 1,
1.087963, 2.114608, -0.7278428, 1, 0, 0.8117647, 1,
1.094386, 0.4952473, -0.1300489, 1, 0, 0.8039216, 1,
1.098665, 0.2459409, 3.971256, 1, 0, 0.7960784, 1,
1.099653, -0.2220775, 1.661275, 1, 0, 0.7921569, 1,
1.102066, -0.3680987, 2.89238, 1, 0, 0.7843137, 1,
1.114037, 0.8293922, 0.9083562, 1, 0, 0.7803922, 1,
1.122208, 1.82298, 1.722217, 1, 0, 0.772549, 1,
1.125334, 0.127856, 2.790797, 1, 0, 0.7686275, 1,
1.12667, -1.177584, 3.921425, 1, 0, 0.7607843, 1,
1.131057, 0.5010411, 0.8002477, 1, 0, 0.7568628, 1,
1.139813, -0.9517034, 2.092577, 1, 0, 0.7490196, 1,
1.152698, 1.166885, 1.536806, 1, 0, 0.7450981, 1,
1.153892, -0.8290495, 0.9120982, 1, 0, 0.7372549, 1,
1.158048, -0.02275316, 2.15742, 1, 0, 0.7333333, 1,
1.163871, -1.003715, 3.905215, 1, 0, 0.7254902, 1,
1.164561, -0.7179747, 2.461282, 1, 0, 0.7215686, 1,
1.178596, 0.5853134, 0.8206238, 1, 0, 0.7137255, 1,
1.196136, 0.201571, 1.029102, 1, 0, 0.7098039, 1,
1.198938, 1.441491, 1.619251, 1, 0, 0.7019608, 1,
1.207552, 0.4560201, 2.223212, 1, 0, 0.6941177, 1,
1.209179, -2.631272, 2.88733, 1, 0, 0.6901961, 1,
1.21144, -0.2561871, 0.8646449, 1, 0, 0.682353, 1,
1.211604, -0.4192634, 2.642818, 1, 0, 0.6784314, 1,
1.215053, -0.3203246, 1.507638, 1, 0, 0.6705883, 1,
1.230069, 1.876936, 0.4430225, 1, 0, 0.6666667, 1,
1.231534, -1.278726, 2.710449, 1, 0, 0.6588235, 1,
1.236645, 0.06770554, 2.125551, 1, 0, 0.654902, 1,
1.239724, -1.0334, 3.776812, 1, 0, 0.6470588, 1,
1.242368, 0.2083702, 2.146588, 1, 0, 0.6431373, 1,
1.246745, -0.1962469, 0.9340863, 1, 0, 0.6352941, 1,
1.247882, 0.4190702, 2.68655, 1, 0, 0.6313726, 1,
1.248626, -0.5784267, 2.598115, 1, 0, 0.6235294, 1,
1.256634, -0.1160382, 1.709564, 1, 0, 0.6196079, 1,
1.260234, 1.007781, 0.6679621, 1, 0, 0.6117647, 1,
1.260329, 0.06223606, 1.658599, 1, 0, 0.6078432, 1,
1.269724, -0.7048377, 2.656817, 1, 0, 0.6, 1,
1.285392, 0.47079, 4.045185, 1, 0, 0.5921569, 1,
1.300704, -2.214657, 4.288581, 1, 0, 0.5882353, 1,
1.309268, 0.148591, 3.638368, 1, 0, 0.5803922, 1,
1.310404, 0.7410555, 0.2191591, 1, 0, 0.5764706, 1,
1.31062, 0.1167671, -0.2016621, 1, 0, 0.5686275, 1,
1.323147, 0.5607204, 0.2113356, 1, 0, 0.5647059, 1,
1.333735, 0.8897619, -0.1361273, 1, 0, 0.5568628, 1,
1.339717, 0.04013507, 0.7444476, 1, 0, 0.5529412, 1,
1.340156, -0.2081657, 0.8849076, 1, 0, 0.5450981, 1,
1.340421, -1.616792, 1.317456, 1, 0, 0.5411765, 1,
1.34141, 1.271612, -1.210825, 1, 0, 0.5333334, 1,
1.342428, -1.958777, 2.593681, 1, 0, 0.5294118, 1,
1.34756, -0.8509089, 1.986587, 1, 0, 0.5215687, 1,
1.353493, 1.089251, 1.010739, 1, 0, 0.5176471, 1,
1.372422, 0.419213, 1.201405, 1, 0, 0.509804, 1,
1.374786, -2.217793, 1.976219, 1, 0, 0.5058824, 1,
1.378169, 1.632503, 1.343501, 1, 0, 0.4980392, 1,
1.381767, -0.8297578, 2.520054, 1, 0, 0.4901961, 1,
1.383424, -0.1208433, 1.968586, 1, 0, 0.4862745, 1,
1.384264, -0.5976382, 2.923432, 1, 0, 0.4784314, 1,
1.387057, 0.05783305, 0.9715926, 1, 0, 0.4745098, 1,
1.41159, 2.089405, 2.337595, 1, 0, 0.4666667, 1,
1.41454, -1.501087, 2.53935, 1, 0, 0.4627451, 1,
1.418095, -1.189537, -0.07655805, 1, 0, 0.454902, 1,
1.433371, -1.41156, 2.200081, 1, 0, 0.4509804, 1,
1.437201, -0.1498629, 0.9333896, 1, 0, 0.4431373, 1,
1.437394, 0.02978439, 0.7995936, 1, 0, 0.4392157, 1,
1.43843, -1.541552, 1.802197, 1, 0, 0.4313726, 1,
1.442819, -0.1517966, 2.884025, 1, 0, 0.427451, 1,
1.443863, -2.407526, 1.912307, 1, 0, 0.4196078, 1,
1.444413, 0.9987909, 2.86657, 1, 0, 0.4156863, 1,
1.472519, -1.407735, 2.589941, 1, 0, 0.4078431, 1,
1.473513, 0.7882338, 0.700891, 1, 0, 0.4039216, 1,
1.474544, -0.2713634, 3.091925, 1, 0, 0.3960784, 1,
1.475098, -1.032453, 2.559818, 1, 0, 0.3882353, 1,
1.475313, 0.4723848, -0.148803, 1, 0, 0.3843137, 1,
1.496749, 0.5032565, 1.932893, 1, 0, 0.3764706, 1,
1.503496, 0.8813716, 0.6553725, 1, 0, 0.372549, 1,
1.523394, -0.1031331, 2.438554, 1, 0, 0.3647059, 1,
1.533821, 3.318856, -2.48332, 1, 0, 0.3607843, 1,
1.543292, 0.9611126, 1.783447, 1, 0, 0.3529412, 1,
1.545624, -0.7466342, 2.725034, 1, 0, 0.3490196, 1,
1.546796, 1.089152, 1.309005, 1, 0, 0.3411765, 1,
1.547771, 1.342546, -1.148315, 1, 0, 0.3372549, 1,
1.556571, 0.2122961, 2.145247, 1, 0, 0.3294118, 1,
1.56993, 1.427871, 1.764756, 1, 0, 0.3254902, 1,
1.579687, -1.016037, 2.297787, 1, 0, 0.3176471, 1,
1.589261, -0.8196005, 2.246055, 1, 0, 0.3137255, 1,
1.592931, -0.1895056, 0.98041, 1, 0, 0.3058824, 1,
1.600524, 1.107513, 3.369576, 1, 0, 0.2980392, 1,
1.622594, 1.557764, 0.3526791, 1, 0, 0.2941177, 1,
1.631495, -1.195256, 1.791931, 1, 0, 0.2862745, 1,
1.633367, 1.82251, 0.661249, 1, 0, 0.282353, 1,
1.641164, -0.6089615, 4.363918, 1, 0, 0.2745098, 1,
1.650804, 0.8092986, 0.4359029, 1, 0, 0.2705882, 1,
1.661374, -0.6284794, 2.057602, 1, 0, 0.2627451, 1,
1.672628, -1.215814, 0.6518046, 1, 0, 0.2588235, 1,
1.676924, 1.271447, 3.282886, 1, 0, 0.2509804, 1,
1.682604, -0.5401821, 2.261875, 1, 0, 0.2470588, 1,
1.686653, -0.6537677, 1.321635, 1, 0, 0.2392157, 1,
1.703206, 0.4465624, -0.006458594, 1, 0, 0.2352941, 1,
1.7173, 1.150603, -0.2073248, 1, 0, 0.227451, 1,
1.763453, 0.2739657, 2.115185, 1, 0, 0.2235294, 1,
1.789252, -0.5367571, 1.857535, 1, 0, 0.2156863, 1,
1.803908, -0.1675869, 1.472912, 1, 0, 0.2117647, 1,
1.804317, -0.6909169, 2.398715, 1, 0, 0.2039216, 1,
1.829907, -3.980628, 3.763646, 1, 0, 0.1960784, 1,
1.872794, 1.072641, 1.776729, 1, 0, 0.1921569, 1,
1.875641, 1.03632, 0.6194027, 1, 0, 0.1843137, 1,
1.876623, 0.677579, 1.844377, 1, 0, 0.1803922, 1,
1.88548, 1.034752, 0.5216997, 1, 0, 0.172549, 1,
1.886209, 0.560293, 1.474221, 1, 0, 0.1686275, 1,
1.916264, 1.388239, 0.7420537, 1, 0, 0.1607843, 1,
1.924538, -1.401231, 1.485034, 1, 0, 0.1568628, 1,
1.954633, -1.159995, 0.4876943, 1, 0, 0.1490196, 1,
1.962377, -0.1625973, 1.407408, 1, 0, 0.145098, 1,
1.965792, -1.01523, 1.233503, 1, 0, 0.1372549, 1,
1.999938, -0.5017964, 2.047672, 1, 0, 0.1333333, 1,
2.001431, 0.5921286, 2.042179, 1, 0, 0.1254902, 1,
2.017256, 0.1666414, 1.47479, 1, 0, 0.1215686, 1,
2.054597, -1.603634, 3.191909, 1, 0, 0.1137255, 1,
2.075347, 0.760381, 0.5367785, 1, 0, 0.1098039, 1,
2.075872, -0.3160138, 0.9913709, 1, 0, 0.1019608, 1,
2.082911, -0.05360549, -0.663357, 1, 0, 0.09411765, 1,
2.15871, 0.2235625, 1.345772, 1, 0, 0.09019608, 1,
2.159822, 0.4790977, 0.4488767, 1, 0, 0.08235294, 1,
2.163848, 0.6401027, 2.401331, 1, 0, 0.07843138, 1,
2.188238, 0.01792225, 0.08213723, 1, 0, 0.07058824, 1,
2.19156, -1.234068, 2.971838, 1, 0, 0.06666667, 1,
2.20449, 1.071103, 1.602928, 1, 0, 0.05882353, 1,
2.281923, -0.178421, 0.2677867, 1, 0, 0.05490196, 1,
2.296328, 0.03556587, 1.322926, 1, 0, 0.04705882, 1,
2.452812, -0.8314918, 2.964325, 1, 0, 0.04313726, 1,
2.462162, -0.06623652, 1.735691, 1, 0, 0.03529412, 1,
2.58781, 0.1395543, 2.022372, 1, 0, 0.03137255, 1,
2.613634, 1.770114, 1.342179, 1, 0, 0.02352941, 1,
2.617001, 0.6561099, 2.486578, 1, 0, 0.01960784, 1,
2.76572, -0.2718991, 2.655071, 1, 0, 0.01176471, 1,
2.962317, 1.314712, 0.601652, 1, 0, 0.007843138, 1
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
-0.1868676, -5.217891, -6.981297, 0, -0.5, 0.5, 0.5,
-0.1868676, -5.217891, -6.981297, 1, -0.5, 0.5, 0.5,
-0.1868676, -5.217891, -6.981297, 1, 1.5, 0.5, 0.5,
-0.1868676, -5.217891, -6.981297, 0, 1.5, 0.5, 0.5
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
-4.403626, -0.3308861, -6.981297, 0, -0.5, 0.5, 0.5,
-4.403626, -0.3308861, -6.981297, 1, -0.5, 0.5, 0.5,
-4.403626, -0.3308861, -6.981297, 1, 1.5, 0.5, 0.5,
-4.403626, -0.3308861, -6.981297, 0, 1.5, 0.5, 0.5
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
-4.403626, -5.217891, 0.2195742, 0, -0.5, 0.5, 0.5,
-4.403626, -5.217891, 0.2195742, 1, -0.5, 0.5, 0.5,
-4.403626, -5.217891, 0.2195742, 1, 1.5, 0.5, 0.5,
-4.403626, -5.217891, 0.2195742, 0, 1.5, 0.5, 0.5
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
-3, -4.09012, -5.319557,
2, -4.09012, -5.319557,
-3, -4.09012, -5.319557,
-3, -4.278082, -5.596514,
-2, -4.09012, -5.319557,
-2, -4.278082, -5.596514,
-1, -4.09012, -5.319557,
-1, -4.278082, -5.596514,
0, -4.09012, -5.319557,
0, -4.278082, -5.596514,
1, -4.09012, -5.319557,
1, -4.278082, -5.596514,
2, -4.09012, -5.319557,
2, -4.278082, -5.596514
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
-3, -4.654006, -6.150427, 0, -0.5, 0.5, 0.5,
-3, -4.654006, -6.150427, 1, -0.5, 0.5, 0.5,
-3, -4.654006, -6.150427, 1, 1.5, 0.5, 0.5,
-3, -4.654006, -6.150427, 0, 1.5, 0.5, 0.5,
-2, -4.654006, -6.150427, 0, -0.5, 0.5, 0.5,
-2, -4.654006, -6.150427, 1, -0.5, 0.5, 0.5,
-2, -4.654006, -6.150427, 1, 1.5, 0.5, 0.5,
-2, -4.654006, -6.150427, 0, 1.5, 0.5, 0.5,
-1, -4.654006, -6.150427, 0, -0.5, 0.5, 0.5,
-1, -4.654006, -6.150427, 1, -0.5, 0.5, 0.5,
-1, -4.654006, -6.150427, 1, 1.5, 0.5, 0.5,
-1, -4.654006, -6.150427, 0, 1.5, 0.5, 0.5,
0, -4.654006, -6.150427, 0, -0.5, 0.5, 0.5,
0, -4.654006, -6.150427, 1, -0.5, 0.5, 0.5,
0, -4.654006, -6.150427, 1, 1.5, 0.5, 0.5,
0, -4.654006, -6.150427, 0, 1.5, 0.5, 0.5,
1, -4.654006, -6.150427, 0, -0.5, 0.5, 0.5,
1, -4.654006, -6.150427, 1, -0.5, 0.5, 0.5,
1, -4.654006, -6.150427, 1, 1.5, 0.5, 0.5,
1, -4.654006, -6.150427, 0, 1.5, 0.5, 0.5,
2, -4.654006, -6.150427, 0, -0.5, 0.5, 0.5,
2, -4.654006, -6.150427, 1, -0.5, 0.5, 0.5,
2, -4.654006, -6.150427, 1, 1.5, 0.5, 0.5,
2, -4.654006, -6.150427, 0, 1.5, 0.5, 0.5
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
-3.430528, -2, -5.319557,
-3.430528, 2, -5.319557,
-3.430528, -2, -5.319557,
-3.592711, -2, -5.596514,
-3.430528, 0, -5.319557,
-3.592711, 0, -5.596514,
-3.430528, 2, -5.319557,
-3.592711, 2, -5.596514
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
-3.917077, -2, -6.150427, 0, -0.5, 0.5, 0.5,
-3.917077, -2, -6.150427, 1, -0.5, 0.5, 0.5,
-3.917077, -2, -6.150427, 1, 1.5, 0.5, 0.5,
-3.917077, -2, -6.150427, 0, 1.5, 0.5, 0.5,
-3.917077, 0, -6.150427, 0, -0.5, 0.5, 0.5,
-3.917077, 0, -6.150427, 1, -0.5, 0.5, 0.5,
-3.917077, 0, -6.150427, 1, 1.5, 0.5, 0.5,
-3.917077, 0, -6.150427, 0, 1.5, 0.5, 0.5,
-3.917077, 2, -6.150427, 0, -0.5, 0.5, 0.5,
-3.917077, 2, -6.150427, 1, -0.5, 0.5, 0.5,
-3.917077, 2, -6.150427, 1, 1.5, 0.5, 0.5,
-3.917077, 2, -6.150427, 0, 1.5, 0.5, 0.5
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
-3.430528, -4.09012, -4,
-3.430528, -4.09012, 4,
-3.430528, -4.09012, -4,
-3.592711, -4.278082, -4,
-3.430528, -4.09012, -2,
-3.592711, -4.278082, -2,
-3.430528, -4.09012, 0,
-3.592711, -4.278082, 0,
-3.430528, -4.09012, 2,
-3.592711, -4.278082, 2,
-3.430528, -4.09012, 4,
-3.592711, -4.278082, 4
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
-3.917077, -4.654006, -4, 0, -0.5, 0.5, 0.5,
-3.917077, -4.654006, -4, 1, -0.5, 0.5, 0.5,
-3.917077, -4.654006, -4, 1, 1.5, 0.5, 0.5,
-3.917077, -4.654006, -4, 0, 1.5, 0.5, 0.5,
-3.917077, -4.654006, -2, 0, -0.5, 0.5, 0.5,
-3.917077, -4.654006, -2, 1, -0.5, 0.5, 0.5,
-3.917077, -4.654006, -2, 1, 1.5, 0.5, 0.5,
-3.917077, -4.654006, -2, 0, 1.5, 0.5, 0.5,
-3.917077, -4.654006, 0, 0, -0.5, 0.5, 0.5,
-3.917077, -4.654006, 0, 1, -0.5, 0.5, 0.5,
-3.917077, -4.654006, 0, 1, 1.5, 0.5, 0.5,
-3.917077, -4.654006, 0, 0, 1.5, 0.5, 0.5,
-3.917077, -4.654006, 2, 0, -0.5, 0.5, 0.5,
-3.917077, -4.654006, 2, 1, -0.5, 0.5, 0.5,
-3.917077, -4.654006, 2, 1, 1.5, 0.5, 0.5,
-3.917077, -4.654006, 2, 0, 1.5, 0.5, 0.5,
-3.917077, -4.654006, 4, 0, -0.5, 0.5, 0.5,
-3.917077, -4.654006, 4, 1, -0.5, 0.5, 0.5,
-3.917077, -4.654006, 4, 1, 1.5, 0.5, 0.5,
-3.917077, -4.654006, 4, 0, 1.5, 0.5, 0.5
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
-3.430528, -4.09012, -5.319557,
-3.430528, 3.428348, -5.319557,
-3.430528, -4.09012, 5.758706,
-3.430528, 3.428348, 5.758706,
-3.430528, -4.09012, -5.319557,
-3.430528, -4.09012, 5.758706,
-3.430528, 3.428348, -5.319557,
-3.430528, 3.428348, 5.758706,
-3.430528, -4.09012, -5.319557,
3.056792, -4.09012, -5.319557,
-3.430528, -4.09012, 5.758706,
3.056792, -4.09012, 5.758706,
-3.430528, 3.428348, -5.319557,
3.056792, 3.428348, -5.319557,
-3.430528, 3.428348, 5.758706,
3.056792, 3.428348, 5.758706,
3.056792, -4.09012, -5.319557,
3.056792, 3.428348, -5.319557,
3.056792, -4.09012, 5.758706,
3.056792, 3.428348, 5.758706,
3.056792, -4.09012, -5.319557,
3.056792, -4.09012, 5.758706,
3.056792, 3.428348, -5.319557,
3.056792, 3.428348, 5.758706
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
var radius = 7.944307;
var distance = 35.34512;
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
mvMatrix.translate( 0.1868676, 0.3308861, -0.2195742 );
mvMatrix.scale( 1.324051, 1.142459, 0.7753508 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.34512);
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
Distannoxane<-read.table("Distannoxane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Distannoxane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Distannoxane' not found
```

```r
y<-Distannoxane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Distannoxane' not found
```

```r
z<-Distannoxane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Distannoxane' not found
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
-3.336052, -1.526533, -1.525701, 0, 0, 1, 1, 1,
-3.135295, -0.290763, -1.894133, 1, 0, 0, 1, 1,
-2.638968, -1.656178, -1.873025, 1, 0, 0, 1, 1,
-2.603977, 1.874716, 0.275078, 1, 0, 0, 1, 1,
-2.581668, -0.7669494, 0.03013029, 1, 0, 0, 1, 1,
-2.535535, 0.5101768, -1.737337, 1, 0, 0, 1, 1,
-2.499641, 0.3911003, -0.8633611, 0, 0, 0, 1, 1,
-2.48982, 0.3225887, -1.776026, 0, 0, 0, 1, 1,
-2.4519, 0.6485869, -2.13488, 0, 0, 0, 1, 1,
-2.377651, -0.7881298, -2.813385, 0, 0, 0, 1, 1,
-2.320603, -0.3047918, -2.175405, 0, 0, 0, 1, 1,
-2.279549, -0.3865971, -2.234596, 0, 0, 0, 1, 1,
-2.279215, 0.9730495, -1.790486, 0, 0, 0, 1, 1,
-2.261937, -0.569091, -2.605203, 1, 1, 1, 1, 1,
-2.247735, 0.216919, -1.665319, 1, 1, 1, 1, 1,
-2.234088, -0.396245, -2.410846, 1, 1, 1, 1, 1,
-2.1989, -1.322662, -0.8824665, 1, 1, 1, 1, 1,
-2.164643, -0.2865196, -3.040002, 1, 1, 1, 1, 1,
-2.156043, -0.4826451, -2.558089, 1, 1, 1, 1, 1,
-2.106743, -0.0968478, -1.748112, 1, 1, 1, 1, 1,
-2.057249, 0.9571234, -0.7951936, 1, 1, 1, 1, 1,
-2.041888, -0.313336, -1.520965, 1, 1, 1, 1, 1,
-2.01782, -0.2934201, -0.8837923, 1, 1, 1, 1, 1,
-2.008333, 0.04344848, -0.1089666, 1, 1, 1, 1, 1,
-2.003405, 0.3337857, -0.7468107, 1, 1, 1, 1, 1,
-1.984953, 0.09890187, -3.043159, 1, 1, 1, 1, 1,
-1.975429, -0.1146906, -1.3966, 1, 1, 1, 1, 1,
-1.968741, 0.229688, -1.907535, 1, 1, 1, 1, 1,
-1.962991, -1.151998, -3.702811, 0, 0, 1, 1, 1,
-1.929178, -0.9263796, -1.019613, 1, 0, 0, 1, 1,
-1.922597, -2.598721, -1.784797, 1, 0, 0, 1, 1,
-1.914746, -0.001345767, -0.6937515, 1, 0, 0, 1, 1,
-1.910145, 0.433406, -1.856405, 1, 0, 0, 1, 1,
-1.905171, 1.83889, -1.717465, 1, 0, 0, 1, 1,
-1.896115, 0.2181026, -1.665883, 0, 0, 0, 1, 1,
-1.834347, -0.925069, -1.813236, 0, 0, 0, 1, 1,
-1.8228, -1.147749, -3.789599, 0, 0, 0, 1, 1,
-1.778323, -0.8140845, -3.212108, 0, 0, 0, 1, 1,
-1.777106, -0.2508835, -2.000201, 0, 0, 0, 1, 1,
-1.768776, -0.3589627, 0.6504502, 0, 0, 0, 1, 1,
-1.763282, -0.06776448, -1.508959, 0, 0, 0, 1, 1,
-1.762183, -0.6728275, -2.347942, 1, 1, 1, 1, 1,
-1.751317, -0.8311353, -3.405499, 1, 1, 1, 1, 1,
-1.749783, -0.4657758, -1.877128, 1, 1, 1, 1, 1,
-1.744556, 0.4553073, -2.285589, 1, 1, 1, 1, 1,
-1.744368, -1.246835, -3.221105, 1, 1, 1, 1, 1,
-1.729616, 0.7857069, -0.6929939, 1, 1, 1, 1, 1,
-1.71683, 1.577228, -1.222323, 1, 1, 1, 1, 1,
-1.715977, 1.539687, -1.389156, 1, 1, 1, 1, 1,
-1.703323, -0.260498, -2.295568, 1, 1, 1, 1, 1,
-1.691486, 1.575407, -0.201983, 1, 1, 1, 1, 1,
-1.684697, 1.065981, -0.683261, 1, 1, 1, 1, 1,
-1.676132, -0.1150016, -1.585052, 1, 1, 1, 1, 1,
-1.667925, 0.2292088, -1.121371, 1, 1, 1, 1, 1,
-1.662118, -1.380331, -1.878562, 1, 1, 1, 1, 1,
-1.643531, -0.2070022, -0.5832255, 1, 1, 1, 1, 1,
-1.631674, 1.49792, -2.786275, 0, 0, 1, 1, 1,
-1.626937, -2.011086, -3.728784, 1, 0, 0, 1, 1,
-1.625954, -0.4520521, -0.7309127, 1, 0, 0, 1, 1,
-1.624316, -0.9386187, -1.927992, 1, 0, 0, 1, 1,
-1.621358, 1.652213, -0.502986, 1, 0, 0, 1, 1,
-1.603857, 0.6031234, -0.2552049, 1, 0, 0, 1, 1,
-1.595721, -0.3852933, -0.6387004, 0, 0, 0, 1, 1,
-1.577198, 0.4935546, -1.938969, 0, 0, 0, 1, 1,
-1.573258, 0.3991339, -0.2584464, 0, 0, 0, 1, 1,
-1.573166, -0.7768937, -2.557818, 0, 0, 0, 1, 1,
-1.571206, -0.2181954, -0.606335, 0, 0, 0, 1, 1,
-1.567651, -0.9036044, -1.801228, 0, 0, 0, 1, 1,
-1.561655, -0.6339274, -1.325849, 0, 0, 0, 1, 1,
-1.555231, 1.37423, -0.1270998, 1, 1, 1, 1, 1,
-1.539872, 0.9398344, -2.935195, 1, 1, 1, 1, 1,
-1.530592, -0.9234533, -0.6924824, 1, 1, 1, 1, 1,
-1.529371, -0.836975, -2.699203, 1, 1, 1, 1, 1,
-1.526538, 0.5813968, -1.435842, 1, 1, 1, 1, 1,
-1.516958, 1.935475, -0.47736, 1, 1, 1, 1, 1,
-1.488834, -1.227076, -1.3405, 1, 1, 1, 1, 1,
-1.478467, -0.1995664, -1.781518, 1, 1, 1, 1, 1,
-1.472623, 1.024899, -2.439052, 1, 1, 1, 1, 1,
-1.445298, 0.2171817, -1.224956, 1, 1, 1, 1, 1,
-1.444491, 1.172976, -0.817941, 1, 1, 1, 1, 1,
-1.438954, -0.544678, -0.8299214, 1, 1, 1, 1, 1,
-1.412829, -0.4214221, -3.252427, 1, 1, 1, 1, 1,
-1.412582, 1.724938, -1.580707, 1, 1, 1, 1, 1,
-1.403109, 0.2365843, 0.05625954, 1, 1, 1, 1, 1,
-1.398716, -0.5410284, -3.098361, 0, 0, 1, 1, 1,
-1.389954, -1.111801, -2.836818, 1, 0, 0, 1, 1,
-1.387606, -1.436858, -3.418047, 1, 0, 0, 1, 1,
-1.36724, -1.507064, -2.57808, 1, 0, 0, 1, 1,
-1.367175, -0.1106312, -2.257933, 1, 0, 0, 1, 1,
-1.348594, 0.3786773, -1.004457, 1, 0, 0, 1, 1,
-1.34147, -0.05643782, -0.4076185, 0, 0, 0, 1, 1,
-1.340196, 1.55223, -0.361919, 0, 0, 0, 1, 1,
-1.33966, -1.725521, -1.311668, 0, 0, 0, 1, 1,
-1.332895, -0.4038819, -1.198346, 0, 0, 0, 1, 1,
-1.331929, -0.8703608, -2.916874, 0, 0, 0, 1, 1,
-1.327995, 0.1610679, -2.259719, 0, 0, 0, 1, 1,
-1.323907, 0.6661364, -2.173832, 0, 0, 0, 1, 1,
-1.319142, -0.6972327, -1.079221, 1, 1, 1, 1, 1,
-1.31046, 0.3373769, -1.39189, 1, 1, 1, 1, 1,
-1.309798, -1.432016, -3.533197, 1, 1, 1, 1, 1,
-1.309078, 1.037978, -0.3137494, 1, 1, 1, 1, 1,
-1.305622, 1.129477, -0.2301455, 1, 1, 1, 1, 1,
-1.305465, -1.431216, -0.5752072, 1, 1, 1, 1, 1,
-1.303363, 1.387751, -0.8624623, 1, 1, 1, 1, 1,
-1.302081, -1.75681, -2.965769, 1, 1, 1, 1, 1,
-1.291971, 1.616072, -0.1850935, 1, 1, 1, 1, 1,
-1.280133, -0.2322402, -0.85068, 1, 1, 1, 1, 1,
-1.269646, 0.6814112, -0.5963588, 1, 1, 1, 1, 1,
-1.267481, -0.3943158, -2.29202, 1, 1, 1, 1, 1,
-1.259251, -0.170084, -2.319671, 1, 1, 1, 1, 1,
-1.257027, -0.406842, -0.9416171, 1, 1, 1, 1, 1,
-1.256855, 0.8486926, -1.055497, 1, 1, 1, 1, 1,
-1.254871, -0.4418088, -1.409999, 0, 0, 1, 1, 1,
-1.247862, 0.5043632, -0.1345962, 1, 0, 0, 1, 1,
-1.244668, -0.06035206, -3.087468, 1, 0, 0, 1, 1,
-1.225973, -0.7641164, -1.850512, 1, 0, 0, 1, 1,
-1.225143, 0.244146, -0.9569077, 1, 0, 0, 1, 1,
-1.211681, 0.6484765, -1.030316, 1, 0, 0, 1, 1,
-1.205973, -0.2381581, -0.6264001, 0, 0, 0, 1, 1,
-1.19137, -0.04603332, -0.3398712, 0, 0, 0, 1, 1,
-1.189149, -1.346302, -1.086733, 0, 0, 0, 1, 1,
-1.182239, 0.3628311, -0.6931399, 0, 0, 0, 1, 1,
-1.18096, -0.2165796, -0.4147271, 0, 0, 0, 1, 1,
-1.178182, 0.06563249, -1.075348, 0, 0, 0, 1, 1,
-1.15583, 0.1409149, -1.745356, 0, 0, 0, 1, 1,
-1.146454, -0.8609683, -2.584946, 1, 1, 1, 1, 1,
-1.123425, -0.3333656, -1.408587, 1, 1, 1, 1, 1,
-1.122411, 0.4577099, -2.233582, 1, 1, 1, 1, 1,
-1.120264, 2.25882, -0.6927805, 1, 1, 1, 1, 1,
-1.115993, -0.9044113, -3.112245, 1, 1, 1, 1, 1,
-1.113071, -1.192661, -2.153761, 1, 1, 1, 1, 1,
-1.112238, -1.705669, -3.523505, 1, 1, 1, 1, 1,
-1.112094, 1.787585, 0.240792, 1, 1, 1, 1, 1,
-1.104276, 1.319247, -0.5905963, 1, 1, 1, 1, 1,
-1.097257, 1.01528, -0.3904527, 1, 1, 1, 1, 1,
-1.090949, -0.4420621, -1.810008, 1, 1, 1, 1, 1,
-1.090522, -2.035776, -2.651811, 1, 1, 1, 1, 1,
-1.088001, -1.446999, -2.453636, 1, 1, 1, 1, 1,
-1.084029, -0.756043, -2.872736, 1, 1, 1, 1, 1,
-1.080655, -0.04066877, -3.008096, 1, 1, 1, 1, 1,
-1.077711, 0.5951842, -1.248689, 0, 0, 1, 1, 1,
-1.07497, 0.2671956, -1.060708, 1, 0, 0, 1, 1,
-1.074647, -0.2308797, -2.189756, 1, 0, 0, 1, 1,
-1.071241, -0.2325677, -2.322923, 1, 0, 0, 1, 1,
-1.064008, 0.9993269, -0.5932553, 1, 0, 0, 1, 1,
-1.063183, -2.112302, -2.180309, 1, 0, 0, 1, 1,
-1.048666, -0.07714267, -1.417552, 0, 0, 0, 1, 1,
-1.048553, 0.03029854, -0.4418092, 0, 0, 0, 1, 1,
-1.045021, 1.970043, 0.2589644, 0, 0, 0, 1, 1,
-1.037952, 0.006374882, 0.129208, 0, 0, 0, 1, 1,
-1.030149, -0.883507, -2.169603, 0, 0, 0, 1, 1,
-1.029881, 0.2187267, -0.7270113, 0, 0, 0, 1, 1,
-1.018675, -1.932074, -2.891774, 0, 0, 0, 1, 1,
-1.017558, -1.948916, -1.652863, 1, 1, 1, 1, 1,
-1.010566, 0.4588062, -1.340205, 1, 1, 1, 1, 1,
-1.009153, 0.8180241, 0.4633266, 1, 1, 1, 1, 1,
-1.005084, 1.089098, -1.26587, 1, 1, 1, 1, 1,
-0.9844945, 0.9544008, -1.398391, 1, 1, 1, 1, 1,
-0.9667518, -2.045199, -4.043323, 1, 1, 1, 1, 1,
-0.9632528, 0.08004688, -0.3104258, 1, 1, 1, 1, 1,
-0.9632286, -1.871962, -2.725977, 1, 1, 1, 1, 1,
-0.9592999, -0.99735, -3.122503, 1, 1, 1, 1, 1,
-0.9574658, -0.2556552, -3.668118, 1, 1, 1, 1, 1,
-0.9557694, 0.4628851, -1.005842, 1, 1, 1, 1, 1,
-0.9472473, -0.6744292, -2.787649, 1, 1, 1, 1, 1,
-0.9466479, -0.7443118, -2.609227, 1, 1, 1, 1, 1,
-0.9319286, 0.5488991, -0.952909, 1, 1, 1, 1, 1,
-0.9271396, -1.138596, -1.206477, 1, 1, 1, 1, 1,
-0.9223844, 0.3039145, -2.541063, 0, 0, 1, 1, 1,
-0.9223235, -0.2780726, -0.9221768, 1, 0, 0, 1, 1,
-0.916516, -0.800783, -0.7411955, 1, 0, 0, 1, 1,
-0.909664, 0.9910055, -2.844227, 1, 0, 0, 1, 1,
-0.9055054, 1.36532, -1.446669, 1, 0, 0, 1, 1,
-0.9021873, 3.154348, -0.5291257, 1, 0, 0, 1, 1,
-0.9019307, 0.06732464, 0.002487232, 0, 0, 0, 1, 1,
-0.9015085, -0.7072908, -2.95956, 0, 0, 0, 1, 1,
-0.9013613, -1.428711, -2.165833, 0, 0, 0, 1, 1,
-0.9011627, -0.7453264, -2.091107, 0, 0, 0, 1, 1,
-0.8939385, -0.2130424, -2.912691, 0, 0, 0, 1, 1,
-0.8926806, -0.8172011, -1.713825, 0, 0, 0, 1, 1,
-0.8907298, 1.126007, -1.98858, 0, 0, 0, 1, 1,
-0.8898035, -0.1878543, -2.990894, 1, 1, 1, 1, 1,
-0.8881571, -0.02862424, -1.619593, 1, 1, 1, 1, 1,
-0.8845117, 1.902307, 0.9762486, 1, 1, 1, 1, 1,
-0.8790088, -0.196149, -2.090217, 1, 1, 1, 1, 1,
-0.8754376, 1.038996, -1.169228, 1, 1, 1, 1, 1,
-0.8738722, 1.237238, -1.301382, 1, 1, 1, 1, 1,
-0.8700332, 1.864737, -2.109239, 1, 1, 1, 1, 1,
-0.8659392, 0.5663869, -2.260392, 1, 1, 1, 1, 1,
-0.8628842, -0.3043369, -1.372797, 1, 1, 1, 1, 1,
-0.8616128, -0.1164536, -2.334562, 1, 1, 1, 1, 1,
-0.8600031, 0.1207925, -0.6871997, 1, 1, 1, 1, 1,
-0.8558893, -0.5901253, -2.404304, 1, 1, 1, 1, 1,
-0.8541555, 0.547738, -2.044426, 1, 1, 1, 1, 1,
-0.853651, 0.4756863, -2.020762, 1, 1, 1, 1, 1,
-0.8534916, -2.401079, -3.329687, 1, 1, 1, 1, 1,
-0.8500486, 0.3999234, -1.34524, 0, 0, 1, 1, 1,
-0.8486932, 0.05340042, -2.162299, 1, 0, 0, 1, 1,
-0.845347, 1.207629, -0.9064413, 1, 0, 0, 1, 1,
-0.8441074, -1.107533, -0.8781344, 1, 0, 0, 1, 1,
-0.8434821, -0.4645235, -3.484038, 1, 0, 0, 1, 1,
-0.8356463, 0.4334103, -2.327341, 1, 0, 0, 1, 1,
-0.8320645, 1.26908, 0.195815, 0, 0, 0, 1, 1,
-0.8309056, 1.216589, -1.058892, 0, 0, 0, 1, 1,
-0.8300834, -1.148701, -2.21212, 0, 0, 0, 1, 1,
-0.8249487, 0.07468087, -0.2931843, 0, 0, 0, 1, 1,
-0.8231164, 0.8094487, -1.483368, 0, 0, 0, 1, 1,
-0.8231031, -0.1751345, -2.184247, 0, 0, 0, 1, 1,
-0.816237, -1.230158, -3.136244, 0, 0, 0, 1, 1,
-0.8156723, 0.1725979, -1.785416, 1, 1, 1, 1, 1,
-0.8119729, 0.4283258, -3.023809, 1, 1, 1, 1, 1,
-0.8064274, -0.7704995, -1.089341, 1, 1, 1, 1, 1,
-0.8029784, -0.1753521, -3.141217, 1, 1, 1, 1, 1,
-0.8006594, -2.088583, -3.80046, 1, 1, 1, 1, 1,
-0.798588, 0.005088792, -1.632246, 1, 1, 1, 1, 1,
-0.7972146, 0.2478361, -1.671285, 1, 1, 1, 1, 1,
-0.7892308, 0.01612429, 0.2812886, 1, 1, 1, 1, 1,
-0.7871601, -0.8471528, -2.985558, 1, 1, 1, 1, 1,
-0.7838303, 0.6879601, -1.161521, 1, 1, 1, 1, 1,
-0.782993, 0.5812042, -1.619197, 1, 1, 1, 1, 1,
-0.7796933, 0.7199261, -0.9653966, 1, 1, 1, 1, 1,
-0.7778526, 0.8900873, -2.314455, 1, 1, 1, 1, 1,
-0.7735099, 0.3920977, -0.3294089, 1, 1, 1, 1, 1,
-0.7727763, -0.006892159, -0.7304416, 1, 1, 1, 1, 1,
-0.7586315, -0.7835998, -1.542347, 0, 0, 1, 1, 1,
-0.7486153, -2.334079, -2.622486, 1, 0, 0, 1, 1,
-0.7483196, -0.9418348, -0.5223402, 1, 0, 0, 1, 1,
-0.748063, 0.6884468, -2.298406, 1, 0, 0, 1, 1,
-0.7471142, 1.149099, 0.3064696, 1, 0, 0, 1, 1,
-0.7469848, 0.6935011, 1.270253, 1, 0, 0, 1, 1,
-0.746265, 0.9141256, -1.260767, 0, 0, 0, 1, 1,
-0.7417816, 1.630688, -1.141706, 0, 0, 0, 1, 1,
-0.7298046, 0.2908739, -0.6276374, 0, 0, 0, 1, 1,
-0.7265522, 1.059014, -0.5073324, 0, 0, 0, 1, 1,
-0.7185128, 0.1966663, -0.05433564, 0, 0, 0, 1, 1,
-0.715891, 1.835643, -0.7376373, 0, 0, 0, 1, 1,
-0.7134272, -2.011189, -0.9876949, 0, 0, 0, 1, 1,
-0.7120742, -0.2896598, -1.183089, 1, 1, 1, 1, 1,
-0.7088102, 1.215858, -0.3215926, 1, 1, 1, 1, 1,
-0.7075505, -0.9776283, -3.798641, 1, 1, 1, 1, 1,
-0.7071614, 0.1841326, -1.686932, 1, 1, 1, 1, 1,
-0.7053333, -0.06784248, -1.172757, 1, 1, 1, 1, 1,
-0.7052952, -1.139881, -2.822025, 1, 1, 1, 1, 1,
-0.7032662, -1.966927, -2.348212, 1, 1, 1, 1, 1,
-0.6999664, -1.124343, -3.720108, 1, 1, 1, 1, 1,
-0.6998555, -1.52434, -3.254649, 1, 1, 1, 1, 1,
-0.694196, 0.4145955, 0.7041416, 1, 1, 1, 1, 1,
-0.6939499, 0.3329742, 0.6482728, 1, 1, 1, 1, 1,
-0.6938899, -0.7133619, -1.279303, 1, 1, 1, 1, 1,
-0.6916861, 0.4142429, -0.5621673, 1, 1, 1, 1, 1,
-0.6915122, -0.5711702, -2.707103, 1, 1, 1, 1, 1,
-0.6914561, 1.564411, 1.60411, 1, 1, 1, 1, 1,
-0.6881796, -0.4758787, -2.928121, 0, 0, 1, 1, 1,
-0.6868911, -0.06172583, -0.5611299, 1, 0, 0, 1, 1,
-0.6841778, 0.4081823, -0.8172826, 1, 0, 0, 1, 1,
-0.6825122, 0.8918942, -1.122499, 1, 0, 0, 1, 1,
-0.6784805, -0.339554, -2.43209, 1, 0, 0, 1, 1,
-0.6754769, 0.08052012, -1.593036, 1, 0, 0, 1, 1,
-0.6733792, -0.5670652, -2.264653, 0, 0, 0, 1, 1,
-0.6663073, -0.6421342, -1.711733, 0, 0, 0, 1, 1,
-0.6608998, -1.951937, -2.93118, 0, 0, 0, 1, 1,
-0.660213, 0.2978831, -1.228677, 0, 0, 0, 1, 1,
-0.6598848, 0.9231114, -1.995105, 0, 0, 0, 1, 1,
-0.6573011, -1.537885, -4.124646, 0, 0, 0, 1, 1,
-0.6493058, -1.718886, -3.198285, 0, 0, 0, 1, 1,
-0.6489326, -0.1518236, -1.519495, 1, 1, 1, 1, 1,
-0.6455905, 0.6501817, 0.9683287, 1, 1, 1, 1, 1,
-0.644969, 0.6447993, -0.1144911, 1, 1, 1, 1, 1,
-0.6449014, 0.6576567, -0.08400436, 1, 1, 1, 1, 1,
-0.6440573, 0.3331187, -0.903721, 1, 1, 1, 1, 1,
-0.6439095, -1.399717, 0.7123253, 1, 1, 1, 1, 1,
-0.6433445, 0.5667622, -1.666098, 1, 1, 1, 1, 1,
-0.639155, -0.1286119, -2.703733, 1, 1, 1, 1, 1,
-0.6350851, -3.436091, -2.027903, 1, 1, 1, 1, 1,
-0.6340013, 1.758165, 1.022654, 1, 1, 1, 1, 1,
-0.6269254, 0.5162277, -0.6713465, 1, 1, 1, 1, 1,
-0.6246755, -1.747503, -2.697201, 1, 1, 1, 1, 1,
-0.622184, 0.4830335, -0.758774, 1, 1, 1, 1, 1,
-0.6193085, 1.345981, -0.8624944, 1, 1, 1, 1, 1,
-0.617842, -1.064734, -2.766817, 1, 1, 1, 1, 1,
-0.6167342, 1.538804, 0.1294308, 0, 0, 1, 1, 1,
-0.6156298, 0.435078, 1.385434, 1, 0, 0, 1, 1,
-0.6155224, 1.320274, -0.1223552, 1, 0, 0, 1, 1,
-0.6148469, -0.1680494, -2.336666, 1, 0, 0, 1, 1,
-0.6122324, -0.4725754, -2.471274, 1, 0, 0, 1, 1,
-0.6034798, -0.0336023, -1.76456, 1, 0, 0, 1, 1,
-0.5999653, -1.568861, -5.158223, 0, 0, 0, 1, 1,
-0.5982878, 2.199939, 0.5684918, 0, 0, 0, 1, 1,
-0.5968, -1.945534, -4.671107, 0, 0, 0, 1, 1,
-0.5944588, -0.4106047, -1.964992, 0, 0, 0, 1, 1,
-0.590035, 1.073806, -0.9413028, 0, 0, 0, 1, 1,
-0.5847774, 0.2079104, -1.445206, 0, 0, 0, 1, 1,
-0.5840726, -0.7221956, -3.410835, 0, 0, 0, 1, 1,
-0.5829932, -1.030309, -3.048579, 1, 1, 1, 1, 1,
-0.5751317, 1.194954, -0.9687082, 1, 1, 1, 1, 1,
-0.5704349, -0.3339169, -1.355603, 1, 1, 1, 1, 1,
-0.5674617, 0.6296786, 0.07947217, 1, 1, 1, 1, 1,
-0.5652442, 1.325302, 1.330818, 1, 1, 1, 1, 1,
-0.5634565, 0.07132075, -0.6182216, 1, 1, 1, 1, 1,
-0.5633269, 0.1170464, -1.688094, 1, 1, 1, 1, 1,
-0.5628325, 0.4591389, -0.03955265, 1, 1, 1, 1, 1,
-0.5620685, -1.793544, -3.167476, 1, 1, 1, 1, 1,
-0.5595998, 0.6687455, -1.029948, 1, 1, 1, 1, 1,
-0.5578978, 2.201913, 0.5941352, 1, 1, 1, 1, 1,
-0.5523579, -0.4621418, -1.363818, 1, 1, 1, 1, 1,
-0.5501889, -0.5967751, -2.537246, 1, 1, 1, 1, 1,
-0.5481851, -1.206088, -3.679491, 1, 1, 1, 1, 1,
-0.5469144, -0.9953976, -4.068138, 1, 1, 1, 1, 1,
-0.5463666, 1.170046, 0.1222613, 0, 0, 1, 1, 1,
-0.5411969, -0.3568484, -3.054617, 1, 0, 0, 1, 1,
-0.5391498, -0.3597018, -2.269667, 1, 0, 0, 1, 1,
-0.5355962, 0.2244129, -1.559312, 1, 0, 0, 1, 1,
-0.5355082, -0.1078235, -0.6199614, 1, 0, 0, 1, 1,
-0.5343977, 0.5695185, -0.9137217, 1, 0, 0, 1, 1,
-0.5322528, -1.490034, -3.060838, 0, 0, 0, 1, 1,
-0.5284898, 1.064044, -0.2243832, 0, 0, 0, 1, 1,
-0.521586, -0.3032424, -1.928139, 0, 0, 0, 1, 1,
-0.5162146, 1.152434, 0.2086342, 0, 0, 0, 1, 1,
-0.5160789, 0.5498805, 0.4209836, 0, 0, 0, 1, 1,
-0.5150524, -1.728801, -4.130124, 0, 0, 0, 1, 1,
-0.5138454, -0.07533634, -1.393045, 0, 0, 0, 1, 1,
-0.5130914, -0.6390412, -1.303764, 1, 1, 1, 1, 1,
-0.4987501, -0.419671, -2.348002, 1, 1, 1, 1, 1,
-0.498388, 0.1459066, -1.326231, 1, 1, 1, 1, 1,
-0.490204, -0.5964754, -3.088644, 1, 1, 1, 1, 1,
-0.489468, -0.008148359, -0.9541299, 1, 1, 1, 1, 1,
-0.4837834, 0.7469392, 1.302094, 1, 1, 1, 1, 1,
-0.4836327, -0.3760538, -3.48051, 1, 1, 1, 1, 1,
-0.4822879, -1.268331, -0.90416, 1, 1, 1, 1, 1,
-0.4822767, 1.766474, -1.33394, 1, 1, 1, 1, 1,
-0.4818069, 1.043953, 1.419152, 1, 1, 1, 1, 1,
-0.4812913, -1.521024, -1.805914, 1, 1, 1, 1, 1,
-0.4772253, -0.08087696, -1.950582, 1, 1, 1, 1, 1,
-0.4715201, -1.281693, -1.868607, 1, 1, 1, 1, 1,
-0.469375, 0.1709374, -1.360891, 1, 1, 1, 1, 1,
-0.4678058, 1.134609, 0.2838499, 1, 1, 1, 1, 1,
-0.4592331, 1.332719, -0.8630953, 0, 0, 1, 1, 1,
-0.4591042, 0.7967911, -0.4792157, 1, 0, 0, 1, 1,
-0.4546558, -2.109129, -3.874863, 1, 0, 0, 1, 1,
-0.4529718, -1.284636, -3.442183, 1, 0, 0, 1, 1,
-0.4516694, -1.42576, -2.96955, 1, 0, 0, 1, 1,
-0.4510223, -0.7213852, -2.695524, 1, 0, 0, 1, 1,
-0.448355, -1.956104, -2.328909, 0, 0, 0, 1, 1,
-0.4446381, 0.2917549, -2.391078, 0, 0, 0, 1, 1,
-0.4439675, 1.570828, -1.212, 0, 0, 0, 1, 1,
-0.4376126, -1.355498, -2.642682, 0, 0, 0, 1, 1,
-0.4354178, 1.938942, 0.7912848, 0, 0, 0, 1, 1,
-0.4322211, 2.880597, -1.822317, 0, 0, 0, 1, 1,
-0.4319257, -0.1802457, -2.581288, 0, 0, 0, 1, 1,
-0.4309086, 0.2213528, -3.568501, 1, 1, 1, 1, 1,
-0.4287255, 1.000914, -0.1541204, 1, 1, 1, 1, 1,
-0.4267177, 0.8887541, -1.038615, 1, 1, 1, 1, 1,
-0.4250512, -1.062184, -4.591425, 1, 1, 1, 1, 1,
-0.4249916, -0.4486197, -2.4317, 1, 1, 1, 1, 1,
-0.4245923, -0.03215769, -1.064983, 1, 1, 1, 1, 1,
-0.4234421, -0.7558056, -3.219225, 1, 1, 1, 1, 1,
-0.4224823, 0.6760905, -0.6956525, 1, 1, 1, 1, 1,
-0.4224755, 0.2525919, -2.076216, 1, 1, 1, 1, 1,
-0.4219189, 0.7611277, -1.115612, 1, 1, 1, 1, 1,
-0.4214252, 1.31276, -0.1989337, 1, 1, 1, 1, 1,
-0.41305, -0.9463341, -1.959071, 1, 1, 1, 1, 1,
-0.4126559, -0.03100767, -1.209795, 1, 1, 1, 1, 1,
-0.4053979, 0.3816614, 0.3786966, 1, 1, 1, 1, 1,
-0.4051495, 0.4685565, -0.09218613, 1, 1, 1, 1, 1,
-0.4043239, -0.8920797, -2.30357, 0, 0, 1, 1, 1,
-0.4043178, 1.957424, 0.1682904, 1, 0, 0, 1, 1,
-0.4034868, -1.100198, -2.912698, 1, 0, 0, 1, 1,
-0.3922519, -1.183302, -2.830923, 1, 0, 0, 1, 1,
-0.3905098, -0.2096999, -0.8776283, 1, 0, 0, 1, 1,
-0.3882876, 0.3430972, -1.135929, 1, 0, 0, 1, 1,
-0.3848916, -0.3048303, -1.83636, 0, 0, 0, 1, 1,
-0.3811372, 0.1198425, -2.501095, 0, 0, 0, 1, 1,
-0.3807862, -0.6056278, -4.650745, 0, 0, 0, 1, 1,
-0.3795448, -0.7902678, -1.559443, 0, 0, 0, 1, 1,
-0.3783406, 1.275281, -0.8123103, 0, 0, 0, 1, 1,
-0.375809, -1.696363, -2.938721, 0, 0, 0, 1, 1,
-0.3726693, -1.284413, -1.69925, 0, 0, 0, 1, 1,
-0.3653274, 1.612223, 0.2868867, 1, 1, 1, 1, 1,
-0.3601642, 0.09624232, -0.3835585, 1, 1, 1, 1, 1,
-0.3569118, 0.1516336, -0.8259897, 1, 1, 1, 1, 1,
-0.352406, -0.873093, -1.047243, 1, 1, 1, 1, 1,
-0.3475324, 1.135904, -0.1127543, 1, 1, 1, 1, 1,
-0.3355349, -1.480567, -3.026735, 1, 1, 1, 1, 1,
-0.3335717, 0.6476854, -0.1549214, 1, 1, 1, 1, 1,
-0.3329058, 0.3520111, 1.186322, 1, 1, 1, 1, 1,
-0.3328116, -0.05300021, -1.088778, 1, 1, 1, 1, 1,
-0.3318835, 0.3312932, -1.051371, 1, 1, 1, 1, 1,
-0.325375, -0.3752201, -1.25832, 1, 1, 1, 1, 1,
-0.3252092, -0.4218476, -2.050789, 1, 1, 1, 1, 1,
-0.3228724, 1.445782, 0.244697, 1, 1, 1, 1, 1,
-0.3201322, 1.159787, -0.3223002, 1, 1, 1, 1, 1,
-0.319001, -0.6764985, -1.319644, 1, 1, 1, 1, 1,
-0.3146575, -0.2263422, -1.768458, 0, 0, 1, 1, 1,
-0.3129249, -0.5874186, -1.070875, 1, 0, 0, 1, 1,
-0.305319, 1.21129, -1.280941, 1, 0, 0, 1, 1,
-0.3028122, 1.441871, -1.239111, 1, 0, 0, 1, 1,
-0.3021272, 0.5730276, -1.816861, 1, 0, 0, 1, 1,
-0.301016, 0.1592076, -0.1215011, 1, 0, 0, 1, 1,
-0.3008869, 0.347186, -0.2924094, 0, 0, 0, 1, 1,
-0.2975388, 0.4387341, -1.15681, 0, 0, 0, 1, 1,
-0.2965581, -1.178045, -4.25702, 0, 0, 0, 1, 1,
-0.2958623, -0.5531539, -4.439292, 0, 0, 0, 1, 1,
-0.2854001, -0.6469143, -2.089389, 0, 0, 0, 1, 1,
-0.2804944, 0.1676886, -2.788725, 0, 0, 0, 1, 1,
-0.2789276, 0.4136022, -0.7942602, 0, 0, 0, 1, 1,
-0.2786154, -1.169108, -2.221994, 1, 1, 1, 1, 1,
-0.2778516, -1.598351, -4.447846, 1, 1, 1, 1, 1,
-0.2776081, 1.85659, 0.3563571, 1, 1, 1, 1, 1,
-0.273342, 0.2814907, -0.7563441, 1, 1, 1, 1, 1,
-0.2725517, 0.232049, 1.55105, 1, 1, 1, 1, 1,
-0.2676333, 1.37023, 0.3015105, 1, 1, 1, 1, 1,
-0.2674254, 0.6818699, -0.3245092, 1, 1, 1, 1, 1,
-0.2661169, -0.112014, -2.196604, 1, 1, 1, 1, 1,
-0.2620362, -1.34464, -1.974415, 1, 1, 1, 1, 1,
-0.2591834, 1.646089, -0.8246779, 1, 1, 1, 1, 1,
-0.2547697, 1.222858, 0.90118, 1, 1, 1, 1, 1,
-0.2530533, 0.6126127, -0.04979937, 1, 1, 1, 1, 1,
-0.2524616, 1.652433, -0.6925929, 1, 1, 1, 1, 1,
-0.2490837, -0.936647, -3.486903, 1, 1, 1, 1, 1,
-0.2489383, -1.416862, -1.58255, 1, 1, 1, 1, 1,
-0.248344, 1.302366, -0.1399685, 0, 0, 1, 1, 1,
-0.2467855, -2.300815, -2.894358, 1, 0, 0, 1, 1,
-0.2453332, -0.04858727, 0.9232182, 1, 0, 0, 1, 1,
-0.2439604, -0.1572606, -3.35055, 1, 0, 0, 1, 1,
-0.2435221, -0.9937533, -4.062856, 1, 0, 0, 1, 1,
-0.2396081, 0.6440544, 1.022837, 1, 0, 0, 1, 1,
-0.2319876, -0.1153918, -2.326303, 0, 0, 0, 1, 1,
-0.2265068, 1.106238, -0.5777785, 0, 0, 0, 1, 1,
-0.2246786, 0.2749602, 0.3739323, 0, 0, 0, 1, 1,
-0.2203389, 1.625751, -0.6493705, 0, 0, 0, 1, 1,
-0.2167322, 0.1437685, -1.350521, 0, 0, 0, 1, 1,
-0.2133459, 0.4530972, -0.3471239, 0, 0, 0, 1, 1,
-0.2096482, -0.6478543, -1.962821, 0, 0, 0, 1, 1,
-0.2076969, -0.7272419, -3.030374, 1, 1, 1, 1, 1,
-0.2074049, 0.03096914, -1.694621, 1, 1, 1, 1, 1,
-0.2027096, 0.4595183, 1.236241, 1, 1, 1, 1, 1,
-0.2009658, -0.8177163, -2.517371, 1, 1, 1, 1, 1,
-0.1967599, -1.161799, -4.397092, 1, 1, 1, 1, 1,
-0.1964174, -0.4005198, -2.560032, 1, 1, 1, 1, 1,
-0.195247, 0.2826446, -1.490692, 1, 1, 1, 1, 1,
-0.1931603, -0.590322, -4.876185, 1, 1, 1, 1, 1,
-0.1911277, 0.24764, -0.6281795, 1, 1, 1, 1, 1,
-0.1888727, -1.05029, -3.764138, 1, 1, 1, 1, 1,
-0.1866823, 1.6675, -0.4518539, 1, 1, 1, 1, 1,
-0.1824372, 0.3063008, 0.5814525, 1, 1, 1, 1, 1,
-0.176233, -0.5634019, -4.1489, 1, 1, 1, 1, 1,
-0.1750355, -0.02416142, -0.798656, 1, 1, 1, 1, 1,
-0.1748517, -1.058094, -1.468444, 1, 1, 1, 1, 1,
-0.1740562, 1.160448, -0.1234654, 0, 0, 1, 1, 1,
-0.1738334, -0.1429756, -2.852449, 1, 0, 0, 1, 1,
-0.1692129, -0.6472205, -3.803037, 1, 0, 0, 1, 1,
-0.1683888, -0.2170213, -2.516903, 1, 0, 0, 1, 1,
-0.1678696, 1.984323, 0.2315717, 1, 0, 0, 1, 1,
-0.164097, -1.399747, -1.391558, 1, 0, 0, 1, 1,
-0.1593604, -0.1572262, -2.92089, 0, 0, 0, 1, 1,
-0.1575012, 0.3668554, 0.05049083, 0, 0, 0, 1, 1,
-0.1558111, 1.477876, 0.08691899, 0, 0, 0, 1, 1,
-0.1521448, 0.5351724, 1.283094, 0, 0, 0, 1, 1,
-0.1512957, 0.6348457, -0.1156468, 0, 0, 0, 1, 1,
-0.1505676, -1.294165, -2.126649, 0, 0, 0, 1, 1,
-0.1458549, -0.4530223, -2.610999, 0, 0, 0, 1, 1,
-0.1456002, -0.9588278, -2.132856, 1, 1, 1, 1, 1,
-0.1426167, 0.6289357, 0.8420663, 1, 1, 1, 1, 1,
-0.1382149, -0.6014825, -3.049247, 1, 1, 1, 1, 1,
-0.1380407, 2.06235, 0.9837289, 1, 1, 1, 1, 1,
-0.1324597, 0.6217189, 0.4547986, 1, 1, 1, 1, 1,
-0.1307797, -0.6783916, -3.374907, 1, 1, 1, 1, 1,
-0.1302316, -0.7615967, -3.385117, 1, 1, 1, 1, 1,
-0.1282389, 0.9844524, 0.1779863, 1, 1, 1, 1, 1,
-0.1275836, 0.06445266, -4.230381, 1, 1, 1, 1, 1,
-0.1273579, 0.6487571, 1.387085, 1, 1, 1, 1, 1,
-0.1203323, -0.476083, -3.274146, 1, 1, 1, 1, 1,
-0.1156973, 0.3643156, -1.271325, 1, 1, 1, 1, 1,
-0.1150138, 0.512469, -1.882914, 1, 1, 1, 1, 1,
-0.114729, -0.5526133, -4.258444, 1, 1, 1, 1, 1,
-0.1137551, 2.184129, -1.342543, 1, 1, 1, 1, 1,
-0.1129521, 0.2628865, -0.7820025, 0, 0, 1, 1, 1,
-0.1126697, -0.8922884, -1.25998, 1, 0, 0, 1, 1,
-0.1113455, -0.8203042, -2.955406, 1, 0, 0, 1, 1,
-0.1077019, 0.09244868, -0.1854184, 1, 0, 0, 1, 1,
-0.1025037, -3.30215, -2.402459, 1, 0, 0, 1, 1,
-0.1018168, -2.414618, -3.665533, 1, 0, 0, 1, 1,
-0.1016825, 2.178473, 1.640258, 0, 0, 0, 1, 1,
-0.09792557, 0.2953566, -1.347432, 0, 0, 0, 1, 1,
-0.09210513, -0.1969245, -2.70955, 0, 0, 0, 1, 1,
-0.08966758, 0.1982743, -0.6863912, 0, 0, 0, 1, 1,
-0.08864981, 0.09491105, -0.2692773, 0, 0, 0, 1, 1,
-0.08782053, 1.851829, -0.04533114, 0, 0, 0, 1, 1,
-0.08085522, -0.3794719, -2.226113, 0, 0, 0, 1, 1,
-0.07986306, -1.479191, -1.748285, 1, 1, 1, 1, 1,
-0.07918076, 0.1588692, -0.7677472, 1, 1, 1, 1, 1,
-0.0750225, 0.3027737, -2.309699, 1, 1, 1, 1, 1,
-0.07148499, 0.264331, 1.062223, 1, 1, 1, 1, 1,
-0.07037272, -0.5104563, -3.100388, 1, 1, 1, 1, 1,
-0.06943746, 0.05635919, -2.797296, 1, 1, 1, 1, 1,
-0.06664257, -0.1832893, -2.513076, 1, 1, 1, 1, 1,
-0.06624233, 0.06833324, -0.8821561, 1, 1, 1, 1, 1,
-0.06539211, 0.2228688, -1.138385, 1, 1, 1, 1, 1,
-0.06388801, -1.893063, -4.152456, 1, 1, 1, 1, 1,
-0.05085875, 0.1911407, -0.974637, 1, 1, 1, 1, 1,
-0.04994883, -0.3871485, -2.213753, 1, 1, 1, 1, 1,
-0.04490001, 1.985868, -0.3887824, 1, 1, 1, 1, 1,
-0.03958387, -2.076375, -2.253946, 1, 1, 1, 1, 1,
-0.03671844, 0.2177888, -0.9729473, 1, 1, 1, 1, 1,
-0.03533701, 0.8604845, -1.022508, 0, 0, 1, 1, 1,
-0.0349543, 0.09976915, 0.3516725, 1, 0, 0, 1, 1,
-0.02174404, 1.612487, 0.9619567, 1, 0, 0, 1, 1,
-0.02122036, -0.02547758, -4.095004, 1, 0, 0, 1, 1,
-0.02093674, 1.207007, -0.27283, 1, 0, 0, 1, 1,
-0.01993078, 1.780786, 0.7297781, 1, 0, 0, 1, 1,
-0.01827029, 0.2656436, -0.8241088, 0, 0, 0, 1, 1,
-0.01731393, -1.154249, -2.686182, 0, 0, 0, 1, 1,
-0.01661207, -0.1489595, -1.635019, 0, 0, 0, 1, 1,
-0.01302377, -1.343426, -1.930482, 0, 0, 0, 1, 1,
-0.01039455, -1.113637, -4.035074, 0, 0, 0, 1, 1,
-0.00794415, -0.5254644, -2.354969, 0, 0, 0, 1, 1,
-0.006124489, -0.6581793, -3.239465, 0, 0, 0, 1, 1,
-0.001675839, 1.000142, 0.2297826, 1, 1, 1, 1, 1,
0.001585, -0.5803747, 2.796036, 1, 1, 1, 1, 1,
0.001666699, 0.2088414, -0.1598381, 1, 1, 1, 1, 1,
0.007063064, 0.2809962, 2.477998, 1, 1, 1, 1, 1,
0.00869253, 0.4566417, -0.9546029, 1, 1, 1, 1, 1,
0.01327789, 1.124276, -1.537269, 1, 1, 1, 1, 1,
0.01350325, 0.887041, 2.170966, 1, 1, 1, 1, 1,
0.01481764, 2.365169, 0.3412457, 1, 1, 1, 1, 1,
0.01599284, -0.6926206, 2.955693, 1, 1, 1, 1, 1,
0.01646351, 0.08252214, -0.4745537, 1, 1, 1, 1, 1,
0.01754031, -0.2478538, 0.8476284, 1, 1, 1, 1, 1,
0.01859561, 0.2545213, -0.324535, 1, 1, 1, 1, 1,
0.02205209, -2.002981, 2.944871, 1, 1, 1, 1, 1,
0.02326337, -0.7716035, 3.180378, 1, 1, 1, 1, 1,
0.02362587, -1.036911, 0.6048725, 1, 1, 1, 1, 1,
0.02814506, 0.3490889, -0.1877128, 0, 0, 1, 1, 1,
0.02822237, 0.6315722, -0.6395575, 1, 0, 0, 1, 1,
0.02878819, 0.05700712, 0.2541898, 1, 0, 0, 1, 1,
0.03405651, 0.2536805, -0.5042051, 1, 0, 0, 1, 1,
0.03857512, -0.4060137, 3.385466, 1, 0, 0, 1, 1,
0.03914865, -0.5173434, 3.302702, 1, 0, 0, 1, 1,
0.04135217, -2.080582, 4.413168, 0, 0, 0, 1, 1,
0.04643185, 0.04551847, 1.765549, 0, 0, 0, 1, 1,
0.05252047, 1.44724, -0.4560405, 0, 0, 0, 1, 1,
0.05294227, 0.5862058, -0.5544502, 0, 0, 0, 1, 1,
0.05640567, -2.460635, 3.174185, 0, 0, 0, 1, 1,
0.05671626, -0.147733, 1.764836, 0, 0, 0, 1, 1,
0.06988303, -0.7263184, 3.354393, 0, 0, 0, 1, 1,
0.07738841, 0.4238115, 0.6230227, 1, 1, 1, 1, 1,
0.07899228, 1.383167, 0.7463752, 1, 1, 1, 1, 1,
0.08252808, -1.07204, 3.536121, 1, 1, 1, 1, 1,
0.08437534, 0.4382767, 2.112731, 1, 1, 1, 1, 1,
0.08531861, 0.3698861, 1.002432, 1, 1, 1, 1, 1,
0.08536758, -1.445588, 1.952756, 1, 1, 1, 1, 1,
0.090138, 0.1451974, -0.05097701, 1, 1, 1, 1, 1,
0.09133824, -0.4303258, 4.643106, 1, 1, 1, 1, 1,
0.09373366, 1.124612, 0.06854482, 1, 1, 1, 1, 1,
0.09404351, 0.6919715, 0.5757395, 1, 1, 1, 1, 1,
0.09565543, 1.363446, 0.1093146, 1, 1, 1, 1, 1,
0.09892258, 0.636624, -1.077739, 1, 1, 1, 1, 1,
0.103413, 0.2943456, -0.2592129, 1, 1, 1, 1, 1,
0.1034395, 0.551605, -0.4447336, 1, 1, 1, 1, 1,
0.1040732, -1.075029, 2.720841, 1, 1, 1, 1, 1,
0.1085988, -0.2648671, 1.349871, 0, 0, 1, 1, 1,
0.109314, 0.858505, 0.0245276, 1, 0, 0, 1, 1,
0.1105238, -0.1561681, 1.731909, 1, 0, 0, 1, 1,
0.1124502, 0.1834066, -0.3196587, 1, 0, 0, 1, 1,
0.1159432, 0.5106882, -0.1575971, 1, 0, 0, 1, 1,
0.115959, -2.255575, 1.63349, 1, 0, 0, 1, 1,
0.1168411, 0.4883877, -0.08152962, 0, 0, 0, 1, 1,
0.1177369, 0.8608261, 0.8078707, 0, 0, 0, 1, 1,
0.1182821, 0.02983511, 3.123409, 0, 0, 0, 1, 1,
0.1193953, -0.3899192, 2.898268, 0, 0, 0, 1, 1,
0.1214698, -0.4191126, 2.530807, 0, 0, 0, 1, 1,
0.124218, 0.8553683, 1.180471, 0, 0, 0, 1, 1,
0.1252536, -0.4471734, 3.239537, 0, 0, 0, 1, 1,
0.125486, 0.4902312, 1.239894, 1, 1, 1, 1, 1,
0.1317564, -1.299458, 2.156339, 1, 1, 1, 1, 1,
0.1330227, -0.7492394, 2.67974, 1, 1, 1, 1, 1,
0.1331471, -0.4343472, 1.186176, 1, 1, 1, 1, 1,
0.1348164, -0.3260105, 3.360676, 1, 1, 1, 1, 1,
0.139518, 0.4214682, 1.177182, 1, 1, 1, 1, 1,
0.1397808, -0.2377899, 3.18084, 1, 1, 1, 1, 1,
0.1399033, -0.6016201, 2.354704, 1, 1, 1, 1, 1,
0.1441686, 1.375699, -2.622402, 1, 1, 1, 1, 1,
0.1532414, -0.3910604, 3.521577, 1, 1, 1, 1, 1,
0.1616163, -0.2621124, 2.108704, 1, 1, 1, 1, 1,
0.1736144, -0.6284871, 2.533007, 1, 1, 1, 1, 1,
0.1773706, 0.6015559, 0.5695146, 1, 1, 1, 1, 1,
0.1800452, -1.264594, 3.765055, 1, 1, 1, 1, 1,
0.1849567, -0.9996672, 3.407021, 1, 1, 1, 1, 1,
0.1927973, -0.7023811, 2.930226, 0, 0, 1, 1, 1,
0.2001388, 0.7333858, -0.1417836, 1, 0, 0, 1, 1,
0.2049079, 1.232099, -0.3982107, 1, 0, 0, 1, 1,
0.2051952, 0.5866928, 0.7879856, 1, 0, 0, 1, 1,
0.2105576, -1.803886, 3.245602, 1, 0, 0, 1, 1,
0.2175948, -0.08115207, 1.975982, 1, 0, 0, 1, 1,
0.2189498, -1.793677, 3.384847, 0, 0, 0, 1, 1,
0.2196542, -0.1030362, 1.872244, 0, 0, 0, 1, 1,
0.221972, 0.7851238, -0.7080457, 0, 0, 0, 1, 1,
0.2222143, 1.30125, -0.9013987, 0, 0, 0, 1, 1,
0.2224857, 1.752655, 0.4703664, 0, 0, 0, 1, 1,
0.2302375, -1.714883, 3.306763, 0, 0, 0, 1, 1,
0.2345849, 0.2572765, 0.9836181, 0, 0, 0, 1, 1,
0.2360572, -0.6541394, 2.518187, 1, 1, 1, 1, 1,
0.2362602, -1.035776, 3.665428, 1, 1, 1, 1, 1,
0.2370753, -1.748613, 1.640805, 1, 1, 1, 1, 1,
0.2383722, -2.263942, 3.521045, 1, 1, 1, 1, 1,
0.2388324, 0.4873205, 1.111115, 1, 1, 1, 1, 1,
0.2391016, 0.1924955, 0.5849288, 1, 1, 1, 1, 1,
0.2430524, -0.486833, 2.728997, 1, 1, 1, 1, 1,
0.2458133, 0.5591664, -0.2450504, 1, 1, 1, 1, 1,
0.2469005, 1.442676, 0.6936, 1, 1, 1, 1, 1,
0.2490353, -0.4694926, 3.741723, 1, 1, 1, 1, 1,
0.2520433, 0.6321822, 1.280195, 1, 1, 1, 1, 1,
0.2522089, 2.071899, -0.4320896, 1, 1, 1, 1, 1,
0.2523775, -0.3378912, 2.756214, 1, 1, 1, 1, 1,
0.2540285, -1.295964, 2.424211, 1, 1, 1, 1, 1,
0.2568235, -0.3631924, 1.527951, 1, 1, 1, 1, 1,
0.2571765, 0.8557135, -0.9183629, 0, 0, 1, 1, 1,
0.257899, 0.3080729, 1.674135, 1, 0, 0, 1, 1,
0.2591995, 0.6774943, 0.1742438, 1, 0, 0, 1, 1,
0.2593037, -1.65953, 4.158198, 1, 0, 0, 1, 1,
0.2605103, 0.9171827, -0.5877523, 1, 0, 0, 1, 1,
0.2606973, 1.099106, -0.3156807, 1, 0, 0, 1, 1,
0.261911, -0.5657242, 4.716955, 0, 0, 0, 1, 1,
0.2623621, -1.373042, 3.386353, 0, 0, 0, 1, 1,
0.2633959, -0.6555262, 3.681629, 0, 0, 0, 1, 1,
0.2636148, -0.6333945, 3.365825, 0, 0, 0, 1, 1,
0.2677935, 1.099112, -0.1144293, 0, 0, 0, 1, 1,
0.2688489, 0.175785, 0.7611057, 0, 0, 0, 1, 1,
0.269182, -1.502136, 2.885817, 0, 0, 0, 1, 1,
0.2715967, -0.6613839, 1.865369, 1, 1, 1, 1, 1,
0.2776561, -1.97964, 2.088935, 1, 1, 1, 1, 1,
0.2823506, 0.6251536, 1.130663, 1, 1, 1, 1, 1,
0.2835001, 0.835324, 1.561356, 1, 1, 1, 1, 1,
0.2851048, -0.2080731, 0.7197216, 1, 1, 1, 1, 1,
0.3007047, 1.149621, 0.8132784, 1, 1, 1, 1, 1,
0.3013559, -0.1028592, 1.489426, 1, 1, 1, 1, 1,
0.3020962, 1.009008, 0.3381335, 1, 1, 1, 1, 1,
0.3177936, -0.02566135, 1.161719, 1, 1, 1, 1, 1,
0.3187466, 0.8482412, -0.7560207, 1, 1, 1, 1, 1,
0.3196539, 1.001417, -0.04676788, 1, 1, 1, 1, 1,
0.3208048, 0.07311574, 3.07689, 1, 1, 1, 1, 1,
0.3236354, -0.4899193, 2.375263, 1, 1, 1, 1, 1,
0.3266745, -0.4160822, 2.542139, 1, 1, 1, 1, 1,
0.3326527, -0.3802764, 4.05347, 1, 1, 1, 1, 1,
0.3339397, 1.054491, 0.7951654, 0, 0, 1, 1, 1,
0.3371059, -0.5679378, 3.445065, 1, 0, 0, 1, 1,
0.3375189, -0.222739, 2.159567, 1, 0, 0, 1, 1,
0.3378892, -0.4514427, 1.652996, 1, 0, 0, 1, 1,
0.3389943, 0.4121099, -0.09687428, 1, 0, 0, 1, 1,
0.3412417, 0.002683306, 1.168293, 1, 0, 0, 1, 1,
0.3455581, 1.286665, 0.5753821, 0, 0, 0, 1, 1,
0.3509444, -0.5755921, 2.230385, 0, 0, 0, 1, 1,
0.3535278, 1.526679, 1.444157, 0, 0, 0, 1, 1,
0.3548973, 1.120533, -1.191708, 0, 0, 0, 1, 1,
0.3618086, -1.026531, 2.036473, 0, 0, 0, 1, 1,
0.3633545, -0.2465385, 2.929686, 0, 0, 0, 1, 1,
0.3635729, 0.06645259, 2.188106, 0, 0, 0, 1, 1,
0.3661851, -0.2233625, 2.195511, 1, 1, 1, 1, 1,
0.3715822, 0.567157, 0.9506243, 1, 1, 1, 1, 1,
0.3730802, 0.4196991, 0.0009572098, 1, 1, 1, 1, 1,
0.3754555, -0.3343156, 1.182293, 1, 1, 1, 1, 1,
0.3766324, 0.07201185, 1.613781, 1, 1, 1, 1, 1,
0.3798604, 1.444536, 1.076017, 1, 1, 1, 1, 1,
0.380004, -0.6100978, 2.552859, 1, 1, 1, 1, 1,
0.3841479, 0.8056071, 0.02140329, 1, 1, 1, 1, 1,
0.3913393, 0.8987332, -1.027984, 1, 1, 1, 1, 1,
0.3987393, 0.7602878, 0.2942879, 1, 1, 1, 1, 1,
0.3989471, -3.456657, 3.660581, 1, 1, 1, 1, 1,
0.4010093, 0.01205032, 1.873864, 1, 1, 1, 1, 1,
0.4065689, -1.289066, 3.475416, 1, 1, 1, 1, 1,
0.4115347, -1.059104, 5.597372, 1, 1, 1, 1, 1,
0.4123176, 0.3617069, 0.005785371, 1, 1, 1, 1, 1,
0.4135188, -0.7726952, 2.440247, 0, 0, 1, 1, 1,
0.4180656, -1.646932, 2.920557, 1, 0, 0, 1, 1,
0.4228791, -0.4416683, 1.972574, 1, 0, 0, 1, 1,
0.4337076, -0.1214814, 2.40992, 1, 0, 0, 1, 1,
0.4339756, 0.1538563, 3.053335, 1, 0, 0, 1, 1,
0.4349804, -0.06602342, 1.009702, 1, 0, 0, 1, 1,
0.4361472, 0.09915077, 0.8268335, 0, 0, 0, 1, 1,
0.4366618, -0.6907806, 3.082131, 0, 0, 0, 1, 1,
0.4388629, 0.03848834, 0.239653, 0, 0, 0, 1, 1,
0.4389553, 0.05889622, 1.61815, 0, 0, 0, 1, 1,
0.4437045, -1.747891, 2.329942, 0, 0, 0, 1, 1,
0.4452072, 0.3852203, 2.469925, 0, 0, 0, 1, 1,
0.4512977, -1.827191, 2.63461, 0, 0, 0, 1, 1,
0.4517236, -0.2163234, 1.315818, 1, 1, 1, 1, 1,
0.4526291, 1.20975, -0.9639625, 1, 1, 1, 1, 1,
0.4540672, -1.239666, 2.26735, 1, 1, 1, 1, 1,
0.4550267, 0.1944727, -0.1916397, 1, 1, 1, 1, 1,
0.4607649, -0.8605287, 3.034971, 1, 1, 1, 1, 1,
0.4619871, -0.6328253, 3.590053, 1, 1, 1, 1, 1,
0.4621955, 0.3450236, 0.9948922, 1, 1, 1, 1, 1,
0.4662621, 1.75842, 0.2789875, 1, 1, 1, 1, 1,
0.475347, -0.223057, 1.806503, 1, 1, 1, 1, 1,
0.4772311, -1.140449, 3.622272, 1, 1, 1, 1, 1,
0.4856349, -0.6366152, 3.875558, 1, 1, 1, 1, 1,
0.4880278, -0.04209482, 0.5909771, 1, 1, 1, 1, 1,
0.4901366, -0.2365242, 2.268473, 1, 1, 1, 1, 1,
0.4957034, 1.58373, 1.030131, 1, 1, 1, 1, 1,
0.498654, 0.2378252, 1.103348, 1, 1, 1, 1, 1,
0.5027279, 0.2147065, -0.03473694, 0, 0, 1, 1, 1,
0.5080405, -0.159411, 2.586588, 1, 0, 0, 1, 1,
0.5089873, -1.081318, 1.910692, 1, 0, 0, 1, 1,
0.5127752, 0.6785198, 1.211947, 1, 0, 0, 1, 1,
0.5129444, 0.4399626, 0.3844298, 1, 0, 0, 1, 1,
0.5130832, -1.687913, 2.606046, 1, 0, 0, 1, 1,
0.5170239, -2.81859, 3.041183, 0, 0, 0, 1, 1,
0.5188571, -0.8157717, 3.19098, 0, 0, 0, 1, 1,
0.5197538, -0.4575361, 1.672445, 0, 0, 0, 1, 1,
0.521255, 0.4047443, 0.07766841, 0, 0, 0, 1, 1,
0.5250688, -0.7093019, 1.560741, 0, 0, 0, 1, 1,
0.5342434, -0.07371594, 2.606796, 0, 0, 0, 1, 1,
0.5458449, -0.7197918, 2.232225, 0, 0, 0, 1, 1,
0.5465689, 1.225874, 0.9403018, 1, 1, 1, 1, 1,
0.5466818, -0.3821074, 2.530756, 1, 1, 1, 1, 1,
0.5484813, 0.5970325, 2.142792, 1, 1, 1, 1, 1,
0.5498765, 0.1586454, 1.468431, 1, 1, 1, 1, 1,
0.5551598, -0.6893624, 1.247313, 1, 1, 1, 1, 1,
0.5591748, 0.9265139, -0.3852654, 1, 1, 1, 1, 1,
0.5621278, -1.521394, 2.078989, 1, 1, 1, 1, 1,
0.5704209, -0.6906942, 3.395783, 1, 1, 1, 1, 1,
0.5750424, 2.322373, 1.4868, 1, 1, 1, 1, 1,
0.5784128, 0.009396585, 1.923545, 1, 1, 1, 1, 1,
0.5829362, 0.7820912, 0.5578893, 1, 1, 1, 1, 1,
0.5857125, 0.1536154, -1.209486, 1, 1, 1, 1, 1,
0.5871786, 0.03136707, 1.52438, 1, 1, 1, 1, 1,
0.587692, -0.1390664, 2.049052, 1, 1, 1, 1, 1,
0.5912156, 0.5011309, -0.7221192, 1, 1, 1, 1, 1,
0.5916108, 1.059092, 1.856577, 0, 0, 1, 1, 1,
0.5944127, -0.9546483, 4.408117, 1, 0, 0, 1, 1,
0.5967261, -1.55228, 2.711068, 1, 0, 0, 1, 1,
0.5990591, 0.4267108, -2.200005, 1, 0, 0, 1, 1,
0.6047604, 1.486358, -0.3163785, 1, 0, 0, 1, 1,
0.604924, 1.456805, -0.2735467, 1, 0, 0, 1, 1,
0.6070563, -0.8886552, 1.845248, 0, 0, 0, 1, 1,
0.6077022, -0.8582479, 3.717478, 0, 0, 0, 1, 1,
0.6077972, -0.0585481, 0.07741491, 0, 0, 0, 1, 1,
0.6138573, 1.180828, -0.4134284, 0, 0, 0, 1, 1,
0.6165416, 0.3307445, 0.2973526, 0, 0, 0, 1, 1,
0.6187123, 0.1032523, 0.8943471, 0, 0, 0, 1, 1,
0.620694, -1.327489, 1.660956, 0, 0, 0, 1, 1,
0.6213372, 0.7072301, 1.432621, 1, 1, 1, 1, 1,
0.6272928, 1.344785, 0.6229625, 1, 1, 1, 1, 1,
0.6288562, -0.3224339, 2.159482, 1, 1, 1, 1, 1,
0.62939, -0.005978008, 0.1508201, 1, 1, 1, 1, 1,
0.6317432, -0.5217039, 2.089564, 1, 1, 1, 1, 1,
0.6372678, -1.509799, 2.845304, 1, 1, 1, 1, 1,
0.6399469, 0.04451857, 2.772275, 1, 1, 1, 1, 1,
0.6408498, 1.200832, 1.833102, 1, 1, 1, 1, 1,
0.6416677, 0.7703658, 0.7753575, 1, 1, 1, 1, 1,
0.6433358, 0.1525824, 2.919022, 1, 1, 1, 1, 1,
0.6470099, -0.9750875, 2.307301, 1, 1, 1, 1, 1,
0.6594399, 0.4934797, 0.7341129, 1, 1, 1, 1, 1,
0.6605265, 1.183143, 1.968812, 1, 1, 1, 1, 1,
0.660794, 0.938527, 0.8118439, 1, 1, 1, 1, 1,
0.6652677, 0.8522001, 0.3546765, 1, 1, 1, 1, 1,
0.6702238, 0.0450507, 1.049047, 0, 0, 1, 1, 1,
0.6705292, 0.7121896, 0.8748368, 1, 0, 0, 1, 1,
0.6725172, 0.9896731, 0.06173161, 1, 0, 0, 1, 1,
0.6765027, 0.4751938, 0.3998526, 1, 0, 0, 1, 1,
0.6771288, -0.672242, 1.786103, 1, 0, 0, 1, 1,
0.6784823, 0.8454096, 0.9913509, 1, 0, 0, 1, 1,
0.6851307, 0.3629473, -0.1758583, 0, 0, 0, 1, 1,
0.6881565, 1.600375, 0.007978606, 0, 0, 0, 1, 1,
0.6927072, -1.655569, 3.698865, 0, 0, 0, 1, 1,
0.6936581, -1.10201, 2.093657, 0, 0, 0, 1, 1,
0.6989105, 1.574007, -0.5603569, 0, 0, 0, 1, 1,
0.7004573, 0.9155138, 0.9282492, 0, 0, 0, 1, 1,
0.7119895, 0.4098573, 1.475992, 0, 0, 0, 1, 1,
0.7128481, -1.471216, 3.198601, 1, 1, 1, 1, 1,
0.7148253, 0.1412282, 2.464733, 1, 1, 1, 1, 1,
0.7159347, -1.999766, 2.075522, 1, 1, 1, 1, 1,
0.719413, -0.796997, 2.09565, 1, 1, 1, 1, 1,
0.7196755, -1.53853, 2.959052, 1, 1, 1, 1, 1,
0.7222329, -1.759444, 2.929786, 1, 1, 1, 1, 1,
0.7237062, 0.7172613, -0.5419986, 1, 1, 1, 1, 1,
0.7244312, -0.6841701, 0.5726711, 1, 1, 1, 1, 1,
0.7248059, -1.444452, 2.853017, 1, 1, 1, 1, 1,
0.7388242, -0.713286, 1.936543, 1, 1, 1, 1, 1,
0.7446665, 1.475211, 0.5382949, 1, 1, 1, 1, 1,
0.7448153, -0.8871647, 1.103214, 1, 1, 1, 1, 1,
0.7477505, 1.238186, 0.226387, 1, 1, 1, 1, 1,
0.7490724, -1.544616, 1.267999, 1, 1, 1, 1, 1,
0.7498205, 0.1765492, 2.037713, 1, 1, 1, 1, 1,
0.7546241, 1.032579, 0.5698339, 0, 0, 1, 1, 1,
0.7550819, 0.4136759, 1.241835, 1, 0, 0, 1, 1,
0.7579378, -0.2971207, 2.950832, 1, 0, 0, 1, 1,
0.7622882, -0.02990626, 2.724032, 1, 0, 0, 1, 1,
0.7639518, 0.5803488, 2.137076, 1, 0, 0, 1, 1,
0.768881, -0.5890908, 2.674235, 1, 0, 0, 1, 1,
0.7712284, 0.3778304, -0.1447532, 0, 0, 0, 1, 1,
0.7722778, 0.6357082, -0.2920356, 0, 0, 0, 1, 1,
0.7790469, 0.7107216, 0.8033382, 0, 0, 0, 1, 1,
0.7808122, 0.6327658, 0.5460411, 0, 0, 0, 1, 1,
0.7819124, 0.3418576, 1.306316, 0, 0, 0, 1, 1,
0.784795, 0.9424229, -0.1074415, 0, 0, 0, 1, 1,
0.7885867, -0.242132, 2.472225, 0, 0, 0, 1, 1,
0.7896991, -0.536501, 1.661898, 1, 1, 1, 1, 1,
0.7907059, -1.040787, 1.872697, 1, 1, 1, 1, 1,
0.7942889, -1.259708, 3.984824, 1, 1, 1, 1, 1,
0.7967925, -0.1965059, 2.614321, 1, 1, 1, 1, 1,
0.7978057, -1.06844, 3.255782, 1, 1, 1, 1, 1,
0.8031242, -0.3966925, 1.919892, 1, 1, 1, 1, 1,
0.8032306, -1.009828, 2.502972, 1, 1, 1, 1, 1,
0.8072762, 1.86883, 0.254298, 1, 1, 1, 1, 1,
0.8078288, -1.534916, 2.718495, 1, 1, 1, 1, 1,
0.8122515, 1.145478, -0.8994838, 1, 1, 1, 1, 1,
0.8180317, -1.471848, 1.243721, 1, 1, 1, 1, 1,
0.8201861, -0.1619048, 0.6107273, 1, 1, 1, 1, 1,
0.8217151, -0.3029472, 1.622197, 1, 1, 1, 1, 1,
0.8217982, -0.4810132, 1.675583, 1, 1, 1, 1, 1,
0.824855, 0.4118069, 0.5373657, 1, 1, 1, 1, 1,
0.8254709, 0.7343612, 2.212972, 0, 0, 1, 1, 1,
0.8258579, 0.5588132, 0.8420501, 1, 0, 0, 1, 1,
0.8326262, -0.03415634, 0.9824871, 1, 0, 0, 1, 1,
0.8362, 0.3651312, -1.217189, 1, 0, 0, 1, 1,
0.8405824, -0.7558374, 1.796361, 1, 0, 0, 1, 1,
0.8464756, 1.663482, 0.6768836, 1, 0, 0, 1, 1,
0.8555556, -0.8608873, 2.194501, 0, 0, 0, 1, 1,
0.8571224, 0.2692195, 1.984501, 0, 0, 0, 1, 1,
0.8622274, 0.3675358, 1.512748, 0, 0, 0, 1, 1,
0.8632742, -0.4016499, 3.314096, 0, 0, 0, 1, 1,
0.8709218, 0.3948943, 0.7959065, 0, 0, 0, 1, 1,
0.8722014, 0.02421535, 3.652045, 0, 0, 0, 1, 1,
0.8723451, 0.4810199, 2.047426, 0, 0, 0, 1, 1,
0.8779285, 0.7069525, -0.1594456, 1, 1, 1, 1, 1,
0.8800523, 0.2699082, 0.2957059, 1, 1, 1, 1, 1,
0.8828982, -0.3860663, 0.7887293, 1, 1, 1, 1, 1,
0.884437, -0.8878512, 2.415417, 1, 1, 1, 1, 1,
0.8851572, -0.4292062, 2.005809, 1, 1, 1, 1, 1,
0.8852746, -1.044481, 1.161925, 1, 1, 1, 1, 1,
0.8862092, -0.4165114, 0.9377438, 1, 1, 1, 1, 1,
0.8911137, 0.3538404, 0.7627665, 1, 1, 1, 1, 1,
0.8953229, 0.4878448, 1.631245, 1, 1, 1, 1, 1,
0.8987435, 0.5119182, 1.13886, 1, 1, 1, 1, 1,
0.9231586, 0.8521981, -0.1544929, 1, 1, 1, 1, 1,
0.9411725, -0.8004661, 1.331057, 1, 1, 1, 1, 1,
0.9424762, -0.02129993, 2.806725, 1, 1, 1, 1, 1,
0.943445, -0.489619, 3.048252, 1, 1, 1, 1, 1,
0.9455932, -0.1048755, 1.74428, 1, 1, 1, 1, 1,
0.9469851, -1.359365, 2.938514, 0, 0, 1, 1, 1,
0.950232, -1.701481, 3.561201, 1, 0, 0, 1, 1,
0.9513474, 1.05171, 1.291452, 1, 0, 0, 1, 1,
0.9601911, -1.463154, 0.5964215, 1, 0, 0, 1, 1,
0.9742311, 1.07877, -0.192609, 1, 0, 0, 1, 1,
0.9754551, 0.8471634, 0.5617929, 1, 0, 0, 1, 1,
0.9797952, -1.453933, 3.571887, 0, 0, 0, 1, 1,
0.9941036, -0.3912424, 3.442883, 0, 0, 0, 1, 1,
1.006757, 0.8264058, 1.453305, 0, 0, 0, 1, 1,
1.006815, -0.8810836, 3.171162, 0, 0, 0, 1, 1,
1.011114, -0.2218175, 3.733212, 0, 0, 0, 1, 1,
1.014826, -0.628883, 2.022141, 0, 0, 0, 1, 1,
1.020911, -0.3269061, 4.354875, 0, 0, 0, 1, 1,
1.021862, 1.034097, 1.249237, 1, 1, 1, 1, 1,
1.027367, -0.4034036, 3.720116, 1, 1, 1, 1, 1,
1.028903, 0.6259619, 1.194121, 1, 1, 1, 1, 1,
1.032051, -0.5542808, 1.120036, 1, 1, 1, 1, 1,
1.053935, -0.1840787, 1.531834, 1, 1, 1, 1, 1,
1.055683, -0.6698673, 4.125016, 1, 1, 1, 1, 1,
1.057557, 0.8386799, 0.5885991, 1, 1, 1, 1, 1,
1.062399, 1.556081, 1.548847, 1, 1, 1, 1, 1,
1.067331, 0.03124648, 2.323504, 1, 1, 1, 1, 1,
1.072159, 1.02469, 1.700588, 1, 1, 1, 1, 1,
1.083424, 0.4104274, 1.015478, 1, 1, 1, 1, 1,
1.086563, 0.6469033, 1.30241, 1, 1, 1, 1, 1,
1.087963, 2.114608, -0.7278428, 1, 1, 1, 1, 1,
1.094386, 0.4952473, -0.1300489, 1, 1, 1, 1, 1,
1.098665, 0.2459409, 3.971256, 1, 1, 1, 1, 1,
1.099653, -0.2220775, 1.661275, 0, 0, 1, 1, 1,
1.102066, -0.3680987, 2.89238, 1, 0, 0, 1, 1,
1.114037, 0.8293922, 0.9083562, 1, 0, 0, 1, 1,
1.122208, 1.82298, 1.722217, 1, 0, 0, 1, 1,
1.125334, 0.127856, 2.790797, 1, 0, 0, 1, 1,
1.12667, -1.177584, 3.921425, 1, 0, 0, 1, 1,
1.131057, 0.5010411, 0.8002477, 0, 0, 0, 1, 1,
1.139813, -0.9517034, 2.092577, 0, 0, 0, 1, 1,
1.152698, 1.166885, 1.536806, 0, 0, 0, 1, 1,
1.153892, -0.8290495, 0.9120982, 0, 0, 0, 1, 1,
1.158048, -0.02275316, 2.15742, 0, 0, 0, 1, 1,
1.163871, -1.003715, 3.905215, 0, 0, 0, 1, 1,
1.164561, -0.7179747, 2.461282, 0, 0, 0, 1, 1,
1.178596, 0.5853134, 0.8206238, 1, 1, 1, 1, 1,
1.196136, 0.201571, 1.029102, 1, 1, 1, 1, 1,
1.198938, 1.441491, 1.619251, 1, 1, 1, 1, 1,
1.207552, 0.4560201, 2.223212, 1, 1, 1, 1, 1,
1.209179, -2.631272, 2.88733, 1, 1, 1, 1, 1,
1.21144, -0.2561871, 0.8646449, 1, 1, 1, 1, 1,
1.211604, -0.4192634, 2.642818, 1, 1, 1, 1, 1,
1.215053, -0.3203246, 1.507638, 1, 1, 1, 1, 1,
1.230069, 1.876936, 0.4430225, 1, 1, 1, 1, 1,
1.231534, -1.278726, 2.710449, 1, 1, 1, 1, 1,
1.236645, 0.06770554, 2.125551, 1, 1, 1, 1, 1,
1.239724, -1.0334, 3.776812, 1, 1, 1, 1, 1,
1.242368, 0.2083702, 2.146588, 1, 1, 1, 1, 1,
1.246745, -0.1962469, 0.9340863, 1, 1, 1, 1, 1,
1.247882, 0.4190702, 2.68655, 1, 1, 1, 1, 1,
1.248626, -0.5784267, 2.598115, 0, 0, 1, 1, 1,
1.256634, -0.1160382, 1.709564, 1, 0, 0, 1, 1,
1.260234, 1.007781, 0.6679621, 1, 0, 0, 1, 1,
1.260329, 0.06223606, 1.658599, 1, 0, 0, 1, 1,
1.269724, -0.7048377, 2.656817, 1, 0, 0, 1, 1,
1.285392, 0.47079, 4.045185, 1, 0, 0, 1, 1,
1.300704, -2.214657, 4.288581, 0, 0, 0, 1, 1,
1.309268, 0.148591, 3.638368, 0, 0, 0, 1, 1,
1.310404, 0.7410555, 0.2191591, 0, 0, 0, 1, 1,
1.31062, 0.1167671, -0.2016621, 0, 0, 0, 1, 1,
1.323147, 0.5607204, 0.2113356, 0, 0, 0, 1, 1,
1.333735, 0.8897619, -0.1361273, 0, 0, 0, 1, 1,
1.339717, 0.04013507, 0.7444476, 0, 0, 0, 1, 1,
1.340156, -0.2081657, 0.8849076, 1, 1, 1, 1, 1,
1.340421, -1.616792, 1.317456, 1, 1, 1, 1, 1,
1.34141, 1.271612, -1.210825, 1, 1, 1, 1, 1,
1.342428, -1.958777, 2.593681, 1, 1, 1, 1, 1,
1.34756, -0.8509089, 1.986587, 1, 1, 1, 1, 1,
1.353493, 1.089251, 1.010739, 1, 1, 1, 1, 1,
1.372422, 0.419213, 1.201405, 1, 1, 1, 1, 1,
1.374786, -2.217793, 1.976219, 1, 1, 1, 1, 1,
1.378169, 1.632503, 1.343501, 1, 1, 1, 1, 1,
1.381767, -0.8297578, 2.520054, 1, 1, 1, 1, 1,
1.383424, -0.1208433, 1.968586, 1, 1, 1, 1, 1,
1.384264, -0.5976382, 2.923432, 1, 1, 1, 1, 1,
1.387057, 0.05783305, 0.9715926, 1, 1, 1, 1, 1,
1.41159, 2.089405, 2.337595, 1, 1, 1, 1, 1,
1.41454, -1.501087, 2.53935, 1, 1, 1, 1, 1,
1.418095, -1.189537, -0.07655805, 0, 0, 1, 1, 1,
1.433371, -1.41156, 2.200081, 1, 0, 0, 1, 1,
1.437201, -0.1498629, 0.9333896, 1, 0, 0, 1, 1,
1.437394, 0.02978439, 0.7995936, 1, 0, 0, 1, 1,
1.43843, -1.541552, 1.802197, 1, 0, 0, 1, 1,
1.442819, -0.1517966, 2.884025, 1, 0, 0, 1, 1,
1.443863, -2.407526, 1.912307, 0, 0, 0, 1, 1,
1.444413, 0.9987909, 2.86657, 0, 0, 0, 1, 1,
1.472519, -1.407735, 2.589941, 0, 0, 0, 1, 1,
1.473513, 0.7882338, 0.700891, 0, 0, 0, 1, 1,
1.474544, -0.2713634, 3.091925, 0, 0, 0, 1, 1,
1.475098, -1.032453, 2.559818, 0, 0, 0, 1, 1,
1.475313, 0.4723848, -0.148803, 0, 0, 0, 1, 1,
1.496749, 0.5032565, 1.932893, 1, 1, 1, 1, 1,
1.503496, 0.8813716, 0.6553725, 1, 1, 1, 1, 1,
1.523394, -0.1031331, 2.438554, 1, 1, 1, 1, 1,
1.533821, 3.318856, -2.48332, 1, 1, 1, 1, 1,
1.543292, 0.9611126, 1.783447, 1, 1, 1, 1, 1,
1.545624, -0.7466342, 2.725034, 1, 1, 1, 1, 1,
1.546796, 1.089152, 1.309005, 1, 1, 1, 1, 1,
1.547771, 1.342546, -1.148315, 1, 1, 1, 1, 1,
1.556571, 0.2122961, 2.145247, 1, 1, 1, 1, 1,
1.56993, 1.427871, 1.764756, 1, 1, 1, 1, 1,
1.579687, -1.016037, 2.297787, 1, 1, 1, 1, 1,
1.589261, -0.8196005, 2.246055, 1, 1, 1, 1, 1,
1.592931, -0.1895056, 0.98041, 1, 1, 1, 1, 1,
1.600524, 1.107513, 3.369576, 1, 1, 1, 1, 1,
1.622594, 1.557764, 0.3526791, 1, 1, 1, 1, 1,
1.631495, -1.195256, 1.791931, 0, 0, 1, 1, 1,
1.633367, 1.82251, 0.661249, 1, 0, 0, 1, 1,
1.641164, -0.6089615, 4.363918, 1, 0, 0, 1, 1,
1.650804, 0.8092986, 0.4359029, 1, 0, 0, 1, 1,
1.661374, -0.6284794, 2.057602, 1, 0, 0, 1, 1,
1.672628, -1.215814, 0.6518046, 1, 0, 0, 1, 1,
1.676924, 1.271447, 3.282886, 0, 0, 0, 1, 1,
1.682604, -0.5401821, 2.261875, 0, 0, 0, 1, 1,
1.686653, -0.6537677, 1.321635, 0, 0, 0, 1, 1,
1.703206, 0.4465624, -0.006458594, 0, 0, 0, 1, 1,
1.7173, 1.150603, -0.2073248, 0, 0, 0, 1, 1,
1.763453, 0.2739657, 2.115185, 0, 0, 0, 1, 1,
1.789252, -0.5367571, 1.857535, 0, 0, 0, 1, 1,
1.803908, -0.1675869, 1.472912, 1, 1, 1, 1, 1,
1.804317, -0.6909169, 2.398715, 1, 1, 1, 1, 1,
1.829907, -3.980628, 3.763646, 1, 1, 1, 1, 1,
1.872794, 1.072641, 1.776729, 1, 1, 1, 1, 1,
1.875641, 1.03632, 0.6194027, 1, 1, 1, 1, 1,
1.876623, 0.677579, 1.844377, 1, 1, 1, 1, 1,
1.88548, 1.034752, 0.5216997, 1, 1, 1, 1, 1,
1.886209, 0.560293, 1.474221, 1, 1, 1, 1, 1,
1.916264, 1.388239, 0.7420537, 1, 1, 1, 1, 1,
1.924538, -1.401231, 1.485034, 1, 1, 1, 1, 1,
1.954633, -1.159995, 0.4876943, 1, 1, 1, 1, 1,
1.962377, -0.1625973, 1.407408, 1, 1, 1, 1, 1,
1.965792, -1.01523, 1.233503, 1, 1, 1, 1, 1,
1.999938, -0.5017964, 2.047672, 1, 1, 1, 1, 1,
2.001431, 0.5921286, 2.042179, 1, 1, 1, 1, 1,
2.017256, 0.1666414, 1.47479, 0, 0, 1, 1, 1,
2.054597, -1.603634, 3.191909, 1, 0, 0, 1, 1,
2.075347, 0.760381, 0.5367785, 1, 0, 0, 1, 1,
2.075872, -0.3160138, 0.9913709, 1, 0, 0, 1, 1,
2.082911, -0.05360549, -0.663357, 1, 0, 0, 1, 1,
2.15871, 0.2235625, 1.345772, 1, 0, 0, 1, 1,
2.159822, 0.4790977, 0.4488767, 0, 0, 0, 1, 1,
2.163848, 0.6401027, 2.401331, 0, 0, 0, 1, 1,
2.188238, 0.01792225, 0.08213723, 0, 0, 0, 1, 1,
2.19156, -1.234068, 2.971838, 0, 0, 0, 1, 1,
2.20449, 1.071103, 1.602928, 0, 0, 0, 1, 1,
2.281923, -0.178421, 0.2677867, 0, 0, 0, 1, 1,
2.296328, 0.03556587, 1.322926, 0, 0, 0, 1, 1,
2.452812, -0.8314918, 2.964325, 1, 1, 1, 1, 1,
2.462162, -0.06623652, 1.735691, 1, 1, 1, 1, 1,
2.58781, 0.1395543, 2.022372, 1, 1, 1, 1, 1,
2.613634, 1.770114, 1.342179, 1, 1, 1, 1, 1,
2.617001, 0.6561099, 2.486578, 1, 1, 1, 1, 1,
2.76572, -0.2718991, 2.655071, 1, 1, 1, 1, 1,
2.962317, 1.314712, 0.601652, 1, 1, 1, 1, 1
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
var radius = 9.808653;
var distance = 34.45248;
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
mvMatrix.translate( 0.1868675, 0.3308861, -0.2195742 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.45248);
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
