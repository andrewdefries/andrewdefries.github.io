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
-4.041068, -0.02964293, 0.5442119, 1, 0, 0, 1,
-3.023559, -0.9413865, -1.386378, 1, 0.007843138, 0, 1,
-2.911804, -1.026948, -2.614371, 1, 0.01176471, 0, 1,
-2.902266, 0.8348337, -1.48122, 1, 0.01960784, 0, 1,
-2.736748, -0.04487571, -2.121008, 1, 0.02352941, 0, 1,
-2.550116, 1.143441, -1.686657, 1, 0.03137255, 0, 1,
-2.435764, -1.618891, -1.79304, 1, 0.03529412, 0, 1,
-2.424207, -0.7817021, -2.298243, 1, 0.04313726, 0, 1,
-2.395892, -0.2959076, -3.825553, 1, 0.04705882, 0, 1,
-2.379557, -1.053647, -1.63515, 1, 0.05490196, 0, 1,
-2.36435, -0.0418952, -2.255285, 1, 0.05882353, 0, 1,
-2.34131, 1.63257, 0.554564, 1, 0.06666667, 0, 1,
-2.323788, -0.2165433, -0.4913558, 1, 0.07058824, 0, 1,
-2.317058, 0.6089699, -2.221254, 1, 0.07843138, 0, 1,
-2.246095, 1.556914, -1.383649, 1, 0.08235294, 0, 1,
-2.234443, -0.06975506, 0.01398028, 1, 0.09019608, 0, 1,
-2.158977, 0.1561804, -1.864451, 1, 0.09411765, 0, 1,
-2.080652, 1.517563, -1.648289, 1, 0.1019608, 0, 1,
-2.073303, 0.8358039, -0.6120593, 1, 0.1098039, 0, 1,
-2.069989, -2.043881, -2.946002, 1, 0.1137255, 0, 1,
-2.040107, 2.024039, 0.1507897, 1, 0.1215686, 0, 1,
-2.025707, -0.06427476, -1.030817, 1, 0.1254902, 0, 1,
-2.015459, -0.4551533, -2.173876, 1, 0.1333333, 0, 1,
-2.011767, -1.758206, -3.647819, 1, 0.1372549, 0, 1,
-1.991177, 0.4352681, -1.579715, 1, 0.145098, 0, 1,
-1.991091, -0.1552883, -1.95577, 1, 0.1490196, 0, 1,
-1.988698, 0.06511203, -2.141822, 1, 0.1568628, 0, 1,
-1.924714, 1.586359, -0.279969, 1, 0.1607843, 0, 1,
-1.910966, -0.07614705, -1.530707, 1, 0.1686275, 0, 1,
-1.903207, 0.3348252, -1.515481, 1, 0.172549, 0, 1,
-1.897041, 0.9048583, -1.327208, 1, 0.1803922, 0, 1,
-1.886823, 1.076142, -0.3734287, 1, 0.1843137, 0, 1,
-1.877229, 0.4551492, -1.167199, 1, 0.1921569, 0, 1,
-1.876091, -1.688753, -2.629065, 1, 0.1960784, 0, 1,
-1.87588, -1.205057, -1.660364, 1, 0.2039216, 0, 1,
-1.865879, -0.07973845, -1.609891, 1, 0.2117647, 0, 1,
-1.865722, -0.4162864, -1.501396, 1, 0.2156863, 0, 1,
-1.835796, -0.6640009, -0.6076484, 1, 0.2235294, 0, 1,
-1.804022, -1.285345, -3.056415, 1, 0.227451, 0, 1,
-1.791823, 0.4501677, 1.041158, 1, 0.2352941, 0, 1,
-1.79106, 0.3299043, -0.04498398, 1, 0.2392157, 0, 1,
-1.779045, -0.5325321, -2.691888, 1, 0.2470588, 0, 1,
-1.772822, 1.882558, -2.338017, 1, 0.2509804, 0, 1,
-1.767818, -0.06927378, -1.456763, 1, 0.2588235, 0, 1,
-1.761174, -0.7587233, -1.94726, 1, 0.2627451, 0, 1,
-1.752289, 0.9223198, -2.134866, 1, 0.2705882, 0, 1,
-1.74522, 1.462952, -0.4905564, 1, 0.2745098, 0, 1,
-1.730882, 2.347302, -3.111696, 1, 0.282353, 0, 1,
-1.717153, -0.5419575, -1.864838, 1, 0.2862745, 0, 1,
-1.716725, 0.6400429, -1.213791, 1, 0.2941177, 0, 1,
-1.708814, 0.5355178, -1.490514, 1, 0.3019608, 0, 1,
-1.7054, -0.6586626, -1.556221, 1, 0.3058824, 0, 1,
-1.685955, -0.5849257, -1.437998, 1, 0.3137255, 0, 1,
-1.672373, 0.4473261, -1.29806, 1, 0.3176471, 0, 1,
-1.642006, 1.716147, -1.533544, 1, 0.3254902, 0, 1,
-1.631528, -0.4001594, -0.3102861, 1, 0.3294118, 0, 1,
-1.624954, 1.67751, -1.429285, 1, 0.3372549, 0, 1,
-1.623077, -0.2527241, -1.179507, 1, 0.3411765, 0, 1,
-1.619423, 0.7723381, -1.286451, 1, 0.3490196, 0, 1,
-1.61874, 0.4891667, -1.974256, 1, 0.3529412, 0, 1,
-1.610345, -0.9778993, -2.106659, 1, 0.3607843, 0, 1,
-1.609978, -0.4519782, -1.754757, 1, 0.3647059, 0, 1,
-1.589405, -1.060999, -1.588899, 1, 0.372549, 0, 1,
-1.572937, -0.3072976, -1.395868, 1, 0.3764706, 0, 1,
-1.565219, 0.314099, 0.05918724, 1, 0.3843137, 0, 1,
-1.559423, 0.8792024, -2.556254, 1, 0.3882353, 0, 1,
-1.553693, 1.726023, -1.282399, 1, 0.3960784, 0, 1,
-1.550013, -0.4462384, -1.708909, 1, 0.4039216, 0, 1,
-1.549946, -0.3241855, -2.80369, 1, 0.4078431, 0, 1,
-1.534606, 0.9397256, -0.5830234, 1, 0.4156863, 0, 1,
-1.525079, -0.8490461, -2.710768, 1, 0.4196078, 0, 1,
-1.509437, -0.9958182, -1.15966, 1, 0.427451, 0, 1,
-1.508097, -0.3080982, -0.6362841, 1, 0.4313726, 0, 1,
-1.503876, -0.0493866, -2.173846, 1, 0.4392157, 0, 1,
-1.501639, -0.6792971, -1.33355, 1, 0.4431373, 0, 1,
-1.500378, -0.592475, -1.28317, 1, 0.4509804, 0, 1,
-1.490613, -0.4732184, -1.903055, 1, 0.454902, 0, 1,
-1.472746, 0.01607545, -2.497962, 1, 0.4627451, 0, 1,
-1.46817, 0.4480684, -1.491729, 1, 0.4666667, 0, 1,
-1.463749, 1.123587, 0.2889424, 1, 0.4745098, 0, 1,
-1.457715, -0.3349375, -2.114027, 1, 0.4784314, 0, 1,
-1.439485, 1.128016, -0.5896475, 1, 0.4862745, 0, 1,
-1.420677, -0.05897909, -1.658039, 1, 0.4901961, 0, 1,
-1.416304, -0.4416424, -2.182848, 1, 0.4980392, 0, 1,
-1.413346, 0.4489978, -1.174929, 1, 0.5058824, 0, 1,
-1.408862, -0.1635818, 0.06475249, 1, 0.509804, 0, 1,
-1.402664, 1.041381, -0.8660917, 1, 0.5176471, 0, 1,
-1.40243, 0.07617645, -0.7664025, 1, 0.5215687, 0, 1,
-1.395858, -0.05766028, -1.359537, 1, 0.5294118, 0, 1,
-1.388941, -0.02818173, -2.777245, 1, 0.5333334, 0, 1,
-1.381515, 1.345887, 1.805105, 1, 0.5411765, 0, 1,
-1.379459, 0.1923963, -2.436646, 1, 0.5450981, 0, 1,
-1.379339, 1.065962, -0.008274249, 1, 0.5529412, 0, 1,
-1.379043, -0.1329855, -2.132513, 1, 0.5568628, 0, 1,
-1.377831, -0.2013723, -2.188967, 1, 0.5647059, 0, 1,
-1.372424, 0.4339174, -0.9818389, 1, 0.5686275, 0, 1,
-1.363478, 0.145811, -1.853813, 1, 0.5764706, 0, 1,
-1.362973, 1.621734, -1.13885, 1, 0.5803922, 0, 1,
-1.358666, 0.276104, -3.580034, 1, 0.5882353, 0, 1,
-1.349962, -1.017885, -1.710708, 1, 0.5921569, 0, 1,
-1.349837, -0.2918066, -0.3541494, 1, 0.6, 0, 1,
-1.349061, -0.8284565, -2.693054, 1, 0.6078432, 0, 1,
-1.348146, 0.08847183, -2.610615, 1, 0.6117647, 0, 1,
-1.341662, 1.542769, -0.04029915, 1, 0.6196079, 0, 1,
-1.33662, -0.009580794, 0.02728539, 1, 0.6235294, 0, 1,
-1.327993, 1.490247, -0.3345423, 1, 0.6313726, 0, 1,
-1.323674, -0.7593384, -1.229399, 1, 0.6352941, 0, 1,
-1.297094, 0.9063713, -2.185655, 1, 0.6431373, 0, 1,
-1.293062, -0.7029225, -3.006798, 1, 0.6470588, 0, 1,
-1.291976, 0.266451, -1.350745, 1, 0.654902, 0, 1,
-1.281882, 0.3170122, -0.6091348, 1, 0.6588235, 0, 1,
-1.278796, -1.149428, -0.7874271, 1, 0.6666667, 0, 1,
-1.268508, 0.3146592, -0.08802065, 1, 0.6705883, 0, 1,
-1.265401, -1.891532, -4.626432, 1, 0.6784314, 0, 1,
-1.25788, 1.110198, -1.5301, 1, 0.682353, 0, 1,
-1.250928, -1.241705, -3.774659, 1, 0.6901961, 0, 1,
-1.246279, -0.08585327, -3.327718, 1, 0.6941177, 0, 1,
-1.224902, 1.904978, -1.209301, 1, 0.7019608, 0, 1,
-1.220329, -0.4679596, -0.9902189, 1, 0.7098039, 0, 1,
-1.219696, 2.561709, 0.4077356, 1, 0.7137255, 0, 1,
-1.204312, 1.290457, 2.038043, 1, 0.7215686, 0, 1,
-1.199691, -1.904979, -3.224552, 1, 0.7254902, 0, 1,
-1.198036, -1.11508, -3.653739, 1, 0.7333333, 0, 1,
-1.194613, -1.418306, -4.152992, 1, 0.7372549, 0, 1,
-1.183121, -0.6890166, -0.6955673, 1, 0.7450981, 0, 1,
-1.17094, 0.7597516, -0.8205935, 1, 0.7490196, 0, 1,
-1.167532, -0.2819278, -0.2709002, 1, 0.7568628, 0, 1,
-1.166487, -1.915056, -1.319596, 1, 0.7607843, 0, 1,
-1.162748, -0.2255746, 0.3469833, 1, 0.7686275, 0, 1,
-1.159839, 0.3585103, 0.1849968, 1, 0.772549, 0, 1,
-1.15798, -0.4945667, -0.6276929, 1, 0.7803922, 0, 1,
-1.157812, 0.9350078, -2.356612, 1, 0.7843137, 0, 1,
-1.155738, 0.8251556, -0.3808709, 1, 0.7921569, 0, 1,
-1.155468, 0.1691248, -0.1929095, 1, 0.7960784, 0, 1,
-1.149723, 0.6511836, 1.779908, 1, 0.8039216, 0, 1,
-1.135656, 0.496213, -1.148056, 1, 0.8117647, 0, 1,
-1.128214, 0.7645943, 0.1217347, 1, 0.8156863, 0, 1,
-1.121088, -0.5620264, -0.921168, 1, 0.8235294, 0, 1,
-1.118599, 0.6091402, -1.40881, 1, 0.827451, 0, 1,
-1.116808, -0.4514855, -1.929798, 1, 0.8352941, 0, 1,
-1.116338, -0.5330914, -1.430169, 1, 0.8392157, 0, 1,
-1.116288, -1.288031, -1.498509, 1, 0.8470588, 0, 1,
-1.113913, -0.09829798, -2.584735, 1, 0.8509804, 0, 1,
-1.112777, -1.353226, -1.442083, 1, 0.8588235, 0, 1,
-1.112651, 0.8183597, -1.562701, 1, 0.8627451, 0, 1,
-1.111556, -0.2884213, -1.680345, 1, 0.8705882, 0, 1,
-1.101774, 1.595264, -2.033567, 1, 0.8745098, 0, 1,
-1.098035, 0.7179214, -1.045413, 1, 0.8823529, 0, 1,
-1.087499, 2.491596, -0.1239546, 1, 0.8862745, 0, 1,
-1.085294, 1.389936, 0.7050346, 1, 0.8941177, 0, 1,
-1.085161, 0.7536879, -1.046859, 1, 0.8980392, 0, 1,
-1.084124, 0.4642789, 0.001868864, 1, 0.9058824, 0, 1,
-1.076426, -0.3590812, -3.592005, 1, 0.9137255, 0, 1,
-1.070324, 0.5510238, 0.5740227, 1, 0.9176471, 0, 1,
-1.065434, 0.08582582, -0.6033918, 1, 0.9254902, 0, 1,
-1.062202, 0.7486674, -0.7272345, 1, 0.9294118, 0, 1,
-1.057141, 0.01820354, -3.834481, 1, 0.9372549, 0, 1,
-1.053249, 0.7243843, -1.429839, 1, 0.9411765, 0, 1,
-1.050774, -0.2798399, -2.620232, 1, 0.9490196, 0, 1,
-1.050012, 0.4273119, -1.889297, 1, 0.9529412, 0, 1,
-1.044503, -1.151278, -0.6543778, 1, 0.9607843, 0, 1,
-1.043131, -1.02221, -1.735682, 1, 0.9647059, 0, 1,
-1.041072, 0.9105386, 0.2343617, 1, 0.972549, 0, 1,
-1.037618, -0.7550839, -4.718373, 1, 0.9764706, 0, 1,
-1.037143, 1.754414, -0.5267489, 1, 0.9843137, 0, 1,
-1.021547, -1.320155, -3.221007, 1, 0.9882353, 0, 1,
-1.012621, 0.4292257, -3.443724, 1, 0.9960784, 0, 1,
-1.002618, -0.07237855, -2.456327, 0.9960784, 1, 0, 1,
-0.9987342, -2.911961, -2.911523, 0.9921569, 1, 0, 1,
-0.99334, -1.904856, -1.321393, 0.9843137, 1, 0, 1,
-0.9929489, -1.008951, -3.186614, 0.9803922, 1, 0, 1,
-0.9921635, 1.824431, -2.399803, 0.972549, 1, 0, 1,
-0.9892812, -1.126593, -3.140665, 0.9686275, 1, 0, 1,
-0.9868292, -0.1968552, -0.7401928, 0.9607843, 1, 0, 1,
-0.9815305, 1.916472, -0.6766047, 0.9568627, 1, 0, 1,
-0.9735135, -0.02962845, -1.54549, 0.9490196, 1, 0, 1,
-0.9700863, -0.6177636, -1.386056, 0.945098, 1, 0, 1,
-0.9687279, 0.7178766, -0.7115833, 0.9372549, 1, 0, 1,
-0.96782, 0.2567562, -1.224943, 0.9333333, 1, 0, 1,
-0.9636761, -1.655672, -1.400247, 0.9254902, 1, 0, 1,
-0.9626505, 0.9884885, -0.7356184, 0.9215686, 1, 0, 1,
-0.9590049, 0.1969341, -2.119251, 0.9137255, 1, 0, 1,
-0.9575808, -1.011211, -1.927886, 0.9098039, 1, 0, 1,
-0.9575521, 0.4566279, 0.06209506, 0.9019608, 1, 0, 1,
-0.9468756, 1.936575, -0.6687068, 0.8941177, 1, 0, 1,
-0.9447436, 0.1512347, -1.714338, 0.8901961, 1, 0, 1,
-0.9396931, -0.2806247, -1.971811, 0.8823529, 1, 0, 1,
-0.9385744, -2.008342, -2.92469, 0.8784314, 1, 0, 1,
-0.9371198, -1.88307, -3.025192, 0.8705882, 1, 0, 1,
-0.9336842, 1.884866, -0.006363608, 0.8666667, 1, 0, 1,
-0.9297025, 0.2424, 0.2650183, 0.8588235, 1, 0, 1,
-0.927028, -0.5528465, -1.395625, 0.854902, 1, 0, 1,
-0.9243458, -0.1582319, -0.8856722, 0.8470588, 1, 0, 1,
-0.921392, -0.4820886, -3.560312, 0.8431373, 1, 0, 1,
-0.918667, 0.4925876, -1.159651, 0.8352941, 1, 0, 1,
-0.9184765, -0.3682082, -2.09204, 0.8313726, 1, 0, 1,
-0.9136234, 0.9664657, -1.334666, 0.8235294, 1, 0, 1,
-0.906361, -0.08726096, -1.812481, 0.8196079, 1, 0, 1,
-0.9038608, -0.8519718, -2.502743, 0.8117647, 1, 0, 1,
-0.8957471, -0.2042172, -2.231764, 0.8078431, 1, 0, 1,
-0.8868693, 0.5383804, -2.384076, 0.8, 1, 0, 1,
-0.8803196, -0.1049578, -0.8849885, 0.7921569, 1, 0, 1,
-0.8793467, -0.4392794, -1.631067, 0.7882353, 1, 0, 1,
-0.8760666, -0.2525194, -1.396162, 0.7803922, 1, 0, 1,
-0.875352, -0.07846132, -0.8283561, 0.7764706, 1, 0, 1,
-0.8664603, -0.4034499, -0.7208639, 0.7686275, 1, 0, 1,
-0.8661391, 0.2530341, -0.4382559, 0.7647059, 1, 0, 1,
-0.8589906, 0.8367447, -0.3385684, 0.7568628, 1, 0, 1,
-0.8585022, 2.156107, -1.473614, 0.7529412, 1, 0, 1,
-0.8499417, -0.224209, -2.740978, 0.7450981, 1, 0, 1,
-0.8472704, -0.3085154, 0.3915998, 0.7411765, 1, 0, 1,
-0.8388834, -0.419882, -1.913068, 0.7333333, 1, 0, 1,
-0.8363422, 0.3779789, -1.462694, 0.7294118, 1, 0, 1,
-0.830209, -0.5502853, -1.254476, 0.7215686, 1, 0, 1,
-0.8275942, -1.378615, -2.387285, 0.7176471, 1, 0, 1,
-0.8242431, 0.5530537, -1.068898, 0.7098039, 1, 0, 1,
-0.81879, -0.7863891, -2.175714, 0.7058824, 1, 0, 1,
-0.8183894, -0.1906236, -1.482184, 0.6980392, 1, 0, 1,
-0.8171206, 1.761905, -0.07218535, 0.6901961, 1, 0, 1,
-0.8162913, 0.6849577, -0.5905465, 0.6862745, 1, 0, 1,
-0.8145139, 0.1316776, -1.490594, 0.6784314, 1, 0, 1,
-0.8142522, -0.9436824, -3.410957, 0.6745098, 1, 0, 1,
-0.8057539, 0.2695432, 0.1679811, 0.6666667, 1, 0, 1,
-0.8044429, 0.2175066, 0.7031638, 0.6627451, 1, 0, 1,
-0.8043973, -0.1513546, -1.93902, 0.654902, 1, 0, 1,
-0.8014508, 0.7734186, -0.6196172, 0.6509804, 1, 0, 1,
-0.8002896, 0.4677689, -2.356746, 0.6431373, 1, 0, 1,
-0.7986961, -1.144769, -2.600617, 0.6392157, 1, 0, 1,
-0.7944992, 0.2808275, -1.332455, 0.6313726, 1, 0, 1,
-0.7930208, -0.7649421, -0.7902078, 0.627451, 1, 0, 1,
-0.7926361, 0.4800301, -0.2164624, 0.6196079, 1, 0, 1,
-0.7912862, -0.5526886, -3.034018, 0.6156863, 1, 0, 1,
-0.7865676, -0.431166, -2.823415, 0.6078432, 1, 0, 1,
-0.7841949, 1.383175, -0.7860991, 0.6039216, 1, 0, 1,
-0.7820078, -0.47299, -3.063958, 0.5960785, 1, 0, 1,
-0.7819629, 0.0599873, 0.2370325, 0.5882353, 1, 0, 1,
-0.7809471, 1.372295, -0.07364021, 0.5843138, 1, 0, 1,
-0.7778448, -0.6805418, -0.7482949, 0.5764706, 1, 0, 1,
-0.7758316, 0.2192445, -0.4998959, 0.572549, 1, 0, 1,
-0.7733371, -0.2801775, -1.180187, 0.5647059, 1, 0, 1,
-0.7704965, -0.3175496, -3.245878, 0.5607843, 1, 0, 1,
-0.7650528, 1.927893, 0.3354215, 0.5529412, 1, 0, 1,
-0.7625132, 0.5931346, -0.3353853, 0.5490196, 1, 0, 1,
-0.7625048, -1.25987, -1.194284, 0.5411765, 1, 0, 1,
-0.7537614, -0.9929544, -1.143615, 0.5372549, 1, 0, 1,
-0.7424707, -1.809046, -2.312826, 0.5294118, 1, 0, 1,
-0.7412051, -1.459319, -0.9105468, 0.5254902, 1, 0, 1,
-0.739962, 0.08956578, -2.477367, 0.5176471, 1, 0, 1,
-0.7391038, -1.892559, -2.712079, 0.5137255, 1, 0, 1,
-0.7215895, -0.2209095, -2.312071, 0.5058824, 1, 0, 1,
-0.7133315, -0.1815854, -1.972973, 0.5019608, 1, 0, 1,
-0.713019, 0.913765, -1.94458, 0.4941176, 1, 0, 1,
-0.6992544, 0.2534464, -0.6575848, 0.4862745, 1, 0, 1,
-0.6987607, -1.134053, -2.583518, 0.4823529, 1, 0, 1,
-0.6983901, 0.2882075, -2.496954, 0.4745098, 1, 0, 1,
-0.6954064, 0.7661514, -1.034855, 0.4705882, 1, 0, 1,
-0.6947178, -0.3759222, -2.120725, 0.4627451, 1, 0, 1,
-0.6921869, 0.4052319, -1.79496, 0.4588235, 1, 0, 1,
-0.6885172, 0.9837758, -1.78949, 0.4509804, 1, 0, 1,
-0.6843776, 0.9939696, -0.5164738, 0.4470588, 1, 0, 1,
-0.6807542, 0.007865447, -0.1543383, 0.4392157, 1, 0, 1,
-0.6748804, -2.062639, -2.534645, 0.4352941, 1, 0, 1,
-0.6733261, -0.9817211, -0.832008, 0.427451, 1, 0, 1,
-0.6646364, 0.7870307, -0.977597, 0.4235294, 1, 0, 1,
-0.6552506, 2.579474, 2.209555, 0.4156863, 1, 0, 1,
-0.6498215, -0.7989379, -2.863346, 0.4117647, 1, 0, 1,
-0.6478313, 0.3678433, -0.07368284, 0.4039216, 1, 0, 1,
-0.6454632, 0.2052209, -0.2073278, 0.3960784, 1, 0, 1,
-0.6451429, 0.3922275, -0.6381665, 0.3921569, 1, 0, 1,
-0.6444108, 0.2044797, -1.304498, 0.3843137, 1, 0, 1,
-0.6441778, -0.03950905, -1.541761, 0.3803922, 1, 0, 1,
-0.641676, -1.665981, -4.217028, 0.372549, 1, 0, 1,
-0.6379408, -1.121461, -1.018492, 0.3686275, 1, 0, 1,
-0.6350791, -0.9664742, -2.148711, 0.3607843, 1, 0, 1,
-0.6281568, 0.7402284, -1.15683, 0.3568628, 1, 0, 1,
-0.6277991, -0.1898629, -0.3975762, 0.3490196, 1, 0, 1,
-0.6276734, 1.47741, -1.302428, 0.345098, 1, 0, 1,
-0.6245607, -0.4104316, -1.332147, 0.3372549, 1, 0, 1,
-0.6206564, 1.06832, -0.9156548, 0.3333333, 1, 0, 1,
-0.6190078, -0.07776298, -1.113361, 0.3254902, 1, 0, 1,
-0.616282, -0.5420001, -1.625525, 0.3215686, 1, 0, 1,
-0.6151406, 0.163879, -3.38376, 0.3137255, 1, 0, 1,
-0.6144281, -1.56122, -2.65562, 0.3098039, 1, 0, 1,
-0.6096513, -0.9325962, -6.020277, 0.3019608, 1, 0, 1,
-0.6053733, 0.3289, 0.4619426, 0.2941177, 1, 0, 1,
-0.5950034, -0.3921961, -1.432616, 0.2901961, 1, 0, 1,
-0.5918407, -0.6661534, -2.598902, 0.282353, 1, 0, 1,
-0.5870897, -2.214209, -2.137382, 0.2784314, 1, 0, 1,
-0.5856593, 0.4655389, 0.5300221, 0.2705882, 1, 0, 1,
-0.5801213, -0.9106491, -4.695755, 0.2666667, 1, 0, 1,
-0.5798874, -0.2841558, -1.505217, 0.2588235, 1, 0, 1,
-0.5763203, 0.09940358, -0.2174409, 0.254902, 1, 0, 1,
-0.5674989, -0.7231562, -1.869749, 0.2470588, 1, 0, 1,
-0.5644538, 1.449938, 1.097217, 0.2431373, 1, 0, 1,
-0.5624626, 1.201805, -1.817075, 0.2352941, 1, 0, 1,
-0.5593411, 0.9027677, -0.7665727, 0.2313726, 1, 0, 1,
-0.5574003, 0.5385213, -0.4797389, 0.2235294, 1, 0, 1,
-0.5566561, -1.603663, -2.526678, 0.2196078, 1, 0, 1,
-0.5560618, 0.07331939, -0.2416841, 0.2117647, 1, 0, 1,
-0.5546235, 1.357108, 0.076053, 0.2078431, 1, 0, 1,
-0.5482752, 1.022576, 0.346951, 0.2, 1, 0, 1,
-0.5476548, 0.09259306, -0.1079794, 0.1921569, 1, 0, 1,
-0.5429612, -1.96515, -3.460108, 0.1882353, 1, 0, 1,
-0.5394497, 0.1668354, -1.203934, 0.1803922, 1, 0, 1,
-0.5375127, 0.5244057, -1.497602, 0.1764706, 1, 0, 1,
-0.537324, 1.98562, -0.8768124, 0.1686275, 1, 0, 1,
-0.5365296, 0.07399899, -1.153959, 0.1647059, 1, 0, 1,
-0.5335811, 1.649778, -1.909712, 0.1568628, 1, 0, 1,
-0.5334399, 0.1415254, -1.578674, 0.1529412, 1, 0, 1,
-0.5333109, -2.318654, -1.100387, 0.145098, 1, 0, 1,
-0.5314105, 0.4010114, 0.128313, 0.1411765, 1, 0, 1,
-0.5271456, 1.654063, -1.399742, 0.1333333, 1, 0, 1,
-0.5240285, -0.6188555, -4.606983, 0.1294118, 1, 0, 1,
-0.5235208, -1.184834, -4.247076, 0.1215686, 1, 0, 1,
-0.5216029, 2.286322, -0.7718251, 0.1176471, 1, 0, 1,
-0.5197546, -2.066366, -2.656111, 0.1098039, 1, 0, 1,
-0.5157102, 1.394886, -0.2682368, 0.1058824, 1, 0, 1,
-0.515228, 0.04338474, -0.7302073, 0.09803922, 1, 0, 1,
-0.5120459, -0.8990233, -3.304787, 0.09019608, 1, 0, 1,
-0.5085837, 0.4910236, -3.507336, 0.08627451, 1, 0, 1,
-0.5064082, -0.70137, -2.316851, 0.07843138, 1, 0, 1,
-0.5059376, 0.3771266, -0.3068624, 0.07450981, 1, 0, 1,
-0.5041377, -0.2223349, -0.3945655, 0.06666667, 1, 0, 1,
-0.5012946, -0.3116864, -1.828581, 0.0627451, 1, 0, 1,
-0.500789, 0.5904738, -2.25403, 0.05490196, 1, 0, 1,
-0.4958541, -0.3555071, -1.494086, 0.05098039, 1, 0, 1,
-0.4946139, 0.8015954, 0.1091128, 0.04313726, 1, 0, 1,
-0.4869021, 0.5100407, -2.163742, 0.03921569, 1, 0, 1,
-0.4798017, 1.943329, 0.0083385, 0.03137255, 1, 0, 1,
-0.4751362, -0.8721599, -2.079327, 0.02745098, 1, 0, 1,
-0.4747815, -0.03986045, -0.6380123, 0.01960784, 1, 0, 1,
-0.4716732, -1.02643, -4.348184, 0.01568628, 1, 0, 1,
-0.4691617, 0.4130162, -0.899061, 0.007843138, 1, 0, 1,
-0.4677227, 2.122195, -1.82405, 0.003921569, 1, 0, 1,
-0.4656018, -0.370676, -2.65858, 0, 1, 0.003921569, 1,
-0.4576801, 1.151762, -0.9475647, 0, 1, 0.01176471, 1,
-0.4561339, 0.420204, -1.37487, 0, 1, 0.01568628, 1,
-0.4544974, -1.116038, -2.668946, 0, 1, 0.02352941, 1,
-0.4538018, -0.6605926, -2.553923, 0, 1, 0.02745098, 1,
-0.4535871, -0.7861194, -2.470734, 0, 1, 0.03529412, 1,
-0.4506091, -1.253562, -3.936937, 0, 1, 0.03921569, 1,
-0.4497716, 2.453274, -0.9761935, 0, 1, 0.04705882, 1,
-0.449592, 0.3287993, -0.9282781, 0, 1, 0.05098039, 1,
-0.4488004, 1.188306, -0.6411258, 0, 1, 0.05882353, 1,
-0.4485543, -0.8208249, -2.896496, 0, 1, 0.0627451, 1,
-0.4478898, 0.8210797, -1.323536, 0, 1, 0.07058824, 1,
-0.4453458, 0.468679, -0.267595, 0, 1, 0.07450981, 1,
-0.4444423, -0.42844, -3.012519, 0, 1, 0.08235294, 1,
-0.4414132, 1.091907, 0.06595453, 0, 1, 0.08627451, 1,
-0.4396842, -0.875614, -1.712941, 0, 1, 0.09411765, 1,
-0.4342576, 1.463676, -0.7736568, 0, 1, 0.1019608, 1,
-0.4315253, 0.1256404, 1.115296, 0, 1, 0.1058824, 1,
-0.4306411, -0.4096755, -0.2168983, 0, 1, 0.1137255, 1,
-0.4302743, -0.8714795, -2.796978, 0, 1, 0.1176471, 1,
-0.4292461, -0.5907651, -3.359162, 0, 1, 0.1254902, 1,
-0.4284515, 1.386048, -1.117853, 0, 1, 0.1294118, 1,
-0.4226881, -1.205421, -3.577013, 0, 1, 0.1372549, 1,
-0.4213873, -1.235862, -2.211704, 0, 1, 0.1411765, 1,
-0.4207779, 1.460517, -1.399042, 0, 1, 0.1490196, 1,
-0.4175262, -0.001546803, -0.5094126, 0, 1, 0.1529412, 1,
-0.4106483, -0.1164188, -3.704089, 0, 1, 0.1607843, 1,
-0.4091246, 0.6580792, 0.4017502, 0, 1, 0.1647059, 1,
-0.4051889, -0.9898321, -2.414346, 0, 1, 0.172549, 1,
-0.4017048, 0.7259294, 0.05630292, 0, 1, 0.1764706, 1,
-0.4014457, -0.3765064, -2.099257, 0, 1, 0.1843137, 1,
-0.3975896, -0.6784405, -2.004547, 0, 1, 0.1882353, 1,
-0.3970609, -0.3530897, -0.9769008, 0, 1, 0.1960784, 1,
-0.3867005, 2.741913, 2.383429, 0, 1, 0.2039216, 1,
-0.3776741, 0.594116, 0.003642005, 0, 1, 0.2078431, 1,
-0.3749016, 1.269645, -0.6869413, 0, 1, 0.2156863, 1,
-0.3710524, 0.8805999, -1.543949, 0, 1, 0.2196078, 1,
-0.3699764, 0.6578739, 1.066478, 0, 1, 0.227451, 1,
-0.3694434, 0.3202542, -1.311385, 0, 1, 0.2313726, 1,
-0.3681591, 0.2745906, -0.07808932, 0, 1, 0.2392157, 1,
-0.3648985, -0.3447028, -1.510155, 0, 1, 0.2431373, 1,
-0.3558052, 1.012747, -0.4592524, 0, 1, 0.2509804, 1,
-0.3530931, -0.4352802, -2.960458, 0, 1, 0.254902, 1,
-0.3499201, 0.2327282, -1.807262, 0, 1, 0.2627451, 1,
-0.3490776, 1.014873, -1.0388, 0, 1, 0.2666667, 1,
-0.3479746, -1.050367, -2.857781, 0, 1, 0.2745098, 1,
-0.3477079, -0.0765687, -1.222551, 0, 1, 0.2784314, 1,
-0.3474478, 1.128307, 0.6416188, 0, 1, 0.2862745, 1,
-0.3447104, -1.711341, -2.47778, 0, 1, 0.2901961, 1,
-0.3430375, -0.4697711, -4.225701, 0, 1, 0.2980392, 1,
-0.3418465, -1.381624, -1.331111, 0, 1, 0.3058824, 1,
-0.3416456, 0.2981534, 0.9913934, 0, 1, 0.3098039, 1,
-0.3412217, 2.201351, -2.095291, 0, 1, 0.3176471, 1,
-0.338, 0.8612257, -1.383153, 0, 1, 0.3215686, 1,
-0.3371622, 0.3197389, -0.02509755, 0, 1, 0.3294118, 1,
-0.3341875, -1.109409, -2.65244, 0, 1, 0.3333333, 1,
-0.3338298, -1.03978, -2.980212, 0, 1, 0.3411765, 1,
-0.3264636, 0.7082874, 0.7367459, 0, 1, 0.345098, 1,
-0.3247976, -0.4355454, -3.681298, 0, 1, 0.3529412, 1,
-0.3195949, 1.641279, -1.038353, 0, 1, 0.3568628, 1,
-0.3177902, -0.2073647, -3.296489, 0, 1, 0.3647059, 1,
-0.314437, 0.8903579, -1.152199, 0, 1, 0.3686275, 1,
-0.3142529, 0.06125478, -0.214857, 0, 1, 0.3764706, 1,
-0.308272, -0.8371968, -4.10534, 0, 1, 0.3803922, 1,
-0.3003961, 0.8286578, -0.2681871, 0, 1, 0.3882353, 1,
-0.297984, 0.3081127, -0.2174724, 0, 1, 0.3921569, 1,
-0.2972522, -1.161552, -2.445099, 0, 1, 0.4, 1,
-0.2957689, -1.038749, -2.111124, 0, 1, 0.4078431, 1,
-0.2957129, 0.2803452, -0.4633354, 0, 1, 0.4117647, 1,
-0.2930576, -0.4294708, -2.615749, 0, 1, 0.4196078, 1,
-0.2927812, -0.165377, 0.1403178, 0, 1, 0.4235294, 1,
-0.2810736, -0.1888444, -0.3451819, 0, 1, 0.4313726, 1,
-0.2790054, -0.8172266, -3.502707, 0, 1, 0.4352941, 1,
-0.2780983, 0.09057937, -0.64769, 0, 1, 0.4431373, 1,
-0.2758141, 0.8363337, -1.246717, 0, 1, 0.4470588, 1,
-0.2735604, -0.4736418, -1.801504, 0, 1, 0.454902, 1,
-0.2711755, 1.766409, -0.3974234, 0, 1, 0.4588235, 1,
-0.2673851, -1.17266, -3.073178, 0, 1, 0.4666667, 1,
-0.2646226, 1.076688, 1.19273, 0, 1, 0.4705882, 1,
-0.2639788, -0.47334, -2.235808, 0, 1, 0.4784314, 1,
-0.2613913, -0.4564222, -3.133914, 0, 1, 0.4823529, 1,
-0.2531723, 1.021519, -1.867563, 0, 1, 0.4901961, 1,
-0.2523797, 0.3319657, -1.954996, 0, 1, 0.4941176, 1,
-0.2509845, -0.1086364, -2.836001, 0, 1, 0.5019608, 1,
-0.2472355, 1.099888, 0.7601393, 0, 1, 0.509804, 1,
-0.2461772, 0.7001287, -0.7671636, 0, 1, 0.5137255, 1,
-0.2433749, -0.2789608, -2.12819, 0, 1, 0.5215687, 1,
-0.2429917, -0.1393429, -0.446196, 0, 1, 0.5254902, 1,
-0.2403745, -0.01613305, -3.04091, 0, 1, 0.5333334, 1,
-0.2400644, 0.3312311, -0.7802291, 0, 1, 0.5372549, 1,
-0.2362138, -0.001517114, -0.7576412, 0, 1, 0.5450981, 1,
-0.227705, 1.027401, -1.575498, 0, 1, 0.5490196, 1,
-0.2276054, 1.484402, 0.4352302, 0, 1, 0.5568628, 1,
-0.225524, 1.341127, 0.3546431, 0, 1, 0.5607843, 1,
-0.2239591, 0.1578424, -2.098842, 0, 1, 0.5686275, 1,
-0.2223023, 0.108047, -0.894475, 0, 1, 0.572549, 1,
-0.2218727, 0.4481472, 1.31538, 0, 1, 0.5803922, 1,
-0.2214644, 0.1445093, -1.865219, 0, 1, 0.5843138, 1,
-0.2202855, -1.058773, -4.413528, 0, 1, 0.5921569, 1,
-0.2158732, 0.1427435, -0.3073866, 0, 1, 0.5960785, 1,
-0.2148902, 0.8411329, -1.057193, 0, 1, 0.6039216, 1,
-0.2087243, -1.410981, -3.208513, 0, 1, 0.6117647, 1,
-0.2067086, 0.6681941, -0.2584449, 0, 1, 0.6156863, 1,
-0.2053702, -0.8933926, -3.946851, 0, 1, 0.6235294, 1,
-0.2018933, -0.1025499, -4.042608, 0, 1, 0.627451, 1,
-0.2018674, 0.2498995, 0.2692018, 0, 1, 0.6352941, 1,
-0.2017893, -0.2211713, -0.7568831, 0, 1, 0.6392157, 1,
-0.1998652, -0.112894, -1.962513, 0, 1, 0.6470588, 1,
-0.1917273, 0.07372425, -2.122288, 0, 1, 0.6509804, 1,
-0.1913066, -0.1198518, -2.595947, 0, 1, 0.6588235, 1,
-0.1887759, 0.3511219, -0.8315899, 0, 1, 0.6627451, 1,
-0.1881051, -1.510756, -2.051622, 0, 1, 0.6705883, 1,
-0.1861949, -1.69932, -2.429316, 0, 1, 0.6745098, 1,
-0.182508, 1.825533, 0.5409022, 0, 1, 0.682353, 1,
-0.1800945, -0.660288, -2.098221, 0, 1, 0.6862745, 1,
-0.1771265, -1.04076, -3.244217, 0, 1, 0.6941177, 1,
-0.1768683, 0.4858105, 0.2671563, 0, 1, 0.7019608, 1,
-0.1743683, -1.059368, -1.542891, 0, 1, 0.7058824, 1,
-0.1698321, 0.6170217, 0.8416325, 0, 1, 0.7137255, 1,
-0.1694598, -0.8366057, -0.8093396, 0, 1, 0.7176471, 1,
-0.1576827, -1.53724, -2.820012, 0, 1, 0.7254902, 1,
-0.156942, -0.2450462, -2.010328, 0, 1, 0.7294118, 1,
-0.1470375, 0.8243522, -0.714335, 0, 1, 0.7372549, 1,
-0.1426343, 0.8580464, -0.946645, 0, 1, 0.7411765, 1,
-0.1423791, -0.1071332, -5.19634, 0, 1, 0.7490196, 1,
-0.1336244, 0.1356696, -0.8138047, 0, 1, 0.7529412, 1,
-0.1324025, -0.227064, -1.112524, 0, 1, 0.7607843, 1,
-0.1306576, 0.5691528, -0.6271154, 0, 1, 0.7647059, 1,
-0.1280777, 0.03600393, -2.848809, 0, 1, 0.772549, 1,
-0.127305, 0.5577504, -2.361067, 0, 1, 0.7764706, 1,
-0.1204787, -1.754962, -2.359797, 0, 1, 0.7843137, 1,
-0.1143683, -1.405941, -3.672901, 0, 1, 0.7882353, 1,
-0.1104672, -0.5866637, -2.670863, 0, 1, 0.7960784, 1,
-0.1098723, 0.9188296, -0.1678462, 0, 1, 0.8039216, 1,
-0.1065523, 1.425067, 0.5532384, 0, 1, 0.8078431, 1,
-0.1016661, 0.5226358, -1.672522, 0, 1, 0.8156863, 1,
-0.1001841, 1.680966, -1.421186, 0, 1, 0.8196079, 1,
-0.09580172, -0.5791038, -5.178103, 0, 1, 0.827451, 1,
-0.09002434, 0.5482808, -0.4543118, 0, 1, 0.8313726, 1,
-0.08801696, 0.1927271, -0.5659434, 0, 1, 0.8392157, 1,
-0.0879071, 0.08936333, -0.8525153, 0, 1, 0.8431373, 1,
-0.08659721, -0.3965955, -2.284688, 0, 1, 0.8509804, 1,
-0.08628222, -0.9182511, -2.274556, 0, 1, 0.854902, 1,
-0.08548953, -0.8752302, -3.360421, 0, 1, 0.8627451, 1,
-0.08515126, -1.648504, -3.786287, 0, 1, 0.8666667, 1,
-0.08016188, 0.2613991, 0.4875455, 0, 1, 0.8745098, 1,
-0.0789297, -2.028014, -3.88804, 0, 1, 0.8784314, 1,
-0.07526096, 1.235387, -0.07450528, 0, 1, 0.8862745, 1,
-0.07003497, 0.5112702, 0.7097607, 0, 1, 0.8901961, 1,
-0.06718408, 1.308584, 1.788991, 0, 1, 0.8980392, 1,
-0.06654007, -0.04070967, -3.002602, 0, 1, 0.9058824, 1,
-0.06600177, 1.090211, -0.591845, 0, 1, 0.9098039, 1,
-0.06454159, 0.7388186, 0.7523141, 0, 1, 0.9176471, 1,
-0.06129719, -0.4041098, -3.561639, 0, 1, 0.9215686, 1,
-0.05972503, 0.8659974, 0.4530286, 0, 1, 0.9294118, 1,
-0.05389282, -0.01496052, -2.813374, 0, 1, 0.9333333, 1,
-0.05295644, 0.009251096, 0.6901969, 0, 1, 0.9411765, 1,
-0.04913335, 1.104757, -1.538038, 0, 1, 0.945098, 1,
-0.04821819, 1.346906, -0.4931476, 0, 1, 0.9529412, 1,
-0.04715721, 0.03878766, -1.312147, 0, 1, 0.9568627, 1,
-0.04600535, 0.5041007, 0.1581952, 0, 1, 0.9647059, 1,
-0.04337637, -2.048527, -3.842344, 0, 1, 0.9686275, 1,
-0.04298397, -1.203872, -4.621683, 0, 1, 0.9764706, 1,
-0.03724337, 0.506606, -0.1408184, 0, 1, 0.9803922, 1,
-0.03479778, 0.3802193, -1.359079, 0, 1, 0.9882353, 1,
-0.03096424, -0.7885845, -3.404268, 0, 1, 0.9921569, 1,
-0.02891326, -0.8843406, -2.07373, 0, 1, 1, 1,
-0.02291219, 0.7851083, 0.773392, 0, 0.9921569, 1, 1,
-0.02281261, 1.017873, 0.05227322, 0, 0.9882353, 1, 1,
-0.02155937, -1.423826, -2.384872, 0, 0.9803922, 1, 1,
-0.02122983, -0.7414126, -2.783497, 0, 0.9764706, 1, 1,
-0.02107539, -0.0520918, -2.648938, 0, 0.9686275, 1, 1,
-0.0176995, -1.378307, -2.655184, 0, 0.9647059, 1, 1,
-0.01665332, -0.7379063, -2.781217, 0, 0.9568627, 1, 1,
-0.01580076, -0.6993807, -3.629146, 0, 0.9529412, 1, 1,
-0.01475038, 0.4909741, 0.7697446, 0, 0.945098, 1, 1,
-0.01160083, 0.9627837, 2.305399, 0, 0.9411765, 1, 1,
-0.0092701, 0.3863591, 1.130161, 0, 0.9333333, 1, 1,
-0.004300004, -1.383581, -3.870663, 0, 0.9294118, 1, 1,
-0.00395965, -0.5441151, -3.22255, 0, 0.9215686, 1, 1,
0.00222386, -0.3965813, 2.15977, 0, 0.9176471, 1, 1,
0.008672515, -1.174369, 3.079674, 0, 0.9098039, 1, 1,
0.01573823, -0.4866996, 4.139525, 0, 0.9058824, 1, 1,
0.01637346, 0.7774035, 0.6553406, 0, 0.8980392, 1, 1,
0.0214279, 0.2286227, 0.4418557, 0, 0.8901961, 1, 1,
0.02169073, -0.1419359, 4.305773, 0, 0.8862745, 1, 1,
0.02739081, 0.2038982, 0.8317575, 0, 0.8784314, 1, 1,
0.02808054, 1.407228, -0.1186027, 0, 0.8745098, 1, 1,
0.03015944, 2.194253, -0.4562482, 0, 0.8666667, 1, 1,
0.03138942, -0.300751, 1.011635, 0, 0.8627451, 1, 1,
0.03534371, 1.406078, 2.161157, 0, 0.854902, 1, 1,
0.0386309, 1.293316, -0.8299683, 0, 0.8509804, 1, 1,
0.04415476, 1.484754, -0.02982423, 0, 0.8431373, 1, 1,
0.04682956, 1.278274, 0.9156484, 0, 0.8392157, 1, 1,
0.04963586, 2.802027, -0.6837895, 0, 0.8313726, 1, 1,
0.05168495, -0.6683671, 4.945999, 0, 0.827451, 1, 1,
0.05365798, -0.6827806, 5.182046, 0, 0.8196079, 1, 1,
0.05837465, 2.289387, -0.6679984, 0, 0.8156863, 1, 1,
0.05866035, -0.8471142, 3.517248, 0, 0.8078431, 1, 1,
0.06690241, 1.21868, -0.9067584, 0, 0.8039216, 1, 1,
0.07203609, -0.9707136, 1.366096, 0, 0.7960784, 1, 1,
0.07443239, 0.630586, -0.6687269, 0, 0.7882353, 1, 1,
0.07558176, -2.297304, 2.418489, 0, 0.7843137, 1, 1,
0.07737719, -0.3497811, 4.033402, 0, 0.7764706, 1, 1,
0.07854959, 0.1408776, -0.3659381, 0, 0.772549, 1, 1,
0.08311098, -0.5534649, 3.06106, 0, 0.7647059, 1, 1,
0.08325537, -0.4317707, 3.495219, 0, 0.7607843, 1, 1,
0.08363297, 0.4875041, -0.9450832, 0, 0.7529412, 1, 1,
0.08956286, 0.3249075, 1.711056, 0, 0.7490196, 1, 1,
0.08988176, -1.084709, 4.153962, 0, 0.7411765, 1, 1,
0.09008926, -0.8439357, 1.773055, 0, 0.7372549, 1, 1,
0.09465615, -0.6151321, 0.4759099, 0, 0.7294118, 1, 1,
0.09594431, -0.9368257, 0.891044, 0, 0.7254902, 1, 1,
0.1058936, 1.179827, -0.3975232, 0, 0.7176471, 1, 1,
0.1063942, -1.428666, 3.825752, 0, 0.7137255, 1, 1,
0.1089197, -0.3440975, 2.886879, 0, 0.7058824, 1, 1,
0.1213144, 0.4814738, -0.009433502, 0, 0.6980392, 1, 1,
0.1260962, 0.7581363, 2.060604, 0, 0.6941177, 1, 1,
0.1264314, -0.05403361, 0.3005304, 0, 0.6862745, 1, 1,
0.1272825, 0.2050439, 0.7526758, 0, 0.682353, 1, 1,
0.1381722, 0.336931, -0.3987849, 0, 0.6745098, 1, 1,
0.1428628, -0.1126946, 2.755735, 0, 0.6705883, 1, 1,
0.1475842, 0.07033419, 0.8235048, 0, 0.6627451, 1, 1,
0.147888, -0.6655102, 1.219556, 0, 0.6588235, 1, 1,
0.1542856, -0.7083442, 1.766291, 0, 0.6509804, 1, 1,
0.1589706, 1.319553, -1.554336, 0, 0.6470588, 1, 1,
0.1621332, 0.04001388, 1.449825, 0, 0.6392157, 1, 1,
0.1640125, -0.6710215, 3.063501, 0, 0.6352941, 1, 1,
0.1659719, 0.1013551, 1.920251, 0, 0.627451, 1, 1,
0.1683283, -0.8460271, 3.95562, 0, 0.6235294, 1, 1,
0.1690084, -0.4051947, 1.95752, 0, 0.6156863, 1, 1,
0.169562, 0.09186029, 0.452536, 0, 0.6117647, 1, 1,
0.1696741, -1.244505, 4.752166, 0, 0.6039216, 1, 1,
0.1760739, 1.369279, 2.755187, 0, 0.5960785, 1, 1,
0.1770676, 0.9150777, 1.828617, 0, 0.5921569, 1, 1,
0.1796735, 0.782055, 0.8591039, 0, 0.5843138, 1, 1,
0.1805188, 0.4399948, 0.3644268, 0, 0.5803922, 1, 1,
0.1839482, -0.5814066, 3.086972, 0, 0.572549, 1, 1,
0.1856703, -1.041039, 1.689777, 0, 0.5686275, 1, 1,
0.185681, 0.8439495, 0.1124364, 0, 0.5607843, 1, 1,
0.189123, 0.6841702, 0.5484232, 0, 0.5568628, 1, 1,
0.1892142, -0.5376169, 3.123132, 0, 0.5490196, 1, 1,
0.191181, 0.2375049, 1.57703, 0, 0.5450981, 1, 1,
0.1964741, -0.9770704, 2.244233, 0, 0.5372549, 1, 1,
0.196489, -0.1469532, 3.001132, 0, 0.5333334, 1, 1,
0.1971468, -0.5965315, 2.473433, 0, 0.5254902, 1, 1,
0.1988308, 0.5107269, 0.8334122, 0, 0.5215687, 1, 1,
0.2010768, -0.2726727, 3.060046, 0, 0.5137255, 1, 1,
0.2016123, -0.4674084, 3.82191, 0, 0.509804, 1, 1,
0.2019752, -0.3869833, 4.024116, 0, 0.5019608, 1, 1,
0.2035836, 2.576382, 1.017273, 0, 0.4941176, 1, 1,
0.2114829, 0.4127958, -0.09014762, 0, 0.4901961, 1, 1,
0.2123138, 0.249103, 1.32263, 0, 0.4823529, 1, 1,
0.2160347, -0.6375014, 2.120385, 0, 0.4784314, 1, 1,
0.2165843, 0.4032534, 1.232591, 0, 0.4705882, 1, 1,
0.217282, 0.1095645, 2.010413, 0, 0.4666667, 1, 1,
0.2176239, 2.006269, -1.519109, 0, 0.4588235, 1, 1,
0.2231519, -0.09825024, 2.546807, 0, 0.454902, 1, 1,
0.2267848, -0.3402101, 0.7509357, 0, 0.4470588, 1, 1,
0.229476, 1.316925, 0.01444459, 0, 0.4431373, 1, 1,
0.2316633, -0.3789524, 1.997923, 0, 0.4352941, 1, 1,
0.2452077, -0.8042251, 3.739588, 0, 0.4313726, 1, 1,
0.2500564, 1.575437, 0.2994163, 0, 0.4235294, 1, 1,
0.2521663, -0.3016029, 0.8430324, 0, 0.4196078, 1, 1,
0.2547568, -0.9229921, 2.597566, 0, 0.4117647, 1, 1,
0.2607263, -1.202155, 4.32253, 0, 0.4078431, 1, 1,
0.272105, 1.621805, -0.7691211, 0, 0.4, 1, 1,
0.2774928, 1.335612, -0.1463314, 0, 0.3921569, 1, 1,
0.2794632, -0.7727153, 3.155259, 0, 0.3882353, 1, 1,
0.2794642, -0.4317969, 1.741521, 0, 0.3803922, 1, 1,
0.2802201, 0.2530144, -0.9397038, 0, 0.3764706, 1, 1,
0.2903303, -0.09893625, 1.326117, 0, 0.3686275, 1, 1,
0.2924331, -0.604844, 3.425127, 0, 0.3647059, 1, 1,
0.2925933, 1.380388, 1.063208, 0, 0.3568628, 1, 1,
0.2932694, -0.8899955, 3.332412, 0, 0.3529412, 1, 1,
0.2953196, 0.2747457, 2.007159, 0, 0.345098, 1, 1,
0.2976909, 0.3707936, -1.241299, 0, 0.3411765, 1, 1,
0.3005427, 0.2539113, 1.161322, 0, 0.3333333, 1, 1,
0.3018067, 0.9184235, 0.1213883, 0, 0.3294118, 1, 1,
0.3023734, 0.1001729, 1.677689, 0, 0.3215686, 1, 1,
0.3084971, 2.463249, -1.065219, 0, 0.3176471, 1, 1,
0.31818, 0.7040208, 0.7910908, 0, 0.3098039, 1, 1,
0.3213813, -1.027429, 3.379812, 0, 0.3058824, 1, 1,
0.3219762, -0.4741364, 2.557979, 0, 0.2980392, 1, 1,
0.3225734, 1.386267, -1.006606, 0, 0.2901961, 1, 1,
0.3289808, -0.7359163, 3.005326, 0, 0.2862745, 1, 1,
0.3307568, -1.240416, 2.131437, 0, 0.2784314, 1, 1,
0.3307884, -0.9409378, 2.708982, 0, 0.2745098, 1, 1,
0.3343665, 1.62572, 0.3383096, 0, 0.2666667, 1, 1,
0.335989, 3.125181, 1.300752, 0, 0.2627451, 1, 1,
0.3393366, -0.3321968, 1.491268, 0, 0.254902, 1, 1,
0.3419144, 0.3110598, 2.788054, 0, 0.2509804, 1, 1,
0.3492196, -1.323397, 1.728455, 0, 0.2431373, 1, 1,
0.3504189, 0.553947, -0.3773032, 0, 0.2392157, 1, 1,
0.3523419, -0.1395, 3.73702, 0, 0.2313726, 1, 1,
0.3546395, -1.233992, 3.367937, 0, 0.227451, 1, 1,
0.3600872, 2.653409, -0.3955879, 0, 0.2196078, 1, 1,
0.3617078, 0.9766253, 0.8489085, 0, 0.2156863, 1, 1,
0.3621553, -0.0798068, 0.5369865, 0, 0.2078431, 1, 1,
0.3626234, -1.920651, 2.83725, 0, 0.2039216, 1, 1,
0.3628179, -0.9615203, 1.726763, 0, 0.1960784, 1, 1,
0.370266, 0.8318484, 1.015892, 0, 0.1882353, 1, 1,
0.3708718, -0.09835673, 0.7182074, 0, 0.1843137, 1, 1,
0.3750853, 2.04873, 0.5594352, 0, 0.1764706, 1, 1,
0.3848377, 1.680843, 2.070816, 0, 0.172549, 1, 1,
0.385469, -0.0738791, 1.991508, 0, 0.1647059, 1, 1,
0.3868135, -0.4215463, 1.604182, 0, 0.1607843, 1, 1,
0.3923901, 0.1919888, 0.008612061, 0, 0.1529412, 1, 1,
0.3956824, -2.070892, 3.276999, 0, 0.1490196, 1, 1,
0.3979819, 0.6833229, 1.527751, 0, 0.1411765, 1, 1,
0.4000312, 0.8204713, 0.436574, 0, 0.1372549, 1, 1,
0.4006729, -0.2652785, 2.927032, 0, 0.1294118, 1, 1,
0.4113286, -0.9401437, 2.708902, 0, 0.1254902, 1, 1,
0.421174, -1.291765, 3.158572, 0, 0.1176471, 1, 1,
0.4227799, 0.1054231, 1.791613, 0, 0.1137255, 1, 1,
0.4270493, -1.615486, 3.600078, 0, 0.1058824, 1, 1,
0.4321915, 0.9006523, 1.458028, 0, 0.09803922, 1, 1,
0.432306, 1.674449, -1.488319, 0, 0.09411765, 1, 1,
0.4352755, 0.1625002, 1.197265, 0, 0.08627451, 1, 1,
0.436091, -1.793399, 3.359106, 0, 0.08235294, 1, 1,
0.4389704, -1.661476, 3.906882, 0, 0.07450981, 1, 1,
0.440395, 0.5640345, 2.151214, 0, 0.07058824, 1, 1,
0.4412844, 2.667127, 0.9371311, 0, 0.0627451, 1, 1,
0.44174, -1.639727, 3.536235, 0, 0.05882353, 1, 1,
0.4507008, -1.573417, 2.937518, 0, 0.05098039, 1, 1,
0.4541085, 2.132481, 0.3064905, 0, 0.04705882, 1, 1,
0.4559002, -1.407952, 3.558676, 0, 0.03921569, 1, 1,
0.4566623, -0.1565689, 1.473858, 0, 0.03529412, 1, 1,
0.4566868, -0.4332427, 2.915302, 0, 0.02745098, 1, 1,
0.4602468, 0.9833162, 2.431829, 0, 0.02352941, 1, 1,
0.4647013, -0.2776665, 1.818166, 0, 0.01568628, 1, 1,
0.4661114, -0.4453924, 4.278323, 0, 0.01176471, 1, 1,
0.4668943, 0.4351887, 0.3982494, 0, 0.003921569, 1, 1,
0.4683989, -0.2412074, 3.81143, 0.003921569, 0, 1, 1,
0.4736765, 0.5794226, 1.822627, 0.007843138, 0, 1, 1,
0.4763659, 0.06802181, 1.282328, 0.01568628, 0, 1, 1,
0.4796741, -0.5443044, 1.503407, 0.01960784, 0, 1, 1,
0.4857419, 1.220482, 0.6268854, 0.02745098, 0, 1, 1,
0.487032, 0.2938512, 0.879948, 0.03137255, 0, 1, 1,
0.4925133, -0.6110744, 1.538637, 0.03921569, 0, 1, 1,
0.4932608, 0.5236905, 1.200919, 0.04313726, 0, 1, 1,
0.5002552, -0.1628512, 2.015021, 0.05098039, 0, 1, 1,
0.5013121, -0.3531388, 1.361712, 0.05490196, 0, 1, 1,
0.5024715, 0.4561485, -0.0758954, 0.0627451, 0, 1, 1,
0.502857, 0.2510602, 0.9377392, 0.06666667, 0, 1, 1,
0.5060019, 2.147161, 1.894189, 0.07450981, 0, 1, 1,
0.5085688, 1.382507, 0.8057055, 0.07843138, 0, 1, 1,
0.508738, 0.7499713, -0.1831119, 0.08627451, 0, 1, 1,
0.5144992, 0.08429211, -0.2648202, 0.09019608, 0, 1, 1,
0.5189182, -1.273522, 1.931051, 0.09803922, 0, 1, 1,
0.5198928, -0.7454233, 0.7436456, 0.1058824, 0, 1, 1,
0.519916, 1.563703, 1.315531, 0.1098039, 0, 1, 1,
0.5205669, 1.282557, 1.188904, 0.1176471, 0, 1, 1,
0.5285984, -0.5835876, 3.846406, 0.1215686, 0, 1, 1,
0.5327158, -1.331276, 3.459364, 0.1294118, 0, 1, 1,
0.5339905, -0.8259073, 2.586463, 0.1333333, 0, 1, 1,
0.5370056, 0.6620144, 0.304038, 0.1411765, 0, 1, 1,
0.544375, 0.83246, -0.3913375, 0.145098, 0, 1, 1,
0.5491652, -1.206481, 1.94175, 0.1529412, 0, 1, 1,
0.5532901, 0.08168896, 1.524075, 0.1568628, 0, 1, 1,
0.5622127, -0.1146521, 1.629483, 0.1647059, 0, 1, 1,
0.5648047, -0.3746645, 2.569456, 0.1686275, 0, 1, 1,
0.5676827, 0.4063558, 1.818115, 0.1764706, 0, 1, 1,
0.5687979, 0.1882219, 1.87785, 0.1803922, 0, 1, 1,
0.5714957, -0.05982855, 3.265465, 0.1882353, 0, 1, 1,
0.5730971, 1.677459, 0.1911213, 0.1921569, 0, 1, 1,
0.5809065, 0.4356184, 0.3797654, 0.2, 0, 1, 1,
0.585107, 0.5455218, 0.7522635, 0.2078431, 0, 1, 1,
0.5986351, -1.173979, 3.72243, 0.2117647, 0, 1, 1,
0.6004798, -1.077536, 2.720506, 0.2196078, 0, 1, 1,
0.6022393, 0.09110104, -0.5971739, 0.2235294, 0, 1, 1,
0.6039447, -1.333994, 1.235031, 0.2313726, 0, 1, 1,
0.6055721, -0.4118046, 3.726688, 0.2352941, 0, 1, 1,
0.6145083, 0.7732296, 0.126798, 0.2431373, 0, 1, 1,
0.6149335, -0.8136328, 2.586643, 0.2470588, 0, 1, 1,
0.6151201, -0.2441579, 1.534802, 0.254902, 0, 1, 1,
0.6221761, -1.095477, 1.910283, 0.2588235, 0, 1, 1,
0.6232123, 1.129514, 0.126789, 0.2666667, 0, 1, 1,
0.623333, -2.185659, 4.8887, 0.2705882, 0, 1, 1,
0.6234953, -0.4350846, 3.038155, 0.2784314, 0, 1, 1,
0.6277683, -2.025365, 3.876538, 0.282353, 0, 1, 1,
0.6292408, 0.06219534, 0.1242482, 0.2901961, 0, 1, 1,
0.6293145, 1.067348, -1.151237, 0.2941177, 0, 1, 1,
0.6336872, -0.7956836, 2.449633, 0.3019608, 0, 1, 1,
0.6340563, 0.4047754, 0.6850038, 0.3098039, 0, 1, 1,
0.6355741, 0.5934221, 0.948854, 0.3137255, 0, 1, 1,
0.6357979, -1.571763, 0.4800947, 0.3215686, 0, 1, 1,
0.638126, 0.4356548, 1.642485, 0.3254902, 0, 1, 1,
0.6410528, 0.8141385, 1.704671, 0.3333333, 0, 1, 1,
0.6430781, -0.3281148, 0.4995829, 0.3372549, 0, 1, 1,
0.6437147, 0.8041279, 0.3286516, 0.345098, 0, 1, 1,
0.648643, -0.4336995, 1.703658, 0.3490196, 0, 1, 1,
0.659206, 0.8077477, 0.6906558, 0.3568628, 0, 1, 1,
0.6656387, -1.344005, 4.144069, 0.3607843, 0, 1, 1,
0.6674823, 0.8211597, 2.252479, 0.3686275, 0, 1, 1,
0.668368, -0.7501079, 1.730547, 0.372549, 0, 1, 1,
0.672654, -0.8407835, 3.231336, 0.3803922, 0, 1, 1,
0.6763994, 0.3905979, 1.845623, 0.3843137, 0, 1, 1,
0.681933, 1.71659, -0.556446, 0.3921569, 0, 1, 1,
0.68369, -1.551161, 4.429989, 0.3960784, 0, 1, 1,
0.6899617, 0.6715344, -0.2187622, 0.4039216, 0, 1, 1,
0.6903181, -1.089946, 2.374205, 0.4117647, 0, 1, 1,
0.6904706, 1.06704, 0.04321156, 0.4156863, 0, 1, 1,
0.6918486, -1.676268, 2.592445, 0.4235294, 0, 1, 1,
0.6977506, 0.299719, -1.751993, 0.427451, 0, 1, 1,
0.6994324, 0.7595915, 1.264533, 0.4352941, 0, 1, 1,
0.7032378, 0.6138299, -0.6810514, 0.4392157, 0, 1, 1,
0.7176293, -1.294374, 3.785844, 0.4470588, 0, 1, 1,
0.7268912, -1.837054, 2.546629, 0.4509804, 0, 1, 1,
0.7269431, 1.292491, -0.161169, 0.4588235, 0, 1, 1,
0.727116, 0.557995, 2.755749, 0.4627451, 0, 1, 1,
0.7280609, 0.7884772, 1.368658, 0.4705882, 0, 1, 1,
0.7288541, -1.199809, 3.566159, 0.4745098, 0, 1, 1,
0.7294127, 0.09586621, 1.462123, 0.4823529, 0, 1, 1,
0.733308, 0.3983778, -0.9597197, 0.4862745, 0, 1, 1,
0.7361848, 0.3816988, 1.086209, 0.4941176, 0, 1, 1,
0.7366077, 0.1180659, 1.920304, 0.5019608, 0, 1, 1,
0.738434, 1.122215, -0.1435675, 0.5058824, 0, 1, 1,
0.739897, -1.795898, 0.9617116, 0.5137255, 0, 1, 1,
0.7419186, 0.1403031, 1.615385, 0.5176471, 0, 1, 1,
0.7430875, 0.8081393, 1.679219, 0.5254902, 0, 1, 1,
0.743467, -1.433214, 3.215856, 0.5294118, 0, 1, 1,
0.7470593, -0.7468634, 2.578011, 0.5372549, 0, 1, 1,
0.7538137, -0.1490514, 2.074205, 0.5411765, 0, 1, 1,
0.7583837, 1.48333, 0.2865051, 0.5490196, 0, 1, 1,
0.760461, -0.8440766, 2.161159, 0.5529412, 0, 1, 1,
0.7645859, -0.1684583, 2.184256, 0.5607843, 0, 1, 1,
0.7654997, 1.369838, 0.6873277, 0.5647059, 0, 1, 1,
0.7693691, -0.3754523, 2.426203, 0.572549, 0, 1, 1,
0.7712598, -0.003764441, 2.651725, 0.5764706, 0, 1, 1,
0.7730013, -0.09645693, 1.202142, 0.5843138, 0, 1, 1,
0.774323, 1.056316, 1.540715, 0.5882353, 0, 1, 1,
0.7789993, 0.9921976, 1.568649, 0.5960785, 0, 1, 1,
0.780449, -0.5757718, 0.9821298, 0.6039216, 0, 1, 1,
0.783421, -0.5000658, 2.497781, 0.6078432, 0, 1, 1,
0.7841666, -0.5725868, 1.349439, 0.6156863, 0, 1, 1,
0.7875054, 1.795781, 2.937251, 0.6196079, 0, 1, 1,
0.7898721, -1.018925, 0.3677602, 0.627451, 0, 1, 1,
0.7998045, 0.8731542, 0.4280335, 0.6313726, 0, 1, 1,
0.804803, 0.4173035, 0.3374322, 0.6392157, 0, 1, 1,
0.8108268, 1.082688, -0.3400855, 0.6431373, 0, 1, 1,
0.8122758, 0.419578, 1.513243, 0.6509804, 0, 1, 1,
0.8125102, -2.459558, 3.714655, 0.654902, 0, 1, 1,
0.8250036, 0.1833945, -0.005559697, 0.6627451, 0, 1, 1,
0.827271, -0.5870258, 0.3001247, 0.6666667, 0, 1, 1,
0.8274937, -0.172321, 2.986892, 0.6745098, 0, 1, 1,
0.8286487, 0.9321849, 3.764093, 0.6784314, 0, 1, 1,
0.8353509, 0.6116017, 0.6180031, 0.6862745, 0, 1, 1,
0.8417335, -0.534786, 2.584939, 0.6901961, 0, 1, 1,
0.8419926, 0.4095755, 2.400207, 0.6980392, 0, 1, 1,
0.8445315, 1.890466, -0.1665694, 0.7058824, 0, 1, 1,
0.8450442, 0.676875, 0.1865016, 0.7098039, 0, 1, 1,
0.8459125, -1.84058, 0.803515, 0.7176471, 0, 1, 1,
0.8490908, -0.01273057, 1.268541, 0.7215686, 0, 1, 1,
0.8498602, -0.5325541, 2.798009, 0.7294118, 0, 1, 1,
0.8510592, 0.5066495, -0.1228405, 0.7333333, 0, 1, 1,
0.8526116, -0.09127088, 0.5222051, 0.7411765, 0, 1, 1,
0.8665588, 1.224224, 0.7743576, 0.7450981, 0, 1, 1,
0.8780577, 0.4678286, 2.468509, 0.7529412, 0, 1, 1,
0.8782425, -0.7025188, 2.63688, 0.7568628, 0, 1, 1,
0.8787698, -0.6417621, 0.1346114, 0.7647059, 0, 1, 1,
0.8788438, 0.8942667, -0.1697649, 0.7686275, 0, 1, 1,
0.8793781, -0.8849483, 3.041941, 0.7764706, 0, 1, 1,
0.8804975, -1.459061, 2.369318, 0.7803922, 0, 1, 1,
0.8816495, 0.1765913, 0.4293116, 0.7882353, 0, 1, 1,
0.8851261, 0.1115794, 1.625021, 0.7921569, 0, 1, 1,
0.8856246, -1.118999, 2.426358, 0.8, 0, 1, 1,
0.8878682, 0.7461339, 1.71025, 0.8078431, 0, 1, 1,
0.8887538, 0.3375711, 1.190961, 0.8117647, 0, 1, 1,
0.8911076, 0.7269458, -0.03343089, 0.8196079, 0, 1, 1,
0.8925037, 0.2994697, 0.2088344, 0.8235294, 0, 1, 1,
0.8927322, -0.6836721, 2.859253, 0.8313726, 0, 1, 1,
0.8971269, 1.079873, 0.6977613, 0.8352941, 0, 1, 1,
0.8993355, -0.6556144, 1.120003, 0.8431373, 0, 1, 1,
0.8997809, -1.389746, 3.503837, 0.8470588, 0, 1, 1,
0.9005984, 0.65602, -0.036176, 0.854902, 0, 1, 1,
0.9071071, -0.8268926, 2.482493, 0.8588235, 0, 1, 1,
0.9147078, 1.264805, -0.03470165, 0.8666667, 0, 1, 1,
0.9154666, -0.3705937, 2.607634, 0.8705882, 0, 1, 1,
0.9264068, 0.9064941, 1.902819, 0.8784314, 0, 1, 1,
0.9268274, 1.905079, 0.6979612, 0.8823529, 0, 1, 1,
0.927743, 0.4090381, 2.063271, 0.8901961, 0, 1, 1,
0.9328384, -0.3831447, 2.020066, 0.8941177, 0, 1, 1,
0.9342161, -0.4526717, 2.516551, 0.9019608, 0, 1, 1,
0.9343992, -0.4811029, 3.377729, 0.9098039, 0, 1, 1,
0.9428818, -0.4551609, 2.222511, 0.9137255, 0, 1, 1,
0.9428819, -1.055386, 2.140344, 0.9215686, 0, 1, 1,
0.9503692, 1.980772, 0.3804171, 0.9254902, 0, 1, 1,
0.9505272, 0.4319505, 0.8435971, 0.9333333, 0, 1, 1,
0.9507872, -1.486177, 4.612344, 0.9372549, 0, 1, 1,
0.9517235, -0.03426846, 1.268747, 0.945098, 0, 1, 1,
0.9584423, -0.5114719, 2.014602, 0.9490196, 0, 1, 1,
0.9586964, -0.834117, 1.745434, 0.9568627, 0, 1, 1,
0.9609285, 0.05763758, -0.09658458, 0.9607843, 0, 1, 1,
0.9612652, 1.858687, -0.09154519, 0.9686275, 0, 1, 1,
0.9685602, -0.507618, 4.282839, 0.972549, 0, 1, 1,
0.9751641, -1.859804, 1.483087, 0.9803922, 0, 1, 1,
0.9786843, 0.1330563, 3.250963, 0.9843137, 0, 1, 1,
0.9841675, 1.63108, 0.09567485, 0.9921569, 0, 1, 1,
0.9877085, 0.1929423, 2.685106, 0.9960784, 0, 1, 1,
0.9944439, -0.01738243, -0.08859347, 1, 0, 0.9960784, 1,
0.9978268, -1.447905, 2.687562, 1, 0, 0.9882353, 1,
1.00574, -1.008602, 2.675171, 1, 0, 0.9843137, 1,
1.008168, 1.135858, 2.259261, 1, 0, 0.9764706, 1,
1.016357, 0.1871787, 0.6109142, 1, 0, 0.972549, 1,
1.022735, 0.6306387, 1.715992, 1, 0, 0.9647059, 1,
1.039711, 0.1438965, 1.182853, 1, 0, 0.9607843, 1,
1.041402, -1.990017, 4.725176, 1, 0, 0.9529412, 1,
1.041962, -0.1603823, 1.971253, 1, 0, 0.9490196, 1,
1.043531, -1.807375, 1.39847, 1, 0, 0.9411765, 1,
1.04952, -0.7139653, 2.053206, 1, 0, 0.9372549, 1,
1.055216, -1.219096, 1.82212, 1, 0, 0.9294118, 1,
1.055763, -0.7170071, 2.487852, 1, 0, 0.9254902, 1,
1.065524, -0.4076889, 0.3243756, 1, 0, 0.9176471, 1,
1.067887, 2.046942, 0.765291, 1, 0, 0.9137255, 1,
1.075576, -0.3322818, 1.16678, 1, 0, 0.9058824, 1,
1.075696, 0.7685694, 2.463197, 1, 0, 0.9019608, 1,
1.077503, 1.466296, -0.1629467, 1, 0, 0.8941177, 1,
1.088225, -0.7502887, 0.9619507, 1, 0, 0.8862745, 1,
1.094678, 0.4615806, 1.353144, 1, 0, 0.8823529, 1,
1.097081, -0.5200028, 1.805352, 1, 0, 0.8745098, 1,
1.097973, -1.725139, 1.33842, 1, 0, 0.8705882, 1,
1.098138, 0.8063495, 0.1511874, 1, 0, 0.8627451, 1,
1.098512, -0.6136102, 1.128942, 1, 0, 0.8588235, 1,
1.101923, 0.6285671, -0.7229363, 1, 0, 0.8509804, 1,
1.105346, -2.128093, 3.61544, 1, 0, 0.8470588, 1,
1.107311, 1.176525, 0.72498, 1, 0, 0.8392157, 1,
1.11669, 1.134144, 0.5161349, 1, 0, 0.8352941, 1,
1.120494, 0.2320914, 1.133556, 1, 0, 0.827451, 1,
1.122081, -0.8233038, 1.162154, 1, 0, 0.8235294, 1,
1.130084, -1.065258, 2.375153, 1, 0, 0.8156863, 1,
1.130332, -0.3398598, 1.494332, 1, 0, 0.8117647, 1,
1.133986, 0.5439896, 1.860713, 1, 0, 0.8039216, 1,
1.136962, 0.4568797, -0.2023756, 1, 0, 0.7960784, 1,
1.137611, -0.2229036, 1.148585, 1, 0, 0.7921569, 1,
1.141323, 0.3501785, 0.3738548, 1, 0, 0.7843137, 1,
1.15663, -1.47734, 1.538679, 1, 0, 0.7803922, 1,
1.162831, -0.3222768, 3.595885, 1, 0, 0.772549, 1,
1.168291, -0.7013406, 2.576074, 1, 0, 0.7686275, 1,
1.174643, -0.198465, 2.177626, 1, 0, 0.7607843, 1,
1.175642, 0.7711436, 3.692886, 1, 0, 0.7568628, 1,
1.178749, 1.501849, -0.4669105, 1, 0, 0.7490196, 1,
1.2023, -1.190924, 3.611072, 1, 0, 0.7450981, 1,
1.210056, 1.251498, 0.9643898, 1, 0, 0.7372549, 1,
1.211071, -0.3545367, 2.971212, 1, 0, 0.7333333, 1,
1.216244, 0.6841937, 0.3826612, 1, 0, 0.7254902, 1,
1.216259, 0.6294911, 1.303219, 1, 0, 0.7215686, 1,
1.219021, -0.60203, 3.042844, 1, 0, 0.7137255, 1,
1.221827, 1.192897, 0.707856, 1, 0, 0.7098039, 1,
1.224245, -0.9675066, 1.963984, 1, 0, 0.7019608, 1,
1.225588, -0.2318574, 1.629739, 1, 0, 0.6941177, 1,
1.227196, -1.52835, 0.8822076, 1, 0, 0.6901961, 1,
1.240886, 0.1393252, 0.7282903, 1, 0, 0.682353, 1,
1.243685, -1.331609, 2.310772, 1, 0, 0.6784314, 1,
1.244295, 1.404326, 2.2533, 1, 0, 0.6705883, 1,
1.252061, -0.4128032, 0.808842, 1, 0, 0.6666667, 1,
1.254971, 0.7367432, 0.403885, 1, 0, 0.6588235, 1,
1.257626, -0.8843473, 1.831922, 1, 0, 0.654902, 1,
1.260908, -0.4053766, 3.304561, 1, 0, 0.6470588, 1,
1.289666, 1.324979, 1.78104, 1, 0, 0.6431373, 1,
1.289969, -0.3073365, 2.893973, 1, 0, 0.6352941, 1,
1.293453, -1.967732, 1.431752, 1, 0, 0.6313726, 1,
1.295572, 0.8791975, 1.980982, 1, 0, 0.6235294, 1,
1.299314, 0.7098882, 0.4365175, 1, 0, 0.6196079, 1,
1.306372, 1.722203, 0.4053659, 1, 0, 0.6117647, 1,
1.313283, -0.5302984, 1.942982, 1, 0, 0.6078432, 1,
1.319415, -1.068149, 1.412697, 1, 0, 0.6, 1,
1.324629, -0.1473519, 1.855841, 1, 0, 0.5921569, 1,
1.325519, 1.170805, 1.965498, 1, 0, 0.5882353, 1,
1.327476, 0.5907539, 2.232428, 1, 0, 0.5803922, 1,
1.333862, -1.401443, 3.326665, 1, 0, 0.5764706, 1,
1.334521, 0.2351339, 2.226889, 1, 0, 0.5686275, 1,
1.336182, -0.1245867, 1.756647, 1, 0, 0.5647059, 1,
1.337092, -0.3773006, 1.40996, 1, 0, 0.5568628, 1,
1.353013, 0.7921096, 1.006336, 1, 0, 0.5529412, 1,
1.354153, -1.222189, 2.236647, 1, 0, 0.5450981, 1,
1.362632, -0.7169613, 2.086202, 1, 0, 0.5411765, 1,
1.36753, 0.1379572, 1.235365, 1, 0, 0.5333334, 1,
1.371732, -0.4117417, 0.03725221, 1, 0, 0.5294118, 1,
1.37503, -0.2322418, 1.3204, 1, 0, 0.5215687, 1,
1.375719, 0.77138, 0.07672234, 1, 0, 0.5176471, 1,
1.385497, 0.09093178, 0.3041734, 1, 0, 0.509804, 1,
1.391275, 0.2635432, 2.744975, 1, 0, 0.5058824, 1,
1.393984, 0.6370565, 1.302192, 1, 0, 0.4980392, 1,
1.402681, 0.3739024, 1.75171, 1, 0, 0.4901961, 1,
1.403233, -1.378401, 1.150136, 1, 0, 0.4862745, 1,
1.41538, 1.41775, 0.0932365, 1, 0, 0.4784314, 1,
1.422217, -1.043821, 2.709821, 1, 0, 0.4745098, 1,
1.433647, -0.6521858, 1.195277, 1, 0, 0.4666667, 1,
1.435582, -0.4550392, 1.181387, 1, 0, 0.4627451, 1,
1.439249, -1.107521, 2.081783, 1, 0, 0.454902, 1,
1.443879, 1.716797, 0.9465545, 1, 0, 0.4509804, 1,
1.45641, 1.241622, 0.9448437, 1, 0, 0.4431373, 1,
1.457549, -1.489571, 2.945879, 1, 0, 0.4392157, 1,
1.461148, 0.007823345, 1.929292, 1, 0, 0.4313726, 1,
1.465812, -1.948711, 3.059659, 1, 0, 0.427451, 1,
1.469227, 1.065599, 1.889646, 1, 0, 0.4196078, 1,
1.469993, 0.5940395, 2.932591, 1, 0, 0.4156863, 1,
1.471561, 1.16352, 2.276014, 1, 0, 0.4078431, 1,
1.4725, 0.3842909, 2.47573, 1, 0, 0.4039216, 1,
1.479097, -0.1729698, 1.815948, 1, 0, 0.3960784, 1,
1.480985, 0.1480065, 0.3640794, 1, 0, 0.3882353, 1,
1.499089, -0.6167772, 2.223522, 1, 0, 0.3843137, 1,
1.499487, 0.8878603, 1.694524, 1, 0, 0.3764706, 1,
1.507589, 0.2576153, 0.7760556, 1, 0, 0.372549, 1,
1.518504, -0.9001993, 2.750419, 1, 0, 0.3647059, 1,
1.538328, 0.2174904, 1.370259, 1, 0, 0.3607843, 1,
1.538485, -0.1473365, 0.5467126, 1, 0, 0.3529412, 1,
1.541321, -0.5267215, 0.1831003, 1, 0, 0.3490196, 1,
1.55319, -0.2184376, 0.6771659, 1, 0, 0.3411765, 1,
1.565332, -0.6818575, 0.9219543, 1, 0, 0.3372549, 1,
1.57333, 1.283008, 0.7780751, 1, 0, 0.3294118, 1,
1.604887, 0.7988831, 0.7583227, 1, 0, 0.3254902, 1,
1.613444, -0.5726575, 3.036024, 1, 0, 0.3176471, 1,
1.621715, -1.087955, 1.969135, 1, 0, 0.3137255, 1,
1.627208, 0.03000804, 1.669977, 1, 0, 0.3058824, 1,
1.635995, 1.862017, 2.507716, 1, 0, 0.2980392, 1,
1.649776, 0.9235305, -0.1122008, 1, 0, 0.2941177, 1,
1.672236, 0.1203375, 0.4754491, 1, 0, 0.2862745, 1,
1.724144, 0.1399944, 1.141327, 1, 0, 0.282353, 1,
1.725885, -1.241907, 0.1045107, 1, 0, 0.2745098, 1,
1.740104, -0.3388044, 3.510345, 1, 0, 0.2705882, 1,
1.743627, -0.4527978, 0.5166075, 1, 0, 0.2627451, 1,
1.753173, -1.663289, 3.001788, 1, 0, 0.2588235, 1,
1.763976, -2.087007, 2.450773, 1, 0, 0.2509804, 1,
1.772604, 0.1960342, 2.069419, 1, 0, 0.2470588, 1,
1.773736, -1.595966, 3.518235, 1, 0, 0.2392157, 1,
1.786597, -0.5546446, 0.05782751, 1, 0, 0.2352941, 1,
1.790816, -0.6818759, 1.342115, 1, 0, 0.227451, 1,
1.792688, 0.3729777, 1.288769, 1, 0, 0.2235294, 1,
1.825368, 2.210761, -0.08221159, 1, 0, 0.2156863, 1,
1.842072, 0.4491083, 2.958731, 1, 0, 0.2117647, 1,
1.86267, -1.413757, 3.863755, 1, 0, 0.2039216, 1,
1.906705, -0.4781814, 0.5918736, 1, 0, 0.1960784, 1,
1.934069, 1.171022, 2.447558, 1, 0, 0.1921569, 1,
1.93665, 0.1865992, 1.286096, 1, 0, 0.1843137, 1,
1.938728, -0.8667456, 1.616391, 1, 0, 0.1803922, 1,
1.941168, 1.597669, -0.6685064, 1, 0, 0.172549, 1,
1.944121, 0.7525616, 1.700515, 1, 0, 0.1686275, 1,
1.977282, 0.9857884, 0.9586315, 1, 0, 0.1607843, 1,
1.977835, 0.3161302, 0.7019604, 1, 0, 0.1568628, 1,
1.986566, -1.072373, 4.276405, 1, 0, 0.1490196, 1,
1.995333, 0.5943126, 1.151983, 1, 0, 0.145098, 1,
2.079632, 0.3898938, 2.469971, 1, 0, 0.1372549, 1,
2.136003, 0.5385895, 1.752149, 1, 0, 0.1333333, 1,
2.151542, 0.6848813, 1.489807, 1, 0, 0.1254902, 1,
2.163298, -0.9349827, 1.820663, 1, 0, 0.1215686, 1,
2.175647, -1.181248, 1.146124, 1, 0, 0.1137255, 1,
2.182085, -0.09978677, 0.7889572, 1, 0, 0.1098039, 1,
2.186374, -0.295406, 1.388547, 1, 0, 0.1019608, 1,
2.189397, 0.6963832, 2.122888, 1, 0, 0.09411765, 1,
2.190616, -1.255209, 2.121206, 1, 0, 0.09019608, 1,
2.231467, -0.07396501, 0.05062553, 1, 0, 0.08235294, 1,
2.255714, 0.6517181, 1.439715, 1, 0, 0.07843138, 1,
2.297907, 0.5633479, -0.6489912, 1, 0, 0.07058824, 1,
2.3197, 0.303517, 1.624798, 1, 0, 0.06666667, 1,
2.342147, -0.1142954, 2.870723, 1, 0, 0.05882353, 1,
2.40566, -0.1644422, 0.8209864, 1, 0, 0.05490196, 1,
2.503345, 0.8702154, 2.342398, 1, 0, 0.04705882, 1,
2.672738, 0.02455493, 1.040463, 1, 0, 0.04313726, 1,
2.735625, 1.787316, 1.726717, 1, 0, 0.03529412, 1,
2.800884, -0.138826, 0.2587335, 1, 0, 0.03137255, 1,
2.969117, -0.847477, 1.294237, 1, 0, 0.02352941, 1,
3.035153, 0.5968689, 1.659535, 1, 0, 0.01960784, 1,
3.119488, 0.4161469, 1.148841, 1, 0, 0.01176471, 1,
3.307724, -0.7899289, 2.254881, 1, 0, 0.007843138, 1
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
-0.3666716, -3.935256, -7.91907, 0, -0.5, 0.5, 0.5,
-0.3666716, -3.935256, -7.91907, 1, -0.5, 0.5, 0.5,
-0.3666716, -3.935256, -7.91907, 1, 1.5, 0.5, 0.5,
-0.3666716, -3.935256, -7.91907, 0, 1.5, 0.5, 0.5
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
-5.286688, 0.1066101, -7.91907, 0, -0.5, 0.5, 0.5,
-5.286688, 0.1066101, -7.91907, 1, -0.5, 0.5, 0.5,
-5.286688, 0.1066101, -7.91907, 1, 1.5, 0.5, 0.5,
-5.286688, 0.1066101, -7.91907, 0, 1.5, 0.5, 0.5
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
-5.286688, -3.935256, -0.4191151, 0, -0.5, 0.5, 0.5,
-5.286688, -3.935256, -0.4191151, 1, -0.5, 0.5, 0.5,
-5.286688, -3.935256, -0.4191151, 1, 1.5, 0.5, 0.5,
-5.286688, -3.935256, -0.4191151, 0, 1.5, 0.5, 0.5
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
-4, -3.002518, -6.188312,
2, -3.002518, -6.188312,
-4, -3.002518, -6.188312,
-4, -3.157974, -6.476771,
-2, -3.002518, -6.188312,
-2, -3.157974, -6.476771,
0, -3.002518, -6.188312,
0, -3.157974, -6.476771,
2, -3.002518, -6.188312,
2, -3.157974, -6.476771
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
"-4",
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
-4, -3.468887, -7.053691, 0, -0.5, 0.5, 0.5,
-4, -3.468887, -7.053691, 1, -0.5, 0.5, 0.5,
-4, -3.468887, -7.053691, 1, 1.5, 0.5, 0.5,
-4, -3.468887, -7.053691, 0, 1.5, 0.5, 0.5,
-2, -3.468887, -7.053691, 0, -0.5, 0.5, 0.5,
-2, -3.468887, -7.053691, 1, -0.5, 0.5, 0.5,
-2, -3.468887, -7.053691, 1, 1.5, 0.5, 0.5,
-2, -3.468887, -7.053691, 0, 1.5, 0.5, 0.5,
0, -3.468887, -7.053691, 0, -0.5, 0.5, 0.5,
0, -3.468887, -7.053691, 1, -0.5, 0.5, 0.5,
0, -3.468887, -7.053691, 1, 1.5, 0.5, 0.5,
0, -3.468887, -7.053691, 0, 1.5, 0.5, 0.5,
2, -3.468887, -7.053691, 0, -0.5, 0.5, 0.5,
2, -3.468887, -7.053691, 1, -0.5, 0.5, 0.5,
2, -3.468887, -7.053691, 1, 1.5, 0.5, 0.5,
2, -3.468887, -7.053691, 0, 1.5, 0.5, 0.5
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
-4.151299, -2, -6.188312,
-4.151299, 3, -6.188312,
-4.151299, -2, -6.188312,
-4.340531, -2, -6.476771,
-4.151299, -1, -6.188312,
-4.340531, -1, -6.476771,
-4.151299, 0, -6.188312,
-4.340531, 0, -6.476771,
-4.151299, 1, -6.188312,
-4.340531, 1, -6.476771,
-4.151299, 2, -6.188312,
-4.340531, 2, -6.476771,
-4.151299, 3, -6.188312,
-4.340531, 3, -6.476771
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
-4.718994, -2, -7.053691, 0, -0.5, 0.5, 0.5,
-4.718994, -2, -7.053691, 1, -0.5, 0.5, 0.5,
-4.718994, -2, -7.053691, 1, 1.5, 0.5, 0.5,
-4.718994, -2, -7.053691, 0, 1.5, 0.5, 0.5,
-4.718994, -1, -7.053691, 0, -0.5, 0.5, 0.5,
-4.718994, -1, -7.053691, 1, -0.5, 0.5, 0.5,
-4.718994, -1, -7.053691, 1, 1.5, 0.5, 0.5,
-4.718994, -1, -7.053691, 0, 1.5, 0.5, 0.5,
-4.718994, 0, -7.053691, 0, -0.5, 0.5, 0.5,
-4.718994, 0, -7.053691, 1, -0.5, 0.5, 0.5,
-4.718994, 0, -7.053691, 1, 1.5, 0.5, 0.5,
-4.718994, 0, -7.053691, 0, 1.5, 0.5, 0.5,
-4.718994, 1, -7.053691, 0, -0.5, 0.5, 0.5,
-4.718994, 1, -7.053691, 1, -0.5, 0.5, 0.5,
-4.718994, 1, -7.053691, 1, 1.5, 0.5, 0.5,
-4.718994, 1, -7.053691, 0, 1.5, 0.5, 0.5,
-4.718994, 2, -7.053691, 0, -0.5, 0.5, 0.5,
-4.718994, 2, -7.053691, 1, -0.5, 0.5, 0.5,
-4.718994, 2, -7.053691, 1, 1.5, 0.5, 0.5,
-4.718994, 2, -7.053691, 0, 1.5, 0.5, 0.5,
-4.718994, 3, -7.053691, 0, -0.5, 0.5, 0.5,
-4.718994, 3, -7.053691, 1, -0.5, 0.5, 0.5,
-4.718994, 3, -7.053691, 1, 1.5, 0.5, 0.5,
-4.718994, 3, -7.053691, 0, 1.5, 0.5, 0.5
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
-4.151299, -3.002518, -6,
-4.151299, -3.002518, 4,
-4.151299, -3.002518, -6,
-4.340531, -3.157974, -6,
-4.151299, -3.002518, -4,
-4.340531, -3.157974, -4,
-4.151299, -3.002518, -2,
-4.340531, -3.157974, -2,
-4.151299, -3.002518, 0,
-4.340531, -3.157974, 0,
-4.151299, -3.002518, 2,
-4.340531, -3.157974, 2,
-4.151299, -3.002518, 4,
-4.340531, -3.157974, 4
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
-4.718994, -3.468887, -6, 0, -0.5, 0.5, 0.5,
-4.718994, -3.468887, -6, 1, -0.5, 0.5, 0.5,
-4.718994, -3.468887, -6, 1, 1.5, 0.5, 0.5,
-4.718994, -3.468887, -6, 0, 1.5, 0.5, 0.5,
-4.718994, -3.468887, -4, 0, -0.5, 0.5, 0.5,
-4.718994, -3.468887, -4, 1, -0.5, 0.5, 0.5,
-4.718994, -3.468887, -4, 1, 1.5, 0.5, 0.5,
-4.718994, -3.468887, -4, 0, 1.5, 0.5, 0.5,
-4.718994, -3.468887, -2, 0, -0.5, 0.5, 0.5,
-4.718994, -3.468887, -2, 1, -0.5, 0.5, 0.5,
-4.718994, -3.468887, -2, 1, 1.5, 0.5, 0.5,
-4.718994, -3.468887, -2, 0, 1.5, 0.5, 0.5,
-4.718994, -3.468887, 0, 0, -0.5, 0.5, 0.5,
-4.718994, -3.468887, 0, 1, -0.5, 0.5, 0.5,
-4.718994, -3.468887, 0, 1, 1.5, 0.5, 0.5,
-4.718994, -3.468887, 0, 0, 1.5, 0.5, 0.5,
-4.718994, -3.468887, 2, 0, -0.5, 0.5, 0.5,
-4.718994, -3.468887, 2, 1, -0.5, 0.5, 0.5,
-4.718994, -3.468887, 2, 1, 1.5, 0.5, 0.5,
-4.718994, -3.468887, 2, 0, 1.5, 0.5, 0.5,
-4.718994, -3.468887, 4, 0, -0.5, 0.5, 0.5,
-4.718994, -3.468887, 4, 1, -0.5, 0.5, 0.5,
-4.718994, -3.468887, 4, 1, 1.5, 0.5, 0.5,
-4.718994, -3.468887, 4, 0, 1.5, 0.5, 0.5
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
-4.151299, -3.002518, -6.188312,
-4.151299, 3.215738, -6.188312,
-4.151299, -3.002518, 5.350081,
-4.151299, 3.215738, 5.350081,
-4.151299, -3.002518, -6.188312,
-4.151299, -3.002518, 5.350081,
-4.151299, 3.215738, -6.188312,
-4.151299, 3.215738, 5.350081,
-4.151299, -3.002518, -6.188312,
3.417956, -3.002518, -6.188312,
-4.151299, -3.002518, 5.350081,
3.417956, -3.002518, 5.350081,
-4.151299, 3.215738, -6.188312,
3.417956, 3.215738, -6.188312,
-4.151299, 3.215738, 5.350081,
3.417956, 3.215738, 5.350081,
3.417956, -3.002518, -6.188312,
3.417956, 3.215738, -6.188312,
3.417956, -3.002518, 5.350081,
3.417956, 3.215738, 5.350081,
3.417956, -3.002518, -6.188312,
3.417956, -3.002518, 5.350081,
3.417956, 3.215738, -6.188312,
3.417956, 3.215738, 5.350081
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
var radius = 8.082266;
var distance = 35.95891;
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
mvMatrix.translate( 0.3666716, -0.1066101, 0.4191151 );
mvMatrix.scale( 1.1545, 1.40533, 0.7573588 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95891);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Distannoxane<-read.table("Distannoxane.xyz", skip=1)
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
-4.041068, -0.02964293, 0.5442119, 0, 0, 1, 1, 1,
-3.023559, -0.9413865, -1.386378, 1, 0, 0, 1, 1,
-2.911804, -1.026948, -2.614371, 1, 0, 0, 1, 1,
-2.902266, 0.8348337, -1.48122, 1, 0, 0, 1, 1,
-2.736748, -0.04487571, -2.121008, 1, 0, 0, 1, 1,
-2.550116, 1.143441, -1.686657, 1, 0, 0, 1, 1,
-2.435764, -1.618891, -1.79304, 0, 0, 0, 1, 1,
-2.424207, -0.7817021, -2.298243, 0, 0, 0, 1, 1,
-2.395892, -0.2959076, -3.825553, 0, 0, 0, 1, 1,
-2.379557, -1.053647, -1.63515, 0, 0, 0, 1, 1,
-2.36435, -0.0418952, -2.255285, 0, 0, 0, 1, 1,
-2.34131, 1.63257, 0.554564, 0, 0, 0, 1, 1,
-2.323788, -0.2165433, -0.4913558, 0, 0, 0, 1, 1,
-2.317058, 0.6089699, -2.221254, 1, 1, 1, 1, 1,
-2.246095, 1.556914, -1.383649, 1, 1, 1, 1, 1,
-2.234443, -0.06975506, 0.01398028, 1, 1, 1, 1, 1,
-2.158977, 0.1561804, -1.864451, 1, 1, 1, 1, 1,
-2.080652, 1.517563, -1.648289, 1, 1, 1, 1, 1,
-2.073303, 0.8358039, -0.6120593, 1, 1, 1, 1, 1,
-2.069989, -2.043881, -2.946002, 1, 1, 1, 1, 1,
-2.040107, 2.024039, 0.1507897, 1, 1, 1, 1, 1,
-2.025707, -0.06427476, -1.030817, 1, 1, 1, 1, 1,
-2.015459, -0.4551533, -2.173876, 1, 1, 1, 1, 1,
-2.011767, -1.758206, -3.647819, 1, 1, 1, 1, 1,
-1.991177, 0.4352681, -1.579715, 1, 1, 1, 1, 1,
-1.991091, -0.1552883, -1.95577, 1, 1, 1, 1, 1,
-1.988698, 0.06511203, -2.141822, 1, 1, 1, 1, 1,
-1.924714, 1.586359, -0.279969, 1, 1, 1, 1, 1,
-1.910966, -0.07614705, -1.530707, 0, 0, 1, 1, 1,
-1.903207, 0.3348252, -1.515481, 1, 0, 0, 1, 1,
-1.897041, 0.9048583, -1.327208, 1, 0, 0, 1, 1,
-1.886823, 1.076142, -0.3734287, 1, 0, 0, 1, 1,
-1.877229, 0.4551492, -1.167199, 1, 0, 0, 1, 1,
-1.876091, -1.688753, -2.629065, 1, 0, 0, 1, 1,
-1.87588, -1.205057, -1.660364, 0, 0, 0, 1, 1,
-1.865879, -0.07973845, -1.609891, 0, 0, 0, 1, 1,
-1.865722, -0.4162864, -1.501396, 0, 0, 0, 1, 1,
-1.835796, -0.6640009, -0.6076484, 0, 0, 0, 1, 1,
-1.804022, -1.285345, -3.056415, 0, 0, 0, 1, 1,
-1.791823, 0.4501677, 1.041158, 0, 0, 0, 1, 1,
-1.79106, 0.3299043, -0.04498398, 0, 0, 0, 1, 1,
-1.779045, -0.5325321, -2.691888, 1, 1, 1, 1, 1,
-1.772822, 1.882558, -2.338017, 1, 1, 1, 1, 1,
-1.767818, -0.06927378, -1.456763, 1, 1, 1, 1, 1,
-1.761174, -0.7587233, -1.94726, 1, 1, 1, 1, 1,
-1.752289, 0.9223198, -2.134866, 1, 1, 1, 1, 1,
-1.74522, 1.462952, -0.4905564, 1, 1, 1, 1, 1,
-1.730882, 2.347302, -3.111696, 1, 1, 1, 1, 1,
-1.717153, -0.5419575, -1.864838, 1, 1, 1, 1, 1,
-1.716725, 0.6400429, -1.213791, 1, 1, 1, 1, 1,
-1.708814, 0.5355178, -1.490514, 1, 1, 1, 1, 1,
-1.7054, -0.6586626, -1.556221, 1, 1, 1, 1, 1,
-1.685955, -0.5849257, -1.437998, 1, 1, 1, 1, 1,
-1.672373, 0.4473261, -1.29806, 1, 1, 1, 1, 1,
-1.642006, 1.716147, -1.533544, 1, 1, 1, 1, 1,
-1.631528, -0.4001594, -0.3102861, 1, 1, 1, 1, 1,
-1.624954, 1.67751, -1.429285, 0, 0, 1, 1, 1,
-1.623077, -0.2527241, -1.179507, 1, 0, 0, 1, 1,
-1.619423, 0.7723381, -1.286451, 1, 0, 0, 1, 1,
-1.61874, 0.4891667, -1.974256, 1, 0, 0, 1, 1,
-1.610345, -0.9778993, -2.106659, 1, 0, 0, 1, 1,
-1.609978, -0.4519782, -1.754757, 1, 0, 0, 1, 1,
-1.589405, -1.060999, -1.588899, 0, 0, 0, 1, 1,
-1.572937, -0.3072976, -1.395868, 0, 0, 0, 1, 1,
-1.565219, 0.314099, 0.05918724, 0, 0, 0, 1, 1,
-1.559423, 0.8792024, -2.556254, 0, 0, 0, 1, 1,
-1.553693, 1.726023, -1.282399, 0, 0, 0, 1, 1,
-1.550013, -0.4462384, -1.708909, 0, 0, 0, 1, 1,
-1.549946, -0.3241855, -2.80369, 0, 0, 0, 1, 1,
-1.534606, 0.9397256, -0.5830234, 1, 1, 1, 1, 1,
-1.525079, -0.8490461, -2.710768, 1, 1, 1, 1, 1,
-1.509437, -0.9958182, -1.15966, 1, 1, 1, 1, 1,
-1.508097, -0.3080982, -0.6362841, 1, 1, 1, 1, 1,
-1.503876, -0.0493866, -2.173846, 1, 1, 1, 1, 1,
-1.501639, -0.6792971, -1.33355, 1, 1, 1, 1, 1,
-1.500378, -0.592475, -1.28317, 1, 1, 1, 1, 1,
-1.490613, -0.4732184, -1.903055, 1, 1, 1, 1, 1,
-1.472746, 0.01607545, -2.497962, 1, 1, 1, 1, 1,
-1.46817, 0.4480684, -1.491729, 1, 1, 1, 1, 1,
-1.463749, 1.123587, 0.2889424, 1, 1, 1, 1, 1,
-1.457715, -0.3349375, -2.114027, 1, 1, 1, 1, 1,
-1.439485, 1.128016, -0.5896475, 1, 1, 1, 1, 1,
-1.420677, -0.05897909, -1.658039, 1, 1, 1, 1, 1,
-1.416304, -0.4416424, -2.182848, 1, 1, 1, 1, 1,
-1.413346, 0.4489978, -1.174929, 0, 0, 1, 1, 1,
-1.408862, -0.1635818, 0.06475249, 1, 0, 0, 1, 1,
-1.402664, 1.041381, -0.8660917, 1, 0, 0, 1, 1,
-1.40243, 0.07617645, -0.7664025, 1, 0, 0, 1, 1,
-1.395858, -0.05766028, -1.359537, 1, 0, 0, 1, 1,
-1.388941, -0.02818173, -2.777245, 1, 0, 0, 1, 1,
-1.381515, 1.345887, 1.805105, 0, 0, 0, 1, 1,
-1.379459, 0.1923963, -2.436646, 0, 0, 0, 1, 1,
-1.379339, 1.065962, -0.008274249, 0, 0, 0, 1, 1,
-1.379043, -0.1329855, -2.132513, 0, 0, 0, 1, 1,
-1.377831, -0.2013723, -2.188967, 0, 0, 0, 1, 1,
-1.372424, 0.4339174, -0.9818389, 0, 0, 0, 1, 1,
-1.363478, 0.145811, -1.853813, 0, 0, 0, 1, 1,
-1.362973, 1.621734, -1.13885, 1, 1, 1, 1, 1,
-1.358666, 0.276104, -3.580034, 1, 1, 1, 1, 1,
-1.349962, -1.017885, -1.710708, 1, 1, 1, 1, 1,
-1.349837, -0.2918066, -0.3541494, 1, 1, 1, 1, 1,
-1.349061, -0.8284565, -2.693054, 1, 1, 1, 1, 1,
-1.348146, 0.08847183, -2.610615, 1, 1, 1, 1, 1,
-1.341662, 1.542769, -0.04029915, 1, 1, 1, 1, 1,
-1.33662, -0.009580794, 0.02728539, 1, 1, 1, 1, 1,
-1.327993, 1.490247, -0.3345423, 1, 1, 1, 1, 1,
-1.323674, -0.7593384, -1.229399, 1, 1, 1, 1, 1,
-1.297094, 0.9063713, -2.185655, 1, 1, 1, 1, 1,
-1.293062, -0.7029225, -3.006798, 1, 1, 1, 1, 1,
-1.291976, 0.266451, -1.350745, 1, 1, 1, 1, 1,
-1.281882, 0.3170122, -0.6091348, 1, 1, 1, 1, 1,
-1.278796, -1.149428, -0.7874271, 1, 1, 1, 1, 1,
-1.268508, 0.3146592, -0.08802065, 0, 0, 1, 1, 1,
-1.265401, -1.891532, -4.626432, 1, 0, 0, 1, 1,
-1.25788, 1.110198, -1.5301, 1, 0, 0, 1, 1,
-1.250928, -1.241705, -3.774659, 1, 0, 0, 1, 1,
-1.246279, -0.08585327, -3.327718, 1, 0, 0, 1, 1,
-1.224902, 1.904978, -1.209301, 1, 0, 0, 1, 1,
-1.220329, -0.4679596, -0.9902189, 0, 0, 0, 1, 1,
-1.219696, 2.561709, 0.4077356, 0, 0, 0, 1, 1,
-1.204312, 1.290457, 2.038043, 0, 0, 0, 1, 1,
-1.199691, -1.904979, -3.224552, 0, 0, 0, 1, 1,
-1.198036, -1.11508, -3.653739, 0, 0, 0, 1, 1,
-1.194613, -1.418306, -4.152992, 0, 0, 0, 1, 1,
-1.183121, -0.6890166, -0.6955673, 0, 0, 0, 1, 1,
-1.17094, 0.7597516, -0.8205935, 1, 1, 1, 1, 1,
-1.167532, -0.2819278, -0.2709002, 1, 1, 1, 1, 1,
-1.166487, -1.915056, -1.319596, 1, 1, 1, 1, 1,
-1.162748, -0.2255746, 0.3469833, 1, 1, 1, 1, 1,
-1.159839, 0.3585103, 0.1849968, 1, 1, 1, 1, 1,
-1.15798, -0.4945667, -0.6276929, 1, 1, 1, 1, 1,
-1.157812, 0.9350078, -2.356612, 1, 1, 1, 1, 1,
-1.155738, 0.8251556, -0.3808709, 1, 1, 1, 1, 1,
-1.155468, 0.1691248, -0.1929095, 1, 1, 1, 1, 1,
-1.149723, 0.6511836, 1.779908, 1, 1, 1, 1, 1,
-1.135656, 0.496213, -1.148056, 1, 1, 1, 1, 1,
-1.128214, 0.7645943, 0.1217347, 1, 1, 1, 1, 1,
-1.121088, -0.5620264, -0.921168, 1, 1, 1, 1, 1,
-1.118599, 0.6091402, -1.40881, 1, 1, 1, 1, 1,
-1.116808, -0.4514855, -1.929798, 1, 1, 1, 1, 1,
-1.116338, -0.5330914, -1.430169, 0, 0, 1, 1, 1,
-1.116288, -1.288031, -1.498509, 1, 0, 0, 1, 1,
-1.113913, -0.09829798, -2.584735, 1, 0, 0, 1, 1,
-1.112777, -1.353226, -1.442083, 1, 0, 0, 1, 1,
-1.112651, 0.8183597, -1.562701, 1, 0, 0, 1, 1,
-1.111556, -0.2884213, -1.680345, 1, 0, 0, 1, 1,
-1.101774, 1.595264, -2.033567, 0, 0, 0, 1, 1,
-1.098035, 0.7179214, -1.045413, 0, 0, 0, 1, 1,
-1.087499, 2.491596, -0.1239546, 0, 0, 0, 1, 1,
-1.085294, 1.389936, 0.7050346, 0, 0, 0, 1, 1,
-1.085161, 0.7536879, -1.046859, 0, 0, 0, 1, 1,
-1.084124, 0.4642789, 0.001868864, 0, 0, 0, 1, 1,
-1.076426, -0.3590812, -3.592005, 0, 0, 0, 1, 1,
-1.070324, 0.5510238, 0.5740227, 1, 1, 1, 1, 1,
-1.065434, 0.08582582, -0.6033918, 1, 1, 1, 1, 1,
-1.062202, 0.7486674, -0.7272345, 1, 1, 1, 1, 1,
-1.057141, 0.01820354, -3.834481, 1, 1, 1, 1, 1,
-1.053249, 0.7243843, -1.429839, 1, 1, 1, 1, 1,
-1.050774, -0.2798399, -2.620232, 1, 1, 1, 1, 1,
-1.050012, 0.4273119, -1.889297, 1, 1, 1, 1, 1,
-1.044503, -1.151278, -0.6543778, 1, 1, 1, 1, 1,
-1.043131, -1.02221, -1.735682, 1, 1, 1, 1, 1,
-1.041072, 0.9105386, 0.2343617, 1, 1, 1, 1, 1,
-1.037618, -0.7550839, -4.718373, 1, 1, 1, 1, 1,
-1.037143, 1.754414, -0.5267489, 1, 1, 1, 1, 1,
-1.021547, -1.320155, -3.221007, 1, 1, 1, 1, 1,
-1.012621, 0.4292257, -3.443724, 1, 1, 1, 1, 1,
-1.002618, -0.07237855, -2.456327, 1, 1, 1, 1, 1,
-0.9987342, -2.911961, -2.911523, 0, 0, 1, 1, 1,
-0.99334, -1.904856, -1.321393, 1, 0, 0, 1, 1,
-0.9929489, -1.008951, -3.186614, 1, 0, 0, 1, 1,
-0.9921635, 1.824431, -2.399803, 1, 0, 0, 1, 1,
-0.9892812, -1.126593, -3.140665, 1, 0, 0, 1, 1,
-0.9868292, -0.1968552, -0.7401928, 1, 0, 0, 1, 1,
-0.9815305, 1.916472, -0.6766047, 0, 0, 0, 1, 1,
-0.9735135, -0.02962845, -1.54549, 0, 0, 0, 1, 1,
-0.9700863, -0.6177636, -1.386056, 0, 0, 0, 1, 1,
-0.9687279, 0.7178766, -0.7115833, 0, 0, 0, 1, 1,
-0.96782, 0.2567562, -1.224943, 0, 0, 0, 1, 1,
-0.9636761, -1.655672, -1.400247, 0, 0, 0, 1, 1,
-0.9626505, 0.9884885, -0.7356184, 0, 0, 0, 1, 1,
-0.9590049, 0.1969341, -2.119251, 1, 1, 1, 1, 1,
-0.9575808, -1.011211, -1.927886, 1, 1, 1, 1, 1,
-0.9575521, 0.4566279, 0.06209506, 1, 1, 1, 1, 1,
-0.9468756, 1.936575, -0.6687068, 1, 1, 1, 1, 1,
-0.9447436, 0.1512347, -1.714338, 1, 1, 1, 1, 1,
-0.9396931, -0.2806247, -1.971811, 1, 1, 1, 1, 1,
-0.9385744, -2.008342, -2.92469, 1, 1, 1, 1, 1,
-0.9371198, -1.88307, -3.025192, 1, 1, 1, 1, 1,
-0.9336842, 1.884866, -0.006363608, 1, 1, 1, 1, 1,
-0.9297025, 0.2424, 0.2650183, 1, 1, 1, 1, 1,
-0.927028, -0.5528465, -1.395625, 1, 1, 1, 1, 1,
-0.9243458, -0.1582319, -0.8856722, 1, 1, 1, 1, 1,
-0.921392, -0.4820886, -3.560312, 1, 1, 1, 1, 1,
-0.918667, 0.4925876, -1.159651, 1, 1, 1, 1, 1,
-0.9184765, -0.3682082, -2.09204, 1, 1, 1, 1, 1,
-0.9136234, 0.9664657, -1.334666, 0, 0, 1, 1, 1,
-0.906361, -0.08726096, -1.812481, 1, 0, 0, 1, 1,
-0.9038608, -0.8519718, -2.502743, 1, 0, 0, 1, 1,
-0.8957471, -0.2042172, -2.231764, 1, 0, 0, 1, 1,
-0.8868693, 0.5383804, -2.384076, 1, 0, 0, 1, 1,
-0.8803196, -0.1049578, -0.8849885, 1, 0, 0, 1, 1,
-0.8793467, -0.4392794, -1.631067, 0, 0, 0, 1, 1,
-0.8760666, -0.2525194, -1.396162, 0, 0, 0, 1, 1,
-0.875352, -0.07846132, -0.8283561, 0, 0, 0, 1, 1,
-0.8664603, -0.4034499, -0.7208639, 0, 0, 0, 1, 1,
-0.8661391, 0.2530341, -0.4382559, 0, 0, 0, 1, 1,
-0.8589906, 0.8367447, -0.3385684, 0, 0, 0, 1, 1,
-0.8585022, 2.156107, -1.473614, 0, 0, 0, 1, 1,
-0.8499417, -0.224209, -2.740978, 1, 1, 1, 1, 1,
-0.8472704, -0.3085154, 0.3915998, 1, 1, 1, 1, 1,
-0.8388834, -0.419882, -1.913068, 1, 1, 1, 1, 1,
-0.8363422, 0.3779789, -1.462694, 1, 1, 1, 1, 1,
-0.830209, -0.5502853, -1.254476, 1, 1, 1, 1, 1,
-0.8275942, -1.378615, -2.387285, 1, 1, 1, 1, 1,
-0.8242431, 0.5530537, -1.068898, 1, 1, 1, 1, 1,
-0.81879, -0.7863891, -2.175714, 1, 1, 1, 1, 1,
-0.8183894, -0.1906236, -1.482184, 1, 1, 1, 1, 1,
-0.8171206, 1.761905, -0.07218535, 1, 1, 1, 1, 1,
-0.8162913, 0.6849577, -0.5905465, 1, 1, 1, 1, 1,
-0.8145139, 0.1316776, -1.490594, 1, 1, 1, 1, 1,
-0.8142522, -0.9436824, -3.410957, 1, 1, 1, 1, 1,
-0.8057539, 0.2695432, 0.1679811, 1, 1, 1, 1, 1,
-0.8044429, 0.2175066, 0.7031638, 1, 1, 1, 1, 1,
-0.8043973, -0.1513546, -1.93902, 0, 0, 1, 1, 1,
-0.8014508, 0.7734186, -0.6196172, 1, 0, 0, 1, 1,
-0.8002896, 0.4677689, -2.356746, 1, 0, 0, 1, 1,
-0.7986961, -1.144769, -2.600617, 1, 0, 0, 1, 1,
-0.7944992, 0.2808275, -1.332455, 1, 0, 0, 1, 1,
-0.7930208, -0.7649421, -0.7902078, 1, 0, 0, 1, 1,
-0.7926361, 0.4800301, -0.2164624, 0, 0, 0, 1, 1,
-0.7912862, -0.5526886, -3.034018, 0, 0, 0, 1, 1,
-0.7865676, -0.431166, -2.823415, 0, 0, 0, 1, 1,
-0.7841949, 1.383175, -0.7860991, 0, 0, 0, 1, 1,
-0.7820078, -0.47299, -3.063958, 0, 0, 0, 1, 1,
-0.7819629, 0.0599873, 0.2370325, 0, 0, 0, 1, 1,
-0.7809471, 1.372295, -0.07364021, 0, 0, 0, 1, 1,
-0.7778448, -0.6805418, -0.7482949, 1, 1, 1, 1, 1,
-0.7758316, 0.2192445, -0.4998959, 1, 1, 1, 1, 1,
-0.7733371, -0.2801775, -1.180187, 1, 1, 1, 1, 1,
-0.7704965, -0.3175496, -3.245878, 1, 1, 1, 1, 1,
-0.7650528, 1.927893, 0.3354215, 1, 1, 1, 1, 1,
-0.7625132, 0.5931346, -0.3353853, 1, 1, 1, 1, 1,
-0.7625048, -1.25987, -1.194284, 1, 1, 1, 1, 1,
-0.7537614, -0.9929544, -1.143615, 1, 1, 1, 1, 1,
-0.7424707, -1.809046, -2.312826, 1, 1, 1, 1, 1,
-0.7412051, -1.459319, -0.9105468, 1, 1, 1, 1, 1,
-0.739962, 0.08956578, -2.477367, 1, 1, 1, 1, 1,
-0.7391038, -1.892559, -2.712079, 1, 1, 1, 1, 1,
-0.7215895, -0.2209095, -2.312071, 1, 1, 1, 1, 1,
-0.7133315, -0.1815854, -1.972973, 1, 1, 1, 1, 1,
-0.713019, 0.913765, -1.94458, 1, 1, 1, 1, 1,
-0.6992544, 0.2534464, -0.6575848, 0, 0, 1, 1, 1,
-0.6987607, -1.134053, -2.583518, 1, 0, 0, 1, 1,
-0.6983901, 0.2882075, -2.496954, 1, 0, 0, 1, 1,
-0.6954064, 0.7661514, -1.034855, 1, 0, 0, 1, 1,
-0.6947178, -0.3759222, -2.120725, 1, 0, 0, 1, 1,
-0.6921869, 0.4052319, -1.79496, 1, 0, 0, 1, 1,
-0.6885172, 0.9837758, -1.78949, 0, 0, 0, 1, 1,
-0.6843776, 0.9939696, -0.5164738, 0, 0, 0, 1, 1,
-0.6807542, 0.007865447, -0.1543383, 0, 0, 0, 1, 1,
-0.6748804, -2.062639, -2.534645, 0, 0, 0, 1, 1,
-0.6733261, -0.9817211, -0.832008, 0, 0, 0, 1, 1,
-0.6646364, 0.7870307, -0.977597, 0, 0, 0, 1, 1,
-0.6552506, 2.579474, 2.209555, 0, 0, 0, 1, 1,
-0.6498215, -0.7989379, -2.863346, 1, 1, 1, 1, 1,
-0.6478313, 0.3678433, -0.07368284, 1, 1, 1, 1, 1,
-0.6454632, 0.2052209, -0.2073278, 1, 1, 1, 1, 1,
-0.6451429, 0.3922275, -0.6381665, 1, 1, 1, 1, 1,
-0.6444108, 0.2044797, -1.304498, 1, 1, 1, 1, 1,
-0.6441778, -0.03950905, -1.541761, 1, 1, 1, 1, 1,
-0.641676, -1.665981, -4.217028, 1, 1, 1, 1, 1,
-0.6379408, -1.121461, -1.018492, 1, 1, 1, 1, 1,
-0.6350791, -0.9664742, -2.148711, 1, 1, 1, 1, 1,
-0.6281568, 0.7402284, -1.15683, 1, 1, 1, 1, 1,
-0.6277991, -0.1898629, -0.3975762, 1, 1, 1, 1, 1,
-0.6276734, 1.47741, -1.302428, 1, 1, 1, 1, 1,
-0.6245607, -0.4104316, -1.332147, 1, 1, 1, 1, 1,
-0.6206564, 1.06832, -0.9156548, 1, 1, 1, 1, 1,
-0.6190078, -0.07776298, -1.113361, 1, 1, 1, 1, 1,
-0.616282, -0.5420001, -1.625525, 0, 0, 1, 1, 1,
-0.6151406, 0.163879, -3.38376, 1, 0, 0, 1, 1,
-0.6144281, -1.56122, -2.65562, 1, 0, 0, 1, 1,
-0.6096513, -0.9325962, -6.020277, 1, 0, 0, 1, 1,
-0.6053733, 0.3289, 0.4619426, 1, 0, 0, 1, 1,
-0.5950034, -0.3921961, -1.432616, 1, 0, 0, 1, 1,
-0.5918407, -0.6661534, -2.598902, 0, 0, 0, 1, 1,
-0.5870897, -2.214209, -2.137382, 0, 0, 0, 1, 1,
-0.5856593, 0.4655389, 0.5300221, 0, 0, 0, 1, 1,
-0.5801213, -0.9106491, -4.695755, 0, 0, 0, 1, 1,
-0.5798874, -0.2841558, -1.505217, 0, 0, 0, 1, 1,
-0.5763203, 0.09940358, -0.2174409, 0, 0, 0, 1, 1,
-0.5674989, -0.7231562, -1.869749, 0, 0, 0, 1, 1,
-0.5644538, 1.449938, 1.097217, 1, 1, 1, 1, 1,
-0.5624626, 1.201805, -1.817075, 1, 1, 1, 1, 1,
-0.5593411, 0.9027677, -0.7665727, 1, 1, 1, 1, 1,
-0.5574003, 0.5385213, -0.4797389, 1, 1, 1, 1, 1,
-0.5566561, -1.603663, -2.526678, 1, 1, 1, 1, 1,
-0.5560618, 0.07331939, -0.2416841, 1, 1, 1, 1, 1,
-0.5546235, 1.357108, 0.076053, 1, 1, 1, 1, 1,
-0.5482752, 1.022576, 0.346951, 1, 1, 1, 1, 1,
-0.5476548, 0.09259306, -0.1079794, 1, 1, 1, 1, 1,
-0.5429612, -1.96515, -3.460108, 1, 1, 1, 1, 1,
-0.5394497, 0.1668354, -1.203934, 1, 1, 1, 1, 1,
-0.5375127, 0.5244057, -1.497602, 1, 1, 1, 1, 1,
-0.537324, 1.98562, -0.8768124, 1, 1, 1, 1, 1,
-0.5365296, 0.07399899, -1.153959, 1, 1, 1, 1, 1,
-0.5335811, 1.649778, -1.909712, 1, 1, 1, 1, 1,
-0.5334399, 0.1415254, -1.578674, 0, 0, 1, 1, 1,
-0.5333109, -2.318654, -1.100387, 1, 0, 0, 1, 1,
-0.5314105, 0.4010114, 0.128313, 1, 0, 0, 1, 1,
-0.5271456, 1.654063, -1.399742, 1, 0, 0, 1, 1,
-0.5240285, -0.6188555, -4.606983, 1, 0, 0, 1, 1,
-0.5235208, -1.184834, -4.247076, 1, 0, 0, 1, 1,
-0.5216029, 2.286322, -0.7718251, 0, 0, 0, 1, 1,
-0.5197546, -2.066366, -2.656111, 0, 0, 0, 1, 1,
-0.5157102, 1.394886, -0.2682368, 0, 0, 0, 1, 1,
-0.515228, 0.04338474, -0.7302073, 0, 0, 0, 1, 1,
-0.5120459, -0.8990233, -3.304787, 0, 0, 0, 1, 1,
-0.5085837, 0.4910236, -3.507336, 0, 0, 0, 1, 1,
-0.5064082, -0.70137, -2.316851, 0, 0, 0, 1, 1,
-0.5059376, 0.3771266, -0.3068624, 1, 1, 1, 1, 1,
-0.5041377, -0.2223349, -0.3945655, 1, 1, 1, 1, 1,
-0.5012946, -0.3116864, -1.828581, 1, 1, 1, 1, 1,
-0.500789, 0.5904738, -2.25403, 1, 1, 1, 1, 1,
-0.4958541, -0.3555071, -1.494086, 1, 1, 1, 1, 1,
-0.4946139, 0.8015954, 0.1091128, 1, 1, 1, 1, 1,
-0.4869021, 0.5100407, -2.163742, 1, 1, 1, 1, 1,
-0.4798017, 1.943329, 0.0083385, 1, 1, 1, 1, 1,
-0.4751362, -0.8721599, -2.079327, 1, 1, 1, 1, 1,
-0.4747815, -0.03986045, -0.6380123, 1, 1, 1, 1, 1,
-0.4716732, -1.02643, -4.348184, 1, 1, 1, 1, 1,
-0.4691617, 0.4130162, -0.899061, 1, 1, 1, 1, 1,
-0.4677227, 2.122195, -1.82405, 1, 1, 1, 1, 1,
-0.4656018, -0.370676, -2.65858, 1, 1, 1, 1, 1,
-0.4576801, 1.151762, -0.9475647, 1, 1, 1, 1, 1,
-0.4561339, 0.420204, -1.37487, 0, 0, 1, 1, 1,
-0.4544974, -1.116038, -2.668946, 1, 0, 0, 1, 1,
-0.4538018, -0.6605926, -2.553923, 1, 0, 0, 1, 1,
-0.4535871, -0.7861194, -2.470734, 1, 0, 0, 1, 1,
-0.4506091, -1.253562, -3.936937, 1, 0, 0, 1, 1,
-0.4497716, 2.453274, -0.9761935, 1, 0, 0, 1, 1,
-0.449592, 0.3287993, -0.9282781, 0, 0, 0, 1, 1,
-0.4488004, 1.188306, -0.6411258, 0, 0, 0, 1, 1,
-0.4485543, -0.8208249, -2.896496, 0, 0, 0, 1, 1,
-0.4478898, 0.8210797, -1.323536, 0, 0, 0, 1, 1,
-0.4453458, 0.468679, -0.267595, 0, 0, 0, 1, 1,
-0.4444423, -0.42844, -3.012519, 0, 0, 0, 1, 1,
-0.4414132, 1.091907, 0.06595453, 0, 0, 0, 1, 1,
-0.4396842, -0.875614, -1.712941, 1, 1, 1, 1, 1,
-0.4342576, 1.463676, -0.7736568, 1, 1, 1, 1, 1,
-0.4315253, 0.1256404, 1.115296, 1, 1, 1, 1, 1,
-0.4306411, -0.4096755, -0.2168983, 1, 1, 1, 1, 1,
-0.4302743, -0.8714795, -2.796978, 1, 1, 1, 1, 1,
-0.4292461, -0.5907651, -3.359162, 1, 1, 1, 1, 1,
-0.4284515, 1.386048, -1.117853, 1, 1, 1, 1, 1,
-0.4226881, -1.205421, -3.577013, 1, 1, 1, 1, 1,
-0.4213873, -1.235862, -2.211704, 1, 1, 1, 1, 1,
-0.4207779, 1.460517, -1.399042, 1, 1, 1, 1, 1,
-0.4175262, -0.001546803, -0.5094126, 1, 1, 1, 1, 1,
-0.4106483, -0.1164188, -3.704089, 1, 1, 1, 1, 1,
-0.4091246, 0.6580792, 0.4017502, 1, 1, 1, 1, 1,
-0.4051889, -0.9898321, -2.414346, 1, 1, 1, 1, 1,
-0.4017048, 0.7259294, 0.05630292, 1, 1, 1, 1, 1,
-0.4014457, -0.3765064, -2.099257, 0, 0, 1, 1, 1,
-0.3975896, -0.6784405, -2.004547, 1, 0, 0, 1, 1,
-0.3970609, -0.3530897, -0.9769008, 1, 0, 0, 1, 1,
-0.3867005, 2.741913, 2.383429, 1, 0, 0, 1, 1,
-0.3776741, 0.594116, 0.003642005, 1, 0, 0, 1, 1,
-0.3749016, 1.269645, -0.6869413, 1, 0, 0, 1, 1,
-0.3710524, 0.8805999, -1.543949, 0, 0, 0, 1, 1,
-0.3699764, 0.6578739, 1.066478, 0, 0, 0, 1, 1,
-0.3694434, 0.3202542, -1.311385, 0, 0, 0, 1, 1,
-0.3681591, 0.2745906, -0.07808932, 0, 0, 0, 1, 1,
-0.3648985, -0.3447028, -1.510155, 0, 0, 0, 1, 1,
-0.3558052, 1.012747, -0.4592524, 0, 0, 0, 1, 1,
-0.3530931, -0.4352802, -2.960458, 0, 0, 0, 1, 1,
-0.3499201, 0.2327282, -1.807262, 1, 1, 1, 1, 1,
-0.3490776, 1.014873, -1.0388, 1, 1, 1, 1, 1,
-0.3479746, -1.050367, -2.857781, 1, 1, 1, 1, 1,
-0.3477079, -0.0765687, -1.222551, 1, 1, 1, 1, 1,
-0.3474478, 1.128307, 0.6416188, 1, 1, 1, 1, 1,
-0.3447104, -1.711341, -2.47778, 1, 1, 1, 1, 1,
-0.3430375, -0.4697711, -4.225701, 1, 1, 1, 1, 1,
-0.3418465, -1.381624, -1.331111, 1, 1, 1, 1, 1,
-0.3416456, 0.2981534, 0.9913934, 1, 1, 1, 1, 1,
-0.3412217, 2.201351, -2.095291, 1, 1, 1, 1, 1,
-0.338, 0.8612257, -1.383153, 1, 1, 1, 1, 1,
-0.3371622, 0.3197389, -0.02509755, 1, 1, 1, 1, 1,
-0.3341875, -1.109409, -2.65244, 1, 1, 1, 1, 1,
-0.3338298, -1.03978, -2.980212, 1, 1, 1, 1, 1,
-0.3264636, 0.7082874, 0.7367459, 1, 1, 1, 1, 1,
-0.3247976, -0.4355454, -3.681298, 0, 0, 1, 1, 1,
-0.3195949, 1.641279, -1.038353, 1, 0, 0, 1, 1,
-0.3177902, -0.2073647, -3.296489, 1, 0, 0, 1, 1,
-0.314437, 0.8903579, -1.152199, 1, 0, 0, 1, 1,
-0.3142529, 0.06125478, -0.214857, 1, 0, 0, 1, 1,
-0.308272, -0.8371968, -4.10534, 1, 0, 0, 1, 1,
-0.3003961, 0.8286578, -0.2681871, 0, 0, 0, 1, 1,
-0.297984, 0.3081127, -0.2174724, 0, 0, 0, 1, 1,
-0.2972522, -1.161552, -2.445099, 0, 0, 0, 1, 1,
-0.2957689, -1.038749, -2.111124, 0, 0, 0, 1, 1,
-0.2957129, 0.2803452, -0.4633354, 0, 0, 0, 1, 1,
-0.2930576, -0.4294708, -2.615749, 0, 0, 0, 1, 1,
-0.2927812, -0.165377, 0.1403178, 0, 0, 0, 1, 1,
-0.2810736, -0.1888444, -0.3451819, 1, 1, 1, 1, 1,
-0.2790054, -0.8172266, -3.502707, 1, 1, 1, 1, 1,
-0.2780983, 0.09057937, -0.64769, 1, 1, 1, 1, 1,
-0.2758141, 0.8363337, -1.246717, 1, 1, 1, 1, 1,
-0.2735604, -0.4736418, -1.801504, 1, 1, 1, 1, 1,
-0.2711755, 1.766409, -0.3974234, 1, 1, 1, 1, 1,
-0.2673851, -1.17266, -3.073178, 1, 1, 1, 1, 1,
-0.2646226, 1.076688, 1.19273, 1, 1, 1, 1, 1,
-0.2639788, -0.47334, -2.235808, 1, 1, 1, 1, 1,
-0.2613913, -0.4564222, -3.133914, 1, 1, 1, 1, 1,
-0.2531723, 1.021519, -1.867563, 1, 1, 1, 1, 1,
-0.2523797, 0.3319657, -1.954996, 1, 1, 1, 1, 1,
-0.2509845, -0.1086364, -2.836001, 1, 1, 1, 1, 1,
-0.2472355, 1.099888, 0.7601393, 1, 1, 1, 1, 1,
-0.2461772, 0.7001287, -0.7671636, 1, 1, 1, 1, 1,
-0.2433749, -0.2789608, -2.12819, 0, 0, 1, 1, 1,
-0.2429917, -0.1393429, -0.446196, 1, 0, 0, 1, 1,
-0.2403745, -0.01613305, -3.04091, 1, 0, 0, 1, 1,
-0.2400644, 0.3312311, -0.7802291, 1, 0, 0, 1, 1,
-0.2362138, -0.001517114, -0.7576412, 1, 0, 0, 1, 1,
-0.227705, 1.027401, -1.575498, 1, 0, 0, 1, 1,
-0.2276054, 1.484402, 0.4352302, 0, 0, 0, 1, 1,
-0.225524, 1.341127, 0.3546431, 0, 0, 0, 1, 1,
-0.2239591, 0.1578424, -2.098842, 0, 0, 0, 1, 1,
-0.2223023, 0.108047, -0.894475, 0, 0, 0, 1, 1,
-0.2218727, 0.4481472, 1.31538, 0, 0, 0, 1, 1,
-0.2214644, 0.1445093, -1.865219, 0, 0, 0, 1, 1,
-0.2202855, -1.058773, -4.413528, 0, 0, 0, 1, 1,
-0.2158732, 0.1427435, -0.3073866, 1, 1, 1, 1, 1,
-0.2148902, 0.8411329, -1.057193, 1, 1, 1, 1, 1,
-0.2087243, -1.410981, -3.208513, 1, 1, 1, 1, 1,
-0.2067086, 0.6681941, -0.2584449, 1, 1, 1, 1, 1,
-0.2053702, -0.8933926, -3.946851, 1, 1, 1, 1, 1,
-0.2018933, -0.1025499, -4.042608, 1, 1, 1, 1, 1,
-0.2018674, 0.2498995, 0.2692018, 1, 1, 1, 1, 1,
-0.2017893, -0.2211713, -0.7568831, 1, 1, 1, 1, 1,
-0.1998652, -0.112894, -1.962513, 1, 1, 1, 1, 1,
-0.1917273, 0.07372425, -2.122288, 1, 1, 1, 1, 1,
-0.1913066, -0.1198518, -2.595947, 1, 1, 1, 1, 1,
-0.1887759, 0.3511219, -0.8315899, 1, 1, 1, 1, 1,
-0.1881051, -1.510756, -2.051622, 1, 1, 1, 1, 1,
-0.1861949, -1.69932, -2.429316, 1, 1, 1, 1, 1,
-0.182508, 1.825533, 0.5409022, 1, 1, 1, 1, 1,
-0.1800945, -0.660288, -2.098221, 0, 0, 1, 1, 1,
-0.1771265, -1.04076, -3.244217, 1, 0, 0, 1, 1,
-0.1768683, 0.4858105, 0.2671563, 1, 0, 0, 1, 1,
-0.1743683, -1.059368, -1.542891, 1, 0, 0, 1, 1,
-0.1698321, 0.6170217, 0.8416325, 1, 0, 0, 1, 1,
-0.1694598, -0.8366057, -0.8093396, 1, 0, 0, 1, 1,
-0.1576827, -1.53724, -2.820012, 0, 0, 0, 1, 1,
-0.156942, -0.2450462, -2.010328, 0, 0, 0, 1, 1,
-0.1470375, 0.8243522, -0.714335, 0, 0, 0, 1, 1,
-0.1426343, 0.8580464, -0.946645, 0, 0, 0, 1, 1,
-0.1423791, -0.1071332, -5.19634, 0, 0, 0, 1, 1,
-0.1336244, 0.1356696, -0.8138047, 0, 0, 0, 1, 1,
-0.1324025, -0.227064, -1.112524, 0, 0, 0, 1, 1,
-0.1306576, 0.5691528, -0.6271154, 1, 1, 1, 1, 1,
-0.1280777, 0.03600393, -2.848809, 1, 1, 1, 1, 1,
-0.127305, 0.5577504, -2.361067, 1, 1, 1, 1, 1,
-0.1204787, -1.754962, -2.359797, 1, 1, 1, 1, 1,
-0.1143683, -1.405941, -3.672901, 1, 1, 1, 1, 1,
-0.1104672, -0.5866637, -2.670863, 1, 1, 1, 1, 1,
-0.1098723, 0.9188296, -0.1678462, 1, 1, 1, 1, 1,
-0.1065523, 1.425067, 0.5532384, 1, 1, 1, 1, 1,
-0.1016661, 0.5226358, -1.672522, 1, 1, 1, 1, 1,
-0.1001841, 1.680966, -1.421186, 1, 1, 1, 1, 1,
-0.09580172, -0.5791038, -5.178103, 1, 1, 1, 1, 1,
-0.09002434, 0.5482808, -0.4543118, 1, 1, 1, 1, 1,
-0.08801696, 0.1927271, -0.5659434, 1, 1, 1, 1, 1,
-0.0879071, 0.08936333, -0.8525153, 1, 1, 1, 1, 1,
-0.08659721, -0.3965955, -2.284688, 1, 1, 1, 1, 1,
-0.08628222, -0.9182511, -2.274556, 0, 0, 1, 1, 1,
-0.08548953, -0.8752302, -3.360421, 1, 0, 0, 1, 1,
-0.08515126, -1.648504, -3.786287, 1, 0, 0, 1, 1,
-0.08016188, 0.2613991, 0.4875455, 1, 0, 0, 1, 1,
-0.0789297, -2.028014, -3.88804, 1, 0, 0, 1, 1,
-0.07526096, 1.235387, -0.07450528, 1, 0, 0, 1, 1,
-0.07003497, 0.5112702, 0.7097607, 0, 0, 0, 1, 1,
-0.06718408, 1.308584, 1.788991, 0, 0, 0, 1, 1,
-0.06654007, -0.04070967, -3.002602, 0, 0, 0, 1, 1,
-0.06600177, 1.090211, -0.591845, 0, 0, 0, 1, 1,
-0.06454159, 0.7388186, 0.7523141, 0, 0, 0, 1, 1,
-0.06129719, -0.4041098, -3.561639, 0, 0, 0, 1, 1,
-0.05972503, 0.8659974, 0.4530286, 0, 0, 0, 1, 1,
-0.05389282, -0.01496052, -2.813374, 1, 1, 1, 1, 1,
-0.05295644, 0.009251096, 0.6901969, 1, 1, 1, 1, 1,
-0.04913335, 1.104757, -1.538038, 1, 1, 1, 1, 1,
-0.04821819, 1.346906, -0.4931476, 1, 1, 1, 1, 1,
-0.04715721, 0.03878766, -1.312147, 1, 1, 1, 1, 1,
-0.04600535, 0.5041007, 0.1581952, 1, 1, 1, 1, 1,
-0.04337637, -2.048527, -3.842344, 1, 1, 1, 1, 1,
-0.04298397, -1.203872, -4.621683, 1, 1, 1, 1, 1,
-0.03724337, 0.506606, -0.1408184, 1, 1, 1, 1, 1,
-0.03479778, 0.3802193, -1.359079, 1, 1, 1, 1, 1,
-0.03096424, -0.7885845, -3.404268, 1, 1, 1, 1, 1,
-0.02891326, -0.8843406, -2.07373, 1, 1, 1, 1, 1,
-0.02291219, 0.7851083, 0.773392, 1, 1, 1, 1, 1,
-0.02281261, 1.017873, 0.05227322, 1, 1, 1, 1, 1,
-0.02155937, -1.423826, -2.384872, 1, 1, 1, 1, 1,
-0.02122983, -0.7414126, -2.783497, 0, 0, 1, 1, 1,
-0.02107539, -0.0520918, -2.648938, 1, 0, 0, 1, 1,
-0.0176995, -1.378307, -2.655184, 1, 0, 0, 1, 1,
-0.01665332, -0.7379063, -2.781217, 1, 0, 0, 1, 1,
-0.01580076, -0.6993807, -3.629146, 1, 0, 0, 1, 1,
-0.01475038, 0.4909741, 0.7697446, 1, 0, 0, 1, 1,
-0.01160083, 0.9627837, 2.305399, 0, 0, 0, 1, 1,
-0.0092701, 0.3863591, 1.130161, 0, 0, 0, 1, 1,
-0.004300004, -1.383581, -3.870663, 0, 0, 0, 1, 1,
-0.00395965, -0.5441151, -3.22255, 0, 0, 0, 1, 1,
0.00222386, -0.3965813, 2.15977, 0, 0, 0, 1, 1,
0.008672515, -1.174369, 3.079674, 0, 0, 0, 1, 1,
0.01573823, -0.4866996, 4.139525, 0, 0, 0, 1, 1,
0.01637346, 0.7774035, 0.6553406, 1, 1, 1, 1, 1,
0.0214279, 0.2286227, 0.4418557, 1, 1, 1, 1, 1,
0.02169073, -0.1419359, 4.305773, 1, 1, 1, 1, 1,
0.02739081, 0.2038982, 0.8317575, 1, 1, 1, 1, 1,
0.02808054, 1.407228, -0.1186027, 1, 1, 1, 1, 1,
0.03015944, 2.194253, -0.4562482, 1, 1, 1, 1, 1,
0.03138942, -0.300751, 1.011635, 1, 1, 1, 1, 1,
0.03534371, 1.406078, 2.161157, 1, 1, 1, 1, 1,
0.0386309, 1.293316, -0.8299683, 1, 1, 1, 1, 1,
0.04415476, 1.484754, -0.02982423, 1, 1, 1, 1, 1,
0.04682956, 1.278274, 0.9156484, 1, 1, 1, 1, 1,
0.04963586, 2.802027, -0.6837895, 1, 1, 1, 1, 1,
0.05168495, -0.6683671, 4.945999, 1, 1, 1, 1, 1,
0.05365798, -0.6827806, 5.182046, 1, 1, 1, 1, 1,
0.05837465, 2.289387, -0.6679984, 1, 1, 1, 1, 1,
0.05866035, -0.8471142, 3.517248, 0, 0, 1, 1, 1,
0.06690241, 1.21868, -0.9067584, 1, 0, 0, 1, 1,
0.07203609, -0.9707136, 1.366096, 1, 0, 0, 1, 1,
0.07443239, 0.630586, -0.6687269, 1, 0, 0, 1, 1,
0.07558176, -2.297304, 2.418489, 1, 0, 0, 1, 1,
0.07737719, -0.3497811, 4.033402, 1, 0, 0, 1, 1,
0.07854959, 0.1408776, -0.3659381, 0, 0, 0, 1, 1,
0.08311098, -0.5534649, 3.06106, 0, 0, 0, 1, 1,
0.08325537, -0.4317707, 3.495219, 0, 0, 0, 1, 1,
0.08363297, 0.4875041, -0.9450832, 0, 0, 0, 1, 1,
0.08956286, 0.3249075, 1.711056, 0, 0, 0, 1, 1,
0.08988176, -1.084709, 4.153962, 0, 0, 0, 1, 1,
0.09008926, -0.8439357, 1.773055, 0, 0, 0, 1, 1,
0.09465615, -0.6151321, 0.4759099, 1, 1, 1, 1, 1,
0.09594431, -0.9368257, 0.891044, 1, 1, 1, 1, 1,
0.1058936, 1.179827, -0.3975232, 1, 1, 1, 1, 1,
0.1063942, -1.428666, 3.825752, 1, 1, 1, 1, 1,
0.1089197, -0.3440975, 2.886879, 1, 1, 1, 1, 1,
0.1213144, 0.4814738, -0.009433502, 1, 1, 1, 1, 1,
0.1260962, 0.7581363, 2.060604, 1, 1, 1, 1, 1,
0.1264314, -0.05403361, 0.3005304, 1, 1, 1, 1, 1,
0.1272825, 0.2050439, 0.7526758, 1, 1, 1, 1, 1,
0.1381722, 0.336931, -0.3987849, 1, 1, 1, 1, 1,
0.1428628, -0.1126946, 2.755735, 1, 1, 1, 1, 1,
0.1475842, 0.07033419, 0.8235048, 1, 1, 1, 1, 1,
0.147888, -0.6655102, 1.219556, 1, 1, 1, 1, 1,
0.1542856, -0.7083442, 1.766291, 1, 1, 1, 1, 1,
0.1589706, 1.319553, -1.554336, 1, 1, 1, 1, 1,
0.1621332, 0.04001388, 1.449825, 0, 0, 1, 1, 1,
0.1640125, -0.6710215, 3.063501, 1, 0, 0, 1, 1,
0.1659719, 0.1013551, 1.920251, 1, 0, 0, 1, 1,
0.1683283, -0.8460271, 3.95562, 1, 0, 0, 1, 1,
0.1690084, -0.4051947, 1.95752, 1, 0, 0, 1, 1,
0.169562, 0.09186029, 0.452536, 1, 0, 0, 1, 1,
0.1696741, -1.244505, 4.752166, 0, 0, 0, 1, 1,
0.1760739, 1.369279, 2.755187, 0, 0, 0, 1, 1,
0.1770676, 0.9150777, 1.828617, 0, 0, 0, 1, 1,
0.1796735, 0.782055, 0.8591039, 0, 0, 0, 1, 1,
0.1805188, 0.4399948, 0.3644268, 0, 0, 0, 1, 1,
0.1839482, -0.5814066, 3.086972, 0, 0, 0, 1, 1,
0.1856703, -1.041039, 1.689777, 0, 0, 0, 1, 1,
0.185681, 0.8439495, 0.1124364, 1, 1, 1, 1, 1,
0.189123, 0.6841702, 0.5484232, 1, 1, 1, 1, 1,
0.1892142, -0.5376169, 3.123132, 1, 1, 1, 1, 1,
0.191181, 0.2375049, 1.57703, 1, 1, 1, 1, 1,
0.1964741, -0.9770704, 2.244233, 1, 1, 1, 1, 1,
0.196489, -0.1469532, 3.001132, 1, 1, 1, 1, 1,
0.1971468, -0.5965315, 2.473433, 1, 1, 1, 1, 1,
0.1988308, 0.5107269, 0.8334122, 1, 1, 1, 1, 1,
0.2010768, -0.2726727, 3.060046, 1, 1, 1, 1, 1,
0.2016123, -0.4674084, 3.82191, 1, 1, 1, 1, 1,
0.2019752, -0.3869833, 4.024116, 1, 1, 1, 1, 1,
0.2035836, 2.576382, 1.017273, 1, 1, 1, 1, 1,
0.2114829, 0.4127958, -0.09014762, 1, 1, 1, 1, 1,
0.2123138, 0.249103, 1.32263, 1, 1, 1, 1, 1,
0.2160347, -0.6375014, 2.120385, 1, 1, 1, 1, 1,
0.2165843, 0.4032534, 1.232591, 0, 0, 1, 1, 1,
0.217282, 0.1095645, 2.010413, 1, 0, 0, 1, 1,
0.2176239, 2.006269, -1.519109, 1, 0, 0, 1, 1,
0.2231519, -0.09825024, 2.546807, 1, 0, 0, 1, 1,
0.2267848, -0.3402101, 0.7509357, 1, 0, 0, 1, 1,
0.229476, 1.316925, 0.01444459, 1, 0, 0, 1, 1,
0.2316633, -0.3789524, 1.997923, 0, 0, 0, 1, 1,
0.2452077, -0.8042251, 3.739588, 0, 0, 0, 1, 1,
0.2500564, 1.575437, 0.2994163, 0, 0, 0, 1, 1,
0.2521663, -0.3016029, 0.8430324, 0, 0, 0, 1, 1,
0.2547568, -0.9229921, 2.597566, 0, 0, 0, 1, 1,
0.2607263, -1.202155, 4.32253, 0, 0, 0, 1, 1,
0.272105, 1.621805, -0.7691211, 0, 0, 0, 1, 1,
0.2774928, 1.335612, -0.1463314, 1, 1, 1, 1, 1,
0.2794632, -0.7727153, 3.155259, 1, 1, 1, 1, 1,
0.2794642, -0.4317969, 1.741521, 1, 1, 1, 1, 1,
0.2802201, 0.2530144, -0.9397038, 1, 1, 1, 1, 1,
0.2903303, -0.09893625, 1.326117, 1, 1, 1, 1, 1,
0.2924331, -0.604844, 3.425127, 1, 1, 1, 1, 1,
0.2925933, 1.380388, 1.063208, 1, 1, 1, 1, 1,
0.2932694, -0.8899955, 3.332412, 1, 1, 1, 1, 1,
0.2953196, 0.2747457, 2.007159, 1, 1, 1, 1, 1,
0.2976909, 0.3707936, -1.241299, 1, 1, 1, 1, 1,
0.3005427, 0.2539113, 1.161322, 1, 1, 1, 1, 1,
0.3018067, 0.9184235, 0.1213883, 1, 1, 1, 1, 1,
0.3023734, 0.1001729, 1.677689, 1, 1, 1, 1, 1,
0.3084971, 2.463249, -1.065219, 1, 1, 1, 1, 1,
0.31818, 0.7040208, 0.7910908, 1, 1, 1, 1, 1,
0.3213813, -1.027429, 3.379812, 0, 0, 1, 1, 1,
0.3219762, -0.4741364, 2.557979, 1, 0, 0, 1, 1,
0.3225734, 1.386267, -1.006606, 1, 0, 0, 1, 1,
0.3289808, -0.7359163, 3.005326, 1, 0, 0, 1, 1,
0.3307568, -1.240416, 2.131437, 1, 0, 0, 1, 1,
0.3307884, -0.9409378, 2.708982, 1, 0, 0, 1, 1,
0.3343665, 1.62572, 0.3383096, 0, 0, 0, 1, 1,
0.335989, 3.125181, 1.300752, 0, 0, 0, 1, 1,
0.3393366, -0.3321968, 1.491268, 0, 0, 0, 1, 1,
0.3419144, 0.3110598, 2.788054, 0, 0, 0, 1, 1,
0.3492196, -1.323397, 1.728455, 0, 0, 0, 1, 1,
0.3504189, 0.553947, -0.3773032, 0, 0, 0, 1, 1,
0.3523419, -0.1395, 3.73702, 0, 0, 0, 1, 1,
0.3546395, -1.233992, 3.367937, 1, 1, 1, 1, 1,
0.3600872, 2.653409, -0.3955879, 1, 1, 1, 1, 1,
0.3617078, 0.9766253, 0.8489085, 1, 1, 1, 1, 1,
0.3621553, -0.0798068, 0.5369865, 1, 1, 1, 1, 1,
0.3626234, -1.920651, 2.83725, 1, 1, 1, 1, 1,
0.3628179, -0.9615203, 1.726763, 1, 1, 1, 1, 1,
0.370266, 0.8318484, 1.015892, 1, 1, 1, 1, 1,
0.3708718, -0.09835673, 0.7182074, 1, 1, 1, 1, 1,
0.3750853, 2.04873, 0.5594352, 1, 1, 1, 1, 1,
0.3848377, 1.680843, 2.070816, 1, 1, 1, 1, 1,
0.385469, -0.0738791, 1.991508, 1, 1, 1, 1, 1,
0.3868135, -0.4215463, 1.604182, 1, 1, 1, 1, 1,
0.3923901, 0.1919888, 0.008612061, 1, 1, 1, 1, 1,
0.3956824, -2.070892, 3.276999, 1, 1, 1, 1, 1,
0.3979819, 0.6833229, 1.527751, 1, 1, 1, 1, 1,
0.4000312, 0.8204713, 0.436574, 0, 0, 1, 1, 1,
0.4006729, -0.2652785, 2.927032, 1, 0, 0, 1, 1,
0.4113286, -0.9401437, 2.708902, 1, 0, 0, 1, 1,
0.421174, -1.291765, 3.158572, 1, 0, 0, 1, 1,
0.4227799, 0.1054231, 1.791613, 1, 0, 0, 1, 1,
0.4270493, -1.615486, 3.600078, 1, 0, 0, 1, 1,
0.4321915, 0.9006523, 1.458028, 0, 0, 0, 1, 1,
0.432306, 1.674449, -1.488319, 0, 0, 0, 1, 1,
0.4352755, 0.1625002, 1.197265, 0, 0, 0, 1, 1,
0.436091, -1.793399, 3.359106, 0, 0, 0, 1, 1,
0.4389704, -1.661476, 3.906882, 0, 0, 0, 1, 1,
0.440395, 0.5640345, 2.151214, 0, 0, 0, 1, 1,
0.4412844, 2.667127, 0.9371311, 0, 0, 0, 1, 1,
0.44174, -1.639727, 3.536235, 1, 1, 1, 1, 1,
0.4507008, -1.573417, 2.937518, 1, 1, 1, 1, 1,
0.4541085, 2.132481, 0.3064905, 1, 1, 1, 1, 1,
0.4559002, -1.407952, 3.558676, 1, 1, 1, 1, 1,
0.4566623, -0.1565689, 1.473858, 1, 1, 1, 1, 1,
0.4566868, -0.4332427, 2.915302, 1, 1, 1, 1, 1,
0.4602468, 0.9833162, 2.431829, 1, 1, 1, 1, 1,
0.4647013, -0.2776665, 1.818166, 1, 1, 1, 1, 1,
0.4661114, -0.4453924, 4.278323, 1, 1, 1, 1, 1,
0.4668943, 0.4351887, 0.3982494, 1, 1, 1, 1, 1,
0.4683989, -0.2412074, 3.81143, 1, 1, 1, 1, 1,
0.4736765, 0.5794226, 1.822627, 1, 1, 1, 1, 1,
0.4763659, 0.06802181, 1.282328, 1, 1, 1, 1, 1,
0.4796741, -0.5443044, 1.503407, 1, 1, 1, 1, 1,
0.4857419, 1.220482, 0.6268854, 1, 1, 1, 1, 1,
0.487032, 0.2938512, 0.879948, 0, 0, 1, 1, 1,
0.4925133, -0.6110744, 1.538637, 1, 0, 0, 1, 1,
0.4932608, 0.5236905, 1.200919, 1, 0, 0, 1, 1,
0.5002552, -0.1628512, 2.015021, 1, 0, 0, 1, 1,
0.5013121, -0.3531388, 1.361712, 1, 0, 0, 1, 1,
0.5024715, 0.4561485, -0.0758954, 1, 0, 0, 1, 1,
0.502857, 0.2510602, 0.9377392, 0, 0, 0, 1, 1,
0.5060019, 2.147161, 1.894189, 0, 0, 0, 1, 1,
0.5085688, 1.382507, 0.8057055, 0, 0, 0, 1, 1,
0.508738, 0.7499713, -0.1831119, 0, 0, 0, 1, 1,
0.5144992, 0.08429211, -0.2648202, 0, 0, 0, 1, 1,
0.5189182, -1.273522, 1.931051, 0, 0, 0, 1, 1,
0.5198928, -0.7454233, 0.7436456, 0, 0, 0, 1, 1,
0.519916, 1.563703, 1.315531, 1, 1, 1, 1, 1,
0.5205669, 1.282557, 1.188904, 1, 1, 1, 1, 1,
0.5285984, -0.5835876, 3.846406, 1, 1, 1, 1, 1,
0.5327158, -1.331276, 3.459364, 1, 1, 1, 1, 1,
0.5339905, -0.8259073, 2.586463, 1, 1, 1, 1, 1,
0.5370056, 0.6620144, 0.304038, 1, 1, 1, 1, 1,
0.544375, 0.83246, -0.3913375, 1, 1, 1, 1, 1,
0.5491652, -1.206481, 1.94175, 1, 1, 1, 1, 1,
0.5532901, 0.08168896, 1.524075, 1, 1, 1, 1, 1,
0.5622127, -0.1146521, 1.629483, 1, 1, 1, 1, 1,
0.5648047, -0.3746645, 2.569456, 1, 1, 1, 1, 1,
0.5676827, 0.4063558, 1.818115, 1, 1, 1, 1, 1,
0.5687979, 0.1882219, 1.87785, 1, 1, 1, 1, 1,
0.5714957, -0.05982855, 3.265465, 1, 1, 1, 1, 1,
0.5730971, 1.677459, 0.1911213, 1, 1, 1, 1, 1,
0.5809065, 0.4356184, 0.3797654, 0, 0, 1, 1, 1,
0.585107, 0.5455218, 0.7522635, 1, 0, 0, 1, 1,
0.5986351, -1.173979, 3.72243, 1, 0, 0, 1, 1,
0.6004798, -1.077536, 2.720506, 1, 0, 0, 1, 1,
0.6022393, 0.09110104, -0.5971739, 1, 0, 0, 1, 1,
0.6039447, -1.333994, 1.235031, 1, 0, 0, 1, 1,
0.6055721, -0.4118046, 3.726688, 0, 0, 0, 1, 1,
0.6145083, 0.7732296, 0.126798, 0, 0, 0, 1, 1,
0.6149335, -0.8136328, 2.586643, 0, 0, 0, 1, 1,
0.6151201, -0.2441579, 1.534802, 0, 0, 0, 1, 1,
0.6221761, -1.095477, 1.910283, 0, 0, 0, 1, 1,
0.6232123, 1.129514, 0.126789, 0, 0, 0, 1, 1,
0.623333, -2.185659, 4.8887, 0, 0, 0, 1, 1,
0.6234953, -0.4350846, 3.038155, 1, 1, 1, 1, 1,
0.6277683, -2.025365, 3.876538, 1, 1, 1, 1, 1,
0.6292408, 0.06219534, 0.1242482, 1, 1, 1, 1, 1,
0.6293145, 1.067348, -1.151237, 1, 1, 1, 1, 1,
0.6336872, -0.7956836, 2.449633, 1, 1, 1, 1, 1,
0.6340563, 0.4047754, 0.6850038, 1, 1, 1, 1, 1,
0.6355741, 0.5934221, 0.948854, 1, 1, 1, 1, 1,
0.6357979, -1.571763, 0.4800947, 1, 1, 1, 1, 1,
0.638126, 0.4356548, 1.642485, 1, 1, 1, 1, 1,
0.6410528, 0.8141385, 1.704671, 1, 1, 1, 1, 1,
0.6430781, -0.3281148, 0.4995829, 1, 1, 1, 1, 1,
0.6437147, 0.8041279, 0.3286516, 1, 1, 1, 1, 1,
0.648643, -0.4336995, 1.703658, 1, 1, 1, 1, 1,
0.659206, 0.8077477, 0.6906558, 1, 1, 1, 1, 1,
0.6656387, -1.344005, 4.144069, 1, 1, 1, 1, 1,
0.6674823, 0.8211597, 2.252479, 0, 0, 1, 1, 1,
0.668368, -0.7501079, 1.730547, 1, 0, 0, 1, 1,
0.672654, -0.8407835, 3.231336, 1, 0, 0, 1, 1,
0.6763994, 0.3905979, 1.845623, 1, 0, 0, 1, 1,
0.681933, 1.71659, -0.556446, 1, 0, 0, 1, 1,
0.68369, -1.551161, 4.429989, 1, 0, 0, 1, 1,
0.6899617, 0.6715344, -0.2187622, 0, 0, 0, 1, 1,
0.6903181, -1.089946, 2.374205, 0, 0, 0, 1, 1,
0.6904706, 1.06704, 0.04321156, 0, 0, 0, 1, 1,
0.6918486, -1.676268, 2.592445, 0, 0, 0, 1, 1,
0.6977506, 0.299719, -1.751993, 0, 0, 0, 1, 1,
0.6994324, 0.7595915, 1.264533, 0, 0, 0, 1, 1,
0.7032378, 0.6138299, -0.6810514, 0, 0, 0, 1, 1,
0.7176293, -1.294374, 3.785844, 1, 1, 1, 1, 1,
0.7268912, -1.837054, 2.546629, 1, 1, 1, 1, 1,
0.7269431, 1.292491, -0.161169, 1, 1, 1, 1, 1,
0.727116, 0.557995, 2.755749, 1, 1, 1, 1, 1,
0.7280609, 0.7884772, 1.368658, 1, 1, 1, 1, 1,
0.7288541, -1.199809, 3.566159, 1, 1, 1, 1, 1,
0.7294127, 0.09586621, 1.462123, 1, 1, 1, 1, 1,
0.733308, 0.3983778, -0.9597197, 1, 1, 1, 1, 1,
0.7361848, 0.3816988, 1.086209, 1, 1, 1, 1, 1,
0.7366077, 0.1180659, 1.920304, 1, 1, 1, 1, 1,
0.738434, 1.122215, -0.1435675, 1, 1, 1, 1, 1,
0.739897, -1.795898, 0.9617116, 1, 1, 1, 1, 1,
0.7419186, 0.1403031, 1.615385, 1, 1, 1, 1, 1,
0.7430875, 0.8081393, 1.679219, 1, 1, 1, 1, 1,
0.743467, -1.433214, 3.215856, 1, 1, 1, 1, 1,
0.7470593, -0.7468634, 2.578011, 0, 0, 1, 1, 1,
0.7538137, -0.1490514, 2.074205, 1, 0, 0, 1, 1,
0.7583837, 1.48333, 0.2865051, 1, 0, 0, 1, 1,
0.760461, -0.8440766, 2.161159, 1, 0, 0, 1, 1,
0.7645859, -0.1684583, 2.184256, 1, 0, 0, 1, 1,
0.7654997, 1.369838, 0.6873277, 1, 0, 0, 1, 1,
0.7693691, -0.3754523, 2.426203, 0, 0, 0, 1, 1,
0.7712598, -0.003764441, 2.651725, 0, 0, 0, 1, 1,
0.7730013, -0.09645693, 1.202142, 0, 0, 0, 1, 1,
0.774323, 1.056316, 1.540715, 0, 0, 0, 1, 1,
0.7789993, 0.9921976, 1.568649, 0, 0, 0, 1, 1,
0.780449, -0.5757718, 0.9821298, 0, 0, 0, 1, 1,
0.783421, -0.5000658, 2.497781, 0, 0, 0, 1, 1,
0.7841666, -0.5725868, 1.349439, 1, 1, 1, 1, 1,
0.7875054, 1.795781, 2.937251, 1, 1, 1, 1, 1,
0.7898721, -1.018925, 0.3677602, 1, 1, 1, 1, 1,
0.7998045, 0.8731542, 0.4280335, 1, 1, 1, 1, 1,
0.804803, 0.4173035, 0.3374322, 1, 1, 1, 1, 1,
0.8108268, 1.082688, -0.3400855, 1, 1, 1, 1, 1,
0.8122758, 0.419578, 1.513243, 1, 1, 1, 1, 1,
0.8125102, -2.459558, 3.714655, 1, 1, 1, 1, 1,
0.8250036, 0.1833945, -0.005559697, 1, 1, 1, 1, 1,
0.827271, -0.5870258, 0.3001247, 1, 1, 1, 1, 1,
0.8274937, -0.172321, 2.986892, 1, 1, 1, 1, 1,
0.8286487, 0.9321849, 3.764093, 1, 1, 1, 1, 1,
0.8353509, 0.6116017, 0.6180031, 1, 1, 1, 1, 1,
0.8417335, -0.534786, 2.584939, 1, 1, 1, 1, 1,
0.8419926, 0.4095755, 2.400207, 1, 1, 1, 1, 1,
0.8445315, 1.890466, -0.1665694, 0, 0, 1, 1, 1,
0.8450442, 0.676875, 0.1865016, 1, 0, 0, 1, 1,
0.8459125, -1.84058, 0.803515, 1, 0, 0, 1, 1,
0.8490908, -0.01273057, 1.268541, 1, 0, 0, 1, 1,
0.8498602, -0.5325541, 2.798009, 1, 0, 0, 1, 1,
0.8510592, 0.5066495, -0.1228405, 1, 0, 0, 1, 1,
0.8526116, -0.09127088, 0.5222051, 0, 0, 0, 1, 1,
0.8665588, 1.224224, 0.7743576, 0, 0, 0, 1, 1,
0.8780577, 0.4678286, 2.468509, 0, 0, 0, 1, 1,
0.8782425, -0.7025188, 2.63688, 0, 0, 0, 1, 1,
0.8787698, -0.6417621, 0.1346114, 0, 0, 0, 1, 1,
0.8788438, 0.8942667, -0.1697649, 0, 0, 0, 1, 1,
0.8793781, -0.8849483, 3.041941, 0, 0, 0, 1, 1,
0.8804975, -1.459061, 2.369318, 1, 1, 1, 1, 1,
0.8816495, 0.1765913, 0.4293116, 1, 1, 1, 1, 1,
0.8851261, 0.1115794, 1.625021, 1, 1, 1, 1, 1,
0.8856246, -1.118999, 2.426358, 1, 1, 1, 1, 1,
0.8878682, 0.7461339, 1.71025, 1, 1, 1, 1, 1,
0.8887538, 0.3375711, 1.190961, 1, 1, 1, 1, 1,
0.8911076, 0.7269458, -0.03343089, 1, 1, 1, 1, 1,
0.8925037, 0.2994697, 0.2088344, 1, 1, 1, 1, 1,
0.8927322, -0.6836721, 2.859253, 1, 1, 1, 1, 1,
0.8971269, 1.079873, 0.6977613, 1, 1, 1, 1, 1,
0.8993355, -0.6556144, 1.120003, 1, 1, 1, 1, 1,
0.8997809, -1.389746, 3.503837, 1, 1, 1, 1, 1,
0.9005984, 0.65602, -0.036176, 1, 1, 1, 1, 1,
0.9071071, -0.8268926, 2.482493, 1, 1, 1, 1, 1,
0.9147078, 1.264805, -0.03470165, 1, 1, 1, 1, 1,
0.9154666, -0.3705937, 2.607634, 0, 0, 1, 1, 1,
0.9264068, 0.9064941, 1.902819, 1, 0, 0, 1, 1,
0.9268274, 1.905079, 0.6979612, 1, 0, 0, 1, 1,
0.927743, 0.4090381, 2.063271, 1, 0, 0, 1, 1,
0.9328384, -0.3831447, 2.020066, 1, 0, 0, 1, 1,
0.9342161, -0.4526717, 2.516551, 1, 0, 0, 1, 1,
0.9343992, -0.4811029, 3.377729, 0, 0, 0, 1, 1,
0.9428818, -0.4551609, 2.222511, 0, 0, 0, 1, 1,
0.9428819, -1.055386, 2.140344, 0, 0, 0, 1, 1,
0.9503692, 1.980772, 0.3804171, 0, 0, 0, 1, 1,
0.9505272, 0.4319505, 0.8435971, 0, 0, 0, 1, 1,
0.9507872, -1.486177, 4.612344, 0, 0, 0, 1, 1,
0.9517235, -0.03426846, 1.268747, 0, 0, 0, 1, 1,
0.9584423, -0.5114719, 2.014602, 1, 1, 1, 1, 1,
0.9586964, -0.834117, 1.745434, 1, 1, 1, 1, 1,
0.9609285, 0.05763758, -0.09658458, 1, 1, 1, 1, 1,
0.9612652, 1.858687, -0.09154519, 1, 1, 1, 1, 1,
0.9685602, -0.507618, 4.282839, 1, 1, 1, 1, 1,
0.9751641, -1.859804, 1.483087, 1, 1, 1, 1, 1,
0.9786843, 0.1330563, 3.250963, 1, 1, 1, 1, 1,
0.9841675, 1.63108, 0.09567485, 1, 1, 1, 1, 1,
0.9877085, 0.1929423, 2.685106, 1, 1, 1, 1, 1,
0.9944439, -0.01738243, -0.08859347, 1, 1, 1, 1, 1,
0.9978268, -1.447905, 2.687562, 1, 1, 1, 1, 1,
1.00574, -1.008602, 2.675171, 1, 1, 1, 1, 1,
1.008168, 1.135858, 2.259261, 1, 1, 1, 1, 1,
1.016357, 0.1871787, 0.6109142, 1, 1, 1, 1, 1,
1.022735, 0.6306387, 1.715992, 1, 1, 1, 1, 1,
1.039711, 0.1438965, 1.182853, 0, 0, 1, 1, 1,
1.041402, -1.990017, 4.725176, 1, 0, 0, 1, 1,
1.041962, -0.1603823, 1.971253, 1, 0, 0, 1, 1,
1.043531, -1.807375, 1.39847, 1, 0, 0, 1, 1,
1.04952, -0.7139653, 2.053206, 1, 0, 0, 1, 1,
1.055216, -1.219096, 1.82212, 1, 0, 0, 1, 1,
1.055763, -0.7170071, 2.487852, 0, 0, 0, 1, 1,
1.065524, -0.4076889, 0.3243756, 0, 0, 0, 1, 1,
1.067887, 2.046942, 0.765291, 0, 0, 0, 1, 1,
1.075576, -0.3322818, 1.16678, 0, 0, 0, 1, 1,
1.075696, 0.7685694, 2.463197, 0, 0, 0, 1, 1,
1.077503, 1.466296, -0.1629467, 0, 0, 0, 1, 1,
1.088225, -0.7502887, 0.9619507, 0, 0, 0, 1, 1,
1.094678, 0.4615806, 1.353144, 1, 1, 1, 1, 1,
1.097081, -0.5200028, 1.805352, 1, 1, 1, 1, 1,
1.097973, -1.725139, 1.33842, 1, 1, 1, 1, 1,
1.098138, 0.8063495, 0.1511874, 1, 1, 1, 1, 1,
1.098512, -0.6136102, 1.128942, 1, 1, 1, 1, 1,
1.101923, 0.6285671, -0.7229363, 1, 1, 1, 1, 1,
1.105346, -2.128093, 3.61544, 1, 1, 1, 1, 1,
1.107311, 1.176525, 0.72498, 1, 1, 1, 1, 1,
1.11669, 1.134144, 0.5161349, 1, 1, 1, 1, 1,
1.120494, 0.2320914, 1.133556, 1, 1, 1, 1, 1,
1.122081, -0.8233038, 1.162154, 1, 1, 1, 1, 1,
1.130084, -1.065258, 2.375153, 1, 1, 1, 1, 1,
1.130332, -0.3398598, 1.494332, 1, 1, 1, 1, 1,
1.133986, 0.5439896, 1.860713, 1, 1, 1, 1, 1,
1.136962, 0.4568797, -0.2023756, 1, 1, 1, 1, 1,
1.137611, -0.2229036, 1.148585, 0, 0, 1, 1, 1,
1.141323, 0.3501785, 0.3738548, 1, 0, 0, 1, 1,
1.15663, -1.47734, 1.538679, 1, 0, 0, 1, 1,
1.162831, -0.3222768, 3.595885, 1, 0, 0, 1, 1,
1.168291, -0.7013406, 2.576074, 1, 0, 0, 1, 1,
1.174643, -0.198465, 2.177626, 1, 0, 0, 1, 1,
1.175642, 0.7711436, 3.692886, 0, 0, 0, 1, 1,
1.178749, 1.501849, -0.4669105, 0, 0, 0, 1, 1,
1.2023, -1.190924, 3.611072, 0, 0, 0, 1, 1,
1.210056, 1.251498, 0.9643898, 0, 0, 0, 1, 1,
1.211071, -0.3545367, 2.971212, 0, 0, 0, 1, 1,
1.216244, 0.6841937, 0.3826612, 0, 0, 0, 1, 1,
1.216259, 0.6294911, 1.303219, 0, 0, 0, 1, 1,
1.219021, -0.60203, 3.042844, 1, 1, 1, 1, 1,
1.221827, 1.192897, 0.707856, 1, 1, 1, 1, 1,
1.224245, -0.9675066, 1.963984, 1, 1, 1, 1, 1,
1.225588, -0.2318574, 1.629739, 1, 1, 1, 1, 1,
1.227196, -1.52835, 0.8822076, 1, 1, 1, 1, 1,
1.240886, 0.1393252, 0.7282903, 1, 1, 1, 1, 1,
1.243685, -1.331609, 2.310772, 1, 1, 1, 1, 1,
1.244295, 1.404326, 2.2533, 1, 1, 1, 1, 1,
1.252061, -0.4128032, 0.808842, 1, 1, 1, 1, 1,
1.254971, 0.7367432, 0.403885, 1, 1, 1, 1, 1,
1.257626, -0.8843473, 1.831922, 1, 1, 1, 1, 1,
1.260908, -0.4053766, 3.304561, 1, 1, 1, 1, 1,
1.289666, 1.324979, 1.78104, 1, 1, 1, 1, 1,
1.289969, -0.3073365, 2.893973, 1, 1, 1, 1, 1,
1.293453, -1.967732, 1.431752, 1, 1, 1, 1, 1,
1.295572, 0.8791975, 1.980982, 0, 0, 1, 1, 1,
1.299314, 0.7098882, 0.4365175, 1, 0, 0, 1, 1,
1.306372, 1.722203, 0.4053659, 1, 0, 0, 1, 1,
1.313283, -0.5302984, 1.942982, 1, 0, 0, 1, 1,
1.319415, -1.068149, 1.412697, 1, 0, 0, 1, 1,
1.324629, -0.1473519, 1.855841, 1, 0, 0, 1, 1,
1.325519, 1.170805, 1.965498, 0, 0, 0, 1, 1,
1.327476, 0.5907539, 2.232428, 0, 0, 0, 1, 1,
1.333862, -1.401443, 3.326665, 0, 0, 0, 1, 1,
1.334521, 0.2351339, 2.226889, 0, 0, 0, 1, 1,
1.336182, -0.1245867, 1.756647, 0, 0, 0, 1, 1,
1.337092, -0.3773006, 1.40996, 0, 0, 0, 1, 1,
1.353013, 0.7921096, 1.006336, 0, 0, 0, 1, 1,
1.354153, -1.222189, 2.236647, 1, 1, 1, 1, 1,
1.362632, -0.7169613, 2.086202, 1, 1, 1, 1, 1,
1.36753, 0.1379572, 1.235365, 1, 1, 1, 1, 1,
1.371732, -0.4117417, 0.03725221, 1, 1, 1, 1, 1,
1.37503, -0.2322418, 1.3204, 1, 1, 1, 1, 1,
1.375719, 0.77138, 0.07672234, 1, 1, 1, 1, 1,
1.385497, 0.09093178, 0.3041734, 1, 1, 1, 1, 1,
1.391275, 0.2635432, 2.744975, 1, 1, 1, 1, 1,
1.393984, 0.6370565, 1.302192, 1, 1, 1, 1, 1,
1.402681, 0.3739024, 1.75171, 1, 1, 1, 1, 1,
1.403233, -1.378401, 1.150136, 1, 1, 1, 1, 1,
1.41538, 1.41775, 0.0932365, 1, 1, 1, 1, 1,
1.422217, -1.043821, 2.709821, 1, 1, 1, 1, 1,
1.433647, -0.6521858, 1.195277, 1, 1, 1, 1, 1,
1.435582, -0.4550392, 1.181387, 1, 1, 1, 1, 1,
1.439249, -1.107521, 2.081783, 0, 0, 1, 1, 1,
1.443879, 1.716797, 0.9465545, 1, 0, 0, 1, 1,
1.45641, 1.241622, 0.9448437, 1, 0, 0, 1, 1,
1.457549, -1.489571, 2.945879, 1, 0, 0, 1, 1,
1.461148, 0.007823345, 1.929292, 1, 0, 0, 1, 1,
1.465812, -1.948711, 3.059659, 1, 0, 0, 1, 1,
1.469227, 1.065599, 1.889646, 0, 0, 0, 1, 1,
1.469993, 0.5940395, 2.932591, 0, 0, 0, 1, 1,
1.471561, 1.16352, 2.276014, 0, 0, 0, 1, 1,
1.4725, 0.3842909, 2.47573, 0, 0, 0, 1, 1,
1.479097, -0.1729698, 1.815948, 0, 0, 0, 1, 1,
1.480985, 0.1480065, 0.3640794, 0, 0, 0, 1, 1,
1.499089, -0.6167772, 2.223522, 0, 0, 0, 1, 1,
1.499487, 0.8878603, 1.694524, 1, 1, 1, 1, 1,
1.507589, 0.2576153, 0.7760556, 1, 1, 1, 1, 1,
1.518504, -0.9001993, 2.750419, 1, 1, 1, 1, 1,
1.538328, 0.2174904, 1.370259, 1, 1, 1, 1, 1,
1.538485, -0.1473365, 0.5467126, 1, 1, 1, 1, 1,
1.541321, -0.5267215, 0.1831003, 1, 1, 1, 1, 1,
1.55319, -0.2184376, 0.6771659, 1, 1, 1, 1, 1,
1.565332, -0.6818575, 0.9219543, 1, 1, 1, 1, 1,
1.57333, 1.283008, 0.7780751, 1, 1, 1, 1, 1,
1.604887, 0.7988831, 0.7583227, 1, 1, 1, 1, 1,
1.613444, -0.5726575, 3.036024, 1, 1, 1, 1, 1,
1.621715, -1.087955, 1.969135, 1, 1, 1, 1, 1,
1.627208, 0.03000804, 1.669977, 1, 1, 1, 1, 1,
1.635995, 1.862017, 2.507716, 1, 1, 1, 1, 1,
1.649776, 0.9235305, -0.1122008, 1, 1, 1, 1, 1,
1.672236, 0.1203375, 0.4754491, 0, 0, 1, 1, 1,
1.724144, 0.1399944, 1.141327, 1, 0, 0, 1, 1,
1.725885, -1.241907, 0.1045107, 1, 0, 0, 1, 1,
1.740104, -0.3388044, 3.510345, 1, 0, 0, 1, 1,
1.743627, -0.4527978, 0.5166075, 1, 0, 0, 1, 1,
1.753173, -1.663289, 3.001788, 1, 0, 0, 1, 1,
1.763976, -2.087007, 2.450773, 0, 0, 0, 1, 1,
1.772604, 0.1960342, 2.069419, 0, 0, 0, 1, 1,
1.773736, -1.595966, 3.518235, 0, 0, 0, 1, 1,
1.786597, -0.5546446, 0.05782751, 0, 0, 0, 1, 1,
1.790816, -0.6818759, 1.342115, 0, 0, 0, 1, 1,
1.792688, 0.3729777, 1.288769, 0, 0, 0, 1, 1,
1.825368, 2.210761, -0.08221159, 0, 0, 0, 1, 1,
1.842072, 0.4491083, 2.958731, 1, 1, 1, 1, 1,
1.86267, -1.413757, 3.863755, 1, 1, 1, 1, 1,
1.906705, -0.4781814, 0.5918736, 1, 1, 1, 1, 1,
1.934069, 1.171022, 2.447558, 1, 1, 1, 1, 1,
1.93665, 0.1865992, 1.286096, 1, 1, 1, 1, 1,
1.938728, -0.8667456, 1.616391, 1, 1, 1, 1, 1,
1.941168, 1.597669, -0.6685064, 1, 1, 1, 1, 1,
1.944121, 0.7525616, 1.700515, 1, 1, 1, 1, 1,
1.977282, 0.9857884, 0.9586315, 1, 1, 1, 1, 1,
1.977835, 0.3161302, 0.7019604, 1, 1, 1, 1, 1,
1.986566, -1.072373, 4.276405, 1, 1, 1, 1, 1,
1.995333, 0.5943126, 1.151983, 1, 1, 1, 1, 1,
2.079632, 0.3898938, 2.469971, 1, 1, 1, 1, 1,
2.136003, 0.5385895, 1.752149, 1, 1, 1, 1, 1,
2.151542, 0.6848813, 1.489807, 1, 1, 1, 1, 1,
2.163298, -0.9349827, 1.820663, 0, 0, 1, 1, 1,
2.175647, -1.181248, 1.146124, 1, 0, 0, 1, 1,
2.182085, -0.09978677, 0.7889572, 1, 0, 0, 1, 1,
2.186374, -0.295406, 1.388547, 1, 0, 0, 1, 1,
2.189397, 0.6963832, 2.122888, 1, 0, 0, 1, 1,
2.190616, -1.255209, 2.121206, 1, 0, 0, 1, 1,
2.231467, -0.07396501, 0.05062553, 0, 0, 0, 1, 1,
2.255714, 0.6517181, 1.439715, 0, 0, 0, 1, 1,
2.297907, 0.5633479, -0.6489912, 0, 0, 0, 1, 1,
2.3197, 0.303517, 1.624798, 0, 0, 0, 1, 1,
2.342147, -0.1142954, 2.870723, 0, 0, 0, 1, 1,
2.40566, -0.1644422, 0.8209864, 0, 0, 0, 1, 1,
2.503345, 0.8702154, 2.342398, 0, 0, 0, 1, 1,
2.672738, 0.02455493, 1.040463, 1, 1, 1, 1, 1,
2.735625, 1.787316, 1.726717, 1, 1, 1, 1, 1,
2.800884, -0.138826, 0.2587335, 1, 1, 1, 1, 1,
2.969117, -0.847477, 1.294237, 1, 1, 1, 1, 1,
3.035153, 0.5968689, 1.659535, 1, 1, 1, 1, 1,
3.119488, 0.4161469, 1.148841, 1, 1, 1, 1, 1,
3.307724, -0.7899289, 2.254881, 1, 1, 1, 1, 1
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
var radius = 9.93503;
var distance = 34.89637;
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
mvMatrix.translate( 0.3666716, -0.1066102, 0.4191151 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.89637);
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