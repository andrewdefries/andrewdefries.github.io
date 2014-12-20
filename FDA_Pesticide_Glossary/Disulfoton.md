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
-3.992018, 1.529302, -2.087728, 1, 0, 0, 1,
-3.037153, -0.3271029, -2.23751, 1, 0.007843138, 0, 1,
-2.893019, 1.382816, -1.48502, 1, 0.01176471, 0, 1,
-2.735249, -1.843389, -2.804726, 1, 0.01960784, 0, 1,
-2.605683, -2.184884, -2.095701, 1, 0.02352941, 0, 1,
-2.59898, 0.9676184, -2.324826, 1, 0.03137255, 0, 1,
-2.588108, -1.305563, -2.985217, 1, 0.03529412, 0, 1,
-2.571062, -1.479258, -1.218786, 1, 0.04313726, 0, 1,
-2.440217, -0.7493273, -1.283496, 1, 0.04705882, 0, 1,
-2.345572, -0.3937353, -1.591006, 1, 0.05490196, 0, 1,
-2.250799, 0.4395792, -1.360774, 1, 0.05882353, 0, 1,
-2.23208, 1.348665, -1.89915, 1, 0.06666667, 0, 1,
-2.207883, 0.8143362, -2.60073, 1, 0.07058824, 0, 1,
-2.132744, 1.20329, -1.914815, 1, 0.07843138, 0, 1,
-2.115764, 0.8161748, -0.7094114, 1, 0.08235294, 0, 1,
-2.114977, 0.9159653, -1.484574, 1, 0.09019608, 0, 1,
-2.107329, 0.5658199, -2.004046, 1, 0.09411765, 0, 1,
-2.101201, -1.634773, -2.704634, 1, 0.1019608, 0, 1,
-2.099935, -0.1663774, -0.8461847, 1, 0.1098039, 0, 1,
-2.060554, 0.7247922, -1.054183, 1, 0.1137255, 0, 1,
-2.027247, 0.4535687, -1.490466, 1, 0.1215686, 0, 1,
-1.970626, 0.195118, -1.150915, 1, 0.1254902, 0, 1,
-1.967405, 1.020867, 0.1237527, 1, 0.1333333, 0, 1,
-1.966963, 1.752207, -0.005394298, 1, 0.1372549, 0, 1,
-1.941685, 0.723192, -0.3214935, 1, 0.145098, 0, 1,
-1.918121, -0.8091677, -2.402953, 1, 0.1490196, 0, 1,
-1.859519, -0.5058499, -4.370111, 1, 0.1568628, 0, 1,
-1.82977, 0.6698946, -1.354294, 1, 0.1607843, 0, 1,
-1.826582, -0.9289002, -2.004694, 1, 0.1686275, 0, 1,
-1.773655, 0.9511632, -1.019781, 1, 0.172549, 0, 1,
-1.757489, -0.005474939, -0.04086858, 1, 0.1803922, 0, 1,
-1.741024, 0.2711214, -0.1454045, 1, 0.1843137, 0, 1,
-1.729127, 2.850192, -2.648703, 1, 0.1921569, 0, 1,
-1.703684, -0.4527849, -0.6158625, 1, 0.1960784, 0, 1,
-1.703684, -1.31319, -2.023536, 1, 0.2039216, 0, 1,
-1.703379, -1.004823, -4.257242, 1, 0.2117647, 0, 1,
-1.651052, 0.1769844, -1.885665, 1, 0.2156863, 0, 1,
-1.649898, 0.6112718, 0.183916, 1, 0.2235294, 0, 1,
-1.636394, 0.7026231, -0.6943455, 1, 0.227451, 0, 1,
-1.634339, -2.029936, -2.426063, 1, 0.2352941, 0, 1,
-1.62216, -2.890189, -2.671753, 1, 0.2392157, 0, 1,
-1.603244, -0.6616578, -2.627634, 1, 0.2470588, 0, 1,
-1.598577, -1.685727, -1.274071, 1, 0.2509804, 0, 1,
-1.595721, 1.146411, -1.195995, 1, 0.2588235, 0, 1,
-1.577915, -0.3779917, -0.1105709, 1, 0.2627451, 0, 1,
-1.574551, -0.6337615, -3.096261, 1, 0.2705882, 0, 1,
-1.570763, -0.7844341, 0.4246861, 1, 0.2745098, 0, 1,
-1.569366, -0.6043891, -2.827303, 1, 0.282353, 0, 1,
-1.563658, -1.959292, -1.844263, 1, 0.2862745, 0, 1,
-1.560827, -0.8230582, -3.461061, 1, 0.2941177, 0, 1,
-1.553632, 0.5055696, -0.8447827, 1, 0.3019608, 0, 1,
-1.541626, -0.9911858, -1.647637, 1, 0.3058824, 0, 1,
-1.538067, 0.4193818, -2.848718, 1, 0.3137255, 0, 1,
-1.527857, -1.642556, -3.126667, 1, 0.3176471, 0, 1,
-1.523754, -0.8600134, -2.218603, 1, 0.3254902, 0, 1,
-1.51984, -0.726549, -2.972908, 1, 0.3294118, 0, 1,
-1.518824, -0.08465265, -3.428068, 1, 0.3372549, 0, 1,
-1.500013, -1.401923, -2.749452, 1, 0.3411765, 0, 1,
-1.494013, -0.2954764, -1.160235, 1, 0.3490196, 0, 1,
-1.491314, 0.7711794, -1.782044, 1, 0.3529412, 0, 1,
-1.484489, 0.198245, -1.088128, 1, 0.3607843, 0, 1,
-1.481049, -1.005335, -2.467109, 1, 0.3647059, 0, 1,
-1.478233, 0.1201245, -1.311419, 1, 0.372549, 0, 1,
-1.469999, 0.5242583, -1.732745, 1, 0.3764706, 0, 1,
-1.463119, -1.319591, -1.460764, 1, 0.3843137, 0, 1,
-1.459243, 0.2969714, 0.4597807, 1, 0.3882353, 0, 1,
-1.435416, -1.499288, -0.766968, 1, 0.3960784, 0, 1,
-1.435207, 0.4727013, -1.114664, 1, 0.4039216, 0, 1,
-1.429767, -0.1030932, -0.8443292, 1, 0.4078431, 0, 1,
-1.427882, -1.884237, -3.547092, 1, 0.4156863, 0, 1,
-1.421768, -0.08846373, 0.8239001, 1, 0.4196078, 0, 1,
-1.420017, 0.4570794, -1.785638, 1, 0.427451, 0, 1,
-1.399814, 0.2506188, -1.556246, 1, 0.4313726, 0, 1,
-1.391967, 0.3747696, -1.23034, 1, 0.4392157, 0, 1,
-1.390395, -0.7996491, -1.724013, 1, 0.4431373, 0, 1,
-1.383033, 0.6533172, -1.085477, 1, 0.4509804, 0, 1,
-1.38063, 0.7830732, -2.213758, 1, 0.454902, 0, 1,
-1.371845, -0.551016, -0.8504751, 1, 0.4627451, 0, 1,
-1.345306, -0.7815312, -2.73831, 1, 0.4666667, 0, 1,
-1.343895, -1.449671, -3.927973, 1, 0.4745098, 0, 1,
-1.339244, 0.4824602, -0.6706368, 1, 0.4784314, 0, 1,
-1.330011, -1.928226, -1.899629, 1, 0.4862745, 0, 1,
-1.311085, -0.9170294, -2.769274, 1, 0.4901961, 0, 1,
-1.310672, -0.8417938, -1.338935, 1, 0.4980392, 0, 1,
-1.306031, -1.018379, -1.577494, 1, 0.5058824, 0, 1,
-1.301749, 0.6606909, -0.7712721, 1, 0.509804, 0, 1,
-1.301184, -0.7096792, -2.130958, 1, 0.5176471, 0, 1,
-1.299582, 0.8884056, -2.216999, 1, 0.5215687, 0, 1,
-1.29869, -0.09280139, -1.088205, 1, 0.5294118, 0, 1,
-1.292374, -0.7614613, -3.915061, 1, 0.5333334, 0, 1,
-1.290486, -0.8397118, -1.977048, 1, 0.5411765, 0, 1,
-1.272684, -1.013664, -2.252948, 1, 0.5450981, 0, 1,
-1.271236, 1.0527, -0.5627691, 1, 0.5529412, 0, 1,
-1.259885, -0.1952702, -1.881576, 1, 0.5568628, 0, 1,
-1.255738, -1.562346, -3.596363, 1, 0.5647059, 0, 1,
-1.236324, 0.7597336, -1.854365, 1, 0.5686275, 0, 1,
-1.229639, 1.615384, -0.1101524, 1, 0.5764706, 0, 1,
-1.223608, 0.543227, -0.1417713, 1, 0.5803922, 0, 1,
-1.209269, -1.51905, -3.396824, 1, 0.5882353, 0, 1,
-1.185303, 0.07669045, -1.436956, 1, 0.5921569, 0, 1,
-1.180883, 1.413591, 0.3212183, 1, 0.6, 0, 1,
-1.180262, 0.8154662, -1.009856, 1, 0.6078432, 0, 1,
-1.178014, -1.064887, -1.861732, 1, 0.6117647, 0, 1,
-1.159281, -0.8419531, -2.246901, 1, 0.6196079, 0, 1,
-1.157154, -0.6424481, -2.26895, 1, 0.6235294, 0, 1,
-1.140129, -0.5901407, -1.476806, 1, 0.6313726, 0, 1,
-1.139168, -0.3839648, -2.53052, 1, 0.6352941, 0, 1,
-1.138053, -1.249774, -0.08685572, 1, 0.6431373, 0, 1,
-1.133375, 0.5488762, -1.490448, 1, 0.6470588, 0, 1,
-1.125288, -0.8017436, -1.849468, 1, 0.654902, 0, 1,
-1.119448, 1.296254, -1.524154, 1, 0.6588235, 0, 1,
-1.11132, -0.2212617, -3.054542, 1, 0.6666667, 0, 1,
-1.110576, 0.2163432, -1.058307, 1, 0.6705883, 0, 1,
-1.110089, -1.041341, -1.588655, 1, 0.6784314, 0, 1,
-1.105282, -0.7902307, -2.954771, 1, 0.682353, 0, 1,
-1.104314, -0.6147752, -2.489809, 1, 0.6901961, 0, 1,
-1.097237, 1.296016, -1.429036, 1, 0.6941177, 0, 1,
-1.096533, -0.5932761, -1.718488, 1, 0.7019608, 0, 1,
-1.096446, -0.4775684, -3.886822, 1, 0.7098039, 0, 1,
-1.093881, 0.4252239, -0.7403789, 1, 0.7137255, 0, 1,
-1.093199, 1.229109, 0.2358651, 1, 0.7215686, 0, 1,
-1.09145, 1.448052, -0.1600235, 1, 0.7254902, 0, 1,
-1.086843, -0.1255375, -3.887512, 1, 0.7333333, 0, 1,
-1.07918, -0.5399895, -2.562553, 1, 0.7372549, 0, 1,
-1.07907, -0.1180492, -1.750146, 1, 0.7450981, 0, 1,
-1.078984, -1.528829, -3.433216, 1, 0.7490196, 0, 1,
-1.076039, 0.6025769, -1.331801, 1, 0.7568628, 0, 1,
-1.070699, -1.346222, -1.451201, 1, 0.7607843, 0, 1,
-1.066538, -0.3807958, -2.683509, 1, 0.7686275, 0, 1,
-1.066221, 0.2238468, -2.42278, 1, 0.772549, 0, 1,
-1.064371, 1.110095, -1.490311, 1, 0.7803922, 0, 1,
-1.059417, -0.4626237, -1.940766, 1, 0.7843137, 0, 1,
-1.05909, 0.4391544, -0.1801631, 1, 0.7921569, 0, 1,
-1.055491, 0.8072354, -0.7815571, 1, 0.7960784, 0, 1,
-1.049592, 0.1736638, -1.632899, 1, 0.8039216, 0, 1,
-1.049009, 0.3441306, 0.5129322, 1, 0.8117647, 0, 1,
-1.041049, -0.06085954, -0.8288476, 1, 0.8156863, 0, 1,
-1.0263, 2.412208, 0.1687637, 1, 0.8235294, 0, 1,
-1.016055, -0.5347241, -1.077985, 1, 0.827451, 0, 1,
-1.012335, -1.604208, -2.116136, 1, 0.8352941, 0, 1,
-1.009833, -1.40507, -1.782314, 1, 0.8392157, 0, 1,
-1.005417, 1.315663, -1.097424, 1, 0.8470588, 0, 1,
-0.9900505, -0.8638, -2.945068, 1, 0.8509804, 0, 1,
-0.9889102, 0.1914098, -1.822748, 1, 0.8588235, 0, 1,
-0.9837285, -0.8873799, -3.276935, 1, 0.8627451, 0, 1,
-0.9744436, -1.217418, -1.231597, 1, 0.8705882, 0, 1,
-0.9698002, -0.7131922, -2.335366, 1, 0.8745098, 0, 1,
-0.9655812, -0.9060667, -1.948931, 1, 0.8823529, 0, 1,
-0.9636057, -1.923043, -3.012448, 1, 0.8862745, 0, 1,
-0.9591953, -0.4289242, -5.455381, 1, 0.8941177, 0, 1,
-0.9560704, -1.339784, -3.935795, 1, 0.8980392, 0, 1,
-0.9417974, 0.6242262, -1.130025, 1, 0.9058824, 0, 1,
-0.9307811, -0.7839684, -3.49494, 1, 0.9137255, 0, 1,
-0.9217302, -0.8118073, -2.097538, 1, 0.9176471, 0, 1,
-0.9204999, -2.293463, -0.4660414, 1, 0.9254902, 0, 1,
-0.9167536, -0.7874997, -1.431659, 1, 0.9294118, 0, 1,
-0.9166049, 0.5585144, -1.42335, 1, 0.9372549, 0, 1,
-0.9154653, -0.3900809, -1.917858, 1, 0.9411765, 0, 1,
-0.9122783, -0.8089751, -1.873932, 1, 0.9490196, 0, 1,
-0.9105609, -1.374874, -2.019339, 1, 0.9529412, 0, 1,
-0.9097146, -0.0281817, -1.878953, 1, 0.9607843, 0, 1,
-0.9071098, -0.6487057, -1.679613, 1, 0.9647059, 0, 1,
-0.9018524, -0.5857483, -2.969427, 1, 0.972549, 0, 1,
-0.8986465, -2.835224, -1.761326, 1, 0.9764706, 0, 1,
-0.896269, -0.1416315, -3.09395, 1, 0.9843137, 0, 1,
-0.8960844, -1.487103, -3.970361, 1, 0.9882353, 0, 1,
-0.8861097, -0.5540729, -1.843859, 1, 0.9960784, 0, 1,
-0.8804464, -1.069775, -1.942333, 0.9960784, 1, 0, 1,
-0.8712613, 0.8257964, -0.5424404, 0.9921569, 1, 0, 1,
-0.8673325, 2.310745, -0.9293753, 0.9843137, 1, 0, 1,
-0.8648453, -0.1084767, -1.57537, 0.9803922, 1, 0, 1,
-0.8624386, -1.120383, -0.9981664, 0.972549, 1, 0, 1,
-0.8574484, -0.6262126, -0.6375615, 0.9686275, 1, 0, 1,
-0.8522413, 0.05905747, -1.839459, 0.9607843, 1, 0, 1,
-0.842879, -2.162864, -2.272095, 0.9568627, 1, 0, 1,
-0.8423693, 0.1755099, -1.903288, 0.9490196, 1, 0, 1,
-0.8398793, -0.3653387, -1.495832, 0.945098, 1, 0, 1,
-0.8385636, 1.594412, -0.5039334, 0.9372549, 1, 0, 1,
-0.8344011, -0.1367182, -2.380612, 0.9333333, 1, 0, 1,
-0.8333243, -0.03181428, -1.165404, 0.9254902, 1, 0, 1,
-0.8328259, 1.0281, -1.222086, 0.9215686, 1, 0, 1,
-0.8311601, 2.39536, -0.7272047, 0.9137255, 1, 0, 1,
-0.830364, -0.4704314, -3.233508, 0.9098039, 1, 0, 1,
-0.8271036, -0.9270559, -2.238375, 0.9019608, 1, 0, 1,
-0.8245994, -0.07606799, 0.0005768944, 0.8941177, 1, 0, 1,
-0.8234168, -1.845214, -2.16647, 0.8901961, 1, 0, 1,
-0.8216647, 0.4532333, -1.703848, 0.8823529, 1, 0, 1,
-0.8209101, 1.583541, -0.1771038, 0.8784314, 1, 0, 1,
-0.8161196, 0.4315681, -1.848812, 0.8705882, 1, 0, 1,
-0.8156724, -0.5562191, -2.682269, 0.8666667, 1, 0, 1,
-0.8017858, -1.038326, -1.458686, 0.8588235, 1, 0, 1,
-0.8006121, -0.5450028, -2.759079, 0.854902, 1, 0, 1,
-0.7979234, 0.3263755, 0.3060773, 0.8470588, 1, 0, 1,
-0.7940515, 1.078983, -1.716274, 0.8431373, 1, 0, 1,
-0.7918476, 0.6707181, -0.2077898, 0.8352941, 1, 0, 1,
-0.7837862, -0.5640085, -4.187643, 0.8313726, 1, 0, 1,
-0.7826858, 1.660367, -1.580165, 0.8235294, 1, 0, 1,
-0.7813512, 1.240103, -0.9953493, 0.8196079, 1, 0, 1,
-0.7810944, 0.6486397, -1.489347, 0.8117647, 1, 0, 1,
-0.778461, 2.077177, -0.9926888, 0.8078431, 1, 0, 1,
-0.7664548, 0.577218, -1.691634, 0.8, 1, 0, 1,
-0.7620589, 0.8720283, 0.02812857, 0.7921569, 1, 0, 1,
-0.7588007, 0.2061804, -2.328775, 0.7882353, 1, 0, 1,
-0.7580893, -0.5788502, -2.32765, 0.7803922, 1, 0, 1,
-0.7546674, 0.1307445, -2.815653, 0.7764706, 1, 0, 1,
-0.7504994, 0.5868101, -1.850304, 0.7686275, 1, 0, 1,
-0.7477745, 0.2803456, -1.613607, 0.7647059, 1, 0, 1,
-0.7471844, -1.26543, -3.946361, 0.7568628, 1, 0, 1,
-0.7453017, -0.04675457, -1.927645, 0.7529412, 1, 0, 1,
-0.7323699, -1.916364, -3.956842, 0.7450981, 1, 0, 1,
-0.7278606, -1.282656, -2.207152, 0.7411765, 1, 0, 1,
-0.7265106, -1.157565, -3.122657, 0.7333333, 1, 0, 1,
-0.7228297, 1.653158, 0.2725427, 0.7294118, 1, 0, 1,
-0.7182977, 0.4288886, -1.074651, 0.7215686, 1, 0, 1,
-0.7182934, 0.2758648, -1.481476, 0.7176471, 1, 0, 1,
-0.7174823, -0.1661296, -0.02046772, 0.7098039, 1, 0, 1,
-0.7158879, 0.4221361, 0.6683857, 0.7058824, 1, 0, 1,
-0.7120367, 0.8771047, -0.7554564, 0.6980392, 1, 0, 1,
-0.7109131, -0.9103985, -2.611292, 0.6901961, 1, 0, 1,
-0.709631, -1.157454, -3.304678, 0.6862745, 1, 0, 1,
-0.7079648, 1.589333, 1.237892, 0.6784314, 1, 0, 1,
-0.707814, 1.599161, -2.692084, 0.6745098, 1, 0, 1,
-0.7056356, -1.500202, -3.562026, 0.6666667, 1, 0, 1,
-0.7047575, -0.2174569, -1.15279, 0.6627451, 1, 0, 1,
-0.7030005, -1.095763, -0.8702399, 0.654902, 1, 0, 1,
-0.69914, -0.8056572, -3.672509, 0.6509804, 1, 0, 1,
-0.6951129, 0.376175, -1.85302, 0.6431373, 1, 0, 1,
-0.6871124, 0.3507016, -0.7526355, 0.6392157, 1, 0, 1,
-0.6850513, -0.2976354, -0.3857813, 0.6313726, 1, 0, 1,
-0.6830225, 1.624776, -1.245687, 0.627451, 1, 0, 1,
-0.6827224, -0.4823899, -2.682022, 0.6196079, 1, 0, 1,
-0.6779816, -0.7666718, -4.428094, 0.6156863, 1, 0, 1,
-0.6760981, -0.4058248, -3.303636, 0.6078432, 1, 0, 1,
-0.6680412, -0.4233751, -1.573323, 0.6039216, 1, 0, 1,
-0.6671268, 0.1161857, -0.6269988, 0.5960785, 1, 0, 1,
-0.6669679, -0.448893, -2.362332, 0.5882353, 1, 0, 1,
-0.6605757, -0.389697, -1.951085, 0.5843138, 1, 0, 1,
-0.6593388, -1.329345, -2.498196, 0.5764706, 1, 0, 1,
-0.6588287, 0.2360653, -0.8696269, 0.572549, 1, 0, 1,
-0.6537851, 0.6552235, 0.2213151, 0.5647059, 1, 0, 1,
-0.6529003, -0.2482485, -0.8169373, 0.5607843, 1, 0, 1,
-0.649677, 0.7703156, -0.5639319, 0.5529412, 1, 0, 1,
-0.6487308, 0.5525698, -1.373048, 0.5490196, 1, 0, 1,
-0.6485572, -0.8736654, -1.277305, 0.5411765, 1, 0, 1,
-0.6467715, -0.4614644, -2.816624, 0.5372549, 1, 0, 1,
-0.6401628, 0.2965184, -1.057137, 0.5294118, 1, 0, 1,
-0.6365776, -0.3904768, -2.27636, 0.5254902, 1, 0, 1,
-0.6350363, -0.08505128, -1.230748, 0.5176471, 1, 0, 1,
-0.6267189, -0.2019012, -0.9803365, 0.5137255, 1, 0, 1,
-0.6233532, 0.4104169, 0.140612, 0.5058824, 1, 0, 1,
-0.620629, -1.581199, -2.84074, 0.5019608, 1, 0, 1,
-0.6145008, 1.048758, -0.705806, 0.4941176, 1, 0, 1,
-0.6073105, 0.2521817, -1.131303, 0.4862745, 1, 0, 1,
-0.6060832, -1.097519, -3.933543, 0.4823529, 1, 0, 1,
-0.6048642, 0.1544259, -1.94489, 0.4745098, 1, 0, 1,
-0.6028595, -0.7248319, -0.8332077, 0.4705882, 1, 0, 1,
-0.6006606, 0.7341544, 0.1115186, 0.4627451, 1, 0, 1,
-0.5987546, -0.6107906, -2.211833, 0.4588235, 1, 0, 1,
-0.5976647, 0.4120705, 0.04741283, 0.4509804, 1, 0, 1,
-0.5955254, 0.8825291, -0.8262395, 0.4470588, 1, 0, 1,
-0.5927669, 0.8160379, -0.5552424, 0.4392157, 1, 0, 1,
-0.5922803, 0.1714351, -0.9270368, 0.4352941, 1, 0, 1,
-0.5899097, 0.962922, 1.052383, 0.427451, 1, 0, 1,
-0.5886053, 0.9604765, -1.540572, 0.4235294, 1, 0, 1,
-0.5879146, -0.2247736, -2.797825, 0.4156863, 1, 0, 1,
-0.5873867, -1.440043, -3.347139, 0.4117647, 1, 0, 1,
-0.5831209, -0.1162524, -1.636417, 0.4039216, 1, 0, 1,
-0.5813603, 1.026678, -0.5799437, 0.3960784, 1, 0, 1,
-0.5811189, 0.5074412, -0.04425073, 0.3921569, 1, 0, 1,
-0.5786871, 0.3776556, -0.9806527, 0.3843137, 1, 0, 1,
-0.5781808, 0.445385, -0.9421538, 0.3803922, 1, 0, 1,
-0.5753405, -0.6802762, -2.809458, 0.372549, 1, 0, 1,
-0.5749947, 0.5771074, -2.279873, 0.3686275, 1, 0, 1,
-0.5692714, 0.5426528, -0.06925297, 0.3607843, 1, 0, 1,
-0.5672987, -2.508379, -1.04488, 0.3568628, 1, 0, 1,
-0.5599511, 2.450454, 0.7930117, 0.3490196, 1, 0, 1,
-0.5527577, 0.999792, -2.034259, 0.345098, 1, 0, 1,
-0.5515061, 0.544539, -1.607273, 0.3372549, 1, 0, 1,
-0.547147, -0.7518851, -2.975611, 0.3333333, 1, 0, 1,
-0.5461479, -0.2376591, -1.89611, 0.3254902, 1, 0, 1,
-0.5430831, 0.2610136, -2.615149, 0.3215686, 1, 0, 1,
-0.5426414, 0.9893171, -0.4172685, 0.3137255, 1, 0, 1,
-0.5404814, 1.83329, 0.1536079, 0.3098039, 1, 0, 1,
-0.5370638, 0.2771284, -2.615384, 0.3019608, 1, 0, 1,
-0.5333478, -0.2944937, -0.9709721, 0.2941177, 1, 0, 1,
-0.5284149, -0.1470734, -1.94958, 0.2901961, 1, 0, 1,
-0.5248327, -0.3378347, -1.581594, 0.282353, 1, 0, 1,
-0.520556, 0.9141943, -1.997357, 0.2784314, 1, 0, 1,
-0.5173153, 1.533322, -1.589674, 0.2705882, 1, 0, 1,
-0.5098411, -1.021108, -1.774236, 0.2666667, 1, 0, 1,
-0.5052687, -0.1080929, -1.129012, 0.2588235, 1, 0, 1,
-0.4970259, 0.1554805, -0.6886224, 0.254902, 1, 0, 1,
-0.4929062, -1.332068, -1.586792, 0.2470588, 1, 0, 1,
-0.4903175, 0.6453978, 0.3545319, 0.2431373, 1, 0, 1,
-0.4888967, -1.194863, -5.315656, 0.2352941, 1, 0, 1,
-0.4866499, 3.287701, -2.000608, 0.2313726, 1, 0, 1,
-0.4787277, 0.9137068, -1.500873, 0.2235294, 1, 0, 1,
-0.4773569, 0.1448201, -2.442148, 0.2196078, 1, 0, 1,
-0.4770184, 1.201902, 0.2957126, 0.2117647, 1, 0, 1,
-0.4738379, -1.391935, -2.129636, 0.2078431, 1, 0, 1,
-0.4731207, 0.1119483, -0.5434191, 0.2, 1, 0, 1,
-0.4712239, -0.1917177, -1.481788, 0.1921569, 1, 0, 1,
-0.4694509, -0.1249539, -1.555499, 0.1882353, 1, 0, 1,
-0.4681556, -0.5134416, -3.189125, 0.1803922, 1, 0, 1,
-0.4625686, -0.03842638, -0.4315736, 0.1764706, 1, 0, 1,
-0.4612068, 0.04805311, -1.768029, 0.1686275, 1, 0, 1,
-0.459259, 0.8855268, 0.1880394, 0.1647059, 1, 0, 1,
-0.4539531, 0.8188291, 0.3141529, 0.1568628, 1, 0, 1,
-0.4520582, 1.532428, 1.385398, 0.1529412, 1, 0, 1,
-0.4519763, 1.012229, 0.3121125, 0.145098, 1, 0, 1,
-0.4519185, 0.5681651, -2.973492, 0.1411765, 1, 0, 1,
-0.4427223, 2.12691, -0.8596109, 0.1333333, 1, 0, 1,
-0.4389165, -0.632071, -2.751235, 0.1294118, 1, 0, 1,
-0.4376202, 0.3141809, -0.1127054, 0.1215686, 1, 0, 1,
-0.434506, 0.3409517, -2.120876, 0.1176471, 1, 0, 1,
-0.425063, 0.2205252, -1.430186, 0.1098039, 1, 0, 1,
-0.4248559, -0.5415962, -3.417745, 0.1058824, 1, 0, 1,
-0.4239549, 0.9291557, -1.019594, 0.09803922, 1, 0, 1,
-0.4223859, -0.2313688, -2.625914, 0.09019608, 1, 0, 1,
-0.4210295, -0.5244831, -3.616759, 0.08627451, 1, 0, 1,
-0.4193247, 1.5929, -0.3961043, 0.07843138, 1, 0, 1,
-0.4180183, -0.200507, -2.575418, 0.07450981, 1, 0, 1,
-0.4178177, -0.3188629, -1.283463, 0.06666667, 1, 0, 1,
-0.4170816, -0.1404616, -2.288735, 0.0627451, 1, 0, 1,
-0.416997, -0.4255852, -1.086284, 0.05490196, 1, 0, 1,
-0.4164925, 0.5192555, -1.007254, 0.05098039, 1, 0, 1,
-0.4124505, -0.5963357, -4.088802, 0.04313726, 1, 0, 1,
-0.4071835, 0.7635653, -1.496884, 0.03921569, 1, 0, 1,
-0.4067562, 1.361628, 0.6206127, 0.03137255, 1, 0, 1,
-0.4043306, -0.3590454, -2.20034, 0.02745098, 1, 0, 1,
-0.4023169, 0.02858257, -2.007917, 0.01960784, 1, 0, 1,
-0.3989902, 0.1987625, -1.676111, 0.01568628, 1, 0, 1,
-0.3962302, 0.5267503, 0.91516, 0.007843138, 1, 0, 1,
-0.3950823, 0.8001959, -2.169314, 0.003921569, 1, 0, 1,
-0.3902928, 2.697737, -0.03588843, 0, 1, 0.003921569, 1,
-0.3852526, -0.3634582, -0.8376969, 0, 1, 0.01176471, 1,
-0.3852407, -0.818245, -1.710011, 0, 1, 0.01568628, 1,
-0.3767625, 1.261865, 0.5464774, 0, 1, 0.02352941, 1,
-0.371882, -0.6333164, -1.313845, 0, 1, 0.02745098, 1,
-0.371636, -1.127384, -4.080207, 0, 1, 0.03529412, 1,
-0.371549, 0.3677713, 1.244584, 0, 1, 0.03921569, 1,
-0.370035, -2.13639, -3.810636, 0, 1, 0.04705882, 1,
-0.3673263, 1.628668, -0.1585369, 0, 1, 0.05098039, 1,
-0.361892, -0.6372138, -2.435394, 0, 1, 0.05882353, 1,
-0.3604265, 0.8284125, -0.02016318, 0, 1, 0.0627451, 1,
-0.3528618, 1.054229, 0.9093502, 0, 1, 0.07058824, 1,
-0.351073, -0.05167396, -1.368824, 0, 1, 0.07450981, 1,
-0.3488804, -0.3553671, -0.8594108, 0, 1, 0.08235294, 1,
-0.3443395, -0.1108246, -2.464573, 0, 1, 0.08627451, 1,
-0.3334004, -0.03622536, -0.9719483, 0, 1, 0.09411765, 1,
-0.3289053, 0.07786606, -0.6947308, 0, 1, 0.1019608, 1,
-0.325546, -0.002497544, -1.206757, 0, 1, 0.1058824, 1,
-0.3232848, 0.5213826, -2.355647, 0, 1, 0.1137255, 1,
-0.323158, 0.2903017, -1.506915, 0, 1, 0.1176471, 1,
-0.3201914, -0.04511639, -0.5401281, 0, 1, 0.1254902, 1,
-0.3187099, 1.627552, -2.602257, 0, 1, 0.1294118, 1,
-0.317289, -0.7441963, -4.16264, 0, 1, 0.1372549, 1,
-0.3165435, 0.3131979, -2.017474, 0, 1, 0.1411765, 1,
-0.3075141, 1.001972, -1.226043, 0, 1, 0.1490196, 1,
-0.2976889, -0.5310969, -1.900229, 0, 1, 0.1529412, 1,
-0.2974196, 0.57917, 0.4841844, 0, 1, 0.1607843, 1,
-0.2935444, 0.4606357, -0.6136887, 0, 1, 0.1647059, 1,
-0.2925928, 0.9226249, -2.047724, 0, 1, 0.172549, 1,
-0.2890416, 1.434773, 1.518641, 0, 1, 0.1764706, 1,
-0.2885317, 0.762855, -1.898517, 0, 1, 0.1843137, 1,
-0.2816468, -0.3645963, -2.350449, 0, 1, 0.1882353, 1,
-0.2795019, -1.352578, -2.424976, 0, 1, 0.1960784, 1,
-0.2794305, -0.8520978, -2.712043, 0, 1, 0.2039216, 1,
-0.2705342, -1.533208, -2.694133, 0, 1, 0.2078431, 1,
-0.2673461, 0.4774655, -0.6753023, 0, 1, 0.2156863, 1,
-0.2609581, -1.547311, -2.84888, 0, 1, 0.2196078, 1,
-0.258331, -0.8437995, -2.017333, 0, 1, 0.227451, 1,
-0.2497858, -0.4309858, -2.605754, 0, 1, 0.2313726, 1,
-0.2431113, -0.1193142, -2.119209, 0, 1, 0.2392157, 1,
-0.2417115, -0.1106931, -1.695121, 0, 1, 0.2431373, 1,
-0.2401934, -0.02851545, -2.820659, 0, 1, 0.2509804, 1,
-0.2360486, 0.6451892, -0.2233614, 0, 1, 0.254902, 1,
-0.2340682, -0.6812225, -2.672659, 0, 1, 0.2627451, 1,
-0.2290052, -1.147127, -3.533808, 0, 1, 0.2666667, 1,
-0.2278048, 1.722929, -0.8667402, 0, 1, 0.2745098, 1,
-0.2274327, 2.805708, 0.6860109, 0, 1, 0.2784314, 1,
-0.2209926, -0.08215196, -2.975732, 0, 1, 0.2862745, 1,
-0.2202495, -0.9278589, -5.165731, 0, 1, 0.2901961, 1,
-0.2153711, -1.433166, -2.992456, 0, 1, 0.2980392, 1,
-0.2139922, 0.2793555, 1.425862, 0, 1, 0.3058824, 1,
-0.2119137, -1.701998, -3.808923, 0, 1, 0.3098039, 1,
-0.2095574, 0.3397494, -1.52904, 0, 1, 0.3176471, 1,
-0.2077684, -0.1646079, -2.154003, 0, 1, 0.3215686, 1,
-0.2064772, 0.1722551, -0.5195183, 0, 1, 0.3294118, 1,
-0.2058413, -1.006666, -2.846607, 0, 1, 0.3333333, 1,
-0.2030714, 0.1970434, -0.103921, 0, 1, 0.3411765, 1,
-0.2023631, 1.450066, 0.4202398, 0, 1, 0.345098, 1,
-0.2004196, 0.4063886, -0.08751371, 0, 1, 0.3529412, 1,
-0.1962419, 0.6885163, -2.180419, 0, 1, 0.3568628, 1,
-0.1959225, -1.362807, -2.364197, 0, 1, 0.3647059, 1,
-0.1950746, -0.2320455, -2.225549, 0, 1, 0.3686275, 1,
-0.1934244, -0.06316762, -1.060112, 0, 1, 0.3764706, 1,
-0.1906291, 0.4912283, -0.1772945, 0, 1, 0.3803922, 1,
-0.1891163, -0.9432054, -1.846248, 0, 1, 0.3882353, 1,
-0.1887353, -0.3091344, -3.460688, 0, 1, 0.3921569, 1,
-0.1874114, -0.5019805, -3.409079, 0, 1, 0.4, 1,
-0.1870567, 0.9331646, 1.514731, 0, 1, 0.4078431, 1,
-0.1865447, -1.41181, -3.600868, 0, 1, 0.4117647, 1,
-0.1864027, -0.9860558, -4.915208, 0, 1, 0.4196078, 1,
-0.1808547, 0.4274079, 0.1163849, 0, 1, 0.4235294, 1,
-0.1806539, -1.585942, -3.042957, 0, 1, 0.4313726, 1,
-0.1795371, 0.6604422, -0.5218858, 0, 1, 0.4352941, 1,
-0.1792596, 0.01596916, -1.835274, 0, 1, 0.4431373, 1,
-0.1773765, -0.4559591, -3.244095, 0, 1, 0.4470588, 1,
-0.1768061, 1.334867, 1.809413, 0, 1, 0.454902, 1,
-0.173097, 1.097834, -0.5804117, 0, 1, 0.4588235, 1,
-0.1715814, 0.02236056, -1.560542, 0, 1, 0.4666667, 1,
-0.1713683, -0.4263354, -2.408082, 0, 1, 0.4705882, 1,
-0.1704877, 0.4139911, -0.6256276, 0, 1, 0.4784314, 1,
-0.169578, 0.2393261, 0.1094278, 0, 1, 0.4823529, 1,
-0.1690026, -1.083345, -2.162381, 0, 1, 0.4901961, 1,
-0.1666628, -0.9005365, -2.991373, 0, 1, 0.4941176, 1,
-0.1663227, -0.8162994, -2.912792, 0, 1, 0.5019608, 1,
-0.1618171, 0.09338839, -0.891977, 0, 1, 0.509804, 1,
-0.1597439, 0.7301825, -2.409897, 0, 1, 0.5137255, 1,
-0.1566156, 0.5744777, 1.558821, 0, 1, 0.5215687, 1,
-0.1552853, -0.6343, -2.200547, 0, 1, 0.5254902, 1,
-0.1551201, -1.59401, -3.257983, 0, 1, 0.5333334, 1,
-0.1507291, -0.3776422, -4.820934, 0, 1, 0.5372549, 1,
-0.147334, -0.6538734, -2.95421, 0, 1, 0.5450981, 1,
-0.1469776, -0.117266, -2.299424, 0, 1, 0.5490196, 1,
-0.1453687, 2.54658, -1.024543, 0, 1, 0.5568628, 1,
-0.1382555, -0.07429609, -2.834543, 0, 1, 0.5607843, 1,
-0.1359404, 0.3763654, -1.257949, 0, 1, 0.5686275, 1,
-0.1335582, 0.6246325, 0.4859731, 0, 1, 0.572549, 1,
-0.1324765, 0.9082687, -0.6633369, 0, 1, 0.5803922, 1,
-0.1321552, 0.4294343, -0.5530471, 0, 1, 0.5843138, 1,
-0.1300955, 0.7007267, -0.4031871, 0, 1, 0.5921569, 1,
-0.1298704, 1.623628, -1.611786, 0, 1, 0.5960785, 1,
-0.1281018, 0.7583196, 0.9722223, 0, 1, 0.6039216, 1,
-0.1266819, -0.2542263, -3.169092, 0, 1, 0.6117647, 1,
-0.1250284, -0.9801911, -3.475244, 0, 1, 0.6156863, 1,
-0.1248332, 0.3616395, 0.8014559, 0, 1, 0.6235294, 1,
-0.1245064, 0.2616575, -1.570414, 0, 1, 0.627451, 1,
-0.1219022, 1.131688, 1.073052, 0, 1, 0.6352941, 1,
-0.1193604, 1.644341, -1.703792, 0, 1, 0.6392157, 1,
-0.1170222, -1.204315, -3.19151, 0, 1, 0.6470588, 1,
-0.1102038, 2.284507, 0.1639539, 0, 1, 0.6509804, 1,
-0.1091833, -1.482312, -3.918981, 0, 1, 0.6588235, 1,
-0.1055562, -0.7807176, -2.700801, 0, 1, 0.6627451, 1,
-0.1037305, 0.7497901, 1.538773, 0, 1, 0.6705883, 1,
-0.1025383, 1.874494, 0.1969104, 0, 1, 0.6745098, 1,
-0.1024873, 1.148489, 0.7816249, 0, 1, 0.682353, 1,
-0.0945613, 0.4678188, 0.009502139, 0, 1, 0.6862745, 1,
-0.09334185, -1.850782, -1.18853, 0, 1, 0.6941177, 1,
-0.09049658, -0.560822, -2.547523, 0, 1, 0.7019608, 1,
-0.08914686, 0.701322, 0.2733696, 0, 1, 0.7058824, 1,
-0.08590335, 0.06918549, -0.4447415, 0, 1, 0.7137255, 1,
-0.08005369, 1.106612, 0.3294805, 0, 1, 0.7176471, 1,
-0.0797899, -0.4196988, -3.646503, 0, 1, 0.7254902, 1,
-0.07763837, 0.3252762, -0.6902451, 0, 1, 0.7294118, 1,
-0.07708224, 0.8305035, 0.003322504, 0, 1, 0.7372549, 1,
-0.07616819, -0.8672221, -2.781953, 0, 1, 0.7411765, 1,
-0.0725334, -1.103711, -4.160121, 0, 1, 0.7490196, 1,
-0.07209168, -1.198735, -3.913186, 0, 1, 0.7529412, 1,
-0.07020953, 0.3546567, -1.714716, 0, 1, 0.7607843, 1,
-0.06857515, 0.07465911, 1.80958, 0, 1, 0.7647059, 1,
-0.06658311, -0.3638814, -3.059869, 0, 1, 0.772549, 1,
-0.06651645, 1.020393, -1.800889, 0, 1, 0.7764706, 1,
-0.06535648, -1.145366, -2.560967, 0, 1, 0.7843137, 1,
-0.06410043, -0.05881926, -1.114904, 0, 1, 0.7882353, 1,
-0.06267202, -1.481671, -3.460724, 0, 1, 0.7960784, 1,
-0.06204868, 1.262383, 0.01064926, 0, 1, 0.8039216, 1,
-0.06159399, -2.211548, -1.848743, 0, 1, 0.8078431, 1,
-0.05990757, 0.1442196, -0.6283954, 0, 1, 0.8156863, 1,
-0.05759116, 2.995091, -0.4736597, 0, 1, 0.8196079, 1,
-0.05756994, 1.741942, 0.9007253, 0, 1, 0.827451, 1,
-0.05391595, 0.2053833, -0.8291048, 0, 1, 0.8313726, 1,
-0.04844607, -0.6488257, -2.616107, 0, 1, 0.8392157, 1,
-0.04791849, -0.3612384, -2.220296, 0, 1, 0.8431373, 1,
-0.04249329, -1.179961, -1.198334, 0, 1, 0.8509804, 1,
-0.03972417, -0.1176842, -4.272562, 0, 1, 0.854902, 1,
-0.03857537, 1.139473, -0.04735696, 0, 1, 0.8627451, 1,
-0.03556227, 1.051788, 0.8413164, 0, 1, 0.8666667, 1,
-0.0340829, 1.653179, -0.5107938, 0, 1, 0.8745098, 1,
-0.03006448, -1.092043, -4.040544, 0, 1, 0.8784314, 1,
-0.02927111, -0.1968103, -3.552473, 0, 1, 0.8862745, 1,
-0.02795039, 1.067241, 0.1932017, 0, 1, 0.8901961, 1,
-0.02330252, -1.24025, -4.01878, 0, 1, 0.8980392, 1,
-0.02297671, -0.2855113, -1.918361, 0, 1, 0.9058824, 1,
-0.01271792, 0.9447562, 0.631181, 0, 1, 0.9098039, 1,
-0.01071688, 0.8792936, -0.05565075, 0, 1, 0.9176471, 1,
-0.008649679, -1.721659, -1.451008, 0, 1, 0.9215686, 1,
-0.005644465, 1.370889, -0.8850176, 0, 1, 0.9294118, 1,
-0.001811347, 0.9629979, -0.7598389, 0, 1, 0.9333333, 1,
-0.0007121065, 0.04970394, -0.8315909, 0, 1, 0.9411765, 1,
0.0002541467, 1.035966, -0.1554111, 0, 1, 0.945098, 1,
0.0003755066, -0.9507625, 4.126379, 0, 1, 0.9529412, 1,
0.001128684, -0.4090458, 2.70875, 0, 1, 0.9568627, 1,
0.001983847, 1.335951, -0.391695, 0, 1, 0.9647059, 1,
0.004982671, 0.6638287, 2.086714, 0, 1, 0.9686275, 1,
0.008581261, -0.5292819, 3.495208, 0, 1, 0.9764706, 1,
0.01264022, -1.201007, 3.210099, 0, 1, 0.9803922, 1,
0.01416654, -0.03070194, 2.704463, 0, 1, 0.9882353, 1,
0.0162875, 1.592762, -0.06109143, 0, 1, 0.9921569, 1,
0.03356347, 0.6706423, 2.071698, 0, 1, 1, 1,
0.03400638, 1.167656, 1.82346, 0, 0.9921569, 1, 1,
0.034213, -0.1791818, 4.271252, 0, 0.9882353, 1, 1,
0.03628429, 0.3585925, -0.1654589, 0, 0.9803922, 1, 1,
0.03648017, 0.6595053, -1.011435, 0, 0.9764706, 1, 1,
0.04075376, 0.7032643, -0.4546064, 0, 0.9686275, 1, 1,
0.04210166, -0.1968474, 2.720217, 0, 0.9647059, 1, 1,
0.04470441, -0.9779844, 3.626526, 0, 0.9568627, 1, 1,
0.0457843, 1.273301, 0.7105085, 0, 0.9529412, 1, 1,
0.05165843, 0.4151766, 1.139975, 0, 0.945098, 1, 1,
0.0527516, 0.235142, -0.03239788, 0, 0.9411765, 1, 1,
0.05307779, -0.3660614, 3.038892, 0, 0.9333333, 1, 1,
0.05406273, -1.807948, 3.0514, 0, 0.9294118, 1, 1,
0.05546035, -0.8965369, 2.431416, 0, 0.9215686, 1, 1,
0.05617023, -0.3776397, 3.977757, 0, 0.9176471, 1, 1,
0.05945243, 1.392752, 1.159718, 0, 0.9098039, 1, 1,
0.06137106, 0.3810115, 0.5041475, 0, 0.9058824, 1, 1,
0.06290862, 0.3608501, -0.6088398, 0, 0.8980392, 1, 1,
0.06883954, 0.6378562, -1.938183, 0, 0.8901961, 1, 1,
0.0702666, 1.147528, 0.2825713, 0, 0.8862745, 1, 1,
0.07028437, -1.183617, 4.246347, 0, 0.8784314, 1, 1,
0.07325357, -0.4559142, 1.103965, 0, 0.8745098, 1, 1,
0.07577308, 0.5203169, -0.3280448, 0, 0.8666667, 1, 1,
0.07887159, -0.674633, 3.769015, 0, 0.8627451, 1, 1,
0.08118596, -0.2010359, 3.89501, 0, 0.854902, 1, 1,
0.08293781, 0.6651309, -0.4534415, 0, 0.8509804, 1, 1,
0.08706022, -0.4196288, 2.723093, 0, 0.8431373, 1, 1,
0.08758148, 0.9129759, -1.079884, 0, 0.8392157, 1, 1,
0.08940718, 1.92478, -0.7962088, 0, 0.8313726, 1, 1,
0.09468108, -0.6099385, 1.897732, 0, 0.827451, 1, 1,
0.09751453, 0.2136776, -0.5098325, 0, 0.8196079, 1, 1,
0.0983238, -0.5122119, 2.405826, 0, 0.8156863, 1, 1,
0.1013735, -1.594549, 2.281529, 0, 0.8078431, 1, 1,
0.102289, -0.5615329, 3.051775, 0, 0.8039216, 1, 1,
0.1153738, -1.444337, 3.460761, 0, 0.7960784, 1, 1,
0.1162261, -0.288397, 2.943568, 0, 0.7882353, 1, 1,
0.1162347, 1.907071, -0.6086074, 0, 0.7843137, 1, 1,
0.119977, 1.095512, 0.565896, 0, 0.7764706, 1, 1,
0.1205166, -0.7814122, 1.863105, 0, 0.772549, 1, 1,
0.1246766, -0.2382902, 2.215133, 0, 0.7647059, 1, 1,
0.1306698, 0.4078824, -1.116538, 0, 0.7607843, 1, 1,
0.1334885, 2.098382, -0.5446528, 0, 0.7529412, 1, 1,
0.1360688, -1.369136, 4.04611, 0, 0.7490196, 1, 1,
0.1391814, -0.2742581, 1.065062, 0, 0.7411765, 1, 1,
0.1409957, 0.7967406, -0.3282061, 0, 0.7372549, 1, 1,
0.142434, -0.8864102, 2.157933, 0, 0.7294118, 1, 1,
0.1453945, -0.06685932, 3.375083, 0, 0.7254902, 1, 1,
0.1476532, -1.156289, 3.88753, 0, 0.7176471, 1, 1,
0.1523671, -0.4715404, 2.203458, 0, 0.7137255, 1, 1,
0.1555634, 0.9474167, -0.574857, 0, 0.7058824, 1, 1,
0.1560646, 3.042902, 1.978541, 0, 0.6980392, 1, 1,
0.164158, 1.185132, 0.411269, 0, 0.6941177, 1, 1,
0.1655575, 0.8462688, -0.7020637, 0, 0.6862745, 1, 1,
0.1656403, -1.356184, 2.489538, 0, 0.682353, 1, 1,
0.1731262, -0.1370938, 3.535093, 0, 0.6745098, 1, 1,
0.1742763, 0.3792231, 0.2104557, 0, 0.6705883, 1, 1,
0.178301, -0.9727645, 4.313629, 0, 0.6627451, 1, 1,
0.1828256, 0.183605, 2.788288, 0, 0.6588235, 1, 1,
0.1828588, -0.02628911, 2.373011, 0, 0.6509804, 1, 1,
0.1881378, 1.498991, 0.06631114, 0, 0.6470588, 1, 1,
0.190979, -1.023788, 3.02408, 0, 0.6392157, 1, 1,
0.1926084, 1.089632, 1.015508, 0, 0.6352941, 1, 1,
0.1927107, -0.5369993, 4.790452, 0, 0.627451, 1, 1,
0.2020302, -2.203478, 3.558325, 0, 0.6235294, 1, 1,
0.2061909, 0.9470649, -0.1974134, 0, 0.6156863, 1, 1,
0.2109604, 0.2917768, 1.226022, 0, 0.6117647, 1, 1,
0.213069, -1.070135, 2.688838, 0, 0.6039216, 1, 1,
0.2140798, -0.6860708, 4.32162, 0, 0.5960785, 1, 1,
0.2156343, -0.1259113, 2.964886, 0, 0.5921569, 1, 1,
0.2165758, -0.2679488, 2.205156, 0, 0.5843138, 1, 1,
0.2188, -1.992084, 2.52624, 0, 0.5803922, 1, 1,
0.2193074, -1.458546, 4.857927, 0, 0.572549, 1, 1,
0.2202414, -0.3357958, 3.860504, 0, 0.5686275, 1, 1,
0.2218643, -1.458539, 5.925215, 0, 0.5607843, 1, 1,
0.2232424, 1.264529, 0.6410492, 0, 0.5568628, 1, 1,
0.2253498, -0.4956497, 3.694827, 0, 0.5490196, 1, 1,
0.2272983, -0.7795246, 1.00201, 0, 0.5450981, 1, 1,
0.2312022, -0.7865183, 2.465653, 0, 0.5372549, 1, 1,
0.2349814, 0.1930525, 1.535559, 0, 0.5333334, 1, 1,
0.2350353, 0.2252606, 1.128101, 0, 0.5254902, 1, 1,
0.2359302, -0.9296616, 2.980084, 0, 0.5215687, 1, 1,
0.2370216, -0.1851063, 2.270447, 0, 0.5137255, 1, 1,
0.2450472, 1.977227, 0.4289983, 0, 0.509804, 1, 1,
0.2450808, -0.2320995, 1.411521, 0, 0.5019608, 1, 1,
0.2460496, 1.816827, -0.1130655, 0, 0.4941176, 1, 1,
0.2518278, 0.9098673, 0.027711, 0, 0.4901961, 1, 1,
0.2551654, -0.4018373, 2.537069, 0, 0.4823529, 1, 1,
0.2575712, -0.9122358, 1.674908, 0, 0.4784314, 1, 1,
0.2608681, -2.526972, 4.499677, 0, 0.4705882, 1, 1,
0.2624662, 0.4414955, 0.2064877, 0, 0.4666667, 1, 1,
0.2664282, 0.3680995, 1.412317, 0, 0.4588235, 1, 1,
0.266544, 0.8095554, 1.953142, 0, 0.454902, 1, 1,
0.2757121, 1.49673, 1.530521, 0, 0.4470588, 1, 1,
0.2764572, -1.883205, 4.400552, 0, 0.4431373, 1, 1,
0.2783778, -1.456354, 3.157562, 0, 0.4352941, 1, 1,
0.2816926, -0.8067677, 3.472444, 0, 0.4313726, 1, 1,
0.2829564, 0.1374581, 2.647745, 0, 0.4235294, 1, 1,
0.2845809, 1.089263, 1.077056, 0, 0.4196078, 1, 1,
0.2849379, 0.5912876, 0.7725682, 0, 0.4117647, 1, 1,
0.2863411, 1.241396, -1.099442, 0, 0.4078431, 1, 1,
0.2884881, -0.5815346, 2.264585, 0, 0.4, 1, 1,
0.2917093, -1.584617, 2.636737, 0, 0.3921569, 1, 1,
0.2921274, -0.7310546, 4.691459, 0, 0.3882353, 1, 1,
0.2936723, 0.9643981, -0.7662373, 0, 0.3803922, 1, 1,
0.2941351, 0.06316457, 2.179764, 0, 0.3764706, 1, 1,
0.2955844, 1.80293, 0.3141581, 0, 0.3686275, 1, 1,
0.2972583, -0.169184, 2.99809, 0, 0.3647059, 1, 1,
0.3029259, 0.2676414, 1.743106, 0, 0.3568628, 1, 1,
0.3077982, 2.038808, 0.5181959, 0, 0.3529412, 1, 1,
0.3150772, -0.4311696, 3.623066, 0, 0.345098, 1, 1,
0.3194318, 0.8966691, 0.1016823, 0, 0.3411765, 1, 1,
0.3224029, 1.303994, -1.556959, 0, 0.3333333, 1, 1,
0.3228369, -0.4040323, 2.884923, 0, 0.3294118, 1, 1,
0.3242193, 1.20217, 0.09912538, 0, 0.3215686, 1, 1,
0.3292131, 0.5390931, 2.668615, 0, 0.3176471, 1, 1,
0.3317039, -0.2362063, 2.267486, 0, 0.3098039, 1, 1,
0.3335145, -0.5220715, 3.266568, 0, 0.3058824, 1, 1,
0.3372357, 1.041412, 1.008125, 0, 0.2980392, 1, 1,
0.340698, -0.06048191, 2.789203, 0, 0.2901961, 1, 1,
0.3412097, -0.6367506, 2.420826, 0, 0.2862745, 1, 1,
0.3444278, 1.728788, 0.7674056, 0, 0.2784314, 1, 1,
0.3483983, 0.1886041, 0.8466263, 0, 0.2745098, 1, 1,
0.3535671, -0.5681432, 2.796845, 0, 0.2666667, 1, 1,
0.3552826, 1.085817, -0.7908556, 0, 0.2627451, 1, 1,
0.3631938, -1.351088, 2.345648, 0, 0.254902, 1, 1,
0.367498, -0.727083, 2.307351, 0, 0.2509804, 1, 1,
0.3703318, 1.341212, 1.444925, 0, 0.2431373, 1, 1,
0.3707693, 0.2229217, -1.183398, 0, 0.2392157, 1, 1,
0.3812123, 0.4548914, -0.8683155, 0, 0.2313726, 1, 1,
0.3847599, 1.73674, 1.525939, 0, 0.227451, 1, 1,
0.3861656, -1.43715, 2.362307, 0, 0.2196078, 1, 1,
0.387056, 0.09951132, 3.1814, 0, 0.2156863, 1, 1,
0.3871481, -0.2514841, -0.0421793, 0, 0.2078431, 1, 1,
0.3931008, 0.2883912, 1.458553, 0, 0.2039216, 1, 1,
0.3991282, 0.9109515, -1.211542, 0, 0.1960784, 1, 1,
0.405332, 0.3246156, 0.3940858, 0, 0.1882353, 1, 1,
0.4067332, 1.077682, 1.811984, 0, 0.1843137, 1, 1,
0.4070591, 0.5980601, 0.9149599, 0, 0.1764706, 1, 1,
0.4094879, 0.8147745, -0.2126779, 0, 0.172549, 1, 1,
0.4189531, -1.51675, 2.636579, 0, 0.1647059, 1, 1,
0.4241283, -0.5606104, 1.374578, 0, 0.1607843, 1, 1,
0.4243869, -0.561745, 3.229908, 0, 0.1529412, 1, 1,
0.4254327, -0.8547144, 2.400581, 0, 0.1490196, 1, 1,
0.4266002, -0.1254798, 2.567623, 0, 0.1411765, 1, 1,
0.4275902, -1.616184, 3.0337, 0, 0.1372549, 1, 1,
0.4323149, -0.442574, 3.058628, 0, 0.1294118, 1, 1,
0.4327165, 0.618517, -0.553289, 0, 0.1254902, 1, 1,
0.4386377, 0.6371398, 1.892639, 0, 0.1176471, 1, 1,
0.4434561, 0.5681812, 0.6329559, 0, 0.1137255, 1, 1,
0.4437274, 1.160623, -0.04478006, 0, 0.1058824, 1, 1,
0.4501485, 0.3639237, 1.362476, 0, 0.09803922, 1, 1,
0.4516089, 1.170181, 1.530228, 0, 0.09411765, 1, 1,
0.4537099, 0.6600654, 2.337599, 0, 0.08627451, 1, 1,
0.4573016, -1.136469, 3.933807, 0, 0.08235294, 1, 1,
0.4574856, 0.6128588, 0.8527796, 0, 0.07450981, 1, 1,
0.4615982, 0.6086312, 2.052356, 0, 0.07058824, 1, 1,
0.4632927, 0.4211173, -0.3551387, 0, 0.0627451, 1, 1,
0.4642585, 1.442724, 0.07913551, 0, 0.05882353, 1, 1,
0.4646233, -0.1535295, 1.839559, 0, 0.05098039, 1, 1,
0.4649674, 1.027343, 0.2050695, 0, 0.04705882, 1, 1,
0.4728123, 0.4103637, 0.6695082, 0, 0.03921569, 1, 1,
0.4769562, -0.2369836, 0.4964235, 0, 0.03529412, 1, 1,
0.4771937, -0.8133555, 2.208469, 0, 0.02745098, 1, 1,
0.4786544, 1.648828, 0.2840615, 0, 0.02352941, 1, 1,
0.4819286, -2.020379, 2.921071, 0, 0.01568628, 1, 1,
0.4823803, -2.169075, 2.850414, 0, 0.01176471, 1, 1,
0.4828581, 0.6549854, 1.264684, 0, 0.003921569, 1, 1,
0.4837911, 0.8611587, -0.403585, 0.003921569, 0, 1, 1,
0.4841748, 0.396976, 0.5548, 0.007843138, 0, 1, 1,
0.4867976, 0.2582945, 0.8138621, 0.01568628, 0, 1, 1,
0.4876534, -1.424849, 2.103513, 0.01960784, 0, 1, 1,
0.4882389, 1.089753, 0.9621953, 0.02745098, 0, 1, 1,
0.4932208, -2.372388, 3.11662, 0.03137255, 0, 1, 1,
0.4935938, -0.5759776, 2.276173, 0.03921569, 0, 1, 1,
0.4948568, 2.012575, 0.9415544, 0.04313726, 0, 1, 1,
0.4955201, -1.587736, 1.856762, 0.05098039, 0, 1, 1,
0.5000997, -1.323259, 2.341469, 0.05490196, 0, 1, 1,
0.5038204, 1.783058, -0.9544569, 0.0627451, 0, 1, 1,
0.5066493, -1.743268, 3.495324, 0.06666667, 0, 1, 1,
0.5110841, -0.483858, -0.1724975, 0.07450981, 0, 1, 1,
0.5114852, 0.7771274, 0.1753202, 0.07843138, 0, 1, 1,
0.513421, 1.475791, 2.262062, 0.08627451, 0, 1, 1,
0.5181787, 0.7423378, 1.177597, 0.09019608, 0, 1, 1,
0.5222654, -1.461655, 2.523316, 0.09803922, 0, 1, 1,
0.528933, -0.3899394, 2.380388, 0.1058824, 0, 1, 1,
0.5308487, -0.04420327, 0.8653883, 0.1098039, 0, 1, 1,
0.5315571, 1.020015, 1.075048, 0.1176471, 0, 1, 1,
0.5330922, 0.5789139, 0.3659084, 0.1215686, 0, 1, 1,
0.5346394, -0.6219405, 1.890952, 0.1294118, 0, 1, 1,
0.5373281, 0.2092438, 1.223344, 0.1333333, 0, 1, 1,
0.5381449, 1.984164, 1.317555, 0.1411765, 0, 1, 1,
0.5409024, -1.640191, 2.590388, 0.145098, 0, 1, 1,
0.545304, -0.3067923, 0.8979962, 0.1529412, 0, 1, 1,
0.5464438, -0.3346745, 2.32382, 0.1568628, 0, 1, 1,
0.5498931, 0.4173953, 1.061666, 0.1647059, 0, 1, 1,
0.5518445, 0.7832308, 3.341927, 0.1686275, 0, 1, 1,
0.5521089, -1.579693, 2.691386, 0.1764706, 0, 1, 1,
0.553912, 0.8898534, 0.6487744, 0.1803922, 0, 1, 1,
0.5539323, 0.1971152, 1.758586, 0.1882353, 0, 1, 1,
0.559702, 0.6508583, -0.3031672, 0.1921569, 0, 1, 1,
0.5616326, 0.8340458, 0.5208974, 0.2, 0, 1, 1,
0.5635832, 2.754249, -1.299555, 0.2078431, 0, 1, 1,
0.5644567, 1.064031, 1.678164, 0.2117647, 0, 1, 1,
0.5681862, 0.2880537, 0.4546081, 0.2196078, 0, 1, 1,
0.5709115, -0.9382477, 2.853812, 0.2235294, 0, 1, 1,
0.5743942, 0.9986615, -0.4532504, 0.2313726, 0, 1, 1,
0.5749591, 0.4914512, 1.343827, 0.2352941, 0, 1, 1,
0.5766839, -0.01075957, 2.382918, 0.2431373, 0, 1, 1,
0.5767665, 1.273692, 0.4326316, 0.2470588, 0, 1, 1,
0.5790597, 0.4517677, 2.178746, 0.254902, 0, 1, 1,
0.5837806, 0.4506107, 0.3720873, 0.2588235, 0, 1, 1,
0.5838503, 0.1127954, 1.511665, 0.2666667, 0, 1, 1,
0.5841779, 0.3907646, 1.856204, 0.2705882, 0, 1, 1,
0.5874964, 0.09074918, -0.2017438, 0.2784314, 0, 1, 1,
0.59483, -0.8761144, 2.411738, 0.282353, 0, 1, 1,
0.5957419, 1.662127, 0.6408229, 0.2901961, 0, 1, 1,
0.5989972, -0.512114, 1.766969, 0.2941177, 0, 1, 1,
0.6079113, -0.4532494, 3.524182, 0.3019608, 0, 1, 1,
0.6105525, 0.1381403, 0.01110769, 0.3098039, 0, 1, 1,
0.6138133, -0.9288843, 2.499731, 0.3137255, 0, 1, 1,
0.6148586, -0.5993447, 2.166896, 0.3215686, 0, 1, 1,
0.6155482, -1.154943, 4.515043, 0.3254902, 0, 1, 1,
0.6172029, 0.4062822, 0.7820352, 0.3333333, 0, 1, 1,
0.6183487, 0.4966342, 1.194211, 0.3372549, 0, 1, 1,
0.6190848, -0.3661748, 0.7937912, 0.345098, 0, 1, 1,
0.6217808, 1.499598, -0.9365996, 0.3490196, 0, 1, 1,
0.6231764, 2.363959, -2.332275, 0.3568628, 0, 1, 1,
0.6236836, -0.4064568, 1.300151, 0.3607843, 0, 1, 1,
0.6251698, -1.013224, 3.804659, 0.3686275, 0, 1, 1,
0.6262712, -0.7647489, 1.98686, 0.372549, 0, 1, 1,
0.6264066, -0.9875936, 2.25583, 0.3803922, 0, 1, 1,
0.6278736, -1.116781, 3.876477, 0.3843137, 0, 1, 1,
0.6290188, 1.439925, -1.034817, 0.3921569, 0, 1, 1,
0.6300984, 1.734612, -0.4378632, 0.3960784, 0, 1, 1,
0.6307387, 0.789822, 1.255833, 0.4039216, 0, 1, 1,
0.6382908, 1.042554, 2.077174, 0.4117647, 0, 1, 1,
0.6435755, -1.201196, 4.081766, 0.4156863, 0, 1, 1,
0.6500815, 0.6252195, 0.6955753, 0.4235294, 0, 1, 1,
0.6526987, -1.022646, 2.157527, 0.427451, 0, 1, 1,
0.6582857, -0.08043932, 2.293874, 0.4352941, 0, 1, 1,
0.6582888, 1.353171, -1.805099, 0.4392157, 0, 1, 1,
0.6638672, -0.7651264, 2.123662, 0.4470588, 0, 1, 1,
0.6666505, 1.217434, 1.550762, 0.4509804, 0, 1, 1,
0.6716176, -0.5675914, 2.90975, 0.4588235, 0, 1, 1,
0.675041, -0.4708272, 3.160001, 0.4627451, 0, 1, 1,
0.677679, -0.6804676, 1.123411, 0.4705882, 0, 1, 1,
0.6778803, -0.8648121, 3.241747, 0.4745098, 0, 1, 1,
0.6799242, 1.303817, 0.0993451, 0.4823529, 0, 1, 1,
0.6799672, 1.403619, -0.1392163, 0.4862745, 0, 1, 1,
0.6897966, -1.723135, 1.8774, 0.4941176, 0, 1, 1,
0.6921768, -0.4958777, 3.271941, 0.5019608, 0, 1, 1,
0.6927131, -1.487292, 4.524096, 0.5058824, 0, 1, 1,
0.6944867, -0.658514, 0.9225624, 0.5137255, 0, 1, 1,
0.6945943, -0.1281089, 3.075344, 0.5176471, 0, 1, 1,
0.6952375, -0.8831016, 4.912953, 0.5254902, 0, 1, 1,
0.6983391, -1.361995, 3.055991, 0.5294118, 0, 1, 1,
0.7063349, -0.6507705, 1.764569, 0.5372549, 0, 1, 1,
0.7082393, -0.1590654, 1.279747, 0.5411765, 0, 1, 1,
0.7104713, 0.7699215, 0.1519643, 0.5490196, 0, 1, 1,
0.7107913, -0.7268564, 1.542973, 0.5529412, 0, 1, 1,
0.7138461, 1.104018, 2.816624, 0.5607843, 0, 1, 1,
0.7163898, 0.5550944, 0.530421, 0.5647059, 0, 1, 1,
0.7211654, 0.4507238, 0.7890759, 0.572549, 0, 1, 1,
0.7223088, -0.9253452, 2.005292, 0.5764706, 0, 1, 1,
0.7286004, -0.4707469, 2.674092, 0.5843138, 0, 1, 1,
0.7309507, 1.085427, -0.150646, 0.5882353, 0, 1, 1,
0.7326351, -0.4916621, 2.701728, 0.5960785, 0, 1, 1,
0.7441405, 1.413739, 1.540951, 0.6039216, 0, 1, 1,
0.7468849, -1.308289, 2.614835, 0.6078432, 0, 1, 1,
0.7494338, -0.3740397, 2.877931, 0.6156863, 0, 1, 1,
0.7502828, 1.22071, 0.5207486, 0.6196079, 0, 1, 1,
0.7588571, 0.5940185, 0.7613218, 0.627451, 0, 1, 1,
0.7620592, -0.8491431, 2.656699, 0.6313726, 0, 1, 1,
0.7705454, -0.00683144, 1.921063, 0.6392157, 0, 1, 1,
0.7712735, 1.452467, 1.938631, 0.6431373, 0, 1, 1,
0.7795365, -0.04942469, 1.472989, 0.6509804, 0, 1, 1,
0.779558, -0.4465063, 2.055297, 0.654902, 0, 1, 1,
0.7799502, 0.02005271, 1.154003, 0.6627451, 0, 1, 1,
0.7862339, 1.622315, 1.35012, 0.6666667, 0, 1, 1,
0.7865881, -0.4595618, 3.27492, 0.6745098, 0, 1, 1,
0.7945321, 0.3213068, 2.357409, 0.6784314, 0, 1, 1,
0.7972269, 0.7482776, 0.7847917, 0.6862745, 0, 1, 1,
0.8056453, -0.317743, 2.133859, 0.6901961, 0, 1, 1,
0.8075693, -0.8067838, 2.722118, 0.6980392, 0, 1, 1,
0.8077447, 0.7044552, 1.628047, 0.7058824, 0, 1, 1,
0.8120227, 0.01475572, 1.889459, 0.7098039, 0, 1, 1,
0.8128997, 1.934819, 1.830532, 0.7176471, 0, 1, 1,
0.8133278, 0.4851852, 0.3538888, 0.7215686, 0, 1, 1,
0.8180926, 0.4367605, 1.153228, 0.7294118, 0, 1, 1,
0.8211816, 0.01912566, 0.0707991, 0.7333333, 0, 1, 1,
0.8244304, -0.01574452, 1.803419, 0.7411765, 0, 1, 1,
0.8249906, 0.9230702, 0.1001512, 0.7450981, 0, 1, 1,
0.8322756, -1.209858, 3.183504, 0.7529412, 0, 1, 1,
0.832352, -0.10559, 2.596028, 0.7568628, 0, 1, 1,
0.832974, -0.4221217, 2.787606, 0.7647059, 0, 1, 1,
0.833504, -0.08793598, -0.5872055, 0.7686275, 0, 1, 1,
0.8429144, 0.2841702, 1.814393, 0.7764706, 0, 1, 1,
0.846065, -0.4667113, 1.240767, 0.7803922, 0, 1, 1,
0.8480339, 0.1066379, 3.749944, 0.7882353, 0, 1, 1,
0.851619, -1.278427, 4.410787, 0.7921569, 0, 1, 1,
0.8571162, 0.3662732, 0.7527221, 0.8, 0, 1, 1,
0.8595646, -0.4952649, 3.751657, 0.8078431, 0, 1, 1,
0.8647541, -1.10305, 2.140206, 0.8117647, 0, 1, 1,
0.8650758, 0.8816224, 0.8044876, 0.8196079, 0, 1, 1,
0.870292, 1.246958, 1.930853, 0.8235294, 0, 1, 1,
0.870545, 0.4909893, 2.002078, 0.8313726, 0, 1, 1,
0.8726112, 0.3773425, 1.987427, 0.8352941, 0, 1, 1,
0.8748165, -0.2838419, 0.5742152, 0.8431373, 0, 1, 1,
0.8834935, 0.8893944, 0.8303816, 0.8470588, 0, 1, 1,
0.8836696, -0.4197026, 2.024093, 0.854902, 0, 1, 1,
0.8890723, -0.08901135, 0.3140571, 0.8588235, 0, 1, 1,
0.890192, 0.6216925, 2.537454, 0.8666667, 0, 1, 1,
0.8911079, -0.9055564, 4.068686, 0.8705882, 0, 1, 1,
0.8929383, -0.2636811, 1.915205, 0.8784314, 0, 1, 1,
0.8982025, 0.563172, 1.626891, 0.8823529, 0, 1, 1,
0.900075, -1.138533, 3.718041, 0.8901961, 0, 1, 1,
0.9050435, 0.652215, 1.620779, 0.8941177, 0, 1, 1,
0.9172381, -1.11428, 3.06465, 0.9019608, 0, 1, 1,
0.9193971, 1.540096, 0.6393082, 0.9098039, 0, 1, 1,
0.9204915, -1.088248, 2.725558, 0.9137255, 0, 1, 1,
0.9208044, -0.1645795, 1.168278, 0.9215686, 0, 1, 1,
0.9238357, 0.5804331, 0.1676058, 0.9254902, 0, 1, 1,
0.9247666, -1.046745, 0.9981613, 0.9333333, 0, 1, 1,
0.934817, -1.34605, 2.672666, 0.9372549, 0, 1, 1,
0.9349191, 0.8053494, 1.794066, 0.945098, 0, 1, 1,
0.9408491, -0.5235559, 3.308783, 0.9490196, 0, 1, 1,
0.949734, -1.353799, 2.944546, 0.9568627, 0, 1, 1,
0.9602839, 0.7188558, 2.516384, 0.9607843, 0, 1, 1,
0.9614658, -0.2500523, 0.3922308, 0.9686275, 0, 1, 1,
0.962805, -1.976336, 3.179491, 0.972549, 0, 1, 1,
0.9639893, -0.3619028, 1.53678, 0.9803922, 0, 1, 1,
0.9670796, -0.7073581, 2.4313, 0.9843137, 0, 1, 1,
0.9674153, 0.01820065, 1.860958, 0.9921569, 0, 1, 1,
0.9688315, 0.6163675, -0.003466821, 0.9960784, 0, 1, 1,
0.9735849, 0.3006936, 0.8365186, 1, 0, 0.9960784, 1,
0.9740573, 0.6187646, 2.281496, 1, 0, 0.9882353, 1,
0.9766105, -0.4507954, 2.626741, 1, 0, 0.9843137, 1,
0.976914, 0.3749036, 1.636655, 1, 0, 0.9764706, 1,
0.9786542, 0.203002, 1.892624, 1, 0, 0.972549, 1,
0.979745, 1.332147, 1.388173, 1, 0, 0.9647059, 1,
0.979836, 0.3828774, 0.82062, 1, 0, 0.9607843, 1,
0.9825557, 1.164411, -0.30323, 1, 0, 0.9529412, 1,
0.9862825, 0.07011012, 1.95001, 1, 0, 0.9490196, 1,
0.9898592, 0.9206607, -0.1282635, 1, 0, 0.9411765, 1,
0.9902921, -0.1271193, 1.982087, 1, 0, 0.9372549, 1,
0.9905461, 0.5708016, 2.139571, 1, 0, 0.9294118, 1,
0.9965284, 0.6433699, 0.9182532, 1, 0, 0.9254902, 1,
1.007272, 0.1728299, 2.567398, 1, 0, 0.9176471, 1,
1.016459, 0.5263247, 1.864283, 1, 0, 0.9137255, 1,
1.031114, -0.12309, 1.484576, 1, 0, 0.9058824, 1,
1.034317, -0.5615273, 0.9668187, 1, 0, 0.9019608, 1,
1.03822, -0.451198, 3.084854, 1, 0, 0.8941177, 1,
1.045601, 1.64825, -0.4501104, 1, 0, 0.8862745, 1,
1.054369, 1.493712, 1.581154, 1, 0, 0.8823529, 1,
1.054888, 1.414244, 0.7155922, 1, 0, 0.8745098, 1,
1.055829, -1.471331, 1.279821, 1, 0, 0.8705882, 1,
1.059538, 0.5062825, 1.724024, 1, 0, 0.8627451, 1,
1.064222, -0.9705821, 0.9721208, 1, 0, 0.8588235, 1,
1.077372, -0.00110909, 1.58803, 1, 0, 0.8509804, 1,
1.083039, 0.3335601, -0.4194379, 1, 0, 0.8470588, 1,
1.088949, -1.412275, 2.474326, 1, 0, 0.8392157, 1,
1.089637, -1.181691, 3.56999, 1, 0, 0.8352941, 1,
1.096507, 0.7009995, 1.384717, 1, 0, 0.827451, 1,
1.097626, -0.6254843, 0.5750411, 1, 0, 0.8235294, 1,
1.099433, -0.6340325, 2.889501, 1, 0, 0.8156863, 1,
1.106144, -0.6160298, 2.378487, 1, 0, 0.8117647, 1,
1.107263, -0.8861414, 2.812246, 1, 0, 0.8039216, 1,
1.107431, -0.1398071, 1.403468, 1, 0, 0.7960784, 1,
1.10839, -0.4537583, 2.856552, 1, 0, 0.7921569, 1,
1.109134, 0.694984, 1.560522, 1, 0, 0.7843137, 1,
1.112947, 0.9337808, 1.427235, 1, 0, 0.7803922, 1,
1.129768, -0.04757683, 1.676743, 1, 0, 0.772549, 1,
1.134954, 1.137697, 0.001435194, 1, 0, 0.7686275, 1,
1.135294, -0.7326162, 2.297421, 1, 0, 0.7607843, 1,
1.141138, -0.1353835, 1.093642, 1, 0, 0.7568628, 1,
1.143388, -0.857666, 2.41566, 1, 0, 0.7490196, 1,
1.146299, -0.760983, 2.644175, 1, 0, 0.7450981, 1,
1.161579, -0.04748122, 3.291465, 1, 0, 0.7372549, 1,
1.164944, 0.1441707, 2.366557, 1, 0, 0.7333333, 1,
1.165483, -0.3042319, 1.918942, 1, 0, 0.7254902, 1,
1.166123, 0.3531632, 1.954485, 1, 0, 0.7215686, 1,
1.169434, -0.4167069, -0.2997397, 1, 0, 0.7137255, 1,
1.169883, -0.002132858, 1.846818, 1, 0, 0.7098039, 1,
1.173848, -0.6056824, 1.418825, 1, 0, 0.7019608, 1,
1.176401, -0.8976184, 0.05272657, 1, 0, 0.6941177, 1,
1.180722, 0.06658384, 0.3360751, 1, 0, 0.6901961, 1,
1.182893, -1.405379, 3.386042, 1, 0, 0.682353, 1,
1.189264, -0.6034722, 2.593161, 1, 0, 0.6784314, 1,
1.197858, -1.173784, 1.383524, 1, 0, 0.6705883, 1,
1.208267, -2.023229, 3.837364, 1, 0, 0.6666667, 1,
1.208602, 0.5102394, 1.204373, 1, 0, 0.6588235, 1,
1.212929, -0.1908004, 2.005577, 1, 0, 0.654902, 1,
1.229665, 0.3930995, 0.1628042, 1, 0, 0.6470588, 1,
1.229688, 1.902923, 0.7708298, 1, 0, 0.6431373, 1,
1.232574, -0.06200785, 0.9865189, 1, 0, 0.6352941, 1,
1.233094, -0.5810173, 3.177022, 1, 0, 0.6313726, 1,
1.241694, -1.570652, 2.628814, 1, 0, 0.6235294, 1,
1.248308, -0.2031133, 1.971253, 1, 0, 0.6196079, 1,
1.252219, 0.2982171, -0.4247099, 1, 0, 0.6117647, 1,
1.255171, 0.07109688, -1.17632, 1, 0, 0.6078432, 1,
1.257584, -0.9550217, 2.689135, 1, 0, 0.6, 1,
1.259986, -2.384368, 2.422352, 1, 0, 0.5921569, 1,
1.261441, -0.4395589, 2.5905, 1, 0, 0.5882353, 1,
1.270872, -0.4750158, 2.555268, 1, 0, 0.5803922, 1,
1.279467, 0.5275457, 0.06388471, 1, 0, 0.5764706, 1,
1.314572, 1.829517, 0.1073674, 1, 0, 0.5686275, 1,
1.315027, -0.1096114, 0.9706609, 1, 0, 0.5647059, 1,
1.315165, -0.08569974, 2.507257, 1, 0, 0.5568628, 1,
1.319585, -0.7544596, 2.356946, 1, 0, 0.5529412, 1,
1.324136, 0.863694, 1.083966, 1, 0, 0.5450981, 1,
1.325686, 0.7667558, 0.03803159, 1, 0, 0.5411765, 1,
1.333474, -1.142316, 1.028857, 1, 0, 0.5333334, 1,
1.336871, -1.331079, 0.6997547, 1, 0, 0.5294118, 1,
1.339662, 0.6523167, 0.5486966, 1, 0, 0.5215687, 1,
1.341653, 0.4277972, 1.229056, 1, 0, 0.5176471, 1,
1.345459, -0.1616618, 2.141085, 1, 0, 0.509804, 1,
1.345957, 0.7841802, -0.5556157, 1, 0, 0.5058824, 1,
1.350555, -0.3709224, 2.053796, 1, 0, 0.4980392, 1,
1.35181, -1.6251, 2.874856, 1, 0, 0.4901961, 1,
1.356059, 0.2327872, 1.269111, 1, 0, 0.4862745, 1,
1.358684, -0.5225492, 0.9000421, 1, 0, 0.4784314, 1,
1.365382, 1.257303, 1.619117, 1, 0, 0.4745098, 1,
1.366228, 0.9711049, -0.7634987, 1, 0, 0.4666667, 1,
1.377033, 0.3054407, 1.487462, 1, 0, 0.4627451, 1,
1.381213, 1.499502, 0.0371414, 1, 0, 0.454902, 1,
1.381708, -0.1502684, 2.049937, 1, 0, 0.4509804, 1,
1.387159, 0.7350338, 1.257609, 1, 0, 0.4431373, 1,
1.387657, -0.54072, 0.7431089, 1, 0, 0.4392157, 1,
1.391494, 0.6448457, -0.02224934, 1, 0, 0.4313726, 1,
1.392561, -0.682772, 3.179699, 1, 0, 0.427451, 1,
1.401559, 0.8571929, -0.5071344, 1, 0, 0.4196078, 1,
1.42298, 1.055457, 0.3543745, 1, 0, 0.4156863, 1,
1.423771, -1.596883, 0.4217178, 1, 0, 0.4078431, 1,
1.425444, -2.176691, 0.1547598, 1, 0, 0.4039216, 1,
1.451308, 1.150905, 0.6005298, 1, 0, 0.3960784, 1,
1.462035, -1.605872, 3.008445, 1, 0, 0.3882353, 1,
1.46454, -0.03694207, 0.6601178, 1, 0, 0.3843137, 1,
1.470774, -0.4554002, 3.862314, 1, 0, 0.3764706, 1,
1.47295, 0.2707021, 0.4619229, 1, 0, 0.372549, 1,
1.477993, 0.5312101, 0.7731044, 1, 0, 0.3647059, 1,
1.489697, 0.07289746, 0.4980199, 1, 0, 0.3607843, 1,
1.509187, -0.2782741, 3.696108, 1, 0, 0.3529412, 1,
1.510507, -1.797763, 3.18561, 1, 0, 0.3490196, 1,
1.511493, -0.2336623, 1.565692, 1, 0, 0.3411765, 1,
1.517627, 0.9169689, 0.4356197, 1, 0, 0.3372549, 1,
1.529962, -0.03365183, 2.697808, 1, 0, 0.3294118, 1,
1.551034, 0.02504238, 1.881449, 1, 0, 0.3254902, 1,
1.560534, 0.846127, 1.017877, 1, 0, 0.3176471, 1,
1.569825, -1.26744, 1.296199, 1, 0, 0.3137255, 1,
1.574646, 0.2461442, 1.236189, 1, 0, 0.3058824, 1,
1.578519, 0.608465, 0.3011765, 1, 0, 0.2980392, 1,
1.597952, -0.4973968, 2.977554, 1, 0, 0.2941177, 1,
1.608311, 0.3465725, 0.9350416, 1, 0, 0.2862745, 1,
1.61063, -0.0293161, 0.8411304, 1, 0, 0.282353, 1,
1.618173, 0.5412067, 1.455002, 1, 0, 0.2745098, 1,
1.63222, 0.3504363, 0.4798655, 1, 0, 0.2705882, 1,
1.634872, 0.5938866, -0.009145563, 1, 0, 0.2627451, 1,
1.653887, 2.126382, 2.25019, 1, 0, 0.2588235, 1,
1.656242, 0.4296297, 0.5631673, 1, 0, 0.2509804, 1,
1.700893, 0.1647402, 1.341351, 1, 0, 0.2470588, 1,
1.705749, 1.082494, 1.547443, 1, 0, 0.2392157, 1,
1.707702, 0.1343901, 1.343487, 1, 0, 0.2352941, 1,
1.713391, 0.6217639, 1.388066, 1, 0, 0.227451, 1,
1.713841, -0.5197207, 2.709262, 1, 0, 0.2235294, 1,
1.716418, -0.6988504, 2.68904, 1, 0, 0.2156863, 1,
1.731637, 0.3603393, 1.960026, 1, 0, 0.2117647, 1,
1.732663, -0.7314416, 2.789207, 1, 0, 0.2039216, 1,
1.735618, -1.199769, 3.619742, 1, 0, 0.1960784, 1,
1.804489, 0.8796951, 1.146969, 1, 0, 0.1921569, 1,
1.807351, -1.124871, 1.689819, 1, 0, 0.1843137, 1,
1.818476, 1.396457, 0.5791623, 1, 0, 0.1803922, 1,
1.821298, 1.120591, 0.6785656, 1, 0, 0.172549, 1,
1.824912, 1.241176, -0.8416773, 1, 0, 0.1686275, 1,
1.825405, -1.290086, 3.02016, 1, 0, 0.1607843, 1,
1.832196, 0.6203698, 2.93958, 1, 0, 0.1568628, 1,
1.833266, 0.05104283, 1.485065, 1, 0, 0.1490196, 1,
1.865921, -0.2910857, 0.9226397, 1, 0, 0.145098, 1,
1.882936, 0.613286, -0.4918035, 1, 0, 0.1372549, 1,
1.898873, 1.877558, -0.3107347, 1, 0, 0.1333333, 1,
1.932673, 0.8861023, 0.3230886, 1, 0, 0.1254902, 1,
1.95783, -1.24827, 2.947486, 1, 0, 0.1215686, 1,
2.042977, -0.5904885, 1.989703, 1, 0, 0.1137255, 1,
2.053376, 1.295828, 2.883507, 1, 0, 0.1098039, 1,
2.090685, -0.05071738, 2.254035, 1, 0, 0.1019608, 1,
2.108403, 0.3638146, 2.099927, 1, 0, 0.09411765, 1,
2.109344, -1.433846, 1.64401, 1, 0, 0.09019608, 1,
2.121412, -0.01932565, 1.460087, 1, 0, 0.08235294, 1,
2.175773, 0.07379801, 1.41608, 1, 0, 0.07843138, 1,
2.182227, 0.1014755, 2.400161, 1, 0, 0.07058824, 1,
2.253756, -0.006991211, 2.091897, 1, 0, 0.06666667, 1,
2.275628, 1.518175, 2.228334, 1, 0, 0.05882353, 1,
2.317739, 0.5420198, 0.1432454, 1, 0, 0.05490196, 1,
2.32945, -1.370196, 0.5887427, 1, 0, 0.04705882, 1,
2.388175, 0.3656496, 3.5509, 1, 0, 0.04313726, 1,
2.446886, -1.237598, 0.5379041, 1, 0, 0.03529412, 1,
2.556729, -1.018609, 2.441313, 1, 0, 0.03137255, 1,
2.581666, 0.7025371, 1.693936, 1, 0, 0.02352941, 1,
2.608763, 0.2165446, 0.3602684, 1, 0, 0.01960784, 1,
2.640763, -0.02122356, 1.261608, 1, 0, 0.01176471, 1,
2.917722, -0.4042062, 2.05152, 1, 0, 0.007843138, 1
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
-0.5371481, -3.937341, -7.384392, 0, -0.5, 0.5, 0.5,
-0.5371481, -3.937341, -7.384392, 1, -0.5, 0.5, 0.5,
-0.5371481, -3.937341, -7.384392, 1, 1.5, 0.5, 0.5,
-0.5371481, -3.937341, -7.384392, 0, 1.5, 0.5, 0.5
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
-5.163218, 0.1987561, -7.384392, 0, -0.5, 0.5, 0.5,
-5.163218, 0.1987561, -7.384392, 1, -0.5, 0.5, 0.5,
-5.163218, 0.1987561, -7.384392, 1, 1.5, 0.5, 0.5,
-5.163218, 0.1987561, -7.384392, 0, 1.5, 0.5, 0.5
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
-5.163218, -3.937341, 0.2349169, 0, -0.5, 0.5, 0.5,
-5.163218, -3.937341, 0.2349169, 1, -0.5, 0.5, 0.5,
-5.163218, -3.937341, 0.2349169, 1, 1.5, 0.5, 0.5,
-5.163218, -3.937341, 0.2349169, 0, 1.5, 0.5, 0.5
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
-3, -2.982857, -5.62609,
2, -2.982857, -5.62609,
-3, -2.982857, -5.62609,
-3, -3.141938, -5.91914,
-2, -2.982857, -5.62609,
-2, -3.141938, -5.91914,
-1, -2.982857, -5.62609,
-1, -3.141938, -5.91914,
0, -2.982857, -5.62609,
0, -3.141938, -5.91914,
1, -2.982857, -5.62609,
1, -3.141938, -5.91914,
2, -2.982857, -5.62609,
2, -3.141938, -5.91914
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
-3, -3.460099, -6.505241, 0, -0.5, 0.5, 0.5,
-3, -3.460099, -6.505241, 1, -0.5, 0.5, 0.5,
-3, -3.460099, -6.505241, 1, 1.5, 0.5, 0.5,
-3, -3.460099, -6.505241, 0, 1.5, 0.5, 0.5,
-2, -3.460099, -6.505241, 0, -0.5, 0.5, 0.5,
-2, -3.460099, -6.505241, 1, -0.5, 0.5, 0.5,
-2, -3.460099, -6.505241, 1, 1.5, 0.5, 0.5,
-2, -3.460099, -6.505241, 0, 1.5, 0.5, 0.5,
-1, -3.460099, -6.505241, 0, -0.5, 0.5, 0.5,
-1, -3.460099, -6.505241, 1, -0.5, 0.5, 0.5,
-1, -3.460099, -6.505241, 1, 1.5, 0.5, 0.5,
-1, -3.460099, -6.505241, 0, 1.5, 0.5, 0.5,
0, -3.460099, -6.505241, 0, -0.5, 0.5, 0.5,
0, -3.460099, -6.505241, 1, -0.5, 0.5, 0.5,
0, -3.460099, -6.505241, 1, 1.5, 0.5, 0.5,
0, -3.460099, -6.505241, 0, 1.5, 0.5, 0.5,
1, -3.460099, -6.505241, 0, -0.5, 0.5, 0.5,
1, -3.460099, -6.505241, 1, -0.5, 0.5, 0.5,
1, -3.460099, -6.505241, 1, 1.5, 0.5, 0.5,
1, -3.460099, -6.505241, 0, 1.5, 0.5, 0.5,
2, -3.460099, -6.505241, 0, -0.5, 0.5, 0.5,
2, -3.460099, -6.505241, 1, -0.5, 0.5, 0.5,
2, -3.460099, -6.505241, 1, 1.5, 0.5, 0.5,
2, -3.460099, -6.505241, 0, 1.5, 0.5, 0.5
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
-4.095664, -2, -5.62609,
-4.095664, 3, -5.62609,
-4.095664, -2, -5.62609,
-4.27359, -2, -5.91914,
-4.095664, -1, -5.62609,
-4.27359, -1, -5.91914,
-4.095664, 0, -5.62609,
-4.27359, 0, -5.91914,
-4.095664, 1, -5.62609,
-4.27359, 1, -5.91914,
-4.095664, 2, -5.62609,
-4.27359, 2, -5.91914,
-4.095664, 3, -5.62609,
-4.27359, 3, -5.91914
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
-4.629441, -2, -6.505241, 0, -0.5, 0.5, 0.5,
-4.629441, -2, -6.505241, 1, -0.5, 0.5, 0.5,
-4.629441, -2, -6.505241, 1, 1.5, 0.5, 0.5,
-4.629441, -2, -6.505241, 0, 1.5, 0.5, 0.5,
-4.629441, -1, -6.505241, 0, -0.5, 0.5, 0.5,
-4.629441, -1, -6.505241, 1, -0.5, 0.5, 0.5,
-4.629441, -1, -6.505241, 1, 1.5, 0.5, 0.5,
-4.629441, -1, -6.505241, 0, 1.5, 0.5, 0.5,
-4.629441, 0, -6.505241, 0, -0.5, 0.5, 0.5,
-4.629441, 0, -6.505241, 1, -0.5, 0.5, 0.5,
-4.629441, 0, -6.505241, 1, 1.5, 0.5, 0.5,
-4.629441, 0, -6.505241, 0, 1.5, 0.5, 0.5,
-4.629441, 1, -6.505241, 0, -0.5, 0.5, 0.5,
-4.629441, 1, -6.505241, 1, -0.5, 0.5, 0.5,
-4.629441, 1, -6.505241, 1, 1.5, 0.5, 0.5,
-4.629441, 1, -6.505241, 0, 1.5, 0.5, 0.5,
-4.629441, 2, -6.505241, 0, -0.5, 0.5, 0.5,
-4.629441, 2, -6.505241, 1, -0.5, 0.5, 0.5,
-4.629441, 2, -6.505241, 1, 1.5, 0.5, 0.5,
-4.629441, 2, -6.505241, 0, 1.5, 0.5, 0.5,
-4.629441, 3, -6.505241, 0, -0.5, 0.5, 0.5,
-4.629441, 3, -6.505241, 1, -0.5, 0.5, 0.5,
-4.629441, 3, -6.505241, 1, 1.5, 0.5, 0.5,
-4.629441, 3, -6.505241, 0, 1.5, 0.5, 0.5
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
-4.095664, -2.982857, -4,
-4.095664, -2.982857, 4,
-4.095664, -2.982857, -4,
-4.27359, -3.141938, -4,
-4.095664, -2.982857, -2,
-4.27359, -3.141938, -2,
-4.095664, -2.982857, 0,
-4.27359, -3.141938, 0,
-4.095664, -2.982857, 2,
-4.27359, -3.141938, 2,
-4.095664, -2.982857, 4,
-4.27359, -3.141938, 4
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
-4.629441, -3.460099, -4, 0, -0.5, 0.5, 0.5,
-4.629441, -3.460099, -4, 1, -0.5, 0.5, 0.5,
-4.629441, -3.460099, -4, 1, 1.5, 0.5, 0.5,
-4.629441, -3.460099, -4, 0, 1.5, 0.5, 0.5,
-4.629441, -3.460099, -2, 0, -0.5, 0.5, 0.5,
-4.629441, -3.460099, -2, 1, -0.5, 0.5, 0.5,
-4.629441, -3.460099, -2, 1, 1.5, 0.5, 0.5,
-4.629441, -3.460099, -2, 0, 1.5, 0.5, 0.5,
-4.629441, -3.460099, 0, 0, -0.5, 0.5, 0.5,
-4.629441, -3.460099, 0, 1, -0.5, 0.5, 0.5,
-4.629441, -3.460099, 0, 1, 1.5, 0.5, 0.5,
-4.629441, -3.460099, 0, 0, 1.5, 0.5, 0.5,
-4.629441, -3.460099, 2, 0, -0.5, 0.5, 0.5,
-4.629441, -3.460099, 2, 1, -0.5, 0.5, 0.5,
-4.629441, -3.460099, 2, 1, 1.5, 0.5, 0.5,
-4.629441, -3.460099, 2, 0, 1.5, 0.5, 0.5,
-4.629441, -3.460099, 4, 0, -0.5, 0.5, 0.5,
-4.629441, -3.460099, 4, 1, -0.5, 0.5, 0.5,
-4.629441, -3.460099, 4, 1, 1.5, 0.5, 0.5,
-4.629441, -3.460099, 4, 0, 1.5, 0.5, 0.5
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
-4.095664, -2.982857, -5.62609,
-4.095664, 3.380369, -5.62609,
-4.095664, -2.982857, 6.095924,
-4.095664, 3.380369, 6.095924,
-4.095664, -2.982857, -5.62609,
-4.095664, -2.982857, 6.095924,
-4.095664, 3.380369, -5.62609,
-4.095664, 3.380369, 6.095924,
-4.095664, -2.982857, -5.62609,
3.021368, -2.982857, -5.62609,
-4.095664, -2.982857, 6.095924,
3.021368, -2.982857, 6.095924,
-4.095664, 3.380369, -5.62609,
3.021368, 3.380369, -5.62609,
-4.095664, 3.380369, 6.095924,
3.021368, 3.380369, 6.095924,
3.021368, -2.982857, -5.62609,
3.021368, 3.380369, -5.62609,
3.021368, -2.982857, 6.095924,
3.021368, 3.380369, 6.095924,
3.021368, -2.982857, -5.62609,
3.021368, -2.982857, 6.095924,
3.021368, 3.380369, -5.62609,
3.021368, 3.380369, 6.095924
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
var radius = 8.072621;
var distance = 35.916;
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
mvMatrix.translate( 0.5371481, -0.1987561, -0.2349169 );
mvMatrix.scale( 1.226393, 1.371675, 0.7446055 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.916);
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
Disulfoton<-read.table("Disulfoton.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.992018, 1.529302, -2.087728, 0, 0, 1, 1, 1,
-3.037153, -0.3271029, -2.23751, 1, 0, 0, 1, 1,
-2.893019, 1.382816, -1.48502, 1, 0, 0, 1, 1,
-2.735249, -1.843389, -2.804726, 1, 0, 0, 1, 1,
-2.605683, -2.184884, -2.095701, 1, 0, 0, 1, 1,
-2.59898, 0.9676184, -2.324826, 1, 0, 0, 1, 1,
-2.588108, -1.305563, -2.985217, 0, 0, 0, 1, 1,
-2.571062, -1.479258, -1.218786, 0, 0, 0, 1, 1,
-2.440217, -0.7493273, -1.283496, 0, 0, 0, 1, 1,
-2.345572, -0.3937353, -1.591006, 0, 0, 0, 1, 1,
-2.250799, 0.4395792, -1.360774, 0, 0, 0, 1, 1,
-2.23208, 1.348665, -1.89915, 0, 0, 0, 1, 1,
-2.207883, 0.8143362, -2.60073, 0, 0, 0, 1, 1,
-2.132744, 1.20329, -1.914815, 1, 1, 1, 1, 1,
-2.115764, 0.8161748, -0.7094114, 1, 1, 1, 1, 1,
-2.114977, 0.9159653, -1.484574, 1, 1, 1, 1, 1,
-2.107329, 0.5658199, -2.004046, 1, 1, 1, 1, 1,
-2.101201, -1.634773, -2.704634, 1, 1, 1, 1, 1,
-2.099935, -0.1663774, -0.8461847, 1, 1, 1, 1, 1,
-2.060554, 0.7247922, -1.054183, 1, 1, 1, 1, 1,
-2.027247, 0.4535687, -1.490466, 1, 1, 1, 1, 1,
-1.970626, 0.195118, -1.150915, 1, 1, 1, 1, 1,
-1.967405, 1.020867, 0.1237527, 1, 1, 1, 1, 1,
-1.966963, 1.752207, -0.005394298, 1, 1, 1, 1, 1,
-1.941685, 0.723192, -0.3214935, 1, 1, 1, 1, 1,
-1.918121, -0.8091677, -2.402953, 1, 1, 1, 1, 1,
-1.859519, -0.5058499, -4.370111, 1, 1, 1, 1, 1,
-1.82977, 0.6698946, -1.354294, 1, 1, 1, 1, 1,
-1.826582, -0.9289002, -2.004694, 0, 0, 1, 1, 1,
-1.773655, 0.9511632, -1.019781, 1, 0, 0, 1, 1,
-1.757489, -0.005474939, -0.04086858, 1, 0, 0, 1, 1,
-1.741024, 0.2711214, -0.1454045, 1, 0, 0, 1, 1,
-1.729127, 2.850192, -2.648703, 1, 0, 0, 1, 1,
-1.703684, -0.4527849, -0.6158625, 1, 0, 0, 1, 1,
-1.703684, -1.31319, -2.023536, 0, 0, 0, 1, 1,
-1.703379, -1.004823, -4.257242, 0, 0, 0, 1, 1,
-1.651052, 0.1769844, -1.885665, 0, 0, 0, 1, 1,
-1.649898, 0.6112718, 0.183916, 0, 0, 0, 1, 1,
-1.636394, 0.7026231, -0.6943455, 0, 0, 0, 1, 1,
-1.634339, -2.029936, -2.426063, 0, 0, 0, 1, 1,
-1.62216, -2.890189, -2.671753, 0, 0, 0, 1, 1,
-1.603244, -0.6616578, -2.627634, 1, 1, 1, 1, 1,
-1.598577, -1.685727, -1.274071, 1, 1, 1, 1, 1,
-1.595721, 1.146411, -1.195995, 1, 1, 1, 1, 1,
-1.577915, -0.3779917, -0.1105709, 1, 1, 1, 1, 1,
-1.574551, -0.6337615, -3.096261, 1, 1, 1, 1, 1,
-1.570763, -0.7844341, 0.4246861, 1, 1, 1, 1, 1,
-1.569366, -0.6043891, -2.827303, 1, 1, 1, 1, 1,
-1.563658, -1.959292, -1.844263, 1, 1, 1, 1, 1,
-1.560827, -0.8230582, -3.461061, 1, 1, 1, 1, 1,
-1.553632, 0.5055696, -0.8447827, 1, 1, 1, 1, 1,
-1.541626, -0.9911858, -1.647637, 1, 1, 1, 1, 1,
-1.538067, 0.4193818, -2.848718, 1, 1, 1, 1, 1,
-1.527857, -1.642556, -3.126667, 1, 1, 1, 1, 1,
-1.523754, -0.8600134, -2.218603, 1, 1, 1, 1, 1,
-1.51984, -0.726549, -2.972908, 1, 1, 1, 1, 1,
-1.518824, -0.08465265, -3.428068, 0, 0, 1, 1, 1,
-1.500013, -1.401923, -2.749452, 1, 0, 0, 1, 1,
-1.494013, -0.2954764, -1.160235, 1, 0, 0, 1, 1,
-1.491314, 0.7711794, -1.782044, 1, 0, 0, 1, 1,
-1.484489, 0.198245, -1.088128, 1, 0, 0, 1, 1,
-1.481049, -1.005335, -2.467109, 1, 0, 0, 1, 1,
-1.478233, 0.1201245, -1.311419, 0, 0, 0, 1, 1,
-1.469999, 0.5242583, -1.732745, 0, 0, 0, 1, 1,
-1.463119, -1.319591, -1.460764, 0, 0, 0, 1, 1,
-1.459243, 0.2969714, 0.4597807, 0, 0, 0, 1, 1,
-1.435416, -1.499288, -0.766968, 0, 0, 0, 1, 1,
-1.435207, 0.4727013, -1.114664, 0, 0, 0, 1, 1,
-1.429767, -0.1030932, -0.8443292, 0, 0, 0, 1, 1,
-1.427882, -1.884237, -3.547092, 1, 1, 1, 1, 1,
-1.421768, -0.08846373, 0.8239001, 1, 1, 1, 1, 1,
-1.420017, 0.4570794, -1.785638, 1, 1, 1, 1, 1,
-1.399814, 0.2506188, -1.556246, 1, 1, 1, 1, 1,
-1.391967, 0.3747696, -1.23034, 1, 1, 1, 1, 1,
-1.390395, -0.7996491, -1.724013, 1, 1, 1, 1, 1,
-1.383033, 0.6533172, -1.085477, 1, 1, 1, 1, 1,
-1.38063, 0.7830732, -2.213758, 1, 1, 1, 1, 1,
-1.371845, -0.551016, -0.8504751, 1, 1, 1, 1, 1,
-1.345306, -0.7815312, -2.73831, 1, 1, 1, 1, 1,
-1.343895, -1.449671, -3.927973, 1, 1, 1, 1, 1,
-1.339244, 0.4824602, -0.6706368, 1, 1, 1, 1, 1,
-1.330011, -1.928226, -1.899629, 1, 1, 1, 1, 1,
-1.311085, -0.9170294, -2.769274, 1, 1, 1, 1, 1,
-1.310672, -0.8417938, -1.338935, 1, 1, 1, 1, 1,
-1.306031, -1.018379, -1.577494, 0, 0, 1, 1, 1,
-1.301749, 0.6606909, -0.7712721, 1, 0, 0, 1, 1,
-1.301184, -0.7096792, -2.130958, 1, 0, 0, 1, 1,
-1.299582, 0.8884056, -2.216999, 1, 0, 0, 1, 1,
-1.29869, -0.09280139, -1.088205, 1, 0, 0, 1, 1,
-1.292374, -0.7614613, -3.915061, 1, 0, 0, 1, 1,
-1.290486, -0.8397118, -1.977048, 0, 0, 0, 1, 1,
-1.272684, -1.013664, -2.252948, 0, 0, 0, 1, 1,
-1.271236, 1.0527, -0.5627691, 0, 0, 0, 1, 1,
-1.259885, -0.1952702, -1.881576, 0, 0, 0, 1, 1,
-1.255738, -1.562346, -3.596363, 0, 0, 0, 1, 1,
-1.236324, 0.7597336, -1.854365, 0, 0, 0, 1, 1,
-1.229639, 1.615384, -0.1101524, 0, 0, 0, 1, 1,
-1.223608, 0.543227, -0.1417713, 1, 1, 1, 1, 1,
-1.209269, -1.51905, -3.396824, 1, 1, 1, 1, 1,
-1.185303, 0.07669045, -1.436956, 1, 1, 1, 1, 1,
-1.180883, 1.413591, 0.3212183, 1, 1, 1, 1, 1,
-1.180262, 0.8154662, -1.009856, 1, 1, 1, 1, 1,
-1.178014, -1.064887, -1.861732, 1, 1, 1, 1, 1,
-1.159281, -0.8419531, -2.246901, 1, 1, 1, 1, 1,
-1.157154, -0.6424481, -2.26895, 1, 1, 1, 1, 1,
-1.140129, -0.5901407, -1.476806, 1, 1, 1, 1, 1,
-1.139168, -0.3839648, -2.53052, 1, 1, 1, 1, 1,
-1.138053, -1.249774, -0.08685572, 1, 1, 1, 1, 1,
-1.133375, 0.5488762, -1.490448, 1, 1, 1, 1, 1,
-1.125288, -0.8017436, -1.849468, 1, 1, 1, 1, 1,
-1.119448, 1.296254, -1.524154, 1, 1, 1, 1, 1,
-1.11132, -0.2212617, -3.054542, 1, 1, 1, 1, 1,
-1.110576, 0.2163432, -1.058307, 0, 0, 1, 1, 1,
-1.110089, -1.041341, -1.588655, 1, 0, 0, 1, 1,
-1.105282, -0.7902307, -2.954771, 1, 0, 0, 1, 1,
-1.104314, -0.6147752, -2.489809, 1, 0, 0, 1, 1,
-1.097237, 1.296016, -1.429036, 1, 0, 0, 1, 1,
-1.096533, -0.5932761, -1.718488, 1, 0, 0, 1, 1,
-1.096446, -0.4775684, -3.886822, 0, 0, 0, 1, 1,
-1.093881, 0.4252239, -0.7403789, 0, 0, 0, 1, 1,
-1.093199, 1.229109, 0.2358651, 0, 0, 0, 1, 1,
-1.09145, 1.448052, -0.1600235, 0, 0, 0, 1, 1,
-1.086843, -0.1255375, -3.887512, 0, 0, 0, 1, 1,
-1.07918, -0.5399895, -2.562553, 0, 0, 0, 1, 1,
-1.07907, -0.1180492, -1.750146, 0, 0, 0, 1, 1,
-1.078984, -1.528829, -3.433216, 1, 1, 1, 1, 1,
-1.076039, 0.6025769, -1.331801, 1, 1, 1, 1, 1,
-1.070699, -1.346222, -1.451201, 1, 1, 1, 1, 1,
-1.066538, -0.3807958, -2.683509, 1, 1, 1, 1, 1,
-1.066221, 0.2238468, -2.42278, 1, 1, 1, 1, 1,
-1.064371, 1.110095, -1.490311, 1, 1, 1, 1, 1,
-1.059417, -0.4626237, -1.940766, 1, 1, 1, 1, 1,
-1.05909, 0.4391544, -0.1801631, 1, 1, 1, 1, 1,
-1.055491, 0.8072354, -0.7815571, 1, 1, 1, 1, 1,
-1.049592, 0.1736638, -1.632899, 1, 1, 1, 1, 1,
-1.049009, 0.3441306, 0.5129322, 1, 1, 1, 1, 1,
-1.041049, -0.06085954, -0.8288476, 1, 1, 1, 1, 1,
-1.0263, 2.412208, 0.1687637, 1, 1, 1, 1, 1,
-1.016055, -0.5347241, -1.077985, 1, 1, 1, 1, 1,
-1.012335, -1.604208, -2.116136, 1, 1, 1, 1, 1,
-1.009833, -1.40507, -1.782314, 0, 0, 1, 1, 1,
-1.005417, 1.315663, -1.097424, 1, 0, 0, 1, 1,
-0.9900505, -0.8638, -2.945068, 1, 0, 0, 1, 1,
-0.9889102, 0.1914098, -1.822748, 1, 0, 0, 1, 1,
-0.9837285, -0.8873799, -3.276935, 1, 0, 0, 1, 1,
-0.9744436, -1.217418, -1.231597, 1, 0, 0, 1, 1,
-0.9698002, -0.7131922, -2.335366, 0, 0, 0, 1, 1,
-0.9655812, -0.9060667, -1.948931, 0, 0, 0, 1, 1,
-0.9636057, -1.923043, -3.012448, 0, 0, 0, 1, 1,
-0.9591953, -0.4289242, -5.455381, 0, 0, 0, 1, 1,
-0.9560704, -1.339784, -3.935795, 0, 0, 0, 1, 1,
-0.9417974, 0.6242262, -1.130025, 0, 0, 0, 1, 1,
-0.9307811, -0.7839684, -3.49494, 0, 0, 0, 1, 1,
-0.9217302, -0.8118073, -2.097538, 1, 1, 1, 1, 1,
-0.9204999, -2.293463, -0.4660414, 1, 1, 1, 1, 1,
-0.9167536, -0.7874997, -1.431659, 1, 1, 1, 1, 1,
-0.9166049, 0.5585144, -1.42335, 1, 1, 1, 1, 1,
-0.9154653, -0.3900809, -1.917858, 1, 1, 1, 1, 1,
-0.9122783, -0.8089751, -1.873932, 1, 1, 1, 1, 1,
-0.9105609, -1.374874, -2.019339, 1, 1, 1, 1, 1,
-0.9097146, -0.0281817, -1.878953, 1, 1, 1, 1, 1,
-0.9071098, -0.6487057, -1.679613, 1, 1, 1, 1, 1,
-0.9018524, -0.5857483, -2.969427, 1, 1, 1, 1, 1,
-0.8986465, -2.835224, -1.761326, 1, 1, 1, 1, 1,
-0.896269, -0.1416315, -3.09395, 1, 1, 1, 1, 1,
-0.8960844, -1.487103, -3.970361, 1, 1, 1, 1, 1,
-0.8861097, -0.5540729, -1.843859, 1, 1, 1, 1, 1,
-0.8804464, -1.069775, -1.942333, 1, 1, 1, 1, 1,
-0.8712613, 0.8257964, -0.5424404, 0, 0, 1, 1, 1,
-0.8673325, 2.310745, -0.9293753, 1, 0, 0, 1, 1,
-0.8648453, -0.1084767, -1.57537, 1, 0, 0, 1, 1,
-0.8624386, -1.120383, -0.9981664, 1, 0, 0, 1, 1,
-0.8574484, -0.6262126, -0.6375615, 1, 0, 0, 1, 1,
-0.8522413, 0.05905747, -1.839459, 1, 0, 0, 1, 1,
-0.842879, -2.162864, -2.272095, 0, 0, 0, 1, 1,
-0.8423693, 0.1755099, -1.903288, 0, 0, 0, 1, 1,
-0.8398793, -0.3653387, -1.495832, 0, 0, 0, 1, 1,
-0.8385636, 1.594412, -0.5039334, 0, 0, 0, 1, 1,
-0.8344011, -0.1367182, -2.380612, 0, 0, 0, 1, 1,
-0.8333243, -0.03181428, -1.165404, 0, 0, 0, 1, 1,
-0.8328259, 1.0281, -1.222086, 0, 0, 0, 1, 1,
-0.8311601, 2.39536, -0.7272047, 1, 1, 1, 1, 1,
-0.830364, -0.4704314, -3.233508, 1, 1, 1, 1, 1,
-0.8271036, -0.9270559, -2.238375, 1, 1, 1, 1, 1,
-0.8245994, -0.07606799, 0.0005768944, 1, 1, 1, 1, 1,
-0.8234168, -1.845214, -2.16647, 1, 1, 1, 1, 1,
-0.8216647, 0.4532333, -1.703848, 1, 1, 1, 1, 1,
-0.8209101, 1.583541, -0.1771038, 1, 1, 1, 1, 1,
-0.8161196, 0.4315681, -1.848812, 1, 1, 1, 1, 1,
-0.8156724, -0.5562191, -2.682269, 1, 1, 1, 1, 1,
-0.8017858, -1.038326, -1.458686, 1, 1, 1, 1, 1,
-0.8006121, -0.5450028, -2.759079, 1, 1, 1, 1, 1,
-0.7979234, 0.3263755, 0.3060773, 1, 1, 1, 1, 1,
-0.7940515, 1.078983, -1.716274, 1, 1, 1, 1, 1,
-0.7918476, 0.6707181, -0.2077898, 1, 1, 1, 1, 1,
-0.7837862, -0.5640085, -4.187643, 1, 1, 1, 1, 1,
-0.7826858, 1.660367, -1.580165, 0, 0, 1, 1, 1,
-0.7813512, 1.240103, -0.9953493, 1, 0, 0, 1, 1,
-0.7810944, 0.6486397, -1.489347, 1, 0, 0, 1, 1,
-0.778461, 2.077177, -0.9926888, 1, 0, 0, 1, 1,
-0.7664548, 0.577218, -1.691634, 1, 0, 0, 1, 1,
-0.7620589, 0.8720283, 0.02812857, 1, 0, 0, 1, 1,
-0.7588007, 0.2061804, -2.328775, 0, 0, 0, 1, 1,
-0.7580893, -0.5788502, -2.32765, 0, 0, 0, 1, 1,
-0.7546674, 0.1307445, -2.815653, 0, 0, 0, 1, 1,
-0.7504994, 0.5868101, -1.850304, 0, 0, 0, 1, 1,
-0.7477745, 0.2803456, -1.613607, 0, 0, 0, 1, 1,
-0.7471844, -1.26543, -3.946361, 0, 0, 0, 1, 1,
-0.7453017, -0.04675457, -1.927645, 0, 0, 0, 1, 1,
-0.7323699, -1.916364, -3.956842, 1, 1, 1, 1, 1,
-0.7278606, -1.282656, -2.207152, 1, 1, 1, 1, 1,
-0.7265106, -1.157565, -3.122657, 1, 1, 1, 1, 1,
-0.7228297, 1.653158, 0.2725427, 1, 1, 1, 1, 1,
-0.7182977, 0.4288886, -1.074651, 1, 1, 1, 1, 1,
-0.7182934, 0.2758648, -1.481476, 1, 1, 1, 1, 1,
-0.7174823, -0.1661296, -0.02046772, 1, 1, 1, 1, 1,
-0.7158879, 0.4221361, 0.6683857, 1, 1, 1, 1, 1,
-0.7120367, 0.8771047, -0.7554564, 1, 1, 1, 1, 1,
-0.7109131, -0.9103985, -2.611292, 1, 1, 1, 1, 1,
-0.709631, -1.157454, -3.304678, 1, 1, 1, 1, 1,
-0.7079648, 1.589333, 1.237892, 1, 1, 1, 1, 1,
-0.707814, 1.599161, -2.692084, 1, 1, 1, 1, 1,
-0.7056356, -1.500202, -3.562026, 1, 1, 1, 1, 1,
-0.7047575, -0.2174569, -1.15279, 1, 1, 1, 1, 1,
-0.7030005, -1.095763, -0.8702399, 0, 0, 1, 1, 1,
-0.69914, -0.8056572, -3.672509, 1, 0, 0, 1, 1,
-0.6951129, 0.376175, -1.85302, 1, 0, 0, 1, 1,
-0.6871124, 0.3507016, -0.7526355, 1, 0, 0, 1, 1,
-0.6850513, -0.2976354, -0.3857813, 1, 0, 0, 1, 1,
-0.6830225, 1.624776, -1.245687, 1, 0, 0, 1, 1,
-0.6827224, -0.4823899, -2.682022, 0, 0, 0, 1, 1,
-0.6779816, -0.7666718, -4.428094, 0, 0, 0, 1, 1,
-0.6760981, -0.4058248, -3.303636, 0, 0, 0, 1, 1,
-0.6680412, -0.4233751, -1.573323, 0, 0, 0, 1, 1,
-0.6671268, 0.1161857, -0.6269988, 0, 0, 0, 1, 1,
-0.6669679, -0.448893, -2.362332, 0, 0, 0, 1, 1,
-0.6605757, -0.389697, -1.951085, 0, 0, 0, 1, 1,
-0.6593388, -1.329345, -2.498196, 1, 1, 1, 1, 1,
-0.6588287, 0.2360653, -0.8696269, 1, 1, 1, 1, 1,
-0.6537851, 0.6552235, 0.2213151, 1, 1, 1, 1, 1,
-0.6529003, -0.2482485, -0.8169373, 1, 1, 1, 1, 1,
-0.649677, 0.7703156, -0.5639319, 1, 1, 1, 1, 1,
-0.6487308, 0.5525698, -1.373048, 1, 1, 1, 1, 1,
-0.6485572, -0.8736654, -1.277305, 1, 1, 1, 1, 1,
-0.6467715, -0.4614644, -2.816624, 1, 1, 1, 1, 1,
-0.6401628, 0.2965184, -1.057137, 1, 1, 1, 1, 1,
-0.6365776, -0.3904768, -2.27636, 1, 1, 1, 1, 1,
-0.6350363, -0.08505128, -1.230748, 1, 1, 1, 1, 1,
-0.6267189, -0.2019012, -0.9803365, 1, 1, 1, 1, 1,
-0.6233532, 0.4104169, 0.140612, 1, 1, 1, 1, 1,
-0.620629, -1.581199, -2.84074, 1, 1, 1, 1, 1,
-0.6145008, 1.048758, -0.705806, 1, 1, 1, 1, 1,
-0.6073105, 0.2521817, -1.131303, 0, 0, 1, 1, 1,
-0.6060832, -1.097519, -3.933543, 1, 0, 0, 1, 1,
-0.6048642, 0.1544259, -1.94489, 1, 0, 0, 1, 1,
-0.6028595, -0.7248319, -0.8332077, 1, 0, 0, 1, 1,
-0.6006606, 0.7341544, 0.1115186, 1, 0, 0, 1, 1,
-0.5987546, -0.6107906, -2.211833, 1, 0, 0, 1, 1,
-0.5976647, 0.4120705, 0.04741283, 0, 0, 0, 1, 1,
-0.5955254, 0.8825291, -0.8262395, 0, 0, 0, 1, 1,
-0.5927669, 0.8160379, -0.5552424, 0, 0, 0, 1, 1,
-0.5922803, 0.1714351, -0.9270368, 0, 0, 0, 1, 1,
-0.5899097, 0.962922, 1.052383, 0, 0, 0, 1, 1,
-0.5886053, 0.9604765, -1.540572, 0, 0, 0, 1, 1,
-0.5879146, -0.2247736, -2.797825, 0, 0, 0, 1, 1,
-0.5873867, -1.440043, -3.347139, 1, 1, 1, 1, 1,
-0.5831209, -0.1162524, -1.636417, 1, 1, 1, 1, 1,
-0.5813603, 1.026678, -0.5799437, 1, 1, 1, 1, 1,
-0.5811189, 0.5074412, -0.04425073, 1, 1, 1, 1, 1,
-0.5786871, 0.3776556, -0.9806527, 1, 1, 1, 1, 1,
-0.5781808, 0.445385, -0.9421538, 1, 1, 1, 1, 1,
-0.5753405, -0.6802762, -2.809458, 1, 1, 1, 1, 1,
-0.5749947, 0.5771074, -2.279873, 1, 1, 1, 1, 1,
-0.5692714, 0.5426528, -0.06925297, 1, 1, 1, 1, 1,
-0.5672987, -2.508379, -1.04488, 1, 1, 1, 1, 1,
-0.5599511, 2.450454, 0.7930117, 1, 1, 1, 1, 1,
-0.5527577, 0.999792, -2.034259, 1, 1, 1, 1, 1,
-0.5515061, 0.544539, -1.607273, 1, 1, 1, 1, 1,
-0.547147, -0.7518851, -2.975611, 1, 1, 1, 1, 1,
-0.5461479, -0.2376591, -1.89611, 1, 1, 1, 1, 1,
-0.5430831, 0.2610136, -2.615149, 0, 0, 1, 1, 1,
-0.5426414, 0.9893171, -0.4172685, 1, 0, 0, 1, 1,
-0.5404814, 1.83329, 0.1536079, 1, 0, 0, 1, 1,
-0.5370638, 0.2771284, -2.615384, 1, 0, 0, 1, 1,
-0.5333478, -0.2944937, -0.9709721, 1, 0, 0, 1, 1,
-0.5284149, -0.1470734, -1.94958, 1, 0, 0, 1, 1,
-0.5248327, -0.3378347, -1.581594, 0, 0, 0, 1, 1,
-0.520556, 0.9141943, -1.997357, 0, 0, 0, 1, 1,
-0.5173153, 1.533322, -1.589674, 0, 0, 0, 1, 1,
-0.5098411, -1.021108, -1.774236, 0, 0, 0, 1, 1,
-0.5052687, -0.1080929, -1.129012, 0, 0, 0, 1, 1,
-0.4970259, 0.1554805, -0.6886224, 0, 0, 0, 1, 1,
-0.4929062, -1.332068, -1.586792, 0, 0, 0, 1, 1,
-0.4903175, 0.6453978, 0.3545319, 1, 1, 1, 1, 1,
-0.4888967, -1.194863, -5.315656, 1, 1, 1, 1, 1,
-0.4866499, 3.287701, -2.000608, 1, 1, 1, 1, 1,
-0.4787277, 0.9137068, -1.500873, 1, 1, 1, 1, 1,
-0.4773569, 0.1448201, -2.442148, 1, 1, 1, 1, 1,
-0.4770184, 1.201902, 0.2957126, 1, 1, 1, 1, 1,
-0.4738379, -1.391935, -2.129636, 1, 1, 1, 1, 1,
-0.4731207, 0.1119483, -0.5434191, 1, 1, 1, 1, 1,
-0.4712239, -0.1917177, -1.481788, 1, 1, 1, 1, 1,
-0.4694509, -0.1249539, -1.555499, 1, 1, 1, 1, 1,
-0.4681556, -0.5134416, -3.189125, 1, 1, 1, 1, 1,
-0.4625686, -0.03842638, -0.4315736, 1, 1, 1, 1, 1,
-0.4612068, 0.04805311, -1.768029, 1, 1, 1, 1, 1,
-0.459259, 0.8855268, 0.1880394, 1, 1, 1, 1, 1,
-0.4539531, 0.8188291, 0.3141529, 1, 1, 1, 1, 1,
-0.4520582, 1.532428, 1.385398, 0, 0, 1, 1, 1,
-0.4519763, 1.012229, 0.3121125, 1, 0, 0, 1, 1,
-0.4519185, 0.5681651, -2.973492, 1, 0, 0, 1, 1,
-0.4427223, 2.12691, -0.8596109, 1, 0, 0, 1, 1,
-0.4389165, -0.632071, -2.751235, 1, 0, 0, 1, 1,
-0.4376202, 0.3141809, -0.1127054, 1, 0, 0, 1, 1,
-0.434506, 0.3409517, -2.120876, 0, 0, 0, 1, 1,
-0.425063, 0.2205252, -1.430186, 0, 0, 0, 1, 1,
-0.4248559, -0.5415962, -3.417745, 0, 0, 0, 1, 1,
-0.4239549, 0.9291557, -1.019594, 0, 0, 0, 1, 1,
-0.4223859, -0.2313688, -2.625914, 0, 0, 0, 1, 1,
-0.4210295, -0.5244831, -3.616759, 0, 0, 0, 1, 1,
-0.4193247, 1.5929, -0.3961043, 0, 0, 0, 1, 1,
-0.4180183, -0.200507, -2.575418, 1, 1, 1, 1, 1,
-0.4178177, -0.3188629, -1.283463, 1, 1, 1, 1, 1,
-0.4170816, -0.1404616, -2.288735, 1, 1, 1, 1, 1,
-0.416997, -0.4255852, -1.086284, 1, 1, 1, 1, 1,
-0.4164925, 0.5192555, -1.007254, 1, 1, 1, 1, 1,
-0.4124505, -0.5963357, -4.088802, 1, 1, 1, 1, 1,
-0.4071835, 0.7635653, -1.496884, 1, 1, 1, 1, 1,
-0.4067562, 1.361628, 0.6206127, 1, 1, 1, 1, 1,
-0.4043306, -0.3590454, -2.20034, 1, 1, 1, 1, 1,
-0.4023169, 0.02858257, -2.007917, 1, 1, 1, 1, 1,
-0.3989902, 0.1987625, -1.676111, 1, 1, 1, 1, 1,
-0.3962302, 0.5267503, 0.91516, 1, 1, 1, 1, 1,
-0.3950823, 0.8001959, -2.169314, 1, 1, 1, 1, 1,
-0.3902928, 2.697737, -0.03588843, 1, 1, 1, 1, 1,
-0.3852526, -0.3634582, -0.8376969, 1, 1, 1, 1, 1,
-0.3852407, -0.818245, -1.710011, 0, 0, 1, 1, 1,
-0.3767625, 1.261865, 0.5464774, 1, 0, 0, 1, 1,
-0.371882, -0.6333164, -1.313845, 1, 0, 0, 1, 1,
-0.371636, -1.127384, -4.080207, 1, 0, 0, 1, 1,
-0.371549, 0.3677713, 1.244584, 1, 0, 0, 1, 1,
-0.370035, -2.13639, -3.810636, 1, 0, 0, 1, 1,
-0.3673263, 1.628668, -0.1585369, 0, 0, 0, 1, 1,
-0.361892, -0.6372138, -2.435394, 0, 0, 0, 1, 1,
-0.3604265, 0.8284125, -0.02016318, 0, 0, 0, 1, 1,
-0.3528618, 1.054229, 0.9093502, 0, 0, 0, 1, 1,
-0.351073, -0.05167396, -1.368824, 0, 0, 0, 1, 1,
-0.3488804, -0.3553671, -0.8594108, 0, 0, 0, 1, 1,
-0.3443395, -0.1108246, -2.464573, 0, 0, 0, 1, 1,
-0.3334004, -0.03622536, -0.9719483, 1, 1, 1, 1, 1,
-0.3289053, 0.07786606, -0.6947308, 1, 1, 1, 1, 1,
-0.325546, -0.002497544, -1.206757, 1, 1, 1, 1, 1,
-0.3232848, 0.5213826, -2.355647, 1, 1, 1, 1, 1,
-0.323158, 0.2903017, -1.506915, 1, 1, 1, 1, 1,
-0.3201914, -0.04511639, -0.5401281, 1, 1, 1, 1, 1,
-0.3187099, 1.627552, -2.602257, 1, 1, 1, 1, 1,
-0.317289, -0.7441963, -4.16264, 1, 1, 1, 1, 1,
-0.3165435, 0.3131979, -2.017474, 1, 1, 1, 1, 1,
-0.3075141, 1.001972, -1.226043, 1, 1, 1, 1, 1,
-0.2976889, -0.5310969, -1.900229, 1, 1, 1, 1, 1,
-0.2974196, 0.57917, 0.4841844, 1, 1, 1, 1, 1,
-0.2935444, 0.4606357, -0.6136887, 1, 1, 1, 1, 1,
-0.2925928, 0.9226249, -2.047724, 1, 1, 1, 1, 1,
-0.2890416, 1.434773, 1.518641, 1, 1, 1, 1, 1,
-0.2885317, 0.762855, -1.898517, 0, 0, 1, 1, 1,
-0.2816468, -0.3645963, -2.350449, 1, 0, 0, 1, 1,
-0.2795019, -1.352578, -2.424976, 1, 0, 0, 1, 1,
-0.2794305, -0.8520978, -2.712043, 1, 0, 0, 1, 1,
-0.2705342, -1.533208, -2.694133, 1, 0, 0, 1, 1,
-0.2673461, 0.4774655, -0.6753023, 1, 0, 0, 1, 1,
-0.2609581, -1.547311, -2.84888, 0, 0, 0, 1, 1,
-0.258331, -0.8437995, -2.017333, 0, 0, 0, 1, 1,
-0.2497858, -0.4309858, -2.605754, 0, 0, 0, 1, 1,
-0.2431113, -0.1193142, -2.119209, 0, 0, 0, 1, 1,
-0.2417115, -0.1106931, -1.695121, 0, 0, 0, 1, 1,
-0.2401934, -0.02851545, -2.820659, 0, 0, 0, 1, 1,
-0.2360486, 0.6451892, -0.2233614, 0, 0, 0, 1, 1,
-0.2340682, -0.6812225, -2.672659, 1, 1, 1, 1, 1,
-0.2290052, -1.147127, -3.533808, 1, 1, 1, 1, 1,
-0.2278048, 1.722929, -0.8667402, 1, 1, 1, 1, 1,
-0.2274327, 2.805708, 0.6860109, 1, 1, 1, 1, 1,
-0.2209926, -0.08215196, -2.975732, 1, 1, 1, 1, 1,
-0.2202495, -0.9278589, -5.165731, 1, 1, 1, 1, 1,
-0.2153711, -1.433166, -2.992456, 1, 1, 1, 1, 1,
-0.2139922, 0.2793555, 1.425862, 1, 1, 1, 1, 1,
-0.2119137, -1.701998, -3.808923, 1, 1, 1, 1, 1,
-0.2095574, 0.3397494, -1.52904, 1, 1, 1, 1, 1,
-0.2077684, -0.1646079, -2.154003, 1, 1, 1, 1, 1,
-0.2064772, 0.1722551, -0.5195183, 1, 1, 1, 1, 1,
-0.2058413, -1.006666, -2.846607, 1, 1, 1, 1, 1,
-0.2030714, 0.1970434, -0.103921, 1, 1, 1, 1, 1,
-0.2023631, 1.450066, 0.4202398, 1, 1, 1, 1, 1,
-0.2004196, 0.4063886, -0.08751371, 0, 0, 1, 1, 1,
-0.1962419, 0.6885163, -2.180419, 1, 0, 0, 1, 1,
-0.1959225, -1.362807, -2.364197, 1, 0, 0, 1, 1,
-0.1950746, -0.2320455, -2.225549, 1, 0, 0, 1, 1,
-0.1934244, -0.06316762, -1.060112, 1, 0, 0, 1, 1,
-0.1906291, 0.4912283, -0.1772945, 1, 0, 0, 1, 1,
-0.1891163, -0.9432054, -1.846248, 0, 0, 0, 1, 1,
-0.1887353, -0.3091344, -3.460688, 0, 0, 0, 1, 1,
-0.1874114, -0.5019805, -3.409079, 0, 0, 0, 1, 1,
-0.1870567, 0.9331646, 1.514731, 0, 0, 0, 1, 1,
-0.1865447, -1.41181, -3.600868, 0, 0, 0, 1, 1,
-0.1864027, -0.9860558, -4.915208, 0, 0, 0, 1, 1,
-0.1808547, 0.4274079, 0.1163849, 0, 0, 0, 1, 1,
-0.1806539, -1.585942, -3.042957, 1, 1, 1, 1, 1,
-0.1795371, 0.6604422, -0.5218858, 1, 1, 1, 1, 1,
-0.1792596, 0.01596916, -1.835274, 1, 1, 1, 1, 1,
-0.1773765, -0.4559591, -3.244095, 1, 1, 1, 1, 1,
-0.1768061, 1.334867, 1.809413, 1, 1, 1, 1, 1,
-0.173097, 1.097834, -0.5804117, 1, 1, 1, 1, 1,
-0.1715814, 0.02236056, -1.560542, 1, 1, 1, 1, 1,
-0.1713683, -0.4263354, -2.408082, 1, 1, 1, 1, 1,
-0.1704877, 0.4139911, -0.6256276, 1, 1, 1, 1, 1,
-0.169578, 0.2393261, 0.1094278, 1, 1, 1, 1, 1,
-0.1690026, -1.083345, -2.162381, 1, 1, 1, 1, 1,
-0.1666628, -0.9005365, -2.991373, 1, 1, 1, 1, 1,
-0.1663227, -0.8162994, -2.912792, 1, 1, 1, 1, 1,
-0.1618171, 0.09338839, -0.891977, 1, 1, 1, 1, 1,
-0.1597439, 0.7301825, -2.409897, 1, 1, 1, 1, 1,
-0.1566156, 0.5744777, 1.558821, 0, 0, 1, 1, 1,
-0.1552853, -0.6343, -2.200547, 1, 0, 0, 1, 1,
-0.1551201, -1.59401, -3.257983, 1, 0, 0, 1, 1,
-0.1507291, -0.3776422, -4.820934, 1, 0, 0, 1, 1,
-0.147334, -0.6538734, -2.95421, 1, 0, 0, 1, 1,
-0.1469776, -0.117266, -2.299424, 1, 0, 0, 1, 1,
-0.1453687, 2.54658, -1.024543, 0, 0, 0, 1, 1,
-0.1382555, -0.07429609, -2.834543, 0, 0, 0, 1, 1,
-0.1359404, 0.3763654, -1.257949, 0, 0, 0, 1, 1,
-0.1335582, 0.6246325, 0.4859731, 0, 0, 0, 1, 1,
-0.1324765, 0.9082687, -0.6633369, 0, 0, 0, 1, 1,
-0.1321552, 0.4294343, -0.5530471, 0, 0, 0, 1, 1,
-0.1300955, 0.7007267, -0.4031871, 0, 0, 0, 1, 1,
-0.1298704, 1.623628, -1.611786, 1, 1, 1, 1, 1,
-0.1281018, 0.7583196, 0.9722223, 1, 1, 1, 1, 1,
-0.1266819, -0.2542263, -3.169092, 1, 1, 1, 1, 1,
-0.1250284, -0.9801911, -3.475244, 1, 1, 1, 1, 1,
-0.1248332, 0.3616395, 0.8014559, 1, 1, 1, 1, 1,
-0.1245064, 0.2616575, -1.570414, 1, 1, 1, 1, 1,
-0.1219022, 1.131688, 1.073052, 1, 1, 1, 1, 1,
-0.1193604, 1.644341, -1.703792, 1, 1, 1, 1, 1,
-0.1170222, -1.204315, -3.19151, 1, 1, 1, 1, 1,
-0.1102038, 2.284507, 0.1639539, 1, 1, 1, 1, 1,
-0.1091833, -1.482312, -3.918981, 1, 1, 1, 1, 1,
-0.1055562, -0.7807176, -2.700801, 1, 1, 1, 1, 1,
-0.1037305, 0.7497901, 1.538773, 1, 1, 1, 1, 1,
-0.1025383, 1.874494, 0.1969104, 1, 1, 1, 1, 1,
-0.1024873, 1.148489, 0.7816249, 1, 1, 1, 1, 1,
-0.0945613, 0.4678188, 0.009502139, 0, 0, 1, 1, 1,
-0.09334185, -1.850782, -1.18853, 1, 0, 0, 1, 1,
-0.09049658, -0.560822, -2.547523, 1, 0, 0, 1, 1,
-0.08914686, 0.701322, 0.2733696, 1, 0, 0, 1, 1,
-0.08590335, 0.06918549, -0.4447415, 1, 0, 0, 1, 1,
-0.08005369, 1.106612, 0.3294805, 1, 0, 0, 1, 1,
-0.0797899, -0.4196988, -3.646503, 0, 0, 0, 1, 1,
-0.07763837, 0.3252762, -0.6902451, 0, 0, 0, 1, 1,
-0.07708224, 0.8305035, 0.003322504, 0, 0, 0, 1, 1,
-0.07616819, -0.8672221, -2.781953, 0, 0, 0, 1, 1,
-0.0725334, -1.103711, -4.160121, 0, 0, 0, 1, 1,
-0.07209168, -1.198735, -3.913186, 0, 0, 0, 1, 1,
-0.07020953, 0.3546567, -1.714716, 0, 0, 0, 1, 1,
-0.06857515, 0.07465911, 1.80958, 1, 1, 1, 1, 1,
-0.06658311, -0.3638814, -3.059869, 1, 1, 1, 1, 1,
-0.06651645, 1.020393, -1.800889, 1, 1, 1, 1, 1,
-0.06535648, -1.145366, -2.560967, 1, 1, 1, 1, 1,
-0.06410043, -0.05881926, -1.114904, 1, 1, 1, 1, 1,
-0.06267202, -1.481671, -3.460724, 1, 1, 1, 1, 1,
-0.06204868, 1.262383, 0.01064926, 1, 1, 1, 1, 1,
-0.06159399, -2.211548, -1.848743, 1, 1, 1, 1, 1,
-0.05990757, 0.1442196, -0.6283954, 1, 1, 1, 1, 1,
-0.05759116, 2.995091, -0.4736597, 1, 1, 1, 1, 1,
-0.05756994, 1.741942, 0.9007253, 1, 1, 1, 1, 1,
-0.05391595, 0.2053833, -0.8291048, 1, 1, 1, 1, 1,
-0.04844607, -0.6488257, -2.616107, 1, 1, 1, 1, 1,
-0.04791849, -0.3612384, -2.220296, 1, 1, 1, 1, 1,
-0.04249329, -1.179961, -1.198334, 1, 1, 1, 1, 1,
-0.03972417, -0.1176842, -4.272562, 0, 0, 1, 1, 1,
-0.03857537, 1.139473, -0.04735696, 1, 0, 0, 1, 1,
-0.03556227, 1.051788, 0.8413164, 1, 0, 0, 1, 1,
-0.0340829, 1.653179, -0.5107938, 1, 0, 0, 1, 1,
-0.03006448, -1.092043, -4.040544, 1, 0, 0, 1, 1,
-0.02927111, -0.1968103, -3.552473, 1, 0, 0, 1, 1,
-0.02795039, 1.067241, 0.1932017, 0, 0, 0, 1, 1,
-0.02330252, -1.24025, -4.01878, 0, 0, 0, 1, 1,
-0.02297671, -0.2855113, -1.918361, 0, 0, 0, 1, 1,
-0.01271792, 0.9447562, 0.631181, 0, 0, 0, 1, 1,
-0.01071688, 0.8792936, -0.05565075, 0, 0, 0, 1, 1,
-0.008649679, -1.721659, -1.451008, 0, 0, 0, 1, 1,
-0.005644465, 1.370889, -0.8850176, 0, 0, 0, 1, 1,
-0.001811347, 0.9629979, -0.7598389, 1, 1, 1, 1, 1,
-0.0007121065, 0.04970394, -0.8315909, 1, 1, 1, 1, 1,
0.0002541467, 1.035966, -0.1554111, 1, 1, 1, 1, 1,
0.0003755066, -0.9507625, 4.126379, 1, 1, 1, 1, 1,
0.001128684, -0.4090458, 2.70875, 1, 1, 1, 1, 1,
0.001983847, 1.335951, -0.391695, 1, 1, 1, 1, 1,
0.004982671, 0.6638287, 2.086714, 1, 1, 1, 1, 1,
0.008581261, -0.5292819, 3.495208, 1, 1, 1, 1, 1,
0.01264022, -1.201007, 3.210099, 1, 1, 1, 1, 1,
0.01416654, -0.03070194, 2.704463, 1, 1, 1, 1, 1,
0.0162875, 1.592762, -0.06109143, 1, 1, 1, 1, 1,
0.03356347, 0.6706423, 2.071698, 1, 1, 1, 1, 1,
0.03400638, 1.167656, 1.82346, 1, 1, 1, 1, 1,
0.034213, -0.1791818, 4.271252, 1, 1, 1, 1, 1,
0.03628429, 0.3585925, -0.1654589, 1, 1, 1, 1, 1,
0.03648017, 0.6595053, -1.011435, 0, 0, 1, 1, 1,
0.04075376, 0.7032643, -0.4546064, 1, 0, 0, 1, 1,
0.04210166, -0.1968474, 2.720217, 1, 0, 0, 1, 1,
0.04470441, -0.9779844, 3.626526, 1, 0, 0, 1, 1,
0.0457843, 1.273301, 0.7105085, 1, 0, 0, 1, 1,
0.05165843, 0.4151766, 1.139975, 1, 0, 0, 1, 1,
0.0527516, 0.235142, -0.03239788, 0, 0, 0, 1, 1,
0.05307779, -0.3660614, 3.038892, 0, 0, 0, 1, 1,
0.05406273, -1.807948, 3.0514, 0, 0, 0, 1, 1,
0.05546035, -0.8965369, 2.431416, 0, 0, 0, 1, 1,
0.05617023, -0.3776397, 3.977757, 0, 0, 0, 1, 1,
0.05945243, 1.392752, 1.159718, 0, 0, 0, 1, 1,
0.06137106, 0.3810115, 0.5041475, 0, 0, 0, 1, 1,
0.06290862, 0.3608501, -0.6088398, 1, 1, 1, 1, 1,
0.06883954, 0.6378562, -1.938183, 1, 1, 1, 1, 1,
0.0702666, 1.147528, 0.2825713, 1, 1, 1, 1, 1,
0.07028437, -1.183617, 4.246347, 1, 1, 1, 1, 1,
0.07325357, -0.4559142, 1.103965, 1, 1, 1, 1, 1,
0.07577308, 0.5203169, -0.3280448, 1, 1, 1, 1, 1,
0.07887159, -0.674633, 3.769015, 1, 1, 1, 1, 1,
0.08118596, -0.2010359, 3.89501, 1, 1, 1, 1, 1,
0.08293781, 0.6651309, -0.4534415, 1, 1, 1, 1, 1,
0.08706022, -0.4196288, 2.723093, 1, 1, 1, 1, 1,
0.08758148, 0.9129759, -1.079884, 1, 1, 1, 1, 1,
0.08940718, 1.92478, -0.7962088, 1, 1, 1, 1, 1,
0.09468108, -0.6099385, 1.897732, 1, 1, 1, 1, 1,
0.09751453, 0.2136776, -0.5098325, 1, 1, 1, 1, 1,
0.0983238, -0.5122119, 2.405826, 1, 1, 1, 1, 1,
0.1013735, -1.594549, 2.281529, 0, 0, 1, 1, 1,
0.102289, -0.5615329, 3.051775, 1, 0, 0, 1, 1,
0.1153738, -1.444337, 3.460761, 1, 0, 0, 1, 1,
0.1162261, -0.288397, 2.943568, 1, 0, 0, 1, 1,
0.1162347, 1.907071, -0.6086074, 1, 0, 0, 1, 1,
0.119977, 1.095512, 0.565896, 1, 0, 0, 1, 1,
0.1205166, -0.7814122, 1.863105, 0, 0, 0, 1, 1,
0.1246766, -0.2382902, 2.215133, 0, 0, 0, 1, 1,
0.1306698, 0.4078824, -1.116538, 0, 0, 0, 1, 1,
0.1334885, 2.098382, -0.5446528, 0, 0, 0, 1, 1,
0.1360688, -1.369136, 4.04611, 0, 0, 0, 1, 1,
0.1391814, -0.2742581, 1.065062, 0, 0, 0, 1, 1,
0.1409957, 0.7967406, -0.3282061, 0, 0, 0, 1, 1,
0.142434, -0.8864102, 2.157933, 1, 1, 1, 1, 1,
0.1453945, -0.06685932, 3.375083, 1, 1, 1, 1, 1,
0.1476532, -1.156289, 3.88753, 1, 1, 1, 1, 1,
0.1523671, -0.4715404, 2.203458, 1, 1, 1, 1, 1,
0.1555634, 0.9474167, -0.574857, 1, 1, 1, 1, 1,
0.1560646, 3.042902, 1.978541, 1, 1, 1, 1, 1,
0.164158, 1.185132, 0.411269, 1, 1, 1, 1, 1,
0.1655575, 0.8462688, -0.7020637, 1, 1, 1, 1, 1,
0.1656403, -1.356184, 2.489538, 1, 1, 1, 1, 1,
0.1731262, -0.1370938, 3.535093, 1, 1, 1, 1, 1,
0.1742763, 0.3792231, 0.2104557, 1, 1, 1, 1, 1,
0.178301, -0.9727645, 4.313629, 1, 1, 1, 1, 1,
0.1828256, 0.183605, 2.788288, 1, 1, 1, 1, 1,
0.1828588, -0.02628911, 2.373011, 1, 1, 1, 1, 1,
0.1881378, 1.498991, 0.06631114, 1, 1, 1, 1, 1,
0.190979, -1.023788, 3.02408, 0, 0, 1, 1, 1,
0.1926084, 1.089632, 1.015508, 1, 0, 0, 1, 1,
0.1927107, -0.5369993, 4.790452, 1, 0, 0, 1, 1,
0.2020302, -2.203478, 3.558325, 1, 0, 0, 1, 1,
0.2061909, 0.9470649, -0.1974134, 1, 0, 0, 1, 1,
0.2109604, 0.2917768, 1.226022, 1, 0, 0, 1, 1,
0.213069, -1.070135, 2.688838, 0, 0, 0, 1, 1,
0.2140798, -0.6860708, 4.32162, 0, 0, 0, 1, 1,
0.2156343, -0.1259113, 2.964886, 0, 0, 0, 1, 1,
0.2165758, -0.2679488, 2.205156, 0, 0, 0, 1, 1,
0.2188, -1.992084, 2.52624, 0, 0, 0, 1, 1,
0.2193074, -1.458546, 4.857927, 0, 0, 0, 1, 1,
0.2202414, -0.3357958, 3.860504, 0, 0, 0, 1, 1,
0.2218643, -1.458539, 5.925215, 1, 1, 1, 1, 1,
0.2232424, 1.264529, 0.6410492, 1, 1, 1, 1, 1,
0.2253498, -0.4956497, 3.694827, 1, 1, 1, 1, 1,
0.2272983, -0.7795246, 1.00201, 1, 1, 1, 1, 1,
0.2312022, -0.7865183, 2.465653, 1, 1, 1, 1, 1,
0.2349814, 0.1930525, 1.535559, 1, 1, 1, 1, 1,
0.2350353, 0.2252606, 1.128101, 1, 1, 1, 1, 1,
0.2359302, -0.9296616, 2.980084, 1, 1, 1, 1, 1,
0.2370216, -0.1851063, 2.270447, 1, 1, 1, 1, 1,
0.2450472, 1.977227, 0.4289983, 1, 1, 1, 1, 1,
0.2450808, -0.2320995, 1.411521, 1, 1, 1, 1, 1,
0.2460496, 1.816827, -0.1130655, 1, 1, 1, 1, 1,
0.2518278, 0.9098673, 0.027711, 1, 1, 1, 1, 1,
0.2551654, -0.4018373, 2.537069, 1, 1, 1, 1, 1,
0.2575712, -0.9122358, 1.674908, 1, 1, 1, 1, 1,
0.2608681, -2.526972, 4.499677, 0, 0, 1, 1, 1,
0.2624662, 0.4414955, 0.2064877, 1, 0, 0, 1, 1,
0.2664282, 0.3680995, 1.412317, 1, 0, 0, 1, 1,
0.266544, 0.8095554, 1.953142, 1, 0, 0, 1, 1,
0.2757121, 1.49673, 1.530521, 1, 0, 0, 1, 1,
0.2764572, -1.883205, 4.400552, 1, 0, 0, 1, 1,
0.2783778, -1.456354, 3.157562, 0, 0, 0, 1, 1,
0.2816926, -0.8067677, 3.472444, 0, 0, 0, 1, 1,
0.2829564, 0.1374581, 2.647745, 0, 0, 0, 1, 1,
0.2845809, 1.089263, 1.077056, 0, 0, 0, 1, 1,
0.2849379, 0.5912876, 0.7725682, 0, 0, 0, 1, 1,
0.2863411, 1.241396, -1.099442, 0, 0, 0, 1, 1,
0.2884881, -0.5815346, 2.264585, 0, 0, 0, 1, 1,
0.2917093, -1.584617, 2.636737, 1, 1, 1, 1, 1,
0.2921274, -0.7310546, 4.691459, 1, 1, 1, 1, 1,
0.2936723, 0.9643981, -0.7662373, 1, 1, 1, 1, 1,
0.2941351, 0.06316457, 2.179764, 1, 1, 1, 1, 1,
0.2955844, 1.80293, 0.3141581, 1, 1, 1, 1, 1,
0.2972583, -0.169184, 2.99809, 1, 1, 1, 1, 1,
0.3029259, 0.2676414, 1.743106, 1, 1, 1, 1, 1,
0.3077982, 2.038808, 0.5181959, 1, 1, 1, 1, 1,
0.3150772, -0.4311696, 3.623066, 1, 1, 1, 1, 1,
0.3194318, 0.8966691, 0.1016823, 1, 1, 1, 1, 1,
0.3224029, 1.303994, -1.556959, 1, 1, 1, 1, 1,
0.3228369, -0.4040323, 2.884923, 1, 1, 1, 1, 1,
0.3242193, 1.20217, 0.09912538, 1, 1, 1, 1, 1,
0.3292131, 0.5390931, 2.668615, 1, 1, 1, 1, 1,
0.3317039, -0.2362063, 2.267486, 1, 1, 1, 1, 1,
0.3335145, -0.5220715, 3.266568, 0, 0, 1, 1, 1,
0.3372357, 1.041412, 1.008125, 1, 0, 0, 1, 1,
0.340698, -0.06048191, 2.789203, 1, 0, 0, 1, 1,
0.3412097, -0.6367506, 2.420826, 1, 0, 0, 1, 1,
0.3444278, 1.728788, 0.7674056, 1, 0, 0, 1, 1,
0.3483983, 0.1886041, 0.8466263, 1, 0, 0, 1, 1,
0.3535671, -0.5681432, 2.796845, 0, 0, 0, 1, 1,
0.3552826, 1.085817, -0.7908556, 0, 0, 0, 1, 1,
0.3631938, -1.351088, 2.345648, 0, 0, 0, 1, 1,
0.367498, -0.727083, 2.307351, 0, 0, 0, 1, 1,
0.3703318, 1.341212, 1.444925, 0, 0, 0, 1, 1,
0.3707693, 0.2229217, -1.183398, 0, 0, 0, 1, 1,
0.3812123, 0.4548914, -0.8683155, 0, 0, 0, 1, 1,
0.3847599, 1.73674, 1.525939, 1, 1, 1, 1, 1,
0.3861656, -1.43715, 2.362307, 1, 1, 1, 1, 1,
0.387056, 0.09951132, 3.1814, 1, 1, 1, 1, 1,
0.3871481, -0.2514841, -0.0421793, 1, 1, 1, 1, 1,
0.3931008, 0.2883912, 1.458553, 1, 1, 1, 1, 1,
0.3991282, 0.9109515, -1.211542, 1, 1, 1, 1, 1,
0.405332, 0.3246156, 0.3940858, 1, 1, 1, 1, 1,
0.4067332, 1.077682, 1.811984, 1, 1, 1, 1, 1,
0.4070591, 0.5980601, 0.9149599, 1, 1, 1, 1, 1,
0.4094879, 0.8147745, -0.2126779, 1, 1, 1, 1, 1,
0.4189531, -1.51675, 2.636579, 1, 1, 1, 1, 1,
0.4241283, -0.5606104, 1.374578, 1, 1, 1, 1, 1,
0.4243869, -0.561745, 3.229908, 1, 1, 1, 1, 1,
0.4254327, -0.8547144, 2.400581, 1, 1, 1, 1, 1,
0.4266002, -0.1254798, 2.567623, 1, 1, 1, 1, 1,
0.4275902, -1.616184, 3.0337, 0, 0, 1, 1, 1,
0.4323149, -0.442574, 3.058628, 1, 0, 0, 1, 1,
0.4327165, 0.618517, -0.553289, 1, 0, 0, 1, 1,
0.4386377, 0.6371398, 1.892639, 1, 0, 0, 1, 1,
0.4434561, 0.5681812, 0.6329559, 1, 0, 0, 1, 1,
0.4437274, 1.160623, -0.04478006, 1, 0, 0, 1, 1,
0.4501485, 0.3639237, 1.362476, 0, 0, 0, 1, 1,
0.4516089, 1.170181, 1.530228, 0, 0, 0, 1, 1,
0.4537099, 0.6600654, 2.337599, 0, 0, 0, 1, 1,
0.4573016, -1.136469, 3.933807, 0, 0, 0, 1, 1,
0.4574856, 0.6128588, 0.8527796, 0, 0, 0, 1, 1,
0.4615982, 0.6086312, 2.052356, 0, 0, 0, 1, 1,
0.4632927, 0.4211173, -0.3551387, 0, 0, 0, 1, 1,
0.4642585, 1.442724, 0.07913551, 1, 1, 1, 1, 1,
0.4646233, -0.1535295, 1.839559, 1, 1, 1, 1, 1,
0.4649674, 1.027343, 0.2050695, 1, 1, 1, 1, 1,
0.4728123, 0.4103637, 0.6695082, 1, 1, 1, 1, 1,
0.4769562, -0.2369836, 0.4964235, 1, 1, 1, 1, 1,
0.4771937, -0.8133555, 2.208469, 1, 1, 1, 1, 1,
0.4786544, 1.648828, 0.2840615, 1, 1, 1, 1, 1,
0.4819286, -2.020379, 2.921071, 1, 1, 1, 1, 1,
0.4823803, -2.169075, 2.850414, 1, 1, 1, 1, 1,
0.4828581, 0.6549854, 1.264684, 1, 1, 1, 1, 1,
0.4837911, 0.8611587, -0.403585, 1, 1, 1, 1, 1,
0.4841748, 0.396976, 0.5548, 1, 1, 1, 1, 1,
0.4867976, 0.2582945, 0.8138621, 1, 1, 1, 1, 1,
0.4876534, -1.424849, 2.103513, 1, 1, 1, 1, 1,
0.4882389, 1.089753, 0.9621953, 1, 1, 1, 1, 1,
0.4932208, -2.372388, 3.11662, 0, 0, 1, 1, 1,
0.4935938, -0.5759776, 2.276173, 1, 0, 0, 1, 1,
0.4948568, 2.012575, 0.9415544, 1, 0, 0, 1, 1,
0.4955201, -1.587736, 1.856762, 1, 0, 0, 1, 1,
0.5000997, -1.323259, 2.341469, 1, 0, 0, 1, 1,
0.5038204, 1.783058, -0.9544569, 1, 0, 0, 1, 1,
0.5066493, -1.743268, 3.495324, 0, 0, 0, 1, 1,
0.5110841, -0.483858, -0.1724975, 0, 0, 0, 1, 1,
0.5114852, 0.7771274, 0.1753202, 0, 0, 0, 1, 1,
0.513421, 1.475791, 2.262062, 0, 0, 0, 1, 1,
0.5181787, 0.7423378, 1.177597, 0, 0, 0, 1, 1,
0.5222654, -1.461655, 2.523316, 0, 0, 0, 1, 1,
0.528933, -0.3899394, 2.380388, 0, 0, 0, 1, 1,
0.5308487, -0.04420327, 0.8653883, 1, 1, 1, 1, 1,
0.5315571, 1.020015, 1.075048, 1, 1, 1, 1, 1,
0.5330922, 0.5789139, 0.3659084, 1, 1, 1, 1, 1,
0.5346394, -0.6219405, 1.890952, 1, 1, 1, 1, 1,
0.5373281, 0.2092438, 1.223344, 1, 1, 1, 1, 1,
0.5381449, 1.984164, 1.317555, 1, 1, 1, 1, 1,
0.5409024, -1.640191, 2.590388, 1, 1, 1, 1, 1,
0.545304, -0.3067923, 0.8979962, 1, 1, 1, 1, 1,
0.5464438, -0.3346745, 2.32382, 1, 1, 1, 1, 1,
0.5498931, 0.4173953, 1.061666, 1, 1, 1, 1, 1,
0.5518445, 0.7832308, 3.341927, 1, 1, 1, 1, 1,
0.5521089, -1.579693, 2.691386, 1, 1, 1, 1, 1,
0.553912, 0.8898534, 0.6487744, 1, 1, 1, 1, 1,
0.5539323, 0.1971152, 1.758586, 1, 1, 1, 1, 1,
0.559702, 0.6508583, -0.3031672, 1, 1, 1, 1, 1,
0.5616326, 0.8340458, 0.5208974, 0, 0, 1, 1, 1,
0.5635832, 2.754249, -1.299555, 1, 0, 0, 1, 1,
0.5644567, 1.064031, 1.678164, 1, 0, 0, 1, 1,
0.5681862, 0.2880537, 0.4546081, 1, 0, 0, 1, 1,
0.5709115, -0.9382477, 2.853812, 1, 0, 0, 1, 1,
0.5743942, 0.9986615, -0.4532504, 1, 0, 0, 1, 1,
0.5749591, 0.4914512, 1.343827, 0, 0, 0, 1, 1,
0.5766839, -0.01075957, 2.382918, 0, 0, 0, 1, 1,
0.5767665, 1.273692, 0.4326316, 0, 0, 0, 1, 1,
0.5790597, 0.4517677, 2.178746, 0, 0, 0, 1, 1,
0.5837806, 0.4506107, 0.3720873, 0, 0, 0, 1, 1,
0.5838503, 0.1127954, 1.511665, 0, 0, 0, 1, 1,
0.5841779, 0.3907646, 1.856204, 0, 0, 0, 1, 1,
0.5874964, 0.09074918, -0.2017438, 1, 1, 1, 1, 1,
0.59483, -0.8761144, 2.411738, 1, 1, 1, 1, 1,
0.5957419, 1.662127, 0.6408229, 1, 1, 1, 1, 1,
0.5989972, -0.512114, 1.766969, 1, 1, 1, 1, 1,
0.6079113, -0.4532494, 3.524182, 1, 1, 1, 1, 1,
0.6105525, 0.1381403, 0.01110769, 1, 1, 1, 1, 1,
0.6138133, -0.9288843, 2.499731, 1, 1, 1, 1, 1,
0.6148586, -0.5993447, 2.166896, 1, 1, 1, 1, 1,
0.6155482, -1.154943, 4.515043, 1, 1, 1, 1, 1,
0.6172029, 0.4062822, 0.7820352, 1, 1, 1, 1, 1,
0.6183487, 0.4966342, 1.194211, 1, 1, 1, 1, 1,
0.6190848, -0.3661748, 0.7937912, 1, 1, 1, 1, 1,
0.6217808, 1.499598, -0.9365996, 1, 1, 1, 1, 1,
0.6231764, 2.363959, -2.332275, 1, 1, 1, 1, 1,
0.6236836, -0.4064568, 1.300151, 1, 1, 1, 1, 1,
0.6251698, -1.013224, 3.804659, 0, 0, 1, 1, 1,
0.6262712, -0.7647489, 1.98686, 1, 0, 0, 1, 1,
0.6264066, -0.9875936, 2.25583, 1, 0, 0, 1, 1,
0.6278736, -1.116781, 3.876477, 1, 0, 0, 1, 1,
0.6290188, 1.439925, -1.034817, 1, 0, 0, 1, 1,
0.6300984, 1.734612, -0.4378632, 1, 0, 0, 1, 1,
0.6307387, 0.789822, 1.255833, 0, 0, 0, 1, 1,
0.6382908, 1.042554, 2.077174, 0, 0, 0, 1, 1,
0.6435755, -1.201196, 4.081766, 0, 0, 0, 1, 1,
0.6500815, 0.6252195, 0.6955753, 0, 0, 0, 1, 1,
0.6526987, -1.022646, 2.157527, 0, 0, 0, 1, 1,
0.6582857, -0.08043932, 2.293874, 0, 0, 0, 1, 1,
0.6582888, 1.353171, -1.805099, 0, 0, 0, 1, 1,
0.6638672, -0.7651264, 2.123662, 1, 1, 1, 1, 1,
0.6666505, 1.217434, 1.550762, 1, 1, 1, 1, 1,
0.6716176, -0.5675914, 2.90975, 1, 1, 1, 1, 1,
0.675041, -0.4708272, 3.160001, 1, 1, 1, 1, 1,
0.677679, -0.6804676, 1.123411, 1, 1, 1, 1, 1,
0.6778803, -0.8648121, 3.241747, 1, 1, 1, 1, 1,
0.6799242, 1.303817, 0.0993451, 1, 1, 1, 1, 1,
0.6799672, 1.403619, -0.1392163, 1, 1, 1, 1, 1,
0.6897966, -1.723135, 1.8774, 1, 1, 1, 1, 1,
0.6921768, -0.4958777, 3.271941, 1, 1, 1, 1, 1,
0.6927131, -1.487292, 4.524096, 1, 1, 1, 1, 1,
0.6944867, -0.658514, 0.9225624, 1, 1, 1, 1, 1,
0.6945943, -0.1281089, 3.075344, 1, 1, 1, 1, 1,
0.6952375, -0.8831016, 4.912953, 1, 1, 1, 1, 1,
0.6983391, -1.361995, 3.055991, 1, 1, 1, 1, 1,
0.7063349, -0.6507705, 1.764569, 0, 0, 1, 1, 1,
0.7082393, -0.1590654, 1.279747, 1, 0, 0, 1, 1,
0.7104713, 0.7699215, 0.1519643, 1, 0, 0, 1, 1,
0.7107913, -0.7268564, 1.542973, 1, 0, 0, 1, 1,
0.7138461, 1.104018, 2.816624, 1, 0, 0, 1, 1,
0.7163898, 0.5550944, 0.530421, 1, 0, 0, 1, 1,
0.7211654, 0.4507238, 0.7890759, 0, 0, 0, 1, 1,
0.7223088, -0.9253452, 2.005292, 0, 0, 0, 1, 1,
0.7286004, -0.4707469, 2.674092, 0, 0, 0, 1, 1,
0.7309507, 1.085427, -0.150646, 0, 0, 0, 1, 1,
0.7326351, -0.4916621, 2.701728, 0, 0, 0, 1, 1,
0.7441405, 1.413739, 1.540951, 0, 0, 0, 1, 1,
0.7468849, -1.308289, 2.614835, 0, 0, 0, 1, 1,
0.7494338, -0.3740397, 2.877931, 1, 1, 1, 1, 1,
0.7502828, 1.22071, 0.5207486, 1, 1, 1, 1, 1,
0.7588571, 0.5940185, 0.7613218, 1, 1, 1, 1, 1,
0.7620592, -0.8491431, 2.656699, 1, 1, 1, 1, 1,
0.7705454, -0.00683144, 1.921063, 1, 1, 1, 1, 1,
0.7712735, 1.452467, 1.938631, 1, 1, 1, 1, 1,
0.7795365, -0.04942469, 1.472989, 1, 1, 1, 1, 1,
0.779558, -0.4465063, 2.055297, 1, 1, 1, 1, 1,
0.7799502, 0.02005271, 1.154003, 1, 1, 1, 1, 1,
0.7862339, 1.622315, 1.35012, 1, 1, 1, 1, 1,
0.7865881, -0.4595618, 3.27492, 1, 1, 1, 1, 1,
0.7945321, 0.3213068, 2.357409, 1, 1, 1, 1, 1,
0.7972269, 0.7482776, 0.7847917, 1, 1, 1, 1, 1,
0.8056453, -0.317743, 2.133859, 1, 1, 1, 1, 1,
0.8075693, -0.8067838, 2.722118, 1, 1, 1, 1, 1,
0.8077447, 0.7044552, 1.628047, 0, 0, 1, 1, 1,
0.8120227, 0.01475572, 1.889459, 1, 0, 0, 1, 1,
0.8128997, 1.934819, 1.830532, 1, 0, 0, 1, 1,
0.8133278, 0.4851852, 0.3538888, 1, 0, 0, 1, 1,
0.8180926, 0.4367605, 1.153228, 1, 0, 0, 1, 1,
0.8211816, 0.01912566, 0.0707991, 1, 0, 0, 1, 1,
0.8244304, -0.01574452, 1.803419, 0, 0, 0, 1, 1,
0.8249906, 0.9230702, 0.1001512, 0, 0, 0, 1, 1,
0.8322756, -1.209858, 3.183504, 0, 0, 0, 1, 1,
0.832352, -0.10559, 2.596028, 0, 0, 0, 1, 1,
0.832974, -0.4221217, 2.787606, 0, 0, 0, 1, 1,
0.833504, -0.08793598, -0.5872055, 0, 0, 0, 1, 1,
0.8429144, 0.2841702, 1.814393, 0, 0, 0, 1, 1,
0.846065, -0.4667113, 1.240767, 1, 1, 1, 1, 1,
0.8480339, 0.1066379, 3.749944, 1, 1, 1, 1, 1,
0.851619, -1.278427, 4.410787, 1, 1, 1, 1, 1,
0.8571162, 0.3662732, 0.7527221, 1, 1, 1, 1, 1,
0.8595646, -0.4952649, 3.751657, 1, 1, 1, 1, 1,
0.8647541, -1.10305, 2.140206, 1, 1, 1, 1, 1,
0.8650758, 0.8816224, 0.8044876, 1, 1, 1, 1, 1,
0.870292, 1.246958, 1.930853, 1, 1, 1, 1, 1,
0.870545, 0.4909893, 2.002078, 1, 1, 1, 1, 1,
0.8726112, 0.3773425, 1.987427, 1, 1, 1, 1, 1,
0.8748165, -0.2838419, 0.5742152, 1, 1, 1, 1, 1,
0.8834935, 0.8893944, 0.8303816, 1, 1, 1, 1, 1,
0.8836696, -0.4197026, 2.024093, 1, 1, 1, 1, 1,
0.8890723, -0.08901135, 0.3140571, 1, 1, 1, 1, 1,
0.890192, 0.6216925, 2.537454, 1, 1, 1, 1, 1,
0.8911079, -0.9055564, 4.068686, 0, 0, 1, 1, 1,
0.8929383, -0.2636811, 1.915205, 1, 0, 0, 1, 1,
0.8982025, 0.563172, 1.626891, 1, 0, 0, 1, 1,
0.900075, -1.138533, 3.718041, 1, 0, 0, 1, 1,
0.9050435, 0.652215, 1.620779, 1, 0, 0, 1, 1,
0.9172381, -1.11428, 3.06465, 1, 0, 0, 1, 1,
0.9193971, 1.540096, 0.6393082, 0, 0, 0, 1, 1,
0.9204915, -1.088248, 2.725558, 0, 0, 0, 1, 1,
0.9208044, -0.1645795, 1.168278, 0, 0, 0, 1, 1,
0.9238357, 0.5804331, 0.1676058, 0, 0, 0, 1, 1,
0.9247666, -1.046745, 0.9981613, 0, 0, 0, 1, 1,
0.934817, -1.34605, 2.672666, 0, 0, 0, 1, 1,
0.9349191, 0.8053494, 1.794066, 0, 0, 0, 1, 1,
0.9408491, -0.5235559, 3.308783, 1, 1, 1, 1, 1,
0.949734, -1.353799, 2.944546, 1, 1, 1, 1, 1,
0.9602839, 0.7188558, 2.516384, 1, 1, 1, 1, 1,
0.9614658, -0.2500523, 0.3922308, 1, 1, 1, 1, 1,
0.962805, -1.976336, 3.179491, 1, 1, 1, 1, 1,
0.9639893, -0.3619028, 1.53678, 1, 1, 1, 1, 1,
0.9670796, -0.7073581, 2.4313, 1, 1, 1, 1, 1,
0.9674153, 0.01820065, 1.860958, 1, 1, 1, 1, 1,
0.9688315, 0.6163675, -0.003466821, 1, 1, 1, 1, 1,
0.9735849, 0.3006936, 0.8365186, 1, 1, 1, 1, 1,
0.9740573, 0.6187646, 2.281496, 1, 1, 1, 1, 1,
0.9766105, -0.4507954, 2.626741, 1, 1, 1, 1, 1,
0.976914, 0.3749036, 1.636655, 1, 1, 1, 1, 1,
0.9786542, 0.203002, 1.892624, 1, 1, 1, 1, 1,
0.979745, 1.332147, 1.388173, 1, 1, 1, 1, 1,
0.979836, 0.3828774, 0.82062, 0, 0, 1, 1, 1,
0.9825557, 1.164411, -0.30323, 1, 0, 0, 1, 1,
0.9862825, 0.07011012, 1.95001, 1, 0, 0, 1, 1,
0.9898592, 0.9206607, -0.1282635, 1, 0, 0, 1, 1,
0.9902921, -0.1271193, 1.982087, 1, 0, 0, 1, 1,
0.9905461, 0.5708016, 2.139571, 1, 0, 0, 1, 1,
0.9965284, 0.6433699, 0.9182532, 0, 0, 0, 1, 1,
1.007272, 0.1728299, 2.567398, 0, 0, 0, 1, 1,
1.016459, 0.5263247, 1.864283, 0, 0, 0, 1, 1,
1.031114, -0.12309, 1.484576, 0, 0, 0, 1, 1,
1.034317, -0.5615273, 0.9668187, 0, 0, 0, 1, 1,
1.03822, -0.451198, 3.084854, 0, 0, 0, 1, 1,
1.045601, 1.64825, -0.4501104, 0, 0, 0, 1, 1,
1.054369, 1.493712, 1.581154, 1, 1, 1, 1, 1,
1.054888, 1.414244, 0.7155922, 1, 1, 1, 1, 1,
1.055829, -1.471331, 1.279821, 1, 1, 1, 1, 1,
1.059538, 0.5062825, 1.724024, 1, 1, 1, 1, 1,
1.064222, -0.9705821, 0.9721208, 1, 1, 1, 1, 1,
1.077372, -0.00110909, 1.58803, 1, 1, 1, 1, 1,
1.083039, 0.3335601, -0.4194379, 1, 1, 1, 1, 1,
1.088949, -1.412275, 2.474326, 1, 1, 1, 1, 1,
1.089637, -1.181691, 3.56999, 1, 1, 1, 1, 1,
1.096507, 0.7009995, 1.384717, 1, 1, 1, 1, 1,
1.097626, -0.6254843, 0.5750411, 1, 1, 1, 1, 1,
1.099433, -0.6340325, 2.889501, 1, 1, 1, 1, 1,
1.106144, -0.6160298, 2.378487, 1, 1, 1, 1, 1,
1.107263, -0.8861414, 2.812246, 1, 1, 1, 1, 1,
1.107431, -0.1398071, 1.403468, 1, 1, 1, 1, 1,
1.10839, -0.4537583, 2.856552, 0, 0, 1, 1, 1,
1.109134, 0.694984, 1.560522, 1, 0, 0, 1, 1,
1.112947, 0.9337808, 1.427235, 1, 0, 0, 1, 1,
1.129768, -0.04757683, 1.676743, 1, 0, 0, 1, 1,
1.134954, 1.137697, 0.001435194, 1, 0, 0, 1, 1,
1.135294, -0.7326162, 2.297421, 1, 0, 0, 1, 1,
1.141138, -0.1353835, 1.093642, 0, 0, 0, 1, 1,
1.143388, -0.857666, 2.41566, 0, 0, 0, 1, 1,
1.146299, -0.760983, 2.644175, 0, 0, 0, 1, 1,
1.161579, -0.04748122, 3.291465, 0, 0, 0, 1, 1,
1.164944, 0.1441707, 2.366557, 0, 0, 0, 1, 1,
1.165483, -0.3042319, 1.918942, 0, 0, 0, 1, 1,
1.166123, 0.3531632, 1.954485, 0, 0, 0, 1, 1,
1.169434, -0.4167069, -0.2997397, 1, 1, 1, 1, 1,
1.169883, -0.002132858, 1.846818, 1, 1, 1, 1, 1,
1.173848, -0.6056824, 1.418825, 1, 1, 1, 1, 1,
1.176401, -0.8976184, 0.05272657, 1, 1, 1, 1, 1,
1.180722, 0.06658384, 0.3360751, 1, 1, 1, 1, 1,
1.182893, -1.405379, 3.386042, 1, 1, 1, 1, 1,
1.189264, -0.6034722, 2.593161, 1, 1, 1, 1, 1,
1.197858, -1.173784, 1.383524, 1, 1, 1, 1, 1,
1.208267, -2.023229, 3.837364, 1, 1, 1, 1, 1,
1.208602, 0.5102394, 1.204373, 1, 1, 1, 1, 1,
1.212929, -0.1908004, 2.005577, 1, 1, 1, 1, 1,
1.229665, 0.3930995, 0.1628042, 1, 1, 1, 1, 1,
1.229688, 1.902923, 0.7708298, 1, 1, 1, 1, 1,
1.232574, -0.06200785, 0.9865189, 1, 1, 1, 1, 1,
1.233094, -0.5810173, 3.177022, 1, 1, 1, 1, 1,
1.241694, -1.570652, 2.628814, 0, 0, 1, 1, 1,
1.248308, -0.2031133, 1.971253, 1, 0, 0, 1, 1,
1.252219, 0.2982171, -0.4247099, 1, 0, 0, 1, 1,
1.255171, 0.07109688, -1.17632, 1, 0, 0, 1, 1,
1.257584, -0.9550217, 2.689135, 1, 0, 0, 1, 1,
1.259986, -2.384368, 2.422352, 1, 0, 0, 1, 1,
1.261441, -0.4395589, 2.5905, 0, 0, 0, 1, 1,
1.270872, -0.4750158, 2.555268, 0, 0, 0, 1, 1,
1.279467, 0.5275457, 0.06388471, 0, 0, 0, 1, 1,
1.314572, 1.829517, 0.1073674, 0, 0, 0, 1, 1,
1.315027, -0.1096114, 0.9706609, 0, 0, 0, 1, 1,
1.315165, -0.08569974, 2.507257, 0, 0, 0, 1, 1,
1.319585, -0.7544596, 2.356946, 0, 0, 0, 1, 1,
1.324136, 0.863694, 1.083966, 1, 1, 1, 1, 1,
1.325686, 0.7667558, 0.03803159, 1, 1, 1, 1, 1,
1.333474, -1.142316, 1.028857, 1, 1, 1, 1, 1,
1.336871, -1.331079, 0.6997547, 1, 1, 1, 1, 1,
1.339662, 0.6523167, 0.5486966, 1, 1, 1, 1, 1,
1.341653, 0.4277972, 1.229056, 1, 1, 1, 1, 1,
1.345459, -0.1616618, 2.141085, 1, 1, 1, 1, 1,
1.345957, 0.7841802, -0.5556157, 1, 1, 1, 1, 1,
1.350555, -0.3709224, 2.053796, 1, 1, 1, 1, 1,
1.35181, -1.6251, 2.874856, 1, 1, 1, 1, 1,
1.356059, 0.2327872, 1.269111, 1, 1, 1, 1, 1,
1.358684, -0.5225492, 0.9000421, 1, 1, 1, 1, 1,
1.365382, 1.257303, 1.619117, 1, 1, 1, 1, 1,
1.366228, 0.9711049, -0.7634987, 1, 1, 1, 1, 1,
1.377033, 0.3054407, 1.487462, 1, 1, 1, 1, 1,
1.381213, 1.499502, 0.0371414, 0, 0, 1, 1, 1,
1.381708, -0.1502684, 2.049937, 1, 0, 0, 1, 1,
1.387159, 0.7350338, 1.257609, 1, 0, 0, 1, 1,
1.387657, -0.54072, 0.7431089, 1, 0, 0, 1, 1,
1.391494, 0.6448457, -0.02224934, 1, 0, 0, 1, 1,
1.392561, -0.682772, 3.179699, 1, 0, 0, 1, 1,
1.401559, 0.8571929, -0.5071344, 0, 0, 0, 1, 1,
1.42298, 1.055457, 0.3543745, 0, 0, 0, 1, 1,
1.423771, -1.596883, 0.4217178, 0, 0, 0, 1, 1,
1.425444, -2.176691, 0.1547598, 0, 0, 0, 1, 1,
1.451308, 1.150905, 0.6005298, 0, 0, 0, 1, 1,
1.462035, -1.605872, 3.008445, 0, 0, 0, 1, 1,
1.46454, -0.03694207, 0.6601178, 0, 0, 0, 1, 1,
1.470774, -0.4554002, 3.862314, 1, 1, 1, 1, 1,
1.47295, 0.2707021, 0.4619229, 1, 1, 1, 1, 1,
1.477993, 0.5312101, 0.7731044, 1, 1, 1, 1, 1,
1.489697, 0.07289746, 0.4980199, 1, 1, 1, 1, 1,
1.509187, -0.2782741, 3.696108, 1, 1, 1, 1, 1,
1.510507, -1.797763, 3.18561, 1, 1, 1, 1, 1,
1.511493, -0.2336623, 1.565692, 1, 1, 1, 1, 1,
1.517627, 0.9169689, 0.4356197, 1, 1, 1, 1, 1,
1.529962, -0.03365183, 2.697808, 1, 1, 1, 1, 1,
1.551034, 0.02504238, 1.881449, 1, 1, 1, 1, 1,
1.560534, 0.846127, 1.017877, 1, 1, 1, 1, 1,
1.569825, -1.26744, 1.296199, 1, 1, 1, 1, 1,
1.574646, 0.2461442, 1.236189, 1, 1, 1, 1, 1,
1.578519, 0.608465, 0.3011765, 1, 1, 1, 1, 1,
1.597952, -0.4973968, 2.977554, 1, 1, 1, 1, 1,
1.608311, 0.3465725, 0.9350416, 0, 0, 1, 1, 1,
1.61063, -0.0293161, 0.8411304, 1, 0, 0, 1, 1,
1.618173, 0.5412067, 1.455002, 1, 0, 0, 1, 1,
1.63222, 0.3504363, 0.4798655, 1, 0, 0, 1, 1,
1.634872, 0.5938866, -0.009145563, 1, 0, 0, 1, 1,
1.653887, 2.126382, 2.25019, 1, 0, 0, 1, 1,
1.656242, 0.4296297, 0.5631673, 0, 0, 0, 1, 1,
1.700893, 0.1647402, 1.341351, 0, 0, 0, 1, 1,
1.705749, 1.082494, 1.547443, 0, 0, 0, 1, 1,
1.707702, 0.1343901, 1.343487, 0, 0, 0, 1, 1,
1.713391, 0.6217639, 1.388066, 0, 0, 0, 1, 1,
1.713841, -0.5197207, 2.709262, 0, 0, 0, 1, 1,
1.716418, -0.6988504, 2.68904, 0, 0, 0, 1, 1,
1.731637, 0.3603393, 1.960026, 1, 1, 1, 1, 1,
1.732663, -0.7314416, 2.789207, 1, 1, 1, 1, 1,
1.735618, -1.199769, 3.619742, 1, 1, 1, 1, 1,
1.804489, 0.8796951, 1.146969, 1, 1, 1, 1, 1,
1.807351, -1.124871, 1.689819, 1, 1, 1, 1, 1,
1.818476, 1.396457, 0.5791623, 1, 1, 1, 1, 1,
1.821298, 1.120591, 0.6785656, 1, 1, 1, 1, 1,
1.824912, 1.241176, -0.8416773, 1, 1, 1, 1, 1,
1.825405, -1.290086, 3.02016, 1, 1, 1, 1, 1,
1.832196, 0.6203698, 2.93958, 1, 1, 1, 1, 1,
1.833266, 0.05104283, 1.485065, 1, 1, 1, 1, 1,
1.865921, -0.2910857, 0.9226397, 1, 1, 1, 1, 1,
1.882936, 0.613286, -0.4918035, 1, 1, 1, 1, 1,
1.898873, 1.877558, -0.3107347, 1, 1, 1, 1, 1,
1.932673, 0.8861023, 0.3230886, 1, 1, 1, 1, 1,
1.95783, -1.24827, 2.947486, 0, 0, 1, 1, 1,
2.042977, -0.5904885, 1.989703, 1, 0, 0, 1, 1,
2.053376, 1.295828, 2.883507, 1, 0, 0, 1, 1,
2.090685, -0.05071738, 2.254035, 1, 0, 0, 1, 1,
2.108403, 0.3638146, 2.099927, 1, 0, 0, 1, 1,
2.109344, -1.433846, 1.64401, 1, 0, 0, 1, 1,
2.121412, -0.01932565, 1.460087, 0, 0, 0, 1, 1,
2.175773, 0.07379801, 1.41608, 0, 0, 0, 1, 1,
2.182227, 0.1014755, 2.400161, 0, 0, 0, 1, 1,
2.253756, -0.006991211, 2.091897, 0, 0, 0, 1, 1,
2.275628, 1.518175, 2.228334, 0, 0, 0, 1, 1,
2.317739, 0.5420198, 0.1432454, 0, 0, 0, 1, 1,
2.32945, -1.370196, 0.5887427, 0, 0, 0, 1, 1,
2.388175, 0.3656496, 3.5509, 1, 1, 1, 1, 1,
2.446886, -1.237598, 0.5379041, 1, 1, 1, 1, 1,
2.556729, -1.018609, 2.441313, 1, 1, 1, 1, 1,
2.581666, 0.7025371, 1.693936, 1, 1, 1, 1, 1,
2.608763, 0.2165446, 0.3602684, 1, 1, 1, 1, 1,
2.640763, -0.02122356, 1.261608, 1, 1, 1, 1, 1,
2.917722, -0.4042062, 2.05152, 1, 1, 1, 1, 1
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
var radius = 9.919867;
var distance = 34.84311;
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
mvMatrix.translate( 0.5371481, -0.198756, -0.2349169 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.84311);
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
