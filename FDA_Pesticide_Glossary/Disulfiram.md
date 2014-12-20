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
-3.065648, 1.222885, -1.817868, 1, 0, 0, 1,
-3.057625, -1.736737, -3.625225, 1, 0.007843138, 0, 1,
-3.022252, 1.309967, -2.045354, 1, 0.01176471, 0, 1,
-2.742985, -0.5925106, -2.118249, 1, 0.01960784, 0, 1,
-2.679307, 0.256692, -0.1911363, 1, 0.02352941, 0, 1,
-2.628648, -0.1155019, -1.606579, 1, 0.03137255, 0, 1,
-2.602, 0.8230339, -0.06822863, 1, 0.03529412, 0, 1,
-2.514126, -1.053127, -3.122868, 1, 0.04313726, 0, 1,
-2.509466, -0.6789252, -1.402782, 1, 0.04705882, 0, 1,
-2.468503, 1.359368, -0.0410004, 1, 0.05490196, 0, 1,
-2.435813, -0.629898, -1.431314, 1, 0.05882353, 0, 1,
-2.336134, -0.3913977, -1.120199, 1, 0.06666667, 0, 1,
-2.330258, -0.2292157, -2.252903, 1, 0.07058824, 0, 1,
-2.323475, -0.6598672, -1.376452, 1, 0.07843138, 0, 1,
-2.274085, 0.02975675, -0.9332533, 1, 0.08235294, 0, 1,
-2.235548, 0.4167344, -1.599906, 1, 0.09019608, 0, 1,
-2.22038, -0.1422469, -1.852917, 1, 0.09411765, 0, 1,
-2.204999, 0.4526951, -0.7491207, 1, 0.1019608, 0, 1,
-2.199612, -2.149848, -2.515848, 1, 0.1098039, 0, 1,
-2.152052, -0.0456653, -1.14762, 1, 0.1137255, 0, 1,
-2.095279, 0.884953, -0.5737489, 1, 0.1215686, 0, 1,
-2.053018, 1.055138, -1.126665, 1, 0.1254902, 0, 1,
-2.02829, -0.2033864, -0.8214535, 1, 0.1333333, 0, 1,
-2.023926, -0.4259216, -2.313195, 1, 0.1372549, 0, 1,
-2.020202, 1.122268, -2.203068, 1, 0.145098, 0, 1,
-2.019385, 0.9689939, -1.350901, 1, 0.1490196, 0, 1,
-1.951504, -0.1701195, -2.577504, 1, 0.1568628, 0, 1,
-1.950385, -0.3785861, -1.950198, 1, 0.1607843, 0, 1,
-1.950036, 1.401418, -1.813236, 1, 0.1686275, 0, 1,
-1.938871, -0.4149984, -2.847738, 1, 0.172549, 0, 1,
-1.928111, 1.019926, 0.3076282, 1, 0.1803922, 0, 1,
-1.927551, 0.1322068, -1.201986, 1, 0.1843137, 0, 1,
-1.92545, -0.08893238, -1.58976, 1, 0.1921569, 0, 1,
-1.916813, -0.03289383, -1.832235, 1, 0.1960784, 0, 1,
-1.882948, -1.655896, -3.934719, 1, 0.2039216, 0, 1,
-1.830997, 0.5814494, 0.03702149, 1, 0.2117647, 0, 1,
-1.805593, 0.3468471, -0.079683, 1, 0.2156863, 0, 1,
-1.802552, -1.148, -2.073703, 1, 0.2235294, 0, 1,
-1.796999, 1.052396, -1.813352, 1, 0.227451, 0, 1,
-1.78926, 0.2610353, -2.134771, 1, 0.2352941, 0, 1,
-1.777615, 0.1877389, -2.354598, 1, 0.2392157, 0, 1,
-1.770832, 1.122603, -1.078503, 1, 0.2470588, 0, 1,
-1.758853, -0.4632534, -3.488225, 1, 0.2509804, 0, 1,
-1.7373, -0.3525216, -1.012595, 1, 0.2588235, 0, 1,
-1.726926, -0.5840674, -2.271618, 1, 0.2627451, 0, 1,
-1.719148, -1.034324, -2.248739, 1, 0.2705882, 0, 1,
-1.708463, 0.3533176, -0.7380013, 1, 0.2745098, 0, 1,
-1.69774, -0.9382517, -2.827894, 1, 0.282353, 0, 1,
-1.674108, -0.8994057, -3.23934, 1, 0.2862745, 0, 1,
-1.66262, 0.7417202, -1.729831, 1, 0.2941177, 0, 1,
-1.654917, 0.3101573, -1.646674, 1, 0.3019608, 0, 1,
-1.654673, 1.703552, -1.567477, 1, 0.3058824, 0, 1,
-1.650097, -0.4737322, -1.587217, 1, 0.3137255, 0, 1,
-1.645175, -0.2652755, -2.412018, 1, 0.3176471, 0, 1,
-1.640635, 0.0041743, -1.876726, 1, 0.3254902, 0, 1,
-1.630277, 1.533405, -0.6939573, 1, 0.3294118, 0, 1,
-1.620732, 0.5451427, -2.515728, 1, 0.3372549, 0, 1,
-1.619945, 2.495433, 0.04207919, 1, 0.3411765, 0, 1,
-1.618548, 0.1725339, -0.9395634, 1, 0.3490196, 0, 1,
-1.584608, 0.6626196, -2.247664, 1, 0.3529412, 0, 1,
-1.580325, 0.5230221, -1.263986, 1, 0.3607843, 0, 1,
-1.57308, -1.641986, -3.664421, 1, 0.3647059, 0, 1,
-1.569198, -0.594116, -2.773942, 1, 0.372549, 0, 1,
-1.555863, 1.011854, -0.8748775, 1, 0.3764706, 0, 1,
-1.536783, -1.740777, -1.889331, 1, 0.3843137, 0, 1,
-1.531123, -0.4345134, -0.2126696, 1, 0.3882353, 0, 1,
-1.53109, 1.175447, -1.614341, 1, 0.3960784, 0, 1,
-1.522784, 0.5225942, -0.3784113, 1, 0.4039216, 0, 1,
-1.514135, 0.8641812, -2.490188, 1, 0.4078431, 0, 1,
-1.510623, -0.4001261, -2.226516, 1, 0.4156863, 0, 1,
-1.507353, 0.5898617, -1.85605, 1, 0.4196078, 0, 1,
-1.506272, -0.5277336, -0.2433072, 1, 0.427451, 0, 1,
-1.504865, 0.3095035, -2.059862, 1, 0.4313726, 0, 1,
-1.501657, -0.4302338, -1.004614, 1, 0.4392157, 0, 1,
-1.478474, -0.8507243, -2.530234, 1, 0.4431373, 0, 1,
-1.472614, 0.002334268, -2.399359, 1, 0.4509804, 0, 1,
-1.469743, 0.8485107, -1.702787, 1, 0.454902, 0, 1,
-1.455451, 2.488559, 0.1425699, 1, 0.4627451, 0, 1,
-1.454376, 0.08237328, -0.6868892, 1, 0.4666667, 0, 1,
-1.444797, -1.434266, -1.336971, 1, 0.4745098, 0, 1,
-1.438648, -0.1407128, -2.222313, 1, 0.4784314, 0, 1,
-1.436901, -0.2455309, 0.3896647, 1, 0.4862745, 0, 1,
-1.431516, -0.3036196, -2.644606, 1, 0.4901961, 0, 1,
-1.426053, -0.7347558, -0.4370106, 1, 0.4980392, 0, 1,
-1.417722, -0.9567947, -1.915115, 1, 0.5058824, 0, 1,
-1.414135, 0.2844047, -0.8008392, 1, 0.509804, 0, 1,
-1.408976, -0.1403356, -2.05854, 1, 0.5176471, 0, 1,
-1.407646, -0.7987021, -2.036569, 1, 0.5215687, 0, 1,
-1.403567, -0.7161318, -2.162307, 1, 0.5294118, 0, 1,
-1.398779, -0.1791132, -3.991763, 1, 0.5333334, 0, 1,
-1.397393, 0.7802286, -1.942852, 1, 0.5411765, 0, 1,
-1.396899, -0.2537701, -4.17028, 1, 0.5450981, 0, 1,
-1.388737, 2.101372, -0.8604077, 1, 0.5529412, 0, 1,
-1.384482, 1.268682, -1.197747, 1, 0.5568628, 0, 1,
-1.377763, 0.01288481, -2.386656, 1, 0.5647059, 0, 1,
-1.376444, -0.05828896, -1.131521, 1, 0.5686275, 0, 1,
-1.37488, -1.621669, -2.03643, 1, 0.5764706, 0, 1,
-1.363407, -0.0238381, -0.01269404, 1, 0.5803922, 0, 1,
-1.351689, 1.346769, -1.955107, 1, 0.5882353, 0, 1,
-1.347351, 1.494514, -0.6326585, 1, 0.5921569, 0, 1,
-1.337461, -0.9419028, -3.859504, 1, 0.6, 0, 1,
-1.335493, -1.724913, -3.051258, 1, 0.6078432, 0, 1,
-1.333102, 2.201384, -0.874646, 1, 0.6117647, 0, 1,
-1.323781, 2.047984, -0.8525891, 1, 0.6196079, 0, 1,
-1.31447, -1.274483, -4.319007, 1, 0.6235294, 0, 1,
-1.311221, 0.5740827, -1.843126, 1, 0.6313726, 0, 1,
-1.298931, -0.8459663, -1.761017, 1, 0.6352941, 0, 1,
-1.290505, -0.3159529, -1.786272, 1, 0.6431373, 0, 1,
-1.286873, 2.132286, -0.3782351, 1, 0.6470588, 0, 1,
-1.286615, 0.3456367, -1.757803, 1, 0.654902, 0, 1,
-1.281868, 0.6858213, -2.901245, 1, 0.6588235, 0, 1,
-1.280373, 1.049832, -0.1503324, 1, 0.6666667, 0, 1,
-1.26898, 0.1545146, -0.8989239, 1, 0.6705883, 0, 1,
-1.266484, -1.26285, -1.893269, 1, 0.6784314, 0, 1,
-1.265718, 0.8942854, -1.860782, 1, 0.682353, 0, 1,
-1.256169, 0.5926209, -0.1424856, 1, 0.6901961, 0, 1,
-1.256014, 0.04940035, -2.18197, 1, 0.6941177, 0, 1,
-1.253268, 0.7080516, -2.683611, 1, 0.7019608, 0, 1,
-1.249795, -1.071212, -2.184482, 1, 0.7098039, 0, 1,
-1.249769, 0.4322692, 0.8018879, 1, 0.7137255, 0, 1,
-1.245706, -0.1043357, -0.9907963, 1, 0.7215686, 0, 1,
-1.243129, -1.17326, -2.718198, 1, 0.7254902, 0, 1,
-1.240645, -1.411915, -2.724032, 1, 0.7333333, 0, 1,
-1.234137, -1.059381, -1.867437, 1, 0.7372549, 0, 1,
-1.232832, 1.489452, -2.032833, 1, 0.7450981, 0, 1,
-1.231125, -2.485909, -4.204869, 1, 0.7490196, 0, 1,
-1.224694, 2.024035, -2.602666, 1, 0.7568628, 0, 1,
-1.22401, 0.7643238, -0.883766, 1, 0.7607843, 0, 1,
-1.216737, 1.971764, -1.645489, 1, 0.7686275, 0, 1,
-1.213816, 1.606958, 1.117708, 1, 0.772549, 0, 1,
-1.211637, 0.8164197, 0.05736546, 1, 0.7803922, 0, 1,
-1.196181, 1.11727, 0.4981507, 1, 0.7843137, 0, 1,
-1.195383, -0.6862953, -1.450995, 1, 0.7921569, 0, 1,
-1.19214, 0.3520079, -1.760824, 1, 0.7960784, 0, 1,
-1.191216, -0.08878659, -2.0515, 1, 0.8039216, 0, 1,
-1.175931, 2.664963, 1.195566, 1, 0.8117647, 0, 1,
-1.174817, 0.02004373, -0.9118432, 1, 0.8156863, 0, 1,
-1.158385, 0.241255, -1.529478, 1, 0.8235294, 0, 1,
-1.157374, -0.4982252, -2.922426, 1, 0.827451, 0, 1,
-1.153248, 1.439175, -1.804338, 1, 0.8352941, 0, 1,
-1.150256, 1.073953, -1.520235, 1, 0.8392157, 0, 1,
-1.143941, -0.8909363, -0.9916211, 1, 0.8470588, 0, 1,
-1.138056, 0.3131494, -1.793735, 1, 0.8509804, 0, 1,
-1.136795, -0.7814469, -1.84603, 1, 0.8588235, 0, 1,
-1.134548, 0.6149074, -2.270546, 1, 0.8627451, 0, 1,
-1.133862, 0.3162971, -1.240158, 1, 0.8705882, 0, 1,
-1.12832, -0.6803221, -2.738693, 1, 0.8745098, 0, 1,
-1.128177, -1.91899, -2.92766, 1, 0.8823529, 0, 1,
-1.122509, -0.7595823, -3.41775, 1, 0.8862745, 0, 1,
-1.122365, 0.4211944, -0.5870547, 1, 0.8941177, 0, 1,
-1.119901, -1.582117, -1.767553, 1, 0.8980392, 0, 1,
-1.117365, -0.4675165, -2.314498, 1, 0.9058824, 0, 1,
-1.112278, 0.235925, -0.728664, 1, 0.9137255, 0, 1,
-1.107998, 0.764466, -1.66899, 1, 0.9176471, 0, 1,
-1.105094, 1.31515, 1.080203, 1, 0.9254902, 0, 1,
-1.103684, 0.2201223, -0.06325055, 1, 0.9294118, 0, 1,
-1.102152, -1.80658, -3.191169, 1, 0.9372549, 0, 1,
-1.100509, 0.7939866, -1.833621, 1, 0.9411765, 0, 1,
-1.099673, 0.5386518, -3.758245, 1, 0.9490196, 0, 1,
-1.090255, -0.6926473, -1.702055, 1, 0.9529412, 0, 1,
-1.088347, 0.4844894, -2.682063, 1, 0.9607843, 0, 1,
-1.078434, 0.7088981, -0.2181853, 1, 0.9647059, 0, 1,
-1.061921, 0.7565673, -0.8464159, 1, 0.972549, 0, 1,
-1.060367, -1.87157, -2.405705, 1, 0.9764706, 0, 1,
-1.044564, -0.0755574, -1.095344, 1, 0.9843137, 0, 1,
-1.040057, -1.297023, -0.6779311, 1, 0.9882353, 0, 1,
-1.038867, -0.1778276, -1.104952, 1, 0.9960784, 0, 1,
-1.038756, 0.3312775, -1.505456, 0.9960784, 1, 0, 1,
-1.004101, 1.280337, -1.177826, 0.9921569, 1, 0, 1,
-0.9963193, 0.2927888, -1.172218, 0.9843137, 1, 0, 1,
-0.9947998, 2.563869, 1.826504, 0.9803922, 1, 0, 1,
-0.9850836, 1.717184, -0.1427123, 0.972549, 1, 0, 1,
-0.9811187, -0.4278468, -0.7029364, 0.9686275, 1, 0, 1,
-0.9795775, 1.414643, -2.009751, 0.9607843, 1, 0, 1,
-0.9789636, 2.017509, -0.8364064, 0.9568627, 1, 0, 1,
-0.977141, 1.166922, -3.007073, 0.9490196, 1, 0, 1,
-0.9753644, -1.309873, -3.202582, 0.945098, 1, 0, 1,
-0.9745435, -1.350918, -1.450838, 0.9372549, 1, 0, 1,
-0.9662862, -0.2488618, -2.217, 0.9333333, 1, 0, 1,
-0.9620695, -0.1204907, -0.1799191, 0.9254902, 1, 0, 1,
-0.9600372, 0.09745528, -1.550248, 0.9215686, 1, 0, 1,
-0.9575465, 0.7593711, -0.03529507, 0.9137255, 1, 0, 1,
-0.9547337, -0.5925741, -1.511622, 0.9098039, 1, 0, 1,
-0.9494323, -1.083297, -2.376563, 0.9019608, 1, 0, 1,
-0.9373174, -0.004481046, -1.804827, 0.8941177, 1, 0, 1,
-0.9306687, -1.906353, -1.523801, 0.8901961, 1, 0, 1,
-0.9206888, -0.4337698, -3.080657, 0.8823529, 1, 0, 1,
-0.919497, -0.4955173, -2.053396, 0.8784314, 1, 0, 1,
-0.9179651, -1.447733, -3.215166, 0.8705882, 1, 0, 1,
-0.9148347, 1.110456, 0.500812, 0.8666667, 1, 0, 1,
-0.9142578, 0.7861239, -0.9846479, 0.8588235, 1, 0, 1,
-0.9121408, -0.8764827, -3.961419, 0.854902, 1, 0, 1,
-0.9120621, 0.08297225, -1.572398, 0.8470588, 1, 0, 1,
-0.9109752, -0.4703374, -3.020607, 0.8431373, 1, 0, 1,
-0.9105539, 0.5498918, -0.3731569, 0.8352941, 1, 0, 1,
-0.90402, -0.5300859, -2.020093, 0.8313726, 1, 0, 1,
-0.8950297, 0.5094482, -0.7881448, 0.8235294, 1, 0, 1,
-0.8944325, -0.9832153, -1.991885, 0.8196079, 1, 0, 1,
-0.8938375, 0.5745913, -0.9362102, 0.8117647, 1, 0, 1,
-0.8922089, 1.001965, -1.888456, 0.8078431, 1, 0, 1,
-0.8887077, 0.5743636, -1.805915, 0.8, 1, 0, 1,
-0.8883723, 0.6747782, -2.349142, 0.7921569, 1, 0, 1,
-0.8852909, -0.4788574, -1.238968, 0.7882353, 1, 0, 1,
-0.879968, 0.9422184, -2.470298, 0.7803922, 1, 0, 1,
-0.8790954, -0.0457343, -2.869395, 0.7764706, 1, 0, 1,
-0.8727766, 0.8812041, 0.7838295, 0.7686275, 1, 0, 1,
-0.8676552, 0.5135225, -0.09266657, 0.7647059, 1, 0, 1,
-0.8673822, -1.306985, -2.908831, 0.7568628, 1, 0, 1,
-0.8664591, -0.6459156, -2.505151, 0.7529412, 1, 0, 1,
-0.8601813, 0.08499607, -2.331475, 0.7450981, 1, 0, 1,
-0.856417, 2.30895, -0.5122222, 0.7411765, 1, 0, 1,
-0.8512166, 0.3179724, -1.637346, 0.7333333, 1, 0, 1,
-0.8491797, 0.4722142, -1.955652, 0.7294118, 1, 0, 1,
-0.8478035, 1.73916, 1.073652, 0.7215686, 1, 0, 1,
-0.8418387, -0.05840663, -3.24055, 0.7176471, 1, 0, 1,
-0.8324676, 0.1801084, -1.566854, 0.7098039, 1, 0, 1,
-0.8316041, -1.568383, -2.356187, 0.7058824, 1, 0, 1,
-0.8292915, 0.00116372, -1.239651, 0.6980392, 1, 0, 1,
-0.8219494, 0.1068594, -0.2923129, 0.6901961, 1, 0, 1,
-0.8195029, 2.325142, -0.6993937, 0.6862745, 1, 0, 1,
-0.7943048, 1.314582, -0.6074423, 0.6784314, 1, 0, 1,
-0.7936647, 0.9733481, 0.8627182, 0.6745098, 1, 0, 1,
-0.7899278, -1.837906, -3.059778, 0.6666667, 1, 0, 1,
-0.784863, -0.04429618, -1.037266, 0.6627451, 1, 0, 1,
-0.7820675, -0.3965815, -2.778838, 0.654902, 1, 0, 1,
-0.7779159, -0.2212687, -0.3174358, 0.6509804, 1, 0, 1,
-0.762575, -0.8591431, -3.163138, 0.6431373, 1, 0, 1,
-0.7558671, 1.573875, -1.488796, 0.6392157, 1, 0, 1,
-0.7544318, 1.932163, -1.555153, 0.6313726, 1, 0, 1,
-0.7489155, -0.3529226, -3.358041, 0.627451, 1, 0, 1,
-0.7459002, 1.671802, -1.406153, 0.6196079, 1, 0, 1,
-0.7440843, -0.4633768, -1.868189, 0.6156863, 1, 0, 1,
-0.743066, -0.5863328, -3.031643, 0.6078432, 1, 0, 1,
-0.7418022, -2.398439, -3.813194, 0.6039216, 1, 0, 1,
-0.7379434, 0.7279841, 1.528854, 0.5960785, 1, 0, 1,
-0.7372227, 0.2502163, -1.437403, 0.5882353, 1, 0, 1,
-0.7300528, 1.271255, -2.16364, 0.5843138, 1, 0, 1,
-0.7260559, 0.5290722, -1.482146, 0.5764706, 1, 0, 1,
-0.7244981, -1.834561, -1.604435, 0.572549, 1, 0, 1,
-0.7231051, -0.6057894, -2.586324, 0.5647059, 1, 0, 1,
-0.7229888, -0.8872904, -1.257117, 0.5607843, 1, 0, 1,
-0.7149759, -1.575498, -4.243577, 0.5529412, 1, 0, 1,
-0.7073286, -1.736756, -3.319522, 0.5490196, 1, 0, 1,
-0.707, 0.5036508, -1.057162, 0.5411765, 1, 0, 1,
-0.7064584, 0.3292747, -2.714176, 0.5372549, 1, 0, 1,
-0.698953, 2.495592, -0.6441452, 0.5294118, 1, 0, 1,
-0.6963373, 0.0177864, -0.9528088, 0.5254902, 1, 0, 1,
-0.6855844, -0.3517734, -2.417246, 0.5176471, 1, 0, 1,
-0.6775215, -0.276574, -2.40834, 0.5137255, 1, 0, 1,
-0.6773903, -0.5469691, -1.816788, 0.5058824, 1, 0, 1,
-0.6732059, 0.3726631, -1.921406, 0.5019608, 1, 0, 1,
-0.672046, -0.7925373, -2.556152, 0.4941176, 1, 0, 1,
-0.6687905, 0.8737696, -2.18615, 0.4862745, 1, 0, 1,
-0.6661524, -0.2153385, -1.885037, 0.4823529, 1, 0, 1,
-0.6635891, -0.1133536, -3.387537, 0.4745098, 1, 0, 1,
-0.662249, 0.7181264, 1.533298, 0.4705882, 1, 0, 1,
-0.6592961, 0.8408365, -0.4840304, 0.4627451, 1, 0, 1,
-0.6576847, -0.4521712, -2.763596, 0.4588235, 1, 0, 1,
-0.6570797, 1.721326, 1.893914, 0.4509804, 1, 0, 1,
-0.651767, -0.6918243, -1.022586, 0.4470588, 1, 0, 1,
-0.6515557, -0.5278234, -2.649678, 0.4392157, 1, 0, 1,
-0.6402936, -0.02453571, -0.2231918, 0.4352941, 1, 0, 1,
-0.6377164, 0.1076964, -2.341166, 0.427451, 1, 0, 1,
-0.6363735, 0.5074918, -0.9132401, 0.4235294, 1, 0, 1,
-0.6304058, 0.08629487, -1.773506, 0.4156863, 1, 0, 1,
-0.6296946, 0.173359, -0.6951649, 0.4117647, 1, 0, 1,
-0.620272, 0.2972155, -1.658408, 0.4039216, 1, 0, 1,
-0.6190947, 0.3470209, -1.281768, 0.3960784, 1, 0, 1,
-0.6161443, -0.245027, -1.016193, 0.3921569, 1, 0, 1,
-0.6069734, -0.8302356, -1.81086, 0.3843137, 1, 0, 1,
-0.6049463, -0.8744752, -3.831007, 0.3803922, 1, 0, 1,
-0.5956711, -0.6596106, -2.973089, 0.372549, 1, 0, 1,
-0.5936251, -0.02458186, -1.151652, 0.3686275, 1, 0, 1,
-0.5925142, 0.3834507, -1.398668, 0.3607843, 1, 0, 1,
-0.5913953, 1.220427, -0.7919661, 0.3568628, 1, 0, 1,
-0.5860127, -0.85935, -1.494015, 0.3490196, 1, 0, 1,
-0.5840492, 1.846098, -0.321948, 0.345098, 1, 0, 1,
-0.5821882, -0.06864016, -2.941968, 0.3372549, 1, 0, 1,
-0.5776, 0.6941869, -0.9725381, 0.3333333, 1, 0, 1,
-0.5762078, 0.1633215, -0.8023795, 0.3254902, 1, 0, 1,
-0.5736827, 0.6289679, -0.7793049, 0.3215686, 1, 0, 1,
-0.5665444, 0.8478515, -0.3004518, 0.3137255, 1, 0, 1,
-0.5592796, -0.1821212, 1.074267, 0.3098039, 1, 0, 1,
-0.5569347, 0.2167, -2.099591, 0.3019608, 1, 0, 1,
-0.5536265, 1.208008, -2.123935, 0.2941177, 1, 0, 1,
-0.5530984, 0.0667012, 0.7431626, 0.2901961, 1, 0, 1,
-0.5454889, 0.1237189, -0.8823823, 0.282353, 1, 0, 1,
-0.5452822, 0.4337787, -0.82618, 0.2784314, 1, 0, 1,
-0.5440677, 1.252338, -0.8385245, 0.2705882, 1, 0, 1,
-0.541496, -1.452139, -3.004735, 0.2666667, 1, 0, 1,
-0.5400934, -0.5108271, -3.698959, 0.2588235, 1, 0, 1,
-0.5383777, 0.7346722, 1.113468, 0.254902, 1, 0, 1,
-0.5378653, -1.363486, -2.102235, 0.2470588, 1, 0, 1,
-0.5375875, -0.5288495, -3.532885, 0.2431373, 1, 0, 1,
-0.5310903, 0.1135848, -0.502722, 0.2352941, 1, 0, 1,
-0.5296032, -0.1043782, -1.082259, 0.2313726, 1, 0, 1,
-0.5245138, 0.2314698, -1.414449, 0.2235294, 1, 0, 1,
-0.5216042, 0.5130294, -1.148119, 0.2196078, 1, 0, 1,
-0.5192011, -0.6475177, -2.688364, 0.2117647, 1, 0, 1,
-0.516578, -0.05260651, -0.7472364, 0.2078431, 1, 0, 1,
-0.5138004, -1.476019, -2.127617, 0.2, 1, 0, 1,
-0.5017772, 1.031511, -0.4295202, 0.1921569, 1, 0, 1,
-0.4982514, -0.03378011, -1.95188, 0.1882353, 1, 0, 1,
-0.4960653, 0.4966728, -1.543868, 0.1803922, 1, 0, 1,
-0.4932402, -1.295282, -3.588482, 0.1764706, 1, 0, 1,
-0.4925364, -1.829095, -2.880644, 0.1686275, 1, 0, 1,
-0.4905871, 1.054291, 0.05264715, 0.1647059, 1, 0, 1,
-0.4902694, -0.097964, -2.159691, 0.1568628, 1, 0, 1,
-0.4889229, 1.642546, -0.02398342, 0.1529412, 1, 0, 1,
-0.4859647, 0.9021995, 1.103996, 0.145098, 1, 0, 1,
-0.4840407, 0.2426737, -3.507092, 0.1411765, 1, 0, 1,
-0.4795596, 0.04024502, -1.93418, 0.1333333, 1, 0, 1,
-0.4708488, -1.248288, -3.817993, 0.1294118, 1, 0, 1,
-0.4684476, 0.3101611, -1.841697, 0.1215686, 1, 0, 1,
-0.4683627, -1.203661, -2.893834, 0.1176471, 1, 0, 1,
-0.4600624, 0.2802944, -2.171182, 0.1098039, 1, 0, 1,
-0.4599348, -0.5166754, -3.464062, 0.1058824, 1, 0, 1,
-0.4582276, -0.5905743, -2.994285, 0.09803922, 1, 0, 1,
-0.4573746, -0.3227571, -3.602521, 0.09019608, 1, 0, 1,
-0.4515955, 1.355368, -0.6629553, 0.08627451, 1, 0, 1,
-0.4498265, 0.3670724, -0.4256707, 0.07843138, 1, 0, 1,
-0.4444128, 2.211218, 0.9222026, 0.07450981, 1, 0, 1,
-0.4408998, 0.325821, -2.091988, 0.06666667, 1, 0, 1,
-0.4345365, -0.7797538, -3.617148, 0.0627451, 1, 0, 1,
-0.4343806, -0.6347933, -2.770924, 0.05490196, 1, 0, 1,
-0.4329635, -0.4468883, -2.021049, 0.05098039, 1, 0, 1,
-0.4325256, -1.140494, -2.674376, 0.04313726, 1, 0, 1,
-0.4306635, 1.188903, 0.143032, 0.03921569, 1, 0, 1,
-0.430182, -1.23262, -2.954775, 0.03137255, 1, 0, 1,
-0.4269819, -0.1000721, -1.025492, 0.02745098, 1, 0, 1,
-0.4253169, 2.044064, 2.113266, 0.01960784, 1, 0, 1,
-0.4246716, -0.7375656, -3.196749, 0.01568628, 1, 0, 1,
-0.4200106, -1.177791, -4.551403, 0.007843138, 1, 0, 1,
-0.408026, -0.5942796, -0.4461274, 0.003921569, 1, 0, 1,
-0.4061195, 1.131957, -0.6640841, 0, 1, 0.003921569, 1,
-0.4039134, 0.6989461, -0.1927826, 0, 1, 0.01176471, 1,
-0.4032646, -1.322256, -2.641653, 0, 1, 0.01568628, 1,
-0.399323, -0.8213426, -2.628435, 0, 1, 0.02352941, 1,
-0.3972113, 0.2376319, -0.1455064, 0, 1, 0.02745098, 1,
-0.3968566, 0.8840233, 0.7960403, 0, 1, 0.03529412, 1,
-0.396345, -1.780043, -0.3847507, 0, 1, 0.03921569, 1,
-0.3952907, -0.6039333, -1.32757, 0, 1, 0.04705882, 1,
-0.3940269, 0.3977489, 0.4732794, 0, 1, 0.05098039, 1,
-0.3881243, -0.5112902, -3.741052, 0, 1, 0.05882353, 1,
-0.3877575, -0.2471427, -3.303012, 0, 1, 0.0627451, 1,
-0.387063, 0.09466166, -1.307656, 0, 1, 0.07058824, 1,
-0.3837177, 0.02267911, -2.647717, 0, 1, 0.07450981, 1,
-0.3819433, -0.1732296, -1.856989, 0, 1, 0.08235294, 1,
-0.3785993, 2.17737, -0.2527911, 0, 1, 0.08627451, 1,
-0.3777831, -0.2651519, -1.220507, 0, 1, 0.09411765, 1,
-0.3743705, -0.1890783, -1.155229, 0, 1, 0.1019608, 1,
-0.3731123, -1.092776, -4.585661, 0, 1, 0.1058824, 1,
-0.3686461, -2.275972, -2.84795, 0, 1, 0.1137255, 1,
-0.3654186, 1.687777, 0.5963621, 0, 1, 0.1176471, 1,
-0.3632523, 0.005027009, -1.318416, 0, 1, 0.1254902, 1,
-0.3612799, -2.81524, -3.425885, 0, 1, 0.1294118, 1,
-0.3588551, -0.5917419, -2.536005, 0, 1, 0.1372549, 1,
-0.3581748, 0.896875, 0.005648849, 0, 1, 0.1411765, 1,
-0.3570682, 1.694999, -0.8677678, 0, 1, 0.1490196, 1,
-0.3568325, -0.8360336, -4.544688, 0, 1, 0.1529412, 1,
-0.3545398, -1.795117, -4.325638, 0, 1, 0.1607843, 1,
-0.3486587, -0.9432701, -2.573109, 0, 1, 0.1647059, 1,
-0.3482778, -0.06334814, -1.187831, 0, 1, 0.172549, 1,
-0.3474627, 0.8736569, -0.3670977, 0, 1, 0.1764706, 1,
-0.3433592, 0.3632195, -0.9398881, 0, 1, 0.1843137, 1,
-0.3393106, 2.361763, -0.5697408, 0, 1, 0.1882353, 1,
-0.3371218, 0.4197378, -2.186808, 0, 1, 0.1960784, 1,
-0.3369025, -1.710577, -3.530537, 0, 1, 0.2039216, 1,
-0.3356263, 0.2580054, 0.01741012, 0, 1, 0.2078431, 1,
-0.3344161, 0.5113125, 0.03081308, 0, 1, 0.2156863, 1,
-0.3323013, 1.409742, -1.432075, 0, 1, 0.2196078, 1,
-0.33225, 0.4642887, -1.659181, 0, 1, 0.227451, 1,
-0.3314924, 1.615489, 0.4402584, 0, 1, 0.2313726, 1,
-0.3290316, 0.3836067, 0.07105532, 0, 1, 0.2392157, 1,
-0.326759, 3.300422, 1.838784, 0, 1, 0.2431373, 1,
-0.325193, -1.428452, -0.8237986, 0, 1, 0.2509804, 1,
-0.3190785, -1.021443, -0.9037394, 0, 1, 0.254902, 1,
-0.3180296, 0.2745253, -1.517544, 0, 1, 0.2627451, 1,
-0.3159865, 0.1701188, -2.572248, 0, 1, 0.2666667, 1,
-0.3122049, 0.02833206, -3.271672, 0, 1, 0.2745098, 1,
-0.3116862, 0.5355198, -0.5694886, 0, 1, 0.2784314, 1,
-0.3105352, -1.203479, -3.88433, 0, 1, 0.2862745, 1,
-0.3083621, -1.006505, -3.683266, 0, 1, 0.2901961, 1,
-0.3051159, -0.06976499, -3.34497, 0, 1, 0.2980392, 1,
-0.3042043, -0.2346474, -2.113532, 0, 1, 0.3058824, 1,
-0.3016441, 0.749935, -0.4667799, 0, 1, 0.3098039, 1,
-0.3007134, -0.3188466, -3.03677, 0, 1, 0.3176471, 1,
-0.299745, 0.3773833, -1.628808, 0, 1, 0.3215686, 1,
-0.2984639, -1.100336, -0.3819799, 0, 1, 0.3294118, 1,
-0.2977898, 1.45505, -0.7642843, 0, 1, 0.3333333, 1,
-0.2968421, 0.3841288, 0.101064, 0, 1, 0.3411765, 1,
-0.2958981, 1.351736, -0.1003035, 0, 1, 0.345098, 1,
-0.2957641, 1.623579, 0.9521511, 0, 1, 0.3529412, 1,
-0.2933204, 0.6757624, -1.647099, 0, 1, 0.3568628, 1,
-0.2931996, -0.7627519, -2.526159, 0, 1, 0.3647059, 1,
-0.2922277, 1.25468, 0.7778075, 0, 1, 0.3686275, 1,
-0.2903767, 0.6137645, 0.8285075, 0, 1, 0.3764706, 1,
-0.2849546, 0.7366112, -1.189369, 0, 1, 0.3803922, 1,
-0.2841413, -1.285037, -4.542945, 0, 1, 0.3882353, 1,
-0.2813632, 0.08880899, -3.35104, 0, 1, 0.3921569, 1,
-0.2807734, -0.3177508, -2.076631, 0, 1, 0.4, 1,
-0.2786968, 0.9157932, -1.452405, 0, 1, 0.4078431, 1,
-0.2776251, -0.1572828, -3.107256, 0, 1, 0.4117647, 1,
-0.2715187, 0.2825755, -1.54222, 0, 1, 0.4196078, 1,
-0.2712444, 0.4954168, -0.39678, 0, 1, 0.4235294, 1,
-0.2674921, -0.4008642, -3.386079, 0, 1, 0.4313726, 1,
-0.2657878, 0.01992571, -0.8863609, 0, 1, 0.4352941, 1,
-0.2656065, 0.2729732, -0.7095145, 0, 1, 0.4431373, 1,
-0.256784, 0.9527497, -0.9766374, 0, 1, 0.4470588, 1,
-0.2556728, 1.564937, 0.6079741, 0, 1, 0.454902, 1,
-0.2519755, 1.037927, -1.05286, 0, 1, 0.4588235, 1,
-0.2517438, 1.237864, -1.78204, 0, 1, 0.4666667, 1,
-0.2504984, 0.3993298, 0.143855, 0, 1, 0.4705882, 1,
-0.2484279, 0.2076186, -1.392238, 0, 1, 0.4784314, 1,
-0.2470928, -1.047953, -3.45246, 0, 1, 0.4823529, 1,
-0.2467778, -0.1264779, -3.853519, 0, 1, 0.4901961, 1,
-0.2454612, 0.6919642, -0.3443818, 0, 1, 0.4941176, 1,
-0.244892, -1.888751, -1.858913, 0, 1, 0.5019608, 1,
-0.2440946, 1.314769, -1.616657, 0, 1, 0.509804, 1,
-0.2426116, 0.5491442, -0.4838024, 0, 1, 0.5137255, 1,
-0.2423033, 0.3552238, -1.231473, 0, 1, 0.5215687, 1,
-0.2400218, 0.5582614, -0.3169141, 0, 1, 0.5254902, 1,
-0.2398965, 0.1652837, -0.9351762, 0, 1, 0.5333334, 1,
-0.2387749, -0.03196845, -1.937407, 0, 1, 0.5372549, 1,
-0.2385235, 0.2220388, -1.741285, 0, 1, 0.5450981, 1,
-0.2358779, -0.4457588, -0.7700701, 0, 1, 0.5490196, 1,
-0.2344528, -0.4676211, -1.348781, 0, 1, 0.5568628, 1,
-0.2312416, 0.4707048, 0.1615825, 0, 1, 0.5607843, 1,
-0.2288321, -2.005734, -5.411758, 0, 1, 0.5686275, 1,
-0.2201622, -0.9126027, -3.97553, 0, 1, 0.572549, 1,
-0.2190776, 1.217321, -2.502175, 0, 1, 0.5803922, 1,
-0.2183336, -0.05830237, -1.670824, 0, 1, 0.5843138, 1,
-0.2138991, 1.110989, 1.791337, 0, 1, 0.5921569, 1,
-0.2100161, -0.6378984, -3.724522, 0, 1, 0.5960785, 1,
-0.2074692, 0.765362, 0.8837457, 0, 1, 0.6039216, 1,
-0.2035074, -1.115872, -3.149879, 0, 1, 0.6117647, 1,
-0.198647, -0.1399495, -4.100113, 0, 1, 0.6156863, 1,
-0.197332, 0.02635823, -1.918803, 0, 1, 0.6235294, 1,
-0.1962526, -0.03355941, -1.292856, 0, 1, 0.627451, 1,
-0.1932132, -0.6404899, -2.459339, 0, 1, 0.6352941, 1,
-0.1922361, -0.7233273, -3.52532, 0, 1, 0.6392157, 1,
-0.1913243, -1.050827, -2.955984, 0, 1, 0.6470588, 1,
-0.1911164, 0.4562689, -0.3416602, 0, 1, 0.6509804, 1,
-0.1882403, -1.606511, -1.054396, 0, 1, 0.6588235, 1,
-0.1832846, -0.7648008, -2.494187, 0, 1, 0.6627451, 1,
-0.1805793, 0.03155112, -0.1376919, 0, 1, 0.6705883, 1,
-0.1793013, -0.5896476, -4.071616, 0, 1, 0.6745098, 1,
-0.1764204, -1.556198, -5.253394, 0, 1, 0.682353, 1,
-0.1753299, -1.100974, -1.610733, 0, 1, 0.6862745, 1,
-0.1747822, 0.1944274, -1.533402, 0, 1, 0.6941177, 1,
-0.1734888, -0.3102665, -2.252852, 0, 1, 0.7019608, 1,
-0.1713463, -0.1994773, -2.357961, 0, 1, 0.7058824, 1,
-0.1666559, 0.5684101, -1.880011, 0, 1, 0.7137255, 1,
-0.1657302, -0.3432094, -0.6081052, 0, 1, 0.7176471, 1,
-0.1584929, 1.552503, -1.369422, 0, 1, 0.7254902, 1,
-0.1579976, 0.5130373, -0.05885353, 0, 1, 0.7294118, 1,
-0.1567726, -0.2245736, -3.425727, 0, 1, 0.7372549, 1,
-0.1565581, 0.3278341, -1.908599, 0, 1, 0.7411765, 1,
-0.149588, 0.2748562, 1.13862, 0, 1, 0.7490196, 1,
-0.149179, -1.28701, -3.219646, 0, 1, 0.7529412, 1,
-0.1483458, -0.08284345, -1.637117, 0, 1, 0.7607843, 1,
-0.1458634, -0.0588121, -0.2870329, 0, 1, 0.7647059, 1,
-0.1452222, 0.3214189, -1.06594, 0, 1, 0.772549, 1,
-0.1405019, 0.8028291, -0.8768269, 0, 1, 0.7764706, 1,
-0.132149, -0.9104896, -1.762501, 0, 1, 0.7843137, 1,
-0.1316866, -0.008331437, -2.70306, 0, 1, 0.7882353, 1,
-0.123894, -0.1197174, -3.41145, 0, 1, 0.7960784, 1,
-0.1238292, -1.755145, -3.800861, 0, 1, 0.8039216, 1,
-0.1198679, 2.314498, -1.622628, 0, 1, 0.8078431, 1,
-0.1174599, -0.6684245, -2.054327, 0, 1, 0.8156863, 1,
-0.11612, -1.338502, -3.619358, 0, 1, 0.8196079, 1,
-0.1098016, 0.07700812, -2.073321, 0, 1, 0.827451, 1,
-0.1086784, 0.0126315, -1.943592, 0, 1, 0.8313726, 1,
-0.1069555, -0.7374349, -2.348618, 0, 1, 0.8392157, 1,
-0.1024835, -0.4869769, -3.201171, 0, 1, 0.8431373, 1,
-0.1022709, -0.2368993, -2.255615, 0, 1, 0.8509804, 1,
-0.0972177, -1.146957, -3.078308, 0, 1, 0.854902, 1,
-0.09439515, 0.1895721, -0.1341875, 0, 1, 0.8627451, 1,
-0.0937998, 0.2897299, -0.9726847, 0, 1, 0.8666667, 1,
-0.09270842, -0.9822743, -3.825829, 0, 1, 0.8745098, 1,
-0.09239709, 1.135519, 1.083732, 0, 1, 0.8784314, 1,
-0.0914355, 0.5292127, -0.07247318, 0, 1, 0.8862745, 1,
-0.09070524, -0.2502351, -3.414394, 0, 1, 0.8901961, 1,
-0.08758865, -0.3522596, -4.748551, 0, 1, 0.8980392, 1,
-0.0832123, -0.3631612, -2.953403, 0, 1, 0.9058824, 1,
-0.07995883, 1.588842, -0.2089034, 0, 1, 0.9098039, 1,
-0.073429, -0.5704622, -1.956814, 0, 1, 0.9176471, 1,
-0.0697505, -0.906537, -3.01623, 0, 1, 0.9215686, 1,
-0.06329497, -0.5085672, -2.377882, 0, 1, 0.9294118, 1,
-0.0630689, -1.496706, -3.645613, 0, 1, 0.9333333, 1,
-0.05950973, -0.3454806, -1.153747, 0, 1, 0.9411765, 1,
-0.057243, -1.92456, -3.909176, 0, 1, 0.945098, 1,
-0.0559759, 1.173406, -0.6029965, 0, 1, 0.9529412, 1,
-0.05569024, 0.01488147, -1.647905, 0, 1, 0.9568627, 1,
-0.05491716, 0.1476672, 0.5025631, 0, 1, 0.9647059, 1,
-0.05235978, -0.2902837, -2.902679, 0, 1, 0.9686275, 1,
-0.04909687, -0.845288, -1.28306, 0, 1, 0.9764706, 1,
-0.04079585, 0.4272186, -0.5864839, 0, 1, 0.9803922, 1,
-0.04022132, 0.06115278, -0.2313598, 0, 1, 0.9882353, 1,
-0.0386505, -0.3110027, -4.429422, 0, 1, 0.9921569, 1,
-0.03377715, -0.9110353, -0.7798489, 0, 1, 1, 1,
-0.0323061, -0.3688819, -2.677545, 0, 0.9921569, 1, 1,
-0.03009788, -0.3670756, -1.600477, 0, 0.9882353, 1, 1,
-0.01449208, -0.3557789, -2.95764, 0, 0.9803922, 1, 1,
-0.01401493, 0.009227362, -3.52851, 0, 0.9764706, 1, 1,
-0.01212358, 1.216951, 1.446376, 0, 0.9686275, 1, 1,
-0.01104168, -0.2114757, -4.459828, 0, 0.9647059, 1, 1,
-0.009801216, -0.4962381, -2.955282, 0, 0.9568627, 1, 1,
-0.007913006, -2.059736, -3.19992, 0, 0.9529412, 1, 1,
-0.007545137, 1.239264, 1.013253, 0, 0.945098, 1, 1,
-0.007110327, 1.051779, 0.4061139, 0, 0.9411765, 1, 1,
-0.005082722, -0.198037, -3.728544, 0, 0.9333333, 1, 1,
-0.005003266, 1.552014, -0.6885684, 0, 0.9294118, 1, 1,
-0.004633924, -0.8247063, -3.62087, 0, 0.9215686, 1, 1,
-0.00308328, 0.6062454, 0.240536, 0, 0.9176471, 1, 1,
-0.002333343, 1.478673, 0.4492423, 0, 0.9098039, 1, 1,
-0.001891452, 1.031089, 0.002637814, 0, 0.9058824, 1, 1,
-0.001161141, -0.9551491, -2.973432, 0, 0.8980392, 1, 1,
0.01383501, -2.043778, 0.8424277, 0, 0.8901961, 1, 1,
0.01435477, -0.7218897, 2.99649, 0, 0.8862745, 1, 1,
0.01530284, -0.0435352, 1.586466, 0, 0.8784314, 1, 1,
0.01910552, -1.350052, 4.618536, 0, 0.8745098, 1, 1,
0.02416313, -0.1338292, 5.310925, 0, 0.8666667, 1, 1,
0.02471847, 0.8795815, 0.9866888, 0, 0.8627451, 1, 1,
0.02876704, 1.522114, -0.3052009, 0, 0.854902, 1, 1,
0.03432212, -0.288439, 3.768354, 0, 0.8509804, 1, 1,
0.03710152, 0.1818861, -0.01537547, 0, 0.8431373, 1, 1,
0.03827461, 0.2572702, -0.05064309, 0, 0.8392157, 1, 1,
0.04047718, -0.0922064, 2.405856, 0, 0.8313726, 1, 1,
0.04076512, 0.110354, 2.146256, 0, 0.827451, 1, 1,
0.04233938, -2.465093, 4.152079, 0, 0.8196079, 1, 1,
0.04617264, 0.937905, 1.282759, 0, 0.8156863, 1, 1,
0.04910731, -0.4108619, 2.321328, 0, 0.8078431, 1, 1,
0.05042979, 1.691705, 0.6963328, 0, 0.8039216, 1, 1,
0.05557289, 0.2875361, -0.9911104, 0, 0.7960784, 1, 1,
0.05690749, 0.6560899, 0.8681651, 0, 0.7882353, 1, 1,
0.06145654, -0.7986661, 3.024557, 0, 0.7843137, 1, 1,
0.06270605, -0.8451876, 1.847687, 0, 0.7764706, 1, 1,
0.06535581, -1.965538, 4.105302, 0, 0.772549, 1, 1,
0.06984729, -1.458606, 3.079362, 0, 0.7647059, 1, 1,
0.07110532, 1.217837, -0.1768487, 0, 0.7607843, 1, 1,
0.07376508, 0.2478914, 0.2283443, 0, 0.7529412, 1, 1,
0.07513402, 1.465697, -1.234204, 0, 0.7490196, 1, 1,
0.07652775, 0.8877656, 0.8491359, 0, 0.7411765, 1, 1,
0.07859191, 0.582651, 0.9422876, 0, 0.7372549, 1, 1,
0.08131572, 0.1552804, 1.015281, 0, 0.7294118, 1, 1,
0.08590702, -1.515706, 3.365024, 0, 0.7254902, 1, 1,
0.08777412, 0.7383847, -0.7196478, 0, 0.7176471, 1, 1,
0.09233534, 1.777838, 1.115403, 0, 0.7137255, 1, 1,
0.09361711, -0.8958151, 2.158896, 0, 0.7058824, 1, 1,
0.09421976, 1.048402, -0.1260621, 0, 0.6980392, 1, 1,
0.09745039, -0.6652172, 1.696234, 0, 0.6941177, 1, 1,
0.09880225, 0.0150959, 1.131412, 0, 0.6862745, 1, 1,
0.09941091, -0.5190838, 2.447934, 0, 0.682353, 1, 1,
0.09982042, 1.316388, 0.9844525, 0, 0.6745098, 1, 1,
0.1030219, 0.441409, 1.014961, 0, 0.6705883, 1, 1,
0.1038929, -1.418646, 2.967232, 0, 0.6627451, 1, 1,
0.104682, 0.4103803, -0.01525024, 0, 0.6588235, 1, 1,
0.1106916, -0.6999642, 4.224936, 0, 0.6509804, 1, 1,
0.1110892, 0.3577679, 0.4098528, 0, 0.6470588, 1, 1,
0.1124484, 0.398339, 0.426047, 0, 0.6392157, 1, 1,
0.1125446, 0.3211489, 1.941353, 0, 0.6352941, 1, 1,
0.1127793, -0.2299385, 1.796651, 0, 0.627451, 1, 1,
0.1165526, 0.02072913, 1.189888, 0, 0.6235294, 1, 1,
0.1178297, -0.234811, 3.185532, 0, 0.6156863, 1, 1,
0.1204908, 0.3921995, 1.260619, 0, 0.6117647, 1, 1,
0.1204944, -1.784428, 4.288332, 0, 0.6039216, 1, 1,
0.1232154, 1.0886, -1.461415, 0, 0.5960785, 1, 1,
0.1234502, -0.7104532, 3.369486, 0, 0.5921569, 1, 1,
0.1239826, -1.194776, 4.431501, 0, 0.5843138, 1, 1,
0.1243833, 0.3477027, 2.94559, 0, 0.5803922, 1, 1,
0.1322705, 1.416642, 1.218244, 0, 0.572549, 1, 1,
0.1339539, -2.814914, 4.67416, 0, 0.5686275, 1, 1,
0.1344993, 2.0086, -0.5475178, 0, 0.5607843, 1, 1,
0.1347794, 1.134548, 0.3754973, 0, 0.5568628, 1, 1,
0.1353735, -0.4807155, 2.778859, 0, 0.5490196, 1, 1,
0.136395, -1.198457, 3.296336, 0, 0.5450981, 1, 1,
0.1379588, 0.6465124, 1.953398, 0, 0.5372549, 1, 1,
0.1400508, -0.4156741, 3.782125, 0, 0.5333334, 1, 1,
0.1410551, -0.1679201, 1.338658, 0, 0.5254902, 1, 1,
0.1424315, -0.08064664, 3.478631, 0, 0.5215687, 1, 1,
0.1449399, 0.1530833, 1.063885, 0, 0.5137255, 1, 1,
0.1491138, -0.03731399, 2.181031, 0, 0.509804, 1, 1,
0.1502646, -2.397417, 4.457929, 0, 0.5019608, 1, 1,
0.1545442, -1.170109, 5.098444, 0, 0.4941176, 1, 1,
0.1553181, 0.5582001, -0.0897833, 0, 0.4901961, 1, 1,
0.1620111, -1.450918, 2.642246, 0, 0.4823529, 1, 1,
0.1623906, -0.8832492, 1.480454, 0, 0.4784314, 1, 1,
0.1661994, -0.2989075, 1.665178, 0, 0.4705882, 1, 1,
0.1666172, -0.1119847, 1.790992, 0, 0.4666667, 1, 1,
0.1683762, 0.1699267, -1.103502, 0, 0.4588235, 1, 1,
0.180447, 0.2808315, 0.4897454, 0, 0.454902, 1, 1,
0.181445, -0.6390373, 4.344872, 0, 0.4470588, 1, 1,
0.181931, 0.8751315, 0.5043498, 0, 0.4431373, 1, 1,
0.1820011, -0.5852399, 2.807682, 0, 0.4352941, 1, 1,
0.1858507, 0.8274839, 2.376885, 0, 0.4313726, 1, 1,
0.185922, 0.07144929, 1.192732, 0, 0.4235294, 1, 1,
0.1907358, 0.1048264, -1.255895, 0, 0.4196078, 1, 1,
0.1918605, 0.3074286, 1.287983, 0, 0.4117647, 1, 1,
0.1970935, -0.3625936, 3.426189, 0, 0.4078431, 1, 1,
0.2027734, 1.743004, 0.4220791, 0, 0.4, 1, 1,
0.2108427, 1.035576, 1.551664, 0, 0.3921569, 1, 1,
0.2135635, -0.1075849, 0.6579682, 0, 0.3882353, 1, 1,
0.2141326, 1.379343, 0.1816644, 0, 0.3803922, 1, 1,
0.218421, -0.5276247, 2.166929, 0, 0.3764706, 1, 1,
0.2250684, -0.7416564, 5.793182, 0, 0.3686275, 1, 1,
0.2278199, 0.4209978, 0.2369258, 0, 0.3647059, 1, 1,
0.2298427, -1.163981, 0.7696591, 0, 0.3568628, 1, 1,
0.2304166, 1.050989, 1.628473, 0, 0.3529412, 1, 1,
0.2346457, 0.396665, -0.3417315, 0, 0.345098, 1, 1,
0.2347626, 0.7117241, 0.885137, 0, 0.3411765, 1, 1,
0.2369743, -0.1794567, 1.773315, 0, 0.3333333, 1, 1,
0.2374513, -0.2962002, 0.6306026, 0, 0.3294118, 1, 1,
0.241312, 0.9052196, 0.8315898, 0, 0.3215686, 1, 1,
0.2422277, -1.140257, 3.721204, 0, 0.3176471, 1, 1,
0.2453877, 0.2297938, 1.544102, 0, 0.3098039, 1, 1,
0.2458577, 0.5961464, 1.507736, 0, 0.3058824, 1, 1,
0.2476347, 0.8474862, 1.592932, 0, 0.2980392, 1, 1,
0.250334, 0.3460495, 0.04683942, 0, 0.2901961, 1, 1,
0.2554796, 2.222496, -0.3043551, 0, 0.2862745, 1, 1,
0.2563083, 1.882828, 0.5136376, 0, 0.2784314, 1, 1,
0.260067, 1.287596, 1.443922, 0, 0.2745098, 1, 1,
0.2605633, -0.5134525, 1.601901, 0, 0.2666667, 1, 1,
0.2612225, 0.7918823, -1.210318, 0, 0.2627451, 1, 1,
0.2614792, -0.6462178, 1.135846, 0, 0.254902, 1, 1,
0.2618807, -1.493541, 2.151161, 0, 0.2509804, 1, 1,
0.2624646, -0.1539465, 2.695447, 0, 0.2431373, 1, 1,
0.2639151, -0.4520604, 2.017126, 0, 0.2392157, 1, 1,
0.2651016, 0.3015762, 0.06899216, 0, 0.2313726, 1, 1,
0.2671274, -0.4871657, 2.98236, 0, 0.227451, 1, 1,
0.2709531, -0.2252679, 3.721519, 0, 0.2196078, 1, 1,
0.2738989, 1.040474, 0.008345807, 0, 0.2156863, 1, 1,
0.2774315, -0.6139081, 3.408639, 0, 0.2078431, 1, 1,
0.2774839, -0.4074389, 4.126239, 0, 0.2039216, 1, 1,
0.2778306, 0.4090925, 0.4305369, 0, 0.1960784, 1, 1,
0.2790609, 0.2165575, -0.3415508, 0, 0.1882353, 1, 1,
0.2795223, -0.8395508, 2.520225, 0, 0.1843137, 1, 1,
0.2796723, -0.835089, 4.123977, 0, 0.1764706, 1, 1,
0.2806594, 0.3312431, 0.2204757, 0, 0.172549, 1, 1,
0.2861995, 2.367759, -0.367331, 0, 0.1647059, 1, 1,
0.2888564, -0.8452255, 1.622666, 0, 0.1607843, 1, 1,
0.2902816, 0.3639091, 0.2058153, 0, 0.1529412, 1, 1,
0.290868, -0.4458954, 4.106744, 0, 0.1490196, 1, 1,
0.2917438, -0.762389, 1.150958, 0, 0.1411765, 1, 1,
0.2922248, -0.9689937, 2.36341, 0, 0.1372549, 1, 1,
0.2973633, 1.331805, 0.1815233, 0, 0.1294118, 1, 1,
0.2992438, -0.8232405, 2.668184, 0, 0.1254902, 1, 1,
0.2996374, -0.727812, 2.259722, 0, 0.1176471, 1, 1,
0.3004974, -0.1601697, 0.4429435, 0, 0.1137255, 1, 1,
0.3010558, 0.07057627, 1.70707, 0, 0.1058824, 1, 1,
0.3020533, -0.2314918, 2.904773, 0, 0.09803922, 1, 1,
0.3033539, -0.487011, 0.5824774, 0, 0.09411765, 1, 1,
0.3034877, 1.023263, 1.148169, 0, 0.08627451, 1, 1,
0.3059552, 0.1016349, 0.6821553, 0, 0.08235294, 1, 1,
0.3071574, 0.7878748, -0.3564244, 0, 0.07450981, 1, 1,
0.3110659, 2.001765, 0.7015187, 0, 0.07058824, 1, 1,
0.3152224, -1.209494, 3.017209, 0, 0.0627451, 1, 1,
0.3255017, -1.044614, 3.692876, 0, 0.05882353, 1, 1,
0.3284251, -0.09662881, 2.098567, 0, 0.05098039, 1, 1,
0.3329015, 0.6319314, 0.8424137, 0, 0.04705882, 1, 1,
0.3414659, 0.7271175, 0.892788, 0, 0.03921569, 1, 1,
0.3440293, -1.791781, 3.490088, 0, 0.03529412, 1, 1,
0.3458512, -1.030716, 1.771634, 0, 0.02745098, 1, 1,
0.3479562, 0.7858142, 0.008003701, 0, 0.02352941, 1, 1,
0.3524788, 0.1916967, -0.5807937, 0, 0.01568628, 1, 1,
0.3652337, 0.3146813, 0.7098528, 0, 0.01176471, 1, 1,
0.3677081, 1.437003, 0.0541317, 0, 0.003921569, 1, 1,
0.377378, 1.074964, 1.869966, 0.003921569, 0, 1, 1,
0.3808094, 2.424574, 0.5016329, 0.007843138, 0, 1, 1,
0.3810824, 1.112151, -1.331693, 0.01568628, 0, 1, 1,
0.381277, -0.516488, 3.627137, 0.01960784, 0, 1, 1,
0.3877283, -0.2698679, 2.142444, 0.02745098, 0, 1, 1,
0.3939812, -0.8034592, 2.195256, 0.03137255, 0, 1, 1,
0.3951043, -1.438687, 2.034268, 0.03921569, 0, 1, 1,
0.3967114, -2.268568, 3.83933, 0.04313726, 0, 1, 1,
0.4001218, 0.3749112, 0.147797, 0.05098039, 0, 1, 1,
0.4047494, -0.1357282, 1.361207, 0.05490196, 0, 1, 1,
0.4054278, 0.06218204, -0.1391328, 0.0627451, 0, 1, 1,
0.4058552, 0.6870131, 1.526196, 0.06666667, 0, 1, 1,
0.4131442, -0.5482149, 3.606883, 0.07450981, 0, 1, 1,
0.4154743, 1.022527, 0.857447, 0.07843138, 0, 1, 1,
0.4169151, 0.1965779, 1.740008, 0.08627451, 0, 1, 1,
0.4199722, -0.6295195, 3.095483, 0.09019608, 0, 1, 1,
0.4240004, 0.1062612, 1.968876, 0.09803922, 0, 1, 1,
0.438241, -0.2404355, 3.621734, 0.1058824, 0, 1, 1,
0.4405923, 0.2175153, 2.291623, 0.1098039, 0, 1, 1,
0.4416027, -1.151194, 2.070965, 0.1176471, 0, 1, 1,
0.4421226, -1.653884, 3.752257, 0.1215686, 0, 1, 1,
0.4452053, 2.230478, 1.057469, 0.1294118, 0, 1, 1,
0.4498102, 0.7101749, 0.6785802, 0.1333333, 0, 1, 1,
0.4527767, -0.5063362, 2.212703, 0.1411765, 0, 1, 1,
0.4566402, 0.7084357, -0.8869177, 0.145098, 0, 1, 1,
0.4581468, -0.5893208, -0.07892597, 0.1529412, 0, 1, 1,
0.4591059, 1.694511, -0.6468632, 0.1568628, 0, 1, 1,
0.4631549, 1.05393, 0.6768948, 0.1647059, 0, 1, 1,
0.4648536, -1.123979, 4.227687, 0.1686275, 0, 1, 1,
0.4731638, -0.4925246, 4.100159, 0.1764706, 0, 1, 1,
0.4863071, -1.496316, 3.809018, 0.1803922, 0, 1, 1,
0.4934718, 0.3977106, -0.7010814, 0.1882353, 0, 1, 1,
0.4939471, 0.1897276, 0.7873939, 0.1921569, 0, 1, 1,
0.4957283, 0.3648959, 1.505532, 0.2, 0, 1, 1,
0.495753, 0.4736129, -0.7479351, 0.2078431, 0, 1, 1,
0.496363, -0.214584, 2.30125, 0.2117647, 0, 1, 1,
0.4984642, -0.420063, 3.623872, 0.2196078, 0, 1, 1,
0.5048057, 0.3253165, 0.8191, 0.2235294, 0, 1, 1,
0.5093808, -0.355453, 0.1089496, 0.2313726, 0, 1, 1,
0.5098208, -0.7542876, 2.247156, 0.2352941, 0, 1, 1,
0.51188, 1.859938, 0.5024723, 0.2431373, 0, 1, 1,
0.5128584, 1.550645, -0.2812473, 0.2470588, 0, 1, 1,
0.5149789, 0.6511199, -1.449403, 0.254902, 0, 1, 1,
0.5192655, -0.7552226, 1.058966, 0.2588235, 0, 1, 1,
0.521349, -0.06957856, 2.796572, 0.2666667, 0, 1, 1,
0.5236133, 1.540978, 0.2049233, 0.2705882, 0, 1, 1,
0.5245348, 1.32161, -0.4213471, 0.2784314, 0, 1, 1,
0.524993, -1.289403, 3.414442, 0.282353, 0, 1, 1,
0.5255743, 0.7724835, 2.056493, 0.2901961, 0, 1, 1,
0.526567, 0.2408622, 1.177241, 0.2941177, 0, 1, 1,
0.5285751, -0.2266717, 2.871405, 0.3019608, 0, 1, 1,
0.5285897, 0.9205253, -1.822287, 0.3098039, 0, 1, 1,
0.5373991, -0.8771615, 2.797288, 0.3137255, 0, 1, 1,
0.5374936, 1.940693, 0.5056902, 0.3215686, 0, 1, 1,
0.537774, -0.2263272, 1.631528, 0.3254902, 0, 1, 1,
0.5478923, -1.148577, 1.540722, 0.3333333, 0, 1, 1,
0.5521178, -1.691946, 1.491568, 0.3372549, 0, 1, 1,
0.5554378, -1.378208, 2.819176, 0.345098, 0, 1, 1,
0.5576294, -0.4152554, 0.002423708, 0.3490196, 0, 1, 1,
0.5599545, -0.8947172, 2.153617, 0.3568628, 0, 1, 1,
0.5617469, -0.6078573, 2.788267, 0.3607843, 0, 1, 1,
0.5659862, -0.1322359, 2.118875, 0.3686275, 0, 1, 1,
0.5663005, 0.8188772, 0.7625123, 0.372549, 0, 1, 1,
0.5674061, -2.060939, 5.001502, 0.3803922, 0, 1, 1,
0.5750533, 0.5633014, -0.2327329, 0.3843137, 0, 1, 1,
0.5781224, 0.5923299, 0.2100014, 0.3921569, 0, 1, 1,
0.5841798, -0.004677527, 1.865906, 0.3960784, 0, 1, 1,
0.5856473, -0.8200132, 2.873733, 0.4039216, 0, 1, 1,
0.5889179, 0.3329015, -0.3348907, 0.4117647, 0, 1, 1,
0.5896282, -1.152045, 3.499225, 0.4156863, 0, 1, 1,
0.5950803, -0.06332751, 0.7843282, 0.4235294, 0, 1, 1,
0.5953317, 0.7058001, 0.8805358, 0.427451, 0, 1, 1,
0.6015412, 1.501874, -1.144326, 0.4352941, 0, 1, 1,
0.6072056, 0.7170671, 1.609794, 0.4392157, 0, 1, 1,
0.6087738, 0.1606273, 1.030314, 0.4470588, 0, 1, 1,
0.6169591, 0.9436431, -0.517635, 0.4509804, 0, 1, 1,
0.6171597, 0.1637592, 3.229167, 0.4588235, 0, 1, 1,
0.6172968, -0.9887085, 3.966397, 0.4627451, 0, 1, 1,
0.6186887, 0.5429571, 1.720283, 0.4705882, 0, 1, 1,
0.6220219, -0.6413457, 2.49999, 0.4745098, 0, 1, 1,
0.6417264, 0.6713163, 0.5914806, 0.4823529, 0, 1, 1,
0.6534882, 0.3879983, 1.955869, 0.4862745, 0, 1, 1,
0.6547542, -1.902811, 3.328765, 0.4941176, 0, 1, 1,
0.6606882, 0.2347817, 2.943236, 0.5019608, 0, 1, 1,
0.6628336, -0.346729, 3.391499, 0.5058824, 0, 1, 1,
0.6683906, 1.008528, 0.05272315, 0.5137255, 0, 1, 1,
0.6728207, 0.6432632, -0.3687567, 0.5176471, 0, 1, 1,
0.6735582, 1.287948, 1.299525, 0.5254902, 0, 1, 1,
0.6736106, -1.486597, 3.035347, 0.5294118, 0, 1, 1,
0.6762725, -2.924645, 4.577542, 0.5372549, 0, 1, 1,
0.677063, 1.026533, 0.6066684, 0.5411765, 0, 1, 1,
0.6786895, 0.2641511, 1.272642, 0.5490196, 0, 1, 1,
0.6794282, 0.8341113, 1.431401, 0.5529412, 0, 1, 1,
0.6795701, -0.2276823, 1.697452, 0.5607843, 0, 1, 1,
0.6860319, 2.00122, -0.02679476, 0.5647059, 0, 1, 1,
0.6881249, 0.07192586, 1.524753, 0.572549, 0, 1, 1,
0.6885087, -0.9719725, 2.454086, 0.5764706, 0, 1, 1,
0.6933801, 2.177588, 1.362202, 0.5843138, 0, 1, 1,
0.6943819, 0.7530081, 1.102426, 0.5882353, 0, 1, 1,
0.6979114, -1.478605, 3.0679, 0.5960785, 0, 1, 1,
0.702716, 1.285675, 1.861991, 0.6039216, 0, 1, 1,
0.7029678, 0.7292786, 0.8531963, 0.6078432, 0, 1, 1,
0.7076688, 0.5192357, 1.782492, 0.6156863, 0, 1, 1,
0.7154953, 0.9468626, 2.294811, 0.6196079, 0, 1, 1,
0.7175741, -0.4300414, 2.626264, 0.627451, 0, 1, 1,
0.7200969, 0.9280783, 0.3811385, 0.6313726, 0, 1, 1,
0.724744, 0.1717583, 3.330235, 0.6392157, 0, 1, 1,
0.7313898, 0.8152979, -0.1923761, 0.6431373, 0, 1, 1,
0.7316659, 1.176232, 0.3669507, 0.6509804, 0, 1, 1,
0.7359322, -0.02064178, 1.168698, 0.654902, 0, 1, 1,
0.7413018, -0.9186337, 2.267552, 0.6627451, 0, 1, 1,
0.7430329, -2.281389, 0.9835451, 0.6666667, 0, 1, 1,
0.7462336, -1.092262, 2.418543, 0.6745098, 0, 1, 1,
0.7471289, -1.072025, 2.413621, 0.6784314, 0, 1, 1,
0.7494491, -1.778032, 1.193637, 0.6862745, 0, 1, 1,
0.7526535, 0.7810872, 1.666531, 0.6901961, 0, 1, 1,
0.7574583, 1.812767, 0.8230732, 0.6980392, 0, 1, 1,
0.7578488, -0.03493395, 2.22993, 0.7058824, 0, 1, 1,
0.7617673, -1.078951, 2.214466, 0.7098039, 0, 1, 1,
0.7630015, 0.5014653, -1.151204, 0.7176471, 0, 1, 1,
0.7632166, 0.1619709, 1.836795, 0.7215686, 0, 1, 1,
0.7664129, 0.3464543, 1.1953, 0.7294118, 0, 1, 1,
0.7705908, 1.186084, 0.9848775, 0.7333333, 0, 1, 1,
0.7719918, 0.8514247, -0.605378, 0.7411765, 0, 1, 1,
0.7801188, -0.01100144, 2.64166, 0.7450981, 0, 1, 1,
0.8004422, 0.06738333, 1.294396, 0.7529412, 0, 1, 1,
0.8055668, -0.01769761, 0.3216318, 0.7568628, 0, 1, 1,
0.8070854, -0.6782183, 2.04598, 0.7647059, 0, 1, 1,
0.808638, 0.2286689, 1.527225, 0.7686275, 0, 1, 1,
0.8139803, 1.363894, -1.541577, 0.7764706, 0, 1, 1,
0.8141494, 0.3967164, 1.750396, 0.7803922, 0, 1, 1,
0.8168221, 0.04746982, 2.527807, 0.7882353, 0, 1, 1,
0.8182278, -0.275562, 2.756692, 0.7921569, 0, 1, 1,
0.8183365, -0.9653284, 1.779213, 0.8, 0, 1, 1,
0.8256376, 0.1574924, 0.1875823, 0.8078431, 0, 1, 1,
0.8288477, 0.8268747, 0.3475933, 0.8117647, 0, 1, 1,
0.8329896, 0.33108, 0.8318832, 0.8196079, 0, 1, 1,
0.8373575, -1.112212, 2.423155, 0.8235294, 0, 1, 1,
0.8631396, 1.037388, 0.6062953, 0.8313726, 0, 1, 1,
0.8643278, -0.8460745, 1.645296, 0.8352941, 0, 1, 1,
0.8651211, 0.4049097, 0.5115517, 0.8431373, 0, 1, 1,
0.865476, -0.7669796, 1.44118, 0.8470588, 0, 1, 1,
0.8674792, 1.498408, -0.1266484, 0.854902, 0, 1, 1,
0.8704936, 1.73337, -0.5787518, 0.8588235, 0, 1, 1,
0.8707681, 0.3004101, 1.361493, 0.8666667, 0, 1, 1,
0.877652, 0.1863927, 1.35775, 0.8705882, 0, 1, 1,
0.8798692, -1.233749, 3.183141, 0.8784314, 0, 1, 1,
0.8813933, 1.345255, 0.4418474, 0.8823529, 0, 1, 1,
0.8830974, 0.5891373, 1.799471, 0.8901961, 0, 1, 1,
0.883809, 0.3271057, 2.229679, 0.8941177, 0, 1, 1,
0.8992355, -1.04138, 0.05592919, 0.9019608, 0, 1, 1,
0.8996675, 0.1294352, 2.287072, 0.9098039, 0, 1, 1,
0.899694, -1.39511, 2.652042, 0.9137255, 0, 1, 1,
0.9020064, -0.1040464, 2.443294, 0.9215686, 0, 1, 1,
0.905241, 0.2722127, 0.9832283, 0.9254902, 0, 1, 1,
0.9074324, -0.5008667, 4.089978, 0.9333333, 0, 1, 1,
0.9199753, -1.899925, 3.167318, 0.9372549, 0, 1, 1,
0.9212241, -0.2808516, 1.483479, 0.945098, 0, 1, 1,
0.9255884, 0.4821856, 1.440353, 0.9490196, 0, 1, 1,
0.9287342, 0.05972084, 0.6625168, 0.9568627, 0, 1, 1,
0.934013, 1.756606, 1.959885, 0.9607843, 0, 1, 1,
0.9366887, 1.226186, 0.8774711, 0.9686275, 0, 1, 1,
0.9375089, -2.212506, 2.234087, 0.972549, 0, 1, 1,
0.9383868, 0.1682453, 1.139647, 0.9803922, 0, 1, 1,
0.9399168, -1.093421, 1.378442, 0.9843137, 0, 1, 1,
0.9406404, -0.7241601, 0.7591552, 0.9921569, 0, 1, 1,
0.9455391, 0.5210761, 2.051923, 0.9960784, 0, 1, 1,
0.9460689, 1.578074, 0.9699542, 1, 0, 0.9960784, 1,
0.9485162, -0.9914694, 2.633911, 1, 0, 0.9882353, 1,
0.9540329, 0.02833016, 1.881082, 1, 0, 0.9843137, 1,
0.9569954, -0.3254838, 3.319111, 1, 0, 0.9764706, 1,
0.9598871, -0.1095574, 0.4401798, 1, 0, 0.972549, 1,
0.9619362, -0.7872336, 3.384745, 1, 0, 0.9647059, 1,
0.9722361, 0.3388014, 2.07008, 1, 0, 0.9607843, 1,
0.9739093, -0.7103491, 0.8750104, 1, 0, 0.9529412, 1,
0.9771865, 0.3323613, 1.577983, 1, 0, 0.9490196, 1,
0.9820109, -1.596447, 1.635367, 1, 0, 0.9411765, 1,
0.985505, -0.9297879, 1.823914, 1, 0, 0.9372549, 1,
0.9866921, 1.556275, 1.755535, 1, 0, 0.9294118, 1,
1.001479, -0.3053596, 1.389101, 1, 0, 0.9254902, 1,
1.010577, 3.262356, -0.02394947, 1, 0, 0.9176471, 1,
1.014406, 0.3340527, 1.884562, 1, 0, 0.9137255, 1,
1.022776, 0.2089306, 1.96301, 1, 0, 0.9058824, 1,
1.041914, -0.5842625, 0.7509215, 1, 0, 0.9019608, 1,
1.042415, 0.9709018, 0.5631601, 1, 0, 0.8941177, 1,
1.042665, -1.018712, 0.1635764, 1, 0, 0.8862745, 1,
1.045063, 0.4445803, 0.6881751, 1, 0, 0.8823529, 1,
1.052718, 0.9459774, 0.5186571, 1, 0, 0.8745098, 1,
1.058448, 0.2151725, 1.043236, 1, 0, 0.8705882, 1,
1.058953, -0.04713753, 1.58024, 1, 0, 0.8627451, 1,
1.06065, -0.5304508, 0.6407026, 1, 0, 0.8588235, 1,
1.065058, -0.7379792, 2.096147, 1, 0, 0.8509804, 1,
1.071238, -0.7032387, 1.791598, 1, 0, 0.8470588, 1,
1.072116, -0.6492785, 1.193677, 1, 0, 0.8392157, 1,
1.073022, 0.7500046, 3.791437, 1, 0, 0.8352941, 1,
1.092082, 1.09619, 0.09779788, 1, 0, 0.827451, 1,
1.101072, -1.450969, 2.847631, 1, 0, 0.8235294, 1,
1.10143, 0.7858498, 1.55961, 1, 0, 0.8156863, 1,
1.102481, 0.8073013, 0.8903726, 1, 0, 0.8117647, 1,
1.106924, -0.7381139, 4.332362, 1, 0, 0.8039216, 1,
1.107483, 0.3917052, 0.6300434, 1, 0, 0.7960784, 1,
1.110031, -0.2545153, 1.724206, 1, 0, 0.7921569, 1,
1.111837, -0.04421926, -0.6013345, 1, 0, 0.7843137, 1,
1.129522, 0.6081161, 1.751623, 1, 0, 0.7803922, 1,
1.136802, -0.4263828, 3.404226, 1, 0, 0.772549, 1,
1.140672, 0.3708957, 1.645226, 1, 0, 0.7686275, 1,
1.149052, 0.9143429, 0.490512, 1, 0, 0.7607843, 1,
1.154143, 0.1340846, 1.524157, 1, 0, 0.7568628, 1,
1.166868, 1.083888, -0.7400587, 1, 0, 0.7490196, 1,
1.16831, 1.026073, 0.6712597, 1, 0, 0.7450981, 1,
1.168382, 0.7193527, 0.2068438, 1, 0, 0.7372549, 1,
1.169448, -0.03224888, 0.08994377, 1, 0, 0.7333333, 1,
1.169614, 1.726686, 0.2837061, 1, 0, 0.7254902, 1,
1.171808, 1.919742, 0.7717395, 1, 0, 0.7215686, 1,
1.174633, 1.056169, 0.1380699, 1, 0, 0.7137255, 1,
1.176869, -0.8119588, 2.620769, 1, 0, 0.7098039, 1,
1.18137, 0.3407845, 2.995446, 1, 0, 0.7019608, 1,
1.18229, 0.5192417, 2.267104, 1, 0, 0.6941177, 1,
1.18407, 0.3489792, 2.162324, 1, 0, 0.6901961, 1,
1.187396, 0.7335729, 0.6693184, 1, 0, 0.682353, 1,
1.18785, -0.2778221, 1.562724, 1, 0, 0.6784314, 1,
1.188875, -0.1555219, 3.432261, 1, 0, 0.6705883, 1,
1.189808, 1.504895, 1.257411, 1, 0, 0.6666667, 1,
1.215682, -0.7831048, 1.459715, 1, 0, 0.6588235, 1,
1.215835, -1.994419, 2.225504, 1, 0, 0.654902, 1,
1.228977, -0.08144631, 2.211022, 1, 0, 0.6470588, 1,
1.22992, 0.5037422, 2.133224, 1, 0, 0.6431373, 1,
1.230628, -2.394424, 3.028469, 1, 0, 0.6352941, 1,
1.238551, -0.5269988, 1.736314, 1, 0, 0.6313726, 1,
1.241484, -0.07870662, 2.125782, 1, 0, 0.6235294, 1,
1.246523, -0.5463406, 2.744643, 1, 0, 0.6196079, 1,
1.250288, -0.8086681, 2.818628, 1, 0, 0.6117647, 1,
1.265302, -0.01138709, 0.4572945, 1, 0, 0.6078432, 1,
1.267919, 2.247347, 1.768847, 1, 0, 0.6, 1,
1.268732, 0.5870418, 1.183478, 1, 0, 0.5921569, 1,
1.26936, 1.368923, 0.7291006, 1, 0, 0.5882353, 1,
1.271453, 0.2944518, 0.8958939, 1, 0, 0.5803922, 1,
1.273086, 0.03503441, 2.859915, 1, 0, 0.5764706, 1,
1.282575, -0.4685147, 0.01255154, 1, 0, 0.5686275, 1,
1.284972, 0.9430202, 0.3149609, 1, 0, 0.5647059, 1,
1.299009, -1.551378, 4.629089, 1, 0, 0.5568628, 1,
1.301549, -0.0145647, 0.6830354, 1, 0, 0.5529412, 1,
1.302313, -0.9563845, 1.207317, 1, 0, 0.5450981, 1,
1.306535, -0.4509402, 1.698392, 1, 0, 0.5411765, 1,
1.31532, -1.239792, 1.786334, 1, 0, 0.5333334, 1,
1.317466, -1.22001, 2.76473, 1, 0, 0.5294118, 1,
1.317486, 1.289392, 0.3578487, 1, 0, 0.5215687, 1,
1.318487, 1.157935, 0.7074713, 1, 0, 0.5176471, 1,
1.321049, 0.816749, 0.8611426, 1, 0, 0.509804, 1,
1.322499, 0.20191, 2.639578, 1, 0, 0.5058824, 1,
1.322962, 2.257892, 2.001173, 1, 0, 0.4980392, 1,
1.339129, -0.2076377, 1.05891, 1, 0, 0.4901961, 1,
1.33978, -0.9102781, 0.05182755, 1, 0, 0.4862745, 1,
1.340384, 0.747448, 2.20743, 1, 0, 0.4784314, 1,
1.347003, 0.917614, 0.6080959, 1, 0, 0.4745098, 1,
1.360216, 0.3377557, 0.9294676, 1, 0, 0.4666667, 1,
1.362441, -0.01286433, 1.61014, 1, 0, 0.4627451, 1,
1.371349, -1.333121, 1.431189, 1, 0, 0.454902, 1,
1.372319, -0.2012362, 1.43488, 1, 0, 0.4509804, 1,
1.379794, 0.3327419, 1.604682, 1, 0, 0.4431373, 1,
1.384671, 0.3545643, 1.333441, 1, 0, 0.4392157, 1,
1.401305, -2.013794, 0.5683637, 1, 0, 0.4313726, 1,
1.406714, 0.6518238, 2.035208, 1, 0, 0.427451, 1,
1.418428, 2.160957, 1.04486, 1, 0, 0.4196078, 1,
1.436988, -0.0797445, 2.565174, 1, 0, 0.4156863, 1,
1.453702, 0.5434986, 0.9530863, 1, 0, 0.4078431, 1,
1.472379, 0.1069295, 2.568552, 1, 0, 0.4039216, 1,
1.494122, -0.356172, 1.51999, 1, 0, 0.3960784, 1,
1.502648, -0.3589976, -0.5169277, 1, 0, 0.3882353, 1,
1.51071, -2.125533, 3.06748, 1, 0, 0.3843137, 1,
1.523309, 1.147125, 2.101623, 1, 0, 0.3764706, 1,
1.535469, -0.5790374, 1.487742, 1, 0, 0.372549, 1,
1.538268, -1.489912, 3.306192, 1, 0, 0.3647059, 1,
1.540324, 0.1305295, 1.166144, 1, 0, 0.3607843, 1,
1.543932, 0.03819099, 1.242373, 1, 0, 0.3529412, 1,
1.556984, -0.08813462, 1.989174, 1, 0, 0.3490196, 1,
1.565332, 1.859707, 0.6822572, 1, 0, 0.3411765, 1,
1.577813, -0.258175, 1.163011, 1, 0, 0.3372549, 1,
1.579014, 1.409315, 1.069113, 1, 0, 0.3294118, 1,
1.593485, 0.09634779, 1.423452, 1, 0, 0.3254902, 1,
1.598857, -1.280456, 2.779963, 1, 0, 0.3176471, 1,
1.602568, 0.4517706, 1.47085, 1, 0, 0.3137255, 1,
1.606836, 0.8869581, 2.47715, 1, 0, 0.3058824, 1,
1.621446, 1.953939, -1.24498, 1, 0, 0.2980392, 1,
1.622697, 1.032275, 0.8779918, 1, 0, 0.2941177, 1,
1.622811, 0.8993711, 0.4973344, 1, 0, 0.2862745, 1,
1.623711, 0.6567609, 2.705327, 1, 0, 0.282353, 1,
1.638481, 0.4780553, 0.481648, 1, 0, 0.2745098, 1,
1.644919, 0.137086, 2.16429, 1, 0, 0.2705882, 1,
1.647974, -1.721614, 1.357651, 1, 0, 0.2627451, 1,
1.651206, -0.1560326, 2.267146, 1, 0, 0.2588235, 1,
1.666631, 0.02706918, 1.623073, 1, 0, 0.2509804, 1,
1.677417, 0.1082626, 1.298008, 1, 0, 0.2470588, 1,
1.687185, 1.464582, 0.6830546, 1, 0, 0.2392157, 1,
1.703528, 1.514236, 1.291957, 1, 0, 0.2352941, 1,
1.71635, 0.4785753, 1.603792, 1, 0, 0.227451, 1,
1.761537, 0.7079294, 0.8540671, 1, 0, 0.2235294, 1,
1.775555, -0.7998708, 3.272467, 1, 0, 0.2156863, 1,
1.782592, -1.039379, 1.07385, 1, 0, 0.2117647, 1,
1.794438, 0.8816565, 0.8534247, 1, 0, 0.2039216, 1,
1.804095, -0.2802542, 3.146487, 1, 0, 0.1960784, 1,
1.817543, 0.5543641, 1.550951, 1, 0, 0.1921569, 1,
1.819147, -1.752082, 2.720824, 1, 0, 0.1843137, 1,
1.820636, -0.402422, 0.7769966, 1, 0, 0.1803922, 1,
1.821298, 0.7511632, 2.438837, 1, 0, 0.172549, 1,
1.868847, -0.3882041, 0.7526079, 1, 0, 0.1686275, 1,
1.885262, 0.6527714, 1.824623, 1, 0, 0.1607843, 1,
1.891697, -0.6398112, 1.580005, 1, 0, 0.1568628, 1,
1.896219, 0.7233694, 0.8053354, 1, 0, 0.1490196, 1,
1.927162, -0.795369, 2.000608, 1, 0, 0.145098, 1,
1.927951, 1.097282, 1.287017, 1, 0, 0.1372549, 1,
1.956461, -0.5257963, 1.535884, 1, 0, 0.1333333, 1,
1.959398, 0.4609843, 3.618142, 1, 0, 0.1254902, 1,
1.995586, -0.2398489, 1.559347, 1, 0, 0.1215686, 1,
2.057567, -0.9460754, 2.208929, 1, 0, 0.1137255, 1,
2.069183, -0.4413491, 2.138562, 1, 0, 0.1098039, 1,
2.075109, -1.026899, -0.2137783, 1, 0, 0.1019608, 1,
2.089844, -0.06045604, -0.1251429, 1, 0, 0.09411765, 1,
2.111309, 0.8234826, 1.832464, 1, 0, 0.09019608, 1,
2.113552, 0.7834587, 1.522894, 1, 0, 0.08235294, 1,
2.253416, 1.389808, 0.04527731, 1, 0, 0.07843138, 1,
2.255041, -2.19868, 2.482344, 1, 0, 0.07058824, 1,
2.25544, 0.5408736, 0.4109464, 1, 0, 0.06666667, 1,
2.295968, -0.5105793, 1.506064, 1, 0, 0.05882353, 1,
2.309318, 0.4437329, -0.5337584, 1, 0, 0.05490196, 1,
2.344383, -1.448167, 1.089906, 1, 0, 0.04705882, 1,
2.411739, 1.196699, 1.264837, 1, 0, 0.04313726, 1,
2.415053, 0.504687, 2.392035, 1, 0, 0.03529412, 1,
2.523976, -0.310606, 3.130321, 1, 0, 0.03137255, 1,
2.742613, 1.129201, 0.106319, 1, 0, 0.02352941, 1,
2.789476, -0.5232974, 0.5771691, 1, 0, 0.01960784, 1,
3.024832, 1.483873, 1.547883, 1, 0, 0.01176471, 1,
3.155443, -1.570025, 3.344029, 1, 0, 0.007843138, 1
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
0.04489732, -3.979794, -7.310995, 0, -0.5, 0.5, 0.5,
0.04489732, -3.979794, -7.310995, 1, -0.5, 0.5, 0.5,
0.04489732, -3.979794, -7.310995, 1, 1.5, 0.5, 0.5,
0.04489732, -3.979794, -7.310995, 0, 1.5, 0.5, 0.5
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
-4.120123, 0.1878886, -7.310995, 0, -0.5, 0.5, 0.5,
-4.120123, 0.1878886, -7.310995, 1, -0.5, 0.5, 0.5,
-4.120123, 0.1878886, -7.310995, 1, 1.5, 0.5, 0.5,
-4.120123, 0.1878886, -7.310995, 0, 1.5, 0.5, 0.5
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
-4.120123, -3.979794, 0.190712, 0, -0.5, 0.5, 0.5,
-4.120123, -3.979794, 0.190712, 1, -0.5, 0.5, 0.5,
-4.120123, -3.979794, 0.190712, 1, 1.5, 0.5, 0.5,
-4.120123, -3.979794, 0.190712, 0, 1.5, 0.5, 0.5
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
-3, -3.018021, -5.579832,
3, -3.018021, -5.579832,
-3, -3.018021, -5.579832,
-3, -3.178317, -5.868359,
-2, -3.018021, -5.579832,
-2, -3.178317, -5.868359,
-1, -3.018021, -5.579832,
-1, -3.178317, -5.868359,
0, -3.018021, -5.579832,
0, -3.178317, -5.868359,
1, -3.018021, -5.579832,
1, -3.178317, -5.868359,
2, -3.018021, -5.579832,
2, -3.178317, -5.868359,
3, -3.018021, -5.579832,
3, -3.178317, -5.868359
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
-3, -3.498908, -6.445414, 0, -0.5, 0.5, 0.5,
-3, -3.498908, -6.445414, 1, -0.5, 0.5, 0.5,
-3, -3.498908, -6.445414, 1, 1.5, 0.5, 0.5,
-3, -3.498908, -6.445414, 0, 1.5, 0.5, 0.5,
-2, -3.498908, -6.445414, 0, -0.5, 0.5, 0.5,
-2, -3.498908, -6.445414, 1, -0.5, 0.5, 0.5,
-2, -3.498908, -6.445414, 1, 1.5, 0.5, 0.5,
-2, -3.498908, -6.445414, 0, 1.5, 0.5, 0.5,
-1, -3.498908, -6.445414, 0, -0.5, 0.5, 0.5,
-1, -3.498908, -6.445414, 1, -0.5, 0.5, 0.5,
-1, -3.498908, -6.445414, 1, 1.5, 0.5, 0.5,
-1, -3.498908, -6.445414, 0, 1.5, 0.5, 0.5,
0, -3.498908, -6.445414, 0, -0.5, 0.5, 0.5,
0, -3.498908, -6.445414, 1, -0.5, 0.5, 0.5,
0, -3.498908, -6.445414, 1, 1.5, 0.5, 0.5,
0, -3.498908, -6.445414, 0, 1.5, 0.5, 0.5,
1, -3.498908, -6.445414, 0, -0.5, 0.5, 0.5,
1, -3.498908, -6.445414, 1, -0.5, 0.5, 0.5,
1, -3.498908, -6.445414, 1, 1.5, 0.5, 0.5,
1, -3.498908, -6.445414, 0, 1.5, 0.5, 0.5,
2, -3.498908, -6.445414, 0, -0.5, 0.5, 0.5,
2, -3.498908, -6.445414, 1, -0.5, 0.5, 0.5,
2, -3.498908, -6.445414, 1, 1.5, 0.5, 0.5,
2, -3.498908, -6.445414, 0, 1.5, 0.5, 0.5,
3, -3.498908, -6.445414, 0, -0.5, 0.5, 0.5,
3, -3.498908, -6.445414, 1, -0.5, 0.5, 0.5,
3, -3.498908, -6.445414, 1, 1.5, 0.5, 0.5,
3, -3.498908, -6.445414, 0, 1.5, 0.5, 0.5
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
-3.158964, -2, -5.579832,
-3.158964, 3, -5.579832,
-3.158964, -2, -5.579832,
-3.319158, -2, -5.868359,
-3.158964, -1, -5.579832,
-3.319158, -1, -5.868359,
-3.158964, 0, -5.579832,
-3.319158, 0, -5.868359,
-3.158964, 1, -5.579832,
-3.319158, 1, -5.868359,
-3.158964, 2, -5.579832,
-3.319158, 2, -5.868359,
-3.158964, 3, -5.579832,
-3.319158, 3, -5.868359
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
-3.639544, -2, -6.445414, 0, -0.5, 0.5, 0.5,
-3.639544, -2, -6.445414, 1, -0.5, 0.5, 0.5,
-3.639544, -2, -6.445414, 1, 1.5, 0.5, 0.5,
-3.639544, -2, -6.445414, 0, 1.5, 0.5, 0.5,
-3.639544, -1, -6.445414, 0, -0.5, 0.5, 0.5,
-3.639544, -1, -6.445414, 1, -0.5, 0.5, 0.5,
-3.639544, -1, -6.445414, 1, 1.5, 0.5, 0.5,
-3.639544, -1, -6.445414, 0, 1.5, 0.5, 0.5,
-3.639544, 0, -6.445414, 0, -0.5, 0.5, 0.5,
-3.639544, 0, -6.445414, 1, -0.5, 0.5, 0.5,
-3.639544, 0, -6.445414, 1, 1.5, 0.5, 0.5,
-3.639544, 0, -6.445414, 0, 1.5, 0.5, 0.5,
-3.639544, 1, -6.445414, 0, -0.5, 0.5, 0.5,
-3.639544, 1, -6.445414, 1, -0.5, 0.5, 0.5,
-3.639544, 1, -6.445414, 1, 1.5, 0.5, 0.5,
-3.639544, 1, -6.445414, 0, 1.5, 0.5, 0.5,
-3.639544, 2, -6.445414, 0, -0.5, 0.5, 0.5,
-3.639544, 2, -6.445414, 1, -0.5, 0.5, 0.5,
-3.639544, 2, -6.445414, 1, 1.5, 0.5, 0.5,
-3.639544, 2, -6.445414, 0, 1.5, 0.5, 0.5,
-3.639544, 3, -6.445414, 0, -0.5, 0.5, 0.5,
-3.639544, 3, -6.445414, 1, -0.5, 0.5, 0.5,
-3.639544, 3, -6.445414, 1, 1.5, 0.5, 0.5,
-3.639544, 3, -6.445414, 0, 1.5, 0.5, 0.5
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
-3.158964, -3.018021, -4,
-3.158964, -3.018021, 4,
-3.158964, -3.018021, -4,
-3.319158, -3.178317, -4,
-3.158964, -3.018021, -2,
-3.319158, -3.178317, -2,
-3.158964, -3.018021, 0,
-3.319158, -3.178317, 0,
-3.158964, -3.018021, 2,
-3.319158, -3.178317, 2,
-3.158964, -3.018021, 4,
-3.319158, -3.178317, 4
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
-3.639544, -3.498908, -4, 0, -0.5, 0.5, 0.5,
-3.639544, -3.498908, -4, 1, -0.5, 0.5, 0.5,
-3.639544, -3.498908, -4, 1, 1.5, 0.5, 0.5,
-3.639544, -3.498908, -4, 0, 1.5, 0.5, 0.5,
-3.639544, -3.498908, -2, 0, -0.5, 0.5, 0.5,
-3.639544, -3.498908, -2, 1, -0.5, 0.5, 0.5,
-3.639544, -3.498908, -2, 1, 1.5, 0.5, 0.5,
-3.639544, -3.498908, -2, 0, 1.5, 0.5, 0.5,
-3.639544, -3.498908, 0, 0, -0.5, 0.5, 0.5,
-3.639544, -3.498908, 0, 1, -0.5, 0.5, 0.5,
-3.639544, -3.498908, 0, 1, 1.5, 0.5, 0.5,
-3.639544, -3.498908, 0, 0, 1.5, 0.5, 0.5,
-3.639544, -3.498908, 2, 0, -0.5, 0.5, 0.5,
-3.639544, -3.498908, 2, 1, -0.5, 0.5, 0.5,
-3.639544, -3.498908, 2, 1, 1.5, 0.5, 0.5,
-3.639544, -3.498908, 2, 0, 1.5, 0.5, 0.5,
-3.639544, -3.498908, 4, 0, -0.5, 0.5, 0.5,
-3.639544, -3.498908, 4, 1, -0.5, 0.5, 0.5,
-3.639544, -3.498908, 4, 1, 1.5, 0.5, 0.5,
-3.639544, -3.498908, 4, 0, 1.5, 0.5, 0.5
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
-3.158964, -3.018021, -5.579832,
-3.158964, 3.393798, -5.579832,
-3.158964, -3.018021, 5.961256,
-3.158964, 3.393798, 5.961256,
-3.158964, -3.018021, -5.579832,
-3.158964, -3.018021, 5.961256,
-3.158964, 3.393798, -5.579832,
-3.158964, 3.393798, 5.961256,
-3.158964, -3.018021, -5.579832,
3.248759, -3.018021, -5.579832,
-3.158964, -3.018021, 5.961256,
3.248759, -3.018021, 5.961256,
-3.158964, 3.393798, -5.579832,
3.248759, 3.393798, -5.579832,
-3.158964, 3.393798, 5.961256,
3.248759, 3.393798, 5.961256,
3.248759, -3.018021, -5.579832,
3.248759, 3.393798, -5.579832,
3.248759, -3.018021, 5.961256,
3.248759, 3.393798, 5.961256,
3.248759, -3.018021, -5.579832,
3.248759, -3.018021, 5.961256,
3.248759, 3.393798, -5.579832,
3.248759, 3.393798, 5.961256
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
var radius = 7.836373;
var distance = 34.86491;
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
mvMatrix.translate( -0.04489732, -0.1878886, -0.190712 );
mvMatrix.scale( 1.322286, 1.321441, 0.7341457 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.86491);
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
Disulfiram<-read.table("Disulfiram.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Disulfiram$V2
```

```
## Error in eval(expr, envir, enclos): object 'Disulfiram' not found
```

```r
y<-Disulfiram$V3
```

```
## Error in eval(expr, envir, enclos): object 'Disulfiram' not found
```

```r
z<-Disulfiram$V4
```

```
## Error in eval(expr, envir, enclos): object 'Disulfiram' not found
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
-3.065648, 1.222885, -1.817868, 0, 0, 1, 1, 1,
-3.057625, -1.736737, -3.625225, 1, 0, 0, 1, 1,
-3.022252, 1.309967, -2.045354, 1, 0, 0, 1, 1,
-2.742985, -0.5925106, -2.118249, 1, 0, 0, 1, 1,
-2.679307, 0.256692, -0.1911363, 1, 0, 0, 1, 1,
-2.628648, -0.1155019, -1.606579, 1, 0, 0, 1, 1,
-2.602, 0.8230339, -0.06822863, 0, 0, 0, 1, 1,
-2.514126, -1.053127, -3.122868, 0, 0, 0, 1, 1,
-2.509466, -0.6789252, -1.402782, 0, 0, 0, 1, 1,
-2.468503, 1.359368, -0.0410004, 0, 0, 0, 1, 1,
-2.435813, -0.629898, -1.431314, 0, 0, 0, 1, 1,
-2.336134, -0.3913977, -1.120199, 0, 0, 0, 1, 1,
-2.330258, -0.2292157, -2.252903, 0, 0, 0, 1, 1,
-2.323475, -0.6598672, -1.376452, 1, 1, 1, 1, 1,
-2.274085, 0.02975675, -0.9332533, 1, 1, 1, 1, 1,
-2.235548, 0.4167344, -1.599906, 1, 1, 1, 1, 1,
-2.22038, -0.1422469, -1.852917, 1, 1, 1, 1, 1,
-2.204999, 0.4526951, -0.7491207, 1, 1, 1, 1, 1,
-2.199612, -2.149848, -2.515848, 1, 1, 1, 1, 1,
-2.152052, -0.0456653, -1.14762, 1, 1, 1, 1, 1,
-2.095279, 0.884953, -0.5737489, 1, 1, 1, 1, 1,
-2.053018, 1.055138, -1.126665, 1, 1, 1, 1, 1,
-2.02829, -0.2033864, -0.8214535, 1, 1, 1, 1, 1,
-2.023926, -0.4259216, -2.313195, 1, 1, 1, 1, 1,
-2.020202, 1.122268, -2.203068, 1, 1, 1, 1, 1,
-2.019385, 0.9689939, -1.350901, 1, 1, 1, 1, 1,
-1.951504, -0.1701195, -2.577504, 1, 1, 1, 1, 1,
-1.950385, -0.3785861, -1.950198, 1, 1, 1, 1, 1,
-1.950036, 1.401418, -1.813236, 0, 0, 1, 1, 1,
-1.938871, -0.4149984, -2.847738, 1, 0, 0, 1, 1,
-1.928111, 1.019926, 0.3076282, 1, 0, 0, 1, 1,
-1.927551, 0.1322068, -1.201986, 1, 0, 0, 1, 1,
-1.92545, -0.08893238, -1.58976, 1, 0, 0, 1, 1,
-1.916813, -0.03289383, -1.832235, 1, 0, 0, 1, 1,
-1.882948, -1.655896, -3.934719, 0, 0, 0, 1, 1,
-1.830997, 0.5814494, 0.03702149, 0, 0, 0, 1, 1,
-1.805593, 0.3468471, -0.079683, 0, 0, 0, 1, 1,
-1.802552, -1.148, -2.073703, 0, 0, 0, 1, 1,
-1.796999, 1.052396, -1.813352, 0, 0, 0, 1, 1,
-1.78926, 0.2610353, -2.134771, 0, 0, 0, 1, 1,
-1.777615, 0.1877389, -2.354598, 0, 0, 0, 1, 1,
-1.770832, 1.122603, -1.078503, 1, 1, 1, 1, 1,
-1.758853, -0.4632534, -3.488225, 1, 1, 1, 1, 1,
-1.7373, -0.3525216, -1.012595, 1, 1, 1, 1, 1,
-1.726926, -0.5840674, -2.271618, 1, 1, 1, 1, 1,
-1.719148, -1.034324, -2.248739, 1, 1, 1, 1, 1,
-1.708463, 0.3533176, -0.7380013, 1, 1, 1, 1, 1,
-1.69774, -0.9382517, -2.827894, 1, 1, 1, 1, 1,
-1.674108, -0.8994057, -3.23934, 1, 1, 1, 1, 1,
-1.66262, 0.7417202, -1.729831, 1, 1, 1, 1, 1,
-1.654917, 0.3101573, -1.646674, 1, 1, 1, 1, 1,
-1.654673, 1.703552, -1.567477, 1, 1, 1, 1, 1,
-1.650097, -0.4737322, -1.587217, 1, 1, 1, 1, 1,
-1.645175, -0.2652755, -2.412018, 1, 1, 1, 1, 1,
-1.640635, 0.0041743, -1.876726, 1, 1, 1, 1, 1,
-1.630277, 1.533405, -0.6939573, 1, 1, 1, 1, 1,
-1.620732, 0.5451427, -2.515728, 0, 0, 1, 1, 1,
-1.619945, 2.495433, 0.04207919, 1, 0, 0, 1, 1,
-1.618548, 0.1725339, -0.9395634, 1, 0, 0, 1, 1,
-1.584608, 0.6626196, -2.247664, 1, 0, 0, 1, 1,
-1.580325, 0.5230221, -1.263986, 1, 0, 0, 1, 1,
-1.57308, -1.641986, -3.664421, 1, 0, 0, 1, 1,
-1.569198, -0.594116, -2.773942, 0, 0, 0, 1, 1,
-1.555863, 1.011854, -0.8748775, 0, 0, 0, 1, 1,
-1.536783, -1.740777, -1.889331, 0, 0, 0, 1, 1,
-1.531123, -0.4345134, -0.2126696, 0, 0, 0, 1, 1,
-1.53109, 1.175447, -1.614341, 0, 0, 0, 1, 1,
-1.522784, 0.5225942, -0.3784113, 0, 0, 0, 1, 1,
-1.514135, 0.8641812, -2.490188, 0, 0, 0, 1, 1,
-1.510623, -0.4001261, -2.226516, 1, 1, 1, 1, 1,
-1.507353, 0.5898617, -1.85605, 1, 1, 1, 1, 1,
-1.506272, -0.5277336, -0.2433072, 1, 1, 1, 1, 1,
-1.504865, 0.3095035, -2.059862, 1, 1, 1, 1, 1,
-1.501657, -0.4302338, -1.004614, 1, 1, 1, 1, 1,
-1.478474, -0.8507243, -2.530234, 1, 1, 1, 1, 1,
-1.472614, 0.002334268, -2.399359, 1, 1, 1, 1, 1,
-1.469743, 0.8485107, -1.702787, 1, 1, 1, 1, 1,
-1.455451, 2.488559, 0.1425699, 1, 1, 1, 1, 1,
-1.454376, 0.08237328, -0.6868892, 1, 1, 1, 1, 1,
-1.444797, -1.434266, -1.336971, 1, 1, 1, 1, 1,
-1.438648, -0.1407128, -2.222313, 1, 1, 1, 1, 1,
-1.436901, -0.2455309, 0.3896647, 1, 1, 1, 1, 1,
-1.431516, -0.3036196, -2.644606, 1, 1, 1, 1, 1,
-1.426053, -0.7347558, -0.4370106, 1, 1, 1, 1, 1,
-1.417722, -0.9567947, -1.915115, 0, 0, 1, 1, 1,
-1.414135, 0.2844047, -0.8008392, 1, 0, 0, 1, 1,
-1.408976, -0.1403356, -2.05854, 1, 0, 0, 1, 1,
-1.407646, -0.7987021, -2.036569, 1, 0, 0, 1, 1,
-1.403567, -0.7161318, -2.162307, 1, 0, 0, 1, 1,
-1.398779, -0.1791132, -3.991763, 1, 0, 0, 1, 1,
-1.397393, 0.7802286, -1.942852, 0, 0, 0, 1, 1,
-1.396899, -0.2537701, -4.17028, 0, 0, 0, 1, 1,
-1.388737, 2.101372, -0.8604077, 0, 0, 0, 1, 1,
-1.384482, 1.268682, -1.197747, 0, 0, 0, 1, 1,
-1.377763, 0.01288481, -2.386656, 0, 0, 0, 1, 1,
-1.376444, -0.05828896, -1.131521, 0, 0, 0, 1, 1,
-1.37488, -1.621669, -2.03643, 0, 0, 0, 1, 1,
-1.363407, -0.0238381, -0.01269404, 1, 1, 1, 1, 1,
-1.351689, 1.346769, -1.955107, 1, 1, 1, 1, 1,
-1.347351, 1.494514, -0.6326585, 1, 1, 1, 1, 1,
-1.337461, -0.9419028, -3.859504, 1, 1, 1, 1, 1,
-1.335493, -1.724913, -3.051258, 1, 1, 1, 1, 1,
-1.333102, 2.201384, -0.874646, 1, 1, 1, 1, 1,
-1.323781, 2.047984, -0.8525891, 1, 1, 1, 1, 1,
-1.31447, -1.274483, -4.319007, 1, 1, 1, 1, 1,
-1.311221, 0.5740827, -1.843126, 1, 1, 1, 1, 1,
-1.298931, -0.8459663, -1.761017, 1, 1, 1, 1, 1,
-1.290505, -0.3159529, -1.786272, 1, 1, 1, 1, 1,
-1.286873, 2.132286, -0.3782351, 1, 1, 1, 1, 1,
-1.286615, 0.3456367, -1.757803, 1, 1, 1, 1, 1,
-1.281868, 0.6858213, -2.901245, 1, 1, 1, 1, 1,
-1.280373, 1.049832, -0.1503324, 1, 1, 1, 1, 1,
-1.26898, 0.1545146, -0.8989239, 0, 0, 1, 1, 1,
-1.266484, -1.26285, -1.893269, 1, 0, 0, 1, 1,
-1.265718, 0.8942854, -1.860782, 1, 0, 0, 1, 1,
-1.256169, 0.5926209, -0.1424856, 1, 0, 0, 1, 1,
-1.256014, 0.04940035, -2.18197, 1, 0, 0, 1, 1,
-1.253268, 0.7080516, -2.683611, 1, 0, 0, 1, 1,
-1.249795, -1.071212, -2.184482, 0, 0, 0, 1, 1,
-1.249769, 0.4322692, 0.8018879, 0, 0, 0, 1, 1,
-1.245706, -0.1043357, -0.9907963, 0, 0, 0, 1, 1,
-1.243129, -1.17326, -2.718198, 0, 0, 0, 1, 1,
-1.240645, -1.411915, -2.724032, 0, 0, 0, 1, 1,
-1.234137, -1.059381, -1.867437, 0, 0, 0, 1, 1,
-1.232832, 1.489452, -2.032833, 0, 0, 0, 1, 1,
-1.231125, -2.485909, -4.204869, 1, 1, 1, 1, 1,
-1.224694, 2.024035, -2.602666, 1, 1, 1, 1, 1,
-1.22401, 0.7643238, -0.883766, 1, 1, 1, 1, 1,
-1.216737, 1.971764, -1.645489, 1, 1, 1, 1, 1,
-1.213816, 1.606958, 1.117708, 1, 1, 1, 1, 1,
-1.211637, 0.8164197, 0.05736546, 1, 1, 1, 1, 1,
-1.196181, 1.11727, 0.4981507, 1, 1, 1, 1, 1,
-1.195383, -0.6862953, -1.450995, 1, 1, 1, 1, 1,
-1.19214, 0.3520079, -1.760824, 1, 1, 1, 1, 1,
-1.191216, -0.08878659, -2.0515, 1, 1, 1, 1, 1,
-1.175931, 2.664963, 1.195566, 1, 1, 1, 1, 1,
-1.174817, 0.02004373, -0.9118432, 1, 1, 1, 1, 1,
-1.158385, 0.241255, -1.529478, 1, 1, 1, 1, 1,
-1.157374, -0.4982252, -2.922426, 1, 1, 1, 1, 1,
-1.153248, 1.439175, -1.804338, 1, 1, 1, 1, 1,
-1.150256, 1.073953, -1.520235, 0, 0, 1, 1, 1,
-1.143941, -0.8909363, -0.9916211, 1, 0, 0, 1, 1,
-1.138056, 0.3131494, -1.793735, 1, 0, 0, 1, 1,
-1.136795, -0.7814469, -1.84603, 1, 0, 0, 1, 1,
-1.134548, 0.6149074, -2.270546, 1, 0, 0, 1, 1,
-1.133862, 0.3162971, -1.240158, 1, 0, 0, 1, 1,
-1.12832, -0.6803221, -2.738693, 0, 0, 0, 1, 1,
-1.128177, -1.91899, -2.92766, 0, 0, 0, 1, 1,
-1.122509, -0.7595823, -3.41775, 0, 0, 0, 1, 1,
-1.122365, 0.4211944, -0.5870547, 0, 0, 0, 1, 1,
-1.119901, -1.582117, -1.767553, 0, 0, 0, 1, 1,
-1.117365, -0.4675165, -2.314498, 0, 0, 0, 1, 1,
-1.112278, 0.235925, -0.728664, 0, 0, 0, 1, 1,
-1.107998, 0.764466, -1.66899, 1, 1, 1, 1, 1,
-1.105094, 1.31515, 1.080203, 1, 1, 1, 1, 1,
-1.103684, 0.2201223, -0.06325055, 1, 1, 1, 1, 1,
-1.102152, -1.80658, -3.191169, 1, 1, 1, 1, 1,
-1.100509, 0.7939866, -1.833621, 1, 1, 1, 1, 1,
-1.099673, 0.5386518, -3.758245, 1, 1, 1, 1, 1,
-1.090255, -0.6926473, -1.702055, 1, 1, 1, 1, 1,
-1.088347, 0.4844894, -2.682063, 1, 1, 1, 1, 1,
-1.078434, 0.7088981, -0.2181853, 1, 1, 1, 1, 1,
-1.061921, 0.7565673, -0.8464159, 1, 1, 1, 1, 1,
-1.060367, -1.87157, -2.405705, 1, 1, 1, 1, 1,
-1.044564, -0.0755574, -1.095344, 1, 1, 1, 1, 1,
-1.040057, -1.297023, -0.6779311, 1, 1, 1, 1, 1,
-1.038867, -0.1778276, -1.104952, 1, 1, 1, 1, 1,
-1.038756, 0.3312775, -1.505456, 1, 1, 1, 1, 1,
-1.004101, 1.280337, -1.177826, 0, 0, 1, 1, 1,
-0.9963193, 0.2927888, -1.172218, 1, 0, 0, 1, 1,
-0.9947998, 2.563869, 1.826504, 1, 0, 0, 1, 1,
-0.9850836, 1.717184, -0.1427123, 1, 0, 0, 1, 1,
-0.9811187, -0.4278468, -0.7029364, 1, 0, 0, 1, 1,
-0.9795775, 1.414643, -2.009751, 1, 0, 0, 1, 1,
-0.9789636, 2.017509, -0.8364064, 0, 0, 0, 1, 1,
-0.977141, 1.166922, -3.007073, 0, 0, 0, 1, 1,
-0.9753644, -1.309873, -3.202582, 0, 0, 0, 1, 1,
-0.9745435, -1.350918, -1.450838, 0, 0, 0, 1, 1,
-0.9662862, -0.2488618, -2.217, 0, 0, 0, 1, 1,
-0.9620695, -0.1204907, -0.1799191, 0, 0, 0, 1, 1,
-0.9600372, 0.09745528, -1.550248, 0, 0, 0, 1, 1,
-0.9575465, 0.7593711, -0.03529507, 1, 1, 1, 1, 1,
-0.9547337, -0.5925741, -1.511622, 1, 1, 1, 1, 1,
-0.9494323, -1.083297, -2.376563, 1, 1, 1, 1, 1,
-0.9373174, -0.004481046, -1.804827, 1, 1, 1, 1, 1,
-0.9306687, -1.906353, -1.523801, 1, 1, 1, 1, 1,
-0.9206888, -0.4337698, -3.080657, 1, 1, 1, 1, 1,
-0.919497, -0.4955173, -2.053396, 1, 1, 1, 1, 1,
-0.9179651, -1.447733, -3.215166, 1, 1, 1, 1, 1,
-0.9148347, 1.110456, 0.500812, 1, 1, 1, 1, 1,
-0.9142578, 0.7861239, -0.9846479, 1, 1, 1, 1, 1,
-0.9121408, -0.8764827, -3.961419, 1, 1, 1, 1, 1,
-0.9120621, 0.08297225, -1.572398, 1, 1, 1, 1, 1,
-0.9109752, -0.4703374, -3.020607, 1, 1, 1, 1, 1,
-0.9105539, 0.5498918, -0.3731569, 1, 1, 1, 1, 1,
-0.90402, -0.5300859, -2.020093, 1, 1, 1, 1, 1,
-0.8950297, 0.5094482, -0.7881448, 0, 0, 1, 1, 1,
-0.8944325, -0.9832153, -1.991885, 1, 0, 0, 1, 1,
-0.8938375, 0.5745913, -0.9362102, 1, 0, 0, 1, 1,
-0.8922089, 1.001965, -1.888456, 1, 0, 0, 1, 1,
-0.8887077, 0.5743636, -1.805915, 1, 0, 0, 1, 1,
-0.8883723, 0.6747782, -2.349142, 1, 0, 0, 1, 1,
-0.8852909, -0.4788574, -1.238968, 0, 0, 0, 1, 1,
-0.879968, 0.9422184, -2.470298, 0, 0, 0, 1, 1,
-0.8790954, -0.0457343, -2.869395, 0, 0, 0, 1, 1,
-0.8727766, 0.8812041, 0.7838295, 0, 0, 0, 1, 1,
-0.8676552, 0.5135225, -0.09266657, 0, 0, 0, 1, 1,
-0.8673822, -1.306985, -2.908831, 0, 0, 0, 1, 1,
-0.8664591, -0.6459156, -2.505151, 0, 0, 0, 1, 1,
-0.8601813, 0.08499607, -2.331475, 1, 1, 1, 1, 1,
-0.856417, 2.30895, -0.5122222, 1, 1, 1, 1, 1,
-0.8512166, 0.3179724, -1.637346, 1, 1, 1, 1, 1,
-0.8491797, 0.4722142, -1.955652, 1, 1, 1, 1, 1,
-0.8478035, 1.73916, 1.073652, 1, 1, 1, 1, 1,
-0.8418387, -0.05840663, -3.24055, 1, 1, 1, 1, 1,
-0.8324676, 0.1801084, -1.566854, 1, 1, 1, 1, 1,
-0.8316041, -1.568383, -2.356187, 1, 1, 1, 1, 1,
-0.8292915, 0.00116372, -1.239651, 1, 1, 1, 1, 1,
-0.8219494, 0.1068594, -0.2923129, 1, 1, 1, 1, 1,
-0.8195029, 2.325142, -0.6993937, 1, 1, 1, 1, 1,
-0.7943048, 1.314582, -0.6074423, 1, 1, 1, 1, 1,
-0.7936647, 0.9733481, 0.8627182, 1, 1, 1, 1, 1,
-0.7899278, -1.837906, -3.059778, 1, 1, 1, 1, 1,
-0.784863, -0.04429618, -1.037266, 1, 1, 1, 1, 1,
-0.7820675, -0.3965815, -2.778838, 0, 0, 1, 1, 1,
-0.7779159, -0.2212687, -0.3174358, 1, 0, 0, 1, 1,
-0.762575, -0.8591431, -3.163138, 1, 0, 0, 1, 1,
-0.7558671, 1.573875, -1.488796, 1, 0, 0, 1, 1,
-0.7544318, 1.932163, -1.555153, 1, 0, 0, 1, 1,
-0.7489155, -0.3529226, -3.358041, 1, 0, 0, 1, 1,
-0.7459002, 1.671802, -1.406153, 0, 0, 0, 1, 1,
-0.7440843, -0.4633768, -1.868189, 0, 0, 0, 1, 1,
-0.743066, -0.5863328, -3.031643, 0, 0, 0, 1, 1,
-0.7418022, -2.398439, -3.813194, 0, 0, 0, 1, 1,
-0.7379434, 0.7279841, 1.528854, 0, 0, 0, 1, 1,
-0.7372227, 0.2502163, -1.437403, 0, 0, 0, 1, 1,
-0.7300528, 1.271255, -2.16364, 0, 0, 0, 1, 1,
-0.7260559, 0.5290722, -1.482146, 1, 1, 1, 1, 1,
-0.7244981, -1.834561, -1.604435, 1, 1, 1, 1, 1,
-0.7231051, -0.6057894, -2.586324, 1, 1, 1, 1, 1,
-0.7229888, -0.8872904, -1.257117, 1, 1, 1, 1, 1,
-0.7149759, -1.575498, -4.243577, 1, 1, 1, 1, 1,
-0.7073286, -1.736756, -3.319522, 1, 1, 1, 1, 1,
-0.707, 0.5036508, -1.057162, 1, 1, 1, 1, 1,
-0.7064584, 0.3292747, -2.714176, 1, 1, 1, 1, 1,
-0.698953, 2.495592, -0.6441452, 1, 1, 1, 1, 1,
-0.6963373, 0.0177864, -0.9528088, 1, 1, 1, 1, 1,
-0.6855844, -0.3517734, -2.417246, 1, 1, 1, 1, 1,
-0.6775215, -0.276574, -2.40834, 1, 1, 1, 1, 1,
-0.6773903, -0.5469691, -1.816788, 1, 1, 1, 1, 1,
-0.6732059, 0.3726631, -1.921406, 1, 1, 1, 1, 1,
-0.672046, -0.7925373, -2.556152, 1, 1, 1, 1, 1,
-0.6687905, 0.8737696, -2.18615, 0, 0, 1, 1, 1,
-0.6661524, -0.2153385, -1.885037, 1, 0, 0, 1, 1,
-0.6635891, -0.1133536, -3.387537, 1, 0, 0, 1, 1,
-0.662249, 0.7181264, 1.533298, 1, 0, 0, 1, 1,
-0.6592961, 0.8408365, -0.4840304, 1, 0, 0, 1, 1,
-0.6576847, -0.4521712, -2.763596, 1, 0, 0, 1, 1,
-0.6570797, 1.721326, 1.893914, 0, 0, 0, 1, 1,
-0.651767, -0.6918243, -1.022586, 0, 0, 0, 1, 1,
-0.6515557, -0.5278234, -2.649678, 0, 0, 0, 1, 1,
-0.6402936, -0.02453571, -0.2231918, 0, 0, 0, 1, 1,
-0.6377164, 0.1076964, -2.341166, 0, 0, 0, 1, 1,
-0.6363735, 0.5074918, -0.9132401, 0, 0, 0, 1, 1,
-0.6304058, 0.08629487, -1.773506, 0, 0, 0, 1, 1,
-0.6296946, 0.173359, -0.6951649, 1, 1, 1, 1, 1,
-0.620272, 0.2972155, -1.658408, 1, 1, 1, 1, 1,
-0.6190947, 0.3470209, -1.281768, 1, 1, 1, 1, 1,
-0.6161443, -0.245027, -1.016193, 1, 1, 1, 1, 1,
-0.6069734, -0.8302356, -1.81086, 1, 1, 1, 1, 1,
-0.6049463, -0.8744752, -3.831007, 1, 1, 1, 1, 1,
-0.5956711, -0.6596106, -2.973089, 1, 1, 1, 1, 1,
-0.5936251, -0.02458186, -1.151652, 1, 1, 1, 1, 1,
-0.5925142, 0.3834507, -1.398668, 1, 1, 1, 1, 1,
-0.5913953, 1.220427, -0.7919661, 1, 1, 1, 1, 1,
-0.5860127, -0.85935, -1.494015, 1, 1, 1, 1, 1,
-0.5840492, 1.846098, -0.321948, 1, 1, 1, 1, 1,
-0.5821882, -0.06864016, -2.941968, 1, 1, 1, 1, 1,
-0.5776, 0.6941869, -0.9725381, 1, 1, 1, 1, 1,
-0.5762078, 0.1633215, -0.8023795, 1, 1, 1, 1, 1,
-0.5736827, 0.6289679, -0.7793049, 0, 0, 1, 1, 1,
-0.5665444, 0.8478515, -0.3004518, 1, 0, 0, 1, 1,
-0.5592796, -0.1821212, 1.074267, 1, 0, 0, 1, 1,
-0.5569347, 0.2167, -2.099591, 1, 0, 0, 1, 1,
-0.5536265, 1.208008, -2.123935, 1, 0, 0, 1, 1,
-0.5530984, 0.0667012, 0.7431626, 1, 0, 0, 1, 1,
-0.5454889, 0.1237189, -0.8823823, 0, 0, 0, 1, 1,
-0.5452822, 0.4337787, -0.82618, 0, 0, 0, 1, 1,
-0.5440677, 1.252338, -0.8385245, 0, 0, 0, 1, 1,
-0.541496, -1.452139, -3.004735, 0, 0, 0, 1, 1,
-0.5400934, -0.5108271, -3.698959, 0, 0, 0, 1, 1,
-0.5383777, 0.7346722, 1.113468, 0, 0, 0, 1, 1,
-0.5378653, -1.363486, -2.102235, 0, 0, 0, 1, 1,
-0.5375875, -0.5288495, -3.532885, 1, 1, 1, 1, 1,
-0.5310903, 0.1135848, -0.502722, 1, 1, 1, 1, 1,
-0.5296032, -0.1043782, -1.082259, 1, 1, 1, 1, 1,
-0.5245138, 0.2314698, -1.414449, 1, 1, 1, 1, 1,
-0.5216042, 0.5130294, -1.148119, 1, 1, 1, 1, 1,
-0.5192011, -0.6475177, -2.688364, 1, 1, 1, 1, 1,
-0.516578, -0.05260651, -0.7472364, 1, 1, 1, 1, 1,
-0.5138004, -1.476019, -2.127617, 1, 1, 1, 1, 1,
-0.5017772, 1.031511, -0.4295202, 1, 1, 1, 1, 1,
-0.4982514, -0.03378011, -1.95188, 1, 1, 1, 1, 1,
-0.4960653, 0.4966728, -1.543868, 1, 1, 1, 1, 1,
-0.4932402, -1.295282, -3.588482, 1, 1, 1, 1, 1,
-0.4925364, -1.829095, -2.880644, 1, 1, 1, 1, 1,
-0.4905871, 1.054291, 0.05264715, 1, 1, 1, 1, 1,
-0.4902694, -0.097964, -2.159691, 1, 1, 1, 1, 1,
-0.4889229, 1.642546, -0.02398342, 0, 0, 1, 1, 1,
-0.4859647, 0.9021995, 1.103996, 1, 0, 0, 1, 1,
-0.4840407, 0.2426737, -3.507092, 1, 0, 0, 1, 1,
-0.4795596, 0.04024502, -1.93418, 1, 0, 0, 1, 1,
-0.4708488, -1.248288, -3.817993, 1, 0, 0, 1, 1,
-0.4684476, 0.3101611, -1.841697, 1, 0, 0, 1, 1,
-0.4683627, -1.203661, -2.893834, 0, 0, 0, 1, 1,
-0.4600624, 0.2802944, -2.171182, 0, 0, 0, 1, 1,
-0.4599348, -0.5166754, -3.464062, 0, 0, 0, 1, 1,
-0.4582276, -0.5905743, -2.994285, 0, 0, 0, 1, 1,
-0.4573746, -0.3227571, -3.602521, 0, 0, 0, 1, 1,
-0.4515955, 1.355368, -0.6629553, 0, 0, 0, 1, 1,
-0.4498265, 0.3670724, -0.4256707, 0, 0, 0, 1, 1,
-0.4444128, 2.211218, 0.9222026, 1, 1, 1, 1, 1,
-0.4408998, 0.325821, -2.091988, 1, 1, 1, 1, 1,
-0.4345365, -0.7797538, -3.617148, 1, 1, 1, 1, 1,
-0.4343806, -0.6347933, -2.770924, 1, 1, 1, 1, 1,
-0.4329635, -0.4468883, -2.021049, 1, 1, 1, 1, 1,
-0.4325256, -1.140494, -2.674376, 1, 1, 1, 1, 1,
-0.4306635, 1.188903, 0.143032, 1, 1, 1, 1, 1,
-0.430182, -1.23262, -2.954775, 1, 1, 1, 1, 1,
-0.4269819, -0.1000721, -1.025492, 1, 1, 1, 1, 1,
-0.4253169, 2.044064, 2.113266, 1, 1, 1, 1, 1,
-0.4246716, -0.7375656, -3.196749, 1, 1, 1, 1, 1,
-0.4200106, -1.177791, -4.551403, 1, 1, 1, 1, 1,
-0.408026, -0.5942796, -0.4461274, 1, 1, 1, 1, 1,
-0.4061195, 1.131957, -0.6640841, 1, 1, 1, 1, 1,
-0.4039134, 0.6989461, -0.1927826, 1, 1, 1, 1, 1,
-0.4032646, -1.322256, -2.641653, 0, 0, 1, 1, 1,
-0.399323, -0.8213426, -2.628435, 1, 0, 0, 1, 1,
-0.3972113, 0.2376319, -0.1455064, 1, 0, 0, 1, 1,
-0.3968566, 0.8840233, 0.7960403, 1, 0, 0, 1, 1,
-0.396345, -1.780043, -0.3847507, 1, 0, 0, 1, 1,
-0.3952907, -0.6039333, -1.32757, 1, 0, 0, 1, 1,
-0.3940269, 0.3977489, 0.4732794, 0, 0, 0, 1, 1,
-0.3881243, -0.5112902, -3.741052, 0, 0, 0, 1, 1,
-0.3877575, -0.2471427, -3.303012, 0, 0, 0, 1, 1,
-0.387063, 0.09466166, -1.307656, 0, 0, 0, 1, 1,
-0.3837177, 0.02267911, -2.647717, 0, 0, 0, 1, 1,
-0.3819433, -0.1732296, -1.856989, 0, 0, 0, 1, 1,
-0.3785993, 2.17737, -0.2527911, 0, 0, 0, 1, 1,
-0.3777831, -0.2651519, -1.220507, 1, 1, 1, 1, 1,
-0.3743705, -0.1890783, -1.155229, 1, 1, 1, 1, 1,
-0.3731123, -1.092776, -4.585661, 1, 1, 1, 1, 1,
-0.3686461, -2.275972, -2.84795, 1, 1, 1, 1, 1,
-0.3654186, 1.687777, 0.5963621, 1, 1, 1, 1, 1,
-0.3632523, 0.005027009, -1.318416, 1, 1, 1, 1, 1,
-0.3612799, -2.81524, -3.425885, 1, 1, 1, 1, 1,
-0.3588551, -0.5917419, -2.536005, 1, 1, 1, 1, 1,
-0.3581748, 0.896875, 0.005648849, 1, 1, 1, 1, 1,
-0.3570682, 1.694999, -0.8677678, 1, 1, 1, 1, 1,
-0.3568325, -0.8360336, -4.544688, 1, 1, 1, 1, 1,
-0.3545398, -1.795117, -4.325638, 1, 1, 1, 1, 1,
-0.3486587, -0.9432701, -2.573109, 1, 1, 1, 1, 1,
-0.3482778, -0.06334814, -1.187831, 1, 1, 1, 1, 1,
-0.3474627, 0.8736569, -0.3670977, 1, 1, 1, 1, 1,
-0.3433592, 0.3632195, -0.9398881, 0, 0, 1, 1, 1,
-0.3393106, 2.361763, -0.5697408, 1, 0, 0, 1, 1,
-0.3371218, 0.4197378, -2.186808, 1, 0, 0, 1, 1,
-0.3369025, -1.710577, -3.530537, 1, 0, 0, 1, 1,
-0.3356263, 0.2580054, 0.01741012, 1, 0, 0, 1, 1,
-0.3344161, 0.5113125, 0.03081308, 1, 0, 0, 1, 1,
-0.3323013, 1.409742, -1.432075, 0, 0, 0, 1, 1,
-0.33225, 0.4642887, -1.659181, 0, 0, 0, 1, 1,
-0.3314924, 1.615489, 0.4402584, 0, 0, 0, 1, 1,
-0.3290316, 0.3836067, 0.07105532, 0, 0, 0, 1, 1,
-0.326759, 3.300422, 1.838784, 0, 0, 0, 1, 1,
-0.325193, -1.428452, -0.8237986, 0, 0, 0, 1, 1,
-0.3190785, -1.021443, -0.9037394, 0, 0, 0, 1, 1,
-0.3180296, 0.2745253, -1.517544, 1, 1, 1, 1, 1,
-0.3159865, 0.1701188, -2.572248, 1, 1, 1, 1, 1,
-0.3122049, 0.02833206, -3.271672, 1, 1, 1, 1, 1,
-0.3116862, 0.5355198, -0.5694886, 1, 1, 1, 1, 1,
-0.3105352, -1.203479, -3.88433, 1, 1, 1, 1, 1,
-0.3083621, -1.006505, -3.683266, 1, 1, 1, 1, 1,
-0.3051159, -0.06976499, -3.34497, 1, 1, 1, 1, 1,
-0.3042043, -0.2346474, -2.113532, 1, 1, 1, 1, 1,
-0.3016441, 0.749935, -0.4667799, 1, 1, 1, 1, 1,
-0.3007134, -0.3188466, -3.03677, 1, 1, 1, 1, 1,
-0.299745, 0.3773833, -1.628808, 1, 1, 1, 1, 1,
-0.2984639, -1.100336, -0.3819799, 1, 1, 1, 1, 1,
-0.2977898, 1.45505, -0.7642843, 1, 1, 1, 1, 1,
-0.2968421, 0.3841288, 0.101064, 1, 1, 1, 1, 1,
-0.2958981, 1.351736, -0.1003035, 1, 1, 1, 1, 1,
-0.2957641, 1.623579, 0.9521511, 0, 0, 1, 1, 1,
-0.2933204, 0.6757624, -1.647099, 1, 0, 0, 1, 1,
-0.2931996, -0.7627519, -2.526159, 1, 0, 0, 1, 1,
-0.2922277, 1.25468, 0.7778075, 1, 0, 0, 1, 1,
-0.2903767, 0.6137645, 0.8285075, 1, 0, 0, 1, 1,
-0.2849546, 0.7366112, -1.189369, 1, 0, 0, 1, 1,
-0.2841413, -1.285037, -4.542945, 0, 0, 0, 1, 1,
-0.2813632, 0.08880899, -3.35104, 0, 0, 0, 1, 1,
-0.2807734, -0.3177508, -2.076631, 0, 0, 0, 1, 1,
-0.2786968, 0.9157932, -1.452405, 0, 0, 0, 1, 1,
-0.2776251, -0.1572828, -3.107256, 0, 0, 0, 1, 1,
-0.2715187, 0.2825755, -1.54222, 0, 0, 0, 1, 1,
-0.2712444, 0.4954168, -0.39678, 0, 0, 0, 1, 1,
-0.2674921, -0.4008642, -3.386079, 1, 1, 1, 1, 1,
-0.2657878, 0.01992571, -0.8863609, 1, 1, 1, 1, 1,
-0.2656065, 0.2729732, -0.7095145, 1, 1, 1, 1, 1,
-0.256784, 0.9527497, -0.9766374, 1, 1, 1, 1, 1,
-0.2556728, 1.564937, 0.6079741, 1, 1, 1, 1, 1,
-0.2519755, 1.037927, -1.05286, 1, 1, 1, 1, 1,
-0.2517438, 1.237864, -1.78204, 1, 1, 1, 1, 1,
-0.2504984, 0.3993298, 0.143855, 1, 1, 1, 1, 1,
-0.2484279, 0.2076186, -1.392238, 1, 1, 1, 1, 1,
-0.2470928, -1.047953, -3.45246, 1, 1, 1, 1, 1,
-0.2467778, -0.1264779, -3.853519, 1, 1, 1, 1, 1,
-0.2454612, 0.6919642, -0.3443818, 1, 1, 1, 1, 1,
-0.244892, -1.888751, -1.858913, 1, 1, 1, 1, 1,
-0.2440946, 1.314769, -1.616657, 1, 1, 1, 1, 1,
-0.2426116, 0.5491442, -0.4838024, 1, 1, 1, 1, 1,
-0.2423033, 0.3552238, -1.231473, 0, 0, 1, 1, 1,
-0.2400218, 0.5582614, -0.3169141, 1, 0, 0, 1, 1,
-0.2398965, 0.1652837, -0.9351762, 1, 0, 0, 1, 1,
-0.2387749, -0.03196845, -1.937407, 1, 0, 0, 1, 1,
-0.2385235, 0.2220388, -1.741285, 1, 0, 0, 1, 1,
-0.2358779, -0.4457588, -0.7700701, 1, 0, 0, 1, 1,
-0.2344528, -0.4676211, -1.348781, 0, 0, 0, 1, 1,
-0.2312416, 0.4707048, 0.1615825, 0, 0, 0, 1, 1,
-0.2288321, -2.005734, -5.411758, 0, 0, 0, 1, 1,
-0.2201622, -0.9126027, -3.97553, 0, 0, 0, 1, 1,
-0.2190776, 1.217321, -2.502175, 0, 0, 0, 1, 1,
-0.2183336, -0.05830237, -1.670824, 0, 0, 0, 1, 1,
-0.2138991, 1.110989, 1.791337, 0, 0, 0, 1, 1,
-0.2100161, -0.6378984, -3.724522, 1, 1, 1, 1, 1,
-0.2074692, 0.765362, 0.8837457, 1, 1, 1, 1, 1,
-0.2035074, -1.115872, -3.149879, 1, 1, 1, 1, 1,
-0.198647, -0.1399495, -4.100113, 1, 1, 1, 1, 1,
-0.197332, 0.02635823, -1.918803, 1, 1, 1, 1, 1,
-0.1962526, -0.03355941, -1.292856, 1, 1, 1, 1, 1,
-0.1932132, -0.6404899, -2.459339, 1, 1, 1, 1, 1,
-0.1922361, -0.7233273, -3.52532, 1, 1, 1, 1, 1,
-0.1913243, -1.050827, -2.955984, 1, 1, 1, 1, 1,
-0.1911164, 0.4562689, -0.3416602, 1, 1, 1, 1, 1,
-0.1882403, -1.606511, -1.054396, 1, 1, 1, 1, 1,
-0.1832846, -0.7648008, -2.494187, 1, 1, 1, 1, 1,
-0.1805793, 0.03155112, -0.1376919, 1, 1, 1, 1, 1,
-0.1793013, -0.5896476, -4.071616, 1, 1, 1, 1, 1,
-0.1764204, -1.556198, -5.253394, 1, 1, 1, 1, 1,
-0.1753299, -1.100974, -1.610733, 0, 0, 1, 1, 1,
-0.1747822, 0.1944274, -1.533402, 1, 0, 0, 1, 1,
-0.1734888, -0.3102665, -2.252852, 1, 0, 0, 1, 1,
-0.1713463, -0.1994773, -2.357961, 1, 0, 0, 1, 1,
-0.1666559, 0.5684101, -1.880011, 1, 0, 0, 1, 1,
-0.1657302, -0.3432094, -0.6081052, 1, 0, 0, 1, 1,
-0.1584929, 1.552503, -1.369422, 0, 0, 0, 1, 1,
-0.1579976, 0.5130373, -0.05885353, 0, 0, 0, 1, 1,
-0.1567726, -0.2245736, -3.425727, 0, 0, 0, 1, 1,
-0.1565581, 0.3278341, -1.908599, 0, 0, 0, 1, 1,
-0.149588, 0.2748562, 1.13862, 0, 0, 0, 1, 1,
-0.149179, -1.28701, -3.219646, 0, 0, 0, 1, 1,
-0.1483458, -0.08284345, -1.637117, 0, 0, 0, 1, 1,
-0.1458634, -0.0588121, -0.2870329, 1, 1, 1, 1, 1,
-0.1452222, 0.3214189, -1.06594, 1, 1, 1, 1, 1,
-0.1405019, 0.8028291, -0.8768269, 1, 1, 1, 1, 1,
-0.132149, -0.9104896, -1.762501, 1, 1, 1, 1, 1,
-0.1316866, -0.008331437, -2.70306, 1, 1, 1, 1, 1,
-0.123894, -0.1197174, -3.41145, 1, 1, 1, 1, 1,
-0.1238292, -1.755145, -3.800861, 1, 1, 1, 1, 1,
-0.1198679, 2.314498, -1.622628, 1, 1, 1, 1, 1,
-0.1174599, -0.6684245, -2.054327, 1, 1, 1, 1, 1,
-0.11612, -1.338502, -3.619358, 1, 1, 1, 1, 1,
-0.1098016, 0.07700812, -2.073321, 1, 1, 1, 1, 1,
-0.1086784, 0.0126315, -1.943592, 1, 1, 1, 1, 1,
-0.1069555, -0.7374349, -2.348618, 1, 1, 1, 1, 1,
-0.1024835, -0.4869769, -3.201171, 1, 1, 1, 1, 1,
-0.1022709, -0.2368993, -2.255615, 1, 1, 1, 1, 1,
-0.0972177, -1.146957, -3.078308, 0, 0, 1, 1, 1,
-0.09439515, 0.1895721, -0.1341875, 1, 0, 0, 1, 1,
-0.0937998, 0.2897299, -0.9726847, 1, 0, 0, 1, 1,
-0.09270842, -0.9822743, -3.825829, 1, 0, 0, 1, 1,
-0.09239709, 1.135519, 1.083732, 1, 0, 0, 1, 1,
-0.0914355, 0.5292127, -0.07247318, 1, 0, 0, 1, 1,
-0.09070524, -0.2502351, -3.414394, 0, 0, 0, 1, 1,
-0.08758865, -0.3522596, -4.748551, 0, 0, 0, 1, 1,
-0.0832123, -0.3631612, -2.953403, 0, 0, 0, 1, 1,
-0.07995883, 1.588842, -0.2089034, 0, 0, 0, 1, 1,
-0.073429, -0.5704622, -1.956814, 0, 0, 0, 1, 1,
-0.0697505, -0.906537, -3.01623, 0, 0, 0, 1, 1,
-0.06329497, -0.5085672, -2.377882, 0, 0, 0, 1, 1,
-0.0630689, -1.496706, -3.645613, 1, 1, 1, 1, 1,
-0.05950973, -0.3454806, -1.153747, 1, 1, 1, 1, 1,
-0.057243, -1.92456, -3.909176, 1, 1, 1, 1, 1,
-0.0559759, 1.173406, -0.6029965, 1, 1, 1, 1, 1,
-0.05569024, 0.01488147, -1.647905, 1, 1, 1, 1, 1,
-0.05491716, 0.1476672, 0.5025631, 1, 1, 1, 1, 1,
-0.05235978, -0.2902837, -2.902679, 1, 1, 1, 1, 1,
-0.04909687, -0.845288, -1.28306, 1, 1, 1, 1, 1,
-0.04079585, 0.4272186, -0.5864839, 1, 1, 1, 1, 1,
-0.04022132, 0.06115278, -0.2313598, 1, 1, 1, 1, 1,
-0.0386505, -0.3110027, -4.429422, 1, 1, 1, 1, 1,
-0.03377715, -0.9110353, -0.7798489, 1, 1, 1, 1, 1,
-0.0323061, -0.3688819, -2.677545, 1, 1, 1, 1, 1,
-0.03009788, -0.3670756, -1.600477, 1, 1, 1, 1, 1,
-0.01449208, -0.3557789, -2.95764, 1, 1, 1, 1, 1,
-0.01401493, 0.009227362, -3.52851, 0, 0, 1, 1, 1,
-0.01212358, 1.216951, 1.446376, 1, 0, 0, 1, 1,
-0.01104168, -0.2114757, -4.459828, 1, 0, 0, 1, 1,
-0.009801216, -0.4962381, -2.955282, 1, 0, 0, 1, 1,
-0.007913006, -2.059736, -3.19992, 1, 0, 0, 1, 1,
-0.007545137, 1.239264, 1.013253, 1, 0, 0, 1, 1,
-0.007110327, 1.051779, 0.4061139, 0, 0, 0, 1, 1,
-0.005082722, -0.198037, -3.728544, 0, 0, 0, 1, 1,
-0.005003266, 1.552014, -0.6885684, 0, 0, 0, 1, 1,
-0.004633924, -0.8247063, -3.62087, 0, 0, 0, 1, 1,
-0.00308328, 0.6062454, 0.240536, 0, 0, 0, 1, 1,
-0.002333343, 1.478673, 0.4492423, 0, 0, 0, 1, 1,
-0.001891452, 1.031089, 0.002637814, 0, 0, 0, 1, 1,
-0.001161141, -0.9551491, -2.973432, 1, 1, 1, 1, 1,
0.01383501, -2.043778, 0.8424277, 1, 1, 1, 1, 1,
0.01435477, -0.7218897, 2.99649, 1, 1, 1, 1, 1,
0.01530284, -0.0435352, 1.586466, 1, 1, 1, 1, 1,
0.01910552, -1.350052, 4.618536, 1, 1, 1, 1, 1,
0.02416313, -0.1338292, 5.310925, 1, 1, 1, 1, 1,
0.02471847, 0.8795815, 0.9866888, 1, 1, 1, 1, 1,
0.02876704, 1.522114, -0.3052009, 1, 1, 1, 1, 1,
0.03432212, -0.288439, 3.768354, 1, 1, 1, 1, 1,
0.03710152, 0.1818861, -0.01537547, 1, 1, 1, 1, 1,
0.03827461, 0.2572702, -0.05064309, 1, 1, 1, 1, 1,
0.04047718, -0.0922064, 2.405856, 1, 1, 1, 1, 1,
0.04076512, 0.110354, 2.146256, 1, 1, 1, 1, 1,
0.04233938, -2.465093, 4.152079, 1, 1, 1, 1, 1,
0.04617264, 0.937905, 1.282759, 1, 1, 1, 1, 1,
0.04910731, -0.4108619, 2.321328, 0, 0, 1, 1, 1,
0.05042979, 1.691705, 0.6963328, 1, 0, 0, 1, 1,
0.05557289, 0.2875361, -0.9911104, 1, 0, 0, 1, 1,
0.05690749, 0.6560899, 0.8681651, 1, 0, 0, 1, 1,
0.06145654, -0.7986661, 3.024557, 1, 0, 0, 1, 1,
0.06270605, -0.8451876, 1.847687, 1, 0, 0, 1, 1,
0.06535581, -1.965538, 4.105302, 0, 0, 0, 1, 1,
0.06984729, -1.458606, 3.079362, 0, 0, 0, 1, 1,
0.07110532, 1.217837, -0.1768487, 0, 0, 0, 1, 1,
0.07376508, 0.2478914, 0.2283443, 0, 0, 0, 1, 1,
0.07513402, 1.465697, -1.234204, 0, 0, 0, 1, 1,
0.07652775, 0.8877656, 0.8491359, 0, 0, 0, 1, 1,
0.07859191, 0.582651, 0.9422876, 0, 0, 0, 1, 1,
0.08131572, 0.1552804, 1.015281, 1, 1, 1, 1, 1,
0.08590702, -1.515706, 3.365024, 1, 1, 1, 1, 1,
0.08777412, 0.7383847, -0.7196478, 1, 1, 1, 1, 1,
0.09233534, 1.777838, 1.115403, 1, 1, 1, 1, 1,
0.09361711, -0.8958151, 2.158896, 1, 1, 1, 1, 1,
0.09421976, 1.048402, -0.1260621, 1, 1, 1, 1, 1,
0.09745039, -0.6652172, 1.696234, 1, 1, 1, 1, 1,
0.09880225, 0.0150959, 1.131412, 1, 1, 1, 1, 1,
0.09941091, -0.5190838, 2.447934, 1, 1, 1, 1, 1,
0.09982042, 1.316388, 0.9844525, 1, 1, 1, 1, 1,
0.1030219, 0.441409, 1.014961, 1, 1, 1, 1, 1,
0.1038929, -1.418646, 2.967232, 1, 1, 1, 1, 1,
0.104682, 0.4103803, -0.01525024, 1, 1, 1, 1, 1,
0.1106916, -0.6999642, 4.224936, 1, 1, 1, 1, 1,
0.1110892, 0.3577679, 0.4098528, 1, 1, 1, 1, 1,
0.1124484, 0.398339, 0.426047, 0, 0, 1, 1, 1,
0.1125446, 0.3211489, 1.941353, 1, 0, 0, 1, 1,
0.1127793, -0.2299385, 1.796651, 1, 0, 0, 1, 1,
0.1165526, 0.02072913, 1.189888, 1, 0, 0, 1, 1,
0.1178297, -0.234811, 3.185532, 1, 0, 0, 1, 1,
0.1204908, 0.3921995, 1.260619, 1, 0, 0, 1, 1,
0.1204944, -1.784428, 4.288332, 0, 0, 0, 1, 1,
0.1232154, 1.0886, -1.461415, 0, 0, 0, 1, 1,
0.1234502, -0.7104532, 3.369486, 0, 0, 0, 1, 1,
0.1239826, -1.194776, 4.431501, 0, 0, 0, 1, 1,
0.1243833, 0.3477027, 2.94559, 0, 0, 0, 1, 1,
0.1322705, 1.416642, 1.218244, 0, 0, 0, 1, 1,
0.1339539, -2.814914, 4.67416, 0, 0, 0, 1, 1,
0.1344993, 2.0086, -0.5475178, 1, 1, 1, 1, 1,
0.1347794, 1.134548, 0.3754973, 1, 1, 1, 1, 1,
0.1353735, -0.4807155, 2.778859, 1, 1, 1, 1, 1,
0.136395, -1.198457, 3.296336, 1, 1, 1, 1, 1,
0.1379588, 0.6465124, 1.953398, 1, 1, 1, 1, 1,
0.1400508, -0.4156741, 3.782125, 1, 1, 1, 1, 1,
0.1410551, -0.1679201, 1.338658, 1, 1, 1, 1, 1,
0.1424315, -0.08064664, 3.478631, 1, 1, 1, 1, 1,
0.1449399, 0.1530833, 1.063885, 1, 1, 1, 1, 1,
0.1491138, -0.03731399, 2.181031, 1, 1, 1, 1, 1,
0.1502646, -2.397417, 4.457929, 1, 1, 1, 1, 1,
0.1545442, -1.170109, 5.098444, 1, 1, 1, 1, 1,
0.1553181, 0.5582001, -0.0897833, 1, 1, 1, 1, 1,
0.1620111, -1.450918, 2.642246, 1, 1, 1, 1, 1,
0.1623906, -0.8832492, 1.480454, 1, 1, 1, 1, 1,
0.1661994, -0.2989075, 1.665178, 0, 0, 1, 1, 1,
0.1666172, -0.1119847, 1.790992, 1, 0, 0, 1, 1,
0.1683762, 0.1699267, -1.103502, 1, 0, 0, 1, 1,
0.180447, 0.2808315, 0.4897454, 1, 0, 0, 1, 1,
0.181445, -0.6390373, 4.344872, 1, 0, 0, 1, 1,
0.181931, 0.8751315, 0.5043498, 1, 0, 0, 1, 1,
0.1820011, -0.5852399, 2.807682, 0, 0, 0, 1, 1,
0.1858507, 0.8274839, 2.376885, 0, 0, 0, 1, 1,
0.185922, 0.07144929, 1.192732, 0, 0, 0, 1, 1,
0.1907358, 0.1048264, -1.255895, 0, 0, 0, 1, 1,
0.1918605, 0.3074286, 1.287983, 0, 0, 0, 1, 1,
0.1970935, -0.3625936, 3.426189, 0, 0, 0, 1, 1,
0.2027734, 1.743004, 0.4220791, 0, 0, 0, 1, 1,
0.2108427, 1.035576, 1.551664, 1, 1, 1, 1, 1,
0.2135635, -0.1075849, 0.6579682, 1, 1, 1, 1, 1,
0.2141326, 1.379343, 0.1816644, 1, 1, 1, 1, 1,
0.218421, -0.5276247, 2.166929, 1, 1, 1, 1, 1,
0.2250684, -0.7416564, 5.793182, 1, 1, 1, 1, 1,
0.2278199, 0.4209978, 0.2369258, 1, 1, 1, 1, 1,
0.2298427, -1.163981, 0.7696591, 1, 1, 1, 1, 1,
0.2304166, 1.050989, 1.628473, 1, 1, 1, 1, 1,
0.2346457, 0.396665, -0.3417315, 1, 1, 1, 1, 1,
0.2347626, 0.7117241, 0.885137, 1, 1, 1, 1, 1,
0.2369743, -0.1794567, 1.773315, 1, 1, 1, 1, 1,
0.2374513, -0.2962002, 0.6306026, 1, 1, 1, 1, 1,
0.241312, 0.9052196, 0.8315898, 1, 1, 1, 1, 1,
0.2422277, -1.140257, 3.721204, 1, 1, 1, 1, 1,
0.2453877, 0.2297938, 1.544102, 1, 1, 1, 1, 1,
0.2458577, 0.5961464, 1.507736, 0, 0, 1, 1, 1,
0.2476347, 0.8474862, 1.592932, 1, 0, 0, 1, 1,
0.250334, 0.3460495, 0.04683942, 1, 0, 0, 1, 1,
0.2554796, 2.222496, -0.3043551, 1, 0, 0, 1, 1,
0.2563083, 1.882828, 0.5136376, 1, 0, 0, 1, 1,
0.260067, 1.287596, 1.443922, 1, 0, 0, 1, 1,
0.2605633, -0.5134525, 1.601901, 0, 0, 0, 1, 1,
0.2612225, 0.7918823, -1.210318, 0, 0, 0, 1, 1,
0.2614792, -0.6462178, 1.135846, 0, 0, 0, 1, 1,
0.2618807, -1.493541, 2.151161, 0, 0, 0, 1, 1,
0.2624646, -0.1539465, 2.695447, 0, 0, 0, 1, 1,
0.2639151, -0.4520604, 2.017126, 0, 0, 0, 1, 1,
0.2651016, 0.3015762, 0.06899216, 0, 0, 0, 1, 1,
0.2671274, -0.4871657, 2.98236, 1, 1, 1, 1, 1,
0.2709531, -0.2252679, 3.721519, 1, 1, 1, 1, 1,
0.2738989, 1.040474, 0.008345807, 1, 1, 1, 1, 1,
0.2774315, -0.6139081, 3.408639, 1, 1, 1, 1, 1,
0.2774839, -0.4074389, 4.126239, 1, 1, 1, 1, 1,
0.2778306, 0.4090925, 0.4305369, 1, 1, 1, 1, 1,
0.2790609, 0.2165575, -0.3415508, 1, 1, 1, 1, 1,
0.2795223, -0.8395508, 2.520225, 1, 1, 1, 1, 1,
0.2796723, -0.835089, 4.123977, 1, 1, 1, 1, 1,
0.2806594, 0.3312431, 0.2204757, 1, 1, 1, 1, 1,
0.2861995, 2.367759, -0.367331, 1, 1, 1, 1, 1,
0.2888564, -0.8452255, 1.622666, 1, 1, 1, 1, 1,
0.2902816, 0.3639091, 0.2058153, 1, 1, 1, 1, 1,
0.290868, -0.4458954, 4.106744, 1, 1, 1, 1, 1,
0.2917438, -0.762389, 1.150958, 1, 1, 1, 1, 1,
0.2922248, -0.9689937, 2.36341, 0, 0, 1, 1, 1,
0.2973633, 1.331805, 0.1815233, 1, 0, 0, 1, 1,
0.2992438, -0.8232405, 2.668184, 1, 0, 0, 1, 1,
0.2996374, -0.727812, 2.259722, 1, 0, 0, 1, 1,
0.3004974, -0.1601697, 0.4429435, 1, 0, 0, 1, 1,
0.3010558, 0.07057627, 1.70707, 1, 0, 0, 1, 1,
0.3020533, -0.2314918, 2.904773, 0, 0, 0, 1, 1,
0.3033539, -0.487011, 0.5824774, 0, 0, 0, 1, 1,
0.3034877, 1.023263, 1.148169, 0, 0, 0, 1, 1,
0.3059552, 0.1016349, 0.6821553, 0, 0, 0, 1, 1,
0.3071574, 0.7878748, -0.3564244, 0, 0, 0, 1, 1,
0.3110659, 2.001765, 0.7015187, 0, 0, 0, 1, 1,
0.3152224, -1.209494, 3.017209, 0, 0, 0, 1, 1,
0.3255017, -1.044614, 3.692876, 1, 1, 1, 1, 1,
0.3284251, -0.09662881, 2.098567, 1, 1, 1, 1, 1,
0.3329015, 0.6319314, 0.8424137, 1, 1, 1, 1, 1,
0.3414659, 0.7271175, 0.892788, 1, 1, 1, 1, 1,
0.3440293, -1.791781, 3.490088, 1, 1, 1, 1, 1,
0.3458512, -1.030716, 1.771634, 1, 1, 1, 1, 1,
0.3479562, 0.7858142, 0.008003701, 1, 1, 1, 1, 1,
0.3524788, 0.1916967, -0.5807937, 1, 1, 1, 1, 1,
0.3652337, 0.3146813, 0.7098528, 1, 1, 1, 1, 1,
0.3677081, 1.437003, 0.0541317, 1, 1, 1, 1, 1,
0.377378, 1.074964, 1.869966, 1, 1, 1, 1, 1,
0.3808094, 2.424574, 0.5016329, 1, 1, 1, 1, 1,
0.3810824, 1.112151, -1.331693, 1, 1, 1, 1, 1,
0.381277, -0.516488, 3.627137, 1, 1, 1, 1, 1,
0.3877283, -0.2698679, 2.142444, 1, 1, 1, 1, 1,
0.3939812, -0.8034592, 2.195256, 0, 0, 1, 1, 1,
0.3951043, -1.438687, 2.034268, 1, 0, 0, 1, 1,
0.3967114, -2.268568, 3.83933, 1, 0, 0, 1, 1,
0.4001218, 0.3749112, 0.147797, 1, 0, 0, 1, 1,
0.4047494, -0.1357282, 1.361207, 1, 0, 0, 1, 1,
0.4054278, 0.06218204, -0.1391328, 1, 0, 0, 1, 1,
0.4058552, 0.6870131, 1.526196, 0, 0, 0, 1, 1,
0.4131442, -0.5482149, 3.606883, 0, 0, 0, 1, 1,
0.4154743, 1.022527, 0.857447, 0, 0, 0, 1, 1,
0.4169151, 0.1965779, 1.740008, 0, 0, 0, 1, 1,
0.4199722, -0.6295195, 3.095483, 0, 0, 0, 1, 1,
0.4240004, 0.1062612, 1.968876, 0, 0, 0, 1, 1,
0.438241, -0.2404355, 3.621734, 0, 0, 0, 1, 1,
0.4405923, 0.2175153, 2.291623, 1, 1, 1, 1, 1,
0.4416027, -1.151194, 2.070965, 1, 1, 1, 1, 1,
0.4421226, -1.653884, 3.752257, 1, 1, 1, 1, 1,
0.4452053, 2.230478, 1.057469, 1, 1, 1, 1, 1,
0.4498102, 0.7101749, 0.6785802, 1, 1, 1, 1, 1,
0.4527767, -0.5063362, 2.212703, 1, 1, 1, 1, 1,
0.4566402, 0.7084357, -0.8869177, 1, 1, 1, 1, 1,
0.4581468, -0.5893208, -0.07892597, 1, 1, 1, 1, 1,
0.4591059, 1.694511, -0.6468632, 1, 1, 1, 1, 1,
0.4631549, 1.05393, 0.6768948, 1, 1, 1, 1, 1,
0.4648536, -1.123979, 4.227687, 1, 1, 1, 1, 1,
0.4731638, -0.4925246, 4.100159, 1, 1, 1, 1, 1,
0.4863071, -1.496316, 3.809018, 1, 1, 1, 1, 1,
0.4934718, 0.3977106, -0.7010814, 1, 1, 1, 1, 1,
0.4939471, 0.1897276, 0.7873939, 1, 1, 1, 1, 1,
0.4957283, 0.3648959, 1.505532, 0, 0, 1, 1, 1,
0.495753, 0.4736129, -0.7479351, 1, 0, 0, 1, 1,
0.496363, -0.214584, 2.30125, 1, 0, 0, 1, 1,
0.4984642, -0.420063, 3.623872, 1, 0, 0, 1, 1,
0.5048057, 0.3253165, 0.8191, 1, 0, 0, 1, 1,
0.5093808, -0.355453, 0.1089496, 1, 0, 0, 1, 1,
0.5098208, -0.7542876, 2.247156, 0, 0, 0, 1, 1,
0.51188, 1.859938, 0.5024723, 0, 0, 0, 1, 1,
0.5128584, 1.550645, -0.2812473, 0, 0, 0, 1, 1,
0.5149789, 0.6511199, -1.449403, 0, 0, 0, 1, 1,
0.5192655, -0.7552226, 1.058966, 0, 0, 0, 1, 1,
0.521349, -0.06957856, 2.796572, 0, 0, 0, 1, 1,
0.5236133, 1.540978, 0.2049233, 0, 0, 0, 1, 1,
0.5245348, 1.32161, -0.4213471, 1, 1, 1, 1, 1,
0.524993, -1.289403, 3.414442, 1, 1, 1, 1, 1,
0.5255743, 0.7724835, 2.056493, 1, 1, 1, 1, 1,
0.526567, 0.2408622, 1.177241, 1, 1, 1, 1, 1,
0.5285751, -0.2266717, 2.871405, 1, 1, 1, 1, 1,
0.5285897, 0.9205253, -1.822287, 1, 1, 1, 1, 1,
0.5373991, -0.8771615, 2.797288, 1, 1, 1, 1, 1,
0.5374936, 1.940693, 0.5056902, 1, 1, 1, 1, 1,
0.537774, -0.2263272, 1.631528, 1, 1, 1, 1, 1,
0.5478923, -1.148577, 1.540722, 1, 1, 1, 1, 1,
0.5521178, -1.691946, 1.491568, 1, 1, 1, 1, 1,
0.5554378, -1.378208, 2.819176, 1, 1, 1, 1, 1,
0.5576294, -0.4152554, 0.002423708, 1, 1, 1, 1, 1,
0.5599545, -0.8947172, 2.153617, 1, 1, 1, 1, 1,
0.5617469, -0.6078573, 2.788267, 1, 1, 1, 1, 1,
0.5659862, -0.1322359, 2.118875, 0, 0, 1, 1, 1,
0.5663005, 0.8188772, 0.7625123, 1, 0, 0, 1, 1,
0.5674061, -2.060939, 5.001502, 1, 0, 0, 1, 1,
0.5750533, 0.5633014, -0.2327329, 1, 0, 0, 1, 1,
0.5781224, 0.5923299, 0.2100014, 1, 0, 0, 1, 1,
0.5841798, -0.004677527, 1.865906, 1, 0, 0, 1, 1,
0.5856473, -0.8200132, 2.873733, 0, 0, 0, 1, 1,
0.5889179, 0.3329015, -0.3348907, 0, 0, 0, 1, 1,
0.5896282, -1.152045, 3.499225, 0, 0, 0, 1, 1,
0.5950803, -0.06332751, 0.7843282, 0, 0, 0, 1, 1,
0.5953317, 0.7058001, 0.8805358, 0, 0, 0, 1, 1,
0.6015412, 1.501874, -1.144326, 0, 0, 0, 1, 1,
0.6072056, 0.7170671, 1.609794, 0, 0, 0, 1, 1,
0.6087738, 0.1606273, 1.030314, 1, 1, 1, 1, 1,
0.6169591, 0.9436431, -0.517635, 1, 1, 1, 1, 1,
0.6171597, 0.1637592, 3.229167, 1, 1, 1, 1, 1,
0.6172968, -0.9887085, 3.966397, 1, 1, 1, 1, 1,
0.6186887, 0.5429571, 1.720283, 1, 1, 1, 1, 1,
0.6220219, -0.6413457, 2.49999, 1, 1, 1, 1, 1,
0.6417264, 0.6713163, 0.5914806, 1, 1, 1, 1, 1,
0.6534882, 0.3879983, 1.955869, 1, 1, 1, 1, 1,
0.6547542, -1.902811, 3.328765, 1, 1, 1, 1, 1,
0.6606882, 0.2347817, 2.943236, 1, 1, 1, 1, 1,
0.6628336, -0.346729, 3.391499, 1, 1, 1, 1, 1,
0.6683906, 1.008528, 0.05272315, 1, 1, 1, 1, 1,
0.6728207, 0.6432632, -0.3687567, 1, 1, 1, 1, 1,
0.6735582, 1.287948, 1.299525, 1, 1, 1, 1, 1,
0.6736106, -1.486597, 3.035347, 1, 1, 1, 1, 1,
0.6762725, -2.924645, 4.577542, 0, 0, 1, 1, 1,
0.677063, 1.026533, 0.6066684, 1, 0, 0, 1, 1,
0.6786895, 0.2641511, 1.272642, 1, 0, 0, 1, 1,
0.6794282, 0.8341113, 1.431401, 1, 0, 0, 1, 1,
0.6795701, -0.2276823, 1.697452, 1, 0, 0, 1, 1,
0.6860319, 2.00122, -0.02679476, 1, 0, 0, 1, 1,
0.6881249, 0.07192586, 1.524753, 0, 0, 0, 1, 1,
0.6885087, -0.9719725, 2.454086, 0, 0, 0, 1, 1,
0.6933801, 2.177588, 1.362202, 0, 0, 0, 1, 1,
0.6943819, 0.7530081, 1.102426, 0, 0, 0, 1, 1,
0.6979114, -1.478605, 3.0679, 0, 0, 0, 1, 1,
0.702716, 1.285675, 1.861991, 0, 0, 0, 1, 1,
0.7029678, 0.7292786, 0.8531963, 0, 0, 0, 1, 1,
0.7076688, 0.5192357, 1.782492, 1, 1, 1, 1, 1,
0.7154953, 0.9468626, 2.294811, 1, 1, 1, 1, 1,
0.7175741, -0.4300414, 2.626264, 1, 1, 1, 1, 1,
0.7200969, 0.9280783, 0.3811385, 1, 1, 1, 1, 1,
0.724744, 0.1717583, 3.330235, 1, 1, 1, 1, 1,
0.7313898, 0.8152979, -0.1923761, 1, 1, 1, 1, 1,
0.7316659, 1.176232, 0.3669507, 1, 1, 1, 1, 1,
0.7359322, -0.02064178, 1.168698, 1, 1, 1, 1, 1,
0.7413018, -0.9186337, 2.267552, 1, 1, 1, 1, 1,
0.7430329, -2.281389, 0.9835451, 1, 1, 1, 1, 1,
0.7462336, -1.092262, 2.418543, 1, 1, 1, 1, 1,
0.7471289, -1.072025, 2.413621, 1, 1, 1, 1, 1,
0.7494491, -1.778032, 1.193637, 1, 1, 1, 1, 1,
0.7526535, 0.7810872, 1.666531, 1, 1, 1, 1, 1,
0.7574583, 1.812767, 0.8230732, 1, 1, 1, 1, 1,
0.7578488, -0.03493395, 2.22993, 0, 0, 1, 1, 1,
0.7617673, -1.078951, 2.214466, 1, 0, 0, 1, 1,
0.7630015, 0.5014653, -1.151204, 1, 0, 0, 1, 1,
0.7632166, 0.1619709, 1.836795, 1, 0, 0, 1, 1,
0.7664129, 0.3464543, 1.1953, 1, 0, 0, 1, 1,
0.7705908, 1.186084, 0.9848775, 1, 0, 0, 1, 1,
0.7719918, 0.8514247, -0.605378, 0, 0, 0, 1, 1,
0.7801188, -0.01100144, 2.64166, 0, 0, 0, 1, 1,
0.8004422, 0.06738333, 1.294396, 0, 0, 0, 1, 1,
0.8055668, -0.01769761, 0.3216318, 0, 0, 0, 1, 1,
0.8070854, -0.6782183, 2.04598, 0, 0, 0, 1, 1,
0.808638, 0.2286689, 1.527225, 0, 0, 0, 1, 1,
0.8139803, 1.363894, -1.541577, 0, 0, 0, 1, 1,
0.8141494, 0.3967164, 1.750396, 1, 1, 1, 1, 1,
0.8168221, 0.04746982, 2.527807, 1, 1, 1, 1, 1,
0.8182278, -0.275562, 2.756692, 1, 1, 1, 1, 1,
0.8183365, -0.9653284, 1.779213, 1, 1, 1, 1, 1,
0.8256376, 0.1574924, 0.1875823, 1, 1, 1, 1, 1,
0.8288477, 0.8268747, 0.3475933, 1, 1, 1, 1, 1,
0.8329896, 0.33108, 0.8318832, 1, 1, 1, 1, 1,
0.8373575, -1.112212, 2.423155, 1, 1, 1, 1, 1,
0.8631396, 1.037388, 0.6062953, 1, 1, 1, 1, 1,
0.8643278, -0.8460745, 1.645296, 1, 1, 1, 1, 1,
0.8651211, 0.4049097, 0.5115517, 1, 1, 1, 1, 1,
0.865476, -0.7669796, 1.44118, 1, 1, 1, 1, 1,
0.8674792, 1.498408, -0.1266484, 1, 1, 1, 1, 1,
0.8704936, 1.73337, -0.5787518, 1, 1, 1, 1, 1,
0.8707681, 0.3004101, 1.361493, 1, 1, 1, 1, 1,
0.877652, 0.1863927, 1.35775, 0, 0, 1, 1, 1,
0.8798692, -1.233749, 3.183141, 1, 0, 0, 1, 1,
0.8813933, 1.345255, 0.4418474, 1, 0, 0, 1, 1,
0.8830974, 0.5891373, 1.799471, 1, 0, 0, 1, 1,
0.883809, 0.3271057, 2.229679, 1, 0, 0, 1, 1,
0.8992355, -1.04138, 0.05592919, 1, 0, 0, 1, 1,
0.8996675, 0.1294352, 2.287072, 0, 0, 0, 1, 1,
0.899694, -1.39511, 2.652042, 0, 0, 0, 1, 1,
0.9020064, -0.1040464, 2.443294, 0, 0, 0, 1, 1,
0.905241, 0.2722127, 0.9832283, 0, 0, 0, 1, 1,
0.9074324, -0.5008667, 4.089978, 0, 0, 0, 1, 1,
0.9199753, -1.899925, 3.167318, 0, 0, 0, 1, 1,
0.9212241, -0.2808516, 1.483479, 0, 0, 0, 1, 1,
0.9255884, 0.4821856, 1.440353, 1, 1, 1, 1, 1,
0.9287342, 0.05972084, 0.6625168, 1, 1, 1, 1, 1,
0.934013, 1.756606, 1.959885, 1, 1, 1, 1, 1,
0.9366887, 1.226186, 0.8774711, 1, 1, 1, 1, 1,
0.9375089, -2.212506, 2.234087, 1, 1, 1, 1, 1,
0.9383868, 0.1682453, 1.139647, 1, 1, 1, 1, 1,
0.9399168, -1.093421, 1.378442, 1, 1, 1, 1, 1,
0.9406404, -0.7241601, 0.7591552, 1, 1, 1, 1, 1,
0.9455391, 0.5210761, 2.051923, 1, 1, 1, 1, 1,
0.9460689, 1.578074, 0.9699542, 1, 1, 1, 1, 1,
0.9485162, -0.9914694, 2.633911, 1, 1, 1, 1, 1,
0.9540329, 0.02833016, 1.881082, 1, 1, 1, 1, 1,
0.9569954, -0.3254838, 3.319111, 1, 1, 1, 1, 1,
0.9598871, -0.1095574, 0.4401798, 1, 1, 1, 1, 1,
0.9619362, -0.7872336, 3.384745, 1, 1, 1, 1, 1,
0.9722361, 0.3388014, 2.07008, 0, 0, 1, 1, 1,
0.9739093, -0.7103491, 0.8750104, 1, 0, 0, 1, 1,
0.9771865, 0.3323613, 1.577983, 1, 0, 0, 1, 1,
0.9820109, -1.596447, 1.635367, 1, 0, 0, 1, 1,
0.985505, -0.9297879, 1.823914, 1, 0, 0, 1, 1,
0.9866921, 1.556275, 1.755535, 1, 0, 0, 1, 1,
1.001479, -0.3053596, 1.389101, 0, 0, 0, 1, 1,
1.010577, 3.262356, -0.02394947, 0, 0, 0, 1, 1,
1.014406, 0.3340527, 1.884562, 0, 0, 0, 1, 1,
1.022776, 0.2089306, 1.96301, 0, 0, 0, 1, 1,
1.041914, -0.5842625, 0.7509215, 0, 0, 0, 1, 1,
1.042415, 0.9709018, 0.5631601, 0, 0, 0, 1, 1,
1.042665, -1.018712, 0.1635764, 0, 0, 0, 1, 1,
1.045063, 0.4445803, 0.6881751, 1, 1, 1, 1, 1,
1.052718, 0.9459774, 0.5186571, 1, 1, 1, 1, 1,
1.058448, 0.2151725, 1.043236, 1, 1, 1, 1, 1,
1.058953, -0.04713753, 1.58024, 1, 1, 1, 1, 1,
1.06065, -0.5304508, 0.6407026, 1, 1, 1, 1, 1,
1.065058, -0.7379792, 2.096147, 1, 1, 1, 1, 1,
1.071238, -0.7032387, 1.791598, 1, 1, 1, 1, 1,
1.072116, -0.6492785, 1.193677, 1, 1, 1, 1, 1,
1.073022, 0.7500046, 3.791437, 1, 1, 1, 1, 1,
1.092082, 1.09619, 0.09779788, 1, 1, 1, 1, 1,
1.101072, -1.450969, 2.847631, 1, 1, 1, 1, 1,
1.10143, 0.7858498, 1.55961, 1, 1, 1, 1, 1,
1.102481, 0.8073013, 0.8903726, 1, 1, 1, 1, 1,
1.106924, -0.7381139, 4.332362, 1, 1, 1, 1, 1,
1.107483, 0.3917052, 0.6300434, 1, 1, 1, 1, 1,
1.110031, -0.2545153, 1.724206, 0, 0, 1, 1, 1,
1.111837, -0.04421926, -0.6013345, 1, 0, 0, 1, 1,
1.129522, 0.6081161, 1.751623, 1, 0, 0, 1, 1,
1.136802, -0.4263828, 3.404226, 1, 0, 0, 1, 1,
1.140672, 0.3708957, 1.645226, 1, 0, 0, 1, 1,
1.149052, 0.9143429, 0.490512, 1, 0, 0, 1, 1,
1.154143, 0.1340846, 1.524157, 0, 0, 0, 1, 1,
1.166868, 1.083888, -0.7400587, 0, 0, 0, 1, 1,
1.16831, 1.026073, 0.6712597, 0, 0, 0, 1, 1,
1.168382, 0.7193527, 0.2068438, 0, 0, 0, 1, 1,
1.169448, -0.03224888, 0.08994377, 0, 0, 0, 1, 1,
1.169614, 1.726686, 0.2837061, 0, 0, 0, 1, 1,
1.171808, 1.919742, 0.7717395, 0, 0, 0, 1, 1,
1.174633, 1.056169, 0.1380699, 1, 1, 1, 1, 1,
1.176869, -0.8119588, 2.620769, 1, 1, 1, 1, 1,
1.18137, 0.3407845, 2.995446, 1, 1, 1, 1, 1,
1.18229, 0.5192417, 2.267104, 1, 1, 1, 1, 1,
1.18407, 0.3489792, 2.162324, 1, 1, 1, 1, 1,
1.187396, 0.7335729, 0.6693184, 1, 1, 1, 1, 1,
1.18785, -0.2778221, 1.562724, 1, 1, 1, 1, 1,
1.188875, -0.1555219, 3.432261, 1, 1, 1, 1, 1,
1.189808, 1.504895, 1.257411, 1, 1, 1, 1, 1,
1.215682, -0.7831048, 1.459715, 1, 1, 1, 1, 1,
1.215835, -1.994419, 2.225504, 1, 1, 1, 1, 1,
1.228977, -0.08144631, 2.211022, 1, 1, 1, 1, 1,
1.22992, 0.5037422, 2.133224, 1, 1, 1, 1, 1,
1.230628, -2.394424, 3.028469, 1, 1, 1, 1, 1,
1.238551, -0.5269988, 1.736314, 1, 1, 1, 1, 1,
1.241484, -0.07870662, 2.125782, 0, 0, 1, 1, 1,
1.246523, -0.5463406, 2.744643, 1, 0, 0, 1, 1,
1.250288, -0.8086681, 2.818628, 1, 0, 0, 1, 1,
1.265302, -0.01138709, 0.4572945, 1, 0, 0, 1, 1,
1.267919, 2.247347, 1.768847, 1, 0, 0, 1, 1,
1.268732, 0.5870418, 1.183478, 1, 0, 0, 1, 1,
1.26936, 1.368923, 0.7291006, 0, 0, 0, 1, 1,
1.271453, 0.2944518, 0.8958939, 0, 0, 0, 1, 1,
1.273086, 0.03503441, 2.859915, 0, 0, 0, 1, 1,
1.282575, -0.4685147, 0.01255154, 0, 0, 0, 1, 1,
1.284972, 0.9430202, 0.3149609, 0, 0, 0, 1, 1,
1.299009, -1.551378, 4.629089, 0, 0, 0, 1, 1,
1.301549, -0.0145647, 0.6830354, 0, 0, 0, 1, 1,
1.302313, -0.9563845, 1.207317, 1, 1, 1, 1, 1,
1.306535, -0.4509402, 1.698392, 1, 1, 1, 1, 1,
1.31532, -1.239792, 1.786334, 1, 1, 1, 1, 1,
1.317466, -1.22001, 2.76473, 1, 1, 1, 1, 1,
1.317486, 1.289392, 0.3578487, 1, 1, 1, 1, 1,
1.318487, 1.157935, 0.7074713, 1, 1, 1, 1, 1,
1.321049, 0.816749, 0.8611426, 1, 1, 1, 1, 1,
1.322499, 0.20191, 2.639578, 1, 1, 1, 1, 1,
1.322962, 2.257892, 2.001173, 1, 1, 1, 1, 1,
1.339129, -0.2076377, 1.05891, 1, 1, 1, 1, 1,
1.33978, -0.9102781, 0.05182755, 1, 1, 1, 1, 1,
1.340384, 0.747448, 2.20743, 1, 1, 1, 1, 1,
1.347003, 0.917614, 0.6080959, 1, 1, 1, 1, 1,
1.360216, 0.3377557, 0.9294676, 1, 1, 1, 1, 1,
1.362441, -0.01286433, 1.61014, 1, 1, 1, 1, 1,
1.371349, -1.333121, 1.431189, 0, 0, 1, 1, 1,
1.372319, -0.2012362, 1.43488, 1, 0, 0, 1, 1,
1.379794, 0.3327419, 1.604682, 1, 0, 0, 1, 1,
1.384671, 0.3545643, 1.333441, 1, 0, 0, 1, 1,
1.401305, -2.013794, 0.5683637, 1, 0, 0, 1, 1,
1.406714, 0.6518238, 2.035208, 1, 0, 0, 1, 1,
1.418428, 2.160957, 1.04486, 0, 0, 0, 1, 1,
1.436988, -0.0797445, 2.565174, 0, 0, 0, 1, 1,
1.453702, 0.5434986, 0.9530863, 0, 0, 0, 1, 1,
1.472379, 0.1069295, 2.568552, 0, 0, 0, 1, 1,
1.494122, -0.356172, 1.51999, 0, 0, 0, 1, 1,
1.502648, -0.3589976, -0.5169277, 0, 0, 0, 1, 1,
1.51071, -2.125533, 3.06748, 0, 0, 0, 1, 1,
1.523309, 1.147125, 2.101623, 1, 1, 1, 1, 1,
1.535469, -0.5790374, 1.487742, 1, 1, 1, 1, 1,
1.538268, -1.489912, 3.306192, 1, 1, 1, 1, 1,
1.540324, 0.1305295, 1.166144, 1, 1, 1, 1, 1,
1.543932, 0.03819099, 1.242373, 1, 1, 1, 1, 1,
1.556984, -0.08813462, 1.989174, 1, 1, 1, 1, 1,
1.565332, 1.859707, 0.6822572, 1, 1, 1, 1, 1,
1.577813, -0.258175, 1.163011, 1, 1, 1, 1, 1,
1.579014, 1.409315, 1.069113, 1, 1, 1, 1, 1,
1.593485, 0.09634779, 1.423452, 1, 1, 1, 1, 1,
1.598857, -1.280456, 2.779963, 1, 1, 1, 1, 1,
1.602568, 0.4517706, 1.47085, 1, 1, 1, 1, 1,
1.606836, 0.8869581, 2.47715, 1, 1, 1, 1, 1,
1.621446, 1.953939, -1.24498, 1, 1, 1, 1, 1,
1.622697, 1.032275, 0.8779918, 1, 1, 1, 1, 1,
1.622811, 0.8993711, 0.4973344, 0, 0, 1, 1, 1,
1.623711, 0.6567609, 2.705327, 1, 0, 0, 1, 1,
1.638481, 0.4780553, 0.481648, 1, 0, 0, 1, 1,
1.644919, 0.137086, 2.16429, 1, 0, 0, 1, 1,
1.647974, -1.721614, 1.357651, 1, 0, 0, 1, 1,
1.651206, -0.1560326, 2.267146, 1, 0, 0, 1, 1,
1.666631, 0.02706918, 1.623073, 0, 0, 0, 1, 1,
1.677417, 0.1082626, 1.298008, 0, 0, 0, 1, 1,
1.687185, 1.464582, 0.6830546, 0, 0, 0, 1, 1,
1.703528, 1.514236, 1.291957, 0, 0, 0, 1, 1,
1.71635, 0.4785753, 1.603792, 0, 0, 0, 1, 1,
1.761537, 0.7079294, 0.8540671, 0, 0, 0, 1, 1,
1.775555, -0.7998708, 3.272467, 0, 0, 0, 1, 1,
1.782592, -1.039379, 1.07385, 1, 1, 1, 1, 1,
1.794438, 0.8816565, 0.8534247, 1, 1, 1, 1, 1,
1.804095, -0.2802542, 3.146487, 1, 1, 1, 1, 1,
1.817543, 0.5543641, 1.550951, 1, 1, 1, 1, 1,
1.819147, -1.752082, 2.720824, 1, 1, 1, 1, 1,
1.820636, -0.402422, 0.7769966, 1, 1, 1, 1, 1,
1.821298, 0.7511632, 2.438837, 1, 1, 1, 1, 1,
1.868847, -0.3882041, 0.7526079, 1, 1, 1, 1, 1,
1.885262, 0.6527714, 1.824623, 1, 1, 1, 1, 1,
1.891697, -0.6398112, 1.580005, 1, 1, 1, 1, 1,
1.896219, 0.7233694, 0.8053354, 1, 1, 1, 1, 1,
1.927162, -0.795369, 2.000608, 1, 1, 1, 1, 1,
1.927951, 1.097282, 1.287017, 1, 1, 1, 1, 1,
1.956461, -0.5257963, 1.535884, 1, 1, 1, 1, 1,
1.959398, 0.4609843, 3.618142, 1, 1, 1, 1, 1,
1.995586, -0.2398489, 1.559347, 0, 0, 1, 1, 1,
2.057567, -0.9460754, 2.208929, 1, 0, 0, 1, 1,
2.069183, -0.4413491, 2.138562, 1, 0, 0, 1, 1,
2.075109, -1.026899, -0.2137783, 1, 0, 0, 1, 1,
2.089844, -0.06045604, -0.1251429, 1, 0, 0, 1, 1,
2.111309, 0.8234826, 1.832464, 1, 0, 0, 1, 1,
2.113552, 0.7834587, 1.522894, 0, 0, 0, 1, 1,
2.253416, 1.389808, 0.04527731, 0, 0, 0, 1, 1,
2.255041, -2.19868, 2.482344, 0, 0, 0, 1, 1,
2.25544, 0.5408736, 0.4109464, 0, 0, 0, 1, 1,
2.295968, -0.5105793, 1.506064, 0, 0, 0, 1, 1,
2.309318, 0.4437329, -0.5337584, 0, 0, 0, 1, 1,
2.344383, -1.448167, 1.089906, 0, 0, 0, 1, 1,
2.411739, 1.196699, 1.264837, 1, 1, 1, 1, 1,
2.415053, 0.504687, 2.392035, 1, 1, 1, 1, 1,
2.523976, -0.310606, 3.130321, 1, 1, 1, 1, 1,
2.742613, 1.129201, 0.106319, 1, 1, 1, 1, 1,
2.789476, -0.5232974, 0.5771691, 1, 1, 1, 1, 1,
3.024832, 1.483873, 1.547883, 1, 1, 1, 1, 1,
3.155443, -1.570025, 3.344029, 1, 1, 1, 1, 1
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
var radius = 9.677633;
var distance = 33.99228;
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
mvMatrix.translate( -0.04489732, -0.1878887, -0.190712 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.99228);
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
