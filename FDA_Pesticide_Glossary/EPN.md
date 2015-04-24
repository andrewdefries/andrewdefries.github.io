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
-3.225673, 0.1232512, -3.477612, 1, 0, 0, 1,
-3.092094, -0.3898513, -1.287423, 1, 0.007843138, 0, 1,
-3.063833, 0.480664, -2.646627, 1, 0.01176471, 0, 1,
-3.062581, -0.4538792, -3.169252, 1, 0.01960784, 0, 1,
-2.832414, 1.687066, -1.904594, 1, 0.02352941, 0, 1,
-2.672975, 0.0824201, -2.461174, 1, 0.03137255, 0, 1,
-2.595181, 2.330272, -1.312383, 1, 0.03529412, 0, 1,
-2.579195, 0.3787083, -2.108497, 1, 0.04313726, 0, 1,
-2.484842, 2.501764, -0.8696391, 1, 0.04705882, 0, 1,
-2.47316, 0.3501801, -0.14349, 1, 0.05490196, 0, 1,
-2.442617, -0.5329704, -2.303698, 1, 0.05882353, 0, 1,
-2.418073, 0.2650575, -2.216094, 1, 0.06666667, 0, 1,
-2.311628, -1.555164, -1.933607, 1, 0.07058824, 0, 1,
-2.304262, 1.248394, -1.563173, 1, 0.07843138, 0, 1,
-2.291628, -1.186219, -2.549909, 1, 0.08235294, 0, 1,
-2.249105, -0.401737, -0.6877899, 1, 0.09019608, 0, 1,
-2.195426, 0.6109207, -1.79473, 1, 0.09411765, 0, 1,
-2.181319, -0.2858427, -2.980274, 1, 0.1019608, 0, 1,
-2.139595, -1.275945, -3.360214, 1, 0.1098039, 0, 1,
-2.125541, -0.1538047, -2.938117, 1, 0.1137255, 0, 1,
-2.086391, -1.15738, -2.620929, 1, 0.1215686, 0, 1,
-2.068707, -1.169635, -2.007334, 1, 0.1254902, 0, 1,
-2.056477, -1.458861, -3.995374, 1, 0.1333333, 0, 1,
-2.045871, 1.155731, -1.310657, 1, 0.1372549, 0, 1,
-2.026041, 1.009834, -1.46608, 1, 0.145098, 0, 1,
-2.019514, 1.023551, 0.6416736, 1, 0.1490196, 0, 1,
-2.016281, -1.983029, -2.941342, 1, 0.1568628, 0, 1,
-1.983805, -0.7914611, -1.706737, 1, 0.1607843, 0, 1,
-1.978243, 0.2730856, -1.507161, 1, 0.1686275, 0, 1,
-1.968244, 2.366019, -1.481754, 1, 0.172549, 0, 1,
-1.957868, -1.499019, -2.466535, 1, 0.1803922, 0, 1,
-1.947078, -0.4669844, -1.758121, 1, 0.1843137, 0, 1,
-1.936454, 1.760376, -1.090962, 1, 0.1921569, 0, 1,
-1.935773, 1.203873, -0.5478231, 1, 0.1960784, 0, 1,
-1.919392, 0.6777189, -2.32353, 1, 0.2039216, 0, 1,
-1.909799, -0.07943423, -0.6234472, 1, 0.2117647, 0, 1,
-1.87898, 0.7575625, -1.891283, 1, 0.2156863, 0, 1,
-1.872273, 0.3681815, -2.568891, 1, 0.2235294, 0, 1,
-1.856431, -1.238025, -1.067395, 1, 0.227451, 0, 1,
-1.849454, -0.4603316, -4.056918, 1, 0.2352941, 0, 1,
-1.80834, -0.9922104, -4.000576, 1, 0.2392157, 0, 1,
-1.780577, -0.9603752, -2.730305, 1, 0.2470588, 0, 1,
-1.777585, -1.171609, -2.092903, 1, 0.2509804, 0, 1,
-1.765637, -0.1366856, -0.4463759, 1, 0.2588235, 0, 1,
-1.764784, 0.3645941, -1.454772, 1, 0.2627451, 0, 1,
-1.763024, 1.786116, -2.369318, 1, 0.2705882, 0, 1,
-1.740554, -0.207606, -4.172992, 1, 0.2745098, 0, 1,
-1.736741, 1.147859, -1.688709, 1, 0.282353, 0, 1,
-1.729225, -1.303669, -3.756733, 1, 0.2862745, 0, 1,
-1.724042, -0.9333734, -1.496921, 1, 0.2941177, 0, 1,
-1.721533, -0.4225331, -4.08587, 1, 0.3019608, 0, 1,
-1.717592, 0.3270081, 0.2006762, 1, 0.3058824, 0, 1,
-1.716654, 1.13948, -0.536436, 1, 0.3137255, 0, 1,
-1.686373, -0.7897614, -2.947828, 1, 0.3176471, 0, 1,
-1.68091, -1.186026, -1.507902, 1, 0.3254902, 0, 1,
-1.679131, -1.219774, -1.57236, 1, 0.3294118, 0, 1,
-1.670593, -0.7186264, -2.853703, 1, 0.3372549, 0, 1,
-1.666074, 1.073228, -0.9379475, 1, 0.3411765, 0, 1,
-1.640259, -1.022197, -1.863388, 1, 0.3490196, 0, 1,
-1.638506, -0.6873097, -2.020813, 1, 0.3529412, 0, 1,
-1.631067, -0.7101867, -1.866205, 1, 0.3607843, 0, 1,
-1.630359, -0.9696151, -2.523353, 1, 0.3647059, 0, 1,
-1.602765, 0.5668046, -2.815457, 1, 0.372549, 0, 1,
-1.582839, -0.08701767, -1.366586, 1, 0.3764706, 0, 1,
-1.572095, -1.423964, -1.148294, 1, 0.3843137, 0, 1,
-1.565017, -0.7956879, -0.5592179, 1, 0.3882353, 0, 1,
-1.560573, 0.3173746, -1.617869, 1, 0.3960784, 0, 1,
-1.544114, -0.07285339, -0.08653195, 1, 0.4039216, 0, 1,
-1.542456, -0.6543753, -0.5740491, 1, 0.4078431, 0, 1,
-1.541951, 0.3962222, -2.218191, 1, 0.4156863, 0, 1,
-1.540026, -0.07318348, -2.244781, 1, 0.4196078, 0, 1,
-1.538533, -1.211045, -2.797096, 1, 0.427451, 0, 1,
-1.536865, 0.2532807, -0.5599773, 1, 0.4313726, 0, 1,
-1.529582, -0.5549282, -3.219518, 1, 0.4392157, 0, 1,
-1.523644, 1.773371, -2.056615, 1, 0.4431373, 0, 1,
-1.521829, 0.06757077, -2.823998, 1, 0.4509804, 0, 1,
-1.518961, -0.7819197, -2.04916, 1, 0.454902, 0, 1,
-1.517033, -1.334702, -3.500505, 1, 0.4627451, 0, 1,
-1.494699, 0.2598016, -1.737576, 1, 0.4666667, 0, 1,
-1.482411, 1.061787, -1.144905, 1, 0.4745098, 0, 1,
-1.479814, 1.022236, -2.384081, 1, 0.4784314, 0, 1,
-1.474541, -0.9149076, -2.285967, 1, 0.4862745, 0, 1,
-1.474322, 0.4801412, -0.4961697, 1, 0.4901961, 0, 1,
-1.474065, 0.8190188, -1.314703, 1, 0.4980392, 0, 1,
-1.460633, 0.04696883, -0.5830167, 1, 0.5058824, 0, 1,
-1.453465, -1.05487, -1.570542, 1, 0.509804, 0, 1,
-1.448277, 0.7859774, -1.482267, 1, 0.5176471, 0, 1,
-1.445461, 1.27579, 0.1913468, 1, 0.5215687, 0, 1,
-1.422413, -0.3217792, -0.4643524, 1, 0.5294118, 0, 1,
-1.420501, -1.369669, -4.275596, 1, 0.5333334, 0, 1,
-1.412431, -0.0530589, -1.461383, 1, 0.5411765, 0, 1,
-1.412012, -1.235117, -1.703712, 1, 0.5450981, 0, 1,
-1.402712, 0.8150199, -2.567106, 1, 0.5529412, 0, 1,
-1.386171, 0.3731834, -0.6661209, 1, 0.5568628, 0, 1,
-1.374184, 0.4537158, -0.8060299, 1, 0.5647059, 0, 1,
-1.37347, -1.035935, -2.578862, 1, 0.5686275, 0, 1,
-1.362928, 1.801452, -0.9330714, 1, 0.5764706, 0, 1,
-1.353666, -0.9853866, -0.7060847, 1, 0.5803922, 0, 1,
-1.352637, -0.22503, -1.470562, 1, 0.5882353, 0, 1,
-1.342514, 1.133715, -0.005569116, 1, 0.5921569, 0, 1,
-1.325061, -1.066345, -0.008439763, 1, 0.6, 0, 1,
-1.31988, 0.9284078, -1.774104, 1, 0.6078432, 0, 1,
-1.314956, -0.781327, 0.676616, 1, 0.6117647, 0, 1,
-1.309631, -0.3115603, -2.454491, 1, 0.6196079, 0, 1,
-1.30722, -0.3967502, -3.129253, 1, 0.6235294, 0, 1,
-1.307176, -0.40751, -2.133104, 1, 0.6313726, 0, 1,
-1.290844, -1.410456, -3.7342, 1, 0.6352941, 0, 1,
-1.290019, 1.093983, -0.6396261, 1, 0.6431373, 0, 1,
-1.281975, 1.031342, -1.928824, 1, 0.6470588, 0, 1,
-1.278991, -3.23882, -3.689303, 1, 0.654902, 0, 1,
-1.27504, 0.6003312, -3.479366, 1, 0.6588235, 0, 1,
-1.273267, -2.17111, -2.683394, 1, 0.6666667, 0, 1,
-1.272988, 1.159152, -1.624892, 1, 0.6705883, 0, 1,
-1.27296, 0.1995986, -1.626816, 1, 0.6784314, 0, 1,
-1.260005, 1.382596, -2.06935, 1, 0.682353, 0, 1,
-1.241853, -1.037729, -1.545674, 1, 0.6901961, 0, 1,
-1.238543, -0.02481483, -0.6146886, 1, 0.6941177, 0, 1,
-1.23795, -0.2717031, -0.4329426, 1, 0.7019608, 0, 1,
-1.233598, -0.5345968, -1.106566, 1, 0.7098039, 0, 1,
-1.230824, -0.29758, -2.331694, 1, 0.7137255, 0, 1,
-1.226298, 0.9317885, -2.41821, 1, 0.7215686, 0, 1,
-1.186378, -0.2153987, -0.3949042, 1, 0.7254902, 0, 1,
-1.18184, 0.6995562, -0.7789187, 1, 0.7333333, 0, 1,
-1.174851, -1.008439, -0.7899025, 1, 0.7372549, 0, 1,
-1.168806, -1.142098, -2.278155, 1, 0.7450981, 0, 1,
-1.166888, -1.249173, -0.8426307, 1, 0.7490196, 0, 1,
-1.162264, 0.937926, -0.7447093, 1, 0.7568628, 0, 1,
-1.161709, 0.582945, -1.753875, 1, 0.7607843, 0, 1,
-1.158968, -1.151628, -3.096529, 1, 0.7686275, 0, 1,
-1.15494, -0.2045381, -0.2401065, 1, 0.772549, 0, 1,
-1.137579, -1.876238, -1.498065, 1, 0.7803922, 0, 1,
-1.132414, -1.347632, -4.058085, 1, 0.7843137, 0, 1,
-1.131092, 1.198814, -3.186507, 1, 0.7921569, 0, 1,
-1.128796, -0.1866728, -0.2038578, 1, 0.7960784, 0, 1,
-1.12789, 1.178411, -0.4338323, 1, 0.8039216, 0, 1,
-1.119008, 0.2973373, -1.511165, 1, 0.8117647, 0, 1,
-1.117236, 0.3457738, -2.071991, 1, 0.8156863, 0, 1,
-1.104829, 0.6802573, -0.533151, 1, 0.8235294, 0, 1,
-1.101596, -0.4672748, -2.304994, 1, 0.827451, 0, 1,
-1.100937, 1.125522, -0.1858259, 1, 0.8352941, 0, 1,
-1.095972, -1.505328, -2.453328, 1, 0.8392157, 0, 1,
-1.083905, 1.592203, 0.6104942, 1, 0.8470588, 0, 1,
-1.077196, -0.6434506, -2.367452, 1, 0.8509804, 0, 1,
-1.07403, -1.629779, -3.099386, 1, 0.8588235, 0, 1,
-1.072886, 0.5679466, -0.4498787, 1, 0.8627451, 0, 1,
-1.0678, -0.8697967, -1.756601, 1, 0.8705882, 0, 1,
-1.065004, 0.07096104, -1.044828, 1, 0.8745098, 0, 1,
-1.061995, -0.3373937, -2.335492, 1, 0.8823529, 0, 1,
-1.053912, 0.3800302, -2.027278, 1, 0.8862745, 0, 1,
-1.053004, 1.369568, 0.1243351, 1, 0.8941177, 0, 1,
-1.051555, -0.6483442, -1.778221, 1, 0.8980392, 0, 1,
-1.049574, -0.8236203, -3.442779, 1, 0.9058824, 0, 1,
-1.048119, 1.284452, 0.3709791, 1, 0.9137255, 0, 1,
-1.042283, 0.7960259, -0.742999, 1, 0.9176471, 0, 1,
-1.04144, 0.6493335, -0.9943129, 1, 0.9254902, 0, 1,
-1.035082, 0.4782429, -0.2169001, 1, 0.9294118, 0, 1,
-1.031929, -2.288152, -2.907792, 1, 0.9372549, 0, 1,
-1.031238, -2.079768, -2.602046, 1, 0.9411765, 0, 1,
-1.029272, 1.599757, -0.1560358, 1, 0.9490196, 0, 1,
-1.026067, -0.4274414, 0.121324, 1, 0.9529412, 0, 1,
-1.006655, -1.099949, -2.963522, 1, 0.9607843, 0, 1,
-1.0056, 0.3840159, -0.7682655, 1, 0.9647059, 0, 1,
-1.003117, 0.3613071, -1.434542, 1, 0.972549, 0, 1,
-1.002995, 0.7006854, -0.8339615, 1, 0.9764706, 0, 1,
-0.9906881, 1.643109, -0.4333708, 1, 0.9843137, 0, 1,
-0.9877095, -0.5299658, -0.5312169, 1, 0.9882353, 0, 1,
-0.9869324, 1.783443, -0.6758842, 1, 0.9960784, 0, 1,
-0.9855266, -1.026604, -1.841123, 0.9960784, 1, 0, 1,
-0.9854044, -0.8540161, -2.793389, 0.9921569, 1, 0, 1,
-0.9831959, -0.01154373, -1.013158, 0.9843137, 1, 0, 1,
-0.9830878, 0.6966524, -1.070611, 0.9803922, 1, 0, 1,
-0.9827766, 0.3944591, 0.0512811, 0.972549, 1, 0, 1,
-0.9826506, -0.7748874, -2.998844, 0.9686275, 1, 0, 1,
-0.9825333, 0.3618028, -2.645483, 0.9607843, 1, 0, 1,
-0.9789869, 0.2634621, -1.050699, 0.9568627, 1, 0, 1,
-0.9707313, -0.4970182, -3.314824, 0.9490196, 1, 0, 1,
-0.9674024, -1.914014, -2.12321, 0.945098, 1, 0, 1,
-0.9581524, -0.9910912, -2.484991, 0.9372549, 1, 0, 1,
-0.9541003, -1.908315, -3.876432, 0.9333333, 1, 0, 1,
-0.9529991, -0.0365911, -2.43837, 0.9254902, 1, 0, 1,
-0.9469426, 2.233489, -1.708885, 0.9215686, 1, 0, 1,
-0.9463573, -0.299413, -2.125547, 0.9137255, 1, 0, 1,
-0.9457594, -0.1711266, -1.447924, 0.9098039, 1, 0, 1,
-0.934448, 0.4805537, -1.374835, 0.9019608, 1, 0, 1,
-0.9317331, 0.8364905, -1.980024, 0.8941177, 1, 0, 1,
-0.9261966, -0.3529587, -1.821915, 0.8901961, 1, 0, 1,
-0.9246312, -1.418817, -2.748114, 0.8823529, 1, 0, 1,
-0.9146076, 1.29282, -2.346023, 0.8784314, 1, 0, 1,
-0.9125006, -0.08833571, -3.023612, 0.8705882, 1, 0, 1,
-0.9016828, 0.6657487, -1.145978, 0.8666667, 1, 0, 1,
-0.9005359, -0.9397568, -2.325806, 0.8588235, 1, 0, 1,
-0.8889023, 0.02496488, -2.864177, 0.854902, 1, 0, 1,
-0.8835402, 0.7145898, -0.4034298, 0.8470588, 1, 0, 1,
-0.8784089, 0.5321744, -2.199185, 0.8431373, 1, 0, 1,
-0.8736684, 0.1484459, 0.5822109, 0.8352941, 1, 0, 1,
-0.87242, -0.6202568, 0.2393199, 0.8313726, 1, 0, 1,
-0.869997, -1.151605, -2.391022, 0.8235294, 1, 0, 1,
-0.8609974, -0.8158067, -2.109239, 0.8196079, 1, 0, 1,
-0.8590096, 0.08150278, -0.545494, 0.8117647, 1, 0, 1,
-0.8587548, -4.067155, -2.362708, 0.8078431, 1, 0, 1,
-0.8448103, -0.1768396, -2.26011, 0.8, 1, 0, 1,
-0.843446, -0.8067108, -1.059841, 0.7921569, 1, 0, 1,
-0.8383581, -0.3364826, -4.165907, 0.7882353, 1, 0, 1,
-0.8357789, 0.2780716, -1.217936, 0.7803922, 1, 0, 1,
-0.8335515, -0.5952951, -1.380322, 0.7764706, 1, 0, 1,
-0.8325114, 0.4690883, 0.3610237, 0.7686275, 1, 0, 1,
-0.8309269, 1.192181, -1.667844, 0.7647059, 1, 0, 1,
-0.830587, -0.1759079, -3.053355, 0.7568628, 1, 0, 1,
-0.8303747, -1.770087, -0.9004793, 0.7529412, 1, 0, 1,
-0.8264049, -0.867036, -0.3171289, 0.7450981, 1, 0, 1,
-0.8218552, 1.588387, -0.5405338, 0.7411765, 1, 0, 1,
-0.8209861, -0.4246656, -2.485772, 0.7333333, 1, 0, 1,
-0.8192964, -0.5284268, -2.709561, 0.7294118, 1, 0, 1,
-0.8155618, -0.9259481, -2.254055, 0.7215686, 1, 0, 1,
-0.8150855, 1.066475, 0.600802, 0.7176471, 1, 0, 1,
-0.8065166, 1.139657, -0.005699833, 0.7098039, 1, 0, 1,
-0.8028426, -0.09644965, -2.412887, 0.7058824, 1, 0, 1,
-0.8020886, 0.1042628, -2.116499, 0.6980392, 1, 0, 1,
-0.7958144, -0.2742627, -0.9116293, 0.6901961, 1, 0, 1,
-0.7951226, -0.5046065, -2.592352, 0.6862745, 1, 0, 1,
-0.7841458, 0.3964107, -0.3907309, 0.6784314, 1, 0, 1,
-0.7798868, 0.9786474, -2.382486, 0.6745098, 1, 0, 1,
-0.7786027, -0.8940741, -2.950153, 0.6666667, 1, 0, 1,
-0.7718652, 0.8368908, -3.516932, 0.6627451, 1, 0, 1,
-0.7690728, 1.892955, 0.5252303, 0.654902, 1, 0, 1,
-0.7684359, -0.8256673, -3.373167, 0.6509804, 1, 0, 1,
-0.7668628, -0.02489285, -1.97674, 0.6431373, 1, 0, 1,
-0.76249, 1.653709, 0.03807158, 0.6392157, 1, 0, 1,
-0.7564887, 0.2387123, -1.748264, 0.6313726, 1, 0, 1,
-0.754944, 1.597011, -1.962327, 0.627451, 1, 0, 1,
-0.7511297, -1.398368, -1.584009, 0.6196079, 1, 0, 1,
-0.7483228, -0.2979081, -2.250761, 0.6156863, 1, 0, 1,
-0.7465253, -1.314969, -1.183502, 0.6078432, 1, 0, 1,
-0.7408242, -0.2847078, -0.968086, 0.6039216, 1, 0, 1,
-0.740413, 0.3885793, -1.954675, 0.5960785, 1, 0, 1,
-0.7384055, -0.3324108, -0.8509855, 0.5882353, 1, 0, 1,
-0.7300012, -1.049441, -2.251009, 0.5843138, 1, 0, 1,
-0.729544, -0.6082101, -1.016446, 0.5764706, 1, 0, 1,
-0.7246643, 0.4602682, -1.04362, 0.572549, 1, 0, 1,
-0.7246189, -1.13246, -1.604061, 0.5647059, 1, 0, 1,
-0.723935, -0.190249, -2.708966, 0.5607843, 1, 0, 1,
-0.7216884, -0.2174475, -1.911169, 0.5529412, 1, 0, 1,
-0.7187696, -0.8413712, -0.7928253, 0.5490196, 1, 0, 1,
-0.7170152, -0.3371364, -1.616437, 0.5411765, 1, 0, 1,
-0.7147108, -0.622632, -4.85441, 0.5372549, 1, 0, 1,
-0.7127803, -0.5621454, -2.555827, 0.5294118, 1, 0, 1,
-0.7117664, 2.595648, -0.4708479, 0.5254902, 1, 0, 1,
-0.7071462, 0.3539015, -0.06654231, 0.5176471, 1, 0, 1,
-0.7064474, -0.7167595, -2.685328, 0.5137255, 1, 0, 1,
-0.7050055, -0.1230331, -0.9149572, 0.5058824, 1, 0, 1,
-0.701458, 0.4529937, -0.518711, 0.5019608, 1, 0, 1,
-0.7001856, -0.596325, -2.029745, 0.4941176, 1, 0, 1,
-0.7000387, 0.01108171, -1.444344, 0.4862745, 1, 0, 1,
-0.6988002, 0.6897709, -1.295074, 0.4823529, 1, 0, 1,
-0.6896933, -0.03309399, -1.844361, 0.4745098, 1, 0, 1,
-0.6896613, -0.05893406, -2.455417, 0.4705882, 1, 0, 1,
-0.6894603, 1.239686, -0.03769994, 0.4627451, 1, 0, 1,
-0.6849912, 0.2684051, -0.8058032, 0.4588235, 1, 0, 1,
-0.6833518, -0.2978307, -1.201797, 0.4509804, 1, 0, 1,
-0.6809033, -0.8835467, -3.546762, 0.4470588, 1, 0, 1,
-0.6780192, 0.4729387, -2.038368, 0.4392157, 1, 0, 1,
-0.6654644, -0.8650203, -2.222759, 0.4352941, 1, 0, 1,
-0.6614125, 1.826187, -1.943015, 0.427451, 1, 0, 1,
-0.6599903, 0.1542367, -1.371664, 0.4235294, 1, 0, 1,
-0.6552884, 0.4611711, 0.654341, 0.4156863, 1, 0, 1,
-0.6513825, 0.6662526, -0.6265499, 0.4117647, 1, 0, 1,
-0.6433631, -0.04162889, -1.788267, 0.4039216, 1, 0, 1,
-0.6415227, -0.784716, -2.853397, 0.3960784, 1, 0, 1,
-0.6367072, 0.02096489, -1.851408, 0.3921569, 1, 0, 1,
-0.6356807, -1.543031, -3.647842, 0.3843137, 1, 0, 1,
-0.6222858, -0.4097627, -0.8962224, 0.3803922, 1, 0, 1,
-0.6216623, -0.1833109, -3.009379, 0.372549, 1, 0, 1,
-0.6202277, -0.1040229, -3.008581, 0.3686275, 1, 0, 1,
-0.6198249, 0.5785328, -1.327819, 0.3607843, 1, 0, 1,
-0.6162416, -0.7414616, -3.912811, 0.3568628, 1, 0, 1,
-0.6142929, 0.1496424, -0.6420732, 0.3490196, 1, 0, 1,
-0.6121873, -0.2686256, -3.117585, 0.345098, 1, 0, 1,
-0.6114877, -0.1230312, -1.692963, 0.3372549, 1, 0, 1,
-0.6113943, -0.7767672, -3.69579, 0.3333333, 1, 0, 1,
-0.610707, 0.3552721, -0.5135722, 0.3254902, 1, 0, 1,
-0.610453, -1.508486, -2.508259, 0.3215686, 1, 0, 1,
-0.6050664, 0.5920169, 0.1082494, 0.3137255, 1, 0, 1,
-0.6014864, 1.65496, -1.427243, 0.3098039, 1, 0, 1,
-0.5997336, -0.9758083, -4.014884, 0.3019608, 1, 0, 1,
-0.5960304, -1.940524, -3.920246, 0.2941177, 1, 0, 1,
-0.595874, 0.6785249, -0.2686389, 0.2901961, 1, 0, 1,
-0.5901585, 0.3469733, -0.7838727, 0.282353, 1, 0, 1,
-0.5876586, 0.5780927, -2.342718, 0.2784314, 1, 0, 1,
-0.5847188, 0.2157303, -1.694705, 0.2705882, 1, 0, 1,
-0.5823349, -0.6958919, -3.333614, 0.2666667, 1, 0, 1,
-0.5820675, 1.502123, -0.5667049, 0.2588235, 1, 0, 1,
-0.5798652, 0.3544148, -1.171522, 0.254902, 1, 0, 1,
-0.5779688, -0.1281243, -2.167681, 0.2470588, 1, 0, 1,
-0.5778545, 0.2596146, -0.9939392, 0.2431373, 1, 0, 1,
-0.5732183, 0.5105144, -0.9374172, 0.2352941, 1, 0, 1,
-0.569213, -0.7669253, -3.57779, 0.2313726, 1, 0, 1,
-0.5684977, -0.04890302, -1.460954, 0.2235294, 1, 0, 1,
-0.5678333, -0.5974975, -2.182686, 0.2196078, 1, 0, 1,
-0.5674, -0.563129, -2.000651, 0.2117647, 1, 0, 1,
-0.5665781, 0.8210909, 0.7568402, 0.2078431, 1, 0, 1,
-0.5663629, -0.8493848, -1.864942, 0.2, 1, 0, 1,
-0.5661467, -0.7384793, -1.932281, 0.1921569, 1, 0, 1,
-0.5628512, -0.3647043, -1.833, 0.1882353, 1, 0, 1,
-0.5625266, -1.560016, -3.372945, 0.1803922, 1, 0, 1,
-0.5623661, -0.3923533, -3.639441, 0.1764706, 1, 0, 1,
-0.5601293, 0.1515004, 0.5025257, 0.1686275, 1, 0, 1,
-0.5588782, 1.010911, -1.909729, 0.1647059, 1, 0, 1,
-0.5522473, 1.275399, -1.711424, 0.1568628, 1, 0, 1,
-0.5516763, 0.1491951, -2.641178, 0.1529412, 1, 0, 1,
-0.5463568, 1.0071, -2.358565, 0.145098, 1, 0, 1,
-0.5427724, -0.7463518, -2.816788, 0.1411765, 1, 0, 1,
-0.5363526, -1.065052, -2.322263, 0.1333333, 1, 0, 1,
-0.5349026, -0.1913652, -1.588617, 0.1294118, 1, 0, 1,
-0.5207338, -0.7947061, -2.312752, 0.1215686, 1, 0, 1,
-0.5149902, 1.312306, -1.508639, 0.1176471, 1, 0, 1,
-0.5138203, -0.7682571, -1.299844, 0.1098039, 1, 0, 1,
-0.5131959, -0.0856494, 0.440584, 0.1058824, 1, 0, 1,
-0.5121596, -0.4727184, -3.50384, 0.09803922, 1, 0, 1,
-0.507266, 1.320999, -0.5101917, 0.09019608, 1, 0, 1,
-0.5059258, -0.3187638, -3.52348, 0.08627451, 1, 0, 1,
-0.5001639, -0.3875848, -1.426887, 0.07843138, 1, 0, 1,
-0.494849, -0.2817237, -0.5904785, 0.07450981, 1, 0, 1,
-0.4934386, -0.5617067, -3.868964, 0.06666667, 1, 0, 1,
-0.4875017, 0.4972882, -0.03450953, 0.0627451, 1, 0, 1,
-0.4845587, 0.3635449, -3.637895, 0.05490196, 1, 0, 1,
-0.4844831, 0.2530674, -0.8979807, 0.05098039, 1, 0, 1,
-0.4759198, -0.9215573, -1.497391, 0.04313726, 1, 0, 1,
-0.4722156, 0.0884806, -1.795356, 0.03921569, 1, 0, 1,
-0.4690489, 1.178723, -1.098198, 0.03137255, 1, 0, 1,
-0.4650311, 1.281141, 0.9878196, 0.02745098, 1, 0, 1,
-0.4648471, -0.09322079, -2.406333, 0.01960784, 1, 0, 1,
-0.4628945, -0.7073778, -3.254109, 0.01568628, 1, 0, 1,
-0.4627708, -1.081986, -2.204987, 0.007843138, 1, 0, 1,
-0.462137, 1.409508, 0.06754939, 0.003921569, 1, 0, 1,
-0.4560063, 0.2760906, -2.500597, 0, 1, 0.003921569, 1,
-0.455353, 0.2673852, -2.978431, 0, 1, 0.01176471, 1,
-0.4540239, -0.4364715, -2.275782, 0, 1, 0.01568628, 1,
-0.4538026, -0.5809016, -2.022571, 0, 1, 0.02352941, 1,
-0.4530508, 1.227848, 0.6069712, 0, 1, 0.02745098, 1,
-0.4514125, 0.1302448, -0.8589591, 0, 1, 0.03529412, 1,
-0.4500672, -0.5930883, -2.387819, 0, 1, 0.03921569, 1,
-0.4480816, 0.01844337, -0.7546282, 0, 1, 0.04705882, 1,
-0.4472208, 0.9189391, 0.3030952, 0, 1, 0.05098039, 1,
-0.4445781, -0.08356692, -3.494654, 0, 1, 0.05882353, 1,
-0.4432768, 0.7613252, -1.059079, 0, 1, 0.0627451, 1,
-0.4377776, -0.949769, -4.616168, 0, 1, 0.07058824, 1,
-0.4328445, 0.1612843, -2.715914, 0, 1, 0.07450981, 1,
-0.4326492, 1.429285, -0.1272574, 0, 1, 0.08235294, 1,
-0.4323444, 0.2676302, -0.05714322, 0, 1, 0.08627451, 1,
-0.4302324, 0.1676757, -2.049886, 0, 1, 0.09411765, 1,
-0.4233382, -0.2030546, -3.045013, 0, 1, 0.1019608, 1,
-0.4212334, 0.02725573, -2.215282, 0, 1, 0.1058824, 1,
-0.4159729, -0.2100873, -1.210808, 0, 1, 0.1137255, 1,
-0.4083006, 1.643594, -0.6699543, 0, 1, 0.1176471, 1,
-0.4076837, -0.3185379, -0.791907, 0, 1, 0.1254902, 1,
-0.4073132, -1.333519, -2.754853, 0, 1, 0.1294118, 1,
-0.3978947, 0.1299154, -2.811956, 0, 1, 0.1372549, 1,
-0.3950511, 0.1847519, -0.9145913, 0, 1, 0.1411765, 1,
-0.3895409, 1.434606, 0.9790758, 0, 1, 0.1490196, 1,
-0.3885702, 0.7632742, -0.9046063, 0, 1, 0.1529412, 1,
-0.388368, 0.8330774, 1.006695, 0, 1, 0.1607843, 1,
-0.3870771, -1.315136, -1.876979, 0, 1, 0.1647059, 1,
-0.3857061, -0.6572968, -2.12167, 0, 1, 0.172549, 1,
-0.3815893, 0.6008223, 0.1304188, 0, 1, 0.1764706, 1,
-0.378829, 0.7918098, -0.2664597, 0, 1, 0.1843137, 1,
-0.3741669, 0.8373753, 0.9523901, 0, 1, 0.1882353, 1,
-0.3732645, 0.2953957, -0.2785429, 0, 1, 0.1960784, 1,
-0.3707581, 0.03844737, -1.539606, 0, 1, 0.2039216, 1,
-0.3695967, -0.400025, -2.273946, 0, 1, 0.2078431, 1,
-0.3694832, -0.07528412, 0.5621496, 0, 1, 0.2156863, 1,
-0.3673543, -0.6095161, -0.6520938, 0, 1, 0.2196078, 1,
-0.3669683, -0.3541592, -1.680902, 0, 1, 0.227451, 1,
-0.3660467, -0.2457943, -3.486958, 0, 1, 0.2313726, 1,
-0.3608188, -0.740324, -2.810672, 0, 1, 0.2392157, 1,
-0.3604589, 1.966688, -1.278829, 0, 1, 0.2431373, 1,
-0.3581503, 0.4410374, -2.477398, 0, 1, 0.2509804, 1,
-0.3567168, -0.756887, -3.050407, 0, 1, 0.254902, 1,
-0.3562833, -1.973367, -4.680458, 0, 1, 0.2627451, 1,
-0.3526898, 1.614361, -1.679067, 0, 1, 0.2666667, 1,
-0.3485537, 1.097722, -1.229949, 0, 1, 0.2745098, 1,
-0.3433193, -1.561548, -2.362888, 0, 1, 0.2784314, 1,
-0.339465, 1.110474, -3.252244, 0, 1, 0.2862745, 1,
-0.335413, -0.2650542, -3.391751, 0, 1, 0.2901961, 1,
-0.3350809, 0.009870351, -0.9228294, 0, 1, 0.2980392, 1,
-0.329214, 0.9433436, -0.08151338, 0, 1, 0.3058824, 1,
-0.3250076, 0.2502515, -2.045725, 0, 1, 0.3098039, 1,
-0.3219081, 0.757954, 1.505975, 0, 1, 0.3176471, 1,
-0.3165193, -0.2445096, -1.892386, 0, 1, 0.3215686, 1,
-0.3095196, 0.7100828, -2.038188, 0, 1, 0.3294118, 1,
-0.3091366, 0.1097552, 0.07983442, 0, 1, 0.3333333, 1,
-0.3075351, -1.37162, -4.109443, 0, 1, 0.3411765, 1,
-0.3062715, -0.2975522, -3.215241, 0, 1, 0.345098, 1,
-0.3055713, 1.101976, -1.749377, 0, 1, 0.3529412, 1,
-0.3017274, 0.6495922, -0.0143077, 0, 1, 0.3568628, 1,
-0.3004861, 0.6705952, -0.2985169, 0, 1, 0.3647059, 1,
-0.2966946, -0.4075862, -3.690152, 0, 1, 0.3686275, 1,
-0.2965644, 0.4912588, 0.7098757, 0, 1, 0.3764706, 1,
-0.290724, 0.2339209, -1.246033, 0, 1, 0.3803922, 1,
-0.2885887, -0.6100808, -2.372251, 0, 1, 0.3882353, 1,
-0.2874761, -1.465016, -3.325717, 0, 1, 0.3921569, 1,
-0.2841725, -0.7470074, -1.644076, 0, 1, 0.4, 1,
-0.2830953, -0.005161518, -1.496396, 0, 1, 0.4078431, 1,
-0.282321, -1.092111, -1.786508, 0, 1, 0.4117647, 1,
-0.2809169, -0.9060535, -2.147297, 0, 1, 0.4196078, 1,
-0.2787841, 0.5425332, -1.091428, 0, 1, 0.4235294, 1,
-0.2767178, -0.4903559, -1.515556, 0, 1, 0.4313726, 1,
-0.2751219, -0.7423345, -3.362776, 0, 1, 0.4352941, 1,
-0.2723869, -0.1419552, -2.004408, 0, 1, 0.4431373, 1,
-0.2687058, 0.4236225, -1.273559, 0, 1, 0.4470588, 1,
-0.2679392, 1.813349, 1.322071, 0, 1, 0.454902, 1,
-0.2649803, -0.7702169, -2.637225, 0, 1, 0.4588235, 1,
-0.2639714, 1.421909, -1.414426, 0, 1, 0.4666667, 1,
-0.2625067, -0.5658536, -2.520531, 0, 1, 0.4705882, 1,
-0.2580146, 0.2127632, -3.094615, 0, 1, 0.4784314, 1,
-0.2473303, 1.06112, 0.02005445, 0, 1, 0.4823529, 1,
-0.2459877, 0.07218973, -2.068818, 0, 1, 0.4901961, 1,
-0.244157, -0.88278, -2.472205, 0, 1, 0.4941176, 1,
-0.2410737, -0.9729003, -5.35043, 0, 1, 0.5019608, 1,
-0.2369321, 1.312876, 0.9574303, 0, 1, 0.509804, 1,
-0.2301158, 1.891288, -0.8386858, 0, 1, 0.5137255, 1,
-0.22787, 0.1411321, -0.7686085, 0, 1, 0.5215687, 1,
-0.2255575, -0.9181353, -2.15515, 0, 1, 0.5254902, 1,
-0.2215449, 0.2066536, 0.4783269, 0, 1, 0.5333334, 1,
-0.2200534, -1.914531, -3.845818, 0, 1, 0.5372549, 1,
-0.2156948, 0.7877396, -0.6173306, 0, 1, 0.5450981, 1,
-0.2135106, 0.8942949, -1.570638, 0, 1, 0.5490196, 1,
-0.2095044, -0.1319735, -1.345622, 0, 1, 0.5568628, 1,
-0.2093382, 2.221932, -0.05382062, 0, 1, 0.5607843, 1,
-0.2078294, -0.3734709, -4.846156, 0, 1, 0.5686275, 1,
-0.2039256, -0.01675723, -2.675519, 0, 1, 0.572549, 1,
-0.2038347, -1.611409, -2.093424, 0, 1, 0.5803922, 1,
-0.2033682, -1.144879, -2.562667, 0, 1, 0.5843138, 1,
-0.2002032, -0.002358398, -0.9036785, 0, 1, 0.5921569, 1,
-0.1972119, 0.6623161, -1.394132, 0, 1, 0.5960785, 1,
-0.1947603, -0.4992366, -2.545401, 0, 1, 0.6039216, 1,
-0.1940324, 0.6327633, 0.08611027, 0, 1, 0.6117647, 1,
-0.1908568, -0.1061199, -0.9040828, 0, 1, 0.6156863, 1,
-0.1903071, -0.2177308, -2.790041, 0, 1, 0.6235294, 1,
-0.1885625, -0.2590446, -1.607423, 0, 1, 0.627451, 1,
-0.1780054, -0.1651013, -2.567715, 0, 1, 0.6352941, 1,
-0.1754749, -1.057457, -1.38115, 0, 1, 0.6392157, 1,
-0.1645598, -0.2992652, -1.424482, 0, 1, 0.6470588, 1,
-0.1618518, 0.7783451, -0.7376266, 0, 1, 0.6509804, 1,
-0.1605349, -0.8341455, -3.397731, 0, 1, 0.6588235, 1,
-0.1570946, -0.9625623, -2.773256, 0, 1, 0.6627451, 1,
-0.1570483, -2.129131, -2.703652, 0, 1, 0.6705883, 1,
-0.1562735, 0.6376548, 0.2151151, 0, 1, 0.6745098, 1,
-0.1535437, 0.04871653, -0.03046728, 0, 1, 0.682353, 1,
-0.152204, 1.429209, 0.3907982, 0, 1, 0.6862745, 1,
-0.1507858, 0.4603141, 0.11077, 0, 1, 0.6941177, 1,
-0.1499769, 1.164814, 0.2429644, 0, 1, 0.7019608, 1,
-0.1452544, -1.59864, -3.458269, 0, 1, 0.7058824, 1,
-0.14478, -0.2259938, -1.754976, 0, 1, 0.7137255, 1,
-0.1413825, -0.5944158, -3.561833, 0, 1, 0.7176471, 1,
-0.139156, 0.6187207, -0.3200547, 0, 1, 0.7254902, 1,
-0.138014, 1.540166, -0.2833674, 0, 1, 0.7294118, 1,
-0.1376805, -0.3510385, -2.134827, 0, 1, 0.7372549, 1,
-0.1366301, 1.292709, 2.711674, 0, 1, 0.7411765, 1,
-0.1355396, 0.1727025, -2.959163, 0, 1, 0.7490196, 1,
-0.1267084, 0.6480768, -0.574071, 0, 1, 0.7529412, 1,
-0.1220022, -0.3197453, -2.535131, 0, 1, 0.7607843, 1,
-0.1174107, 1.247315, -0.327968, 0, 1, 0.7647059, 1,
-0.1150556, -0.3991977, -2.895048, 0, 1, 0.772549, 1,
-0.1108114, 0.8678046, 0.06219891, 0, 1, 0.7764706, 1,
-0.1033033, -0.2164485, -2.432361, 0, 1, 0.7843137, 1,
-0.1024698, -0.09288958, -3.164965, 0, 1, 0.7882353, 1,
-0.1006083, -0.2582348, -4.414854, 0, 1, 0.7960784, 1,
-0.09979684, -0.2982424, -2.988373, 0, 1, 0.8039216, 1,
-0.09606647, 1.672267, -0.6729823, 0, 1, 0.8078431, 1,
-0.09423637, -1.087054, -4.653747, 0, 1, 0.8156863, 1,
-0.0868834, -0.9593665, -1.603291, 0, 1, 0.8196079, 1,
-0.08670749, -0.5029605, -3.117161, 0, 1, 0.827451, 1,
-0.08084716, 0.6055005, 0.2372866, 0, 1, 0.8313726, 1,
-0.0806805, -2.244918, -2.38781, 0, 1, 0.8392157, 1,
-0.07953186, -0.02842825, -1.629693, 0, 1, 0.8431373, 1,
-0.07647722, 0.09219842, -0.277997, 0, 1, 0.8509804, 1,
-0.07572065, 0.2763958, -0.794411, 0, 1, 0.854902, 1,
-0.07276577, -2.117703, -4.533837, 0, 1, 0.8627451, 1,
-0.07210042, -1.255611, -3.208022, 0, 1, 0.8666667, 1,
-0.07155173, 0.08520012, -0.9547752, 0, 1, 0.8745098, 1,
-0.07118221, -0.4941115, -2.245229, 0, 1, 0.8784314, 1,
-0.0705975, 0.1703873, -0.817552, 0, 1, 0.8862745, 1,
-0.07057008, -0.5732993, -2.376481, 0, 1, 0.8901961, 1,
-0.069394, 1.097417, -0.1442979, 0, 1, 0.8980392, 1,
-0.06883093, 2.024826, -1.40285, 0, 1, 0.9058824, 1,
-0.06825952, 1.659975, -1.158152, 0, 1, 0.9098039, 1,
-0.06774771, 0.321616, -0.6875767, 0, 1, 0.9176471, 1,
-0.06112994, -0.283621, -2.894652, 0, 1, 0.9215686, 1,
-0.06102791, 0.2405305, 1.007205, 0, 1, 0.9294118, 1,
-0.0598574, 1.004729, -0.5331243, 0, 1, 0.9333333, 1,
-0.0566899, 0.05578274, -1.1698, 0, 1, 0.9411765, 1,
-0.05623276, 1.026625, -0.09912559, 0, 1, 0.945098, 1,
-0.05389927, -0.7599486, -2.918942, 0, 1, 0.9529412, 1,
-0.05374373, -1.154755, -2.580637, 0, 1, 0.9568627, 1,
-0.05309082, 1.31548, 0.6793232, 0, 1, 0.9647059, 1,
-0.05004873, -0.4637621, -4.619142, 0, 1, 0.9686275, 1,
-0.04976283, -0.05151907, -2.438434, 0, 1, 0.9764706, 1,
-0.04945591, -1.365122, -2.908559, 0, 1, 0.9803922, 1,
-0.04513258, -1.813817, -4.191547, 0, 1, 0.9882353, 1,
-0.04434025, 0.352567, -0.2792711, 0, 1, 0.9921569, 1,
-0.03931832, 0.3689416, -0.5988917, 0, 1, 1, 1,
-0.03921436, 0.2313136, -1.125734, 0, 0.9921569, 1, 1,
-0.03847882, -0.5113524, -3.573998, 0, 0.9882353, 1, 1,
-0.03602973, -0.3764441, -3.999307, 0, 0.9803922, 1, 1,
-0.03481341, 1.19826, 0.08463858, 0, 0.9764706, 1, 1,
-0.03074337, -0.4921108, -4.035813, 0, 0.9686275, 1, 1,
-0.02995791, -0.5653303, -1.962978, 0, 0.9647059, 1, 1,
-0.02753264, 1.186986, -0.9323123, 0, 0.9568627, 1, 1,
-0.02410272, -0.2215137, -3.769068, 0, 0.9529412, 1, 1,
-0.0213436, 0.3998025, -1.108602, 0, 0.945098, 1, 1,
-0.01859607, -0.7421179, -4.357605, 0, 0.9411765, 1, 1,
-0.01664694, 1.313052, 1.569125, 0, 0.9333333, 1, 1,
-0.01640304, -0.4937018, -3.997874, 0, 0.9294118, 1, 1,
-0.01488671, 1.307058, -0.1801573, 0, 0.9215686, 1, 1,
-0.01245674, -2.449428, -4.256526, 0, 0.9176471, 1, 1,
-0.01196709, -0.05360349, -2.584683, 0, 0.9098039, 1, 1,
-0.01164592, 0.570642, 0.2549837, 0, 0.9058824, 1, 1,
-0.005948792, -0.6389479, -2.41794, 0, 0.8980392, 1, 1,
-0.003843591, 0.6149572, 2.137389, 0, 0.8901961, 1, 1,
-0.001373014, -0.8133008, -2.56333, 0, 0.8862745, 1, 1,
-0.000702535, -2.225313, -3.113606, 0, 0.8784314, 1, 1,
0.002505711, -2.216835, 2.361994, 0, 0.8745098, 1, 1,
0.005318094, 1.280023, -1.704035, 0, 0.8666667, 1, 1,
0.008797273, 0.7954399, 0.5560799, 0, 0.8627451, 1, 1,
0.01250246, -0.1888615, 2.300856, 0, 0.854902, 1, 1,
0.0156833, -0.1596642, 2.014457, 0, 0.8509804, 1, 1,
0.01703601, 0.4798633, -0.4805486, 0, 0.8431373, 1, 1,
0.02176685, 0.08377725, -0.114173, 0, 0.8392157, 1, 1,
0.02459448, -0.3859454, 2.937343, 0, 0.8313726, 1, 1,
0.02563569, -0.5159879, 4.521882, 0, 0.827451, 1, 1,
0.02668131, -0.01936121, 2.568651, 0, 0.8196079, 1, 1,
0.0267455, 0.8437222, -1.596277, 0, 0.8156863, 1, 1,
0.03080011, -1.383374, 2.703121, 0, 0.8078431, 1, 1,
0.03215416, 1.295423, -0.5158018, 0, 0.8039216, 1, 1,
0.03522725, -0.1695772, 3.110742, 0, 0.7960784, 1, 1,
0.04027735, 0.006229102, 0.5922091, 0, 0.7882353, 1, 1,
0.04264405, -0.04171405, 1.455757, 0, 0.7843137, 1, 1,
0.04303966, 0.1458481, 1.016419, 0, 0.7764706, 1, 1,
0.04521798, -0.3893014, 4.730102, 0, 0.772549, 1, 1,
0.05158795, 0.2567122, -0.2592216, 0, 0.7647059, 1, 1,
0.05196082, -0.5044392, 3.604975, 0, 0.7607843, 1, 1,
0.05648444, -2.497053, 2.353904, 0, 0.7529412, 1, 1,
0.05671198, -0.2224776, 3.631449, 0, 0.7490196, 1, 1,
0.05873683, 0.5879722, -1.07564, 0, 0.7411765, 1, 1,
0.05893822, -0.1101485, 1.558409, 0, 0.7372549, 1, 1,
0.06111688, -0.201087, 0.6297326, 0, 0.7294118, 1, 1,
0.06208181, -0.5139041, 4.272573, 0, 0.7254902, 1, 1,
0.06351002, 0.3838974, -1.262733, 0, 0.7176471, 1, 1,
0.06439923, -0.1373509, 2.492587, 0, 0.7137255, 1, 1,
0.06544261, 0.8742215, -0.7551939, 0, 0.7058824, 1, 1,
0.06599046, 1.94452, -0.6715833, 0, 0.6980392, 1, 1,
0.07004756, 1.506883, 0.977659, 0, 0.6941177, 1, 1,
0.07149912, -0.7668394, 3.182445, 0, 0.6862745, 1, 1,
0.07699919, 0.07820826, 0.5361136, 0, 0.682353, 1, 1,
0.07999026, 0.2526284, -0.4467503, 0, 0.6745098, 1, 1,
0.08066675, 0.920662, 1.152877, 0, 0.6705883, 1, 1,
0.0825595, 0.1456223, 0.5671308, 0, 0.6627451, 1, 1,
0.08421572, -1.034093, 2.220357, 0, 0.6588235, 1, 1,
0.08486724, 0.3013081, 0.1769691, 0, 0.6509804, 1, 1,
0.08602229, -1.0154, 2.874545, 0, 0.6470588, 1, 1,
0.08810827, -0.4612662, 3.497165, 0, 0.6392157, 1, 1,
0.09254736, -1.309854, 2.335765, 0, 0.6352941, 1, 1,
0.09411816, -0.4240148, 3.561158, 0, 0.627451, 1, 1,
0.09812887, -0.09897134, 3.642975, 0, 0.6235294, 1, 1,
0.099453, -0.2140019, 4.262185, 0, 0.6156863, 1, 1,
0.1004367, -0.7316837, 2.314585, 0, 0.6117647, 1, 1,
0.1008311, -0.41151, 3.175622, 0, 0.6039216, 1, 1,
0.1077695, -0.6243235, 2.187558, 0, 0.5960785, 1, 1,
0.1170186, -0.8075143, 3.817672, 0, 0.5921569, 1, 1,
0.1212748, -0.0009262405, 2.868424, 0, 0.5843138, 1, 1,
0.1251273, 0.365332, 2.761394, 0, 0.5803922, 1, 1,
0.1297109, 1.725038, -0.159522, 0, 0.572549, 1, 1,
0.1316943, -0.3038192, 1.318357, 0, 0.5686275, 1, 1,
0.133186, 0.460251, -0.1628659, 0, 0.5607843, 1, 1,
0.1361793, -0.8985872, 3.122648, 0, 0.5568628, 1, 1,
0.1394156, -1.267731, 1.892532, 0, 0.5490196, 1, 1,
0.1398634, -1.102442, 3.530289, 0, 0.5450981, 1, 1,
0.1437364, 0.1902045, 0.3764126, 0, 0.5372549, 1, 1,
0.1498277, 1.46411, 1.343311, 0, 0.5333334, 1, 1,
0.1511759, 0.04576233, 2.66613, 0, 0.5254902, 1, 1,
0.1543941, -0.3151253, 5.523732, 0, 0.5215687, 1, 1,
0.1564246, -1.321503, 4.170753, 0, 0.5137255, 1, 1,
0.1588409, 0.4794753, 3.010795, 0, 0.509804, 1, 1,
0.1631624, -1.361412, 2.145521, 0, 0.5019608, 1, 1,
0.1652644, -1.232754, 1.673838, 0, 0.4941176, 1, 1,
0.1702047, 0.5370283, 2.504937, 0, 0.4901961, 1, 1,
0.1714749, -0.3670818, 3.52183, 0, 0.4823529, 1, 1,
0.1744944, -1.821016, 3.499027, 0, 0.4784314, 1, 1,
0.1745495, -0.1300954, 2.820666, 0, 0.4705882, 1, 1,
0.1761715, -0.1413246, 2.407271, 0, 0.4666667, 1, 1,
0.1788094, 0.3137468, 0.711943, 0, 0.4588235, 1, 1,
0.1802735, -0.1981435, 2.148912, 0, 0.454902, 1, 1,
0.1822686, 0.0381881, 0.9147803, 0, 0.4470588, 1, 1,
0.1869914, -0.1735553, 2.262929, 0, 0.4431373, 1, 1,
0.1882574, 1.135393, -0.215931, 0, 0.4352941, 1, 1,
0.1886331, 1.08126, -0.001374338, 0, 0.4313726, 1, 1,
0.1904278, -0.3815811, 4.044524, 0, 0.4235294, 1, 1,
0.1951449, -1.128376, 3.544367, 0, 0.4196078, 1, 1,
0.1955227, 0.1396811, 1.803976, 0, 0.4117647, 1, 1,
0.19989, 0.3885254, 0.4912934, 0, 0.4078431, 1, 1,
0.2044319, -1.187785, 3.22582, 0, 0.4, 1, 1,
0.2047374, 0.7884348, 0.1310966, 0, 0.3921569, 1, 1,
0.2063526, -0.1368898, 3.77692, 0, 0.3882353, 1, 1,
0.2072895, 0.07991467, -0.2708196, 0, 0.3803922, 1, 1,
0.2079789, 1.154886, -0.4894429, 0, 0.3764706, 1, 1,
0.213114, 0.1759273, 0.1452746, 0, 0.3686275, 1, 1,
0.2152399, -0.893016, 3.769873, 0, 0.3647059, 1, 1,
0.2161277, 1.282021, 0.3521512, 0, 0.3568628, 1, 1,
0.2174096, 0.7854555, -0.4444739, 0, 0.3529412, 1, 1,
0.224903, -0.1303763, 0.8204506, 0, 0.345098, 1, 1,
0.2251277, 1.901093, -2.076153, 0, 0.3411765, 1, 1,
0.2285611, -0.07049838, 2.405531, 0, 0.3333333, 1, 1,
0.2289556, -1.617743, 3.409159, 0, 0.3294118, 1, 1,
0.2291902, 0.6257538, -0.3075312, 0, 0.3215686, 1, 1,
0.236369, -2.342411, 3.68953, 0, 0.3176471, 1, 1,
0.2386271, 0.165885, 0.156271, 0, 0.3098039, 1, 1,
0.239477, 0.4611222, 1.975955, 0, 0.3058824, 1, 1,
0.2452962, 0.7417689, 1.282714, 0, 0.2980392, 1, 1,
0.2503907, 1.187677, 0.739454, 0, 0.2901961, 1, 1,
0.2516148, -0.1723587, 2.70628, 0, 0.2862745, 1, 1,
0.2523896, 0.8861181, 0.3104878, 0, 0.2784314, 1, 1,
0.2525301, -0.9183481, 3.883527, 0, 0.2745098, 1, 1,
0.253874, 0.3148864, 2.308958, 0, 0.2666667, 1, 1,
0.2591833, 1.497124, 0.3226749, 0, 0.2627451, 1, 1,
0.2597833, -1.713301, 3.247553, 0, 0.254902, 1, 1,
0.2606107, -0.4163926, 2.376894, 0, 0.2509804, 1, 1,
0.2618861, 0.3644892, 0.6548154, 0, 0.2431373, 1, 1,
0.2629615, 0.5487924, -0.9905927, 0, 0.2392157, 1, 1,
0.2649639, -1.049317, 1.229264, 0, 0.2313726, 1, 1,
0.2662249, -0.5940365, 1.955816, 0, 0.227451, 1, 1,
0.266344, -0.4053345, 1.082754, 0, 0.2196078, 1, 1,
0.2687126, -0.4630289, 2.971956, 0, 0.2156863, 1, 1,
0.2694809, 0.7967225, -1.054024, 0, 0.2078431, 1, 1,
0.2696482, 0.4217116, 1.397778, 0, 0.2039216, 1, 1,
0.2748368, -0.3528236, 1.537805, 0, 0.1960784, 1, 1,
0.2773643, 1.171613, 0.1825051, 0, 0.1882353, 1, 1,
0.2793092, 1.353762, 1.490279, 0, 0.1843137, 1, 1,
0.2813291, -0.5154108, 2.267607, 0, 0.1764706, 1, 1,
0.2822207, -1.285233, 1.737911, 0, 0.172549, 1, 1,
0.2851819, -2.353923, 2.945684, 0, 0.1647059, 1, 1,
0.2856441, -2.435072, 3.439129, 0, 0.1607843, 1, 1,
0.2858932, -0.5966899, 2.093162, 0, 0.1529412, 1, 1,
0.2872385, -0.3892167, 1.95016, 0, 0.1490196, 1, 1,
0.2896294, -0.4309783, 3.223321, 0, 0.1411765, 1, 1,
0.289898, -0.5277829, 1.463373, 0, 0.1372549, 1, 1,
0.3013129, 0.6682717, 0.6260533, 0, 0.1294118, 1, 1,
0.3131119, 1.978282, 2.220491, 0, 0.1254902, 1, 1,
0.314995, -1.298438, 1.784842, 0, 0.1176471, 1, 1,
0.316654, 1.899551, -1.316036, 0, 0.1137255, 1, 1,
0.3169004, 0.6924744, -0.2156434, 0, 0.1058824, 1, 1,
0.3173015, -0.7537572, 3.083561, 0, 0.09803922, 1, 1,
0.3226164, -0.1136549, 2.707914, 0, 0.09411765, 1, 1,
0.3229154, 1.758297, -0.1840015, 0, 0.08627451, 1, 1,
0.3297639, -0.07627843, 0.5152106, 0, 0.08235294, 1, 1,
0.3334422, 0.07982673, 2.771799, 0, 0.07450981, 1, 1,
0.336142, 0.7324052, 1.309454, 0, 0.07058824, 1, 1,
0.33764, 0.6996723, 0.3297583, 0, 0.0627451, 1, 1,
0.3380688, -0.3683905, 3.699301, 0, 0.05882353, 1, 1,
0.3387885, -0.3456071, 1.378181, 0, 0.05098039, 1, 1,
0.3409566, -0.2789654, 1.414325, 0, 0.04705882, 1, 1,
0.3415385, -0.9193364, 3.331911, 0, 0.03921569, 1, 1,
0.3444091, -0.5202858, 3.375718, 0, 0.03529412, 1, 1,
0.3445739, 0.4615531, -1.166384, 0, 0.02745098, 1, 1,
0.3453671, -0.05967271, 1.728787, 0, 0.02352941, 1, 1,
0.3460697, -0.9274076, 1.609641, 0, 0.01568628, 1, 1,
0.346491, 0.5217384, 1.69813, 0, 0.01176471, 1, 1,
0.3472907, 0.4412184, -0.2691664, 0, 0.003921569, 1, 1,
0.347696, -0.3726889, 2.876776, 0.003921569, 0, 1, 1,
0.348937, -2.379001, 3.682329, 0.007843138, 0, 1, 1,
0.3500978, 0.6077812, 0.546434, 0.01568628, 0, 1, 1,
0.3600515, -1.134975, 2.511237, 0.01960784, 0, 1, 1,
0.3606826, -0.207519, 1.840526, 0.02745098, 0, 1, 1,
0.3627722, -1.193632, 0.7383292, 0.03137255, 0, 1, 1,
0.3644741, -0.09301384, 2.680354, 0.03921569, 0, 1, 1,
0.3660813, -0.1063504, 1.01952, 0.04313726, 0, 1, 1,
0.372597, -0.2302856, -0.6802403, 0.05098039, 0, 1, 1,
0.3795586, 1.606664, 0.1919347, 0.05490196, 0, 1, 1,
0.3830667, 1.290765, 0.2769398, 0.0627451, 0, 1, 1,
0.3839418, -0.4338172, 0.4942941, 0.06666667, 0, 1, 1,
0.3882426, -0.5230467, 1.491196, 0.07450981, 0, 1, 1,
0.4029079, 0.521332, 1.688945, 0.07843138, 0, 1, 1,
0.4029969, 0.7810962, -1.196573, 0.08627451, 0, 1, 1,
0.4039029, -0.3791085, 2.31434, 0.09019608, 0, 1, 1,
0.4044981, 0.2090815, 0.4396176, 0.09803922, 0, 1, 1,
0.4052929, -1.565054, 1.629145, 0.1058824, 0, 1, 1,
0.4097082, 0.9675536, 2.207273, 0.1098039, 0, 1, 1,
0.4134577, 0.2540595, -1.358184, 0.1176471, 0, 1, 1,
0.4173283, 1.076368, -0.6359311, 0.1215686, 0, 1, 1,
0.4187269, -0.01105251, -0.3789903, 0.1294118, 0, 1, 1,
0.4215125, 0.1165913, 1.406014, 0.1333333, 0, 1, 1,
0.4279331, -1.109886, 2.416022, 0.1411765, 0, 1, 1,
0.4299401, -0.3905421, 2.400895, 0.145098, 0, 1, 1,
0.4320793, -2.018487, 2.854966, 0.1529412, 0, 1, 1,
0.4345462, 0.5234826, -2.633808, 0.1568628, 0, 1, 1,
0.4396184, -1.879299, 2.526884, 0.1647059, 0, 1, 1,
0.4406485, 0.7248085, -1.239269, 0.1686275, 0, 1, 1,
0.4472615, -0.7576967, 2.682331, 0.1764706, 0, 1, 1,
0.4505033, -0.1005194, 1.421752, 0.1803922, 0, 1, 1,
0.4506537, -0.3905608, 3.565533, 0.1882353, 0, 1, 1,
0.4527144, -1.728554, 2.589099, 0.1921569, 0, 1, 1,
0.4551573, -0.7230282, 2.301765, 0.2, 0, 1, 1,
0.4594627, -0.09887384, 3.22918, 0.2078431, 0, 1, 1,
0.459986, 0.5053366, 0.09358987, 0.2117647, 0, 1, 1,
0.4761838, 0.5579547, 1.954958, 0.2196078, 0, 1, 1,
0.4768484, -0.7498745, 3.596075, 0.2235294, 0, 1, 1,
0.483567, -0.6809748, 1.816347, 0.2313726, 0, 1, 1,
0.4864764, -0.668026, 1.246916, 0.2352941, 0, 1, 1,
0.486784, 0.392831, 2.880074, 0.2431373, 0, 1, 1,
0.4882653, 0.480413, 1.224261, 0.2470588, 0, 1, 1,
0.4888544, 1.574846, 1.437796, 0.254902, 0, 1, 1,
0.5058742, -0.275859, 3.239397, 0.2588235, 0, 1, 1,
0.5064231, -1.473999, 4.156358, 0.2666667, 0, 1, 1,
0.5091896, 0.9233685, 0.02893443, 0.2705882, 0, 1, 1,
0.5120946, 1.037667, -0.09690484, 0.2784314, 0, 1, 1,
0.5135093, -1.184715, 3.090806, 0.282353, 0, 1, 1,
0.5152826, 0.4406599, 2.481974, 0.2901961, 0, 1, 1,
0.5186701, 1.234758, 0.1363077, 0.2941177, 0, 1, 1,
0.5202814, 0.1200559, 1.429159, 0.3019608, 0, 1, 1,
0.5224879, 0.5566336, 0.3655904, 0.3098039, 0, 1, 1,
0.5233754, 0.8109194, -0.1587743, 0.3137255, 0, 1, 1,
0.5259446, -0.7587488, 2.443094, 0.3215686, 0, 1, 1,
0.5282347, 0.2103091, 1.164052, 0.3254902, 0, 1, 1,
0.5300543, 0.795888, 2.355428, 0.3333333, 0, 1, 1,
0.531608, 0.06335695, 2.484623, 0.3372549, 0, 1, 1,
0.532442, -3.26683, 1.663882, 0.345098, 0, 1, 1,
0.5348288, -0.9938399, 2.896487, 0.3490196, 0, 1, 1,
0.5430282, -0.1943591, 1.242587, 0.3568628, 0, 1, 1,
0.5483878, 1.570307, 0.6448347, 0.3607843, 0, 1, 1,
0.5490074, 0.2444441, 2.266684, 0.3686275, 0, 1, 1,
0.5502225, 1.478952, 0.2763774, 0.372549, 0, 1, 1,
0.5509334, -0.3143257, 0.7044679, 0.3803922, 0, 1, 1,
0.5518349, 0.4577917, 0.2648153, 0.3843137, 0, 1, 1,
0.5550904, -0.8963397, 2.182093, 0.3921569, 0, 1, 1,
0.5661481, -0.2040457, 1.6812, 0.3960784, 0, 1, 1,
0.5685713, -0.1212507, 2.241723, 0.4039216, 0, 1, 1,
0.5723814, -2.234476, 1.687581, 0.4117647, 0, 1, 1,
0.5782297, -0.3933771, 0.6062589, 0.4156863, 0, 1, 1,
0.5795258, -0.6332149, 4.283612, 0.4235294, 0, 1, 1,
0.5845713, -1.025062, 3.258559, 0.427451, 0, 1, 1,
0.5861712, 0.178578, 1.022974, 0.4352941, 0, 1, 1,
0.5948374, -1.336617, 2.340729, 0.4392157, 0, 1, 1,
0.5972306, -1.283581, 1.721669, 0.4470588, 0, 1, 1,
0.597473, -0.7715107, 3.176461, 0.4509804, 0, 1, 1,
0.5994006, -0.9784144, 2.463737, 0.4588235, 0, 1, 1,
0.6056541, 0.5456728, -1.91455, 0.4627451, 0, 1, 1,
0.6091394, 0.7971702, 1.409022, 0.4705882, 0, 1, 1,
0.6131089, 0.09351307, 0.9589926, 0.4745098, 0, 1, 1,
0.6143453, -2.136006, 1.248038, 0.4823529, 0, 1, 1,
0.6177065, 1.343991, -0.1830345, 0.4862745, 0, 1, 1,
0.6209187, -1.07798, 1.533723, 0.4941176, 0, 1, 1,
0.6215281, 0.7791958, -1.210004, 0.5019608, 0, 1, 1,
0.6230353, 0.6571668, 1.272866, 0.5058824, 0, 1, 1,
0.6245191, 0.6572791, -0.1681691, 0.5137255, 0, 1, 1,
0.6245751, 0.1296639, 0.5841494, 0.5176471, 0, 1, 1,
0.6256014, -0.5103034, 2.475053, 0.5254902, 0, 1, 1,
0.6272569, 0.1435873, 0.973541, 0.5294118, 0, 1, 1,
0.6287419, 0.022325, 1.230657, 0.5372549, 0, 1, 1,
0.6298218, 1.445043, 0.3545809, 0.5411765, 0, 1, 1,
0.6372845, -0.3620261, 1.29938, 0.5490196, 0, 1, 1,
0.6448744, 0.6256309, 1.554202, 0.5529412, 0, 1, 1,
0.646088, 0.01472374, 2.280208, 0.5607843, 0, 1, 1,
0.6560543, 0.8155334, -0.2623965, 0.5647059, 0, 1, 1,
0.6590409, 0.576243, 0.8048425, 0.572549, 0, 1, 1,
0.6608001, -0.3553639, 2.093776, 0.5764706, 0, 1, 1,
0.669208, 0.1504428, 2.671911, 0.5843138, 0, 1, 1,
0.6693223, 0.5382551, 3.354466, 0.5882353, 0, 1, 1,
0.6736551, -0.0006574447, 1.901944, 0.5960785, 0, 1, 1,
0.6773418, -0.08582942, 2.163243, 0.6039216, 0, 1, 1,
0.6802236, 1.044472, 0.6918131, 0.6078432, 0, 1, 1,
0.6808484, 0.2761987, 2.670569, 0.6156863, 0, 1, 1,
0.6888078, 1.166898, 0.2583102, 0.6196079, 0, 1, 1,
0.6926187, -0.7037441, 0.3177724, 0.627451, 0, 1, 1,
0.7126349, -0.4334287, 2.549571, 0.6313726, 0, 1, 1,
0.7157832, -0.02246782, -0.8221974, 0.6392157, 0, 1, 1,
0.7243201, 0.7814285, 0.4231836, 0.6431373, 0, 1, 1,
0.7252706, -1.056859, 2.418488, 0.6509804, 0, 1, 1,
0.7253851, -0.3090347, 1.258166, 0.654902, 0, 1, 1,
0.7299546, -0.9769416, 1.235852, 0.6627451, 0, 1, 1,
0.730337, 0.2947111, 1.063318, 0.6666667, 0, 1, 1,
0.7305648, -1.021854, 1.806987, 0.6745098, 0, 1, 1,
0.7333384, 1.445612, 0.2208907, 0.6784314, 0, 1, 1,
0.7395116, -0.1444805, -0.4268782, 0.6862745, 0, 1, 1,
0.7396822, -0.1786013, 0.9149087, 0.6901961, 0, 1, 1,
0.7426696, 0.3101806, 1.940947, 0.6980392, 0, 1, 1,
0.7450293, 1.183978, -1.225817, 0.7058824, 0, 1, 1,
0.7474077, 1.291474, -1.063184, 0.7098039, 0, 1, 1,
0.7476937, -0.3908117, 2.676698, 0.7176471, 0, 1, 1,
0.749302, 0.2502112, 0.6692078, 0.7215686, 0, 1, 1,
0.7508227, 0.1933615, 0.165768, 0.7294118, 0, 1, 1,
0.7517518, 0.1161798, 1.805081, 0.7333333, 0, 1, 1,
0.7549181, -1.242045, 1.939965, 0.7411765, 0, 1, 1,
0.7550902, 1.18787, 1.162174, 0.7450981, 0, 1, 1,
0.7556155, -0.7451368, 2.114944, 0.7529412, 0, 1, 1,
0.7559193, 0.3513117, 0.2078901, 0.7568628, 0, 1, 1,
0.7567357, -0.8769969, 1.109598, 0.7647059, 0, 1, 1,
0.7601616, 0.4738828, 1.604796, 0.7686275, 0, 1, 1,
0.7605132, -0.7569993, 4.056313, 0.7764706, 0, 1, 1,
0.7634704, -0.2599771, 2.72557, 0.7803922, 0, 1, 1,
0.7647358, 0.6854775, 1.200956, 0.7882353, 0, 1, 1,
0.7654308, 1.292078, 1.740588, 0.7921569, 0, 1, 1,
0.7657923, 0.7425138, 0.321427, 0.8, 0, 1, 1,
0.7663612, -1.34095, 3.289734, 0.8078431, 0, 1, 1,
0.7711203, -1.311713, 2.738933, 0.8117647, 0, 1, 1,
0.7715622, 0.8077045, 0.7683801, 0.8196079, 0, 1, 1,
0.7717639, 0.3587133, 1.459121, 0.8235294, 0, 1, 1,
0.7770959, -1.222374, 3.870339, 0.8313726, 0, 1, 1,
0.7775432, 0.683168, -0.08190379, 0.8352941, 0, 1, 1,
0.7812517, -0.9918011, 3.098309, 0.8431373, 0, 1, 1,
0.7825667, -1.071538, 3.975327, 0.8470588, 0, 1, 1,
0.7880208, -1.862289, 1.395576, 0.854902, 0, 1, 1,
0.7912724, -1.094177, 3.342895, 0.8588235, 0, 1, 1,
0.8026632, -0.8324916, 1.673289, 0.8666667, 0, 1, 1,
0.814867, -1.966899, 2.321557, 0.8705882, 0, 1, 1,
0.8169572, 1.827808, 0.9561917, 0.8784314, 0, 1, 1,
0.8277102, 0.03985017, 1.438222, 0.8823529, 0, 1, 1,
0.8353986, -1.677793, 1.989914, 0.8901961, 0, 1, 1,
0.840037, -0.5858558, 2.329386, 0.8941177, 0, 1, 1,
0.8413195, 0.08843659, 2.149656, 0.9019608, 0, 1, 1,
0.8492976, -0.4633911, 1.079163, 0.9098039, 0, 1, 1,
0.8585909, -0.2111382, 1.630286, 0.9137255, 0, 1, 1,
0.8616729, -0.3099616, 2.734933, 0.9215686, 0, 1, 1,
0.8658635, -0.2442931, 1.785295, 0.9254902, 0, 1, 1,
0.8682374, -0.2952281, 1.205317, 0.9333333, 0, 1, 1,
0.8712433, -0.0362309, 0.1147468, 0.9372549, 0, 1, 1,
0.8715693, -1.162124, 1.526899, 0.945098, 0, 1, 1,
0.881704, -2.003474, 2.102394, 0.9490196, 0, 1, 1,
0.88422, -0.5785366, 0.09077584, 0.9568627, 0, 1, 1,
0.8873549, 1.21951, 1.396003, 0.9607843, 0, 1, 1,
0.8884943, 0.9667347, 1.458278, 0.9686275, 0, 1, 1,
0.8890915, 0.3184276, 2.296169, 0.972549, 0, 1, 1,
0.9010841, 0.4460563, 2.454185, 0.9803922, 0, 1, 1,
0.908044, 0.4158248, 1.742635, 0.9843137, 0, 1, 1,
0.9091864, -0.8362073, 0.7289672, 0.9921569, 0, 1, 1,
0.9132203, -0.4645999, 2.389269, 0.9960784, 0, 1, 1,
0.9151496, 0.7233902, 2.18014, 1, 0, 0.9960784, 1,
0.9208525, 0.5441484, 2.046456, 1, 0, 0.9882353, 1,
0.922852, -0.5391086, 2.021824, 1, 0, 0.9843137, 1,
0.9329771, 1.908629, 0.1227722, 1, 0, 0.9764706, 1,
0.9375196, -1.14132, 1.978029, 1, 0, 0.972549, 1,
0.9403636, -0.09026599, 1.081976, 1, 0, 0.9647059, 1,
0.9417958, -0.6454608, 2.903437, 1, 0, 0.9607843, 1,
0.9418244, 0.4801625, 0.4988427, 1, 0, 0.9529412, 1,
0.9477301, 2.019176, -0.1594404, 1, 0, 0.9490196, 1,
0.9508792, 0.4303241, 1.382994, 1, 0, 0.9411765, 1,
0.9607323, -0.9180889, 2.3954, 1, 0, 0.9372549, 1,
0.9621488, 0.5131261, 1.481428, 1, 0, 0.9294118, 1,
0.9649024, -0.9688653, 2.28225, 1, 0, 0.9254902, 1,
0.9705884, -0.2059276, 3.332138, 1, 0, 0.9176471, 1,
0.9760094, -1.529777, 1.76602, 1, 0, 0.9137255, 1,
0.9762989, 1.310133, -0.6593649, 1, 0, 0.9058824, 1,
0.983752, -1.487716, 3.947319, 1, 0, 0.9019608, 1,
0.9870843, -0.2059178, 3.385363, 1, 0, 0.8941177, 1,
0.9883404, 0.9382911, -0.1046699, 1, 0, 0.8862745, 1,
1.001486, -0.4283678, 0.1133604, 1, 0, 0.8823529, 1,
1.002105, 0.08527549, 2.087119, 1, 0, 0.8745098, 1,
1.011458, 0.6345147, 2.809422, 1, 0, 0.8705882, 1,
1.011905, -0.4932629, 2.621475, 1, 0, 0.8627451, 1,
1.01833, 1.29529, 0.7315621, 1, 0, 0.8588235, 1,
1.020098, 0.4982503, -0.6046731, 1, 0, 0.8509804, 1,
1.020977, 1.381303, 0.3004247, 1, 0, 0.8470588, 1,
1.025297, -1.53002, 1.975743, 1, 0, 0.8392157, 1,
1.025317, 0.5061948, 0.8297921, 1, 0, 0.8352941, 1,
1.036272, -0.2196976, 1.900016, 1, 0, 0.827451, 1,
1.036285, -0.5403468, 2.052633, 1, 0, 0.8235294, 1,
1.046599, 0.9915608, 2.363144, 1, 0, 0.8156863, 1,
1.046852, -0.8541802, 2.733061, 1, 0, 0.8117647, 1,
1.050397, 0.4931012, 1.015829, 1, 0, 0.8039216, 1,
1.053808, -0.2646548, 0.9116552, 1, 0, 0.7960784, 1,
1.068017, 0.9054002, 0.1488605, 1, 0, 0.7921569, 1,
1.0753, 0.6218259, 1.31638, 1, 0, 0.7843137, 1,
1.094521, -1.091785, 2.869402, 1, 0, 0.7803922, 1,
1.095878, 1.35447, 1.393664, 1, 0, 0.772549, 1,
1.104563, -0.1943084, 1.341823, 1, 0, 0.7686275, 1,
1.104908, 0.4307366, 1.271324, 1, 0, 0.7607843, 1,
1.107063, 0.4473772, 0.4209032, 1, 0, 0.7568628, 1,
1.107595, -0.1171241, 1.28893, 1, 0, 0.7490196, 1,
1.109261, 0.1417126, 2.95693, 1, 0, 0.7450981, 1,
1.119569, -0.4579282, 2.530146, 1, 0, 0.7372549, 1,
1.12161, -0.9072673, 2.11128, 1, 0, 0.7333333, 1,
1.142288, -0.571681, 0.8928837, 1, 0, 0.7254902, 1,
1.147107, -0.525084, 2.779336, 1, 0, 0.7215686, 1,
1.154478, 0.1456261, 0.7215087, 1, 0, 0.7137255, 1,
1.154727, -0.2687418, 1.726558, 1, 0, 0.7098039, 1,
1.157078, -1.156965, 3.620384, 1, 0, 0.7019608, 1,
1.174438, 0.1182172, 0.6273188, 1, 0, 0.6941177, 1,
1.174807, -0.1448661, 0.8037471, 1, 0, 0.6901961, 1,
1.181769, -0.5825033, -0.2898083, 1, 0, 0.682353, 1,
1.189512, 0.1878631, 1.85227, 1, 0, 0.6784314, 1,
1.191384, -0.1337584, 1.634932, 1, 0, 0.6705883, 1,
1.192722, 0.6499206, 2.125178, 1, 0, 0.6666667, 1,
1.193196, -0.7839605, 2.125298, 1, 0, 0.6588235, 1,
1.202415, -0.9314421, 2.582035, 1, 0, 0.654902, 1,
1.221178, 0.03743463, 0.2776921, 1, 0, 0.6470588, 1,
1.238033, -2.0658, 3.232382, 1, 0, 0.6431373, 1,
1.240418, 0.909234, 0.9145813, 1, 0, 0.6352941, 1,
1.240473, 1.160917, -0.7716772, 1, 0, 0.6313726, 1,
1.245456, -0.542891, 2.195456, 1, 0, 0.6235294, 1,
1.246641, -0.8426238, 2.090777, 1, 0, 0.6196079, 1,
1.253283, -0.2517265, 1.731064, 1, 0, 0.6117647, 1,
1.257292, -1.396512, 1.978668, 1, 0, 0.6078432, 1,
1.264849, -0.7174133, 3.12946, 1, 0, 0.6, 1,
1.273447, -0.06460023, 1.304026, 1, 0, 0.5921569, 1,
1.280847, -1.276615, 0.9562343, 1, 0, 0.5882353, 1,
1.283881, 0.2558682, -0.0185055, 1, 0, 0.5803922, 1,
1.287457, -1.893028, 2.545758, 1, 0, 0.5764706, 1,
1.288075, 1.073411, 1.010919, 1, 0, 0.5686275, 1,
1.303925, 0.4000096, -0.05826071, 1, 0, 0.5647059, 1,
1.307631, -1.450326, 1.944239, 1, 0, 0.5568628, 1,
1.31134, 0.9457092, -0.5663432, 1, 0, 0.5529412, 1,
1.324843, 0.8158995, 0.9660201, 1, 0, 0.5450981, 1,
1.328612, 0.4301096, 3.09411, 1, 0, 0.5411765, 1,
1.330109, 0.4002621, 2.589764, 1, 0, 0.5333334, 1,
1.333495, -0.4585883, 3.586742, 1, 0, 0.5294118, 1,
1.337298, -1.131, 1.350598, 1, 0, 0.5215687, 1,
1.337307, -1.584664, 1.703316, 1, 0, 0.5176471, 1,
1.353361, 0.5806231, 0.8452207, 1, 0, 0.509804, 1,
1.362951, -1.428988, 3.184699, 1, 0, 0.5058824, 1,
1.376374, -0.6400588, 2.415586, 1, 0, 0.4980392, 1,
1.380516, 1.311571, -0.2244706, 1, 0, 0.4901961, 1,
1.382013, 1.077494, -0.7179737, 1, 0, 0.4862745, 1,
1.38668, 0.003137928, 1.474021, 1, 0, 0.4784314, 1,
1.386913, -1.351035, 2.785263, 1, 0, 0.4745098, 1,
1.398514, -1.371598, 3.032669, 1, 0, 0.4666667, 1,
1.402229, -1.298787, 1.969462, 1, 0, 0.4627451, 1,
1.408907, 0.8540168, 1.219177, 1, 0, 0.454902, 1,
1.419122, -0.001831492, 1.934667, 1, 0, 0.4509804, 1,
1.435814, 0.8217162, 0.7952495, 1, 0, 0.4431373, 1,
1.447919, -1.055649, 2.129043, 1, 0, 0.4392157, 1,
1.455517, 0.8547817, 1.546782, 1, 0, 0.4313726, 1,
1.457514, 0.6674802, 0.5833138, 1, 0, 0.427451, 1,
1.467335, 0.4250085, 2.740483, 1, 0, 0.4196078, 1,
1.468717, -0.2027383, -0.513259, 1, 0, 0.4156863, 1,
1.474248, -2.345264, 3.635373, 1, 0, 0.4078431, 1,
1.482772, 1.033184, 2.537229, 1, 0, 0.4039216, 1,
1.488473, 0.3975932, 0.1199867, 1, 0, 0.3960784, 1,
1.50485, -0.6147554, 0.6994474, 1, 0, 0.3882353, 1,
1.512908, -0.3436801, 1.179311, 1, 0, 0.3843137, 1,
1.524665, 1.5868, 0.5069832, 1, 0, 0.3764706, 1,
1.532615, -0.4150223, 2.533662, 1, 0, 0.372549, 1,
1.554394, -0.7958615, 3.791737, 1, 0, 0.3647059, 1,
1.561419, -0.5482942, 2.948742, 1, 0, 0.3607843, 1,
1.590541, 0.2501294, 1.958534, 1, 0, 0.3529412, 1,
1.603944, -1.495533, 1.837897, 1, 0, 0.3490196, 1,
1.604627, -0.439944, 1.806806, 1, 0, 0.3411765, 1,
1.611135, -1.15159, 1.795214, 1, 0, 0.3372549, 1,
1.62174, -0.3397548, 1.256016, 1, 0, 0.3294118, 1,
1.65758, 1.154638, 1.369002, 1, 0, 0.3254902, 1,
1.662131, -0.1695488, 1.871947, 1, 0, 0.3176471, 1,
1.671267, -1.206702, 3.727663, 1, 0, 0.3137255, 1,
1.680438, -1.073202, 3.248536, 1, 0, 0.3058824, 1,
1.682057, -1.395006, 2.850421, 1, 0, 0.2980392, 1,
1.686656, 0.2866154, 2.559303, 1, 0, 0.2941177, 1,
1.68876, -2.906776, 1.771205, 1, 0, 0.2862745, 1,
1.698407, -0.8852594, 1.433781, 1, 0, 0.282353, 1,
1.698511, -0.9170869, 0.7284836, 1, 0, 0.2745098, 1,
1.709005, 0.3136684, 1.222081, 1, 0, 0.2705882, 1,
1.763263, -1.339195, 1.320419, 1, 0, 0.2627451, 1,
1.79763, 0.6777983, -0.1576131, 1, 0, 0.2588235, 1,
1.83368, 0.5850489, 0.8771951, 1, 0, 0.2509804, 1,
1.87973, 0.674606, -0.2308213, 1, 0, 0.2470588, 1,
1.884695, 0.04765505, 1.424636, 1, 0, 0.2392157, 1,
1.887942, -0.6732067, 0.542307, 1, 0, 0.2352941, 1,
1.893384, -1.138409, 3.019796, 1, 0, 0.227451, 1,
1.91516, -0.2685514, 2.133901, 1, 0, 0.2235294, 1,
1.925099, 0.439395, 1.87571, 1, 0, 0.2156863, 1,
1.925872, -0.4451905, 0.9707182, 1, 0, 0.2117647, 1,
1.927711, 0.2945373, 1.471951, 1, 0, 0.2039216, 1,
1.929915, 0.7452119, 2.652142, 1, 0, 0.1960784, 1,
1.932603, 1.099171, 2.566708, 1, 0, 0.1921569, 1,
1.933277, 1.118946, -0.06930166, 1, 0, 0.1843137, 1,
1.941398, 1.815709, 0.3220682, 1, 0, 0.1803922, 1,
1.941981, 0.5430272, 1.144695, 1, 0, 0.172549, 1,
1.967315, -0.4081497, 1.2668, 1, 0, 0.1686275, 1,
2.025693, 1.099467, 1.807992, 1, 0, 0.1607843, 1,
2.03169, 0.3395191, 2.563239, 1, 0, 0.1568628, 1,
2.036649, -0.9778517, 1.958097, 1, 0, 0.1490196, 1,
2.050135, -0.1639028, -0.4231875, 1, 0, 0.145098, 1,
2.072352, 1.08274, 2.911006, 1, 0, 0.1372549, 1,
2.076921, 0.2889002, 1.541322, 1, 0, 0.1333333, 1,
2.082477, -0.02960101, 0.5363197, 1, 0, 0.1254902, 1,
2.126084, -1.24137, 1.891279, 1, 0, 0.1215686, 1,
2.24527, 0.6859726, 1.276208, 1, 0, 0.1137255, 1,
2.253874, 0.264505, 0.6631352, 1, 0, 0.1098039, 1,
2.27902, 0.3106811, 2.058053, 1, 0, 0.1019608, 1,
2.310924, 0.1307445, 1.543823, 1, 0, 0.09411765, 1,
2.314507, 0.3367499, 3.43299, 1, 0, 0.09019608, 1,
2.315459, -0.2755391, 4.257156, 1, 0, 0.08235294, 1,
2.354783, -0.2763096, 2.763752, 1, 0, 0.07843138, 1,
2.365898, 1.370116, 2.470798, 1, 0, 0.07058824, 1,
2.385431, -0.9302815, 1.637158, 1, 0, 0.06666667, 1,
2.433513, -0.2508723, 3.145074, 1, 0, 0.05882353, 1,
2.555644, -1.146298, 2.330385, 1, 0, 0.05490196, 1,
2.6092, 0.1720356, 2.156682, 1, 0, 0.04705882, 1,
2.671152, -0.827544, 0.688573, 1, 0, 0.04313726, 1,
2.701489, -0.4104348, 0.9458031, 1, 0, 0.03529412, 1,
2.962849, 0.8727458, 1.290257, 1, 0, 0.03137255, 1,
3.101722, -0.2807029, 0.8191006, 1, 0, 0.02352941, 1,
3.13504, -0.9530511, 2.46289, 1, 0, 0.01960784, 1,
3.223, -1.792847, 2.174534, 1, 0, 0.01176471, 1,
3.316252, 1.346378, 0.5887505, 1, 0, 0.007843138, 1
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
0.04528916, -5.196501, -7.193601, 0, -0.5, 0.5, 0.5,
0.04528916, -5.196501, -7.193601, 1, -0.5, 0.5, 0.5,
0.04528916, -5.196501, -7.193601, 1, 1.5, 0.5, 0.5,
0.04528916, -5.196501, -7.193601, 0, 1.5, 0.5, 0.5
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
-4.33453, -0.7357535, -7.193601, 0, -0.5, 0.5, 0.5,
-4.33453, -0.7357535, -7.193601, 1, -0.5, 0.5, 0.5,
-4.33453, -0.7357535, -7.193601, 1, 1.5, 0.5, 0.5,
-4.33453, -0.7357535, -7.193601, 0, 1.5, 0.5, 0.5
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
-4.33453, -5.196501, 0.08665061, 0, -0.5, 0.5, 0.5,
-4.33453, -5.196501, 0.08665061, 1, -0.5, 0.5, 0.5,
-4.33453, -5.196501, 0.08665061, 1, 1.5, 0.5, 0.5,
-4.33453, -5.196501, 0.08665061, 0, 1.5, 0.5, 0.5
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
-3, -4.167098, -5.513543,
3, -4.167098, -5.513543,
-3, -4.167098, -5.513543,
-3, -4.338665, -5.793552,
-2, -4.167098, -5.513543,
-2, -4.338665, -5.793552,
-1, -4.167098, -5.513543,
-1, -4.338665, -5.793552,
0, -4.167098, -5.513543,
0, -4.338665, -5.793552,
1, -4.167098, -5.513543,
1, -4.338665, -5.793552,
2, -4.167098, -5.513543,
2, -4.338665, -5.793552,
3, -4.167098, -5.513543,
3, -4.338665, -5.793552
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
-3, -4.681799, -6.353572, 0, -0.5, 0.5, 0.5,
-3, -4.681799, -6.353572, 1, -0.5, 0.5, 0.5,
-3, -4.681799, -6.353572, 1, 1.5, 0.5, 0.5,
-3, -4.681799, -6.353572, 0, 1.5, 0.5, 0.5,
-2, -4.681799, -6.353572, 0, -0.5, 0.5, 0.5,
-2, -4.681799, -6.353572, 1, -0.5, 0.5, 0.5,
-2, -4.681799, -6.353572, 1, 1.5, 0.5, 0.5,
-2, -4.681799, -6.353572, 0, 1.5, 0.5, 0.5,
-1, -4.681799, -6.353572, 0, -0.5, 0.5, 0.5,
-1, -4.681799, -6.353572, 1, -0.5, 0.5, 0.5,
-1, -4.681799, -6.353572, 1, 1.5, 0.5, 0.5,
-1, -4.681799, -6.353572, 0, 1.5, 0.5, 0.5,
0, -4.681799, -6.353572, 0, -0.5, 0.5, 0.5,
0, -4.681799, -6.353572, 1, -0.5, 0.5, 0.5,
0, -4.681799, -6.353572, 1, 1.5, 0.5, 0.5,
0, -4.681799, -6.353572, 0, 1.5, 0.5, 0.5,
1, -4.681799, -6.353572, 0, -0.5, 0.5, 0.5,
1, -4.681799, -6.353572, 1, -0.5, 0.5, 0.5,
1, -4.681799, -6.353572, 1, 1.5, 0.5, 0.5,
1, -4.681799, -6.353572, 0, 1.5, 0.5, 0.5,
2, -4.681799, -6.353572, 0, -0.5, 0.5, 0.5,
2, -4.681799, -6.353572, 1, -0.5, 0.5, 0.5,
2, -4.681799, -6.353572, 1, 1.5, 0.5, 0.5,
2, -4.681799, -6.353572, 0, 1.5, 0.5, 0.5,
3, -4.681799, -6.353572, 0, -0.5, 0.5, 0.5,
3, -4.681799, -6.353572, 1, -0.5, 0.5, 0.5,
3, -4.681799, -6.353572, 1, 1.5, 0.5, 0.5,
3, -4.681799, -6.353572, 0, 1.5, 0.5, 0.5
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
-3.323802, -4, -5.513543,
-3.323802, 2, -5.513543,
-3.323802, -4, -5.513543,
-3.492257, -4, -5.793552,
-3.323802, -3, -5.513543,
-3.492257, -3, -5.793552,
-3.323802, -2, -5.513543,
-3.492257, -2, -5.793552,
-3.323802, -1, -5.513543,
-3.492257, -1, -5.793552,
-3.323802, 0, -5.513543,
-3.492257, 0, -5.793552,
-3.323802, 1, -5.513543,
-3.492257, 1, -5.793552,
-3.323802, 2, -5.513543,
-3.492257, 2, -5.793552
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
"-4",
"-3",
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
-3.829166, -4, -6.353572, 0, -0.5, 0.5, 0.5,
-3.829166, -4, -6.353572, 1, -0.5, 0.5, 0.5,
-3.829166, -4, -6.353572, 1, 1.5, 0.5, 0.5,
-3.829166, -4, -6.353572, 0, 1.5, 0.5, 0.5,
-3.829166, -3, -6.353572, 0, -0.5, 0.5, 0.5,
-3.829166, -3, -6.353572, 1, -0.5, 0.5, 0.5,
-3.829166, -3, -6.353572, 1, 1.5, 0.5, 0.5,
-3.829166, -3, -6.353572, 0, 1.5, 0.5, 0.5,
-3.829166, -2, -6.353572, 0, -0.5, 0.5, 0.5,
-3.829166, -2, -6.353572, 1, -0.5, 0.5, 0.5,
-3.829166, -2, -6.353572, 1, 1.5, 0.5, 0.5,
-3.829166, -2, -6.353572, 0, 1.5, 0.5, 0.5,
-3.829166, -1, -6.353572, 0, -0.5, 0.5, 0.5,
-3.829166, -1, -6.353572, 1, -0.5, 0.5, 0.5,
-3.829166, -1, -6.353572, 1, 1.5, 0.5, 0.5,
-3.829166, -1, -6.353572, 0, 1.5, 0.5, 0.5,
-3.829166, 0, -6.353572, 0, -0.5, 0.5, 0.5,
-3.829166, 0, -6.353572, 1, -0.5, 0.5, 0.5,
-3.829166, 0, -6.353572, 1, 1.5, 0.5, 0.5,
-3.829166, 0, -6.353572, 0, 1.5, 0.5, 0.5,
-3.829166, 1, -6.353572, 0, -0.5, 0.5, 0.5,
-3.829166, 1, -6.353572, 1, -0.5, 0.5, 0.5,
-3.829166, 1, -6.353572, 1, 1.5, 0.5, 0.5,
-3.829166, 1, -6.353572, 0, 1.5, 0.5, 0.5,
-3.829166, 2, -6.353572, 0, -0.5, 0.5, 0.5,
-3.829166, 2, -6.353572, 1, -0.5, 0.5, 0.5,
-3.829166, 2, -6.353572, 1, 1.5, 0.5, 0.5,
-3.829166, 2, -6.353572, 0, 1.5, 0.5, 0.5
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
-3.323802, -4.167098, -4,
-3.323802, -4.167098, 4,
-3.323802, -4.167098, -4,
-3.492257, -4.338665, -4,
-3.323802, -4.167098, -2,
-3.492257, -4.338665, -2,
-3.323802, -4.167098, 0,
-3.492257, -4.338665, 0,
-3.323802, -4.167098, 2,
-3.492257, -4.338665, 2,
-3.323802, -4.167098, 4,
-3.492257, -4.338665, 4
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
-3.829166, -4.681799, -4, 0, -0.5, 0.5, 0.5,
-3.829166, -4.681799, -4, 1, -0.5, 0.5, 0.5,
-3.829166, -4.681799, -4, 1, 1.5, 0.5, 0.5,
-3.829166, -4.681799, -4, 0, 1.5, 0.5, 0.5,
-3.829166, -4.681799, -2, 0, -0.5, 0.5, 0.5,
-3.829166, -4.681799, -2, 1, -0.5, 0.5, 0.5,
-3.829166, -4.681799, -2, 1, 1.5, 0.5, 0.5,
-3.829166, -4.681799, -2, 0, 1.5, 0.5, 0.5,
-3.829166, -4.681799, 0, 0, -0.5, 0.5, 0.5,
-3.829166, -4.681799, 0, 1, -0.5, 0.5, 0.5,
-3.829166, -4.681799, 0, 1, 1.5, 0.5, 0.5,
-3.829166, -4.681799, 0, 0, 1.5, 0.5, 0.5,
-3.829166, -4.681799, 2, 0, -0.5, 0.5, 0.5,
-3.829166, -4.681799, 2, 1, -0.5, 0.5, 0.5,
-3.829166, -4.681799, 2, 1, 1.5, 0.5, 0.5,
-3.829166, -4.681799, 2, 0, 1.5, 0.5, 0.5,
-3.829166, -4.681799, 4, 0, -0.5, 0.5, 0.5,
-3.829166, -4.681799, 4, 1, -0.5, 0.5, 0.5,
-3.829166, -4.681799, 4, 1, 1.5, 0.5, 0.5,
-3.829166, -4.681799, 4, 0, 1.5, 0.5, 0.5
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
-3.323802, -4.167098, -5.513543,
-3.323802, 2.69559, -5.513543,
-3.323802, -4.167098, 5.686844,
-3.323802, 2.69559, 5.686844,
-3.323802, -4.167098, -5.513543,
-3.323802, -4.167098, 5.686844,
-3.323802, 2.69559, -5.513543,
-3.323802, 2.69559, 5.686844,
-3.323802, -4.167098, -5.513543,
3.414381, -4.167098, -5.513543,
-3.323802, -4.167098, 5.686844,
3.414381, -4.167098, 5.686844,
-3.323802, 2.69559, -5.513543,
3.414381, 2.69559, -5.513543,
-3.323802, 2.69559, 5.686844,
3.414381, 2.69559, 5.686844,
3.414381, -4.167098, -5.513543,
3.414381, 2.69559, -5.513543,
3.414381, -4.167098, 5.686844,
3.414381, 2.69559, 5.686844,
3.414381, -4.167098, -5.513543,
3.414381, -4.167098, 5.686844,
3.414381, 2.69559, -5.513543,
3.414381, 2.69559, 5.686844
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
var radius = 7.883193;
var distance = 35.07322;
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
mvMatrix.translate( -0.04528916, 0.7357535, -0.08665061 );
mvMatrix.scale( 1.26495, 1.242001, 0.7609972 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.07322);
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
EPN<-read.table("EPN.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-EPN$V2
```

```
## Error in eval(expr, envir, enclos): object 'EPN' not found
```

```r
y<-EPN$V3
```

```
## Error in eval(expr, envir, enclos): object 'EPN' not found
```

```r
z<-EPN$V4
```

```
## Error in eval(expr, envir, enclos): object 'EPN' not found
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
-3.225673, 0.1232512, -3.477612, 0, 0, 1, 1, 1,
-3.092094, -0.3898513, -1.287423, 1, 0, 0, 1, 1,
-3.063833, 0.480664, -2.646627, 1, 0, 0, 1, 1,
-3.062581, -0.4538792, -3.169252, 1, 0, 0, 1, 1,
-2.832414, 1.687066, -1.904594, 1, 0, 0, 1, 1,
-2.672975, 0.0824201, -2.461174, 1, 0, 0, 1, 1,
-2.595181, 2.330272, -1.312383, 0, 0, 0, 1, 1,
-2.579195, 0.3787083, -2.108497, 0, 0, 0, 1, 1,
-2.484842, 2.501764, -0.8696391, 0, 0, 0, 1, 1,
-2.47316, 0.3501801, -0.14349, 0, 0, 0, 1, 1,
-2.442617, -0.5329704, -2.303698, 0, 0, 0, 1, 1,
-2.418073, 0.2650575, -2.216094, 0, 0, 0, 1, 1,
-2.311628, -1.555164, -1.933607, 0, 0, 0, 1, 1,
-2.304262, 1.248394, -1.563173, 1, 1, 1, 1, 1,
-2.291628, -1.186219, -2.549909, 1, 1, 1, 1, 1,
-2.249105, -0.401737, -0.6877899, 1, 1, 1, 1, 1,
-2.195426, 0.6109207, -1.79473, 1, 1, 1, 1, 1,
-2.181319, -0.2858427, -2.980274, 1, 1, 1, 1, 1,
-2.139595, -1.275945, -3.360214, 1, 1, 1, 1, 1,
-2.125541, -0.1538047, -2.938117, 1, 1, 1, 1, 1,
-2.086391, -1.15738, -2.620929, 1, 1, 1, 1, 1,
-2.068707, -1.169635, -2.007334, 1, 1, 1, 1, 1,
-2.056477, -1.458861, -3.995374, 1, 1, 1, 1, 1,
-2.045871, 1.155731, -1.310657, 1, 1, 1, 1, 1,
-2.026041, 1.009834, -1.46608, 1, 1, 1, 1, 1,
-2.019514, 1.023551, 0.6416736, 1, 1, 1, 1, 1,
-2.016281, -1.983029, -2.941342, 1, 1, 1, 1, 1,
-1.983805, -0.7914611, -1.706737, 1, 1, 1, 1, 1,
-1.978243, 0.2730856, -1.507161, 0, 0, 1, 1, 1,
-1.968244, 2.366019, -1.481754, 1, 0, 0, 1, 1,
-1.957868, -1.499019, -2.466535, 1, 0, 0, 1, 1,
-1.947078, -0.4669844, -1.758121, 1, 0, 0, 1, 1,
-1.936454, 1.760376, -1.090962, 1, 0, 0, 1, 1,
-1.935773, 1.203873, -0.5478231, 1, 0, 0, 1, 1,
-1.919392, 0.6777189, -2.32353, 0, 0, 0, 1, 1,
-1.909799, -0.07943423, -0.6234472, 0, 0, 0, 1, 1,
-1.87898, 0.7575625, -1.891283, 0, 0, 0, 1, 1,
-1.872273, 0.3681815, -2.568891, 0, 0, 0, 1, 1,
-1.856431, -1.238025, -1.067395, 0, 0, 0, 1, 1,
-1.849454, -0.4603316, -4.056918, 0, 0, 0, 1, 1,
-1.80834, -0.9922104, -4.000576, 0, 0, 0, 1, 1,
-1.780577, -0.9603752, -2.730305, 1, 1, 1, 1, 1,
-1.777585, -1.171609, -2.092903, 1, 1, 1, 1, 1,
-1.765637, -0.1366856, -0.4463759, 1, 1, 1, 1, 1,
-1.764784, 0.3645941, -1.454772, 1, 1, 1, 1, 1,
-1.763024, 1.786116, -2.369318, 1, 1, 1, 1, 1,
-1.740554, -0.207606, -4.172992, 1, 1, 1, 1, 1,
-1.736741, 1.147859, -1.688709, 1, 1, 1, 1, 1,
-1.729225, -1.303669, -3.756733, 1, 1, 1, 1, 1,
-1.724042, -0.9333734, -1.496921, 1, 1, 1, 1, 1,
-1.721533, -0.4225331, -4.08587, 1, 1, 1, 1, 1,
-1.717592, 0.3270081, 0.2006762, 1, 1, 1, 1, 1,
-1.716654, 1.13948, -0.536436, 1, 1, 1, 1, 1,
-1.686373, -0.7897614, -2.947828, 1, 1, 1, 1, 1,
-1.68091, -1.186026, -1.507902, 1, 1, 1, 1, 1,
-1.679131, -1.219774, -1.57236, 1, 1, 1, 1, 1,
-1.670593, -0.7186264, -2.853703, 0, 0, 1, 1, 1,
-1.666074, 1.073228, -0.9379475, 1, 0, 0, 1, 1,
-1.640259, -1.022197, -1.863388, 1, 0, 0, 1, 1,
-1.638506, -0.6873097, -2.020813, 1, 0, 0, 1, 1,
-1.631067, -0.7101867, -1.866205, 1, 0, 0, 1, 1,
-1.630359, -0.9696151, -2.523353, 1, 0, 0, 1, 1,
-1.602765, 0.5668046, -2.815457, 0, 0, 0, 1, 1,
-1.582839, -0.08701767, -1.366586, 0, 0, 0, 1, 1,
-1.572095, -1.423964, -1.148294, 0, 0, 0, 1, 1,
-1.565017, -0.7956879, -0.5592179, 0, 0, 0, 1, 1,
-1.560573, 0.3173746, -1.617869, 0, 0, 0, 1, 1,
-1.544114, -0.07285339, -0.08653195, 0, 0, 0, 1, 1,
-1.542456, -0.6543753, -0.5740491, 0, 0, 0, 1, 1,
-1.541951, 0.3962222, -2.218191, 1, 1, 1, 1, 1,
-1.540026, -0.07318348, -2.244781, 1, 1, 1, 1, 1,
-1.538533, -1.211045, -2.797096, 1, 1, 1, 1, 1,
-1.536865, 0.2532807, -0.5599773, 1, 1, 1, 1, 1,
-1.529582, -0.5549282, -3.219518, 1, 1, 1, 1, 1,
-1.523644, 1.773371, -2.056615, 1, 1, 1, 1, 1,
-1.521829, 0.06757077, -2.823998, 1, 1, 1, 1, 1,
-1.518961, -0.7819197, -2.04916, 1, 1, 1, 1, 1,
-1.517033, -1.334702, -3.500505, 1, 1, 1, 1, 1,
-1.494699, 0.2598016, -1.737576, 1, 1, 1, 1, 1,
-1.482411, 1.061787, -1.144905, 1, 1, 1, 1, 1,
-1.479814, 1.022236, -2.384081, 1, 1, 1, 1, 1,
-1.474541, -0.9149076, -2.285967, 1, 1, 1, 1, 1,
-1.474322, 0.4801412, -0.4961697, 1, 1, 1, 1, 1,
-1.474065, 0.8190188, -1.314703, 1, 1, 1, 1, 1,
-1.460633, 0.04696883, -0.5830167, 0, 0, 1, 1, 1,
-1.453465, -1.05487, -1.570542, 1, 0, 0, 1, 1,
-1.448277, 0.7859774, -1.482267, 1, 0, 0, 1, 1,
-1.445461, 1.27579, 0.1913468, 1, 0, 0, 1, 1,
-1.422413, -0.3217792, -0.4643524, 1, 0, 0, 1, 1,
-1.420501, -1.369669, -4.275596, 1, 0, 0, 1, 1,
-1.412431, -0.0530589, -1.461383, 0, 0, 0, 1, 1,
-1.412012, -1.235117, -1.703712, 0, 0, 0, 1, 1,
-1.402712, 0.8150199, -2.567106, 0, 0, 0, 1, 1,
-1.386171, 0.3731834, -0.6661209, 0, 0, 0, 1, 1,
-1.374184, 0.4537158, -0.8060299, 0, 0, 0, 1, 1,
-1.37347, -1.035935, -2.578862, 0, 0, 0, 1, 1,
-1.362928, 1.801452, -0.9330714, 0, 0, 0, 1, 1,
-1.353666, -0.9853866, -0.7060847, 1, 1, 1, 1, 1,
-1.352637, -0.22503, -1.470562, 1, 1, 1, 1, 1,
-1.342514, 1.133715, -0.005569116, 1, 1, 1, 1, 1,
-1.325061, -1.066345, -0.008439763, 1, 1, 1, 1, 1,
-1.31988, 0.9284078, -1.774104, 1, 1, 1, 1, 1,
-1.314956, -0.781327, 0.676616, 1, 1, 1, 1, 1,
-1.309631, -0.3115603, -2.454491, 1, 1, 1, 1, 1,
-1.30722, -0.3967502, -3.129253, 1, 1, 1, 1, 1,
-1.307176, -0.40751, -2.133104, 1, 1, 1, 1, 1,
-1.290844, -1.410456, -3.7342, 1, 1, 1, 1, 1,
-1.290019, 1.093983, -0.6396261, 1, 1, 1, 1, 1,
-1.281975, 1.031342, -1.928824, 1, 1, 1, 1, 1,
-1.278991, -3.23882, -3.689303, 1, 1, 1, 1, 1,
-1.27504, 0.6003312, -3.479366, 1, 1, 1, 1, 1,
-1.273267, -2.17111, -2.683394, 1, 1, 1, 1, 1,
-1.272988, 1.159152, -1.624892, 0, 0, 1, 1, 1,
-1.27296, 0.1995986, -1.626816, 1, 0, 0, 1, 1,
-1.260005, 1.382596, -2.06935, 1, 0, 0, 1, 1,
-1.241853, -1.037729, -1.545674, 1, 0, 0, 1, 1,
-1.238543, -0.02481483, -0.6146886, 1, 0, 0, 1, 1,
-1.23795, -0.2717031, -0.4329426, 1, 0, 0, 1, 1,
-1.233598, -0.5345968, -1.106566, 0, 0, 0, 1, 1,
-1.230824, -0.29758, -2.331694, 0, 0, 0, 1, 1,
-1.226298, 0.9317885, -2.41821, 0, 0, 0, 1, 1,
-1.186378, -0.2153987, -0.3949042, 0, 0, 0, 1, 1,
-1.18184, 0.6995562, -0.7789187, 0, 0, 0, 1, 1,
-1.174851, -1.008439, -0.7899025, 0, 0, 0, 1, 1,
-1.168806, -1.142098, -2.278155, 0, 0, 0, 1, 1,
-1.166888, -1.249173, -0.8426307, 1, 1, 1, 1, 1,
-1.162264, 0.937926, -0.7447093, 1, 1, 1, 1, 1,
-1.161709, 0.582945, -1.753875, 1, 1, 1, 1, 1,
-1.158968, -1.151628, -3.096529, 1, 1, 1, 1, 1,
-1.15494, -0.2045381, -0.2401065, 1, 1, 1, 1, 1,
-1.137579, -1.876238, -1.498065, 1, 1, 1, 1, 1,
-1.132414, -1.347632, -4.058085, 1, 1, 1, 1, 1,
-1.131092, 1.198814, -3.186507, 1, 1, 1, 1, 1,
-1.128796, -0.1866728, -0.2038578, 1, 1, 1, 1, 1,
-1.12789, 1.178411, -0.4338323, 1, 1, 1, 1, 1,
-1.119008, 0.2973373, -1.511165, 1, 1, 1, 1, 1,
-1.117236, 0.3457738, -2.071991, 1, 1, 1, 1, 1,
-1.104829, 0.6802573, -0.533151, 1, 1, 1, 1, 1,
-1.101596, -0.4672748, -2.304994, 1, 1, 1, 1, 1,
-1.100937, 1.125522, -0.1858259, 1, 1, 1, 1, 1,
-1.095972, -1.505328, -2.453328, 0, 0, 1, 1, 1,
-1.083905, 1.592203, 0.6104942, 1, 0, 0, 1, 1,
-1.077196, -0.6434506, -2.367452, 1, 0, 0, 1, 1,
-1.07403, -1.629779, -3.099386, 1, 0, 0, 1, 1,
-1.072886, 0.5679466, -0.4498787, 1, 0, 0, 1, 1,
-1.0678, -0.8697967, -1.756601, 1, 0, 0, 1, 1,
-1.065004, 0.07096104, -1.044828, 0, 0, 0, 1, 1,
-1.061995, -0.3373937, -2.335492, 0, 0, 0, 1, 1,
-1.053912, 0.3800302, -2.027278, 0, 0, 0, 1, 1,
-1.053004, 1.369568, 0.1243351, 0, 0, 0, 1, 1,
-1.051555, -0.6483442, -1.778221, 0, 0, 0, 1, 1,
-1.049574, -0.8236203, -3.442779, 0, 0, 0, 1, 1,
-1.048119, 1.284452, 0.3709791, 0, 0, 0, 1, 1,
-1.042283, 0.7960259, -0.742999, 1, 1, 1, 1, 1,
-1.04144, 0.6493335, -0.9943129, 1, 1, 1, 1, 1,
-1.035082, 0.4782429, -0.2169001, 1, 1, 1, 1, 1,
-1.031929, -2.288152, -2.907792, 1, 1, 1, 1, 1,
-1.031238, -2.079768, -2.602046, 1, 1, 1, 1, 1,
-1.029272, 1.599757, -0.1560358, 1, 1, 1, 1, 1,
-1.026067, -0.4274414, 0.121324, 1, 1, 1, 1, 1,
-1.006655, -1.099949, -2.963522, 1, 1, 1, 1, 1,
-1.0056, 0.3840159, -0.7682655, 1, 1, 1, 1, 1,
-1.003117, 0.3613071, -1.434542, 1, 1, 1, 1, 1,
-1.002995, 0.7006854, -0.8339615, 1, 1, 1, 1, 1,
-0.9906881, 1.643109, -0.4333708, 1, 1, 1, 1, 1,
-0.9877095, -0.5299658, -0.5312169, 1, 1, 1, 1, 1,
-0.9869324, 1.783443, -0.6758842, 1, 1, 1, 1, 1,
-0.9855266, -1.026604, -1.841123, 1, 1, 1, 1, 1,
-0.9854044, -0.8540161, -2.793389, 0, 0, 1, 1, 1,
-0.9831959, -0.01154373, -1.013158, 1, 0, 0, 1, 1,
-0.9830878, 0.6966524, -1.070611, 1, 0, 0, 1, 1,
-0.9827766, 0.3944591, 0.0512811, 1, 0, 0, 1, 1,
-0.9826506, -0.7748874, -2.998844, 1, 0, 0, 1, 1,
-0.9825333, 0.3618028, -2.645483, 1, 0, 0, 1, 1,
-0.9789869, 0.2634621, -1.050699, 0, 0, 0, 1, 1,
-0.9707313, -0.4970182, -3.314824, 0, 0, 0, 1, 1,
-0.9674024, -1.914014, -2.12321, 0, 0, 0, 1, 1,
-0.9581524, -0.9910912, -2.484991, 0, 0, 0, 1, 1,
-0.9541003, -1.908315, -3.876432, 0, 0, 0, 1, 1,
-0.9529991, -0.0365911, -2.43837, 0, 0, 0, 1, 1,
-0.9469426, 2.233489, -1.708885, 0, 0, 0, 1, 1,
-0.9463573, -0.299413, -2.125547, 1, 1, 1, 1, 1,
-0.9457594, -0.1711266, -1.447924, 1, 1, 1, 1, 1,
-0.934448, 0.4805537, -1.374835, 1, 1, 1, 1, 1,
-0.9317331, 0.8364905, -1.980024, 1, 1, 1, 1, 1,
-0.9261966, -0.3529587, -1.821915, 1, 1, 1, 1, 1,
-0.9246312, -1.418817, -2.748114, 1, 1, 1, 1, 1,
-0.9146076, 1.29282, -2.346023, 1, 1, 1, 1, 1,
-0.9125006, -0.08833571, -3.023612, 1, 1, 1, 1, 1,
-0.9016828, 0.6657487, -1.145978, 1, 1, 1, 1, 1,
-0.9005359, -0.9397568, -2.325806, 1, 1, 1, 1, 1,
-0.8889023, 0.02496488, -2.864177, 1, 1, 1, 1, 1,
-0.8835402, 0.7145898, -0.4034298, 1, 1, 1, 1, 1,
-0.8784089, 0.5321744, -2.199185, 1, 1, 1, 1, 1,
-0.8736684, 0.1484459, 0.5822109, 1, 1, 1, 1, 1,
-0.87242, -0.6202568, 0.2393199, 1, 1, 1, 1, 1,
-0.869997, -1.151605, -2.391022, 0, 0, 1, 1, 1,
-0.8609974, -0.8158067, -2.109239, 1, 0, 0, 1, 1,
-0.8590096, 0.08150278, -0.545494, 1, 0, 0, 1, 1,
-0.8587548, -4.067155, -2.362708, 1, 0, 0, 1, 1,
-0.8448103, -0.1768396, -2.26011, 1, 0, 0, 1, 1,
-0.843446, -0.8067108, -1.059841, 1, 0, 0, 1, 1,
-0.8383581, -0.3364826, -4.165907, 0, 0, 0, 1, 1,
-0.8357789, 0.2780716, -1.217936, 0, 0, 0, 1, 1,
-0.8335515, -0.5952951, -1.380322, 0, 0, 0, 1, 1,
-0.8325114, 0.4690883, 0.3610237, 0, 0, 0, 1, 1,
-0.8309269, 1.192181, -1.667844, 0, 0, 0, 1, 1,
-0.830587, -0.1759079, -3.053355, 0, 0, 0, 1, 1,
-0.8303747, -1.770087, -0.9004793, 0, 0, 0, 1, 1,
-0.8264049, -0.867036, -0.3171289, 1, 1, 1, 1, 1,
-0.8218552, 1.588387, -0.5405338, 1, 1, 1, 1, 1,
-0.8209861, -0.4246656, -2.485772, 1, 1, 1, 1, 1,
-0.8192964, -0.5284268, -2.709561, 1, 1, 1, 1, 1,
-0.8155618, -0.9259481, -2.254055, 1, 1, 1, 1, 1,
-0.8150855, 1.066475, 0.600802, 1, 1, 1, 1, 1,
-0.8065166, 1.139657, -0.005699833, 1, 1, 1, 1, 1,
-0.8028426, -0.09644965, -2.412887, 1, 1, 1, 1, 1,
-0.8020886, 0.1042628, -2.116499, 1, 1, 1, 1, 1,
-0.7958144, -0.2742627, -0.9116293, 1, 1, 1, 1, 1,
-0.7951226, -0.5046065, -2.592352, 1, 1, 1, 1, 1,
-0.7841458, 0.3964107, -0.3907309, 1, 1, 1, 1, 1,
-0.7798868, 0.9786474, -2.382486, 1, 1, 1, 1, 1,
-0.7786027, -0.8940741, -2.950153, 1, 1, 1, 1, 1,
-0.7718652, 0.8368908, -3.516932, 1, 1, 1, 1, 1,
-0.7690728, 1.892955, 0.5252303, 0, 0, 1, 1, 1,
-0.7684359, -0.8256673, -3.373167, 1, 0, 0, 1, 1,
-0.7668628, -0.02489285, -1.97674, 1, 0, 0, 1, 1,
-0.76249, 1.653709, 0.03807158, 1, 0, 0, 1, 1,
-0.7564887, 0.2387123, -1.748264, 1, 0, 0, 1, 1,
-0.754944, 1.597011, -1.962327, 1, 0, 0, 1, 1,
-0.7511297, -1.398368, -1.584009, 0, 0, 0, 1, 1,
-0.7483228, -0.2979081, -2.250761, 0, 0, 0, 1, 1,
-0.7465253, -1.314969, -1.183502, 0, 0, 0, 1, 1,
-0.7408242, -0.2847078, -0.968086, 0, 0, 0, 1, 1,
-0.740413, 0.3885793, -1.954675, 0, 0, 0, 1, 1,
-0.7384055, -0.3324108, -0.8509855, 0, 0, 0, 1, 1,
-0.7300012, -1.049441, -2.251009, 0, 0, 0, 1, 1,
-0.729544, -0.6082101, -1.016446, 1, 1, 1, 1, 1,
-0.7246643, 0.4602682, -1.04362, 1, 1, 1, 1, 1,
-0.7246189, -1.13246, -1.604061, 1, 1, 1, 1, 1,
-0.723935, -0.190249, -2.708966, 1, 1, 1, 1, 1,
-0.7216884, -0.2174475, -1.911169, 1, 1, 1, 1, 1,
-0.7187696, -0.8413712, -0.7928253, 1, 1, 1, 1, 1,
-0.7170152, -0.3371364, -1.616437, 1, 1, 1, 1, 1,
-0.7147108, -0.622632, -4.85441, 1, 1, 1, 1, 1,
-0.7127803, -0.5621454, -2.555827, 1, 1, 1, 1, 1,
-0.7117664, 2.595648, -0.4708479, 1, 1, 1, 1, 1,
-0.7071462, 0.3539015, -0.06654231, 1, 1, 1, 1, 1,
-0.7064474, -0.7167595, -2.685328, 1, 1, 1, 1, 1,
-0.7050055, -0.1230331, -0.9149572, 1, 1, 1, 1, 1,
-0.701458, 0.4529937, -0.518711, 1, 1, 1, 1, 1,
-0.7001856, -0.596325, -2.029745, 1, 1, 1, 1, 1,
-0.7000387, 0.01108171, -1.444344, 0, 0, 1, 1, 1,
-0.6988002, 0.6897709, -1.295074, 1, 0, 0, 1, 1,
-0.6896933, -0.03309399, -1.844361, 1, 0, 0, 1, 1,
-0.6896613, -0.05893406, -2.455417, 1, 0, 0, 1, 1,
-0.6894603, 1.239686, -0.03769994, 1, 0, 0, 1, 1,
-0.6849912, 0.2684051, -0.8058032, 1, 0, 0, 1, 1,
-0.6833518, -0.2978307, -1.201797, 0, 0, 0, 1, 1,
-0.6809033, -0.8835467, -3.546762, 0, 0, 0, 1, 1,
-0.6780192, 0.4729387, -2.038368, 0, 0, 0, 1, 1,
-0.6654644, -0.8650203, -2.222759, 0, 0, 0, 1, 1,
-0.6614125, 1.826187, -1.943015, 0, 0, 0, 1, 1,
-0.6599903, 0.1542367, -1.371664, 0, 0, 0, 1, 1,
-0.6552884, 0.4611711, 0.654341, 0, 0, 0, 1, 1,
-0.6513825, 0.6662526, -0.6265499, 1, 1, 1, 1, 1,
-0.6433631, -0.04162889, -1.788267, 1, 1, 1, 1, 1,
-0.6415227, -0.784716, -2.853397, 1, 1, 1, 1, 1,
-0.6367072, 0.02096489, -1.851408, 1, 1, 1, 1, 1,
-0.6356807, -1.543031, -3.647842, 1, 1, 1, 1, 1,
-0.6222858, -0.4097627, -0.8962224, 1, 1, 1, 1, 1,
-0.6216623, -0.1833109, -3.009379, 1, 1, 1, 1, 1,
-0.6202277, -0.1040229, -3.008581, 1, 1, 1, 1, 1,
-0.6198249, 0.5785328, -1.327819, 1, 1, 1, 1, 1,
-0.6162416, -0.7414616, -3.912811, 1, 1, 1, 1, 1,
-0.6142929, 0.1496424, -0.6420732, 1, 1, 1, 1, 1,
-0.6121873, -0.2686256, -3.117585, 1, 1, 1, 1, 1,
-0.6114877, -0.1230312, -1.692963, 1, 1, 1, 1, 1,
-0.6113943, -0.7767672, -3.69579, 1, 1, 1, 1, 1,
-0.610707, 0.3552721, -0.5135722, 1, 1, 1, 1, 1,
-0.610453, -1.508486, -2.508259, 0, 0, 1, 1, 1,
-0.6050664, 0.5920169, 0.1082494, 1, 0, 0, 1, 1,
-0.6014864, 1.65496, -1.427243, 1, 0, 0, 1, 1,
-0.5997336, -0.9758083, -4.014884, 1, 0, 0, 1, 1,
-0.5960304, -1.940524, -3.920246, 1, 0, 0, 1, 1,
-0.595874, 0.6785249, -0.2686389, 1, 0, 0, 1, 1,
-0.5901585, 0.3469733, -0.7838727, 0, 0, 0, 1, 1,
-0.5876586, 0.5780927, -2.342718, 0, 0, 0, 1, 1,
-0.5847188, 0.2157303, -1.694705, 0, 0, 0, 1, 1,
-0.5823349, -0.6958919, -3.333614, 0, 0, 0, 1, 1,
-0.5820675, 1.502123, -0.5667049, 0, 0, 0, 1, 1,
-0.5798652, 0.3544148, -1.171522, 0, 0, 0, 1, 1,
-0.5779688, -0.1281243, -2.167681, 0, 0, 0, 1, 1,
-0.5778545, 0.2596146, -0.9939392, 1, 1, 1, 1, 1,
-0.5732183, 0.5105144, -0.9374172, 1, 1, 1, 1, 1,
-0.569213, -0.7669253, -3.57779, 1, 1, 1, 1, 1,
-0.5684977, -0.04890302, -1.460954, 1, 1, 1, 1, 1,
-0.5678333, -0.5974975, -2.182686, 1, 1, 1, 1, 1,
-0.5674, -0.563129, -2.000651, 1, 1, 1, 1, 1,
-0.5665781, 0.8210909, 0.7568402, 1, 1, 1, 1, 1,
-0.5663629, -0.8493848, -1.864942, 1, 1, 1, 1, 1,
-0.5661467, -0.7384793, -1.932281, 1, 1, 1, 1, 1,
-0.5628512, -0.3647043, -1.833, 1, 1, 1, 1, 1,
-0.5625266, -1.560016, -3.372945, 1, 1, 1, 1, 1,
-0.5623661, -0.3923533, -3.639441, 1, 1, 1, 1, 1,
-0.5601293, 0.1515004, 0.5025257, 1, 1, 1, 1, 1,
-0.5588782, 1.010911, -1.909729, 1, 1, 1, 1, 1,
-0.5522473, 1.275399, -1.711424, 1, 1, 1, 1, 1,
-0.5516763, 0.1491951, -2.641178, 0, 0, 1, 1, 1,
-0.5463568, 1.0071, -2.358565, 1, 0, 0, 1, 1,
-0.5427724, -0.7463518, -2.816788, 1, 0, 0, 1, 1,
-0.5363526, -1.065052, -2.322263, 1, 0, 0, 1, 1,
-0.5349026, -0.1913652, -1.588617, 1, 0, 0, 1, 1,
-0.5207338, -0.7947061, -2.312752, 1, 0, 0, 1, 1,
-0.5149902, 1.312306, -1.508639, 0, 0, 0, 1, 1,
-0.5138203, -0.7682571, -1.299844, 0, 0, 0, 1, 1,
-0.5131959, -0.0856494, 0.440584, 0, 0, 0, 1, 1,
-0.5121596, -0.4727184, -3.50384, 0, 0, 0, 1, 1,
-0.507266, 1.320999, -0.5101917, 0, 0, 0, 1, 1,
-0.5059258, -0.3187638, -3.52348, 0, 0, 0, 1, 1,
-0.5001639, -0.3875848, -1.426887, 0, 0, 0, 1, 1,
-0.494849, -0.2817237, -0.5904785, 1, 1, 1, 1, 1,
-0.4934386, -0.5617067, -3.868964, 1, 1, 1, 1, 1,
-0.4875017, 0.4972882, -0.03450953, 1, 1, 1, 1, 1,
-0.4845587, 0.3635449, -3.637895, 1, 1, 1, 1, 1,
-0.4844831, 0.2530674, -0.8979807, 1, 1, 1, 1, 1,
-0.4759198, -0.9215573, -1.497391, 1, 1, 1, 1, 1,
-0.4722156, 0.0884806, -1.795356, 1, 1, 1, 1, 1,
-0.4690489, 1.178723, -1.098198, 1, 1, 1, 1, 1,
-0.4650311, 1.281141, 0.9878196, 1, 1, 1, 1, 1,
-0.4648471, -0.09322079, -2.406333, 1, 1, 1, 1, 1,
-0.4628945, -0.7073778, -3.254109, 1, 1, 1, 1, 1,
-0.4627708, -1.081986, -2.204987, 1, 1, 1, 1, 1,
-0.462137, 1.409508, 0.06754939, 1, 1, 1, 1, 1,
-0.4560063, 0.2760906, -2.500597, 1, 1, 1, 1, 1,
-0.455353, 0.2673852, -2.978431, 1, 1, 1, 1, 1,
-0.4540239, -0.4364715, -2.275782, 0, 0, 1, 1, 1,
-0.4538026, -0.5809016, -2.022571, 1, 0, 0, 1, 1,
-0.4530508, 1.227848, 0.6069712, 1, 0, 0, 1, 1,
-0.4514125, 0.1302448, -0.8589591, 1, 0, 0, 1, 1,
-0.4500672, -0.5930883, -2.387819, 1, 0, 0, 1, 1,
-0.4480816, 0.01844337, -0.7546282, 1, 0, 0, 1, 1,
-0.4472208, 0.9189391, 0.3030952, 0, 0, 0, 1, 1,
-0.4445781, -0.08356692, -3.494654, 0, 0, 0, 1, 1,
-0.4432768, 0.7613252, -1.059079, 0, 0, 0, 1, 1,
-0.4377776, -0.949769, -4.616168, 0, 0, 0, 1, 1,
-0.4328445, 0.1612843, -2.715914, 0, 0, 0, 1, 1,
-0.4326492, 1.429285, -0.1272574, 0, 0, 0, 1, 1,
-0.4323444, 0.2676302, -0.05714322, 0, 0, 0, 1, 1,
-0.4302324, 0.1676757, -2.049886, 1, 1, 1, 1, 1,
-0.4233382, -0.2030546, -3.045013, 1, 1, 1, 1, 1,
-0.4212334, 0.02725573, -2.215282, 1, 1, 1, 1, 1,
-0.4159729, -0.2100873, -1.210808, 1, 1, 1, 1, 1,
-0.4083006, 1.643594, -0.6699543, 1, 1, 1, 1, 1,
-0.4076837, -0.3185379, -0.791907, 1, 1, 1, 1, 1,
-0.4073132, -1.333519, -2.754853, 1, 1, 1, 1, 1,
-0.3978947, 0.1299154, -2.811956, 1, 1, 1, 1, 1,
-0.3950511, 0.1847519, -0.9145913, 1, 1, 1, 1, 1,
-0.3895409, 1.434606, 0.9790758, 1, 1, 1, 1, 1,
-0.3885702, 0.7632742, -0.9046063, 1, 1, 1, 1, 1,
-0.388368, 0.8330774, 1.006695, 1, 1, 1, 1, 1,
-0.3870771, -1.315136, -1.876979, 1, 1, 1, 1, 1,
-0.3857061, -0.6572968, -2.12167, 1, 1, 1, 1, 1,
-0.3815893, 0.6008223, 0.1304188, 1, 1, 1, 1, 1,
-0.378829, 0.7918098, -0.2664597, 0, 0, 1, 1, 1,
-0.3741669, 0.8373753, 0.9523901, 1, 0, 0, 1, 1,
-0.3732645, 0.2953957, -0.2785429, 1, 0, 0, 1, 1,
-0.3707581, 0.03844737, -1.539606, 1, 0, 0, 1, 1,
-0.3695967, -0.400025, -2.273946, 1, 0, 0, 1, 1,
-0.3694832, -0.07528412, 0.5621496, 1, 0, 0, 1, 1,
-0.3673543, -0.6095161, -0.6520938, 0, 0, 0, 1, 1,
-0.3669683, -0.3541592, -1.680902, 0, 0, 0, 1, 1,
-0.3660467, -0.2457943, -3.486958, 0, 0, 0, 1, 1,
-0.3608188, -0.740324, -2.810672, 0, 0, 0, 1, 1,
-0.3604589, 1.966688, -1.278829, 0, 0, 0, 1, 1,
-0.3581503, 0.4410374, -2.477398, 0, 0, 0, 1, 1,
-0.3567168, -0.756887, -3.050407, 0, 0, 0, 1, 1,
-0.3562833, -1.973367, -4.680458, 1, 1, 1, 1, 1,
-0.3526898, 1.614361, -1.679067, 1, 1, 1, 1, 1,
-0.3485537, 1.097722, -1.229949, 1, 1, 1, 1, 1,
-0.3433193, -1.561548, -2.362888, 1, 1, 1, 1, 1,
-0.339465, 1.110474, -3.252244, 1, 1, 1, 1, 1,
-0.335413, -0.2650542, -3.391751, 1, 1, 1, 1, 1,
-0.3350809, 0.009870351, -0.9228294, 1, 1, 1, 1, 1,
-0.329214, 0.9433436, -0.08151338, 1, 1, 1, 1, 1,
-0.3250076, 0.2502515, -2.045725, 1, 1, 1, 1, 1,
-0.3219081, 0.757954, 1.505975, 1, 1, 1, 1, 1,
-0.3165193, -0.2445096, -1.892386, 1, 1, 1, 1, 1,
-0.3095196, 0.7100828, -2.038188, 1, 1, 1, 1, 1,
-0.3091366, 0.1097552, 0.07983442, 1, 1, 1, 1, 1,
-0.3075351, -1.37162, -4.109443, 1, 1, 1, 1, 1,
-0.3062715, -0.2975522, -3.215241, 1, 1, 1, 1, 1,
-0.3055713, 1.101976, -1.749377, 0, 0, 1, 1, 1,
-0.3017274, 0.6495922, -0.0143077, 1, 0, 0, 1, 1,
-0.3004861, 0.6705952, -0.2985169, 1, 0, 0, 1, 1,
-0.2966946, -0.4075862, -3.690152, 1, 0, 0, 1, 1,
-0.2965644, 0.4912588, 0.7098757, 1, 0, 0, 1, 1,
-0.290724, 0.2339209, -1.246033, 1, 0, 0, 1, 1,
-0.2885887, -0.6100808, -2.372251, 0, 0, 0, 1, 1,
-0.2874761, -1.465016, -3.325717, 0, 0, 0, 1, 1,
-0.2841725, -0.7470074, -1.644076, 0, 0, 0, 1, 1,
-0.2830953, -0.005161518, -1.496396, 0, 0, 0, 1, 1,
-0.282321, -1.092111, -1.786508, 0, 0, 0, 1, 1,
-0.2809169, -0.9060535, -2.147297, 0, 0, 0, 1, 1,
-0.2787841, 0.5425332, -1.091428, 0, 0, 0, 1, 1,
-0.2767178, -0.4903559, -1.515556, 1, 1, 1, 1, 1,
-0.2751219, -0.7423345, -3.362776, 1, 1, 1, 1, 1,
-0.2723869, -0.1419552, -2.004408, 1, 1, 1, 1, 1,
-0.2687058, 0.4236225, -1.273559, 1, 1, 1, 1, 1,
-0.2679392, 1.813349, 1.322071, 1, 1, 1, 1, 1,
-0.2649803, -0.7702169, -2.637225, 1, 1, 1, 1, 1,
-0.2639714, 1.421909, -1.414426, 1, 1, 1, 1, 1,
-0.2625067, -0.5658536, -2.520531, 1, 1, 1, 1, 1,
-0.2580146, 0.2127632, -3.094615, 1, 1, 1, 1, 1,
-0.2473303, 1.06112, 0.02005445, 1, 1, 1, 1, 1,
-0.2459877, 0.07218973, -2.068818, 1, 1, 1, 1, 1,
-0.244157, -0.88278, -2.472205, 1, 1, 1, 1, 1,
-0.2410737, -0.9729003, -5.35043, 1, 1, 1, 1, 1,
-0.2369321, 1.312876, 0.9574303, 1, 1, 1, 1, 1,
-0.2301158, 1.891288, -0.8386858, 1, 1, 1, 1, 1,
-0.22787, 0.1411321, -0.7686085, 0, 0, 1, 1, 1,
-0.2255575, -0.9181353, -2.15515, 1, 0, 0, 1, 1,
-0.2215449, 0.2066536, 0.4783269, 1, 0, 0, 1, 1,
-0.2200534, -1.914531, -3.845818, 1, 0, 0, 1, 1,
-0.2156948, 0.7877396, -0.6173306, 1, 0, 0, 1, 1,
-0.2135106, 0.8942949, -1.570638, 1, 0, 0, 1, 1,
-0.2095044, -0.1319735, -1.345622, 0, 0, 0, 1, 1,
-0.2093382, 2.221932, -0.05382062, 0, 0, 0, 1, 1,
-0.2078294, -0.3734709, -4.846156, 0, 0, 0, 1, 1,
-0.2039256, -0.01675723, -2.675519, 0, 0, 0, 1, 1,
-0.2038347, -1.611409, -2.093424, 0, 0, 0, 1, 1,
-0.2033682, -1.144879, -2.562667, 0, 0, 0, 1, 1,
-0.2002032, -0.002358398, -0.9036785, 0, 0, 0, 1, 1,
-0.1972119, 0.6623161, -1.394132, 1, 1, 1, 1, 1,
-0.1947603, -0.4992366, -2.545401, 1, 1, 1, 1, 1,
-0.1940324, 0.6327633, 0.08611027, 1, 1, 1, 1, 1,
-0.1908568, -0.1061199, -0.9040828, 1, 1, 1, 1, 1,
-0.1903071, -0.2177308, -2.790041, 1, 1, 1, 1, 1,
-0.1885625, -0.2590446, -1.607423, 1, 1, 1, 1, 1,
-0.1780054, -0.1651013, -2.567715, 1, 1, 1, 1, 1,
-0.1754749, -1.057457, -1.38115, 1, 1, 1, 1, 1,
-0.1645598, -0.2992652, -1.424482, 1, 1, 1, 1, 1,
-0.1618518, 0.7783451, -0.7376266, 1, 1, 1, 1, 1,
-0.1605349, -0.8341455, -3.397731, 1, 1, 1, 1, 1,
-0.1570946, -0.9625623, -2.773256, 1, 1, 1, 1, 1,
-0.1570483, -2.129131, -2.703652, 1, 1, 1, 1, 1,
-0.1562735, 0.6376548, 0.2151151, 1, 1, 1, 1, 1,
-0.1535437, 0.04871653, -0.03046728, 1, 1, 1, 1, 1,
-0.152204, 1.429209, 0.3907982, 0, 0, 1, 1, 1,
-0.1507858, 0.4603141, 0.11077, 1, 0, 0, 1, 1,
-0.1499769, 1.164814, 0.2429644, 1, 0, 0, 1, 1,
-0.1452544, -1.59864, -3.458269, 1, 0, 0, 1, 1,
-0.14478, -0.2259938, -1.754976, 1, 0, 0, 1, 1,
-0.1413825, -0.5944158, -3.561833, 1, 0, 0, 1, 1,
-0.139156, 0.6187207, -0.3200547, 0, 0, 0, 1, 1,
-0.138014, 1.540166, -0.2833674, 0, 0, 0, 1, 1,
-0.1376805, -0.3510385, -2.134827, 0, 0, 0, 1, 1,
-0.1366301, 1.292709, 2.711674, 0, 0, 0, 1, 1,
-0.1355396, 0.1727025, -2.959163, 0, 0, 0, 1, 1,
-0.1267084, 0.6480768, -0.574071, 0, 0, 0, 1, 1,
-0.1220022, -0.3197453, -2.535131, 0, 0, 0, 1, 1,
-0.1174107, 1.247315, -0.327968, 1, 1, 1, 1, 1,
-0.1150556, -0.3991977, -2.895048, 1, 1, 1, 1, 1,
-0.1108114, 0.8678046, 0.06219891, 1, 1, 1, 1, 1,
-0.1033033, -0.2164485, -2.432361, 1, 1, 1, 1, 1,
-0.1024698, -0.09288958, -3.164965, 1, 1, 1, 1, 1,
-0.1006083, -0.2582348, -4.414854, 1, 1, 1, 1, 1,
-0.09979684, -0.2982424, -2.988373, 1, 1, 1, 1, 1,
-0.09606647, 1.672267, -0.6729823, 1, 1, 1, 1, 1,
-0.09423637, -1.087054, -4.653747, 1, 1, 1, 1, 1,
-0.0868834, -0.9593665, -1.603291, 1, 1, 1, 1, 1,
-0.08670749, -0.5029605, -3.117161, 1, 1, 1, 1, 1,
-0.08084716, 0.6055005, 0.2372866, 1, 1, 1, 1, 1,
-0.0806805, -2.244918, -2.38781, 1, 1, 1, 1, 1,
-0.07953186, -0.02842825, -1.629693, 1, 1, 1, 1, 1,
-0.07647722, 0.09219842, -0.277997, 1, 1, 1, 1, 1,
-0.07572065, 0.2763958, -0.794411, 0, 0, 1, 1, 1,
-0.07276577, -2.117703, -4.533837, 1, 0, 0, 1, 1,
-0.07210042, -1.255611, -3.208022, 1, 0, 0, 1, 1,
-0.07155173, 0.08520012, -0.9547752, 1, 0, 0, 1, 1,
-0.07118221, -0.4941115, -2.245229, 1, 0, 0, 1, 1,
-0.0705975, 0.1703873, -0.817552, 1, 0, 0, 1, 1,
-0.07057008, -0.5732993, -2.376481, 0, 0, 0, 1, 1,
-0.069394, 1.097417, -0.1442979, 0, 0, 0, 1, 1,
-0.06883093, 2.024826, -1.40285, 0, 0, 0, 1, 1,
-0.06825952, 1.659975, -1.158152, 0, 0, 0, 1, 1,
-0.06774771, 0.321616, -0.6875767, 0, 0, 0, 1, 1,
-0.06112994, -0.283621, -2.894652, 0, 0, 0, 1, 1,
-0.06102791, 0.2405305, 1.007205, 0, 0, 0, 1, 1,
-0.0598574, 1.004729, -0.5331243, 1, 1, 1, 1, 1,
-0.0566899, 0.05578274, -1.1698, 1, 1, 1, 1, 1,
-0.05623276, 1.026625, -0.09912559, 1, 1, 1, 1, 1,
-0.05389927, -0.7599486, -2.918942, 1, 1, 1, 1, 1,
-0.05374373, -1.154755, -2.580637, 1, 1, 1, 1, 1,
-0.05309082, 1.31548, 0.6793232, 1, 1, 1, 1, 1,
-0.05004873, -0.4637621, -4.619142, 1, 1, 1, 1, 1,
-0.04976283, -0.05151907, -2.438434, 1, 1, 1, 1, 1,
-0.04945591, -1.365122, -2.908559, 1, 1, 1, 1, 1,
-0.04513258, -1.813817, -4.191547, 1, 1, 1, 1, 1,
-0.04434025, 0.352567, -0.2792711, 1, 1, 1, 1, 1,
-0.03931832, 0.3689416, -0.5988917, 1, 1, 1, 1, 1,
-0.03921436, 0.2313136, -1.125734, 1, 1, 1, 1, 1,
-0.03847882, -0.5113524, -3.573998, 1, 1, 1, 1, 1,
-0.03602973, -0.3764441, -3.999307, 1, 1, 1, 1, 1,
-0.03481341, 1.19826, 0.08463858, 0, 0, 1, 1, 1,
-0.03074337, -0.4921108, -4.035813, 1, 0, 0, 1, 1,
-0.02995791, -0.5653303, -1.962978, 1, 0, 0, 1, 1,
-0.02753264, 1.186986, -0.9323123, 1, 0, 0, 1, 1,
-0.02410272, -0.2215137, -3.769068, 1, 0, 0, 1, 1,
-0.0213436, 0.3998025, -1.108602, 1, 0, 0, 1, 1,
-0.01859607, -0.7421179, -4.357605, 0, 0, 0, 1, 1,
-0.01664694, 1.313052, 1.569125, 0, 0, 0, 1, 1,
-0.01640304, -0.4937018, -3.997874, 0, 0, 0, 1, 1,
-0.01488671, 1.307058, -0.1801573, 0, 0, 0, 1, 1,
-0.01245674, -2.449428, -4.256526, 0, 0, 0, 1, 1,
-0.01196709, -0.05360349, -2.584683, 0, 0, 0, 1, 1,
-0.01164592, 0.570642, 0.2549837, 0, 0, 0, 1, 1,
-0.005948792, -0.6389479, -2.41794, 1, 1, 1, 1, 1,
-0.003843591, 0.6149572, 2.137389, 1, 1, 1, 1, 1,
-0.001373014, -0.8133008, -2.56333, 1, 1, 1, 1, 1,
-0.000702535, -2.225313, -3.113606, 1, 1, 1, 1, 1,
0.002505711, -2.216835, 2.361994, 1, 1, 1, 1, 1,
0.005318094, 1.280023, -1.704035, 1, 1, 1, 1, 1,
0.008797273, 0.7954399, 0.5560799, 1, 1, 1, 1, 1,
0.01250246, -0.1888615, 2.300856, 1, 1, 1, 1, 1,
0.0156833, -0.1596642, 2.014457, 1, 1, 1, 1, 1,
0.01703601, 0.4798633, -0.4805486, 1, 1, 1, 1, 1,
0.02176685, 0.08377725, -0.114173, 1, 1, 1, 1, 1,
0.02459448, -0.3859454, 2.937343, 1, 1, 1, 1, 1,
0.02563569, -0.5159879, 4.521882, 1, 1, 1, 1, 1,
0.02668131, -0.01936121, 2.568651, 1, 1, 1, 1, 1,
0.0267455, 0.8437222, -1.596277, 1, 1, 1, 1, 1,
0.03080011, -1.383374, 2.703121, 0, 0, 1, 1, 1,
0.03215416, 1.295423, -0.5158018, 1, 0, 0, 1, 1,
0.03522725, -0.1695772, 3.110742, 1, 0, 0, 1, 1,
0.04027735, 0.006229102, 0.5922091, 1, 0, 0, 1, 1,
0.04264405, -0.04171405, 1.455757, 1, 0, 0, 1, 1,
0.04303966, 0.1458481, 1.016419, 1, 0, 0, 1, 1,
0.04521798, -0.3893014, 4.730102, 0, 0, 0, 1, 1,
0.05158795, 0.2567122, -0.2592216, 0, 0, 0, 1, 1,
0.05196082, -0.5044392, 3.604975, 0, 0, 0, 1, 1,
0.05648444, -2.497053, 2.353904, 0, 0, 0, 1, 1,
0.05671198, -0.2224776, 3.631449, 0, 0, 0, 1, 1,
0.05873683, 0.5879722, -1.07564, 0, 0, 0, 1, 1,
0.05893822, -0.1101485, 1.558409, 0, 0, 0, 1, 1,
0.06111688, -0.201087, 0.6297326, 1, 1, 1, 1, 1,
0.06208181, -0.5139041, 4.272573, 1, 1, 1, 1, 1,
0.06351002, 0.3838974, -1.262733, 1, 1, 1, 1, 1,
0.06439923, -0.1373509, 2.492587, 1, 1, 1, 1, 1,
0.06544261, 0.8742215, -0.7551939, 1, 1, 1, 1, 1,
0.06599046, 1.94452, -0.6715833, 1, 1, 1, 1, 1,
0.07004756, 1.506883, 0.977659, 1, 1, 1, 1, 1,
0.07149912, -0.7668394, 3.182445, 1, 1, 1, 1, 1,
0.07699919, 0.07820826, 0.5361136, 1, 1, 1, 1, 1,
0.07999026, 0.2526284, -0.4467503, 1, 1, 1, 1, 1,
0.08066675, 0.920662, 1.152877, 1, 1, 1, 1, 1,
0.0825595, 0.1456223, 0.5671308, 1, 1, 1, 1, 1,
0.08421572, -1.034093, 2.220357, 1, 1, 1, 1, 1,
0.08486724, 0.3013081, 0.1769691, 1, 1, 1, 1, 1,
0.08602229, -1.0154, 2.874545, 1, 1, 1, 1, 1,
0.08810827, -0.4612662, 3.497165, 0, 0, 1, 1, 1,
0.09254736, -1.309854, 2.335765, 1, 0, 0, 1, 1,
0.09411816, -0.4240148, 3.561158, 1, 0, 0, 1, 1,
0.09812887, -0.09897134, 3.642975, 1, 0, 0, 1, 1,
0.099453, -0.2140019, 4.262185, 1, 0, 0, 1, 1,
0.1004367, -0.7316837, 2.314585, 1, 0, 0, 1, 1,
0.1008311, -0.41151, 3.175622, 0, 0, 0, 1, 1,
0.1077695, -0.6243235, 2.187558, 0, 0, 0, 1, 1,
0.1170186, -0.8075143, 3.817672, 0, 0, 0, 1, 1,
0.1212748, -0.0009262405, 2.868424, 0, 0, 0, 1, 1,
0.1251273, 0.365332, 2.761394, 0, 0, 0, 1, 1,
0.1297109, 1.725038, -0.159522, 0, 0, 0, 1, 1,
0.1316943, -0.3038192, 1.318357, 0, 0, 0, 1, 1,
0.133186, 0.460251, -0.1628659, 1, 1, 1, 1, 1,
0.1361793, -0.8985872, 3.122648, 1, 1, 1, 1, 1,
0.1394156, -1.267731, 1.892532, 1, 1, 1, 1, 1,
0.1398634, -1.102442, 3.530289, 1, 1, 1, 1, 1,
0.1437364, 0.1902045, 0.3764126, 1, 1, 1, 1, 1,
0.1498277, 1.46411, 1.343311, 1, 1, 1, 1, 1,
0.1511759, 0.04576233, 2.66613, 1, 1, 1, 1, 1,
0.1543941, -0.3151253, 5.523732, 1, 1, 1, 1, 1,
0.1564246, -1.321503, 4.170753, 1, 1, 1, 1, 1,
0.1588409, 0.4794753, 3.010795, 1, 1, 1, 1, 1,
0.1631624, -1.361412, 2.145521, 1, 1, 1, 1, 1,
0.1652644, -1.232754, 1.673838, 1, 1, 1, 1, 1,
0.1702047, 0.5370283, 2.504937, 1, 1, 1, 1, 1,
0.1714749, -0.3670818, 3.52183, 1, 1, 1, 1, 1,
0.1744944, -1.821016, 3.499027, 1, 1, 1, 1, 1,
0.1745495, -0.1300954, 2.820666, 0, 0, 1, 1, 1,
0.1761715, -0.1413246, 2.407271, 1, 0, 0, 1, 1,
0.1788094, 0.3137468, 0.711943, 1, 0, 0, 1, 1,
0.1802735, -0.1981435, 2.148912, 1, 0, 0, 1, 1,
0.1822686, 0.0381881, 0.9147803, 1, 0, 0, 1, 1,
0.1869914, -0.1735553, 2.262929, 1, 0, 0, 1, 1,
0.1882574, 1.135393, -0.215931, 0, 0, 0, 1, 1,
0.1886331, 1.08126, -0.001374338, 0, 0, 0, 1, 1,
0.1904278, -0.3815811, 4.044524, 0, 0, 0, 1, 1,
0.1951449, -1.128376, 3.544367, 0, 0, 0, 1, 1,
0.1955227, 0.1396811, 1.803976, 0, 0, 0, 1, 1,
0.19989, 0.3885254, 0.4912934, 0, 0, 0, 1, 1,
0.2044319, -1.187785, 3.22582, 0, 0, 0, 1, 1,
0.2047374, 0.7884348, 0.1310966, 1, 1, 1, 1, 1,
0.2063526, -0.1368898, 3.77692, 1, 1, 1, 1, 1,
0.2072895, 0.07991467, -0.2708196, 1, 1, 1, 1, 1,
0.2079789, 1.154886, -0.4894429, 1, 1, 1, 1, 1,
0.213114, 0.1759273, 0.1452746, 1, 1, 1, 1, 1,
0.2152399, -0.893016, 3.769873, 1, 1, 1, 1, 1,
0.2161277, 1.282021, 0.3521512, 1, 1, 1, 1, 1,
0.2174096, 0.7854555, -0.4444739, 1, 1, 1, 1, 1,
0.224903, -0.1303763, 0.8204506, 1, 1, 1, 1, 1,
0.2251277, 1.901093, -2.076153, 1, 1, 1, 1, 1,
0.2285611, -0.07049838, 2.405531, 1, 1, 1, 1, 1,
0.2289556, -1.617743, 3.409159, 1, 1, 1, 1, 1,
0.2291902, 0.6257538, -0.3075312, 1, 1, 1, 1, 1,
0.236369, -2.342411, 3.68953, 1, 1, 1, 1, 1,
0.2386271, 0.165885, 0.156271, 1, 1, 1, 1, 1,
0.239477, 0.4611222, 1.975955, 0, 0, 1, 1, 1,
0.2452962, 0.7417689, 1.282714, 1, 0, 0, 1, 1,
0.2503907, 1.187677, 0.739454, 1, 0, 0, 1, 1,
0.2516148, -0.1723587, 2.70628, 1, 0, 0, 1, 1,
0.2523896, 0.8861181, 0.3104878, 1, 0, 0, 1, 1,
0.2525301, -0.9183481, 3.883527, 1, 0, 0, 1, 1,
0.253874, 0.3148864, 2.308958, 0, 0, 0, 1, 1,
0.2591833, 1.497124, 0.3226749, 0, 0, 0, 1, 1,
0.2597833, -1.713301, 3.247553, 0, 0, 0, 1, 1,
0.2606107, -0.4163926, 2.376894, 0, 0, 0, 1, 1,
0.2618861, 0.3644892, 0.6548154, 0, 0, 0, 1, 1,
0.2629615, 0.5487924, -0.9905927, 0, 0, 0, 1, 1,
0.2649639, -1.049317, 1.229264, 0, 0, 0, 1, 1,
0.2662249, -0.5940365, 1.955816, 1, 1, 1, 1, 1,
0.266344, -0.4053345, 1.082754, 1, 1, 1, 1, 1,
0.2687126, -0.4630289, 2.971956, 1, 1, 1, 1, 1,
0.2694809, 0.7967225, -1.054024, 1, 1, 1, 1, 1,
0.2696482, 0.4217116, 1.397778, 1, 1, 1, 1, 1,
0.2748368, -0.3528236, 1.537805, 1, 1, 1, 1, 1,
0.2773643, 1.171613, 0.1825051, 1, 1, 1, 1, 1,
0.2793092, 1.353762, 1.490279, 1, 1, 1, 1, 1,
0.2813291, -0.5154108, 2.267607, 1, 1, 1, 1, 1,
0.2822207, -1.285233, 1.737911, 1, 1, 1, 1, 1,
0.2851819, -2.353923, 2.945684, 1, 1, 1, 1, 1,
0.2856441, -2.435072, 3.439129, 1, 1, 1, 1, 1,
0.2858932, -0.5966899, 2.093162, 1, 1, 1, 1, 1,
0.2872385, -0.3892167, 1.95016, 1, 1, 1, 1, 1,
0.2896294, -0.4309783, 3.223321, 1, 1, 1, 1, 1,
0.289898, -0.5277829, 1.463373, 0, 0, 1, 1, 1,
0.3013129, 0.6682717, 0.6260533, 1, 0, 0, 1, 1,
0.3131119, 1.978282, 2.220491, 1, 0, 0, 1, 1,
0.314995, -1.298438, 1.784842, 1, 0, 0, 1, 1,
0.316654, 1.899551, -1.316036, 1, 0, 0, 1, 1,
0.3169004, 0.6924744, -0.2156434, 1, 0, 0, 1, 1,
0.3173015, -0.7537572, 3.083561, 0, 0, 0, 1, 1,
0.3226164, -0.1136549, 2.707914, 0, 0, 0, 1, 1,
0.3229154, 1.758297, -0.1840015, 0, 0, 0, 1, 1,
0.3297639, -0.07627843, 0.5152106, 0, 0, 0, 1, 1,
0.3334422, 0.07982673, 2.771799, 0, 0, 0, 1, 1,
0.336142, 0.7324052, 1.309454, 0, 0, 0, 1, 1,
0.33764, 0.6996723, 0.3297583, 0, 0, 0, 1, 1,
0.3380688, -0.3683905, 3.699301, 1, 1, 1, 1, 1,
0.3387885, -0.3456071, 1.378181, 1, 1, 1, 1, 1,
0.3409566, -0.2789654, 1.414325, 1, 1, 1, 1, 1,
0.3415385, -0.9193364, 3.331911, 1, 1, 1, 1, 1,
0.3444091, -0.5202858, 3.375718, 1, 1, 1, 1, 1,
0.3445739, 0.4615531, -1.166384, 1, 1, 1, 1, 1,
0.3453671, -0.05967271, 1.728787, 1, 1, 1, 1, 1,
0.3460697, -0.9274076, 1.609641, 1, 1, 1, 1, 1,
0.346491, 0.5217384, 1.69813, 1, 1, 1, 1, 1,
0.3472907, 0.4412184, -0.2691664, 1, 1, 1, 1, 1,
0.347696, -0.3726889, 2.876776, 1, 1, 1, 1, 1,
0.348937, -2.379001, 3.682329, 1, 1, 1, 1, 1,
0.3500978, 0.6077812, 0.546434, 1, 1, 1, 1, 1,
0.3600515, -1.134975, 2.511237, 1, 1, 1, 1, 1,
0.3606826, -0.207519, 1.840526, 1, 1, 1, 1, 1,
0.3627722, -1.193632, 0.7383292, 0, 0, 1, 1, 1,
0.3644741, -0.09301384, 2.680354, 1, 0, 0, 1, 1,
0.3660813, -0.1063504, 1.01952, 1, 0, 0, 1, 1,
0.372597, -0.2302856, -0.6802403, 1, 0, 0, 1, 1,
0.3795586, 1.606664, 0.1919347, 1, 0, 0, 1, 1,
0.3830667, 1.290765, 0.2769398, 1, 0, 0, 1, 1,
0.3839418, -0.4338172, 0.4942941, 0, 0, 0, 1, 1,
0.3882426, -0.5230467, 1.491196, 0, 0, 0, 1, 1,
0.4029079, 0.521332, 1.688945, 0, 0, 0, 1, 1,
0.4029969, 0.7810962, -1.196573, 0, 0, 0, 1, 1,
0.4039029, -0.3791085, 2.31434, 0, 0, 0, 1, 1,
0.4044981, 0.2090815, 0.4396176, 0, 0, 0, 1, 1,
0.4052929, -1.565054, 1.629145, 0, 0, 0, 1, 1,
0.4097082, 0.9675536, 2.207273, 1, 1, 1, 1, 1,
0.4134577, 0.2540595, -1.358184, 1, 1, 1, 1, 1,
0.4173283, 1.076368, -0.6359311, 1, 1, 1, 1, 1,
0.4187269, -0.01105251, -0.3789903, 1, 1, 1, 1, 1,
0.4215125, 0.1165913, 1.406014, 1, 1, 1, 1, 1,
0.4279331, -1.109886, 2.416022, 1, 1, 1, 1, 1,
0.4299401, -0.3905421, 2.400895, 1, 1, 1, 1, 1,
0.4320793, -2.018487, 2.854966, 1, 1, 1, 1, 1,
0.4345462, 0.5234826, -2.633808, 1, 1, 1, 1, 1,
0.4396184, -1.879299, 2.526884, 1, 1, 1, 1, 1,
0.4406485, 0.7248085, -1.239269, 1, 1, 1, 1, 1,
0.4472615, -0.7576967, 2.682331, 1, 1, 1, 1, 1,
0.4505033, -0.1005194, 1.421752, 1, 1, 1, 1, 1,
0.4506537, -0.3905608, 3.565533, 1, 1, 1, 1, 1,
0.4527144, -1.728554, 2.589099, 1, 1, 1, 1, 1,
0.4551573, -0.7230282, 2.301765, 0, 0, 1, 1, 1,
0.4594627, -0.09887384, 3.22918, 1, 0, 0, 1, 1,
0.459986, 0.5053366, 0.09358987, 1, 0, 0, 1, 1,
0.4761838, 0.5579547, 1.954958, 1, 0, 0, 1, 1,
0.4768484, -0.7498745, 3.596075, 1, 0, 0, 1, 1,
0.483567, -0.6809748, 1.816347, 1, 0, 0, 1, 1,
0.4864764, -0.668026, 1.246916, 0, 0, 0, 1, 1,
0.486784, 0.392831, 2.880074, 0, 0, 0, 1, 1,
0.4882653, 0.480413, 1.224261, 0, 0, 0, 1, 1,
0.4888544, 1.574846, 1.437796, 0, 0, 0, 1, 1,
0.5058742, -0.275859, 3.239397, 0, 0, 0, 1, 1,
0.5064231, -1.473999, 4.156358, 0, 0, 0, 1, 1,
0.5091896, 0.9233685, 0.02893443, 0, 0, 0, 1, 1,
0.5120946, 1.037667, -0.09690484, 1, 1, 1, 1, 1,
0.5135093, -1.184715, 3.090806, 1, 1, 1, 1, 1,
0.5152826, 0.4406599, 2.481974, 1, 1, 1, 1, 1,
0.5186701, 1.234758, 0.1363077, 1, 1, 1, 1, 1,
0.5202814, 0.1200559, 1.429159, 1, 1, 1, 1, 1,
0.5224879, 0.5566336, 0.3655904, 1, 1, 1, 1, 1,
0.5233754, 0.8109194, -0.1587743, 1, 1, 1, 1, 1,
0.5259446, -0.7587488, 2.443094, 1, 1, 1, 1, 1,
0.5282347, 0.2103091, 1.164052, 1, 1, 1, 1, 1,
0.5300543, 0.795888, 2.355428, 1, 1, 1, 1, 1,
0.531608, 0.06335695, 2.484623, 1, 1, 1, 1, 1,
0.532442, -3.26683, 1.663882, 1, 1, 1, 1, 1,
0.5348288, -0.9938399, 2.896487, 1, 1, 1, 1, 1,
0.5430282, -0.1943591, 1.242587, 1, 1, 1, 1, 1,
0.5483878, 1.570307, 0.6448347, 1, 1, 1, 1, 1,
0.5490074, 0.2444441, 2.266684, 0, 0, 1, 1, 1,
0.5502225, 1.478952, 0.2763774, 1, 0, 0, 1, 1,
0.5509334, -0.3143257, 0.7044679, 1, 0, 0, 1, 1,
0.5518349, 0.4577917, 0.2648153, 1, 0, 0, 1, 1,
0.5550904, -0.8963397, 2.182093, 1, 0, 0, 1, 1,
0.5661481, -0.2040457, 1.6812, 1, 0, 0, 1, 1,
0.5685713, -0.1212507, 2.241723, 0, 0, 0, 1, 1,
0.5723814, -2.234476, 1.687581, 0, 0, 0, 1, 1,
0.5782297, -0.3933771, 0.6062589, 0, 0, 0, 1, 1,
0.5795258, -0.6332149, 4.283612, 0, 0, 0, 1, 1,
0.5845713, -1.025062, 3.258559, 0, 0, 0, 1, 1,
0.5861712, 0.178578, 1.022974, 0, 0, 0, 1, 1,
0.5948374, -1.336617, 2.340729, 0, 0, 0, 1, 1,
0.5972306, -1.283581, 1.721669, 1, 1, 1, 1, 1,
0.597473, -0.7715107, 3.176461, 1, 1, 1, 1, 1,
0.5994006, -0.9784144, 2.463737, 1, 1, 1, 1, 1,
0.6056541, 0.5456728, -1.91455, 1, 1, 1, 1, 1,
0.6091394, 0.7971702, 1.409022, 1, 1, 1, 1, 1,
0.6131089, 0.09351307, 0.9589926, 1, 1, 1, 1, 1,
0.6143453, -2.136006, 1.248038, 1, 1, 1, 1, 1,
0.6177065, 1.343991, -0.1830345, 1, 1, 1, 1, 1,
0.6209187, -1.07798, 1.533723, 1, 1, 1, 1, 1,
0.6215281, 0.7791958, -1.210004, 1, 1, 1, 1, 1,
0.6230353, 0.6571668, 1.272866, 1, 1, 1, 1, 1,
0.6245191, 0.6572791, -0.1681691, 1, 1, 1, 1, 1,
0.6245751, 0.1296639, 0.5841494, 1, 1, 1, 1, 1,
0.6256014, -0.5103034, 2.475053, 1, 1, 1, 1, 1,
0.6272569, 0.1435873, 0.973541, 1, 1, 1, 1, 1,
0.6287419, 0.022325, 1.230657, 0, 0, 1, 1, 1,
0.6298218, 1.445043, 0.3545809, 1, 0, 0, 1, 1,
0.6372845, -0.3620261, 1.29938, 1, 0, 0, 1, 1,
0.6448744, 0.6256309, 1.554202, 1, 0, 0, 1, 1,
0.646088, 0.01472374, 2.280208, 1, 0, 0, 1, 1,
0.6560543, 0.8155334, -0.2623965, 1, 0, 0, 1, 1,
0.6590409, 0.576243, 0.8048425, 0, 0, 0, 1, 1,
0.6608001, -0.3553639, 2.093776, 0, 0, 0, 1, 1,
0.669208, 0.1504428, 2.671911, 0, 0, 0, 1, 1,
0.6693223, 0.5382551, 3.354466, 0, 0, 0, 1, 1,
0.6736551, -0.0006574447, 1.901944, 0, 0, 0, 1, 1,
0.6773418, -0.08582942, 2.163243, 0, 0, 0, 1, 1,
0.6802236, 1.044472, 0.6918131, 0, 0, 0, 1, 1,
0.6808484, 0.2761987, 2.670569, 1, 1, 1, 1, 1,
0.6888078, 1.166898, 0.2583102, 1, 1, 1, 1, 1,
0.6926187, -0.7037441, 0.3177724, 1, 1, 1, 1, 1,
0.7126349, -0.4334287, 2.549571, 1, 1, 1, 1, 1,
0.7157832, -0.02246782, -0.8221974, 1, 1, 1, 1, 1,
0.7243201, 0.7814285, 0.4231836, 1, 1, 1, 1, 1,
0.7252706, -1.056859, 2.418488, 1, 1, 1, 1, 1,
0.7253851, -0.3090347, 1.258166, 1, 1, 1, 1, 1,
0.7299546, -0.9769416, 1.235852, 1, 1, 1, 1, 1,
0.730337, 0.2947111, 1.063318, 1, 1, 1, 1, 1,
0.7305648, -1.021854, 1.806987, 1, 1, 1, 1, 1,
0.7333384, 1.445612, 0.2208907, 1, 1, 1, 1, 1,
0.7395116, -0.1444805, -0.4268782, 1, 1, 1, 1, 1,
0.7396822, -0.1786013, 0.9149087, 1, 1, 1, 1, 1,
0.7426696, 0.3101806, 1.940947, 1, 1, 1, 1, 1,
0.7450293, 1.183978, -1.225817, 0, 0, 1, 1, 1,
0.7474077, 1.291474, -1.063184, 1, 0, 0, 1, 1,
0.7476937, -0.3908117, 2.676698, 1, 0, 0, 1, 1,
0.749302, 0.2502112, 0.6692078, 1, 0, 0, 1, 1,
0.7508227, 0.1933615, 0.165768, 1, 0, 0, 1, 1,
0.7517518, 0.1161798, 1.805081, 1, 0, 0, 1, 1,
0.7549181, -1.242045, 1.939965, 0, 0, 0, 1, 1,
0.7550902, 1.18787, 1.162174, 0, 0, 0, 1, 1,
0.7556155, -0.7451368, 2.114944, 0, 0, 0, 1, 1,
0.7559193, 0.3513117, 0.2078901, 0, 0, 0, 1, 1,
0.7567357, -0.8769969, 1.109598, 0, 0, 0, 1, 1,
0.7601616, 0.4738828, 1.604796, 0, 0, 0, 1, 1,
0.7605132, -0.7569993, 4.056313, 0, 0, 0, 1, 1,
0.7634704, -0.2599771, 2.72557, 1, 1, 1, 1, 1,
0.7647358, 0.6854775, 1.200956, 1, 1, 1, 1, 1,
0.7654308, 1.292078, 1.740588, 1, 1, 1, 1, 1,
0.7657923, 0.7425138, 0.321427, 1, 1, 1, 1, 1,
0.7663612, -1.34095, 3.289734, 1, 1, 1, 1, 1,
0.7711203, -1.311713, 2.738933, 1, 1, 1, 1, 1,
0.7715622, 0.8077045, 0.7683801, 1, 1, 1, 1, 1,
0.7717639, 0.3587133, 1.459121, 1, 1, 1, 1, 1,
0.7770959, -1.222374, 3.870339, 1, 1, 1, 1, 1,
0.7775432, 0.683168, -0.08190379, 1, 1, 1, 1, 1,
0.7812517, -0.9918011, 3.098309, 1, 1, 1, 1, 1,
0.7825667, -1.071538, 3.975327, 1, 1, 1, 1, 1,
0.7880208, -1.862289, 1.395576, 1, 1, 1, 1, 1,
0.7912724, -1.094177, 3.342895, 1, 1, 1, 1, 1,
0.8026632, -0.8324916, 1.673289, 1, 1, 1, 1, 1,
0.814867, -1.966899, 2.321557, 0, 0, 1, 1, 1,
0.8169572, 1.827808, 0.9561917, 1, 0, 0, 1, 1,
0.8277102, 0.03985017, 1.438222, 1, 0, 0, 1, 1,
0.8353986, -1.677793, 1.989914, 1, 0, 0, 1, 1,
0.840037, -0.5858558, 2.329386, 1, 0, 0, 1, 1,
0.8413195, 0.08843659, 2.149656, 1, 0, 0, 1, 1,
0.8492976, -0.4633911, 1.079163, 0, 0, 0, 1, 1,
0.8585909, -0.2111382, 1.630286, 0, 0, 0, 1, 1,
0.8616729, -0.3099616, 2.734933, 0, 0, 0, 1, 1,
0.8658635, -0.2442931, 1.785295, 0, 0, 0, 1, 1,
0.8682374, -0.2952281, 1.205317, 0, 0, 0, 1, 1,
0.8712433, -0.0362309, 0.1147468, 0, 0, 0, 1, 1,
0.8715693, -1.162124, 1.526899, 0, 0, 0, 1, 1,
0.881704, -2.003474, 2.102394, 1, 1, 1, 1, 1,
0.88422, -0.5785366, 0.09077584, 1, 1, 1, 1, 1,
0.8873549, 1.21951, 1.396003, 1, 1, 1, 1, 1,
0.8884943, 0.9667347, 1.458278, 1, 1, 1, 1, 1,
0.8890915, 0.3184276, 2.296169, 1, 1, 1, 1, 1,
0.9010841, 0.4460563, 2.454185, 1, 1, 1, 1, 1,
0.908044, 0.4158248, 1.742635, 1, 1, 1, 1, 1,
0.9091864, -0.8362073, 0.7289672, 1, 1, 1, 1, 1,
0.9132203, -0.4645999, 2.389269, 1, 1, 1, 1, 1,
0.9151496, 0.7233902, 2.18014, 1, 1, 1, 1, 1,
0.9208525, 0.5441484, 2.046456, 1, 1, 1, 1, 1,
0.922852, -0.5391086, 2.021824, 1, 1, 1, 1, 1,
0.9329771, 1.908629, 0.1227722, 1, 1, 1, 1, 1,
0.9375196, -1.14132, 1.978029, 1, 1, 1, 1, 1,
0.9403636, -0.09026599, 1.081976, 1, 1, 1, 1, 1,
0.9417958, -0.6454608, 2.903437, 0, 0, 1, 1, 1,
0.9418244, 0.4801625, 0.4988427, 1, 0, 0, 1, 1,
0.9477301, 2.019176, -0.1594404, 1, 0, 0, 1, 1,
0.9508792, 0.4303241, 1.382994, 1, 0, 0, 1, 1,
0.9607323, -0.9180889, 2.3954, 1, 0, 0, 1, 1,
0.9621488, 0.5131261, 1.481428, 1, 0, 0, 1, 1,
0.9649024, -0.9688653, 2.28225, 0, 0, 0, 1, 1,
0.9705884, -0.2059276, 3.332138, 0, 0, 0, 1, 1,
0.9760094, -1.529777, 1.76602, 0, 0, 0, 1, 1,
0.9762989, 1.310133, -0.6593649, 0, 0, 0, 1, 1,
0.983752, -1.487716, 3.947319, 0, 0, 0, 1, 1,
0.9870843, -0.2059178, 3.385363, 0, 0, 0, 1, 1,
0.9883404, 0.9382911, -0.1046699, 0, 0, 0, 1, 1,
1.001486, -0.4283678, 0.1133604, 1, 1, 1, 1, 1,
1.002105, 0.08527549, 2.087119, 1, 1, 1, 1, 1,
1.011458, 0.6345147, 2.809422, 1, 1, 1, 1, 1,
1.011905, -0.4932629, 2.621475, 1, 1, 1, 1, 1,
1.01833, 1.29529, 0.7315621, 1, 1, 1, 1, 1,
1.020098, 0.4982503, -0.6046731, 1, 1, 1, 1, 1,
1.020977, 1.381303, 0.3004247, 1, 1, 1, 1, 1,
1.025297, -1.53002, 1.975743, 1, 1, 1, 1, 1,
1.025317, 0.5061948, 0.8297921, 1, 1, 1, 1, 1,
1.036272, -0.2196976, 1.900016, 1, 1, 1, 1, 1,
1.036285, -0.5403468, 2.052633, 1, 1, 1, 1, 1,
1.046599, 0.9915608, 2.363144, 1, 1, 1, 1, 1,
1.046852, -0.8541802, 2.733061, 1, 1, 1, 1, 1,
1.050397, 0.4931012, 1.015829, 1, 1, 1, 1, 1,
1.053808, -0.2646548, 0.9116552, 1, 1, 1, 1, 1,
1.068017, 0.9054002, 0.1488605, 0, 0, 1, 1, 1,
1.0753, 0.6218259, 1.31638, 1, 0, 0, 1, 1,
1.094521, -1.091785, 2.869402, 1, 0, 0, 1, 1,
1.095878, 1.35447, 1.393664, 1, 0, 0, 1, 1,
1.104563, -0.1943084, 1.341823, 1, 0, 0, 1, 1,
1.104908, 0.4307366, 1.271324, 1, 0, 0, 1, 1,
1.107063, 0.4473772, 0.4209032, 0, 0, 0, 1, 1,
1.107595, -0.1171241, 1.28893, 0, 0, 0, 1, 1,
1.109261, 0.1417126, 2.95693, 0, 0, 0, 1, 1,
1.119569, -0.4579282, 2.530146, 0, 0, 0, 1, 1,
1.12161, -0.9072673, 2.11128, 0, 0, 0, 1, 1,
1.142288, -0.571681, 0.8928837, 0, 0, 0, 1, 1,
1.147107, -0.525084, 2.779336, 0, 0, 0, 1, 1,
1.154478, 0.1456261, 0.7215087, 1, 1, 1, 1, 1,
1.154727, -0.2687418, 1.726558, 1, 1, 1, 1, 1,
1.157078, -1.156965, 3.620384, 1, 1, 1, 1, 1,
1.174438, 0.1182172, 0.6273188, 1, 1, 1, 1, 1,
1.174807, -0.1448661, 0.8037471, 1, 1, 1, 1, 1,
1.181769, -0.5825033, -0.2898083, 1, 1, 1, 1, 1,
1.189512, 0.1878631, 1.85227, 1, 1, 1, 1, 1,
1.191384, -0.1337584, 1.634932, 1, 1, 1, 1, 1,
1.192722, 0.6499206, 2.125178, 1, 1, 1, 1, 1,
1.193196, -0.7839605, 2.125298, 1, 1, 1, 1, 1,
1.202415, -0.9314421, 2.582035, 1, 1, 1, 1, 1,
1.221178, 0.03743463, 0.2776921, 1, 1, 1, 1, 1,
1.238033, -2.0658, 3.232382, 1, 1, 1, 1, 1,
1.240418, 0.909234, 0.9145813, 1, 1, 1, 1, 1,
1.240473, 1.160917, -0.7716772, 1, 1, 1, 1, 1,
1.245456, -0.542891, 2.195456, 0, 0, 1, 1, 1,
1.246641, -0.8426238, 2.090777, 1, 0, 0, 1, 1,
1.253283, -0.2517265, 1.731064, 1, 0, 0, 1, 1,
1.257292, -1.396512, 1.978668, 1, 0, 0, 1, 1,
1.264849, -0.7174133, 3.12946, 1, 0, 0, 1, 1,
1.273447, -0.06460023, 1.304026, 1, 0, 0, 1, 1,
1.280847, -1.276615, 0.9562343, 0, 0, 0, 1, 1,
1.283881, 0.2558682, -0.0185055, 0, 0, 0, 1, 1,
1.287457, -1.893028, 2.545758, 0, 0, 0, 1, 1,
1.288075, 1.073411, 1.010919, 0, 0, 0, 1, 1,
1.303925, 0.4000096, -0.05826071, 0, 0, 0, 1, 1,
1.307631, -1.450326, 1.944239, 0, 0, 0, 1, 1,
1.31134, 0.9457092, -0.5663432, 0, 0, 0, 1, 1,
1.324843, 0.8158995, 0.9660201, 1, 1, 1, 1, 1,
1.328612, 0.4301096, 3.09411, 1, 1, 1, 1, 1,
1.330109, 0.4002621, 2.589764, 1, 1, 1, 1, 1,
1.333495, -0.4585883, 3.586742, 1, 1, 1, 1, 1,
1.337298, -1.131, 1.350598, 1, 1, 1, 1, 1,
1.337307, -1.584664, 1.703316, 1, 1, 1, 1, 1,
1.353361, 0.5806231, 0.8452207, 1, 1, 1, 1, 1,
1.362951, -1.428988, 3.184699, 1, 1, 1, 1, 1,
1.376374, -0.6400588, 2.415586, 1, 1, 1, 1, 1,
1.380516, 1.311571, -0.2244706, 1, 1, 1, 1, 1,
1.382013, 1.077494, -0.7179737, 1, 1, 1, 1, 1,
1.38668, 0.003137928, 1.474021, 1, 1, 1, 1, 1,
1.386913, -1.351035, 2.785263, 1, 1, 1, 1, 1,
1.398514, -1.371598, 3.032669, 1, 1, 1, 1, 1,
1.402229, -1.298787, 1.969462, 1, 1, 1, 1, 1,
1.408907, 0.8540168, 1.219177, 0, 0, 1, 1, 1,
1.419122, -0.001831492, 1.934667, 1, 0, 0, 1, 1,
1.435814, 0.8217162, 0.7952495, 1, 0, 0, 1, 1,
1.447919, -1.055649, 2.129043, 1, 0, 0, 1, 1,
1.455517, 0.8547817, 1.546782, 1, 0, 0, 1, 1,
1.457514, 0.6674802, 0.5833138, 1, 0, 0, 1, 1,
1.467335, 0.4250085, 2.740483, 0, 0, 0, 1, 1,
1.468717, -0.2027383, -0.513259, 0, 0, 0, 1, 1,
1.474248, -2.345264, 3.635373, 0, 0, 0, 1, 1,
1.482772, 1.033184, 2.537229, 0, 0, 0, 1, 1,
1.488473, 0.3975932, 0.1199867, 0, 0, 0, 1, 1,
1.50485, -0.6147554, 0.6994474, 0, 0, 0, 1, 1,
1.512908, -0.3436801, 1.179311, 0, 0, 0, 1, 1,
1.524665, 1.5868, 0.5069832, 1, 1, 1, 1, 1,
1.532615, -0.4150223, 2.533662, 1, 1, 1, 1, 1,
1.554394, -0.7958615, 3.791737, 1, 1, 1, 1, 1,
1.561419, -0.5482942, 2.948742, 1, 1, 1, 1, 1,
1.590541, 0.2501294, 1.958534, 1, 1, 1, 1, 1,
1.603944, -1.495533, 1.837897, 1, 1, 1, 1, 1,
1.604627, -0.439944, 1.806806, 1, 1, 1, 1, 1,
1.611135, -1.15159, 1.795214, 1, 1, 1, 1, 1,
1.62174, -0.3397548, 1.256016, 1, 1, 1, 1, 1,
1.65758, 1.154638, 1.369002, 1, 1, 1, 1, 1,
1.662131, -0.1695488, 1.871947, 1, 1, 1, 1, 1,
1.671267, -1.206702, 3.727663, 1, 1, 1, 1, 1,
1.680438, -1.073202, 3.248536, 1, 1, 1, 1, 1,
1.682057, -1.395006, 2.850421, 1, 1, 1, 1, 1,
1.686656, 0.2866154, 2.559303, 1, 1, 1, 1, 1,
1.68876, -2.906776, 1.771205, 0, 0, 1, 1, 1,
1.698407, -0.8852594, 1.433781, 1, 0, 0, 1, 1,
1.698511, -0.9170869, 0.7284836, 1, 0, 0, 1, 1,
1.709005, 0.3136684, 1.222081, 1, 0, 0, 1, 1,
1.763263, -1.339195, 1.320419, 1, 0, 0, 1, 1,
1.79763, 0.6777983, -0.1576131, 1, 0, 0, 1, 1,
1.83368, 0.5850489, 0.8771951, 0, 0, 0, 1, 1,
1.87973, 0.674606, -0.2308213, 0, 0, 0, 1, 1,
1.884695, 0.04765505, 1.424636, 0, 0, 0, 1, 1,
1.887942, -0.6732067, 0.542307, 0, 0, 0, 1, 1,
1.893384, -1.138409, 3.019796, 0, 0, 0, 1, 1,
1.91516, -0.2685514, 2.133901, 0, 0, 0, 1, 1,
1.925099, 0.439395, 1.87571, 0, 0, 0, 1, 1,
1.925872, -0.4451905, 0.9707182, 1, 1, 1, 1, 1,
1.927711, 0.2945373, 1.471951, 1, 1, 1, 1, 1,
1.929915, 0.7452119, 2.652142, 1, 1, 1, 1, 1,
1.932603, 1.099171, 2.566708, 1, 1, 1, 1, 1,
1.933277, 1.118946, -0.06930166, 1, 1, 1, 1, 1,
1.941398, 1.815709, 0.3220682, 1, 1, 1, 1, 1,
1.941981, 0.5430272, 1.144695, 1, 1, 1, 1, 1,
1.967315, -0.4081497, 1.2668, 1, 1, 1, 1, 1,
2.025693, 1.099467, 1.807992, 1, 1, 1, 1, 1,
2.03169, 0.3395191, 2.563239, 1, 1, 1, 1, 1,
2.036649, -0.9778517, 1.958097, 1, 1, 1, 1, 1,
2.050135, -0.1639028, -0.4231875, 1, 1, 1, 1, 1,
2.072352, 1.08274, 2.911006, 1, 1, 1, 1, 1,
2.076921, 0.2889002, 1.541322, 1, 1, 1, 1, 1,
2.082477, -0.02960101, 0.5363197, 1, 1, 1, 1, 1,
2.126084, -1.24137, 1.891279, 0, 0, 1, 1, 1,
2.24527, 0.6859726, 1.276208, 1, 0, 0, 1, 1,
2.253874, 0.264505, 0.6631352, 1, 0, 0, 1, 1,
2.27902, 0.3106811, 2.058053, 1, 0, 0, 1, 1,
2.310924, 0.1307445, 1.543823, 1, 0, 0, 1, 1,
2.314507, 0.3367499, 3.43299, 1, 0, 0, 1, 1,
2.315459, -0.2755391, 4.257156, 0, 0, 0, 1, 1,
2.354783, -0.2763096, 2.763752, 0, 0, 0, 1, 1,
2.365898, 1.370116, 2.470798, 0, 0, 0, 1, 1,
2.385431, -0.9302815, 1.637158, 0, 0, 0, 1, 1,
2.433513, -0.2508723, 3.145074, 0, 0, 0, 1, 1,
2.555644, -1.146298, 2.330385, 0, 0, 0, 1, 1,
2.6092, 0.1720356, 2.156682, 0, 0, 0, 1, 1,
2.671152, -0.827544, 0.688573, 1, 1, 1, 1, 1,
2.701489, -0.4104348, 0.9458031, 1, 1, 1, 1, 1,
2.962849, 0.8727458, 1.290257, 1, 1, 1, 1, 1,
3.101722, -0.2807029, 0.8191006, 1, 1, 1, 1, 1,
3.13504, -0.9530511, 2.46289, 1, 1, 1, 1, 1,
3.223, -1.792847, 2.174534, 1, 1, 1, 1, 1,
3.316252, 1.346378, 0.5887505, 1, 1, 1, 1, 1
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
var radius = 9.742186;
var distance = 34.21902;
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
mvMatrix.translate( -0.04528904, 0.7357535, -0.08665061 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21902);
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