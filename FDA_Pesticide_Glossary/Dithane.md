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
-3.125737, -0.6489558, -2.723017, 1, 0, 0, 1,
-2.964104, 0.5536858, -0.08933093, 1, 0.007843138, 0, 1,
-2.765804, 1.217783, -0.3308264, 1, 0.01176471, 0, 1,
-2.744335, -0.6292856, -2.820705, 1, 0.01960784, 0, 1,
-2.67167, 1.606459, -2.147732, 1, 0.02352941, 0, 1,
-2.590772, 2.219213, -0.2740421, 1, 0.03137255, 0, 1,
-2.555265, -1.17016, -3.054361, 1, 0.03529412, 0, 1,
-2.410249, -0.08407526, -0.811745, 1, 0.04313726, 0, 1,
-2.338123, 0.2288087, 1.240967, 1, 0.04705882, 0, 1,
-2.333416, -0.8893301, 0.02736535, 1, 0.05490196, 0, 1,
-2.29157, -0.2412686, -1.054271, 1, 0.05882353, 0, 1,
-2.284314, -0.1905941, -1.131313, 1, 0.06666667, 0, 1,
-2.279732, 0.164098, -0.7390651, 1, 0.07058824, 0, 1,
-2.250513, 1.109189, -0.1457079, 1, 0.07843138, 0, 1,
-2.234019, 1.020672, 1.236007, 1, 0.08235294, 0, 1,
-2.231882, -0.9776781, -2.247977, 1, 0.09019608, 0, 1,
-2.227924, 0.3172536, -0.0361772, 1, 0.09411765, 0, 1,
-2.125747, 1.009096, -3.681981, 1, 0.1019608, 0, 1,
-2.122959, 1.143335, -2.108196, 1, 0.1098039, 0, 1,
-2.117169, -1.811524, -3.597023, 1, 0.1137255, 0, 1,
-2.08715, 1.160131, -0.2463441, 1, 0.1215686, 0, 1,
-2.062489, -0.9961569, -0.5595524, 1, 0.1254902, 0, 1,
-2.041412, -0.6255032, -0.9524741, 1, 0.1333333, 0, 1,
-2.035702, 0.2339063, -1.660581, 1, 0.1372549, 0, 1,
-1.991507, -1.216072, -1.042694, 1, 0.145098, 0, 1,
-1.975126, -1.841926, -3.889174, 1, 0.1490196, 0, 1,
-1.926099, 0.1651921, -1.517151, 1, 0.1568628, 0, 1,
-1.911136, 0.378493, -1.853109, 1, 0.1607843, 0, 1,
-1.899976, -1.306606, 0.0258939, 1, 0.1686275, 0, 1,
-1.892137, -0.9727333, -2.57339, 1, 0.172549, 0, 1,
-1.889342, 0.4917451, -0.6172714, 1, 0.1803922, 0, 1,
-1.88795, 0.2105325, -0.6841005, 1, 0.1843137, 0, 1,
-1.870013, 0.1350716, -1.882846, 1, 0.1921569, 0, 1,
-1.865763, -0.6657495, -3.256302, 1, 0.1960784, 0, 1,
-1.856151, -0.2545425, -1.764077, 1, 0.2039216, 0, 1,
-1.822892, 0.9696109, -0.4074827, 1, 0.2117647, 0, 1,
-1.815752, 0.4905021, -0.2398721, 1, 0.2156863, 0, 1,
-1.806031, 0.0513992, -0.5601383, 1, 0.2235294, 0, 1,
-1.796097, 0.03260202, -2.144089, 1, 0.227451, 0, 1,
-1.788622, -0.6860418, -4.228084, 1, 0.2352941, 0, 1,
-1.771188, -0.1551731, -3.49332, 1, 0.2392157, 0, 1,
-1.76763, -1.536776, -3.828332, 1, 0.2470588, 0, 1,
-1.760886, -0.2176725, -1.985195, 1, 0.2509804, 0, 1,
-1.755799, -0.5794371, -2.806865, 1, 0.2588235, 0, 1,
-1.742613, -1.965684, -4.158998, 1, 0.2627451, 0, 1,
-1.732582, 0.1547023, -1.823729, 1, 0.2705882, 0, 1,
-1.732043, 1.264375, -2.658788, 1, 0.2745098, 0, 1,
-1.728818, -1.023305, -1.764239, 1, 0.282353, 0, 1,
-1.726888, -0.5614614, -2.127146, 1, 0.2862745, 0, 1,
-1.721935, 1.373012, -1.545339, 1, 0.2941177, 0, 1,
-1.716537, 0.7934854, -0.4036065, 1, 0.3019608, 0, 1,
-1.714949, 0.7855402, -1.386499, 1, 0.3058824, 0, 1,
-1.712204, -0.4926693, -1.992556, 1, 0.3137255, 0, 1,
-1.706036, -0.2026795, -2.400939, 1, 0.3176471, 0, 1,
-1.692737, -0.4661982, -2.94229, 1, 0.3254902, 0, 1,
-1.681786, -0.7767274, -0.3255758, 1, 0.3294118, 0, 1,
-1.661464, -0.2162318, -1.478296, 1, 0.3372549, 0, 1,
-1.624708, -0.2617601, -1.262473, 1, 0.3411765, 0, 1,
-1.620604, 0.6325465, -0.4470032, 1, 0.3490196, 0, 1,
-1.613266, 0.1039504, 0.5294099, 1, 0.3529412, 0, 1,
-1.606173, 0.952965, -2.905312, 1, 0.3607843, 0, 1,
-1.605041, 2.230631, -0.5883844, 1, 0.3647059, 0, 1,
-1.599688, -0.6354653, -0.8715748, 1, 0.372549, 0, 1,
-1.598554, -0.6627943, -0.6853149, 1, 0.3764706, 0, 1,
-1.580745, -0.9185389, -1.036809, 1, 0.3843137, 0, 1,
-1.579473, -0.08615427, -1.990456, 1, 0.3882353, 0, 1,
-1.567901, 0.2063128, -1.244145, 1, 0.3960784, 0, 1,
-1.559443, 1.286052, -0.7337204, 1, 0.4039216, 0, 1,
-1.557821, -1.432825, -2.853644, 1, 0.4078431, 0, 1,
-1.554938, 0.6063008, -1.241541, 1, 0.4156863, 0, 1,
-1.552495, 0.9630091, -1.132162, 1, 0.4196078, 0, 1,
-1.534145, 0.1609388, -1.75788, 1, 0.427451, 0, 1,
-1.520659, -1.377533, -2.83068, 1, 0.4313726, 0, 1,
-1.515953, 1.153076, -0.069725, 1, 0.4392157, 0, 1,
-1.505372, -0.5148954, -1.628254, 1, 0.4431373, 0, 1,
-1.492824, 0.1218392, -0.4899021, 1, 0.4509804, 0, 1,
-1.48136, -0.5633129, -1.809477, 1, 0.454902, 0, 1,
-1.473644, 0.8117501, -1.373056, 1, 0.4627451, 0, 1,
-1.4605, 1.424391, -1.313382, 1, 0.4666667, 0, 1,
-1.452558, 1.462626, -0.854889, 1, 0.4745098, 0, 1,
-1.450052, 2.323946, 0.115287, 1, 0.4784314, 0, 1,
-1.445637, -1.178436, -1.402182, 1, 0.4862745, 0, 1,
-1.434841, -0.2052404, -0.9468104, 1, 0.4901961, 0, 1,
-1.423183, -0.5625282, -0.7367782, 1, 0.4980392, 0, 1,
-1.422563, 0.06347524, -0.9977766, 1, 0.5058824, 0, 1,
-1.420933, 0.3187943, -2.783563, 1, 0.509804, 0, 1,
-1.420381, -1.290236, -3.931809, 1, 0.5176471, 0, 1,
-1.419162, -1.150596, -2.966315, 1, 0.5215687, 0, 1,
-1.409621, 1.89644, 1.474999, 1, 0.5294118, 0, 1,
-1.405457, 0.5032931, 0.1013182, 1, 0.5333334, 0, 1,
-1.404324, -0.09789637, -2.231964, 1, 0.5411765, 0, 1,
-1.400688, -0.6437322, -2.02794, 1, 0.5450981, 0, 1,
-1.380131, -0.6547988, -3.222024, 1, 0.5529412, 0, 1,
-1.379427, -0.284488, -1.271333, 1, 0.5568628, 0, 1,
-1.378717, 0.3222955, -2.280206, 1, 0.5647059, 0, 1,
-1.372288, -0.6443425, -1.76591, 1, 0.5686275, 0, 1,
-1.364426, -0.9494962, -2.486111, 1, 0.5764706, 0, 1,
-1.359882, 0.2142701, -2.299024, 1, 0.5803922, 0, 1,
-1.346077, -1.520317, -2.303524, 1, 0.5882353, 0, 1,
-1.337187, -1.576073, -0.4036858, 1, 0.5921569, 0, 1,
-1.334704, 1.85893, 0.06542963, 1, 0.6, 0, 1,
-1.322245, -0.06080292, -0.9806547, 1, 0.6078432, 0, 1,
-1.32168, 0.6529152, -2.669605, 1, 0.6117647, 0, 1,
-1.320527, -1.247213, -0.6898832, 1, 0.6196079, 0, 1,
-1.320007, 1.055159, -1.345581, 1, 0.6235294, 0, 1,
-1.310308, 1.772906, 0.1976202, 1, 0.6313726, 0, 1,
-1.304943, -0.1896639, -0.8850081, 1, 0.6352941, 0, 1,
-1.299538, 0.9085371, -2.354593, 1, 0.6431373, 0, 1,
-1.280817, 1.00465, -0.5160987, 1, 0.6470588, 0, 1,
-1.280202, 1.644499, -1.16188, 1, 0.654902, 0, 1,
-1.277775, 1.147415, 0.07801309, 1, 0.6588235, 0, 1,
-1.272653, 0.8387923, -0.6517479, 1, 0.6666667, 0, 1,
-1.266445, 0.6474012, -1.676083, 1, 0.6705883, 0, 1,
-1.2662, -1.036234, -1.656586, 1, 0.6784314, 0, 1,
-1.257316, 1.60913, -0.3099083, 1, 0.682353, 0, 1,
-1.247335, 0.8759491, -0.3681636, 1, 0.6901961, 0, 1,
-1.243322, 0.1353928, -1.821232, 1, 0.6941177, 0, 1,
-1.229339, -1.203407, -2.474086, 1, 0.7019608, 0, 1,
-1.225835, 1.026299, -0.3958766, 1, 0.7098039, 0, 1,
-1.224352, -0.8466927, 0.241649, 1, 0.7137255, 0, 1,
-1.22173, -1.200166, -2.96058, 1, 0.7215686, 0, 1,
-1.191274, -0.04272186, -0.5125086, 1, 0.7254902, 0, 1,
-1.182809, 0.6602371, -1.500967, 1, 0.7333333, 0, 1,
-1.167899, -1.93322, -0.9292133, 1, 0.7372549, 0, 1,
-1.167553, 0.4813603, -0.8611553, 1, 0.7450981, 0, 1,
-1.16723, -0.5717152, -2.595839, 1, 0.7490196, 0, 1,
-1.164738, 0.3188967, -1.213892, 1, 0.7568628, 0, 1,
-1.158185, 0.6113284, -1.496538, 1, 0.7607843, 0, 1,
-1.15188, -1.6844, -2.091607, 1, 0.7686275, 0, 1,
-1.151758, -0.1432083, -2.429097, 1, 0.772549, 0, 1,
-1.145598, 3.151928, 0.07121611, 1, 0.7803922, 0, 1,
-1.142275, -0.8922783, -2.237493, 1, 0.7843137, 0, 1,
-1.138628, 1.271297, -2.617498, 1, 0.7921569, 0, 1,
-1.136497, -0.6831256, -3.275642, 1, 0.7960784, 0, 1,
-1.134061, -1.362223, -0.4305847, 1, 0.8039216, 0, 1,
-1.132058, 2.911119, -1.065642, 1, 0.8117647, 0, 1,
-1.130987, -0.9567916, -3.078761, 1, 0.8156863, 0, 1,
-1.129564, -0.3784435, -1.001835, 1, 0.8235294, 0, 1,
-1.128491, 1.199077, -0.6144589, 1, 0.827451, 0, 1,
-1.128152, -0.6704422, -1.479987, 1, 0.8352941, 0, 1,
-1.126644, -0.6341622, -1.686437, 1, 0.8392157, 0, 1,
-1.12519, -0.6986762, -0.7173969, 1, 0.8470588, 0, 1,
-1.123775, -0.2655525, -2.371005, 1, 0.8509804, 0, 1,
-1.103493, 0.7902684, -1.12107, 1, 0.8588235, 0, 1,
-1.099549, -1.15889, -2.343015, 1, 0.8627451, 0, 1,
-1.086022, 0.2335015, -0.013491, 1, 0.8705882, 0, 1,
-1.083659, -0.1826199, -3.483426, 1, 0.8745098, 0, 1,
-1.076407, -0.2340441, -1.063335, 1, 0.8823529, 0, 1,
-1.074831, 1.007729, -0.2061568, 1, 0.8862745, 0, 1,
-1.070206, 0.5987379, -2.508374, 1, 0.8941177, 0, 1,
-1.064401, 0.3302154, -1.318324, 1, 0.8980392, 0, 1,
-1.063441, 0.02603014, -0.8269212, 1, 0.9058824, 0, 1,
-1.061734, -0.6060261, -4.364737, 1, 0.9137255, 0, 1,
-1.060549, 1.02812, 0.2477346, 1, 0.9176471, 0, 1,
-1.054291, 1.743603, 1.207439, 1, 0.9254902, 0, 1,
-1.04619, 1.831554, -0.1612518, 1, 0.9294118, 0, 1,
-1.044588, 0.02080191, -3.811596, 1, 0.9372549, 0, 1,
-1.043211, 0.4583828, -2.365098, 1, 0.9411765, 0, 1,
-1.040144, -0.1903797, -2.206558, 1, 0.9490196, 0, 1,
-1.03889, -0.782652, -1.322996, 1, 0.9529412, 0, 1,
-1.037658, 0.2024566, -2.64377, 1, 0.9607843, 0, 1,
-1.034469, 1.603353, -1.911308, 1, 0.9647059, 0, 1,
-1.034208, -2.368674, -2.050945, 1, 0.972549, 0, 1,
-1.030882, 0.4465979, -1.623697, 1, 0.9764706, 0, 1,
-1.029868, -0.2131285, -1.204906, 1, 0.9843137, 0, 1,
-1.029855, 0.173031, -4.068337, 1, 0.9882353, 0, 1,
-1.027154, 0.2672926, 0.9231902, 1, 0.9960784, 0, 1,
-1.026329, 0.8994715, -1.055895, 0.9960784, 1, 0, 1,
-1.017628, -0.06404524, -1.113569, 0.9921569, 1, 0, 1,
-1.00877, 3.368861, -1.590308, 0.9843137, 1, 0, 1,
-1.008721, 0.8100497, -2.033571, 0.9803922, 1, 0, 1,
-1.001053, -0.528289, -1.545289, 0.972549, 1, 0, 1,
-0.9984745, 0.6102668, 0.2190082, 0.9686275, 1, 0, 1,
-0.9868149, 0.07860053, -0.671686, 0.9607843, 1, 0, 1,
-0.9866843, -2.719596, -4.606186, 0.9568627, 1, 0, 1,
-0.9852288, -0.6134102, -3.032631, 0.9490196, 1, 0, 1,
-0.9830693, -0.6131403, -1.539125, 0.945098, 1, 0, 1,
-0.9806573, 0.2505189, -2.32559, 0.9372549, 1, 0, 1,
-0.9804768, 0.7300385, -2.531718, 0.9333333, 1, 0, 1,
-0.9790419, 1.125084, -1.223169, 0.9254902, 1, 0, 1,
-0.9787052, 0.6520097, 0.5323029, 0.9215686, 1, 0, 1,
-0.9746875, 0.5570288, -2.233312, 0.9137255, 1, 0, 1,
-0.9652359, 1.623989, -0.279216, 0.9098039, 1, 0, 1,
-0.9578338, 1.495647, -0.6557193, 0.9019608, 1, 0, 1,
-0.9562445, -1.081674, -2.493335, 0.8941177, 1, 0, 1,
-0.9554424, 0.2920465, 0.01542678, 0.8901961, 1, 0, 1,
-0.9489971, -1.12773, -2.364353, 0.8823529, 1, 0, 1,
-0.9433774, 1.60181, -0.8898962, 0.8784314, 1, 0, 1,
-0.9429674, 0.9544598, 0.465526, 0.8705882, 1, 0, 1,
-0.9404709, 1.617392, -0.7893779, 0.8666667, 1, 0, 1,
-0.9382993, -1.032775, -3.899976, 0.8588235, 1, 0, 1,
-0.9370137, -0.7695441, -0.9540884, 0.854902, 1, 0, 1,
-0.9364896, 2.015039, -0.5327157, 0.8470588, 1, 0, 1,
-0.9286606, -2.214571, -3.113688, 0.8431373, 1, 0, 1,
-0.9072227, -0.7565781, -2.398243, 0.8352941, 1, 0, 1,
-0.9005435, 0.182822, -0.9502848, 0.8313726, 1, 0, 1,
-0.8966799, 0.5936207, -1.142153, 0.8235294, 1, 0, 1,
-0.8916678, 0.4905508, -0.4150434, 0.8196079, 1, 0, 1,
-0.8915262, 0.812828, -2.264768, 0.8117647, 1, 0, 1,
-0.8915004, 1.861515, -0.4596454, 0.8078431, 1, 0, 1,
-0.8888527, -0.03186769, -2.141669, 0.8, 1, 0, 1,
-0.8804742, 0.5099707, 0.435292, 0.7921569, 1, 0, 1,
-0.8774866, 0.8927076, -0.4042188, 0.7882353, 1, 0, 1,
-0.8761072, 0.18189, -0.3011474, 0.7803922, 1, 0, 1,
-0.8718636, -0.4028302, -0.9633536, 0.7764706, 1, 0, 1,
-0.8615085, 0.3582723, -2.175327, 0.7686275, 1, 0, 1,
-0.8534064, -1.736506, -1.498042, 0.7647059, 1, 0, 1,
-0.8520525, -0.8147495, -1.190291, 0.7568628, 1, 0, 1,
-0.8445657, 0.7569331, -1.24526, 0.7529412, 1, 0, 1,
-0.8399212, -1.105175, -2.808009, 0.7450981, 1, 0, 1,
-0.8357464, 0.2153178, -2.016865, 0.7411765, 1, 0, 1,
-0.8337357, 0.7124795, -0.7964969, 0.7333333, 1, 0, 1,
-0.8324382, 0.8760116, -1.84317, 0.7294118, 1, 0, 1,
-0.8283962, -1.754035, -1.909554, 0.7215686, 1, 0, 1,
-0.8177395, -0.1089701, -1.364794, 0.7176471, 1, 0, 1,
-0.813644, -0.5906203, -1.864833, 0.7098039, 1, 0, 1,
-0.812723, 1.036107, -2.856688, 0.7058824, 1, 0, 1,
-0.8096179, 0.146208, -1.526383, 0.6980392, 1, 0, 1,
-0.8050811, -1.006359, -4.298715, 0.6901961, 1, 0, 1,
-0.7995554, -1.018253, -0.04642687, 0.6862745, 1, 0, 1,
-0.7992353, -0.6593164, -4.032099, 0.6784314, 1, 0, 1,
-0.7952301, 0.7012716, -0.8269869, 0.6745098, 1, 0, 1,
-0.7926321, -0.0045331, -1.265795, 0.6666667, 1, 0, 1,
-0.7876595, -1.220461, -2.377376, 0.6627451, 1, 0, 1,
-0.7848972, 0.0653965, -1.579423, 0.654902, 1, 0, 1,
-0.7820595, 0.00341933, -1.510311, 0.6509804, 1, 0, 1,
-0.7814125, 2.487596, -1.128724, 0.6431373, 1, 0, 1,
-0.7807546, 1.140121, 1.389553, 0.6392157, 1, 0, 1,
-0.7785368, -0.2974521, -2.329388, 0.6313726, 1, 0, 1,
-0.7783526, 2.8473, 0.3638531, 0.627451, 1, 0, 1,
-0.7776189, -0.8231375, -3.204952, 0.6196079, 1, 0, 1,
-0.7662429, -0.9793229, -4.138145, 0.6156863, 1, 0, 1,
-0.7582756, 0.6547675, -1.601309, 0.6078432, 1, 0, 1,
-0.755671, 0.5798001, -1.428872, 0.6039216, 1, 0, 1,
-0.7517254, 0.2827491, -0.5352064, 0.5960785, 1, 0, 1,
-0.7441642, 0.6937078, 0.5031846, 0.5882353, 1, 0, 1,
-0.7436797, -1.710381, -2.963952, 0.5843138, 1, 0, 1,
-0.7335551, 2.320519, 0.5351245, 0.5764706, 1, 0, 1,
-0.7310185, -0.9184361, -2.01563, 0.572549, 1, 0, 1,
-0.7223966, 0.586419, -1.884944, 0.5647059, 1, 0, 1,
-0.7221246, -0.9850073, -3.838914, 0.5607843, 1, 0, 1,
-0.7203406, 0.5036017, -1.608005, 0.5529412, 1, 0, 1,
-0.719583, 0.8128831, -1.334309, 0.5490196, 1, 0, 1,
-0.7180772, -1.822003, -3.632976, 0.5411765, 1, 0, 1,
-0.7159908, -0.1421996, 0.8411832, 0.5372549, 1, 0, 1,
-0.7149321, -0.07506161, -2.368976, 0.5294118, 1, 0, 1,
-0.7130183, -0.1820855, -1.26236, 0.5254902, 1, 0, 1,
-0.7117794, -2.36423, -2.507811, 0.5176471, 1, 0, 1,
-0.7115612, -1.204816, -2.905213, 0.5137255, 1, 0, 1,
-0.7095066, -0.1348899, -2.387237, 0.5058824, 1, 0, 1,
-0.7090707, -0.7237915, -2.063804, 0.5019608, 1, 0, 1,
-0.7070284, 0.9751585, -0.7695593, 0.4941176, 1, 0, 1,
-0.7030619, -1.015529, -2.324717, 0.4862745, 1, 0, 1,
-0.6997169, -0.1830756, -1.425222, 0.4823529, 1, 0, 1,
-0.6976432, -1.012035, -1.465744, 0.4745098, 1, 0, 1,
-0.6976371, -0.1847549, -2.175657, 0.4705882, 1, 0, 1,
-0.694707, 1.72533, -0.7450195, 0.4627451, 1, 0, 1,
-0.6918419, 1.415948, -1.18069, 0.4588235, 1, 0, 1,
-0.6894739, -0.2198682, -0.6529724, 0.4509804, 1, 0, 1,
-0.6876289, -0.1465777, -2.325657, 0.4470588, 1, 0, 1,
-0.6870862, -0.8826092, -2.284728, 0.4392157, 1, 0, 1,
-0.6856005, 1.628717, 1.06753, 0.4352941, 1, 0, 1,
-0.6819579, 1.230757, -1.088509, 0.427451, 1, 0, 1,
-0.6808218, 1.155632, 1.032458, 0.4235294, 1, 0, 1,
-0.6746014, 0.4727, -0.2095595, 0.4156863, 1, 0, 1,
-0.6696525, -0.1369933, -0.4553658, 0.4117647, 1, 0, 1,
-0.6687868, 1.053321, 0.327097, 0.4039216, 1, 0, 1,
-0.6613126, 0.2899264, -4.231, 0.3960784, 1, 0, 1,
-0.6603082, -0.6666, -1.845317, 0.3921569, 1, 0, 1,
-0.6546416, -1.28335, -1.435916, 0.3843137, 1, 0, 1,
-0.6488078, 1.475778, 1.466934, 0.3803922, 1, 0, 1,
-0.6463517, 0.618484, -0.1341852, 0.372549, 1, 0, 1,
-0.6387553, -0.1650963, -2.014109, 0.3686275, 1, 0, 1,
-0.6363071, -0.3540384, -1.995604, 0.3607843, 1, 0, 1,
-0.6316845, 0.316563, -1.977733, 0.3568628, 1, 0, 1,
-0.6306094, -0.9092436, -2.184236, 0.3490196, 1, 0, 1,
-0.6303607, -0.1267612, -0.6108505, 0.345098, 1, 0, 1,
-0.6293439, 0.3807046, 1.425048, 0.3372549, 1, 0, 1,
-0.6286561, -0.2145101, -2.485581, 0.3333333, 1, 0, 1,
-0.6267448, 0.3832804, -2.376654, 0.3254902, 1, 0, 1,
-0.6247723, -0.3296593, -2.348473, 0.3215686, 1, 0, 1,
-0.6230528, 1.352221, -3.208883, 0.3137255, 1, 0, 1,
-0.6214569, 0.05376813, -1.749053, 0.3098039, 1, 0, 1,
-0.6073207, -0.01180165, -1.545793, 0.3019608, 1, 0, 1,
-0.6046783, -0.7267558, -3.881224, 0.2941177, 1, 0, 1,
-0.5954192, -1.129656, -5.272708, 0.2901961, 1, 0, 1,
-0.5927715, -0.405929, -2.982916, 0.282353, 1, 0, 1,
-0.5920402, -0.008431535, -3.333491, 0.2784314, 1, 0, 1,
-0.5915164, -1.085955, -2.358032, 0.2705882, 1, 0, 1,
-0.5912399, -0.3476177, 0.0145848, 0.2666667, 1, 0, 1,
-0.5879913, -1.444682, -1.67963, 0.2588235, 1, 0, 1,
-0.5877544, -0.0754825, -1.243556, 0.254902, 1, 0, 1,
-0.5867478, -0.2557577, -3.213871, 0.2470588, 1, 0, 1,
-0.5852339, -0.2497238, -0.7122464, 0.2431373, 1, 0, 1,
-0.5842745, 3.093209, 1.031834, 0.2352941, 1, 0, 1,
-0.5817541, -0.8731163, -2.212348, 0.2313726, 1, 0, 1,
-0.581237, -1.531059, -4.301476, 0.2235294, 1, 0, 1,
-0.5736793, -0.2591893, -1.344272, 0.2196078, 1, 0, 1,
-0.5719615, 0.5029947, -1.519811, 0.2117647, 1, 0, 1,
-0.5674785, 0.06274033, -0.226515, 0.2078431, 1, 0, 1,
-0.5655009, -0.6219844, -3.436023, 0.2, 1, 0, 1,
-0.561775, 1.839791, 0.7038432, 0.1921569, 1, 0, 1,
-0.5545692, 0.4487311, -1.49189, 0.1882353, 1, 0, 1,
-0.5526431, 0.6157466, -1.955302, 0.1803922, 1, 0, 1,
-0.5514488, -0.6460278, -3.98885, 0.1764706, 1, 0, 1,
-0.5443805, 0.03670635, -0.3102309, 0.1686275, 1, 0, 1,
-0.542619, -0.3637516, -1.981301, 0.1647059, 1, 0, 1,
-0.5390652, -0.3439289, -2.196721, 0.1568628, 1, 0, 1,
-0.5373774, -1.392227, -1.751889, 0.1529412, 1, 0, 1,
-0.5351796, 0.212126, -1.642192, 0.145098, 1, 0, 1,
-0.5320554, -1.493996, -1.853453, 0.1411765, 1, 0, 1,
-0.5289641, 0.6795156, -1.974355, 0.1333333, 1, 0, 1,
-0.5287599, -0.2329719, -1.278263, 0.1294118, 1, 0, 1,
-0.5272079, -0.9346047, -3.27727, 0.1215686, 1, 0, 1,
-0.5266936, 1.218565, -0.1076252, 0.1176471, 1, 0, 1,
-0.5214007, 0.8029695, 0.5175478, 0.1098039, 1, 0, 1,
-0.5200094, 0.9914492, -0.7791637, 0.1058824, 1, 0, 1,
-0.518611, -0.2712026, -1.296988, 0.09803922, 1, 0, 1,
-0.5035602, -1.324611, -4.070234, 0.09019608, 1, 0, 1,
-0.4974263, 0.4992503, -0.6524216, 0.08627451, 1, 0, 1,
-0.4971735, 0.08689274, -0.4822913, 0.07843138, 1, 0, 1,
-0.4919273, -1.100331, -2.899765, 0.07450981, 1, 0, 1,
-0.4910306, 0.8619043, -0.1393401, 0.06666667, 1, 0, 1,
-0.4908969, -0.8569158, -1.0695, 0.0627451, 1, 0, 1,
-0.4887933, 1.275546, 0.6301281, 0.05490196, 1, 0, 1,
-0.4848555, 3.016316, -1.003664, 0.05098039, 1, 0, 1,
-0.4810567, -0.5780007, -2.129335, 0.04313726, 1, 0, 1,
-0.4737707, -0.7232721, -2.935087, 0.03921569, 1, 0, 1,
-0.473046, -1.166442, -2.95594, 0.03137255, 1, 0, 1,
-0.4729869, -0.1446009, -3.869476, 0.02745098, 1, 0, 1,
-0.471309, -0.3128019, -1.111049, 0.01960784, 1, 0, 1,
-0.4711116, 0.9281668, -0.6095043, 0.01568628, 1, 0, 1,
-0.4647991, -1.064245, -3.157752, 0.007843138, 1, 0, 1,
-0.4600963, -0.4272549, -1.380677, 0.003921569, 1, 0, 1,
-0.4598506, -0.4794087, -1.381246, 0, 1, 0.003921569, 1,
-0.4597149, 1.574397, 0.2846923, 0, 1, 0.01176471, 1,
-0.4594432, 0.758536, -1.107854, 0, 1, 0.01568628, 1,
-0.457487, -0.3201305, -2.358037, 0, 1, 0.02352941, 1,
-0.4573449, -0.2506489, -2.892369, 0, 1, 0.02745098, 1,
-0.4561769, -0.0197415, -2.146211, 0, 1, 0.03529412, 1,
-0.455888, 0.08297668, -0.01473503, 0, 1, 0.03921569, 1,
-0.4544018, -0.3879115, -2.276704, 0, 1, 0.04705882, 1,
-0.4531118, -0.6415354, -2.752218, 0, 1, 0.05098039, 1,
-0.4522576, -0.8769169, -1.451526, 0, 1, 0.05882353, 1,
-0.4491268, -0.8318833, -1.313109, 0, 1, 0.0627451, 1,
-0.4487113, 1.04677, -0.0939994, 0, 1, 0.07058824, 1,
-0.44853, -2.331129, -2.160179, 0, 1, 0.07450981, 1,
-0.4461457, -0.2771249, -1.522689, 0, 1, 0.08235294, 1,
-0.4388429, -1.223875, -2.108656, 0, 1, 0.08627451, 1,
-0.4382152, -1.628516, -1.966364, 0, 1, 0.09411765, 1,
-0.4348444, -0.1119847, -3.727093, 0, 1, 0.1019608, 1,
-0.4280728, 1.636294, 0.8807547, 0, 1, 0.1058824, 1,
-0.4267698, 1.728493, 0.2470423, 0, 1, 0.1137255, 1,
-0.4260894, -0.8431925, -1.955802, 0, 1, 0.1176471, 1,
-0.4182805, 1.281442, 0.4871083, 0, 1, 0.1254902, 1,
-0.4175405, -1.009586, -1.137784, 0, 1, 0.1294118, 1,
-0.4160299, 1.051877, -0.7248915, 0, 1, 0.1372549, 1,
-0.4138451, 0.52382, -1.859248, 0, 1, 0.1411765, 1,
-0.4083701, -0.3063491, -2.155909, 0, 1, 0.1490196, 1,
-0.4069083, 0.6638071, 0.8059965, 0, 1, 0.1529412, 1,
-0.4018832, 1.014402, 0.7694938, 0, 1, 0.1607843, 1,
-0.4012886, -0.1977164, -1.089382, 0, 1, 0.1647059, 1,
-0.399748, -1.852344, -1.764942, 0, 1, 0.172549, 1,
-0.3955432, 1.314803, 0.3316785, 0, 1, 0.1764706, 1,
-0.3890998, -1.667826, -2.003799, 0, 1, 0.1843137, 1,
-0.3878123, 0.4085277, -1.088341, 0, 1, 0.1882353, 1,
-0.3869953, -0.3287059, -3.391991, 0, 1, 0.1960784, 1,
-0.3865981, -0.7237052, -4.731743, 0, 1, 0.2039216, 1,
-0.3820382, -0.9111805, -2.510497, 0, 1, 0.2078431, 1,
-0.3819205, -0.7773903, -2.546557, 0, 1, 0.2156863, 1,
-0.3772092, 0.5938187, 0.1156166, 0, 1, 0.2196078, 1,
-0.3724269, -0.6360469, -3.092146, 0, 1, 0.227451, 1,
-0.368981, 0.9614621, 0.7320425, 0, 1, 0.2313726, 1,
-0.3670286, 1.518377, -0.8408882, 0, 1, 0.2392157, 1,
-0.3633237, 0.6283089, -1.592097, 0, 1, 0.2431373, 1,
-0.3603634, -1.002473, -3.808057, 0, 1, 0.2509804, 1,
-0.3526291, 0.9436425, 1.501069, 0, 1, 0.254902, 1,
-0.3498832, 0.7372472, 0.6162607, 0, 1, 0.2627451, 1,
-0.3492761, -1.407375, -1.304666, 0, 1, 0.2666667, 1,
-0.3453929, -0.07257072, -1.01682, 0, 1, 0.2745098, 1,
-0.3446131, -0.07933819, -1.026959, 0, 1, 0.2784314, 1,
-0.3445545, -1.047495, -5.042763, 0, 1, 0.2862745, 1,
-0.3399217, 0.1260023, -3.007514, 0, 1, 0.2901961, 1,
-0.3377748, 0.1314126, -1.692616, 0, 1, 0.2980392, 1,
-0.3376213, 1.802256, -1.387104, 0, 1, 0.3058824, 1,
-0.336803, 0.6766275, -0.5639185, 0, 1, 0.3098039, 1,
-0.3309066, 0.6475309, 1.318955, 0, 1, 0.3176471, 1,
-0.3285584, -1.786304, -1.864591, 0, 1, 0.3215686, 1,
-0.3284414, -0.8260542, -3.919346, 0, 1, 0.3294118, 1,
-0.3235008, -1.395012, -2.487908, 0, 1, 0.3333333, 1,
-0.3183861, -1.036773, -3.607118, 0, 1, 0.3411765, 1,
-0.312772, 0.2841994, -0.2043762, 0, 1, 0.345098, 1,
-0.309356, -1.157028, -3.040343, 0, 1, 0.3529412, 1,
-0.3069724, 0.8394425, 0.006439403, 0, 1, 0.3568628, 1,
-0.3064038, 1.040158, -1.199599, 0, 1, 0.3647059, 1,
-0.2997659, -1.114502, -2.999368, 0, 1, 0.3686275, 1,
-0.2995375, 0.4168938, -2.080347, 0, 1, 0.3764706, 1,
-0.2993062, -1.388556, -3.085889, 0, 1, 0.3803922, 1,
-0.2985615, 0.440141, -1.29795, 0, 1, 0.3882353, 1,
-0.2974915, -0.2704682, -1.88056, 0, 1, 0.3921569, 1,
-0.2955237, -0.9366605, -3.680291, 0, 1, 0.4, 1,
-0.2953059, -1.021084, -3.966571, 0, 1, 0.4078431, 1,
-0.2950446, 0.6015662, -0.7741045, 0, 1, 0.4117647, 1,
-0.2934028, 0.5703278, -1.841285, 0, 1, 0.4196078, 1,
-0.2917989, 0.5015616, -0.9190323, 0, 1, 0.4235294, 1,
-0.2916606, 0.4533644, 0.6299326, 0, 1, 0.4313726, 1,
-0.2907141, 1.765949, -0.4732814, 0, 1, 0.4352941, 1,
-0.2892329, -0.3452241, -2.276081, 0, 1, 0.4431373, 1,
-0.2891719, 0.2836491, -2.377717, 0, 1, 0.4470588, 1,
-0.2883068, -0.5563381, -3.873508, 0, 1, 0.454902, 1,
-0.2867877, -0.1961843, -3.234401, 0, 1, 0.4588235, 1,
-0.2852222, -0.04978137, -2.515611, 0, 1, 0.4666667, 1,
-0.28511, -0.590059, -2.275077, 0, 1, 0.4705882, 1,
-0.2839223, 1.276656, -0.5199085, 0, 1, 0.4784314, 1,
-0.2762913, -0.6985818, -4.246952, 0, 1, 0.4823529, 1,
-0.2754957, 0.4719173, 0.5834844, 0, 1, 0.4901961, 1,
-0.2743897, 0.4531711, 0.03140027, 0, 1, 0.4941176, 1,
-0.2682416, -1.744336, -3.51162, 0, 1, 0.5019608, 1,
-0.2638684, -0.9535838, -3.563322, 0, 1, 0.509804, 1,
-0.2598803, -0.5456086, -1.816862, 0, 1, 0.5137255, 1,
-0.2579762, -2.255768, -3.26617, 0, 1, 0.5215687, 1,
-0.2567913, 0.3252931, -0.8409132, 0, 1, 0.5254902, 1,
-0.255863, 0.3686427, -1.664281, 0, 1, 0.5333334, 1,
-0.2528648, -2.36203, -2.720181, 0, 1, 0.5372549, 1,
-0.2523673, -0.8631863, -1.827157, 0, 1, 0.5450981, 1,
-0.2493809, 0.2720754, -0.3175554, 0, 1, 0.5490196, 1,
-0.2479324, 0.850075, 0.5896313, 0, 1, 0.5568628, 1,
-0.2404318, 0.6556901, -0.3751419, 0, 1, 0.5607843, 1,
-0.2393831, -0.8586359, -2.025826, 0, 1, 0.5686275, 1,
-0.2379988, 0.9124231, 0.6340855, 0, 1, 0.572549, 1,
-0.2361135, 1.986758, -2.043141, 0, 1, 0.5803922, 1,
-0.2339136, 0.5497614, -1.793776, 0, 1, 0.5843138, 1,
-0.2320922, -1.244009, -2.687304, 0, 1, 0.5921569, 1,
-0.2313406, -0.07751565, -2.267767, 0, 1, 0.5960785, 1,
-0.2280995, -1.758265, -2.862989, 0, 1, 0.6039216, 1,
-0.2271142, 0.2084017, -0.4576675, 0, 1, 0.6117647, 1,
-0.2269967, 0.06397877, -1.588958, 0, 1, 0.6156863, 1,
-0.2244934, -1.791897, -2.780567, 0, 1, 0.6235294, 1,
-0.2198664, 1.407195, -0.513522, 0, 1, 0.627451, 1,
-0.2167208, -1.349598, -3.013364, 0, 1, 0.6352941, 1,
-0.2143698, 0.5496176, 0.6458141, 0, 1, 0.6392157, 1,
-0.2132173, 0.094265, -0.9495975, 0, 1, 0.6470588, 1,
-0.2090173, 1.494439, 1.729503, 0, 1, 0.6509804, 1,
-0.2078963, 0.1335997, -0.2966188, 0, 1, 0.6588235, 1,
-0.2058834, 0.5375576, 1.792705, 0, 1, 0.6627451, 1,
-0.201206, -0.3222458, -2.987955, 0, 1, 0.6705883, 1,
-0.1984963, -0.7017037, -1.956015, 0, 1, 0.6745098, 1,
-0.1966715, 2.395853, -0.3936776, 0, 1, 0.682353, 1,
-0.1927645, 0.9652722, 0.513052, 0, 1, 0.6862745, 1,
-0.1894034, 0.5472466, 0.1908354, 0, 1, 0.6941177, 1,
-0.183249, 0.6179091, 0.3713741, 0, 1, 0.7019608, 1,
-0.1800589, -0.4497237, -2.006453, 0, 1, 0.7058824, 1,
-0.1788152, 1.95947, -0.8397924, 0, 1, 0.7137255, 1,
-0.177829, -1.736507, -3.274827, 0, 1, 0.7176471, 1,
-0.1764554, 2.148847, -0.5051689, 0, 1, 0.7254902, 1,
-0.1755913, -1.009994, -3.109159, 0, 1, 0.7294118, 1,
-0.1742992, 1.032723, -0.757478, 0, 1, 0.7372549, 1,
-0.1701066, 2.130664, -0.2114716, 0, 1, 0.7411765, 1,
-0.1641383, 1.327806, -0.4661044, 0, 1, 0.7490196, 1,
-0.1607026, -0.671237, -2.628417, 0, 1, 0.7529412, 1,
-0.1542852, -0.3282158, -0.4415414, 0, 1, 0.7607843, 1,
-0.1514715, 1.066159, -0.2961951, 0, 1, 0.7647059, 1,
-0.145694, 0.3040341, -0.3043883, 0, 1, 0.772549, 1,
-0.1432909, 0.1229228, -1.70759, 0, 1, 0.7764706, 1,
-0.1396288, 0.1675121, -1.962782, 0, 1, 0.7843137, 1,
-0.1305042, -0.1649798, -2.99182, 0, 1, 0.7882353, 1,
-0.1297204, 0.2926868, -1.026237, 0, 1, 0.7960784, 1,
-0.1270066, -0.08273538, -1.382986, 0, 1, 0.8039216, 1,
-0.1222816, -0.3414517, -2.162011, 0, 1, 0.8078431, 1,
-0.1199448, -0.7951269, -3.654097, 0, 1, 0.8156863, 1,
-0.1180164, -0.4449746, -2.476283, 0, 1, 0.8196079, 1,
-0.1168325, -1.373528, -2.86284, 0, 1, 0.827451, 1,
-0.1159525, 1.651553, -1.22068, 0, 1, 0.8313726, 1,
-0.1106561, -1.741077, -1.902947, 0, 1, 0.8392157, 1,
-0.1095177, 0.5823352, 0.6539772, 0, 1, 0.8431373, 1,
-0.1091383, -0.2751733, -3.401612, 0, 1, 0.8509804, 1,
-0.1064505, 1.844897, -0.04577892, 0, 1, 0.854902, 1,
-0.106351, -0.001748778, -2.187035, 0, 1, 0.8627451, 1,
-0.1008889, 1.254738, -0.1739886, 0, 1, 0.8666667, 1,
-0.09862304, -1.181691, -2.181826, 0, 1, 0.8745098, 1,
-0.09404198, 0.6970128, 0.2385651, 0, 1, 0.8784314, 1,
-0.09346464, 0.4027935, -0.5142291, 0, 1, 0.8862745, 1,
-0.08863784, -1.451054, -3.467, 0, 1, 0.8901961, 1,
-0.08783548, 0.04538638, -1.072816, 0, 1, 0.8980392, 1,
-0.08259528, -0.3057939, -2.634921, 0, 1, 0.9058824, 1,
-0.08157952, -0.2319171, -2.132665, 0, 1, 0.9098039, 1,
-0.0793394, -1.287902, -3.957066, 0, 1, 0.9176471, 1,
-0.07873308, 1.120743, 0.414443, 0, 1, 0.9215686, 1,
-0.07651913, -1.097649, -3.359043, 0, 1, 0.9294118, 1,
-0.06385655, 0.9685307, 0.2166137, 0, 1, 0.9333333, 1,
-0.05978594, 0.3291045, 0.4364636, 0, 1, 0.9411765, 1,
-0.05545372, -2.245082, -2.899225, 0, 1, 0.945098, 1,
-0.05357111, -0.176876, -1.728504, 0, 1, 0.9529412, 1,
-0.053416, 1.412934, 1.10771, 0, 1, 0.9568627, 1,
-0.05081499, -0.04252192, -3.434649, 0, 1, 0.9647059, 1,
-0.05056043, -0.8070478, -2.506639, 0, 1, 0.9686275, 1,
-0.04706349, 2.103647, -0.281177, 0, 1, 0.9764706, 1,
-0.04343184, 0.7742748, 0.1564311, 0, 1, 0.9803922, 1,
-0.0361383, -1.09887, -3.178597, 0, 1, 0.9882353, 1,
-0.03408996, 0.6137482, 0.942737, 0, 1, 0.9921569, 1,
-0.03406772, -0.3900578, -3.654436, 0, 1, 1, 1,
-0.03213234, 0.4148081, 0.7932919, 0, 0.9921569, 1, 1,
-0.03042096, 1.085294, 0.9275798, 0, 0.9882353, 1, 1,
-0.02718102, 0.7210466, -0.07954231, 0, 0.9803922, 1, 1,
-0.02677718, -1.167244, -4.484223, 0, 0.9764706, 1, 1,
-0.02124081, -1.300096, -3.648058, 0, 0.9686275, 1, 1,
-0.02055435, 0.1921544, -0.3042945, 0, 0.9647059, 1, 1,
-0.01803168, 0.5944023, -1.206703, 0, 0.9568627, 1, 1,
-0.01694069, 1.794656, -0.8483926, 0, 0.9529412, 1, 1,
-0.01495499, -0.6826859, -3.765328, 0, 0.945098, 1, 1,
-0.01406812, -0.6753584, -4.18582, 0, 0.9411765, 1, 1,
-0.01132193, 0.2070067, -1.319119, 0, 0.9333333, 1, 1,
-0.003844489, -1.462173, -2.695022, 0, 0.9294118, 1, 1,
0.0005155781, 0.3900213, -0.7477175, 0, 0.9215686, 1, 1,
0.001667962, -0.7216041, 3.186726, 0, 0.9176471, 1, 1,
0.00495258, -0.2764336, 1.133207, 0, 0.9098039, 1, 1,
0.005515247, 1.786977, 0.6146864, 0, 0.9058824, 1, 1,
0.009909976, 1.098921, 0.8213789, 0, 0.8980392, 1, 1,
0.010241, -0.1676592, 3.101185, 0, 0.8901961, 1, 1,
0.01064719, -1.310045, 3.379974, 0, 0.8862745, 1, 1,
0.01064944, -1.400339, 2.935702, 0, 0.8784314, 1, 1,
0.01075871, 0.3871481, -1.035305, 0, 0.8745098, 1, 1,
0.01245367, 0.9251571, -1.21693, 0, 0.8666667, 1, 1,
0.0141042, 1.739235, 1.307136, 0, 0.8627451, 1, 1,
0.01795325, 1.159648, -0.1641965, 0, 0.854902, 1, 1,
0.02604355, -0.5711547, 2.74097, 0, 0.8509804, 1, 1,
0.02923205, 1.687675, -0.5415341, 0, 0.8431373, 1, 1,
0.03104045, -0.4011446, 4.086655, 0, 0.8392157, 1, 1,
0.03305295, -0.4536354, 3.514402, 0, 0.8313726, 1, 1,
0.03652012, 1.061355, 0.9817582, 0, 0.827451, 1, 1,
0.03701182, -0.7418436, 3.361637, 0, 0.8196079, 1, 1,
0.04296209, -0.5976279, 3.638247, 0, 0.8156863, 1, 1,
0.04631341, 0.1968841, 0.906272, 0, 0.8078431, 1, 1,
0.04847823, 0.9141998, 0.7932625, 0, 0.8039216, 1, 1,
0.05148411, -1.905185, 3.668119, 0, 0.7960784, 1, 1,
0.05208575, -0.6824768, 3.986742, 0, 0.7882353, 1, 1,
0.05377861, -1.010216, 1.011752, 0, 0.7843137, 1, 1,
0.05517581, 0.6185349, -0.3455208, 0, 0.7764706, 1, 1,
0.05538886, -1.088411, 3.100297, 0, 0.772549, 1, 1,
0.0559616, 0.8175884, -0.315219, 0, 0.7647059, 1, 1,
0.06578659, 0.2910361, 0.4254285, 0, 0.7607843, 1, 1,
0.07273751, 1.099405, 0.3665997, 0, 0.7529412, 1, 1,
0.07505806, 2.127312, -0.4818836, 0, 0.7490196, 1, 1,
0.07560389, -0.1217818, 3.095917, 0, 0.7411765, 1, 1,
0.07606827, -0.5705159, 3.092488, 0, 0.7372549, 1, 1,
0.07644512, 0.1635211, -1.276574, 0, 0.7294118, 1, 1,
0.07679761, 0.5574113, 0.3725988, 0, 0.7254902, 1, 1,
0.08397013, -0.6231826, 3.011108, 0, 0.7176471, 1, 1,
0.08704889, -0.4347492, 1.884032, 0, 0.7137255, 1, 1,
0.08743211, 1.117599, 1.744822, 0, 0.7058824, 1, 1,
0.08856189, -0.2791174, 3.35704, 0, 0.6980392, 1, 1,
0.08930267, -1.079545, 2.402221, 0, 0.6941177, 1, 1,
0.08933224, -0.8567516, 3.295471, 0, 0.6862745, 1, 1,
0.09613663, 0.2697242, 1.13834, 0, 0.682353, 1, 1,
0.09806028, -1.337991, 4.609391, 0, 0.6745098, 1, 1,
0.1034407, 0.6321703, -0.6538281, 0, 0.6705883, 1, 1,
0.1048868, 0.2444129, 0.9353546, 0, 0.6627451, 1, 1,
0.1067992, -1.97588, 3.044245, 0, 0.6588235, 1, 1,
0.111372, -0.58393, 3.184371, 0, 0.6509804, 1, 1,
0.1118268, -1.025273, 3.892869, 0, 0.6470588, 1, 1,
0.1124732, -0.4474516, 4.28598, 0, 0.6392157, 1, 1,
0.1187328, 0.1404858, 1.359263, 0, 0.6352941, 1, 1,
0.1191466, -0.768218, 1.45039, 0, 0.627451, 1, 1,
0.1281536, 0.9064102, 1.087485, 0, 0.6235294, 1, 1,
0.1284287, 1.102887, -0.7952576, 0, 0.6156863, 1, 1,
0.1287814, 1.102744, 0.8512621, 0, 0.6117647, 1, 1,
0.1289997, -0.6159402, 3.580765, 0, 0.6039216, 1, 1,
0.1309101, 1.078182, -1.537791, 0, 0.5960785, 1, 1,
0.1385229, -0.5942474, 3.169205, 0, 0.5921569, 1, 1,
0.1398339, -0.8774836, 3.691258, 0, 0.5843138, 1, 1,
0.141581, 1.03465, 0.486852, 0, 0.5803922, 1, 1,
0.1422327, -0.6428512, 2.971279, 0, 0.572549, 1, 1,
0.144397, -0.9815857, 3.422468, 0, 0.5686275, 1, 1,
0.1508549, 2.178376, 0.8477062, 0, 0.5607843, 1, 1,
0.1535684, 1.423135, -0.5074306, 0, 0.5568628, 1, 1,
0.1562267, -0.2247648, 3.641619, 0, 0.5490196, 1, 1,
0.1595008, 0.2407428, -0.2625469, 0, 0.5450981, 1, 1,
0.1675771, 1.254686, 0.01842515, 0, 0.5372549, 1, 1,
0.1707788, 1.229788, -1.239108, 0, 0.5333334, 1, 1,
0.1747887, 1.405668, -0.5778494, 0, 0.5254902, 1, 1,
0.1748068, 0.1893308, 1.008418, 0, 0.5215687, 1, 1,
0.1754424, 0.07148403, 1.507494, 0, 0.5137255, 1, 1,
0.1790197, 0.9013796, 0.05580367, 0, 0.509804, 1, 1,
0.1833321, -0.8195102, 2.836957, 0, 0.5019608, 1, 1,
0.1864785, 0.3761359, -0.1437454, 0, 0.4941176, 1, 1,
0.1901986, 1.592385, -0.1135574, 0, 0.4901961, 1, 1,
0.1906842, -0.364329, 2.48362, 0, 0.4823529, 1, 1,
0.1909833, -0.04845374, 3.134797, 0, 0.4784314, 1, 1,
0.192956, 1.522518, -0.1766838, 0, 0.4705882, 1, 1,
0.1930762, 0.3368314, -1.624626, 0, 0.4666667, 1, 1,
0.1934187, 1.675434, 2.109819, 0, 0.4588235, 1, 1,
0.1962809, -0.1529125, 2.393882, 0, 0.454902, 1, 1,
0.1965451, 0.4066353, 1.315579, 0, 0.4470588, 1, 1,
0.2016926, 0.2872454, -0.4976044, 0, 0.4431373, 1, 1,
0.2022588, 0.6227408, 1.658473, 0, 0.4352941, 1, 1,
0.2030739, 0.1386356, 0.7202197, 0, 0.4313726, 1, 1,
0.2031972, -1.719521, 2.891326, 0, 0.4235294, 1, 1,
0.2039288, -0.1119433, 0.8307903, 0, 0.4196078, 1, 1,
0.2047278, -0.8691977, 3.207537, 0, 0.4117647, 1, 1,
0.2060131, 1.039277, -0.7882139, 0, 0.4078431, 1, 1,
0.2065991, -1.639084, 3.28881, 0, 0.4, 1, 1,
0.20753, -0.1596468, 3.845207, 0, 0.3921569, 1, 1,
0.2147161, 0.1124356, 1.556041, 0, 0.3882353, 1, 1,
0.218136, -0.6505887, 3.787431, 0, 0.3803922, 1, 1,
0.2183415, 0.482358, 0.07131957, 0, 0.3764706, 1, 1,
0.2188311, 0.8459646, 0.2495629, 0, 0.3686275, 1, 1,
0.2205697, 0.4371483, 2.328314, 0, 0.3647059, 1, 1,
0.2500841, 0.2618771, 0.7376056, 0, 0.3568628, 1, 1,
0.2513485, 1.087574, -0.1306356, 0, 0.3529412, 1, 1,
0.2517571, 0.445554, -0.3238275, 0, 0.345098, 1, 1,
0.2519021, 1.555902, -1.770365, 0, 0.3411765, 1, 1,
0.2525974, 2.489609, -1.337416, 0, 0.3333333, 1, 1,
0.2529111, 1.176382, 0.4617186, 0, 0.3294118, 1, 1,
0.2548248, -0.2686203, 3.337008, 0, 0.3215686, 1, 1,
0.2555896, 1.322133, 0.3115733, 0, 0.3176471, 1, 1,
0.2562719, -1.08053, 4.145682, 0, 0.3098039, 1, 1,
0.2595438, -0.2687027, 3.380269, 0, 0.3058824, 1, 1,
0.2620704, 0.8460633, 1.25009, 0, 0.2980392, 1, 1,
0.26558, 0.1637073, 0.6725344, 0, 0.2901961, 1, 1,
0.2658849, -0.2357434, 0.5859814, 0, 0.2862745, 1, 1,
0.2684855, 0.08440751, 0.5174956, 0, 0.2784314, 1, 1,
0.2723949, 1.584788, -0.4744989, 0, 0.2745098, 1, 1,
0.2755563, -0.2167575, 2.878146, 0, 0.2666667, 1, 1,
0.2774739, 0.1708212, 0.8501464, 0, 0.2627451, 1, 1,
0.2803933, 0.9131631, 1.742301, 0, 0.254902, 1, 1,
0.2836976, 0.4976077, 2.278522, 0, 0.2509804, 1, 1,
0.2849373, -0.8210098, 2.273584, 0, 0.2431373, 1, 1,
0.2899968, -0.3159328, 3.255735, 0, 0.2392157, 1, 1,
0.2945857, -1.109826, 2.414171, 0, 0.2313726, 1, 1,
0.2987665, 0.8940737, 0.653703, 0, 0.227451, 1, 1,
0.3014368, 0.1312754, 2.858871, 0, 0.2196078, 1, 1,
0.3040184, -0.6936746, 0.819066, 0, 0.2156863, 1, 1,
0.3066255, -0.07246128, 3.164411, 0, 0.2078431, 1, 1,
0.3074442, -1.728106, 2.906567, 0, 0.2039216, 1, 1,
0.3079697, -0.9245174, 4.35435, 0, 0.1960784, 1, 1,
0.3118994, -1.735657, 3.268597, 0, 0.1882353, 1, 1,
0.3130178, -1.446947, 2.724885, 0, 0.1843137, 1, 1,
0.3144585, 0.09053809, 2.029106, 0, 0.1764706, 1, 1,
0.3163154, 2.020011, 1.278324, 0, 0.172549, 1, 1,
0.3217174, 1.37154, 1.436579, 0, 0.1647059, 1, 1,
0.3244835, 0.8008415, 0.8916917, 0, 0.1607843, 1, 1,
0.3283092, -0.2867482, 2.612746, 0, 0.1529412, 1, 1,
0.3296973, 0.7427626, 0.5728219, 0, 0.1490196, 1, 1,
0.3324389, 0.841488, 0.02664427, 0, 0.1411765, 1, 1,
0.3359051, -0.2507895, 0.5378518, 0, 0.1372549, 1, 1,
0.3399401, -0.7837082, 2.798862, 0, 0.1294118, 1, 1,
0.3429623, 1.507786, 0.09886175, 0, 0.1254902, 1, 1,
0.3431688, 0.2489882, 0.2034786, 0, 0.1176471, 1, 1,
0.3457786, -1.23836, 2.291533, 0, 0.1137255, 1, 1,
0.3486196, 1.211416, 0.4954567, 0, 0.1058824, 1, 1,
0.3531747, 0.7813289, 0.8413432, 0, 0.09803922, 1, 1,
0.3541719, 1.304481, 1.505202, 0, 0.09411765, 1, 1,
0.3544405, 0.3559838, 1.227692, 0, 0.08627451, 1, 1,
0.3585681, 0.5905904, 1.049534, 0, 0.08235294, 1, 1,
0.3591727, -0.3056079, 2.598878, 0, 0.07450981, 1, 1,
0.3611462, -0.1903569, 2.653493, 0, 0.07058824, 1, 1,
0.3711033, -1.544553, 2.636353, 0, 0.0627451, 1, 1,
0.3712043, 0.5741417, -1.322933, 0, 0.05882353, 1, 1,
0.3726233, 0.1255613, 2.261993, 0, 0.05098039, 1, 1,
0.3737397, 0.07561984, 0.2745666, 0, 0.04705882, 1, 1,
0.3846416, 1.217679, 0.575833, 0, 0.03921569, 1, 1,
0.3867218, -2.230258, 3.886869, 0, 0.03529412, 1, 1,
0.3877903, 0.6190738, -0.4848625, 0, 0.02745098, 1, 1,
0.3892411, 0.0464412, 0.6425696, 0, 0.02352941, 1, 1,
0.3938414, -0.635828, 4.482468, 0, 0.01568628, 1, 1,
0.3942603, -0.8487357, 2.237459, 0, 0.01176471, 1, 1,
0.3966162, 0.006464737, -0.003396996, 0, 0.003921569, 1, 1,
0.4020092, 1.284685, 1.229734, 0.003921569, 0, 1, 1,
0.407361, -1.204728, 2.162556, 0.007843138, 0, 1, 1,
0.4086548, -0.506327, 2.81128, 0.01568628, 0, 1, 1,
0.4102469, -0.7564151, 2.736702, 0.01960784, 0, 1, 1,
0.4109545, -1.333815, 2.439281, 0.02745098, 0, 1, 1,
0.411572, 0.4499039, 2.835669, 0.03137255, 0, 1, 1,
0.4145636, -0.5955232, 3.063295, 0.03921569, 0, 1, 1,
0.4147208, -0.6785083, 2.449113, 0.04313726, 0, 1, 1,
0.4149401, -0.7388456, 1.050332, 0.05098039, 0, 1, 1,
0.4201166, -0.09888274, 0.5801973, 0.05490196, 0, 1, 1,
0.4214555, 0.9698732, 1.897854, 0.0627451, 0, 1, 1,
0.4224733, -1.480227, 2.85601, 0.06666667, 0, 1, 1,
0.4228752, -0.4912015, 2.857007, 0.07450981, 0, 1, 1,
0.4240695, 0.6253712, -1.403769, 0.07843138, 0, 1, 1,
0.4262863, -0.3048973, 3.645694, 0.08627451, 0, 1, 1,
0.4280981, -0.2190509, 2.300453, 0.09019608, 0, 1, 1,
0.4292493, -1.075671, 4.356112, 0.09803922, 0, 1, 1,
0.4312855, 0.4391382, 0.2903179, 0.1058824, 0, 1, 1,
0.4332498, -0.4910034, 3.599495, 0.1098039, 0, 1, 1,
0.4360806, -0.009098176, 3.578755, 0.1176471, 0, 1, 1,
0.4375514, 1.216236, 0.1242166, 0.1215686, 0, 1, 1,
0.4388063, 0.6989949, 2.373664, 0.1294118, 0, 1, 1,
0.444409, 1.063892, 1.507667, 0.1333333, 0, 1, 1,
0.4452105, -0.3102852, 3.670013, 0.1411765, 0, 1, 1,
0.4497595, -1.07682, 4.514972, 0.145098, 0, 1, 1,
0.451765, -0.1302007, 0.7508861, 0.1529412, 0, 1, 1,
0.4549662, 0.1727077, 3.71689, 0.1568628, 0, 1, 1,
0.4555153, 0.8505831, -0.4390089, 0.1647059, 0, 1, 1,
0.4578551, 0.7577171, 1.130134, 0.1686275, 0, 1, 1,
0.4591946, 0.4474655, 1.108862, 0.1764706, 0, 1, 1,
0.4605303, -1.347423, 4.326558, 0.1803922, 0, 1, 1,
0.4690888, -0.9562463, 1.636295, 0.1882353, 0, 1, 1,
0.469781, -1.108402, 2.660222, 0.1921569, 0, 1, 1,
0.4752956, 0.4085503, 0.6530316, 0.2, 0, 1, 1,
0.478145, 0.01485344, 0.2978261, 0.2078431, 0, 1, 1,
0.4783553, 0.6373063, 1.573292, 0.2117647, 0, 1, 1,
0.4792867, 0.6207607, 0.1852752, 0.2196078, 0, 1, 1,
0.4802978, -0.733054, 3.338744, 0.2235294, 0, 1, 1,
0.4820383, 0.7446486, -0.8857092, 0.2313726, 0, 1, 1,
0.4927586, -0.1084687, 1.301673, 0.2352941, 0, 1, 1,
0.4934604, -0.1069412, 0.4737972, 0.2431373, 0, 1, 1,
0.4984551, -0.460913, 1.587243, 0.2470588, 0, 1, 1,
0.5032309, -0.6725835, 2.468199, 0.254902, 0, 1, 1,
0.5033715, 0.6109586, 1.390971, 0.2588235, 0, 1, 1,
0.5048335, 1.888553, -0.4701856, 0.2666667, 0, 1, 1,
0.5053942, -0.03677358, 3.470651, 0.2705882, 0, 1, 1,
0.5060319, 0.6734471, 1.152566, 0.2784314, 0, 1, 1,
0.5084066, 0.6414949, 0.6205614, 0.282353, 0, 1, 1,
0.5095634, 0.8374735, 1.043213, 0.2901961, 0, 1, 1,
0.5125674, -0.6548079, 4.019143, 0.2941177, 0, 1, 1,
0.5164154, -1.418406, 2.283992, 0.3019608, 0, 1, 1,
0.5179234, -1.328596, 3.300704, 0.3098039, 0, 1, 1,
0.5191439, 1.187696, 0.5375106, 0.3137255, 0, 1, 1,
0.5213168, 1.468912, -0.8884382, 0.3215686, 0, 1, 1,
0.5227404, -0.2803013, 2.841289, 0.3254902, 0, 1, 1,
0.523068, -0.6291587, 3.246287, 0.3333333, 0, 1, 1,
0.5235103, 0.8137372, 1.165445, 0.3372549, 0, 1, 1,
0.5265936, 1.064193, 1.808493, 0.345098, 0, 1, 1,
0.5336533, 0.07297897, 2.595, 0.3490196, 0, 1, 1,
0.5354567, -1.032658, 2.094445, 0.3568628, 0, 1, 1,
0.5374636, 0.5784854, -0.07894055, 0.3607843, 0, 1, 1,
0.5390679, -0.2202194, 2.658344, 0.3686275, 0, 1, 1,
0.5403753, 0.702031, -0.4558598, 0.372549, 0, 1, 1,
0.5414773, -1.706025, 1.649551, 0.3803922, 0, 1, 1,
0.5485519, -0.4368872, 1.771021, 0.3843137, 0, 1, 1,
0.5536289, 0.1826035, 0.2638532, 0.3921569, 0, 1, 1,
0.5590736, 0.3654914, 2.268808, 0.3960784, 0, 1, 1,
0.5605255, 0.3185486, 0.9325973, 0.4039216, 0, 1, 1,
0.5607338, 0.3014449, 1.488904, 0.4117647, 0, 1, 1,
0.5622674, -0.2357925, 1.56338, 0.4156863, 0, 1, 1,
0.5650116, -2.042822, 3.783355, 0.4235294, 0, 1, 1,
0.5701551, -0.0922959, 2.661263, 0.427451, 0, 1, 1,
0.5742788, -0.2878797, 0.7177933, 0.4352941, 0, 1, 1,
0.5793304, 0.1703562, -1.238025, 0.4392157, 0, 1, 1,
0.5816492, 0.3027684, 1.569563, 0.4470588, 0, 1, 1,
0.5822607, -0.1689376, 2.807833, 0.4509804, 0, 1, 1,
0.5833126, 0.8028443, -0.4027583, 0.4588235, 0, 1, 1,
0.5838645, 1.098028, 1.0375, 0.4627451, 0, 1, 1,
0.5841443, -0.5913972, 2.433142, 0.4705882, 0, 1, 1,
0.5869011, 0.2323207, 0.2545583, 0.4745098, 0, 1, 1,
0.5916131, 1.045366, 0.2828725, 0.4823529, 0, 1, 1,
0.5930664, -0.6100658, 2.747202, 0.4862745, 0, 1, 1,
0.5993479, -1.352782, 2.598248, 0.4941176, 0, 1, 1,
0.5997184, 0.1692356, 1.784191, 0.5019608, 0, 1, 1,
0.600292, 0.2329111, 4.230403, 0.5058824, 0, 1, 1,
0.6057478, 1.282496, 0.01303765, 0.5137255, 0, 1, 1,
0.6124785, 0.2970879, 1.807658, 0.5176471, 0, 1, 1,
0.6135316, -0.6084083, 2.79318, 0.5254902, 0, 1, 1,
0.6147562, 1.881193, 0.726256, 0.5294118, 0, 1, 1,
0.6185211, 1.176011, 0.4129799, 0.5372549, 0, 1, 1,
0.6219959, -1.877295, 2.63113, 0.5411765, 0, 1, 1,
0.6229733, 0.03760767, 0.248725, 0.5490196, 0, 1, 1,
0.6275599, 0.156905, 0.6452214, 0.5529412, 0, 1, 1,
0.629222, -0.2440735, 0.8824465, 0.5607843, 0, 1, 1,
0.6332939, -1.056476, 4.674264, 0.5647059, 0, 1, 1,
0.6335273, 0.09170141, 3.742299, 0.572549, 0, 1, 1,
0.6377368, 0.3063134, 0.4887081, 0.5764706, 0, 1, 1,
0.6400127, 0.01935862, 2.612806, 0.5843138, 0, 1, 1,
0.6511436, -2.197848, 2.78018, 0.5882353, 0, 1, 1,
0.6533699, -0.7114084, 2.566401, 0.5960785, 0, 1, 1,
0.6545282, -0.6834484, 1.786565, 0.6039216, 0, 1, 1,
0.6549764, 1.911304, 1.065631, 0.6078432, 0, 1, 1,
0.6706061, -0.008101143, 1.133939, 0.6156863, 0, 1, 1,
0.6731007, -1.524666, 4.152277, 0.6196079, 0, 1, 1,
0.6737892, -1.262645, 2.64747, 0.627451, 0, 1, 1,
0.6743508, -0.3818622, 3.387991, 0.6313726, 0, 1, 1,
0.6815929, -2.808209, 4.185844, 0.6392157, 0, 1, 1,
0.6846473, -1.237458, 1.259557, 0.6431373, 0, 1, 1,
0.6917801, -1.07175, 4.226223, 0.6509804, 0, 1, 1,
0.6980736, -0.02619349, 3.465766, 0.654902, 0, 1, 1,
0.7102639, -1.448555, 2.445781, 0.6627451, 0, 1, 1,
0.7124104, -0.8274949, 1.830417, 0.6666667, 0, 1, 1,
0.7145732, -0.1939826, 0.541621, 0.6745098, 0, 1, 1,
0.7154001, -0.2270174, 1.4159, 0.6784314, 0, 1, 1,
0.7189643, 0.0204295, 1.207193, 0.6862745, 0, 1, 1,
0.7212469, -0.3359917, 1.08375, 0.6901961, 0, 1, 1,
0.7277719, 1.30955, 1.179268, 0.6980392, 0, 1, 1,
0.7294772, 0.01198922, 1.027947, 0.7058824, 0, 1, 1,
0.7321736, 1.102394, 2.228457, 0.7098039, 0, 1, 1,
0.7359818, -1.47289, 0.9389774, 0.7176471, 0, 1, 1,
0.7365444, -0.2215779, 2.262596, 0.7215686, 0, 1, 1,
0.7374839, 0.331257, 1.059722, 0.7294118, 0, 1, 1,
0.7388654, -1.775669, 3.409194, 0.7333333, 0, 1, 1,
0.7428238, -0.8804727, 2.410496, 0.7411765, 0, 1, 1,
0.7441419, 1.353249, -0.07573031, 0.7450981, 0, 1, 1,
0.7520537, 1.108148, -0.3464885, 0.7529412, 0, 1, 1,
0.7545649, -1.693654, 2.571539, 0.7568628, 0, 1, 1,
0.7591909, 1.179102, -0.1876739, 0.7647059, 0, 1, 1,
0.761456, -1.589505, 2.334551, 0.7686275, 0, 1, 1,
0.7616873, 1.836533, 1.265346, 0.7764706, 0, 1, 1,
0.7622357, 0.4166644, 0.507661, 0.7803922, 0, 1, 1,
0.7671067, 0.8825514, 0.6920769, 0.7882353, 0, 1, 1,
0.7708095, -1.005641, 2.217476, 0.7921569, 0, 1, 1,
0.7711844, 0.3396144, 0.6276495, 0.8, 0, 1, 1,
0.7731594, 0.8491248, 0.001428901, 0.8078431, 0, 1, 1,
0.7749964, -0.4802386, 1.368969, 0.8117647, 0, 1, 1,
0.7802592, -0.6478328, 1.750614, 0.8196079, 0, 1, 1,
0.7808645, -1.523488, 3.65766, 0.8235294, 0, 1, 1,
0.7886215, 0.3368258, 0.193269, 0.8313726, 0, 1, 1,
0.7896761, -0.2063347, 2.430762, 0.8352941, 0, 1, 1,
0.805871, 0.02379031, 1.639981, 0.8431373, 0, 1, 1,
0.8062362, 0.0471318, 1.441121, 0.8470588, 0, 1, 1,
0.8134224, 1.042328, 0.5225526, 0.854902, 0, 1, 1,
0.8189222, -2.03554, 1.091571, 0.8588235, 0, 1, 1,
0.8191599, 0.6270288, 2.408447, 0.8666667, 0, 1, 1,
0.8234159, -0.1491721, 2.997615, 0.8705882, 0, 1, 1,
0.8234792, -0.8482608, 2.734713, 0.8784314, 0, 1, 1,
0.8270653, 0.08671413, 1.218504, 0.8823529, 0, 1, 1,
0.8286958, -0.3188085, 2.947654, 0.8901961, 0, 1, 1,
0.8367912, 0.1100384, 0.7549276, 0.8941177, 0, 1, 1,
0.8424186, 1.072203, 2.355913, 0.9019608, 0, 1, 1,
0.8465168, 1.012458, 0.5436516, 0.9098039, 0, 1, 1,
0.8515718, -0.1999285, 1.424412, 0.9137255, 0, 1, 1,
0.8585854, 1.010937, 0.971128, 0.9215686, 0, 1, 1,
0.8616024, 1.125919, 0.879353, 0.9254902, 0, 1, 1,
0.8617855, 0.7369167, 1.389794, 0.9333333, 0, 1, 1,
0.8653527, -0.4093358, 3.068832, 0.9372549, 0, 1, 1,
0.868053, -0.7000152, 3.475317, 0.945098, 0, 1, 1,
0.8689049, -0.2516313, 1.204488, 0.9490196, 0, 1, 1,
0.8729045, 0.7678639, -1.103901, 0.9568627, 0, 1, 1,
0.8759075, -0.1397936, 2.618595, 0.9607843, 0, 1, 1,
0.8791485, -1.137696, 2.793985, 0.9686275, 0, 1, 1,
0.8798575, 0.56774, 0.3488034, 0.972549, 0, 1, 1,
0.8839764, -0.1497246, -0.01684915, 0.9803922, 0, 1, 1,
0.8862367, 1.669214, -0.393226, 0.9843137, 0, 1, 1,
0.8880657, -0.1542065, 1.760334, 0.9921569, 0, 1, 1,
0.8959152, 1.288496, -0.3091224, 0.9960784, 0, 1, 1,
0.9027998, 0.08067388, 2.622126, 1, 0, 0.9960784, 1,
0.907492, -1.758189, 4.653109, 1, 0, 0.9882353, 1,
0.9108776, -0.2016793, 0.5928265, 1, 0, 0.9843137, 1,
0.9109604, -1.863237, 2.186518, 1, 0, 0.9764706, 1,
0.9137442, 0.1576237, 0.8249611, 1, 0, 0.972549, 1,
0.9138355, 0.5826221, -0.2366109, 1, 0, 0.9647059, 1,
0.9197598, 0.1939319, 1.228468, 1, 0, 0.9607843, 1,
0.9251478, 1.334789, 0.8703614, 1, 0, 0.9529412, 1,
0.9281284, 0.5072089, 0.805734, 1, 0, 0.9490196, 1,
0.9328378, 1.671694, 0.2191671, 1, 0, 0.9411765, 1,
0.937902, 2.583755, 1.582804, 1, 0, 0.9372549, 1,
0.9403033, -1.655395, 3.609077, 1, 0, 0.9294118, 1,
0.9459474, 0.2973806, 1.023887, 1, 0, 0.9254902, 1,
0.9510424, -0.5366466, 1.294567, 1, 0, 0.9176471, 1,
0.9552885, -2.020434, 3.040327, 1, 0, 0.9137255, 1,
0.957015, 0.227413, 3.027781, 1, 0, 0.9058824, 1,
0.9583399, 1.730769, 0.05725965, 1, 0, 0.9019608, 1,
0.9586849, 0.01689854, 1.385809, 1, 0, 0.8941177, 1,
0.9596197, -0.6876099, 0.9322197, 1, 0, 0.8862745, 1,
0.9622349, 0.5963331, 1.186546, 1, 0, 0.8823529, 1,
0.9622781, 1.189037, -0.3784216, 1, 0, 0.8745098, 1,
0.9666292, -0.02397938, 1.88282, 1, 0, 0.8705882, 1,
0.968765, -0.9187559, 1.319551, 1, 0, 0.8627451, 1,
0.9789873, -0.7588357, 0.6018763, 1, 0, 0.8588235, 1,
0.9810438, -0.462664, 3.879451, 1, 0, 0.8509804, 1,
0.9879815, 0.9418688, 0.2318122, 1, 0, 0.8470588, 1,
0.9982714, 0.5080578, 1.629718, 1, 0, 0.8392157, 1,
1.003852, 1.288444, 2.490035, 1, 0, 0.8352941, 1,
1.003993, -0.1280839, 0.5526236, 1, 0, 0.827451, 1,
1.014834, 0.5090989, 1.018824, 1, 0, 0.8235294, 1,
1.017054, -1.012244, 2.462222, 1, 0, 0.8156863, 1,
1.026648, 1.698546, 0.3167399, 1, 0, 0.8117647, 1,
1.033888, 0.5733603, 0.3693064, 1, 0, 0.8039216, 1,
1.034099, -0.4092349, 0.8074998, 1, 0, 0.7960784, 1,
1.043039, 0.6374123, 1.215191, 1, 0, 0.7921569, 1,
1.047032, -0.7306058, 2.323547, 1, 0, 0.7843137, 1,
1.049939, -1.449628, 4.597548, 1, 0, 0.7803922, 1,
1.052336, 0.3303443, 0.5127257, 1, 0, 0.772549, 1,
1.055975, -0.4802232, 2.036851, 1, 0, 0.7686275, 1,
1.074972, 0.2336483, 3.702547, 1, 0, 0.7607843, 1,
1.077743, -0.5927022, 1.703417, 1, 0, 0.7568628, 1,
1.078274, 0.5398188, 0.4475362, 1, 0, 0.7490196, 1,
1.090276, -1.110326, 2.014148, 1, 0, 0.7450981, 1,
1.109574, 1.156955, 0.7141806, 1, 0, 0.7372549, 1,
1.116583, 1.343217, 0.8992938, 1, 0, 0.7333333, 1,
1.123147, 1.126592, 0.7918086, 1, 0, 0.7254902, 1,
1.129372, 1.012344, 2.977214, 1, 0, 0.7215686, 1,
1.142969, 0.3888639, 0.7070203, 1, 0, 0.7137255, 1,
1.152031, 0.742485, 1.316634, 1, 0, 0.7098039, 1,
1.157184, 1.072963, 1.89593, 1, 0, 0.7019608, 1,
1.157725, 0.3119837, -0.02657454, 1, 0, 0.6941177, 1,
1.184281, -1.114685, 2.560162, 1, 0, 0.6901961, 1,
1.185954, 1.225063, 0.7609808, 1, 0, 0.682353, 1,
1.195695, -0.8535761, 0.9763094, 1, 0, 0.6784314, 1,
1.200571, 1.471273, 0.2487358, 1, 0, 0.6705883, 1,
1.202705, -0.7131077, 1.584701, 1, 0, 0.6666667, 1,
1.203802, -0.1343396, 1.292336, 1, 0, 0.6588235, 1,
1.204636, -0.6406602, 2.680141, 1, 0, 0.654902, 1,
1.206204, -0.1892181, 1.572228, 1, 0, 0.6470588, 1,
1.208565, 1.272666, 0.7772084, 1, 0, 0.6431373, 1,
1.214694, 0.07187053, 1.104896, 1, 0, 0.6352941, 1,
1.218756, -1.314104, 3.103758, 1, 0, 0.6313726, 1,
1.222614, 0.1955284, -0.1393844, 1, 0, 0.6235294, 1,
1.228714, -0.03253006, 0.8771176, 1, 0, 0.6196079, 1,
1.229577, 0.6984792, 0.9261878, 1, 0, 0.6117647, 1,
1.229664, 0.5089869, 1.812498, 1, 0, 0.6078432, 1,
1.231097, 1.175482, 2.636784, 1, 0, 0.6, 1,
1.232752, -0.4048989, 1.390239, 1, 0, 0.5921569, 1,
1.232973, 0.3645443, 0.5361301, 1, 0, 0.5882353, 1,
1.265947, -1.276833, 1.671606, 1, 0, 0.5803922, 1,
1.269901, -2.455167, 3.602147, 1, 0, 0.5764706, 1,
1.280067, 1.483644, -1.630306, 1, 0, 0.5686275, 1,
1.283154, -0.9377772, 1.770321, 1, 0, 0.5647059, 1,
1.283647, 1.668965, 0.9829279, 1, 0, 0.5568628, 1,
1.284061, 0.6875913, 0.818529, 1, 0, 0.5529412, 1,
1.296776, 2.084643, 0.7287748, 1, 0, 0.5450981, 1,
1.309679, 0.3882621, 2.195657, 1, 0, 0.5411765, 1,
1.316513, 1.123108, 1.669948, 1, 0, 0.5333334, 1,
1.321074, 0.4941814, 0.5008898, 1, 0, 0.5294118, 1,
1.321237, 0.4884832, -0.2771991, 1, 0, 0.5215687, 1,
1.32882, -0.4858005, 1.747138, 1, 0, 0.5176471, 1,
1.341196, 1.443559, 2.4909, 1, 0, 0.509804, 1,
1.34505, -0.1167447, 2.476879, 1, 0, 0.5058824, 1,
1.346955, -1.507923, -0.2610811, 1, 0, 0.4980392, 1,
1.360045, -1.171302, 2.843578, 1, 0, 0.4901961, 1,
1.366978, -0.0438895, 0.9879814, 1, 0, 0.4862745, 1,
1.391011, 1.962215, 1.688257, 1, 0, 0.4784314, 1,
1.396321, 0.6282817, 1.279839, 1, 0, 0.4745098, 1,
1.425725, 0.6057603, 0.2328676, 1, 0, 0.4666667, 1,
1.429964, 1.961359, 0.9170651, 1, 0, 0.4627451, 1,
1.432313, -0.100687, 2.681025, 1, 0, 0.454902, 1,
1.434461, -1.275771, 3.046771, 1, 0, 0.4509804, 1,
1.441599, 1.079894, 2.482343, 1, 0, 0.4431373, 1,
1.443167, 0.1175169, 1.186027, 1, 0, 0.4392157, 1,
1.450758, 1.867539, 0.01078236, 1, 0, 0.4313726, 1,
1.473914, -0.9185248, 2.214306, 1, 0, 0.427451, 1,
1.476954, 1.089455, 1.216813, 1, 0, 0.4196078, 1,
1.482547, -0.7568446, 1.101773, 1, 0, 0.4156863, 1,
1.487562, 0.07185541, 1.070611, 1, 0, 0.4078431, 1,
1.51162, -0.03397123, 1.114553, 1, 0, 0.4039216, 1,
1.522715, -1.02648, 2.130594, 1, 0, 0.3960784, 1,
1.533729, -1.364027, 2.568513, 1, 0, 0.3882353, 1,
1.55481, 1.427969, -0.700958, 1, 0, 0.3843137, 1,
1.556723, -0.8445276, 1.709094, 1, 0, 0.3764706, 1,
1.576892, 2.112504, 1.40167, 1, 0, 0.372549, 1,
1.594177, -0.3745923, 2.193359, 1, 0, 0.3647059, 1,
1.606946, 0.4957857, 1.548263, 1, 0, 0.3607843, 1,
1.620814, 1.154261, -2.183702, 1, 0, 0.3529412, 1,
1.62859, -2.175702, 4.154109, 1, 0, 0.3490196, 1,
1.638972, -0.1218852, 2.892153, 1, 0, 0.3411765, 1,
1.646949, -0.07764553, 1.584052, 1, 0, 0.3372549, 1,
1.650849, -0.6334091, 1.558806, 1, 0, 0.3294118, 1,
1.652694, 1.266712, 1.439342, 1, 0, 0.3254902, 1,
1.653906, 0.1143295, 0.6928046, 1, 0, 0.3176471, 1,
1.660026, -0.4422573, 2.548523, 1, 0, 0.3137255, 1,
1.685291, 0.4209898, 1.242363, 1, 0, 0.3058824, 1,
1.704013, -0.2838919, 2.851377, 1, 0, 0.2980392, 1,
1.720731, -1.58547, 3.001048, 1, 0, 0.2941177, 1,
1.726792, -0.2468074, 2.547698, 1, 0, 0.2862745, 1,
1.740771, -0.07569134, 0.8461785, 1, 0, 0.282353, 1,
1.745829, -0.8015885, 1.386224, 1, 0, 0.2745098, 1,
1.748662, 1.091289, 0.215303, 1, 0, 0.2705882, 1,
1.754476, -1.279865, 4.028766, 1, 0, 0.2627451, 1,
1.767951, 0.2104408, -0.1326321, 1, 0, 0.2588235, 1,
1.786372, 0.4936392, 1.702662, 1, 0, 0.2509804, 1,
1.800711, 1.299006, 0.8285095, 1, 0, 0.2470588, 1,
1.800768, -1.140114, 2.769923, 1, 0, 0.2392157, 1,
1.803553, -1.206586, 0.936968, 1, 0, 0.2352941, 1,
1.823331, 0.3876014, 3.108404, 1, 0, 0.227451, 1,
1.826151, 1.318992, 0.8272765, 1, 0, 0.2235294, 1,
1.831836, 0.5208186, 1.642733, 1, 0, 0.2156863, 1,
1.851077, 0.820938, 2.403498, 1, 0, 0.2117647, 1,
1.853153, 0.7118052, 0.1090988, 1, 0, 0.2039216, 1,
1.876291, 0.9396893, 2.134938, 1, 0, 0.1960784, 1,
1.88756, 2.510231, 0.310176, 1, 0, 0.1921569, 1,
1.892373, -0.796347, 1.686655, 1, 0, 0.1843137, 1,
1.895233, -0.3179485, 3.547637, 1, 0, 0.1803922, 1,
1.929913, -0.564144, 1.270092, 1, 0, 0.172549, 1,
1.947247, -0.4757082, 1.475188, 1, 0, 0.1686275, 1,
1.956562, -0.834112, 1.875004, 1, 0, 0.1607843, 1,
1.98066, -0.5831198, 1.386893, 1, 0, 0.1568628, 1,
2.006738, 1.187189, 0.1379151, 1, 0, 0.1490196, 1,
2.029684, -0.977218, 0.8818476, 1, 0, 0.145098, 1,
2.041581, -1.925284, 2.566316, 1, 0, 0.1372549, 1,
2.053694, 0.4336719, 2.333038, 1, 0, 0.1333333, 1,
2.08175, -1.778989, 3.68617, 1, 0, 0.1254902, 1,
2.116021, 2.549102, 0.01151599, 1, 0, 0.1215686, 1,
2.168826, 0.7045664, 1.802159, 1, 0, 0.1137255, 1,
2.184089, -0.7690395, 2.222401, 1, 0, 0.1098039, 1,
2.204341, 0.8020536, 1.376437, 1, 0, 0.1019608, 1,
2.23036, 0.1397267, 1.792783, 1, 0, 0.09411765, 1,
2.241187, -1.250417, 1.016698, 1, 0, 0.09019608, 1,
2.24827, -0.9139976, 2.63618, 1, 0, 0.08235294, 1,
2.273885, -0.417238, 2.333021, 1, 0, 0.07843138, 1,
2.292967, -0.8666649, -0.002298873, 1, 0, 0.07058824, 1,
2.304275, 0.3026528, 0.9112167, 1, 0, 0.06666667, 1,
2.307121, -0.08565827, 2.178411, 1, 0, 0.05882353, 1,
2.345974, -0.8007396, 2.736761, 1, 0, 0.05490196, 1,
2.535203, -0.2038742, -0.1558661, 1, 0, 0.04705882, 1,
2.594811, 0.1589644, -0.2652887, 1, 0, 0.04313726, 1,
2.611463, 0.6114708, 2.311878, 1, 0, 0.03529412, 1,
2.617003, -0.4423674, 1.092355, 1, 0, 0.03137255, 1,
2.648247, 0.4775223, 2.760334, 1, 0, 0.02352941, 1,
2.693089, -0.7838564, 2.040716, 1, 0, 0.01960784, 1,
2.724046, -0.0810902, 2.665132, 1, 0, 0.01176471, 1,
3.057222, 0.591054, 1.175671, 1, 0, 0.007843138, 1
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
-0.03425741, -3.855222, -6.95872, 0, -0.5, 0.5, 0.5,
-0.03425741, -3.855222, -6.95872, 1, -0.5, 0.5, 0.5,
-0.03425741, -3.855222, -6.95872, 1, 1.5, 0.5, 0.5,
-0.03425741, -3.855222, -6.95872, 0, 1.5, 0.5, 0.5
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
-4.173748, 0.2803262, -6.95872, 0, -0.5, 0.5, 0.5,
-4.173748, 0.2803262, -6.95872, 1, -0.5, 0.5, 0.5,
-4.173748, 0.2803262, -6.95872, 1, 1.5, 0.5, 0.5,
-4.173748, 0.2803262, -6.95872, 0, 1.5, 0.5, 0.5
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
-4.173748, -3.855222, -0.299222, 0, -0.5, 0.5, 0.5,
-4.173748, -3.855222, -0.299222, 1, -0.5, 0.5, 0.5,
-4.173748, -3.855222, -0.299222, 1, 1.5, 0.5, 0.5,
-4.173748, -3.855222, -0.299222, 0, 1.5, 0.5, 0.5
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
-3, -2.900865, -5.421913,
3, -2.900865, -5.421913,
-3, -2.900865, -5.421913,
-3, -3.059925, -5.678047,
-2, -2.900865, -5.421913,
-2, -3.059925, -5.678047,
-1, -2.900865, -5.421913,
-1, -3.059925, -5.678047,
0, -2.900865, -5.421913,
0, -3.059925, -5.678047,
1, -2.900865, -5.421913,
1, -3.059925, -5.678047,
2, -2.900865, -5.421913,
2, -3.059925, -5.678047,
3, -2.900865, -5.421913,
3, -3.059925, -5.678047
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
-3, -3.378044, -6.190316, 0, -0.5, 0.5, 0.5,
-3, -3.378044, -6.190316, 1, -0.5, 0.5, 0.5,
-3, -3.378044, -6.190316, 1, 1.5, 0.5, 0.5,
-3, -3.378044, -6.190316, 0, 1.5, 0.5, 0.5,
-2, -3.378044, -6.190316, 0, -0.5, 0.5, 0.5,
-2, -3.378044, -6.190316, 1, -0.5, 0.5, 0.5,
-2, -3.378044, -6.190316, 1, 1.5, 0.5, 0.5,
-2, -3.378044, -6.190316, 0, 1.5, 0.5, 0.5,
-1, -3.378044, -6.190316, 0, -0.5, 0.5, 0.5,
-1, -3.378044, -6.190316, 1, -0.5, 0.5, 0.5,
-1, -3.378044, -6.190316, 1, 1.5, 0.5, 0.5,
-1, -3.378044, -6.190316, 0, 1.5, 0.5, 0.5,
0, -3.378044, -6.190316, 0, -0.5, 0.5, 0.5,
0, -3.378044, -6.190316, 1, -0.5, 0.5, 0.5,
0, -3.378044, -6.190316, 1, 1.5, 0.5, 0.5,
0, -3.378044, -6.190316, 0, 1.5, 0.5, 0.5,
1, -3.378044, -6.190316, 0, -0.5, 0.5, 0.5,
1, -3.378044, -6.190316, 1, -0.5, 0.5, 0.5,
1, -3.378044, -6.190316, 1, 1.5, 0.5, 0.5,
1, -3.378044, -6.190316, 0, 1.5, 0.5, 0.5,
2, -3.378044, -6.190316, 0, -0.5, 0.5, 0.5,
2, -3.378044, -6.190316, 1, -0.5, 0.5, 0.5,
2, -3.378044, -6.190316, 1, 1.5, 0.5, 0.5,
2, -3.378044, -6.190316, 0, 1.5, 0.5, 0.5,
3, -3.378044, -6.190316, 0, -0.5, 0.5, 0.5,
3, -3.378044, -6.190316, 1, -0.5, 0.5, 0.5,
3, -3.378044, -6.190316, 1, 1.5, 0.5, 0.5,
3, -3.378044, -6.190316, 0, 1.5, 0.5, 0.5
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
-3.218481, -2, -5.421913,
-3.218481, 3, -5.421913,
-3.218481, -2, -5.421913,
-3.377692, -2, -5.678047,
-3.218481, -1, -5.421913,
-3.377692, -1, -5.678047,
-3.218481, 0, -5.421913,
-3.377692, 0, -5.678047,
-3.218481, 1, -5.421913,
-3.377692, 1, -5.678047,
-3.218481, 2, -5.421913,
-3.377692, 2, -5.678047,
-3.218481, 3, -5.421913,
-3.377692, 3, -5.678047
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
-3.696115, -2, -6.190316, 0, -0.5, 0.5, 0.5,
-3.696115, -2, -6.190316, 1, -0.5, 0.5, 0.5,
-3.696115, -2, -6.190316, 1, 1.5, 0.5, 0.5,
-3.696115, -2, -6.190316, 0, 1.5, 0.5, 0.5,
-3.696115, -1, -6.190316, 0, -0.5, 0.5, 0.5,
-3.696115, -1, -6.190316, 1, -0.5, 0.5, 0.5,
-3.696115, -1, -6.190316, 1, 1.5, 0.5, 0.5,
-3.696115, -1, -6.190316, 0, 1.5, 0.5, 0.5,
-3.696115, 0, -6.190316, 0, -0.5, 0.5, 0.5,
-3.696115, 0, -6.190316, 1, -0.5, 0.5, 0.5,
-3.696115, 0, -6.190316, 1, 1.5, 0.5, 0.5,
-3.696115, 0, -6.190316, 0, 1.5, 0.5, 0.5,
-3.696115, 1, -6.190316, 0, -0.5, 0.5, 0.5,
-3.696115, 1, -6.190316, 1, -0.5, 0.5, 0.5,
-3.696115, 1, -6.190316, 1, 1.5, 0.5, 0.5,
-3.696115, 1, -6.190316, 0, 1.5, 0.5, 0.5,
-3.696115, 2, -6.190316, 0, -0.5, 0.5, 0.5,
-3.696115, 2, -6.190316, 1, -0.5, 0.5, 0.5,
-3.696115, 2, -6.190316, 1, 1.5, 0.5, 0.5,
-3.696115, 2, -6.190316, 0, 1.5, 0.5, 0.5,
-3.696115, 3, -6.190316, 0, -0.5, 0.5, 0.5,
-3.696115, 3, -6.190316, 1, -0.5, 0.5, 0.5,
-3.696115, 3, -6.190316, 1, 1.5, 0.5, 0.5,
-3.696115, 3, -6.190316, 0, 1.5, 0.5, 0.5
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
-3.218481, -2.900865, -4,
-3.218481, -2.900865, 4,
-3.218481, -2.900865, -4,
-3.377692, -3.059925, -4,
-3.218481, -2.900865, -2,
-3.377692, -3.059925, -2,
-3.218481, -2.900865, 0,
-3.377692, -3.059925, 0,
-3.218481, -2.900865, 2,
-3.377692, -3.059925, 2,
-3.218481, -2.900865, 4,
-3.377692, -3.059925, 4
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
-3.696115, -3.378044, -4, 0, -0.5, 0.5, 0.5,
-3.696115, -3.378044, -4, 1, -0.5, 0.5, 0.5,
-3.696115, -3.378044, -4, 1, 1.5, 0.5, 0.5,
-3.696115, -3.378044, -4, 0, 1.5, 0.5, 0.5,
-3.696115, -3.378044, -2, 0, -0.5, 0.5, 0.5,
-3.696115, -3.378044, -2, 1, -0.5, 0.5, 0.5,
-3.696115, -3.378044, -2, 1, 1.5, 0.5, 0.5,
-3.696115, -3.378044, -2, 0, 1.5, 0.5, 0.5,
-3.696115, -3.378044, 0, 0, -0.5, 0.5, 0.5,
-3.696115, -3.378044, 0, 1, -0.5, 0.5, 0.5,
-3.696115, -3.378044, 0, 1, 1.5, 0.5, 0.5,
-3.696115, -3.378044, 0, 0, 1.5, 0.5, 0.5,
-3.696115, -3.378044, 2, 0, -0.5, 0.5, 0.5,
-3.696115, -3.378044, 2, 1, -0.5, 0.5, 0.5,
-3.696115, -3.378044, 2, 1, 1.5, 0.5, 0.5,
-3.696115, -3.378044, 2, 0, 1.5, 0.5, 0.5,
-3.696115, -3.378044, 4, 0, -0.5, 0.5, 0.5,
-3.696115, -3.378044, 4, 1, -0.5, 0.5, 0.5,
-3.696115, -3.378044, 4, 1, 1.5, 0.5, 0.5,
-3.696115, -3.378044, 4, 0, 1.5, 0.5, 0.5
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
-3.218481, -2.900865, -5.421913,
-3.218481, 3.461518, -5.421913,
-3.218481, -2.900865, 4.823469,
-3.218481, 3.461518, 4.823469,
-3.218481, -2.900865, -5.421913,
-3.218481, -2.900865, 4.823469,
-3.218481, 3.461518, -5.421913,
-3.218481, 3.461518, 4.823469,
-3.218481, -2.900865, -5.421913,
3.149966, -2.900865, -5.421913,
-3.218481, -2.900865, 4.823469,
3.149966, -2.900865, 4.823469,
-3.218481, 3.461518, -5.421913,
3.149966, 3.461518, -5.421913,
-3.218481, 3.461518, 4.823469,
3.149966, 3.461518, 4.823469,
3.149966, -2.900865, -5.421913,
3.149966, 3.461518, -5.421913,
3.149966, -2.900865, 4.823469,
3.149966, 3.461518, 4.823469,
3.149966, -2.900865, -5.421913,
3.149966, -2.900865, 4.823469,
3.149966, 3.461518, -5.421913,
3.149966, 3.461518, 4.823469
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
var radius = 7.282619;
var distance = 32.4012;
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
mvMatrix.translate( 0.03425741, -0.2803262, 0.299222 );
mvMatrix.scale( 1.236426, 1.237604, 0.7685522 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.4012);
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
Dithane<-read.table("Dithane.xyz")
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
-3.125737, -0.6489558, -2.723017, 0, 0, 1, 1, 1,
-2.964104, 0.5536858, -0.08933093, 1, 0, 0, 1, 1,
-2.765804, 1.217783, -0.3308264, 1, 0, 0, 1, 1,
-2.744335, -0.6292856, -2.820705, 1, 0, 0, 1, 1,
-2.67167, 1.606459, -2.147732, 1, 0, 0, 1, 1,
-2.590772, 2.219213, -0.2740421, 1, 0, 0, 1, 1,
-2.555265, -1.17016, -3.054361, 0, 0, 0, 1, 1,
-2.410249, -0.08407526, -0.811745, 0, 0, 0, 1, 1,
-2.338123, 0.2288087, 1.240967, 0, 0, 0, 1, 1,
-2.333416, -0.8893301, 0.02736535, 0, 0, 0, 1, 1,
-2.29157, -0.2412686, -1.054271, 0, 0, 0, 1, 1,
-2.284314, -0.1905941, -1.131313, 0, 0, 0, 1, 1,
-2.279732, 0.164098, -0.7390651, 0, 0, 0, 1, 1,
-2.250513, 1.109189, -0.1457079, 1, 1, 1, 1, 1,
-2.234019, 1.020672, 1.236007, 1, 1, 1, 1, 1,
-2.231882, -0.9776781, -2.247977, 1, 1, 1, 1, 1,
-2.227924, 0.3172536, -0.0361772, 1, 1, 1, 1, 1,
-2.125747, 1.009096, -3.681981, 1, 1, 1, 1, 1,
-2.122959, 1.143335, -2.108196, 1, 1, 1, 1, 1,
-2.117169, -1.811524, -3.597023, 1, 1, 1, 1, 1,
-2.08715, 1.160131, -0.2463441, 1, 1, 1, 1, 1,
-2.062489, -0.9961569, -0.5595524, 1, 1, 1, 1, 1,
-2.041412, -0.6255032, -0.9524741, 1, 1, 1, 1, 1,
-2.035702, 0.2339063, -1.660581, 1, 1, 1, 1, 1,
-1.991507, -1.216072, -1.042694, 1, 1, 1, 1, 1,
-1.975126, -1.841926, -3.889174, 1, 1, 1, 1, 1,
-1.926099, 0.1651921, -1.517151, 1, 1, 1, 1, 1,
-1.911136, 0.378493, -1.853109, 1, 1, 1, 1, 1,
-1.899976, -1.306606, 0.0258939, 0, 0, 1, 1, 1,
-1.892137, -0.9727333, -2.57339, 1, 0, 0, 1, 1,
-1.889342, 0.4917451, -0.6172714, 1, 0, 0, 1, 1,
-1.88795, 0.2105325, -0.6841005, 1, 0, 0, 1, 1,
-1.870013, 0.1350716, -1.882846, 1, 0, 0, 1, 1,
-1.865763, -0.6657495, -3.256302, 1, 0, 0, 1, 1,
-1.856151, -0.2545425, -1.764077, 0, 0, 0, 1, 1,
-1.822892, 0.9696109, -0.4074827, 0, 0, 0, 1, 1,
-1.815752, 0.4905021, -0.2398721, 0, 0, 0, 1, 1,
-1.806031, 0.0513992, -0.5601383, 0, 0, 0, 1, 1,
-1.796097, 0.03260202, -2.144089, 0, 0, 0, 1, 1,
-1.788622, -0.6860418, -4.228084, 0, 0, 0, 1, 1,
-1.771188, -0.1551731, -3.49332, 0, 0, 0, 1, 1,
-1.76763, -1.536776, -3.828332, 1, 1, 1, 1, 1,
-1.760886, -0.2176725, -1.985195, 1, 1, 1, 1, 1,
-1.755799, -0.5794371, -2.806865, 1, 1, 1, 1, 1,
-1.742613, -1.965684, -4.158998, 1, 1, 1, 1, 1,
-1.732582, 0.1547023, -1.823729, 1, 1, 1, 1, 1,
-1.732043, 1.264375, -2.658788, 1, 1, 1, 1, 1,
-1.728818, -1.023305, -1.764239, 1, 1, 1, 1, 1,
-1.726888, -0.5614614, -2.127146, 1, 1, 1, 1, 1,
-1.721935, 1.373012, -1.545339, 1, 1, 1, 1, 1,
-1.716537, 0.7934854, -0.4036065, 1, 1, 1, 1, 1,
-1.714949, 0.7855402, -1.386499, 1, 1, 1, 1, 1,
-1.712204, -0.4926693, -1.992556, 1, 1, 1, 1, 1,
-1.706036, -0.2026795, -2.400939, 1, 1, 1, 1, 1,
-1.692737, -0.4661982, -2.94229, 1, 1, 1, 1, 1,
-1.681786, -0.7767274, -0.3255758, 1, 1, 1, 1, 1,
-1.661464, -0.2162318, -1.478296, 0, 0, 1, 1, 1,
-1.624708, -0.2617601, -1.262473, 1, 0, 0, 1, 1,
-1.620604, 0.6325465, -0.4470032, 1, 0, 0, 1, 1,
-1.613266, 0.1039504, 0.5294099, 1, 0, 0, 1, 1,
-1.606173, 0.952965, -2.905312, 1, 0, 0, 1, 1,
-1.605041, 2.230631, -0.5883844, 1, 0, 0, 1, 1,
-1.599688, -0.6354653, -0.8715748, 0, 0, 0, 1, 1,
-1.598554, -0.6627943, -0.6853149, 0, 0, 0, 1, 1,
-1.580745, -0.9185389, -1.036809, 0, 0, 0, 1, 1,
-1.579473, -0.08615427, -1.990456, 0, 0, 0, 1, 1,
-1.567901, 0.2063128, -1.244145, 0, 0, 0, 1, 1,
-1.559443, 1.286052, -0.7337204, 0, 0, 0, 1, 1,
-1.557821, -1.432825, -2.853644, 0, 0, 0, 1, 1,
-1.554938, 0.6063008, -1.241541, 1, 1, 1, 1, 1,
-1.552495, 0.9630091, -1.132162, 1, 1, 1, 1, 1,
-1.534145, 0.1609388, -1.75788, 1, 1, 1, 1, 1,
-1.520659, -1.377533, -2.83068, 1, 1, 1, 1, 1,
-1.515953, 1.153076, -0.069725, 1, 1, 1, 1, 1,
-1.505372, -0.5148954, -1.628254, 1, 1, 1, 1, 1,
-1.492824, 0.1218392, -0.4899021, 1, 1, 1, 1, 1,
-1.48136, -0.5633129, -1.809477, 1, 1, 1, 1, 1,
-1.473644, 0.8117501, -1.373056, 1, 1, 1, 1, 1,
-1.4605, 1.424391, -1.313382, 1, 1, 1, 1, 1,
-1.452558, 1.462626, -0.854889, 1, 1, 1, 1, 1,
-1.450052, 2.323946, 0.115287, 1, 1, 1, 1, 1,
-1.445637, -1.178436, -1.402182, 1, 1, 1, 1, 1,
-1.434841, -0.2052404, -0.9468104, 1, 1, 1, 1, 1,
-1.423183, -0.5625282, -0.7367782, 1, 1, 1, 1, 1,
-1.422563, 0.06347524, -0.9977766, 0, 0, 1, 1, 1,
-1.420933, 0.3187943, -2.783563, 1, 0, 0, 1, 1,
-1.420381, -1.290236, -3.931809, 1, 0, 0, 1, 1,
-1.419162, -1.150596, -2.966315, 1, 0, 0, 1, 1,
-1.409621, 1.89644, 1.474999, 1, 0, 0, 1, 1,
-1.405457, 0.5032931, 0.1013182, 1, 0, 0, 1, 1,
-1.404324, -0.09789637, -2.231964, 0, 0, 0, 1, 1,
-1.400688, -0.6437322, -2.02794, 0, 0, 0, 1, 1,
-1.380131, -0.6547988, -3.222024, 0, 0, 0, 1, 1,
-1.379427, -0.284488, -1.271333, 0, 0, 0, 1, 1,
-1.378717, 0.3222955, -2.280206, 0, 0, 0, 1, 1,
-1.372288, -0.6443425, -1.76591, 0, 0, 0, 1, 1,
-1.364426, -0.9494962, -2.486111, 0, 0, 0, 1, 1,
-1.359882, 0.2142701, -2.299024, 1, 1, 1, 1, 1,
-1.346077, -1.520317, -2.303524, 1, 1, 1, 1, 1,
-1.337187, -1.576073, -0.4036858, 1, 1, 1, 1, 1,
-1.334704, 1.85893, 0.06542963, 1, 1, 1, 1, 1,
-1.322245, -0.06080292, -0.9806547, 1, 1, 1, 1, 1,
-1.32168, 0.6529152, -2.669605, 1, 1, 1, 1, 1,
-1.320527, -1.247213, -0.6898832, 1, 1, 1, 1, 1,
-1.320007, 1.055159, -1.345581, 1, 1, 1, 1, 1,
-1.310308, 1.772906, 0.1976202, 1, 1, 1, 1, 1,
-1.304943, -0.1896639, -0.8850081, 1, 1, 1, 1, 1,
-1.299538, 0.9085371, -2.354593, 1, 1, 1, 1, 1,
-1.280817, 1.00465, -0.5160987, 1, 1, 1, 1, 1,
-1.280202, 1.644499, -1.16188, 1, 1, 1, 1, 1,
-1.277775, 1.147415, 0.07801309, 1, 1, 1, 1, 1,
-1.272653, 0.8387923, -0.6517479, 1, 1, 1, 1, 1,
-1.266445, 0.6474012, -1.676083, 0, 0, 1, 1, 1,
-1.2662, -1.036234, -1.656586, 1, 0, 0, 1, 1,
-1.257316, 1.60913, -0.3099083, 1, 0, 0, 1, 1,
-1.247335, 0.8759491, -0.3681636, 1, 0, 0, 1, 1,
-1.243322, 0.1353928, -1.821232, 1, 0, 0, 1, 1,
-1.229339, -1.203407, -2.474086, 1, 0, 0, 1, 1,
-1.225835, 1.026299, -0.3958766, 0, 0, 0, 1, 1,
-1.224352, -0.8466927, 0.241649, 0, 0, 0, 1, 1,
-1.22173, -1.200166, -2.96058, 0, 0, 0, 1, 1,
-1.191274, -0.04272186, -0.5125086, 0, 0, 0, 1, 1,
-1.182809, 0.6602371, -1.500967, 0, 0, 0, 1, 1,
-1.167899, -1.93322, -0.9292133, 0, 0, 0, 1, 1,
-1.167553, 0.4813603, -0.8611553, 0, 0, 0, 1, 1,
-1.16723, -0.5717152, -2.595839, 1, 1, 1, 1, 1,
-1.164738, 0.3188967, -1.213892, 1, 1, 1, 1, 1,
-1.158185, 0.6113284, -1.496538, 1, 1, 1, 1, 1,
-1.15188, -1.6844, -2.091607, 1, 1, 1, 1, 1,
-1.151758, -0.1432083, -2.429097, 1, 1, 1, 1, 1,
-1.145598, 3.151928, 0.07121611, 1, 1, 1, 1, 1,
-1.142275, -0.8922783, -2.237493, 1, 1, 1, 1, 1,
-1.138628, 1.271297, -2.617498, 1, 1, 1, 1, 1,
-1.136497, -0.6831256, -3.275642, 1, 1, 1, 1, 1,
-1.134061, -1.362223, -0.4305847, 1, 1, 1, 1, 1,
-1.132058, 2.911119, -1.065642, 1, 1, 1, 1, 1,
-1.130987, -0.9567916, -3.078761, 1, 1, 1, 1, 1,
-1.129564, -0.3784435, -1.001835, 1, 1, 1, 1, 1,
-1.128491, 1.199077, -0.6144589, 1, 1, 1, 1, 1,
-1.128152, -0.6704422, -1.479987, 1, 1, 1, 1, 1,
-1.126644, -0.6341622, -1.686437, 0, 0, 1, 1, 1,
-1.12519, -0.6986762, -0.7173969, 1, 0, 0, 1, 1,
-1.123775, -0.2655525, -2.371005, 1, 0, 0, 1, 1,
-1.103493, 0.7902684, -1.12107, 1, 0, 0, 1, 1,
-1.099549, -1.15889, -2.343015, 1, 0, 0, 1, 1,
-1.086022, 0.2335015, -0.013491, 1, 0, 0, 1, 1,
-1.083659, -0.1826199, -3.483426, 0, 0, 0, 1, 1,
-1.076407, -0.2340441, -1.063335, 0, 0, 0, 1, 1,
-1.074831, 1.007729, -0.2061568, 0, 0, 0, 1, 1,
-1.070206, 0.5987379, -2.508374, 0, 0, 0, 1, 1,
-1.064401, 0.3302154, -1.318324, 0, 0, 0, 1, 1,
-1.063441, 0.02603014, -0.8269212, 0, 0, 0, 1, 1,
-1.061734, -0.6060261, -4.364737, 0, 0, 0, 1, 1,
-1.060549, 1.02812, 0.2477346, 1, 1, 1, 1, 1,
-1.054291, 1.743603, 1.207439, 1, 1, 1, 1, 1,
-1.04619, 1.831554, -0.1612518, 1, 1, 1, 1, 1,
-1.044588, 0.02080191, -3.811596, 1, 1, 1, 1, 1,
-1.043211, 0.4583828, -2.365098, 1, 1, 1, 1, 1,
-1.040144, -0.1903797, -2.206558, 1, 1, 1, 1, 1,
-1.03889, -0.782652, -1.322996, 1, 1, 1, 1, 1,
-1.037658, 0.2024566, -2.64377, 1, 1, 1, 1, 1,
-1.034469, 1.603353, -1.911308, 1, 1, 1, 1, 1,
-1.034208, -2.368674, -2.050945, 1, 1, 1, 1, 1,
-1.030882, 0.4465979, -1.623697, 1, 1, 1, 1, 1,
-1.029868, -0.2131285, -1.204906, 1, 1, 1, 1, 1,
-1.029855, 0.173031, -4.068337, 1, 1, 1, 1, 1,
-1.027154, 0.2672926, 0.9231902, 1, 1, 1, 1, 1,
-1.026329, 0.8994715, -1.055895, 1, 1, 1, 1, 1,
-1.017628, -0.06404524, -1.113569, 0, 0, 1, 1, 1,
-1.00877, 3.368861, -1.590308, 1, 0, 0, 1, 1,
-1.008721, 0.8100497, -2.033571, 1, 0, 0, 1, 1,
-1.001053, -0.528289, -1.545289, 1, 0, 0, 1, 1,
-0.9984745, 0.6102668, 0.2190082, 1, 0, 0, 1, 1,
-0.9868149, 0.07860053, -0.671686, 1, 0, 0, 1, 1,
-0.9866843, -2.719596, -4.606186, 0, 0, 0, 1, 1,
-0.9852288, -0.6134102, -3.032631, 0, 0, 0, 1, 1,
-0.9830693, -0.6131403, -1.539125, 0, 0, 0, 1, 1,
-0.9806573, 0.2505189, -2.32559, 0, 0, 0, 1, 1,
-0.9804768, 0.7300385, -2.531718, 0, 0, 0, 1, 1,
-0.9790419, 1.125084, -1.223169, 0, 0, 0, 1, 1,
-0.9787052, 0.6520097, 0.5323029, 0, 0, 0, 1, 1,
-0.9746875, 0.5570288, -2.233312, 1, 1, 1, 1, 1,
-0.9652359, 1.623989, -0.279216, 1, 1, 1, 1, 1,
-0.9578338, 1.495647, -0.6557193, 1, 1, 1, 1, 1,
-0.9562445, -1.081674, -2.493335, 1, 1, 1, 1, 1,
-0.9554424, 0.2920465, 0.01542678, 1, 1, 1, 1, 1,
-0.9489971, -1.12773, -2.364353, 1, 1, 1, 1, 1,
-0.9433774, 1.60181, -0.8898962, 1, 1, 1, 1, 1,
-0.9429674, 0.9544598, 0.465526, 1, 1, 1, 1, 1,
-0.9404709, 1.617392, -0.7893779, 1, 1, 1, 1, 1,
-0.9382993, -1.032775, -3.899976, 1, 1, 1, 1, 1,
-0.9370137, -0.7695441, -0.9540884, 1, 1, 1, 1, 1,
-0.9364896, 2.015039, -0.5327157, 1, 1, 1, 1, 1,
-0.9286606, -2.214571, -3.113688, 1, 1, 1, 1, 1,
-0.9072227, -0.7565781, -2.398243, 1, 1, 1, 1, 1,
-0.9005435, 0.182822, -0.9502848, 1, 1, 1, 1, 1,
-0.8966799, 0.5936207, -1.142153, 0, 0, 1, 1, 1,
-0.8916678, 0.4905508, -0.4150434, 1, 0, 0, 1, 1,
-0.8915262, 0.812828, -2.264768, 1, 0, 0, 1, 1,
-0.8915004, 1.861515, -0.4596454, 1, 0, 0, 1, 1,
-0.8888527, -0.03186769, -2.141669, 1, 0, 0, 1, 1,
-0.8804742, 0.5099707, 0.435292, 1, 0, 0, 1, 1,
-0.8774866, 0.8927076, -0.4042188, 0, 0, 0, 1, 1,
-0.8761072, 0.18189, -0.3011474, 0, 0, 0, 1, 1,
-0.8718636, -0.4028302, -0.9633536, 0, 0, 0, 1, 1,
-0.8615085, 0.3582723, -2.175327, 0, 0, 0, 1, 1,
-0.8534064, -1.736506, -1.498042, 0, 0, 0, 1, 1,
-0.8520525, -0.8147495, -1.190291, 0, 0, 0, 1, 1,
-0.8445657, 0.7569331, -1.24526, 0, 0, 0, 1, 1,
-0.8399212, -1.105175, -2.808009, 1, 1, 1, 1, 1,
-0.8357464, 0.2153178, -2.016865, 1, 1, 1, 1, 1,
-0.8337357, 0.7124795, -0.7964969, 1, 1, 1, 1, 1,
-0.8324382, 0.8760116, -1.84317, 1, 1, 1, 1, 1,
-0.8283962, -1.754035, -1.909554, 1, 1, 1, 1, 1,
-0.8177395, -0.1089701, -1.364794, 1, 1, 1, 1, 1,
-0.813644, -0.5906203, -1.864833, 1, 1, 1, 1, 1,
-0.812723, 1.036107, -2.856688, 1, 1, 1, 1, 1,
-0.8096179, 0.146208, -1.526383, 1, 1, 1, 1, 1,
-0.8050811, -1.006359, -4.298715, 1, 1, 1, 1, 1,
-0.7995554, -1.018253, -0.04642687, 1, 1, 1, 1, 1,
-0.7992353, -0.6593164, -4.032099, 1, 1, 1, 1, 1,
-0.7952301, 0.7012716, -0.8269869, 1, 1, 1, 1, 1,
-0.7926321, -0.0045331, -1.265795, 1, 1, 1, 1, 1,
-0.7876595, -1.220461, -2.377376, 1, 1, 1, 1, 1,
-0.7848972, 0.0653965, -1.579423, 0, 0, 1, 1, 1,
-0.7820595, 0.00341933, -1.510311, 1, 0, 0, 1, 1,
-0.7814125, 2.487596, -1.128724, 1, 0, 0, 1, 1,
-0.7807546, 1.140121, 1.389553, 1, 0, 0, 1, 1,
-0.7785368, -0.2974521, -2.329388, 1, 0, 0, 1, 1,
-0.7783526, 2.8473, 0.3638531, 1, 0, 0, 1, 1,
-0.7776189, -0.8231375, -3.204952, 0, 0, 0, 1, 1,
-0.7662429, -0.9793229, -4.138145, 0, 0, 0, 1, 1,
-0.7582756, 0.6547675, -1.601309, 0, 0, 0, 1, 1,
-0.755671, 0.5798001, -1.428872, 0, 0, 0, 1, 1,
-0.7517254, 0.2827491, -0.5352064, 0, 0, 0, 1, 1,
-0.7441642, 0.6937078, 0.5031846, 0, 0, 0, 1, 1,
-0.7436797, -1.710381, -2.963952, 0, 0, 0, 1, 1,
-0.7335551, 2.320519, 0.5351245, 1, 1, 1, 1, 1,
-0.7310185, -0.9184361, -2.01563, 1, 1, 1, 1, 1,
-0.7223966, 0.586419, -1.884944, 1, 1, 1, 1, 1,
-0.7221246, -0.9850073, -3.838914, 1, 1, 1, 1, 1,
-0.7203406, 0.5036017, -1.608005, 1, 1, 1, 1, 1,
-0.719583, 0.8128831, -1.334309, 1, 1, 1, 1, 1,
-0.7180772, -1.822003, -3.632976, 1, 1, 1, 1, 1,
-0.7159908, -0.1421996, 0.8411832, 1, 1, 1, 1, 1,
-0.7149321, -0.07506161, -2.368976, 1, 1, 1, 1, 1,
-0.7130183, -0.1820855, -1.26236, 1, 1, 1, 1, 1,
-0.7117794, -2.36423, -2.507811, 1, 1, 1, 1, 1,
-0.7115612, -1.204816, -2.905213, 1, 1, 1, 1, 1,
-0.7095066, -0.1348899, -2.387237, 1, 1, 1, 1, 1,
-0.7090707, -0.7237915, -2.063804, 1, 1, 1, 1, 1,
-0.7070284, 0.9751585, -0.7695593, 1, 1, 1, 1, 1,
-0.7030619, -1.015529, -2.324717, 0, 0, 1, 1, 1,
-0.6997169, -0.1830756, -1.425222, 1, 0, 0, 1, 1,
-0.6976432, -1.012035, -1.465744, 1, 0, 0, 1, 1,
-0.6976371, -0.1847549, -2.175657, 1, 0, 0, 1, 1,
-0.694707, 1.72533, -0.7450195, 1, 0, 0, 1, 1,
-0.6918419, 1.415948, -1.18069, 1, 0, 0, 1, 1,
-0.6894739, -0.2198682, -0.6529724, 0, 0, 0, 1, 1,
-0.6876289, -0.1465777, -2.325657, 0, 0, 0, 1, 1,
-0.6870862, -0.8826092, -2.284728, 0, 0, 0, 1, 1,
-0.6856005, 1.628717, 1.06753, 0, 0, 0, 1, 1,
-0.6819579, 1.230757, -1.088509, 0, 0, 0, 1, 1,
-0.6808218, 1.155632, 1.032458, 0, 0, 0, 1, 1,
-0.6746014, 0.4727, -0.2095595, 0, 0, 0, 1, 1,
-0.6696525, -0.1369933, -0.4553658, 1, 1, 1, 1, 1,
-0.6687868, 1.053321, 0.327097, 1, 1, 1, 1, 1,
-0.6613126, 0.2899264, -4.231, 1, 1, 1, 1, 1,
-0.6603082, -0.6666, -1.845317, 1, 1, 1, 1, 1,
-0.6546416, -1.28335, -1.435916, 1, 1, 1, 1, 1,
-0.6488078, 1.475778, 1.466934, 1, 1, 1, 1, 1,
-0.6463517, 0.618484, -0.1341852, 1, 1, 1, 1, 1,
-0.6387553, -0.1650963, -2.014109, 1, 1, 1, 1, 1,
-0.6363071, -0.3540384, -1.995604, 1, 1, 1, 1, 1,
-0.6316845, 0.316563, -1.977733, 1, 1, 1, 1, 1,
-0.6306094, -0.9092436, -2.184236, 1, 1, 1, 1, 1,
-0.6303607, -0.1267612, -0.6108505, 1, 1, 1, 1, 1,
-0.6293439, 0.3807046, 1.425048, 1, 1, 1, 1, 1,
-0.6286561, -0.2145101, -2.485581, 1, 1, 1, 1, 1,
-0.6267448, 0.3832804, -2.376654, 1, 1, 1, 1, 1,
-0.6247723, -0.3296593, -2.348473, 0, 0, 1, 1, 1,
-0.6230528, 1.352221, -3.208883, 1, 0, 0, 1, 1,
-0.6214569, 0.05376813, -1.749053, 1, 0, 0, 1, 1,
-0.6073207, -0.01180165, -1.545793, 1, 0, 0, 1, 1,
-0.6046783, -0.7267558, -3.881224, 1, 0, 0, 1, 1,
-0.5954192, -1.129656, -5.272708, 1, 0, 0, 1, 1,
-0.5927715, -0.405929, -2.982916, 0, 0, 0, 1, 1,
-0.5920402, -0.008431535, -3.333491, 0, 0, 0, 1, 1,
-0.5915164, -1.085955, -2.358032, 0, 0, 0, 1, 1,
-0.5912399, -0.3476177, 0.0145848, 0, 0, 0, 1, 1,
-0.5879913, -1.444682, -1.67963, 0, 0, 0, 1, 1,
-0.5877544, -0.0754825, -1.243556, 0, 0, 0, 1, 1,
-0.5867478, -0.2557577, -3.213871, 0, 0, 0, 1, 1,
-0.5852339, -0.2497238, -0.7122464, 1, 1, 1, 1, 1,
-0.5842745, 3.093209, 1.031834, 1, 1, 1, 1, 1,
-0.5817541, -0.8731163, -2.212348, 1, 1, 1, 1, 1,
-0.581237, -1.531059, -4.301476, 1, 1, 1, 1, 1,
-0.5736793, -0.2591893, -1.344272, 1, 1, 1, 1, 1,
-0.5719615, 0.5029947, -1.519811, 1, 1, 1, 1, 1,
-0.5674785, 0.06274033, -0.226515, 1, 1, 1, 1, 1,
-0.5655009, -0.6219844, -3.436023, 1, 1, 1, 1, 1,
-0.561775, 1.839791, 0.7038432, 1, 1, 1, 1, 1,
-0.5545692, 0.4487311, -1.49189, 1, 1, 1, 1, 1,
-0.5526431, 0.6157466, -1.955302, 1, 1, 1, 1, 1,
-0.5514488, -0.6460278, -3.98885, 1, 1, 1, 1, 1,
-0.5443805, 0.03670635, -0.3102309, 1, 1, 1, 1, 1,
-0.542619, -0.3637516, -1.981301, 1, 1, 1, 1, 1,
-0.5390652, -0.3439289, -2.196721, 1, 1, 1, 1, 1,
-0.5373774, -1.392227, -1.751889, 0, 0, 1, 1, 1,
-0.5351796, 0.212126, -1.642192, 1, 0, 0, 1, 1,
-0.5320554, -1.493996, -1.853453, 1, 0, 0, 1, 1,
-0.5289641, 0.6795156, -1.974355, 1, 0, 0, 1, 1,
-0.5287599, -0.2329719, -1.278263, 1, 0, 0, 1, 1,
-0.5272079, -0.9346047, -3.27727, 1, 0, 0, 1, 1,
-0.5266936, 1.218565, -0.1076252, 0, 0, 0, 1, 1,
-0.5214007, 0.8029695, 0.5175478, 0, 0, 0, 1, 1,
-0.5200094, 0.9914492, -0.7791637, 0, 0, 0, 1, 1,
-0.518611, -0.2712026, -1.296988, 0, 0, 0, 1, 1,
-0.5035602, -1.324611, -4.070234, 0, 0, 0, 1, 1,
-0.4974263, 0.4992503, -0.6524216, 0, 0, 0, 1, 1,
-0.4971735, 0.08689274, -0.4822913, 0, 0, 0, 1, 1,
-0.4919273, -1.100331, -2.899765, 1, 1, 1, 1, 1,
-0.4910306, 0.8619043, -0.1393401, 1, 1, 1, 1, 1,
-0.4908969, -0.8569158, -1.0695, 1, 1, 1, 1, 1,
-0.4887933, 1.275546, 0.6301281, 1, 1, 1, 1, 1,
-0.4848555, 3.016316, -1.003664, 1, 1, 1, 1, 1,
-0.4810567, -0.5780007, -2.129335, 1, 1, 1, 1, 1,
-0.4737707, -0.7232721, -2.935087, 1, 1, 1, 1, 1,
-0.473046, -1.166442, -2.95594, 1, 1, 1, 1, 1,
-0.4729869, -0.1446009, -3.869476, 1, 1, 1, 1, 1,
-0.471309, -0.3128019, -1.111049, 1, 1, 1, 1, 1,
-0.4711116, 0.9281668, -0.6095043, 1, 1, 1, 1, 1,
-0.4647991, -1.064245, -3.157752, 1, 1, 1, 1, 1,
-0.4600963, -0.4272549, -1.380677, 1, 1, 1, 1, 1,
-0.4598506, -0.4794087, -1.381246, 1, 1, 1, 1, 1,
-0.4597149, 1.574397, 0.2846923, 1, 1, 1, 1, 1,
-0.4594432, 0.758536, -1.107854, 0, 0, 1, 1, 1,
-0.457487, -0.3201305, -2.358037, 1, 0, 0, 1, 1,
-0.4573449, -0.2506489, -2.892369, 1, 0, 0, 1, 1,
-0.4561769, -0.0197415, -2.146211, 1, 0, 0, 1, 1,
-0.455888, 0.08297668, -0.01473503, 1, 0, 0, 1, 1,
-0.4544018, -0.3879115, -2.276704, 1, 0, 0, 1, 1,
-0.4531118, -0.6415354, -2.752218, 0, 0, 0, 1, 1,
-0.4522576, -0.8769169, -1.451526, 0, 0, 0, 1, 1,
-0.4491268, -0.8318833, -1.313109, 0, 0, 0, 1, 1,
-0.4487113, 1.04677, -0.0939994, 0, 0, 0, 1, 1,
-0.44853, -2.331129, -2.160179, 0, 0, 0, 1, 1,
-0.4461457, -0.2771249, -1.522689, 0, 0, 0, 1, 1,
-0.4388429, -1.223875, -2.108656, 0, 0, 0, 1, 1,
-0.4382152, -1.628516, -1.966364, 1, 1, 1, 1, 1,
-0.4348444, -0.1119847, -3.727093, 1, 1, 1, 1, 1,
-0.4280728, 1.636294, 0.8807547, 1, 1, 1, 1, 1,
-0.4267698, 1.728493, 0.2470423, 1, 1, 1, 1, 1,
-0.4260894, -0.8431925, -1.955802, 1, 1, 1, 1, 1,
-0.4182805, 1.281442, 0.4871083, 1, 1, 1, 1, 1,
-0.4175405, -1.009586, -1.137784, 1, 1, 1, 1, 1,
-0.4160299, 1.051877, -0.7248915, 1, 1, 1, 1, 1,
-0.4138451, 0.52382, -1.859248, 1, 1, 1, 1, 1,
-0.4083701, -0.3063491, -2.155909, 1, 1, 1, 1, 1,
-0.4069083, 0.6638071, 0.8059965, 1, 1, 1, 1, 1,
-0.4018832, 1.014402, 0.7694938, 1, 1, 1, 1, 1,
-0.4012886, -0.1977164, -1.089382, 1, 1, 1, 1, 1,
-0.399748, -1.852344, -1.764942, 1, 1, 1, 1, 1,
-0.3955432, 1.314803, 0.3316785, 1, 1, 1, 1, 1,
-0.3890998, -1.667826, -2.003799, 0, 0, 1, 1, 1,
-0.3878123, 0.4085277, -1.088341, 1, 0, 0, 1, 1,
-0.3869953, -0.3287059, -3.391991, 1, 0, 0, 1, 1,
-0.3865981, -0.7237052, -4.731743, 1, 0, 0, 1, 1,
-0.3820382, -0.9111805, -2.510497, 1, 0, 0, 1, 1,
-0.3819205, -0.7773903, -2.546557, 1, 0, 0, 1, 1,
-0.3772092, 0.5938187, 0.1156166, 0, 0, 0, 1, 1,
-0.3724269, -0.6360469, -3.092146, 0, 0, 0, 1, 1,
-0.368981, 0.9614621, 0.7320425, 0, 0, 0, 1, 1,
-0.3670286, 1.518377, -0.8408882, 0, 0, 0, 1, 1,
-0.3633237, 0.6283089, -1.592097, 0, 0, 0, 1, 1,
-0.3603634, -1.002473, -3.808057, 0, 0, 0, 1, 1,
-0.3526291, 0.9436425, 1.501069, 0, 0, 0, 1, 1,
-0.3498832, 0.7372472, 0.6162607, 1, 1, 1, 1, 1,
-0.3492761, -1.407375, -1.304666, 1, 1, 1, 1, 1,
-0.3453929, -0.07257072, -1.01682, 1, 1, 1, 1, 1,
-0.3446131, -0.07933819, -1.026959, 1, 1, 1, 1, 1,
-0.3445545, -1.047495, -5.042763, 1, 1, 1, 1, 1,
-0.3399217, 0.1260023, -3.007514, 1, 1, 1, 1, 1,
-0.3377748, 0.1314126, -1.692616, 1, 1, 1, 1, 1,
-0.3376213, 1.802256, -1.387104, 1, 1, 1, 1, 1,
-0.336803, 0.6766275, -0.5639185, 1, 1, 1, 1, 1,
-0.3309066, 0.6475309, 1.318955, 1, 1, 1, 1, 1,
-0.3285584, -1.786304, -1.864591, 1, 1, 1, 1, 1,
-0.3284414, -0.8260542, -3.919346, 1, 1, 1, 1, 1,
-0.3235008, -1.395012, -2.487908, 1, 1, 1, 1, 1,
-0.3183861, -1.036773, -3.607118, 1, 1, 1, 1, 1,
-0.312772, 0.2841994, -0.2043762, 1, 1, 1, 1, 1,
-0.309356, -1.157028, -3.040343, 0, 0, 1, 1, 1,
-0.3069724, 0.8394425, 0.006439403, 1, 0, 0, 1, 1,
-0.3064038, 1.040158, -1.199599, 1, 0, 0, 1, 1,
-0.2997659, -1.114502, -2.999368, 1, 0, 0, 1, 1,
-0.2995375, 0.4168938, -2.080347, 1, 0, 0, 1, 1,
-0.2993062, -1.388556, -3.085889, 1, 0, 0, 1, 1,
-0.2985615, 0.440141, -1.29795, 0, 0, 0, 1, 1,
-0.2974915, -0.2704682, -1.88056, 0, 0, 0, 1, 1,
-0.2955237, -0.9366605, -3.680291, 0, 0, 0, 1, 1,
-0.2953059, -1.021084, -3.966571, 0, 0, 0, 1, 1,
-0.2950446, 0.6015662, -0.7741045, 0, 0, 0, 1, 1,
-0.2934028, 0.5703278, -1.841285, 0, 0, 0, 1, 1,
-0.2917989, 0.5015616, -0.9190323, 0, 0, 0, 1, 1,
-0.2916606, 0.4533644, 0.6299326, 1, 1, 1, 1, 1,
-0.2907141, 1.765949, -0.4732814, 1, 1, 1, 1, 1,
-0.2892329, -0.3452241, -2.276081, 1, 1, 1, 1, 1,
-0.2891719, 0.2836491, -2.377717, 1, 1, 1, 1, 1,
-0.2883068, -0.5563381, -3.873508, 1, 1, 1, 1, 1,
-0.2867877, -0.1961843, -3.234401, 1, 1, 1, 1, 1,
-0.2852222, -0.04978137, -2.515611, 1, 1, 1, 1, 1,
-0.28511, -0.590059, -2.275077, 1, 1, 1, 1, 1,
-0.2839223, 1.276656, -0.5199085, 1, 1, 1, 1, 1,
-0.2762913, -0.6985818, -4.246952, 1, 1, 1, 1, 1,
-0.2754957, 0.4719173, 0.5834844, 1, 1, 1, 1, 1,
-0.2743897, 0.4531711, 0.03140027, 1, 1, 1, 1, 1,
-0.2682416, -1.744336, -3.51162, 1, 1, 1, 1, 1,
-0.2638684, -0.9535838, -3.563322, 1, 1, 1, 1, 1,
-0.2598803, -0.5456086, -1.816862, 1, 1, 1, 1, 1,
-0.2579762, -2.255768, -3.26617, 0, 0, 1, 1, 1,
-0.2567913, 0.3252931, -0.8409132, 1, 0, 0, 1, 1,
-0.255863, 0.3686427, -1.664281, 1, 0, 0, 1, 1,
-0.2528648, -2.36203, -2.720181, 1, 0, 0, 1, 1,
-0.2523673, -0.8631863, -1.827157, 1, 0, 0, 1, 1,
-0.2493809, 0.2720754, -0.3175554, 1, 0, 0, 1, 1,
-0.2479324, 0.850075, 0.5896313, 0, 0, 0, 1, 1,
-0.2404318, 0.6556901, -0.3751419, 0, 0, 0, 1, 1,
-0.2393831, -0.8586359, -2.025826, 0, 0, 0, 1, 1,
-0.2379988, 0.9124231, 0.6340855, 0, 0, 0, 1, 1,
-0.2361135, 1.986758, -2.043141, 0, 0, 0, 1, 1,
-0.2339136, 0.5497614, -1.793776, 0, 0, 0, 1, 1,
-0.2320922, -1.244009, -2.687304, 0, 0, 0, 1, 1,
-0.2313406, -0.07751565, -2.267767, 1, 1, 1, 1, 1,
-0.2280995, -1.758265, -2.862989, 1, 1, 1, 1, 1,
-0.2271142, 0.2084017, -0.4576675, 1, 1, 1, 1, 1,
-0.2269967, 0.06397877, -1.588958, 1, 1, 1, 1, 1,
-0.2244934, -1.791897, -2.780567, 1, 1, 1, 1, 1,
-0.2198664, 1.407195, -0.513522, 1, 1, 1, 1, 1,
-0.2167208, -1.349598, -3.013364, 1, 1, 1, 1, 1,
-0.2143698, 0.5496176, 0.6458141, 1, 1, 1, 1, 1,
-0.2132173, 0.094265, -0.9495975, 1, 1, 1, 1, 1,
-0.2090173, 1.494439, 1.729503, 1, 1, 1, 1, 1,
-0.2078963, 0.1335997, -0.2966188, 1, 1, 1, 1, 1,
-0.2058834, 0.5375576, 1.792705, 1, 1, 1, 1, 1,
-0.201206, -0.3222458, -2.987955, 1, 1, 1, 1, 1,
-0.1984963, -0.7017037, -1.956015, 1, 1, 1, 1, 1,
-0.1966715, 2.395853, -0.3936776, 1, 1, 1, 1, 1,
-0.1927645, 0.9652722, 0.513052, 0, 0, 1, 1, 1,
-0.1894034, 0.5472466, 0.1908354, 1, 0, 0, 1, 1,
-0.183249, 0.6179091, 0.3713741, 1, 0, 0, 1, 1,
-0.1800589, -0.4497237, -2.006453, 1, 0, 0, 1, 1,
-0.1788152, 1.95947, -0.8397924, 1, 0, 0, 1, 1,
-0.177829, -1.736507, -3.274827, 1, 0, 0, 1, 1,
-0.1764554, 2.148847, -0.5051689, 0, 0, 0, 1, 1,
-0.1755913, -1.009994, -3.109159, 0, 0, 0, 1, 1,
-0.1742992, 1.032723, -0.757478, 0, 0, 0, 1, 1,
-0.1701066, 2.130664, -0.2114716, 0, 0, 0, 1, 1,
-0.1641383, 1.327806, -0.4661044, 0, 0, 0, 1, 1,
-0.1607026, -0.671237, -2.628417, 0, 0, 0, 1, 1,
-0.1542852, -0.3282158, -0.4415414, 0, 0, 0, 1, 1,
-0.1514715, 1.066159, -0.2961951, 1, 1, 1, 1, 1,
-0.145694, 0.3040341, -0.3043883, 1, 1, 1, 1, 1,
-0.1432909, 0.1229228, -1.70759, 1, 1, 1, 1, 1,
-0.1396288, 0.1675121, -1.962782, 1, 1, 1, 1, 1,
-0.1305042, -0.1649798, -2.99182, 1, 1, 1, 1, 1,
-0.1297204, 0.2926868, -1.026237, 1, 1, 1, 1, 1,
-0.1270066, -0.08273538, -1.382986, 1, 1, 1, 1, 1,
-0.1222816, -0.3414517, -2.162011, 1, 1, 1, 1, 1,
-0.1199448, -0.7951269, -3.654097, 1, 1, 1, 1, 1,
-0.1180164, -0.4449746, -2.476283, 1, 1, 1, 1, 1,
-0.1168325, -1.373528, -2.86284, 1, 1, 1, 1, 1,
-0.1159525, 1.651553, -1.22068, 1, 1, 1, 1, 1,
-0.1106561, -1.741077, -1.902947, 1, 1, 1, 1, 1,
-0.1095177, 0.5823352, 0.6539772, 1, 1, 1, 1, 1,
-0.1091383, -0.2751733, -3.401612, 1, 1, 1, 1, 1,
-0.1064505, 1.844897, -0.04577892, 0, 0, 1, 1, 1,
-0.106351, -0.001748778, -2.187035, 1, 0, 0, 1, 1,
-0.1008889, 1.254738, -0.1739886, 1, 0, 0, 1, 1,
-0.09862304, -1.181691, -2.181826, 1, 0, 0, 1, 1,
-0.09404198, 0.6970128, 0.2385651, 1, 0, 0, 1, 1,
-0.09346464, 0.4027935, -0.5142291, 1, 0, 0, 1, 1,
-0.08863784, -1.451054, -3.467, 0, 0, 0, 1, 1,
-0.08783548, 0.04538638, -1.072816, 0, 0, 0, 1, 1,
-0.08259528, -0.3057939, -2.634921, 0, 0, 0, 1, 1,
-0.08157952, -0.2319171, -2.132665, 0, 0, 0, 1, 1,
-0.0793394, -1.287902, -3.957066, 0, 0, 0, 1, 1,
-0.07873308, 1.120743, 0.414443, 0, 0, 0, 1, 1,
-0.07651913, -1.097649, -3.359043, 0, 0, 0, 1, 1,
-0.06385655, 0.9685307, 0.2166137, 1, 1, 1, 1, 1,
-0.05978594, 0.3291045, 0.4364636, 1, 1, 1, 1, 1,
-0.05545372, -2.245082, -2.899225, 1, 1, 1, 1, 1,
-0.05357111, -0.176876, -1.728504, 1, 1, 1, 1, 1,
-0.053416, 1.412934, 1.10771, 1, 1, 1, 1, 1,
-0.05081499, -0.04252192, -3.434649, 1, 1, 1, 1, 1,
-0.05056043, -0.8070478, -2.506639, 1, 1, 1, 1, 1,
-0.04706349, 2.103647, -0.281177, 1, 1, 1, 1, 1,
-0.04343184, 0.7742748, 0.1564311, 1, 1, 1, 1, 1,
-0.0361383, -1.09887, -3.178597, 1, 1, 1, 1, 1,
-0.03408996, 0.6137482, 0.942737, 1, 1, 1, 1, 1,
-0.03406772, -0.3900578, -3.654436, 1, 1, 1, 1, 1,
-0.03213234, 0.4148081, 0.7932919, 1, 1, 1, 1, 1,
-0.03042096, 1.085294, 0.9275798, 1, 1, 1, 1, 1,
-0.02718102, 0.7210466, -0.07954231, 1, 1, 1, 1, 1,
-0.02677718, -1.167244, -4.484223, 0, 0, 1, 1, 1,
-0.02124081, -1.300096, -3.648058, 1, 0, 0, 1, 1,
-0.02055435, 0.1921544, -0.3042945, 1, 0, 0, 1, 1,
-0.01803168, 0.5944023, -1.206703, 1, 0, 0, 1, 1,
-0.01694069, 1.794656, -0.8483926, 1, 0, 0, 1, 1,
-0.01495499, -0.6826859, -3.765328, 1, 0, 0, 1, 1,
-0.01406812, -0.6753584, -4.18582, 0, 0, 0, 1, 1,
-0.01132193, 0.2070067, -1.319119, 0, 0, 0, 1, 1,
-0.003844489, -1.462173, -2.695022, 0, 0, 0, 1, 1,
0.0005155781, 0.3900213, -0.7477175, 0, 0, 0, 1, 1,
0.001667962, -0.7216041, 3.186726, 0, 0, 0, 1, 1,
0.00495258, -0.2764336, 1.133207, 0, 0, 0, 1, 1,
0.005515247, 1.786977, 0.6146864, 0, 0, 0, 1, 1,
0.009909976, 1.098921, 0.8213789, 1, 1, 1, 1, 1,
0.010241, -0.1676592, 3.101185, 1, 1, 1, 1, 1,
0.01064719, -1.310045, 3.379974, 1, 1, 1, 1, 1,
0.01064944, -1.400339, 2.935702, 1, 1, 1, 1, 1,
0.01075871, 0.3871481, -1.035305, 1, 1, 1, 1, 1,
0.01245367, 0.9251571, -1.21693, 1, 1, 1, 1, 1,
0.0141042, 1.739235, 1.307136, 1, 1, 1, 1, 1,
0.01795325, 1.159648, -0.1641965, 1, 1, 1, 1, 1,
0.02604355, -0.5711547, 2.74097, 1, 1, 1, 1, 1,
0.02923205, 1.687675, -0.5415341, 1, 1, 1, 1, 1,
0.03104045, -0.4011446, 4.086655, 1, 1, 1, 1, 1,
0.03305295, -0.4536354, 3.514402, 1, 1, 1, 1, 1,
0.03652012, 1.061355, 0.9817582, 1, 1, 1, 1, 1,
0.03701182, -0.7418436, 3.361637, 1, 1, 1, 1, 1,
0.04296209, -0.5976279, 3.638247, 1, 1, 1, 1, 1,
0.04631341, 0.1968841, 0.906272, 0, 0, 1, 1, 1,
0.04847823, 0.9141998, 0.7932625, 1, 0, 0, 1, 1,
0.05148411, -1.905185, 3.668119, 1, 0, 0, 1, 1,
0.05208575, -0.6824768, 3.986742, 1, 0, 0, 1, 1,
0.05377861, -1.010216, 1.011752, 1, 0, 0, 1, 1,
0.05517581, 0.6185349, -0.3455208, 1, 0, 0, 1, 1,
0.05538886, -1.088411, 3.100297, 0, 0, 0, 1, 1,
0.0559616, 0.8175884, -0.315219, 0, 0, 0, 1, 1,
0.06578659, 0.2910361, 0.4254285, 0, 0, 0, 1, 1,
0.07273751, 1.099405, 0.3665997, 0, 0, 0, 1, 1,
0.07505806, 2.127312, -0.4818836, 0, 0, 0, 1, 1,
0.07560389, -0.1217818, 3.095917, 0, 0, 0, 1, 1,
0.07606827, -0.5705159, 3.092488, 0, 0, 0, 1, 1,
0.07644512, 0.1635211, -1.276574, 1, 1, 1, 1, 1,
0.07679761, 0.5574113, 0.3725988, 1, 1, 1, 1, 1,
0.08397013, -0.6231826, 3.011108, 1, 1, 1, 1, 1,
0.08704889, -0.4347492, 1.884032, 1, 1, 1, 1, 1,
0.08743211, 1.117599, 1.744822, 1, 1, 1, 1, 1,
0.08856189, -0.2791174, 3.35704, 1, 1, 1, 1, 1,
0.08930267, -1.079545, 2.402221, 1, 1, 1, 1, 1,
0.08933224, -0.8567516, 3.295471, 1, 1, 1, 1, 1,
0.09613663, 0.2697242, 1.13834, 1, 1, 1, 1, 1,
0.09806028, -1.337991, 4.609391, 1, 1, 1, 1, 1,
0.1034407, 0.6321703, -0.6538281, 1, 1, 1, 1, 1,
0.1048868, 0.2444129, 0.9353546, 1, 1, 1, 1, 1,
0.1067992, -1.97588, 3.044245, 1, 1, 1, 1, 1,
0.111372, -0.58393, 3.184371, 1, 1, 1, 1, 1,
0.1118268, -1.025273, 3.892869, 1, 1, 1, 1, 1,
0.1124732, -0.4474516, 4.28598, 0, 0, 1, 1, 1,
0.1187328, 0.1404858, 1.359263, 1, 0, 0, 1, 1,
0.1191466, -0.768218, 1.45039, 1, 0, 0, 1, 1,
0.1281536, 0.9064102, 1.087485, 1, 0, 0, 1, 1,
0.1284287, 1.102887, -0.7952576, 1, 0, 0, 1, 1,
0.1287814, 1.102744, 0.8512621, 1, 0, 0, 1, 1,
0.1289997, -0.6159402, 3.580765, 0, 0, 0, 1, 1,
0.1309101, 1.078182, -1.537791, 0, 0, 0, 1, 1,
0.1385229, -0.5942474, 3.169205, 0, 0, 0, 1, 1,
0.1398339, -0.8774836, 3.691258, 0, 0, 0, 1, 1,
0.141581, 1.03465, 0.486852, 0, 0, 0, 1, 1,
0.1422327, -0.6428512, 2.971279, 0, 0, 0, 1, 1,
0.144397, -0.9815857, 3.422468, 0, 0, 0, 1, 1,
0.1508549, 2.178376, 0.8477062, 1, 1, 1, 1, 1,
0.1535684, 1.423135, -0.5074306, 1, 1, 1, 1, 1,
0.1562267, -0.2247648, 3.641619, 1, 1, 1, 1, 1,
0.1595008, 0.2407428, -0.2625469, 1, 1, 1, 1, 1,
0.1675771, 1.254686, 0.01842515, 1, 1, 1, 1, 1,
0.1707788, 1.229788, -1.239108, 1, 1, 1, 1, 1,
0.1747887, 1.405668, -0.5778494, 1, 1, 1, 1, 1,
0.1748068, 0.1893308, 1.008418, 1, 1, 1, 1, 1,
0.1754424, 0.07148403, 1.507494, 1, 1, 1, 1, 1,
0.1790197, 0.9013796, 0.05580367, 1, 1, 1, 1, 1,
0.1833321, -0.8195102, 2.836957, 1, 1, 1, 1, 1,
0.1864785, 0.3761359, -0.1437454, 1, 1, 1, 1, 1,
0.1901986, 1.592385, -0.1135574, 1, 1, 1, 1, 1,
0.1906842, -0.364329, 2.48362, 1, 1, 1, 1, 1,
0.1909833, -0.04845374, 3.134797, 1, 1, 1, 1, 1,
0.192956, 1.522518, -0.1766838, 0, 0, 1, 1, 1,
0.1930762, 0.3368314, -1.624626, 1, 0, 0, 1, 1,
0.1934187, 1.675434, 2.109819, 1, 0, 0, 1, 1,
0.1962809, -0.1529125, 2.393882, 1, 0, 0, 1, 1,
0.1965451, 0.4066353, 1.315579, 1, 0, 0, 1, 1,
0.2016926, 0.2872454, -0.4976044, 1, 0, 0, 1, 1,
0.2022588, 0.6227408, 1.658473, 0, 0, 0, 1, 1,
0.2030739, 0.1386356, 0.7202197, 0, 0, 0, 1, 1,
0.2031972, -1.719521, 2.891326, 0, 0, 0, 1, 1,
0.2039288, -0.1119433, 0.8307903, 0, 0, 0, 1, 1,
0.2047278, -0.8691977, 3.207537, 0, 0, 0, 1, 1,
0.2060131, 1.039277, -0.7882139, 0, 0, 0, 1, 1,
0.2065991, -1.639084, 3.28881, 0, 0, 0, 1, 1,
0.20753, -0.1596468, 3.845207, 1, 1, 1, 1, 1,
0.2147161, 0.1124356, 1.556041, 1, 1, 1, 1, 1,
0.218136, -0.6505887, 3.787431, 1, 1, 1, 1, 1,
0.2183415, 0.482358, 0.07131957, 1, 1, 1, 1, 1,
0.2188311, 0.8459646, 0.2495629, 1, 1, 1, 1, 1,
0.2205697, 0.4371483, 2.328314, 1, 1, 1, 1, 1,
0.2500841, 0.2618771, 0.7376056, 1, 1, 1, 1, 1,
0.2513485, 1.087574, -0.1306356, 1, 1, 1, 1, 1,
0.2517571, 0.445554, -0.3238275, 1, 1, 1, 1, 1,
0.2519021, 1.555902, -1.770365, 1, 1, 1, 1, 1,
0.2525974, 2.489609, -1.337416, 1, 1, 1, 1, 1,
0.2529111, 1.176382, 0.4617186, 1, 1, 1, 1, 1,
0.2548248, -0.2686203, 3.337008, 1, 1, 1, 1, 1,
0.2555896, 1.322133, 0.3115733, 1, 1, 1, 1, 1,
0.2562719, -1.08053, 4.145682, 1, 1, 1, 1, 1,
0.2595438, -0.2687027, 3.380269, 0, 0, 1, 1, 1,
0.2620704, 0.8460633, 1.25009, 1, 0, 0, 1, 1,
0.26558, 0.1637073, 0.6725344, 1, 0, 0, 1, 1,
0.2658849, -0.2357434, 0.5859814, 1, 0, 0, 1, 1,
0.2684855, 0.08440751, 0.5174956, 1, 0, 0, 1, 1,
0.2723949, 1.584788, -0.4744989, 1, 0, 0, 1, 1,
0.2755563, -0.2167575, 2.878146, 0, 0, 0, 1, 1,
0.2774739, 0.1708212, 0.8501464, 0, 0, 0, 1, 1,
0.2803933, 0.9131631, 1.742301, 0, 0, 0, 1, 1,
0.2836976, 0.4976077, 2.278522, 0, 0, 0, 1, 1,
0.2849373, -0.8210098, 2.273584, 0, 0, 0, 1, 1,
0.2899968, -0.3159328, 3.255735, 0, 0, 0, 1, 1,
0.2945857, -1.109826, 2.414171, 0, 0, 0, 1, 1,
0.2987665, 0.8940737, 0.653703, 1, 1, 1, 1, 1,
0.3014368, 0.1312754, 2.858871, 1, 1, 1, 1, 1,
0.3040184, -0.6936746, 0.819066, 1, 1, 1, 1, 1,
0.3066255, -0.07246128, 3.164411, 1, 1, 1, 1, 1,
0.3074442, -1.728106, 2.906567, 1, 1, 1, 1, 1,
0.3079697, -0.9245174, 4.35435, 1, 1, 1, 1, 1,
0.3118994, -1.735657, 3.268597, 1, 1, 1, 1, 1,
0.3130178, -1.446947, 2.724885, 1, 1, 1, 1, 1,
0.3144585, 0.09053809, 2.029106, 1, 1, 1, 1, 1,
0.3163154, 2.020011, 1.278324, 1, 1, 1, 1, 1,
0.3217174, 1.37154, 1.436579, 1, 1, 1, 1, 1,
0.3244835, 0.8008415, 0.8916917, 1, 1, 1, 1, 1,
0.3283092, -0.2867482, 2.612746, 1, 1, 1, 1, 1,
0.3296973, 0.7427626, 0.5728219, 1, 1, 1, 1, 1,
0.3324389, 0.841488, 0.02664427, 1, 1, 1, 1, 1,
0.3359051, -0.2507895, 0.5378518, 0, 0, 1, 1, 1,
0.3399401, -0.7837082, 2.798862, 1, 0, 0, 1, 1,
0.3429623, 1.507786, 0.09886175, 1, 0, 0, 1, 1,
0.3431688, 0.2489882, 0.2034786, 1, 0, 0, 1, 1,
0.3457786, -1.23836, 2.291533, 1, 0, 0, 1, 1,
0.3486196, 1.211416, 0.4954567, 1, 0, 0, 1, 1,
0.3531747, 0.7813289, 0.8413432, 0, 0, 0, 1, 1,
0.3541719, 1.304481, 1.505202, 0, 0, 0, 1, 1,
0.3544405, 0.3559838, 1.227692, 0, 0, 0, 1, 1,
0.3585681, 0.5905904, 1.049534, 0, 0, 0, 1, 1,
0.3591727, -0.3056079, 2.598878, 0, 0, 0, 1, 1,
0.3611462, -0.1903569, 2.653493, 0, 0, 0, 1, 1,
0.3711033, -1.544553, 2.636353, 0, 0, 0, 1, 1,
0.3712043, 0.5741417, -1.322933, 1, 1, 1, 1, 1,
0.3726233, 0.1255613, 2.261993, 1, 1, 1, 1, 1,
0.3737397, 0.07561984, 0.2745666, 1, 1, 1, 1, 1,
0.3846416, 1.217679, 0.575833, 1, 1, 1, 1, 1,
0.3867218, -2.230258, 3.886869, 1, 1, 1, 1, 1,
0.3877903, 0.6190738, -0.4848625, 1, 1, 1, 1, 1,
0.3892411, 0.0464412, 0.6425696, 1, 1, 1, 1, 1,
0.3938414, -0.635828, 4.482468, 1, 1, 1, 1, 1,
0.3942603, -0.8487357, 2.237459, 1, 1, 1, 1, 1,
0.3966162, 0.006464737, -0.003396996, 1, 1, 1, 1, 1,
0.4020092, 1.284685, 1.229734, 1, 1, 1, 1, 1,
0.407361, -1.204728, 2.162556, 1, 1, 1, 1, 1,
0.4086548, -0.506327, 2.81128, 1, 1, 1, 1, 1,
0.4102469, -0.7564151, 2.736702, 1, 1, 1, 1, 1,
0.4109545, -1.333815, 2.439281, 1, 1, 1, 1, 1,
0.411572, 0.4499039, 2.835669, 0, 0, 1, 1, 1,
0.4145636, -0.5955232, 3.063295, 1, 0, 0, 1, 1,
0.4147208, -0.6785083, 2.449113, 1, 0, 0, 1, 1,
0.4149401, -0.7388456, 1.050332, 1, 0, 0, 1, 1,
0.4201166, -0.09888274, 0.5801973, 1, 0, 0, 1, 1,
0.4214555, 0.9698732, 1.897854, 1, 0, 0, 1, 1,
0.4224733, -1.480227, 2.85601, 0, 0, 0, 1, 1,
0.4228752, -0.4912015, 2.857007, 0, 0, 0, 1, 1,
0.4240695, 0.6253712, -1.403769, 0, 0, 0, 1, 1,
0.4262863, -0.3048973, 3.645694, 0, 0, 0, 1, 1,
0.4280981, -0.2190509, 2.300453, 0, 0, 0, 1, 1,
0.4292493, -1.075671, 4.356112, 0, 0, 0, 1, 1,
0.4312855, 0.4391382, 0.2903179, 0, 0, 0, 1, 1,
0.4332498, -0.4910034, 3.599495, 1, 1, 1, 1, 1,
0.4360806, -0.009098176, 3.578755, 1, 1, 1, 1, 1,
0.4375514, 1.216236, 0.1242166, 1, 1, 1, 1, 1,
0.4388063, 0.6989949, 2.373664, 1, 1, 1, 1, 1,
0.444409, 1.063892, 1.507667, 1, 1, 1, 1, 1,
0.4452105, -0.3102852, 3.670013, 1, 1, 1, 1, 1,
0.4497595, -1.07682, 4.514972, 1, 1, 1, 1, 1,
0.451765, -0.1302007, 0.7508861, 1, 1, 1, 1, 1,
0.4549662, 0.1727077, 3.71689, 1, 1, 1, 1, 1,
0.4555153, 0.8505831, -0.4390089, 1, 1, 1, 1, 1,
0.4578551, 0.7577171, 1.130134, 1, 1, 1, 1, 1,
0.4591946, 0.4474655, 1.108862, 1, 1, 1, 1, 1,
0.4605303, -1.347423, 4.326558, 1, 1, 1, 1, 1,
0.4690888, -0.9562463, 1.636295, 1, 1, 1, 1, 1,
0.469781, -1.108402, 2.660222, 1, 1, 1, 1, 1,
0.4752956, 0.4085503, 0.6530316, 0, 0, 1, 1, 1,
0.478145, 0.01485344, 0.2978261, 1, 0, 0, 1, 1,
0.4783553, 0.6373063, 1.573292, 1, 0, 0, 1, 1,
0.4792867, 0.6207607, 0.1852752, 1, 0, 0, 1, 1,
0.4802978, -0.733054, 3.338744, 1, 0, 0, 1, 1,
0.4820383, 0.7446486, -0.8857092, 1, 0, 0, 1, 1,
0.4927586, -0.1084687, 1.301673, 0, 0, 0, 1, 1,
0.4934604, -0.1069412, 0.4737972, 0, 0, 0, 1, 1,
0.4984551, -0.460913, 1.587243, 0, 0, 0, 1, 1,
0.5032309, -0.6725835, 2.468199, 0, 0, 0, 1, 1,
0.5033715, 0.6109586, 1.390971, 0, 0, 0, 1, 1,
0.5048335, 1.888553, -0.4701856, 0, 0, 0, 1, 1,
0.5053942, -0.03677358, 3.470651, 0, 0, 0, 1, 1,
0.5060319, 0.6734471, 1.152566, 1, 1, 1, 1, 1,
0.5084066, 0.6414949, 0.6205614, 1, 1, 1, 1, 1,
0.5095634, 0.8374735, 1.043213, 1, 1, 1, 1, 1,
0.5125674, -0.6548079, 4.019143, 1, 1, 1, 1, 1,
0.5164154, -1.418406, 2.283992, 1, 1, 1, 1, 1,
0.5179234, -1.328596, 3.300704, 1, 1, 1, 1, 1,
0.5191439, 1.187696, 0.5375106, 1, 1, 1, 1, 1,
0.5213168, 1.468912, -0.8884382, 1, 1, 1, 1, 1,
0.5227404, -0.2803013, 2.841289, 1, 1, 1, 1, 1,
0.523068, -0.6291587, 3.246287, 1, 1, 1, 1, 1,
0.5235103, 0.8137372, 1.165445, 1, 1, 1, 1, 1,
0.5265936, 1.064193, 1.808493, 1, 1, 1, 1, 1,
0.5336533, 0.07297897, 2.595, 1, 1, 1, 1, 1,
0.5354567, -1.032658, 2.094445, 1, 1, 1, 1, 1,
0.5374636, 0.5784854, -0.07894055, 1, 1, 1, 1, 1,
0.5390679, -0.2202194, 2.658344, 0, 0, 1, 1, 1,
0.5403753, 0.702031, -0.4558598, 1, 0, 0, 1, 1,
0.5414773, -1.706025, 1.649551, 1, 0, 0, 1, 1,
0.5485519, -0.4368872, 1.771021, 1, 0, 0, 1, 1,
0.5536289, 0.1826035, 0.2638532, 1, 0, 0, 1, 1,
0.5590736, 0.3654914, 2.268808, 1, 0, 0, 1, 1,
0.5605255, 0.3185486, 0.9325973, 0, 0, 0, 1, 1,
0.5607338, 0.3014449, 1.488904, 0, 0, 0, 1, 1,
0.5622674, -0.2357925, 1.56338, 0, 0, 0, 1, 1,
0.5650116, -2.042822, 3.783355, 0, 0, 0, 1, 1,
0.5701551, -0.0922959, 2.661263, 0, 0, 0, 1, 1,
0.5742788, -0.2878797, 0.7177933, 0, 0, 0, 1, 1,
0.5793304, 0.1703562, -1.238025, 0, 0, 0, 1, 1,
0.5816492, 0.3027684, 1.569563, 1, 1, 1, 1, 1,
0.5822607, -0.1689376, 2.807833, 1, 1, 1, 1, 1,
0.5833126, 0.8028443, -0.4027583, 1, 1, 1, 1, 1,
0.5838645, 1.098028, 1.0375, 1, 1, 1, 1, 1,
0.5841443, -0.5913972, 2.433142, 1, 1, 1, 1, 1,
0.5869011, 0.2323207, 0.2545583, 1, 1, 1, 1, 1,
0.5916131, 1.045366, 0.2828725, 1, 1, 1, 1, 1,
0.5930664, -0.6100658, 2.747202, 1, 1, 1, 1, 1,
0.5993479, -1.352782, 2.598248, 1, 1, 1, 1, 1,
0.5997184, 0.1692356, 1.784191, 1, 1, 1, 1, 1,
0.600292, 0.2329111, 4.230403, 1, 1, 1, 1, 1,
0.6057478, 1.282496, 0.01303765, 1, 1, 1, 1, 1,
0.6124785, 0.2970879, 1.807658, 1, 1, 1, 1, 1,
0.6135316, -0.6084083, 2.79318, 1, 1, 1, 1, 1,
0.6147562, 1.881193, 0.726256, 1, 1, 1, 1, 1,
0.6185211, 1.176011, 0.4129799, 0, 0, 1, 1, 1,
0.6219959, -1.877295, 2.63113, 1, 0, 0, 1, 1,
0.6229733, 0.03760767, 0.248725, 1, 0, 0, 1, 1,
0.6275599, 0.156905, 0.6452214, 1, 0, 0, 1, 1,
0.629222, -0.2440735, 0.8824465, 1, 0, 0, 1, 1,
0.6332939, -1.056476, 4.674264, 1, 0, 0, 1, 1,
0.6335273, 0.09170141, 3.742299, 0, 0, 0, 1, 1,
0.6377368, 0.3063134, 0.4887081, 0, 0, 0, 1, 1,
0.6400127, 0.01935862, 2.612806, 0, 0, 0, 1, 1,
0.6511436, -2.197848, 2.78018, 0, 0, 0, 1, 1,
0.6533699, -0.7114084, 2.566401, 0, 0, 0, 1, 1,
0.6545282, -0.6834484, 1.786565, 0, 0, 0, 1, 1,
0.6549764, 1.911304, 1.065631, 0, 0, 0, 1, 1,
0.6706061, -0.008101143, 1.133939, 1, 1, 1, 1, 1,
0.6731007, -1.524666, 4.152277, 1, 1, 1, 1, 1,
0.6737892, -1.262645, 2.64747, 1, 1, 1, 1, 1,
0.6743508, -0.3818622, 3.387991, 1, 1, 1, 1, 1,
0.6815929, -2.808209, 4.185844, 1, 1, 1, 1, 1,
0.6846473, -1.237458, 1.259557, 1, 1, 1, 1, 1,
0.6917801, -1.07175, 4.226223, 1, 1, 1, 1, 1,
0.6980736, -0.02619349, 3.465766, 1, 1, 1, 1, 1,
0.7102639, -1.448555, 2.445781, 1, 1, 1, 1, 1,
0.7124104, -0.8274949, 1.830417, 1, 1, 1, 1, 1,
0.7145732, -0.1939826, 0.541621, 1, 1, 1, 1, 1,
0.7154001, -0.2270174, 1.4159, 1, 1, 1, 1, 1,
0.7189643, 0.0204295, 1.207193, 1, 1, 1, 1, 1,
0.7212469, -0.3359917, 1.08375, 1, 1, 1, 1, 1,
0.7277719, 1.30955, 1.179268, 1, 1, 1, 1, 1,
0.7294772, 0.01198922, 1.027947, 0, 0, 1, 1, 1,
0.7321736, 1.102394, 2.228457, 1, 0, 0, 1, 1,
0.7359818, -1.47289, 0.9389774, 1, 0, 0, 1, 1,
0.7365444, -0.2215779, 2.262596, 1, 0, 0, 1, 1,
0.7374839, 0.331257, 1.059722, 1, 0, 0, 1, 1,
0.7388654, -1.775669, 3.409194, 1, 0, 0, 1, 1,
0.7428238, -0.8804727, 2.410496, 0, 0, 0, 1, 1,
0.7441419, 1.353249, -0.07573031, 0, 0, 0, 1, 1,
0.7520537, 1.108148, -0.3464885, 0, 0, 0, 1, 1,
0.7545649, -1.693654, 2.571539, 0, 0, 0, 1, 1,
0.7591909, 1.179102, -0.1876739, 0, 0, 0, 1, 1,
0.761456, -1.589505, 2.334551, 0, 0, 0, 1, 1,
0.7616873, 1.836533, 1.265346, 0, 0, 0, 1, 1,
0.7622357, 0.4166644, 0.507661, 1, 1, 1, 1, 1,
0.7671067, 0.8825514, 0.6920769, 1, 1, 1, 1, 1,
0.7708095, -1.005641, 2.217476, 1, 1, 1, 1, 1,
0.7711844, 0.3396144, 0.6276495, 1, 1, 1, 1, 1,
0.7731594, 0.8491248, 0.001428901, 1, 1, 1, 1, 1,
0.7749964, -0.4802386, 1.368969, 1, 1, 1, 1, 1,
0.7802592, -0.6478328, 1.750614, 1, 1, 1, 1, 1,
0.7808645, -1.523488, 3.65766, 1, 1, 1, 1, 1,
0.7886215, 0.3368258, 0.193269, 1, 1, 1, 1, 1,
0.7896761, -0.2063347, 2.430762, 1, 1, 1, 1, 1,
0.805871, 0.02379031, 1.639981, 1, 1, 1, 1, 1,
0.8062362, 0.0471318, 1.441121, 1, 1, 1, 1, 1,
0.8134224, 1.042328, 0.5225526, 1, 1, 1, 1, 1,
0.8189222, -2.03554, 1.091571, 1, 1, 1, 1, 1,
0.8191599, 0.6270288, 2.408447, 1, 1, 1, 1, 1,
0.8234159, -0.1491721, 2.997615, 0, 0, 1, 1, 1,
0.8234792, -0.8482608, 2.734713, 1, 0, 0, 1, 1,
0.8270653, 0.08671413, 1.218504, 1, 0, 0, 1, 1,
0.8286958, -0.3188085, 2.947654, 1, 0, 0, 1, 1,
0.8367912, 0.1100384, 0.7549276, 1, 0, 0, 1, 1,
0.8424186, 1.072203, 2.355913, 1, 0, 0, 1, 1,
0.8465168, 1.012458, 0.5436516, 0, 0, 0, 1, 1,
0.8515718, -0.1999285, 1.424412, 0, 0, 0, 1, 1,
0.8585854, 1.010937, 0.971128, 0, 0, 0, 1, 1,
0.8616024, 1.125919, 0.879353, 0, 0, 0, 1, 1,
0.8617855, 0.7369167, 1.389794, 0, 0, 0, 1, 1,
0.8653527, -0.4093358, 3.068832, 0, 0, 0, 1, 1,
0.868053, -0.7000152, 3.475317, 0, 0, 0, 1, 1,
0.8689049, -0.2516313, 1.204488, 1, 1, 1, 1, 1,
0.8729045, 0.7678639, -1.103901, 1, 1, 1, 1, 1,
0.8759075, -0.1397936, 2.618595, 1, 1, 1, 1, 1,
0.8791485, -1.137696, 2.793985, 1, 1, 1, 1, 1,
0.8798575, 0.56774, 0.3488034, 1, 1, 1, 1, 1,
0.8839764, -0.1497246, -0.01684915, 1, 1, 1, 1, 1,
0.8862367, 1.669214, -0.393226, 1, 1, 1, 1, 1,
0.8880657, -0.1542065, 1.760334, 1, 1, 1, 1, 1,
0.8959152, 1.288496, -0.3091224, 1, 1, 1, 1, 1,
0.9027998, 0.08067388, 2.622126, 1, 1, 1, 1, 1,
0.907492, -1.758189, 4.653109, 1, 1, 1, 1, 1,
0.9108776, -0.2016793, 0.5928265, 1, 1, 1, 1, 1,
0.9109604, -1.863237, 2.186518, 1, 1, 1, 1, 1,
0.9137442, 0.1576237, 0.8249611, 1, 1, 1, 1, 1,
0.9138355, 0.5826221, -0.2366109, 1, 1, 1, 1, 1,
0.9197598, 0.1939319, 1.228468, 0, 0, 1, 1, 1,
0.9251478, 1.334789, 0.8703614, 1, 0, 0, 1, 1,
0.9281284, 0.5072089, 0.805734, 1, 0, 0, 1, 1,
0.9328378, 1.671694, 0.2191671, 1, 0, 0, 1, 1,
0.937902, 2.583755, 1.582804, 1, 0, 0, 1, 1,
0.9403033, -1.655395, 3.609077, 1, 0, 0, 1, 1,
0.9459474, 0.2973806, 1.023887, 0, 0, 0, 1, 1,
0.9510424, -0.5366466, 1.294567, 0, 0, 0, 1, 1,
0.9552885, -2.020434, 3.040327, 0, 0, 0, 1, 1,
0.957015, 0.227413, 3.027781, 0, 0, 0, 1, 1,
0.9583399, 1.730769, 0.05725965, 0, 0, 0, 1, 1,
0.9586849, 0.01689854, 1.385809, 0, 0, 0, 1, 1,
0.9596197, -0.6876099, 0.9322197, 0, 0, 0, 1, 1,
0.9622349, 0.5963331, 1.186546, 1, 1, 1, 1, 1,
0.9622781, 1.189037, -0.3784216, 1, 1, 1, 1, 1,
0.9666292, -0.02397938, 1.88282, 1, 1, 1, 1, 1,
0.968765, -0.9187559, 1.319551, 1, 1, 1, 1, 1,
0.9789873, -0.7588357, 0.6018763, 1, 1, 1, 1, 1,
0.9810438, -0.462664, 3.879451, 1, 1, 1, 1, 1,
0.9879815, 0.9418688, 0.2318122, 1, 1, 1, 1, 1,
0.9982714, 0.5080578, 1.629718, 1, 1, 1, 1, 1,
1.003852, 1.288444, 2.490035, 1, 1, 1, 1, 1,
1.003993, -0.1280839, 0.5526236, 1, 1, 1, 1, 1,
1.014834, 0.5090989, 1.018824, 1, 1, 1, 1, 1,
1.017054, -1.012244, 2.462222, 1, 1, 1, 1, 1,
1.026648, 1.698546, 0.3167399, 1, 1, 1, 1, 1,
1.033888, 0.5733603, 0.3693064, 1, 1, 1, 1, 1,
1.034099, -0.4092349, 0.8074998, 1, 1, 1, 1, 1,
1.043039, 0.6374123, 1.215191, 0, 0, 1, 1, 1,
1.047032, -0.7306058, 2.323547, 1, 0, 0, 1, 1,
1.049939, -1.449628, 4.597548, 1, 0, 0, 1, 1,
1.052336, 0.3303443, 0.5127257, 1, 0, 0, 1, 1,
1.055975, -0.4802232, 2.036851, 1, 0, 0, 1, 1,
1.074972, 0.2336483, 3.702547, 1, 0, 0, 1, 1,
1.077743, -0.5927022, 1.703417, 0, 0, 0, 1, 1,
1.078274, 0.5398188, 0.4475362, 0, 0, 0, 1, 1,
1.090276, -1.110326, 2.014148, 0, 0, 0, 1, 1,
1.109574, 1.156955, 0.7141806, 0, 0, 0, 1, 1,
1.116583, 1.343217, 0.8992938, 0, 0, 0, 1, 1,
1.123147, 1.126592, 0.7918086, 0, 0, 0, 1, 1,
1.129372, 1.012344, 2.977214, 0, 0, 0, 1, 1,
1.142969, 0.3888639, 0.7070203, 1, 1, 1, 1, 1,
1.152031, 0.742485, 1.316634, 1, 1, 1, 1, 1,
1.157184, 1.072963, 1.89593, 1, 1, 1, 1, 1,
1.157725, 0.3119837, -0.02657454, 1, 1, 1, 1, 1,
1.184281, -1.114685, 2.560162, 1, 1, 1, 1, 1,
1.185954, 1.225063, 0.7609808, 1, 1, 1, 1, 1,
1.195695, -0.8535761, 0.9763094, 1, 1, 1, 1, 1,
1.200571, 1.471273, 0.2487358, 1, 1, 1, 1, 1,
1.202705, -0.7131077, 1.584701, 1, 1, 1, 1, 1,
1.203802, -0.1343396, 1.292336, 1, 1, 1, 1, 1,
1.204636, -0.6406602, 2.680141, 1, 1, 1, 1, 1,
1.206204, -0.1892181, 1.572228, 1, 1, 1, 1, 1,
1.208565, 1.272666, 0.7772084, 1, 1, 1, 1, 1,
1.214694, 0.07187053, 1.104896, 1, 1, 1, 1, 1,
1.218756, -1.314104, 3.103758, 1, 1, 1, 1, 1,
1.222614, 0.1955284, -0.1393844, 0, 0, 1, 1, 1,
1.228714, -0.03253006, 0.8771176, 1, 0, 0, 1, 1,
1.229577, 0.6984792, 0.9261878, 1, 0, 0, 1, 1,
1.229664, 0.5089869, 1.812498, 1, 0, 0, 1, 1,
1.231097, 1.175482, 2.636784, 1, 0, 0, 1, 1,
1.232752, -0.4048989, 1.390239, 1, 0, 0, 1, 1,
1.232973, 0.3645443, 0.5361301, 0, 0, 0, 1, 1,
1.265947, -1.276833, 1.671606, 0, 0, 0, 1, 1,
1.269901, -2.455167, 3.602147, 0, 0, 0, 1, 1,
1.280067, 1.483644, -1.630306, 0, 0, 0, 1, 1,
1.283154, -0.9377772, 1.770321, 0, 0, 0, 1, 1,
1.283647, 1.668965, 0.9829279, 0, 0, 0, 1, 1,
1.284061, 0.6875913, 0.818529, 0, 0, 0, 1, 1,
1.296776, 2.084643, 0.7287748, 1, 1, 1, 1, 1,
1.309679, 0.3882621, 2.195657, 1, 1, 1, 1, 1,
1.316513, 1.123108, 1.669948, 1, 1, 1, 1, 1,
1.321074, 0.4941814, 0.5008898, 1, 1, 1, 1, 1,
1.321237, 0.4884832, -0.2771991, 1, 1, 1, 1, 1,
1.32882, -0.4858005, 1.747138, 1, 1, 1, 1, 1,
1.341196, 1.443559, 2.4909, 1, 1, 1, 1, 1,
1.34505, -0.1167447, 2.476879, 1, 1, 1, 1, 1,
1.346955, -1.507923, -0.2610811, 1, 1, 1, 1, 1,
1.360045, -1.171302, 2.843578, 1, 1, 1, 1, 1,
1.366978, -0.0438895, 0.9879814, 1, 1, 1, 1, 1,
1.391011, 1.962215, 1.688257, 1, 1, 1, 1, 1,
1.396321, 0.6282817, 1.279839, 1, 1, 1, 1, 1,
1.425725, 0.6057603, 0.2328676, 1, 1, 1, 1, 1,
1.429964, 1.961359, 0.9170651, 1, 1, 1, 1, 1,
1.432313, -0.100687, 2.681025, 0, 0, 1, 1, 1,
1.434461, -1.275771, 3.046771, 1, 0, 0, 1, 1,
1.441599, 1.079894, 2.482343, 1, 0, 0, 1, 1,
1.443167, 0.1175169, 1.186027, 1, 0, 0, 1, 1,
1.450758, 1.867539, 0.01078236, 1, 0, 0, 1, 1,
1.473914, -0.9185248, 2.214306, 1, 0, 0, 1, 1,
1.476954, 1.089455, 1.216813, 0, 0, 0, 1, 1,
1.482547, -0.7568446, 1.101773, 0, 0, 0, 1, 1,
1.487562, 0.07185541, 1.070611, 0, 0, 0, 1, 1,
1.51162, -0.03397123, 1.114553, 0, 0, 0, 1, 1,
1.522715, -1.02648, 2.130594, 0, 0, 0, 1, 1,
1.533729, -1.364027, 2.568513, 0, 0, 0, 1, 1,
1.55481, 1.427969, -0.700958, 0, 0, 0, 1, 1,
1.556723, -0.8445276, 1.709094, 1, 1, 1, 1, 1,
1.576892, 2.112504, 1.40167, 1, 1, 1, 1, 1,
1.594177, -0.3745923, 2.193359, 1, 1, 1, 1, 1,
1.606946, 0.4957857, 1.548263, 1, 1, 1, 1, 1,
1.620814, 1.154261, -2.183702, 1, 1, 1, 1, 1,
1.62859, -2.175702, 4.154109, 1, 1, 1, 1, 1,
1.638972, -0.1218852, 2.892153, 1, 1, 1, 1, 1,
1.646949, -0.07764553, 1.584052, 1, 1, 1, 1, 1,
1.650849, -0.6334091, 1.558806, 1, 1, 1, 1, 1,
1.652694, 1.266712, 1.439342, 1, 1, 1, 1, 1,
1.653906, 0.1143295, 0.6928046, 1, 1, 1, 1, 1,
1.660026, -0.4422573, 2.548523, 1, 1, 1, 1, 1,
1.685291, 0.4209898, 1.242363, 1, 1, 1, 1, 1,
1.704013, -0.2838919, 2.851377, 1, 1, 1, 1, 1,
1.720731, -1.58547, 3.001048, 1, 1, 1, 1, 1,
1.726792, -0.2468074, 2.547698, 0, 0, 1, 1, 1,
1.740771, -0.07569134, 0.8461785, 1, 0, 0, 1, 1,
1.745829, -0.8015885, 1.386224, 1, 0, 0, 1, 1,
1.748662, 1.091289, 0.215303, 1, 0, 0, 1, 1,
1.754476, -1.279865, 4.028766, 1, 0, 0, 1, 1,
1.767951, 0.2104408, -0.1326321, 1, 0, 0, 1, 1,
1.786372, 0.4936392, 1.702662, 0, 0, 0, 1, 1,
1.800711, 1.299006, 0.8285095, 0, 0, 0, 1, 1,
1.800768, -1.140114, 2.769923, 0, 0, 0, 1, 1,
1.803553, -1.206586, 0.936968, 0, 0, 0, 1, 1,
1.823331, 0.3876014, 3.108404, 0, 0, 0, 1, 1,
1.826151, 1.318992, 0.8272765, 0, 0, 0, 1, 1,
1.831836, 0.5208186, 1.642733, 0, 0, 0, 1, 1,
1.851077, 0.820938, 2.403498, 1, 1, 1, 1, 1,
1.853153, 0.7118052, 0.1090988, 1, 1, 1, 1, 1,
1.876291, 0.9396893, 2.134938, 1, 1, 1, 1, 1,
1.88756, 2.510231, 0.310176, 1, 1, 1, 1, 1,
1.892373, -0.796347, 1.686655, 1, 1, 1, 1, 1,
1.895233, -0.3179485, 3.547637, 1, 1, 1, 1, 1,
1.929913, -0.564144, 1.270092, 1, 1, 1, 1, 1,
1.947247, -0.4757082, 1.475188, 1, 1, 1, 1, 1,
1.956562, -0.834112, 1.875004, 1, 1, 1, 1, 1,
1.98066, -0.5831198, 1.386893, 1, 1, 1, 1, 1,
2.006738, 1.187189, 0.1379151, 1, 1, 1, 1, 1,
2.029684, -0.977218, 0.8818476, 1, 1, 1, 1, 1,
2.041581, -1.925284, 2.566316, 1, 1, 1, 1, 1,
2.053694, 0.4336719, 2.333038, 1, 1, 1, 1, 1,
2.08175, -1.778989, 3.68617, 1, 1, 1, 1, 1,
2.116021, 2.549102, 0.01151599, 0, 0, 1, 1, 1,
2.168826, 0.7045664, 1.802159, 1, 0, 0, 1, 1,
2.184089, -0.7690395, 2.222401, 1, 0, 0, 1, 1,
2.204341, 0.8020536, 1.376437, 1, 0, 0, 1, 1,
2.23036, 0.1397267, 1.792783, 1, 0, 0, 1, 1,
2.241187, -1.250417, 1.016698, 1, 0, 0, 1, 1,
2.24827, -0.9139976, 2.63618, 0, 0, 0, 1, 1,
2.273885, -0.417238, 2.333021, 0, 0, 0, 1, 1,
2.292967, -0.8666649, -0.002298873, 0, 0, 0, 1, 1,
2.304275, 0.3026528, 0.9112167, 0, 0, 0, 1, 1,
2.307121, -0.08565827, 2.178411, 0, 0, 0, 1, 1,
2.345974, -0.8007396, 2.736761, 0, 0, 0, 1, 1,
2.535203, -0.2038742, -0.1558661, 0, 0, 0, 1, 1,
2.594811, 0.1589644, -0.2652887, 1, 1, 1, 1, 1,
2.611463, 0.6114708, 2.311878, 1, 1, 1, 1, 1,
2.617003, -0.4423674, 1.092355, 1, 1, 1, 1, 1,
2.648247, 0.4775223, 2.760334, 1, 1, 1, 1, 1,
2.693089, -0.7838564, 2.040716, 1, 1, 1, 1, 1,
2.724046, -0.0810902, 2.665132, 1, 1, 1, 1, 1,
3.057222, 0.591054, 1.175671, 1, 1, 1, 1, 1
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
var radius = 9.146476;
var distance = 32.12661;
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
mvMatrix.translate( 0.03425741, -0.2803261, 0.299222 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.12661);
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
