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
-4.26915, -0.2788805, -1.877287, 1, 0, 0, 1,
-3.212359, -1.436247, -1.924405, 1, 0.007843138, 0, 1,
-2.836013, 0.2510434, -1.655467, 1, 0.01176471, 0, 1,
-2.797071, -0.6478326, -1.713175, 1, 0.01960784, 0, 1,
-2.52099, 1.778096, -1.233594, 1, 0.02352941, 0, 1,
-2.47399, -0.4470192, -1.167769, 1, 0.03137255, 0, 1,
-2.453332, 1.118935, -0.07867424, 1, 0.03529412, 0, 1,
-2.452097, 0.1665992, -1.47117, 1, 0.04313726, 0, 1,
-2.435177, -1.278207, -2.505434, 1, 0.04705882, 0, 1,
-2.346327, 0.981162, -2.145147, 1, 0.05490196, 0, 1,
-2.325977, -1.356758, -1.555521, 1, 0.05882353, 0, 1,
-2.325362, 0.3185645, -0.5238042, 1, 0.06666667, 0, 1,
-2.272059, -0.8282512, -0.48859, 1, 0.07058824, 0, 1,
-2.227483, 0.6620873, -1.734565, 1, 0.07843138, 0, 1,
-2.227301, 0.6383294, -0.6111907, 1, 0.08235294, 0, 1,
-2.165649, 1.609637, -0.1568683, 1, 0.09019608, 0, 1,
-2.111123, -1.853714, -1.543946, 1, 0.09411765, 0, 1,
-2.100702, -2.887928, -1.809109, 1, 0.1019608, 0, 1,
-2.097471, 0.01639519, -1.60078, 1, 0.1098039, 0, 1,
-2.087715, 0.2149464, -0.9518623, 1, 0.1137255, 0, 1,
-2.070506, -0.2891426, -2.64509, 1, 0.1215686, 0, 1,
-2.037205, -0.7619305, -1.64797, 1, 0.1254902, 0, 1,
-2.034606, -0.07071892, -3.132384, 1, 0.1333333, 0, 1,
-2.031127, -1.610271, -1.525222, 1, 0.1372549, 0, 1,
-2.011961, -0.2289798, -1.856058, 1, 0.145098, 0, 1,
-1.999361, 0.793448, -1.256904, 1, 0.1490196, 0, 1,
-1.971644, 1.591462, -0.8273677, 1, 0.1568628, 0, 1,
-1.955877, 0.9180989, -2.266378, 1, 0.1607843, 0, 1,
-1.902267, 0.587297, 0.5426921, 1, 0.1686275, 0, 1,
-1.896717, 0.2774255, -2.109622, 1, 0.172549, 0, 1,
-1.890271, -0.08844924, -2.45743, 1, 0.1803922, 0, 1,
-1.884577, 0.2034969, -1.853655, 1, 0.1843137, 0, 1,
-1.853236, -0.8493114, -1.32942, 1, 0.1921569, 0, 1,
-1.839985, 0.1351646, -2.976697, 1, 0.1960784, 0, 1,
-1.822741, -1.519562, -1.741524, 1, 0.2039216, 0, 1,
-1.815834, -0.5435377, -0.8719794, 1, 0.2117647, 0, 1,
-1.813702, 1.317522, -1.287947, 1, 0.2156863, 0, 1,
-1.81273, -0.6028274, -2.767923, 1, 0.2235294, 0, 1,
-1.805255, 0.2390693, -3.238063, 1, 0.227451, 0, 1,
-1.775556, 0.8066276, 0.1373702, 1, 0.2352941, 0, 1,
-1.764063, 0.990158, -0.438843, 1, 0.2392157, 0, 1,
-1.74978, -2.131973, -3.935864, 1, 0.2470588, 0, 1,
-1.727847, -1.594108, -3.356467, 1, 0.2509804, 0, 1,
-1.71052, -0.8021489, -0.8049827, 1, 0.2588235, 0, 1,
-1.705285, -0.1026229, -1.530583, 1, 0.2627451, 0, 1,
-1.702884, -1.04478, -0.1140605, 1, 0.2705882, 0, 1,
-1.702618, -0.1378713, -1.460402, 1, 0.2745098, 0, 1,
-1.699559, 0.2855834, -1.839235, 1, 0.282353, 0, 1,
-1.694153, -1.529055, -2.734142, 1, 0.2862745, 0, 1,
-1.679388, 0.6755, -0.914154, 1, 0.2941177, 0, 1,
-1.675295, -0.9962896, -3.962233, 1, 0.3019608, 0, 1,
-1.662557, -0.6239724, -2.411416, 1, 0.3058824, 0, 1,
-1.66128, 0.2099119, -1.785133, 1, 0.3137255, 0, 1,
-1.653066, 1.37623, -1.397228, 1, 0.3176471, 0, 1,
-1.646868, -1.138955, -1.871082, 1, 0.3254902, 0, 1,
-1.627411, -0.132617, -1.255427, 1, 0.3294118, 0, 1,
-1.622198, 0.384654, -2.974162, 1, 0.3372549, 0, 1,
-1.584315, 1.196029, -1.673003, 1, 0.3411765, 0, 1,
-1.579718, -1.46835, -1.881681, 1, 0.3490196, 0, 1,
-1.563669, -0.5198888, -1.363576, 1, 0.3529412, 0, 1,
-1.560735, -0.8876541, -2.590362, 1, 0.3607843, 0, 1,
-1.560311, 0.5669104, 0.1033832, 1, 0.3647059, 0, 1,
-1.553619, 1.108297, -0.08648734, 1, 0.372549, 0, 1,
-1.538262, -0.8809549, -0.0192179, 1, 0.3764706, 0, 1,
-1.522008, -1.717337, -3.146899, 1, 0.3843137, 0, 1,
-1.519987, 1.309449, -1.645081, 1, 0.3882353, 0, 1,
-1.519632, -1.098948, -3.266216, 1, 0.3960784, 0, 1,
-1.507873, 0.1308805, -1.119117, 1, 0.4039216, 0, 1,
-1.507491, 0.4371614, 0.5112258, 1, 0.4078431, 0, 1,
-1.506322, -1.36531, -2.444123, 1, 0.4156863, 0, 1,
-1.50483, -0.8751042, -1.749782, 1, 0.4196078, 0, 1,
-1.503488, -0.2536891, -1.725257, 1, 0.427451, 0, 1,
-1.503453, 0.04809229, -1.949363, 1, 0.4313726, 0, 1,
-1.488205, -1.365782, -2.986203, 1, 0.4392157, 0, 1,
-1.486238, -0.6494768, -2.959987, 1, 0.4431373, 0, 1,
-1.483542, 0.06425801, -1.925615, 1, 0.4509804, 0, 1,
-1.479633, 2.207031, -1.076125, 1, 0.454902, 0, 1,
-1.464049, 0.133469, -2.254956, 1, 0.4627451, 0, 1,
-1.450074, 2.291354, -0.8575183, 1, 0.4666667, 0, 1,
-1.4471, -1.3785, -2.154377, 1, 0.4745098, 0, 1,
-1.442497, 0.04748629, -1.776618, 1, 0.4784314, 0, 1,
-1.440197, 0.03867563, -2.104743, 1, 0.4862745, 0, 1,
-1.421206, 1.341636, 1.282707, 1, 0.4901961, 0, 1,
-1.403137, -0.6635197, -2.04717, 1, 0.4980392, 0, 1,
-1.402694, 0.2235629, -0.2363781, 1, 0.5058824, 0, 1,
-1.398042, -0.8269261, -2.595412, 1, 0.509804, 0, 1,
-1.393492, 1.319316, 0.1234957, 1, 0.5176471, 0, 1,
-1.392907, 1.173885, -2.943619, 1, 0.5215687, 0, 1,
-1.38327, 0.8692459, -1.118925, 1, 0.5294118, 0, 1,
-1.379433, 0.09205005, 0.5631335, 1, 0.5333334, 0, 1,
-1.375681, 1.521517, -1.142199, 1, 0.5411765, 0, 1,
-1.374753, -1.35614, -2.27698, 1, 0.5450981, 0, 1,
-1.350663, -0.13392, -2.298084, 1, 0.5529412, 0, 1,
-1.349374, -1.54992, -3.887731, 1, 0.5568628, 0, 1,
-1.348891, 1.184, -2.503157, 1, 0.5647059, 0, 1,
-1.347588, -2.401352, -2.783166, 1, 0.5686275, 0, 1,
-1.346574, -0.3584313, -1.744742, 1, 0.5764706, 0, 1,
-1.332629, -0.6241875, -1.64011, 1, 0.5803922, 0, 1,
-1.33134, 0.3895485, -0.03849308, 1, 0.5882353, 0, 1,
-1.31835, -0.682164, -2.576395, 1, 0.5921569, 0, 1,
-1.316949, 0.3136541, -1.08831, 1, 0.6, 0, 1,
-1.308889, -0.1869036, -0.964138, 1, 0.6078432, 0, 1,
-1.308148, -0.2347109, -3.204488, 1, 0.6117647, 0, 1,
-1.30765, -0.5900149, -3.042389, 1, 0.6196079, 0, 1,
-1.307634, 0.7921245, -1.379759, 1, 0.6235294, 0, 1,
-1.304643, 1.037828, 0.4233605, 1, 0.6313726, 0, 1,
-1.303517, 0.1565836, -0.5512453, 1, 0.6352941, 0, 1,
-1.298563, 0.1607521, -0.1482716, 1, 0.6431373, 0, 1,
-1.288181, 0.9722697, -0.5911062, 1, 0.6470588, 0, 1,
-1.287862, 0.6896507, -0.1223569, 1, 0.654902, 0, 1,
-1.282184, 0.1076476, -0.3277298, 1, 0.6588235, 0, 1,
-1.281351, -1.699355, -3.072388, 1, 0.6666667, 0, 1,
-1.274109, -0.3240362, -2.694419, 1, 0.6705883, 0, 1,
-1.259398, -0.2109071, -0.6328925, 1, 0.6784314, 0, 1,
-1.247199, 0.2146817, -0.5611641, 1, 0.682353, 0, 1,
-1.235517, 0.1420325, -2.156698, 1, 0.6901961, 0, 1,
-1.224502, 0.986943, -0.2164405, 1, 0.6941177, 0, 1,
-1.222773, -1.047478, -1.398368, 1, 0.7019608, 0, 1,
-1.219869, -1.84401, -2.032564, 1, 0.7098039, 0, 1,
-1.21473, -0.04965655, -3.336568, 1, 0.7137255, 0, 1,
-1.212362, -0.04852981, -1.721111, 1, 0.7215686, 0, 1,
-1.209945, 0.1914644, -1.826372, 1, 0.7254902, 0, 1,
-1.17636, -0.0427492, -0.6511043, 1, 0.7333333, 0, 1,
-1.173138, -0.5446039, -3.224159, 1, 0.7372549, 0, 1,
-1.167831, -0.5879826, -1.318857, 1, 0.7450981, 0, 1,
-1.165666, -1.202866, -2.521282, 1, 0.7490196, 0, 1,
-1.16475, -1.074921, -1.815601, 1, 0.7568628, 0, 1,
-1.145981, -1.077142, -1.708789, 1, 0.7607843, 0, 1,
-1.139372, -0.412091, -1.753402, 1, 0.7686275, 0, 1,
-1.138688, 0.01121369, -1.856904, 1, 0.772549, 0, 1,
-1.136189, -0.5129991, -1.83443, 1, 0.7803922, 0, 1,
-1.135605, -0.0677119, -2.220697, 1, 0.7843137, 0, 1,
-1.13523, -0.2855501, -1.264464, 1, 0.7921569, 0, 1,
-1.127524, 0.2642074, -1.3689, 1, 0.7960784, 0, 1,
-1.120009, 0.1985207, -2.858427, 1, 0.8039216, 0, 1,
-1.109744, 0.9025488, 0.2983502, 1, 0.8117647, 0, 1,
-1.107496, 0.4559754, -0.6326774, 1, 0.8156863, 0, 1,
-1.106332, -0.04278455, -1.386203, 1, 0.8235294, 0, 1,
-1.101255, -1.050202, -1.681023, 1, 0.827451, 0, 1,
-1.097178, -0.3609566, -3.192287, 1, 0.8352941, 0, 1,
-1.093864, -0.1845335, -2.35463, 1, 0.8392157, 0, 1,
-1.092512, -0.4572319, -1.163232, 1, 0.8470588, 0, 1,
-1.081851, -0.9990346, -0.7101827, 1, 0.8509804, 0, 1,
-1.068269, 0.2627333, -0.7247571, 1, 0.8588235, 0, 1,
-1.068036, -0.7358837, -2.376178, 1, 0.8627451, 0, 1,
-1.066648, 0.3163816, -0.03824421, 1, 0.8705882, 0, 1,
-1.060888, 0.0617195, -0.06227014, 1, 0.8745098, 0, 1,
-1.050926, 0.771853, -0.4767074, 1, 0.8823529, 0, 1,
-1.047302, -1.203142, -2.906168, 1, 0.8862745, 0, 1,
-1.040265, -0.5817446, -2.137568, 1, 0.8941177, 0, 1,
-1.03846, 0.9892663, -2.560618, 1, 0.8980392, 0, 1,
-1.035403, -2.03568, -2.083815, 1, 0.9058824, 0, 1,
-1.028162, 1.345537, -0.6136799, 1, 0.9137255, 0, 1,
-1.023791, 0.3339704, -1.601101, 1, 0.9176471, 0, 1,
-1.021694, 0.8837731, 0.05387785, 1, 0.9254902, 0, 1,
-1.019618, -0.1216774, -0.831516, 1, 0.9294118, 0, 1,
-1.016278, -1.69524, -1.673531, 1, 0.9372549, 0, 1,
-1.011735, -0.02242533, -2.678645, 1, 0.9411765, 0, 1,
-1.010743, -0.9852545, -3.108195, 1, 0.9490196, 0, 1,
-1.007399, 1.04756, -0.686916, 1, 0.9529412, 0, 1,
-1.005512, 0.4873583, -1.507169, 1, 0.9607843, 0, 1,
-1.005353, 0.1033364, -1.45753, 1, 0.9647059, 0, 1,
-1.005205, 0.322145, -1.189355, 1, 0.972549, 0, 1,
-1.002416, 0.6970155, -0.3518824, 1, 0.9764706, 0, 1,
-0.9891419, 0.3356037, -1.320427, 1, 0.9843137, 0, 1,
-0.9814823, 0.64991, -0.171701, 1, 0.9882353, 0, 1,
-0.9792505, 0.6892008, -0.7775943, 1, 0.9960784, 0, 1,
-0.975768, -1.487347, -0.8773714, 0.9960784, 1, 0, 1,
-0.9723911, -0.6967133, -1.078295, 0.9921569, 1, 0, 1,
-0.9700552, 1.442227, 1.183185, 0.9843137, 1, 0, 1,
-0.9699655, -0.5651423, -0.5108174, 0.9803922, 1, 0, 1,
-0.9693867, 0.8505546, -1.662218, 0.972549, 1, 0, 1,
-0.9680076, -1.47326, -3.983406, 0.9686275, 1, 0, 1,
-0.9604541, 0.8289422, 0.05451649, 0.9607843, 1, 0, 1,
-0.9548037, 0.8689447, -1.262288, 0.9568627, 1, 0, 1,
-0.9545964, 0.08789532, -1.649724, 0.9490196, 1, 0, 1,
-0.9498785, 0.9664382, -0.02237076, 0.945098, 1, 0, 1,
-0.9482375, 0.2058392, -1.460438, 0.9372549, 1, 0, 1,
-0.9392522, 1.663447, -1.745548, 0.9333333, 1, 0, 1,
-0.9349769, 0.6463018, -0.3942027, 0.9254902, 1, 0, 1,
-0.9285262, -0.4032282, -1.93874, 0.9215686, 1, 0, 1,
-0.9103307, 0.917417, -1.989926, 0.9137255, 1, 0, 1,
-0.9103076, -0.8233272, -2.025168, 0.9098039, 1, 0, 1,
-0.9028406, -0.6543035, -2.007264, 0.9019608, 1, 0, 1,
-0.9014947, -0.9223378, -5.857928, 0.8941177, 1, 0, 1,
-0.8986359, -0.3689001, -1.38451, 0.8901961, 1, 0, 1,
-0.893207, 0.1392386, -2.185086, 0.8823529, 1, 0, 1,
-0.8829889, 0.6963653, -1.339751, 0.8784314, 1, 0, 1,
-0.8804082, 0.05922676, -1.174263, 0.8705882, 1, 0, 1,
-0.8796168, 1.908799, -1.004307, 0.8666667, 1, 0, 1,
-0.876497, 2.770702, -0.1681922, 0.8588235, 1, 0, 1,
-0.873138, -0.0341675, -2.704061, 0.854902, 1, 0, 1,
-0.8717619, 2.874502, -0.3381831, 0.8470588, 1, 0, 1,
-0.8713027, -0.3138798, -0.6557708, 0.8431373, 1, 0, 1,
-0.8708317, 0.7699912, -0.464406, 0.8352941, 1, 0, 1,
-0.8678602, 0.06308758, -1.656681, 0.8313726, 1, 0, 1,
-0.8660192, -0.2959196, -1.683898, 0.8235294, 1, 0, 1,
-0.8659106, -0.05379639, -3.795033, 0.8196079, 1, 0, 1,
-0.8595375, -0.9035483, -0.8442168, 0.8117647, 1, 0, 1,
-0.8577082, 1.424853, -0.6277434, 0.8078431, 1, 0, 1,
-0.8563731, -1.612285, -2.737412, 0.8, 1, 0, 1,
-0.8540924, -0.5674237, -3.747372, 0.7921569, 1, 0, 1,
-0.8509368, -1.566687, -1.259866, 0.7882353, 1, 0, 1,
-0.8497961, -0.5626227, -2.049767, 0.7803922, 1, 0, 1,
-0.8496994, 0.03813254, -0.4551164, 0.7764706, 1, 0, 1,
-0.849525, 0.9341131, -1.816898, 0.7686275, 1, 0, 1,
-0.8460186, 0.4836501, -3.186526, 0.7647059, 1, 0, 1,
-0.8435879, -1.059938, -0.003561843, 0.7568628, 1, 0, 1,
-0.8413772, 0.6661943, -0.9497981, 0.7529412, 1, 0, 1,
-0.8400568, -0.8524238, -2.549913, 0.7450981, 1, 0, 1,
-0.833472, 0.1005508, -1.931015, 0.7411765, 1, 0, 1,
-0.8331186, -1.017622, -2.468714, 0.7333333, 1, 0, 1,
-0.8313026, -0.2028883, -2.950264, 0.7294118, 1, 0, 1,
-0.831301, -1.086219, -3.359194, 0.7215686, 1, 0, 1,
-0.8237597, 0.6824635, -2.618644, 0.7176471, 1, 0, 1,
-0.8180631, 1.02408, -0.8589994, 0.7098039, 1, 0, 1,
-0.8179604, -2.179344, -3.457295, 0.7058824, 1, 0, 1,
-0.8171776, 0.6924824, -2.215541, 0.6980392, 1, 0, 1,
-0.812561, 0.347954, -2.28236, 0.6901961, 1, 0, 1,
-0.8065472, 0.7349839, -2.063046, 0.6862745, 1, 0, 1,
-0.8061571, 0.9838079, -0.9843675, 0.6784314, 1, 0, 1,
-0.8044581, -0.1947009, -1.393178, 0.6745098, 1, 0, 1,
-0.7930382, -1.595272, -2.686215, 0.6666667, 1, 0, 1,
-0.7916523, -1.210984, -3.049847, 0.6627451, 1, 0, 1,
-0.7749596, 0.2307553, -2.331645, 0.654902, 1, 0, 1,
-0.7674269, -0.2835469, -1.238366, 0.6509804, 1, 0, 1,
-0.7671816, -0.02998847, -2.129626, 0.6431373, 1, 0, 1,
-0.7638779, 0.3730675, -1.427238, 0.6392157, 1, 0, 1,
-0.7607966, 0.3111078, -1.868704, 0.6313726, 1, 0, 1,
-0.7552883, 2.203253, -0.2723784, 0.627451, 1, 0, 1,
-0.7537497, -1.357124, -1.408484, 0.6196079, 1, 0, 1,
-0.7449221, -2.149444, -4.414464, 0.6156863, 1, 0, 1,
-0.743364, -1.065028, -2.489415, 0.6078432, 1, 0, 1,
-0.7371863, 0.1732057, -1.086909, 0.6039216, 1, 0, 1,
-0.735534, -1.217455, -1.652097, 0.5960785, 1, 0, 1,
-0.7339733, 0.9328168, 0.4114754, 0.5882353, 1, 0, 1,
-0.7337397, -0.9318451, -3.268154, 0.5843138, 1, 0, 1,
-0.7313027, 1.712739, -1.203196, 0.5764706, 1, 0, 1,
-0.7224958, 0.7120847, -0.3254393, 0.572549, 1, 0, 1,
-0.712528, 1.438795, -0.6670635, 0.5647059, 1, 0, 1,
-0.703522, -1.820966, -2.354239, 0.5607843, 1, 0, 1,
-0.7013381, 0.01156264, 0.7658337, 0.5529412, 1, 0, 1,
-0.7005574, -0.3529018, -1.523768, 0.5490196, 1, 0, 1,
-0.7004502, -0.09349495, -2.548713, 0.5411765, 1, 0, 1,
-0.6986929, -0.7229071, -3.233106, 0.5372549, 1, 0, 1,
-0.6982858, 0.7902763, 0.3910937, 0.5294118, 1, 0, 1,
-0.6962919, 1.686116, 0.5880389, 0.5254902, 1, 0, 1,
-0.6912288, 0.6111859, -2.368734, 0.5176471, 1, 0, 1,
-0.6909544, -0.6993234, -2.891561, 0.5137255, 1, 0, 1,
-0.690831, 0.9674326, -1.139766, 0.5058824, 1, 0, 1,
-0.688816, 0.5753315, -0.9646457, 0.5019608, 1, 0, 1,
-0.6884881, 1.562122, 1.449129, 0.4941176, 1, 0, 1,
-0.684164, -0.7485138, -3.632928, 0.4862745, 1, 0, 1,
-0.6807278, 0.591526, 0.5610376, 0.4823529, 1, 0, 1,
-0.6792893, 2.026155, -1.50102, 0.4745098, 1, 0, 1,
-0.673043, 1.546924, 1.110577, 0.4705882, 1, 0, 1,
-0.6727352, -0.001598255, -1.82444, 0.4627451, 1, 0, 1,
-0.6678749, -1.030483, -3.440506, 0.4588235, 1, 0, 1,
-0.6553716, 1.179157, -2.01816, 0.4509804, 1, 0, 1,
-0.6516488, 1.074717, -0.1169953, 0.4470588, 1, 0, 1,
-0.6495343, -1.575638, -2.613219, 0.4392157, 1, 0, 1,
-0.6421481, -0.5667106, -1.00514, 0.4352941, 1, 0, 1,
-0.6413299, -1.079961, -3.117181, 0.427451, 1, 0, 1,
-0.6410928, 1.206932, -1.32482, 0.4235294, 1, 0, 1,
-0.6354316, -0.6941785, -4.101546, 0.4156863, 1, 0, 1,
-0.6316385, 0.04597634, -0.5430287, 0.4117647, 1, 0, 1,
-0.6212214, -0.2510505, -2.452399, 0.4039216, 1, 0, 1,
-0.6201839, -1.076608, -3.024039, 0.3960784, 1, 0, 1,
-0.617565, -0.4305846, -1.634817, 0.3921569, 1, 0, 1,
-0.614796, -0.3800369, -2.268858, 0.3843137, 1, 0, 1,
-0.6111372, -0.8296551, -3.886983, 0.3803922, 1, 0, 1,
-0.6076467, 0.8593196, -0.3880332, 0.372549, 1, 0, 1,
-0.6047212, 1.091384, 0.0670144, 0.3686275, 1, 0, 1,
-0.5962593, 1.684389, -0.2340859, 0.3607843, 1, 0, 1,
-0.5912595, 1.830757, -0.884928, 0.3568628, 1, 0, 1,
-0.5905382, 0.5873461, -1.388512, 0.3490196, 1, 0, 1,
-0.5884096, -0.2519681, -1.036461, 0.345098, 1, 0, 1,
-0.5868149, -0.7720408, -2.683205, 0.3372549, 1, 0, 1,
-0.5802661, 0.981288, -1.063848, 0.3333333, 1, 0, 1,
-0.5732246, -0.997275, -2.079605, 0.3254902, 1, 0, 1,
-0.5706745, 0.1004686, -1.102198, 0.3215686, 1, 0, 1,
-0.5701919, 0.2499008, -0.9939783, 0.3137255, 1, 0, 1,
-0.5701183, -0.7275254, -2.465776, 0.3098039, 1, 0, 1,
-0.5677374, 0.7321405, -1.027816, 0.3019608, 1, 0, 1,
-0.5626392, 0.9250258, -1.321652, 0.2941177, 1, 0, 1,
-0.5620311, 0.1648761, -1.564559, 0.2901961, 1, 0, 1,
-0.5599841, -1.227341, -3.820453, 0.282353, 1, 0, 1,
-0.559783, -0.3015157, -2.072335, 0.2784314, 1, 0, 1,
-0.5580588, 1.223624, -2.100598, 0.2705882, 1, 0, 1,
-0.5577582, 0.1861926, -0.2741478, 0.2666667, 1, 0, 1,
-0.5566735, -1.383408, -1.814307, 0.2588235, 1, 0, 1,
-0.5533988, -0.365198, -2.164609, 0.254902, 1, 0, 1,
-0.5504798, -0.9847425, -0.9996948, 0.2470588, 1, 0, 1,
-0.5483912, -2.005478, -2.995638, 0.2431373, 1, 0, 1,
-0.547909, 0.4751803, 0.03005227, 0.2352941, 1, 0, 1,
-0.5461414, 0.2128699, -1.117872, 0.2313726, 1, 0, 1,
-0.5433615, 0.008654025, -1.83821, 0.2235294, 1, 0, 1,
-0.5431386, 0.3530885, 0.73617, 0.2196078, 1, 0, 1,
-0.5420064, 0.4023141, -0.9736191, 0.2117647, 1, 0, 1,
-0.5404339, 0.2051505, -1.800444, 0.2078431, 1, 0, 1,
-0.5398937, -0.3603881, -2.833982, 0.2, 1, 0, 1,
-0.5354039, 1.868072, -0.7177616, 0.1921569, 1, 0, 1,
-0.5339639, -0.2573856, -1.025215, 0.1882353, 1, 0, 1,
-0.5303856, -0.971408, -2.956159, 0.1803922, 1, 0, 1,
-0.5224128, -1.776846, -1.432145, 0.1764706, 1, 0, 1,
-0.5197805, 0.7736842, -1.026237, 0.1686275, 1, 0, 1,
-0.518078, -0.2186481, -0.7276407, 0.1647059, 1, 0, 1,
-0.5125052, -1.045985, -3.478735, 0.1568628, 1, 0, 1,
-0.5113934, 1.298874, -1.127755, 0.1529412, 1, 0, 1,
-0.5106732, 0.4506612, -2.167719, 0.145098, 1, 0, 1,
-0.5070561, -0.9377629, -2.259382, 0.1411765, 1, 0, 1,
-0.5064763, -0.3794349, -2.225268, 0.1333333, 1, 0, 1,
-0.5064083, 0.02751125, -2.192882, 0.1294118, 1, 0, 1,
-0.5063214, -0.3922457, -2.813518, 0.1215686, 1, 0, 1,
-0.5018997, -1.390244, -0.3396198, 0.1176471, 1, 0, 1,
-0.5004661, -1.147093, -0.9036154, 0.1098039, 1, 0, 1,
-0.4944316, -1.002964, -3.604615, 0.1058824, 1, 0, 1,
-0.4929061, 1.314706, 0.9358725, 0.09803922, 1, 0, 1,
-0.4912652, -1.165467, -1.953017, 0.09019608, 1, 0, 1,
-0.4897714, -0.3006245, -2.230317, 0.08627451, 1, 0, 1,
-0.4875564, -1.181939, -4.746337, 0.07843138, 1, 0, 1,
-0.4862943, 0.06768955, -1.404499, 0.07450981, 1, 0, 1,
-0.4826643, 1.581608, 1.228684, 0.06666667, 1, 0, 1,
-0.481509, -0.1530705, -3.828983, 0.0627451, 1, 0, 1,
-0.4803099, -0.9331168, -3.027051, 0.05490196, 1, 0, 1,
-0.4770974, 1.131521, -0.7070997, 0.05098039, 1, 0, 1,
-0.4699043, -1.085675, -2.875436, 0.04313726, 1, 0, 1,
-0.4682476, -2.17764, -1.637547, 0.03921569, 1, 0, 1,
-0.4665563, -0.9184313, -4.014723, 0.03137255, 1, 0, 1,
-0.4553191, 0.458476, 0.2468084, 0.02745098, 1, 0, 1,
-0.4515382, 1.26668, -1.070787, 0.01960784, 1, 0, 1,
-0.4481351, -0.3800518, -2.679671, 0.01568628, 1, 0, 1,
-0.4455444, -2.50526, -1.969259, 0.007843138, 1, 0, 1,
-0.4426962, 0.7241986, 1.880403, 0.003921569, 1, 0, 1,
-0.4424922, 2.031513, -0.9909014, 0, 1, 0.003921569, 1,
-0.4331669, -1.825789, -3.70942, 0, 1, 0.01176471, 1,
-0.431735, -1.643133, -0.6158767, 0, 1, 0.01568628, 1,
-0.4283925, 1.580286, -0.945954, 0, 1, 0.02352941, 1,
-0.4262429, 0.2259005, -1.084599, 0, 1, 0.02745098, 1,
-0.4261748, -1.781932, -1.61455, 0, 1, 0.03529412, 1,
-0.4255389, -0.2693379, -1.960115, 0, 1, 0.03921569, 1,
-0.4220835, -0.3369708, -2.468221, 0, 1, 0.04705882, 1,
-0.4219119, 1.122781, -1.041302, 0, 1, 0.05098039, 1,
-0.4171135, 1.43923, -0.3884448, 0, 1, 0.05882353, 1,
-0.4117742, 0.8365579, 0.4058515, 0, 1, 0.0627451, 1,
-0.411525, 1.562161, 0.7142215, 0, 1, 0.07058824, 1,
-0.4108726, -0.4650298, -0.8604622, 0, 1, 0.07450981, 1,
-0.4088256, 0.2649607, -0.2843436, 0, 1, 0.08235294, 1,
-0.4084063, 0.7327201, -0.1589852, 0, 1, 0.08627451, 1,
-0.4024524, 0.05536118, -2.415196, 0, 1, 0.09411765, 1,
-0.3969557, 0.3063798, -1.016065, 0, 1, 0.1019608, 1,
-0.3964761, -1.821263, -3.833803, 0, 1, 0.1058824, 1,
-0.3963008, -0.2573081, -1.655744, 0, 1, 0.1137255, 1,
-0.3926284, 0.8417221, -0.3187658, 0, 1, 0.1176471, 1,
-0.3827247, -0.8035097, -2.950994, 0, 1, 0.1254902, 1,
-0.3813646, 0.503214, -0.4116937, 0, 1, 0.1294118, 1,
-0.3802281, 0.4209942, -1.601895, 0, 1, 0.1372549, 1,
-0.3787385, -1.760968, -3.29833, 0, 1, 0.1411765, 1,
-0.3716606, -0.2807868, -2.187608, 0, 1, 0.1490196, 1,
-0.3705997, -1.240183, -3.460946, 0, 1, 0.1529412, 1,
-0.3665616, -0.7814581, -1.85105, 0, 1, 0.1607843, 1,
-0.364728, -0.4809555, -4.084496, 0, 1, 0.1647059, 1,
-0.3443748, 0.5159621, -0.8687633, 0, 1, 0.172549, 1,
-0.3422952, 0.5558883, -2.063282, 0, 1, 0.1764706, 1,
-0.3420244, -0.7968271, -4.29705, 0, 1, 0.1843137, 1,
-0.3389055, -0.5271102, -3.49285, 0, 1, 0.1882353, 1,
-0.3360453, -1.125258, -3.778125, 0, 1, 0.1960784, 1,
-0.335813, 0.2741023, -0.0459429, 0, 1, 0.2039216, 1,
-0.3329643, -2.236579, -2.869593, 0, 1, 0.2078431, 1,
-0.3316734, 0.7983698, -1.504021, 0, 1, 0.2156863, 1,
-0.3261457, 0.245031, -0.834735, 0, 1, 0.2196078, 1,
-0.3242342, -0.5539398, -0.2937845, 0, 1, 0.227451, 1,
-0.3213497, -0.8023479, -1.250172, 0, 1, 0.2313726, 1,
-0.3202696, 0.4582243, 0.1976362, 0, 1, 0.2392157, 1,
-0.310566, -0.3065866, -2.475945, 0, 1, 0.2431373, 1,
-0.3098633, 0.4136359, -1.687874, 0, 1, 0.2509804, 1,
-0.3064536, -1.910951, -5.053779, 0, 1, 0.254902, 1,
-0.3014956, 0.7110273, -0.982347, 0, 1, 0.2627451, 1,
-0.2996885, 2.420197, -0.9605682, 0, 1, 0.2666667, 1,
-0.2923246, 1.387646, -1.986039, 0, 1, 0.2745098, 1,
-0.2917321, 0.845151, -0.5392095, 0, 1, 0.2784314, 1,
-0.2879199, 0.7685694, 0.283411, 0, 1, 0.2862745, 1,
-0.2860857, 0.780169, -0.3617253, 0, 1, 0.2901961, 1,
-0.2828756, 0.3454729, -0.6134081, 0, 1, 0.2980392, 1,
-0.279004, -0.7038835, -2.43596, 0, 1, 0.3058824, 1,
-0.2790031, 0.6303733, -0.7237831, 0, 1, 0.3098039, 1,
-0.2775241, -1.246214, -4.049362, 0, 1, 0.3176471, 1,
-0.2744461, 1.624257, -1.263192, 0, 1, 0.3215686, 1,
-0.2743829, 0.7746354, 0.7122022, 0, 1, 0.3294118, 1,
-0.2722422, -0.5850744, -1.491256, 0, 1, 0.3333333, 1,
-0.2706426, -0.9773383, -4.401711, 0, 1, 0.3411765, 1,
-0.2701223, 0.3680921, -1.449387, 0, 1, 0.345098, 1,
-0.267508, 0.9092176, -1.153437, 0, 1, 0.3529412, 1,
-0.267308, 0.4522581, 2.17392, 0, 1, 0.3568628, 1,
-0.2655067, 1.003047, 1.326658, 0, 1, 0.3647059, 1,
-0.2641656, 0.6624951, -0.4154862, 0, 1, 0.3686275, 1,
-0.2536234, -1.083633, -2.650202, 0, 1, 0.3764706, 1,
-0.2512398, -0.3450762, -1.078329, 0, 1, 0.3803922, 1,
-0.2504175, -0.7683617, -2.218838, 0, 1, 0.3882353, 1,
-0.2484964, -0.03849588, -1.078956, 0, 1, 0.3921569, 1,
-0.2484794, -0.7576187, -1.727622, 0, 1, 0.4, 1,
-0.2472235, 0.9203445, -0.3012407, 0, 1, 0.4078431, 1,
-0.2421517, -0.5598635, -3.144903, 0, 1, 0.4117647, 1,
-0.2399309, -1.175109, -4.25853, 0, 1, 0.4196078, 1,
-0.2381412, 1.277653, 0.8338175, 0, 1, 0.4235294, 1,
-0.2379516, 1.786493, -1.393344, 0, 1, 0.4313726, 1,
-0.2364645, -0.8271796, -4.042605, 0, 1, 0.4352941, 1,
-0.2354076, -1.563448, -4.187129, 0, 1, 0.4431373, 1,
-0.2259342, -0.5342767, -4.727271, 0, 1, 0.4470588, 1,
-0.2252533, 1.380416, 0.06024702, 0, 1, 0.454902, 1,
-0.2212608, 0.2320654, -0.6412199, 0, 1, 0.4588235, 1,
-0.2174103, -0.09520103, -2.03109, 0, 1, 0.4666667, 1,
-0.2161368, 0.9389657, 1.42878, 0, 1, 0.4705882, 1,
-0.2156689, -0.3851077, -4.815848, 0, 1, 0.4784314, 1,
-0.2134469, -0.7518386, -1.667772, 0, 1, 0.4823529, 1,
-0.2133637, 1.125815, -0.1720139, 0, 1, 0.4901961, 1,
-0.2129243, -0.7821229, -2.787616, 0, 1, 0.4941176, 1,
-0.2085567, -0.2168224, -0.9570221, 0, 1, 0.5019608, 1,
-0.2067627, 0.004037464, -2.385256, 0, 1, 0.509804, 1,
-0.2055201, -0.3845225, -2.868563, 0, 1, 0.5137255, 1,
-0.2051258, 0.8249884, -0.9537138, 0, 1, 0.5215687, 1,
-0.2039386, 0.3071731, -1.176062, 0, 1, 0.5254902, 1,
-0.2033716, 0.0008626349, -1.974049, 0, 1, 0.5333334, 1,
-0.2002431, 0.5610591, 0.9025341, 0, 1, 0.5372549, 1,
-0.1852722, -0.782229, -3.552104, 0, 1, 0.5450981, 1,
-0.1796121, -0.978293, -1.828567, 0, 1, 0.5490196, 1,
-0.1788919, -1.820503, -3.962166, 0, 1, 0.5568628, 1,
-0.1770256, 0.4270837, -1.145565, 0, 1, 0.5607843, 1,
-0.1757347, -0.9214908, -5.827502, 0, 1, 0.5686275, 1,
-0.1747431, 0.6906323, 0.6505224, 0, 1, 0.572549, 1,
-0.1739119, 0.6371863, -1.556011, 0, 1, 0.5803922, 1,
-0.172519, 0.1495828, -0.3392223, 0, 1, 0.5843138, 1,
-0.1723902, 0.7533731, -0.8393252, 0, 1, 0.5921569, 1,
-0.170764, -1.877975, -2.813959, 0, 1, 0.5960785, 1,
-0.1702044, 0.03259547, -3.096836, 0, 1, 0.6039216, 1,
-0.1663339, -0.08469074, -2.09752, 0, 1, 0.6117647, 1,
-0.163085, 0.9145963, -1.852886, 0, 1, 0.6156863, 1,
-0.1625876, 1.214014, -0.1839407, 0, 1, 0.6235294, 1,
-0.1557463, 1.205234, -1.158494, 0, 1, 0.627451, 1,
-0.1556392, -0.166617, -1.80063, 0, 1, 0.6352941, 1,
-0.1549961, 0.4001352, -1.557459, 0, 1, 0.6392157, 1,
-0.1518697, 0.3388074, -1.162618, 0, 1, 0.6470588, 1,
-0.1516529, 0.6362606, -0.6555743, 0, 1, 0.6509804, 1,
-0.1512296, -0.8824249, -1.574652, 0, 1, 0.6588235, 1,
-0.1461485, 1.000221, 0.2463387, 0, 1, 0.6627451, 1,
-0.1417447, 0.1423929, 0.5052539, 0, 1, 0.6705883, 1,
-0.1403656, -0.7175812, -4.09458, 0, 1, 0.6745098, 1,
-0.1401855, -0.3380767, -3.509896, 0, 1, 0.682353, 1,
-0.1376965, 0.3996557, 0.6920267, 0, 1, 0.6862745, 1,
-0.1289899, -0.2348558, -2.191556, 0, 1, 0.6941177, 1,
-0.1277524, -0.7253458, -2.678493, 0, 1, 0.7019608, 1,
-0.118853, 0.949179, -1.272043, 0, 1, 0.7058824, 1,
-0.1188404, 0.5796129, 1.162817, 0, 1, 0.7137255, 1,
-0.1183395, -1.287895, -1.939218, 0, 1, 0.7176471, 1,
-0.1144667, -1.311739, -2.514164, 0, 1, 0.7254902, 1,
-0.1138934, 1.368672, -0.3434629, 0, 1, 0.7294118, 1,
-0.113851, -0.8255101, -4.032025, 0, 1, 0.7372549, 1,
-0.112038, -0.8702989, -4.063072, 0, 1, 0.7411765, 1,
-0.1094813, 1.058496, 1.793548, 0, 1, 0.7490196, 1,
-0.1039258, -1.409647, -4.105539, 0, 1, 0.7529412, 1,
-0.09928646, -0.04187119, -1.932921, 0, 1, 0.7607843, 1,
-0.09920816, 1.22406, 0.06460499, 0, 1, 0.7647059, 1,
-0.09670616, -0.9744424, -3.177789, 0, 1, 0.772549, 1,
-0.09415244, 2.359457, 0.2148319, 0, 1, 0.7764706, 1,
-0.09112205, -0.4707595, -1.465503, 0, 1, 0.7843137, 1,
-0.09049556, 1.571215, -0.9820304, 0, 1, 0.7882353, 1,
-0.0885791, -1.702501, -4.283629, 0, 1, 0.7960784, 1,
-0.08854985, 1.607359, 0.2983089, 0, 1, 0.8039216, 1,
-0.08658832, -2.645858, -5.130219, 0, 1, 0.8078431, 1,
-0.08619543, -0.8067168, -3.802681, 0, 1, 0.8156863, 1,
-0.08080345, -0.3935653, -2.939728, 0, 1, 0.8196079, 1,
-0.07915805, -1.129884, -4.209729, 0, 1, 0.827451, 1,
-0.07412857, -0.07978124, -2.955326, 0, 1, 0.8313726, 1,
-0.07398876, -1.88015, -0.8177007, 0, 1, 0.8392157, 1,
-0.07091902, 0.7748268, -2.01081, 0, 1, 0.8431373, 1,
-0.0702782, 0.1948598, -0.4175061, 0, 1, 0.8509804, 1,
-0.06886113, -1.060279, -2.660581, 0, 1, 0.854902, 1,
-0.06587408, -1.137359, -3.396482, 0, 1, 0.8627451, 1,
-0.05677166, 0.6505449, -0.4700399, 0, 1, 0.8666667, 1,
-0.05621871, -0.2192934, -0.6491994, 0, 1, 0.8745098, 1,
-0.05492072, 0.1700428, 0.5134, 0, 1, 0.8784314, 1,
-0.05047048, 0.522492, 0.3333625, 0, 1, 0.8862745, 1,
-0.04547221, -0.7383057, -3.626282, 0, 1, 0.8901961, 1,
-0.04255389, 1.730251, -0.562933, 0, 1, 0.8980392, 1,
-0.04179708, -0.486385, -4.118128, 0, 1, 0.9058824, 1,
-0.04143983, -1.055885, -2.27319, 0, 1, 0.9098039, 1,
-0.03960834, 0.8980188, 0.786324, 0, 1, 0.9176471, 1,
-0.03941666, -0.9875391, -4.281386, 0, 1, 0.9215686, 1,
-0.03871052, 0.4582483, -0.9095907, 0, 1, 0.9294118, 1,
-0.03837176, -0.608566, -3.304384, 0, 1, 0.9333333, 1,
-0.03626297, -0.2905329, -1.771968, 0, 1, 0.9411765, 1,
-0.0344535, 0.08790127, -2.470978, 0, 1, 0.945098, 1,
-0.03157144, 1.012223, 0.8296187, 0, 1, 0.9529412, 1,
-0.02961723, -0.8867154, -3.536685, 0, 1, 0.9568627, 1,
-0.02869548, 1.241157, 0.4593026, 0, 1, 0.9647059, 1,
-0.02593086, -2.344111, -3.632032, 0, 1, 0.9686275, 1,
-0.01680743, 1.102795, 0.6753478, 0, 1, 0.9764706, 1,
-0.0167549, 0.5216666, 2.566969, 0, 1, 0.9803922, 1,
-0.01552964, -0.1954836, -1.697807, 0, 1, 0.9882353, 1,
-0.0151481, 0.6225755, 0.3551963, 0, 1, 0.9921569, 1,
-0.01429934, -0.222215, -2.853136, 0, 1, 1, 1,
-0.01326091, -0.4970318, -3.083104, 0, 0.9921569, 1, 1,
-0.00784109, 1.723465, 0.4750701, 0, 0.9882353, 1, 1,
-0.007252597, 2.282373, -0.003253972, 0, 0.9803922, 1, 1,
-0.005264676, 1.696852, 1.740165, 0, 0.9764706, 1, 1,
-0.004433098, 2.496195, -1.020514, 0, 0.9686275, 1, 1,
-0.004284817, 1.141751, 1.806041, 0, 0.9647059, 1, 1,
-0.0002106743, 0.2550049, -0.6960105, 0, 0.9568627, 1, 1,
0.0001148616, 0.2277341, 0.8306455, 0, 0.9529412, 1, 1,
0.001746284, 1.32334, -0.04599733, 0, 0.945098, 1, 1,
0.002314318, 0.04805441, 1.05216, 0, 0.9411765, 1, 1,
0.004095908, -1.511189, 3.418179, 0, 0.9333333, 1, 1,
0.006408751, 0.7799595, -0.8701775, 0, 0.9294118, 1, 1,
0.006709758, 2.327254, -1.718687, 0, 0.9215686, 1, 1,
0.01280524, 0.7227646, -0.5198356, 0, 0.9176471, 1, 1,
0.01421694, -0.4396366, 2.756192, 0, 0.9098039, 1, 1,
0.01426551, 1.362766, -1.063299, 0, 0.9058824, 1, 1,
0.01439101, 0.3397506, -1.164784, 0, 0.8980392, 1, 1,
0.0151398, 0.639334, -0.8045717, 0, 0.8901961, 1, 1,
0.01767033, -0.1218216, 3.88403, 0, 0.8862745, 1, 1,
0.01826287, 0.6417819, -0.6144271, 0, 0.8784314, 1, 1,
0.01892718, 1.338625, 0.4150562, 0, 0.8745098, 1, 1,
0.02144505, -0.913092, 2.306667, 0, 0.8666667, 1, 1,
0.02210275, 0.7558899, 0.4522531, 0, 0.8627451, 1, 1,
0.02604067, 2.926728, -1.693655, 0, 0.854902, 1, 1,
0.02650383, -0.6957713, 4.70328, 0, 0.8509804, 1, 1,
0.02733692, 0.8671569, 0.3230159, 0, 0.8431373, 1, 1,
0.02915308, -0.9026478, 2.1325, 0, 0.8392157, 1, 1,
0.03315135, -0.09967261, 4.826338, 0, 0.8313726, 1, 1,
0.03702474, 1.467668, 0.1404495, 0, 0.827451, 1, 1,
0.03749752, 1.101851, -0.01004221, 0, 0.8196079, 1, 1,
0.03816152, 0.5706351, 0.8908289, 0, 0.8156863, 1, 1,
0.03857546, 1.356485, -1.472503, 0, 0.8078431, 1, 1,
0.03972061, 2.234603, 0.4685507, 0, 0.8039216, 1, 1,
0.04578865, 1.133796, 1.298068, 0, 0.7960784, 1, 1,
0.050958, -0.8482295, 2.596998, 0, 0.7882353, 1, 1,
0.05485139, 0.2510329, -0.05008158, 0, 0.7843137, 1, 1,
0.05741832, -0.3853831, 2.988617, 0, 0.7764706, 1, 1,
0.06088778, -0.9932904, 3.390357, 0, 0.772549, 1, 1,
0.06573156, -0.1814372, 0.8979366, 0, 0.7647059, 1, 1,
0.06923297, -0.02086911, 1.308243, 0, 0.7607843, 1, 1,
0.06969228, -1.272326, 3.044653, 0, 0.7529412, 1, 1,
0.07060152, 0.3114072, -1.005439, 0, 0.7490196, 1, 1,
0.07146873, 0.4639722, -0.4901441, 0, 0.7411765, 1, 1,
0.0755655, -1.650248, 2.895429, 0, 0.7372549, 1, 1,
0.07588109, 1.127864, -0.4430788, 0, 0.7294118, 1, 1,
0.07644469, 0.1954449, -0.3797445, 0, 0.7254902, 1, 1,
0.08008772, -1.447406, 2.975552, 0, 0.7176471, 1, 1,
0.08044166, 0.7966944, -0.5089583, 0, 0.7137255, 1, 1,
0.08415717, -0.2219206, 1.610191, 0, 0.7058824, 1, 1,
0.08499393, -1.707254, 2.002079, 0, 0.6980392, 1, 1,
0.08595981, -0.1354288, 2.602853, 0, 0.6941177, 1, 1,
0.09077919, -2.473549, 4.098321, 0, 0.6862745, 1, 1,
0.1018606, -0.3271792, 1.825181, 0, 0.682353, 1, 1,
0.1036973, -0.4422672, 4.186368, 0, 0.6745098, 1, 1,
0.1097174, -0.509986, 3.088651, 0, 0.6705883, 1, 1,
0.1112378, -1.39761, 3.891589, 0, 0.6627451, 1, 1,
0.1116051, 1.188847, 1.478837, 0, 0.6588235, 1, 1,
0.1156579, -0.2850658, 3.155065, 0, 0.6509804, 1, 1,
0.1179105, 0.3636336, 0.9743639, 0, 0.6470588, 1, 1,
0.1219893, 1.683884, 0.7853541, 0, 0.6392157, 1, 1,
0.1222235, 1.818861, 0.02698562, 0, 0.6352941, 1, 1,
0.1297105, 0.4877233, 1.244299, 0, 0.627451, 1, 1,
0.1311062, -0.2551368, 3.470775, 0, 0.6235294, 1, 1,
0.1316924, -1.342681, 1.567212, 0, 0.6156863, 1, 1,
0.1346761, 0.4209365, 0.7983702, 0, 0.6117647, 1, 1,
0.1371865, -0.4730403, 2.43323, 0, 0.6039216, 1, 1,
0.1401566, 0.9151513, 0.3912516, 0, 0.5960785, 1, 1,
0.1407921, 0.09437478, -0.03708718, 0, 0.5921569, 1, 1,
0.149877, 0.007567838, 0.1243213, 0, 0.5843138, 1, 1,
0.1499668, 0.4188696, 0.1185688, 0, 0.5803922, 1, 1,
0.1588556, 0.9808574, -0.3545701, 0, 0.572549, 1, 1,
0.1612016, 0.5893065, 1.934732, 0, 0.5686275, 1, 1,
0.1612313, -0.7013181, 3.712856, 0, 0.5607843, 1, 1,
0.1615534, -0.7496035, 2.739785, 0, 0.5568628, 1, 1,
0.1663641, -0.6885211, 3.74093, 0, 0.5490196, 1, 1,
0.1738304, 0.1091841, -0.09278729, 0, 0.5450981, 1, 1,
0.1771933, 1.362923, 1.948012, 0, 0.5372549, 1, 1,
0.1800735, 0.2239414, 1.166434, 0, 0.5333334, 1, 1,
0.1812877, -0.7773513, 4.090216, 0, 0.5254902, 1, 1,
0.1822758, -1.693135, 2.456877, 0, 0.5215687, 1, 1,
0.1836572, 0.9932667, -0.8195177, 0, 0.5137255, 1, 1,
0.1868988, 0.1117222, 2.605779, 0, 0.509804, 1, 1,
0.189902, -0.7048234, 2.655892, 0, 0.5019608, 1, 1,
0.1932835, -0.1040334, 2.778476, 0, 0.4941176, 1, 1,
0.1934396, -1.053639, 1.776533, 0, 0.4901961, 1, 1,
0.1995127, -0.437252, 3.070636, 0, 0.4823529, 1, 1,
0.1998907, -1.238707, 2.027758, 0, 0.4784314, 1, 1,
0.2057187, 1.790542, 0.8697481, 0, 0.4705882, 1, 1,
0.2071759, 1.557434, 0.2445904, 0, 0.4666667, 1, 1,
0.2075337, 0.7702365, -1.264734, 0, 0.4588235, 1, 1,
0.2088401, -0.6001432, 2.390381, 0, 0.454902, 1, 1,
0.2104376, 1.750768, 0.9187419, 0, 0.4470588, 1, 1,
0.212316, 0.06335513, 1.158191, 0, 0.4431373, 1, 1,
0.2143516, -0.023247, 4.209002, 0, 0.4352941, 1, 1,
0.21557, 0.5917155, -0.5637202, 0, 0.4313726, 1, 1,
0.216262, 1.444929, 0.4262011, 0, 0.4235294, 1, 1,
0.2169905, -0.3310409, 2.99698, 0, 0.4196078, 1, 1,
0.2176471, 1.156822, 0.4505498, 0, 0.4117647, 1, 1,
0.2193579, -0.7030539, 1.48614, 0, 0.4078431, 1, 1,
0.2207495, -1.627767, 0.6441876, 0, 0.4, 1, 1,
0.2217258, 0.2206956, 1.408922, 0, 0.3921569, 1, 1,
0.224411, -1.008423, 1.634928, 0, 0.3882353, 1, 1,
0.2319101, -0.1646117, 3.240843, 0, 0.3803922, 1, 1,
0.2329378, 1.566742, 0.405473, 0, 0.3764706, 1, 1,
0.2376765, 0.0742944, 2.926428, 0, 0.3686275, 1, 1,
0.2383413, 1.46463, 1.045493, 0, 0.3647059, 1, 1,
0.242589, -0.1481309, 1.458668, 0, 0.3568628, 1, 1,
0.246416, 0.9234375, 1.622879, 0, 0.3529412, 1, 1,
0.2503496, -1.017765, 4.038208, 0, 0.345098, 1, 1,
0.2535207, -1.295367, 1.730024, 0, 0.3411765, 1, 1,
0.2547306, -0.5305986, 4.539671, 0, 0.3333333, 1, 1,
0.255845, 0.5463915, 1.049888, 0, 0.3294118, 1, 1,
0.2566308, -0.284578, 4.369886, 0, 0.3215686, 1, 1,
0.2639083, -1.765082, 3.982705, 0, 0.3176471, 1, 1,
0.2642142, -0.5220784, 2.422314, 0, 0.3098039, 1, 1,
0.2680894, 1.20206, 0.8197379, 0, 0.3058824, 1, 1,
0.2686692, -0.7121798, 3.58606, 0, 0.2980392, 1, 1,
0.2833745, 0.1664914, 0.1693745, 0, 0.2901961, 1, 1,
0.2834377, -0.3765396, 1.594399, 0, 0.2862745, 1, 1,
0.2842863, 0.354822, 1.017905, 0, 0.2784314, 1, 1,
0.2850894, 0.3804528, 2.572725, 0, 0.2745098, 1, 1,
0.2867299, 0.3806783, 0.2549169, 0, 0.2666667, 1, 1,
0.2914814, -0.6101204, 2.022095, 0, 0.2627451, 1, 1,
0.2965943, -1.896925, 3.050472, 0, 0.254902, 1, 1,
0.2996972, -0.273699, 3.906138, 0, 0.2509804, 1, 1,
0.3019277, -0.02864915, 2.344869, 0, 0.2431373, 1, 1,
0.309265, 1.10541, -1.801405, 0, 0.2392157, 1, 1,
0.3152104, 0.9533997, -0.1307151, 0, 0.2313726, 1, 1,
0.3226714, 0.3663022, 2.598033, 0, 0.227451, 1, 1,
0.3243548, -1.12004, 2.095419, 0, 0.2196078, 1, 1,
0.3293262, 0.410483, 0.3558753, 0, 0.2156863, 1, 1,
0.3296618, -0.2085463, 2.564492, 0, 0.2078431, 1, 1,
0.330058, -0.8034123, 3.402572, 0, 0.2039216, 1, 1,
0.3304502, -0.802423, 3.186383, 0, 0.1960784, 1, 1,
0.3310072, 1.390055, 0.256473, 0, 0.1882353, 1, 1,
0.3368277, -0.8501309, 2.776042, 0, 0.1843137, 1, 1,
0.3368376, -1.465241, 2.603063, 0, 0.1764706, 1, 1,
0.3370147, -0.8887235, 3.043227, 0, 0.172549, 1, 1,
0.3384589, -0.2486502, 0.6262789, 0, 0.1647059, 1, 1,
0.3406208, -0.5648822, 2.254857, 0, 0.1607843, 1, 1,
0.3465649, -0.7556608, 3.068677, 0, 0.1529412, 1, 1,
0.3488558, -0.5002604, 2.341919, 0, 0.1490196, 1, 1,
0.3549019, 0.2339187, 1.726242, 0, 0.1411765, 1, 1,
0.3567491, -0.5595136, 2.959867, 0, 0.1372549, 1, 1,
0.3652484, -0.298378, -0.9027265, 0, 0.1294118, 1, 1,
0.3653968, -0.5327723, 2.338918, 0, 0.1254902, 1, 1,
0.3670991, 0.4249766, 0.3597706, 0, 0.1176471, 1, 1,
0.3680125, -1.422413, 1.705603, 0, 0.1137255, 1, 1,
0.3777786, 0.9225411, -0.03864356, 0, 0.1058824, 1, 1,
0.3890469, -0.5814002, 2.769073, 0, 0.09803922, 1, 1,
0.3892547, 1.604681, -1.738482, 0, 0.09411765, 1, 1,
0.3900093, 0.6599977, 1.18431, 0, 0.08627451, 1, 1,
0.3920385, 0.1384485, 1.01422, 0, 0.08235294, 1, 1,
0.3924671, -1.31978, 2.914035, 0, 0.07450981, 1, 1,
0.39268, 0.962841, 0.2141949, 0, 0.07058824, 1, 1,
0.3981869, 0.1542151, 1.300122, 0, 0.0627451, 1, 1,
0.3991279, 0.07869127, 0.8101605, 0, 0.05882353, 1, 1,
0.3996874, 0.5355028, 1.372882, 0, 0.05098039, 1, 1,
0.4022763, -1.116935, 2.016144, 0, 0.04705882, 1, 1,
0.4032681, 1.325236, 0.1570455, 0, 0.03921569, 1, 1,
0.404285, 1.124952, 0.2925963, 0, 0.03529412, 1, 1,
0.4105223, 1.168939, 0.1338746, 0, 0.02745098, 1, 1,
0.4176322, -0.6893279, 2.514567, 0, 0.02352941, 1, 1,
0.4195812, 1.233926, 0.8984672, 0, 0.01568628, 1, 1,
0.4204151, -1.774628, 3.699288, 0, 0.01176471, 1, 1,
0.4218204, 1.197872, -1.459662, 0, 0.003921569, 1, 1,
0.4237599, 1.373762, -0.9526566, 0.003921569, 0, 1, 1,
0.4256114, -0.5550036, 3.960949, 0.007843138, 0, 1, 1,
0.4266288, 0.7420086, 1.292184, 0.01568628, 0, 1, 1,
0.4298629, 1.161918, -0.4707351, 0.01960784, 0, 1, 1,
0.4317676, 0.5581976, -0.1774584, 0.02745098, 0, 1, 1,
0.4321667, -1.088326, 3.029097, 0.03137255, 0, 1, 1,
0.4395947, 1.966526, 1.8891, 0.03921569, 0, 1, 1,
0.4412748, -1.387867, 3.176815, 0.04313726, 0, 1, 1,
0.4434862, 2.579197, -1.686763, 0.05098039, 0, 1, 1,
0.4465509, -1.488708, 3.251369, 0.05490196, 0, 1, 1,
0.4485434, -0.6650541, 2.445753, 0.0627451, 0, 1, 1,
0.4488501, -0.4186786, 3.444724, 0.06666667, 0, 1, 1,
0.4547512, 2.350387, -0.6635113, 0.07450981, 0, 1, 1,
0.458125, -0.5670103, 3.723608, 0.07843138, 0, 1, 1,
0.4608954, -1.333778, 2.677733, 0.08627451, 0, 1, 1,
0.4611469, -0.609119, 3.380509, 0.09019608, 0, 1, 1,
0.4659863, 1.278997, -0.4513563, 0.09803922, 0, 1, 1,
0.4691718, -0.9200532, 1.439642, 0.1058824, 0, 1, 1,
0.4711427, 0.4699608, 0.2302262, 0.1098039, 0, 1, 1,
0.4734225, 1.641784, 0.2733161, 0.1176471, 0, 1, 1,
0.4747089, 0.2510623, 1.108309, 0.1215686, 0, 1, 1,
0.4767031, 0.5829461, -0.4450101, 0.1294118, 0, 1, 1,
0.4769481, 1.122492, 2.225463, 0.1333333, 0, 1, 1,
0.4817995, 0.4848702, -0.4578548, 0.1411765, 0, 1, 1,
0.4843341, -0.3312213, 1.641342, 0.145098, 0, 1, 1,
0.4848422, -1.365508, 3.914069, 0.1529412, 0, 1, 1,
0.4910508, 1.350805, 1.299928, 0.1568628, 0, 1, 1,
0.493729, 0.3572816, 0.7823258, 0.1647059, 0, 1, 1,
0.4970621, 0.2443013, 2.582786, 0.1686275, 0, 1, 1,
0.4980454, -1.442746, 3.205719, 0.1764706, 0, 1, 1,
0.498528, 1.025892, 2.192551, 0.1803922, 0, 1, 1,
0.4995957, -1.010857, 2.217398, 0.1882353, 0, 1, 1,
0.5022349, 1.966547, 3.528561, 0.1921569, 0, 1, 1,
0.5100746, -0.7905249, 1.648134, 0.2, 0, 1, 1,
0.5148367, 0.8192406, 1.291615, 0.2078431, 0, 1, 1,
0.5219167, 1.945131, 2.239795, 0.2117647, 0, 1, 1,
0.5231875, 0.06569874, 2.225228, 0.2196078, 0, 1, 1,
0.524002, 0.4722918, 0.8379207, 0.2235294, 0, 1, 1,
0.5254563, -0.5767982, 2.711188, 0.2313726, 0, 1, 1,
0.5274175, -0.6458579, 2.398849, 0.2352941, 0, 1, 1,
0.5316846, 0.5724316, 1.886211, 0.2431373, 0, 1, 1,
0.5345189, -0.2499343, 2.500342, 0.2470588, 0, 1, 1,
0.5353574, 0.5128909, -1.676654, 0.254902, 0, 1, 1,
0.5354241, -0.01444101, 3.114925, 0.2588235, 0, 1, 1,
0.5360861, 0.9179265, 0.4325446, 0.2666667, 0, 1, 1,
0.5395468, 0.2649625, 1.236466, 0.2705882, 0, 1, 1,
0.5402638, -0.09278169, 1.178922, 0.2784314, 0, 1, 1,
0.5421777, 1.174214, 0.2267243, 0.282353, 0, 1, 1,
0.5446776, -0.3046808, 1.031314, 0.2901961, 0, 1, 1,
0.544687, 0.6251902, 3.007119, 0.2941177, 0, 1, 1,
0.5455652, 1.099385, 1.565413, 0.3019608, 0, 1, 1,
0.5462189, 0.1449191, 1.638078, 0.3098039, 0, 1, 1,
0.5495551, -0.5485383, 3.187981, 0.3137255, 0, 1, 1,
0.5544525, 0.6544078, 0.5332015, 0.3215686, 0, 1, 1,
0.5550646, 0.4039024, 1.460228, 0.3254902, 0, 1, 1,
0.5616623, 0.9021413, 0.6544148, 0.3333333, 0, 1, 1,
0.56503, -0.7676924, 1.797914, 0.3372549, 0, 1, 1,
0.5673164, -0.009989426, 3.016769, 0.345098, 0, 1, 1,
0.567318, 0.4708426, -0.01577789, 0.3490196, 0, 1, 1,
0.5688147, 0.2582429, 0.963293, 0.3568628, 0, 1, 1,
0.5706061, 0.5872195, 1.363671, 0.3607843, 0, 1, 1,
0.5744222, 0.4996701, 1.654669, 0.3686275, 0, 1, 1,
0.5776467, -0.06264195, 2.371684, 0.372549, 0, 1, 1,
0.5825659, -0.539759, 2.151217, 0.3803922, 0, 1, 1,
0.585849, 1.381521, 1.888365, 0.3843137, 0, 1, 1,
0.5860983, -1.839123, 3.623028, 0.3921569, 0, 1, 1,
0.5864449, 0.532748, 2.126304, 0.3960784, 0, 1, 1,
0.5929022, -0.1719451, 2.697239, 0.4039216, 0, 1, 1,
0.6022613, 0.6676626, 0.4305358, 0.4117647, 0, 1, 1,
0.6049553, 2.133025, -1.090724, 0.4156863, 0, 1, 1,
0.6116784, 0.6404946, -0.4552776, 0.4235294, 0, 1, 1,
0.6127201, 0.1491732, 0.09071919, 0.427451, 0, 1, 1,
0.6196233, -0.7050544, 2.458107, 0.4352941, 0, 1, 1,
0.6230434, 0.2728549, 0.3780645, 0.4392157, 0, 1, 1,
0.6233068, -1.369898, 2.473975, 0.4470588, 0, 1, 1,
0.6339815, 1.120456, 1.123777, 0.4509804, 0, 1, 1,
0.6402514, -0.5911453, 3.93283, 0.4588235, 0, 1, 1,
0.6457824, 0.3130841, 1.214585, 0.4627451, 0, 1, 1,
0.6463096, -0.5956857, 0.09753254, 0.4705882, 0, 1, 1,
0.6484007, -0.6208553, 2.113422, 0.4745098, 0, 1, 1,
0.6551571, -0.4533383, 1.635992, 0.4823529, 0, 1, 1,
0.6574056, -1.189583, 2.920495, 0.4862745, 0, 1, 1,
0.6584866, -0.6488823, 2.685116, 0.4941176, 0, 1, 1,
0.6615484, 1.073763, 1.047815, 0.5019608, 0, 1, 1,
0.6617873, 2.762873, 0.2416871, 0.5058824, 0, 1, 1,
0.6622989, 1.591166, -0.8135138, 0.5137255, 0, 1, 1,
0.6660365, -1.325534, 3.525268, 0.5176471, 0, 1, 1,
0.6734446, 0.6159548, 1.887919, 0.5254902, 0, 1, 1,
0.6749918, -1.341152, 3.421459, 0.5294118, 0, 1, 1,
0.6775737, 0.7598936, 1.247079, 0.5372549, 0, 1, 1,
0.6790018, -1.235167, 4.338006, 0.5411765, 0, 1, 1,
0.6867937, 0.008865937, 3.083927, 0.5490196, 0, 1, 1,
0.6882136, -0.5841199, 2.082322, 0.5529412, 0, 1, 1,
0.6949746, 0.175537, 2.310921, 0.5607843, 0, 1, 1,
0.6965301, 0.115668, 0.730785, 0.5647059, 0, 1, 1,
0.6973689, -0.4877543, -0.4324182, 0.572549, 0, 1, 1,
0.6978702, -1.060198, 3.307398, 0.5764706, 0, 1, 1,
0.7001089, 0.5903366, 0.5031635, 0.5843138, 0, 1, 1,
0.7008197, -1.3102, 0.7069647, 0.5882353, 0, 1, 1,
0.7034826, 0.1247425, 0.469929, 0.5960785, 0, 1, 1,
0.7119586, 1.148741, 0.2395153, 0.6039216, 0, 1, 1,
0.7122155, 0.3989365, 0.731812, 0.6078432, 0, 1, 1,
0.7140663, -1.405483, 4.219688, 0.6156863, 0, 1, 1,
0.7149503, 1.374373, 0.8424655, 0.6196079, 0, 1, 1,
0.7155884, -0.2541842, 1.628942, 0.627451, 0, 1, 1,
0.7200778, 1.364064, -0.6080625, 0.6313726, 0, 1, 1,
0.7218763, -0.7972105, 1.056034, 0.6392157, 0, 1, 1,
0.724189, -1.056979, 2.411221, 0.6431373, 0, 1, 1,
0.7258154, 0.0212868, 2.209609, 0.6509804, 0, 1, 1,
0.7291841, -0.415214, 1.096643, 0.654902, 0, 1, 1,
0.7308171, -0.5170587, 3.168418, 0.6627451, 0, 1, 1,
0.7337498, 1.393752, 1.470364, 0.6666667, 0, 1, 1,
0.7343026, -0.9140812, 2.492514, 0.6745098, 0, 1, 1,
0.7344651, -0.6743378, 2.443284, 0.6784314, 0, 1, 1,
0.734643, -0.7402806, 3.243158, 0.6862745, 0, 1, 1,
0.737825, 0.267464, 0.483535, 0.6901961, 0, 1, 1,
0.7390859, -0.2465984, 3.497247, 0.6980392, 0, 1, 1,
0.7407808, -0.5471872, 2.729122, 0.7058824, 0, 1, 1,
0.7478889, -0.3072141, 2.917405, 0.7098039, 0, 1, 1,
0.7555791, -1.136593, 3.690962, 0.7176471, 0, 1, 1,
0.7579566, -1.610719, 2.540696, 0.7215686, 0, 1, 1,
0.7600107, -0.1060628, 2.629403, 0.7294118, 0, 1, 1,
0.7614257, -0.564221, 1.402476, 0.7333333, 0, 1, 1,
0.7630547, 1.622247, -0.128028, 0.7411765, 0, 1, 1,
0.7649379, 0.9944498, -1.450778, 0.7450981, 0, 1, 1,
0.7652916, 0.2926381, 3.178679, 0.7529412, 0, 1, 1,
0.7668954, 0.2507058, 2.022678, 0.7568628, 0, 1, 1,
0.7727067, 0.5012541, 0.2455687, 0.7647059, 0, 1, 1,
0.7778276, -0.2977416, 1.467478, 0.7686275, 0, 1, 1,
0.7780267, -1.992521, 2.600025, 0.7764706, 0, 1, 1,
0.7790624, 0.8717837, 1.31226, 0.7803922, 0, 1, 1,
0.7810963, 0.0139493, 1.486186, 0.7882353, 0, 1, 1,
0.7836347, 1.247221, 0.6187062, 0.7921569, 0, 1, 1,
0.7842728, 0.6531112, 0.8317164, 0.8, 0, 1, 1,
0.7991968, 0.4902031, -0.1310396, 0.8078431, 0, 1, 1,
0.8075337, -0.01944144, -0.1349951, 0.8117647, 0, 1, 1,
0.8139153, -0.145439, 3.417121, 0.8196079, 0, 1, 1,
0.8145827, -1.21034, 0.136476, 0.8235294, 0, 1, 1,
0.8163472, -1.107206, 2.467814, 0.8313726, 0, 1, 1,
0.8245032, 0.1996425, 1.57154, 0.8352941, 0, 1, 1,
0.8245655, 0.6609742, 0.4818484, 0.8431373, 0, 1, 1,
0.8247654, -0.04973258, 1.930489, 0.8470588, 0, 1, 1,
0.8280349, 1.541274, 0.5547649, 0.854902, 0, 1, 1,
0.8289873, 0.9293901, 2.286948, 0.8588235, 0, 1, 1,
0.8293322, 0.9799758, 2.024056, 0.8666667, 0, 1, 1,
0.8398788, 0.1267111, 1.84215, 0.8705882, 0, 1, 1,
0.8436306, 0.9453647, -0.1466387, 0.8784314, 0, 1, 1,
0.8451939, 0.7145814, -0.05338982, 0.8823529, 0, 1, 1,
0.8470034, 2.749476, -0.5724108, 0.8901961, 0, 1, 1,
0.8487816, -0.7567872, 3.465907, 0.8941177, 0, 1, 1,
0.8494906, 0.006235702, 2.368134, 0.9019608, 0, 1, 1,
0.8563258, 0.890749, 0.8849628, 0.9098039, 0, 1, 1,
0.8576674, 0.06104289, 2.596309, 0.9137255, 0, 1, 1,
0.858294, 0.1934867, 0.2659231, 0.9215686, 0, 1, 1,
0.8593978, -0.0171965, 2.099618, 0.9254902, 0, 1, 1,
0.871268, -1.6227, 2.497266, 0.9333333, 0, 1, 1,
0.877175, 0.0593407, 3.126401, 0.9372549, 0, 1, 1,
0.8783939, 1.343075, 0.4604216, 0.945098, 0, 1, 1,
0.8822492, 0.009521535, 2.145036, 0.9490196, 0, 1, 1,
0.8881942, -0.8673084, 2.428773, 0.9568627, 0, 1, 1,
0.891889, -2.142129, 2.349357, 0.9607843, 0, 1, 1,
0.8957585, -0.1193435, 2.023099, 0.9686275, 0, 1, 1,
0.89807, -1.016992, 2.514615, 0.972549, 0, 1, 1,
0.9006586, -0.44609, 2.798093, 0.9803922, 0, 1, 1,
0.9028445, 2.360405, 1.782663, 0.9843137, 0, 1, 1,
0.9079298, -1.340506, 3.064075, 0.9921569, 0, 1, 1,
0.9115196, 0.142109, 0.581897, 0.9960784, 0, 1, 1,
0.9123716, -0.4370446, 3.176311, 1, 0, 0.9960784, 1,
0.9159676, 0.8460347, -0.4142258, 1, 0, 0.9882353, 1,
0.916564, -0.3766058, 2.624469, 1, 0, 0.9843137, 1,
0.9218354, -1.236206, 3.146748, 1, 0, 0.9764706, 1,
0.9259768, -0.4827204, 2.509619, 1, 0, 0.972549, 1,
0.9289072, 0.8741336, 0.7650287, 1, 0, 0.9647059, 1,
0.9295977, -0.9444566, 2.925694, 1, 0, 0.9607843, 1,
0.9313617, 0.5224115, 0.7083716, 1, 0, 0.9529412, 1,
0.9399241, -0.993686, 0.7592987, 1, 0, 0.9490196, 1,
0.9422063, -0.07649636, 3.561521, 1, 0, 0.9411765, 1,
0.9474478, -1.783415, 3.611853, 1, 0, 0.9372549, 1,
0.9514028, 1.712074, 0.1551627, 1, 0, 0.9294118, 1,
0.9526029, 0.1429289, 0.7840204, 1, 0, 0.9254902, 1,
0.9528372, 0.2550385, 1.052907, 1, 0, 0.9176471, 1,
0.9544571, -1.276254, 3.257602, 1, 0, 0.9137255, 1,
0.9621106, 1.052751, -0.1580139, 1, 0, 0.9058824, 1,
0.9639071, 0.1435474, 0.9542929, 1, 0, 0.9019608, 1,
0.9675674, -0.6438076, 1.498193, 1, 0, 0.8941177, 1,
0.9704247, 0.06928857, 1.620198, 1, 0, 0.8862745, 1,
0.9756824, -0.007679831, 0.9012653, 1, 0, 0.8823529, 1,
0.984296, -0.4351943, 2.601454, 1, 0, 0.8745098, 1,
0.9942065, -0.2896171, 2.322163, 1, 0, 0.8705882, 1,
1.007904, 0.08146883, 0.1978122, 1, 0, 0.8627451, 1,
1.011261, -0.1973208, 2.104789, 1, 0, 0.8588235, 1,
1.011579, 1.020598, 1.289685, 1, 0, 0.8509804, 1,
1.014885, -1.841822, 2.115932, 1, 0, 0.8470588, 1,
1.01701, 0.369298, 0.0725471, 1, 0, 0.8392157, 1,
1.017461, 0.8815414, 0.8054455, 1, 0, 0.8352941, 1,
1.019129, 0.7529634, 1.360318, 1, 0, 0.827451, 1,
1.021619, 1.285816, 1.064741, 1, 0, 0.8235294, 1,
1.028134, 0.04100882, 2.087612, 1, 0, 0.8156863, 1,
1.032668, -0.1553205, 2.638558, 1, 0, 0.8117647, 1,
1.036619, 0.4410188, 0.7653987, 1, 0, 0.8039216, 1,
1.050765, 0.7102159, 0.4010127, 1, 0, 0.7960784, 1,
1.051845, -1.302046, 2.956019, 1, 0, 0.7921569, 1,
1.052656, 0.484967, 0.9769735, 1, 0, 0.7843137, 1,
1.053498, 0.1820009, 1.190476, 1, 0, 0.7803922, 1,
1.056125, 0.7935997, 2.221175, 1, 0, 0.772549, 1,
1.057926, 0.2794209, 1.416047, 1, 0, 0.7686275, 1,
1.059152, 0.9378931, 0.289392, 1, 0, 0.7607843, 1,
1.060273, -0.4556817, 0.7557369, 1, 0, 0.7568628, 1,
1.061785, -0.9845643, 3.929374, 1, 0, 0.7490196, 1,
1.062664, 0.2464389, 1.153873, 1, 0, 0.7450981, 1,
1.064755, 2.424438, -1.468911, 1, 0, 0.7372549, 1,
1.071412, -0.004171588, 0.5516053, 1, 0, 0.7333333, 1,
1.081019, -0.1516946, 1.330298, 1, 0, 0.7254902, 1,
1.088133, -0.7336998, 3.591648, 1, 0, 0.7215686, 1,
1.088333, -1.721448, 3.25721, 1, 0, 0.7137255, 1,
1.091563, 0.5292841, 0.9043353, 1, 0, 0.7098039, 1,
1.092583, 0.1274618, 3.93754, 1, 0, 0.7019608, 1,
1.098505, 2.198844, 1.228669, 1, 0, 0.6941177, 1,
1.104029, 0.1731883, 1.570635, 1, 0, 0.6901961, 1,
1.107681, -0.8289722, 2.727075, 1, 0, 0.682353, 1,
1.112242, -0.382538, 2.436907, 1, 0, 0.6784314, 1,
1.112524, -0.8254667, 2.230954, 1, 0, 0.6705883, 1,
1.115496, -1.43042, 2.419214, 1, 0, 0.6666667, 1,
1.131082, 1.1337, 2.563061, 1, 0, 0.6588235, 1,
1.131243, -0.07320388, -0.2940777, 1, 0, 0.654902, 1,
1.151193, -0.1238428, 0.1799191, 1, 0, 0.6470588, 1,
1.156176, 0.3543732, 0.9087277, 1, 0, 0.6431373, 1,
1.164635, 1.76115, -0.5285972, 1, 0, 0.6352941, 1,
1.16943, 1.792622, -0.1967732, 1, 0, 0.6313726, 1,
1.169785, 1.257414, -0.3407949, 1, 0, 0.6235294, 1,
1.174155, 0.5424414, 2.09146, 1, 0, 0.6196079, 1,
1.177955, -0.8836463, 1.509584, 1, 0, 0.6117647, 1,
1.180049, -0.2367039, 2.250772, 1, 0, 0.6078432, 1,
1.19708, -0.1792553, 1.97681, 1, 0, 0.6, 1,
1.203823, -1.911353, 1.490507, 1, 0, 0.5921569, 1,
1.221746, 0.87862, -0.219018, 1, 0, 0.5882353, 1,
1.222995, -0.2083346, 1.614427, 1, 0, 0.5803922, 1,
1.22436, -0.5649003, 2.021445, 1, 0, 0.5764706, 1,
1.227974, 1.027938, 0.5968695, 1, 0, 0.5686275, 1,
1.229571, 0.2058426, 2.238845, 1, 0, 0.5647059, 1,
1.246784, 1.255555, 1.462691, 1, 0, 0.5568628, 1,
1.248339, -0.1307097, 0.6247139, 1, 0, 0.5529412, 1,
1.249194, -1.285007, 2.062893, 1, 0, 0.5450981, 1,
1.251777, -0.3207554, 1.028527, 1, 0, 0.5411765, 1,
1.254466, 0.9927942, 0.52798, 1, 0, 0.5333334, 1,
1.258847, -0.06979182, 1.971313, 1, 0, 0.5294118, 1,
1.281287, 1.325102, 0.7229083, 1, 0, 0.5215687, 1,
1.283209, -0.4568588, 1.213416, 1, 0, 0.5176471, 1,
1.285346, 1.75986, 0.01329282, 1, 0, 0.509804, 1,
1.286481, -0.3718687, 1.515486, 1, 0, 0.5058824, 1,
1.31843, -1.085231, 2.542661, 1, 0, 0.4980392, 1,
1.320689, -1.180921, 0.2786251, 1, 0, 0.4901961, 1,
1.32438, 1.462525, 1.571167, 1, 0, 0.4862745, 1,
1.340468, -0.2429498, 0.4832872, 1, 0, 0.4784314, 1,
1.343529, -1.261815, 2.568982, 1, 0, 0.4745098, 1,
1.343571, 0.155689, 2.965559, 1, 0, 0.4666667, 1,
1.345361, 0.7544493, 2.483407, 1, 0, 0.4627451, 1,
1.362843, 0.4862822, 1.705322, 1, 0, 0.454902, 1,
1.369172, 0.416871, 0.5046176, 1, 0, 0.4509804, 1,
1.371018, -0.8662519, 1.20882, 1, 0, 0.4431373, 1,
1.37512, 0.1537531, 1.559357, 1, 0, 0.4392157, 1,
1.379391, 0.2959429, 1.073947, 1, 0, 0.4313726, 1,
1.384104, -1.043476, 3.369174, 1, 0, 0.427451, 1,
1.394465, 0.6469861, 1.705287, 1, 0, 0.4196078, 1,
1.410318, -0.05901562, 1.464197, 1, 0, 0.4156863, 1,
1.415719, 2.144718, -2.177035, 1, 0, 0.4078431, 1,
1.419051, 0.8614351, 1.384735, 1, 0, 0.4039216, 1,
1.427158, -1.149453, 3.57032, 1, 0, 0.3960784, 1,
1.43305, -0.06926173, 1.263497, 1, 0, 0.3882353, 1,
1.44421, 0.4960668, 1.437471, 1, 0, 0.3843137, 1,
1.451952, 0.9501027, 0.204825, 1, 0, 0.3764706, 1,
1.481795, -1.177708, 3.200864, 1, 0, 0.372549, 1,
1.496124, 0.9107072, 1.623522, 1, 0, 0.3647059, 1,
1.504799, -0.480931, 1.852197, 1, 0, 0.3607843, 1,
1.532976, -2.422732, 2.509847, 1, 0, 0.3529412, 1,
1.534066, 1.17718, 2.516728, 1, 0, 0.3490196, 1,
1.54735, 0.1365697, 2.461865, 1, 0, 0.3411765, 1,
1.548055, -1.179802, 2.109791, 1, 0, 0.3372549, 1,
1.552097, -1.600876, 1.319342, 1, 0, 0.3294118, 1,
1.562202, -1.209305, 2.756747, 1, 0, 0.3254902, 1,
1.564421, -0.3847488, 2.517456, 1, 0, 0.3176471, 1,
1.564582, -0.995622, 2.952682, 1, 0, 0.3137255, 1,
1.565583, 2.379313, 0.6379264, 1, 0, 0.3058824, 1,
1.577199, 1.05022, 0.7321672, 1, 0, 0.2980392, 1,
1.5955, -2.121672, 3.195353, 1, 0, 0.2941177, 1,
1.595585, -0.6178592, 1.740844, 1, 0, 0.2862745, 1,
1.602547, -1.656175, 2.159495, 1, 0, 0.282353, 1,
1.603914, 0.1810999, 1.811571, 1, 0, 0.2745098, 1,
1.604151, -0.136698, 0.9085253, 1, 0, 0.2705882, 1,
1.604561, 0.4873269, 1.204629, 1, 0, 0.2627451, 1,
1.628927, 1.841454, 0.522838, 1, 0, 0.2588235, 1,
1.705901, 1.904261, 0.2084774, 1, 0, 0.2509804, 1,
1.708541, 0.9793302, 0.5359221, 1, 0, 0.2470588, 1,
1.719994, -1.453973, 2.345555, 1, 0, 0.2392157, 1,
1.761212, -0.5758414, 1.75988, 1, 0, 0.2352941, 1,
1.762821, 0.8761085, 1.350385, 1, 0, 0.227451, 1,
1.772759, -0.8963335, 2.247919, 1, 0, 0.2235294, 1,
1.781844, -1.620159, 3.252683, 1, 0, 0.2156863, 1,
1.808472, -0.8504797, 2.662175, 1, 0, 0.2117647, 1,
1.812058, -1.513648, 2.60008, 1, 0, 0.2039216, 1,
1.823473, 0.7035016, 0.8966029, 1, 0, 0.1960784, 1,
1.850555, -1.089741, 3.539834, 1, 0, 0.1921569, 1,
1.852226, 0.7726147, 0.4838427, 1, 0, 0.1843137, 1,
1.85226, -0.354544, 1.063741, 1, 0, 0.1803922, 1,
1.881062, -0.02469989, 2.988868, 1, 0, 0.172549, 1,
1.891393, -1.050442, 2.561528, 1, 0, 0.1686275, 1,
1.908444, -0.5347831, 1.433605, 1, 0, 0.1607843, 1,
1.925419, 0.1991048, 2.021563, 1, 0, 0.1568628, 1,
1.929039, -0.795089, 2.074736, 1, 0, 0.1490196, 1,
1.93535, -1.156514, 2.083908, 1, 0, 0.145098, 1,
1.937599, 1.480654, -0.1762743, 1, 0, 0.1372549, 1,
1.941917, -0.4221524, 1.189888, 1, 0, 0.1333333, 1,
1.944834, 0.08188656, -0.6177055, 1, 0, 0.1254902, 1,
1.955289, 0.2251295, 1.009937, 1, 0, 0.1215686, 1,
1.969086, -1.238367, 2.971106, 1, 0, 0.1137255, 1,
1.98529, 1.083563, -0.4749774, 1, 0, 0.1098039, 1,
1.991232, -1.359177, -0.01491224, 1, 0, 0.1019608, 1,
2.00703, 1.897063, 0.3371, 1, 0, 0.09411765, 1,
2.034866, 0.698906, 1.140252, 1, 0, 0.09019608, 1,
2.061095, -2.858918, 4.205047, 1, 0, 0.08235294, 1,
2.101893, -0.1571726, 2.1561, 1, 0, 0.07843138, 1,
2.143115, 0.5646919, 1.696977, 1, 0, 0.07058824, 1,
2.204067, -0.6314873, 2.065285, 1, 0, 0.06666667, 1,
2.227751, 0.3702682, -0.3146589, 1, 0, 0.05882353, 1,
2.259238, -1.634076, 3.620045, 1, 0, 0.05490196, 1,
2.283524, -0.08535914, 1.27331, 1, 0, 0.04705882, 1,
2.310719, -0.6434223, 0.2686558, 1, 0, 0.04313726, 1,
2.486762, 0.8220829, 1.051752, 1, 0, 0.03529412, 1,
2.743241, -1.472646, 3.757025, 1, 0, 0.03137255, 1,
2.769787, 0.08658911, 2.191881, 1, 0, 0.02352941, 1,
2.848455, 0.5049508, 0.4905668, 1, 0, 0.01960784, 1,
2.907405, -0.004279953, 1.519469, 1, 0, 0.01176471, 1,
4.185492, -1.435063, 3.37503, 1, 0, 0.007843138, 1
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
-0.04182911, -3.873512, -7.668911, 0, -0.5, 0.5, 0.5,
-0.04182911, -3.873512, -7.668911, 1, -0.5, 0.5, 0.5,
-0.04182911, -3.873512, -7.668911, 1, 1.5, 0.5, 0.5,
-0.04182911, -3.873512, -7.668911, 0, 1.5, 0.5, 0.5
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
-5.702211, 0.0194, -7.668911, 0, -0.5, 0.5, 0.5,
-5.702211, 0.0194, -7.668911, 1, -0.5, 0.5, 0.5,
-5.702211, 0.0194, -7.668911, 1, 1.5, 0.5, 0.5,
-5.702211, 0.0194, -7.668911, 0, 1.5, 0.5, 0.5
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
-5.702211, -3.873512, -0.5157948, 0, -0.5, 0.5, 0.5,
-5.702211, -3.873512, -0.5157948, 1, -0.5, 0.5, 0.5,
-5.702211, -3.873512, -0.5157948, 1, 1.5, 0.5, 0.5,
-5.702211, -3.873512, -0.5157948, 0, 1.5, 0.5, 0.5
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
-4, -2.975147, -6.018192,
4, -2.975147, -6.018192,
-4, -2.975147, -6.018192,
-4, -3.124875, -6.293312,
-2, -2.975147, -6.018192,
-2, -3.124875, -6.293312,
0, -2.975147, -6.018192,
0, -3.124875, -6.293312,
2, -2.975147, -6.018192,
2, -3.124875, -6.293312,
4, -2.975147, -6.018192,
4, -3.124875, -6.293312
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
"2",
"4"
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
-4, -3.42433, -6.843551, 0, -0.5, 0.5, 0.5,
-4, -3.42433, -6.843551, 1, -0.5, 0.5, 0.5,
-4, -3.42433, -6.843551, 1, 1.5, 0.5, 0.5,
-4, -3.42433, -6.843551, 0, 1.5, 0.5, 0.5,
-2, -3.42433, -6.843551, 0, -0.5, 0.5, 0.5,
-2, -3.42433, -6.843551, 1, -0.5, 0.5, 0.5,
-2, -3.42433, -6.843551, 1, 1.5, 0.5, 0.5,
-2, -3.42433, -6.843551, 0, 1.5, 0.5, 0.5,
0, -3.42433, -6.843551, 0, -0.5, 0.5, 0.5,
0, -3.42433, -6.843551, 1, -0.5, 0.5, 0.5,
0, -3.42433, -6.843551, 1, 1.5, 0.5, 0.5,
0, -3.42433, -6.843551, 0, 1.5, 0.5, 0.5,
2, -3.42433, -6.843551, 0, -0.5, 0.5, 0.5,
2, -3.42433, -6.843551, 1, -0.5, 0.5, 0.5,
2, -3.42433, -6.843551, 1, 1.5, 0.5, 0.5,
2, -3.42433, -6.843551, 0, 1.5, 0.5, 0.5,
4, -3.42433, -6.843551, 0, -0.5, 0.5, 0.5,
4, -3.42433, -6.843551, 1, -0.5, 0.5, 0.5,
4, -3.42433, -6.843551, 1, 1.5, 0.5, 0.5,
4, -3.42433, -6.843551, 0, 1.5, 0.5, 0.5
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
-4.395969, -2, -6.018192,
-4.395969, 2, -6.018192,
-4.395969, -2, -6.018192,
-4.613677, -2, -6.293312,
-4.395969, -1, -6.018192,
-4.613677, -1, -6.293312,
-4.395969, 0, -6.018192,
-4.613677, 0, -6.293312,
-4.395969, 1, -6.018192,
-4.613677, 1, -6.293312,
-4.395969, 2, -6.018192,
-4.613677, 2, -6.293312
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
-5.04909, -2, -6.843551, 0, -0.5, 0.5, 0.5,
-5.04909, -2, -6.843551, 1, -0.5, 0.5, 0.5,
-5.04909, -2, -6.843551, 1, 1.5, 0.5, 0.5,
-5.04909, -2, -6.843551, 0, 1.5, 0.5, 0.5,
-5.04909, -1, -6.843551, 0, -0.5, 0.5, 0.5,
-5.04909, -1, -6.843551, 1, -0.5, 0.5, 0.5,
-5.04909, -1, -6.843551, 1, 1.5, 0.5, 0.5,
-5.04909, -1, -6.843551, 0, 1.5, 0.5, 0.5,
-5.04909, 0, -6.843551, 0, -0.5, 0.5, 0.5,
-5.04909, 0, -6.843551, 1, -0.5, 0.5, 0.5,
-5.04909, 0, -6.843551, 1, 1.5, 0.5, 0.5,
-5.04909, 0, -6.843551, 0, 1.5, 0.5, 0.5,
-5.04909, 1, -6.843551, 0, -0.5, 0.5, 0.5,
-5.04909, 1, -6.843551, 1, -0.5, 0.5, 0.5,
-5.04909, 1, -6.843551, 1, 1.5, 0.5, 0.5,
-5.04909, 1, -6.843551, 0, 1.5, 0.5, 0.5,
-5.04909, 2, -6.843551, 0, -0.5, 0.5, 0.5,
-5.04909, 2, -6.843551, 1, -0.5, 0.5, 0.5,
-5.04909, 2, -6.843551, 1, 1.5, 0.5, 0.5,
-5.04909, 2, -6.843551, 0, 1.5, 0.5, 0.5
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
-4.395969, -2.975147, -4,
-4.395969, -2.975147, 4,
-4.395969, -2.975147, -4,
-4.613677, -3.124875, -4,
-4.395969, -2.975147, -2,
-4.613677, -3.124875, -2,
-4.395969, -2.975147, 0,
-4.613677, -3.124875, 0,
-4.395969, -2.975147, 2,
-4.613677, -3.124875, 2,
-4.395969, -2.975147, 4,
-4.613677, -3.124875, 4
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
-5.04909, -3.42433, -4, 0, -0.5, 0.5, 0.5,
-5.04909, -3.42433, -4, 1, -0.5, 0.5, 0.5,
-5.04909, -3.42433, -4, 1, 1.5, 0.5, 0.5,
-5.04909, -3.42433, -4, 0, 1.5, 0.5, 0.5,
-5.04909, -3.42433, -2, 0, -0.5, 0.5, 0.5,
-5.04909, -3.42433, -2, 1, -0.5, 0.5, 0.5,
-5.04909, -3.42433, -2, 1, 1.5, 0.5, 0.5,
-5.04909, -3.42433, -2, 0, 1.5, 0.5, 0.5,
-5.04909, -3.42433, 0, 0, -0.5, 0.5, 0.5,
-5.04909, -3.42433, 0, 1, -0.5, 0.5, 0.5,
-5.04909, -3.42433, 0, 1, 1.5, 0.5, 0.5,
-5.04909, -3.42433, 0, 0, 1.5, 0.5, 0.5,
-5.04909, -3.42433, 2, 0, -0.5, 0.5, 0.5,
-5.04909, -3.42433, 2, 1, -0.5, 0.5, 0.5,
-5.04909, -3.42433, 2, 1, 1.5, 0.5, 0.5,
-5.04909, -3.42433, 2, 0, 1.5, 0.5, 0.5,
-5.04909, -3.42433, 4, 0, -0.5, 0.5, 0.5,
-5.04909, -3.42433, 4, 1, -0.5, 0.5, 0.5,
-5.04909, -3.42433, 4, 1, 1.5, 0.5, 0.5,
-5.04909, -3.42433, 4, 0, 1.5, 0.5, 0.5
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
-4.395969, -2.975147, -6.018192,
-4.395969, 3.013947, -6.018192,
-4.395969, -2.975147, 4.986602,
-4.395969, 3.013947, 4.986602,
-4.395969, -2.975147, -6.018192,
-4.395969, -2.975147, 4.986602,
-4.395969, 3.013947, -6.018192,
-4.395969, 3.013947, 4.986602,
-4.395969, -2.975147, -6.018192,
4.312311, -2.975147, -6.018192,
-4.395969, -2.975147, 4.986602,
4.312311, -2.975147, 4.986602,
-4.395969, 3.013947, -6.018192,
4.312311, 3.013947, -6.018192,
-4.395969, 3.013947, 4.986602,
4.312311, 3.013947, 4.986602,
4.312311, -2.975147, -6.018192,
4.312311, 3.013947, -6.018192,
4.312311, -2.975147, 4.986602,
4.312311, 3.013947, 4.986602,
4.312311, -2.975147, -6.018192,
4.312311, -2.975147, 4.986602,
4.312311, 3.013947, -6.018192,
4.312311, 3.013947, 4.986602
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
var radius = 8.147517;
var distance = 36.24922;
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
mvMatrix.translate( 0.04182911, -0.0194, 0.5157948 );
mvMatrix.scale( 1.011595, 1.470882, 0.8004925 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.24922);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Dithane<-read.table("Dithane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dithane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dithane' not found
```

```r
y<-Dithane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dithane' not found
```

```r
z<-Dithane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dithane' not found
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
-4.26915, -0.2788805, -1.877287, 0, 0, 1, 1, 1,
-3.212359, -1.436247, -1.924405, 1, 0, 0, 1, 1,
-2.836013, 0.2510434, -1.655467, 1, 0, 0, 1, 1,
-2.797071, -0.6478326, -1.713175, 1, 0, 0, 1, 1,
-2.52099, 1.778096, -1.233594, 1, 0, 0, 1, 1,
-2.47399, -0.4470192, -1.167769, 1, 0, 0, 1, 1,
-2.453332, 1.118935, -0.07867424, 0, 0, 0, 1, 1,
-2.452097, 0.1665992, -1.47117, 0, 0, 0, 1, 1,
-2.435177, -1.278207, -2.505434, 0, 0, 0, 1, 1,
-2.346327, 0.981162, -2.145147, 0, 0, 0, 1, 1,
-2.325977, -1.356758, -1.555521, 0, 0, 0, 1, 1,
-2.325362, 0.3185645, -0.5238042, 0, 0, 0, 1, 1,
-2.272059, -0.8282512, -0.48859, 0, 0, 0, 1, 1,
-2.227483, 0.6620873, -1.734565, 1, 1, 1, 1, 1,
-2.227301, 0.6383294, -0.6111907, 1, 1, 1, 1, 1,
-2.165649, 1.609637, -0.1568683, 1, 1, 1, 1, 1,
-2.111123, -1.853714, -1.543946, 1, 1, 1, 1, 1,
-2.100702, -2.887928, -1.809109, 1, 1, 1, 1, 1,
-2.097471, 0.01639519, -1.60078, 1, 1, 1, 1, 1,
-2.087715, 0.2149464, -0.9518623, 1, 1, 1, 1, 1,
-2.070506, -0.2891426, -2.64509, 1, 1, 1, 1, 1,
-2.037205, -0.7619305, -1.64797, 1, 1, 1, 1, 1,
-2.034606, -0.07071892, -3.132384, 1, 1, 1, 1, 1,
-2.031127, -1.610271, -1.525222, 1, 1, 1, 1, 1,
-2.011961, -0.2289798, -1.856058, 1, 1, 1, 1, 1,
-1.999361, 0.793448, -1.256904, 1, 1, 1, 1, 1,
-1.971644, 1.591462, -0.8273677, 1, 1, 1, 1, 1,
-1.955877, 0.9180989, -2.266378, 1, 1, 1, 1, 1,
-1.902267, 0.587297, 0.5426921, 0, 0, 1, 1, 1,
-1.896717, 0.2774255, -2.109622, 1, 0, 0, 1, 1,
-1.890271, -0.08844924, -2.45743, 1, 0, 0, 1, 1,
-1.884577, 0.2034969, -1.853655, 1, 0, 0, 1, 1,
-1.853236, -0.8493114, -1.32942, 1, 0, 0, 1, 1,
-1.839985, 0.1351646, -2.976697, 1, 0, 0, 1, 1,
-1.822741, -1.519562, -1.741524, 0, 0, 0, 1, 1,
-1.815834, -0.5435377, -0.8719794, 0, 0, 0, 1, 1,
-1.813702, 1.317522, -1.287947, 0, 0, 0, 1, 1,
-1.81273, -0.6028274, -2.767923, 0, 0, 0, 1, 1,
-1.805255, 0.2390693, -3.238063, 0, 0, 0, 1, 1,
-1.775556, 0.8066276, 0.1373702, 0, 0, 0, 1, 1,
-1.764063, 0.990158, -0.438843, 0, 0, 0, 1, 1,
-1.74978, -2.131973, -3.935864, 1, 1, 1, 1, 1,
-1.727847, -1.594108, -3.356467, 1, 1, 1, 1, 1,
-1.71052, -0.8021489, -0.8049827, 1, 1, 1, 1, 1,
-1.705285, -0.1026229, -1.530583, 1, 1, 1, 1, 1,
-1.702884, -1.04478, -0.1140605, 1, 1, 1, 1, 1,
-1.702618, -0.1378713, -1.460402, 1, 1, 1, 1, 1,
-1.699559, 0.2855834, -1.839235, 1, 1, 1, 1, 1,
-1.694153, -1.529055, -2.734142, 1, 1, 1, 1, 1,
-1.679388, 0.6755, -0.914154, 1, 1, 1, 1, 1,
-1.675295, -0.9962896, -3.962233, 1, 1, 1, 1, 1,
-1.662557, -0.6239724, -2.411416, 1, 1, 1, 1, 1,
-1.66128, 0.2099119, -1.785133, 1, 1, 1, 1, 1,
-1.653066, 1.37623, -1.397228, 1, 1, 1, 1, 1,
-1.646868, -1.138955, -1.871082, 1, 1, 1, 1, 1,
-1.627411, -0.132617, -1.255427, 1, 1, 1, 1, 1,
-1.622198, 0.384654, -2.974162, 0, 0, 1, 1, 1,
-1.584315, 1.196029, -1.673003, 1, 0, 0, 1, 1,
-1.579718, -1.46835, -1.881681, 1, 0, 0, 1, 1,
-1.563669, -0.5198888, -1.363576, 1, 0, 0, 1, 1,
-1.560735, -0.8876541, -2.590362, 1, 0, 0, 1, 1,
-1.560311, 0.5669104, 0.1033832, 1, 0, 0, 1, 1,
-1.553619, 1.108297, -0.08648734, 0, 0, 0, 1, 1,
-1.538262, -0.8809549, -0.0192179, 0, 0, 0, 1, 1,
-1.522008, -1.717337, -3.146899, 0, 0, 0, 1, 1,
-1.519987, 1.309449, -1.645081, 0, 0, 0, 1, 1,
-1.519632, -1.098948, -3.266216, 0, 0, 0, 1, 1,
-1.507873, 0.1308805, -1.119117, 0, 0, 0, 1, 1,
-1.507491, 0.4371614, 0.5112258, 0, 0, 0, 1, 1,
-1.506322, -1.36531, -2.444123, 1, 1, 1, 1, 1,
-1.50483, -0.8751042, -1.749782, 1, 1, 1, 1, 1,
-1.503488, -0.2536891, -1.725257, 1, 1, 1, 1, 1,
-1.503453, 0.04809229, -1.949363, 1, 1, 1, 1, 1,
-1.488205, -1.365782, -2.986203, 1, 1, 1, 1, 1,
-1.486238, -0.6494768, -2.959987, 1, 1, 1, 1, 1,
-1.483542, 0.06425801, -1.925615, 1, 1, 1, 1, 1,
-1.479633, 2.207031, -1.076125, 1, 1, 1, 1, 1,
-1.464049, 0.133469, -2.254956, 1, 1, 1, 1, 1,
-1.450074, 2.291354, -0.8575183, 1, 1, 1, 1, 1,
-1.4471, -1.3785, -2.154377, 1, 1, 1, 1, 1,
-1.442497, 0.04748629, -1.776618, 1, 1, 1, 1, 1,
-1.440197, 0.03867563, -2.104743, 1, 1, 1, 1, 1,
-1.421206, 1.341636, 1.282707, 1, 1, 1, 1, 1,
-1.403137, -0.6635197, -2.04717, 1, 1, 1, 1, 1,
-1.402694, 0.2235629, -0.2363781, 0, 0, 1, 1, 1,
-1.398042, -0.8269261, -2.595412, 1, 0, 0, 1, 1,
-1.393492, 1.319316, 0.1234957, 1, 0, 0, 1, 1,
-1.392907, 1.173885, -2.943619, 1, 0, 0, 1, 1,
-1.38327, 0.8692459, -1.118925, 1, 0, 0, 1, 1,
-1.379433, 0.09205005, 0.5631335, 1, 0, 0, 1, 1,
-1.375681, 1.521517, -1.142199, 0, 0, 0, 1, 1,
-1.374753, -1.35614, -2.27698, 0, 0, 0, 1, 1,
-1.350663, -0.13392, -2.298084, 0, 0, 0, 1, 1,
-1.349374, -1.54992, -3.887731, 0, 0, 0, 1, 1,
-1.348891, 1.184, -2.503157, 0, 0, 0, 1, 1,
-1.347588, -2.401352, -2.783166, 0, 0, 0, 1, 1,
-1.346574, -0.3584313, -1.744742, 0, 0, 0, 1, 1,
-1.332629, -0.6241875, -1.64011, 1, 1, 1, 1, 1,
-1.33134, 0.3895485, -0.03849308, 1, 1, 1, 1, 1,
-1.31835, -0.682164, -2.576395, 1, 1, 1, 1, 1,
-1.316949, 0.3136541, -1.08831, 1, 1, 1, 1, 1,
-1.308889, -0.1869036, -0.964138, 1, 1, 1, 1, 1,
-1.308148, -0.2347109, -3.204488, 1, 1, 1, 1, 1,
-1.30765, -0.5900149, -3.042389, 1, 1, 1, 1, 1,
-1.307634, 0.7921245, -1.379759, 1, 1, 1, 1, 1,
-1.304643, 1.037828, 0.4233605, 1, 1, 1, 1, 1,
-1.303517, 0.1565836, -0.5512453, 1, 1, 1, 1, 1,
-1.298563, 0.1607521, -0.1482716, 1, 1, 1, 1, 1,
-1.288181, 0.9722697, -0.5911062, 1, 1, 1, 1, 1,
-1.287862, 0.6896507, -0.1223569, 1, 1, 1, 1, 1,
-1.282184, 0.1076476, -0.3277298, 1, 1, 1, 1, 1,
-1.281351, -1.699355, -3.072388, 1, 1, 1, 1, 1,
-1.274109, -0.3240362, -2.694419, 0, 0, 1, 1, 1,
-1.259398, -0.2109071, -0.6328925, 1, 0, 0, 1, 1,
-1.247199, 0.2146817, -0.5611641, 1, 0, 0, 1, 1,
-1.235517, 0.1420325, -2.156698, 1, 0, 0, 1, 1,
-1.224502, 0.986943, -0.2164405, 1, 0, 0, 1, 1,
-1.222773, -1.047478, -1.398368, 1, 0, 0, 1, 1,
-1.219869, -1.84401, -2.032564, 0, 0, 0, 1, 1,
-1.21473, -0.04965655, -3.336568, 0, 0, 0, 1, 1,
-1.212362, -0.04852981, -1.721111, 0, 0, 0, 1, 1,
-1.209945, 0.1914644, -1.826372, 0, 0, 0, 1, 1,
-1.17636, -0.0427492, -0.6511043, 0, 0, 0, 1, 1,
-1.173138, -0.5446039, -3.224159, 0, 0, 0, 1, 1,
-1.167831, -0.5879826, -1.318857, 0, 0, 0, 1, 1,
-1.165666, -1.202866, -2.521282, 1, 1, 1, 1, 1,
-1.16475, -1.074921, -1.815601, 1, 1, 1, 1, 1,
-1.145981, -1.077142, -1.708789, 1, 1, 1, 1, 1,
-1.139372, -0.412091, -1.753402, 1, 1, 1, 1, 1,
-1.138688, 0.01121369, -1.856904, 1, 1, 1, 1, 1,
-1.136189, -0.5129991, -1.83443, 1, 1, 1, 1, 1,
-1.135605, -0.0677119, -2.220697, 1, 1, 1, 1, 1,
-1.13523, -0.2855501, -1.264464, 1, 1, 1, 1, 1,
-1.127524, 0.2642074, -1.3689, 1, 1, 1, 1, 1,
-1.120009, 0.1985207, -2.858427, 1, 1, 1, 1, 1,
-1.109744, 0.9025488, 0.2983502, 1, 1, 1, 1, 1,
-1.107496, 0.4559754, -0.6326774, 1, 1, 1, 1, 1,
-1.106332, -0.04278455, -1.386203, 1, 1, 1, 1, 1,
-1.101255, -1.050202, -1.681023, 1, 1, 1, 1, 1,
-1.097178, -0.3609566, -3.192287, 1, 1, 1, 1, 1,
-1.093864, -0.1845335, -2.35463, 0, 0, 1, 1, 1,
-1.092512, -0.4572319, -1.163232, 1, 0, 0, 1, 1,
-1.081851, -0.9990346, -0.7101827, 1, 0, 0, 1, 1,
-1.068269, 0.2627333, -0.7247571, 1, 0, 0, 1, 1,
-1.068036, -0.7358837, -2.376178, 1, 0, 0, 1, 1,
-1.066648, 0.3163816, -0.03824421, 1, 0, 0, 1, 1,
-1.060888, 0.0617195, -0.06227014, 0, 0, 0, 1, 1,
-1.050926, 0.771853, -0.4767074, 0, 0, 0, 1, 1,
-1.047302, -1.203142, -2.906168, 0, 0, 0, 1, 1,
-1.040265, -0.5817446, -2.137568, 0, 0, 0, 1, 1,
-1.03846, 0.9892663, -2.560618, 0, 0, 0, 1, 1,
-1.035403, -2.03568, -2.083815, 0, 0, 0, 1, 1,
-1.028162, 1.345537, -0.6136799, 0, 0, 0, 1, 1,
-1.023791, 0.3339704, -1.601101, 1, 1, 1, 1, 1,
-1.021694, 0.8837731, 0.05387785, 1, 1, 1, 1, 1,
-1.019618, -0.1216774, -0.831516, 1, 1, 1, 1, 1,
-1.016278, -1.69524, -1.673531, 1, 1, 1, 1, 1,
-1.011735, -0.02242533, -2.678645, 1, 1, 1, 1, 1,
-1.010743, -0.9852545, -3.108195, 1, 1, 1, 1, 1,
-1.007399, 1.04756, -0.686916, 1, 1, 1, 1, 1,
-1.005512, 0.4873583, -1.507169, 1, 1, 1, 1, 1,
-1.005353, 0.1033364, -1.45753, 1, 1, 1, 1, 1,
-1.005205, 0.322145, -1.189355, 1, 1, 1, 1, 1,
-1.002416, 0.6970155, -0.3518824, 1, 1, 1, 1, 1,
-0.9891419, 0.3356037, -1.320427, 1, 1, 1, 1, 1,
-0.9814823, 0.64991, -0.171701, 1, 1, 1, 1, 1,
-0.9792505, 0.6892008, -0.7775943, 1, 1, 1, 1, 1,
-0.975768, -1.487347, -0.8773714, 1, 1, 1, 1, 1,
-0.9723911, -0.6967133, -1.078295, 0, 0, 1, 1, 1,
-0.9700552, 1.442227, 1.183185, 1, 0, 0, 1, 1,
-0.9699655, -0.5651423, -0.5108174, 1, 0, 0, 1, 1,
-0.9693867, 0.8505546, -1.662218, 1, 0, 0, 1, 1,
-0.9680076, -1.47326, -3.983406, 1, 0, 0, 1, 1,
-0.9604541, 0.8289422, 0.05451649, 1, 0, 0, 1, 1,
-0.9548037, 0.8689447, -1.262288, 0, 0, 0, 1, 1,
-0.9545964, 0.08789532, -1.649724, 0, 0, 0, 1, 1,
-0.9498785, 0.9664382, -0.02237076, 0, 0, 0, 1, 1,
-0.9482375, 0.2058392, -1.460438, 0, 0, 0, 1, 1,
-0.9392522, 1.663447, -1.745548, 0, 0, 0, 1, 1,
-0.9349769, 0.6463018, -0.3942027, 0, 0, 0, 1, 1,
-0.9285262, -0.4032282, -1.93874, 0, 0, 0, 1, 1,
-0.9103307, 0.917417, -1.989926, 1, 1, 1, 1, 1,
-0.9103076, -0.8233272, -2.025168, 1, 1, 1, 1, 1,
-0.9028406, -0.6543035, -2.007264, 1, 1, 1, 1, 1,
-0.9014947, -0.9223378, -5.857928, 1, 1, 1, 1, 1,
-0.8986359, -0.3689001, -1.38451, 1, 1, 1, 1, 1,
-0.893207, 0.1392386, -2.185086, 1, 1, 1, 1, 1,
-0.8829889, 0.6963653, -1.339751, 1, 1, 1, 1, 1,
-0.8804082, 0.05922676, -1.174263, 1, 1, 1, 1, 1,
-0.8796168, 1.908799, -1.004307, 1, 1, 1, 1, 1,
-0.876497, 2.770702, -0.1681922, 1, 1, 1, 1, 1,
-0.873138, -0.0341675, -2.704061, 1, 1, 1, 1, 1,
-0.8717619, 2.874502, -0.3381831, 1, 1, 1, 1, 1,
-0.8713027, -0.3138798, -0.6557708, 1, 1, 1, 1, 1,
-0.8708317, 0.7699912, -0.464406, 1, 1, 1, 1, 1,
-0.8678602, 0.06308758, -1.656681, 1, 1, 1, 1, 1,
-0.8660192, -0.2959196, -1.683898, 0, 0, 1, 1, 1,
-0.8659106, -0.05379639, -3.795033, 1, 0, 0, 1, 1,
-0.8595375, -0.9035483, -0.8442168, 1, 0, 0, 1, 1,
-0.8577082, 1.424853, -0.6277434, 1, 0, 0, 1, 1,
-0.8563731, -1.612285, -2.737412, 1, 0, 0, 1, 1,
-0.8540924, -0.5674237, -3.747372, 1, 0, 0, 1, 1,
-0.8509368, -1.566687, -1.259866, 0, 0, 0, 1, 1,
-0.8497961, -0.5626227, -2.049767, 0, 0, 0, 1, 1,
-0.8496994, 0.03813254, -0.4551164, 0, 0, 0, 1, 1,
-0.849525, 0.9341131, -1.816898, 0, 0, 0, 1, 1,
-0.8460186, 0.4836501, -3.186526, 0, 0, 0, 1, 1,
-0.8435879, -1.059938, -0.003561843, 0, 0, 0, 1, 1,
-0.8413772, 0.6661943, -0.9497981, 0, 0, 0, 1, 1,
-0.8400568, -0.8524238, -2.549913, 1, 1, 1, 1, 1,
-0.833472, 0.1005508, -1.931015, 1, 1, 1, 1, 1,
-0.8331186, -1.017622, -2.468714, 1, 1, 1, 1, 1,
-0.8313026, -0.2028883, -2.950264, 1, 1, 1, 1, 1,
-0.831301, -1.086219, -3.359194, 1, 1, 1, 1, 1,
-0.8237597, 0.6824635, -2.618644, 1, 1, 1, 1, 1,
-0.8180631, 1.02408, -0.8589994, 1, 1, 1, 1, 1,
-0.8179604, -2.179344, -3.457295, 1, 1, 1, 1, 1,
-0.8171776, 0.6924824, -2.215541, 1, 1, 1, 1, 1,
-0.812561, 0.347954, -2.28236, 1, 1, 1, 1, 1,
-0.8065472, 0.7349839, -2.063046, 1, 1, 1, 1, 1,
-0.8061571, 0.9838079, -0.9843675, 1, 1, 1, 1, 1,
-0.8044581, -0.1947009, -1.393178, 1, 1, 1, 1, 1,
-0.7930382, -1.595272, -2.686215, 1, 1, 1, 1, 1,
-0.7916523, -1.210984, -3.049847, 1, 1, 1, 1, 1,
-0.7749596, 0.2307553, -2.331645, 0, 0, 1, 1, 1,
-0.7674269, -0.2835469, -1.238366, 1, 0, 0, 1, 1,
-0.7671816, -0.02998847, -2.129626, 1, 0, 0, 1, 1,
-0.7638779, 0.3730675, -1.427238, 1, 0, 0, 1, 1,
-0.7607966, 0.3111078, -1.868704, 1, 0, 0, 1, 1,
-0.7552883, 2.203253, -0.2723784, 1, 0, 0, 1, 1,
-0.7537497, -1.357124, -1.408484, 0, 0, 0, 1, 1,
-0.7449221, -2.149444, -4.414464, 0, 0, 0, 1, 1,
-0.743364, -1.065028, -2.489415, 0, 0, 0, 1, 1,
-0.7371863, 0.1732057, -1.086909, 0, 0, 0, 1, 1,
-0.735534, -1.217455, -1.652097, 0, 0, 0, 1, 1,
-0.7339733, 0.9328168, 0.4114754, 0, 0, 0, 1, 1,
-0.7337397, -0.9318451, -3.268154, 0, 0, 0, 1, 1,
-0.7313027, 1.712739, -1.203196, 1, 1, 1, 1, 1,
-0.7224958, 0.7120847, -0.3254393, 1, 1, 1, 1, 1,
-0.712528, 1.438795, -0.6670635, 1, 1, 1, 1, 1,
-0.703522, -1.820966, -2.354239, 1, 1, 1, 1, 1,
-0.7013381, 0.01156264, 0.7658337, 1, 1, 1, 1, 1,
-0.7005574, -0.3529018, -1.523768, 1, 1, 1, 1, 1,
-0.7004502, -0.09349495, -2.548713, 1, 1, 1, 1, 1,
-0.6986929, -0.7229071, -3.233106, 1, 1, 1, 1, 1,
-0.6982858, 0.7902763, 0.3910937, 1, 1, 1, 1, 1,
-0.6962919, 1.686116, 0.5880389, 1, 1, 1, 1, 1,
-0.6912288, 0.6111859, -2.368734, 1, 1, 1, 1, 1,
-0.6909544, -0.6993234, -2.891561, 1, 1, 1, 1, 1,
-0.690831, 0.9674326, -1.139766, 1, 1, 1, 1, 1,
-0.688816, 0.5753315, -0.9646457, 1, 1, 1, 1, 1,
-0.6884881, 1.562122, 1.449129, 1, 1, 1, 1, 1,
-0.684164, -0.7485138, -3.632928, 0, 0, 1, 1, 1,
-0.6807278, 0.591526, 0.5610376, 1, 0, 0, 1, 1,
-0.6792893, 2.026155, -1.50102, 1, 0, 0, 1, 1,
-0.673043, 1.546924, 1.110577, 1, 0, 0, 1, 1,
-0.6727352, -0.001598255, -1.82444, 1, 0, 0, 1, 1,
-0.6678749, -1.030483, -3.440506, 1, 0, 0, 1, 1,
-0.6553716, 1.179157, -2.01816, 0, 0, 0, 1, 1,
-0.6516488, 1.074717, -0.1169953, 0, 0, 0, 1, 1,
-0.6495343, -1.575638, -2.613219, 0, 0, 0, 1, 1,
-0.6421481, -0.5667106, -1.00514, 0, 0, 0, 1, 1,
-0.6413299, -1.079961, -3.117181, 0, 0, 0, 1, 1,
-0.6410928, 1.206932, -1.32482, 0, 0, 0, 1, 1,
-0.6354316, -0.6941785, -4.101546, 0, 0, 0, 1, 1,
-0.6316385, 0.04597634, -0.5430287, 1, 1, 1, 1, 1,
-0.6212214, -0.2510505, -2.452399, 1, 1, 1, 1, 1,
-0.6201839, -1.076608, -3.024039, 1, 1, 1, 1, 1,
-0.617565, -0.4305846, -1.634817, 1, 1, 1, 1, 1,
-0.614796, -0.3800369, -2.268858, 1, 1, 1, 1, 1,
-0.6111372, -0.8296551, -3.886983, 1, 1, 1, 1, 1,
-0.6076467, 0.8593196, -0.3880332, 1, 1, 1, 1, 1,
-0.6047212, 1.091384, 0.0670144, 1, 1, 1, 1, 1,
-0.5962593, 1.684389, -0.2340859, 1, 1, 1, 1, 1,
-0.5912595, 1.830757, -0.884928, 1, 1, 1, 1, 1,
-0.5905382, 0.5873461, -1.388512, 1, 1, 1, 1, 1,
-0.5884096, -0.2519681, -1.036461, 1, 1, 1, 1, 1,
-0.5868149, -0.7720408, -2.683205, 1, 1, 1, 1, 1,
-0.5802661, 0.981288, -1.063848, 1, 1, 1, 1, 1,
-0.5732246, -0.997275, -2.079605, 1, 1, 1, 1, 1,
-0.5706745, 0.1004686, -1.102198, 0, 0, 1, 1, 1,
-0.5701919, 0.2499008, -0.9939783, 1, 0, 0, 1, 1,
-0.5701183, -0.7275254, -2.465776, 1, 0, 0, 1, 1,
-0.5677374, 0.7321405, -1.027816, 1, 0, 0, 1, 1,
-0.5626392, 0.9250258, -1.321652, 1, 0, 0, 1, 1,
-0.5620311, 0.1648761, -1.564559, 1, 0, 0, 1, 1,
-0.5599841, -1.227341, -3.820453, 0, 0, 0, 1, 1,
-0.559783, -0.3015157, -2.072335, 0, 0, 0, 1, 1,
-0.5580588, 1.223624, -2.100598, 0, 0, 0, 1, 1,
-0.5577582, 0.1861926, -0.2741478, 0, 0, 0, 1, 1,
-0.5566735, -1.383408, -1.814307, 0, 0, 0, 1, 1,
-0.5533988, -0.365198, -2.164609, 0, 0, 0, 1, 1,
-0.5504798, -0.9847425, -0.9996948, 0, 0, 0, 1, 1,
-0.5483912, -2.005478, -2.995638, 1, 1, 1, 1, 1,
-0.547909, 0.4751803, 0.03005227, 1, 1, 1, 1, 1,
-0.5461414, 0.2128699, -1.117872, 1, 1, 1, 1, 1,
-0.5433615, 0.008654025, -1.83821, 1, 1, 1, 1, 1,
-0.5431386, 0.3530885, 0.73617, 1, 1, 1, 1, 1,
-0.5420064, 0.4023141, -0.9736191, 1, 1, 1, 1, 1,
-0.5404339, 0.2051505, -1.800444, 1, 1, 1, 1, 1,
-0.5398937, -0.3603881, -2.833982, 1, 1, 1, 1, 1,
-0.5354039, 1.868072, -0.7177616, 1, 1, 1, 1, 1,
-0.5339639, -0.2573856, -1.025215, 1, 1, 1, 1, 1,
-0.5303856, -0.971408, -2.956159, 1, 1, 1, 1, 1,
-0.5224128, -1.776846, -1.432145, 1, 1, 1, 1, 1,
-0.5197805, 0.7736842, -1.026237, 1, 1, 1, 1, 1,
-0.518078, -0.2186481, -0.7276407, 1, 1, 1, 1, 1,
-0.5125052, -1.045985, -3.478735, 1, 1, 1, 1, 1,
-0.5113934, 1.298874, -1.127755, 0, 0, 1, 1, 1,
-0.5106732, 0.4506612, -2.167719, 1, 0, 0, 1, 1,
-0.5070561, -0.9377629, -2.259382, 1, 0, 0, 1, 1,
-0.5064763, -0.3794349, -2.225268, 1, 0, 0, 1, 1,
-0.5064083, 0.02751125, -2.192882, 1, 0, 0, 1, 1,
-0.5063214, -0.3922457, -2.813518, 1, 0, 0, 1, 1,
-0.5018997, -1.390244, -0.3396198, 0, 0, 0, 1, 1,
-0.5004661, -1.147093, -0.9036154, 0, 0, 0, 1, 1,
-0.4944316, -1.002964, -3.604615, 0, 0, 0, 1, 1,
-0.4929061, 1.314706, 0.9358725, 0, 0, 0, 1, 1,
-0.4912652, -1.165467, -1.953017, 0, 0, 0, 1, 1,
-0.4897714, -0.3006245, -2.230317, 0, 0, 0, 1, 1,
-0.4875564, -1.181939, -4.746337, 0, 0, 0, 1, 1,
-0.4862943, 0.06768955, -1.404499, 1, 1, 1, 1, 1,
-0.4826643, 1.581608, 1.228684, 1, 1, 1, 1, 1,
-0.481509, -0.1530705, -3.828983, 1, 1, 1, 1, 1,
-0.4803099, -0.9331168, -3.027051, 1, 1, 1, 1, 1,
-0.4770974, 1.131521, -0.7070997, 1, 1, 1, 1, 1,
-0.4699043, -1.085675, -2.875436, 1, 1, 1, 1, 1,
-0.4682476, -2.17764, -1.637547, 1, 1, 1, 1, 1,
-0.4665563, -0.9184313, -4.014723, 1, 1, 1, 1, 1,
-0.4553191, 0.458476, 0.2468084, 1, 1, 1, 1, 1,
-0.4515382, 1.26668, -1.070787, 1, 1, 1, 1, 1,
-0.4481351, -0.3800518, -2.679671, 1, 1, 1, 1, 1,
-0.4455444, -2.50526, -1.969259, 1, 1, 1, 1, 1,
-0.4426962, 0.7241986, 1.880403, 1, 1, 1, 1, 1,
-0.4424922, 2.031513, -0.9909014, 1, 1, 1, 1, 1,
-0.4331669, -1.825789, -3.70942, 1, 1, 1, 1, 1,
-0.431735, -1.643133, -0.6158767, 0, 0, 1, 1, 1,
-0.4283925, 1.580286, -0.945954, 1, 0, 0, 1, 1,
-0.4262429, 0.2259005, -1.084599, 1, 0, 0, 1, 1,
-0.4261748, -1.781932, -1.61455, 1, 0, 0, 1, 1,
-0.4255389, -0.2693379, -1.960115, 1, 0, 0, 1, 1,
-0.4220835, -0.3369708, -2.468221, 1, 0, 0, 1, 1,
-0.4219119, 1.122781, -1.041302, 0, 0, 0, 1, 1,
-0.4171135, 1.43923, -0.3884448, 0, 0, 0, 1, 1,
-0.4117742, 0.8365579, 0.4058515, 0, 0, 0, 1, 1,
-0.411525, 1.562161, 0.7142215, 0, 0, 0, 1, 1,
-0.4108726, -0.4650298, -0.8604622, 0, 0, 0, 1, 1,
-0.4088256, 0.2649607, -0.2843436, 0, 0, 0, 1, 1,
-0.4084063, 0.7327201, -0.1589852, 0, 0, 0, 1, 1,
-0.4024524, 0.05536118, -2.415196, 1, 1, 1, 1, 1,
-0.3969557, 0.3063798, -1.016065, 1, 1, 1, 1, 1,
-0.3964761, -1.821263, -3.833803, 1, 1, 1, 1, 1,
-0.3963008, -0.2573081, -1.655744, 1, 1, 1, 1, 1,
-0.3926284, 0.8417221, -0.3187658, 1, 1, 1, 1, 1,
-0.3827247, -0.8035097, -2.950994, 1, 1, 1, 1, 1,
-0.3813646, 0.503214, -0.4116937, 1, 1, 1, 1, 1,
-0.3802281, 0.4209942, -1.601895, 1, 1, 1, 1, 1,
-0.3787385, -1.760968, -3.29833, 1, 1, 1, 1, 1,
-0.3716606, -0.2807868, -2.187608, 1, 1, 1, 1, 1,
-0.3705997, -1.240183, -3.460946, 1, 1, 1, 1, 1,
-0.3665616, -0.7814581, -1.85105, 1, 1, 1, 1, 1,
-0.364728, -0.4809555, -4.084496, 1, 1, 1, 1, 1,
-0.3443748, 0.5159621, -0.8687633, 1, 1, 1, 1, 1,
-0.3422952, 0.5558883, -2.063282, 1, 1, 1, 1, 1,
-0.3420244, -0.7968271, -4.29705, 0, 0, 1, 1, 1,
-0.3389055, -0.5271102, -3.49285, 1, 0, 0, 1, 1,
-0.3360453, -1.125258, -3.778125, 1, 0, 0, 1, 1,
-0.335813, 0.2741023, -0.0459429, 1, 0, 0, 1, 1,
-0.3329643, -2.236579, -2.869593, 1, 0, 0, 1, 1,
-0.3316734, 0.7983698, -1.504021, 1, 0, 0, 1, 1,
-0.3261457, 0.245031, -0.834735, 0, 0, 0, 1, 1,
-0.3242342, -0.5539398, -0.2937845, 0, 0, 0, 1, 1,
-0.3213497, -0.8023479, -1.250172, 0, 0, 0, 1, 1,
-0.3202696, 0.4582243, 0.1976362, 0, 0, 0, 1, 1,
-0.310566, -0.3065866, -2.475945, 0, 0, 0, 1, 1,
-0.3098633, 0.4136359, -1.687874, 0, 0, 0, 1, 1,
-0.3064536, -1.910951, -5.053779, 0, 0, 0, 1, 1,
-0.3014956, 0.7110273, -0.982347, 1, 1, 1, 1, 1,
-0.2996885, 2.420197, -0.9605682, 1, 1, 1, 1, 1,
-0.2923246, 1.387646, -1.986039, 1, 1, 1, 1, 1,
-0.2917321, 0.845151, -0.5392095, 1, 1, 1, 1, 1,
-0.2879199, 0.7685694, 0.283411, 1, 1, 1, 1, 1,
-0.2860857, 0.780169, -0.3617253, 1, 1, 1, 1, 1,
-0.2828756, 0.3454729, -0.6134081, 1, 1, 1, 1, 1,
-0.279004, -0.7038835, -2.43596, 1, 1, 1, 1, 1,
-0.2790031, 0.6303733, -0.7237831, 1, 1, 1, 1, 1,
-0.2775241, -1.246214, -4.049362, 1, 1, 1, 1, 1,
-0.2744461, 1.624257, -1.263192, 1, 1, 1, 1, 1,
-0.2743829, 0.7746354, 0.7122022, 1, 1, 1, 1, 1,
-0.2722422, -0.5850744, -1.491256, 1, 1, 1, 1, 1,
-0.2706426, -0.9773383, -4.401711, 1, 1, 1, 1, 1,
-0.2701223, 0.3680921, -1.449387, 1, 1, 1, 1, 1,
-0.267508, 0.9092176, -1.153437, 0, 0, 1, 1, 1,
-0.267308, 0.4522581, 2.17392, 1, 0, 0, 1, 1,
-0.2655067, 1.003047, 1.326658, 1, 0, 0, 1, 1,
-0.2641656, 0.6624951, -0.4154862, 1, 0, 0, 1, 1,
-0.2536234, -1.083633, -2.650202, 1, 0, 0, 1, 1,
-0.2512398, -0.3450762, -1.078329, 1, 0, 0, 1, 1,
-0.2504175, -0.7683617, -2.218838, 0, 0, 0, 1, 1,
-0.2484964, -0.03849588, -1.078956, 0, 0, 0, 1, 1,
-0.2484794, -0.7576187, -1.727622, 0, 0, 0, 1, 1,
-0.2472235, 0.9203445, -0.3012407, 0, 0, 0, 1, 1,
-0.2421517, -0.5598635, -3.144903, 0, 0, 0, 1, 1,
-0.2399309, -1.175109, -4.25853, 0, 0, 0, 1, 1,
-0.2381412, 1.277653, 0.8338175, 0, 0, 0, 1, 1,
-0.2379516, 1.786493, -1.393344, 1, 1, 1, 1, 1,
-0.2364645, -0.8271796, -4.042605, 1, 1, 1, 1, 1,
-0.2354076, -1.563448, -4.187129, 1, 1, 1, 1, 1,
-0.2259342, -0.5342767, -4.727271, 1, 1, 1, 1, 1,
-0.2252533, 1.380416, 0.06024702, 1, 1, 1, 1, 1,
-0.2212608, 0.2320654, -0.6412199, 1, 1, 1, 1, 1,
-0.2174103, -0.09520103, -2.03109, 1, 1, 1, 1, 1,
-0.2161368, 0.9389657, 1.42878, 1, 1, 1, 1, 1,
-0.2156689, -0.3851077, -4.815848, 1, 1, 1, 1, 1,
-0.2134469, -0.7518386, -1.667772, 1, 1, 1, 1, 1,
-0.2133637, 1.125815, -0.1720139, 1, 1, 1, 1, 1,
-0.2129243, -0.7821229, -2.787616, 1, 1, 1, 1, 1,
-0.2085567, -0.2168224, -0.9570221, 1, 1, 1, 1, 1,
-0.2067627, 0.004037464, -2.385256, 1, 1, 1, 1, 1,
-0.2055201, -0.3845225, -2.868563, 1, 1, 1, 1, 1,
-0.2051258, 0.8249884, -0.9537138, 0, 0, 1, 1, 1,
-0.2039386, 0.3071731, -1.176062, 1, 0, 0, 1, 1,
-0.2033716, 0.0008626349, -1.974049, 1, 0, 0, 1, 1,
-0.2002431, 0.5610591, 0.9025341, 1, 0, 0, 1, 1,
-0.1852722, -0.782229, -3.552104, 1, 0, 0, 1, 1,
-0.1796121, -0.978293, -1.828567, 1, 0, 0, 1, 1,
-0.1788919, -1.820503, -3.962166, 0, 0, 0, 1, 1,
-0.1770256, 0.4270837, -1.145565, 0, 0, 0, 1, 1,
-0.1757347, -0.9214908, -5.827502, 0, 0, 0, 1, 1,
-0.1747431, 0.6906323, 0.6505224, 0, 0, 0, 1, 1,
-0.1739119, 0.6371863, -1.556011, 0, 0, 0, 1, 1,
-0.172519, 0.1495828, -0.3392223, 0, 0, 0, 1, 1,
-0.1723902, 0.7533731, -0.8393252, 0, 0, 0, 1, 1,
-0.170764, -1.877975, -2.813959, 1, 1, 1, 1, 1,
-0.1702044, 0.03259547, -3.096836, 1, 1, 1, 1, 1,
-0.1663339, -0.08469074, -2.09752, 1, 1, 1, 1, 1,
-0.163085, 0.9145963, -1.852886, 1, 1, 1, 1, 1,
-0.1625876, 1.214014, -0.1839407, 1, 1, 1, 1, 1,
-0.1557463, 1.205234, -1.158494, 1, 1, 1, 1, 1,
-0.1556392, -0.166617, -1.80063, 1, 1, 1, 1, 1,
-0.1549961, 0.4001352, -1.557459, 1, 1, 1, 1, 1,
-0.1518697, 0.3388074, -1.162618, 1, 1, 1, 1, 1,
-0.1516529, 0.6362606, -0.6555743, 1, 1, 1, 1, 1,
-0.1512296, -0.8824249, -1.574652, 1, 1, 1, 1, 1,
-0.1461485, 1.000221, 0.2463387, 1, 1, 1, 1, 1,
-0.1417447, 0.1423929, 0.5052539, 1, 1, 1, 1, 1,
-0.1403656, -0.7175812, -4.09458, 1, 1, 1, 1, 1,
-0.1401855, -0.3380767, -3.509896, 1, 1, 1, 1, 1,
-0.1376965, 0.3996557, 0.6920267, 0, 0, 1, 1, 1,
-0.1289899, -0.2348558, -2.191556, 1, 0, 0, 1, 1,
-0.1277524, -0.7253458, -2.678493, 1, 0, 0, 1, 1,
-0.118853, 0.949179, -1.272043, 1, 0, 0, 1, 1,
-0.1188404, 0.5796129, 1.162817, 1, 0, 0, 1, 1,
-0.1183395, -1.287895, -1.939218, 1, 0, 0, 1, 1,
-0.1144667, -1.311739, -2.514164, 0, 0, 0, 1, 1,
-0.1138934, 1.368672, -0.3434629, 0, 0, 0, 1, 1,
-0.113851, -0.8255101, -4.032025, 0, 0, 0, 1, 1,
-0.112038, -0.8702989, -4.063072, 0, 0, 0, 1, 1,
-0.1094813, 1.058496, 1.793548, 0, 0, 0, 1, 1,
-0.1039258, -1.409647, -4.105539, 0, 0, 0, 1, 1,
-0.09928646, -0.04187119, -1.932921, 0, 0, 0, 1, 1,
-0.09920816, 1.22406, 0.06460499, 1, 1, 1, 1, 1,
-0.09670616, -0.9744424, -3.177789, 1, 1, 1, 1, 1,
-0.09415244, 2.359457, 0.2148319, 1, 1, 1, 1, 1,
-0.09112205, -0.4707595, -1.465503, 1, 1, 1, 1, 1,
-0.09049556, 1.571215, -0.9820304, 1, 1, 1, 1, 1,
-0.0885791, -1.702501, -4.283629, 1, 1, 1, 1, 1,
-0.08854985, 1.607359, 0.2983089, 1, 1, 1, 1, 1,
-0.08658832, -2.645858, -5.130219, 1, 1, 1, 1, 1,
-0.08619543, -0.8067168, -3.802681, 1, 1, 1, 1, 1,
-0.08080345, -0.3935653, -2.939728, 1, 1, 1, 1, 1,
-0.07915805, -1.129884, -4.209729, 1, 1, 1, 1, 1,
-0.07412857, -0.07978124, -2.955326, 1, 1, 1, 1, 1,
-0.07398876, -1.88015, -0.8177007, 1, 1, 1, 1, 1,
-0.07091902, 0.7748268, -2.01081, 1, 1, 1, 1, 1,
-0.0702782, 0.1948598, -0.4175061, 1, 1, 1, 1, 1,
-0.06886113, -1.060279, -2.660581, 0, 0, 1, 1, 1,
-0.06587408, -1.137359, -3.396482, 1, 0, 0, 1, 1,
-0.05677166, 0.6505449, -0.4700399, 1, 0, 0, 1, 1,
-0.05621871, -0.2192934, -0.6491994, 1, 0, 0, 1, 1,
-0.05492072, 0.1700428, 0.5134, 1, 0, 0, 1, 1,
-0.05047048, 0.522492, 0.3333625, 1, 0, 0, 1, 1,
-0.04547221, -0.7383057, -3.626282, 0, 0, 0, 1, 1,
-0.04255389, 1.730251, -0.562933, 0, 0, 0, 1, 1,
-0.04179708, -0.486385, -4.118128, 0, 0, 0, 1, 1,
-0.04143983, -1.055885, -2.27319, 0, 0, 0, 1, 1,
-0.03960834, 0.8980188, 0.786324, 0, 0, 0, 1, 1,
-0.03941666, -0.9875391, -4.281386, 0, 0, 0, 1, 1,
-0.03871052, 0.4582483, -0.9095907, 0, 0, 0, 1, 1,
-0.03837176, -0.608566, -3.304384, 1, 1, 1, 1, 1,
-0.03626297, -0.2905329, -1.771968, 1, 1, 1, 1, 1,
-0.0344535, 0.08790127, -2.470978, 1, 1, 1, 1, 1,
-0.03157144, 1.012223, 0.8296187, 1, 1, 1, 1, 1,
-0.02961723, -0.8867154, -3.536685, 1, 1, 1, 1, 1,
-0.02869548, 1.241157, 0.4593026, 1, 1, 1, 1, 1,
-0.02593086, -2.344111, -3.632032, 1, 1, 1, 1, 1,
-0.01680743, 1.102795, 0.6753478, 1, 1, 1, 1, 1,
-0.0167549, 0.5216666, 2.566969, 1, 1, 1, 1, 1,
-0.01552964, -0.1954836, -1.697807, 1, 1, 1, 1, 1,
-0.0151481, 0.6225755, 0.3551963, 1, 1, 1, 1, 1,
-0.01429934, -0.222215, -2.853136, 1, 1, 1, 1, 1,
-0.01326091, -0.4970318, -3.083104, 1, 1, 1, 1, 1,
-0.00784109, 1.723465, 0.4750701, 1, 1, 1, 1, 1,
-0.007252597, 2.282373, -0.003253972, 1, 1, 1, 1, 1,
-0.005264676, 1.696852, 1.740165, 0, 0, 1, 1, 1,
-0.004433098, 2.496195, -1.020514, 1, 0, 0, 1, 1,
-0.004284817, 1.141751, 1.806041, 1, 0, 0, 1, 1,
-0.0002106743, 0.2550049, -0.6960105, 1, 0, 0, 1, 1,
0.0001148616, 0.2277341, 0.8306455, 1, 0, 0, 1, 1,
0.001746284, 1.32334, -0.04599733, 1, 0, 0, 1, 1,
0.002314318, 0.04805441, 1.05216, 0, 0, 0, 1, 1,
0.004095908, -1.511189, 3.418179, 0, 0, 0, 1, 1,
0.006408751, 0.7799595, -0.8701775, 0, 0, 0, 1, 1,
0.006709758, 2.327254, -1.718687, 0, 0, 0, 1, 1,
0.01280524, 0.7227646, -0.5198356, 0, 0, 0, 1, 1,
0.01421694, -0.4396366, 2.756192, 0, 0, 0, 1, 1,
0.01426551, 1.362766, -1.063299, 0, 0, 0, 1, 1,
0.01439101, 0.3397506, -1.164784, 1, 1, 1, 1, 1,
0.0151398, 0.639334, -0.8045717, 1, 1, 1, 1, 1,
0.01767033, -0.1218216, 3.88403, 1, 1, 1, 1, 1,
0.01826287, 0.6417819, -0.6144271, 1, 1, 1, 1, 1,
0.01892718, 1.338625, 0.4150562, 1, 1, 1, 1, 1,
0.02144505, -0.913092, 2.306667, 1, 1, 1, 1, 1,
0.02210275, 0.7558899, 0.4522531, 1, 1, 1, 1, 1,
0.02604067, 2.926728, -1.693655, 1, 1, 1, 1, 1,
0.02650383, -0.6957713, 4.70328, 1, 1, 1, 1, 1,
0.02733692, 0.8671569, 0.3230159, 1, 1, 1, 1, 1,
0.02915308, -0.9026478, 2.1325, 1, 1, 1, 1, 1,
0.03315135, -0.09967261, 4.826338, 1, 1, 1, 1, 1,
0.03702474, 1.467668, 0.1404495, 1, 1, 1, 1, 1,
0.03749752, 1.101851, -0.01004221, 1, 1, 1, 1, 1,
0.03816152, 0.5706351, 0.8908289, 1, 1, 1, 1, 1,
0.03857546, 1.356485, -1.472503, 0, 0, 1, 1, 1,
0.03972061, 2.234603, 0.4685507, 1, 0, 0, 1, 1,
0.04578865, 1.133796, 1.298068, 1, 0, 0, 1, 1,
0.050958, -0.8482295, 2.596998, 1, 0, 0, 1, 1,
0.05485139, 0.2510329, -0.05008158, 1, 0, 0, 1, 1,
0.05741832, -0.3853831, 2.988617, 1, 0, 0, 1, 1,
0.06088778, -0.9932904, 3.390357, 0, 0, 0, 1, 1,
0.06573156, -0.1814372, 0.8979366, 0, 0, 0, 1, 1,
0.06923297, -0.02086911, 1.308243, 0, 0, 0, 1, 1,
0.06969228, -1.272326, 3.044653, 0, 0, 0, 1, 1,
0.07060152, 0.3114072, -1.005439, 0, 0, 0, 1, 1,
0.07146873, 0.4639722, -0.4901441, 0, 0, 0, 1, 1,
0.0755655, -1.650248, 2.895429, 0, 0, 0, 1, 1,
0.07588109, 1.127864, -0.4430788, 1, 1, 1, 1, 1,
0.07644469, 0.1954449, -0.3797445, 1, 1, 1, 1, 1,
0.08008772, -1.447406, 2.975552, 1, 1, 1, 1, 1,
0.08044166, 0.7966944, -0.5089583, 1, 1, 1, 1, 1,
0.08415717, -0.2219206, 1.610191, 1, 1, 1, 1, 1,
0.08499393, -1.707254, 2.002079, 1, 1, 1, 1, 1,
0.08595981, -0.1354288, 2.602853, 1, 1, 1, 1, 1,
0.09077919, -2.473549, 4.098321, 1, 1, 1, 1, 1,
0.1018606, -0.3271792, 1.825181, 1, 1, 1, 1, 1,
0.1036973, -0.4422672, 4.186368, 1, 1, 1, 1, 1,
0.1097174, -0.509986, 3.088651, 1, 1, 1, 1, 1,
0.1112378, -1.39761, 3.891589, 1, 1, 1, 1, 1,
0.1116051, 1.188847, 1.478837, 1, 1, 1, 1, 1,
0.1156579, -0.2850658, 3.155065, 1, 1, 1, 1, 1,
0.1179105, 0.3636336, 0.9743639, 1, 1, 1, 1, 1,
0.1219893, 1.683884, 0.7853541, 0, 0, 1, 1, 1,
0.1222235, 1.818861, 0.02698562, 1, 0, 0, 1, 1,
0.1297105, 0.4877233, 1.244299, 1, 0, 0, 1, 1,
0.1311062, -0.2551368, 3.470775, 1, 0, 0, 1, 1,
0.1316924, -1.342681, 1.567212, 1, 0, 0, 1, 1,
0.1346761, 0.4209365, 0.7983702, 1, 0, 0, 1, 1,
0.1371865, -0.4730403, 2.43323, 0, 0, 0, 1, 1,
0.1401566, 0.9151513, 0.3912516, 0, 0, 0, 1, 1,
0.1407921, 0.09437478, -0.03708718, 0, 0, 0, 1, 1,
0.149877, 0.007567838, 0.1243213, 0, 0, 0, 1, 1,
0.1499668, 0.4188696, 0.1185688, 0, 0, 0, 1, 1,
0.1588556, 0.9808574, -0.3545701, 0, 0, 0, 1, 1,
0.1612016, 0.5893065, 1.934732, 0, 0, 0, 1, 1,
0.1612313, -0.7013181, 3.712856, 1, 1, 1, 1, 1,
0.1615534, -0.7496035, 2.739785, 1, 1, 1, 1, 1,
0.1663641, -0.6885211, 3.74093, 1, 1, 1, 1, 1,
0.1738304, 0.1091841, -0.09278729, 1, 1, 1, 1, 1,
0.1771933, 1.362923, 1.948012, 1, 1, 1, 1, 1,
0.1800735, 0.2239414, 1.166434, 1, 1, 1, 1, 1,
0.1812877, -0.7773513, 4.090216, 1, 1, 1, 1, 1,
0.1822758, -1.693135, 2.456877, 1, 1, 1, 1, 1,
0.1836572, 0.9932667, -0.8195177, 1, 1, 1, 1, 1,
0.1868988, 0.1117222, 2.605779, 1, 1, 1, 1, 1,
0.189902, -0.7048234, 2.655892, 1, 1, 1, 1, 1,
0.1932835, -0.1040334, 2.778476, 1, 1, 1, 1, 1,
0.1934396, -1.053639, 1.776533, 1, 1, 1, 1, 1,
0.1995127, -0.437252, 3.070636, 1, 1, 1, 1, 1,
0.1998907, -1.238707, 2.027758, 1, 1, 1, 1, 1,
0.2057187, 1.790542, 0.8697481, 0, 0, 1, 1, 1,
0.2071759, 1.557434, 0.2445904, 1, 0, 0, 1, 1,
0.2075337, 0.7702365, -1.264734, 1, 0, 0, 1, 1,
0.2088401, -0.6001432, 2.390381, 1, 0, 0, 1, 1,
0.2104376, 1.750768, 0.9187419, 1, 0, 0, 1, 1,
0.212316, 0.06335513, 1.158191, 1, 0, 0, 1, 1,
0.2143516, -0.023247, 4.209002, 0, 0, 0, 1, 1,
0.21557, 0.5917155, -0.5637202, 0, 0, 0, 1, 1,
0.216262, 1.444929, 0.4262011, 0, 0, 0, 1, 1,
0.2169905, -0.3310409, 2.99698, 0, 0, 0, 1, 1,
0.2176471, 1.156822, 0.4505498, 0, 0, 0, 1, 1,
0.2193579, -0.7030539, 1.48614, 0, 0, 0, 1, 1,
0.2207495, -1.627767, 0.6441876, 0, 0, 0, 1, 1,
0.2217258, 0.2206956, 1.408922, 1, 1, 1, 1, 1,
0.224411, -1.008423, 1.634928, 1, 1, 1, 1, 1,
0.2319101, -0.1646117, 3.240843, 1, 1, 1, 1, 1,
0.2329378, 1.566742, 0.405473, 1, 1, 1, 1, 1,
0.2376765, 0.0742944, 2.926428, 1, 1, 1, 1, 1,
0.2383413, 1.46463, 1.045493, 1, 1, 1, 1, 1,
0.242589, -0.1481309, 1.458668, 1, 1, 1, 1, 1,
0.246416, 0.9234375, 1.622879, 1, 1, 1, 1, 1,
0.2503496, -1.017765, 4.038208, 1, 1, 1, 1, 1,
0.2535207, -1.295367, 1.730024, 1, 1, 1, 1, 1,
0.2547306, -0.5305986, 4.539671, 1, 1, 1, 1, 1,
0.255845, 0.5463915, 1.049888, 1, 1, 1, 1, 1,
0.2566308, -0.284578, 4.369886, 1, 1, 1, 1, 1,
0.2639083, -1.765082, 3.982705, 1, 1, 1, 1, 1,
0.2642142, -0.5220784, 2.422314, 1, 1, 1, 1, 1,
0.2680894, 1.20206, 0.8197379, 0, 0, 1, 1, 1,
0.2686692, -0.7121798, 3.58606, 1, 0, 0, 1, 1,
0.2833745, 0.1664914, 0.1693745, 1, 0, 0, 1, 1,
0.2834377, -0.3765396, 1.594399, 1, 0, 0, 1, 1,
0.2842863, 0.354822, 1.017905, 1, 0, 0, 1, 1,
0.2850894, 0.3804528, 2.572725, 1, 0, 0, 1, 1,
0.2867299, 0.3806783, 0.2549169, 0, 0, 0, 1, 1,
0.2914814, -0.6101204, 2.022095, 0, 0, 0, 1, 1,
0.2965943, -1.896925, 3.050472, 0, 0, 0, 1, 1,
0.2996972, -0.273699, 3.906138, 0, 0, 0, 1, 1,
0.3019277, -0.02864915, 2.344869, 0, 0, 0, 1, 1,
0.309265, 1.10541, -1.801405, 0, 0, 0, 1, 1,
0.3152104, 0.9533997, -0.1307151, 0, 0, 0, 1, 1,
0.3226714, 0.3663022, 2.598033, 1, 1, 1, 1, 1,
0.3243548, -1.12004, 2.095419, 1, 1, 1, 1, 1,
0.3293262, 0.410483, 0.3558753, 1, 1, 1, 1, 1,
0.3296618, -0.2085463, 2.564492, 1, 1, 1, 1, 1,
0.330058, -0.8034123, 3.402572, 1, 1, 1, 1, 1,
0.3304502, -0.802423, 3.186383, 1, 1, 1, 1, 1,
0.3310072, 1.390055, 0.256473, 1, 1, 1, 1, 1,
0.3368277, -0.8501309, 2.776042, 1, 1, 1, 1, 1,
0.3368376, -1.465241, 2.603063, 1, 1, 1, 1, 1,
0.3370147, -0.8887235, 3.043227, 1, 1, 1, 1, 1,
0.3384589, -0.2486502, 0.6262789, 1, 1, 1, 1, 1,
0.3406208, -0.5648822, 2.254857, 1, 1, 1, 1, 1,
0.3465649, -0.7556608, 3.068677, 1, 1, 1, 1, 1,
0.3488558, -0.5002604, 2.341919, 1, 1, 1, 1, 1,
0.3549019, 0.2339187, 1.726242, 1, 1, 1, 1, 1,
0.3567491, -0.5595136, 2.959867, 0, 0, 1, 1, 1,
0.3652484, -0.298378, -0.9027265, 1, 0, 0, 1, 1,
0.3653968, -0.5327723, 2.338918, 1, 0, 0, 1, 1,
0.3670991, 0.4249766, 0.3597706, 1, 0, 0, 1, 1,
0.3680125, -1.422413, 1.705603, 1, 0, 0, 1, 1,
0.3777786, 0.9225411, -0.03864356, 1, 0, 0, 1, 1,
0.3890469, -0.5814002, 2.769073, 0, 0, 0, 1, 1,
0.3892547, 1.604681, -1.738482, 0, 0, 0, 1, 1,
0.3900093, 0.6599977, 1.18431, 0, 0, 0, 1, 1,
0.3920385, 0.1384485, 1.01422, 0, 0, 0, 1, 1,
0.3924671, -1.31978, 2.914035, 0, 0, 0, 1, 1,
0.39268, 0.962841, 0.2141949, 0, 0, 0, 1, 1,
0.3981869, 0.1542151, 1.300122, 0, 0, 0, 1, 1,
0.3991279, 0.07869127, 0.8101605, 1, 1, 1, 1, 1,
0.3996874, 0.5355028, 1.372882, 1, 1, 1, 1, 1,
0.4022763, -1.116935, 2.016144, 1, 1, 1, 1, 1,
0.4032681, 1.325236, 0.1570455, 1, 1, 1, 1, 1,
0.404285, 1.124952, 0.2925963, 1, 1, 1, 1, 1,
0.4105223, 1.168939, 0.1338746, 1, 1, 1, 1, 1,
0.4176322, -0.6893279, 2.514567, 1, 1, 1, 1, 1,
0.4195812, 1.233926, 0.8984672, 1, 1, 1, 1, 1,
0.4204151, -1.774628, 3.699288, 1, 1, 1, 1, 1,
0.4218204, 1.197872, -1.459662, 1, 1, 1, 1, 1,
0.4237599, 1.373762, -0.9526566, 1, 1, 1, 1, 1,
0.4256114, -0.5550036, 3.960949, 1, 1, 1, 1, 1,
0.4266288, 0.7420086, 1.292184, 1, 1, 1, 1, 1,
0.4298629, 1.161918, -0.4707351, 1, 1, 1, 1, 1,
0.4317676, 0.5581976, -0.1774584, 1, 1, 1, 1, 1,
0.4321667, -1.088326, 3.029097, 0, 0, 1, 1, 1,
0.4395947, 1.966526, 1.8891, 1, 0, 0, 1, 1,
0.4412748, -1.387867, 3.176815, 1, 0, 0, 1, 1,
0.4434862, 2.579197, -1.686763, 1, 0, 0, 1, 1,
0.4465509, -1.488708, 3.251369, 1, 0, 0, 1, 1,
0.4485434, -0.6650541, 2.445753, 1, 0, 0, 1, 1,
0.4488501, -0.4186786, 3.444724, 0, 0, 0, 1, 1,
0.4547512, 2.350387, -0.6635113, 0, 0, 0, 1, 1,
0.458125, -0.5670103, 3.723608, 0, 0, 0, 1, 1,
0.4608954, -1.333778, 2.677733, 0, 0, 0, 1, 1,
0.4611469, -0.609119, 3.380509, 0, 0, 0, 1, 1,
0.4659863, 1.278997, -0.4513563, 0, 0, 0, 1, 1,
0.4691718, -0.9200532, 1.439642, 0, 0, 0, 1, 1,
0.4711427, 0.4699608, 0.2302262, 1, 1, 1, 1, 1,
0.4734225, 1.641784, 0.2733161, 1, 1, 1, 1, 1,
0.4747089, 0.2510623, 1.108309, 1, 1, 1, 1, 1,
0.4767031, 0.5829461, -0.4450101, 1, 1, 1, 1, 1,
0.4769481, 1.122492, 2.225463, 1, 1, 1, 1, 1,
0.4817995, 0.4848702, -0.4578548, 1, 1, 1, 1, 1,
0.4843341, -0.3312213, 1.641342, 1, 1, 1, 1, 1,
0.4848422, -1.365508, 3.914069, 1, 1, 1, 1, 1,
0.4910508, 1.350805, 1.299928, 1, 1, 1, 1, 1,
0.493729, 0.3572816, 0.7823258, 1, 1, 1, 1, 1,
0.4970621, 0.2443013, 2.582786, 1, 1, 1, 1, 1,
0.4980454, -1.442746, 3.205719, 1, 1, 1, 1, 1,
0.498528, 1.025892, 2.192551, 1, 1, 1, 1, 1,
0.4995957, -1.010857, 2.217398, 1, 1, 1, 1, 1,
0.5022349, 1.966547, 3.528561, 1, 1, 1, 1, 1,
0.5100746, -0.7905249, 1.648134, 0, 0, 1, 1, 1,
0.5148367, 0.8192406, 1.291615, 1, 0, 0, 1, 1,
0.5219167, 1.945131, 2.239795, 1, 0, 0, 1, 1,
0.5231875, 0.06569874, 2.225228, 1, 0, 0, 1, 1,
0.524002, 0.4722918, 0.8379207, 1, 0, 0, 1, 1,
0.5254563, -0.5767982, 2.711188, 1, 0, 0, 1, 1,
0.5274175, -0.6458579, 2.398849, 0, 0, 0, 1, 1,
0.5316846, 0.5724316, 1.886211, 0, 0, 0, 1, 1,
0.5345189, -0.2499343, 2.500342, 0, 0, 0, 1, 1,
0.5353574, 0.5128909, -1.676654, 0, 0, 0, 1, 1,
0.5354241, -0.01444101, 3.114925, 0, 0, 0, 1, 1,
0.5360861, 0.9179265, 0.4325446, 0, 0, 0, 1, 1,
0.5395468, 0.2649625, 1.236466, 0, 0, 0, 1, 1,
0.5402638, -0.09278169, 1.178922, 1, 1, 1, 1, 1,
0.5421777, 1.174214, 0.2267243, 1, 1, 1, 1, 1,
0.5446776, -0.3046808, 1.031314, 1, 1, 1, 1, 1,
0.544687, 0.6251902, 3.007119, 1, 1, 1, 1, 1,
0.5455652, 1.099385, 1.565413, 1, 1, 1, 1, 1,
0.5462189, 0.1449191, 1.638078, 1, 1, 1, 1, 1,
0.5495551, -0.5485383, 3.187981, 1, 1, 1, 1, 1,
0.5544525, 0.6544078, 0.5332015, 1, 1, 1, 1, 1,
0.5550646, 0.4039024, 1.460228, 1, 1, 1, 1, 1,
0.5616623, 0.9021413, 0.6544148, 1, 1, 1, 1, 1,
0.56503, -0.7676924, 1.797914, 1, 1, 1, 1, 1,
0.5673164, -0.009989426, 3.016769, 1, 1, 1, 1, 1,
0.567318, 0.4708426, -0.01577789, 1, 1, 1, 1, 1,
0.5688147, 0.2582429, 0.963293, 1, 1, 1, 1, 1,
0.5706061, 0.5872195, 1.363671, 1, 1, 1, 1, 1,
0.5744222, 0.4996701, 1.654669, 0, 0, 1, 1, 1,
0.5776467, -0.06264195, 2.371684, 1, 0, 0, 1, 1,
0.5825659, -0.539759, 2.151217, 1, 0, 0, 1, 1,
0.585849, 1.381521, 1.888365, 1, 0, 0, 1, 1,
0.5860983, -1.839123, 3.623028, 1, 0, 0, 1, 1,
0.5864449, 0.532748, 2.126304, 1, 0, 0, 1, 1,
0.5929022, -0.1719451, 2.697239, 0, 0, 0, 1, 1,
0.6022613, 0.6676626, 0.4305358, 0, 0, 0, 1, 1,
0.6049553, 2.133025, -1.090724, 0, 0, 0, 1, 1,
0.6116784, 0.6404946, -0.4552776, 0, 0, 0, 1, 1,
0.6127201, 0.1491732, 0.09071919, 0, 0, 0, 1, 1,
0.6196233, -0.7050544, 2.458107, 0, 0, 0, 1, 1,
0.6230434, 0.2728549, 0.3780645, 0, 0, 0, 1, 1,
0.6233068, -1.369898, 2.473975, 1, 1, 1, 1, 1,
0.6339815, 1.120456, 1.123777, 1, 1, 1, 1, 1,
0.6402514, -0.5911453, 3.93283, 1, 1, 1, 1, 1,
0.6457824, 0.3130841, 1.214585, 1, 1, 1, 1, 1,
0.6463096, -0.5956857, 0.09753254, 1, 1, 1, 1, 1,
0.6484007, -0.6208553, 2.113422, 1, 1, 1, 1, 1,
0.6551571, -0.4533383, 1.635992, 1, 1, 1, 1, 1,
0.6574056, -1.189583, 2.920495, 1, 1, 1, 1, 1,
0.6584866, -0.6488823, 2.685116, 1, 1, 1, 1, 1,
0.6615484, 1.073763, 1.047815, 1, 1, 1, 1, 1,
0.6617873, 2.762873, 0.2416871, 1, 1, 1, 1, 1,
0.6622989, 1.591166, -0.8135138, 1, 1, 1, 1, 1,
0.6660365, -1.325534, 3.525268, 1, 1, 1, 1, 1,
0.6734446, 0.6159548, 1.887919, 1, 1, 1, 1, 1,
0.6749918, -1.341152, 3.421459, 1, 1, 1, 1, 1,
0.6775737, 0.7598936, 1.247079, 0, 0, 1, 1, 1,
0.6790018, -1.235167, 4.338006, 1, 0, 0, 1, 1,
0.6867937, 0.008865937, 3.083927, 1, 0, 0, 1, 1,
0.6882136, -0.5841199, 2.082322, 1, 0, 0, 1, 1,
0.6949746, 0.175537, 2.310921, 1, 0, 0, 1, 1,
0.6965301, 0.115668, 0.730785, 1, 0, 0, 1, 1,
0.6973689, -0.4877543, -0.4324182, 0, 0, 0, 1, 1,
0.6978702, -1.060198, 3.307398, 0, 0, 0, 1, 1,
0.7001089, 0.5903366, 0.5031635, 0, 0, 0, 1, 1,
0.7008197, -1.3102, 0.7069647, 0, 0, 0, 1, 1,
0.7034826, 0.1247425, 0.469929, 0, 0, 0, 1, 1,
0.7119586, 1.148741, 0.2395153, 0, 0, 0, 1, 1,
0.7122155, 0.3989365, 0.731812, 0, 0, 0, 1, 1,
0.7140663, -1.405483, 4.219688, 1, 1, 1, 1, 1,
0.7149503, 1.374373, 0.8424655, 1, 1, 1, 1, 1,
0.7155884, -0.2541842, 1.628942, 1, 1, 1, 1, 1,
0.7200778, 1.364064, -0.6080625, 1, 1, 1, 1, 1,
0.7218763, -0.7972105, 1.056034, 1, 1, 1, 1, 1,
0.724189, -1.056979, 2.411221, 1, 1, 1, 1, 1,
0.7258154, 0.0212868, 2.209609, 1, 1, 1, 1, 1,
0.7291841, -0.415214, 1.096643, 1, 1, 1, 1, 1,
0.7308171, -0.5170587, 3.168418, 1, 1, 1, 1, 1,
0.7337498, 1.393752, 1.470364, 1, 1, 1, 1, 1,
0.7343026, -0.9140812, 2.492514, 1, 1, 1, 1, 1,
0.7344651, -0.6743378, 2.443284, 1, 1, 1, 1, 1,
0.734643, -0.7402806, 3.243158, 1, 1, 1, 1, 1,
0.737825, 0.267464, 0.483535, 1, 1, 1, 1, 1,
0.7390859, -0.2465984, 3.497247, 1, 1, 1, 1, 1,
0.7407808, -0.5471872, 2.729122, 0, 0, 1, 1, 1,
0.7478889, -0.3072141, 2.917405, 1, 0, 0, 1, 1,
0.7555791, -1.136593, 3.690962, 1, 0, 0, 1, 1,
0.7579566, -1.610719, 2.540696, 1, 0, 0, 1, 1,
0.7600107, -0.1060628, 2.629403, 1, 0, 0, 1, 1,
0.7614257, -0.564221, 1.402476, 1, 0, 0, 1, 1,
0.7630547, 1.622247, -0.128028, 0, 0, 0, 1, 1,
0.7649379, 0.9944498, -1.450778, 0, 0, 0, 1, 1,
0.7652916, 0.2926381, 3.178679, 0, 0, 0, 1, 1,
0.7668954, 0.2507058, 2.022678, 0, 0, 0, 1, 1,
0.7727067, 0.5012541, 0.2455687, 0, 0, 0, 1, 1,
0.7778276, -0.2977416, 1.467478, 0, 0, 0, 1, 1,
0.7780267, -1.992521, 2.600025, 0, 0, 0, 1, 1,
0.7790624, 0.8717837, 1.31226, 1, 1, 1, 1, 1,
0.7810963, 0.0139493, 1.486186, 1, 1, 1, 1, 1,
0.7836347, 1.247221, 0.6187062, 1, 1, 1, 1, 1,
0.7842728, 0.6531112, 0.8317164, 1, 1, 1, 1, 1,
0.7991968, 0.4902031, -0.1310396, 1, 1, 1, 1, 1,
0.8075337, -0.01944144, -0.1349951, 1, 1, 1, 1, 1,
0.8139153, -0.145439, 3.417121, 1, 1, 1, 1, 1,
0.8145827, -1.21034, 0.136476, 1, 1, 1, 1, 1,
0.8163472, -1.107206, 2.467814, 1, 1, 1, 1, 1,
0.8245032, 0.1996425, 1.57154, 1, 1, 1, 1, 1,
0.8245655, 0.6609742, 0.4818484, 1, 1, 1, 1, 1,
0.8247654, -0.04973258, 1.930489, 1, 1, 1, 1, 1,
0.8280349, 1.541274, 0.5547649, 1, 1, 1, 1, 1,
0.8289873, 0.9293901, 2.286948, 1, 1, 1, 1, 1,
0.8293322, 0.9799758, 2.024056, 1, 1, 1, 1, 1,
0.8398788, 0.1267111, 1.84215, 0, 0, 1, 1, 1,
0.8436306, 0.9453647, -0.1466387, 1, 0, 0, 1, 1,
0.8451939, 0.7145814, -0.05338982, 1, 0, 0, 1, 1,
0.8470034, 2.749476, -0.5724108, 1, 0, 0, 1, 1,
0.8487816, -0.7567872, 3.465907, 1, 0, 0, 1, 1,
0.8494906, 0.006235702, 2.368134, 1, 0, 0, 1, 1,
0.8563258, 0.890749, 0.8849628, 0, 0, 0, 1, 1,
0.8576674, 0.06104289, 2.596309, 0, 0, 0, 1, 1,
0.858294, 0.1934867, 0.2659231, 0, 0, 0, 1, 1,
0.8593978, -0.0171965, 2.099618, 0, 0, 0, 1, 1,
0.871268, -1.6227, 2.497266, 0, 0, 0, 1, 1,
0.877175, 0.0593407, 3.126401, 0, 0, 0, 1, 1,
0.8783939, 1.343075, 0.4604216, 0, 0, 0, 1, 1,
0.8822492, 0.009521535, 2.145036, 1, 1, 1, 1, 1,
0.8881942, -0.8673084, 2.428773, 1, 1, 1, 1, 1,
0.891889, -2.142129, 2.349357, 1, 1, 1, 1, 1,
0.8957585, -0.1193435, 2.023099, 1, 1, 1, 1, 1,
0.89807, -1.016992, 2.514615, 1, 1, 1, 1, 1,
0.9006586, -0.44609, 2.798093, 1, 1, 1, 1, 1,
0.9028445, 2.360405, 1.782663, 1, 1, 1, 1, 1,
0.9079298, -1.340506, 3.064075, 1, 1, 1, 1, 1,
0.9115196, 0.142109, 0.581897, 1, 1, 1, 1, 1,
0.9123716, -0.4370446, 3.176311, 1, 1, 1, 1, 1,
0.9159676, 0.8460347, -0.4142258, 1, 1, 1, 1, 1,
0.916564, -0.3766058, 2.624469, 1, 1, 1, 1, 1,
0.9218354, -1.236206, 3.146748, 1, 1, 1, 1, 1,
0.9259768, -0.4827204, 2.509619, 1, 1, 1, 1, 1,
0.9289072, 0.8741336, 0.7650287, 1, 1, 1, 1, 1,
0.9295977, -0.9444566, 2.925694, 0, 0, 1, 1, 1,
0.9313617, 0.5224115, 0.7083716, 1, 0, 0, 1, 1,
0.9399241, -0.993686, 0.7592987, 1, 0, 0, 1, 1,
0.9422063, -0.07649636, 3.561521, 1, 0, 0, 1, 1,
0.9474478, -1.783415, 3.611853, 1, 0, 0, 1, 1,
0.9514028, 1.712074, 0.1551627, 1, 0, 0, 1, 1,
0.9526029, 0.1429289, 0.7840204, 0, 0, 0, 1, 1,
0.9528372, 0.2550385, 1.052907, 0, 0, 0, 1, 1,
0.9544571, -1.276254, 3.257602, 0, 0, 0, 1, 1,
0.9621106, 1.052751, -0.1580139, 0, 0, 0, 1, 1,
0.9639071, 0.1435474, 0.9542929, 0, 0, 0, 1, 1,
0.9675674, -0.6438076, 1.498193, 0, 0, 0, 1, 1,
0.9704247, 0.06928857, 1.620198, 0, 0, 0, 1, 1,
0.9756824, -0.007679831, 0.9012653, 1, 1, 1, 1, 1,
0.984296, -0.4351943, 2.601454, 1, 1, 1, 1, 1,
0.9942065, -0.2896171, 2.322163, 1, 1, 1, 1, 1,
1.007904, 0.08146883, 0.1978122, 1, 1, 1, 1, 1,
1.011261, -0.1973208, 2.104789, 1, 1, 1, 1, 1,
1.011579, 1.020598, 1.289685, 1, 1, 1, 1, 1,
1.014885, -1.841822, 2.115932, 1, 1, 1, 1, 1,
1.01701, 0.369298, 0.0725471, 1, 1, 1, 1, 1,
1.017461, 0.8815414, 0.8054455, 1, 1, 1, 1, 1,
1.019129, 0.7529634, 1.360318, 1, 1, 1, 1, 1,
1.021619, 1.285816, 1.064741, 1, 1, 1, 1, 1,
1.028134, 0.04100882, 2.087612, 1, 1, 1, 1, 1,
1.032668, -0.1553205, 2.638558, 1, 1, 1, 1, 1,
1.036619, 0.4410188, 0.7653987, 1, 1, 1, 1, 1,
1.050765, 0.7102159, 0.4010127, 1, 1, 1, 1, 1,
1.051845, -1.302046, 2.956019, 0, 0, 1, 1, 1,
1.052656, 0.484967, 0.9769735, 1, 0, 0, 1, 1,
1.053498, 0.1820009, 1.190476, 1, 0, 0, 1, 1,
1.056125, 0.7935997, 2.221175, 1, 0, 0, 1, 1,
1.057926, 0.2794209, 1.416047, 1, 0, 0, 1, 1,
1.059152, 0.9378931, 0.289392, 1, 0, 0, 1, 1,
1.060273, -0.4556817, 0.7557369, 0, 0, 0, 1, 1,
1.061785, -0.9845643, 3.929374, 0, 0, 0, 1, 1,
1.062664, 0.2464389, 1.153873, 0, 0, 0, 1, 1,
1.064755, 2.424438, -1.468911, 0, 0, 0, 1, 1,
1.071412, -0.004171588, 0.5516053, 0, 0, 0, 1, 1,
1.081019, -0.1516946, 1.330298, 0, 0, 0, 1, 1,
1.088133, -0.7336998, 3.591648, 0, 0, 0, 1, 1,
1.088333, -1.721448, 3.25721, 1, 1, 1, 1, 1,
1.091563, 0.5292841, 0.9043353, 1, 1, 1, 1, 1,
1.092583, 0.1274618, 3.93754, 1, 1, 1, 1, 1,
1.098505, 2.198844, 1.228669, 1, 1, 1, 1, 1,
1.104029, 0.1731883, 1.570635, 1, 1, 1, 1, 1,
1.107681, -0.8289722, 2.727075, 1, 1, 1, 1, 1,
1.112242, -0.382538, 2.436907, 1, 1, 1, 1, 1,
1.112524, -0.8254667, 2.230954, 1, 1, 1, 1, 1,
1.115496, -1.43042, 2.419214, 1, 1, 1, 1, 1,
1.131082, 1.1337, 2.563061, 1, 1, 1, 1, 1,
1.131243, -0.07320388, -0.2940777, 1, 1, 1, 1, 1,
1.151193, -0.1238428, 0.1799191, 1, 1, 1, 1, 1,
1.156176, 0.3543732, 0.9087277, 1, 1, 1, 1, 1,
1.164635, 1.76115, -0.5285972, 1, 1, 1, 1, 1,
1.16943, 1.792622, -0.1967732, 1, 1, 1, 1, 1,
1.169785, 1.257414, -0.3407949, 0, 0, 1, 1, 1,
1.174155, 0.5424414, 2.09146, 1, 0, 0, 1, 1,
1.177955, -0.8836463, 1.509584, 1, 0, 0, 1, 1,
1.180049, -0.2367039, 2.250772, 1, 0, 0, 1, 1,
1.19708, -0.1792553, 1.97681, 1, 0, 0, 1, 1,
1.203823, -1.911353, 1.490507, 1, 0, 0, 1, 1,
1.221746, 0.87862, -0.219018, 0, 0, 0, 1, 1,
1.222995, -0.2083346, 1.614427, 0, 0, 0, 1, 1,
1.22436, -0.5649003, 2.021445, 0, 0, 0, 1, 1,
1.227974, 1.027938, 0.5968695, 0, 0, 0, 1, 1,
1.229571, 0.2058426, 2.238845, 0, 0, 0, 1, 1,
1.246784, 1.255555, 1.462691, 0, 0, 0, 1, 1,
1.248339, -0.1307097, 0.6247139, 0, 0, 0, 1, 1,
1.249194, -1.285007, 2.062893, 1, 1, 1, 1, 1,
1.251777, -0.3207554, 1.028527, 1, 1, 1, 1, 1,
1.254466, 0.9927942, 0.52798, 1, 1, 1, 1, 1,
1.258847, -0.06979182, 1.971313, 1, 1, 1, 1, 1,
1.281287, 1.325102, 0.7229083, 1, 1, 1, 1, 1,
1.283209, -0.4568588, 1.213416, 1, 1, 1, 1, 1,
1.285346, 1.75986, 0.01329282, 1, 1, 1, 1, 1,
1.286481, -0.3718687, 1.515486, 1, 1, 1, 1, 1,
1.31843, -1.085231, 2.542661, 1, 1, 1, 1, 1,
1.320689, -1.180921, 0.2786251, 1, 1, 1, 1, 1,
1.32438, 1.462525, 1.571167, 1, 1, 1, 1, 1,
1.340468, -0.2429498, 0.4832872, 1, 1, 1, 1, 1,
1.343529, -1.261815, 2.568982, 1, 1, 1, 1, 1,
1.343571, 0.155689, 2.965559, 1, 1, 1, 1, 1,
1.345361, 0.7544493, 2.483407, 1, 1, 1, 1, 1,
1.362843, 0.4862822, 1.705322, 0, 0, 1, 1, 1,
1.369172, 0.416871, 0.5046176, 1, 0, 0, 1, 1,
1.371018, -0.8662519, 1.20882, 1, 0, 0, 1, 1,
1.37512, 0.1537531, 1.559357, 1, 0, 0, 1, 1,
1.379391, 0.2959429, 1.073947, 1, 0, 0, 1, 1,
1.384104, -1.043476, 3.369174, 1, 0, 0, 1, 1,
1.394465, 0.6469861, 1.705287, 0, 0, 0, 1, 1,
1.410318, -0.05901562, 1.464197, 0, 0, 0, 1, 1,
1.415719, 2.144718, -2.177035, 0, 0, 0, 1, 1,
1.419051, 0.8614351, 1.384735, 0, 0, 0, 1, 1,
1.427158, -1.149453, 3.57032, 0, 0, 0, 1, 1,
1.43305, -0.06926173, 1.263497, 0, 0, 0, 1, 1,
1.44421, 0.4960668, 1.437471, 0, 0, 0, 1, 1,
1.451952, 0.9501027, 0.204825, 1, 1, 1, 1, 1,
1.481795, -1.177708, 3.200864, 1, 1, 1, 1, 1,
1.496124, 0.9107072, 1.623522, 1, 1, 1, 1, 1,
1.504799, -0.480931, 1.852197, 1, 1, 1, 1, 1,
1.532976, -2.422732, 2.509847, 1, 1, 1, 1, 1,
1.534066, 1.17718, 2.516728, 1, 1, 1, 1, 1,
1.54735, 0.1365697, 2.461865, 1, 1, 1, 1, 1,
1.548055, -1.179802, 2.109791, 1, 1, 1, 1, 1,
1.552097, -1.600876, 1.319342, 1, 1, 1, 1, 1,
1.562202, -1.209305, 2.756747, 1, 1, 1, 1, 1,
1.564421, -0.3847488, 2.517456, 1, 1, 1, 1, 1,
1.564582, -0.995622, 2.952682, 1, 1, 1, 1, 1,
1.565583, 2.379313, 0.6379264, 1, 1, 1, 1, 1,
1.577199, 1.05022, 0.7321672, 1, 1, 1, 1, 1,
1.5955, -2.121672, 3.195353, 1, 1, 1, 1, 1,
1.595585, -0.6178592, 1.740844, 0, 0, 1, 1, 1,
1.602547, -1.656175, 2.159495, 1, 0, 0, 1, 1,
1.603914, 0.1810999, 1.811571, 1, 0, 0, 1, 1,
1.604151, -0.136698, 0.9085253, 1, 0, 0, 1, 1,
1.604561, 0.4873269, 1.204629, 1, 0, 0, 1, 1,
1.628927, 1.841454, 0.522838, 1, 0, 0, 1, 1,
1.705901, 1.904261, 0.2084774, 0, 0, 0, 1, 1,
1.708541, 0.9793302, 0.5359221, 0, 0, 0, 1, 1,
1.719994, -1.453973, 2.345555, 0, 0, 0, 1, 1,
1.761212, -0.5758414, 1.75988, 0, 0, 0, 1, 1,
1.762821, 0.8761085, 1.350385, 0, 0, 0, 1, 1,
1.772759, -0.8963335, 2.247919, 0, 0, 0, 1, 1,
1.781844, -1.620159, 3.252683, 0, 0, 0, 1, 1,
1.808472, -0.8504797, 2.662175, 1, 1, 1, 1, 1,
1.812058, -1.513648, 2.60008, 1, 1, 1, 1, 1,
1.823473, 0.7035016, 0.8966029, 1, 1, 1, 1, 1,
1.850555, -1.089741, 3.539834, 1, 1, 1, 1, 1,
1.852226, 0.7726147, 0.4838427, 1, 1, 1, 1, 1,
1.85226, -0.354544, 1.063741, 1, 1, 1, 1, 1,
1.881062, -0.02469989, 2.988868, 1, 1, 1, 1, 1,
1.891393, -1.050442, 2.561528, 1, 1, 1, 1, 1,
1.908444, -0.5347831, 1.433605, 1, 1, 1, 1, 1,
1.925419, 0.1991048, 2.021563, 1, 1, 1, 1, 1,
1.929039, -0.795089, 2.074736, 1, 1, 1, 1, 1,
1.93535, -1.156514, 2.083908, 1, 1, 1, 1, 1,
1.937599, 1.480654, -0.1762743, 1, 1, 1, 1, 1,
1.941917, -0.4221524, 1.189888, 1, 1, 1, 1, 1,
1.944834, 0.08188656, -0.6177055, 1, 1, 1, 1, 1,
1.955289, 0.2251295, 1.009937, 0, 0, 1, 1, 1,
1.969086, -1.238367, 2.971106, 1, 0, 0, 1, 1,
1.98529, 1.083563, -0.4749774, 1, 0, 0, 1, 1,
1.991232, -1.359177, -0.01491224, 1, 0, 0, 1, 1,
2.00703, 1.897063, 0.3371, 1, 0, 0, 1, 1,
2.034866, 0.698906, 1.140252, 1, 0, 0, 1, 1,
2.061095, -2.858918, 4.205047, 0, 0, 0, 1, 1,
2.101893, -0.1571726, 2.1561, 0, 0, 0, 1, 1,
2.143115, 0.5646919, 1.696977, 0, 0, 0, 1, 1,
2.204067, -0.6314873, 2.065285, 0, 0, 0, 1, 1,
2.227751, 0.3702682, -0.3146589, 0, 0, 0, 1, 1,
2.259238, -1.634076, 3.620045, 0, 0, 0, 1, 1,
2.283524, -0.08535914, 1.27331, 0, 0, 0, 1, 1,
2.310719, -0.6434223, 0.2686558, 1, 1, 1, 1, 1,
2.486762, 0.8220829, 1.051752, 1, 1, 1, 1, 1,
2.743241, -1.472646, 3.757025, 1, 1, 1, 1, 1,
2.769787, 0.08658911, 2.191881, 1, 1, 1, 1, 1,
2.848455, 0.5049508, 0.4905668, 1, 1, 1, 1, 1,
2.907405, -0.004279953, 1.519469, 1, 1, 1, 1, 1,
4.185492, -1.435063, 3.37503, 1, 1, 1, 1, 1
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
var radius = 10.01029;
var distance = 35.16071;
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
mvMatrix.translate( 0.04182911, -0.0194, 0.5157948 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.16071);
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
