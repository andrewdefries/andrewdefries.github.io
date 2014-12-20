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
-3.034929, 0.6201894, -2.05561, 1, 0, 0, 1,
-3.030678, 0.397704, -1.251624, 1, 0.007843138, 0, 1,
-2.742921, -0.8489927, -1.909237, 1, 0.01176471, 0, 1,
-2.714712, -0.9439144, -3.02158, 1, 0.01960784, 0, 1,
-2.643984, -0.4128982, -1.509764, 1, 0.02352941, 0, 1,
-2.638396, -1.675849, -2.930806, 1, 0.03137255, 0, 1,
-2.542452, 1.106473, -1.409789, 1, 0.03529412, 0, 1,
-2.492361, -0.4721375, -0.5034557, 1, 0.04313726, 0, 1,
-2.466897, 0.555338, -1.263729, 1, 0.04705882, 0, 1,
-2.447509, -0.6907727, -1.720813, 1, 0.05490196, 0, 1,
-2.428627, -0.2468941, -1.127429, 1, 0.05882353, 0, 1,
-2.41261, -0.08310025, -1.734055, 1, 0.06666667, 0, 1,
-2.378791, 0.8540723, -2.295052, 1, 0.07058824, 0, 1,
-2.303309, 0.8758636, 0.7805823, 1, 0.07843138, 0, 1,
-2.26623, -2.231582, -3.951773, 1, 0.08235294, 0, 1,
-2.263665, 0.3628002, -1.836093, 1, 0.09019608, 0, 1,
-2.24049, 0.8123223, -0.1479955, 1, 0.09411765, 0, 1,
-2.205779, -0.6439912, -2.740631, 1, 0.1019608, 0, 1,
-2.116757, 1.087332, -0.9524071, 1, 0.1098039, 0, 1,
-2.084726, -0.9973571, -1.455616, 1, 0.1137255, 0, 1,
-2.077641, 0.857488, -1.849904, 1, 0.1215686, 0, 1,
-2.024162, 0.8903598, -0.6526198, 1, 0.1254902, 0, 1,
-2.019423, -2.444868, -3.033332, 1, 0.1333333, 0, 1,
-2.016864, -0.5758902, -1.944747, 1, 0.1372549, 0, 1,
-1.980911, -0.2304169, -3.381961, 1, 0.145098, 0, 1,
-1.971016, -0.6960402, -2.430739, 1, 0.1490196, 0, 1,
-1.946628, -0.2821458, -1.947624, 1, 0.1568628, 0, 1,
-1.933485, 1.806562, -3.808871, 1, 0.1607843, 0, 1,
-1.917822, -0.2487211, -1.678311, 1, 0.1686275, 0, 1,
-1.917205, -0.1740591, -3.257481, 1, 0.172549, 0, 1,
-1.887115, 0.9243482, -0.2095542, 1, 0.1803922, 0, 1,
-1.860441, -0.4466073, -1.642583, 1, 0.1843137, 0, 1,
-1.837044, 0.6928068, -1.068405, 1, 0.1921569, 0, 1,
-1.830037, 1.254251, -2.61656, 1, 0.1960784, 0, 1,
-1.807426, -0.03864627, -2.814798, 1, 0.2039216, 0, 1,
-1.794213, -0.4719206, -0.9661344, 1, 0.2117647, 0, 1,
-1.787718, 1.312838, -0.1967444, 1, 0.2156863, 0, 1,
-1.750531, -1.06111, -2.592558, 1, 0.2235294, 0, 1,
-1.739198, -0.4437391, -1.774731, 1, 0.227451, 0, 1,
-1.73329, 1.444481, -0.2807098, 1, 0.2352941, 0, 1,
-1.731109, 0.7684097, -1.640012, 1, 0.2392157, 0, 1,
-1.71829, -0.9764997, -2.692001, 1, 0.2470588, 0, 1,
-1.707461, -2.155182, -2.354058, 1, 0.2509804, 0, 1,
-1.704456, -0.2775673, -0.4575185, 1, 0.2588235, 0, 1,
-1.694757, -0.3564722, -0.5791658, 1, 0.2627451, 0, 1,
-1.667771, -0.6480768, -1.88911, 1, 0.2705882, 0, 1,
-1.652091, 1.574575, -2.943567, 1, 0.2745098, 0, 1,
-1.643677, -1.697664, -2.412818, 1, 0.282353, 0, 1,
-1.642339, 0.4263936, -0.8261251, 1, 0.2862745, 0, 1,
-1.634618, 1.625668, -1.500428, 1, 0.2941177, 0, 1,
-1.63456, 0.6643941, -0.2825565, 1, 0.3019608, 0, 1,
-1.631042, 0.3240028, -1.413197, 1, 0.3058824, 0, 1,
-1.62196, 0.2338996, -2.210217, 1, 0.3137255, 0, 1,
-1.619134, 0.2506537, -1.470855, 1, 0.3176471, 0, 1,
-1.617446, -0.7330218, -1.032762, 1, 0.3254902, 0, 1,
-1.605296, 0.3394078, -1.059489, 1, 0.3294118, 0, 1,
-1.599673, -0.4984913, -3.344677, 1, 0.3372549, 0, 1,
-1.594549, 0.3753717, -2.832801, 1, 0.3411765, 0, 1,
-1.586334, 1.315991, -0.6015387, 1, 0.3490196, 0, 1,
-1.565762, -0.6070668, -0.748628, 1, 0.3529412, 0, 1,
-1.527684, 0.961698, -0.6000041, 1, 0.3607843, 0, 1,
-1.485099, 0.5034706, -1.887028, 1, 0.3647059, 0, 1,
-1.468289, 0.2266197, -1.725191, 1, 0.372549, 0, 1,
-1.461628, 0.8290417, 0.163266, 1, 0.3764706, 0, 1,
-1.456341, -0.08405175, -2.084754, 1, 0.3843137, 0, 1,
-1.441312, -0.443585, -1.008553, 1, 0.3882353, 0, 1,
-1.440461, 0.6441338, -2.915814, 1, 0.3960784, 0, 1,
-1.431019, -0.789795, -2.952399, 1, 0.4039216, 0, 1,
-1.413041, -0.8288104, -1.106806, 1, 0.4078431, 0, 1,
-1.403802, 0.9922163, -0.898016, 1, 0.4156863, 0, 1,
-1.393092, 1.463011, -1.71325, 1, 0.4196078, 0, 1,
-1.391894, 0.8707194, -1.72563, 1, 0.427451, 0, 1,
-1.390286, 0.4249354, 0.5468551, 1, 0.4313726, 0, 1,
-1.386573, -0.04570936, -2.189988, 1, 0.4392157, 0, 1,
-1.374038, 0.7517617, -2.279919, 1, 0.4431373, 0, 1,
-1.373965, 0.6875083, -0.8009567, 1, 0.4509804, 0, 1,
-1.367118, 0.6778182, -1.410497, 1, 0.454902, 0, 1,
-1.347654, 0.5797719, -0.3857603, 1, 0.4627451, 0, 1,
-1.345167, -0.6682817, -2.262444, 1, 0.4666667, 0, 1,
-1.344698, -1.065512, -2.224178, 1, 0.4745098, 0, 1,
-1.344691, 0.5552748, -1.314473, 1, 0.4784314, 0, 1,
-1.336926, 1.455962, 1.713131, 1, 0.4862745, 0, 1,
-1.323021, 1.153697, -1.354632, 1, 0.4901961, 0, 1,
-1.317212, -0.5462004, -0.3984714, 1, 0.4980392, 0, 1,
-1.311117, -0.04511231, -2.254777, 1, 0.5058824, 0, 1,
-1.299986, 1.014624, -0.3083095, 1, 0.509804, 0, 1,
-1.289196, 0.4932763, -0.4447292, 1, 0.5176471, 0, 1,
-1.28256, 0.7791343, -2.324261, 1, 0.5215687, 0, 1,
-1.265559, -0.2365639, -3.040941, 1, 0.5294118, 0, 1,
-1.263094, 0.5197764, -2.2516, 1, 0.5333334, 0, 1,
-1.262041, 0.2419231, -2.408105, 1, 0.5411765, 0, 1,
-1.257527, -1.413128, -3.303333, 1, 0.5450981, 0, 1,
-1.253829, -0.8033849, -0.4235931, 1, 0.5529412, 0, 1,
-1.253644, -0.2840423, -2.846012, 1, 0.5568628, 0, 1,
-1.249385, -2.092775, -1.392792, 1, 0.5647059, 0, 1,
-1.244062, -0.182228, -2.44128, 1, 0.5686275, 0, 1,
-1.24158, -0.07304588, -2.407407, 1, 0.5764706, 0, 1,
-1.231559, -1.143902, -2.394687, 1, 0.5803922, 0, 1,
-1.227579, 1.228832, -2.06967, 1, 0.5882353, 0, 1,
-1.225677, 2.00192, -1.501169, 1, 0.5921569, 0, 1,
-1.223577, 0.361818, -2.277888, 1, 0.6, 0, 1,
-1.22255, 1.428345, -1.069086, 1, 0.6078432, 0, 1,
-1.214888, -0.2361588, -3.154036, 1, 0.6117647, 0, 1,
-1.214812, 1.383306, 0.2015671, 1, 0.6196079, 0, 1,
-1.204174, -0.8139724, -1.972836, 1, 0.6235294, 0, 1,
-1.19963, 0.5193321, -1.149411, 1, 0.6313726, 0, 1,
-1.199393, 0.2080168, -1.708644, 1, 0.6352941, 0, 1,
-1.199071, -0.5035684, -1.516062, 1, 0.6431373, 0, 1,
-1.190102, -0.2747616, -0.224213, 1, 0.6470588, 0, 1,
-1.185067, 0.07397918, -3.144931, 1, 0.654902, 0, 1,
-1.183806, -0.01466522, -0.9219683, 1, 0.6588235, 0, 1,
-1.167634, 0.5050284, -0.6328662, 1, 0.6666667, 0, 1,
-1.16394, -0.4019821, -1.814939, 1, 0.6705883, 0, 1,
-1.158225, 0.421535, -0.3230455, 1, 0.6784314, 0, 1,
-1.153578, -0.6203341, -1.30093, 1, 0.682353, 0, 1,
-1.13557, 1.517807, -0.4610275, 1, 0.6901961, 0, 1,
-1.131867, -0.7311177, -2.35038, 1, 0.6941177, 0, 1,
-1.131732, 2.343093, -0.7391348, 1, 0.7019608, 0, 1,
-1.124393, 0.1428223, -0.6614496, 1, 0.7098039, 0, 1,
-1.119022, 0.811857, -2.197001, 1, 0.7137255, 0, 1,
-1.114833, -0.04956559, 0.7116914, 1, 0.7215686, 0, 1,
-1.104455, 0.243805, -1.163879, 1, 0.7254902, 0, 1,
-1.102542, 0.8181399, -2.127619, 1, 0.7333333, 0, 1,
-1.09658, -1.249507, -2.266935, 1, 0.7372549, 0, 1,
-1.087589, -0.7835628, -2.506047, 1, 0.7450981, 0, 1,
-1.080343, 0.5622694, -3.52532, 1, 0.7490196, 0, 1,
-1.078625, 0.6662346, -1.057096, 1, 0.7568628, 0, 1,
-1.070636, 1.497552, -0.5289996, 1, 0.7607843, 0, 1,
-1.067176, -0.1358766, -2.307606, 1, 0.7686275, 0, 1,
-1.067004, -1.517353, -1.386692, 1, 0.772549, 0, 1,
-1.06384, -0.3872122, -2.432775, 1, 0.7803922, 0, 1,
-1.057715, 0.1059717, -2.379362, 1, 0.7843137, 0, 1,
-1.056293, -1.470191, -1.732491, 1, 0.7921569, 0, 1,
-1.040134, 1.018894, -0.8355042, 1, 0.7960784, 0, 1,
-1.03655, 1.727616, 0.4301679, 1, 0.8039216, 0, 1,
-1.032771, 0.9515247, -1.220404, 1, 0.8117647, 0, 1,
-1.031723, 0.7728743, -0.1096488, 1, 0.8156863, 0, 1,
-1.030608, 0.4794469, -0.6327487, 1, 0.8235294, 0, 1,
-1.023559, -0.8509186, -3.260942, 1, 0.827451, 0, 1,
-1.017084, -0.1861131, -0.6054049, 1, 0.8352941, 0, 1,
-1.011552, -0.9354165, -2.588589, 1, 0.8392157, 0, 1,
-1.008405, 1.03967, 0.06811252, 1, 0.8470588, 0, 1,
-1.001806, 0.6852077, -0.1405971, 1, 0.8509804, 0, 1,
-0.9992601, -0.7821189, -2.628066, 1, 0.8588235, 0, 1,
-0.9985844, 0.8489391, -0.6584942, 1, 0.8627451, 0, 1,
-0.9907243, -0.7480524, -3.033314, 1, 0.8705882, 0, 1,
-0.9901187, 0.1732206, -1.066552, 1, 0.8745098, 0, 1,
-0.989378, 0.6406329, -0.8706804, 1, 0.8823529, 0, 1,
-0.9739962, -1.832758, -2.841439, 1, 0.8862745, 0, 1,
-0.9710322, -1.27854, -3.598471, 1, 0.8941177, 0, 1,
-0.9540588, 0.7245781, -1.482782, 1, 0.8980392, 0, 1,
-0.9434905, -0.9285048, -3.028749, 1, 0.9058824, 0, 1,
-0.9422323, 0.1322367, -1.80021, 1, 0.9137255, 0, 1,
-0.9403136, -1.674896, -3.191639, 1, 0.9176471, 0, 1,
-0.939639, -0.6927235, 0.4606679, 1, 0.9254902, 0, 1,
-0.9394519, 0.7118231, -0.3992766, 1, 0.9294118, 0, 1,
-0.9380898, 0.6483339, -0.4745417, 1, 0.9372549, 0, 1,
-0.9367276, 0.7741112, -0.165004, 1, 0.9411765, 0, 1,
-0.9220468, -0.1543993, -2.479491, 1, 0.9490196, 0, 1,
-0.9219307, -1.187399, -4.012019, 1, 0.9529412, 0, 1,
-0.9172494, 0.8805274, -0.8746526, 1, 0.9607843, 0, 1,
-0.9144748, 1.826779, 0.5764307, 1, 0.9647059, 0, 1,
-0.9110055, -0.7488299, -2.404488, 1, 0.972549, 0, 1,
-0.9103764, 0.1802913, -0.2179271, 1, 0.9764706, 0, 1,
-0.9059101, 0.3564653, 0.2767752, 1, 0.9843137, 0, 1,
-0.9001557, -0.1068175, -2.14422, 1, 0.9882353, 0, 1,
-0.8942919, -0.1891487, -2.403247, 1, 0.9960784, 0, 1,
-0.8906399, -0.1555968, -0.4767218, 0.9960784, 1, 0, 1,
-0.8823317, 0.8201208, -1.816743, 0.9921569, 1, 0, 1,
-0.881032, 1.790852, -1.441005, 0.9843137, 1, 0, 1,
-0.8802634, -0.2170225, 0.6408899, 0.9803922, 1, 0, 1,
-0.8742383, 0.3446561, 0.4094515, 0.972549, 1, 0, 1,
-0.8707691, 0.1519639, -2.230908, 0.9686275, 1, 0, 1,
-0.8704246, 0.4581251, -2.089005, 0.9607843, 1, 0, 1,
-0.8692047, 0.3413525, -1.799797, 0.9568627, 1, 0, 1,
-0.8669285, -0.461251, -0.9970959, 0.9490196, 1, 0, 1,
-0.8618751, 0.7083484, -2.459399, 0.945098, 1, 0, 1,
-0.8614427, 0.1655198, -0.06066227, 0.9372549, 1, 0, 1,
-0.856591, 0.01380038, -0.0457308, 0.9333333, 1, 0, 1,
-0.8523027, -0.8385409, -1.877696, 0.9254902, 1, 0, 1,
-0.8511603, -0.389914, -0.9396033, 0.9215686, 1, 0, 1,
-0.8504602, 0.9456993, -1.144843, 0.9137255, 1, 0, 1,
-0.8489427, 0.09892301, -1.43024, 0.9098039, 1, 0, 1,
-0.8453622, 0.9892707, -1.56551, 0.9019608, 1, 0, 1,
-0.84369, -1.028359, -2.947462, 0.8941177, 1, 0, 1,
-0.8435647, -0.5717766, -2.901448, 0.8901961, 1, 0, 1,
-0.841884, -1.101673, -3.587824, 0.8823529, 1, 0, 1,
-0.8407109, -0.7997818, -0.2199713, 0.8784314, 1, 0, 1,
-0.8395667, -0.3632951, -1.344529, 0.8705882, 1, 0, 1,
-0.8352796, -1.28207, -2.69196, 0.8666667, 1, 0, 1,
-0.832223, -0.6105483, -2.079847, 0.8588235, 1, 0, 1,
-0.823697, 0.08637155, -1.878929, 0.854902, 1, 0, 1,
-0.8236055, -0.2807543, -1.711812, 0.8470588, 1, 0, 1,
-0.8169011, 0.8028032, -0.4287896, 0.8431373, 1, 0, 1,
-0.8148642, -2.087752, -3.153356, 0.8352941, 1, 0, 1,
-0.810694, 0.2501838, -0.6380749, 0.8313726, 1, 0, 1,
-0.8086315, 0.7286927, 0.376294, 0.8235294, 1, 0, 1,
-0.8073135, -0.4638115, -1.250649, 0.8196079, 1, 0, 1,
-0.8048596, 0.1812294, -0.8714418, 0.8117647, 1, 0, 1,
-0.798048, 0.5005322, -2.049489, 0.8078431, 1, 0, 1,
-0.7875171, -0.5850686, -2.285401, 0.8, 1, 0, 1,
-0.7839662, 1.757976, -0.01703299, 0.7921569, 1, 0, 1,
-0.7821178, -0.7853655, -3.653539, 0.7882353, 1, 0, 1,
-0.7807586, 0.06840321, -1.414979, 0.7803922, 1, 0, 1,
-0.7776124, -1.437728, -2.024875, 0.7764706, 1, 0, 1,
-0.76994, 0.4226588, -2.431777, 0.7686275, 1, 0, 1,
-0.7695607, -0.6048595, -2.984157, 0.7647059, 1, 0, 1,
-0.7680378, 1.093195, 0.593985, 0.7568628, 1, 0, 1,
-0.7643775, -0.4110931, -0.8500347, 0.7529412, 1, 0, 1,
-0.7591859, 1.634022, -1.90545, 0.7450981, 1, 0, 1,
-0.7589637, 1.410391, 0.1394983, 0.7411765, 1, 0, 1,
-0.7546687, 0.4649669, -0.7516556, 0.7333333, 1, 0, 1,
-0.7528765, -0.2148356, -2.50987, 0.7294118, 1, 0, 1,
-0.751682, -1.109073, -1.668667, 0.7215686, 1, 0, 1,
-0.7442436, 1.405418, 0.7071583, 0.7176471, 1, 0, 1,
-0.7407594, 0.1114248, -1.753194, 0.7098039, 1, 0, 1,
-0.7405643, -0.8901215, -2.472371, 0.7058824, 1, 0, 1,
-0.7370694, 0.268524, -0.9744808, 0.6980392, 1, 0, 1,
-0.7366913, 0.005889402, -1.788031, 0.6901961, 1, 0, 1,
-0.7319263, 2.001017, 0.4440523, 0.6862745, 1, 0, 1,
-0.7315518, 0.7607566, 0.08512414, 0.6784314, 1, 0, 1,
-0.727854, 0.2494241, -2.981973, 0.6745098, 1, 0, 1,
-0.7268134, -0.908729, -1.31986, 0.6666667, 1, 0, 1,
-0.7194653, -0.2160186, -1.2007, 0.6627451, 1, 0, 1,
-0.7151883, -0.1710664, -2.113632, 0.654902, 1, 0, 1,
-0.7132726, 2.238281, -0.1811176, 0.6509804, 1, 0, 1,
-0.7127439, -1.020679, -1.733864, 0.6431373, 1, 0, 1,
-0.7076704, 1.05702, -0.9208966, 0.6392157, 1, 0, 1,
-0.7063661, -0.7329726, -1.527065, 0.6313726, 1, 0, 1,
-0.7000861, 0.01949573, -1.121291, 0.627451, 1, 0, 1,
-0.6923223, 1.591454, 1.122528, 0.6196079, 1, 0, 1,
-0.6899945, -0.6339153, -2.318452, 0.6156863, 1, 0, 1,
-0.687638, -0.2372234, -0.7408808, 0.6078432, 1, 0, 1,
-0.6869663, -1.056607, -4.09542, 0.6039216, 1, 0, 1,
-0.6840566, -1.276699, -2.990429, 0.5960785, 1, 0, 1,
-0.6828353, -0.3325267, -1.994725, 0.5882353, 1, 0, 1,
-0.6808073, -1.191714, -1.747182, 0.5843138, 1, 0, 1,
-0.6775261, 0.01273588, -1.692417, 0.5764706, 1, 0, 1,
-0.6732569, -0.9383953, -1.875061, 0.572549, 1, 0, 1,
-0.6701051, -0.06777046, -0.4985174, 0.5647059, 1, 0, 1,
-0.6652356, -0.2006362, -1.640668, 0.5607843, 1, 0, 1,
-0.6638975, 0.6109852, -1.018921, 0.5529412, 1, 0, 1,
-0.6606446, 0.3970242, 0.6234481, 0.5490196, 1, 0, 1,
-0.6572043, 0.0354294, -3.092236, 0.5411765, 1, 0, 1,
-0.6535128, 0.03129489, -2.384287, 0.5372549, 1, 0, 1,
-0.6515075, 1.968743, 1.497508, 0.5294118, 1, 0, 1,
-0.6498919, -0.9714317, -1.751076, 0.5254902, 1, 0, 1,
-0.6459762, 0.2929611, 1.162078, 0.5176471, 1, 0, 1,
-0.6453545, -1.9593, -4.274808, 0.5137255, 1, 0, 1,
-0.6447479, -0.341679, -2.347044, 0.5058824, 1, 0, 1,
-0.6444976, -1.199935, -0.4849077, 0.5019608, 1, 0, 1,
-0.6368457, -0.06118152, -1.573265, 0.4941176, 1, 0, 1,
-0.6333899, 0.7039533, -0.2982628, 0.4862745, 1, 0, 1,
-0.6282955, 1.866278, -2.438279, 0.4823529, 1, 0, 1,
-0.6232618, 0.5056732, -0.8504661, 0.4745098, 1, 0, 1,
-0.6232143, -0.5976055, -2.784709, 0.4705882, 1, 0, 1,
-0.6217297, -2.320175, -2.418366, 0.4627451, 1, 0, 1,
-0.6216738, -0.07663565, -1.527577, 0.4588235, 1, 0, 1,
-0.6213732, 0.4927921, -0.01626876, 0.4509804, 1, 0, 1,
-0.6186998, -0.4093235, -3.990492, 0.4470588, 1, 0, 1,
-0.6130905, 0.004044397, -1.128924, 0.4392157, 1, 0, 1,
-0.6084099, -1.217024, -2.798641, 0.4352941, 1, 0, 1,
-0.6062169, 0.5266765, -2.012073, 0.427451, 1, 0, 1,
-0.6030249, 1.466543, -1.107987, 0.4235294, 1, 0, 1,
-0.5998756, 2.430558, 0.09751878, 0.4156863, 1, 0, 1,
-0.5981644, -0.2996154, -0.6923339, 0.4117647, 1, 0, 1,
-0.5946749, -0.0006899952, -0.8158895, 0.4039216, 1, 0, 1,
-0.5939218, -1.324039, -2.654595, 0.3960784, 1, 0, 1,
-0.5931411, -1.403781, -2.083205, 0.3921569, 1, 0, 1,
-0.5915734, -0.2142302, -1.758889, 0.3843137, 1, 0, 1,
-0.5887844, -0.2866706, -2.292949, 0.3803922, 1, 0, 1,
-0.5809544, -1.199227, -2.179164, 0.372549, 1, 0, 1,
-0.5776787, -1.456403, -4.085114, 0.3686275, 1, 0, 1,
-0.5767633, -0.7774051, -2.54207, 0.3607843, 1, 0, 1,
-0.5746001, -1.117414, -3.871728, 0.3568628, 1, 0, 1,
-0.5745878, -0.9286059, -3.609338, 0.3490196, 1, 0, 1,
-0.5718451, -0.06768873, -0.6366823, 0.345098, 1, 0, 1,
-0.5711225, 0.6934746, -0.3532241, 0.3372549, 1, 0, 1,
-0.5707293, -1.064221, -3.27314, 0.3333333, 1, 0, 1,
-0.5689917, 0.8731145, -0.5358003, 0.3254902, 1, 0, 1,
-0.56299, -0.8333506, -2.349996, 0.3215686, 1, 0, 1,
-0.5607404, 0.3772264, -1.60885, 0.3137255, 1, 0, 1,
-0.5584843, 1.529369, -1.615368, 0.3098039, 1, 0, 1,
-0.5535637, 1.807023, -0.316076, 0.3019608, 1, 0, 1,
-0.5517442, 0.3512792, -0.420492, 0.2941177, 1, 0, 1,
-0.5460969, 0.1356528, -0.158761, 0.2901961, 1, 0, 1,
-0.5428982, -0.6552252, -2.242981, 0.282353, 1, 0, 1,
-0.5411449, -1.186148, -2.534045, 0.2784314, 1, 0, 1,
-0.5382766, 1.536034, -0.4171331, 0.2705882, 1, 0, 1,
-0.5284681, 0.6837732, -0.06455838, 0.2666667, 1, 0, 1,
-0.5277278, -0.3286084, -2.792874, 0.2588235, 1, 0, 1,
-0.5256792, -0.06888169, -3.093106, 0.254902, 1, 0, 1,
-0.5225132, -0.3316382, -1.632924, 0.2470588, 1, 0, 1,
-0.51943, 0.6901373, -1.308969, 0.2431373, 1, 0, 1,
-0.5175019, -0.9499974, -3.173502, 0.2352941, 1, 0, 1,
-0.5169114, -0.4994013, -1.334156, 0.2313726, 1, 0, 1,
-0.5153058, -0.3667144, -3.094516, 0.2235294, 1, 0, 1,
-0.5133661, 0.1169875, -3.197666, 0.2196078, 1, 0, 1,
-0.5124854, 1.190795, -0.420053, 0.2117647, 1, 0, 1,
-0.5109737, -0.1970199, -3.012833, 0.2078431, 1, 0, 1,
-0.5079193, -0.9994891, -3.179657, 0.2, 1, 0, 1,
-0.5048846, 1.541453, 0.7946156, 0.1921569, 1, 0, 1,
-0.5009759, -1.266614, -4.355294, 0.1882353, 1, 0, 1,
-0.4944711, 0.5227628, -0.1651424, 0.1803922, 1, 0, 1,
-0.4941307, 1.041489, -0.9601819, 0.1764706, 1, 0, 1,
-0.489024, -0.4378123, -1.676082, 0.1686275, 1, 0, 1,
-0.4882848, -0.835546, -1.728455, 0.1647059, 1, 0, 1,
-0.485745, 1.199139, 0.9774185, 0.1568628, 1, 0, 1,
-0.4843691, 1.324868, 0.8610253, 0.1529412, 1, 0, 1,
-0.476092, -1.249795, -2.253341, 0.145098, 1, 0, 1,
-0.4760278, 0.005387395, -0.8900987, 0.1411765, 1, 0, 1,
-0.4731799, -2.081915, -2.40116, 0.1333333, 1, 0, 1,
-0.4696894, -0.9743863, -2.058098, 0.1294118, 1, 0, 1,
-0.4645095, 1.145391, -1.759166, 0.1215686, 1, 0, 1,
-0.464041, -0.07978056, -1.181065, 0.1176471, 1, 0, 1,
-0.4635052, -1.336035, -2.531234, 0.1098039, 1, 0, 1,
-0.462694, 0.5381023, -2.85535, 0.1058824, 1, 0, 1,
-0.4618275, -1.073871, -1.306538, 0.09803922, 1, 0, 1,
-0.4595535, -1.928241, -2.140146, 0.09019608, 1, 0, 1,
-0.4587274, 1.17245, -0.7141079, 0.08627451, 1, 0, 1,
-0.4580653, -0.6308498, -1.895503, 0.07843138, 1, 0, 1,
-0.4531633, -0.3284311, -0.7981204, 0.07450981, 1, 0, 1,
-0.4491995, 0.4532196, -0.8556317, 0.06666667, 1, 0, 1,
-0.4445611, -0.482857, -2.377064, 0.0627451, 1, 0, 1,
-0.4403786, 0.7514822, 0.573347, 0.05490196, 1, 0, 1,
-0.4308349, -0.7749732, -1.729931, 0.05098039, 1, 0, 1,
-0.4262334, 1.713276, 0.4494172, 0.04313726, 1, 0, 1,
-0.4256315, 0.605772, -1.764037, 0.03921569, 1, 0, 1,
-0.4243124, 0.1409022, 0.2095138, 0.03137255, 1, 0, 1,
-0.4086787, 0.5765514, 0.531799, 0.02745098, 1, 0, 1,
-0.405025, 0.1055007, -0.8350366, 0.01960784, 1, 0, 1,
-0.4036385, 1.40945, -0.2611921, 0.01568628, 1, 0, 1,
-0.3910741, -0.3609626, -2.998104, 0.007843138, 1, 0, 1,
-0.3877614, -0.2349315, -1.74851, 0.003921569, 1, 0, 1,
-0.3809271, -0.2902846, -1.707227, 0, 1, 0.003921569, 1,
-0.3803528, 0.7636879, -0.7316536, 0, 1, 0.01176471, 1,
-0.3793049, -2.153056, -4.746667, 0, 1, 0.01568628, 1,
-0.3790616, 0.4704633, 0.6606043, 0, 1, 0.02352941, 1,
-0.3771734, -0.4483036, -1.971729, 0, 1, 0.02745098, 1,
-0.3761013, -1.920484, -1.88094, 0, 1, 0.03529412, 1,
-0.3737913, 0.3919348, -0.9437153, 0, 1, 0.03921569, 1,
-0.3735884, -0.6539358, -1.602002, 0, 1, 0.04705882, 1,
-0.372141, 0.5063394, 0.4613604, 0, 1, 0.05098039, 1,
-0.367715, 1.357641, -1.088817, 0, 1, 0.05882353, 1,
-0.3660632, 0.4762791, 0.3969015, 0, 1, 0.0627451, 1,
-0.3626358, 1.29501, 1.390685, 0, 1, 0.07058824, 1,
-0.3615028, 0.07874911, -1.615341, 0, 1, 0.07450981, 1,
-0.3569199, -0.3923954, -2.139598, 0, 1, 0.08235294, 1,
-0.3422682, 1.913899, -0.339121, 0, 1, 0.08627451, 1,
-0.334852, 1.414824, -0.5206734, 0, 1, 0.09411765, 1,
-0.3296104, -0.09170257, -1.044726, 0, 1, 0.1019608, 1,
-0.3289421, 0.7700442, 0.6789609, 0, 1, 0.1058824, 1,
-0.3258438, 0.1144023, -1.531745, 0, 1, 0.1137255, 1,
-0.3231781, 0.641306, -0.8901347, 0, 1, 0.1176471, 1,
-0.3212869, -0.8068682, -2.351934, 0, 1, 0.1254902, 1,
-0.315741, -0.4490116, -2.379279, 0, 1, 0.1294118, 1,
-0.3140075, 1.005845, -1.36627, 0, 1, 0.1372549, 1,
-0.3088074, 0.4664058, -1.662161, 0, 1, 0.1411765, 1,
-0.3056548, 0.01799479, -1.967993, 0, 1, 0.1490196, 1,
-0.3000256, 0.9640238, -0.3645516, 0, 1, 0.1529412, 1,
-0.2991768, 0.5595185, -1.122782, 0, 1, 0.1607843, 1,
-0.2971923, -0.478925, -3.38528, 0, 1, 0.1647059, 1,
-0.2947583, 1.9392, 1.397409, 0, 1, 0.172549, 1,
-0.2941907, -0.1110269, -2.230457, 0, 1, 0.1764706, 1,
-0.2935661, -1.217334, -2.240188, 0, 1, 0.1843137, 1,
-0.291501, -0.08008263, -1.55597, 0, 1, 0.1882353, 1,
-0.2889977, -2.233867, -3.849192, 0, 1, 0.1960784, 1,
-0.2876778, -0.07175965, -2.943143, 0, 1, 0.2039216, 1,
-0.2853315, -1.320139, -3.104336, 0, 1, 0.2078431, 1,
-0.2809585, -1.033176, -2.245179, 0, 1, 0.2156863, 1,
-0.2806682, -0.3087184, -3.416072, 0, 1, 0.2196078, 1,
-0.2794611, -0.835425, -3.435252, 0, 1, 0.227451, 1,
-0.2768869, -0.6330501, -3.88035, 0, 1, 0.2313726, 1,
-0.2732976, 2.122154, 0.5006461, 0, 1, 0.2392157, 1,
-0.270691, 1.523282, 0.3056621, 0, 1, 0.2431373, 1,
-0.2679585, -1.665431, -5.169689, 0, 1, 0.2509804, 1,
-0.2664846, 0.7717414, -1.749925, 0, 1, 0.254902, 1,
-0.2660488, -0.3908149, -3.290076, 0, 1, 0.2627451, 1,
-0.2656498, 0.544715, 0.7169082, 0, 1, 0.2666667, 1,
-0.2617139, -1.052062, -2.435303, 0, 1, 0.2745098, 1,
-0.2594244, -2.272064, -1.96581, 0, 1, 0.2784314, 1,
-0.2578259, -0.5438324, -3.120209, 0, 1, 0.2862745, 1,
-0.2566745, -0.4909465, -4.152219, 0, 1, 0.2901961, 1,
-0.2548354, 0.1065318, 0.2932272, 0, 1, 0.2980392, 1,
-0.2528264, 0.01531116, -0.5322691, 0, 1, 0.3058824, 1,
-0.2517608, 0.2749969, -0.9598861, 0, 1, 0.3098039, 1,
-0.2501042, -0.1712001, -1.082345, 0, 1, 0.3176471, 1,
-0.2496962, -0.7290208, -2.004408, 0, 1, 0.3215686, 1,
-0.2495938, 0.8658319, -1.160065, 0, 1, 0.3294118, 1,
-0.2420083, -1.355787, -2.807233, 0, 1, 0.3333333, 1,
-0.2346011, -2.908088, -1.567142, 0, 1, 0.3411765, 1,
-0.2334172, 0.1779341, -1.568627, 0, 1, 0.345098, 1,
-0.2248392, -0.4027028, -2.873485, 0, 1, 0.3529412, 1,
-0.2222696, 0.1966998, -0.500739, 0, 1, 0.3568628, 1,
-0.2210758, 0.1475366, 0.573059, 0, 1, 0.3647059, 1,
-0.2202256, -0.7558531, -2.191919, 0, 1, 0.3686275, 1,
-0.2184056, 1.474978, 0.7060028, 0, 1, 0.3764706, 1,
-0.2134044, -1.714704, -2.345978, 0, 1, 0.3803922, 1,
-0.2115561, 0.8679034, 0.3012923, 0, 1, 0.3882353, 1,
-0.2082306, -0.382552, -2.628333, 0, 1, 0.3921569, 1,
-0.2037039, 1.14681, -1.525694, 0, 1, 0.4, 1,
-0.2030698, -0.1452005, -2.634799, 0, 1, 0.4078431, 1,
-0.2019911, 0.4795532, -0.164502, 0, 1, 0.4117647, 1,
-0.1992148, -0.1759963, -3.605342, 0, 1, 0.4196078, 1,
-0.1969794, 1.026221, -0.3466909, 0, 1, 0.4235294, 1,
-0.1964676, 0.645299, -1.164989, 0, 1, 0.4313726, 1,
-0.1942303, -0.3992169, -2.793652, 0, 1, 0.4352941, 1,
-0.1904273, 0.4852159, 0.6765214, 0, 1, 0.4431373, 1,
-0.1862922, -0.3376215, -1.993818, 0, 1, 0.4470588, 1,
-0.1855788, -0.6347099, -3.901849, 0, 1, 0.454902, 1,
-0.1840432, 0.9851682, 0.6936163, 0, 1, 0.4588235, 1,
-0.1791757, -0.4781781, -2.340279, 0, 1, 0.4666667, 1,
-0.177233, -1.184308, -1.124925, 0, 1, 0.4705882, 1,
-0.176923, -1.023616, -3.546785, 0, 1, 0.4784314, 1,
-0.1698157, 2.049433, -0.2154711, 0, 1, 0.4823529, 1,
-0.1675797, -0.3570892, -3.965365, 0, 1, 0.4901961, 1,
-0.1633551, -1.357257, -4.701605, 0, 1, 0.4941176, 1,
-0.1625021, 0.7969411, 1.979442, 0, 1, 0.5019608, 1,
-0.1617946, -2.425992, -3.535877, 0, 1, 0.509804, 1,
-0.1575129, 0.1369514, -1.742487, 0, 1, 0.5137255, 1,
-0.1564209, -0.6546177, -1.332156, 0, 1, 0.5215687, 1,
-0.1519328, -1.031098, -3.513691, 0, 1, 0.5254902, 1,
-0.1468745, 0.7351495, 0.1412699, 0, 1, 0.5333334, 1,
-0.1460981, -0.09348539, -2.840565, 0, 1, 0.5372549, 1,
-0.1446069, 0.2893135, -0.2563752, 0, 1, 0.5450981, 1,
-0.1382627, 0.9609273, -2.016105, 0, 1, 0.5490196, 1,
-0.1378169, -0.776421, -2.817004, 0, 1, 0.5568628, 1,
-0.1344269, 0.4762543, 0.4872199, 0, 1, 0.5607843, 1,
-0.1300821, 1.15672, -1.054116, 0, 1, 0.5686275, 1,
-0.1291261, -1.183611, -1.53152, 0, 1, 0.572549, 1,
-0.1286315, 0.7828021, 0.5498706, 0, 1, 0.5803922, 1,
-0.1243466, -2.490563, -1.726007, 0, 1, 0.5843138, 1,
-0.1234875, 0.08972861, -0.643246, 0, 1, 0.5921569, 1,
-0.1233965, -0.7026764, -3.311828, 0, 1, 0.5960785, 1,
-0.1225938, 1.625411, -0.7898791, 0, 1, 0.6039216, 1,
-0.1216339, -2.510616, -2.438879, 0, 1, 0.6117647, 1,
-0.1184515, 0.2853638, -2.885251, 0, 1, 0.6156863, 1,
-0.1153294, 0.02512918, -2.283944, 0, 1, 0.6235294, 1,
-0.1142557, -0.852165, -2.783317, 0, 1, 0.627451, 1,
-0.1128708, 0.04432512, -0.5902982, 0, 1, 0.6352941, 1,
-0.1124395, -1.336839, -5.182909, 0, 1, 0.6392157, 1,
-0.1090438, -0.7396556, -1.24163, 0, 1, 0.6470588, 1,
-0.1082708, 0.4111099, -1.066111, 0, 1, 0.6509804, 1,
-0.1070035, -0.7335966, -2.833023, 0, 1, 0.6588235, 1,
-0.1068878, 0.4104837, 1.064184, 0, 1, 0.6627451, 1,
-0.1062492, -0.9628937, -5.267968, 0, 1, 0.6705883, 1,
-0.1048986, 0.5679615, 0.7924421, 0, 1, 0.6745098, 1,
-0.1036077, -1.081938, -2.049791, 0, 1, 0.682353, 1,
-0.1020057, -1.037521, -2.751882, 0, 1, 0.6862745, 1,
-0.1019268, -0.6949634, -3.529658, 0, 1, 0.6941177, 1,
-0.08956158, 1.233385, 0.8948792, 0, 1, 0.7019608, 1,
-0.08838245, -0.5726733, -3.215112, 0, 1, 0.7058824, 1,
-0.08500852, 0.06021511, -1.92779, 0, 1, 0.7137255, 1,
-0.07821, -2.040482, -2.860468, 0, 1, 0.7176471, 1,
-0.07295612, 0.3272987, 0.3829789, 0, 1, 0.7254902, 1,
-0.06872898, -0.6288844, -3.014153, 0, 1, 0.7294118, 1,
-0.06388245, 1.98295, -2.239337, 0, 1, 0.7372549, 1,
-0.06083669, -0.2391516, -1.227062, 0, 1, 0.7411765, 1,
-0.06040859, 0.9790863, 0.7000373, 0, 1, 0.7490196, 1,
-0.05720011, -0.0127005, 0.2380941, 0, 1, 0.7529412, 1,
-0.05456637, 0.6583297, -0.8192017, 0, 1, 0.7607843, 1,
-0.05120726, -0.5514241, -2.805742, 0, 1, 0.7647059, 1,
-0.04828595, -0.4810875, -1.751391, 0, 1, 0.772549, 1,
-0.04576286, 1.884808, 1.388227, 0, 1, 0.7764706, 1,
-0.04259543, 1.299532, 1.623054, 0, 1, 0.7843137, 1,
-0.04226547, -0.3607701, -3.688452, 0, 1, 0.7882353, 1,
-0.03815703, 0.4271168, 0.1645914, 0, 1, 0.7960784, 1,
-0.03685171, 0.8573408, -0.6880322, 0, 1, 0.8039216, 1,
-0.03399213, -0.1470987, -2.915186, 0, 1, 0.8078431, 1,
-0.03234857, -1.841334, -2.739937, 0, 1, 0.8156863, 1,
-0.0300537, 1.547998, 0.3457341, 0, 1, 0.8196079, 1,
-0.02888937, -1.142257, -4.304336, 0, 1, 0.827451, 1,
-0.02856663, -0.8600107, -3.576912, 0, 1, 0.8313726, 1,
-0.02790721, 2.063918, 0.7419186, 0, 1, 0.8392157, 1,
-0.02537527, -1.760888, -1.807856, 0, 1, 0.8431373, 1,
-0.02281652, 0.6575003, -0.7194871, 0, 1, 0.8509804, 1,
-0.01988996, 0.986825, -0.2245096, 0, 1, 0.854902, 1,
-0.01985939, -1.169596, -3.734907, 0, 1, 0.8627451, 1,
-0.0165188, -0.7847036, -2.940083, 0, 1, 0.8666667, 1,
-0.01536172, 1.104174, -0.2761245, 0, 1, 0.8745098, 1,
-0.00828771, -0.967973, -2.773029, 0, 1, 0.8784314, 1,
-0.006291196, -0.9994619, -2.896317, 0, 1, 0.8862745, 1,
-0.004579044, -1.999707, -4.111145, 0, 1, 0.8901961, 1,
-0.002980815, 0.5496737, -0.3071072, 0, 1, 0.8980392, 1,
-0.002246864, 1.195755, 0.4393123, 0, 1, 0.9058824, 1,
-0.0008261356, -1.162793, -1.778017, 0, 1, 0.9098039, 1,
0.004430148, 1.047508, -0.5037271, 0, 1, 0.9176471, 1,
0.006983655, -0.8609363, 2.17672, 0, 1, 0.9215686, 1,
0.007414266, -0.2219005, 3.590504, 0, 1, 0.9294118, 1,
0.009572268, -0.5025507, 2.818123, 0, 1, 0.9333333, 1,
0.009580933, 1.268719, 0.2361722, 0, 1, 0.9411765, 1,
0.009961493, 0.1747885, 1.683132, 0, 1, 0.945098, 1,
0.01173824, -0.761611, 4.525392, 0, 1, 0.9529412, 1,
0.0141777, 1.08391, -0.008904052, 0, 1, 0.9568627, 1,
0.01594992, -0.4330335, 2.131371, 0, 1, 0.9647059, 1,
0.01859223, -1.80684, 2.28196, 0, 1, 0.9686275, 1,
0.01884089, 1.022308, -0.2412481, 0, 1, 0.9764706, 1,
0.01984138, -0.467815, 3.418481, 0, 1, 0.9803922, 1,
0.02464969, 0.4727074, 1.533957, 0, 1, 0.9882353, 1,
0.02694836, 0.9342002, 0.544737, 0, 1, 0.9921569, 1,
0.02950433, 0.7213235, 0.1487907, 0, 1, 1, 1,
0.03043233, -0.2867275, 2.146461, 0, 0.9921569, 1, 1,
0.03746827, -0.6748659, 2.31225, 0, 0.9882353, 1, 1,
0.03978239, 0.3036171, -0.8575577, 0, 0.9803922, 1, 1,
0.04147862, 1.172718, -1.528214, 0, 0.9764706, 1, 1,
0.04403626, -1.439524, 4.636723, 0, 0.9686275, 1, 1,
0.04506667, -1.378018, 2.675714, 0, 0.9647059, 1, 1,
0.04511277, -0.9869668, 4.755154, 0, 0.9568627, 1, 1,
0.04654615, -1.062406, 1.338158, 0, 0.9529412, 1, 1,
0.04777655, 0.6027555, 0.6212034, 0, 0.945098, 1, 1,
0.04990271, 0.01585451, -1.07294, 0, 0.9411765, 1, 1,
0.05009793, -1.495168, 1.288954, 0, 0.9333333, 1, 1,
0.05635554, 2.179433, -0.211018, 0, 0.9294118, 1, 1,
0.05876279, -0.4544455, 4.715859, 0, 0.9215686, 1, 1,
0.05987373, -0.8352645, 3.311608, 0, 0.9176471, 1, 1,
0.06096278, -0.3371645, 3.966855, 0, 0.9098039, 1, 1,
0.06239715, 0.1758963, 1.483254, 0, 0.9058824, 1, 1,
0.06497292, 0.518454, 1.129498, 0, 0.8980392, 1, 1,
0.06603922, 0.04289511, -0.08934059, 0, 0.8901961, 1, 1,
0.0702261, -0.8233985, 4.235902, 0, 0.8862745, 1, 1,
0.07123213, -2.074497, 3.78371, 0, 0.8784314, 1, 1,
0.07130651, 0.126518, -1.445286, 0, 0.8745098, 1, 1,
0.07551577, 1.220462, 1.321488, 0, 0.8666667, 1, 1,
0.07729252, -0.7609681, 4.799151, 0, 0.8627451, 1, 1,
0.0840336, -0.488438, 3.050964, 0, 0.854902, 1, 1,
0.08650824, -0.8314674, 3.950941, 0, 0.8509804, 1, 1,
0.08997452, 0.5048493, -0.5666214, 0, 0.8431373, 1, 1,
0.09275344, 1.0416, -2.111387, 0, 0.8392157, 1, 1,
0.0931771, -0.3273956, 1.856444, 0, 0.8313726, 1, 1,
0.09539953, -0.84918, 0.9758245, 0, 0.827451, 1, 1,
0.09549382, 0.7295132, 1.128846, 0, 0.8196079, 1, 1,
0.09757631, 1.597899, 1.361538, 0, 0.8156863, 1, 1,
0.1009209, -0.4072028, 3.085526, 0, 0.8078431, 1, 1,
0.1033754, 1.280834, -0.01260178, 0, 0.8039216, 1, 1,
0.1056629, 1.362754, 0.4053654, 0, 0.7960784, 1, 1,
0.1060247, -1.916942, 3.594155, 0, 0.7882353, 1, 1,
0.1108829, -1.533933, 3.223738, 0, 0.7843137, 1, 1,
0.1169671, -1.004063, 1.939451, 0, 0.7764706, 1, 1,
0.1171443, 1.081957, 1.208468, 0, 0.772549, 1, 1,
0.1180065, -1.81459, 2.289801, 0, 0.7647059, 1, 1,
0.1211927, -1.091555, 3.331562, 0, 0.7607843, 1, 1,
0.1223269, 1.185871, 0.3101391, 0, 0.7529412, 1, 1,
0.1227419, -2.204277, 2.225228, 0, 0.7490196, 1, 1,
0.1255465, 0.1593239, 0.9950555, 0, 0.7411765, 1, 1,
0.1269536, 0.3263244, 0.774487, 0, 0.7372549, 1, 1,
0.1301888, -1.274582, 3.059566, 0, 0.7294118, 1, 1,
0.1306967, 0.1303973, -1.90065, 0, 0.7254902, 1, 1,
0.1360619, -1.556011, 2.542125, 0, 0.7176471, 1, 1,
0.1366484, 1.060237, 1.758739, 0, 0.7137255, 1, 1,
0.1373743, -0.1020388, 1.792733, 0, 0.7058824, 1, 1,
0.1387613, -0.6237495, 4.60066, 0, 0.6980392, 1, 1,
0.1440895, -0.7995518, 2.321424, 0, 0.6941177, 1, 1,
0.1443476, -0.4289939, 4.275602, 0, 0.6862745, 1, 1,
0.1474639, 0.4702727, 0.5945805, 0, 0.682353, 1, 1,
0.1522735, 0.3792747, 1.459983, 0, 0.6745098, 1, 1,
0.1583394, -0.2803291, 3.428255, 0, 0.6705883, 1, 1,
0.1640785, 1.385007, 0.3819536, 0, 0.6627451, 1, 1,
0.1670116, -1.386345, 0.8435779, 0, 0.6588235, 1, 1,
0.1672913, 1.403143, 0.1316104, 0, 0.6509804, 1, 1,
0.167491, 0.1404436, 3.967629, 0, 0.6470588, 1, 1,
0.1687609, 0.4722598, 1.342332, 0, 0.6392157, 1, 1,
0.1697591, 0.844179, 0.2486431, 0, 0.6352941, 1, 1,
0.1702984, 0.26508, 1.396785, 0, 0.627451, 1, 1,
0.1742783, 0.3997327, 1.02291, 0, 0.6235294, 1, 1,
0.1748133, 0.5552449, -1.955041, 0, 0.6156863, 1, 1,
0.1848627, 0.1954654, 0.8841438, 0, 0.6117647, 1, 1,
0.1890901, -0.5167666, 3.646401, 0, 0.6039216, 1, 1,
0.1924557, 0.5871364, -0.2819744, 0, 0.5960785, 1, 1,
0.1949516, 0.4077835, 1.565619, 0, 0.5921569, 1, 1,
0.1966635, 0.07604163, 0.9464715, 0, 0.5843138, 1, 1,
0.1968332, -0.1630331, 2.955965, 0, 0.5803922, 1, 1,
0.2006991, -1.542913, 4.291833, 0, 0.572549, 1, 1,
0.2051026, -1.128412, 3.318467, 0, 0.5686275, 1, 1,
0.2052916, -0.04488779, 2.627318, 0, 0.5607843, 1, 1,
0.2061854, 1.155595, -0.05417195, 0, 0.5568628, 1, 1,
0.2088557, 0.2560656, 0.9854622, 0, 0.5490196, 1, 1,
0.2088585, 0.3725657, -0.0710976, 0, 0.5450981, 1, 1,
0.2103794, 0.9492703, -0.01585318, 0, 0.5372549, 1, 1,
0.2132785, 2.226356, 0.2711435, 0, 0.5333334, 1, 1,
0.2167122, 0.293345, -0.9330464, 0, 0.5254902, 1, 1,
0.2184478, -0.846271, 3.83032, 0, 0.5215687, 1, 1,
0.2251571, 1.479313, -0.8058357, 0, 0.5137255, 1, 1,
0.2287442, -0.1559399, -0.1795925, 0, 0.509804, 1, 1,
0.2322871, 0.0800715, 1.814912, 0, 0.5019608, 1, 1,
0.2370577, 1.426243, -0.3920425, 0, 0.4941176, 1, 1,
0.2384485, 0.05605514, 0.4963886, 0, 0.4901961, 1, 1,
0.2391366, -0.5003097, 2.731386, 0, 0.4823529, 1, 1,
0.2401224, 0.436275, 0.05570631, 0, 0.4784314, 1, 1,
0.2407582, 1.209217, 1.673753, 0, 0.4705882, 1, 1,
0.2430623, -1.685115, 2.850461, 0, 0.4666667, 1, 1,
0.2466414, 1.160791, 0.9479212, 0, 0.4588235, 1, 1,
0.2508246, 0.7744159, -0.01361228, 0, 0.454902, 1, 1,
0.2516783, 0.2383752, 0.8285113, 0, 0.4470588, 1, 1,
0.2543658, -0.4463943, 4.261871, 0, 0.4431373, 1, 1,
0.2554429, 0.7391121, 0.4902131, 0, 0.4352941, 1, 1,
0.2559608, -0.4500773, 2.948278, 0, 0.4313726, 1, 1,
0.2599794, 0.08348972, 2.000249, 0, 0.4235294, 1, 1,
0.2600818, 0.6739882, 0.8806732, 0, 0.4196078, 1, 1,
0.2607824, -0.3834828, 1.799128, 0, 0.4117647, 1, 1,
0.2610713, -1.449214, 3.443599, 0, 0.4078431, 1, 1,
0.2680835, 2.630873, -0.6166141, 0, 0.4, 1, 1,
0.2694804, -0.805347, 2.343568, 0, 0.3921569, 1, 1,
0.269807, 0.6218621, -0.3764184, 0, 0.3882353, 1, 1,
0.2709691, 0.1397518, 0.4870878, 0, 0.3803922, 1, 1,
0.2725227, 0.1679765, 0.5665175, 0, 0.3764706, 1, 1,
0.2742344, -1.176124, 2.527296, 0, 0.3686275, 1, 1,
0.2774018, -1.222833, 3.503211, 0, 0.3647059, 1, 1,
0.280578, -0.9498757, 3.23772, 0, 0.3568628, 1, 1,
0.2817132, -0.9603167, 3.282081, 0, 0.3529412, 1, 1,
0.2826185, -0.2498646, 1.960688, 0, 0.345098, 1, 1,
0.2827528, -0.7517898, 1.038399, 0, 0.3411765, 1, 1,
0.2855068, 0.9880188, 0.357724, 0, 0.3333333, 1, 1,
0.289571, -0.1084982, 1.755519, 0, 0.3294118, 1, 1,
0.2903488, -0.8270836, 1.475597, 0, 0.3215686, 1, 1,
0.2984128, -0.3751988, 0.933396, 0, 0.3176471, 1, 1,
0.2998676, -0.8223514, 2.364132, 0, 0.3098039, 1, 1,
0.3050857, -0.2174375, 3.709679, 0, 0.3058824, 1, 1,
0.3075677, 0.9483555, -0.6414883, 0, 0.2980392, 1, 1,
0.3122007, 0.8993897, -1.296524, 0, 0.2901961, 1, 1,
0.312216, 0.3331858, 1.085063, 0, 0.2862745, 1, 1,
0.3148373, -0.5386955, 2.896102, 0, 0.2784314, 1, 1,
0.3161665, -1.017214, 0.2392341, 0, 0.2745098, 1, 1,
0.3183576, -0.268343, 2.222796, 0, 0.2666667, 1, 1,
0.3185968, 0.4515625, -1.224744, 0, 0.2627451, 1, 1,
0.3198285, 0.172219, 1.161603, 0, 0.254902, 1, 1,
0.3216392, -0.8148402, 1.194617, 0, 0.2509804, 1, 1,
0.3218673, 1.808096, 1.42966, 0, 0.2431373, 1, 1,
0.3240386, -0.1113892, 0.02563679, 0, 0.2392157, 1, 1,
0.3247206, -2.428943, 2.630356, 0, 0.2313726, 1, 1,
0.326026, -0.5584182, 1.796947, 0, 0.227451, 1, 1,
0.3291144, -0.7358238, 2.734945, 0, 0.2196078, 1, 1,
0.3297547, 0.8054171, 0.265984, 0, 0.2156863, 1, 1,
0.3299664, 0.126529, -0.1033826, 0, 0.2078431, 1, 1,
0.3307902, 0.6793323, 0.4724175, 0, 0.2039216, 1, 1,
0.3364516, -0.8027707, 1.654829, 0, 0.1960784, 1, 1,
0.341116, -0.1022353, 0.4822904, 0, 0.1882353, 1, 1,
0.3421999, -1.329277, 1.837445, 0, 0.1843137, 1, 1,
0.3426634, 1.477804, 0.2444545, 0, 0.1764706, 1, 1,
0.3427304, -1.052793, 3.227285, 0, 0.172549, 1, 1,
0.3461476, -0.7108077, 2.12634, 0, 0.1647059, 1, 1,
0.3481563, 0.6097971, 0.2061036, 0, 0.1607843, 1, 1,
0.3482333, 0.4203638, 1.515612, 0, 0.1529412, 1, 1,
0.3554004, 0.5582383, 1.375773, 0, 0.1490196, 1, 1,
0.3555509, -1.227032, 2.638994, 0, 0.1411765, 1, 1,
0.3559987, -0.4646194, 4.59295, 0, 0.1372549, 1, 1,
0.3592581, 2.043623, -0.9230232, 0, 0.1294118, 1, 1,
0.3605379, 1.238117, -1.303063, 0, 0.1254902, 1, 1,
0.3625373, -1.948778, -0.4646841, 0, 0.1176471, 1, 1,
0.3655276, 0.6586214, 0.6695257, 0, 0.1137255, 1, 1,
0.3675456, -2.102577, 2.557677, 0, 0.1058824, 1, 1,
0.3708315, 0.05523833, 1.966131, 0, 0.09803922, 1, 1,
0.3746369, -0.4087953, 1.877219, 0, 0.09411765, 1, 1,
0.3764432, -1.241922, 4.071216, 0, 0.08627451, 1, 1,
0.3768652, -0.01450577, 0.7060347, 0, 0.08235294, 1, 1,
0.3783653, -2.693825, 2.047201, 0, 0.07450981, 1, 1,
0.3819848, -1.109594, 2.832954, 0, 0.07058824, 1, 1,
0.3846951, 0.3160194, 1.210023, 0, 0.0627451, 1, 1,
0.3864761, 0.3821626, 0.4999882, 0, 0.05882353, 1, 1,
0.3870992, -0.7216659, 0.5362741, 0, 0.05098039, 1, 1,
0.3945474, -0.6453207, 2.040522, 0, 0.04705882, 1, 1,
0.3945726, 0.09948022, 0.618609, 0, 0.03921569, 1, 1,
0.3947825, -1.096919, 3.108957, 0, 0.03529412, 1, 1,
0.3955518, 0.1657771, 1.744132, 0, 0.02745098, 1, 1,
0.39617, -0.1806868, 4.290308, 0, 0.02352941, 1, 1,
0.3966205, 0.9247859, 0.7481177, 0, 0.01568628, 1, 1,
0.4036669, -0.3365216, 2.157955, 0, 0.01176471, 1, 1,
0.4053465, -0.06311666, 1.793788, 0, 0.003921569, 1, 1,
0.4058771, 0.6878767, 1.123845, 0.003921569, 0, 1, 1,
0.4176303, -1.501649, 2.628863, 0.007843138, 0, 1, 1,
0.4179946, 0.6861131, 1.865646, 0.01568628, 0, 1, 1,
0.417996, 1.005702, 0.06662527, 0.01960784, 0, 1, 1,
0.4202497, 1.066404, -0.900885, 0.02745098, 0, 1, 1,
0.4227732, 0.1351625, 1.981757, 0.03137255, 0, 1, 1,
0.4229124, -0.508957, 2.977096, 0.03921569, 0, 1, 1,
0.4263875, 0.6319308, 0.5671093, 0.04313726, 0, 1, 1,
0.4283666, 0.7630682, -0.7328026, 0.05098039, 0, 1, 1,
0.4381091, -1.555653, 4.250195, 0.05490196, 0, 1, 1,
0.4414014, 0.09574379, 3.676956, 0.0627451, 0, 1, 1,
0.4457561, -0.958598, 1.052409, 0.06666667, 0, 1, 1,
0.4458426, 0.1075377, 2.066104, 0.07450981, 0, 1, 1,
0.4477822, 0.7420834, 0.1137002, 0.07843138, 0, 1, 1,
0.4493166, -0.7655848, 1.183024, 0.08627451, 0, 1, 1,
0.4547547, -0.4450351, 1.078217, 0.09019608, 0, 1, 1,
0.4581208, -1.54013, 4.221097, 0.09803922, 0, 1, 1,
0.4590278, 1.223985, 0.06289797, 0.1058824, 0, 1, 1,
0.4599779, 1.988461, 1.469221, 0.1098039, 0, 1, 1,
0.463809, 0.6921087, 1.855186, 0.1176471, 0, 1, 1,
0.465617, -0.7699214, 3.38429, 0.1215686, 0, 1, 1,
0.4668527, 0.2780246, 2.160296, 0.1294118, 0, 1, 1,
0.468059, -0.1590925, 2.185688, 0.1333333, 0, 1, 1,
0.4699145, 0.599044, -0.2019104, 0.1411765, 0, 1, 1,
0.4755723, 0.2839631, 1.821295, 0.145098, 0, 1, 1,
0.4762024, -0.6500274, 3.248931, 0.1529412, 0, 1, 1,
0.4784727, 1.125535, 1.122188, 0.1568628, 0, 1, 1,
0.4795991, 0.9955307, 1.740924, 0.1647059, 0, 1, 1,
0.4798569, -1.981203, 4.365031, 0.1686275, 0, 1, 1,
0.480008, 1.267418, -0.2950339, 0.1764706, 0, 1, 1,
0.4863987, -0.8491191, 2.949946, 0.1803922, 0, 1, 1,
0.4905425, -1.013271, 2.583534, 0.1882353, 0, 1, 1,
0.4961604, 0.6410493, 1.123633, 0.1921569, 0, 1, 1,
0.4983878, -0.1077199, 2.28089, 0.2, 0, 1, 1,
0.5010045, -0.1920809, 0.873256, 0.2078431, 0, 1, 1,
0.509024, 0.3036861, 2.241343, 0.2117647, 0, 1, 1,
0.5150188, 0.655617, -0.7063451, 0.2196078, 0, 1, 1,
0.5164683, -0.0997007, 2.234774, 0.2235294, 0, 1, 1,
0.5171496, 0.1439129, 2.202705, 0.2313726, 0, 1, 1,
0.5182326, -0.07832048, 1.748699, 0.2352941, 0, 1, 1,
0.5214717, 1.380516, 0.5208313, 0.2431373, 0, 1, 1,
0.5224504, -0.4576911, 1.603146, 0.2470588, 0, 1, 1,
0.5239185, -0.2899771, 1.358304, 0.254902, 0, 1, 1,
0.5240551, 0.9222549, 0.895743, 0.2588235, 0, 1, 1,
0.5252162, -1.739224, 2.169656, 0.2666667, 0, 1, 1,
0.5263828, 0.6517836, 1.911583, 0.2705882, 0, 1, 1,
0.5278411, 2.238758, -1.146163, 0.2784314, 0, 1, 1,
0.5289246, 0.8657479, -0.07622556, 0.282353, 0, 1, 1,
0.5289516, -1.831243, 3.61566, 0.2901961, 0, 1, 1,
0.5337206, 0.04679319, 1.127509, 0.2941177, 0, 1, 1,
0.5360615, -0.3136312, 3.574858, 0.3019608, 0, 1, 1,
0.5360733, 0.5244476, 0.7081921, 0.3098039, 0, 1, 1,
0.5376678, -1.303931, 2.084339, 0.3137255, 0, 1, 1,
0.5395864, 1.452793, -1.154672, 0.3215686, 0, 1, 1,
0.5410646, -2.345639, 3.371222, 0.3254902, 0, 1, 1,
0.5423409, 1.494169, 0.8409718, 0.3333333, 0, 1, 1,
0.5428824, -0.7328002, 3.889268, 0.3372549, 0, 1, 1,
0.5459515, 0.3312998, 0.5640938, 0.345098, 0, 1, 1,
0.5505215, 3.753364, -0.2700494, 0.3490196, 0, 1, 1,
0.5531573, -0.0810454, 1.844469, 0.3568628, 0, 1, 1,
0.5536574, -0.5113704, 3.621011, 0.3607843, 0, 1, 1,
0.5663459, 0.676071, 2.421414, 0.3686275, 0, 1, 1,
0.5685347, 0.6543741, 1.978638, 0.372549, 0, 1, 1,
0.5726867, 0.9834999, 0.2869998, 0.3803922, 0, 1, 1,
0.5731211, 2.443999, 1.295528, 0.3843137, 0, 1, 1,
0.5733185, 0.3835285, -1.028984, 0.3921569, 0, 1, 1,
0.5738587, -0.2782673, 2.690185, 0.3960784, 0, 1, 1,
0.5742368, -1.663176, 2.056988, 0.4039216, 0, 1, 1,
0.5749299, 0.9233824, 1.128436, 0.4117647, 0, 1, 1,
0.5784765, 0.7618783, 1.864016, 0.4156863, 0, 1, 1,
0.5809936, 1.288929, -0.7106759, 0.4235294, 0, 1, 1,
0.5829565, 0.2768752, 1.016193, 0.427451, 0, 1, 1,
0.5893289, 0.1843474, 2.712089, 0.4352941, 0, 1, 1,
0.5898122, 1.115979, 0.6414219, 0.4392157, 0, 1, 1,
0.5984027, -2.032088, 3.354494, 0.4470588, 0, 1, 1,
0.5994946, 1.252186, 0.0637458, 0.4509804, 0, 1, 1,
0.6006975, -0.5711028, 3.627864, 0.4588235, 0, 1, 1,
0.6045439, 0.1123507, 1.048676, 0.4627451, 0, 1, 1,
0.6045948, -1.251981, 2.217096, 0.4705882, 0, 1, 1,
0.618118, 1.538447, 0.7360819, 0.4745098, 0, 1, 1,
0.6225979, 0.6227163, -0.8361881, 0.4823529, 0, 1, 1,
0.624585, 0.5843121, 1.251631, 0.4862745, 0, 1, 1,
0.6266659, 1.398844, -1.338204, 0.4941176, 0, 1, 1,
0.6266739, -0.8890437, 2.416404, 0.5019608, 0, 1, 1,
0.6284229, -0.1461738, 1.849064, 0.5058824, 0, 1, 1,
0.6287428, 1.246369, 1.946943, 0.5137255, 0, 1, 1,
0.6308523, -0.714485, 3.996966, 0.5176471, 0, 1, 1,
0.6382573, -0.4614059, 2.151702, 0.5254902, 0, 1, 1,
0.638308, -1.03713, 3.855937, 0.5294118, 0, 1, 1,
0.6399441, 0.4584309, 1.273261, 0.5372549, 0, 1, 1,
0.6439712, -0.04144286, 2.574844, 0.5411765, 0, 1, 1,
0.6443886, -1.381701, 1.818967, 0.5490196, 0, 1, 1,
0.6454718, -2.069684, 2.875893, 0.5529412, 0, 1, 1,
0.6486648, 1.268579, -1.105886, 0.5607843, 0, 1, 1,
0.6490875, 0.137675, 0.1062915, 0.5647059, 0, 1, 1,
0.6498024, -1.151231, 2.041055, 0.572549, 0, 1, 1,
0.6510746, -0.3322631, 2.039023, 0.5764706, 0, 1, 1,
0.6531057, -0.7379253, 2.937931, 0.5843138, 0, 1, 1,
0.6593776, 0.2995048, 1.821559, 0.5882353, 0, 1, 1,
0.661791, -1.437858, 3.685927, 0.5960785, 0, 1, 1,
0.662147, 1.834473, -0.172029, 0.6039216, 0, 1, 1,
0.6633536, -0.03694955, 2.737583, 0.6078432, 0, 1, 1,
0.6712282, 1.774254, 0.3223326, 0.6156863, 0, 1, 1,
0.6787156, -0.6887993, 2.604414, 0.6196079, 0, 1, 1,
0.6793445, 1.171601, 1.275441, 0.627451, 0, 1, 1,
0.6880308, -0.2216392, 2.875802, 0.6313726, 0, 1, 1,
0.6968423, 0.4936767, 0.3272465, 0.6392157, 0, 1, 1,
0.6997871, 0.4182419, -0.01904758, 0.6431373, 0, 1, 1,
0.7048007, 0.2841188, -0.7272595, 0.6509804, 0, 1, 1,
0.708476, -1.031259, 2.109205, 0.654902, 0, 1, 1,
0.7197003, 0.03191815, 0.7266324, 0.6627451, 0, 1, 1,
0.7197614, 0.8488889, 2.207669, 0.6666667, 0, 1, 1,
0.7197614, 0.9129638, 1.120999, 0.6745098, 0, 1, 1,
0.7228739, -0.9604347, 2.168763, 0.6784314, 0, 1, 1,
0.7241387, 1.066102, -0.4940235, 0.6862745, 0, 1, 1,
0.7257714, 0.6219465, -1.005004, 0.6901961, 0, 1, 1,
0.7270693, -1.170048, 1.076123, 0.6980392, 0, 1, 1,
0.7294648, 0.1636544, 2.938962, 0.7058824, 0, 1, 1,
0.7348133, 0.1526076, 1.331656, 0.7098039, 0, 1, 1,
0.7362784, 0.285794, 2.029884, 0.7176471, 0, 1, 1,
0.7363418, -0.8609524, 1.195422, 0.7215686, 0, 1, 1,
0.7391264, -0.04374514, 2.625091, 0.7294118, 0, 1, 1,
0.7458638, 1.534617, -0.03409873, 0.7333333, 0, 1, 1,
0.7467995, -1.90962, 3.019762, 0.7411765, 0, 1, 1,
0.7570216, -2.002371, 2.138543, 0.7450981, 0, 1, 1,
0.7589735, -0.4487193, 1.657492, 0.7529412, 0, 1, 1,
0.7642746, 1.115824, 0.2451336, 0.7568628, 0, 1, 1,
0.7743419, 1.247248, 2.491347, 0.7647059, 0, 1, 1,
0.7789695, -1.603731, 2.534347, 0.7686275, 0, 1, 1,
0.7797401, 0.698702, -0.4339139, 0.7764706, 0, 1, 1,
0.7807546, 1.079686, 0.7731925, 0.7803922, 0, 1, 1,
0.7811071, -0.4181441, 3.234398, 0.7882353, 0, 1, 1,
0.7811493, -0.5876458, 3.796613, 0.7921569, 0, 1, 1,
0.785694, 0.2690954, 1.684044, 0.8, 0, 1, 1,
0.7865729, -0.2072157, 0.3418721, 0.8078431, 0, 1, 1,
0.7881985, -1.24249, 0.9996257, 0.8117647, 0, 1, 1,
0.7884325, -0.9121307, 3.765331, 0.8196079, 0, 1, 1,
0.7909887, 2.177991, 0.2927574, 0.8235294, 0, 1, 1,
0.7935636, -0.3377022, 0.336263, 0.8313726, 0, 1, 1,
0.7944282, 0.2564052, -1.153958, 0.8352941, 0, 1, 1,
0.7954417, -1.414461, 2.636858, 0.8431373, 0, 1, 1,
0.80409, 0.8577557, 0.1415267, 0.8470588, 0, 1, 1,
0.8051308, 0.7241195, 2.411731, 0.854902, 0, 1, 1,
0.8094163, -0.174062, 1.250434, 0.8588235, 0, 1, 1,
0.8098167, 0.05298237, 1.023218, 0.8666667, 0, 1, 1,
0.8142132, -0.06980188, 3.254394, 0.8705882, 0, 1, 1,
0.8221039, 0.5241348, 0.7463055, 0.8784314, 0, 1, 1,
0.8263747, 0.5798551, -0.4313766, 0.8823529, 0, 1, 1,
0.8278733, -2.792843, 2.363452, 0.8901961, 0, 1, 1,
0.8300312, -0.08338669, 2.334478, 0.8941177, 0, 1, 1,
0.8359631, 0.9186805, -0.9886607, 0.9019608, 0, 1, 1,
0.8369265, 0.4795595, 0.03749421, 0.9098039, 0, 1, 1,
0.8394989, 0.6038125, 1.239176, 0.9137255, 0, 1, 1,
0.841458, -1.153216, 1.172602, 0.9215686, 0, 1, 1,
0.8429301, -0.1927229, 1.714319, 0.9254902, 0, 1, 1,
0.8439155, 1.456428, 0.5062284, 0.9333333, 0, 1, 1,
0.8458442, 0.4601353, 0.6549789, 0.9372549, 0, 1, 1,
0.8557739, 0.3123313, 0.2863365, 0.945098, 0, 1, 1,
0.8604801, -1.601143, 1.732106, 0.9490196, 0, 1, 1,
0.8606907, 0.1780438, -1.063722, 0.9568627, 0, 1, 1,
0.8619704, -0.2884623, 1.529451, 0.9607843, 0, 1, 1,
0.8641776, -0.7556436, 3.060404, 0.9686275, 0, 1, 1,
0.8661458, -0.05979974, 2.78873, 0.972549, 0, 1, 1,
0.877494, 1.023552, 0.8850099, 0.9803922, 0, 1, 1,
0.8775138, -0.3161956, 1.738114, 0.9843137, 0, 1, 1,
0.8855547, -1.812776, 1.469969, 0.9921569, 0, 1, 1,
0.8948237, -0.9202046, 1.957205, 0.9960784, 0, 1, 1,
0.9085472, -0.9903826, 2.293638, 1, 0, 0.9960784, 1,
0.9148819, 1.16653, 1.761584, 1, 0, 0.9882353, 1,
0.9149764, 0.006564396, 1.095389, 1, 0, 0.9843137, 1,
0.9157006, -0.6141315, 0.9889755, 1, 0, 0.9764706, 1,
0.923569, 1.083685, 0.7357442, 1, 0, 0.972549, 1,
0.9288915, -0.0966128, 0.9015251, 1, 0, 0.9647059, 1,
0.9310091, 0.005668646, 3.282482, 1, 0, 0.9607843, 1,
0.9322597, 0.256538, 2.573199, 1, 0, 0.9529412, 1,
0.9327111, 0.3843482, 1.877549, 1, 0, 0.9490196, 1,
0.9384177, 1.465856, 1.967794, 1, 0, 0.9411765, 1,
0.9397591, -0.2714176, 2.064591, 1, 0, 0.9372549, 1,
0.9404628, -1.184984, 3.046859, 1, 0, 0.9294118, 1,
0.9456697, -1.878423, 3.725171, 1, 0, 0.9254902, 1,
0.9472224, 0.3799717, 1.392649, 1, 0, 0.9176471, 1,
0.9485974, 0.4713261, 0.7899656, 1, 0, 0.9137255, 1,
0.9488926, -0.2180322, 1.478153, 1, 0, 0.9058824, 1,
0.9501965, 0.9091648, 0.521839, 1, 0, 0.9019608, 1,
0.9611412, -0.3752355, 0.3820601, 1, 0, 0.8941177, 1,
0.9611915, -0.1493403, -0.3092875, 1, 0, 0.8862745, 1,
0.9635016, -0.2814603, 2.129904, 1, 0, 0.8823529, 1,
0.9693423, 1.818643, -0.9602694, 1, 0, 0.8745098, 1,
0.9737805, 0.8110797, 0.5863872, 1, 0, 0.8705882, 1,
0.9745632, 0.5336761, 1.940696, 1, 0, 0.8627451, 1,
0.9780602, 1.377729, 0.02871992, 1, 0, 0.8588235, 1,
0.9854791, 0.8621029, 1.002622, 1, 0, 0.8509804, 1,
0.9864247, 0.1608298, 1.568956, 1, 0, 0.8470588, 1,
0.9867356, 1.513465, 0.9660646, 1, 0, 0.8392157, 1,
0.9867907, -1.581812, 1.787038, 1, 0, 0.8352941, 1,
0.9884099, -0.105159, 1.464249, 1, 0, 0.827451, 1,
0.9947708, -2.478351, 2.266988, 1, 0, 0.8235294, 1,
0.9953046, -0.549298, 1.43169, 1, 0, 0.8156863, 1,
0.9985572, 0.7256005, 0.5100854, 1, 0, 0.8117647, 1,
1.004121, -1.108379, 1.635581, 1, 0, 0.8039216, 1,
1.007557, -0.2416521, 3.282082, 1, 0, 0.7960784, 1,
1.008803, 1.749983, -1.738054, 1, 0, 0.7921569, 1,
1.01784, -0.406693, 3.629929, 1, 0, 0.7843137, 1,
1.022402, 0.9295651, 0.3813547, 1, 0, 0.7803922, 1,
1.034123, 1.275365, 0.9625871, 1, 0, 0.772549, 1,
1.038433, 0.05228728, 1.145049, 1, 0, 0.7686275, 1,
1.042748, -1.042223, 2.009961, 1, 0, 0.7607843, 1,
1.046057, -0.08176113, 1.412048, 1, 0, 0.7568628, 1,
1.048418, -0.73315, 2.866261, 1, 0, 0.7490196, 1,
1.049758, 0.925896, 0.5633982, 1, 0, 0.7450981, 1,
1.051064, -0.8533794, 2.885456, 1, 0, 0.7372549, 1,
1.052623, -0.631714, 2.476916, 1, 0, 0.7333333, 1,
1.055254, -2.065422, 0.3392547, 1, 0, 0.7254902, 1,
1.059458, 0.3655591, 0.3078051, 1, 0, 0.7215686, 1,
1.07034, 0.2715883, 0.9748341, 1, 0, 0.7137255, 1,
1.082125, 1.527003, -0.1395399, 1, 0, 0.7098039, 1,
1.087791, 1.152758, 0.2716595, 1, 0, 0.7019608, 1,
1.097548, 1.680372, 0.6072375, 1, 0, 0.6941177, 1,
1.101876, -0.8975375, 3.07437, 1, 0, 0.6901961, 1,
1.102676, -0.5625865, 3.272289, 1, 0, 0.682353, 1,
1.105978, -0.2852378, 1.871352, 1, 0, 0.6784314, 1,
1.108355, 1.111481, 1.654084, 1, 0, 0.6705883, 1,
1.115933, 1.034505, 1.418993, 1, 0, 0.6666667, 1,
1.116694, 1.152483, 1.139522, 1, 0, 0.6588235, 1,
1.117795, -0.3189845, -0.1010391, 1, 0, 0.654902, 1,
1.121365, 0.6423524, 0.4470687, 1, 0, 0.6470588, 1,
1.124822, -1.918356, 1.699646, 1, 0, 0.6431373, 1,
1.125618, 0.2448751, 2.777621, 1, 0, 0.6352941, 1,
1.134902, -0.8738228, 1.754043, 1, 0, 0.6313726, 1,
1.138711, 1.756625, 1.302016, 1, 0, 0.6235294, 1,
1.14296, 0.416868, 1.342724, 1, 0, 0.6196079, 1,
1.147247, 0.7324768, 0.7382473, 1, 0, 0.6117647, 1,
1.149971, 0.1636029, 2.183472, 1, 0, 0.6078432, 1,
1.150537, 0.4536347, 0.7367826, 1, 0, 0.6, 1,
1.15655, 1.500844, 0.2964403, 1, 0, 0.5921569, 1,
1.16336, -0.5575239, 0.3632902, 1, 0, 0.5882353, 1,
1.173757, -1.887344, 1.245079, 1, 0, 0.5803922, 1,
1.175563, -0.4192918, 1.313506, 1, 0, 0.5764706, 1,
1.177916, -1.641107, 2.090079, 1, 0, 0.5686275, 1,
1.178621, -0.5899603, 1.465645, 1, 0, 0.5647059, 1,
1.180239, -1.079157, 1.994172, 1, 0, 0.5568628, 1,
1.214371, 1.220154, 0.3823313, 1, 0, 0.5529412, 1,
1.217412, 0.8064899, 2.9752, 1, 0, 0.5450981, 1,
1.226484, -1.007049, 0.9318469, 1, 0, 0.5411765, 1,
1.227965, 0.2877907, 0.4699609, 1, 0, 0.5333334, 1,
1.243146, -0.3845981, 3.315856, 1, 0, 0.5294118, 1,
1.244551, 0.670921, 0.7901579, 1, 0, 0.5215687, 1,
1.24629, 0.711277, 0.8850625, 1, 0, 0.5176471, 1,
1.248369, -0.31247, 0.8167859, 1, 0, 0.509804, 1,
1.249215, -0.9528649, 2.043409, 1, 0, 0.5058824, 1,
1.24973, 1.491981, -0.6006199, 1, 0, 0.4980392, 1,
1.268907, 0.4916867, 1.05863, 1, 0, 0.4901961, 1,
1.277926, 0.849562, 0.4300516, 1, 0, 0.4862745, 1,
1.282798, 1.345847, 1.603631, 1, 0, 0.4784314, 1,
1.295069, -0.7570884, 2.606717, 1, 0, 0.4745098, 1,
1.298544, 1.572404, 0.9748699, 1, 0, 0.4666667, 1,
1.307522, 0.168026, 1.850303, 1, 0, 0.4627451, 1,
1.312382, 0.5671877, 3.002596, 1, 0, 0.454902, 1,
1.312896, -0.7873892, 0.5690896, 1, 0, 0.4509804, 1,
1.31339, -1.379393, 2.556361, 1, 0, 0.4431373, 1,
1.314386, -0.7473306, 2.312953, 1, 0, 0.4392157, 1,
1.318948, 0.2141303, 2.220552, 1, 0, 0.4313726, 1,
1.326534, 0.8166562, 0.7395055, 1, 0, 0.427451, 1,
1.331389, -0.272945, 3.314533, 1, 0, 0.4196078, 1,
1.340665, -0.5278139, 0.8340986, 1, 0, 0.4156863, 1,
1.344901, 0.3663882, 1.510977, 1, 0, 0.4078431, 1,
1.354354, 0.7161101, -0.6396379, 1, 0, 0.4039216, 1,
1.378763, -0.0455598, 1.171024, 1, 0, 0.3960784, 1,
1.38173, -0.1896648, 0.06232418, 1, 0, 0.3882353, 1,
1.402011, -0.04068396, 1.779151, 1, 0, 0.3843137, 1,
1.413949, 1.278085, 2.113849, 1, 0, 0.3764706, 1,
1.424638, 0.09383986, 0.9317431, 1, 0, 0.372549, 1,
1.433078, -1.060083, 2.259983, 1, 0, 0.3647059, 1,
1.434445, -0.8880344, 0.6930957, 1, 0, 0.3607843, 1,
1.439232, -1.025146, 2.400356, 1, 0, 0.3529412, 1,
1.449205, -0.7548856, 1.447207, 1, 0, 0.3490196, 1,
1.452667, -1.307193, 2.748221, 1, 0, 0.3411765, 1,
1.455569, -0.3534319, 1.857105, 1, 0, 0.3372549, 1,
1.455957, 1.712713, 0.2547702, 1, 0, 0.3294118, 1,
1.456851, -0.2594359, 3.001019, 1, 0, 0.3254902, 1,
1.469728, -0.7885663, 3.116497, 1, 0, 0.3176471, 1,
1.493279, -0.1606829, -0.4322949, 1, 0, 0.3137255, 1,
1.496674, -1.026436, 3.560932, 1, 0, 0.3058824, 1,
1.521206, -2.377088, 3.538246, 1, 0, 0.2980392, 1,
1.539652, -0.4064242, 1.079278, 1, 0, 0.2941177, 1,
1.541071, -1.600441, 1.437935, 1, 0, 0.2862745, 1,
1.566012, 0.7227312, -2.052633, 1, 0, 0.282353, 1,
1.566438, 0.2627741, 0.268732, 1, 0, 0.2745098, 1,
1.58303, 0.03185077, 1.989405, 1, 0, 0.2705882, 1,
1.597124, -0.4414371, 1.656711, 1, 0, 0.2627451, 1,
1.616344, 0.1825414, 1.896487, 1, 0, 0.2588235, 1,
1.633446, -1.114053, 1.758078, 1, 0, 0.2509804, 1,
1.637342, 1.035574, 0.1560776, 1, 0, 0.2470588, 1,
1.673367, -1.008056, 2.324858, 1, 0, 0.2392157, 1,
1.67989, 0.9549816, 0.7490329, 1, 0, 0.2352941, 1,
1.682743, 0.1854245, 0.963003, 1, 0, 0.227451, 1,
1.68578, 0.1020631, 1.002208, 1, 0, 0.2235294, 1,
1.693765, -1.578391, 2.318818, 1, 0, 0.2156863, 1,
1.702354, -0.02949778, 0.7370994, 1, 0, 0.2117647, 1,
1.707235, -1.177781, 3.297792, 1, 0, 0.2039216, 1,
1.707637, -0.836989, 0.702037, 1, 0, 0.1960784, 1,
1.715264, 0.0140927, 2.479328, 1, 0, 0.1921569, 1,
1.744986, 2.610503, -0.7190344, 1, 0, 0.1843137, 1,
1.746948, 0.6481101, 1.962469, 1, 0, 0.1803922, 1,
1.775779, 1.466825, 0.6500906, 1, 0, 0.172549, 1,
1.791087, -0.6253357, 2.354643, 1, 0, 0.1686275, 1,
1.815349, 1.032942, 1.100525, 1, 0, 0.1607843, 1,
1.829068, -0.295013, 1.879475, 1, 0, 0.1568628, 1,
1.856517, -0.7044765, 2.341123, 1, 0, 0.1490196, 1,
1.877767, -1.309441, 0.3024036, 1, 0, 0.145098, 1,
1.913094, -0.1228629, 2.70822, 1, 0, 0.1372549, 1,
1.988306, 0.3377284, 2.013875, 1, 0, 0.1333333, 1,
2.027008, 0.67914, 0.9439305, 1, 0, 0.1254902, 1,
2.028124, -0.192461, 1.558907, 1, 0, 0.1215686, 1,
2.047702, 0.02782252, 2.142566, 1, 0, 0.1137255, 1,
2.053941, 0.01305625, 2.034972, 1, 0, 0.1098039, 1,
2.065581, -0.552922, 1.109367, 1, 0, 0.1019608, 1,
2.085194, 1.164465, 0.9920546, 1, 0, 0.09411765, 1,
2.088179, 0.3689377, -0.02515369, 1, 0, 0.09019608, 1,
2.101782, -0.56836, 1.001192, 1, 0, 0.08235294, 1,
2.132255, -0.1097756, 1.085916, 1, 0, 0.07843138, 1,
2.133782, 0.9062505, 1.594463, 1, 0, 0.07058824, 1,
2.161093, 0.990061, 1.295969, 1, 0, 0.06666667, 1,
2.17736, -0.1027565, 2.968146, 1, 0, 0.05882353, 1,
2.183567, 0.08517373, 0.1272477, 1, 0, 0.05490196, 1,
2.250802, 2.259715, 2.667358, 1, 0, 0.04705882, 1,
2.301162, -0.6773726, 2.632197, 1, 0, 0.04313726, 1,
2.550971, -0.4860087, 1.252035, 1, 0, 0.03529412, 1,
2.71133, -0.3230269, 1.605906, 1, 0, 0.03137255, 1,
2.741604, -0.08359383, 2.856339, 1, 0, 0.02352941, 1,
2.886868, 0.1488989, 2.345215, 1, 0, 0.01960784, 1,
2.905496, -0.1644568, 1.387576, 1, 0, 0.01176471, 1,
3.055243, 0.2244452, 1.563505, 1, 0, 0.007843138, 1
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
0.01015687, -4.037204, -6.974345, 0, -0.5, 0.5, 0.5,
0.01015687, -4.037204, -6.974345, 1, -0.5, 0.5, 0.5,
0.01015687, -4.037204, -6.974345, 1, 1.5, 0.5, 0.5,
0.01015687, -4.037204, -6.974345, 0, 1.5, 0.5, 0.5
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
-4.067213, 0.4226379, -6.974345, 0, -0.5, 0.5, 0.5,
-4.067213, 0.4226379, -6.974345, 1, -0.5, 0.5, 0.5,
-4.067213, 0.4226379, -6.974345, 1, 1.5, 0.5, 0.5,
-4.067213, 0.4226379, -6.974345, 0, 1.5, 0.5, 0.5
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
-4.067213, -4.037204, -0.2344086, 0, -0.5, 0.5, 0.5,
-4.067213, -4.037204, -0.2344086, 1, -0.5, 0.5, 0.5,
-4.067213, -4.037204, -0.2344086, 1, 1.5, 0.5, 0.5,
-4.067213, -4.037204, -0.2344086, 0, 1.5, 0.5, 0.5
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
-3, -3.00801, -5.418975,
3, -3.00801, -5.418975,
-3, -3.00801, -5.418975,
-3, -3.179542, -5.678203,
-2, -3.00801, -5.418975,
-2, -3.179542, -5.678203,
-1, -3.00801, -5.418975,
-1, -3.179542, -5.678203,
0, -3.00801, -5.418975,
0, -3.179542, -5.678203,
1, -3.00801, -5.418975,
1, -3.179542, -5.678203,
2, -3.00801, -5.418975,
2, -3.179542, -5.678203,
3, -3.00801, -5.418975,
3, -3.179542, -5.678203
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
-3, -3.522607, -6.19666, 0, -0.5, 0.5, 0.5,
-3, -3.522607, -6.19666, 1, -0.5, 0.5, 0.5,
-3, -3.522607, -6.19666, 1, 1.5, 0.5, 0.5,
-3, -3.522607, -6.19666, 0, 1.5, 0.5, 0.5,
-2, -3.522607, -6.19666, 0, -0.5, 0.5, 0.5,
-2, -3.522607, -6.19666, 1, -0.5, 0.5, 0.5,
-2, -3.522607, -6.19666, 1, 1.5, 0.5, 0.5,
-2, -3.522607, -6.19666, 0, 1.5, 0.5, 0.5,
-1, -3.522607, -6.19666, 0, -0.5, 0.5, 0.5,
-1, -3.522607, -6.19666, 1, -0.5, 0.5, 0.5,
-1, -3.522607, -6.19666, 1, 1.5, 0.5, 0.5,
-1, -3.522607, -6.19666, 0, 1.5, 0.5, 0.5,
0, -3.522607, -6.19666, 0, -0.5, 0.5, 0.5,
0, -3.522607, -6.19666, 1, -0.5, 0.5, 0.5,
0, -3.522607, -6.19666, 1, 1.5, 0.5, 0.5,
0, -3.522607, -6.19666, 0, 1.5, 0.5, 0.5,
1, -3.522607, -6.19666, 0, -0.5, 0.5, 0.5,
1, -3.522607, -6.19666, 1, -0.5, 0.5, 0.5,
1, -3.522607, -6.19666, 1, 1.5, 0.5, 0.5,
1, -3.522607, -6.19666, 0, 1.5, 0.5, 0.5,
2, -3.522607, -6.19666, 0, -0.5, 0.5, 0.5,
2, -3.522607, -6.19666, 1, -0.5, 0.5, 0.5,
2, -3.522607, -6.19666, 1, 1.5, 0.5, 0.5,
2, -3.522607, -6.19666, 0, 1.5, 0.5, 0.5,
3, -3.522607, -6.19666, 0, -0.5, 0.5, 0.5,
3, -3.522607, -6.19666, 1, -0.5, 0.5, 0.5,
3, -3.522607, -6.19666, 1, 1.5, 0.5, 0.5,
3, -3.522607, -6.19666, 0, 1.5, 0.5, 0.5
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
-3.126281, -2, -5.418975,
-3.126281, 3, -5.418975,
-3.126281, -2, -5.418975,
-3.283103, -2, -5.678203,
-3.126281, -1, -5.418975,
-3.283103, -1, -5.678203,
-3.126281, 0, -5.418975,
-3.283103, 0, -5.678203,
-3.126281, 1, -5.418975,
-3.283103, 1, -5.678203,
-3.126281, 2, -5.418975,
-3.283103, 2, -5.678203,
-3.126281, 3, -5.418975,
-3.283103, 3, -5.678203
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
-3.596747, -2, -6.19666, 0, -0.5, 0.5, 0.5,
-3.596747, -2, -6.19666, 1, -0.5, 0.5, 0.5,
-3.596747, -2, -6.19666, 1, 1.5, 0.5, 0.5,
-3.596747, -2, -6.19666, 0, 1.5, 0.5, 0.5,
-3.596747, -1, -6.19666, 0, -0.5, 0.5, 0.5,
-3.596747, -1, -6.19666, 1, -0.5, 0.5, 0.5,
-3.596747, -1, -6.19666, 1, 1.5, 0.5, 0.5,
-3.596747, -1, -6.19666, 0, 1.5, 0.5, 0.5,
-3.596747, 0, -6.19666, 0, -0.5, 0.5, 0.5,
-3.596747, 0, -6.19666, 1, -0.5, 0.5, 0.5,
-3.596747, 0, -6.19666, 1, 1.5, 0.5, 0.5,
-3.596747, 0, -6.19666, 0, 1.5, 0.5, 0.5,
-3.596747, 1, -6.19666, 0, -0.5, 0.5, 0.5,
-3.596747, 1, -6.19666, 1, -0.5, 0.5, 0.5,
-3.596747, 1, -6.19666, 1, 1.5, 0.5, 0.5,
-3.596747, 1, -6.19666, 0, 1.5, 0.5, 0.5,
-3.596747, 2, -6.19666, 0, -0.5, 0.5, 0.5,
-3.596747, 2, -6.19666, 1, -0.5, 0.5, 0.5,
-3.596747, 2, -6.19666, 1, 1.5, 0.5, 0.5,
-3.596747, 2, -6.19666, 0, 1.5, 0.5, 0.5,
-3.596747, 3, -6.19666, 0, -0.5, 0.5, 0.5,
-3.596747, 3, -6.19666, 1, -0.5, 0.5, 0.5,
-3.596747, 3, -6.19666, 1, 1.5, 0.5, 0.5,
-3.596747, 3, -6.19666, 0, 1.5, 0.5, 0.5
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
-3.126281, -3.00801, -4,
-3.126281, -3.00801, 4,
-3.126281, -3.00801, -4,
-3.283103, -3.179542, -4,
-3.126281, -3.00801, -2,
-3.283103, -3.179542, -2,
-3.126281, -3.00801, 0,
-3.283103, -3.179542, 0,
-3.126281, -3.00801, 2,
-3.283103, -3.179542, 2,
-3.126281, -3.00801, 4,
-3.283103, -3.179542, 4
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
-3.596747, -3.522607, -4, 0, -0.5, 0.5, 0.5,
-3.596747, -3.522607, -4, 1, -0.5, 0.5, 0.5,
-3.596747, -3.522607, -4, 1, 1.5, 0.5, 0.5,
-3.596747, -3.522607, -4, 0, 1.5, 0.5, 0.5,
-3.596747, -3.522607, -2, 0, -0.5, 0.5, 0.5,
-3.596747, -3.522607, -2, 1, -0.5, 0.5, 0.5,
-3.596747, -3.522607, -2, 1, 1.5, 0.5, 0.5,
-3.596747, -3.522607, -2, 0, 1.5, 0.5, 0.5,
-3.596747, -3.522607, 0, 0, -0.5, 0.5, 0.5,
-3.596747, -3.522607, 0, 1, -0.5, 0.5, 0.5,
-3.596747, -3.522607, 0, 1, 1.5, 0.5, 0.5,
-3.596747, -3.522607, 0, 0, 1.5, 0.5, 0.5,
-3.596747, -3.522607, 2, 0, -0.5, 0.5, 0.5,
-3.596747, -3.522607, 2, 1, -0.5, 0.5, 0.5,
-3.596747, -3.522607, 2, 1, 1.5, 0.5, 0.5,
-3.596747, -3.522607, 2, 0, 1.5, 0.5, 0.5,
-3.596747, -3.522607, 4, 0, -0.5, 0.5, 0.5,
-3.596747, -3.522607, 4, 1, -0.5, 0.5, 0.5,
-3.596747, -3.522607, 4, 1, 1.5, 0.5, 0.5,
-3.596747, -3.522607, 4, 0, 1.5, 0.5, 0.5
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
-3.126281, -3.00801, -5.418975,
-3.126281, 3.853286, -5.418975,
-3.126281, -3.00801, 4.950158,
-3.126281, 3.853286, 4.950158,
-3.126281, -3.00801, -5.418975,
-3.126281, -3.00801, 4.950158,
-3.126281, 3.853286, -5.418975,
-3.126281, 3.853286, 4.950158,
-3.126281, -3.00801, -5.418975,
3.146595, -3.00801, -5.418975,
-3.126281, -3.00801, 4.950158,
3.146595, -3.00801, 4.950158,
-3.126281, 3.853286, -5.418975,
3.146595, 3.853286, -5.418975,
-3.126281, 3.853286, 4.950158,
3.146595, 3.853286, 4.950158,
3.146595, -3.00801, -5.418975,
3.146595, 3.853286, -5.418975,
3.146595, -3.00801, 4.950158,
3.146595, 3.853286, 4.950158,
3.146595, -3.00801, -5.418975,
3.146595, -3.00801, 4.950158,
3.146595, 3.853286, -5.418975,
3.146595, 3.853286, 4.950158
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
var radius = 7.43644;
var distance = 33.08556;
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
mvMatrix.translate( -0.01015687, -0.4226379, 0.2344086 );
mvMatrix.scale( 1.281776, 1.171852, 0.7754192 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08556);
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
Endosulfan<-read.table("Endosulfan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Endosulfan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Endosulfan' not found
```

```r
y<-Endosulfan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Endosulfan' not found
```

```r
z<-Endosulfan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Endosulfan' not found
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
-3.034929, 0.6201894, -2.05561, 0, 0, 1, 1, 1,
-3.030678, 0.397704, -1.251624, 1, 0, 0, 1, 1,
-2.742921, -0.8489927, -1.909237, 1, 0, 0, 1, 1,
-2.714712, -0.9439144, -3.02158, 1, 0, 0, 1, 1,
-2.643984, -0.4128982, -1.509764, 1, 0, 0, 1, 1,
-2.638396, -1.675849, -2.930806, 1, 0, 0, 1, 1,
-2.542452, 1.106473, -1.409789, 0, 0, 0, 1, 1,
-2.492361, -0.4721375, -0.5034557, 0, 0, 0, 1, 1,
-2.466897, 0.555338, -1.263729, 0, 0, 0, 1, 1,
-2.447509, -0.6907727, -1.720813, 0, 0, 0, 1, 1,
-2.428627, -0.2468941, -1.127429, 0, 0, 0, 1, 1,
-2.41261, -0.08310025, -1.734055, 0, 0, 0, 1, 1,
-2.378791, 0.8540723, -2.295052, 0, 0, 0, 1, 1,
-2.303309, 0.8758636, 0.7805823, 1, 1, 1, 1, 1,
-2.26623, -2.231582, -3.951773, 1, 1, 1, 1, 1,
-2.263665, 0.3628002, -1.836093, 1, 1, 1, 1, 1,
-2.24049, 0.8123223, -0.1479955, 1, 1, 1, 1, 1,
-2.205779, -0.6439912, -2.740631, 1, 1, 1, 1, 1,
-2.116757, 1.087332, -0.9524071, 1, 1, 1, 1, 1,
-2.084726, -0.9973571, -1.455616, 1, 1, 1, 1, 1,
-2.077641, 0.857488, -1.849904, 1, 1, 1, 1, 1,
-2.024162, 0.8903598, -0.6526198, 1, 1, 1, 1, 1,
-2.019423, -2.444868, -3.033332, 1, 1, 1, 1, 1,
-2.016864, -0.5758902, -1.944747, 1, 1, 1, 1, 1,
-1.980911, -0.2304169, -3.381961, 1, 1, 1, 1, 1,
-1.971016, -0.6960402, -2.430739, 1, 1, 1, 1, 1,
-1.946628, -0.2821458, -1.947624, 1, 1, 1, 1, 1,
-1.933485, 1.806562, -3.808871, 1, 1, 1, 1, 1,
-1.917822, -0.2487211, -1.678311, 0, 0, 1, 1, 1,
-1.917205, -0.1740591, -3.257481, 1, 0, 0, 1, 1,
-1.887115, 0.9243482, -0.2095542, 1, 0, 0, 1, 1,
-1.860441, -0.4466073, -1.642583, 1, 0, 0, 1, 1,
-1.837044, 0.6928068, -1.068405, 1, 0, 0, 1, 1,
-1.830037, 1.254251, -2.61656, 1, 0, 0, 1, 1,
-1.807426, -0.03864627, -2.814798, 0, 0, 0, 1, 1,
-1.794213, -0.4719206, -0.9661344, 0, 0, 0, 1, 1,
-1.787718, 1.312838, -0.1967444, 0, 0, 0, 1, 1,
-1.750531, -1.06111, -2.592558, 0, 0, 0, 1, 1,
-1.739198, -0.4437391, -1.774731, 0, 0, 0, 1, 1,
-1.73329, 1.444481, -0.2807098, 0, 0, 0, 1, 1,
-1.731109, 0.7684097, -1.640012, 0, 0, 0, 1, 1,
-1.71829, -0.9764997, -2.692001, 1, 1, 1, 1, 1,
-1.707461, -2.155182, -2.354058, 1, 1, 1, 1, 1,
-1.704456, -0.2775673, -0.4575185, 1, 1, 1, 1, 1,
-1.694757, -0.3564722, -0.5791658, 1, 1, 1, 1, 1,
-1.667771, -0.6480768, -1.88911, 1, 1, 1, 1, 1,
-1.652091, 1.574575, -2.943567, 1, 1, 1, 1, 1,
-1.643677, -1.697664, -2.412818, 1, 1, 1, 1, 1,
-1.642339, 0.4263936, -0.8261251, 1, 1, 1, 1, 1,
-1.634618, 1.625668, -1.500428, 1, 1, 1, 1, 1,
-1.63456, 0.6643941, -0.2825565, 1, 1, 1, 1, 1,
-1.631042, 0.3240028, -1.413197, 1, 1, 1, 1, 1,
-1.62196, 0.2338996, -2.210217, 1, 1, 1, 1, 1,
-1.619134, 0.2506537, -1.470855, 1, 1, 1, 1, 1,
-1.617446, -0.7330218, -1.032762, 1, 1, 1, 1, 1,
-1.605296, 0.3394078, -1.059489, 1, 1, 1, 1, 1,
-1.599673, -0.4984913, -3.344677, 0, 0, 1, 1, 1,
-1.594549, 0.3753717, -2.832801, 1, 0, 0, 1, 1,
-1.586334, 1.315991, -0.6015387, 1, 0, 0, 1, 1,
-1.565762, -0.6070668, -0.748628, 1, 0, 0, 1, 1,
-1.527684, 0.961698, -0.6000041, 1, 0, 0, 1, 1,
-1.485099, 0.5034706, -1.887028, 1, 0, 0, 1, 1,
-1.468289, 0.2266197, -1.725191, 0, 0, 0, 1, 1,
-1.461628, 0.8290417, 0.163266, 0, 0, 0, 1, 1,
-1.456341, -0.08405175, -2.084754, 0, 0, 0, 1, 1,
-1.441312, -0.443585, -1.008553, 0, 0, 0, 1, 1,
-1.440461, 0.6441338, -2.915814, 0, 0, 0, 1, 1,
-1.431019, -0.789795, -2.952399, 0, 0, 0, 1, 1,
-1.413041, -0.8288104, -1.106806, 0, 0, 0, 1, 1,
-1.403802, 0.9922163, -0.898016, 1, 1, 1, 1, 1,
-1.393092, 1.463011, -1.71325, 1, 1, 1, 1, 1,
-1.391894, 0.8707194, -1.72563, 1, 1, 1, 1, 1,
-1.390286, 0.4249354, 0.5468551, 1, 1, 1, 1, 1,
-1.386573, -0.04570936, -2.189988, 1, 1, 1, 1, 1,
-1.374038, 0.7517617, -2.279919, 1, 1, 1, 1, 1,
-1.373965, 0.6875083, -0.8009567, 1, 1, 1, 1, 1,
-1.367118, 0.6778182, -1.410497, 1, 1, 1, 1, 1,
-1.347654, 0.5797719, -0.3857603, 1, 1, 1, 1, 1,
-1.345167, -0.6682817, -2.262444, 1, 1, 1, 1, 1,
-1.344698, -1.065512, -2.224178, 1, 1, 1, 1, 1,
-1.344691, 0.5552748, -1.314473, 1, 1, 1, 1, 1,
-1.336926, 1.455962, 1.713131, 1, 1, 1, 1, 1,
-1.323021, 1.153697, -1.354632, 1, 1, 1, 1, 1,
-1.317212, -0.5462004, -0.3984714, 1, 1, 1, 1, 1,
-1.311117, -0.04511231, -2.254777, 0, 0, 1, 1, 1,
-1.299986, 1.014624, -0.3083095, 1, 0, 0, 1, 1,
-1.289196, 0.4932763, -0.4447292, 1, 0, 0, 1, 1,
-1.28256, 0.7791343, -2.324261, 1, 0, 0, 1, 1,
-1.265559, -0.2365639, -3.040941, 1, 0, 0, 1, 1,
-1.263094, 0.5197764, -2.2516, 1, 0, 0, 1, 1,
-1.262041, 0.2419231, -2.408105, 0, 0, 0, 1, 1,
-1.257527, -1.413128, -3.303333, 0, 0, 0, 1, 1,
-1.253829, -0.8033849, -0.4235931, 0, 0, 0, 1, 1,
-1.253644, -0.2840423, -2.846012, 0, 0, 0, 1, 1,
-1.249385, -2.092775, -1.392792, 0, 0, 0, 1, 1,
-1.244062, -0.182228, -2.44128, 0, 0, 0, 1, 1,
-1.24158, -0.07304588, -2.407407, 0, 0, 0, 1, 1,
-1.231559, -1.143902, -2.394687, 1, 1, 1, 1, 1,
-1.227579, 1.228832, -2.06967, 1, 1, 1, 1, 1,
-1.225677, 2.00192, -1.501169, 1, 1, 1, 1, 1,
-1.223577, 0.361818, -2.277888, 1, 1, 1, 1, 1,
-1.22255, 1.428345, -1.069086, 1, 1, 1, 1, 1,
-1.214888, -0.2361588, -3.154036, 1, 1, 1, 1, 1,
-1.214812, 1.383306, 0.2015671, 1, 1, 1, 1, 1,
-1.204174, -0.8139724, -1.972836, 1, 1, 1, 1, 1,
-1.19963, 0.5193321, -1.149411, 1, 1, 1, 1, 1,
-1.199393, 0.2080168, -1.708644, 1, 1, 1, 1, 1,
-1.199071, -0.5035684, -1.516062, 1, 1, 1, 1, 1,
-1.190102, -0.2747616, -0.224213, 1, 1, 1, 1, 1,
-1.185067, 0.07397918, -3.144931, 1, 1, 1, 1, 1,
-1.183806, -0.01466522, -0.9219683, 1, 1, 1, 1, 1,
-1.167634, 0.5050284, -0.6328662, 1, 1, 1, 1, 1,
-1.16394, -0.4019821, -1.814939, 0, 0, 1, 1, 1,
-1.158225, 0.421535, -0.3230455, 1, 0, 0, 1, 1,
-1.153578, -0.6203341, -1.30093, 1, 0, 0, 1, 1,
-1.13557, 1.517807, -0.4610275, 1, 0, 0, 1, 1,
-1.131867, -0.7311177, -2.35038, 1, 0, 0, 1, 1,
-1.131732, 2.343093, -0.7391348, 1, 0, 0, 1, 1,
-1.124393, 0.1428223, -0.6614496, 0, 0, 0, 1, 1,
-1.119022, 0.811857, -2.197001, 0, 0, 0, 1, 1,
-1.114833, -0.04956559, 0.7116914, 0, 0, 0, 1, 1,
-1.104455, 0.243805, -1.163879, 0, 0, 0, 1, 1,
-1.102542, 0.8181399, -2.127619, 0, 0, 0, 1, 1,
-1.09658, -1.249507, -2.266935, 0, 0, 0, 1, 1,
-1.087589, -0.7835628, -2.506047, 0, 0, 0, 1, 1,
-1.080343, 0.5622694, -3.52532, 1, 1, 1, 1, 1,
-1.078625, 0.6662346, -1.057096, 1, 1, 1, 1, 1,
-1.070636, 1.497552, -0.5289996, 1, 1, 1, 1, 1,
-1.067176, -0.1358766, -2.307606, 1, 1, 1, 1, 1,
-1.067004, -1.517353, -1.386692, 1, 1, 1, 1, 1,
-1.06384, -0.3872122, -2.432775, 1, 1, 1, 1, 1,
-1.057715, 0.1059717, -2.379362, 1, 1, 1, 1, 1,
-1.056293, -1.470191, -1.732491, 1, 1, 1, 1, 1,
-1.040134, 1.018894, -0.8355042, 1, 1, 1, 1, 1,
-1.03655, 1.727616, 0.4301679, 1, 1, 1, 1, 1,
-1.032771, 0.9515247, -1.220404, 1, 1, 1, 1, 1,
-1.031723, 0.7728743, -0.1096488, 1, 1, 1, 1, 1,
-1.030608, 0.4794469, -0.6327487, 1, 1, 1, 1, 1,
-1.023559, -0.8509186, -3.260942, 1, 1, 1, 1, 1,
-1.017084, -0.1861131, -0.6054049, 1, 1, 1, 1, 1,
-1.011552, -0.9354165, -2.588589, 0, 0, 1, 1, 1,
-1.008405, 1.03967, 0.06811252, 1, 0, 0, 1, 1,
-1.001806, 0.6852077, -0.1405971, 1, 0, 0, 1, 1,
-0.9992601, -0.7821189, -2.628066, 1, 0, 0, 1, 1,
-0.9985844, 0.8489391, -0.6584942, 1, 0, 0, 1, 1,
-0.9907243, -0.7480524, -3.033314, 1, 0, 0, 1, 1,
-0.9901187, 0.1732206, -1.066552, 0, 0, 0, 1, 1,
-0.989378, 0.6406329, -0.8706804, 0, 0, 0, 1, 1,
-0.9739962, -1.832758, -2.841439, 0, 0, 0, 1, 1,
-0.9710322, -1.27854, -3.598471, 0, 0, 0, 1, 1,
-0.9540588, 0.7245781, -1.482782, 0, 0, 0, 1, 1,
-0.9434905, -0.9285048, -3.028749, 0, 0, 0, 1, 1,
-0.9422323, 0.1322367, -1.80021, 0, 0, 0, 1, 1,
-0.9403136, -1.674896, -3.191639, 1, 1, 1, 1, 1,
-0.939639, -0.6927235, 0.4606679, 1, 1, 1, 1, 1,
-0.9394519, 0.7118231, -0.3992766, 1, 1, 1, 1, 1,
-0.9380898, 0.6483339, -0.4745417, 1, 1, 1, 1, 1,
-0.9367276, 0.7741112, -0.165004, 1, 1, 1, 1, 1,
-0.9220468, -0.1543993, -2.479491, 1, 1, 1, 1, 1,
-0.9219307, -1.187399, -4.012019, 1, 1, 1, 1, 1,
-0.9172494, 0.8805274, -0.8746526, 1, 1, 1, 1, 1,
-0.9144748, 1.826779, 0.5764307, 1, 1, 1, 1, 1,
-0.9110055, -0.7488299, -2.404488, 1, 1, 1, 1, 1,
-0.9103764, 0.1802913, -0.2179271, 1, 1, 1, 1, 1,
-0.9059101, 0.3564653, 0.2767752, 1, 1, 1, 1, 1,
-0.9001557, -0.1068175, -2.14422, 1, 1, 1, 1, 1,
-0.8942919, -0.1891487, -2.403247, 1, 1, 1, 1, 1,
-0.8906399, -0.1555968, -0.4767218, 1, 1, 1, 1, 1,
-0.8823317, 0.8201208, -1.816743, 0, 0, 1, 1, 1,
-0.881032, 1.790852, -1.441005, 1, 0, 0, 1, 1,
-0.8802634, -0.2170225, 0.6408899, 1, 0, 0, 1, 1,
-0.8742383, 0.3446561, 0.4094515, 1, 0, 0, 1, 1,
-0.8707691, 0.1519639, -2.230908, 1, 0, 0, 1, 1,
-0.8704246, 0.4581251, -2.089005, 1, 0, 0, 1, 1,
-0.8692047, 0.3413525, -1.799797, 0, 0, 0, 1, 1,
-0.8669285, -0.461251, -0.9970959, 0, 0, 0, 1, 1,
-0.8618751, 0.7083484, -2.459399, 0, 0, 0, 1, 1,
-0.8614427, 0.1655198, -0.06066227, 0, 0, 0, 1, 1,
-0.856591, 0.01380038, -0.0457308, 0, 0, 0, 1, 1,
-0.8523027, -0.8385409, -1.877696, 0, 0, 0, 1, 1,
-0.8511603, -0.389914, -0.9396033, 0, 0, 0, 1, 1,
-0.8504602, 0.9456993, -1.144843, 1, 1, 1, 1, 1,
-0.8489427, 0.09892301, -1.43024, 1, 1, 1, 1, 1,
-0.8453622, 0.9892707, -1.56551, 1, 1, 1, 1, 1,
-0.84369, -1.028359, -2.947462, 1, 1, 1, 1, 1,
-0.8435647, -0.5717766, -2.901448, 1, 1, 1, 1, 1,
-0.841884, -1.101673, -3.587824, 1, 1, 1, 1, 1,
-0.8407109, -0.7997818, -0.2199713, 1, 1, 1, 1, 1,
-0.8395667, -0.3632951, -1.344529, 1, 1, 1, 1, 1,
-0.8352796, -1.28207, -2.69196, 1, 1, 1, 1, 1,
-0.832223, -0.6105483, -2.079847, 1, 1, 1, 1, 1,
-0.823697, 0.08637155, -1.878929, 1, 1, 1, 1, 1,
-0.8236055, -0.2807543, -1.711812, 1, 1, 1, 1, 1,
-0.8169011, 0.8028032, -0.4287896, 1, 1, 1, 1, 1,
-0.8148642, -2.087752, -3.153356, 1, 1, 1, 1, 1,
-0.810694, 0.2501838, -0.6380749, 1, 1, 1, 1, 1,
-0.8086315, 0.7286927, 0.376294, 0, 0, 1, 1, 1,
-0.8073135, -0.4638115, -1.250649, 1, 0, 0, 1, 1,
-0.8048596, 0.1812294, -0.8714418, 1, 0, 0, 1, 1,
-0.798048, 0.5005322, -2.049489, 1, 0, 0, 1, 1,
-0.7875171, -0.5850686, -2.285401, 1, 0, 0, 1, 1,
-0.7839662, 1.757976, -0.01703299, 1, 0, 0, 1, 1,
-0.7821178, -0.7853655, -3.653539, 0, 0, 0, 1, 1,
-0.7807586, 0.06840321, -1.414979, 0, 0, 0, 1, 1,
-0.7776124, -1.437728, -2.024875, 0, 0, 0, 1, 1,
-0.76994, 0.4226588, -2.431777, 0, 0, 0, 1, 1,
-0.7695607, -0.6048595, -2.984157, 0, 0, 0, 1, 1,
-0.7680378, 1.093195, 0.593985, 0, 0, 0, 1, 1,
-0.7643775, -0.4110931, -0.8500347, 0, 0, 0, 1, 1,
-0.7591859, 1.634022, -1.90545, 1, 1, 1, 1, 1,
-0.7589637, 1.410391, 0.1394983, 1, 1, 1, 1, 1,
-0.7546687, 0.4649669, -0.7516556, 1, 1, 1, 1, 1,
-0.7528765, -0.2148356, -2.50987, 1, 1, 1, 1, 1,
-0.751682, -1.109073, -1.668667, 1, 1, 1, 1, 1,
-0.7442436, 1.405418, 0.7071583, 1, 1, 1, 1, 1,
-0.7407594, 0.1114248, -1.753194, 1, 1, 1, 1, 1,
-0.7405643, -0.8901215, -2.472371, 1, 1, 1, 1, 1,
-0.7370694, 0.268524, -0.9744808, 1, 1, 1, 1, 1,
-0.7366913, 0.005889402, -1.788031, 1, 1, 1, 1, 1,
-0.7319263, 2.001017, 0.4440523, 1, 1, 1, 1, 1,
-0.7315518, 0.7607566, 0.08512414, 1, 1, 1, 1, 1,
-0.727854, 0.2494241, -2.981973, 1, 1, 1, 1, 1,
-0.7268134, -0.908729, -1.31986, 1, 1, 1, 1, 1,
-0.7194653, -0.2160186, -1.2007, 1, 1, 1, 1, 1,
-0.7151883, -0.1710664, -2.113632, 0, 0, 1, 1, 1,
-0.7132726, 2.238281, -0.1811176, 1, 0, 0, 1, 1,
-0.7127439, -1.020679, -1.733864, 1, 0, 0, 1, 1,
-0.7076704, 1.05702, -0.9208966, 1, 0, 0, 1, 1,
-0.7063661, -0.7329726, -1.527065, 1, 0, 0, 1, 1,
-0.7000861, 0.01949573, -1.121291, 1, 0, 0, 1, 1,
-0.6923223, 1.591454, 1.122528, 0, 0, 0, 1, 1,
-0.6899945, -0.6339153, -2.318452, 0, 0, 0, 1, 1,
-0.687638, -0.2372234, -0.7408808, 0, 0, 0, 1, 1,
-0.6869663, -1.056607, -4.09542, 0, 0, 0, 1, 1,
-0.6840566, -1.276699, -2.990429, 0, 0, 0, 1, 1,
-0.6828353, -0.3325267, -1.994725, 0, 0, 0, 1, 1,
-0.6808073, -1.191714, -1.747182, 0, 0, 0, 1, 1,
-0.6775261, 0.01273588, -1.692417, 1, 1, 1, 1, 1,
-0.6732569, -0.9383953, -1.875061, 1, 1, 1, 1, 1,
-0.6701051, -0.06777046, -0.4985174, 1, 1, 1, 1, 1,
-0.6652356, -0.2006362, -1.640668, 1, 1, 1, 1, 1,
-0.6638975, 0.6109852, -1.018921, 1, 1, 1, 1, 1,
-0.6606446, 0.3970242, 0.6234481, 1, 1, 1, 1, 1,
-0.6572043, 0.0354294, -3.092236, 1, 1, 1, 1, 1,
-0.6535128, 0.03129489, -2.384287, 1, 1, 1, 1, 1,
-0.6515075, 1.968743, 1.497508, 1, 1, 1, 1, 1,
-0.6498919, -0.9714317, -1.751076, 1, 1, 1, 1, 1,
-0.6459762, 0.2929611, 1.162078, 1, 1, 1, 1, 1,
-0.6453545, -1.9593, -4.274808, 1, 1, 1, 1, 1,
-0.6447479, -0.341679, -2.347044, 1, 1, 1, 1, 1,
-0.6444976, -1.199935, -0.4849077, 1, 1, 1, 1, 1,
-0.6368457, -0.06118152, -1.573265, 1, 1, 1, 1, 1,
-0.6333899, 0.7039533, -0.2982628, 0, 0, 1, 1, 1,
-0.6282955, 1.866278, -2.438279, 1, 0, 0, 1, 1,
-0.6232618, 0.5056732, -0.8504661, 1, 0, 0, 1, 1,
-0.6232143, -0.5976055, -2.784709, 1, 0, 0, 1, 1,
-0.6217297, -2.320175, -2.418366, 1, 0, 0, 1, 1,
-0.6216738, -0.07663565, -1.527577, 1, 0, 0, 1, 1,
-0.6213732, 0.4927921, -0.01626876, 0, 0, 0, 1, 1,
-0.6186998, -0.4093235, -3.990492, 0, 0, 0, 1, 1,
-0.6130905, 0.004044397, -1.128924, 0, 0, 0, 1, 1,
-0.6084099, -1.217024, -2.798641, 0, 0, 0, 1, 1,
-0.6062169, 0.5266765, -2.012073, 0, 0, 0, 1, 1,
-0.6030249, 1.466543, -1.107987, 0, 0, 0, 1, 1,
-0.5998756, 2.430558, 0.09751878, 0, 0, 0, 1, 1,
-0.5981644, -0.2996154, -0.6923339, 1, 1, 1, 1, 1,
-0.5946749, -0.0006899952, -0.8158895, 1, 1, 1, 1, 1,
-0.5939218, -1.324039, -2.654595, 1, 1, 1, 1, 1,
-0.5931411, -1.403781, -2.083205, 1, 1, 1, 1, 1,
-0.5915734, -0.2142302, -1.758889, 1, 1, 1, 1, 1,
-0.5887844, -0.2866706, -2.292949, 1, 1, 1, 1, 1,
-0.5809544, -1.199227, -2.179164, 1, 1, 1, 1, 1,
-0.5776787, -1.456403, -4.085114, 1, 1, 1, 1, 1,
-0.5767633, -0.7774051, -2.54207, 1, 1, 1, 1, 1,
-0.5746001, -1.117414, -3.871728, 1, 1, 1, 1, 1,
-0.5745878, -0.9286059, -3.609338, 1, 1, 1, 1, 1,
-0.5718451, -0.06768873, -0.6366823, 1, 1, 1, 1, 1,
-0.5711225, 0.6934746, -0.3532241, 1, 1, 1, 1, 1,
-0.5707293, -1.064221, -3.27314, 1, 1, 1, 1, 1,
-0.5689917, 0.8731145, -0.5358003, 1, 1, 1, 1, 1,
-0.56299, -0.8333506, -2.349996, 0, 0, 1, 1, 1,
-0.5607404, 0.3772264, -1.60885, 1, 0, 0, 1, 1,
-0.5584843, 1.529369, -1.615368, 1, 0, 0, 1, 1,
-0.5535637, 1.807023, -0.316076, 1, 0, 0, 1, 1,
-0.5517442, 0.3512792, -0.420492, 1, 0, 0, 1, 1,
-0.5460969, 0.1356528, -0.158761, 1, 0, 0, 1, 1,
-0.5428982, -0.6552252, -2.242981, 0, 0, 0, 1, 1,
-0.5411449, -1.186148, -2.534045, 0, 0, 0, 1, 1,
-0.5382766, 1.536034, -0.4171331, 0, 0, 0, 1, 1,
-0.5284681, 0.6837732, -0.06455838, 0, 0, 0, 1, 1,
-0.5277278, -0.3286084, -2.792874, 0, 0, 0, 1, 1,
-0.5256792, -0.06888169, -3.093106, 0, 0, 0, 1, 1,
-0.5225132, -0.3316382, -1.632924, 0, 0, 0, 1, 1,
-0.51943, 0.6901373, -1.308969, 1, 1, 1, 1, 1,
-0.5175019, -0.9499974, -3.173502, 1, 1, 1, 1, 1,
-0.5169114, -0.4994013, -1.334156, 1, 1, 1, 1, 1,
-0.5153058, -0.3667144, -3.094516, 1, 1, 1, 1, 1,
-0.5133661, 0.1169875, -3.197666, 1, 1, 1, 1, 1,
-0.5124854, 1.190795, -0.420053, 1, 1, 1, 1, 1,
-0.5109737, -0.1970199, -3.012833, 1, 1, 1, 1, 1,
-0.5079193, -0.9994891, -3.179657, 1, 1, 1, 1, 1,
-0.5048846, 1.541453, 0.7946156, 1, 1, 1, 1, 1,
-0.5009759, -1.266614, -4.355294, 1, 1, 1, 1, 1,
-0.4944711, 0.5227628, -0.1651424, 1, 1, 1, 1, 1,
-0.4941307, 1.041489, -0.9601819, 1, 1, 1, 1, 1,
-0.489024, -0.4378123, -1.676082, 1, 1, 1, 1, 1,
-0.4882848, -0.835546, -1.728455, 1, 1, 1, 1, 1,
-0.485745, 1.199139, 0.9774185, 1, 1, 1, 1, 1,
-0.4843691, 1.324868, 0.8610253, 0, 0, 1, 1, 1,
-0.476092, -1.249795, -2.253341, 1, 0, 0, 1, 1,
-0.4760278, 0.005387395, -0.8900987, 1, 0, 0, 1, 1,
-0.4731799, -2.081915, -2.40116, 1, 0, 0, 1, 1,
-0.4696894, -0.9743863, -2.058098, 1, 0, 0, 1, 1,
-0.4645095, 1.145391, -1.759166, 1, 0, 0, 1, 1,
-0.464041, -0.07978056, -1.181065, 0, 0, 0, 1, 1,
-0.4635052, -1.336035, -2.531234, 0, 0, 0, 1, 1,
-0.462694, 0.5381023, -2.85535, 0, 0, 0, 1, 1,
-0.4618275, -1.073871, -1.306538, 0, 0, 0, 1, 1,
-0.4595535, -1.928241, -2.140146, 0, 0, 0, 1, 1,
-0.4587274, 1.17245, -0.7141079, 0, 0, 0, 1, 1,
-0.4580653, -0.6308498, -1.895503, 0, 0, 0, 1, 1,
-0.4531633, -0.3284311, -0.7981204, 1, 1, 1, 1, 1,
-0.4491995, 0.4532196, -0.8556317, 1, 1, 1, 1, 1,
-0.4445611, -0.482857, -2.377064, 1, 1, 1, 1, 1,
-0.4403786, 0.7514822, 0.573347, 1, 1, 1, 1, 1,
-0.4308349, -0.7749732, -1.729931, 1, 1, 1, 1, 1,
-0.4262334, 1.713276, 0.4494172, 1, 1, 1, 1, 1,
-0.4256315, 0.605772, -1.764037, 1, 1, 1, 1, 1,
-0.4243124, 0.1409022, 0.2095138, 1, 1, 1, 1, 1,
-0.4086787, 0.5765514, 0.531799, 1, 1, 1, 1, 1,
-0.405025, 0.1055007, -0.8350366, 1, 1, 1, 1, 1,
-0.4036385, 1.40945, -0.2611921, 1, 1, 1, 1, 1,
-0.3910741, -0.3609626, -2.998104, 1, 1, 1, 1, 1,
-0.3877614, -0.2349315, -1.74851, 1, 1, 1, 1, 1,
-0.3809271, -0.2902846, -1.707227, 1, 1, 1, 1, 1,
-0.3803528, 0.7636879, -0.7316536, 1, 1, 1, 1, 1,
-0.3793049, -2.153056, -4.746667, 0, 0, 1, 1, 1,
-0.3790616, 0.4704633, 0.6606043, 1, 0, 0, 1, 1,
-0.3771734, -0.4483036, -1.971729, 1, 0, 0, 1, 1,
-0.3761013, -1.920484, -1.88094, 1, 0, 0, 1, 1,
-0.3737913, 0.3919348, -0.9437153, 1, 0, 0, 1, 1,
-0.3735884, -0.6539358, -1.602002, 1, 0, 0, 1, 1,
-0.372141, 0.5063394, 0.4613604, 0, 0, 0, 1, 1,
-0.367715, 1.357641, -1.088817, 0, 0, 0, 1, 1,
-0.3660632, 0.4762791, 0.3969015, 0, 0, 0, 1, 1,
-0.3626358, 1.29501, 1.390685, 0, 0, 0, 1, 1,
-0.3615028, 0.07874911, -1.615341, 0, 0, 0, 1, 1,
-0.3569199, -0.3923954, -2.139598, 0, 0, 0, 1, 1,
-0.3422682, 1.913899, -0.339121, 0, 0, 0, 1, 1,
-0.334852, 1.414824, -0.5206734, 1, 1, 1, 1, 1,
-0.3296104, -0.09170257, -1.044726, 1, 1, 1, 1, 1,
-0.3289421, 0.7700442, 0.6789609, 1, 1, 1, 1, 1,
-0.3258438, 0.1144023, -1.531745, 1, 1, 1, 1, 1,
-0.3231781, 0.641306, -0.8901347, 1, 1, 1, 1, 1,
-0.3212869, -0.8068682, -2.351934, 1, 1, 1, 1, 1,
-0.315741, -0.4490116, -2.379279, 1, 1, 1, 1, 1,
-0.3140075, 1.005845, -1.36627, 1, 1, 1, 1, 1,
-0.3088074, 0.4664058, -1.662161, 1, 1, 1, 1, 1,
-0.3056548, 0.01799479, -1.967993, 1, 1, 1, 1, 1,
-0.3000256, 0.9640238, -0.3645516, 1, 1, 1, 1, 1,
-0.2991768, 0.5595185, -1.122782, 1, 1, 1, 1, 1,
-0.2971923, -0.478925, -3.38528, 1, 1, 1, 1, 1,
-0.2947583, 1.9392, 1.397409, 1, 1, 1, 1, 1,
-0.2941907, -0.1110269, -2.230457, 1, 1, 1, 1, 1,
-0.2935661, -1.217334, -2.240188, 0, 0, 1, 1, 1,
-0.291501, -0.08008263, -1.55597, 1, 0, 0, 1, 1,
-0.2889977, -2.233867, -3.849192, 1, 0, 0, 1, 1,
-0.2876778, -0.07175965, -2.943143, 1, 0, 0, 1, 1,
-0.2853315, -1.320139, -3.104336, 1, 0, 0, 1, 1,
-0.2809585, -1.033176, -2.245179, 1, 0, 0, 1, 1,
-0.2806682, -0.3087184, -3.416072, 0, 0, 0, 1, 1,
-0.2794611, -0.835425, -3.435252, 0, 0, 0, 1, 1,
-0.2768869, -0.6330501, -3.88035, 0, 0, 0, 1, 1,
-0.2732976, 2.122154, 0.5006461, 0, 0, 0, 1, 1,
-0.270691, 1.523282, 0.3056621, 0, 0, 0, 1, 1,
-0.2679585, -1.665431, -5.169689, 0, 0, 0, 1, 1,
-0.2664846, 0.7717414, -1.749925, 0, 0, 0, 1, 1,
-0.2660488, -0.3908149, -3.290076, 1, 1, 1, 1, 1,
-0.2656498, 0.544715, 0.7169082, 1, 1, 1, 1, 1,
-0.2617139, -1.052062, -2.435303, 1, 1, 1, 1, 1,
-0.2594244, -2.272064, -1.96581, 1, 1, 1, 1, 1,
-0.2578259, -0.5438324, -3.120209, 1, 1, 1, 1, 1,
-0.2566745, -0.4909465, -4.152219, 1, 1, 1, 1, 1,
-0.2548354, 0.1065318, 0.2932272, 1, 1, 1, 1, 1,
-0.2528264, 0.01531116, -0.5322691, 1, 1, 1, 1, 1,
-0.2517608, 0.2749969, -0.9598861, 1, 1, 1, 1, 1,
-0.2501042, -0.1712001, -1.082345, 1, 1, 1, 1, 1,
-0.2496962, -0.7290208, -2.004408, 1, 1, 1, 1, 1,
-0.2495938, 0.8658319, -1.160065, 1, 1, 1, 1, 1,
-0.2420083, -1.355787, -2.807233, 1, 1, 1, 1, 1,
-0.2346011, -2.908088, -1.567142, 1, 1, 1, 1, 1,
-0.2334172, 0.1779341, -1.568627, 1, 1, 1, 1, 1,
-0.2248392, -0.4027028, -2.873485, 0, 0, 1, 1, 1,
-0.2222696, 0.1966998, -0.500739, 1, 0, 0, 1, 1,
-0.2210758, 0.1475366, 0.573059, 1, 0, 0, 1, 1,
-0.2202256, -0.7558531, -2.191919, 1, 0, 0, 1, 1,
-0.2184056, 1.474978, 0.7060028, 1, 0, 0, 1, 1,
-0.2134044, -1.714704, -2.345978, 1, 0, 0, 1, 1,
-0.2115561, 0.8679034, 0.3012923, 0, 0, 0, 1, 1,
-0.2082306, -0.382552, -2.628333, 0, 0, 0, 1, 1,
-0.2037039, 1.14681, -1.525694, 0, 0, 0, 1, 1,
-0.2030698, -0.1452005, -2.634799, 0, 0, 0, 1, 1,
-0.2019911, 0.4795532, -0.164502, 0, 0, 0, 1, 1,
-0.1992148, -0.1759963, -3.605342, 0, 0, 0, 1, 1,
-0.1969794, 1.026221, -0.3466909, 0, 0, 0, 1, 1,
-0.1964676, 0.645299, -1.164989, 1, 1, 1, 1, 1,
-0.1942303, -0.3992169, -2.793652, 1, 1, 1, 1, 1,
-0.1904273, 0.4852159, 0.6765214, 1, 1, 1, 1, 1,
-0.1862922, -0.3376215, -1.993818, 1, 1, 1, 1, 1,
-0.1855788, -0.6347099, -3.901849, 1, 1, 1, 1, 1,
-0.1840432, 0.9851682, 0.6936163, 1, 1, 1, 1, 1,
-0.1791757, -0.4781781, -2.340279, 1, 1, 1, 1, 1,
-0.177233, -1.184308, -1.124925, 1, 1, 1, 1, 1,
-0.176923, -1.023616, -3.546785, 1, 1, 1, 1, 1,
-0.1698157, 2.049433, -0.2154711, 1, 1, 1, 1, 1,
-0.1675797, -0.3570892, -3.965365, 1, 1, 1, 1, 1,
-0.1633551, -1.357257, -4.701605, 1, 1, 1, 1, 1,
-0.1625021, 0.7969411, 1.979442, 1, 1, 1, 1, 1,
-0.1617946, -2.425992, -3.535877, 1, 1, 1, 1, 1,
-0.1575129, 0.1369514, -1.742487, 1, 1, 1, 1, 1,
-0.1564209, -0.6546177, -1.332156, 0, 0, 1, 1, 1,
-0.1519328, -1.031098, -3.513691, 1, 0, 0, 1, 1,
-0.1468745, 0.7351495, 0.1412699, 1, 0, 0, 1, 1,
-0.1460981, -0.09348539, -2.840565, 1, 0, 0, 1, 1,
-0.1446069, 0.2893135, -0.2563752, 1, 0, 0, 1, 1,
-0.1382627, 0.9609273, -2.016105, 1, 0, 0, 1, 1,
-0.1378169, -0.776421, -2.817004, 0, 0, 0, 1, 1,
-0.1344269, 0.4762543, 0.4872199, 0, 0, 0, 1, 1,
-0.1300821, 1.15672, -1.054116, 0, 0, 0, 1, 1,
-0.1291261, -1.183611, -1.53152, 0, 0, 0, 1, 1,
-0.1286315, 0.7828021, 0.5498706, 0, 0, 0, 1, 1,
-0.1243466, -2.490563, -1.726007, 0, 0, 0, 1, 1,
-0.1234875, 0.08972861, -0.643246, 0, 0, 0, 1, 1,
-0.1233965, -0.7026764, -3.311828, 1, 1, 1, 1, 1,
-0.1225938, 1.625411, -0.7898791, 1, 1, 1, 1, 1,
-0.1216339, -2.510616, -2.438879, 1, 1, 1, 1, 1,
-0.1184515, 0.2853638, -2.885251, 1, 1, 1, 1, 1,
-0.1153294, 0.02512918, -2.283944, 1, 1, 1, 1, 1,
-0.1142557, -0.852165, -2.783317, 1, 1, 1, 1, 1,
-0.1128708, 0.04432512, -0.5902982, 1, 1, 1, 1, 1,
-0.1124395, -1.336839, -5.182909, 1, 1, 1, 1, 1,
-0.1090438, -0.7396556, -1.24163, 1, 1, 1, 1, 1,
-0.1082708, 0.4111099, -1.066111, 1, 1, 1, 1, 1,
-0.1070035, -0.7335966, -2.833023, 1, 1, 1, 1, 1,
-0.1068878, 0.4104837, 1.064184, 1, 1, 1, 1, 1,
-0.1062492, -0.9628937, -5.267968, 1, 1, 1, 1, 1,
-0.1048986, 0.5679615, 0.7924421, 1, 1, 1, 1, 1,
-0.1036077, -1.081938, -2.049791, 1, 1, 1, 1, 1,
-0.1020057, -1.037521, -2.751882, 0, 0, 1, 1, 1,
-0.1019268, -0.6949634, -3.529658, 1, 0, 0, 1, 1,
-0.08956158, 1.233385, 0.8948792, 1, 0, 0, 1, 1,
-0.08838245, -0.5726733, -3.215112, 1, 0, 0, 1, 1,
-0.08500852, 0.06021511, -1.92779, 1, 0, 0, 1, 1,
-0.07821, -2.040482, -2.860468, 1, 0, 0, 1, 1,
-0.07295612, 0.3272987, 0.3829789, 0, 0, 0, 1, 1,
-0.06872898, -0.6288844, -3.014153, 0, 0, 0, 1, 1,
-0.06388245, 1.98295, -2.239337, 0, 0, 0, 1, 1,
-0.06083669, -0.2391516, -1.227062, 0, 0, 0, 1, 1,
-0.06040859, 0.9790863, 0.7000373, 0, 0, 0, 1, 1,
-0.05720011, -0.0127005, 0.2380941, 0, 0, 0, 1, 1,
-0.05456637, 0.6583297, -0.8192017, 0, 0, 0, 1, 1,
-0.05120726, -0.5514241, -2.805742, 1, 1, 1, 1, 1,
-0.04828595, -0.4810875, -1.751391, 1, 1, 1, 1, 1,
-0.04576286, 1.884808, 1.388227, 1, 1, 1, 1, 1,
-0.04259543, 1.299532, 1.623054, 1, 1, 1, 1, 1,
-0.04226547, -0.3607701, -3.688452, 1, 1, 1, 1, 1,
-0.03815703, 0.4271168, 0.1645914, 1, 1, 1, 1, 1,
-0.03685171, 0.8573408, -0.6880322, 1, 1, 1, 1, 1,
-0.03399213, -0.1470987, -2.915186, 1, 1, 1, 1, 1,
-0.03234857, -1.841334, -2.739937, 1, 1, 1, 1, 1,
-0.0300537, 1.547998, 0.3457341, 1, 1, 1, 1, 1,
-0.02888937, -1.142257, -4.304336, 1, 1, 1, 1, 1,
-0.02856663, -0.8600107, -3.576912, 1, 1, 1, 1, 1,
-0.02790721, 2.063918, 0.7419186, 1, 1, 1, 1, 1,
-0.02537527, -1.760888, -1.807856, 1, 1, 1, 1, 1,
-0.02281652, 0.6575003, -0.7194871, 1, 1, 1, 1, 1,
-0.01988996, 0.986825, -0.2245096, 0, 0, 1, 1, 1,
-0.01985939, -1.169596, -3.734907, 1, 0, 0, 1, 1,
-0.0165188, -0.7847036, -2.940083, 1, 0, 0, 1, 1,
-0.01536172, 1.104174, -0.2761245, 1, 0, 0, 1, 1,
-0.00828771, -0.967973, -2.773029, 1, 0, 0, 1, 1,
-0.006291196, -0.9994619, -2.896317, 1, 0, 0, 1, 1,
-0.004579044, -1.999707, -4.111145, 0, 0, 0, 1, 1,
-0.002980815, 0.5496737, -0.3071072, 0, 0, 0, 1, 1,
-0.002246864, 1.195755, 0.4393123, 0, 0, 0, 1, 1,
-0.0008261356, -1.162793, -1.778017, 0, 0, 0, 1, 1,
0.004430148, 1.047508, -0.5037271, 0, 0, 0, 1, 1,
0.006983655, -0.8609363, 2.17672, 0, 0, 0, 1, 1,
0.007414266, -0.2219005, 3.590504, 0, 0, 0, 1, 1,
0.009572268, -0.5025507, 2.818123, 1, 1, 1, 1, 1,
0.009580933, 1.268719, 0.2361722, 1, 1, 1, 1, 1,
0.009961493, 0.1747885, 1.683132, 1, 1, 1, 1, 1,
0.01173824, -0.761611, 4.525392, 1, 1, 1, 1, 1,
0.0141777, 1.08391, -0.008904052, 1, 1, 1, 1, 1,
0.01594992, -0.4330335, 2.131371, 1, 1, 1, 1, 1,
0.01859223, -1.80684, 2.28196, 1, 1, 1, 1, 1,
0.01884089, 1.022308, -0.2412481, 1, 1, 1, 1, 1,
0.01984138, -0.467815, 3.418481, 1, 1, 1, 1, 1,
0.02464969, 0.4727074, 1.533957, 1, 1, 1, 1, 1,
0.02694836, 0.9342002, 0.544737, 1, 1, 1, 1, 1,
0.02950433, 0.7213235, 0.1487907, 1, 1, 1, 1, 1,
0.03043233, -0.2867275, 2.146461, 1, 1, 1, 1, 1,
0.03746827, -0.6748659, 2.31225, 1, 1, 1, 1, 1,
0.03978239, 0.3036171, -0.8575577, 1, 1, 1, 1, 1,
0.04147862, 1.172718, -1.528214, 0, 0, 1, 1, 1,
0.04403626, -1.439524, 4.636723, 1, 0, 0, 1, 1,
0.04506667, -1.378018, 2.675714, 1, 0, 0, 1, 1,
0.04511277, -0.9869668, 4.755154, 1, 0, 0, 1, 1,
0.04654615, -1.062406, 1.338158, 1, 0, 0, 1, 1,
0.04777655, 0.6027555, 0.6212034, 1, 0, 0, 1, 1,
0.04990271, 0.01585451, -1.07294, 0, 0, 0, 1, 1,
0.05009793, -1.495168, 1.288954, 0, 0, 0, 1, 1,
0.05635554, 2.179433, -0.211018, 0, 0, 0, 1, 1,
0.05876279, -0.4544455, 4.715859, 0, 0, 0, 1, 1,
0.05987373, -0.8352645, 3.311608, 0, 0, 0, 1, 1,
0.06096278, -0.3371645, 3.966855, 0, 0, 0, 1, 1,
0.06239715, 0.1758963, 1.483254, 0, 0, 0, 1, 1,
0.06497292, 0.518454, 1.129498, 1, 1, 1, 1, 1,
0.06603922, 0.04289511, -0.08934059, 1, 1, 1, 1, 1,
0.0702261, -0.8233985, 4.235902, 1, 1, 1, 1, 1,
0.07123213, -2.074497, 3.78371, 1, 1, 1, 1, 1,
0.07130651, 0.126518, -1.445286, 1, 1, 1, 1, 1,
0.07551577, 1.220462, 1.321488, 1, 1, 1, 1, 1,
0.07729252, -0.7609681, 4.799151, 1, 1, 1, 1, 1,
0.0840336, -0.488438, 3.050964, 1, 1, 1, 1, 1,
0.08650824, -0.8314674, 3.950941, 1, 1, 1, 1, 1,
0.08997452, 0.5048493, -0.5666214, 1, 1, 1, 1, 1,
0.09275344, 1.0416, -2.111387, 1, 1, 1, 1, 1,
0.0931771, -0.3273956, 1.856444, 1, 1, 1, 1, 1,
0.09539953, -0.84918, 0.9758245, 1, 1, 1, 1, 1,
0.09549382, 0.7295132, 1.128846, 1, 1, 1, 1, 1,
0.09757631, 1.597899, 1.361538, 1, 1, 1, 1, 1,
0.1009209, -0.4072028, 3.085526, 0, 0, 1, 1, 1,
0.1033754, 1.280834, -0.01260178, 1, 0, 0, 1, 1,
0.1056629, 1.362754, 0.4053654, 1, 0, 0, 1, 1,
0.1060247, -1.916942, 3.594155, 1, 0, 0, 1, 1,
0.1108829, -1.533933, 3.223738, 1, 0, 0, 1, 1,
0.1169671, -1.004063, 1.939451, 1, 0, 0, 1, 1,
0.1171443, 1.081957, 1.208468, 0, 0, 0, 1, 1,
0.1180065, -1.81459, 2.289801, 0, 0, 0, 1, 1,
0.1211927, -1.091555, 3.331562, 0, 0, 0, 1, 1,
0.1223269, 1.185871, 0.3101391, 0, 0, 0, 1, 1,
0.1227419, -2.204277, 2.225228, 0, 0, 0, 1, 1,
0.1255465, 0.1593239, 0.9950555, 0, 0, 0, 1, 1,
0.1269536, 0.3263244, 0.774487, 0, 0, 0, 1, 1,
0.1301888, -1.274582, 3.059566, 1, 1, 1, 1, 1,
0.1306967, 0.1303973, -1.90065, 1, 1, 1, 1, 1,
0.1360619, -1.556011, 2.542125, 1, 1, 1, 1, 1,
0.1366484, 1.060237, 1.758739, 1, 1, 1, 1, 1,
0.1373743, -0.1020388, 1.792733, 1, 1, 1, 1, 1,
0.1387613, -0.6237495, 4.60066, 1, 1, 1, 1, 1,
0.1440895, -0.7995518, 2.321424, 1, 1, 1, 1, 1,
0.1443476, -0.4289939, 4.275602, 1, 1, 1, 1, 1,
0.1474639, 0.4702727, 0.5945805, 1, 1, 1, 1, 1,
0.1522735, 0.3792747, 1.459983, 1, 1, 1, 1, 1,
0.1583394, -0.2803291, 3.428255, 1, 1, 1, 1, 1,
0.1640785, 1.385007, 0.3819536, 1, 1, 1, 1, 1,
0.1670116, -1.386345, 0.8435779, 1, 1, 1, 1, 1,
0.1672913, 1.403143, 0.1316104, 1, 1, 1, 1, 1,
0.167491, 0.1404436, 3.967629, 1, 1, 1, 1, 1,
0.1687609, 0.4722598, 1.342332, 0, 0, 1, 1, 1,
0.1697591, 0.844179, 0.2486431, 1, 0, 0, 1, 1,
0.1702984, 0.26508, 1.396785, 1, 0, 0, 1, 1,
0.1742783, 0.3997327, 1.02291, 1, 0, 0, 1, 1,
0.1748133, 0.5552449, -1.955041, 1, 0, 0, 1, 1,
0.1848627, 0.1954654, 0.8841438, 1, 0, 0, 1, 1,
0.1890901, -0.5167666, 3.646401, 0, 0, 0, 1, 1,
0.1924557, 0.5871364, -0.2819744, 0, 0, 0, 1, 1,
0.1949516, 0.4077835, 1.565619, 0, 0, 0, 1, 1,
0.1966635, 0.07604163, 0.9464715, 0, 0, 0, 1, 1,
0.1968332, -0.1630331, 2.955965, 0, 0, 0, 1, 1,
0.2006991, -1.542913, 4.291833, 0, 0, 0, 1, 1,
0.2051026, -1.128412, 3.318467, 0, 0, 0, 1, 1,
0.2052916, -0.04488779, 2.627318, 1, 1, 1, 1, 1,
0.2061854, 1.155595, -0.05417195, 1, 1, 1, 1, 1,
0.2088557, 0.2560656, 0.9854622, 1, 1, 1, 1, 1,
0.2088585, 0.3725657, -0.0710976, 1, 1, 1, 1, 1,
0.2103794, 0.9492703, -0.01585318, 1, 1, 1, 1, 1,
0.2132785, 2.226356, 0.2711435, 1, 1, 1, 1, 1,
0.2167122, 0.293345, -0.9330464, 1, 1, 1, 1, 1,
0.2184478, -0.846271, 3.83032, 1, 1, 1, 1, 1,
0.2251571, 1.479313, -0.8058357, 1, 1, 1, 1, 1,
0.2287442, -0.1559399, -0.1795925, 1, 1, 1, 1, 1,
0.2322871, 0.0800715, 1.814912, 1, 1, 1, 1, 1,
0.2370577, 1.426243, -0.3920425, 1, 1, 1, 1, 1,
0.2384485, 0.05605514, 0.4963886, 1, 1, 1, 1, 1,
0.2391366, -0.5003097, 2.731386, 1, 1, 1, 1, 1,
0.2401224, 0.436275, 0.05570631, 1, 1, 1, 1, 1,
0.2407582, 1.209217, 1.673753, 0, 0, 1, 1, 1,
0.2430623, -1.685115, 2.850461, 1, 0, 0, 1, 1,
0.2466414, 1.160791, 0.9479212, 1, 0, 0, 1, 1,
0.2508246, 0.7744159, -0.01361228, 1, 0, 0, 1, 1,
0.2516783, 0.2383752, 0.8285113, 1, 0, 0, 1, 1,
0.2543658, -0.4463943, 4.261871, 1, 0, 0, 1, 1,
0.2554429, 0.7391121, 0.4902131, 0, 0, 0, 1, 1,
0.2559608, -0.4500773, 2.948278, 0, 0, 0, 1, 1,
0.2599794, 0.08348972, 2.000249, 0, 0, 0, 1, 1,
0.2600818, 0.6739882, 0.8806732, 0, 0, 0, 1, 1,
0.2607824, -0.3834828, 1.799128, 0, 0, 0, 1, 1,
0.2610713, -1.449214, 3.443599, 0, 0, 0, 1, 1,
0.2680835, 2.630873, -0.6166141, 0, 0, 0, 1, 1,
0.2694804, -0.805347, 2.343568, 1, 1, 1, 1, 1,
0.269807, 0.6218621, -0.3764184, 1, 1, 1, 1, 1,
0.2709691, 0.1397518, 0.4870878, 1, 1, 1, 1, 1,
0.2725227, 0.1679765, 0.5665175, 1, 1, 1, 1, 1,
0.2742344, -1.176124, 2.527296, 1, 1, 1, 1, 1,
0.2774018, -1.222833, 3.503211, 1, 1, 1, 1, 1,
0.280578, -0.9498757, 3.23772, 1, 1, 1, 1, 1,
0.2817132, -0.9603167, 3.282081, 1, 1, 1, 1, 1,
0.2826185, -0.2498646, 1.960688, 1, 1, 1, 1, 1,
0.2827528, -0.7517898, 1.038399, 1, 1, 1, 1, 1,
0.2855068, 0.9880188, 0.357724, 1, 1, 1, 1, 1,
0.289571, -0.1084982, 1.755519, 1, 1, 1, 1, 1,
0.2903488, -0.8270836, 1.475597, 1, 1, 1, 1, 1,
0.2984128, -0.3751988, 0.933396, 1, 1, 1, 1, 1,
0.2998676, -0.8223514, 2.364132, 1, 1, 1, 1, 1,
0.3050857, -0.2174375, 3.709679, 0, 0, 1, 1, 1,
0.3075677, 0.9483555, -0.6414883, 1, 0, 0, 1, 1,
0.3122007, 0.8993897, -1.296524, 1, 0, 0, 1, 1,
0.312216, 0.3331858, 1.085063, 1, 0, 0, 1, 1,
0.3148373, -0.5386955, 2.896102, 1, 0, 0, 1, 1,
0.3161665, -1.017214, 0.2392341, 1, 0, 0, 1, 1,
0.3183576, -0.268343, 2.222796, 0, 0, 0, 1, 1,
0.3185968, 0.4515625, -1.224744, 0, 0, 0, 1, 1,
0.3198285, 0.172219, 1.161603, 0, 0, 0, 1, 1,
0.3216392, -0.8148402, 1.194617, 0, 0, 0, 1, 1,
0.3218673, 1.808096, 1.42966, 0, 0, 0, 1, 1,
0.3240386, -0.1113892, 0.02563679, 0, 0, 0, 1, 1,
0.3247206, -2.428943, 2.630356, 0, 0, 0, 1, 1,
0.326026, -0.5584182, 1.796947, 1, 1, 1, 1, 1,
0.3291144, -0.7358238, 2.734945, 1, 1, 1, 1, 1,
0.3297547, 0.8054171, 0.265984, 1, 1, 1, 1, 1,
0.3299664, 0.126529, -0.1033826, 1, 1, 1, 1, 1,
0.3307902, 0.6793323, 0.4724175, 1, 1, 1, 1, 1,
0.3364516, -0.8027707, 1.654829, 1, 1, 1, 1, 1,
0.341116, -0.1022353, 0.4822904, 1, 1, 1, 1, 1,
0.3421999, -1.329277, 1.837445, 1, 1, 1, 1, 1,
0.3426634, 1.477804, 0.2444545, 1, 1, 1, 1, 1,
0.3427304, -1.052793, 3.227285, 1, 1, 1, 1, 1,
0.3461476, -0.7108077, 2.12634, 1, 1, 1, 1, 1,
0.3481563, 0.6097971, 0.2061036, 1, 1, 1, 1, 1,
0.3482333, 0.4203638, 1.515612, 1, 1, 1, 1, 1,
0.3554004, 0.5582383, 1.375773, 1, 1, 1, 1, 1,
0.3555509, -1.227032, 2.638994, 1, 1, 1, 1, 1,
0.3559987, -0.4646194, 4.59295, 0, 0, 1, 1, 1,
0.3592581, 2.043623, -0.9230232, 1, 0, 0, 1, 1,
0.3605379, 1.238117, -1.303063, 1, 0, 0, 1, 1,
0.3625373, -1.948778, -0.4646841, 1, 0, 0, 1, 1,
0.3655276, 0.6586214, 0.6695257, 1, 0, 0, 1, 1,
0.3675456, -2.102577, 2.557677, 1, 0, 0, 1, 1,
0.3708315, 0.05523833, 1.966131, 0, 0, 0, 1, 1,
0.3746369, -0.4087953, 1.877219, 0, 0, 0, 1, 1,
0.3764432, -1.241922, 4.071216, 0, 0, 0, 1, 1,
0.3768652, -0.01450577, 0.7060347, 0, 0, 0, 1, 1,
0.3783653, -2.693825, 2.047201, 0, 0, 0, 1, 1,
0.3819848, -1.109594, 2.832954, 0, 0, 0, 1, 1,
0.3846951, 0.3160194, 1.210023, 0, 0, 0, 1, 1,
0.3864761, 0.3821626, 0.4999882, 1, 1, 1, 1, 1,
0.3870992, -0.7216659, 0.5362741, 1, 1, 1, 1, 1,
0.3945474, -0.6453207, 2.040522, 1, 1, 1, 1, 1,
0.3945726, 0.09948022, 0.618609, 1, 1, 1, 1, 1,
0.3947825, -1.096919, 3.108957, 1, 1, 1, 1, 1,
0.3955518, 0.1657771, 1.744132, 1, 1, 1, 1, 1,
0.39617, -0.1806868, 4.290308, 1, 1, 1, 1, 1,
0.3966205, 0.9247859, 0.7481177, 1, 1, 1, 1, 1,
0.4036669, -0.3365216, 2.157955, 1, 1, 1, 1, 1,
0.4053465, -0.06311666, 1.793788, 1, 1, 1, 1, 1,
0.4058771, 0.6878767, 1.123845, 1, 1, 1, 1, 1,
0.4176303, -1.501649, 2.628863, 1, 1, 1, 1, 1,
0.4179946, 0.6861131, 1.865646, 1, 1, 1, 1, 1,
0.417996, 1.005702, 0.06662527, 1, 1, 1, 1, 1,
0.4202497, 1.066404, -0.900885, 1, 1, 1, 1, 1,
0.4227732, 0.1351625, 1.981757, 0, 0, 1, 1, 1,
0.4229124, -0.508957, 2.977096, 1, 0, 0, 1, 1,
0.4263875, 0.6319308, 0.5671093, 1, 0, 0, 1, 1,
0.4283666, 0.7630682, -0.7328026, 1, 0, 0, 1, 1,
0.4381091, -1.555653, 4.250195, 1, 0, 0, 1, 1,
0.4414014, 0.09574379, 3.676956, 1, 0, 0, 1, 1,
0.4457561, -0.958598, 1.052409, 0, 0, 0, 1, 1,
0.4458426, 0.1075377, 2.066104, 0, 0, 0, 1, 1,
0.4477822, 0.7420834, 0.1137002, 0, 0, 0, 1, 1,
0.4493166, -0.7655848, 1.183024, 0, 0, 0, 1, 1,
0.4547547, -0.4450351, 1.078217, 0, 0, 0, 1, 1,
0.4581208, -1.54013, 4.221097, 0, 0, 0, 1, 1,
0.4590278, 1.223985, 0.06289797, 0, 0, 0, 1, 1,
0.4599779, 1.988461, 1.469221, 1, 1, 1, 1, 1,
0.463809, 0.6921087, 1.855186, 1, 1, 1, 1, 1,
0.465617, -0.7699214, 3.38429, 1, 1, 1, 1, 1,
0.4668527, 0.2780246, 2.160296, 1, 1, 1, 1, 1,
0.468059, -0.1590925, 2.185688, 1, 1, 1, 1, 1,
0.4699145, 0.599044, -0.2019104, 1, 1, 1, 1, 1,
0.4755723, 0.2839631, 1.821295, 1, 1, 1, 1, 1,
0.4762024, -0.6500274, 3.248931, 1, 1, 1, 1, 1,
0.4784727, 1.125535, 1.122188, 1, 1, 1, 1, 1,
0.4795991, 0.9955307, 1.740924, 1, 1, 1, 1, 1,
0.4798569, -1.981203, 4.365031, 1, 1, 1, 1, 1,
0.480008, 1.267418, -0.2950339, 1, 1, 1, 1, 1,
0.4863987, -0.8491191, 2.949946, 1, 1, 1, 1, 1,
0.4905425, -1.013271, 2.583534, 1, 1, 1, 1, 1,
0.4961604, 0.6410493, 1.123633, 1, 1, 1, 1, 1,
0.4983878, -0.1077199, 2.28089, 0, 0, 1, 1, 1,
0.5010045, -0.1920809, 0.873256, 1, 0, 0, 1, 1,
0.509024, 0.3036861, 2.241343, 1, 0, 0, 1, 1,
0.5150188, 0.655617, -0.7063451, 1, 0, 0, 1, 1,
0.5164683, -0.0997007, 2.234774, 1, 0, 0, 1, 1,
0.5171496, 0.1439129, 2.202705, 1, 0, 0, 1, 1,
0.5182326, -0.07832048, 1.748699, 0, 0, 0, 1, 1,
0.5214717, 1.380516, 0.5208313, 0, 0, 0, 1, 1,
0.5224504, -0.4576911, 1.603146, 0, 0, 0, 1, 1,
0.5239185, -0.2899771, 1.358304, 0, 0, 0, 1, 1,
0.5240551, 0.9222549, 0.895743, 0, 0, 0, 1, 1,
0.5252162, -1.739224, 2.169656, 0, 0, 0, 1, 1,
0.5263828, 0.6517836, 1.911583, 0, 0, 0, 1, 1,
0.5278411, 2.238758, -1.146163, 1, 1, 1, 1, 1,
0.5289246, 0.8657479, -0.07622556, 1, 1, 1, 1, 1,
0.5289516, -1.831243, 3.61566, 1, 1, 1, 1, 1,
0.5337206, 0.04679319, 1.127509, 1, 1, 1, 1, 1,
0.5360615, -0.3136312, 3.574858, 1, 1, 1, 1, 1,
0.5360733, 0.5244476, 0.7081921, 1, 1, 1, 1, 1,
0.5376678, -1.303931, 2.084339, 1, 1, 1, 1, 1,
0.5395864, 1.452793, -1.154672, 1, 1, 1, 1, 1,
0.5410646, -2.345639, 3.371222, 1, 1, 1, 1, 1,
0.5423409, 1.494169, 0.8409718, 1, 1, 1, 1, 1,
0.5428824, -0.7328002, 3.889268, 1, 1, 1, 1, 1,
0.5459515, 0.3312998, 0.5640938, 1, 1, 1, 1, 1,
0.5505215, 3.753364, -0.2700494, 1, 1, 1, 1, 1,
0.5531573, -0.0810454, 1.844469, 1, 1, 1, 1, 1,
0.5536574, -0.5113704, 3.621011, 1, 1, 1, 1, 1,
0.5663459, 0.676071, 2.421414, 0, 0, 1, 1, 1,
0.5685347, 0.6543741, 1.978638, 1, 0, 0, 1, 1,
0.5726867, 0.9834999, 0.2869998, 1, 0, 0, 1, 1,
0.5731211, 2.443999, 1.295528, 1, 0, 0, 1, 1,
0.5733185, 0.3835285, -1.028984, 1, 0, 0, 1, 1,
0.5738587, -0.2782673, 2.690185, 1, 0, 0, 1, 1,
0.5742368, -1.663176, 2.056988, 0, 0, 0, 1, 1,
0.5749299, 0.9233824, 1.128436, 0, 0, 0, 1, 1,
0.5784765, 0.7618783, 1.864016, 0, 0, 0, 1, 1,
0.5809936, 1.288929, -0.7106759, 0, 0, 0, 1, 1,
0.5829565, 0.2768752, 1.016193, 0, 0, 0, 1, 1,
0.5893289, 0.1843474, 2.712089, 0, 0, 0, 1, 1,
0.5898122, 1.115979, 0.6414219, 0, 0, 0, 1, 1,
0.5984027, -2.032088, 3.354494, 1, 1, 1, 1, 1,
0.5994946, 1.252186, 0.0637458, 1, 1, 1, 1, 1,
0.6006975, -0.5711028, 3.627864, 1, 1, 1, 1, 1,
0.6045439, 0.1123507, 1.048676, 1, 1, 1, 1, 1,
0.6045948, -1.251981, 2.217096, 1, 1, 1, 1, 1,
0.618118, 1.538447, 0.7360819, 1, 1, 1, 1, 1,
0.6225979, 0.6227163, -0.8361881, 1, 1, 1, 1, 1,
0.624585, 0.5843121, 1.251631, 1, 1, 1, 1, 1,
0.6266659, 1.398844, -1.338204, 1, 1, 1, 1, 1,
0.6266739, -0.8890437, 2.416404, 1, 1, 1, 1, 1,
0.6284229, -0.1461738, 1.849064, 1, 1, 1, 1, 1,
0.6287428, 1.246369, 1.946943, 1, 1, 1, 1, 1,
0.6308523, -0.714485, 3.996966, 1, 1, 1, 1, 1,
0.6382573, -0.4614059, 2.151702, 1, 1, 1, 1, 1,
0.638308, -1.03713, 3.855937, 1, 1, 1, 1, 1,
0.6399441, 0.4584309, 1.273261, 0, 0, 1, 1, 1,
0.6439712, -0.04144286, 2.574844, 1, 0, 0, 1, 1,
0.6443886, -1.381701, 1.818967, 1, 0, 0, 1, 1,
0.6454718, -2.069684, 2.875893, 1, 0, 0, 1, 1,
0.6486648, 1.268579, -1.105886, 1, 0, 0, 1, 1,
0.6490875, 0.137675, 0.1062915, 1, 0, 0, 1, 1,
0.6498024, -1.151231, 2.041055, 0, 0, 0, 1, 1,
0.6510746, -0.3322631, 2.039023, 0, 0, 0, 1, 1,
0.6531057, -0.7379253, 2.937931, 0, 0, 0, 1, 1,
0.6593776, 0.2995048, 1.821559, 0, 0, 0, 1, 1,
0.661791, -1.437858, 3.685927, 0, 0, 0, 1, 1,
0.662147, 1.834473, -0.172029, 0, 0, 0, 1, 1,
0.6633536, -0.03694955, 2.737583, 0, 0, 0, 1, 1,
0.6712282, 1.774254, 0.3223326, 1, 1, 1, 1, 1,
0.6787156, -0.6887993, 2.604414, 1, 1, 1, 1, 1,
0.6793445, 1.171601, 1.275441, 1, 1, 1, 1, 1,
0.6880308, -0.2216392, 2.875802, 1, 1, 1, 1, 1,
0.6968423, 0.4936767, 0.3272465, 1, 1, 1, 1, 1,
0.6997871, 0.4182419, -0.01904758, 1, 1, 1, 1, 1,
0.7048007, 0.2841188, -0.7272595, 1, 1, 1, 1, 1,
0.708476, -1.031259, 2.109205, 1, 1, 1, 1, 1,
0.7197003, 0.03191815, 0.7266324, 1, 1, 1, 1, 1,
0.7197614, 0.8488889, 2.207669, 1, 1, 1, 1, 1,
0.7197614, 0.9129638, 1.120999, 1, 1, 1, 1, 1,
0.7228739, -0.9604347, 2.168763, 1, 1, 1, 1, 1,
0.7241387, 1.066102, -0.4940235, 1, 1, 1, 1, 1,
0.7257714, 0.6219465, -1.005004, 1, 1, 1, 1, 1,
0.7270693, -1.170048, 1.076123, 1, 1, 1, 1, 1,
0.7294648, 0.1636544, 2.938962, 0, 0, 1, 1, 1,
0.7348133, 0.1526076, 1.331656, 1, 0, 0, 1, 1,
0.7362784, 0.285794, 2.029884, 1, 0, 0, 1, 1,
0.7363418, -0.8609524, 1.195422, 1, 0, 0, 1, 1,
0.7391264, -0.04374514, 2.625091, 1, 0, 0, 1, 1,
0.7458638, 1.534617, -0.03409873, 1, 0, 0, 1, 1,
0.7467995, -1.90962, 3.019762, 0, 0, 0, 1, 1,
0.7570216, -2.002371, 2.138543, 0, 0, 0, 1, 1,
0.7589735, -0.4487193, 1.657492, 0, 0, 0, 1, 1,
0.7642746, 1.115824, 0.2451336, 0, 0, 0, 1, 1,
0.7743419, 1.247248, 2.491347, 0, 0, 0, 1, 1,
0.7789695, -1.603731, 2.534347, 0, 0, 0, 1, 1,
0.7797401, 0.698702, -0.4339139, 0, 0, 0, 1, 1,
0.7807546, 1.079686, 0.7731925, 1, 1, 1, 1, 1,
0.7811071, -0.4181441, 3.234398, 1, 1, 1, 1, 1,
0.7811493, -0.5876458, 3.796613, 1, 1, 1, 1, 1,
0.785694, 0.2690954, 1.684044, 1, 1, 1, 1, 1,
0.7865729, -0.2072157, 0.3418721, 1, 1, 1, 1, 1,
0.7881985, -1.24249, 0.9996257, 1, 1, 1, 1, 1,
0.7884325, -0.9121307, 3.765331, 1, 1, 1, 1, 1,
0.7909887, 2.177991, 0.2927574, 1, 1, 1, 1, 1,
0.7935636, -0.3377022, 0.336263, 1, 1, 1, 1, 1,
0.7944282, 0.2564052, -1.153958, 1, 1, 1, 1, 1,
0.7954417, -1.414461, 2.636858, 1, 1, 1, 1, 1,
0.80409, 0.8577557, 0.1415267, 1, 1, 1, 1, 1,
0.8051308, 0.7241195, 2.411731, 1, 1, 1, 1, 1,
0.8094163, -0.174062, 1.250434, 1, 1, 1, 1, 1,
0.8098167, 0.05298237, 1.023218, 1, 1, 1, 1, 1,
0.8142132, -0.06980188, 3.254394, 0, 0, 1, 1, 1,
0.8221039, 0.5241348, 0.7463055, 1, 0, 0, 1, 1,
0.8263747, 0.5798551, -0.4313766, 1, 0, 0, 1, 1,
0.8278733, -2.792843, 2.363452, 1, 0, 0, 1, 1,
0.8300312, -0.08338669, 2.334478, 1, 0, 0, 1, 1,
0.8359631, 0.9186805, -0.9886607, 1, 0, 0, 1, 1,
0.8369265, 0.4795595, 0.03749421, 0, 0, 0, 1, 1,
0.8394989, 0.6038125, 1.239176, 0, 0, 0, 1, 1,
0.841458, -1.153216, 1.172602, 0, 0, 0, 1, 1,
0.8429301, -0.1927229, 1.714319, 0, 0, 0, 1, 1,
0.8439155, 1.456428, 0.5062284, 0, 0, 0, 1, 1,
0.8458442, 0.4601353, 0.6549789, 0, 0, 0, 1, 1,
0.8557739, 0.3123313, 0.2863365, 0, 0, 0, 1, 1,
0.8604801, -1.601143, 1.732106, 1, 1, 1, 1, 1,
0.8606907, 0.1780438, -1.063722, 1, 1, 1, 1, 1,
0.8619704, -0.2884623, 1.529451, 1, 1, 1, 1, 1,
0.8641776, -0.7556436, 3.060404, 1, 1, 1, 1, 1,
0.8661458, -0.05979974, 2.78873, 1, 1, 1, 1, 1,
0.877494, 1.023552, 0.8850099, 1, 1, 1, 1, 1,
0.8775138, -0.3161956, 1.738114, 1, 1, 1, 1, 1,
0.8855547, -1.812776, 1.469969, 1, 1, 1, 1, 1,
0.8948237, -0.9202046, 1.957205, 1, 1, 1, 1, 1,
0.9085472, -0.9903826, 2.293638, 1, 1, 1, 1, 1,
0.9148819, 1.16653, 1.761584, 1, 1, 1, 1, 1,
0.9149764, 0.006564396, 1.095389, 1, 1, 1, 1, 1,
0.9157006, -0.6141315, 0.9889755, 1, 1, 1, 1, 1,
0.923569, 1.083685, 0.7357442, 1, 1, 1, 1, 1,
0.9288915, -0.0966128, 0.9015251, 1, 1, 1, 1, 1,
0.9310091, 0.005668646, 3.282482, 0, 0, 1, 1, 1,
0.9322597, 0.256538, 2.573199, 1, 0, 0, 1, 1,
0.9327111, 0.3843482, 1.877549, 1, 0, 0, 1, 1,
0.9384177, 1.465856, 1.967794, 1, 0, 0, 1, 1,
0.9397591, -0.2714176, 2.064591, 1, 0, 0, 1, 1,
0.9404628, -1.184984, 3.046859, 1, 0, 0, 1, 1,
0.9456697, -1.878423, 3.725171, 0, 0, 0, 1, 1,
0.9472224, 0.3799717, 1.392649, 0, 0, 0, 1, 1,
0.9485974, 0.4713261, 0.7899656, 0, 0, 0, 1, 1,
0.9488926, -0.2180322, 1.478153, 0, 0, 0, 1, 1,
0.9501965, 0.9091648, 0.521839, 0, 0, 0, 1, 1,
0.9611412, -0.3752355, 0.3820601, 0, 0, 0, 1, 1,
0.9611915, -0.1493403, -0.3092875, 0, 0, 0, 1, 1,
0.9635016, -0.2814603, 2.129904, 1, 1, 1, 1, 1,
0.9693423, 1.818643, -0.9602694, 1, 1, 1, 1, 1,
0.9737805, 0.8110797, 0.5863872, 1, 1, 1, 1, 1,
0.9745632, 0.5336761, 1.940696, 1, 1, 1, 1, 1,
0.9780602, 1.377729, 0.02871992, 1, 1, 1, 1, 1,
0.9854791, 0.8621029, 1.002622, 1, 1, 1, 1, 1,
0.9864247, 0.1608298, 1.568956, 1, 1, 1, 1, 1,
0.9867356, 1.513465, 0.9660646, 1, 1, 1, 1, 1,
0.9867907, -1.581812, 1.787038, 1, 1, 1, 1, 1,
0.9884099, -0.105159, 1.464249, 1, 1, 1, 1, 1,
0.9947708, -2.478351, 2.266988, 1, 1, 1, 1, 1,
0.9953046, -0.549298, 1.43169, 1, 1, 1, 1, 1,
0.9985572, 0.7256005, 0.5100854, 1, 1, 1, 1, 1,
1.004121, -1.108379, 1.635581, 1, 1, 1, 1, 1,
1.007557, -0.2416521, 3.282082, 1, 1, 1, 1, 1,
1.008803, 1.749983, -1.738054, 0, 0, 1, 1, 1,
1.01784, -0.406693, 3.629929, 1, 0, 0, 1, 1,
1.022402, 0.9295651, 0.3813547, 1, 0, 0, 1, 1,
1.034123, 1.275365, 0.9625871, 1, 0, 0, 1, 1,
1.038433, 0.05228728, 1.145049, 1, 0, 0, 1, 1,
1.042748, -1.042223, 2.009961, 1, 0, 0, 1, 1,
1.046057, -0.08176113, 1.412048, 0, 0, 0, 1, 1,
1.048418, -0.73315, 2.866261, 0, 0, 0, 1, 1,
1.049758, 0.925896, 0.5633982, 0, 0, 0, 1, 1,
1.051064, -0.8533794, 2.885456, 0, 0, 0, 1, 1,
1.052623, -0.631714, 2.476916, 0, 0, 0, 1, 1,
1.055254, -2.065422, 0.3392547, 0, 0, 0, 1, 1,
1.059458, 0.3655591, 0.3078051, 0, 0, 0, 1, 1,
1.07034, 0.2715883, 0.9748341, 1, 1, 1, 1, 1,
1.082125, 1.527003, -0.1395399, 1, 1, 1, 1, 1,
1.087791, 1.152758, 0.2716595, 1, 1, 1, 1, 1,
1.097548, 1.680372, 0.6072375, 1, 1, 1, 1, 1,
1.101876, -0.8975375, 3.07437, 1, 1, 1, 1, 1,
1.102676, -0.5625865, 3.272289, 1, 1, 1, 1, 1,
1.105978, -0.2852378, 1.871352, 1, 1, 1, 1, 1,
1.108355, 1.111481, 1.654084, 1, 1, 1, 1, 1,
1.115933, 1.034505, 1.418993, 1, 1, 1, 1, 1,
1.116694, 1.152483, 1.139522, 1, 1, 1, 1, 1,
1.117795, -0.3189845, -0.1010391, 1, 1, 1, 1, 1,
1.121365, 0.6423524, 0.4470687, 1, 1, 1, 1, 1,
1.124822, -1.918356, 1.699646, 1, 1, 1, 1, 1,
1.125618, 0.2448751, 2.777621, 1, 1, 1, 1, 1,
1.134902, -0.8738228, 1.754043, 1, 1, 1, 1, 1,
1.138711, 1.756625, 1.302016, 0, 0, 1, 1, 1,
1.14296, 0.416868, 1.342724, 1, 0, 0, 1, 1,
1.147247, 0.7324768, 0.7382473, 1, 0, 0, 1, 1,
1.149971, 0.1636029, 2.183472, 1, 0, 0, 1, 1,
1.150537, 0.4536347, 0.7367826, 1, 0, 0, 1, 1,
1.15655, 1.500844, 0.2964403, 1, 0, 0, 1, 1,
1.16336, -0.5575239, 0.3632902, 0, 0, 0, 1, 1,
1.173757, -1.887344, 1.245079, 0, 0, 0, 1, 1,
1.175563, -0.4192918, 1.313506, 0, 0, 0, 1, 1,
1.177916, -1.641107, 2.090079, 0, 0, 0, 1, 1,
1.178621, -0.5899603, 1.465645, 0, 0, 0, 1, 1,
1.180239, -1.079157, 1.994172, 0, 0, 0, 1, 1,
1.214371, 1.220154, 0.3823313, 0, 0, 0, 1, 1,
1.217412, 0.8064899, 2.9752, 1, 1, 1, 1, 1,
1.226484, -1.007049, 0.9318469, 1, 1, 1, 1, 1,
1.227965, 0.2877907, 0.4699609, 1, 1, 1, 1, 1,
1.243146, -0.3845981, 3.315856, 1, 1, 1, 1, 1,
1.244551, 0.670921, 0.7901579, 1, 1, 1, 1, 1,
1.24629, 0.711277, 0.8850625, 1, 1, 1, 1, 1,
1.248369, -0.31247, 0.8167859, 1, 1, 1, 1, 1,
1.249215, -0.9528649, 2.043409, 1, 1, 1, 1, 1,
1.24973, 1.491981, -0.6006199, 1, 1, 1, 1, 1,
1.268907, 0.4916867, 1.05863, 1, 1, 1, 1, 1,
1.277926, 0.849562, 0.4300516, 1, 1, 1, 1, 1,
1.282798, 1.345847, 1.603631, 1, 1, 1, 1, 1,
1.295069, -0.7570884, 2.606717, 1, 1, 1, 1, 1,
1.298544, 1.572404, 0.9748699, 1, 1, 1, 1, 1,
1.307522, 0.168026, 1.850303, 1, 1, 1, 1, 1,
1.312382, 0.5671877, 3.002596, 0, 0, 1, 1, 1,
1.312896, -0.7873892, 0.5690896, 1, 0, 0, 1, 1,
1.31339, -1.379393, 2.556361, 1, 0, 0, 1, 1,
1.314386, -0.7473306, 2.312953, 1, 0, 0, 1, 1,
1.318948, 0.2141303, 2.220552, 1, 0, 0, 1, 1,
1.326534, 0.8166562, 0.7395055, 1, 0, 0, 1, 1,
1.331389, -0.272945, 3.314533, 0, 0, 0, 1, 1,
1.340665, -0.5278139, 0.8340986, 0, 0, 0, 1, 1,
1.344901, 0.3663882, 1.510977, 0, 0, 0, 1, 1,
1.354354, 0.7161101, -0.6396379, 0, 0, 0, 1, 1,
1.378763, -0.0455598, 1.171024, 0, 0, 0, 1, 1,
1.38173, -0.1896648, 0.06232418, 0, 0, 0, 1, 1,
1.402011, -0.04068396, 1.779151, 0, 0, 0, 1, 1,
1.413949, 1.278085, 2.113849, 1, 1, 1, 1, 1,
1.424638, 0.09383986, 0.9317431, 1, 1, 1, 1, 1,
1.433078, -1.060083, 2.259983, 1, 1, 1, 1, 1,
1.434445, -0.8880344, 0.6930957, 1, 1, 1, 1, 1,
1.439232, -1.025146, 2.400356, 1, 1, 1, 1, 1,
1.449205, -0.7548856, 1.447207, 1, 1, 1, 1, 1,
1.452667, -1.307193, 2.748221, 1, 1, 1, 1, 1,
1.455569, -0.3534319, 1.857105, 1, 1, 1, 1, 1,
1.455957, 1.712713, 0.2547702, 1, 1, 1, 1, 1,
1.456851, -0.2594359, 3.001019, 1, 1, 1, 1, 1,
1.469728, -0.7885663, 3.116497, 1, 1, 1, 1, 1,
1.493279, -0.1606829, -0.4322949, 1, 1, 1, 1, 1,
1.496674, -1.026436, 3.560932, 1, 1, 1, 1, 1,
1.521206, -2.377088, 3.538246, 1, 1, 1, 1, 1,
1.539652, -0.4064242, 1.079278, 1, 1, 1, 1, 1,
1.541071, -1.600441, 1.437935, 0, 0, 1, 1, 1,
1.566012, 0.7227312, -2.052633, 1, 0, 0, 1, 1,
1.566438, 0.2627741, 0.268732, 1, 0, 0, 1, 1,
1.58303, 0.03185077, 1.989405, 1, 0, 0, 1, 1,
1.597124, -0.4414371, 1.656711, 1, 0, 0, 1, 1,
1.616344, 0.1825414, 1.896487, 1, 0, 0, 1, 1,
1.633446, -1.114053, 1.758078, 0, 0, 0, 1, 1,
1.637342, 1.035574, 0.1560776, 0, 0, 0, 1, 1,
1.673367, -1.008056, 2.324858, 0, 0, 0, 1, 1,
1.67989, 0.9549816, 0.7490329, 0, 0, 0, 1, 1,
1.682743, 0.1854245, 0.963003, 0, 0, 0, 1, 1,
1.68578, 0.1020631, 1.002208, 0, 0, 0, 1, 1,
1.693765, -1.578391, 2.318818, 0, 0, 0, 1, 1,
1.702354, -0.02949778, 0.7370994, 1, 1, 1, 1, 1,
1.707235, -1.177781, 3.297792, 1, 1, 1, 1, 1,
1.707637, -0.836989, 0.702037, 1, 1, 1, 1, 1,
1.715264, 0.0140927, 2.479328, 1, 1, 1, 1, 1,
1.744986, 2.610503, -0.7190344, 1, 1, 1, 1, 1,
1.746948, 0.6481101, 1.962469, 1, 1, 1, 1, 1,
1.775779, 1.466825, 0.6500906, 1, 1, 1, 1, 1,
1.791087, -0.6253357, 2.354643, 1, 1, 1, 1, 1,
1.815349, 1.032942, 1.100525, 1, 1, 1, 1, 1,
1.829068, -0.295013, 1.879475, 1, 1, 1, 1, 1,
1.856517, -0.7044765, 2.341123, 1, 1, 1, 1, 1,
1.877767, -1.309441, 0.3024036, 1, 1, 1, 1, 1,
1.913094, -0.1228629, 2.70822, 1, 1, 1, 1, 1,
1.988306, 0.3377284, 2.013875, 1, 1, 1, 1, 1,
2.027008, 0.67914, 0.9439305, 1, 1, 1, 1, 1,
2.028124, -0.192461, 1.558907, 0, 0, 1, 1, 1,
2.047702, 0.02782252, 2.142566, 1, 0, 0, 1, 1,
2.053941, 0.01305625, 2.034972, 1, 0, 0, 1, 1,
2.065581, -0.552922, 1.109367, 1, 0, 0, 1, 1,
2.085194, 1.164465, 0.9920546, 1, 0, 0, 1, 1,
2.088179, 0.3689377, -0.02515369, 1, 0, 0, 1, 1,
2.101782, -0.56836, 1.001192, 0, 0, 0, 1, 1,
2.132255, -0.1097756, 1.085916, 0, 0, 0, 1, 1,
2.133782, 0.9062505, 1.594463, 0, 0, 0, 1, 1,
2.161093, 0.990061, 1.295969, 0, 0, 0, 1, 1,
2.17736, -0.1027565, 2.968146, 0, 0, 0, 1, 1,
2.183567, 0.08517373, 0.1272477, 0, 0, 0, 1, 1,
2.250802, 2.259715, 2.667358, 0, 0, 0, 1, 1,
2.301162, -0.6773726, 2.632197, 1, 1, 1, 1, 1,
2.550971, -0.4860087, 1.252035, 1, 1, 1, 1, 1,
2.71133, -0.3230269, 1.605906, 1, 1, 1, 1, 1,
2.741604, -0.08359383, 2.856339, 1, 1, 1, 1, 1,
2.886868, 0.1488989, 2.345215, 1, 1, 1, 1, 1,
2.905496, -0.1644568, 1.387576, 1, 1, 1, 1, 1,
3.055243, 0.2244452, 1.563505, 1, 1, 1, 1, 1
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
var radius = 9.302758;
var distance = 32.67554;
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
mvMatrix.translate( -0.01015663, -0.4226378, 0.2344086 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.67554);
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
