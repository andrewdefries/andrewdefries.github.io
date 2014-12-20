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
-3.657621, 0.3001195, -2.0502, 1, 0, 0, 1,
-3.090111, 1.129416, -0.2463942, 1, 0.007843138, 0, 1,
-2.818068, -0.5001703, -1.83561, 1, 0.01176471, 0, 1,
-2.695191, -0.03276397, -0.01073281, 1, 0.01960784, 0, 1,
-2.570073, 3.139805, -1.236667, 1, 0.02352941, 0, 1,
-2.554619, -0.6833046, -1.842054, 1, 0.03137255, 0, 1,
-2.530111, 1.933069, -1.624109, 1, 0.03529412, 0, 1,
-2.522207, -2.130702, -3.124344, 1, 0.04313726, 0, 1,
-2.499087, -1.541876, -2.157536, 1, 0.04705882, 0, 1,
-2.480525, 1.318732, -1.154351, 1, 0.05490196, 0, 1,
-2.291815, 0.1918057, -1.250246, 1, 0.05882353, 0, 1,
-2.287579, -1.167774, -2.168305, 1, 0.06666667, 0, 1,
-2.284468, 0.03104212, -1.715907, 1, 0.07058824, 0, 1,
-2.231199, 1.135281, -1.378454, 1, 0.07843138, 0, 1,
-2.205358, 0.1171892, 0.009697379, 1, 0.08235294, 0, 1,
-2.174093, -0.4396426, -0.3782448, 1, 0.09019608, 0, 1,
-2.101621, -1.128354, -1.279543, 1, 0.09411765, 0, 1,
-2.085759, -0.8397791, -0.5692241, 1, 0.1019608, 0, 1,
-2.074706, -0.05187714, -0.2012307, 1, 0.1098039, 0, 1,
-2.073863, -1.991979, -2.08485, 1, 0.1137255, 0, 1,
-2.047504, -0.1994453, -2.763873, 1, 0.1215686, 0, 1,
-2.044026, 0.776019, -0.2054415, 1, 0.1254902, 0, 1,
-2.022072, -0.01636641, -2.377838, 1, 0.1333333, 0, 1,
-1.971179, 1.198256, -2.31813, 1, 0.1372549, 0, 1,
-1.969835, -0.1347697, -0.6529801, 1, 0.145098, 0, 1,
-1.96019, -0.7070674, -2.551545, 1, 0.1490196, 0, 1,
-1.940924, 0.6750836, -2.117426, 1, 0.1568628, 0, 1,
-1.937004, 0.3520539, -0.4023157, 1, 0.1607843, 0, 1,
-1.928801, -2.071595, -2.657887, 1, 0.1686275, 0, 1,
-1.892688, 0.2459096, -1.535018, 1, 0.172549, 0, 1,
-1.891029, -1.978339, -1.898821, 1, 0.1803922, 0, 1,
-1.85576, -0.2907214, -2.005272, 1, 0.1843137, 0, 1,
-1.827605, 2.251051, -1.981558, 1, 0.1921569, 0, 1,
-1.817997, 0.9244171, -2.17889, 1, 0.1960784, 0, 1,
-1.799988, 0.2048295, -1.981012, 1, 0.2039216, 0, 1,
-1.79931, -1.466444, -0.4764594, 1, 0.2117647, 0, 1,
-1.740794, -1.396574, -2.326616, 1, 0.2156863, 0, 1,
-1.733714, 0.6122425, 1.625453, 1, 0.2235294, 0, 1,
-1.71354, -1.085592, -2.099663, 1, 0.227451, 0, 1,
-1.706978, -0.7520198, -3.249638, 1, 0.2352941, 0, 1,
-1.691814, 1.107615, -1.041492, 1, 0.2392157, 0, 1,
-1.667811, -1.207869, -3.874561, 1, 0.2470588, 0, 1,
-1.667719, -0.311576, 0.05237204, 1, 0.2509804, 0, 1,
-1.651796, 1.463175, 0.623235, 1, 0.2588235, 0, 1,
-1.645674, 0.4336273, -1.893915, 1, 0.2627451, 0, 1,
-1.645217, -0.3856168, -2.190039, 1, 0.2705882, 0, 1,
-1.642603, 1.885756, -1.311971, 1, 0.2745098, 0, 1,
-1.602222, -0.5057063, -2.419591, 1, 0.282353, 0, 1,
-1.599135, 0.06218765, -2.196555, 1, 0.2862745, 0, 1,
-1.593814, -0.6628894, -3.322416, 1, 0.2941177, 0, 1,
-1.583496, 1.011516, -2.132663, 1, 0.3019608, 0, 1,
-1.583254, 1.080342, -0.5231943, 1, 0.3058824, 0, 1,
-1.571838, -2.585075, -4.599404, 1, 0.3137255, 0, 1,
-1.562269, 1.503657, -0.7659233, 1, 0.3176471, 0, 1,
-1.548163, -0.4053578, -1.730549, 1, 0.3254902, 0, 1,
-1.547472, 0.2470076, -2.935669, 1, 0.3294118, 0, 1,
-1.526319, 0.4673899, -1.310584, 1, 0.3372549, 0, 1,
-1.518112, -0.1952399, -2.494868, 1, 0.3411765, 0, 1,
-1.50869, -0.6085877, -2.499786, 1, 0.3490196, 0, 1,
-1.504621, -0.6213641, -0.3894467, 1, 0.3529412, 0, 1,
-1.502636, -1.969099, -2.008696, 1, 0.3607843, 0, 1,
-1.483938, -0.9016799, -2.920643, 1, 0.3647059, 0, 1,
-1.481278, -0.3123004, -1.75584, 1, 0.372549, 0, 1,
-1.470773, -0.4220248, -1.892007, 1, 0.3764706, 0, 1,
-1.459345, 1.039215, -2.21523, 1, 0.3843137, 0, 1,
-1.45775, 1.647377, -2.150889, 1, 0.3882353, 0, 1,
-1.457517, -0.292292, -3.484433, 1, 0.3960784, 0, 1,
-1.455487, 0.1672997, -1.280043, 1, 0.4039216, 0, 1,
-1.439121, 1.619257, -1.69572, 1, 0.4078431, 0, 1,
-1.416304, 1.077198, 0.2569607, 1, 0.4156863, 0, 1,
-1.413801, 1.142942, -1.444385, 1, 0.4196078, 0, 1,
-1.409031, 0.1542854, -2.04356, 1, 0.427451, 0, 1,
-1.408209, 0.6868169, -1.269809, 1, 0.4313726, 0, 1,
-1.389181, 0.7666802, -1.159666, 1, 0.4392157, 0, 1,
-1.3833, 0.381764, 0.1546423, 1, 0.4431373, 0, 1,
-1.378194, 0.7966519, -0.316712, 1, 0.4509804, 0, 1,
-1.359062, -0.7815037, -2.204367, 1, 0.454902, 0, 1,
-1.356535, -0.09153917, -1.314871, 1, 0.4627451, 0, 1,
-1.352015, -0.2877736, -3.819921, 1, 0.4666667, 0, 1,
-1.349021, 1.05232, -0.08288936, 1, 0.4745098, 0, 1,
-1.347867, 0.1875437, -0.6964531, 1, 0.4784314, 0, 1,
-1.346851, 0.2041879, -0.9276731, 1, 0.4862745, 0, 1,
-1.344478, 0.5998652, -0.5830672, 1, 0.4901961, 0, 1,
-1.317836, -1.158076, -1.856095, 1, 0.4980392, 0, 1,
-1.312102, -1.647669, -2.626382, 1, 0.5058824, 0, 1,
-1.309657, -0.07395297, -1.597904, 1, 0.509804, 0, 1,
-1.306102, 0.3322855, -0.8976948, 1, 0.5176471, 0, 1,
-1.28156, 2.127457, -0.2782897, 1, 0.5215687, 0, 1,
-1.275677, 1.350275, -1.877175, 1, 0.5294118, 0, 1,
-1.274542, -0.5124158, -2.380668, 1, 0.5333334, 0, 1,
-1.270942, -0.353967, -3.214762, 1, 0.5411765, 0, 1,
-1.267184, -1.498088, -3.684164, 1, 0.5450981, 0, 1,
-1.265516, 0.950655, -1.227329, 1, 0.5529412, 0, 1,
-1.255325, 0.8701237, -1.168834, 1, 0.5568628, 0, 1,
-1.248719, -1.333214, -2.154627, 1, 0.5647059, 0, 1,
-1.246998, -0.4024299, -0.4441826, 1, 0.5686275, 0, 1,
-1.242834, 0.2103358, 1.919406, 1, 0.5764706, 0, 1,
-1.234617, 0.1246747, -1.669486, 1, 0.5803922, 0, 1,
-1.219049, -0.7703468, -1.21476, 1, 0.5882353, 0, 1,
-1.215004, 0.8795911, 0.09571997, 1, 0.5921569, 0, 1,
-1.209266, -0.3931263, -4.445222, 1, 0.6, 0, 1,
-1.205537, 1.895462, 0.6956495, 1, 0.6078432, 0, 1,
-1.198331, 2.011175, -0.7744425, 1, 0.6117647, 0, 1,
-1.197328, -0.6738178, 0.1392787, 1, 0.6196079, 0, 1,
-1.196427, 0.2541455, -1.219895, 1, 0.6235294, 0, 1,
-1.19403, 0.1972174, -1.094557, 1, 0.6313726, 0, 1,
-1.188373, -0.1057452, -1.956699, 1, 0.6352941, 0, 1,
-1.188089, 2.597464, -0.8912637, 1, 0.6431373, 0, 1,
-1.180273, -1.607206, -1.655621, 1, 0.6470588, 0, 1,
-1.177407, -0.5748345, -1.164369, 1, 0.654902, 0, 1,
-1.16398, 0.3860857, -0.1411144, 1, 0.6588235, 0, 1,
-1.161906, -0.4287795, -1.036064, 1, 0.6666667, 0, 1,
-1.14704, -1.786674, -6.095991, 1, 0.6705883, 0, 1,
-1.144755, 0.8490633, -1.662489, 1, 0.6784314, 0, 1,
-1.143985, 0.04870987, -0.7829493, 1, 0.682353, 0, 1,
-1.143948, -1.497936, -3.735003, 1, 0.6901961, 0, 1,
-1.14283, -1.075525, -2.814732, 1, 0.6941177, 0, 1,
-1.138314, -0.5728544, -2.640144, 1, 0.7019608, 0, 1,
-1.136655, -0.9360514, -2.336201, 1, 0.7098039, 0, 1,
-1.131148, 0.3487701, -3.218299, 1, 0.7137255, 0, 1,
-1.130177, 0.6989657, -1.952913, 1, 0.7215686, 0, 1,
-1.119326, -1.305001, -3.287047, 1, 0.7254902, 0, 1,
-1.1151, -0.7260644, -1.999939, 1, 0.7333333, 0, 1,
-1.114831, 0.1260776, -1.272498, 1, 0.7372549, 0, 1,
-1.089981, 1.189058, -0.1299491, 1, 0.7450981, 0, 1,
-1.089967, -1.136808, -2.928239, 1, 0.7490196, 0, 1,
-1.083173, 2.340158, 0.2799271, 1, 0.7568628, 0, 1,
-1.082439, -0.2080885, -1.562821, 1, 0.7607843, 0, 1,
-1.081606, 1.121189, -2.055441, 1, 0.7686275, 0, 1,
-1.081068, 0.2638383, -2.116619, 1, 0.772549, 0, 1,
-1.07832, 1.0454, 1.512635, 1, 0.7803922, 0, 1,
-1.075456, 1.626967, -1.185136, 1, 0.7843137, 0, 1,
-1.074541, -1.562692, -2.205551, 1, 0.7921569, 0, 1,
-1.072589, 0.0478219, -1.254942, 1, 0.7960784, 0, 1,
-1.069852, -0.2816018, -2.97275, 1, 0.8039216, 0, 1,
-1.065692, -1.524034, -2.822331, 1, 0.8117647, 0, 1,
-1.065541, -0.1860824, -1.990992, 1, 0.8156863, 0, 1,
-1.062822, 1.197517, -2.821532, 1, 0.8235294, 0, 1,
-1.061154, 1.096171, -3.284199, 1, 0.827451, 0, 1,
-1.052746, -0.03102466, -2.494852, 1, 0.8352941, 0, 1,
-1.045229, 1.567532, 1.28852, 1, 0.8392157, 0, 1,
-1.037533, 1.840929, 0.376794, 1, 0.8470588, 0, 1,
-1.029158, 1.066631, 1.653157, 1, 0.8509804, 0, 1,
-1.02884, 1.943118, 1.203701, 1, 0.8588235, 0, 1,
-1.027377, 0.2172666, -1.164053, 1, 0.8627451, 0, 1,
-1.023768, 1.111325, -1.966722, 1, 0.8705882, 0, 1,
-1.023208, -1.995744, -4.027323, 1, 0.8745098, 0, 1,
-1.015783, -0.5228483, -2.07606, 1, 0.8823529, 0, 1,
-1.011743, -1.059577, -3.459339, 1, 0.8862745, 0, 1,
-1.008617, -1.030838, -1.571819, 1, 0.8941177, 0, 1,
-1.006712, -0.7272218, -3.309031, 1, 0.8980392, 0, 1,
-1.003961, 1.43539, -1.897123, 1, 0.9058824, 0, 1,
-0.9989666, -2.324613, -2.304838, 1, 0.9137255, 0, 1,
-0.9980444, 0.3527547, -1.255478, 1, 0.9176471, 0, 1,
-0.9943218, -0.04284594, 0.1399494, 1, 0.9254902, 0, 1,
-0.9891962, 0.08035163, -0.55676, 1, 0.9294118, 0, 1,
-0.9726408, -0.3029118, -2.186258, 1, 0.9372549, 0, 1,
-0.9704757, -1.297649, -1.370026, 1, 0.9411765, 0, 1,
-0.9675103, 0.4310968, -1.865854, 1, 0.9490196, 0, 1,
-0.9664134, -0.4241854, -2.572979, 1, 0.9529412, 0, 1,
-0.9634569, -0.9353712, -2.414924, 1, 0.9607843, 0, 1,
-0.9631447, -1.578765, -2.999649, 1, 0.9647059, 0, 1,
-0.9621718, -0.6342821, -2.453859, 1, 0.972549, 0, 1,
-0.9557325, 0.1896024, -1.342159, 1, 0.9764706, 0, 1,
-0.9533939, -1.962489, -3.061246, 1, 0.9843137, 0, 1,
-0.9523305, 1.593925, 0.0621319, 1, 0.9882353, 0, 1,
-0.9491274, -1.348965, -0.9512553, 1, 0.9960784, 0, 1,
-0.9483407, 0.5983477, -0.8004177, 0.9960784, 1, 0, 1,
-0.932676, 1.324352, 1.052103, 0.9921569, 1, 0, 1,
-0.9285216, -1.877776, -4.756065, 0.9843137, 1, 0, 1,
-0.9272655, 0.1832103, -3.109579, 0.9803922, 1, 0, 1,
-0.9256406, 0.0355189, -0.1451716, 0.972549, 1, 0, 1,
-0.9156326, 0.5678508, 0.5320691, 0.9686275, 1, 0, 1,
-0.9090905, -0.230608, -2.954186, 0.9607843, 1, 0, 1,
-0.9051486, 0.71417, -0.1644922, 0.9568627, 1, 0, 1,
-0.8984683, 1.203589, 0.04683396, 0.9490196, 1, 0, 1,
-0.8863973, 0.7065882, -1.789746, 0.945098, 1, 0, 1,
-0.8855618, -0.9261962, -3.660661, 0.9372549, 1, 0, 1,
-0.8854004, -1.426951, -2.451804, 0.9333333, 1, 0, 1,
-0.8753695, 0.4953814, -1.435043, 0.9254902, 1, 0, 1,
-0.8711349, 0.951889, 1.216442, 0.9215686, 1, 0, 1,
-0.8694484, 1.441457, -0.2252117, 0.9137255, 1, 0, 1,
-0.8690596, -1.200925, -0.8270974, 0.9098039, 1, 0, 1,
-0.864792, -1.682745, -3.084194, 0.9019608, 1, 0, 1,
-0.8602228, -0.9976321, -1.171727, 0.8941177, 1, 0, 1,
-0.8542308, 0.9781417, 0.8271679, 0.8901961, 1, 0, 1,
-0.8536872, -0.8702052, -2.530279, 0.8823529, 1, 0, 1,
-0.8528304, 1.170313, -0.5670077, 0.8784314, 1, 0, 1,
-0.8522633, -1.455292, -1.704352, 0.8705882, 1, 0, 1,
-0.8522148, -0.9170883, -1.511538, 0.8666667, 1, 0, 1,
-0.8459632, -0.515187, -2.0364, 0.8588235, 1, 0, 1,
-0.8453879, 0.250594, 0.02576398, 0.854902, 1, 0, 1,
-0.8417683, 0.3925982, -1.794329, 0.8470588, 1, 0, 1,
-0.8304622, -0.6435096, -3.455586, 0.8431373, 1, 0, 1,
-0.8284931, 0.6056992, -0.7584302, 0.8352941, 1, 0, 1,
-0.8252185, 0.8276088, -0.7788575, 0.8313726, 1, 0, 1,
-0.8246514, 0.79135, -0.9891988, 0.8235294, 1, 0, 1,
-0.8213281, 1.224975, -0.5052441, 0.8196079, 1, 0, 1,
-0.8210429, 0.5282691, -0.9047033, 0.8117647, 1, 0, 1,
-0.8181847, 1.448857, -1.912747, 0.8078431, 1, 0, 1,
-0.8029588, -0.7279978, -1.871018, 0.8, 1, 0, 1,
-0.7958182, 1.337929, 0.3085977, 0.7921569, 1, 0, 1,
-0.7931339, 0.1039072, -1.307477, 0.7882353, 1, 0, 1,
-0.7892188, -0.1312667, -2.901309, 0.7803922, 1, 0, 1,
-0.7840604, 1.025318, -0.2753589, 0.7764706, 1, 0, 1,
-0.7741041, -0.1970729, -2.533104, 0.7686275, 1, 0, 1,
-0.7685801, -0.5119028, -0.7044277, 0.7647059, 1, 0, 1,
-0.7663294, 0.5966502, -2.005648, 0.7568628, 1, 0, 1,
-0.7617162, -1.900062, -3.771562, 0.7529412, 1, 0, 1,
-0.7585736, -1.102524, -3.41647, 0.7450981, 1, 0, 1,
-0.749791, -0.360284, -2.752496, 0.7411765, 1, 0, 1,
-0.7497665, -1.90007, -3.567945, 0.7333333, 1, 0, 1,
-0.7446934, 1.687332, -1.700244, 0.7294118, 1, 0, 1,
-0.7444715, 0.5532302, 0.4108108, 0.7215686, 1, 0, 1,
-0.7419596, 1.897125, -2.035689, 0.7176471, 1, 0, 1,
-0.7415789, 1.108, 0.2421513, 0.7098039, 1, 0, 1,
-0.7340118, 1.411765, -0.3417032, 0.7058824, 1, 0, 1,
-0.7266411, -1.358375, -3.402691, 0.6980392, 1, 0, 1,
-0.7265717, 0.9541453, -0.4194607, 0.6901961, 1, 0, 1,
-0.7251788, -0.6997186, -1.009373, 0.6862745, 1, 0, 1,
-0.7225913, 0.1825957, 0.05082556, 0.6784314, 1, 0, 1,
-0.7212216, -0.9796267, -1.119716, 0.6745098, 1, 0, 1,
-0.7208951, -0.3553887, -0.5902618, 0.6666667, 1, 0, 1,
-0.7185416, 1.036195, -2.005051, 0.6627451, 1, 0, 1,
-0.7183903, 0.004338973, -2.973228, 0.654902, 1, 0, 1,
-0.7116045, 0.4164263, -1.293681, 0.6509804, 1, 0, 1,
-0.699474, 1.220286, -0.1307477, 0.6431373, 1, 0, 1,
-0.6990438, -1.391814, -2.214481, 0.6392157, 1, 0, 1,
-0.6983318, 0.284971, -0.4418969, 0.6313726, 1, 0, 1,
-0.692522, 0.1744706, -1.518074, 0.627451, 1, 0, 1,
-0.6823118, -0.09590937, -2.683741, 0.6196079, 1, 0, 1,
-0.6725585, 0.1620887, -3.122802, 0.6156863, 1, 0, 1,
-0.6720517, -0.04940891, -0.7973817, 0.6078432, 1, 0, 1,
-0.6707445, 1.235841, 0.7933295, 0.6039216, 1, 0, 1,
-0.6654403, 0.2971944, -0.1658401, 0.5960785, 1, 0, 1,
-0.6640491, -0.9442069, -1.449556, 0.5882353, 1, 0, 1,
-0.6624861, -0.7862616, -2.430796, 0.5843138, 1, 0, 1,
-0.6622379, -1.136352, -2.938271, 0.5764706, 1, 0, 1,
-0.6602075, -0.9749463, -3.296928, 0.572549, 1, 0, 1,
-0.6486166, 0.4623352, -0.2151191, 0.5647059, 1, 0, 1,
-0.6435669, -0.2397969, -0.6529449, 0.5607843, 1, 0, 1,
-0.6420432, -1.22007, -3.315851, 0.5529412, 1, 0, 1,
-0.6403245, -0.3160051, -1.235996, 0.5490196, 1, 0, 1,
-0.6399067, -1.194293, -2.785715, 0.5411765, 1, 0, 1,
-0.6386172, -0.4204552, -1.887809, 0.5372549, 1, 0, 1,
-0.6385378, 1.114079, -0.1376392, 0.5294118, 1, 0, 1,
-0.6381117, -1.111726, -3.221828, 0.5254902, 1, 0, 1,
-0.6211911, -0.3798493, -0.2097127, 0.5176471, 1, 0, 1,
-0.6138474, 1.721925, 1.10367, 0.5137255, 1, 0, 1,
-0.6138271, -0.2576936, -2.354483, 0.5058824, 1, 0, 1,
-0.6112791, -1.485858, -3.596039, 0.5019608, 1, 0, 1,
-0.6056803, -0.9095151, -2.067146, 0.4941176, 1, 0, 1,
-0.6048554, 0.4869063, -1.243134, 0.4862745, 1, 0, 1,
-0.5997923, 1.719301, 0.4856104, 0.4823529, 1, 0, 1,
-0.5995643, 0.8618029, -1.145078, 0.4745098, 1, 0, 1,
-0.5957077, -1.315495, -3.073681, 0.4705882, 1, 0, 1,
-0.5854563, -0.09588064, 1.057916, 0.4627451, 1, 0, 1,
-0.5835335, 1.241057, -0.018879, 0.4588235, 1, 0, 1,
-0.5823449, 0.8396502, -1.466313, 0.4509804, 1, 0, 1,
-0.5802655, -0.2554058, -1.867132, 0.4470588, 1, 0, 1,
-0.5762693, 0.5644429, -0.7889351, 0.4392157, 1, 0, 1,
-0.5752168, -1.143844, -0.9037678, 0.4352941, 1, 0, 1,
-0.5714313, -0.8868409, -2.327001, 0.427451, 1, 0, 1,
-0.5690307, -0.3895967, -2.508743, 0.4235294, 1, 0, 1,
-0.5665622, 0.6679345, -2.073777, 0.4156863, 1, 0, 1,
-0.5645068, -0.9243578, -3.458498, 0.4117647, 1, 0, 1,
-0.5616009, -0.4163875, -2.380304, 0.4039216, 1, 0, 1,
-0.55146, -0.2371194, -0.7671542, 0.3960784, 1, 0, 1,
-0.5474408, -0.2495328, 0.2111537, 0.3921569, 1, 0, 1,
-0.5472973, -1.98222, -3.529076, 0.3843137, 1, 0, 1,
-0.5435295, 0.4239801, -2.441311, 0.3803922, 1, 0, 1,
-0.5315477, 0.05728764, -1.628127, 0.372549, 1, 0, 1,
-0.525065, -0.5887163, -3.457824, 0.3686275, 1, 0, 1,
-0.5225239, -1.825647, -3.429159, 0.3607843, 1, 0, 1,
-0.5141644, -0.5793881, -1.873896, 0.3568628, 1, 0, 1,
-0.512361, -0.245204, -0.6913583, 0.3490196, 1, 0, 1,
-0.5113989, -0.650752, -1.31298, 0.345098, 1, 0, 1,
-0.5089842, -3.703835, -3.042351, 0.3372549, 1, 0, 1,
-0.5072615, -1.695324, -2.429665, 0.3333333, 1, 0, 1,
-0.5046631, -0.3162977, -0.6093967, 0.3254902, 1, 0, 1,
-0.5037776, -0.8528566, -3.809242, 0.3215686, 1, 0, 1,
-0.5036666, -0.03049694, -1.211033, 0.3137255, 1, 0, 1,
-0.5022191, -0.9714767, -2.342413, 0.3098039, 1, 0, 1,
-0.4971432, -0.1149713, -1.395183, 0.3019608, 1, 0, 1,
-0.4957383, -0.9087687, -0.9524456, 0.2941177, 1, 0, 1,
-0.4955675, 0.8026057, -0.4800203, 0.2901961, 1, 0, 1,
-0.4937945, -3.366333, -3.662305, 0.282353, 1, 0, 1,
-0.4928079, -0.2151983, -1.968065, 0.2784314, 1, 0, 1,
-0.4924818, -0.980318, -1.266129, 0.2705882, 1, 0, 1,
-0.4872447, -0.2934805, -2.324926, 0.2666667, 1, 0, 1,
-0.4848022, -0.5283498, -3.223682, 0.2588235, 1, 0, 1,
-0.4829417, -0.04279278, -3.296364, 0.254902, 1, 0, 1,
-0.4772872, -0.1671571, -1.035684, 0.2470588, 1, 0, 1,
-0.4715799, 1.825899, -0.61671, 0.2431373, 1, 0, 1,
-0.4711042, -0.30629, -3.001796, 0.2352941, 1, 0, 1,
-0.4665847, 0.09198198, -3.076621, 0.2313726, 1, 0, 1,
-0.4662727, 0.4769052, -1.729743, 0.2235294, 1, 0, 1,
-0.4613336, 0.6013836, -0.8475888, 0.2196078, 1, 0, 1,
-0.4567446, -0.5089998, -1.489824, 0.2117647, 1, 0, 1,
-0.4552816, -0.7209916, -3.231556, 0.2078431, 1, 0, 1,
-0.4550429, 2.239788, 0.1948725, 0.2, 1, 0, 1,
-0.4523926, 1.850768, -0.04185015, 0.1921569, 1, 0, 1,
-0.4520504, -0.489392, -3.01835, 0.1882353, 1, 0, 1,
-0.4495848, -1.300817, -2.36835, 0.1803922, 1, 0, 1,
-0.447288, -0.5063715, -2.364848, 0.1764706, 1, 0, 1,
-0.4450275, -1.75796, -3.54707, 0.1686275, 1, 0, 1,
-0.4419112, 2.770613, -0.100428, 0.1647059, 1, 0, 1,
-0.4396902, 1.541663, 0.6249233, 0.1568628, 1, 0, 1,
-0.4343397, -0.8698609, -2.459239, 0.1529412, 1, 0, 1,
-0.4338021, -0.8421958, -4.0334, 0.145098, 1, 0, 1,
-0.4326227, -0.1502892, -1.984968, 0.1411765, 1, 0, 1,
-0.4313006, -0.9073895, -3.86761, 0.1333333, 1, 0, 1,
-0.4289939, -1.168977, -3.404867, 0.1294118, 1, 0, 1,
-0.4289337, 0.1656582, -1.260067, 0.1215686, 1, 0, 1,
-0.4275839, -0.192974, -3.033168, 0.1176471, 1, 0, 1,
-0.4259901, -0.4851187, -1.41346, 0.1098039, 1, 0, 1,
-0.4259548, 0.7507495, -1.533571, 0.1058824, 1, 0, 1,
-0.4240628, 1.056284, -0.2750639, 0.09803922, 1, 0, 1,
-0.4189903, -0.814593, -2.346843, 0.09019608, 1, 0, 1,
-0.4156684, 0.4019098, -0.5130928, 0.08627451, 1, 0, 1,
-0.4145053, 1.02869, -0.5881529, 0.07843138, 1, 0, 1,
-0.4124947, 1.121961, -0.0691502, 0.07450981, 1, 0, 1,
-0.4089637, -0.409229, -2.82703, 0.06666667, 1, 0, 1,
-0.406046, -0.8794792, -3.236364, 0.0627451, 1, 0, 1,
-0.403957, 0.506282, -0.6712861, 0.05490196, 1, 0, 1,
-0.4032681, 0.2034584, -1.861285, 0.05098039, 1, 0, 1,
-0.400924, -0.8350224, -3.492406, 0.04313726, 1, 0, 1,
-0.4001754, 0.7559374, -1.480246, 0.03921569, 1, 0, 1,
-0.3999003, -0.2223415, -4.364143, 0.03137255, 1, 0, 1,
-0.3949134, 0.2718269, 0.4152204, 0.02745098, 1, 0, 1,
-0.3942714, 1.419497, 0.2493477, 0.01960784, 1, 0, 1,
-0.3916627, 1.061535, 0.9399242, 0.01568628, 1, 0, 1,
-0.3909514, 0.6064305, -0.6630812, 0.007843138, 1, 0, 1,
-0.3896591, -2.072391, -2.530108, 0.003921569, 1, 0, 1,
-0.3895397, 0.654898, -0.7069755, 0, 1, 0.003921569, 1,
-0.3889494, 1.865008, -0.09909923, 0, 1, 0.01176471, 1,
-0.3883607, -0.3125522, -1.8325, 0, 1, 0.01568628, 1,
-0.3848662, 0.2207253, 0.7309126, 0, 1, 0.02352941, 1,
-0.3841422, -0.838959, -2.658101, 0, 1, 0.02745098, 1,
-0.3788734, -0.4437304, -2.980624, 0, 1, 0.03529412, 1,
-0.3756166, 2.266171, 1.116787, 0, 1, 0.03921569, 1,
-0.3751429, -1.667874, -3.315001, 0, 1, 0.04705882, 1,
-0.3745214, 0.915842, -0.2937435, 0, 1, 0.05098039, 1,
-0.3741119, -1.991469, -3.10647, 0, 1, 0.05882353, 1,
-0.3740151, -0.4079382, -2.449196, 0, 1, 0.0627451, 1,
-0.3695187, 0.327147, -1.541867, 0, 1, 0.07058824, 1,
-0.3691024, 0.7708509, 0.02057169, 0, 1, 0.07450981, 1,
-0.3681739, 0.7128458, -2.655166, 0, 1, 0.08235294, 1,
-0.3587416, 0.1670127, -3.134942, 0, 1, 0.08627451, 1,
-0.3545494, -0.2535605, -2.732159, 0, 1, 0.09411765, 1,
-0.3542645, 1.367415, 0.5353359, 0, 1, 0.1019608, 1,
-0.344169, -0.7613725, -4.772077, 0, 1, 0.1058824, 1,
-0.3359987, 1.260373, -0.03505822, 0, 1, 0.1137255, 1,
-0.3219357, -0.9809073, -0.1104355, 0, 1, 0.1176471, 1,
-0.3212048, -0.5919067, -1.645282, 0, 1, 0.1254902, 1,
-0.3186503, 0.0677883, -1.005674, 0, 1, 0.1294118, 1,
-0.3112814, -0.2873758, -3.204721, 0, 1, 0.1372549, 1,
-0.3066449, -0.1153272, -3.084207, 0, 1, 0.1411765, 1,
-0.3037437, -0.1532983, -2.346671, 0, 1, 0.1490196, 1,
-0.3020708, -0.1493087, -1.995616, 0, 1, 0.1529412, 1,
-0.2975138, 0.3002956, -2.51713, 0, 1, 0.1607843, 1,
-0.2972271, -0.8377819, -1.988327, 0, 1, 0.1647059, 1,
-0.292732, -2.060672, -1.919177, 0, 1, 0.172549, 1,
-0.2903298, -0.3910207, -1.278135, 0, 1, 0.1764706, 1,
-0.2897153, 0.04282832, -1.141091, 0, 1, 0.1843137, 1,
-0.289261, -1.439721, -2.738845, 0, 1, 0.1882353, 1,
-0.2801483, -0.3338865, -0.4846555, 0, 1, 0.1960784, 1,
-0.275181, 0.7596772, -1.315086, 0, 1, 0.2039216, 1,
-0.2744605, 0.3355725, -1.0936, 0, 1, 0.2078431, 1,
-0.2730772, 1.528739, -1.790901, 0, 1, 0.2156863, 1,
-0.2713506, 0.001524002, -1.158498, 0, 1, 0.2196078, 1,
-0.2697248, 0.4349855, -0.7232178, 0, 1, 0.227451, 1,
-0.2653247, 0.5440086, 0.9305581, 0, 1, 0.2313726, 1,
-0.2613756, 1.0608, -0.7084159, 0, 1, 0.2392157, 1,
-0.2568534, 0.7079999, -1.044707, 0, 1, 0.2431373, 1,
-0.2559112, 1.178675, -0.1927678, 0, 1, 0.2509804, 1,
-0.2541037, 0.5168828, -1.067026, 0, 1, 0.254902, 1,
-0.253837, 0.3267488, -2.343863, 0, 1, 0.2627451, 1,
-0.2523698, -0.8514943, -2.582283, 0, 1, 0.2666667, 1,
-0.2496978, -0.6713852, -3.369998, 0, 1, 0.2745098, 1,
-0.2409201, -0.102182, -0.8473623, 0, 1, 0.2784314, 1,
-0.2350517, 0.2735117, 1.445281, 0, 1, 0.2862745, 1,
-0.2325735, 1.656849, -0.1949973, 0, 1, 0.2901961, 1,
-0.2312151, 1.848572, 0.9740086, 0, 1, 0.2980392, 1,
-0.2310608, -0.2836462, -1.18914, 0, 1, 0.3058824, 1,
-0.2288574, -1.223606, -2.36988, 0, 1, 0.3098039, 1,
-0.2245492, 0.03316457, -1.842683, 0, 1, 0.3176471, 1,
-0.2223416, -0.1155779, -0.7938318, 0, 1, 0.3215686, 1,
-0.2186314, -0.2756854, -3.021303, 0, 1, 0.3294118, 1,
-0.2179611, 0.4904119, 0.1236776, 0, 1, 0.3333333, 1,
-0.2179139, -0.2959425, -0.6813202, 0, 1, 0.3411765, 1,
-0.2174611, 1.036137, -1.10598, 0, 1, 0.345098, 1,
-0.2160353, 0.4031784, -0.5459609, 0, 1, 0.3529412, 1,
-0.2025219, 1.08522, -0.6871045, 0, 1, 0.3568628, 1,
-0.2008428, -1.087033, -4.376025, 0, 1, 0.3647059, 1,
-0.2004066, -0.9870752, -4.033079, 0, 1, 0.3686275, 1,
-0.1973595, 0.9919543, 0.7275743, 0, 1, 0.3764706, 1,
-0.1972601, -0.2331183, -3.236126, 0, 1, 0.3803922, 1,
-0.1968632, 1.567472, -0.2605361, 0, 1, 0.3882353, 1,
-0.196581, 0.1861338, -1.117021, 0, 1, 0.3921569, 1,
-0.1927465, 0.5440986, 0.827799, 0, 1, 0.4, 1,
-0.1924855, -0.4016645, -3.813432, 0, 1, 0.4078431, 1,
-0.1896324, -0.7326281, -2.055675, 0, 1, 0.4117647, 1,
-0.1869759, 0.335654, -1.924887, 0, 1, 0.4196078, 1,
-0.1854164, -0.3931133, -3.568041, 0, 1, 0.4235294, 1,
-0.1818631, 1.046389, -1.194125, 0, 1, 0.4313726, 1,
-0.1783072, -0.7463697, -3.159473, 0, 1, 0.4352941, 1,
-0.1763719, 1.269194, 1.430634, 0, 1, 0.4431373, 1,
-0.1763153, -0.4808791, -3.79386, 0, 1, 0.4470588, 1,
-0.1742412, -0.7607775, -1.562093, 0, 1, 0.454902, 1,
-0.1730956, -0.2318748, -2.200374, 0, 1, 0.4588235, 1,
-0.1723611, 1.172751, -0.3027309, 0, 1, 0.4666667, 1,
-0.1695303, 0.8275509, -1.861661, 0, 1, 0.4705882, 1,
-0.1655718, -0.3536077, -0.8759043, 0, 1, 0.4784314, 1,
-0.1650422, 0.02350464, -2.120508, 0, 1, 0.4823529, 1,
-0.1602687, -0.6648937, -4.03018, 0, 1, 0.4901961, 1,
-0.1598811, 0.9665597, -0.8808196, 0, 1, 0.4941176, 1,
-0.158922, 0.5153258, -1.775582, 0, 1, 0.5019608, 1,
-0.1546555, 0.2987626, -0.4003578, 0, 1, 0.509804, 1,
-0.1535186, -0.7553892, -1.81065, 0, 1, 0.5137255, 1,
-0.1534213, 0.6423967, -0.2747018, 0, 1, 0.5215687, 1,
-0.1526962, -1.078139, -3.697683, 0, 1, 0.5254902, 1,
-0.148699, 0.2805734, 0.01961491, 0, 1, 0.5333334, 1,
-0.1481025, 1.023565, 0.4931685, 0, 1, 0.5372549, 1,
-0.1472686, -1.45597, -3.566128, 0, 1, 0.5450981, 1,
-0.1466542, -0.08735539, -0.2665035, 0, 1, 0.5490196, 1,
-0.1453497, 0.6524242, 0.3749489, 0, 1, 0.5568628, 1,
-0.1426671, 0.2777109, 1.153772, 0, 1, 0.5607843, 1,
-0.1420694, 1.586839, -1.410768, 0, 1, 0.5686275, 1,
-0.1404414, 1.892326, -1.093895, 0, 1, 0.572549, 1,
-0.1282209, -1.227138, -2.186497, 0, 1, 0.5803922, 1,
-0.1277775, 0.2299924, -0.756065, 0, 1, 0.5843138, 1,
-0.1219537, -0.02796564, -0.8702344, 0, 1, 0.5921569, 1,
-0.1067988, 0.8221999, -0.2857595, 0, 1, 0.5960785, 1,
-0.102685, -0.6393155, -3.837195, 0, 1, 0.6039216, 1,
-0.1011059, -0.4165378, -4.399259, 0, 1, 0.6117647, 1,
-0.08985922, 1.040394, -0.8492091, 0, 1, 0.6156863, 1,
-0.08831224, 0.5435941, 0.8742439, 0, 1, 0.6235294, 1,
-0.08411401, 0.9579311, 0.3964067, 0, 1, 0.627451, 1,
-0.0793731, -0.4416368, -2.361824, 0, 1, 0.6352941, 1,
-0.07865595, 0.7028971, 0.3603019, 0, 1, 0.6392157, 1,
-0.07856102, 1.400355, 0.207404, 0, 1, 0.6470588, 1,
-0.07600364, -1.029196, -3.003072, 0, 1, 0.6509804, 1,
-0.07538968, 1.120293, 1.304976, 0, 1, 0.6588235, 1,
-0.07380552, 0.1937004, -0.8410021, 0, 1, 0.6627451, 1,
-0.07377399, 1.114668, 1.138156, 0, 1, 0.6705883, 1,
-0.07343344, 1.413738, -0.8079919, 0, 1, 0.6745098, 1,
-0.07159745, 0.2011801, -3.380891, 0, 1, 0.682353, 1,
-0.06957885, 2.00465, 2.381904, 0, 1, 0.6862745, 1,
-0.06893102, 0.8718473, -0.2856334, 0, 1, 0.6941177, 1,
-0.06716569, 0.2461396, 1.038088, 0, 1, 0.7019608, 1,
-0.06651972, -1.8989, -3.631168, 0, 1, 0.7058824, 1,
-0.06501953, 0.8242581, 0.5230627, 0, 1, 0.7137255, 1,
-0.06051392, 0.5439871, 0.5993842, 0, 1, 0.7176471, 1,
-0.05806855, -1.102169, -4.068139, 0, 1, 0.7254902, 1,
-0.05731377, -0.9489698, -2.735326, 0, 1, 0.7294118, 1,
-0.05587167, 0.3429867, -0.3322692, 0, 1, 0.7372549, 1,
-0.05401338, 0.6768395, -1.87214, 0, 1, 0.7411765, 1,
-0.05178508, -0.8491821, -2.757162, 0, 1, 0.7490196, 1,
-0.04877354, 0.595566, -0.003625653, 0, 1, 0.7529412, 1,
-0.04597336, -0.07834845, -1.965761, 0, 1, 0.7607843, 1,
-0.04420736, -0.6039183, -2.710157, 0, 1, 0.7647059, 1,
-0.04037064, -1.501206, -3.957948, 0, 1, 0.772549, 1,
-0.03921902, -0.02936511, -1.629574, 0, 1, 0.7764706, 1,
-0.03669897, -0.1248161, -3.157033, 0, 1, 0.7843137, 1,
-0.03392619, -0.1458441, -2.185888, 0, 1, 0.7882353, 1,
-0.02956952, -0.0219068, -3.33235, 0, 1, 0.7960784, 1,
-0.02548252, -0.9613369, -3.032415, 0, 1, 0.8039216, 1,
-0.02544918, 0.7640479, 0.5155697, 0, 1, 0.8078431, 1,
-0.02018054, 1.103363, 2.122248, 0, 1, 0.8156863, 1,
-0.0199005, -0.09524149, -0.7246424, 0, 1, 0.8196079, 1,
-0.01970162, 0.57717, 0.9041919, 0, 1, 0.827451, 1,
-0.01686456, -1.411253, -4.35149, 0, 1, 0.8313726, 1,
-0.01621995, 0.05592596, 0.02011693, 0, 1, 0.8392157, 1,
-0.01107303, 1.139673, -0.8972391, 0, 1, 0.8431373, 1,
-0.008116963, -0.4870195, -2.705009, 0, 1, 0.8509804, 1,
-0.006100137, 1.655903, 1.543169, 0, 1, 0.854902, 1,
0.002404064, 0.130057, 1.140035, 0, 1, 0.8627451, 1,
0.004671836, -1.49822, 2.971171, 0, 1, 0.8666667, 1,
0.00512166, 1.086808, 0.5510938, 0, 1, 0.8745098, 1,
0.006586705, 0.3769214, 0.5288245, 0, 1, 0.8784314, 1,
0.01266902, -0.3463859, 3.598875, 0, 1, 0.8862745, 1,
0.01506036, 0.2112928, 1.159133, 0, 1, 0.8901961, 1,
0.01745173, 0.504014, 0.358068, 0, 1, 0.8980392, 1,
0.02017502, 1.236324, -1.064879, 0, 1, 0.9058824, 1,
0.02203423, -0.5103625, 2.599113, 0, 1, 0.9098039, 1,
0.02237246, 0.7144047, 0.2903841, 0, 1, 0.9176471, 1,
0.022433, 0.4588225, -1.239049, 0, 1, 0.9215686, 1,
0.02336055, -0.7275351, 5.238909, 0, 1, 0.9294118, 1,
0.02398511, -0.2680558, 5.152187, 0, 1, 0.9333333, 1,
0.02892421, -0.1962515, 2.455942, 0, 1, 0.9411765, 1,
0.0326696, -1.401859, 3.126745, 0, 1, 0.945098, 1,
0.03407102, -0.1064998, 4.392099, 0, 1, 0.9529412, 1,
0.03720868, -0.234149, 3.620965, 0, 1, 0.9568627, 1,
0.04118032, 0.7695399, -0.1525537, 0, 1, 0.9647059, 1,
0.0433159, 1.599373, 1.313406, 0, 1, 0.9686275, 1,
0.04833697, 0.4975629, -1.155904, 0, 1, 0.9764706, 1,
0.05401224, 1.65156, 0.2822949, 0, 1, 0.9803922, 1,
0.05556544, -0.03150637, 1.130235, 0, 1, 0.9882353, 1,
0.05788692, 1.155119, 0.2243703, 0, 1, 0.9921569, 1,
0.05900855, -0.9325756, 4.052496, 0, 1, 1, 1,
0.06171156, 0.09937086, -0.1489871, 0, 0.9921569, 1, 1,
0.06641634, -0.8344988, 3.226802, 0, 0.9882353, 1, 1,
0.0753468, 0.9844282, 1.082605, 0, 0.9803922, 1, 1,
0.07664838, 0.3297139, 0.4552441, 0, 0.9764706, 1, 1,
0.07831341, -1.145966, 5.257041, 0, 0.9686275, 1, 1,
0.07923134, -0.4034039, 2.028364, 0, 0.9647059, 1, 1,
0.08141708, 1.094138, -2.196969, 0, 0.9568627, 1, 1,
0.08637713, 1.323728, 1.113728, 0, 0.9529412, 1, 1,
0.08827676, -0.1206406, 3.600172, 0, 0.945098, 1, 1,
0.0885702, 0.4189062, 0.7774273, 0, 0.9411765, 1, 1,
0.09117406, 0.06002782, 2.066569, 0, 0.9333333, 1, 1,
0.09158093, -1.975729, 1.979903, 0, 0.9294118, 1, 1,
0.1041129, -0.2604395, 3.344093, 0, 0.9215686, 1, 1,
0.1068689, -0.1492494, 2.253283, 0, 0.9176471, 1, 1,
0.1109228, 1.411553, 0.2696152, 0, 0.9098039, 1, 1,
0.1122805, 0.06643548, 1.962612, 0, 0.9058824, 1, 1,
0.1142559, 0.6718095, -0.92676, 0, 0.8980392, 1, 1,
0.1144927, 0.5884823, 0.7389536, 0, 0.8901961, 1, 1,
0.121546, 0.7676963, -0.6805753, 0, 0.8862745, 1, 1,
0.1243435, 0.9585111, -0.5625706, 0, 0.8784314, 1, 1,
0.1245315, 1.467677, -0.4212505, 0, 0.8745098, 1, 1,
0.1258016, -0.710946, 3.236653, 0, 0.8666667, 1, 1,
0.1282366, 1.676793, -1.101399, 0, 0.8627451, 1, 1,
0.1296068, 0.8754493, -0.8439254, 0, 0.854902, 1, 1,
0.1305977, -0.4822146, 4.428557, 0, 0.8509804, 1, 1,
0.1309879, -0.5572007, 2.524894, 0, 0.8431373, 1, 1,
0.1326191, 2.574912, 0.6438168, 0, 0.8392157, 1, 1,
0.1349946, 0.2089333, -0.5704578, 0, 0.8313726, 1, 1,
0.1480057, -0.3393162, 3.946998, 0, 0.827451, 1, 1,
0.1480498, -0.6875208, 2.445445, 0, 0.8196079, 1, 1,
0.1500489, -0.298391, 2.662256, 0, 0.8156863, 1, 1,
0.1509621, 0.3632122, -0.2926503, 0, 0.8078431, 1, 1,
0.1530127, -1.383353, 2.5874, 0, 0.8039216, 1, 1,
0.1547116, 2.43289, 1.198206, 0, 0.7960784, 1, 1,
0.1607489, 0.8729435, -1.17909, 0, 0.7882353, 1, 1,
0.1711415, -0.4111912, 2.21803, 0, 0.7843137, 1, 1,
0.1730754, -0.3457249, 2.079168, 0, 0.7764706, 1, 1,
0.173388, 0.2448149, -1.38365, 0, 0.772549, 1, 1,
0.1754991, -0.9148845, 3.446939, 0, 0.7647059, 1, 1,
0.1757021, -0.6100966, 1.616554, 0, 0.7607843, 1, 1,
0.1759214, -0.101815, 0.9748294, 0, 0.7529412, 1, 1,
0.1759312, -0.7181494, 1.629414, 0, 0.7490196, 1, 1,
0.1792461, -0.8746689, 3.899614, 0, 0.7411765, 1, 1,
0.1798927, -0.1264579, 1.419687, 0, 0.7372549, 1, 1,
0.1825195, 0.5930858, 1.825696, 0, 0.7294118, 1, 1,
0.1827255, -1.154905, 1.613961, 0, 0.7254902, 1, 1,
0.1859406, -1.142545, 2.808172, 0, 0.7176471, 1, 1,
0.1895368, 0.8132665, 0.6843398, 0, 0.7137255, 1, 1,
0.1896808, -0.8011111, 2.582455, 0, 0.7058824, 1, 1,
0.1919954, -1.333886, 2.037051, 0, 0.6980392, 1, 1,
0.1934571, 0.4536934, -0.4450014, 0, 0.6941177, 1, 1,
0.1953309, 0.4703459, 1.938608, 0, 0.6862745, 1, 1,
0.1954084, 0.4459348, 1.142646, 0, 0.682353, 1, 1,
0.1972147, -0.6365527, 1.560714, 0, 0.6745098, 1, 1,
0.1973385, 0.9914858, 0.2520574, 0, 0.6705883, 1, 1,
0.1988795, -0.05576562, 3.117589, 0, 0.6627451, 1, 1,
0.199924, -0.7796335, 3.795636, 0, 0.6588235, 1, 1,
0.2000471, 0.2328306, 1.158005, 0, 0.6509804, 1, 1,
0.2016617, 0.7819602, 0.1509355, 0, 0.6470588, 1, 1,
0.2024032, -0.9345161, 3.522256, 0, 0.6392157, 1, 1,
0.2029772, 0.3687819, 1.044438, 0, 0.6352941, 1, 1,
0.2056145, -0.9337648, 2.384472, 0, 0.627451, 1, 1,
0.205714, 1.469674, 0.8218783, 0, 0.6235294, 1, 1,
0.2076805, -0.3103526, 2.285889, 0, 0.6156863, 1, 1,
0.2091276, -0.9352045, 3.680168, 0, 0.6117647, 1, 1,
0.2116589, 0.1738597, 1.222618, 0, 0.6039216, 1, 1,
0.2127831, -1.089365, 2.371114, 0, 0.5960785, 1, 1,
0.2129337, -1.01765, 3.104387, 0, 0.5921569, 1, 1,
0.2135825, -0.7823248, 3.731999, 0, 0.5843138, 1, 1,
0.2157072, -0.2774033, 2.727077, 0, 0.5803922, 1, 1,
0.2204066, -0.006624391, 1.750305, 0, 0.572549, 1, 1,
0.2243747, -0.1392506, 2.423453, 0, 0.5686275, 1, 1,
0.2255496, -0.2282119, 3.362347, 0, 0.5607843, 1, 1,
0.2287887, -1.487462, 4.634501, 0, 0.5568628, 1, 1,
0.229337, 1.449634, -0.6959847, 0, 0.5490196, 1, 1,
0.2298009, 0.1783224, 1.757449, 0, 0.5450981, 1, 1,
0.2371348, -0.06630069, 2.200834, 0, 0.5372549, 1, 1,
0.2371658, 1.289927, -0.5834178, 0, 0.5333334, 1, 1,
0.2379196, -0.5322272, 0.8412763, 0, 0.5254902, 1, 1,
0.2451738, -2.184617, 2.246127, 0, 0.5215687, 1, 1,
0.2464446, -0.2613356, 2.31497, 0, 0.5137255, 1, 1,
0.2464726, -0.939518, 2.303937, 0, 0.509804, 1, 1,
0.2467455, 0.2375959, 1.965065, 0, 0.5019608, 1, 1,
0.2483854, 0.9667385, -0.7275399, 0, 0.4941176, 1, 1,
0.2496749, -1.172232, 1.968921, 0, 0.4901961, 1, 1,
0.2497946, 1.554033, -0.1907739, 0, 0.4823529, 1, 1,
0.2503392, -0.009017881, 2.232253, 0, 0.4784314, 1, 1,
0.2545772, 0.3492976, 1.272711, 0, 0.4705882, 1, 1,
0.2603558, -0.9063761, 2.939843, 0, 0.4666667, 1, 1,
0.2607427, 0.2985218, -1.353866, 0, 0.4588235, 1, 1,
0.2641352, -3.11471, 4.498404, 0, 0.454902, 1, 1,
0.2674899, -0.5924833, 2.040927, 0, 0.4470588, 1, 1,
0.2677762, -1.150028, 3.626344, 0, 0.4431373, 1, 1,
0.2679176, 2.457476, -0.3876423, 0, 0.4352941, 1, 1,
0.2714046, 1.496425, -1.19296, 0, 0.4313726, 1, 1,
0.2737273, 0.08056447, 1.992389, 0, 0.4235294, 1, 1,
0.275587, -0.9706035, 2.73818, 0, 0.4196078, 1, 1,
0.2766909, 0.1227108, 0.9787464, 0, 0.4117647, 1, 1,
0.2785431, 1.510105, -0.4755768, 0, 0.4078431, 1, 1,
0.2810647, 1.059942, -0.6527004, 0, 0.4, 1, 1,
0.2811701, 0.1769345, 0.9162156, 0, 0.3921569, 1, 1,
0.283083, 0.1446445, 0.4155633, 0, 0.3882353, 1, 1,
0.2841536, -0.2643068, 2.031001, 0, 0.3803922, 1, 1,
0.2879811, 0.1878131, -0.128016, 0, 0.3764706, 1, 1,
0.2897336, -0.9720368, 1.366066, 0, 0.3686275, 1, 1,
0.2941839, 0.5404944, 0.2156103, 0, 0.3647059, 1, 1,
0.2944671, 1.151775, 0.08581783, 0, 0.3568628, 1, 1,
0.2959349, -0.7926537, 3.713401, 0, 0.3529412, 1, 1,
0.3087976, 1.209243, 1.126828, 0, 0.345098, 1, 1,
0.3096556, 0.1499761, 1.02881, 0, 0.3411765, 1, 1,
0.3100992, 0.8622487, -0.1515444, 0, 0.3333333, 1, 1,
0.3113386, -0.2968009, 2.109807, 0, 0.3294118, 1, 1,
0.313403, 0.6966826, 0.7819702, 0, 0.3215686, 1, 1,
0.3181126, -0.7387065, 2.988263, 0, 0.3176471, 1, 1,
0.3217826, 1.724863, 0.499513, 0, 0.3098039, 1, 1,
0.3316206, 0.6936178, 1.065061, 0, 0.3058824, 1, 1,
0.3345534, -0.1759332, 2.251688, 0, 0.2980392, 1, 1,
0.3373466, -0.675911, 3.49558, 0, 0.2901961, 1, 1,
0.3411349, 0.2958356, 1.435577, 0, 0.2862745, 1, 1,
0.3429801, 0.1117381, 1.840334, 0, 0.2784314, 1, 1,
0.3445024, 1.488896, 1.046708, 0, 0.2745098, 1, 1,
0.3470341, 0.2829241, 1.590824, 0, 0.2666667, 1, 1,
0.3532528, -0.4680738, 4.103604, 0, 0.2627451, 1, 1,
0.3556467, 1.46687, 0.9150625, 0, 0.254902, 1, 1,
0.3575647, 1.390928, 1.348285, 0, 0.2509804, 1, 1,
0.3610353, 0.9789309, 1.952788, 0, 0.2431373, 1, 1,
0.361447, 2.797208, 0.5829142, 0, 0.2392157, 1, 1,
0.3621366, -2.613832, 2.870275, 0, 0.2313726, 1, 1,
0.363329, 0.7276663, 2.474091, 0, 0.227451, 1, 1,
0.3655245, -1.601756, 4.787351, 0, 0.2196078, 1, 1,
0.3675649, -0.7962952, 1.961216, 0, 0.2156863, 1, 1,
0.3685843, -1.106755, 3.213042, 0, 0.2078431, 1, 1,
0.3710622, -1.014126, 1.97559, 0, 0.2039216, 1, 1,
0.3715475, -1.635817, 3.059979, 0, 0.1960784, 1, 1,
0.3729467, 1.178982, 0.310412, 0, 0.1882353, 1, 1,
0.374944, 0.8167087, 0.5003765, 0, 0.1843137, 1, 1,
0.3755862, -1.429425, 3.12552, 0, 0.1764706, 1, 1,
0.3764107, -0.3281647, 2.289679, 0, 0.172549, 1, 1,
0.3791758, -0.2991227, 3.569955, 0, 0.1647059, 1, 1,
0.3829586, -0.4216273, 1.844565, 0, 0.1607843, 1, 1,
0.3890458, -0.1156473, 0.3304496, 0, 0.1529412, 1, 1,
0.3998581, 0.6748375, 1.397204, 0, 0.1490196, 1, 1,
0.4053692, -0.8642536, 2.907346, 0, 0.1411765, 1, 1,
0.4059079, -0.6273269, 1.659922, 0, 0.1372549, 1, 1,
0.4116534, -0.932997, 3.66263, 0, 0.1294118, 1, 1,
0.4156771, 0.3097288, 2.129675, 0, 0.1254902, 1, 1,
0.4168197, -1.34814, 2.242146, 0, 0.1176471, 1, 1,
0.4184164, 0.09639229, 3.042248, 0, 0.1137255, 1, 1,
0.4186875, 1.73146, -0.5188693, 0, 0.1058824, 1, 1,
0.4197057, -0.7004694, 2.373405, 0, 0.09803922, 1, 1,
0.420392, -1.801706, 1.698013, 0, 0.09411765, 1, 1,
0.4228025, 0.03177378, 2.204788, 0, 0.08627451, 1, 1,
0.4242498, 1.969496, 0.9836563, 0, 0.08235294, 1, 1,
0.4288054, -0.2967517, 2.628454, 0, 0.07450981, 1, 1,
0.429196, -0.07633005, 1.515201, 0, 0.07058824, 1, 1,
0.429634, 1.063287, 0.7441146, 0, 0.0627451, 1, 1,
0.4301703, -0.5500689, 2.706866, 0, 0.05882353, 1, 1,
0.438041, -2.277758, 3.645376, 0, 0.05098039, 1, 1,
0.4396997, -0.4631292, 3.236209, 0, 0.04705882, 1, 1,
0.4406237, -1.096654, 2.87323, 0, 0.03921569, 1, 1,
0.4432121, 0.5629262, 0.1131612, 0, 0.03529412, 1, 1,
0.4437006, -0.56117, 2.250553, 0, 0.02745098, 1, 1,
0.4454914, 0.5307644, -0.6636288, 0, 0.02352941, 1, 1,
0.4485116, 0.1505164, -0.6673344, 0, 0.01568628, 1, 1,
0.4502891, -0.1921196, 2.052433, 0, 0.01176471, 1, 1,
0.4542688, -1.517075, 1.987876, 0, 0.003921569, 1, 1,
0.4660035, 0.9387466, 1.316745, 0.003921569, 0, 1, 1,
0.4712961, 0.2237731, 0.8716408, 0.007843138, 0, 1, 1,
0.4715987, 0.3056034, 1.708881, 0.01568628, 0, 1, 1,
0.4732552, 0.1758802, -0.01843054, 0.01960784, 0, 1, 1,
0.4754567, 1.038352, 0.3522925, 0.02745098, 0, 1, 1,
0.4762253, -1.73427, 3.57303, 0.03137255, 0, 1, 1,
0.4810191, 1.897254, -0.3727958, 0.03921569, 0, 1, 1,
0.4814863, 0.6318326, 0.7608798, 0.04313726, 0, 1, 1,
0.4876813, -1.259308, 2.771831, 0.05098039, 0, 1, 1,
0.490562, 0.9817284, -0.5577635, 0.05490196, 0, 1, 1,
0.4914662, 0.265286, 1.005785, 0.0627451, 0, 1, 1,
0.4982317, -1.814376, 2.23967, 0.06666667, 0, 1, 1,
0.4983959, -2.103911, 3.678502, 0.07450981, 0, 1, 1,
0.4989765, -0.2008089, 1.957683, 0.07843138, 0, 1, 1,
0.4990377, 0.3571174, -0.6085666, 0.08627451, 0, 1, 1,
0.4992534, -0.1973693, 0.5111777, 0.09019608, 0, 1, 1,
0.4994026, -0.8694347, 3.635377, 0.09803922, 0, 1, 1,
0.5043284, -0.3141642, 2.512809, 0.1058824, 0, 1, 1,
0.506126, 0.0857892, 1.04945, 0.1098039, 0, 1, 1,
0.507224, -1.028752, 4.601934, 0.1176471, 0, 1, 1,
0.508348, -0.6252662, 1.987117, 0.1215686, 0, 1, 1,
0.5109192, -1.843468, 3.777685, 0.1294118, 0, 1, 1,
0.5164, 1.483014, 1.110911, 0.1333333, 0, 1, 1,
0.5215266, 0.5923833, -0.3108351, 0.1411765, 0, 1, 1,
0.5321764, -0.100749, 1.957408, 0.145098, 0, 1, 1,
0.5322399, 0.2260424, 2.182511, 0.1529412, 0, 1, 1,
0.5322567, 0.3625389, 0.8234899, 0.1568628, 0, 1, 1,
0.5347329, 0.5559138, 2.219456, 0.1647059, 0, 1, 1,
0.5362517, -0.445064, 2.373873, 0.1686275, 0, 1, 1,
0.5362754, -0.9490818, 2.194007, 0.1764706, 0, 1, 1,
0.5395844, -0.7308573, 3.267516, 0.1803922, 0, 1, 1,
0.5458243, -0.4401852, 1.186924, 0.1882353, 0, 1, 1,
0.5496849, 1.844855, -0.2063406, 0.1921569, 0, 1, 1,
0.5509932, 0.9491488, -1.155008, 0.2, 0, 1, 1,
0.5514677, -1.818614, 1.7182, 0.2078431, 0, 1, 1,
0.5548771, 0.2086649, 1.905405, 0.2117647, 0, 1, 1,
0.5575821, -1.297558, 0.8157227, 0.2196078, 0, 1, 1,
0.5580991, -1.407466, 3.055086, 0.2235294, 0, 1, 1,
0.5661134, -0.2588238, 2.709288, 0.2313726, 0, 1, 1,
0.5714864, -1.565593, 2.352823, 0.2352941, 0, 1, 1,
0.5716608, -0.4242046, 4.267395, 0.2431373, 0, 1, 1,
0.5732071, -1.010116, 3.839373, 0.2470588, 0, 1, 1,
0.5843978, 1.226661, 2.683757, 0.254902, 0, 1, 1,
0.5887337, 1.536654, 0.8494138, 0.2588235, 0, 1, 1,
0.5890619, -0.7208572, 2.824301, 0.2666667, 0, 1, 1,
0.5907121, -1.154604, 1.637234, 0.2705882, 0, 1, 1,
0.5932834, 0.1990291, 1.613741, 0.2784314, 0, 1, 1,
0.5935053, 1.821605, -1.251834, 0.282353, 0, 1, 1,
0.5936851, -0.2629768, 1.43033, 0.2901961, 0, 1, 1,
0.5988947, -0.01181277, 0.4913343, 0.2941177, 0, 1, 1,
0.6060287, 0.018645, 0.3197206, 0.3019608, 0, 1, 1,
0.6133122, 0.5021404, 0.2262517, 0.3098039, 0, 1, 1,
0.6185341, 0.1459981, 0.1302187, 0.3137255, 0, 1, 1,
0.6225256, 0.1845883, 2.075576, 0.3215686, 0, 1, 1,
0.623561, -0.519851, 2.148041, 0.3254902, 0, 1, 1,
0.6266956, 1.159179, 2.605826, 0.3333333, 0, 1, 1,
0.6306188, -1.668239, 0.1053024, 0.3372549, 0, 1, 1,
0.6321146, -0.4866148, 0.7527131, 0.345098, 0, 1, 1,
0.6341857, 0.4087105, 1.057403, 0.3490196, 0, 1, 1,
0.6440759, 0.5964231, 2.682601, 0.3568628, 0, 1, 1,
0.6485576, -0.4492075, 3.900558, 0.3607843, 0, 1, 1,
0.6568495, 0.135334, -0.9993927, 0.3686275, 0, 1, 1,
0.6586355, -0.685523, 2.654721, 0.372549, 0, 1, 1,
0.6601153, 1.853937, 1.251763, 0.3803922, 0, 1, 1,
0.6629111, 1.075501, 0.3590233, 0.3843137, 0, 1, 1,
0.6637927, 1.180785, -0.3927204, 0.3921569, 0, 1, 1,
0.6661708, 0.8692555, -0.001952902, 0.3960784, 0, 1, 1,
0.6681544, 1.094739, 0.9814703, 0.4039216, 0, 1, 1,
0.668407, -0.4977438, 1.626506, 0.4117647, 0, 1, 1,
0.6700078, 0.2529438, 1.547455, 0.4156863, 0, 1, 1,
0.6725282, -0.7825289, 2.969547, 0.4235294, 0, 1, 1,
0.6739855, -0.1835885, 2.323288, 0.427451, 0, 1, 1,
0.6744028, 0.5245717, 2.097543, 0.4352941, 0, 1, 1,
0.6765408, -1.009974, 1.596211, 0.4392157, 0, 1, 1,
0.6782283, -1.249624, 2.242155, 0.4470588, 0, 1, 1,
0.6845817, -1.125912, 2.947816, 0.4509804, 0, 1, 1,
0.6887999, 0.2840121, 0.7028745, 0.4588235, 0, 1, 1,
0.6953899, -0.2881249, 2.266521, 0.4627451, 0, 1, 1,
0.695727, -0.3962154, -1.532904, 0.4705882, 0, 1, 1,
0.6976715, -0.4065053, 2.497842, 0.4745098, 0, 1, 1,
0.6987654, 0.7253838, 1.890102, 0.4823529, 0, 1, 1,
0.7058238, -1.67135, 3.065807, 0.4862745, 0, 1, 1,
0.7108441, -0.4753213, 2.457529, 0.4941176, 0, 1, 1,
0.7128175, -0.2033142, 1.214202, 0.5019608, 0, 1, 1,
0.7152756, 0.7009197, 2.802233, 0.5058824, 0, 1, 1,
0.7165221, -0.7706782, 0.8440585, 0.5137255, 0, 1, 1,
0.7206706, 1.093194, -1.093249, 0.5176471, 0, 1, 1,
0.7219097, 0.1741795, 1.991836, 0.5254902, 0, 1, 1,
0.7310697, -0.3201872, 3.820511, 0.5294118, 0, 1, 1,
0.7311763, 0.4042509, 1.410199, 0.5372549, 0, 1, 1,
0.7321426, -0.2611932, 0.588204, 0.5411765, 0, 1, 1,
0.7339498, -0.5050852, 1.227833, 0.5490196, 0, 1, 1,
0.7361283, 1.586607, 1.207878, 0.5529412, 0, 1, 1,
0.7446807, 0.08889104, 1.815524, 0.5607843, 0, 1, 1,
0.7447997, -1.371542, 2.923298, 0.5647059, 0, 1, 1,
0.7477243, -1.209747, 2.39056, 0.572549, 0, 1, 1,
0.747898, 2.213605, -0.1271116, 0.5764706, 0, 1, 1,
0.7536283, 1.184338, 0.03396274, 0.5843138, 0, 1, 1,
0.7545267, 0.4603825, 0.6796182, 0.5882353, 0, 1, 1,
0.7568941, -1.341844, 4.541778, 0.5960785, 0, 1, 1,
0.7599424, -0.7463112, 2.042244, 0.6039216, 0, 1, 1,
0.7610045, 0.09471685, 2.456503, 0.6078432, 0, 1, 1,
0.7634892, -0.564671, 1.648928, 0.6156863, 0, 1, 1,
0.7646554, -0.2668329, 2.186281, 0.6196079, 0, 1, 1,
0.7677707, 0.09170493, 2.035653, 0.627451, 0, 1, 1,
0.7703395, -0.5447309, 1.902097, 0.6313726, 0, 1, 1,
0.7741813, -0.04041962, 2.322707, 0.6392157, 0, 1, 1,
0.7744103, -0.2515346, 2.014215, 0.6431373, 0, 1, 1,
0.7826784, -0.7793481, 2.682583, 0.6509804, 0, 1, 1,
0.7831859, -1.750223, 3.744104, 0.654902, 0, 1, 1,
0.7863496, -0.9968171, 2.909171, 0.6627451, 0, 1, 1,
0.7877229, 0.1656141, 1.228039, 0.6666667, 0, 1, 1,
0.789637, 0.06439181, 2.776289, 0.6745098, 0, 1, 1,
0.7928078, -1.085621, 3.968796, 0.6784314, 0, 1, 1,
0.8000575, 0.2655039, 0.8884714, 0.6862745, 0, 1, 1,
0.8030669, -0.5261598, 3.868375, 0.6901961, 0, 1, 1,
0.803193, -1.714039, 2.312297, 0.6980392, 0, 1, 1,
0.8083875, 0.2441741, 2.124397, 0.7058824, 0, 1, 1,
0.8250327, 0.08978228, 1.472774, 0.7098039, 0, 1, 1,
0.8307933, -0.07446192, 1.102415, 0.7176471, 0, 1, 1,
0.8353159, 0.09960277, 2.1258, 0.7215686, 0, 1, 1,
0.8411543, 1.426973, 0.6924767, 0.7294118, 0, 1, 1,
0.8455102, -1.254859, 2.978933, 0.7333333, 0, 1, 1,
0.8483683, 1.062545, 0.4475474, 0.7411765, 0, 1, 1,
0.8517076, 0.3224883, 1.626228, 0.7450981, 0, 1, 1,
0.8565992, -0.05747617, -0.1256516, 0.7529412, 0, 1, 1,
0.859664, -0.3448799, 2.493372, 0.7568628, 0, 1, 1,
0.8620045, 0.4821636, -0.7690955, 0.7647059, 0, 1, 1,
0.862978, -0.756152, 2.831741, 0.7686275, 0, 1, 1,
0.8685699, 1.607919, 2.054979, 0.7764706, 0, 1, 1,
0.8705382, 1.50175, -1.389349, 0.7803922, 0, 1, 1,
0.8707108, -0.3665417, 1.020483, 0.7882353, 0, 1, 1,
0.8718555, 0.06343815, -0.1594247, 0.7921569, 0, 1, 1,
0.8769821, 0.9886388, 1.404861, 0.8, 0, 1, 1,
0.8795154, 0.04554776, 2.117426, 0.8078431, 0, 1, 1,
0.8842646, 0.5326365, 1.516938, 0.8117647, 0, 1, 1,
0.8869023, 0.1746828, 1.507648, 0.8196079, 0, 1, 1,
0.8871648, 1.894624, 0.5470846, 0.8235294, 0, 1, 1,
0.8941209, 0.7892507, 0.3523446, 0.8313726, 0, 1, 1,
0.8942629, -0.08066799, 1.700813, 0.8352941, 0, 1, 1,
0.9009155, -1.836839, 2.501746, 0.8431373, 0, 1, 1,
0.9016567, -0.2057294, 0.9373577, 0.8470588, 0, 1, 1,
0.9056433, -0.08749935, 1.147401, 0.854902, 0, 1, 1,
0.9085981, 1.692062, -0.7806404, 0.8588235, 0, 1, 1,
0.9125256, 0.2620542, 0.558929, 0.8666667, 0, 1, 1,
0.9232255, 2.304858, 0.5905995, 0.8705882, 0, 1, 1,
0.9370798, 0.5823507, 0.05225734, 0.8784314, 0, 1, 1,
0.9380075, -0.4297825, 1.609362, 0.8823529, 0, 1, 1,
0.9380715, -0.1938826, -1.222106, 0.8901961, 0, 1, 1,
0.9420142, -2.903632, 2.690163, 0.8941177, 0, 1, 1,
0.9442072, -0.8143027, 3.457174, 0.9019608, 0, 1, 1,
0.9503477, 0.9775852, -0.4459895, 0.9098039, 0, 1, 1,
0.9519277, -0.2102239, 3.514515, 0.9137255, 0, 1, 1,
0.9675024, -1.016815, 2.317245, 0.9215686, 0, 1, 1,
0.9679933, 1.180583, 1.884415, 0.9254902, 0, 1, 1,
0.9694383, 0.2360801, 0.9843577, 0.9333333, 0, 1, 1,
0.9788907, 0.6535848, 1.040746, 0.9372549, 0, 1, 1,
0.9790587, 0.9563244, 1.021496, 0.945098, 0, 1, 1,
0.9827272, -0.6583095, 1.782747, 0.9490196, 0, 1, 1,
0.9831029, -0.6490858, 2.590267, 0.9568627, 0, 1, 1,
0.9897074, 1.306705, -0.3908398, 0.9607843, 0, 1, 1,
0.9922968, -0.4340283, 1.034617, 0.9686275, 0, 1, 1,
0.9980717, 0.4310761, 0.1620931, 0.972549, 0, 1, 1,
0.9989322, -0.3217284, 1.470485, 0.9803922, 0, 1, 1,
1.019727, -0.522147, 2.332842, 0.9843137, 0, 1, 1,
1.024708, -0.8991117, 1.453635, 0.9921569, 0, 1, 1,
1.028957, -1.248616, 2.618815, 0.9960784, 0, 1, 1,
1.033846, 1.536483, 1.081114, 1, 0, 0.9960784, 1,
1.034729, -1.578738, 3.987383, 1, 0, 0.9882353, 1,
1.036665, -1.403324, 1.011567, 1, 0, 0.9843137, 1,
1.037281, -0.3751514, 2.978567, 1, 0, 0.9764706, 1,
1.042306, -0.4020771, 2.251679, 1, 0, 0.972549, 1,
1.050977, -1.096295, 2.720981, 1, 0, 0.9647059, 1,
1.052909, -1.279179, 2.197702, 1, 0, 0.9607843, 1,
1.06031, -0.4142355, 3.19733, 1, 0, 0.9529412, 1,
1.062976, -0.03873564, 0.3341869, 1, 0, 0.9490196, 1,
1.064056, -0.4315665, 2.219321, 1, 0, 0.9411765, 1,
1.066891, 1.031083, 1.023619, 1, 0, 0.9372549, 1,
1.078464, 1.357408, -0.7620789, 1, 0, 0.9294118, 1,
1.080619, -0.2879481, 1.836039, 1, 0, 0.9254902, 1,
1.085562, 1.382337, -1.446936, 1, 0, 0.9176471, 1,
1.090488, -2.312933, 1.836274, 1, 0, 0.9137255, 1,
1.120575, -0.2061316, 3.71835, 1, 0, 0.9058824, 1,
1.134083, 0.2226361, 1.977585, 1, 0, 0.9019608, 1,
1.134087, 0.8994622, 1.519044, 1, 0, 0.8941177, 1,
1.134668, 0.3000338, 1.891599, 1, 0, 0.8862745, 1,
1.143132, -0.922989, 2.750561, 1, 0, 0.8823529, 1,
1.143637, 0.627484, -0.04620865, 1, 0, 0.8745098, 1,
1.147662, -1.180744, 4.401483, 1, 0, 0.8705882, 1,
1.14824, -1.359769, -0.02884127, 1, 0, 0.8627451, 1,
1.148681, 0.003929714, 0.5040355, 1, 0, 0.8588235, 1,
1.150638, 0.9990758, -0.07139966, 1, 0, 0.8509804, 1,
1.156399, 0.5013626, -0.98432, 1, 0, 0.8470588, 1,
1.160384, 1.3162, 1.120413, 1, 0, 0.8392157, 1,
1.164953, 0.2160114, 1.644338, 1, 0, 0.8352941, 1,
1.173245, 1.272703, 0.6981117, 1, 0, 0.827451, 1,
1.179584, 0.2982309, 3.349493, 1, 0, 0.8235294, 1,
1.189098, -0.03165165, 1.266641, 1, 0, 0.8156863, 1,
1.191105, -0.8677039, 1.175605, 1, 0, 0.8117647, 1,
1.200527, -0.2085999, 2.472547, 1, 0, 0.8039216, 1,
1.204227, 0.5378913, -0.738667, 1, 0, 0.7960784, 1,
1.206502, 0.7761061, 1.244112, 1, 0, 0.7921569, 1,
1.213825, 0.1783746, 1.244509, 1, 0, 0.7843137, 1,
1.215979, -0.8087403, 2.663767, 1, 0, 0.7803922, 1,
1.217094, 0.8288841, -0.7486829, 1, 0, 0.772549, 1,
1.218206, -1.518249, 1.688712, 1, 0, 0.7686275, 1,
1.218621, 0.2981902, 1.392797, 1, 0, 0.7607843, 1,
1.228901, -0.4035119, 2.103235, 1, 0, 0.7568628, 1,
1.248395, 1.139184, -0.456263, 1, 0, 0.7490196, 1,
1.251886, -0.04673237, 2.456458, 1, 0, 0.7450981, 1,
1.252631, -0.5037501, 1.573735, 1, 0, 0.7372549, 1,
1.254285, 1.231318, 1.620327, 1, 0, 0.7333333, 1,
1.254492, -0.8214788, 0.7639972, 1, 0, 0.7254902, 1,
1.254746, 0.03763027, 2.087913, 1, 0, 0.7215686, 1,
1.25915, -0.09797946, 2.196257, 1, 0, 0.7137255, 1,
1.262762, 1.136359, 1.327939, 1, 0, 0.7098039, 1,
1.264057, -0.4596436, 2.061107, 1, 0, 0.7019608, 1,
1.264427, -1.32955, 2.319347, 1, 0, 0.6941177, 1,
1.265604, -1.508611, 1.542884, 1, 0, 0.6901961, 1,
1.265987, -0.1566772, 2.299512, 1, 0, 0.682353, 1,
1.270023, 0.420929, 0.6342546, 1, 0, 0.6784314, 1,
1.282363, -0.5764472, 2.704399, 1, 0, 0.6705883, 1,
1.283323, -0.2896677, 1.002056, 1, 0, 0.6666667, 1,
1.293618, -1.654013, 2.131111, 1, 0, 0.6588235, 1,
1.297516, 1.706324, -0.1288003, 1, 0, 0.654902, 1,
1.303463, 0.7107063, 1.35972, 1, 0, 0.6470588, 1,
1.30645, -0.7366884, 0.312735, 1, 0, 0.6431373, 1,
1.310445, 0.6567291, -1.491659, 1, 0, 0.6352941, 1,
1.315404, 0.3615752, 1.259774, 1, 0, 0.6313726, 1,
1.323435, -0.02467044, 3.215514, 1, 0, 0.6235294, 1,
1.325632, -0.2667978, 3.025609, 1, 0, 0.6196079, 1,
1.332476, 0.9870883, 1.046738, 1, 0, 0.6117647, 1,
1.333503, 0.7750054, 1.611576, 1, 0, 0.6078432, 1,
1.350189, -0.2406756, 2.00244, 1, 0, 0.6, 1,
1.353294, -1.215262, 3.426498, 1, 0, 0.5921569, 1,
1.365578, -1.449649, 1.510888, 1, 0, 0.5882353, 1,
1.368678, 0.8420656, 2.310721, 1, 0, 0.5803922, 1,
1.36983, 0.1789975, 0.6085374, 1, 0, 0.5764706, 1,
1.375724, -0.6635087, 1.433871, 1, 0, 0.5686275, 1,
1.382822, -0.2692928, 1.449691, 1, 0, 0.5647059, 1,
1.387231, -1.465036, 1.337409, 1, 0, 0.5568628, 1,
1.395384, -0.009311346, 0.5229515, 1, 0, 0.5529412, 1,
1.399131, -0.6313582, 2.064123, 1, 0, 0.5450981, 1,
1.410802, 1.479207, -0.9264673, 1, 0, 0.5411765, 1,
1.415604, -0.455132, 2.209713, 1, 0, 0.5333334, 1,
1.42487, -0.4854656, 3.413489, 1, 0, 0.5294118, 1,
1.445109, -1.679992, 2.352461, 1, 0, 0.5215687, 1,
1.445268, -1.189785, 2.262545, 1, 0, 0.5176471, 1,
1.449327, -1.073999, 2.568637, 1, 0, 0.509804, 1,
1.449916, -0.418862, 2.81574, 1, 0, 0.5058824, 1,
1.454575, 1.763346, 0.3006212, 1, 0, 0.4980392, 1,
1.462231, 1.586184, 2.032923, 1, 0, 0.4901961, 1,
1.465726, 0.2553214, 2.089266, 1, 0, 0.4862745, 1,
1.478091, 0.3229055, -1.316298, 1, 0, 0.4784314, 1,
1.499374, -0.7469522, 2.370424, 1, 0, 0.4745098, 1,
1.505337, 0.2729566, 1.577732, 1, 0, 0.4666667, 1,
1.510428, -0.02196707, 1.572569, 1, 0, 0.4627451, 1,
1.543502, -0.234001, 2.676605, 1, 0, 0.454902, 1,
1.550279, 1.541132, 0.2381583, 1, 0, 0.4509804, 1,
1.573313, 0.1246873, 1.43349, 1, 0, 0.4431373, 1,
1.573974, -1.397363, 2.82359, 1, 0, 0.4392157, 1,
1.576375, -1.295952, 1.87086, 1, 0, 0.4313726, 1,
1.583915, 0.3085063, 2.035094, 1, 0, 0.427451, 1,
1.588323, 1.243356, 0.1399573, 1, 0, 0.4196078, 1,
1.617207, 0.233308, 0.7842783, 1, 0, 0.4156863, 1,
1.630433, 0.3360237, 0.7144055, 1, 0, 0.4078431, 1,
1.632608, -0.211435, 3.387947, 1, 0, 0.4039216, 1,
1.632648, -1.898495, 2.694059, 1, 0, 0.3960784, 1,
1.639808, -0.2218851, 0.4333249, 1, 0, 0.3882353, 1,
1.6474, -1.445933, 3.323468, 1, 0, 0.3843137, 1,
1.651477, -0.2695019, 1.24839, 1, 0, 0.3764706, 1,
1.657385, 0.7399632, 1.813308, 1, 0, 0.372549, 1,
1.68232, -0.1845915, 2.108554, 1, 0, 0.3647059, 1,
1.687471, -0.1303584, 1.596709, 1, 0, 0.3607843, 1,
1.688494, -2.345305, 4.688901, 1, 0, 0.3529412, 1,
1.70574, -0.4832196, 3.165168, 1, 0, 0.3490196, 1,
1.707023, -0.2563058, 1.060345, 1, 0, 0.3411765, 1,
1.710832, 1.173151, 1.402215, 1, 0, 0.3372549, 1,
1.731846, -0.3560574, 3.815383, 1, 0, 0.3294118, 1,
1.735107, 0.9234857, 1.868877, 1, 0, 0.3254902, 1,
1.739465, 1.762677, 0.2405154, 1, 0, 0.3176471, 1,
1.747664, -0.2099267, 2.187054, 1, 0, 0.3137255, 1,
1.759723, -1.20212, 2.498247, 1, 0, 0.3058824, 1,
1.762342, 0.6574229, 2.279316, 1, 0, 0.2980392, 1,
1.770417, 0.3329196, 0.8026408, 1, 0, 0.2941177, 1,
1.78248, -0.1399408, 2.677968, 1, 0, 0.2862745, 1,
1.785716, -0.8888096, 1.612584, 1, 0, 0.282353, 1,
1.787818, -0.4018904, 2.239006, 1, 0, 0.2745098, 1,
1.797364, -0.268219, 3.11515, 1, 0, 0.2705882, 1,
1.804825, -0.6694347, 0.7546329, 1, 0, 0.2627451, 1,
1.804942, -0.4418708, 4.131181, 1, 0, 0.2588235, 1,
1.815731, 0.7754344, 0.7837061, 1, 0, 0.2509804, 1,
1.819296, 1.174515, 1.328265, 1, 0, 0.2470588, 1,
1.830284, -0.72425, 1.15712, 1, 0, 0.2392157, 1,
1.839135, 0.3376687, 0.5856827, 1, 0, 0.2352941, 1,
1.867828, 0.4122272, 1.684292, 1, 0, 0.227451, 1,
1.8688, 2.001615, -0.1140881, 1, 0, 0.2235294, 1,
1.889994, 0.6434249, 0.7775421, 1, 0, 0.2156863, 1,
1.892353, 0.7928331, 1.510176, 1, 0, 0.2117647, 1,
1.90634, -1.118422, 0.7790684, 1, 0, 0.2039216, 1,
1.937616, -1.596398, 2.576324, 1, 0, 0.1960784, 1,
1.974499, -0.7837141, 2.583018, 1, 0, 0.1921569, 1,
2.003549, 1.393172, 2.327276, 1, 0, 0.1843137, 1,
2.018137, 1.11087, 1.001764, 1, 0, 0.1803922, 1,
2.034524, 0.4294665, 1.626088, 1, 0, 0.172549, 1,
2.046717, 1.460759, 1.646214, 1, 0, 0.1686275, 1,
2.063717, 0.4189821, 1.262112, 1, 0, 0.1607843, 1,
2.070963, 0.9209346, -0.08793429, 1, 0, 0.1568628, 1,
2.130928, 0.7966457, 2.140927, 1, 0, 0.1490196, 1,
2.141006, 0.6438235, 1.488332, 1, 0, 0.145098, 1,
2.15687, 0.6220196, 1.496292, 1, 0, 0.1372549, 1,
2.18632, 0.7618497, 1.384093, 1, 0, 0.1333333, 1,
2.205705, -0.4351146, 1.042632, 1, 0, 0.1254902, 1,
2.248257, -0.3067077, 1.186755, 1, 0, 0.1215686, 1,
2.309843, -0.2989087, 0.1663943, 1, 0, 0.1137255, 1,
2.37198, 0.5076486, -0.1654287, 1, 0, 0.1098039, 1,
2.393322, -0.7908015, 1.380684, 1, 0, 0.1019608, 1,
2.425174, -0.7683033, 2.357043, 1, 0, 0.09411765, 1,
2.46103, -1.586699, 2.769491, 1, 0, 0.09019608, 1,
2.462133, -0.675477, -0.05603021, 1, 0, 0.08235294, 1,
2.48919, -0.4165374, 2.669441, 1, 0, 0.07843138, 1,
2.510967, 0.06500749, 2.289922, 1, 0, 0.07058824, 1,
2.513059, -0.8212731, 3.144947, 1, 0, 0.06666667, 1,
2.609551, 1.247651, 0.3866272, 1, 0, 0.05882353, 1,
2.61389, 2.074403, 0.4798799, 1, 0, 0.05490196, 1,
2.641605, -2.695799, 1.677681, 1, 0, 0.04705882, 1,
2.705263, 1.211123, -1.388689, 1, 0, 0.04313726, 1,
2.794588, 0.418071, 1.856163, 1, 0, 0.03529412, 1,
2.81534, -0.609504, 2.776113, 1, 0, 0.03137255, 1,
2.824111, 1.670821, 1.538974, 1, 0, 0.02352941, 1,
2.897864, 1.684303, -0.5556767, 1, 0, 0.01960784, 1,
2.984843, -0.003209441, 1.456534, 1, 0, 0.01176471, 1,
3.560901, 0.4233795, 1.269077, 1, 0, 0.007843138, 1
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
-0.04835963, -4.863832, -8.020329, 0, -0.5, 0.5, 0.5,
-0.04835963, -4.863832, -8.020329, 1, -0.5, 0.5, 0.5,
-0.04835963, -4.863832, -8.020329, 1, 1.5, 0.5, 0.5,
-0.04835963, -4.863832, -8.020329, 0, 1.5, 0.5, 0.5
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
-4.88116, -0.2820153, -8.020329, 0, -0.5, 0.5, 0.5,
-4.88116, -0.2820153, -8.020329, 1, -0.5, 0.5, 0.5,
-4.88116, -0.2820153, -8.020329, 1, 1.5, 0.5, 0.5,
-4.88116, -0.2820153, -8.020329, 0, 1.5, 0.5, 0.5
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
-4.88116, -4.863832, -0.4194746, 0, -0.5, 0.5, 0.5,
-4.88116, -4.863832, -0.4194746, 1, -0.5, 0.5, 0.5,
-4.88116, -4.863832, -0.4194746, 1, 1.5, 0.5, 0.5,
-4.88116, -4.863832, -0.4194746, 0, 1.5, 0.5, 0.5
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
-2, -3.80649, -6.266286,
2, -3.80649, -6.266286,
-2, -3.80649, -6.266286,
-2, -3.982713, -6.558627,
0, -3.80649, -6.266286,
0, -3.982713, -6.558627,
2, -3.80649, -6.266286,
2, -3.982713, -6.558627
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
"0",
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
-2, -4.335161, -7.143308, 0, -0.5, 0.5, 0.5,
-2, -4.335161, -7.143308, 1, -0.5, 0.5, 0.5,
-2, -4.335161, -7.143308, 1, 1.5, 0.5, 0.5,
-2, -4.335161, -7.143308, 0, 1.5, 0.5, 0.5,
0, -4.335161, -7.143308, 0, -0.5, 0.5, 0.5,
0, -4.335161, -7.143308, 1, -0.5, 0.5, 0.5,
0, -4.335161, -7.143308, 1, 1.5, 0.5, 0.5,
0, -4.335161, -7.143308, 0, 1.5, 0.5, 0.5,
2, -4.335161, -7.143308, 0, -0.5, 0.5, 0.5,
2, -4.335161, -7.143308, 1, -0.5, 0.5, 0.5,
2, -4.335161, -7.143308, 1, 1.5, 0.5, 0.5,
2, -4.335161, -7.143308, 0, 1.5, 0.5, 0.5
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
-3.765898, -3, -6.266286,
-3.765898, 3, -6.266286,
-3.765898, -3, -6.266286,
-3.951776, -3, -6.558627,
-3.765898, -2, -6.266286,
-3.951776, -2, -6.558627,
-3.765898, -1, -6.266286,
-3.951776, -1, -6.558627,
-3.765898, 0, -6.266286,
-3.951776, 0, -6.558627,
-3.765898, 1, -6.266286,
-3.951776, 1, -6.558627,
-3.765898, 2, -6.266286,
-3.951776, 2, -6.558627,
-3.765898, 3, -6.266286,
-3.951776, 3, -6.558627
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
-4.323529, -3, -7.143308, 0, -0.5, 0.5, 0.5,
-4.323529, -3, -7.143308, 1, -0.5, 0.5, 0.5,
-4.323529, -3, -7.143308, 1, 1.5, 0.5, 0.5,
-4.323529, -3, -7.143308, 0, 1.5, 0.5, 0.5,
-4.323529, -2, -7.143308, 0, -0.5, 0.5, 0.5,
-4.323529, -2, -7.143308, 1, -0.5, 0.5, 0.5,
-4.323529, -2, -7.143308, 1, 1.5, 0.5, 0.5,
-4.323529, -2, -7.143308, 0, 1.5, 0.5, 0.5,
-4.323529, -1, -7.143308, 0, -0.5, 0.5, 0.5,
-4.323529, -1, -7.143308, 1, -0.5, 0.5, 0.5,
-4.323529, -1, -7.143308, 1, 1.5, 0.5, 0.5,
-4.323529, -1, -7.143308, 0, 1.5, 0.5, 0.5,
-4.323529, 0, -7.143308, 0, -0.5, 0.5, 0.5,
-4.323529, 0, -7.143308, 1, -0.5, 0.5, 0.5,
-4.323529, 0, -7.143308, 1, 1.5, 0.5, 0.5,
-4.323529, 0, -7.143308, 0, 1.5, 0.5, 0.5,
-4.323529, 1, -7.143308, 0, -0.5, 0.5, 0.5,
-4.323529, 1, -7.143308, 1, -0.5, 0.5, 0.5,
-4.323529, 1, -7.143308, 1, 1.5, 0.5, 0.5,
-4.323529, 1, -7.143308, 0, 1.5, 0.5, 0.5,
-4.323529, 2, -7.143308, 0, -0.5, 0.5, 0.5,
-4.323529, 2, -7.143308, 1, -0.5, 0.5, 0.5,
-4.323529, 2, -7.143308, 1, 1.5, 0.5, 0.5,
-4.323529, 2, -7.143308, 0, 1.5, 0.5, 0.5,
-4.323529, 3, -7.143308, 0, -0.5, 0.5, 0.5,
-4.323529, 3, -7.143308, 1, -0.5, 0.5, 0.5,
-4.323529, 3, -7.143308, 1, 1.5, 0.5, 0.5,
-4.323529, 3, -7.143308, 0, 1.5, 0.5, 0.5
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
-3.765898, -3.80649, -6,
-3.765898, -3.80649, 4,
-3.765898, -3.80649, -6,
-3.951776, -3.982713, -6,
-3.765898, -3.80649, -4,
-3.951776, -3.982713, -4,
-3.765898, -3.80649, -2,
-3.951776, -3.982713, -2,
-3.765898, -3.80649, 0,
-3.951776, -3.982713, 0,
-3.765898, -3.80649, 2,
-3.951776, -3.982713, 2,
-3.765898, -3.80649, 4,
-3.951776, -3.982713, 4
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
-4.323529, -4.335161, -6, 0, -0.5, 0.5, 0.5,
-4.323529, -4.335161, -6, 1, -0.5, 0.5, 0.5,
-4.323529, -4.335161, -6, 1, 1.5, 0.5, 0.5,
-4.323529, -4.335161, -6, 0, 1.5, 0.5, 0.5,
-4.323529, -4.335161, -4, 0, -0.5, 0.5, 0.5,
-4.323529, -4.335161, -4, 1, -0.5, 0.5, 0.5,
-4.323529, -4.335161, -4, 1, 1.5, 0.5, 0.5,
-4.323529, -4.335161, -4, 0, 1.5, 0.5, 0.5,
-4.323529, -4.335161, -2, 0, -0.5, 0.5, 0.5,
-4.323529, -4.335161, -2, 1, -0.5, 0.5, 0.5,
-4.323529, -4.335161, -2, 1, 1.5, 0.5, 0.5,
-4.323529, -4.335161, -2, 0, 1.5, 0.5, 0.5,
-4.323529, -4.335161, 0, 0, -0.5, 0.5, 0.5,
-4.323529, -4.335161, 0, 1, -0.5, 0.5, 0.5,
-4.323529, -4.335161, 0, 1, 1.5, 0.5, 0.5,
-4.323529, -4.335161, 0, 0, 1.5, 0.5, 0.5,
-4.323529, -4.335161, 2, 0, -0.5, 0.5, 0.5,
-4.323529, -4.335161, 2, 1, -0.5, 0.5, 0.5,
-4.323529, -4.335161, 2, 1, 1.5, 0.5, 0.5,
-4.323529, -4.335161, 2, 0, 1.5, 0.5, 0.5,
-4.323529, -4.335161, 4, 0, -0.5, 0.5, 0.5,
-4.323529, -4.335161, 4, 1, -0.5, 0.5, 0.5,
-4.323529, -4.335161, 4, 1, 1.5, 0.5, 0.5,
-4.323529, -4.335161, 4, 0, 1.5, 0.5, 0.5
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
-3.765898, -3.80649, -6.266286,
-3.765898, 3.242459, -6.266286,
-3.765898, -3.80649, 5.427337,
-3.765898, 3.242459, 5.427337,
-3.765898, -3.80649, -6.266286,
-3.765898, -3.80649, 5.427337,
-3.765898, 3.242459, -6.266286,
-3.765898, 3.242459, 5.427337,
-3.765898, -3.80649, -6.266286,
3.669179, -3.80649, -6.266286,
-3.765898, -3.80649, 5.427337,
3.669179, -3.80649, 5.427337,
-3.765898, 3.242459, -6.266286,
3.669179, 3.242459, -6.266286,
-3.765898, 3.242459, 5.427337,
3.669179, 3.242459, 5.427337,
3.669179, -3.80649, -6.266286,
3.669179, 3.242459, -6.266286,
3.669179, -3.80649, 5.427337,
3.669179, 3.242459, 5.427337,
3.669179, -3.80649, -6.266286,
3.669179, -3.80649, 5.427337,
3.669179, 3.242459, -6.266286,
3.669179, 3.242459, 5.427337
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
var radius = 8.30179;
var distance = 36.9356;
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
mvMatrix.translate( 0.04835963, 0.2820153, 0.4194746 );
mvMatrix.scale( 1.207258, 1.27339, 0.7676029 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.9356);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Distannoxane<-read.table("Distannoxane.xyz")
```

```
## Error in read.table("Distannoxane.xyz"): no lines available in input
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
-3.657621, 0.3001195, -2.0502, 0, 0, 1, 1, 1,
-3.090111, 1.129416, -0.2463942, 1, 0, 0, 1, 1,
-2.818068, -0.5001703, -1.83561, 1, 0, 0, 1, 1,
-2.695191, -0.03276397, -0.01073281, 1, 0, 0, 1, 1,
-2.570073, 3.139805, -1.236667, 1, 0, 0, 1, 1,
-2.554619, -0.6833046, -1.842054, 1, 0, 0, 1, 1,
-2.530111, 1.933069, -1.624109, 0, 0, 0, 1, 1,
-2.522207, -2.130702, -3.124344, 0, 0, 0, 1, 1,
-2.499087, -1.541876, -2.157536, 0, 0, 0, 1, 1,
-2.480525, 1.318732, -1.154351, 0, 0, 0, 1, 1,
-2.291815, 0.1918057, -1.250246, 0, 0, 0, 1, 1,
-2.287579, -1.167774, -2.168305, 0, 0, 0, 1, 1,
-2.284468, 0.03104212, -1.715907, 0, 0, 0, 1, 1,
-2.231199, 1.135281, -1.378454, 1, 1, 1, 1, 1,
-2.205358, 0.1171892, 0.009697379, 1, 1, 1, 1, 1,
-2.174093, -0.4396426, -0.3782448, 1, 1, 1, 1, 1,
-2.101621, -1.128354, -1.279543, 1, 1, 1, 1, 1,
-2.085759, -0.8397791, -0.5692241, 1, 1, 1, 1, 1,
-2.074706, -0.05187714, -0.2012307, 1, 1, 1, 1, 1,
-2.073863, -1.991979, -2.08485, 1, 1, 1, 1, 1,
-2.047504, -0.1994453, -2.763873, 1, 1, 1, 1, 1,
-2.044026, 0.776019, -0.2054415, 1, 1, 1, 1, 1,
-2.022072, -0.01636641, -2.377838, 1, 1, 1, 1, 1,
-1.971179, 1.198256, -2.31813, 1, 1, 1, 1, 1,
-1.969835, -0.1347697, -0.6529801, 1, 1, 1, 1, 1,
-1.96019, -0.7070674, -2.551545, 1, 1, 1, 1, 1,
-1.940924, 0.6750836, -2.117426, 1, 1, 1, 1, 1,
-1.937004, 0.3520539, -0.4023157, 1, 1, 1, 1, 1,
-1.928801, -2.071595, -2.657887, 0, 0, 1, 1, 1,
-1.892688, 0.2459096, -1.535018, 1, 0, 0, 1, 1,
-1.891029, -1.978339, -1.898821, 1, 0, 0, 1, 1,
-1.85576, -0.2907214, -2.005272, 1, 0, 0, 1, 1,
-1.827605, 2.251051, -1.981558, 1, 0, 0, 1, 1,
-1.817997, 0.9244171, -2.17889, 1, 0, 0, 1, 1,
-1.799988, 0.2048295, -1.981012, 0, 0, 0, 1, 1,
-1.79931, -1.466444, -0.4764594, 0, 0, 0, 1, 1,
-1.740794, -1.396574, -2.326616, 0, 0, 0, 1, 1,
-1.733714, 0.6122425, 1.625453, 0, 0, 0, 1, 1,
-1.71354, -1.085592, -2.099663, 0, 0, 0, 1, 1,
-1.706978, -0.7520198, -3.249638, 0, 0, 0, 1, 1,
-1.691814, 1.107615, -1.041492, 0, 0, 0, 1, 1,
-1.667811, -1.207869, -3.874561, 1, 1, 1, 1, 1,
-1.667719, -0.311576, 0.05237204, 1, 1, 1, 1, 1,
-1.651796, 1.463175, 0.623235, 1, 1, 1, 1, 1,
-1.645674, 0.4336273, -1.893915, 1, 1, 1, 1, 1,
-1.645217, -0.3856168, -2.190039, 1, 1, 1, 1, 1,
-1.642603, 1.885756, -1.311971, 1, 1, 1, 1, 1,
-1.602222, -0.5057063, -2.419591, 1, 1, 1, 1, 1,
-1.599135, 0.06218765, -2.196555, 1, 1, 1, 1, 1,
-1.593814, -0.6628894, -3.322416, 1, 1, 1, 1, 1,
-1.583496, 1.011516, -2.132663, 1, 1, 1, 1, 1,
-1.583254, 1.080342, -0.5231943, 1, 1, 1, 1, 1,
-1.571838, -2.585075, -4.599404, 1, 1, 1, 1, 1,
-1.562269, 1.503657, -0.7659233, 1, 1, 1, 1, 1,
-1.548163, -0.4053578, -1.730549, 1, 1, 1, 1, 1,
-1.547472, 0.2470076, -2.935669, 1, 1, 1, 1, 1,
-1.526319, 0.4673899, -1.310584, 0, 0, 1, 1, 1,
-1.518112, -0.1952399, -2.494868, 1, 0, 0, 1, 1,
-1.50869, -0.6085877, -2.499786, 1, 0, 0, 1, 1,
-1.504621, -0.6213641, -0.3894467, 1, 0, 0, 1, 1,
-1.502636, -1.969099, -2.008696, 1, 0, 0, 1, 1,
-1.483938, -0.9016799, -2.920643, 1, 0, 0, 1, 1,
-1.481278, -0.3123004, -1.75584, 0, 0, 0, 1, 1,
-1.470773, -0.4220248, -1.892007, 0, 0, 0, 1, 1,
-1.459345, 1.039215, -2.21523, 0, 0, 0, 1, 1,
-1.45775, 1.647377, -2.150889, 0, 0, 0, 1, 1,
-1.457517, -0.292292, -3.484433, 0, 0, 0, 1, 1,
-1.455487, 0.1672997, -1.280043, 0, 0, 0, 1, 1,
-1.439121, 1.619257, -1.69572, 0, 0, 0, 1, 1,
-1.416304, 1.077198, 0.2569607, 1, 1, 1, 1, 1,
-1.413801, 1.142942, -1.444385, 1, 1, 1, 1, 1,
-1.409031, 0.1542854, -2.04356, 1, 1, 1, 1, 1,
-1.408209, 0.6868169, -1.269809, 1, 1, 1, 1, 1,
-1.389181, 0.7666802, -1.159666, 1, 1, 1, 1, 1,
-1.3833, 0.381764, 0.1546423, 1, 1, 1, 1, 1,
-1.378194, 0.7966519, -0.316712, 1, 1, 1, 1, 1,
-1.359062, -0.7815037, -2.204367, 1, 1, 1, 1, 1,
-1.356535, -0.09153917, -1.314871, 1, 1, 1, 1, 1,
-1.352015, -0.2877736, -3.819921, 1, 1, 1, 1, 1,
-1.349021, 1.05232, -0.08288936, 1, 1, 1, 1, 1,
-1.347867, 0.1875437, -0.6964531, 1, 1, 1, 1, 1,
-1.346851, 0.2041879, -0.9276731, 1, 1, 1, 1, 1,
-1.344478, 0.5998652, -0.5830672, 1, 1, 1, 1, 1,
-1.317836, -1.158076, -1.856095, 1, 1, 1, 1, 1,
-1.312102, -1.647669, -2.626382, 0, 0, 1, 1, 1,
-1.309657, -0.07395297, -1.597904, 1, 0, 0, 1, 1,
-1.306102, 0.3322855, -0.8976948, 1, 0, 0, 1, 1,
-1.28156, 2.127457, -0.2782897, 1, 0, 0, 1, 1,
-1.275677, 1.350275, -1.877175, 1, 0, 0, 1, 1,
-1.274542, -0.5124158, -2.380668, 1, 0, 0, 1, 1,
-1.270942, -0.353967, -3.214762, 0, 0, 0, 1, 1,
-1.267184, -1.498088, -3.684164, 0, 0, 0, 1, 1,
-1.265516, 0.950655, -1.227329, 0, 0, 0, 1, 1,
-1.255325, 0.8701237, -1.168834, 0, 0, 0, 1, 1,
-1.248719, -1.333214, -2.154627, 0, 0, 0, 1, 1,
-1.246998, -0.4024299, -0.4441826, 0, 0, 0, 1, 1,
-1.242834, 0.2103358, 1.919406, 0, 0, 0, 1, 1,
-1.234617, 0.1246747, -1.669486, 1, 1, 1, 1, 1,
-1.219049, -0.7703468, -1.21476, 1, 1, 1, 1, 1,
-1.215004, 0.8795911, 0.09571997, 1, 1, 1, 1, 1,
-1.209266, -0.3931263, -4.445222, 1, 1, 1, 1, 1,
-1.205537, 1.895462, 0.6956495, 1, 1, 1, 1, 1,
-1.198331, 2.011175, -0.7744425, 1, 1, 1, 1, 1,
-1.197328, -0.6738178, 0.1392787, 1, 1, 1, 1, 1,
-1.196427, 0.2541455, -1.219895, 1, 1, 1, 1, 1,
-1.19403, 0.1972174, -1.094557, 1, 1, 1, 1, 1,
-1.188373, -0.1057452, -1.956699, 1, 1, 1, 1, 1,
-1.188089, 2.597464, -0.8912637, 1, 1, 1, 1, 1,
-1.180273, -1.607206, -1.655621, 1, 1, 1, 1, 1,
-1.177407, -0.5748345, -1.164369, 1, 1, 1, 1, 1,
-1.16398, 0.3860857, -0.1411144, 1, 1, 1, 1, 1,
-1.161906, -0.4287795, -1.036064, 1, 1, 1, 1, 1,
-1.14704, -1.786674, -6.095991, 0, 0, 1, 1, 1,
-1.144755, 0.8490633, -1.662489, 1, 0, 0, 1, 1,
-1.143985, 0.04870987, -0.7829493, 1, 0, 0, 1, 1,
-1.143948, -1.497936, -3.735003, 1, 0, 0, 1, 1,
-1.14283, -1.075525, -2.814732, 1, 0, 0, 1, 1,
-1.138314, -0.5728544, -2.640144, 1, 0, 0, 1, 1,
-1.136655, -0.9360514, -2.336201, 0, 0, 0, 1, 1,
-1.131148, 0.3487701, -3.218299, 0, 0, 0, 1, 1,
-1.130177, 0.6989657, -1.952913, 0, 0, 0, 1, 1,
-1.119326, -1.305001, -3.287047, 0, 0, 0, 1, 1,
-1.1151, -0.7260644, -1.999939, 0, 0, 0, 1, 1,
-1.114831, 0.1260776, -1.272498, 0, 0, 0, 1, 1,
-1.089981, 1.189058, -0.1299491, 0, 0, 0, 1, 1,
-1.089967, -1.136808, -2.928239, 1, 1, 1, 1, 1,
-1.083173, 2.340158, 0.2799271, 1, 1, 1, 1, 1,
-1.082439, -0.2080885, -1.562821, 1, 1, 1, 1, 1,
-1.081606, 1.121189, -2.055441, 1, 1, 1, 1, 1,
-1.081068, 0.2638383, -2.116619, 1, 1, 1, 1, 1,
-1.07832, 1.0454, 1.512635, 1, 1, 1, 1, 1,
-1.075456, 1.626967, -1.185136, 1, 1, 1, 1, 1,
-1.074541, -1.562692, -2.205551, 1, 1, 1, 1, 1,
-1.072589, 0.0478219, -1.254942, 1, 1, 1, 1, 1,
-1.069852, -0.2816018, -2.97275, 1, 1, 1, 1, 1,
-1.065692, -1.524034, -2.822331, 1, 1, 1, 1, 1,
-1.065541, -0.1860824, -1.990992, 1, 1, 1, 1, 1,
-1.062822, 1.197517, -2.821532, 1, 1, 1, 1, 1,
-1.061154, 1.096171, -3.284199, 1, 1, 1, 1, 1,
-1.052746, -0.03102466, -2.494852, 1, 1, 1, 1, 1,
-1.045229, 1.567532, 1.28852, 0, 0, 1, 1, 1,
-1.037533, 1.840929, 0.376794, 1, 0, 0, 1, 1,
-1.029158, 1.066631, 1.653157, 1, 0, 0, 1, 1,
-1.02884, 1.943118, 1.203701, 1, 0, 0, 1, 1,
-1.027377, 0.2172666, -1.164053, 1, 0, 0, 1, 1,
-1.023768, 1.111325, -1.966722, 1, 0, 0, 1, 1,
-1.023208, -1.995744, -4.027323, 0, 0, 0, 1, 1,
-1.015783, -0.5228483, -2.07606, 0, 0, 0, 1, 1,
-1.011743, -1.059577, -3.459339, 0, 0, 0, 1, 1,
-1.008617, -1.030838, -1.571819, 0, 0, 0, 1, 1,
-1.006712, -0.7272218, -3.309031, 0, 0, 0, 1, 1,
-1.003961, 1.43539, -1.897123, 0, 0, 0, 1, 1,
-0.9989666, -2.324613, -2.304838, 0, 0, 0, 1, 1,
-0.9980444, 0.3527547, -1.255478, 1, 1, 1, 1, 1,
-0.9943218, -0.04284594, 0.1399494, 1, 1, 1, 1, 1,
-0.9891962, 0.08035163, -0.55676, 1, 1, 1, 1, 1,
-0.9726408, -0.3029118, -2.186258, 1, 1, 1, 1, 1,
-0.9704757, -1.297649, -1.370026, 1, 1, 1, 1, 1,
-0.9675103, 0.4310968, -1.865854, 1, 1, 1, 1, 1,
-0.9664134, -0.4241854, -2.572979, 1, 1, 1, 1, 1,
-0.9634569, -0.9353712, -2.414924, 1, 1, 1, 1, 1,
-0.9631447, -1.578765, -2.999649, 1, 1, 1, 1, 1,
-0.9621718, -0.6342821, -2.453859, 1, 1, 1, 1, 1,
-0.9557325, 0.1896024, -1.342159, 1, 1, 1, 1, 1,
-0.9533939, -1.962489, -3.061246, 1, 1, 1, 1, 1,
-0.9523305, 1.593925, 0.0621319, 1, 1, 1, 1, 1,
-0.9491274, -1.348965, -0.9512553, 1, 1, 1, 1, 1,
-0.9483407, 0.5983477, -0.8004177, 1, 1, 1, 1, 1,
-0.932676, 1.324352, 1.052103, 0, 0, 1, 1, 1,
-0.9285216, -1.877776, -4.756065, 1, 0, 0, 1, 1,
-0.9272655, 0.1832103, -3.109579, 1, 0, 0, 1, 1,
-0.9256406, 0.0355189, -0.1451716, 1, 0, 0, 1, 1,
-0.9156326, 0.5678508, 0.5320691, 1, 0, 0, 1, 1,
-0.9090905, -0.230608, -2.954186, 1, 0, 0, 1, 1,
-0.9051486, 0.71417, -0.1644922, 0, 0, 0, 1, 1,
-0.8984683, 1.203589, 0.04683396, 0, 0, 0, 1, 1,
-0.8863973, 0.7065882, -1.789746, 0, 0, 0, 1, 1,
-0.8855618, -0.9261962, -3.660661, 0, 0, 0, 1, 1,
-0.8854004, -1.426951, -2.451804, 0, 0, 0, 1, 1,
-0.8753695, 0.4953814, -1.435043, 0, 0, 0, 1, 1,
-0.8711349, 0.951889, 1.216442, 0, 0, 0, 1, 1,
-0.8694484, 1.441457, -0.2252117, 1, 1, 1, 1, 1,
-0.8690596, -1.200925, -0.8270974, 1, 1, 1, 1, 1,
-0.864792, -1.682745, -3.084194, 1, 1, 1, 1, 1,
-0.8602228, -0.9976321, -1.171727, 1, 1, 1, 1, 1,
-0.8542308, 0.9781417, 0.8271679, 1, 1, 1, 1, 1,
-0.8536872, -0.8702052, -2.530279, 1, 1, 1, 1, 1,
-0.8528304, 1.170313, -0.5670077, 1, 1, 1, 1, 1,
-0.8522633, -1.455292, -1.704352, 1, 1, 1, 1, 1,
-0.8522148, -0.9170883, -1.511538, 1, 1, 1, 1, 1,
-0.8459632, -0.515187, -2.0364, 1, 1, 1, 1, 1,
-0.8453879, 0.250594, 0.02576398, 1, 1, 1, 1, 1,
-0.8417683, 0.3925982, -1.794329, 1, 1, 1, 1, 1,
-0.8304622, -0.6435096, -3.455586, 1, 1, 1, 1, 1,
-0.8284931, 0.6056992, -0.7584302, 1, 1, 1, 1, 1,
-0.8252185, 0.8276088, -0.7788575, 1, 1, 1, 1, 1,
-0.8246514, 0.79135, -0.9891988, 0, 0, 1, 1, 1,
-0.8213281, 1.224975, -0.5052441, 1, 0, 0, 1, 1,
-0.8210429, 0.5282691, -0.9047033, 1, 0, 0, 1, 1,
-0.8181847, 1.448857, -1.912747, 1, 0, 0, 1, 1,
-0.8029588, -0.7279978, -1.871018, 1, 0, 0, 1, 1,
-0.7958182, 1.337929, 0.3085977, 1, 0, 0, 1, 1,
-0.7931339, 0.1039072, -1.307477, 0, 0, 0, 1, 1,
-0.7892188, -0.1312667, -2.901309, 0, 0, 0, 1, 1,
-0.7840604, 1.025318, -0.2753589, 0, 0, 0, 1, 1,
-0.7741041, -0.1970729, -2.533104, 0, 0, 0, 1, 1,
-0.7685801, -0.5119028, -0.7044277, 0, 0, 0, 1, 1,
-0.7663294, 0.5966502, -2.005648, 0, 0, 0, 1, 1,
-0.7617162, -1.900062, -3.771562, 0, 0, 0, 1, 1,
-0.7585736, -1.102524, -3.41647, 1, 1, 1, 1, 1,
-0.749791, -0.360284, -2.752496, 1, 1, 1, 1, 1,
-0.7497665, -1.90007, -3.567945, 1, 1, 1, 1, 1,
-0.7446934, 1.687332, -1.700244, 1, 1, 1, 1, 1,
-0.7444715, 0.5532302, 0.4108108, 1, 1, 1, 1, 1,
-0.7419596, 1.897125, -2.035689, 1, 1, 1, 1, 1,
-0.7415789, 1.108, 0.2421513, 1, 1, 1, 1, 1,
-0.7340118, 1.411765, -0.3417032, 1, 1, 1, 1, 1,
-0.7266411, -1.358375, -3.402691, 1, 1, 1, 1, 1,
-0.7265717, 0.9541453, -0.4194607, 1, 1, 1, 1, 1,
-0.7251788, -0.6997186, -1.009373, 1, 1, 1, 1, 1,
-0.7225913, 0.1825957, 0.05082556, 1, 1, 1, 1, 1,
-0.7212216, -0.9796267, -1.119716, 1, 1, 1, 1, 1,
-0.7208951, -0.3553887, -0.5902618, 1, 1, 1, 1, 1,
-0.7185416, 1.036195, -2.005051, 1, 1, 1, 1, 1,
-0.7183903, 0.004338973, -2.973228, 0, 0, 1, 1, 1,
-0.7116045, 0.4164263, -1.293681, 1, 0, 0, 1, 1,
-0.699474, 1.220286, -0.1307477, 1, 0, 0, 1, 1,
-0.6990438, -1.391814, -2.214481, 1, 0, 0, 1, 1,
-0.6983318, 0.284971, -0.4418969, 1, 0, 0, 1, 1,
-0.692522, 0.1744706, -1.518074, 1, 0, 0, 1, 1,
-0.6823118, -0.09590937, -2.683741, 0, 0, 0, 1, 1,
-0.6725585, 0.1620887, -3.122802, 0, 0, 0, 1, 1,
-0.6720517, -0.04940891, -0.7973817, 0, 0, 0, 1, 1,
-0.6707445, 1.235841, 0.7933295, 0, 0, 0, 1, 1,
-0.6654403, 0.2971944, -0.1658401, 0, 0, 0, 1, 1,
-0.6640491, -0.9442069, -1.449556, 0, 0, 0, 1, 1,
-0.6624861, -0.7862616, -2.430796, 0, 0, 0, 1, 1,
-0.6622379, -1.136352, -2.938271, 1, 1, 1, 1, 1,
-0.6602075, -0.9749463, -3.296928, 1, 1, 1, 1, 1,
-0.6486166, 0.4623352, -0.2151191, 1, 1, 1, 1, 1,
-0.6435669, -0.2397969, -0.6529449, 1, 1, 1, 1, 1,
-0.6420432, -1.22007, -3.315851, 1, 1, 1, 1, 1,
-0.6403245, -0.3160051, -1.235996, 1, 1, 1, 1, 1,
-0.6399067, -1.194293, -2.785715, 1, 1, 1, 1, 1,
-0.6386172, -0.4204552, -1.887809, 1, 1, 1, 1, 1,
-0.6385378, 1.114079, -0.1376392, 1, 1, 1, 1, 1,
-0.6381117, -1.111726, -3.221828, 1, 1, 1, 1, 1,
-0.6211911, -0.3798493, -0.2097127, 1, 1, 1, 1, 1,
-0.6138474, 1.721925, 1.10367, 1, 1, 1, 1, 1,
-0.6138271, -0.2576936, -2.354483, 1, 1, 1, 1, 1,
-0.6112791, -1.485858, -3.596039, 1, 1, 1, 1, 1,
-0.6056803, -0.9095151, -2.067146, 1, 1, 1, 1, 1,
-0.6048554, 0.4869063, -1.243134, 0, 0, 1, 1, 1,
-0.5997923, 1.719301, 0.4856104, 1, 0, 0, 1, 1,
-0.5995643, 0.8618029, -1.145078, 1, 0, 0, 1, 1,
-0.5957077, -1.315495, -3.073681, 1, 0, 0, 1, 1,
-0.5854563, -0.09588064, 1.057916, 1, 0, 0, 1, 1,
-0.5835335, 1.241057, -0.018879, 1, 0, 0, 1, 1,
-0.5823449, 0.8396502, -1.466313, 0, 0, 0, 1, 1,
-0.5802655, -0.2554058, -1.867132, 0, 0, 0, 1, 1,
-0.5762693, 0.5644429, -0.7889351, 0, 0, 0, 1, 1,
-0.5752168, -1.143844, -0.9037678, 0, 0, 0, 1, 1,
-0.5714313, -0.8868409, -2.327001, 0, 0, 0, 1, 1,
-0.5690307, -0.3895967, -2.508743, 0, 0, 0, 1, 1,
-0.5665622, 0.6679345, -2.073777, 0, 0, 0, 1, 1,
-0.5645068, -0.9243578, -3.458498, 1, 1, 1, 1, 1,
-0.5616009, -0.4163875, -2.380304, 1, 1, 1, 1, 1,
-0.55146, -0.2371194, -0.7671542, 1, 1, 1, 1, 1,
-0.5474408, -0.2495328, 0.2111537, 1, 1, 1, 1, 1,
-0.5472973, -1.98222, -3.529076, 1, 1, 1, 1, 1,
-0.5435295, 0.4239801, -2.441311, 1, 1, 1, 1, 1,
-0.5315477, 0.05728764, -1.628127, 1, 1, 1, 1, 1,
-0.525065, -0.5887163, -3.457824, 1, 1, 1, 1, 1,
-0.5225239, -1.825647, -3.429159, 1, 1, 1, 1, 1,
-0.5141644, -0.5793881, -1.873896, 1, 1, 1, 1, 1,
-0.512361, -0.245204, -0.6913583, 1, 1, 1, 1, 1,
-0.5113989, -0.650752, -1.31298, 1, 1, 1, 1, 1,
-0.5089842, -3.703835, -3.042351, 1, 1, 1, 1, 1,
-0.5072615, -1.695324, -2.429665, 1, 1, 1, 1, 1,
-0.5046631, -0.3162977, -0.6093967, 1, 1, 1, 1, 1,
-0.5037776, -0.8528566, -3.809242, 0, 0, 1, 1, 1,
-0.5036666, -0.03049694, -1.211033, 1, 0, 0, 1, 1,
-0.5022191, -0.9714767, -2.342413, 1, 0, 0, 1, 1,
-0.4971432, -0.1149713, -1.395183, 1, 0, 0, 1, 1,
-0.4957383, -0.9087687, -0.9524456, 1, 0, 0, 1, 1,
-0.4955675, 0.8026057, -0.4800203, 1, 0, 0, 1, 1,
-0.4937945, -3.366333, -3.662305, 0, 0, 0, 1, 1,
-0.4928079, -0.2151983, -1.968065, 0, 0, 0, 1, 1,
-0.4924818, -0.980318, -1.266129, 0, 0, 0, 1, 1,
-0.4872447, -0.2934805, -2.324926, 0, 0, 0, 1, 1,
-0.4848022, -0.5283498, -3.223682, 0, 0, 0, 1, 1,
-0.4829417, -0.04279278, -3.296364, 0, 0, 0, 1, 1,
-0.4772872, -0.1671571, -1.035684, 0, 0, 0, 1, 1,
-0.4715799, 1.825899, -0.61671, 1, 1, 1, 1, 1,
-0.4711042, -0.30629, -3.001796, 1, 1, 1, 1, 1,
-0.4665847, 0.09198198, -3.076621, 1, 1, 1, 1, 1,
-0.4662727, 0.4769052, -1.729743, 1, 1, 1, 1, 1,
-0.4613336, 0.6013836, -0.8475888, 1, 1, 1, 1, 1,
-0.4567446, -0.5089998, -1.489824, 1, 1, 1, 1, 1,
-0.4552816, -0.7209916, -3.231556, 1, 1, 1, 1, 1,
-0.4550429, 2.239788, 0.1948725, 1, 1, 1, 1, 1,
-0.4523926, 1.850768, -0.04185015, 1, 1, 1, 1, 1,
-0.4520504, -0.489392, -3.01835, 1, 1, 1, 1, 1,
-0.4495848, -1.300817, -2.36835, 1, 1, 1, 1, 1,
-0.447288, -0.5063715, -2.364848, 1, 1, 1, 1, 1,
-0.4450275, -1.75796, -3.54707, 1, 1, 1, 1, 1,
-0.4419112, 2.770613, -0.100428, 1, 1, 1, 1, 1,
-0.4396902, 1.541663, 0.6249233, 1, 1, 1, 1, 1,
-0.4343397, -0.8698609, -2.459239, 0, 0, 1, 1, 1,
-0.4338021, -0.8421958, -4.0334, 1, 0, 0, 1, 1,
-0.4326227, -0.1502892, -1.984968, 1, 0, 0, 1, 1,
-0.4313006, -0.9073895, -3.86761, 1, 0, 0, 1, 1,
-0.4289939, -1.168977, -3.404867, 1, 0, 0, 1, 1,
-0.4289337, 0.1656582, -1.260067, 1, 0, 0, 1, 1,
-0.4275839, -0.192974, -3.033168, 0, 0, 0, 1, 1,
-0.4259901, -0.4851187, -1.41346, 0, 0, 0, 1, 1,
-0.4259548, 0.7507495, -1.533571, 0, 0, 0, 1, 1,
-0.4240628, 1.056284, -0.2750639, 0, 0, 0, 1, 1,
-0.4189903, -0.814593, -2.346843, 0, 0, 0, 1, 1,
-0.4156684, 0.4019098, -0.5130928, 0, 0, 0, 1, 1,
-0.4145053, 1.02869, -0.5881529, 0, 0, 0, 1, 1,
-0.4124947, 1.121961, -0.0691502, 1, 1, 1, 1, 1,
-0.4089637, -0.409229, -2.82703, 1, 1, 1, 1, 1,
-0.406046, -0.8794792, -3.236364, 1, 1, 1, 1, 1,
-0.403957, 0.506282, -0.6712861, 1, 1, 1, 1, 1,
-0.4032681, 0.2034584, -1.861285, 1, 1, 1, 1, 1,
-0.400924, -0.8350224, -3.492406, 1, 1, 1, 1, 1,
-0.4001754, 0.7559374, -1.480246, 1, 1, 1, 1, 1,
-0.3999003, -0.2223415, -4.364143, 1, 1, 1, 1, 1,
-0.3949134, 0.2718269, 0.4152204, 1, 1, 1, 1, 1,
-0.3942714, 1.419497, 0.2493477, 1, 1, 1, 1, 1,
-0.3916627, 1.061535, 0.9399242, 1, 1, 1, 1, 1,
-0.3909514, 0.6064305, -0.6630812, 1, 1, 1, 1, 1,
-0.3896591, -2.072391, -2.530108, 1, 1, 1, 1, 1,
-0.3895397, 0.654898, -0.7069755, 1, 1, 1, 1, 1,
-0.3889494, 1.865008, -0.09909923, 1, 1, 1, 1, 1,
-0.3883607, -0.3125522, -1.8325, 0, 0, 1, 1, 1,
-0.3848662, 0.2207253, 0.7309126, 1, 0, 0, 1, 1,
-0.3841422, -0.838959, -2.658101, 1, 0, 0, 1, 1,
-0.3788734, -0.4437304, -2.980624, 1, 0, 0, 1, 1,
-0.3756166, 2.266171, 1.116787, 1, 0, 0, 1, 1,
-0.3751429, -1.667874, -3.315001, 1, 0, 0, 1, 1,
-0.3745214, 0.915842, -0.2937435, 0, 0, 0, 1, 1,
-0.3741119, -1.991469, -3.10647, 0, 0, 0, 1, 1,
-0.3740151, -0.4079382, -2.449196, 0, 0, 0, 1, 1,
-0.3695187, 0.327147, -1.541867, 0, 0, 0, 1, 1,
-0.3691024, 0.7708509, 0.02057169, 0, 0, 0, 1, 1,
-0.3681739, 0.7128458, -2.655166, 0, 0, 0, 1, 1,
-0.3587416, 0.1670127, -3.134942, 0, 0, 0, 1, 1,
-0.3545494, -0.2535605, -2.732159, 1, 1, 1, 1, 1,
-0.3542645, 1.367415, 0.5353359, 1, 1, 1, 1, 1,
-0.344169, -0.7613725, -4.772077, 1, 1, 1, 1, 1,
-0.3359987, 1.260373, -0.03505822, 1, 1, 1, 1, 1,
-0.3219357, -0.9809073, -0.1104355, 1, 1, 1, 1, 1,
-0.3212048, -0.5919067, -1.645282, 1, 1, 1, 1, 1,
-0.3186503, 0.0677883, -1.005674, 1, 1, 1, 1, 1,
-0.3112814, -0.2873758, -3.204721, 1, 1, 1, 1, 1,
-0.3066449, -0.1153272, -3.084207, 1, 1, 1, 1, 1,
-0.3037437, -0.1532983, -2.346671, 1, 1, 1, 1, 1,
-0.3020708, -0.1493087, -1.995616, 1, 1, 1, 1, 1,
-0.2975138, 0.3002956, -2.51713, 1, 1, 1, 1, 1,
-0.2972271, -0.8377819, -1.988327, 1, 1, 1, 1, 1,
-0.292732, -2.060672, -1.919177, 1, 1, 1, 1, 1,
-0.2903298, -0.3910207, -1.278135, 1, 1, 1, 1, 1,
-0.2897153, 0.04282832, -1.141091, 0, 0, 1, 1, 1,
-0.289261, -1.439721, -2.738845, 1, 0, 0, 1, 1,
-0.2801483, -0.3338865, -0.4846555, 1, 0, 0, 1, 1,
-0.275181, 0.7596772, -1.315086, 1, 0, 0, 1, 1,
-0.2744605, 0.3355725, -1.0936, 1, 0, 0, 1, 1,
-0.2730772, 1.528739, -1.790901, 1, 0, 0, 1, 1,
-0.2713506, 0.001524002, -1.158498, 0, 0, 0, 1, 1,
-0.2697248, 0.4349855, -0.7232178, 0, 0, 0, 1, 1,
-0.2653247, 0.5440086, 0.9305581, 0, 0, 0, 1, 1,
-0.2613756, 1.0608, -0.7084159, 0, 0, 0, 1, 1,
-0.2568534, 0.7079999, -1.044707, 0, 0, 0, 1, 1,
-0.2559112, 1.178675, -0.1927678, 0, 0, 0, 1, 1,
-0.2541037, 0.5168828, -1.067026, 0, 0, 0, 1, 1,
-0.253837, 0.3267488, -2.343863, 1, 1, 1, 1, 1,
-0.2523698, -0.8514943, -2.582283, 1, 1, 1, 1, 1,
-0.2496978, -0.6713852, -3.369998, 1, 1, 1, 1, 1,
-0.2409201, -0.102182, -0.8473623, 1, 1, 1, 1, 1,
-0.2350517, 0.2735117, 1.445281, 1, 1, 1, 1, 1,
-0.2325735, 1.656849, -0.1949973, 1, 1, 1, 1, 1,
-0.2312151, 1.848572, 0.9740086, 1, 1, 1, 1, 1,
-0.2310608, -0.2836462, -1.18914, 1, 1, 1, 1, 1,
-0.2288574, -1.223606, -2.36988, 1, 1, 1, 1, 1,
-0.2245492, 0.03316457, -1.842683, 1, 1, 1, 1, 1,
-0.2223416, -0.1155779, -0.7938318, 1, 1, 1, 1, 1,
-0.2186314, -0.2756854, -3.021303, 1, 1, 1, 1, 1,
-0.2179611, 0.4904119, 0.1236776, 1, 1, 1, 1, 1,
-0.2179139, -0.2959425, -0.6813202, 1, 1, 1, 1, 1,
-0.2174611, 1.036137, -1.10598, 1, 1, 1, 1, 1,
-0.2160353, 0.4031784, -0.5459609, 0, 0, 1, 1, 1,
-0.2025219, 1.08522, -0.6871045, 1, 0, 0, 1, 1,
-0.2008428, -1.087033, -4.376025, 1, 0, 0, 1, 1,
-0.2004066, -0.9870752, -4.033079, 1, 0, 0, 1, 1,
-0.1973595, 0.9919543, 0.7275743, 1, 0, 0, 1, 1,
-0.1972601, -0.2331183, -3.236126, 1, 0, 0, 1, 1,
-0.1968632, 1.567472, -0.2605361, 0, 0, 0, 1, 1,
-0.196581, 0.1861338, -1.117021, 0, 0, 0, 1, 1,
-0.1927465, 0.5440986, 0.827799, 0, 0, 0, 1, 1,
-0.1924855, -0.4016645, -3.813432, 0, 0, 0, 1, 1,
-0.1896324, -0.7326281, -2.055675, 0, 0, 0, 1, 1,
-0.1869759, 0.335654, -1.924887, 0, 0, 0, 1, 1,
-0.1854164, -0.3931133, -3.568041, 0, 0, 0, 1, 1,
-0.1818631, 1.046389, -1.194125, 1, 1, 1, 1, 1,
-0.1783072, -0.7463697, -3.159473, 1, 1, 1, 1, 1,
-0.1763719, 1.269194, 1.430634, 1, 1, 1, 1, 1,
-0.1763153, -0.4808791, -3.79386, 1, 1, 1, 1, 1,
-0.1742412, -0.7607775, -1.562093, 1, 1, 1, 1, 1,
-0.1730956, -0.2318748, -2.200374, 1, 1, 1, 1, 1,
-0.1723611, 1.172751, -0.3027309, 1, 1, 1, 1, 1,
-0.1695303, 0.8275509, -1.861661, 1, 1, 1, 1, 1,
-0.1655718, -0.3536077, -0.8759043, 1, 1, 1, 1, 1,
-0.1650422, 0.02350464, -2.120508, 1, 1, 1, 1, 1,
-0.1602687, -0.6648937, -4.03018, 1, 1, 1, 1, 1,
-0.1598811, 0.9665597, -0.8808196, 1, 1, 1, 1, 1,
-0.158922, 0.5153258, -1.775582, 1, 1, 1, 1, 1,
-0.1546555, 0.2987626, -0.4003578, 1, 1, 1, 1, 1,
-0.1535186, -0.7553892, -1.81065, 1, 1, 1, 1, 1,
-0.1534213, 0.6423967, -0.2747018, 0, 0, 1, 1, 1,
-0.1526962, -1.078139, -3.697683, 1, 0, 0, 1, 1,
-0.148699, 0.2805734, 0.01961491, 1, 0, 0, 1, 1,
-0.1481025, 1.023565, 0.4931685, 1, 0, 0, 1, 1,
-0.1472686, -1.45597, -3.566128, 1, 0, 0, 1, 1,
-0.1466542, -0.08735539, -0.2665035, 1, 0, 0, 1, 1,
-0.1453497, 0.6524242, 0.3749489, 0, 0, 0, 1, 1,
-0.1426671, 0.2777109, 1.153772, 0, 0, 0, 1, 1,
-0.1420694, 1.586839, -1.410768, 0, 0, 0, 1, 1,
-0.1404414, 1.892326, -1.093895, 0, 0, 0, 1, 1,
-0.1282209, -1.227138, -2.186497, 0, 0, 0, 1, 1,
-0.1277775, 0.2299924, -0.756065, 0, 0, 0, 1, 1,
-0.1219537, -0.02796564, -0.8702344, 0, 0, 0, 1, 1,
-0.1067988, 0.8221999, -0.2857595, 1, 1, 1, 1, 1,
-0.102685, -0.6393155, -3.837195, 1, 1, 1, 1, 1,
-0.1011059, -0.4165378, -4.399259, 1, 1, 1, 1, 1,
-0.08985922, 1.040394, -0.8492091, 1, 1, 1, 1, 1,
-0.08831224, 0.5435941, 0.8742439, 1, 1, 1, 1, 1,
-0.08411401, 0.9579311, 0.3964067, 1, 1, 1, 1, 1,
-0.0793731, -0.4416368, -2.361824, 1, 1, 1, 1, 1,
-0.07865595, 0.7028971, 0.3603019, 1, 1, 1, 1, 1,
-0.07856102, 1.400355, 0.207404, 1, 1, 1, 1, 1,
-0.07600364, -1.029196, -3.003072, 1, 1, 1, 1, 1,
-0.07538968, 1.120293, 1.304976, 1, 1, 1, 1, 1,
-0.07380552, 0.1937004, -0.8410021, 1, 1, 1, 1, 1,
-0.07377399, 1.114668, 1.138156, 1, 1, 1, 1, 1,
-0.07343344, 1.413738, -0.8079919, 1, 1, 1, 1, 1,
-0.07159745, 0.2011801, -3.380891, 1, 1, 1, 1, 1,
-0.06957885, 2.00465, 2.381904, 0, 0, 1, 1, 1,
-0.06893102, 0.8718473, -0.2856334, 1, 0, 0, 1, 1,
-0.06716569, 0.2461396, 1.038088, 1, 0, 0, 1, 1,
-0.06651972, -1.8989, -3.631168, 1, 0, 0, 1, 1,
-0.06501953, 0.8242581, 0.5230627, 1, 0, 0, 1, 1,
-0.06051392, 0.5439871, 0.5993842, 1, 0, 0, 1, 1,
-0.05806855, -1.102169, -4.068139, 0, 0, 0, 1, 1,
-0.05731377, -0.9489698, -2.735326, 0, 0, 0, 1, 1,
-0.05587167, 0.3429867, -0.3322692, 0, 0, 0, 1, 1,
-0.05401338, 0.6768395, -1.87214, 0, 0, 0, 1, 1,
-0.05178508, -0.8491821, -2.757162, 0, 0, 0, 1, 1,
-0.04877354, 0.595566, -0.003625653, 0, 0, 0, 1, 1,
-0.04597336, -0.07834845, -1.965761, 0, 0, 0, 1, 1,
-0.04420736, -0.6039183, -2.710157, 1, 1, 1, 1, 1,
-0.04037064, -1.501206, -3.957948, 1, 1, 1, 1, 1,
-0.03921902, -0.02936511, -1.629574, 1, 1, 1, 1, 1,
-0.03669897, -0.1248161, -3.157033, 1, 1, 1, 1, 1,
-0.03392619, -0.1458441, -2.185888, 1, 1, 1, 1, 1,
-0.02956952, -0.0219068, -3.33235, 1, 1, 1, 1, 1,
-0.02548252, -0.9613369, -3.032415, 1, 1, 1, 1, 1,
-0.02544918, 0.7640479, 0.5155697, 1, 1, 1, 1, 1,
-0.02018054, 1.103363, 2.122248, 1, 1, 1, 1, 1,
-0.0199005, -0.09524149, -0.7246424, 1, 1, 1, 1, 1,
-0.01970162, 0.57717, 0.9041919, 1, 1, 1, 1, 1,
-0.01686456, -1.411253, -4.35149, 1, 1, 1, 1, 1,
-0.01621995, 0.05592596, 0.02011693, 1, 1, 1, 1, 1,
-0.01107303, 1.139673, -0.8972391, 1, 1, 1, 1, 1,
-0.008116963, -0.4870195, -2.705009, 1, 1, 1, 1, 1,
-0.006100137, 1.655903, 1.543169, 0, 0, 1, 1, 1,
0.002404064, 0.130057, 1.140035, 1, 0, 0, 1, 1,
0.004671836, -1.49822, 2.971171, 1, 0, 0, 1, 1,
0.00512166, 1.086808, 0.5510938, 1, 0, 0, 1, 1,
0.006586705, 0.3769214, 0.5288245, 1, 0, 0, 1, 1,
0.01266902, -0.3463859, 3.598875, 1, 0, 0, 1, 1,
0.01506036, 0.2112928, 1.159133, 0, 0, 0, 1, 1,
0.01745173, 0.504014, 0.358068, 0, 0, 0, 1, 1,
0.02017502, 1.236324, -1.064879, 0, 0, 0, 1, 1,
0.02203423, -0.5103625, 2.599113, 0, 0, 0, 1, 1,
0.02237246, 0.7144047, 0.2903841, 0, 0, 0, 1, 1,
0.022433, 0.4588225, -1.239049, 0, 0, 0, 1, 1,
0.02336055, -0.7275351, 5.238909, 0, 0, 0, 1, 1,
0.02398511, -0.2680558, 5.152187, 1, 1, 1, 1, 1,
0.02892421, -0.1962515, 2.455942, 1, 1, 1, 1, 1,
0.0326696, -1.401859, 3.126745, 1, 1, 1, 1, 1,
0.03407102, -0.1064998, 4.392099, 1, 1, 1, 1, 1,
0.03720868, -0.234149, 3.620965, 1, 1, 1, 1, 1,
0.04118032, 0.7695399, -0.1525537, 1, 1, 1, 1, 1,
0.0433159, 1.599373, 1.313406, 1, 1, 1, 1, 1,
0.04833697, 0.4975629, -1.155904, 1, 1, 1, 1, 1,
0.05401224, 1.65156, 0.2822949, 1, 1, 1, 1, 1,
0.05556544, -0.03150637, 1.130235, 1, 1, 1, 1, 1,
0.05788692, 1.155119, 0.2243703, 1, 1, 1, 1, 1,
0.05900855, -0.9325756, 4.052496, 1, 1, 1, 1, 1,
0.06171156, 0.09937086, -0.1489871, 1, 1, 1, 1, 1,
0.06641634, -0.8344988, 3.226802, 1, 1, 1, 1, 1,
0.0753468, 0.9844282, 1.082605, 1, 1, 1, 1, 1,
0.07664838, 0.3297139, 0.4552441, 0, 0, 1, 1, 1,
0.07831341, -1.145966, 5.257041, 1, 0, 0, 1, 1,
0.07923134, -0.4034039, 2.028364, 1, 0, 0, 1, 1,
0.08141708, 1.094138, -2.196969, 1, 0, 0, 1, 1,
0.08637713, 1.323728, 1.113728, 1, 0, 0, 1, 1,
0.08827676, -0.1206406, 3.600172, 1, 0, 0, 1, 1,
0.0885702, 0.4189062, 0.7774273, 0, 0, 0, 1, 1,
0.09117406, 0.06002782, 2.066569, 0, 0, 0, 1, 1,
0.09158093, -1.975729, 1.979903, 0, 0, 0, 1, 1,
0.1041129, -0.2604395, 3.344093, 0, 0, 0, 1, 1,
0.1068689, -0.1492494, 2.253283, 0, 0, 0, 1, 1,
0.1109228, 1.411553, 0.2696152, 0, 0, 0, 1, 1,
0.1122805, 0.06643548, 1.962612, 0, 0, 0, 1, 1,
0.1142559, 0.6718095, -0.92676, 1, 1, 1, 1, 1,
0.1144927, 0.5884823, 0.7389536, 1, 1, 1, 1, 1,
0.121546, 0.7676963, -0.6805753, 1, 1, 1, 1, 1,
0.1243435, 0.9585111, -0.5625706, 1, 1, 1, 1, 1,
0.1245315, 1.467677, -0.4212505, 1, 1, 1, 1, 1,
0.1258016, -0.710946, 3.236653, 1, 1, 1, 1, 1,
0.1282366, 1.676793, -1.101399, 1, 1, 1, 1, 1,
0.1296068, 0.8754493, -0.8439254, 1, 1, 1, 1, 1,
0.1305977, -0.4822146, 4.428557, 1, 1, 1, 1, 1,
0.1309879, -0.5572007, 2.524894, 1, 1, 1, 1, 1,
0.1326191, 2.574912, 0.6438168, 1, 1, 1, 1, 1,
0.1349946, 0.2089333, -0.5704578, 1, 1, 1, 1, 1,
0.1480057, -0.3393162, 3.946998, 1, 1, 1, 1, 1,
0.1480498, -0.6875208, 2.445445, 1, 1, 1, 1, 1,
0.1500489, -0.298391, 2.662256, 1, 1, 1, 1, 1,
0.1509621, 0.3632122, -0.2926503, 0, 0, 1, 1, 1,
0.1530127, -1.383353, 2.5874, 1, 0, 0, 1, 1,
0.1547116, 2.43289, 1.198206, 1, 0, 0, 1, 1,
0.1607489, 0.8729435, -1.17909, 1, 0, 0, 1, 1,
0.1711415, -0.4111912, 2.21803, 1, 0, 0, 1, 1,
0.1730754, -0.3457249, 2.079168, 1, 0, 0, 1, 1,
0.173388, 0.2448149, -1.38365, 0, 0, 0, 1, 1,
0.1754991, -0.9148845, 3.446939, 0, 0, 0, 1, 1,
0.1757021, -0.6100966, 1.616554, 0, 0, 0, 1, 1,
0.1759214, -0.101815, 0.9748294, 0, 0, 0, 1, 1,
0.1759312, -0.7181494, 1.629414, 0, 0, 0, 1, 1,
0.1792461, -0.8746689, 3.899614, 0, 0, 0, 1, 1,
0.1798927, -0.1264579, 1.419687, 0, 0, 0, 1, 1,
0.1825195, 0.5930858, 1.825696, 1, 1, 1, 1, 1,
0.1827255, -1.154905, 1.613961, 1, 1, 1, 1, 1,
0.1859406, -1.142545, 2.808172, 1, 1, 1, 1, 1,
0.1895368, 0.8132665, 0.6843398, 1, 1, 1, 1, 1,
0.1896808, -0.8011111, 2.582455, 1, 1, 1, 1, 1,
0.1919954, -1.333886, 2.037051, 1, 1, 1, 1, 1,
0.1934571, 0.4536934, -0.4450014, 1, 1, 1, 1, 1,
0.1953309, 0.4703459, 1.938608, 1, 1, 1, 1, 1,
0.1954084, 0.4459348, 1.142646, 1, 1, 1, 1, 1,
0.1972147, -0.6365527, 1.560714, 1, 1, 1, 1, 1,
0.1973385, 0.9914858, 0.2520574, 1, 1, 1, 1, 1,
0.1988795, -0.05576562, 3.117589, 1, 1, 1, 1, 1,
0.199924, -0.7796335, 3.795636, 1, 1, 1, 1, 1,
0.2000471, 0.2328306, 1.158005, 1, 1, 1, 1, 1,
0.2016617, 0.7819602, 0.1509355, 1, 1, 1, 1, 1,
0.2024032, -0.9345161, 3.522256, 0, 0, 1, 1, 1,
0.2029772, 0.3687819, 1.044438, 1, 0, 0, 1, 1,
0.2056145, -0.9337648, 2.384472, 1, 0, 0, 1, 1,
0.205714, 1.469674, 0.8218783, 1, 0, 0, 1, 1,
0.2076805, -0.3103526, 2.285889, 1, 0, 0, 1, 1,
0.2091276, -0.9352045, 3.680168, 1, 0, 0, 1, 1,
0.2116589, 0.1738597, 1.222618, 0, 0, 0, 1, 1,
0.2127831, -1.089365, 2.371114, 0, 0, 0, 1, 1,
0.2129337, -1.01765, 3.104387, 0, 0, 0, 1, 1,
0.2135825, -0.7823248, 3.731999, 0, 0, 0, 1, 1,
0.2157072, -0.2774033, 2.727077, 0, 0, 0, 1, 1,
0.2204066, -0.006624391, 1.750305, 0, 0, 0, 1, 1,
0.2243747, -0.1392506, 2.423453, 0, 0, 0, 1, 1,
0.2255496, -0.2282119, 3.362347, 1, 1, 1, 1, 1,
0.2287887, -1.487462, 4.634501, 1, 1, 1, 1, 1,
0.229337, 1.449634, -0.6959847, 1, 1, 1, 1, 1,
0.2298009, 0.1783224, 1.757449, 1, 1, 1, 1, 1,
0.2371348, -0.06630069, 2.200834, 1, 1, 1, 1, 1,
0.2371658, 1.289927, -0.5834178, 1, 1, 1, 1, 1,
0.2379196, -0.5322272, 0.8412763, 1, 1, 1, 1, 1,
0.2451738, -2.184617, 2.246127, 1, 1, 1, 1, 1,
0.2464446, -0.2613356, 2.31497, 1, 1, 1, 1, 1,
0.2464726, -0.939518, 2.303937, 1, 1, 1, 1, 1,
0.2467455, 0.2375959, 1.965065, 1, 1, 1, 1, 1,
0.2483854, 0.9667385, -0.7275399, 1, 1, 1, 1, 1,
0.2496749, -1.172232, 1.968921, 1, 1, 1, 1, 1,
0.2497946, 1.554033, -0.1907739, 1, 1, 1, 1, 1,
0.2503392, -0.009017881, 2.232253, 1, 1, 1, 1, 1,
0.2545772, 0.3492976, 1.272711, 0, 0, 1, 1, 1,
0.2603558, -0.9063761, 2.939843, 1, 0, 0, 1, 1,
0.2607427, 0.2985218, -1.353866, 1, 0, 0, 1, 1,
0.2641352, -3.11471, 4.498404, 1, 0, 0, 1, 1,
0.2674899, -0.5924833, 2.040927, 1, 0, 0, 1, 1,
0.2677762, -1.150028, 3.626344, 1, 0, 0, 1, 1,
0.2679176, 2.457476, -0.3876423, 0, 0, 0, 1, 1,
0.2714046, 1.496425, -1.19296, 0, 0, 0, 1, 1,
0.2737273, 0.08056447, 1.992389, 0, 0, 0, 1, 1,
0.275587, -0.9706035, 2.73818, 0, 0, 0, 1, 1,
0.2766909, 0.1227108, 0.9787464, 0, 0, 0, 1, 1,
0.2785431, 1.510105, -0.4755768, 0, 0, 0, 1, 1,
0.2810647, 1.059942, -0.6527004, 0, 0, 0, 1, 1,
0.2811701, 0.1769345, 0.9162156, 1, 1, 1, 1, 1,
0.283083, 0.1446445, 0.4155633, 1, 1, 1, 1, 1,
0.2841536, -0.2643068, 2.031001, 1, 1, 1, 1, 1,
0.2879811, 0.1878131, -0.128016, 1, 1, 1, 1, 1,
0.2897336, -0.9720368, 1.366066, 1, 1, 1, 1, 1,
0.2941839, 0.5404944, 0.2156103, 1, 1, 1, 1, 1,
0.2944671, 1.151775, 0.08581783, 1, 1, 1, 1, 1,
0.2959349, -0.7926537, 3.713401, 1, 1, 1, 1, 1,
0.3087976, 1.209243, 1.126828, 1, 1, 1, 1, 1,
0.3096556, 0.1499761, 1.02881, 1, 1, 1, 1, 1,
0.3100992, 0.8622487, -0.1515444, 1, 1, 1, 1, 1,
0.3113386, -0.2968009, 2.109807, 1, 1, 1, 1, 1,
0.313403, 0.6966826, 0.7819702, 1, 1, 1, 1, 1,
0.3181126, -0.7387065, 2.988263, 1, 1, 1, 1, 1,
0.3217826, 1.724863, 0.499513, 1, 1, 1, 1, 1,
0.3316206, 0.6936178, 1.065061, 0, 0, 1, 1, 1,
0.3345534, -0.1759332, 2.251688, 1, 0, 0, 1, 1,
0.3373466, -0.675911, 3.49558, 1, 0, 0, 1, 1,
0.3411349, 0.2958356, 1.435577, 1, 0, 0, 1, 1,
0.3429801, 0.1117381, 1.840334, 1, 0, 0, 1, 1,
0.3445024, 1.488896, 1.046708, 1, 0, 0, 1, 1,
0.3470341, 0.2829241, 1.590824, 0, 0, 0, 1, 1,
0.3532528, -0.4680738, 4.103604, 0, 0, 0, 1, 1,
0.3556467, 1.46687, 0.9150625, 0, 0, 0, 1, 1,
0.3575647, 1.390928, 1.348285, 0, 0, 0, 1, 1,
0.3610353, 0.9789309, 1.952788, 0, 0, 0, 1, 1,
0.361447, 2.797208, 0.5829142, 0, 0, 0, 1, 1,
0.3621366, -2.613832, 2.870275, 0, 0, 0, 1, 1,
0.363329, 0.7276663, 2.474091, 1, 1, 1, 1, 1,
0.3655245, -1.601756, 4.787351, 1, 1, 1, 1, 1,
0.3675649, -0.7962952, 1.961216, 1, 1, 1, 1, 1,
0.3685843, -1.106755, 3.213042, 1, 1, 1, 1, 1,
0.3710622, -1.014126, 1.97559, 1, 1, 1, 1, 1,
0.3715475, -1.635817, 3.059979, 1, 1, 1, 1, 1,
0.3729467, 1.178982, 0.310412, 1, 1, 1, 1, 1,
0.374944, 0.8167087, 0.5003765, 1, 1, 1, 1, 1,
0.3755862, -1.429425, 3.12552, 1, 1, 1, 1, 1,
0.3764107, -0.3281647, 2.289679, 1, 1, 1, 1, 1,
0.3791758, -0.2991227, 3.569955, 1, 1, 1, 1, 1,
0.3829586, -0.4216273, 1.844565, 1, 1, 1, 1, 1,
0.3890458, -0.1156473, 0.3304496, 1, 1, 1, 1, 1,
0.3998581, 0.6748375, 1.397204, 1, 1, 1, 1, 1,
0.4053692, -0.8642536, 2.907346, 1, 1, 1, 1, 1,
0.4059079, -0.6273269, 1.659922, 0, 0, 1, 1, 1,
0.4116534, -0.932997, 3.66263, 1, 0, 0, 1, 1,
0.4156771, 0.3097288, 2.129675, 1, 0, 0, 1, 1,
0.4168197, -1.34814, 2.242146, 1, 0, 0, 1, 1,
0.4184164, 0.09639229, 3.042248, 1, 0, 0, 1, 1,
0.4186875, 1.73146, -0.5188693, 1, 0, 0, 1, 1,
0.4197057, -0.7004694, 2.373405, 0, 0, 0, 1, 1,
0.420392, -1.801706, 1.698013, 0, 0, 0, 1, 1,
0.4228025, 0.03177378, 2.204788, 0, 0, 0, 1, 1,
0.4242498, 1.969496, 0.9836563, 0, 0, 0, 1, 1,
0.4288054, -0.2967517, 2.628454, 0, 0, 0, 1, 1,
0.429196, -0.07633005, 1.515201, 0, 0, 0, 1, 1,
0.429634, 1.063287, 0.7441146, 0, 0, 0, 1, 1,
0.4301703, -0.5500689, 2.706866, 1, 1, 1, 1, 1,
0.438041, -2.277758, 3.645376, 1, 1, 1, 1, 1,
0.4396997, -0.4631292, 3.236209, 1, 1, 1, 1, 1,
0.4406237, -1.096654, 2.87323, 1, 1, 1, 1, 1,
0.4432121, 0.5629262, 0.1131612, 1, 1, 1, 1, 1,
0.4437006, -0.56117, 2.250553, 1, 1, 1, 1, 1,
0.4454914, 0.5307644, -0.6636288, 1, 1, 1, 1, 1,
0.4485116, 0.1505164, -0.6673344, 1, 1, 1, 1, 1,
0.4502891, -0.1921196, 2.052433, 1, 1, 1, 1, 1,
0.4542688, -1.517075, 1.987876, 1, 1, 1, 1, 1,
0.4660035, 0.9387466, 1.316745, 1, 1, 1, 1, 1,
0.4712961, 0.2237731, 0.8716408, 1, 1, 1, 1, 1,
0.4715987, 0.3056034, 1.708881, 1, 1, 1, 1, 1,
0.4732552, 0.1758802, -0.01843054, 1, 1, 1, 1, 1,
0.4754567, 1.038352, 0.3522925, 1, 1, 1, 1, 1,
0.4762253, -1.73427, 3.57303, 0, 0, 1, 1, 1,
0.4810191, 1.897254, -0.3727958, 1, 0, 0, 1, 1,
0.4814863, 0.6318326, 0.7608798, 1, 0, 0, 1, 1,
0.4876813, -1.259308, 2.771831, 1, 0, 0, 1, 1,
0.490562, 0.9817284, -0.5577635, 1, 0, 0, 1, 1,
0.4914662, 0.265286, 1.005785, 1, 0, 0, 1, 1,
0.4982317, -1.814376, 2.23967, 0, 0, 0, 1, 1,
0.4983959, -2.103911, 3.678502, 0, 0, 0, 1, 1,
0.4989765, -0.2008089, 1.957683, 0, 0, 0, 1, 1,
0.4990377, 0.3571174, -0.6085666, 0, 0, 0, 1, 1,
0.4992534, -0.1973693, 0.5111777, 0, 0, 0, 1, 1,
0.4994026, -0.8694347, 3.635377, 0, 0, 0, 1, 1,
0.5043284, -0.3141642, 2.512809, 0, 0, 0, 1, 1,
0.506126, 0.0857892, 1.04945, 1, 1, 1, 1, 1,
0.507224, -1.028752, 4.601934, 1, 1, 1, 1, 1,
0.508348, -0.6252662, 1.987117, 1, 1, 1, 1, 1,
0.5109192, -1.843468, 3.777685, 1, 1, 1, 1, 1,
0.5164, 1.483014, 1.110911, 1, 1, 1, 1, 1,
0.5215266, 0.5923833, -0.3108351, 1, 1, 1, 1, 1,
0.5321764, -0.100749, 1.957408, 1, 1, 1, 1, 1,
0.5322399, 0.2260424, 2.182511, 1, 1, 1, 1, 1,
0.5322567, 0.3625389, 0.8234899, 1, 1, 1, 1, 1,
0.5347329, 0.5559138, 2.219456, 1, 1, 1, 1, 1,
0.5362517, -0.445064, 2.373873, 1, 1, 1, 1, 1,
0.5362754, -0.9490818, 2.194007, 1, 1, 1, 1, 1,
0.5395844, -0.7308573, 3.267516, 1, 1, 1, 1, 1,
0.5458243, -0.4401852, 1.186924, 1, 1, 1, 1, 1,
0.5496849, 1.844855, -0.2063406, 1, 1, 1, 1, 1,
0.5509932, 0.9491488, -1.155008, 0, 0, 1, 1, 1,
0.5514677, -1.818614, 1.7182, 1, 0, 0, 1, 1,
0.5548771, 0.2086649, 1.905405, 1, 0, 0, 1, 1,
0.5575821, -1.297558, 0.8157227, 1, 0, 0, 1, 1,
0.5580991, -1.407466, 3.055086, 1, 0, 0, 1, 1,
0.5661134, -0.2588238, 2.709288, 1, 0, 0, 1, 1,
0.5714864, -1.565593, 2.352823, 0, 0, 0, 1, 1,
0.5716608, -0.4242046, 4.267395, 0, 0, 0, 1, 1,
0.5732071, -1.010116, 3.839373, 0, 0, 0, 1, 1,
0.5843978, 1.226661, 2.683757, 0, 0, 0, 1, 1,
0.5887337, 1.536654, 0.8494138, 0, 0, 0, 1, 1,
0.5890619, -0.7208572, 2.824301, 0, 0, 0, 1, 1,
0.5907121, -1.154604, 1.637234, 0, 0, 0, 1, 1,
0.5932834, 0.1990291, 1.613741, 1, 1, 1, 1, 1,
0.5935053, 1.821605, -1.251834, 1, 1, 1, 1, 1,
0.5936851, -0.2629768, 1.43033, 1, 1, 1, 1, 1,
0.5988947, -0.01181277, 0.4913343, 1, 1, 1, 1, 1,
0.6060287, 0.018645, 0.3197206, 1, 1, 1, 1, 1,
0.6133122, 0.5021404, 0.2262517, 1, 1, 1, 1, 1,
0.6185341, 0.1459981, 0.1302187, 1, 1, 1, 1, 1,
0.6225256, 0.1845883, 2.075576, 1, 1, 1, 1, 1,
0.623561, -0.519851, 2.148041, 1, 1, 1, 1, 1,
0.6266956, 1.159179, 2.605826, 1, 1, 1, 1, 1,
0.6306188, -1.668239, 0.1053024, 1, 1, 1, 1, 1,
0.6321146, -0.4866148, 0.7527131, 1, 1, 1, 1, 1,
0.6341857, 0.4087105, 1.057403, 1, 1, 1, 1, 1,
0.6440759, 0.5964231, 2.682601, 1, 1, 1, 1, 1,
0.6485576, -0.4492075, 3.900558, 1, 1, 1, 1, 1,
0.6568495, 0.135334, -0.9993927, 0, 0, 1, 1, 1,
0.6586355, -0.685523, 2.654721, 1, 0, 0, 1, 1,
0.6601153, 1.853937, 1.251763, 1, 0, 0, 1, 1,
0.6629111, 1.075501, 0.3590233, 1, 0, 0, 1, 1,
0.6637927, 1.180785, -0.3927204, 1, 0, 0, 1, 1,
0.6661708, 0.8692555, -0.001952902, 1, 0, 0, 1, 1,
0.6681544, 1.094739, 0.9814703, 0, 0, 0, 1, 1,
0.668407, -0.4977438, 1.626506, 0, 0, 0, 1, 1,
0.6700078, 0.2529438, 1.547455, 0, 0, 0, 1, 1,
0.6725282, -0.7825289, 2.969547, 0, 0, 0, 1, 1,
0.6739855, -0.1835885, 2.323288, 0, 0, 0, 1, 1,
0.6744028, 0.5245717, 2.097543, 0, 0, 0, 1, 1,
0.6765408, -1.009974, 1.596211, 0, 0, 0, 1, 1,
0.6782283, -1.249624, 2.242155, 1, 1, 1, 1, 1,
0.6845817, -1.125912, 2.947816, 1, 1, 1, 1, 1,
0.6887999, 0.2840121, 0.7028745, 1, 1, 1, 1, 1,
0.6953899, -0.2881249, 2.266521, 1, 1, 1, 1, 1,
0.695727, -0.3962154, -1.532904, 1, 1, 1, 1, 1,
0.6976715, -0.4065053, 2.497842, 1, 1, 1, 1, 1,
0.6987654, 0.7253838, 1.890102, 1, 1, 1, 1, 1,
0.7058238, -1.67135, 3.065807, 1, 1, 1, 1, 1,
0.7108441, -0.4753213, 2.457529, 1, 1, 1, 1, 1,
0.7128175, -0.2033142, 1.214202, 1, 1, 1, 1, 1,
0.7152756, 0.7009197, 2.802233, 1, 1, 1, 1, 1,
0.7165221, -0.7706782, 0.8440585, 1, 1, 1, 1, 1,
0.7206706, 1.093194, -1.093249, 1, 1, 1, 1, 1,
0.7219097, 0.1741795, 1.991836, 1, 1, 1, 1, 1,
0.7310697, -0.3201872, 3.820511, 1, 1, 1, 1, 1,
0.7311763, 0.4042509, 1.410199, 0, 0, 1, 1, 1,
0.7321426, -0.2611932, 0.588204, 1, 0, 0, 1, 1,
0.7339498, -0.5050852, 1.227833, 1, 0, 0, 1, 1,
0.7361283, 1.586607, 1.207878, 1, 0, 0, 1, 1,
0.7446807, 0.08889104, 1.815524, 1, 0, 0, 1, 1,
0.7447997, -1.371542, 2.923298, 1, 0, 0, 1, 1,
0.7477243, -1.209747, 2.39056, 0, 0, 0, 1, 1,
0.747898, 2.213605, -0.1271116, 0, 0, 0, 1, 1,
0.7536283, 1.184338, 0.03396274, 0, 0, 0, 1, 1,
0.7545267, 0.4603825, 0.6796182, 0, 0, 0, 1, 1,
0.7568941, -1.341844, 4.541778, 0, 0, 0, 1, 1,
0.7599424, -0.7463112, 2.042244, 0, 0, 0, 1, 1,
0.7610045, 0.09471685, 2.456503, 0, 0, 0, 1, 1,
0.7634892, -0.564671, 1.648928, 1, 1, 1, 1, 1,
0.7646554, -0.2668329, 2.186281, 1, 1, 1, 1, 1,
0.7677707, 0.09170493, 2.035653, 1, 1, 1, 1, 1,
0.7703395, -0.5447309, 1.902097, 1, 1, 1, 1, 1,
0.7741813, -0.04041962, 2.322707, 1, 1, 1, 1, 1,
0.7744103, -0.2515346, 2.014215, 1, 1, 1, 1, 1,
0.7826784, -0.7793481, 2.682583, 1, 1, 1, 1, 1,
0.7831859, -1.750223, 3.744104, 1, 1, 1, 1, 1,
0.7863496, -0.9968171, 2.909171, 1, 1, 1, 1, 1,
0.7877229, 0.1656141, 1.228039, 1, 1, 1, 1, 1,
0.789637, 0.06439181, 2.776289, 1, 1, 1, 1, 1,
0.7928078, -1.085621, 3.968796, 1, 1, 1, 1, 1,
0.8000575, 0.2655039, 0.8884714, 1, 1, 1, 1, 1,
0.8030669, -0.5261598, 3.868375, 1, 1, 1, 1, 1,
0.803193, -1.714039, 2.312297, 1, 1, 1, 1, 1,
0.8083875, 0.2441741, 2.124397, 0, 0, 1, 1, 1,
0.8250327, 0.08978228, 1.472774, 1, 0, 0, 1, 1,
0.8307933, -0.07446192, 1.102415, 1, 0, 0, 1, 1,
0.8353159, 0.09960277, 2.1258, 1, 0, 0, 1, 1,
0.8411543, 1.426973, 0.6924767, 1, 0, 0, 1, 1,
0.8455102, -1.254859, 2.978933, 1, 0, 0, 1, 1,
0.8483683, 1.062545, 0.4475474, 0, 0, 0, 1, 1,
0.8517076, 0.3224883, 1.626228, 0, 0, 0, 1, 1,
0.8565992, -0.05747617, -0.1256516, 0, 0, 0, 1, 1,
0.859664, -0.3448799, 2.493372, 0, 0, 0, 1, 1,
0.8620045, 0.4821636, -0.7690955, 0, 0, 0, 1, 1,
0.862978, -0.756152, 2.831741, 0, 0, 0, 1, 1,
0.8685699, 1.607919, 2.054979, 0, 0, 0, 1, 1,
0.8705382, 1.50175, -1.389349, 1, 1, 1, 1, 1,
0.8707108, -0.3665417, 1.020483, 1, 1, 1, 1, 1,
0.8718555, 0.06343815, -0.1594247, 1, 1, 1, 1, 1,
0.8769821, 0.9886388, 1.404861, 1, 1, 1, 1, 1,
0.8795154, 0.04554776, 2.117426, 1, 1, 1, 1, 1,
0.8842646, 0.5326365, 1.516938, 1, 1, 1, 1, 1,
0.8869023, 0.1746828, 1.507648, 1, 1, 1, 1, 1,
0.8871648, 1.894624, 0.5470846, 1, 1, 1, 1, 1,
0.8941209, 0.7892507, 0.3523446, 1, 1, 1, 1, 1,
0.8942629, -0.08066799, 1.700813, 1, 1, 1, 1, 1,
0.9009155, -1.836839, 2.501746, 1, 1, 1, 1, 1,
0.9016567, -0.2057294, 0.9373577, 1, 1, 1, 1, 1,
0.9056433, -0.08749935, 1.147401, 1, 1, 1, 1, 1,
0.9085981, 1.692062, -0.7806404, 1, 1, 1, 1, 1,
0.9125256, 0.2620542, 0.558929, 1, 1, 1, 1, 1,
0.9232255, 2.304858, 0.5905995, 0, 0, 1, 1, 1,
0.9370798, 0.5823507, 0.05225734, 1, 0, 0, 1, 1,
0.9380075, -0.4297825, 1.609362, 1, 0, 0, 1, 1,
0.9380715, -0.1938826, -1.222106, 1, 0, 0, 1, 1,
0.9420142, -2.903632, 2.690163, 1, 0, 0, 1, 1,
0.9442072, -0.8143027, 3.457174, 1, 0, 0, 1, 1,
0.9503477, 0.9775852, -0.4459895, 0, 0, 0, 1, 1,
0.9519277, -0.2102239, 3.514515, 0, 0, 0, 1, 1,
0.9675024, -1.016815, 2.317245, 0, 0, 0, 1, 1,
0.9679933, 1.180583, 1.884415, 0, 0, 0, 1, 1,
0.9694383, 0.2360801, 0.9843577, 0, 0, 0, 1, 1,
0.9788907, 0.6535848, 1.040746, 0, 0, 0, 1, 1,
0.9790587, 0.9563244, 1.021496, 0, 0, 0, 1, 1,
0.9827272, -0.6583095, 1.782747, 1, 1, 1, 1, 1,
0.9831029, -0.6490858, 2.590267, 1, 1, 1, 1, 1,
0.9897074, 1.306705, -0.3908398, 1, 1, 1, 1, 1,
0.9922968, -0.4340283, 1.034617, 1, 1, 1, 1, 1,
0.9980717, 0.4310761, 0.1620931, 1, 1, 1, 1, 1,
0.9989322, -0.3217284, 1.470485, 1, 1, 1, 1, 1,
1.019727, -0.522147, 2.332842, 1, 1, 1, 1, 1,
1.024708, -0.8991117, 1.453635, 1, 1, 1, 1, 1,
1.028957, -1.248616, 2.618815, 1, 1, 1, 1, 1,
1.033846, 1.536483, 1.081114, 1, 1, 1, 1, 1,
1.034729, -1.578738, 3.987383, 1, 1, 1, 1, 1,
1.036665, -1.403324, 1.011567, 1, 1, 1, 1, 1,
1.037281, -0.3751514, 2.978567, 1, 1, 1, 1, 1,
1.042306, -0.4020771, 2.251679, 1, 1, 1, 1, 1,
1.050977, -1.096295, 2.720981, 1, 1, 1, 1, 1,
1.052909, -1.279179, 2.197702, 0, 0, 1, 1, 1,
1.06031, -0.4142355, 3.19733, 1, 0, 0, 1, 1,
1.062976, -0.03873564, 0.3341869, 1, 0, 0, 1, 1,
1.064056, -0.4315665, 2.219321, 1, 0, 0, 1, 1,
1.066891, 1.031083, 1.023619, 1, 0, 0, 1, 1,
1.078464, 1.357408, -0.7620789, 1, 0, 0, 1, 1,
1.080619, -0.2879481, 1.836039, 0, 0, 0, 1, 1,
1.085562, 1.382337, -1.446936, 0, 0, 0, 1, 1,
1.090488, -2.312933, 1.836274, 0, 0, 0, 1, 1,
1.120575, -0.2061316, 3.71835, 0, 0, 0, 1, 1,
1.134083, 0.2226361, 1.977585, 0, 0, 0, 1, 1,
1.134087, 0.8994622, 1.519044, 0, 0, 0, 1, 1,
1.134668, 0.3000338, 1.891599, 0, 0, 0, 1, 1,
1.143132, -0.922989, 2.750561, 1, 1, 1, 1, 1,
1.143637, 0.627484, -0.04620865, 1, 1, 1, 1, 1,
1.147662, -1.180744, 4.401483, 1, 1, 1, 1, 1,
1.14824, -1.359769, -0.02884127, 1, 1, 1, 1, 1,
1.148681, 0.003929714, 0.5040355, 1, 1, 1, 1, 1,
1.150638, 0.9990758, -0.07139966, 1, 1, 1, 1, 1,
1.156399, 0.5013626, -0.98432, 1, 1, 1, 1, 1,
1.160384, 1.3162, 1.120413, 1, 1, 1, 1, 1,
1.164953, 0.2160114, 1.644338, 1, 1, 1, 1, 1,
1.173245, 1.272703, 0.6981117, 1, 1, 1, 1, 1,
1.179584, 0.2982309, 3.349493, 1, 1, 1, 1, 1,
1.189098, -0.03165165, 1.266641, 1, 1, 1, 1, 1,
1.191105, -0.8677039, 1.175605, 1, 1, 1, 1, 1,
1.200527, -0.2085999, 2.472547, 1, 1, 1, 1, 1,
1.204227, 0.5378913, -0.738667, 1, 1, 1, 1, 1,
1.206502, 0.7761061, 1.244112, 0, 0, 1, 1, 1,
1.213825, 0.1783746, 1.244509, 1, 0, 0, 1, 1,
1.215979, -0.8087403, 2.663767, 1, 0, 0, 1, 1,
1.217094, 0.8288841, -0.7486829, 1, 0, 0, 1, 1,
1.218206, -1.518249, 1.688712, 1, 0, 0, 1, 1,
1.218621, 0.2981902, 1.392797, 1, 0, 0, 1, 1,
1.228901, -0.4035119, 2.103235, 0, 0, 0, 1, 1,
1.248395, 1.139184, -0.456263, 0, 0, 0, 1, 1,
1.251886, -0.04673237, 2.456458, 0, 0, 0, 1, 1,
1.252631, -0.5037501, 1.573735, 0, 0, 0, 1, 1,
1.254285, 1.231318, 1.620327, 0, 0, 0, 1, 1,
1.254492, -0.8214788, 0.7639972, 0, 0, 0, 1, 1,
1.254746, 0.03763027, 2.087913, 0, 0, 0, 1, 1,
1.25915, -0.09797946, 2.196257, 1, 1, 1, 1, 1,
1.262762, 1.136359, 1.327939, 1, 1, 1, 1, 1,
1.264057, -0.4596436, 2.061107, 1, 1, 1, 1, 1,
1.264427, -1.32955, 2.319347, 1, 1, 1, 1, 1,
1.265604, -1.508611, 1.542884, 1, 1, 1, 1, 1,
1.265987, -0.1566772, 2.299512, 1, 1, 1, 1, 1,
1.270023, 0.420929, 0.6342546, 1, 1, 1, 1, 1,
1.282363, -0.5764472, 2.704399, 1, 1, 1, 1, 1,
1.283323, -0.2896677, 1.002056, 1, 1, 1, 1, 1,
1.293618, -1.654013, 2.131111, 1, 1, 1, 1, 1,
1.297516, 1.706324, -0.1288003, 1, 1, 1, 1, 1,
1.303463, 0.7107063, 1.35972, 1, 1, 1, 1, 1,
1.30645, -0.7366884, 0.312735, 1, 1, 1, 1, 1,
1.310445, 0.6567291, -1.491659, 1, 1, 1, 1, 1,
1.315404, 0.3615752, 1.259774, 1, 1, 1, 1, 1,
1.323435, -0.02467044, 3.215514, 0, 0, 1, 1, 1,
1.325632, -0.2667978, 3.025609, 1, 0, 0, 1, 1,
1.332476, 0.9870883, 1.046738, 1, 0, 0, 1, 1,
1.333503, 0.7750054, 1.611576, 1, 0, 0, 1, 1,
1.350189, -0.2406756, 2.00244, 1, 0, 0, 1, 1,
1.353294, -1.215262, 3.426498, 1, 0, 0, 1, 1,
1.365578, -1.449649, 1.510888, 0, 0, 0, 1, 1,
1.368678, 0.8420656, 2.310721, 0, 0, 0, 1, 1,
1.36983, 0.1789975, 0.6085374, 0, 0, 0, 1, 1,
1.375724, -0.6635087, 1.433871, 0, 0, 0, 1, 1,
1.382822, -0.2692928, 1.449691, 0, 0, 0, 1, 1,
1.387231, -1.465036, 1.337409, 0, 0, 0, 1, 1,
1.395384, -0.009311346, 0.5229515, 0, 0, 0, 1, 1,
1.399131, -0.6313582, 2.064123, 1, 1, 1, 1, 1,
1.410802, 1.479207, -0.9264673, 1, 1, 1, 1, 1,
1.415604, -0.455132, 2.209713, 1, 1, 1, 1, 1,
1.42487, -0.4854656, 3.413489, 1, 1, 1, 1, 1,
1.445109, -1.679992, 2.352461, 1, 1, 1, 1, 1,
1.445268, -1.189785, 2.262545, 1, 1, 1, 1, 1,
1.449327, -1.073999, 2.568637, 1, 1, 1, 1, 1,
1.449916, -0.418862, 2.81574, 1, 1, 1, 1, 1,
1.454575, 1.763346, 0.3006212, 1, 1, 1, 1, 1,
1.462231, 1.586184, 2.032923, 1, 1, 1, 1, 1,
1.465726, 0.2553214, 2.089266, 1, 1, 1, 1, 1,
1.478091, 0.3229055, -1.316298, 1, 1, 1, 1, 1,
1.499374, -0.7469522, 2.370424, 1, 1, 1, 1, 1,
1.505337, 0.2729566, 1.577732, 1, 1, 1, 1, 1,
1.510428, -0.02196707, 1.572569, 1, 1, 1, 1, 1,
1.543502, -0.234001, 2.676605, 0, 0, 1, 1, 1,
1.550279, 1.541132, 0.2381583, 1, 0, 0, 1, 1,
1.573313, 0.1246873, 1.43349, 1, 0, 0, 1, 1,
1.573974, -1.397363, 2.82359, 1, 0, 0, 1, 1,
1.576375, -1.295952, 1.87086, 1, 0, 0, 1, 1,
1.583915, 0.3085063, 2.035094, 1, 0, 0, 1, 1,
1.588323, 1.243356, 0.1399573, 0, 0, 0, 1, 1,
1.617207, 0.233308, 0.7842783, 0, 0, 0, 1, 1,
1.630433, 0.3360237, 0.7144055, 0, 0, 0, 1, 1,
1.632608, -0.211435, 3.387947, 0, 0, 0, 1, 1,
1.632648, -1.898495, 2.694059, 0, 0, 0, 1, 1,
1.639808, -0.2218851, 0.4333249, 0, 0, 0, 1, 1,
1.6474, -1.445933, 3.323468, 0, 0, 0, 1, 1,
1.651477, -0.2695019, 1.24839, 1, 1, 1, 1, 1,
1.657385, 0.7399632, 1.813308, 1, 1, 1, 1, 1,
1.68232, -0.1845915, 2.108554, 1, 1, 1, 1, 1,
1.687471, -0.1303584, 1.596709, 1, 1, 1, 1, 1,
1.688494, -2.345305, 4.688901, 1, 1, 1, 1, 1,
1.70574, -0.4832196, 3.165168, 1, 1, 1, 1, 1,
1.707023, -0.2563058, 1.060345, 1, 1, 1, 1, 1,
1.710832, 1.173151, 1.402215, 1, 1, 1, 1, 1,
1.731846, -0.3560574, 3.815383, 1, 1, 1, 1, 1,
1.735107, 0.9234857, 1.868877, 1, 1, 1, 1, 1,
1.739465, 1.762677, 0.2405154, 1, 1, 1, 1, 1,
1.747664, -0.2099267, 2.187054, 1, 1, 1, 1, 1,
1.759723, -1.20212, 2.498247, 1, 1, 1, 1, 1,
1.762342, 0.6574229, 2.279316, 1, 1, 1, 1, 1,
1.770417, 0.3329196, 0.8026408, 1, 1, 1, 1, 1,
1.78248, -0.1399408, 2.677968, 0, 0, 1, 1, 1,
1.785716, -0.8888096, 1.612584, 1, 0, 0, 1, 1,
1.787818, -0.4018904, 2.239006, 1, 0, 0, 1, 1,
1.797364, -0.268219, 3.11515, 1, 0, 0, 1, 1,
1.804825, -0.6694347, 0.7546329, 1, 0, 0, 1, 1,
1.804942, -0.4418708, 4.131181, 1, 0, 0, 1, 1,
1.815731, 0.7754344, 0.7837061, 0, 0, 0, 1, 1,
1.819296, 1.174515, 1.328265, 0, 0, 0, 1, 1,
1.830284, -0.72425, 1.15712, 0, 0, 0, 1, 1,
1.839135, 0.3376687, 0.5856827, 0, 0, 0, 1, 1,
1.867828, 0.4122272, 1.684292, 0, 0, 0, 1, 1,
1.8688, 2.001615, -0.1140881, 0, 0, 0, 1, 1,
1.889994, 0.6434249, 0.7775421, 0, 0, 0, 1, 1,
1.892353, 0.7928331, 1.510176, 1, 1, 1, 1, 1,
1.90634, -1.118422, 0.7790684, 1, 1, 1, 1, 1,
1.937616, -1.596398, 2.576324, 1, 1, 1, 1, 1,
1.974499, -0.7837141, 2.583018, 1, 1, 1, 1, 1,
2.003549, 1.393172, 2.327276, 1, 1, 1, 1, 1,
2.018137, 1.11087, 1.001764, 1, 1, 1, 1, 1,
2.034524, 0.4294665, 1.626088, 1, 1, 1, 1, 1,
2.046717, 1.460759, 1.646214, 1, 1, 1, 1, 1,
2.063717, 0.4189821, 1.262112, 1, 1, 1, 1, 1,
2.070963, 0.9209346, -0.08793429, 1, 1, 1, 1, 1,
2.130928, 0.7966457, 2.140927, 1, 1, 1, 1, 1,
2.141006, 0.6438235, 1.488332, 1, 1, 1, 1, 1,
2.15687, 0.6220196, 1.496292, 1, 1, 1, 1, 1,
2.18632, 0.7618497, 1.384093, 1, 1, 1, 1, 1,
2.205705, -0.4351146, 1.042632, 1, 1, 1, 1, 1,
2.248257, -0.3067077, 1.186755, 0, 0, 1, 1, 1,
2.309843, -0.2989087, 0.1663943, 1, 0, 0, 1, 1,
2.37198, 0.5076486, -0.1654287, 1, 0, 0, 1, 1,
2.393322, -0.7908015, 1.380684, 1, 0, 0, 1, 1,
2.425174, -0.7683033, 2.357043, 1, 0, 0, 1, 1,
2.46103, -1.586699, 2.769491, 1, 0, 0, 1, 1,
2.462133, -0.675477, -0.05603021, 0, 0, 0, 1, 1,
2.48919, -0.4165374, 2.669441, 0, 0, 0, 1, 1,
2.510967, 0.06500749, 2.289922, 0, 0, 0, 1, 1,
2.513059, -0.8212731, 3.144947, 0, 0, 0, 1, 1,
2.609551, 1.247651, 0.3866272, 0, 0, 0, 1, 1,
2.61389, 2.074403, 0.4798799, 0, 0, 0, 1, 1,
2.641605, -2.695799, 1.677681, 0, 0, 0, 1, 1,
2.705263, 1.211123, -1.388689, 1, 1, 1, 1, 1,
2.794588, 0.418071, 1.856163, 1, 1, 1, 1, 1,
2.81534, -0.609504, 2.776113, 1, 1, 1, 1, 1,
2.824111, 1.670821, 1.538974, 1, 1, 1, 1, 1,
2.897864, 1.684303, -0.5556767, 1, 1, 1, 1, 1,
2.984843, -0.003209441, 1.456534, 1, 1, 1, 1, 1,
3.560901, 0.4233795, 1.269077, 1, 1, 1, 1, 1
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
var radius = 10.16376;
var distance = 35.69979;
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
mvMatrix.translate( 0.04835939, 0.2820153, 0.4194746 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.69979);
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
