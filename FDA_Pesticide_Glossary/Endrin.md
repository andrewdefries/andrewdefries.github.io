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
-4.000659, 0.7303978, -1.310907, 1, 0, 0, 1,
-2.655863, -1.377035, -1.341259, 1, 0.007843138, 0, 1,
-2.59522, -0.5813211, -2.274385, 1, 0.01176471, 0, 1,
-2.551326, -1.958259, -2.30707, 1, 0.01960784, 0, 1,
-2.51669, 0.4868934, -1.347313, 1, 0.02352941, 0, 1,
-2.46484, 0.4729775, -2.986171, 1, 0.03137255, 0, 1,
-2.402339, 0.1706466, -1.403823, 1, 0.03529412, 0, 1,
-2.395324, 1.100674, -0.8878825, 1, 0.04313726, 0, 1,
-2.38788, 0.06286944, -3.23123, 1, 0.04705882, 0, 1,
-2.364315, -0.4875887, -0.7183296, 1, 0.05490196, 0, 1,
-2.362404, -0.8270887, -3.194021, 1, 0.05882353, 0, 1,
-2.360393, -1.128209, -2.408003, 1, 0.06666667, 0, 1,
-2.313706, 0.8209149, -1.443057, 1, 0.07058824, 0, 1,
-2.238043, 0.1915294, -3.063664, 1, 0.07843138, 0, 1,
-2.205724, 0.5296358, -2.410276, 1, 0.08235294, 0, 1,
-2.152401, 1.241584, -1.954662, 1, 0.09019608, 0, 1,
-2.152263, 1.317503, -1.408774, 1, 0.09411765, 0, 1,
-2.149714, 0.2411077, -1.96282, 1, 0.1019608, 0, 1,
-2.139776, 1.977377, -0.8074288, 1, 0.1098039, 0, 1,
-2.113761, -1.547992, -2.500816, 1, 0.1137255, 0, 1,
-2.063863, -0.4688778, -1.943276, 1, 0.1215686, 0, 1,
-2.055339, 0.4495026, 0.4080554, 1, 0.1254902, 0, 1,
-2.034927, -1.161151, -2.523718, 1, 0.1333333, 0, 1,
-2.022254, 0.7173891, -3.676034, 1, 0.1372549, 0, 1,
-2.004692, 1.231299, -3.12918, 1, 0.145098, 0, 1,
-1.961732, 0.08197226, -3.195298, 1, 0.1490196, 0, 1,
-1.922461, -2.097244, -2.512707, 1, 0.1568628, 0, 1,
-1.919145, -0.231472, -1.013723, 1, 0.1607843, 0, 1,
-1.893019, 0.4872659, -1.634511, 1, 0.1686275, 0, 1,
-1.891279, 0.7796088, -1.291871, 1, 0.172549, 0, 1,
-1.881571, -1.704753, -2.672861, 1, 0.1803922, 0, 1,
-1.874859, 2.271108, -0.1104819, 1, 0.1843137, 0, 1,
-1.85183, -1.813047, -1.885163, 1, 0.1921569, 0, 1,
-1.823452, -1.153967, -2.632684, 1, 0.1960784, 0, 1,
-1.813604, -1.055987, -1.629044, 1, 0.2039216, 0, 1,
-1.789497, 1.398427, -1.073041, 1, 0.2117647, 0, 1,
-1.784541, 0.9233858, 1.345501, 1, 0.2156863, 0, 1,
-1.776558, 1.857653, -0.9044223, 1, 0.2235294, 0, 1,
-1.774462, -1.290753, -2.942789, 1, 0.227451, 0, 1,
-1.765866, 0.6004252, -2.114096, 1, 0.2352941, 0, 1,
-1.747915, -0.7715062, -3.742492, 1, 0.2392157, 0, 1,
-1.741899, -2.09848, -2.362278, 1, 0.2470588, 0, 1,
-1.715863, 0.07083566, -0.2017132, 1, 0.2509804, 0, 1,
-1.715162, -0.1901672, -1.612978, 1, 0.2588235, 0, 1,
-1.707496, 1.194861, -1.185834, 1, 0.2627451, 0, 1,
-1.683034, -0.6649444, -2.527296, 1, 0.2705882, 0, 1,
-1.678553, 0.332517, -0.6916056, 1, 0.2745098, 0, 1,
-1.64661, -0.3284446, -2.471865, 1, 0.282353, 0, 1,
-1.644073, 0.1697515, -2.158865, 1, 0.2862745, 0, 1,
-1.624337, -0.2714108, -2.353661, 1, 0.2941177, 0, 1,
-1.622616, -0.3626687, -1.794312, 1, 0.3019608, 0, 1,
-1.595441, -0.6244141, -1.540469, 1, 0.3058824, 0, 1,
-1.595004, -0.1344287, -1.629737, 1, 0.3137255, 0, 1,
-1.594534, -0.9790812, -0.1684873, 1, 0.3176471, 0, 1,
-1.585908, -0.2026857, -1.10156, 1, 0.3254902, 0, 1,
-1.584113, 0.1109314, -3.13621, 1, 0.3294118, 0, 1,
-1.559583, 1.841841, -2.510632, 1, 0.3372549, 0, 1,
-1.557271, 0.7537012, 0.5270663, 1, 0.3411765, 0, 1,
-1.541851, 0.9677917, 0.1608941, 1, 0.3490196, 0, 1,
-1.541269, -2.854694, -3.485382, 1, 0.3529412, 0, 1,
-1.528717, -0.5216848, -1.15668, 1, 0.3607843, 0, 1,
-1.52569, 0.3942036, -0.5476411, 1, 0.3647059, 0, 1,
-1.510786, 0.9627948, -1.915073, 1, 0.372549, 0, 1,
-1.484662, -0.5238549, -1.122212, 1, 0.3764706, 0, 1,
-1.471842, -0.7963192, -1.167281, 1, 0.3843137, 0, 1,
-1.471751, -0.2623737, -1.376011, 1, 0.3882353, 0, 1,
-1.45974, 1.011921, -1.312036, 1, 0.3960784, 0, 1,
-1.435521, -0.7379975, -2.101889, 1, 0.4039216, 0, 1,
-1.434001, 0.6846653, -0.5041825, 1, 0.4078431, 0, 1,
-1.411757, -1.382977, -0.9614419, 1, 0.4156863, 0, 1,
-1.404604, -1.14477, -3.716152, 1, 0.4196078, 0, 1,
-1.401979, 1.889062, -0.5990806, 1, 0.427451, 0, 1,
-1.399097, -1.344367, -1.652685, 1, 0.4313726, 0, 1,
-1.384577, 0.5529504, -1.873012, 1, 0.4392157, 0, 1,
-1.381359, 1.230309, 0.7313523, 1, 0.4431373, 0, 1,
-1.369455, -0.130167, -2.054516, 1, 0.4509804, 0, 1,
-1.364411, -0.3230425, -0.9630944, 1, 0.454902, 0, 1,
-1.358647, -0.296159, -1.3393, 1, 0.4627451, 0, 1,
-1.356901, -1.263288, -2.762419, 1, 0.4666667, 0, 1,
-1.356084, 0.7460172, -0.6465513, 1, 0.4745098, 0, 1,
-1.353098, 0.2942492, 0.01419976, 1, 0.4784314, 0, 1,
-1.350286, 0.9147265, -0.5806818, 1, 0.4862745, 0, 1,
-1.348593, -0.3864033, -2.273169, 1, 0.4901961, 0, 1,
-1.346105, -1.886797, -1.816707, 1, 0.4980392, 0, 1,
-1.345762, -0.04301715, -2.85939, 1, 0.5058824, 0, 1,
-1.342745, -0.7391877, -2.425738, 1, 0.509804, 0, 1,
-1.3388, -1.864003, -3.394698, 1, 0.5176471, 0, 1,
-1.322397, 1.919941, 0.6276382, 1, 0.5215687, 0, 1,
-1.321722, -0.1721981, -2.561128, 1, 0.5294118, 0, 1,
-1.315102, -0.3880479, -0.5321863, 1, 0.5333334, 0, 1,
-1.312958, -0.4325229, -1.585514, 1, 0.5411765, 0, 1,
-1.311202, 0.8730732, -0.5960757, 1, 0.5450981, 0, 1,
-1.306797, -0.1491341, -2.717358, 1, 0.5529412, 0, 1,
-1.299331, 0.9251553, -1.865726, 1, 0.5568628, 0, 1,
-1.298589, -0.5258956, -3.974693, 1, 0.5647059, 0, 1,
-1.293972, -1.483632, -1.23966, 1, 0.5686275, 0, 1,
-1.291615, 0.3626128, -2.338608, 1, 0.5764706, 0, 1,
-1.289374, -1.349411, -1.752592, 1, 0.5803922, 0, 1,
-1.288543, -0.1252571, -1.786783, 1, 0.5882353, 0, 1,
-1.288446, -0.2383511, -2.327228, 1, 0.5921569, 0, 1,
-1.284168, 0.155905, -1.120677, 1, 0.6, 0, 1,
-1.274585, 0.3662187, -1.32685, 1, 0.6078432, 0, 1,
-1.269839, -0.871855, -1.808109, 1, 0.6117647, 0, 1,
-1.267942, -0.5839358, -2.602821, 1, 0.6196079, 0, 1,
-1.267005, 0.3164085, -0.7183796, 1, 0.6235294, 0, 1,
-1.265111, -0.3942497, -3.073704, 1, 0.6313726, 0, 1,
-1.263543, -0.002502133, -3.045507, 1, 0.6352941, 0, 1,
-1.261416, -0.03204761, -2.033815, 1, 0.6431373, 0, 1,
-1.260838, -1.173961, -2.621202, 1, 0.6470588, 0, 1,
-1.260054, 0.2887444, -0.9978406, 1, 0.654902, 0, 1,
-1.25872, 0.7472312, -1.690403, 1, 0.6588235, 0, 1,
-1.252313, 0.09750799, 0.2949638, 1, 0.6666667, 0, 1,
-1.249732, -0.2293685, -2.074712, 1, 0.6705883, 0, 1,
-1.231207, -0.1806288, -2.535517, 1, 0.6784314, 0, 1,
-1.229058, 0.08129238, 0.3377735, 1, 0.682353, 0, 1,
-1.217061, 0.03215401, -1.208192, 1, 0.6901961, 0, 1,
-1.206987, -1.144824, -1.017543, 1, 0.6941177, 0, 1,
-1.204713, 0.2393143, -0.8502911, 1, 0.7019608, 0, 1,
-1.19966, -0.7244721, -2.123925, 1, 0.7098039, 0, 1,
-1.19248, 1.758029, -0.1969445, 1, 0.7137255, 0, 1,
-1.189985, -0.401371, -1.320478, 1, 0.7215686, 0, 1,
-1.186406, 0.8650089, 0.1270839, 1, 0.7254902, 0, 1,
-1.18053, -0.2093682, -2.320082, 1, 0.7333333, 0, 1,
-1.175218, 1.012383, -1.005983, 1, 0.7372549, 0, 1,
-1.174111, 0.9031353, -1.825533, 1, 0.7450981, 0, 1,
-1.174104, 0.1246616, -1.547246, 1, 0.7490196, 0, 1,
-1.169374, -0.5213453, 0.5928075, 1, 0.7568628, 0, 1,
-1.16876, -0.6336343, -3.39181, 1, 0.7607843, 0, 1,
-1.162377, 0.3521444, -1.23062, 1, 0.7686275, 0, 1,
-1.15359, 1.001202, -0.3008605, 1, 0.772549, 0, 1,
-1.148037, 0.7598705, -0.5283568, 1, 0.7803922, 0, 1,
-1.147241, -0.01431753, 0.004181862, 1, 0.7843137, 0, 1,
-1.140605, -0.6704209, -1.834373, 1, 0.7921569, 0, 1,
-1.130805, 1.14472, -0.4317495, 1, 0.7960784, 0, 1,
-1.121212, -2.908259, -1.721474, 1, 0.8039216, 0, 1,
-1.118207, 0.12188, 0.4420254, 1, 0.8117647, 0, 1,
-1.11718, 0.2716671, -2.085752, 1, 0.8156863, 0, 1,
-1.11222, -1.32793, -3.18025, 1, 0.8235294, 0, 1,
-1.111148, -0.3369326, -4.614866, 1, 0.827451, 0, 1,
-1.110494, -0.74088, -1.515111, 1, 0.8352941, 0, 1,
-1.10969, -0.5585399, -2.702797, 1, 0.8392157, 0, 1,
-1.105313, 1.020457, -1.157143, 1, 0.8470588, 0, 1,
-1.0984, 0.8249452, -1.402668, 1, 0.8509804, 0, 1,
-1.093987, -1.542849, -1.960749, 1, 0.8588235, 0, 1,
-1.082311, 0.2837964, 0.2310359, 1, 0.8627451, 0, 1,
-1.064832, -0.08123499, -1.866026, 1, 0.8705882, 0, 1,
-1.060748, 0.4681329, -1.891693, 1, 0.8745098, 0, 1,
-1.050021, -1.579542, -2.196194, 1, 0.8823529, 0, 1,
-1.033946, 0.763903, -1.831946, 1, 0.8862745, 0, 1,
-1.026121, -0.2304698, -0.6431836, 1, 0.8941177, 0, 1,
-1.025767, -0.01247537, -1.97308, 1, 0.8980392, 0, 1,
-1.019919, 0.4647999, -1.3184, 1, 0.9058824, 0, 1,
-1.012817, 0.08986612, -1.97493, 1, 0.9137255, 0, 1,
-1.011592, 0.3261598, -1.647417, 1, 0.9176471, 0, 1,
-1.007818, 0.6601082, -0.9147887, 1, 0.9254902, 0, 1,
-1.000883, 0.9138928, -2.710623, 1, 0.9294118, 0, 1,
-0.9980641, 0.1298111, -1.840991, 1, 0.9372549, 0, 1,
-0.9976075, -1.452343, -1.102586, 1, 0.9411765, 0, 1,
-0.9929309, 1.110391, 0.4725873, 1, 0.9490196, 0, 1,
-0.985095, 1.022274, -1.670511, 1, 0.9529412, 0, 1,
-0.980716, -2.404037, 0.03584253, 1, 0.9607843, 0, 1,
-0.9779981, -0.8103235, -3.544866, 1, 0.9647059, 0, 1,
-0.9772512, 0.8295909, -0.5252383, 1, 0.972549, 0, 1,
-0.9647436, -0.09295388, 0.04380153, 1, 0.9764706, 0, 1,
-0.9403377, 1.551023, 0.2047866, 1, 0.9843137, 0, 1,
-0.9382309, -0.03548157, -1.976217, 1, 0.9882353, 0, 1,
-0.9269886, -0.5800046, -1.527068, 1, 0.9960784, 0, 1,
-0.9232361, -0.7685423, -3.055305, 0.9960784, 1, 0, 1,
-0.9175471, 2.958663, 0.1372934, 0.9921569, 1, 0, 1,
-0.9175344, 0.8933548, 0.6383459, 0.9843137, 1, 0, 1,
-0.9108207, 0.712836, -0.5040455, 0.9803922, 1, 0, 1,
-0.9076388, -0.2001832, -1.530868, 0.972549, 1, 0, 1,
-0.9066964, 0.07601118, -2.813677, 0.9686275, 1, 0, 1,
-0.9012542, 1.453601, -1.041054, 0.9607843, 1, 0, 1,
-0.9004017, 2.933619, -0.7926983, 0.9568627, 1, 0, 1,
-0.8965483, -0.9029338, -3.678757, 0.9490196, 1, 0, 1,
-0.8960805, 1.09918, -0.2779202, 0.945098, 1, 0, 1,
-0.8959716, -1.120601, -2.123392, 0.9372549, 1, 0, 1,
-0.895268, -0.3865862, -1.658714, 0.9333333, 1, 0, 1,
-0.8935778, 0.9516302, -0.5069903, 0.9254902, 1, 0, 1,
-0.8891494, 0.2841078, -1.442826, 0.9215686, 1, 0, 1,
-0.8857422, -0.9658393, -3.253893, 0.9137255, 1, 0, 1,
-0.8817385, -0.2897655, -2.209248, 0.9098039, 1, 0, 1,
-0.8811157, 1.652895, -2.138225, 0.9019608, 1, 0, 1,
-0.8740203, 0.4180368, -2.936304, 0.8941177, 1, 0, 1,
-0.8684635, 0.130027, -0.3727025, 0.8901961, 1, 0, 1,
-0.8652705, -0.5707207, -1.53203, 0.8823529, 1, 0, 1,
-0.8645188, 0.01802924, -2.367037, 0.8784314, 1, 0, 1,
-0.8586779, 0.01428269, -2.344357, 0.8705882, 1, 0, 1,
-0.8555157, 1.936545, 0.7952129, 0.8666667, 1, 0, 1,
-0.8547507, 0.5467286, -1.876323, 0.8588235, 1, 0, 1,
-0.850922, -0.8533156, -2.490005, 0.854902, 1, 0, 1,
-0.8467371, 1.916044, -2.597625, 0.8470588, 1, 0, 1,
-0.8462567, -0.9880865, -1.6293, 0.8431373, 1, 0, 1,
-0.8384448, 0.5948308, -2.651374, 0.8352941, 1, 0, 1,
-0.8360465, -0.215004, -1.906924, 0.8313726, 1, 0, 1,
-0.8300084, 0.5373859, -1.137414, 0.8235294, 1, 0, 1,
-0.8241564, -0.7430937, -2.546897, 0.8196079, 1, 0, 1,
-0.8237646, 0.3956767, -2.645595, 0.8117647, 1, 0, 1,
-0.8220904, -0.3637263, -2.672098, 0.8078431, 1, 0, 1,
-0.8169342, -1.008756, -1.72374, 0.8, 1, 0, 1,
-0.8128344, 1.6904, 0.07037746, 0.7921569, 1, 0, 1,
-0.8114532, 0.0986806, -0.8866195, 0.7882353, 1, 0, 1,
-0.8112378, -1.738711, -2.477942, 0.7803922, 1, 0, 1,
-0.810984, -0.3607101, -1.069459, 0.7764706, 1, 0, 1,
-0.8081827, 1.027579, -0.3435688, 0.7686275, 1, 0, 1,
-0.807681, -0.3341328, -2.955255, 0.7647059, 1, 0, 1,
-0.8075269, 1.155264, -0.306455, 0.7568628, 1, 0, 1,
-0.8065215, 0.1644147, -0.2552614, 0.7529412, 1, 0, 1,
-0.8010659, 1.568079, 1.248151, 0.7450981, 1, 0, 1,
-0.8006185, 1.400474, -0.6562486, 0.7411765, 1, 0, 1,
-0.8005103, -0.9035896, -0.7266589, 0.7333333, 1, 0, 1,
-0.794701, -1.55349, -2.141667, 0.7294118, 1, 0, 1,
-0.7933565, -0.3481286, -2.058388, 0.7215686, 1, 0, 1,
-0.7918897, -0.5233268, -0.7537955, 0.7176471, 1, 0, 1,
-0.7859063, -1.215028, -4.664639, 0.7098039, 1, 0, 1,
-0.7684575, 0.8279012, -1.097406, 0.7058824, 1, 0, 1,
-0.7646151, 0.2575978, 0.04974787, 0.6980392, 1, 0, 1,
-0.761086, 1.220451, 0.05368846, 0.6901961, 1, 0, 1,
-0.7563631, 1.698449, -2.428786, 0.6862745, 1, 0, 1,
-0.7534194, -2.066862, -3.650373, 0.6784314, 1, 0, 1,
-0.7517931, 0.5143165, 0.4567688, 0.6745098, 1, 0, 1,
-0.7414892, -0.2837899, -0.8655405, 0.6666667, 1, 0, 1,
-0.7277439, 0.6476146, -1.241504, 0.6627451, 1, 0, 1,
-0.7264171, 0.6283599, 0.01275844, 0.654902, 1, 0, 1,
-0.7227719, 0.0786758, -1.112249, 0.6509804, 1, 0, 1,
-0.7223729, 0.538513, -1.022649, 0.6431373, 1, 0, 1,
-0.7212506, -0.6260411, -2.130265, 0.6392157, 1, 0, 1,
-0.7210251, -0.5764008, -2.411329, 0.6313726, 1, 0, 1,
-0.7184274, -0.3933237, 0.9728662, 0.627451, 1, 0, 1,
-0.7076359, 1.603281, 0.1191395, 0.6196079, 1, 0, 1,
-0.7023863, -1.23533, -3.081903, 0.6156863, 1, 0, 1,
-0.701777, -0.5069098, -1.26177, 0.6078432, 1, 0, 1,
-0.6989297, -0.1821502, -2.485062, 0.6039216, 1, 0, 1,
-0.6934178, -0.2785343, -0.3992772, 0.5960785, 1, 0, 1,
-0.6915635, 0.8984617, 1.177276, 0.5882353, 1, 0, 1,
-0.6837434, 0.6766962, 0.826595, 0.5843138, 1, 0, 1,
-0.6807498, -0.3387197, -1.997681, 0.5764706, 1, 0, 1,
-0.680657, 1.132122, -1.128451, 0.572549, 1, 0, 1,
-0.6754225, 0.2541734, -0.7277826, 0.5647059, 1, 0, 1,
-0.6747422, -0.159331, -1.569905, 0.5607843, 1, 0, 1,
-0.6737331, 0.4307316, -2.037071, 0.5529412, 1, 0, 1,
-0.6722715, 1.899478, -0.9046155, 0.5490196, 1, 0, 1,
-0.6705122, -0.8196661, -2.809491, 0.5411765, 1, 0, 1,
-0.6681819, 0.2452475, -2.723244, 0.5372549, 1, 0, 1,
-0.6675084, -0.3331997, -3.627388, 0.5294118, 1, 0, 1,
-0.665522, 0.08575147, -2.488025, 0.5254902, 1, 0, 1,
-0.6611518, -0.4904528, -1.20371, 0.5176471, 1, 0, 1,
-0.6544091, -0.090666, -0.6211268, 0.5137255, 1, 0, 1,
-0.6505272, -1.328792, -2.143529, 0.5058824, 1, 0, 1,
-0.6488636, -0.2955346, -0.3017893, 0.5019608, 1, 0, 1,
-0.6425573, -0.7924737, -2.742086, 0.4941176, 1, 0, 1,
-0.6385, -0.6237499, -1.771736, 0.4862745, 1, 0, 1,
-0.62499, 1.957543, -1.012889, 0.4823529, 1, 0, 1,
-0.6212992, -0.6392347, -3.225945, 0.4745098, 1, 0, 1,
-0.6208181, 0.5493881, -1.078922, 0.4705882, 1, 0, 1,
-0.6187255, 0.1526622, -0.08335581, 0.4627451, 1, 0, 1,
-0.6118862, -0.3077918, -2.812076, 0.4588235, 1, 0, 1,
-0.6088752, -0.7852668, -1.850798, 0.4509804, 1, 0, 1,
-0.6075185, 1.318735, -0.06420613, 0.4470588, 1, 0, 1,
-0.606825, -0.1561079, -2.055402, 0.4392157, 1, 0, 1,
-0.6067764, 0.1422324, 0.5979428, 0.4352941, 1, 0, 1,
-0.6065148, -0.9454792, -2.930358, 0.427451, 1, 0, 1,
-0.6043583, 1.954895, -1.362349, 0.4235294, 1, 0, 1,
-0.6029803, -1.510113, -3.391932, 0.4156863, 1, 0, 1,
-0.6025029, 0.1717791, 0.548481, 0.4117647, 1, 0, 1,
-0.5942615, 1.0927, 0.1408334, 0.4039216, 1, 0, 1,
-0.5932079, -1.488132, -3.044691, 0.3960784, 1, 0, 1,
-0.5907391, 0.2514873, -1.224705, 0.3921569, 1, 0, 1,
-0.5823475, -0.08887686, -1.167099, 0.3843137, 1, 0, 1,
-0.578986, -0.8688737, -2.100318, 0.3803922, 1, 0, 1,
-0.5775682, 0.8426804, -2.372768, 0.372549, 1, 0, 1,
-0.5768006, 0.1491233, -2.610309, 0.3686275, 1, 0, 1,
-0.5765817, 1.853839, -0.8786685, 0.3607843, 1, 0, 1,
-0.575987, -0.3986167, -1.212924, 0.3568628, 1, 0, 1,
-0.5753816, 0.1340144, 0.1921396, 0.3490196, 1, 0, 1,
-0.5679449, 0.0009193025, -0.5118223, 0.345098, 1, 0, 1,
-0.5664802, 0.3673556, -0.8302151, 0.3372549, 1, 0, 1,
-0.56434, -1.059404, -1.820757, 0.3333333, 1, 0, 1,
-0.5630848, -0.7475337, -3.123641, 0.3254902, 1, 0, 1,
-0.5620735, -2.351144, -1.95616, 0.3215686, 1, 0, 1,
-0.555701, 1.068402, -0.07780742, 0.3137255, 1, 0, 1,
-0.5528142, -0.6862852, -1.134472, 0.3098039, 1, 0, 1,
-0.5504376, -0.916588, -3.652143, 0.3019608, 1, 0, 1,
-0.5488838, -0.3057987, -1.729871, 0.2941177, 1, 0, 1,
-0.5469933, 0.5729468, -0.01115945, 0.2901961, 1, 0, 1,
-0.5456935, 2.056064, -1.713753, 0.282353, 1, 0, 1,
-0.5455828, 0.9409613, -1.323235, 0.2784314, 1, 0, 1,
-0.5447935, -0.5587497, -2.85123, 0.2705882, 1, 0, 1,
-0.5443339, -0.7195583, -2.133676, 0.2666667, 1, 0, 1,
-0.5424024, -0.04214729, 0.03687362, 0.2588235, 1, 0, 1,
-0.5396898, 0.9191113, -2.079861, 0.254902, 1, 0, 1,
-0.5391438, 0.006808537, -2.209106, 0.2470588, 1, 0, 1,
-0.5367398, 1.785852, 0.1922778, 0.2431373, 1, 0, 1,
-0.529023, 0.6965472, -1.520683, 0.2352941, 1, 0, 1,
-0.528776, 0.05754982, -0.7344065, 0.2313726, 1, 0, 1,
-0.5257666, -0.101764, -0.9537034, 0.2235294, 1, 0, 1,
-0.5231976, -1.830893, -3.101577, 0.2196078, 1, 0, 1,
-0.5155975, 0.2931628, -2.101393, 0.2117647, 1, 0, 1,
-0.5111489, 2.370104, 0.5336245, 0.2078431, 1, 0, 1,
-0.503077, 0.4818982, -0.7915755, 0.2, 1, 0, 1,
-0.4998254, -0.2342803, -2.052382, 0.1921569, 1, 0, 1,
-0.4977091, 0.5039738, -2.042007, 0.1882353, 1, 0, 1,
-0.4964951, -0.2790171, -1.954172, 0.1803922, 1, 0, 1,
-0.4944324, 0.825267, -2.287987, 0.1764706, 1, 0, 1,
-0.4830204, -0.7212513, -1.444154, 0.1686275, 1, 0, 1,
-0.4824786, 0.2491933, -1.834068, 0.1647059, 1, 0, 1,
-0.481179, -1.088754, -3.669653, 0.1568628, 1, 0, 1,
-0.4782162, -0.2956496, -2.255692, 0.1529412, 1, 0, 1,
-0.4763467, 1.000499, 0.002983337, 0.145098, 1, 0, 1,
-0.4741144, -0.88385, -1.815796, 0.1411765, 1, 0, 1,
-0.4713574, 0.5196802, -1.995685, 0.1333333, 1, 0, 1,
-0.4677661, -0.08659902, -1.720606, 0.1294118, 1, 0, 1,
-0.4658664, -1.447424, -2.442203, 0.1215686, 1, 0, 1,
-0.4633893, 0.9931884, 0.4382372, 0.1176471, 1, 0, 1,
-0.4633214, -1.27793, -2.649842, 0.1098039, 1, 0, 1,
-0.4632524, 0.2077889, -0.6889676, 0.1058824, 1, 0, 1,
-0.4603849, 0.3469912, 0.2065671, 0.09803922, 1, 0, 1,
-0.4578128, -0.5670583, -1.128943, 0.09019608, 1, 0, 1,
-0.4565476, -0.4976156, -2.667039, 0.08627451, 1, 0, 1,
-0.4533321, 0.3026351, -1.597607, 0.07843138, 1, 0, 1,
-0.4504054, -1.079739, -2.408333, 0.07450981, 1, 0, 1,
-0.4494334, -0.6757903, -4.310923, 0.06666667, 1, 0, 1,
-0.4463376, 1.479342, -0.3678297, 0.0627451, 1, 0, 1,
-0.4462019, -1.095521, -1.046752, 0.05490196, 1, 0, 1,
-0.4424058, 1.181839, 0.9745774, 0.05098039, 1, 0, 1,
-0.4349373, 1.770202, -1.48958, 0.04313726, 1, 0, 1,
-0.4324955, 1.416287, -0.546531, 0.03921569, 1, 0, 1,
-0.4313285, -0.8169268, -2.530076, 0.03137255, 1, 0, 1,
-0.4281882, 0.042787, -0.5977236, 0.02745098, 1, 0, 1,
-0.4269247, -0.6029447, -1.869275, 0.01960784, 1, 0, 1,
-0.4237106, 0.3978086, 0.461644, 0.01568628, 1, 0, 1,
-0.4160244, -0.1111114, -2.411153, 0.007843138, 1, 0, 1,
-0.4155649, 1.144461, -0.2737113, 0.003921569, 1, 0, 1,
-0.410867, 0.7324102, -1.379011, 0, 1, 0.003921569, 1,
-0.4080177, 0.3695125, -1.025918, 0, 1, 0.01176471, 1,
-0.4064339, 0.3727091, -1.369839, 0, 1, 0.01568628, 1,
-0.4038627, -1.181382, -4.615035, 0, 1, 0.02352941, 1,
-0.4036025, -0.6555352, -2.938499, 0, 1, 0.02745098, 1,
-0.4021985, -0.481269, -4.912694, 0, 1, 0.03529412, 1,
-0.4010365, 0.7565778, -0.5534552, 0, 1, 0.03921569, 1,
-0.3995927, -0.4289391, -0.3914984, 0, 1, 0.04705882, 1,
-0.3994316, 0.9479355, 0.1978807, 0, 1, 0.05098039, 1,
-0.3976263, -1.575705, -2.581955, 0, 1, 0.05882353, 1,
-0.3975688, 0.4787648, -1.056465, 0, 1, 0.0627451, 1,
-0.3923692, 0.8985004, -0.3352659, 0, 1, 0.07058824, 1,
-0.3915354, 1.853201, -1.266143, 0, 1, 0.07450981, 1,
-0.3872214, 0.6713244, -1.794616, 0, 1, 0.08235294, 1,
-0.3869045, 0.9072555, -1.292559, 0, 1, 0.08627451, 1,
-0.3829938, 0.721915, -0.2605655, 0, 1, 0.09411765, 1,
-0.3783133, 0.2187498, -1.428273, 0, 1, 0.1019608, 1,
-0.3770499, 0.7661569, 0.2487598, 0, 1, 0.1058824, 1,
-0.3767401, -1.169707, -2.857789, 0, 1, 0.1137255, 1,
-0.3759015, -1.353691, -2.734988, 0, 1, 0.1176471, 1,
-0.3744024, -1.172141, -2.768891, 0, 1, 0.1254902, 1,
-0.3734934, -0.1416619, -4.06384, 0, 1, 0.1294118, 1,
-0.3710108, 0.7267255, -2.066952, 0, 1, 0.1372549, 1,
-0.3688585, -0.09396798, -1.288284, 0, 1, 0.1411765, 1,
-0.3654318, -0.3812253, -1.673906, 0, 1, 0.1490196, 1,
-0.3641723, -1.115054, -3.825007, 0, 1, 0.1529412, 1,
-0.3565083, 1.035572, 1.933327, 0, 1, 0.1607843, 1,
-0.3519714, -0.5754176, -3.6702, 0, 1, 0.1647059, 1,
-0.3435267, 0.8648331, 0.9817204, 0, 1, 0.172549, 1,
-0.342817, -0.3837477, -1.832317, 0, 1, 0.1764706, 1,
-0.3421548, 1.457451, -1.63956, 0, 1, 0.1843137, 1,
-0.3394928, -0.1916229, -2.527017, 0, 1, 0.1882353, 1,
-0.3352742, 0.1326668, -2.221873, 0, 1, 0.1960784, 1,
-0.3281817, -0.0631986, -0.1098869, 0, 1, 0.2039216, 1,
-0.327962, -0.9836326, -1.37326, 0, 1, 0.2078431, 1,
-0.3277344, 1.177395, 0.7349848, 0, 1, 0.2156863, 1,
-0.3274477, -0.05820369, -3.335798, 0, 1, 0.2196078, 1,
-0.3146947, -1.239216, -2.2099, 0, 1, 0.227451, 1,
-0.3103883, -0.6364812, -2.573318, 0, 1, 0.2313726, 1,
-0.3091737, 1.789612, 0.485995, 0, 1, 0.2392157, 1,
-0.308783, -0.7782683, -1.283782, 0, 1, 0.2431373, 1,
-0.3085954, 0.3125654, -0.7691894, 0, 1, 0.2509804, 1,
-0.3019514, -0.5545576, -3.345139, 0, 1, 0.254902, 1,
-0.2990164, -0.3708172, -3.1495, 0, 1, 0.2627451, 1,
-0.297021, -1.528618, -3.043851, 0, 1, 0.2666667, 1,
-0.295497, 0.6577536, -1.923679, 0, 1, 0.2745098, 1,
-0.292145, -0.2193772, -1.909791, 0, 1, 0.2784314, 1,
-0.2920145, 0.2833137, -2.366916, 0, 1, 0.2862745, 1,
-0.2908622, -0.5170823, -2.691183, 0, 1, 0.2901961, 1,
-0.2908556, 0.3248484, 1.611128, 0, 1, 0.2980392, 1,
-0.2867491, -1.171568, -2.473228, 0, 1, 0.3058824, 1,
-0.2844969, -0.4945755, -2.498911, 0, 1, 0.3098039, 1,
-0.2844348, -0.8676175, -3.560428, 0, 1, 0.3176471, 1,
-0.2806985, 0.6335617, -0.2564661, 0, 1, 0.3215686, 1,
-0.2806808, -1.083957, -1.528541, 0, 1, 0.3294118, 1,
-0.279975, 1.513491, -0.8685892, 0, 1, 0.3333333, 1,
-0.27116, 0.2976745, -1.658285, 0, 1, 0.3411765, 1,
-0.2688166, -0.7967001, -4.339276, 0, 1, 0.345098, 1,
-0.2647366, 1.914389, -0.3023857, 0, 1, 0.3529412, 1,
-0.2634167, 0.02331019, -1.110963, 0, 1, 0.3568628, 1,
-0.2600403, -0.09174934, -2.165484, 0, 1, 0.3647059, 1,
-0.2593863, -0.2734822, -3.574921, 0, 1, 0.3686275, 1,
-0.2591714, -0.2990932, -2.181842, 0, 1, 0.3764706, 1,
-0.2581979, 1.729599, -1.196976, 0, 1, 0.3803922, 1,
-0.2517658, -0.3543895, -1.766721, 0, 1, 0.3882353, 1,
-0.2511576, 2.562496, -0.8019304, 0, 1, 0.3921569, 1,
-0.2509245, 1.067093, 1.207895, 0, 1, 0.4, 1,
-0.2476775, -0.3757554, -2.092602, 0, 1, 0.4078431, 1,
-0.2470848, 0.3854729, -0.514174, 0, 1, 0.4117647, 1,
-0.2451424, 0.4017809, -2.435548, 0, 1, 0.4196078, 1,
-0.2432651, -0.5860869, -2.197472, 0, 1, 0.4235294, 1,
-0.2426638, 1.917866, -0.3220365, 0, 1, 0.4313726, 1,
-0.2349167, 1.140458, 0.3674577, 0, 1, 0.4352941, 1,
-0.2278166, -1.670485, -1.302362, 0, 1, 0.4431373, 1,
-0.2258838, -0.2674919, -3.945475, 0, 1, 0.4470588, 1,
-0.2201887, 3.754384, 0.4943638, 0, 1, 0.454902, 1,
-0.2195078, 1.320446, -0.3368948, 0, 1, 0.4588235, 1,
-0.2142779, 1.094766, 1.540199, 0, 1, 0.4666667, 1,
-0.2139724, -0.1084234, -2.564345, 0, 1, 0.4705882, 1,
-0.2119467, 0.08531151, 0.01263735, 0, 1, 0.4784314, 1,
-0.2083527, 1.640625, -1.084304, 0, 1, 0.4823529, 1,
-0.2058454, 0.2368323, 0.5000308, 0, 1, 0.4901961, 1,
-0.2031664, -0.2075982, -2.939643, 0, 1, 0.4941176, 1,
-0.201995, 0.4680651, -1.115992, 0, 1, 0.5019608, 1,
-0.2009136, -0.3894653, -2.13986, 0, 1, 0.509804, 1,
-0.198861, 0.09579866, -0.63072, 0, 1, 0.5137255, 1,
-0.1975118, 0.9615619, -1.996712, 0, 1, 0.5215687, 1,
-0.1963896, -0.551389, -1.439896, 0, 1, 0.5254902, 1,
-0.1928478, -0.3973332, -3.227469, 0, 1, 0.5333334, 1,
-0.1928073, 0.5129651, -1.139507, 0, 1, 0.5372549, 1,
-0.1887088, -1.164279, -1.722801, 0, 1, 0.5450981, 1,
-0.1887013, -1.323402, -3.490167, 0, 1, 0.5490196, 1,
-0.1842416, 0.09751017, -2.101009, 0, 1, 0.5568628, 1,
-0.1817839, 0.07851645, 0.3086085, 0, 1, 0.5607843, 1,
-0.1809798, 0.0228234, 0.1178348, 0, 1, 0.5686275, 1,
-0.1757505, 0.02345372, -1.233263, 0, 1, 0.572549, 1,
-0.1705515, -0.3057906, -2.852849, 0, 1, 0.5803922, 1,
-0.1700291, 0.08092358, -0.1326058, 0, 1, 0.5843138, 1,
-0.1674228, 0.7905397, -1.368286, 0, 1, 0.5921569, 1,
-0.1671673, 0.328237, -0.1580711, 0, 1, 0.5960785, 1,
-0.1642209, 1.110576, -0.197009, 0, 1, 0.6039216, 1,
-0.161791, -2.424869, -2.694195, 0, 1, 0.6117647, 1,
-0.1580031, 0.7689881, 0.183355, 0, 1, 0.6156863, 1,
-0.1575514, -0.2329954, -2.726009, 0, 1, 0.6235294, 1,
-0.1556254, -0.9267382, -3.277706, 0, 1, 0.627451, 1,
-0.1522837, -0.2813255, -2.041643, 0, 1, 0.6352941, 1,
-0.1518672, -0.2516429, -2.215386, 0, 1, 0.6392157, 1,
-0.1517916, -0.5882798, -1.830523, 0, 1, 0.6470588, 1,
-0.1492711, 2.192554, -1.003286, 0, 1, 0.6509804, 1,
-0.1492524, -2.687473, -4.340124, 0, 1, 0.6588235, 1,
-0.1434408, -0.3058179, -3.455514, 0, 1, 0.6627451, 1,
-0.1393739, 0.8361058, 0.4880231, 0, 1, 0.6705883, 1,
-0.1375058, 1.357382, -1.001496, 0, 1, 0.6745098, 1,
-0.1357485, -0.874925, -3.977709, 0, 1, 0.682353, 1,
-0.1353329, -0.4665977, -1.659645, 0, 1, 0.6862745, 1,
-0.1348943, 1.234569, -1.610576, 0, 1, 0.6941177, 1,
-0.1305966, 0.5021395, 0.4677327, 0, 1, 0.7019608, 1,
-0.1288411, -1.07203, -2.639153, 0, 1, 0.7058824, 1,
-0.1247802, -0.686366, -2.434388, 0, 1, 0.7137255, 1,
-0.1232469, -0.3245937, -2.198565, 0, 1, 0.7176471, 1,
-0.119275, 0.9841946, -0.4162, 0, 1, 0.7254902, 1,
-0.1140234, 0.2629562, -0.1696193, 0, 1, 0.7294118, 1,
-0.1115379, -0.3295183, -3.721255, 0, 1, 0.7372549, 1,
-0.106896, 1.881536, -0.7045549, 0, 1, 0.7411765, 1,
-0.09827257, -0.3973345, -4.108767, 0, 1, 0.7490196, 1,
-0.09289216, -0.4297266, -0.8246433, 0, 1, 0.7529412, 1,
-0.08786648, -0.3664606, -2.456835, 0, 1, 0.7607843, 1,
-0.08440686, 0.2408963, -0.2765819, 0, 1, 0.7647059, 1,
-0.08390115, 0.3637289, 0.9869064, 0, 1, 0.772549, 1,
-0.08330021, -0.6506531, -3.443829, 0, 1, 0.7764706, 1,
-0.08313717, 0.6059059, -1.048826, 0, 1, 0.7843137, 1,
-0.0822999, 0.6155706, -0.3739892, 0, 1, 0.7882353, 1,
-0.08196405, 1.015659, -0.5866786, 0, 1, 0.7960784, 1,
-0.08155215, 1.084796, -0.702207, 0, 1, 0.8039216, 1,
-0.07991668, 1.496591, -0.1772156, 0, 1, 0.8078431, 1,
-0.0794449, -0.9351759, -3.892889, 0, 1, 0.8156863, 1,
-0.07875782, -0.2384572, -5.071955, 0, 1, 0.8196079, 1,
-0.07762817, -0.1311088, -2.291839, 0, 1, 0.827451, 1,
-0.07685348, -1.538015, -3.285133, 0, 1, 0.8313726, 1,
-0.07362213, -1.419794, -3.522099, 0, 1, 0.8392157, 1,
-0.07154973, 1.197788, 2.09514, 0, 1, 0.8431373, 1,
-0.07148151, 0.5046536, 0.5989563, 0, 1, 0.8509804, 1,
-0.0714053, -1.773537, -4.080658, 0, 1, 0.854902, 1,
-0.07113932, -0.5785292, -3.476825, 0, 1, 0.8627451, 1,
-0.06807223, -0.882015, -4.279071, 0, 1, 0.8666667, 1,
-0.06726386, 1.292596, 1.406128, 0, 1, 0.8745098, 1,
-0.06503167, 0.4315167, 1.132959, 0, 1, 0.8784314, 1,
-0.0633176, -1.05673, -4.185626, 0, 1, 0.8862745, 1,
-0.06212082, 0.2533811, -0.3549743, 0, 1, 0.8901961, 1,
-0.06144809, -0.5643534, -1.209322, 0, 1, 0.8980392, 1,
-0.06004607, 0.06011127, -1.11803, 0, 1, 0.9058824, 1,
-0.05862054, -0.433261, -4.228171, 0, 1, 0.9098039, 1,
-0.05795963, -0.4657401, -3.530654, 0, 1, 0.9176471, 1,
-0.05744899, 0.290337, 1.027125, 0, 1, 0.9215686, 1,
-0.05329843, -1.947967, -2.498333, 0, 1, 0.9294118, 1,
-0.04931565, -1.615528, -3.314085, 0, 1, 0.9333333, 1,
-0.04590583, 0.5708546, -0.4518262, 0, 1, 0.9411765, 1,
-0.04340451, -0.03263184, -2.510669, 0, 1, 0.945098, 1,
-0.04249407, -0.1928175, -0.8026875, 0, 1, 0.9529412, 1,
-0.03632101, 0.8107611, -0.5836728, 0, 1, 0.9568627, 1,
-0.03471193, 1.003646, -1.618545, 0, 1, 0.9647059, 1,
-0.02829118, -1.002069, -2.347974, 0, 1, 0.9686275, 1,
-0.02338282, -1.155148, -3.058901, 0, 1, 0.9764706, 1,
-0.02189891, -0.2298055, -1.780061, 0, 1, 0.9803922, 1,
-0.01948347, -0.622137, -3.497218, 0, 1, 0.9882353, 1,
-0.01887756, 1.331222, 1.262351, 0, 1, 0.9921569, 1,
-0.01560039, 0.5277706, -0.935093, 0, 1, 1, 1,
-0.01175998, -0.9297951, -3.314288, 0, 0.9921569, 1, 1,
-0.01148133, -1.522947, -1.478495, 0, 0.9882353, 1, 1,
-0.01003273, -0.3482651, -4.363146, 0, 0.9803922, 1, 1,
-0.008977976, 1.312534, -1.221467, 0, 0.9764706, 1, 1,
-0.00237802, -0.1415194, -1.399189, 0, 0.9686275, 1, 1,
-0.001633713, -0.6427768, -3.632075, 0, 0.9647059, 1, 1,
-0.0009862508, 2.358297, 0.3651605, 0, 0.9568627, 1, 1,
-0.0007367497, 1.858156, 0.910358, 0, 0.9529412, 1, 1,
0.001187795, -0.04361436, 5.238469, 0, 0.945098, 1, 1,
0.002078548, -0.9054728, 3.863444, 0, 0.9411765, 1, 1,
0.002556423, -0.1722348, 4.557765, 0, 0.9333333, 1, 1,
0.003085618, -0.08874308, 3.399158, 0, 0.9294118, 1, 1,
0.004571862, -2.397357, 2.67181, 0, 0.9215686, 1, 1,
0.00486679, 0.298595, -0.3174063, 0, 0.9176471, 1, 1,
0.00784061, -0.279516, 3.859292, 0, 0.9098039, 1, 1,
0.01346855, 2.090064, -0.1868559, 0, 0.9058824, 1, 1,
0.01983711, -0.536302, 3.516587, 0, 0.8980392, 1, 1,
0.02036322, -1.633361, 3.669072, 0, 0.8901961, 1, 1,
0.02203692, 1.693375, -0.9938635, 0, 0.8862745, 1, 1,
0.02312264, 1.153616, -1.436248, 0, 0.8784314, 1, 1,
0.02578244, -0.9193214, 2.578715, 0, 0.8745098, 1, 1,
0.02642339, -0.340055, 2.617173, 0, 0.8666667, 1, 1,
0.02932929, -0.6547394, 1.935363, 0, 0.8627451, 1, 1,
0.03143166, -0.5519722, 2.215321, 0, 0.854902, 1, 1,
0.04118499, 0.3460686, 0.1092379, 0, 0.8509804, 1, 1,
0.04133029, -0.04454647, 1.413544, 0, 0.8431373, 1, 1,
0.04514615, -1.705022, 1.747724, 0, 0.8392157, 1, 1,
0.04593136, 0.2721155, -1.623114, 0, 0.8313726, 1, 1,
0.04861198, 1.416246, -1.177826, 0, 0.827451, 1, 1,
0.04928698, 1.91133, 0.1600308, 0, 0.8196079, 1, 1,
0.05047658, -0.1617977, 2.823184, 0, 0.8156863, 1, 1,
0.05450728, 0.0719222, 0.158948, 0, 0.8078431, 1, 1,
0.05787584, -0.1547402, 2.829093, 0, 0.8039216, 1, 1,
0.07131618, -0.2684068, 2.202035, 0, 0.7960784, 1, 1,
0.07226832, -0.3304691, 3.732633, 0, 0.7882353, 1, 1,
0.07426457, 1.726428, 0.7558404, 0, 0.7843137, 1, 1,
0.08217517, 2.247702, 0.5646324, 0, 0.7764706, 1, 1,
0.08585276, -1.443943, 4.178094, 0, 0.772549, 1, 1,
0.08866499, 0.9820164, 1.175641, 0, 0.7647059, 1, 1,
0.09025264, -0.215691, 1.674551, 0, 0.7607843, 1, 1,
0.09272378, -0.7017927, 3.950178, 0, 0.7529412, 1, 1,
0.09456442, -0.6102749, 1.384582, 0, 0.7490196, 1, 1,
0.09647972, 0.7101136, -0.03272225, 0, 0.7411765, 1, 1,
0.09839784, 0.5283983, 1.550658, 0, 0.7372549, 1, 1,
0.112776, 0.7468383, -1.178847, 0, 0.7294118, 1, 1,
0.11381, 0.2296094, -0.08350462, 0, 0.7254902, 1, 1,
0.1143962, 1.480989, -0.79365, 0, 0.7176471, 1, 1,
0.1146751, -0.0354796, 2.018207, 0, 0.7137255, 1, 1,
0.1167152, 0.09747646, 0.7530364, 0, 0.7058824, 1, 1,
0.1183698, -0.3797463, 4.016246, 0, 0.6980392, 1, 1,
0.1183836, -1.324626, 1.806242, 0, 0.6941177, 1, 1,
0.1233519, -0.3776363, 1.841007, 0, 0.6862745, 1, 1,
0.1277213, 1.055046, -0.2148944, 0, 0.682353, 1, 1,
0.1280839, -1.011152, 2.895817, 0, 0.6745098, 1, 1,
0.1317478, 1.900812, 0.1328341, 0, 0.6705883, 1, 1,
0.1352653, -0.4957802, 2.630352, 0, 0.6627451, 1, 1,
0.1432377, -0.1413593, 1.83924, 0, 0.6588235, 1, 1,
0.1478892, 0.8703235, 0.7832584, 0, 0.6509804, 1, 1,
0.1553382, 1.108472, -0.3100774, 0, 0.6470588, 1, 1,
0.1618924, 0.7252786, -1.498295, 0, 0.6392157, 1, 1,
0.1729291, 1.132217, -0.4224352, 0, 0.6352941, 1, 1,
0.1741072, 1.166401, 1.089496, 0, 0.627451, 1, 1,
0.1747068, 1.275007, -0.2047157, 0, 0.6235294, 1, 1,
0.1760848, -1.419808, 1.370778, 0, 0.6156863, 1, 1,
0.177983, 0.2675404, 0.4656598, 0, 0.6117647, 1, 1,
0.1850898, -0.493138, 2.202522, 0, 0.6039216, 1, 1,
0.1853527, -0.8937724, 3.141556, 0, 0.5960785, 1, 1,
0.1892993, -0.4082378, 2.258884, 0, 0.5921569, 1, 1,
0.1901251, 0.3775567, 0.7009637, 0, 0.5843138, 1, 1,
0.1919047, -1.775872, 3.119128, 0, 0.5803922, 1, 1,
0.1931941, 0.1847587, 0.8373905, 0, 0.572549, 1, 1,
0.1936536, -0.4703471, 2.453963, 0, 0.5686275, 1, 1,
0.195204, 2.012242, 0.2853021, 0, 0.5607843, 1, 1,
0.2034783, -1.402454, 4.172398, 0, 0.5568628, 1, 1,
0.2098724, -0.2729734, 1.144904, 0, 0.5490196, 1, 1,
0.2114489, -1.769018, 2.711089, 0, 0.5450981, 1, 1,
0.2166969, -0.8107103, 2.161251, 0, 0.5372549, 1, 1,
0.2192639, -1.312099, 2.43214, 0, 0.5333334, 1, 1,
0.2204766, 0.6213448, 0.6538022, 0, 0.5254902, 1, 1,
0.2212489, 0.8820722, 0.8936166, 0, 0.5215687, 1, 1,
0.2212765, 0.7907377, -0.06995885, 0, 0.5137255, 1, 1,
0.2226895, 0.845562, 1.589402, 0, 0.509804, 1, 1,
0.2238857, -0.4976036, 2.17014, 0, 0.5019608, 1, 1,
0.2259831, -2.77451, 4.965744, 0, 0.4941176, 1, 1,
0.2270657, 0.01329913, 1.591115, 0, 0.4901961, 1, 1,
0.2361808, -0.470441, 2.201243, 0, 0.4823529, 1, 1,
0.237676, 0.9033297, 1.284364, 0, 0.4784314, 1, 1,
0.2406513, 0.3827157, -0.02088138, 0, 0.4705882, 1, 1,
0.2444519, -2.083781, 3.011419, 0, 0.4666667, 1, 1,
0.2445133, 1.634175, 0.5953572, 0, 0.4588235, 1, 1,
0.2511786, 0.6202689, -0.3324526, 0, 0.454902, 1, 1,
0.2511989, 0.2752391, 1.45129, 0, 0.4470588, 1, 1,
0.2539255, 0.6897035, 1.257796, 0, 0.4431373, 1, 1,
0.2539974, 0.7361093, -0.9393507, 0, 0.4352941, 1, 1,
0.2543244, 0.7646792, -0.7489339, 0, 0.4313726, 1, 1,
0.2552395, 0.6763682, -0.09834716, 0, 0.4235294, 1, 1,
0.2555608, -0.07836208, 0.8322856, 0, 0.4196078, 1, 1,
0.2603181, 0.6265856, 0.6069545, 0, 0.4117647, 1, 1,
0.2605144, 0.7938333, 0.5774384, 0, 0.4078431, 1, 1,
0.2618808, -0.4892483, 3.369348, 0, 0.4, 1, 1,
0.2665708, -0.5431825, 2.754475, 0, 0.3921569, 1, 1,
0.2675184, 0.05781134, 0.3759427, 0, 0.3882353, 1, 1,
0.2676986, -0.8549878, 3.771109, 0, 0.3803922, 1, 1,
0.2692392, 0.4604065, -0.5745247, 0, 0.3764706, 1, 1,
0.2711702, 1.046256, 0.5614764, 0, 0.3686275, 1, 1,
0.2728833, 0.1983234, 1.078403, 0, 0.3647059, 1, 1,
0.2738216, 0.3683584, 0.1839843, 0, 0.3568628, 1, 1,
0.2744222, -0.3126921, 3.1941, 0, 0.3529412, 1, 1,
0.2816655, -0.5426461, 1.60826, 0, 0.345098, 1, 1,
0.281752, 0.7196063, 1.393872, 0, 0.3411765, 1, 1,
0.2839667, 3.152139, 0.2343597, 0, 0.3333333, 1, 1,
0.2844429, -0.1834542, 1.636533, 0, 0.3294118, 1, 1,
0.2866269, -0.82664, 2.597388, 0, 0.3215686, 1, 1,
0.2867347, 1.456463, -1.016569, 0, 0.3176471, 1, 1,
0.2911118, -0.09187179, 2.348886, 0, 0.3098039, 1, 1,
0.2956166, 0.5094369, 0.7503411, 0, 0.3058824, 1, 1,
0.2960464, 0.3470075, 1.264181, 0, 0.2980392, 1, 1,
0.2970862, 1.395373, 0.5496191, 0, 0.2901961, 1, 1,
0.2999678, 0.2920236, 0.4756112, 0, 0.2862745, 1, 1,
0.3058113, -0.6582688, 2.829277, 0, 0.2784314, 1, 1,
0.3064258, -1.638799, 4.327217, 0, 0.2745098, 1, 1,
0.3086564, -0.3744352, 2.663845, 0, 0.2666667, 1, 1,
0.3129841, -0.8388486, 1.683356, 0, 0.2627451, 1, 1,
0.3143378, 0.7391009, 0.8956212, 0, 0.254902, 1, 1,
0.3157234, -0.1606914, 1.290672, 0, 0.2509804, 1, 1,
0.3168829, 0.1758921, 1.53403, 0, 0.2431373, 1, 1,
0.3169799, -0.2671269, 2.379197, 0, 0.2392157, 1, 1,
0.3185302, -1.824313, 1.905229, 0, 0.2313726, 1, 1,
0.3248369, -0.8404756, 1.674421, 0, 0.227451, 1, 1,
0.3269614, 0.1117541, 2.094252, 0, 0.2196078, 1, 1,
0.3334602, -0.5239798, 3.486614, 0, 0.2156863, 1, 1,
0.3352378, 0.7857593, 0.519291, 0, 0.2078431, 1, 1,
0.3367338, -0.4198458, 3.196634, 0, 0.2039216, 1, 1,
0.3400376, 0.8614279, 1.93935, 0, 0.1960784, 1, 1,
0.3440314, 0.7591349, 0.2196788, 0, 0.1882353, 1, 1,
0.3476929, -0.4327482, 2.651579, 0, 0.1843137, 1, 1,
0.3507234, 1.206205, 1.121514, 0, 0.1764706, 1, 1,
0.3507728, 1.523924, 0.3793023, 0, 0.172549, 1, 1,
0.3553525, 0.3695275, -0.4904312, 0, 0.1647059, 1, 1,
0.3563353, 0.520843, -0.05829107, 0, 0.1607843, 1, 1,
0.3614457, 1.182042, -0.5915282, 0, 0.1529412, 1, 1,
0.3669529, -0.4791449, 3.958158, 0, 0.1490196, 1, 1,
0.3699121, 0.4749558, 1.60348, 0, 0.1411765, 1, 1,
0.3791491, 0.9692835, 0.5086913, 0, 0.1372549, 1, 1,
0.3823608, 0.1040583, 2.003564, 0, 0.1294118, 1, 1,
0.384362, 2.239079, 2.108883, 0, 0.1254902, 1, 1,
0.3855163, -0.6420165, 0.6806125, 0, 0.1176471, 1, 1,
0.3896309, 1.007857, -0.8485821, 0, 0.1137255, 1, 1,
0.3913932, 0.6949385, 2.518553, 0, 0.1058824, 1, 1,
0.392868, 0.7883556, 1.453785, 0, 0.09803922, 1, 1,
0.3971631, 1.427751, 0.5627831, 0, 0.09411765, 1, 1,
0.4037219, 1.995657, -0.8588145, 0, 0.08627451, 1, 1,
0.4041506, 1.501802, 0.7085276, 0, 0.08235294, 1, 1,
0.4053938, 1.490131, 0.1804686, 0, 0.07450981, 1, 1,
0.4060347, -0.29705, 1.099637, 0, 0.07058824, 1, 1,
0.4085291, -1.478978, 2.369157, 0, 0.0627451, 1, 1,
0.4149596, -1.224839, 4.485078, 0, 0.05882353, 1, 1,
0.4163672, 0.5561352, 0.6304556, 0, 0.05098039, 1, 1,
0.4184481, 0.6090192, 1.370269, 0, 0.04705882, 1, 1,
0.4196815, 1.27156, 0.2374487, 0, 0.03921569, 1, 1,
0.4208438, 0.3643202, 0.9395129, 0, 0.03529412, 1, 1,
0.437028, -1.568127, 2.215218, 0, 0.02745098, 1, 1,
0.4386911, -1.82815, 3.118999, 0, 0.02352941, 1, 1,
0.4448567, 0.5094122, 0.5475591, 0, 0.01568628, 1, 1,
0.4508311, -0.04703727, 1.163503, 0, 0.01176471, 1, 1,
0.4520396, -0.5065485, 2.631924, 0, 0.003921569, 1, 1,
0.4528875, 1.493901, 1.459506, 0.003921569, 0, 1, 1,
0.4537928, 0.9938115, 0.4613717, 0.007843138, 0, 1, 1,
0.45856, -0.3914098, 3.543289, 0.01568628, 0, 1, 1,
0.4607069, 0.1557417, 0.04622565, 0.01960784, 0, 1, 1,
0.4615565, 0.993241, 0.5151169, 0.02745098, 0, 1, 1,
0.4666585, 0.1026881, 1.321719, 0.03137255, 0, 1, 1,
0.4681262, -0.8609517, 1.221022, 0.03921569, 0, 1, 1,
0.4683684, 1.039929, 0.4353946, 0.04313726, 0, 1, 1,
0.4685737, 2.478648, -0.6196272, 0.05098039, 0, 1, 1,
0.4855549, 0.3266194, 1.408947, 0.05490196, 0, 1, 1,
0.4870099, 0.9411912, 0.2091388, 0.0627451, 0, 1, 1,
0.4870284, -0.2190459, 2.330811, 0.06666667, 0, 1, 1,
0.4881333, 0.4234492, 1.085631, 0.07450981, 0, 1, 1,
0.4928172, 0.6880151, -0.5719991, 0.07843138, 0, 1, 1,
0.4934263, 1.289461, -0.5366777, 0.08627451, 0, 1, 1,
0.4950499, 0.6016509, 0.7309763, 0.09019608, 0, 1, 1,
0.4974498, 0.7186402, 0.9632725, 0.09803922, 0, 1, 1,
0.4999879, -0.5870238, 2.996401, 0.1058824, 0, 1, 1,
0.5027326, 0.6796872, 1.833012, 0.1098039, 0, 1, 1,
0.5042806, -0.5693385, 3.549548, 0.1176471, 0, 1, 1,
0.5072521, 0.5057502, 0.0318128, 0.1215686, 0, 1, 1,
0.5091917, -0.2449407, 3.427879, 0.1294118, 0, 1, 1,
0.5147859, 0.616366, -0.2035503, 0.1333333, 0, 1, 1,
0.5148085, 0.2382094, 3.187276, 0.1411765, 0, 1, 1,
0.5154825, 1.257733, -1.121392, 0.145098, 0, 1, 1,
0.5159857, -0.5337556, 2.056281, 0.1529412, 0, 1, 1,
0.5215307, 1.179261, 0.6330839, 0.1568628, 0, 1, 1,
0.5271589, -1.002229, 2.42752, 0.1647059, 0, 1, 1,
0.5272251, -1.411478, 3.339147, 0.1686275, 0, 1, 1,
0.5277389, 0.009170002, 2.328354, 0.1764706, 0, 1, 1,
0.5300061, 0.9212977, -0.9303076, 0.1803922, 0, 1, 1,
0.5332441, -0.2182369, 1.820049, 0.1882353, 0, 1, 1,
0.5337486, -0.3413877, 1.013621, 0.1921569, 0, 1, 1,
0.5356773, -0.1829017, 4.609635, 0.2, 0, 1, 1,
0.5363857, -0.8284907, 3.899778, 0.2078431, 0, 1, 1,
0.537011, -1.919113, 2.562949, 0.2117647, 0, 1, 1,
0.5405716, -0.5482068, 2.191935, 0.2196078, 0, 1, 1,
0.544955, -1.127885, 3.788262, 0.2235294, 0, 1, 1,
0.5498177, 1.369452, 0.0370753, 0.2313726, 0, 1, 1,
0.5586426, 1.620182, -0.4777737, 0.2352941, 0, 1, 1,
0.5675443, -0.08000566, 2.467445, 0.2431373, 0, 1, 1,
0.5677011, -0.3696843, 2.63991, 0.2470588, 0, 1, 1,
0.5820702, 0.1568935, 4.178925, 0.254902, 0, 1, 1,
0.5881523, -0.6792291, 1.185829, 0.2588235, 0, 1, 1,
0.5896942, 0.03871584, 2.276017, 0.2666667, 0, 1, 1,
0.5917878, -0.7533752, 1.768358, 0.2705882, 0, 1, 1,
0.5940903, -0.3504834, 0.5364971, 0.2784314, 0, 1, 1,
0.5941988, 0.8334193, 1.326298, 0.282353, 0, 1, 1,
0.5959232, -1.993411, 2.536548, 0.2901961, 0, 1, 1,
0.5972494, 0.7364872, 1.583587, 0.2941177, 0, 1, 1,
0.599696, 1.101753, 0.3156723, 0.3019608, 0, 1, 1,
0.6009418, -1.014531, 3.770682, 0.3098039, 0, 1, 1,
0.6011012, -1.315292, 1.437001, 0.3137255, 0, 1, 1,
0.6024294, -1.113454, 3.878339, 0.3215686, 0, 1, 1,
0.6092265, -0.517197, 2.530904, 0.3254902, 0, 1, 1,
0.611204, 0.0006826528, 3.512264, 0.3333333, 0, 1, 1,
0.6124257, 0.4311564, 0.9685261, 0.3372549, 0, 1, 1,
0.6133114, -0.595154, 2.133591, 0.345098, 0, 1, 1,
0.6161886, 0.2037459, 0.7097389, 0.3490196, 0, 1, 1,
0.6170654, 1.102194, -0.8963847, 0.3568628, 0, 1, 1,
0.6181784, -1.146069, 2.581193, 0.3607843, 0, 1, 1,
0.618246, 0.406177, 1.459631, 0.3686275, 0, 1, 1,
0.6236129, 0.7738826, 1.738597, 0.372549, 0, 1, 1,
0.623794, 0.7059286, -0.85021, 0.3803922, 0, 1, 1,
0.6249254, 0.08520507, 1.841864, 0.3843137, 0, 1, 1,
0.6250304, 0.7759965, 1.268133, 0.3921569, 0, 1, 1,
0.6288964, 1.428617, 0.6530873, 0.3960784, 0, 1, 1,
0.6314674, 0.04852378, 0.4550666, 0.4039216, 0, 1, 1,
0.6324435, -0.4478966, 2.298928, 0.4117647, 0, 1, 1,
0.6333961, 0.1297386, 1.644291, 0.4156863, 0, 1, 1,
0.6346577, 0.7811707, 1.389443, 0.4235294, 0, 1, 1,
0.6364019, 0.3053589, 0.5106611, 0.427451, 0, 1, 1,
0.6415144, 0.9822726, 0.211232, 0.4352941, 0, 1, 1,
0.6453391, 0.1010657, 1.333211, 0.4392157, 0, 1, 1,
0.6476339, -0.08767015, 3.049548, 0.4470588, 0, 1, 1,
0.6478217, -1.615274, 2.031635, 0.4509804, 0, 1, 1,
0.6478795, 0.9222372, -0.7382665, 0.4588235, 0, 1, 1,
0.6558499, -1.184656, 0.9610737, 0.4627451, 0, 1, 1,
0.656908, 0.4453479, 0.268064, 0.4705882, 0, 1, 1,
0.6583576, 1.139976, 0.1831273, 0.4745098, 0, 1, 1,
0.6911889, 1.46243, -0.3055406, 0.4823529, 0, 1, 1,
0.691415, 0.04411876, 1.528889, 0.4862745, 0, 1, 1,
0.6981428, -1.54486, 3.116894, 0.4941176, 0, 1, 1,
0.6997576, -0.8747692, 2.563079, 0.5019608, 0, 1, 1,
0.7010776, 1.421502, 1.530251, 0.5058824, 0, 1, 1,
0.708901, -0.8562227, 1.861291, 0.5137255, 0, 1, 1,
0.7192165, 1.128257, -0.2052007, 0.5176471, 0, 1, 1,
0.7277665, -0.5592787, 2.397096, 0.5254902, 0, 1, 1,
0.7288807, 0.8062302, 1.046439, 0.5294118, 0, 1, 1,
0.7299168, -0.7216016, -0.04632028, 0.5372549, 0, 1, 1,
0.7301884, 0.1790311, 0.8337935, 0.5411765, 0, 1, 1,
0.7315039, 1.414917, 0.1470542, 0.5490196, 0, 1, 1,
0.7316384, 1.082869, 0.157314, 0.5529412, 0, 1, 1,
0.7322642, -0.5242591, 0.5235066, 0.5607843, 0, 1, 1,
0.7355819, 0.7621841, -1.006495, 0.5647059, 0, 1, 1,
0.7367775, 0.3914712, 1.328595, 0.572549, 0, 1, 1,
0.7400291, 0.6614771, 1.575239, 0.5764706, 0, 1, 1,
0.7400905, -0.713877, 0.401296, 0.5843138, 0, 1, 1,
0.7436862, -1.187322, 3.609209, 0.5882353, 0, 1, 1,
0.7438633, -0.02730667, 3.145331, 0.5960785, 0, 1, 1,
0.7465159, -1.247059, 2.405575, 0.6039216, 0, 1, 1,
0.7508106, 0.1648979, 1.664555, 0.6078432, 0, 1, 1,
0.7513489, 0.4991371, 0.6267572, 0.6156863, 0, 1, 1,
0.7534658, 0.1529525, 0.8044583, 0.6196079, 0, 1, 1,
0.761906, -0.1088116, 2.227913, 0.627451, 0, 1, 1,
0.7649875, -0.3669142, 2.435705, 0.6313726, 0, 1, 1,
0.7658083, 1.126507, 0.5233504, 0.6392157, 0, 1, 1,
0.7804315, 1.283879, 1.100399, 0.6431373, 0, 1, 1,
0.7816162, 0.07716554, 0.3339356, 0.6509804, 0, 1, 1,
0.7845654, 0.03302799, 2.158254, 0.654902, 0, 1, 1,
0.7894763, -1.490671, 3.251395, 0.6627451, 0, 1, 1,
0.804111, -0.5187591, 3.772897, 0.6666667, 0, 1, 1,
0.8081095, 0.1430796, 1.403991, 0.6745098, 0, 1, 1,
0.8150506, 0.2407258, 0.03139928, 0.6784314, 0, 1, 1,
0.8188005, -0.5448065, 0.9181311, 0.6862745, 0, 1, 1,
0.8252687, -0.1439547, 0.4393001, 0.6901961, 0, 1, 1,
0.8264908, 0.05446251, 2.089756, 0.6980392, 0, 1, 1,
0.8272119, 1.065641, -0.5634561, 0.7058824, 0, 1, 1,
0.8286833, 0.9709735, -0.7957605, 0.7098039, 0, 1, 1,
0.8372635, 0.2474185, 1.684394, 0.7176471, 0, 1, 1,
0.8413468, 2.777136, 0.5451757, 0.7215686, 0, 1, 1,
0.8422526, -0.005439301, 1.995395, 0.7294118, 0, 1, 1,
0.8422896, 0.585234, 1.664228, 0.7333333, 0, 1, 1,
0.8518109, -2.579156, 3.661961, 0.7411765, 0, 1, 1,
0.8527848, -1.955541, 0.9519839, 0.7450981, 0, 1, 1,
0.8532714, -0.8518823, 3.96455, 0.7529412, 0, 1, 1,
0.8580765, -2.175715, 3.192704, 0.7568628, 0, 1, 1,
0.8608915, 0.7977701, 0.3591871, 0.7647059, 0, 1, 1,
0.8614989, -1.639263, 2.160414, 0.7686275, 0, 1, 1,
0.8629331, -0.4304348, 3.466335, 0.7764706, 0, 1, 1,
0.8632051, 0.07887001, 1.196051, 0.7803922, 0, 1, 1,
0.8657564, 0.9372241, -0.04044157, 0.7882353, 0, 1, 1,
0.8737559, 0.01103674, 0.7487315, 0.7921569, 0, 1, 1,
0.8745059, -0.2653089, 1.350862, 0.8, 0, 1, 1,
0.8862779, -0.3674935, 1.025394, 0.8078431, 0, 1, 1,
0.8874533, -1.039782, 2.540383, 0.8117647, 0, 1, 1,
0.8886737, -1.287331, 2.267426, 0.8196079, 0, 1, 1,
0.8938872, -0.7295913, 1.690534, 0.8235294, 0, 1, 1,
0.8945031, 0.8869253, 0.8586366, 0.8313726, 0, 1, 1,
0.895128, 0.3757803, 1.983315, 0.8352941, 0, 1, 1,
0.898397, -0.2491996, 2.248866, 0.8431373, 0, 1, 1,
0.9008816, 0.5678653, -0.004435848, 0.8470588, 0, 1, 1,
0.9107207, -0.3169678, 1.725196, 0.854902, 0, 1, 1,
0.9139115, -0.5208631, 2.072886, 0.8588235, 0, 1, 1,
0.915511, -0.7112321, 1.122424, 0.8666667, 0, 1, 1,
0.915673, -0.2419887, 2.417752, 0.8705882, 0, 1, 1,
0.9174967, 0.2984328, -0.4667868, 0.8784314, 0, 1, 1,
0.922404, 0.2236632, 1.930235, 0.8823529, 0, 1, 1,
0.9350441, -1.870989, 2.457853, 0.8901961, 0, 1, 1,
0.9410108, 0.5771437, 1.645401, 0.8941177, 0, 1, 1,
0.9427351, -0.6954042, 3.286386, 0.9019608, 0, 1, 1,
0.9558635, -0.3025975, 0.3543852, 0.9098039, 0, 1, 1,
0.9569284, -1.491112, 0.0003652718, 0.9137255, 0, 1, 1,
0.9572477, -0.2148168, 1.915327, 0.9215686, 0, 1, 1,
0.9730591, -0.6537432, -0.1771982, 0.9254902, 0, 1, 1,
0.982918, 0.1155798, 0.8781476, 0.9333333, 0, 1, 1,
0.9857951, 1.352028, 1.061801, 0.9372549, 0, 1, 1,
0.9897135, -1.359941, 3.091032, 0.945098, 0, 1, 1,
0.9917311, 0.9482572, 0.1654371, 0.9490196, 0, 1, 1,
0.9933962, -0.594218, 4.676353, 0.9568627, 0, 1, 1,
0.9961994, 0.1348833, 1.81301, 0.9607843, 0, 1, 1,
0.999655, -1.654436, 1.868825, 0.9686275, 0, 1, 1,
1.000419, -0.911476, 1.957664, 0.972549, 0, 1, 1,
1.004284, 1.936586, 0.2575887, 0.9803922, 0, 1, 1,
1.005223, 0.1729091, 1.623935, 0.9843137, 0, 1, 1,
1.014958, -0.4880874, 1.065287, 0.9921569, 0, 1, 1,
1.016833, 0.8285546, 2.556875, 0.9960784, 0, 1, 1,
1.017298, -0.5203046, 3.538291, 1, 0, 0.9960784, 1,
1.018403, -0.3073648, 1.676175, 1, 0, 0.9882353, 1,
1.019645, -0.6834018, 1.930107, 1, 0, 0.9843137, 1,
1.021552, 0.7353376, 0.8106816, 1, 0, 0.9764706, 1,
1.021778, 1.405813, 1.23978, 1, 0, 0.972549, 1,
1.02917, 0.2184816, 1.816045, 1, 0, 0.9647059, 1,
1.03056, 0.8488073, 0.2412767, 1, 0, 0.9607843, 1,
1.033063, 1.222829, 1.714944, 1, 0, 0.9529412, 1,
1.035439, 0.4819743, 0.3097589, 1, 0, 0.9490196, 1,
1.035843, -0.8697084, 1.193923, 1, 0, 0.9411765, 1,
1.037339, -0.4325792, 1.934496, 1, 0, 0.9372549, 1,
1.040961, 0.5624434, 1.239284, 1, 0, 0.9294118, 1,
1.048671, 0.2172854, 1.867477, 1, 0, 0.9254902, 1,
1.050317, -1.000226, 2.503164, 1, 0, 0.9176471, 1,
1.051627, 0.8725989, 0.389986, 1, 0, 0.9137255, 1,
1.053231, 0.08190331, 1.437927, 1, 0, 0.9058824, 1,
1.057651, -0.01397519, 2.341115, 1, 0, 0.9019608, 1,
1.072716, 0.3055584, 1.302541, 1, 0, 0.8941177, 1,
1.078235, 0.5773907, 1.997227, 1, 0, 0.8862745, 1,
1.079918, 0.04782303, 2.081884, 1, 0, 0.8823529, 1,
1.08108, 1.340353, -0.1998907, 1, 0, 0.8745098, 1,
1.081126, -0.1101298, 0.8711761, 1, 0, 0.8705882, 1,
1.084521, 1.360821, 1.292115, 1, 0, 0.8627451, 1,
1.093587, 0.1226134, 0.3833889, 1, 0, 0.8588235, 1,
1.094431, 1.320261, 2.124081, 1, 0, 0.8509804, 1,
1.094779, 3.957753, -0.09931453, 1, 0, 0.8470588, 1,
1.095746, 0.3314175, 1.718078, 1, 0, 0.8392157, 1,
1.096195, -1.228238, 2.750959, 1, 0, 0.8352941, 1,
1.099113, -1.465403, 3.31599, 1, 0, 0.827451, 1,
1.099401, -1.141532, 1.718135, 1, 0, 0.8235294, 1,
1.102046, -0.2347389, 1.68107, 1, 0, 0.8156863, 1,
1.106947, -2.264783, 1.923124, 1, 0, 0.8117647, 1,
1.109696, -0.8242121, 0.3950857, 1, 0, 0.8039216, 1,
1.111068, -1.350309, 2.735906, 1, 0, 0.7960784, 1,
1.126879, -0.4730406, 2.748266, 1, 0, 0.7921569, 1,
1.130982, 0.2680285, -0.1557071, 1, 0, 0.7843137, 1,
1.131004, -0.1649065, 2.42133, 1, 0, 0.7803922, 1,
1.135488, 0.07256291, 0.7610645, 1, 0, 0.772549, 1,
1.137243, -2.855265, 2.677771, 1, 0, 0.7686275, 1,
1.139959, -0.7736772, 2.783915, 1, 0, 0.7607843, 1,
1.147877, -0.3261687, 2.416302, 1, 0, 0.7568628, 1,
1.148673, -0.317597, 0.5130655, 1, 0, 0.7490196, 1,
1.148728, -1.731339, 1.905892, 1, 0, 0.7450981, 1,
1.154, -0.6938527, 1.764792, 1, 0, 0.7372549, 1,
1.155081, 0.1745251, 1.998452, 1, 0, 0.7333333, 1,
1.156692, 2.544964, -0.1241986, 1, 0, 0.7254902, 1,
1.158964, 1.422666, 1.034736, 1, 0, 0.7215686, 1,
1.164398, -1.497031, 1.446066, 1, 0, 0.7137255, 1,
1.164811, 1.094177, 0.1197602, 1, 0, 0.7098039, 1,
1.165783, 1.822114, -0.8663175, 1, 0, 0.7019608, 1,
1.165925, -1.74644, 1.477806, 1, 0, 0.6941177, 1,
1.171849, 0.3137766, 2.882746, 1, 0, 0.6901961, 1,
1.179779, -0.4828343, 1.184646, 1, 0, 0.682353, 1,
1.20421, -0.09620576, 2.075827, 1, 0, 0.6784314, 1,
1.218436, -0.8968692, 1.878777, 1, 0, 0.6705883, 1,
1.227624, 0.7959728, 0.4917853, 1, 0, 0.6666667, 1,
1.23293, 0.9031322, 1.295032, 1, 0, 0.6588235, 1,
1.234658, -0.2375184, 2.941567, 1, 0, 0.654902, 1,
1.23673, 0.476961, 2.634444, 1, 0, 0.6470588, 1,
1.237232, 0.4760566, 0.281909, 1, 0, 0.6431373, 1,
1.245767, 0.263655, 1.026669, 1, 0, 0.6352941, 1,
1.246087, -0.3232581, 2.68521, 1, 0, 0.6313726, 1,
1.250956, -1.718269, 3.439679, 1, 0, 0.6235294, 1,
1.253201, -0.207359, 1.146466, 1, 0, 0.6196079, 1,
1.255084, 1.77886, 0.7717403, 1, 0, 0.6117647, 1,
1.258373, -0.7074538, 0.2800763, 1, 0, 0.6078432, 1,
1.258741, 0.2977311, 1.829416, 1, 0, 0.6, 1,
1.266813, -0.04697849, 0.5646027, 1, 0, 0.5921569, 1,
1.272019, -1.403262, 3.605434, 1, 0, 0.5882353, 1,
1.280707, -1.984916, 3.436413, 1, 0, 0.5803922, 1,
1.297148, 0.2299107, 2.862167, 1, 0, 0.5764706, 1,
1.301435, -0.7906331, 3.243751, 1, 0, 0.5686275, 1,
1.306053, -0.5135791, 1.305966, 1, 0, 0.5647059, 1,
1.306101, 2.482943, 1.004064, 1, 0, 0.5568628, 1,
1.308434, 1.242482, 1.269473, 1, 0, 0.5529412, 1,
1.335866, 0.09789518, 2.874417, 1, 0, 0.5450981, 1,
1.343145, -0.2942538, 2.754188, 1, 0, 0.5411765, 1,
1.349828, -0.8763333, 3.474151, 1, 0, 0.5333334, 1,
1.350399, -2.355539, 3.849003, 1, 0, 0.5294118, 1,
1.36453, -0.1079286, 2.135749, 1, 0, 0.5215687, 1,
1.365734, 0.1567311, 0.5891155, 1, 0, 0.5176471, 1,
1.367218, 0.1537796, 1.013047, 1, 0, 0.509804, 1,
1.370112, 0.699587, 0.9555762, 1, 0, 0.5058824, 1,
1.382944, 0.9510953, -0.4073699, 1, 0, 0.4980392, 1,
1.387697, 0.4628505, 1.76687, 1, 0, 0.4901961, 1,
1.389257, 0.202815, 1.851999, 1, 0, 0.4862745, 1,
1.389953, 1.493652, -0.07584185, 1, 0, 0.4784314, 1,
1.391948, -0.1406512, 1.945554, 1, 0, 0.4745098, 1,
1.395485, -0.7412299, 2.63273, 1, 0, 0.4666667, 1,
1.421109, -1.13877, 3.813173, 1, 0, 0.4627451, 1,
1.423656, -0.3419476, 1.065227, 1, 0, 0.454902, 1,
1.425353, -0.501446, 1.954112, 1, 0, 0.4509804, 1,
1.428046, -0.005269744, 3.362686, 1, 0, 0.4431373, 1,
1.443047, -0.7904231, 2.438419, 1, 0, 0.4392157, 1,
1.443811, 0.2178286, 0.9690806, 1, 0, 0.4313726, 1,
1.453874, -0.4582665, 2.380219, 1, 0, 0.427451, 1,
1.463033, 0.6668298, 2.059199, 1, 0, 0.4196078, 1,
1.479195, -0.7135244, 1.451229, 1, 0, 0.4156863, 1,
1.505828, 0.23737, 2.353144, 1, 0, 0.4078431, 1,
1.519625, 0.2844162, 1.254764, 1, 0, 0.4039216, 1,
1.523191, -0.6543943, 2.510797, 1, 0, 0.3960784, 1,
1.524672, 0.5076152, 0.3526394, 1, 0, 0.3882353, 1,
1.525155, 0.8403921, 1.091358, 1, 0, 0.3843137, 1,
1.526803, -0.3145462, 2.346897, 1, 0, 0.3764706, 1,
1.529347, -0.9313552, 3.913594, 1, 0, 0.372549, 1,
1.545334, -1.467987, 2.053519, 1, 0, 0.3647059, 1,
1.55574, 0.1369784, 1.748653, 1, 0, 0.3607843, 1,
1.575165, -0.7440205, -0.7862102, 1, 0, 0.3529412, 1,
1.586362, 0.2937114, 1.382015, 1, 0, 0.3490196, 1,
1.589993, 1.256524, 0.2690951, 1, 0, 0.3411765, 1,
1.596121, -1.439558, 2.191912, 1, 0, 0.3372549, 1,
1.597816, 1.365699, 0.7306689, 1, 0, 0.3294118, 1,
1.607736, 0.8521405, -1.339327, 1, 0, 0.3254902, 1,
1.61443, 1.15112, 0.8675243, 1, 0, 0.3176471, 1,
1.619498, -1.045285, 1.801523, 1, 0, 0.3137255, 1,
1.633157, -0.1773524, 1.477818, 1, 0, 0.3058824, 1,
1.635515, -2.815345, 2.083692, 1, 0, 0.2980392, 1,
1.641175, -0.1431713, 0.9977174, 1, 0, 0.2941177, 1,
1.654913, 0.9128978, 0.2288664, 1, 0, 0.2862745, 1,
1.656583, -0.05712016, 3.527373, 1, 0, 0.282353, 1,
1.675086, 0.4088513, 1.791006, 1, 0, 0.2745098, 1,
1.687027, 0.9046423, -0.4697926, 1, 0, 0.2705882, 1,
1.69497, -2.516687, 2.787404, 1, 0, 0.2627451, 1,
1.703898, 0.121128, 0.6882479, 1, 0, 0.2588235, 1,
1.710845, 1.063199, 0.7321388, 1, 0, 0.2509804, 1,
1.729712, 1.290321, 0.31029, 1, 0, 0.2470588, 1,
1.752199, 0.8329934, 0.7571032, 1, 0, 0.2392157, 1,
1.757418, 1.759145, 1.181601, 1, 0, 0.2352941, 1,
1.761598, -1.706605, 2.790996, 1, 0, 0.227451, 1,
1.784238, 0.02824176, 0.5826088, 1, 0, 0.2235294, 1,
1.796014, 1.513845, 1.329605, 1, 0, 0.2156863, 1,
1.796297, 0.3107156, 0.01166962, 1, 0, 0.2117647, 1,
1.806398, -0.1762583, 2.416891, 1, 0, 0.2039216, 1,
1.806606, 0.459884, 1.756486, 1, 0, 0.1960784, 1,
1.814324, -0.09144275, 0.7297016, 1, 0, 0.1921569, 1,
1.840884, -0.07212993, -0.3013697, 1, 0, 0.1843137, 1,
1.860556, 0.5698394, 0.4998064, 1, 0, 0.1803922, 1,
1.876676, -0.5624653, 0.9430839, 1, 0, 0.172549, 1,
1.884278, -0.7418846, 2.122806, 1, 0, 0.1686275, 1,
1.893902, -0.1545721, 2.407124, 1, 0, 0.1607843, 1,
1.987451, 0.1813104, 1.248776, 1, 0, 0.1568628, 1,
2.005965, -1.420089, 2.161088, 1, 0, 0.1490196, 1,
2.006145, -1.516269, 3.533774, 1, 0, 0.145098, 1,
2.025802, -0.9485553, 1.906671, 1, 0, 0.1372549, 1,
2.037879, -1.468995, 2.05365, 1, 0, 0.1333333, 1,
2.043897, 0.1510531, 1.534246, 1, 0, 0.1254902, 1,
2.069141, 0.2315542, 1.28451, 1, 0, 0.1215686, 1,
2.07165, -0.7250663, 1.632338, 1, 0, 0.1137255, 1,
2.078895, 0.6929685, 0.8273041, 1, 0, 0.1098039, 1,
2.079502, -1.307674, 2.654422, 1, 0, 0.1019608, 1,
2.095591, 0.9042504, 0.9051484, 1, 0, 0.09411765, 1,
2.127344, 0.9325523, -0.3935417, 1, 0, 0.09019608, 1,
2.129964, -1.351588, 3.220662, 1, 0, 0.08235294, 1,
2.133028, 0.7322475, 1.315855, 1, 0, 0.07843138, 1,
2.15449, -1.530943, 1.521993, 1, 0, 0.07058824, 1,
2.180615, -1.095269, 2.834255, 1, 0, 0.06666667, 1,
2.196862, 0.2632287, 0.4809214, 1, 0, 0.05882353, 1,
2.221407, 0.2515383, -0.8826007, 1, 0, 0.05490196, 1,
2.303733, -0.06456771, 2.472205, 1, 0, 0.04705882, 1,
2.304685, -0.8209515, 2.319785, 1, 0, 0.04313726, 1,
2.553336, -0.0146745, 0.8252185, 1, 0, 0.03529412, 1,
2.61611, 1.450408, 1.057817, 1, 0, 0.03137255, 1,
2.65943, 0.5836285, 1.499902, 1, 0, 0.02352941, 1,
2.766269, 2.243624, 2.368721, 1, 0, 0.01960784, 1,
2.807388, 2.610962, -0.2976227, 1, 0, 0.01176471, 1,
3.255837, 1.551864, 1.71418, 1, 0, 0.007843138, 1
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
-0.3724108, -4.072048, -6.819571, 0, -0.5, 0.5, 0.5,
-0.3724108, -4.072048, -6.819571, 1, -0.5, 0.5, 0.5,
-0.3724108, -4.072048, -6.819571, 1, 1.5, 0.5, 0.5,
-0.3724108, -4.072048, -6.819571, 0, 1.5, 0.5, 0.5
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
-5.230635, 0.5247473, -6.819571, 0, -0.5, 0.5, 0.5,
-5.230635, 0.5247473, -6.819571, 1, -0.5, 0.5, 0.5,
-5.230635, 0.5247473, -6.819571, 1, 1.5, 0.5, 0.5,
-5.230635, 0.5247473, -6.819571, 0, 1.5, 0.5, 0.5
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
-5.230635, -4.072048, 0.0832572, 0, -0.5, 0.5, 0.5,
-5.230635, -4.072048, 0.0832572, 1, -0.5, 0.5, 0.5,
-5.230635, -4.072048, 0.0832572, 1, 1.5, 0.5, 0.5,
-5.230635, -4.072048, 0.0832572, 0, 1.5, 0.5, 0.5
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
-4, -3.011249, -5.226611,
2, -3.011249, -5.226611,
-4, -3.011249, -5.226611,
-4, -3.188049, -5.492105,
-2, -3.011249, -5.226611,
-2, -3.188049, -5.492105,
0, -3.011249, -5.226611,
0, -3.188049, -5.492105,
2, -3.011249, -5.226611,
2, -3.188049, -5.492105
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
-4, -3.541649, -6.023091, 0, -0.5, 0.5, 0.5,
-4, -3.541649, -6.023091, 1, -0.5, 0.5, 0.5,
-4, -3.541649, -6.023091, 1, 1.5, 0.5, 0.5,
-4, -3.541649, -6.023091, 0, 1.5, 0.5, 0.5,
-2, -3.541649, -6.023091, 0, -0.5, 0.5, 0.5,
-2, -3.541649, -6.023091, 1, -0.5, 0.5, 0.5,
-2, -3.541649, -6.023091, 1, 1.5, 0.5, 0.5,
-2, -3.541649, -6.023091, 0, 1.5, 0.5, 0.5,
0, -3.541649, -6.023091, 0, -0.5, 0.5, 0.5,
0, -3.541649, -6.023091, 1, -0.5, 0.5, 0.5,
0, -3.541649, -6.023091, 1, 1.5, 0.5, 0.5,
0, -3.541649, -6.023091, 0, 1.5, 0.5, 0.5,
2, -3.541649, -6.023091, 0, -0.5, 0.5, 0.5,
2, -3.541649, -6.023091, 1, -0.5, 0.5, 0.5,
2, -3.541649, -6.023091, 1, 1.5, 0.5, 0.5,
2, -3.541649, -6.023091, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.109506, -2, -5.226611,
-4.109506, 3, -5.226611,
-4.109506, -2, -5.226611,
-4.29636, -2, -5.492105,
-4.109506, -1, -5.226611,
-4.29636, -1, -5.492105,
-4.109506, 0, -5.226611,
-4.29636, 0, -5.492105,
-4.109506, 1, -5.226611,
-4.29636, 1, -5.492105,
-4.109506, 2, -5.226611,
-4.29636, 2, -5.492105,
-4.109506, 3, -5.226611,
-4.29636, 3, -5.492105
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
-4.67007, -2, -6.023091, 0, -0.5, 0.5, 0.5,
-4.67007, -2, -6.023091, 1, -0.5, 0.5, 0.5,
-4.67007, -2, -6.023091, 1, 1.5, 0.5, 0.5,
-4.67007, -2, -6.023091, 0, 1.5, 0.5, 0.5,
-4.67007, -1, -6.023091, 0, -0.5, 0.5, 0.5,
-4.67007, -1, -6.023091, 1, -0.5, 0.5, 0.5,
-4.67007, -1, -6.023091, 1, 1.5, 0.5, 0.5,
-4.67007, -1, -6.023091, 0, 1.5, 0.5, 0.5,
-4.67007, 0, -6.023091, 0, -0.5, 0.5, 0.5,
-4.67007, 0, -6.023091, 1, -0.5, 0.5, 0.5,
-4.67007, 0, -6.023091, 1, 1.5, 0.5, 0.5,
-4.67007, 0, -6.023091, 0, 1.5, 0.5, 0.5,
-4.67007, 1, -6.023091, 0, -0.5, 0.5, 0.5,
-4.67007, 1, -6.023091, 1, -0.5, 0.5, 0.5,
-4.67007, 1, -6.023091, 1, 1.5, 0.5, 0.5,
-4.67007, 1, -6.023091, 0, 1.5, 0.5, 0.5,
-4.67007, 2, -6.023091, 0, -0.5, 0.5, 0.5,
-4.67007, 2, -6.023091, 1, -0.5, 0.5, 0.5,
-4.67007, 2, -6.023091, 1, 1.5, 0.5, 0.5,
-4.67007, 2, -6.023091, 0, 1.5, 0.5, 0.5,
-4.67007, 3, -6.023091, 0, -0.5, 0.5, 0.5,
-4.67007, 3, -6.023091, 1, -0.5, 0.5, 0.5,
-4.67007, 3, -6.023091, 1, 1.5, 0.5, 0.5,
-4.67007, 3, -6.023091, 0, 1.5, 0.5, 0.5
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
-4.109506, -3.011249, -4,
-4.109506, -3.011249, 4,
-4.109506, -3.011249, -4,
-4.29636, -3.188049, -4,
-4.109506, -3.011249, -2,
-4.29636, -3.188049, -2,
-4.109506, -3.011249, 0,
-4.29636, -3.188049, 0,
-4.109506, -3.011249, 2,
-4.29636, -3.188049, 2,
-4.109506, -3.011249, 4,
-4.29636, -3.188049, 4
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
-4.67007, -3.541649, -4, 0, -0.5, 0.5, 0.5,
-4.67007, -3.541649, -4, 1, -0.5, 0.5, 0.5,
-4.67007, -3.541649, -4, 1, 1.5, 0.5, 0.5,
-4.67007, -3.541649, -4, 0, 1.5, 0.5, 0.5,
-4.67007, -3.541649, -2, 0, -0.5, 0.5, 0.5,
-4.67007, -3.541649, -2, 1, -0.5, 0.5, 0.5,
-4.67007, -3.541649, -2, 1, 1.5, 0.5, 0.5,
-4.67007, -3.541649, -2, 0, 1.5, 0.5, 0.5,
-4.67007, -3.541649, 0, 0, -0.5, 0.5, 0.5,
-4.67007, -3.541649, 0, 1, -0.5, 0.5, 0.5,
-4.67007, -3.541649, 0, 1, 1.5, 0.5, 0.5,
-4.67007, -3.541649, 0, 0, 1.5, 0.5, 0.5,
-4.67007, -3.541649, 2, 0, -0.5, 0.5, 0.5,
-4.67007, -3.541649, 2, 1, -0.5, 0.5, 0.5,
-4.67007, -3.541649, 2, 1, 1.5, 0.5, 0.5,
-4.67007, -3.541649, 2, 0, 1.5, 0.5, 0.5,
-4.67007, -3.541649, 4, 0, -0.5, 0.5, 0.5,
-4.67007, -3.541649, 4, 1, -0.5, 0.5, 0.5,
-4.67007, -3.541649, 4, 1, 1.5, 0.5, 0.5,
-4.67007, -3.541649, 4, 0, 1.5, 0.5, 0.5
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
-4.109506, -3.011249, -5.226611,
-4.109506, 4.060744, -5.226611,
-4.109506, -3.011249, 5.393126,
-4.109506, 4.060744, 5.393126,
-4.109506, -3.011249, -5.226611,
-4.109506, -3.011249, 5.393126,
-4.109506, 4.060744, -5.226611,
-4.109506, 4.060744, 5.393126,
-4.109506, -3.011249, -5.226611,
3.364684, -3.011249, -5.226611,
-4.109506, -3.011249, 5.393126,
3.364684, -3.011249, 5.393126,
-4.109506, 4.060744, -5.226611,
3.364684, 4.060744, -5.226611,
-4.109506, 4.060744, 5.393126,
3.364684, 4.060744, 5.393126,
3.364684, -3.011249, -5.226611,
3.364684, 4.060744, -5.226611,
3.364684, -3.011249, 5.393126,
3.364684, 4.060744, 5.393126,
3.364684, -3.011249, -5.226611,
3.364684, -3.011249, 5.393126,
3.364684, 4.060744, -5.226611,
3.364684, 4.060744, 5.393126
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
var radius = 7.895971;
var distance = 35.13007;
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
mvMatrix.translate( 0.3724108, -0.5247473, -0.0832572 );
mvMatrix.scale( 1.142235, 1.207196, 0.8039069 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.13007);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Endrin<-read.table("Endrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Endrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Endrin' not found
```

```r
y<-Endrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Endrin' not found
```

```r
z<-Endrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Endrin' not found
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
-4.000659, 0.7303978, -1.310907, 0, 0, 1, 1, 1,
-2.655863, -1.377035, -1.341259, 1, 0, 0, 1, 1,
-2.59522, -0.5813211, -2.274385, 1, 0, 0, 1, 1,
-2.551326, -1.958259, -2.30707, 1, 0, 0, 1, 1,
-2.51669, 0.4868934, -1.347313, 1, 0, 0, 1, 1,
-2.46484, 0.4729775, -2.986171, 1, 0, 0, 1, 1,
-2.402339, 0.1706466, -1.403823, 0, 0, 0, 1, 1,
-2.395324, 1.100674, -0.8878825, 0, 0, 0, 1, 1,
-2.38788, 0.06286944, -3.23123, 0, 0, 0, 1, 1,
-2.364315, -0.4875887, -0.7183296, 0, 0, 0, 1, 1,
-2.362404, -0.8270887, -3.194021, 0, 0, 0, 1, 1,
-2.360393, -1.128209, -2.408003, 0, 0, 0, 1, 1,
-2.313706, 0.8209149, -1.443057, 0, 0, 0, 1, 1,
-2.238043, 0.1915294, -3.063664, 1, 1, 1, 1, 1,
-2.205724, 0.5296358, -2.410276, 1, 1, 1, 1, 1,
-2.152401, 1.241584, -1.954662, 1, 1, 1, 1, 1,
-2.152263, 1.317503, -1.408774, 1, 1, 1, 1, 1,
-2.149714, 0.2411077, -1.96282, 1, 1, 1, 1, 1,
-2.139776, 1.977377, -0.8074288, 1, 1, 1, 1, 1,
-2.113761, -1.547992, -2.500816, 1, 1, 1, 1, 1,
-2.063863, -0.4688778, -1.943276, 1, 1, 1, 1, 1,
-2.055339, 0.4495026, 0.4080554, 1, 1, 1, 1, 1,
-2.034927, -1.161151, -2.523718, 1, 1, 1, 1, 1,
-2.022254, 0.7173891, -3.676034, 1, 1, 1, 1, 1,
-2.004692, 1.231299, -3.12918, 1, 1, 1, 1, 1,
-1.961732, 0.08197226, -3.195298, 1, 1, 1, 1, 1,
-1.922461, -2.097244, -2.512707, 1, 1, 1, 1, 1,
-1.919145, -0.231472, -1.013723, 1, 1, 1, 1, 1,
-1.893019, 0.4872659, -1.634511, 0, 0, 1, 1, 1,
-1.891279, 0.7796088, -1.291871, 1, 0, 0, 1, 1,
-1.881571, -1.704753, -2.672861, 1, 0, 0, 1, 1,
-1.874859, 2.271108, -0.1104819, 1, 0, 0, 1, 1,
-1.85183, -1.813047, -1.885163, 1, 0, 0, 1, 1,
-1.823452, -1.153967, -2.632684, 1, 0, 0, 1, 1,
-1.813604, -1.055987, -1.629044, 0, 0, 0, 1, 1,
-1.789497, 1.398427, -1.073041, 0, 0, 0, 1, 1,
-1.784541, 0.9233858, 1.345501, 0, 0, 0, 1, 1,
-1.776558, 1.857653, -0.9044223, 0, 0, 0, 1, 1,
-1.774462, -1.290753, -2.942789, 0, 0, 0, 1, 1,
-1.765866, 0.6004252, -2.114096, 0, 0, 0, 1, 1,
-1.747915, -0.7715062, -3.742492, 0, 0, 0, 1, 1,
-1.741899, -2.09848, -2.362278, 1, 1, 1, 1, 1,
-1.715863, 0.07083566, -0.2017132, 1, 1, 1, 1, 1,
-1.715162, -0.1901672, -1.612978, 1, 1, 1, 1, 1,
-1.707496, 1.194861, -1.185834, 1, 1, 1, 1, 1,
-1.683034, -0.6649444, -2.527296, 1, 1, 1, 1, 1,
-1.678553, 0.332517, -0.6916056, 1, 1, 1, 1, 1,
-1.64661, -0.3284446, -2.471865, 1, 1, 1, 1, 1,
-1.644073, 0.1697515, -2.158865, 1, 1, 1, 1, 1,
-1.624337, -0.2714108, -2.353661, 1, 1, 1, 1, 1,
-1.622616, -0.3626687, -1.794312, 1, 1, 1, 1, 1,
-1.595441, -0.6244141, -1.540469, 1, 1, 1, 1, 1,
-1.595004, -0.1344287, -1.629737, 1, 1, 1, 1, 1,
-1.594534, -0.9790812, -0.1684873, 1, 1, 1, 1, 1,
-1.585908, -0.2026857, -1.10156, 1, 1, 1, 1, 1,
-1.584113, 0.1109314, -3.13621, 1, 1, 1, 1, 1,
-1.559583, 1.841841, -2.510632, 0, 0, 1, 1, 1,
-1.557271, 0.7537012, 0.5270663, 1, 0, 0, 1, 1,
-1.541851, 0.9677917, 0.1608941, 1, 0, 0, 1, 1,
-1.541269, -2.854694, -3.485382, 1, 0, 0, 1, 1,
-1.528717, -0.5216848, -1.15668, 1, 0, 0, 1, 1,
-1.52569, 0.3942036, -0.5476411, 1, 0, 0, 1, 1,
-1.510786, 0.9627948, -1.915073, 0, 0, 0, 1, 1,
-1.484662, -0.5238549, -1.122212, 0, 0, 0, 1, 1,
-1.471842, -0.7963192, -1.167281, 0, 0, 0, 1, 1,
-1.471751, -0.2623737, -1.376011, 0, 0, 0, 1, 1,
-1.45974, 1.011921, -1.312036, 0, 0, 0, 1, 1,
-1.435521, -0.7379975, -2.101889, 0, 0, 0, 1, 1,
-1.434001, 0.6846653, -0.5041825, 0, 0, 0, 1, 1,
-1.411757, -1.382977, -0.9614419, 1, 1, 1, 1, 1,
-1.404604, -1.14477, -3.716152, 1, 1, 1, 1, 1,
-1.401979, 1.889062, -0.5990806, 1, 1, 1, 1, 1,
-1.399097, -1.344367, -1.652685, 1, 1, 1, 1, 1,
-1.384577, 0.5529504, -1.873012, 1, 1, 1, 1, 1,
-1.381359, 1.230309, 0.7313523, 1, 1, 1, 1, 1,
-1.369455, -0.130167, -2.054516, 1, 1, 1, 1, 1,
-1.364411, -0.3230425, -0.9630944, 1, 1, 1, 1, 1,
-1.358647, -0.296159, -1.3393, 1, 1, 1, 1, 1,
-1.356901, -1.263288, -2.762419, 1, 1, 1, 1, 1,
-1.356084, 0.7460172, -0.6465513, 1, 1, 1, 1, 1,
-1.353098, 0.2942492, 0.01419976, 1, 1, 1, 1, 1,
-1.350286, 0.9147265, -0.5806818, 1, 1, 1, 1, 1,
-1.348593, -0.3864033, -2.273169, 1, 1, 1, 1, 1,
-1.346105, -1.886797, -1.816707, 1, 1, 1, 1, 1,
-1.345762, -0.04301715, -2.85939, 0, 0, 1, 1, 1,
-1.342745, -0.7391877, -2.425738, 1, 0, 0, 1, 1,
-1.3388, -1.864003, -3.394698, 1, 0, 0, 1, 1,
-1.322397, 1.919941, 0.6276382, 1, 0, 0, 1, 1,
-1.321722, -0.1721981, -2.561128, 1, 0, 0, 1, 1,
-1.315102, -0.3880479, -0.5321863, 1, 0, 0, 1, 1,
-1.312958, -0.4325229, -1.585514, 0, 0, 0, 1, 1,
-1.311202, 0.8730732, -0.5960757, 0, 0, 0, 1, 1,
-1.306797, -0.1491341, -2.717358, 0, 0, 0, 1, 1,
-1.299331, 0.9251553, -1.865726, 0, 0, 0, 1, 1,
-1.298589, -0.5258956, -3.974693, 0, 0, 0, 1, 1,
-1.293972, -1.483632, -1.23966, 0, 0, 0, 1, 1,
-1.291615, 0.3626128, -2.338608, 0, 0, 0, 1, 1,
-1.289374, -1.349411, -1.752592, 1, 1, 1, 1, 1,
-1.288543, -0.1252571, -1.786783, 1, 1, 1, 1, 1,
-1.288446, -0.2383511, -2.327228, 1, 1, 1, 1, 1,
-1.284168, 0.155905, -1.120677, 1, 1, 1, 1, 1,
-1.274585, 0.3662187, -1.32685, 1, 1, 1, 1, 1,
-1.269839, -0.871855, -1.808109, 1, 1, 1, 1, 1,
-1.267942, -0.5839358, -2.602821, 1, 1, 1, 1, 1,
-1.267005, 0.3164085, -0.7183796, 1, 1, 1, 1, 1,
-1.265111, -0.3942497, -3.073704, 1, 1, 1, 1, 1,
-1.263543, -0.002502133, -3.045507, 1, 1, 1, 1, 1,
-1.261416, -0.03204761, -2.033815, 1, 1, 1, 1, 1,
-1.260838, -1.173961, -2.621202, 1, 1, 1, 1, 1,
-1.260054, 0.2887444, -0.9978406, 1, 1, 1, 1, 1,
-1.25872, 0.7472312, -1.690403, 1, 1, 1, 1, 1,
-1.252313, 0.09750799, 0.2949638, 1, 1, 1, 1, 1,
-1.249732, -0.2293685, -2.074712, 0, 0, 1, 1, 1,
-1.231207, -0.1806288, -2.535517, 1, 0, 0, 1, 1,
-1.229058, 0.08129238, 0.3377735, 1, 0, 0, 1, 1,
-1.217061, 0.03215401, -1.208192, 1, 0, 0, 1, 1,
-1.206987, -1.144824, -1.017543, 1, 0, 0, 1, 1,
-1.204713, 0.2393143, -0.8502911, 1, 0, 0, 1, 1,
-1.19966, -0.7244721, -2.123925, 0, 0, 0, 1, 1,
-1.19248, 1.758029, -0.1969445, 0, 0, 0, 1, 1,
-1.189985, -0.401371, -1.320478, 0, 0, 0, 1, 1,
-1.186406, 0.8650089, 0.1270839, 0, 0, 0, 1, 1,
-1.18053, -0.2093682, -2.320082, 0, 0, 0, 1, 1,
-1.175218, 1.012383, -1.005983, 0, 0, 0, 1, 1,
-1.174111, 0.9031353, -1.825533, 0, 0, 0, 1, 1,
-1.174104, 0.1246616, -1.547246, 1, 1, 1, 1, 1,
-1.169374, -0.5213453, 0.5928075, 1, 1, 1, 1, 1,
-1.16876, -0.6336343, -3.39181, 1, 1, 1, 1, 1,
-1.162377, 0.3521444, -1.23062, 1, 1, 1, 1, 1,
-1.15359, 1.001202, -0.3008605, 1, 1, 1, 1, 1,
-1.148037, 0.7598705, -0.5283568, 1, 1, 1, 1, 1,
-1.147241, -0.01431753, 0.004181862, 1, 1, 1, 1, 1,
-1.140605, -0.6704209, -1.834373, 1, 1, 1, 1, 1,
-1.130805, 1.14472, -0.4317495, 1, 1, 1, 1, 1,
-1.121212, -2.908259, -1.721474, 1, 1, 1, 1, 1,
-1.118207, 0.12188, 0.4420254, 1, 1, 1, 1, 1,
-1.11718, 0.2716671, -2.085752, 1, 1, 1, 1, 1,
-1.11222, -1.32793, -3.18025, 1, 1, 1, 1, 1,
-1.111148, -0.3369326, -4.614866, 1, 1, 1, 1, 1,
-1.110494, -0.74088, -1.515111, 1, 1, 1, 1, 1,
-1.10969, -0.5585399, -2.702797, 0, 0, 1, 1, 1,
-1.105313, 1.020457, -1.157143, 1, 0, 0, 1, 1,
-1.0984, 0.8249452, -1.402668, 1, 0, 0, 1, 1,
-1.093987, -1.542849, -1.960749, 1, 0, 0, 1, 1,
-1.082311, 0.2837964, 0.2310359, 1, 0, 0, 1, 1,
-1.064832, -0.08123499, -1.866026, 1, 0, 0, 1, 1,
-1.060748, 0.4681329, -1.891693, 0, 0, 0, 1, 1,
-1.050021, -1.579542, -2.196194, 0, 0, 0, 1, 1,
-1.033946, 0.763903, -1.831946, 0, 0, 0, 1, 1,
-1.026121, -0.2304698, -0.6431836, 0, 0, 0, 1, 1,
-1.025767, -0.01247537, -1.97308, 0, 0, 0, 1, 1,
-1.019919, 0.4647999, -1.3184, 0, 0, 0, 1, 1,
-1.012817, 0.08986612, -1.97493, 0, 0, 0, 1, 1,
-1.011592, 0.3261598, -1.647417, 1, 1, 1, 1, 1,
-1.007818, 0.6601082, -0.9147887, 1, 1, 1, 1, 1,
-1.000883, 0.9138928, -2.710623, 1, 1, 1, 1, 1,
-0.9980641, 0.1298111, -1.840991, 1, 1, 1, 1, 1,
-0.9976075, -1.452343, -1.102586, 1, 1, 1, 1, 1,
-0.9929309, 1.110391, 0.4725873, 1, 1, 1, 1, 1,
-0.985095, 1.022274, -1.670511, 1, 1, 1, 1, 1,
-0.980716, -2.404037, 0.03584253, 1, 1, 1, 1, 1,
-0.9779981, -0.8103235, -3.544866, 1, 1, 1, 1, 1,
-0.9772512, 0.8295909, -0.5252383, 1, 1, 1, 1, 1,
-0.9647436, -0.09295388, 0.04380153, 1, 1, 1, 1, 1,
-0.9403377, 1.551023, 0.2047866, 1, 1, 1, 1, 1,
-0.9382309, -0.03548157, -1.976217, 1, 1, 1, 1, 1,
-0.9269886, -0.5800046, -1.527068, 1, 1, 1, 1, 1,
-0.9232361, -0.7685423, -3.055305, 1, 1, 1, 1, 1,
-0.9175471, 2.958663, 0.1372934, 0, 0, 1, 1, 1,
-0.9175344, 0.8933548, 0.6383459, 1, 0, 0, 1, 1,
-0.9108207, 0.712836, -0.5040455, 1, 0, 0, 1, 1,
-0.9076388, -0.2001832, -1.530868, 1, 0, 0, 1, 1,
-0.9066964, 0.07601118, -2.813677, 1, 0, 0, 1, 1,
-0.9012542, 1.453601, -1.041054, 1, 0, 0, 1, 1,
-0.9004017, 2.933619, -0.7926983, 0, 0, 0, 1, 1,
-0.8965483, -0.9029338, -3.678757, 0, 0, 0, 1, 1,
-0.8960805, 1.09918, -0.2779202, 0, 0, 0, 1, 1,
-0.8959716, -1.120601, -2.123392, 0, 0, 0, 1, 1,
-0.895268, -0.3865862, -1.658714, 0, 0, 0, 1, 1,
-0.8935778, 0.9516302, -0.5069903, 0, 0, 0, 1, 1,
-0.8891494, 0.2841078, -1.442826, 0, 0, 0, 1, 1,
-0.8857422, -0.9658393, -3.253893, 1, 1, 1, 1, 1,
-0.8817385, -0.2897655, -2.209248, 1, 1, 1, 1, 1,
-0.8811157, 1.652895, -2.138225, 1, 1, 1, 1, 1,
-0.8740203, 0.4180368, -2.936304, 1, 1, 1, 1, 1,
-0.8684635, 0.130027, -0.3727025, 1, 1, 1, 1, 1,
-0.8652705, -0.5707207, -1.53203, 1, 1, 1, 1, 1,
-0.8645188, 0.01802924, -2.367037, 1, 1, 1, 1, 1,
-0.8586779, 0.01428269, -2.344357, 1, 1, 1, 1, 1,
-0.8555157, 1.936545, 0.7952129, 1, 1, 1, 1, 1,
-0.8547507, 0.5467286, -1.876323, 1, 1, 1, 1, 1,
-0.850922, -0.8533156, -2.490005, 1, 1, 1, 1, 1,
-0.8467371, 1.916044, -2.597625, 1, 1, 1, 1, 1,
-0.8462567, -0.9880865, -1.6293, 1, 1, 1, 1, 1,
-0.8384448, 0.5948308, -2.651374, 1, 1, 1, 1, 1,
-0.8360465, -0.215004, -1.906924, 1, 1, 1, 1, 1,
-0.8300084, 0.5373859, -1.137414, 0, 0, 1, 1, 1,
-0.8241564, -0.7430937, -2.546897, 1, 0, 0, 1, 1,
-0.8237646, 0.3956767, -2.645595, 1, 0, 0, 1, 1,
-0.8220904, -0.3637263, -2.672098, 1, 0, 0, 1, 1,
-0.8169342, -1.008756, -1.72374, 1, 0, 0, 1, 1,
-0.8128344, 1.6904, 0.07037746, 1, 0, 0, 1, 1,
-0.8114532, 0.0986806, -0.8866195, 0, 0, 0, 1, 1,
-0.8112378, -1.738711, -2.477942, 0, 0, 0, 1, 1,
-0.810984, -0.3607101, -1.069459, 0, 0, 0, 1, 1,
-0.8081827, 1.027579, -0.3435688, 0, 0, 0, 1, 1,
-0.807681, -0.3341328, -2.955255, 0, 0, 0, 1, 1,
-0.8075269, 1.155264, -0.306455, 0, 0, 0, 1, 1,
-0.8065215, 0.1644147, -0.2552614, 0, 0, 0, 1, 1,
-0.8010659, 1.568079, 1.248151, 1, 1, 1, 1, 1,
-0.8006185, 1.400474, -0.6562486, 1, 1, 1, 1, 1,
-0.8005103, -0.9035896, -0.7266589, 1, 1, 1, 1, 1,
-0.794701, -1.55349, -2.141667, 1, 1, 1, 1, 1,
-0.7933565, -0.3481286, -2.058388, 1, 1, 1, 1, 1,
-0.7918897, -0.5233268, -0.7537955, 1, 1, 1, 1, 1,
-0.7859063, -1.215028, -4.664639, 1, 1, 1, 1, 1,
-0.7684575, 0.8279012, -1.097406, 1, 1, 1, 1, 1,
-0.7646151, 0.2575978, 0.04974787, 1, 1, 1, 1, 1,
-0.761086, 1.220451, 0.05368846, 1, 1, 1, 1, 1,
-0.7563631, 1.698449, -2.428786, 1, 1, 1, 1, 1,
-0.7534194, -2.066862, -3.650373, 1, 1, 1, 1, 1,
-0.7517931, 0.5143165, 0.4567688, 1, 1, 1, 1, 1,
-0.7414892, -0.2837899, -0.8655405, 1, 1, 1, 1, 1,
-0.7277439, 0.6476146, -1.241504, 1, 1, 1, 1, 1,
-0.7264171, 0.6283599, 0.01275844, 0, 0, 1, 1, 1,
-0.7227719, 0.0786758, -1.112249, 1, 0, 0, 1, 1,
-0.7223729, 0.538513, -1.022649, 1, 0, 0, 1, 1,
-0.7212506, -0.6260411, -2.130265, 1, 0, 0, 1, 1,
-0.7210251, -0.5764008, -2.411329, 1, 0, 0, 1, 1,
-0.7184274, -0.3933237, 0.9728662, 1, 0, 0, 1, 1,
-0.7076359, 1.603281, 0.1191395, 0, 0, 0, 1, 1,
-0.7023863, -1.23533, -3.081903, 0, 0, 0, 1, 1,
-0.701777, -0.5069098, -1.26177, 0, 0, 0, 1, 1,
-0.6989297, -0.1821502, -2.485062, 0, 0, 0, 1, 1,
-0.6934178, -0.2785343, -0.3992772, 0, 0, 0, 1, 1,
-0.6915635, 0.8984617, 1.177276, 0, 0, 0, 1, 1,
-0.6837434, 0.6766962, 0.826595, 0, 0, 0, 1, 1,
-0.6807498, -0.3387197, -1.997681, 1, 1, 1, 1, 1,
-0.680657, 1.132122, -1.128451, 1, 1, 1, 1, 1,
-0.6754225, 0.2541734, -0.7277826, 1, 1, 1, 1, 1,
-0.6747422, -0.159331, -1.569905, 1, 1, 1, 1, 1,
-0.6737331, 0.4307316, -2.037071, 1, 1, 1, 1, 1,
-0.6722715, 1.899478, -0.9046155, 1, 1, 1, 1, 1,
-0.6705122, -0.8196661, -2.809491, 1, 1, 1, 1, 1,
-0.6681819, 0.2452475, -2.723244, 1, 1, 1, 1, 1,
-0.6675084, -0.3331997, -3.627388, 1, 1, 1, 1, 1,
-0.665522, 0.08575147, -2.488025, 1, 1, 1, 1, 1,
-0.6611518, -0.4904528, -1.20371, 1, 1, 1, 1, 1,
-0.6544091, -0.090666, -0.6211268, 1, 1, 1, 1, 1,
-0.6505272, -1.328792, -2.143529, 1, 1, 1, 1, 1,
-0.6488636, -0.2955346, -0.3017893, 1, 1, 1, 1, 1,
-0.6425573, -0.7924737, -2.742086, 1, 1, 1, 1, 1,
-0.6385, -0.6237499, -1.771736, 0, 0, 1, 1, 1,
-0.62499, 1.957543, -1.012889, 1, 0, 0, 1, 1,
-0.6212992, -0.6392347, -3.225945, 1, 0, 0, 1, 1,
-0.6208181, 0.5493881, -1.078922, 1, 0, 0, 1, 1,
-0.6187255, 0.1526622, -0.08335581, 1, 0, 0, 1, 1,
-0.6118862, -0.3077918, -2.812076, 1, 0, 0, 1, 1,
-0.6088752, -0.7852668, -1.850798, 0, 0, 0, 1, 1,
-0.6075185, 1.318735, -0.06420613, 0, 0, 0, 1, 1,
-0.606825, -0.1561079, -2.055402, 0, 0, 0, 1, 1,
-0.6067764, 0.1422324, 0.5979428, 0, 0, 0, 1, 1,
-0.6065148, -0.9454792, -2.930358, 0, 0, 0, 1, 1,
-0.6043583, 1.954895, -1.362349, 0, 0, 0, 1, 1,
-0.6029803, -1.510113, -3.391932, 0, 0, 0, 1, 1,
-0.6025029, 0.1717791, 0.548481, 1, 1, 1, 1, 1,
-0.5942615, 1.0927, 0.1408334, 1, 1, 1, 1, 1,
-0.5932079, -1.488132, -3.044691, 1, 1, 1, 1, 1,
-0.5907391, 0.2514873, -1.224705, 1, 1, 1, 1, 1,
-0.5823475, -0.08887686, -1.167099, 1, 1, 1, 1, 1,
-0.578986, -0.8688737, -2.100318, 1, 1, 1, 1, 1,
-0.5775682, 0.8426804, -2.372768, 1, 1, 1, 1, 1,
-0.5768006, 0.1491233, -2.610309, 1, 1, 1, 1, 1,
-0.5765817, 1.853839, -0.8786685, 1, 1, 1, 1, 1,
-0.575987, -0.3986167, -1.212924, 1, 1, 1, 1, 1,
-0.5753816, 0.1340144, 0.1921396, 1, 1, 1, 1, 1,
-0.5679449, 0.0009193025, -0.5118223, 1, 1, 1, 1, 1,
-0.5664802, 0.3673556, -0.8302151, 1, 1, 1, 1, 1,
-0.56434, -1.059404, -1.820757, 1, 1, 1, 1, 1,
-0.5630848, -0.7475337, -3.123641, 1, 1, 1, 1, 1,
-0.5620735, -2.351144, -1.95616, 0, 0, 1, 1, 1,
-0.555701, 1.068402, -0.07780742, 1, 0, 0, 1, 1,
-0.5528142, -0.6862852, -1.134472, 1, 0, 0, 1, 1,
-0.5504376, -0.916588, -3.652143, 1, 0, 0, 1, 1,
-0.5488838, -0.3057987, -1.729871, 1, 0, 0, 1, 1,
-0.5469933, 0.5729468, -0.01115945, 1, 0, 0, 1, 1,
-0.5456935, 2.056064, -1.713753, 0, 0, 0, 1, 1,
-0.5455828, 0.9409613, -1.323235, 0, 0, 0, 1, 1,
-0.5447935, -0.5587497, -2.85123, 0, 0, 0, 1, 1,
-0.5443339, -0.7195583, -2.133676, 0, 0, 0, 1, 1,
-0.5424024, -0.04214729, 0.03687362, 0, 0, 0, 1, 1,
-0.5396898, 0.9191113, -2.079861, 0, 0, 0, 1, 1,
-0.5391438, 0.006808537, -2.209106, 0, 0, 0, 1, 1,
-0.5367398, 1.785852, 0.1922778, 1, 1, 1, 1, 1,
-0.529023, 0.6965472, -1.520683, 1, 1, 1, 1, 1,
-0.528776, 0.05754982, -0.7344065, 1, 1, 1, 1, 1,
-0.5257666, -0.101764, -0.9537034, 1, 1, 1, 1, 1,
-0.5231976, -1.830893, -3.101577, 1, 1, 1, 1, 1,
-0.5155975, 0.2931628, -2.101393, 1, 1, 1, 1, 1,
-0.5111489, 2.370104, 0.5336245, 1, 1, 1, 1, 1,
-0.503077, 0.4818982, -0.7915755, 1, 1, 1, 1, 1,
-0.4998254, -0.2342803, -2.052382, 1, 1, 1, 1, 1,
-0.4977091, 0.5039738, -2.042007, 1, 1, 1, 1, 1,
-0.4964951, -0.2790171, -1.954172, 1, 1, 1, 1, 1,
-0.4944324, 0.825267, -2.287987, 1, 1, 1, 1, 1,
-0.4830204, -0.7212513, -1.444154, 1, 1, 1, 1, 1,
-0.4824786, 0.2491933, -1.834068, 1, 1, 1, 1, 1,
-0.481179, -1.088754, -3.669653, 1, 1, 1, 1, 1,
-0.4782162, -0.2956496, -2.255692, 0, 0, 1, 1, 1,
-0.4763467, 1.000499, 0.002983337, 1, 0, 0, 1, 1,
-0.4741144, -0.88385, -1.815796, 1, 0, 0, 1, 1,
-0.4713574, 0.5196802, -1.995685, 1, 0, 0, 1, 1,
-0.4677661, -0.08659902, -1.720606, 1, 0, 0, 1, 1,
-0.4658664, -1.447424, -2.442203, 1, 0, 0, 1, 1,
-0.4633893, 0.9931884, 0.4382372, 0, 0, 0, 1, 1,
-0.4633214, -1.27793, -2.649842, 0, 0, 0, 1, 1,
-0.4632524, 0.2077889, -0.6889676, 0, 0, 0, 1, 1,
-0.4603849, 0.3469912, 0.2065671, 0, 0, 0, 1, 1,
-0.4578128, -0.5670583, -1.128943, 0, 0, 0, 1, 1,
-0.4565476, -0.4976156, -2.667039, 0, 0, 0, 1, 1,
-0.4533321, 0.3026351, -1.597607, 0, 0, 0, 1, 1,
-0.4504054, -1.079739, -2.408333, 1, 1, 1, 1, 1,
-0.4494334, -0.6757903, -4.310923, 1, 1, 1, 1, 1,
-0.4463376, 1.479342, -0.3678297, 1, 1, 1, 1, 1,
-0.4462019, -1.095521, -1.046752, 1, 1, 1, 1, 1,
-0.4424058, 1.181839, 0.9745774, 1, 1, 1, 1, 1,
-0.4349373, 1.770202, -1.48958, 1, 1, 1, 1, 1,
-0.4324955, 1.416287, -0.546531, 1, 1, 1, 1, 1,
-0.4313285, -0.8169268, -2.530076, 1, 1, 1, 1, 1,
-0.4281882, 0.042787, -0.5977236, 1, 1, 1, 1, 1,
-0.4269247, -0.6029447, -1.869275, 1, 1, 1, 1, 1,
-0.4237106, 0.3978086, 0.461644, 1, 1, 1, 1, 1,
-0.4160244, -0.1111114, -2.411153, 1, 1, 1, 1, 1,
-0.4155649, 1.144461, -0.2737113, 1, 1, 1, 1, 1,
-0.410867, 0.7324102, -1.379011, 1, 1, 1, 1, 1,
-0.4080177, 0.3695125, -1.025918, 1, 1, 1, 1, 1,
-0.4064339, 0.3727091, -1.369839, 0, 0, 1, 1, 1,
-0.4038627, -1.181382, -4.615035, 1, 0, 0, 1, 1,
-0.4036025, -0.6555352, -2.938499, 1, 0, 0, 1, 1,
-0.4021985, -0.481269, -4.912694, 1, 0, 0, 1, 1,
-0.4010365, 0.7565778, -0.5534552, 1, 0, 0, 1, 1,
-0.3995927, -0.4289391, -0.3914984, 1, 0, 0, 1, 1,
-0.3994316, 0.9479355, 0.1978807, 0, 0, 0, 1, 1,
-0.3976263, -1.575705, -2.581955, 0, 0, 0, 1, 1,
-0.3975688, 0.4787648, -1.056465, 0, 0, 0, 1, 1,
-0.3923692, 0.8985004, -0.3352659, 0, 0, 0, 1, 1,
-0.3915354, 1.853201, -1.266143, 0, 0, 0, 1, 1,
-0.3872214, 0.6713244, -1.794616, 0, 0, 0, 1, 1,
-0.3869045, 0.9072555, -1.292559, 0, 0, 0, 1, 1,
-0.3829938, 0.721915, -0.2605655, 1, 1, 1, 1, 1,
-0.3783133, 0.2187498, -1.428273, 1, 1, 1, 1, 1,
-0.3770499, 0.7661569, 0.2487598, 1, 1, 1, 1, 1,
-0.3767401, -1.169707, -2.857789, 1, 1, 1, 1, 1,
-0.3759015, -1.353691, -2.734988, 1, 1, 1, 1, 1,
-0.3744024, -1.172141, -2.768891, 1, 1, 1, 1, 1,
-0.3734934, -0.1416619, -4.06384, 1, 1, 1, 1, 1,
-0.3710108, 0.7267255, -2.066952, 1, 1, 1, 1, 1,
-0.3688585, -0.09396798, -1.288284, 1, 1, 1, 1, 1,
-0.3654318, -0.3812253, -1.673906, 1, 1, 1, 1, 1,
-0.3641723, -1.115054, -3.825007, 1, 1, 1, 1, 1,
-0.3565083, 1.035572, 1.933327, 1, 1, 1, 1, 1,
-0.3519714, -0.5754176, -3.6702, 1, 1, 1, 1, 1,
-0.3435267, 0.8648331, 0.9817204, 1, 1, 1, 1, 1,
-0.342817, -0.3837477, -1.832317, 1, 1, 1, 1, 1,
-0.3421548, 1.457451, -1.63956, 0, 0, 1, 1, 1,
-0.3394928, -0.1916229, -2.527017, 1, 0, 0, 1, 1,
-0.3352742, 0.1326668, -2.221873, 1, 0, 0, 1, 1,
-0.3281817, -0.0631986, -0.1098869, 1, 0, 0, 1, 1,
-0.327962, -0.9836326, -1.37326, 1, 0, 0, 1, 1,
-0.3277344, 1.177395, 0.7349848, 1, 0, 0, 1, 1,
-0.3274477, -0.05820369, -3.335798, 0, 0, 0, 1, 1,
-0.3146947, -1.239216, -2.2099, 0, 0, 0, 1, 1,
-0.3103883, -0.6364812, -2.573318, 0, 0, 0, 1, 1,
-0.3091737, 1.789612, 0.485995, 0, 0, 0, 1, 1,
-0.308783, -0.7782683, -1.283782, 0, 0, 0, 1, 1,
-0.3085954, 0.3125654, -0.7691894, 0, 0, 0, 1, 1,
-0.3019514, -0.5545576, -3.345139, 0, 0, 0, 1, 1,
-0.2990164, -0.3708172, -3.1495, 1, 1, 1, 1, 1,
-0.297021, -1.528618, -3.043851, 1, 1, 1, 1, 1,
-0.295497, 0.6577536, -1.923679, 1, 1, 1, 1, 1,
-0.292145, -0.2193772, -1.909791, 1, 1, 1, 1, 1,
-0.2920145, 0.2833137, -2.366916, 1, 1, 1, 1, 1,
-0.2908622, -0.5170823, -2.691183, 1, 1, 1, 1, 1,
-0.2908556, 0.3248484, 1.611128, 1, 1, 1, 1, 1,
-0.2867491, -1.171568, -2.473228, 1, 1, 1, 1, 1,
-0.2844969, -0.4945755, -2.498911, 1, 1, 1, 1, 1,
-0.2844348, -0.8676175, -3.560428, 1, 1, 1, 1, 1,
-0.2806985, 0.6335617, -0.2564661, 1, 1, 1, 1, 1,
-0.2806808, -1.083957, -1.528541, 1, 1, 1, 1, 1,
-0.279975, 1.513491, -0.8685892, 1, 1, 1, 1, 1,
-0.27116, 0.2976745, -1.658285, 1, 1, 1, 1, 1,
-0.2688166, -0.7967001, -4.339276, 1, 1, 1, 1, 1,
-0.2647366, 1.914389, -0.3023857, 0, 0, 1, 1, 1,
-0.2634167, 0.02331019, -1.110963, 1, 0, 0, 1, 1,
-0.2600403, -0.09174934, -2.165484, 1, 0, 0, 1, 1,
-0.2593863, -0.2734822, -3.574921, 1, 0, 0, 1, 1,
-0.2591714, -0.2990932, -2.181842, 1, 0, 0, 1, 1,
-0.2581979, 1.729599, -1.196976, 1, 0, 0, 1, 1,
-0.2517658, -0.3543895, -1.766721, 0, 0, 0, 1, 1,
-0.2511576, 2.562496, -0.8019304, 0, 0, 0, 1, 1,
-0.2509245, 1.067093, 1.207895, 0, 0, 0, 1, 1,
-0.2476775, -0.3757554, -2.092602, 0, 0, 0, 1, 1,
-0.2470848, 0.3854729, -0.514174, 0, 0, 0, 1, 1,
-0.2451424, 0.4017809, -2.435548, 0, 0, 0, 1, 1,
-0.2432651, -0.5860869, -2.197472, 0, 0, 0, 1, 1,
-0.2426638, 1.917866, -0.3220365, 1, 1, 1, 1, 1,
-0.2349167, 1.140458, 0.3674577, 1, 1, 1, 1, 1,
-0.2278166, -1.670485, -1.302362, 1, 1, 1, 1, 1,
-0.2258838, -0.2674919, -3.945475, 1, 1, 1, 1, 1,
-0.2201887, 3.754384, 0.4943638, 1, 1, 1, 1, 1,
-0.2195078, 1.320446, -0.3368948, 1, 1, 1, 1, 1,
-0.2142779, 1.094766, 1.540199, 1, 1, 1, 1, 1,
-0.2139724, -0.1084234, -2.564345, 1, 1, 1, 1, 1,
-0.2119467, 0.08531151, 0.01263735, 1, 1, 1, 1, 1,
-0.2083527, 1.640625, -1.084304, 1, 1, 1, 1, 1,
-0.2058454, 0.2368323, 0.5000308, 1, 1, 1, 1, 1,
-0.2031664, -0.2075982, -2.939643, 1, 1, 1, 1, 1,
-0.201995, 0.4680651, -1.115992, 1, 1, 1, 1, 1,
-0.2009136, -0.3894653, -2.13986, 1, 1, 1, 1, 1,
-0.198861, 0.09579866, -0.63072, 1, 1, 1, 1, 1,
-0.1975118, 0.9615619, -1.996712, 0, 0, 1, 1, 1,
-0.1963896, -0.551389, -1.439896, 1, 0, 0, 1, 1,
-0.1928478, -0.3973332, -3.227469, 1, 0, 0, 1, 1,
-0.1928073, 0.5129651, -1.139507, 1, 0, 0, 1, 1,
-0.1887088, -1.164279, -1.722801, 1, 0, 0, 1, 1,
-0.1887013, -1.323402, -3.490167, 1, 0, 0, 1, 1,
-0.1842416, 0.09751017, -2.101009, 0, 0, 0, 1, 1,
-0.1817839, 0.07851645, 0.3086085, 0, 0, 0, 1, 1,
-0.1809798, 0.0228234, 0.1178348, 0, 0, 0, 1, 1,
-0.1757505, 0.02345372, -1.233263, 0, 0, 0, 1, 1,
-0.1705515, -0.3057906, -2.852849, 0, 0, 0, 1, 1,
-0.1700291, 0.08092358, -0.1326058, 0, 0, 0, 1, 1,
-0.1674228, 0.7905397, -1.368286, 0, 0, 0, 1, 1,
-0.1671673, 0.328237, -0.1580711, 1, 1, 1, 1, 1,
-0.1642209, 1.110576, -0.197009, 1, 1, 1, 1, 1,
-0.161791, -2.424869, -2.694195, 1, 1, 1, 1, 1,
-0.1580031, 0.7689881, 0.183355, 1, 1, 1, 1, 1,
-0.1575514, -0.2329954, -2.726009, 1, 1, 1, 1, 1,
-0.1556254, -0.9267382, -3.277706, 1, 1, 1, 1, 1,
-0.1522837, -0.2813255, -2.041643, 1, 1, 1, 1, 1,
-0.1518672, -0.2516429, -2.215386, 1, 1, 1, 1, 1,
-0.1517916, -0.5882798, -1.830523, 1, 1, 1, 1, 1,
-0.1492711, 2.192554, -1.003286, 1, 1, 1, 1, 1,
-0.1492524, -2.687473, -4.340124, 1, 1, 1, 1, 1,
-0.1434408, -0.3058179, -3.455514, 1, 1, 1, 1, 1,
-0.1393739, 0.8361058, 0.4880231, 1, 1, 1, 1, 1,
-0.1375058, 1.357382, -1.001496, 1, 1, 1, 1, 1,
-0.1357485, -0.874925, -3.977709, 1, 1, 1, 1, 1,
-0.1353329, -0.4665977, -1.659645, 0, 0, 1, 1, 1,
-0.1348943, 1.234569, -1.610576, 1, 0, 0, 1, 1,
-0.1305966, 0.5021395, 0.4677327, 1, 0, 0, 1, 1,
-0.1288411, -1.07203, -2.639153, 1, 0, 0, 1, 1,
-0.1247802, -0.686366, -2.434388, 1, 0, 0, 1, 1,
-0.1232469, -0.3245937, -2.198565, 1, 0, 0, 1, 1,
-0.119275, 0.9841946, -0.4162, 0, 0, 0, 1, 1,
-0.1140234, 0.2629562, -0.1696193, 0, 0, 0, 1, 1,
-0.1115379, -0.3295183, -3.721255, 0, 0, 0, 1, 1,
-0.106896, 1.881536, -0.7045549, 0, 0, 0, 1, 1,
-0.09827257, -0.3973345, -4.108767, 0, 0, 0, 1, 1,
-0.09289216, -0.4297266, -0.8246433, 0, 0, 0, 1, 1,
-0.08786648, -0.3664606, -2.456835, 0, 0, 0, 1, 1,
-0.08440686, 0.2408963, -0.2765819, 1, 1, 1, 1, 1,
-0.08390115, 0.3637289, 0.9869064, 1, 1, 1, 1, 1,
-0.08330021, -0.6506531, -3.443829, 1, 1, 1, 1, 1,
-0.08313717, 0.6059059, -1.048826, 1, 1, 1, 1, 1,
-0.0822999, 0.6155706, -0.3739892, 1, 1, 1, 1, 1,
-0.08196405, 1.015659, -0.5866786, 1, 1, 1, 1, 1,
-0.08155215, 1.084796, -0.702207, 1, 1, 1, 1, 1,
-0.07991668, 1.496591, -0.1772156, 1, 1, 1, 1, 1,
-0.0794449, -0.9351759, -3.892889, 1, 1, 1, 1, 1,
-0.07875782, -0.2384572, -5.071955, 1, 1, 1, 1, 1,
-0.07762817, -0.1311088, -2.291839, 1, 1, 1, 1, 1,
-0.07685348, -1.538015, -3.285133, 1, 1, 1, 1, 1,
-0.07362213, -1.419794, -3.522099, 1, 1, 1, 1, 1,
-0.07154973, 1.197788, 2.09514, 1, 1, 1, 1, 1,
-0.07148151, 0.5046536, 0.5989563, 1, 1, 1, 1, 1,
-0.0714053, -1.773537, -4.080658, 0, 0, 1, 1, 1,
-0.07113932, -0.5785292, -3.476825, 1, 0, 0, 1, 1,
-0.06807223, -0.882015, -4.279071, 1, 0, 0, 1, 1,
-0.06726386, 1.292596, 1.406128, 1, 0, 0, 1, 1,
-0.06503167, 0.4315167, 1.132959, 1, 0, 0, 1, 1,
-0.0633176, -1.05673, -4.185626, 1, 0, 0, 1, 1,
-0.06212082, 0.2533811, -0.3549743, 0, 0, 0, 1, 1,
-0.06144809, -0.5643534, -1.209322, 0, 0, 0, 1, 1,
-0.06004607, 0.06011127, -1.11803, 0, 0, 0, 1, 1,
-0.05862054, -0.433261, -4.228171, 0, 0, 0, 1, 1,
-0.05795963, -0.4657401, -3.530654, 0, 0, 0, 1, 1,
-0.05744899, 0.290337, 1.027125, 0, 0, 0, 1, 1,
-0.05329843, -1.947967, -2.498333, 0, 0, 0, 1, 1,
-0.04931565, -1.615528, -3.314085, 1, 1, 1, 1, 1,
-0.04590583, 0.5708546, -0.4518262, 1, 1, 1, 1, 1,
-0.04340451, -0.03263184, -2.510669, 1, 1, 1, 1, 1,
-0.04249407, -0.1928175, -0.8026875, 1, 1, 1, 1, 1,
-0.03632101, 0.8107611, -0.5836728, 1, 1, 1, 1, 1,
-0.03471193, 1.003646, -1.618545, 1, 1, 1, 1, 1,
-0.02829118, -1.002069, -2.347974, 1, 1, 1, 1, 1,
-0.02338282, -1.155148, -3.058901, 1, 1, 1, 1, 1,
-0.02189891, -0.2298055, -1.780061, 1, 1, 1, 1, 1,
-0.01948347, -0.622137, -3.497218, 1, 1, 1, 1, 1,
-0.01887756, 1.331222, 1.262351, 1, 1, 1, 1, 1,
-0.01560039, 0.5277706, -0.935093, 1, 1, 1, 1, 1,
-0.01175998, -0.9297951, -3.314288, 1, 1, 1, 1, 1,
-0.01148133, -1.522947, -1.478495, 1, 1, 1, 1, 1,
-0.01003273, -0.3482651, -4.363146, 1, 1, 1, 1, 1,
-0.008977976, 1.312534, -1.221467, 0, 0, 1, 1, 1,
-0.00237802, -0.1415194, -1.399189, 1, 0, 0, 1, 1,
-0.001633713, -0.6427768, -3.632075, 1, 0, 0, 1, 1,
-0.0009862508, 2.358297, 0.3651605, 1, 0, 0, 1, 1,
-0.0007367497, 1.858156, 0.910358, 1, 0, 0, 1, 1,
0.001187795, -0.04361436, 5.238469, 1, 0, 0, 1, 1,
0.002078548, -0.9054728, 3.863444, 0, 0, 0, 1, 1,
0.002556423, -0.1722348, 4.557765, 0, 0, 0, 1, 1,
0.003085618, -0.08874308, 3.399158, 0, 0, 0, 1, 1,
0.004571862, -2.397357, 2.67181, 0, 0, 0, 1, 1,
0.00486679, 0.298595, -0.3174063, 0, 0, 0, 1, 1,
0.00784061, -0.279516, 3.859292, 0, 0, 0, 1, 1,
0.01346855, 2.090064, -0.1868559, 0, 0, 0, 1, 1,
0.01983711, -0.536302, 3.516587, 1, 1, 1, 1, 1,
0.02036322, -1.633361, 3.669072, 1, 1, 1, 1, 1,
0.02203692, 1.693375, -0.9938635, 1, 1, 1, 1, 1,
0.02312264, 1.153616, -1.436248, 1, 1, 1, 1, 1,
0.02578244, -0.9193214, 2.578715, 1, 1, 1, 1, 1,
0.02642339, -0.340055, 2.617173, 1, 1, 1, 1, 1,
0.02932929, -0.6547394, 1.935363, 1, 1, 1, 1, 1,
0.03143166, -0.5519722, 2.215321, 1, 1, 1, 1, 1,
0.04118499, 0.3460686, 0.1092379, 1, 1, 1, 1, 1,
0.04133029, -0.04454647, 1.413544, 1, 1, 1, 1, 1,
0.04514615, -1.705022, 1.747724, 1, 1, 1, 1, 1,
0.04593136, 0.2721155, -1.623114, 1, 1, 1, 1, 1,
0.04861198, 1.416246, -1.177826, 1, 1, 1, 1, 1,
0.04928698, 1.91133, 0.1600308, 1, 1, 1, 1, 1,
0.05047658, -0.1617977, 2.823184, 1, 1, 1, 1, 1,
0.05450728, 0.0719222, 0.158948, 0, 0, 1, 1, 1,
0.05787584, -0.1547402, 2.829093, 1, 0, 0, 1, 1,
0.07131618, -0.2684068, 2.202035, 1, 0, 0, 1, 1,
0.07226832, -0.3304691, 3.732633, 1, 0, 0, 1, 1,
0.07426457, 1.726428, 0.7558404, 1, 0, 0, 1, 1,
0.08217517, 2.247702, 0.5646324, 1, 0, 0, 1, 1,
0.08585276, -1.443943, 4.178094, 0, 0, 0, 1, 1,
0.08866499, 0.9820164, 1.175641, 0, 0, 0, 1, 1,
0.09025264, -0.215691, 1.674551, 0, 0, 0, 1, 1,
0.09272378, -0.7017927, 3.950178, 0, 0, 0, 1, 1,
0.09456442, -0.6102749, 1.384582, 0, 0, 0, 1, 1,
0.09647972, 0.7101136, -0.03272225, 0, 0, 0, 1, 1,
0.09839784, 0.5283983, 1.550658, 0, 0, 0, 1, 1,
0.112776, 0.7468383, -1.178847, 1, 1, 1, 1, 1,
0.11381, 0.2296094, -0.08350462, 1, 1, 1, 1, 1,
0.1143962, 1.480989, -0.79365, 1, 1, 1, 1, 1,
0.1146751, -0.0354796, 2.018207, 1, 1, 1, 1, 1,
0.1167152, 0.09747646, 0.7530364, 1, 1, 1, 1, 1,
0.1183698, -0.3797463, 4.016246, 1, 1, 1, 1, 1,
0.1183836, -1.324626, 1.806242, 1, 1, 1, 1, 1,
0.1233519, -0.3776363, 1.841007, 1, 1, 1, 1, 1,
0.1277213, 1.055046, -0.2148944, 1, 1, 1, 1, 1,
0.1280839, -1.011152, 2.895817, 1, 1, 1, 1, 1,
0.1317478, 1.900812, 0.1328341, 1, 1, 1, 1, 1,
0.1352653, -0.4957802, 2.630352, 1, 1, 1, 1, 1,
0.1432377, -0.1413593, 1.83924, 1, 1, 1, 1, 1,
0.1478892, 0.8703235, 0.7832584, 1, 1, 1, 1, 1,
0.1553382, 1.108472, -0.3100774, 1, 1, 1, 1, 1,
0.1618924, 0.7252786, -1.498295, 0, 0, 1, 1, 1,
0.1729291, 1.132217, -0.4224352, 1, 0, 0, 1, 1,
0.1741072, 1.166401, 1.089496, 1, 0, 0, 1, 1,
0.1747068, 1.275007, -0.2047157, 1, 0, 0, 1, 1,
0.1760848, -1.419808, 1.370778, 1, 0, 0, 1, 1,
0.177983, 0.2675404, 0.4656598, 1, 0, 0, 1, 1,
0.1850898, -0.493138, 2.202522, 0, 0, 0, 1, 1,
0.1853527, -0.8937724, 3.141556, 0, 0, 0, 1, 1,
0.1892993, -0.4082378, 2.258884, 0, 0, 0, 1, 1,
0.1901251, 0.3775567, 0.7009637, 0, 0, 0, 1, 1,
0.1919047, -1.775872, 3.119128, 0, 0, 0, 1, 1,
0.1931941, 0.1847587, 0.8373905, 0, 0, 0, 1, 1,
0.1936536, -0.4703471, 2.453963, 0, 0, 0, 1, 1,
0.195204, 2.012242, 0.2853021, 1, 1, 1, 1, 1,
0.2034783, -1.402454, 4.172398, 1, 1, 1, 1, 1,
0.2098724, -0.2729734, 1.144904, 1, 1, 1, 1, 1,
0.2114489, -1.769018, 2.711089, 1, 1, 1, 1, 1,
0.2166969, -0.8107103, 2.161251, 1, 1, 1, 1, 1,
0.2192639, -1.312099, 2.43214, 1, 1, 1, 1, 1,
0.2204766, 0.6213448, 0.6538022, 1, 1, 1, 1, 1,
0.2212489, 0.8820722, 0.8936166, 1, 1, 1, 1, 1,
0.2212765, 0.7907377, -0.06995885, 1, 1, 1, 1, 1,
0.2226895, 0.845562, 1.589402, 1, 1, 1, 1, 1,
0.2238857, -0.4976036, 2.17014, 1, 1, 1, 1, 1,
0.2259831, -2.77451, 4.965744, 1, 1, 1, 1, 1,
0.2270657, 0.01329913, 1.591115, 1, 1, 1, 1, 1,
0.2361808, -0.470441, 2.201243, 1, 1, 1, 1, 1,
0.237676, 0.9033297, 1.284364, 1, 1, 1, 1, 1,
0.2406513, 0.3827157, -0.02088138, 0, 0, 1, 1, 1,
0.2444519, -2.083781, 3.011419, 1, 0, 0, 1, 1,
0.2445133, 1.634175, 0.5953572, 1, 0, 0, 1, 1,
0.2511786, 0.6202689, -0.3324526, 1, 0, 0, 1, 1,
0.2511989, 0.2752391, 1.45129, 1, 0, 0, 1, 1,
0.2539255, 0.6897035, 1.257796, 1, 0, 0, 1, 1,
0.2539974, 0.7361093, -0.9393507, 0, 0, 0, 1, 1,
0.2543244, 0.7646792, -0.7489339, 0, 0, 0, 1, 1,
0.2552395, 0.6763682, -0.09834716, 0, 0, 0, 1, 1,
0.2555608, -0.07836208, 0.8322856, 0, 0, 0, 1, 1,
0.2603181, 0.6265856, 0.6069545, 0, 0, 0, 1, 1,
0.2605144, 0.7938333, 0.5774384, 0, 0, 0, 1, 1,
0.2618808, -0.4892483, 3.369348, 0, 0, 0, 1, 1,
0.2665708, -0.5431825, 2.754475, 1, 1, 1, 1, 1,
0.2675184, 0.05781134, 0.3759427, 1, 1, 1, 1, 1,
0.2676986, -0.8549878, 3.771109, 1, 1, 1, 1, 1,
0.2692392, 0.4604065, -0.5745247, 1, 1, 1, 1, 1,
0.2711702, 1.046256, 0.5614764, 1, 1, 1, 1, 1,
0.2728833, 0.1983234, 1.078403, 1, 1, 1, 1, 1,
0.2738216, 0.3683584, 0.1839843, 1, 1, 1, 1, 1,
0.2744222, -0.3126921, 3.1941, 1, 1, 1, 1, 1,
0.2816655, -0.5426461, 1.60826, 1, 1, 1, 1, 1,
0.281752, 0.7196063, 1.393872, 1, 1, 1, 1, 1,
0.2839667, 3.152139, 0.2343597, 1, 1, 1, 1, 1,
0.2844429, -0.1834542, 1.636533, 1, 1, 1, 1, 1,
0.2866269, -0.82664, 2.597388, 1, 1, 1, 1, 1,
0.2867347, 1.456463, -1.016569, 1, 1, 1, 1, 1,
0.2911118, -0.09187179, 2.348886, 1, 1, 1, 1, 1,
0.2956166, 0.5094369, 0.7503411, 0, 0, 1, 1, 1,
0.2960464, 0.3470075, 1.264181, 1, 0, 0, 1, 1,
0.2970862, 1.395373, 0.5496191, 1, 0, 0, 1, 1,
0.2999678, 0.2920236, 0.4756112, 1, 0, 0, 1, 1,
0.3058113, -0.6582688, 2.829277, 1, 0, 0, 1, 1,
0.3064258, -1.638799, 4.327217, 1, 0, 0, 1, 1,
0.3086564, -0.3744352, 2.663845, 0, 0, 0, 1, 1,
0.3129841, -0.8388486, 1.683356, 0, 0, 0, 1, 1,
0.3143378, 0.7391009, 0.8956212, 0, 0, 0, 1, 1,
0.3157234, -0.1606914, 1.290672, 0, 0, 0, 1, 1,
0.3168829, 0.1758921, 1.53403, 0, 0, 0, 1, 1,
0.3169799, -0.2671269, 2.379197, 0, 0, 0, 1, 1,
0.3185302, -1.824313, 1.905229, 0, 0, 0, 1, 1,
0.3248369, -0.8404756, 1.674421, 1, 1, 1, 1, 1,
0.3269614, 0.1117541, 2.094252, 1, 1, 1, 1, 1,
0.3334602, -0.5239798, 3.486614, 1, 1, 1, 1, 1,
0.3352378, 0.7857593, 0.519291, 1, 1, 1, 1, 1,
0.3367338, -0.4198458, 3.196634, 1, 1, 1, 1, 1,
0.3400376, 0.8614279, 1.93935, 1, 1, 1, 1, 1,
0.3440314, 0.7591349, 0.2196788, 1, 1, 1, 1, 1,
0.3476929, -0.4327482, 2.651579, 1, 1, 1, 1, 1,
0.3507234, 1.206205, 1.121514, 1, 1, 1, 1, 1,
0.3507728, 1.523924, 0.3793023, 1, 1, 1, 1, 1,
0.3553525, 0.3695275, -0.4904312, 1, 1, 1, 1, 1,
0.3563353, 0.520843, -0.05829107, 1, 1, 1, 1, 1,
0.3614457, 1.182042, -0.5915282, 1, 1, 1, 1, 1,
0.3669529, -0.4791449, 3.958158, 1, 1, 1, 1, 1,
0.3699121, 0.4749558, 1.60348, 1, 1, 1, 1, 1,
0.3791491, 0.9692835, 0.5086913, 0, 0, 1, 1, 1,
0.3823608, 0.1040583, 2.003564, 1, 0, 0, 1, 1,
0.384362, 2.239079, 2.108883, 1, 0, 0, 1, 1,
0.3855163, -0.6420165, 0.6806125, 1, 0, 0, 1, 1,
0.3896309, 1.007857, -0.8485821, 1, 0, 0, 1, 1,
0.3913932, 0.6949385, 2.518553, 1, 0, 0, 1, 1,
0.392868, 0.7883556, 1.453785, 0, 0, 0, 1, 1,
0.3971631, 1.427751, 0.5627831, 0, 0, 0, 1, 1,
0.4037219, 1.995657, -0.8588145, 0, 0, 0, 1, 1,
0.4041506, 1.501802, 0.7085276, 0, 0, 0, 1, 1,
0.4053938, 1.490131, 0.1804686, 0, 0, 0, 1, 1,
0.4060347, -0.29705, 1.099637, 0, 0, 0, 1, 1,
0.4085291, -1.478978, 2.369157, 0, 0, 0, 1, 1,
0.4149596, -1.224839, 4.485078, 1, 1, 1, 1, 1,
0.4163672, 0.5561352, 0.6304556, 1, 1, 1, 1, 1,
0.4184481, 0.6090192, 1.370269, 1, 1, 1, 1, 1,
0.4196815, 1.27156, 0.2374487, 1, 1, 1, 1, 1,
0.4208438, 0.3643202, 0.9395129, 1, 1, 1, 1, 1,
0.437028, -1.568127, 2.215218, 1, 1, 1, 1, 1,
0.4386911, -1.82815, 3.118999, 1, 1, 1, 1, 1,
0.4448567, 0.5094122, 0.5475591, 1, 1, 1, 1, 1,
0.4508311, -0.04703727, 1.163503, 1, 1, 1, 1, 1,
0.4520396, -0.5065485, 2.631924, 1, 1, 1, 1, 1,
0.4528875, 1.493901, 1.459506, 1, 1, 1, 1, 1,
0.4537928, 0.9938115, 0.4613717, 1, 1, 1, 1, 1,
0.45856, -0.3914098, 3.543289, 1, 1, 1, 1, 1,
0.4607069, 0.1557417, 0.04622565, 1, 1, 1, 1, 1,
0.4615565, 0.993241, 0.5151169, 1, 1, 1, 1, 1,
0.4666585, 0.1026881, 1.321719, 0, 0, 1, 1, 1,
0.4681262, -0.8609517, 1.221022, 1, 0, 0, 1, 1,
0.4683684, 1.039929, 0.4353946, 1, 0, 0, 1, 1,
0.4685737, 2.478648, -0.6196272, 1, 0, 0, 1, 1,
0.4855549, 0.3266194, 1.408947, 1, 0, 0, 1, 1,
0.4870099, 0.9411912, 0.2091388, 1, 0, 0, 1, 1,
0.4870284, -0.2190459, 2.330811, 0, 0, 0, 1, 1,
0.4881333, 0.4234492, 1.085631, 0, 0, 0, 1, 1,
0.4928172, 0.6880151, -0.5719991, 0, 0, 0, 1, 1,
0.4934263, 1.289461, -0.5366777, 0, 0, 0, 1, 1,
0.4950499, 0.6016509, 0.7309763, 0, 0, 0, 1, 1,
0.4974498, 0.7186402, 0.9632725, 0, 0, 0, 1, 1,
0.4999879, -0.5870238, 2.996401, 0, 0, 0, 1, 1,
0.5027326, 0.6796872, 1.833012, 1, 1, 1, 1, 1,
0.5042806, -0.5693385, 3.549548, 1, 1, 1, 1, 1,
0.5072521, 0.5057502, 0.0318128, 1, 1, 1, 1, 1,
0.5091917, -0.2449407, 3.427879, 1, 1, 1, 1, 1,
0.5147859, 0.616366, -0.2035503, 1, 1, 1, 1, 1,
0.5148085, 0.2382094, 3.187276, 1, 1, 1, 1, 1,
0.5154825, 1.257733, -1.121392, 1, 1, 1, 1, 1,
0.5159857, -0.5337556, 2.056281, 1, 1, 1, 1, 1,
0.5215307, 1.179261, 0.6330839, 1, 1, 1, 1, 1,
0.5271589, -1.002229, 2.42752, 1, 1, 1, 1, 1,
0.5272251, -1.411478, 3.339147, 1, 1, 1, 1, 1,
0.5277389, 0.009170002, 2.328354, 1, 1, 1, 1, 1,
0.5300061, 0.9212977, -0.9303076, 1, 1, 1, 1, 1,
0.5332441, -0.2182369, 1.820049, 1, 1, 1, 1, 1,
0.5337486, -0.3413877, 1.013621, 1, 1, 1, 1, 1,
0.5356773, -0.1829017, 4.609635, 0, 0, 1, 1, 1,
0.5363857, -0.8284907, 3.899778, 1, 0, 0, 1, 1,
0.537011, -1.919113, 2.562949, 1, 0, 0, 1, 1,
0.5405716, -0.5482068, 2.191935, 1, 0, 0, 1, 1,
0.544955, -1.127885, 3.788262, 1, 0, 0, 1, 1,
0.5498177, 1.369452, 0.0370753, 1, 0, 0, 1, 1,
0.5586426, 1.620182, -0.4777737, 0, 0, 0, 1, 1,
0.5675443, -0.08000566, 2.467445, 0, 0, 0, 1, 1,
0.5677011, -0.3696843, 2.63991, 0, 0, 0, 1, 1,
0.5820702, 0.1568935, 4.178925, 0, 0, 0, 1, 1,
0.5881523, -0.6792291, 1.185829, 0, 0, 0, 1, 1,
0.5896942, 0.03871584, 2.276017, 0, 0, 0, 1, 1,
0.5917878, -0.7533752, 1.768358, 0, 0, 0, 1, 1,
0.5940903, -0.3504834, 0.5364971, 1, 1, 1, 1, 1,
0.5941988, 0.8334193, 1.326298, 1, 1, 1, 1, 1,
0.5959232, -1.993411, 2.536548, 1, 1, 1, 1, 1,
0.5972494, 0.7364872, 1.583587, 1, 1, 1, 1, 1,
0.599696, 1.101753, 0.3156723, 1, 1, 1, 1, 1,
0.6009418, -1.014531, 3.770682, 1, 1, 1, 1, 1,
0.6011012, -1.315292, 1.437001, 1, 1, 1, 1, 1,
0.6024294, -1.113454, 3.878339, 1, 1, 1, 1, 1,
0.6092265, -0.517197, 2.530904, 1, 1, 1, 1, 1,
0.611204, 0.0006826528, 3.512264, 1, 1, 1, 1, 1,
0.6124257, 0.4311564, 0.9685261, 1, 1, 1, 1, 1,
0.6133114, -0.595154, 2.133591, 1, 1, 1, 1, 1,
0.6161886, 0.2037459, 0.7097389, 1, 1, 1, 1, 1,
0.6170654, 1.102194, -0.8963847, 1, 1, 1, 1, 1,
0.6181784, -1.146069, 2.581193, 1, 1, 1, 1, 1,
0.618246, 0.406177, 1.459631, 0, 0, 1, 1, 1,
0.6236129, 0.7738826, 1.738597, 1, 0, 0, 1, 1,
0.623794, 0.7059286, -0.85021, 1, 0, 0, 1, 1,
0.6249254, 0.08520507, 1.841864, 1, 0, 0, 1, 1,
0.6250304, 0.7759965, 1.268133, 1, 0, 0, 1, 1,
0.6288964, 1.428617, 0.6530873, 1, 0, 0, 1, 1,
0.6314674, 0.04852378, 0.4550666, 0, 0, 0, 1, 1,
0.6324435, -0.4478966, 2.298928, 0, 0, 0, 1, 1,
0.6333961, 0.1297386, 1.644291, 0, 0, 0, 1, 1,
0.6346577, 0.7811707, 1.389443, 0, 0, 0, 1, 1,
0.6364019, 0.3053589, 0.5106611, 0, 0, 0, 1, 1,
0.6415144, 0.9822726, 0.211232, 0, 0, 0, 1, 1,
0.6453391, 0.1010657, 1.333211, 0, 0, 0, 1, 1,
0.6476339, -0.08767015, 3.049548, 1, 1, 1, 1, 1,
0.6478217, -1.615274, 2.031635, 1, 1, 1, 1, 1,
0.6478795, 0.9222372, -0.7382665, 1, 1, 1, 1, 1,
0.6558499, -1.184656, 0.9610737, 1, 1, 1, 1, 1,
0.656908, 0.4453479, 0.268064, 1, 1, 1, 1, 1,
0.6583576, 1.139976, 0.1831273, 1, 1, 1, 1, 1,
0.6911889, 1.46243, -0.3055406, 1, 1, 1, 1, 1,
0.691415, 0.04411876, 1.528889, 1, 1, 1, 1, 1,
0.6981428, -1.54486, 3.116894, 1, 1, 1, 1, 1,
0.6997576, -0.8747692, 2.563079, 1, 1, 1, 1, 1,
0.7010776, 1.421502, 1.530251, 1, 1, 1, 1, 1,
0.708901, -0.8562227, 1.861291, 1, 1, 1, 1, 1,
0.7192165, 1.128257, -0.2052007, 1, 1, 1, 1, 1,
0.7277665, -0.5592787, 2.397096, 1, 1, 1, 1, 1,
0.7288807, 0.8062302, 1.046439, 1, 1, 1, 1, 1,
0.7299168, -0.7216016, -0.04632028, 0, 0, 1, 1, 1,
0.7301884, 0.1790311, 0.8337935, 1, 0, 0, 1, 1,
0.7315039, 1.414917, 0.1470542, 1, 0, 0, 1, 1,
0.7316384, 1.082869, 0.157314, 1, 0, 0, 1, 1,
0.7322642, -0.5242591, 0.5235066, 1, 0, 0, 1, 1,
0.7355819, 0.7621841, -1.006495, 1, 0, 0, 1, 1,
0.7367775, 0.3914712, 1.328595, 0, 0, 0, 1, 1,
0.7400291, 0.6614771, 1.575239, 0, 0, 0, 1, 1,
0.7400905, -0.713877, 0.401296, 0, 0, 0, 1, 1,
0.7436862, -1.187322, 3.609209, 0, 0, 0, 1, 1,
0.7438633, -0.02730667, 3.145331, 0, 0, 0, 1, 1,
0.7465159, -1.247059, 2.405575, 0, 0, 0, 1, 1,
0.7508106, 0.1648979, 1.664555, 0, 0, 0, 1, 1,
0.7513489, 0.4991371, 0.6267572, 1, 1, 1, 1, 1,
0.7534658, 0.1529525, 0.8044583, 1, 1, 1, 1, 1,
0.761906, -0.1088116, 2.227913, 1, 1, 1, 1, 1,
0.7649875, -0.3669142, 2.435705, 1, 1, 1, 1, 1,
0.7658083, 1.126507, 0.5233504, 1, 1, 1, 1, 1,
0.7804315, 1.283879, 1.100399, 1, 1, 1, 1, 1,
0.7816162, 0.07716554, 0.3339356, 1, 1, 1, 1, 1,
0.7845654, 0.03302799, 2.158254, 1, 1, 1, 1, 1,
0.7894763, -1.490671, 3.251395, 1, 1, 1, 1, 1,
0.804111, -0.5187591, 3.772897, 1, 1, 1, 1, 1,
0.8081095, 0.1430796, 1.403991, 1, 1, 1, 1, 1,
0.8150506, 0.2407258, 0.03139928, 1, 1, 1, 1, 1,
0.8188005, -0.5448065, 0.9181311, 1, 1, 1, 1, 1,
0.8252687, -0.1439547, 0.4393001, 1, 1, 1, 1, 1,
0.8264908, 0.05446251, 2.089756, 1, 1, 1, 1, 1,
0.8272119, 1.065641, -0.5634561, 0, 0, 1, 1, 1,
0.8286833, 0.9709735, -0.7957605, 1, 0, 0, 1, 1,
0.8372635, 0.2474185, 1.684394, 1, 0, 0, 1, 1,
0.8413468, 2.777136, 0.5451757, 1, 0, 0, 1, 1,
0.8422526, -0.005439301, 1.995395, 1, 0, 0, 1, 1,
0.8422896, 0.585234, 1.664228, 1, 0, 0, 1, 1,
0.8518109, -2.579156, 3.661961, 0, 0, 0, 1, 1,
0.8527848, -1.955541, 0.9519839, 0, 0, 0, 1, 1,
0.8532714, -0.8518823, 3.96455, 0, 0, 0, 1, 1,
0.8580765, -2.175715, 3.192704, 0, 0, 0, 1, 1,
0.8608915, 0.7977701, 0.3591871, 0, 0, 0, 1, 1,
0.8614989, -1.639263, 2.160414, 0, 0, 0, 1, 1,
0.8629331, -0.4304348, 3.466335, 0, 0, 0, 1, 1,
0.8632051, 0.07887001, 1.196051, 1, 1, 1, 1, 1,
0.8657564, 0.9372241, -0.04044157, 1, 1, 1, 1, 1,
0.8737559, 0.01103674, 0.7487315, 1, 1, 1, 1, 1,
0.8745059, -0.2653089, 1.350862, 1, 1, 1, 1, 1,
0.8862779, -0.3674935, 1.025394, 1, 1, 1, 1, 1,
0.8874533, -1.039782, 2.540383, 1, 1, 1, 1, 1,
0.8886737, -1.287331, 2.267426, 1, 1, 1, 1, 1,
0.8938872, -0.7295913, 1.690534, 1, 1, 1, 1, 1,
0.8945031, 0.8869253, 0.8586366, 1, 1, 1, 1, 1,
0.895128, 0.3757803, 1.983315, 1, 1, 1, 1, 1,
0.898397, -0.2491996, 2.248866, 1, 1, 1, 1, 1,
0.9008816, 0.5678653, -0.004435848, 1, 1, 1, 1, 1,
0.9107207, -0.3169678, 1.725196, 1, 1, 1, 1, 1,
0.9139115, -0.5208631, 2.072886, 1, 1, 1, 1, 1,
0.915511, -0.7112321, 1.122424, 1, 1, 1, 1, 1,
0.915673, -0.2419887, 2.417752, 0, 0, 1, 1, 1,
0.9174967, 0.2984328, -0.4667868, 1, 0, 0, 1, 1,
0.922404, 0.2236632, 1.930235, 1, 0, 0, 1, 1,
0.9350441, -1.870989, 2.457853, 1, 0, 0, 1, 1,
0.9410108, 0.5771437, 1.645401, 1, 0, 0, 1, 1,
0.9427351, -0.6954042, 3.286386, 1, 0, 0, 1, 1,
0.9558635, -0.3025975, 0.3543852, 0, 0, 0, 1, 1,
0.9569284, -1.491112, 0.0003652718, 0, 0, 0, 1, 1,
0.9572477, -0.2148168, 1.915327, 0, 0, 0, 1, 1,
0.9730591, -0.6537432, -0.1771982, 0, 0, 0, 1, 1,
0.982918, 0.1155798, 0.8781476, 0, 0, 0, 1, 1,
0.9857951, 1.352028, 1.061801, 0, 0, 0, 1, 1,
0.9897135, -1.359941, 3.091032, 0, 0, 0, 1, 1,
0.9917311, 0.9482572, 0.1654371, 1, 1, 1, 1, 1,
0.9933962, -0.594218, 4.676353, 1, 1, 1, 1, 1,
0.9961994, 0.1348833, 1.81301, 1, 1, 1, 1, 1,
0.999655, -1.654436, 1.868825, 1, 1, 1, 1, 1,
1.000419, -0.911476, 1.957664, 1, 1, 1, 1, 1,
1.004284, 1.936586, 0.2575887, 1, 1, 1, 1, 1,
1.005223, 0.1729091, 1.623935, 1, 1, 1, 1, 1,
1.014958, -0.4880874, 1.065287, 1, 1, 1, 1, 1,
1.016833, 0.8285546, 2.556875, 1, 1, 1, 1, 1,
1.017298, -0.5203046, 3.538291, 1, 1, 1, 1, 1,
1.018403, -0.3073648, 1.676175, 1, 1, 1, 1, 1,
1.019645, -0.6834018, 1.930107, 1, 1, 1, 1, 1,
1.021552, 0.7353376, 0.8106816, 1, 1, 1, 1, 1,
1.021778, 1.405813, 1.23978, 1, 1, 1, 1, 1,
1.02917, 0.2184816, 1.816045, 1, 1, 1, 1, 1,
1.03056, 0.8488073, 0.2412767, 0, 0, 1, 1, 1,
1.033063, 1.222829, 1.714944, 1, 0, 0, 1, 1,
1.035439, 0.4819743, 0.3097589, 1, 0, 0, 1, 1,
1.035843, -0.8697084, 1.193923, 1, 0, 0, 1, 1,
1.037339, -0.4325792, 1.934496, 1, 0, 0, 1, 1,
1.040961, 0.5624434, 1.239284, 1, 0, 0, 1, 1,
1.048671, 0.2172854, 1.867477, 0, 0, 0, 1, 1,
1.050317, -1.000226, 2.503164, 0, 0, 0, 1, 1,
1.051627, 0.8725989, 0.389986, 0, 0, 0, 1, 1,
1.053231, 0.08190331, 1.437927, 0, 0, 0, 1, 1,
1.057651, -0.01397519, 2.341115, 0, 0, 0, 1, 1,
1.072716, 0.3055584, 1.302541, 0, 0, 0, 1, 1,
1.078235, 0.5773907, 1.997227, 0, 0, 0, 1, 1,
1.079918, 0.04782303, 2.081884, 1, 1, 1, 1, 1,
1.08108, 1.340353, -0.1998907, 1, 1, 1, 1, 1,
1.081126, -0.1101298, 0.8711761, 1, 1, 1, 1, 1,
1.084521, 1.360821, 1.292115, 1, 1, 1, 1, 1,
1.093587, 0.1226134, 0.3833889, 1, 1, 1, 1, 1,
1.094431, 1.320261, 2.124081, 1, 1, 1, 1, 1,
1.094779, 3.957753, -0.09931453, 1, 1, 1, 1, 1,
1.095746, 0.3314175, 1.718078, 1, 1, 1, 1, 1,
1.096195, -1.228238, 2.750959, 1, 1, 1, 1, 1,
1.099113, -1.465403, 3.31599, 1, 1, 1, 1, 1,
1.099401, -1.141532, 1.718135, 1, 1, 1, 1, 1,
1.102046, -0.2347389, 1.68107, 1, 1, 1, 1, 1,
1.106947, -2.264783, 1.923124, 1, 1, 1, 1, 1,
1.109696, -0.8242121, 0.3950857, 1, 1, 1, 1, 1,
1.111068, -1.350309, 2.735906, 1, 1, 1, 1, 1,
1.126879, -0.4730406, 2.748266, 0, 0, 1, 1, 1,
1.130982, 0.2680285, -0.1557071, 1, 0, 0, 1, 1,
1.131004, -0.1649065, 2.42133, 1, 0, 0, 1, 1,
1.135488, 0.07256291, 0.7610645, 1, 0, 0, 1, 1,
1.137243, -2.855265, 2.677771, 1, 0, 0, 1, 1,
1.139959, -0.7736772, 2.783915, 1, 0, 0, 1, 1,
1.147877, -0.3261687, 2.416302, 0, 0, 0, 1, 1,
1.148673, -0.317597, 0.5130655, 0, 0, 0, 1, 1,
1.148728, -1.731339, 1.905892, 0, 0, 0, 1, 1,
1.154, -0.6938527, 1.764792, 0, 0, 0, 1, 1,
1.155081, 0.1745251, 1.998452, 0, 0, 0, 1, 1,
1.156692, 2.544964, -0.1241986, 0, 0, 0, 1, 1,
1.158964, 1.422666, 1.034736, 0, 0, 0, 1, 1,
1.164398, -1.497031, 1.446066, 1, 1, 1, 1, 1,
1.164811, 1.094177, 0.1197602, 1, 1, 1, 1, 1,
1.165783, 1.822114, -0.8663175, 1, 1, 1, 1, 1,
1.165925, -1.74644, 1.477806, 1, 1, 1, 1, 1,
1.171849, 0.3137766, 2.882746, 1, 1, 1, 1, 1,
1.179779, -0.4828343, 1.184646, 1, 1, 1, 1, 1,
1.20421, -0.09620576, 2.075827, 1, 1, 1, 1, 1,
1.218436, -0.8968692, 1.878777, 1, 1, 1, 1, 1,
1.227624, 0.7959728, 0.4917853, 1, 1, 1, 1, 1,
1.23293, 0.9031322, 1.295032, 1, 1, 1, 1, 1,
1.234658, -0.2375184, 2.941567, 1, 1, 1, 1, 1,
1.23673, 0.476961, 2.634444, 1, 1, 1, 1, 1,
1.237232, 0.4760566, 0.281909, 1, 1, 1, 1, 1,
1.245767, 0.263655, 1.026669, 1, 1, 1, 1, 1,
1.246087, -0.3232581, 2.68521, 1, 1, 1, 1, 1,
1.250956, -1.718269, 3.439679, 0, 0, 1, 1, 1,
1.253201, -0.207359, 1.146466, 1, 0, 0, 1, 1,
1.255084, 1.77886, 0.7717403, 1, 0, 0, 1, 1,
1.258373, -0.7074538, 0.2800763, 1, 0, 0, 1, 1,
1.258741, 0.2977311, 1.829416, 1, 0, 0, 1, 1,
1.266813, -0.04697849, 0.5646027, 1, 0, 0, 1, 1,
1.272019, -1.403262, 3.605434, 0, 0, 0, 1, 1,
1.280707, -1.984916, 3.436413, 0, 0, 0, 1, 1,
1.297148, 0.2299107, 2.862167, 0, 0, 0, 1, 1,
1.301435, -0.7906331, 3.243751, 0, 0, 0, 1, 1,
1.306053, -0.5135791, 1.305966, 0, 0, 0, 1, 1,
1.306101, 2.482943, 1.004064, 0, 0, 0, 1, 1,
1.308434, 1.242482, 1.269473, 0, 0, 0, 1, 1,
1.335866, 0.09789518, 2.874417, 1, 1, 1, 1, 1,
1.343145, -0.2942538, 2.754188, 1, 1, 1, 1, 1,
1.349828, -0.8763333, 3.474151, 1, 1, 1, 1, 1,
1.350399, -2.355539, 3.849003, 1, 1, 1, 1, 1,
1.36453, -0.1079286, 2.135749, 1, 1, 1, 1, 1,
1.365734, 0.1567311, 0.5891155, 1, 1, 1, 1, 1,
1.367218, 0.1537796, 1.013047, 1, 1, 1, 1, 1,
1.370112, 0.699587, 0.9555762, 1, 1, 1, 1, 1,
1.382944, 0.9510953, -0.4073699, 1, 1, 1, 1, 1,
1.387697, 0.4628505, 1.76687, 1, 1, 1, 1, 1,
1.389257, 0.202815, 1.851999, 1, 1, 1, 1, 1,
1.389953, 1.493652, -0.07584185, 1, 1, 1, 1, 1,
1.391948, -0.1406512, 1.945554, 1, 1, 1, 1, 1,
1.395485, -0.7412299, 2.63273, 1, 1, 1, 1, 1,
1.421109, -1.13877, 3.813173, 1, 1, 1, 1, 1,
1.423656, -0.3419476, 1.065227, 0, 0, 1, 1, 1,
1.425353, -0.501446, 1.954112, 1, 0, 0, 1, 1,
1.428046, -0.005269744, 3.362686, 1, 0, 0, 1, 1,
1.443047, -0.7904231, 2.438419, 1, 0, 0, 1, 1,
1.443811, 0.2178286, 0.9690806, 1, 0, 0, 1, 1,
1.453874, -0.4582665, 2.380219, 1, 0, 0, 1, 1,
1.463033, 0.6668298, 2.059199, 0, 0, 0, 1, 1,
1.479195, -0.7135244, 1.451229, 0, 0, 0, 1, 1,
1.505828, 0.23737, 2.353144, 0, 0, 0, 1, 1,
1.519625, 0.2844162, 1.254764, 0, 0, 0, 1, 1,
1.523191, -0.6543943, 2.510797, 0, 0, 0, 1, 1,
1.524672, 0.5076152, 0.3526394, 0, 0, 0, 1, 1,
1.525155, 0.8403921, 1.091358, 0, 0, 0, 1, 1,
1.526803, -0.3145462, 2.346897, 1, 1, 1, 1, 1,
1.529347, -0.9313552, 3.913594, 1, 1, 1, 1, 1,
1.545334, -1.467987, 2.053519, 1, 1, 1, 1, 1,
1.55574, 0.1369784, 1.748653, 1, 1, 1, 1, 1,
1.575165, -0.7440205, -0.7862102, 1, 1, 1, 1, 1,
1.586362, 0.2937114, 1.382015, 1, 1, 1, 1, 1,
1.589993, 1.256524, 0.2690951, 1, 1, 1, 1, 1,
1.596121, -1.439558, 2.191912, 1, 1, 1, 1, 1,
1.597816, 1.365699, 0.7306689, 1, 1, 1, 1, 1,
1.607736, 0.8521405, -1.339327, 1, 1, 1, 1, 1,
1.61443, 1.15112, 0.8675243, 1, 1, 1, 1, 1,
1.619498, -1.045285, 1.801523, 1, 1, 1, 1, 1,
1.633157, -0.1773524, 1.477818, 1, 1, 1, 1, 1,
1.635515, -2.815345, 2.083692, 1, 1, 1, 1, 1,
1.641175, -0.1431713, 0.9977174, 1, 1, 1, 1, 1,
1.654913, 0.9128978, 0.2288664, 0, 0, 1, 1, 1,
1.656583, -0.05712016, 3.527373, 1, 0, 0, 1, 1,
1.675086, 0.4088513, 1.791006, 1, 0, 0, 1, 1,
1.687027, 0.9046423, -0.4697926, 1, 0, 0, 1, 1,
1.69497, -2.516687, 2.787404, 1, 0, 0, 1, 1,
1.703898, 0.121128, 0.6882479, 1, 0, 0, 1, 1,
1.710845, 1.063199, 0.7321388, 0, 0, 0, 1, 1,
1.729712, 1.290321, 0.31029, 0, 0, 0, 1, 1,
1.752199, 0.8329934, 0.7571032, 0, 0, 0, 1, 1,
1.757418, 1.759145, 1.181601, 0, 0, 0, 1, 1,
1.761598, -1.706605, 2.790996, 0, 0, 0, 1, 1,
1.784238, 0.02824176, 0.5826088, 0, 0, 0, 1, 1,
1.796014, 1.513845, 1.329605, 0, 0, 0, 1, 1,
1.796297, 0.3107156, 0.01166962, 1, 1, 1, 1, 1,
1.806398, -0.1762583, 2.416891, 1, 1, 1, 1, 1,
1.806606, 0.459884, 1.756486, 1, 1, 1, 1, 1,
1.814324, -0.09144275, 0.7297016, 1, 1, 1, 1, 1,
1.840884, -0.07212993, -0.3013697, 1, 1, 1, 1, 1,
1.860556, 0.5698394, 0.4998064, 1, 1, 1, 1, 1,
1.876676, -0.5624653, 0.9430839, 1, 1, 1, 1, 1,
1.884278, -0.7418846, 2.122806, 1, 1, 1, 1, 1,
1.893902, -0.1545721, 2.407124, 1, 1, 1, 1, 1,
1.987451, 0.1813104, 1.248776, 1, 1, 1, 1, 1,
2.005965, -1.420089, 2.161088, 1, 1, 1, 1, 1,
2.006145, -1.516269, 3.533774, 1, 1, 1, 1, 1,
2.025802, -0.9485553, 1.906671, 1, 1, 1, 1, 1,
2.037879, -1.468995, 2.05365, 1, 1, 1, 1, 1,
2.043897, 0.1510531, 1.534246, 1, 1, 1, 1, 1,
2.069141, 0.2315542, 1.28451, 0, 0, 1, 1, 1,
2.07165, -0.7250663, 1.632338, 1, 0, 0, 1, 1,
2.078895, 0.6929685, 0.8273041, 1, 0, 0, 1, 1,
2.079502, -1.307674, 2.654422, 1, 0, 0, 1, 1,
2.095591, 0.9042504, 0.9051484, 1, 0, 0, 1, 1,
2.127344, 0.9325523, -0.3935417, 1, 0, 0, 1, 1,
2.129964, -1.351588, 3.220662, 0, 0, 0, 1, 1,
2.133028, 0.7322475, 1.315855, 0, 0, 0, 1, 1,
2.15449, -1.530943, 1.521993, 0, 0, 0, 1, 1,
2.180615, -1.095269, 2.834255, 0, 0, 0, 1, 1,
2.196862, 0.2632287, 0.4809214, 0, 0, 0, 1, 1,
2.221407, 0.2515383, -0.8826007, 0, 0, 0, 1, 1,
2.303733, -0.06456771, 2.472205, 0, 0, 0, 1, 1,
2.304685, -0.8209515, 2.319785, 1, 1, 1, 1, 1,
2.553336, -0.0146745, 0.8252185, 1, 1, 1, 1, 1,
2.61611, 1.450408, 1.057817, 1, 1, 1, 1, 1,
2.65943, 0.5836285, 1.499902, 1, 1, 1, 1, 1,
2.766269, 2.243624, 2.368721, 1, 1, 1, 1, 1,
2.807388, 2.610962, -0.2976227, 1, 1, 1, 1, 1,
3.255837, 1.551864, 1.71418, 1, 1, 1, 1, 1
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
var radius = 9.774467;
var distance = 34.3324;
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
mvMatrix.translate( 0.3724108, -0.5247471, -0.0832572 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.3324);
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
