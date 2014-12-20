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
-3.386747, 0.8928764, -2.476464, 1, 0, 0, 1,
-3.314352, -0.5805013, -2.590437, 1, 0.007843138, 0, 1,
-2.839296, 0.6305912, 0.4917215, 1, 0.01176471, 0, 1,
-2.82287, 0.1478399, 0.8636954, 1, 0.01960784, 0, 1,
-2.804842, 0.0395733, -2.134261, 1, 0.02352941, 0, 1,
-2.794037, -0.9643559, -1.566496, 1, 0.03137255, 0, 1,
-2.610752, -0.9702084, -1.128158, 1, 0.03529412, 0, 1,
-2.470627, 2.033209, -2.138685, 1, 0.04313726, 0, 1,
-2.461135, -1.15964, -2.248085, 1, 0.04705882, 0, 1,
-2.413809, -0.6993769, -2.985855, 1, 0.05490196, 0, 1,
-2.398119, 1.564701, -0.3641949, 1, 0.05882353, 0, 1,
-2.29881, 0.5779274, -1.117392, 1, 0.06666667, 0, 1,
-2.270488, -0.6069425, -0.5713085, 1, 0.07058824, 0, 1,
-2.257384, -0.8627934, -1.180393, 1, 0.07843138, 0, 1,
-2.216948, -1.205059, -2.652595, 1, 0.08235294, 0, 1,
-2.186395, 0.2782623, -2.912889, 1, 0.09019608, 0, 1,
-2.169637, -0.3230307, -1.980948, 1, 0.09411765, 0, 1,
-2.165123, 0.7814707, -0.8617325, 1, 0.1019608, 0, 1,
-2.126917, -0.770697, -2.231846, 1, 0.1098039, 0, 1,
-2.107872, -1.446492, -1.770826, 1, 0.1137255, 0, 1,
-2.035374, 1.48439, -0.4817507, 1, 0.1215686, 0, 1,
-1.998519, -0.1210427, -3.244236, 1, 0.1254902, 0, 1,
-1.979894, 0.1617664, -1.510918, 1, 0.1333333, 0, 1,
-1.977048, 0.8244876, -0.8706397, 1, 0.1372549, 0, 1,
-1.963305, -2.27302, -4.106205, 1, 0.145098, 0, 1,
-1.94248, 0.3831705, -1.151078, 1, 0.1490196, 0, 1,
-1.925624, -0.6095733, -0.3489452, 1, 0.1568628, 0, 1,
-1.917703, 0.4986001, -0.8878224, 1, 0.1607843, 0, 1,
-1.907933, 1.213191, -1.823464, 1, 0.1686275, 0, 1,
-1.876232, -0.9466521, -1.588042, 1, 0.172549, 0, 1,
-1.864487, -1.172445, -2.023256, 1, 0.1803922, 0, 1,
-1.844753, -0.07363499, -1.703703, 1, 0.1843137, 0, 1,
-1.829479, 1.494122, -1.84799, 1, 0.1921569, 0, 1,
-1.818865, 1.296995, -1.143706, 1, 0.1960784, 0, 1,
-1.798256, -2.420573, -1.724554, 1, 0.2039216, 0, 1,
-1.795792, -0.4538501, -0.7875447, 1, 0.2117647, 0, 1,
-1.791279, 0.6160353, 0.3590378, 1, 0.2156863, 0, 1,
-1.788059, -0.2091241, -1.636674, 1, 0.2235294, 0, 1,
-1.779715, 0.7556418, -2.092731, 1, 0.227451, 0, 1,
-1.772275, -0.8727522, -1.233567, 1, 0.2352941, 0, 1,
-1.772008, -1.115733, -0.8127417, 1, 0.2392157, 0, 1,
-1.771074, 0.6785489, -2.191408, 1, 0.2470588, 0, 1,
-1.744464, -1.297457, -2.72197, 1, 0.2509804, 0, 1,
-1.7183, -0.3752001, -0.901535, 1, 0.2588235, 0, 1,
-1.711838, 1.345942, 0.7479604, 1, 0.2627451, 0, 1,
-1.693395, -0.07150353, -2.982033, 1, 0.2705882, 0, 1,
-1.691159, 0.3207215, -0.9941432, 1, 0.2745098, 0, 1,
-1.686457, 0.03741697, -2.353641, 1, 0.282353, 0, 1,
-1.68086, 0.8082469, -0.8776492, 1, 0.2862745, 0, 1,
-1.672497, 0.6903476, -2.842906, 1, 0.2941177, 0, 1,
-1.662272, -1.131647, -2.097835, 1, 0.3019608, 0, 1,
-1.638822, 1.600776, -1.929805, 1, 0.3058824, 0, 1,
-1.634811, 0.6996274, -1.463416, 1, 0.3137255, 0, 1,
-1.631638, 1.11371, -1.375686, 1, 0.3176471, 0, 1,
-1.629852, -0.1953009, -2.683045, 1, 0.3254902, 0, 1,
-1.613554, -0.2096963, -3.095528, 1, 0.3294118, 0, 1,
-1.613165, -0.4282711, -0.9349323, 1, 0.3372549, 0, 1,
-1.609181, 0.2729514, -2.405253, 1, 0.3411765, 0, 1,
-1.605509, -0.4278685, -0.5972177, 1, 0.3490196, 0, 1,
-1.60259, -0.2661512, -1.817553, 1, 0.3529412, 0, 1,
-1.573401, -0.3375946, -2.791837, 1, 0.3607843, 0, 1,
-1.571968, -0.3836125, -2.624839, 1, 0.3647059, 0, 1,
-1.560759, 0.1147113, 0.5042993, 1, 0.372549, 0, 1,
-1.552046, -0.5911098, -4.339899, 1, 0.3764706, 0, 1,
-1.53713, -1.604922, -2.673849, 1, 0.3843137, 0, 1,
-1.526303, 0.2155249, -1.159194, 1, 0.3882353, 0, 1,
-1.521561, 1.117221, -1.434035, 1, 0.3960784, 0, 1,
-1.516453, -0.5270915, -1.916964, 1, 0.4039216, 0, 1,
-1.506912, 1.425769, 0.3259849, 1, 0.4078431, 0, 1,
-1.488044, 0.6420147, -0.6066327, 1, 0.4156863, 0, 1,
-1.465169, 0.5515718, -3.048424, 1, 0.4196078, 0, 1,
-1.45064, -0.9759395, -0.6002192, 1, 0.427451, 0, 1,
-1.440346, 0.8947244, -1.487473, 1, 0.4313726, 0, 1,
-1.424271, -0.1008987, -3.102558, 1, 0.4392157, 0, 1,
-1.407205, 0.3832024, -1.112369, 1, 0.4431373, 0, 1,
-1.383701, 0.2384722, -1.268284, 1, 0.4509804, 0, 1,
-1.381267, -0.887187, -2.724056, 1, 0.454902, 0, 1,
-1.374894, -0.5731511, -1.696688, 1, 0.4627451, 0, 1,
-1.372574, 0.0005639174, -2.454827, 1, 0.4666667, 0, 1,
-1.37209, 0.404982, -1.737321, 1, 0.4745098, 0, 1,
-1.359802, -0.7863732, -1.876846, 1, 0.4784314, 0, 1,
-1.356132, 0.03949691, -0.2520193, 1, 0.4862745, 0, 1,
-1.346912, -0.5047352, -3.341348, 1, 0.4901961, 0, 1,
-1.339071, 0.4853856, -1.593702, 1, 0.4980392, 0, 1,
-1.331737, 1.396632, -1.275553, 1, 0.5058824, 0, 1,
-1.308801, -2.166811, -2.862498, 1, 0.509804, 0, 1,
-1.304833, -1.101518, -0.5706431, 1, 0.5176471, 0, 1,
-1.293031, -0.8127236, -3.546814, 1, 0.5215687, 0, 1,
-1.289015, 1.014781, -1.934195, 1, 0.5294118, 0, 1,
-1.269715, 1.953125, 1.452439, 1, 0.5333334, 0, 1,
-1.264038, 0.05823319, -0.9631849, 1, 0.5411765, 0, 1,
-1.25614, 1.068232, -1.526449, 1, 0.5450981, 0, 1,
-1.252967, -2.069434, -1.198133, 1, 0.5529412, 0, 1,
-1.245206, -1.406197, -3.561164, 1, 0.5568628, 0, 1,
-1.242989, 0.9590255, -0.9362001, 1, 0.5647059, 0, 1,
-1.241308, 0.3852869, -1.254089, 1, 0.5686275, 0, 1,
-1.2397, 0.4266645, -0.2329132, 1, 0.5764706, 0, 1,
-1.237031, 0.9419682, -2.460866, 1, 0.5803922, 0, 1,
-1.222494, -1.436533, -2.029008, 1, 0.5882353, 0, 1,
-1.207108, 0.4326423, -0.808953, 1, 0.5921569, 0, 1,
-1.198774, -0.4810986, -1.32758, 1, 0.6, 0, 1,
-1.198354, 0.13618, -0.9450047, 1, 0.6078432, 0, 1,
-1.196399, -0.1620263, -1.582882, 1, 0.6117647, 0, 1,
-1.191742, -0.6393791, -2.199554, 1, 0.6196079, 0, 1,
-1.191212, 0.3128524, -2.234305, 1, 0.6235294, 0, 1,
-1.183924, 0.4212293, -2.491595, 1, 0.6313726, 0, 1,
-1.16637, 0.6737351, -2.021901, 1, 0.6352941, 0, 1,
-1.155456, 2.765148, 0.3981352, 1, 0.6431373, 0, 1,
-1.153501, -0.9715182, -0.470091, 1, 0.6470588, 0, 1,
-1.153263, -0.7600219, -3.102481, 1, 0.654902, 0, 1,
-1.141433, -0.8829905, -0.7849517, 1, 0.6588235, 0, 1,
-1.140844, 0.6701689, -1.966798, 1, 0.6666667, 0, 1,
-1.135349, 1.287292, 0.4327815, 1, 0.6705883, 0, 1,
-1.124428, 1.198141, 0.8776988, 1, 0.6784314, 0, 1,
-1.123469, -0.4603235, -2.253521, 1, 0.682353, 0, 1,
-1.123109, -1.175827, -2.595231, 1, 0.6901961, 0, 1,
-1.116801, -1.67152, -3.28985, 1, 0.6941177, 0, 1,
-1.115019, -2.416508, -2.637658, 1, 0.7019608, 0, 1,
-1.110741, 1.658366, -1.103163, 1, 0.7098039, 0, 1,
-1.104999, 0.5666066, -2.277746, 1, 0.7137255, 0, 1,
-1.098024, 0.3045556, -2.093607, 1, 0.7215686, 0, 1,
-1.087402, -1.404543, -1.632243, 1, 0.7254902, 0, 1,
-1.085782, -0.7940434, -3.156439, 1, 0.7333333, 0, 1,
-1.071734, 0.2312333, -0.7872218, 1, 0.7372549, 0, 1,
-1.070961, 0.2558593, -1.012541, 1, 0.7450981, 0, 1,
-1.062177, 2.515478, 0.6594539, 1, 0.7490196, 0, 1,
-1.050428, -0.9462935, -1.771016, 1, 0.7568628, 0, 1,
-1.034378, 0.1826548, -2.511232, 1, 0.7607843, 0, 1,
-1.028046, -0.1480344, -0.5890493, 1, 0.7686275, 0, 1,
-1.025176, 2.916569, 0.4304933, 1, 0.772549, 0, 1,
-1.01659, -1.569537, -2.603938, 1, 0.7803922, 0, 1,
-1.015251, 1.407588, -1.26863, 1, 0.7843137, 0, 1,
-1.011229, 0.02536508, -2.519119, 1, 0.7921569, 0, 1,
-1.004969, 0.4671915, -1.420285, 1, 0.7960784, 0, 1,
-1.002422, 0.370095, -2.262672, 1, 0.8039216, 0, 1,
-0.9977345, -0.9750229, -2.287616, 1, 0.8117647, 0, 1,
-0.9909928, 1.701842, -1.147763, 1, 0.8156863, 0, 1,
-0.9854566, 1.00054, 1.101827, 1, 0.8235294, 0, 1,
-0.9746175, -0.0306662, -2.973372, 1, 0.827451, 0, 1,
-0.9689354, 0.1378027, 0.08739262, 1, 0.8352941, 0, 1,
-0.9657844, -1.740564, -3.251787, 1, 0.8392157, 0, 1,
-0.964491, -1.475133, -3.454569, 1, 0.8470588, 0, 1,
-0.9637692, -1.046479, -1.887359, 1, 0.8509804, 0, 1,
-0.9619714, -0.4175085, -2.778983, 1, 0.8588235, 0, 1,
-0.9615983, 1.2425, -1.035656, 1, 0.8627451, 0, 1,
-0.9554753, -1.929483, -3.112592, 1, 0.8705882, 0, 1,
-0.9554428, -0.2387693, -1.526652, 1, 0.8745098, 0, 1,
-0.9493402, 0.6651476, -0.9238748, 1, 0.8823529, 0, 1,
-0.9456187, -0.6082394, -1.458319, 1, 0.8862745, 0, 1,
-0.93863, 0.5697095, -0.3061058, 1, 0.8941177, 0, 1,
-0.9325407, -1.378705, -1.96348, 1, 0.8980392, 0, 1,
-0.9319097, -1.0382, -0.381612, 1, 0.9058824, 0, 1,
-0.9315472, -0.88773, -2.047298, 1, 0.9137255, 0, 1,
-0.9302946, 0.5024275, -0.1173747, 1, 0.9176471, 0, 1,
-0.9258841, 1.976127, -1.676569, 1, 0.9254902, 0, 1,
-0.9258637, -1.056258, -2.440348, 1, 0.9294118, 0, 1,
-0.9179127, 0.9163585, -0.2167509, 1, 0.9372549, 0, 1,
-0.9135199, -0.7841904, -1.749625, 1, 0.9411765, 0, 1,
-0.9109637, 1.260547, 0.5660704, 1, 0.9490196, 0, 1,
-0.8994607, -1.608897, -4.116858, 1, 0.9529412, 0, 1,
-0.8966936, 0.6138712, -1.32193, 1, 0.9607843, 0, 1,
-0.8950582, 0.09856072, -0.7949048, 1, 0.9647059, 0, 1,
-0.892844, 1.285282, 0.4925519, 1, 0.972549, 0, 1,
-0.8924339, 0.003451164, -0.08307583, 1, 0.9764706, 0, 1,
-0.8903372, 0.9950901, -2.846652, 1, 0.9843137, 0, 1,
-0.885377, -0.5455035, -2.300071, 1, 0.9882353, 0, 1,
-0.8852174, 0.2497586, -1.863053, 1, 0.9960784, 0, 1,
-0.8849564, 0.3746725, -2.005386, 0.9960784, 1, 0, 1,
-0.8812477, 0.7019709, -2.208694, 0.9921569, 1, 0, 1,
-0.8766978, -1.032718, -2.704748, 0.9843137, 1, 0, 1,
-0.8737013, -0.1988055, -0.3147957, 0.9803922, 1, 0, 1,
-0.8624846, 1.649838, 1.226778, 0.972549, 1, 0, 1,
-0.8603054, -0.4252461, -1.906875, 0.9686275, 1, 0, 1,
-0.8599987, -0.813889, -3.038326, 0.9607843, 1, 0, 1,
-0.8511599, -0.1675568, -1.368903, 0.9568627, 1, 0, 1,
-0.8509773, -1.097774, -1.719247, 0.9490196, 1, 0, 1,
-0.8486431, -0.1457711, -0.709928, 0.945098, 1, 0, 1,
-0.8394257, -1.235443, -4.036812, 0.9372549, 1, 0, 1,
-0.8359999, 0.345738, -2.231137, 0.9333333, 1, 0, 1,
-0.8329273, -0.6561622, -2.426685, 0.9254902, 1, 0, 1,
-0.8308992, -2.56835, -2.967902, 0.9215686, 1, 0, 1,
-0.8238955, 0.6204993, -1.895881, 0.9137255, 1, 0, 1,
-0.8235874, -0.2528013, -2.560189, 0.9098039, 1, 0, 1,
-0.8225399, 0.6041049, -0.9457937, 0.9019608, 1, 0, 1,
-0.8135496, 0.3680035, 0.07938443, 0.8941177, 1, 0, 1,
-0.813544, 0.663546, -0.2654456, 0.8901961, 1, 0, 1,
-0.8027908, -1.174227, -3.525127, 0.8823529, 1, 0, 1,
-0.7984186, 0.8998123, -1.981858, 0.8784314, 1, 0, 1,
-0.7975885, 0.4699488, -0.1762353, 0.8705882, 1, 0, 1,
-0.7948436, -1.168193, -2.651894, 0.8666667, 1, 0, 1,
-0.7921152, -1.048704, -2.441672, 0.8588235, 1, 0, 1,
-0.7895917, -0.4247215, -2.24006, 0.854902, 1, 0, 1,
-0.7860692, 0.52881, -0.7644989, 0.8470588, 1, 0, 1,
-0.7858348, -0.6211295, -2.266851, 0.8431373, 1, 0, 1,
-0.7849778, 0.4101456, -1.416837, 0.8352941, 1, 0, 1,
-0.7841402, 0.6980922, 1.693036, 0.8313726, 1, 0, 1,
-0.7820698, 0.09551582, -2.457766, 0.8235294, 1, 0, 1,
-0.7807083, -0.2811359, -0.5968287, 0.8196079, 1, 0, 1,
-0.7779848, -0.363809, -1.240463, 0.8117647, 1, 0, 1,
-0.7758111, 0.08862172, -1.910198, 0.8078431, 1, 0, 1,
-0.7745622, -1.924513, -1.234149, 0.8, 1, 0, 1,
-0.7743536, -2.340427, -2.814129, 0.7921569, 1, 0, 1,
-0.7735534, 0.2949929, -2.257686, 0.7882353, 1, 0, 1,
-0.770561, 0.5546306, -2.597077, 0.7803922, 1, 0, 1,
-0.7702629, -0.5833173, -0.7731004, 0.7764706, 1, 0, 1,
-0.7696927, 1.279114, -2.406353, 0.7686275, 1, 0, 1,
-0.7669314, -0.4805735, -1.004706, 0.7647059, 1, 0, 1,
-0.7657614, -0.56345, -2.115611, 0.7568628, 1, 0, 1,
-0.7596211, -0.6208573, -2.208357, 0.7529412, 1, 0, 1,
-0.759562, 1.591631, -0.2492338, 0.7450981, 1, 0, 1,
-0.7566601, 0.1080843, -2.125183, 0.7411765, 1, 0, 1,
-0.7565959, 1.564182, 0.5678639, 0.7333333, 1, 0, 1,
-0.7545999, 0.8717023, -1.117727, 0.7294118, 1, 0, 1,
-0.7524354, 1.038747, -0.949885, 0.7215686, 1, 0, 1,
-0.7484708, 1.824499, 0.1700442, 0.7176471, 1, 0, 1,
-0.7384863, -0.7700906, -3.405917, 0.7098039, 1, 0, 1,
-0.7355334, -0.4738851, -3.572298, 0.7058824, 1, 0, 1,
-0.7328537, -0.1787773, 0.2528567, 0.6980392, 1, 0, 1,
-0.7318504, 0.8398534, -0.4661415, 0.6901961, 1, 0, 1,
-0.7300602, 1.568835, 0.6869035, 0.6862745, 1, 0, 1,
-0.7271105, -0.4852501, -2.181515, 0.6784314, 1, 0, 1,
-0.7269578, -0.745236, -0.00730854, 0.6745098, 1, 0, 1,
-0.7234555, -0.241824, -1.511201, 0.6666667, 1, 0, 1,
-0.7204229, 1.401654, 0.7462438, 0.6627451, 1, 0, 1,
-0.7163717, 0.2279122, -4.420116, 0.654902, 1, 0, 1,
-0.7133624, -0.952997, -2.509366, 0.6509804, 1, 0, 1,
-0.712734, 0.730799, -0.6124671, 0.6431373, 1, 0, 1,
-0.7124986, -1.319317, -2.262848, 0.6392157, 1, 0, 1,
-0.7107862, 0.8258709, 0.3456133, 0.6313726, 1, 0, 1,
-0.7104897, -1.949788, -4.36366, 0.627451, 1, 0, 1,
-0.6955175, -0.5051422, -1.926576, 0.6196079, 1, 0, 1,
-0.6935844, -1.324405, -3.222343, 0.6156863, 1, 0, 1,
-0.689939, -1.226542, -2.978504, 0.6078432, 1, 0, 1,
-0.687314, 0.9601274, -1.285329, 0.6039216, 1, 0, 1,
-0.6870567, -0.421093, -1.720329, 0.5960785, 1, 0, 1,
-0.6844226, 0.1047456, -0.4852482, 0.5882353, 1, 0, 1,
-0.6809431, 1.042109, 0.2967201, 0.5843138, 1, 0, 1,
-0.6793463, -0.3947984, -3.430895, 0.5764706, 1, 0, 1,
-0.6765401, -0.1371826, -2.677782, 0.572549, 1, 0, 1,
-0.675768, -0.2731718, -3.377321, 0.5647059, 1, 0, 1,
-0.6744177, -1.838168, -0.6075103, 0.5607843, 1, 0, 1,
-0.6722744, 0.8233619, -1.291837, 0.5529412, 1, 0, 1,
-0.6667526, 1.477664, -0.8454946, 0.5490196, 1, 0, 1,
-0.6645576, 0.1061716, -3.600851, 0.5411765, 1, 0, 1,
-0.6644187, 0.5220761, -0.2881064, 0.5372549, 1, 0, 1,
-0.6611689, 0.2155567, -2.302616, 0.5294118, 1, 0, 1,
-0.6600674, -1.112614, -1.553911, 0.5254902, 1, 0, 1,
-0.6588174, -0.4896252, -1.726055, 0.5176471, 1, 0, 1,
-0.65581, 1.562524, 0.08555568, 0.5137255, 1, 0, 1,
-0.6544638, -0.1203847, -2.135463, 0.5058824, 1, 0, 1,
-0.6511064, 0.3953494, -0.8906302, 0.5019608, 1, 0, 1,
-0.6492774, -0.9312727, -1.698254, 0.4941176, 1, 0, 1,
-0.6394383, -1.536462, -3.395473, 0.4862745, 1, 0, 1,
-0.6309795, -0.03516031, -1.827228, 0.4823529, 1, 0, 1,
-0.6233484, 0.6066836, -2.184618, 0.4745098, 1, 0, 1,
-0.6214275, -1.600603, -3.297187, 0.4705882, 1, 0, 1,
-0.6176116, -0.6217467, -2.590879, 0.4627451, 1, 0, 1,
-0.6173772, -1.973599, -2.283838, 0.4588235, 1, 0, 1,
-0.6146705, 0.962337, -1.919317, 0.4509804, 1, 0, 1,
-0.6135253, 0.4591607, -1.32382, 0.4470588, 1, 0, 1,
-0.6107447, 2.422042, 0.7861783, 0.4392157, 1, 0, 1,
-0.6049636, 0.1585589, -2.11501, 0.4352941, 1, 0, 1,
-0.6039926, 0.01259221, -2.100283, 0.427451, 1, 0, 1,
-0.5961438, 0.6348053, -0.4677751, 0.4235294, 1, 0, 1,
-0.5935793, -0.7600636, -3.3806, 0.4156863, 1, 0, 1,
-0.5932277, 0.9329615, -0.6232082, 0.4117647, 1, 0, 1,
-0.5890257, -0.7332879, -4.024602, 0.4039216, 1, 0, 1,
-0.5854071, 0.4313918, -0.09017063, 0.3960784, 1, 0, 1,
-0.5845428, -0.1792452, 0.06110331, 0.3921569, 1, 0, 1,
-0.5753978, -0.2060452, 0.2245299, 0.3843137, 1, 0, 1,
-0.5725209, 2.057637, -0.1850527, 0.3803922, 1, 0, 1,
-0.5671188, -0.9596702, -2.673353, 0.372549, 1, 0, 1,
-0.5628268, 0.07509283, -0.610791, 0.3686275, 1, 0, 1,
-0.5588294, -1.019533, -1.897698, 0.3607843, 1, 0, 1,
-0.5560058, -1.564337, -2.281685, 0.3568628, 1, 0, 1,
-0.5534036, -0.1454036, -1.546876, 0.3490196, 1, 0, 1,
-0.5471225, -0.05858233, -1.681828, 0.345098, 1, 0, 1,
-0.5407217, 0.8109348, -1.418939, 0.3372549, 1, 0, 1,
-0.5393754, 0.3778839, -0.3883773, 0.3333333, 1, 0, 1,
-0.5385302, -1.82746, -1.461076, 0.3254902, 1, 0, 1,
-0.5344755, -0.9728327, -4.01952, 0.3215686, 1, 0, 1,
-0.5215197, -0.3007284, -3.472009, 0.3137255, 1, 0, 1,
-0.518528, 2.279515, -0.4316493, 0.3098039, 1, 0, 1,
-0.518025, -0.1798528, -2.525429, 0.3019608, 1, 0, 1,
-0.5136451, -0.1881015, -2.415355, 0.2941177, 1, 0, 1,
-0.5133851, -0.04647396, -1.485103, 0.2901961, 1, 0, 1,
-0.5104827, 0.3830886, -0.4867207, 0.282353, 1, 0, 1,
-0.5101531, -1.02839, -2.517341, 0.2784314, 1, 0, 1,
-0.5099072, 0.4161353, -1.057659, 0.2705882, 1, 0, 1,
-0.5083871, -0.7913107, -1.681739, 0.2666667, 1, 0, 1,
-0.5064529, -0.01914061, -1.432475, 0.2588235, 1, 0, 1,
-0.506426, 1.717103, -0.3460843, 0.254902, 1, 0, 1,
-0.5026026, 1.726495, -0.006297721, 0.2470588, 1, 0, 1,
-0.5014212, -0.7363269, -0.4828955, 0.2431373, 1, 0, 1,
-0.5005039, -1.114034, -2.032938, 0.2352941, 1, 0, 1,
-0.4971619, 0.1467185, -1.643224, 0.2313726, 1, 0, 1,
-0.4953397, -0.7080142, -1.856827, 0.2235294, 1, 0, 1,
-0.4952212, 1.530565, -0.1313099, 0.2196078, 1, 0, 1,
-0.4931857, -0.6188, -2.611472, 0.2117647, 1, 0, 1,
-0.4908834, 0.4001417, 0.194921, 0.2078431, 1, 0, 1,
-0.4760638, -1.333746, -1.794287, 0.2, 1, 0, 1,
-0.474709, 1.519755, -2.060553, 0.1921569, 1, 0, 1,
-0.4689179, 0.2512155, 0.2854446, 0.1882353, 1, 0, 1,
-0.4652975, 1.204206, 0.7532814, 0.1803922, 1, 0, 1,
-0.4641821, -0.0896002, -1.734878, 0.1764706, 1, 0, 1,
-0.4563544, 1.33713, 0.1717514, 0.1686275, 1, 0, 1,
-0.4530782, -1.077132, -2.390366, 0.1647059, 1, 0, 1,
-0.447122, 0.08130163, -2.009315, 0.1568628, 1, 0, 1,
-0.4437219, 0.5117337, -0.02544517, 0.1529412, 1, 0, 1,
-0.4363215, 0.9262375, -0.5560135, 0.145098, 1, 0, 1,
-0.4352394, -0.4613256, -2.505589, 0.1411765, 1, 0, 1,
-0.4341581, 0.8460093, -0.09028696, 0.1333333, 1, 0, 1,
-0.4334303, -1.341718, -2.54552, 0.1294118, 1, 0, 1,
-0.4332824, -0.9716659, -4.748292, 0.1215686, 1, 0, 1,
-0.4320174, 0.1354943, -1.275612, 0.1176471, 1, 0, 1,
-0.4304741, -2.056914, -3.159702, 0.1098039, 1, 0, 1,
-0.4289667, -0.611119, -2.256177, 0.1058824, 1, 0, 1,
-0.4282354, -2.960227, -3.73873, 0.09803922, 1, 0, 1,
-0.4279558, 1.836914, -1.66677, 0.09019608, 1, 0, 1,
-0.4221392, -0.8185303, -2.457883, 0.08627451, 1, 0, 1,
-0.4204062, 1.109205, 0.118826, 0.07843138, 1, 0, 1,
-0.4147429, 1.508325, -1.125309, 0.07450981, 1, 0, 1,
-0.4130318, 1.019284, -0.8723754, 0.06666667, 1, 0, 1,
-0.4113017, 1.383516, -1.012509, 0.0627451, 1, 0, 1,
-0.4091105, -1.353902, -3.367421, 0.05490196, 1, 0, 1,
-0.4077059, 0.04809399, -0.3456598, 0.05098039, 1, 0, 1,
-0.4069069, -1.501139, -2.805292, 0.04313726, 1, 0, 1,
-0.4035375, -0.0004220353, 0.4761468, 0.03921569, 1, 0, 1,
-0.3953008, -0.3816231, -0.7506959, 0.03137255, 1, 0, 1,
-0.3934965, -0.1062024, -2.063375, 0.02745098, 1, 0, 1,
-0.3926761, -0.97594, -0.8522074, 0.01960784, 1, 0, 1,
-0.390155, -0.09204021, -2.628647, 0.01568628, 1, 0, 1,
-0.3892767, -0.07868845, -1.921855, 0.007843138, 1, 0, 1,
-0.3845221, 0.6461149, -1.011583, 0.003921569, 1, 0, 1,
-0.3845169, -0.3036024, -3.149241, 0, 1, 0.003921569, 1,
-0.3835229, 0.8056219, -0.2975152, 0, 1, 0.01176471, 1,
-0.3683181, 1.011003, 0.5534308, 0, 1, 0.01568628, 1,
-0.3678958, 1.27458, 0.8083448, 0, 1, 0.02352941, 1,
-0.3674201, 0.5067916, 0.7729005, 0, 1, 0.02745098, 1,
-0.3669187, 0.1712963, -2.49916, 0, 1, 0.03529412, 1,
-0.361528, 0.2347774, -0.8398533, 0, 1, 0.03921569, 1,
-0.3613972, -1.208146, -3.017894, 0, 1, 0.04705882, 1,
-0.3597623, -0.6195706, -1.357032, 0, 1, 0.05098039, 1,
-0.3561585, -0.2715099, -2.625551, 0, 1, 0.05882353, 1,
-0.3546677, 1.857362, -0.2169994, 0, 1, 0.0627451, 1,
-0.3540586, 1.011871, 0.9906663, 0, 1, 0.07058824, 1,
-0.3482118, 1.726631, -0.1430591, 0, 1, 0.07450981, 1,
-0.3480026, -0.08285453, -1.013861, 0, 1, 0.08235294, 1,
-0.3462281, 0.4488926, 0.5223172, 0, 1, 0.08627451, 1,
-0.3453663, 0.9485635, -0.3014702, 0, 1, 0.09411765, 1,
-0.3451, -0.4486589, -3.386475, 0, 1, 0.1019608, 1,
-0.342751, -0.1456754, -0.676165, 0, 1, 0.1058824, 1,
-0.341902, -0.2629752, -3.306638, 0, 1, 0.1137255, 1,
-0.337309, -1.008361, -5.585238, 0, 1, 0.1176471, 1,
-0.3359559, -0.740349, -3.147726, 0, 1, 0.1254902, 1,
-0.3255001, -0.4249621, -1.615516, 0, 1, 0.1294118, 1,
-0.3239612, 1.5287, 0.1906026, 0, 1, 0.1372549, 1,
-0.3217349, -0.3069902, -2.516097, 0, 1, 0.1411765, 1,
-0.3212817, -0.7820612, -3.765439, 0, 1, 0.1490196, 1,
-0.3203137, 0.952242, 0.9886629, 0, 1, 0.1529412, 1,
-0.316874, 0.1663579, -0.9125595, 0, 1, 0.1607843, 1,
-0.3135003, 0.3000508, -1.522249, 0, 1, 0.1647059, 1,
-0.3104083, 0.4821182, -0.2010904, 0, 1, 0.172549, 1,
-0.3060451, -0.009255816, -2.402385, 0, 1, 0.1764706, 1,
-0.3002217, -1.694504, -2.880256, 0, 1, 0.1843137, 1,
-0.2993252, 0.9991859, 0.7884714, 0, 1, 0.1882353, 1,
-0.2973157, -0.2501343, -0.873467, 0, 1, 0.1960784, 1,
-0.2842064, -0.2453006, -1.259982, 0, 1, 0.2039216, 1,
-0.2840192, 0.8978174, -0.2466966, 0, 1, 0.2078431, 1,
-0.2839541, -1.005938, -3.321958, 0, 1, 0.2156863, 1,
-0.2822173, 0.5157732, -0.3036061, 0, 1, 0.2196078, 1,
-0.2776158, -1.131881, -3.740288, 0, 1, 0.227451, 1,
-0.2741751, -1.966943, -3.336286, 0, 1, 0.2313726, 1,
-0.271944, -1.679609, -2.679309, 0, 1, 0.2392157, 1,
-0.2718948, -1.157107, -2.072457, 0, 1, 0.2431373, 1,
-0.2697994, -0.6858322, -3.785498, 0, 1, 0.2509804, 1,
-0.2682911, -1.50921, -3.165816, 0, 1, 0.254902, 1,
-0.2672102, -0.3235808, -2.583788, 0, 1, 0.2627451, 1,
-0.2666292, -0.9137043, -4.379148, 0, 1, 0.2666667, 1,
-0.2655266, -0.748461, -1.987466, 0, 1, 0.2745098, 1,
-0.2633055, 1.118693, 0.8248923, 0, 1, 0.2784314, 1,
-0.2630875, -0.4257462, -3.484619, 0, 1, 0.2862745, 1,
-0.2621821, -0.3533845, -3.802004, 0, 1, 0.2901961, 1,
-0.2617085, 0.2680484, -0.8341665, 0, 1, 0.2980392, 1,
-0.2593482, 1.102915, 1.121878, 0, 1, 0.3058824, 1,
-0.2548698, 0.3468059, -1.444353, 0, 1, 0.3098039, 1,
-0.2529473, -0.0643419, -2.356678, 0, 1, 0.3176471, 1,
-0.2474384, -1.266822, -2.481701, 0, 1, 0.3215686, 1,
-0.2426656, 0.04058954, -3.037308, 0, 1, 0.3294118, 1,
-0.2386387, -0.04167915, -1.478163, 0, 1, 0.3333333, 1,
-0.2372725, 0.30434, 0.9889079, 0, 1, 0.3411765, 1,
-0.2304233, 0.376826, -1.389723, 0, 1, 0.345098, 1,
-0.2289055, -1.030165, -3.892339, 0, 1, 0.3529412, 1,
-0.2284579, -0.9992337, -1.400993, 0, 1, 0.3568628, 1,
-0.2277719, 0.3539132, -1.645471, 0, 1, 0.3647059, 1,
-0.2276572, 0.3843775, -1.031543, 0, 1, 0.3686275, 1,
-0.2179876, 0.8503685, 2.029145, 0, 1, 0.3764706, 1,
-0.2082376, 0.4451493, -1.37506, 0, 1, 0.3803922, 1,
-0.2081198, -0.4151114, -1.200015, 0, 1, 0.3882353, 1,
-0.2054643, -1.150458, -1.889228, 0, 1, 0.3921569, 1,
-0.2053717, -0.9182811, -1.90606, 0, 1, 0.4, 1,
-0.2036722, -0.7859649, -2.250597, 0, 1, 0.4078431, 1,
-0.1918838, -1.61389, -3.41342, 0, 1, 0.4117647, 1,
-0.1877598, 0.2282404, -1.532556, 0, 1, 0.4196078, 1,
-0.1842643, -0.9120871, -4.515155, 0, 1, 0.4235294, 1,
-0.1823164, 0.8261523, -1.05521, 0, 1, 0.4313726, 1,
-0.1822549, -0.2204745, -2.368098, 0, 1, 0.4352941, 1,
-0.1743378, 0.2606967, -0.007150745, 0, 1, 0.4431373, 1,
-0.1740243, -1.592333, -3.584894, 0, 1, 0.4470588, 1,
-0.1720296, 0.3062012, 0.5006029, 0, 1, 0.454902, 1,
-0.165253, -0.755591, -3.320813, 0, 1, 0.4588235, 1,
-0.1616798, -1.417751, -4.0395, 0, 1, 0.4666667, 1,
-0.1604756, -0.4064094, -3.633333, 0, 1, 0.4705882, 1,
-0.159493, 1.881767, 1.58081, 0, 1, 0.4784314, 1,
-0.1584049, 0.05794194, -1.77136, 0, 1, 0.4823529, 1,
-0.1532155, -0.5098443, -2.036844, 0, 1, 0.4901961, 1,
-0.1506718, -2.017106, -3.280584, 0, 1, 0.4941176, 1,
-0.1486698, 2.201237, -0.009919791, 0, 1, 0.5019608, 1,
-0.1443771, -0.108497, -1.333812, 0, 1, 0.509804, 1,
-0.1436215, 0.3667585, -1.374866, 0, 1, 0.5137255, 1,
-0.1379865, 0.9985206, -0.3775809, 0, 1, 0.5215687, 1,
-0.1371987, -0.1038136, -1.106841, 0, 1, 0.5254902, 1,
-0.1367774, -1.324465, -2.620041, 0, 1, 0.5333334, 1,
-0.1355004, 1.507887, -0.08343095, 0, 1, 0.5372549, 1,
-0.1335894, 1.635293, 0.363496, 0, 1, 0.5450981, 1,
-0.124488, -1.130036, -1.826587, 0, 1, 0.5490196, 1,
-0.1221659, 1.133055, 1.358208, 0, 1, 0.5568628, 1,
-0.121602, 1.93368, 1.099666, 0, 1, 0.5607843, 1,
-0.1215904, -0.5290657, -1.310391, 0, 1, 0.5686275, 1,
-0.1131929, -0.4179317, -3.12277, 0, 1, 0.572549, 1,
-0.1127367, 0.8068368, -1.390567, 0, 1, 0.5803922, 1,
-0.1103727, 0.1025228, -0.4737164, 0, 1, 0.5843138, 1,
-0.109494, -0.2103937, -4.835033, 0, 1, 0.5921569, 1,
-0.1075173, -1.58199, -1.328865, 0, 1, 0.5960785, 1,
-0.1073538, 0.8242189, 1.005037, 0, 1, 0.6039216, 1,
-0.09170295, -0.2199016, -1.652492, 0, 1, 0.6117647, 1,
-0.09141999, -1.52934, -4.18832, 0, 1, 0.6156863, 1,
-0.09102858, 0.2388974, -1.144527, 0, 1, 0.6235294, 1,
-0.08922242, 0.08607195, -2.589094, 0, 1, 0.627451, 1,
-0.08327912, 0.5905226, -1.692281, 0, 1, 0.6352941, 1,
-0.08295806, 0.7061668, -0.9469744, 0, 1, 0.6392157, 1,
-0.07972896, -1.271356, -2.972675, 0, 1, 0.6470588, 1,
-0.07714491, 0.451365, -2.613179, 0, 1, 0.6509804, 1,
-0.07585239, -0.8452425, -4.014471, 0, 1, 0.6588235, 1,
-0.07564688, 0.3992738, -1.663319, 0, 1, 0.6627451, 1,
-0.0747637, 0.677252, 0.4511874, 0, 1, 0.6705883, 1,
-0.06881793, -0.7676534, -3.392762, 0, 1, 0.6745098, 1,
-0.06524215, 0.2519217, 1.479627, 0, 1, 0.682353, 1,
-0.06088789, -0.6493104, -2.09207, 0, 1, 0.6862745, 1,
-0.0608625, -0.2849951, -2.16761, 0, 1, 0.6941177, 1,
-0.05302002, 0.4546653, -1.751741, 0, 1, 0.7019608, 1,
-0.05047477, 1.788201, 0.2895166, 0, 1, 0.7058824, 1,
-0.04983402, 1.254619, 1.483685, 0, 1, 0.7137255, 1,
-0.04578834, -0.1180756, -3.284481, 0, 1, 0.7176471, 1,
-0.04390798, -1.33971, -2.997371, 0, 1, 0.7254902, 1,
-0.0421748, -0.1172635, -2.658898, 0, 1, 0.7294118, 1,
-0.04126254, 0.3096386, 0.03764105, 0, 1, 0.7372549, 1,
-0.04116114, 0.4882453, 0.08388788, 0, 1, 0.7411765, 1,
-0.0404015, -0.786255, -1.830073, 0, 1, 0.7490196, 1,
-0.0396855, -0.6294492, -3.475941, 0, 1, 0.7529412, 1,
-0.03775651, -1.169321, -2.467178, 0, 1, 0.7607843, 1,
-0.03605592, -0.4010834, -3.717566, 0, 1, 0.7647059, 1,
-0.03365386, 0.9059063, -0.9410896, 0, 1, 0.772549, 1,
-0.03159682, 0.6391292, -1.185264, 0, 1, 0.7764706, 1,
-0.03087593, 1.492074, -0.4105178, 0, 1, 0.7843137, 1,
-0.03039912, 0.09886113, 0.6678426, 0, 1, 0.7882353, 1,
-0.02963777, -0.1623558, -0.1754765, 0, 1, 0.7960784, 1,
-0.02933283, 2.564676, -0.50297, 0, 1, 0.8039216, 1,
-0.02639004, 0.9657814, 0.7707038, 0, 1, 0.8078431, 1,
-0.0244224, -0.4813013, -2.933609, 0, 1, 0.8156863, 1,
-0.02439605, -2.20388, -3.547218, 0, 1, 0.8196079, 1,
-0.02421742, -0.02366999, -2.857446, 0, 1, 0.827451, 1,
-0.02244836, -0.4935149, -3.988458, 0, 1, 0.8313726, 1,
-0.0220606, 1.827054, -0.3870664, 0, 1, 0.8392157, 1,
-0.02071933, 0.6495928, 0.2530895, 0, 1, 0.8431373, 1,
-0.01736583, -2.239822, -2.120989, 0, 1, 0.8509804, 1,
-0.01582424, 0.1079388, 2.943011, 0, 1, 0.854902, 1,
-0.01577686, 0.1058903, -1.089369, 0, 1, 0.8627451, 1,
-0.0133933, 1.622171, -1.88423, 0, 1, 0.8666667, 1,
-0.0125708, -0.1349333, -3.178881, 0, 1, 0.8745098, 1,
-0.01207659, 1.229802, 0.231109, 0, 1, 0.8784314, 1,
-0.01167315, 1.379626, -0.6890948, 0, 1, 0.8862745, 1,
-0.006761446, 0.3179552, 1.067471, 0, 1, 0.8901961, 1,
-0.005655046, -1.389946, -4.858042, 0, 1, 0.8980392, 1,
-0.003202051, -2.44724, -5.53132, 0, 1, 0.9058824, 1,
0.001904769, 0.2080474, -0.7581149, 0, 1, 0.9098039, 1,
0.004163132, 1.753377, -0.06477381, 0, 1, 0.9176471, 1,
0.005875906, -0.6279677, 3.116387, 0, 1, 0.9215686, 1,
0.00812392, 0.7666491, -0.2000861, 0, 1, 0.9294118, 1,
0.009626586, -1.294364, 1.922889, 0, 1, 0.9333333, 1,
0.01392099, -1.253823, 3.170541, 0, 1, 0.9411765, 1,
0.01623728, -0.2170087, 2.090894, 0, 1, 0.945098, 1,
0.01634001, -0.1424973, 3.848817, 0, 1, 0.9529412, 1,
0.02018065, -0.3014586, 2.544867, 0, 1, 0.9568627, 1,
0.02440111, -1.640965, 4.349357, 0, 1, 0.9647059, 1,
0.02728403, -0.5549399, 3.791186, 0, 1, 0.9686275, 1,
0.02761534, -0.1640813, 2.144615, 0, 1, 0.9764706, 1,
0.02894862, 0.2147171, -0.2197237, 0, 1, 0.9803922, 1,
0.03092174, -0.2415779, 2.508816, 0, 1, 0.9882353, 1,
0.03158053, 0.5862903, 1.189249, 0, 1, 0.9921569, 1,
0.03418667, 1.111585, 0.9172395, 0, 1, 1, 1,
0.04671124, -0.5401854, 1.860999, 0, 0.9921569, 1, 1,
0.04678654, -0.7045473, 3.326238, 0, 0.9882353, 1, 1,
0.0494954, 0.637758, -0.02561718, 0, 0.9803922, 1, 1,
0.05128725, -1.185894, 2.837975, 0, 0.9764706, 1, 1,
0.05720847, -0.7512071, 4.461658, 0, 0.9686275, 1, 1,
0.05859986, -0.9886683, 2.870157, 0, 0.9647059, 1, 1,
0.05925319, 1.271071, -0.2335801, 0, 0.9568627, 1, 1,
0.06032821, -0.05223371, 2.448823, 0, 0.9529412, 1, 1,
0.06807888, 0.6371093, 0.3233631, 0, 0.945098, 1, 1,
0.07542007, -0.5322131, 3.107287, 0, 0.9411765, 1, 1,
0.07550918, 0.330326, -1.135578, 0, 0.9333333, 1, 1,
0.07667554, 0.5424762, -0.007147257, 0, 0.9294118, 1, 1,
0.07948172, -0.6765689, 4.230308, 0, 0.9215686, 1, 1,
0.07999793, 1.759196, -0.455278, 0, 0.9176471, 1, 1,
0.0801746, 0.4466885, -0.6248744, 0, 0.9098039, 1, 1,
0.0820277, 1.257833, 1.980184, 0, 0.9058824, 1, 1,
0.08599135, 0.2974071, 1.523716, 0, 0.8980392, 1, 1,
0.08910523, 1.618429, 0.2145275, 0, 0.8901961, 1, 1,
0.0902364, -0.2397612, 4.576231, 0, 0.8862745, 1, 1,
0.09026939, 0.1113595, 2.754881, 0, 0.8784314, 1, 1,
0.09181255, -1.863364, 1.470889, 0, 0.8745098, 1, 1,
0.09569196, -0.07043771, 1.404179, 0, 0.8666667, 1, 1,
0.09606058, -0.5178861, 2.768135, 0, 0.8627451, 1, 1,
0.09606704, -2.307301, 3.767375, 0, 0.854902, 1, 1,
0.1001456, 0.812118, 0.05085202, 0, 0.8509804, 1, 1,
0.1008747, 1.152989, 1.290822, 0, 0.8431373, 1, 1,
0.1061137, 0.5409137, 0.02206331, 0, 0.8392157, 1, 1,
0.1111464, -0.9616215, 4.103132, 0, 0.8313726, 1, 1,
0.1119251, 0.07237139, 1.829283, 0, 0.827451, 1, 1,
0.1132463, 1.774205, 1.198043, 0, 0.8196079, 1, 1,
0.1133654, -0.3212969, 1.625462, 0, 0.8156863, 1, 1,
0.1145461, 0.3974302, 1.697597, 0, 0.8078431, 1, 1,
0.1170106, -0.08221938, 1.46089, 0, 0.8039216, 1, 1,
0.1171204, -0.2982496, 3.591971, 0, 0.7960784, 1, 1,
0.1235619, -2.029394, 2.576528, 0, 0.7882353, 1, 1,
0.125904, -1.323454, 3.90187, 0, 0.7843137, 1, 1,
0.1384408, -0.8825111, 3.333679, 0, 0.7764706, 1, 1,
0.140449, 0.05115293, -0.005067096, 0, 0.772549, 1, 1,
0.141239, 0.1163199, 1.555549, 0, 0.7647059, 1, 1,
0.1432478, -0.2818845, 2.027977, 0, 0.7607843, 1, 1,
0.1457763, -0.8927468, 2.232435, 0, 0.7529412, 1, 1,
0.1476584, -1.192923, 3.053258, 0, 0.7490196, 1, 1,
0.1480252, 1.560891, 0.1211072, 0, 0.7411765, 1, 1,
0.1483307, -0.03022616, 1.888317, 0, 0.7372549, 1, 1,
0.1510782, -0.6154186, 2.408771, 0, 0.7294118, 1, 1,
0.1516744, 0.4100269, 0.2161936, 0, 0.7254902, 1, 1,
0.1529935, 1.631509, 1.619088, 0, 0.7176471, 1, 1,
0.1530225, -0.2620499, 2.021425, 0, 0.7137255, 1, 1,
0.1534773, 1.577166, -0.1405828, 0, 0.7058824, 1, 1,
0.1536504, -1.812736, 3.201688, 0, 0.6980392, 1, 1,
0.1549153, 0.8561251, 0.903842, 0, 0.6941177, 1, 1,
0.1626335, 0.7986128, 0.1706402, 0, 0.6862745, 1, 1,
0.1627849, 0.7803136, -2.127249, 0, 0.682353, 1, 1,
0.1631698, 0.7066311, -0.6739034, 0, 0.6745098, 1, 1,
0.1763827, 1.605092, -0.09511906, 0, 0.6705883, 1, 1,
0.1783562, 1.987517, -0.1865121, 0, 0.6627451, 1, 1,
0.1814143, 1.020098, -1.702793, 0, 0.6588235, 1, 1,
0.1910977, -2.16786, 1.566775, 0, 0.6509804, 1, 1,
0.1937041, 0.5391976, 0.7887848, 0, 0.6470588, 1, 1,
0.2001455, 1.170624, 1.012998, 0, 0.6392157, 1, 1,
0.2011462, -0.546905, 4.169189, 0, 0.6352941, 1, 1,
0.203765, -1.83281, 3.642185, 0, 0.627451, 1, 1,
0.2039911, 0.6145486, -0.3914062, 0, 0.6235294, 1, 1,
0.2044313, 0.4343705, 1.18324, 0, 0.6156863, 1, 1,
0.2053709, 2.40497, 0.1643153, 0, 0.6117647, 1, 1,
0.2066569, -2.354654, 3.735195, 0, 0.6039216, 1, 1,
0.206678, 1.050988, 0.9899928, 0, 0.5960785, 1, 1,
0.2077937, -0.9558371, 3.59531, 0, 0.5921569, 1, 1,
0.2171542, -1.045469, 2.31096, 0, 0.5843138, 1, 1,
0.2235045, -0.2126189, 3.030191, 0, 0.5803922, 1, 1,
0.2252758, 0.9366898, -0.01298024, 0, 0.572549, 1, 1,
0.225578, -0.6217779, 2.024748, 0, 0.5686275, 1, 1,
0.2282311, -0.07188281, 1.906761, 0, 0.5607843, 1, 1,
0.2295879, 0.007600982, 2.484883, 0, 0.5568628, 1, 1,
0.2327289, 1.157426, 0.06941457, 0, 0.5490196, 1, 1,
0.2335368, -0.5125925, 2.413934, 0, 0.5450981, 1, 1,
0.2340112, -0.2319147, 2.362633, 0, 0.5372549, 1, 1,
0.235499, -0.193767, 1.925117, 0, 0.5333334, 1, 1,
0.2362414, 1.167247, 0.8472682, 0, 0.5254902, 1, 1,
0.2363772, 1.035834, 0.4829816, 0, 0.5215687, 1, 1,
0.2391825, 0.3628462, 1.499958, 0, 0.5137255, 1, 1,
0.2405932, 0.6523714, 1.469186, 0, 0.509804, 1, 1,
0.2408123, 1.672386, 1.321202, 0, 0.5019608, 1, 1,
0.2414785, 1.017277, 0.7967754, 0, 0.4941176, 1, 1,
0.2429803, 1.782683, -0.5112049, 0, 0.4901961, 1, 1,
0.2439607, 1.499099, 0.1365897, 0, 0.4823529, 1, 1,
0.2502984, -1.054739, 1.831863, 0, 0.4784314, 1, 1,
0.2546306, -1.438505, 3.302645, 0, 0.4705882, 1, 1,
0.2548016, 2.098259, 0.08642881, 0, 0.4666667, 1, 1,
0.2548821, -0.3319387, 2.214318, 0, 0.4588235, 1, 1,
0.2585964, 0.5184473, 0.3417518, 0, 0.454902, 1, 1,
0.2603865, 0.5516489, 0.2640357, 0, 0.4470588, 1, 1,
0.2638446, -1.22675, 4.356387, 0, 0.4431373, 1, 1,
0.2651259, 1.524542, -0.3667664, 0, 0.4352941, 1, 1,
0.2682973, -0.1700349, 1.440356, 0, 0.4313726, 1, 1,
0.2685929, 0.9265769, 0.8343536, 0, 0.4235294, 1, 1,
0.2698598, -1.086601, 4.189474, 0, 0.4196078, 1, 1,
0.2704443, -0.5346944, 5.03577, 0, 0.4117647, 1, 1,
0.2722721, 0.5452008, 0.9421457, 0, 0.4078431, 1, 1,
0.2747001, 0.4875098, 0.4827555, 0, 0.4, 1, 1,
0.2769292, -1.04805, 3.666075, 0, 0.3921569, 1, 1,
0.2774444, -0.5454676, 1.099607, 0, 0.3882353, 1, 1,
0.2809674, 0.1534739, 1.014489, 0, 0.3803922, 1, 1,
0.2830773, 1.953275, 1.572784, 0, 0.3764706, 1, 1,
0.2843858, -0.3328527, 3.324717, 0, 0.3686275, 1, 1,
0.2849508, 0.1771696, 0.1872594, 0, 0.3647059, 1, 1,
0.2874757, -0.796989, 3.006976, 0, 0.3568628, 1, 1,
0.2881243, -0.4578017, 2.278626, 0, 0.3529412, 1, 1,
0.2926235, 1.12742, -0.4385404, 0, 0.345098, 1, 1,
0.2985822, -0.3421731, 2.502199, 0, 0.3411765, 1, 1,
0.3024215, 1.762276, -0.1947957, 0, 0.3333333, 1, 1,
0.3024365, -1.07495, 2.504779, 0, 0.3294118, 1, 1,
0.3057141, 0.08827641, 2.232212, 0, 0.3215686, 1, 1,
0.3073895, 0.4009004, 0.9703199, 0, 0.3176471, 1, 1,
0.3089241, -0.08987476, 1.346129, 0, 0.3098039, 1, 1,
0.3114188, 0.9074629, 0.5440707, 0, 0.3058824, 1, 1,
0.3133528, -0.7071025, 2.912836, 0, 0.2980392, 1, 1,
0.3170311, 1.136807, -0.7626135, 0, 0.2901961, 1, 1,
0.3178389, -0.5814795, 2.907854, 0, 0.2862745, 1, 1,
0.3195277, 0.01452816, 1.915685, 0, 0.2784314, 1, 1,
0.321195, 0.468458, 1.439579, 0, 0.2745098, 1, 1,
0.3234171, -1.241353, 2.323287, 0, 0.2666667, 1, 1,
0.325134, 0.4067982, -0.5327893, 0, 0.2627451, 1, 1,
0.3371887, 0.8409425, -0.08824969, 0, 0.254902, 1, 1,
0.34105, 0.6714334, 0.7088566, 0, 0.2509804, 1, 1,
0.3415018, 0.3786142, 1.361281, 0, 0.2431373, 1, 1,
0.3419744, -0.161952, 0.1248124, 0, 0.2392157, 1, 1,
0.350047, 0.4564883, -1.252188, 0, 0.2313726, 1, 1,
0.3508434, 1.147047, 0.3664171, 0, 0.227451, 1, 1,
0.3552786, 1.616082, -0.007457246, 0, 0.2196078, 1, 1,
0.3605248, -0.2994545, 2.16077, 0, 0.2156863, 1, 1,
0.3626443, 1.146883, 0.8529617, 0, 0.2078431, 1, 1,
0.3681318, -0.405975, 2.159773, 0, 0.2039216, 1, 1,
0.3689565, -1.053895, 2.738892, 0, 0.1960784, 1, 1,
0.3697298, -1.145, 3.366328, 0, 0.1882353, 1, 1,
0.3703841, 0.3106245, 1.783608, 0, 0.1843137, 1, 1,
0.3746404, 0.4314162, -0.06459873, 0, 0.1764706, 1, 1,
0.3794125, 0.1577583, 2.276173, 0, 0.172549, 1, 1,
0.3915183, -0.5715063, 2.363742, 0, 0.1647059, 1, 1,
0.3921614, 0.3064814, 1.943332, 0, 0.1607843, 1, 1,
0.3944904, 0.08825702, 1.518042, 0, 0.1529412, 1, 1,
0.3996288, -0.8133336, 4.370872, 0, 0.1490196, 1, 1,
0.401903, -0.2441967, 2.24572, 0, 0.1411765, 1, 1,
0.4020797, 0.04969189, 2.865672, 0, 0.1372549, 1, 1,
0.4027218, 0.5839806, -1.47323, 0, 0.1294118, 1, 1,
0.4123475, -0.1612615, 2.526072, 0, 0.1254902, 1, 1,
0.4150273, 0.8148007, -0.2213653, 0, 0.1176471, 1, 1,
0.4162684, -2.208037, 4.451503, 0, 0.1137255, 1, 1,
0.4162851, 1.784606, 0.4962841, 0, 0.1058824, 1, 1,
0.4185777, -1.499248, 4.624543, 0, 0.09803922, 1, 1,
0.4308339, 1.309747, 0.3846381, 0, 0.09411765, 1, 1,
0.4326677, 1.147155, -0.3777507, 0, 0.08627451, 1, 1,
0.4357241, -0.08201903, 1.691686, 0, 0.08235294, 1, 1,
0.4547807, 0.2681485, 2.138577, 0, 0.07450981, 1, 1,
0.4585651, -2.004, 4.874591, 0, 0.07058824, 1, 1,
0.4650122, -0.1006559, 2.747965, 0, 0.0627451, 1, 1,
0.4687129, -1.44964, 2.5618, 0, 0.05882353, 1, 1,
0.4691086, 1.287724, 1.3878, 0, 0.05098039, 1, 1,
0.4691868, 0.02492877, 1.248808, 0, 0.04705882, 1, 1,
0.4756535, -0.6607151, 3.675856, 0, 0.03921569, 1, 1,
0.4773122, 0.2169232, -0.9285998, 0, 0.03529412, 1, 1,
0.4803695, 1.795657, 1.693623, 0, 0.02745098, 1, 1,
0.4814587, -1.36386, 2.830706, 0, 0.02352941, 1, 1,
0.485704, 0.5613934, 0.5094622, 0, 0.01568628, 1, 1,
0.4897939, -0.5360299, 3.544115, 0, 0.01176471, 1, 1,
0.4908071, 0.3722723, 0.8604693, 0, 0.003921569, 1, 1,
0.491002, 0.5357573, 2.062997, 0.003921569, 0, 1, 1,
0.4934816, 1.326593, 0.03301685, 0.007843138, 0, 1, 1,
0.4950752, -0.7999303, 1.449302, 0.01568628, 0, 1, 1,
0.5025346, -0.8015358, 4.422624, 0.01960784, 0, 1, 1,
0.5068132, -2.087683, 1.133324, 0.02745098, 0, 1, 1,
0.5082005, -0.2460906, 2.812127, 0.03137255, 0, 1, 1,
0.5129221, 0.4706068, 1.772695, 0.03921569, 0, 1, 1,
0.5134687, 0.6088278, -0.779323, 0.04313726, 0, 1, 1,
0.5144516, -0.1019798, 2.185813, 0.05098039, 0, 1, 1,
0.5164635, -0.05430157, 1.092386, 0.05490196, 0, 1, 1,
0.5198846, 0.2495769, 1.065616, 0.0627451, 0, 1, 1,
0.5237288, 0.8253792, -0.5217546, 0.06666667, 0, 1, 1,
0.5238235, -1.232833, 3.182493, 0.07450981, 0, 1, 1,
0.52531, -0.1005637, 1.042224, 0.07843138, 0, 1, 1,
0.5259387, -0.5092181, 2.594072, 0.08627451, 0, 1, 1,
0.5288553, 0.52475, 2.013171, 0.09019608, 0, 1, 1,
0.5305322, 0.1656369, 0.3469226, 0.09803922, 0, 1, 1,
0.5338148, 1.401135, -0.2530611, 0.1058824, 0, 1, 1,
0.5351884, 0.2209191, 0.4162932, 0.1098039, 0, 1, 1,
0.5360414, -0.608443, 1.716719, 0.1176471, 0, 1, 1,
0.5395641, 0.546921, -0.4330839, 0.1215686, 0, 1, 1,
0.5451969, 0.75711, 2.016564, 0.1294118, 0, 1, 1,
0.5464469, 0.5649227, -0.8787175, 0.1333333, 0, 1, 1,
0.5494636, -0.4607501, 1.833736, 0.1411765, 0, 1, 1,
0.5526403, -0.03550943, 1.710485, 0.145098, 0, 1, 1,
0.5531039, 1.354797, -0.2610804, 0.1529412, 0, 1, 1,
0.5581598, -1.737252, 2.455588, 0.1568628, 0, 1, 1,
0.5626825, -0.9748462, 2.480625, 0.1647059, 0, 1, 1,
0.5651561, -0.5558299, 2.343925, 0.1686275, 0, 1, 1,
0.56625, 1.205916, 0.3027458, 0.1764706, 0, 1, 1,
0.566466, -0.4156912, 3.396408, 0.1803922, 0, 1, 1,
0.5717835, 0.3550438, 1.32822, 0.1882353, 0, 1, 1,
0.575066, -0.1931268, 3.43205, 0.1921569, 0, 1, 1,
0.5756194, 0.2170239, 1.817031, 0.2, 0, 1, 1,
0.5836458, 0.9432914, 0.2508096, 0.2078431, 0, 1, 1,
0.5849852, -1.157608, 3.201134, 0.2117647, 0, 1, 1,
0.5864049, -0.3419891, 2.751736, 0.2196078, 0, 1, 1,
0.5875974, 0.7559039, 1.15748, 0.2235294, 0, 1, 1,
0.5882019, -0.04505244, 1.484856, 0.2313726, 0, 1, 1,
0.5891675, 0.1466769, 0.7636893, 0.2352941, 0, 1, 1,
0.5893201, 1.006481, -0.5608892, 0.2431373, 0, 1, 1,
0.5904127, -0.1554111, 1.182961, 0.2470588, 0, 1, 1,
0.5944062, 1.592828, -0.1176288, 0.254902, 0, 1, 1,
0.5991095, 0.05584311, 0.7879969, 0.2588235, 0, 1, 1,
0.6043673, -0.8994499, 4.061531, 0.2666667, 0, 1, 1,
0.606674, -0.9887459, 1.444799, 0.2705882, 0, 1, 1,
0.6092165, -1.01208, 0.3064477, 0.2784314, 0, 1, 1,
0.6199288, 1.266401, 1.333699, 0.282353, 0, 1, 1,
0.6202691, -1.069991, 2.328532, 0.2901961, 0, 1, 1,
0.621092, -1.870516, 1.488976, 0.2941177, 0, 1, 1,
0.6286961, 0.01249227, -0.3473422, 0.3019608, 0, 1, 1,
0.6306067, 0.6091819, 1.503856, 0.3098039, 0, 1, 1,
0.633338, -0.2749773, 1.548907, 0.3137255, 0, 1, 1,
0.6352406, 2.245364, -0.1675031, 0.3215686, 0, 1, 1,
0.6395833, -0.3780459, 1.883979, 0.3254902, 0, 1, 1,
0.6451766, -0.115843, 0.991613, 0.3333333, 0, 1, 1,
0.6458667, 0.2186032, 1.702331, 0.3372549, 0, 1, 1,
0.6504813, -0.8686987, 2.077679, 0.345098, 0, 1, 1,
0.651704, -0.1888528, 2.890983, 0.3490196, 0, 1, 1,
0.6521815, 0.8458782, 1.23092, 0.3568628, 0, 1, 1,
0.6525415, -1.854089, 3.205836, 0.3607843, 0, 1, 1,
0.6569419, 0.02244525, 1.812645, 0.3686275, 0, 1, 1,
0.6627622, -1.645544, 3.337624, 0.372549, 0, 1, 1,
0.6632437, 0.7853116, 1.734469, 0.3803922, 0, 1, 1,
0.6640602, 1.611918, 1.505185, 0.3843137, 0, 1, 1,
0.6708682, -0.7780689, 4.266026, 0.3921569, 0, 1, 1,
0.6734564, -0.9459519, 2.397559, 0.3960784, 0, 1, 1,
0.6747867, 0.6114015, 2.475984, 0.4039216, 0, 1, 1,
0.6828408, 0.04428098, 3.287005, 0.4117647, 0, 1, 1,
0.6858141, 0.4567742, 1.651399, 0.4156863, 0, 1, 1,
0.6871556, 2.440388, 0.9764848, 0.4235294, 0, 1, 1,
0.6918733, -1.157661, 3.660812, 0.427451, 0, 1, 1,
0.6921222, -0.02007544, 2.040375, 0.4352941, 0, 1, 1,
0.6924534, -0.03112409, 0.6318904, 0.4392157, 0, 1, 1,
0.6936058, -1.70916, 2.95171, 0.4470588, 0, 1, 1,
0.6941574, 0.7284672, 1.093347, 0.4509804, 0, 1, 1,
0.699145, 0.3173692, -0.357544, 0.4588235, 0, 1, 1,
0.7077795, 1.382686, -0.06251635, 0.4627451, 0, 1, 1,
0.7097188, 0.1988093, -0.8053659, 0.4705882, 0, 1, 1,
0.7108575, 0.740109, 0.6689214, 0.4745098, 0, 1, 1,
0.7143791, -1.56275, 2.137208, 0.4823529, 0, 1, 1,
0.7199079, 0.9242044, -0.8830567, 0.4862745, 0, 1, 1,
0.7214786, -0.6779301, 1.405506, 0.4941176, 0, 1, 1,
0.7236801, -0.4767034, 3.129002, 0.5019608, 0, 1, 1,
0.7255552, -1.687037, 3.129232, 0.5058824, 0, 1, 1,
0.7312219, 1.310446, -1.415841, 0.5137255, 0, 1, 1,
0.73135, -0.1849781, 0.3568631, 0.5176471, 0, 1, 1,
0.7395502, -1.721906, 2.452811, 0.5254902, 0, 1, 1,
0.743537, 1.453188, -0.6984911, 0.5294118, 0, 1, 1,
0.7437375, -1.848072, 3.613346, 0.5372549, 0, 1, 1,
0.7453679, -0.5175729, 0.8215775, 0.5411765, 0, 1, 1,
0.7553764, 0.3137101, 1.286304, 0.5490196, 0, 1, 1,
0.7555476, 0.9710268, -0.4378851, 0.5529412, 0, 1, 1,
0.7603393, -0.6755121, 1.285208, 0.5607843, 0, 1, 1,
0.7626892, 0.646987, 1.200376, 0.5647059, 0, 1, 1,
0.7709622, -0.02866439, 1.879697, 0.572549, 0, 1, 1,
0.7710254, -0.6933948, 5.467141, 0.5764706, 0, 1, 1,
0.771197, -0.9296653, 1.347054, 0.5843138, 0, 1, 1,
0.7727244, 0.3384187, 0.3672643, 0.5882353, 0, 1, 1,
0.7735888, -1.703522, 2.491578, 0.5960785, 0, 1, 1,
0.7798193, -0.1687868, 2.83742, 0.6039216, 0, 1, 1,
0.7836272, -0.5843948, 2.746715, 0.6078432, 0, 1, 1,
0.7845778, 1.114582, 0.6860144, 0.6156863, 0, 1, 1,
0.7861154, -0.6422407, 1.335612, 0.6196079, 0, 1, 1,
0.7883959, -0.9388078, 2.379199, 0.627451, 0, 1, 1,
0.7895515, 1.970879, 1.536466, 0.6313726, 0, 1, 1,
0.7949284, 0.6916527, 1.293844, 0.6392157, 0, 1, 1,
0.7957011, -2.681801, 2.29331, 0.6431373, 0, 1, 1,
0.7967743, 0.02681636, 1.229109, 0.6509804, 0, 1, 1,
0.8027009, -3.464431, 2.625431, 0.654902, 0, 1, 1,
0.8111301, -1.001686, 1.569296, 0.6627451, 0, 1, 1,
0.8181145, 0.7819859, 0.1713192, 0.6666667, 0, 1, 1,
0.8188305, -1.776455, 2.070372, 0.6745098, 0, 1, 1,
0.8192004, 0.6454049, 0.07079639, 0.6784314, 0, 1, 1,
0.8233744, 1.774799, 0.3946634, 0.6862745, 0, 1, 1,
0.8272892, 1.143909, 1.16086, 0.6901961, 0, 1, 1,
0.8275182, -2.247595, 4.117445, 0.6980392, 0, 1, 1,
0.8278257, -0.6375461, 2.634547, 0.7058824, 0, 1, 1,
0.834597, -0.4827363, 1.384709, 0.7098039, 0, 1, 1,
0.8353205, -0.113566, 1.816075, 0.7176471, 0, 1, 1,
0.8356271, 1.337739, 1.031552, 0.7215686, 0, 1, 1,
0.8372023, 0.769761, 0.4107589, 0.7294118, 0, 1, 1,
0.8374771, -0.09204496, 1.9188, 0.7333333, 0, 1, 1,
0.8420405, -1.284551, 0.7477176, 0.7411765, 0, 1, 1,
0.8436676, 0.7530991, 0.5919864, 0.7450981, 0, 1, 1,
0.8478134, -0.8460279, 2.310116, 0.7529412, 0, 1, 1,
0.8484261, -0.4693201, 1.063876, 0.7568628, 0, 1, 1,
0.8516211, 2.109621, -0.4178366, 0.7647059, 0, 1, 1,
0.8535726, -0.7465475, -0.2191733, 0.7686275, 0, 1, 1,
0.8546612, -1.559703, 2.104728, 0.7764706, 0, 1, 1,
0.8556069, 1.294912, 0.6182789, 0.7803922, 0, 1, 1,
0.8565417, 0.2685922, -0.4168479, 0.7882353, 0, 1, 1,
0.8603465, 1.257467, 0.9988138, 0.7921569, 0, 1, 1,
0.8653259, -1.753765, 2.292386, 0.8, 0, 1, 1,
0.8663988, 0.9751359, 1.53552, 0.8078431, 0, 1, 1,
0.8700203, 0.5704163, 0.6937559, 0.8117647, 0, 1, 1,
0.8704702, -1.502798, 1.198604, 0.8196079, 0, 1, 1,
0.8718292, 0.2126197, 3.445624, 0.8235294, 0, 1, 1,
0.8744084, 0.4896833, -0.1212725, 0.8313726, 0, 1, 1,
0.8804106, -1.537506, 3.101508, 0.8352941, 0, 1, 1,
0.8809361, 1.514575, -1.603814, 0.8431373, 0, 1, 1,
0.8829941, -0.1227153, -0.2788389, 0.8470588, 0, 1, 1,
0.8844048, -1.010448, 2.544881, 0.854902, 0, 1, 1,
0.8894151, -2.464783, 1.424447, 0.8588235, 0, 1, 1,
0.8895603, -1.32988, 3.34296, 0.8666667, 0, 1, 1,
0.891628, -0.563178, 3.910474, 0.8705882, 0, 1, 1,
0.8917833, 0.3311723, 1.990116, 0.8784314, 0, 1, 1,
0.8957227, -0.2804048, 2.291115, 0.8823529, 0, 1, 1,
0.9094778, -0.2687342, 2.449233, 0.8901961, 0, 1, 1,
0.9116296, -1.134941, 1.261291, 0.8941177, 0, 1, 1,
0.9120836, 0.8621324, 2.630913, 0.9019608, 0, 1, 1,
0.9139984, -0.4446621, 1.065949, 0.9098039, 0, 1, 1,
0.919301, 1.14441, -0.7376242, 0.9137255, 0, 1, 1,
0.9201873, 2.105104, -0.871103, 0.9215686, 0, 1, 1,
0.9231035, -0.344739, 0.1919488, 0.9254902, 0, 1, 1,
0.9268183, 2.386459, 0.3602573, 0.9333333, 0, 1, 1,
0.9276688, -0.4231361, 1.422992, 0.9372549, 0, 1, 1,
0.931764, 0.5301318, 1.280487, 0.945098, 0, 1, 1,
0.9348388, 0.7531439, 0.396332, 0.9490196, 0, 1, 1,
0.9387206, 0.5809721, -1.714457, 0.9568627, 0, 1, 1,
0.9425707, -1.432545, 4.080471, 0.9607843, 0, 1, 1,
0.9439684, -2.002212, 2.955299, 0.9686275, 0, 1, 1,
0.9446291, -0.7971908, 2.640279, 0.972549, 0, 1, 1,
0.9506397, -1.006011, 4.265177, 0.9803922, 0, 1, 1,
0.9537057, 0.3856311, 0.4624025, 0.9843137, 0, 1, 1,
0.9557248, -0.2140503, 2.920783, 0.9921569, 0, 1, 1,
0.9609895, -1.40798, 3.192548, 0.9960784, 0, 1, 1,
0.9681622, -0.8966342, 2.241936, 1, 0, 0.9960784, 1,
0.9688311, 0.5929313, 0.1681622, 1, 0, 0.9882353, 1,
0.972617, 1.923083, -0.1059869, 1, 0, 0.9843137, 1,
0.9734364, -0.1504233, 2.884767, 1, 0, 0.9764706, 1,
0.9741955, -1.704242, 2.806082, 1, 0, 0.972549, 1,
0.9743698, 1.075301, 0.6081561, 1, 0, 0.9647059, 1,
0.9756477, 0.214662, 1.774591, 1, 0, 0.9607843, 1,
0.9768513, -2.561924, 1.705277, 1, 0, 0.9529412, 1,
0.9857895, 1.220431, 0.7976989, 1, 0, 0.9490196, 1,
0.9887019, -0.3003061, 2.735469, 1, 0, 0.9411765, 1,
0.9927624, 0.1678233, 0.004364281, 1, 0, 0.9372549, 1,
0.9957773, -0.911828, 3.313866, 1, 0, 0.9294118, 1,
0.9982975, 1.104241, -0.8450602, 1, 0, 0.9254902, 1,
0.9998507, 0.0997632, 2.692924, 1, 0, 0.9176471, 1,
1.013764, 0.09527563, -0.2672589, 1, 0, 0.9137255, 1,
1.016034, -0.1184951, 0.3797513, 1, 0, 0.9058824, 1,
1.021802, 1.286309, -0.629148, 1, 0, 0.9019608, 1,
1.021967, -0.6768628, 2.842232, 1, 0, 0.8941177, 1,
1.023609, 0.5794696, 1.38294, 1, 0, 0.8862745, 1,
1.029362, -0.6591564, 2.706963, 1, 0, 0.8823529, 1,
1.030113, -1.814589, 2.774788, 1, 0, 0.8745098, 1,
1.033597, -0.1170563, 3.410936, 1, 0, 0.8705882, 1,
1.036705, 0.3501909, 0.8345369, 1, 0, 0.8627451, 1,
1.03994, -1.044715, 2.365427, 1, 0, 0.8588235, 1,
1.041681, -1.972327, 2.873652, 1, 0, 0.8509804, 1,
1.044316, -0.508436, 2.564986, 1, 0, 0.8470588, 1,
1.046349, -0.04462806, 1.479563, 1, 0, 0.8392157, 1,
1.060466, 1.585555, 0.453331, 1, 0, 0.8352941, 1,
1.062088, -0.1153811, 1.774785, 1, 0, 0.827451, 1,
1.064029, -1.1899, 0.369747, 1, 0, 0.8235294, 1,
1.069155, -1.47953, 3.146353, 1, 0, 0.8156863, 1,
1.078178, 0.02530899, 2.299594, 1, 0, 0.8117647, 1,
1.081265, 0.6960942, -0.009551194, 1, 0, 0.8039216, 1,
1.083513, 0.6190336, 1.107758, 1, 0, 0.7960784, 1,
1.092129, 0.2971788, 2.605441, 1, 0, 0.7921569, 1,
1.094444, 0.9524964, 1.775883, 1, 0, 0.7843137, 1,
1.096254, 0.3121772, 2.470468, 1, 0, 0.7803922, 1,
1.097181, 0.2913745, 2.260384, 1, 0, 0.772549, 1,
1.100211, 1.110665, -0.7893312, 1, 0, 0.7686275, 1,
1.106345, 0.9895104, 0.861711, 1, 0, 0.7607843, 1,
1.107965, -0.04122605, 0.7329351, 1, 0, 0.7568628, 1,
1.109011, -0.4711422, 2.997081, 1, 0, 0.7490196, 1,
1.112294, 0.3880959, 0.4808045, 1, 0, 0.7450981, 1,
1.122278, 0.2451598, 1.60837, 1, 0, 0.7372549, 1,
1.128225, -0.3499037, 1.873584, 1, 0, 0.7333333, 1,
1.138981, 0.6541346, 0.448915, 1, 0, 0.7254902, 1,
1.140662, 0.06637557, 0.418822, 1, 0, 0.7215686, 1,
1.141201, 0.6830429, -0.5870724, 1, 0, 0.7137255, 1,
1.147149, -0.4292012, 1.05152, 1, 0, 0.7098039, 1,
1.171776, 0.8832957, 0.1749952, 1, 0, 0.7019608, 1,
1.172395, 0.6657025, 1.79595, 1, 0, 0.6941177, 1,
1.173649, 1.235138, 1.314771, 1, 0, 0.6901961, 1,
1.174693, 1.088888, 1.811006, 1, 0, 0.682353, 1,
1.176573, -0.05012824, 1.249434, 1, 0, 0.6784314, 1,
1.179769, -0.7745832, 2.296718, 1, 0, 0.6705883, 1,
1.180782, 0.4394318, 0.8688399, 1, 0, 0.6666667, 1,
1.184201, -0.3786702, 0.1558239, 1, 0, 0.6588235, 1,
1.189377, -0.2000614, 1.414954, 1, 0, 0.654902, 1,
1.20816, -0.6740864, 2.443573, 1, 0, 0.6470588, 1,
1.208604, 0.07438411, 0.9098394, 1, 0, 0.6431373, 1,
1.214409, -0.01845212, 0.7510532, 1, 0, 0.6352941, 1,
1.21826, 1.780128, 0.4327827, 1, 0, 0.6313726, 1,
1.223502, -0.6617101, 2.273917, 1, 0, 0.6235294, 1,
1.226323, 0.7645789, 0.1725376, 1, 0, 0.6196079, 1,
1.236508, -1.419703, 1.378227, 1, 0, 0.6117647, 1,
1.242016, 0.1101731, 1.886781, 1, 0, 0.6078432, 1,
1.250779, -2.149665, 3.08396, 1, 0, 0.6, 1,
1.250823, 0.6932983, -1.25917, 1, 0, 0.5921569, 1,
1.251911, 1.080708, 0.1395087, 1, 0, 0.5882353, 1,
1.258076, 1.493011, -0.4126353, 1, 0, 0.5803922, 1,
1.258952, 2.634997, 1.6977, 1, 0, 0.5764706, 1,
1.282541, 0.1348311, 1.592267, 1, 0, 0.5686275, 1,
1.290255, 0.7967488, -0.3067532, 1, 0, 0.5647059, 1,
1.292119, -0.2428783, 0.2703417, 1, 0, 0.5568628, 1,
1.299361, -1.055558, 5.17368, 1, 0, 0.5529412, 1,
1.309771, 0.5014629, 1.900326, 1, 0, 0.5450981, 1,
1.312892, 0.2887354, 1.630941, 1, 0, 0.5411765, 1,
1.313828, -0.4453196, 1.734395, 1, 0, 0.5333334, 1,
1.317197, 0.9558263, 1.041276, 1, 0, 0.5294118, 1,
1.322773, 0.06255788, 2.19619, 1, 0, 0.5215687, 1,
1.326269, -1.044659, 2.147364, 1, 0, 0.5176471, 1,
1.338535, -0.8825726, 1.048657, 1, 0, 0.509804, 1,
1.338535, 1.929239, 0.9039653, 1, 0, 0.5058824, 1,
1.34385, -0.2743638, 1.382342, 1, 0, 0.4980392, 1,
1.346439, 0.7078762, 0.296901, 1, 0, 0.4901961, 1,
1.347342, -0.7807703, 3.67966, 1, 0, 0.4862745, 1,
1.362578, -0.2660357, 2.309996, 1, 0, 0.4784314, 1,
1.366819, -1.174546, 3.322652, 1, 0, 0.4745098, 1,
1.368928, 1.115007, 2.692932, 1, 0, 0.4666667, 1,
1.391852, -0.2968558, 2.668917, 1, 0, 0.4627451, 1,
1.394848, 1.532641, 1.36734, 1, 0, 0.454902, 1,
1.406987, 1.800322, 1.509592, 1, 0, 0.4509804, 1,
1.415592, 2.615551, 1.322152, 1, 0, 0.4431373, 1,
1.419387, 0.7923166, 0.6408938, 1, 0, 0.4392157, 1,
1.422801, 0.5468673, 1.560379, 1, 0, 0.4313726, 1,
1.434765, 1.268708, 1.996116, 1, 0, 0.427451, 1,
1.435406, 0.1849598, 1.847275, 1, 0, 0.4196078, 1,
1.445748, 0.7929529, 0.6153495, 1, 0, 0.4156863, 1,
1.454582, -1.689721, 3.266821, 1, 0, 0.4078431, 1,
1.481701, -1.244987, 2.588615, 1, 0, 0.4039216, 1,
1.48579, 0.02095638, 0.8290706, 1, 0, 0.3960784, 1,
1.494921, 1.392781, 2.048238, 1, 0, 0.3882353, 1,
1.516442, -0.6397319, 1.063947, 1, 0, 0.3843137, 1,
1.518978, -0.4940498, 2.108823, 1, 0, 0.3764706, 1,
1.519377, 0.115484, 1.217303, 1, 0, 0.372549, 1,
1.528101, -0.3067092, 1.715442, 1, 0, 0.3647059, 1,
1.535597, -1.086972, 0.9629087, 1, 0, 0.3607843, 1,
1.5425, -1.887743, 0.8057131, 1, 0, 0.3529412, 1,
1.544311, 0.1566832, 1.955057, 1, 0, 0.3490196, 1,
1.550083, -1.898731, 2.837819, 1, 0, 0.3411765, 1,
1.590089, 1.577577, -0.6778651, 1, 0, 0.3372549, 1,
1.591333, -0.1772483, 0.2053767, 1, 0, 0.3294118, 1,
1.59746, -0.7276433, 2.547068, 1, 0, 0.3254902, 1,
1.630598, -0.1233489, 3.066713, 1, 0, 0.3176471, 1,
1.646226, 1.179133, 0.5078687, 1, 0, 0.3137255, 1,
1.662066, 1.54964, 0.6329559, 1, 0, 0.3058824, 1,
1.662923, -0.8623375, 1.027003, 1, 0, 0.2980392, 1,
1.663698, 0.03591035, 1.978133, 1, 0, 0.2941177, 1,
1.677253, -0.8659629, 3.546973, 1, 0, 0.2862745, 1,
1.681838, -0.7549474, 0.9609647, 1, 0, 0.282353, 1,
1.683767, 1.880414, 0.2234622, 1, 0, 0.2745098, 1,
1.689427, -0.9314691, 1.789174, 1, 0, 0.2705882, 1,
1.702212, 0.6859157, 1.58065, 1, 0, 0.2627451, 1,
1.713032, -0.909361, 2.748848, 1, 0, 0.2588235, 1,
1.723723, 0.3384778, 1.709828, 1, 0, 0.2509804, 1,
1.729144, -0.3070498, 0.8887366, 1, 0, 0.2470588, 1,
1.741943, -0.4459248, 2.238583, 1, 0, 0.2392157, 1,
1.742503, 0.5551868, 1.184867, 1, 0, 0.2352941, 1,
1.770378, -0.5965313, 0.6547055, 1, 0, 0.227451, 1,
1.772267, 0.2264391, 3.157594, 1, 0, 0.2235294, 1,
1.772801, -2.083184, 0.9119502, 1, 0, 0.2156863, 1,
1.773615, 0.07399545, -0.5051923, 1, 0, 0.2117647, 1,
1.798781, -2.671278, 1.713645, 1, 0, 0.2039216, 1,
1.804256, 0.7117581, -0.5686073, 1, 0, 0.1960784, 1,
1.817144, 1.235819, -0.2365527, 1, 0, 0.1921569, 1,
1.823246, -0.06957635, 2.928633, 1, 0, 0.1843137, 1,
1.837506, 1.103959, 1.322181, 1, 0, 0.1803922, 1,
1.846282, 0.8999587, 0.02943077, 1, 0, 0.172549, 1,
1.853474, 0.566442, 0.942232, 1, 0, 0.1686275, 1,
1.900774, -1.388513, 3.640113, 1, 0, 0.1607843, 1,
1.91211, -1.258309, 1.180538, 1, 0, 0.1568628, 1,
1.925407, -1.166835, 1.86977, 1, 0, 0.1490196, 1,
1.939895, 0.6944549, -0.4428175, 1, 0, 0.145098, 1,
1.974231, 2.791865, 1.676009, 1, 0, 0.1372549, 1,
2.006793, 0.06415357, 1.671416, 1, 0, 0.1333333, 1,
2.02458, 0.3727632, 0.9195904, 1, 0, 0.1254902, 1,
2.030282, 0.9522067, 1.742609, 1, 0, 0.1215686, 1,
2.033851, -0.08806056, 0.9225267, 1, 0, 0.1137255, 1,
2.046613, -0.8430713, 4.111529, 1, 0, 0.1098039, 1,
2.049169, -0.9106284, 0.3399715, 1, 0, 0.1019608, 1,
2.074383, 0.001956732, 0.5299178, 1, 0, 0.09411765, 1,
2.099036, 0.4445334, 1.308729, 1, 0, 0.09019608, 1,
2.125538, -0.09642257, 1.727082, 1, 0, 0.08235294, 1,
2.174942, -0.6459714, 0.9779305, 1, 0, 0.07843138, 1,
2.201336, -1.05098, 0.9235578, 1, 0, 0.07058824, 1,
2.266059, 0.1732934, 2.054107, 1, 0, 0.06666667, 1,
2.309976, -0.2922252, 2.073518, 1, 0, 0.05882353, 1,
2.450305, -1.581856, 1.863702, 1, 0, 0.05490196, 1,
2.464645, -0.437571, 2.990428, 1, 0, 0.04705882, 1,
2.576454, -0.2780884, 3.534686, 1, 0, 0.04313726, 1,
2.577574, 1.330279, 2.318677, 1, 0, 0.03529412, 1,
2.635567, -1.356138, 0.625118, 1, 0, 0.03137255, 1,
2.639128, -1.416723, 1.288401, 1, 0, 0.02352941, 1,
2.6788, -1.513207, 1.381408, 1, 0, 0.01960784, 1,
2.970394, 2.049729, 2.205915, 1, 0, 0.01176471, 1,
3.356857, -0.9328657, 1.670924, 1, 0, 0.007843138, 1
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
-0.01494503, -4.54601, -7.458616, 0, -0.5, 0.5, 0.5,
-0.01494503, -4.54601, -7.458616, 1, -0.5, 0.5, 0.5,
-0.01494503, -4.54601, -7.458616, 1, 1.5, 0.5, 0.5,
-0.01494503, -4.54601, -7.458616, 0, 1.5, 0.5, 0.5
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
-4.529788, -0.273931, -7.458616, 0, -0.5, 0.5, 0.5,
-4.529788, -0.273931, -7.458616, 1, -0.5, 0.5, 0.5,
-4.529788, -0.273931, -7.458616, 1, 1.5, 0.5, 0.5,
-4.529788, -0.273931, -7.458616, 0, 1.5, 0.5, 0.5
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
-4.529788, -4.54601, -0.05904818, 0, -0.5, 0.5, 0.5,
-4.529788, -4.54601, -0.05904818, 1, -0.5, 0.5, 0.5,
-4.529788, -4.54601, -0.05904818, 1, 1.5, 0.5, 0.5,
-4.529788, -4.54601, -0.05904818, 0, 1.5, 0.5, 0.5
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
-3, -3.560146, -5.751023,
3, -3.560146, -5.751023,
-3, -3.560146, -5.751023,
-3, -3.724457, -6.035622,
-2, -3.560146, -5.751023,
-2, -3.724457, -6.035622,
-1, -3.560146, -5.751023,
-1, -3.724457, -6.035622,
0, -3.560146, -5.751023,
0, -3.724457, -6.035622,
1, -3.560146, -5.751023,
1, -3.724457, -6.035622,
2, -3.560146, -5.751023,
2, -3.724457, -6.035622,
3, -3.560146, -5.751023,
3, -3.724457, -6.035622
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
-3, -4.053078, -6.604819, 0, -0.5, 0.5, 0.5,
-3, -4.053078, -6.604819, 1, -0.5, 0.5, 0.5,
-3, -4.053078, -6.604819, 1, 1.5, 0.5, 0.5,
-3, -4.053078, -6.604819, 0, 1.5, 0.5, 0.5,
-2, -4.053078, -6.604819, 0, -0.5, 0.5, 0.5,
-2, -4.053078, -6.604819, 1, -0.5, 0.5, 0.5,
-2, -4.053078, -6.604819, 1, 1.5, 0.5, 0.5,
-2, -4.053078, -6.604819, 0, 1.5, 0.5, 0.5,
-1, -4.053078, -6.604819, 0, -0.5, 0.5, 0.5,
-1, -4.053078, -6.604819, 1, -0.5, 0.5, 0.5,
-1, -4.053078, -6.604819, 1, 1.5, 0.5, 0.5,
-1, -4.053078, -6.604819, 0, 1.5, 0.5, 0.5,
0, -4.053078, -6.604819, 0, -0.5, 0.5, 0.5,
0, -4.053078, -6.604819, 1, -0.5, 0.5, 0.5,
0, -4.053078, -6.604819, 1, 1.5, 0.5, 0.5,
0, -4.053078, -6.604819, 0, 1.5, 0.5, 0.5,
1, -4.053078, -6.604819, 0, -0.5, 0.5, 0.5,
1, -4.053078, -6.604819, 1, -0.5, 0.5, 0.5,
1, -4.053078, -6.604819, 1, 1.5, 0.5, 0.5,
1, -4.053078, -6.604819, 0, 1.5, 0.5, 0.5,
2, -4.053078, -6.604819, 0, -0.5, 0.5, 0.5,
2, -4.053078, -6.604819, 1, -0.5, 0.5, 0.5,
2, -4.053078, -6.604819, 1, 1.5, 0.5, 0.5,
2, -4.053078, -6.604819, 0, 1.5, 0.5, 0.5,
3, -4.053078, -6.604819, 0, -0.5, 0.5, 0.5,
3, -4.053078, -6.604819, 1, -0.5, 0.5, 0.5,
3, -4.053078, -6.604819, 1, 1.5, 0.5, 0.5,
3, -4.053078, -6.604819, 0, 1.5, 0.5, 0.5
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
-3.487901, -3, -5.751023,
-3.487901, 2, -5.751023,
-3.487901, -3, -5.751023,
-3.661549, -3, -6.035622,
-3.487901, -2, -5.751023,
-3.661549, -2, -6.035622,
-3.487901, -1, -5.751023,
-3.661549, -1, -6.035622,
-3.487901, 0, -5.751023,
-3.661549, 0, -6.035622,
-3.487901, 1, -5.751023,
-3.661549, 1, -6.035622,
-3.487901, 2, -5.751023,
-3.661549, 2, -6.035622
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
-4.008844, -3, -6.604819, 0, -0.5, 0.5, 0.5,
-4.008844, -3, -6.604819, 1, -0.5, 0.5, 0.5,
-4.008844, -3, -6.604819, 1, 1.5, 0.5, 0.5,
-4.008844, -3, -6.604819, 0, 1.5, 0.5, 0.5,
-4.008844, -2, -6.604819, 0, -0.5, 0.5, 0.5,
-4.008844, -2, -6.604819, 1, -0.5, 0.5, 0.5,
-4.008844, -2, -6.604819, 1, 1.5, 0.5, 0.5,
-4.008844, -2, -6.604819, 0, 1.5, 0.5, 0.5,
-4.008844, -1, -6.604819, 0, -0.5, 0.5, 0.5,
-4.008844, -1, -6.604819, 1, -0.5, 0.5, 0.5,
-4.008844, -1, -6.604819, 1, 1.5, 0.5, 0.5,
-4.008844, -1, -6.604819, 0, 1.5, 0.5, 0.5,
-4.008844, 0, -6.604819, 0, -0.5, 0.5, 0.5,
-4.008844, 0, -6.604819, 1, -0.5, 0.5, 0.5,
-4.008844, 0, -6.604819, 1, 1.5, 0.5, 0.5,
-4.008844, 0, -6.604819, 0, 1.5, 0.5, 0.5,
-4.008844, 1, -6.604819, 0, -0.5, 0.5, 0.5,
-4.008844, 1, -6.604819, 1, -0.5, 0.5, 0.5,
-4.008844, 1, -6.604819, 1, 1.5, 0.5, 0.5,
-4.008844, 1, -6.604819, 0, 1.5, 0.5, 0.5,
-4.008844, 2, -6.604819, 0, -0.5, 0.5, 0.5,
-4.008844, 2, -6.604819, 1, -0.5, 0.5, 0.5,
-4.008844, 2, -6.604819, 1, 1.5, 0.5, 0.5,
-4.008844, 2, -6.604819, 0, 1.5, 0.5, 0.5
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
-3.487901, -3.560146, -4,
-3.487901, -3.560146, 4,
-3.487901, -3.560146, -4,
-3.661549, -3.724457, -4,
-3.487901, -3.560146, -2,
-3.661549, -3.724457, -2,
-3.487901, -3.560146, 0,
-3.661549, -3.724457, 0,
-3.487901, -3.560146, 2,
-3.661549, -3.724457, 2,
-3.487901, -3.560146, 4,
-3.661549, -3.724457, 4
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
-4.008844, -4.053078, -4, 0, -0.5, 0.5, 0.5,
-4.008844, -4.053078, -4, 1, -0.5, 0.5, 0.5,
-4.008844, -4.053078, -4, 1, 1.5, 0.5, 0.5,
-4.008844, -4.053078, -4, 0, 1.5, 0.5, 0.5,
-4.008844, -4.053078, -2, 0, -0.5, 0.5, 0.5,
-4.008844, -4.053078, -2, 1, -0.5, 0.5, 0.5,
-4.008844, -4.053078, -2, 1, 1.5, 0.5, 0.5,
-4.008844, -4.053078, -2, 0, 1.5, 0.5, 0.5,
-4.008844, -4.053078, 0, 0, -0.5, 0.5, 0.5,
-4.008844, -4.053078, 0, 1, -0.5, 0.5, 0.5,
-4.008844, -4.053078, 0, 1, 1.5, 0.5, 0.5,
-4.008844, -4.053078, 0, 0, 1.5, 0.5, 0.5,
-4.008844, -4.053078, 2, 0, -0.5, 0.5, 0.5,
-4.008844, -4.053078, 2, 1, -0.5, 0.5, 0.5,
-4.008844, -4.053078, 2, 1, 1.5, 0.5, 0.5,
-4.008844, -4.053078, 2, 0, 1.5, 0.5, 0.5,
-4.008844, -4.053078, 4, 0, -0.5, 0.5, 0.5,
-4.008844, -4.053078, 4, 1, -0.5, 0.5, 0.5,
-4.008844, -4.053078, 4, 1, 1.5, 0.5, 0.5,
-4.008844, -4.053078, 4, 0, 1.5, 0.5, 0.5
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
-3.487901, -3.560146, -5.751023,
-3.487901, 3.012284, -5.751023,
-3.487901, -3.560146, 5.632927,
-3.487901, 3.012284, 5.632927,
-3.487901, -3.560146, -5.751023,
-3.487901, -3.560146, 5.632927,
-3.487901, 3.012284, -5.751023,
-3.487901, 3.012284, 5.632927,
-3.487901, -3.560146, -5.751023,
3.458011, -3.560146, -5.751023,
-3.487901, -3.560146, 5.632927,
3.458011, -3.560146, 5.632927,
-3.487901, 3.012284, -5.751023,
3.458011, 3.012284, -5.751023,
-3.487901, 3.012284, 5.632927,
3.458011, 3.012284, 5.632927,
3.458011, -3.560146, -5.751023,
3.458011, 3.012284, -5.751023,
3.458011, -3.560146, 5.632927,
3.458011, 3.012284, 5.632927,
3.458011, -3.560146, -5.751023,
3.458011, -3.560146, 5.632927,
3.458011, 3.012284, -5.751023,
3.458011, 3.012284, 5.632927
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
var radius = 7.938854;
var distance = 35.32086;
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
mvMatrix.translate( 0.01494503, 0.273931, 0.05904818 );
mvMatrix.scale( 1.235784, 1.306008, 0.7540128 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32086);
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
Electrum<-read.table("Electrum.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Electrum$V2
```

```
## Error in eval(expr, envir, enclos): object 'Electrum' not found
```

```r
y<-Electrum$V3
```

```
## Error in eval(expr, envir, enclos): object 'Electrum' not found
```

```r
z<-Electrum$V4
```

```
## Error in eval(expr, envir, enclos): object 'Electrum' not found
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
-3.386747, 0.8928764, -2.476464, 0, 0, 1, 1, 1,
-3.314352, -0.5805013, -2.590437, 1, 0, 0, 1, 1,
-2.839296, 0.6305912, 0.4917215, 1, 0, 0, 1, 1,
-2.82287, 0.1478399, 0.8636954, 1, 0, 0, 1, 1,
-2.804842, 0.0395733, -2.134261, 1, 0, 0, 1, 1,
-2.794037, -0.9643559, -1.566496, 1, 0, 0, 1, 1,
-2.610752, -0.9702084, -1.128158, 0, 0, 0, 1, 1,
-2.470627, 2.033209, -2.138685, 0, 0, 0, 1, 1,
-2.461135, -1.15964, -2.248085, 0, 0, 0, 1, 1,
-2.413809, -0.6993769, -2.985855, 0, 0, 0, 1, 1,
-2.398119, 1.564701, -0.3641949, 0, 0, 0, 1, 1,
-2.29881, 0.5779274, -1.117392, 0, 0, 0, 1, 1,
-2.270488, -0.6069425, -0.5713085, 0, 0, 0, 1, 1,
-2.257384, -0.8627934, -1.180393, 1, 1, 1, 1, 1,
-2.216948, -1.205059, -2.652595, 1, 1, 1, 1, 1,
-2.186395, 0.2782623, -2.912889, 1, 1, 1, 1, 1,
-2.169637, -0.3230307, -1.980948, 1, 1, 1, 1, 1,
-2.165123, 0.7814707, -0.8617325, 1, 1, 1, 1, 1,
-2.126917, -0.770697, -2.231846, 1, 1, 1, 1, 1,
-2.107872, -1.446492, -1.770826, 1, 1, 1, 1, 1,
-2.035374, 1.48439, -0.4817507, 1, 1, 1, 1, 1,
-1.998519, -0.1210427, -3.244236, 1, 1, 1, 1, 1,
-1.979894, 0.1617664, -1.510918, 1, 1, 1, 1, 1,
-1.977048, 0.8244876, -0.8706397, 1, 1, 1, 1, 1,
-1.963305, -2.27302, -4.106205, 1, 1, 1, 1, 1,
-1.94248, 0.3831705, -1.151078, 1, 1, 1, 1, 1,
-1.925624, -0.6095733, -0.3489452, 1, 1, 1, 1, 1,
-1.917703, 0.4986001, -0.8878224, 1, 1, 1, 1, 1,
-1.907933, 1.213191, -1.823464, 0, 0, 1, 1, 1,
-1.876232, -0.9466521, -1.588042, 1, 0, 0, 1, 1,
-1.864487, -1.172445, -2.023256, 1, 0, 0, 1, 1,
-1.844753, -0.07363499, -1.703703, 1, 0, 0, 1, 1,
-1.829479, 1.494122, -1.84799, 1, 0, 0, 1, 1,
-1.818865, 1.296995, -1.143706, 1, 0, 0, 1, 1,
-1.798256, -2.420573, -1.724554, 0, 0, 0, 1, 1,
-1.795792, -0.4538501, -0.7875447, 0, 0, 0, 1, 1,
-1.791279, 0.6160353, 0.3590378, 0, 0, 0, 1, 1,
-1.788059, -0.2091241, -1.636674, 0, 0, 0, 1, 1,
-1.779715, 0.7556418, -2.092731, 0, 0, 0, 1, 1,
-1.772275, -0.8727522, -1.233567, 0, 0, 0, 1, 1,
-1.772008, -1.115733, -0.8127417, 0, 0, 0, 1, 1,
-1.771074, 0.6785489, -2.191408, 1, 1, 1, 1, 1,
-1.744464, -1.297457, -2.72197, 1, 1, 1, 1, 1,
-1.7183, -0.3752001, -0.901535, 1, 1, 1, 1, 1,
-1.711838, 1.345942, 0.7479604, 1, 1, 1, 1, 1,
-1.693395, -0.07150353, -2.982033, 1, 1, 1, 1, 1,
-1.691159, 0.3207215, -0.9941432, 1, 1, 1, 1, 1,
-1.686457, 0.03741697, -2.353641, 1, 1, 1, 1, 1,
-1.68086, 0.8082469, -0.8776492, 1, 1, 1, 1, 1,
-1.672497, 0.6903476, -2.842906, 1, 1, 1, 1, 1,
-1.662272, -1.131647, -2.097835, 1, 1, 1, 1, 1,
-1.638822, 1.600776, -1.929805, 1, 1, 1, 1, 1,
-1.634811, 0.6996274, -1.463416, 1, 1, 1, 1, 1,
-1.631638, 1.11371, -1.375686, 1, 1, 1, 1, 1,
-1.629852, -0.1953009, -2.683045, 1, 1, 1, 1, 1,
-1.613554, -0.2096963, -3.095528, 1, 1, 1, 1, 1,
-1.613165, -0.4282711, -0.9349323, 0, 0, 1, 1, 1,
-1.609181, 0.2729514, -2.405253, 1, 0, 0, 1, 1,
-1.605509, -0.4278685, -0.5972177, 1, 0, 0, 1, 1,
-1.60259, -0.2661512, -1.817553, 1, 0, 0, 1, 1,
-1.573401, -0.3375946, -2.791837, 1, 0, 0, 1, 1,
-1.571968, -0.3836125, -2.624839, 1, 0, 0, 1, 1,
-1.560759, 0.1147113, 0.5042993, 0, 0, 0, 1, 1,
-1.552046, -0.5911098, -4.339899, 0, 0, 0, 1, 1,
-1.53713, -1.604922, -2.673849, 0, 0, 0, 1, 1,
-1.526303, 0.2155249, -1.159194, 0, 0, 0, 1, 1,
-1.521561, 1.117221, -1.434035, 0, 0, 0, 1, 1,
-1.516453, -0.5270915, -1.916964, 0, 0, 0, 1, 1,
-1.506912, 1.425769, 0.3259849, 0, 0, 0, 1, 1,
-1.488044, 0.6420147, -0.6066327, 1, 1, 1, 1, 1,
-1.465169, 0.5515718, -3.048424, 1, 1, 1, 1, 1,
-1.45064, -0.9759395, -0.6002192, 1, 1, 1, 1, 1,
-1.440346, 0.8947244, -1.487473, 1, 1, 1, 1, 1,
-1.424271, -0.1008987, -3.102558, 1, 1, 1, 1, 1,
-1.407205, 0.3832024, -1.112369, 1, 1, 1, 1, 1,
-1.383701, 0.2384722, -1.268284, 1, 1, 1, 1, 1,
-1.381267, -0.887187, -2.724056, 1, 1, 1, 1, 1,
-1.374894, -0.5731511, -1.696688, 1, 1, 1, 1, 1,
-1.372574, 0.0005639174, -2.454827, 1, 1, 1, 1, 1,
-1.37209, 0.404982, -1.737321, 1, 1, 1, 1, 1,
-1.359802, -0.7863732, -1.876846, 1, 1, 1, 1, 1,
-1.356132, 0.03949691, -0.2520193, 1, 1, 1, 1, 1,
-1.346912, -0.5047352, -3.341348, 1, 1, 1, 1, 1,
-1.339071, 0.4853856, -1.593702, 1, 1, 1, 1, 1,
-1.331737, 1.396632, -1.275553, 0, 0, 1, 1, 1,
-1.308801, -2.166811, -2.862498, 1, 0, 0, 1, 1,
-1.304833, -1.101518, -0.5706431, 1, 0, 0, 1, 1,
-1.293031, -0.8127236, -3.546814, 1, 0, 0, 1, 1,
-1.289015, 1.014781, -1.934195, 1, 0, 0, 1, 1,
-1.269715, 1.953125, 1.452439, 1, 0, 0, 1, 1,
-1.264038, 0.05823319, -0.9631849, 0, 0, 0, 1, 1,
-1.25614, 1.068232, -1.526449, 0, 0, 0, 1, 1,
-1.252967, -2.069434, -1.198133, 0, 0, 0, 1, 1,
-1.245206, -1.406197, -3.561164, 0, 0, 0, 1, 1,
-1.242989, 0.9590255, -0.9362001, 0, 0, 0, 1, 1,
-1.241308, 0.3852869, -1.254089, 0, 0, 0, 1, 1,
-1.2397, 0.4266645, -0.2329132, 0, 0, 0, 1, 1,
-1.237031, 0.9419682, -2.460866, 1, 1, 1, 1, 1,
-1.222494, -1.436533, -2.029008, 1, 1, 1, 1, 1,
-1.207108, 0.4326423, -0.808953, 1, 1, 1, 1, 1,
-1.198774, -0.4810986, -1.32758, 1, 1, 1, 1, 1,
-1.198354, 0.13618, -0.9450047, 1, 1, 1, 1, 1,
-1.196399, -0.1620263, -1.582882, 1, 1, 1, 1, 1,
-1.191742, -0.6393791, -2.199554, 1, 1, 1, 1, 1,
-1.191212, 0.3128524, -2.234305, 1, 1, 1, 1, 1,
-1.183924, 0.4212293, -2.491595, 1, 1, 1, 1, 1,
-1.16637, 0.6737351, -2.021901, 1, 1, 1, 1, 1,
-1.155456, 2.765148, 0.3981352, 1, 1, 1, 1, 1,
-1.153501, -0.9715182, -0.470091, 1, 1, 1, 1, 1,
-1.153263, -0.7600219, -3.102481, 1, 1, 1, 1, 1,
-1.141433, -0.8829905, -0.7849517, 1, 1, 1, 1, 1,
-1.140844, 0.6701689, -1.966798, 1, 1, 1, 1, 1,
-1.135349, 1.287292, 0.4327815, 0, 0, 1, 1, 1,
-1.124428, 1.198141, 0.8776988, 1, 0, 0, 1, 1,
-1.123469, -0.4603235, -2.253521, 1, 0, 0, 1, 1,
-1.123109, -1.175827, -2.595231, 1, 0, 0, 1, 1,
-1.116801, -1.67152, -3.28985, 1, 0, 0, 1, 1,
-1.115019, -2.416508, -2.637658, 1, 0, 0, 1, 1,
-1.110741, 1.658366, -1.103163, 0, 0, 0, 1, 1,
-1.104999, 0.5666066, -2.277746, 0, 0, 0, 1, 1,
-1.098024, 0.3045556, -2.093607, 0, 0, 0, 1, 1,
-1.087402, -1.404543, -1.632243, 0, 0, 0, 1, 1,
-1.085782, -0.7940434, -3.156439, 0, 0, 0, 1, 1,
-1.071734, 0.2312333, -0.7872218, 0, 0, 0, 1, 1,
-1.070961, 0.2558593, -1.012541, 0, 0, 0, 1, 1,
-1.062177, 2.515478, 0.6594539, 1, 1, 1, 1, 1,
-1.050428, -0.9462935, -1.771016, 1, 1, 1, 1, 1,
-1.034378, 0.1826548, -2.511232, 1, 1, 1, 1, 1,
-1.028046, -0.1480344, -0.5890493, 1, 1, 1, 1, 1,
-1.025176, 2.916569, 0.4304933, 1, 1, 1, 1, 1,
-1.01659, -1.569537, -2.603938, 1, 1, 1, 1, 1,
-1.015251, 1.407588, -1.26863, 1, 1, 1, 1, 1,
-1.011229, 0.02536508, -2.519119, 1, 1, 1, 1, 1,
-1.004969, 0.4671915, -1.420285, 1, 1, 1, 1, 1,
-1.002422, 0.370095, -2.262672, 1, 1, 1, 1, 1,
-0.9977345, -0.9750229, -2.287616, 1, 1, 1, 1, 1,
-0.9909928, 1.701842, -1.147763, 1, 1, 1, 1, 1,
-0.9854566, 1.00054, 1.101827, 1, 1, 1, 1, 1,
-0.9746175, -0.0306662, -2.973372, 1, 1, 1, 1, 1,
-0.9689354, 0.1378027, 0.08739262, 1, 1, 1, 1, 1,
-0.9657844, -1.740564, -3.251787, 0, 0, 1, 1, 1,
-0.964491, -1.475133, -3.454569, 1, 0, 0, 1, 1,
-0.9637692, -1.046479, -1.887359, 1, 0, 0, 1, 1,
-0.9619714, -0.4175085, -2.778983, 1, 0, 0, 1, 1,
-0.9615983, 1.2425, -1.035656, 1, 0, 0, 1, 1,
-0.9554753, -1.929483, -3.112592, 1, 0, 0, 1, 1,
-0.9554428, -0.2387693, -1.526652, 0, 0, 0, 1, 1,
-0.9493402, 0.6651476, -0.9238748, 0, 0, 0, 1, 1,
-0.9456187, -0.6082394, -1.458319, 0, 0, 0, 1, 1,
-0.93863, 0.5697095, -0.3061058, 0, 0, 0, 1, 1,
-0.9325407, -1.378705, -1.96348, 0, 0, 0, 1, 1,
-0.9319097, -1.0382, -0.381612, 0, 0, 0, 1, 1,
-0.9315472, -0.88773, -2.047298, 0, 0, 0, 1, 1,
-0.9302946, 0.5024275, -0.1173747, 1, 1, 1, 1, 1,
-0.9258841, 1.976127, -1.676569, 1, 1, 1, 1, 1,
-0.9258637, -1.056258, -2.440348, 1, 1, 1, 1, 1,
-0.9179127, 0.9163585, -0.2167509, 1, 1, 1, 1, 1,
-0.9135199, -0.7841904, -1.749625, 1, 1, 1, 1, 1,
-0.9109637, 1.260547, 0.5660704, 1, 1, 1, 1, 1,
-0.8994607, -1.608897, -4.116858, 1, 1, 1, 1, 1,
-0.8966936, 0.6138712, -1.32193, 1, 1, 1, 1, 1,
-0.8950582, 0.09856072, -0.7949048, 1, 1, 1, 1, 1,
-0.892844, 1.285282, 0.4925519, 1, 1, 1, 1, 1,
-0.8924339, 0.003451164, -0.08307583, 1, 1, 1, 1, 1,
-0.8903372, 0.9950901, -2.846652, 1, 1, 1, 1, 1,
-0.885377, -0.5455035, -2.300071, 1, 1, 1, 1, 1,
-0.8852174, 0.2497586, -1.863053, 1, 1, 1, 1, 1,
-0.8849564, 0.3746725, -2.005386, 1, 1, 1, 1, 1,
-0.8812477, 0.7019709, -2.208694, 0, 0, 1, 1, 1,
-0.8766978, -1.032718, -2.704748, 1, 0, 0, 1, 1,
-0.8737013, -0.1988055, -0.3147957, 1, 0, 0, 1, 1,
-0.8624846, 1.649838, 1.226778, 1, 0, 0, 1, 1,
-0.8603054, -0.4252461, -1.906875, 1, 0, 0, 1, 1,
-0.8599987, -0.813889, -3.038326, 1, 0, 0, 1, 1,
-0.8511599, -0.1675568, -1.368903, 0, 0, 0, 1, 1,
-0.8509773, -1.097774, -1.719247, 0, 0, 0, 1, 1,
-0.8486431, -0.1457711, -0.709928, 0, 0, 0, 1, 1,
-0.8394257, -1.235443, -4.036812, 0, 0, 0, 1, 1,
-0.8359999, 0.345738, -2.231137, 0, 0, 0, 1, 1,
-0.8329273, -0.6561622, -2.426685, 0, 0, 0, 1, 1,
-0.8308992, -2.56835, -2.967902, 0, 0, 0, 1, 1,
-0.8238955, 0.6204993, -1.895881, 1, 1, 1, 1, 1,
-0.8235874, -0.2528013, -2.560189, 1, 1, 1, 1, 1,
-0.8225399, 0.6041049, -0.9457937, 1, 1, 1, 1, 1,
-0.8135496, 0.3680035, 0.07938443, 1, 1, 1, 1, 1,
-0.813544, 0.663546, -0.2654456, 1, 1, 1, 1, 1,
-0.8027908, -1.174227, -3.525127, 1, 1, 1, 1, 1,
-0.7984186, 0.8998123, -1.981858, 1, 1, 1, 1, 1,
-0.7975885, 0.4699488, -0.1762353, 1, 1, 1, 1, 1,
-0.7948436, -1.168193, -2.651894, 1, 1, 1, 1, 1,
-0.7921152, -1.048704, -2.441672, 1, 1, 1, 1, 1,
-0.7895917, -0.4247215, -2.24006, 1, 1, 1, 1, 1,
-0.7860692, 0.52881, -0.7644989, 1, 1, 1, 1, 1,
-0.7858348, -0.6211295, -2.266851, 1, 1, 1, 1, 1,
-0.7849778, 0.4101456, -1.416837, 1, 1, 1, 1, 1,
-0.7841402, 0.6980922, 1.693036, 1, 1, 1, 1, 1,
-0.7820698, 0.09551582, -2.457766, 0, 0, 1, 1, 1,
-0.7807083, -0.2811359, -0.5968287, 1, 0, 0, 1, 1,
-0.7779848, -0.363809, -1.240463, 1, 0, 0, 1, 1,
-0.7758111, 0.08862172, -1.910198, 1, 0, 0, 1, 1,
-0.7745622, -1.924513, -1.234149, 1, 0, 0, 1, 1,
-0.7743536, -2.340427, -2.814129, 1, 0, 0, 1, 1,
-0.7735534, 0.2949929, -2.257686, 0, 0, 0, 1, 1,
-0.770561, 0.5546306, -2.597077, 0, 0, 0, 1, 1,
-0.7702629, -0.5833173, -0.7731004, 0, 0, 0, 1, 1,
-0.7696927, 1.279114, -2.406353, 0, 0, 0, 1, 1,
-0.7669314, -0.4805735, -1.004706, 0, 0, 0, 1, 1,
-0.7657614, -0.56345, -2.115611, 0, 0, 0, 1, 1,
-0.7596211, -0.6208573, -2.208357, 0, 0, 0, 1, 1,
-0.759562, 1.591631, -0.2492338, 1, 1, 1, 1, 1,
-0.7566601, 0.1080843, -2.125183, 1, 1, 1, 1, 1,
-0.7565959, 1.564182, 0.5678639, 1, 1, 1, 1, 1,
-0.7545999, 0.8717023, -1.117727, 1, 1, 1, 1, 1,
-0.7524354, 1.038747, -0.949885, 1, 1, 1, 1, 1,
-0.7484708, 1.824499, 0.1700442, 1, 1, 1, 1, 1,
-0.7384863, -0.7700906, -3.405917, 1, 1, 1, 1, 1,
-0.7355334, -0.4738851, -3.572298, 1, 1, 1, 1, 1,
-0.7328537, -0.1787773, 0.2528567, 1, 1, 1, 1, 1,
-0.7318504, 0.8398534, -0.4661415, 1, 1, 1, 1, 1,
-0.7300602, 1.568835, 0.6869035, 1, 1, 1, 1, 1,
-0.7271105, -0.4852501, -2.181515, 1, 1, 1, 1, 1,
-0.7269578, -0.745236, -0.00730854, 1, 1, 1, 1, 1,
-0.7234555, -0.241824, -1.511201, 1, 1, 1, 1, 1,
-0.7204229, 1.401654, 0.7462438, 1, 1, 1, 1, 1,
-0.7163717, 0.2279122, -4.420116, 0, 0, 1, 1, 1,
-0.7133624, -0.952997, -2.509366, 1, 0, 0, 1, 1,
-0.712734, 0.730799, -0.6124671, 1, 0, 0, 1, 1,
-0.7124986, -1.319317, -2.262848, 1, 0, 0, 1, 1,
-0.7107862, 0.8258709, 0.3456133, 1, 0, 0, 1, 1,
-0.7104897, -1.949788, -4.36366, 1, 0, 0, 1, 1,
-0.6955175, -0.5051422, -1.926576, 0, 0, 0, 1, 1,
-0.6935844, -1.324405, -3.222343, 0, 0, 0, 1, 1,
-0.689939, -1.226542, -2.978504, 0, 0, 0, 1, 1,
-0.687314, 0.9601274, -1.285329, 0, 0, 0, 1, 1,
-0.6870567, -0.421093, -1.720329, 0, 0, 0, 1, 1,
-0.6844226, 0.1047456, -0.4852482, 0, 0, 0, 1, 1,
-0.6809431, 1.042109, 0.2967201, 0, 0, 0, 1, 1,
-0.6793463, -0.3947984, -3.430895, 1, 1, 1, 1, 1,
-0.6765401, -0.1371826, -2.677782, 1, 1, 1, 1, 1,
-0.675768, -0.2731718, -3.377321, 1, 1, 1, 1, 1,
-0.6744177, -1.838168, -0.6075103, 1, 1, 1, 1, 1,
-0.6722744, 0.8233619, -1.291837, 1, 1, 1, 1, 1,
-0.6667526, 1.477664, -0.8454946, 1, 1, 1, 1, 1,
-0.6645576, 0.1061716, -3.600851, 1, 1, 1, 1, 1,
-0.6644187, 0.5220761, -0.2881064, 1, 1, 1, 1, 1,
-0.6611689, 0.2155567, -2.302616, 1, 1, 1, 1, 1,
-0.6600674, -1.112614, -1.553911, 1, 1, 1, 1, 1,
-0.6588174, -0.4896252, -1.726055, 1, 1, 1, 1, 1,
-0.65581, 1.562524, 0.08555568, 1, 1, 1, 1, 1,
-0.6544638, -0.1203847, -2.135463, 1, 1, 1, 1, 1,
-0.6511064, 0.3953494, -0.8906302, 1, 1, 1, 1, 1,
-0.6492774, -0.9312727, -1.698254, 1, 1, 1, 1, 1,
-0.6394383, -1.536462, -3.395473, 0, 0, 1, 1, 1,
-0.6309795, -0.03516031, -1.827228, 1, 0, 0, 1, 1,
-0.6233484, 0.6066836, -2.184618, 1, 0, 0, 1, 1,
-0.6214275, -1.600603, -3.297187, 1, 0, 0, 1, 1,
-0.6176116, -0.6217467, -2.590879, 1, 0, 0, 1, 1,
-0.6173772, -1.973599, -2.283838, 1, 0, 0, 1, 1,
-0.6146705, 0.962337, -1.919317, 0, 0, 0, 1, 1,
-0.6135253, 0.4591607, -1.32382, 0, 0, 0, 1, 1,
-0.6107447, 2.422042, 0.7861783, 0, 0, 0, 1, 1,
-0.6049636, 0.1585589, -2.11501, 0, 0, 0, 1, 1,
-0.6039926, 0.01259221, -2.100283, 0, 0, 0, 1, 1,
-0.5961438, 0.6348053, -0.4677751, 0, 0, 0, 1, 1,
-0.5935793, -0.7600636, -3.3806, 0, 0, 0, 1, 1,
-0.5932277, 0.9329615, -0.6232082, 1, 1, 1, 1, 1,
-0.5890257, -0.7332879, -4.024602, 1, 1, 1, 1, 1,
-0.5854071, 0.4313918, -0.09017063, 1, 1, 1, 1, 1,
-0.5845428, -0.1792452, 0.06110331, 1, 1, 1, 1, 1,
-0.5753978, -0.2060452, 0.2245299, 1, 1, 1, 1, 1,
-0.5725209, 2.057637, -0.1850527, 1, 1, 1, 1, 1,
-0.5671188, -0.9596702, -2.673353, 1, 1, 1, 1, 1,
-0.5628268, 0.07509283, -0.610791, 1, 1, 1, 1, 1,
-0.5588294, -1.019533, -1.897698, 1, 1, 1, 1, 1,
-0.5560058, -1.564337, -2.281685, 1, 1, 1, 1, 1,
-0.5534036, -0.1454036, -1.546876, 1, 1, 1, 1, 1,
-0.5471225, -0.05858233, -1.681828, 1, 1, 1, 1, 1,
-0.5407217, 0.8109348, -1.418939, 1, 1, 1, 1, 1,
-0.5393754, 0.3778839, -0.3883773, 1, 1, 1, 1, 1,
-0.5385302, -1.82746, -1.461076, 1, 1, 1, 1, 1,
-0.5344755, -0.9728327, -4.01952, 0, 0, 1, 1, 1,
-0.5215197, -0.3007284, -3.472009, 1, 0, 0, 1, 1,
-0.518528, 2.279515, -0.4316493, 1, 0, 0, 1, 1,
-0.518025, -0.1798528, -2.525429, 1, 0, 0, 1, 1,
-0.5136451, -0.1881015, -2.415355, 1, 0, 0, 1, 1,
-0.5133851, -0.04647396, -1.485103, 1, 0, 0, 1, 1,
-0.5104827, 0.3830886, -0.4867207, 0, 0, 0, 1, 1,
-0.5101531, -1.02839, -2.517341, 0, 0, 0, 1, 1,
-0.5099072, 0.4161353, -1.057659, 0, 0, 0, 1, 1,
-0.5083871, -0.7913107, -1.681739, 0, 0, 0, 1, 1,
-0.5064529, -0.01914061, -1.432475, 0, 0, 0, 1, 1,
-0.506426, 1.717103, -0.3460843, 0, 0, 0, 1, 1,
-0.5026026, 1.726495, -0.006297721, 0, 0, 0, 1, 1,
-0.5014212, -0.7363269, -0.4828955, 1, 1, 1, 1, 1,
-0.5005039, -1.114034, -2.032938, 1, 1, 1, 1, 1,
-0.4971619, 0.1467185, -1.643224, 1, 1, 1, 1, 1,
-0.4953397, -0.7080142, -1.856827, 1, 1, 1, 1, 1,
-0.4952212, 1.530565, -0.1313099, 1, 1, 1, 1, 1,
-0.4931857, -0.6188, -2.611472, 1, 1, 1, 1, 1,
-0.4908834, 0.4001417, 0.194921, 1, 1, 1, 1, 1,
-0.4760638, -1.333746, -1.794287, 1, 1, 1, 1, 1,
-0.474709, 1.519755, -2.060553, 1, 1, 1, 1, 1,
-0.4689179, 0.2512155, 0.2854446, 1, 1, 1, 1, 1,
-0.4652975, 1.204206, 0.7532814, 1, 1, 1, 1, 1,
-0.4641821, -0.0896002, -1.734878, 1, 1, 1, 1, 1,
-0.4563544, 1.33713, 0.1717514, 1, 1, 1, 1, 1,
-0.4530782, -1.077132, -2.390366, 1, 1, 1, 1, 1,
-0.447122, 0.08130163, -2.009315, 1, 1, 1, 1, 1,
-0.4437219, 0.5117337, -0.02544517, 0, 0, 1, 1, 1,
-0.4363215, 0.9262375, -0.5560135, 1, 0, 0, 1, 1,
-0.4352394, -0.4613256, -2.505589, 1, 0, 0, 1, 1,
-0.4341581, 0.8460093, -0.09028696, 1, 0, 0, 1, 1,
-0.4334303, -1.341718, -2.54552, 1, 0, 0, 1, 1,
-0.4332824, -0.9716659, -4.748292, 1, 0, 0, 1, 1,
-0.4320174, 0.1354943, -1.275612, 0, 0, 0, 1, 1,
-0.4304741, -2.056914, -3.159702, 0, 0, 0, 1, 1,
-0.4289667, -0.611119, -2.256177, 0, 0, 0, 1, 1,
-0.4282354, -2.960227, -3.73873, 0, 0, 0, 1, 1,
-0.4279558, 1.836914, -1.66677, 0, 0, 0, 1, 1,
-0.4221392, -0.8185303, -2.457883, 0, 0, 0, 1, 1,
-0.4204062, 1.109205, 0.118826, 0, 0, 0, 1, 1,
-0.4147429, 1.508325, -1.125309, 1, 1, 1, 1, 1,
-0.4130318, 1.019284, -0.8723754, 1, 1, 1, 1, 1,
-0.4113017, 1.383516, -1.012509, 1, 1, 1, 1, 1,
-0.4091105, -1.353902, -3.367421, 1, 1, 1, 1, 1,
-0.4077059, 0.04809399, -0.3456598, 1, 1, 1, 1, 1,
-0.4069069, -1.501139, -2.805292, 1, 1, 1, 1, 1,
-0.4035375, -0.0004220353, 0.4761468, 1, 1, 1, 1, 1,
-0.3953008, -0.3816231, -0.7506959, 1, 1, 1, 1, 1,
-0.3934965, -0.1062024, -2.063375, 1, 1, 1, 1, 1,
-0.3926761, -0.97594, -0.8522074, 1, 1, 1, 1, 1,
-0.390155, -0.09204021, -2.628647, 1, 1, 1, 1, 1,
-0.3892767, -0.07868845, -1.921855, 1, 1, 1, 1, 1,
-0.3845221, 0.6461149, -1.011583, 1, 1, 1, 1, 1,
-0.3845169, -0.3036024, -3.149241, 1, 1, 1, 1, 1,
-0.3835229, 0.8056219, -0.2975152, 1, 1, 1, 1, 1,
-0.3683181, 1.011003, 0.5534308, 0, 0, 1, 1, 1,
-0.3678958, 1.27458, 0.8083448, 1, 0, 0, 1, 1,
-0.3674201, 0.5067916, 0.7729005, 1, 0, 0, 1, 1,
-0.3669187, 0.1712963, -2.49916, 1, 0, 0, 1, 1,
-0.361528, 0.2347774, -0.8398533, 1, 0, 0, 1, 1,
-0.3613972, -1.208146, -3.017894, 1, 0, 0, 1, 1,
-0.3597623, -0.6195706, -1.357032, 0, 0, 0, 1, 1,
-0.3561585, -0.2715099, -2.625551, 0, 0, 0, 1, 1,
-0.3546677, 1.857362, -0.2169994, 0, 0, 0, 1, 1,
-0.3540586, 1.011871, 0.9906663, 0, 0, 0, 1, 1,
-0.3482118, 1.726631, -0.1430591, 0, 0, 0, 1, 1,
-0.3480026, -0.08285453, -1.013861, 0, 0, 0, 1, 1,
-0.3462281, 0.4488926, 0.5223172, 0, 0, 0, 1, 1,
-0.3453663, 0.9485635, -0.3014702, 1, 1, 1, 1, 1,
-0.3451, -0.4486589, -3.386475, 1, 1, 1, 1, 1,
-0.342751, -0.1456754, -0.676165, 1, 1, 1, 1, 1,
-0.341902, -0.2629752, -3.306638, 1, 1, 1, 1, 1,
-0.337309, -1.008361, -5.585238, 1, 1, 1, 1, 1,
-0.3359559, -0.740349, -3.147726, 1, 1, 1, 1, 1,
-0.3255001, -0.4249621, -1.615516, 1, 1, 1, 1, 1,
-0.3239612, 1.5287, 0.1906026, 1, 1, 1, 1, 1,
-0.3217349, -0.3069902, -2.516097, 1, 1, 1, 1, 1,
-0.3212817, -0.7820612, -3.765439, 1, 1, 1, 1, 1,
-0.3203137, 0.952242, 0.9886629, 1, 1, 1, 1, 1,
-0.316874, 0.1663579, -0.9125595, 1, 1, 1, 1, 1,
-0.3135003, 0.3000508, -1.522249, 1, 1, 1, 1, 1,
-0.3104083, 0.4821182, -0.2010904, 1, 1, 1, 1, 1,
-0.3060451, -0.009255816, -2.402385, 1, 1, 1, 1, 1,
-0.3002217, -1.694504, -2.880256, 0, 0, 1, 1, 1,
-0.2993252, 0.9991859, 0.7884714, 1, 0, 0, 1, 1,
-0.2973157, -0.2501343, -0.873467, 1, 0, 0, 1, 1,
-0.2842064, -0.2453006, -1.259982, 1, 0, 0, 1, 1,
-0.2840192, 0.8978174, -0.2466966, 1, 0, 0, 1, 1,
-0.2839541, -1.005938, -3.321958, 1, 0, 0, 1, 1,
-0.2822173, 0.5157732, -0.3036061, 0, 0, 0, 1, 1,
-0.2776158, -1.131881, -3.740288, 0, 0, 0, 1, 1,
-0.2741751, -1.966943, -3.336286, 0, 0, 0, 1, 1,
-0.271944, -1.679609, -2.679309, 0, 0, 0, 1, 1,
-0.2718948, -1.157107, -2.072457, 0, 0, 0, 1, 1,
-0.2697994, -0.6858322, -3.785498, 0, 0, 0, 1, 1,
-0.2682911, -1.50921, -3.165816, 0, 0, 0, 1, 1,
-0.2672102, -0.3235808, -2.583788, 1, 1, 1, 1, 1,
-0.2666292, -0.9137043, -4.379148, 1, 1, 1, 1, 1,
-0.2655266, -0.748461, -1.987466, 1, 1, 1, 1, 1,
-0.2633055, 1.118693, 0.8248923, 1, 1, 1, 1, 1,
-0.2630875, -0.4257462, -3.484619, 1, 1, 1, 1, 1,
-0.2621821, -0.3533845, -3.802004, 1, 1, 1, 1, 1,
-0.2617085, 0.2680484, -0.8341665, 1, 1, 1, 1, 1,
-0.2593482, 1.102915, 1.121878, 1, 1, 1, 1, 1,
-0.2548698, 0.3468059, -1.444353, 1, 1, 1, 1, 1,
-0.2529473, -0.0643419, -2.356678, 1, 1, 1, 1, 1,
-0.2474384, -1.266822, -2.481701, 1, 1, 1, 1, 1,
-0.2426656, 0.04058954, -3.037308, 1, 1, 1, 1, 1,
-0.2386387, -0.04167915, -1.478163, 1, 1, 1, 1, 1,
-0.2372725, 0.30434, 0.9889079, 1, 1, 1, 1, 1,
-0.2304233, 0.376826, -1.389723, 1, 1, 1, 1, 1,
-0.2289055, -1.030165, -3.892339, 0, 0, 1, 1, 1,
-0.2284579, -0.9992337, -1.400993, 1, 0, 0, 1, 1,
-0.2277719, 0.3539132, -1.645471, 1, 0, 0, 1, 1,
-0.2276572, 0.3843775, -1.031543, 1, 0, 0, 1, 1,
-0.2179876, 0.8503685, 2.029145, 1, 0, 0, 1, 1,
-0.2082376, 0.4451493, -1.37506, 1, 0, 0, 1, 1,
-0.2081198, -0.4151114, -1.200015, 0, 0, 0, 1, 1,
-0.2054643, -1.150458, -1.889228, 0, 0, 0, 1, 1,
-0.2053717, -0.9182811, -1.90606, 0, 0, 0, 1, 1,
-0.2036722, -0.7859649, -2.250597, 0, 0, 0, 1, 1,
-0.1918838, -1.61389, -3.41342, 0, 0, 0, 1, 1,
-0.1877598, 0.2282404, -1.532556, 0, 0, 0, 1, 1,
-0.1842643, -0.9120871, -4.515155, 0, 0, 0, 1, 1,
-0.1823164, 0.8261523, -1.05521, 1, 1, 1, 1, 1,
-0.1822549, -0.2204745, -2.368098, 1, 1, 1, 1, 1,
-0.1743378, 0.2606967, -0.007150745, 1, 1, 1, 1, 1,
-0.1740243, -1.592333, -3.584894, 1, 1, 1, 1, 1,
-0.1720296, 0.3062012, 0.5006029, 1, 1, 1, 1, 1,
-0.165253, -0.755591, -3.320813, 1, 1, 1, 1, 1,
-0.1616798, -1.417751, -4.0395, 1, 1, 1, 1, 1,
-0.1604756, -0.4064094, -3.633333, 1, 1, 1, 1, 1,
-0.159493, 1.881767, 1.58081, 1, 1, 1, 1, 1,
-0.1584049, 0.05794194, -1.77136, 1, 1, 1, 1, 1,
-0.1532155, -0.5098443, -2.036844, 1, 1, 1, 1, 1,
-0.1506718, -2.017106, -3.280584, 1, 1, 1, 1, 1,
-0.1486698, 2.201237, -0.009919791, 1, 1, 1, 1, 1,
-0.1443771, -0.108497, -1.333812, 1, 1, 1, 1, 1,
-0.1436215, 0.3667585, -1.374866, 1, 1, 1, 1, 1,
-0.1379865, 0.9985206, -0.3775809, 0, 0, 1, 1, 1,
-0.1371987, -0.1038136, -1.106841, 1, 0, 0, 1, 1,
-0.1367774, -1.324465, -2.620041, 1, 0, 0, 1, 1,
-0.1355004, 1.507887, -0.08343095, 1, 0, 0, 1, 1,
-0.1335894, 1.635293, 0.363496, 1, 0, 0, 1, 1,
-0.124488, -1.130036, -1.826587, 1, 0, 0, 1, 1,
-0.1221659, 1.133055, 1.358208, 0, 0, 0, 1, 1,
-0.121602, 1.93368, 1.099666, 0, 0, 0, 1, 1,
-0.1215904, -0.5290657, -1.310391, 0, 0, 0, 1, 1,
-0.1131929, -0.4179317, -3.12277, 0, 0, 0, 1, 1,
-0.1127367, 0.8068368, -1.390567, 0, 0, 0, 1, 1,
-0.1103727, 0.1025228, -0.4737164, 0, 0, 0, 1, 1,
-0.109494, -0.2103937, -4.835033, 0, 0, 0, 1, 1,
-0.1075173, -1.58199, -1.328865, 1, 1, 1, 1, 1,
-0.1073538, 0.8242189, 1.005037, 1, 1, 1, 1, 1,
-0.09170295, -0.2199016, -1.652492, 1, 1, 1, 1, 1,
-0.09141999, -1.52934, -4.18832, 1, 1, 1, 1, 1,
-0.09102858, 0.2388974, -1.144527, 1, 1, 1, 1, 1,
-0.08922242, 0.08607195, -2.589094, 1, 1, 1, 1, 1,
-0.08327912, 0.5905226, -1.692281, 1, 1, 1, 1, 1,
-0.08295806, 0.7061668, -0.9469744, 1, 1, 1, 1, 1,
-0.07972896, -1.271356, -2.972675, 1, 1, 1, 1, 1,
-0.07714491, 0.451365, -2.613179, 1, 1, 1, 1, 1,
-0.07585239, -0.8452425, -4.014471, 1, 1, 1, 1, 1,
-0.07564688, 0.3992738, -1.663319, 1, 1, 1, 1, 1,
-0.0747637, 0.677252, 0.4511874, 1, 1, 1, 1, 1,
-0.06881793, -0.7676534, -3.392762, 1, 1, 1, 1, 1,
-0.06524215, 0.2519217, 1.479627, 1, 1, 1, 1, 1,
-0.06088789, -0.6493104, -2.09207, 0, 0, 1, 1, 1,
-0.0608625, -0.2849951, -2.16761, 1, 0, 0, 1, 1,
-0.05302002, 0.4546653, -1.751741, 1, 0, 0, 1, 1,
-0.05047477, 1.788201, 0.2895166, 1, 0, 0, 1, 1,
-0.04983402, 1.254619, 1.483685, 1, 0, 0, 1, 1,
-0.04578834, -0.1180756, -3.284481, 1, 0, 0, 1, 1,
-0.04390798, -1.33971, -2.997371, 0, 0, 0, 1, 1,
-0.0421748, -0.1172635, -2.658898, 0, 0, 0, 1, 1,
-0.04126254, 0.3096386, 0.03764105, 0, 0, 0, 1, 1,
-0.04116114, 0.4882453, 0.08388788, 0, 0, 0, 1, 1,
-0.0404015, -0.786255, -1.830073, 0, 0, 0, 1, 1,
-0.0396855, -0.6294492, -3.475941, 0, 0, 0, 1, 1,
-0.03775651, -1.169321, -2.467178, 0, 0, 0, 1, 1,
-0.03605592, -0.4010834, -3.717566, 1, 1, 1, 1, 1,
-0.03365386, 0.9059063, -0.9410896, 1, 1, 1, 1, 1,
-0.03159682, 0.6391292, -1.185264, 1, 1, 1, 1, 1,
-0.03087593, 1.492074, -0.4105178, 1, 1, 1, 1, 1,
-0.03039912, 0.09886113, 0.6678426, 1, 1, 1, 1, 1,
-0.02963777, -0.1623558, -0.1754765, 1, 1, 1, 1, 1,
-0.02933283, 2.564676, -0.50297, 1, 1, 1, 1, 1,
-0.02639004, 0.9657814, 0.7707038, 1, 1, 1, 1, 1,
-0.0244224, -0.4813013, -2.933609, 1, 1, 1, 1, 1,
-0.02439605, -2.20388, -3.547218, 1, 1, 1, 1, 1,
-0.02421742, -0.02366999, -2.857446, 1, 1, 1, 1, 1,
-0.02244836, -0.4935149, -3.988458, 1, 1, 1, 1, 1,
-0.0220606, 1.827054, -0.3870664, 1, 1, 1, 1, 1,
-0.02071933, 0.6495928, 0.2530895, 1, 1, 1, 1, 1,
-0.01736583, -2.239822, -2.120989, 1, 1, 1, 1, 1,
-0.01582424, 0.1079388, 2.943011, 0, 0, 1, 1, 1,
-0.01577686, 0.1058903, -1.089369, 1, 0, 0, 1, 1,
-0.0133933, 1.622171, -1.88423, 1, 0, 0, 1, 1,
-0.0125708, -0.1349333, -3.178881, 1, 0, 0, 1, 1,
-0.01207659, 1.229802, 0.231109, 1, 0, 0, 1, 1,
-0.01167315, 1.379626, -0.6890948, 1, 0, 0, 1, 1,
-0.006761446, 0.3179552, 1.067471, 0, 0, 0, 1, 1,
-0.005655046, -1.389946, -4.858042, 0, 0, 0, 1, 1,
-0.003202051, -2.44724, -5.53132, 0, 0, 0, 1, 1,
0.001904769, 0.2080474, -0.7581149, 0, 0, 0, 1, 1,
0.004163132, 1.753377, -0.06477381, 0, 0, 0, 1, 1,
0.005875906, -0.6279677, 3.116387, 0, 0, 0, 1, 1,
0.00812392, 0.7666491, -0.2000861, 0, 0, 0, 1, 1,
0.009626586, -1.294364, 1.922889, 1, 1, 1, 1, 1,
0.01392099, -1.253823, 3.170541, 1, 1, 1, 1, 1,
0.01623728, -0.2170087, 2.090894, 1, 1, 1, 1, 1,
0.01634001, -0.1424973, 3.848817, 1, 1, 1, 1, 1,
0.02018065, -0.3014586, 2.544867, 1, 1, 1, 1, 1,
0.02440111, -1.640965, 4.349357, 1, 1, 1, 1, 1,
0.02728403, -0.5549399, 3.791186, 1, 1, 1, 1, 1,
0.02761534, -0.1640813, 2.144615, 1, 1, 1, 1, 1,
0.02894862, 0.2147171, -0.2197237, 1, 1, 1, 1, 1,
0.03092174, -0.2415779, 2.508816, 1, 1, 1, 1, 1,
0.03158053, 0.5862903, 1.189249, 1, 1, 1, 1, 1,
0.03418667, 1.111585, 0.9172395, 1, 1, 1, 1, 1,
0.04671124, -0.5401854, 1.860999, 1, 1, 1, 1, 1,
0.04678654, -0.7045473, 3.326238, 1, 1, 1, 1, 1,
0.0494954, 0.637758, -0.02561718, 1, 1, 1, 1, 1,
0.05128725, -1.185894, 2.837975, 0, 0, 1, 1, 1,
0.05720847, -0.7512071, 4.461658, 1, 0, 0, 1, 1,
0.05859986, -0.9886683, 2.870157, 1, 0, 0, 1, 1,
0.05925319, 1.271071, -0.2335801, 1, 0, 0, 1, 1,
0.06032821, -0.05223371, 2.448823, 1, 0, 0, 1, 1,
0.06807888, 0.6371093, 0.3233631, 1, 0, 0, 1, 1,
0.07542007, -0.5322131, 3.107287, 0, 0, 0, 1, 1,
0.07550918, 0.330326, -1.135578, 0, 0, 0, 1, 1,
0.07667554, 0.5424762, -0.007147257, 0, 0, 0, 1, 1,
0.07948172, -0.6765689, 4.230308, 0, 0, 0, 1, 1,
0.07999793, 1.759196, -0.455278, 0, 0, 0, 1, 1,
0.0801746, 0.4466885, -0.6248744, 0, 0, 0, 1, 1,
0.0820277, 1.257833, 1.980184, 0, 0, 0, 1, 1,
0.08599135, 0.2974071, 1.523716, 1, 1, 1, 1, 1,
0.08910523, 1.618429, 0.2145275, 1, 1, 1, 1, 1,
0.0902364, -0.2397612, 4.576231, 1, 1, 1, 1, 1,
0.09026939, 0.1113595, 2.754881, 1, 1, 1, 1, 1,
0.09181255, -1.863364, 1.470889, 1, 1, 1, 1, 1,
0.09569196, -0.07043771, 1.404179, 1, 1, 1, 1, 1,
0.09606058, -0.5178861, 2.768135, 1, 1, 1, 1, 1,
0.09606704, -2.307301, 3.767375, 1, 1, 1, 1, 1,
0.1001456, 0.812118, 0.05085202, 1, 1, 1, 1, 1,
0.1008747, 1.152989, 1.290822, 1, 1, 1, 1, 1,
0.1061137, 0.5409137, 0.02206331, 1, 1, 1, 1, 1,
0.1111464, -0.9616215, 4.103132, 1, 1, 1, 1, 1,
0.1119251, 0.07237139, 1.829283, 1, 1, 1, 1, 1,
0.1132463, 1.774205, 1.198043, 1, 1, 1, 1, 1,
0.1133654, -0.3212969, 1.625462, 1, 1, 1, 1, 1,
0.1145461, 0.3974302, 1.697597, 0, 0, 1, 1, 1,
0.1170106, -0.08221938, 1.46089, 1, 0, 0, 1, 1,
0.1171204, -0.2982496, 3.591971, 1, 0, 0, 1, 1,
0.1235619, -2.029394, 2.576528, 1, 0, 0, 1, 1,
0.125904, -1.323454, 3.90187, 1, 0, 0, 1, 1,
0.1384408, -0.8825111, 3.333679, 1, 0, 0, 1, 1,
0.140449, 0.05115293, -0.005067096, 0, 0, 0, 1, 1,
0.141239, 0.1163199, 1.555549, 0, 0, 0, 1, 1,
0.1432478, -0.2818845, 2.027977, 0, 0, 0, 1, 1,
0.1457763, -0.8927468, 2.232435, 0, 0, 0, 1, 1,
0.1476584, -1.192923, 3.053258, 0, 0, 0, 1, 1,
0.1480252, 1.560891, 0.1211072, 0, 0, 0, 1, 1,
0.1483307, -0.03022616, 1.888317, 0, 0, 0, 1, 1,
0.1510782, -0.6154186, 2.408771, 1, 1, 1, 1, 1,
0.1516744, 0.4100269, 0.2161936, 1, 1, 1, 1, 1,
0.1529935, 1.631509, 1.619088, 1, 1, 1, 1, 1,
0.1530225, -0.2620499, 2.021425, 1, 1, 1, 1, 1,
0.1534773, 1.577166, -0.1405828, 1, 1, 1, 1, 1,
0.1536504, -1.812736, 3.201688, 1, 1, 1, 1, 1,
0.1549153, 0.8561251, 0.903842, 1, 1, 1, 1, 1,
0.1626335, 0.7986128, 0.1706402, 1, 1, 1, 1, 1,
0.1627849, 0.7803136, -2.127249, 1, 1, 1, 1, 1,
0.1631698, 0.7066311, -0.6739034, 1, 1, 1, 1, 1,
0.1763827, 1.605092, -0.09511906, 1, 1, 1, 1, 1,
0.1783562, 1.987517, -0.1865121, 1, 1, 1, 1, 1,
0.1814143, 1.020098, -1.702793, 1, 1, 1, 1, 1,
0.1910977, -2.16786, 1.566775, 1, 1, 1, 1, 1,
0.1937041, 0.5391976, 0.7887848, 1, 1, 1, 1, 1,
0.2001455, 1.170624, 1.012998, 0, 0, 1, 1, 1,
0.2011462, -0.546905, 4.169189, 1, 0, 0, 1, 1,
0.203765, -1.83281, 3.642185, 1, 0, 0, 1, 1,
0.2039911, 0.6145486, -0.3914062, 1, 0, 0, 1, 1,
0.2044313, 0.4343705, 1.18324, 1, 0, 0, 1, 1,
0.2053709, 2.40497, 0.1643153, 1, 0, 0, 1, 1,
0.2066569, -2.354654, 3.735195, 0, 0, 0, 1, 1,
0.206678, 1.050988, 0.9899928, 0, 0, 0, 1, 1,
0.2077937, -0.9558371, 3.59531, 0, 0, 0, 1, 1,
0.2171542, -1.045469, 2.31096, 0, 0, 0, 1, 1,
0.2235045, -0.2126189, 3.030191, 0, 0, 0, 1, 1,
0.2252758, 0.9366898, -0.01298024, 0, 0, 0, 1, 1,
0.225578, -0.6217779, 2.024748, 0, 0, 0, 1, 1,
0.2282311, -0.07188281, 1.906761, 1, 1, 1, 1, 1,
0.2295879, 0.007600982, 2.484883, 1, 1, 1, 1, 1,
0.2327289, 1.157426, 0.06941457, 1, 1, 1, 1, 1,
0.2335368, -0.5125925, 2.413934, 1, 1, 1, 1, 1,
0.2340112, -0.2319147, 2.362633, 1, 1, 1, 1, 1,
0.235499, -0.193767, 1.925117, 1, 1, 1, 1, 1,
0.2362414, 1.167247, 0.8472682, 1, 1, 1, 1, 1,
0.2363772, 1.035834, 0.4829816, 1, 1, 1, 1, 1,
0.2391825, 0.3628462, 1.499958, 1, 1, 1, 1, 1,
0.2405932, 0.6523714, 1.469186, 1, 1, 1, 1, 1,
0.2408123, 1.672386, 1.321202, 1, 1, 1, 1, 1,
0.2414785, 1.017277, 0.7967754, 1, 1, 1, 1, 1,
0.2429803, 1.782683, -0.5112049, 1, 1, 1, 1, 1,
0.2439607, 1.499099, 0.1365897, 1, 1, 1, 1, 1,
0.2502984, -1.054739, 1.831863, 1, 1, 1, 1, 1,
0.2546306, -1.438505, 3.302645, 0, 0, 1, 1, 1,
0.2548016, 2.098259, 0.08642881, 1, 0, 0, 1, 1,
0.2548821, -0.3319387, 2.214318, 1, 0, 0, 1, 1,
0.2585964, 0.5184473, 0.3417518, 1, 0, 0, 1, 1,
0.2603865, 0.5516489, 0.2640357, 1, 0, 0, 1, 1,
0.2638446, -1.22675, 4.356387, 1, 0, 0, 1, 1,
0.2651259, 1.524542, -0.3667664, 0, 0, 0, 1, 1,
0.2682973, -0.1700349, 1.440356, 0, 0, 0, 1, 1,
0.2685929, 0.9265769, 0.8343536, 0, 0, 0, 1, 1,
0.2698598, -1.086601, 4.189474, 0, 0, 0, 1, 1,
0.2704443, -0.5346944, 5.03577, 0, 0, 0, 1, 1,
0.2722721, 0.5452008, 0.9421457, 0, 0, 0, 1, 1,
0.2747001, 0.4875098, 0.4827555, 0, 0, 0, 1, 1,
0.2769292, -1.04805, 3.666075, 1, 1, 1, 1, 1,
0.2774444, -0.5454676, 1.099607, 1, 1, 1, 1, 1,
0.2809674, 0.1534739, 1.014489, 1, 1, 1, 1, 1,
0.2830773, 1.953275, 1.572784, 1, 1, 1, 1, 1,
0.2843858, -0.3328527, 3.324717, 1, 1, 1, 1, 1,
0.2849508, 0.1771696, 0.1872594, 1, 1, 1, 1, 1,
0.2874757, -0.796989, 3.006976, 1, 1, 1, 1, 1,
0.2881243, -0.4578017, 2.278626, 1, 1, 1, 1, 1,
0.2926235, 1.12742, -0.4385404, 1, 1, 1, 1, 1,
0.2985822, -0.3421731, 2.502199, 1, 1, 1, 1, 1,
0.3024215, 1.762276, -0.1947957, 1, 1, 1, 1, 1,
0.3024365, -1.07495, 2.504779, 1, 1, 1, 1, 1,
0.3057141, 0.08827641, 2.232212, 1, 1, 1, 1, 1,
0.3073895, 0.4009004, 0.9703199, 1, 1, 1, 1, 1,
0.3089241, -0.08987476, 1.346129, 1, 1, 1, 1, 1,
0.3114188, 0.9074629, 0.5440707, 0, 0, 1, 1, 1,
0.3133528, -0.7071025, 2.912836, 1, 0, 0, 1, 1,
0.3170311, 1.136807, -0.7626135, 1, 0, 0, 1, 1,
0.3178389, -0.5814795, 2.907854, 1, 0, 0, 1, 1,
0.3195277, 0.01452816, 1.915685, 1, 0, 0, 1, 1,
0.321195, 0.468458, 1.439579, 1, 0, 0, 1, 1,
0.3234171, -1.241353, 2.323287, 0, 0, 0, 1, 1,
0.325134, 0.4067982, -0.5327893, 0, 0, 0, 1, 1,
0.3371887, 0.8409425, -0.08824969, 0, 0, 0, 1, 1,
0.34105, 0.6714334, 0.7088566, 0, 0, 0, 1, 1,
0.3415018, 0.3786142, 1.361281, 0, 0, 0, 1, 1,
0.3419744, -0.161952, 0.1248124, 0, 0, 0, 1, 1,
0.350047, 0.4564883, -1.252188, 0, 0, 0, 1, 1,
0.3508434, 1.147047, 0.3664171, 1, 1, 1, 1, 1,
0.3552786, 1.616082, -0.007457246, 1, 1, 1, 1, 1,
0.3605248, -0.2994545, 2.16077, 1, 1, 1, 1, 1,
0.3626443, 1.146883, 0.8529617, 1, 1, 1, 1, 1,
0.3681318, -0.405975, 2.159773, 1, 1, 1, 1, 1,
0.3689565, -1.053895, 2.738892, 1, 1, 1, 1, 1,
0.3697298, -1.145, 3.366328, 1, 1, 1, 1, 1,
0.3703841, 0.3106245, 1.783608, 1, 1, 1, 1, 1,
0.3746404, 0.4314162, -0.06459873, 1, 1, 1, 1, 1,
0.3794125, 0.1577583, 2.276173, 1, 1, 1, 1, 1,
0.3915183, -0.5715063, 2.363742, 1, 1, 1, 1, 1,
0.3921614, 0.3064814, 1.943332, 1, 1, 1, 1, 1,
0.3944904, 0.08825702, 1.518042, 1, 1, 1, 1, 1,
0.3996288, -0.8133336, 4.370872, 1, 1, 1, 1, 1,
0.401903, -0.2441967, 2.24572, 1, 1, 1, 1, 1,
0.4020797, 0.04969189, 2.865672, 0, 0, 1, 1, 1,
0.4027218, 0.5839806, -1.47323, 1, 0, 0, 1, 1,
0.4123475, -0.1612615, 2.526072, 1, 0, 0, 1, 1,
0.4150273, 0.8148007, -0.2213653, 1, 0, 0, 1, 1,
0.4162684, -2.208037, 4.451503, 1, 0, 0, 1, 1,
0.4162851, 1.784606, 0.4962841, 1, 0, 0, 1, 1,
0.4185777, -1.499248, 4.624543, 0, 0, 0, 1, 1,
0.4308339, 1.309747, 0.3846381, 0, 0, 0, 1, 1,
0.4326677, 1.147155, -0.3777507, 0, 0, 0, 1, 1,
0.4357241, -0.08201903, 1.691686, 0, 0, 0, 1, 1,
0.4547807, 0.2681485, 2.138577, 0, 0, 0, 1, 1,
0.4585651, -2.004, 4.874591, 0, 0, 0, 1, 1,
0.4650122, -0.1006559, 2.747965, 0, 0, 0, 1, 1,
0.4687129, -1.44964, 2.5618, 1, 1, 1, 1, 1,
0.4691086, 1.287724, 1.3878, 1, 1, 1, 1, 1,
0.4691868, 0.02492877, 1.248808, 1, 1, 1, 1, 1,
0.4756535, -0.6607151, 3.675856, 1, 1, 1, 1, 1,
0.4773122, 0.2169232, -0.9285998, 1, 1, 1, 1, 1,
0.4803695, 1.795657, 1.693623, 1, 1, 1, 1, 1,
0.4814587, -1.36386, 2.830706, 1, 1, 1, 1, 1,
0.485704, 0.5613934, 0.5094622, 1, 1, 1, 1, 1,
0.4897939, -0.5360299, 3.544115, 1, 1, 1, 1, 1,
0.4908071, 0.3722723, 0.8604693, 1, 1, 1, 1, 1,
0.491002, 0.5357573, 2.062997, 1, 1, 1, 1, 1,
0.4934816, 1.326593, 0.03301685, 1, 1, 1, 1, 1,
0.4950752, -0.7999303, 1.449302, 1, 1, 1, 1, 1,
0.5025346, -0.8015358, 4.422624, 1, 1, 1, 1, 1,
0.5068132, -2.087683, 1.133324, 1, 1, 1, 1, 1,
0.5082005, -0.2460906, 2.812127, 0, 0, 1, 1, 1,
0.5129221, 0.4706068, 1.772695, 1, 0, 0, 1, 1,
0.5134687, 0.6088278, -0.779323, 1, 0, 0, 1, 1,
0.5144516, -0.1019798, 2.185813, 1, 0, 0, 1, 1,
0.5164635, -0.05430157, 1.092386, 1, 0, 0, 1, 1,
0.5198846, 0.2495769, 1.065616, 1, 0, 0, 1, 1,
0.5237288, 0.8253792, -0.5217546, 0, 0, 0, 1, 1,
0.5238235, -1.232833, 3.182493, 0, 0, 0, 1, 1,
0.52531, -0.1005637, 1.042224, 0, 0, 0, 1, 1,
0.5259387, -0.5092181, 2.594072, 0, 0, 0, 1, 1,
0.5288553, 0.52475, 2.013171, 0, 0, 0, 1, 1,
0.5305322, 0.1656369, 0.3469226, 0, 0, 0, 1, 1,
0.5338148, 1.401135, -0.2530611, 0, 0, 0, 1, 1,
0.5351884, 0.2209191, 0.4162932, 1, 1, 1, 1, 1,
0.5360414, -0.608443, 1.716719, 1, 1, 1, 1, 1,
0.5395641, 0.546921, -0.4330839, 1, 1, 1, 1, 1,
0.5451969, 0.75711, 2.016564, 1, 1, 1, 1, 1,
0.5464469, 0.5649227, -0.8787175, 1, 1, 1, 1, 1,
0.5494636, -0.4607501, 1.833736, 1, 1, 1, 1, 1,
0.5526403, -0.03550943, 1.710485, 1, 1, 1, 1, 1,
0.5531039, 1.354797, -0.2610804, 1, 1, 1, 1, 1,
0.5581598, -1.737252, 2.455588, 1, 1, 1, 1, 1,
0.5626825, -0.9748462, 2.480625, 1, 1, 1, 1, 1,
0.5651561, -0.5558299, 2.343925, 1, 1, 1, 1, 1,
0.56625, 1.205916, 0.3027458, 1, 1, 1, 1, 1,
0.566466, -0.4156912, 3.396408, 1, 1, 1, 1, 1,
0.5717835, 0.3550438, 1.32822, 1, 1, 1, 1, 1,
0.575066, -0.1931268, 3.43205, 1, 1, 1, 1, 1,
0.5756194, 0.2170239, 1.817031, 0, 0, 1, 1, 1,
0.5836458, 0.9432914, 0.2508096, 1, 0, 0, 1, 1,
0.5849852, -1.157608, 3.201134, 1, 0, 0, 1, 1,
0.5864049, -0.3419891, 2.751736, 1, 0, 0, 1, 1,
0.5875974, 0.7559039, 1.15748, 1, 0, 0, 1, 1,
0.5882019, -0.04505244, 1.484856, 1, 0, 0, 1, 1,
0.5891675, 0.1466769, 0.7636893, 0, 0, 0, 1, 1,
0.5893201, 1.006481, -0.5608892, 0, 0, 0, 1, 1,
0.5904127, -0.1554111, 1.182961, 0, 0, 0, 1, 1,
0.5944062, 1.592828, -0.1176288, 0, 0, 0, 1, 1,
0.5991095, 0.05584311, 0.7879969, 0, 0, 0, 1, 1,
0.6043673, -0.8994499, 4.061531, 0, 0, 0, 1, 1,
0.606674, -0.9887459, 1.444799, 0, 0, 0, 1, 1,
0.6092165, -1.01208, 0.3064477, 1, 1, 1, 1, 1,
0.6199288, 1.266401, 1.333699, 1, 1, 1, 1, 1,
0.6202691, -1.069991, 2.328532, 1, 1, 1, 1, 1,
0.621092, -1.870516, 1.488976, 1, 1, 1, 1, 1,
0.6286961, 0.01249227, -0.3473422, 1, 1, 1, 1, 1,
0.6306067, 0.6091819, 1.503856, 1, 1, 1, 1, 1,
0.633338, -0.2749773, 1.548907, 1, 1, 1, 1, 1,
0.6352406, 2.245364, -0.1675031, 1, 1, 1, 1, 1,
0.6395833, -0.3780459, 1.883979, 1, 1, 1, 1, 1,
0.6451766, -0.115843, 0.991613, 1, 1, 1, 1, 1,
0.6458667, 0.2186032, 1.702331, 1, 1, 1, 1, 1,
0.6504813, -0.8686987, 2.077679, 1, 1, 1, 1, 1,
0.651704, -0.1888528, 2.890983, 1, 1, 1, 1, 1,
0.6521815, 0.8458782, 1.23092, 1, 1, 1, 1, 1,
0.6525415, -1.854089, 3.205836, 1, 1, 1, 1, 1,
0.6569419, 0.02244525, 1.812645, 0, 0, 1, 1, 1,
0.6627622, -1.645544, 3.337624, 1, 0, 0, 1, 1,
0.6632437, 0.7853116, 1.734469, 1, 0, 0, 1, 1,
0.6640602, 1.611918, 1.505185, 1, 0, 0, 1, 1,
0.6708682, -0.7780689, 4.266026, 1, 0, 0, 1, 1,
0.6734564, -0.9459519, 2.397559, 1, 0, 0, 1, 1,
0.6747867, 0.6114015, 2.475984, 0, 0, 0, 1, 1,
0.6828408, 0.04428098, 3.287005, 0, 0, 0, 1, 1,
0.6858141, 0.4567742, 1.651399, 0, 0, 0, 1, 1,
0.6871556, 2.440388, 0.9764848, 0, 0, 0, 1, 1,
0.6918733, -1.157661, 3.660812, 0, 0, 0, 1, 1,
0.6921222, -0.02007544, 2.040375, 0, 0, 0, 1, 1,
0.6924534, -0.03112409, 0.6318904, 0, 0, 0, 1, 1,
0.6936058, -1.70916, 2.95171, 1, 1, 1, 1, 1,
0.6941574, 0.7284672, 1.093347, 1, 1, 1, 1, 1,
0.699145, 0.3173692, -0.357544, 1, 1, 1, 1, 1,
0.7077795, 1.382686, -0.06251635, 1, 1, 1, 1, 1,
0.7097188, 0.1988093, -0.8053659, 1, 1, 1, 1, 1,
0.7108575, 0.740109, 0.6689214, 1, 1, 1, 1, 1,
0.7143791, -1.56275, 2.137208, 1, 1, 1, 1, 1,
0.7199079, 0.9242044, -0.8830567, 1, 1, 1, 1, 1,
0.7214786, -0.6779301, 1.405506, 1, 1, 1, 1, 1,
0.7236801, -0.4767034, 3.129002, 1, 1, 1, 1, 1,
0.7255552, -1.687037, 3.129232, 1, 1, 1, 1, 1,
0.7312219, 1.310446, -1.415841, 1, 1, 1, 1, 1,
0.73135, -0.1849781, 0.3568631, 1, 1, 1, 1, 1,
0.7395502, -1.721906, 2.452811, 1, 1, 1, 1, 1,
0.743537, 1.453188, -0.6984911, 1, 1, 1, 1, 1,
0.7437375, -1.848072, 3.613346, 0, 0, 1, 1, 1,
0.7453679, -0.5175729, 0.8215775, 1, 0, 0, 1, 1,
0.7553764, 0.3137101, 1.286304, 1, 0, 0, 1, 1,
0.7555476, 0.9710268, -0.4378851, 1, 0, 0, 1, 1,
0.7603393, -0.6755121, 1.285208, 1, 0, 0, 1, 1,
0.7626892, 0.646987, 1.200376, 1, 0, 0, 1, 1,
0.7709622, -0.02866439, 1.879697, 0, 0, 0, 1, 1,
0.7710254, -0.6933948, 5.467141, 0, 0, 0, 1, 1,
0.771197, -0.9296653, 1.347054, 0, 0, 0, 1, 1,
0.7727244, 0.3384187, 0.3672643, 0, 0, 0, 1, 1,
0.7735888, -1.703522, 2.491578, 0, 0, 0, 1, 1,
0.7798193, -0.1687868, 2.83742, 0, 0, 0, 1, 1,
0.7836272, -0.5843948, 2.746715, 0, 0, 0, 1, 1,
0.7845778, 1.114582, 0.6860144, 1, 1, 1, 1, 1,
0.7861154, -0.6422407, 1.335612, 1, 1, 1, 1, 1,
0.7883959, -0.9388078, 2.379199, 1, 1, 1, 1, 1,
0.7895515, 1.970879, 1.536466, 1, 1, 1, 1, 1,
0.7949284, 0.6916527, 1.293844, 1, 1, 1, 1, 1,
0.7957011, -2.681801, 2.29331, 1, 1, 1, 1, 1,
0.7967743, 0.02681636, 1.229109, 1, 1, 1, 1, 1,
0.8027009, -3.464431, 2.625431, 1, 1, 1, 1, 1,
0.8111301, -1.001686, 1.569296, 1, 1, 1, 1, 1,
0.8181145, 0.7819859, 0.1713192, 1, 1, 1, 1, 1,
0.8188305, -1.776455, 2.070372, 1, 1, 1, 1, 1,
0.8192004, 0.6454049, 0.07079639, 1, 1, 1, 1, 1,
0.8233744, 1.774799, 0.3946634, 1, 1, 1, 1, 1,
0.8272892, 1.143909, 1.16086, 1, 1, 1, 1, 1,
0.8275182, -2.247595, 4.117445, 1, 1, 1, 1, 1,
0.8278257, -0.6375461, 2.634547, 0, 0, 1, 1, 1,
0.834597, -0.4827363, 1.384709, 1, 0, 0, 1, 1,
0.8353205, -0.113566, 1.816075, 1, 0, 0, 1, 1,
0.8356271, 1.337739, 1.031552, 1, 0, 0, 1, 1,
0.8372023, 0.769761, 0.4107589, 1, 0, 0, 1, 1,
0.8374771, -0.09204496, 1.9188, 1, 0, 0, 1, 1,
0.8420405, -1.284551, 0.7477176, 0, 0, 0, 1, 1,
0.8436676, 0.7530991, 0.5919864, 0, 0, 0, 1, 1,
0.8478134, -0.8460279, 2.310116, 0, 0, 0, 1, 1,
0.8484261, -0.4693201, 1.063876, 0, 0, 0, 1, 1,
0.8516211, 2.109621, -0.4178366, 0, 0, 0, 1, 1,
0.8535726, -0.7465475, -0.2191733, 0, 0, 0, 1, 1,
0.8546612, -1.559703, 2.104728, 0, 0, 0, 1, 1,
0.8556069, 1.294912, 0.6182789, 1, 1, 1, 1, 1,
0.8565417, 0.2685922, -0.4168479, 1, 1, 1, 1, 1,
0.8603465, 1.257467, 0.9988138, 1, 1, 1, 1, 1,
0.8653259, -1.753765, 2.292386, 1, 1, 1, 1, 1,
0.8663988, 0.9751359, 1.53552, 1, 1, 1, 1, 1,
0.8700203, 0.5704163, 0.6937559, 1, 1, 1, 1, 1,
0.8704702, -1.502798, 1.198604, 1, 1, 1, 1, 1,
0.8718292, 0.2126197, 3.445624, 1, 1, 1, 1, 1,
0.8744084, 0.4896833, -0.1212725, 1, 1, 1, 1, 1,
0.8804106, -1.537506, 3.101508, 1, 1, 1, 1, 1,
0.8809361, 1.514575, -1.603814, 1, 1, 1, 1, 1,
0.8829941, -0.1227153, -0.2788389, 1, 1, 1, 1, 1,
0.8844048, -1.010448, 2.544881, 1, 1, 1, 1, 1,
0.8894151, -2.464783, 1.424447, 1, 1, 1, 1, 1,
0.8895603, -1.32988, 3.34296, 1, 1, 1, 1, 1,
0.891628, -0.563178, 3.910474, 0, 0, 1, 1, 1,
0.8917833, 0.3311723, 1.990116, 1, 0, 0, 1, 1,
0.8957227, -0.2804048, 2.291115, 1, 0, 0, 1, 1,
0.9094778, -0.2687342, 2.449233, 1, 0, 0, 1, 1,
0.9116296, -1.134941, 1.261291, 1, 0, 0, 1, 1,
0.9120836, 0.8621324, 2.630913, 1, 0, 0, 1, 1,
0.9139984, -0.4446621, 1.065949, 0, 0, 0, 1, 1,
0.919301, 1.14441, -0.7376242, 0, 0, 0, 1, 1,
0.9201873, 2.105104, -0.871103, 0, 0, 0, 1, 1,
0.9231035, -0.344739, 0.1919488, 0, 0, 0, 1, 1,
0.9268183, 2.386459, 0.3602573, 0, 0, 0, 1, 1,
0.9276688, -0.4231361, 1.422992, 0, 0, 0, 1, 1,
0.931764, 0.5301318, 1.280487, 0, 0, 0, 1, 1,
0.9348388, 0.7531439, 0.396332, 1, 1, 1, 1, 1,
0.9387206, 0.5809721, -1.714457, 1, 1, 1, 1, 1,
0.9425707, -1.432545, 4.080471, 1, 1, 1, 1, 1,
0.9439684, -2.002212, 2.955299, 1, 1, 1, 1, 1,
0.9446291, -0.7971908, 2.640279, 1, 1, 1, 1, 1,
0.9506397, -1.006011, 4.265177, 1, 1, 1, 1, 1,
0.9537057, 0.3856311, 0.4624025, 1, 1, 1, 1, 1,
0.9557248, -0.2140503, 2.920783, 1, 1, 1, 1, 1,
0.9609895, -1.40798, 3.192548, 1, 1, 1, 1, 1,
0.9681622, -0.8966342, 2.241936, 1, 1, 1, 1, 1,
0.9688311, 0.5929313, 0.1681622, 1, 1, 1, 1, 1,
0.972617, 1.923083, -0.1059869, 1, 1, 1, 1, 1,
0.9734364, -0.1504233, 2.884767, 1, 1, 1, 1, 1,
0.9741955, -1.704242, 2.806082, 1, 1, 1, 1, 1,
0.9743698, 1.075301, 0.6081561, 1, 1, 1, 1, 1,
0.9756477, 0.214662, 1.774591, 0, 0, 1, 1, 1,
0.9768513, -2.561924, 1.705277, 1, 0, 0, 1, 1,
0.9857895, 1.220431, 0.7976989, 1, 0, 0, 1, 1,
0.9887019, -0.3003061, 2.735469, 1, 0, 0, 1, 1,
0.9927624, 0.1678233, 0.004364281, 1, 0, 0, 1, 1,
0.9957773, -0.911828, 3.313866, 1, 0, 0, 1, 1,
0.9982975, 1.104241, -0.8450602, 0, 0, 0, 1, 1,
0.9998507, 0.0997632, 2.692924, 0, 0, 0, 1, 1,
1.013764, 0.09527563, -0.2672589, 0, 0, 0, 1, 1,
1.016034, -0.1184951, 0.3797513, 0, 0, 0, 1, 1,
1.021802, 1.286309, -0.629148, 0, 0, 0, 1, 1,
1.021967, -0.6768628, 2.842232, 0, 0, 0, 1, 1,
1.023609, 0.5794696, 1.38294, 0, 0, 0, 1, 1,
1.029362, -0.6591564, 2.706963, 1, 1, 1, 1, 1,
1.030113, -1.814589, 2.774788, 1, 1, 1, 1, 1,
1.033597, -0.1170563, 3.410936, 1, 1, 1, 1, 1,
1.036705, 0.3501909, 0.8345369, 1, 1, 1, 1, 1,
1.03994, -1.044715, 2.365427, 1, 1, 1, 1, 1,
1.041681, -1.972327, 2.873652, 1, 1, 1, 1, 1,
1.044316, -0.508436, 2.564986, 1, 1, 1, 1, 1,
1.046349, -0.04462806, 1.479563, 1, 1, 1, 1, 1,
1.060466, 1.585555, 0.453331, 1, 1, 1, 1, 1,
1.062088, -0.1153811, 1.774785, 1, 1, 1, 1, 1,
1.064029, -1.1899, 0.369747, 1, 1, 1, 1, 1,
1.069155, -1.47953, 3.146353, 1, 1, 1, 1, 1,
1.078178, 0.02530899, 2.299594, 1, 1, 1, 1, 1,
1.081265, 0.6960942, -0.009551194, 1, 1, 1, 1, 1,
1.083513, 0.6190336, 1.107758, 1, 1, 1, 1, 1,
1.092129, 0.2971788, 2.605441, 0, 0, 1, 1, 1,
1.094444, 0.9524964, 1.775883, 1, 0, 0, 1, 1,
1.096254, 0.3121772, 2.470468, 1, 0, 0, 1, 1,
1.097181, 0.2913745, 2.260384, 1, 0, 0, 1, 1,
1.100211, 1.110665, -0.7893312, 1, 0, 0, 1, 1,
1.106345, 0.9895104, 0.861711, 1, 0, 0, 1, 1,
1.107965, -0.04122605, 0.7329351, 0, 0, 0, 1, 1,
1.109011, -0.4711422, 2.997081, 0, 0, 0, 1, 1,
1.112294, 0.3880959, 0.4808045, 0, 0, 0, 1, 1,
1.122278, 0.2451598, 1.60837, 0, 0, 0, 1, 1,
1.128225, -0.3499037, 1.873584, 0, 0, 0, 1, 1,
1.138981, 0.6541346, 0.448915, 0, 0, 0, 1, 1,
1.140662, 0.06637557, 0.418822, 0, 0, 0, 1, 1,
1.141201, 0.6830429, -0.5870724, 1, 1, 1, 1, 1,
1.147149, -0.4292012, 1.05152, 1, 1, 1, 1, 1,
1.171776, 0.8832957, 0.1749952, 1, 1, 1, 1, 1,
1.172395, 0.6657025, 1.79595, 1, 1, 1, 1, 1,
1.173649, 1.235138, 1.314771, 1, 1, 1, 1, 1,
1.174693, 1.088888, 1.811006, 1, 1, 1, 1, 1,
1.176573, -0.05012824, 1.249434, 1, 1, 1, 1, 1,
1.179769, -0.7745832, 2.296718, 1, 1, 1, 1, 1,
1.180782, 0.4394318, 0.8688399, 1, 1, 1, 1, 1,
1.184201, -0.3786702, 0.1558239, 1, 1, 1, 1, 1,
1.189377, -0.2000614, 1.414954, 1, 1, 1, 1, 1,
1.20816, -0.6740864, 2.443573, 1, 1, 1, 1, 1,
1.208604, 0.07438411, 0.9098394, 1, 1, 1, 1, 1,
1.214409, -0.01845212, 0.7510532, 1, 1, 1, 1, 1,
1.21826, 1.780128, 0.4327827, 1, 1, 1, 1, 1,
1.223502, -0.6617101, 2.273917, 0, 0, 1, 1, 1,
1.226323, 0.7645789, 0.1725376, 1, 0, 0, 1, 1,
1.236508, -1.419703, 1.378227, 1, 0, 0, 1, 1,
1.242016, 0.1101731, 1.886781, 1, 0, 0, 1, 1,
1.250779, -2.149665, 3.08396, 1, 0, 0, 1, 1,
1.250823, 0.6932983, -1.25917, 1, 0, 0, 1, 1,
1.251911, 1.080708, 0.1395087, 0, 0, 0, 1, 1,
1.258076, 1.493011, -0.4126353, 0, 0, 0, 1, 1,
1.258952, 2.634997, 1.6977, 0, 0, 0, 1, 1,
1.282541, 0.1348311, 1.592267, 0, 0, 0, 1, 1,
1.290255, 0.7967488, -0.3067532, 0, 0, 0, 1, 1,
1.292119, -0.2428783, 0.2703417, 0, 0, 0, 1, 1,
1.299361, -1.055558, 5.17368, 0, 0, 0, 1, 1,
1.309771, 0.5014629, 1.900326, 1, 1, 1, 1, 1,
1.312892, 0.2887354, 1.630941, 1, 1, 1, 1, 1,
1.313828, -0.4453196, 1.734395, 1, 1, 1, 1, 1,
1.317197, 0.9558263, 1.041276, 1, 1, 1, 1, 1,
1.322773, 0.06255788, 2.19619, 1, 1, 1, 1, 1,
1.326269, -1.044659, 2.147364, 1, 1, 1, 1, 1,
1.338535, -0.8825726, 1.048657, 1, 1, 1, 1, 1,
1.338535, 1.929239, 0.9039653, 1, 1, 1, 1, 1,
1.34385, -0.2743638, 1.382342, 1, 1, 1, 1, 1,
1.346439, 0.7078762, 0.296901, 1, 1, 1, 1, 1,
1.347342, -0.7807703, 3.67966, 1, 1, 1, 1, 1,
1.362578, -0.2660357, 2.309996, 1, 1, 1, 1, 1,
1.366819, -1.174546, 3.322652, 1, 1, 1, 1, 1,
1.368928, 1.115007, 2.692932, 1, 1, 1, 1, 1,
1.391852, -0.2968558, 2.668917, 1, 1, 1, 1, 1,
1.394848, 1.532641, 1.36734, 0, 0, 1, 1, 1,
1.406987, 1.800322, 1.509592, 1, 0, 0, 1, 1,
1.415592, 2.615551, 1.322152, 1, 0, 0, 1, 1,
1.419387, 0.7923166, 0.6408938, 1, 0, 0, 1, 1,
1.422801, 0.5468673, 1.560379, 1, 0, 0, 1, 1,
1.434765, 1.268708, 1.996116, 1, 0, 0, 1, 1,
1.435406, 0.1849598, 1.847275, 0, 0, 0, 1, 1,
1.445748, 0.7929529, 0.6153495, 0, 0, 0, 1, 1,
1.454582, -1.689721, 3.266821, 0, 0, 0, 1, 1,
1.481701, -1.244987, 2.588615, 0, 0, 0, 1, 1,
1.48579, 0.02095638, 0.8290706, 0, 0, 0, 1, 1,
1.494921, 1.392781, 2.048238, 0, 0, 0, 1, 1,
1.516442, -0.6397319, 1.063947, 0, 0, 0, 1, 1,
1.518978, -0.4940498, 2.108823, 1, 1, 1, 1, 1,
1.519377, 0.115484, 1.217303, 1, 1, 1, 1, 1,
1.528101, -0.3067092, 1.715442, 1, 1, 1, 1, 1,
1.535597, -1.086972, 0.9629087, 1, 1, 1, 1, 1,
1.5425, -1.887743, 0.8057131, 1, 1, 1, 1, 1,
1.544311, 0.1566832, 1.955057, 1, 1, 1, 1, 1,
1.550083, -1.898731, 2.837819, 1, 1, 1, 1, 1,
1.590089, 1.577577, -0.6778651, 1, 1, 1, 1, 1,
1.591333, -0.1772483, 0.2053767, 1, 1, 1, 1, 1,
1.59746, -0.7276433, 2.547068, 1, 1, 1, 1, 1,
1.630598, -0.1233489, 3.066713, 1, 1, 1, 1, 1,
1.646226, 1.179133, 0.5078687, 1, 1, 1, 1, 1,
1.662066, 1.54964, 0.6329559, 1, 1, 1, 1, 1,
1.662923, -0.8623375, 1.027003, 1, 1, 1, 1, 1,
1.663698, 0.03591035, 1.978133, 1, 1, 1, 1, 1,
1.677253, -0.8659629, 3.546973, 0, 0, 1, 1, 1,
1.681838, -0.7549474, 0.9609647, 1, 0, 0, 1, 1,
1.683767, 1.880414, 0.2234622, 1, 0, 0, 1, 1,
1.689427, -0.9314691, 1.789174, 1, 0, 0, 1, 1,
1.702212, 0.6859157, 1.58065, 1, 0, 0, 1, 1,
1.713032, -0.909361, 2.748848, 1, 0, 0, 1, 1,
1.723723, 0.3384778, 1.709828, 0, 0, 0, 1, 1,
1.729144, -0.3070498, 0.8887366, 0, 0, 0, 1, 1,
1.741943, -0.4459248, 2.238583, 0, 0, 0, 1, 1,
1.742503, 0.5551868, 1.184867, 0, 0, 0, 1, 1,
1.770378, -0.5965313, 0.6547055, 0, 0, 0, 1, 1,
1.772267, 0.2264391, 3.157594, 0, 0, 0, 1, 1,
1.772801, -2.083184, 0.9119502, 0, 0, 0, 1, 1,
1.773615, 0.07399545, -0.5051923, 1, 1, 1, 1, 1,
1.798781, -2.671278, 1.713645, 1, 1, 1, 1, 1,
1.804256, 0.7117581, -0.5686073, 1, 1, 1, 1, 1,
1.817144, 1.235819, -0.2365527, 1, 1, 1, 1, 1,
1.823246, -0.06957635, 2.928633, 1, 1, 1, 1, 1,
1.837506, 1.103959, 1.322181, 1, 1, 1, 1, 1,
1.846282, 0.8999587, 0.02943077, 1, 1, 1, 1, 1,
1.853474, 0.566442, 0.942232, 1, 1, 1, 1, 1,
1.900774, -1.388513, 3.640113, 1, 1, 1, 1, 1,
1.91211, -1.258309, 1.180538, 1, 1, 1, 1, 1,
1.925407, -1.166835, 1.86977, 1, 1, 1, 1, 1,
1.939895, 0.6944549, -0.4428175, 1, 1, 1, 1, 1,
1.974231, 2.791865, 1.676009, 1, 1, 1, 1, 1,
2.006793, 0.06415357, 1.671416, 1, 1, 1, 1, 1,
2.02458, 0.3727632, 0.9195904, 1, 1, 1, 1, 1,
2.030282, 0.9522067, 1.742609, 0, 0, 1, 1, 1,
2.033851, -0.08806056, 0.9225267, 1, 0, 0, 1, 1,
2.046613, -0.8430713, 4.111529, 1, 0, 0, 1, 1,
2.049169, -0.9106284, 0.3399715, 1, 0, 0, 1, 1,
2.074383, 0.001956732, 0.5299178, 1, 0, 0, 1, 1,
2.099036, 0.4445334, 1.308729, 1, 0, 0, 1, 1,
2.125538, -0.09642257, 1.727082, 0, 0, 0, 1, 1,
2.174942, -0.6459714, 0.9779305, 0, 0, 0, 1, 1,
2.201336, -1.05098, 0.9235578, 0, 0, 0, 1, 1,
2.266059, 0.1732934, 2.054107, 0, 0, 0, 1, 1,
2.309976, -0.2922252, 2.073518, 0, 0, 0, 1, 1,
2.450305, -1.581856, 1.863702, 0, 0, 0, 1, 1,
2.464645, -0.437571, 2.990428, 0, 0, 0, 1, 1,
2.576454, -0.2780884, 3.534686, 1, 1, 1, 1, 1,
2.577574, 1.330279, 2.318677, 1, 1, 1, 1, 1,
2.635567, -1.356138, 0.625118, 1, 1, 1, 1, 1,
2.639128, -1.416723, 1.288401, 1, 1, 1, 1, 1,
2.6788, -1.513207, 1.381408, 1, 1, 1, 1, 1,
2.970394, 2.049729, 2.205915, 1, 1, 1, 1, 1,
3.356857, -0.9328657, 1.670924, 1, 1, 1, 1, 1
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
var radius = 9.793342;
var distance = 34.3987;
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
mvMatrix.translate( 0.01494503, 0.2739309, 0.05904818 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.3987);
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
