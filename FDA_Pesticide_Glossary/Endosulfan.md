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
-3.040449, -0.5318428, -2.709188, 1, 0, 0, 1,
-2.952406, -1.255659, 0.1642457, 1, 0.007843138, 0, 1,
-2.934181, -1.124421, -3.371543, 1, 0.01176471, 0, 1,
-2.734765, 0.02395165, -2.797775, 1, 0.01960784, 0, 1,
-2.661949, -1.659624, -1.960205, 1, 0.02352941, 0, 1,
-2.574862, 0.2806785, -1.416587, 1, 0.03137255, 0, 1,
-2.476488, -0.4426835, 1.189362, 1, 0.03529412, 0, 1,
-2.420069, -0.3376116, -3.050962, 1, 0.04313726, 0, 1,
-2.330737, -0.364522, -2.059005, 1, 0.04705882, 0, 1,
-2.267722, -0.3651369, -0.3229477, 1, 0.05490196, 0, 1,
-2.240864, 0.7264218, -3.448287, 1, 0.05882353, 0, 1,
-2.212711, -1.013981, -1.107813, 1, 0.06666667, 0, 1,
-2.172661, 0.2866098, 0.02601073, 1, 0.07058824, 0, 1,
-2.164313, -0.008540433, -2.438916, 1, 0.07843138, 0, 1,
-2.155026, 1.666001, -2.821978, 1, 0.08235294, 0, 1,
-2.140237, -0.455306, -0.811883, 1, 0.09019608, 0, 1,
-2.111561, 1.004943, -2.006964, 1, 0.09411765, 0, 1,
-2.105839, 0.1881758, -1.520513, 1, 0.1019608, 0, 1,
-2.094051, -0.5798641, -1.675475, 1, 0.1098039, 0, 1,
-2.091813, -2.642719, -2.283149, 1, 0.1137255, 0, 1,
-2.035167, 1.910973, -0.4961215, 1, 0.1215686, 0, 1,
-2.0154, 1.088657, -1.784699, 1, 0.1254902, 0, 1,
-1.997867, 0.1545152, -0.04762925, 1, 0.1333333, 0, 1,
-1.988041, -0.7808816, -0.8937326, 1, 0.1372549, 0, 1,
-1.974621, -0.2015792, -1.183437, 1, 0.145098, 0, 1,
-1.965246, -1.029307, -2.265828, 1, 0.1490196, 0, 1,
-1.948195, -0.07928109, -1.803467, 1, 0.1568628, 0, 1,
-1.923284, -0.04922671, -0.1504932, 1, 0.1607843, 0, 1,
-1.91332, -1.954557, -3.527795, 1, 0.1686275, 0, 1,
-1.904259, -0.6594683, -2.748806, 1, 0.172549, 0, 1,
-1.880359, 1.314657, -1.651888, 1, 0.1803922, 0, 1,
-1.857512, -0.1148381, -0.7568132, 1, 0.1843137, 0, 1,
-1.793498, 0.7703939, -1.063008, 1, 0.1921569, 0, 1,
-1.780496, 0.7182795, -2.06338, 1, 0.1960784, 0, 1,
-1.767498, -0.3531546, -1.068408, 1, 0.2039216, 0, 1,
-1.760863, -1.465441, -3.623323, 1, 0.2117647, 0, 1,
-1.755889, 1.017639, -0.5186679, 1, 0.2156863, 0, 1,
-1.753046, -0.7391238, -1.778045, 1, 0.2235294, 0, 1,
-1.746752, 2.028043, 0.5109265, 1, 0.227451, 0, 1,
-1.73142, -1.00208, -3.670071, 1, 0.2352941, 0, 1,
-1.719683, -0.9325688, -1.632465, 1, 0.2392157, 0, 1,
-1.718425, -0.8729481, -1.882181, 1, 0.2470588, 0, 1,
-1.716859, -1.28153, -1.269944, 1, 0.2509804, 0, 1,
-1.697342, -0.8685337, -3.531992, 1, 0.2588235, 0, 1,
-1.692231, -0.04828374, -1.182088, 1, 0.2627451, 0, 1,
-1.690948, 0.2001675, -1.451198, 1, 0.2705882, 0, 1,
-1.690926, 0.7663772, 0.2261148, 1, 0.2745098, 0, 1,
-1.6732, -0.5276899, -3.235844, 1, 0.282353, 0, 1,
-1.668537, 1.420059, -0.00626647, 1, 0.2862745, 0, 1,
-1.638753, -0.4334517, -1.802932, 1, 0.2941177, 0, 1,
-1.638576, 1.242334, -1.346778, 1, 0.3019608, 0, 1,
-1.634793, 0.9429694, -0.7900155, 1, 0.3058824, 0, 1,
-1.620423, 0.5727324, -2.178534, 1, 0.3137255, 0, 1,
-1.609706, -1.621885, -3.158765, 1, 0.3176471, 0, 1,
-1.609347, 0.1577355, -1.000199, 1, 0.3254902, 0, 1,
-1.609171, -0.1396823, -2.737987, 1, 0.3294118, 0, 1,
-1.597069, 2.700321, -3.461941, 1, 0.3372549, 0, 1,
-1.594226, -1.201504, -2.965499, 1, 0.3411765, 0, 1,
-1.584131, -1.948913, -1.936376, 1, 0.3490196, 0, 1,
-1.583181, -0.8872358, -3.438502, 1, 0.3529412, 0, 1,
-1.566186, 0.4054833, 0.02425246, 1, 0.3607843, 0, 1,
-1.560058, 2.001752, -2.330197, 1, 0.3647059, 0, 1,
-1.558446, -1.614845, -2.794765, 1, 0.372549, 0, 1,
-1.557839, -0.9170073, -3.347939, 1, 0.3764706, 0, 1,
-1.55516, 0.05963976, -0.8698839, 1, 0.3843137, 0, 1,
-1.546495, 0.6853257, -1.084925, 1, 0.3882353, 0, 1,
-1.545814, 0.07827564, -1.547623, 1, 0.3960784, 0, 1,
-1.531981, -0.4904853, -1.328307, 1, 0.4039216, 0, 1,
-1.528569, -1.336271, -0.7160131, 1, 0.4078431, 0, 1,
-1.522318, 1.616779, -1.125058, 1, 0.4156863, 0, 1,
-1.519459, 0.6529983, -2.257715, 1, 0.4196078, 0, 1,
-1.517721, -0.2669086, -1.329089, 1, 0.427451, 0, 1,
-1.514132, 0.6988906, -0.3233065, 1, 0.4313726, 0, 1,
-1.512863, 0.4312162, -2.449151, 1, 0.4392157, 0, 1,
-1.512066, -0.09472356, -1.870736, 1, 0.4431373, 0, 1,
-1.509297, 0.8427742, -0.2546352, 1, 0.4509804, 0, 1,
-1.506801, -0.3101941, -1.838645, 1, 0.454902, 0, 1,
-1.50144, 0.4163266, -0.2416869, 1, 0.4627451, 0, 1,
-1.489985, -0.3959437, -2.756418, 1, 0.4666667, 0, 1,
-1.488586, -1.645518, -2.363488, 1, 0.4745098, 0, 1,
-1.484806, 0.7624415, -0.6152428, 1, 0.4784314, 0, 1,
-1.457635, 0.7019384, -0.02356144, 1, 0.4862745, 0, 1,
-1.456369, -1.141083, -1.027299, 1, 0.4901961, 0, 1,
-1.44312, -0.1910262, -3.216108, 1, 0.4980392, 0, 1,
-1.442124, -1.829409, -1.996139, 1, 0.5058824, 0, 1,
-1.441133, -0.4303965, -1.484225, 1, 0.509804, 0, 1,
-1.440552, -1.26843, -1.516754, 1, 0.5176471, 0, 1,
-1.439095, 0.32086, 0.895077, 1, 0.5215687, 0, 1,
-1.40737, -0.07648619, -1.083804, 1, 0.5294118, 0, 1,
-1.40063, 1.048566, 1.205934, 1, 0.5333334, 0, 1,
-1.398707, 0.6199136, -1.232116, 1, 0.5411765, 0, 1,
-1.392976, 1.562231, 1.332575, 1, 0.5450981, 0, 1,
-1.391381, 0.034107, -2.584666, 1, 0.5529412, 0, 1,
-1.380046, 1.452263, -2.177251, 1, 0.5568628, 0, 1,
-1.377192, -0.5291187, -2.481879, 1, 0.5647059, 0, 1,
-1.360827, -0.8098177, -2.287894, 1, 0.5686275, 0, 1,
-1.35806, -0.07113507, -2.502883, 1, 0.5764706, 0, 1,
-1.357964, 0.1009884, -1.155539, 1, 0.5803922, 0, 1,
-1.3514, 0.02801931, -1.268248, 1, 0.5882353, 0, 1,
-1.341441, 1.434207, -1.112559, 1, 0.5921569, 0, 1,
-1.337595, -0.9540737, -1.53091, 1, 0.6, 0, 1,
-1.335581, 0.164305, -2.399579, 1, 0.6078432, 0, 1,
-1.331793, -0.8836866, -1.920597, 1, 0.6117647, 0, 1,
-1.324719, -1.556776, -3.211348, 1, 0.6196079, 0, 1,
-1.319774, -0.1574631, -3.030566, 1, 0.6235294, 0, 1,
-1.319607, -0.5093827, -0.9207404, 1, 0.6313726, 0, 1,
-1.316489, 0.4403747, -1.900689, 1, 0.6352941, 0, 1,
-1.312441, -0.7401561, -0.5184205, 1, 0.6431373, 0, 1,
-1.311281, 0.2234797, -1.441368, 1, 0.6470588, 0, 1,
-1.296766, -1.698658, -2.821718, 1, 0.654902, 0, 1,
-1.289149, 0.02011579, -1.776641, 1, 0.6588235, 0, 1,
-1.285074, -0.3757854, -1.877748, 1, 0.6666667, 0, 1,
-1.277186, 0.6037577, -1.451796, 1, 0.6705883, 0, 1,
-1.275238, -0.5933105, -4.383714, 1, 0.6784314, 0, 1,
-1.271671, -0.8967691, -3.235356, 1, 0.682353, 0, 1,
-1.267865, 0.3408925, -1.051819, 1, 0.6901961, 0, 1,
-1.263991, 0.3935168, -1.392812, 1, 0.6941177, 0, 1,
-1.263664, 0.7055308, -2.486259, 1, 0.7019608, 0, 1,
-1.263187, -1.823177, -3.22331, 1, 0.7098039, 0, 1,
-1.245233, -0.6745857, -1.29389, 1, 0.7137255, 0, 1,
-1.241309, -0.5200191, -1.888592, 1, 0.7215686, 0, 1,
-1.238506, 0.03535101, -1.427172, 1, 0.7254902, 0, 1,
-1.236124, -1.294878, -3.01163, 1, 0.7333333, 0, 1,
-1.234775, -0.7600453, -3.605781, 1, 0.7372549, 0, 1,
-1.232977, -0.1009869, -0.5870465, 1, 0.7450981, 0, 1,
-1.211065, 0.08291766, -0.6159725, 1, 0.7490196, 0, 1,
-1.205616, 0.4535571, 0.05829304, 1, 0.7568628, 0, 1,
-1.205427, -1.047001, -2.619364, 1, 0.7607843, 0, 1,
-1.203046, 0.2066769, -1.89462, 1, 0.7686275, 0, 1,
-1.200431, 0.140636, 0.2721377, 1, 0.772549, 0, 1,
-1.196113, -0.339669, -2.194834, 1, 0.7803922, 0, 1,
-1.194879, -0.919517, -4.133762, 1, 0.7843137, 0, 1,
-1.191683, -0.3963781, -0.7977591, 1, 0.7921569, 0, 1,
-1.183587, 0.9117121, -0.1608726, 1, 0.7960784, 0, 1,
-1.164587, -1.841609, -3.565585, 1, 0.8039216, 0, 1,
-1.164581, 0.9042149, -0.934342, 1, 0.8117647, 0, 1,
-1.145917, 0.3907948, -2.066806, 1, 0.8156863, 0, 1,
-1.142747, 0.4702868, -2.117015, 1, 0.8235294, 0, 1,
-1.142684, -0.8702549, -1.267939, 1, 0.827451, 0, 1,
-1.129004, -0.9426761, -0.7749961, 1, 0.8352941, 0, 1,
-1.127127, 1.481948, 0.4367326, 1, 0.8392157, 0, 1,
-1.125861, 0.3111609, -0.6784059, 1, 0.8470588, 0, 1,
-1.124626, -0.3457496, -1.979328, 1, 0.8509804, 0, 1,
-1.119881, 0.1007717, -0.4681436, 1, 0.8588235, 0, 1,
-1.109754, 0.3404596, -0.4773485, 1, 0.8627451, 0, 1,
-1.107087, -0.1859483, -1.492822, 1, 0.8705882, 0, 1,
-1.106431, -1.216524, -0.9322504, 1, 0.8745098, 0, 1,
-1.101101, -0.3136442, -1.580437, 1, 0.8823529, 0, 1,
-1.094881, 0.06143602, -2.655063, 1, 0.8862745, 0, 1,
-1.092826, 0.4639149, -3.005405, 1, 0.8941177, 0, 1,
-1.086151, 0.2130219, -1.862057, 1, 0.8980392, 0, 1,
-1.083634, 1.100793, -1.89995, 1, 0.9058824, 0, 1,
-1.0814, 0.5090572, -1.826792, 1, 0.9137255, 0, 1,
-1.080913, 0.4416017, -1.792942, 1, 0.9176471, 0, 1,
-1.070716, 1.378554, -0.007543448, 1, 0.9254902, 0, 1,
-1.066926, 0.5307685, -2.487152, 1, 0.9294118, 0, 1,
-1.055813, -2.5424, -1.633527, 1, 0.9372549, 0, 1,
-1.055764, 0.3207989, -3.908678, 1, 0.9411765, 0, 1,
-1.054852, 0.4884911, -2.134239, 1, 0.9490196, 0, 1,
-1.052898, 0.05522714, -1.335021, 1, 0.9529412, 0, 1,
-1.04892, 0.3970236, -0.8794656, 1, 0.9607843, 0, 1,
-1.048811, 1.171279, -2.140568, 1, 0.9647059, 0, 1,
-1.04694, -0.06150924, -0.5933033, 1, 0.972549, 0, 1,
-1.046396, 0.4468804, -0.2237125, 1, 0.9764706, 0, 1,
-1.039533, -1.230394, -3.567694, 1, 0.9843137, 0, 1,
-1.033845, -1.119175, -3.517081, 1, 0.9882353, 0, 1,
-1.032981, 0.2834859, -0.1561463, 1, 0.9960784, 0, 1,
-1.026782, -0.8798064, -1.138955, 0.9960784, 1, 0, 1,
-1.012647, -0.3871951, -2.0845, 0.9921569, 1, 0, 1,
-1.012619, 1.151395, -2.245166, 0.9843137, 1, 0, 1,
-1.010571, -1.572898, -2.426366, 0.9803922, 1, 0, 1,
-1.009313, 0.4228444, -2.098695, 0.972549, 1, 0, 1,
-1.007901, -0.7327061, -2.369298, 0.9686275, 1, 0, 1,
-1.006072, -0.6019153, -2.432505, 0.9607843, 1, 0, 1,
-1.001441, -0.0438075, -2.473106, 0.9568627, 1, 0, 1,
-0.9942388, 0.2507814, -1.725719, 0.9490196, 1, 0, 1,
-0.9798052, -0.4627892, -1.223041, 0.945098, 1, 0, 1,
-0.9779798, 1.023938, 0.2517655, 0.9372549, 1, 0, 1,
-0.9753101, -0.1926098, -1.086274, 0.9333333, 1, 0, 1,
-0.9720096, 0.01087515, -0.366133, 0.9254902, 1, 0, 1,
-0.9706649, 0.008261667, -2.004967, 0.9215686, 1, 0, 1,
-0.9596633, -0.3929599, -2.359099, 0.9137255, 1, 0, 1,
-0.958086, -0.1663517, -2.106161, 0.9098039, 1, 0, 1,
-0.9575555, 1.00439, -1.331133, 0.9019608, 1, 0, 1,
-0.9506611, -1.002009, -2.403409, 0.8941177, 1, 0, 1,
-0.9486243, 2.66869, -0.905795, 0.8901961, 1, 0, 1,
-0.9267861, -1.522955, -1.957169, 0.8823529, 1, 0, 1,
-0.9255209, -0.5938198, -3.681872, 0.8784314, 1, 0, 1,
-0.9236504, 0.2389182, -0.9433828, 0.8705882, 1, 0, 1,
-0.9222633, 1.023736, -0.651089, 0.8666667, 1, 0, 1,
-0.9176607, -0.2178254, -2.282891, 0.8588235, 1, 0, 1,
-0.9149315, 0.7529811, -2.07931, 0.854902, 1, 0, 1,
-0.9130054, -2.052557, -0.3311283, 0.8470588, 1, 0, 1,
-0.9118225, -0.06018435, -1.048192, 0.8431373, 1, 0, 1,
-0.9114169, -0.8184906, -4.470952, 0.8352941, 1, 0, 1,
-0.9072464, -0.9690276, -4.66538, 0.8313726, 1, 0, 1,
-0.9062814, 1.043115, 0.3507353, 0.8235294, 1, 0, 1,
-0.9026868, -0.3947634, -0.45808, 0.8196079, 1, 0, 1,
-0.9013326, 0.644456, -0.2646705, 0.8117647, 1, 0, 1,
-0.8970248, 0.4346892, -0.3460729, 0.8078431, 1, 0, 1,
-0.8950868, 1.292714, -1.36951, 0.8, 1, 0, 1,
-0.8947844, 1.583377, 0.08432996, 0.7921569, 1, 0, 1,
-0.8935077, 0.3600033, -1.280027, 0.7882353, 1, 0, 1,
-0.8911306, 0.645329, -1.961062, 0.7803922, 1, 0, 1,
-0.8901079, -0.5784007, -3.381397, 0.7764706, 1, 0, 1,
-0.8884732, -1.744285, -2.88122, 0.7686275, 1, 0, 1,
-0.8818237, -2.004432, -3.250497, 0.7647059, 1, 0, 1,
-0.8731791, -0.248981, -2.562156, 0.7568628, 1, 0, 1,
-0.8678749, -0.3594733, -2.422508, 0.7529412, 1, 0, 1,
-0.8669843, -0.02800159, -1.631924, 0.7450981, 1, 0, 1,
-0.8661764, -0.3448526, -1.575331, 0.7411765, 1, 0, 1,
-0.8660921, -0.9689969, -3.773316, 0.7333333, 1, 0, 1,
-0.8609144, -1.242125, -1.317558, 0.7294118, 1, 0, 1,
-0.8573393, 0.02026721, -1.720368, 0.7215686, 1, 0, 1,
-0.8533303, -0.3818923, -0.8506873, 0.7176471, 1, 0, 1,
-0.8484232, 0.2531812, -1.744509, 0.7098039, 1, 0, 1,
-0.8469663, 0.1156047, 0.0316155, 0.7058824, 1, 0, 1,
-0.8405532, -0.04683756, -0.9234024, 0.6980392, 1, 0, 1,
-0.8372994, -0.7947764, -2.61512, 0.6901961, 1, 0, 1,
-0.8326451, 0.3134106, -2.675396, 0.6862745, 1, 0, 1,
-0.8323722, 1.924938, -0.7858483, 0.6784314, 1, 0, 1,
-0.8320666, -1.702841, -1.105824, 0.6745098, 1, 0, 1,
-0.830634, 0.5315428, -1.809079, 0.6666667, 1, 0, 1,
-0.8217235, 0.09912346, -2.286552, 0.6627451, 1, 0, 1,
-0.8212424, 1.312056, -0.5793225, 0.654902, 1, 0, 1,
-0.8195871, -0.7541075, -2.953548, 0.6509804, 1, 0, 1,
-0.8090858, 0.6915956, -2.158243, 0.6431373, 1, 0, 1,
-0.8075036, 1.905644, -0.02705224, 0.6392157, 1, 0, 1,
-0.8014486, 1.366951, -0.8092585, 0.6313726, 1, 0, 1,
-0.7948543, -1.371962, -3.607033, 0.627451, 1, 0, 1,
-0.7903041, -0.2152973, -1.381085, 0.6196079, 1, 0, 1,
-0.7785419, -0.1608313, -1.923486, 0.6156863, 1, 0, 1,
-0.7709057, 0.6202948, -0.4140633, 0.6078432, 1, 0, 1,
-0.7608368, -0.2715474, -1.800604, 0.6039216, 1, 0, 1,
-0.7605401, 0.3350434, -2.18644, 0.5960785, 1, 0, 1,
-0.757292, 1.071806, -0.6232045, 0.5882353, 1, 0, 1,
-0.7566717, -0.9835884, -2.108496, 0.5843138, 1, 0, 1,
-0.7484767, -1.491006, -1.624875, 0.5764706, 1, 0, 1,
-0.7457857, 1.329867, 0.1748506, 0.572549, 1, 0, 1,
-0.7441912, 0.1480583, -1.407349, 0.5647059, 1, 0, 1,
-0.7423142, 1.616338, -0.9954345, 0.5607843, 1, 0, 1,
-0.7403888, -1.75172, -3.593328, 0.5529412, 1, 0, 1,
-0.7316563, -0.3196353, -0.05579579, 0.5490196, 1, 0, 1,
-0.7310939, 1.597072, -1.153565, 0.5411765, 1, 0, 1,
-0.7205181, -1.01026, -2.337549, 0.5372549, 1, 0, 1,
-0.7184207, -1.702077, -3.170207, 0.5294118, 1, 0, 1,
-0.7105855, -1.042988, -4.400413, 0.5254902, 1, 0, 1,
-0.7071397, 1.504104, -1.619221, 0.5176471, 1, 0, 1,
-0.702626, 0.6348438, -0.7285497, 0.5137255, 1, 0, 1,
-0.6926363, -1.601522, -3.867476, 0.5058824, 1, 0, 1,
-0.691659, 0.2732558, -2.399071, 0.5019608, 1, 0, 1,
-0.6889874, 0.4661424, -0.01450557, 0.4941176, 1, 0, 1,
-0.6858079, -1.418584, -3.104623, 0.4862745, 1, 0, 1,
-0.6857382, 1.48016, -0.6951799, 0.4823529, 1, 0, 1,
-0.6833047, -0.1038984, -2.379498, 0.4745098, 1, 0, 1,
-0.6781648, 0.3935335, -0.3555636, 0.4705882, 1, 0, 1,
-0.6769274, -1.517004, -3.857337, 0.4627451, 1, 0, 1,
-0.6713266, 0.4910339, -1.7708, 0.4588235, 1, 0, 1,
-0.667071, -0.06156514, -2.606398, 0.4509804, 1, 0, 1,
-0.664349, -0.7273086, -2.067484, 0.4470588, 1, 0, 1,
-0.6638526, 0.7269602, -2.793445, 0.4392157, 1, 0, 1,
-0.6620651, 0.4410487, -0.7827278, 0.4352941, 1, 0, 1,
-0.6599125, 3.34326, -1.785425, 0.427451, 1, 0, 1,
-0.6538671, -1.112239, -3.042228, 0.4235294, 1, 0, 1,
-0.6522532, -1.963004, -3.798004, 0.4156863, 1, 0, 1,
-0.6499386, 1.433057, -1.0088, 0.4117647, 1, 0, 1,
-0.6464384, 0.8863569, -0.3717837, 0.4039216, 1, 0, 1,
-0.6446106, 0.6482574, -0.09651228, 0.3960784, 1, 0, 1,
-0.641587, 0.5097481, -1.39231, 0.3921569, 1, 0, 1,
-0.6238047, 0.8744883, 0.3597966, 0.3843137, 1, 0, 1,
-0.6219758, -0.007711266, -0.8211216, 0.3803922, 1, 0, 1,
-0.6183643, -1.45834, -2.548122, 0.372549, 1, 0, 1,
-0.6183136, 0.8216213, 0.542345, 0.3686275, 1, 0, 1,
-0.6137632, -1.96577, -2.126688, 0.3607843, 1, 0, 1,
-0.6130175, -0.09571239, -1.941848, 0.3568628, 1, 0, 1,
-0.610849, -2.841811, -4.416436, 0.3490196, 1, 0, 1,
-0.609753, 1.151101, 0.4448011, 0.345098, 1, 0, 1,
-0.6083088, -2.056429, -2.985763, 0.3372549, 1, 0, 1,
-0.6030568, -0.8775293, -1.959578, 0.3333333, 1, 0, 1,
-0.5868137, -1.250773, -3.79193, 0.3254902, 1, 0, 1,
-0.5803972, -0.1934469, -2.06617, 0.3215686, 1, 0, 1,
-0.5802093, -2.753281, -4.315213, 0.3137255, 1, 0, 1,
-0.5744945, 2.61398, 0.5749583, 0.3098039, 1, 0, 1,
-0.5734804, 2.163253, 0.2454768, 0.3019608, 1, 0, 1,
-0.5699193, 1.042265, -2.253725, 0.2941177, 1, 0, 1,
-0.5662957, -0.8835682, -3.706022, 0.2901961, 1, 0, 1,
-0.5640348, 0.2887884, -0.3239135, 0.282353, 1, 0, 1,
-0.5560285, -0.6675748, -1.978883, 0.2784314, 1, 0, 1,
-0.5530632, 2.057624, 0.1275466, 0.2705882, 1, 0, 1,
-0.5528003, 1.29071, 0.318725, 0.2666667, 1, 0, 1,
-0.5521699, -1.429724, -3.539174, 0.2588235, 1, 0, 1,
-0.5467528, 0.2848651, -0.5786955, 0.254902, 1, 0, 1,
-0.5463625, 1.143442, 0.5613441, 0.2470588, 1, 0, 1,
-0.5445128, -1.102501, -3.228795, 0.2431373, 1, 0, 1,
-0.5392827, -1.653413, -3.000851, 0.2352941, 1, 0, 1,
-0.5318223, -0.9598371, -4.018231, 0.2313726, 1, 0, 1,
-0.5279062, -0.6050192, -1.058099, 0.2235294, 1, 0, 1,
-0.5235332, 0.2207272, -2.418336, 0.2196078, 1, 0, 1,
-0.5227416, 0.1946433, -0.1760855, 0.2117647, 1, 0, 1,
-0.5223306, 0.7347416, -0.6725093, 0.2078431, 1, 0, 1,
-0.5214682, 0.02950162, -0.6489809, 0.2, 1, 0, 1,
-0.5214547, -0.9105641, -1.077342, 0.1921569, 1, 0, 1,
-0.5165452, 1.014359, -2.144112, 0.1882353, 1, 0, 1,
-0.5137371, 0.06668354, -0.8641132, 0.1803922, 1, 0, 1,
-0.5120589, 0.3905181, -0.5097638, 0.1764706, 1, 0, 1,
-0.5108509, -0.7401628, -1.821403, 0.1686275, 1, 0, 1,
-0.5046897, -0.9899009, -0.7430182, 0.1647059, 1, 0, 1,
-0.5038916, -0.7069777, -1.847707, 0.1568628, 1, 0, 1,
-0.4980581, -0.4755445, -2.67588, 0.1529412, 1, 0, 1,
-0.4865798, 0.2680151, -0.7395965, 0.145098, 1, 0, 1,
-0.4856806, 0.275821, -2.103108, 0.1411765, 1, 0, 1,
-0.4841482, -0.1875922, -2.359916, 0.1333333, 1, 0, 1,
-0.4793044, 0.929808, -1.586186, 0.1294118, 1, 0, 1,
-0.477899, -1.290895, -3.382023, 0.1215686, 1, 0, 1,
-0.4769289, -0.7024812, -2.186481, 0.1176471, 1, 0, 1,
-0.4758083, -1.315978, -3.624848, 0.1098039, 1, 0, 1,
-0.4739318, 0.2842865, -1.835946, 0.1058824, 1, 0, 1,
-0.4726292, -0.5783445, -4.296118, 0.09803922, 1, 0, 1,
-0.4714636, 0.1795273, -0.7208171, 0.09019608, 1, 0, 1,
-0.4632913, 0.07647443, -1.008778, 0.08627451, 1, 0, 1,
-0.4587978, 0.2628869, -2.143931, 0.07843138, 1, 0, 1,
-0.4571781, 1.581723, -0.1514642, 0.07450981, 1, 0, 1,
-0.45619, 0.6322731, 0.2382587, 0.06666667, 1, 0, 1,
-0.4557387, 0.37576, -0.6239824, 0.0627451, 1, 0, 1,
-0.4529163, -1.059503, -1.479314, 0.05490196, 1, 0, 1,
-0.4497478, 1.181357, 0.1723272, 0.05098039, 1, 0, 1,
-0.4497352, -0.003701843, -0.6402644, 0.04313726, 1, 0, 1,
-0.44927, 1.297963, -1.575473, 0.03921569, 1, 0, 1,
-0.4473888, 0.4203963, -1.120616, 0.03137255, 1, 0, 1,
-0.4465673, -1.139648, -3.881589, 0.02745098, 1, 0, 1,
-0.4463658, -0.172445, -3.144117, 0.01960784, 1, 0, 1,
-0.4450447, 0.07635076, -0.449011, 0.01568628, 1, 0, 1,
-0.4445415, -0.09771055, -1.572588, 0.007843138, 1, 0, 1,
-0.442771, 0.2566004, -0.9252023, 0.003921569, 1, 0, 1,
-0.4411292, -0.1997743, -2.876746, 0, 1, 0.003921569, 1,
-0.4365492, 1.334406, 0.2015348, 0, 1, 0.01176471, 1,
-0.4324076, 0.09813569, -0.9372742, 0, 1, 0.01568628, 1,
-0.4267358, -1.045131, -3.759528, 0, 1, 0.02352941, 1,
-0.4229054, 0.07736034, -1.209245, 0, 1, 0.02745098, 1,
-0.4154889, 0.3317301, -1.033842, 0, 1, 0.03529412, 1,
-0.4132394, -0.9453344, -3.764262, 0, 1, 0.03921569, 1,
-0.4128076, -0.0308106, -0.2637207, 0, 1, 0.04705882, 1,
-0.412219, -0.4175426, -3.814903, 0, 1, 0.05098039, 1,
-0.4116269, 0.3859602, -0.9619722, 0, 1, 0.05882353, 1,
-0.4100074, -0.2450789, -3.31796, 0, 1, 0.0627451, 1,
-0.4011972, 0.2946793, -1.638865, 0, 1, 0.07058824, 1,
-0.4011331, 0.2689543, -1.394034, 0, 1, 0.07450981, 1,
-0.397468, -0.4883545, -3.570205, 0, 1, 0.08235294, 1,
-0.392703, -1.258373, -1.298039, 0, 1, 0.08627451, 1,
-0.3898407, -0.2486716, -1.794225, 0, 1, 0.09411765, 1,
-0.382911, -0.2548489, -3.281489, 0, 1, 0.1019608, 1,
-0.3765625, -0.1740433, -2.882467, 0, 1, 0.1058824, 1,
-0.3744881, 0.1906512, -0.7432156, 0, 1, 0.1137255, 1,
-0.3649225, -0.67271, 0.3137619, 0, 1, 0.1176471, 1,
-0.3618287, -1.420152, -3.45272, 0, 1, 0.1254902, 1,
-0.3509917, 0.8214629, 0.5103912, 0, 1, 0.1294118, 1,
-0.3509662, -1.944008, -3.819757, 0, 1, 0.1372549, 1,
-0.3507234, 0.08437707, 1.007477, 0, 1, 0.1411765, 1,
-0.3469336, 0.07345189, -2.017864, 0, 1, 0.1490196, 1,
-0.3460481, 3.45557, 0.8714863, 0, 1, 0.1529412, 1,
-0.3427224, -2.73053, -3.356986, 0, 1, 0.1607843, 1,
-0.3413953, 0.3074038, -0.2802332, 0, 1, 0.1647059, 1,
-0.3380325, 0.8450232, -0.4483429, 0, 1, 0.172549, 1,
-0.3374875, 0.3355484, 0.8300532, 0, 1, 0.1764706, 1,
-0.3312059, 0.3850813, -0.7032811, 0, 1, 0.1843137, 1,
-0.3275043, 0.4773419, -1.633026, 0, 1, 0.1882353, 1,
-0.3266032, -0.9864144, -3.656953, 0, 1, 0.1960784, 1,
-0.3204204, 0.9416466, -0.7082572, 0, 1, 0.2039216, 1,
-0.3196468, 0.4460749, -0.3242296, 0, 1, 0.2078431, 1,
-0.3155231, -0.732626, -2.052557, 0, 1, 0.2156863, 1,
-0.3140462, -0.8327966, -1.617259, 0, 1, 0.2196078, 1,
-0.3126033, -0.2634487, -0.3672245, 0, 1, 0.227451, 1,
-0.3108817, -0.7728044, -2.392174, 0, 1, 0.2313726, 1,
-0.309004, 0.7820321, 0.5605638, 0, 1, 0.2392157, 1,
-0.308753, 1.298759, 1.105774, 0, 1, 0.2431373, 1,
-0.3087398, 0.4061743, 0.01452801, 0, 1, 0.2509804, 1,
-0.306306, -1.25971, -2.484827, 0, 1, 0.254902, 1,
-0.3044653, -0.5261217, -2.157575, 0, 1, 0.2627451, 1,
-0.3039166, -3.349808, -2.808, 0, 1, 0.2666667, 1,
-0.3025363, 0.4197724, -0.1815594, 0, 1, 0.2745098, 1,
-0.2942758, 0.5133346, 0.1059762, 0, 1, 0.2784314, 1,
-0.2941521, -1.764582, -2.967129, 0, 1, 0.2862745, 1,
-0.2921011, -1.147461, -3.176207, 0, 1, 0.2901961, 1,
-0.2891001, 1.021275, 0.09557487, 0, 1, 0.2980392, 1,
-0.2869652, -2.42763, -3.764195, 0, 1, 0.3058824, 1,
-0.2862777, 0.9352839, 1.535996, 0, 1, 0.3098039, 1,
-0.28445, -2.867201, -2.906267, 0, 1, 0.3176471, 1,
-0.2791822, -0.8270472, -0.8911451, 0, 1, 0.3215686, 1,
-0.2786291, 0.1008801, -0.01480707, 0, 1, 0.3294118, 1,
-0.2753306, -0.820224, -2.741756, 0, 1, 0.3333333, 1,
-0.2715582, -0.7220214, -2.189001, 0, 1, 0.3411765, 1,
-0.270785, 0.6760494, 0.03223043, 0, 1, 0.345098, 1,
-0.2678323, 0.1966347, -0.5677763, 0, 1, 0.3529412, 1,
-0.2674165, 0.299452, 0.1066165, 0, 1, 0.3568628, 1,
-0.2628869, 0.3410528, 0.3412867, 0, 1, 0.3647059, 1,
-0.2623111, -0.4702684, -3.770644, 0, 1, 0.3686275, 1,
-0.2593473, -1.595382, -2.272675, 0, 1, 0.3764706, 1,
-0.2577145, 0.1491803, -1.583577, 0, 1, 0.3803922, 1,
-0.2563645, -0.2991419, -4.22499, 0, 1, 0.3882353, 1,
-0.2505747, -0.1747793, -3.147894, 0, 1, 0.3921569, 1,
-0.2376079, 0.218022, -2.529607, 0, 1, 0.4, 1,
-0.2337946, 1.053904, -0.03085799, 0, 1, 0.4078431, 1,
-0.2328891, 0.3706036, -0.829012, 0, 1, 0.4117647, 1,
-0.232732, 0.06300596, -0.1191748, 0, 1, 0.4196078, 1,
-0.2324392, -1.877012, -2.238186, 0, 1, 0.4235294, 1,
-0.2283412, -1.044726, -2.246043, 0, 1, 0.4313726, 1,
-0.2243615, -0.02161695, -1.97037, 0, 1, 0.4352941, 1,
-0.2173261, 0.6850718, 0.03158744, 0, 1, 0.4431373, 1,
-0.212081, 0.9957925, -2.29524, 0, 1, 0.4470588, 1,
-0.2113025, 1.129179, -1.172356, 0, 1, 0.454902, 1,
-0.2092132, -0.3786578, -2.85176, 0, 1, 0.4588235, 1,
-0.2079369, -0.443012, -1.363778, 0, 1, 0.4666667, 1,
-0.2058263, -0.4836121, -1.485289, 0, 1, 0.4705882, 1,
-0.2031069, 2.302871, 1.838027, 0, 1, 0.4784314, 1,
-0.2017834, 1.345471, 0.9684476, 0, 1, 0.4823529, 1,
-0.2012279, 1.057663, -1.098233, 0, 1, 0.4901961, 1,
-0.20107, -0.918151, -3.182077, 0, 1, 0.4941176, 1,
-0.200547, 0.7008846, 0.9058307, 0, 1, 0.5019608, 1,
-0.1963613, 0.7467706, 0.0102794, 0, 1, 0.509804, 1,
-0.1954013, -0.04189936, -2.154896, 0, 1, 0.5137255, 1,
-0.1934699, -1.111245, -4.678328, 0, 1, 0.5215687, 1,
-0.1853701, -0.1350001, -0.9638143, 0, 1, 0.5254902, 1,
-0.1833676, -1.369595, -4.436107, 0, 1, 0.5333334, 1,
-0.1818873, 2.247174, 1.620359, 0, 1, 0.5372549, 1,
-0.181362, -0.4552973, -2.591987, 0, 1, 0.5450981, 1,
-0.1780163, -0.8458992, -3.526342, 0, 1, 0.5490196, 1,
-0.1758218, -1.859593, -4.174621, 0, 1, 0.5568628, 1,
-0.1675923, 1.878836, -1.06121, 0, 1, 0.5607843, 1,
-0.16552, 0.03345278, 0.4473337, 0, 1, 0.5686275, 1,
-0.1617611, -0.05731559, -0.7056448, 0, 1, 0.572549, 1,
-0.1543476, 1.290584, -0.742335, 0, 1, 0.5803922, 1,
-0.1483021, -1.217093, -2.194055, 0, 1, 0.5843138, 1,
-0.1482482, -2.613203, -3.206861, 0, 1, 0.5921569, 1,
-0.1479614, -2.008149, -2.016471, 0, 1, 0.5960785, 1,
-0.1473124, -0.03744559, -2.727968, 0, 1, 0.6039216, 1,
-0.1417341, 2.251161, 0.1538379, 0, 1, 0.6117647, 1,
-0.138128, 1.354188, 0.3344078, 0, 1, 0.6156863, 1,
-0.1372013, 0.7952793, -0.6239823, 0, 1, 0.6235294, 1,
-0.1355109, -0.537132, -2.94124, 0, 1, 0.627451, 1,
-0.1349084, -0.2129536, -3.013978, 0, 1, 0.6352941, 1,
-0.1316986, -0.2450848, -3.591661, 0, 1, 0.6392157, 1,
-0.1296235, 0.7380269, 0.8625895, 0, 1, 0.6470588, 1,
-0.1266223, 1.469736, 0.9191028, 0, 1, 0.6509804, 1,
-0.1246659, 0.2000909, 0.5142286, 0, 1, 0.6588235, 1,
-0.1214307, -0.5208073, -2.99287, 0, 1, 0.6627451, 1,
-0.1038974, -1.368701, -3.585028, 0, 1, 0.6705883, 1,
-0.1038892, 0.3776305, 0.2475075, 0, 1, 0.6745098, 1,
-0.1031101, -0.2634325, -2.476681, 0, 1, 0.682353, 1,
-0.1025911, 0.7528673, 1.445805, 0, 1, 0.6862745, 1,
-0.1006452, -0.6538371, -2.260758, 0, 1, 0.6941177, 1,
-0.0989963, 0.007725917, -0.9351401, 0, 1, 0.7019608, 1,
-0.09736194, -0.9669525, -2.17987, 0, 1, 0.7058824, 1,
-0.09343045, -0.2061537, -3.200239, 0, 1, 0.7137255, 1,
-0.09161438, -0.1888401, -2.42816, 0, 1, 0.7176471, 1,
-0.08595783, -0.8405632, -3.960367, 0, 1, 0.7254902, 1,
-0.08227333, 1.71108, 0.06547377, 0, 1, 0.7294118, 1,
-0.07729037, 0.3098594, 0.1745939, 0, 1, 0.7372549, 1,
-0.07514052, 0.8352734, -2.371095, 0, 1, 0.7411765, 1,
-0.07492895, 1.635048, 0.04971412, 0, 1, 0.7490196, 1,
-0.07056731, -0.8578005, -4.060009, 0, 1, 0.7529412, 1,
-0.06755441, -0.005773209, -1.993122, 0, 1, 0.7607843, 1,
-0.06751236, -0.3375182, -3.224267, 0, 1, 0.7647059, 1,
-0.06560914, -1.5657, -1.788864, 0, 1, 0.772549, 1,
-0.06342452, 0.7877964, 1.514448, 0, 1, 0.7764706, 1,
-0.05968098, -0.1306175, -1.537216, 0, 1, 0.7843137, 1,
-0.05753019, 0.2563943, 0.1160672, 0, 1, 0.7882353, 1,
-0.05545311, -1.550128, -3.697738, 0, 1, 0.7960784, 1,
-0.05519784, 1.209001, 0.9347818, 0, 1, 0.8039216, 1,
-0.05501379, -0.8900388, -2.433437, 0, 1, 0.8078431, 1,
-0.04969198, 1.852985, -0.5480509, 0, 1, 0.8156863, 1,
-0.04551049, -1.645383, -3.489881, 0, 1, 0.8196079, 1,
-0.04277186, -0.0184042, -2.475225, 0, 1, 0.827451, 1,
-0.03936803, -0.473918, -3.220818, 0, 1, 0.8313726, 1,
-0.03914807, -0.7410368, -3.120607, 0, 1, 0.8392157, 1,
-0.0351489, 1.215551, -0.3428948, 0, 1, 0.8431373, 1,
-0.03506132, 0.7269138, -1.415173, 0, 1, 0.8509804, 1,
-0.02992344, 0.3580252, -0.0940694, 0, 1, 0.854902, 1,
-0.02882357, -0.5771344, -3.696106, 0, 1, 0.8627451, 1,
-0.02576203, 1.234599, 0.318698, 0, 1, 0.8666667, 1,
-0.01375233, 0.5145763, 0.7279608, 0, 1, 0.8745098, 1,
-0.01103382, 0.5264141, -2.03678, 0, 1, 0.8784314, 1,
-0.001539779, 0.8401377, -1.108481, 0, 1, 0.8862745, 1,
0.006488679, 1.008046, -0.193335, 0, 1, 0.8901961, 1,
0.01354598, 0.007610887, 0.3343606, 0, 1, 0.8980392, 1,
0.01661243, 0.08167738, 1.534621, 0, 1, 0.9058824, 1,
0.02196925, -0.254045, 2.962704, 0, 1, 0.9098039, 1,
0.02644, 1.177005, -0.739346, 0, 1, 0.9176471, 1,
0.0270472, -0.1474436, 0.9517617, 0, 1, 0.9215686, 1,
0.03011577, -0.09898516, 3.706741, 0, 1, 0.9294118, 1,
0.03262615, 0.6296248, 0.6161404, 0, 1, 0.9333333, 1,
0.03324864, 1.139283, -1.733159, 0, 1, 0.9411765, 1,
0.03779277, -0.2168832, 3.000048, 0, 1, 0.945098, 1,
0.0408373, 1.049699, -0.15221, 0, 1, 0.9529412, 1,
0.04135035, -0.4948982, 3.49029, 0, 1, 0.9568627, 1,
0.04340141, 0.05013747, 1.212298, 0, 1, 0.9647059, 1,
0.04455224, -1.985074, 4.8067, 0, 1, 0.9686275, 1,
0.04518449, 0.3582185, 1.466324, 0, 1, 0.9764706, 1,
0.04631126, -1.26035, 4.643439, 0, 1, 0.9803922, 1,
0.05455824, 1.055059, 1.664045, 0, 1, 0.9882353, 1,
0.05567408, 1.683028, -0.2156692, 0, 1, 0.9921569, 1,
0.06236938, 0.8474787, 0.8040472, 0, 1, 1, 1,
0.06288064, 0.9478406, -1.254378, 0, 0.9921569, 1, 1,
0.07331987, -0.04210896, 1.552041, 0, 0.9882353, 1, 1,
0.07512926, -0.5047713, 2.333873, 0, 0.9803922, 1, 1,
0.0763369, -0.2746057, 2.854592, 0, 0.9764706, 1, 1,
0.07668885, 0.8317091, 0.5858706, 0, 0.9686275, 1, 1,
0.07708973, 0.3324047, 1.100326, 0, 0.9647059, 1, 1,
0.07964566, -0.4646049, 3.858406, 0, 0.9568627, 1, 1,
0.07991771, 1.536094, 2.031951, 0, 0.9529412, 1, 1,
0.08355064, 0.3157931, 0.7464422, 0, 0.945098, 1, 1,
0.08382535, 0.9257931, 0.3828047, 0, 0.9411765, 1, 1,
0.08444458, -0.5372966, 1.790779, 0, 0.9333333, 1, 1,
0.09012352, -0.07166639, 2.907551, 0, 0.9294118, 1, 1,
0.09052953, 0.8207312, -0.01754279, 0, 0.9215686, 1, 1,
0.09094419, -0.7458517, 2.798448, 0, 0.9176471, 1, 1,
0.09192728, 0.4296628, -1.187322, 0, 0.9098039, 1, 1,
0.09337612, -0.4568248, 2.746335, 0, 0.9058824, 1, 1,
0.09521506, -0.6031235, 1.500081, 0, 0.8980392, 1, 1,
0.09708673, 0.6395071, 0.6766776, 0, 0.8901961, 1, 1,
0.09798703, 1.174768, 0.1341905, 0, 0.8862745, 1, 1,
0.09905042, 0.6315032, 0.1549207, 0, 0.8784314, 1, 1,
0.09962849, 0.1099059, 2.330479, 0, 0.8745098, 1, 1,
0.1003956, -1.525403, 2.351535, 0, 0.8666667, 1, 1,
0.1021929, 1.395468, -0.005866767, 0, 0.8627451, 1, 1,
0.1067762, 0.3616247, 1.904895, 0, 0.854902, 1, 1,
0.1159755, -2.020805, 4.892918, 0, 0.8509804, 1, 1,
0.1172501, 0.6225302, -0.09115141, 0, 0.8431373, 1, 1,
0.1180266, -0.9588841, 4.375316, 0, 0.8392157, 1, 1,
0.1195997, -0.4404984, 4.080249, 0, 0.8313726, 1, 1,
0.1210737, -0.1992509, 2.353246, 0, 0.827451, 1, 1,
0.1220786, 1.418389, 1.067878, 0, 0.8196079, 1, 1,
0.1333181, 0.1091122, 2.154527, 0, 0.8156863, 1, 1,
0.1337137, -1.046765, 3.860332, 0, 0.8078431, 1, 1,
0.1338224, -2.015903, 4.174088, 0, 0.8039216, 1, 1,
0.1369009, -2.190101, 3.770223, 0, 0.7960784, 1, 1,
0.1479045, 0.01211747, 0.9614739, 0, 0.7882353, 1, 1,
0.1488754, 0.5464063, 0.7665995, 0, 0.7843137, 1, 1,
0.1537323, 0.6878855, 0.9559737, 0, 0.7764706, 1, 1,
0.1542053, -0.8404109, 3.039035, 0, 0.772549, 1, 1,
0.1559921, -1.274797, 2.499684, 0, 0.7647059, 1, 1,
0.1583883, 0.929181, 0.5335902, 0, 0.7607843, 1, 1,
0.1586184, -0.8221006, 2.664085, 0, 0.7529412, 1, 1,
0.1598588, -0.7380717, 3.326631, 0, 0.7490196, 1, 1,
0.1618246, 1.342245, -0.6989709, 0, 0.7411765, 1, 1,
0.1618884, 0.3948128, -0.0888287, 0, 0.7372549, 1, 1,
0.1638847, 0.9028426, 0.7270263, 0, 0.7294118, 1, 1,
0.1659759, 1.953649, -0.09797787, 0, 0.7254902, 1, 1,
0.1672789, -0.08778869, 2.491411, 0, 0.7176471, 1, 1,
0.1687859, 0.0695388, 0.4749795, 0, 0.7137255, 1, 1,
0.1727244, 1.469168, -0.3326307, 0, 0.7058824, 1, 1,
0.1758075, -1.083117, 1.384164, 0, 0.6980392, 1, 1,
0.1770988, 0.8282467, 0.6583777, 0, 0.6941177, 1, 1,
0.1772791, 1.769446, -1.911809, 0, 0.6862745, 1, 1,
0.1778113, 0.2742887, 0.2327179, 0, 0.682353, 1, 1,
0.1808868, 0.1327792, 0.5416545, 0, 0.6745098, 1, 1,
0.1819331, 0.5690773, -0.1822973, 0, 0.6705883, 1, 1,
0.182055, 0.560645, 2.337793, 0, 0.6627451, 1, 1,
0.1844833, 0.2689914, 1.654218, 0, 0.6588235, 1, 1,
0.1928552, 0.5030134, 1.540687, 0, 0.6509804, 1, 1,
0.1942227, -0.9937831, 2.38985, 0, 0.6470588, 1, 1,
0.1984816, -0.7745463, 2.131253, 0, 0.6392157, 1, 1,
0.1984859, -0.7434154, 3.262925, 0, 0.6352941, 1, 1,
0.1986387, -1.596039, 4.690999, 0, 0.627451, 1, 1,
0.2064683, 0.1043931, -0.2832148, 0, 0.6235294, 1, 1,
0.2070159, 1.322237, 0.6936327, 0, 0.6156863, 1, 1,
0.2088312, 0.01460087, 0.2124018, 0, 0.6117647, 1, 1,
0.2102199, 1.566121, -0.7527891, 0, 0.6039216, 1, 1,
0.2125292, 0.6298401, 1.946736, 0, 0.5960785, 1, 1,
0.2171662, -0.02781211, 2.354638, 0, 0.5921569, 1, 1,
0.218137, 0.7907286, 1.596916, 0, 0.5843138, 1, 1,
0.2203391, 0.9933634, -0.09537162, 0, 0.5803922, 1, 1,
0.2208689, 0.5187272, 1.14136, 0, 0.572549, 1, 1,
0.2226994, 1.134601, 0.3685815, 0, 0.5686275, 1, 1,
0.2234274, 0.4142441, -1.004761, 0, 0.5607843, 1, 1,
0.2272452, 0.7201733, 0.8009213, 0, 0.5568628, 1, 1,
0.2334892, 1.172147, -0.333108, 0, 0.5490196, 1, 1,
0.2417347, 1.949155, -0.6931444, 0, 0.5450981, 1, 1,
0.2423322, -2.278584, 4.37018, 0, 0.5372549, 1, 1,
0.2429252, -0.7408533, 3.456261, 0, 0.5333334, 1, 1,
0.2435224, 1.897014, 0.4237247, 0, 0.5254902, 1, 1,
0.2436497, -0.3792276, 2.309111, 0, 0.5215687, 1, 1,
0.2475001, -0.9903849, 1.641807, 0, 0.5137255, 1, 1,
0.2491917, 0.4696487, 0.7400783, 0, 0.509804, 1, 1,
0.2494923, 1.581297, -0.08827129, 0, 0.5019608, 1, 1,
0.2520173, -1.329914, 2.645396, 0, 0.4941176, 1, 1,
0.2624894, 0.9783937, 2.161345, 0, 0.4901961, 1, 1,
0.268537, 0.8414733, 0.4267645, 0, 0.4823529, 1, 1,
0.2754992, 0.6780562, 1.35173, 0, 0.4784314, 1, 1,
0.2769206, 0.05803341, 4.605263, 0, 0.4705882, 1, 1,
0.2783346, -1.670072, 2.936622, 0, 0.4666667, 1, 1,
0.2804627, 2.131852, 0.1255144, 0, 0.4588235, 1, 1,
0.2814256, 0.3558306, 0.2999638, 0, 0.454902, 1, 1,
0.2843078, 0.9674671, 0.2939334, 0, 0.4470588, 1, 1,
0.2868879, -1.57962, 1.51508, 0, 0.4431373, 1, 1,
0.28935, 1.343823, 0.007227706, 0, 0.4352941, 1, 1,
0.2906669, -1.718989, 4.272097, 0, 0.4313726, 1, 1,
0.2913479, -1.144547, 2.457157, 0, 0.4235294, 1, 1,
0.2935662, -1.505454, 3.058889, 0, 0.4196078, 1, 1,
0.2941075, -1.105781, 3.054858, 0, 0.4117647, 1, 1,
0.2950838, 0.5091736, -0.5420775, 0, 0.4078431, 1, 1,
0.297415, 1.595115, 0.2890764, 0, 0.4, 1, 1,
0.3016719, -0.1560861, 1.165972, 0, 0.3921569, 1, 1,
0.3036218, -0.03477307, 1.697606, 0, 0.3882353, 1, 1,
0.3051028, 0.4776047, 0.2222061, 0, 0.3803922, 1, 1,
0.3063025, 0.6507522, -0.01174555, 0, 0.3764706, 1, 1,
0.3076622, -0.7014418, 3.353527, 0, 0.3686275, 1, 1,
0.3077663, -0.7184069, 1.525831, 0, 0.3647059, 1, 1,
0.3094651, 0.03009786, 1.141192, 0, 0.3568628, 1, 1,
0.3105915, -0.471073, 2.998372, 0, 0.3529412, 1, 1,
0.3118667, 1.347443, 1.487182, 0, 0.345098, 1, 1,
0.3118841, 1.600177, 0.6704149, 0, 0.3411765, 1, 1,
0.3123691, -0.05963432, 1.535475, 0, 0.3333333, 1, 1,
0.3130012, 0.4973081, 0.9763903, 0, 0.3294118, 1, 1,
0.3144576, 0.8102497, -0.8750756, 0, 0.3215686, 1, 1,
0.3151517, -1.851351, 3.317467, 0, 0.3176471, 1, 1,
0.3192665, -0.4797163, 3.285978, 0, 0.3098039, 1, 1,
0.3275901, 1.805054, 0.4718823, 0, 0.3058824, 1, 1,
0.3276541, 0.4240195, -0.2711086, 0, 0.2980392, 1, 1,
0.3288201, 0.02918693, -0.09652279, 0, 0.2901961, 1, 1,
0.3305159, -2.798829, 4.353694, 0, 0.2862745, 1, 1,
0.3361932, 0.1206747, -0.2979577, 0, 0.2784314, 1, 1,
0.3389165, 0.00473968, 2.970093, 0, 0.2745098, 1, 1,
0.3429949, 0.07738411, 2.475297, 0, 0.2666667, 1, 1,
0.3447701, -0.4017452, 2.443996, 0, 0.2627451, 1, 1,
0.3484553, 1.980988, -1.104417, 0, 0.254902, 1, 1,
0.3507751, -1.970939, 1.625032, 0, 0.2509804, 1, 1,
0.3527549, 0.2249745, -0.004133926, 0, 0.2431373, 1, 1,
0.3528261, -1.237092, 3.012846, 0, 0.2392157, 1, 1,
0.3559877, -0.1820544, 1.412043, 0, 0.2313726, 1, 1,
0.3572461, 0.6120487, 0.1250908, 0, 0.227451, 1, 1,
0.3586581, -0.5352761, 2.861576, 0, 0.2196078, 1, 1,
0.3596065, -1.293781, 3.052325, 0, 0.2156863, 1, 1,
0.3606418, -1.002239, 3.074762, 0, 0.2078431, 1, 1,
0.361645, 1.727408, -0.9097883, 0, 0.2039216, 1, 1,
0.3692671, 1.629562, 1.542139, 0, 0.1960784, 1, 1,
0.3744581, 0.09954543, -0.3227933, 0, 0.1882353, 1, 1,
0.3793505, 0.7952252, -0.6036696, 0, 0.1843137, 1, 1,
0.380399, -0.2435325, 3.068212, 0, 0.1764706, 1, 1,
0.3864116, 1.701021, -1.082712, 0, 0.172549, 1, 1,
0.3886248, -3.006678, 4.062961, 0, 0.1647059, 1, 1,
0.3920534, -0.6861376, 1.42199, 0, 0.1607843, 1, 1,
0.3927494, -0.5641094, 3.880768, 0, 0.1529412, 1, 1,
0.3956086, 0.516561, 1.505324, 0, 0.1490196, 1, 1,
0.400626, 0.4273638, -0.008238666, 0, 0.1411765, 1, 1,
0.4036406, 0.584618, 2.222991, 0, 0.1372549, 1, 1,
0.4042613, -0.09592215, 2.320042, 0, 0.1294118, 1, 1,
0.4074257, -0.5475441, 2.93776, 0, 0.1254902, 1, 1,
0.4078681, -0.7135975, 1.958269, 0, 0.1176471, 1, 1,
0.4097686, 1.659097, 1.238545, 0, 0.1137255, 1, 1,
0.4098516, 0.1102844, 1.937626, 0, 0.1058824, 1, 1,
0.4131108, 0.1967628, 0.4733404, 0, 0.09803922, 1, 1,
0.4150205, 0.6922522, -0.6972707, 0, 0.09411765, 1, 1,
0.4169885, 0.1078346, 1.852268, 0, 0.08627451, 1, 1,
0.4191735, -0.7943686, 1.387555, 0, 0.08235294, 1, 1,
0.4243291, -0.02740786, 2.75687, 0, 0.07450981, 1, 1,
0.424363, -1.101185, 3.580049, 0, 0.07058824, 1, 1,
0.4245272, -0.2370735, 2.293835, 0, 0.0627451, 1, 1,
0.4309156, 1.706958, 0.377914, 0, 0.05882353, 1, 1,
0.43133, 1.197236, 0.2565562, 0, 0.05098039, 1, 1,
0.4326163, 1.986938, 2.12567, 0, 0.04705882, 1, 1,
0.43288, 0.6978601, 0.4157267, 0, 0.03921569, 1, 1,
0.4413636, -0.2725447, 3.892425, 0, 0.03529412, 1, 1,
0.4427011, -0.8864738, 3.388587, 0, 0.02745098, 1, 1,
0.4427046, -1.369203, 1.470084, 0, 0.02352941, 1, 1,
0.4488124, 1.160344, 2.98441, 0, 0.01568628, 1, 1,
0.4498728, -0.08955048, 2.918439, 0, 0.01176471, 1, 1,
0.4517027, -0.4570976, 1.698356, 0, 0.003921569, 1, 1,
0.4566321, 0.1049609, 2.035916, 0.003921569, 0, 1, 1,
0.4575928, 0.1909421, 0.8914644, 0.007843138, 0, 1, 1,
0.4645778, 1.542813, -0.3409023, 0.01568628, 0, 1, 1,
0.4668041, -1.07868, 1.110931, 0.01960784, 0, 1, 1,
0.4668846, 0.541477, 1.949866, 0.02745098, 0, 1, 1,
0.4672413, 0.8180695, 0.2788491, 0.03137255, 0, 1, 1,
0.4748901, -0.53036, 4.011202, 0.03921569, 0, 1, 1,
0.4750285, 0.9592857, 0.1363007, 0.04313726, 0, 1, 1,
0.4763674, 1.17786, 0.6292303, 0.05098039, 0, 1, 1,
0.4771653, -0.8642838, 1.092624, 0.05490196, 0, 1, 1,
0.4774047, -1.712944, 2.494082, 0.0627451, 0, 1, 1,
0.4782295, 0.2908156, 1.758407, 0.06666667, 0, 1, 1,
0.4799397, -0.16092, 2.083277, 0.07450981, 0, 1, 1,
0.4819787, -0.5123739, 3.4886, 0.07843138, 0, 1, 1,
0.4864205, -1.1927, 5.007422, 0.08627451, 0, 1, 1,
0.4917916, 0.2223398, 2.89308, 0.09019608, 0, 1, 1,
0.491955, -0.1139852, 2.477414, 0.09803922, 0, 1, 1,
0.4999262, -1.136915, 2.699829, 0.1058824, 0, 1, 1,
0.5071383, -2.505544, 3.465556, 0.1098039, 0, 1, 1,
0.5078874, 0.3326641, 1.348457, 0.1176471, 0, 1, 1,
0.5092356, -1.471165, 2.437844, 0.1215686, 0, 1, 1,
0.5117918, -0.958167, 2.405262, 0.1294118, 0, 1, 1,
0.5140112, -0.2464739, 1.764723, 0.1333333, 0, 1, 1,
0.515608, -0.001254182, 0.7485449, 0.1411765, 0, 1, 1,
0.5158141, -0.2258398, 0.9407889, 0.145098, 0, 1, 1,
0.5188134, 1.588814, -0.4993477, 0.1529412, 0, 1, 1,
0.5249873, 0.1274674, 1.649193, 0.1568628, 0, 1, 1,
0.5250165, 0.2433582, 3.357615, 0.1647059, 0, 1, 1,
0.5295852, -0.09448378, 1.076018, 0.1686275, 0, 1, 1,
0.5302929, -0.6269565, 2.16474, 0.1764706, 0, 1, 1,
0.5346982, -0.2136943, 0.7743197, 0.1803922, 0, 1, 1,
0.5383368, -0.09760167, 2.39326, 0.1882353, 0, 1, 1,
0.5416066, -0.7521816, 3.689882, 0.1921569, 0, 1, 1,
0.5454004, -0.5908906, 2.308709, 0.2, 0, 1, 1,
0.5495545, 0.3870048, 0.2160162, 0.2078431, 0, 1, 1,
0.5556225, 0.3073386, -0.04839605, 0.2117647, 0, 1, 1,
0.5616357, 2.073423, 1.250681, 0.2196078, 0, 1, 1,
0.563809, 0.02077459, 1.765974, 0.2235294, 0, 1, 1,
0.5638777, 0.1434686, 1.695855, 0.2313726, 0, 1, 1,
0.5711472, -1.123683, 2.577979, 0.2352941, 0, 1, 1,
0.5722077, -0.6364827, 2.375874, 0.2431373, 0, 1, 1,
0.5735554, 0.4570198, -0.7497657, 0.2470588, 0, 1, 1,
0.5811787, -0.3719405, 1.946398, 0.254902, 0, 1, 1,
0.5827532, 1.733183, 0.8180125, 0.2588235, 0, 1, 1,
0.5866261, 0.228098, 2.279158, 0.2666667, 0, 1, 1,
0.5913293, 0.526179, 0.50345, 0.2705882, 0, 1, 1,
0.5915414, 0.5146905, -1.245145, 0.2784314, 0, 1, 1,
0.5942748, -0.7249829, 1.662314, 0.282353, 0, 1, 1,
0.5990432, -0.1152567, 1.318734, 0.2901961, 0, 1, 1,
0.5996577, -0.08325215, 3.141513, 0.2941177, 0, 1, 1,
0.6028671, 0.1144533, 1.113208, 0.3019608, 0, 1, 1,
0.605206, 1.460986, 1.325981, 0.3098039, 0, 1, 1,
0.6065284, 0.7518899, -0.08696975, 0.3137255, 0, 1, 1,
0.607997, 0.9147788, 1.661795, 0.3215686, 0, 1, 1,
0.6236848, -0.6161656, 1.117083, 0.3254902, 0, 1, 1,
0.6250877, 0.6174321, 0.7263438, 0.3333333, 0, 1, 1,
0.643238, -1.52086, 2.195336, 0.3372549, 0, 1, 1,
0.6432451, 0.07771682, -0.511259, 0.345098, 0, 1, 1,
0.6446704, -0.8991976, 3.467328, 0.3490196, 0, 1, 1,
0.6511484, 0.02342052, 2.592572, 0.3568628, 0, 1, 1,
0.6523341, 1.382169, 0.5861244, 0.3607843, 0, 1, 1,
0.6524774, -1.569295, 3.761045, 0.3686275, 0, 1, 1,
0.6588569, -1.195454, 5.04367, 0.372549, 0, 1, 1,
0.6598503, -0.05406947, 0.5414086, 0.3803922, 0, 1, 1,
0.6615946, -0.4149705, 3.296328, 0.3843137, 0, 1, 1,
0.661858, 0.8028209, -0.2998557, 0.3921569, 0, 1, 1,
0.6621259, 0.1009032, -0.5295188, 0.3960784, 0, 1, 1,
0.6665545, -0.8323888, 3.992676, 0.4039216, 0, 1, 1,
0.6670457, 2.503266, 0.08596607, 0.4117647, 0, 1, 1,
0.686837, 1.443918, 2.053384, 0.4156863, 0, 1, 1,
0.6905568, -0.2249073, 0.1685524, 0.4235294, 0, 1, 1,
0.6921931, 0.401259, 3.065423, 0.427451, 0, 1, 1,
0.699478, -0.501349, 2.28496, 0.4352941, 0, 1, 1,
0.7013915, -0.166992, 1.216781, 0.4392157, 0, 1, 1,
0.7040228, 0.1065793, -0.02053381, 0.4470588, 0, 1, 1,
0.707625, 0.4912349, -0.04882893, 0.4509804, 0, 1, 1,
0.70872, 1.094561, 1.751865, 0.4588235, 0, 1, 1,
0.7137918, -0.3073676, 1.237496, 0.4627451, 0, 1, 1,
0.7142047, 0.9867591, 0.07332762, 0.4705882, 0, 1, 1,
0.7161206, 0.7513427, 0.9732392, 0.4745098, 0, 1, 1,
0.7162333, 0.04003366, 3.052271, 0.4823529, 0, 1, 1,
0.7179808, 0.2876772, 0.7689567, 0.4862745, 0, 1, 1,
0.7210003, -0.3507872, 2.795387, 0.4941176, 0, 1, 1,
0.7290165, -0.4122882, 1.243988, 0.5019608, 0, 1, 1,
0.7293841, -0.5368683, 3.655523, 0.5058824, 0, 1, 1,
0.7304677, -0.227212, 3.585943, 0.5137255, 0, 1, 1,
0.7329533, -0.2861046, 1.993344, 0.5176471, 0, 1, 1,
0.7363528, -0.2884194, 2.431309, 0.5254902, 0, 1, 1,
0.739171, -0.2408911, 1.197649, 0.5294118, 0, 1, 1,
0.7397234, -0.6163237, 2.917539, 0.5372549, 0, 1, 1,
0.7416922, -0.5262204, 0.8086604, 0.5411765, 0, 1, 1,
0.7434008, 0.4692557, 1.06439, 0.5490196, 0, 1, 1,
0.7436273, -1.305571, 0.7761932, 0.5529412, 0, 1, 1,
0.7447496, -0.826989, 3.760193, 0.5607843, 0, 1, 1,
0.7468621, 1.069792, 1.351047, 0.5647059, 0, 1, 1,
0.7487665, 0.9319569, 0.3033953, 0.572549, 0, 1, 1,
0.7554247, -1.821856, 2.15916, 0.5764706, 0, 1, 1,
0.7560474, 1.330096, 0.573921, 0.5843138, 0, 1, 1,
0.7585171, 0.5638455, 2.684093, 0.5882353, 0, 1, 1,
0.7633572, 0.2090289, 1.406878, 0.5960785, 0, 1, 1,
0.7640182, 0.4377309, 0.1360877, 0.6039216, 0, 1, 1,
0.7657315, -1.597435, 3.045484, 0.6078432, 0, 1, 1,
0.7659081, -1.806337, 2.603798, 0.6156863, 0, 1, 1,
0.7692626, -0.5829372, 3.467285, 0.6196079, 0, 1, 1,
0.7693958, 0.2545572, 3.272047, 0.627451, 0, 1, 1,
0.7695485, -0.6080001, 2.46903, 0.6313726, 0, 1, 1,
0.7754976, -1.06473, 4.571381, 0.6392157, 0, 1, 1,
0.7761168, 0.6888974, 1.163926, 0.6431373, 0, 1, 1,
0.7788104, -1.262679, 3.419054, 0.6509804, 0, 1, 1,
0.781549, 1.23461, 0.07037576, 0.654902, 0, 1, 1,
0.7827982, 0.390123, 2.310646, 0.6627451, 0, 1, 1,
0.7865853, 0.5094103, 1.183735, 0.6666667, 0, 1, 1,
0.7876978, -0.4555049, 0.922617, 0.6745098, 0, 1, 1,
0.7969289, -0.3333761, 1.102237, 0.6784314, 0, 1, 1,
0.8026407, 0.1506, 1.79876, 0.6862745, 0, 1, 1,
0.8033941, 2.21676, 0.530201, 0.6901961, 0, 1, 1,
0.8081942, -1.457092, 3.310605, 0.6980392, 0, 1, 1,
0.8116992, 0.02862401, 2.007241, 0.7058824, 0, 1, 1,
0.8172199, -0.2858936, 1.65163, 0.7098039, 0, 1, 1,
0.822715, -1.49909, 1.583628, 0.7176471, 0, 1, 1,
0.8227876, 0.6944901, 1.504593, 0.7215686, 0, 1, 1,
0.8276884, -0.05434747, 1.218691, 0.7294118, 0, 1, 1,
0.8300971, -0.7847287, 2.83911, 0.7333333, 0, 1, 1,
0.8345175, 0.3171847, 0.392397, 0.7411765, 0, 1, 1,
0.8400744, 0.3285436, 1.308789, 0.7450981, 0, 1, 1,
0.8409259, 0.2480021, 1.42451, 0.7529412, 0, 1, 1,
0.8438138, 0.5700887, 0.7175112, 0.7568628, 0, 1, 1,
0.8448089, -1.95725, 4.202851, 0.7647059, 0, 1, 1,
0.8451078, 0.7573236, 1.372422, 0.7686275, 0, 1, 1,
0.8515895, 0.5534316, 0.2332635, 0.7764706, 0, 1, 1,
0.851795, -0.913161, 3.769412, 0.7803922, 0, 1, 1,
0.852574, 0.9516432, -0.2546201, 0.7882353, 0, 1, 1,
0.8552993, 0.8729074, 1.172541, 0.7921569, 0, 1, 1,
0.8556027, 1.408278, -0.8928083, 0.8, 0, 1, 1,
0.8556393, -0.2944587, 2.543664, 0.8078431, 0, 1, 1,
0.8603871, 0.9840496, 0.6918266, 0.8117647, 0, 1, 1,
0.86474, 1.51921, 1.763558, 0.8196079, 0, 1, 1,
0.8747206, 0.0867281, 1.879519, 0.8235294, 0, 1, 1,
0.8773323, 0.3862708, 1.779999, 0.8313726, 0, 1, 1,
0.8802508, 0.009963799, 1.177367, 0.8352941, 0, 1, 1,
0.8953037, -0.3790143, 2.32928, 0.8431373, 0, 1, 1,
0.9013728, 0.3456955, 1.668049, 0.8470588, 0, 1, 1,
0.9029492, 0.7417458, 2.220136, 0.854902, 0, 1, 1,
0.9088789, -0.9966717, 4.189546, 0.8588235, 0, 1, 1,
0.9095433, 1.616873, 1.318368, 0.8666667, 0, 1, 1,
0.9219036, 0.248333, 1.603332, 0.8705882, 0, 1, 1,
0.9228566, 0.02218362, 1.161711, 0.8784314, 0, 1, 1,
0.9271994, -0.1784174, 1.743771, 0.8823529, 0, 1, 1,
0.9282154, 1.270364, 2.003969, 0.8901961, 0, 1, 1,
0.935235, 2.147854, -0.1585932, 0.8941177, 0, 1, 1,
0.9360562, 0.5068161, 2.64565, 0.9019608, 0, 1, 1,
0.9361018, 0.8946698, 1.111295, 0.9098039, 0, 1, 1,
0.9422522, 1.636461, 0.3934454, 0.9137255, 0, 1, 1,
0.9454179, 1.145592, -1.189314, 0.9215686, 0, 1, 1,
0.9555122, -2.924676, 3.847656, 0.9254902, 0, 1, 1,
0.9570383, 0.4002671, 0.7163411, 0.9333333, 0, 1, 1,
0.9595474, -0.160499, 1.473693, 0.9372549, 0, 1, 1,
0.9750639, -1.04984, 3.091768, 0.945098, 0, 1, 1,
0.9769405, 0.1730908, 0.5894706, 0.9490196, 0, 1, 1,
0.9803137, -0.3867731, 2.993286, 0.9568627, 0, 1, 1,
0.9804748, -0.9970491, 2.780721, 0.9607843, 0, 1, 1,
0.9826295, -0.4183411, 0.1606886, 0.9686275, 0, 1, 1,
0.9910792, -1.202494, 2.072017, 0.972549, 0, 1, 1,
0.9926541, -1.861665, 4.938865, 0.9803922, 0, 1, 1,
0.9931521, -1.802212, 1.967009, 0.9843137, 0, 1, 1,
0.9940971, -0.05380663, 2.048012, 0.9921569, 0, 1, 1,
0.9967445, -0.3815737, 3.188083, 0.9960784, 0, 1, 1,
0.9981022, 0.7684008, -0.1015967, 1, 0, 0.9960784, 1,
0.9985497, -0.1143247, 1.960459, 1, 0, 0.9882353, 1,
1.011469, 1.522041, 0.9291567, 1, 0, 0.9843137, 1,
1.014275, -0.3036665, 0.5128192, 1, 0, 0.9764706, 1,
1.019922, -0.7495548, 2.053913, 1, 0, 0.972549, 1,
1.023352, -0.5768716, 2.904119, 1, 0, 0.9647059, 1,
1.026784, 1.597165, 0.4408354, 1, 0, 0.9607843, 1,
1.027794, 0.4209027, 0.7063533, 1, 0, 0.9529412, 1,
1.027835, -0.5161805, 2.234564, 1, 0, 0.9490196, 1,
1.033204, 1.216161, -0.2681483, 1, 0, 0.9411765, 1,
1.039796, -0.6012831, 2.565956, 1, 0, 0.9372549, 1,
1.044493, 1.693064, -0.3739786, 1, 0, 0.9294118, 1,
1.052923, 0.1801673, -0.3195715, 1, 0, 0.9254902, 1,
1.056848, 0.5888502, 1.296117, 1, 0, 0.9176471, 1,
1.061796, -1.28675, 3.742116, 1, 0, 0.9137255, 1,
1.066402, 0.9662084, 1.521724, 1, 0, 0.9058824, 1,
1.071816, -0.939863, 1.467761, 1, 0, 0.9019608, 1,
1.07647, -0.1533653, 0.9658135, 1, 0, 0.8941177, 1,
1.079656, 1.34188, -0.8929885, 1, 0, 0.8862745, 1,
1.082577, 0.7306941, 1.502298, 1, 0, 0.8823529, 1,
1.083873, 0.5639006, 1.438755, 1, 0, 0.8745098, 1,
1.084823, 1.268062, 1.740555, 1, 0, 0.8705882, 1,
1.091567, -0.4375821, 4.199731, 1, 0, 0.8627451, 1,
1.091694, -1.515342, 2.661073, 1, 0, 0.8588235, 1,
1.096041, 0.9503933, 0.3464358, 1, 0, 0.8509804, 1,
1.097911, 1.176714, 0.1285299, 1, 0, 0.8470588, 1,
1.104425, -0.5924437, 1.17707, 1, 0, 0.8392157, 1,
1.114137, -0.9554854, 3.114183, 1, 0, 0.8352941, 1,
1.127061, -1.31097, 1.881648, 1, 0, 0.827451, 1,
1.12856, -0.8217111, 2.887089, 1, 0, 0.8235294, 1,
1.136889, 0.8417802, 1.452126, 1, 0, 0.8156863, 1,
1.144258, -0.5047319, 1.69593, 1, 0, 0.8117647, 1,
1.147242, 0.9885905, 0.8274416, 1, 0, 0.8039216, 1,
1.159352, -0.1162739, 1.886368, 1, 0, 0.7960784, 1,
1.171327, 2.250565, -0.2374589, 1, 0, 0.7921569, 1,
1.171914, 0.8996942, 2.085146, 1, 0, 0.7843137, 1,
1.174256, 2.529529, -0.9772161, 1, 0, 0.7803922, 1,
1.185738, 0.470222, 0.8976085, 1, 0, 0.772549, 1,
1.18712, -0.2171011, 3.687048, 1, 0, 0.7686275, 1,
1.188708, 0.3544661, 2.826366, 1, 0, 0.7607843, 1,
1.193961, 0.1919783, 0.7297931, 1, 0, 0.7568628, 1,
1.19484, 0.3315257, 1.035729, 1, 0, 0.7490196, 1,
1.195796, 2.183968, -1.367467, 1, 0, 0.7450981, 1,
1.196819, 0.3239108, 2.242331, 1, 0, 0.7372549, 1,
1.199261, 0.01795689, 1.670499, 1, 0, 0.7333333, 1,
1.209522, -0.1285724, 3.343253, 1, 0, 0.7254902, 1,
1.214745, 0.2083091, 0.1395131, 1, 0, 0.7215686, 1,
1.215109, 0.9697835, 1.223031, 1, 0, 0.7137255, 1,
1.215359, -0.1720277, 1.139999, 1, 0, 0.7098039, 1,
1.217483, 1.738572, -0.2089818, 1, 0, 0.7019608, 1,
1.218018, 0.04021867, 2.029136, 1, 0, 0.6941177, 1,
1.225302, -0.9466766, 1.740265, 1, 0, 0.6901961, 1,
1.245127, -0.2375346, 2.316999, 1, 0, 0.682353, 1,
1.249463, -0.6347873, 1.411194, 1, 0, 0.6784314, 1,
1.249977, 1.186078, 0.2636811, 1, 0, 0.6705883, 1,
1.258172, -0.1237689, 1.058458, 1, 0, 0.6666667, 1,
1.258821, -0.4121469, 1.845376, 1, 0, 0.6588235, 1,
1.262004, 1.088643, 0.07102737, 1, 0, 0.654902, 1,
1.264716, -0.3324492, 2.423735, 1, 0, 0.6470588, 1,
1.265153, 0.1536715, 1.3624, 1, 0, 0.6431373, 1,
1.276731, -1.610188, 2.37914, 1, 0, 0.6352941, 1,
1.283725, -2.059184, 1.244377, 1, 0, 0.6313726, 1,
1.286392, -0.4218525, 1.237935, 1, 0, 0.6235294, 1,
1.286838, 0.3148841, -0.163159, 1, 0, 0.6196079, 1,
1.290809, -0.8765938, 0.9877836, 1, 0, 0.6117647, 1,
1.291114, -0.6612074, 1.712577, 1, 0, 0.6078432, 1,
1.293516, 0.5037153, 2.857458, 1, 0, 0.6, 1,
1.30131, -0.1539457, 1.98013, 1, 0, 0.5921569, 1,
1.311213, -0.1951653, 2.983049, 1, 0, 0.5882353, 1,
1.319749, -0.928531, 3.108153, 1, 0, 0.5803922, 1,
1.33596, -1.551579, 2.801061, 1, 0, 0.5764706, 1,
1.337633, 0.06893463, 2.400109, 1, 0, 0.5686275, 1,
1.355893, 0.380347, 3.0562, 1, 0, 0.5647059, 1,
1.360597, 0.5095831, 0.2177992, 1, 0, 0.5568628, 1,
1.362239, 0.9815132, -0.4477411, 1, 0, 0.5529412, 1,
1.366094, 2.389488, -1.376275, 1, 0, 0.5450981, 1,
1.366399, 0.1801772, 1.533779, 1, 0, 0.5411765, 1,
1.369195, -0.1110972, 1.947679, 1, 0, 0.5333334, 1,
1.389828, -0.5873971, 1.76972, 1, 0, 0.5294118, 1,
1.391116, -0.7256721, 1.497439, 1, 0, 0.5215687, 1,
1.395382, -0.4065947, 2.302019, 1, 0, 0.5176471, 1,
1.400746, 0.5034443, 3.248371, 1, 0, 0.509804, 1,
1.407268, -0.8116484, 3.060217, 1, 0, 0.5058824, 1,
1.408483, -1.126099, 3.615803, 1, 0, 0.4980392, 1,
1.410228, -1.776268, 2.602768, 1, 0, 0.4901961, 1,
1.413839, 0.7889388, -1.779164, 1, 0, 0.4862745, 1,
1.417449, 0.9343541, -0.04360681, 1, 0, 0.4784314, 1,
1.42247, -0.553785, 1.41745, 1, 0, 0.4745098, 1,
1.425605, 0.1978159, 1.095112, 1, 0, 0.4666667, 1,
1.457371, 0.08285206, 0.4452911, 1, 0, 0.4627451, 1,
1.465021, 0.7624738, 2.030122, 1, 0, 0.454902, 1,
1.469697, -0.830382, 2.407452, 1, 0, 0.4509804, 1,
1.471126, 1.256392, 1.261842, 1, 0, 0.4431373, 1,
1.499693, 2.004333, 0.7584088, 1, 0, 0.4392157, 1,
1.51973, 1.545205, 0.485847, 1, 0, 0.4313726, 1,
1.535255, 1.396979, 1.59767, 1, 0, 0.427451, 1,
1.536231, -0.218108, 2.480506, 1, 0, 0.4196078, 1,
1.551696, 1.291462, -0.1686367, 1, 0, 0.4156863, 1,
1.552519, -2.080103, 2.019053, 1, 0, 0.4078431, 1,
1.553377, 0.5960796, 1.971661, 1, 0, 0.4039216, 1,
1.559067, -1.418215, 1.619795, 1, 0, 0.3960784, 1,
1.565516, 1.983066, 1.565909, 1, 0, 0.3882353, 1,
1.570585, 0.2214345, 0.7119977, 1, 0, 0.3843137, 1,
1.57183, -0.3855313, 1.987486, 1, 0, 0.3764706, 1,
1.575208, -1.553527, 0.5217596, 1, 0, 0.372549, 1,
1.589506, 0.4835189, -0.4942275, 1, 0, 0.3647059, 1,
1.592826, -0.5686901, 0.9462091, 1, 0, 0.3607843, 1,
1.593187, -0.2937795, -0.03674436, 1, 0, 0.3529412, 1,
1.594959, -0.5253574, 1.839295, 1, 0, 0.3490196, 1,
1.605026, -0.5828893, 1.602308, 1, 0, 0.3411765, 1,
1.616676, 0.773296, 0.8752017, 1, 0, 0.3372549, 1,
1.62007, -0.9238341, 0.8804286, 1, 0, 0.3294118, 1,
1.622439, 0.7355194, 1.234773, 1, 0, 0.3254902, 1,
1.630683, -0.9632412, 2.512172, 1, 0, 0.3176471, 1,
1.633086, 0.7182751, 0.2589419, 1, 0, 0.3137255, 1,
1.633151, -1.181993, 2.971157, 1, 0, 0.3058824, 1,
1.6334, 1.72743, -1.08905, 1, 0, 0.2980392, 1,
1.633733, -0.5556119, 1.640487, 1, 0, 0.2941177, 1,
1.634407, 0.4071237, 0.6887499, 1, 0, 0.2862745, 1,
1.673715, 1.231265, 2.508698, 1, 0, 0.282353, 1,
1.674026, -0.1552019, 0.7564151, 1, 0, 0.2745098, 1,
1.680762, 0.6479288, 0.4152373, 1, 0, 0.2705882, 1,
1.685292, -0.1681514, 1.837271, 1, 0, 0.2627451, 1,
1.685793, -0.1720798, -0.5474557, 1, 0, 0.2588235, 1,
1.685834, 1.084709, 0.6351227, 1, 0, 0.2509804, 1,
1.686608, -0.7752194, 1.097594, 1, 0, 0.2470588, 1,
1.702997, -0.01235965, 1.754531, 1, 0, 0.2392157, 1,
1.70627, -1.176297, 0.9030074, 1, 0, 0.2352941, 1,
1.716047, -0.3141935, 0.4813, 1, 0, 0.227451, 1,
1.738607, -0.5106531, 3.168888, 1, 0, 0.2235294, 1,
1.743211, 1.056746, 0.01240572, 1, 0, 0.2156863, 1,
1.751092, -0.9241222, 1.649287, 1, 0, 0.2117647, 1,
1.751815, -0.8820546, 1.90146, 1, 0, 0.2039216, 1,
1.753455, -0.7123338, 1.199415, 1, 0, 0.1960784, 1,
1.767412, -1.282027, 1.938327, 1, 0, 0.1921569, 1,
1.773749, -0.08126049, 1.351139, 1, 0, 0.1843137, 1,
1.783829, -0.3320946, 0.3873846, 1, 0, 0.1803922, 1,
1.79195, -1.418943, 2.284986, 1, 0, 0.172549, 1,
1.814705, 1.143549, 2.024538, 1, 0, 0.1686275, 1,
1.825851, -0.5070103, 0.669653, 1, 0, 0.1607843, 1,
1.82976, 0.4826424, 1.899061, 1, 0, 0.1568628, 1,
1.844493, 1.936845, 0.6267491, 1, 0, 0.1490196, 1,
1.849342, 0.4115641, -0.6488676, 1, 0, 0.145098, 1,
1.865661, 0.01980396, 2.192494, 1, 0, 0.1372549, 1,
1.90532, 0.2037971, 3.584932, 1, 0, 0.1333333, 1,
1.930818, 1.182944, 1.281061, 1, 0, 0.1254902, 1,
1.945746, -0.9207412, 2.091222, 1, 0, 0.1215686, 1,
1.989464, 1.13011, 1.462764, 1, 0, 0.1137255, 1,
1.995762, 1.261617, 1.043706, 1, 0, 0.1098039, 1,
1.998425, -1.862193, 2.717657, 1, 0, 0.1019608, 1,
2.042209, -1.224653, 4.314213, 1, 0, 0.09411765, 1,
2.059938, 0.6676093, 1.725791, 1, 0, 0.09019608, 1,
2.100099, 1.050727, 2.700817, 1, 0, 0.08235294, 1,
2.113346, -2.21244, 1.500798, 1, 0, 0.07843138, 1,
2.130384, -1.049021, 1.232229, 1, 0, 0.07058824, 1,
2.150716, -1.294875, 1.707762, 1, 0, 0.06666667, 1,
2.151624, 0.7664, 1.635068, 1, 0, 0.05882353, 1,
2.188127, 0.3002239, 2.804673, 1, 0, 0.05490196, 1,
2.281347, -0.151712, 2.481097, 1, 0, 0.04705882, 1,
2.332911, 0.02622112, 2.417559, 1, 0, 0.04313726, 1,
2.43172, -1.564947, 2.595394, 1, 0, 0.03529412, 1,
2.437519, -1.536317, 0.8970326, 1, 0, 0.03137255, 1,
2.510945, 0.3003929, 1.302712, 1, 0, 0.02352941, 1,
2.565606, 1.341963, -1.014107, 1, 0, 0.01960784, 1,
2.660168, -0.6657212, 1.683329, 1, 0, 0.01176471, 1,
3.52907, -0.3307174, 0.7149386, 1, 0, 0.007843138, 1
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
0.2443107, -4.503319, -6.326206, 0, -0.5, 0.5, 0.5,
0.2443107, -4.503319, -6.326206, 1, -0.5, 0.5, 0.5,
0.2443107, -4.503319, -6.326206, 1, 1.5, 0.5, 0.5,
0.2443107, -4.503319, -6.326206, 0, 1.5, 0.5, 0.5
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
-4.153982, 0.05288148, -6.326206, 0, -0.5, 0.5, 0.5,
-4.153982, 0.05288148, -6.326206, 1, -0.5, 0.5, 0.5,
-4.153982, 0.05288148, -6.326206, 1, 1.5, 0.5, 0.5,
-4.153982, 0.05288148, -6.326206, 0, 1.5, 0.5, 0.5
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
-4.153982, -4.503319, 0.1826711, 0, -0.5, 0.5, 0.5,
-4.153982, -4.503319, 0.1826711, 1, -0.5, 0.5, 0.5,
-4.153982, -4.503319, 0.1826711, 1, 1.5, 0.5, 0.5,
-4.153982, -4.503319, 0.1826711, 0, 1.5, 0.5, 0.5
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
-3, -3.451888, -4.824158,
3, -3.451888, -4.824158,
-3, -3.451888, -4.824158,
-3, -3.627127, -5.074499,
-2, -3.451888, -4.824158,
-2, -3.627127, -5.074499,
-1, -3.451888, -4.824158,
-1, -3.627127, -5.074499,
0, -3.451888, -4.824158,
0, -3.627127, -5.074499,
1, -3.451888, -4.824158,
1, -3.627127, -5.074499,
2, -3.451888, -4.824158,
2, -3.627127, -5.074499,
3, -3.451888, -4.824158,
3, -3.627127, -5.074499
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
-3, -3.977604, -5.575182, 0, -0.5, 0.5, 0.5,
-3, -3.977604, -5.575182, 1, -0.5, 0.5, 0.5,
-3, -3.977604, -5.575182, 1, 1.5, 0.5, 0.5,
-3, -3.977604, -5.575182, 0, 1.5, 0.5, 0.5,
-2, -3.977604, -5.575182, 0, -0.5, 0.5, 0.5,
-2, -3.977604, -5.575182, 1, -0.5, 0.5, 0.5,
-2, -3.977604, -5.575182, 1, 1.5, 0.5, 0.5,
-2, -3.977604, -5.575182, 0, 1.5, 0.5, 0.5,
-1, -3.977604, -5.575182, 0, -0.5, 0.5, 0.5,
-1, -3.977604, -5.575182, 1, -0.5, 0.5, 0.5,
-1, -3.977604, -5.575182, 1, 1.5, 0.5, 0.5,
-1, -3.977604, -5.575182, 0, 1.5, 0.5, 0.5,
0, -3.977604, -5.575182, 0, -0.5, 0.5, 0.5,
0, -3.977604, -5.575182, 1, -0.5, 0.5, 0.5,
0, -3.977604, -5.575182, 1, 1.5, 0.5, 0.5,
0, -3.977604, -5.575182, 0, 1.5, 0.5, 0.5,
1, -3.977604, -5.575182, 0, -0.5, 0.5, 0.5,
1, -3.977604, -5.575182, 1, -0.5, 0.5, 0.5,
1, -3.977604, -5.575182, 1, 1.5, 0.5, 0.5,
1, -3.977604, -5.575182, 0, 1.5, 0.5, 0.5,
2, -3.977604, -5.575182, 0, -0.5, 0.5, 0.5,
2, -3.977604, -5.575182, 1, -0.5, 0.5, 0.5,
2, -3.977604, -5.575182, 1, 1.5, 0.5, 0.5,
2, -3.977604, -5.575182, 0, 1.5, 0.5, 0.5,
3, -3.977604, -5.575182, 0, -0.5, 0.5, 0.5,
3, -3.977604, -5.575182, 1, -0.5, 0.5, 0.5,
3, -3.977604, -5.575182, 1, 1.5, 0.5, 0.5,
3, -3.977604, -5.575182, 0, 1.5, 0.5, 0.5
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
-3.138991, -3, -4.824158,
-3.138991, 3, -4.824158,
-3.138991, -3, -4.824158,
-3.308156, -3, -5.074499,
-3.138991, -2, -4.824158,
-3.308156, -2, -5.074499,
-3.138991, -1, -4.824158,
-3.308156, -1, -5.074499,
-3.138991, 0, -4.824158,
-3.308156, 0, -5.074499,
-3.138991, 1, -4.824158,
-3.308156, 1, -5.074499,
-3.138991, 2, -4.824158,
-3.308156, 2, -5.074499,
-3.138991, 3, -4.824158,
-3.308156, 3, -5.074499
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
-3.646487, -3, -5.575182, 0, -0.5, 0.5, 0.5,
-3.646487, -3, -5.575182, 1, -0.5, 0.5, 0.5,
-3.646487, -3, -5.575182, 1, 1.5, 0.5, 0.5,
-3.646487, -3, -5.575182, 0, 1.5, 0.5, 0.5,
-3.646487, -2, -5.575182, 0, -0.5, 0.5, 0.5,
-3.646487, -2, -5.575182, 1, -0.5, 0.5, 0.5,
-3.646487, -2, -5.575182, 1, 1.5, 0.5, 0.5,
-3.646487, -2, -5.575182, 0, 1.5, 0.5, 0.5,
-3.646487, -1, -5.575182, 0, -0.5, 0.5, 0.5,
-3.646487, -1, -5.575182, 1, -0.5, 0.5, 0.5,
-3.646487, -1, -5.575182, 1, 1.5, 0.5, 0.5,
-3.646487, -1, -5.575182, 0, 1.5, 0.5, 0.5,
-3.646487, 0, -5.575182, 0, -0.5, 0.5, 0.5,
-3.646487, 0, -5.575182, 1, -0.5, 0.5, 0.5,
-3.646487, 0, -5.575182, 1, 1.5, 0.5, 0.5,
-3.646487, 0, -5.575182, 0, 1.5, 0.5, 0.5,
-3.646487, 1, -5.575182, 0, -0.5, 0.5, 0.5,
-3.646487, 1, -5.575182, 1, -0.5, 0.5, 0.5,
-3.646487, 1, -5.575182, 1, 1.5, 0.5, 0.5,
-3.646487, 1, -5.575182, 0, 1.5, 0.5, 0.5,
-3.646487, 2, -5.575182, 0, -0.5, 0.5, 0.5,
-3.646487, 2, -5.575182, 1, -0.5, 0.5, 0.5,
-3.646487, 2, -5.575182, 1, 1.5, 0.5, 0.5,
-3.646487, 2, -5.575182, 0, 1.5, 0.5, 0.5,
-3.646487, 3, -5.575182, 0, -0.5, 0.5, 0.5,
-3.646487, 3, -5.575182, 1, -0.5, 0.5, 0.5,
-3.646487, 3, -5.575182, 1, 1.5, 0.5, 0.5,
-3.646487, 3, -5.575182, 0, 1.5, 0.5, 0.5
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
-3.138991, -3.451888, -4,
-3.138991, -3.451888, 4,
-3.138991, -3.451888, -4,
-3.308156, -3.627127, -4,
-3.138991, -3.451888, -2,
-3.308156, -3.627127, -2,
-3.138991, -3.451888, 0,
-3.308156, -3.627127, 0,
-3.138991, -3.451888, 2,
-3.308156, -3.627127, 2,
-3.138991, -3.451888, 4,
-3.308156, -3.627127, 4
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
-3.646487, -3.977604, -4, 0, -0.5, 0.5, 0.5,
-3.646487, -3.977604, -4, 1, -0.5, 0.5, 0.5,
-3.646487, -3.977604, -4, 1, 1.5, 0.5, 0.5,
-3.646487, -3.977604, -4, 0, 1.5, 0.5, 0.5,
-3.646487, -3.977604, -2, 0, -0.5, 0.5, 0.5,
-3.646487, -3.977604, -2, 1, -0.5, 0.5, 0.5,
-3.646487, -3.977604, -2, 1, 1.5, 0.5, 0.5,
-3.646487, -3.977604, -2, 0, 1.5, 0.5, 0.5,
-3.646487, -3.977604, 0, 0, -0.5, 0.5, 0.5,
-3.646487, -3.977604, 0, 1, -0.5, 0.5, 0.5,
-3.646487, -3.977604, 0, 1, 1.5, 0.5, 0.5,
-3.646487, -3.977604, 0, 0, 1.5, 0.5, 0.5,
-3.646487, -3.977604, 2, 0, -0.5, 0.5, 0.5,
-3.646487, -3.977604, 2, 1, -0.5, 0.5, 0.5,
-3.646487, -3.977604, 2, 1, 1.5, 0.5, 0.5,
-3.646487, -3.977604, 2, 0, 1.5, 0.5, 0.5,
-3.646487, -3.977604, 4, 0, -0.5, 0.5, 0.5,
-3.646487, -3.977604, 4, 1, -0.5, 0.5, 0.5,
-3.646487, -3.977604, 4, 1, 1.5, 0.5, 0.5,
-3.646487, -3.977604, 4, 0, 1.5, 0.5, 0.5
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
-3.138991, -3.451888, -4.824158,
-3.138991, 3.557651, -4.824158,
-3.138991, -3.451888, 5.1895,
-3.138991, 3.557651, 5.1895,
-3.138991, -3.451888, -4.824158,
-3.138991, -3.451888, 5.1895,
-3.138991, 3.557651, -4.824158,
-3.138991, 3.557651, 5.1895,
-3.138991, -3.451888, -4.824158,
3.627613, -3.451888, -4.824158,
-3.138991, -3.451888, 5.1895,
3.627613, -3.451888, 5.1895,
-3.138991, 3.557651, -4.824158,
3.627613, 3.557651, -4.824158,
-3.138991, 3.557651, 5.1895,
3.627613, 3.557651, 5.1895,
3.627613, -3.451888, -4.824158,
3.627613, 3.557651, -4.824158,
3.627613, -3.451888, 5.1895,
3.627613, 3.557651, 5.1895,
3.627613, -3.451888, -4.824158,
3.627613, -3.451888, 5.1895,
3.627613, 3.557651, -4.824158,
3.627613, 3.557651, 5.1895
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
var radius = 7.460339;
var distance = 33.19189;
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
mvMatrix.translate( -0.2443107, -0.05288148, -0.1826711 );
mvMatrix.scale( 1.19207, 1.150755, 0.8055264 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.19189);
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
Endosulfan<-read.table("Endosulfan.xyz", skip=1)
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
-3.040449, -0.5318428, -2.709188, 0, 0, 1, 1, 1,
-2.952406, -1.255659, 0.1642457, 1, 0, 0, 1, 1,
-2.934181, -1.124421, -3.371543, 1, 0, 0, 1, 1,
-2.734765, 0.02395165, -2.797775, 1, 0, 0, 1, 1,
-2.661949, -1.659624, -1.960205, 1, 0, 0, 1, 1,
-2.574862, 0.2806785, -1.416587, 1, 0, 0, 1, 1,
-2.476488, -0.4426835, 1.189362, 0, 0, 0, 1, 1,
-2.420069, -0.3376116, -3.050962, 0, 0, 0, 1, 1,
-2.330737, -0.364522, -2.059005, 0, 0, 0, 1, 1,
-2.267722, -0.3651369, -0.3229477, 0, 0, 0, 1, 1,
-2.240864, 0.7264218, -3.448287, 0, 0, 0, 1, 1,
-2.212711, -1.013981, -1.107813, 0, 0, 0, 1, 1,
-2.172661, 0.2866098, 0.02601073, 0, 0, 0, 1, 1,
-2.164313, -0.008540433, -2.438916, 1, 1, 1, 1, 1,
-2.155026, 1.666001, -2.821978, 1, 1, 1, 1, 1,
-2.140237, -0.455306, -0.811883, 1, 1, 1, 1, 1,
-2.111561, 1.004943, -2.006964, 1, 1, 1, 1, 1,
-2.105839, 0.1881758, -1.520513, 1, 1, 1, 1, 1,
-2.094051, -0.5798641, -1.675475, 1, 1, 1, 1, 1,
-2.091813, -2.642719, -2.283149, 1, 1, 1, 1, 1,
-2.035167, 1.910973, -0.4961215, 1, 1, 1, 1, 1,
-2.0154, 1.088657, -1.784699, 1, 1, 1, 1, 1,
-1.997867, 0.1545152, -0.04762925, 1, 1, 1, 1, 1,
-1.988041, -0.7808816, -0.8937326, 1, 1, 1, 1, 1,
-1.974621, -0.2015792, -1.183437, 1, 1, 1, 1, 1,
-1.965246, -1.029307, -2.265828, 1, 1, 1, 1, 1,
-1.948195, -0.07928109, -1.803467, 1, 1, 1, 1, 1,
-1.923284, -0.04922671, -0.1504932, 1, 1, 1, 1, 1,
-1.91332, -1.954557, -3.527795, 0, 0, 1, 1, 1,
-1.904259, -0.6594683, -2.748806, 1, 0, 0, 1, 1,
-1.880359, 1.314657, -1.651888, 1, 0, 0, 1, 1,
-1.857512, -0.1148381, -0.7568132, 1, 0, 0, 1, 1,
-1.793498, 0.7703939, -1.063008, 1, 0, 0, 1, 1,
-1.780496, 0.7182795, -2.06338, 1, 0, 0, 1, 1,
-1.767498, -0.3531546, -1.068408, 0, 0, 0, 1, 1,
-1.760863, -1.465441, -3.623323, 0, 0, 0, 1, 1,
-1.755889, 1.017639, -0.5186679, 0, 0, 0, 1, 1,
-1.753046, -0.7391238, -1.778045, 0, 0, 0, 1, 1,
-1.746752, 2.028043, 0.5109265, 0, 0, 0, 1, 1,
-1.73142, -1.00208, -3.670071, 0, 0, 0, 1, 1,
-1.719683, -0.9325688, -1.632465, 0, 0, 0, 1, 1,
-1.718425, -0.8729481, -1.882181, 1, 1, 1, 1, 1,
-1.716859, -1.28153, -1.269944, 1, 1, 1, 1, 1,
-1.697342, -0.8685337, -3.531992, 1, 1, 1, 1, 1,
-1.692231, -0.04828374, -1.182088, 1, 1, 1, 1, 1,
-1.690948, 0.2001675, -1.451198, 1, 1, 1, 1, 1,
-1.690926, 0.7663772, 0.2261148, 1, 1, 1, 1, 1,
-1.6732, -0.5276899, -3.235844, 1, 1, 1, 1, 1,
-1.668537, 1.420059, -0.00626647, 1, 1, 1, 1, 1,
-1.638753, -0.4334517, -1.802932, 1, 1, 1, 1, 1,
-1.638576, 1.242334, -1.346778, 1, 1, 1, 1, 1,
-1.634793, 0.9429694, -0.7900155, 1, 1, 1, 1, 1,
-1.620423, 0.5727324, -2.178534, 1, 1, 1, 1, 1,
-1.609706, -1.621885, -3.158765, 1, 1, 1, 1, 1,
-1.609347, 0.1577355, -1.000199, 1, 1, 1, 1, 1,
-1.609171, -0.1396823, -2.737987, 1, 1, 1, 1, 1,
-1.597069, 2.700321, -3.461941, 0, 0, 1, 1, 1,
-1.594226, -1.201504, -2.965499, 1, 0, 0, 1, 1,
-1.584131, -1.948913, -1.936376, 1, 0, 0, 1, 1,
-1.583181, -0.8872358, -3.438502, 1, 0, 0, 1, 1,
-1.566186, 0.4054833, 0.02425246, 1, 0, 0, 1, 1,
-1.560058, 2.001752, -2.330197, 1, 0, 0, 1, 1,
-1.558446, -1.614845, -2.794765, 0, 0, 0, 1, 1,
-1.557839, -0.9170073, -3.347939, 0, 0, 0, 1, 1,
-1.55516, 0.05963976, -0.8698839, 0, 0, 0, 1, 1,
-1.546495, 0.6853257, -1.084925, 0, 0, 0, 1, 1,
-1.545814, 0.07827564, -1.547623, 0, 0, 0, 1, 1,
-1.531981, -0.4904853, -1.328307, 0, 0, 0, 1, 1,
-1.528569, -1.336271, -0.7160131, 0, 0, 0, 1, 1,
-1.522318, 1.616779, -1.125058, 1, 1, 1, 1, 1,
-1.519459, 0.6529983, -2.257715, 1, 1, 1, 1, 1,
-1.517721, -0.2669086, -1.329089, 1, 1, 1, 1, 1,
-1.514132, 0.6988906, -0.3233065, 1, 1, 1, 1, 1,
-1.512863, 0.4312162, -2.449151, 1, 1, 1, 1, 1,
-1.512066, -0.09472356, -1.870736, 1, 1, 1, 1, 1,
-1.509297, 0.8427742, -0.2546352, 1, 1, 1, 1, 1,
-1.506801, -0.3101941, -1.838645, 1, 1, 1, 1, 1,
-1.50144, 0.4163266, -0.2416869, 1, 1, 1, 1, 1,
-1.489985, -0.3959437, -2.756418, 1, 1, 1, 1, 1,
-1.488586, -1.645518, -2.363488, 1, 1, 1, 1, 1,
-1.484806, 0.7624415, -0.6152428, 1, 1, 1, 1, 1,
-1.457635, 0.7019384, -0.02356144, 1, 1, 1, 1, 1,
-1.456369, -1.141083, -1.027299, 1, 1, 1, 1, 1,
-1.44312, -0.1910262, -3.216108, 1, 1, 1, 1, 1,
-1.442124, -1.829409, -1.996139, 0, 0, 1, 1, 1,
-1.441133, -0.4303965, -1.484225, 1, 0, 0, 1, 1,
-1.440552, -1.26843, -1.516754, 1, 0, 0, 1, 1,
-1.439095, 0.32086, 0.895077, 1, 0, 0, 1, 1,
-1.40737, -0.07648619, -1.083804, 1, 0, 0, 1, 1,
-1.40063, 1.048566, 1.205934, 1, 0, 0, 1, 1,
-1.398707, 0.6199136, -1.232116, 0, 0, 0, 1, 1,
-1.392976, 1.562231, 1.332575, 0, 0, 0, 1, 1,
-1.391381, 0.034107, -2.584666, 0, 0, 0, 1, 1,
-1.380046, 1.452263, -2.177251, 0, 0, 0, 1, 1,
-1.377192, -0.5291187, -2.481879, 0, 0, 0, 1, 1,
-1.360827, -0.8098177, -2.287894, 0, 0, 0, 1, 1,
-1.35806, -0.07113507, -2.502883, 0, 0, 0, 1, 1,
-1.357964, 0.1009884, -1.155539, 1, 1, 1, 1, 1,
-1.3514, 0.02801931, -1.268248, 1, 1, 1, 1, 1,
-1.341441, 1.434207, -1.112559, 1, 1, 1, 1, 1,
-1.337595, -0.9540737, -1.53091, 1, 1, 1, 1, 1,
-1.335581, 0.164305, -2.399579, 1, 1, 1, 1, 1,
-1.331793, -0.8836866, -1.920597, 1, 1, 1, 1, 1,
-1.324719, -1.556776, -3.211348, 1, 1, 1, 1, 1,
-1.319774, -0.1574631, -3.030566, 1, 1, 1, 1, 1,
-1.319607, -0.5093827, -0.9207404, 1, 1, 1, 1, 1,
-1.316489, 0.4403747, -1.900689, 1, 1, 1, 1, 1,
-1.312441, -0.7401561, -0.5184205, 1, 1, 1, 1, 1,
-1.311281, 0.2234797, -1.441368, 1, 1, 1, 1, 1,
-1.296766, -1.698658, -2.821718, 1, 1, 1, 1, 1,
-1.289149, 0.02011579, -1.776641, 1, 1, 1, 1, 1,
-1.285074, -0.3757854, -1.877748, 1, 1, 1, 1, 1,
-1.277186, 0.6037577, -1.451796, 0, 0, 1, 1, 1,
-1.275238, -0.5933105, -4.383714, 1, 0, 0, 1, 1,
-1.271671, -0.8967691, -3.235356, 1, 0, 0, 1, 1,
-1.267865, 0.3408925, -1.051819, 1, 0, 0, 1, 1,
-1.263991, 0.3935168, -1.392812, 1, 0, 0, 1, 1,
-1.263664, 0.7055308, -2.486259, 1, 0, 0, 1, 1,
-1.263187, -1.823177, -3.22331, 0, 0, 0, 1, 1,
-1.245233, -0.6745857, -1.29389, 0, 0, 0, 1, 1,
-1.241309, -0.5200191, -1.888592, 0, 0, 0, 1, 1,
-1.238506, 0.03535101, -1.427172, 0, 0, 0, 1, 1,
-1.236124, -1.294878, -3.01163, 0, 0, 0, 1, 1,
-1.234775, -0.7600453, -3.605781, 0, 0, 0, 1, 1,
-1.232977, -0.1009869, -0.5870465, 0, 0, 0, 1, 1,
-1.211065, 0.08291766, -0.6159725, 1, 1, 1, 1, 1,
-1.205616, 0.4535571, 0.05829304, 1, 1, 1, 1, 1,
-1.205427, -1.047001, -2.619364, 1, 1, 1, 1, 1,
-1.203046, 0.2066769, -1.89462, 1, 1, 1, 1, 1,
-1.200431, 0.140636, 0.2721377, 1, 1, 1, 1, 1,
-1.196113, -0.339669, -2.194834, 1, 1, 1, 1, 1,
-1.194879, -0.919517, -4.133762, 1, 1, 1, 1, 1,
-1.191683, -0.3963781, -0.7977591, 1, 1, 1, 1, 1,
-1.183587, 0.9117121, -0.1608726, 1, 1, 1, 1, 1,
-1.164587, -1.841609, -3.565585, 1, 1, 1, 1, 1,
-1.164581, 0.9042149, -0.934342, 1, 1, 1, 1, 1,
-1.145917, 0.3907948, -2.066806, 1, 1, 1, 1, 1,
-1.142747, 0.4702868, -2.117015, 1, 1, 1, 1, 1,
-1.142684, -0.8702549, -1.267939, 1, 1, 1, 1, 1,
-1.129004, -0.9426761, -0.7749961, 1, 1, 1, 1, 1,
-1.127127, 1.481948, 0.4367326, 0, 0, 1, 1, 1,
-1.125861, 0.3111609, -0.6784059, 1, 0, 0, 1, 1,
-1.124626, -0.3457496, -1.979328, 1, 0, 0, 1, 1,
-1.119881, 0.1007717, -0.4681436, 1, 0, 0, 1, 1,
-1.109754, 0.3404596, -0.4773485, 1, 0, 0, 1, 1,
-1.107087, -0.1859483, -1.492822, 1, 0, 0, 1, 1,
-1.106431, -1.216524, -0.9322504, 0, 0, 0, 1, 1,
-1.101101, -0.3136442, -1.580437, 0, 0, 0, 1, 1,
-1.094881, 0.06143602, -2.655063, 0, 0, 0, 1, 1,
-1.092826, 0.4639149, -3.005405, 0, 0, 0, 1, 1,
-1.086151, 0.2130219, -1.862057, 0, 0, 0, 1, 1,
-1.083634, 1.100793, -1.89995, 0, 0, 0, 1, 1,
-1.0814, 0.5090572, -1.826792, 0, 0, 0, 1, 1,
-1.080913, 0.4416017, -1.792942, 1, 1, 1, 1, 1,
-1.070716, 1.378554, -0.007543448, 1, 1, 1, 1, 1,
-1.066926, 0.5307685, -2.487152, 1, 1, 1, 1, 1,
-1.055813, -2.5424, -1.633527, 1, 1, 1, 1, 1,
-1.055764, 0.3207989, -3.908678, 1, 1, 1, 1, 1,
-1.054852, 0.4884911, -2.134239, 1, 1, 1, 1, 1,
-1.052898, 0.05522714, -1.335021, 1, 1, 1, 1, 1,
-1.04892, 0.3970236, -0.8794656, 1, 1, 1, 1, 1,
-1.048811, 1.171279, -2.140568, 1, 1, 1, 1, 1,
-1.04694, -0.06150924, -0.5933033, 1, 1, 1, 1, 1,
-1.046396, 0.4468804, -0.2237125, 1, 1, 1, 1, 1,
-1.039533, -1.230394, -3.567694, 1, 1, 1, 1, 1,
-1.033845, -1.119175, -3.517081, 1, 1, 1, 1, 1,
-1.032981, 0.2834859, -0.1561463, 1, 1, 1, 1, 1,
-1.026782, -0.8798064, -1.138955, 1, 1, 1, 1, 1,
-1.012647, -0.3871951, -2.0845, 0, 0, 1, 1, 1,
-1.012619, 1.151395, -2.245166, 1, 0, 0, 1, 1,
-1.010571, -1.572898, -2.426366, 1, 0, 0, 1, 1,
-1.009313, 0.4228444, -2.098695, 1, 0, 0, 1, 1,
-1.007901, -0.7327061, -2.369298, 1, 0, 0, 1, 1,
-1.006072, -0.6019153, -2.432505, 1, 0, 0, 1, 1,
-1.001441, -0.0438075, -2.473106, 0, 0, 0, 1, 1,
-0.9942388, 0.2507814, -1.725719, 0, 0, 0, 1, 1,
-0.9798052, -0.4627892, -1.223041, 0, 0, 0, 1, 1,
-0.9779798, 1.023938, 0.2517655, 0, 0, 0, 1, 1,
-0.9753101, -0.1926098, -1.086274, 0, 0, 0, 1, 1,
-0.9720096, 0.01087515, -0.366133, 0, 0, 0, 1, 1,
-0.9706649, 0.008261667, -2.004967, 0, 0, 0, 1, 1,
-0.9596633, -0.3929599, -2.359099, 1, 1, 1, 1, 1,
-0.958086, -0.1663517, -2.106161, 1, 1, 1, 1, 1,
-0.9575555, 1.00439, -1.331133, 1, 1, 1, 1, 1,
-0.9506611, -1.002009, -2.403409, 1, 1, 1, 1, 1,
-0.9486243, 2.66869, -0.905795, 1, 1, 1, 1, 1,
-0.9267861, -1.522955, -1.957169, 1, 1, 1, 1, 1,
-0.9255209, -0.5938198, -3.681872, 1, 1, 1, 1, 1,
-0.9236504, 0.2389182, -0.9433828, 1, 1, 1, 1, 1,
-0.9222633, 1.023736, -0.651089, 1, 1, 1, 1, 1,
-0.9176607, -0.2178254, -2.282891, 1, 1, 1, 1, 1,
-0.9149315, 0.7529811, -2.07931, 1, 1, 1, 1, 1,
-0.9130054, -2.052557, -0.3311283, 1, 1, 1, 1, 1,
-0.9118225, -0.06018435, -1.048192, 1, 1, 1, 1, 1,
-0.9114169, -0.8184906, -4.470952, 1, 1, 1, 1, 1,
-0.9072464, -0.9690276, -4.66538, 1, 1, 1, 1, 1,
-0.9062814, 1.043115, 0.3507353, 0, 0, 1, 1, 1,
-0.9026868, -0.3947634, -0.45808, 1, 0, 0, 1, 1,
-0.9013326, 0.644456, -0.2646705, 1, 0, 0, 1, 1,
-0.8970248, 0.4346892, -0.3460729, 1, 0, 0, 1, 1,
-0.8950868, 1.292714, -1.36951, 1, 0, 0, 1, 1,
-0.8947844, 1.583377, 0.08432996, 1, 0, 0, 1, 1,
-0.8935077, 0.3600033, -1.280027, 0, 0, 0, 1, 1,
-0.8911306, 0.645329, -1.961062, 0, 0, 0, 1, 1,
-0.8901079, -0.5784007, -3.381397, 0, 0, 0, 1, 1,
-0.8884732, -1.744285, -2.88122, 0, 0, 0, 1, 1,
-0.8818237, -2.004432, -3.250497, 0, 0, 0, 1, 1,
-0.8731791, -0.248981, -2.562156, 0, 0, 0, 1, 1,
-0.8678749, -0.3594733, -2.422508, 0, 0, 0, 1, 1,
-0.8669843, -0.02800159, -1.631924, 1, 1, 1, 1, 1,
-0.8661764, -0.3448526, -1.575331, 1, 1, 1, 1, 1,
-0.8660921, -0.9689969, -3.773316, 1, 1, 1, 1, 1,
-0.8609144, -1.242125, -1.317558, 1, 1, 1, 1, 1,
-0.8573393, 0.02026721, -1.720368, 1, 1, 1, 1, 1,
-0.8533303, -0.3818923, -0.8506873, 1, 1, 1, 1, 1,
-0.8484232, 0.2531812, -1.744509, 1, 1, 1, 1, 1,
-0.8469663, 0.1156047, 0.0316155, 1, 1, 1, 1, 1,
-0.8405532, -0.04683756, -0.9234024, 1, 1, 1, 1, 1,
-0.8372994, -0.7947764, -2.61512, 1, 1, 1, 1, 1,
-0.8326451, 0.3134106, -2.675396, 1, 1, 1, 1, 1,
-0.8323722, 1.924938, -0.7858483, 1, 1, 1, 1, 1,
-0.8320666, -1.702841, -1.105824, 1, 1, 1, 1, 1,
-0.830634, 0.5315428, -1.809079, 1, 1, 1, 1, 1,
-0.8217235, 0.09912346, -2.286552, 1, 1, 1, 1, 1,
-0.8212424, 1.312056, -0.5793225, 0, 0, 1, 1, 1,
-0.8195871, -0.7541075, -2.953548, 1, 0, 0, 1, 1,
-0.8090858, 0.6915956, -2.158243, 1, 0, 0, 1, 1,
-0.8075036, 1.905644, -0.02705224, 1, 0, 0, 1, 1,
-0.8014486, 1.366951, -0.8092585, 1, 0, 0, 1, 1,
-0.7948543, -1.371962, -3.607033, 1, 0, 0, 1, 1,
-0.7903041, -0.2152973, -1.381085, 0, 0, 0, 1, 1,
-0.7785419, -0.1608313, -1.923486, 0, 0, 0, 1, 1,
-0.7709057, 0.6202948, -0.4140633, 0, 0, 0, 1, 1,
-0.7608368, -0.2715474, -1.800604, 0, 0, 0, 1, 1,
-0.7605401, 0.3350434, -2.18644, 0, 0, 0, 1, 1,
-0.757292, 1.071806, -0.6232045, 0, 0, 0, 1, 1,
-0.7566717, -0.9835884, -2.108496, 0, 0, 0, 1, 1,
-0.7484767, -1.491006, -1.624875, 1, 1, 1, 1, 1,
-0.7457857, 1.329867, 0.1748506, 1, 1, 1, 1, 1,
-0.7441912, 0.1480583, -1.407349, 1, 1, 1, 1, 1,
-0.7423142, 1.616338, -0.9954345, 1, 1, 1, 1, 1,
-0.7403888, -1.75172, -3.593328, 1, 1, 1, 1, 1,
-0.7316563, -0.3196353, -0.05579579, 1, 1, 1, 1, 1,
-0.7310939, 1.597072, -1.153565, 1, 1, 1, 1, 1,
-0.7205181, -1.01026, -2.337549, 1, 1, 1, 1, 1,
-0.7184207, -1.702077, -3.170207, 1, 1, 1, 1, 1,
-0.7105855, -1.042988, -4.400413, 1, 1, 1, 1, 1,
-0.7071397, 1.504104, -1.619221, 1, 1, 1, 1, 1,
-0.702626, 0.6348438, -0.7285497, 1, 1, 1, 1, 1,
-0.6926363, -1.601522, -3.867476, 1, 1, 1, 1, 1,
-0.691659, 0.2732558, -2.399071, 1, 1, 1, 1, 1,
-0.6889874, 0.4661424, -0.01450557, 1, 1, 1, 1, 1,
-0.6858079, -1.418584, -3.104623, 0, 0, 1, 1, 1,
-0.6857382, 1.48016, -0.6951799, 1, 0, 0, 1, 1,
-0.6833047, -0.1038984, -2.379498, 1, 0, 0, 1, 1,
-0.6781648, 0.3935335, -0.3555636, 1, 0, 0, 1, 1,
-0.6769274, -1.517004, -3.857337, 1, 0, 0, 1, 1,
-0.6713266, 0.4910339, -1.7708, 1, 0, 0, 1, 1,
-0.667071, -0.06156514, -2.606398, 0, 0, 0, 1, 1,
-0.664349, -0.7273086, -2.067484, 0, 0, 0, 1, 1,
-0.6638526, 0.7269602, -2.793445, 0, 0, 0, 1, 1,
-0.6620651, 0.4410487, -0.7827278, 0, 0, 0, 1, 1,
-0.6599125, 3.34326, -1.785425, 0, 0, 0, 1, 1,
-0.6538671, -1.112239, -3.042228, 0, 0, 0, 1, 1,
-0.6522532, -1.963004, -3.798004, 0, 0, 0, 1, 1,
-0.6499386, 1.433057, -1.0088, 1, 1, 1, 1, 1,
-0.6464384, 0.8863569, -0.3717837, 1, 1, 1, 1, 1,
-0.6446106, 0.6482574, -0.09651228, 1, 1, 1, 1, 1,
-0.641587, 0.5097481, -1.39231, 1, 1, 1, 1, 1,
-0.6238047, 0.8744883, 0.3597966, 1, 1, 1, 1, 1,
-0.6219758, -0.007711266, -0.8211216, 1, 1, 1, 1, 1,
-0.6183643, -1.45834, -2.548122, 1, 1, 1, 1, 1,
-0.6183136, 0.8216213, 0.542345, 1, 1, 1, 1, 1,
-0.6137632, -1.96577, -2.126688, 1, 1, 1, 1, 1,
-0.6130175, -0.09571239, -1.941848, 1, 1, 1, 1, 1,
-0.610849, -2.841811, -4.416436, 1, 1, 1, 1, 1,
-0.609753, 1.151101, 0.4448011, 1, 1, 1, 1, 1,
-0.6083088, -2.056429, -2.985763, 1, 1, 1, 1, 1,
-0.6030568, -0.8775293, -1.959578, 1, 1, 1, 1, 1,
-0.5868137, -1.250773, -3.79193, 1, 1, 1, 1, 1,
-0.5803972, -0.1934469, -2.06617, 0, 0, 1, 1, 1,
-0.5802093, -2.753281, -4.315213, 1, 0, 0, 1, 1,
-0.5744945, 2.61398, 0.5749583, 1, 0, 0, 1, 1,
-0.5734804, 2.163253, 0.2454768, 1, 0, 0, 1, 1,
-0.5699193, 1.042265, -2.253725, 1, 0, 0, 1, 1,
-0.5662957, -0.8835682, -3.706022, 1, 0, 0, 1, 1,
-0.5640348, 0.2887884, -0.3239135, 0, 0, 0, 1, 1,
-0.5560285, -0.6675748, -1.978883, 0, 0, 0, 1, 1,
-0.5530632, 2.057624, 0.1275466, 0, 0, 0, 1, 1,
-0.5528003, 1.29071, 0.318725, 0, 0, 0, 1, 1,
-0.5521699, -1.429724, -3.539174, 0, 0, 0, 1, 1,
-0.5467528, 0.2848651, -0.5786955, 0, 0, 0, 1, 1,
-0.5463625, 1.143442, 0.5613441, 0, 0, 0, 1, 1,
-0.5445128, -1.102501, -3.228795, 1, 1, 1, 1, 1,
-0.5392827, -1.653413, -3.000851, 1, 1, 1, 1, 1,
-0.5318223, -0.9598371, -4.018231, 1, 1, 1, 1, 1,
-0.5279062, -0.6050192, -1.058099, 1, 1, 1, 1, 1,
-0.5235332, 0.2207272, -2.418336, 1, 1, 1, 1, 1,
-0.5227416, 0.1946433, -0.1760855, 1, 1, 1, 1, 1,
-0.5223306, 0.7347416, -0.6725093, 1, 1, 1, 1, 1,
-0.5214682, 0.02950162, -0.6489809, 1, 1, 1, 1, 1,
-0.5214547, -0.9105641, -1.077342, 1, 1, 1, 1, 1,
-0.5165452, 1.014359, -2.144112, 1, 1, 1, 1, 1,
-0.5137371, 0.06668354, -0.8641132, 1, 1, 1, 1, 1,
-0.5120589, 0.3905181, -0.5097638, 1, 1, 1, 1, 1,
-0.5108509, -0.7401628, -1.821403, 1, 1, 1, 1, 1,
-0.5046897, -0.9899009, -0.7430182, 1, 1, 1, 1, 1,
-0.5038916, -0.7069777, -1.847707, 1, 1, 1, 1, 1,
-0.4980581, -0.4755445, -2.67588, 0, 0, 1, 1, 1,
-0.4865798, 0.2680151, -0.7395965, 1, 0, 0, 1, 1,
-0.4856806, 0.275821, -2.103108, 1, 0, 0, 1, 1,
-0.4841482, -0.1875922, -2.359916, 1, 0, 0, 1, 1,
-0.4793044, 0.929808, -1.586186, 1, 0, 0, 1, 1,
-0.477899, -1.290895, -3.382023, 1, 0, 0, 1, 1,
-0.4769289, -0.7024812, -2.186481, 0, 0, 0, 1, 1,
-0.4758083, -1.315978, -3.624848, 0, 0, 0, 1, 1,
-0.4739318, 0.2842865, -1.835946, 0, 0, 0, 1, 1,
-0.4726292, -0.5783445, -4.296118, 0, 0, 0, 1, 1,
-0.4714636, 0.1795273, -0.7208171, 0, 0, 0, 1, 1,
-0.4632913, 0.07647443, -1.008778, 0, 0, 0, 1, 1,
-0.4587978, 0.2628869, -2.143931, 0, 0, 0, 1, 1,
-0.4571781, 1.581723, -0.1514642, 1, 1, 1, 1, 1,
-0.45619, 0.6322731, 0.2382587, 1, 1, 1, 1, 1,
-0.4557387, 0.37576, -0.6239824, 1, 1, 1, 1, 1,
-0.4529163, -1.059503, -1.479314, 1, 1, 1, 1, 1,
-0.4497478, 1.181357, 0.1723272, 1, 1, 1, 1, 1,
-0.4497352, -0.003701843, -0.6402644, 1, 1, 1, 1, 1,
-0.44927, 1.297963, -1.575473, 1, 1, 1, 1, 1,
-0.4473888, 0.4203963, -1.120616, 1, 1, 1, 1, 1,
-0.4465673, -1.139648, -3.881589, 1, 1, 1, 1, 1,
-0.4463658, -0.172445, -3.144117, 1, 1, 1, 1, 1,
-0.4450447, 0.07635076, -0.449011, 1, 1, 1, 1, 1,
-0.4445415, -0.09771055, -1.572588, 1, 1, 1, 1, 1,
-0.442771, 0.2566004, -0.9252023, 1, 1, 1, 1, 1,
-0.4411292, -0.1997743, -2.876746, 1, 1, 1, 1, 1,
-0.4365492, 1.334406, 0.2015348, 1, 1, 1, 1, 1,
-0.4324076, 0.09813569, -0.9372742, 0, 0, 1, 1, 1,
-0.4267358, -1.045131, -3.759528, 1, 0, 0, 1, 1,
-0.4229054, 0.07736034, -1.209245, 1, 0, 0, 1, 1,
-0.4154889, 0.3317301, -1.033842, 1, 0, 0, 1, 1,
-0.4132394, -0.9453344, -3.764262, 1, 0, 0, 1, 1,
-0.4128076, -0.0308106, -0.2637207, 1, 0, 0, 1, 1,
-0.412219, -0.4175426, -3.814903, 0, 0, 0, 1, 1,
-0.4116269, 0.3859602, -0.9619722, 0, 0, 0, 1, 1,
-0.4100074, -0.2450789, -3.31796, 0, 0, 0, 1, 1,
-0.4011972, 0.2946793, -1.638865, 0, 0, 0, 1, 1,
-0.4011331, 0.2689543, -1.394034, 0, 0, 0, 1, 1,
-0.397468, -0.4883545, -3.570205, 0, 0, 0, 1, 1,
-0.392703, -1.258373, -1.298039, 0, 0, 0, 1, 1,
-0.3898407, -0.2486716, -1.794225, 1, 1, 1, 1, 1,
-0.382911, -0.2548489, -3.281489, 1, 1, 1, 1, 1,
-0.3765625, -0.1740433, -2.882467, 1, 1, 1, 1, 1,
-0.3744881, 0.1906512, -0.7432156, 1, 1, 1, 1, 1,
-0.3649225, -0.67271, 0.3137619, 1, 1, 1, 1, 1,
-0.3618287, -1.420152, -3.45272, 1, 1, 1, 1, 1,
-0.3509917, 0.8214629, 0.5103912, 1, 1, 1, 1, 1,
-0.3509662, -1.944008, -3.819757, 1, 1, 1, 1, 1,
-0.3507234, 0.08437707, 1.007477, 1, 1, 1, 1, 1,
-0.3469336, 0.07345189, -2.017864, 1, 1, 1, 1, 1,
-0.3460481, 3.45557, 0.8714863, 1, 1, 1, 1, 1,
-0.3427224, -2.73053, -3.356986, 1, 1, 1, 1, 1,
-0.3413953, 0.3074038, -0.2802332, 1, 1, 1, 1, 1,
-0.3380325, 0.8450232, -0.4483429, 1, 1, 1, 1, 1,
-0.3374875, 0.3355484, 0.8300532, 1, 1, 1, 1, 1,
-0.3312059, 0.3850813, -0.7032811, 0, 0, 1, 1, 1,
-0.3275043, 0.4773419, -1.633026, 1, 0, 0, 1, 1,
-0.3266032, -0.9864144, -3.656953, 1, 0, 0, 1, 1,
-0.3204204, 0.9416466, -0.7082572, 1, 0, 0, 1, 1,
-0.3196468, 0.4460749, -0.3242296, 1, 0, 0, 1, 1,
-0.3155231, -0.732626, -2.052557, 1, 0, 0, 1, 1,
-0.3140462, -0.8327966, -1.617259, 0, 0, 0, 1, 1,
-0.3126033, -0.2634487, -0.3672245, 0, 0, 0, 1, 1,
-0.3108817, -0.7728044, -2.392174, 0, 0, 0, 1, 1,
-0.309004, 0.7820321, 0.5605638, 0, 0, 0, 1, 1,
-0.308753, 1.298759, 1.105774, 0, 0, 0, 1, 1,
-0.3087398, 0.4061743, 0.01452801, 0, 0, 0, 1, 1,
-0.306306, -1.25971, -2.484827, 0, 0, 0, 1, 1,
-0.3044653, -0.5261217, -2.157575, 1, 1, 1, 1, 1,
-0.3039166, -3.349808, -2.808, 1, 1, 1, 1, 1,
-0.3025363, 0.4197724, -0.1815594, 1, 1, 1, 1, 1,
-0.2942758, 0.5133346, 0.1059762, 1, 1, 1, 1, 1,
-0.2941521, -1.764582, -2.967129, 1, 1, 1, 1, 1,
-0.2921011, -1.147461, -3.176207, 1, 1, 1, 1, 1,
-0.2891001, 1.021275, 0.09557487, 1, 1, 1, 1, 1,
-0.2869652, -2.42763, -3.764195, 1, 1, 1, 1, 1,
-0.2862777, 0.9352839, 1.535996, 1, 1, 1, 1, 1,
-0.28445, -2.867201, -2.906267, 1, 1, 1, 1, 1,
-0.2791822, -0.8270472, -0.8911451, 1, 1, 1, 1, 1,
-0.2786291, 0.1008801, -0.01480707, 1, 1, 1, 1, 1,
-0.2753306, -0.820224, -2.741756, 1, 1, 1, 1, 1,
-0.2715582, -0.7220214, -2.189001, 1, 1, 1, 1, 1,
-0.270785, 0.6760494, 0.03223043, 1, 1, 1, 1, 1,
-0.2678323, 0.1966347, -0.5677763, 0, 0, 1, 1, 1,
-0.2674165, 0.299452, 0.1066165, 1, 0, 0, 1, 1,
-0.2628869, 0.3410528, 0.3412867, 1, 0, 0, 1, 1,
-0.2623111, -0.4702684, -3.770644, 1, 0, 0, 1, 1,
-0.2593473, -1.595382, -2.272675, 1, 0, 0, 1, 1,
-0.2577145, 0.1491803, -1.583577, 1, 0, 0, 1, 1,
-0.2563645, -0.2991419, -4.22499, 0, 0, 0, 1, 1,
-0.2505747, -0.1747793, -3.147894, 0, 0, 0, 1, 1,
-0.2376079, 0.218022, -2.529607, 0, 0, 0, 1, 1,
-0.2337946, 1.053904, -0.03085799, 0, 0, 0, 1, 1,
-0.2328891, 0.3706036, -0.829012, 0, 0, 0, 1, 1,
-0.232732, 0.06300596, -0.1191748, 0, 0, 0, 1, 1,
-0.2324392, -1.877012, -2.238186, 0, 0, 0, 1, 1,
-0.2283412, -1.044726, -2.246043, 1, 1, 1, 1, 1,
-0.2243615, -0.02161695, -1.97037, 1, 1, 1, 1, 1,
-0.2173261, 0.6850718, 0.03158744, 1, 1, 1, 1, 1,
-0.212081, 0.9957925, -2.29524, 1, 1, 1, 1, 1,
-0.2113025, 1.129179, -1.172356, 1, 1, 1, 1, 1,
-0.2092132, -0.3786578, -2.85176, 1, 1, 1, 1, 1,
-0.2079369, -0.443012, -1.363778, 1, 1, 1, 1, 1,
-0.2058263, -0.4836121, -1.485289, 1, 1, 1, 1, 1,
-0.2031069, 2.302871, 1.838027, 1, 1, 1, 1, 1,
-0.2017834, 1.345471, 0.9684476, 1, 1, 1, 1, 1,
-0.2012279, 1.057663, -1.098233, 1, 1, 1, 1, 1,
-0.20107, -0.918151, -3.182077, 1, 1, 1, 1, 1,
-0.200547, 0.7008846, 0.9058307, 1, 1, 1, 1, 1,
-0.1963613, 0.7467706, 0.0102794, 1, 1, 1, 1, 1,
-0.1954013, -0.04189936, -2.154896, 1, 1, 1, 1, 1,
-0.1934699, -1.111245, -4.678328, 0, 0, 1, 1, 1,
-0.1853701, -0.1350001, -0.9638143, 1, 0, 0, 1, 1,
-0.1833676, -1.369595, -4.436107, 1, 0, 0, 1, 1,
-0.1818873, 2.247174, 1.620359, 1, 0, 0, 1, 1,
-0.181362, -0.4552973, -2.591987, 1, 0, 0, 1, 1,
-0.1780163, -0.8458992, -3.526342, 1, 0, 0, 1, 1,
-0.1758218, -1.859593, -4.174621, 0, 0, 0, 1, 1,
-0.1675923, 1.878836, -1.06121, 0, 0, 0, 1, 1,
-0.16552, 0.03345278, 0.4473337, 0, 0, 0, 1, 1,
-0.1617611, -0.05731559, -0.7056448, 0, 0, 0, 1, 1,
-0.1543476, 1.290584, -0.742335, 0, 0, 0, 1, 1,
-0.1483021, -1.217093, -2.194055, 0, 0, 0, 1, 1,
-0.1482482, -2.613203, -3.206861, 0, 0, 0, 1, 1,
-0.1479614, -2.008149, -2.016471, 1, 1, 1, 1, 1,
-0.1473124, -0.03744559, -2.727968, 1, 1, 1, 1, 1,
-0.1417341, 2.251161, 0.1538379, 1, 1, 1, 1, 1,
-0.138128, 1.354188, 0.3344078, 1, 1, 1, 1, 1,
-0.1372013, 0.7952793, -0.6239823, 1, 1, 1, 1, 1,
-0.1355109, -0.537132, -2.94124, 1, 1, 1, 1, 1,
-0.1349084, -0.2129536, -3.013978, 1, 1, 1, 1, 1,
-0.1316986, -0.2450848, -3.591661, 1, 1, 1, 1, 1,
-0.1296235, 0.7380269, 0.8625895, 1, 1, 1, 1, 1,
-0.1266223, 1.469736, 0.9191028, 1, 1, 1, 1, 1,
-0.1246659, 0.2000909, 0.5142286, 1, 1, 1, 1, 1,
-0.1214307, -0.5208073, -2.99287, 1, 1, 1, 1, 1,
-0.1038974, -1.368701, -3.585028, 1, 1, 1, 1, 1,
-0.1038892, 0.3776305, 0.2475075, 1, 1, 1, 1, 1,
-0.1031101, -0.2634325, -2.476681, 1, 1, 1, 1, 1,
-0.1025911, 0.7528673, 1.445805, 0, 0, 1, 1, 1,
-0.1006452, -0.6538371, -2.260758, 1, 0, 0, 1, 1,
-0.0989963, 0.007725917, -0.9351401, 1, 0, 0, 1, 1,
-0.09736194, -0.9669525, -2.17987, 1, 0, 0, 1, 1,
-0.09343045, -0.2061537, -3.200239, 1, 0, 0, 1, 1,
-0.09161438, -0.1888401, -2.42816, 1, 0, 0, 1, 1,
-0.08595783, -0.8405632, -3.960367, 0, 0, 0, 1, 1,
-0.08227333, 1.71108, 0.06547377, 0, 0, 0, 1, 1,
-0.07729037, 0.3098594, 0.1745939, 0, 0, 0, 1, 1,
-0.07514052, 0.8352734, -2.371095, 0, 0, 0, 1, 1,
-0.07492895, 1.635048, 0.04971412, 0, 0, 0, 1, 1,
-0.07056731, -0.8578005, -4.060009, 0, 0, 0, 1, 1,
-0.06755441, -0.005773209, -1.993122, 0, 0, 0, 1, 1,
-0.06751236, -0.3375182, -3.224267, 1, 1, 1, 1, 1,
-0.06560914, -1.5657, -1.788864, 1, 1, 1, 1, 1,
-0.06342452, 0.7877964, 1.514448, 1, 1, 1, 1, 1,
-0.05968098, -0.1306175, -1.537216, 1, 1, 1, 1, 1,
-0.05753019, 0.2563943, 0.1160672, 1, 1, 1, 1, 1,
-0.05545311, -1.550128, -3.697738, 1, 1, 1, 1, 1,
-0.05519784, 1.209001, 0.9347818, 1, 1, 1, 1, 1,
-0.05501379, -0.8900388, -2.433437, 1, 1, 1, 1, 1,
-0.04969198, 1.852985, -0.5480509, 1, 1, 1, 1, 1,
-0.04551049, -1.645383, -3.489881, 1, 1, 1, 1, 1,
-0.04277186, -0.0184042, -2.475225, 1, 1, 1, 1, 1,
-0.03936803, -0.473918, -3.220818, 1, 1, 1, 1, 1,
-0.03914807, -0.7410368, -3.120607, 1, 1, 1, 1, 1,
-0.0351489, 1.215551, -0.3428948, 1, 1, 1, 1, 1,
-0.03506132, 0.7269138, -1.415173, 1, 1, 1, 1, 1,
-0.02992344, 0.3580252, -0.0940694, 0, 0, 1, 1, 1,
-0.02882357, -0.5771344, -3.696106, 1, 0, 0, 1, 1,
-0.02576203, 1.234599, 0.318698, 1, 0, 0, 1, 1,
-0.01375233, 0.5145763, 0.7279608, 1, 0, 0, 1, 1,
-0.01103382, 0.5264141, -2.03678, 1, 0, 0, 1, 1,
-0.001539779, 0.8401377, -1.108481, 1, 0, 0, 1, 1,
0.006488679, 1.008046, -0.193335, 0, 0, 0, 1, 1,
0.01354598, 0.007610887, 0.3343606, 0, 0, 0, 1, 1,
0.01661243, 0.08167738, 1.534621, 0, 0, 0, 1, 1,
0.02196925, -0.254045, 2.962704, 0, 0, 0, 1, 1,
0.02644, 1.177005, -0.739346, 0, 0, 0, 1, 1,
0.0270472, -0.1474436, 0.9517617, 0, 0, 0, 1, 1,
0.03011577, -0.09898516, 3.706741, 0, 0, 0, 1, 1,
0.03262615, 0.6296248, 0.6161404, 1, 1, 1, 1, 1,
0.03324864, 1.139283, -1.733159, 1, 1, 1, 1, 1,
0.03779277, -0.2168832, 3.000048, 1, 1, 1, 1, 1,
0.0408373, 1.049699, -0.15221, 1, 1, 1, 1, 1,
0.04135035, -0.4948982, 3.49029, 1, 1, 1, 1, 1,
0.04340141, 0.05013747, 1.212298, 1, 1, 1, 1, 1,
0.04455224, -1.985074, 4.8067, 1, 1, 1, 1, 1,
0.04518449, 0.3582185, 1.466324, 1, 1, 1, 1, 1,
0.04631126, -1.26035, 4.643439, 1, 1, 1, 1, 1,
0.05455824, 1.055059, 1.664045, 1, 1, 1, 1, 1,
0.05567408, 1.683028, -0.2156692, 1, 1, 1, 1, 1,
0.06236938, 0.8474787, 0.8040472, 1, 1, 1, 1, 1,
0.06288064, 0.9478406, -1.254378, 1, 1, 1, 1, 1,
0.07331987, -0.04210896, 1.552041, 1, 1, 1, 1, 1,
0.07512926, -0.5047713, 2.333873, 1, 1, 1, 1, 1,
0.0763369, -0.2746057, 2.854592, 0, 0, 1, 1, 1,
0.07668885, 0.8317091, 0.5858706, 1, 0, 0, 1, 1,
0.07708973, 0.3324047, 1.100326, 1, 0, 0, 1, 1,
0.07964566, -0.4646049, 3.858406, 1, 0, 0, 1, 1,
0.07991771, 1.536094, 2.031951, 1, 0, 0, 1, 1,
0.08355064, 0.3157931, 0.7464422, 1, 0, 0, 1, 1,
0.08382535, 0.9257931, 0.3828047, 0, 0, 0, 1, 1,
0.08444458, -0.5372966, 1.790779, 0, 0, 0, 1, 1,
0.09012352, -0.07166639, 2.907551, 0, 0, 0, 1, 1,
0.09052953, 0.8207312, -0.01754279, 0, 0, 0, 1, 1,
0.09094419, -0.7458517, 2.798448, 0, 0, 0, 1, 1,
0.09192728, 0.4296628, -1.187322, 0, 0, 0, 1, 1,
0.09337612, -0.4568248, 2.746335, 0, 0, 0, 1, 1,
0.09521506, -0.6031235, 1.500081, 1, 1, 1, 1, 1,
0.09708673, 0.6395071, 0.6766776, 1, 1, 1, 1, 1,
0.09798703, 1.174768, 0.1341905, 1, 1, 1, 1, 1,
0.09905042, 0.6315032, 0.1549207, 1, 1, 1, 1, 1,
0.09962849, 0.1099059, 2.330479, 1, 1, 1, 1, 1,
0.1003956, -1.525403, 2.351535, 1, 1, 1, 1, 1,
0.1021929, 1.395468, -0.005866767, 1, 1, 1, 1, 1,
0.1067762, 0.3616247, 1.904895, 1, 1, 1, 1, 1,
0.1159755, -2.020805, 4.892918, 1, 1, 1, 1, 1,
0.1172501, 0.6225302, -0.09115141, 1, 1, 1, 1, 1,
0.1180266, -0.9588841, 4.375316, 1, 1, 1, 1, 1,
0.1195997, -0.4404984, 4.080249, 1, 1, 1, 1, 1,
0.1210737, -0.1992509, 2.353246, 1, 1, 1, 1, 1,
0.1220786, 1.418389, 1.067878, 1, 1, 1, 1, 1,
0.1333181, 0.1091122, 2.154527, 1, 1, 1, 1, 1,
0.1337137, -1.046765, 3.860332, 0, 0, 1, 1, 1,
0.1338224, -2.015903, 4.174088, 1, 0, 0, 1, 1,
0.1369009, -2.190101, 3.770223, 1, 0, 0, 1, 1,
0.1479045, 0.01211747, 0.9614739, 1, 0, 0, 1, 1,
0.1488754, 0.5464063, 0.7665995, 1, 0, 0, 1, 1,
0.1537323, 0.6878855, 0.9559737, 1, 0, 0, 1, 1,
0.1542053, -0.8404109, 3.039035, 0, 0, 0, 1, 1,
0.1559921, -1.274797, 2.499684, 0, 0, 0, 1, 1,
0.1583883, 0.929181, 0.5335902, 0, 0, 0, 1, 1,
0.1586184, -0.8221006, 2.664085, 0, 0, 0, 1, 1,
0.1598588, -0.7380717, 3.326631, 0, 0, 0, 1, 1,
0.1618246, 1.342245, -0.6989709, 0, 0, 0, 1, 1,
0.1618884, 0.3948128, -0.0888287, 0, 0, 0, 1, 1,
0.1638847, 0.9028426, 0.7270263, 1, 1, 1, 1, 1,
0.1659759, 1.953649, -0.09797787, 1, 1, 1, 1, 1,
0.1672789, -0.08778869, 2.491411, 1, 1, 1, 1, 1,
0.1687859, 0.0695388, 0.4749795, 1, 1, 1, 1, 1,
0.1727244, 1.469168, -0.3326307, 1, 1, 1, 1, 1,
0.1758075, -1.083117, 1.384164, 1, 1, 1, 1, 1,
0.1770988, 0.8282467, 0.6583777, 1, 1, 1, 1, 1,
0.1772791, 1.769446, -1.911809, 1, 1, 1, 1, 1,
0.1778113, 0.2742887, 0.2327179, 1, 1, 1, 1, 1,
0.1808868, 0.1327792, 0.5416545, 1, 1, 1, 1, 1,
0.1819331, 0.5690773, -0.1822973, 1, 1, 1, 1, 1,
0.182055, 0.560645, 2.337793, 1, 1, 1, 1, 1,
0.1844833, 0.2689914, 1.654218, 1, 1, 1, 1, 1,
0.1928552, 0.5030134, 1.540687, 1, 1, 1, 1, 1,
0.1942227, -0.9937831, 2.38985, 1, 1, 1, 1, 1,
0.1984816, -0.7745463, 2.131253, 0, 0, 1, 1, 1,
0.1984859, -0.7434154, 3.262925, 1, 0, 0, 1, 1,
0.1986387, -1.596039, 4.690999, 1, 0, 0, 1, 1,
0.2064683, 0.1043931, -0.2832148, 1, 0, 0, 1, 1,
0.2070159, 1.322237, 0.6936327, 1, 0, 0, 1, 1,
0.2088312, 0.01460087, 0.2124018, 1, 0, 0, 1, 1,
0.2102199, 1.566121, -0.7527891, 0, 0, 0, 1, 1,
0.2125292, 0.6298401, 1.946736, 0, 0, 0, 1, 1,
0.2171662, -0.02781211, 2.354638, 0, 0, 0, 1, 1,
0.218137, 0.7907286, 1.596916, 0, 0, 0, 1, 1,
0.2203391, 0.9933634, -0.09537162, 0, 0, 0, 1, 1,
0.2208689, 0.5187272, 1.14136, 0, 0, 0, 1, 1,
0.2226994, 1.134601, 0.3685815, 0, 0, 0, 1, 1,
0.2234274, 0.4142441, -1.004761, 1, 1, 1, 1, 1,
0.2272452, 0.7201733, 0.8009213, 1, 1, 1, 1, 1,
0.2334892, 1.172147, -0.333108, 1, 1, 1, 1, 1,
0.2417347, 1.949155, -0.6931444, 1, 1, 1, 1, 1,
0.2423322, -2.278584, 4.37018, 1, 1, 1, 1, 1,
0.2429252, -0.7408533, 3.456261, 1, 1, 1, 1, 1,
0.2435224, 1.897014, 0.4237247, 1, 1, 1, 1, 1,
0.2436497, -0.3792276, 2.309111, 1, 1, 1, 1, 1,
0.2475001, -0.9903849, 1.641807, 1, 1, 1, 1, 1,
0.2491917, 0.4696487, 0.7400783, 1, 1, 1, 1, 1,
0.2494923, 1.581297, -0.08827129, 1, 1, 1, 1, 1,
0.2520173, -1.329914, 2.645396, 1, 1, 1, 1, 1,
0.2624894, 0.9783937, 2.161345, 1, 1, 1, 1, 1,
0.268537, 0.8414733, 0.4267645, 1, 1, 1, 1, 1,
0.2754992, 0.6780562, 1.35173, 1, 1, 1, 1, 1,
0.2769206, 0.05803341, 4.605263, 0, 0, 1, 1, 1,
0.2783346, -1.670072, 2.936622, 1, 0, 0, 1, 1,
0.2804627, 2.131852, 0.1255144, 1, 0, 0, 1, 1,
0.2814256, 0.3558306, 0.2999638, 1, 0, 0, 1, 1,
0.2843078, 0.9674671, 0.2939334, 1, 0, 0, 1, 1,
0.2868879, -1.57962, 1.51508, 1, 0, 0, 1, 1,
0.28935, 1.343823, 0.007227706, 0, 0, 0, 1, 1,
0.2906669, -1.718989, 4.272097, 0, 0, 0, 1, 1,
0.2913479, -1.144547, 2.457157, 0, 0, 0, 1, 1,
0.2935662, -1.505454, 3.058889, 0, 0, 0, 1, 1,
0.2941075, -1.105781, 3.054858, 0, 0, 0, 1, 1,
0.2950838, 0.5091736, -0.5420775, 0, 0, 0, 1, 1,
0.297415, 1.595115, 0.2890764, 0, 0, 0, 1, 1,
0.3016719, -0.1560861, 1.165972, 1, 1, 1, 1, 1,
0.3036218, -0.03477307, 1.697606, 1, 1, 1, 1, 1,
0.3051028, 0.4776047, 0.2222061, 1, 1, 1, 1, 1,
0.3063025, 0.6507522, -0.01174555, 1, 1, 1, 1, 1,
0.3076622, -0.7014418, 3.353527, 1, 1, 1, 1, 1,
0.3077663, -0.7184069, 1.525831, 1, 1, 1, 1, 1,
0.3094651, 0.03009786, 1.141192, 1, 1, 1, 1, 1,
0.3105915, -0.471073, 2.998372, 1, 1, 1, 1, 1,
0.3118667, 1.347443, 1.487182, 1, 1, 1, 1, 1,
0.3118841, 1.600177, 0.6704149, 1, 1, 1, 1, 1,
0.3123691, -0.05963432, 1.535475, 1, 1, 1, 1, 1,
0.3130012, 0.4973081, 0.9763903, 1, 1, 1, 1, 1,
0.3144576, 0.8102497, -0.8750756, 1, 1, 1, 1, 1,
0.3151517, -1.851351, 3.317467, 1, 1, 1, 1, 1,
0.3192665, -0.4797163, 3.285978, 1, 1, 1, 1, 1,
0.3275901, 1.805054, 0.4718823, 0, 0, 1, 1, 1,
0.3276541, 0.4240195, -0.2711086, 1, 0, 0, 1, 1,
0.3288201, 0.02918693, -0.09652279, 1, 0, 0, 1, 1,
0.3305159, -2.798829, 4.353694, 1, 0, 0, 1, 1,
0.3361932, 0.1206747, -0.2979577, 1, 0, 0, 1, 1,
0.3389165, 0.00473968, 2.970093, 1, 0, 0, 1, 1,
0.3429949, 0.07738411, 2.475297, 0, 0, 0, 1, 1,
0.3447701, -0.4017452, 2.443996, 0, 0, 0, 1, 1,
0.3484553, 1.980988, -1.104417, 0, 0, 0, 1, 1,
0.3507751, -1.970939, 1.625032, 0, 0, 0, 1, 1,
0.3527549, 0.2249745, -0.004133926, 0, 0, 0, 1, 1,
0.3528261, -1.237092, 3.012846, 0, 0, 0, 1, 1,
0.3559877, -0.1820544, 1.412043, 0, 0, 0, 1, 1,
0.3572461, 0.6120487, 0.1250908, 1, 1, 1, 1, 1,
0.3586581, -0.5352761, 2.861576, 1, 1, 1, 1, 1,
0.3596065, -1.293781, 3.052325, 1, 1, 1, 1, 1,
0.3606418, -1.002239, 3.074762, 1, 1, 1, 1, 1,
0.361645, 1.727408, -0.9097883, 1, 1, 1, 1, 1,
0.3692671, 1.629562, 1.542139, 1, 1, 1, 1, 1,
0.3744581, 0.09954543, -0.3227933, 1, 1, 1, 1, 1,
0.3793505, 0.7952252, -0.6036696, 1, 1, 1, 1, 1,
0.380399, -0.2435325, 3.068212, 1, 1, 1, 1, 1,
0.3864116, 1.701021, -1.082712, 1, 1, 1, 1, 1,
0.3886248, -3.006678, 4.062961, 1, 1, 1, 1, 1,
0.3920534, -0.6861376, 1.42199, 1, 1, 1, 1, 1,
0.3927494, -0.5641094, 3.880768, 1, 1, 1, 1, 1,
0.3956086, 0.516561, 1.505324, 1, 1, 1, 1, 1,
0.400626, 0.4273638, -0.008238666, 1, 1, 1, 1, 1,
0.4036406, 0.584618, 2.222991, 0, 0, 1, 1, 1,
0.4042613, -0.09592215, 2.320042, 1, 0, 0, 1, 1,
0.4074257, -0.5475441, 2.93776, 1, 0, 0, 1, 1,
0.4078681, -0.7135975, 1.958269, 1, 0, 0, 1, 1,
0.4097686, 1.659097, 1.238545, 1, 0, 0, 1, 1,
0.4098516, 0.1102844, 1.937626, 1, 0, 0, 1, 1,
0.4131108, 0.1967628, 0.4733404, 0, 0, 0, 1, 1,
0.4150205, 0.6922522, -0.6972707, 0, 0, 0, 1, 1,
0.4169885, 0.1078346, 1.852268, 0, 0, 0, 1, 1,
0.4191735, -0.7943686, 1.387555, 0, 0, 0, 1, 1,
0.4243291, -0.02740786, 2.75687, 0, 0, 0, 1, 1,
0.424363, -1.101185, 3.580049, 0, 0, 0, 1, 1,
0.4245272, -0.2370735, 2.293835, 0, 0, 0, 1, 1,
0.4309156, 1.706958, 0.377914, 1, 1, 1, 1, 1,
0.43133, 1.197236, 0.2565562, 1, 1, 1, 1, 1,
0.4326163, 1.986938, 2.12567, 1, 1, 1, 1, 1,
0.43288, 0.6978601, 0.4157267, 1, 1, 1, 1, 1,
0.4413636, -0.2725447, 3.892425, 1, 1, 1, 1, 1,
0.4427011, -0.8864738, 3.388587, 1, 1, 1, 1, 1,
0.4427046, -1.369203, 1.470084, 1, 1, 1, 1, 1,
0.4488124, 1.160344, 2.98441, 1, 1, 1, 1, 1,
0.4498728, -0.08955048, 2.918439, 1, 1, 1, 1, 1,
0.4517027, -0.4570976, 1.698356, 1, 1, 1, 1, 1,
0.4566321, 0.1049609, 2.035916, 1, 1, 1, 1, 1,
0.4575928, 0.1909421, 0.8914644, 1, 1, 1, 1, 1,
0.4645778, 1.542813, -0.3409023, 1, 1, 1, 1, 1,
0.4668041, -1.07868, 1.110931, 1, 1, 1, 1, 1,
0.4668846, 0.541477, 1.949866, 1, 1, 1, 1, 1,
0.4672413, 0.8180695, 0.2788491, 0, 0, 1, 1, 1,
0.4748901, -0.53036, 4.011202, 1, 0, 0, 1, 1,
0.4750285, 0.9592857, 0.1363007, 1, 0, 0, 1, 1,
0.4763674, 1.17786, 0.6292303, 1, 0, 0, 1, 1,
0.4771653, -0.8642838, 1.092624, 1, 0, 0, 1, 1,
0.4774047, -1.712944, 2.494082, 1, 0, 0, 1, 1,
0.4782295, 0.2908156, 1.758407, 0, 0, 0, 1, 1,
0.4799397, -0.16092, 2.083277, 0, 0, 0, 1, 1,
0.4819787, -0.5123739, 3.4886, 0, 0, 0, 1, 1,
0.4864205, -1.1927, 5.007422, 0, 0, 0, 1, 1,
0.4917916, 0.2223398, 2.89308, 0, 0, 0, 1, 1,
0.491955, -0.1139852, 2.477414, 0, 0, 0, 1, 1,
0.4999262, -1.136915, 2.699829, 0, 0, 0, 1, 1,
0.5071383, -2.505544, 3.465556, 1, 1, 1, 1, 1,
0.5078874, 0.3326641, 1.348457, 1, 1, 1, 1, 1,
0.5092356, -1.471165, 2.437844, 1, 1, 1, 1, 1,
0.5117918, -0.958167, 2.405262, 1, 1, 1, 1, 1,
0.5140112, -0.2464739, 1.764723, 1, 1, 1, 1, 1,
0.515608, -0.001254182, 0.7485449, 1, 1, 1, 1, 1,
0.5158141, -0.2258398, 0.9407889, 1, 1, 1, 1, 1,
0.5188134, 1.588814, -0.4993477, 1, 1, 1, 1, 1,
0.5249873, 0.1274674, 1.649193, 1, 1, 1, 1, 1,
0.5250165, 0.2433582, 3.357615, 1, 1, 1, 1, 1,
0.5295852, -0.09448378, 1.076018, 1, 1, 1, 1, 1,
0.5302929, -0.6269565, 2.16474, 1, 1, 1, 1, 1,
0.5346982, -0.2136943, 0.7743197, 1, 1, 1, 1, 1,
0.5383368, -0.09760167, 2.39326, 1, 1, 1, 1, 1,
0.5416066, -0.7521816, 3.689882, 1, 1, 1, 1, 1,
0.5454004, -0.5908906, 2.308709, 0, 0, 1, 1, 1,
0.5495545, 0.3870048, 0.2160162, 1, 0, 0, 1, 1,
0.5556225, 0.3073386, -0.04839605, 1, 0, 0, 1, 1,
0.5616357, 2.073423, 1.250681, 1, 0, 0, 1, 1,
0.563809, 0.02077459, 1.765974, 1, 0, 0, 1, 1,
0.5638777, 0.1434686, 1.695855, 1, 0, 0, 1, 1,
0.5711472, -1.123683, 2.577979, 0, 0, 0, 1, 1,
0.5722077, -0.6364827, 2.375874, 0, 0, 0, 1, 1,
0.5735554, 0.4570198, -0.7497657, 0, 0, 0, 1, 1,
0.5811787, -0.3719405, 1.946398, 0, 0, 0, 1, 1,
0.5827532, 1.733183, 0.8180125, 0, 0, 0, 1, 1,
0.5866261, 0.228098, 2.279158, 0, 0, 0, 1, 1,
0.5913293, 0.526179, 0.50345, 0, 0, 0, 1, 1,
0.5915414, 0.5146905, -1.245145, 1, 1, 1, 1, 1,
0.5942748, -0.7249829, 1.662314, 1, 1, 1, 1, 1,
0.5990432, -0.1152567, 1.318734, 1, 1, 1, 1, 1,
0.5996577, -0.08325215, 3.141513, 1, 1, 1, 1, 1,
0.6028671, 0.1144533, 1.113208, 1, 1, 1, 1, 1,
0.605206, 1.460986, 1.325981, 1, 1, 1, 1, 1,
0.6065284, 0.7518899, -0.08696975, 1, 1, 1, 1, 1,
0.607997, 0.9147788, 1.661795, 1, 1, 1, 1, 1,
0.6236848, -0.6161656, 1.117083, 1, 1, 1, 1, 1,
0.6250877, 0.6174321, 0.7263438, 1, 1, 1, 1, 1,
0.643238, -1.52086, 2.195336, 1, 1, 1, 1, 1,
0.6432451, 0.07771682, -0.511259, 1, 1, 1, 1, 1,
0.6446704, -0.8991976, 3.467328, 1, 1, 1, 1, 1,
0.6511484, 0.02342052, 2.592572, 1, 1, 1, 1, 1,
0.6523341, 1.382169, 0.5861244, 1, 1, 1, 1, 1,
0.6524774, -1.569295, 3.761045, 0, 0, 1, 1, 1,
0.6588569, -1.195454, 5.04367, 1, 0, 0, 1, 1,
0.6598503, -0.05406947, 0.5414086, 1, 0, 0, 1, 1,
0.6615946, -0.4149705, 3.296328, 1, 0, 0, 1, 1,
0.661858, 0.8028209, -0.2998557, 1, 0, 0, 1, 1,
0.6621259, 0.1009032, -0.5295188, 1, 0, 0, 1, 1,
0.6665545, -0.8323888, 3.992676, 0, 0, 0, 1, 1,
0.6670457, 2.503266, 0.08596607, 0, 0, 0, 1, 1,
0.686837, 1.443918, 2.053384, 0, 0, 0, 1, 1,
0.6905568, -0.2249073, 0.1685524, 0, 0, 0, 1, 1,
0.6921931, 0.401259, 3.065423, 0, 0, 0, 1, 1,
0.699478, -0.501349, 2.28496, 0, 0, 0, 1, 1,
0.7013915, -0.166992, 1.216781, 0, 0, 0, 1, 1,
0.7040228, 0.1065793, -0.02053381, 1, 1, 1, 1, 1,
0.707625, 0.4912349, -0.04882893, 1, 1, 1, 1, 1,
0.70872, 1.094561, 1.751865, 1, 1, 1, 1, 1,
0.7137918, -0.3073676, 1.237496, 1, 1, 1, 1, 1,
0.7142047, 0.9867591, 0.07332762, 1, 1, 1, 1, 1,
0.7161206, 0.7513427, 0.9732392, 1, 1, 1, 1, 1,
0.7162333, 0.04003366, 3.052271, 1, 1, 1, 1, 1,
0.7179808, 0.2876772, 0.7689567, 1, 1, 1, 1, 1,
0.7210003, -0.3507872, 2.795387, 1, 1, 1, 1, 1,
0.7290165, -0.4122882, 1.243988, 1, 1, 1, 1, 1,
0.7293841, -0.5368683, 3.655523, 1, 1, 1, 1, 1,
0.7304677, -0.227212, 3.585943, 1, 1, 1, 1, 1,
0.7329533, -0.2861046, 1.993344, 1, 1, 1, 1, 1,
0.7363528, -0.2884194, 2.431309, 1, 1, 1, 1, 1,
0.739171, -0.2408911, 1.197649, 1, 1, 1, 1, 1,
0.7397234, -0.6163237, 2.917539, 0, 0, 1, 1, 1,
0.7416922, -0.5262204, 0.8086604, 1, 0, 0, 1, 1,
0.7434008, 0.4692557, 1.06439, 1, 0, 0, 1, 1,
0.7436273, -1.305571, 0.7761932, 1, 0, 0, 1, 1,
0.7447496, -0.826989, 3.760193, 1, 0, 0, 1, 1,
0.7468621, 1.069792, 1.351047, 1, 0, 0, 1, 1,
0.7487665, 0.9319569, 0.3033953, 0, 0, 0, 1, 1,
0.7554247, -1.821856, 2.15916, 0, 0, 0, 1, 1,
0.7560474, 1.330096, 0.573921, 0, 0, 0, 1, 1,
0.7585171, 0.5638455, 2.684093, 0, 0, 0, 1, 1,
0.7633572, 0.2090289, 1.406878, 0, 0, 0, 1, 1,
0.7640182, 0.4377309, 0.1360877, 0, 0, 0, 1, 1,
0.7657315, -1.597435, 3.045484, 0, 0, 0, 1, 1,
0.7659081, -1.806337, 2.603798, 1, 1, 1, 1, 1,
0.7692626, -0.5829372, 3.467285, 1, 1, 1, 1, 1,
0.7693958, 0.2545572, 3.272047, 1, 1, 1, 1, 1,
0.7695485, -0.6080001, 2.46903, 1, 1, 1, 1, 1,
0.7754976, -1.06473, 4.571381, 1, 1, 1, 1, 1,
0.7761168, 0.6888974, 1.163926, 1, 1, 1, 1, 1,
0.7788104, -1.262679, 3.419054, 1, 1, 1, 1, 1,
0.781549, 1.23461, 0.07037576, 1, 1, 1, 1, 1,
0.7827982, 0.390123, 2.310646, 1, 1, 1, 1, 1,
0.7865853, 0.5094103, 1.183735, 1, 1, 1, 1, 1,
0.7876978, -0.4555049, 0.922617, 1, 1, 1, 1, 1,
0.7969289, -0.3333761, 1.102237, 1, 1, 1, 1, 1,
0.8026407, 0.1506, 1.79876, 1, 1, 1, 1, 1,
0.8033941, 2.21676, 0.530201, 1, 1, 1, 1, 1,
0.8081942, -1.457092, 3.310605, 1, 1, 1, 1, 1,
0.8116992, 0.02862401, 2.007241, 0, 0, 1, 1, 1,
0.8172199, -0.2858936, 1.65163, 1, 0, 0, 1, 1,
0.822715, -1.49909, 1.583628, 1, 0, 0, 1, 1,
0.8227876, 0.6944901, 1.504593, 1, 0, 0, 1, 1,
0.8276884, -0.05434747, 1.218691, 1, 0, 0, 1, 1,
0.8300971, -0.7847287, 2.83911, 1, 0, 0, 1, 1,
0.8345175, 0.3171847, 0.392397, 0, 0, 0, 1, 1,
0.8400744, 0.3285436, 1.308789, 0, 0, 0, 1, 1,
0.8409259, 0.2480021, 1.42451, 0, 0, 0, 1, 1,
0.8438138, 0.5700887, 0.7175112, 0, 0, 0, 1, 1,
0.8448089, -1.95725, 4.202851, 0, 0, 0, 1, 1,
0.8451078, 0.7573236, 1.372422, 0, 0, 0, 1, 1,
0.8515895, 0.5534316, 0.2332635, 0, 0, 0, 1, 1,
0.851795, -0.913161, 3.769412, 1, 1, 1, 1, 1,
0.852574, 0.9516432, -0.2546201, 1, 1, 1, 1, 1,
0.8552993, 0.8729074, 1.172541, 1, 1, 1, 1, 1,
0.8556027, 1.408278, -0.8928083, 1, 1, 1, 1, 1,
0.8556393, -0.2944587, 2.543664, 1, 1, 1, 1, 1,
0.8603871, 0.9840496, 0.6918266, 1, 1, 1, 1, 1,
0.86474, 1.51921, 1.763558, 1, 1, 1, 1, 1,
0.8747206, 0.0867281, 1.879519, 1, 1, 1, 1, 1,
0.8773323, 0.3862708, 1.779999, 1, 1, 1, 1, 1,
0.8802508, 0.009963799, 1.177367, 1, 1, 1, 1, 1,
0.8953037, -0.3790143, 2.32928, 1, 1, 1, 1, 1,
0.9013728, 0.3456955, 1.668049, 1, 1, 1, 1, 1,
0.9029492, 0.7417458, 2.220136, 1, 1, 1, 1, 1,
0.9088789, -0.9966717, 4.189546, 1, 1, 1, 1, 1,
0.9095433, 1.616873, 1.318368, 1, 1, 1, 1, 1,
0.9219036, 0.248333, 1.603332, 0, 0, 1, 1, 1,
0.9228566, 0.02218362, 1.161711, 1, 0, 0, 1, 1,
0.9271994, -0.1784174, 1.743771, 1, 0, 0, 1, 1,
0.9282154, 1.270364, 2.003969, 1, 0, 0, 1, 1,
0.935235, 2.147854, -0.1585932, 1, 0, 0, 1, 1,
0.9360562, 0.5068161, 2.64565, 1, 0, 0, 1, 1,
0.9361018, 0.8946698, 1.111295, 0, 0, 0, 1, 1,
0.9422522, 1.636461, 0.3934454, 0, 0, 0, 1, 1,
0.9454179, 1.145592, -1.189314, 0, 0, 0, 1, 1,
0.9555122, -2.924676, 3.847656, 0, 0, 0, 1, 1,
0.9570383, 0.4002671, 0.7163411, 0, 0, 0, 1, 1,
0.9595474, -0.160499, 1.473693, 0, 0, 0, 1, 1,
0.9750639, -1.04984, 3.091768, 0, 0, 0, 1, 1,
0.9769405, 0.1730908, 0.5894706, 1, 1, 1, 1, 1,
0.9803137, -0.3867731, 2.993286, 1, 1, 1, 1, 1,
0.9804748, -0.9970491, 2.780721, 1, 1, 1, 1, 1,
0.9826295, -0.4183411, 0.1606886, 1, 1, 1, 1, 1,
0.9910792, -1.202494, 2.072017, 1, 1, 1, 1, 1,
0.9926541, -1.861665, 4.938865, 1, 1, 1, 1, 1,
0.9931521, -1.802212, 1.967009, 1, 1, 1, 1, 1,
0.9940971, -0.05380663, 2.048012, 1, 1, 1, 1, 1,
0.9967445, -0.3815737, 3.188083, 1, 1, 1, 1, 1,
0.9981022, 0.7684008, -0.1015967, 1, 1, 1, 1, 1,
0.9985497, -0.1143247, 1.960459, 1, 1, 1, 1, 1,
1.011469, 1.522041, 0.9291567, 1, 1, 1, 1, 1,
1.014275, -0.3036665, 0.5128192, 1, 1, 1, 1, 1,
1.019922, -0.7495548, 2.053913, 1, 1, 1, 1, 1,
1.023352, -0.5768716, 2.904119, 1, 1, 1, 1, 1,
1.026784, 1.597165, 0.4408354, 0, 0, 1, 1, 1,
1.027794, 0.4209027, 0.7063533, 1, 0, 0, 1, 1,
1.027835, -0.5161805, 2.234564, 1, 0, 0, 1, 1,
1.033204, 1.216161, -0.2681483, 1, 0, 0, 1, 1,
1.039796, -0.6012831, 2.565956, 1, 0, 0, 1, 1,
1.044493, 1.693064, -0.3739786, 1, 0, 0, 1, 1,
1.052923, 0.1801673, -0.3195715, 0, 0, 0, 1, 1,
1.056848, 0.5888502, 1.296117, 0, 0, 0, 1, 1,
1.061796, -1.28675, 3.742116, 0, 0, 0, 1, 1,
1.066402, 0.9662084, 1.521724, 0, 0, 0, 1, 1,
1.071816, -0.939863, 1.467761, 0, 0, 0, 1, 1,
1.07647, -0.1533653, 0.9658135, 0, 0, 0, 1, 1,
1.079656, 1.34188, -0.8929885, 0, 0, 0, 1, 1,
1.082577, 0.7306941, 1.502298, 1, 1, 1, 1, 1,
1.083873, 0.5639006, 1.438755, 1, 1, 1, 1, 1,
1.084823, 1.268062, 1.740555, 1, 1, 1, 1, 1,
1.091567, -0.4375821, 4.199731, 1, 1, 1, 1, 1,
1.091694, -1.515342, 2.661073, 1, 1, 1, 1, 1,
1.096041, 0.9503933, 0.3464358, 1, 1, 1, 1, 1,
1.097911, 1.176714, 0.1285299, 1, 1, 1, 1, 1,
1.104425, -0.5924437, 1.17707, 1, 1, 1, 1, 1,
1.114137, -0.9554854, 3.114183, 1, 1, 1, 1, 1,
1.127061, -1.31097, 1.881648, 1, 1, 1, 1, 1,
1.12856, -0.8217111, 2.887089, 1, 1, 1, 1, 1,
1.136889, 0.8417802, 1.452126, 1, 1, 1, 1, 1,
1.144258, -0.5047319, 1.69593, 1, 1, 1, 1, 1,
1.147242, 0.9885905, 0.8274416, 1, 1, 1, 1, 1,
1.159352, -0.1162739, 1.886368, 1, 1, 1, 1, 1,
1.171327, 2.250565, -0.2374589, 0, 0, 1, 1, 1,
1.171914, 0.8996942, 2.085146, 1, 0, 0, 1, 1,
1.174256, 2.529529, -0.9772161, 1, 0, 0, 1, 1,
1.185738, 0.470222, 0.8976085, 1, 0, 0, 1, 1,
1.18712, -0.2171011, 3.687048, 1, 0, 0, 1, 1,
1.188708, 0.3544661, 2.826366, 1, 0, 0, 1, 1,
1.193961, 0.1919783, 0.7297931, 0, 0, 0, 1, 1,
1.19484, 0.3315257, 1.035729, 0, 0, 0, 1, 1,
1.195796, 2.183968, -1.367467, 0, 0, 0, 1, 1,
1.196819, 0.3239108, 2.242331, 0, 0, 0, 1, 1,
1.199261, 0.01795689, 1.670499, 0, 0, 0, 1, 1,
1.209522, -0.1285724, 3.343253, 0, 0, 0, 1, 1,
1.214745, 0.2083091, 0.1395131, 0, 0, 0, 1, 1,
1.215109, 0.9697835, 1.223031, 1, 1, 1, 1, 1,
1.215359, -0.1720277, 1.139999, 1, 1, 1, 1, 1,
1.217483, 1.738572, -0.2089818, 1, 1, 1, 1, 1,
1.218018, 0.04021867, 2.029136, 1, 1, 1, 1, 1,
1.225302, -0.9466766, 1.740265, 1, 1, 1, 1, 1,
1.245127, -0.2375346, 2.316999, 1, 1, 1, 1, 1,
1.249463, -0.6347873, 1.411194, 1, 1, 1, 1, 1,
1.249977, 1.186078, 0.2636811, 1, 1, 1, 1, 1,
1.258172, -0.1237689, 1.058458, 1, 1, 1, 1, 1,
1.258821, -0.4121469, 1.845376, 1, 1, 1, 1, 1,
1.262004, 1.088643, 0.07102737, 1, 1, 1, 1, 1,
1.264716, -0.3324492, 2.423735, 1, 1, 1, 1, 1,
1.265153, 0.1536715, 1.3624, 1, 1, 1, 1, 1,
1.276731, -1.610188, 2.37914, 1, 1, 1, 1, 1,
1.283725, -2.059184, 1.244377, 1, 1, 1, 1, 1,
1.286392, -0.4218525, 1.237935, 0, 0, 1, 1, 1,
1.286838, 0.3148841, -0.163159, 1, 0, 0, 1, 1,
1.290809, -0.8765938, 0.9877836, 1, 0, 0, 1, 1,
1.291114, -0.6612074, 1.712577, 1, 0, 0, 1, 1,
1.293516, 0.5037153, 2.857458, 1, 0, 0, 1, 1,
1.30131, -0.1539457, 1.98013, 1, 0, 0, 1, 1,
1.311213, -0.1951653, 2.983049, 0, 0, 0, 1, 1,
1.319749, -0.928531, 3.108153, 0, 0, 0, 1, 1,
1.33596, -1.551579, 2.801061, 0, 0, 0, 1, 1,
1.337633, 0.06893463, 2.400109, 0, 0, 0, 1, 1,
1.355893, 0.380347, 3.0562, 0, 0, 0, 1, 1,
1.360597, 0.5095831, 0.2177992, 0, 0, 0, 1, 1,
1.362239, 0.9815132, -0.4477411, 0, 0, 0, 1, 1,
1.366094, 2.389488, -1.376275, 1, 1, 1, 1, 1,
1.366399, 0.1801772, 1.533779, 1, 1, 1, 1, 1,
1.369195, -0.1110972, 1.947679, 1, 1, 1, 1, 1,
1.389828, -0.5873971, 1.76972, 1, 1, 1, 1, 1,
1.391116, -0.7256721, 1.497439, 1, 1, 1, 1, 1,
1.395382, -0.4065947, 2.302019, 1, 1, 1, 1, 1,
1.400746, 0.5034443, 3.248371, 1, 1, 1, 1, 1,
1.407268, -0.8116484, 3.060217, 1, 1, 1, 1, 1,
1.408483, -1.126099, 3.615803, 1, 1, 1, 1, 1,
1.410228, -1.776268, 2.602768, 1, 1, 1, 1, 1,
1.413839, 0.7889388, -1.779164, 1, 1, 1, 1, 1,
1.417449, 0.9343541, -0.04360681, 1, 1, 1, 1, 1,
1.42247, -0.553785, 1.41745, 1, 1, 1, 1, 1,
1.425605, 0.1978159, 1.095112, 1, 1, 1, 1, 1,
1.457371, 0.08285206, 0.4452911, 1, 1, 1, 1, 1,
1.465021, 0.7624738, 2.030122, 0, 0, 1, 1, 1,
1.469697, -0.830382, 2.407452, 1, 0, 0, 1, 1,
1.471126, 1.256392, 1.261842, 1, 0, 0, 1, 1,
1.499693, 2.004333, 0.7584088, 1, 0, 0, 1, 1,
1.51973, 1.545205, 0.485847, 1, 0, 0, 1, 1,
1.535255, 1.396979, 1.59767, 1, 0, 0, 1, 1,
1.536231, -0.218108, 2.480506, 0, 0, 0, 1, 1,
1.551696, 1.291462, -0.1686367, 0, 0, 0, 1, 1,
1.552519, -2.080103, 2.019053, 0, 0, 0, 1, 1,
1.553377, 0.5960796, 1.971661, 0, 0, 0, 1, 1,
1.559067, -1.418215, 1.619795, 0, 0, 0, 1, 1,
1.565516, 1.983066, 1.565909, 0, 0, 0, 1, 1,
1.570585, 0.2214345, 0.7119977, 0, 0, 0, 1, 1,
1.57183, -0.3855313, 1.987486, 1, 1, 1, 1, 1,
1.575208, -1.553527, 0.5217596, 1, 1, 1, 1, 1,
1.589506, 0.4835189, -0.4942275, 1, 1, 1, 1, 1,
1.592826, -0.5686901, 0.9462091, 1, 1, 1, 1, 1,
1.593187, -0.2937795, -0.03674436, 1, 1, 1, 1, 1,
1.594959, -0.5253574, 1.839295, 1, 1, 1, 1, 1,
1.605026, -0.5828893, 1.602308, 1, 1, 1, 1, 1,
1.616676, 0.773296, 0.8752017, 1, 1, 1, 1, 1,
1.62007, -0.9238341, 0.8804286, 1, 1, 1, 1, 1,
1.622439, 0.7355194, 1.234773, 1, 1, 1, 1, 1,
1.630683, -0.9632412, 2.512172, 1, 1, 1, 1, 1,
1.633086, 0.7182751, 0.2589419, 1, 1, 1, 1, 1,
1.633151, -1.181993, 2.971157, 1, 1, 1, 1, 1,
1.6334, 1.72743, -1.08905, 1, 1, 1, 1, 1,
1.633733, -0.5556119, 1.640487, 1, 1, 1, 1, 1,
1.634407, 0.4071237, 0.6887499, 0, 0, 1, 1, 1,
1.673715, 1.231265, 2.508698, 1, 0, 0, 1, 1,
1.674026, -0.1552019, 0.7564151, 1, 0, 0, 1, 1,
1.680762, 0.6479288, 0.4152373, 1, 0, 0, 1, 1,
1.685292, -0.1681514, 1.837271, 1, 0, 0, 1, 1,
1.685793, -0.1720798, -0.5474557, 1, 0, 0, 1, 1,
1.685834, 1.084709, 0.6351227, 0, 0, 0, 1, 1,
1.686608, -0.7752194, 1.097594, 0, 0, 0, 1, 1,
1.702997, -0.01235965, 1.754531, 0, 0, 0, 1, 1,
1.70627, -1.176297, 0.9030074, 0, 0, 0, 1, 1,
1.716047, -0.3141935, 0.4813, 0, 0, 0, 1, 1,
1.738607, -0.5106531, 3.168888, 0, 0, 0, 1, 1,
1.743211, 1.056746, 0.01240572, 0, 0, 0, 1, 1,
1.751092, -0.9241222, 1.649287, 1, 1, 1, 1, 1,
1.751815, -0.8820546, 1.90146, 1, 1, 1, 1, 1,
1.753455, -0.7123338, 1.199415, 1, 1, 1, 1, 1,
1.767412, -1.282027, 1.938327, 1, 1, 1, 1, 1,
1.773749, -0.08126049, 1.351139, 1, 1, 1, 1, 1,
1.783829, -0.3320946, 0.3873846, 1, 1, 1, 1, 1,
1.79195, -1.418943, 2.284986, 1, 1, 1, 1, 1,
1.814705, 1.143549, 2.024538, 1, 1, 1, 1, 1,
1.825851, -0.5070103, 0.669653, 1, 1, 1, 1, 1,
1.82976, 0.4826424, 1.899061, 1, 1, 1, 1, 1,
1.844493, 1.936845, 0.6267491, 1, 1, 1, 1, 1,
1.849342, 0.4115641, -0.6488676, 1, 1, 1, 1, 1,
1.865661, 0.01980396, 2.192494, 1, 1, 1, 1, 1,
1.90532, 0.2037971, 3.584932, 1, 1, 1, 1, 1,
1.930818, 1.182944, 1.281061, 1, 1, 1, 1, 1,
1.945746, -0.9207412, 2.091222, 0, 0, 1, 1, 1,
1.989464, 1.13011, 1.462764, 1, 0, 0, 1, 1,
1.995762, 1.261617, 1.043706, 1, 0, 0, 1, 1,
1.998425, -1.862193, 2.717657, 1, 0, 0, 1, 1,
2.042209, -1.224653, 4.314213, 1, 0, 0, 1, 1,
2.059938, 0.6676093, 1.725791, 1, 0, 0, 1, 1,
2.100099, 1.050727, 2.700817, 0, 0, 0, 1, 1,
2.113346, -2.21244, 1.500798, 0, 0, 0, 1, 1,
2.130384, -1.049021, 1.232229, 0, 0, 0, 1, 1,
2.150716, -1.294875, 1.707762, 0, 0, 0, 1, 1,
2.151624, 0.7664, 1.635068, 0, 0, 0, 1, 1,
2.188127, 0.3002239, 2.804673, 0, 0, 0, 1, 1,
2.281347, -0.151712, 2.481097, 0, 0, 0, 1, 1,
2.332911, 0.02622112, 2.417559, 1, 1, 1, 1, 1,
2.43172, -1.564947, 2.595394, 1, 1, 1, 1, 1,
2.437519, -1.536317, 0.8970326, 1, 1, 1, 1, 1,
2.510945, 0.3003929, 1.302712, 1, 1, 1, 1, 1,
2.565606, 1.341963, -1.014107, 1, 1, 1, 1, 1,
2.660168, -0.6657212, 1.683329, 1, 1, 1, 1, 1,
3.52907, -0.3307174, 0.7149386, 1, 1, 1, 1, 1
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
var radius = 9.339909;
var distance = 32.80603;
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
mvMatrix.translate( -0.2443106, -0.05288124, -0.1826711 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80603);
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
