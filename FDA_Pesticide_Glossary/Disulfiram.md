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
-2.861949, 0.6870321, -0.04427499, 1, 0, 0, 1,
-2.826663, -0.1811311, -0.5116265, 1, 0.007843138, 0, 1,
-2.645609, -0.3129649, -1.692916, 1, 0.01176471, 0, 1,
-2.592374, -1.753554, -2.876823, 1, 0.01960784, 0, 1,
-2.57742, -2.229038, -1.45797, 1, 0.02352941, 0, 1,
-2.572568, -0.2696619, -2.669127, 1, 0.03137255, 0, 1,
-2.469909, 1.019635, -2.056662, 1, 0.03529412, 0, 1,
-2.429433, 0.5227503, -2.491718, 1, 0.04313726, 0, 1,
-2.414407, 1.288261, -3.293236, 1, 0.04705882, 0, 1,
-2.30513, -1.968356, -2.92907, 1, 0.05490196, 0, 1,
-2.200775, -1.47482, -2.59769, 1, 0.05882353, 0, 1,
-2.187391, -1.462049, -3.025718, 1, 0.06666667, 0, 1,
-2.168639, -0.308152, -2.593139, 1, 0.07058824, 0, 1,
-2.148345, 0.1116251, -1.39076, 1, 0.07843138, 0, 1,
-2.133779, 0.3634954, -2.205918, 1, 0.08235294, 0, 1,
-2.076802, 0.9290959, -1.216163, 1, 0.09019608, 0, 1,
-2.028505, 0.1834781, -0.03439688, 1, 0.09411765, 0, 1,
-2.017581, -0.4891432, -2.004255, 1, 0.1019608, 0, 1,
-2.015086, -0.7765127, -2.750153, 1, 0.1098039, 0, 1,
-1.989881, -0.1486217, -1.835101, 1, 0.1137255, 0, 1,
-1.968366, 0.5619509, 1.027815, 1, 0.1215686, 0, 1,
-1.962389, 1.086204, -2.209905, 1, 0.1254902, 0, 1,
-1.940193, 2.677149, -1.230809, 1, 0.1333333, 0, 1,
-1.93339, 0.05094001, -1.937332, 1, 0.1372549, 0, 1,
-1.92161, -0.9292387, -4.189614, 1, 0.145098, 0, 1,
-1.917829, -1.33865, -1.047604, 1, 0.1490196, 0, 1,
-1.891016, 0.484087, -0.6212258, 1, 0.1568628, 0, 1,
-1.849079, 1.438513, -0.640217, 1, 0.1607843, 0, 1,
-1.827384, -0.7123787, -2.163898, 1, 0.1686275, 0, 1,
-1.809095, 0.611919, 0.3733275, 1, 0.172549, 0, 1,
-1.80307, 0.2224983, -0.6132966, 1, 0.1803922, 0, 1,
-1.790515, 0.2226177, -1.015505, 1, 0.1843137, 0, 1,
-1.786514, -0.1220203, -2.27121, 1, 0.1921569, 0, 1,
-1.782553, 1.151628, 0.5870085, 1, 0.1960784, 0, 1,
-1.763575, -2.530298, -3.436397, 1, 0.2039216, 0, 1,
-1.762718, 1.719443, -1.292962, 1, 0.2117647, 0, 1,
-1.686286, -0.6312203, -2.197513, 1, 0.2156863, 0, 1,
-1.661732, -0.1588304, -3.852571, 1, 0.2235294, 0, 1,
-1.627952, 0.4542659, -0.6327804, 1, 0.227451, 0, 1,
-1.617119, 0.5893695, -0.5491598, 1, 0.2352941, 0, 1,
-1.599923, 0.6524427, -1.416399, 1, 0.2392157, 0, 1,
-1.584249, -1.717393, -0.5256067, 1, 0.2470588, 0, 1,
-1.579335, -0.7045951, -0.8622256, 1, 0.2509804, 0, 1,
-1.57626, -0.6307997, -1.459108, 1, 0.2588235, 0, 1,
-1.55235, -1.150292, -1.615431, 1, 0.2627451, 0, 1,
-1.535033, 0.6125681, 1.303792, 1, 0.2705882, 0, 1,
-1.531056, 1.587481, -1.228993, 1, 0.2745098, 0, 1,
-1.513358, 0.9514772, -2.427162, 1, 0.282353, 0, 1,
-1.508645, 0.09108528, 0.9943531, 1, 0.2862745, 0, 1,
-1.504904, 1.826526, -1.352351, 1, 0.2941177, 0, 1,
-1.501528, -1.599597, -1.729747, 1, 0.3019608, 0, 1,
-1.482422, -0.3329276, -0.6327483, 1, 0.3058824, 0, 1,
-1.467954, -0.7561972, -2.314209, 1, 0.3137255, 0, 1,
-1.463827, 2.142458, 0.3362864, 1, 0.3176471, 0, 1,
-1.458232, -0.9355142, -2.25386, 1, 0.3254902, 0, 1,
-1.43652, -1.663886, -1.541514, 1, 0.3294118, 0, 1,
-1.431275, -1.177565, -2.109046, 1, 0.3372549, 0, 1,
-1.424476, -1.631644, -2.624369, 1, 0.3411765, 0, 1,
-1.424228, -0.3646123, -0.9179854, 1, 0.3490196, 0, 1,
-1.418687, 0.7975175, -0.7937777, 1, 0.3529412, 0, 1,
-1.41404, 0.1037905, -1.087896, 1, 0.3607843, 0, 1,
-1.409363, -1.601656, -2.300255, 1, 0.3647059, 0, 1,
-1.408425, -0.51379, -2.207472, 1, 0.372549, 0, 1,
-1.402765, -0.7694409, -1.551602, 1, 0.3764706, 0, 1,
-1.392009, 0.4509914, -2.352398, 1, 0.3843137, 0, 1,
-1.384717, 1.646912, -0.5100863, 1, 0.3882353, 0, 1,
-1.368295, 0.9698377, 0.2553732, 1, 0.3960784, 0, 1,
-1.364991, 0.0544099, -0.5782305, 1, 0.4039216, 0, 1,
-1.360123, 1.172972, -0.3049008, 1, 0.4078431, 0, 1,
-1.355829, 0.9738311, 0.8367995, 1, 0.4156863, 0, 1,
-1.353306, 1.440482, -0.9183141, 1, 0.4196078, 0, 1,
-1.335206, 0.1483279, -2.165582, 1, 0.427451, 0, 1,
-1.329043, -0.05464688, -2.28878, 1, 0.4313726, 0, 1,
-1.315265, -0.02972276, -1.070469, 1, 0.4392157, 0, 1,
-1.307203, -1.732715, -3.199714, 1, 0.4431373, 0, 1,
-1.305723, 0.1054495, 0.1385576, 1, 0.4509804, 0, 1,
-1.302432, -0.6658692, -2.371269, 1, 0.454902, 0, 1,
-1.30174, -1.129745, -0.7114679, 1, 0.4627451, 0, 1,
-1.283252, 2.750164, -1.010529, 1, 0.4666667, 0, 1,
-1.281724, -0.5522822, -2.069349, 1, 0.4745098, 0, 1,
-1.277396, 0.9616655, 0.3951528, 1, 0.4784314, 0, 1,
-1.271175, -0.5646265, -2.021833, 1, 0.4862745, 0, 1,
-1.254514, 0.1654443, -3.211336, 1, 0.4901961, 0, 1,
-1.25361, -0.1322215, -0.4481881, 1, 0.4980392, 0, 1,
-1.253048, -0.7787166, -1.955271, 1, 0.5058824, 0, 1,
-1.24435, -0.3187566, -2.171838, 1, 0.509804, 0, 1,
-1.242241, 2.827242, 0.4403427, 1, 0.5176471, 0, 1,
-1.237738, 0.5639585, -1.553704, 1, 0.5215687, 0, 1,
-1.225894, -0.2322651, -2.500476, 1, 0.5294118, 0, 1,
-1.225053, -0.478479, -1.577222, 1, 0.5333334, 0, 1,
-1.217344, 0.8985531, -1.558012, 1, 0.5411765, 0, 1,
-1.216862, 0.6152582, -1.576483, 1, 0.5450981, 0, 1,
-1.208419, 0.2629273, -2.204582, 1, 0.5529412, 0, 1,
-1.20634, 0.03281131, -2.224102, 1, 0.5568628, 0, 1,
-1.202131, -1.517499, -1.705548, 1, 0.5647059, 0, 1,
-1.197177, -0.2485294, -2.394319, 1, 0.5686275, 0, 1,
-1.187517, -0.6846888, -1.644521, 1, 0.5764706, 0, 1,
-1.185103, 0.4616846, -0.3558254, 1, 0.5803922, 0, 1,
-1.165112, 0.5743235, 0.3681151, 1, 0.5882353, 0, 1,
-1.156163, -1.11912, -1.310743, 1, 0.5921569, 0, 1,
-1.151706, -0.6456228, -1.546116, 1, 0.6, 0, 1,
-1.150888, 1.391878, -0.5111461, 1, 0.6078432, 0, 1,
-1.148546, 1.859401, -1.00444, 1, 0.6117647, 0, 1,
-1.147803, -0.6720297, -2.240751, 1, 0.6196079, 0, 1,
-1.141472, 0.8066506, -1.702489, 1, 0.6235294, 0, 1,
-1.137836, 1.987093, 0.8763352, 1, 0.6313726, 0, 1,
-1.135842, 0.8106482, -0.4660709, 1, 0.6352941, 0, 1,
-1.133777, 0.1446417, -0.6664648, 1, 0.6431373, 0, 1,
-1.132702, 0.3925323, -3.041095, 1, 0.6470588, 0, 1,
-1.124724, -0.6831864, -2.223808, 1, 0.654902, 0, 1,
-1.124551, -0.2737696, 0.07717633, 1, 0.6588235, 0, 1,
-1.121803, -1.364968, -2.316496, 1, 0.6666667, 0, 1,
-1.120213, 0.3434812, -0.4439054, 1, 0.6705883, 0, 1,
-1.120064, 0.6767733, -1.274508, 1, 0.6784314, 0, 1,
-1.111676, -0.7307516, -1.697362, 1, 0.682353, 0, 1,
-1.110191, -0.03399163, -0.6149588, 1, 0.6901961, 0, 1,
-1.109921, -0.06972019, -3.080891, 1, 0.6941177, 0, 1,
-1.109831, -0.6234156, -0.761037, 1, 0.7019608, 0, 1,
-1.107667, -0.1445883, -2.529234, 1, 0.7098039, 0, 1,
-1.1068, -1.775479, -1.852133, 1, 0.7137255, 0, 1,
-1.10287, -0.1279148, -2.906148, 1, 0.7215686, 0, 1,
-1.100574, 0.5961075, -1.682872, 1, 0.7254902, 0, 1,
-1.098254, 1.246511, -1.772451, 1, 0.7333333, 0, 1,
-1.094071, 2.07552, -2.247037, 1, 0.7372549, 0, 1,
-1.09357, 0.4232543, -1.035408, 1, 0.7450981, 0, 1,
-1.086677, -0.4466347, -2.030249, 1, 0.7490196, 0, 1,
-1.084729, -1.313652, -2.101675, 1, 0.7568628, 0, 1,
-1.083809, -0.7179027, -2.179244, 1, 0.7607843, 0, 1,
-1.082157, -1.165942, -3.629354, 1, 0.7686275, 0, 1,
-1.078894, -0.6417606, -0.4779405, 1, 0.772549, 0, 1,
-1.078672, 0.7641482, -2.188844, 1, 0.7803922, 0, 1,
-1.078367, -1.313503, -3.39536, 1, 0.7843137, 0, 1,
-1.077171, -1.499002, -1.314815, 1, 0.7921569, 0, 1,
-1.07278, -1.150901, -4.394212, 1, 0.7960784, 0, 1,
-1.05832, 1.252284, -1.032198, 1, 0.8039216, 0, 1,
-1.054463, -1.370647, -3.327982, 1, 0.8117647, 0, 1,
-1.039648, 1.396134, -0.5472959, 1, 0.8156863, 0, 1,
-1.036556, 0.8961143, -0.8313435, 1, 0.8235294, 0, 1,
-1.033267, -0.2058624, -2.98987, 1, 0.827451, 0, 1,
-1.030405, 1.271262, -4.155089, 1, 0.8352941, 0, 1,
-1.024015, -0.1184636, -1.80576, 1, 0.8392157, 0, 1,
-1.017589, -0.2565208, -2.115682, 1, 0.8470588, 0, 1,
-1.016942, -0.859286, -1.551572, 1, 0.8509804, 0, 1,
-1.015889, 0.1867031, -2.008947, 1, 0.8588235, 0, 1,
-1.005973, -0.05724876, -2.109051, 1, 0.8627451, 0, 1,
-0.9888713, -0.4119068, 0.5896655, 1, 0.8705882, 0, 1,
-0.9857302, -0.8755613, -2.406581, 1, 0.8745098, 0, 1,
-0.9814993, -2.096628, -0.6842435, 1, 0.8823529, 0, 1,
-0.9764341, -0.6846234, -1.877307, 1, 0.8862745, 0, 1,
-0.9764163, 1.222183, -1.654157, 1, 0.8941177, 0, 1,
-0.9763464, -0.5512285, -1.495986, 1, 0.8980392, 0, 1,
-0.9754776, 0.6183623, -0.528592, 1, 0.9058824, 0, 1,
-0.9739117, 0.0438593, -3.172597, 1, 0.9137255, 0, 1,
-0.9682257, -0.7294462, -2.488959, 1, 0.9176471, 0, 1,
-0.9678599, -0.4388492, -0.9856524, 1, 0.9254902, 0, 1,
-0.9664985, -0.8016469, -0.5550739, 1, 0.9294118, 0, 1,
-0.9607984, 1.775745, -0.9560571, 1, 0.9372549, 0, 1,
-0.9607127, 0.8609526, -1.562763, 1, 0.9411765, 0, 1,
-0.9600107, -0.4062384, -0.4249565, 1, 0.9490196, 0, 1,
-0.9594166, 1.003541, -0.9325092, 1, 0.9529412, 0, 1,
-0.9583771, 1.635122, 0.4621256, 1, 0.9607843, 0, 1,
-0.9515061, -1.85179, -1.614397, 1, 0.9647059, 0, 1,
-0.9478135, -0.1824707, -2.344903, 1, 0.972549, 0, 1,
-0.947761, -0.678433, -2.087158, 1, 0.9764706, 0, 1,
-0.9457729, -0.4738954, -2.742337, 1, 0.9843137, 0, 1,
-0.9410276, 2.495007, -0.4849019, 1, 0.9882353, 0, 1,
-0.9368443, 2.81642, -0.1365546, 1, 0.9960784, 0, 1,
-0.9322946, -0.2320026, -2.421219, 0.9960784, 1, 0, 1,
-0.9312432, 0.9308395, 0.3924272, 0.9921569, 1, 0, 1,
-0.9245296, 0.621143, 0.482079, 0.9843137, 1, 0, 1,
-0.9185816, 0.7587938, 0.7079083, 0.9803922, 1, 0, 1,
-0.9170011, -1.234668, -4.189815, 0.972549, 1, 0, 1,
-0.9165812, 0.8642283, -0.1175665, 0.9686275, 1, 0, 1,
-0.9079152, -0.4919743, -1.220521, 0.9607843, 1, 0, 1,
-0.9074224, -0.8690576, -2.316136, 0.9568627, 1, 0, 1,
-0.9062287, -0.3272871, -2.128197, 0.9490196, 1, 0, 1,
-0.9023697, -1.770176, -2.109519, 0.945098, 1, 0, 1,
-0.900189, -1.853134, -2.57781, 0.9372549, 1, 0, 1,
-0.8959248, -1.293926, -4.770396, 0.9333333, 1, 0, 1,
-0.8827753, 1.102455, 0.7950975, 0.9254902, 1, 0, 1,
-0.8809923, 1.573612, -0.3299213, 0.9215686, 1, 0, 1,
-0.8757106, -1.011902, -2.061106, 0.9137255, 1, 0, 1,
-0.875351, 1.093724, -1.611965, 0.9098039, 1, 0, 1,
-0.8714352, 1.44431, -0.2007963, 0.9019608, 1, 0, 1,
-0.8643861, -0.6037541, -2.323812, 0.8941177, 1, 0, 1,
-0.8596217, -2.863021, -1.935925, 0.8901961, 1, 0, 1,
-0.8583516, 1.541285, -0.7291241, 0.8823529, 1, 0, 1,
-0.8577267, -1.007718, -3.302376, 0.8784314, 1, 0, 1,
-0.8568378, 0.5022826, -0.4087417, 0.8705882, 1, 0, 1,
-0.8551192, 0.229163, -0.7682475, 0.8666667, 1, 0, 1,
-0.8524587, -0.5530187, -0.304957, 0.8588235, 1, 0, 1,
-0.8431587, -1.818008, -2.718209, 0.854902, 1, 0, 1,
-0.8398588, -0.4433773, -2.087989, 0.8470588, 1, 0, 1,
-0.8376167, 0.4535768, -1.010876, 0.8431373, 1, 0, 1,
-0.8342219, -0.8090264, -1.907909, 0.8352941, 1, 0, 1,
-0.8339796, -0.7707685, -2.419411, 0.8313726, 1, 0, 1,
-0.8305568, -1.292172, -2.379804, 0.8235294, 1, 0, 1,
-0.8298085, 0.3165661, -2.220224, 0.8196079, 1, 0, 1,
-0.8263233, -1.068671, -0.9311749, 0.8117647, 1, 0, 1,
-0.822001, 2.874619, -0.3672013, 0.8078431, 1, 0, 1,
-0.8203835, 2.465942, 0.1076716, 0.8, 1, 0, 1,
-0.819324, -0.5546374, -2.277962, 0.7921569, 1, 0, 1,
-0.8128861, -0.1363527, -0.8848016, 0.7882353, 1, 0, 1,
-0.8081559, 1.473246, -0.3976498, 0.7803922, 1, 0, 1,
-0.8075354, -0.2224151, -2.326144, 0.7764706, 1, 0, 1,
-0.8061763, -0.3340953, -0.9040614, 0.7686275, 1, 0, 1,
-0.8061686, -0.6373875, -2.917642, 0.7647059, 1, 0, 1,
-0.8050323, 1.076971, -3.17537, 0.7568628, 1, 0, 1,
-0.8026878, -1.298015, -2.728751, 0.7529412, 1, 0, 1,
-0.7983164, -0.1394993, -2.265123, 0.7450981, 1, 0, 1,
-0.7980288, 0.1070437, -0.6752629, 0.7411765, 1, 0, 1,
-0.7966239, 1.352948, -0.5010657, 0.7333333, 1, 0, 1,
-0.7914354, 0.2195363, -1.03051, 0.7294118, 1, 0, 1,
-0.7904224, 1.154277, -2.905133, 0.7215686, 1, 0, 1,
-0.789472, 1.337464, -0.8257735, 0.7176471, 1, 0, 1,
-0.7889727, 0.9483292, -1.650493, 0.7098039, 1, 0, 1,
-0.7875783, -0.8874153, -3.17868, 0.7058824, 1, 0, 1,
-0.7808005, -1.874922, -3.595121, 0.6980392, 1, 0, 1,
-0.7636377, -1.222676, -2.305458, 0.6901961, 1, 0, 1,
-0.7613404, -0.03551773, -1.872616, 0.6862745, 1, 0, 1,
-0.760789, 0.2589052, -2.3521, 0.6784314, 1, 0, 1,
-0.7598711, 0.03878362, -1.632081, 0.6745098, 1, 0, 1,
-0.7586864, -1.282363, -2.183478, 0.6666667, 1, 0, 1,
-0.7585015, 0.9600208, 1.039992, 0.6627451, 1, 0, 1,
-0.7515686, 0.2802281, -0.6575906, 0.654902, 1, 0, 1,
-0.7439204, 0.3402658, -2.361546, 0.6509804, 1, 0, 1,
-0.7430871, 0.6778147, 1.2686, 0.6431373, 1, 0, 1,
-0.7399367, 0.2542424, -1.048542, 0.6392157, 1, 0, 1,
-0.7382624, -0.6942735, -3.216627, 0.6313726, 1, 0, 1,
-0.7376152, -0.1669089, -2.771706, 0.627451, 1, 0, 1,
-0.7349904, 1.516093, -0.2011989, 0.6196079, 1, 0, 1,
-0.7323963, 2.315159, 0.465471, 0.6156863, 1, 0, 1,
-0.7319956, 1.052773, -0.06548512, 0.6078432, 1, 0, 1,
-0.7297522, 0.06278495, -2.753183, 0.6039216, 1, 0, 1,
-0.7241331, 0.04185485, -0.8775422, 0.5960785, 1, 0, 1,
-0.7067735, -0.2701856, -3.141088, 0.5882353, 1, 0, 1,
-0.7064263, -0.8544201, -1.848294, 0.5843138, 1, 0, 1,
-0.706393, 1.920075, -1.868524, 0.5764706, 1, 0, 1,
-0.7026781, -1.039662, -1.914555, 0.572549, 1, 0, 1,
-0.6898351, 0.3092168, -0.527434, 0.5647059, 1, 0, 1,
-0.6889812, 1.721473, -1.839812, 0.5607843, 1, 0, 1,
-0.6782149, 0.1174732, -0.522878, 0.5529412, 1, 0, 1,
-0.6774332, -2.188434, -2.18685, 0.5490196, 1, 0, 1,
-0.6704358, 0.4729911, -1.02946, 0.5411765, 1, 0, 1,
-0.6663293, -0.4554168, -1.514996, 0.5372549, 1, 0, 1,
-0.6644484, -1.438286, -1.959235, 0.5294118, 1, 0, 1,
-0.6533948, 0.2488317, -0.6667243, 0.5254902, 1, 0, 1,
-0.6466523, -1.747051, -3.357029, 0.5176471, 1, 0, 1,
-0.6430006, -0.9179045, -2.476543, 0.5137255, 1, 0, 1,
-0.640225, -0.5272171, -2.774949, 0.5058824, 1, 0, 1,
-0.6351323, -0.9621078, -1.657021, 0.5019608, 1, 0, 1,
-0.6346736, 1.156706, -1.494105, 0.4941176, 1, 0, 1,
-0.6345096, -0.3934937, 0.4251507, 0.4862745, 1, 0, 1,
-0.6313819, 0.8435223, 0.03189748, 0.4823529, 1, 0, 1,
-0.624693, -1.173169, -3.163536, 0.4745098, 1, 0, 1,
-0.6193267, -1.097669, -1.52834, 0.4705882, 1, 0, 1,
-0.6169555, 0.787316, -1.190818, 0.4627451, 1, 0, 1,
-0.6119838, 1.786076, 1.272377, 0.4588235, 1, 0, 1,
-0.6111075, 0.6607549, 0.9522378, 0.4509804, 1, 0, 1,
-0.6096962, 1.513417, 0.506994, 0.4470588, 1, 0, 1,
-0.6079091, -0.8282086, -1.37419, 0.4392157, 1, 0, 1,
-0.6074255, -0.7496477, -1.06545, 0.4352941, 1, 0, 1,
-0.6045616, 1.432405, -0.4251143, 0.427451, 1, 0, 1,
-0.5946443, 0.06437733, -1.243061, 0.4235294, 1, 0, 1,
-0.5908206, -0.8222561, -2.641873, 0.4156863, 1, 0, 1,
-0.5907063, -0.4209462, -3.061979, 0.4117647, 1, 0, 1,
-0.5885072, 0.8984145, -2.404465, 0.4039216, 1, 0, 1,
-0.58471, -1.018941, -2.90331, 0.3960784, 1, 0, 1,
-0.5824211, -0.9690109, -2.233349, 0.3921569, 1, 0, 1,
-0.5802259, 0.6822105, -1.9765, 0.3843137, 1, 0, 1,
-0.5795961, 1.871347, 0.2918235, 0.3803922, 1, 0, 1,
-0.5775763, -0.7942392, -2.087928, 0.372549, 1, 0, 1,
-0.5749522, -0.399835, -3.392698, 0.3686275, 1, 0, 1,
-0.5744836, 0.4197871, -1.83431, 0.3607843, 1, 0, 1,
-0.5692322, 0.5407333, -1.773831, 0.3568628, 1, 0, 1,
-0.5649461, -0.6053943, -2.630254, 0.3490196, 1, 0, 1,
-0.5637503, -0.2468882, -0.9773144, 0.345098, 1, 0, 1,
-0.5616526, 1.65721, -0.4227923, 0.3372549, 1, 0, 1,
-0.5563341, -0.8462688, -1.501744, 0.3333333, 1, 0, 1,
-0.5532759, -0.3496751, -1.389911, 0.3254902, 1, 0, 1,
-0.5528965, 1.313247, 1.396303, 0.3215686, 1, 0, 1,
-0.546699, 0.07102371, -0.9127436, 0.3137255, 1, 0, 1,
-0.545153, 0.9126741, -0.6186949, 0.3098039, 1, 0, 1,
-0.5445236, 0.4331451, -1.187451, 0.3019608, 1, 0, 1,
-0.5435992, -1.764423, -2.634209, 0.2941177, 1, 0, 1,
-0.5314224, -1.072265, -3.306999, 0.2901961, 1, 0, 1,
-0.5280721, 0.1328303, 0.3815005, 0.282353, 1, 0, 1,
-0.5273482, -1.647272, -2.875654, 0.2784314, 1, 0, 1,
-0.5272119, -1.57161, -1.247983, 0.2705882, 1, 0, 1,
-0.5271245, -1.191152, -3.888933, 0.2666667, 1, 0, 1,
-0.5249937, -0.3958407, -2.35073, 0.2588235, 1, 0, 1,
-0.524522, 1.286124, 0.03386472, 0.254902, 1, 0, 1,
-0.5224678, -1.434342, -4.497386, 0.2470588, 1, 0, 1,
-0.5216755, 0.295868, -0.9245776, 0.2431373, 1, 0, 1,
-0.5213912, 0.05018069, -2.625459, 0.2352941, 1, 0, 1,
-0.5203359, 0.7763172, 1.410355, 0.2313726, 1, 0, 1,
-0.5194818, 1.304171, 0.9266322, 0.2235294, 1, 0, 1,
-0.5102487, -0.3371475, -2.030606, 0.2196078, 1, 0, 1,
-0.5059962, -1.712959, -3.685255, 0.2117647, 1, 0, 1,
-0.5041069, -0.3815941, -2.367088, 0.2078431, 1, 0, 1,
-0.5033502, -0.2359824, -4.683495, 0.2, 1, 0, 1,
-0.5019121, 1.219581, -0.921149, 0.1921569, 1, 0, 1,
-0.498798, 1.187611, -0.2483876, 0.1882353, 1, 0, 1,
-0.4987107, -0.8220259, -3.719774, 0.1803922, 1, 0, 1,
-0.4985449, 1.349453, 3.299644, 0.1764706, 1, 0, 1,
-0.4985058, -1.157036, -2.266301, 0.1686275, 1, 0, 1,
-0.4968883, -0.3509936, -2.548712, 0.1647059, 1, 0, 1,
-0.4966206, 1.138952, -1.229148, 0.1568628, 1, 0, 1,
-0.496349, 0.5965438, -0.8632467, 0.1529412, 1, 0, 1,
-0.4916163, 1.364109, -1.229728, 0.145098, 1, 0, 1,
-0.4900987, -0.06236084, -1.687903, 0.1411765, 1, 0, 1,
-0.4895192, 0.8811724, -0.51935, 0.1333333, 1, 0, 1,
-0.4876793, -0.6471049, -4.63187, 0.1294118, 1, 0, 1,
-0.4782832, -0.2808908, -2.837095, 0.1215686, 1, 0, 1,
-0.4705274, 0.331676, -1.119287, 0.1176471, 1, 0, 1,
-0.4660631, 0.6019255, -2.026218, 0.1098039, 1, 0, 1,
-0.4622809, -1.771453, -3.260188, 0.1058824, 1, 0, 1,
-0.4587446, 0.1947783, -1.87572, 0.09803922, 1, 0, 1,
-0.4545945, 2.106504, 0.505164, 0.09019608, 1, 0, 1,
-0.4515819, -0.3281414, -3.09841, 0.08627451, 1, 0, 1,
-0.4456553, 1.383096, 0.7782917, 0.07843138, 1, 0, 1,
-0.4445226, 0.4111408, -1.618505, 0.07450981, 1, 0, 1,
-0.4310973, 1.264613, -0.9247772, 0.06666667, 1, 0, 1,
-0.4270983, -0.193848, -2.132392, 0.0627451, 1, 0, 1,
-0.4264651, 0.4587642, -0.7579123, 0.05490196, 1, 0, 1,
-0.4165148, -0.5744523, -1.289982, 0.05098039, 1, 0, 1,
-0.4161514, -1.054687, -3.393104, 0.04313726, 1, 0, 1,
-0.4149421, 0.2925628, 0.120458, 0.03921569, 1, 0, 1,
-0.4136994, 0.1365659, -0.5247492, 0.03137255, 1, 0, 1,
-0.4133411, -0.925881, -2.209528, 0.02745098, 1, 0, 1,
-0.413141, 0.4828649, 0.3351575, 0.01960784, 1, 0, 1,
-0.4043964, -0.006110174, -1.202377, 0.01568628, 1, 0, 1,
-0.4043114, 0.6660199, 0.01040453, 0.007843138, 1, 0, 1,
-0.4023469, 0.0905759, -0.5394492, 0.003921569, 1, 0, 1,
-0.4023313, -0.09916171, -0.8254065, 0, 1, 0.003921569, 1,
-0.3997864, 0.115428, -1.03513, 0, 1, 0.01176471, 1,
-0.3966426, 0.6370392, -0.4776176, 0, 1, 0.01568628, 1,
-0.3906938, -0.4795648, -0.3737033, 0, 1, 0.02352941, 1,
-0.3901588, 0.6650757, -0.5238279, 0, 1, 0.02745098, 1,
-0.3831472, -1.399951, -0.8724954, 0, 1, 0.03529412, 1,
-0.379306, 0.03773407, -2.015101, 0, 1, 0.03921569, 1,
-0.3755887, 3.137879, 0.9675643, 0, 1, 0.04705882, 1,
-0.3716901, 1.247481, -1.157569, 0, 1, 0.05098039, 1,
-0.3699422, 0.7162433, 0.7664607, 0, 1, 0.05882353, 1,
-0.3696166, 1.848119, -0.0517123, 0, 1, 0.0627451, 1,
-0.3693809, -0.01521882, -1.130588, 0, 1, 0.07058824, 1,
-0.3690158, 0.3081119, 1.401123, 0, 1, 0.07450981, 1,
-0.3670768, -0.1060913, -0.9226964, 0, 1, 0.08235294, 1,
-0.3630643, 0.925354, 0.2747712, 0, 1, 0.08627451, 1,
-0.3616579, -0.6240423, -3.305919, 0, 1, 0.09411765, 1,
-0.3592053, 0.6328954, -0.7974769, 0, 1, 0.1019608, 1,
-0.3588708, -1.998962, -3.131025, 0, 1, 0.1058824, 1,
-0.3578675, 0.8608132, 0.05426275, 0, 1, 0.1137255, 1,
-0.3514298, -1.575675, -4.810089, 0, 1, 0.1176471, 1,
-0.3459388, 0.9671407, -1.436684, 0, 1, 0.1254902, 1,
-0.3453203, 0.8718741, 1.657851, 0, 1, 0.1294118, 1,
-0.3441714, 0.5387806, -0.2931061, 0, 1, 0.1372549, 1,
-0.3365069, -0.7879651, -3.487125, 0, 1, 0.1411765, 1,
-0.3342599, 0.6111162, -0.3890557, 0, 1, 0.1490196, 1,
-0.3330063, -2.128864, -2.675269, 0, 1, 0.1529412, 1,
-0.3209046, 1.588827, 1.067454, 0, 1, 0.1607843, 1,
-0.319895, 1.899773, -1.148272, 0, 1, 0.1647059, 1,
-0.3186658, -0.0578942, -2.244055, 0, 1, 0.172549, 1,
-0.3138073, -2.283192, -3.417505, 0, 1, 0.1764706, 1,
-0.312807, 1.156667, -0.5649252, 0, 1, 0.1843137, 1,
-0.3093146, 1.121103, -0.1765304, 0, 1, 0.1882353, 1,
-0.304838, 0.9505801, -1.034358, 0, 1, 0.1960784, 1,
-0.3039527, -0.4642229, -0.8791679, 0, 1, 0.2039216, 1,
-0.3024186, 0.05926985, -0.6602961, 0, 1, 0.2078431, 1,
-0.3018429, -0.545792, -2.971976, 0, 1, 0.2156863, 1,
-0.301106, -0.1190687, -1.398495, 0, 1, 0.2196078, 1,
-0.295129, 0.5091158, 0.713675, 0, 1, 0.227451, 1,
-0.2931511, 2.420139, -1.394358, 0, 1, 0.2313726, 1,
-0.2911053, 0.4933823, -1.296466, 0, 1, 0.2392157, 1,
-0.2888958, -0.9697977, -2.99448, 0, 1, 0.2431373, 1,
-0.2885515, 0.5107641, -0.7421752, 0, 1, 0.2509804, 1,
-0.2883659, -0.433087, -2.848519, 0, 1, 0.254902, 1,
-0.287696, 0.001430732, -2.288161, 0, 1, 0.2627451, 1,
-0.2875554, -0.8139552, -3.893032, 0, 1, 0.2666667, 1,
-0.2821177, 1.620541, 0.2736104, 0, 1, 0.2745098, 1,
-0.277328, -0.04525636, -1.942884, 0, 1, 0.2784314, 1,
-0.2763235, -2.335394, -3.235238, 0, 1, 0.2862745, 1,
-0.2723924, 0.9748847, -0.9395985, 0, 1, 0.2901961, 1,
-0.2692378, -0.9708085, -2.560377, 0, 1, 0.2980392, 1,
-0.2668247, 0.6552208, -1.347596, 0, 1, 0.3058824, 1,
-0.2654617, -0.6037048, -1.725046, 0, 1, 0.3098039, 1,
-0.2561314, 1.69562, 0.9046487, 0, 1, 0.3176471, 1,
-0.2536063, 0.8996436, 0.4508103, 0, 1, 0.3215686, 1,
-0.2493147, 1.070003, 1.363009, 0, 1, 0.3294118, 1,
-0.2485387, -0.5812717, -2.882162, 0, 1, 0.3333333, 1,
-0.2466965, 0.8284509, -0.7937458, 0, 1, 0.3411765, 1,
-0.2460231, 0.5868275, 0.5916121, 0, 1, 0.345098, 1,
-0.2415071, 0.7563286, 0.6295522, 0, 1, 0.3529412, 1,
-0.2395054, 0.7881818, 0.3861491, 0, 1, 0.3568628, 1,
-0.2359326, -0.3911481, -2.368024, 0, 1, 0.3647059, 1,
-0.231393, -0.8868744, -4.921275, 0, 1, 0.3686275, 1,
-0.2293276, 0.583246, -0.009634242, 0, 1, 0.3764706, 1,
-0.2278739, -0.6280545, -3.581742, 0, 1, 0.3803922, 1,
-0.2263554, -0.05525924, -2.284234, 0, 1, 0.3882353, 1,
-0.226144, -1.240984, -2.070228, 0, 1, 0.3921569, 1,
-0.2221949, 0.1332713, -1.689633, 0, 1, 0.4, 1,
-0.2210895, 1.092781, -0.01156907, 0, 1, 0.4078431, 1,
-0.2196981, -0.9842284, 0.1238433, 0, 1, 0.4117647, 1,
-0.2166096, -1.259115, -0.969863, 0, 1, 0.4196078, 1,
-0.2160766, 1.101123, -1.007197, 0, 1, 0.4235294, 1,
-0.2159938, -1.076769, -3.303626, 0, 1, 0.4313726, 1,
-0.2156507, 1.814611, -0.1384716, 0, 1, 0.4352941, 1,
-0.2025858, -0.3769291, -1.870956, 0, 1, 0.4431373, 1,
-0.1997817, 0.1786204, -1.385127, 0, 1, 0.4470588, 1,
-0.1980887, -0.8232858, -2.811414, 0, 1, 0.454902, 1,
-0.1963363, 0.1460921, 0.2830794, 0, 1, 0.4588235, 1,
-0.1949619, 0.6154417, -0.9677743, 0, 1, 0.4666667, 1,
-0.1941999, 1.09163, -0.2630078, 0, 1, 0.4705882, 1,
-0.183784, 1.143167, 0.3252923, 0, 1, 0.4784314, 1,
-0.1830107, -1.59336, -2.869349, 0, 1, 0.4823529, 1,
-0.1809317, -0.4011365, -1.057238, 0, 1, 0.4901961, 1,
-0.1795979, -1.674068, -3.689105, 0, 1, 0.4941176, 1,
-0.1791697, 2.047836, -0.05191272, 0, 1, 0.5019608, 1,
-0.1772531, -0.3449383, -3.805816, 0, 1, 0.509804, 1,
-0.1735696, 1.594443, 0.7067223, 0, 1, 0.5137255, 1,
-0.1716688, -0.4532191, -4.11974, 0, 1, 0.5215687, 1,
-0.1709445, 1.457762, -0.7807848, 0, 1, 0.5254902, 1,
-0.1708712, 0.8773304, -1.153946, 0, 1, 0.5333334, 1,
-0.1703449, 0.2303999, -2.181141, 0, 1, 0.5372549, 1,
-0.1701455, -1.145459, -2.924901, 0, 1, 0.5450981, 1,
-0.1673532, -1.64443, -3.750202, 0, 1, 0.5490196, 1,
-0.1665984, -0.3984911, -1.357561, 0, 1, 0.5568628, 1,
-0.1646317, 0.2511292, -0.06528144, 0, 1, 0.5607843, 1,
-0.1639303, 0.5495708, -0.6681925, 0, 1, 0.5686275, 1,
-0.162288, 2.282545, -0.1889649, 0, 1, 0.572549, 1,
-0.162259, 0.0167788, -0.9405662, 0, 1, 0.5803922, 1,
-0.1591421, 0.7107739, -0.7654515, 0, 1, 0.5843138, 1,
-0.1486259, -0.9183096, -4.171705, 0, 1, 0.5921569, 1,
-0.1482835, -0.1550038, -3.619556, 0, 1, 0.5960785, 1,
-0.1477121, -0.0691148, -1.655064, 0, 1, 0.6039216, 1,
-0.1467411, -0.9886517, -3.511484, 0, 1, 0.6117647, 1,
-0.1463356, -0.2693907, -2.718822, 0, 1, 0.6156863, 1,
-0.144809, -1.976514, -2.381965, 0, 1, 0.6235294, 1,
-0.1435309, -0.563942, -2.326262, 0, 1, 0.627451, 1,
-0.1404298, -1.354388, -3.692327, 0, 1, 0.6352941, 1,
-0.1395192, 0.2072303, -1.896366, 0, 1, 0.6392157, 1,
-0.1351382, 0.3317738, -0.9957632, 0, 1, 0.6470588, 1,
-0.1351376, 1.092175, -1.303966, 0, 1, 0.6509804, 1,
-0.1327479, -0.6476203, -3.899054, 0, 1, 0.6588235, 1,
-0.1300174, 0.210861, -0.67983, 0, 1, 0.6627451, 1,
-0.1275532, -0.1922484, -1.890191, 0, 1, 0.6705883, 1,
-0.1251571, -0.1589911, -3.155314, 0, 1, 0.6745098, 1,
-0.1214806, -0.5116234, -2.734347, 0, 1, 0.682353, 1,
-0.1171202, -0.2727737, -0.5453479, 0, 1, 0.6862745, 1,
-0.1139395, -1.348472, -3.495887, 0, 1, 0.6941177, 1,
-0.113789, 0.2052507, -0.6516591, 0, 1, 0.7019608, 1,
-0.1104106, -1.344107, -1.558915, 0, 1, 0.7058824, 1,
-0.1100585, -0.7051494, -2.194386, 0, 1, 0.7137255, 1,
-0.1042261, 0.1642534, -1.975587, 0, 1, 0.7176471, 1,
-0.1037773, -0.009095051, -1.835956, 0, 1, 0.7254902, 1,
-0.1036802, 1.434738, 0.7050448, 0, 1, 0.7294118, 1,
-0.09929992, -0.3475139, -3.94763, 0, 1, 0.7372549, 1,
-0.09818092, 3.178566, -0.3468797, 0, 1, 0.7411765, 1,
-0.09130858, -0.4846411, -0.9420288, 0, 1, 0.7490196, 1,
-0.08793634, 0.09178185, -1.78356, 0, 1, 0.7529412, 1,
-0.08552042, -0.6284688, -0.830133, 0, 1, 0.7607843, 1,
-0.08337581, -0.2986624, -2.021384, 0, 1, 0.7647059, 1,
-0.08207855, -0.544628, -3.439123, 0, 1, 0.772549, 1,
-0.08078448, 1.460164, 0.7087054, 0, 1, 0.7764706, 1,
-0.08057899, -0.04236379, -1.990335, 0, 1, 0.7843137, 1,
-0.07999319, 0.9501778, -0.4521033, 0, 1, 0.7882353, 1,
-0.07820766, -0.967568, -2.013614, 0, 1, 0.7960784, 1,
-0.07298783, 1.205823, -1.152157, 0, 1, 0.8039216, 1,
-0.07287727, -0.4849797, -2.375956, 0, 1, 0.8078431, 1,
-0.0724973, -0.9704353, -2.813068, 0, 1, 0.8156863, 1,
-0.07082201, -0.05137609, -3.273951, 0, 1, 0.8196079, 1,
-0.06607298, -0.8665603, -1.384335, 0, 1, 0.827451, 1,
-0.06314593, -0.5282559, -2.768972, 0, 1, 0.8313726, 1,
-0.06076046, 0.752282, -0.9301943, 0, 1, 0.8392157, 1,
-0.05673467, 1.568832, 1.020773, 0, 1, 0.8431373, 1,
-0.05600139, 0.3371146, 0.7916933, 0, 1, 0.8509804, 1,
-0.05079833, -1.576793, -2.361393, 0, 1, 0.854902, 1,
-0.0457956, -1.047878, -4.395157, 0, 1, 0.8627451, 1,
-0.04531183, -1.286555, -3.488744, 0, 1, 0.8666667, 1,
-0.04423637, 1.759558, -2.112683, 0, 1, 0.8745098, 1,
-0.0436592, 0.8905011, -1.127648, 0, 1, 0.8784314, 1,
-0.04075826, -0.1640853, -3.439798, 0, 1, 0.8862745, 1,
-0.0373166, 1.544049, 0.6049438, 0, 1, 0.8901961, 1,
-0.03699617, 2.896936, -0.1198649, 0, 1, 0.8980392, 1,
-0.03674871, 2.257087, -0.5752516, 0, 1, 0.9058824, 1,
-0.03654643, -1.235934, -2.866844, 0, 1, 0.9098039, 1,
-0.03213113, -0.7454397, -3.687132, 0, 1, 0.9176471, 1,
-0.02863371, 0.1730234, -0.9366195, 0, 1, 0.9215686, 1,
-0.0271251, -0.5500036, -4.916922, 0, 1, 0.9294118, 1,
-0.02137216, -0.7965227, -3.87783, 0, 1, 0.9333333, 1,
-0.02124222, -0.7927465, -1.681853, 0, 1, 0.9411765, 1,
-0.01793389, -1.578436, -3.858696, 0, 1, 0.945098, 1,
-0.01258334, -0.006050818, -2.58609, 0, 1, 0.9529412, 1,
-0.01195129, 1.731186, 1.814894, 0, 1, 0.9568627, 1,
-0.004260297, 0.03878386, 0.03513537, 0, 1, 0.9647059, 1,
-0.003508185, 0.4824691, 3.026826, 0, 1, 0.9686275, 1,
-0.002378449, -1.429831, -2.598425, 0, 1, 0.9764706, 1,
-2.832359e-05, -1.961278, -3.320669, 0, 1, 0.9803922, 1,
0.003494279, 0.5216395, 0.9258875, 0, 1, 0.9882353, 1,
0.003698982, 0.9614657, -0.8952265, 0, 1, 0.9921569, 1,
0.003887388, -1.200942, 3.087826, 0, 1, 1, 1,
0.00466016, 0.05497607, 0.679686, 0, 0.9921569, 1, 1,
0.006067222, -0.1771017, 4.7444, 0, 0.9882353, 1, 1,
0.006091211, 0.3309714, -1.365787, 0, 0.9803922, 1, 1,
0.007032097, 0.670004, -1.849641, 0, 0.9764706, 1, 1,
0.01087386, -0.9689827, 3.469393, 0, 0.9686275, 1, 1,
0.01384858, -2.656354, 2.155439, 0, 0.9647059, 1, 1,
0.01500472, 1.043716, 0.131029, 0, 0.9568627, 1, 1,
0.02344855, 0.2717469, 0.5277232, 0, 0.9529412, 1, 1,
0.02378199, -0.9439114, 3.919691, 0, 0.945098, 1, 1,
0.02572058, 0.2984158, -2.147224, 0, 0.9411765, 1, 1,
0.03001241, -0.96699, 2.671631, 0, 0.9333333, 1, 1,
0.03040401, 1.323791, 0.3922819, 0, 0.9294118, 1, 1,
0.03045065, 0.3856651, 0.8114433, 0, 0.9215686, 1, 1,
0.03652985, -0.2759947, 0.8217958, 0, 0.9176471, 1, 1,
0.03824148, 1.236225, 0.5102909, 0, 0.9098039, 1, 1,
0.04148797, 2.789505, -0.05126736, 0, 0.9058824, 1, 1,
0.042094, -0.9127084, 5.843401, 0, 0.8980392, 1, 1,
0.04410606, 0.1709245, 1.386854, 0, 0.8901961, 1, 1,
0.04432926, -1.075975, 2.279824, 0, 0.8862745, 1, 1,
0.04529134, -0.2433609, 3.03521, 0, 0.8784314, 1, 1,
0.04910009, 1.837114, 0.2220449, 0, 0.8745098, 1, 1,
0.04948933, -0.8269861, 3.758857, 0, 0.8666667, 1, 1,
0.05046165, 2.022225, 0.06799659, 0, 0.8627451, 1, 1,
0.0586867, -0.5221421, 3.831109, 0, 0.854902, 1, 1,
0.06168612, -2.364126, 2.671363, 0, 0.8509804, 1, 1,
0.0617627, 0.009971681, 2.067801, 0, 0.8431373, 1, 1,
0.06236208, 0.8497645, 0.7797196, 0, 0.8392157, 1, 1,
0.06640509, -1.228253, 4.074206, 0, 0.8313726, 1, 1,
0.07343257, 0.5493672, 0.303589, 0, 0.827451, 1, 1,
0.07345863, -0.05525786, 1.90173, 0, 0.8196079, 1, 1,
0.07776242, 1.672096, -0.006161409, 0, 0.8156863, 1, 1,
0.07981487, -1.179719, 3.188375, 0, 0.8078431, 1, 1,
0.07991364, -0.2145963, 3.873423, 0, 0.8039216, 1, 1,
0.08087122, 2.343931, -1.654917, 0, 0.7960784, 1, 1,
0.08262337, 0.09146733, 0.1118848, 0, 0.7882353, 1, 1,
0.08472922, -0.77832, 0.682077, 0, 0.7843137, 1, 1,
0.08602452, 0.4448453, -1.486949, 0, 0.7764706, 1, 1,
0.08773287, -0.007901368, 2.270644, 0, 0.772549, 1, 1,
0.08812351, 1.30658, -1.049436, 0, 0.7647059, 1, 1,
0.0883815, -0.5251638, 2.537322, 0, 0.7607843, 1, 1,
0.08942663, 1.077608, -0.7208516, 0, 0.7529412, 1, 1,
0.08990418, 1.136499, 2.373075, 0, 0.7490196, 1, 1,
0.09739448, 2.170047, 0.6670898, 0, 0.7411765, 1, 1,
0.09956453, -0.3828712, 4.008011, 0, 0.7372549, 1, 1,
0.1026064, 1.290482, 1.770341, 0, 0.7294118, 1, 1,
0.123969, -0.1463183, 1.360048, 0, 0.7254902, 1, 1,
0.131146, 0.09366456, 0.2746222, 0, 0.7176471, 1, 1,
0.1313558, -0.1411133, 2.648809, 0, 0.7137255, 1, 1,
0.1319416, 0.2220422, 1.377084, 0, 0.7058824, 1, 1,
0.1324997, 0.9715884, 0.1649, 0, 0.6980392, 1, 1,
0.1348349, -0.7287527, 3.397368, 0, 0.6941177, 1, 1,
0.1357855, 1.881873, -0.03755546, 0, 0.6862745, 1, 1,
0.1395649, 0.3194281, 0.7481762, 0, 0.682353, 1, 1,
0.1416802, -0.5217357, 3.523315, 0, 0.6745098, 1, 1,
0.1431166, 1.363579, -2.289316, 0, 0.6705883, 1, 1,
0.1456126, -1.436376, 2.953359, 0, 0.6627451, 1, 1,
0.1477146, 0.5809308, -2.41933, 0, 0.6588235, 1, 1,
0.1480827, -2.144892, 1.804001, 0, 0.6509804, 1, 1,
0.1483027, -0.3227219, 2.566771, 0, 0.6470588, 1, 1,
0.148778, 0.4555502, 1.055367, 0, 0.6392157, 1, 1,
0.1491736, 0.8877175, -0.549765, 0, 0.6352941, 1, 1,
0.1562478, 1.454746, -0.4145253, 0, 0.627451, 1, 1,
0.160968, 1.142335, -0.05556541, 0, 0.6235294, 1, 1,
0.1628241, -0.5458721, 2.997581, 0, 0.6156863, 1, 1,
0.1635838, 0.2077051, 1.593226, 0, 0.6117647, 1, 1,
0.1687165, 0.7148743, -0.5288482, 0, 0.6039216, 1, 1,
0.1690881, 1.288274, 0.261848, 0, 0.5960785, 1, 1,
0.1720827, 0.1938307, 0.3023787, 0, 0.5921569, 1, 1,
0.1788428, 1.211744, -0.7769192, 0, 0.5843138, 1, 1,
0.1834474, -0.5349122, 3.785489, 0, 0.5803922, 1, 1,
0.1868502, -0.001661053, 1.014008, 0, 0.572549, 1, 1,
0.1973702, -0.6381307, 3.010128, 0, 0.5686275, 1, 1,
0.2003202, 0.5809635, 0.732381, 0, 0.5607843, 1, 1,
0.2073261, -1.791267, 2.658158, 0, 0.5568628, 1, 1,
0.2077247, 0.9943519, -0.8758564, 0, 0.5490196, 1, 1,
0.2151708, -0.2429922, 0.6669649, 0, 0.5450981, 1, 1,
0.2177217, -0.1415523, 2.29872, 0, 0.5372549, 1, 1,
0.2205889, 0.2698622, -1.442234, 0, 0.5333334, 1, 1,
0.2214614, -0.04127192, 1.570274, 0, 0.5254902, 1, 1,
0.2319272, -0.6545167, 4.105268, 0, 0.5215687, 1, 1,
0.2327593, 1.017136, -0.686839, 0, 0.5137255, 1, 1,
0.2379483, -0.7627733, 4.028232, 0, 0.509804, 1, 1,
0.238433, -1.411338, 2.951381, 0, 0.5019608, 1, 1,
0.2390249, 0.8284541, 0.6433729, 0, 0.4941176, 1, 1,
0.2390405, 0.2256047, -0.236755, 0, 0.4901961, 1, 1,
0.2403524, -1.903641, 3.979183, 0, 0.4823529, 1, 1,
0.2420325, 1.240049, 1.743177, 0, 0.4784314, 1, 1,
0.242448, 1.03279, -0.3132381, 0, 0.4705882, 1, 1,
0.2437022, -0.1369147, 2.941951, 0, 0.4666667, 1, 1,
0.2444829, -1.316041, 1.973904, 0, 0.4588235, 1, 1,
0.2446344, 0.2979346, 0.399415, 0, 0.454902, 1, 1,
0.2468927, -0.5458868, 1.207967, 0, 0.4470588, 1, 1,
0.2495979, -0.5630569, 1.679144, 0, 0.4431373, 1, 1,
0.2526951, 0.55348, -1.403615, 0, 0.4352941, 1, 1,
0.2555747, -0.4779995, 3.4626, 0, 0.4313726, 1, 1,
0.2562467, 0.07142833, 1.172588, 0, 0.4235294, 1, 1,
0.2605644, -0.3615485, 1.554789, 0, 0.4196078, 1, 1,
0.2616923, -2.560769, 2.605364, 0, 0.4117647, 1, 1,
0.2627787, 0.6248548, -0.6610479, 0, 0.4078431, 1, 1,
0.265078, 1.40275, -0.1443959, 0, 0.4, 1, 1,
0.2653139, 0.6923011, 1.19602, 0, 0.3921569, 1, 1,
0.2654759, -2.126011, 2.744932, 0, 0.3882353, 1, 1,
0.2663835, 0.298061, -1.590691, 0, 0.3803922, 1, 1,
0.2719769, 1.509921, 0.3983751, 0, 0.3764706, 1, 1,
0.2725612, -0.2848798, 2.804608, 0, 0.3686275, 1, 1,
0.2728065, 1.455444, -0.7309259, 0, 0.3647059, 1, 1,
0.2735888, 0.1980982, 2.37708, 0, 0.3568628, 1, 1,
0.2737877, 1.456825, -0.362421, 0, 0.3529412, 1, 1,
0.2770622, -1.654192, 2.629733, 0, 0.345098, 1, 1,
0.279455, 0.2339532, -0.7171765, 0, 0.3411765, 1, 1,
0.2873628, -0.8482164, 2.325861, 0, 0.3333333, 1, 1,
0.2877024, -0.2754639, 3.277746, 0, 0.3294118, 1, 1,
0.2902555, 0.7681836, -0.8559541, 0, 0.3215686, 1, 1,
0.2903294, 1.447839, -1.330003, 0, 0.3176471, 1, 1,
0.2936568, -1.195799, 3.440199, 0, 0.3098039, 1, 1,
0.2972252, 1.390083, -0.7337226, 0, 0.3058824, 1, 1,
0.2972938, -0.7426067, 4.456208, 0, 0.2980392, 1, 1,
0.3012763, 0.2701857, 1.183816, 0, 0.2901961, 1, 1,
0.3046915, -0.9653957, 1.569994, 0, 0.2862745, 1, 1,
0.3064113, 0.8351966, 2.243208, 0, 0.2784314, 1, 1,
0.3080506, 1.108141, 0.5166416, 0, 0.2745098, 1, 1,
0.3086097, -0.2213634, 2.136607, 0, 0.2666667, 1, 1,
0.3222048, 2.785468, 0.4859467, 0, 0.2627451, 1, 1,
0.3226939, -1.233766, 2.743109, 0, 0.254902, 1, 1,
0.3280953, -0.6608348, 1.267221, 0, 0.2509804, 1, 1,
0.328377, 0.8114554, 2.065172, 0, 0.2431373, 1, 1,
0.3287786, -1.427158, 4.901307, 0, 0.2392157, 1, 1,
0.3347307, 1.244358, -0.5043601, 0, 0.2313726, 1, 1,
0.3353561, 0.169798, 0.2555706, 0, 0.227451, 1, 1,
0.3386451, -0.971439, 2.912092, 0, 0.2196078, 1, 1,
0.3391157, -0.8071308, 3.484038, 0, 0.2156863, 1, 1,
0.340078, -1.214855, 3.443002, 0, 0.2078431, 1, 1,
0.3417923, -0.4103671, 2.325841, 0, 0.2039216, 1, 1,
0.3420245, 1.216331, 1.26549, 0, 0.1960784, 1, 1,
0.3427337, -0.6548636, 2.95516, 0, 0.1882353, 1, 1,
0.3443447, 0.7829822, 1.652221, 0, 0.1843137, 1, 1,
0.3443467, -0.9127371, 2.165482, 0, 0.1764706, 1, 1,
0.3456833, 0.1127422, 3.239934, 0, 0.172549, 1, 1,
0.348943, -0.8070315, 1.416028, 0, 0.1647059, 1, 1,
0.3492223, 0.1821934, 1.991709, 0, 0.1607843, 1, 1,
0.3502812, 0.8606937, 0.4023414, 0, 0.1529412, 1, 1,
0.3560835, 1.635247, 0.495654, 0, 0.1490196, 1, 1,
0.3564793, 0.3436268, 1.373991, 0, 0.1411765, 1, 1,
0.3617582, -0.05954924, 2.0123, 0, 0.1372549, 1, 1,
0.364261, -0.3072864, 1.956585, 0, 0.1294118, 1, 1,
0.3665976, 1.822432, 1.692186, 0, 0.1254902, 1, 1,
0.3674029, -1.054043, 2.405072, 0, 0.1176471, 1, 1,
0.3685308, -0.4180434, 2.616111, 0, 0.1137255, 1, 1,
0.3710271, -2.889588, 1.80004, 0, 0.1058824, 1, 1,
0.373691, 0.4743735, 0.7705028, 0, 0.09803922, 1, 1,
0.3752191, 0.8937014, 0.8765244, 0, 0.09411765, 1, 1,
0.3773087, 0.531236, 2.173189, 0, 0.08627451, 1, 1,
0.3774756, 0.03553553, 0.8601246, 0, 0.08235294, 1, 1,
0.3790668, -0.5473554, 3.873164, 0, 0.07450981, 1, 1,
0.3792616, 0.9520383, 1.714871, 0, 0.07058824, 1, 1,
0.3824154, 1.391312, 0.8909571, 0, 0.0627451, 1, 1,
0.3863451, 0.6736246, -1.055169, 0, 0.05882353, 1, 1,
0.3864104, -0.721224, 3.26676, 0, 0.05098039, 1, 1,
0.3902277, 1.892439, 0.5928803, 0, 0.04705882, 1, 1,
0.3933023, 0.4908167, 1.558436, 0, 0.03921569, 1, 1,
0.3956302, 0.5786195, 1.330933, 0, 0.03529412, 1, 1,
0.4070794, 0.5972091, -0.6707921, 0, 0.02745098, 1, 1,
0.41448, 0.4539604, 1.161028, 0, 0.02352941, 1, 1,
0.4159295, -1.048455, 4.151043, 0, 0.01568628, 1, 1,
0.4180926, -0.6805641, 4.016081, 0, 0.01176471, 1, 1,
0.4239438, -0.364868, 1.80889, 0, 0.003921569, 1, 1,
0.4298453, -1.089445, 1.756794, 0.003921569, 0, 1, 1,
0.4352877, -0.6832456, 3.028656, 0.007843138, 0, 1, 1,
0.4359391, -1.315002, 0.1434146, 0.01568628, 0, 1, 1,
0.4378989, 1.561185, -1.448083, 0.01960784, 0, 1, 1,
0.4397604, -0.4140732, 0.9503797, 0.02745098, 0, 1, 1,
0.4441659, 1.324797, 3.237143, 0.03137255, 0, 1, 1,
0.4463455, 1.070415, 0.9931121, 0.03921569, 0, 1, 1,
0.4465975, -1.06617, 2.891825, 0.04313726, 0, 1, 1,
0.4469809, -0.4341832, 0.7365363, 0.05098039, 0, 1, 1,
0.4521014, 0.3407991, 2.455747, 0.05490196, 0, 1, 1,
0.4523836, 0.1436111, 0.8321698, 0.0627451, 0, 1, 1,
0.4525791, 1.064068, 1.835121, 0.06666667, 0, 1, 1,
0.45408, 1.791062, 1.284212, 0.07450981, 0, 1, 1,
0.4577327, -1.21885, 2.116632, 0.07843138, 0, 1, 1,
0.4621681, -0.6872118, 4.037303, 0.08627451, 0, 1, 1,
0.4640702, -0.8657279, 1.92401, 0.09019608, 0, 1, 1,
0.4660932, 0.006570182, 3.048129, 0.09803922, 0, 1, 1,
0.4772123, -0.433085, 2.176763, 0.1058824, 0, 1, 1,
0.4791348, -1.356506, 1.294843, 0.1098039, 0, 1, 1,
0.4807439, -0.4080547, 2.22978, 0.1176471, 0, 1, 1,
0.4917339, 0.6307325, 0.3703352, 0.1215686, 0, 1, 1,
0.4931115, -1.207283, 2.850785, 0.1294118, 0, 1, 1,
0.5031179, -1.604994, 3.343513, 0.1333333, 0, 1, 1,
0.5062134, 1.178702, 0.1370928, 0.1411765, 0, 1, 1,
0.5079001, -0.3144408, 1.215791, 0.145098, 0, 1, 1,
0.5082655, -0.8882279, 2.497604, 0.1529412, 0, 1, 1,
0.5093449, -1.634278, 0.9143177, 0.1568628, 0, 1, 1,
0.5093924, -1.069164, 3.327137, 0.1647059, 0, 1, 1,
0.5095018, 0.8317254, -0.3836248, 0.1686275, 0, 1, 1,
0.5118123, -0.4465123, 2.712731, 0.1764706, 0, 1, 1,
0.5145308, -0.940605, 0.6805221, 0.1803922, 0, 1, 1,
0.5166963, -0.07274377, 1.382348, 0.1882353, 0, 1, 1,
0.5202982, -1.108156, 2.019555, 0.1921569, 0, 1, 1,
0.5218297, -0.6352518, 3.05946, 0.2, 0, 1, 1,
0.5239349, 0.5222975, 1.509155, 0.2078431, 0, 1, 1,
0.5265102, -0.4444445, -0.7948813, 0.2117647, 0, 1, 1,
0.5337284, 0.3528513, 1.579854, 0.2196078, 0, 1, 1,
0.5382595, -0.0328299, 0.7862027, 0.2235294, 0, 1, 1,
0.5415918, 1.219046, 1.703755, 0.2313726, 0, 1, 1,
0.5422321, -2.001549, 1.884467, 0.2352941, 0, 1, 1,
0.5422978, -0.09670459, 0.3103993, 0.2431373, 0, 1, 1,
0.5456085, -1.610917, 3.592005, 0.2470588, 0, 1, 1,
0.548348, -1.455661, 3.078414, 0.254902, 0, 1, 1,
0.5494474, 1.740301, 0.1388832, 0.2588235, 0, 1, 1,
0.5513109, -0.001301853, 3.192088, 0.2666667, 0, 1, 1,
0.5543782, -0.5552518, 3.353292, 0.2705882, 0, 1, 1,
0.5548851, 1.633731, 0.114858, 0.2784314, 0, 1, 1,
0.5562613, 1.610265, 0.7622119, 0.282353, 0, 1, 1,
0.5586517, -0.3951622, 2.371913, 0.2901961, 0, 1, 1,
0.5589831, -0.9072407, 2.1918, 0.2941177, 0, 1, 1,
0.5611867, 0.9129894, -0.6645615, 0.3019608, 0, 1, 1,
0.5615767, 1.142434, 0.3943608, 0.3098039, 0, 1, 1,
0.563729, -0.7956248, 2.499005, 0.3137255, 0, 1, 1,
0.5679637, 0.08180935, 1.223208, 0.3215686, 0, 1, 1,
0.572935, 1.349488, 1.023799, 0.3254902, 0, 1, 1,
0.5784624, 1.076736, 1.069747, 0.3333333, 0, 1, 1,
0.5786442, -0.1369154, 2.729478, 0.3372549, 0, 1, 1,
0.5790256, -1.131812, 3.155307, 0.345098, 0, 1, 1,
0.5794871, -0.5465899, 1.927128, 0.3490196, 0, 1, 1,
0.5810087, 0.9670971, 0.1951798, 0.3568628, 0, 1, 1,
0.5811459, 0.1390149, 1.786792, 0.3607843, 0, 1, 1,
0.5816802, 0.6420358, -0.4403804, 0.3686275, 0, 1, 1,
0.5839336, -1.291174, 2.391423, 0.372549, 0, 1, 1,
0.5867055, 1.279839, 0.5060843, 0.3803922, 0, 1, 1,
0.5936534, 0.5724453, 1.300116, 0.3843137, 0, 1, 1,
0.5948506, -0.01684489, -0.007326847, 0.3921569, 0, 1, 1,
0.596131, -0.1879244, 2.169127, 0.3960784, 0, 1, 1,
0.5974276, -1.064573, 1.609316, 0.4039216, 0, 1, 1,
0.6059543, -1.606465, 2.510226, 0.4117647, 0, 1, 1,
0.6069234, 0.2483642, 1.455686, 0.4156863, 0, 1, 1,
0.6081111, -0.1410915, 2.647112, 0.4235294, 0, 1, 1,
0.6086712, 2.527305, 0.7100196, 0.427451, 0, 1, 1,
0.6149212, 0.7969359, 1.162816, 0.4352941, 0, 1, 1,
0.6201425, 0.9818616, 0.7387918, 0.4392157, 0, 1, 1,
0.6238068, 0.2856455, 2.661014, 0.4470588, 0, 1, 1,
0.6289836, -0.5976891, 3.302441, 0.4509804, 0, 1, 1,
0.6396327, 0.1564061, 1.108115, 0.4588235, 0, 1, 1,
0.6498372, 0.1372542, 1.886829, 0.4627451, 0, 1, 1,
0.6537235, -0.5639437, 2.402267, 0.4705882, 0, 1, 1,
0.6544824, 0.5805586, -0.9101944, 0.4745098, 0, 1, 1,
0.6548573, 1.151639, 0.2870763, 0.4823529, 0, 1, 1,
0.6564911, -0.462214, 2.689798, 0.4862745, 0, 1, 1,
0.6592121, -0.2124706, 1.629116, 0.4941176, 0, 1, 1,
0.6615564, 0.6685943, 2.512164, 0.5019608, 0, 1, 1,
0.6628621, -2.770456, 2.969714, 0.5058824, 0, 1, 1,
0.665278, 1.071117, -0.387601, 0.5137255, 0, 1, 1,
0.6741235, 1.533334, 0.5351477, 0.5176471, 0, 1, 1,
0.6805387, -0.1280431, 1.663884, 0.5254902, 0, 1, 1,
0.6828038, -1.034071, 2.755093, 0.5294118, 0, 1, 1,
0.6832647, 0.1276248, 2.901181, 0.5372549, 0, 1, 1,
0.684365, 0.4427741, 1.860865, 0.5411765, 0, 1, 1,
0.6862773, 1.829606, 0.9890669, 0.5490196, 0, 1, 1,
0.690829, -1.014204, 3.762383, 0.5529412, 0, 1, 1,
0.6947625, 0.5075537, 2.486674, 0.5607843, 0, 1, 1,
0.6958768, -0.9840667, 4.304854, 0.5647059, 0, 1, 1,
0.6976895, -1.56631, 1.055382, 0.572549, 0, 1, 1,
0.7038664, 0.7204083, 0.8432279, 0.5764706, 0, 1, 1,
0.7041974, 0.6380823, 1.636119, 0.5843138, 0, 1, 1,
0.7134162, 0.7033385, 0.6167327, 0.5882353, 0, 1, 1,
0.7141351, 0.4473244, 2.509738, 0.5960785, 0, 1, 1,
0.7179011, 0.8771879, 3.086386, 0.6039216, 0, 1, 1,
0.7197098, 1.159787, -0.2656673, 0.6078432, 0, 1, 1,
0.725521, -2.274477, 4.065005, 0.6156863, 0, 1, 1,
0.7284619, -0.8175736, 3.057443, 0.6196079, 0, 1, 1,
0.7332147, -0.1302895, 0.3079325, 0.627451, 0, 1, 1,
0.7454259, 0.4172501, 1.282959, 0.6313726, 0, 1, 1,
0.7458351, 1.872971, -1.448511, 0.6392157, 0, 1, 1,
0.7470556, 1.806726, 1.77956, 0.6431373, 0, 1, 1,
0.7478773, 1.377713, 0.212553, 0.6509804, 0, 1, 1,
0.759992, -1.030245, 3.436637, 0.654902, 0, 1, 1,
0.765394, -0.08718884, 3.616668, 0.6627451, 0, 1, 1,
0.7665364, -0.8794144, 3.587164, 0.6666667, 0, 1, 1,
0.7698466, -0.897779, 1.393165, 0.6745098, 0, 1, 1,
0.7720922, 0.8237619, 2.157372, 0.6784314, 0, 1, 1,
0.779827, 0.6581711, 0.8173134, 0.6862745, 0, 1, 1,
0.7828098, 1.402214, 1.531828, 0.6901961, 0, 1, 1,
0.7836739, -1.044629, 1.146651, 0.6980392, 0, 1, 1,
0.7864466, -0.7398197, 3.623453, 0.7058824, 0, 1, 1,
0.7896241, -0.5185, 1.895105, 0.7098039, 0, 1, 1,
0.7936525, 0.6627165, 0.8881527, 0.7176471, 0, 1, 1,
0.7977917, -0.7475864, 2.574804, 0.7215686, 0, 1, 1,
0.7984988, 0.6014985, 1.040194, 0.7294118, 0, 1, 1,
0.8038816, -1.093411, 2.738139, 0.7333333, 0, 1, 1,
0.8100845, 0.5986556, -0.4484035, 0.7411765, 0, 1, 1,
0.8124402, 0.6701752, 1.455379, 0.7450981, 0, 1, 1,
0.814269, -0.2599517, 2.394801, 0.7529412, 0, 1, 1,
0.818529, -0.5121767, 1.503552, 0.7568628, 0, 1, 1,
0.8204077, -0.4076144, 0.9948932, 0.7647059, 0, 1, 1,
0.8208682, 0.99592, 0.5628797, 0.7686275, 0, 1, 1,
0.8237208, 0.02646597, 0.9430625, 0.7764706, 0, 1, 1,
0.8259134, -1.015061, 2.498983, 0.7803922, 0, 1, 1,
0.8292272, 2.433602, 0.2763866, 0.7882353, 0, 1, 1,
0.8292522, -0.9930019, 2.896686, 0.7921569, 0, 1, 1,
0.8334891, -1.186363, 1.27651, 0.8, 0, 1, 1,
0.8364824, 1.448985, 0.5787438, 0.8078431, 0, 1, 1,
0.8370073, 1.284282, 1.836394, 0.8117647, 0, 1, 1,
0.8373114, 1.448664, 0.1435148, 0.8196079, 0, 1, 1,
0.8417683, 1.510516, 0.1430248, 0.8235294, 0, 1, 1,
0.843419, -1.601123, 1.813554, 0.8313726, 0, 1, 1,
0.8454002, 0.1690217, 0.291106, 0.8352941, 0, 1, 1,
0.845669, -0.8198863, 3.575067, 0.8431373, 0, 1, 1,
0.8461526, 0.4811714, 0.2914962, 0.8470588, 0, 1, 1,
0.8509336, -0.01022211, 1.04453, 0.854902, 0, 1, 1,
0.8544697, -0.4584523, 3.473981, 0.8588235, 0, 1, 1,
0.8584441, -1.974071, 0.8345684, 0.8666667, 0, 1, 1,
0.8589949, 0.6923803, 1.002993, 0.8705882, 0, 1, 1,
0.8612956, -0.4611424, 1.855409, 0.8784314, 0, 1, 1,
0.8659729, 1.963622, 0.3397291, 0.8823529, 0, 1, 1,
0.8674284, -0.2292007, 2.595257, 0.8901961, 0, 1, 1,
0.868088, 0.9835718, -0.2871546, 0.8941177, 0, 1, 1,
0.877911, 0.494133, 0.6016978, 0.9019608, 0, 1, 1,
0.8782113, 0.6015067, 1.626332, 0.9098039, 0, 1, 1,
0.8826321, -0.3088202, 1.542844, 0.9137255, 0, 1, 1,
0.884113, -0.6172448, 3.310482, 0.9215686, 0, 1, 1,
0.8860038, 0.6025754, 1.403053, 0.9254902, 0, 1, 1,
0.889517, 0.8142475, 0.7241485, 0.9333333, 0, 1, 1,
0.8921086, 0.2602165, 1.65356, 0.9372549, 0, 1, 1,
0.8944735, 0.1505298, 0.5470448, 0.945098, 0, 1, 1,
0.8960443, 0.9361355, 0.4624014, 0.9490196, 0, 1, 1,
0.9002916, 0.9984593, 1.987834, 0.9568627, 0, 1, 1,
0.9110436, -0.09020741, 0.7663282, 0.9607843, 0, 1, 1,
0.9118301, 1.173527, 1.003903, 0.9686275, 0, 1, 1,
0.9225823, -1.506184, 2.7386, 0.972549, 0, 1, 1,
0.9235404, 2.410146, 0.8086991, 0.9803922, 0, 1, 1,
0.9246105, -1.625289, 0.5575848, 0.9843137, 0, 1, 1,
0.9268645, 0.6307256, 2.946566, 0.9921569, 0, 1, 1,
0.930707, -0.7925208, 0.3510397, 0.9960784, 0, 1, 1,
0.9310912, 0.6166137, 1.57671, 1, 0, 0.9960784, 1,
0.9346519, -0.614286, 5.099325, 1, 0, 0.9882353, 1,
0.9392517, 0.8671079, -0.5687585, 1, 0, 0.9843137, 1,
0.9401192, 0.1803417, 2.632603, 1, 0, 0.9764706, 1,
0.950288, 0.8607536, 1.70985, 1, 0, 0.972549, 1,
0.962545, 0.3321147, 2.384267, 1, 0, 0.9647059, 1,
0.9737507, 0.7672848, -0.3768187, 1, 0, 0.9607843, 1,
0.9764905, 0.004085601, 2.95222, 1, 0, 0.9529412, 1,
0.9778945, -0.749042, 1.895559, 1, 0, 0.9490196, 1,
0.9781488, -1.068104, 3.191031, 1, 0, 0.9411765, 1,
0.9783965, -0.8025932, 2.035549, 1, 0, 0.9372549, 1,
0.9917105, 1.203722, 0.3168347, 1, 0, 0.9294118, 1,
0.993988, -0.07469382, 2.646014, 1, 0, 0.9254902, 1,
0.9985632, 1.137781, 1.19094, 1, 0, 0.9176471, 1,
1.000297, -0.1552499, 2.674335, 1, 0, 0.9137255, 1,
1.002293, -1.416534, 3.509206, 1, 0, 0.9058824, 1,
1.004662, 1.387231, 0.4733462, 1, 0, 0.9019608, 1,
1.00505, 0.9739516, 1.475693, 1, 0, 0.8941177, 1,
1.012499, -0.8041124, 2.587252, 1, 0, 0.8862745, 1,
1.013885, -1.020893, 1.946507, 1, 0, 0.8823529, 1,
1.027811, -0.4025336, 1.469509, 1, 0, 0.8745098, 1,
1.032389, 0.497872, 3.239584, 1, 0, 0.8705882, 1,
1.043699, -0.5114878, 3.387148, 1, 0, 0.8627451, 1,
1.046197, 0.9676779, 1.83092, 1, 0, 0.8588235, 1,
1.05264, 0.4422446, 2.004396, 1, 0, 0.8509804, 1,
1.062366, 1.552947, 1.703899, 1, 0, 0.8470588, 1,
1.067557, 1.011651, 1.016018, 1, 0, 0.8392157, 1,
1.067819, 0.6238809, 2.486919, 1, 0, 0.8352941, 1,
1.068841, -1.141544, 2.550674, 1, 0, 0.827451, 1,
1.078342, 1.429258, 0.7961426, 1, 0, 0.8235294, 1,
1.079032, 0.7274542, 0.1914421, 1, 0, 0.8156863, 1,
1.10252, 2.483678, -0.3838849, 1, 0, 0.8117647, 1,
1.104914, 1.61627, 0.4425605, 1, 0, 0.8039216, 1,
1.105862, 0.4458228, 1.395919, 1, 0, 0.7960784, 1,
1.106019, -1.553069, 1.426605, 1, 0, 0.7921569, 1,
1.108395, -0.04470053, 1.121226, 1, 0, 0.7843137, 1,
1.11046, 1.281385, -0.2574098, 1, 0, 0.7803922, 1,
1.111977, -0.5975832, 2.829304, 1, 0, 0.772549, 1,
1.114672, 0.8464077, 2.643524, 1, 0, 0.7686275, 1,
1.115886, -0.3382069, 0.9028725, 1, 0, 0.7607843, 1,
1.121635, 1.629012, 0.3824216, 1, 0, 0.7568628, 1,
1.121872, -2.568071, 2.417697, 1, 0, 0.7490196, 1,
1.122409, -1.178461, 2.112375, 1, 0, 0.7450981, 1,
1.12347, -1.420091, 1.342963, 1, 0, 0.7372549, 1,
1.132469, -0.4855611, 3.332201, 1, 0, 0.7333333, 1,
1.134487, 0.3458027, 2.021917, 1, 0, 0.7254902, 1,
1.145502, -1.396004, 2.755614, 1, 0, 0.7215686, 1,
1.154295, -0.4500632, 1.581519, 1, 0, 0.7137255, 1,
1.155228, 0.9944479, 2.099183, 1, 0, 0.7098039, 1,
1.158917, -0.1819985, 0.8355096, 1, 0, 0.7019608, 1,
1.160842, -2.187834, 3.823063, 1, 0, 0.6941177, 1,
1.162926, -0.6540222, 3.276688, 1, 0, 0.6901961, 1,
1.16387, -0.5304127, 2.655361, 1, 0, 0.682353, 1,
1.173892, 0.8400313, 0.1769842, 1, 0, 0.6784314, 1,
1.175274, 0.3404309, 1.248859, 1, 0, 0.6705883, 1,
1.178695, 1.14388, 0.06225668, 1, 0, 0.6666667, 1,
1.208166, -0.7036083, 2.285766, 1, 0, 0.6588235, 1,
1.222713, -0.1390489, 1.412649, 1, 0, 0.654902, 1,
1.224497, -1.497315, 2.237998, 1, 0, 0.6470588, 1,
1.226434, -1.528483, 3.905303, 1, 0, 0.6431373, 1,
1.232515, -0.2467937, -0.1906553, 1, 0, 0.6352941, 1,
1.234277, -1.419321, 1.777837, 1, 0, 0.6313726, 1,
1.237345, -1.662862, 2.025592, 1, 0, 0.6235294, 1,
1.23956, 1.36597, -0.2871895, 1, 0, 0.6196079, 1,
1.245503, 1.243895, 0.8750212, 1, 0, 0.6117647, 1,
1.249482, 0.5847878, 1.841165, 1, 0, 0.6078432, 1,
1.250262, 0.5776765, 2.52631, 1, 0, 0.6, 1,
1.25573, 1.363992, -0.4038355, 1, 0, 0.5921569, 1,
1.260057, -1.204794, 3.758558, 1, 0, 0.5882353, 1,
1.267085, 0.8311886, 0.4015056, 1, 0, 0.5803922, 1,
1.267946, 0.8182482, 0.6052383, 1, 0, 0.5764706, 1,
1.271544, -2.56934, 2.320298, 1, 0, 0.5686275, 1,
1.277263, 0.1737858, 0.3531894, 1, 0, 0.5647059, 1,
1.277921, 0.6144297, 0.1233228, 1, 0, 0.5568628, 1,
1.28521, 2.428004, -0.1535218, 1, 0, 0.5529412, 1,
1.297807, 0.07173663, 1.983194, 1, 0, 0.5450981, 1,
1.298576, 0.1398335, 1.279453, 1, 0, 0.5411765, 1,
1.311278, 0.4995299, 2.092572, 1, 0, 0.5333334, 1,
1.312521, 1.498057, 0.6333719, 1, 0, 0.5294118, 1,
1.317617, -0.01701975, 1.265319, 1, 0, 0.5215687, 1,
1.317643, 1.692331, -0.08137266, 1, 0, 0.5176471, 1,
1.332297, 0.5693762, 1.325302, 1, 0, 0.509804, 1,
1.336111, 1.12742, 0.356903, 1, 0, 0.5058824, 1,
1.336365, -0.4411968, 1.218489, 1, 0, 0.4980392, 1,
1.350975, -0.07132323, 0.9398215, 1, 0, 0.4901961, 1,
1.362606, 3.074849, 2.512127, 1, 0, 0.4862745, 1,
1.371284, -0.8672825, 0.7648507, 1, 0, 0.4784314, 1,
1.377159, -0.3533301, 2.587814, 1, 0, 0.4745098, 1,
1.383, -1.517272, 2.672238, 1, 0, 0.4666667, 1,
1.383996, 1.295537, 0.6124871, 1, 0, 0.4627451, 1,
1.38619, -0.2421231, 0.5337975, 1, 0, 0.454902, 1,
1.386762, 0.05827039, 1.451942, 1, 0, 0.4509804, 1,
1.394538, 0.4116101, 2.369859, 1, 0, 0.4431373, 1,
1.401938, 0.9526242, 0.1389879, 1, 0, 0.4392157, 1,
1.403678, 1.444, -0.4186065, 1, 0, 0.4313726, 1,
1.422776, 0.07618017, 1.508471, 1, 0, 0.427451, 1,
1.423528, -0.7047111, 1.637959, 1, 0, 0.4196078, 1,
1.425664, 1.002424, 1.388784, 1, 0, 0.4156863, 1,
1.432839, 0.3606267, 0.1511028, 1, 0, 0.4078431, 1,
1.457015, -0.3249429, 4.068768, 1, 0, 0.4039216, 1,
1.466089, -0.2799744, 1.856847, 1, 0, 0.3960784, 1,
1.470308, 0.06984835, 2.792978, 1, 0, 0.3882353, 1,
1.476276, -0.4827434, 1.670488, 1, 0, 0.3843137, 1,
1.481133, -0.392681, 1.059736, 1, 0, 0.3764706, 1,
1.500743, -0.4562282, 1.046003, 1, 0, 0.372549, 1,
1.533068, 0.5282431, 2.08856, 1, 0, 0.3647059, 1,
1.538088, 0.5816497, -0.7628165, 1, 0, 0.3607843, 1,
1.55313, 0.1023031, 0.9465637, 1, 0, 0.3529412, 1,
1.559473, -0.5276442, 0.7756405, 1, 0, 0.3490196, 1,
1.565344, 0.8266413, -1.375174, 1, 0, 0.3411765, 1,
1.572138, -0.1278251, 3.402863, 1, 0, 0.3372549, 1,
1.580484, 0.05464226, 1.771233, 1, 0, 0.3294118, 1,
1.599882, 0.08465359, 1.423412, 1, 0, 0.3254902, 1,
1.601778, -1.537851, 3.520584, 1, 0, 0.3176471, 1,
1.611616, 0.5494763, 1.938808, 1, 0, 0.3137255, 1,
1.616073, -0.4007596, 3.071424, 1, 0, 0.3058824, 1,
1.622475, -0.0687119, 0.6676828, 1, 0, 0.2980392, 1,
1.627355, -0.0192459, 1.997209, 1, 0, 0.2941177, 1,
1.6306, -1.078383, 2.961683, 1, 0, 0.2862745, 1,
1.633361, 0.01122266, 1.415642, 1, 0, 0.282353, 1,
1.640904, -0.3078609, 1.827468, 1, 0, 0.2745098, 1,
1.650765, 0.5149078, 1.631619, 1, 0, 0.2705882, 1,
1.65624, 0.5894579, 2.065705, 1, 0, 0.2627451, 1,
1.659817, 0.1560042, 1.487426, 1, 0, 0.2588235, 1,
1.661796, -0.7571589, 2.378015, 1, 0, 0.2509804, 1,
1.666141, -0.6375588, 1.359941, 1, 0, 0.2470588, 1,
1.690294, -1.840281, 1.769058, 1, 0, 0.2392157, 1,
1.69376, -0.3105719, 2.91921, 1, 0, 0.2352941, 1,
1.723956, -0.3722686, 1.427967, 1, 0, 0.227451, 1,
1.742881, -0.1298145, 1.307863, 1, 0, 0.2235294, 1,
1.744837, 1.224255, 0.2675909, 1, 0, 0.2156863, 1,
1.782663, 1.494954, 2.695875, 1, 0, 0.2117647, 1,
1.784971, -1.127744, 0.8399913, 1, 0, 0.2039216, 1,
1.795996, 1.021009, 0.255748, 1, 0, 0.1960784, 1,
1.797628, -1.542791, 2.196028, 1, 0, 0.1921569, 1,
1.816709, -1.238267, 3.641793, 1, 0, 0.1843137, 1,
1.817437, 0.6067865, 2.060409, 1, 0, 0.1803922, 1,
1.818908, -2.858866, 1.346056, 1, 0, 0.172549, 1,
1.82189, -1.117734, 2.525159, 1, 0, 0.1686275, 1,
1.823103, 1.003715, 0.6758229, 1, 0, 0.1607843, 1,
1.850085, 0.4454364, 1.478787, 1, 0, 0.1568628, 1,
1.873124, -0.3066805, 0.1667219, 1, 0, 0.1490196, 1,
1.878298, -1.97007, 3.970114, 1, 0, 0.145098, 1,
1.905002, -1.116352, 3.943317, 1, 0, 0.1372549, 1,
1.955495, 0.1476234, 2.103829, 1, 0, 0.1333333, 1,
1.968498, -1.030515, 1.509722, 1, 0, 0.1254902, 1,
2.001503, 0.7707782, 1.267787, 1, 0, 0.1215686, 1,
2.014118, 1.151411, 2.586079, 1, 0, 0.1137255, 1,
2.047446, 0.03807471, 1.715471, 1, 0, 0.1098039, 1,
2.062139, 0.5655529, 2.314952, 1, 0, 0.1019608, 1,
2.095372, -0.3550421, 1.05747, 1, 0, 0.09411765, 1,
2.184033, -1.198502, 3.470588, 1, 0, 0.09019608, 1,
2.214093, 3.005651, 2.104848, 1, 0, 0.08235294, 1,
2.353961, -0.1697641, 2.482126, 1, 0, 0.07843138, 1,
2.365076, 0.04286289, 1.686596, 1, 0, 0.07058824, 1,
2.376133, 0.9256976, 2.317798, 1, 0, 0.06666667, 1,
2.408958, -0.2024282, 1.10979, 1, 0, 0.05882353, 1,
2.422324, 0.276496, 2.781157, 1, 0, 0.05490196, 1,
2.449797, 0.6684975, -0.7144573, 1, 0, 0.04705882, 1,
2.482117, -0.7998347, 3.491141, 1, 0, 0.04313726, 1,
2.539889, 0.5422553, 2.153035, 1, 0, 0.03529412, 1,
2.578789, 0.5706396, 0.7980978, 1, 0, 0.03137255, 1,
2.720075, 0.8329226, 1.189313, 1, 0, 0.02352941, 1,
2.864479, -0.8897764, 0.5474092, 1, 0, 0.01960784, 1,
2.903265, -0.1062652, 2.061851, 1, 0, 0.01176471, 1,
3.068667, -0.2091157, 0.9974613, 1, 0, 0.007843138, 1
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
0.1033587, -3.91814, -6.745888, 0, -0.5, 0.5, 0.5,
0.1033587, -3.91814, -6.745888, 1, -0.5, 0.5, 0.5,
0.1033587, -3.91814, -6.745888, 1, 1.5, 0.5, 0.5,
0.1033587, -3.91814, -6.745888, 0, 1.5, 0.5, 0.5
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
-3.867189, 0.144489, -6.745888, 0, -0.5, 0.5, 0.5,
-3.867189, 0.144489, -6.745888, 1, -0.5, 0.5, 0.5,
-3.867189, 0.144489, -6.745888, 1, 1.5, 0.5, 0.5,
-3.867189, 0.144489, -6.745888, 0, 1.5, 0.5, 0.5
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
-3.867189, -3.91814, 0.4610631, 0, -0.5, 0.5, 0.5,
-3.867189, -3.91814, 0.4610631, 1, -0.5, 0.5, 0.5,
-3.867189, -3.91814, 0.4610631, 1, 1.5, 0.5, 0.5,
-3.867189, -3.91814, 0.4610631, 0, 1.5, 0.5, 0.5
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
-2, -2.98061, -5.082745,
3, -2.98061, -5.082745,
-2, -2.98061, -5.082745,
-2, -3.136865, -5.359936,
-1, -2.98061, -5.082745,
-1, -3.136865, -5.359936,
0, -2.98061, -5.082745,
0, -3.136865, -5.359936,
1, -2.98061, -5.082745,
1, -3.136865, -5.359936,
2, -2.98061, -5.082745,
2, -3.136865, -5.359936,
3, -2.98061, -5.082745,
3, -3.136865, -5.359936
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
-2, -3.449375, -5.914317, 0, -0.5, 0.5, 0.5,
-2, -3.449375, -5.914317, 1, -0.5, 0.5, 0.5,
-2, -3.449375, -5.914317, 1, 1.5, 0.5, 0.5,
-2, -3.449375, -5.914317, 0, 1.5, 0.5, 0.5,
-1, -3.449375, -5.914317, 0, -0.5, 0.5, 0.5,
-1, -3.449375, -5.914317, 1, -0.5, 0.5, 0.5,
-1, -3.449375, -5.914317, 1, 1.5, 0.5, 0.5,
-1, -3.449375, -5.914317, 0, 1.5, 0.5, 0.5,
0, -3.449375, -5.914317, 0, -0.5, 0.5, 0.5,
0, -3.449375, -5.914317, 1, -0.5, 0.5, 0.5,
0, -3.449375, -5.914317, 1, 1.5, 0.5, 0.5,
0, -3.449375, -5.914317, 0, 1.5, 0.5, 0.5,
1, -3.449375, -5.914317, 0, -0.5, 0.5, 0.5,
1, -3.449375, -5.914317, 1, -0.5, 0.5, 0.5,
1, -3.449375, -5.914317, 1, 1.5, 0.5, 0.5,
1, -3.449375, -5.914317, 0, 1.5, 0.5, 0.5,
2, -3.449375, -5.914317, 0, -0.5, 0.5, 0.5,
2, -3.449375, -5.914317, 1, -0.5, 0.5, 0.5,
2, -3.449375, -5.914317, 1, 1.5, 0.5, 0.5,
2, -3.449375, -5.914317, 0, 1.5, 0.5, 0.5,
3, -3.449375, -5.914317, 0, -0.5, 0.5, 0.5,
3, -3.449375, -5.914317, 1, -0.5, 0.5, 0.5,
3, -3.449375, -5.914317, 1, 1.5, 0.5, 0.5,
3, -3.449375, -5.914317, 0, 1.5, 0.5, 0.5
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
-2.950909, -2, -5.082745,
-2.950909, 3, -5.082745,
-2.950909, -2, -5.082745,
-3.103622, -2, -5.359936,
-2.950909, -1, -5.082745,
-3.103622, -1, -5.359936,
-2.950909, 0, -5.082745,
-3.103622, 0, -5.359936,
-2.950909, 1, -5.082745,
-3.103622, 1, -5.359936,
-2.950909, 2, -5.082745,
-3.103622, 2, -5.359936,
-2.950909, 3, -5.082745,
-3.103622, 3, -5.359936
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
-3.409049, -2, -5.914317, 0, -0.5, 0.5, 0.5,
-3.409049, -2, -5.914317, 1, -0.5, 0.5, 0.5,
-3.409049, -2, -5.914317, 1, 1.5, 0.5, 0.5,
-3.409049, -2, -5.914317, 0, 1.5, 0.5, 0.5,
-3.409049, -1, -5.914317, 0, -0.5, 0.5, 0.5,
-3.409049, -1, -5.914317, 1, -0.5, 0.5, 0.5,
-3.409049, -1, -5.914317, 1, 1.5, 0.5, 0.5,
-3.409049, -1, -5.914317, 0, 1.5, 0.5, 0.5,
-3.409049, 0, -5.914317, 0, -0.5, 0.5, 0.5,
-3.409049, 0, -5.914317, 1, -0.5, 0.5, 0.5,
-3.409049, 0, -5.914317, 1, 1.5, 0.5, 0.5,
-3.409049, 0, -5.914317, 0, 1.5, 0.5, 0.5,
-3.409049, 1, -5.914317, 0, -0.5, 0.5, 0.5,
-3.409049, 1, -5.914317, 1, -0.5, 0.5, 0.5,
-3.409049, 1, -5.914317, 1, 1.5, 0.5, 0.5,
-3.409049, 1, -5.914317, 0, 1.5, 0.5, 0.5,
-3.409049, 2, -5.914317, 0, -0.5, 0.5, 0.5,
-3.409049, 2, -5.914317, 1, -0.5, 0.5, 0.5,
-3.409049, 2, -5.914317, 1, 1.5, 0.5, 0.5,
-3.409049, 2, -5.914317, 0, 1.5, 0.5, 0.5,
-3.409049, 3, -5.914317, 0, -0.5, 0.5, 0.5,
-3.409049, 3, -5.914317, 1, -0.5, 0.5, 0.5,
-3.409049, 3, -5.914317, 1, 1.5, 0.5, 0.5,
-3.409049, 3, -5.914317, 0, 1.5, 0.5, 0.5
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
-2.950909, -2.98061, -4,
-2.950909, -2.98061, 4,
-2.950909, -2.98061, -4,
-3.103622, -3.136865, -4,
-2.950909, -2.98061, -2,
-3.103622, -3.136865, -2,
-2.950909, -2.98061, 0,
-3.103622, -3.136865, 0,
-2.950909, -2.98061, 2,
-3.103622, -3.136865, 2,
-2.950909, -2.98061, 4,
-3.103622, -3.136865, 4
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
-3.409049, -3.449375, -4, 0, -0.5, 0.5, 0.5,
-3.409049, -3.449375, -4, 1, -0.5, 0.5, 0.5,
-3.409049, -3.449375, -4, 1, 1.5, 0.5, 0.5,
-3.409049, -3.449375, -4, 0, 1.5, 0.5, 0.5,
-3.409049, -3.449375, -2, 0, -0.5, 0.5, 0.5,
-3.409049, -3.449375, -2, 1, -0.5, 0.5, 0.5,
-3.409049, -3.449375, -2, 1, 1.5, 0.5, 0.5,
-3.409049, -3.449375, -2, 0, 1.5, 0.5, 0.5,
-3.409049, -3.449375, 0, 0, -0.5, 0.5, 0.5,
-3.409049, -3.449375, 0, 1, -0.5, 0.5, 0.5,
-3.409049, -3.449375, 0, 1, 1.5, 0.5, 0.5,
-3.409049, -3.449375, 0, 0, 1.5, 0.5, 0.5,
-3.409049, -3.449375, 2, 0, -0.5, 0.5, 0.5,
-3.409049, -3.449375, 2, 1, -0.5, 0.5, 0.5,
-3.409049, -3.449375, 2, 1, 1.5, 0.5, 0.5,
-3.409049, -3.449375, 2, 0, 1.5, 0.5, 0.5,
-3.409049, -3.449375, 4, 0, -0.5, 0.5, 0.5,
-3.409049, -3.449375, 4, 1, -0.5, 0.5, 0.5,
-3.409049, -3.449375, 4, 1, 1.5, 0.5, 0.5,
-3.409049, -3.449375, 4, 0, 1.5, 0.5, 0.5
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
-2.950909, -2.98061, -5.082745,
-2.950909, 3.269588, -5.082745,
-2.950909, -2.98061, 6.004871,
-2.950909, 3.269588, 6.004871,
-2.950909, -2.98061, -5.082745,
-2.950909, -2.98061, 6.004871,
-2.950909, 3.269588, -5.082745,
-2.950909, 3.269588, 6.004871,
-2.950909, -2.98061, -5.082745,
3.157626, -2.98061, -5.082745,
-2.950909, -2.98061, 6.004871,
3.157626, -2.98061, 6.004871,
-2.950909, 3.269588, -5.082745,
3.157626, 3.269588, -5.082745,
-2.950909, 3.269588, 6.004871,
3.157626, 3.269588, 6.004871,
3.157626, -2.98061, -5.082745,
3.157626, 3.269588, -5.082745,
3.157626, -2.98061, 6.004871,
3.157626, 3.269588, 6.004871,
3.157626, -2.98061, -5.082745,
3.157626, -2.98061, 6.004871,
3.157626, 3.269588, -5.082745,
3.157626, 3.269588, 6.004871
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
var radius = 7.538672;
var distance = 33.5404;
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
mvMatrix.translate( -0.1033587, -0.144489, -0.4610631 );
mvMatrix.scale( 1.334356, 1.304112, 0.7351408 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.5404);
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
Disulfiram<-read.table("Disulfiram.xyz")
```

```
## Error in read.table("Disulfiram.xyz"): no lines available in input
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
-2.861949, 0.6870321, -0.04427499, 0, 0, 1, 1, 1,
-2.826663, -0.1811311, -0.5116265, 1, 0, 0, 1, 1,
-2.645609, -0.3129649, -1.692916, 1, 0, 0, 1, 1,
-2.592374, -1.753554, -2.876823, 1, 0, 0, 1, 1,
-2.57742, -2.229038, -1.45797, 1, 0, 0, 1, 1,
-2.572568, -0.2696619, -2.669127, 1, 0, 0, 1, 1,
-2.469909, 1.019635, -2.056662, 0, 0, 0, 1, 1,
-2.429433, 0.5227503, -2.491718, 0, 0, 0, 1, 1,
-2.414407, 1.288261, -3.293236, 0, 0, 0, 1, 1,
-2.30513, -1.968356, -2.92907, 0, 0, 0, 1, 1,
-2.200775, -1.47482, -2.59769, 0, 0, 0, 1, 1,
-2.187391, -1.462049, -3.025718, 0, 0, 0, 1, 1,
-2.168639, -0.308152, -2.593139, 0, 0, 0, 1, 1,
-2.148345, 0.1116251, -1.39076, 1, 1, 1, 1, 1,
-2.133779, 0.3634954, -2.205918, 1, 1, 1, 1, 1,
-2.076802, 0.9290959, -1.216163, 1, 1, 1, 1, 1,
-2.028505, 0.1834781, -0.03439688, 1, 1, 1, 1, 1,
-2.017581, -0.4891432, -2.004255, 1, 1, 1, 1, 1,
-2.015086, -0.7765127, -2.750153, 1, 1, 1, 1, 1,
-1.989881, -0.1486217, -1.835101, 1, 1, 1, 1, 1,
-1.968366, 0.5619509, 1.027815, 1, 1, 1, 1, 1,
-1.962389, 1.086204, -2.209905, 1, 1, 1, 1, 1,
-1.940193, 2.677149, -1.230809, 1, 1, 1, 1, 1,
-1.93339, 0.05094001, -1.937332, 1, 1, 1, 1, 1,
-1.92161, -0.9292387, -4.189614, 1, 1, 1, 1, 1,
-1.917829, -1.33865, -1.047604, 1, 1, 1, 1, 1,
-1.891016, 0.484087, -0.6212258, 1, 1, 1, 1, 1,
-1.849079, 1.438513, -0.640217, 1, 1, 1, 1, 1,
-1.827384, -0.7123787, -2.163898, 0, 0, 1, 1, 1,
-1.809095, 0.611919, 0.3733275, 1, 0, 0, 1, 1,
-1.80307, 0.2224983, -0.6132966, 1, 0, 0, 1, 1,
-1.790515, 0.2226177, -1.015505, 1, 0, 0, 1, 1,
-1.786514, -0.1220203, -2.27121, 1, 0, 0, 1, 1,
-1.782553, 1.151628, 0.5870085, 1, 0, 0, 1, 1,
-1.763575, -2.530298, -3.436397, 0, 0, 0, 1, 1,
-1.762718, 1.719443, -1.292962, 0, 0, 0, 1, 1,
-1.686286, -0.6312203, -2.197513, 0, 0, 0, 1, 1,
-1.661732, -0.1588304, -3.852571, 0, 0, 0, 1, 1,
-1.627952, 0.4542659, -0.6327804, 0, 0, 0, 1, 1,
-1.617119, 0.5893695, -0.5491598, 0, 0, 0, 1, 1,
-1.599923, 0.6524427, -1.416399, 0, 0, 0, 1, 1,
-1.584249, -1.717393, -0.5256067, 1, 1, 1, 1, 1,
-1.579335, -0.7045951, -0.8622256, 1, 1, 1, 1, 1,
-1.57626, -0.6307997, -1.459108, 1, 1, 1, 1, 1,
-1.55235, -1.150292, -1.615431, 1, 1, 1, 1, 1,
-1.535033, 0.6125681, 1.303792, 1, 1, 1, 1, 1,
-1.531056, 1.587481, -1.228993, 1, 1, 1, 1, 1,
-1.513358, 0.9514772, -2.427162, 1, 1, 1, 1, 1,
-1.508645, 0.09108528, 0.9943531, 1, 1, 1, 1, 1,
-1.504904, 1.826526, -1.352351, 1, 1, 1, 1, 1,
-1.501528, -1.599597, -1.729747, 1, 1, 1, 1, 1,
-1.482422, -0.3329276, -0.6327483, 1, 1, 1, 1, 1,
-1.467954, -0.7561972, -2.314209, 1, 1, 1, 1, 1,
-1.463827, 2.142458, 0.3362864, 1, 1, 1, 1, 1,
-1.458232, -0.9355142, -2.25386, 1, 1, 1, 1, 1,
-1.43652, -1.663886, -1.541514, 1, 1, 1, 1, 1,
-1.431275, -1.177565, -2.109046, 0, 0, 1, 1, 1,
-1.424476, -1.631644, -2.624369, 1, 0, 0, 1, 1,
-1.424228, -0.3646123, -0.9179854, 1, 0, 0, 1, 1,
-1.418687, 0.7975175, -0.7937777, 1, 0, 0, 1, 1,
-1.41404, 0.1037905, -1.087896, 1, 0, 0, 1, 1,
-1.409363, -1.601656, -2.300255, 1, 0, 0, 1, 1,
-1.408425, -0.51379, -2.207472, 0, 0, 0, 1, 1,
-1.402765, -0.7694409, -1.551602, 0, 0, 0, 1, 1,
-1.392009, 0.4509914, -2.352398, 0, 0, 0, 1, 1,
-1.384717, 1.646912, -0.5100863, 0, 0, 0, 1, 1,
-1.368295, 0.9698377, 0.2553732, 0, 0, 0, 1, 1,
-1.364991, 0.0544099, -0.5782305, 0, 0, 0, 1, 1,
-1.360123, 1.172972, -0.3049008, 0, 0, 0, 1, 1,
-1.355829, 0.9738311, 0.8367995, 1, 1, 1, 1, 1,
-1.353306, 1.440482, -0.9183141, 1, 1, 1, 1, 1,
-1.335206, 0.1483279, -2.165582, 1, 1, 1, 1, 1,
-1.329043, -0.05464688, -2.28878, 1, 1, 1, 1, 1,
-1.315265, -0.02972276, -1.070469, 1, 1, 1, 1, 1,
-1.307203, -1.732715, -3.199714, 1, 1, 1, 1, 1,
-1.305723, 0.1054495, 0.1385576, 1, 1, 1, 1, 1,
-1.302432, -0.6658692, -2.371269, 1, 1, 1, 1, 1,
-1.30174, -1.129745, -0.7114679, 1, 1, 1, 1, 1,
-1.283252, 2.750164, -1.010529, 1, 1, 1, 1, 1,
-1.281724, -0.5522822, -2.069349, 1, 1, 1, 1, 1,
-1.277396, 0.9616655, 0.3951528, 1, 1, 1, 1, 1,
-1.271175, -0.5646265, -2.021833, 1, 1, 1, 1, 1,
-1.254514, 0.1654443, -3.211336, 1, 1, 1, 1, 1,
-1.25361, -0.1322215, -0.4481881, 1, 1, 1, 1, 1,
-1.253048, -0.7787166, -1.955271, 0, 0, 1, 1, 1,
-1.24435, -0.3187566, -2.171838, 1, 0, 0, 1, 1,
-1.242241, 2.827242, 0.4403427, 1, 0, 0, 1, 1,
-1.237738, 0.5639585, -1.553704, 1, 0, 0, 1, 1,
-1.225894, -0.2322651, -2.500476, 1, 0, 0, 1, 1,
-1.225053, -0.478479, -1.577222, 1, 0, 0, 1, 1,
-1.217344, 0.8985531, -1.558012, 0, 0, 0, 1, 1,
-1.216862, 0.6152582, -1.576483, 0, 0, 0, 1, 1,
-1.208419, 0.2629273, -2.204582, 0, 0, 0, 1, 1,
-1.20634, 0.03281131, -2.224102, 0, 0, 0, 1, 1,
-1.202131, -1.517499, -1.705548, 0, 0, 0, 1, 1,
-1.197177, -0.2485294, -2.394319, 0, 0, 0, 1, 1,
-1.187517, -0.6846888, -1.644521, 0, 0, 0, 1, 1,
-1.185103, 0.4616846, -0.3558254, 1, 1, 1, 1, 1,
-1.165112, 0.5743235, 0.3681151, 1, 1, 1, 1, 1,
-1.156163, -1.11912, -1.310743, 1, 1, 1, 1, 1,
-1.151706, -0.6456228, -1.546116, 1, 1, 1, 1, 1,
-1.150888, 1.391878, -0.5111461, 1, 1, 1, 1, 1,
-1.148546, 1.859401, -1.00444, 1, 1, 1, 1, 1,
-1.147803, -0.6720297, -2.240751, 1, 1, 1, 1, 1,
-1.141472, 0.8066506, -1.702489, 1, 1, 1, 1, 1,
-1.137836, 1.987093, 0.8763352, 1, 1, 1, 1, 1,
-1.135842, 0.8106482, -0.4660709, 1, 1, 1, 1, 1,
-1.133777, 0.1446417, -0.6664648, 1, 1, 1, 1, 1,
-1.132702, 0.3925323, -3.041095, 1, 1, 1, 1, 1,
-1.124724, -0.6831864, -2.223808, 1, 1, 1, 1, 1,
-1.124551, -0.2737696, 0.07717633, 1, 1, 1, 1, 1,
-1.121803, -1.364968, -2.316496, 1, 1, 1, 1, 1,
-1.120213, 0.3434812, -0.4439054, 0, 0, 1, 1, 1,
-1.120064, 0.6767733, -1.274508, 1, 0, 0, 1, 1,
-1.111676, -0.7307516, -1.697362, 1, 0, 0, 1, 1,
-1.110191, -0.03399163, -0.6149588, 1, 0, 0, 1, 1,
-1.109921, -0.06972019, -3.080891, 1, 0, 0, 1, 1,
-1.109831, -0.6234156, -0.761037, 1, 0, 0, 1, 1,
-1.107667, -0.1445883, -2.529234, 0, 0, 0, 1, 1,
-1.1068, -1.775479, -1.852133, 0, 0, 0, 1, 1,
-1.10287, -0.1279148, -2.906148, 0, 0, 0, 1, 1,
-1.100574, 0.5961075, -1.682872, 0, 0, 0, 1, 1,
-1.098254, 1.246511, -1.772451, 0, 0, 0, 1, 1,
-1.094071, 2.07552, -2.247037, 0, 0, 0, 1, 1,
-1.09357, 0.4232543, -1.035408, 0, 0, 0, 1, 1,
-1.086677, -0.4466347, -2.030249, 1, 1, 1, 1, 1,
-1.084729, -1.313652, -2.101675, 1, 1, 1, 1, 1,
-1.083809, -0.7179027, -2.179244, 1, 1, 1, 1, 1,
-1.082157, -1.165942, -3.629354, 1, 1, 1, 1, 1,
-1.078894, -0.6417606, -0.4779405, 1, 1, 1, 1, 1,
-1.078672, 0.7641482, -2.188844, 1, 1, 1, 1, 1,
-1.078367, -1.313503, -3.39536, 1, 1, 1, 1, 1,
-1.077171, -1.499002, -1.314815, 1, 1, 1, 1, 1,
-1.07278, -1.150901, -4.394212, 1, 1, 1, 1, 1,
-1.05832, 1.252284, -1.032198, 1, 1, 1, 1, 1,
-1.054463, -1.370647, -3.327982, 1, 1, 1, 1, 1,
-1.039648, 1.396134, -0.5472959, 1, 1, 1, 1, 1,
-1.036556, 0.8961143, -0.8313435, 1, 1, 1, 1, 1,
-1.033267, -0.2058624, -2.98987, 1, 1, 1, 1, 1,
-1.030405, 1.271262, -4.155089, 1, 1, 1, 1, 1,
-1.024015, -0.1184636, -1.80576, 0, 0, 1, 1, 1,
-1.017589, -0.2565208, -2.115682, 1, 0, 0, 1, 1,
-1.016942, -0.859286, -1.551572, 1, 0, 0, 1, 1,
-1.015889, 0.1867031, -2.008947, 1, 0, 0, 1, 1,
-1.005973, -0.05724876, -2.109051, 1, 0, 0, 1, 1,
-0.9888713, -0.4119068, 0.5896655, 1, 0, 0, 1, 1,
-0.9857302, -0.8755613, -2.406581, 0, 0, 0, 1, 1,
-0.9814993, -2.096628, -0.6842435, 0, 0, 0, 1, 1,
-0.9764341, -0.6846234, -1.877307, 0, 0, 0, 1, 1,
-0.9764163, 1.222183, -1.654157, 0, 0, 0, 1, 1,
-0.9763464, -0.5512285, -1.495986, 0, 0, 0, 1, 1,
-0.9754776, 0.6183623, -0.528592, 0, 0, 0, 1, 1,
-0.9739117, 0.0438593, -3.172597, 0, 0, 0, 1, 1,
-0.9682257, -0.7294462, -2.488959, 1, 1, 1, 1, 1,
-0.9678599, -0.4388492, -0.9856524, 1, 1, 1, 1, 1,
-0.9664985, -0.8016469, -0.5550739, 1, 1, 1, 1, 1,
-0.9607984, 1.775745, -0.9560571, 1, 1, 1, 1, 1,
-0.9607127, 0.8609526, -1.562763, 1, 1, 1, 1, 1,
-0.9600107, -0.4062384, -0.4249565, 1, 1, 1, 1, 1,
-0.9594166, 1.003541, -0.9325092, 1, 1, 1, 1, 1,
-0.9583771, 1.635122, 0.4621256, 1, 1, 1, 1, 1,
-0.9515061, -1.85179, -1.614397, 1, 1, 1, 1, 1,
-0.9478135, -0.1824707, -2.344903, 1, 1, 1, 1, 1,
-0.947761, -0.678433, -2.087158, 1, 1, 1, 1, 1,
-0.9457729, -0.4738954, -2.742337, 1, 1, 1, 1, 1,
-0.9410276, 2.495007, -0.4849019, 1, 1, 1, 1, 1,
-0.9368443, 2.81642, -0.1365546, 1, 1, 1, 1, 1,
-0.9322946, -0.2320026, -2.421219, 1, 1, 1, 1, 1,
-0.9312432, 0.9308395, 0.3924272, 0, 0, 1, 1, 1,
-0.9245296, 0.621143, 0.482079, 1, 0, 0, 1, 1,
-0.9185816, 0.7587938, 0.7079083, 1, 0, 0, 1, 1,
-0.9170011, -1.234668, -4.189815, 1, 0, 0, 1, 1,
-0.9165812, 0.8642283, -0.1175665, 1, 0, 0, 1, 1,
-0.9079152, -0.4919743, -1.220521, 1, 0, 0, 1, 1,
-0.9074224, -0.8690576, -2.316136, 0, 0, 0, 1, 1,
-0.9062287, -0.3272871, -2.128197, 0, 0, 0, 1, 1,
-0.9023697, -1.770176, -2.109519, 0, 0, 0, 1, 1,
-0.900189, -1.853134, -2.57781, 0, 0, 0, 1, 1,
-0.8959248, -1.293926, -4.770396, 0, 0, 0, 1, 1,
-0.8827753, 1.102455, 0.7950975, 0, 0, 0, 1, 1,
-0.8809923, 1.573612, -0.3299213, 0, 0, 0, 1, 1,
-0.8757106, -1.011902, -2.061106, 1, 1, 1, 1, 1,
-0.875351, 1.093724, -1.611965, 1, 1, 1, 1, 1,
-0.8714352, 1.44431, -0.2007963, 1, 1, 1, 1, 1,
-0.8643861, -0.6037541, -2.323812, 1, 1, 1, 1, 1,
-0.8596217, -2.863021, -1.935925, 1, 1, 1, 1, 1,
-0.8583516, 1.541285, -0.7291241, 1, 1, 1, 1, 1,
-0.8577267, -1.007718, -3.302376, 1, 1, 1, 1, 1,
-0.8568378, 0.5022826, -0.4087417, 1, 1, 1, 1, 1,
-0.8551192, 0.229163, -0.7682475, 1, 1, 1, 1, 1,
-0.8524587, -0.5530187, -0.304957, 1, 1, 1, 1, 1,
-0.8431587, -1.818008, -2.718209, 1, 1, 1, 1, 1,
-0.8398588, -0.4433773, -2.087989, 1, 1, 1, 1, 1,
-0.8376167, 0.4535768, -1.010876, 1, 1, 1, 1, 1,
-0.8342219, -0.8090264, -1.907909, 1, 1, 1, 1, 1,
-0.8339796, -0.7707685, -2.419411, 1, 1, 1, 1, 1,
-0.8305568, -1.292172, -2.379804, 0, 0, 1, 1, 1,
-0.8298085, 0.3165661, -2.220224, 1, 0, 0, 1, 1,
-0.8263233, -1.068671, -0.9311749, 1, 0, 0, 1, 1,
-0.822001, 2.874619, -0.3672013, 1, 0, 0, 1, 1,
-0.8203835, 2.465942, 0.1076716, 1, 0, 0, 1, 1,
-0.819324, -0.5546374, -2.277962, 1, 0, 0, 1, 1,
-0.8128861, -0.1363527, -0.8848016, 0, 0, 0, 1, 1,
-0.8081559, 1.473246, -0.3976498, 0, 0, 0, 1, 1,
-0.8075354, -0.2224151, -2.326144, 0, 0, 0, 1, 1,
-0.8061763, -0.3340953, -0.9040614, 0, 0, 0, 1, 1,
-0.8061686, -0.6373875, -2.917642, 0, 0, 0, 1, 1,
-0.8050323, 1.076971, -3.17537, 0, 0, 0, 1, 1,
-0.8026878, -1.298015, -2.728751, 0, 0, 0, 1, 1,
-0.7983164, -0.1394993, -2.265123, 1, 1, 1, 1, 1,
-0.7980288, 0.1070437, -0.6752629, 1, 1, 1, 1, 1,
-0.7966239, 1.352948, -0.5010657, 1, 1, 1, 1, 1,
-0.7914354, 0.2195363, -1.03051, 1, 1, 1, 1, 1,
-0.7904224, 1.154277, -2.905133, 1, 1, 1, 1, 1,
-0.789472, 1.337464, -0.8257735, 1, 1, 1, 1, 1,
-0.7889727, 0.9483292, -1.650493, 1, 1, 1, 1, 1,
-0.7875783, -0.8874153, -3.17868, 1, 1, 1, 1, 1,
-0.7808005, -1.874922, -3.595121, 1, 1, 1, 1, 1,
-0.7636377, -1.222676, -2.305458, 1, 1, 1, 1, 1,
-0.7613404, -0.03551773, -1.872616, 1, 1, 1, 1, 1,
-0.760789, 0.2589052, -2.3521, 1, 1, 1, 1, 1,
-0.7598711, 0.03878362, -1.632081, 1, 1, 1, 1, 1,
-0.7586864, -1.282363, -2.183478, 1, 1, 1, 1, 1,
-0.7585015, 0.9600208, 1.039992, 1, 1, 1, 1, 1,
-0.7515686, 0.2802281, -0.6575906, 0, 0, 1, 1, 1,
-0.7439204, 0.3402658, -2.361546, 1, 0, 0, 1, 1,
-0.7430871, 0.6778147, 1.2686, 1, 0, 0, 1, 1,
-0.7399367, 0.2542424, -1.048542, 1, 0, 0, 1, 1,
-0.7382624, -0.6942735, -3.216627, 1, 0, 0, 1, 1,
-0.7376152, -0.1669089, -2.771706, 1, 0, 0, 1, 1,
-0.7349904, 1.516093, -0.2011989, 0, 0, 0, 1, 1,
-0.7323963, 2.315159, 0.465471, 0, 0, 0, 1, 1,
-0.7319956, 1.052773, -0.06548512, 0, 0, 0, 1, 1,
-0.7297522, 0.06278495, -2.753183, 0, 0, 0, 1, 1,
-0.7241331, 0.04185485, -0.8775422, 0, 0, 0, 1, 1,
-0.7067735, -0.2701856, -3.141088, 0, 0, 0, 1, 1,
-0.7064263, -0.8544201, -1.848294, 0, 0, 0, 1, 1,
-0.706393, 1.920075, -1.868524, 1, 1, 1, 1, 1,
-0.7026781, -1.039662, -1.914555, 1, 1, 1, 1, 1,
-0.6898351, 0.3092168, -0.527434, 1, 1, 1, 1, 1,
-0.6889812, 1.721473, -1.839812, 1, 1, 1, 1, 1,
-0.6782149, 0.1174732, -0.522878, 1, 1, 1, 1, 1,
-0.6774332, -2.188434, -2.18685, 1, 1, 1, 1, 1,
-0.6704358, 0.4729911, -1.02946, 1, 1, 1, 1, 1,
-0.6663293, -0.4554168, -1.514996, 1, 1, 1, 1, 1,
-0.6644484, -1.438286, -1.959235, 1, 1, 1, 1, 1,
-0.6533948, 0.2488317, -0.6667243, 1, 1, 1, 1, 1,
-0.6466523, -1.747051, -3.357029, 1, 1, 1, 1, 1,
-0.6430006, -0.9179045, -2.476543, 1, 1, 1, 1, 1,
-0.640225, -0.5272171, -2.774949, 1, 1, 1, 1, 1,
-0.6351323, -0.9621078, -1.657021, 1, 1, 1, 1, 1,
-0.6346736, 1.156706, -1.494105, 1, 1, 1, 1, 1,
-0.6345096, -0.3934937, 0.4251507, 0, 0, 1, 1, 1,
-0.6313819, 0.8435223, 0.03189748, 1, 0, 0, 1, 1,
-0.624693, -1.173169, -3.163536, 1, 0, 0, 1, 1,
-0.6193267, -1.097669, -1.52834, 1, 0, 0, 1, 1,
-0.6169555, 0.787316, -1.190818, 1, 0, 0, 1, 1,
-0.6119838, 1.786076, 1.272377, 1, 0, 0, 1, 1,
-0.6111075, 0.6607549, 0.9522378, 0, 0, 0, 1, 1,
-0.6096962, 1.513417, 0.506994, 0, 0, 0, 1, 1,
-0.6079091, -0.8282086, -1.37419, 0, 0, 0, 1, 1,
-0.6074255, -0.7496477, -1.06545, 0, 0, 0, 1, 1,
-0.6045616, 1.432405, -0.4251143, 0, 0, 0, 1, 1,
-0.5946443, 0.06437733, -1.243061, 0, 0, 0, 1, 1,
-0.5908206, -0.8222561, -2.641873, 0, 0, 0, 1, 1,
-0.5907063, -0.4209462, -3.061979, 1, 1, 1, 1, 1,
-0.5885072, 0.8984145, -2.404465, 1, 1, 1, 1, 1,
-0.58471, -1.018941, -2.90331, 1, 1, 1, 1, 1,
-0.5824211, -0.9690109, -2.233349, 1, 1, 1, 1, 1,
-0.5802259, 0.6822105, -1.9765, 1, 1, 1, 1, 1,
-0.5795961, 1.871347, 0.2918235, 1, 1, 1, 1, 1,
-0.5775763, -0.7942392, -2.087928, 1, 1, 1, 1, 1,
-0.5749522, -0.399835, -3.392698, 1, 1, 1, 1, 1,
-0.5744836, 0.4197871, -1.83431, 1, 1, 1, 1, 1,
-0.5692322, 0.5407333, -1.773831, 1, 1, 1, 1, 1,
-0.5649461, -0.6053943, -2.630254, 1, 1, 1, 1, 1,
-0.5637503, -0.2468882, -0.9773144, 1, 1, 1, 1, 1,
-0.5616526, 1.65721, -0.4227923, 1, 1, 1, 1, 1,
-0.5563341, -0.8462688, -1.501744, 1, 1, 1, 1, 1,
-0.5532759, -0.3496751, -1.389911, 1, 1, 1, 1, 1,
-0.5528965, 1.313247, 1.396303, 0, 0, 1, 1, 1,
-0.546699, 0.07102371, -0.9127436, 1, 0, 0, 1, 1,
-0.545153, 0.9126741, -0.6186949, 1, 0, 0, 1, 1,
-0.5445236, 0.4331451, -1.187451, 1, 0, 0, 1, 1,
-0.5435992, -1.764423, -2.634209, 1, 0, 0, 1, 1,
-0.5314224, -1.072265, -3.306999, 1, 0, 0, 1, 1,
-0.5280721, 0.1328303, 0.3815005, 0, 0, 0, 1, 1,
-0.5273482, -1.647272, -2.875654, 0, 0, 0, 1, 1,
-0.5272119, -1.57161, -1.247983, 0, 0, 0, 1, 1,
-0.5271245, -1.191152, -3.888933, 0, 0, 0, 1, 1,
-0.5249937, -0.3958407, -2.35073, 0, 0, 0, 1, 1,
-0.524522, 1.286124, 0.03386472, 0, 0, 0, 1, 1,
-0.5224678, -1.434342, -4.497386, 0, 0, 0, 1, 1,
-0.5216755, 0.295868, -0.9245776, 1, 1, 1, 1, 1,
-0.5213912, 0.05018069, -2.625459, 1, 1, 1, 1, 1,
-0.5203359, 0.7763172, 1.410355, 1, 1, 1, 1, 1,
-0.5194818, 1.304171, 0.9266322, 1, 1, 1, 1, 1,
-0.5102487, -0.3371475, -2.030606, 1, 1, 1, 1, 1,
-0.5059962, -1.712959, -3.685255, 1, 1, 1, 1, 1,
-0.5041069, -0.3815941, -2.367088, 1, 1, 1, 1, 1,
-0.5033502, -0.2359824, -4.683495, 1, 1, 1, 1, 1,
-0.5019121, 1.219581, -0.921149, 1, 1, 1, 1, 1,
-0.498798, 1.187611, -0.2483876, 1, 1, 1, 1, 1,
-0.4987107, -0.8220259, -3.719774, 1, 1, 1, 1, 1,
-0.4985449, 1.349453, 3.299644, 1, 1, 1, 1, 1,
-0.4985058, -1.157036, -2.266301, 1, 1, 1, 1, 1,
-0.4968883, -0.3509936, -2.548712, 1, 1, 1, 1, 1,
-0.4966206, 1.138952, -1.229148, 1, 1, 1, 1, 1,
-0.496349, 0.5965438, -0.8632467, 0, 0, 1, 1, 1,
-0.4916163, 1.364109, -1.229728, 1, 0, 0, 1, 1,
-0.4900987, -0.06236084, -1.687903, 1, 0, 0, 1, 1,
-0.4895192, 0.8811724, -0.51935, 1, 0, 0, 1, 1,
-0.4876793, -0.6471049, -4.63187, 1, 0, 0, 1, 1,
-0.4782832, -0.2808908, -2.837095, 1, 0, 0, 1, 1,
-0.4705274, 0.331676, -1.119287, 0, 0, 0, 1, 1,
-0.4660631, 0.6019255, -2.026218, 0, 0, 0, 1, 1,
-0.4622809, -1.771453, -3.260188, 0, 0, 0, 1, 1,
-0.4587446, 0.1947783, -1.87572, 0, 0, 0, 1, 1,
-0.4545945, 2.106504, 0.505164, 0, 0, 0, 1, 1,
-0.4515819, -0.3281414, -3.09841, 0, 0, 0, 1, 1,
-0.4456553, 1.383096, 0.7782917, 0, 0, 0, 1, 1,
-0.4445226, 0.4111408, -1.618505, 1, 1, 1, 1, 1,
-0.4310973, 1.264613, -0.9247772, 1, 1, 1, 1, 1,
-0.4270983, -0.193848, -2.132392, 1, 1, 1, 1, 1,
-0.4264651, 0.4587642, -0.7579123, 1, 1, 1, 1, 1,
-0.4165148, -0.5744523, -1.289982, 1, 1, 1, 1, 1,
-0.4161514, -1.054687, -3.393104, 1, 1, 1, 1, 1,
-0.4149421, 0.2925628, 0.120458, 1, 1, 1, 1, 1,
-0.4136994, 0.1365659, -0.5247492, 1, 1, 1, 1, 1,
-0.4133411, -0.925881, -2.209528, 1, 1, 1, 1, 1,
-0.413141, 0.4828649, 0.3351575, 1, 1, 1, 1, 1,
-0.4043964, -0.006110174, -1.202377, 1, 1, 1, 1, 1,
-0.4043114, 0.6660199, 0.01040453, 1, 1, 1, 1, 1,
-0.4023469, 0.0905759, -0.5394492, 1, 1, 1, 1, 1,
-0.4023313, -0.09916171, -0.8254065, 1, 1, 1, 1, 1,
-0.3997864, 0.115428, -1.03513, 1, 1, 1, 1, 1,
-0.3966426, 0.6370392, -0.4776176, 0, 0, 1, 1, 1,
-0.3906938, -0.4795648, -0.3737033, 1, 0, 0, 1, 1,
-0.3901588, 0.6650757, -0.5238279, 1, 0, 0, 1, 1,
-0.3831472, -1.399951, -0.8724954, 1, 0, 0, 1, 1,
-0.379306, 0.03773407, -2.015101, 1, 0, 0, 1, 1,
-0.3755887, 3.137879, 0.9675643, 1, 0, 0, 1, 1,
-0.3716901, 1.247481, -1.157569, 0, 0, 0, 1, 1,
-0.3699422, 0.7162433, 0.7664607, 0, 0, 0, 1, 1,
-0.3696166, 1.848119, -0.0517123, 0, 0, 0, 1, 1,
-0.3693809, -0.01521882, -1.130588, 0, 0, 0, 1, 1,
-0.3690158, 0.3081119, 1.401123, 0, 0, 0, 1, 1,
-0.3670768, -0.1060913, -0.9226964, 0, 0, 0, 1, 1,
-0.3630643, 0.925354, 0.2747712, 0, 0, 0, 1, 1,
-0.3616579, -0.6240423, -3.305919, 1, 1, 1, 1, 1,
-0.3592053, 0.6328954, -0.7974769, 1, 1, 1, 1, 1,
-0.3588708, -1.998962, -3.131025, 1, 1, 1, 1, 1,
-0.3578675, 0.8608132, 0.05426275, 1, 1, 1, 1, 1,
-0.3514298, -1.575675, -4.810089, 1, 1, 1, 1, 1,
-0.3459388, 0.9671407, -1.436684, 1, 1, 1, 1, 1,
-0.3453203, 0.8718741, 1.657851, 1, 1, 1, 1, 1,
-0.3441714, 0.5387806, -0.2931061, 1, 1, 1, 1, 1,
-0.3365069, -0.7879651, -3.487125, 1, 1, 1, 1, 1,
-0.3342599, 0.6111162, -0.3890557, 1, 1, 1, 1, 1,
-0.3330063, -2.128864, -2.675269, 1, 1, 1, 1, 1,
-0.3209046, 1.588827, 1.067454, 1, 1, 1, 1, 1,
-0.319895, 1.899773, -1.148272, 1, 1, 1, 1, 1,
-0.3186658, -0.0578942, -2.244055, 1, 1, 1, 1, 1,
-0.3138073, -2.283192, -3.417505, 1, 1, 1, 1, 1,
-0.312807, 1.156667, -0.5649252, 0, 0, 1, 1, 1,
-0.3093146, 1.121103, -0.1765304, 1, 0, 0, 1, 1,
-0.304838, 0.9505801, -1.034358, 1, 0, 0, 1, 1,
-0.3039527, -0.4642229, -0.8791679, 1, 0, 0, 1, 1,
-0.3024186, 0.05926985, -0.6602961, 1, 0, 0, 1, 1,
-0.3018429, -0.545792, -2.971976, 1, 0, 0, 1, 1,
-0.301106, -0.1190687, -1.398495, 0, 0, 0, 1, 1,
-0.295129, 0.5091158, 0.713675, 0, 0, 0, 1, 1,
-0.2931511, 2.420139, -1.394358, 0, 0, 0, 1, 1,
-0.2911053, 0.4933823, -1.296466, 0, 0, 0, 1, 1,
-0.2888958, -0.9697977, -2.99448, 0, 0, 0, 1, 1,
-0.2885515, 0.5107641, -0.7421752, 0, 0, 0, 1, 1,
-0.2883659, -0.433087, -2.848519, 0, 0, 0, 1, 1,
-0.287696, 0.001430732, -2.288161, 1, 1, 1, 1, 1,
-0.2875554, -0.8139552, -3.893032, 1, 1, 1, 1, 1,
-0.2821177, 1.620541, 0.2736104, 1, 1, 1, 1, 1,
-0.277328, -0.04525636, -1.942884, 1, 1, 1, 1, 1,
-0.2763235, -2.335394, -3.235238, 1, 1, 1, 1, 1,
-0.2723924, 0.9748847, -0.9395985, 1, 1, 1, 1, 1,
-0.2692378, -0.9708085, -2.560377, 1, 1, 1, 1, 1,
-0.2668247, 0.6552208, -1.347596, 1, 1, 1, 1, 1,
-0.2654617, -0.6037048, -1.725046, 1, 1, 1, 1, 1,
-0.2561314, 1.69562, 0.9046487, 1, 1, 1, 1, 1,
-0.2536063, 0.8996436, 0.4508103, 1, 1, 1, 1, 1,
-0.2493147, 1.070003, 1.363009, 1, 1, 1, 1, 1,
-0.2485387, -0.5812717, -2.882162, 1, 1, 1, 1, 1,
-0.2466965, 0.8284509, -0.7937458, 1, 1, 1, 1, 1,
-0.2460231, 0.5868275, 0.5916121, 1, 1, 1, 1, 1,
-0.2415071, 0.7563286, 0.6295522, 0, 0, 1, 1, 1,
-0.2395054, 0.7881818, 0.3861491, 1, 0, 0, 1, 1,
-0.2359326, -0.3911481, -2.368024, 1, 0, 0, 1, 1,
-0.231393, -0.8868744, -4.921275, 1, 0, 0, 1, 1,
-0.2293276, 0.583246, -0.009634242, 1, 0, 0, 1, 1,
-0.2278739, -0.6280545, -3.581742, 1, 0, 0, 1, 1,
-0.2263554, -0.05525924, -2.284234, 0, 0, 0, 1, 1,
-0.226144, -1.240984, -2.070228, 0, 0, 0, 1, 1,
-0.2221949, 0.1332713, -1.689633, 0, 0, 0, 1, 1,
-0.2210895, 1.092781, -0.01156907, 0, 0, 0, 1, 1,
-0.2196981, -0.9842284, 0.1238433, 0, 0, 0, 1, 1,
-0.2166096, -1.259115, -0.969863, 0, 0, 0, 1, 1,
-0.2160766, 1.101123, -1.007197, 0, 0, 0, 1, 1,
-0.2159938, -1.076769, -3.303626, 1, 1, 1, 1, 1,
-0.2156507, 1.814611, -0.1384716, 1, 1, 1, 1, 1,
-0.2025858, -0.3769291, -1.870956, 1, 1, 1, 1, 1,
-0.1997817, 0.1786204, -1.385127, 1, 1, 1, 1, 1,
-0.1980887, -0.8232858, -2.811414, 1, 1, 1, 1, 1,
-0.1963363, 0.1460921, 0.2830794, 1, 1, 1, 1, 1,
-0.1949619, 0.6154417, -0.9677743, 1, 1, 1, 1, 1,
-0.1941999, 1.09163, -0.2630078, 1, 1, 1, 1, 1,
-0.183784, 1.143167, 0.3252923, 1, 1, 1, 1, 1,
-0.1830107, -1.59336, -2.869349, 1, 1, 1, 1, 1,
-0.1809317, -0.4011365, -1.057238, 1, 1, 1, 1, 1,
-0.1795979, -1.674068, -3.689105, 1, 1, 1, 1, 1,
-0.1791697, 2.047836, -0.05191272, 1, 1, 1, 1, 1,
-0.1772531, -0.3449383, -3.805816, 1, 1, 1, 1, 1,
-0.1735696, 1.594443, 0.7067223, 1, 1, 1, 1, 1,
-0.1716688, -0.4532191, -4.11974, 0, 0, 1, 1, 1,
-0.1709445, 1.457762, -0.7807848, 1, 0, 0, 1, 1,
-0.1708712, 0.8773304, -1.153946, 1, 0, 0, 1, 1,
-0.1703449, 0.2303999, -2.181141, 1, 0, 0, 1, 1,
-0.1701455, -1.145459, -2.924901, 1, 0, 0, 1, 1,
-0.1673532, -1.64443, -3.750202, 1, 0, 0, 1, 1,
-0.1665984, -0.3984911, -1.357561, 0, 0, 0, 1, 1,
-0.1646317, 0.2511292, -0.06528144, 0, 0, 0, 1, 1,
-0.1639303, 0.5495708, -0.6681925, 0, 0, 0, 1, 1,
-0.162288, 2.282545, -0.1889649, 0, 0, 0, 1, 1,
-0.162259, 0.0167788, -0.9405662, 0, 0, 0, 1, 1,
-0.1591421, 0.7107739, -0.7654515, 0, 0, 0, 1, 1,
-0.1486259, -0.9183096, -4.171705, 0, 0, 0, 1, 1,
-0.1482835, -0.1550038, -3.619556, 1, 1, 1, 1, 1,
-0.1477121, -0.0691148, -1.655064, 1, 1, 1, 1, 1,
-0.1467411, -0.9886517, -3.511484, 1, 1, 1, 1, 1,
-0.1463356, -0.2693907, -2.718822, 1, 1, 1, 1, 1,
-0.144809, -1.976514, -2.381965, 1, 1, 1, 1, 1,
-0.1435309, -0.563942, -2.326262, 1, 1, 1, 1, 1,
-0.1404298, -1.354388, -3.692327, 1, 1, 1, 1, 1,
-0.1395192, 0.2072303, -1.896366, 1, 1, 1, 1, 1,
-0.1351382, 0.3317738, -0.9957632, 1, 1, 1, 1, 1,
-0.1351376, 1.092175, -1.303966, 1, 1, 1, 1, 1,
-0.1327479, -0.6476203, -3.899054, 1, 1, 1, 1, 1,
-0.1300174, 0.210861, -0.67983, 1, 1, 1, 1, 1,
-0.1275532, -0.1922484, -1.890191, 1, 1, 1, 1, 1,
-0.1251571, -0.1589911, -3.155314, 1, 1, 1, 1, 1,
-0.1214806, -0.5116234, -2.734347, 1, 1, 1, 1, 1,
-0.1171202, -0.2727737, -0.5453479, 0, 0, 1, 1, 1,
-0.1139395, -1.348472, -3.495887, 1, 0, 0, 1, 1,
-0.113789, 0.2052507, -0.6516591, 1, 0, 0, 1, 1,
-0.1104106, -1.344107, -1.558915, 1, 0, 0, 1, 1,
-0.1100585, -0.7051494, -2.194386, 1, 0, 0, 1, 1,
-0.1042261, 0.1642534, -1.975587, 1, 0, 0, 1, 1,
-0.1037773, -0.009095051, -1.835956, 0, 0, 0, 1, 1,
-0.1036802, 1.434738, 0.7050448, 0, 0, 0, 1, 1,
-0.09929992, -0.3475139, -3.94763, 0, 0, 0, 1, 1,
-0.09818092, 3.178566, -0.3468797, 0, 0, 0, 1, 1,
-0.09130858, -0.4846411, -0.9420288, 0, 0, 0, 1, 1,
-0.08793634, 0.09178185, -1.78356, 0, 0, 0, 1, 1,
-0.08552042, -0.6284688, -0.830133, 0, 0, 0, 1, 1,
-0.08337581, -0.2986624, -2.021384, 1, 1, 1, 1, 1,
-0.08207855, -0.544628, -3.439123, 1, 1, 1, 1, 1,
-0.08078448, 1.460164, 0.7087054, 1, 1, 1, 1, 1,
-0.08057899, -0.04236379, -1.990335, 1, 1, 1, 1, 1,
-0.07999319, 0.9501778, -0.4521033, 1, 1, 1, 1, 1,
-0.07820766, -0.967568, -2.013614, 1, 1, 1, 1, 1,
-0.07298783, 1.205823, -1.152157, 1, 1, 1, 1, 1,
-0.07287727, -0.4849797, -2.375956, 1, 1, 1, 1, 1,
-0.0724973, -0.9704353, -2.813068, 1, 1, 1, 1, 1,
-0.07082201, -0.05137609, -3.273951, 1, 1, 1, 1, 1,
-0.06607298, -0.8665603, -1.384335, 1, 1, 1, 1, 1,
-0.06314593, -0.5282559, -2.768972, 1, 1, 1, 1, 1,
-0.06076046, 0.752282, -0.9301943, 1, 1, 1, 1, 1,
-0.05673467, 1.568832, 1.020773, 1, 1, 1, 1, 1,
-0.05600139, 0.3371146, 0.7916933, 1, 1, 1, 1, 1,
-0.05079833, -1.576793, -2.361393, 0, 0, 1, 1, 1,
-0.0457956, -1.047878, -4.395157, 1, 0, 0, 1, 1,
-0.04531183, -1.286555, -3.488744, 1, 0, 0, 1, 1,
-0.04423637, 1.759558, -2.112683, 1, 0, 0, 1, 1,
-0.0436592, 0.8905011, -1.127648, 1, 0, 0, 1, 1,
-0.04075826, -0.1640853, -3.439798, 1, 0, 0, 1, 1,
-0.0373166, 1.544049, 0.6049438, 0, 0, 0, 1, 1,
-0.03699617, 2.896936, -0.1198649, 0, 0, 0, 1, 1,
-0.03674871, 2.257087, -0.5752516, 0, 0, 0, 1, 1,
-0.03654643, -1.235934, -2.866844, 0, 0, 0, 1, 1,
-0.03213113, -0.7454397, -3.687132, 0, 0, 0, 1, 1,
-0.02863371, 0.1730234, -0.9366195, 0, 0, 0, 1, 1,
-0.0271251, -0.5500036, -4.916922, 0, 0, 0, 1, 1,
-0.02137216, -0.7965227, -3.87783, 1, 1, 1, 1, 1,
-0.02124222, -0.7927465, -1.681853, 1, 1, 1, 1, 1,
-0.01793389, -1.578436, -3.858696, 1, 1, 1, 1, 1,
-0.01258334, -0.006050818, -2.58609, 1, 1, 1, 1, 1,
-0.01195129, 1.731186, 1.814894, 1, 1, 1, 1, 1,
-0.004260297, 0.03878386, 0.03513537, 1, 1, 1, 1, 1,
-0.003508185, 0.4824691, 3.026826, 1, 1, 1, 1, 1,
-0.002378449, -1.429831, -2.598425, 1, 1, 1, 1, 1,
-2.832359e-05, -1.961278, -3.320669, 1, 1, 1, 1, 1,
0.003494279, 0.5216395, 0.9258875, 1, 1, 1, 1, 1,
0.003698982, 0.9614657, -0.8952265, 1, 1, 1, 1, 1,
0.003887388, -1.200942, 3.087826, 1, 1, 1, 1, 1,
0.00466016, 0.05497607, 0.679686, 1, 1, 1, 1, 1,
0.006067222, -0.1771017, 4.7444, 1, 1, 1, 1, 1,
0.006091211, 0.3309714, -1.365787, 1, 1, 1, 1, 1,
0.007032097, 0.670004, -1.849641, 0, 0, 1, 1, 1,
0.01087386, -0.9689827, 3.469393, 1, 0, 0, 1, 1,
0.01384858, -2.656354, 2.155439, 1, 0, 0, 1, 1,
0.01500472, 1.043716, 0.131029, 1, 0, 0, 1, 1,
0.02344855, 0.2717469, 0.5277232, 1, 0, 0, 1, 1,
0.02378199, -0.9439114, 3.919691, 1, 0, 0, 1, 1,
0.02572058, 0.2984158, -2.147224, 0, 0, 0, 1, 1,
0.03001241, -0.96699, 2.671631, 0, 0, 0, 1, 1,
0.03040401, 1.323791, 0.3922819, 0, 0, 0, 1, 1,
0.03045065, 0.3856651, 0.8114433, 0, 0, 0, 1, 1,
0.03652985, -0.2759947, 0.8217958, 0, 0, 0, 1, 1,
0.03824148, 1.236225, 0.5102909, 0, 0, 0, 1, 1,
0.04148797, 2.789505, -0.05126736, 0, 0, 0, 1, 1,
0.042094, -0.9127084, 5.843401, 1, 1, 1, 1, 1,
0.04410606, 0.1709245, 1.386854, 1, 1, 1, 1, 1,
0.04432926, -1.075975, 2.279824, 1, 1, 1, 1, 1,
0.04529134, -0.2433609, 3.03521, 1, 1, 1, 1, 1,
0.04910009, 1.837114, 0.2220449, 1, 1, 1, 1, 1,
0.04948933, -0.8269861, 3.758857, 1, 1, 1, 1, 1,
0.05046165, 2.022225, 0.06799659, 1, 1, 1, 1, 1,
0.0586867, -0.5221421, 3.831109, 1, 1, 1, 1, 1,
0.06168612, -2.364126, 2.671363, 1, 1, 1, 1, 1,
0.0617627, 0.009971681, 2.067801, 1, 1, 1, 1, 1,
0.06236208, 0.8497645, 0.7797196, 1, 1, 1, 1, 1,
0.06640509, -1.228253, 4.074206, 1, 1, 1, 1, 1,
0.07343257, 0.5493672, 0.303589, 1, 1, 1, 1, 1,
0.07345863, -0.05525786, 1.90173, 1, 1, 1, 1, 1,
0.07776242, 1.672096, -0.006161409, 1, 1, 1, 1, 1,
0.07981487, -1.179719, 3.188375, 0, 0, 1, 1, 1,
0.07991364, -0.2145963, 3.873423, 1, 0, 0, 1, 1,
0.08087122, 2.343931, -1.654917, 1, 0, 0, 1, 1,
0.08262337, 0.09146733, 0.1118848, 1, 0, 0, 1, 1,
0.08472922, -0.77832, 0.682077, 1, 0, 0, 1, 1,
0.08602452, 0.4448453, -1.486949, 1, 0, 0, 1, 1,
0.08773287, -0.007901368, 2.270644, 0, 0, 0, 1, 1,
0.08812351, 1.30658, -1.049436, 0, 0, 0, 1, 1,
0.0883815, -0.5251638, 2.537322, 0, 0, 0, 1, 1,
0.08942663, 1.077608, -0.7208516, 0, 0, 0, 1, 1,
0.08990418, 1.136499, 2.373075, 0, 0, 0, 1, 1,
0.09739448, 2.170047, 0.6670898, 0, 0, 0, 1, 1,
0.09956453, -0.3828712, 4.008011, 0, 0, 0, 1, 1,
0.1026064, 1.290482, 1.770341, 1, 1, 1, 1, 1,
0.123969, -0.1463183, 1.360048, 1, 1, 1, 1, 1,
0.131146, 0.09366456, 0.2746222, 1, 1, 1, 1, 1,
0.1313558, -0.1411133, 2.648809, 1, 1, 1, 1, 1,
0.1319416, 0.2220422, 1.377084, 1, 1, 1, 1, 1,
0.1324997, 0.9715884, 0.1649, 1, 1, 1, 1, 1,
0.1348349, -0.7287527, 3.397368, 1, 1, 1, 1, 1,
0.1357855, 1.881873, -0.03755546, 1, 1, 1, 1, 1,
0.1395649, 0.3194281, 0.7481762, 1, 1, 1, 1, 1,
0.1416802, -0.5217357, 3.523315, 1, 1, 1, 1, 1,
0.1431166, 1.363579, -2.289316, 1, 1, 1, 1, 1,
0.1456126, -1.436376, 2.953359, 1, 1, 1, 1, 1,
0.1477146, 0.5809308, -2.41933, 1, 1, 1, 1, 1,
0.1480827, -2.144892, 1.804001, 1, 1, 1, 1, 1,
0.1483027, -0.3227219, 2.566771, 1, 1, 1, 1, 1,
0.148778, 0.4555502, 1.055367, 0, 0, 1, 1, 1,
0.1491736, 0.8877175, -0.549765, 1, 0, 0, 1, 1,
0.1562478, 1.454746, -0.4145253, 1, 0, 0, 1, 1,
0.160968, 1.142335, -0.05556541, 1, 0, 0, 1, 1,
0.1628241, -0.5458721, 2.997581, 1, 0, 0, 1, 1,
0.1635838, 0.2077051, 1.593226, 1, 0, 0, 1, 1,
0.1687165, 0.7148743, -0.5288482, 0, 0, 0, 1, 1,
0.1690881, 1.288274, 0.261848, 0, 0, 0, 1, 1,
0.1720827, 0.1938307, 0.3023787, 0, 0, 0, 1, 1,
0.1788428, 1.211744, -0.7769192, 0, 0, 0, 1, 1,
0.1834474, -0.5349122, 3.785489, 0, 0, 0, 1, 1,
0.1868502, -0.001661053, 1.014008, 0, 0, 0, 1, 1,
0.1973702, -0.6381307, 3.010128, 0, 0, 0, 1, 1,
0.2003202, 0.5809635, 0.732381, 1, 1, 1, 1, 1,
0.2073261, -1.791267, 2.658158, 1, 1, 1, 1, 1,
0.2077247, 0.9943519, -0.8758564, 1, 1, 1, 1, 1,
0.2151708, -0.2429922, 0.6669649, 1, 1, 1, 1, 1,
0.2177217, -0.1415523, 2.29872, 1, 1, 1, 1, 1,
0.2205889, 0.2698622, -1.442234, 1, 1, 1, 1, 1,
0.2214614, -0.04127192, 1.570274, 1, 1, 1, 1, 1,
0.2319272, -0.6545167, 4.105268, 1, 1, 1, 1, 1,
0.2327593, 1.017136, -0.686839, 1, 1, 1, 1, 1,
0.2379483, -0.7627733, 4.028232, 1, 1, 1, 1, 1,
0.238433, -1.411338, 2.951381, 1, 1, 1, 1, 1,
0.2390249, 0.8284541, 0.6433729, 1, 1, 1, 1, 1,
0.2390405, 0.2256047, -0.236755, 1, 1, 1, 1, 1,
0.2403524, -1.903641, 3.979183, 1, 1, 1, 1, 1,
0.2420325, 1.240049, 1.743177, 1, 1, 1, 1, 1,
0.242448, 1.03279, -0.3132381, 0, 0, 1, 1, 1,
0.2437022, -0.1369147, 2.941951, 1, 0, 0, 1, 1,
0.2444829, -1.316041, 1.973904, 1, 0, 0, 1, 1,
0.2446344, 0.2979346, 0.399415, 1, 0, 0, 1, 1,
0.2468927, -0.5458868, 1.207967, 1, 0, 0, 1, 1,
0.2495979, -0.5630569, 1.679144, 1, 0, 0, 1, 1,
0.2526951, 0.55348, -1.403615, 0, 0, 0, 1, 1,
0.2555747, -0.4779995, 3.4626, 0, 0, 0, 1, 1,
0.2562467, 0.07142833, 1.172588, 0, 0, 0, 1, 1,
0.2605644, -0.3615485, 1.554789, 0, 0, 0, 1, 1,
0.2616923, -2.560769, 2.605364, 0, 0, 0, 1, 1,
0.2627787, 0.6248548, -0.6610479, 0, 0, 0, 1, 1,
0.265078, 1.40275, -0.1443959, 0, 0, 0, 1, 1,
0.2653139, 0.6923011, 1.19602, 1, 1, 1, 1, 1,
0.2654759, -2.126011, 2.744932, 1, 1, 1, 1, 1,
0.2663835, 0.298061, -1.590691, 1, 1, 1, 1, 1,
0.2719769, 1.509921, 0.3983751, 1, 1, 1, 1, 1,
0.2725612, -0.2848798, 2.804608, 1, 1, 1, 1, 1,
0.2728065, 1.455444, -0.7309259, 1, 1, 1, 1, 1,
0.2735888, 0.1980982, 2.37708, 1, 1, 1, 1, 1,
0.2737877, 1.456825, -0.362421, 1, 1, 1, 1, 1,
0.2770622, -1.654192, 2.629733, 1, 1, 1, 1, 1,
0.279455, 0.2339532, -0.7171765, 1, 1, 1, 1, 1,
0.2873628, -0.8482164, 2.325861, 1, 1, 1, 1, 1,
0.2877024, -0.2754639, 3.277746, 1, 1, 1, 1, 1,
0.2902555, 0.7681836, -0.8559541, 1, 1, 1, 1, 1,
0.2903294, 1.447839, -1.330003, 1, 1, 1, 1, 1,
0.2936568, -1.195799, 3.440199, 1, 1, 1, 1, 1,
0.2972252, 1.390083, -0.7337226, 0, 0, 1, 1, 1,
0.2972938, -0.7426067, 4.456208, 1, 0, 0, 1, 1,
0.3012763, 0.2701857, 1.183816, 1, 0, 0, 1, 1,
0.3046915, -0.9653957, 1.569994, 1, 0, 0, 1, 1,
0.3064113, 0.8351966, 2.243208, 1, 0, 0, 1, 1,
0.3080506, 1.108141, 0.5166416, 1, 0, 0, 1, 1,
0.3086097, -0.2213634, 2.136607, 0, 0, 0, 1, 1,
0.3222048, 2.785468, 0.4859467, 0, 0, 0, 1, 1,
0.3226939, -1.233766, 2.743109, 0, 0, 0, 1, 1,
0.3280953, -0.6608348, 1.267221, 0, 0, 0, 1, 1,
0.328377, 0.8114554, 2.065172, 0, 0, 0, 1, 1,
0.3287786, -1.427158, 4.901307, 0, 0, 0, 1, 1,
0.3347307, 1.244358, -0.5043601, 0, 0, 0, 1, 1,
0.3353561, 0.169798, 0.2555706, 1, 1, 1, 1, 1,
0.3386451, -0.971439, 2.912092, 1, 1, 1, 1, 1,
0.3391157, -0.8071308, 3.484038, 1, 1, 1, 1, 1,
0.340078, -1.214855, 3.443002, 1, 1, 1, 1, 1,
0.3417923, -0.4103671, 2.325841, 1, 1, 1, 1, 1,
0.3420245, 1.216331, 1.26549, 1, 1, 1, 1, 1,
0.3427337, -0.6548636, 2.95516, 1, 1, 1, 1, 1,
0.3443447, 0.7829822, 1.652221, 1, 1, 1, 1, 1,
0.3443467, -0.9127371, 2.165482, 1, 1, 1, 1, 1,
0.3456833, 0.1127422, 3.239934, 1, 1, 1, 1, 1,
0.348943, -0.8070315, 1.416028, 1, 1, 1, 1, 1,
0.3492223, 0.1821934, 1.991709, 1, 1, 1, 1, 1,
0.3502812, 0.8606937, 0.4023414, 1, 1, 1, 1, 1,
0.3560835, 1.635247, 0.495654, 1, 1, 1, 1, 1,
0.3564793, 0.3436268, 1.373991, 1, 1, 1, 1, 1,
0.3617582, -0.05954924, 2.0123, 0, 0, 1, 1, 1,
0.364261, -0.3072864, 1.956585, 1, 0, 0, 1, 1,
0.3665976, 1.822432, 1.692186, 1, 0, 0, 1, 1,
0.3674029, -1.054043, 2.405072, 1, 0, 0, 1, 1,
0.3685308, -0.4180434, 2.616111, 1, 0, 0, 1, 1,
0.3710271, -2.889588, 1.80004, 1, 0, 0, 1, 1,
0.373691, 0.4743735, 0.7705028, 0, 0, 0, 1, 1,
0.3752191, 0.8937014, 0.8765244, 0, 0, 0, 1, 1,
0.3773087, 0.531236, 2.173189, 0, 0, 0, 1, 1,
0.3774756, 0.03553553, 0.8601246, 0, 0, 0, 1, 1,
0.3790668, -0.5473554, 3.873164, 0, 0, 0, 1, 1,
0.3792616, 0.9520383, 1.714871, 0, 0, 0, 1, 1,
0.3824154, 1.391312, 0.8909571, 0, 0, 0, 1, 1,
0.3863451, 0.6736246, -1.055169, 1, 1, 1, 1, 1,
0.3864104, -0.721224, 3.26676, 1, 1, 1, 1, 1,
0.3902277, 1.892439, 0.5928803, 1, 1, 1, 1, 1,
0.3933023, 0.4908167, 1.558436, 1, 1, 1, 1, 1,
0.3956302, 0.5786195, 1.330933, 1, 1, 1, 1, 1,
0.4070794, 0.5972091, -0.6707921, 1, 1, 1, 1, 1,
0.41448, 0.4539604, 1.161028, 1, 1, 1, 1, 1,
0.4159295, -1.048455, 4.151043, 1, 1, 1, 1, 1,
0.4180926, -0.6805641, 4.016081, 1, 1, 1, 1, 1,
0.4239438, -0.364868, 1.80889, 1, 1, 1, 1, 1,
0.4298453, -1.089445, 1.756794, 1, 1, 1, 1, 1,
0.4352877, -0.6832456, 3.028656, 1, 1, 1, 1, 1,
0.4359391, -1.315002, 0.1434146, 1, 1, 1, 1, 1,
0.4378989, 1.561185, -1.448083, 1, 1, 1, 1, 1,
0.4397604, -0.4140732, 0.9503797, 1, 1, 1, 1, 1,
0.4441659, 1.324797, 3.237143, 0, 0, 1, 1, 1,
0.4463455, 1.070415, 0.9931121, 1, 0, 0, 1, 1,
0.4465975, -1.06617, 2.891825, 1, 0, 0, 1, 1,
0.4469809, -0.4341832, 0.7365363, 1, 0, 0, 1, 1,
0.4521014, 0.3407991, 2.455747, 1, 0, 0, 1, 1,
0.4523836, 0.1436111, 0.8321698, 1, 0, 0, 1, 1,
0.4525791, 1.064068, 1.835121, 0, 0, 0, 1, 1,
0.45408, 1.791062, 1.284212, 0, 0, 0, 1, 1,
0.4577327, -1.21885, 2.116632, 0, 0, 0, 1, 1,
0.4621681, -0.6872118, 4.037303, 0, 0, 0, 1, 1,
0.4640702, -0.8657279, 1.92401, 0, 0, 0, 1, 1,
0.4660932, 0.006570182, 3.048129, 0, 0, 0, 1, 1,
0.4772123, -0.433085, 2.176763, 0, 0, 0, 1, 1,
0.4791348, -1.356506, 1.294843, 1, 1, 1, 1, 1,
0.4807439, -0.4080547, 2.22978, 1, 1, 1, 1, 1,
0.4917339, 0.6307325, 0.3703352, 1, 1, 1, 1, 1,
0.4931115, -1.207283, 2.850785, 1, 1, 1, 1, 1,
0.5031179, -1.604994, 3.343513, 1, 1, 1, 1, 1,
0.5062134, 1.178702, 0.1370928, 1, 1, 1, 1, 1,
0.5079001, -0.3144408, 1.215791, 1, 1, 1, 1, 1,
0.5082655, -0.8882279, 2.497604, 1, 1, 1, 1, 1,
0.5093449, -1.634278, 0.9143177, 1, 1, 1, 1, 1,
0.5093924, -1.069164, 3.327137, 1, 1, 1, 1, 1,
0.5095018, 0.8317254, -0.3836248, 1, 1, 1, 1, 1,
0.5118123, -0.4465123, 2.712731, 1, 1, 1, 1, 1,
0.5145308, -0.940605, 0.6805221, 1, 1, 1, 1, 1,
0.5166963, -0.07274377, 1.382348, 1, 1, 1, 1, 1,
0.5202982, -1.108156, 2.019555, 1, 1, 1, 1, 1,
0.5218297, -0.6352518, 3.05946, 0, 0, 1, 1, 1,
0.5239349, 0.5222975, 1.509155, 1, 0, 0, 1, 1,
0.5265102, -0.4444445, -0.7948813, 1, 0, 0, 1, 1,
0.5337284, 0.3528513, 1.579854, 1, 0, 0, 1, 1,
0.5382595, -0.0328299, 0.7862027, 1, 0, 0, 1, 1,
0.5415918, 1.219046, 1.703755, 1, 0, 0, 1, 1,
0.5422321, -2.001549, 1.884467, 0, 0, 0, 1, 1,
0.5422978, -0.09670459, 0.3103993, 0, 0, 0, 1, 1,
0.5456085, -1.610917, 3.592005, 0, 0, 0, 1, 1,
0.548348, -1.455661, 3.078414, 0, 0, 0, 1, 1,
0.5494474, 1.740301, 0.1388832, 0, 0, 0, 1, 1,
0.5513109, -0.001301853, 3.192088, 0, 0, 0, 1, 1,
0.5543782, -0.5552518, 3.353292, 0, 0, 0, 1, 1,
0.5548851, 1.633731, 0.114858, 1, 1, 1, 1, 1,
0.5562613, 1.610265, 0.7622119, 1, 1, 1, 1, 1,
0.5586517, -0.3951622, 2.371913, 1, 1, 1, 1, 1,
0.5589831, -0.9072407, 2.1918, 1, 1, 1, 1, 1,
0.5611867, 0.9129894, -0.6645615, 1, 1, 1, 1, 1,
0.5615767, 1.142434, 0.3943608, 1, 1, 1, 1, 1,
0.563729, -0.7956248, 2.499005, 1, 1, 1, 1, 1,
0.5679637, 0.08180935, 1.223208, 1, 1, 1, 1, 1,
0.572935, 1.349488, 1.023799, 1, 1, 1, 1, 1,
0.5784624, 1.076736, 1.069747, 1, 1, 1, 1, 1,
0.5786442, -0.1369154, 2.729478, 1, 1, 1, 1, 1,
0.5790256, -1.131812, 3.155307, 1, 1, 1, 1, 1,
0.5794871, -0.5465899, 1.927128, 1, 1, 1, 1, 1,
0.5810087, 0.9670971, 0.1951798, 1, 1, 1, 1, 1,
0.5811459, 0.1390149, 1.786792, 1, 1, 1, 1, 1,
0.5816802, 0.6420358, -0.4403804, 0, 0, 1, 1, 1,
0.5839336, -1.291174, 2.391423, 1, 0, 0, 1, 1,
0.5867055, 1.279839, 0.5060843, 1, 0, 0, 1, 1,
0.5936534, 0.5724453, 1.300116, 1, 0, 0, 1, 1,
0.5948506, -0.01684489, -0.007326847, 1, 0, 0, 1, 1,
0.596131, -0.1879244, 2.169127, 1, 0, 0, 1, 1,
0.5974276, -1.064573, 1.609316, 0, 0, 0, 1, 1,
0.6059543, -1.606465, 2.510226, 0, 0, 0, 1, 1,
0.6069234, 0.2483642, 1.455686, 0, 0, 0, 1, 1,
0.6081111, -0.1410915, 2.647112, 0, 0, 0, 1, 1,
0.6086712, 2.527305, 0.7100196, 0, 0, 0, 1, 1,
0.6149212, 0.7969359, 1.162816, 0, 0, 0, 1, 1,
0.6201425, 0.9818616, 0.7387918, 0, 0, 0, 1, 1,
0.6238068, 0.2856455, 2.661014, 1, 1, 1, 1, 1,
0.6289836, -0.5976891, 3.302441, 1, 1, 1, 1, 1,
0.6396327, 0.1564061, 1.108115, 1, 1, 1, 1, 1,
0.6498372, 0.1372542, 1.886829, 1, 1, 1, 1, 1,
0.6537235, -0.5639437, 2.402267, 1, 1, 1, 1, 1,
0.6544824, 0.5805586, -0.9101944, 1, 1, 1, 1, 1,
0.6548573, 1.151639, 0.2870763, 1, 1, 1, 1, 1,
0.6564911, -0.462214, 2.689798, 1, 1, 1, 1, 1,
0.6592121, -0.2124706, 1.629116, 1, 1, 1, 1, 1,
0.6615564, 0.6685943, 2.512164, 1, 1, 1, 1, 1,
0.6628621, -2.770456, 2.969714, 1, 1, 1, 1, 1,
0.665278, 1.071117, -0.387601, 1, 1, 1, 1, 1,
0.6741235, 1.533334, 0.5351477, 1, 1, 1, 1, 1,
0.6805387, -0.1280431, 1.663884, 1, 1, 1, 1, 1,
0.6828038, -1.034071, 2.755093, 1, 1, 1, 1, 1,
0.6832647, 0.1276248, 2.901181, 0, 0, 1, 1, 1,
0.684365, 0.4427741, 1.860865, 1, 0, 0, 1, 1,
0.6862773, 1.829606, 0.9890669, 1, 0, 0, 1, 1,
0.690829, -1.014204, 3.762383, 1, 0, 0, 1, 1,
0.6947625, 0.5075537, 2.486674, 1, 0, 0, 1, 1,
0.6958768, -0.9840667, 4.304854, 1, 0, 0, 1, 1,
0.6976895, -1.56631, 1.055382, 0, 0, 0, 1, 1,
0.7038664, 0.7204083, 0.8432279, 0, 0, 0, 1, 1,
0.7041974, 0.6380823, 1.636119, 0, 0, 0, 1, 1,
0.7134162, 0.7033385, 0.6167327, 0, 0, 0, 1, 1,
0.7141351, 0.4473244, 2.509738, 0, 0, 0, 1, 1,
0.7179011, 0.8771879, 3.086386, 0, 0, 0, 1, 1,
0.7197098, 1.159787, -0.2656673, 0, 0, 0, 1, 1,
0.725521, -2.274477, 4.065005, 1, 1, 1, 1, 1,
0.7284619, -0.8175736, 3.057443, 1, 1, 1, 1, 1,
0.7332147, -0.1302895, 0.3079325, 1, 1, 1, 1, 1,
0.7454259, 0.4172501, 1.282959, 1, 1, 1, 1, 1,
0.7458351, 1.872971, -1.448511, 1, 1, 1, 1, 1,
0.7470556, 1.806726, 1.77956, 1, 1, 1, 1, 1,
0.7478773, 1.377713, 0.212553, 1, 1, 1, 1, 1,
0.759992, -1.030245, 3.436637, 1, 1, 1, 1, 1,
0.765394, -0.08718884, 3.616668, 1, 1, 1, 1, 1,
0.7665364, -0.8794144, 3.587164, 1, 1, 1, 1, 1,
0.7698466, -0.897779, 1.393165, 1, 1, 1, 1, 1,
0.7720922, 0.8237619, 2.157372, 1, 1, 1, 1, 1,
0.779827, 0.6581711, 0.8173134, 1, 1, 1, 1, 1,
0.7828098, 1.402214, 1.531828, 1, 1, 1, 1, 1,
0.7836739, -1.044629, 1.146651, 1, 1, 1, 1, 1,
0.7864466, -0.7398197, 3.623453, 0, 0, 1, 1, 1,
0.7896241, -0.5185, 1.895105, 1, 0, 0, 1, 1,
0.7936525, 0.6627165, 0.8881527, 1, 0, 0, 1, 1,
0.7977917, -0.7475864, 2.574804, 1, 0, 0, 1, 1,
0.7984988, 0.6014985, 1.040194, 1, 0, 0, 1, 1,
0.8038816, -1.093411, 2.738139, 1, 0, 0, 1, 1,
0.8100845, 0.5986556, -0.4484035, 0, 0, 0, 1, 1,
0.8124402, 0.6701752, 1.455379, 0, 0, 0, 1, 1,
0.814269, -0.2599517, 2.394801, 0, 0, 0, 1, 1,
0.818529, -0.5121767, 1.503552, 0, 0, 0, 1, 1,
0.8204077, -0.4076144, 0.9948932, 0, 0, 0, 1, 1,
0.8208682, 0.99592, 0.5628797, 0, 0, 0, 1, 1,
0.8237208, 0.02646597, 0.9430625, 0, 0, 0, 1, 1,
0.8259134, -1.015061, 2.498983, 1, 1, 1, 1, 1,
0.8292272, 2.433602, 0.2763866, 1, 1, 1, 1, 1,
0.8292522, -0.9930019, 2.896686, 1, 1, 1, 1, 1,
0.8334891, -1.186363, 1.27651, 1, 1, 1, 1, 1,
0.8364824, 1.448985, 0.5787438, 1, 1, 1, 1, 1,
0.8370073, 1.284282, 1.836394, 1, 1, 1, 1, 1,
0.8373114, 1.448664, 0.1435148, 1, 1, 1, 1, 1,
0.8417683, 1.510516, 0.1430248, 1, 1, 1, 1, 1,
0.843419, -1.601123, 1.813554, 1, 1, 1, 1, 1,
0.8454002, 0.1690217, 0.291106, 1, 1, 1, 1, 1,
0.845669, -0.8198863, 3.575067, 1, 1, 1, 1, 1,
0.8461526, 0.4811714, 0.2914962, 1, 1, 1, 1, 1,
0.8509336, -0.01022211, 1.04453, 1, 1, 1, 1, 1,
0.8544697, -0.4584523, 3.473981, 1, 1, 1, 1, 1,
0.8584441, -1.974071, 0.8345684, 1, 1, 1, 1, 1,
0.8589949, 0.6923803, 1.002993, 0, 0, 1, 1, 1,
0.8612956, -0.4611424, 1.855409, 1, 0, 0, 1, 1,
0.8659729, 1.963622, 0.3397291, 1, 0, 0, 1, 1,
0.8674284, -0.2292007, 2.595257, 1, 0, 0, 1, 1,
0.868088, 0.9835718, -0.2871546, 1, 0, 0, 1, 1,
0.877911, 0.494133, 0.6016978, 1, 0, 0, 1, 1,
0.8782113, 0.6015067, 1.626332, 0, 0, 0, 1, 1,
0.8826321, -0.3088202, 1.542844, 0, 0, 0, 1, 1,
0.884113, -0.6172448, 3.310482, 0, 0, 0, 1, 1,
0.8860038, 0.6025754, 1.403053, 0, 0, 0, 1, 1,
0.889517, 0.8142475, 0.7241485, 0, 0, 0, 1, 1,
0.8921086, 0.2602165, 1.65356, 0, 0, 0, 1, 1,
0.8944735, 0.1505298, 0.5470448, 0, 0, 0, 1, 1,
0.8960443, 0.9361355, 0.4624014, 1, 1, 1, 1, 1,
0.9002916, 0.9984593, 1.987834, 1, 1, 1, 1, 1,
0.9110436, -0.09020741, 0.7663282, 1, 1, 1, 1, 1,
0.9118301, 1.173527, 1.003903, 1, 1, 1, 1, 1,
0.9225823, -1.506184, 2.7386, 1, 1, 1, 1, 1,
0.9235404, 2.410146, 0.8086991, 1, 1, 1, 1, 1,
0.9246105, -1.625289, 0.5575848, 1, 1, 1, 1, 1,
0.9268645, 0.6307256, 2.946566, 1, 1, 1, 1, 1,
0.930707, -0.7925208, 0.3510397, 1, 1, 1, 1, 1,
0.9310912, 0.6166137, 1.57671, 1, 1, 1, 1, 1,
0.9346519, -0.614286, 5.099325, 1, 1, 1, 1, 1,
0.9392517, 0.8671079, -0.5687585, 1, 1, 1, 1, 1,
0.9401192, 0.1803417, 2.632603, 1, 1, 1, 1, 1,
0.950288, 0.8607536, 1.70985, 1, 1, 1, 1, 1,
0.962545, 0.3321147, 2.384267, 1, 1, 1, 1, 1,
0.9737507, 0.7672848, -0.3768187, 0, 0, 1, 1, 1,
0.9764905, 0.004085601, 2.95222, 1, 0, 0, 1, 1,
0.9778945, -0.749042, 1.895559, 1, 0, 0, 1, 1,
0.9781488, -1.068104, 3.191031, 1, 0, 0, 1, 1,
0.9783965, -0.8025932, 2.035549, 1, 0, 0, 1, 1,
0.9917105, 1.203722, 0.3168347, 1, 0, 0, 1, 1,
0.993988, -0.07469382, 2.646014, 0, 0, 0, 1, 1,
0.9985632, 1.137781, 1.19094, 0, 0, 0, 1, 1,
1.000297, -0.1552499, 2.674335, 0, 0, 0, 1, 1,
1.002293, -1.416534, 3.509206, 0, 0, 0, 1, 1,
1.004662, 1.387231, 0.4733462, 0, 0, 0, 1, 1,
1.00505, 0.9739516, 1.475693, 0, 0, 0, 1, 1,
1.012499, -0.8041124, 2.587252, 0, 0, 0, 1, 1,
1.013885, -1.020893, 1.946507, 1, 1, 1, 1, 1,
1.027811, -0.4025336, 1.469509, 1, 1, 1, 1, 1,
1.032389, 0.497872, 3.239584, 1, 1, 1, 1, 1,
1.043699, -0.5114878, 3.387148, 1, 1, 1, 1, 1,
1.046197, 0.9676779, 1.83092, 1, 1, 1, 1, 1,
1.05264, 0.4422446, 2.004396, 1, 1, 1, 1, 1,
1.062366, 1.552947, 1.703899, 1, 1, 1, 1, 1,
1.067557, 1.011651, 1.016018, 1, 1, 1, 1, 1,
1.067819, 0.6238809, 2.486919, 1, 1, 1, 1, 1,
1.068841, -1.141544, 2.550674, 1, 1, 1, 1, 1,
1.078342, 1.429258, 0.7961426, 1, 1, 1, 1, 1,
1.079032, 0.7274542, 0.1914421, 1, 1, 1, 1, 1,
1.10252, 2.483678, -0.3838849, 1, 1, 1, 1, 1,
1.104914, 1.61627, 0.4425605, 1, 1, 1, 1, 1,
1.105862, 0.4458228, 1.395919, 1, 1, 1, 1, 1,
1.106019, -1.553069, 1.426605, 0, 0, 1, 1, 1,
1.108395, -0.04470053, 1.121226, 1, 0, 0, 1, 1,
1.11046, 1.281385, -0.2574098, 1, 0, 0, 1, 1,
1.111977, -0.5975832, 2.829304, 1, 0, 0, 1, 1,
1.114672, 0.8464077, 2.643524, 1, 0, 0, 1, 1,
1.115886, -0.3382069, 0.9028725, 1, 0, 0, 1, 1,
1.121635, 1.629012, 0.3824216, 0, 0, 0, 1, 1,
1.121872, -2.568071, 2.417697, 0, 0, 0, 1, 1,
1.122409, -1.178461, 2.112375, 0, 0, 0, 1, 1,
1.12347, -1.420091, 1.342963, 0, 0, 0, 1, 1,
1.132469, -0.4855611, 3.332201, 0, 0, 0, 1, 1,
1.134487, 0.3458027, 2.021917, 0, 0, 0, 1, 1,
1.145502, -1.396004, 2.755614, 0, 0, 0, 1, 1,
1.154295, -0.4500632, 1.581519, 1, 1, 1, 1, 1,
1.155228, 0.9944479, 2.099183, 1, 1, 1, 1, 1,
1.158917, -0.1819985, 0.8355096, 1, 1, 1, 1, 1,
1.160842, -2.187834, 3.823063, 1, 1, 1, 1, 1,
1.162926, -0.6540222, 3.276688, 1, 1, 1, 1, 1,
1.16387, -0.5304127, 2.655361, 1, 1, 1, 1, 1,
1.173892, 0.8400313, 0.1769842, 1, 1, 1, 1, 1,
1.175274, 0.3404309, 1.248859, 1, 1, 1, 1, 1,
1.178695, 1.14388, 0.06225668, 1, 1, 1, 1, 1,
1.208166, -0.7036083, 2.285766, 1, 1, 1, 1, 1,
1.222713, -0.1390489, 1.412649, 1, 1, 1, 1, 1,
1.224497, -1.497315, 2.237998, 1, 1, 1, 1, 1,
1.226434, -1.528483, 3.905303, 1, 1, 1, 1, 1,
1.232515, -0.2467937, -0.1906553, 1, 1, 1, 1, 1,
1.234277, -1.419321, 1.777837, 1, 1, 1, 1, 1,
1.237345, -1.662862, 2.025592, 0, 0, 1, 1, 1,
1.23956, 1.36597, -0.2871895, 1, 0, 0, 1, 1,
1.245503, 1.243895, 0.8750212, 1, 0, 0, 1, 1,
1.249482, 0.5847878, 1.841165, 1, 0, 0, 1, 1,
1.250262, 0.5776765, 2.52631, 1, 0, 0, 1, 1,
1.25573, 1.363992, -0.4038355, 1, 0, 0, 1, 1,
1.260057, -1.204794, 3.758558, 0, 0, 0, 1, 1,
1.267085, 0.8311886, 0.4015056, 0, 0, 0, 1, 1,
1.267946, 0.8182482, 0.6052383, 0, 0, 0, 1, 1,
1.271544, -2.56934, 2.320298, 0, 0, 0, 1, 1,
1.277263, 0.1737858, 0.3531894, 0, 0, 0, 1, 1,
1.277921, 0.6144297, 0.1233228, 0, 0, 0, 1, 1,
1.28521, 2.428004, -0.1535218, 0, 0, 0, 1, 1,
1.297807, 0.07173663, 1.983194, 1, 1, 1, 1, 1,
1.298576, 0.1398335, 1.279453, 1, 1, 1, 1, 1,
1.311278, 0.4995299, 2.092572, 1, 1, 1, 1, 1,
1.312521, 1.498057, 0.6333719, 1, 1, 1, 1, 1,
1.317617, -0.01701975, 1.265319, 1, 1, 1, 1, 1,
1.317643, 1.692331, -0.08137266, 1, 1, 1, 1, 1,
1.332297, 0.5693762, 1.325302, 1, 1, 1, 1, 1,
1.336111, 1.12742, 0.356903, 1, 1, 1, 1, 1,
1.336365, -0.4411968, 1.218489, 1, 1, 1, 1, 1,
1.350975, -0.07132323, 0.9398215, 1, 1, 1, 1, 1,
1.362606, 3.074849, 2.512127, 1, 1, 1, 1, 1,
1.371284, -0.8672825, 0.7648507, 1, 1, 1, 1, 1,
1.377159, -0.3533301, 2.587814, 1, 1, 1, 1, 1,
1.383, -1.517272, 2.672238, 1, 1, 1, 1, 1,
1.383996, 1.295537, 0.6124871, 1, 1, 1, 1, 1,
1.38619, -0.2421231, 0.5337975, 0, 0, 1, 1, 1,
1.386762, 0.05827039, 1.451942, 1, 0, 0, 1, 1,
1.394538, 0.4116101, 2.369859, 1, 0, 0, 1, 1,
1.401938, 0.9526242, 0.1389879, 1, 0, 0, 1, 1,
1.403678, 1.444, -0.4186065, 1, 0, 0, 1, 1,
1.422776, 0.07618017, 1.508471, 1, 0, 0, 1, 1,
1.423528, -0.7047111, 1.637959, 0, 0, 0, 1, 1,
1.425664, 1.002424, 1.388784, 0, 0, 0, 1, 1,
1.432839, 0.3606267, 0.1511028, 0, 0, 0, 1, 1,
1.457015, -0.3249429, 4.068768, 0, 0, 0, 1, 1,
1.466089, -0.2799744, 1.856847, 0, 0, 0, 1, 1,
1.470308, 0.06984835, 2.792978, 0, 0, 0, 1, 1,
1.476276, -0.4827434, 1.670488, 0, 0, 0, 1, 1,
1.481133, -0.392681, 1.059736, 1, 1, 1, 1, 1,
1.500743, -0.4562282, 1.046003, 1, 1, 1, 1, 1,
1.533068, 0.5282431, 2.08856, 1, 1, 1, 1, 1,
1.538088, 0.5816497, -0.7628165, 1, 1, 1, 1, 1,
1.55313, 0.1023031, 0.9465637, 1, 1, 1, 1, 1,
1.559473, -0.5276442, 0.7756405, 1, 1, 1, 1, 1,
1.565344, 0.8266413, -1.375174, 1, 1, 1, 1, 1,
1.572138, -0.1278251, 3.402863, 1, 1, 1, 1, 1,
1.580484, 0.05464226, 1.771233, 1, 1, 1, 1, 1,
1.599882, 0.08465359, 1.423412, 1, 1, 1, 1, 1,
1.601778, -1.537851, 3.520584, 1, 1, 1, 1, 1,
1.611616, 0.5494763, 1.938808, 1, 1, 1, 1, 1,
1.616073, -0.4007596, 3.071424, 1, 1, 1, 1, 1,
1.622475, -0.0687119, 0.6676828, 1, 1, 1, 1, 1,
1.627355, -0.0192459, 1.997209, 1, 1, 1, 1, 1,
1.6306, -1.078383, 2.961683, 0, 0, 1, 1, 1,
1.633361, 0.01122266, 1.415642, 1, 0, 0, 1, 1,
1.640904, -0.3078609, 1.827468, 1, 0, 0, 1, 1,
1.650765, 0.5149078, 1.631619, 1, 0, 0, 1, 1,
1.65624, 0.5894579, 2.065705, 1, 0, 0, 1, 1,
1.659817, 0.1560042, 1.487426, 1, 0, 0, 1, 1,
1.661796, -0.7571589, 2.378015, 0, 0, 0, 1, 1,
1.666141, -0.6375588, 1.359941, 0, 0, 0, 1, 1,
1.690294, -1.840281, 1.769058, 0, 0, 0, 1, 1,
1.69376, -0.3105719, 2.91921, 0, 0, 0, 1, 1,
1.723956, -0.3722686, 1.427967, 0, 0, 0, 1, 1,
1.742881, -0.1298145, 1.307863, 0, 0, 0, 1, 1,
1.744837, 1.224255, 0.2675909, 0, 0, 0, 1, 1,
1.782663, 1.494954, 2.695875, 1, 1, 1, 1, 1,
1.784971, -1.127744, 0.8399913, 1, 1, 1, 1, 1,
1.795996, 1.021009, 0.255748, 1, 1, 1, 1, 1,
1.797628, -1.542791, 2.196028, 1, 1, 1, 1, 1,
1.816709, -1.238267, 3.641793, 1, 1, 1, 1, 1,
1.817437, 0.6067865, 2.060409, 1, 1, 1, 1, 1,
1.818908, -2.858866, 1.346056, 1, 1, 1, 1, 1,
1.82189, -1.117734, 2.525159, 1, 1, 1, 1, 1,
1.823103, 1.003715, 0.6758229, 1, 1, 1, 1, 1,
1.850085, 0.4454364, 1.478787, 1, 1, 1, 1, 1,
1.873124, -0.3066805, 0.1667219, 1, 1, 1, 1, 1,
1.878298, -1.97007, 3.970114, 1, 1, 1, 1, 1,
1.905002, -1.116352, 3.943317, 1, 1, 1, 1, 1,
1.955495, 0.1476234, 2.103829, 1, 1, 1, 1, 1,
1.968498, -1.030515, 1.509722, 1, 1, 1, 1, 1,
2.001503, 0.7707782, 1.267787, 0, 0, 1, 1, 1,
2.014118, 1.151411, 2.586079, 1, 0, 0, 1, 1,
2.047446, 0.03807471, 1.715471, 1, 0, 0, 1, 1,
2.062139, 0.5655529, 2.314952, 1, 0, 0, 1, 1,
2.095372, -0.3550421, 1.05747, 1, 0, 0, 1, 1,
2.184033, -1.198502, 3.470588, 1, 0, 0, 1, 1,
2.214093, 3.005651, 2.104848, 0, 0, 0, 1, 1,
2.353961, -0.1697641, 2.482126, 0, 0, 0, 1, 1,
2.365076, 0.04286289, 1.686596, 0, 0, 0, 1, 1,
2.376133, 0.9256976, 2.317798, 0, 0, 0, 1, 1,
2.408958, -0.2024282, 1.10979, 0, 0, 0, 1, 1,
2.422324, 0.276496, 2.781157, 0, 0, 0, 1, 1,
2.449797, 0.6684975, -0.7144573, 0, 0, 0, 1, 1,
2.482117, -0.7998347, 3.491141, 1, 1, 1, 1, 1,
2.539889, 0.5422553, 2.153035, 1, 1, 1, 1, 1,
2.578789, 0.5706396, 0.7980978, 1, 1, 1, 1, 1,
2.720075, 0.8329226, 1.189313, 1, 1, 1, 1, 1,
2.864479, -0.8897764, 0.5474092, 1, 1, 1, 1, 1,
2.903265, -0.1062652, 2.061851, 1, 1, 1, 1, 1,
3.068667, -0.2091157, 0.9974613, 1, 1, 1, 1, 1
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
var radius = 9.381116;
var distance = 32.95078;
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
mvMatrix.translate( -0.1033587, -0.1444889, -0.4610631 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95078);
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
