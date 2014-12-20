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
-3.034692, -0.7376626, -0.2538753, 1, 0, 0, 1,
-2.995911, -1.999383, -2.114969, 1, 0.007843138, 0, 1,
-2.868756, 3.938431, -0.6629812, 1, 0.01176471, 0, 1,
-2.860741, -0.7889022, -1.104561, 1, 0.01960784, 0, 1,
-2.646704, 1.535051, -0.9559632, 1, 0.02352941, 0, 1,
-2.564556, -0.3806866, -0.6523878, 1, 0.03137255, 0, 1,
-2.557264, 0.4891162, -3.093494, 1, 0.03529412, 0, 1,
-2.456872, -0.04085999, -1.113218, 1, 0.04313726, 0, 1,
-2.368922, 1.137485, -0.4549822, 1, 0.04705882, 0, 1,
-2.29454, 0.869628, -0.3270926, 1, 0.05490196, 0, 1,
-2.288685, -2.386904, -3.753141, 1, 0.05882353, 0, 1,
-2.265693, -0.04578618, -2.348588, 1, 0.06666667, 0, 1,
-2.219864, -1.080707, -2.510283, 1, 0.07058824, 0, 1,
-2.200701, 0.4077019, -0.8191119, 1, 0.07843138, 0, 1,
-2.194363, 1.292062, 0.144811, 1, 0.08235294, 0, 1,
-2.193319, -0.3883838, -2.17856, 1, 0.09019608, 0, 1,
-2.182486, -0.9554193, -1.740562, 1, 0.09411765, 0, 1,
-2.140641, -0.3397104, -3.43808, 1, 0.1019608, 0, 1,
-2.130496, -1.826461, -3.513051, 1, 0.1098039, 0, 1,
-2.120996, -1.855274, -0.6599877, 1, 0.1137255, 0, 1,
-2.048641, -0.2089121, -1.064457, 1, 0.1215686, 0, 1,
-2.021546, -0.7588823, -0.3328098, 1, 0.1254902, 0, 1,
-1.996394, -1.553579, -1.0224, 1, 0.1333333, 0, 1,
-1.986422, 0.0835944, -1.840116, 1, 0.1372549, 0, 1,
-1.971207, 0.09239311, 0.0750762, 1, 0.145098, 0, 1,
-1.926914, 0.7253963, -1.742746, 1, 0.1490196, 0, 1,
-1.923486, 1.400984, -1.483114, 1, 0.1568628, 0, 1,
-1.917546, -0.1319799, -1.229286, 1, 0.1607843, 0, 1,
-1.901953, -1.093173, -1.324867, 1, 0.1686275, 0, 1,
-1.883187, -1.192953, -3.406086, 1, 0.172549, 0, 1,
-1.882932, -1.249553, -1.710186, 1, 0.1803922, 0, 1,
-1.850217, 1.268027, -2.347379, 1, 0.1843137, 0, 1,
-1.841124, 0.338835, -0.6814317, 1, 0.1921569, 0, 1,
-1.837336, -1.339771, -1.959069, 1, 0.1960784, 0, 1,
-1.824232, 0.8341448, -1.107063, 1, 0.2039216, 0, 1,
-1.820895, -0.01805762, -0.176909, 1, 0.2117647, 0, 1,
-1.797838, -0.2776169, -1.006125, 1, 0.2156863, 0, 1,
-1.79137, 0.5318019, -1.148031, 1, 0.2235294, 0, 1,
-1.790448, 0.5062104, -2.459934, 1, 0.227451, 0, 1,
-1.782259, -0.1642777, -2.840057, 1, 0.2352941, 0, 1,
-1.744393, 1.792857, -0.6684927, 1, 0.2392157, 0, 1,
-1.736413, -1.759615, -3.146931, 1, 0.2470588, 0, 1,
-1.702457, 1.544547, 0.8602151, 1, 0.2509804, 0, 1,
-1.702055, 0.275081, 0.247639, 1, 0.2588235, 0, 1,
-1.690207, -1.719271, -2.774843, 1, 0.2627451, 0, 1,
-1.659645, -1.609229, -2.822061, 1, 0.2705882, 0, 1,
-1.659283, 0.1700033, -0.689375, 1, 0.2745098, 0, 1,
-1.636904, 0.1609327, -1.877602, 1, 0.282353, 0, 1,
-1.62898, 0.819836, -1.270854, 1, 0.2862745, 0, 1,
-1.60894, -1.002841, -3.375164, 1, 0.2941177, 0, 1,
-1.591528, -0.3459418, -2.160602, 1, 0.3019608, 0, 1,
-1.589599, 1.311661, -1.631164, 1, 0.3058824, 0, 1,
-1.584846, -1.120636, -3.037169, 1, 0.3137255, 0, 1,
-1.573094, -1.078844, -0.9855433, 1, 0.3176471, 0, 1,
-1.557373, -0.2938585, -3.82091, 1, 0.3254902, 0, 1,
-1.547841, 0.9427794, -1.636789, 1, 0.3294118, 0, 1,
-1.546761, 0.5534573, -0.5491725, 1, 0.3372549, 0, 1,
-1.541493, 0.4860069, -0.4053834, 1, 0.3411765, 0, 1,
-1.529922, 0.8912909, -0.6138628, 1, 0.3490196, 0, 1,
-1.526313, -0.08021526, -1.061102, 1, 0.3529412, 0, 1,
-1.512643, -0.08148023, -0.9409083, 1, 0.3607843, 0, 1,
-1.510546, -1.713717, -3.288043, 1, 0.3647059, 0, 1,
-1.502169, 0.9418278, -0.8483183, 1, 0.372549, 0, 1,
-1.499076, -0.07981253, -2.50187, 1, 0.3764706, 0, 1,
-1.492304, -0.2991639, -1.511212, 1, 0.3843137, 0, 1,
-1.49212, 0.1079328, -0.7293125, 1, 0.3882353, 0, 1,
-1.490053, 0.3766733, -2.691879, 1, 0.3960784, 0, 1,
-1.475728, -0.4994216, -1.964247, 1, 0.4039216, 0, 1,
-1.475619, -0.8786472, -2.089849, 1, 0.4078431, 0, 1,
-1.45305, -2.263239, -3.753013, 1, 0.4156863, 0, 1,
-1.450212, -0.5418745, -2.900298, 1, 0.4196078, 0, 1,
-1.445859, -1.666374, -2.53782, 1, 0.427451, 0, 1,
-1.437317, 0.6252577, -2.032556, 1, 0.4313726, 0, 1,
-1.414432, -1.112543, -1.252262, 1, 0.4392157, 0, 1,
-1.4078, -0.9188331, -0.1315543, 1, 0.4431373, 0, 1,
-1.390974, 1.407421, -0.9215257, 1, 0.4509804, 0, 1,
-1.376908, -0.07476909, -1.68919, 1, 0.454902, 0, 1,
-1.369825, -0.7726198, -3.16198, 1, 0.4627451, 0, 1,
-1.368288, -0.7713555, -2.770926, 1, 0.4666667, 0, 1,
-1.340388, -0.1138097, 0.3379435, 1, 0.4745098, 0, 1,
-1.33488, -0.6866364, -1.382561, 1, 0.4784314, 0, 1,
-1.329989, 0.7292907, -0.5672361, 1, 0.4862745, 0, 1,
-1.329313, 0.7557843, -1.956464, 1, 0.4901961, 0, 1,
-1.315142, -0.6828641, -1.020319, 1, 0.4980392, 0, 1,
-1.311865, -1.828529, -1.800612, 1, 0.5058824, 0, 1,
-1.311505, 0.7466182, -1.873236, 1, 0.509804, 0, 1,
-1.306847, 0.3718782, -1.822651, 1, 0.5176471, 0, 1,
-1.299883, -0.6331045, -1.897745, 1, 0.5215687, 0, 1,
-1.294723, 0.8833525, 0.1415065, 1, 0.5294118, 0, 1,
-1.291255, 1.025297, -0.5249683, 1, 0.5333334, 0, 1,
-1.283054, 1.020697, -0.6915026, 1, 0.5411765, 0, 1,
-1.280841, -0.5629495, -3.731926, 1, 0.5450981, 0, 1,
-1.280223, -0.4461361, -2.666935, 1, 0.5529412, 0, 1,
-1.274317, -0.3008929, -1.773389, 1, 0.5568628, 0, 1,
-1.2723, -0.5167058, -4.027497, 1, 0.5647059, 0, 1,
-1.265088, -0.7174516, -4.089173, 1, 0.5686275, 0, 1,
-1.263524, -1.224871, -3.277565, 1, 0.5764706, 0, 1,
-1.261142, 0.8895889, -1.248108, 1, 0.5803922, 0, 1,
-1.257297, -0.3915743, -1.301519, 1, 0.5882353, 0, 1,
-1.255714, -0.1212633, -1.791516, 1, 0.5921569, 0, 1,
-1.244112, 1.209794, -0.4946251, 1, 0.6, 0, 1,
-1.237912, -0.2445756, -4.158259, 1, 0.6078432, 0, 1,
-1.234091, -0.4582164, -1.079339, 1, 0.6117647, 0, 1,
-1.229283, 0.25293, -2.032017, 1, 0.6196079, 0, 1,
-1.22229, 0.7765871, -3.215547, 1, 0.6235294, 0, 1,
-1.212169, -0.3099217, -2.194981, 1, 0.6313726, 0, 1,
-1.211503, -0.06163257, -1.261107, 1, 0.6352941, 0, 1,
-1.203515, 1.908098, -1.844229, 1, 0.6431373, 0, 1,
-1.199586, -1.507728, -2.046637, 1, 0.6470588, 0, 1,
-1.19444, 0.4822376, -1.697055, 1, 0.654902, 0, 1,
-1.186983, -0.4390823, -3.233966, 1, 0.6588235, 0, 1,
-1.181352, 0.7830672, -2.622204, 1, 0.6666667, 0, 1,
-1.172989, -0.05727839, -2.620173, 1, 0.6705883, 0, 1,
-1.171322, -1.587671, -3.313908, 1, 0.6784314, 0, 1,
-1.169621, -0.8629845, -2.692378, 1, 0.682353, 0, 1,
-1.168318, 1.078518, -3.058243, 1, 0.6901961, 0, 1,
-1.167692, -0.007266734, -3.884094, 1, 0.6941177, 0, 1,
-1.165482, -0.2691652, 0.2763309, 1, 0.7019608, 0, 1,
-1.162536, 0.9923441, -0.5507051, 1, 0.7098039, 0, 1,
-1.157577, -0.4081286, -1.768178, 1, 0.7137255, 0, 1,
-1.152645, 0.06457468, -0.6128766, 1, 0.7215686, 0, 1,
-1.152304, -0.707132, -0.7545146, 1, 0.7254902, 0, 1,
-1.13466, 0.8341788, 0.7499807, 1, 0.7333333, 0, 1,
-1.134425, 0.4660425, -1.34588, 1, 0.7372549, 0, 1,
-1.126983, 1.220857, 0.7626165, 1, 0.7450981, 0, 1,
-1.124692, 1.905534, -0.3089889, 1, 0.7490196, 0, 1,
-1.123192, 1.331436, -2.429442, 1, 0.7568628, 0, 1,
-1.121635, 0.3532956, -0.8260452, 1, 0.7607843, 0, 1,
-1.116558, -0.2646653, 0.08863996, 1, 0.7686275, 0, 1,
-1.105716, 0.9411345, -0.8942593, 1, 0.772549, 0, 1,
-1.08803, 0.4801024, -0.7019013, 1, 0.7803922, 0, 1,
-1.084871, 2.616424, -0.9622269, 1, 0.7843137, 0, 1,
-1.081695, -1.079107, -0.9489166, 1, 0.7921569, 0, 1,
-1.081439, 0.1956669, -2.008329, 1, 0.7960784, 0, 1,
-1.070606, -0.1474274, -2.738141, 1, 0.8039216, 0, 1,
-1.069696, -0.1254315, -1.453304, 1, 0.8117647, 0, 1,
-1.066595, 1.022682, -1.036135, 1, 0.8156863, 0, 1,
-1.060978, -1.049334, -0.5161808, 1, 0.8235294, 0, 1,
-1.060764, 1.347506, -1.356047, 1, 0.827451, 0, 1,
-1.060687, -2.238034, -3.773588, 1, 0.8352941, 0, 1,
-1.058607, 0.05827826, -0.1015433, 1, 0.8392157, 0, 1,
-1.053938, -0.9476574, -2.807312, 1, 0.8470588, 0, 1,
-1.050536, -0.4033794, -1.569341, 1, 0.8509804, 0, 1,
-1.044349, -0.4219926, -1.599285, 1, 0.8588235, 0, 1,
-1.044245, -0.6398134, -0.2455705, 1, 0.8627451, 0, 1,
-1.039012, 0.4633277, -0.8423833, 1, 0.8705882, 0, 1,
-1.025534, -1.053585, -2.011101, 1, 0.8745098, 0, 1,
-1.023763, -0.2512251, -2.676194, 1, 0.8823529, 0, 1,
-1.021101, -0.8321741, -2.298381, 1, 0.8862745, 0, 1,
-1.020809, -0.1400188, -0.3994366, 1, 0.8941177, 0, 1,
-1.016939, 0.01332276, -0.4162348, 1, 0.8980392, 0, 1,
-1.011199, -0.4006146, -1.823721, 1, 0.9058824, 0, 1,
-1.00872, 1.218278, -1.333409, 1, 0.9137255, 0, 1,
-0.9967651, -1.323801, -1.250803, 1, 0.9176471, 0, 1,
-0.9889578, 0.8878789, -2.155374, 1, 0.9254902, 0, 1,
-0.9861078, 0.458023, -0.9842037, 1, 0.9294118, 0, 1,
-0.984833, -0.378351, -1.231817, 1, 0.9372549, 0, 1,
-0.9825852, -0.1156033, 0.007437877, 1, 0.9411765, 0, 1,
-0.981998, -0.3136092, -1.470093, 1, 0.9490196, 0, 1,
-0.9792917, 0.245949, -1.466151, 1, 0.9529412, 0, 1,
-0.975852, -1.691432, -2.51681, 1, 0.9607843, 0, 1,
-0.9756508, 0.429271, -1.85863, 1, 0.9647059, 0, 1,
-0.9699439, -0.5224693, -1.834991, 1, 0.972549, 0, 1,
-0.9699332, 0.3198397, -1.117923, 1, 0.9764706, 0, 1,
-0.9688184, 0.2384989, -1.304639, 1, 0.9843137, 0, 1,
-0.9682621, 1.688833, 0.8365762, 1, 0.9882353, 0, 1,
-0.9635857, -0.2260468, -2.677101, 1, 0.9960784, 0, 1,
-0.9560276, -2.353414, -1.72708, 0.9960784, 1, 0, 1,
-0.9526985, 0.4659829, -0.2979224, 0.9921569, 1, 0, 1,
-0.9511055, 0.2031068, -2.840054, 0.9843137, 1, 0, 1,
-0.9448502, -0.4634917, -2.161831, 0.9803922, 1, 0, 1,
-0.944805, 0.4344956, -2.739357, 0.972549, 1, 0, 1,
-0.9434533, -0.6583368, -1.942923, 0.9686275, 1, 0, 1,
-0.9426066, -0.427686, -2.222167, 0.9607843, 1, 0, 1,
-0.9391755, 0.3376275, -1.968487, 0.9568627, 1, 0, 1,
-0.9350664, -0.8163535, -2.247824, 0.9490196, 1, 0, 1,
-0.9328904, -0.9993711, -3.980287, 0.945098, 1, 0, 1,
-0.9322659, 0.3995224, -1.915846, 0.9372549, 1, 0, 1,
-0.9298792, 1.617259, -0.3053074, 0.9333333, 1, 0, 1,
-0.9297289, 1.928001, 0.9421849, 0.9254902, 1, 0, 1,
-0.9295123, -1.814996, -2.478843, 0.9215686, 1, 0, 1,
-0.9273782, 0.5269381, -0.05592882, 0.9137255, 1, 0, 1,
-0.9234154, -0.6171689, -2.604339, 0.9098039, 1, 0, 1,
-0.9190325, -0.6214915, -4.052777, 0.9019608, 1, 0, 1,
-0.9160696, -0.5720571, -1.60823, 0.8941177, 1, 0, 1,
-0.9157904, 1.578421, -1.055586, 0.8901961, 1, 0, 1,
-0.9133756, 2.472949, 1.093305, 0.8823529, 1, 0, 1,
-0.9065434, 1.052416, -4.151639, 0.8784314, 1, 0, 1,
-0.9064242, 0.1496911, -0.7168325, 0.8705882, 1, 0, 1,
-0.9060727, -0.3655875, -1.611238, 0.8666667, 1, 0, 1,
-0.9036673, 0.7084135, 0.8895819, 0.8588235, 1, 0, 1,
-0.8846082, 2.105738, 0.5561472, 0.854902, 1, 0, 1,
-0.8800405, 0.1540577, 0.1475898, 0.8470588, 1, 0, 1,
-0.8778093, -0.2458013, -1.829045, 0.8431373, 1, 0, 1,
-0.8739076, 0.4245827, -0.1637537, 0.8352941, 1, 0, 1,
-0.8737442, -1.260611, -3.066098, 0.8313726, 1, 0, 1,
-0.8736566, -0.6506442, -2.553962, 0.8235294, 1, 0, 1,
-0.8710665, 0.1427165, -1.087919, 0.8196079, 1, 0, 1,
-0.8596078, 0.3251932, -1.603336, 0.8117647, 1, 0, 1,
-0.8575882, -0.9304053, -2.087904, 0.8078431, 1, 0, 1,
-0.8574567, 0.6640049, -1.297098, 0.8, 1, 0, 1,
-0.8508155, 0.4575129, -0.5299689, 0.7921569, 1, 0, 1,
-0.8474883, 2.340689, -0.3345111, 0.7882353, 1, 0, 1,
-0.8467385, -0.4026578, -2.884729, 0.7803922, 1, 0, 1,
-0.8463417, -0.0415751, -1.799121, 0.7764706, 1, 0, 1,
-0.8460308, 0.1207185, -2.416178, 0.7686275, 1, 0, 1,
-0.8450298, -0.469089, -2.237197, 0.7647059, 1, 0, 1,
-0.8432868, 1.290414, -0.7979915, 0.7568628, 1, 0, 1,
-0.8417664, 1.385866, -1.664636, 0.7529412, 1, 0, 1,
-0.8414387, -0.3906927, -2.949013, 0.7450981, 1, 0, 1,
-0.8412857, 0.6424494, -0.2879527, 0.7411765, 1, 0, 1,
-0.8322907, -0.5009439, -1.992243, 0.7333333, 1, 0, 1,
-0.831228, 0.1858228, 2.315225, 0.7294118, 1, 0, 1,
-0.8304735, 0.9176505, -2.361484, 0.7215686, 1, 0, 1,
-0.827455, 1.795956, 0.2228772, 0.7176471, 1, 0, 1,
-0.8198289, 0.02883874, -1.402029, 0.7098039, 1, 0, 1,
-0.8172104, 0.1992187, -2.633471, 0.7058824, 1, 0, 1,
-0.8092623, 0.5937807, 2.232885, 0.6980392, 1, 0, 1,
-0.7993098, -0.6046447, -1.568169, 0.6901961, 1, 0, 1,
-0.7975222, 0.3080542, -1.316245, 0.6862745, 1, 0, 1,
-0.7975184, -0.2268006, -1.865064, 0.6784314, 1, 0, 1,
-0.7961317, 0.4419596, -0.8986865, 0.6745098, 1, 0, 1,
-0.7958465, -0.2582323, -0.1419623, 0.6666667, 1, 0, 1,
-0.7849422, 1.290893, -1.414468, 0.6627451, 1, 0, 1,
-0.7783458, 0.7142264, -0.1703751, 0.654902, 1, 0, 1,
-0.7780536, 0.8821706, -1.802558, 0.6509804, 1, 0, 1,
-0.7734675, 0.1546384, -1.428147, 0.6431373, 1, 0, 1,
-0.7636083, -1.469541, -2.240155, 0.6392157, 1, 0, 1,
-0.7614224, 0.5571682, -1.337945, 0.6313726, 1, 0, 1,
-0.7565017, -2.157063, -0.2987381, 0.627451, 1, 0, 1,
-0.7509488, -0.6706871, -3.755803, 0.6196079, 1, 0, 1,
-0.749896, 0.4993859, 0.1343968, 0.6156863, 1, 0, 1,
-0.748405, 1.50347, 1.191393, 0.6078432, 1, 0, 1,
-0.7470562, 0.5184104, -1.916462, 0.6039216, 1, 0, 1,
-0.7447877, 0.8538837, 0.4824484, 0.5960785, 1, 0, 1,
-0.7445695, 0.5751787, -1.464652, 0.5882353, 1, 0, 1,
-0.7435026, -0.9670651, -2.68338, 0.5843138, 1, 0, 1,
-0.7389916, 0.711907, -1.559319, 0.5764706, 1, 0, 1,
-0.7379904, -1.726772, -1.118772, 0.572549, 1, 0, 1,
-0.7323688, -0.5624405, -1.662465, 0.5647059, 1, 0, 1,
-0.7319688, -1.743583, -2.248645, 0.5607843, 1, 0, 1,
-0.7261664, 0.2444833, -1.301778, 0.5529412, 1, 0, 1,
-0.7219806, 0.7007741, -1.744007, 0.5490196, 1, 0, 1,
-0.7197488, -0.6241897, -3.063446, 0.5411765, 1, 0, 1,
-0.7194704, -0.4163228, -2.271246, 0.5372549, 1, 0, 1,
-0.7176412, 0.6509652, -0.8180922, 0.5294118, 1, 0, 1,
-0.7158194, 0.4494383, -2.623641, 0.5254902, 1, 0, 1,
-0.7120538, 0.6739854, 0.05813144, 0.5176471, 1, 0, 1,
-0.7117688, 1.556958, 0.23354, 0.5137255, 1, 0, 1,
-0.7015074, 0.06679501, -2.169138, 0.5058824, 1, 0, 1,
-0.6944733, -0.459341, -0.8543358, 0.5019608, 1, 0, 1,
-0.6874, 1.545215, -1.273396, 0.4941176, 1, 0, 1,
-0.6852841, -0.08247688, -0.9927953, 0.4862745, 1, 0, 1,
-0.6801654, 1.029221, -1.119668, 0.4823529, 1, 0, 1,
-0.6795906, -1.259305, -1.816549, 0.4745098, 1, 0, 1,
-0.6765506, -0.7209341, -1.891219, 0.4705882, 1, 0, 1,
-0.6757926, -0.05974093, -1.664114, 0.4627451, 1, 0, 1,
-0.672052, -0.4869426, -3.068884, 0.4588235, 1, 0, 1,
-0.6706664, 0.4665195, 0.5174313, 0.4509804, 1, 0, 1,
-0.6687645, 0.1440555, -0.4816762, 0.4470588, 1, 0, 1,
-0.6682605, -0.1500068, -0.8154888, 0.4392157, 1, 0, 1,
-0.6681111, -0.7581244, -1.478124, 0.4352941, 1, 0, 1,
-0.6668153, 0.5032303, -1.221896, 0.427451, 1, 0, 1,
-0.6665024, 0.0477487, -1.888373, 0.4235294, 1, 0, 1,
-0.6664649, -1.805358, -2.727809, 0.4156863, 1, 0, 1,
-0.6625218, -0.6309244, -1.729277, 0.4117647, 1, 0, 1,
-0.6608649, 0.334605, 0.26597, 0.4039216, 1, 0, 1,
-0.6556842, -0.2990113, -3.191472, 0.3960784, 1, 0, 1,
-0.6504846, 1.424718, -0.1420532, 0.3921569, 1, 0, 1,
-0.6458549, 0.05301991, -1.755161, 0.3843137, 1, 0, 1,
-0.6387601, -2.261623, -2.161642, 0.3803922, 1, 0, 1,
-0.6354927, -0.5453328, -2.861251, 0.372549, 1, 0, 1,
-0.6340768, -1.39824, -3.453502, 0.3686275, 1, 0, 1,
-0.6335659, 0.2085437, -1.635427, 0.3607843, 1, 0, 1,
-0.6330141, 0.5993119, -0.9215395, 0.3568628, 1, 0, 1,
-0.6313466, -2.463228, -0.7845263, 0.3490196, 1, 0, 1,
-0.6279201, -0.6489594, -1.924644, 0.345098, 1, 0, 1,
-0.6270975, -0.8190399, -2.802592, 0.3372549, 1, 0, 1,
-0.6255348, -1.129903, -4.495181, 0.3333333, 1, 0, 1,
-0.6251963, -2.246496, -2.202586, 0.3254902, 1, 0, 1,
-0.6250451, 0.05215967, -2.49685, 0.3215686, 1, 0, 1,
-0.6244433, 1.897006, -0.4189608, 0.3137255, 1, 0, 1,
-0.6177419, -1.042686, -0.6853353, 0.3098039, 1, 0, 1,
-0.6162997, -0.9900627, -3.8576, 0.3019608, 1, 0, 1,
-0.6158653, 1.521266, 0.06127618, 0.2941177, 1, 0, 1,
-0.6131065, 0.08268423, -0.6910572, 0.2901961, 1, 0, 1,
-0.5990595, -1.106444, -2.978292, 0.282353, 1, 0, 1,
-0.5959513, 0.4778908, -2.502359, 0.2784314, 1, 0, 1,
-0.5920904, -0.04216506, -0.2450388, 0.2705882, 1, 0, 1,
-0.5879644, 0.4833931, -1.733006, 0.2666667, 1, 0, 1,
-0.5856091, -1.371658, -3.533689, 0.2588235, 1, 0, 1,
-0.5758365, 0.08179246, -1.72149, 0.254902, 1, 0, 1,
-0.5735465, 2.274949, -1.487406, 0.2470588, 1, 0, 1,
-0.5710358, 0.5919173, -0.408372, 0.2431373, 1, 0, 1,
-0.5696618, 0.6860345, -0.4055967, 0.2352941, 1, 0, 1,
-0.5550108, -0.1349751, -0.1456884, 0.2313726, 1, 0, 1,
-0.550738, 0.05640692, -1.74293, 0.2235294, 1, 0, 1,
-0.5485538, 1.393114, -1.68517, 0.2196078, 1, 0, 1,
-0.547604, 1.650722, 0.2390238, 0.2117647, 1, 0, 1,
-0.5444024, -1.251807, -3.298098, 0.2078431, 1, 0, 1,
-0.54067, -1.227386, -2.461774, 0.2, 1, 0, 1,
-0.5377945, -0.7340267, -2.719115, 0.1921569, 1, 0, 1,
-0.5330586, -0.5328406, -3.512631, 0.1882353, 1, 0, 1,
-0.532464, -1.243481, -3.354312, 0.1803922, 1, 0, 1,
-0.5260206, -0.8532311, -2.801962, 0.1764706, 1, 0, 1,
-0.525416, -1.302724, -1.124502, 0.1686275, 1, 0, 1,
-0.5243329, 0.6975281, 0.7128925, 0.1647059, 1, 0, 1,
-0.52256, 0.5861987, -0.9235491, 0.1568628, 1, 0, 1,
-0.5137591, -0.7975925, -1.957528, 0.1529412, 1, 0, 1,
-0.5135624, -0.8632811, -2.479891, 0.145098, 1, 0, 1,
-0.5111341, -0.5205758, -3.701611, 0.1411765, 1, 0, 1,
-0.5102393, 2.318446, -0.1904058, 0.1333333, 1, 0, 1,
-0.5038975, -0.6616363, -2.128055, 0.1294118, 1, 0, 1,
-0.5008361, 0.1460979, 0.6365492, 0.1215686, 1, 0, 1,
-0.4938694, 1.115187, -1.361074, 0.1176471, 1, 0, 1,
-0.4900378, -0.09318947, -1.488796, 0.1098039, 1, 0, 1,
-0.4881267, -1.814438, -1.817589, 0.1058824, 1, 0, 1,
-0.4862701, 1.255365, -1.107055, 0.09803922, 1, 0, 1,
-0.4853747, 1.989309, -1.551614, 0.09019608, 1, 0, 1,
-0.4801466, -0.8175008, -3.263761, 0.08627451, 1, 0, 1,
-0.4791941, -1.411216, -4.070364, 0.07843138, 1, 0, 1,
-0.4788628, 0.4081828, -0.2082826, 0.07450981, 1, 0, 1,
-0.4741977, 1.373714, 0.0992741, 0.06666667, 1, 0, 1,
-0.4722746, -0.1464847, -2.089105, 0.0627451, 1, 0, 1,
-0.4708009, -0.6602866, -2.320378, 0.05490196, 1, 0, 1,
-0.468301, 0.7276379, -0.1536124, 0.05098039, 1, 0, 1,
-0.4620356, -0.155339, -0.5739753, 0.04313726, 1, 0, 1,
-0.4572023, 0.3238857, -1.202631, 0.03921569, 1, 0, 1,
-0.4552856, 1.341334, -0.9081042, 0.03137255, 1, 0, 1,
-0.4511499, -0.03025985, -2.074483, 0.02745098, 1, 0, 1,
-0.451047, 0.1365083, -1.72226, 0.01960784, 1, 0, 1,
-0.4502285, 0.0391085, -2.344507, 0.01568628, 1, 0, 1,
-0.4484926, -1.64457, -1.95931, 0.007843138, 1, 0, 1,
-0.447411, -0.4854823, -1.984971, 0.003921569, 1, 0, 1,
-0.4447669, -0.9797708, -1.205741, 0, 1, 0.003921569, 1,
-0.4447564, -0.9164929, -2.123689, 0, 1, 0.01176471, 1,
-0.4388186, 0.1801682, -1.732253, 0, 1, 0.01568628, 1,
-0.4331372, 0.3109856, -0.9057367, 0, 1, 0.02352941, 1,
-0.4220703, 0.2551373, 0.03369705, 0, 1, 0.02745098, 1,
-0.4216837, -1.191865, -3.013495, 0, 1, 0.03529412, 1,
-0.4205186, 1.999368, 2.019299, 0, 1, 0.03921569, 1,
-0.4171549, 0.2123836, 0.1108566, 0, 1, 0.04705882, 1,
-0.4134878, 0.7912788, 1.217004, 0, 1, 0.05098039, 1,
-0.4100688, 0.0876216, -3.231084, 0, 1, 0.05882353, 1,
-0.4085515, 0.2192515, 0.3314463, 0, 1, 0.0627451, 1,
-0.4073001, -0.5259883, -3.521475, 0, 1, 0.07058824, 1,
-0.4001491, -0.9434144, -2.411389, 0, 1, 0.07450981, 1,
-0.3966987, 1.209534, 0.4466665, 0, 1, 0.08235294, 1,
-0.3962932, -0.03168416, -0.5353204, 0, 1, 0.08627451, 1,
-0.3962477, -0.8687203, -3.176027, 0, 1, 0.09411765, 1,
-0.3961832, -1.721459, -2.965012, 0, 1, 0.1019608, 1,
-0.3947403, 1.850915, 0.6562331, 0, 1, 0.1058824, 1,
-0.3911529, 0.435325, -0.7019562, 0, 1, 0.1137255, 1,
-0.3890111, -0.25273, -1.333877, 0, 1, 0.1176471, 1,
-0.3884678, 0.838631, 0.8260353, 0, 1, 0.1254902, 1,
-0.3852968, -1.398016, -2.740055, 0, 1, 0.1294118, 1,
-0.3822647, 0.5773155, -1.082571, 0, 1, 0.1372549, 1,
-0.3762378, 0.3555319, -2.3654, 0, 1, 0.1411765, 1,
-0.3756684, -0.005684542, -1.183462, 0, 1, 0.1490196, 1,
-0.3745239, 0.119424, -1.564068, 0, 1, 0.1529412, 1,
-0.3733339, -0.003681955, -3.318796, 0, 1, 0.1607843, 1,
-0.3710454, 0.6901898, -0.3573916, 0, 1, 0.1647059, 1,
-0.3623119, -0.1527433, -2.418245, 0, 1, 0.172549, 1,
-0.3580085, -0.6861133, -3.148656, 0, 1, 0.1764706, 1,
-0.3564521, 0.7993441, 1.028742, 0, 1, 0.1843137, 1,
-0.3536209, 0.5508761, 0.5697061, 0, 1, 0.1882353, 1,
-0.3518248, -1.08579, -3.290174, 0, 1, 0.1960784, 1,
-0.3501195, 1.138474, 1.302866, 0, 1, 0.2039216, 1,
-0.3498906, -0.5352464, -1.985297, 0, 1, 0.2078431, 1,
-0.3459123, -0.07548783, -0.772895, 0, 1, 0.2156863, 1,
-0.3450699, -1.454147, -5.466445, 0, 1, 0.2196078, 1,
-0.3442956, -0.213067, -0.7586073, 0, 1, 0.227451, 1,
-0.342411, -0.563518, -2.540046, 0, 1, 0.2313726, 1,
-0.3421602, -0.8782071, -3.34502, 0, 1, 0.2392157, 1,
-0.3414896, 1.215491, -1.132015, 0, 1, 0.2431373, 1,
-0.3406685, -1.662991, -3.923183, 0, 1, 0.2509804, 1,
-0.3390902, -0.5964642, -3.683831, 0, 1, 0.254902, 1,
-0.3353653, 2.013058, 0.25741, 0, 1, 0.2627451, 1,
-0.3330956, 1.328728, -1.666114, 0, 1, 0.2666667, 1,
-0.3330103, -0.269765, -3.548515, 0, 1, 0.2745098, 1,
-0.3260399, -1.189502, -1.43291, 0, 1, 0.2784314, 1,
-0.3254987, 0.7422431, -1.523527, 0, 1, 0.2862745, 1,
-0.3208559, 2.931355, -0.171065, 0, 1, 0.2901961, 1,
-0.3197742, 0.6538067, -0.9880905, 0, 1, 0.2980392, 1,
-0.3193872, 0.4069491, -1.607695, 0, 1, 0.3058824, 1,
-0.3190521, 0.05709093, -2.639946, 0, 1, 0.3098039, 1,
-0.3083282, -0.6359981, -0.7818552, 0, 1, 0.3176471, 1,
-0.3067224, -1.276551, -3.116568, 0, 1, 0.3215686, 1,
-0.2970721, -0.9864388, -2.118405, 0, 1, 0.3294118, 1,
-0.2920053, -0.190403, -2.198048, 0, 1, 0.3333333, 1,
-0.2901334, -0.4497445, -2.302947, 0, 1, 0.3411765, 1,
-0.2857308, -0.6156489, -3.391108, 0, 1, 0.345098, 1,
-0.2760023, -2.583462, -3.740844, 0, 1, 0.3529412, 1,
-0.2752726, 0.5676449, 1.49109, 0, 1, 0.3568628, 1,
-0.2714105, 0.5893433, -0.6743467, 0, 1, 0.3647059, 1,
-0.2679907, 0.4456496, -0.1107154, 0, 1, 0.3686275, 1,
-0.2669199, -0.4075289, -1.921952, 0, 1, 0.3764706, 1,
-0.2628822, -1.114696, -1.904145, 0, 1, 0.3803922, 1,
-0.2607779, -0.194997, -1.691482, 0, 1, 0.3882353, 1,
-0.2581063, 0.2496987, 0.03233338, 0, 1, 0.3921569, 1,
-0.2568344, 1.591113, 1.407711, 0, 1, 0.4, 1,
-0.2536468, 0.810393, -0.2942561, 0, 1, 0.4078431, 1,
-0.2503187, 0.7927063, -1.004826, 0, 1, 0.4117647, 1,
-0.2498961, -1.382534, -0.9142175, 0, 1, 0.4196078, 1,
-0.2493301, 0.5505336, -0.3153884, 0, 1, 0.4235294, 1,
-0.2486821, -0.1640636, -1.38681, 0, 1, 0.4313726, 1,
-0.241845, 0.6056823, 0.2478382, 0, 1, 0.4352941, 1,
-0.2377349, -0.1465257, -2.117244, 0, 1, 0.4431373, 1,
-0.2361274, 0.9473091, -0.4597279, 0, 1, 0.4470588, 1,
-0.2341985, -0.5467663, -1.262256, 0, 1, 0.454902, 1,
-0.2317122, 0.4171858, -0.07063003, 0, 1, 0.4588235, 1,
-0.2281745, 0.3630357, -0.3321581, 0, 1, 0.4666667, 1,
-0.2269287, -1.212937, -4.787418, 0, 1, 0.4705882, 1,
-0.2245779, -0.4795139, -4.724771, 0, 1, 0.4784314, 1,
-0.2215115, 0.8256637, 0.9570919, 0, 1, 0.4823529, 1,
-0.2208039, -1.397793, -3.493979, 0, 1, 0.4901961, 1,
-0.2198659, 0.4496105, -1.012462, 0, 1, 0.4941176, 1,
-0.2191905, -0.1160863, -1.653967, 0, 1, 0.5019608, 1,
-0.2177065, -0.05033122, -1.649482, 0, 1, 0.509804, 1,
-0.2175754, -1.079385, -1.01383, 0, 1, 0.5137255, 1,
-0.2170006, 0.9406447, 0.2423761, 0, 1, 0.5215687, 1,
-0.2169823, -1.029698, -3.032833, 0, 1, 0.5254902, 1,
-0.2100264, -0.1685453, -1.357474, 0, 1, 0.5333334, 1,
-0.205791, 0.9818431, -0.9411984, 0, 1, 0.5372549, 1,
-0.2021102, -0.3037261, -1.1662, 0, 1, 0.5450981, 1,
-0.1978395, 0.743751, 1.185517, 0, 1, 0.5490196, 1,
-0.1966689, -0.3318212, -2.422168, 0, 1, 0.5568628, 1,
-0.1951943, -0.05530773, -3.168975, 0, 1, 0.5607843, 1,
-0.1881901, 1.932316, -0.6478351, 0, 1, 0.5686275, 1,
-0.1836782, -0.4638257, -2.725999, 0, 1, 0.572549, 1,
-0.1791795, 0.5296506, -0.5542707, 0, 1, 0.5803922, 1,
-0.1773689, 0.3031571, -1.906392, 0, 1, 0.5843138, 1,
-0.1682533, -0.632587, -1.028241, 0, 1, 0.5921569, 1,
-0.1638436, 1.918881, 1.05311, 0, 1, 0.5960785, 1,
-0.1601073, 0.2281345, 1.150253, 0, 1, 0.6039216, 1,
-0.1565988, -1.097469, -5.461911, 0, 1, 0.6117647, 1,
-0.1547317, -0.8487313, -1.866917, 0, 1, 0.6156863, 1,
-0.1539236, 0.2812359, 0.4210961, 0, 1, 0.6235294, 1,
-0.1532392, -0.126153, -1.907465, 0, 1, 0.627451, 1,
-0.1492755, 1.20133, -0.5937664, 0, 1, 0.6352941, 1,
-0.1425517, -1.255861, -2.135133, 0, 1, 0.6392157, 1,
-0.1366303, 0.3378964, -0.202339, 0, 1, 0.6470588, 1,
-0.1356488, 0.3411828, -0.1379263, 0, 1, 0.6509804, 1,
-0.1355867, -0.06804047, -3.916247, 0, 1, 0.6588235, 1,
-0.133209, 1.428196, -0.06688771, 0, 1, 0.6627451, 1,
-0.1281114, -1.68577, -1.84517, 0, 1, 0.6705883, 1,
-0.1276905, 0.6740605, -0.6804059, 0, 1, 0.6745098, 1,
-0.1274399, -0.08896486, -0.2867363, 0, 1, 0.682353, 1,
-0.125823, 0.551919, -2.726514, 0, 1, 0.6862745, 1,
-0.1251268, -0.1763337, -2.074295, 0, 1, 0.6941177, 1,
-0.1247875, -0.2410908, -1.454088, 0, 1, 0.7019608, 1,
-0.1243799, -0.368783, -2.658582, 0, 1, 0.7058824, 1,
-0.1045912, -0.3893083, -3.206708, 0, 1, 0.7137255, 1,
-0.09691801, 0.2195475, -0.7479107, 0, 1, 0.7176471, 1,
-0.09669117, 0.09197761, -1.924565, 0, 1, 0.7254902, 1,
-0.09625897, 0.277308, 1.219416, 0, 1, 0.7294118, 1,
-0.09536359, 0.3214197, -0.8001339, 0, 1, 0.7372549, 1,
-0.09523148, -0.09694564, -2.634068, 0, 1, 0.7411765, 1,
-0.08881611, 1.086432, 2.470861, 0, 1, 0.7490196, 1,
-0.08801284, 0.9937367, -2.172827, 0, 1, 0.7529412, 1,
-0.08799452, 2.363101, 1.515331, 0, 1, 0.7607843, 1,
-0.08783572, -1.530845, -2.275328, 0, 1, 0.7647059, 1,
-0.08713213, 1.284816, -0.7639903, 0, 1, 0.772549, 1,
-0.08583067, 0.1853804, -1.636848, 0, 1, 0.7764706, 1,
-0.08220049, -0.8387644, -3.997032, 0, 1, 0.7843137, 1,
-0.08194352, -0.309549, -3.428077, 0, 1, 0.7882353, 1,
-0.07484275, -0.6968287, -1.079305, 0, 1, 0.7960784, 1,
-0.07127413, 2.481049, -2.074352, 0, 1, 0.8039216, 1,
-0.06643596, 0.2009206, 0.4125077, 0, 1, 0.8078431, 1,
-0.06584551, 1.594058, 1.394278, 0, 1, 0.8156863, 1,
-0.06136742, -0.3519698, -2.266212, 0, 1, 0.8196079, 1,
-0.05995322, 0.4873948, -1.041991, 0, 1, 0.827451, 1,
-0.05443383, -0.6096094, -3.014107, 0, 1, 0.8313726, 1,
-0.05247822, -0.5148064, -3.679017, 0, 1, 0.8392157, 1,
-0.0510034, 0.6168751, -1.611524, 0, 1, 0.8431373, 1,
-0.04715629, 1.231874, 1.606488, 0, 1, 0.8509804, 1,
-0.04690133, 1.990259, -0.06168374, 0, 1, 0.854902, 1,
-0.04252313, -0.7551529, -2.927281, 0, 1, 0.8627451, 1,
-0.04246411, -2.549891, -2.195191, 0, 1, 0.8666667, 1,
-0.04172485, -1.883641, -4.673829, 0, 1, 0.8745098, 1,
-0.04080961, 1.01342, -0.2882107, 0, 1, 0.8784314, 1,
-0.03968106, 3.013025, -0.7298459, 0, 1, 0.8862745, 1,
-0.03953495, -1.081466, -2.100353, 0, 1, 0.8901961, 1,
-0.03666109, -0.04812112, -2.399314, 0, 1, 0.8980392, 1,
-0.03385359, -0.5297714, -1.559506, 0, 1, 0.9058824, 1,
-0.03197113, -0.1120707, -4.365873, 0, 1, 0.9098039, 1,
-0.03008022, 0.06539821, 1.148334, 0, 1, 0.9176471, 1,
-0.02939047, -0.5776619, -1.854003, 0, 1, 0.9215686, 1,
-0.02726614, 0.2306569, 0.4145918, 0, 1, 0.9294118, 1,
-0.02170959, -0.6679237, -3.553467, 0, 1, 0.9333333, 1,
-0.02029041, 0.1267025, -2.325546, 0, 1, 0.9411765, 1,
-0.01965668, 0.5925102, -0.4692404, 0, 1, 0.945098, 1,
-0.01116387, 0.2586857, -2.208946, 0, 1, 0.9529412, 1,
-0.01017217, -2.517586, -3.714369, 0, 1, 0.9568627, 1,
-0.008427077, -1.310461, -1.724998, 0, 1, 0.9647059, 1,
-0.008364554, 0.1614472, 1.475593, 0, 1, 0.9686275, 1,
-0.00810224, -2.13382, -2.635317, 0, 1, 0.9764706, 1,
-0.004852313, -0.1053916, -3.211301, 0, 1, 0.9803922, 1,
0.0006119154, -0.6260067, 2.767513, 0, 1, 0.9882353, 1,
0.003363558, -0.2249044, 3.817697, 0, 1, 0.9921569, 1,
0.00375191, -0.5590687, 1.174295, 0, 1, 1, 1,
0.005725359, 1.651362, 1.368125, 0, 0.9921569, 1, 1,
0.007747114, -0.5803489, 4.077843, 0, 0.9882353, 1, 1,
0.007853607, 0.03274492, -0.5910378, 0, 0.9803922, 1, 1,
0.008707386, 0.6420712, 0.842915, 0, 0.9764706, 1, 1,
0.00996369, 0.3187215, -0.7381333, 0, 0.9686275, 1, 1,
0.01056817, 0.5794567, 1.638564, 0, 0.9647059, 1, 1,
0.01510027, -1.162762, 2.56706, 0, 0.9568627, 1, 1,
0.01562751, -1.022277, 3.653804, 0, 0.9529412, 1, 1,
0.02633179, 1.488172, -0.2987737, 0, 0.945098, 1, 1,
0.03103653, 0.8111141, 0.5082257, 0, 0.9411765, 1, 1,
0.03140215, 1.908495, -0.6681603, 0, 0.9333333, 1, 1,
0.03716566, 0.0552232, 0.6022232, 0, 0.9294118, 1, 1,
0.03880307, -1.232523, 4.043911, 0, 0.9215686, 1, 1,
0.04027737, -0.7899011, 5.213336, 0, 0.9176471, 1, 1,
0.04058779, 0.0954411, -0.1717249, 0, 0.9098039, 1, 1,
0.04149571, -1.376152, 3.607183, 0, 0.9058824, 1, 1,
0.04637428, 0.6762787, 0.3014796, 0, 0.8980392, 1, 1,
0.05084557, 0.1835157, -0.412508, 0, 0.8901961, 1, 1,
0.05302546, -0.5375496, 3.77086, 0, 0.8862745, 1, 1,
0.05524459, 0.8244652, 0.07511162, 0, 0.8784314, 1, 1,
0.05652174, 0.641008, 1.829519, 0, 0.8745098, 1, 1,
0.05709063, 0.5246471, 0.1903836, 0, 0.8666667, 1, 1,
0.05774403, -0.8164092, 3.528758, 0, 0.8627451, 1, 1,
0.0579877, -0.2666183, 0.1854084, 0, 0.854902, 1, 1,
0.06119881, 0.01356439, 1.23501, 0, 0.8509804, 1, 1,
0.06607252, 2.190348, 0.6768005, 0, 0.8431373, 1, 1,
0.07287584, -0.3919526, 2.224229, 0, 0.8392157, 1, 1,
0.07970461, -0.3431326, 3.479857, 0, 0.8313726, 1, 1,
0.08617782, -0.7478321, 1.878686, 0, 0.827451, 1, 1,
0.08722039, -0.4604162, 1.145193, 0, 0.8196079, 1, 1,
0.08764987, -0.05112369, 2.005874, 0, 0.8156863, 1, 1,
0.09211253, -0.02881935, 2.082378, 0, 0.8078431, 1, 1,
0.09349346, 0.1401863, -0.7459604, 0, 0.8039216, 1, 1,
0.09530992, -0.4347208, 2.898242, 0, 0.7960784, 1, 1,
0.09809867, 1.759146, 0.1985539, 0, 0.7882353, 1, 1,
0.09924617, -0.4805923, 3.469063, 0, 0.7843137, 1, 1,
0.09937668, 1.653444, -0.1210493, 0, 0.7764706, 1, 1,
0.1065041, 0.7862063, -0.6287372, 0, 0.772549, 1, 1,
0.108484, 0.4604916, 1.373327, 0, 0.7647059, 1, 1,
0.1118672, -1.233533, 2.220112, 0, 0.7607843, 1, 1,
0.1172751, 0.1536336, -0.8894825, 0, 0.7529412, 1, 1,
0.1231104, 0.01677458, 2.550154, 0, 0.7490196, 1, 1,
0.1283692, 1.230763, -0.2908516, 0, 0.7411765, 1, 1,
0.1292791, 1.150248, 0.5766981, 0, 0.7372549, 1, 1,
0.130367, -0.6240517, 2.863016, 0, 0.7294118, 1, 1,
0.1318226, 0.3175088, 0.09532312, 0, 0.7254902, 1, 1,
0.1330699, 1.58613, -1.176086, 0, 0.7176471, 1, 1,
0.1353626, -0.1062241, 3.078839, 0, 0.7137255, 1, 1,
0.1376438, 1.037671, 0.5100006, 0, 0.7058824, 1, 1,
0.1402849, -0.2456448, 1.75532, 0, 0.6980392, 1, 1,
0.1436962, -0.5367333, 2.319679, 0, 0.6941177, 1, 1,
0.1444874, -1.681477, 3.929069, 0, 0.6862745, 1, 1,
0.1495766, -0.5995432, 2.466913, 0, 0.682353, 1, 1,
0.1508512, -0.6134871, 1.947562, 0, 0.6745098, 1, 1,
0.152926, 2.700747, -1.496473, 0, 0.6705883, 1, 1,
0.1579248, -0.09706604, 1.600956, 0, 0.6627451, 1, 1,
0.1584455, 0.3599854, 0.5591409, 0, 0.6588235, 1, 1,
0.1608493, 0.7910591, 0.419223, 0, 0.6509804, 1, 1,
0.1611396, -0.2238087, 3.753064, 0, 0.6470588, 1, 1,
0.1663643, -1.658835, 3.594477, 0, 0.6392157, 1, 1,
0.169902, -0.03541054, 1.325875, 0, 0.6352941, 1, 1,
0.1704895, -1.044121, 2.36701, 0, 0.627451, 1, 1,
0.1740567, -1.044964, 3.532355, 0, 0.6235294, 1, 1,
0.1762303, -0.4202561, 2.679256, 0, 0.6156863, 1, 1,
0.1788191, -0.3398383, 2.883696, 0, 0.6117647, 1, 1,
0.1796722, 0.1819103, 2.226686, 0, 0.6039216, 1, 1,
0.1849618, 2.149764, -0.5056056, 0, 0.5960785, 1, 1,
0.191785, -1.174418, 2.221144, 0, 0.5921569, 1, 1,
0.1932795, -2.659157, 1.583594, 0, 0.5843138, 1, 1,
0.193518, -0.8944916, 2.865694, 0, 0.5803922, 1, 1,
0.1937622, -0.128431, 1.066354, 0, 0.572549, 1, 1,
0.1944779, -0.1771739, 2.57742, 0, 0.5686275, 1, 1,
0.1945948, 0.115899, -0.3910299, 0, 0.5607843, 1, 1,
0.199345, 0.1462444, 1.090919, 0, 0.5568628, 1, 1,
0.1993548, 1.835725, -2.102671, 0, 0.5490196, 1, 1,
0.2004013, -1.494613, 4.081773, 0, 0.5450981, 1, 1,
0.2069351, -0.6217479, 2.079773, 0, 0.5372549, 1, 1,
0.2079867, 0.7122344, 0.7735246, 0, 0.5333334, 1, 1,
0.209124, 1.595668, 0.3478124, 0, 0.5254902, 1, 1,
0.2099703, -1.087136, 4.391665, 0, 0.5215687, 1, 1,
0.2114644, -1.305824, 3.01088, 0, 0.5137255, 1, 1,
0.2114908, 0.3653632, 0.1165718, 0, 0.509804, 1, 1,
0.2204068, -0.3863556, 3.213461, 0, 0.5019608, 1, 1,
0.2232528, 0.4482009, 0.4635957, 0, 0.4941176, 1, 1,
0.2270398, -0.2642272, 1.612493, 0, 0.4901961, 1, 1,
0.236363, 0.9607283, -0.5081229, 0, 0.4823529, 1, 1,
0.2392368, 1.763576, -1.116289, 0, 0.4784314, 1, 1,
0.2396798, 1.165357, -0.1658303, 0, 0.4705882, 1, 1,
0.2407035, 0.5347918, 0.0844595, 0, 0.4666667, 1, 1,
0.2482596, 1.486417, 0.797879, 0, 0.4588235, 1, 1,
0.2537953, -0.5403158, 1.439361, 0, 0.454902, 1, 1,
0.2559192, 1.696956, 1.640918, 0, 0.4470588, 1, 1,
0.2563684, -1.339715, 3.661351, 0, 0.4431373, 1, 1,
0.258662, 0.9854599, -0.556375, 0, 0.4352941, 1, 1,
0.2602929, -0.6649953, 2.306542, 0, 0.4313726, 1, 1,
0.2610902, -0.0981964, 2.292295, 0, 0.4235294, 1, 1,
0.2623761, -0.2101302, 1.191306, 0, 0.4196078, 1, 1,
0.264397, 2.046217, 0.1688219, 0, 0.4117647, 1, 1,
0.2673115, -0.7028834, 1.962832, 0, 0.4078431, 1, 1,
0.2687213, -0.4638254, 2.858678, 0, 0.4, 1, 1,
0.2720402, -0.7001991, 1.909721, 0, 0.3921569, 1, 1,
0.2726519, -0.5024258, 3.414245, 0, 0.3882353, 1, 1,
0.2753077, -0.6504192, 2.852526, 0, 0.3803922, 1, 1,
0.2775777, -0.4253433, 1.714145, 0, 0.3764706, 1, 1,
0.2779744, -0.3859474, 1.939392, 0, 0.3686275, 1, 1,
0.2783341, -0.9886845, 3.233424, 0, 0.3647059, 1, 1,
0.2793868, -1.439832, 3.478343, 0, 0.3568628, 1, 1,
0.2803752, 0.820646, 0.3632464, 0, 0.3529412, 1, 1,
0.2827301, 1.031674, 1.283817, 0, 0.345098, 1, 1,
0.2852115, 0.8943595, 0.7692455, 0, 0.3411765, 1, 1,
0.2860621, 1.472264, 1.176232, 0, 0.3333333, 1, 1,
0.2860998, -0.2678018, 1.444856, 0, 0.3294118, 1, 1,
0.2872602, -1.34531, 1.985051, 0, 0.3215686, 1, 1,
0.288484, 1.733283, -1.757233, 0, 0.3176471, 1, 1,
0.2945338, -0.05732877, 1.295437, 0, 0.3098039, 1, 1,
0.2964565, -0.3729955, 2.388019, 0, 0.3058824, 1, 1,
0.2997393, 0.1071026, 0.9602407, 0, 0.2980392, 1, 1,
0.3000152, -0.5710263, 2.283143, 0, 0.2901961, 1, 1,
0.3041261, -0.4591149, 1.528071, 0, 0.2862745, 1, 1,
0.3043596, 0.01069082, 0.5058966, 0, 0.2784314, 1, 1,
0.3091363, -0.6165527, 3.801455, 0, 0.2745098, 1, 1,
0.310248, 0.03938902, 0.8328965, 0, 0.2666667, 1, 1,
0.3142033, 1.383087, -0.3933232, 0, 0.2627451, 1, 1,
0.3194161, -0.2583454, 1.279838, 0, 0.254902, 1, 1,
0.319887, 1.646679, -0.7796151, 0, 0.2509804, 1, 1,
0.3199898, 0.8587762, 0.4464811, 0, 0.2431373, 1, 1,
0.3224918, 1.299023, 0.8827993, 0, 0.2392157, 1, 1,
0.3227361, -0.001970423, 1.864455, 0, 0.2313726, 1, 1,
0.3249812, 1.544158, -0.9393393, 0, 0.227451, 1, 1,
0.3273828, -0.629002, 1.435533, 0, 0.2196078, 1, 1,
0.3279762, -1.096426, 2.980365, 0, 0.2156863, 1, 1,
0.3282739, 0.07723042, 2.883773, 0, 0.2078431, 1, 1,
0.3320719, 0.7562272, -0.3107398, 0, 0.2039216, 1, 1,
0.3332143, -0.431585, 0.1105309, 0, 0.1960784, 1, 1,
0.3343054, -1.500628, 2.56892, 0, 0.1882353, 1, 1,
0.3382437, 0.39291, 0.8106931, 0, 0.1843137, 1, 1,
0.341627, 0.1616443, 2.486956, 0, 0.1764706, 1, 1,
0.3426456, -2.481661, 2.681356, 0, 0.172549, 1, 1,
0.3447608, 0.1806261, 0.433571, 0, 0.1647059, 1, 1,
0.3554157, 0.5314375, 0.7179767, 0, 0.1607843, 1, 1,
0.3640745, 1.62586, 0.3225517, 0, 0.1529412, 1, 1,
0.3661744, -0.571178, 4.421028, 0, 0.1490196, 1, 1,
0.3667178, 0.1797373, 0.7822877, 0, 0.1411765, 1, 1,
0.3669381, -0.6831547, 1.767445, 0, 0.1372549, 1, 1,
0.3714061, 0.8912381, 0.9080033, 0, 0.1294118, 1, 1,
0.372546, -1.757735, 3.982989, 0, 0.1254902, 1, 1,
0.374632, 0.9872098, -0.6700768, 0, 0.1176471, 1, 1,
0.3783773, 0.5930836, 1.152333, 0, 0.1137255, 1, 1,
0.3784478, 0.2377347, 1.962658, 0, 0.1058824, 1, 1,
0.3837481, -1.390617, 2.94323, 0, 0.09803922, 1, 1,
0.3852972, 1.140446, 0.3837332, 0, 0.09411765, 1, 1,
0.3858967, 0.731264, 0.6797141, 0, 0.08627451, 1, 1,
0.3859501, -1.23343, 2.045572, 0, 0.08235294, 1, 1,
0.3875072, -0.0970152, 3.372842, 0, 0.07450981, 1, 1,
0.3909687, -1.482965, 3.934626, 0, 0.07058824, 1, 1,
0.3917916, -0.9564582, 1.677571, 0, 0.0627451, 1, 1,
0.3940566, 0.7027054, 0.7941573, 0, 0.05882353, 1, 1,
0.3952552, 0.1204837, 1.223028, 0, 0.05098039, 1, 1,
0.3958076, 0.02582037, 1.77505, 0, 0.04705882, 1, 1,
0.3961392, 0.9175465, 0.1299215, 0, 0.03921569, 1, 1,
0.3985531, -1.624297, 1.870524, 0, 0.03529412, 1, 1,
0.4037479, -0.1509845, 3.050081, 0, 0.02745098, 1, 1,
0.406172, 0.2927621, -1.696974, 0, 0.02352941, 1, 1,
0.4103746, -0.9567643, 2.938529, 0, 0.01568628, 1, 1,
0.4117254, 0.9524761, -0.4466827, 0, 0.01176471, 1, 1,
0.4129745, -0.8692145, 3.849045, 0, 0.003921569, 1, 1,
0.4165004, 0.1331114, 1.494195, 0.003921569, 0, 1, 1,
0.4187195, -0.4591926, 2.485781, 0.007843138, 0, 1, 1,
0.4220523, -1.029719, 0.971146, 0.01568628, 0, 1, 1,
0.4224728, -2.043515, 3.042554, 0.01960784, 0, 1, 1,
0.4234723, 1.594446, 1.626605, 0.02745098, 0, 1, 1,
0.4267237, -0.4122299, 2.227685, 0.03137255, 0, 1, 1,
0.4289772, -0.19883, 1.517919, 0.03921569, 0, 1, 1,
0.4318519, 1.761472, -0.5457947, 0.04313726, 0, 1, 1,
0.4383679, -0.2006723, 2.718636, 0.05098039, 0, 1, 1,
0.4443087, -1.422621, 1.958384, 0.05490196, 0, 1, 1,
0.4449501, 0.6007656, 1.186888, 0.0627451, 0, 1, 1,
0.4473827, 1.63176, 1.265542, 0.06666667, 0, 1, 1,
0.4502284, -0.7113319, 2.920125, 0.07450981, 0, 1, 1,
0.4562856, -1.008778, 4.706606, 0.07843138, 0, 1, 1,
0.4586089, 0.2740852, 1.409488, 0.08627451, 0, 1, 1,
0.462494, 1.511825, -1.652652, 0.09019608, 0, 1, 1,
0.4660309, -0.09450292, 0.8734106, 0.09803922, 0, 1, 1,
0.4661281, 0.3595782, 1.711601, 0.1058824, 0, 1, 1,
0.467679, -1.372705, 1.977493, 0.1098039, 0, 1, 1,
0.4710978, -0.59163, 2.900871, 0.1176471, 0, 1, 1,
0.476753, 0.7875577, 0.03654307, 0.1215686, 0, 1, 1,
0.4769366, 0.8624313, 0.6296428, 0.1294118, 0, 1, 1,
0.4808394, -0.8151411, 3.630526, 0.1333333, 0, 1, 1,
0.4812377, -0.5192333, 1.265591, 0.1411765, 0, 1, 1,
0.4824433, 1.280152, 1.341042, 0.145098, 0, 1, 1,
0.4877881, 2.249041, 0.5847395, 0.1529412, 0, 1, 1,
0.4979439, -0.9788193, 2.683267, 0.1568628, 0, 1, 1,
0.4991005, 0.7586653, 1.311963, 0.1647059, 0, 1, 1,
0.5036821, -1.932088, 4.188493, 0.1686275, 0, 1, 1,
0.5083443, -0.6674656, 2.470469, 0.1764706, 0, 1, 1,
0.508593, -0.4315548, 2.168555, 0.1803922, 0, 1, 1,
0.5151063, -0.2354273, 0.4189743, 0.1882353, 0, 1, 1,
0.5163962, -1.080613, 1.888961, 0.1921569, 0, 1, 1,
0.5202674, -0.9240612, 1.671056, 0.2, 0, 1, 1,
0.5218778, -0.1479256, 2.38299, 0.2078431, 0, 1, 1,
0.5247274, 1.053636, 0.4014544, 0.2117647, 0, 1, 1,
0.5261983, 0.03349898, 3.438117, 0.2196078, 0, 1, 1,
0.5266837, -0.2470239, 0.9686033, 0.2235294, 0, 1, 1,
0.5295508, -0.8614095, 2.32517, 0.2313726, 0, 1, 1,
0.5351954, 1.485821, -0.1825764, 0.2352941, 0, 1, 1,
0.5391189, -0.4256856, 3.686438, 0.2431373, 0, 1, 1,
0.5425863, -1.308121, 2.599518, 0.2470588, 0, 1, 1,
0.5430087, -0.2437748, 2.336612, 0.254902, 0, 1, 1,
0.5440947, 1.30686, 0.5616354, 0.2588235, 0, 1, 1,
0.5465385, -0.3707641, 2.554768, 0.2666667, 0, 1, 1,
0.5470921, -0.3753939, 3.514869, 0.2705882, 0, 1, 1,
0.5535445, -1.780829, 2.943061, 0.2784314, 0, 1, 1,
0.5550804, 0.3049246, 2.817909, 0.282353, 0, 1, 1,
0.5667216, -0.6487203, 2.130084, 0.2901961, 0, 1, 1,
0.5703204, 0.4994033, -1.040585, 0.2941177, 0, 1, 1,
0.5748706, 0.5773939, 1.018737, 0.3019608, 0, 1, 1,
0.5783752, -0.6748067, 2.174269, 0.3098039, 0, 1, 1,
0.5796651, 0.01530558, 1.412744, 0.3137255, 0, 1, 1,
0.5842952, -1.315518, 2.413473, 0.3215686, 0, 1, 1,
0.5866552, -0.7000026, 3.872446, 0.3254902, 0, 1, 1,
0.5893742, -0.9660603, 2.977708, 0.3333333, 0, 1, 1,
0.5898082, 1.377324, 2.073574, 0.3372549, 0, 1, 1,
0.6170395, -0.6426481, 2.309701, 0.345098, 0, 1, 1,
0.6190854, 2.138037, 1.087056, 0.3490196, 0, 1, 1,
0.6263876, 0.7394754, 2.393651, 0.3568628, 0, 1, 1,
0.6364836, -0.7947312, 3.660475, 0.3607843, 0, 1, 1,
0.6426873, 0.2174044, -0.1787785, 0.3686275, 0, 1, 1,
0.6429349, -0.3494211, 1.613412, 0.372549, 0, 1, 1,
0.6434266, -1.197005, 3.642697, 0.3803922, 0, 1, 1,
0.6434339, 0.2175024, 1.489414, 0.3843137, 0, 1, 1,
0.6453564, 0.8020405, -0.3750888, 0.3921569, 0, 1, 1,
0.6454304, 0.7694794, -0.8954421, 0.3960784, 0, 1, 1,
0.646879, -0.798048, 2.698264, 0.4039216, 0, 1, 1,
0.6496765, 3.409034, 1.427221, 0.4117647, 0, 1, 1,
0.6505938, 1.056498, -0.9866491, 0.4156863, 0, 1, 1,
0.6510948, 0.5038332, 0.7265965, 0.4235294, 0, 1, 1,
0.6526222, 0.276712, 0.8344693, 0.427451, 0, 1, 1,
0.6583238, 2.633769, 1.23116, 0.4352941, 0, 1, 1,
0.665719, -0.8885107, 2.988602, 0.4392157, 0, 1, 1,
0.6665282, -0.267989, 3.735628, 0.4470588, 0, 1, 1,
0.6684436, 0.2720726, 0.8002445, 0.4509804, 0, 1, 1,
0.6713671, 0.4687587, 2.343106, 0.4588235, 0, 1, 1,
0.6756198, -0.4742507, 1.959054, 0.4627451, 0, 1, 1,
0.6772987, -0.845988, 2.624723, 0.4705882, 0, 1, 1,
0.680083, 0.3347252, -0.5693995, 0.4745098, 0, 1, 1,
0.69067, 1.882526, -1.075246, 0.4823529, 0, 1, 1,
0.6914486, 0.6593703, 0.4316936, 0.4862745, 0, 1, 1,
0.6927573, -1.061756, 3.430649, 0.4941176, 0, 1, 1,
0.6931649, 1.640588, 0.7721025, 0.5019608, 0, 1, 1,
0.6943257, -1.396426, 3.278795, 0.5058824, 0, 1, 1,
0.6955272, 1.044753, -0.3629441, 0.5137255, 0, 1, 1,
0.6971182, 0.1475478, 0.4182193, 0.5176471, 0, 1, 1,
0.7137133, -1.380248, 0.9254486, 0.5254902, 0, 1, 1,
0.7153352, 0.5181482, 0.5309673, 0.5294118, 0, 1, 1,
0.7241117, 1.280727, 0.6289134, 0.5372549, 0, 1, 1,
0.7293559, 2.388586, 0.390317, 0.5411765, 0, 1, 1,
0.7294167, 0.2836792, 1.977221, 0.5490196, 0, 1, 1,
0.7308291, 1.955157, 1.16173, 0.5529412, 0, 1, 1,
0.7328151, -0.04334192, 1.311311, 0.5607843, 0, 1, 1,
0.7419453, 0.7669544, 1.980507, 0.5647059, 0, 1, 1,
0.7445329, 0.1215023, 1.807524, 0.572549, 0, 1, 1,
0.7460627, 0.1181307, 1.181956, 0.5764706, 0, 1, 1,
0.7485492, 0.5177689, 1.833954, 0.5843138, 0, 1, 1,
0.7569463, 0.9168903, 2.597684, 0.5882353, 0, 1, 1,
0.7646852, 0.9777218, 0.7441546, 0.5960785, 0, 1, 1,
0.7663687, 1.301045, 0.5941382, 0.6039216, 0, 1, 1,
0.7667965, -0.39223, 2.158933, 0.6078432, 0, 1, 1,
0.7829455, 1.413754, 0.6853886, 0.6156863, 0, 1, 1,
0.7836411, -0.524561, 4.462823, 0.6196079, 0, 1, 1,
0.7848008, 0.8086851, 2.438194, 0.627451, 0, 1, 1,
0.7881624, 0.4587226, 0.971866, 0.6313726, 0, 1, 1,
0.7929138, -0.9108806, 1.987659, 0.6392157, 0, 1, 1,
0.7932378, 0.4279505, 0.01690739, 0.6431373, 0, 1, 1,
0.7956821, 1.431932, 1.175544, 0.6509804, 0, 1, 1,
0.7970903, -1.531012, 2.894113, 0.654902, 0, 1, 1,
0.8027398, -0.2633334, 0.548564, 0.6627451, 0, 1, 1,
0.804789, -1.835276, 2.591831, 0.6666667, 0, 1, 1,
0.8058041, 0.6155661, 0.4175049, 0.6745098, 0, 1, 1,
0.8093607, -1.251379, 1.337882, 0.6784314, 0, 1, 1,
0.80949, 0.3629642, -0.2861615, 0.6862745, 0, 1, 1,
0.817255, 1.287826, 1.718643, 0.6901961, 0, 1, 1,
0.8225165, 0.5358142, -0.4944365, 0.6980392, 0, 1, 1,
0.8258622, -1.174765, 2.274778, 0.7058824, 0, 1, 1,
0.8300397, 1.182241, 0.8347257, 0.7098039, 0, 1, 1,
0.8304289, -0.6720489, 3.561559, 0.7176471, 0, 1, 1,
0.8311986, -0.9582734, 4.342174, 0.7215686, 0, 1, 1,
0.8363642, 0.04459056, 0.5262325, 0.7294118, 0, 1, 1,
0.8390933, 0.7652357, 0.1375177, 0.7333333, 0, 1, 1,
0.8471773, -0.5265328, 2.712248, 0.7411765, 0, 1, 1,
0.8510783, 0.05724112, 0.6190904, 0.7450981, 0, 1, 1,
0.8537502, 0.3347378, 0.4467903, 0.7529412, 0, 1, 1,
0.854471, -0.2220895, 2.460406, 0.7568628, 0, 1, 1,
0.8545523, 0.9991848, 0.8111086, 0.7647059, 0, 1, 1,
0.8643224, 0.473605, 0.3010062, 0.7686275, 0, 1, 1,
0.8685265, -0.2836345, 1.661268, 0.7764706, 0, 1, 1,
0.8886265, -1.255476, 2.684171, 0.7803922, 0, 1, 1,
0.889418, -1.478328, 4.286037, 0.7882353, 0, 1, 1,
0.8936015, -2.0553, 2.125413, 0.7921569, 0, 1, 1,
0.894338, 0.3450976, 2.558496, 0.8, 0, 1, 1,
0.8980939, -1.390926, 1.403063, 0.8078431, 0, 1, 1,
0.9015581, -2.154115, 1.005585, 0.8117647, 0, 1, 1,
0.9017487, 0.8595266, -0.9130738, 0.8196079, 0, 1, 1,
0.9029378, -0.6983426, 1.652509, 0.8235294, 0, 1, 1,
0.9067879, -0.1985671, 0.6919495, 0.8313726, 0, 1, 1,
0.9078538, -1.080477, 3.204923, 0.8352941, 0, 1, 1,
0.908174, -1.069274, 2.180899, 0.8431373, 0, 1, 1,
0.9091988, -1.391057, 2.049671, 0.8470588, 0, 1, 1,
0.9168554, -1.279885, 2.859831, 0.854902, 0, 1, 1,
0.9192818, -0.2486743, 1.435101, 0.8588235, 0, 1, 1,
0.9211851, -0.7548847, 1.436125, 0.8666667, 0, 1, 1,
0.9214975, -0.2779539, 0.369917, 0.8705882, 0, 1, 1,
0.9238336, 0.02003214, 2.354689, 0.8784314, 0, 1, 1,
0.9273743, -0.4320931, 1.18836, 0.8823529, 0, 1, 1,
0.9303591, 0.712226, 0.1114494, 0.8901961, 0, 1, 1,
0.9320261, 0.5693091, 3.12541, 0.8941177, 0, 1, 1,
0.9336748, 1.583468, -0.124057, 0.9019608, 0, 1, 1,
0.9355325, 1.296702, 1.172769, 0.9098039, 0, 1, 1,
0.9404458, 0.9041091, -0.4203518, 0.9137255, 0, 1, 1,
0.9460452, 0.6189062, 1.321234, 0.9215686, 0, 1, 1,
0.9479975, 0.5142428, 1.401789, 0.9254902, 0, 1, 1,
0.9485335, -0.2638951, 2.471494, 0.9333333, 0, 1, 1,
0.9530155, -1.437893, 1.26052, 0.9372549, 0, 1, 1,
0.9578152, -1.043816, 2.778164, 0.945098, 0, 1, 1,
0.9581014, 0.3721332, -0.4685444, 0.9490196, 0, 1, 1,
0.9610435, 1.177826, 0.8727943, 0.9568627, 0, 1, 1,
0.9610522, -0.7146214, 2.259885, 0.9607843, 0, 1, 1,
0.9611865, -0.173189, 2.197085, 0.9686275, 0, 1, 1,
0.9638554, 0.7467065, -0.008107752, 0.972549, 0, 1, 1,
0.97258, 0.9264403, -0.3637691, 0.9803922, 0, 1, 1,
0.9741616, 0.3825627, 1.587834, 0.9843137, 0, 1, 1,
0.9766888, 1.755092, 0.3333179, 0.9921569, 0, 1, 1,
0.977469, 0.7468293, -0.5220913, 0.9960784, 0, 1, 1,
0.9814154, -0.6503637, 2.512315, 1, 0, 0.9960784, 1,
0.9862629, -0.02787467, 0.6635244, 1, 0, 0.9882353, 1,
0.9928376, -1.528479, 3.261675, 1, 0, 0.9843137, 1,
1.01437, -1.571715, 4.187681, 1, 0, 0.9764706, 1,
1.022289, 0.3383781, 2.739179, 1, 0, 0.972549, 1,
1.023876, 0.3990572, 1.744697, 1, 0, 0.9647059, 1,
1.024203, -0.8865397, 1.297634, 1, 0, 0.9607843, 1,
1.029344, 0.01306581, -0.3172615, 1, 0, 0.9529412, 1,
1.047202, -0.6353938, 0.4949343, 1, 0, 0.9490196, 1,
1.06003, -0.4529507, 1.818104, 1, 0, 0.9411765, 1,
1.061165, -2.485378, 3.198886, 1, 0, 0.9372549, 1,
1.065753, -1.291285, 3.038367, 1, 0, 0.9294118, 1,
1.069259, -1.051031, 2.848457, 1, 0, 0.9254902, 1,
1.070743, -0.767463, 3.163804, 1, 0, 0.9176471, 1,
1.071495, 1.030277, 2.736006, 1, 0, 0.9137255, 1,
1.072767, 0.7217394, -0.104567, 1, 0, 0.9058824, 1,
1.077442, 1.79455, 0.9265531, 1, 0, 0.9019608, 1,
1.085887, -1.095339, 2.807586, 1, 0, 0.8941177, 1,
1.099864, 0.7257828, 1.532626, 1, 0, 0.8862745, 1,
1.100272, 1.022426, -0.6061664, 1, 0, 0.8823529, 1,
1.1018, -0.1981765, 2.199246, 1, 0, 0.8745098, 1,
1.112054, 0.736093, 1.79443, 1, 0, 0.8705882, 1,
1.112891, -2.021358, 2.664315, 1, 0, 0.8627451, 1,
1.113436, 1.269994, 1.446277, 1, 0, 0.8588235, 1,
1.126958, -0.5025306, 2.369488, 1, 0, 0.8509804, 1,
1.142886, 1.361335, 0.05812555, 1, 0, 0.8470588, 1,
1.145644, -0.1353722, 1.25009, 1, 0, 0.8392157, 1,
1.147046, 1.334651, -0.2228111, 1, 0, 0.8352941, 1,
1.147916, 0.9126301, 1.424298, 1, 0, 0.827451, 1,
1.151835, 0.4562489, 0.01949927, 1, 0, 0.8235294, 1,
1.153443, -0.2569777, 1.312536, 1, 0, 0.8156863, 1,
1.162183, 0.8797646, 1.251371, 1, 0, 0.8117647, 1,
1.162734, -1.116037, 2.513612, 1, 0, 0.8039216, 1,
1.164484, 1.573834, -0.114233, 1, 0, 0.7960784, 1,
1.168965, -0.03701766, 2.119993, 1, 0, 0.7921569, 1,
1.176164, -0.1744532, 1.313489, 1, 0, 0.7843137, 1,
1.178241, 1.051701, 0.6227009, 1, 0, 0.7803922, 1,
1.182513, -2.39312, 2.29297, 1, 0, 0.772549, 1,
1.186275, -0.1274826, -0.004566246, 1, 0, 0.7686275, 1,
1.192281, -0.6724245, 0.0801736, 1, 0, 0.7607843, 1,
1.19754, -0.07149278, 3.092496, 1, 0, 0.7568628, 1,
1.20776, -0.5159798, 1.429194, 1, 0, 0.7490196, 1,
1.209424, 1.178081, 1.132691, 1, 0, 0.7450981, 1,
1.210742, 0.8252624, 0.4010428, 1, 0, 0.7372549, 1,
1.212317, 0.1141366, 1.741088, 1, 0, 0.7333333, 1,
1.217427, 0.0324803, 2.256445, 1, 0, 0.7254902, 1,
1.218457, -0.9841961, 2.784471, 1, 0, 0.7215686, 1,
1.230574, 1.768958, -0.6362689, 1, 0, 0.7137255, 1,
1.234113, 1.714028, 0.7353519, 1, 0, 0.7098039, 1,
1.23792, 0.4373668, -1.199901, 1, 0, 0.7019608, 1,
1.263394, -0.519045, 0.737065, 1, 0, 0.6941177, 1,
1.270828, 0.898542, -1.204346, 1, 0, 0.6901961, 1,
1.271227, 0.8321446, 1.744177, 1, 0, 0.682353, 1,
1.277308, -0.1094533, 0.2183772, 1, 0, 0.6784314, 1,
1.279509, -1.063518, -0.2975318, 1, 0, 0.6705883, 1,
1.28429, -0.4316807, 1.853679, 1, 0, 0.6666667, 1,
1.285917, 0.06000093, 0.9816638, 1, 0, 0.6588235, 1,
1.286745, 1.75433, 2.383107, 1, 0, 0.654902, 1,
1.289332, 0.04996296, 0.302436, 1, 0, 0.6470588, 1,
1.293578, 0.4453287, 1.43065, 1, 0, 0.6431373, 1,
1.293655, -0.2767144, 4.438877, 1, 0, 0.6352941, 1,
1.295142, 0.4242255, 1.367827, 1, 0, 0.6313726, 1,
1.297489, 1.261855, 0.3345025, 1, 0, 0.6235294, 1,
1.303629, -0.04939191, 0.5516396, 1, 0, 0.6196079, 1,
1.323801, -0.378262, -0.4269826, 1, 0, 0.6117647, 1,
1.327332, -0.2310374, 2.2892, 1, 0, 0.6078432, 1,
1.333269, -0.3223494, 1.5086, 1, 0, 0.6, 1,
1.340479, -0.3827192, 2.278878, 1, 0, 0.5921569, 1,
1.361376, 0.05096902, 1.489872, 1, 0, 0.5882353, 1,
1.365175, 0.1610015, 4.491604, 1, 0, 0.5803922, 1,
1.36631, -0.9737741, 2.748315, 1, 0, 0.5764706, 1,
1.381829, -2.06336, 2.679509, 1, 0, 0.5686275, 1,
1.383362, 0.2074267, 2.099257, 1, 0, 0.5647059, 1,
1.397492, 0.1929734, 0.7150013, 1, 0, 0.5568628, 1,
1.399156, 2.496767, -0.238106, 1, 0, 0.5529412, 1,
1.415669, 0.8963518, 0.4148378, 1, 0, 0.5450981, 1,
1.421118, 0.2237468, 2.068097, 1, 0, 0.5411765, 1,
1.432706, -1.131093, 2.518365, 1, 0, 0.5333334, 1,
1.434392, 0.001660987, 0.8969818, 1, 0, 0.5294118, 1,
1.436846, 0.2811804, 2.929397, 1, 0, 0.5215687, 1,
1.441029, 0.418028, -0.5092785, 1, 0, 0.5176471, 1,
1.458474, -0.5266329, 2.751782, 1, 0, 0.509804, 1,
1.472281, 0.1623454, 1.828298, 1, 0, 0.5058824, 1,
1.473977, 0.1618269, 1.515537, 1, 0, 0.4980392, 1,
1.474534, -1.554748, 2.797123, 1, 0, 0.4901961, 1,
1.477276, -0.5462497, 1.807142, 1, 0, 0.4862745, 1,
1.494246, -0.03781043, 0.6489205, 1, 0, 0.4784314, 1,
1.495985, 2.099065, 2.805118, 1, 0, 0.4745098, 1,
1.497002, 0.9992911, -0.2541456, 1, 0, 0.4666667, 1,
1.505561, 0.9696703, 0.310333, 1, 0, 0.4627451, 1,
1.515962, -0.9562668, 0.9704207, 1, 0, 0.454902, 1,
1.520552, -0.6177983, 2.780165, 1, 0, 0.4509804, 1,
1.528302, 0.7113093, 1.172922, 1, 0, 0.4431373, 1,
1.543069, -0.1668023, 1.86986, 1, 0, 0.4392157, 1,
1.552715, 1.014425, 2.421997, 1, 0, 0.4313726, 1,
1.560149, -2.173373, 2.905236, 1, 0, 0.427451, 1,
1.563564, -0.05618151, 2.705355, 1, 0, 0.4196078, 1,
1.567671, -0.4936604, 1.151546, 1, 0, 0.4156863, 1,
1.56968, -0.6189758, -1.05998, 1, 0, 0.4078431, 1,
1.579243, -1.429177, 2.131429, 1, 0, 0.4039216, 1,
1.608306, -1.067695, 3.509718, 1, 0, 0.3960784, 1,
1.608721, -0.2341108, 2.144917, 1, 0, 0.3882353, 1,
1.610434, 1.997991, 1.012106, 1, 0, 0.3843137, 1,
1.612242, -1.472142, 2.849955, 1, 0, 0.3764706, 1,
1.613584, -1.234892, 0.3788576, 1, 0, 0.372549, 1,
1.63648, -0.2996737, 2.118129, 1, 0, 0.3647059, 1,
1.642957, 1.395613, 0.6722618, 1, 0, 0.3607843, 1,
1.650105, -1.050958, 1.579563, 1, 0, 0.3529412, 1,
1.670757, 0.5395999, 1.215786, 1, 0, 0.3490196, 1,
1.693449, -0.8190057, 0.6545649, 1, 0, 0.3411765, 1,
1.693751, 0.8286452, 0.4870863, 1, 0, 0.3372549, 1,
1.694286, 3.140451, -0.8117845, 1, 0, 0.3294118, 1,
1.714327, 0.4944443, 0.4163479, 1, 0, 0.3254902, 1,
1.715105, 1.420054, 1.261633, 1, 0, 0.3176471, 1,
1.718366, -1.355948, 2.941669, 1, 0, 0.3137255, 1,
1.747033, 0.3282716, -0.06706525, 1, 0, 0.3058824, 1,
1.754492, 0.5262893, 1.107984, 1, 0, 0.2980392, 1,
1.756687, -1.683335, 2.600113, 1, 0, 0.2941177, 1,
1.777916, 0.4199902, 2.287194, 1, 0, 0.2862745, 1,
1.787914, -0.2010788, 2.32105, 1, 0, 0.282353, 1,
1.796354, 0.5798945, 1.461589, 1, 0, 0.2745098, 1,
1.798496, 2.729868, -1.141918, 1, 0, 0.2705882, 1,
1.805024, 1.489672, 0.7966569, 1, 0, 0.2627451, 1,
1.806283, 0.08753259, 2.219983, 1, 0, 0.2588235, 1,
1.820077, 0.7291865, 2.865263, 1, 0, 0.2509804, 1,
1.835546, -0.3753231, 0.4643238, 1, 0, 0.2470588, 1,
1.872237, -0.5146601, 2.67096, 1, 0, 0.2392157, 1,
1.872725, 0.7093016, 1.195753, 1, 0, 0.2352941, 1,
1.888371, 0.04254096, 1.477333, 1, 0, 0.227451, 1,
1.89992, -0.9846538, 5.17232, 1, 0, 0.2235294, 1,
1.915603, -1.109389, 3.77269, 1, 0, 0.2156863, 1,
1.9204, -0.1706271, 1.454633, 1, 0, 0.2117647, 1,
1.926779, -1.679914, 2.700635, 1, 0, 0.2039216, 1,
1.955638, 0.7063652, 0.8570965, 1, 0, 0.1960784, 1,
2.004207, -1.21097, 1.727778, 1, 0, 0.1921569, 1,
2.027819, 0.003176458, 2.145013, 1, 0, 0.1843137, 1,
2.045534, 0.6035286, 0.1780044, 1, 0, 0.1803922, 1,
2.048373, 0.0543486, 3.545831, 1, 0, 0.172549, 1,
2.072884, -1.860608, 1.503827, 1, 0, 0.1686275, 1,
2.074014, 0.3357498, 0.9929265, 1, 0, 0.1607843, 1,
2.08541, 0.07870267, 3.046501, 1, 0, 0.1568628, 1,
2.087799, -0.4986413, 1.584337, 1, 0, 0.1490196, 1,
2.100107, 0.3415896, 1.393434, 1, 0, 0.145098, 1,
2.108077, -1.553916, 1.255891, 1, 0, 0.1372549, 1,
2.128584, 0.9305429, 2.403346, 1, 0, 0.1333333, 1,
2.139788, 1.445455, 0.04553342, 1, 0, 0.1254902, 1,
2.14904, -1.969076, 1.969602, 1, 0, 0.1215686, 1,
2.180687, 0.5321447, 1.935203, 1, 0, 0.1137255, 1,
2.184209, 1.004684, 0.7623828, 1, 0, 0.1098039, 1,
2.191362, -1.303993, 4.471179, 1, 0, 0.1019608, 1,
2.239233, 0.3172563, 2.602329, 1, 0, 0.09411765, 1,
2.248957, 0.4629535, 1.567399, 1, 0, 0.09019608, 1,
2.275434, 0.2434297, 2.038662, 1, 0, 0.08235294, 1,
2.286864, -0.3974481, 1.629514, 1, 0, 0.07843138, 1,
2.296836, 0.3990772, 1.745249, 1, 0, 0.07058824, 1,
2.301668, 1.667849, 0.463669, 1, 0, 0.06666667, 1,
2.314846, 0.1529149, -0.0706927, 1, 0, 0.05882353, 1,
2.364293, 0.08113723, 2.127311, 1, 0, 0.05490196, 1,
2.427758, 0.4564827, 0.1883131, 1, 0, 0.04705882, 1,
2.446053, -0.5272092, 0.6682346, 1, 0, 0.04313726, 1,
2.527636, -2.07731, 3.516617, 1, 0, 0.03529412, 1,
2.646428, 0.8776075, 1.954403, 1, 0, 0.03137255, 1,
2.652114, 0.2131881, 1.856666, 1, 0, 0.02352941, 1,
2.711807, 0.7408516, 2.574704, 1, 0, 0.01960784, 1,
2.82058, 2.555701, 1.128215, 1, 0, 0.01176471, 1,
3.344922, 1.085038, -0.1837969, 1, 0, 0.007843138, 1
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
0.1551152, -3.777447, -7.276668, 0, -0.5, 0.5, 0.5,
0.1551152, -3.777447, -7.276668, 1, -0.5, 0.5, 0.5,
0.1551152, -3.777447, -7.276668, 1, 1.5, 0.5, 0.5,
0.1551152, -3.777447, -7.276668, 0, 1.5, 0.5, 0.5
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
-4.116036, 0.639637, -7.276668, 0, -0.5, 0.5, 0.5,
-4.116036, 0.639637, -7.276668, 1, -0.5, 0.5, 0.5,
-4.116036, 0.639637, -7.276668, 1, 1.5, 0.5, 0.5,
-4.116036, 0.639637, -7.276668, 0, 1.5, 0.5, 0.5
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
-4.116036, -3.777447, -0.1265545, 0, -0.5, 0.5, 0.5,
-4.116036, -3.777447, -0.1265545, 1, -0.5, 0.5, 0.5,
-4.116036, -3.777447, -0.1265545, 1, 1.5, 0.5, 0.5,
-4.116036, -3.777447, -0.1265545, 0, 1.5, 0.5, 0.5
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
-3, -2.75812, -5.626642,
3, -2.75812, -5.626642,
-3, -2.75812, -5.626642,
-3, -2.928008, -5.901646,
-2, -2.75812, -5.626642,
-2, -2.928008, -5.901646,
-1, -2.75812, -5.626642,
-1, -2.928008, -5.901646,
0, -2.75812, -5.626642,
0, -2.928008, -5.901646,
1, -2.75812, -5.626642,
1, -2.928008, -5.901646,
2, -2.75812, -5.626642,
2, -2.928008, -5.901646,
3, -2.75812, -5.626642,
3, -2.928008, -5.901646
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
-3, -3.267784, -6.451655, 0, -0.5, 0.5, 0.5,
-3, -3.267784, -6.451655, 1, -0.5, 0.5, 0.5,
-3, -3.267784, -6.451655, 1, 1.5, 0.5, 0.5,
-3, -3.267784, -6.451655, 0, 1.5, 0.5, 0.5,
-2, -3.267784, -6.451655, 0, -0.5, 0.5, 0.5,
-2, -3.267784, -6.451655, 1, -0.5, 0.5, 0.5,
-2, -3.267784, -6.451655, 1, 1.5, 0.5, 0.5,
-2, -3.267784, -6.451655, 0, 1.5, 0.5, 0.5,
-1, -3.267784, -6.451655, 0, -0.5, 0.5, 0.5,
-1, -3.267784, -6.451655, 1, -0.5, 0.5, 0.5,
-1, -3.267784, -6.451655, 1, 1.5, 0.5, 0.5,
-1, -3.267784, -6.451655, 0, 1.5, 0.5, 0.5,
0, -3.267784, -6.451655, 0, -0.5, 0.5, 0.5,
0, -3.267784, -6.451655, 1, -0.5, 0.5, 0.5,
0, -3.267784, -6.451655, 1, 1.5, 0.5, 0.5,
0, -3.267784, -6.451655, 0, 1.5, 0.5, 0.5,
1, -3.267784, -6.451655, 0, -0.5, 0.5, 0.5,
1, -3.267784, -6.451655, 1, -0.5, 0.5, 0.5,
1, -3.267784, -6.451655, 1, 1.5, 0.5, 0.5,
1, -3.267784, -6.451655, 0, 1.5, 0.5, 0.5,
2, -3.267784, -6.451655, 0, -0.5, 0.5, 0.5,
2, -3.267784, -6.451655, 1, -0.5, 0.5, 0.5,
2, -3.267784, -6.451655, 1, 1.5, 0.5, 0.5,
2, -3.267784, -6.451655, 0, 1.5, 0.5, 0.5,
3, -3.267784, -6.451655, 0, -0.5, 0.5, 0.5,
3, -3.267784, -6.451655, 1, -0.5, 0.5, 0.5,
3, -3.267784, -6.451655, 1, 1.5, 0.5, 0.5,
3, -3.267784, -6.451655, 0, 1.5, 0.5, 0.5
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
-3.130386, -2, -5.626642,
-3.130386, 3, -5.626642,
-3.130386, -2, -5.626642,
-3.294661, -2, -5.901646,
-3.130386, -1, -5.626642,
-3.294661, -1, -5.901646,
-3.130386, 0, -5.626642,
-3.294661, 0, -5.901646,
-3.130386, 1, -5.626642,
-3.294661, 1, -5.901646,
-3.130386, 2, -5.626642,
-3.294661, 2, -5.901646,
-3.130386, 3, -5.626642,
-3.294661, 3, -5.901646
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
-3.623211, -2, -6.451655, 0, -0.5, 0.5, 0.5,
-3.623211, -2, -6.451655, 1, -0.5, 0.5, 0.5,
-3.623211, -2, -6.451655, 1, 1.5, 0.5, 0.5,
-3.623211, -2, -6.451655, 0, 1.5, 0.5, 0.5,
-3.623211, -1, -6.451655, 0, -0.5, 0.5, 0.5,
-3.623211, -1, -6.451655, 1, -0.5, 0.5, 0.5,
-3.623211, -1, -6.451655, 1, 1.5, 0.5, 0.5,
-3.623211, -1, -6.451655, 0, 1.5, 0.5, 0.5,
-3.623211, 0, -6.451655, 0, -0.5, 0.5, 0.5,
-3.623211, 0, -6.451655, 1, -0.5, 0.5, 0.5,
-3.623211, 0, -6.451655, 1, 1.5, 0.5, 0.5,
-3.623211, 0, -6.451655, 0, 1.5, 0.5, 0.5,
-3.623211, 1, -6.451655, 0, -0.5, 0.5, 0.5,
-3.623211, 1, -6.451655, 1, -0.5, 0.5, 0.5,
-3.623211, 1, -6.451655, 1, 1.5, 0.5, 0.5,
-3.623211, 1, -6.451655, 0, 1.5, 0.5, 0.5,
-3.623211, 2, -6.451655, 0, -0.5, 0.5, 0.5,
-3.623211, 2, -6.451655, 1, -0.5, 0.5, 0.5,
-3.623211, 2, -6.451655, 1, 1.5, 0.5, 0.5,
-3.623211, 2, -6.451655, 0, 1.5, 0.5, 0.5,
-3.623211, 3, -6.451655, 0, -0.5, 0.5, 0.5,
-3.623211, 3, -6.451655, 1, -0.5, 0.5, 0.5,
-3.623211, 3, -6.451655, 1, 1.5, 0.5, 0.5,
-3.623211, 3, -6.451655, 0, 1.5, 0.5, 0.5
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
-3.130386, -2.75812, -4,
-3.130386, -2.75812, 4,
-3.130386, -2.75812, -4,
-3.294661, -2.928008, -4,
-3.130386, -2.75812, -2,
-3.294661, -2.928008, -2,
-3.130386, -2.75812, 0,
-3.294661, -2.928008, 0,
-3.130386, -2.75812, 2,
-3.294661, -2.928008, 2,
-3.130386, -2.75812, 4,
-3.294661, -2.928008, 4
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
-3.623211, -3.267784, -4, 0, -0.5, 0.5, 0.5,
-3.623211, -3.267784, -4, 1, -0.5, 0.5, 0.5,
-3.623211, -3.267784, -4, 1, 1.5, 0.5, 0.5,
-3.623211, -3.267784, -4, 0, 1.5, 0.5, 0.5,
-3.623211, -3.267784, -2, 0, -0.5, 0.5, 0.5,
-3.623211, -3.267784, -2, 1, -0.5, 0.5, 0.5,
-3.623211, -3.267784, -2, 1, 1.5, 0.5, 0.5,
-3.623211, -3.267784, -2, 0, 1.5, 0.5, 0.5,
-3.623211, -3.267784, 0, 0, -0.5, 0.5, 0.5,
-3.623211, -3.267784, 0, 1, -0.5, 0.5, 0.5,
-3.623211, -3.267784, 0, 1, 1.5, 0.5, 0.5,
-3.623211, -3.267784, 0, 0, 1.5, 0.5, 0.5,
-3.623211, -3.267784, 2, 0, -0.5, 0.5, 0.5,
-3.623211, -3.267784, 2, 1, -0.5, 0.5, 0.5,
-3.623211, -3.267784, 2, 1, 1.5, 0.5, 0.5,
-3.623211, -3.267784, 2, 0, 1.5, 0.5, 0.5,
-3.623211, -3.267784, 4, 0, -0.5, 0.5, 0.5,
-3.623211, -3.267784, 4, 1, -0.5, 0.5, 0.5,
-3.623211, -3.267784, 4, 1, 1.5, 0.5, 0.5,
-3.623211, -3.267784, 4, 0, 1.5, 0.5, 0.5
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
-3.130386, -2.75812, -5.626642,
-3.130386, 4.037395, -5.626642,
-3.130386, -2.75812, 5.373533,
-3.130386, 4.037395, 5.373533,
-3.130386, -2.75812, -5.626642,
-3.130386, -2.75812, 5.373533,
-3.130386, 4.037395, -5.626642,
-3.130386, 4.037395, 5.373533,
-3.130386, -2.75812, -5.626642,
3.440616, -2.75812, -5.626642,
-3.130386, -2.75812, 5.373533,
3.440616, -2.75812, 5.373533,
-3.130386, 4.037395, -5.626642,
3.440616, 4.037395, -5.626642,
-3.130386, 4.037395, 5.373533,
3.440616, 4.037395, 5.373533,
3.440616, -2.75812, -5.626642,
3.440616, 4.037395, -5.626642,
3.440616, -2.75812, 5.373533,
3.440616, 4.037395, 5.373533,
3.440616, -2.75812, -5.626642,
3.440616, -2.75812, 5.373533,
3.440616, 4.037395, -5.626642,
3.440616, 4.037395, 5.373533
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
var radius = 7.744761;
var distance = 34.45731;
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
mvMatrix.translate( -0.1551152, -0.639637, 0.1265545 );
mvMatrix.scale( 1.274355, 1.232252, 0.7612413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.45731);
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
Ekatin<-read.table("Ekatin.xyz")
```

```
## Error in read.table("Ekatin.xyz"): no lines available in input
```

```r
x<-Ekatin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ekatin' not found
```

```r
y<-Ekatin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ekatin' not found
```

```r
z<-Ekatin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ekatin' not found
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
-3.034692, -0.7376626, -0.2538753, 0, 0, 1, 1, 1,
-2.995911, -1.999383, -2.114969, 1, 0, 0, 1, 1,
-2.868756, 3.938431, -0.6629812, 1, 0, 0, 1, 1,
-2.860741, -0.7889022, -1.104561, 1, 0, 0, 1, 1,
-2.646704, 1.535051, -0.9559632, 1, 0, 0, 1, 1,
-2.564556, -0.3806866, -0.6523878, 1, 0, 0, 1, 1,
-2.557264, 0.4891162, -3.093494, 0, 0, 0, 1, 1,
-2.456872, -0.04085999, -1.113218, 0, 0, 0, 1, 1,
-2.368922, 1.137485, -0.4549822, 0, 0, 0, 1, 1,
-2.29454, 0.869628, -0.3270926, 0, 0, 0, 1, 1,
-2.288685, -2.386904, -3.753141, 0, 0, 0, 1, 1,
-2.265693, -0.04578618, -2.348588, 0, 0, 0, 1, 1,
-2.219864, -1.080707, -2.510283, 0, 0, 0, 1, 1,
-2.200701, 0.4077019, -0.8191119, 1, 1, 1, 1, 1,
-2.194363, 1.292062, 0.144811, 1, 1, 1, 1, 1,
-2.193319, -0.3883838, -2.17856, 1, 1, 1, 1, 1,
-2.182486, -0.9554193, -1.740562, 1, 1, 1, 1, 1,
-2.140641, -0.3397104, -3.43808, 1, 1, 1, 1, 1,
-2.130496, -1.826461, -3.513051, 1, 1, 1, 1, 1,
-2.120996, -1.855274, -0.6599877, 1, 1, 1, 1, 1,
-2.048641, -0.2089121, -1.064457, 1, 1, 1, 1, 1,
-2.021546, -0.7588823, -0.3328098, 1, 1, 1, 1, 1,
-1.996394, -1.553579, -1.0224, 1, 1, 1, 1, 1,
-1.986422, 0.0835944, -1.840116, 1, 1, 1, 1, 1,
-1.971207, 0.09239311, 0.0750762, 1, 1, 1, 1, 1,
-1.926914, 0.7253963, -1.742746, 1, 1, 1, 1, 1,
-1.923486, 1.400984, -1.483114, 1, 1, 1, 1, 1,
-1.917546, -0.1319799, -1.229286, 1, 1, 1, 1, 1,
-1.901953, -1.093173, -1.324867, 0, 0, 1, 1, 1,
-1.883187, -1.192953, -3.406086, 1, 0, 0, 1, 1,
-1.882932, -1.249553, -1.710186, 1, 0, 0, 1, 1,
-1.850217, 1.268027, -2.347379, 1, 0, 0, 1, 1,
-1.841124, 0.338835, -0.6814317, 1, 0, 0, 1, 1,
-1.837336, -1.339771, -1.959069, 1, 0, 0, 1, 1,
-1.824232, 0.8341448, -1.107063, 0, 0, 0, 1, 1,
-1.820895, -0.01805762, -0.176909, 0, 0, 0, 1, 1,
-1.797838, -0.2776169, -1.006125, 0, 0, 0, 1, 1,
-1.79137, 0.5318019, -1.148031, 0, 0, 0, 1, 1,
-1.790448, 0.5062104, -2.459934, 0, 0, 0, 1, 1,
-1.782259, -0.1642777, -2.840057, 0, 0, 0, 1, 1,
-1.744393, 1.792857, -0.6684927, 0, 0, 0, 1, 1,
-1.736413, -1.759615, -3.146931, 1, 1, 1, 1, 1,
-1.702457, 1.544547, 0.8602151, 1, 1, 1, 1, 1,
-1.702055, 0.275081, 0.247639, 1, 1, 1, 1, 1,
-1.690207, -1.719271, -2.774843, 1, 1, 1, 1, 1,
-1.659645, -1.609229, -2.822061, 1, 1, 1, 1, 1,
-1.659283, 0.1700033, -0.689375, 1, 1, 1, 1, 1,
-1.636904, 0.1609327, -1.877602, 1, 1, 1, 1, 1,
-1.62898, 0.819836, -1.270854, 1, 1, 1, 1, 1,
-1.60894, -1.002841, -3.375164, 1, 1, 1, 1, 1,
-1.591528, -0.3459418, -2.160602, 1, 1, 1, 1, 1,
-1.589599, 1.311661, -1.631164, 1, 1, 1, 1, 1,
-1.584846, -1.120636, -3.037169, 1, 1, 1, 1, 1,
-1.573094, -1.078844, -0.9855433, 1, 1, 1, 1, 1,
-1.557373, -0.2938585, -3.82091, 1, 1, 1, 1, 1,
-1.547841, 0.9427794, -1.636789, 1, 1, 1, 1, 1,
-1.546761, 0.5534573, -0.5491725, 0, 0, 1, 1, 1,
-1.541493, 0.4860069, -0.4053834, 1, 0, 0, 1, 1,
-1.529922, 0.8912909, -0.6138628, 1, 0, 0, 1, 1,
-1.526313, -0.08021526, -1.061102, 1, 0, 0, 1, 1,
-1.512643, -0.08148023, -0.9409083, 1, 0, 0, 1, 1,
-1.510546, -1.713717, -3.288043, 1, 0, 0, 1, 1,
-1.502169, 0.9418278, -0.8483183, 0, 0, 0, 1, 1,
-1.499076, -0.07981253, -2.50187, 0, 0, 0, 1, 1,
-1.492304, -0.2991639, -1.511212, 0, 0, 0, 1, 1,
-1.49212, 0.1079328, -0.7293125, 0, 0, 0, 1, 1,
-1.490053, 0.3766733, -2.691879, 0, 0, 0, 1, 1,
-1.475728, -0.4994216, -1.964247, 0, 0, 0, 1, 1,
-1.475619, -0.8786472, -2.089849, 0, 0, 0, 1, 1,
-1.45305, -2.263239, -3.753013, 1, 1, 1, 1, 1,
-1.450212, -0.5418745, -2.900298, 1, 1, 1, 1, 1,
-1.445859, -1.666374, -2.53782, 1, 1, 1, 1, 1,
-1.437317, 0.6252577, -2.032556, 1, 1, 1, 1, 1,
-1.414432, -1.112543, -1.252262, 1, 1, 1, 1, 1,
-1.4078, -0.9188331, -0.1315543, 1, 1, 1, 1, 1,
-1.390974, 1.407421, -0.9215257, 1, 1, 1, 1, 1,
-1.376908, -0.07476909, -1.68919, 1, 1, 1, 1, 1,
-1.369825, -0.7726198, -3.16198, 1, 1, 1, 1, 1,
-1.368288, -0.7713555, -2.770926, 1, 1, 1, 1, 1,
-1.340388, -0.1138097, 0.3379435, 1, 1, 1, 1, 1,
-1.33488, -0.6866364, -1.382561, 1, 1, 1, 1, 1,
-1.329989, 0.7292907, -0.5672361, 1, 1, 1, 1, 1,
-1.329313, 0.7557843, -1.956464, 1, 1, 1, 1, 1,
-1.315142, -0.6828641, -1.020319, 1, 1, 1, 1, 1,
-1.311865, -1.828529, -1.800612, 0, 0, 1, 1, 1,
-1.311505, 0.7466182, -1.873236, 1, 0, 0, 1, 1,
-1.306847, 0.3718782, -1.822651, 1, 0, 0, 1, 1,
-1.299883, -0.6331045, -1.897745, 1, 0, 0, 1, 1,
-1.294723, 0.8833525, 0.1415065, 1, 0, 0, 1, 1,
-1.291255, 1.025297, -0.5249683, 1, 0, 0, 1, 1,
-1.283054, 1.020697, -0.6915026, 0, 0, 0, 1, 1,
-1.280841, -0.5629495, -3.731926, 0, 0, 0, 1, 1,
-1.280223, -0.4461361, -2.666935, 0, 0, 0, 1, 1,
-1.274317, -0.3008929, -1.773389, 0, 0, 0, 1, 1,
-1.2723, -0.5167058, -4.027497, 0, 0, 0, 1, 1,
-1.265088, -0.7174516, -4.089173, 0, 0, 0, 1, 1,
-1.263524, -1.224871, -3.277565, 0, 0, 0, 1, 1,
-1.261142, 0.8895889, -1.248108, 1, 1, 1, 1, 1,
-1.257297, -0.3915743, -1.301519, 1, 1, 1, 1, 1,
-1.255714, -0.1212633, -1.791516, 1, 1, 1, 1, 1,
-1.244112, 1.209794, -0.4946251, 1, 1, 1, 1, 1,
-1.237912, -0.2445756, -4.158259, 1, 1, 1, 1, 1,
-1.234091, -0.4582164, -1.079339, 1, 1, 1, 1, 1,
-1.229283, 0.25293, -2.032017, 1, 1, 1, 1, 1,
-1.22229, 0.7765871, -3.215547, 1, 1, 1, 1, 1,
-1.212169, -0.3099217, -2.194981, 1, 1, 1, 1, 1,
-1.211503, -0.06163257, -1.261107, 1, 1, 1, 1, 1,
-1.203515, 1.908098, -1.844229, 1, 1, 1, 1, 1,
-1.199586, -1.507728, -2.046637, 1, 1, 1, 1, 1,
-1.19444, 0.4822376, -1.697055, 1, 1, 1, 1, 1,
-1.186983, -0.4390823, -3.233966, 1, 1, 1, 1, 1,
-1.181352, 0.7830672, -2.622204, 1, 1, 1, 1, 1,
-1.172989, -0.05727839, -2.620173, 0, 0, 1, 1, 1,
-1.171322, -1.587671, -3.313908, 1, 0, 0, 1, 1,
-1.169621, -0.8629845, -2.692378, 1, 0, 0, 1, 1,
-1.168318, 1.078518, -3.058243, 1, 0, 0, 1, 1,
-1.167692, -0.007266734, -3.884094, 1, 0, 0, 1, 1,
-1.165482, -0.2691652, 0.2763309, 1, 0, 0, 1, 1,
-1.162536, 0.9923441, -0.5507051, 0, 0, 0, 1, 1,
-1.157577, -0.4081286, -1.768178, 0, 0, 0, 1, 1,
-1.152645, 0.06457468, -0.6128766, 0, 0, 0, 1, 1,
-1.152304, -0.707132, -0.7545146, 0, 0, 0, 1, 1,
-1.13466, 0.8341788, 0.7499807, 0, 0, 0, 1, 1,
-1.134425, 0.4660425, -1.34588, 0, 0, 0, 1, 1,
-1.126983, 1.220857, 0.7626165, 0, 0, 0, 1, 1,
-1.124692, 1.905534, -0.3089889, 1, 1, 1, 1, 1,
-1.123192, 1.331436, -2.429442, 1, 1, 1, 1, 1,
-1.121635, 0.3532956, -0.8260452, 1, 1, 1, 1, 1,
-1.116558, -0.2646653, 0.08863996, 1, 1, 1, 1, 1,
-1.105716, 0.9411345, -0.8942593, 1, 1, 1, 1, 1,
-1.08803, 0.4801024, -0.7019013, 1, 1, 1, 1, 1,
-1.084871, 2.616424, -0.9622269, 1, 1, 1, 1, 1,
-1.081695, -1.079107, -0.9489166, 1, 1, 1, 1, 1,
-1.081439, 0.1956669, -2.008329, 1, 1, 1, 1, 1,
-1.070606, -0.1474274, -2.738141, 1, 1, 1, 1, 1,
-1.069696, -0.1254315, -1.453304, 1, 1, 1, 1, 1,
-1.066595, 1.022682, -1.036135, 1, 1, 1, 1, 1,
-1.060978, -1.049334, -0.5161808, 1, 1, 1, 1, 1,
-1.060764, 1.347506, -1.356047, 1, 1, 1, 1, 1,
-1.060687, -2.238034, -3.773588, 1, 1, 1, 1, 1,
-1.058607, 0.05827826, -0.1015433, 0, 0, 1, 1, 1,
-1.053938, -0.9476574, -2.807312, 1, 0, 0, 1, 1,
-1.050536, -0.4033794, -1.569341, 1, 0, 0, 1, 1,
-1.044349, -0.4219926, -1.599285, 1, 0, 0, 1, 1,
-1.044245, -0.6398134, -0.2455705, 1, 0, 0, 1, 1,
-1.039012, 0.4633277, -0.8423833, 1, 0, 0, 1, 1,
-1.025534, -1.053585, -2.011101, 0, 0, 0, 1, 1,
-1.023763, -0.2512251, -2.676194, 0, 0, 0, 1, 1,
-1.021101, -0.8321741, -2.298381, 0, 0, 0, 1, 1,
-1.020809, -0.1400188, -0.3994366, 0, 0, 0, 1, 1,
-1.016939, 0.01332276, -0.4162348, 0, 0, 0, 1, 1,
-1.011199, -0.4006146, -1.823721, 0, 0, 0, 1, 1,
-1.00872, 1.218278, -1.333409, 0, 0, 0, 1, 1,
-0.9967651, -1.323801, -1.250803, 1, 1, 1, 1, 1,
-0.9889578, 0.8878789, -2.155374, 1, 1, 1, 1, 1,
-0.9861078, 0.458023, -0.9842037, 1, 1, 1, 1, 1,
-0.984833, -0.378351, -1.231817, 1, 1, 1, 1, 1,
-0.9825852, -0.1156033, 0.007437877, 1, 1, 1, 1, 1,
-0.981998, -0.3136092, -1.470093, 1, 1, 1, 1, 1,
-0.9792917, 0.245949, -1.466151, 1, 1, 1, 1, 1,
-0.975852, -1.691432, -2.51681, 1, 1, 1, 1, 1,
-0.9756508, 0.429271, -1.85863, 1, 1, 1, 1, 1,
-0.9699439, -0.5224693, -1.834991, 1, 1, 1, 1, 1,
-0.9699332, 0.3198397, -1.117923, 1, 1, 1, 1, 1,
-0.9688184, 0.2384989, -1.304639, 1, 1, 1, 1, 1,
-0.9682621, 1.688833, 0.8365762, 1, 1, 1, 1, 1,
-0.9635857, -0.2260468, -2.677101, 1, 1, 1, 1, 1,
-0.9560276, -2.353414, -1.72708, 1, 1, 1, 1, 1,
-0.9526985, 0.4659829, -0.2979224, 0, 0, 1, 1, 1,
-0.9511055, 0.2031068, -2.840054, 1, 0, 0, 1, 1,
-0.9448502, -0.4634917, -2.161831, 1, 0, 0, 1, 1,
-0.944805, 0.4344956, -2.739357, 1, 0, 0, 1, 1,
-0.9434533, -0.6583368, -1.942923, 1, 0, 0, 1, 1,
-0.9426066, -0.427686, -2.222167, 1, 0, 0, 1, 1,
-0.9391755, 0.3376275, -1.968487, 0, 0, 0, 1, 1,
-0.9350664, -0.8163535, -2.247824, 0, 0, 0, 1, 1,
-0.9328904, -0.9993711, -3.980287, 0, 0, 0, 1, 1,
-0.9322659, 0.3995224, -1.915846, 0, 0, 0, 1, 1,
-0.9298792, 1.617259, -0.3053074, 0, 0, 0, 1, 1,
-0.9297289, 1.928001, 0.9421849, 0, 0, 0, 1, 1,
-0.9295123, -1.814996, -2.478843, 0, 0, 0, 1, 1,
-0.9273782, 0.5269381, -0.05592882, 1, 1, 1, 1, 1,
-0.9234154, -0.6171689, -2.604339, 1, 1, 1, 1, 1,
-0.9190325, -0.6214915, -4.052777, 1, 1, 1, 1, 1,
-0.9160696, -0.5720571, -1.60823, 1, 1, 1, 1, 1,
-0.9157904, 1.578421, -1.055586, 1, 1, 1, 1, 1,
-0.9133756, 2.472949, 1.093305, 1, 1, 1, 1, 1,
-0.9065434, 1.052416, -4.151639, 1, 1, 1, 1, 1,
-0.9064242, 0.1496911, -0.7168325, 1, 1, 1, 1, 1,
-0.9060727, -0.3655875, -1.611238, 1, 1, 1, 1, 1,
-0.9036673, 0.7084135, 0.8895819, 1, 1, 1, 1, 1,
-0.8846082, 2.105738, 0.5561472, 1, 1, 1, 1, 1,
-0.8800405, 0.1540577, 0.1475898, 1, 1, 1, 1, 1,
-0.8778093, -0.2458013, -1.829045, 1, 1, 1, 1, 1,
-0.8739076, 0.4245827, -0.1637537, 1, 1, 1, 1, 1,
-0.8737442, -1.260611, -3.066098, 1, 1, 1, 1, 1,
-0.8736566, -0.6506442, -2.553962, 0, 0, 1, 1, 1,
-0.8710665, 0.1427165, -1.087919, 1, 0, 0, 1, 1,
-0.8596078, 0.3251932, -1.603336, 1, 0, 0, 1, 1,
-0.8575882, -0.9304053, -2.087904, 1, 0, 0, 1, 1,
-0.8574567, 0.6640049, -1.297098, 1, 0, 0, 1, 1,
-0.8508155, 0.4575129, -0.5299689, 1, 0, 0, 1, 1,
-0.8474883, 2.340689, -0.3345111, 0, 0, 0, 1, 1,
-0.8467385, -0.4026578, -2.884729, 0, 0, 0, 1, 1,
-0.8463417, -0.0415751, -1.799121, 0, 0, 0, 1, 1,
-0.8460308, 0.1207185, -2.416178, 0, 0, 0, 1, 1,
-0.8450298, -0.469089, -2.237197, 0, 0, 0, 1, 1,
-0.8432868, 1.290414, -0.7979915, 0, 0, 0, 1, 1,
-0.8417664, 1.385866, -1.664636, 0, 0, 0, 1, 1,
-0.8414387, -0.3906927, -2.949013, 1, 1, 1, 1, 1,
-0.8412857, 0.6424494, -0.2879527, 1, 1, 1, 1, 1,
-0.8322907, -0.5009439, -1.992243, 1, 1, 1, 1, 1,
-0.831228, 0.1858228, 2.315225, 1, 1, 1, 1, 1,
-0.8304735, 0.9176505, -2.361484, 1, 1, 1, 1, 1,
-0.827455, 1.795956, 0.2228772, 1, 1, 1, 1, 1,
-0.8198289, 0.02883874, -1.402029, 1, 1, 1, 1, 1,
-0.8172104, 0.1992187, -2.633471, 1, 1, 1, 1, 1,
-0.8092623, 0.5937807, 2.232885, 1, 1, 1, 1, 1,
-0.7993098, -0.6046447, -1.568169, 1, 1, 1, 1, 1,
-0.7975222, 0.3080542, -1.316245, 1, 1, 1, 1, 1,
-0.7975184, -0.2268006, -1.865064, 1, 1, 1, 1, 1,
-0.7961317, 0.4419596, -0.8986865, 1, 1, 1, 1, 1,
-0.7958465, -0.2582323, -0.1419623, 1, 1, 1, 1, 1,
-0.7849422, 1.290893, -1.414468, 1, 1, 1, 1, 1,
-0.7783458, 0.7142264, -0.1703751, 0, 0, 1, 1, 1,
-0.7780536, 0.8821706, -1.802558, 1, 0, 0, 1, 1,
-0.7734675, 0.1546384, -1.428147, 1, 0, 0, 1, 1,
-0.7636083, -1.469541, -2.240155, 1, 0, 0, 1, 1,
-0.7614224, 0.5571682, -1.337945, 1, 0, 0, 1, 1,
-0.7565017, -2.157063, -0.2987381, 1, 0, 0, 1, 1,
-0.7509488, -0.6706871, -3.755803, 0, 0, 0, 1, 1,
-0.749896, 0.4993859, 0.1343968, 0, 0, 0, 1, 1,
-0.748405, 1.50347, 1.191393, 0, 0, 0, 1, 1,
-0.7470562, 0.5184104, -1.916462, 0, 0, 0, 1, 1,
-0.7447877, 0.8538837, 0.4824484, 0, 0, 0, 1, 1,
-0.7445695, 0.5751787, -1.464652, 0, 0, 0, 1, 1,
-0.7435026, -0.9670651, -2.68338, 0, 0, 0, 1, 1,
-0.7389916, 0.711907, -1.559319, 1, 1, 1, 1, 1,
-0.7379904, -1.726772, -1.118772, 1, 1, 1, 1, 1,
-0.7323688, -0.5624405, -1.662465, 1, 1, 1, 1, 1,
-0.7319688, -1.743583, -2.248645, 1, 1, 1, 1, 1,
-0.7261664, 0.2444833, -1.301778, 1, 1, 1, 1, 1,
-0.7219806, 0.7007741, -1.744007, 1, 1, 1, 1, 1,
-0.7197488, -0.6241897, -3.063446, 1, 1, 1, 1, 1,
-0.7194704, -0.4163228, -2.271246, 1, 1, 1, 1, 1,
-0.7176412, 0.6509652, -0.8180922, 1, 1, 1, 1, 1,
-0.7158194, 0.4494383, -2.623641, 1, 1, 1, 1, 1,
-0.7120538, 0.6739854, 0.05813144, 1, 1, 1, 1, 1,
-0.7117688, 1.556958, 0.23354, 1, 1, 1, 1, 1,
-0.7015074, 0.06679501, -2.169138, 1, 1, 1, 1, 1,
-0.6944733, -0.459341, -0.8543358, 1, 1, 1, 1, 1,
-0.6874, 1.545215, -1.273396, 1, 1, 1, 1, 1,
-0.6852841, -0.08247688, -0.9927953, 0, 0, 1, 1, 1,
-0.6801654, 1.029221, -1.119668, 1, 0, 0, 1, 1,
-0.6795906, -1.259305, -1.816549, 1, 0, 0, 1, 1,
-0.6765506, -0.7209341, -1.891219, 1, 0, 0, 1, 1,
-0.6757926, -0.05974093, -1.664114, 1, 0, 0, 1, 1,
-0.672052, -0.4869426, -3.068884, 1, 0, 0, 1, 1,
-0.6706664, 0.4665195, 0.5174313, 0, 0, 0, 1, 1,
-0.6687645, 0.1440555, -0.4816762, 0, 0, 0, 1, 1,
-0.6682605, -0.1500068, -0.8154888, 0, 0, 0, 1, 1,
-0.6681111, -0.7581244, -1.478124, 0, 0, 0, 1, 1,
-0.6668153, 0.5032303, -1.221896, 0, 0, 0, 1, 1,
-0.6665024, 0.0477487, -1.888373, 0, 0, 0, 1, 1,
-0.6664649, -1.805358, -2.727809, 0, 0, 0, 1, 1,
-0.6625218, -0.6309244, -1.729277, 1, 1, 1, 1, 1,
-0.6608649, 0.334605, 0.26597, 1, 1, 1, 1, 1,
-0.6556842, -0.2990113, -3.191472, 1, 1, 1, 1, 1,
-0.6504846, 1.424718, -0.1420532, 1, 1, 1, 1, 1,
-0.6458549, 0.05301991, -1.755161, 1, 1, 1, 1, 1,
-0.6387601, -2.261623, -2.161642, 1, 1, 1, 1, 1,
-0.6354927, -0.5453328, -2.861251, 1, 1, 1, 1, 1,
-0.6340768, -1.39824, -3.453502, 1, 1, 1, 1, 1,
-0.6335659, 0.2085437, -1.635427, 1, 1, 1, 1, 1,
-0.6330141, 0.5993119, -0.9215395, 1, 1, 1, 1, 1,
-0.6313466, -2.463228, -0.7845263, 1, 1, 1, 1, 1,
-0.6279201, -0.6489594, -1.924644, 1, 1, 1, 1, 1,
-0.6270975, -0.8190399, -2.802592, 1, 1, 1, 1, 1,
-0.6255348, -1.129903, -4.495181, 1, 1, 1, 1, 1,
-0.6251963, -2.246496, -2.202586, 1, 1, 1, 1, 1,
-0.6250451, 0.05215967, -2.49685, 0, 0, 1, 1, 1,
-0.6244433, 1.897006, -0.4189608, 1, 0, 0, 1, 1,
-0.6177419, -1.042686, -0.6853353, 1, 0, 0, 1, 1,
-0.6162997, -0.9900627, -3.8576, 1, 0, 0, 1, 1,
-0.6158653, 1.521266, 0.06127618, 1, 0, 0, 1, 1,
-0.6131065, 0.08268423, -0.6910572, 1, 0, 0, 1, 1,
-0.5990595, -1.106444, -2.978292, 0, 0, 0, 1, 1,
-0.5959513, 0.4778908, -2.502359, 0, 0, 0, 1, 1,
-0.5920904, -0.04216506, -0.2450388, 0, 0, 0, 1, 1,
-0.5879644, 0.4833931, -1.733006, 0, 0, 0, 1, 1,
-0.5856091, -1.371658, -3.533689, 0, 0, 0, 1, 1,
-0.5758365, 0.08179246, -1.72149, 0, 0, 0, 1, 1,
-0.5735465, 2.274949, -1.487406, 0, 0, 0, 1, 1,
-0.5710358, 0.5919173, -0.408372, 1, 1, 1, 1, 1,
-0.5696618, 0.6860345, -0.4055967, 1, 1, 1, 1, 1,
-0.5550108, -0.1349751, -0.1456884, 1, 1, 1, 1, 1,
-0.550738, 0.05640692, -1.74293, 1, 1, 1, 1, 1,
-0.5485538, 1.393114, -1.68517, 1, 1, 1, 1, 1,
-0.547604, 1.650722, 0.2390238, 1, 1, 1, 1, 1,
-0.5444024, -1.251807, -3.298098, 1, 1, 1, 1, 1,
-0.54067, -1.227386, -2.461774, 1, 1, 1, 1, 1,
-0.5377945, -0.7340267, -2.719115, 1, 1, 1, 1, 1,
-0.5330586, -0.5328406, -3.512631, 1, 1, 1, 1, 1,
-0.532464, -1.243481, -3.354312, 1, 1, 1, 1, 1,
-0.5260206, -0.8532311, -2.801962, 1, 1, 1, 1, 1,
-0.525416, -1.302724, -1.124502, 1, 1, 1, 1, 1,
-0.5243329, 0.6975281, 0.7128925, 1, 1, 1, 1, 1,
-0.52256, 0.5861987, -0.9235491, 1, 1, 1, 1, 1,
-0.5137591, -0.7975925, -1.957528, 0, 0, 1, 1, 1,
-0.5135624, -0.8632811, -2.479891, 1, 0, 0, 1, 1,
-0.5111341, -0.5205758, -3.701611, 1, 0, 0, 1, 1,
-0.5102393, 2.318446, -0.1904058, 1, 0, 0, 1, 1,
-0.5038975, -0.6616363, -2.128055, 1, 0, 0, 1, 1,
-0.5008361, 0.1460979, 0.6365492, 1, 0, 0, 1, 1,
-0.4938694, 1.115187, -1.361074, 0, 0, 0, 1, 1,
-0.4900378, -0.09318947, -1.488796, 0, 0, 0, 1, 1,
-0.4881267, -1.814438, -1.817589, 0, 0, 0, 1, 1,
-0.4862701, 1.255365, -1.107055, 0, 0, 0, 1, 1,
-0.4853747, 1.989309, -1.551614, 0, 0, 0, 1, 1,
-0.4801466, -0.8175008, -3.263761, 0, 0, 0, 1, 1,
-0.4791941, -1.411216, -4.070364, 0, 0, 0, 1, 1,
-0.4788628, 0.4081828, -0.2082826, 1, 1, 1, 1, 1,
-0.4741977, 1.373714, 0.0992741, 1, 1, 1, 1, 1,
-0.4722746, -0.1464847, -2.089105, 1, 1, 1, 1, 1,
-0.4708009, -0.6602866, -2.320378, 1, 1, 1, 1, 1,
-0.468301, 0.7276379, -0.1536124, 1, 1, 1, 1, 1,
-0.4620356, -0.155339, -0.5739753, 1, 1, 1, 1, 1,
-0.4572023, 0.3238857, -1.202631, 1, 1, 1, 1, 1,
-0.4552856, 1.341334, -0.9081042, 1, 1, 1, 1, 1,
-0.4511499, -0.03025985, -2.074483, 1, 1, 1, 1, 1,
-0.451047, 0.1365083, -1.72226, 1, 1, 1, 1, 1,
-0.4502285, 0.0391085, -2.344507, 1, 1, 1, 1, 1,
-0.4484926, -1.64457, -1.95931, 1, 1, 1, 1, 1,
-0.447411, -0.4854823, -1.984971, 1, 1, 1, 1, 1,
-0.4447669, -0.9797708, -1.205741, 1, 1, 1, 1, 1,
-0.4447564, -0.9164929, -2.123689, 1, 1, 1, 1, 1,
-0.4388186, 0.1801682, -1.732253, 0, 0, 1, 1, 1,
-0.4331372, 0.3109856, -0.9057367, 1, 0, 0, 1, 1,
-0.4220703, 0.2551373, 0.03369705, 1, 0, 0, 1, 1,
-0.4216837, -1.191865, -3.013495, 1, 0, 0, 1, 1,
-0.4205186, 1.999368, 2.019299, 1, 0, 0, 1, 1,
-0.4171549, 0.2123836, 0.1108566, 1, 0, 0, 1, 1,
-0.4134878, 0.7912788, 1.217004, 0, 0, 0, 1, 1,
-0.4100688, 0.0876216, -3.231084, 0, 0, 0, 1, 1,
-0.4085515, 0.2192515, 0.3314463, 0, 0, 0, 1, 1,
-0.4073001, -0.5259883, -3.521475, 0, 0, 0, 1, 1,
-0.4001491, -0.9434144, -2.411389, 0, 0, 0, 1, 1,
-0.3966987, 1.209534, 0.4466665, 0, 0, 0, 1, 1,
-0.3962932, -0.03168416, -0.5353204, 0, 0, 0, 1, 1,
-0.3962477, -0.8687203, -3.176027, 1, 1, 1, 1, 1,
-0.3961832, -1.721459, -2.965012, 1, 1, 1, 1, 1,
-0.3947403, 1.850915, 0.6562331, 1, 1, 1, 1, 1,
-0.3911529, 0.435325, -0.7019562, 1, 1, 1, 1, 1,
-0.3890111, -0.25273, -1.333877, 1, 1, 1, 1, 1,
-0.3884678, 0.838631, 0.8260353, 1, 1, 1, 1, 1,
-0.3852968, -1.398016, -2.740055, 1, 1, 1, 1, 1,
-0.3822647, 0.5773155, -1.082571, 1, 1, 1, 1, 1,
-0.3762378, 0.3555319, -2.3654, 1, 1, 1, 1, 1,
-0.3756684, -0.005684542, -1.183462, 1, 1, 1, 1, 1,
-0.3745239, 0.119424, -1.564068, 1, 1, 1, 1, 1,
-0.3733339, -0.003681955, -3.318796, 1, 1, 1, 1, 1,
-0.3710454, 0.6901898, -0.3573916, 1, 1, 1, 1, 1,
-0.3623119, -0.1527433, -2.418245, 1, 1, 1, 1, 1,
-0.3580085, -0.6861133, -3.148656, 1, 1, 1, 1, 1,
-0.3564521, 0.7993441, 1.028742, 0, 0, 1, 1, 1,
-0.3536209, 0.5508761, 0.5697061, 1, 0, 0, 1, 1,
-0.3518248, -1.08579, -3.290174, 1, 0, 0, 1, 1,
-0.3501195, 1.138474, 1.302866, 1, 0, 0, 1, 1,
-0.3498906, -0.5352464, -1.985297, 1, 0, 0, 1, 1,
-0.3459123, -0.07548783, -0.772895, 1, 0, 0, 1, 1,
-0.3450699, -1.454147, -5.466445, 0, 0, 0, 1, 1,
-0.3442956, -0.213067, -0.7586073, 0, 0, 0, 1, 1,
-0.342411, -0.563518, -2.540046, 0, 0, 0, 1, 1,
-0.3421602, -0.8782071, -3.34502, 0, 0, 0, 1, 1,
-0.3414896, 1.215491, -1.132015, 0, 0, 0, 1, 1,
-0.3406685, -1.662991, -3.923183, 0, 0, 0, 1, 1,
-0.3390902, -0.5964642, -3.683831, 0, 0, 0, 1, 1,
-0.3353653, 2.013058, 0.25741, 1, 1, 1, 1, 1,
-0.3330956, 1.328728, -1.666114, 1, 1, 1, 1, 1,
-0.3330103, -0.269765, -3.548515, 1, 1, 1, 1, 1,
-0.3260399, -1.189502, -1.43291, 1, 1, 1, 1, 1,
-0.3254987, 0.7422431, -1.523527, 1, 1, 1, 1, 1,
-0.3208559, 2.931355, -0.171065, 1, 1, 1, 1, 1,
-0.3197742, 0.6538067, -0.9880905, 1, 1, 1, 1, 1,
-0.3193872, 0.4069491, -1.607695, 1, 1, 1, 1, 1,
-0.3190521, 0.05709093, -2.639946, 1, 1, 1, 1, 1,
-0.3083282, -0.6359981, -0.7818552, 1, 1, 1, 1, 1,
-0.3067224, -1.276551, -3.116568, 1, 1, 1, 1, 1,
-0.2970721, -0.9864388, -2.118405, 1, 1, 1, 1, 1,
-0.2920053, -0.190403, -2.198048, 1, 1, 1, 1, 1,
-0.2901334, -0.4497445, -2.302947, 1, 1, 1, 1, 1,
-0.2857308, -0.6156489, -3.391108, 1, 1, 1, 1, 1,
-0.2760023, -2.583462, -3.740844, 0, 0, 1, 1, 1,
-0.2752726, 0.5676449, 1.49109, 1, 0, 0, 1, 1,
-0.2714105, 0.5893433, -0.6743467, 1, 0, 0, 1, 1,
-0.2679907, 0.4456496, -0.1107154, 1, 0, 0, 1, 1,
-0.2669199, -0.4075289, -1.921952, 1, 0, 0, 1, 1,
-0.2628822, -1.114696, -1.904145, 1, 0, 0, 1, 1,
-0.2607779, -0.194997, -1.691482, 0, 0, 0, 1, 1,
-0.2581063, 0.2496987, 0.03233338, 0, 0, 0, 1, 1,
-0.2568344, 1.591113, 1.407711, 0, 0, 0, 1, 1,
-0.2536468, 0.810393, -0.2942561, 0, 0, 0, 1, 1,
-0.2503187, 0.7927063, -1.004826, 0, 0, 0, 1, 1,
-0.2498961, -1.382534, -0.9142175, 0, 0, 0, 1, 1,
-0.2493301, 0.5505336, -0.3153884, 0, 0, 0, 1, 1,
-0.2486821, -0.1640636, -1.38681, 1, 1, 1, 1, 1,
-0.241845, 0.6056823, 0.2478382, 1, 1, 1, 1, 1,
-0.2377349, -0.1465257, -2.117244, 1, 1, 1, 1, 1,
-0.2361274, 0.9473091, -0.4597279, 1, 1, 1, 1, 1,
-0.2341985, -0.5467663, -1.262256, 1, 1, 1, 1, 1,
-0.2317122, 0.4171858, -0.07063003, 1, 1, 1, 1, 1,
-0.2281745, 0.3630357, -0.3321581, 1, 1, 1, 1, 1,
-0.2269287, -1.212937, -4.787418, 1, 1, 1, 1, 1,
-0.2245779, -0.4795139, -4.724771, 1, 1, 1, 1, 1,
-0.2215115, 0.8256637, 0.9570919, 1, 1, 1, 1, 1,
-0.2208039, -1.397793, -3.493979, 1, 1, 1, 1, 1,
-0.2198659, 0.4496105, -1.012462, 1, 1, 1, 1, 1,
-0.2191905, -0.1160863, -1.653967, 1, 1, 1, 1, 1,
-0.2177065, -0.05033122, -1.649482, 1, 1, 1, 1, 1,
-0.2175754, -1.079385, -1.01383, 1, 1, 1, 1, 1,
-0.2170006, 0.9406447, 0.2423761, 0, 0, 1, 1, 1,
-0.2169823, -1.029698, -3.032833, 1, 0, 0, 1, 1,
-0.2100264, -0.1685453, -1.357474, 1, 0, 0, 1, 1,
-0.205791, 0.9818431, -0.9411984, 1, 0, 0, 1, 1,
-0.2021102, -0.3037261, -1.1662, 1, 0, 0, 1, 1,
-0.1978395, 0.743751, 1.185517, 1, 0, 0, 1, 1,
-0.1966689, -0.3318212, -2.422168, 0, 0, 0, 1, 1,
-0.1951943, -0.05530773, -3.168975, 0, 0, 0, 1, 1,
-0.1881901, 1.932316, -0.6478351, 0, 0, 0, 1, 1,
-0.1836782, -0.4638257, -2.725999, 0, 0, 0, 1, 1,
-0.1791795, 0.5296506, -0.5542707, 0, 0, 0, 1, 1,
-0.1773689, 0.3031571, -1.906392, 0, 0, 0, 1, 1,
-0.1682533, -0.632587, -1.028241, 0, 0, 0, 1, 1,
-0.1638436, 1.918881, 1.05311, 1, 1, 1, 1, 1,
-0.1601073, 0.2281345, 1.150253, 1, 1, 1, 1, 1,
-0.1565988, -1.097469, -5.461911, 1, 1, 1, 1, 1,
-0.1547317, -0.8487313, -1.866917, 1, 1, 1, 1, 1,
-0.1539236, 0.2812359, 0.4210961, 1, 1, 1, 1, 1,
-0.1532392, -0.126153, -1.907465, 1, 1, 1, 1, 1,
-0.1492755, 1.20133, -0.5937664, 1, 1, 1, 1, 1,
-0.1425517, -1.255861, -2.135133, 1, 1, 1, 1, 1,
-0.1366303, 0.3378964, -0.202339, 1, 1, 1, 1, 1,
-0.1356488, 0.3411828, -0.1379263, 1, 1, 1, 1, 1,
-0.1355867, -0.06804047, -3.916247, 1, 1, 1, 1, 1,
-0.133209, 1.428196, -0.06688771, 1, 1, 1, 1, 1,
-0.1281114, -1.68577, -1.84517, 1, 1, 1, 1, 1,
-0.1276905, 0.6740605, -0.6804059, 1, 1, 1, 1, 1,
-0.1274399, -0.08896486, -0.2867363, 1, 1, 1, 1, 1,
-0.125823, 0.551919, -2.726514, 0, 0, 1, 1, 1,
-0.1251268, -0.1763337, -2.074295, 1, 0, 0, 1, 1,
-0.1247875, -0.2410908, -1.454088, 1, 0, 0, 1, 1,
-0.1243799, -0.368783, -2.658582, 1, 0, 0, 1, 1,
-0.1045912, -0.3893083, -3.206708, 1, 0, 0, 1, 1,
-0.09691801, 0.2195475, -0.7479107, 1, 0, 0, 1, 1,
-0.09669117, 0.09197761, -1.924565, 0, 0, 0, 1, 1,
-0.09625897, 0.277308, 1.219416, 0, 0, 0, 1, 1,
-0.09536359, 0.3214197, -0.8001339, 0, 0, 0, 1, 1,
-0.09523148, -0.09694564, -2.634068, 0, 0, 0, 1, 1,
-0.08881611, 1.086432, 2.470861, 0, 0, 0, 1, 1,
-0.08801284, 0.9937367, -2.172827, 0, 0, 0, 1, 1,
-0.08799452, 2.363101, 1.515331, 0, 0, 0, 1, 1,
-0.08783572, -1.530845, -2.275328, 1, 1, 1, 1, 1,
-0.08713213, 1.284816, -0.7639903, 1, 1, 1, 1, 1,
-0.08583067, 0.1853804, -1.636848, 1, 1, 1, 1, 1,
-0.08220049, -0.8387644, -3.997032, 1, 1, 1, 1, 1,
-0.08194352, -0.309549, -3.428077, 1, 1, 1, 1, 1,
-0.07484275, -0.6968287, -1.079305, 1, 1, 1, 1, 1,
-0.07127413, 2.481049, -2.074352, 1, 1, 1, 1, 1,
-0.06643596, 0.2009206, 0.4125077, 1, 1, 1, 1, 1,
-0.06584551, 1.594058, 1.394278, 1, 1, 1, 1, 1,
-0.06136742, -0.3519698, -2.266212, 1, 1, 1, 1, 1,
-0.05995322, 0.4873948, -1.041991, 1, 1, 1, 1, 1,
-0.05443383, -0.6096094, -3.014107, 1, 1, 1, 1, 1,
-0.05247822, -0.5148064, -3.679017, 1, 1, 1, 1, 1,
-0.0510034, 0.6168751, -1.611524, 1, 1, 1, 1, 1,
-0.04715629, 1.231874, 1.606488, 1, 1, 1, 1, 1,
-0.04690133, 1.990259, -0.06168374, 0, 0, 1, 1, 1,
-0.04252313, -0.7551529, -2.927281, 1, 0, 0, 1, 1,
-0.04246411, -2.549891, -2.195191, 1, 0, 0, 1, 1,
-0.04172485, -1.883641, -4.673829, 1, 0, 0, 1, 1,
-0.04080961, 1.01342, -0.2882107, 1, 0, 0, 1, 1,
-0.03968106, 3.013025, -0.7298459, 1, 0, 0, 1, 1,
-0.03953495, -1.081466, -2.100353, 0, 0, 0, 1, 1,
-0.03666109, -0.04812112, -2.399314, 0, 0, 0, 1, 1,
-0.03385359, -0.5297714, -1.559506, 0, 0, 0, 1, 1,
-0.03197113, -0.1120707, -4.365873, 0, 0, 0, 1, 1,
-0.03008022, 0.06539821, 1.148334, 0, 0, 0, 1, 1,
-0.02939047, -0.5776619, -1.854003, 0, 0, 0, 1, 1,
-0.02726614, 0.2306569, 0.4145918, 0, 0, 0, 1, 1,
-0.02170959, -0.6679237, -3.553467, 1, 1, 1, 1, 1,
-0.02029041, 0.1267025, -2.325546, 1, 1, 1, 1, 1,
-0.01965668, 0.5925102, -0.4692404, 1, 1, 1, 1, 1,
-0.01116387, 0.2586857, -2.208946, 1, 1, 1, 1, 1,
-0.01017217, -2.517586, -3.714369, 1, 1, 1, 1, 1,
-0.008427077, -1.310461, -1.724998, 1, 1, 1, 1, 1,
-0.008364554, 0.1614472, 1.475593, 1, 1, 1, 1, 1,
-0.00810224, -2.13382, -2.635317, 1, 1, 1, 1, 1,
-0.004852313, -0.1053916, -3.211301, 1, 1, 1, 1, 1,
0.0006119154, -0.6260067, 2.767513, 1, 1, 1, 1, 1,
0.003363558, -0.2249044, 3.817697, 1, 1, 1, 1, 1,
0.00375191, -0.5590687, 1.174295, 1, 1, 1, 1, 1,
0.005725359, 1.651362, 1.368125, 1, 1, 1, 1, 1,
0.007747114, -0.5803489, 4.077843, 1, 1, 1, 1, 1,
0.007853607, 0.03274492, -0.5910378, 1, 1, 1, 1, 1,
0.008707386, 0.6420712, 0.842915, 0, 0, 1, 1, 1,
0.00996369, 0.3187215, -0.7381333, 1, 0, 0, 1, 1,
0.01056817, 0.5794567, 1.638564, 1, 0, 0, 1, 1,
0.01510027, -1.162762, 2.56706, 1, 0, 0, 1, 1,
0.01562751, -1.022277, 3.653804, 1, 0, 0, 1, 1,
0.02633179, 1.488172, -0.2987737, 1, 0, 0, 1, 1,
0.03103653, 0.8111141, 0.5082257, 0, 0, 0, 1, 1,
0.03140215, 1.908495, -0.6681603, 0, 0, 0, 1, 1,
0.03716566, 0.0552232, 0.6022232, 0, 0, 0, 1, 1,
0.03880307, -1.232523, 4.043911, 0, 0, 0, 1, 1,
0.04027737, -0.7899011, 5.213336, 0, 0, 0, 1, 1,
0.04058779, 0.0954411, -0.1717249, 0, 0, 0, 1, 1,
0.04149571, -1.376152, 3.607183, 0, 0, 0, 1, 1,
0.04637428, 0.6762787, 0.3014796, 1, 1, 1, 1, 1,
0.05084557, 0.1835157, -0.412508, 1, 1, 1, 1, 1,
0.05302546, -0.5375496, 3.77086, 1, 1, 1, 1, 1,
0.05524459, 0.8244652, 0.07511162, 1, 1, 1, 1, 1,
0.05652174, 0.641008, 1.829519, 1, 1, 1, 1, 1,
0.05709063, 0.5246471, 0.1903836, 1, 1, 1, 1, 1,
0.05774403, -0.8164092, 3.528758, 1, 1, 1, 1, 1,
0.0579877, -0.2666183, 0.1854084, 1, 1, 1, 1, 1,
0.06119881, 0.01356439, 1.23501, 1, 1, 1, 1, 1,
0.06607252, 2.190348, 0.6768005, 1, 1, 1, 1, 1,
0.07287584, -0.3919526, 2.224229, 1, 1, 1, 1, 1,
0.07970461, -0.3431326, 3.479857, 1, 1, 1, 1, 1,
0.08617782, -0.7478321, 1.878686, 1, 1, 1, 1, 1,
0.08722039, -0.4604162, 1.145193, 1, 1, 1, 1, 1,
0.08764987, -0.05112369, 2.005874, 1, 1, 1, 1, 1,
0.09211253, -0.02881935, 2.082378, 0, 0, 1, 1, 1,
0.09349346, 0.1401863, -0.7459604, 1, 0, 0, 1, 1,
0.09530992, -0.4347208, 2.898242, 1, 0, 0, 1, 1,
0.09809867, 1.759146, 0.1985539, 1, 0, 0, 1, 1,
0.09924617, -0.4805923, 3.469063, 1, 0, 0, 1, 1,
0.09937668, 1.653444, -0.1210493, 1, 0, 0, 1, 1,
0.1065041, 0.7862063, -0.6287372, 0, 0, 0, 1, 1,
0.108484, 0.4604916, 1.373327, 0, 0, 0, 1, 1,
0.1118672, -1.233533, 2.220112, 0, 0, 0, 1, 1,
0.1172751, 0.1536336, -0.8894825, 0, 0, 0, 1, 1,
0.1231104, 0.01677458, 2.550154, 0, 0, 0, 1, 1,
0.1283692, 1.230763, -0.2908516, 0, 0, 0, 1, 1,
0.1292791, 1.150248, 0.5766981, 0, 0, 0, 1, 1,
0.130367, -0.6240517, 2.863016, 1, 1, 1, 1, 1,
0.1318226, 0.3175088, 0.09532312, 1, 1, 1, 1, 1,
0.1330699, 1.58613, -1.176086, 1, 1, 1, 1, 1,
0.1353626, -0.1062241, 3.078839, 1, 1, 1, 1, 1,
0.1376438, 1.037671, 0.5100006, 1, 1, 1, 1, 1,
0.1402849, -0.2456448, 1.75532, 1, 1, 1, 1, 1,
0.1436962, -0.5367333, 2.319679, 1, 1, 1, 1, 1,
0.1444874, -1.681477, 3.929069, 1, 1, 1, 1, 1,
0.1495766, -0.5995432, 2.466913, 1, 1, 1, 1, 1,
0.1508512, -0.6134871, 1.947562, 1, 1, 1, 1, 1,
0.152926, 2.700747, -1.496473, 1, 1, 1, 1, 1,
0.1579248, -0.09706604, 1.600956, 1, 1, 1, 1, 1,
0.1584455, 0.3599854, 0.5591409, 1, 1, 1, 1, 1,
0.1608493, 0.7910591, 0.419223, 1, 1, 1, 1, 1,
0.1611396, -0.2238087, 3.753064, 1, 1, 1, 1, 1,
0.1663643, -1.658835, 3.594477, 0, 0, 1, 1, 1,
0.169902, -0.03541054, 1.325875, 1, 0, 0, 1, 1,
0.1704895, -1.044121, 2.36701, 1, 0, 0, 1, 1,
0.1740567, -1.044964, 3.532355, 1, 0, 0, 1, 1,
0.1762303, -0.4202561, 2.679256, 1, 0, 0, 1, 1,
0.1788191, -0.3398383, 2.883696, 1, 0, 0, 1, 1,
0.1796722, 0.1819103, 2.226686, 0, 0, 0, 1, 1,
0.1849618, 2.149764, -0.5056056, 0, 0, 0, 1, 1,
0.191785, -1.174418, 2.221144, 0, 0, 0, 1, 1,
0.1932795, -2.659157, 1.583594, 0, 0, 0, 1, 1,
0.193518, -0.8944916, 2.865694, 0, 0, 0, 1, 1,
0.1937622, -0.128431, 1.066354, 0, 0, 0, 1, 1,
0.1944779, -0.1771739, 2.57742, 0, 0, 0, 1, 1,
0.1945948, 0.115899, -0.3910299, 1, 1, 1, 1, 1,
0.199345, 0.1462444, 1.090919, 1, 1, 1, 1, 1,
0.1993548, 1.835725, -2.102671, 1, 1, 1, 1, 1,
0.2004013, -1.494613, 4.081773, 1, 1, 1, 1, 1,
0.2069351, -0.6217479, 2.079773, 1, 1, 1, 1, 1,
0.2079867, 0.7122344, 0.7735246, 1, 1, 1, 1, 1,
0.209124, 1.595668, 0.3478124, 1, 1, 1, 1, 1,
0.2099703, -1.087136, 4.391665, 1, 1, 1, 1, 1,
0.2114644, -1.305824, 3.01088, 1, 1, 1, 1, 1,
0.2114908, 0.3653632, 0.1165718, 1, 1, 1, 1, 1,
0.2204068, -0.3863556, 3.213461, 1, 1, 1, 1, 1,
0.2232528, 0.4482009, 0.4635957, 1, 1, 1, 1, 1,
0.2270398, -0.2642272, 1.612493, 1, 1, 1, 1, 1,
0.236363, 0.9607283, -0.5081229, 1, 1, 1, 1, 1,
0.2392368, 1.763576, -1.116289, 1, 1, 1, 1, 1,
0.2396798, 1.165357, -0.1658303, 0, 0, 1, 1, 1,
0.2407035, 0.5347918, 0.0844595, 1, 0, 0, 1, 1,
0.2482596, 1.486417, 0.797879, 1, 0, 0, 1, 1,
0.2537953, -0.5403158, 1.439361, 1, 0, 0, 1, 1,
0.2559192, 1.696956, 1.640918, 1, 0, 0, 1, 1,
0.2563684, -1.339715, 3.661351, 1, 0, 0, 1, 1,
0.258662, 0.9854599, -0.556375, 0, 0, 0, 1, 1,
0.2602929, -0.6649953, 2.306542, 0, 0, 0, 1, 1,
0.2610902, -0.0981964, 2.292295, 0, 0, 0, 1, 1,
0.2623761, -0.2101302, 1.191306, 0, 0, 0, 1, 1,
0.264397, 2.046217, 0.1688219, 0, 0, 0, 1, 1,
0.2673115, -0.7028834, 1.962832, 0, 0, 0, 1, 1,
0.2687213, -0.4638254, 2.858678, 0, 0, 0, 1, 1,
0.2720402, -0.7001991, 1.909721, 1, 1, 1, 1, 1,
0.2726519, -0.5024258, 3.414245, 1, 1, 1, 1, 1,
0.2753077, -0.6504192, 2.852526, 1, 1, 1, 1, 1,
0.2775777, -0.4253433, 1.714145, 1, 1, 1, 1, 1,
0.2779744, -0.3859474, 1.939392, 1, 1, 1, 1, 1,
0.2783341, -0.9886845, 3.233424, 1, 1, 1, 1, 1,
0.2793868, -1.439832, 3.478343, 1, 1, 1, 1, 1,
0.2803752, 0.820646, 0.3632464, 1, 1, 1, 1, 1,
0.2827301, 1.031674, 1.283817, 1, 1, 1, 1, 1,
0.2852115, 0.8943595, 0.7692455, 1, 1, 1, 1, 1,
0.2860621, 1.472264, 1.176232, 1, 1, 1, 1, 1,
0.2860998, -0.2678018, 1.444856, 1, 1, 1, 1, 1,
0.2872602, -1.34531, 1.985051, 1, 1, 1, 1, 1,
0.288484, 1.733283, -1.757233, 1, 1, 1, 1, 1,
0.2945338, -0.05732877, 1.295437, 1, 1, 1, 1, 1,
0.2964565, -0.3729955, 2.388019, 0, 0, 1, 1, 1,
0.2997393, 0.1071026, 0.9602407, 1, 0, 0, 1, 1,
0.3000152, -0.5710263, 2.283143, 1, 0, 0, 1, 1,
0.3041261, -0.4591149, 1.528071, 1, 0, 0, 1, 1,
0.3043596, 0.01069082, 0.5058966, 1, 0, 0, 1, 1,
0.3091363, -0.6165527, 3.801455, 1, 0, 0, 1, 1,
0.310248, 0.03938902, 0.8328965, 0, 0, 0, 1, 1,
0.3142033, 1.383087, -0.3933232, 0, 0, 0, 1, 1,
0.3194161, -0.2583454, 1.279838, 0, 0, 0, 1, 1,
0.319887, 1.646679, -0.7796151, 0, 0, 0, 1, 1,
0.3199898, 0.8587762, 0.4464811, 0, 0, 0, 1, 1,
0.3224918, 1.299023, 0.8827993, 0, 0, 0, 1, 1,
0.3227361, -0.001970423, 1.864455, 0, 0, 0, 1, 1,
0.3249812, 1.544158, -0.9393393, 1, 1, 1, 1, 1,
0.3273828, -0.629002, 1.435533, 1, 1, 1, 1, 1,
0.3279762, -1.096426, 2.980365, 1, 1, 1, 1, 1,
0.3282739, 0.07723042, 2.883773, 1, 1, 1, 1, 1,
0.3320719, 0.7562272, -0.3107398, 1, 1, 1, 1, 1,
0.3332143, -0.431585, 0.1105309, 1, 1, 1, 1, 1,
0.3343054, -1.500628, 2.56892, 1, 1, 1, 1, 1,
0.3382437, 0.39291, 0.8106931, 1, 1, 1, 1, 1,
0.341627, 0.1616443, 2.486956, 1, 1, 1, 1, 1,
0.3426456, -2.481661, 2.681356, 1, 1, 1, 1, 1,
0.3447608, 0.1806261, 0.433571, 1, 1, 1, 1, 1,
0.3554157, 0.5314375, 0.7179767, 1, 1, 1, 1, 1,
0.3640745, 1.62586, 0.3225517, 1, 1, 1, 1, 1,
0.3661744, -0.571178, 4.421028, 1, 1, 1, 1, 1,
0.3667178, 0.1797373, 0.7822877, 1, 1, 1, 1, 1,
0.3669381, -0.6831547, 1.767445, 0, 0, 1, 1, 1,
0.3714061, 0.8912381, 0.9080033, 1, 0, 0, 1, 1,
0.372546, -1.757735, 3.982989, 1, 0, 0, 1, 1,
0.374632, 0.9872098, -0.6700768, 1, 0, 0, 1, 1,
0.3783773, 0.5930836, 1.152333, 1, 0, 0, 1, 1,
0.3784478, 0.2377347, 1.962658, 1, 0, 0, 1, 1,
0.3837481, -1.390617, 2.94323, 0, 0, 0, 1, 1,
0.3852972, 1.140446, 0.3837332, 0, 0, 0, 1, 1,
0.3858967, 0.731264, 0.6797141, 0, 0, 0, 1, 1,
0.3859501, -1.23343, 2.045572, 0, 0, 0, 1, 1,
0.3875072, -0.0970152, 3.372842, 0, 0, 0, 1, 1,
0.3909687, -1.482965, 3.934626, 0, 0, 0, 1, 1,
0.3917916, -0.9564582, 1.677571, 0, 0, 0, 1, 1,
0.3940566, 0.7027054, 0.7941573, 1, 1, 1, 1, 1,
0.3952552, 0.1204837, 1.223028, 1, 1, 1, 1, 1,
0.3958076, 0.02582037, 1.77505, 1, 1, 1, 1, 1,
0.3961392, 0.9175465, 0.1299215, 1, 1, 1, 1, 1,
0.3985531, -1.624297, 1.870524, 1, 1, 1, 1, 1,
0.4037479, -0.1509845, 3.050081, 1, 1, 1, 1, 1,
0.406172, 0.2927621, -1.696974, 1, 1, 1, 1, 1,
0.4103746, -0.9567643, 2.938529, 1, 1, 1, 1, 1,
0.4117254, 0.9524761, -0.4466827, 1, 1, 1, 1, 1,
0.4129745, -0.8692145, 3.849045, 1, 1, 1, 1, 1,
0.4165004, 0.1331114, 1.494195, 1, 1, 1, 1, 1,
0.4187195, -0.4591926, 2.485781, 1, 1, 1, 1, 1,
0.4220523, -1.029719, 0.971146, 1, 1, 1, 1, 1,
0.4224728, -2.043515, 3.042554, 1, 1, 1, 1, 1,
0.4234723, 1.594446, 1.626605, 1, 1, 1, 1, 1,
0.4267237, -0.4122299, 2.227685, 0, 0, 1, 1, 1,
0.4289772, -0.19883, 1.517919, 1, 0, 0, 1, 1,
0.4318519, 1.761472, -0.5457947, 1, 0, 0, 1, 1,
0.4383679, -0.2006723, 2.718636, 1, 0, 0, 1, 1,
0.4443087, -1.422621, 1.958384, 1, 0, 0, 1, 1,
0.4449501, 0.6007656, 1.186888, 1, 0, 0, 1, 1,
0.4473827, 1.63176, 1.265542, 0, 0, 0, 1, 1,
0.4502284, -0.7113319, 2.920125, 0, 0, 0, 1, 1,
0.4562856, -1.008778, 4.706606, 0, 0, 0, 1, 1,
0.4586089, 0.2740852, 1.409488, 0, 0, 0, 1, 1,
0.462494, 1.511825, -1.652652, 0, 0, 0, 1, 1,
0.4660309, -0.09450292, 0.8734106, 0, 0, 0, 1, 1,
0.4661281, 0.3595782, 1.711601, 0, 0, 0, 1, 1,
0.467679, -1.372705, 1.977493, 1, 1, 1, 1, 1,
0.4710978, -0.59163, 2.900871, 1, 1, 1, 1, 1,
0.476753, 0.7875577, 0.03654307, 1, 1, 1, 1, 1,
0.4769366, 0.8624313, 0.6296428, 1, 1, 1, 1, 1,
0.4808394, -0.8151411, 3.630526, 1, 1, 1, 1, 1,
0.4812377, -0.5192333, 1.265591, 1, 1, 1, 1, 1,
0.4824433, 1.280152, 1.341042, 1, 1, 1, 1, 1,
0.4877881, 2.249041, 0.5847395, 1, 1, 1, 1, 1,
0.4979439, -0.9788193, 2.683267, 1, 1, 1, 1, 1,
0.4991005, 0.7586653, 1.311963, 1, 1, 1, 1, 1,
0.5036821, -1.932088, 4.188493, 1, 1, 1, 1, 1,
0.5083443, -0.6674656, 2.470469, 1, 1, 1, 1, 1,
0.508593, -0.4315548, 2.168555, 1, 1, 1, 1, 1,
0.5151063, -0.2354273, 0.4189743, 1, 1, 1, 1, 1,
0.5163962, -1.080613, 1.888961, 1, 1, 1, 1, 1,
0.5202674, -0.9240612, 1.671056, 0, 0, 1, 1, 1,
0.5218778, -0.1479256, 2.38299, 1, 0, 0, 1, 1,
0.5247274, 1.053636, 0.4014544, 1, 0, 0, 1, 1,
0.5261983, 0.03349898, 3.438117, 1, 0, 0, 1, 1,
0.5266837, -0.2470239, 0.9686033, 1, 0, 0, 1, 1,
0.5295508, -0.8614095, 2.32517, 1, 0, 0, 1, 1,
0.5351954, 1.485821, -0.1825764, 0, 0, 0, 1, 1,
0.5391189, -0.4256856, 3.686438, 0, 0, 0, 1, 1,
0.5425863, -1.308121, 2.599518, 0, 0, 0, 1, 1,
0.5430087, -0.2437748, 2.336612, 0, 0, 0, 1, 1,
0.5440947, 1.30686, 0.5616354, 0, 0, 0, 1, 1,
0.5465385, -0.3707641, 2.554768, 0, 0, 0, 1, 1,
0.5470921, -0.3753939, 3.514869, 0, 0, 0, 1, 1,
0.5535445, -1.780829, 2.943061, 1, 1, 1, 1, 1,
0.5550804, 0.3049246, 2.817909, 1, 1, 1, 1, 1,
0.5667216, -0.6487203, 2.130084, 1, 1, 1, 1, 1,
0.5703204, 0.4994033, -1.040585, 1, 1, 1, 1, 1,
0.5748706, 0.5773939, 1.018737, 1, 1, 1, 1, 1,
0.5783752, -0.6748067, 2.174269, 1, 1, 1, 1, 1,
0.5796651, 0.01530558, 1.412744, 1, 1, 1, 1, 1,
0.5842952, -1.315518, 2.413473, 1, 1, 1, 1, 1,
0.5866552, -0.7000026, 3.872446, 1, 1, 1, 1, 1,
0.5893742, -0.9660603, 2.977708, 1, 1, 1, 1, 1,
0.5898082, 1.377324, 2.073574, 1, 1, 1, 1, 1,
0.6170395, -0.6426481, 2.309701, 1, 1, 1, 1, 1,
0.6190854, 2.138037, 1.087056, 1, 1, 1, 1, 1,
0.6263876, 0.7394754, 2.393651, 1, 1, 1, 1, 1,
0.6364836, -0.7947312, 3.660475, 1, 1, 1, 1, 1,
0.6426873, 0.2174044, -0.1787785, 0, 0, 1, 1, 1,
0.6429349, -0.3494211, 1.613412, 1, 0, 0, 1, 1,
0.6434266, -1.197005, 3.642697, 1, 0, 0, 1, 1,
0.6434339, 0.2175024, 1.489414, 1, 0, 0, 1, 1,
0.6453564, 0.8020405, -0.3750888, 1, 0, 0, 1, 1,
0.6454304, 0.7694794, -0.8954421, 1, 0, 0, 1, 1,
0.646879, -0.798048, 2.698264, 0, 0, 0, 1, 1,
0.6496765, 3.409034, 1.427221, 0, 0, 0, 1, 1,
0.6505938, 1.056498, -0.9866491, 0, 0, 0, 1, 1,
0.6510948, 0.5038332, 0.7265965, 0, 0, 0, 1, 1,
0.6526222, 0.276712, 0.8344693, 0, 0, 0, 1, 1,
0.6583238, 2.633769, 1.23116, 0, 0, 0, 1, 1,
0.665719, -0.8885107, 2.988602, 0, 0, 0, 1, 1,
0.6665282, -0.267989, 3.735628, 1, 1, 1, 1, 1,
0.6684436, 0.2720726, 0.8002445, 1, 1, 1, 1, 1,
0.6713671, 0.4687587, 2.343106, 1, 1, 1, 1, 1,
0.6756198, -0.4742507, 1.959054, 1, 1, 1, 1, 1,
0.6772987, -0.845988, 2.624723, 1, 1, 1, 1, 1,
0.680083, 0.3347252, -0.5693995, 1, 1, 1, 1, 1,
0.69067, 1.882526, -1.075246, 1, 1, 1, 1, 1,
0.6914486, 0.6593703, 0.4316936, 1, 1, 1, 1, 1,
0.6927573, -1.061756, 3.430649, 1, 1, 1, 1, 1,
0.6931649, 1.640588, 0.7721025, 1, 1, 1, 1, 1,
0.6943257, -1.396426, 3.278795, 1, 1, 1, 1, 1,
0.6955272, 1.044753, -0.3629441, 1, 1, 1, 1, 1,
0.6971182, 0.1475478, 0.4182193, 1, 1, 1, 1, 1,
0.7137133, -1.380248, 0.9254486, 1, 1, 1, 1, 1,
0.7153352, 0.5181482, 0.5309673, 1, 1, 1, 1, 1,
0.7241117, 1.280727, 0.6289134, 0, 0, 1, 1, 1,
0.7293559, 2.388586, 0.390317, 1, 0, 0, 1, 1,
0.7294167, 0.2836792, 1.977221, 1, 0, 0, 1, 1,
0.7308291, 1.955157, 1.16173, 1, 0, 0, 1, 1,
0.7328151, -0.04334192, 1.311311, 1, 0, 0, 1, 1,
0.7419453, 0.7669544, 1.980507, 1, 0, 0, 1, 1,
0.7445329, 0.1215023, 1.807524, 0, 0, 0, 1, 1,
0.7460627, 0.1181307, 1.181956, 0, 0, 0, 1, 1,
0.7485492, 0.5177689, 1.833954, 0, 0, 0, 1, 1,
0.7569463, 0.9168903, 2.597684, 0, 0, 0, 1, 1,
0.7646852, 0.9777218, 0.7441546, 0, 0, 0, 1, 1,
0.7663687, 1.301045, 0.5941382, 0, 0, 0, 1, 1,
0.7667965, -0.39223, 2.158933, 0, 0, 0, 1, 1,
0.7829455, 1.413754, 0.6853886, 1, 1, 1, 1, 1,
0.7836411, -0.524561, 4.462823, 1, 1, 1, 1, 1,
0.7848008, 0.8086851, 2.438194, 1, 1, 1, 1, 1,
0.7881624, 0.4587226, 0.971866, 1, 1, 1, 1, 1,
0.7929138, -0.9108806, 1.987659, 1, 1, 1, 1, 1,
0.7932378, 0.4279505, 0.01690739, 1, 1, 1, 1, 1,
0.7956821, 1.431932, 1.175544, 1, 1, 1, 1, 1,
0.7970903, -1.531012, 2.894113, 1, 1, 1, 1, 1,
0.8027398, -0.2633334, 0.548564, 1, 1, 1, 1, 1,
0.804789, -1.835276, 2.591831, 1, 1, 1, 1, 1,
0.8058041, 0.6155661, 0.4175049, 1, 1, 1, 1, 1,
0.8093607, -1.251379, 1.337882, 1, 1, 1, 1, 1,
0.80949, 0.3629642, -0.2861615, 1, 1, 1, 1, 1,
0.817255, 1.287826, 1.718643, 1, 1, 1, 1, 1,
0.8225165, 0.5358142, -0.4944365, 1, 1, 1, 1, 1,
0.8258622, -1.174765, 2.274778, 0, 0, 1, 1, 1,
0.8300397, 1.182241, 0.8347257, 1, 0, 0, 1, 1,
0.8304289, -0.6720489, 3.561559, 1, 0, 0, 1, 1,
0.8311986, -0.9582734, 4.342174, 1, 0, 0, 1, 1,
0.8363642, 0.04459056, 0.5262325, 1, 0, 0, 1, 1,
0.8390933, 0.7652357, 0.1375177, 1, 0, 0, 1, 1,
0.8471773, -0.5265328, 2.712248, 0, 0, 0, 1, 1,
0.8510783, 0.05724112, 0.6190904, 0, 0, 0, 1, 1,
0.8537502, 0.3347378, 0.4467903, 0, 0, 0, 1, 1,
0.854471, -0.2220895, 2.460406, 0, 0, 0, 1, 1,
0.8545523, 0.9991848, 0.8111086, 0, 0, 0, 1, 1,
0.8643224, 0.473605, 0.3010062, 0, 0, 0, 1, 1,
0.8685265, -0.2836345, 1.661268, 0, 0, 0, 1, 1,
0.8886265, -1.255476, 2.684171, 1, 1, 1, 1, 1,
0.889418, -1.478328, 4.286037, 1, 1, 1, 1, 1,
0.8936015, -2.0553, 2.125413, 1, 1, 1, 1, 1,
0.894338, 0.3450976, 2.558496, 1, 1, 1, 1, 1,
0.8980939, -1.390926, 1.403063, 1, 1, 1, 1, 1,
0.9015581, -2.154115, 1.005585, 1, 1, 1, 1, 1,
0.9017487, 0.8595266, -0.9130738, 1, 1, 1, 1, 1,
0.9029378, -0.6983426, 1.652509, 1, 1, 1, 1, 1,
0.9067879, -0.1985671, 0.6919495, 1, 1, 1, 1, 1,
0.9078538, -1.080477, 3.204923, 1, 1, 1, 1, 1,
0.908174, -1.069274, 2.180899, 1, 1, 1, 1, 1,
0.9091988, -1.391057, 2.049671, 1, 1, 1, 1, 1,
0.9168554, -1.279885, 2.859831, 1, 1, 1, 1, 1,
0.9192818, -0.2486743, 1.435101, 1, 1, 1, 1, 1,
0.9211851, -0.7548847, 1.436125, 1, 1, 1, 1, 1,
0.9214975, -0.2779539, 0.369917, 0, 0, 1, 1, 1,
0.9238336, 0.02003214, 2.354689, 1, 0, 0, 1, 1,
0.9273743, -0.4320931, 1.18836, 1, 0, 0, 1, 1,
0.9303591, 0.712226, 0.1114494, 1, 0, 0, 1, 1,
0.9320261, 0.5693091, 3.12541, 1, 0, 0, 1, 1,
0.9336748, 1.583468, -0.124057, 1, 0, 0, 1, 1,
0.9355325, 1.296702, 1.172769, 0, 0, 0, 1, 1,
0.9404458, 0.9041091, -0.4203518, 0, 0, 0, 1, 1,
0.9460452, 0.6189062, 1.321234, 0, 0, 0, 1, 1,
0.9479975, 0.5142428, 1.401789, 0, 0, 0, 1, 1,
0.9485335, -0.2638951, 2.471494, 0, 0, 0, 1, 1,
0.9530155, -1.437893, 1.26052, 0, 0, 0, 1, 1,
0.9578152, -1.043816, 2.778164, 0, 0, 0, 1, 1,
0.9581014, 0.3721332, -0.4685444, 1, 1, 1, 1, 1,
0.9610435, 1.177826, 0.8727943, 1, 1, 1, 1, 1,
0.9610522, -0.7146214, 2.259885, 1, 1, 1, 1, 1,
0.9611865, -0.173189, 2.197085, 1, 1, 1, 1, 1,
0.9638554, 0.7467065, -0.008107752, 1, 1, 1, 1, 1,
0.97258, 0.9264403, -0.3637691, 1, 1, 1, 1, 1,
0.9741616, 0.3825627, 1.587834, 1, 1, 1, 1, 1,
0.9766888, 1.755092, 0.3333179, 1, 1, 1, 1, 1,
0.977469, 0.7468293, -0.5220913, 1, 1, 1, 1, 1,
0.9814154, -0.6503637, 2.512315, 1, 1, 1, 1, 1,
0.9862629, -0.02787467, 0.6635244, 1, 1, 1, 1, 1,
0.9928376, -1.528479, 3.261675, 1, 1, 1, 1, 1,
1.01437, -1.571715, 4.187681, 1, 1, 1, 1, 1,
1.022289, 0.3383781, 2.739179, 1, 1, 1, 1, 1,
1.023876, 0.3990572, 1.744697, 1, 1, 1, 1, 1,
1.024203, -0.8865397, 1.297634, 0, 0, 1, 1, 1,
1.029344, 0.01306581, -0.3172615, 1, 0, 0, 1, 1,
1.047202, -0.6353938, 0.4949343, 1, 0, 0, 1, 1,
1.06003, -0.4529507, 1.818104, 1, 0, 0, 1, 1,
1.061165, -2.485378, 3.198886, 1, 0, 0, 1, 1,
1.065753, -1.291285, 3.038367, 1, 0, 0, 1, 1,
1.069259, -1.051031, 2.848457, 0, 0, 0, 1, 1,
1.070743, -0.767463, 3.163804, 0, 0, 0, 1, 1,
1.071495, 1.030277, 2.736006, 0, 0, 0, 1, 1,
1.072767, 0.7217394, -0.104567, 0, 0, 0, 1, 1,
1.077442, 1.79455, 0.9265531, 0, 0, 0, 1, 1,
1.085887, -1.095339, 2.807586, 0, 0, 0, 1, 1,
1.099864, 0.7257828, 1.532626, 0, 0, 0, 1, 1,
1.100272, 1.022426, -0.6061664, 1, 1, 1, 1, 1,
1.1018, -0.1981765, 2.199246, 1, 1, 1, 1, 1,
1.112054, 0.736093, 1.79443, 1, 1, 1, 1, 1,
1.112891, -2.021358, 2.664315, 1, 1, 1, 1, 1,
1.113436, 1.269994, 1.446277, 1, 1, 1, 1, 1,
1.126958, -0.5025306, 2.369488, 1, 1, 1, 1, 1,
1.142886, 1.361335, 0.05812555, 1, 1, 1, 1, 1,
1.145644, -0.1353722, 1.25009, 1, 1, 1, 1, 1,
1.147046, 1.334651, -0.2228111, 1, 1, 1, 1, 1,
1.147916, 0.9126301, 1.424298, 1, 1, 1, 1, 1,
1.151835, 0.4562489, 0.01949927, 1, 1, 1, 1, 1,
1.153443, -0.2569777, 1.312536, 1, 1, 1, 1, 1,
1.162183, 0.8797646, 1.251371, 1, 1, 1, 1, 1,
1.162734, -1.116037, 2.513612, 1, 1, 1, 1, 1,
1.164484, 1.573834, -0.114233, 1, 1, 1, 1, 1,
1.168965, -0.03701766, 2.119993, 0, 0, 1, 1, 1,
1.176164, -0.1744532, 1.313489, 1, 0, 0, 1, 1,
1.178241, 1.051701, 0.6227009, 1, 0, 0, 1, 1,
1.182513, -2.39312, 2.29297, 1, 0, 0, 1, 1,
1.186275, -0.1274826, -0.004566246, 1, 0, 0, 1, 1,
1.192281, -0.6724245, 0.0801736, 1, 0, 0, 1, 1,
1.19754, -0.07149278, 3.092496, 0, 0, 0, 1, 1,
1.20776, -0.5159798, 1.429194, 0, 0, 0, 1, 1,
1.209424, 1.178081, 1.132691, 0, 0, 0, 1, 1,
1.210742, 0.8252624, 0.4010428, 0, 0, 0, 1, 1,
1.212317, 0.1141366, 1.741088, 0, 0, 0, 1, 1,
1.217427, 0.0324803, 2.256445, 0, 0, 0, 1, 1,
1.218457, -0.9841961, 2.784471, 0, 0, 0, 1, 1,
1.230574, 1.768958, -0.6362689, 1, 1, 1, 1, 1,
1.234113, 1.714028, 0.7353519, 1, 1, 1, 1, 1,
1.23792, 0.4373668, -1.199901, 1, 1, 1, 1, 1,
1.263394, -0.519045, 0.737065, 1, 1, 1, 1, 1,
1.270828, 0.898542, -1.204346, 1, 1, 1, 1, 1,
1.271227, 0.8321446, 1.744177, 1, 1, 1, 1, 1,
1.277308, -0.1094533, 0.2183772, 1, 1, 1, 1, 1,
1.279509, -1.063518, -0.2975318, 1, 1, 1, 1, 1,
1.28429, -0.4316807, 1.853679, 1, 1, 1, 1, 1,
1.285917, 0.06000093, 0.9816638, 1, 1, 1, 1, 1,
1.286745, 1.75433, 2.383107, 1, 1, 1, 1, 1,
1.289332, 0.04996296, 0.302436, 1, 1, 1, 1, 1,
1.293578, 0.4453287, 1.43065, 1, 1, 1, 1, 1,
1.293655, -0.2767144, 4.438877, 1, 1, 1, 1, 1,
1.295142, 0.4242255, 1.367827, 1, 1, 1, 1, 1,
1.297489, 1.261855, 0.3345025, 0, 0, 1, 1, 1,
1.303629, -0.04939191, 0.5516396, 1, 0, 0, 1, 1,
1.323801, -0.378262, -0.4269826, 1, 0, 0, 1, 1,
1.327332, -0.2310374, 2.2892, 1, 0, 0, 1, 1,
1.333269, -0.3223494, 1.5086, 1, 0, 0, 1, 1,
1.340479, -0.3827192, 2.278878, 1, 0, 0, 1, 1,
1.361376, 0.05096902, 1.489872, 0, 0, 0, 1, 1,
1.365175, 0.1610015, 4.491604, 0, 0, 0, 1, 1,
1.36631, -0.9737741, 2.748315, 0, 0, 0, 1, 1,
1.381829, -2.06336, 2.679509, 0, 0, 0, 1, 1,
1.383362, 0.2074267, 2.099257, 0, 0, 0, 1, 1,
1.397492, 0.1929734, 0.7150013, 0, 0, 0, 1, 1,
1.399156, 2.496767, -0.238106, 0, 0, 0, 1, 1,
1.415669, 0.8963518, 0.4148378, 1, 1, 1, 1, 1,
1.421118, 0.2237468, 2.068097, 1, 1, 1, 1, 1,
1.432706, -1.131093, 2.518365, 1, 1, 1, 1, 1,
1.434392, 0.001660987, 0.8969818, 1, 1, 1, 1, 1,
1.436846, 0.2811804, 2.929397, 1, 1, 1, 1, 1,
1.441029, 0.418028, -0.5092785, 1, 1, 1, 1, 1,
1.458474, -0.5266329, 2.751782, 1, 1, 1, 1, 1,
1.472281, 0.1623454, 1.828298, 1, 1, 1, 1, 1,
1.473977, 0.1618269, 1.515537, 1, 1, 1, 1, 1,
1.474534, -1.554748, 2.797123, 1, 1, 1, 1, 1,
1.477276, -0.5462497, 1.807142, 1, 1, 1, 1, 1,
1.494246, -0.03781043, 0.6489205, 1, 1, 1, 1, 1,
1.495985, 2.099065, 2.805118, 1, 1, 1, 1, 1,
1.497002, 0.9992911, -0.2541456, 1, 1, 1, 1, 1,
1.505561, 0.9696703, 0.310333, 1, 1, 1, 1, 1,
1.515962, -0.9562668, 0.9704207, 0, 0, 1, 1, 1,
1.520552, -0.6177983, 2.780165, 1, 0, 0, 1, 1,
1.528302, 0.7113093, 1.172922, 1, 0, 0, 1, 1,
1.543069, -0.1668023, 1.86986, 1, 0, 0, 1, 1,
1.552715, 1.014425, 2.421997, 1, 0, 0, 1, 1,
1.560149, -2.173373, 2.905236, 1, 0, 0, 1, 1,
1.563564, -0.05618151, 2.705355, 0, 0, 0, 1, 1,
1.567671, -0.4936604, 1.151546, 0, 0, 0, 1, 1,
1.56968, -0.6189758, -1.05998, 0, 0, 0, 1, 1,
1.579243, -1.429177, 2.131429, 0, 0, 0, 1, 1,
1.608306, -1.067695, 3.509718, 0, 0, 0, 1, 1,
1.608721, -0.2341108, 2.144917, 0, 0, 0, 1, 1,
1.610434, 1.997991, 1.012106, 0, 0, 0, 1, 1,
1.612242, -1.472142, 2.849955, 1, 1, 1, 1, 1,
1.613584, -1.234892, 0.3788576, 1, 1, 1, 1, 1,
1.63648, -0.2996737, 2.118129, 1, 1, 1, 1, 1,
1.642957, 1.395613, 0.6722618, 1, 1, 1, 1, 1,
1.650105, -1.050958, 1.579563, 1, 1, 1, 1, 1,
1.670757, 0.5395999, 1.215786, 1, 1, 1, 1, 1,
1.693449, -0.8190057, 0.6545649, 1, 1, 1, 1, 1,
1.693751, 0.8286452, 0.4870863, 1, 1, 1, 1, 1,
1.694286, 3.140451, -0.8117845, 1, 1, 1, 1, 1,
1.714327, 0.4944443, 0.4163479, 1, 1, 1, 1, 1,
1.715105, 1.420054, 1.261633, 1, 1, 1, 1, 1,
1.718366, -1.355948, 2.941669, 1, 1, 1, 1, 1,
1.747033, 0.3282716, -0.06706525, 1, 1, 1, 1, 1,
1.754492, 0.5262893, 1.107984, 1, 1, 1, 1, 1,
1.756687, -1.683335, 2.600113, 1, 1, 1, 1, 1,
1.777916, 0.4199902, 2.287194, 0, 0, 1, 1, 1,
1.787914, -0.2010788, 2.32105, 1, 0, 0, 1, 1,
1.796354, 0.5798945, 1.461589, 1, 0, 0, 1, 1,
1.798496, 2.729868, -1.141918, 1, 0, 0, 1, 1,
1.805024, 1.489672, 0.7966569, 1, 0, 0, 1, 1,
1.806283, 0.08753259, 2.219983, 1, 0, 0, 1, 1,
1.820077, 0.7291865, 2.865263, 0, 0, 0, 1, 1,
1.835546, -0.3753231, 0.4643238, 0, 0, 0, 1, 1,
1.872237, -0.5146601, 2.67096, 0, 0, 0, 1, 1,
1.872725, 0.7093016, 1.195753, 0, 0, 0, 1, 1,
1.888371, 0.04254096, 1.477333, 0, 0, 0, 1, 1,
1.89992, -0.9846538, 5.17232, 0, 0, 0, 1, 1,
1.915603, -1.109389, 3.77269, 0, 0, 0, 1, 1,
1.9204, -0.1706271, 1.454633, 1, 1, 1, 1, 1,
1.926779, -1.679914, 2.700635, 1, 1, 1, 1, 1,
1.955638, 0.7063652, 0.8570965, 1, 1, 1, 1, 1,
2.004207, -1.21097, 1.727778, 1, 1, 1, 1, 1,
2.027819, 0.003176458, 2.145013, 1, 1, 1, 1, 1,
2.045534, 0.6035286, 0.1780044, 1, 1, 1, 1, 1,
2.048373, 0.0543486, 3.545831, 1, 1, 1, 1, 1,
2.072884, -1.860608, 1.503827, 1, 1, 1, 1, 1,
2.074014, 0.3357498, 0.9929265, 1, 1, 1, 1, 1,
2.08541, 0.07870267, 3.046501, 1, 1, 1, 1, 1,
2.087799, -0.4986413, 1.584337, 1, 1, 1, 1, 1,
2.100107, 0.3415896, 1.393434, 1, 1, 1, 1, 1,
2.108077, -1.553916, 1.255891, 1, 1, 1, 1, 1,
2.128584, 0.9305429, 2.403346, 1, 1, 1, 1, 1,
2.139788, 1.445455, 0.04553342, 1, 1, 1, 1, 1,
2.14904, -1.969076, 1.969602, 0, 0, 1, 1, 1,
2.180687, 0.5321447, 1.935203, 1, 0, 0, 1, 1,
2.184209, 1.004684, 0.7623828, 1, 0, 0, 1, 1,
2.191362, -1.303993, 4.471179, 1, 0, 0, 1, 1,
2.239233, 0.3172563, 2.602329, 1, 0, 0, 1, 1,
2.248957, 0.4629535, 1.567399, 1, 0, 0, 1, 1,
2.275434, 0.2434297, 2.038662, 0, 0, 0, 1, 1,
2.286864, -0.3974481, 1.629514, 0, 0, 0, 1, 1,
2.296836, 0.3990772, 1.745249, 0, 0, 0, 1, 1,
2.301668, 1.667849, 0.463669, 0, 0, 0, 1, 1,
2.314846, 0.1529149, -0.0706927, 0, 0, 0, 1, 1,
2.364293, 0.08113723, 2.127311, 0, 0, 0, 1, 1,
2.427758, 0.4564827, 0.1883131, 0, 0, 0, 1, 1,
2.446053, -0.5272092, 0.6682346, 1, 1, 1, 1, 1,
2.527636, -2.07731, 3.516617, 1, 1, 1, 1, 1,
2.646428, 0.8776075, 1.954403, 1, 1, 1, 1, 1,
2.652114, 0.2131881, 1.856666, 1, 1, 1, 1, 1,
2.711807, 0.7408516, 2.574704, 1, 1, 1, 1, 1,
2.82058, 2.555701, 1.128215, 1, 1, 1, 1, 1,
3.344922, 1.085038, -0.1837969, 1, 1, 1, 1, 1
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
var radius = 9.603971;
var distance = 33.73354;
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
mvMatrix.translate( -0.1551151, -0.6396371, 0.1265545 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73354);
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
