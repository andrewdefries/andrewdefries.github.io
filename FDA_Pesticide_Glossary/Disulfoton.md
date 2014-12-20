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
-3.809387, 0.6001642, -2.24223, 1, 0, 0, 1,
-3.406649, -0.3797289, -1.395021, 1, 0.007843138, 0, 1,
-3.0233, -0.3501388, -3.08136, 1, 0.01176471, 0, 1,
-2.940747, 1.352843, -0.8262007, 1, 0.01960784, 0, 1,
-2.852034, -1.168278, -0.7765372, 1, 0.02352941, 0, 1,
-2.843329, -1.054889, -1.915936, 1, 0.03137255, 0, 1,
-2.805237, -1.080985, -2.270653, 1, 0.03529412, 0, 1,
-2.53806, -0.8898432, -2.346574, 1, 0.04313726, 0, 1,
-2.470307, 0.04124144, -0.515376, 1, 0.04705882, 0, 1,
-2.466637, -0.6964164, -1.812542, 1, 0.05490196, 0, 1,
-2.449561, 1.241774, -2.001079, 1, 0.05882353, 0, 1,
-2.421082, 0.378148, -2.041689, 1, 0.06666667, 0, 1,
-2.412431, -0.3443519, -1.247771, 1, 0.07058824, 0, 1,
-2.322038, 0.8460085, -1.356254, 1, 0.07843138, 0, 1,
-2.250835, -1.099278, -0.8005716, 1, 0.08235294, 0, 1,
-2.241316, -0.06428272, -1.40934, 1, 0.09019608, 0, 1,
-2.232399, 0.8188255, -0.7222215, 1, 0.09411765, 0, 1,
-2.202334, -0.2849255, -1.316346, 1, 0.1019608, 0, 1,
-2.197242, -0.3758452, -4.342517, 1, 0.1098039, 0, 1,
-2.147865, 0.902195, 0.1731587, 1, 0.1137255, 0, 1,
-2.059927, -1.216901, -4.462306, 1, 0.1215686, 0, 1,
-2.057747, 0.8678697, -2.504069, 1, 0.1254902, 0, 1,
-2.01613, 0.02633574, -0.1847066, 1, 0.1333333, 0, 1,
-1.974478, -0.6844366, -0.4341335, 1, 0.1372549, 0, 1,
-1.968315, -0.5382714, -2.247794, 1, 0.145098, 0, 1,
-1.9624, 0.9165772, -2.82851, 1, 0.1490196, 0, 1,
-1.92467, -0.5922459, -1.937145, 1, 0.1568628, 0, 1,
-1.906066, -0.7876903, -1.314609, 1, 0.1607843, 0, 1,
-1.905811, 0.1680727, -2.115128, 1, 0.1686275, 0, 1,
-1.895037, 0.02673926, -2.097655, 1, 0.172549, 0, 1,
-1.886904, -0.9142277, -3.355938, 1, 0.1803922, 0, 1,
-1.825551, 0.3891402, -1.090092, 1, 0.1843137, 0, 1,
-1.797555, 0.2370141, -2.36508, 1, 0.1921569, 0, 1,
-1.788235, 0.8603358, -0.2368152, 1, 0.1960784, 0, 1,
-1.786921, 1.118908, -0.8131347, 1, 0.2039216, 0, 1,
-1.783822, -1.14825, -1.761436, 1, 0.2117647, 0, 1,
-1.758318, -2.407667, -2.249524, 1, 0.2156863, 0, 1,
-1.745762, -1.050824, -1.8605, 1, 0.2235294, 0, 1,
-1.74526, -0.3466533, -2.912766, 1, 0.227451, 0, 1,
-1.742624, -0.6421534, -3.331675, 1, 0.2352941, 0, 1,
-1.733448, -0.6013953, -0.1127464, 1, 0.2392157, 0, 1,
-1.731881, -0.3508104, -3.68534, 1, 0.2470588, 0, 1,
-1.719823, 1.696405, -0.9164571, 1, 0.2509804, 0, 1,
-1.713691, -0.5833176, -1.551552, 1, 0.2588235, 0, 1,
-1.703238, 0.4074258, -1.977684, 1, 0.2627451, 0, 1,
-1.701705, -1.215487, -2.624871, 1, 0.2705882, 0, 1,
-1.698151, -0.2158773, -1.747297, 1, 0.2745098, 0, 1,
-1.686462, -1.831009, -2.838009, 1, 0.282353, 0, 1,
-1.685035, -0.8271327, -3.748869, 1, 0.2862745, 0, 1,
-1.678141, 0.8664562, -0.6698465, 1, 0.2941177, 0, 1,
-1.677799, -0.3909644, -0.7574442, 1, 0.3019608, 0, 1,
-1.663711, -2.908751, -2.895639, 1, 0.3058824, 0, 1,
-1.633402, 1.665634, 0.09745757, 1, 0.3137255, 0, 1,
-1.613659, -0.2709451, -1.43758, 1, 0.3176471, 0, 1,
-1.60325, 0.4906253, -1.021997, 1, 0.3254902, 0, 1,
-1.594625, 1.055746, -2.501923, 1, 0.3294118, 0, 1,
-1.58988, -0.7790483, -1.973876, 1, 0.3372549, 0, 1,
-1.587442, 0.7231654, 0.8374656, 1, 0.3411765, 0, 1,
-1.586854, 0.1006651, -2.633318, 1, 0.3490196, 0, 1,
-1.586319, 1.282167, -0.6293048, 1, 0.3529412, 0, 1,
-1.574269, -1.474488, -2.377028, 1, 0.3607843, 0, 1,
-1.571638, 1.548677, -1.958292, 1, 0.3647059, 0, 1,
-1.567536, -1.365093, -0.4908674, 1, 0.372549, 0, 1,
-1.566528, -1.551237, -2.642018, 1, 0.3764706, 0, 1,
-1.54852, 1.081219, -0.7063814, 1, 0.3843137, 0, 1,
-1.537366, -0.3837745, -1.396703, 1, 0.3882353, 0, 1,
-1.533245, 0.6391369, -0.4300559, 1, 0.3960784, 0, 1,
-1.527065, -0.5208852, -2.341205, 1, 0.4039216, 0, 1,
-1.52381, -1.131037, -0.7447018, 1, 0.4078431, 0, 1,
-1.519801, -1.436535, -1.856349, 1, 0.4156863, 0, 1,
-1.505113, 1.583511, 0.8841179, 1, 0.4196078, 0, 1,
-1.504926, -1.039458, -2.233382, 1, 0.427451, 0, 1,
-1.495494, 0.2224775, -1.374628, 1, 0.4313726, 0, 1,
-1.493265, -0.6354668, -1.702161, 1, 0.4392157, 0, 1,
-1.490781, -0.07124662, -1.352635, 1, 0.4431373, 0, 1,
-1.485079, 1.182244, -0.8132049, 1, 0.4509804, 0, 1,
-1.483832, 0.1047848, -0.394179, 1, 0.454902, 0, 1,
-1.443268, 0.6955252, -1.577078, 1, 0.4627451, 0, 1,
-1.435693, 0.1949206, -0.2665826, 1, 0.4666667, 0, 1,
-1.433453, 0.4412189, -0.786033, 1, 0.4745098, 0, 1,
-1.425229, -0.639701, -1.906192, 1, 0.4784314, 0, 1,
-1.411296, -1.162405, -0.2494686, 1, 0.4862745, 0, 1,
-1.405733, -2.47372, -2.966302, 1, 0.4901961, 0, 1,
-1.402445, 0.758451, 0.5243275, 1, 0.4980392, 0, 1,
-1.393252, 0.5347841, -1.563198, 1, 0.5058824, 0, 1,
-1.39194, -0.3819015, -1.494598, 1, 0.509804, 0, 1,
-1.388481, -0.1024889, -1.498482, 1, 0.5176471, 0, 1,
-1.383375, 0.3182738, -2.777791, 1, 0.5215687, 0, 1,
-1.373692, -0.3655333, -2.780548, 1, 0.5294118, 0, 1,
-1.365237, -0.4174906, -2.905162, 1, 0.5333334, 0, 1,
-1.354859, -0.5674046, -3.795133, 1, 0.5411765, 0, 1,
-1.349681, -0.09062339, -1.624081, 1, 0.5450981, 0, 1,
-1.330991, 0.7201871, -1.353104, 1, 0.5529412, 0, 1,
-1.32978, -0.8298541, -1.431598, 1, 0.5568628, 0, 1,
-1.326563, 1.534661, 0.5647168, 1, 0.5647059, 0, 1,
-1.326523, -0.2314428, -0.7560031, 1, 0.5686275, 0, 1,
-1.325646, 0.1650281, -0.5062302, 1, 0.5764706, 0, 1,
-1.320254, -1.104454, -2.073725, 1, 0.5803922, 0, 1,
-1.314294, -0.9752683, -1.841471, 1, 0.5882353, 0, 1,
-1.313765, 1.255152, -0.2932964, 1, 0.5921569, 0, 1,
-1.310389, 1.779182, 0.1707368, 1, 0.6, 0, 1,
-1.308988, -0.5039696, -3.27848, 1, 0.6078432, 0, 1,
-1.308702, -1.723134, -2.474301, 1, 0.6117647, 0, 1,
-1.306605, -0.8606592, -0.9154596, 1, 0.6196079, 0, 1,
-1.303946, -0.1511454, -2.244496, 1, 0.6235294, 0, 1,
-1.289037, 0.506135, -0.3592865, 1, 0.6313726, 0, 1,
-1.288551, 0.1583997, -1.886998, 1, 0.6352941, 0, 1,
-1.286023, 0.3962972, -1.284408, 1, 0.6431373, 0, 1,
-1.283493, -0.09284507, -1.561138, 1, 0.6470588, 0, 1,
-1.258135, -0.4637144, -3.146901, 1, 0.654902, 0, 1,
-1.257413, -0.570618, -1.375424, 1, 0.6588235, 0, 1,
-1.256101, 0.7727108, -2.850357, 1, 0.6666667, 0, 1,
-1.254342, 0.4975868, -0.5493469, 1, 0.6705883, 0, 1,
-1.253986, -0.3720707, -2.416212, 1, 0.6784314, 0, 1,
-1.248185, 0.3857814, -0.3796661, 1, 0.682353, 0, 1,
-1.230941, -0.5702661, -1.848253, 1, 0.6901961, 0, 1,
-1.225998, -0.6981326, -2.353588, 1, 0.6941177, 0, 1,
-1.2144, 0.1823529, -0.4344999, 1, 0.7019608, 0, 1,
-1.208794, 0.9333817, -1.979456, 1, 0.7098039, 0, 1,
-1.207261, 1.307329, -0.9331647, 1, 0.7137255, 0, 1,
-1.186056, 0.3502139, -2.352499, 1, 0.7215686, 0, 1,
-1.182305, -0.8043492, -0.1529296, 1, 0.7254902, 0, 1,
-1.173585, -1.926684, -1.880517, 1, 0.7333333, 0, 1,
-1.17259, 0.3872904, -1.59101, 1, 0.7372549, 0, 1,
-1.166503, -1.058252, -0.6025838, 1, 0.7450981, 0, 1,
-1.160993, 0.1414741, -0.8985701, 1, 0.7490196, 0, 1,
-1.154419, -0.1222241, -1.258277, 1, 0.7568628, 0, 1,
-1.153361, 0.9440004, 0.6314666, 1, 0.7607843, 0, 1,
-1.141809, -0.2190907, -1.777042, 1, 0.7686275, 0, 1,
-1.134482, -1.551022, -1.336801, 1, 0.772549, 0, 1,
-1.133799, -0.2754551, -1.566689, 1, 0.7803922, 0, 1,
-1.130835, 0.8836378, -1.166651, 1, 0.7843137, 0, 1,
-1.123472, -0.2001136, -1.363916, 1, 0.7921569, 0, 1,
-1.121369, -1.144409, -1.901337, 1, 0.7960784, 0, 1,
-1.119548, -1.505095, -1.955416, 1, 0.8039216, 0, 1,
-1.114789, -0.4241606, -1.395054, 1, 0.8117647, 0, 1,
-1.11141, -0.06461073, -2.428557, 1, 0.8156863, 0, 1,
-1.110975, 1.231209, -2.511623, 1, 0.8235294, 0, 1,
-1.102946, 1.149003, -0.1707751, 1, 0.827451, 0, 1,
-1.100242, 1.524826, -0.5231728, 1, 0.8352941, 0, 1,
-1.099933, 1.828888, 1.233075, 1, 0.8392157, 0, 1,
-1.089597, -0.1289511, -2.318059, 1, 0.8470588, 0, 1,
-1.088379, -1.324314, -3.672146, 1, 0.8509804, 0, 1,
-1.085422, -1.141864, -2.449848, 1, 0.8588235, 0, 1,
-1.082157, -0.7656554, -1.778939, 1, 0.8627451, 0, 1,
-1.077461, -0.9060099, -1.246284, 1, 0.8705882, 0, 1,
-1.075505, 0.5410002, -2.102367, 1, 0.8745098, 0, 1,
-1.074195, 1.498651, -1.576588, 1, 0.8823529, 0, 1,
-1.071639, -2.110135, -3.529148, 1, 0.8862745, 0, 1,
-1.071613, -0.08824743, -1.26375, 1, 0.8941177, 0, 1,
-1.069012, 0.9489695, -1.348778, 1, 0.8980392, 0, 1,
-1.066584, -0.7330462, -1.681114, 1, 0.9058824, 0, 1,
-1.061487, -2.686012, -3.693335, 1, 0.9137255, 0, 1,
-1.052448, 0.1812324, -2.548036, 1, 0.9176471, 0, 1,
-1.046664, 0.2695732, -0.1847729, 1, 0.9254902, 0, 1,
-1.040202, 2.414181, -0.1223645, 1, 0.9294118, 0, 1,
-1.036769, -0.2141415, -1.99985, 1, 0.9372549, 0, 1,
-1.034265, -1.766809, -2.496542, 1, 0.9411765, 0, 1,
-1.029755, 0.217364, -0.8595515, 1, 0.9490196, 0, 1,
-1.029633, 1.221648, -1.033774, 1, 0.9529412, 0, 1,
-1.028157, 0.489612, -1.067537, 1, 0.9607843, 0, 1,
-1.027731, -0.6542348, -1.837841, 1, 0.9647059, 0, 1,
-1.025336, -0.370299, -2.931062, 1, 0.972549, 0, 1,
-1.024196, -0.6617177, -1.656176, 1, 0.9764706, 0, 1,
-1.01896, -1.057205, -2.650671, 1, 0.9843137, 0, 1,
-1.012035, -1.318295, -2.621315, 1, 0.9882353, 0, 1,
-1.003096, -0.4997995, -0.5916502, 1, 0.9960784, 0, 1,
-0.993049, 0.3340709, -0.6773779, 0.9960784, 1, 0, 1,
-0.9831038, 0.1973585, -0.9699755, 0.9921569, 1, 0, 1,
-0.9813975, 0.2104779, -1.430406, 0.9843137, 1, 0, 1,
-0.9664972, -0.01240829, -1.335185, 0.9803922, 1, 0, 1,
-0.963325, -1.135651, -0.9178525, 0.972549, 1, 0, 1,
-0.960119, 0.5581397, -0.9088347, 0.9686275, 1, 0, 1,
-0.9563949, -0.6543726, -0.8262388, 0.9607843, 1, 0, 1,
-0.9435285, 0.9381127, -1.423773, 0.9568627, 1, 0, 1,
-0.9419422, -1.053653, -2.297473, 0.9490196, 1, 0, 1,
-0.93994, -0.9431055, -1.154618, 0.945098, 1, 0, 1,
-0.9398124, 1.220013, -1.669704, 0.9372549, 1, 0, 1,
-0.9398035, 0.134247, -0.1708045, 0.9333333, 1, 0, 1,
-0.9382962, -2.132194, -2.394741, 0.9254902, 1, 0, 1,
-0.936357, 0.536156, -0.02184037, 0.9215686, 1, 0, 1,
-0.9331629, -0.6048264, -1.914863, 0.9137255, 1, 0, 1,
-0.9140404, -0.6337877, -1.608827, 0.9098039, 1, 0, 1,
-0.9117436, -0.03739353, -2.009778, 0.9019608, 1, 0, 1,
-0.898216, 1.5849, 2.176381, 0.8941177, 1, 0, 1,
-0.8909163, -0.9688026, -3.111941, 0.8901961, 1, 0, 1,
-0.8906871, 0.648647, -1.128901, 0.8823529, 1, 0, 1,
-0.888055, 0.7049318, -2.202258, 0.8784314, 1, 0, 1,
-0.8871318, 0.9772995, -1.401608, 0.8705882, 1, 0, 1,
-0.8858239, -1.474531, -1.263233, 0.8666667, 1, 0, 1,
-0.8836232, -0.9734728, -1.34291, 0.8588235, 1, 0, 1,
-0.8817258, 0.3700613, -2.728356, 0.854902, 1, 0, 1,
-0.8789931, 2.548619, -1.825149, 0.8470588, 1, 0, 1,
-0.8751046, 0.6071911, -1.12849, 0.8431373, 1, 0, 1,
-0.8712178, -0.4918623, -2.525759, 0.8352941, 1, 0, 1,
-0.8642222, -0.5217584, -2.372672, 0.8313726, 1, 0, 1,
-0.8628961, 0.153558, -1.85962, 0.8235294, 1, 0, 1,
-0.8623582, -0.2782903, -1.470561, 0.8196079, 1, 0, 1,
-0.8535631, -1.013791, -2.446623, 0.8117647, 1, 0, 1,
-0.8513125, 0.4436126, -0.9250866, 0.8078431, 1, 0, 1,
-0.8440884, -1.466866, -1.076475, 0.8, 1, 0, 1,
-0.8439472, 0.2091494, -1.583756, 0.7921569, 1, 0, 1,
-0.8371588, -0.5898599, -2.537131, 0.7882353, 1, 0, 1,
-0.8346903, 0.260785, -1.187038, 0.7803922, 1, 0, 1,
-0.8344302, 0.08672091, -0.06692905, 0.7764706, 1, 0, 1,
-0.8296276, 1.62505, -0.7785162, 0.7686275, 1, 0, 1,
-0.8274024, 1.084922, 0.4228291, 0.7647059, 1, 0, 1,
-0.81661, 0.3436477, -2.084343, 0.7568628, 1, 0, 1,
-0.81582, 0.04390247, -1.757409, 0.7529412, 1, 0, 1,
-0.8139503, 0.8102764, -2.056441, 0.7450981, 1, 0, 1,
-0.8134953, 1.42719, -0.2057254, 0.7411765, 1, 0, 1,
-0.8129132, 0.6663445, -1.861745, 0.7333333, 1, 0, 1,
-0.8103727, -1.671832, -1.825809, 0.7294118, 1, 0, 1,
-0.8049772, 0.171996, -1.765746, 0.7215686, 1, 0, 1,
-0.7985476, -1.620414, -0.8027903, 0.7176471, 1, 0, 1,
-0.7980019, -1.748403, -3.342982, 0.7098039, 1, 0, 1,
-0.7968419, 0.4291603, 0.1118468, 0.7058824, 1, 0, 1,
-0.7909675, 1.068271, 0.3172865, 0.6980392, 1, 0, 1,
-0.7845313, -0.2303477, -1.870996, 0.6901961, 1, 0, 1,
-0.7794607, 0.3100893, -1.721321, 0.6862745, 1, 0, 1,
-0.7701061, 0.378366, 0.2159545, 0.6784314, 1, 0, 1,
-0.764524, 0.6426407, -0.9858544, 0.6745098, 1, 0, 1,
-0.7615168, -0.1180333, -0.7400761, 0.6666667, 1, 0, 1,
-0.7565925, -0.1056319, -0.4012249, 0.6627451, 1, 0, 1,
-0.7541511, -0.04923442, -1.666012, 0.654902, 1, 0, 1,
-0.7514127, 0.02209875, -1.67251, 0.6509804, 1, 0, 1,
-0.7513278, 0.6338148, -1.239287, 0.6431373, 1, 0, 1,
-0.7491071, -1.122838, -3.82418, 0.6392157, 1, 0, 1,
-0.7465137, 2.246417, -1.910657, 0.6313726, 1, 0, 1,
-0.745636, 0.005091747, -4.131895, 0.627451, 1, 0, 1,
-0.7454733, 0.2575276, -1.572736, 0.6196079, 1, 0, 1,
-0.7432863, -0.5258923, -2.051058, 0.6156863, 1, 0, 1,
-0.7347834, 0.6500538, 0.1981333, 0.6078432, 1, 0, 1,
-0.7336912, 0.4196965, -1.821598, 0.6039216, 1, 0, 1,
-0.7293327, 0.8090171, -0.6236122, 0.5960785, 1, 0, 1,
-0.7287611, 1.376225, -0.6067497, 0.5882353, 1, 0, 1,
-0.7229198, 1.052781, -0.4089252, 0.5843138, 1, 0, 1,
-0.7218334, -0.9036886, -1.253603, 0.5764706, 1, 0, 1,
-0.7156526, -3.07646, -3.261267, 0.572549, 1, 0, 1,
-0.714783, 0.2176649, -0.1897552, 0.5647059, 1, 0, 1,
-0.7101502, -0.2007883, -5.297875, 0.5607843, 1, 0, 1,
-0.710048, 0.2271058, -0.5409496, 0.5529412, 1, 0, 1,
-0.7095684, 0.6895972, -0.9088795, 0.5490196, 1, 0, 1,
-0.7065602, -0.8616495, -2.641936, 0.5411765, 1, 0, 1,
-0.7051091, 0.4647194, 1.917925, 0.5372549, 1, 0, 1,
-0.7042018, 1.223621, -0.1906237, 0.5294118, 1, 0, 1,
-0.7017087, 0.04217806, -0.2771173, 0.5254902, 1, 0, 1,
-0.6988477, -0.5253951, -2.391979, 0.5176471, 1, 0, 1,
-0.6935036, 1.277306, -0.6952901, 0.5137255, 1, 0, 1,
-0.6933301, 0.07126636, -2.633657, 0.5058824, 1, 0, 1,
-0.6901933, 0.8488621, 0.2939059, 0.5019608, 1, 0, 1,
-0.6897875, 0.5245953, 0.1774785, 0.4941176, 1, 0, 1,
-0.6863599, -0.1797777, -3.090359, 0.4862745, 1, 0, 1,
-0.6836267, -0.1521245, -0.07103875, 0.4823529, 1, 0, 1,
-0.6795473, 0.4097397, -0.7658049, 0.4745098, 1, 0, 1,
-0.670124, -1.584013, -3.287207, 0.4705882, 1, 0, 1,
-0.6674829, -0.6186656, -2.78575, 0.4627451, 1, 0, 1,
-0.6643667, 0.05916055, -4.400811, 0.4588235, 1, 0, 1,
-0.6623772, -1.163293, -1.345056, 0.4509804, 1, 0, 1,
-0.6555493, -0.2097987, -2.178075, 0.4470588, 1, 0, 1,
-0.6540991, 0.08580517, -0.275516, 0.4392157, 1, 0, 1,
-0.6538789, -1.361246, -2.925846, 0.4352941, 1, 0, 1,
-0.6483774, -0.0674747, -0.6032529, 0.427451, 1, 0, 1,
-0.6425654, 0.6638241, 0.1504203, 0.4235294, 1, 0, 1,
-0.6408362, -0.30548, -2.359032, 0.4156863, 1, 0, 1,
-0.6374555, 1.558619, -1.275617, 0.4117647, 1, 0, 1,
-0.6362225, 1.503821, -1.938554, 0.4039216, 1, 0, 1,
-0.6348279, 0.1192321, -0.1159551, 0.3960784, 1, 0, 1,
-0.6328509, 0.275537, -0.7495137, 0.3921569, 1, 0, 1,
-0.6292807, 0.7026242, -1.207496, 0.3843137, 1, 0, 1,
-0.6260009, 1.059858, -1.146433, 0.3803922, 1, 0, 1,
-0.6251231, 0.3534346, -2.040669, 0.372549, 1, 0, 1,
-0.6210278, -0.7955223, -4.061192, 0.3686275, 1, 0, 1,
-0.6203167, -0.4712452, -3.36412, 0.3607843, 1, 0, 1,
-0.6177284, 0.7658094, -0.811888, 0.3568628, 1, 0, 1,
-0.6161999, -1.390671, -2.637314, 0.3490196, 1, 0, 1,
-0.612555, 2.390363, -1.145107, 0.345098, 1, 0, 1,
-0.6108245, 0.4140284, -0.5028322, 0.3372549, 1, 0, 1,
-0.6105565, -0.8906231, -0.5916309, 0.3333333, 1, 0, 1,
-0.6095234, -1.554097, -3.137084, 0.3254902, 1, 0, 1,
-0.6069424, 0.7146958, 0.7314919, 0.3215686, 1, 0, 1,
-0.6051465, 1.459183, -0.4720592, 0.3137255, 1, 0, 1,
-0.5867453, 0.06739752, -1.694001, 0.3098039, 1, 0, 1,
-0.5857011, 0.9277682, 1.028302, 0.3019608, 1, 0, 1,
-0.5848033, 0.5906221, -0.8878183, 0.2941177, 1, 0, 1,
-0.5801044, 0.4899277, -1.485428, 0.2901961, 1, 0, 1,
-0.5794826, -0.2105316, -0.7370089, 0.282353, 1, 0, 1,
-0.5793176, -1.26144, -3.9756, 0.2784314, 1, 0, 1,
-0.5691171, 0.7456979, 0.2769052, 0.2705882, 1, 0, 1,
-0.5669029, 0.008695195, -1.259797, 0.2666667, 1, 0, 1,
-0.5658762, -1.99226, -3.038474, 0.2588235, 1, 0, 1,
-0.5642133, 0.8125614, 0.00241121, 0.254902, 1, 0, 1,
-0.5619766, 0.3753831, -0.1206835, 0.2470588, 1, 0, 1,
-0.561828, 0.4360813, -2.006632, 0.2431373, 1, 0, 1,
-0.5592731, 0.5751021, -1.370453, 0.2352941, 1, 0, 1,
-0.5567913, 0.6104528, 0.9866759, 0.2313726, 1, 0, 1,
-0.5547722, 0.7476716, -0.9863551, 0.2235294, 1, 0, 1,
-0.5539843, 0.8400881, 0.2819747, 0.2196078, 1, 0, 1,
-0.5448698, -0.4601075, -2.378616, 0.2117647, 1, 0, 1,
-0.543533, 0.5140038, -0.4369834, 0.2078431, 1, 0, 1,
-0.5426957, -0.2557936, -2.631532, 0.2, 1, 0, 1,
-0.5423871, 0.8075983, -0.4726979, 0.1921569, 1, 0, 1,
-0.5394577, -0.4992189, -1.189829, 0.1882353, 1, 0, 1,
-0.5381746, -0.438414, -3.400487, 0.1803922, 1, 0, 1,
-0.5309728, -0.4079832, -3.42356, 0.1764706, 1, 0, 1,
-0.530569, 0.1018897, -2.144862, 0.1686275, 1, 0, 1,
-0.5271837, 0.07625948, -1.628109, 0.1647059, 1, 0, 1,
-0.5227175, -1.304693, -4.333632, 0.1568628, 1, 0, 1,
-0.5175466, -0.2080034, -1.65867, 0.1529412, 1, 0, 1,
-0.5165697, -1.537186, -3.586109, 0.145098, 1, 0, 1,
-0.5133781, 1.386124, -0.3374231, 0.1411765, 1, 0, 1,
-0.5121604, 1.003963, 0.712072, 0.1333333, 1, 0, 1,
-0.5070789, -0.1327756, -2.155718, 0.1294118, 1, 0, 1,
-0.5010784, 0.2300223, -1.92663, 0.1215686, 1, 0, 1,
-0.4993772, 0.1780198, -1.668668, 0.1176471, 1, 0, 1,
-0.4906721, -0.4543448, -1.345986, 0.1098039, 1, 0, 1,
-0.4896612, 0.08757952, -1.710259, 0.1058824, 1, 0, 1,
-0.4846345, -0.7978421, -2.423439, 0.09803922, 1, 0, 1,
-0.4823124, 1.527302, -0.5164371, 0.09019608, 1, 0, 1,
-0.4816107, 0.5505767, -0.8808795, 0.08627451, 1, 0, 1,
-0.4787785, -1.207021, -0.600526, 0.07843138, 1, 0, 1,
-0.4781204, 2.212593, 0.4782049, 0.07450981, 1, 0, 1,
-0.4774988, -1.854882, -2.268732, 0.06666667, 1, 0, 1,
-0.4770861, -0.08943674, -2.083091, 0.0627451, 1, 0, 1,
-0.4743644, -0.2836955, -1.996222, 0.05490196, 1, 0, 1,
-0.4730469, 0.2376011, 0.8300749, 0.05098039, 1, 0, 1,
-0.4692471, -0.7228989, -2.056377, 0.04313726, 1, 0, 1,
-0.4638504, 0.2492654, -3.154878, 0.03921569, 1, 0, 1,
-0.4628502, -0.06807679, 0.03151281, 0.03137255, 1, 0, 1,
-0.4592897, 0.6885588, -1.815367, 0.02745098, 1, 0, 1,
-0.4567869, -0.08681311, -0.2022837, 0.01960784, 1, 0, 1,
-0.4514166, -0.8489734, -3.775974, 0.01568628, 1, 0, 1,
-0.4499583, 0.8194166, -0.8492285, 0.007843138, 1, 0, 1,
-0.4482236, 1.824872, 2.385127, 0.003921569, 1, 0, 1,
-0.4472275, 0.9549375, -1.629832, 0, 1, 0.003921569, 1,
-0.4454211, 0.4191464, -1.991047, 0, 1, 0.01176471, 1,
-0.4428318, 0.661477, -1.930192, 0, 1, 0.01568628, 1,
-0.439083, 0.1838151, 0.4433332, 0, 1, 0.02352941, 1,
-0.4363202, 0.7237217, -2.281337, 0, 1, 0.02745098, 1,
-0.4250669, -0.3940583, -1.641988, 0, 1, 0.03529412, 1,
-0.4197932, 1.075491, -1.94464, 0, 1, 0.03921569, 1,
-0.4187364, -0.4149214, -1.809101, 0, 1, 0.04705882, 1,
-0.4096145, -0.9968324, -2.964131, 0, 1, 0.05098039, 1,
-0.4059852, -0.9207903, -1.051625, 0, 1, 0.05882353, 1,
-0.4020674, -1.411154, -4.135244, 0, 1, 0.0627451, 1,
-0.396578, 0.1500281, 0.1392311, 0, 1, 0.07058824, 1,
-0.3937764, 0.6902869, -0.1725542, 0, 1, 0.07450981, 1,
-0.393325, 0.444187, -1.304992, 0, 1, 0.08235294, 1,
-0.3919728, -0.6137379, -2.054499, 0, 1, 0.08627451, 1,
-0.3882788, -1.146711, -3.147621, 0, 1, 0.09411765, 1,
-0.3877902, 0.3707658, 1.36283, 0, 1, 0.1019608, 1,
-0.3818039, -0.9159214, -3.390381, 0, 1, 0.1058824, 1,
-0.3805477, 0.3106803, -1.585825, 0, 1, 0.1137255, 1,
-0.378969, 1.367592, -0.9644943, 0, 1, 0.1176471, 1,
-0.3770934, 0.8560882, -2.174497, 0, 1, 0.1254902, 1,
-0.374467, -1.633916, -2.111162, 0, 1, 0.1294118, 1,
-0.3725018, 0.7976255, -0.7882646, 0, 1, 0.1372549, 1,
-0.3712097, 0.6218954, -1.1252, 0, 1, 0.1411765, 1,
-0.3698731, -0.8859798, -2.272243, 0, 1, 0.1490196, 1,
-0.367182, 1.694431, 1.751957, 0, 1, 0.1529412, 1,
-0.3638721, 0.1637619, -2.675999, 0, 1, 0.1607843, 1,
-0.361924, -1.848646, -2.621784, 0, 1, 0.1647059, 1,
-0.3514927, -1.254009, -3.260289, 0, 1, 0.172549, 1,
-0.3499913, -1.285485, -3.03267, 0, 1, 0.1764706, 1,
-0.3488429, 0.01506046, 0.4104196, 0, 1, 0.1843137, 1,
-0.3475734, -0.5499936, -1.595918, 0, 1, 0.1882353, 1,
-0.347135, 0.1075244, -1.837323, 0, 1, 0.1960784, 1,
-0.346931, -0.4679897, -2.797066, 0, 1, 0.2039216, 1,
-0.3453947, 0.8429388, -2.003792, 0, 1, 0.2078431, 1,
-0.3402365, 0.5512847, -0.05398334, 0, 1, 0.2156863, 1,
-0.3399815, -0.4463977, -3.024565, 0, 1, 0.2196078, 1,
-0.3386405, 1.258681, 2.036987, 0, 1, 0.227451, 1,
-0.3351232, 0.5428333, -0.6461559, 0, 1, 0.2313726, 1,
-0.329913, -0.1048691, -2.691625, 0, 1, 0.2392157, 1,
-0.3286554, 0.2088981, 0.1667205, 0, 1, 0.2431373, 1,
-0.327916, 0.5044424, -1.288458, 0, 1, 0.2509804, 1,
-0.3237528, 2.138157, -0.958031, 0, 1, 0.254902, 1,
-0.3183166, 0.2806048, -1.762712, 0, 1, 0.2627451, 1,
-0.3179787, 1.514737, 1.582263, 0, 1, 0.2666667, 1,
-0.311823, 0.1133862, -1.060464, 0, 1, 0.2745098, 1,
-0.3113646, 1.4714, -1.57735, 0, 1, 0.2784314, 1,
-0.3101451, 0.3948407, 0.4429447, 0, 1, 0.2862745, 1,
-0.3068514, 0.1134405, 0.9873719, 0, 1, 0.2901961, 1,
-0.3048682, -0.910456, -3.230194, 0, 1, 0.2980392, 1,
-0.3018785, 1.064258, -0.09642082, 0, 1, 0.3058824, 1,
-0.3003219, -0.02789951, -2.734041, 0, 1, 0.3098039, 1,
-0.2986582, 0.7841808, 0.1711932, 0, 1, 0.3176471, 1,
-0.29248, 0.9225384, 0.3404277, 0, 1, 0.3215686, 1,
-0.2887182, 0.7458476, -0.9212612, 0, 1, 0.3294118, 1,
-0.287627, 0.5548242, -0.05051118, 0, 1, 0.3333333, 1,
-0.2848432, -1.257584, -3.223251, 0, 1, 0.3411765, 1,
-0.2844721, -0.2238903, -0.4215226, 0, 1, 0.345098, 1,
-0.2812075, -1.490749, -3.743947, 0, 1, 0.3529412, 1,
-0.2791044, 0.5761837, -0.2655811, 0, 1, 0.3568628, 1,
-0.2777523, -1.617512, -3.297337, 0, 1, 0.3647059, 1,
-0.2767344, 0.1792374, -0.9795334, 0, 1, 0.3686275, 1,
-0.2763673, -0.7082164, -1.07844, 0, 1, 0.3764706, 1,
-0.273827, 1.226279, -1.269759, 0, 1, 0.3803922, 1,
-0.2524008, -2.680277, -4.341219, 0, 1, 0.3882353, 1,
-0.2500763, 0.0348072, -2.673234, 0, 1, 0.3921569, 1,
-0.2491982, 1.179999, -2.03964, 0, 1, 0.4, 1,
-0.2473296, 1.059433, 0.4121709, 0, 1, 0.4078431, 1,
-0.2435105, 0.6310055, 0.1960015, 0, 1, 0.4117647, 1,
-0.2417887, -0.7010571, -2.693027, 0, 1, 0.4196078, 1,
-0.2384642, -0.3899553, -2.699839, 0, 1, 0.4235294, 1,
-0.2346237, 0.4594576, -2.008778, 0, 1, 0.4313726, 1,
-0.2335778, 0.3413944, 0.9812047, 0, 1, 0.4352941, 1,
-0.2303621, -0.4282404, -1.89423, 0, 1, 0.4431373, 1,
-0.2255957, 0.1977041, -1.817181, 0, 1, 0.4470588, 1,
-0.223999, -0.4287311, -2.720969, 0, 1, 0.454902, 1,
-0.2211855, 0.1285778, -0.9679276, 0, 1, 0.4588235, 1,
-0.2199065, -0.1283241, -3.623124, 0, 1, 0.4666667, 1,
-0.2182356, 0.4455619, -1.842239, 0, 1, 0.4705882, 1,
-0.2159892, -0.1898277, -3.587596, 0, 1, 0.4784314, 1,
-0.2139319, 1.307403, 0.8686842, 0, 1, 0.4823529, 1,
-0.2111448, 0.5667604, 0.7199452, 0, 1, 0.4901961, 1,
-0.2109565, -0.6399787, -3.270822, 0, 1, 0.4941176, 1,
-0.2042178, -0.1571849, -1.612794, 0, 1, 0.5019608, 1,
-0.2036634, 0.3861536, 0.6433501, 0, 1, 0.509804, 1,
-0.2019384, 0.2960406, -1.07956, 0, 1, 0.5137255, 1,
-0.2012381, -0.2563511, -2.748267, 0, 1, 0.5215687, 1,
-0.199962, 0.854569, 0.09463503, 0, 1, 0.5254902, 1,
-0.1995914, -0.2883038, -4.611034, 0, 1, 0.5333334, 1,
-0.1981476, -0.1448012, -2.906575, 0, 1, 0.5372549, 1,
-0.1955262, -0.9672721, -2.62422, 0, 1, 0.5450981, 1,
-0.1944652, -1.036364, -4.153895, 0, 1, 0.5490196, 1,
-0.1933607, -0.8261521, -2.57665, 0, 1, 0.5568628, 1,
-0.1927066, -0.2039258, -3.251312, 0, 1, 0.5607843, 1,
-0.1900117, -0.794663, -2.00091, 0, 1, 0.5686275, 1,
-0.1883996, -0.26137, -0.986863, 0, 1, 0.572549, 1,
-0.18339, -0.3700233, -1.511905, 0, 1, 0.5803922, 1,
-0.1827924, 0.1777707, 1.198335, 0, 1, 0.5843138, 1,
-0.1815634, -1.072437, -4.301911, 0, 1, 0.5921569, 1,
-0.1759168, -0.9861947, -2.796055, 0, 1, 0.5960785, 1,
-0.172763, 0.835961, 0.2678524, 0, 1, 0.6039216, 1,
-0.1726518, -1.476368, -3.590688, 0, 1, 0.6117647, 1,
-0.1693324, -0.02861883, -2.750949, 0, 1, 0.6156863, 1,
-0.1692178, -0.2294702, -0.9077114, 0, 1, 0.6235294, 1,
-0.1646801, 0.03171036, -0.3347598, 0, 1, 0.627451, 1,
-0.1596049, 0.5603374, -0.5598343, 0, 1, 0.6352941, 1,
-0.1512857, -2.161625, -3.559392, 0, 1, 0.6392157, 1,
-0.1479773, 0.0454127, -1.272469, 0, 1, 0.6470588, 1,
-0.1478171, -1.674718, -2.739287, 0, 1, 0.6509804, 1,
-0.145827, 0.7660939, -0.3220558, 0, 1, 0.6588235, 1,
-0.1455636, -0.9726351, -3.099265, 0, 1, 0.6627451, 1,
-0.1437929, -1.958878, -2.393756, 0, 1, 0.6705883, 1,
-0.1432481, 0.08402377, -0.5860304, 0, 1, 0.6745098, 1,
-0.1412358, -0.8398632, -4.188326, 0, 1, 0.682353, 1,
-0.1389742, 0.7038634, 0.6223974, 0, 1, 0.6862745, 1,
-0.1383976, 0.8361934, -0.3758406, 0, 1, 0.6941177, 1,
-0.1352194, -0.5538083, -3.535144, 0, 1, 0.7019608, 1,
-0.1340657, -1.107464, -2.960016, 0, 1, 0.7058824, 1,
-0.1240598, 0.7304042, 0.3518749, 0, 1, 0.7137255, 1,
-0.1195073, -0.872779, -1.805988, 0, 1, 0.7176471, 1,
-0.1194947, 0.5518091, -0.9742732, 0, 1, 0.7254902, 1,
-0.1117776, 1.222664, 0.1590525, 0, 1, 0.7294118, 1,
-0.1097826, 0.2159145, 0.2397085, 0, 1, 0.7372549, 1,
-0.1062456, -0.03812502, -2.090571, 0, 1, 0.7411765, 1,
-0.1036912, -0.3441202, -2.651671, 0, 1, 0.7490196, 1,
-0.1006331, 0.325021, -2.400806, 0, 1, 0.7529412, 1,
-0.09777891, 0.2591434, 0.8503577, 0, 1, 0.7607843, 1,
-0.09771724, -0.2298868, -0.9847806, 0, 1, 0.7647059, 1,
-0.09370652, 1.30901, -0.7166663, 0, 1, 0.772549, 1,
-0.09194921, 2.928371, -0.1080621, 0, 1, 0.7764706, 1,
-0.08897246, 1.34449, -0.3728138, 0, 1, 0.7843137, 1,
-0.08180116, -0.7121662, -3.974102, 0, 1, 0.7882353, 1,
-0.08079913, -0.8589461, -2.311183, 0, 1, 0.7960784, 1,
-0.080493, -0.5952245, -2.722075, 0, 1, 0.8039216, 1,
-0.07652373, -0.1279347, -2.137273, 0, 1, 0.8078431, 1,
-0.07348403, 0.1301023, 1.026066, 0, 1, 0.8156863, 1,
-0.07076213, 1.567085, 0.218853, 0, 1, 0.8196079, 1,
-0.0704065, 2.040385, 0.6685393, 0, 1, 0.827451, 1,
-0.06903028, 1.123652, 0.207815, 0, 1, 0.8313726, 1,
-0.06552427, -0.8128108, -3.039115, 0, 1, 0.8392157, 1,
-0.06282061, -0.2955717, -3.543662, 0, 1, 0.8431373, 1,
-0.06078659, 0.1671537, 0.1125542, 0, 1, 0.8509804, 1,
-0.05733649, -1.80214, -3.710654, 0, 1, 0.854902, 1,
-0.05577468, 1.404195, -2.195349, 0, 1, 0.8627451, 1,
-0.05537633, -0.2862926, -2.118078, 0, 1, 0.8666667, 1,
-0.05415203, -0.0549114, -2.525434, 0, 1, 0.8745098, 1,
-0.04356914, 0.09874991, -0.8821937, 0, 1, 0.8784314, 1,
-0.04354817, -0.04666341, -3.026824, 0, 1, 0.8862745, 1,
-0.04241068, -0.7168394, -3.560629, 0, 1, 0.8901961, 1,
-0.04174047, 0.3245559, 0.7529979, 0, 1, 0.8980392, 1,
-0.04104316, 0.1189875, -0.9379356, 0, 1, 0.9058824, 1,
-0.04069589, -0.02638943, -0.1675851, 0, 1, 0.9098039, 1,
-0.03974513, -0.7683133, -4.792007, 0, 1, 0.9176471, 1,
-0.03254255, 0.4744292, -0.2691411, 0, 1, 0.9215686, 1,
-0.02781266, 1.276638, -0.5998805, 0, 1, 0.9294118, 1,
-0.02556793, -0.4208358, -4.372245, 0, 1, 0.9333333, 1,
-0.02353919, -0.326063, -4.8275, 0, 1, 0.9411765, 1,
-0.02194487, -1.728325, -3.901746, 0, 1, 0.945098, 1,
-0.0200385, -0.6966433, -3.039536, 0, 1, 0.9529412, 1,
-0.01151063, 0.05297346, -0.3588555, 0, 1, 0.9568627, 1,
-0.01069926, 1.422002, 1.366754, 0, 1, 0.9647059, 1,
-0.009821675, 1.221933, -0.3554232, 0, 1, 0.9686275, 1,
-0.008475479, 0.07286946, 0.04730661, 0, 1, 0.9764706, 1,
-0.007565052, 1.144855, -0.3683181, 0, 1, 0.9803922, 1,
-0.006167199, 1.249397, -2.180405, 0, 1, 0.9882353, 1,
0.0009622556, 0.5820376, 0.00574005, 0, 1, 0.9921569, 1,
0.001035632, -0.9073849, 3.42272, 0, 1, 1, 1,
0.00137044, 0.3163666, -0.4712058, 0, 0.9921569, 1, 1,
0.009926045, 2.413068, -0.2435611, 0, 0.9882353, 1, 1,
0.01038966, -0.7261326, 3.015676, 0, 0.9803922, 1, 1,
0.01123331, -1.84162, 2.663498, 0, 0.9764706, 1, 1,
0.0141129, 0.5669779, 0.2195168, 0, 0.9686275, 1, 1,
0.02173588, 1.190929, 2.405536, 0, 0.9647059, 1, 1,
0.02942777, -0.09392936, 3.191592, 0, 0.9568627, 1, 1,
0.03322053, 0.4175158, 1.188033, 0, 0.9529412, 1, 1,
0.03616165, 0.8413025, -1.379666, 0, 0.945098, 1, 1,
0.03906019, 1.025348, 0.223607, 0, 0.9411765, 1, 1,
0.03921296, -0.526173, 2.723136, 0, 0.9333333, 1, 1,
0.03980125, -0.6218264, 2.612546, 0, 0.9294118, 1, 1,
0.04008638, -0.5202807, 1.092155, 0, 0.9215686, 1, 1,
0.04296054, 1.572899, -0.4300877, 0, 0.9176471, 1, 1,
0.04431725, 0.2901034, -2.278553, 0, 0.9098039, 1, 1,
0.04615524, 0.9563064, 0.4980673, 0, 0.9058824, 1, 1,
0.04703305, 0.3243695, 0.3871858, 0, 0.8980392, 1, 1,
0.05036187, 1.140303, -0.1825344, 0, 0.8901961, 1, 1,
0.05144704, -0.3491196, 4.418981, 0, 0.8862745, 1, 1,
0.05151534, -0.4679002, 2.572821, 0, 0.8784314, 1, 1,
0.05441826, 0.0474467, 1.979781, 0, 0.8745098, 1, 1,
0.0588124, 0.1473972, 2.200896, 0, 0.8666667, 1, 1,
0.06437664, -0.7911454, 4.157079, 0, 0.8627451, 1, 1,
0.06635308, 0.1576144, 0.153897, 0, 0.854902, 1, 1,
0.06828736, 1.367631, 1.488019, 0, 0.8509804, 1, 1,
0.0687339, 0.05543764, 0.895696, 0, 0.8431373, 1, 1,
0.07209916, -1.391037, 3.229348, 0, 0.8392157, 1, 1,
0.07237237, 0.5475439, 0.5286298, 0, 0.8313726, 1, 1,
0.0729171, 1.261906, -0.8247528, 0, 0.827451, 1, 1,
0.07407045, 0.7237551, -0.2481692, 0, 0.8196079, 1, 1,
0.07565673, -0.265755, 6.443347, 0, 0.8156863, 1, 1,
0.08422574, -0.3408215, 3.305425, 0, 0.8078431, 1, 1,
0.08682507, -1.088096, 3.243232, 0, 0.8039216, 1, 1,
0.08761156, -0.540518, 2.375258, 0, 0.7960784, 1, 1,
0.08816944, -0.7244719, 2.987954, 0, 0.7882353, 1, 1,
0.09095269, 0.8173047, -0.194325, 0, 0.7843137, 1, 1,
0.09110076, -1.353356, 2.397769, 0, 0.7764706, 1, 1,
0.09129465, -0.4211473, 2.20549, 0, 0.772549, 1, 1,
0.09233038, -0.7283946, 2.459823, 0, 0.7647059, 1, 1,
0.09279767, -0.2052997, 2.003136, 0, 0.7607843, 1, 1,
0.09635383, -0.95258, 1.219387, 0, 0.7529412, 1, 1,
0.09729259, 0.67881, -0.6865816, 0, 0.7490196, 1, 1,
0.0991945, -0.1580808, 1.785246, 0, 0.7411765, 1, 1,
0.09992612, -1.269756, 1.769526, 0, 0.7372549, 1, 1,
0.1062305, -1.049366, 4.030283, 0, 0.7294118, 1, 1,
0.1080533, -0.4131553, 4.607769, 0, 0.7254902, 1, 1,
0.109176, -0.1488395, 3.258008, 0, 0.7176471, 1, 1,
0.1093647, -1.305448, 3.841819, 0, 0.7137255, 1, 1,
0.1109666, -0.4303724, 2.243671, 0, 0.7058824, 1, 1,
0.1120201, -0.05048282, 1.657335, 0, 0.6980392, 1, 1,
0.113928, -0.07411934, 3.225544, 0, 0.6941177, 1, 1,
0.1180684, -0.7123408, 2.085675, 0, 0.6862745, 1, 1,
0.1184279, 0.2869202, 2.010018, 0, 0.682353, 1, 1,
0.1200087, -0.769323, 2.813749, 0, 0.6745098, 1, 1,
0.1302882, -2.915915, 3.781917, 0, 0.6705883, 1, 1,
0.131882, -1.048667, 3.868483, 0, 0.6627451, 1, 1,
0.1353227, -0.4154833, 3.735532, 0, 0.6588235, 1, 1,
0.1367355, 0.1329887, -0.08386929, 0, 0.6509804, 1, 1,
0.1371881, -0.5364485, 2.001399, 0, 0.6470588, 1, 1,
0.1422289, 0.8568891, 0.4969315, 0, 0.6392157, 1, 1,
0.1441388, -1.011845, 3.34931, 0, 0.6352941, 1, 1,
0.1525423, 0.4431041, 0.3116326, 0, 0.627451, 1, 1,
0.1538211, -0.3934407, 1.498053, 0, 0.6235294, 1, 1,
0.1543169, -1.873335, 3.768069, 0, 0.6156863, 1, 1,
0.1552336, 1.314326, -3.02439, 0, 0.6117647, 1, 1,
0.1563952, -1.846528, 4.588313, 0, 0.6039216, 1, 1,
0.1596294, -0.7866555, 1.543216, 0, 0.5960785, 1, 1,
0.1604245, 0.07765432, 0.1857452, 0, 0.5921569, 1, 1,
0.1610398, 1.20036, 0.6271474, 0, 0.5843138, 1, 1,
0.1614538, 0.155682, -0.3743058, 0, 0.5803922, 1, 1,
0.1633817, 0.4551268, 1.540024, 0, 0.572549, 1, 1,
0.1670816, -0.9396971, 2.446446, 0, 0.5686275, 1, 1,
0.1770368, -0.8037835, 3.764116, 0, 0.5607843, 1, 1,
0.1796603, 2.178977, 0.9625551, 0, 0.5568628, 1, 1,
0.1808444, 0.2726875, 1.516143, 0, 0.5490196, 1, 1,
0.18802, -0.9045065, 4.01247, 0, 0.5450981, 1, 1,
0.1936506, -0.8399844, 3.393876, 0, 0.5372549, 1, 1,
0.1955678, 0.7758148, 0.1313334, 0, 0.5333334, 1, 1,
0.1991786, -0.02504621, 2.196459, 0, 0.5254902, 1, 1,
0.1996833, -0.07416943, 0.6371556, 0, 0.5215687, 1, 1,
0.1998769, -2.245659, 4.847549, 0, 0.5137255, 1, 1,
0.2042721, 2.02619, -0.5279737, 0, 0.509804, 1, 1,
0.2046514, 1.777082, -0.1885542, 0, 0.5019608, 1, 1,
0.2057725, 0.9343969, 2.880533, 0, 0.4941176, 1, 1,
0.2070406, -0.002685223, 2.076864, 0, 0.4901961, 1, 1,
0.2080387, -0.3970256, 2.542067, 0, 0.4823529, 1, 1,
0.2108071, -0.4052523, 1.98366, 0, 0.4784314, 1, 1,
0.2127626, 0.2310183, -0.9062856, 0, 0.4705882, 1, 1,
0.2148257, -0.04568803, -0.6228521, 0, 0.4666667, 1, 1,
0.2156738, 0.3153362, 1.549118, 0, 0.4588235, 1, 1,
0.2206581, 2.133273, -1.516416, 0, 0.454902, 1, 1,
0.2224094, 0.4663571, -0.7577642, 0, 0.4470588, 1, 1,
0.2234832, 1.278236, 0.4546159, 0, 0.4431373, 1, 1,
0.2236168, -2.30092, 3.355768, 0, 0.4352941, 1, 1,
0.2305427, 0.1912857, -0.221113, 0, 0.4313726, 1, 1,
0.2348329, 1.388837, 0.8904875, 0, 0.4235294, 1, 1,
0.2365128, -1.210857, 3.536868, 0, 0.4196078, 1, 1,
0.237737, 0.3321636, 0.2214281, 0, 0.4117647, 1, 1,
0.2444082, -0.3769347, 1.512875, 0, 0.4078431, 1, 1,
0.2468523, 0.7944584, 1.355579, 0, 0.4, 1, 1,
0.2543945, 3.353019, -1.159732, 0, 0.3921569, 1, 1,
0.2545851, 0.1722373, 1.218328, 0, 0.3882353, 1, 1,
0.2557627, 1.287636, -0.3975348, 0, 0.3803922, 1, 1,
0.2601807, -0.7119038, 4.005166, 0, 0.3764706, 1, 1,
0.2617955, 0.5211289, -0.03538303, 0, 0.3686275, 1, 1,
0.2626848, 1.587859, 0.6228212, 0, 0.3647059, 1, 1,
0.2629408, 0.2905152, 2.800762, 0, 0.3568628, 1, 1,
0.2652131, -1.383784, 2.699165, 0, 0.3529412, 1, 1,
0.2687324, -0.6569102, 1.823144, 0, 0.345098, 1, 1,
0.2714166, 0.9973022, -0.6599339, 0, 0.3411765, 1, 1,
0.2728074, -0.1806812, 2.309255, 0, 0.3333333, 1, 1,
0.2737108, 0.9067398, 1.567247, 0, 0.3294118, 1, 1,
0.2787938, 1.352949, -1.351172, 0, 0.3215686, 1, 1,
0.2801754, -0.4308643, 3.175666, 0, 0.3176471, 1, 1,
0.2807499, -0.2026894, 1.313282, 0, 0.3098039, 1, 1,
0.2827654, 0.8095545, 0.7468061, 0, 0.3058824, 1, 1,
0.286162, 1.464059, -0.05368872, 0, 0.2980392, 1, 1,
0.2878328, 0.3384954, 1.53089, 0, 0.2901961, 1, 1,
0.2923076, -0.6881539, 2.529407, 0, 0.2862745, 1, 1,
0.2939879, 1.211903, 1.905415, 0, 0.2784314, 1, 1,
0.2962808, -1.535164, 3.492625, 0, 0.2745098, 1, 1,
0.2993152, 0.1888995, 1.452149, 0, 0.2666667, 1, 1,
0.3065386, 0.8615748, 1.879059, 0, 0.2627451, 1, 1,
0.3121825, -0.1170722, -0.389856, 0, 0.254902, 1, 1,
0.3201288, 1.970656, -0.316441, 0, 0.2509804, 1, 1,
0.3205267, -0.834395, 4.045926, 0, 0.2431373, 1, 1,
0.3214876, -0.2823389, 3.115751, 0, 0.2392157, 1, 1,
0.3248764, -0.7324317, 2.195324, 0, 0.2313726, 1, 1,
0.3268179, 1.027601, 1.944278, 0, 0.227451, 1, 1,
0.3270285, 0.3177074, 0.06414188, 0, 0.2196078, 1, 1,
0.3281753, -1.348206, 2.358503, 0, 0.2156863, 1, 1,
0.3285629, -0.5374842, 2.595256, 0, 0.2078431, 1, 1,
0.3421677, -0.9318711, 3.82243, 0, 0.2039216, 1, 1,
0.3442791, 0.06754459, 2.835844, 0, 0.1960784, 1, 1,
0.3480142, 0.6419731, 0.08446532, 0, 0.1882353, 1, 1,
0.3554248, -0.1224832, 1.841101, 0, 0.1843137, 1, 1,
0.3570677, 0.5206749, -0.02095269, 0, 0.1764706, 1, 1,
0.3601612, 0.8770757, -0.1280154, 0, 0.172549, 1, 1,
0.3605044, 1.834898, 0.3983432, 0, 0.1647059, 1, 1,
0.3633317, 0.1928872, -0.2539498, 0, 0.1607843, 1, 1,
0.3680744, -0.4543139, 1.790337, 0, 0.1529412, 1, 1,
0.3744947, 2.740417, -1.460196, 0, 0.1490196, 1, 1,
0.3756963, 0.1021358, 0.9108131, 0, 0.1411765, 1, 1,
0.3795032, -0.8354769, 2.550306, 0, 0.1372549, 1, 1,
0.3820398, 1.079983, 1.606524, 0, 0.1294118, 1, 1,
0.3827881, 0.5721844, 1.48661, 0, 0.1254902, 1, 1,
0.3846059, -0.9034676, 1.559514, 0, 0.1176471, 1, 1,
0.3850449, -0.9042127, 3.245202, 0, 0.1137255, 1, 1,
0.385908, -0.1412642, 1.728159, 0, 0.1058824, 1, 1,
0.3877392, -0.3542987, 2.872995, 0, 0.09803922, 1, 1,
0.3901441, 1.946175, -2.24408, 0, 0.09411765, 1, 1,
0.3964934, 0.7121394, -0.4485793, 0, 0.08627451, 1, 1,
0.3973219, 1.559956, 1.198046, 0, 0.08235294, 1, 1,
0.3985683, -0.6218808, 3.311033, 0, 0.07450981, 1, 1,
0.3987684, -0.7521569, 4.241578, 0, 0.07058824, 1, 1,
0.3996296, 0.7053451, -0.4520546, 0, 0.0627451, 1, 1,
0.4003996, 1.116427, 1.52701, 0, 0.05882353, 1, 1,
0.401804, -0.2280118, 0.1269325, 0, 0.05098039, 1, 1,
0.4038461, 0.2826594, 0.06459314, 0, 0.04705882, 1, 1,
0.4070378, 0.054853, 1.818179, 0, 0.03921569, 1, 1,
0.4078549, 0.6382619, 0.8188113, 0, 0.03529412, 1, 1,
0.4111496, -0.288616, 1.875213, 0, 0.02745098, 1, 1,
0.413144, -0.1152028, 0.6324114, 0, 0.02352941, 1, 1,
0.4199669, -0.2331513, 1.592213, 0, 0.01568628, 1, 1,
0.4213074, 0.6573457, 1.932903, 0, 0.01176471, 1, 1,
0.4230452, 0.694142, 0.1979224, 0, 0.003921569, 1, 1,
0.4267156, -0.07859424, 2.272239, 0.003921569, 0, 1, 1,
0.4289573, 1.160383, 1.151959, 0.007843138, 0, 1, 1,
0.4319705, 0.3643961, 0.4152415, 0.01568628, 0, 1, 1,
0.4329211, -0.8677848, 2.871789, 0.01960784, 0, 1, 1,
0.4379003, 1.210678, 0.9699357, 0.02745098, 0, 1, 1,
0.4404612, 0.4421673, 0.2558199, 0.03137255, 0, 1, 1,
0.4415332, -1.057458, 3.271327, 0.03921569, 0, 1, 1,
0.4420006, -0.4467525, 1.70715, 0.04313726, 0, 1, 1,
0.4504841, 1.027899, -1.84351, 0.05098039, 0, 1, 1,
0.4523625, 0.3217226, 0.01978145, 0.05490196, 0, 1, 1,
0.4605314, -0.681789, 4.843944, 0.0627451, 0, 1, 1,
0.4668733, -1.737967, 1.183444, 0.06666667, 0, 1, 1,
0.4677138, 1.472895, 1.915567, 0.07450981, 0, 1, 1,
0.4686466, 2.181061, 1.079561, 0.07843138, 0, 1, 1,
0.4694033, 0.05990986, 0.2993154, 0.08627451, 0, 1, 1,
0.4716061, 1.953734, -1.635617, 0.09019608, 0, 1, 1,
0.4793996, 2.040284, 0.9000887, 0.09803922, 0, 1, 1,
0.4890793, 1.743996, -0.1456468, 0.1058824, 0, 1, 1,
0.4899848, -0.1007058, 1.783056, 0.1098039, 0, 1, 1,
0.4957673, 0.4050762, 1.726434, 0.1176471, 0, 1, 1,
0.4970196, 1.324697, -0.7282526, 0.1215686, 0, 1, 1,
0.5018736, -1.092238, 2.339741, 0.1294118, 0, 1, 1,
0.503226, -0.6037799, 1.822369, 0.1333333, 0, 1, 1,
0.5034314, -1.849175, 1.937174, 0.1411765, 0, 1, 1,
0.5037941, -0.08364958, 2.261208, 0.145098, 0, 1, 1,
0.5147574, 0.8403833, 0.7376415, 0.1529412, 0, 1, 1,
0.5179048, -1.437377, 3.519386, 0.1568628, 0, 1, 1,
0.5202391, 0.4014875, -1.182449, 0.1647059, 0, 1, 1,
0.521217, 1.878039, -0.2149643, 0.1686275, 0, 1, 1,
0.522135, 0.02132051, 2.082593, 0.1764706, 0, 1, 1,
0.5259078, 2.340808, -1.072976, 0.1803922, 0, 1, 1,
0.5269278, 1.024864, 0.2637802, 0.1882353, 0, 1, 1,
0.5309346, -0.9073058, 1.028764, 0.1921569, 0, 1, 1,
0.531795, -0.9567159, 1.891399, 0.2, 0, 1, 1,
0.538604, 1.001627, -0.8632774, 0.2078431, 0, 1, 1,
0.5389487, -0.7262548, 2.57501, 0.2117647, 0, 1, 1,
0.5392374, 1.062935, 0.2906625, 0.2196078, 0, 1, 1,
0.5441007, 0.1913807, 0.9990978, 0.2235294, 0, 1, 1,
0.544427, 0.1349341, 1.319865, 0.2313726, 0, 1, 1,
0.5476771, -0.9446223, 0.2347064, 0.2352941, 0, 1, 1,
0.5486878, -1.208743, 3.975131, 0.2431373, 0, 1, 1,
0.549279, -0.6329137, 2.408894, 0.2470588, 0, 1, 1,
0.5503799, 1.236458, -0.6402241, 0.254902, 0, 1, 1,
0.5509773, 0.8138513, 0.778917, 0.2588235, 0, 1, 1,
0.5517815, -0.4476292, 2.25186, 0.2666667, 0, 1, 1,
0.5526996, 0.1005779, 2.571961, 0.2705882, 0, 1, 1,
0.5611736, 0.2213171, -1.035586, 0.2784314, 0, 1, 1,
0.563126, -0.2428555, 2.32499, 0.282353, 0, 1, 1,
0.5683766, -1.021352, 3.630684, 0.2901961, 0, 1, 1,
0.5687237, -1.524224, 3.356324, 0.2941177, 0, 1, 1,
0.5711038, -0.2010331, 1.082072, 0.3019608, 0, 1, 1,
0.57183, 0.0145102, 1.000957, 0.3098039, 0, 1, 1,
0.575253, -0.8704576, 2.011679, 0.3137255, 0, 1, 1,
0.5772946, -1.427943, 3.618571, 0.3215686, 0, 1, 1,
0.5798559, -0.7107792, 1.817231, 0.3254902, 0, 1, 1,
0.5833422, -0.1101354, -0.1719796, 0.3333333, 0, 1, 1,
0.5903646, -1.31929, 1.803243, 0.3372549, 0, 1, 1,
0.5954347, 1.286754, 1.962967, 0.345098, 0, 1, 1,
0.5983942, 0.9248857, 1.324715, 0.3490196, 0, 1, 1,
0.6014733, -0.7364268, 2.247305, 0.3568628, 0, 1, 1,
0.6098241, 1.079988, 0.3318587, 0.3607843, 0, 1, 1,
0.6101993, 0.5208597, 0.6962227, 0.3686275, 0, 1, 1,
0.6156979, -1.186973, 4.182248, 0.372549, 0, 1, 1,
0.6273133, 0.4727435, 1.960922, 0.3803922, 0, 1, 1,
0.6320126, 0.1523169, 1.475476, 0.3843137, 0, 1, 1,
0.6343822, 0.04877544, 2.872682, 0.3921569, 0, 1, 1,
0.6356504, -0.7500128, 2.077334, 0.3960784, 0, 1, 1,
0.6362749, 1.021324, 2.696103, 0.4039216, 0, 1, 1,
0.639756, -1.180197, 2.609566, 0.4117647, 0, 1, 1,
0.6403379, -0.3425833, 1.574121, 0.4156863, 0, 1, 1,
0.6410309, -0.3029262, 1.570784, 0.4235294, 0, 1, 1,
0.6430783, -2.064388, 4.128402, 0.427451, 0, 1, 1,
0.645275, -1.210096, 3.582509, 0.4352941, 0, 1, 1,
0.6483302, -1.181251, 2.94188, 0.4392157, 0, 1, 1,
0.6503697, -0.6008644, 2.460976, 0.4470588, 0, 1, 1,
0.6545228, 2.821174, -0.6953423, 0.4509804, 0, 1, 1,
0.6577106, 0.2497662, -0.7214302, 0.4588235, 0, 1, 1,
0.6662174, 1.695819, -1.256185, 0.4627451, 0, 1, 1,
0.6670723, 1.335248, -0.08117721, 0.4705882, 0, 1, 1,
0.6699101, 0.6419579, 2.30847, 0.4745098, 0, 1, 1,
0.6720404, -0.1679131, 4.188985, 0.4823529, 0, 1, 1,
0.6746073, 0.8841693, 1.778747, 0.4862745, 0, 1, 1,
0.6777683, 0.2790962, 0.1898606, 0.4941176, 0, 1, 1,
0.6829898, -1.020131, 1.838631, 0.5019608, 0, 1, 1,
0.6891779, 0.6521884, 1.264918, 0.5058824, 0, 1, 1,
0.689523, -0.7211169, 3.448228, 0.5137255, 0, 1, 1,
0.6907908, 0.9599004, -0.685047, 0.5176471, 0, 1, 1,
0.6924589, -0.5056579, 3.991338, 0.5254902, 0, 1, 1,
0.704289, 1.555007, 2.750566, 0.5294118, 0, 1, 1,
0.7064944, -1.788484, 1.82948, 0.5372549, 0, 1, 1,
0.7102073, 0.1945799, 0.9052016, 0.5411765, 0, 1, 1,
0.7187624, 0.02475897, 0.3424726, 0.5490196, 0, 1, 1,
0.7255542, -0.2553054, 0.9573144, 0.5529412, 0, 1, 1,
0.7289263, -1.833219, 1.864803, 0.5607843, 0, 1, 1,
0.731968, 1.268461, 0.800593, 0.5647059, 0, 1, 1,
0.733168, -0.4097207, 2.90421, 0.572549, 0, 1, 1,
0.7417958, 0.826749, -0.6539016, 0.5764706, 0, 1, 1,
0.745323, 1.442347, 1.267924, 0.5843138, 0, 1, 1,
0.7538849, -0.845026, 3.120188, 0.5882353, 0, 1, 1,
0.7544169, 0.3353098, 0.6128961, 0.5960785, 0, 1, 1,
0.7583737, 0.8473336, 1.023301, 0.6039216, 0, 1, 1,
0.7609411, -0.09217889, 0.9738758, 0.6078432, 0, 1, 1,
0.7620118, -0.7470961, 2.969166, 0.6156863, 0, 1, 1,
0.775678, -0.9984468, 2.116025, 0.6196079, 0, 1, 1,
0.7797046, 0.989548, 1.843877, 0.627451, 0, 1, 1,
0.7915028, 1.253386, 0.5213711, 0.6313726, 0, 1, 1,
0.7946629, 0.5997167, 2.017271, 0.6392157, 0, 1, 1,
0.7973535, -0.07608773, 1.703584, 0.6431373, 0, 1, 1,
0.7998093, 0.431704, 3.374423, 0.6509804, 0, 1, 1,
0.8000715, -0.04771752, 0.9684302, 0.654902, 0, 1, 1,
0.8029678, 0.1548228, 3.121546, 0.6627451, 0, 1, 1,
0.8054128, -0.5692031, 2.057854, 0.6666667, 0, 1, 1,
0.8123057, -0.51464, 4.640593, 0.6745098, 0, 1, 1,
0.8127809, -0.1805847, 1.48214, 0.6784314, 0, 1, 1,
0.8279266, -0.9026836, 1.785433, 0.6862745, 0, 1, 1,
0.829991, 0.08923166, 1.583171, 0.6901961, 0, 1, 1,
0.8308012, -0.2331643, 2.447343, 0.6980392, 0, 1, 1,
0.8329683, -0.8028058, 2.330657, 0.7058824, 0, 1, 1,
0.8367758, 1.641444, -0.2017887, 0.7098039, 0, 1, 1,
0.848366, -0.7584141, 4.214129, 0.7176471, 0, 1, 1,
0.8483964, -0.8738109, 2.439895, 0.7215686, 0, 1, 1,
0.8498297, -0.03445741, 1.308703, 0.7294118, 0, 1, 1,
0.8510112, -2.014096, 1.808977, 0.7333333, 0, 1, 1,
0.8526046, 0.1314832, 2.246582, 0.7411765, 0, 1, 1,
0.8528492, -1.399983, 3.929619, 0.7450981, 0, 1, 1,
0.8584843, 1.909811, 0.03466766, 0.7529412, 0, 1, 1,
0.8601929, -0.4289339, 2.080795, 0.7568628, 0, 1, 1,
0.8620096, 0.873768, -0.7313838, 0.7647059, 0, 1, 1,
0.863245, -0.3939771, 1.144511, 0.7686275, 0, 1, 1,
0.8633853, 1.048584, 1.114788, 0.7764706, 0, 1, 1,
0.8652657, -0.1888887, 1.73878, 0.7803922, 0, 1, 1,
0.8670831, 0.5722036, 1.227193, 0.7882353, 0, 1, 1,
0.8687982, -0.5145733, 1.455666, 0.7921569, 0, 1, 1,
0.8720392, -0.6109093, 1.957257, 0.8, 0, 1, 1,
0.8795037, -0.1211058, 2.735758, 0.8078431, 0, 1, 1,
0.8807498, 1.742379, 1.499085, 0.8117647, 0, 1, 1,
0.8828917, 1.58735, 2.848173, 0.8196079, 0, 1, 1,
0.8858837, 0.2845316, 3.541016, 0.8235294, 0, 1, 1,
0.897624, -1.699911, 3.685674, 0.8313726, 0, 1, 1,
0.8981127, -0.2829806, 3.362017, 0.8352941, 0, 1, 1,
0.9004853, 0.6513825, 2.690759, 0.8431373, 0, 1, 1,
0.9031588, -0.9052702, 1.670017, 0.8470588, 0, 1, 1,
0.9038393, -0.9300504, 2.657149, 0.854902, 0, 1, 1,
0.9189354, -0.4250296, 1.772739, 0.8588235, 0, 1, 1,
0.9217462, 0.8147645, 0.7313113, 0.8666667, 0, 1, 1,
0.932081, -0.06549211, 1.528786, 0.8705882, 0, 1, 1,
0.9331535, 0.1356439, 0.3934073, 0.8784314, 0, 1, 1,
0.9355935, 1.16768, -0.8711694, 0.8823529, 0, 1, 1,
0.9514686, -0.3234956, 2.820241, 0.8901961, 0, 1, 1,
0.9567139, 0.463088, 0.37261, 0.8941177, 0, 1, 1,
0.9607416, 0.1241969, 0.3365065, 0.9019608, 0, 1, 1,
0.9663872, 1.118601, 1.741573, 0.9098039, 0, 1, 1,
0.9670949, 1.1746, 0.8686886, 0.9137255, 0, 1, 1,
0.9710932, 0.09740259, 3.22808, 0.9215686, 0, 1, 1,
0.9772691, -0.6630762, 1.776408, 0.9254902, 0, 1, 1,
0.9808941, -0.07810304, 1.1582, 0.9333333, 0, 1, 1,
0.9815105, -0.9146289, 1.186212, 0.9372549, 0, 1, 1,
0.98519, -0.5429331, 2.435987, 0.945098, 0, 1, 1,
0.9869056, 2.14147, 2.288461, 0.9490196, 0, 1, 1,
0.9879138, -0.8679866, 1.299333, 0.9568627, 0, 1, 1,
0.9881771, 0.389371, 1.571341, 0.9607843, 0, 1, 1,
0.9893291, 0.1557458, 1.616444, 0.9686275, 0, 1, 1,
0.9900461, 1.259443, 2.488612, 0.972549, 0, 1, 1,
0.9929197, 0.6149416, 0.2516313, 0.9803922, 0, 1, 1,
0.9960714, -0.08688947, 2.685561, 0.9843137, 0, 1, 1,
0.9986413, 0.3869735, -0.1973337, 0.9921569, 0, 1, 1,
0.9991091, -0.2522913, 1.280818, 0.9960784, 0, 1, 1,
0.9994407, -0.652997, 4.660338, 1, 0, 0.9960784, 1,
1.006096, -0.6777511, 2.399683, 1, 0, 0.9882353, 1,
1.008856, 0.5162249, -1.162689, 1, 0, 0.9843137, 1,
1.009374, -1.022672, 1.354515, 1, 0, 0.9764706, 1,
1.015278, 0.6206073, -0.7075204, 1, 0, 0.972549, 1,
1.015696, 0.2038449, 0.9019184, 1, 0, 0.9647059, 1,
1.020198, 0.2420801, 0.4284767, 1, 0, 0.9607843, 1,
1.025398, 0.4772327, -0.8629385, 1, 0, 0.9529412, 1,
1.027421, 2.374292, -0.3722917, 1, 0, 0.9490196, 1,
1.029517, 1.915652, 0.4759095, 1, 0, 0.9411765, 1,
1.03139, 1.769787, 0.9772318, 1, 0, 0.9372549, 1,
1.049837, 0.04237371, 1.094015, 1, 0, 0.9294118, 1,
1.057261, -1.359047, 2.91009, 1, 0, 0.9254902, 1,
1.060613, 0.496978, -0.4586831, 1, 0, 0.9176471, 1,
1.063908, -0.03691954, 0.5416425, 1, 0, 0.9137255, 1,
1.065354, -0.04265244, 1.978323, 1, 0, 0.9058824, 1,
1.067274, 0.2551256, 0.4663427, 1, 0, 0.9019608, 1,
1.070155, 1.952743, 0.6180199, 1, 0, 0.8941177, 1,
1.07672, -0.1047875, 2.494427, 1, 0, 0.8862745, 1,
1.083368, -0.6412503, 0.8035245, 1, 0, 0.8823529, 1,
1.095949, -1.076814, 2.497581, 1, 0, 0.8745098, 1,
1.098354, 0.1897979, 2.186721, 1, 0, 0.8705882, 1,
1.100084, 1.178496, 2.738053, 1, 0, 0.8627451, 1,
1.103432, 0.2906933, 3.453224, 1, 0, 0.8588235, 1,
1.105594, 0.9076226, -0.4782351, 1, 0, 0.8509804, 1,
1.117789, 0.05573034, 1.240621, 1, 0, 0.8470588, 1,
1.123958, 1.492148, 0.8027704, 1, 0, 0.8392157, 1,
1.130931, 0.075245, 1.449192, 1, 0, 0.8352941, 1,
1.132743, 0.8493535, 2.125194, 1, 0, 0.827451, 1,
1.135544, 0.2616301, 0.3018822, 1, 0, 0.8235294, 1,
1.138864, -0.2588555, 1.35826, 1, 0, 0.8156863, 1,
1.141929, -0.2867098, 0.5089558, 1, 0, 0.8117647, 1,
1.143158, 0.2074391, 2.689162, 1, 0, 0.8039216, 1,
1.161991, 0.52806, 1.192067, 1, 0, 0.7960784, 1,
1.171033, -0.003167622, 2.359208, 1, 0, 0.7921569, 1,
1.175729, -1.038668, 2.962286, 1, 0, 0.7843137, 1,
1.175837, -0.5704234, 2.707346, 1, 0, 0.7803922, 1,
1.178438, 2.282663, 1.740494, 1, 0, 0.772549, 1,
1.179858, 1.210546, 1.399047, 1, 0, 0.7686275, 1,
1.183418, -0.9079489, 3.172909, 1, 0, 0.7607843, 1,
1.183979, -1.064229, 3.041021, 1, 0, 0.7568628, 1,
1.1852, -1.358384, 2.826046, 1, 0, 0.7490196, 1,
1.196253, -0.2492745, 2.601788, 1, 0, 0.7450981, 1,
1.201923, 1.312486, 0.560977, 1, 0, 0.7372549, 1,
1.212135, -0.5997258, 1.550525, 1, 0, 0.7333333, 1,
1.212945, -0.6124464, -0.6470342, 1, 0, 0.7254902, 1,
1.213266, -1.838332, 4.074454, 1, 0, 0.7215686, 1,
1.213759, -1.485612, 1.663246, 1, 0, 0.7137255, 1,
1.215469, -0.2376307, 2.487328, 1, 0, 0.7098039, 1,
1.219882, -0.7783842, 2.17336, 1, 0, 0.7019608, 1,
1.225377, -0.7146125, 2.403449, 1, 0, 0.6941177, 1,
1.225738, -1.081363, 2.316236, 1, 0, 0.6901961, 1,
1.227196, 1.138893, 2.211727, 1, 0, 0.682353, 1,
1.228919, -1.559367, 0.9566485, 1, 0, 0.6784314, 1,
1.238476, 1.304556, 0.8305367, 1, 0, 0.6705883, 1,
1.238647, -0.7772104, 1.347515, 1, 0, 0.6666667, 1,
1.242653, 0.5266182, 2.348985, 1, 0, 0.6588235, 1,
1.247956, 1.759694, -1.354457, 1, 0, 0.654902, 1,
1.248815, 2.232688, 0.04877515, 1, 0, 0.6470588, 1,
1.253901, 1.914195, -0.1941621, 1, 0, 0.6431373, 1,
1.254059, 0.04329131, 1.068544, 1, 0, 0.6352941, 1,
1.25479, 1.324036, 1.139703, 1, 0, 0.6313726, 1,
1.26168, 0.9410754, 1.710652, 1, 0, 0.6235294, 1,
1.263108, -0.4334054, 0.8931782, 1, 0, 0.6196079, 1,
1.268224, 0.7900768, -0.2428794, 1, 0, 0.6117647, 1,
1.268921, 0.8204479, 2.078106, 1, 0, 0.6078432, 1,
1.278134, 1.515662, -0.8078946, 1, 0, 0.6, 1,
1.28073, -1.218152, 3.273211, 1, 0, 0.5921569, 1,
1.294228, -1.683312, 2.284111, 1, 0, 0.5882353, 1,
1.304649, 0.5254961, 1.86017, 1, 0, 0.5803922, 1,
1.319295, 0.6605828, 0.5254997, 1, 0, 0.5764706, 1,
1.323143, -0.5867078, 0.7782683, 1, 0, 0.5686275, 1,
1.330494, -2.173796, 4.613396, 1, 0, 0.5647059, 1,
1.338151, 0.597931, 0.9025437, 1, 0, 0.5568628, 1,
1.338945, 1.026401, 2.193363, 1, 0, 0.5529412, 1,
1.342828, 0.1335377, 2.606757, 1, 0, 0.5450981, 1,
1.344218, -0.3562357, 3.339838, 1, 0, 0.5411765, 1,
1.34763, -1.156616, 2.067365, 1, 0, 0.5333334, 1,
1.350801, -2.339811, 2.458748, 1, 0, 0.5294118, 1,
1.356564, 0.731755, 0.1466042, 1, 0, 0.5215687, 1,
1.382874, 0.02765206, 1.244101, 1, 0, 0.5176471, 1,
1.38986, -0.6308761, 2.432486, 1, 0, 0.509804, 1,
1.394987, -0.4657572, 1.82099, 1, 0, 0.5058824, 1,
1.398107, 1.082812, 0.8493816, 1, 0, 0.4980392, 1,
1.400726, 0.1445683, 2.460137, 1, 0, 0.4901961, 1,
1.401022, -0.6528919, 1.750693, 1, 0, 0.4862745, 1,
1.405074, 0.59475, 1.151934, 1, 0, 0.4784314, 1,
1.407129, -0.4062023, 3.435788, 1, 0, 0.4745098, 1,
1.408345, 0.8968925, -0.7349177, 1, 0, 0.4666667, 1,
1.409706, 0.2705777, 1.175443, 1, 0, 0.4627451, 1,
1.411895, -0.4508272, 3.361146, 1, 0, 0.454902, 1,
1.416363, 0.8642678, 2.321372, 1, 0, 0.4509804, 1,
1.418159, -0.9432667, 2.194877, 1, 0, 0.4431373, 1,
1.423544, -0.5906972, 0.9062892, 1, 0, 0.4392157, 1,
1.434269, -0.1904807, 0.7427492, 1, 0, 0.4313726, 1,
1.440823, 0.7444439, 2.12183, 1, 0, 0.427451, 1,
1.444049, -2.628483, 0.7272898, 1, 0, 0.4196078, 1,
1.463179, 0.7953383, 0.5392488, 1, 0, 0.4156863, 1,
1.467359, -0.5465064, 0.730204, 1, 0, 0.4078431, 1,
1.482892, 0.823174, 1.705791, 1, 0, 0.4039216, 1,
1.485379, -0.3036723, 0.4444552, 1, 0, 0.3960784, 1,
1.488191, 1.617772, 0.550867, 1, 0, 0.3882353, 1,
1.498976, 0.4915359, 1.2834, 1, 0, 0.3843137, 1,
1.509961, -0.4118347, -0.1653065, 1, 0, 0.3764706, 1,
1.535204, 0.5142668, 0.4665274, 1, 0, 0.372549, 1,
1.546438, 0.2373514, 1.585888, 1, 0, 0.3647059, 1,
1.54792, -1.538091, 2.315041, 1, 0, 0.3607843, 1,
1.549137, -0.6032823, 3.124931, 1, 0, 0.3529412, 1,
1.550228, 0.9424018, 0.8407416, 1, 0, 0.3490196, 1,
1.555817, -1.001553, 2.377784, 1, 0, 0.3411765, 1,
1.597796, 1.632541, 0.1418724, 1, 0, 0.3372549, 1,
1.598092, 1.048383, 0.5007637, 1, 0, 0.3294118, 1,
1.611122, -0.7055054, 0.6106134, 1, 0, 0.3254902, 1,
1.614464, -0.9879874, 1.558944, 1, 0, 0.3176471, 1,
1.618834, -2.073, 4.828063, 1, 0, 0.3137255, 1,
1.623049, -0.5036697, 2.458053, 1, 0, 0.3058824, 1,
1.639156, 0.637299, 0.8966628, 1, 0, 0.2980392, 1,
1.643914, 1.363337, 0.0662258, 1, 0, 0.2941177, 1,
1.649655, -0.04804417, 2.799158, 1, 0, 0.2862745, 1,
1.66059, 0.09493452, 0.3876669, 1, 0, 0.282353, 1,
1.697281, -0.1796914, 2.45352, 1, 0, 0.2745098, 1,
1.70088, 0.6649774, 2.311776, 1, 0, 0.2705882, 1,
1.702864, 0.3197452, 0.1542941, 1, 0, 0.2627451, 1,
1.704478, -0.6337791, 1.390137, 1, 0, 0.2588235, 1,
1.714223, -1.382667, 1.456859, 1, 0, 0.2509804, 1,
1.720105, -0.2338925, 0.939262, 1, 0, 0.2470588, 1,
1.731295, 0.700258, 1.066452, 1, 0, 0.2392157, 1,
1.754948, 1.122194, 1.411961, 1, 0, 0.2352941, 1,
1.760633, 0.5751321, 2.369389, 1, 0, 0.227451, 1,
1.771904, -1.908306, 2.109901, 1, 0, 0.2235294, 1,
1.778448, 1.153097, 2.900479, 1, 0, 0.2156863, 1,
1.779757, -0.1086127, 2.224852, 1, 0, 0.2117647, 1,
1.790506, 0.386127, 0.8087601, 1, 0, 0.2039216, 1,
1.798327, 0.02387026, -0.2767243, 1, 0, 0.1960784, 1,
1.801685, -0.8795635, 2.167459, 1, 0, 0.1921569, 1,
1.822917, -1.872237, 3.191027, 1, 0, 0.1843137, 1,
1.830821, -0.4603794, 3.624219, 1, 0, 0.1803922, 1,
1.838383, 0.1607514, 2.269408, 1, 0, 0.172549, 1,
1.853745, -0.5328205, 2.2274, 1, 0, 0.1686275, 1,
1.856631, 0.8016922, 1.169204, 1, 0, 0.1607843, 1,
1.86258, -0.09760726, 2.595839, 1, 0, 0.1568628, 1,
1.862823, 0.6071107, 1.159498, 1, 0, 0.1490196, 1,
1.888147, -0.5352772, 2.150428, 1, 0, 0.145098, 1,
1.893373, -0.835452, 1.763455, 1, 0, 0.1372549, 1,
1.896682, 0.3820853, -0.1354701, 1, 0, 0.1333333, 1,
1.92065, 1.164357, 0.2611326, 1, 0, 0.1254902, 1,
1.975267, 0.1826803, 0.6283221, 1, 0, 0.1215686, 1,
2.001944, -0.5686345, 0.6682032, 1, 0, 0.1137255, 1,
2.018993, -1.205504, 2.210302, 1, 0, 0.1098039, 1,
2.085252, -0.2053915, -1.27282, 1, 0, 0.1019608, 1,
2.09352, 0.5789997, 2.432308, 1, 0, 0.09411765, 1,
2.099968, 0.6166552, 0.1457828, 1, 0, 0.09019608, 1,
2.113326, 0.730539, 1.45304, 1, 0, 0.08235294, 1,
2.118407, 0.1707215, 1.263678, 1, 0, 0.07843138, 1,
2.138863, -1.207772, 1.351648, 1, 0, 0.07058824, 1,
2.158809, 0.4721366, 1.656428, 1, 0, 0.06666667, 1,
2.244003, -0.4123495, 2.453863, 1, 0, 0.05882353, 1,
2.261277, -1.039467, 2.112782, 1, 0, 0.05490196, 1,
2.321461, -1.881202, 3.565223, 1, 0, 0.04705882, 1,
2.331641, -0.4547019, 1.167323, 1, 0, 0.04313726, 1,
2.48042, 0.7498493, 2.116392, 1, 0, 0.03529412, 1,
2.553193, 0.4073898, 0.8634115, 1, 0, 0.03137255, 1,
2.634659, -0.4250677, 2.13284, 1, 0, 0.02352941, 1,
2.697185, -0.05523549, 2.345208, 1, 0, 0.01960784, 1,
3.028031, -1.522171, 1.383595, 1, 0, 0.01176471, 1,
3.247095, 1.67629, 2.59044, 1, 0, 0.007843138, 1
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
-0.2811458, -4.166257, -7.288012, 0, -0.5, 0.5, 0.5,
-0.2811458, -4.166257, -7.288012, 1, -0.5, 0.5, 0.5,
-0.2811458, -4.166257, -7.288012, 1, 1.5, 0.5, 0.5,
-0.2811458, -4.166257, -7.288012, 0, 1.5, 0.5, 0.5
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
-5.00546, 0.1382791, -7.288012, 0, -0.5, 0.5, 0.5,
-5.00546, 0.1382791, -7.288012, 1, -0.5, 0.5, 0.5,
-5.00546, 0.1382791, -7.288012, 1, 1.5, 0.5, 0.5,
-5.00546, 0.1382791, -7.288012, 0, 1.5, 0.5, 0.5
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
-5.00546, -4.166257, 0.572736, 0, -0.5, 0.5, 0.5,
-5.00546, -4.166257, 0.572736, 1, -0.5, 0.5, 0.5,
-5.00546, -4.166257, 0.572736, 1, 1.5, 0.5, 0.5,
-5.00546, -4.166257, 0.572736, 0, 1.5, 0.5, 0.5
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
-2, -3.172903, -5.473993,
2, -3.172903, -5.473993,
-2, -3.172903, -5.473993,
-2, -3.338462, -5.77633,
0, -3.172903, -5.473993,
0, -3.338462, -5.77633,
2, -3.172903, -5.473993,
2, -3.338462, -5.77633
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
-2, -3.66958, -6.381002, 0, -0.5, 0.5, 0.5,
-2, -3.66958, -6.381002, 1, -0.5, 0.5, 0.5,
-2, -3.66958, -6.381002, 1, 1.5, 0.5, 0.5,
-2, -3.66958, -6.381002, 0, 1.5, 0.5, 0.5,
0, -3.66958, -6.381002, 0, -0.5, 0.5, 0.5,
0, -3.66958, -6.381002, 1, -0.5, 0.5, 0.5,
0, -3.66958, -6.381002, 1, 1.5, 0.5, 0.5,
0, -3.66958, -6.381002, 0, 1.5, 0.5, 0.5,
2, -3.66958, -6.381002, 0, -0.5, 0.5, 0.5,
2, -3.66958, -6.381002, 1, -0.5, 0.5, 0.5,
2, -3.66958, -6.381002, 1, 1.5, 0.5, 0.5,
2, -3.66958, -6.381002, 0, 1.5, 0.5, 0.5
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
-3.915234, -3, -5.473993,
-3.915234, 3, -5.473993,
-3.915234, -3, -5.473993,
-4.096938, -3, -5.77633,
-3.915234, -2, -5.473993,
-4.096938, -2, -5.77633,
-3.915234, -1, -5.473993,
-4.096938, -1, -5.77633,
-3.915234, 0, -5.473993,
-4.096938, 0, -5.77633,
-3.915234, 1, -5.473993,
-4.096938, 1, -5.77633,
-3.915234, 2, -5.473993,
-4.096938, 2, -5.77633,
-3.915234, 3, -5.473993,
-4.096938, 3, -5.77633
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
-4.460347, -3, -6.381002, 0, -0.5, 0.5, 0.5,
-4.460347, -3, -6.381002, 1, -0.5, 0.5, 0.5,
-4.460347, -3, -6.381002, 1, 1.5, 0.5, 0.5,
-4.460347, -3, -6.381002, 0, 1.5, 0.5, 0.5,
-4.460347, -2, -6.381002, 0, -0.5, 0.5, 0.5,
-4.460347, -2, -6.381002, 1, -0.5, 0.5, 0.5,
-4.460347, -2, -6.381002, 1, 1.5, 0.5, 0.5,
-4.460347, -2, -6.381002, 0, 1.5, 0.5, 0.5,
-4.460347, -1, -6.381002, 0, -0.5, 0.5, 0.5,
-4.460347, -1, -6.381002, 1, -0.5, 0.5, 0.5,
-4.460347, -1, -6.381002, 1, 1.5, 0.5, 0.5,
-4.460347, -1, -6.381002, 0, 1.5, 0.5, 0.5,
-4.460347, 0, -6.381002, 0, -0.5, 0.5, 0.5,
-4.460347, 0, -6.381002, 1, -0.5, 0.5, 0.5,
-4.460347, 0, -6.381002, 1, 1.5, 0.5, 0.5,
-4.460347, 0, -6.381002, 0, 1.5, 0.5, 0.5,
-4.460347, 1, -6.381002, 0, -0.5, 0.5, 0.5,
-4.460347, 1, -6.381002, 1, -0.5, 0.5, 0.5,
-4.460347, 1, -6.381002, 1, 1.5, 0.5, 0.5,
-4.460347, 1, -6.381002, 0, 1.5, 0.5, 0.5,
-4.460347, 2, -6.381002, 0, -0.5, 0.5, 0.5,
-4.460347, 2, -6.381002, 1, -0.5, 0.5, 0.5,
-4.460347, 2, -6.381002, 1, 1.5, 0.5, 0.5,
-4.460347, 2, -6.381002, 0, 1.5, 0.5, 0.5,
-4.460347, 3, -6.381002, 0, -0.5, 0.5, 0.5,
-4.460347, 3, -6.381002, 1, -0.5, 0.5, 0.5,
-4.460347, 3, -6.381002, 1, 1.5, 0.5, 0.5,
-4.460347, 3, -6.381002, 0, 1.5, 0.5, 0.5
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
-3.915234, -3.172903, -4,
-3.915234, -3.172903, 6,
-3.915234, -3.172903, -4,
-4.096938, -3.338462, -4,
-3.915234, -3.172903, -2,
-4.096938, -3.338462, -2,
-3.915234, -3.172903, 0,
-4.096938, -3.338462, 0,
-3.915234, -3.172903, 2,
-4.096938, -3.338462, 2,
-3.915234, -3.172903, 4,
-4.096938, -3.338462, 4,
-3.915234, -3.172903, 6,
-4.096938, -3.338462, 6
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
"4",
"6"
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
-4.460347, -3.66958, -4, 0, -0.5, 0.5, 0.5,
-4.460347, -3.66958, -4, 1, -0.5, 0.5, 0.5,
-4.460347, -3.66958, -4, 1, 1.5, 0.5, 0.5,
-4.460347, -3.66958, -4, 0, 1.5, 0.5, 0.5,
-4.460347, -3.66958, -2, 0, -0.5, 0.5, 0.5,
-4.460347, -3.66958, -2, 1, -0.5, 0.5, 0.5,
-4.460347, -3.66958, -2, 1, 1.5, 0.5, 0.5,
-4.460347, -3.66958, -2, 0, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 0, 0, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 0, 1, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 0, 1, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 0, 0, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 2, 0, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 2, 1, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 2, 1, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 2, 0, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 4, 0, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 4, 1, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 4, 1, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 4, 0, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 6, 0, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 6, 1, -0.5, 0.5, 0.5,
-4.460347, -3.66958, 6, 1, 1.5, 0.5, 0.5,
-4.460347, -3.66958, 6, 0, 1.5, 0.5, 0.5
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
-3.915234, -3.172903, -5.473993,
-3.915234, 3.449461, -5.473993,
-3.915234, -3.172903, 6.619465,
-3.915234, 3.449461, 6.619465,
-3.915234, -3.172903, -5.473993,
-3.915234, -3.172903, 6.619465,
-3.915234, 3.449461, -5.473993,
-3.915234, 3.449461, 6.619465,
-3.915234, -3.172903, -5.473993,
3.352942, -3.172903, -5.473993,
-3.915234, -3.172903, 6.619465,
3.352942, -3.172903, 6.619465,
-3.915234, 3.449461, -5.473993,
3.352942, 3.449461, -5.473993,
-3.915234, 3.449461, 6.619465,
3.352942, 3.449461, 6.619465,
3.352942, -3.172903, -5.473993,
3.352942, 3.449461, -5.473993,
3.352942, -3.172903, 6.619465,
3.352942, 3.449461, 6.619465,
3.352942, -3.172903, -5.473993,
3.352942, -3.172903, 6.619465,
3.352942, 3.449461, -5.473993,
3.352942, 3.449461, 6.619465
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
var radius = 8.3228;
var distance = 37.02908;
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
mvMatrix.translate( 0.2811458, -0.1382791, -0.572736 );
mvMatrix.scale( 1.238106, 1.358846, 0.7441027 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.02908);
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
Disulfoton<-read.table("Disulfoton.xyz")
```

```
## Error in read.table("Disulfoton.xyz"): no lines available in input
```

```r
x<-Disulfoton$V2
```

```
## Error in eval(expr, envir, enclos): object 'Disulfoton' not found
```

```r
y<-Disulfoton$V3
```

```
## Error in eval(expr, envir, enclos): object 'Disulfoton' not found
```

```r
z<-Disulfoton$V4
```

```
## Error in eval(expr, envir, enclos): object 'Disulfoton' not found
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
-3.809387, 0.6001642, -2.24223, 0, 0, 1, 1, 1,
-3.406649, -0.3797289, -1.395021, 1, 0, 0, 1, 1,
-3.0233, -0.3501388, -3.08136, 1, 0, 0, 1, 1,
-2.940747, 1.352843, -0.8262007, 1, 0, 0, 1, 1,
-2.852034, -1.168278, -0.7765372, 1, 0, 0, 1, 1,
-2.843329, -1.054889, -1.915936, 1, 0, 0, 1, 1,
-2.805237, -1.080985, -2.270653, 0, 0, 0, 1, 1,
-2.53806, -0.8898432, -2.346574, 0, 0, 0, 1, 1,
-2.470307, 0.04124144, -0.515376, 0, 0, 0, 1, 1,
-2.466637, -0.6964164, -1.812542, 0, 0, 0, 1, 1,
-2.449561, 1.241774, -2.001079, 0, 0, 0, 1, 1,
-2.421082, 0.378148, -2.041689, 0, 0, 0, 1, 1,
-2.412431, -0.3443519, -1.247771, 0, 0, 0, 1, 1,
-2.322038, 0.8460085, -1.356254, 1, 1, 1, 1, 1,
-2.250835, -1.099278, -0.8005716, 1, 1, 1, 1, 1,
-2.241316, -0.06428272, -1.40934, 1, 1, 1, 1, 1,
-2.232399, 0.8188255, -0.7222215, 1, 1, 1, 1, 1,
-2.202334, -0.2849255, -1.316346, 1, 1, 1, 1, 1,
-2.197242, -0.3758452, -4.342517, 1, 1, 1, 1, 1,
-2.147865, 0.902195, 0.1731587, 1, 1, 1, 1, 1,
-2.059927, -1.216901, -4.462306, 1, 1, 1, 1, 1,
-2.057747, 0.8678697, -2.504069, 1, 1, 1, 1, 1,
-2.01613, 0.02633574, -0.1847066, 1, 1, 1, 1, 1,
-1.974478, -0.6844366, -0.4341335, 1, 1, 1, 1, 1,
-1.968315, -0.5382714, -2.247794, 1, 1, 1, 1, 1,
-1.9624, 0.9165772, -2.82851, 1, 1, 1, 1, 1,
-1.92467, -0.5922459, -1.937145, 1, 1, 1, 1, 1,
-1.906066, -0.7876903, -1.314609, 1, 1, 1, 1, 1,
-1.905811, 0.1680727, -2.115128, 0, 0, 1, 1, 1,
-1.895037, 0.02673926, -2.097655, 1, 0, 0, 1, 1,
-1.886904, -0.9142277, -3.355938, 1, 0, 0, 1, 1,
-1.825551, 0.3891402, -1.090092, 1, 0, 0, 1, 1,
-1.797555, 0.2370141, -2.36508, 1, 0, 0, 1, 1,
-1.788235, 0.8603358, -0.2368152, 1, 0, 0, 1, 1,
-1.786921, 1.118908, -0.8131347, 0, 0, 0, 1, 1,
-1.783822, -1.14825, -1.761436, 0, 0, 0, 1, 1,
-1.758318, -2.407667, -2.249524, 0, 0, 0, 1, 1,
-1.745762, -1.050824, -1.8605, 0, 0, 0, 1, 1,
-1.74526, -0.3466533, -2.912766, 0, 0, 0, 1, 1,
-1.742624, -0.6421534, -3.331675, 0, 0, 0, 1, 1,
-1.733448, -0.6013953, -0.1127464, 0, 0, 0, 1, 1,
-1.731881, -0.3508104, -3.68534, 1, 1, 1, 1, 1,
-1.719823, 1.696405, -0.9164571, 1, 1, 1, 1, 1,
-1.713691, -0.5833176, -1.551552, 1, 1, 1, 1, 1,
-1.703238, 0.4074258, -1.977684, 1, 1, 1, 1, 1,
-1.701705, -1.215487, -2.624871, 1, 1, 1, 1, 1,
-1.698151, -0.2158773, -1.747297, 1, 1, 1, 1, 1,
-1.686462, -1.831009, -2.838009, 1, 1, 1, 1, 1,
-1.685035, -0.8271327, -3.748869, 1, 1, 1, 1, 1,
-1.678141, 0.8664562, -0.6698465, 1, 1, 1, 1, 1,
-1.677799, -0.3909644, -0.7574442, 1, 1, 1, 1, 1,
-1.663711, -2.908751, -2.895639, 1, 1, 1, 1, 1,
-1.633402, 1.665634, 0.09745757, 1, 1, 1, 1, 1,
-1.613659, -0.2709451, -1.43758, 1, 1, 1, 1, 1,
-1.60325, 0.4906253, -1.021997, 1, 1, 1, 1, 1,
-1.594625, 1.055746, -2.501923, 1, 1, 1, 1, 1,
-1.58988, -0.7790483, -1.973876, 0, 0, 1, 1, 1,
-1.587442, 0.7231654, 0.8374656, 1, 0, 0, 1, 1,
-1.586854, 0.1006651, -2.633318, 1, 0, 0, 1, 1,
-1.586319, 1.282167, -0.6293048, 1, 0, 0, 1, 1,
-1.574269, -1.474488, -2.377028, 1, 0, 0, 1, 1,
-1.571638, 1.548677, -1.958292, 1, 0, 0, 1, 1,
-1.567536, -1.365093, -0.4908674, 0, 0, 0, 1, 1,
-1.566528, -1.551237, -2.642018, 0, 0, 0, 1, 1,
-1.54852, 1.081219, -0.7063814, 0, 0, 0, 1, 1,
-1.537366, -0.3837745, -1.396703, 0, 0, 0, 1, 1,
-1.533245, 0.6391369, -0.4300559, 0, 0, 0, 1, 1,
-1.527065, -0.5208852, -2.341205, 0, 0, 0, 1, 1,
-1.52381, -1.131037, -0.7447018, 0, 0, 0, 1, 1,
-1.519801, -1.436535, -1.856349, 1, 1, 1, 1, 1,
-1.505113, 1.583511, 0.8841179, 1, 1, 1, 1, 1,
-1.504926, -1.039458, -2.233382, 1, 1, 1, 1, 1,
-1.495494, 0.2224775, -1.374628, 1, 1, 1, 1, 1,
-1.493265, -0.6354668, -1.702161, 1, 1, 1, 1, 1,
-1.490781, -0.07124662, -1.352635, 1, 1, 1, 1, 1,
-1.485079, 1.182244, -0.8132049, 1, 1, 1, 1, 1,
-1.483832, 0.1047848, -0.394179, 1, 1, 1, 1, 1,
-1.443268, 0.6955252, -1.577078, 1, 1, 1, 1, 1,
-1.435693, 0.1949206, -0.2665826, 1, 1, 1, 1, 1,
-1.433453, 0.4412189, -0.786033, 1, 1, 1, 1, 1,
-1.425229, -0.639701, -1.906192, 1, 1, 1, 1, 1,
-1.411296, -1.162405, -0.2494686, 1, 1, 1, 1, 1,
-1.405733, -2.47372, -2.966302, 1, 1, 1, 1, 1,
-1.402445, 0.758451, 0.5243275, 1, 1, 1, 1, 1,
-1.393252, 0.5347841, -1.563198, 0, 0, 1, 1, 1,
-1.39194, -0.3819015, -1.494598, 1, 0, 0, 1, 1,
-1.388481, -0.1024889, -1.498482, 1, 0, 0, 1, 1,
-1.383375, 0.3182738, -2.777791, 1, 0, 0, 1, 1,
-1.373692, -0.3655333, -2.780548, 1, 0, 0, 1, 1,
-1.365237, -0.4174906, -2.905162, 1, 0, 0, 1, 1,
-1.354859, -0.5674046, -3.795133, 0, 0, 0, 1, 1,
-1.349681, -0.09062339, -1.624081, 0, 0, 0, 1, 1,
-1.330991, 0.7201871, -1.353104, 0, 0, 0, 1, 1,
-1.32978, -0.8298541, -1.431598, 0, 0, 0, 1, 1,
-1.326563, 1.534661, 0.5647168, 0, 0, 0, 1, 1,
-1.326523, -0.2314428, -0.7560031, 0, 0, 0, 1, 1,
-1.325646, 0.1650281, -0.5062302, 0, 0, 0, 1, 1,
-1.320254, -1.104454, -2.073725, 1, 1, 1, 1, 1,
-1.314294, -0.9752683, -1.841471, 1, 1, 1, 1, 1,
-1.313765, 1.255152, -0.2932964, 1, 1, 1, 1, 1,
-1.310389, 1.779182, 0.1707368, 1, 1, 1, 1, 1,
-1.308988, -0.5039696, -3.27848, 1, 1, 1, 1, 1,
-1.308702, -1.723134, -2.474301, 1, 1, 1, 1, 1,
-1.306605, -0.8606592, -0.9154596, 1, 1, 1, 1, 1,
-1.303946, -0.1511454, -2.244496, 1, 1, 1, 1, 1,
-1.289037, 0.506135, -0.3592865, 1, 1, 1, 1, 1,
-1.288551, 0.1583997, -1.886998, 1, 1, 1, 1, 1,
-1.286023, 0.3962972, -1.284408, 1, 1, 1, 1, 1,
-1.283493, -0.09284507, -1.561138, 1, 1, 1, 1, 1,
-1.258135, -0.4637144, -3.146901, 1, 1, 1, 1, 1,
-1.257413, -0.570618, -1.375424, 1, 1, 1, 1, 1,
-1.256101, 0.7727108, -2.850357, 1, 1, 1, 1, 1,
-1.254342, 0.4975868, -0.5493469, 0, 0, 1, 1, 1,
-1.253986, -0.3720707, -2.416212, 1, 0, 0, 1, 1,
-1.248185, 0.3857814, -0.3796661, 1, 0, 0, 1, 1,
-1.230941, -0.5702661, -1.848253, 1, 0, 0, 1, 1,
-1.225998, -0.6981326, -2.353588, 1, 0, 0, 1, 1,
-1.2144, 0.1823529, -0.4344999, 1, 0, 0, 1, 1,
-1.208794, 0.9333817, -1.979456, 0, 0, 0, 1, 1,
-1.207261, 1.307329, -0.9331647, 0, 0, 0, 1, 1,
-1.186056, 0.3502139, -2.352499, 0, 0, 0, 1, 1,
-1.182305, -0.8043492, -0.1529296, 0, 0, 0, 1, 1,
-1.173585, -1.926684, -1.880517, 0, 0, 0, 1, 1,
-1.17259, 0.3872904, -1.59101, 0, 0, 0, 1, 1,
-1.166503, -1.058252, -0.6025838, 0, 0, 0, 1, 1,
-1.160993, 0.1414741, -0.8985701, 1, 1, 1, 1, 1,
-1.154419, -0.1222241, -1.258277, 1, 1, 1, 1, 1,
-1.153361, 0.9440004, 0.6314666, 1, 1, 1, 1, 1,
-1.141809, -0.2190907, -1.777042, 1, 1, 1, 1, 1,
-1.134482, -1.551022, -1.336801, 1, 1, 1, 1, 1,
-1.133799, -0.2754551, -1.566689, 1, 1, 1, 1, 1,
-1.130835, 0.8836378, -1.166651, 1, 1, 1, 1, 1,
-1.123472, -0.2001136, -1.363916, 1, 1, 1, 1, 1,
-1.121369, -1.144409, -1.901337, 1, 1, 1, 1, 1,
-1.119548, -1.505095, -1.955416, 1, 1, 1, 1, 1,
-1.114789, -0.4241606, -1.395054, 1, 1, 1, 1, 1,
-1.11141, -0.06461073, -2.428557, 1, 1, 1, 1, 1,
-1.110975, 1.231209, -2.511623, 1, 1, 1, 1, 1,
-1.102946, 1.149003, -0.1707751, 1, 1, 1, 1, 1,
-1.100242, 1.524826, -0.5231728, 1, 1, 1, 1, 1,
-1.099933, 1.828888, 1.233075, 0, 0, 1, 1, 1,
-1.089597, -0.1289511, -2.318059, 1, 0, 0, 1, 1,
-1.088379, -1.324314, -3.672146, 1, 0, 0, 1, 1,
-1.085422, -1.141864, -2.449848, 1, 0, 0, 1, 1,
-1.082157, -0.7656554, -1.778939, 1, 0, 0, 1, 1,
-1.077461, -0.9060099, -1.246284, 1, 0, 0, 1, 1,
-1.075505, 0.5410002, -2.102367, 0, 0, 0, 1, 1,
-1.074195, 1.498651, -1.576588, 0, 0, 0, 1, 1,
-1.071639, -2.110135, -3.529148, 0, 0, 0, 1, 1,
-1.071613, -0.08824743, -1.26375, 0, 0, 0, 1, 1,
-1.069012, 0.9489695, -1.348778, 0, 0, 0, 1, 1,
-1.066584, -0.7330462, -1.681114, 0, 0, 0, 1, 1,
-1.061487, -2.686012, -3.693335, 0, 0, 0, 1, 1,
-1.052448, 0.1812324, -2.548036, 1, 1, 1, 1, 1,
-1.046664, 0.2695732, -0.1847729, 1, 1, 1, 1, 1,
-1.040202, 2.414181, -0.1223645, 1, 1, 1, 1, 1,
-1.036769, -0.2141415, -1.99985, 1, 1, 1, 1, 1,
-1.034265, -1.766809, -2.496542, 1, 1, 1, 1, 1,
-1.029755, 0.217364, -0.8595515, 1, 1, 1, 1, 1,
-1.029633, 1.221648, -1.033774, 1, 1, 1, 1, 1,
-1.028157, 0.489612, -1.067537, 1, 1, 1, 1, 1,
-1.027731, -0.6542348, -1.837841, 1, 1, 1, 1, 1,
-1.025336, -0.370299, -2.931062, 1, 1, 1, 1, 1,
-1.024196, -0.6617177, -1.656176, 1, 1, 1, 1, 1,
-1.01896, -1.057205, -2.650671, 1, 1, 1, 1, 1,
-1.012035, -1.318295, -2.621315, 1, 1, 1, 1, 1,
-1.003096, -0.4997995, -0.5916502, 1, 1, 1, 1, 1,
-0.993049, 0.3340709, -0.6773779, 1, 1, 1, 1, 1,
-0.9831038, 0.1973585, -0.9699755, 0, 0, 1, 1, 1,
-0.9813975, 0.2104779, -1.430406, 1, 0, 0, 1, 1,
-0.9664972, -0.01240829, -1.335185, 1, 0, 0, 1, 1,
-0.963325, -1.135651, -0.9178525, 1, 0, 0, 1, 1,
-0.960119, 0.5581397, -0.9088347, 1, 0, 0, 1, 1,
-0.9563949, -0.6543726, -0.8262388, 1, 0, 0, 1, 1,
-0.9435285, 0.9381127, -1.423773, 0, 0, 0, 1, 1,
-0.9419422, -1.053653, -2.297473, 0, 0, 0, 1, 1,
-0.93994, -0.9431055, -1.154618, 0, 0, 0, 1, 1,
-0.9398124, 1.220013, -1.669704, 0, 0, 0, 1, 1,
-0.9398035, 0.134247, -0.1708045, 0, 0, 0, 1, 1,
-0.9382962, -2.132194, -2.394741, 0, 0, 0, 1, 1,
-0.936357, 0.536156, -0.02184037, 0, 0, 0, 1, 1,
-0.9331629, -0.6048264, -1.914863, 1, 1, 1, 1, 1,
-0.9140404, -0.6337877, -1.608827, 1, 1, 1, 1, 1,
-0.9117436, -0.03739353, -2.009778, 1, 1, 1, 1, 1,
-0.898216, 1.5849, 2.176381, 1, 1, 1, 1, 1,
-0.8909163, -0.9688026, -3.111941, 1, 1, 1, 1, 1,
-0.8906871, 0.648647, -1.128901, 1, 1, 1, 1, 1,
-0.888055, 0.7049318, -2.202258, 1, 1, 1, 1, 1,
-0.8871318, 0.9772995, -1.401608, 1, 1, 1, 1, 1,
-0.8858239, -1.474531, -1.263233, 1, 1, 1, 1, 1,
-0.8836232, -0.9734728, -1.34291, 1, 1, 1, 1, 1,
-0.8817258, 0.3700613, -2.728356, 1, 1, 1, 1, 1,
-0.8789931, 2.548619, -1.825149, 1, 1, 1, 1, 1,
-0.8751046, 0.6071911, -1.12849, 1, 1, 1, 1, 1,
-0.8712178, -0.4918623, -2.525759, 1, 1, 1, 1, 1,
-0.8642222, -0.5217584, -2.372672, 1, 1, 1, 1, 1,
-0.8628961, 0.153558, -1.85962, 0, 0, 1, 1, 1,
-0.8623582, -0.2782903, -1.470561, 1, 0, 0, 1, 1,
-0.8535631, -1.013791, -2.446623, 1, 0, 0, 1, 1,
-0.8513125, 0.4436126, -0.9250866, 1, 0, 0, 1, 1,
-0.8440884, -1.466866, -1.076475, 1, 0, 0, 1, 1,
-0.8439472, 0.2091494, -1.583756, 1, 0, 0, 1, 1,
-0.8371588, -0.5898599, -2.537131, 0, 0, 0, 1, 1,
-0.8346903, 0.260785, -1.187038, 0, 0, 0, 1, 1,
-0.8344302, 0.08672091, -0.06692905, 0, 0, 0, 1, 1,
-0.8296276, 1.62505, -0.7785162, 0, 0, 0, 1, 1,
-0.8274024, 1.084922, 0.4228291, 0, 0, 0, 1, 1,
-0.81661, 0.3436477, -2.084343, 0, 0, 0, 1, 1,
-0.81582, 0.04390247, -1.757409, 0, 0, 0, 1, 1,
-0.8139503, 0.8102764, -2.056441, 1, 1, 1, 1, 1,
-0.8134953, 1.42719, -0.2057254, 1, 1, 1, 1, 1,
-0.8129132, 0.6663445, -1.861745, 1, 1, 1, 1, 1,
-0.8103727, -1.671832, -1.825809, 1, 1, 1, 1, 1,
-0.8049772, 0.171996, -1.765746, 1, 1, 1, 1, 1,
-0.7985476, -1.620414, -0.8027903, 1, 1, 1, 1, 1,
-0.7980019, -1.748403, -3.342982, 1, 1, 1, 1, 1,
-0.7968419, 0.4291603, 0.1118468, 1, 1, 1, 1, 1,
-0.7909675, 1.068271, 0.3172865, 1, 1, 1, 1, 1,
-0.7845313, -0.2303477, -1.870996, 1, 1, 1, 1, 1,
-0.7794607, 0.3100893, -1.721321, 1, 1, 1, 1, 1,
-0.7701061, 0.378366, 0.2159545, 1, 1, 1, 1, 1,
-0.764524, 0.6426407, -0.9858544, 1, 1, 1, 1, 1,
-0.7615168, -0.1180333, -0.7400761, 1, 1, 1, 1, 1,
-0.7565925, -0.1056319, -0.4012249, 1, 1, 1, 1, 1,
-0.7541511, -0.04923442, -1.666012, 0, 0, 1, 1, 1,
-0.7514127, 0.02209875, -1.67251, 1, 0, 0, 1, 1,
-0.7513278, 0.6338148, -1.239287, 1, 0, 0, 1, 1,
-0.7491071, -1.122838, -3.82418, 1, 0, 0, 1, 1,
-0.7465137, 2.246417, -1.910657, 1, 0, 0, 1, 1,
-0.745636, 0.005091747, -4.131895, 1, 0, 0, 1, 1,
-0.7454733, 0.2575276, -1.572736, 0, 0, 0, 1, 1,
-0.7432863, -0.5258923, -2.051058, 0, 0, 0, 1, 1,
-0.7347834, 0.6500538, 0.1981333, 0, 0, 0, 1, 1,
-0.7336912, 0.4196965, -1.821598, 0, 0, 0, 1, 1,
-0.7293327, 0.8090171, -0.6236122, 0, 0, 0, 1, 1,
-0.7287611, 1.376225, -0.6067497, 0, 0, 0, 1, 1,
-0.7229198, 1.052781, -0.4089252, 0, 0, 0, 1, 1,
-0.7218334, -0.9036886, -1.253603, 1, 1, 1, 1, 1,
-0.7156526, -3.07646, -3.261267, 1, 1, 1, 1, 1,
-0.714783, 0.2176649, -0.1897552, 1, 1, 1, 1, 1,
-0.7101502, -0.2007883, -5.297875, 1, 1, 1, 1, 1,
-0.710048, 0.2271058, -0.5409496, 1, 1, 1, 1, 1,
-0.7095684, 0.6895972, -0.9088795, 1, 1, 1, 1, 1,
-0.7065602, -0.8616495, -2.641936, 1, 1, 1, 1, 1,
-0.7051091, 0.4647194, 1.917925, 1, 1, 1, 1, 1,
-0.7042018, 1.223621, -0.1906237, 1, 1, 1, 1, 1,
-0.7017087, 0.04217806, -0.2771173, 1, 1, 1, 1, 1,
-0.6988477, -0.5253951, -2.391979, 1, 1, 1, 1, 1,
-0.6935036, 1.277306, -0.6952901, 1, 1, 1, 1, 1,
-0.6933301, 0.07126636, -2.633657, 1, 1, 1, 1, 1,
-0.6901933, 0.8488621, 0.2939059, 1, 1, 1, 1, 1,
-0.6897875, 0.5245953, 0.1774785, 1, 1, 1, 1, 1,
-0.6863599, -0.1797777, -3.090359, 0, 0, 1, 1, 1,
-0.6836267, -0.1521245, -0.07103875, 1, 0, 0, 1, 1,
-0.6795473, 0.4097397, -0.7658049, 1, 0, 0, 1, 1,
-0.670124, -1.584013, -3.287207, 1, 0, 0, 1, 1,
-0.6674829, -0.6186656, -2.78575, 1, 0, 0, 1, 1,
-0.6643667, 0.05916055, -4.400811, 1, 0, 0, 1, 1,
-0.6623772, -1.163293, -1.345056, 0, 0, 0, 1, 1,
-0.6555493, -0.2097987, -2.178075, 0, 0, 0, 1, 1,
-0.6540991, 0.08580517, -0.275516, 0, 0, 0, 1, 1,
-0.6538789, -1.361246, -2.925846, 0, 0, 0, 1, 1,
-0.6483774, -0.0674747, -0.6032529, 0, 0, 0, 1, 1,
-0.6425654, 0.6638241, 0.1504203, 0, 0, 0, 1, 1,
-0.6408362, -0.30548, -2.359032, 0, 0, 0, 1, 1,
-0.6374555, 1.558619, -1.275617, 1, 1, 1, 1, 1,
-0.6362225, 1.503821, -1.938554, 1, 1, 1, 1, 1,
-0.6348279, 0.1192321, -0.1159551, 1, 1, 1, 1, 1,
-0.6328509, 0.275537, -0.7495137, 1, 1, 1, 1, 1,
-0.6292807, 0.7026242, -1.207496, 1, 1, 1, 1, 1,
-0.6260009, 1.059858, -1.146433, 1, 1, 1, 1, 1,
-0.6251231, 0.3534346, -2.040669, 1, 1, 1, 1, 1,
-0.6210278, -0.7955223, -4.061192, 1, 1, 1, 1, 1,
-0.6203167, -0.4712452, -3.36412, 1, 1, 1, 1, 1,
-0.6177284, 0.7658094, -0.811888, 1, 1, 1, 1, 1,
-0.6161999, -1.390671, -2.637314, 1, 1, 1, 1, 1,
-0.612555, 2.390363, -1.145107, 1, 1, 1, 1, 1,
-0.6108245, 0.4140284, -0.5028322, 1, 1, 1, 1, 1,
-0.6105565, -0.8906231, -0.5916309, 1, 1, 1, 1, 1,
-0.6095234, -1.554097, -3.137084, 1, 1, 1, 1, 1,
-0.6069424, 0.7146958, 0.7314919, 0, 0, 1, 1, 1,
-0.6051465, 1.459183, -0.4720592, 1, 0, 0, 1, 1,
-0.5867453, 0.06739752, -1.694001, 1, 0, 0, 1, 1,
-0.5857011, 0.9277682, 1.028302, 1, 0, 0, 1, 1,
-0.5848033, 0.5906221, -0.8878183, 1, 0, 0, 1, 1,
-0.5801044, 0.4899277, -1.485428, 1, 0, 0, 1, 1,
-0.5794826, -0.2105316, -0.7370089, 0, 0, 0, 1, 1,
-0.5793176, -1.26144, -3.9756, 0, 0, 0, 1, 1,
-0.5691171, 0.7456979, 0.2769052, 0, 0, 0, 1, 1,
-0.5669029, 0.008695195, -1.259797, 0, 0, 0, 1, 1,
-0.5658762, -1.99226, -3.038474, 0, 0, 0, 1, 1,
-0.5642133, 0.8125614, 0.00241121, 0, 0, 0, 1, 1,
-0.5619766, 0.3753831, -0.1206835, 0, 0, 0, 1, 1,
-0.561828, 0.4360813, -2.006632, 1, 1, 1, 1, 1,
-0.5592731, 0.5751021, -1.370453, 1, 1, 1, 1, 1,
-0.5567913, 0.6104528, 0.9866759, 1, 1, 1, 1, 1,
-0.5547722, 0.7476716, -0.9863551, 1, 1, 1, 1, 1,
-0.5539843, 0.8400881, 0.2819747, 1, 1, 1, 1, 1,
-0.5448698, -0.4601075, -2.378616, 1, 1, 1, 1, 1,
-0.543533, 0.5140038, -0.4369834, 1, 1, 1, 1, 1,
-0.5426957, -0.2557936, -2.631532, 1, 1, 1, 1, 1,
-0.5423871, 0.8075983, -0.4726979, 1, 1, 1, 1, 1,
-0.5394577, -0.4992189, -1.189829, 1, 1, 1, 1, 1,
-0.5381746, -0.438414, -3.400487, 1, 1, 1, 1, 1,
-0.5309728, -0.4079832, -3.42356, 1, 1, 1, 1, 1,
-0.530569, 0.1018897, -2.144862, 1, 1, 1, 1, 1,
-0.5271837, 0.07625948, -1.628109, 1, 1, 1, 1, 1,
-0.5227175, -1.304693, -4.333632, 1, 1, 1, 1, 1,
-0.5175466, -0.2080034, -1.65867, 0, 0, 1, 1, 1,
-0.5165697, -1.537186, -3.586109, 1, 0, 0, 1, 1,
-0.5133781, 1.386124, -0.3374231, 1, 0, 0, 1, 1,
-0.5121604, 1.003963, 0.712072, 1, 0, 0, 1, 1,
-0.5070789, -0.1327756, -2.155718, 1, 0, 0, 1, 1,
-0.5010784, 0.2300223, -1.92663, 1, 0, 0, 1, 1,
-0.4993772, 0.1780198, -1.668668, 0, 0, 0, 1, 1,
-0.4906721, -0.4543448, -1.345986, 0, 0, 0, 1, 1,
-0.4896612, 0.08757952, -1.710259, 0, 0, 0, 1, 1,
-0.4846345, -0.7978421, -2.423439, 0, 0, 0, 1, 1,
-0.4823124, 1.527302, -0.5164371, 0, 0, 0, 1, 1,
-0.4816107, 0.5505767, -0.8808795, 0, 0, 0, 1, 1,
-0.4787785, -1.207021, -0.600526, 0, 0, 0, 1, 1,
-0.4781204, 2.212593, 0.4782049, 1, 1, 1, 1, 1,
-0.4774988, -1.854882, -2.268732, 1, 1, 1, 1, 1,
-0.4770861, -0.08943674, -2.083091, 1, 1, 1, 1, 1,
-0.4743644, -0.2836955, -1.996222, 1, 1, 1, 1, 1,
-0.4730469, 0.2376011, 0.8300749, 1, 1, 1, 1, 1,
-0.4692471, -0.7228989, -2.056377, 1, 1, 1, 1, 1,
-0.4638504, 0.2492654, -3.154878, 1, 1, 1, 1, 1,
-0.4628502, -0.06807679, 0.03151281, 1, 1, 1, 1, 1,
-0.4592897, 0.6885588, -1.815367, 1, 1, 1, 1, 1,
-0.4567869, -0.08681311, -0.2022837, 1, 1, 1, 1, 1,
-0.4514166, -0.8489734, -3.775974, 1, 1, 1, 1, 1,
-0.4499583, 0.8194166, -0.8492285, 1, 1, 1, 1, 1,
-0.4482236, 1.824872, 2.385127, 1, 1, 1, 1, 1,
-0.4472275, 0.9549375, -1.629832, 1, 1, 1, 1, 1,
-0.4454211, 0.4191464, -1.991047, 1, 1, 1, 1, 1,
-0.4428318, 0.661477, -1.930192, 0, 0, 1, 1, 1,
-0.439083, 0.1838151, 0.4433332, 1, 0, 0, 1, 1,
-0.4363202, 0.7237217, -2.281337, 1, 0, 0, 1, 1,
-0.4250669, -0.3940583, -1.641988, 1, 0, 0, 1, 1,
-0.4197932, 1.075491, -1.94464, 1, 0, 0, 1, 1,
-0.4187364, -0.4149214, -1.809101, 1, 0, 0, 1, 1,
-0.4096145, -0.9968324, -2.964131, 0, 0, 0, 1, 1,
-0.4059852, -0.9207903, -1.051625, 0, 0, 0, 1, 1,
-0.4020674, -1.411154, -4.135244, 0, 0, 0, 1, 1,
-0.396578, 0.1500281, 0.1392311, 0, 0, 0, 1, 1,
-0.3937764, 0.6902869, -0.1725542, 0, 0, 0, 1, 1,
-0.393325, 0.444187, -1.304992, 0, 0, 0, 1, 1,
-0.3919728, -0.6137379, -2.054499, 0, 0, 0, 1, 1,
-0.3882788, -1.146711, -3.147621, 1, 1, 1, 1, 1,
-0.3877902, 0.3707658, 1.36283, 1, 1, 1, 1, 1,
-0.3818039, -0.9159214, -3.390381, 1, 1, 1, 1, 1,
-0.3805477, 0.3106803, -1.585825, 1, 1, 1, 1, 1,
-0.378969, 1.367592, -0.9644943, 1, 1, 1, 1, 1,
-0.3770934, 0.8560882, -2.174497, 1, 1, 1, 1, 1,
-0.374467, -1.633916, -2.111162, 1, 1, 1, 1, 1,
-0.3725018, 0.7976255, -0.7882646, 1, 1, 1, 1, 1,
-0.3712097, 0.6218954, -1.1252, 1, 1, 1, 1, 1,
-0.3698731, -0.8859798, -2.272243, 1, 1, 1, 1, 1,
-0.367182, 1.694431, 1.751957, 1, 1, 1, 1, 1,
-0.3638721, 0.1637619, -2.675999, 1, 1, 1, 1, 1,
-0.361924, -1.848646, -2.621784, 1, 1, 1, 1, 1,
-0.3514927, -1.254009, -3.260289, 1, 1, 1, 1, 1,
-0.3499913, -1.285485, -3.03267, 1, 1, 1, 1, 1,
-0.3488429, 0.01506046, 0.4104196, 0, 0, 1, 1, 1,
-0.3475734, -0.5499936, -1.595918, 1, 0, 0, 1, 1,
-0.347135, 0.1075244, -1.837323, 1, 0, 0, 1, 1,
-0.346931, -0.4679897, -2.797066, 1, 0, 0, 1, 1,
-0.3453947, 0.8429388, -2.003792, 1, 0, 0, 1, 1,
-0.3402365, 0.5512847, -0.05398334, 1, 0, 0, 1, 1,
-0.3399815, -0.4463977, -3.024565, 0, 0, 0, 1, 1,
-0.3386405, 1.258681, 2.036987, 0, 0, 0, 1, 1,
-0.3351232, 0.5428333, -0.6461559, 0, 0, 0, 1, 1,
-0.329913, -0.1048691, -2.691625, 0, 0, 0, 1, 1,
-0.3286554, 0.2088981, 0.1667205, 0, 0, 0, 1, 1,
-0.327916, 0.5044424, -1.288458, 0, 0, 0, 1, 1,
-0.3237528, 2.138157, -0.958031, 0, 0, 0, 1, 1,
-0.3183166, 0.2806048, -1.762712, 1, 1, 1, 1, 1,
-0.3179787, 1.514737, 1.582263, 1, 1, 1, 1, 1,
-0.311823, 0.1133862, -1.060464, 1, 1, 1, 1, 1,
-0.3113646, 1.4714, -1.57735, 1, 1, 1, 1, 1,
-0.3101451, 0.3948407, 0.4429447, 1, 1, 1, 1, 1,
-0.3068514, 0.1134405, 0.9873719, 1, 1, 1, 1, 1,
-0.3048682, -0.910456, -3.230194, 1, 1, 1, 1, 1,
-0.3018785, 1.064258, -0.09642082, 1, 1, 1, 1, 1,
-0.3003219, -0.02789951, -2.734041, 1, 1, 1, 1, 1,
-0.2986582, 0.7841808, 0.1711932, 1, 1, 1, 1, 1,
-0.29248, 0.9225384, 0.3404277, 1, 1, 1, 1, 1,
-0.2887182, 0.7458476, -0.9212612, 1, 1, 1, 1, 1,
-0.287627, 0.5548242, -0.05051118, 1, 1, 1, 1, 1,
-0.2848432, -1.257584, -3.223251, 1, 1, 1, 1, 1,
-0.2844721, -0.2238903, -0.4215226, 1, 1, 1, 1, 1,
-0.2812075, -1.490749, -3.743947, 0, 0, 1, 1, 1,
-0.2791044, 0.5761837, -0.2655811, 1, 0, 0, 1, 1,
-0.2777523, -1.617512, -3.297337, 1, 0, 0, 1, 1,
-0.2767344, 0.1792374, -0.9795334, 1, 0, 0, 1, 1,
-0.2763673, -0.7082164, -1.07844, 1, 0, 0, 1, 1,
-0.273827, 1.226279, -1.269759, 1, 0, 0, 1, 1,
-0.2524008, -2.680277, -4.341219, 0, 0, 0, 1, 1,
-0.2500763, 0.0348072, -2.673234, 0, 0, 0, 1, 1,
-0.2491982, 1.179999, -2.03964, 0, 0, 0, 1, 1,
-0.2473296, 1.059433, 0.4121709, 0, 0, 0, 1, 1,
-0.2435105, 0.6310055, 0.1960015, 0, 0, 0, 1, 1,
-0.2417887, -0.7010571, -2.693027, 0, 0, 0, 1, 1,
-0.2384642, -0.3899553, -2.699839, 0, 0, 0, 1, 1,
-0.2346237, 0.4594576, -2.008778, 1, 1, 1, 1, 1,
-0.2335778, 0.3413944, 0.9812047, 1, 1, 1, 1, 1,
-0.2303621, -0.4282404, -1.89423, 1, 1, 1, 1, 1,
-0.2255957, 0.1977041, -1.817181, 1, 1, 1, 1, 1,
-0.223999, -0.4287311, -2.720969, 1, 1, 1, 1, 1,
-0.2211855, 0.1285778, -0.9679276, 1, 1, 1, 1, 1,
-0.2199065, -0.1283241, -3.623124, 1, 1, 1, 1, 1,
-0.2182356, 0.4455619, -1.842239, 1, 1, 1, 1, 1,
-0.2159892, -0.1898277, -3.587596, 1, 1, 1, 1, 1,
-0.2139319, 1.307403, 0.8686842, 1, 1, 1, 1, 1,
-0.2111448, 0.5667604, 0.7199452, 1, 1, 1, 1, 1,
-0.2109565, -0.6399787, -3.270822, 1, 1, 1, 1, 1,
-0.2042178, -0.1571849, -1.612794, 1, 1, 1, 1, 1,
-0.2036634, 0.3861536, 0.6433501, 1, 1, 1, 1, 1,
-0.2019384, 0.2960406, -1.07956, 1, 1, 1, 1, 1,
-0.2012381, -0.2563511, -2.748267, 0, 0, 1, 1, 1,
-0.199962, 0.854569, 0.09463503, 1, 0, 0, 1, 1,
-0.1995914, -0.2883038, -4.611034, 1, 0, 0, 1, 1,
-0.1981476, -0.1448012, -2.906575, 1, 0, 0, 1, 1,
-0.1955262, -0.9672721, -2.62422, 1, 0, 0, 1, 1,
-0.1944652, -1.036364, -4.153895, 1, 0, 0, 1, 1,
-0.1933607, -0.8261521, -2.57665, 0, 0, 0, 1, 1,
-0.1927066, -0.2039258, -3.251312, 0, 0, 0, 1, 1,
-0.1900117, -0.794663, -2.00091, 0, 0, 0, 1, 1,
-0.1883996, -0.26137, -0.986863, 0, 0, 0, 1, 1,
-0.18339, -0.3700233, -1.511905, 0, 0, 0, 1, 1,
-0.1827924, 0.1777707, 1.198335, 0, 0, 0, 1, 1,
-0.1815634, -1.072437, -4.301911, 0, 0, 0, 1, 1,
-0.1759168, -0.9861947, -2.796055, 1, 1, 1, 1, 1,
-0.172763, 0.835961, 0.2678524, 1, 1, 1, 1, 1,
-0.1726518, -1.476368, -3.590688, 1, 1, 1, 1, 1,
-0.1693324, -0.02861883, -2.750949, 1, 1, 1, 1, 1,
-0.1692178, -0.2294702, -0.9077114, 1, 1, 1, 1, 1,
-0.1646801, 0.03171036, -0.3347598, 1, 1, 1, 1, 1,
-0.1596049, 0.5603374, -0.5598343, 1, 1, 1, 1, 1,
-0.1512857, -2.161625, -3.559392, 1, 1, 1, 1, 1,
-0.1479773, 0.0454127, -1.272469, 1, 1, 1, 1, 1,
-0.1478171, -1.674718, -2.739287, 1, 1, 1, 1, 1,
-0.145827, 0.7660939, -0.3220558, 1, 1, 1, 1, 1,
-0.1455636, -0.9726351, -3.099265, 1, 1, 1, 1, 1,
-0.1437929, -1.958878, -2.393756, 1, 1, 1, 1, 1,
-0.1432481, 0.08402377, -0.5860304, 1, 1, 1, 1, 1,
-0.1412358, -0.8398632, -4.188326, 1, 1, 1, 1, 1,
-0.1389742, 0.7038634, 0.6223974, 0, 0, 1, 1, 1,
-0.1383976, 0.8361934, -0.3758406, 1, 0, 0, 1, 1,
-0.1352194, -0.5538083, -3.535144, 1, 0, 0, 1, 1,
-0.1340657, -1.107464, -2.960016, 1, 0, 0, 1, 1,
-0.1240598, 0.7304042, 0.3518749, 1, 0, 0, 1, 1,
-0.1195073, -0.872779, -1.805988, 1, 0, 0, 1, 1,
-0.1194947, 0.5518091, -0.9742732, 0, 0, 0, 1, 1,
-0.1117776, 1.222664, 0.1590525, 0, 0, 0, 1, 1,
-0.1097826, 0.2159145, 0.2397085, 0, 0, 0, 1, 1,
-0.1062456, -0.03812502, -2.090571, 0, 0, 0, 1, 1,
-0.1036912, -0.3441202, -2.651671, 0, 0, 0, 1, 1,
-0.1006331, 0.325021, -2.400806, 0, 0, 0, 1, 1,
-0.09777891, 0.2591434, 0.8503577, 0, 0, 0, 1, 1,
-0.09771724, -0.2298868, -0.9847806, 1, 1, 1, 1, 1,
-0.09370652, 1.30901, -0.7166663, 1, 1, 1, 1, 1,
-0.09194921, 2.928371, -0.1080621, 1, 1, 1, 1, 1,
-0.08897246, 1.34449, -0.3728138, 1, 1, 1, 1, 1,
-0.08180116, -0.7121662, -3.974102, 1, 1, 1, 1, 1,
-0.08079913, -0.8589461, -2.311183, 1, 1, 1, 1, 1,
-0.080493, -0.5952245, -2.722075, 1, 1, 1, 1, 1,
-0.07652373, -0.1279347, -2.137273, 1, 1, 1, 1, 1,
-0.07348403, 0.1301023, 1.026066, 1, 1, 1, 1, 1,
-0.07076213, 1.567085, 0.218853, 1, 1, 1, 1, 1,
-0.0704065, 2.040385, 0.6685393, 1, 1, 1, 1, 1,
-0.06903028, 1.123652, 0.207815, 1, 1, 1, 1, 1,
-0.06552427, -0.8128108, -3.039115, 1, 1, 1, 1, 1,
-0.06282061, -0.2955717, -3.543662, 1, 1, 1, 1, 1,
-0.06078659, 0.1671537, 0.1125542, 1, 1, 1, 1, 1,
-0.05733649, -1.80214, -3.710654, 0, 0, 1, 1, 1,
-0.05577468, 1.404195, -2.195349, 1, 0, 0, 1, 1,
-0.05537633, -0.2862926, -2.118078, 1, 0, 0, 1, 1,
-0.05415203, -0.0549114, -2.525434, 1, 0, 0, 1, 1,
-0.04356914, 0.09874991, -0.8821937, 1, 0, 0, 1, 1,
-0.04354817, -0.04666341, -3.026824, 1, 0, 0, 1, 1,
-0.04241068, -0.7168394, -3.560629, 0, 0, 0, 1, 1,
-0.04174047, 0.3245559, 0.7529979, 0, 0, 0, 1, 1,
-0.04104316, 0.1189875, -0.9379356, 0, 0, 0, 1, 1,
-0.04069589, -0.02638943, -0.1675851, 0, 0, 0, 1, 1,
-0.03974513, -0.7683133, -4.792007, 0, 0, 0, 1, 1,
-0.03254255, 0.4744292, -0.2691411, 0, 0, 0, 1, 1,
-0.02781266, 1.276638, -0.5998805, 0, 0, 0, 1, 1,
-0.02556793, -0.4208358, -4.372245, 1, 1, 1, 1, 1,
-0.02353919, -0.326063, -4.8275, 1, 1, 1, 1, 1,
-0.02194487, -1.728325, -3.901746, 1, 1, 1, 1, 1,
-0.0200385, -0.6966433, -3.039536, 1, 1, 1, 1, 1,
-0.01151063, 0.05297346, -0.3588555, 1, 1, 1, 1, 1,
-0.01069926, 1.422002, 1.366754, 1, 1, 1, 1, 1,
-0.009821675, 1.221933, -0.3554232, 1, 1, 1, 1, 1,
-0.008475479, 0.07286946, 0.04730661, 1, 1, 1, 1, 1,
-0.007565052, 1.144855, -0.3683181, 1, 1, 1, 1, 1,
-0.006167199, 1.249397, -2.180405, 1, 1, 1, 1, 1,
0.0009622556, 0.5820376, 0.00574005, 1, 1, 1, 1, 1,
0.001035632, -0.9073849, 3.42272, 1, 1, 1, 1, 1,
0.00137044, 0.3163666, -0.4712058, 1, 1, 1, 1, 1,
0.009926045, 2.413068, -0.2435611, 1, 1, 1, 1, 1,
0.01038966, -0.7261326, 3.015676, 1, 1, 1, 1, 1,
0.01123331, -1.84162, 2.663498, 0, 0, 1, 1, 1,
0.0141129, 0.5669779, 0.2195168, 1, 0, 0, 1, 1,
0.02173588, 1.190929, 2.405536, 1, 0, 0, 1, 1,
0.02942777, -0.09392936, 3.191592, 1, 0, 0, 1, 1,
0.03322053, 0.4175158, 1.188033, 1, 0, 0, 1, 1,
0.03616165, 0.8413025, -1.379666, 1, 0, 0, 1, 1,
0.03906019, 1.025348, 0.223607, 0, 0, 0, 1, 1,
0.03921296, -0.526173, 2.723136, 0, 0, 0, 1, 1,
0.03980125, -0.6218264, 2.612546, 0, 0, 0, 1, 1,
0.04008638, -0.5202807, 1.092155, 0, 0, 0, 1, 1,
0.04296054, 1.572899, -0.4300877, 0, 0, 0, 1, 1,
0.04431725, 0.2901034, -2.278553, 0, 0, 0, 1, 1,
0.04615524, 0.9563064, 0.4980673, 0, 0, 0, 1, 1,
0.04703305, 0.3243695, 0.3871858, 1, 1, 1, 1, 1,
0.05036187, 1.140303, -0.1825344, 1, 1, 1, 1, 1,
0.05144704, -0.3491196, 4.418981, 1, 1, 1, 1, 1,
0.05151534, -0.4679002, 2.572821, 1, 1, 1, 1, 1,
0.05441826, 0.0474467, 1.979781, 1, 1, 1, 1, 1,
0.0588124, 0.1473972, 2.200896, 1, 1, 1, 1, 1,
0.06437664, -0.7911454, 4.157079, 1, 1, 1, 1, 1,
0.06635308, 0.1576144, 0.153897, 1, 1, 1, 1, 1,
0.06828736, 1.367631, 1.488019, 1, 1, 1, 1, 1,
0.0687339, 0.05543764, 0.895696, 1, 1, 1, 1, 1,
0.07209916, -1.391037, 3.229348, 1, 1, 1, 1, 1,
0.07237237, 0.5475439, 0.5286298, 1, 1, 1, 1, 1,
0.0729171, 1.261906, -0.8247528, 1, 1, 1, 1, 1,
0.07407045, 0.7237551, -0.2481692, 1, 1, 1, 1, 1,
0.07565673, -0.265755, 6.443347, 1, 1, 1, 1, 1,
0.08422574, -0.3408215, 3.305425, 0, 0, 1, 1, 1,
0.08682507, -1.088096, 3.243232, 1, 0, 0, 1, 1,
0.08761156, -0.540518, 2.375258, 1, 0, 0, 1, 1,
0.08816944, -0.7244719, 2.987954, 1, 0, 0, 1, 1,
0.09095269, 0.8173047, -0.194325, 1, 0, 0, 1, 1,
0.09110076, -1.353356, 2.397769, 1, 0, 0, 1, 1,
0.09129465, -0.4211473, 2.20549, 0, 0, 0, 1, 1,
0.09233038, -0.7283946, 2.459823, 0, 0, 0, 1, 1,
0.09279767, -0.2052997, 2.003136, 0, 0, 0, 1, 1,
0.09635383, -0.95258, 1.219387, 0, 0, 0, 1, 1,
0.09729259, 0.67881, -0.6865816, 0, 0, 0, 1, 1,
0.0991945, -0.1580808, 1.785246, 0, 0, 0, 1, 1,
0.09992612, -1.269756, 1.769526, 0, 0, 0, 1, 1,
0.1062305, -1.049366, 4.030283, 1, 1, 1, 1, 1,
0.1080533, -0.4131553, 4.607769, 1, 1, 1, 1, 1,
0.109176, -0.1488395, 3.258008, 1, 1, 1, 1, 1,
0.1093647, -1.305448, 3.841819, 1, 1, 1, 1, 1,
0.1109666, -0.4303724, 2.243671, 1, 1, 1, 1, 1,
0.1120201, -0.05048282, 1.657335, 1, 1, 1, 1, 1,
0.113928, -0.07411934, 3.225544, 1, 1, 1, 1, 1,
0.1180684, -0.7123408, 2.085675, 1, 1, 1, 1, 1,
0.1184279, 0.2869202, 2.010018, 1, 1, 1, 1, 1,
0.1200087, -0.769323, 2.813749, 1, 1, 1, 1, 1,
0.1302882, -2.915915, 3.781917, 1, 1, 1, 1, 1,
0.131882, -1.048667, 3.868483, 1, 1, 1, 1, 1,
0.1353227, -0.4154833, 3.735532, 1, 1, 1, 1, 1,
0.1367355, 0.1329887, -0.08386929, 1, 1, 1, 1, 1,
0.1371881, -0.5364485, 2.001399, 1, 1, 1, 1, 1,
0.1422289, 0.8568891, 0.4969315, 0, 0, 1, 1, 1,
0.1441388, -1.011845, 3.34931, 1, 0, 0, 1, 1,
0.1525423, 0.4431041, 0.3116326, 1, 0, 0, 1, 1,
0.1538211, -0.3934407, 1.498053, 1, 0, 0, 1, 1,
0.1543169, -1.873335, 3.768069, 1, 0, 0, 1, 1,
0.1552336, 1.314326, -3.02439, 1, 0, 0, 1, 1,
0.1563952, -1.846528, 4.588313, 0, 0, 0, 1, 1,
0.1596294, -0.7866555, 1.543216, 0, 0, 0, 1, 1,
0.1604245, 0.07765432, 0.1857452, 0, 0, 0, 1, 1,
0.1610398, 1.20036, 0.6271474, 0, 0, 0, 1, 1,
0.1614538, 0.155682, -0.3743058, 0, 0, 0, 1, 1,
0.1633817, 0.4551268, 1.540024, 0, 0, 0, 1, 1,
0.1670816, -0.9396971, 2.446446, 0, 0, 0, 1, 1,
0.1770368, -0.8037835, 3.764116, 1, 1, 1, 1, 1,
0.1796603, 2.178977, 0.9625551, 1, 1, 1, 1, 1,
0.1808444, 0.2726875, 1.516143, 1, 1, 1, 1, 1,
0.18802, -0.9045065, 4.01247, 1, 1, 1, 1, 1,
0.1936506, -0.8399844, 3.393876, 1, 1, 1, 1, 1,
0.1955678, 0.7758148, 0.1313334, 1, 1, 1, 1, 1,
0.1991786, -0.02504621, 2.196459, 1, 1, 1, 1, 1,
0.1996833, -0.07416943, 0.6371556, 1, 1, 1, 1, 1,
0.1998769, -2.245659, 4.847549, 1, 1, 1, 1, 1,
0.2042721, 2.02619, -0.5279737, 1, 1, 1, 1, 1,
0.2046514, 1.777082, -0.1885542, 1, 1, 1, 1, 1,
0.2057725, 0.9343969, 2.880533, 1, 1, 1, 1, 1,
0.2070406, -0.002685223, 2.076864, 1, 1, 1, 1, 1,
0.2080387, -0.3970256, 2.542067, 1, 1, 1, 1, 1,
0.2108071, -0.4052523, 1.98366, 1, 1, 1, 1, 1,
0.2127626, 0.2310183, -0.9062856, 0, 0, 1, 1, 1,
0.2148257, -0.04568803, -0.6228521, 1, 0, 0, 1, 1,
0.2156738, 0.3153362, 1.549118, 1, 0, 0, 1, 1,
0.2206581, 2.133273, -1.516416, 1, 0, 0, 1, 1,
0.2224094, 0.4663571, -0.7577642, 1, 0, 0, 1, 1,
0.2234832, 1.278236, 0.4546159, 1, 0, 0, 1, 1,
0.2236168, -2.30092, 3.355768, 0, 0, 0, 1, 1,
0.2305427, 0.1912857, -0.221113, 0, 0, 0, 1, 1,
0.2348329, 1.388837, 0.8904875, 0, 0, 0, 1, 1,
0.2365128, -1.210857, 3.536868, 0, 0, 0, 1, 1,
0.237737, 0.3321636, 0.2214281, 0, 0, 0, 1, 1,
0.2444082, -0.3769347, 1.512875, 0, 0, 0, 1, 1,
0.2468523, 0.7944584, 1.355579, 0, 0, 0, 1, 1,
0.2543945, 3.353019, -1.159732, 1, 1, 1, 1, 1,
0.2545851, 0.1722373, 1.218328, 1, 1, 1, 1, 1,
0.2557627, 1.287636, -0.3975348, 1, 1, 1, 1, 1,
0.2601807, -0.7119038, 4.005166, 1, 1, 1, 1, 1,
0.2617955, 0.5211289, -0.03538303, 1, 1, 1, 1, 1,
0.2626848, 1.587859, 0.6228212, 1, 1, 1, 1, 1,
0.2629408, 0.2905152, 2.800762, 1, 1, 1, 1, 1,
0.2652131, -1.383784, 2.699165, 1, 1, 1, 1, 1,
0.2687324, -0.6569102, 1.823144, 1, 1, 1, 1, 1,
0.2714166, 0.9973022, -0.6599339, 1, 1, 1, 1, 1,
0.2728074, -0.1806812, 2.309255, 1, 1, 1, 1, 1,
0.2737108, 0.9067398, 1.567247, 1, 1, 1, 1, 1,
0.2787938, 1.352949, -1.351172, 1, 1, 1, 1, 1,
0.2801754, -0.4308643, 3.175666, 1, 1, 1, 1, 1,
0.2807499, -0.2026894, 1.313282, 1, 1, 1, 1, 1,
0.2827654, 0.8095545, 0.7468061, 0, 0, 1, 1, 1,
0.286162, 1.464059, -0.05368872, 1, 0, 0, 1, 1,
0.2878328, 0.3384954, 1.53089, 1, 0, 0, 1, 1,
0.2923076, -0.6881539, 2.529407, 1, 0, 0, 1, 1,
0.2939879, 1.211903, 1.905415, 1, 0, 0, 1, 1,
0.2962808, -1.535164, 3.492625, 1, 0, 0, 1, 1,
0.2993152, 0.1888995, 1.452149, 0, 0, 0, 1, 1,
0.3065386, 0.8615748, 1.879059, 0, 0, 0, 1, 1,
0.3121825, -0.1170722, -0.389856, 0, 0, 0, 1, 1,
0.3201288, 1.970656, -0.316441, 0, 0, 0, 1, 1,
0.3205267, -0.834395, 4.045926, 0, 0, 0, 1, 1,
0.3214876, -0.2823389, 3.115751, 0, 0, 0, 1, 1,
0.3248764, -0.7324317, 2.195324, 0, 0, 0, 1, 1,
0.3268179, 1.027601, 1.944278, 1, 1, 1, 1, 1,
0.3270285, 0.3177074, 0.06414188, 1, 1, 1, 1, 1,
0.3281753, -1.348206, 2.358503, 1, 1, 1, 1, 1,
0.3285629, -0.5374842, 2.595256, 1, 1, 1, 1, 1,
0.3421677, -0.9318711, 3.82243, 1, 1, 1, 1, 1,
0.3442791, 0.06754459, 2.835844, 1, 1, 1, 1, 1,
0.3480142, 0.6419731, 0.08446532, 1, 1, 1, 1, 1,
0.3554248, -0.1224832, 1.841101, 1, 1, 1, 1, 1,
0.3570677, 0.5206749, -0.02095269, 1, 1, 1, 1, 1,
0.3601612, 0.8770757, -0.1280154, 1, 1, 1, 1, 1,
0.3605044, 1.834898, 0.3983432, 1, 1, 1, 1, 1,
0.3633317, 0.1928872, -0.2539498, 1, 1, 1, 1, 1,
0.3680744, -0.4543139, 1.790337, 1, 1, 1, 1, 1,
0.3744947, 2.740417, -1.460196, 1, 1, 1, 1, 1,
0.3756963, 0.1021358, 0.9108131, 1, 1, 1, 1, 1,
0.3795032, -0.8354769, 2.550306, 0, 0, 1, 1, 1,
0.3820398, 1.079983, 1.606524, 1, 0, 0, 1, 1,
0.3827881, 0.5721844, 1.48661, 1, 0, 0, 1, 1,
0.3846059, -0.9034676, 1.559514, 1, 0, 0, 1, 1,
0.3850449, -0.9042127, 3.245202, 1, 0, 0, 1, 1,
0.385908, -0.1412642, 1.728159, 1, 0, 0, 1, 1,
0.3877392, -0.3542987, 2.872995, 0, 0, 0, 1, 1,
0.3901441, 1.946175, -2.24408, 0, 0, 0, 1, 1,
0.3964934, 0.7121394, -0.4485793, 0, 0, 0, 1, 1,
0.3973219, 1.559956, 1.198046, 0, 0, 0, 1, 1,
0.3985683, -0.6218808, 3.311033, 0, 0, 0, 1, 1,
0.3987684, -0.7521569, 4.241578, 0, 0, 0, 1, 1,
0.3996296, 0.7053451, -0.4520546, 0, 0, 0, 1, 1,
0.4003996, 1.116427, 1.52701, 1, 1, 1, 1, 1,
0.401804, -0.2280118, 0.1269325, 1, 1, 1, 1, 1,
0.4038461, 0.2826594, 0.06459314, 1, 1, 1, 1, 1,
0.4070378, 0.054853, 1.818179, 1, 1, 1, 1, 1,
0.4078549, 0.6382619, 0.8188113, 1, 1, 1, 1, 1,
0.4111496, -0.288616, 1.875213, 1, 1, 1, 1, 1,
0.413144, -0.1152028, 0.6324114, 1, 1, 1, 1, 1,
0.4199669, -0.2331513, 1.592213, 1, 1, 1, 1, 1,
0.4213074, 0.6573457, 1.932903, 1, 1, 1, 1, 1,
0.4230452, 0.694142, 0.1979224, 1, 1, 1, 1, 1,
0.4267156, -0.07859424, 2.272239, 1, 1, 1, 1, 1,
0.4289573, 1.160383, 1.151959, 1, 1, 1, 1, 1,
0.4319705, 0.3643961, 0.4152415, 1, 1, 1, 1, 1,
0.4329211, -0.8677848, 2.871789, 1, 1, 1, 1, 1,
0.4379003, 1.210678, 0.9699357, 1, 1, 1, 1, 1,
0.4404612, 0.4421673, 0.2558199, 0, 0, 1, 1, 1,
0.4415332, -1.057458, 3.271327, 1, 0, 0, 1, 1,
0.4420006, -0.4467525, 1.70715, 1, 0, 0, 1, 1,
0.4504841, 1.027899, -1.84351, 1, 0, 0, 1, 1,
0.4523625, 0.3217226, 0.01978145, 1, 0, 0, 1, 1,
0.4605314, -0.681789, 4.843944, 1, 0, 0, 1, 1,
0.4668733, -1.737967, 1.183444, 0, 0, 0, 1, 1,
0.4677138, 1.472895, 1.915567, 0, 0, 0, 1, 1,
0.4686466, 2.181061, 1.079561, 0, 0, 0, 1, 1,
0.4694033, 0.05990986, 0.2993154, 0, 0, 0, 1, 1,
0.4716061, 1.953734, -1.635617, 0, 0, 0, 1, 1,
0.4793996, 2.040284, 0.9000887, 0, 0, 0, 1, 1,
0.4890793, 1.743996, -0.1456468, 0, 0, 0, 1, 1,
0.4899848, -0.1007058, 1.783056, 1, 1, 1, 1, 1,
0.4957673, 0.4050762, 1.726434, 1, 1, 1, 1, 1,
0.4970196, 1.324697, -0.7282526, 1, 1, 1, 1, 1,
0.5018736, -1.092238, 2.339741, 1, 1, 1, 1, 1,
0.503226, -0.6037799, 1.822369, 1, 1, 1, 1, 1,
0.5034314, -1.849175, 1.937174, 1, 1, 1, 1, 1,
0.5037941, -0.08364958, 2.261208, 1, 1, 1, 1, 1,
0.5147574, 0.8403833, 0.7376415, 1, 1, 1, 1, 1,
0.5179048, -1.437377, 3.519386, 1, 1, 1, 1, 1,
0.5202391, 0.4014875, -1.182449, 1, 1, 1, 1, 1,
0.521217, 1.878039, -0.2149643, 1, 1, 1, 1, 1,
0.522135, 0.02132051, 2.082593, 1, 1, 1, 1, 1,
0.5259078, 2.340808, -1.072976, 1, 1, 1, 1, 1,
0.5269278, 1.024864, 0.2637802, 1, 1, 1, 1, 1,
0.5309346, -0.9073058, 1.028764, 1, 1, 1, 1, 1,
0.531795, -0.9567159, 1.891399, 0, 0, 1, 1, 1,
0.538604, 1.001627, -0.8632774, 1, 0, 0, 1, 1,
0.5389487, -0.7262548, 2.57501, 1, 0, 0, 1, 1,
0.5392374, 1.062935, 0.2906625, 1, 0, 0, 1, 1,
0.5441007, 0.1913807, 0.9990978, 1, 0, 0, 1, 1,
0.544427, 0.1349341, 1.319865, 1, 0, 0, 1, 1,
0.5476771, -0.9446223, 0.2347064, 0, 0, 0, 1, 1,
0.5486878, -1.208743, 3.975131, 0, 0, 0, 1, 1,
0.549279, -0.6329137, 2.408894, 0, 0, 0, 1, 1,
0.5503799, 1.236458, -0.6402241, 0, 0, 0, 1, 1,
0.5509773, 0.8138513, 0.778917, 0, 0, 0, 1, 1,
0.5517815, -0.4476292, 2.25186, 0, 0, 0, 1, 1,
0.5526996, 0.1005779, 2.571961, 0, 0, 0, 1, 1,
0.5611736, 0.2213171, -1.035586, 1, 1, 1, 1, 1,
0.563126, -0.2428555, 2.32499, 1, 1, 1, 1, 1,
0.5683766, -1.021352, 3.630684, 1, 1, 1, 1, 1,
0.5687237, -1.524224, 3.356324, 1, 1, 1, 1, 1,
0.5711038, -0.2010331, 1.082072, 1, 1, 1, 1, 1,
0.57183, 0.0145102, 1.000957, 1, 1, 1, 1, 1,
0.575253, -0.8704576, 2.011679, 1, 1, 1, 1, 1,
0.5772946, -1.427943, 3.618571, 1, 1, 1, 1, 1,
0.5798559, -0.7107792, 1.817231, 1, 1, 1, 1, 1,
0.5833422, -0.1101354, -0.1719796, 1, 1, 1, 1, 1,
0.5903646, -1.31929, 1.803243, 1, 1, 1, 1, 1,
0.5954347, 1.286754, 1.962967, 1, 1, 1, 1, 1,
0.5983942, 0.9248857, 1.324715, 1, 1, 1, 1, 1,
0.6014733, -0.7364268, 2.247305, 1, 1, 1, 1, 1,
0.6098241, 1.079988, 0.3318587, 1, 1, 1, 1, 1,
0.6101993, 0.5208597, 0.6962227, 0, 0, 1, 1, 1,
0.6156979, -1.186973, 4.182248, 1, 0, 0, 1, 1,
0.6273133, 0.4727435, 1.960922, 1, 0, 0, 1, 1,
0.6320126, 0.1523169, 1.475476, 1, 0, 0, 1, 1,
0.6343822, 0.04877544, 2.872682, 1, 0, 0, 1, 1,
0.6356504, -0.7500128, 2.077334, 1, 0, 0, 1, 1,
0.6362749, 1.021324, 2.696103, 0, 0, 0, 1, 1,
0.639756, -1.180197, 2.609566, 0, 0, 0, 1, 1,
0.6403379, -0.3425833, 1.574121, 0, 0, 0, 1, 1,
0.6410309, -0.3029262, 1.570784, 0, 0, 0, 1, 1,
0.6430783, -2.064388, 4.128402, 0, 0, 0, 1, 1,
0.645275, -1.210096, 3.582509, 0, 0, 0, 1, 1,
0.6483302, -1.181251, 2.94188, 0, 0, 0, 1, 1,
0.6503697, -0.6008644, 2.460976, 1, 1, 1, 1, 1,
0.6545228, 2.821174, -0.6953423, 1, 1, 1, 1, 1,
0.6577106, 0.2497662, -0.7214302, 1, 1, 1, 1, 1,
0.6662174, 1.695819, -1.256185, 1, 1, 1, 1, 1,
0.6670723, 1.335248, -0.08117721, 1, 1, 1, 1, 1,
0.6699101, 0.6419579, 2.30847, 1, 1, 1, 1, 1,
0.6720404, -0.1679131, 4.188985, 1, 1, 1, 1, 1,
0.6746073, 0.8841693, 1.778747, 1, 1, 1, 1, 1,
0.6777683, 0.2790962, 0.1898606, 1, 1, 1, 1, 1,
0.6829898, -1.020131, 1.838631, 1, 1, 1, 1, 1,
0.6891779, 0.6521884, 1.264918, 1, 1, 1, 1, 1,
0.689523, -0.7211169, 3.448228, 1, 1, 1, 1, 1,
0.6907908, 0.9599004, -0.685047, 1, 1, 1, 1, 1,
0.6924589, -0.5056579, 3.991338, 1, 1, 1, 1, 1,
0.704289, 1.555007, 2.750566, 1, 1, 1, 1, 1,
0.7064944, -1.788484, 1.82948, 0, 0, 1, 1, 1,
0.7102073, 0.1945799, 0.9052016, 1, 0, 0, 1, 1,
0.7187624, 0.02475897, 0.3424726, 1, 0, 0, 1, 1,
0.7255542, -0.2553054, 0.9573144, 1, 0, 0, 1, 1,
0.7289263, -1.833219, 1.864803, 1, 0, 0, 1, 1,
0.731968, 1.268461, 0.800593, 1, 0, 0, 1, 1,
0.733168, -0.4097207, 2.90421, 0, 0, 0, 1, 1,
0.7417958, 0.826749, -0.6539016, 0, 0, 0, 1, 1,
0.745323, 1.442347, 1.267924, 0, 0, 0, 1, 1,
0.7538849, -0.845026, 3.120188, 0, 0, 0, 1, 1,
0.7544169, 0.3353098, 0.6128961, 0, 0, 0, 1, 1,
0.7583737, 0.8473336, 1.023301, 0, 0, 0, 1, 1,
0.7609411, -0.09217889, 0.9738758, 0, 0, 0, 1, 1,
0.7620118, -0.7470961, 2.969166, 1, 1, 1, 1, 1,
0.775678, -0.9984468, 2.116025, 1, 1, 1, 1, 1,
0.7797046, 0.989548, 1.843877, 1, 1, 1, 1, 1,
0.7915028, 1.253386, 0.5213711, 1, 1, 1, 1, 1,
0.7946629, 0.5997167, 2.017271, 1, 1, 1, 1, 1,
0.7973535, -0.07608773, 1.703584, 1, 1, 1, 1, 1,
0.7998093, 0.431704, 3.374423, 1, 1, 1, 1, 1,
0.8000715, -0.04771752, 0.9684302, 1, 1, 1, 1, 1,
0.8029678, 0.1548228, 3.121546, 1, 1, 1, 1, 1,
0.8054128, -0.5692031, 2.057854, 1, 1, 1, 1, 1,
0.8123057, -0.51464, 4.640593, 1, 1, 1, 1, 1,
0.8127809, -0.1805847, 1.48214, 1, 1, 1, 1, 1,
0.8279266, -0.9026836, 1.785433, 1, 1, 1, 1, 1,
0.829991, 0.08923166, 1.583171, 1, 1, 1, 1, 1,
0.8308012, -0.2331643, 2.447343, 1, 1, 1, 1, 1,
0.8329683, -0.8028058, 2.330657, 0, 0, 1, 1, 1,
0.8367758, 1.641444, -0.2017887, 1, 0, 0, 1, 1,
0.848366, -0.7584141, 4.214129, 1, 0, 0, 1, 1,
0.8483964, -0.8738109, 2.439895, 1, 0, 0, 1, 1,
0.8498297, -0.03445741, 1.308703, 1, 0, 0, 1, 1,
0.8510112, -2.014096, 1.808977, 1, 0, 0, 1, 1,
0.8526046, 0.1314832, 2.246582, 0, 0, 0, 1, 1,
0.8528492, -1.399983, 3.929619, 0, 0, 0, 1, 1,
0.8584843, 1.909811, 0.03466766, 0, 0, 0, 1, 1,
0.8601929, -0.4289339, 2.080795, 0, 0, 0, 1, 1,
0.8620096, 0.873768, -0.7313838, 0, 0, 0, 1, 1,
0.863245, -0.3939771, 1.144511, 0, 0, 0, 1, 1,
0.8633853, 1.048584, 1.114788, 0, 0, 0, 1, 1,
0.8652657, -0.1888887, 1.73878, 1, 1, 1, 1, 1,
0.8670831, 0.5722036, 1.227193, 1, 1, 1, 1, 1,
0.8687982, -0.5145733, 1.455666, 1, 1, 1, 1, 1,
0.8720392, -0.6109093, 1.957257, 1, 1, 1, 1, 1,
0.8795037, -0.1211058, 2.735758, 1, 1, 1, 1, 1,
0.8807498, 1.742379, 1.499085, 1, 1, 1, 1, 1,
0.8828917, 1.58735, 2.848173, 1, 1, 1, 1, 1,
0.8858837, 0.2845316, 3.541016, 1, 1, 1, 1, 1,
0.897624, -1.699911, 3.685674, 1, 1, 1, 1, 1,
0.8981127, -0.2829806, 3.362017, 1, 1, 1, 1, 1,
0.9004853, 0.6513825, 2.690759, 1, 1, 1, 1, 1,
0.9031588, -0.9052702, 1.670017, 1, 1, 1, 1, 1,
0.9038393, -0.9300504, 2.657149, 1, 1, 1, 1, 1,
0.9189354, -0.4250296, 1.772739, 1, 1, 1, 1, 1,
0.9217462, 0.8147645, 0.7313113, 1, 1, 1, 1, 1,
0.932081, -0.06549211, 1.528786, 0, 0, 1, 1, 1,
0.9331535, 0.1356439, 0.3934073, 1, 0, 0, 1, 1,
0.9355935, 1.16768, -0.8711694, 1, 0, 0, 1, 1,
0.9514686, -0.3234956, 2.820241, 1, 0, 0, 1, 1,
0.9567139, 0.463088, 0.37261, 1, 0, 0, 1, 1,
0.9607416, 0.1241969, 0.3365065, 1, 0, 0, 1, 1,
0.9663872, 1.118601, 1.741573, 0, 0, 0, 1, 1,
0.9670949, 1.1746, 0.8686886, 0, 0, 0, 1, 1,
0.9710932, 0.09740259, 3.22808, 0, 0, 0, 1, 1,
0.9772691, -0.6630762, 1.776408, 0, 0, 0, 1, 1,
0.9808941, -0.07810304, 1.1582, 0, 0, 0, 1, 1,
0.9815105, -0.9146289, 1.186212, 0, 0, 0, 1, 1,
0.98519, -0.5429331, 2.435987, 0, 0, 0, 1, 1,
0.9869056, 2.14147, 2.288461, 1, 1, 1, 1, 1,
0.9879138, -0.8679866, 1.299333, 1, 1, 1, 1, 1,
0.9881771, 0.389371, 1.571341, 1, 1, 1, 1, 1,
0.9893291, 0.1557458, 1.616444, 1, 1, 1, 1, 1,
0.9900461, 1.259443, 2.488612, 1, 1, 1, 1, 1,
0.9929197, 0.6149416, 0.2516313, 1, 1, 1, 1, 1,
0.9960714, -0.08688947, 2.685561, 1, 1, 1, 1, 1,
0.9986413, 0.3869735, -0.1973337, 1, 1, 1, 1, 1,
0.9991091, -0.2522913, 1.280818, 1, 1, 1, 1, 1,
0.9994407, -0.652997, 4.660338, 1, 1, 1, 1, 1,
1.006096, -0.6777511, 2.399683, 1, 1, 1, 1, 1,
1.008856, 0.5162249, -1.162689, 1, 1, 1, 1, 1,
1.009374, -1.022672, 1.354515, 1, 1, 1, 1, 1,
1.015278, 0.6206073, -0.7075204, 1, 1, 1, 1, 1,
1.015696, 0.2038449, 0.9019184, 1, 1, 1, 1, 1,
1.020198, 0.2420801, 0.4284767, 0, 0, 1, 1, 1,
1.025398, 0.4772327, -0.8629385, 1, 0, 0, 1, 1,
1.027421, 2.374292, -0.3722917, 1, 0, 0, 1, 1,
1.029517, 1.915652, 0.4759095, 1, 0, 0, 1, 1,
1.03139, 1.769787, 0.9772318, 1, 0, 0, 1, 1,
1.049837, 0.04237371, 1.094015, 1, 0, 0, 1, 1,
1.057261, -1.359047, 2.91009, 0, 0, 0, 1, 1,
1.060613, 0.496978, -0.4586831, 0, 0, 0, 1, 1,
1.063908, -0.03691954, 0.5416425, 0, 0, 0, 1, 1,
1.065354, -0.04265244, 1.978323, 0, 0, 0, 1, 1,
1.067274, 0.2551256, 0.4663427, 0, 0, 0, 1, 1,
1.070155, 1.952743, 0.6180199, 0, 0, 0, 1, 1,
1.07672, -0.1047875, 2.494427, 0, 0, 0, 1, 1,
1.083368, -0.6412503, 0.8035245, 1, 1, 1, 1, 1,
1.095949, -1.076814, 2.497581, 1, 1, 1, 1, 1,
1.098354, 0.1897979, 2.186721, 1, 1, 1, 1, 1,
1.100084, 1.178496, 2.738053, 1, 1, 1, 1, 1,
1.103432, 0.2906933, 3.453224, 1, 1, 1, 1, 1,
1.105594, 0.9076226, -0.4782351, 1, 1, 1, 1, 1,
1.117789, 0.05573034, 1.240621, 1, 1, 1, 1, 1,
1.123958, 1.492148, 0.8027704, 1, 1, 1, 1, 1,
1.130931, 0.075245, 1.449192, 1, 1, 1, 1, 1,
1.132743, 0.8493535, 2.125194, 1, 1, 1, 1, 1,
1.135544, 0.2616301, 0.3018822, 1, 1, 1, 1, 1,
1.138864, -0.2588555, 1.35826, 1, 1, 1, 1, 1,
1.141929, -0.2867098, 0.5089558, 1, 1, 1, 1, 1,
1.143158, 0.2074391, 2.689162, 1, 1, 1, 1, 1,
1.161991, 0.52806, 1.192067, 1, 1, 1, 1, 1,
1.171033, -0.003167622, 2.359208, 0, 0, 1, 1, 1,
1.175729, -1.038668, 2.962286, 1, 0, 0, 1, 1,
1.175837, -0.5704234, 2.707346, 1, 0, 0, 1, 1,
1.178438, 2.282663, 1.740494, 1, 0, 0, 1, 1,
1.179858, 1.210546, 1.399047, 1, 0, 0, 1, 1,
1.183418, -0.9079489, 3.172909, 1, 0, 0, 1, 1,
1.183979, -1.064229, 3.041021, 0, 0, 0, 1, 1,
1.1852, -1.358384, 2.826046, 0, 0, 0, 1, 1,
1.196253, -0.2492745, 2.601788, 0, 0, 0, 1, 1,
1.201923, 1.312486, 0.560977, 0, 0, 0, 1, 1,
1.212135, -0.5997258, 1.550525, 0, 0, 0, 1, 1,
1.212945, -0.6124464, -0.6470342, 0, 0, 0, 1, 1,
1.213266, -1.838332, 4.074454, 0, 0, 0, 1, 1,
1.213759, -1.485612, 1.663246, 1, 1, 1, 1, 1,
1.215469, -0.2376307, 2.487328, 1, 1, 1, 1, 1,
1.219882, -0.7783842, 2.17336, 1, 1, 1, 1, 1,
1.225377, -0.7146125, 2.403449, 1, 1, 1, 1, 1,
1.225738, -1.081363, 2.316236, 1, 1, 1, 1, 1,
1.227196, 1.138893, 2.211727, 1, 1, 1, 1, 1,
1.228919, -1.559367, 0.9566485, 1, 1, 1, 1, 1,
1.238476, 1.304556, 0.8305367, 1, 1, 1, 1, 1,
1.238647, -0.7772104, 1.347515, 1, 1, 1, 1, 1,
1.242653, 0.5266182, 2.348985, 1, 1, 1, 1, 1,
1.247956, 1.759694, -1.354457, 1, 1, 1, 1, 1,
1.248815, 2.232688, 0.04877515, 1, 1, 1, 1, 1,
1.253901, 1.914195, -0.1941621, 1, 1, 1, 1, 1,
1.254059, 0.04329131, 1.068544, 1, 1, 1, 1, 1,
1.25479, 1.324036, 1.139703, 1, 1, 1, 1, 1,
1.26168, 0.9410754, 1.710652, 0, 0, 1, 1, 1,
1.263108, -0.4334054, 0.8931782, 1, 0, 0, 1, 1,
1.268224, 0.7900768, -0.2428794, 1, 0, 0, 1, 1,
1.268921, 0.8204479, 2.078106, 1, 0, 0, 1, 1,
1.278134, 1.515662, -0.8078946, 1, 0, 0, 1, 1,
1.28073, -1.218152, 3.273211, 1, 0, 0, 1, 1,
1.294228, -1.683312, 2.284111, 0, 0, 0, 1, 1,
1.304649, 0.5254961, 1.86017, 0, 0, 0, 1, 1,
1.319295, 0.6605828, 0.5254997, 0, 0, 0, 1, 1,
1.323143, -0.5867078, 0.7782683, 0, 0, 0, 1, 1,
1.330494, -2.173796, 4.613396, 0, 0, 0, 1, 1,
1.338151, 0.597931, 0.9025437, 0, 0, 0, 1, 1,
1.338945, 1.026401, 2.193363, 0, 0, 0, 1, 1,
1.342828, 0.1335377, 2.606757, 1, 1, 1, 1, 1,
1.344218, -0.3562357, 3.339838, 1, 1, 1, 1, 1,
1.34763, -1.156616, 2.067365, 1, 1, 1, 1, 1,
1.350801, -2.339811, 2.458748, 1, 1, 1, 1, 1,
1.356564, 0.731755, 0.1466042, 1, 1, 1, 1, 1,
1.382874, 0.02765206, 1.244101, 1, 1, 1, 1, 1,
1.38986, -0.6308761, 2.432486, 1, 1, 1, 1, 1,
1.394987, -0.4657572, 1.82099, 1, 1, 1, 1, 1,
1.398107, 1.082812, 0.8493816, 1, 1, 1, 1, 1,
1.400726, 0.1445683, 2.460137, 1, 1, 1, 1, 1,
1.401022, -0.6528919, 1.750693, 1, 1, 1, 1, 1,
1.405074, 0.59475, 1.151934, 1, 1, 1, 1, 1,
1.407129, -0.4062023, 3.435788, 1, 1, 1, 1, 1,
1.408345, 0.8968925, -0.7349177, 1, 1, 1, 1, 1,
1.409706, 0.2705777, 1.175443, 1, 1, 1, 1, 1,
1.411895, -0.4508272, 3.361146, 0, 0, 1, 1, 1,
1.416363, 0.8642678, 2.321372, 1, 0, 0, 1, 1,
1.418159, -0.9432667, 2.194877, 1, 0, 0, 1, 1,
1.423544, -0.5906972, 0.9062892, 1, 0, 0, 1, 1,
1.434269, -0.1904807, 0.7427492, 1, 0, 0, 1, 1,
1.440823, 0.7444439, 2.12183, 1, 0, 0, 1, 1,
1.444049, -2.628483, 0.7272898, 0, 0, 0, 1, 1,
1.463179, 0.7953383, 0.5392488, 0, 0, 0, 1, 1,
1.467359, -0.5465064, 0.730204, 0, 0, 0, 1, 1,
1.482892, 0.823174, 1.705791, 0, 0, 0, 1, 1,
1.485379, -0.3036723, 0.4444552, 0, 0, 0, 1, 1,
1.488191, 1.617772, 0.550867, 0, 0, 0, 1, 1,
1.498976, 0.4915359, 1.2834, 0, 0, 0, 1, 1,
1.509961, -0.4118347, -0.1653065, 1, 1, 1, 1, 1,
1.535204, 0.5142668, 0.4665274, 1, 1, 1, 1, 1,
1.546438, 0.2373514, 1.585888, 1, 1, 1, 1, 1,
1.54792, -1.538091, 2.315041, 1, 1, 1, 1, 1,
1.549137, -0.6032823, 3.124931, 1, 1, 1, 1, 1,
1.550228, 0.9424018, 0.8407416, 1, 1, 1, 1, 1,
1.555817, -1.001553, 2.377784, 1, 1, 1, 1, 1,
1.597796, 1.632541, 0.1418724, 1, 1, 1, 1, 1,
1.598092, 1.048383, 0.5007637, 1, 1, 1, 1, 1,
1.611122, -0.7055054, 0.6106134, 1, 1, 1, 1, 1,
1.614464, -0.9879874, 1.558944, 1, 1, 1, 1, 1,
1.618834, -2.073, 4.828063, 1, 1, 1, 1, 1,
1.623049, -0.5036697, 2.458053, 1, 1, 1, 1, 1,
1.639156, 0.637299, 0.8966628, 1, 1, 1, 1, 1,
1.643914, 1.363337, 0.0662258, 1, 1, 1, 1, 1,
1.649655, -0.04804417, 2.799158, 0, 0, 1, 1, 1,
1.66059, 0.09493452, 0.3876669, 1, 0, 0, 1, 1,
1.697281, -0.1796914, 2.45352, 1, 0, 0, 1, 1,
1.70088, 0.6649774, 2.311776, 1, 0, 0, 1, 1,
1.702864, 0.3197452, 0.1542941, 1, 0, 0, 1, 1,
1.704478, -0.6337791, 1.390137, 1, 0, 0, 1, 1,
1.714223, -1.382667, 1.456859, 0, 0, 0, 1, 1,
1.720105, -0.2338925, 0.939262, 0, 0, 0, 1, 1,
1.731295, 0.700258, 1.066452, 0, 0, 0, 1, 1,
1.754948, 1.122194, 1.411961, 0, 0, 0, 1, 1,
1.760633, 0.5751321, 2.369389, 0, 0, 0, 1, 1,
1.771904, -1.908306, 2.109901, 0, 0, 0, 1, 1,
1.778448, 1.153097, 2.900479, 0, 0, 0, 1, 1,
1.779757, -0.1086127, 2.224852, 1, 1, 1, 1, 1,
1.790506, 0.386127, 0.8087601, 1, 1, 1, 1, 1,
1.798327, 0.02387026, -0.2767243, 1, 1, 1, 1, 1,
1.801685, -0.8795635, 2.167459, 1, 1, 1, 1, 1,
1.822917, -1.872237, 3.191027, 1, 1, 1, 1, 1,
1.830821, -0.4603794, 3.624219, 1, 1, 1, 1, 1,
1.838383, 0.1607514, 2.269408, 1, 1, 1, 1, 1,
1.853745, -0.5328205, 2.2274, 1, 1, 1, 1, 1,
1.856631, 0.8016922, 1.169204, 1, 1, 1, 1, 1,
1.86258, -0.09760726, 2.595839, 1, 1, 1, 1, 1,
1.862823, 0.6071107, 1.159498, 1, 1, 1, 1, 1,
1.888147, -0.5352772, 2.150428, 1, 1, 1, 1, 1,
1.893373, -0.835452, 1.763455, 1, 1, 1, 1, 1,
1.896682, 0.3820853, -0.1354701, 1, 1, 1, 1, 1,
1.92065, 1.164357, 0.2611326, 1, 1, 1, 1, 1,
1.975267, 0.1826803, 0.6283221, 0, 0, 1, 1, 1,
2.001944, -0.5686345, 0.6682032, 1, 0, 0, 1, 1,
2.018993, -1.205504, 2.210302, 1, 0, 0, 1, 1,
2.085252, -0.2053915, -1.27282, 1, 0, 0, 1, 1,
2.09352, 0.5789997, 2.432308, 1, 0, 0, 1, 1,
2.099968, 0.6166552, 0.1457828, 1, 0, 0, 1, 1,
2.113326, 0.730539, 1.45304, 0, 0, 0, 1, 1,
2.118407, 0.1707215, 1.263678, 0, 0, 0, 1, 1,
2.138863, -1.207772, 1.351648, 0, 0, 0, 1, 1,
2.158809, 0.4721366, 1.656428, 0, 0, 0, 1, 1,
2.244003, -0.4123495, 2.453863, 0, 0, 0, 1, 1,
2.261277, -1.039467, 2.112782, 0, 0, 0, 1, 1,
2.321461, -1.881202, 3.565223, 0, 0, 0, 1, 1,
2.331641, -0.4547019, 1.167323, 1, 1, 1, 1, 1,
2.48042, 0.7498493, 2.116392, 1, 1, 1, 1, 1,
2.553193, 0.4073898, 0.8634115, 1, 1, 1, 1, 1,
2.634659, -0.4250677, 2.13284, 1, 1, 1, 1, 1,
2.697185, -0.05523549, 2.345208, 1, 1, 1, 1, 1,
3.028031, -1.522171, 1.383595, 1, 1, 1, 1, 1,
3.247095, 1.67629, 2.59044, 1, 1, 1, 1, 1
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
var radius = 10.16975;
var distance = 35.72083;
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
mvMatrix.translate( 0.2811458, -0.1382792, -0.572736 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.72083);
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
