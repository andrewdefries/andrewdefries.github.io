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
-2.75241, 1.824706, 0.1094493, 1, 0, 0, 1,
-2.722, 1.601006, -2.478789, 1, 0.007843138, 0, 1,
-2.708139, -1.387052, -3.849738, 1, 0.01176471, 0, 1,
-2.652408, -0.6099955, -2.775182, 1, 0.01960784, 0, 1,
-2.543764, 0.6126979, -1.023045, 1, 0.02352941, 0, 1,
-2.521638, 0.04101866, -2.239228, 1, 0.03137255, 0, 1,
-2.515685, 0.8244292, -0.8126111, 1, 0.03529412, 0, 1,
-2.459378, -0.2532245, 0.02564196, 1, 0.04313726, 0, 1,
-2.403886, 0.360866, -0.7921537, 1, 0.04705882, 0, 1,
-2.368632, -1.738408, -1.361151, 1, 0.05490196, 0, 1,
-2.3529, 0.2854855, -3.113671, 1, 0.05882353, 0, 1,
-2.305459, -0.495543, -1.20738, 1, 0.06666667, 0, 1,
-2.298839, 0.3817212, -1.912125, 1, 0.07058824, 0, 1,
-2.265077, 1.470513, -1.02229, 1, 0.07843138, 0, 1,
-2.211711, 1.216892, -3.533821, 1, 0.08235294, 0, 1,
-2.210028, 0.00492509, 0.08466127, 1, 0.09019608, 0, 1,
-2.20788, -0.1102346, -3.03028, 1, 0.09411765, 0, 1,
-2.19024, -0.3677106, -2.951156, 1, 0.1019608, 0, 1,
-2.169249, -1.542189, -3.198617, 1, 0.1098039, 0, 1,
-2.162446, 0.8112751, -2.706697, 1, 0.1137255, 0, 1,
-2.064092, -1.050364, -1.141185, 1, 0.1215686, 0, 1,
-2.056306, 0.3805022, -2.630252, 1, 0.1254902, 0, 1,
-2.055047, 0.8782749, -2.013265, 1, 0.1333333, 0, 1,
-2.037902, -2.523039, -2.567594, 1, 0.1372549, 0, 1,
-1.997702, 0.09494498, -3.432785, 1, 0.145098, 0, 1,
-1.990162, -1.983393, -2.501502, 1, 0.1490196, 0, 1,
-1.964327, 0.405144, -0.9083823, 1, 0.1568628, 0, 1,
-1.951051, 0.07503559, -0.3120311, 1, 0.1607843, 0, 1,
-1.949801, 0.2055105, 0.129311, 1, 0.1686275, 0, 1,
-1.936936, 0.4684049, -0.8979219, 1, 0.172549, 0, 1,
-1.932117, 1.078974, -0.1369527, 1, 0.1803922, 0, 1,
-1.930781, -0.407594, -2.889037, 1, 0.1843137, 0, 1,
-1.925667, -0.165916, -0.3457735, 1, 0.1921569, 0, 1,
-1.897771, 0.0498598, 0.3438123, 1, 0.1960784, 0, 1,
-1.866384, 0.8180479, -2.164614, 1, 0.2039216, 0, 1,
-1.864262, 0.4491043, -0.5597771, 1, 0.2117647, 0, 1,
-1.80568, -1.114538, -0.8728613, 1, 0.2156863, 0, 1,
-1.795425, 0.4265215, -1.675055, 1, 0.2235294, 0, 1,
-1.794065, -1.294151, -2.397748, 1, 0.227451, 0, 1,
-1.785617, -0.492028, -1.230474, 1, 0.2352941, 0, 1,
-1.760459, 0.7395276, -0.8131779, 1, 0.2392157, 0, 1,
-1.757508, 0.1112658, -2.249189, 1, 0.2470588, 0, 1,
-1.731768, 0.5818591, -0.8586466, 1, 0.2509804, 0, 1,
-1.729218, 0.1802517, -0.2882996, 1, 0.2588235, 0, 1,
-1.723254, -0.1261285, -2.528585, 1, 0.2627451, 0, 1,
-1.717594, 0.4797579, -0.6107534, 1, 0.2705882, 0, 1,
-1.709083, -1.495034, -0.630578, 1, 0.2745098, 0, 1,
-1.702766, 0.9021911, -0.5651158, 1, 0.282353, 0, 1,
-1.691482, -1.085616, -0.9339246, 1, 0.2862745, 0, 1,
-1.687875, -0.1252086, -1.293484, 1, 0.2941177, 0, 1,
-1.687006, 1.239859, -0.4236256, 1, 0.3019608, 0, 1,
-1.680658, -1.225801, -2.01652, 1, 0.3058824, 0, 1,
-1.673125, -1.42356, -2.858776, 1, 0.3137255, 0, 1,
-1.670787, -0.2466666, -0.644242, 1, 0.3176471, 0, 1,
-1.665312, 1.42856, -0.688002, 1, 0.3254902, 0, 1,
-1.660377, 0.1262846, -0.2380396, 1, 0.3294118, 0, 1,
-1.651789, -0.7864122, -1.877783, 1, 0.3372549, 0, 1,
-1.62927, -1.738149, -1.881237, 1, 0.3411765, 0, 1,
-1.616909, -0.0813072, -1.14506, 1, 0.3490196, 0, 1,
-1.610951, 1.121664, -3.218861, 1, 0.3529412, 0, 1,
-1.598839, -0.5228127, -2.932016, 1, 0.3607843, 0, 1,
-1.578432, 1.007995, -2.150229, 1, 0.3647059, 0, 1,
-1.564098, 1.28418, -1.280289, 1, 0.372549, 0, 1,
-1.563924, -1.510081, -1.497818, 1, 0.3764706, 0, 1,
-1.553544, -0.6020043, -3.483948, 1, 0.3843137, 0, 1,
-1.551846, 1.220435, -1.284841, 1, 0.3882353, 0, 1,
-1.515361, -0.4864586, -3.815538, 1, 0.3960784, 0, 1,
-1.512387, -0.2418212, -2.065033, 1, 0.4039216, 0, 1,
-1.507045, 2.112095, -1.260965, 1, 0.4078431, 0, 1,
-1.506652, 0.6140742, -1.554073, 1, 0.4156863, 0, 1,
-1.504415, -0.1974997, -0.9777682, 1, 0.4196078, 0, 1,
-1.483244, -1.144954, -1.938667, 1, 0.427451, 0, 1,
-1.462863, -0.2954302, -1.29046, 1, 0.4313726, 0, 1,
-1.461936, -0.2103167, 0.222341, 1, 0.4392157, 0, 1,
-1.45728, 1.090344, -1.394988, 1, 0.4431373, 0, 1,
-1.456996, 2.290681, 0.2763912, 1, 0.4509804, 0, 1,
-1.443054, 0.2135553, -0.8043861, 1, 0.454902, 0, 1,
-1.439573, 1.108124, -2.88921, 1, 0.4627451, 0, 1,
-1.434192, -0.8035582, -2.306279, 1, 0.4666667, 0, 1,
-1.433142, -1.436342, -2.393035, 1, 0.4745098, 0, 1,
-1.410113, 0.8050442, -0.8641214, 1, 0.4784314, 0, 1,
-1.395275, 0.1935824, -3.327918, 1, 0.4862745, 0, 1,
-1.387317, 0.08896331, -3.14448, 1, 0.4901961, 0, 1,
-1.38484, 0.4105302, -1.979727, 1, 0.4980392, 0, 1,
-1.363688, -1.181705, -2.286108, 1, 0.5058824, 0, 1,
-1.360888, 0.8034629, -1.359606, 1, 0.509804, 0, 1,
-1.358526, -0.5092125, -2.240718, 1, 0.5176471, 0, 1,
-1.352599, -1.691624, -4.450489, 1, 0.5215687, 0, 1,
-1.33173, 0.6349818, -1.848765, 1, 0.5294118, 0, 1,
-1.3304, -0.07947242, -0.7083082, 1, 0.5333334, 0, 1,
-1.32657, 0.04350254, -2.474442, 1, 0.5411765, 0, 1,
-1.318945, 0.7565834, -0.6604764, 1, 0.5450981, 0, 1,
-1.313438, -0.4587291, 0.1923384, 1, 0.5529412, 0, 1,
-1.312159, -1.866549, -2.742099, 1, 0.5568628, 0, 1,
-1.311083, -0.4636861, -4.136603, 1, 0.5647059, 0, 1,
-1.294808, 1.950865, -1.180382, 1, 0.5686275, 0, 1,
-1.272292, -0.3481413, -2.076905, 1, 0.5764706, 0, 1,
-1.265505, -0.7437444, -2.099704, 1, 0.5803922, 0, 1,
-1.263512, 0.2856441, -2.191481, 1, 0.5882353, 0, 1,
-1.249525, 0.7732232, -1.314194, 1, 0.5921569, 0, 1,
-1.248613, -0.8949492, -1.424169, 1, 0.6, 0, 1,
-1.242434, -1.797444, -3.772932, 1, 0.6078432, 0, 1,
-1.242014, -0.8336446, -0.6780235, 1, 0.6117647, 0, 1,
-1.241668, 0.7666691, -0.9133743, 1, 0.6196079, 0, 1,
-1.241516, 1.891063, 1.176342, 1, 0.6235294, 0, 1,
-1.239314, -1.653771, -2.824298, 1, 0.6313726, 0, 1,
-1.23771, -0.002062772, -2.51362, 1, 0.6352941, 0, 1,
-1.225367, 0.07413952, -1.296743, 1, 0.6431373, 0, 1,
-1.219815, -1.400214, -2.214952, 1, 0.6470588, 0, 1,
-1.219741, -0.6221026, -3.030705, 1, 0.654902, 0, 1,
-1.213412, -0.3365769, -1.872078, 1, 0.6588235, 0, 1,
-1.211853, -0.7646507, -3.918269, 1, 0.6666667, 0, 1,
-1.203782, -0.1175837, -1.823024, 1, 0.6705883, 0, 1,
-1.199166, -0.277375, -1.229511, 1, 0.6784314, 0, 1,
-1.182799, 1.138927, -2.158624, 1, 0.682353, 0, 1,
-1.179512, 2.151969, 1.520821, 1, 0.6901961, 0, 1,
-1.178536, 1.468004, -0.7097383, 1, 0.6941177, 0, 1,
-1.177239, -0.1421447, -1.802631, 1, 0.7019608, 0, 1,
-1.17553, 1.253336, -0.853333, 1, 0.7098039, 0, 1,
-1.159592, -0.6438707, -2.106971, 1, 0.7137255, 0, 1,
-1.152089, 0.8751991, -2.379068, 1, 0.7215686, 0, 1,
-1.144439, 1.845595, -0.7109529, 1, 0.7254902, 0, 1,
-1.143161, 0.25926, -2.199398, 1, 0.7333333, 0, 1,
-1.143149, 0.1808039, -2.714532, 1, 0.7372549, 0, 1,
-1.131565, -0.9441795, -0.8848038, 1, 0.7450981, 0, 1,
-1.131027, 0.4381829, -1.28113, 1, 0.7490196, 0, 1,
-1.128939, -0.1046773, -3.288719, 1, 0.7568628, 0, 1,
-1.117463, -0.6156294, -0.06955586, 1, 0.7607843, 0, 1,
-1.115337, -1.365135, -2.305463, 1, 0.7686275, 0, 1,
-1.11513, -0.250342, -0.4536097, 1, 0.772549, 0, 1,
-1.1112, 0.9170882, -1.476308, 1, 0.7803922, 0, 1,
-1.105238, 0.5019804, -1.942636, 1, 0.7843137, 0, 1,
-1.099146, -0.9825143, -1.892588, 1, 0.7921569, 0, 1,
-1.097426, -0.220706, -2.070233, 1, 0.7960784, 0, 1,
-1.082191, -0.2936991, -0.6313748, 1, 0.8039216, 0, 1,
-1.080749, -0.1319028, -2.022151, 1, 0.8117647, 0, 1,
-1.070212, -0.01174825, -1.589295, 1, 0.8156863, 0, 1,
-1.066977, -0.7398618, -0.8501565, 1, 0.8235294, 0, 1,
-1.061124, 1.395308, -1.525066, 1, 0.827451, 0, 1,
-1.05426, -0.4932325, -3.693718, 1, 0.8352941, 0, 1,
-1.049969, 0.9672935, 0.4080303, 1, 0.8392157, 0, 1,
-1.049802, -0.3805233, -2.445807, 1, 0.8470588, 0, 1,
-1.037375, -0.2701186, -2.200887, 1, 0.8509804, 0, 1,
-1.036888, 2.530308, -1.396279, 1, 0.8588235, 0, 1,
-1.034201, 0.01877742, -2.541661, 1, 0.8627451, 0, 1,
-1.032456, 0.4429989, -2.095512, 1, 0.8705882, 0, 1,
-1.02898, -0.3576634, -3.315258, 1, 0.8745098, 0, 1,
-1.028549, 0.992958, -0.7407342, 1, 0.8823529, 0, 1,
-1.027509, -1.016994, -2.390141, 1, 0.8862745, 0, 1,
-1.015686, 1.077967, -0.05020892, 1, 0.8941177, 0, 1,
-1.011996, -0.2027444, -0.3167363, 1, 0.8980392, 0, 1,
-1.008711, -0.7666733, -3.391161, 1, 0.9058824, 0, 1,
-1.007652, 0.9593893, -1.526621, 1, 0.9137255, 0, 1,
-1.007186, 2.410793, -2.573063, 1, 0.9176471, 0, 1,
-1.003688, -0.4983936, -3.210779, 1, 0.9254902, 0, 1,
-1.001468, 2.495036, 0.5458379, 1, 0.9294118, 0, 1,
-0.9992892, -1.180374, -1.991121, 1, 0.9372549, 0, 1,
-0.99799, -0.8482916, -3.671247, 1, 0.9411765, 0, 1,
-0.9971373, -0.1183515, 0.01839789, 1, 0.9490196, 0, 1,
-0.9908321, 1.276821, -0.6146258, 1, 0.9529412, 0, 1,
-0.9903466, -0.7307141, -2.546363, 1, 0.9607843, 0, 1,
-0.9841376, 0.469664, -0.1349775, 1, 0.9647059, 0, 1,
-0.9804222, 0.2760337, -0.8934055, 1, 0.972549, 0, 1,
-0.9798448, -0.8642759, -1.137999, 1, 0.9764706, 0, 1,
-0.9786493, -1.182811, -3.815743, 1, 0.9843137, 0, 1,
-0.9746805, 0.1062114, -1.48777, 1, 0.9882353, 0, 1,
-0.9715754, -0.797293, -3.282183, 1, 0.9960784, 0, 1,
-0.9696302, 1.164105, -1.03995, 0.9960784, 1, 0, 1,
-0.960824, 0.843512, -2.76477, 0.9921569, 1, 0, 1,
-0.9596801, -0.3045843, -2.460839, 0.9843137, 1, 0, 1,
-0.9588993, 0.5213868, -2.851885, 0.9803922, 1, 0, 1,
-0.9474074, 0.2203513, -1.280369, 0.972549, 1, 0, 1,
-0.9458228, 0.3429376, -2.440033, 0.9686275, 1, 0, 1,
-0.9400744, -0.8779811, -2.692761, 0.9607843, 1, 0, 1,
-0.9301607, -0.7692171, -2.192975, 0.9568627, 1, 0, 1,
-0.9232084, 0.3873548, 0.04532248, 0.9490196, 1, 0, 1,
-0.922671, 3.023239, 0.6893758, 0.945098, 1, 0, 1,
-0.921718, -0.3708969, -1.886596, 0.9372549, 1, 0, 1,
-0.9115429, -0.2166665, -1.840735, 0.9333333, 1, 0, 1,
-0.9078376, 0.3125407, -0.1739925, 0.9254902, 1, 0, 1,
-0.9055713, 1.18079, 0.842357, 0.9215686, 1, 0, 1,
-0.903668, 0.8304254, -0.7424048, 0.9137255, 1, 0, 1,
-0.8867901, -0.8544918, -2.655794, 0.9098039, 1, 0, 1,
-0.8831234, -0.337648, -2.181262, 0.9019608, 1, 0, 1,
-0.8817205, 0.2498033, -0.5944015, 0.8941177, 1, 0, 1,
-0.8790594, 1.204061, -1.144231, 0.8901961, 1, 0, 1,
-0.8783767, -2.238391, -0.4251885, 0.8823529, 1, 0, 1,
-0.8779849, -0.3470929, -0.05575835, 0.8784314, 1, 0, 1,
-0.8723218, 1.180074, -1.923474, 0.8705882, 1, 0, 1,
-0.8721979, 0.07122055, -1.570339, 0.8666667, 1, 0, 1,
-0.8703501, -1.606607, -2.145121, 0.8588235, 1, 0, 1,
-0.8652255, -0.02075435, -2.138055, 0.854902, 1, 0, 1,
-0.8568988, 0.4199438, -0.9354739, 0.8470588, 1, 0, 1,
-0.8450682, 1.365401, 0.2376754, 0.8431373, 1, 0, 1,
-0.8448741, 0.5530889, -2.442779, 0.8352941, 1, 0, 1,
-0.8438194, -0.1409193, -2.031755, 0.8313726, 1, 0, 1,
-0.8408819, 1.743168, -1.677528, 0.8235294, 1, 0, 1,
-0.8289316, -1.047638, -2.18784, 0.8196079, 1, 0, 1,
-0.8276139, -0.2012639, -0.8875917, 0.8117647, 1, 0, 1,
-0.8245665, -0.4865557, -1.340884, 0.8078431, 1, 0, 1,
-0.8188938, 1.44752, -0.3721854, 0.8, 1, 0, 1,
-0.8142913, -0.971129, -3.280705, 0.7921569, 1, 0, 1,
-0.8102276, -1.657867, -3.597107, 0.7882353, 1, 0, 1,
-0.8032632, 0.9522656, -0.9736842, 0.7803922, 1, 0, 1,
-0.7959313, 1.7942, -1.288353, 0.7764706, 1, 0, 1,
-0.7906803, -0.3173452, -1.291344, 0.7686275, 1, 0, 1,
-0.7894511, 0.4736823, -2.217366, 0.7647059, 1, 0, 1,
-0.7847969, 1.007293, -0.65194, 0.7568628, 1, 0, 1,
-0.781499, -0.006479579, -1.863509, 0.7529412, 1, 0, 1,
-0.7798674, -1.468226, -1.386842, 0.7450981, 1, 0, 1,
-0.7746084, 0.1924876, 0.2382976, 0.7411765, 1, 0, 1,
-0.771933, -0.8139076, -1.74194, 0.7333333, 1, 0, 1,
-0.7717819, 0.5769517, -2.733486, 0.7294118, 1, 0, 1,
-0.7705336, 0.09195866, -2.840379, 0.7215686, 1, 0, 1,
-0.7702738, 0.800545, -1.048314, 0.7176471, 1, 0, 1,
-0.7696041, 1.614152, -0.238706, 0.7098039, 1, 0, 1,
-0.7682441, -0.6360547, -2.264908, 0.7058824, 1, 0, 1,
-0.7663047, 0.5417923, 0.1384327, 0.6980392, 1, 0, 1,
-0.7592959, -0.2670658, -0.51622, 0.6901961, 1, 0, 1,
-0.756193, -1.34815, -3.329414, 0.6862745, 1, 0, 1,
-0.7553048, -1.455749, -0.6603199, 0.6784314, 1, 0, 1,
-0.753805, 0.7363406, -1.431733, 0.6745098, 1, 0, 1,
-0.7524893, -0.2018689, -3.488903, 0.6666667, 1, 0, 1,
-0.7493819, -0.01757856, -1.141996, 0.6627451, 1, 0, 1,
-0.745914, 0.1591418, 0.02054822, 0.654902, 1, 0, 1,
-0.7395225, 2.506449, -1.435964, 0.6509804, 1, 0, 1,
-0.7375602, -0.7739749, -1.388155, 0.6431373, 1, 0, 1,
-0.7342829, 0.4798493, 0.3689629, 0.6392157, 1, 0, 1,
-0.7333724, -0.4006465, -3.461923, 0.6313726, 1, 0, 1,
-0.7324503, 0.7666259, -0.9125999, 0.627451, 1, 0, 1,
-0.7288795, -0.6326992, -1.226152, 0.6196079, 1, 0, 1,
-0.7244773, -0.8602073, -1.87292, 0.6156863, 1, 0, 1,
-0.7241102, -1.2499, -3.004147, 0.6078432, 1, 0, 1,
-0.7206992, 0.2969587, -0.4879633, 0.6039216, 1, 0, 1,
-0.7206689, 0.07220239, -2.371408, 0.5960785, 1, 0, 1,
-0.711423, 1.38875, -0.03434933, 0.5882353, 1, 0, 1,
-0.7016372, 1.714589, -1.976908, 0.5843138, 1, 0, 1,
-0.6986247, -0.3557142, -1.131191, 0.5764706, 1, 0, 1,
-0.6874994, -0.5725613, -1.474689, 0.572549, 1, 0, 1,
-0.6866209, -0.3370048, -1.225667, 0.5647059, 1, 0, 1,
-0.6808908, 0.2563736, -1.038728, 0.5607843, 1, 0, 1,
-0.6803364, 0.7286167, -0.8636852, 0.5529412, 1, 0, 1,
-0.6700172, -1.048595, -3.641975, 0.5490196, 1, 0, 1,
-0.6688017, -0.05344443, -2.40733, 0.5411765, 1, 0, 1,
-0.6671718, 1.113743, -0.03240161, 0.5372549, 1, 0, 1,
-0.6626566, 0.3902617, -1.917921, 0.5294118, 1, 0, 1,
-0.6612681, -0.9561498, -2.136411, 0.5254902, 1, 0, 1,
-0.6538428, 0.5429509, -0.9533809, 0.5176471, 1, 0, 1,
-0.6432402, -1.337646, -3.391711, 0.5137255, 1, 0, 1,
-0.6403184, 2.096891, -1.585748, 0.5058824, 1, 0, 1,
-0.6394106, -0.04917299, -0.896798, 0.5019608, 1, 0, 1,
-0.634387, -0.02213048, -1.310278, 0.4941176, 1, 0, 1,
-0.6295842, -0.7870274, -3.804196, 0.4862745, 1, 0, 1,
-0.6289191, -1.00783, -4.822385, 0.4823529, 1, 0, 1,
-0.6281815, 1.755669, -0.9939394, 0.4745098, 1, 0, 1,
-0.6200073, 0.5591251, -1.038831, 0.4705882, 1, 0, 1,
-0.6178522, -0.2168574, -1.622883, 0.4627451, 1, 0, 1,
-0.6177033, 0.2636154, -1.378375, 0.4588235, 1, 0, 1,
-0.6146557, 0.5069038, -0.9463819, 0.4509804, 1, 0, 1,
-0.6082188, 1.277928, 1.021837, 0.4470588, 1, 0, 1,
-0.6081073, -0.7714215, -1.718728, 0.4392157, 1, 0, 1,
-0.5983583, -1.590301, -3.221516, 0.4352941, 1, 0, 1,
-0.5914103, -0.4388603, -2.584144, 0.427451, 1, 0, 1,
-0.5883631, -1.44648, -3.234278, 0.4235294, 1, 0, 1,
-0.5869266, -2.208401, -3.04997, 0.4156863, 1, 0, 1,
-0.5868214, 0.1875546, -2.361296, 0.4117647, 1, 0, 1,
-0.5854078, 1.203153, -0.1882003, 0.4039216, 1, 0, 1,
-0.5853631, 1.812858, 1.087287, 0.3960784, 1, 0, 1,
-0.5850526, -0.2879882, 0.1685764, 0.3921569, 1, 0, 1,
-0.5843375, -0.06449621, -1.647559, 0.3843137, 1, 0, 1,
-0.5835909, 0.4574473, -0.3850775, 0.3803922, 1, 0, 1,
-0.579371, 0.3939013, -0.1779573, 0.372549, 1, 0, 1,
-0.5780875, 1.605938, -0.3801087, 0.3686275, 1, 0, 1,
-0.5750858, 0.09131306, 0.009152657, 0.3607843, 1, 0, 1,
-0.5682741, 0.007343886, -1.624704, 0.3568628, 1, 0, 1,
-0.5659392, -0.2571609, -3.827909, 0.3490196, 1, 0, 1,
-0.5628592, 0.3251987, -1.23139, 0.345098, 1, 0, 1,
-0.5616785, -0.7384655, -3.136432, 0.3372549, 1, 0, 1,
-0.5616585, -0.09780405, -2.326402, 0.3333333, 1, 0, 1,
-0.5601681, 0.7448279, -0.3597455, 0.3254902, 1, 0, 1,
-0.5597306, 0.09815814, -0.9400555, 0.3215686, 1, 0, 1,
-0.5576082, 2.254771, 0.6680372, 0.3137255, 1, 0, 1,
-0.5550174, 0.3797653, -1.312278, 0.3098039, 1, 0, 1,
-0.5519062, -0.4337496, -2.626664, 0.3019608, 1, 0, 1,
-0.5463395, 0.9046997, 0.4096679, 0.2941177, 1, 0, 1,
-0.5459598, 0.8933184, -0.8206415, 0.2901961, 1, 0, 1,
-0.541715, 1.213812, -0.1693898, 0.282353, 1, 0, 1,
-0.5397604, 1.358595, -2.164752, 0.2784314, 1, 0, 1,
-0.5392925, 0.6906297, -0.152385, 0.2705882, 1, 0, 1,
-0.5384418, 1.295598, -0.6856053, 0.2666667, 1, 0, 1,
-0.5335003, 0.06379969, -2.072162, 0.2588235, 1, 0, 1,
-0.5328186, -0.4233964, -2.398125, 0.254902, 1, 0, 1,
-0.527786, 1.220659, -1.380184, 0.2470588, 1, 0, 1,
-0.525508, -1.117728, -2.906342, 0.2431373, 1, 0, 1,
-0.5244608, 1.105889, -1.038089, 0.2352941, 1, 0, 1,
-0.5047842, 0.8255153, -1.489118, 0.2313726, 1, 0, 1,
-0.4951262, -0.6282088, -3.159391, 0.2235294, 1, 0, 1,
-0.4877995, 2.033898, 0.4543581, 0.2196078, 1, 0, 1,
-0.4871046, 2.923671, 0.2469392, 0.2117647, 1, 0, 1,
-0.4869526, -0.2663882, -3.443759, 0.2078431, 1, 0, 1,
-0.4827957, -1.514445, -2.06047, 0.2, 1, 0, 1,
-0.4808781, 0.4950192, -0.6146547, 0.1921569, 1, 0, 1,
-0.4808094, 0.3990139, -0.1122319, 0.1882353, 1, 0, 1,
-0.4806326, -0.5050952, -4.153556, 0.1803922, 1, 0, 1,
-0.4783604, -1.127056, -2.088688, 0.1764706, 1, 0, 1,
-0.4740099, -0.8462621, -4.127435, 0.1686275, 1, 0, 1,
-0.4722232, -0.1450344, -2.362334, 0.1647059, 1, 0, 1,
-0.4717878, 0.4755437, -0.6614768, 0.1568628, 1, 0, 1,
-0.4712867, 0.5885968, -1.012429, 0.1529412, 1, 0, 1,
-0.470728, -1.432105, -2.511107, 0.145098, 1, 0, 1,
-0.4662509, -0.8436551, -3.378749, 0.1411765, 1, 0, 1,
-0.4615178, -1.573557, -2.974907, 0.1333333, 1, 0, 1,
-0.4480789, -3.116755, -4.437836, 0.1294118, 1, 0, 1,
-0.4387683, -2.322467, -2.199017, 0.1215686, 1, 0, 1,
-0.438628, -1.239479, -2.290667, 0.1176471, 1, 0, 1,
-0.4383794, -0.1651602, -2.633489, 0.1098039, 1, 0, 1,
-0.4374841, -0.6198161, -2.395351, 0.1058824, 1, 0, 1,
-0.436553, 0.2061668, -1.331559, 0.09803922, 1, 0, 1,
-0.4335268, 0.7488425, 1.169264, 0.09019608, 1, 0, 1,
-0.4276955, 0.9629136, 0.09969153, 0.08627451, 1, 0, 1,
-0.4214853, -0.941546, -2.553148, 0.07843138, 1, 0, 1,
-0.4188259, -0.3625835, -3.089881, 0.07450981, 1, 0, 1,
-0.4181201, 1.843625, 0.04124158, 0.06666667, 1, 0, 1,
-0.4179686, -0.291204, -2.910422, 0.0627451, 1, 0, 1,
-0.417059, -0.09934523, -3.142413, 0.05490196, 1, 0, 1,
-0.4142247, -0.7453101, -2.523211, 0.05098039, 1, 0, 1,
-0.4142073, -0.3477833, -2.670983, 0.04313726, 1, 0, 1,
-0.4132961, 0.03735737, 0.5141804, 0.03921569, 1, 0, 1,
-0.4076542, 2.35442, -1.597832, 0.03137255, 1, 0, 1,
-0.3984363, 0.5311438, -0.04232535, 0.02745098, 1, 0, 1,
-0.3963414, 0.7150354, 0.3107265, 0.01960784, 1, 0, 1,
-0.3960532, -0.3045502, -3.469415, 0.01568628, 1, 0, 1,
-0.3955371, 2.464205, 1.026839, 0.007843138, 1, 0, 1,
-0.3885447, -1.852376, -2.339836, 0.003921569, 1, 0, 1,
-0.3885296, 0.5699323, -0.9963263, 0, 1, 0.003921569, 1,
-0.3872872, 1.534561, -1.098111, 0, 1, 0.01176471, 1,
-0.3845644, -0.6558681, -3.322032, 0, 1, 0.01568628, 1,
-0.3726429, 0.614996, -0.6548597, 0, 1, 0.02352941, 1,
-0.3724553, 1.420301, -0.670696, 0, 1, 0.02745098, 1,
-0.3713456, -0.2681719, -2.964096, 0, 1, 0.03529412, 1,
-0.3689584, 0.2580878, -0.03993216, 0, 1, 0.03921569, 1,
-0.3652538, -0.8237682, -3.33556, 0, 1, 0.04705882, 1,
-0.3629739, 0.06843878, 1.246583, 0, 1, 0.05098039, 1,
-0.3624225, 0.3127559, -1.191625, 0, 1, 0.05882353, 1,
-0.3588535, -0.4608026, -2.296386, 0, 1, 0.0627451, 1,
-0.3563874, -0.372077, -2.094146, 0, 1, 0.07058824, 1,
-0.3548527, -0.7860543, -3.784493, 0, 1, 0.07450981, 1,
-0.3539582, -0.997494, -2.694846, 0, 1, 0.08235294, 1,
-0.3533825, 1.017509, -0.5505224, 0, 1, 0.08627451, 1,
-0.351188, 0.7386488, 0.4927626, 0, 1, 0.09411765, 1,
-0.3505483, 1.283343, 0.7652307, 0, 1, 0.1019608, 1,
-0.3471627, -0.8460579, -3.40441, 0, 1, 0.1058824, 1,
-0.3471237, -0.3005983, -1.85585, 0, 1, 0.1137255, 1,
-0.3444195, -0.5203086, -2.559239, 0, 1, 0.1176471, 1,
-0.3418529, 0.2692495, -1.962013, 0, 1, 0.1254902, 1,
-0.3389902, 2.471359, 0.5853608, 0, 1, 0.1294118, 1,
-0.3388343, 2.205459, 0.1669939, 0, 1, 0.1372549, 1,
-0.3372696, -1.338573, -2.456546, 0, 1, 0.1411765, 1,
-0.3357748, -1.717903, -2.642528, 0, 1, 0.1490196, 1,
-0.3333983, -0.7004916, -3.021187, 0, 1, 0.1529412, 1,
-0.3332038, 0.4404031, -0.8358915, 0, 1, 0.1607843, 1,
-0.3321614, -0.5522968, -2.569865, 0, 1, 0.1647059, 1,
-0.3269442, 0.7284982, -0.1009276, 0, 1, 0.172549, 1,
-0.3232343, -1.158519, -1.765796, 0, 1, 0.1764706, 1,
-0.3201904, -1.075946, -2.87839, 0, 1, 0.1843137, 1,
-0.3077436, 0.7187474, -1.347361, 0, 1, 0.1882353, 1,
-0.3057714, 0.08202728, -1.828017, 0, 1, 0.1960784, 1,
-0.3029105, -0.3095967, -1.369824, 0, 1, 0.2039216, 1,
-0.3027658, 2.863567, 0.1313396, 0, 1, 0.2078431, 1,
-0.3006032, 1.740567, -1.023278, 0, 1, 0.2156863, 1,
-0.3002241, -1.089796, -3.666724, 0, 1, 0.2196078, 1,
-0.295465, -0.7760149, -2.65552, 0, 1, 0.227451, 1,
-0.294643, 0.5285054, -0.9597344, 0, 1, 0.2313726, 1,
-0.2942434, 0.200125, 0.3194452, 0, 1, 0.2392157, 1,
-0.2888011, 1.990762, -2.428494, 0, 1, 0.2431373, 1,
-0.2885031, -1.112876, -4.326424, 0, 1, 0.2509804, 1,
-0.2867064, 0.7521846, 1.178529, 0, 1, 0.254902, 1,
-0.2859122, -1.472571, -2.313037, 0, 1, 0.2627451, 1,
-0.2821789, 1.584552, 0.1540812, 0, 1, 0.2666667, 1,
-0.2820159, 1.170073, 0.3746643, 0, 1, 0.2745098, 1,
-0.2789645, -0.5610256, -1.837461, 0, 1, 0.2784314, 1,
-0.2781176, 0.1277596, -1.105272, 0, 1, 0.2862745, 1,
-0.2772164, -0.3237687, -1.801916, 0, 1, 0.2901961, 1,
-0.2746781, 2.42332, 0.07741763, 0, 1, 0.2980392, 1,
-0.273406, 0.3683341, -1.341201, 0, 1, 0.3058824, 1,
-0.2676599, -1.472987, -2.381614, 0, 1, 0.3098039, 1,
-0.2667444, 0.5975913, -1.633083, 0, 1, 0.3176471, 1,
-0.2651843, 1.031131, -1.906738, 0, 1, 0.3215686, 1,
-0.2637547, 1.236741, -0.5763959, 0, 1, 0.3294118, 1,
-0.2595451, 2.35574, 0.2178765, 0, 1, 0.3333333, 1,
-0.2578422, 0.9733212, -0.8632919, 0, 1, 0.3411765, 1,
-0.2563207, -0.3819674, -2.611096, 0, 1, 0.345098, 1,
-0.2548698, 1.397431, -1.003597, 0, 1, 0.3529412, 1,
-0.254587, 0.6594602, -0.3586795, 0, 1, 0.3568628, 1,
-0.247237, 0.4203384, -0.3594786, 0, 1, 0.3647059, 1,
-0.2464458, -0.3894423, -2.891232, 0, 1, 0.3686275, 1,
-0.2415233, -0.04940794, 0.2308348, 0, 1, 0.3764706, 1,
-0.2410132, -0.1214881, -3.037675, 0, 1, 0.3803922, 1,
-0.2403366, -0.626933, -4.234116, 0, 1, 0.3882353, 1,
-0.2344839, -0.4709658, -2.546237, 0, 1, 0.3921569, 1,
-0.2333195, -0.3642576, -2.705191, 0, 1, 0.4, 1,
-0.2294391, -0.6948189, -2.31162, 0, 1, 0.4078431, 1,
-0.2287713, 2.347426, -0.5815681, 0, 1, 0.4117647, 1,
-0.225176, -3.24683, -1.350959, 0, 1, 0.4196078, 1,
-0.2250316, 1.579009, -0.8351697, 0, 1, 0.4235294, 1,
-0.2243651, 0.1447983, 0.2493992, 0, 1, 0.4313726, 1,
-0.2222336, -0.5897145, -1.437928, 0, 1, 0.4352941, 1,
-0.2191178, 0.3462423, -0.9399068, 0, 1, 0.4431373, 1,
-0.2188935, -0.1087523, -0.3297473, 0, 1, 0.4470588, 1,
-0.2186712, 1.217502, 1.230272, 0, 1, 0.454902, 1,
-0.2177691, 0.556484, -0.3019742, 0, 1, 0.4588235, 1,
-0.2139919, 1.312376, -0.7683935, 0, 1, 0.4666667, 1,
-0.2124031, 1.657529, -0.2046275, 0, 1, 0.4705882, 1,
-0.2118736, 0.703495, 2.371099, 0, 1, 0.4784314, 1,
-0.2115581, 1.139032, -0.5087447, 0, 1, 0.4823529, 1,
-0.2106439, -1.607277, -4.444561, 0, 1, 0.4901961, 1,
-0.21043, -0.3758357, -4.126984, 0, 1, 0.4941176, 1,
-0.2089093, 0.6183338, -0.14749, 0, 1, 0.5019608, 1,
-0.2088377, 1.079441, -0.7143591, 0, 1, 0.509804, 1,
-0.2077268, 0.9803961, -0.6322431, 0, 1, 0.5137255, 1,
-0.2070751, -0.6618202, -2.175667, 0, 1, 0.5215687, 1,
-0.2035358, 0.7508999, -2.143606, 0, 1, 0.5254902, 1,
-0.2014834, 0.3086387, -0.5440758, 0, 1, 0.5333334, 1,
-0.1949991, 0.4561571, -0.3919876, 0, 1, 0.5372549, 1,
-0.1940941, -1.105713, -2.367055, 0, 1, 0.5450981, 1,
-0.1925754, 0.4040992, -2.66609, 0, 1, 0.5490196, 1,
-0.1924363, 0.1266767, 0.6682847, 0, 1, 0.5568628, 1,
-0.1910302, 0.5519946, -2.404987, 0, 1, 0.5607843, 1,
-0.189373, -0.4965157, -4.305801, 0, 1, 0.5686275, 1,
-0.1882592, -1.026396, -4.52056, 0, 1, 0.572549, 1,
-0.1876479, 1.887912, 0.2620175, 0, 1, 0.5803922, 1,
-0.1823258, -0.9385769, -1.766598, 0, 1, 0.5843138, 1,
-0.179811, -1.355129, -3.426519, 0, 1, 0.5921569, 1,
-0.1788335, -0.4768592, -2.831612, 0, 1, 0.5960785, 1,
-0.1756537, 1.505971, 0.1319662, 0, 1, 0.6039216, 1,
-0.1715815, 0.650269, 0.5977429, 0, 1, 0.6117647, 1,
-0.1664683, 2.06112, 1.940427, 0, 1, 0.6156863, 1,
-0.1662626, -0.3871058, -3.062809, 0, 1, 0.6235294, 1,
-0.1605096, 0.9822263, 0.02836822, 0, 1, 0.627451, 1,
-0.1589478, -0.753953, -0.954905, 0, 1, 0.6352941, 1,
-0.1550305, -2.274989, -3.679155, 0, 1, 0.6392157, 1,
-0.1533463, -0.4619702, -1.416406, 0, 1, 0.6470588, 1,
-0.1493261, -0.1863149, -3.002952, 0, 1, 0.6509804, 1,
-0.1490044, -1.193669, -3.118419, 0, 1, 0.6588235, 1,
-0.146582, 1.932722, 1.319313, 0, 1, 0.6627451, 1,
-0.1395015, -0.2002158, -2.510578, 0, 1, 0.6705883, 1,
-0.1373459, 0.871393, 0.4392971, 0, 1, 0.6745098, 1,
-0.1337374, -0.2880158, -3.176197, 0, 1, 0.682353, 1,
-0.1310755, -0.2876485, -2.433673, 0, 1, 0.6862745, 1,
-0.1275341, -0.1770025, -2.634515, 0, 1, 0.6941177, 1,
-0.1214606, -1.704341, -3.82024, 0, 1, 0.7019608, 1,
-0.1212535, 0.1359486, -2.191385, 0, 1, 0.7058824, 1,
-0.120247, -0.3431189, -4.018126, 0, 1, 0.7137255, 1,
-0.1174487, 0.007070173, -1.580999, 0, 1, 0.7176471, 1,
-0.1171479, 0.8603542, -1.903022, 0, 1, 0.7254902, 1,
-0.1143484, 0.2584547, -0.5052872, 0, 1, 0.7294118, 1,
-0.1120719, 0.9234774, 1.223953, 0, 1, 0.7372549, 1,
-0.1104213, 0.7393052, 0.9261766, 0, 1, 0.7411765, 1,
-0.109561, 0.1081157, 0.3849424, 0, 1, 0.7490196, 1,
-0.1088466, 0.8181196, 0.4068934, 0, 1, 0.7529412, 1,
-0.1080104, -1.108365, -4.951775, 0, 1, 0.7607843, 1,
-0.1074913, 0.3335706, -1.559681, 0, 1, 0.7647059, 1,
-0.1071528, -0.3360735, -1.287965, 0, 1, 0.772549, 1,
-0.1043776, 1.030203, 0.1866881, 0, 1, 0.7764706, 1,
-0.1014046, -0.7065108, -2.769067, 0, 1, 0.7843137, 1,
-0.08645256, 1.836901, 0.1251418, 0, 1, 0.7882353, 1,
-0.08071186, -1.616906, -4.141261, 0, 1, 0.7960784, 1,
-0.07967439, -1.898409, -4.176497, 0, 1, 0.8039216, 1,
-0.07887836, -1.093149, -2.62816, 0, 1, 0.8078431, 1,
-0.07804745, 0.845591, 1.091425, 0, 1, 0.8156863, 1,
-0.0750433, -0.1019803, -1.523059, 0, 1, 0.8196079, 1,
-0.07406656, 0.8554101, -0.6674465, 0, 1, 0.827451, 1,
-0.0738348, -0.5556871, -4.012578, 0, 1, 0.8313726, 1,
-0.07249299, 0.006075297, -1.423514, 0, 1, 0.8392157, 1,
-0.06674997, 0.9064984, 0.4301787, 0, 1, 0.8431373, 1,
-0.06466126, -0.4522406, -4.144878, 0, 1, 0.8509804, 1,
-0.06409089, 1.367323, 1.655365, 0, 1, 0.854902, 1,
-0.06335805, -0.1737047, -4.190044, 0, 1, 0.8627451, 1,
-0.05736165, -0.08879702, -2.721266, 0, 1, 0.8666667, 1,
-0.0548181, 0.4246979, -2.101599, 0, 1, 0.8745098, 1,
-0.05329597, 0.09240577, -0.2849131, 0, 1, 0.8784314, 1,
-0.05303468, -1.40483, -3.465974, 0, 1, 0.8862745, 1,
-0.0518513, 0.1572594, 0.6707888, 0, 1, 0.8901961, 1,
-0.05004673, 2.217229, -1.947247, 0, 1, 0.8980392, 1,
-0.04933099, 0.4082268, -0.689275, 0, 1, 0.9058824, 1,
-0.0487908, 0.5606237, 0.2746654, 0, 1, 0.9098039, 1,
-0.04295303, 1.444396, 1.302803, 0, 1, 0.9176471, 1,
-0.04173502, 2.243072, 0.2985075, 0, 1, 0.9215686, 1,
-0.03887341, -0.1569196, -1.276425, 0, 1, 0.9294118, 1,
-0.03751631, 0.3604629, -0.1085221, 0, 1, 0.9333333, 1,
-0.03285208, -0.9625729, -2.763992, 0, 1, 0.9411765, 1,
-0.02990532, 1.222715, 2.207443, 0, 1, 0.945098, 1,
-0.02951524, 0.1991156, 0.1766383, 0, 1, 0.9529412, 1,
-0.0285351, 0.04084558, -1.119643, 0, 1, 0.9568627, 1,
-0.01628933, 1.033097, -0.3490572, 0, 1, 0.9647059, 1,
-0.01580206, -1.514615, -3.683541, 0, 1, 0.9686275, 1,
-0.01471998, 1.917464, -0.6588597, 0, 1, 0.9764706, 1,
-0.01305191, 1.396177, 0.2604526, 0, 1, 0.9803922, 1,
-0.01302412, -1.522449, -3.429669, 0, 1, 0.9882353, 1,
-0.009783477, 0.3048504, 0.4443223, 0, 1, 0.9921569, 1,
0.0002846868, -0.1417827, 3.580832, 0, 1, 1, 1,
0.001370071, -0.120043, 1.594721, 0, 0.9921569, 1, 1,
0.002572723, -0.3306229, 4.267334, 0, 0.9882353, 1, 1,
0.003455154, -0.4128197, 3.931785, 0, 0.9803922, 1, 1,
0.004478334, -1.082974, 1.772344, 0, 0.9764706, 1, 1,
0.004752222, -1.288035, 3.264287, 0, 0.9686275, 1, 1,
0.009900301, 0.7782842, 0.8457433, 0, 0.9647059, 1, 1,
0.01231205, 0.5490516, -0.2290098, 0, 0.9568627, 1, 1,
0.01484036, 0.2905805, -0.2237094, 0, 0.9529412, 1, 1,
0.01533675, 0.07315266, 0.5448018, 0, 0.945098, 1, 1,
0.01540207, -0.8091052, 2.684769, 0, 0.9411765, 1, 1,
0.02009839, 1.405482, -0.5295278, 0, 0.9333333, 1, 1,
0.02168306, 0.5485563, 0.09066437, 0, 0.9294118, 1, 1,
0.02397612, 0.4510793, 0.6593915, 0, 0.9215686, 1, 1,
0.02740195, -0.07693473, 4.281816, 0, 0.9176471, 1, 1,
0.0292521, 0.3439036, -0.4099112, 0, 0.9098039, 1, 1,
0.0313392, -1.436267, 4.238338, 0, 0.9058824, 1, 1,
0.03224665, 1.315833, 0.9914938, 0, 0.8980392, 1, 1,
0.03239781, -1.053855, 2.752307, 0, 0.8901961, 1, 1,
0.03593307, 0.08216851, -0.1033325, 0, 0.8862745, 1, 1,
0.03799715, -1.030909, 5.853066, 0, 0.8784314, 1, 1,
0.04221073, 0.2333991, 0.1732981, 0, 0.8745098, 1, 1,
0.05344181, -0.474273, 4.298511, 0, 0.8666667, 1, 1,
0.05526297, 0.5438697, 0.382241, 0, 0.8627451, 1, 1,
0.05778372, 0.07493122, 1.772, 0, 0.854902, 1, 1,
0.06041111, 0.4236034, 1.489134, 0, 0.8509804, 1, 1,
0.06098793, -0.3797368, 4.22003, 0, 0.8431373, 1, 1,
0.06301469, 1.483617, -0.1449912, 0, 0.8392157, 1, 1,
0.06375177, 1.078997, -1.262988, 0, 0.8313726, 1, 1,
0.06419563, -0.2817937, 2.630209, 0, 0.827451, 1, 1,
0.06451835, -1.008888, 2.126274, 0, 0.8196079, 1, 1,
0.06681062, -0.6756194, 3.21622, 0, 0.8156863, 1, 1,
0.06827457, 0.02084428, -0.1162557, 0, 0.8078431, 1, 1,
0.06969883, -0.2053649, 3.892032, 0, 0.8039216, 1, 1,
0.06995653, 0.566781, 0.6763897, 0, 0.7960784, 1, 1,
0.07032866, 0.4398697, 2.01738, 0, 0.7882353, 1, 1,
0.07390075, -0.06792932, 2.463941, 0, 0.7843137, 1, 1,
0.07597477, 0.2474072, 1.884535, 0, 0.7764706, 1, 1,
0.08196326, 0.66674, 0.8670548, 0, 0.772549, 1, 1,
0.08266191, -0.02774736, 3.318446, 0, 0.7647059, 1, 1,
0.08745975, -1.164996, 3.200427, 0, 0.7607843, 1, 1,
0.08835077, 0.03990916, 2.213473, 0, 0.7529412, 1, 1,
0.09211826, 0.1479727, 0.8599488, 0, 0.7490196, 1, 1,
0.09698172, 1.546456, 2.154187, 0, 0.7411765, 1, 1,
0.09723162, 1.431892, -1.388741, 0, 0.7372549, 1, 1,
0.09777263, 0.558663, -0.6175182, 0, 0.7294118, 1, 1,
0.09853107, -0.6757377, 3.053077, 0, 0.7254902, 1, 1,
0.1053817, 0.9123548, -0.1126415, 0, 0.7176471, 1, 1,
0.1067794, -0.07083911, 3.03079, 0, 0.7137255, 1, 1,
0.1103785, 0.7757053, -1.148018, 0, 0.7058824, 1, 1,
0.1117964, 0.1816763, 0.9175774, 0, 0.6980392, 1, 1,
0.1161824, 0.9799313, -0.005328761, 0, 0.6941177, 1, 1,
0.1177154, 0.5128845, -1.45445, 0, 0.6862745, 1, 1,
0.1189634, -0.4978726, 3.198564, 0, 0.682353, 1, 1,
0.1199406, -0.2008575, 1.810086, 0, 0.6745098, 1, 1,
0.1242512, 1.208807, -1.073219, 0, 0.6705883, 1, 1,
0.1248039, 0.7343331, 0.2364805, 0, 0.6627451, 1, 1,
0.129611, -1.230179, 5.265839, 0, 0.6588235, 1, 1,
0.1301832, 2.38124, -0.1205591, 0, 0.6509804, 1, 1,
0.1304862, -0.8551062, 3.254966, 0, 0.6470588, 1, 1,
0.1356958, -0.4215515, 1.775549, 0, 0.6392157, 1, 1,
0.1377075, 0.1833623, -0.27918, 0, 0.6352941, 1, 1,
0.138809, -0.8707896, 2.578092, 0, 0.627451, 1, 1,
0.1400478, 0.06066992, 0.3933664, 0, 0.6235294, 1, 1,
0.1463922, 0.5864441, 1.930163, 0, 0.6156863, 1, 1,
0.1477825, 0.773824, -0.1278061, 0, 0.6117647, 1, 1,
0.1484517, -0.4069318, 1.781698, 0, 0.6039216, 1, 1,
0.1486745, -2.000243, 2.937452, 0, 0.5960785, 1, 1,
0.1518618, 0.2607163, 0.9684656, 0, 0.5921569, 1, 1,
0.1555313, 1.709975, -0.2587464, 0, 0.5843138, 1, 1,
0.1559976, -0.8168035, 3.193818, 0, 0.5803922, 1, 1,
0.1589741, 0.1124955, 1.499405, 0, 0.572549, 1, 1,
0.1592951, 1.057974, -0.6363146, 0, 0.5686275, 1, 1,
0.1592982, -0.557314, 4.939485, 0, 0.5607843, 1, 1,
0.1606066, 1.438144, 0.3330943, 0, 0.5568628, 1, 1,
0.1638274, -0.412432, 2.367247, 0, 0.5490196, 1, 1,
0.1639851, 1.108119, 0.601549, 0, 0.5450981, 1, 1,
0.1640922, 2.356472, -0.9615741, 0, 0.5372549, 1, 1,
0.1667739, 2.421114, -1.039219, 0, 0.5333334, 1, 1,
0.1737491, -0.3309297, 4.530524, 0, 0.5254902, 1, 1,
0.17533, 1.241759, 0.9522104, 0, 0.5215687, 1, 1,
0.1777761, 0.1733265, 0.9070916, 0, 0.5137255, 1, 1,
0.1782667, 0.9696444, 2.363909, 0, 0.509804, 1, 1,
0.1795408, -0.9031765, 3.069976, 0, 0.5019608, 1, 1,
0.1799469, -0.278453, 2.844726, 0, 0.4941176, 1, 1,
0.1812296, -1.22032, 2.016885, 0, 0.4901961, 1, 1,
0.1815851, -0.148323, 3.385677, 0, 0.4823529, 1, 1,
0.1834632, 0.8933028, 0.2816276, 0, 0.4784314, 1, 1,
0.1874822, -1.060793, 3.676154, 0, 0.4705882, 1, 1,
0.1878952, -1.400173, 4.245436, 0, 0.4666667, 1, 1,
0.187951, 1.130092, 1.893866, 0, 0.4588235, 1, 1,
0.1882109, -0.7492805, 2.327055, 0, 0.454902, 1, 1,
0.1950868, -0.1719947, 2.083434, 0, 0.4470588, 1, 1,
0.2003893, -1.040456, 1.557807, 0, 0.4431373, 1, 1,
0.2016021, -0.5900253, 1.577328, 0, 0.4352941, 1, 1,
0.202053, -0.8391744, 3.848855, 0, 0.4313726, 1, 1,
0.2028673, 1.749507, -0.8117512, 0, 0.4235294, 1, 1,
0.2029094, 1.869467, -1.203501, 0, 0.4196078, 1, 1,
0.2054517, -0.01216855, 0.5257479, 0, 0.4117647, 1, 1,
0.2089224, -0.3444407, 0.2558321, 0, 0.4078431, 1, 1,
0.2209463, 0.1577572, -0.1516105, 0, 0.4, 1, 1,
0.221492, -0.8639725, 3.935022, 0, 0.3921569, 1, 1,
0.2225403, 0.08140733, -1.35408, 0, 0.3882353, 1, 1,
0.2256641, -0.7209361, 2.458339, 0, 0.3803922, 1, 1,
0.2258067, -0.9457408, 1.464682, 0, 0.3764706, 1, 1,
0.2294567, 0.4340087, -1.405736, 0, 0.3686275, 1, 1,
0.2322668, 0.5491108, 0.03315897, 0, 0.3647059, 1, 1,
0.2332449, 0.2318968, 0.6570613, 0, 0.3568628, 1, 1,
0.2398907, 0.6986315, 0.1585523, 0, 0.3529412, 1, 1,
0.2400846, 0.7605855, -0.7192603, 0, 0.345098, 1, 1,
0.242568, -0.06016916, 1.922022, 0, 0.3411765, 1, 1,
0.2444849, 0.5836153, 0.5169083, 0, 0.3333333, 1, 1,
0.2584721, -0.09766536, 0.6370805, 0, 0.3294118, 1, 1,
0.2588471, -0.2557357, 3.315074, 0, 0.3215686, 1, 1,
0.2604349, -1.258087, 3.139617, 0, 0.3176471, 1, 1,
0.2652698, -0.7723353, 1.061098, 0, 0.3098039, 1, 1,
0.2687108, -0.5810049, 1.670582, 0, 0.3058824, 1, 1,
0.2695192, 0.3763549, 0.3006435, 0, 0.2980392, 1, 1,
0.2700319, 0.6720424, 0.5286146, 0, 0.2901961, 1, 1,
0.2785294, 0.4620463, -0.3081563, 0, 0.2862745, 1, 1,
0.2841074, 1.088309, 0.4304298, 0, 0.2784314, 1, 1,
0.2861382, 0.5242348, 1.072753, 0, 0.2745098, 1, 1,
0.2866696, 0.5344515, 0.5064665, 0, 0.2666667, 1, 1,
0.2906354, 0.1327738, 2.029018, 0, 0.2627451, 1, 1,
0.2962123, -0.08540189, 0.3573681, 0, 0.254902, 1, 1,
0.2969885, -0.7634359, 2.475596, 0, 0.2509804, 1, 1,
0.2992148, -1.998037, 2.900695, 0, 0.2431373, 1, 1,
0.300502, 0.07537118, 2.263073, 0, 0.2392157, 1, 1,
0.3006765, 0.3682516, 0.8939269, 0, 0.2313726, 1, 1,
0.3013234, -1.222947, 2.683299, 0, 0.227451, 1, 1,
0.3023506, -1.321365, 3.162183, 0, 0.2196078, 1, 1,
0.3072127, 1.199493, 1.13633, 0, 0.2156863, 1, 1,
0.3102509, 0.7682236, -0.09455426, 0, 0.2078431, 1, 1,
0.3135404, -0.1363391, 3.683873, 0, 0.2039216, 1, 1,
0.3137186, -2.436742, 4.988292, 0, 0.1960784, 1, 1,
0.3141878, 0.8855939, -0.3445536, 0, 0.1882353, 1, 1,
0.3184543, -0.7679961, 3.329834, 0, 0.1843137, 1, 1,
0.3187478, -0.3363247, 2.840697, 0, 0.1764706, 1, 1,
0.3190599, -0.761887, 2.411248, 0, 0.172549, 1, 1,
0.3209157, 0.4425328, -0.412259, 0, 0.1647059, 1, 1,
0.3213409, -1.052522, 3.986884, 0, 0.1607843, 1, 1,
0.3226923, -1.738298, 2.788535, 0, 0.1529412, 1, 1,
0.3236424, -1.358911, 3.717676, 0, 0.1490196, 1, 1,
0.3237714, 0.2311077, 0.5782273, 0, 0.1411765, 1, 1,
0.3240039, 0.8188562, 1.098096, 0, 0.1372549, 1, 1,
0.3242419, -0.5002645, 2.889201, 0, 0.1294118, 1, 1,
0.3248033, -0.6181229, 2.752551, 0, 0.1254902, 1, 1,
0.3403142, 1.410674, 0.253763, 0, 0.1176471, 1, 1,
0.3415791, 1.101466, 1.36704, 0, 0.1137255, 1, 1,
0.3445591, 0.5519957, 0.9172951, 0, 0.1058824, 1, 1,
0.3535997, 0.7165256, -0.3993707, 0, 0.09803922, 1, 1,
0.3564734, 0.4233135, 0.7427135, 0, 0.09411765, 1, 1,
0.3600483, -0.6107394, 4.445142, 0, 0.08627451, 1, 1,
0.3605857, -0.6938477, 2.507517, 0, 0.08235294, 1, 1,
0.3617064, 0.4435366, -1.39096, 0, 0.07450981, 1, 1,
0.3634624, -0.1626574, 1.537744, 0, 0.07058824, 1, 1,
0.3635161, -1.543132, 3.087197, 0, 0.0627451, 1, 1,
0.3644943, 0.7311522, 0.7462453, 0, 0.05882353, 1, 1,
0.3657925, -1.072868, 2.694882, 0, 0.05098039, 1, 1,
0.3666313, 1.624151, -0.9122038, 0, 0.04705882, 1, 1,
0.3679201, 1.524296, 0.6622, 0, 0.03921569, 1, 1,
0.3721997, -2.390582, 3.960818, 0, 0.03529412, 1, 1,
0.3766505, 0.9309208, -0.8837662, 0, 0.02745098, 1, 1,
0.3800573, 0.2013977, 1.184215, 0, 0.02352941, 1, 1,
0.3823402, -2.597893, 4.738686, 0, 0.01568628, 1, 1,
0.3874114, 1.373738, -0.4294702, 0, 0.01176471, 1, 1,
0.3903286, 0.8667892, -0.2793705, 0, 0.003921569, 1, 1,
0.3945644, -0.7238132, 0.7678236, 0.003921569, 0, 1, 1,
0.3971941, -1.775442, 2.994452, 0.007843138, 0, 1, 1,
0.4000252, -1.052985, 2.070763, 0.01568628, 0, 1, 1,
0.4041107, -0.1317743, 1.520374, 0.01960784, 0, 1, 1,
0.4065627, 0.3671937, 1.865972, 0.02745098, 0, 1, 1,
0.4078818, -0.4320019, 1.063964, 0.03137255, 0, 1, 1,
0.4137617, -1.262818, 4.199966, 0.03921569, 0, 1, 1,
0.4142666, 0.5442654, 0.8453795, 0.04313726, 0, 1, 1,
0.4164232, -0.5980142, 2.527473, 0.05098039, 0, 1, 1,
0.4257265, 1.207119, 1.516258, 0.05490196, 0, 1, 1,
0.4267475, -0.2160124, 2.706454, 0.0627451, 0, 1, 1,
0.427374, -0.7282757, 3.464006, 0.06666667, 0, 1, 1,
0.432716, 0.8596359, 2.053877, 0.07450981, 0, 1, 1,
0.434749, -0.8958305, 1.901524, 0.07843138, 0, 1, 1,
0.4411261, -1.830741, 1.789288, 0.08627451, 0, 1, 1,
0.4411513, 1.522163, 1.838666, 0.09019608, 0, 1, 1,
0.4414557, -1.631855, 3.693094, 0.09803922, 0, 1, 1,
0.4436729, -0.8270299, 3.136724, 0.1058824, 0, 1, 1,
0.4486854, -1.633107, 1.889358, 0.1098039, 0, 1, 1,
0.4522263, 1.057403, -0.00280733, 0.1176471, 0, 1, 1,
0.4527056, 0.8283613, -0.4444709, 0.1215686, 0, 1, 1,
0.4555179, 0.1261132, 2.214782, 0.1294118, 0, 1, 1,
0.4596508, 0.8156016, 1.634066, 0.1333333, 0, 1, 1,
0.4623472, 1.151738, -0.3899064, 0.1411765, 0, 1, 1,
0.4700569, -0.6813918, 2.588295, 0.145098, 0, 1, 1,
0.4707564, 0.09809199, 0.6010488, 0.1529412, 0, 1, 1,
0.4734203, 0.1610685, 0.4155196, 0.1568628, 0, 1, 1,
0.475945, 1.00517, -1.192673, 0.1647059, 0, 1, 1,
0.4766439, -1.055075, 2.284587, 0.1686275, 0, 1, 1,
0.4773917, -2.303912, 1.675383, 0.1764706, 0, 1, 1,
0.4779797, 1.484797, 1.034604, 0.1803922, 0, 1, 1,
0.4806555, -1.184746, 2.78896, 0.1882353, 0, 1, 1,
0.4826086, 1.231712, 0.639123, 0.1921569, 0, 1, 1,
0.4836544, 1.398143, -0.2339744, 0.2, 0, 1, 1,
0.4923693, 0.5453448, 1.568195, 0.2078431, 0, 1, 1,
0.4937485, -0.6831877, 2.453344, 0.2117647, 0, 1, 1,
0.4991635, -0.2919192, 2.660916, 0.2196078, 0, 1, 1,
0.5030104, -1.483552, 2.153587, 0.2235294, 0, 1, 1,
0.503022, 1.004999, 0.2181964, 0.2313726, 0, 1, 1,
0.5063754, 1.777512, -1.389105, 0.2352941, 0, 1, 1,
0.5066583, 0.2424254, 0.4037775, 0.2431373, 0, 1, 1,
0.5075251, -1.173243, 2.88974, 0.2470588, 0, 1, 1,
0.5076334, 0.2786936, -0.6872728, 0.254902, 0, 1, 1,
0.5080421, 0.731133, 1.141405, 0.2588235, 0, 1, 1,
0.5106623, 1.217861, -0.8047327, 0.2666667, 0, 1, 1,
0.511535, -0.6174093, 3.971242, 0.2705882, 0, 1, 1,
0.5128061, 0.3017348, 0.3287966, 0.2784314, 0, 1, 1,
0.513411, 0.9302132, 1.767901, 0.282353, 0, 1, 1,
0.5169437, -1.451531, 2.406031, 0.2901961, 0, 1, 1,
0.5170883, -0.3801036, 2.557287, 0.2941177, 0, 1, 1,
0.5176377, 1.516792, 0.4823269, 0.3019608, 0, 1, 1,
0.5213796, -1.419066, 2.34183, 0.3098039, 0, 1, 1,
0.5218321, -0.8839304, 0.9637105, 0.3137255, 0, 1, 1,
0.5241151, -0.9138224, 4.108043, 0.3215686, 0, 1, 1,
0.5281925, -0.2144114, 2.593363, 0.3254902, 0, 1, 1,
0.5283285, 0.2368556, 1.082275, 0.3333333, 0, 1, 1,
0.5289007, 0.6809756, 0.8331576, 0.3372549, 0, 1, 1,
0.5330614, -0.295576, 1.849463, 0.345098, 0, 1, 1,
0.5344422, -0.6620266, 0.578153, 0.3490196, 0, 1, 1,
0.5362675, 0.1597794, 1.357932, 0.3568628, 0, 1, 1,
0.5366934, -0.7266435, 3.217877, 0.3607843, 0, 1, 1,
0.5497215, -0.3029625, 1.91073, 0.3686275, 0, 1, 1,
0.550163, -0.7531438, 1.867898, 0.372549, 0, 1, 1,
0.5516978, 0.4666078, 2.595469, 0.3803922, 0, 1, 1,
0.55975, -0.1462906, 0.9752573, 0.3843137, 0, 1, 1,
0.5625263, -0.5585843, 1.706374, 0.3921569, 0, 1, 1,
0.5718985, 0.5794067, -1.261786, 0.3960784, 0, 1, 1,
0.5727997, -0.309691, 3.185139, 0.4039216, 0, 1, 1,
0.5729326, -2.2292, 3.685405, 0.4117647, 0, 1, 1,
0.5733664, 0.6406767, 0.4029268, 0.4156863, 0, 1, 1,
0.5787376, 0.8634157, -0.1682332, 0.4235294, 0, 1, 1,
0.5882254, 1.353358, 1.383024, 0.427451, 0, 1, 1,
0.5908938, 0.08942651, 3.930709, 0.4352941, 0, 1, 1,
0.5939009, 0.7752166, 1.217768, 0.4392157, 0, 1, 1,
0.5989891, 1.338435, 0.4360911, 0.4470588, 0, 1, 1,
0.6020488, 0.7866412, 2.336738, 0.4509804, 0, 1, 1,
0.6029944, 0.9713095, 1.050752, 0.4588235, 0, 1, 1,
0.6034515, -0.502242, 2.710344, 0.4627451, 0, 1, 1,
0.6076763, 0.1020211, 0.01006104, 0.4705882, 0, 1, 1,
0.6088102, 0.2180978, 2.856982, 0.4745098, 0, 1, 1,
0.6101717, -0.1419849, 1.225298, 0.4823529, 0, 1, 1,
0.6106572, -1.040727, 1.518771, 0.4862745, 0, 1, 1,
0.613007, 0.473344, 1.803309, 0.4941176, 0, 1, 1,
0.6182274, -2.160524, 2.172022, 0.5019608, 0, 1, 1,
0.6197534, -0.5804973, 2.328534, 0.5058824, 0, 1, 1,
0.6217145, 0.164035, 2.204658, 0.5137255, 0, 1, 1,
0.6249661, 1.744589, 1.055481, 0.5176471, 0, 1, 1,
0.625768, -0.8620557, 2.104416, 0.5254902, 0, 1, 1,
0.6265323, 0.175411, 2.172296, 0.5294118, 0, 1, 1,
0.632391, 0.06912024, 1.281442, 0.5372549, 0, 1, 1,
0.6334828, -0.2676932, 3.153721, 0.5411765, 0, 1, 1,
0.6344541, 1.008693, -0.2285617, 0.5490196, 0, 1, 1,
0.6349407, 2.375193, 0.6666502, 0.5529412, 0, 1, 1,
0.6363891, -0.6181072, -0.6183715, 0.5607843, 0, 1, 1,
0.639125, 1.412068, 1.00121, 0.5647059, 0, 1, 1,
0.649661, 0.9793781, 0.1449591, 0.572549, 0, 1, 1,
0.6512585, 2.479169, -0.256805, 0.5764706, 0, 1, 1,
0.6523293, -0.7759615, 2.582784, 0.5843138, 0, 1, 1,
0.6751816, 0.6177362, 0.0002159789, 0.5882353, 0, 1, 1,
0.6796222, 0.4831875, 0.7723442, 0.5960785, 0, 1, 1,
0.6799703, 2.150777, -0.3228984, 0.6039216, 0, 1, 1,
0.6822966, 0.8576407, 0.9367647, 0.6078432, 0, 1, 1,
0.6823841, 1.283033, -0.146201, 0.6156863, 0, 1, 1,
0.6849037, -0.2508548, 2.02117, 0.6196079, 0, 1, 1,
0.6865279, 1.423228, 1.550336, 0.627451, 0, 1, 1,
0.6919784, 0.1993972, 1.302666, 0.6313726, 0, 1, 1,
0.6924606, 0.4218175, 0.5721095, 0.6392157, 0, 1, 1,
0.6943522, 0.3851673, 0.2431125, 0.6431373, 0, 1, 1,
0.7000992, -0.1536851, 2.146796, 0.6509804, 0, 1, 1,
0.7013667, -0.3906848, 2.989794, 0.654902, 0, 1, 1,
0.7050533, -1.421375, 3.048058, 0.6627451, 0, 1, 1,
0.7079404, 1.080524, 1.98684, 0.6666667, 0, 1, 1,
0.7141911, 0.5293346, 1.935657, 0.6745098, 0, 1, 1,
0.7152171, -1.369133, 0.4988953, 0.6784314, 0, 1, 1,
0.7159393, 1.595475, -0.1997229, 0.6862745, 0, 1, 1,
0.7159454, 0.233501, 0.6204234, 0.6901961, 0, 1, 1,
0.7191013, 1.319299, -0.02107309, 0.6980392, 0, 1, 1,
0.7212833, -0.4836347, 0.5180059, 0.7058824, 0, 1, 1,
0.7253741, 0.1781441, -0.3704712, 0.7098039, 0, 1, 1,
0.731593, 1.843601, 1.343634, 0.7176471, 0, 1, 1,
0.7330166, -0.4066297, 2.569543, 0.7215686, 0, 1, 1,
0.7365144, 2.157674, 1.904817, 0.7294118, 0, 1, 1,
0.7429103, 0.8856635, 1.160053, 0.7333333, 0, 1, 1,
0.7474612, 0.1260432, 1.275113, 0.7411765, 0, 1, 1,
0.7488323, -0.8187717, 2.230011, 0.7450981, 0, 1, 1,
0.7698995, -1.645217, 2.103793, 0.7529412, 0, 1, 1,
0.7732705, 0.2998641, 1.302717, 0.7568628, 0, 1, 1,
0.7861322, 2.556759, 1.481263, 0.7647059, 0, 1, 1,
0.7944294, -0.6611701, 1.869244, 0.7686275, 0, 1, 1,
0.8017805, -0.3039403, 1.971907, 0.7764706, 0, 1, 1,
0.8040575, 0.137122, 1.468471, 0.7803922, 0, 1, 1,
0.8095238, 0.4754429, 0.8535105, 0.7882353, 0, 1, 1,
0.8098917, 1.921908, -1.446399, 0.7921569, 0, 1, 1,
0.8107829, -0.7209841, 3.116914, 0.8, 0, 1, 1,
0.8170297, -0.1696239, 2.843846, 0.8078431, 0, 1, 1,
0.8233463, 0.251027, 0.8217878, 0.8117647, 0, 1, 1,
0.8250255, 1.227021, 0.1104889, 0.8196079, 0, 1, 1,
0.8290066, -0.1553898, 0.3022849, 0.8235294, 0, 1, 1,
0.8374445, 0.8437557, 1.351564, 0.8313726, 0, 1, 1,
0.8386693, -0.683546, 2.368206, 0.8352941, 0, 1, 1,
0.8388436, -1.263451, 4.051895, 0.8431373, 0, 1, 1,
0.8429579, 0.567682, 0.9968853, 0.8470588, 0, 1, 1,
0.8528776, 1.63238, 0.2017031, 0.854902, 0, 1, 1,
0.8577641, -0.2107749, 3.148574, 0.8588235, 0, 1, 1,
0.8748416, 0.8432634, 2.689327, 0.8666667, 0, 1, 1,
0.8805215, -0.4151576, 1.62871, 0.8705882, 0, 1, 1,
0.8892896, -1.01517, 1.767661, 0.8784314, 0, 1, 1,
0.8995955, 1.210702, 1.092057, 0.8823529, 0, 1, 1,
0.9082333, -0.2559071, 2.771307, 0.8901961, 0, 1, 1,
0.9117482, -0.0561605, 3.950502, 0.8941177, 0, 1, 1,
0.9134228, 0.7412472, 0.115496, 0.9019608, 0, 1, 1,
0.9166422, -0.1231996, 0.6571066, 0.9098039, 0, 1, 1,
0.9261156, 0.6697556, 2.047978, 0.9137255, 0, 1, 1,
0.9325129, -0.8394643, 2.319774, 0.9215686, 0, 1, 1,
0.9459097, 0.7761893, 1.038868, 0.9254902, 0, 1, 1,
0.9460136, 3.054545, -0.281229, 0.9333333, 0, 1, 1,
0.9622505, 0.08277403, 2.652074, 0.9372549, 0, 1, 1,
0.9710885, 0.8646424, 0.1666785, 0.945098, 0, 1, 1,
0.9718394, 1.317514, 1.641693, 0.9490196, 0, 1, 1,
0.9749572, -0.6945485, 4.576375, 0.9568627, 0, 1, 1,
0.9787524, 0.6845237, 0.713408, 0.9607843, 0, 1, 1,
0.9803709, -0.7394826, 2.795748, 0.9686275, 0, 1, 1,
0.9829796, -0.3420263, 1.044075, 0.972549, 0, 1, 1,
0.9849479, 0.2715664, 1.579068, 0.9803922, 0, 1, 1,
0.9920079, -0.2206502, -0.953661, 0.9843137, 0, 1, 1,
0.9932833, 0.4219147, 0.1290897, 0.9921569, 0, 1, 1,
0.998309, 0.5069042, 1.121415, 0.9960784, 0, 1, 1,
1.012403, -0.4270048, 0.2198368, 1, 0, 0.9960784, 1,
1.012408, 2.082555, 0.5919222, 1, 0, 0.9882353, 1,
1.013932, 1.17764, 1.082587, 1, 0, 0.9843137, 1,
1.022797, -0.3083007, 2.802879, 1, 0, 0.9764706, 1,
1.023396, -0.260614, 3.152262, 1, 0, 0.972549, 1,
1.026577, 0.4541573, 0.290616, 1, 0, 0.9647059, 1,
1.029568, 0.9774746, 1.976381, 1, 0, 0.9607843, 1,
1.034549, -0.8722419, 1.375386, 1, 0, 0.9529412, 1,
1.039778, 0.1953142, 3.632934, 1, 0, 0.9490196, 1,
1.041101, 0.5589382, 0.2704205, 1, 0, 0.9411765, 1,
1.043193, 1.174518, 0.3221106, 1, 0, 0.9372549, 1,
1.045169, -0.1357967, 3.177641, 1, 0, 0.9294118, 1,
1.055588, 0.8435996, -0.9973409, 1, 0, 0.9254902, 1,
1.060427, -0.3226129, 1.59455, 1, 0, 0.9176471, 1,
1.064761, 1.180903, -0.0379709, 1, 0, 0.9137255, 1,
1.068342, 0.5282057, 3.136517, 1, 0, 0.9058824, 1,
1.07447, -1.103561, 1.405563, 1, 0, 0.9019608, 1,
1.082541, 0.8367838, 2.294257, 1, 0, 0.8941177, 1,
1.0828, -1.951831, 0.9081743, 1, 0, 0.8862745, 1,
1.089874, 0.5009271, 1.493464, 1, 0, 0.8823529, 1,
1.096588, -0.1934649, -0.4269923, 1, 0, 0.8745098, 1,
1.097229, -1.182204, 3.520925, 1, 0, 0.8705882, 1,
1.104527, 1.184219, -0.2806583, 1, 0, 0.8627451, 1,
1.106026, 0.5500515, 1.010891, 1, 0, 0.8588235, 1,
1.117826, 0.9483415, 1.171347, 1, 0, 0.8509804, 1,
1.118575, 0.07205322, 0.6808031, 1, 0, 0.8470588, 1,
1.124939, -1.357483, 1.023065, 1, 0, 0.8392157, 1,
1.130862, 1.714016, 1.845729, 1, 0, 0.8352941, 1,
1.133204, 0.886009, 0.4085662, 1, 0, 0.827451, 1,
1.135712, 0.788725, 2.310148, 1, 0, 0.8235294, 1,
1.137201, 0.6911495, -0.2216438, 1, 0, 0.8156863, 1,
1.140016, -0.5263667, 0.7042969, 1, 0, 0.8117647, 1,
1.147463, -0.6999451, 1.883293, 1, 0, 0.8039216, 1,
1.157614, 1.108751, 1.733683, 1, 0, 0.7960784, 1,
1.15783, 0.5779704, 0.7719907, 1, 0, 0.7921569, 1,
1.15823, -0.9995921, 2.503618, 1, 0, 0.7843137, 1,
1.165597, 0.1842374, 1.177534, 1, 0, 0.7803922, 1,
1.173422, 1.245586, 1.732221, 1, 0, 0.772549, 1,
1.174389, 0.6233149, 0.6119906, 1, 0, 0.7686275, 1,
1.181951, 0.09815873, 1.830916, 1, 0, 0.7607843, 1,
1.182176, 0.2015736, 0.9832854, 1, 0, 0.7568628, 1,
1.18224, -0.3676426, 0.5106473, 1, 0, 0.7490196, 1,
1.184268, 0.4076715, 2.21355, 1, 0, 0.7450981, 1,
1.187183, 0.7736082, 1.049876, 1, 0, 0.7372549, 1,
1.192335, -1.054121, 1.845773, 1, 0, 0.7333333, 1,
1.193395, -1.504022, 1.766512, 1, 0, 0.7254902, 1,
1.195467, 0.2549974, -0.4045025, 1, 0, 0.7215686, 1,
1.201386, -0.4863745, 0.6591207, 1, 0, 0.7137255, 1,
1.212463, -0.5263515, 2.888035, 1, 0, 0.7098039, 1,
1.213593, -0.2541648, 2.065445, 1, 0, 0.7019608, 1,
1.23817, -0.744511, 1.063498, 1, 0, 0.6941177, 1,
1.240209, -0.7315427, 2.755339, 1, 0, 0.6901961, 1,
1.240216, 0.3515333, 1.446118, 1, 0, 0.682353, 1,
1.240381, -0.8672457, 4.122682, 1, 0, 0.6784314, 1,
1.240525, -0.5856822, -1.021156, 1, 0, 0.6705883, 1,
1.247145, -0.130952, 2.151382, 1, 0, 0.6666667, 1,
1.248629, 1.852517, 1.054204, 1, 0, 0.6588235, 1,
1.253735, -0.1386233, 1.397255, 1, 0, 0.654902, 1,
1.258536, -0.6841446, 4.196728, 1, 0, 0.6470588, 1,
1.273573, 0.7501557, 1.918673, 1, 0, 0.6431373, 1,
1.278799, -0.724956, 2.229801, 1, 0, 0.6352941, 1,
1.284736, -0.7446762, 1.117612, 1, 0, 0.6313726, 1,
1.297508, 0.3183402, 3.014246, 1, 0, 0.6235294, 1,
1.299897, 0.3310985, -0.5315836, 1, 0, 0.6196079, 1,
1.302724, -0.4442298, 0.988329, 1, 0, 0.6117647, 1,
1.304822, -1.612043, 3.737537, 1, 0, 0.6078432, 1,
1.310165, 0.5390127, 1.247006, 1, 0, 0.6, 1,
1.314971, 1.207021, 0.4938096, 1, 0, 0.5921569, 1,
1.31724, 0.3894226, 2.404229, 1, 0, 0.5882353, 1,
1.317248, 1.155133, 0.1581926, 1, 0, 0.5803922, 1,
1.31796, 0.5132083, 0.327914, 1, 0, 0.5764706, 1,
1.323323, -1.30911, 3.370932, 1, 0, 0.5686275, 1,
1.324947, -1.11063, 2.9992, 1, 0, 0.5647059, 1,
1.325038, 0.5716969, 1.678573, 1, 0, 0.5568628, 1,
1.325097, -0.06040504, 0.899296, 1, 0, 0.5529412, 1,
1.331991, 0.4877193, 2.278085, 1, 0, 0.5450981, 1,
1.334105, -0.1672963, 0.8939242, 1, 0, 0.5411765, 1,
1.336379, 0.1825117, 1.248624, 1, 0, 0.5333334, 1,
1.33856, -1.226678, 2.523331, 1, 0, 0.5294118, 1,
1.345322, 0.8759297, 0.8628588, 1, 0, 0.5215687, 1,
1.347839, 1.044526, 0.6645859, 1, 0, 0.5176471, 1,
1.35091, -0.8289607, 3.101451, 1, 0, 0.509804, 1,
1.351958, -0.3091851, 2.232486, 1, 0, 0.5058824, 1,
1.360479, -0.4797046, 3.150312, 1, 0, 0.4980392, 1,
1.364771, -0.4381867, 1.664939, 1, 0, 0.4901961, 1,
1.377333, 0.6718723, -0.05304279, 1, 0, 0.4862745, 1,
1.392457, -0.8638573, 1.99563, 1, 0, 0.4784314, 1,
1.403119, 0.04833799, 2.178022, 1, 0, 0.4745098, 1,
1.403582, 1.862688, -0.3404085, 1, 0, 0.4666667, 1,
1.410605, -2.317671, 3.068189, 1, 0, 0.4627451, 1,
1.416217, -0.5185, 1.284045, 1, 0, 0.454902, 1,
1.424515, -0.1870886, 1.588008, 1, 0, 0.4509804, 1,
1.43472, -0.5784794, 3.282382, 1, 0, 0.4431373, 1,
1.437156, 0.6916125, 1.043118, 1, 0, 0.4392157, 1,
1.445206, 0.835954, 0.9670384, 1, 0, 0.4313726, 1,
1.445873, -0.1652286, 0.8147755, 1, 0, 0.427451, 1,
1.447537, 0.5694028, 1.372422, 1, 0, 0.4196078, 1,
1.457512, 0.4853042, 2.27389, 1, 0, 0.4156863, 1,
1.469632, 1.540592, 1.61962, 1, 0, 0.4078431, 1,
1.473255, 0.2877117, 0.3902594, 1, 0, 0.4039216, 1,
1.480888, 1.161489, -2.025096, 1, 0, 0.3960784, 1,
1.487731, 0.6955144, 3.041135, 1, 0, 0.3882353, 1,
1.499407, -1.000621, 1.544051, 1, 0, 0.3843137, 1,
1.532323, -0.1357238, 0.4416928, 1, 0, 0.3764706, 1,
1.549258, -0.4385985, 1.637637, 1, 0, 0.372549, 1,
1.558563, 0.6206946, 0.5942163, 1, 0, 0.3647059, 1,
1.55917, 0.8318927, -0.8253985, 1, 0, 0.3607843, 1,
1.585146, 1.409536, 0.8849298, 1, 0, 0.3529412, 1,
1.59856, -1.958948, 2.559504, 1, 0, 0.3490196, 1,
1.599585, 0.09494244, 1.063868, 1, 0, 0.3411765, 1,
1.618157, 1.115017, 1.572068, 1, 0, 0.3372549, 1,
1.622084, 1.420982, 0.7825054, 1, 0, 0.3294118, 1,
1.622618, 0.7359052, 1.597669, 1, 0, 0.3254902, 1,
1.629468, 0.3187903, 1.146344, 1, 0, 0.3176471, 1,
1.642379, 0.4907185, 1.18093, 1, 0, 0.3137255, 1,
1.660493, -2.530217, 2.346671, 1, 0, 0.3058824, 1,
1.661662, -0.48416, 4.679385, 1, 0, 0.2980392, 1,
1.66372, 0.7330348, -0.2246142, 1, 0, 0.2941177, 1,
1.663957, -1.190502, 0.890587, 1, 0, 0.2862745, 1,
1.683797, -1.913726, 2.252867, 1, 0, 0.282353, 1,
1.703625, -0.7451509, 2.938451, 1, 0, 0.2745098, 1,
1.708884, -1.014581, 4.606073, 1, 0, 0.2705882, 1,
1.715379, 0.4752753, 4.577035, 1, 0, 0.2627451, 1,
1.717274, -1.418491, 2.040878, 1, 0, 0.2588235, 1,
1.717786, 1.281935, 2.408033, 1, 0, 0.2509804, 1,
1.721641, 0.572883, -0.1340804, 1, 0, 0.2470588, 1,
1.72281, 2.189946, -0.7154053, 1, 0, 0.2392157, 1,
1.725295, -0.06397127, 1.597144, 1, 0, 0.2352941, 1,
1.744638, -2.664596, 4.275524, 1, 0, 0.227451, 1,
1.751834, 0.5100272, 1.366307, 1, 0, 0.2235294, 1,
1.770519, -0.9237221, 3.374223, 1, 0, 0.2156863, 1,
1.777329, -1.497696, 2.146093, 1, 0, 0.2117647, 1,
1.794775, 0.780879, 2.05668, 1, 0, 0.2039216, 1,
1.797589, -1.157923, 1.210349, 1, 0, 0.1960784, 1,
1.812036, -0.6870829, 1.489771, 1, 0, 0.1921569, 1,
1.831859, 1.486804, 0.1610114, 1, 0, 0.1843137, 1,
1.834898, 1.182472, -0.6978455, 1, 0, 0.1803922, 1,
1.840692, 1.069778, 0.2741563, 1, 0, 0.172549, 1,
1.841972, -0.9239188, 2.145661, 1, 0, 0.1686275, 1,
1.848242, -0.3566813, 1.052501, 1, 0, 0.1607843, 1,
1.855271, -0.7805254, 2.59847, 1, 0, 0.1568628, 1,
1.887169, -1.054278, 2.554045, 1, 0, 0.1490196, 1,
1.897329, -1.593381, 0.9277794, 1, 0, 0.145098, 1,
1.962266, 1.222213, 1.446086, 1, 0, 0.1372549, 1,
1.966517, 0.441576, 2.379866, 1, 0, 0.1333333, 1,
1.987125, -0.913975, 2.121829, 1, 0, 0.1254902, 1,
2.00536, -1.25611, 0.5492619, 1, 0, 0.1215686, 1,
2.052687, -0.434883, 0.636059, 1, 0, 0.1137255, 1,
2.055653, -0.8615386, 5.530992, 1, 0, 0.1098039, 1,
2.060747, 0.9793961, 1.403173, 1, 0, 0.1019608, 1,
2.082012, -0.7936516, 3.661292, 1, 0, 0.09411765, 1,
2.090633, -0.131131, 1.217109, 1, 0, 0.09019608, 1,
2.105762, 0.5318695, -0.6090217, 1, 0, 0.08235294, 1,
2.123152, 1.082734, -0.5956751, 1, 0, 0.07843138, 1,
2.128307, 1.025062, 2.613144, 1, 0, 0.07058824, 1,
2.169332, 0.5561229, 1.387511, 1, 0, 0.06666667, 1,
2.17788, -0.001860307, 1.79247, 1, 0, 0.05882353, 1,
2.187041, 2.696998, -1.009652, 1, 0, 0.05490196, 1,
2.18762, 0.8869987, 2.380429, 1, 0, 0.04705882, 1,
2.235253, 1.137079, 0.8843223, 1, 0, 0.04313726, 1,
2.31635, -0.4095271, 0.06071104, 1, 0, 0.03529412, 1,
2.370529, 0.394036, 3.70029, 1, 0, 0.03137255, 1,
2.480563, -1.169158, 1.864932, 1, 0, 0.02352941, 1,
2.531797, -0.9676265, 2.348301, 1, 0, 0.01960784, 1,
2.553203, -0.09469252, 1.970845, 1, 0, 0.01176471, 1,
2.598348, -1.645051, 2.743627, 1, 0, 0.007843138, 1
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
-0.07703066, -4.314913, -6.783195, 0, -0.5, 0.5, 0.5,
-0.07703066, -4.314913, -6.783195, 1, -0.5, 0.5, 0.5,
-0.07703066, -4.314913, -6.783195, 1, 1.5, 0.5, 0.5,
-0.07703066, -4.314913, -6.783195, 0, 1.5, 0.5, 0.5
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
-3.659363, -0.09614241, -6.783195, 0, -0.5, 0.5, 0.5,
-3.659363, -0.09614241, -6.783195, 1, -0.5, 0.5, 0.5,
-3.659363, -0.09614241, -6.783195, 1, 1.5, 0.5, 0.5,
-3.659363, -0.09614241, -6.783195, 0, 1.5, 0.5, 0.5
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
-3.659363, -4.314913, 0.4506454, 0, -0.5, 0.5, 0.5,
-3.659363, -4.314913, 0.4506454, 1, -0.5, 0.5, 0.5,
-3.659363, -4.314913, 0.4506454, 1, 1.5, 0.5, 0.5,
-3.659363, -4.314913, 0.4506454, 0, 1.5, 0.5, 0.5
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
-2, -3.34135, -5.113848,
2, -3.34135, -5.113848,
-2, -3.34135, -5.113848,
-2, -3.503611, -5.392072,
-1, -3.34135, -5.113848,
-1, -3.503611, -5.392072,
0, -3.34135, -5.113848,
0, -3.503611, -5.392072,
1, -3.34135, -5.113848,
1, -3.503611, -5.392072,
2, -3.34135, -5.113848,
2, -3.503611, -5.392072
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
-2, -3.828132, -5.948522, 0, -0.5, 0.5, 0.5,
-2, -3.828132, -5.948522, 1, -0.5, 0.5, 0.5,
-2, -3.828132, -5.948522, 1, 1.5, 0.5, 0.5,
-2, -3.828132, -5.948522, 0, 1.5, 0.5, 0.5,
-1, -3.828132, -5.948522, 0, -0.5, 0.5, 0.5,
-1, -3.828132, -5.948522, 1, -0.5, 0.5, 0.5,
-1, -3.828132, -5.948522, 1, 1.5, 0.5, 0.5,
-1, -3.828132, -5.948522, 0, 1.5, 0.5, 0.5,
0, -3.828132, -5.948522, 0, -0.5, 0.5, 0.5,
0, -3.828132, -5.948522, 1, -0.5, 0.5, 0.5,
0, -3.828132, -5.948522, 1, 1.5, 0.5, 0.5,
0, -3.828132, -5.948522, 0, 1.5, 0.5, 0.5,
1, -3.828132, -5.948522, 0, -0.5, 0.5, 0.5,
1, -3.828132, -5.948522, 1, -0.5, 0.5, 0.5,
1, -3.828132, -5.948522, 1, 1.5, 0.5, 0.5,
1, -3.828132, -5.948522, 0, 1.5, 0.5, 0.5,
2, -3.828132, -5.948522, 0, -0.5, 0.5, 0.5,
2, -3.828132, -5.948522, 1, -0.5, 0.5, 0.5,
2, -3.828132, -5.948522, 1, 1.5, 0.5, 0.5,
2, -3.828132, -5.948522, 0, 1.5, 0.5, 0.5
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
-2.832671, -3, -5.113848,
-2.832671, 3, -5.113848,
-2.832671, -3, -5.113848,
-2.970453, -3, -5.392072,
-2.832671, -2, -5.113848,
-2.970453, -2, -5.392072,
-2.832671, -1, -5.113848,
-2.970453, -1, -5.392072,
-2.832671, 0, -5.113848,
-2.970453, 0, -5.392072,
-2.832671, 1, -5.113848,
-2.970453, 1, -5.392072,
-2.832671, 2, -5.113848,
-2.970453, 2, -5.392072,
-2.832671, 3, -5.113848,
-2.970453, 3, -5.392072
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
-3.246017, -3, -5.948522, 0, -0.5, 0.5, 0.5,
-3.246017, -3, -5.948522, 1, -0.5, 0.5, 0.5,
-3.246017, -3, -5.948522, 1, 1.5, 0.5, 0.5,
-3.246017, -3, -5.948522, 0, 1.5, 0.5, 0.5,
-3.246017, -2, -5.948522, 0, -0.5, 0.5, 0.5,
-3.246017, -2, -5.948522, 1, -0.5, 0.5, 0.5,
-3.246017, -2, -5.948522, 1, 1.5, 0.5, 0.5,
-3.246017, -2, -5.948522, 0, 1.5, 0.5, 0.5,
-3.246017, -1, -5.948522, 0, -0.5, 0.5, 0.5,
-3.246017, -1, -5.948522, 1, -0.5, 0.5, 0.5,
-3.246017, -1, -5.948522, 1, 1.5, 0.5, 0.5,
-3.246017, -1, -5.948522, 0, 1.5, 0.5, 0.5,
-3.246017, 0, -5.948522, 0, -0.5, 0.5, 0.5,
-3.246017, 0, -5.948522, 1, -0.5, 0.5, 0.5,
-3.246017, 0, -5.948522, 1, 1.5, 0.5, 0.5,
-3.246017, 0, -5.948522, 0, 1.5, 0.5, 0.5,
-3.246017, 1, -5.948522, 0, -0.5, 0.5, 0.5,
-3.246017, 1, -5.948522, 1, -0.5, 0.5, 0.5,
-3.246017, 1, -5.948522, 1, 1.5, 0.5, 0.5,
-3.246017, 1, -5.948522, 0, 1.5, 0.5, 0.5,
-3.246017, 2, -5.948522, 0, -0.5, 0.5, 0.5,
-3.246017, 2, -5.948522, 1, -0.5, 0.5, 0.5,
-3.246017, 2, -5.948522, 1, 1.5, 0.5, 0.5,
-3.246017, 2, -5.948522, 0, 1.5, 0.5, 0.5,
-3.246017, 3, -5.948522, 0, -0.5, 0.5, 0.5,
-3.246017, 3, -5.948522, 1, -0.5, 0.5, 0.5,
-3.246017, 3, -5.948522, 1, 1.5, 0.5, 0.5,
-3.246017, 3, -5.948522, 0, 1.5, 0.5, 0.5
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
-2.832671, -3.34135, -4,
-2.832671, -3.34135, 4,
-2.832671, -3.34135, -4,
-2.970453, -3.503611, -4,
-2.832671, -3.34135, -2,
-2.970453, -3.503611, -2,
-2.832671, -3.34135, 0,
-2.970453, -3.503611, 0,
-2.832671, -3.34135, 2,
-2.970453, -3.503611, 2,
-2.832671, -3.34135, 4,
-2.970453, -3.503611, 4
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
-3.246017, -3.828132, -4, 0, -0.5, 0.5, 0.5,
-3.246017, -3.828132, -4, 1, -0.5, 0.5, 0.5,
-3.246017, -3.828132, -4, 1, 1.5, 0.5, 0.5,
-3.246017, -3.828132, -4, 0, 1.5, 0.5, 0.5,
-3.246017, -3.828132, -2, 0, -0.5, 0.5, 0.5,
-3.246017, -3.828132, -2, 1, -0.5, 0.5, 0.5,
-3.246017, -3.828132, -2, 1, 1.5, 0.5, 0.5,
-3.246017, -3.828132, -2, 0, 1.5, 0.5, 0.5,
-3.246017, -3.828132, 0, 0, -0.5, 0.5, 0.5,
-3.246017, -3.828132, 0, 1, -0.5, 0.5, 0.5,
-3.246017, -3.828132, 0, 1, 1.5, 0.5, 0.5,
-3.246017, -3.828132, 0, 0, 1.5, 0.5, 0.5,
-3.246017, -3.828132, 2, 0, -0.5, 0.5, 0.5,
-3.246017, -3.828132, 2, 1, -0.5, 0.5, 0.5,
-3.246017, -3.828132, 2, 1, 1.5, 0.5, 0.5,
-3.246017, -3.828132, 2, 0, 1.5, 0.5, 0.5,
-3.246017, -3.828132, 4, 0, -0.5, 0.5, 0.5,
-3.246017, -3.828132, 4, 1, -0.5, 0.5, 0.5,
-3.246017, -3.828132, 4, 1, 1.5, 0.5, 0.5,
-3.246017, -3.828132, 4, 0, 1.5, 0.5, 0.5
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
-2.832671, -3.34135, -5.113848,
-2.832671, 3.149065, -5.113848,
-2.832671, -3.34135, 6.015139,
-2.832671, 3.149065, 6.015139,
-2.832671, -3.34135, -5.113848,
-2.832671, -3.34135, 6.015139,
-2.832671, 3.149065, -5.113848,
-2.832671, 3.149065, 6.015139,
-2.832671, -3.34135, -5.113848,
2.67861, -3.34135, -5.113848,
-2.832671, -3.34135, 6.015139,
2.67861, -3.34135, 6.015139,
-2.832671, 3.149065, -5.113848,
2.67861, 3.149065, -5.113848,
-2.832671, 3.149065, 6.015139,
2.67861, 3.149065, 6.015139,
2.67861, -3.34135, -5.113848,
2.67861, 3.149065, -5.113848,
2.67861, -3.34135, 6.015139,
2.67861, 3.149065, 6.015139,
2.67861, -3.34135, -5.113848,
2.67861, -3.34135, 6.015139,
2.67861, 3.149065, -5.113848,
2.67861, 3.149065, 6.015139
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
var radius = 7.482477;
var distance = 33.29039;
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
mvMatrix.translate( 0.07703066, 0.09614241, -0.4506454 );
mvMatrix.scale( 1.467935, 1.246484, 0.7269486 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.29039);
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
Ekatin<-read.table("Ekatin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.75241, 1.824706, 0.1094493, 0, 0, 1, 1, 1,
-2.722, 1.601006, -2.478789, 1, 0, 0, 1, 1,
-2.708139, -1.387052, -3.849738, 1, 0, 0, 1, 1,
-2.652408, -0.6099955, -2.775182, 1, 0, 0, 1, 1,
-2.543764, 0.6126979, -1.023045, 1, 0, 0, 1, 1,
-2.521638, 0.04101866, -2.239228, 1, 0, 0, 1, 1,
-2.515685, 0.8244292, -0.8126111, 0, 0, 0, 1, 1,
-2.459378, -0.2532245, 0.02564196, 0, 0, 0, 1, 1,
-2.403886, 0.360866, -0.7921537, 0, 0, 0, 1, 1,
-2.368632, -1.738408, -1.361151, 0, 0, 0, 1, 1,
-2.3529, 0.2854855, -3.113671, 0, 0, 0, 1, 1,
-2.305459, -0.495543, -1.20738, 0, 0, 0, 1, 1,
-2.298839, 0.3817212, -1.912125, 0, 0, 0, 1, 1,
-2.265077, 1.470513, -1.02229, 1, 1, 1, 1, 1,
-2.211711, 1.216892, -3.533821, 1, 1, 1, 1, 1,
-2.210028, 0.00492509, 0.08466127, 1, 1, 1, 1, 1,
-2.20788, -0.1102346, -3.03028, 1, 1, 1, 1, 1,
-2.19024, -0.3677106, -2.951156, 1, 1, 1, 1, 1,
-2.169249, -1.542189, -3.198617, 1, 1, 1, 1, 1,
-2.162446, 0.8112751, -2.706697, 1, 1, 1, 1, 1,
-2.064092, -1.050364, -1.141185, 1, 1, 1, 1, 1,
-2.056306, 0.3805022, -2.630252, 1, 1, 1, 1, 1,
-2.055047, 0.8782749, -2.013265, 1, 1, 1, 1, 1,
-2.037902, -2.523039, -2.567594, 1, 1, 1, 1, 1,
-1.997702, 0.09494498, -3.432785, 1, 1, 1, 1, 1,
-1.990162, -1.983393, -2.501502, 1, 1, 1, 1, 1,
-1.964327, 0.405144, -0.9083823, 1, 1, 1, 1, 1,
-1.951051, 0.07503559, -0.3120311, 1, 1, 1, 1, 1,
-1.949801, 0.2055105, 0.129311, 0, 0, 1, 1, 1,
-1.936936, 0.4684049, -0.8979219, 1, 0, 0, 1, 1,
-1.932117, 1.078974, -0.1369527, 1, 0, 0, 1, 1,
-1.930781, -0.407594, -2.889037, 1, 0, 0, 1, 1,
-1.925667, -0.165916, -0.3457735, 1, 0, 0, 1, 1,
-1.897771, 0.0498598, 0.3438123, 1, 0, 0, 1, 1,
-1.866384, 0.8180479, -2.164614, 0, 0, 0, 1, 1,
-1.864262, 0.4491043, -0.5597771, 0, 0, 0, 1, 1,
-1.80568, -1.114538, -0.8728613, 0, 0, 0, 1, 1,
-1.795425, 0.4265215, -1.675055, 0, 0, 0, 1, 1,
-1.794065, -1.294151, -2.397748, 0, 0, 0, 1, 1,
-1.785617, -0.492028, -1.230474, 0, 0, 0, 1, 1,
-1.760459, 0.7395276, -0.8131779, 0, 0, 0, 1, 1,
-1.757508, 0.1112658, -2.249189, 1, 1, 1, 1, 1,
-1.731768, 0.5818591, -0.8586466, 1, 1, 1, 1, 1,
-1.729218, 0.1802517, -0.2882996, 1, 1, 1, 1, 1,
-1.723254, -0.1261285, -2.528585, 1, 1, 1, 1, 1,
-1.717594, 0.4797579, -0.6107534, 1, 1, 1, 1, 1,
-1.709083, -1.495034, -0.630578, 1, 1, 1, 1, 1,
-1.702766, 0.9021911, -0.5651158, 1, 1, 1, 1, 1,
-1.691482, -1.085616, -0.9339246, 1, 1, 1, 1, 1,
-1.687875, -0.1252086, -1.293484, 1, 1, 1, 1, 1,
-1.687006, 1.239859, -0.4236256, 1, 1, 1, 1, 1,
-1.680658, -1.225801, -2.01652, 1, 1, 1, 1, 1,
-1.673125, -1.42356, -2.858776, 1, 1, 1, 1, 1,
-1.670787, -0.2466666, -0.644242, 1, 1, 1, 1, 1,
-1.665312, 1.42856, -0.688002, 1, 1, 1, 1, 1,
-1.660377, 0.1262846, -0.2380396, 1, 1, 1, 1, 1,
-1.651789, -0.7864122, -1.877783, 0, 0, 1, 1, 1,
-1.62927, -1.738149, -1.881237, 1, 0, 0, 1, 1,
-1.616909, -0.0813072, -1.14506, 1, 0, 0, 1, 1,
-1.610951, 1.121664, -3.218861, 1, 0, 0, 1, 1,
-1.598839, -0.5228127, -2.932016, 1, 0, 0, 1, 1,
-1.578432, 1.007995, -2.150229, 1, 0, 0, 1, 1,
-1.564098, 1.28418, -1.280289, 0, 0, 0, 1, 1,
-1.563924, -1.510081, -1.497818, 0, 0, 0, 1, 1,
-1.553544, -0.6020043, -3.483948, 0, 0, 0, 1, 1,
-1.551846, 1.220435, -1.284841, 0, 0, 0, 1, 1,
-1.515361, -0.4864586, -3.815538, 0, 0, 0, 1, 1,
-1.512387, -0.2418212, -2.065033, 0, 0, 0, 1, 1,
-1.507045, 2.112095, -1.260965, 0, 0, 0, 1, 1,
-1.506652, 0.6140742, -1.554073, 1, 1, 1, 1, 1,
-1.504415, -0.1974997, -0.9777682, 1, 1, 1, 1, 1,
-1.483244, -1.144954, -1.938667, 1, 1, 1, 1, 1,
-1.462863, -0.2954302, -1.29046, 1, 1, 1, 1, 1,
-1.461936, -0.2103167, 0.222341, 1, 1, 1, 1, 1,
-1.45728, 1.090344, -1.394988, 1, 1, 1, 1, 1,
-1.456996, 2.290681, 0.2763912, 1, 1, 1, 1, 1,
-1.443054, 0.2135553, -0.8043861, 1, 1, 1, 1, 1,
-1.439573, 1.108124, -2.88921, 1, 1, 1, 1, 1,
-1.434192, -0.8035582, -2.306279, 1, 1, 1, 1, 1,
-1.433142, -1.436342, -2.393035, 1, 1, 1, 1, 1,
-1.410113, 0.8050442, -0.8641214, 1, 1, 1, 1, 1,
-1.395275, 0.1935824, -3.327918, 1, 1, 1, 1, 1,
-1.387317, 0.08896331, -3.14448, 1, 1, 1, 1, 1,
-1.38484, 0.4105302, -1.979727, 1, 1, 1, 1, 1,
-1.363688, -1.181705, -2.286108, 0, 0, 1, 1, 1,
-1.360888, 0.8034629, -1.359606, 1, 0, 0, 1, 1,
-1.358526, -0.5092125, -2.240718, 1, 0, 0, 1, 1,
-1.352599, -1.691624, -4.450489, 1, 0, 0, 1, 1,
-1.33173, 0.6349818, -1.848765, 1, 0, 0, 1, 1,
-1.3304, -0.07947242, -0.7083082, 1, 0, 0, 1, 1,
-1.32657, 0.04350254, -2.474442, 0, 0, 0, 1, 1,
-1.318945, 0.7565834, -0.6604764, 0, 0, 0, 1, 1,
-1.313438, -0.4587291, 0.1923384, 0, 0, 0, 1, 1,
-1.312159, -1.866549, -2.742099, 0, 0, 0, 1, 1,
-1.311083, -0.4636861, -4.136603, 0, 0, 0, 1, 1,
-1.294808, 1.950865, -1.180382, 0, 0, 0, 1, 1,
-1.272292, -0.3481413, -2.076905, 0, 0, 0, 1, 1,
-1.265505, -0.7437444, -2.099704, 1, 1, 1, 1, 1,
-1.263512, 0.2856441, -2.191481, 1, 1, 1, 1, 1,
-1.249525, 0.7732232, -1.314194, 1, 1, 1, 1, 1,
-1.248613, -0.8949492, -1.424169, 1, 1, 1, 1, 1,
-1.242434, -1.797444, -3.772932, 1, 1, 1, 1, 1,
-1.242014, -0.8336446, -0.6780235, 1, 1, 1, 1, 1,
-1.241668, 0.7666691, -0.9133743, 1, 1, 1, 1, 1,
-1.241516, 1.891063, 1.176342, 1, 1, 1, 1, 1,
-1.239314, -1.653771, -2.824298, 1, 1, 1, 1, 1,
-1.23771, -0.002062772, -2.51362, 1, 1, 1, 1, 1,
-1.225367, 0.07413952, -1.296743, 1, 1, 1, 1, 1,
-1.219815, -1.400214, -2.214952, 1, 1, 1, 1, 1,
-1.219741, -0.6221026, -3.030705, 1, 1, 1, 1, 1,
-1.213412, -0.3365769, -1.872078, 1, 1, 1, 1, 1,
-1.211853, -0.7646507, -3.918269, 1, 1, 1, 1, 1,
-1.203782, -0.1175837, -1.823024, 0, 0, 1, 1, 1,
-1.199166, -0.277375, -1.229511, 1, 0, 0, 1, 1,
-1.182799, 1.138927, -2.158624, 1, 0, 0, 1, 1,
-1.179512, 2.151969, 1.520821, 1, 0, 0, 1, 1,
-1.178536, 1.468004, -0.7097383, 1, 0, 0, 1, 1,
-1.177239, -0.1421447, -1.802631, 1, 0, 0, 1, 1,
-1.17553, 1.253336, -0.853333, 0, 0, 0, 1, 1,
-1.159592, -0.6438707, -2.106971, 0, 0, 0, 1, 1,
-1.152089, 0.8751991, -2.379068, 0, 0, 0, 1, 1,
-1.144439, 1.845595, -0.7109529, 0, 0, 0, 1, 1,
-1.143161, 0.25926, -2.199398, 0, 0, 0, 1, 1,
-1.143149, 0.1808039, -2.714532, 0, 0, 0, 1, 1,
-1.131565, -0.9441795, -0.8848038, 0, 0, 0, 1, 1,
-1.131027, 0.4381829, -1.28113, 1, 1, 1, 1, 1,
-1.128939, -0.1046773, -3.288719, 1, 1, 1, 1, 1,
-1.117463, -0.6156294, -0.06955586, 1, 1, 1, 1, 1,
-1.115337, -1.365135, -2.305463, 1, 1, 1, 1, 1,
-1.11513, -0.250342, -0.4536097, 1, 1, 1, 1, 1,
-1.1112, 0.9170882, -1.476308, 1, 1, 1, 1, 1,
-1.105238, 0.5019804, -1.942636, 1, 1, 1, 1, 1,
-1.099146, -0.9825143, -1.892588, 1, 1, 1, 1, 1,
-1.097426, -0.220706, -2.070233, 1, 1, 1, 1, 1,
-1.082191, -0.2936991, -0.6313748, 1, 1, 1, 1, 1,
-1.080749, -0.1319028, -2.022151, 1, 1, 1, 1, 1,
-1.070212, -0.01174825, -1.589295, 1, 1, 1, 1, 1,
-1.066977, -0.7398618, -0.8501565, 1, 1, 1, 1, 1,
-1.061124, 1.395308, -1.525066, 1, 1, 1, 1, 1,
-1.05426, -0.4932325, -3.693718, 1, 1, 1, 1, 1,
-1.049969, 0.9672935, 0.4080303, 0, 0, 1, 1, 1,
-1.049802, -0.3805233, -2.445807, 1, 0, 0, 1, 1,
-1.037375, -0.2701186, -2.200887, 1, 0, 0, 1, 1,
-1.036888, 2.530308, -1.396279, 1, 0, 0, 1, 1,
-1.034201, 0.01877742, -2.541661, 1, 0, 0, 1, 1,
-1.032456, 0.4429989, -2.095512, 1, 0, 0, 1, 1,
-1.02898, -0.3576634, -3.315258, 0, 0, 0, 1, 1,
-1.028549, 0.992958, -0.7407342, 0, 0, 0, 1, 1,
-1.027509, -1.016994, -2.390141, 0, 0, 0, 1, 1,
-1.015686, 1.077967, -0.05020892, 0, 0, 0, 1, 1,
-1.011996, -0.2027444, -0.3167363, 0, 0, 0, 1, 1,
-1.008711, -0.7666733, -3.391161, 0, 0, 0, 1, 1,
-1.007652, 0.9593893, -1.526621, 0, 0, 0, 1, 1,
-1.007186, 2.410793, -2.573063, 1, 1, 1, 1, 1,
-1.003688, -0.4983936, -3.210779, 1, 1, 1, 1, 1,
-1.001468, 2.495036, 0.5458379, 1, 1, 1, 1, 1,
-0.9992892, -1.180374, -1.991121, 1, 1, 1, 1, 1,
-0.99799, -0.8482916, -3.671247, 1, 1, 1, 1, 1,
-0.9971373, -0.1183515, 0.01839789, 1, 1, 1, 1, 1,
-0.9908321, 1.276821, -0.6146258, 1, 1, 1, 1, 1,
-0.9903466, -0.7307141, -2.546363, 1, 1, 1, 1, 1,
-0.9841376, 0.469664, -0.1349775, 1, 1, 1, 1, 1,
-0.9804222, 0.2760337, -0.8934055, 1, 1, 1, 1, 1,
-0.9798448, -0.8642759, -1.137999, 1, 1, 1, 1, 1,
-0.9786493, -1.182811, -3.815743, 1, 1, 1, 1, 1,
-0.9746805, 0.1062114, -1.48777, 1, 1, 1, 1, 1,
-0.9715754, -0.797293, -3.282183, 1, 1, 1, 1, 1,
-0.9696302, 1.164105, -1.03995, 1, 1, 1, 1, 1,
-0.960824, 0.843512, -2.76477, 0, 0, 1, 1, 1,
-0.9596801, -0.3045843, -2.460839, 1, 0, 0, 1, 1,
-0.9588993, 0.5213868, -2.851885, 1, 0, 0, 1, 1,
-0.9474074, 0.2203513, -1.280369, 1, 0, 0, 1, 1,
-0.9458228, 0.3429376, -2.440033, 1, 0, 0, 1, 1,
-0.9400744, -0.8779811, -2.692761, 1, 0, 0, 1, 1,
-0.9301607, -0.7692171, -2.192975, 0, 0, 0, 1, 1,
-0.9232084, 0.3873548, 0.04532248, 0, 0, 0, 1, 1,
-0.922671, 3.023239, 0.6893758, 0, 0, 0, 1, 1,
-0.921718, -0.3708969, -1.886596, 0, 0, 0, 1, 1,
-0.9115429, -0.2166665, -1.840735, 0, 0, 0, 1, 1,
-0.9078376, 0.3125407, -0.1739925, 0, 0, 0, 1, 1,
-0.9055713, 1.18079, 0.842357, 0, 0, 0, 1, 1,
-0.903668, 0.8304254, -0.7424048, 1, 1, 1, 1, 1,
-0.8867901, -0.8544918, -2.655794, 1, 1, 1, 1, 1,
-0.8831234, -0.337648, -2.181262, 1, 1, 1, 1, 1,
-0.8817205, 0.2498033, -0.5944015, 1, 1, 1, 1, 1,
-0.8790594, 1.204061, -1.144231, 1, 1, 1, 1, 1,
-0.8783767, -2.238391, -0.4251885, 1, 1, 1, 1, 1,
-0.8779849, -0.3470929, -0.05575835, 1, 1, 1, 1, 1,
-0.8723218, 1.180074, -1.923474, 1, 1, 1, 1, 1,
-0.8721979, 0.07122055, -1.570339, 1, 1, 1, 1, 1,
-0.8703501, -1.606607, -2.145121, 1, 1, 1, 1, 1,
-0.8652255, -0.02075435, -2.138055, 1, 1, 1, 1, 1,
-0.8568988, 0.4199438, -0.9354739, 1, 1, 1, 1, 1,
-0.8450682, 1.365401, 0.2376754, 1, 1, 1, 1, 1,
-0.8448741, 0.5530889, -2.442779, 1, 1, 1, 1, 1,
-0.8438194, -0.1409193, -2.031755, 1, 1, 1, 1, 1,
-0.8408819, 1.743168, -1.677528, 0, 0, 1, 1, 1,
-0.8289316, -1.047638, -2.18784, 1, 0, 0, 1, 1,
-0.8276139, -0.2012639, -0.8875917, 1, 0, 0, 1, 1,
-0.8245665, -0.4865557, -1.340884, 1, 0, 0, 1, 1,
-0.8188938, 1.44752, -0.3721854, 1, 0, 0, 1, 1,
-0.8142913, -0.971129, -3.280705, 1, 0, 0, 1, 1,
-0.8102276, -1.657867, -3.597107, 0, 0, 0, 1, 1,
-0.8032632, 0.9522656, -0.9736842, 0, 0, 0, 1, 1,
-0.7959313, 1.7942, -1.288353, 0, 0, 0, 1, 1,
-0.7906803, -0.3173452, -1.291344, 0, 0, 0, 1, 1,
-0.7894511, 0.4736823, -2.217366, 0, 0, 0, 1, 1,
-0.7847969, 1.007293, -0.65194, 0, 0, 0, 1, 1,
-0.781499, -0.006479579, -1.863509, 0, 0, 0, 1, 1,
-0.7798674, -1.468226, -1.386842, 1, 1, 1, 1, 1,
-0.7746084, 0.1924876, 0.2382976, 1, 1, 1, 1, 1,
-0.771933, -0.8139076, -1.74194, 1, 1, 1, 1, 1,
-0.7717819, 0.5769517, -2.733486, 1, 1, 1, 1, 1,
-0.7705336, 0.09195866, -2.840379, 1, 1, 1, 1, 1,
-0.7702738, 0.800545, -1.048314, 1, 1, 1, 1, 1,
-0.7696041, 1.614152, -0.238706, 1, 1, 1, 1, 1,
-0.7682441, -0.6360547, -2.264908, 1, 1, 1, 1, 1,
-0.7663047, 0.5417923, 0.1384327, 1, 1, 1, 1, 1,
-0.7592959, -0.2670658, -0.51622, 1, 1, 1, 1, 1,
-0.756193, -1.34815, -3.329414, 1, 1, 1, 1, 1,
-0.7553048, -1.455749, -0.6603199, 1, 1, 1, 1, 1,
-0.753805, 0.7363406, -1.431733, 1, 1, 1, 1, 1,
-0.7524893, -0.2018689, -3.488903, 1, 1, 1, 1, 1,
-0.7493819, -0.01757856, -1.141996, 1, 1, 1, 1, 1,
-0.745914, 0.1591418, 0.02054822, 0, 0, 1, 1, 1,
-0.7395225, 2.506449, -1.435964, 1, 0, 0, 1, 1,
-0.7375602, -0.7739749, -1.388155, 1, 0, 0, 1, 1,
-0.7342829, 0.4798493, 0.3689629, 1, 0, 0, 1, 1,
-0.7333724, -0.4006465, -3.461923, 1, 0, 0, 1, 1,
-0.7324503, 0.7666259, -0.9125999, 1, 0, 0, 1, 1,
-0.7288795, -0.6326992, -1.226152, 0, 0, 0, 1, 1,
-0.7244773, -0.8602073, -1.87292, 0, 0, 0, 1, 1,
-0.7241102, -1.2499, -3.004147, 0, 0, 0, 1, 1,
-0.7206992, 0.2969587, -0.4879633, 0, 0, 0, 1, 1,
-0.7206689, 0.07220239, -2.371408, 0, 0, 0, 1, 1,
-0.711423, 1.38875, -0.03434933, 0, 0, 0, 1, 1,
-0.7016372, 1.714589, -1.976908, 0, 0, 0, 1, 1,
-0.6986247, -0.3557142, -1.131191, 1, 1, 1, 1, 1,
-0.6874994, -0.5725613, -1.474689, 1, 1, 1, 1, 1,
-0.6866209, -0.3370048, -1.225667, 1, 1, 1, 1, 1,
-0.6808908, 0.2563736, -1.038728, 1, 1, 1, 1, 1,
-0.6803364, 0.7286167, -0.8636852, 1, 1, 1, 1, 1,
-0.6700172, -1.048595, -3.641975, 1, 1, 1, 1, 1,
-0.6688017, -0.05344443, -2.40733, 1, 1, 1, 1, 1,
-0.6671718, 1.113743, -0.03240161, 1, 1, 1, 1, 1,
-0.6626566, 0.3902617, -1.917921, 1, 1, 1, 1, 1,
-0.6612681, -0.9561498, -2.136411, 1, 1, 1, 1, 1,
-0.6538428, 0.5429509, -0.9533809, 1, 1, 1, 1, 1,
-0.6432402, -1.337646, -3.391711, 1, 1, 1, 1, 1,
-0.6403184, 2.096891, -1.585748, 1, 1, 1, 1, 1,
-0.6394106, -0.04917299, -0.896798, 1, 1, 1, 1, 1,
-0.634387, -0.02213048, -1.310278, 1, 1, 1, 1, 1,
-0.6295842, -0.7870274, -3.804196, 0, 0, 1, 1, 1,
-0.6289191, -1.00783, -4.822385, 1, 0, 0, 1, 1,
-0.6281815, 1.755669, -0.9939394, 1, 0, 0, 1, 1,
-0.6200073, 0.5591251, -1.038831, 1, 0, 0, 1, 1,
-0.6178522, -0.2168574, -1.622883, 1, 0, 0, 1, 1,
-0.6177033, 0.2636154, -1.378375, 1, 0, 0, 1, 1,
-0.6146557, 0.5069038, -0.9463819, 0, 0, 0, 1, 1,
-0.6082188, 1.277928, 1.021837, 0, 0, 0, 1, 1,
-0.6081073, -0.7714215, -1.718728, 0, 0, 0, 1, 1,
-0.5983583, -1.590301, -3.221516, 0, 0, 0, 1, 1,
-0.5914103, -0.4388603, -2.584144, 0, 0, 0, 1, 1,
-0.5883631, -1.44648, -3.234278, 0, 0, 0, 1, 1,
-0.5869266, -2.208401, -3.04997, 0, 0, 0, 1, 1,
-0.5868214, 0.1875546, -2.361296, 1, 1, 1, 1, 1,
-0.5854078, 1.203153, -0.1882003, 1, 1, 1, 1, 1,
-0.5853631, 1.812858, 1.087287, 1, 1, 1, 1, 1,
-0.5850526, -0.2879882, 0.1685764, 1, 1, 1, 1, 1,
-0.5843375, -0.06449621, -1.647559, 1, 1, 1, 1, 1,
-0.5835909, 0.4574473, -0.3850775, 1, 1, 1, 1, 1,
-0.579371, 0.3939013, -0.1779573, 1, 1, 1, 1, 1,
-0.5780875, 1.605938, -0.3801087, 1, 1, 1, 1, 1,
-0.5750858, 0.09131306, 0.009152657, 1, 1, 1, 1, 1,
-0.5682741, 0.007343886, -1.624704, 1, 1, 1, 1, 1,
-0.5659392, -0.2571609, -3.827909, 1, 1, 1, 1, 1,
-0.5628592, 0.3251987, -1.23139, 1, 1, 1, 1, 1,
-0.5616785, -0.7384655, -3.136432, 1, 1, 1, 1, 1,
-0.5616585, -0.09780405, -2.326402, 1, 1, 1, 1, 1,
-0.5601681, 0.7448279, -0.3597455, 1, 1, 1, 1, 1,
-0.5597306, 0.09815814, -0.9400555, 0, 0, 1, 1, 1,
-0.5576082, 2.254771, 0.6680372, 1, 0, 0, 1, 1,
-0.5550174, 0.3797653, -1.312278, 1, 0, 0, 1, 1,
-0.5519062, -0.4337496, -2.626664, 1, 0, 0, 1, 1,
-0.5463395, 0.9046997, 0.4096679, 1, 0, 0, 1, 1,
-0.5459598, 0.8933184, -0.8206415, 1, 0, 0, 1, 1,
-0.541715, 1.213812, -0.1693898, 0, 0, 0, 1, 1,
-0.5397604, 1.358595, -2.164752, 0, 0, 0, 1, 1,
-0.5392925, 0.6906297, -0.152385, 0, 0, 0, 1, 1,
-0.5384418, 1.295598, -0.6856053, 0, 0, 0, 1, 1,
-0.5335003, 0.06379969, -2.072162, 0, 0, 0, 1, 1,
-0.5328186, -0.4233964, -2.398125, 0, 0, 0, 1, 1,
-0.527786, 1.220659, -1.380184, 0, 0, 0, 1, 1,
-0.525508, -1.117728, -2.906342, 1, 1, 1, 1, 1,
-0.5244608, 1.105889, -1.038089, 1, 1, 1, 1, 1,
-0.5047842, 0.8255153, -1.489118, 1, 1, 1, 1, 1,
-0.4951262, -0.6282088, -3.159391, 1, 1, 1, 1, 1,
-0.4877995, 2.033898, 0.4543581, 1, 1, 1, 1, 1,
-0.4871046, 2.923671, 0.2469392, 1, 1, 1, 1, 1,
-0.4869526, -0.2663882, -3.443759, 1, 1, 1, 1, 1,
-0.4827957, -1.514445, -2.06047, 1, 1, 1, 1, 1,
-0.4808781, 0.4950192, -0.6146547, 1, 1, 1, 1, 1,
-0.4808094, 0.3990139, -0.1122319, 1, 1, 1, 1, 1,
-0.4806326, -0.5050952, -4.153556, 1, 1, 1, 1, 1,
-0.4783604, -1.127056, -2.088688, 1, 1, 1, 1, 1,
-0.4740099, -0.8462621, -4.127435, 1, 1, 1, 1, 1,
-0.4722232, -0.1450344, -2.362334, 1, 1, 1, 1, 1,
-0.4717878, 0.4755437, -0.6614768, 1, 1, 1, 1, 1,
-0.4712867, 0.5885968, -1.012429, 0, 0, 1, 1, 1,
-0.470728, -1.432105, -2.511107, 1, 0, 0, 1, 1,
-0.4662509, -0.8436551, -3.378749, 1, 0, 0, 1, 1,
-0.4615178, -1.573557, -2.974907, 1, 0, 0, 1, 1,
-0.4480789, -3.116755, -4.437836, 1, 0, 0, 1, 1,
-0.4387683, -2.322467, -2.199017, 1, 0, 0, 1, 1,
-0.438628, -1.239479, -2.290667, 0, 0, 0, 1, 1,
-0.4383794, -0.1651602, -2.633489, 0, 0, 0, 1, 1,
-0.4374841, -0.6198161, -2.395351, 0, 0, 0, 1, 1,
-0.436553, 0.2061668, -1.331559, 0, 0, 0, 1, 1,
-0.4335268, 0.7488425, 1.169264, 0, 0, 0, 1, 1,
-0.4276955, 0.9629136, 0.09969153, 0, 0, 0, 1, 1,
-0.4214853, -0.941546, -2.553148, 0, 0, 0, 1, 1,
-0.4188259, -0.3625835, -3.089881, 1, 1, 1, 1, 1,
-0.4181201, 1.843625, 0.04124158, 1, 1, 1, 1, 1,
-0.4179686, -0.291204, -2.910422, 1, 1, 1, 1, 1,
-0.417059, -0.09934523, -3.142413, 1, 1, 1, 1, 1,
-0.4142247, -0.7453101, -2.523211, 1, 1, 1, 1, 1,
-0.4142073, -0.3477833, -2.670983, 1, 1, 1, 1, 1,
-0.4132961, 0.03735737, 0.5141804, 1, 1, 1, 1, 1,
-0.4076542, 2.35442, -1.597832, 1, 1, 1, 1, 1,
-0.3984363, 0.5311438, -0.04232535, 1, 1, 1, 1, 1,
-0.3963414, 0.7150354, 0.3107265, 1, 1, 1, 1, 1,
-0.3960532, -0.3045502, -3.469415, 1, 1, 1, 1, 1,
-0.3955371, 2.464205, 1.026839, 1, 1, 1, 1, 1,
-0.3885447, -1.852376, -2.339836, 1, 1, 1, 1, 1,
-0.3885296, 0.5699323, -0.9963263, 1, 1, 1, 1, 1,
-0.3872872, 1.534561, -1.098111, 1, 1, 1, 1, 1,
-0.3845644, -0.6558681, -3.322032, 0, 0, 1, 1, 1,
-0.3726429, 0.614996, -0.6548597, 1, 0, 0, 1, 1,
-0.3724553, 1.420301, -0.670696, 1, 0, 0, 1, 1,
-0.3713456, -0.2681719, -2.964096, 1, 0, 0, 1, 1,
-0.3689584, 0.2580878, -0.03993216, 1, 0, 0, 1, 1,
-0.3652538, -0.8237682, -3.33556, 1, 0, 0, 1, 1,
-0.3629739, 0.06843878, 1.246583, 0, 0, 0, 1, 1,
-0.3624225, 0.3127559, -1.191625, 0, 0, 0, 1, 1,
-0.3588535, -0.4608026, -2.296386, 0, 0, 0, 1, 1,
-0.3563874, -0.372077, -2.094146, 0, 0, 0, 1, 1,
-0.3548527, -0.7860543, -3.784493, 0, 0, 0, 1, 1,
-0.3539582, -0.997494, -2.694846, 0, 0, 0, 1, 1,
-0.3533825, 1.017509, -0.5505224, 0, 0, 0, 1, 1,
-0.351188, 0.7386488, 0.4927626, 1, 1, 1, 1, 1,
-0.3505483, 1.283343, 0.7652307, 1, 1, 1, 1, 1,
-0.3471627, -0.8460579, -3.40441, 1, 1, 1, 1, 1,
-0.3471237, -0.3005983, -1.85585, 1, 1, 1, 1, 1,
-0.3444195, -0.5203086, -2.559239, 1, 1, 1, 1, 1,
-0.3418529, 0.2692495, -1.962013, 1, 1, 1, 1, 1,
-0.3389902, 2.471359, 0.5853608, 1, 1, 1, 1, 1,
-0.3388343, 2.205459, 0.1669939, 1, 1, 1, 1, 1,
-0.3372696, -1.338573, -2.456546, 1, 1, 1, 1, 1,
-0.3357748, -1.717903, -2.642528, 1, 1, 1, 1, 1,
-0.3333983, -0.7004916, -3.021187, 1, 1, 1, 1, 1,
-0.3332038, 0.4404031, -0.8358915, 1, 1, 1, 1, 1,
-0.3321614, -0.5522968, -2.569865, 1, 1, 1, 1, 1,
-0.3269442, 0.7284982, -0.1009276, 1, 1, 1, 1, 1,
-0.3232343, -1.158519, -1.765796, 1, 1, 1, 1, 1,
-0.3201904, -1.075946, -2.87839, 0, 0, 1, 1, 1,
-0.3077436, 0.7187474, -1.347361, 1, 0, 0, 1, 1,
-0.3057714, 0.08202728, -1.828017, 1, 0, 0, 1, 1,
-0.3029105, -0.3095967, -1.369824, 1, 0, 0, 1, 1,
-0.3027658, 2.863567, 0.1313396, 1, 0, 0, 1, 1,
-0.3006032, 1.740567, -1.023278, 1, 0, 0, 1, 1,
-0.3002241, -1.089796, -3.666724, 0, 0, 0, 1, 1,
-0.295465, -0.7760149, -2.65552, 0, 0, 0, 1, 1,
-0.294643, 0.5285054, -0.9597344, 0, 0, 0, 1, 1,
-0.2942434, 0.200125, 0.3194452, 0, 0, 0, 1, 1,
-0.2888011, 1.990762, -2.428494, 0, 0, 0, 1, 1,
-0.2885031, -1.112876, -4.326424, 0, 0, 0, 1, 1,
-0.2867064, 0.7521846, 1.178529, 0, 0, 0, 1, 1,
-0.2859122, -1.472571, -2.313037, 1, 1, 1, 1, 1,
-0.2821789, 1.584552, 0.1540812, 1, 1, 1, 1, 1,
-0.2820159, 1.170073, 0.3746643, 1, 1, 1, 1, 1,
-0.2789645, -0.5610256, -1.837461, 1, 1, 1, 1, 1,
-0.2781176, 0.1277596, -1.105272, 1, 1, 1, 1, 1,
-0.2772164, -0.3237687, -1.801916, 1, 1, 1, 1, 1,
-0.2746781, 2.42332, 0.07741763, 1, 1, 1, 1, 1,
-0.273406, 0.3683341, -1.341201, 1, 1, 1, 1, 1,
-0.2676599, -1.472987, -2.381614, 1, 1, 1, 1, 1,
-0.2667444, 0.5975913, -1.633083, 1, 1, 1, 1, 1,
-0.2651843, 1.031131, -1.906738, 1, 1, 1, 1, 1,
-0.2637547, 1.236741, -0.5763959, 1, 1, 1, 1, 1,
-0.2595451, 2.35574, 0.2178765, 1, 1, 1, 1, 1,
-0.2578422, 0.9733212, -0.8632919, 1, 1, 1, 1, 1,
-0.2563207, -0.3819674, -2.611096, 1, 1, 1, 1, 1,
-0.2548698, 1.397431, -1.003597, 0, 0, 1, 1, 1,
-0.254587, 0.6594602, -0.3586795, 1, 0, 0, 1, 1,
-0.247237, 0.4203384, -0.3594786, 1, 0, 0, 1, 1,
-0.2464458, -0.3894423, -2.891232, 1, 0, 0, 1, 1,
-0.2415233, -0.04940794, 0.2308348, 1, 0, 0, 1, 1,
-0.2410132, -0.1214881, -3.037675, 1, 0, 0, 1, 1,
-0.2403366, -0.626933, -4.234116, 0, 0, 0, 1, 1,
-0.2344839, -0.4709658, -2.546237, 0, 0, 0, 1, 1,
-0.2333195, -0.3642576, -2.705191, 0, 0, 0, 1, 1,
-0.2294391, -0.6948189, -2.31162, 0, 0, 0, 1, 1,
-0.2287713, 2.347426, -0.5815681, 0, 0, 0, 1, 1,
-0.225176, -3.24683, -1.350959, 0, 0, 0, 1, 1,
-0.2250316, 1.579009, -0.8351697, 0, 0, 0, 1, 1,
-0.2243651, 0.1447983, 0.2493992, 1, 1, 1, 1, 1,
-0.2222336, -0.5897145, -1.437928, 1, 1, 1, 1, 1,
-0.2191178, 0.3462423, -0.9399068, 1, 1, 1, 1, 1,
-0.2188935, -0.1087523, -0.3297473, 1, 1, 1, 1, 1,
-0.2186712, 1.217502, 1.230272, 1, 1, 1, 1, 1,
-0.2177691, 0.556484, -0.3019742, 1, 1, 1, 1, 1,
-0.2139919, 1.312376, -0.7683935, 1, 1, 1, 1, 1,
-0.2124031, 1.657529, -0.2046275, 1, 1, 1, 1, 1,
-0.2118736, 0.703495, 2.371099, 1, 1, 1, 1, 1,
-0.2115581, 1.139032, -0.5087447, 1, 1, 1, 1, 1,
-0.2106439, -1.607277, -4.444561, 1, 1, 1, 1, 1,
-0.21043, -0.3758357, -4.126984, 1, 1, 1, 1, 1,
-0.2089093, 0.6183338, -0.14749, 1, 1, 1, 1, 1,
-0.2088377, 1.079441, -0.7143591, 1, 1, 1, 1, 1,
-0.2077268, 0.9803961, -0.6322431, 1, 1, 1, 1, 1,
-0.2070751, -0.6618202, -2.175667, 0, 0, 1, 1, 1,
-0.2035358, 0.7508999, -2.143606, 1, 0, 0, 1, 1,
-0.2014834, 0.3086387, -0.5440758, 1, 0, 0, 1, 1,
-0.1949991, 0.4561571, -0.3919876, 1, 0, 0, 1, 1,
-0.1940941, -1.105713, -2.367055, 1, 0, 0, 1, 1,
-0.1925754, 0.4040992, -2.66609, 1, 0, 0, 1, 1,
-0.1924363, 0.1266767, 0.6682847, 0, 0, 0, 1, 1,
-0.1910302, 0.5519946, -2.404987, 0, 0, 0, 1, 1,
-0.189373, -0.4965157, -4.305801, 0, 0, 0, 1, 1,
-0.1882592, -1.026396, -4.52056, 0, 0, 0, 1, 1,
-0.1876479, 1.887912, 0.2620175, 0, 0, 0, 1, 1,
-0.1823258, -0.9385769, -1.766598, 0, 0, 0, 1, 1,
-0.179811, -1.355129, -3.426519, 0, 0, 0, 1, 1,
-0.1788335, -0.4768592, -2.831612, 1, 1, 1, 1, 1,
-0.1756537, 1.505971, 0.1319662, 1, 1, 1, 1, 1,
-0.1715815, 0.650269, 0.5977429, 1, 1, 1, 1, 1,
-0.1664683, 2.06112, 1.940427, 1, 1, 1, 1, 1,
-0.1662626, -0.3871058, -3.062809, 1, 1, 1, 1, 1,
-0.1605096, 0.9822263, 0.02836822, 1, 1, 1, 1, 1,
-0.1589478, -0.753953, -0.954905, 1, 1, 1, 1, 1,
-0.1550305, -2.274989, -3.679155, 1, 1, 1, 1, 1,
-0.1533463, -0.4619702, -1.416406, 1, 1, 1, 1, 1,
-0.1493261, -0.1863149, -3.002952, 1, 1, 1, 1, 1,
-0.1490044, -1.193669, -3.118419, 1, 1, 1, 1, 1,
-0.146582, 1.932722, 1.319313, 1, 1, 1, 1, 1,
-0.1395015, -0.2002158, -2.510578, 1, 1, 1, 1, 1,
-0.1373459, 0.871393, 0.4392971, 1, 1, 1, 1, 1,
-0.1337374, -0.2880158, -3.176197, 1, 1, 1, 1, 1,
-0.1310755, -0.2876485, -2.433673, 0, 0, 1, 1, 1,
-0.1275341, -0.1770025, -2.634515, 1, 0, 0, 1, 1,
-0.1214606, -1.704341, -3.82024, 1, 0, 0, 1, 1,
-0.1212535, 0.1359486, -2.191385, 1, 0, 0, 1, 1,
-0.120247, -0.3431189, -4.018126, 1, 0, 0, 1, 1,
-0.1174487, 0.007070173, -1.580999, 1, 0, 0, 1, 1,
-0.1171479, 0.8603542, -1.903022, 0, 0, 0, 1, 1,
-0.1143484, 0.2584547, -0.5052872, 0, 0, 0, 1, 1,
-0.1120719, 0.9234774, 1.223953, 0, 0, 0, 1, 1,
-0.1104213, 0.7393052, 0.9261766, 0, 0, 0, 1, 1,
-0.109561, 0.1081157, 0.3849424, 0, 0, 0, 1, 1,
-0.1088466, 0.8181196, 0.4068934, 0, 0, 0, 1, 1,
-0.1080104, -1.108365, -4.951775, 0, 0, 0, 1, 1,
-0.1074913, 0.3335706, -1.559681, 1, 1, 1, 1, 1,
-0.1071528, -0.3360735, -1.287965, 1, 1, 1, 1, 1,
-0.1043776, 1.030203, 0.1866881, 1, 1, 1, 1, 1,
-0.1014046, -0.7065108, -2.769067, 1, 1, 1, 1, 1,
-0.08645256, 1.836901, 0.1251418, 1, 1, 1, 1, 1,
-0.08071186, -1.616906, -4.141261, 1, 1, 1, 1, 1,
-0.07967439, -1.898409, -4.176497, 1, 1, 1, 1, 1,
-0.07887836, -1.093149, -2.62816, 1, 1, 1, 1, 1,
-0.07804745, 0.845591, 1.091425, 1, 1, 1, 1, 1,
-0.0750433, -0.1019803, -1.523059, 1, 1, 1, 1, 1,
-0.07406656, 0.8554101, -0.6674465, 1, 1, 1, 1, 1,
-0.0738348, -0.5556871, -4.012578, 1, 1, 1, 1, 1,
-0.07249299, 0.006075297, -1.423514, 1, 1, 1, 1, 1,
-0.06674997, 0.9064984, 0.4301787, 1, 1, 1, 1, 1,
-0.06466126, -0.4522406, -4.144878, 1, 1, 1, 1, 1,
-0.06409089, 1.367323, 1.655365, 0, 0, 1, 1, 1,
-0.06335805, -0.1737047, -4.190044, 1, 0, 0, 1, 1,
-0.05736165, -0.08879702, -2.721266, 1, 0, 0, 1, 1,
-0.0548181, 0.4246979, -2.101599, 1, 0, 0, 1, 1,
-0.05329597, 0.09240577, -0.2849131, 1, 0, 0, 1, 1,
-0.05303468, -1.40483, -3.465974, 1, 0, 0, 1, 1,
-0.0518513, 0.1572594, 0.6707888, 0, 0, 0, 1, 1,
-0.05004673, 2.217229, -1.947247, 0, 0, 0, 1, 1,
-0.04933099, 0.4082268, -0.689275, 0, 0, 0, 1, 1,
-0.0487908, 0.5606237, 0.2746654, 0, 0, 0, 1, 1,
-0.04295303, 1.444396, 1.302803, 0, 0, 0, 1, 1,
-0.04173502, 2.243072, 0.2985075, 0, 0, 0, 1, 1,
-0.03887341, -0.1569196, -1.276425, 0, 0, 0, 1, 1,
-0.03751631, 0.3604629, -0.1085221, 1, 1, 1, 1, 1,
-0.03285208, -0.9625729, -2.763992, 1, 1, 1, 1, 1,
-0.02990532, 1.222715, 2.207443, 1, 1, 1, 1, 1,
-0.02951524, 0.1991156, 0.1766383, 1, 1, 1, 1, 1,
-0.0285351, 0.04084558, -1.119643, 1, 1, 1, 1, 1,
-0.01628933, 1.033097, -0.3490572, 1, 1, 1, 1, 1,
-0.01580206, -1.514615, -3.683541, 1, 1, 1, 1, 1,
-0.01471998, 1.917464, -0.6588597, 1, 1, 1, 1, 1,
-0.01305191, 1.396177, 0.2604526, 1, 1, 1, 1, 1,
-0.01302412, -1.522449, -3.429669, 1, 1, 1, 1, 1,
-0.009783477, 0.3048504, 0.4443223, 1, 1, 1, 1, 1,
0.0002846868, -0.1417827, 3.580832, 1, 1, 1, 1, 1,
0.001370071, -0.120043, 1.594721, 1, 1, 1, 1, 1,
0.002572723, -0.3306229, 4.267334, 1, 1, 1, 1, 1,
0.003455154, -0.4128197, 3.931785, 1, 1, 1, 1, 1,
0.004478334, -1.082974, 1.772344, 0, 0, 1, 1, 1,
0.004752222, -1.288035, 3.264287, 1, 0, 0, 1, 1,
0.009900301, 0.7782842, 0.8457433, 1, 0, 0, 1, 1,
0.01231205, 0.5490516, -0.2290098, 1, 0, 0, 1, 1,
0.01484036, 0.2905805, -0.2237094, 1, 0, 0, 1, 1,
0.01533675, 0.07315266, 0.5448018, 1, 0, 0, 1, 1,
0.01540207, -0.8091052, 2.684769, 0, 0, 0, 1, 1,
0.02009839, 1.405482, -0.5295278, 0, 0, 0, 1, 1,
0.02168306, 0.5485563, 0.09066437, 0, 0, 0, 1, 1,
0.02397612, 0.4510793, 0.6593915, 0, 0, 0, 1, 1,
0.02740195, -0.07693473, 4.281816, 0, 0, 0, 1, 1,
0.0292521, 0.3439036, -0.4099112, 0, 0, 0, 1, 1,
0.0313392, -1.436267, 4.238338, 0, 0, 0, 1, 1,
0.03224665, 1.315833, 0.9914938, 1, 1, 1, 1, 1,
0.03239781, -1.053855, 2.752307, 1, 1, 1, 1, 1,
0.03593307, 0.08216851, -0.1033325, 1, 1, 1, 1, 1,
0.03799715, -1.030909, 5.853066, 1, 1, 1, 1, 1,
0.04221073, 0.2333991, 0.1732981, 1, 1, 1, 1, 1,
0.05344181, -0.474273, 4.298511, 1, 1, 1, 1, 1,
0.05526297, 0.5438697, 0.382241, 1, 1, 1, 1, 1,
0.05778372, 0.07493122, 1.772, 1, 1, 1, 1, 1,
0.06041111, 0.4236034, 1.489134, 1, 1, 1, 1, 1,
0.06098793, -0.3797368, 4.22003, 1, 1, 1, 1, 1,
0.06301469, 1.483617, -0.1449912, 1, 1, 1, 1, 1,
0.06375177, 1.078997, -1.262988, 1, 1, 1, 1, 1,
0.06419563, -0.2817937, 2.630209, 1, 1, 1, 1, 1,
0.06451835, -1.008888, 2.126274, 1, 1, 1, 1, 1,
0.06681062, -0.6756194, 3.21622, 1, 1, 1, 1, 1,
0.06827457, 0.02084428, -0.1162557, 0, 0, 1, 1, 1,
0.06969883, -0.2053649, 3.892032, 1, 0, 0, 1, 1,
0.06995653, 0.566781, 0.6763897, 1, 0, 0, 1, 1,
0.07032866, 0.4398697, 2.01738, 1, 0, 0, 1, 1,
0.07390075, -0.06792932, 2.463941, 1, 0, 0, 1, 1,
0.07597477, 0.2474072, 1.884535, 1, 0, 0, 1, 1,
0.08196326, 0.66674, 0.8670548, 0, 0, 0, 1, 1,
0.08266191, -0.02774736, 3.318446, 0, 0, 0, 1, 1,
0.08745975, -1.164996, 3.200427, 0, 0, 0, 1, 1,
0.08835077, 0.03990916, 2.213473, 0, 0, 0, 1, 1,
0.09211826, 0.1479727, 0.8599488, 0, 0, 0, 1, 1,
0.09698172, 1.546456, 2.154187, 0, 0, 0, 1, 1,
0.09723162, 1.431892, -1.388741, 0, 0, 0, 1, 1,
0.09777263, 0.558663, -0.6175182, 1, 1, 1, 1, 1,
0.09853107, -0.6757377, 3.053077, 1, 1, 1, 1, 1,
0.1053817, 0.9123548, -0.1126415, 1, 1, 1, 1, 1,
0.1067794, -0.07083911, 3.03079, 1, 1, 1, 1, 1,
0.1103785, 0.7757053, -1.148018, 1, 1, 1, 1, 1,
0.1117964, 0.1816763, 0.9175774, 1, 1, 1, 1, 1,
0.1161824, 0.9799313, -0.005328761, 1, 1, 1, 1, 1,
0.1177154, 0.5128845, -1.45445, 1, 1, 1, 1, 1,
0.1189634, -0.4978726, 3.198564, 1, 1, 1, 1, 1,
0.1199406, -0.2008575, 1.810086, 1, 1, 1, 1, 1,
0.1242512, 1.208807, -1.073219, 1, 1, 1, 1, 1,
0.1248039, 0.7343331, 0.2364805, 1, 1, 1, 1, 1,
0.129611, -1.230179, 5.265839, 1, 1, 1, 1, 1,
0.1301832, 2.38124, -0.1205591, 1, 1, 1, 1, 1,
0.1304862, -0.8551062, 3.254966, 1, 1, 1, 1, 1,
0.1356958, -0.4215515, 1.775549, 0, 0, 1, 1, 1,
0.1377075, 0.1833623, -0.27918, 1, 0, 0, 1, 1,
0.138809, -0.8707896, 2.578092, 1, 0, 0, 1, 1,
0.1400478, 0.06066992, 0.3933664, 1, 0, 0, 1, 1,
0.1463922, 0.5864441, 1.930163, 1, 0, 0, 1, 1,
0.1477825, 0.773824, -0.1278061, 1, 0, 0, 1, 1,
0.1484517, -0.4069318, 1.781698, 0, 0, 0, 1, 1,
0.1486745, -2.000243, 2.937452, 0, 0, 0, 1, 1,
0.1518618, 0.2607163, 0.9684656, 0, 0, 0, 1, 1,
0.1555313, 1.709975, -0.2587464, 0, 0, 0, 1, 1,
0.1559976, -0.8168035, 3.193818, 0, 0, 0, 1, 1,
0.1589741, 0.1124955, 1.499405, 0, 0, 0, 1, 1,
0.1592951, 1.057974, -0.6363146, 0, 0, 0, 1, 1,
0.1592982, -0.557314, 4.939485, 1, 1, 1, 1, 1,
0.1606066, 1.438144, 0.3330943, 1, 1, 1, 1, 1,
0.1638274, -0.412432, 2.367247, 1, 1, 1, 1, 1,
0.1639851, 1.108119, 0.601549, 1, 1, 1, 1, 1,
0.1640922, 2.356472, -0.9615741, 1, 1, 1, 1, 1,
0.1667739, 2.421114, -1.039219, 1, 1, 1, 1, 1,
0.1737491, -0.3309297, 4.530524, 1, 1, 1, 1, 1,
0.17533, 1.241759, 0.9522104, 1, 1, 1, 1, 1,
0.1777761, 0.1733265, 0.9070916, 1, 1, 1, 1, 1,
0.1782667, 0.9696444, 2.363909, 1, 1, 1, 1, 1,
0.1795408, -0.9031765, 3.069976, 1, 1, 1, 1, 1,
0.1799469, -0.278453, 2.844726, 1, 1, 1, 1, 1,
0.1812296, -1.22032, 2.016885, 1, 1, 1, 1, 1,
0.1815851, -0.148323, 3.385677, 1, 1, 1, 1, 1,
0.1834632, 0.8933028, 0.2816276, 1, 1, 1, 1, 1,
0.1874822, -1.060793, 3.676154, 0, 0, 1, 1, 1,
0.1878952, -1.400173, 4.245436, 1, 0, 0, 1, 1,
0.187951, 1.130092, 1.893866, 1, 0, 0, 1, 1,
0.1882109, -0.7492805, 2.327055, 1, 0, 0, 1, 1,
0.1950868, -0.1719947, 2.083434, 1, 0, 0, 1, 1,
0.2003893, -1.040456, 1.557807, 1, 0, 0, 1, 1,
0.2016021, -0.5900253, 1.577328, 0, 0, 0, 1, 1,
0.202053, -0.8391744, 3.848855, 0, 0, 0, 1, 1,
0.2028673, 1.749507, -0.8117512, 0, 0, 0, 1, 1,
0.2029094, 1.869467, -1.203501, 0, 0, 0, 1, 1,
0.2054517, -0.01216855, 0.5257479, 0, 0, 0, 1, 1,
0.2089224, -0.3444407, 0.2558321, 0, 0, 0, 1, 1,
0.2209463, 0.1577572, -0.1516105, 0, 0, 0, 1, 1,
0.221492, -0.8639725, 3.935022, 1, 1, 1, 1, 1,
0.2225403, 0.08140733, -1.35408, 1, 1, 1, 1, 1,
0.2256641, -0.7209361, 2.458339, 1, 1, 1, 1, 1,
0.2258067, -0.9457408, 1.464682, 1, 1, 1, 1, 1,
0.2294567, 0.4340087, -1.405736, 1, 1, 1, 1, 1,
0.2322668, 0.5491108, 0.03315897, 1, 1, 1, 1, 1,
0.2332449, 0.2318968, 0.6570613, 1, 1, 1, 1, 1,
0.2398907, 0.6986315, 0.1585523, 1, 1, 1, 1, 1,
0.2400846, 0.7605855, -0.7192603, 1, 1, 1, 1, 1,
0.242568, -0.06016916, 1.922022, 1, 1, 1, 1, 1,
0.2444849, 0.5836153, 0.5169083, 1, 1, 1, 1, 1,
0.2584721, -0.09766536, 0.6370805, 1, 1, 1, 1, 1,
0.2588471, -0.2557357, 3.315074, 1, 1, 1, 1, 1,
0.2604349, -1.258087, 3.139617, 1, 1, 1, 1, 1,
0.2652698, -0.7723353, 1.061098, 1, 1, 1, 1, 1,
0.2687108, -0.5810049, 1.670582, 0, 0, 1, 1, 1,
0.2695192, 0.3763549, 0.3006435, 1, 0, 0, 1, 1,
0.2700319, 0.6720424, 0.5286146, 1, 0, 0, 1, 1,
0.2785294, 0.4620463, -0.3081563, 1, 0, 0, 1, 1,
0.2841074, 1.088309, 0.4304298, 1, 0, 0, 1, 1,
0.2861382, 0.5242348, 1.072753, 1, 0, 0, 1, 1,
0.2866696, 0.5344515, 0.5064665, 0, 0, 0, 1, 1,
0.2906354, 0.1327738, 2.029018, 0, 0, 0, 1, 1,
0.2962123, -0.08540189, 0.3573681, 0, 0, 0, 1, 1,
0.2969885, -0.7634359, 2.475596, 0, 0, 0, 1, 1,
0.2992148, -1.998037, 2.900695, 0, 0, 0, 1, 1,
0.300502, 0.07537118, 2.263073, 0, 0, 0, 1, 1,
0.3006765, 0.3682516, 0.8939269, 0, 0, 0, 1, 1,
0.3013234, -1.222947, 2.683299, 1, 1, 1, 1, 1,
0.3023506, -1.321365, 3.162183, 1, 1, 1, 1, 1,
0.3072127, 1.199493, 1.13633, 1, 1, 1, 1, 1,
0.3102509, 0.7682236, -0.09455426, 1, 1, 1, 1, 1,
0.3135404, -0.1363391, 3.683873, 1, 1, 1, 1, 1,
0.3137186, -2.436742, 4.988292, 1, 1, 1, 1, 1,
0.3141878, 0.8855939, -0.3445536, 1, 1, 1, 1, 1,
0.3184543, -0.7679961, 3.329834, 1, 1, 1, 1, 1,
0.3187478, -0.3363247, 2.840697, 1, 1, 1, 1, 1,
0.3190599, -0.761887, 2.411248, 1, 1, 1, 1, 1,
0.3209157, 0.4425328, -0.412259, 1, 1, 1, 1, 1,
0.3213409, -1.052522, 3.986884, 1, 1, 1, 1, 1,
0.3226923, -1.738298, 2.788535, 1, 1, 1, 1, 1,
0.3236424, -1.358911, 3.717676, 1, 1, 1, 1, 1,
0.3237714, 0.2311077, 0.5782273, 1, 1, 1, 1, 1,
0.3240039, 0.8188562, 1.098096, 0, 0, 1, 1, 1,
0.3242419, -0.5002645, 2.889201, 1, 0, 0, 1, 1,
0.3248033, -0.6181229, 2.752551, 1, 0, 0, 1, 1,
0.3403142, 1.410674, 0.253763, 1, 0, 0, 1, 1,
0.3415791, 1.101466, 1.36704, 1, 0, 0, 1, 1,
0.3445591, 0.5519957, 0.9172951, 1, 0, 0, 1, 1,
0.3535997, 0.7165256, -0.3993707, 0, 0, 0, 1, 1,
0.3564734, 0.4233135, 0.7427135, 0, 0, 0, 1, 1,
0.3600483, -0.6107394, 4.445142, 0, 0, 0, 1, 1,
0.3605857, -0.6938477, 2.507517, 0, 0, 0, 1, 1,
0.3617064, 0.4435366, -1.39096, 0, 0, 0, 1, 1,
0.3634624, -0.1626574, 1.537744, 0, 0, 0, 1, 1,
0.3635161, -1.543132, 3.087197, 0, 0, 0, 1, 1,
0.3644943, 0.7311522, 0.7462453, 1, 1, 1, 1, 1,
0.3657925, -1.072868, 2.694882, 1, 1, 1, 1, 1,
0.3666313, 1.624151, -0.9122038, 1, 1, 1, 1, 1,
0.3679201, 1.524296, 0.6622, 1, 1, 1, 1, 1,
0.3721997, -2.390582, 3.960818, 1, 1, 1, 1, 1,
0.3766505, 0.9309208, -0.8837662, 1, 1, 1, 1, 1,
0.3800573, 0.2013977, 1.184215, 1, 1, 1, 1, 1,
0.3823402, -2.597893, 4.738686, 1, 1, 1, 1, 1,
0.3874114, 1.373738, -0.4294702, 1, 1, 1, 1, 1,
0.3903286, 0.8667892, -0.2793705, 1, 1, 1, 1, 1,
0.3945644, -0.7238132, 0.7678236, 1, 1, 1, 1, 1,
0.3971941, -1.775442, 2.994452, 1, 1, 1, 1, 1,
0.4000252, -1.052985, 2.070763, 1, 1, 1, 1, 1,
0.4041107, -0.1317743, 1.520374, 1, 1, 1, 1, 1,
0.4065627, 0.3671937, 1.865972, 1, 1, 1, 1, 1,
0.4078818, -0.4320019, 1.063964, 0, 0, 1, 1, 1,
0.4137617, -1.262818, 4.199966, 1, 0, 0, 1, 1,
0.4142666, 0.5442654, 0.8453795, 1, 0, 0, 1, 1,
0.4164232, -0.5980142, 2.527473, 1, 0, 0, 1, 1,
0.4257265, 1.207119, 1.516258, 1, 0, 0, 1, 1,
0.4267475, -0.2160124, 2.706454, 1, 0, 0, 1, 1,
0.427374, -0.7282757, 3.464006, 0, 0, 0, 1, 1,
0.432716, 0.8596359, 2.053877, 0, 0, 0, 1, 1,
0.434749, -0.8958305, 1.901524, 0, 0, 0, 1, 1,
0.4411261, -1.830741, 1.789288, 0, 0, 0, 1, 1,
0.4411513, 1.522163, 1.838666, 0, 0, 0, 1, 1,
0.4414557, -1.631855, 3.693094, 0, 0, 0, 1, 1,
0.4436729, -0.8270299, 3.136724, 0, 0, 0, 1, 1,
0.4486854, -1.633107, 1.889358, 1, 1, 1, 1, 1,
0.4522263, 1.057403, -0.00280733, 1, 1, 1, 1, 1,
0.4527056, 0.8283613, -0.4444709, 1, 1, 1, 1, 1,
0.4555179, 0.1261132, 2.214782, 1, 1, 1, 1, 1,
0.4596508, 0.8156016, 1.634066, 1, 1, 1, 1, 1,
0.4623472, 1.151738, -0.3899064, 1, 1, 1, 1, 1,
0.4700569, -0.6813918, 2.588295, 1, 1, 1, 1, 1,
0.4707564, 0.09809199, 0.6010488, 1, 1, 1, 1, 1,
0.4734203, 0.1610685, 0.4155196, 1, 1, 1, 1, 1,
0.475945, 1.00517, -1.192673, 1, 1, 1, 1, 1,
0.4766439, -1.055075, 2.284587, 1, 1, 1, 1, 1,
0.4773917, -2.303912, 1.675383, 1, 1, 1, 1, 1,
0.4779797, 1.484797, 1.034604, 1, 1, 1, 1, 1,
0.4806555, -1.184746, 2.78896, 1, 1, 1, 1, 1,
0.4826086, 1.231712, 0.639123, 1, 1, 1, 1, 1,
0.4836544, 1.398143, -0.2339744, 0, 0, 1, 1, 1,
0.4923693, 0.5453448, 1.568195, 1, 0, 0, 1, 1,
0.4937485, -0.6831877, 2.453344, 1, 0, 0, 1, 1,
0.4991635, -0.2919192, 2.660916, 1, 0, 0, 1, 1,
0.5030104, -1.483552, 2.153587, 1, 0, 0, 1, 1,
0.503022, 1.004999, 0.2181964, 1, 0, 0, 1, 1,
0.5063754, 1.777512, -1.389105, 0, 0, 0, 1, 1,
0.5066583, 0.2424254, 0.4037775, 0, 0, 0, 1, 1,
0.5075251, -1.173243, 2.88974, 0, 0, 0, 1, 1,
0.5076334, 0.2786936, -0.6872728, 0, 0, 0, 1, 1,
0.5080421, 0.731133, 1.141405, 0, 0, 0, 1, 1,
0.5106623, 1.217861, -0.8047327, 0, 0, 0, 1, 1,
0.511535, -0.6174093, 3.971242, 0, 0, 0, 1, 1,
0.5128061, 0.3017348, 0.3287966, 1, 1, 1, 1, 1,
0.513411, 0.9302132, 1.767901, 1, 1, 1, 1, 1,
0.5169437, -1.451531, 2.406031, 1, 1, 1, 1, 1,
0.5170883, -0.3801036, 2.557287, 1, 1, 1, 1, 1,
0.5176377, 1.516792, 0.4823269, 1, 1, 1, 1, 1,
0.5213796, -1.419066, 2.34183, 1, 1, 1, 1, 1,
0.5218321, -0.8839304, 0.9637105, 1, 1, 1, 1, 1,
0.5241151, -0.9138224, 4.108043, 1, 1, 1, 1, 1,
0.5281925, -0.2144114, 2.593363, 1, 1, 1, 1, 1,
0.5283285, 0.2368556, 1.082275, 1, 1, 1, 1, 1,
0.5289007, 0.6809756, 0.8331576, 1, 1, 1, 1, 1,
0.5330614, -0.295576, 1.849463, 1, 1, 1, 1, 1,
0.5344422, -0.6620266, 0.578153, 1, 1, 1, 1, 1,
0.5362675, 0.1597794, 1.357932, 1, 1, 1, 1, 1,
0.5366934, -0.7266435, 3.217877, 1, 1, 1, 1, 1,
0.5497215, -0.3029625, 1.91073, 0, 0, 1, 1, 1,
0.550163, -0.7531438, 1.867898, 1, 0, 0, 1, 1,
0.5516978, 0.4666078, 2.595469, 1, 0, 0, 1, 1,
0.55975, -0.1462906, 0.9752573, 1, 0, 0, 1, 1,
0.5625263, -0.5585843, 1.706374, 1, 0, 0, 1, 1,
0.5718985, 0.5794067, -1.261786, 1, 0, 0, 1, 1,
0.5727997, -0.309691, 3.185139, 0, 0, 0, 1, 1,
0.5729326, -2.2292, 3.685405, 0, 0, 0, 1, 1,
0.5733664, 0.6406767, 0.4029268, 0, 0, 0, 1, 1,
0.5787376, 0.8634157, -0.1682332, 0, 0, 0, 1, 1,
0.5882254, 1.353358, 1.383024, 0, 0, 0, 1, 1,
0.5908938, 0.08942651, 3.930709, 0, 0, 0, 1, 1,
0.5939009, 0.7752166, 1.217768, 0, 0, 0, 1, 1,
0.5989891, 1.338435, 0.4360911, 1, 1, 1, 1, 1,
0.6020488, 0.7866412, 2.336738, 1, 1, 1, 1, 1,
0.6029944, 0.9713095, 1.050752, 1, 1, 1, 1, 1,
0.6034515, -0.502242, 2.710344, 1, 1, 1, 1, 1,
0.6076763, 0.1020211, 0.01006104, 1, 1, 1, 1, 1,
0.6088102, 0.2180978, 2.856982, 1, 1, 1, 1, 1,
0.6101717, -0.1419849, 1.225298, 1, 1, 1, 1, 1,
0.6106572, -1.040727, 1.518771, 1, 1, 1, 1, 1,
0.613007, 0.473344, 1.803309, 1, 1, 1, 1, 1,
0.6182274, -2.160524, 2.172022, 1, 1, 1, 1, 1,
0.6197534, -0.5804973, 2.328534, 1, 1, 1, 1, 1,
0.6217145, 0.164035, 2.204658, 1, 1, 1, 1, 1,
0.6249661, 1.744589, 1.055481, 1, 1, 1, 1, 1,
0.625768, -0.8620557, 2.104416, 1, 1, 1, 1, 1,
0.6265323, 0.175411, 2.172296, 1, 1, 1, 1, 1,
0.632391, 0.06912024, 1.281442, 0, 0, 1, 1, 1,
0.6334828, -0.2676932, 3.153721, 1, 0, 0, 1, 1,
0.6344541, 1.008693, -0.2285617, 1, 0, 0, 1, 1,
0.6349407, 2.375193, 0.6666502, 1, 0, 0, 1, 1,
0.6363891, -0.6181072, -0.6183715, 1, 0, 0, 1, 1,
0.639125, 1.412068, 1.00121, 1, 0, 0, 1, 1,
0.649661, 0.9793781, 0.1449591, 0, 0, 0, 1, 1,
0.6512585, 2.479169, -0.256805, 0, 0, 0, 1, 1,
0.6523293, -0.7759615, 2.582784, 0, 0, 0, 1, 1,
0.6751816, 0.6177362, 0.0002159789, 0, 0, 0, 1, 1,
0.6796222, 0.4831875, 0.7723442, 0, 0, 0, 1, 1,
0.6799703, 2.150777, -0.3228984, 0, 0, 0, 1, 1,
0.6822966, 0.8576407, 0.9367647, 0, 0, 0, 1, 1,
0.6823841, 1.283033, -0.146201, 1, 1, 1, 1, 1,
0.6849037, -0.2508548, 2.02117, 1, 1, 1, 1, 1,
0.6865279, 1.423228, 1.550336, 1, 1, 1, 1, 1,
0.6919784, 0.1993972, 1.302666, 1, 1, 1, 1, 1,
0.6924606, 0.4218175, 0.5721095, 1, 1, 1, 1, 1,
0.6943522, 0.3851673, 0.2431125, 1, 1, 1, 1, 1,
0.7000992, -0.1536851, 2.146796, 1, 1, 1, 1, 1,
0.7013667, -0.3906848, 2.989794, 1, 1, 1, 1, 1,
0.7050533, -1.421375, 3.048058, 1, 1, 1, 1, 1,
0.7079404, 1.080524, 1.98684, 1, 1, 1, 1, 1,
0.7141911, 0.5293346, 1.935657, 1, 1, 1, 1, 1,
0.7152171, -1.369133, 0.4988953, 1, 1, 1, 1, 1,
0.7159393, 1.595475, -0.1997229, 1, 1, 1, 1, 1,
0.7159454, 0.233501, 0.6204234, 1, 1, 1, 1, 1,
0.7191013, 1.319299, -0.02107309, 1, 1, 1, 1, 1,
0.7212833, -0.4836347, 0.5180059, 0, 0, 1, 1, 1,
0.7253741, 0.1781441, -0.3704712, 1, 0, 0, 1, 1,
0.731593, 1.843601, 1.343634, 1, 0, 0, 1, 1,
0.7330166, -0.4066297, 2.569543, 1, 0, 0, 1, 1,
0.7365144, 2.157674, 1.904817, 1, 0, 0, 1, 1,
0.7429103, 0.8856635, 1.160053, 1, 0, 0, 1, 1,
0.7474612, 0.1260432, 1.275113, 0, 0, 0, 1, 1,
0.7488323, -0.8187717, 2.230011, 0, 0, 0, 1, 1,
0.7698995, -1.645217, 2.103793, 0, 0, 0, 1, 1,
0.7732705, 0.2998641, 1.302717, 0, 0, 0, 1, 1,
0.7861322, 2.556759, 1.481263, 0, 0, 0, 1, 1,
0.7944294, -0.6611701, 1.869244, 0, 0, 0, 1, 1,
0.8017805, -0.3039403, 1.971907, 0, 0, 0, 1, 1,
0.8040575, 0.137122, 1.468471, 1, 1, 1, 1, 1,
0.8095238, 0.4754429, 0.8535105, 1, 1, 1, 1, 1,
0.8098917, 1.921908, -1.446399, 1, 1, 1, 1, 1,
0.8107829, -0.7209841, 3.116914, 1, 1, 1, 1, 1,
0.8170297, -0.1696239, 2.843846, 1, 1, 1, 1, 1,
0.8233463, 0.251027, 0.8217878, 1, 1, 1, 1, 1,
0.8250255, 1.227021, 0.1104889, 1, 1, 1, 1, 1,
0.8290066, -0.1553898, 0.3022849, 1, 1, 1, 1, 1,
0.8374445, 0.8437557, 1.351564, 1, 1, 1, 1, 1,
0.8386693, -0.683546, 2.368206, 1, 1, 1, 1, 1,
0.8388436, -1.263451, 4.051895, 1, 1, 1, 1, 1,
0.8429579, 0.567682, 0.9968853, 1, 1, 1, 1, 1,
0.8528776, 1.63238, 0.2017031, 1, 1, 1, 1, 1,
0.8577641, -0.2107749, 3.148574, 1, 1, 1, 1, 1,
0.8748416, 0.8432634, 2.689327, 1, 1, 1, 1, 1,
0.8805215, -0.4151576, 1.62871, 0, 0, 1, 1, 1,
0.8892896, -1.01517, 1.767661, 1, 0, 0, 1, 1,
0.8995955, 1.210702, 1.092057, 1, 0, 0, 1, 1,
0.9082333, -0.2559071, 2.771307, 1, 0, 0, 1, 1,
0.9117482, -0.0561605, 3.950502, 1, 0, 0, 1, 1,
0.9134228, 0.7412472, 0.115496, 1, 0, 0, 1, 1,
0.9166422, -0.1231996, 0.6571066, 0, 0, 0, 1, 1,
0.9261156, 0.6697556, 2.047978, 0, 0, 0, 1, 1,
0.9325129, -0.8394643, 2.319774, 0, 0, 0, 1, 1,
0.9459097, 0.7761893, 1.038868, 0, 0, 0, 1, 1,
0.9460136, 3.054545, -0.281229, 0, 0, 0, 1, 1,
0.9622505, 0.08277403, 2.652074, 0, 0, 0, 1, 1,
0.9710885, 0.8646424, 0.1666785, 0, 0, 0, 1, 1,
0.9718394, 1.317514, 1.641693, 1, 1, 1, 1, 1,
0.9749572, -0.6945485, 4.576375, 1, 1, 1, 1, 1,
0.9787524, 0.6845237, 0.713408, 1, 1, 1, 1, 1,
0.9803709, -0.7394826, 2.795748, 1, 1, 1, 1, 1,
0.9829796, -0.3420263, 1.044075, 1, 1, 1, 1, 1,
0.9849479, 0.2715664, 1.579068, 1, 1, 1, 1, 1,
0.9920079, -0.2206502, -0.953661, 1, 1, 1, 1, 1,
0.9932833, 0.4219147, 0.1290897, 1, 1, 1, 1, 1,
0.998309, 0.5069042, 1.121415, 1, 1, 1, 1, 1,
1.012403, -0.4270048, 0.2198368, 1, 1, 1, 1, 1,
1.012408, 2.082555, 0.5919222, 1, 1, 1, 1, 1,
1.013932, 1.17764, 1.082587, 1, 1, 1, 1, 1,
1.022797, -0.3083007, 2.802879, 1, 1, 1, 1, 1,
1.023396, -0.260614, 3.152262, 1, 1, 1, 1, 1,
1.026577, 0.4541573, 0.290616, 1, 1, 1, 1, 1,
1.029568, 0.9774746, 1.976381, 0, 0, 1, 1, 1,
1.034549, -0.8722419, 1.375386, 1, 0, 0, 1, 1,
1.039778, 0.1953142, 3.632934, 1, 0, 0, 1, 1,
1.041101, 0.5589382, 0.2704205, 1, 0, 0, 1, 1,
1.043193, 1.174518, 0.3221106, 1, 0, 0, 1, 1,
1.045169, -0.1357967, 3.177641, 1, 0, 0, 1, 1,
1.055588, 0.8435996, -0.9973409, 0, 0, 0, 1, 1,
1.060427, -0.3226129, 1.59455, 0, 0, 0, 1, 1,
1.064761, 1.180903, -0.0379709, 0, 0, 0, 1, 1,
1.068342, 0.5282057, 3.136517, 0, 0, 0, 1, 1,
1.07447, -1.103561, 1.405563, 0, 0, 0, 1, 1,
1.082541, 0.8367838, 2.294257, 0, 0, 0, 1, 1,
1.0828, -1.951831, 0.9081743, 0, 0, 0, 1, 1,
1.089874, 0.5009271, 1.493464, 1, 1, 1, 1, 1,
1.096588, -0.1934649, -0.4269923, 1, 1, 1, 1, 1,
1.097229, -1.182204, 3.520925, 1, 1, 1, 1, 1,
1.104527, 1.184219, -0.2806583, 1, 1, 1, 1, 1,
1.106026, 0.5500515, 1.010891, 1, 1, 1, 1, 1,
1.117826, 0.9483415, 1.171347, 1, 1, 1, 1, 1,
1.118575, 0.07205322, 0.6808031, 1, 1, 1, 1, 1,
1.124939, -1.357483, 1.023065, 1, 1, 1, 1, 1,
1.130862, 1.714016, 1.845729, 1, 1, 1, 1, 1,
1.133204, 0.886009, 0.4085662, 1, 1, 1, 1, 1,
1.135712, 0.788725, 2.310148, 1, 1, 1, 1, 1,
1.137201, 0.6911495, -0.2216438, 1, 1, 1, 1, 1,
1.140016, -0.5263667, 0.7042969, 1, 1, 1, 1, 1,
1.147463, -0.6999451, 1.883293, 1, 1, 1, 1, 1,
1.157614, 1.108751, 1.733683, 1, 1, 1, 1, 1,
1.15783, 0.5779704, 0.7719907, 0, 0, 1, 1, 1,
1.15823, -0.9995921, 2.503618, 1, 0, 0, 1, 1,
1.165597, 0.1842374, 1.177534, 1, 0, 0, 1, 1,
1.173422, 1.245586, 1.732221, 1, 0, 0, 1, 1,
1.174389, 0.6233149, 0.6119906, 1, 0, 0, 1, 1,
1.181951, 0.09815873, 1.830916, 1, 0, 0, 1, 1,
1.182176, 0.2015736, 0.9832854, 0, 0, 0, 1, 1,
1.18224, -0.3676426, 0.5106473, 0, 0, 0, 1, 1,
1.184268, 0.4076715, 2.21355, 0, 0, 0, 1, 1,
1.187183, 0.7736082, 1.049876, 0, 0, 0, 1, 1,
1.192335, -1.054121, 1.845773, 0, 0, 0, 1, 1,
1.193395, -1.504022, 1.766512, 0, 0, 0, 1, 1,
1.195467, 0.2549974, -0.4045025, 0, 0, 0, 1, 1,
1.201386, -0.4863745, 0.6591207, 1, 1, 1, 1, 1,
1.212463, -0.5263515, 2.888035, 1, 1, 1, 1, 1,
1.213593, -0.2541648, 2.065445, 1, 1, 1, 1, 1,
1.23817, -0.744511, 1.063498, 1, 1, 1, 1, 1,
1.240209, -0.7315427, 2.755339, 1, 1, 1, 1, 1,
1.240216, 0.3515333, 1.446118, 1, 1, 1, 1, 1,
1.240381, -0.8672457, 4.122682, 1, 1, 1, 1, 1,
1.240525, -0.5856822, -1.021156, 1, 1, 1, 1, 1,
1.247145, -0.130952, 2.151382, 1, 1, 1, 1, 1,
1.248629, 1.852517, 1.054204, 1, 1, 1, 1, 1,
1.253735, -0.1386233, 1.397255, 1, 1, 1, 1, 1,
1.258536, -0.6841446, 4.196728, 1, 1, 1, 1, 1,
1.273573, 0.7501557, 1.918673, 1, 1, 1, 1, 1,
1.278799, -0.724956, 2.229801, 1, 1, 1, 1, 1,
1.284736, -0.7446762, 1.117612, 1, 1, 1, 1, 1,
1.297508, 0.3183402, 3.014246, 0, 0, 1, 1, 1,
1.299897, 0.3310985, -0.5315836, 1, 0, 0, 1, 1,
1.302724, -0.4442298, 0.988329, 1, 0, 0, 1, 1,
1.304822, -1.612043, 3.737537, 1, 0, 0, 1, 1,
1.310165, 0.5390127, 1.247006, 1, 0, 0, 1, 1,
1.314971, 1.207021, 0.4938096, 1, 0, 0, 1, 1,
1.31724, 0.3894226, 2.404229, 0, 0, 0, 1, 1,
1.317248, 1.155133, 0.1581926, 0, 0, 0, 1, 1,
1.31796, 0.5132083, 0.327914, 0, 0, 0, 1, 1,
1.323323, -1.30911, 3.370932, 0, 0, 0, 1, 1,
1.324947, -1.11063, 2.9992, 0, 0, 0, 1, 1,
1.325038, 0.5716969, 1.678573, 0, 0, 0, 1, 1,
1.325097, -0.06040504, 0.899296, 0, 0, 0, 1, 1,
1.331991, 0.4877193, 2.278085, 1, 1, 1, 1, 1,
1.334105, -0.1672963, 0.8939242, 1, 1, 1, 1, 1,
1.336379, 0.1825117, 1.248624, 1, 1, 1, 1, 1,
1.33856, -1.226678, 2.523331, 1, 1, 1, 1, 1,
1.345322, 0.8759297, 0.8628588, 1, 1, 1, 1, 1,
1.347839, 1.044526, 0.6645859, 1, 1, 1, 1, 1,
1.35091, -0.8289607, 3.101451, 1, 1, 1, 1, 1,
1.351958, -0.3091851, 2.232486, 1, 1, 1, 1, 1,
1.360479, -0.4797046, 3.150312, 1, 1, 1, 1, 1,
1.364771, -0.4381867, 1.664939, 1, 1, 1, 1, 1,
1.377333, 0.6718723, -0.05304279, 1, 1, 1, 1, 1,
1.392457, -0.8638573, 1.99563, 1, 1, 1, 1, 1,
1.403119, 0.04833799, 2.178022, 1, 1, 1, 1, 1,
1.403582, 1.862688, -0.3404085, 1, 1, 1, 1, 1,
1.410605, -2.317671, 3.068189, 1, 1, 1, 1, 1,
1.416217, -0.5185, 1.284045, 0, 0, 1, 1, 1,
1.424515, -0.1870886, 1.588008, 1, 0, 0, 1, 1,
1.43472, -0.5784794, 3.282382, 1, 0, 0, 1, 1,
1.437156, 0.6916125, 1.043118, 1, 0, 0, 1, 1,
1.445206, 0.835954, 0.9670384, 1, 0, 0, 1, 1,
1.445873, -0.1652286, 0.8147755, 1, 0, 0, 1, 1,
1.447537, 0.5694028, 1.372422, 0, 0, 0, 1, 1,
1.457512, 0.4853042, 2.27389, 0, 0, 0, 1, 1,
1.469632, 1.540592, 1.61962, 0, 0, 0, 1, 1,
1.473255, 0.2877117, 0.3902594, 0, 0, 0, 1, 1,
1.480888, 1.161489, -2.025096, 0, 0, 0, 1, 1,
1.487731, 0.6955144, 3.041135, 0, 0, 0, 1, 1,
1.499407, -1.000621, 1.544051, 0, 0, 0, 1, 1,
1.532323, -0.1357238, 0.4416928, 1, 1, 1, 1, 1,
1.549258, -0.4385985, 1.637637, 1, 1, 1, 1, 1,
1.558563, 0.6206946, 0.5942163, 1, 1, 1, 1, 1,
1.55917, 0.8318927, -0.8253985, 1, 1, 1, 1, 1,
1.585146, 1.409536, 0.8849298, 1, 1, 1, 1, 1,
1.59856, -1.958948, 2.559504, 1, 1, 1, 1, 1,
1.599585, 0.09494244, 1.063868, 1, 1, 1, 1, 1,
1.618157, 1.115017, 1.572068, 1, 1, 1, 1, 1,
1.622084, 1.420982, 0.7825054, 1, 1, 1, 1, 1,
1.622618, 0.7359052, 1.597669, 1, 1, 1, 1, 1,
1.629468, 0.3187903, 1.146344, 1, 1, 1, 1, 1,
1.642379, 0.4907185, 1.18093, 1, 1, 1, 1, 1,
1.660493, -2.530217, 2.346671, 1, 1, 1, 1, 1,
1.661662, -0.48416, 4.679385, 1, 1, 1, 1, 1,
1.66372, 0.7330348, -0.2246142, 1, 1, 1, 1, 1,
1.663957, -1.190502, 0.890587, 0, 0, 1, 1, 1,
1.683797, -1.913726, 2.252867, 1, 0, 0, 1, 1,
1.703625, -0.7451509, 2.938451, 1, 0, 0, 1, 1,
1.708884, -1.014581, 4.606073, 1, 0, 0, 1, 1,
1.715379, 0.4752753, 4.577035, 1, 0, 0, 1, 1,
1.717274, -1.418491, 2.040878, 1, 0, 0, 1, 1,
1.717786, 1.281935, 2.408033, 0, 0, 0, 1, 1,
1.721641, 0.572883, -0.1340804, 0, 0, 0, 1, 1,
1.72281, 2.189946, -0.7154053, 0, 0, 0, 1, 1,
1.725295, -0.06397127, 1.597144, 0, 0, 0, 1, 1,
1.744638, -2.664596, 4.275524, 0, 0, 0, 1, 1,
1.751834, 0.5100272, 1.366307, 0, 0, 0, 1, 1,
1.770519, -0.9237221, 3.374223, 0, 0, 0, 1, 1,
1.777329, -1.497696, 2.146093, 1, 1, 1, 1, 1,
1.794775, 0.780879, 2.05668, 1, 1, 1, 1, 1,
1.797589, -1.157923, 1.210349, 1, 1, 1, 1, 1,
1.812036, -0.6870829, 1.489771, 1, 1, 1, 1, 1,
1.831859, 1.486804, 0.1610114, 1, 1, 1, 1, 1,
1.834898, 1.182472, -0.6978455, 1, 1, 1, 1, 1,
1.840692, 1.069778, 0.2741563, 1, 1, 1, 1, 1,
1.841972, -0.9239188, 2.145661, 1, 1, 1, 1, 1,
1.848242, -0.3566813, 1.052501, 1, 1, 1, 1, 1,
1.855271, -0.7805254, 2.59847, 1, 1, 1, 1, 1,
1.887169, -1.054278, 2.554045, 1, 1, 1, 1, 1,
1.897329, -1.593381, 0.9277794, 1, 1, 1, 1, 1,
1.962266, 1.222213, 1.446086, 1, 1, 1, 1, 1,
1.966517, 0.441576, 2.379866, 1, 1, 1, 1, 1,
1.987125, -0.913975, 2.121829, 1, 1, 1, 1, 1,
2.00536, -1.25611, 0.5492619, 0, 0, 1, 1, 1,
2.052687, -0.434883, 0.636059, 1, 0, 0, 1, 1,
2.055653, -0.8615386, 5.530992, 1, 0, 0, 1, 1,
2.060747, 0.9793961, 1.403173, 1, 0, 0, 1, 1,
2.082012, -0.7936516, 3.661292, 1, 0, 0, 1, 1,
2.090633, -0.131131, 1.217109, 1, 0, 0, 1, 1,
2.105762, 0.5318695, -0.6090217, 0, 0, 0, 1, 1,
2.123152, 1.082734, -0.5956751, 0, 0, 0, 1, 1,
2.128307, 1.025062, 2.613144, 0, 0, 0, 1, 1,
2.169332, 0.5561229, 1.387511, 0, 0, 0, 1, 1,
2.17788, -0.001860307, 1.79247, 0, 0, 0, 1, 1,
2.187041, 2.696998, -1.009652, 0, 0, 0, 1, 1,
2.18762, 0.8869987, 2.380429, 0, 0, 0, 1, 1,
2.235253, 1.137079, 0.8843223, 1, 1, 1, 1, 1,
2.31635, -0.4095271, 0.06071104, 1, 1, 1, 1, 1,
2.370529, 0.394036, 3.70029, 1, 1, 1, 1, 1,
2.480563, -1.169158, 1.864932, 1, 1, 1, 1, 1,
2.531797, -0.9676265, 2.348301, 1, 1, 1, 1, 1,
2.553203, -0.09469252, 1.970845, 1, 1, 1, 1, 1,
2.598348, -1.645051, 2.743627, 1, 1, 1, 1, 1
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
var radius = 9.316137;
var distance = 32.72253;
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
mvMatrix.translate( 0.07703066, 0.09614253, -0.4506454 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.72253);
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