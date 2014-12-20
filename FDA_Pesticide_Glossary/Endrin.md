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
-2.6964, 0.9166809, -2.007591, 1, 0, 0, 1,
-2.480374, -0.9346049, -1.468551, 1, 0.007843138, 0, 1,
-2.421685, -0.7408391, -0.4796796, 1, 0.01176471, 0, 1,
-2.352726, 0.2734313, -2.671538, 1, 0.01960784, 0, 1,
-2.306914, 0.3975356, -2.381009, 1, 0.02352941, 0, 1,
-2.279669, -0.2470595, -2.982579, 1, 0.03137255, 0, 1,
-2.255658, -0.4002547, -1.541012, 1, 0.03529412, 0, 1,
-2.232654, 0.3018452, -0.7832906, 1, 0.04313726, 0, 1,
-2.220137, -0.2366967, -1.616464, 1, 0.04705882, 0, 1,
-2.209176, 0.3829596, 0.4800747, 1, 0.05490196, 0, 1,
-2.181759, -0.9984341, -2.099306, 1, 0.05882353, 0, 1,
-2.114684, 1.193684, -0.7149587, 1, 0.06666667, 0, 1,
-2.112104, 2.338376, -1.407295, 1, 0.07058824, 0, 1,
-2.038401, -0.5100144, -2.537049, 1, 0.07843138, 0, 1,
-2.032683, 0.6640781, -0.02698022, 1, 0.08235294, 0, 1,
-2.010633, -0.06833437, -0.9839713, 1, 0.09019608, 0, 1,
-1.962953, 0.7756174, 0.3230205, 1, 0.09411765, 0, 1,
-1.934613, -0.1365092, -1.309136, 1, 0.1019608, 0, 1,
-1.929031, -0.4453024, -3.242195, 1, 0.1098039, 0, 1,
-1.919738, -0.3153852, -2.691518, 1, 0.1137255, 0, 1,
-1.899941, 0.4128233, -1.157921, 1, 0.1215686, 0, 1,
-1.896197, -0.1483358, -1.222432, 1, 0.1254902, 0, 1,
-1.859646, 0.2509532, -0.7113394, 1, 0.1333333, 0, 1,
-1.83692, -0.995878, -1.861748, 1, 0.1372549, 0, 1,
-1.801376, -0.697554, -0.9070821, 1, 0.145098, 0, 1,
-1.794135, -1.41126, -1.311242, 1, 0.1490196, 0, 1,
-1.790034, -1.084085, -0.68479, 1, 0.1568628, 0, 1,
-1.756852, 0.1395016, -1.984485, 1, 0.1607843, 0, 1,
-1.742331, 0.01133874, -2.937501, 1, 0.1686275, 0, 1,
-1.730819, 0.8739541, -2.304338, 1, 0.172549, 0, 1,
-1.724357, -0.7227108, -1.356561, 1, 0.1803922, 0, 1,
-1.720821, 0.08105177, -1.462597, 1, 0.1843137, 0, 1,
-1.719778, 0.06274948, -2.304855, 1, 0.1921569, 0, 1,
-1.70565, -0.5748442, -2.059341, 1, 0.1960784, 0, 1,
-1.705445, -1.498935, -2.502308, 1, 0.2039216, 0, 1,
-1.701991, 0.1029143, -1.964835, 1, 0.2117647, 0, 1,
-1.688648, 1.700837, -1.189803, 1, 0.2156863, 0, 1,
-1.679592, -1.026589, -1.212408, 1, 0.2235294, 0, 1,
-1.664114, 0.7662354, 0.09363441, 1, 0.227451, 0, 1,
-1.658865, 1.986112, 0.2737464, 1, 0.2352941, 0, 1,
-1.65828, 0.256383, -1.91196, 1, 0.2392157, 0, 1,
-1.657449, -0.4136264, -3.803662, 1, 0.2470588, 0, 1,
-1.633166, 0.6946793, 0.5041097, 1, 0.2509804, 0, 1,
-1.593654, 1.045009, 0.352695, 1, 0.2588235, 0, 1,
-1.589333, 0.5961462, -1.857662, 1, 0.2627451, 0, 1,
-1.577961, -0.3937988, -3.34801, 1, 0.2705882, 0, 1,
-1.574133, -0.3865131, -0.9756549, 1, 0.2745098, 0, 1,
-1.560339, -0.3013541, -3.39929, 1, 0.282353, 0, 1,
-1.548532, 0.9149963, -0.7855999, 1, 0.2862745, 0, 1,
-1.544994, 0.2831424, -0.4076166, 1, 0.2941177, 0, 1,
-1.534527, 2.299653, 1.187457, 1, 0.3019608, 0, 1,
-1.532088, 0.4302018, -1.861694, 1, 0.3058824, 0, 1,
-1.524521, -0.3113627, -2.06703, 1, 0.3137255, 0, 1,
-1.514957, -0.1244008, -1.023178, 1, 0.3176471, 0, 1,
-1.511524, -0.935974, -2.113815, 1, 0.3254902, 0, 1,
-1.510128, 0.2730977, -2.343306, 1, 0.3294118, 0, 1,
-1.507427, -0.8667744, -1.366126, 1, 0.3372549, 0, 1,
-1.505236, 0.5703016, -1.614764, 1, 0.3411765, 0, 1,
-1.501104, -1.893839, -2.737207, 1, 0.3490196, 0, 1,
-1.499364, 0.03595282, -1.403276, 1, 0.3529412, 0, 1,
-1.487617, 0.7858207, -2.589659, 1, 0.3607843, 0, 1,
-1.471235, 1.358724, -2.816739, 1, 0.3647059, 0, 1,
-1.456182, -0.7845811, -1.20268, 1, 0.372549, 0, 1,
-1.446866, -0.05313399, -1.46334, 1, 0.3764706, 0, 1,
-1.439676, -1.348687, -1.164749, 1, 0.3843137, 0, 1,
-1.429238, 0.02849923, -0.9885932, 1, 0.3882353, 0, 1,
-1.422831, 0.8935629, -0.6083034, 1, 0.3960784, 0, 1,
-1.422383, -2.203428, -2.910087, 1, 0.4039216, 0, 1,
-1.416085, 0.6555039, -1.424281, 1, 0.4078431, 0, 1,
-1.414121, -2.383383, -3.827792, 1, 0.4156863, 0, 1,
-1.409323, 1.977907, 0.01348758, 1, 0.4196078, 0, 1,
-1.404919, -0.2919362, -2.024084, 1, 0.427451, 0, 1,
-1.401716, -0.5808671, -2.348494, 1, 0.4313726, 0, 1,
-1.401515, -1.009675, -1.957374, 1, 0.4392157, 0, 1,
-1.398034, -0.3781887, -1.83747, 1, 0.4431373, 0, 1,
-1.395101, -0.2421399, -2.006028, 1, 0.4509804, 0, 1,
-1.391077, -1.467082, -2.927058, 1, 0.454902, 0, 1,
-1.389646, -0.4090686, -2.597252, 1, 0.4627451, 0, 1,
-1.38404, 0.0764072, -1.494296, 1, 0.4666667, 0, 1,
-1.380571, 0.5573232, -1.133541, 1, 0.4745098, 0, 1,
-1.378574, -0.3821128, -2.269395, 1, 0.4784314, 0, 1,
-1.363426, -1.02775, -4.129928, 1, 0.4862745, 0, 1,
-1.354013, 0.7665541, -0.8148845, 1, 0.4901961, 0, 1,
-1.349065, -1.647496, -2.994547, 1, 0.4980392, 0, 1,
-1.348101, 0.6633695, -1.588583, 1, 0.5058824, 0, 1,
-1.334703, 0.4847221, -0.2717881, 1, 0.509804, 0, 1,
-1.325379, 1.206696, -2.391836, 1, 0.5176471, 0, 1,
-1.32413, -0.4704213, -3.159311, 1, 0.5215687, 0, 1,
-1.31707, -2.088436, -1.127218, 1, 0.5294118, 0, 1,
-1.310702, -1.523346, -1.735325, 1, 0.5333334, 0, 1,
-1.30619, -0.6148742, -2.668136, 1, 0.5411765, 0, 1,
-1.304719, 0.07223324, -2.872088, 1, 0.5450981, 0, 1,
-1.302126, 1.45864, -0.2552649, 1, 0.5529412, 0, 1,
-1.299212, -1.016294, -2.742402, 1, 0.5568628, 0, 1,
-1.29737, -0.8901849, -3.480254, 1, 0.5647059, 0, 1,
-1.295869, 0.120924, -0.212121, 1, 0.5686275, 0, 1,
-1.295202, 0.09583496, -2.299599, 1, 0.5764706, 0, 1,
-1.291808, 0.08267234, -0.7670197, 1, 0.5803922, 0, 1,
-1.287084, 0.0540391, 0.9788184, 1, 0.5882353, 0, 1,
-1.286931, 1.18973, -0.597111, 1, 0.5921569, 0, 1,
-1.283706, 0.3837269, -1.363349, 1, 0.6, 0, 1,
-1.280785, -0.7911752, -2.589264, 1, 0.6078432, 0, 1,
-1.27847, -0.6816049, -1.840295, 1, 0.6117647, 0, 1,
-1.250334, 0.3266875, -0.2851588, 1, 0.6196079, 0, 1,
-1.24641, 1.633691, -1.547087, 1, 0.6235294, 0, 1,
-1.244387, 0.6499189, -2.870048, 1, 0.6313726, 0, 1,
-1.236809, 0.3367881, -1.445839, 1, 0.6352941, 0, 1,
-1.236786, 0.4578422, -2.061011, 1, 0.6431373, 0, 1,
-1.229428, -0.8414142, -2.18241, 1, 0.6470588, 0, 1,
-1.228911, 0.6054967, -2.149211, 1, 0.654902, 0, 1,
-1.224853, -0.6490634, -2.423238, 1, 0.6588235, 0, 1,
-1.219744, 0.1391741, -0.997236, 1, 0.6666667, 0, 1,
-1.218485, 0.2795578, -0.4469009, 1, 0.6705883, 0, 1,
-1.215611, -1.113569, -2.752423, 1, 0.6784314, 0, 1,
-1.209126, -0.4279052, -2.807259, 1, 0.682353, 0, 1,
-1.197327, 0.8532833, -0.08580203, 1, 0.6901961, 0, 1,
-1.195771, -0.7501951, -2.980047, 1, 0.6941177, 0, 1,
-1.193782, -0.6031136, -1.185761, 1, 0.7019608, 0, 1,
-1.175701, 1.122358, -1.917913, 1, 0.7098039, 0, 1,
-1.154504, -0.04761492, -0.9119391, 1, 0.7137255, 0, 1,
-1.15286, 0.1357502, -1.840688, 1, 0.7215686, 0, 1,
-1.152365, 0.9358469, 0.3644144, 1, 0.7254902, 0, 1,
-1.145665, 1.443199, -1.236336, 1, 0.7333333, 0, 1,
-1.133879, 2.336411, 0.001010142, 1, 0.7372549, 0, 1,
-1.13213, -0.9985741, -1.702449, 1, 0.7450981, 0, 1,
-1.128319, -1.026627, -2.932865, 1, 0.7490196, 0, 1,
-1.122546, 0.7267873, -0.7895562, 1, 0.7568628, 0, 1,
-1.115692, -0.1364943, -2.077284, 1, 0.7607843, 0, 1,
-1.099041, 0.335725, -1.927752, 1, 0.7686275, 0, 1,
-1.097715, 0.3676046, -1.588499, 1, 0.772549, 0, 1,
-1.0948, -0.2152803, -2.111138, 1, 0.7803922, 0, 1,
-1.091756, -0.09323901, -2.078738, 1, 0.7843137, 0, 1,
-1.085714, -0.4694929, -2.44511, 1, 0.7921569, 0, 1,
-1.084132, -2.631418, -2.522444, 1, 0.7960784, 0, 1,
-1.077124, -0.1473567, -1.442977, 1, 0.8039216, 0, 1,
-1.075214, 0.7995562, -2.489359, 1, 0.8117647, 0, 1,
-1.073219, -0.5844662, -2.102566, 1, 0.8156863, 0, 1,
-1.068966, 0.7514039, -0.04709405, 1, 0.8235294, 0, 1,
-1.062406, -0.6966169, -2.850048, 1, 0.827451, 0, 1,
-1.061838, -0.1561462, -0.9824545, 1, 0.8352941, 0, 1,
-1.055245, -0.801898, -4.013731, 1, 0.8392157, 0, 1,
-1.050587, -0.1637942, -0.4495778, 1, 0.8470588, 0, 1,
-1.04886, -0.398575, -5.09808, 1, 0.8509804, 0, 1,
-1.047597, -0.1319326, -1.783134, 1, 0.8588235, 0, 1,
-1.047407, -0.4181453, -2.826221, 1, 0.8627451, 0, 1,
-1.044122, -1.289721, -2.857896, 1, 0.8705882, 0, 1,
-1.043241, 0.9015945, -0.4865408, 1, 0.8745098, 0, 1,
-1.035856, -0.2675948, -1.213411, 1, 0.8823529, 0, 1,
-1.035767, -2.347152, -2.119523, 1, 0.8862745, 0, 1,
-1.030428, 0.2697975, -3.033245, 1, 0.8941177, 0, 1,
-1.02685, -0.9857247, -2.175374, 1, 0.8980392, 0, 1,
-1.025937, -1.4359, -2.874857, 1, 0.9058824, 0, 1,
-1.017647, -0.9741633, -0.9136708, 1, 0.9137255, 0, 1,
-1.015491, -0.2838334, -2.542583, 1, 0.9176471, 0, 1,
-1.015246, -0.3501545, -0.3518823, 1, 0.9254902, 0, 1,
-1.014981, -0.1727502, -1.434873, 1, 0.9294118, 0, 1,
-1.008431, -0.5897672, -1.904863, 1, 0.9372549, 0, 1,
-1.007568, -0.5282719, -2.606907, 1, 0.9411765, 0, 1,
-1.006117, -0.1014572, 0.9548103, 1, 0.9490196, 0, 1,
-1.001915, -0.1078163, -2.868382, 1, 0.9529412, 0, 1,
-1.001177, 1.334075, -1.096536, 1, 0.9607843, 0, 1,
-0.9995313, -0.168585, -2.53203, 1, 0.9647059, 0, 1,
-0.9976798, -0.4368469, -3.012627, 1, 0.972549, 0, 1,
-0.993753, -1.261509, -1.741751, 1, 0.9764706, 0, 1,
-0.9914361, -1.163053, -3.655615, 1, 0.9843137, 0, 1,
-0.9871327, 1.446784, -2.186037, 1, 0.9882353, 0, 1,
-0.9818703, -0.01520635, -1.157549, 1, 0.9960784, 0, 1,
-0.9753145, -0.07357933, -2.527041, 0.9960784, 1, 0, 1,
-0.9699062, 0.2514009, -2.211724, 0.9921569, 1, 0, 1,
-0.9665527, -0.5011607, -1.879897, 0.9843137, 1, 0, 1,
-0.9648485, 0.2540482, -0.2422538, 0.9803922, 1, 0, 1,
-0.9605843, -0.297489, -2.928134, 0.972549, 1, 0, 1,
-0.9597448, 0.5206007, -0.5515783, 0.9686275, 1, 0, 1,
-0.951748, -0.7289724, -1.234408, 0.9607843, 1, 0, 1,
-0.9512343, -0.3342711, -1.35505, 0.9568627, 1, 0, 1,
-0.9487973, -0.168435, -1.36951, 0.9490196, 1, 0, 1,
-0.9399881, 1.285614, -1.452941, 0.945098, 1, 0, 1,
-0.9381111, 0.08022474, -0.5831, 0.9372549, 1, 0, 1,
-0.9292628, -0.9493673, -2.416214, 0.9333333, 1, 0, 1,
-0.927656, -0.7473802, -3.430806, 0.9254902, 1, 0, 1,
-0.9241655, -0.2423123, -1.633542, 0.9215686, 1, 0, 1,
-0.9170984, 0.006304338, -0.2752998, 0.9137255, 1, 0, 1,
-0.9149889, 1.903473, 0.09936766, 0.9098039, 1, 0, 1,
-0.9133646, -1.072335, -2.130233, 0.9019608, 1, 0, 1,
-0.9048613, 0.05219546, -3.585722, 0.8941177, 1, 0, 1,
-0.9047176, 0.3722917, 0.8281532, 0.8901961, 1, 0, 1,
-0.8936768, 0.5763942, -1.136116, 0.8823529, 1, 0, 1,
-0.8932729, -0.122215, -2.192577, 0.8784314, 1, 0, 1,
-0.887931, -0.5544985, 0.5244504, 0.8705882, 1, 0, 1,
-0.8868898, -0.598811, -2.320585, 0.8666667, 1, 0, 1,
-0.8793883, -0.5342456, -2.986376, 0.8588235, 1, 0, 1,
-0.8717015, -0.489498, -1.850225, 0.854902, 1, 0, 1,
-0.8716326, 0.06255721, -2.295171, 0.8470588, 1, 0, 1,
-0.8677427, -1.590342, -1.673555, 0.8431373, 1, 0, 1,
-0.8663126, 0.5927176, -0.4427808, 0.8352941, 1, 0, 1,
-0.8640953, -0.806142, -4.096391, 0.8313726, 1, 0, 1,
-0.8630077, -0.1368503, -1.143055, 0.8235294, 1, 0, 1,
-0.8619002, 0.5161657, -1.73273, 0.8196079, 1, 0, 1,
-0.8608931, -1.331385, -2.978454, 0.8117647, 1, 0, 1,
-0.8597778, -0.331398, -2.350287, 0.8078431, 1, 0, 1,
-0.857307, 1.035128, -3.048666, 0.8, 1, 0, 1,
-0.856914, -0.3819594, -0.9363055, 0.7921569, 1, 0, 1,
-0.8555179, 0.1209924, -3.501221, 0.7882353, 1, 0, 1,
-0.8533567, 0.2976195, -0.03442717, 0.7803922, 1, 0, 1,
-0.8401968, 0.2958052, -0.8439184, 0.7764706, 1, 0, 1,
-0.8366619, -0.2729349, -2.151474, 0.7686275, 1, 0, 1,
-0.8356883, -1.603618, -1.729162, 0.7647059, 1, 0, 1,
-0.8345243, -1.45525, -0.999749, 0.7568628, 1, 0, 1,
-0.8300967, -0.3460971, -1.206122, 0.7529412, 1, 0, 1,
-0.8300908, 0.1967175, -2.269656, 0.7450981, 1, 0, 1,
-0.8280364, -0.4876105, -0.9218514, 0.7411765, 1, 0, 1,
-0.8236566, 0.8573071, -0.3966823, 0.7333333, 1, 0, 1,
-0.8210565, -0.9156965, -2.229128, 0.7294118, 1, 0, 1,
-0.8169586, 0.1414736, -0.2690565, 0.7215686, 1, 0, 1,
-0.8151801, -0.02118089, -1.9859, 0.7176471, 1, 0, 1,
-0.8140756, -0.134493, -3.20771, 0.7098039, 1, 0, 1,
-0.8106881, 1.150587, -0.3827546, 0.7058824, 1, 0, 1,
-0.8053344, 0.03214953, -2.067869, 0.6980392, 1, 0, 1,
-0.7948255, -0.7145551, -2.591629, 0.6901961, 1, 0, 1,
-0.7921417, 1.013094, -1.741228, 0.6862745, 1, 0, 1,
-0.7917936, 0.02975842, -2.220871, 0.6784314, 1, 0, 1,
-0.7762533, 1.181849, -1.618809, 0.6745098, 1, 0, 1,
-0.7756687, 0.1720777, -2.354177, 0.6666667, 1, 0, 1,
-0.773312, 1.248744, -1.638119, 0.6627451, 1, 0, 1,
-0.7730737, -0.3219475, -2.808672, 0.654902, 1, 0, 1,
-0.7695554, -0.2965963, -2.003425, 0.6509804, 1, 0, 1,
-0.7692146, 0.6792116, 0.8304948, 0.6431373, 1, 0, 1,
-0.7691909, 1.272866, -0.5068771, 0.6392157, 1, 0, 1,
-0.7690619, -0.5092538, -2.503361, 0.6313726, 1, 0, 1,
-0.7678658, -0.5755363, -1.75161, 0.627451, 1, 0, 1,
-0.7675128, 0.5630317, -1.057124, 0.6196079, 1, 0, 1,
-0.7641428, -1.208257, -2.800042, 0.6156863, 1, 0, 1,
-0.763423, 0.6716774, -0.2822447, 0.6078432, 1, 0, 1,
-0.7609921, 0.1825873, -1.203896, 0.6039216, 1, 0, 1,
-0.7512602, 0.6327644, -0.2403176, 0.5960785, 1, 0, 1,
-0.7446324, -0.9533324, -2.072362, 0.5882353, 1, 0, 1,
-0.7444881, -0.2320317, -2.34174, 0.5843138, 1, 0, 1,
-0.7399335, 0.4025455, 1.806885, 0.5764706, 1, 0, 1,
-0.7388046, -0.1513821, -4.126844, 0.572549, 1, 0, 1,
-0.7379977, -0.003640371, -2.02745, 0.5647059, 1, 0, 1,
-0.7368413, -0.534566, -3.053215, 0.5607843, 1, 0, 1,
-0.7360333, -0.2661816, -1.486445, 0.5529412, 1, 0, 1,
-0.7254976, 1.069125, 1.755663, 0.5490196, 1, 0, 1,
-0.7251782, 0.9375697, -0.2744629, 0.5411765, 1, 0, 1,
-0.7240766, 1.119402, -1.433259, 0.5372549, 1, 0, 1,
-0.7233485, 0.8601149, -0.502865, 0.5294118, 1, 0, 1,
-0.7233289, -0.03589648, -2.324872, 0.5254902, 1, 0, 1,
-0.7213711, -0.5686656, -2.075737, 0.5176471, 1, 0, 1,
-0.7202345, 0.3729707, -0.3534376, 0.5137255, 1, 0, 1,
-0.7164813, 0.598298, -1.358958, 0.5058824, 1, 0, 1,
-0.7118055, -0.1633577, -1.693348, 0.5019608, 1, 0, 1,
-0.7074643, 0.06416365, -2.056576, 0.4941176, 1, 0, 1,
-0.7056795, -0.5366666, -2.377228, 0.4862745, 1, 0, 1,
-0.7005703, 0.08792099, -2.288843, 0.4823529, 1, 0, 1,
-0.7004384, -0.1982024, -1.104054, 0.4745098, 1, 0, 1,
-0.698698, 1.256739, -0.02980237, 0.4705882, 1, 0, 1,
-0.6986206, 0.3623191, -2.259754, 0.4627451, 1, 0, 1,
-0.6930677, 0.3649056, -1.028426, 0.4588235, 1, 0, 1,
-0.6918442, 0.09576496, -2.03922, 0.4509804, 1, 0, 1,
-0.6888623, 0.6949122, -1.399343, 0.4470588, 1, 0, 1,
-0.6875009, -1.105673, -3.771448, 0.4392157, 1, 0, 1,
-0.6868219, -0.3501946, -3.552338, 0.4352941, 1, 0, 1,
-0.6866645, 1.041914, -0.9627805, 0.427451, 1, 0, 1,
-0.6863725, -1.349713, -4.359749, 0.4235294, 1, 0, 1,
-0.6843908, 1.11103, 0.6316335, 0.4156863, 1, 0, 1,
-0.6840606, 0.8155298, 2.018533, 0.4117647, 1, 0, 1,
-0.6824589, 0.1363414, -2.587445, 0.4039216, 1, 0, 1,
-0.6812385, -1.121833, -2.752599, 0.3960784, 1, 0, 1,
-0.6812342, 0.9560267, -0.9197598, 0.3921569, 1, 0, 1,
-0.6795933, -1.239436, -4.720289, 0.3843137, 1, 0, 1,
-0.6792955, -0.1822114, -2.331026, 0.3803922, 1, 0, 1,
-0.6781657, 1.681543, -1.695882, 0.372549, 1, 0, 1,
-0.6767071, -1.912172, -2.239455, 0.3686275, 1, 0, 1,
-0.6765871, 0.8564125, 2.168474, 0.3607843, 1, 0, 1,
-0.6760522, -0.2465534, 0.1064451, 0.3568628, 1, 0, 1,
-0.6711934, -0.9302875, -2.558842, 0.3490196, 1, 0, 1,
-0.668683, 1.130682, -0.5005876, 0.345098, 1, 0, 1,
-0.6590707, 0.1031798, -0.7543241, 0.3372549, 1, 0, 1,
-0.6587748, -0.3687407, -1.512171, 0.3333333, 1, 0, 1,
-0.6550634, -0.12755, -3.081789, 0.3254902, 1, 0, 1,
-0.6541297, -0.3278376, -3.5029, 0.3215686, 1, 0, 1,
-0.6522019, 2.09513, 0.283829, 0.3137255, 1, 0, 1,
-0.6436817, -0.1918196, -1.616175, 0.3098039, 1, 0, 1,
-0.6429659, -0.2518641, -2.386715, 0.3019608, 1, 0, 1,
-0.6343091, 0.5164855, -1.379426, 0.2941177, 1, 0, 1,
-0.6326421, 1.413507, -1.037488, 0.2901961, 1, 0, 1,
-0.6325662, 0.5427088, -0.5043832, 0.282353, 1, 0, 1,
-0.6292858, 0.5164453, -2.277341, 0.2784314, 1, 0, 1,
-0.6266899, 0.7793786, -0.07606415, 0.2705882, 1, 0, 1,
-0.6265817, 1.480787, 0.05065178, 0.2666667, 1, 0, 1,
-0.6187075, 0.7521127, -0.7857381, 0.2588235, 1, 0, 1,
-0.6108673, -0.007792205, -2.959398, 0.254902, 1, 0, 1,
-0.6087816, 0.4145074, -0.957419, 0.2470588, 1, 0, 1,
-0.6075355, -1.520731, -3.368881, 0.2431373, 1, 0, 1,
-0.6072259, 0.8127186, -0.1583445, 0.2352941, 1, 0, 1,
-0.6041749, 1.070642, 0.4850402, 0.2313726, 1, 0, 1,
-0.6020761, 0.6374633, 0.7819669, 0.2235294, 1, 0, 1,
-0.5999715, -0.4556221, -3.846746, 0.2196078, 1, 0, 1,
-0.5957654, -0.4061867, -4.059963, 0.2117647, 1, 0, 1,
-0.5921504, 1.399189, -0.4030614, 0.2078431, 1, 0, 1,
-0.5903112, 1.250616, -0.2805437, 0.2, 1, 0, 1,
-0.5898361, -0.4754041, -3.406852, 0.1921569, 1, 0, 1,
-0.586509, -1.963503, -1.417105, 0.1882353, 1, 0, 1,
-0.5860808, 0.1537734, 0.2680985, 0.1803922, 1, 0, 1,
-0.5837448, 1.023901, -2.353959, 0.1764706, 1, 0, 1,
-0.5809199, -0.5244907, -3.243659, 0.1686275, 1, 0, 1,
-0.5787026, 0.1879146, -0.4186958, 0.1647059, 1, 0, 1,
-0.5774624, 0.3916926, -1.149025, 0.1568628, 1, 0, 1,
-0.5707759, -0.6128231, -3.017412, 0.1529412, 1, 0, 1,
-0.5686925, -0.519769, -2.263597, 0.145098, 1, 0, 1,
-0.5684212, -1.185449, -1.888772, 0.1411765, 1, 0, 1,
-0.56754, 1.298631, 1.560277, 0.1333333, 1, 0, 1,
-0.5645615, -0.2175484, -1.722828, 0.1294118, 1, 0, 1,
-0.5607448, 0.2818458, -1.298637, 0.1215686, 1, 0, 1,
-0.5543846, -0.59812, -1.767849, 0.1176471, 1, 0, 1,
-0.5534958, 0.537418, 0.171013, 0.1098039, 1, 0, 1,
-0.5523396, 0.9859875, -0.1118546, 0.1058824, 1, 0, 1,
-0.5522662, -0.7080373, -2.472794, 0.09803922, 1, 0, 1,
-0.5515132, 0.2148393, -0.07268429, 0.09019608, 1, 0, 1,
-0.545826, 2.403655, -0.5351176, 0.08627451, 1, 0, 1,
-0.5448322, 0.3770749, -3.14643, 0.07843138, 1, 0, 1,
-0.5363155, 2.041239, 0.798272, 0.07450981, 1, 0, 1,
-0.5360789, -0.761124, -2.631037, 0.06666667, 1, 0, 1,
-0.5360614, -1.843433, -3.637237, 0.0627451, 1, 0, 1,
-0.5201567, 0.6166576, 0.3559547, 0.05490196, 1, 0, 1,
-0.5155894, -1.534743, -3.052124, 0.05098039, 1, 0, 1,
-0.5142084, 0.4188092, -0.4036756, 0.04313726, 1, 0, 1,
-0.5134282, -0.2161291, -1.07447, 0.03921569, 1, 0, 1,
-0.5132718, 1.869967, 0.6580833, 0.03137255, 1, 0, 1,
-0.5106927, -1.096954, -2.283317, 0.02745098, 1, 0, 1,
-0.5094213, 0.1598526, -0.7968647, 0.01960784, 1, 0, 1,
-0.5022281, 0.3152195, -1.729318, 0.01568628, 1, 0, 1,
-0.5020576, 0.06889328, -0.2144502, 0.007843138, 1, 0, 1,
-0.4950344, 0.8169461, 0.01583799, 0.003921569, 1, 0, 1,
-0.4922508, 0.7463569, -0.1760077, 0, 1, 0.003921569, 1,
-0.49134, 0.4454901, -1.345702, 0, 1, 0.01176471, 1,
-0.4903629, 1.76813, -1.115458, 0, 1, 0.01568628, 1,
-0.4865787, -0.638918, -2.929769, 0, 1, 0.02352941, 1,
-0.4839539, -0.2979026, -2.446181, 0, 1, 0.02745098, 1,
-0.4819166, -0.3618335, -3.187214, 0, 1, 0.03529412, 1,
-0.481052, 0.9337645, -1.166233, 0, 1, 0.03921569, 1,
-0.4692788, 1.218521, -2.961768, 0, 1, 0.04705882, 1,
-0.468097, -1.259112, -2.257909, 0, 1, 0.05098039, 1,
-0.4680923, -0.8153182, -1.904813, 0, 1, 0.05882353, 1,
-0.4647963, 0.1285808, -3.285769, 0, 1, 0.0627451, 1,
-0.4522177, 1.220679, -0.1523623, 0, 1, 0.07058824, 1,
-0.45171, 1.773749, -0.07172521, 0, 1, 0.07450981, 1,
-0.4465782, -1.705939, -2.48965, 0, 1, 0.08235294, 1,
-0.4426019, -0.3693365, -1.99652, 0, 1, 0.08627451, 1,
-0.4398507, 0.4718825, -0.267545, 0, 1, 0.09411765, 1,
-0.4370635, -1.080942, -2.431894, 0, 1, 0.1019608, 1,
-0.4318632, 1.210301, -0.02584612, 0, 1, 0.1058824, 1,
-0.4230977, -0.07181684, -2.767802, 0, 1, 0.1137255, 1,
-0.4202023, -0.8006487, -1.375219, 0, 1, 0.1176471, 1,
-0.419957, -1.570875, -3.100984, 0, 1, 0.1254902, 1,
-0.4199516, 0.3981034, -0.2799694, 0, 1, 0.1294118, 1,
-0.4196733, 1.798034, 0.5723445, 0, 1, 0.1372549, 1,
-0.4160807, 0.6955248, 1.09086, 0, 1, 0.1411765, 1,
-0.4156738, -1.062657, -3.245864, 0, 1, 0.1490196, 1,
-0.4147283, -0.1871074, -1.547814, 0, 1, 0.1529412, 1,
-0.4127466, 2.065555, 0.1847949, 0, 1, 0.1607843, 1,
-0.4089735, -0.3430334, -1.326082, 0, 1, 0.1647059, 1,
-0.4064245, -0.8287676, -0.3700204, 0, 1, 0.172549, 1,
-0.404386, 0.4989853, 1.567378, 0, 1, 0.1764706, 1,
-0.4030225, -1.446596, -2.412158, 0, 1, 0.1843137, 1,
-0.4025207, 0.6217272, -0.987238, 0, 1, 0.1882353, 1,
-0.3993358, 1.395715, 0.256622, 0, 1, 0.1960784, 1,
-0.3902639, -1.482514, -1.816532, 0, 1, 0.2039216, 1,
-0.3845584, 0.9088408, -2.215207, 0, 1, 0.2078431, 1,
-0.3840134, -0.7503488, -3.956793, 0, 1, 0.2156863, 1,
-0.3832014, 0.2945574, -1.724065, 0, 1, 0.2196078, 1,
-0.3825802, 1.617013, -1.282946, 0, 1, 0.227451, 1,
-0.3809559, 0.1058879, -2.7296, 0, 1, 0.2313726, 1,
-0.3794068, 0.406599, -1.573799, 0, 1, 0.2392157, 1,
-0.3724203, 0.2689098, -1.408984, 0, 1, 0.2431373, 1,
-0.3700798, -0.6035935, -2.614751, 0, 1, 0.2509804, 1,
-0.3676768, 1.035416, -0.7268888, 0, 1, 0.254902, 1,
-0.3584236, -0.9193808, -1.998001, 0, 1, 0.2627451, 1,
-0.3498067, 0.2532503, -0.8158699, 0, 1, 0.2666667, 1,
-0.3497314, 0.7048246, -0.3071137, 0, 1, 0.2745098, 1,
-0.3487316, 0.3958513, -0.840503, 0, 1, 0.2784314, 1,
-0.3465646, -0.9948699, -2.913456, 0, 1, 0.2862745, 1,
-0.3442911, -0.359609, -0.4783331, 0, 1, 0.2901961, 1,
-0.344268, 0.6743951, -0.1533054, 0, 1, 0.2980392, 1,
-0.3417175, -0.6563243, -5.906349, 0, 1, 0.3058824, 1,
-0.3377913, 1.978832, 0.0777561, 0, 1, 0.3098039, 1,
-0.3364905, -1.072543, -2.815822, 0, 1, 0.3176471, 1,
-0.3354791, 0.226391, -1.395956, 0, 1, 0.3215686, 1,
-0.3345875, 1.649611, 1.86155, 0, 1, 0.3294118, 1,
-0.3325199, -0.8314277, -3.326391, 0, 1, 0.3333333, 1,
-0.3263863, -0.8013701, -3.576015, 0, 1, 0.3411765, 1,
-0.3224069, -0.02171891, -0.2229385, 0, 1, 0.345098, 1,
-0.3212882, -0.2245739, -1.899321, 0, 1, 0.3529412, 1,
-0.3095167, -1.772919, -1.805862, 0, 1, 0.3568628, 1,
-0.3095096, 1.528686, -1.013803, 0, 1, 0.3647059, 1,
-0.3055266, -0.2093757, -1.942302, 0, 1, 0.3686275, 1,
-0.3036224, -1.092312, -2.754571, 0, 1, 0.3764706, 1,
-0.2989744, 0.6648186, -0.6061291, 0, 1, 0.3803922, 1,
-0.2985667, -0.2088489, 0.8049304, 0, 1, 0.3882353, 1,
-0.2958613, -1.051854, -1.842968, 0, 1, 0.3921569, 1,
-0.2956216, -0.2221251, -2.994089, 0, 1, 0.4, 1,
-0.2942617, -0.6235994, -3.449049, 0, 1, 0.4078431, 1,
-0.2895666, 0.8327921, -0.1548636, 0, 1, 0.4117647, 1,
-0.2872601, -1.303901, -5.430472, 0, 1, 0.4196078, 1,
-0.2855394, 1.217287, 0.4128462, 0, 1, 0.4235294, 1,
-0.2844908, -0.7719883, -1.669683, 0, 1, 0.4313726, 1,
-0.2820886, -0.158098, -2.738136, 0, 1, 0.4352941, 1,
-0.2784159, -1.339486, -1.711355, 0, 1, 0.4431373, 1,
-0.2764799, 1.822185, 0.3797382, 0, 1, 0.4470588, 1,
-0.2764212, -0.9046487, -3.544538, 0, 1, 0.454902, 1,
-0.2750654, -1.244647, -3.949009, 0, 1, 0.4588235, 1,
-0.2735016, -1.268173, -0.8379655, 0, 1, 0.4666667, 1,
-0.2689785, -0.2936423, -1.806239, 0, 1, 0.4705882, 1,
-0.2666429, 1.419624, -2.304649, 0, 1, 0.4784314, 1,
-0.2602799, 1.342269, 0.8740456, 0, 1, 0.4823529, 1,
-0.2457317, -0.4882296, -2.931159, 0, 1, 0.4901961, 1,
-0.2424826, 2.38358, 1.323874, 0, 1, 0.4941176, 1,
-0.2400191, 2.296331, 0.1003999, 0, 1, 0.5019608, 1,
-0.2383869, -0.543043, -1.49854, 0, 1, 0.509804, 1,
-0.2383587, -1.874443, -2.58126, 0, 1, 0.5137255, 1,
-0.2380825, 0.4667033, -0.0613056, 0, 1, 0.5215687, 1,
-0.2379315, -0.4204098, -2.491787, 0, 1, 0.5254902, 1,
-0.2377173, 0.6794695, -0.02553483, 0, 1, 0.5333334, 1,
-0.2359938, 0.1708216, 0.05972973, 0, 1, 0.5372549, 1,
-0.2268791, -0.2856475, -2.830918, 0, 1, 0.5450981, 1,
-0.2254244, -1.105756, -0.519313, 0, 1, 0.5490196, 1,
-0.2197455, 0.1925237, -1.467803, 0, 1, 0.5568628, 1,
-0.2191626, 1.172315, -0.2470164, 0, 1, 0.5607843, 1,
-0.2157395, 2.091282, 0.5783619, 0, 1, 0.5686275, 1,
-0.214829, -1.415197, -1.964302, 0, 1, 0.572549, 1,
-0.2146956, -1.475594, -3.462052, 0, 1, 0.5803922, 1,
-0.2137415, 1.222288, -0.3490946, 0, 1, 0.5843138, 1,
-0.2127009, 0.3187048, 0.07726821, 0, 1, 0.5921569, 1,
-0.2065642, 1.52097, -0.1677685, 0, 1, 0.5960785, 1,
-0.2053783, 0.9555978, -0.6648389, 0, 1, 0.6039216, 1,
-0.1921956, 0.6165941, 0.09101753, 0, 1, 0.6117647, 1,
-0.189106, -1.392056, -2.441312, 0, 1, 0.6156863, 1,
-0.1887651, -0.7071376, -4.014589, 0, 1, 0.6235294, 1,
-0.1865978, -0.01886688, -1.904362, 0, 1, 0.627451, 1,
-0.1827118, -0.4347493, -3.387322, 0, 1, 0.6352941, 1,
-0.1786406, 0.06191606, -0.1731324, 0, 1, 0.6392157, 1,
-0.1782646, -0.9421181, -4.470408, 0, 1, 0.6470588, 1,
-0.174831, 0.4803225, 0.4500112, 0, 1, 0.6509804, 1,
-0.1690085, -0.1883263, -3.230364, 0, 1, 0.6588235, 1,
-0.1650995, 0.111626, -1.343595, 0, 1, 0.6627451, 1,
-0.1641373, 1.025426, -0.7164832, 0, 1, 0.6705883, 1,
-0.1633531, 1.208708, 0.9632866, 0, 1, 0.6745098, 1,
-0.1632511, 1.01231, 1.928193, 0, 1, 0.682353, 1,
-0.1618193, -0.06258262, -0.2021016, 0, 1, 0.6862745, 1,
-0.1610217, 0.2119527, 0.2630117, 0, 1, 0.6941177, 1,
-0.1609494, -0.5669465, -3.093469, 0, 1, 0.7019608, 1,
-0.1607366, 0.8834047, -0.09115348, 0, 1, 0.7058824, 1,
-0.1529646, 0.3180611, -0.2750387, 0, 1, 0.7137255, 1,
-0.15255, 1.600573, -0.8029765, 0, 1, 0.7176471, 1,
-0.1456023, -0.4332798, -2.609586, 0, 1, 0.7254902, 1,
-0.1438887, -0.2249639, -2.82313, 0, 1, 0.7294118, 1,
-0.1438745, -1.258689, -2.378794, 0, 1, 0.7372549, 1,
-0.1408829, -0.0007424271, -2.85823, 0, 1, 0.7411765, 1,
-0.1332553, -1.102903, -5.440784, 0, 1, 0.7490196, 1,
-0.133165, -0.7782192, -3.257826, 0, 1, 0.7529412, 1,
-0.1328548, 2.263154, 2.519604, 0, 1, 0.7607843, 1,
-0.1225817, 0.3064447, 1.166805, 0, 1, 0.7647059, 1,
-0.1225035, -0.4408528, -4.605773, 0, 1, 0.772549, 1,
-0.1215761, -0.3559973, -1.250276, 0, 1, 0.7764706, 1,
-0.1181939, -1.234071, -1.790973, 0, 1, 0.7843137, 1,
-0.1160723, 1.164431, 0.6615119, 0, 1, 0.7882353, 1,
-0.1143028, -0.3939305, -2.543516, 0, 1, 0.7960784, 1,
-0.1125631, -0.2588952, -2.385177, 0, 1, 0.8039216, 1,
-0.1113994, 1.40969, 0.1385315, 0, 1, 0.8078431, 1,
-0.1073591, -1.033411, -3.906474, 0, 1, 0.8156863, 1,
-0.10043, 1.688818, -1.118628, 0, 1, 0.8196079, 1,
-0.1003912, 1.063955, -0.3638363, 0, 1, 0.827451, 1,
-0.09702025, -0.293324, -2.258846, 0, 1, 0.8313726, 1,
-0.09632871, 1.055591, -0.1024395, 0, 1, 0.8392157, 1,
-0.09629584, 0.5903729, -0.818288, 0, 1, 0.8431373, 1,
-0.08813412, 0.7411771, -0.2138546, 0, 1, 0.8509804, 1,
-0.08466888, -0.3768799, -3.284226, 0, 1, 0.854902, 1,
-0.08378044, -0.4183381, -2.019645, 0, 1, 0.8627451, 1,
-0.07993884, 1.658181, -1.077641, 0, 1, 0.8666667, 1,
-0.07906298, -0.1710494, -2.798689, 0, 1, 0.8745098, 1,
-0.07625356, -0.3031119, -0.8525192, 0, 1, 0.8784314, 1,
-0.07373927, -0.2416169, -1.873011, 0, 1, 0.8862745, 1,
-0.07349645, 0.2484732, 1.4204, 0, 1, 0.8901961, 1,
-0.07303131, -0.8268201, -0.6501529, 0, 1, 0.8980392, 1,
-0.06887474, -0.0625914, -3.978777, 0, 1, 0.9058824, 1,
-0.06775948, -1.74933, -2.358168, 0, 1, 0.9098039, 1,
-0.06571606, 0.6821738, 1.426748, 0, 1, 0.9176471, 1,
-0.06564883, -0.009581651, -0.7557433, 0, 1, 0.9215686, 1,
-0.06455074, 0.9691319, 0.241891, 0, 1, 0.9294118, 1,
-0.06449629, 0.2458974, -1.389683, 0, 1, 0.9333333, 1,
-0.06216921, 0.02136728, -1.589115, 0, 1, 0.9411765, 1,
-0.06125189, 1.483658, 0.03199396, 0, 1, 0.945098, 1,
-0.05844152, -0.5461187, -3.710625, 0, 1, 0.9529412, 1,
-0.05763495, -0.8074578, -3.075857, 0, 1, 0.9568627, 1,
-0.04936891, 0.9067827, -1.445441, 0, 1, 0.9647059, 1,
-0.04918947, 1.991031, 0.5616161, 0, 1, 0.9686275, 1,
-0.04642287, 0.5827917, 0.09435654, 0, 1, 0.9764706, 1,
-0.04280818, 1.430822, -0.7989446, 0, 1, 0.9803922, 1,
-0.02656936, 0.8664632, -0.1188962, 0, 1, 0.9882353, 1,
-0.02321407, -0.8505865, -5.275139, 0, 1, 0.9921569, 1,
-0.02222977, 0.7757384, -0.8460755, 0, 1, 1, 1,
-0.02082306, 0.6790581, -1.315808, 0, 0.9921569, 1, 1,
-0.01835017, -0.7876235, -3.410185, 0, 0.9882353, 1, 1,
-0.01707383, -0.9790214, -5.151947, 0, 0.9803922, 1, 1,
-0.01577467, -0.1234164, -3.111735, 0, 0.9764706, 1, 1,
-0.01573609, 0.5417342, -1.134838, 0, 0.9686275, 1, 1,
-0.01566172, -1.510528, -0.8497341, 0, 0.9647059, 1, 1,
-0.01553687, 1.059851, 1.544622, 0, 0.9568627, 1, 1,
-0.01263485, 0.09270277, -1.013513, 0, 0.9529412, 1, 1,
-0.01132297, -0.1230155, -3.695656, 0, 0.945098, 1, 1,
-0.009791031, 1.165732, -0.5946562, 0, 0.9411765, 1, 1,
-0.009615367, 0.08039331, -0.3128291, 0, 0.9333333, 1, 1,
-0.008190552, -0.9578981, -3.868037, 0, 0.9294118, 1, 1,
-0.005987346, 0.4856283, 0.8352671, 0, 0.9215686, 1, 1,
-0.003316568, 0.0207208, -1.084082, 0, 0.9176471, 1, 1,
0.003665465, -0.7238478, 2.531041, 0, 0.9098039, 1, 1,
0.003963663, 0.3470827, -2.518869, 0, 0.9058824, 1, 1,
0.005760596, -2.071169, 3.666394, 0, 0.8980392, 1, 1,
0.01276202, -0.02808673, 4.484399, 0, 0.8901961, 1, 1,
0.01499895, -0.5392931, 4.362347, 0, 0.8862745, 1, 1,
0.01921627, 1.416131, 0.6940048, 0, 0.8784314, 1, 1,
0.01934915, 1.490328, -1.238116, 0, 0.8745098, 1, 1,
0.02034618, 1.249892, 0.6296232, 0, 0.8666667, 1, 1,
0.02078874, -0.2651934, 3.019756, 0, 0.8627451, 1, 1,
0.02128688, -0.2036293, 4.392031, 0, 0.854902, 1, 1,
0.02407629, -0.451982, 2.402074, 0, 0.8509804, 1, 1,
0.02783491, 0.5730252, -0.7144268, 0, 0.8431373, 1, 1,
0.02832468, 0.4251617, 0.690235, 0, 0.8392157, 1, 1,
0.03044754, 0.6303225, -1.716334, 0, 0.8313726, 1, 1,
0.0345859, -0.153475, 3.342751, 0, 0.827451, 1, 1,
0.03497442, 0.3099993, 0.3332111, 0, 0.8196079, 1, 1,
0.03934947, 0.8988164, 0.4581774, 0, 0.8156863, 1, 1,
0.04076534, 1.208861, -1.595176, 0, 0.8078431, 1, 1,
0.04118489, -0.8849885, 2.993077, 0, 0.8039216, 1, 1,
0.05071094, 1.342296, -0.2294047, 0, 0.7960784, 1, 1,
0.05667605, 0.4715855, -1.460269, 0, 0.7882353, 1, 1,
0.05717576, 0.3173982, -1.014926, 0, 0.7843137, 1, 1,
0.05798139, -0.3919377, 1.778047, 0, 0.7764706, 1, 1,
0.0609323, -1.170771, 3.58677, 0, 0.772549, 1, 1,
0.0682226, -1.01237, 3.066703, 0, 0.7647059, 1, 1,
0.06883689, -0.06681346, 3.072075, 0, 0.7607843, 1, 1,
0.07487989, -0.3353063, 3.931603, 0, 0.7529412, 1, 1,
0.07613891, 0.2893884, 0.5193424, 0, 0.7490196, 1, 1,
0.0771825, -0.1459468, 2.735704, 0, 0.7411765, 1, 1,
0.08145811, -1.375766, 3.184025, 0, 0.7372549, 1, 1,
0.0827588, 2.44898, 0.8401431, 0, 0.7294118, 1, 1,
0.08749968, 1.118286, 0.7098371, 0, 0.7254902, 1, 1,
0.08760333, -0.7489017, 3.207939, 0, 0.7176471, 1, 1,
0.09306532, -0.3412677, 5.133938, 0, 0.7137255, 1, 1,
0.09433813, 1.389476, 1.992122, 0, 0.7058824, 1, 1,
0.09678181, -0.6909713, 3.137431, 0, 0.6980392, 1, 1,
0.09721439, 1.761572, 1.189149, 0, 0.6941177, 1, 1,
0.09959097, -1.458858, 4.088239, 0, 0.6862745, 1, 1,
0.1013874, -0.2826663, 3.546378, 0, 0.682353, 1, 1,
0.103892, -1.889621, 2.795755, 0, 0.6745098, 1, 1,
0.105576, -1.544708, 3.503853, 0, 0.6705883, 1, 1,
0.1101424, 1.678041, -1.042503, 0, 0.6627451, 1, 1,
0.1111689, 1.290725, 1.169753, 0, 0.6588235, 1, 1,
0.11328, -1.077526, 2.434844, 0, 0.6509804, 1, 1,
0.1155193, -0.2964302, 2.261138, 0, 0.6470588, 1, 1,
0.117267, 0.04009887, 1.378856, 0, 0.6392157, 1, 1,
0.1186439, 1.082282, -1.512532, 0, 0.6352941, 1, 1,
0.1235875, -0.967671, 4.035045, 0, 0.627451, 1, 1,
0.1237022, -1.123962, 3.547765, 0, 0.6235294, 1, 1,
0.1253459, -0.4603072, 3.539153, 0, 0.6156863, 1, 1,
0.1277984, 0.5196764, 0.7851321, 0, 0.6117647, 1, 1,
0.1308153, -0.5528628, 1.295567, 0, 0.6039216, 1, 1,
0.1329601, 1.753885, 1.167518, 0, 0.5960785, 1, 1,
0.141627, 0.5245735, -0.002740717, 0, 0.5921569, 1, 1,
0.1456884, -1.215906, 2.37707, 0, 0.5843138, 1, 1,
0.1472621, -0.07343827, 1.597746, 0, 0.5803922, 1, 1,
0.1473389, 1.115653, 0.1397601, 0, 0.572549, 1, 1,
0.1480859, -0.4838563, 2.786136, 0, 0.5686275, 1, 1,
0.1483438, -1.51142, 4.634373, 0, 0.5607843, 1, 1,
0.1486094, -0.009674391, 1.850727, 0, 0.5568628, 1, 1,
0.1532072, 2.198612, 0.05071936, 0, 0.5490196, 1, 1,
0.1536205, -1.261588, 4.126401, 0, 0.5450981, 1, 1,
0.1544429, -0.237836, 1.985106, 0, 0.5372549, 1, 1,
0.1546201, -0.06298333, 4.232239, 0, 0.5333334, 1, 1,
0.157049, 0.1409504, -0.6286927, 0, 0.5254902, 1, 1,
0.1572116, 1.970775, 1.557903, 0, 0.5215687, 1, 1,
0.15858, -0.132167, 3.90536, 0, 0.5137255, 1, 1,
0.1602657, 1.213508, 0.719954, 0, 0.509804, 1, 1,
0.1603387, 1.339072, 0.7323332, 0, 0.5019608, 1, 1,
0.1606279, -0.3294693, 1.793602, 0, 0.4941176, 1, 1,
0.162396, -0.5409242, 1.422315, 0, 0.4901961, 1, 1,
0.1662234, -0.6672669, 2.246636, 0, 0.4823529, 1, 1,
0.1707429, -1.512279, 3.204785, 0, 0.4784314, 1, 1,
0.1748838, -0.1838136, 1.104009, 0, 0.4705882, 1, 1,
0.175673, -0.7477822, 3.468554, 0, 0.4666667, 1, 1,
0.1764296, 0.6164563, 0.4422015, 0, 0.4588235, 1, 1,
0.1822914, 0.1765814, 2.72051, 0, 0.454902, 1, 1,
0.1870556, 0.3630426, 0.007905953, 0, 0.4470588, 1, 1,
0.1881067, -0.1443516, 0.5507662, 0, 0.4431373, 1, 1,
0.1895269, -0.2147737, 1.29802, 0, 0.4352941, 1, 1,
0.1911438, -0.04294607, 2.622378, 0, 0.4313726, 1, 1,
0.1922883, 0.5943888, 2.154564, 0, 0.4235294, 1, 1,
0.1963294, -0.1937352, 2.138524, 0, 0.4196078, 1, 1,
0.1977992, -1.084276, 2.246368, 0, 0.4117647, 1, 1,
0.2016118, -0.6276929, 3.091248, 0, 0.4078431, 1, 1,
0.2023243, -0.6401084, 2.501354, 0, 0.4, 1, 1,
0.2035578, -1.921236, 3.66937, 0, 0.3921569, 1, 1,
0.2048102, -1.541916, 3.627855, 0, 0.3882353, 1, 1,
0.2058219, 1.691676, -0.1012018, 0, 0.3803922, 1, 1,
0.2076297, -0.6641467, 2.002913, 0, 0.3764706, 1, 1,
0.2100871, 0.7089543, 1.997236, 0, 0.3686275, 1, 1,
0.2141592, -1.745716, 4.040768, 0, 0.3647059, 1, 1,
0.2146265, 0.9960635, -0.6530906, 0, 0.3568628, 1, 1,
0.2209405, 0.01125448, 0.3278417, 0, 0.3529412, 1, 1,
0.221662, 0.4456014, 2.325051, 0, 0.345098, 1, 1,
0.2216908, -0.4839231, 3.455158, 0, 0.3411765, 1, 1,
0.222904, 1.144557, 0.686355, 0, 0.3333333, 1, 1,
0.2266974, -0.3912196, 3.986376, 0, 0.3294118, 1, 1,
0.2325502, -1.946655, 2.45409, 0, 0.3215686, 1, 1,
0.2335624, -0.8967134, 3.589553, 0, 0.3176471, 1, 1,
0.2355024, 1.003923, 0.5305346, 0, 0.3098039, 1, 1,
0.2398473, -0.4035825, 1.598117, 0, 0.3058824, 1, 1,
0.2457318, -1.040036, 3.405912, 0, 0.2980392, 1, 1,
0.2573668, -2.111671, 1.877486, 0, 0.2901961, 1, 1,
0.260891, -0.1234225, 0.2663572, 0, 0.2862745, 1, 1,
0.2616473, -1.786609, 3.408555, 0, 0.2784314, 1, 1,
0.2673238, -0.1979228, 0.1788371, 0, 0.2745098, 1, 1,
0.2706645, 0.72459, 1.267687, 0, 0.2666667, 1, 1,
0.2731535, -1.04898, 1.776326, 0, 0.2627451, 1, 1,
0.2746099, 0.06587462, 0.4229621, 0, 0.254902, 1, 1,
0.2767643, -0.08260869, 1.975983, 0, 0.2509804, 1, 1,
0.2768234, 1.036894, 0.05512036, 0, 0.2431373, 1, 1,
0.2778124, -1.363634, 3.180762, 0, 0.2392157, 1, 1,
0.2780626, 0.05318095, 1.765135, 0, 0.2313726, 1, 1,
0.278248, -0.7023333, 1.766071, 0, 0.227451, 1, 1,
0.2784986, -0.09131738, 1.670253, 0, 0.2196078, 1, 1,
0.2836837, -1.21366, 2.384261, 0, 0.2156863, 1, 1,
0.2837318, -0.0410351, 0.2314385, 0, 0.2078431, 1, 1,
0.2858949, -0.06516366, 1.363854, 0, 0.2039216, 1, 1,
0.2872361, -0.3437104, 3.121058, 0, 0.1960784, 1, 1,
0.2902575, -1.479845, 3.751921, 0, 0.1882353, 1, 1,
0.2918578, 0.7935051, 0.2686256, 0, 0.1843137, 1, 1,
0.2952073, 0.01387773, 0.811379, 0, 0.1764706, 1, 1,
0.2982631, 1.39855, 0.04452318, 0, 0.172549, 1, 1,
0.2992172, 0.8722609, 0.8378666, 0, 0.1647059, 1, 1,
0.299671, 0.6960126, -1.476949, 0, 0.1607843, 1, 1,
0.3036844, -1.481942, 2.307607, 0, 0.1529412, 1, 1,
0.3043728, 0.3902176, 2.061409, 0, 0.1490196, 1, 1,
0.3056799, -0.6037768, 2.659904, 0, 0.1411765, 1, 1,
0.3081235, 0.6806325, -1.350983, 0, 0.1372549, 1, 1,
0.3148195, -0.09367685, 2.324375, 0, 0.1294118, 1, 1,
0.3232216, -0.4249881, 3.305902, 0, 0.1254902, 1, 1,
0.3235391, 0.8938522, 0.8595433, 0, 0.1176471, 1, 1,
0.3275528, -0.836859, 3.936033, 0, 0.1137255, 1, 1,
0.3276948, -0.4067152, 0.7752684, 0, 0.1058824, 1, 1,
0.3281606, 0.9542636, 2.364415, 0, 0.09803922, 1, 1,
0.3302159, -0.03400665, 1.60306, 0, 0.09411765, 1, 1,
0.3328599, -2.51333, 3.183196, 0, 0.08627451, 1, 1,
0.3355984, -2.226772, 1.677025, 0, 0.08235294, 1, 1,
0.3380989, 0.5873605, -0.3977032, 0, 0.07450981, 1, 1,
0.338405, -1.205167, 3.415233, 0, 0.07058824, 1, 1,
0.3418691, 0.08500183, 0.9197693, 0, 0.0627451, 1, 1,
0.3420428, -0.36456, 2.914251, 0, 0.05882353, 1, 1,
0.3446096, -0.9281787, 0.08293212, 0, 0.05098039, 1, 1,
0.3472501, 1.014701, -1.218561, 0, 0.04705882, 1, 1,
0.3500027, -0.1526875, 3.300572, 0, 0.03921569, 1, 1,
0.3506227, 0.7747478, 0.06097435, 0, 0.03529412, 1, 1,
0.3512315, 0.7318967, -1.142187, 0, 0.02745098, 1, 1,
0.3559926, 1.445641, -0.4492045, 0, 0.02352941, 1, 1,
0.3565764, -0.8094628, 3.019598, 0, 0.01568628, 1, 1,
0.3613143, 0.8388442, -0.3160579, 0, 0.01176471, 1, 1,
0.3700797, 0.3140908, -0.7556801, 0, 0.003921569, 1, 1,
0.3723368, 0.976281, 0.06504807, 0.003921569, 0, 1, 1,
0.3726107, -1.456627, 1.512047, 0.007843138, 0, 1, 1,
0.382448, -0.290017, 1.654179, 0.01568628, 0, 1, 1,
0.3835044, -0.4313079, 0.6898116, 0.01960784, 0, 1, 1,
0.387702, -1.419097, 2.961746, 0.02745098, 0, 1, 1,
0.3921931, 1.204621, 0.389681, 0.03137255, 0, 1, 1,
0.3922842, 0.4391279, 0.5377066, 0.03921569, 0, 1, 1,
0.3958957, 1.13043, 0.8926729, 0.04313726, 0, 1, 1,
0.3998464, 0.2703109, 0.2889523, 0.05098039, 0, 1, 1,
0.4054403, 0.3386408, 0.0007900766, 0.05490196, 0, 1, 1,
0.4108839, 0.7390813, -0.05479826, 0.0627451, 0, 1, 1,
0.4145786, 0.1309805, -0.4227772, 0.06666667, 0, 1, 1,
0.4154541, 1.075966, 1.413764, 0.07450981, 0, 1, 1,
0.4160001, 0.04534017, 0.07243679, 0.07843138, 0, 1, 1,
0.4231418, -0.9499784, 3.408015, 0.08627451, 0, 1, 1,
0.4236573, 0.5083753, -0.1044946, 0.09019608, 0, 1, 1,
0.4285515, -1.415714, 2.267044, 0.09803922, 0, 1, 1,
0.4286129, -2.812185, 3.390339, 0.1058824, 0, 1, 1,
0.4315606, -0.4649046, 2.08198, 0.1098039, 0, 1, 1,
0.4320388, -0.165029, 1.72502, 0.1176471, 0, 1, 1,
0.4330665, -1.036023, 2.332211, 0.1215686, 0, 1, 1,
0.4406633, -0.5708537, 2.073825, 0.1294118, 0, 1, 1,
0.44366, -0.7504951, 3.123559, 0.1333333, 0, 1, 1,
0.4450432, 0.7850065, 1.877156, 0.1411765, 0, 1, 1,
0.4468017, -1.195376, 4.334484, 0.145098, 0, 1, 1,
0.4481692, -1.033169, 2.627788, 0.1529412, 0, 1, 1,
0.4531848, 1.702792, 0.2054067, 0.1568628, 0, 1, 1,
0.4537741, -0.6500796, 3.618916, 0.1647059, 0, 1, 1,
0.4580758, -1.521262, 3.022732, 0.1686275, 0, 1, 1,
0.4583233, -1.572386, 0.6654156, 0.1764706, 0, 1, 1,
0.460031, -2.450024, 5.210944, 0.1803922, 0, 1, 1,
0.4649664, 1.446079, 0.5825344, 0.1882353, 0, 1, 1,
0.4785946, -0.2718319, 3.856773, 0.1921569, 0, 1, 1,
0.4811942, -0.2109571, 2.678412, 0.2, 0, 1, 1,
0.4820585, 0.7633684, 1.274412, 0.2078431, 0, 1, 1,
0.4842976, 0.4629965, 0.7018064, 0.2117647, 0, 1, 1,
0.4904056, 1.503938, -0.2846537, 0.2196078, 0, 1, 1,
0.4933632, 1.133812, -1.694921, 0.2235294, 0, 1, 1,
0.4935019, -0.5153952, 0.64591, 0.2313726, 0, 1, 1,
0.4938186, 1.070218, 0.365203, 0.2352941, 0, 1, 1,
0.4960138, -0.02408358, 3.071175, 0.2431373, 0, 1, 1,
0.4972499, -0.4575708, 1.563932, 0.2470588, 0, 1, 1,
0.5032259, 0.6988667, 0.7651482, 0.254902, 0, 1, 1,
0.5165772, -0.6272489, 2.439444, 0.2588235, 0, 1, 1,
0.517612, -0.05790586, 1.321938, 0.2666667, 0, 1, 1,
0.518703, 0.7462085, 0.04447025, 0.2705882, 0, 1, 1,
0.5196294, 1.760186, 1.900955, 0.2784314, 0, 1, 1,
0.5202434, -0.9812125, 2.189387, 0.282353, 0, 1, 1,
0.5215142, 0.36318, 2.203411, 0.2901961, 0, 1, 1,
0.523666, -0.4729482, 0.6985091, 0.2941177, 0, 1, 1,
0.5243068, -0.1620888, 0.9785639, 0.3019608, 0, 1, 1,
0.5275803, 1.383814, 0.849596, 0.3098039, 0, 1, 1,
0.5299146, 0.7254854, 0.6325116, 0.3137255, 0, 1, 1,
0.53173, -1.896234, 4.148325, 0.3215686, 0, 1, 1,
0.5321664, -0.3263163, 1.320342, 0.3254902, 0, 1, 1,
0.5343397, 2.103574, 0.8585463, 0.3333333, 0, 1, 1,
0.5345393, 1.181056, 0.2700504, 0.3372549, 0, 1, 1,
0.5348544, 0.5502923, 0.4704419, 0.345098, 0, 1, 1,
0.5351521, -0.009824264, 3.070275, 0.3490196, 0, 1, 1,
0.5370587, 0.3175332, 0.9020585, 0.3568628, 0, 1, 1,
0.5391794, 0.2073984, 0.7102342, 0.3607843, 0, 1, 1,
0.5406948, 1.32248, -0.5530073, 0.3686275, 0, 1, 1,
0.5451173, -1.511299, 2.611764, 0.372549, 0, 1, 1,
0.5465382, -1.381264, 3.166073, 0.3803922, 0, 1, 1,
0.5508271, -0.3465512, 2.774928, 0.3843137, 0, 1, 1,
0.556212, -0.8194256, 3.115491, 0.3921569, 0, 1, 1,
0.5604575, 0.590591, 0.5878384, 0.3960784, 0, 1, 1,
0.5615842, -1.746752, 4.028884, 0.4039216, 0, 1, 1,
0.564344, -0.2838442, 1.806938, 0.4117647, 0, 1, 1,
0.5707171, -0.2224559, 1.726818, 0.4156863, 0, 1, 1,
0.5720373, -0.5410441, 1.531356, 0.4235294, 0, 1, 1,
0.5730671, -1.387429, 1.713603, 0.427451, 0, 1, 1,
0.5824406, -0.1309498, 2.166786, 0.4352941, 0, 1, 1,
0.5850099, -0.5087146, 2.036855, 0.4392157, 0, 1, 1,
0.5886911, 0.391488, -0.1888359, 0.4470588, 0, 1, 1,
0.5903719, -0.8754938, 4.247298, 0.4509804, 0, 1, 1,
0.5917008, -0.5346597, 1.127086, 0.4588235, 0, 1, 1,
0.5926853, 0.5919035, 0.6821576, 0.4627451, 0, 1, 1,
0.594223, -0.190193, 2.96682, 0.4705882, 0, 1, 1,
0.5942694, -2.443717, 1.625337, 0.4745098, 0, 1, 1,
0.5998139, 0.2355508, 1.244448, 0.4823529, 0, 1, 1,
0.600842, 0.1319486, 0.6056021, 0.4862745, 0, 1, 1,
0.6051859, 1.801716, 1.924086, 0.4941176, 0, 1, 1,
0.6061906, -0.06859494, 2.14393, 0.5019608, 0, 1, 1,
0.6146363, -0.03041504, 0.3485923, 0.5058824, 0, 1, 1,
0.6311452, -0.9847319, 2.496258, 0.5137255, 0, 1, 1,
0.6368909, -1.628706, 1.001451, 0.5176471, 0, 1, 1,
0.6393344, 1.064014, 0.198388, 0.5254902, 0, 1, 1,
0.6476642, 0.8581599, 3.121484, 0.5294118, 0, 1, 1,
0.6490031, 0.007730098, 1.091581, 0.5372549, 0, 1, 1,
0.6518546, 1.02431, 0.5132694, 0.5411765, 0, 1, 1,
0.6571211, 0.6409002, -0.1679467, 0.5490196, 0, 1, 1,
0.6582179, 0.1439215, 1.915738, 0.5529412, 0, 1, 1,
0.6606193, 0.2263535, 0.5974593, 0.5607843, 0, 1, 1,
0.661208, 0.4620647, 0.353622, 0.5647059, 0, 1, 1,
0.6630756, 0.3867131, -0.3535851, 0.572549, 0, 1, 1,
0.6633272, 0.5711307, -0.529025, 0.5764706, 0, 1, 1,
0.6643319, 1.449565, 1.116619, 0.5843138, 0, 1, 1,
0.6645822, 0.01564398, 0.3344921, 0.5882353, 0, 1, 1,
0.6660818, -0.1790058, 1.899066, 0.5960785, 0, 1, 1,
0.6699368, 0.1477876, 1.814683, 0.6039216, 0, 1, 1,
0.6702214, 1.352318, 0.2272091, 0.6078432, 0, 1, 1,
0.6707722, 0.05378782, 2.379307, 0.6156863, 0, 1, 1,
0.6732502, -1.176641, 2.102885, 0.6196079, 0, 1, 1,
0.6761728, -0.2791564, 0.1605094, 0.627451, 0, 1, 1,
0.677967, -0.119468, 0.4777673, 0.6313726, 0, 1, 1,
0.6793237, 0.7525296, -0.9854327, 0.6392157, 0, 1, 1,
0.6838111, -0.2532021, 1.565342, 0.6431373, 0, 1, 1,
0.6841087, -1.121885, 0.8222814, 0.6509804, 0, 1, 1,
0.6884195, -0.7942715, 4.510515, 0.654902, 0, 1, 1,
0.6978111, 0.1646137, 1.291815, 0.6627451, 0, 1, 1,
0.7001417, -0.9229255, 3.315015, 0.6666667, 0, 1, 1,
0.7102244, 0.4531327, 1.934366, 0.6745098, 0, 1, 1,
0.7210424, 1.628077, -0.8669836, 0.6784314, 0, 1, 1,
0.7223049, 0.5229263, 0.7368276, 0.6862745, 0, 1, 1,
0.7232084, -0.913305, 1.521947, 0.6901961, 0, 1, 1,
0.7235104, 2.109188, -0.9265265, 0.6980392, 0, 1, 1,
0.724483, -0.4951446, 1.183143, 0.7058824, 0, 1, 1,
0.7284958, 0.2241361, 0.7646081, 0.7098039, 0, 1, 1,
0.7322448, 2.022452, 0.9893331, 0.7176471, 0, 1, 1,
0.7330961, -1.788834, 2.363757, 0.7215686, 0, 1, 1,
0.7348829, -0.5694859, 3.221843, 0.7294118, 0, 1, 1,
0.7377434, -2.656091, 3.095555, 0.7333333, 0, 1, 1,
0.7393086, -0.9088227, 1.88599, 0.7411765, 0, 1, 1,
0.7462784, -1.161703, 2.130512, 0.7450981, 0, 1, 1,
0.7480327, -0.3684483, 1.662691, 0.7529412, 0, 1, 1,
0.7481378, -0.0534974, 1.274433, 0.7568628, 0, 1, 1,
0.758593, 0.1702912, 2.986932, 0.7647059, 0, 1, 1,
0.7737155, 1.157838, 2.196475, 0.7686275, 0, 1, 1,
0.7742108, 1.090219, -0.3725331, 0.7764706, 0, 1, 1,
0.7742289, 2.147688, 1.275023, 0.7803922, 0, 1, 1,
0.7743834, -0.5858495, 1.392018, 0.7882353, 0, 1, 1,
0.7759817, 2.333856, -1.188463, 0.7921569, 0, 1, 1,
0.7777808, 0.4188356, -0.1918626, 0.8, 0, 1, 1,
0.7834035, 1.092596, 0.001619556, 0.8078431, 0, 1, 1,
0.7873709, 0.1520124, 0.4515172, 0.8117647, 0, 1, 1,
0.7880886, -0.1185791, 2.039005, 0.8196079, 0, 1, 1,
0.7927769, -2.127026, 2.08941, 0.8235294, 0, 1, 1,
0.7941242, 1.436159, 0.1813957, 0.8313726, 0, 1, 1,
0.79634, -0.05128992, 1.130822, 0.8352941, 0, 1, 1,
0.7985384, -0.8569556, 0.9451349, 0.8431373, 0, 1, 1,
0.8061984, 2.196843, 2.286803, 0.8470588, 0, 1, 1,
0.8073665, 0.05066441, 2.644698, 0.854902, 0, 1, 1,
0.8081973, -0.0492924, 2.069216, 0.8588235, 0, 1, 1,
0.8110829, -2.607805, 2.540719, 0.8666667, 0, 1, 1,
0.8118366, 0.6199133, 2.092928, 0.8705882, 0, 1, 1,
0.8177688, -1.091128, 1.113979, 0.8784314, 0, 1, 1,
0.8198943, -0.0252272, 2.470885, 0.8823529, 0, 1, 1,
0.8251466, 1.639557, 0.286357, 0.8901961, 0, 1, 1,
0.8351391, -0.6196403, 0.7360615, 0.8941177, 0, 1, 1,
0.8402027, -0.7064148, 2.686578, 0.9019608, 0, 1, 1,
0.8422395, -0.2812688, 1.197825, 0.9098039, 0, 1, 1,
0.8440308, 0.6863413, 0.8677276, 0.9137255, 0, 1, 1,
0.8476288, -1.508753, 3.361045, 0.9215686, 0, 1, 1,
0.861565, 1.856879, -0.06760839, 0.9254902, 0, 1, 1,
0.8678574, -0.3974679, 3.222075, 0.9333333, 0, 1, 1,
0.878831, -0.4349054, 1.141593, 0.9372549, 0, 1, 1,
0.880258, -2.071945, 2.831436, 0.945098, 0, 1, 1,
0.8878168, 0.9790217, 0.6369109, 0.9490196, 0, 1, 1,
0.8933105, -0.3286378, 0.6685178, 0.9568627, 0, 1, 1,
0.8936395, 0.2706285, 1.697247, 0.9607843, 0, 1, 1,
0.8973497, 0.08004096, 0.2345026, 0.9686275, 0, 1, 1,
0.9027244, 1.063149, 1.491362, 0.972549, 0, 1, 1,
0.9033771, 1.240969, 0.9126468, 0.9803922, 0, 1, 1,
0.9096862, -2.441992, 4.05897, 0.9843137, 0, 1, 1,
0.9133282, 0.6917226, 0.7541494, 0.9921569, 0, 1, 1,
0.91595, -0.1959976, 1.635996, 0.9960784, 0, 1, 1,
0.9188151, -1.042779, 0.6174417, 1, 0, 0.9960784, 1,
0.9213323, 0.3401231, 0.1039967, 1, 0, 0.9882353, 1,
0.9292735, 0.1265403, 2.026936, 1, 0, 0.9843137, 1,
0.9329849, -1.083998, 1.166878, 1, 0, 0.9764706, 1,
0.9409115, 0.03663219, 2.787635, 1, 0, 0.972549, 1,
0.9423021, 0.3055665, -1.217546, 1, 0, 0.9647059, 1,
0.9457529, -0.6403058, 1.500388, 1, 0, 0.9607843, 1,
0.9503442, 1.448693, 1.799518, 1, 0, 0.9529412, 1,
0.958012, 1.394676, 1.310157, 1, 0, 0.9490196, 1,
0.9583402, -1.354592, 3.688259, 1, 0, 0.9411765, 1,
0.9638115, -0.571224, 2.078923, 1, 0, 0.9372549, 1,
0.9704695, 0.8069948, -0.9124454, 1, 0, 0.9294118, 1,
0.9717245, -0.5385072, 3.124815, 1, 0, 0.9254902, 1,
0.9780494, 0.2711109, 1.672195, 1, 0, 0.9176471, 1,
0.9813423, -0.2532906, 0.9031644, 1, 0, 0.9137255, 1,
0.9825118, -0.393416, 1.614849, 1, 0, 0.9058824, 1,
0.9835522, -0.6492399, 1.074741, 1, 0, 0.9019608, 1,
0.9837499, 1.174193, 0.5303238, 1, 0, 0.8941177, 1,
0.9849305, 0.9212812, 2.044751, 1, 0, 0.8862745, 1,
0.9869874, 0.8527743, 1.418823, 1, 0, 0.8823529, 1,
1.001427, -0.1659385, 0.9370965, 1, 0, 0.8745098, 1,
1.002496, 0.2194416, 0.5098293, 1, 0, 0.8705882, 1,
1.005822, -1.237265, 1.404168, 1, 0, 0.8627451, 1,
1.009457, -0.02053165, 0.6196492, 1, 0, 0.8588235, 1,
1.018546, 1.105735, -0.02602927, 1, 0, 0.8509804, 1,
1.028726, -2.604141, 1.57523, 1, 0, 0.8470588, 1,
1.030364, 1.894733, -0.05167604, 1, 0, 0.8392157, 1,
1.030949, 1.29987, 2.44131, 1, 0, 0.8352941, 1,
1.031222, 1.146739, -0.01396496, 1, 0, 0.827451, 1,
1.031841, 0.5575153, 0.9053972, 1, 0, 0.8235294, 1,
1.04048, 0.7366585, 0.9023727, 1, 0, 0.8156863, 1,
1.041415, -0.2550271, 0.9141477, 1, 0, 0.8117647, 1,
1.050182, 0.7857716, -0.3717767, 1, 0, 0.8039216, 1,
1.05032, -0.3703485, 2.196832, 1, 0, 0.7960784, 1,
1.052078, -0.3426905, 1.368509, 1, 0, 0.7921569, 1,
1.05743, -1.220321, 2.329905, 1, 0, 0.7843137, 1,
1.061026, 0.01277255, 2.630513, 1, 0, 0.7803922, 1,
1.065633, -0.3516261, 0.9267858, 1, 0, 0.772549, 1,
1.074264, -1.393278, 3.139909, 1, 0, 0.7686275, 1,
1.074466, -0.4191979, 2.444103, 1, 0, 0.7607843, 1,
1.077944, 0.2744974, -0.3740926, 1, 0, 0.7568628, 1,
1.078064, 0.3343985, 2.171522, 1, 0, 0.7490196, 1,
1.080404, 0.007226664, 1.239237, 1, 0, 0.7450981, 1,
1.082233, -1.546424, 2.071565, 1, 0, 0.7372549, 1,
1.089427, -0.7250181, 1.617549, 1, 0, 0.7333333, 1,
1.105318, 0.2702825, 4.308849, 1, 0, 0.7254902, 1,
1.118264, -0.8981107, 2.489824, 1, 0, 0.7215686, 1,
1.128051, -1.54641, 2.427851, 1, 0, 0.7137255, 1,
1.128737, -1.017365, 2.8643, 1, 0, 0.7098039, 1,
1.141306, -0.6764349, 1.789959, 1, 0, 0.7019608, 1,
1.143395, 0.535274, 1.634055, 1, 0, 0.6941177, 1,
1.146114, 1.792231, -0.4211971, 1, 0, 0.6901961, 1,
1.151611, 1.913853, 0.1985934, 1, 0, 0.682353, 1,
1.152553, 0.4578862, 1.740769, 1, 0, 0.6784314, 1,
1.153325, -0.4372961, 1.556981, 1, 0, 0.6705883, 1,
1.156739, -0.09448513, 3.662474, 1, 0, 0.6666667, 1,
1.158273, 1.662259, 0.3357391, 1, 0, 0.6588235, 1,
1.163028, 0.5931148, 2.237833, 1, 0, 0.654902, 1,
1.165756, -0.4557157, 1.27308, 1, 0, 0.6470588, 1,
1.173983, -1.426304, 3.170834, 1, 0, 0.6431373, 1,
1.189051, -1.364598, 2.324911, 1, 0, 0.6352941, 1,
1.192203, 0.6307821, 1.689219, 1, 0, 0.6313726, 1,
1.196385, 0.6198094, 1.839636, 1, 0, 0.6235294, 1,
1.198024, 0.9235715, 0.7137682, 1, 0, 0.6196079, 1,
1.202175, -0.9899884, 2.039044, 1, 0, 0.6117647, 1,
1.208141, 0.4789089, 1.9123, 1, 0, 0.6078432, 1,
1.213197, -0.117629, 2.899042, 1, 0, 0.6, 1,
1.21447, -0.3998823, 1.550375, 1, 0, 0.5921569, 1,
1.215604, 0.3407081, 0.2116442, 1, 0, 0.5882353, 1,
1.217162, -0.8281843, 2.06676, 1, 0, 0.5803922, 1,
1.219877, 0.9064814, 0.5211585, 1, 0, 0.5764706, 1,
1.22313, 0.6172346, -0.1590369, 1, 0, 0.5686275, 1,
1.229594, -0.132279, 0.9727655, 1, 0, 0.5647059, 1,
1.233852, 0.03153407, 2.76417, 1, 0, 0.5568628, 1,
1.235715, -0.1517642, 3.256512, 1, 0, 0.5529412, 1,
1.236404, -0.202007, 1.727093, 1, 0, 0.5450981, 1,
1.252663, -0.6230487, 2.033383, 1, 0, 0.5411765, 1,
1.255356, 1.319935, 2.986399, 1, 0, 0.5333334, 1,
1.258525, 0.7164019, 1.111401, 1, 0, 0.5294118, 1,
1.263668, -0.3269477, 1.449304, 1, 0, 0.5215687, 1,
1.269645, -1.863563, 4.533795, 1, 0, 0.5176471, 1,
1.273223, -0.2019466, 1.254237, 1, 0, 0.509804, 1,
1.279161, 1.400033, 0.6733811, 1, 0, 0.5058824, 1,
1.285639, -0.009607831, 0.02361446, 1, 0, 0.4980392, 1,
1.286874, 0.8914684, 0.7104481, 1, 0, 0.4901961, 1,
1.288559, 0.5576212, 2.419087, 1, 0, 0.4862745, 1,
1.304566, -1.20238, 2.334919, 1, 0, 0.4784314, 1,
1.312383, -2.51974, 2.424207, 1, 0, 0.4745098, 1,
1.313492, -1.360502, 4.56979, 1, 0, 0.4666667, 1,
1.316632, 0.9752828, 0.07351686, 1, 0, 0.4627451, 1,
1.327915, 0.04491597, 2.389045, 1, 0, 0.454902, 1,
1.336411, -0.4715284, 1.637979, 1, 0, 0.4509804, 1,
1.339291, -0.5502619, 1.561317, 1, 0, 0.4431373, 1,
1.339401, 0.3578729, 0.6107874, 1, 0, 0.4392157, 1,
1.346595, -0.3192727, 0.3830526, 1, 0, 0.4313726, 1,
1.369335, -1.247337, 2.333362, 1, 0, 0.427451, 1,
1.397028, 0.4529712, 2.041731, 1, 0, 0.4196078, 1,
1.409873, 1.657668, 0.05989927, 1, 0, 0.4156863, 1,
1.439698, -0.04041531, 3.047929, 1, 0, 0.4078431, 1,
1.449864, -0.951481, 1.941284, 1, 0, 0.4039216, 1,
1.456256, -0.9492686, 4.072102, 1, 0, 0.3960784, 1,
1.466996, -1.100893, 1.868601, 1, 0, 0.3882353, 1,
1.482625, 0.9271272, 1.566111, 1, 0, 0.3843137, 1,
1.487364, -0.836724, 3.59006, 1, 0, 0.3764706, 1,
1.500354, 1.173402, 1.550969, 1, 0, 0.372549, 1,
1.501595, -0.02308262, 0.4185372, 1, 0, 0.3647059, 1,
1.502461, -0.07624885, 2.394382, 1, 0, 0.3607843, 1,
1.505155, -0.3769021, 2.291603, 1, 0, 0.3529412, 1,
1.508426, -1.095714, 3.340458, 1, 0, 0.3490196, 1,
1.521671, 0.6179981, 1.569013, 1, 0, 0.3411765, 1,
1.531401, -0.5576934, 3.412946, 1, 0, 0.3372549, 1,
1.532754, 0.9306833, 0.0610019, 1, 0, 0.3294118, 1,
1.536755, 0.3718237, 2.014938, 1, 0, 0.3254902, 1,
1.553438, 0.0436171, 3.146721, 1, 0, 0.3176471, 1,
1.556, -0.8085424, 3.703497, 1, 0, 0.3137255, 1,
1.562933, 1.294218, -0.1880632, 1, 0, 0.3058824, 1,
1.569205, 1.390491, -0.6962132, 1, 0, 0.2980392, 1,
1.574343, -2.151441, 1.117093, 1, 0, 0.2941177, 1,
1.579022, -1.231796, 4.024908, 1, 0, 0.2862745, 1,
1.584165, 0.1440997, -0.5766444, 1, 0, 0.282353, 1,
1.591464, 0.05563016, 1.985411, 1, 0, 0.2745098, 1,
1.597796, 1.085326, -0.7689227, 1, 0, 0.2705882, 1,
1.606107, 0.3599789, 2.739517, 1, 0, 0.2627451, 1,
1.610023, -2.620103, 2.748645, 1, 0, 0.2588235, 1,
1.613312, 0.1273837, 2.402036, 1, 0, 0.2509804, 1,
1.62483, 0.08374591, 0.808542, 1, 0, 0.2470588, 1,
1.626464, 0.8442515, 1.535169, 1, 0, 0.2392157, 1,
1.635602, -0.01945994, 0.7861335, 1, 0, 0.2352941, 1,
1.643756, -0.6284024, 1.265625, 1, 0, 0.227451, 1,
1.646632, 0.0282341, 2.017741, 1, 0, 0.2235294, 1,
1.668069, -0.4696284, 2.518882, 1, 0, 0.2156863, 1,
1.669375, -1.564165, 2.848605, 1, 0, 0.2117647, 1,
1.672114, 0.7562073, 2.269617, 1, 0, 0.2039216, 1,
1.694856, -0.9589908, 1.257608, 1, 0, 0.1960784, 1,
1.715122, 0.5683011, 0.444789, 1, 0, 0.1921569, 1,
1.724836, 0.7814976, 0.711879, 1, 0, 0.1843137, 1,
1.743558, -0.9274739, 3.127952, 1, 0, 0.1803922, 1,
1.745131, 0.2914092, 3.580353, 1, 0, 0.172549, 1,
1.745231, 0.3110865, 1.522582, 1, 0, 0.1686275, 1,
1.756266, 0.3142002, 0.8313642, 1, 0, 0.1607843, 1,
1.766943, -0.7993292, 2.775185, 1, 0, 0.1568628, 1,
1.798822, 0.3802611, 1.177952, 1, 0, 0.1490196, 1,
1.842329, -0.8125595, 1.683184, 1, 0, 0.145098, 1,
1.865548, 1.812907, 0.3124302, 1, 0, 0.1372549, 1,
1.880121, -0.4165649, -0.6211284, 1, 0, 0.1333333, 1,
1.909948, 0.440171, 0.5830438, 1, 0, 0.1254902, 1,
1.922339, 0.2634353, -0.04832254, 1, 0, 0.1215686, 1,
1.954817, -0.3391949, 2.976762, 1, 0, 0.1137255, 1,
1.965136, -0.5555739, 3.632943, 1, 0, 0.1098039, 1,
1.980424, -0.9271168, 2.548217, 1, 0, 0.1019608, 1,
1.990265, 0.5681859, 1.293363, 1, 0, 0.09411765, 1,
2.011504, -0.9837326, 2.690449, 1, 0, 0.09019608, 1,
2.025737, 0.06429685, 0.5407498, 1, 0, 0.08235294, 1,
2.090853, 1.65186, -0.02252455, 1, 0, 0.07843138, 1,
2.137249, -0.1841362, 2.96522, 1, 0, 0.07058824, 1,
2.157042, -1.106643, 1.244535, 1, 0, 0.06666667, 1,
2.159343, 0.7736738, 1.695332, 1, 0, 0.05882353, 1,
2.16498, -0.08218709, 1.403887, 1, 0, 0.05490196, 1,
2.183147, -0.5211798, 2.268981, 1, 0, 0.04705882, 1,
2.450255, -0.9589751, 1.137344, 1, 0, 0.04313726, 1,
2.524778, 0.04695767, 1.168661, 1, 0, 0.03529412, 1,
2.573486, -0.1267396, -0.1396386, 1, 0, 0.03137255, 1,
2.684457, -0.3025905, 0.1952752, 1, 0, 0.02352941, 1,
2.706255, 0.006980062, 2.444787, 1, 0, 0.01960784, 1,
2.8453, 1.29448, 1.272139, 1, 0, 0.01176471, 1,
2.85113, -0.3794037, 3.52661, 1, 0, 0.007843138, 1
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
0.07736492, -3.703952, -7.79073, 0, -0.5, 0.5, 0.5,
0.07736492, -3.703952, -7.79073, 1, -0.5, 0.5, 0.5,
0.07736492, -3.703952, -7.79073, 1, 1.5, 0.5, 0.5,
0.07736492, -3.703952, -7.79073, 0, 1.5, 0.5, 0.5
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
-3.636707, -0.1816024, -7.79073, 0, -0.5, 0.5, 0.5,
-3.636707, -0.1816024, -7.79073, 1, -0.5, 0.5, 0.5,
-3.636707, -0.1816024, -7.79073, 1, 1.5, 0.5, 0.5,
-3.636707, -0.1816024, -7.79073, 0, 1.5, 0.5, 0.5
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
-3.636707, -3.703952, -0.3477025, 0, -0.5, 0.5, 0.5,
-3.636707, -3.703952, -0.3477025, 1, -0.5, 0.5, 0.5,
-3.636707, -3.703952, -0.3477025, 1, 1.5, 0.5, 0.5,
-3.636707, -3.703952, -0.3477025, 0, 1.5, 0.5, 0.5
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
-2, -2.891102, -6.073108,
2, -2.891102, -6.073108,
-2, -2.891102, -6.073108,
-2, -3.026577, -6.359378,
-1, -2.891102, -6.073108,
-1, -3.026577, -6.359378,
0, -2.891102, -6.073108,
0, -3.026577, -6.359378,
1, -2.891102, -6.073108,
1, -3.026577, -6.359378,
2, -2.891102, -6.073108,
2, -3.026577, -6.359378
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
-2, -3.297527, -6.931919, 0, -0.5, 0.5, 0.5,
-2, -3.297527, -6.931919, 1, -0.5, 0.5, 0.5,
-2, -3.297527, -6.931919, 1, 1.5, 0.5, 0.5,
-2, -3.297527, -6.931919, 0, 1.5, 0.5, 0.5,
-1, -3.297527, -6.931919, 0, -0.5, 0.5, 0.5,
-1, -3.297527, -6.931919, 1, -0.5, 0.5, 0.5,
-1, -3.297527, -6.931919, 1, 1.5, 0.5, 0.5,
-1, -3.297527, -6.931919, 0, 1.5, 0.5, 0.5,
0, -3.297527, -6.931919, 0, -0.5, 0.5, 0.5,
0, -3.297527, -6.931919, 1, -0.5, 0.5, 0.5,
0, -3.297527, -6.931919, 1, 1.5, 0.5, 0.5,
0, -3.297527, -6.931919, 0, 1.5, 0.5, 0.5,
1, -3.297527, -6.931919, 0, -0.5, 0.5, 0.5,
1, -3.297527, -6.931919, 1, -0.5, 0.5, 0.5,
1, -3.297527, -6.931919, 1, 1.5, 0.5, 0.5,
1, -3.297527, -6.931919, 0, 1.5, 0.5, 0.5,
2, -3.297527, -6.931919, 0, -0.5, 0.5, 0.5,
2, -3.297527, -6.931919, 1, -0.5, 0.5, 0.5,
2, -3.297527, -6.931919, 1, 1.5, 0.5, 0.5,
2, -3.297527, -6.931919, 0, 1.5, 0.5, 0.5
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
-2.779613, -2, -6.073108,
-2.779613, 2, -6.073108,
-2.779613, -2, -6.073108,
-2.922462, -2, -6.359378,
-2.779613, -1, -6.073108,
-2.922462, -1, -6.359378,
-2.779613, 0, -6.073108,
-2.922462, 0, -6.359378,
-2.779613, 1, -6.073108,
-2.922462, 1, -6.359378,
-2.779613, 2, -6.073108,
-2.922462, 2, -6.359378
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
-3.20816, -2, -6.931919, 0, -0.5, 0.5, 0.5,
-3.20816, -2, -6.931919, 1, -0.5, 0.5, 0.5,
-3.20816, -2, -6.931919, 1, 1.5, 0.5, 0.5,
-3.20816, -2, -6.931919, 0, 1.5, 0.5, 0.5,
-3.20816, -1, -6.931919, 0, -0.5, 0.5, 0.5,
-3.20816, -1, -6.931919, 1, -0.5, 0.5, 0.5,
-3.20816, -1, -6.931919, 1, 1.5, 0.5, 0.5,
-3.20816, -1, -6.931919, 0, 1.5, 0.5, 0.5,
-3.20816, 0, -6.931919, 0, -0.5, 0.5, 0.5,
-3.20816, 0, -6.931919, 1, -0.5, 0.5, 0.5,
-3.20816, 0, -6.931919, 1, 1.5, 0.5, 0.5,
-3.20816, 0, -6.931919, 0, 1.5, 0.5, 0.5,
-3.20816, 1, -6.931919, 0, -0.5, 0.5, 0.5,
-3.20816, 1, -6.931919, 1, -0.5, 0.5, 0.5,
-3.20816, 1, -6.931919, 1, 1.5, 0.5, 0.5,
-3.20816, 1, -6.931919, 0, 1.5, 0.5, 0.5,
-3.20816, 2, -6.931919, 0, -0.5, 0.5, 0.5,
-3.20816, 2, -6.931919, 1, -0.5, 0.5, 0.5,
-3.20816, 2, -6.931919, 1, 1.5, 0.5, 0.5,
-3.20816, 2, -6.931919, 0, 1.5, 0.5, 0.5
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
-2.779613, -2.891102, -4,
-2.779613, -2.891102, 4,
-2.779613, -2.891102, -4,
-2.922462, -3.026577, -4,
-2.779613, -2.891102, -2,
-2.922462, -3.026577, -2,
-2.779613, -2.891102, 0,
-2.922462, -3.026577, 0,
-2.779613, -2.891102, 2,
-2.922462, -3.026577, 2,
-2.779613, -2.891102, 4,
-2.922462, -3.026577, 4
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
-3.20816, -3.297527, -4, 0, -0.5, 0.5, 0.5,
-3.20816, -3.297527, -4, 1, -0.5, 0.5, 0.5,
-3.20816, -3.297527, -4, 1, 1.5, 0.5, 0.5,
-3.20816, -3.297527, -4, 0, 1.5, 0.5, 0.5,
-3.20816, -3.297527, -2, 0, -0.5, 0.5, 0.5,
-3.20816, -3.297527, -2, 1, -0.5, 0.5, 0.5,
-3.20816, -3.297527, -2, 1, 1.5, 0.5, 0.5,
-3.20816, -3.297527, -2, 0, 1.5, 0.5, 0.5,
-3.20816, -3.297527, 0, 0, -0.5, 0.5, 0.5,
-3.20816, -3.297527, 0, 1, -0.5, 0.5, 0.5,
-3.20816, -3.297527, 0, 1, 1.5, 0.5, 0.5,
-3.20816, -3.297527, 0, 0, 1.5, 0.5, 0.5,
-3.20816, -3.297527, 2, 0, -0.5, 0.5, 0.5,
-3.20816, -3.297527, 2, 1, -0.5, 0.5, 0.5,
-3.20816, -3.297527, 2, 1, 1.5, 0.5, 0.5,
-3.20816, -3.297527, 2, 0, 1.5, 0.5, 0.5,
-3.20816, -3.297527, 4, 0, -0.5, 0.5, 0.5,
-3.20816, -3.297527, 4, 1, -0.5, 0.5, 0.5,
-3.20816, -3.297527, 4, 1, 1.5, 0.5, 0.5,
-3.20816, -3.297527, 4, 0, 1.5, 0.5, 0.5
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
-2.779613, -2.891102, -6.073108,
-2.779613, 2.527897, -6.073108,
-2.779613, -2.891102, 5.377703,
-2.779613, 2.527897, 5.377703,
-2.779613, -2.891102, -6.073108,
-2.779613, -2.891102, 5.377703,
-2.779613, 2.527897, -6.073108,
-2.779613, 2.527897, 5.377703,
-2.779613, -2.891102, -6.073108,
2.934343, -2.891102, -6.073108,
-2.779613, -2.891102, 5.377703,
2.934343, -2.891102, 5.377703,
-2.779613, 2.527897, -6.073108,
2.934343, 2.527897, -6.073108,
-2.779613, 2.527897, 5.377703,
2.934343, 2.527897, 5.377703,
2.934343, -2.891102, -6.073108,
2.934343, 2.527897, -6.073108,
2.934343, -2.891102, 5.377703,
2.934343, 2.527897, 5.377703,
2.934343, -2.891102, -6.073108,
2.934343, -2.891102, 5.377703,
2.934343, 2.527897, -6.073108,
2.934343, 2.527897, 5.377703
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
var radius = 7.420907;
var distance = 33.01645;
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
mvMatrix.translate( -0.07736492, 0.1816024, 0.3477025 );
mvMatrix.scale( 1.404216, 1.480648, 0.7007041 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.01645);
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
Endrin<-read.table("Endrin.xyz")
```

```
## Error in read.table("Endrin.xyz"): no lines available in input
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
-2.6964, 0.9166809, -2.007591, 0, 0, 1, 1, 1,
-2.480374, -0.9346049, -1.468551, 1, 0, 0, 1, 1,
-2.421685, -0.7408391, -0.4796796, 1, 0, 0, 1, 1,
-2.352726, 0.2734313, -2.671538, 1, 0, 0, 1, 1,
-2.306914, 0.3975356, -2.381009, 1, 0, 0, 1, 1,
-2.279669, -0.2470595, -2.982579, 1, 0, 0, 1, 1,
-2.255658, -0.4002547, -1.541012, 0, 0, 0, 1, 1,
-2.232654, 0.3018452, -0.7832906, 0, 0, 0, 1, 1,
-2.220137, -0.2366967, -1.616464, 0, 0, 0, 1, 1,
-2.209176, 0.3829596, 0.4800747, 0, 0, 0, 1, 1,
-2.181759, -0.9984341, -2.099306, 0, 0, 0, 1, 1,
-2.114684, 1.193684, -0.7149587, 0, 0, 0, 1, 1,
-2.112104, 2.338376, -1.407295, 0, 0, 0, 1, 1,
-2.038401, -0.5100144, -2.537049, 1, 1, 1, 1, 1,
-2.032683, 0.6640781, -0.02698022, 1, 1, 1, 1, 1,
-2.010633, -0.06833437, -0.9839713, 1, 1, 1, 1, 1,
-1.962953, 0.7756174, 0.3230205, 1, 1, 1, 1, 1,
-1.934613, -0.1365092, -1.309136, 1, 1, 1, 1, 1,
-1.929031, -0.4453024, -3.242195, 1, 1, 1, 1, 1,
-1.919738, -0.3153852, -2.691518, 1, 1, 1, 1, 1,
-1.899941, 0.4128233, -1.157921, 1, 1, 1, 1, 1,
-1.896197, -0.1483358, -1.222432, 1, 1, 1, 1, 1,
-1.859646, 0.2509532, -0.7113394, 1, 1, 1, 1, 1,
-1.83692, -0.995878, -1.861748, 1, 1, 1, 1, 1,
-1.801376, -0.697554, -0.9070821, 1, 1, 1, 1, 1,
-1.794135, -1.41126, -1.311242, 1, 1, 1, 1, 1,
-1.790034, -1.084085, -0.68479, 1, 1, 1, 1, 1,
-1.756852, 0.1395016, -1.984485, 1, 1, 1, 1, 1,
-1.742331, 0.01133874, -2.937501, 0, 0, 1, 1, 1,
-1.730819, 0.8739541, -2.304338, 1, 0, 0, 1, 1,
-1.724357, -0.7227108, -1.356561, 1, 0, 0, 1, 1,
-1.720821, 0.08105177, -1.462597, 1, 0, 0, 1, 1,
-1.719778, 0.06274948, -2.304855, 1, 0, 0, 1, 1,
-1.70565, -0.5748442, -2.059341, 1, 0, 0, 1, 1,
-1.705445, -1.498935, -2.502308, 0, 0, 0, 1, 1,
-1.701991, 0.1029143, -1.964835, 0, 0, 0, 1, 1,
-1.688648, 1.700837, -1.189803, 0, 0, 0, 1, 1,
-1.679592, -1.026589, -1.212408, 0, 0, 0, 1, 1,
-1.664114, 0.7662354, 0.09363441, 0, 0, 0, 1, 1,
-1.658865, 1.986112, 0.2737464, 0, 0, 0, 1, 1,
-1.65828, 0.256383, -1.91196, 0, 0, 0, 1, 1,
-1.657449, -0.4136264, -3.803662, 1, 1, 1, 1, 1,
-1.633166, 0.6946793, 0.5041097, 1, 1, 1, 1, 1,
-1.593654, 1.045009, 0.352695, 1, 1, 1, 1, 1,
-1.589333, 0.5961462, -1.857662, 1, 1, 1, 1, 1,
-1.577961, -0.3937988, -3.34801, 1, 1, 1, 1, 1,
-1.574133, -0.3865131, -0.9756549, 1, 1, 1, 1, 1,
-1.560339, -0.3013541, -3.39929, 1, 1, 1, 1, 1,
-1.548532, 0.9149963, -0.7855999, 1, 1, 1, 1, 1,
-1.544994, 0.2831424, -0.4076166, 1, 1, 1, 1, 1,
-1.534527, 2.299653, 1.187457, 1, 1, 1, 1, 1,
-1.532088, 0.4302018, -1.861694, 1, 1, 1, 1, 1,
-1.524521, -0.3113627, -2.06703, 1, 1, 1, 1, 1,
-1.514957, -0.1244008, -1.023178, 1, 1, 1, 1, 1,
-1.511524, -0.935974, -2.113815, 1, 1, 1, 1, 1,
-1.510128, 0.2730977, -2.343306, 1, 1, 1, 1, 1,
-1.507427, -0.8667744, -1.366126, 0, 0, 1, 1, 1,
-1.505236, 0.5703016, -1.614764, 1, 0, 0, 1, 1,
-1.501104, -1.893839, -2.737207, 1, 0, 0, 1, 1,
-1.499364, 0.03595282, -1.403276, 1, 0, 0, 1, 1,
-1.487617, 0.7858207, -2.589659, 1, 0, 0, 1, 1,
-1.471235, 1.358724, -2.816739, 1, 0, 0, 1, 1,
-1.456182, -0.7845811, -1.20268, 0, 0, 0, 1, 1,
-1.446866, -0.05313399, -1.46334, 0, 0, 0, 1, 1,
-1.439676, -1.348687, -1.164749, 0, 0, 0, 1, 1,
-1.429238, 0.02849923, -0.9885932, 0, 0, 0, 1, 1,
-1.422831, 0.8935629, -0.6083034, 0, 0, 0, 1, 1,
-1.422383, -2.203428, -2.910087, 0, 0, 0, 1, 1,
-1.416085, 0.6555039, -1.424281, 0, 0, 0, 1, 1,
-1.414121, -2.383383, -3.827792, 1, 1, 1, 1, 1,
-1.409323, 1.977907, 0.01348758, 1, 1, 1, 1, 1,
-1.404919, -0.2919362, -2.024084, 1, 1, 1, 1, 1,
-1.401716, -0.5808671, -2.348494, 1, 1, 1, 1, 1,
-1.401515, -1.009675, -1.957374, 1, 1, 1, 1, 1,
-1.398034, -0.3781887, -1.83747, 1, 1, 1, 1, 1,
-1.395101, -0.2421399, -2.006028, 1, 1, 1, 1, 1,
-1.391077, -1.467082, -2.927058, 1, 1, 1, 1, 1,
-1.389646, -0.4090686, -2.597252, 1, 1, 1, 1, 1,
-1.38404, 0.0764072, -1.494296, 1, 1, 1, 1, 1,
-1.380571, 0.5573232, -1.133541, 1, 1, 1, 1, 1,
-1.378574, -0.3821128, -2.269395, 1, 1, 1, 1, 1,
-1.363426, -1.02775, -4.129928, 1, 1, 1, 1, 1,
-1.354013, 0.7665541, -0.8148845, 1, 1, 1, 1, 1,
-1.349065, -1.647496, -2.994547, 1, 1, 1, 1, 1,
-1.348101, 0.6633695, -1.588583, 0, 0, 1, 1, 1,
-1.334703, 0.4847221, -0.2717881, 1, 0, 0, 1, 1,
-1.325379, 1.206696, -2.391836, 1, 0, 0, 1, 1,
-1.32413, -0.4704213, -3.159311, 1, 0, 0, 1, 1,
-1.31707, -2.088436, -1.127218, 1, 0, 0, 1, 1,
-1.310702, -1.523346, -1.735325, 1, 0, 0, 1, 1,
-1.30619, -0.6148742, -2.668136, 0, 0, 0, 1, 1,
-1.304719, 0.07223324, -2.872088, 0, 0, 0, 1, 1,
-1.302126, 1.45864, -0.2552649, 0, 0, 0, 1, 1,
-1.299212, -1.016294, -2.742402, 0, 0, 0, 1, 1,
-1.29737, -0.8901849, -3.480254, 0, 0, 0, 1, 1,
-1.295869, 0.120924, -0.212121, 0, 0, 0, 1, 1,
-1.295202, 0.09583496, -2.299599, 0, 0, 0, 1, 1,
-1.291808, 0.08267234, -0.7670197, 1, 1, 1, 1, 1,
-1.287084, 0.0540391, 0.9788184, 1, 1, 1, 1, 1,
-1.286931, 1.18973, -0.597111, 1, 1, 1, 1, 1,
-1.283706, 0.3837269, -1.363349, 1, 1, 1, 1, 1,
-1.280785, -0.7911752, -2.589264, 1, 1, 1, 1, 1,
-1.27847, -0.6816049, -1.840295, 1, 1, 1, 1, 1,
-1.250334, 0.3266875, -0.2851588, 1, 1, 1, 1, 1,
-1.24641, 1.633691, -1.547087, 1, 1, 1, 1, 1,
-1.244387, 0.6499189, -2.870048, 1, 1, 1, 1, 1,
-1.236809, 0.3367881, -1.445839, 1, 1, 1, 1, 1,
-1.236786, 0.4578422, -2.061011, 1, 1, 1, 1, 1,
-1.229428, -0.8414142, -2.18241, 1, 1, 1, 1, 1,
-1.228911, 0.6054967, -2.149211, 1, 1, 1, 1, 1,
-1.224853, -0.6490634, -2.423238, 1, 1, 1, 1, 1,
-1.219744, 0.1391741, -0.997236, 1, 1, 1, 1, 1,
-1.218485, 0.2795578, -0.4469009, 0, 0, 1, 1, 1,
-1.215611, -1.113569, -2.752423, 1, 0, 0, 1, 1,
-1.209126, -0.4279052, -2.807259, 1, 0, 0, 1, 1,
-1.197327, 0.8532833, -0.08580203, 1, 0, 0, 1, 1,
-1.195771, -0.7501951, -2.980047, 1, 0, 0, 1, 1,
-1.193782, -0.6031136, -1.185761, 1, 0, 0, 1, 1,
-1.175701, 1.122358, -1.917913, 0, 0, 0, 1, 1,
-1.154504, -0.04761492, -0.9119391, 0, 0, 0, 1, 1,
-1.15286, 0.1357502, -1.840688, 0, 0, 0, 1, 1,
-1.152365, 0.9358469, 0.3644144, 0, 0, 0, 1, 1,
-1.145665, 1.443199, -1.236336, 0, 0, 0, 1, 1,
-1.133879, 2.336411, 0.001010142, 0, 0, 0, 1, 1,
-1.13213, -0.9985741, -1.702449, 0, 0, 0, 1, 1,
-1.128319, -1.026627, -2.932865, 1, 1, 1, 1, 1,
-1.122546, 0.7267873, -0.7895562, 1, 1, 1, 1, 1,
-1.115692, -0.1364943, -2.077284, 1, 1, 1, 1, 1,
-1.099041, 0.335725, -1.927752, 1, 1, 1, 1, 1,
-1.097715, 0.3676046, -1.588499, 1, 1, 1, 1, 1,
-1.0948, -0.2152803, -2.111138, 1, 1, 1, 1, 1,
-1.091756, -0.09323901, -2.078738, 1, 1, 1, 1, 1,
-1.085714, -0.4694929, -2.44511, 1, 1, 1, 1, 1,
-1.084132, -2.631418, -2.522444, 1, 1, 1, 1, 1,
-1.077124, -0.1473567, -1.442977, 1, 1, 1, 1, 1,
-1.075214, 0.7995562, -2.489359, 1, 1, 1, 1, 1,
-1.073219, -0.5844662, -2.102566, 1, 1, 1, 1, 1,
-1.068966, 0.7514039, -0.04709405, 1, 1, 1, 1, 1,
-1.062406, -0.6966169, -2.850048, 1, 1, 1, 1, 1,
-1.061838, -0.1561462, -0.9824545, 1, 1, 1, 1, 1,
-1.055245, -0.801898, -4.013731, 0, 0, 1, 1, 1,
-1.050587, -0.1637942, -0.4495778, 1, 0, 0, 1, 1,
-1.04886, -0.398575, -5.09808, 1, 0, 0, 1, 1,
-1.047597, -0.1319326, -1.783134, 1, 0, 0, 1, 1,
-1.047407, -0.4181453, -2.826221, 1, 0, 0, 1, 1,
-1.044122, -1.289721, -2.857896, 1, 0, 0, 1, 1,
-1.043241, 0.9015945, -0.4865408, 0, 0, 0, 1, 1,
-1.035856, -0.2675948, -1.213411, 0, 0, 0, 1, 1,
-1.035767, -2.347152, -2.119523, 0, 0, 0, 1, 1,
-1.030428, 0.2697975, -3.033245, 0, 0, 0, 1, 1,
-1.02685, -0.9857247, -2.175374, 0, 0, 0, 1, 1,
-1.025937, -1.4359, -2.874857, 0, 0, 0, 1, 1,
-1.017647, -0.9741633, -0.9136708, 0, 0, 0, 1, 1,
-1.015491, -0.2838334, -2.542583, 1, 1, 1, 1, 1,
-1.015246, -0.3501545, -0.3518823, 1, 1, 1, 1, 1,
-1.014981, -0.1727502, -1.434873, 1, 1, 1, 1, 1,
-1.008431, -0.5897672, -1.904863, 1, 1, 1, 1, 1,
-1.007568, -0.5282719, -2.606907, 1, 1, 1, 1, 1,
-1.006117, -0.1014572, 0.9548103, 1, 1, 1, 1, 1,
-1.001915, -0.1078163, -2.868382, 1, 1, 1, 1, 1,
-1.001177, 1.334075, -1.096536, 1, 1, 1, 1, 1,
-0.9995313, -0.168585, -2.53203, 1, 1, 1, 1, 1,
-0.9976798, -0.4368469, -3.012627, 1, 1, 1, 1, 1,
-0.993753, -1.261509, -1.741751, 1, 1, 1, 1, 1,
-0.9914361, -1.163053, -3.655615, 1, 1, 1, 1, 1,
-0.9871327, 1.446784, -2.186037, 1, 1, 1, 1, 1,
-0.9818703, -0.01520635, -1.157549, 1, 1, 1, 1, 1,
-0.9753145, -0.07357933, -2.527041, 1, 1, 1, 1, 1,
-0.9699062, 0.2514009, -2.211724, 0, 0, 1, 1, 1,
-0.9665527, -0.5011607, -1.879897, 1, 0, 0, 1, 1,
-0.9648485, 0.2540482, -0.2422538, 1, 0, 0, 1, 1,
-0.9605843, -0.297489, -2.928134, 1, 0, 0, 1, 1,
-0.9597448, 0.5206007, -0.5515783, 1, 0, 0, 1, 1,
-0.951748, -0.7289724, -1.234408, 1, 0, 0, 1, 1,
-0.9512343, -0.3342711, -1.35505, 0, 0, 0, 1, 1,
-0.9487973, -0.168435, -1.36951, 0, 0, 0, 1, 1,
-0.9399881, 1.285614, -1.452941, 0, 0, 0, 1, 1,
-0.9381111, 0.08022474, -0.5831, 0, 0, 0, 1, 1,
-0.9292628, -0.9493673, -2.416214, 0, 0, 0, 1, 1,
-0.927656, -0.7473802, -3.430806, 0, 0, 0, 1, 1,
-0.9241655, -0.2423123, -1.633542, 0, 0, 0, 1, 1,
-0.9170984, 0.006304338, -0.2752998, 1, 1, 1, 1, 1,
-0.9149889, 1.903473, 0.09936766, 1, 1, 1, 1, 1,
-0.9133646, -1.072335, -2.130233, 1, 1, 1, 1, 1,
-0.9048613, 0.05219546, -3.585722, 1, 1, 1, 1, 1,
-0.9047176, 0.3722917, 0.8281532, 1, 1, 1, 1, 1,
-0.8936768, 0.5763942, -1.136116, 1, 1, 1, 1, 1,
-0.8932729, -0.122215, -2.192577, 1, 1, 1, 1, 1,
-0.887931, -0.5544985, 0.5244504, 1, 1, 1, 1, 1,
-0.8868898, -0.598811, -2.320585, 1, 1, 1, 1, 1,
-0.8793883, -0.5342456, -2.986376, 1, 1, 1, 1, 1,
-0.8717015, -0.489498, -1.850225, 1, 1, 1, 1, 1,
-0.8716326, 0.06255721, -2.295171, 1, 1, 1, 1, 1,
-0.8677427, -1.590342, -1.673555, 1, 1, 1, 1, 1,
-0.8663126, 0.5927176, -0.4427808, 1, 1, 1, 1, 1,
-0.8640953, -0.806142, -4.096391, 1, 1, 1, 1, 1,
-0.8630077, -0.1368503, -1.143055, 0, 0, 1, 1, 1,
-0.8619002, 0.5161657, -1.73273, 1, 0, 0, 1, 1,
-0.8608931, -1.331385, -2.978454, 1, 0, 0, 1, 1,
-0.8597778, -0.331398, -2.350287, 1, 0, 0, 1, 1,
-0.857307, 1.035128, -3.048666, 1, 0, 0, 1, 1,
-0.856914, -0.3819594, -0.9363055, 1, 0, 0, 1, 1,
-0.8555179, 0.1209924, -3.501221, 0, 0, 0, 1, 1,
-0.8533567, 0.2976195, -0.03442717, 0, 0, 0, 1, 1,
-0.8401968, 0.2958052, -0.8439184, 0, 0, 0, 1, 1,
-0.8366619, -0.2729349, -2.151474, 0, 0, 0, 1, 1,
-0.8356883, -1.603618, -1.729162, 0, 0, 0, 1, 1,
-0.8345243, -1.45525, -0.999749, 0, 0, 0, 1, 1,
-0.8300967, -0.3460971, -1.206122, 0, 0, 0, 1, 1,
-0.8300908, 0.1967175, -2.269656, 1, 1, 1, 1, 1,
-0.8280364, -0.4876105, -0.9218514, 1, 1, 1, 1, 1,
-0.8236566, 0.8573071, -0.3966823, 1, 1, 1, 1, 1,
-0.8210565, -0.9156965, -2.229128, 1, 1, 1, 1, 1,
-0.8169586, 0.1414736, -0.2690565, 1, 1, 1, 1, 1,
-0.8151801, -0.02118089, -1.9859, 1, 1, 1, 1, 1,
-0.8140756, -0.134493, -3.20771, 1, 1, 1, 1, 1,
-0.8106881, 1.150587, -0.3827546, 1, 1, 1, 1, 1,
-0.8053344, 0.03214953, -2.067869, 1, 1, 1, 1, 1,
-0.7948255, -0.7145551, -2.591629, 1, 1, 1, 1, 1,
-0.7921417, 1.013094, -1.741228, 1, 1, 1, 1, 1,
-0.7917936, 0.02975842, -2.220871, 1, 1, 1, 1, 1,
-0.7762533, 1.181849, -1.618809, 1, 1, 1, 1, 1,
-0.7756687, 0.1720777, -2.354177, 1, 1, 1, 1, 1,
-0.773312, 1.248744, -1.638119, 1, 1, 1, 1, 1,
-0.7730737, -0.3219475, -2.808672, 0, 0, 1, 1, 1,
-0.7695554, -0.2965963, -2.003425, 1, 0, 0, 1, 1,
-0.7692146, 0.6792116, 0.8304948, 1, 0, 0, 1, 1,
-0.7691909, 1.272866, -0.5068771, 1, 0, 0, 1, 1,
-0.7690619, -0.5092538, -2.503361, 1, 0, 0, 1, 1,
-0.7678658, -0.5755363, -1.75161, 1, 0, 0, 1, 1,
-0.7675128, 0.5630317, -1.057124, 0, 0, 0, 1, 1,
-0.7641428, -1.208257, -2.800042, 0, 0, 0, 1, 1,
-0.763423, 0.6716774, -0.2822447, 0, 0, 0, 1, 1,
-0.7609921, 0.1825873, -1.203896, 0, 0, 0, 1, 1,
-0.7512602, 0.6327644, -0.2403176, 0, 0, 0, 1, 1,
-0.7446324, -0.9533324, -2.072362, 0, 0, 0, 1, 1,
-0.7444881, -0.2320317, -2.34174, 0, 0, 0, 1, 1,
-0.7399335, 0.4025455, 1.806885, 1, 1, 1, 1, 1,
-0.7388046, -0.1513821, -4.126844, 1, 1, 1, 1, 1,
-0.7379977, -0.003640371, -2.02745, 1, 1, 1, 1, 1,
-0.7368413, -0.534566, -3.053215, 1, 1, 1, 1, 1,
-0.7360333, -0.2661816, -1.486445, 1, 1, 1, 1, 1,
-0.7254976, 1.069125, 1.755663, 1, 1, 1, 1, 1,
-0.7251782, 0.9375697, -0.2744629, 1, 1, 1, 1, 1,
-0.7240766, 1.119402, -1.433259, 1, 1, 1, 1, 1,
-0.7233485, 0.8601149, -0.502865, 1, 1, 1, 1, 1,
-0.7233289, -0.03589648, -2.324872, 1, 1, 1, 1, 1,
-0.7213711, -0.5686656, -2.075737, 1, 1, 1, 1, 1,
-0.7202345, 0.3729707, -0.3534376, 1, 1, 1, 1, 1,
-0.7164813, 0.598298, -1.358958, 1, 1, 1, 1, 1,
-0.7118055, -0.1633577, -1.693348, 1, 1, 1, 1, 1,
-0.7074643, 0.06416365, -2.056576, 1, 1, 1, 1, 1,
-0.7056795, -0.5366666, -2.377228, 0, 0, 1, 1, 1,
-0.7005703, 0.08792099, -2.288843, 1, 0, 0, 1, 1,
-0.7004384, -0.1982024, -1.104054, 1, 0, 0, 1, 1,
-0.698698, 1.256739, -0.02980237, 1, 0, 0, 1, 1,
-0.6986206, 0.3623191, -2.259754, 1, 0, 0, 1, 1,
-0.6930677, 0.3649056, -1.028426, 1, 0, 0, 1, 1,
-0.6918442, 0.09576496, -2.03922, 0, 0, 0, 1, 1,
-0.6888623, 0.6949122, -1.399343, 0, 0, 0, 1, 1,
-0.6875009, -1.105673, -3.771448, 0, 0, 0, 1, 1,
-0.6868219, -0.3501946, -3.552338, 0, 0, 0, 1, 1,
-0.6866645, 1.041914, -0.9627805, 0, 0, 0, 1, 1,
-0.6863725, -1.349713, -4.359749, 0, 0, 0, 1, 1,
-0.6843908, 1.11103, 0.6316335, 0, 0, 0, 1, 1,
-0.6840606, 0.8155298, 2.018533, 1, 1, 1, 1, 1,
-0.6824589, 0.1363414, -2.587445, 1, 1, 1, 1, 1,
-0.6812385, -1.121833, -2.752599, 1, 1, 1, 1, 1,
-0.6812342, 0.9560267, -0.9197598, 1, 1, 1, 1, 1,
-0.6795933, -1.239436, -4.720289, 1, 1, 1, 1, 1,
-0.6792955, -0.1822114, -2.331026, 1, 1, 1, 1, 1,
-0.6781657, 1.681543, -1.695882, 1, 1, 1, 1, 1,
-0.6767071, -1.912172, -2.239455, 1, 1, 1, 1, 1,
-0.6765871, 0.8564125, 2.168474, 1, 1, 1, 1, 1,
-0.6760522, -0.2465534, 0.1064451, 1, 1, 1, 1, 1,
-0.6711934, -0.9302875, -2.558842, 1, 1, 1, 1, 1,
-0.668683, 1.130682, -0.5005876, 1, 1, 1, 1, 1,
-0.6590707, 0.1031798, -0.7543241, 1, 1, 1, 1, 1,
-0.6587748, -0.3687407, -1.512171, 1, 1, 1, 1, 1,
-0.6550634, -0.12755, -3.081789, 1, 1, 1, 1, 1,
-0.6541297, -0.3278376, -3.5029, 0, 0, 1, 1, 1,
-0.6522019, 2.09513, 0.283829, 1, 0, 0, 1, 1,
-0.6436817, -0.1918196, -1.616175, 1, 0, 0, 1, 1,
-0.6429659, -0.2518641, -2.386715, 1, 0, 0, 1, 1,
-0.6343091, 0.5164855, -1.379426, 1, 0, 0, 1, 1,
-0.6326421, 1.413507, -1.037488, 1, 0, 0, 1, 1,
-0.6325662, 0.5427088, -0.5043832, 0, 0, 0, 1, 1,
-0.6292858, 0.5164453, -2.277341, 0, 0, 0, 1, 1,
-0.6266899, 0.7793786, -0.07606415, 0, 0, 0, 1, 1,
-0.6265817, 1.480787, 0.05065178, 0, 0, 0, 1, 1,
-0.6187075, 0.7521127, -0.7857381, 0, 0, 0, 1, 1,
-0.6108673, -0.007792205, -2.959398, 0, 0, 0, 1, 1,
-0.6087816, 0.4145074, -0.957419, 0, 0, 0, 1, 1,
-0.6075355, -1.520731, -3.368881, 1, 1, 1, 1, 1,
-0.6072259, 0.8127186, -0.1583445, 1, 1, 1, 1, 1,
-0.6041749, 1.070642, 0.4850402, 1, 1, 1, 1, 1,
-0.6020761, 0.6374633, 0.7819669, 1, 1, 1, 1, 1,
-0.5999715, -0.4556221, -3.846746, 1, 1, 1, 1, 1,
-0.5957654, -0.4061867, -4.059963, 1, 1, 1, 1, 1,
-0.5921504, 1.399189, -0.4030614, 1, 1, 1, 1, 1,
-0.5903112, 1.250616, -0.2805437, 1, 1, 1, 1, 1,
-0.5898361, -0.4754041, -3.406852, 1, 1, 1, 1, 1,
-0.586509, -1.963503, -1.417105, 1, 1, 1, 1, 1,
-0.5860808, 0.1537734, 0.2680985, 1, 1, 1, 1, 1,
-0.5837448, 1.023901, -2.353959, 1, 1, 1, 1, 1,
-0.5809199, -0.5244907, -3.243659, 1, 1, 1, 1, 1,
-0.5787026, 0.1879146, -0.4186958, 1, 1, 1, 1, 1,
-0.5774624, 0.3916926, -1.149025, 1, 1, 1, 1, 1,
-0.5707759, -0.6128231, -3.017412, 0, 0, 1, 1, 1,
-0.5686925, -0.519769, -2.263597, 1, 0, 0, 1, 1,
-0.5684212, -1.185449, -1.888772, 1, 0, 0, 1, 1,
-0.56754, 1.298631, 1.560277, 1, 0, 0, 1, 1,
-0.5645615, -0.2175484, -1.722828, 1, 0, 0, 1, 1,
-0.5607448, 0.2818458, -1.298637, 1, 0, 0, 1, 1,
-0.5543846, -0.59812, -1.767849, 0, 0, 0, 1, 1,
-0.5534958, 0.537418, 0.171013, 0, 0, 0, 1, 1,
-0.5523396, 0.9859875, -0.1118546, 0, 0, 0, 1, 1,
-0.5522662, -0.7080373, -2.472794, 0, 0, 0, 1, 1,
-0.5515132, 0.2148393, -0.07268429, 0, 0, 0, 1, 1,
-0.545826, 2.403655, -0.5351176, 0, 0, 0, 1, 1,
-0.5448322, 0.3770749, -3.14643, 0, 0, 0, 1, 1,
-0.5363155, 2.041239, 0.798272, 1, 1, 1, 1, 1,
-0.5360789, -0.761124, -2.631037, 1, 1, 1, 1, 1,
-0.5360614, -1.843433, -3.637237, 1, 1, 1, 1, 1,
-0.5201567, 0.6166576, 0.3559547, 1, 1, 1, 1, 1,
-0.5155894, -1.534743, -3.052124, 1, 1, 1, 1, 1,
-0.5142084, 0.4188092, -0.4036756, 1, 1, 1, 1, 1,
-0.5134282, -0.2161291, -1.07447, 1, 1, 1, 1, 1,
-0.5132718, 1.869967, 0.6580833, 1, 1, 1, 1, 1,
-0.5106927, -1.096954, -2.283317, 1, 1, 1, 1, 1,
-0.5094213, 0.1598526, -0.7968647, 1, 1, 1, 1, 1,
-0.5022281, 0.3152195, -1.729318, 1, 1, 1, 1, 1,
-0.5020576, 0.06889328, -0.2144502, 1, 1, 1, 1, 1,
-0.4950344, 0.8169461, 0.01583799, 1, 1, 1, 1, 1,
-0.4922508, 0.7463569, -0.1760077, 1, 1, 1, 1, 1,
-0.49134, 0.4454901, -1.345702, 1, 1, 1, 1, 1,
-0.4903629, 1.76813, -1.115458, 0, 0, 1, 1, 1,
-0.4865787, -0.638918, -2.929769, 1, 0, 0, 1, 1,
-0.4839539, -0.2979026, -2.446181, 1, 0, 0, 1, 1,
-0.4819166, -0.3618335, -3.187214, 1, 0, 0, 1, 1,
-0.481052, 0.9337645, -1.166233, 1, 0, 0, 1, 1,
-0.4692788, 1.218521, -2.961768, 1, 0, 0, 1, 1,
-0.468097, -1.259112, -2.257909, 0, 0, 0, 1, 1,
-0.4680923, -0.8153182, -1.904813, 0, 0, 0, 1, 1,
-0.4647963, 0.1285808, -3.285769, 0, 0, 0, 1, 1,
-0.4522177, 1.220679, -0.1523623, 0, 0, 0, 1, 1,
-0.45171, 1.773749, -0.07172521, 0, 0, 0, 1, 1,
-0.4465782, -1.705939, -2.48965, 0, 0, 0, 1, 1,
-0.4426019, -0.3693365, -1.99652, 0, 0, 0, 1, 1,
-0.4398507, 0.4718825, -0.267545, 1, 1, 1, 1, 1,
-0.4370635, -1.080942, -2.431894, 1, 1, 1, 1, 1,
-0.4318632, 1.210301, -0.02584612, 1, 1, 1, 1, 1,
-0.4230977, -0.07181684, -2.767802, 1, 1, 1, 1, 1,
-0.4202023, -0.8006487, -1.375219, 1, 1, 1, 1, 1,
-0.419957, -1.570875, -3.100984, 1, 1, 1, 1, 1,
-0.4199516, 0.3981034, -0.2799694, 1, 1, 1, 1, 1,
-0.4196733, 1.798034, 0.5723445, 1, 1, 1, 1, 1,
-0.4160807, 0.6955248, 1.09086, 1, 1, 1, 1, 1,
-0.4156738, -1.062657, -3.245864, 1, 1, 1, 1, 1,
-0.4147283, -0.1871074, -1.547814, 1, 1, 1, 1, 1,
-0.4127466, 2.065555, 0.1847949, 1, 1, 1, 1, 1,
-0.4089735, -0.3430334, -1.326082, 1, 1, 1, 1, 1,
-0.4064245, -0.8287676, -0.3700204, 1, 1, 1, 1, 1,
-0.404386, 0.4989853, 1.567378, 1, 1, 1, 1, 1,
-0.4030225, -1.446596, -2.412158, 0, 0, 1, 1, 1,
-0.4025207, 0.6217272, -0.987238, 1, 0, 0, 1, 1,
-0.3993358, 1.395715, 0.256622, 1, 0, 0, 1, 1,
-0.3902639, -1.482514, -1.816532, 1, 0, 0, 1, 1,
-0.3845584, 0.9088408, -2.215207, 1, 0, 0, 1, 1,
-0.3840134, -0.7503488, -3.956793, 1, 0, 0, 1, 1,
-0.3832014, 0.2945574, -1.724065, 0, 0, 0, 1, 1,
-0.3825802, 1.617013, -1.282946, 0, 0, 0, 1, 1,
-0.3809559, 0.1058879, -2.7296, 0, 0, 0, 1, 1,
-0.3794068, 0.406599, -1.573799, 0, 0, 0, 1, 1,
-0.3724203, 0.2689098, -1.408984, 0, 0, 0, 1, 1,
-0.3700798, -0.6035935, -2.614751, 0, 0, 0, 1, 1,
-0.3676768, 1.035416, -0.7268888, 0, 0, 0, 1, 1,
-0.3584236, -0.9193808, -1.998001, 1, 1, 1, 1, 1,
-0.3498067, 0.2532503, -0.8158699, 1, 1, 1, 1, 1,
-0.3497314, 0.7048246, -0.3071137, 1, 1, 1, 1, 1,
-0.3487316, 0.3958513, -0.840503, 1, 1, 1, 1, 1,
-0.3465646, -0.9948699, -2.913456, 1, 1, 1, 1, 1,
-0.3442911, -0.359609, -0.4783331, 1, 1, 1, 1, 1,
-0.344268, 0.6743951, -0.1533054, 1, 1, 1, 1, 1,
-0.3417175, -0.6563243, -5.906349, 1, 1, 1, 1, 1,
-0.3377913, 1.978832, 0.0777561, 1, 1, 1, 1, 1,
-0.3364905, -1.072543, -2.815822, 1, 1, 1, 1, 1,
-0.3354791, 0.226391, -1.395956, 1, 1, 1, 1, 1,
-0.3345875, 1.649611, 1.86155, 1, 1, 1, 1, 1,
-0.3325199, -0.8314277, -3.326391, 1, 1, 1, 1, 1,
-0.3263863, -0.8013701, -3.576015, 1, 1, 1, 1, 1,
-0.3224069, -0.02171891, -0.2229385, 1, 1, 1, 1, 1,
-0.3212882, -0.2245739, -1.899321, 0, 0, 1, 1, 1,
-0.3095167, -1.772919, -1.805862, 1, 0, 0, 1, 1,
-0.3095096, 1.528686, -1.013803, 1, 0, 0, 1, 1,
-0.3055266, -0.2093757, -1.942302, 1, 0, 0, 1, 1,
-0.3036224, -1.092312, -2.754571, 1, 0, 0, 1, 1,
-0.2989744, 0.6648186, -0.6061291, 1, 0, 0, 1, 1,
-0.2985667, -0.2088489, 0.8049304, 0, 0, 0, 1, 1,
-0.2958613, -1.051854, -1.842968, 0, 0, 0, 1, 1,
-0.2956216, -0.2221251, -2.994089, 0, 0, 0, 1, 1,
-0.2942617, -0.6235994, -3.449049, 0, 0, 0, 1, 1,
-0.2895666, 0.8327921, -0.1548636, 0, 0, 0, 1, 1,
-0.2872601, -1.303901, -5.430472, 0, 0, 0, 1, 1,
-0.2855394, 1.217287, 0.4128462, 0, 0, 0, 1, 1,
-0.2844908, -0.7719883, -1.669683, 1, 1, 1, 1, 1,
-0.2820886, -0.158098, -2.738136, 1, 1, 1, 1, 1,
-0.2784159, -1.339486, -1.711355, 1, 1, 1, 1, 1,
-0.2764799, 1.822185, 0.3797382, 1, 1, 1, 1, 1,
-0.2764212, -0.9046487, -3.544538, 1, 1, 1, 1, 1,
-0.2750654, -1.244647, -3.949009, 1, 1, 1, 1, 1,
-0.2735016, -1.268173, -0.8379655, 1, 1, 1, 1, 1,
-0.2689785, -0.2936423, -1.806239, 1, 1, 1, 1, 1,
-0.2666429, 1.419624, -2.304649, 1, 1, 1, 1, 1,
-0.2602799, 1.342269, 0.8740456, 1, 1, 1, 1, 1,
-0.2457317, -0.4882296, -2.931159, 1, 1, 1, 1, 1,
-0.2424826, 2.38358, 1.323874, 1, 1, 1, 1, 1,
-0.2400191, 2.296331, 0.1003999, 1, 1, 1, 1, 1,
-0.2383869, -0.543043, -1.49854, 1, 1, 1, 1, 1,
-0.2383587, -1.874443, -2.58126, 1, 1, 1, 1, 1,
-0.2380825, 0.4667033, -0.0613056, 0, 0, 1, 1, 1,
-0.2379315, -0.4204098, -2.491787, 1, 0, 0, 1, 1,
-0.2377173, 0.6794695, -0.02553483, 1, 0, 0, 1, 1,
-0.2359938, 0.1708216, 0.05972973, 1, 0, 0, 1, 1,
-0.2268791, -0.2856475, -2.830918, 1, 0, 0, 1, 1,
-0.2254244, -1.105756, -0.519313, 1, 0, 0, 1, 1,
-0.2197455, 0.1925237, -1.467803, 0, 0, 0, 1, 1,
-0.2191626, 1.172315, -0.2470164, 0, 0, 0, 1, 1,
-0.2157395, 2.091282, 0.5783619, 0, 0, 0, 1, 1,
-0.214829, -1.415197, -1.964302, 0, 0, 0, 1, 1,
-0.2146956, -1.475594, -3.462052, 0, 0, 0, 1, 1,
-0.2137415, 1.222288, -0.3490946, 0, 0, 0, 1, 1,
-0.2127009, 0.3187048, 0.07726821, 0, 0, 0, 1, 1,
-0.2065642, 1.52097, -0.1677685, 1, 1, 1, 1, 1,
-0.2053783, 0.9555978, -0.6648389, 1, 1, 1, 1, 1,
-0.1921956, 0.6165941, 0.09101753, 1, 1, 1, 1, 1,
-0.189106, -1.392056, -2.441312, 1, 1, 1, 1, 1,
-0.1887651, -0.7071376, -4.014589, 1, 1, 1, 1, 1,
-0.1865978, -0.01886688, -1.904362, 1, 1, 1, 1, 1,
-0.1827118, -0.4347493, -3.387322, 1, 1, 1, 1, 1,
-0.1786406, 0.06191606, -0.1731324, 1, 1, 1, 1, 1,
-0.1782646, -0.9421181, -4.470408, 1, 1, 1, 1, 1,
-0.174831, 0.4803225, 0.4500112, 1, 1, 1, 1, 1,
-0.1690085, -0.1883263, -3.230364, 1, 1, 1, 1, 1,
-0.1650995, 0.111626, -1.343595, 1, 1, 1, 1, 1,
-0.1641373, 1.025426, -0.7164832, 1, 1, 1, 1, 1,
-0.1633531, 1.208708, 0.9632866, 1, 1, 1, 1, 1,
-0.1632511, 1.01231, 1.928193, 1, 1, 1, 1, 1,
-0.1618193, -0.06258262, -0.2021016, 0, 0, 1, 1, 1,
-0.1610217, 0.2119527, 0.2630117, 1, 0, 0, 1, 1,
-0.1609494, -0.5669465, -3.093469, 1, 0, 0, 1, 1,
-0.1607366, 0.8834047, -0.09115348, 1, 0, 0, 1, 1,
-0.1529646, 0.3180611, -0.2750387, 1, 0, 0, 1, 1,
-0.15255, 1.600573, -0.8029765, 1, 0, 0, 1, 1,
-0.1456023, -0.4332798, -2.609586, 0, 0, 0, 1, 1,
-0.1438887, -0.2249639, -2.82313, 0, 0, 0, 1, 1,
-0.1438745, -1.258689, -2.378794, 0, 0, 0, 1, 1,
-0.1408829, -0.0007424271, -2.85823, 0, 0, 0, 1, 1,
-0.1332553, -1.102903, -5.440784, 0, 0, 0, 1, 1,
-0.133165, -0.7782192, -3.257826, 0, 0, 0, 1, 1,
-0.1328548, 2.263154, 2.519604, 0, 0, 0, 1, 1,
-0.1225817, 0.3064447, 1.166805, 1, 1, 1, 1, 1,
-0.1225035, -0.4408528, -4.605773, 1, 1, 1, 1, 1,
-0.1215761, -0.3559973, -1.250276, 1, 1, 1, 1, 1,
-0.1181939, -1.234071, -1.790973, 1, 1, 1, 1, 1,
-0.1160723, 1.164431, 0.6615119, 1, 1, 1, 1, 1,
-0.1143028, -0.3939305, -2.543516, 1, 1, 1, 1, 1,
-0.1125631, -0.2588952, -2.385177, 1, 1, 1, 1, 1,
-0.1113994, 1.40969, 0.1385315, 1, 1, 1, 1, 1,
-0.1073591, -1.033411, -3.906474, 1, 1, 1, 1, 1,
-0.10043, 1.688818, -1.118628, 1, 1, 1, 1, 1,
-0.1003912, 1.063955, -0.3638363, 1, 1, 1, 1, 1,
-0.09702025, -0.293324, -2.258846, 1, 1, 1, 1, 1,
-0.09632871, 1.055591, -0.1024395, 1, 1, 1, 1, 1,
-0.09629584, 0.5903729, -0.818288, 1, 1, 1, 1, 1,
-0.08813412, 0.7411771, -0.2138546, 1, 1, 1, 1, 1,
-0.08466888, -0.3768799, -3.284226, 0, 0, 1, 1, 1,
-0.08378044, -0.4183381, -2.019645, 1, 0, 0, 1, 1,
-0.07993884, 1.658181, -1.077641, 1, 0, 0, 1, 1,
-0.07906298, -0.1710494, -2.798689, 1, 0, 0, 1, 1,
-0.07625356, -0.3031119, -0.8525192, 1, 0, 0, 1, 1,
-0.07373927, -0.2416169, -1.873011, 1, 0, 0, 1, 1,
-0.07349645, 0.2484732, 1.4204, 0, 0, 0, 1, 1,
-0.07303131, -0.8268201, -0.6501529, 0, 0, 0, 1, 1,
-0.06887474, -0.0625914, -3.978777, 0, 0, 0, 1, 1,
-0.06775948, -1.74933, -2.358168, 0, 0, 0, 1, 1,
-0.06571606, 0.6821738, 1.426748, 0, 0, 0, 1, 1,
-0.06564883, -0.009581651, -0.7557433, 0, 0, 0, 1, 1,
-0.06455074, 0.9691319, 0.241891, 0, 0, 0, 1, 1,
-0.06449629, 0.2458974, -1.389683, 1, 1, 1, 1, 1,
-0.06216921, 0.02136728, -1.589115, 1, 1, 1, 1, 1,
-0.06125189, 1.483658, 0.03199396, 1, 1, 1, 1, 1,
-0.05844152, -0.5461187, -3.710625, 1, 1, 1, 1, 1,
-0.05763495, -0.8074578, -3.075857, 1, 1, 1, 1, 1,
-0.04936891, 0.9067827, -1.445441, 1, 1, 1, 1, 1,
-0.04918947, 1.991031, 0.5616161, 1, 1, 1, 1, 1,
-0.04642287, 0.5827917, 0.09435654, 1, 1, 1, 1, 1,
-0.04280818, 1.430822, -0.7989446, 1, 1, 1, 1, 1,
-0.02656936, 0.8664632, -0.1188962, 1, 1, 1, 1, 1,
-0.02321407, -0.8505865, -5.275139, 1, 1, 1, 1, 1,
-0.02222977, 0.7757384, -0.8460755, 1, 1, 1, 1, 1,
-0.02082306, 0.6790581, -1.315808, 1, 1, 1, 1, 1,
-0.01835017, -0.7876235, -3.410185, 1, 1, 1, 1, 1,
-0.01707383, -0.9790214, -5.151947, 1, 1, 1, 1, 1,
-0.01577467, -0.1234164, -3.111735, 0, 0, 1, 1, 1,
-0.01573609, 0.5417342, -1.134838, 1, 0, 0, 1, 1,
-0.01566172, -1.510528, -0.8497341, 1, 0, 0, 1, 1,
-0.01553687, 1.059851, 1.544622, 1, 0, 0, 1, 1,
-0.01263485, 0.09270277, -1.013513, 1, 0, 0, 1, 1,
-0.01132297, -0.1230155, -3.695656, 1, 0, 0, 1, 1,
-0.009791031, 1.165732, -0.5946562, 0, 0, 0, 1, 1,
-0.009615367, 0.08039331, -0.3128291, 0, 0, 0, 1, 1,
-0.008190552, -0.9578981, -3.868037, 0, 0, 0, 1, 1,
-0.005987346, 0.4856283, 0.8352671, 0, 0, 0, 1, 1,
-0.003316568, 0.0207208, -1.084082, 0, 0, 0, 1, 1,
0.003665465, -0.7238478, 2.531041, 0, 0, 0, 1, 1,
0.003963663, 0.3470827, -2.518869, 0, 0, 0, 1, 1,
0.005760596, -2.071169, 3.666394, 1, 1, 1, 1, 1,
0.01276202, -0.02808673, 4.484399, 1, 1, 1, 1, 1,
0.01499895, -0.5392931, 4.362347, 1, 1, 1, 1, 1,
0.01921627, 1.416131, 0.6940048, 1, 1, 1, 1, 1,
0.01934915, 1.490328, -1.238116, 1, 1, 1, 1, 1,
0.02034618, 1.249892, 0.6296232, 1, 1, 1, 1, 1,
0.02078874, -0.2651934, 3.019756, 1, 1, 1, 1, 1,
0.02128688, -0.2036293, 4.392031, 1, 1, 1, 1, 1,
0.02407629, -0.451982, 2.402074, 1, 1, 1, 1, 1,
0.02783491, 0.5730252, -0.7144268, 1, 1, 1, 1, 1,
0.02832468, 0.4251617, 0.690235, 1, 1, 1, 1, 1,
0.03044754, 0.6303225, -1.716334, 1, 1, 1, 1, 1,
0.0345859, -0.153475, 3.342751, 1, 1, 1, 1, 1,
0.03497442, 0.3099993, 0.3332111, 1, 1, 1, 1, 1,
0.03934947, 0.8988164, 0.4581774, 1, 1, 1, 1, 1,
0.04076534, 1.208861, -1.595176, 0, 0, 1, 1, 1,
0.04118489, -0.8849885, 2.993077, 1, 0, 0, 1, 1,
0.05071094, 1.342296, -0.2294047, 1, 0, 0, 1, 1,
0.05667605, 0.4715855, -1.460269, 1, 0, 0, 1, 1,
0.05717576, 0.3173982, -1.014926, 1, 0, 0, 1, 1,
0.05798139, -0.3919377, 1.778047, 1, 0, 0, 1, 1,
0.0609323, -1.170771, 3.58677, 0, 0, 0, 1, 1,
0.0682226, -1.01237, 3.066703, 0, 0, 0, 1, 1,
0.06883689, -0.06681346, 3.072075, 0, 0, 0, 1, 1,
0.07487989, -0.3353063, 3.931603, 0, 0, 0, 1, 1,
0.07613891, 0.2893884, 0.5193424, 0, 0, 0, 1, 1,
0.0771825, -0.1459468, 2.735704, 0, 0, 0, 1, 1,
0.08145811, -1.375766, 3.184025, 0, 0, 0, 1, 1,
0.0827588, 2.44898, 0.8401431, 1, 1, 1, 1, 1,
0.08749968, 1.118286, 0.7098371, 1, 1, 1, 1, 1,
0.08760333, -0.7489017, 3.207939, 1, 1, 1, 1, 1,
0.09306532, -0.3412677, 5.133938, 1, 1, 1, 1, 1,
0.09433813, 1.389476, 1.992122, 1, 1, 1, 1, 1,
0.09678181, -0.6909713, 3.137431, 1, 1, 1, 1, 1,
0.09721439, 1.761572, 1.189149, 1, 1, 1, 1, 1,
0.09959097, -1.458858, 4.088239, 1, 1, 1, 1, 1,
0.1013874, -0.2826663, 3.546378, 1, 1, 1, 1, 1,
0.103892, -1.889621, 2.795755, 1, 1, 1, 1, 1,
0.105576, -1.544708, 3.503853, 1, 1, 1, 1, 1,
0.1101424, 1.678041, -1.042503, 1, 1, 1, 1, 1,
0.1111689, 1.290725, 1.169753, 1, 1, 1, 1, 1,
0.11328, -1.077526, 2.434844, 1, 1, 1, 1, 1,
0.1155193, -0.2964302, 2.261138, 1, 1, 1, 1, 1,
0.117267, 0.04009887, 1.378856, 0, 0, 1, 1, 1,
0.1186439, 1.082282, -1.512532, 1, 0, 0, 1, 1,
0.1235875, -0.967671, 4.035045, 1, 0, 0, 1, 1,
0.1237022, -1.123962, 3.547765, 1, 0, 0, 1, 1,
0.1253459, -0.4603072, 3.539153, 1, 0, 0, 1, 1,
0.1277984, 0.5196764, 0.7851321, 1, 0, 0, 1, 1,
0.1308153, -0.5528628, 1.295567, 0, 0, 0, 1, 1,
0.1329601, 1.753885, 1.167518, 0, 0, 0, 1, 1,
0.141627, 0.5245735, -0.002740717, 0, 0, 0, 1, 1,
0.1456884, -1.215906, 2.37707, 0, 0, 0, 1, 1,
0.1472621, -0.07343827, 1.597746, 0, 0, 0, 1, 1,
0.1473389, 1.115653, 0.1397601, 0, 0, 0, 1, 1,
0.1480859, -0.4838563, 2.786136, 0, 0, 0, 1, 1,
0.1483438, -1.51142, 4.634373, 1, 1, 1, 1, 1,
0.1486094, -0.009674391, 1.850727, 1, 1, 1, 1, 1,
0.1532072, 2.198612, 0.05071936, 1, 1, 1, 1, 1,
0.1536205, -1.261588, 4.126401, 1, 1, 1, 1, 1,
0.1544429, -0.237836, 1.985106, 1, 1, 1, 1, 1,
0.1546201, -0.06298333, 4.232239, 1, 1, 1, 1, 1,
0.157049, 0.1409504, -0.6286927, 1, 1, 1, 1, 1,
0.1572116, 1.970775, 1.557903, 1, 1, 1, 1, 1,
0.15858, -0.132167, 3.90536, 1, 1, 1, 1, 1,
0.1602657, 1.213508, 0.719954, 1, 1, 1, 1, 1,
0.1603387, 1.339072, 0.7323332, 1, 1, 1, 1, 1,
0.1606279, -0.3294693, 1.793602, 1, 1, 1, 1, 1,
0.162396, -0.5409242, 1.422315, 1, 1, 1, 1, 1,
0.1662234, -0.6672669, 2.246636, 1, 1, 1, 1, 1,
0.1707429, -1.512279, 3.204785, 1, 1, 1, 1, 1,
0.1748838, -0.1838136, 1.104009, 0, 0, 1, 1, 1,
0.175673, -0.7477822, 3.468554, 1, 0, 0, 1, 1,
0.1764296, 0.6164563, 0.4422015, 1, 0, 0, 1, 1,
0.1822914, 0.1765814, 2.72051, 1, 0, 0, 1, 1,
0.1870556, 0.3630426, 0.007905953, 1, 0, 0, 1, 1,
0.1881067, -0.1443516, 0.5507662, 1, 0, 0, 1, 1,
0.1895269, -0.2147737, 1.29802, 0, 0, 0, 1, 1,
0.1911438, -0.04294607, 2.622378, 0, 0, 0, 1, 1,
0.1922883, 0.5943888, 2.154564, 0, 0, 0, 1, 1,
0.1963294, -0.1937352, 2.138524, 0, 0, 0, 1, 1,
0.1977992, -1.084276, 2.246368, 0, 0, 0, 1, 1,
0.2016118, -0.6276929, 3.091248, 0, 0, 0, 1, 1,
0.2023243, -0.6401084, 2.501354, 0, 0, 0, 1, 1,
0.2035578, -1.921236, 3.66937, 1, 1, 1, 1, 1,
0.2048102, -1.541916, 3.627855, 1, 1, 1, 1, 1,
0.2058219, 1.691676, -0.1012018, 1, 1, 1, 1, 1,
0.2076297, -0.6641467, 2.002913, 1, 1, 1, 1, 1,
0.2100871, 0.7089543, 1.997236, 1, 1, 1, 1, 1,
0.2141592, -1.745716, 4.040768, 1, 1, 1, 1, 1,
0.2146265, 0.9960635, -0.6530906, 1, 1, 1, 1, 1,
0.2209405, 0.01125448, 0.3278417, 1, 1, 1, 1, 1,
0.221662, 0.4456014, 2.325051, 1, 1, 1, 1, 1,
0.2216908, -0.4839231, 3.455158, 1, 1, 1, 1, 1,
0.222904, 1.144557, 0.686355, 1, 1, 1, 1, 1,
0.2266974, -0.3912196, 3.986376, 1, 1, 1, 1, 1,
0.2325502, -1.946655, 2.45409, 1, 1, 1, 1, 1,
0.2335624, -0.8967134, 3.589553, 1, 1, 1, 1, 1,
0.2355024, 1.003923, 0.5305346, 1, 1, 1, 1, 1,
0.2398473, -0.4035825, 1.598117, 0, 0, 1, 1, 1,
0.2457318, -1.040036, 3.405912, 1, 0, 0, 1, 1,
0.2573668, -2.111671, 1.877486, 1, 0, 0, 1, 1,
0.260891, -0.1234225, 0.2663572, 1, 0, 0, 1, 1,
0.2616473, -1.786609, 3.408555, 1, 0, 0, 1, 1,
0.2673238, -0.1979228, 0.1788371, 1, 0, 0, 1, 1,
0.2706645, 0.72459, 1.267687, 0, 0, 0, 1, 1,
0.2731535, -1.04898, 1.776326, 0, 0, 0, 1, 1,
0.2746099, 0.06587462, 0.4229621, 0, 0, 0, 1, 1,
0.2767643, -0.08260869, 1.975983, 0, 0, 0, 1, 1,
0.2768234, 1.036894, 0.05512036, 0, 0, 0, 1, 1,
0.2778124, -1.363634, 3.180762, 0, 0, 0, 1, 1,
0.2780626, 0.05318095, 1.765135, 0, 0, 0, 1, 1,
0.278248, -0.7023333, 1.766071, 1, 1, 1, 1, 1,
0.2784986, -0.09131738, 1.670253, 1, 1, 1, 1, 1,
0.2836837, -1.21366, 2.384261, 1, 1, 1, 1, 1,
0.2837318, -0.0410351, 0.2314385, 1, 1, 1, 1, 1,
0.2858949, -0.06516366, 1.363854, 1, 1, 1, 1, 1,
0.2872361, -0.3437104, 3.121058, 1, 1, 1, 1, 1,
0.2902575, -1.479845, 3.751921, 1, 1, 1, 1, 1,
0.2918578, 0.7935051, 0.2686256, 1, 1, 1, 1, 1,
0.2952073, 0.01387773, 0.811379, 1, 1, 1, 1, 1,
0.2982631, 1.39855, 0.04452318, 1, 1, 1, 1, 1,
0.2992172, 0.8722609, 0.8378666, 1, 1, 1, 1, 1,
0.299671, 0.6960126, -1.476949, 1, 1, 1, 1, 1,
0.3036844, -1.481942, 2.307607, 1, 1, 1, 1, 1,
0.3043728, 0.3902176, 2.061409, 1, 1, 1, 1, 1,
0.3056799, -0.6037768, 2.659904, 1, 1, 1, 1, 1,
0.3081235, 0.6806325, -1.350983, 0, 0, 1, 1, 1,
0.3148195, -0.09367685, 2.324375, 1, 0, 0, 1, 1,
0.3232216, -0.4249881, 3.305902, 1, 0, 0, 1, 1,
0.3235391, 0.8938522, 0.8595433, 1, 0, 0, 1, 1,
0.3275528, -0.836859, 3.936033, 1, 0, 0, 1, 1,
0.3276948, -0.4067152, 0.7752684, 1, 0, 0, 1, 1,
0.3281606, 0.9542636, 2.364415, 0, 0, 0, 1, 1,
0.3302159, -0.03400665, 1.60306, 0, 0, 0, 1, 1,
0.3328599, -2.51333, 3.183196, 0, 0, 0, 1, 1,
0.3355984, -2.226772, 1.677025, 0, 0, 0, 1, 1,
0.3380989, 0.5873605, -0.3977032, 0, 0, 0, 1, 1,
0.338405, -1.205167, 3.415233, 0, 0, 0, 1, 1,
0.3418691, 0.08500183, 0.9197693, 0, 0, 0, 1, 1,
0.3420428, -0.36456, 2.914251, 1, 1, 1, 1, 1,
0.3446096, -0.9281787, 0.08293212, 1, 1, 1, 1, 1,
0.3472501, 1.014701, -1.218561, 1, 1, 1, 1, 1,
0.3500027, -0.1526875, 3.300572, 1, 1, 1, 1, 1,
0.3506227, 0.7747478, 0.06097435, 1, 1, 1, 1, 1,
0.3512315, 0.7318967, -1.142187, 1, 1, 1, 1, 1,
0.3559926, 1.445641, -0.4492045, 1, 1, 1, 1, 1,
0.3565764, -0.8094628, 3.019598, 1, 1, 1, 1, 1,
0.3613143, 0.8388442, -0.3160579, 1, 1, 1, 1, 1,
0.3700797, 0.3140908, -0.7556801, 1, 1, 1, 1, 1,
0.3723368, 0.976281, 0.06504807, 1, 1, 1, 1, 1,
0.3726107, -1.456627, 1.512047, 1, 1, 1, 1, 1,
0.382448, -0.290017, 1.654179, 1, 1, 1, 1, 1,
0.3835044, -0.4313079, 0.6898116, 1, 1, 1, 1, 1,
0.387702, -1.419097, 2.961746, 1, 1, 1, 1, 1,
0.3921931, 1.204621, 0.389681, 0, 0, 1, 1, 1,
0.3922842, 0.4391279, 0.5377066, 1, 0, 0, 1, 1,
0.3958957, 1.13043, 0.8926729, 1, 0, 0, 1, 1,
0.3998464, 0.2703109, 0.2889523, 1, 0, 0, 1, 1,
0.4054403, 0.3386408, 0.0007900766, 1, 0, 0, 1, 1,
0.4108839, 0.7390813, -0.05479826, 1, 0, 0, 1, 1,
0.4145786, 0.1309805, -0.4227772, 0, 0, 0, 1, 1,
0.4154541, 1.075966, 1.413764, 0, 0, 0, 1, 1,
0.4160001, 0.04534017, 0.07243679, 0, 0, 0, 1, 1,
0.4231418, -0.9499784, 3.408015, 0, 0, 0, 1, 1,
0.4236573, 0.5083753, -0.1044946, 0, 0, 0, 1, 1,
0.4285515, -1.415714, 2.267044, 0, 0, 0, 1, 1,
0.4286129, -2.812185, 3.390339, 0, 0, 0, 1, 1,
0.4315606, -0.4649046, 2.08198, 1, 1, 1, 1, 1,
0.4320388, -0.165029, 1.72502, 1, 1, 1, 1, 1,
0.4330665, -1.036023, 2.332211, 1, 1, 1, 1, 1,
0.4406633, -0.5708537, 2.073825, 1, 1, 1, 1, 1,
0.44366, -0.7504951, 3.123559, 1, 1, 1, 1, 1,
0.4450432, 0.7850065, 1.877156, 1, 1, 1, 1, 1,
0.4468017, -1.195376, 4.334484, 1, 1, 1, 1, 1,
0.4481692, -1.033169, 2.627788, 1, 1, 1, 1, 1,
0.4531848, 1.702792, 0.2054067, 1, 1, 1, 1, 1,
0.4537741, -0.6500796, 3.618916, 1, 1, 1, 1, 1,
0.4580758, -1.521262, 3.022732, 1, 1, 1, 1, 1,
0.4583233, -1.572386, 0.6654156, 1, 1, 1, 1, 1,
0.460031, -2.450024, 5.210944, 1, 1, 1, 1, 1,
0.4649664, 1.446079, 0.5825344, 1, 1, 1, 1, 1,
0.4785946, -0.2718319, 3.856773, 1, 1, 1, 1, 1,
0.4811942, -0.2109571, 2.678412, 0, 0, 1, 1, 1,
0.4820585, 0.7633684, 1.274412, 1, 0, 0, 1, 1,
0.4842976, 0.4629965, 0.7018064, 1, 0, 0, 1, 1,
0.4904056, 1.503938, -0.2846537, 1, 0, 0, 1, 1,
0.4933632, 1.133812, -1.694921, 1, 0, 0, 1, 1,
0.4935019, -0.5153952, 0.64591, 1, 0, 0, 1, 1,
0.4938186, 1.070218, 0.365203, 0, 0, 0, 1, 1,
0.4960138, -0.02408358, 3.071175, 0, 0, 0, 1, 1,
0.4972499, -0.4575708, 1.563932, 0, 0, 0, 1, 1,
0.5032259, 0.6988667, 0.7651482, 0, 0, 0, 1, 1,
0.5165772, -0.6272489, 2.439444, 0, 0, 0, 1, 1,
0.517612, -0.05790586, 1.321938, 0, 0, 0, 1, 1,
0.518703, 0.7462085, 0.04447025, 0, 0, 0, 1, 1,
0.5196294, 1.760186, 1.900955, 1, 1, 1, 1, 1,
0.5202434, -0.9812125, 2.189387, 1, 1, 1, 1, 1,
0.5215142, 0.36318, 2.203411, 1, 1, 1, 1, 1,
0.523666, -0.4729482, 0.6985091, 1, 1, 1, 1, 1,
0.5243068, -0.1620888, 0.9785639, 1, 1, 1, 1, 1,
0.5275803, 1.383814, 0.849596, 1, 1, 1, 1, 1,
0.5299146, 0.7254854, 0.6325116, 1, 1, 1, 1, 1,
0.53173, -1.896234, 4.148325, 1, 1, 1, 1, 1,
0.5321664, -0.3263163, 1.320342, 1, 1, 1, 1, 1,
0.5343397, 2.103574, 0.8585463, 1, 1, 1, 1, 1,
0.5345393, 1.181056, 0.2700504, 1, 1, 1, 1, 1,
0.5348544, 0.5502923, 0.4704419, 1, 1, 1, 1, 1,
0.5351521, -0.009824264, 3.070275, 1, 1, 1, 1, 1,
0.5370587, 0.3175332, 0.9020585, 1, 1, 1, 1, 1,
0.5391794, 0.2073984, 0.7102342, 1, 1, 1, 1, 1,
0.5406948, 1.32248, -0.5530073, 0, 0, 1, 1, 1,
0.5451173, -1.511299, 2.611764, 1, 0, 0, 1, 1,
0.5465382, -1.381264, 3.166073, 1, 0, 0, 1, 1,
0.5508271, -0.3465512, 2.774928, 1, 0, 0, 1, 1,
0.556212, -0.8194256, 3.115491, 1, 0, 0, 1, 1,
0.5604575, 0.590591, 0.5878384, 1, 0, 0, 1, 1,
0.5615842, -1.746752, 4.028884, 0, 0, 0, 1, 1,
0.564344, -0.2838442, 1.806938, 0, 0, 0, 1, 1,
0.5707171, -0.2224559, 1.726818, 0, 0, 0, 1, 1,
0.5720373, -0.5410441, 1.531356, 0, 0, 0, 1, 1,
0.5730671, -1.387429, 1.713603, 0, 0, 0, 1, 1,
0.5824406, -0.1309498, 2.166786, 0, 0, 0, 1, 1,
0.5850099, -0.5087146, 2.036855, 0, 0, 0, 1, 1,
0.5886911, 0.391488, -0.1888359, 1, 1, 1, 1, 1,
0.5903719, -0.8754938, 4.247298, 1, 1, 1, 1, 1,
0.5917008, -0.5346597, 1.127086, 1, 1, 1, 1, 1,
0.5926853, 0.5919035, 0.6821576, 1, 1, 1, 1, 1,
0.594223, -0.190193, 2.96682, 1, 1, 1, 1, 1,
0.5942694, -2.443717, 1.625337, 1, 1, 1, 1, 1,
0.5998139, 0.2355508, 1.244448, 1, 1, 1, 1, 1,
0.600842, 0.1319486, 0.6056021, 1, 1, 1, 1, 1,
0.6051859, 1.801716, 1.924086, 1, 1, 1, 1, 1,
0.6061906, -0.06859494, 2.14393, 1, 1, 1, 1, 1,
0.6146363, -0.03041504, 0.3485923, 1, 1, 1, 1, 1,
0.6311452, -0.9847319, 2.496258, 1, 1, 1, 1, 1,
0.6368909, -1.628706, 1.001451, 1, 1, 1, 1, 1,
0.6393344, 1.064014, 0.198388, 1, 1, 1, 1, 1,
0.6476642, 0.8581599, 3.121484, 1, 1, 1, 1, 1,
0.6490031, 0.007730098, 1.091581, 0, 0, 1, 1, 1,
0.6518546, 1.02431, 0.5132694, 1, 0, 0, 1, 1,
0.6571211, 0.6409002, -0.1679467, 1, 0, 0, 1, 1,
0.6582179, 0.1439215, 1.915738, 1, 0, 0, 1, 1,
0.6606193, 0.2263535, 0.5974593, 1, 0, 0, 1, 1,
0.661208, 0.4620647, 0.353622, 1, 0, 0, 1, 1,
0.6630756, 0.3867131, -0.3535851, 0, 0, 0, 1, 1,
0.6633272, 0.5711307, -0.529025, 0, 0, 0, 1, 1,
0.6643319, 1.449565, 1.116619, 0, 0, 0, 1, 1,
0.6645822, 0.01564398, 0.3344921, 0, 0, 0, 1, 1,
0.6660818, -0.1790058, 1.899066, 0, 0, 0, 1, 1,
0.6699368, 0.1477876, 1.814683, 0, 0, 0, 1, 1,
0.6702214, 1.352318, 0.2272091, 0, 0, 0, 1, 1,
0.6707722, 0.05378782, 2.379307, 1, 1, 1, 1, 1,
0.6732502, -1.176641, 2.102885, 1, 1, 1, 1, 1,
0.6761728, -0.2791564, 0.1605094, 1, 1, 1, 1, 1,
0.677967, -0.119468, 0.4777673, 1, 1, 1, 1, 1,
0.6793237, 0.7525296, -0.9854327, 1, 1, 1, 1, 1,
0.6838111, -0.2532021, 1.565342, 1, 1, 1, 1, 1,
0.6841087, -1.121885, 0.8222814, 1, 1, 1, 1, 1,
0.6884195, -0.7942715, 4.510515, 1, 1, 1, 1, 1,
0.6978111, 0.1646137, 1.291815, 1, 1, 1, 1, 1,
0.7001417, -0.9229255, 3.315015, 1, 1, 1, 1, 1,
0.7102244, 0.4531327, 1.934366, 1, 1, 1, 1, 1,
0.7210424, 1.628077, -0.8669836, 1, 1, 1, 1, 1,
0.7223049, 0.5229263, 0.7368276, 1, 1, 1, 1, 1,
0.7232084, -0.913305, 1.521947, 1, 1, 1, 1, 1,
0.7235104, 2.109188, -0.9265265, 1, 1, 1, 1, 1,
0.724483, -0.4951446, 1.183143, 0, 0, 1, 1, 1,
0.7284958, 0.2241361, 0.7646081, 1, 0, 0, 1, 1,
0.7322448, 2.022452, 0.9893331, 1, 0, 0, 1, 1,
0.7330961, -1.788834, 2.363757, 1, 0, 0, 1, 1,
0.7348829, -0.5694859, 3.221843, 1, 0, 0, 1, 1,
0.7377434, -2.656091, 3.095555, 1, 0, 0, 1, 1,
0.7393086, -0.9088227, 1.88599, 0, 0, 0, 1, 1,
0.7462784, -1.161703, 2.130512, 0, 0, 0, 1, 1,
0.7480327, -0.3684483, 1.662691, 0, 0, 0, 1, 1,
0.7481378, -0.0534974, 1.274433, 0, 0, 0, 1, 1,
0.758593, 0.1702912, 2.986932, 0, 0, 0, 1, 1,
0.7737155, 1.157838, 2.196475, 0, 0, 0, 1, 1,
0.7742108, 1.090219, -0.3725331, 0, 0, 0, 1, 1,
0.7742289, 2.147688, 1.275023, 1, 1, 1, 1, 1,
0.7743834, -0.5858495, 1.392018, 1, 1, 1, 1, 1,
0.7759817, 2.333856, -1.188463, 1, 1, 1, 1, 1,
0.7777808, 0.4188356, -0.1918626, 1, 1, 1, 1, 1,
0.7834035, 1.092596, 0.001619556, 1, 1, 1, 1, 1,
0.7873709, 0.1520124, 0.4515172, 1, 1, 1, 1, 1,
0.7880886, -0.1185791, 2.039005, 1, 1, 1, 1, 1,
0.7927769, -2.127026, 2.08941, 1, 1, 1, 1, 1,
0.7941242, 1.436159, 0.1813957, 1, 1, 1, 1, 1,
0.79634, -0.05128992, 1.130822, 1, 1, 1, 1, 1,
0.7985384, -0.8569556, 0.9451349, 1, 1, 1, 1, 1,
0.8061984, 2.196843, 2.286803, 1, 1, 1, 1, 1,
0.8073665, 0.05066441, 2.644698, 1, 1, 1, 1, 1,
0.8081973, -0.0492924, 2.069216, 1, 1, 1, 1, 1,
0.8110829, -2.607805, 2.540719, 1, 1, 1, 1, 1,
0.8118366, 0.6199133, 2.092928, 0, 0, 1, 1, 1,
0.8177688, -1.091128, 1.113979, 1, 0, 0, 1, 1,
0.8198943, -0.0252272, 2.470885, 1, 0, 0, 1, 1,
0.8251466, 1.639557, 0.286357, 1, 0, 0, 1, 1,
0.8351391, -0.6196403, 0.7360615, 1, 0, 0, 1, 1,
0.8402027, -0.7064148, 2.686578, 1, 0, 0, 1, 1,
0.8422395, -0.2812688, 1.197825, 0, 0, 0, 1, 1,
0.8440308, 0.6863413, 0.8677276, 0, 0, 0, 1, 1,
0.8476288, -1.508753, 3.361045, 0, 0, 0, 1, 1,
0.861565, 1.856879, -0.06760839, 0, 0, 0, 1, 1,
0.8678574, -0.3974679, 3.222075, 0, 0, 0, 1, 1,
0.878831, -0.4349054, 1.141593, 0, 0, 0, 1, 1,
0.880258, -2.071945, 2.831436, 0, 0, 0, 1, 1,
0.8878168, 0.9790217, 0.6369109, 1, 1, 1, 1, 1,
0.8933105, -0.3286378, 0.6685178, 1, 1, 1, 1, 1,
0.8936395, 0.2706285, 1.697247, 1, 1, 1, 1, 1,
0.8973497, 0.08004096, 0.2345026, 1, 1, 1, 1, 1,
0.9027244, 1.063149, 1.491362, 1, 1, 1, 1, 1,
0.9033771, 1.240969, 0.9126468, 1, 1, 1, 1, 1,
0.9096862, -2.441992, 4.05897, 1, 1, 1, 1, 1,
0.9133282, 0.6917226, 0.7541494, 1, 1, 1, 1, 1,
0.91595, -0.1959976, 1.635996, 1, 1, 1, 1, 1,
0.9188151, -1.042779, 0.6174417, 1, 1, 1, 1, 1,
0.9213323, 0.3401231, 0.1039967, 1, 1, 1, 1, 1,
0.9292735, 0.1265403, 2.026936, 1, 1, 1, 1, 1,
0.9329849, -1.083998, 1.166878, 1, 1, 1, 1, 1,
0.9409115, 0.03663219, 2.787635, 1, 1, 1, 1, 1,
0.9423021, 0.3055665, -1.217546, 1, 1, 1, 1, 1,
0.9457529, -0.6403058, 1.500388, 0, 0, 1, 1, 1,
0.9503442, 1.448693, 1.799518, 1, 0, 0, 1, 1,
0.958012, 1.394676, 1.310157, 1, 0, 0, 1, 1,
0.9583402, -1.354592, 3.688259, 1, 0, 0, 1, 1,
0.9638115, -0.571224, 2.078923, 1, 0, 0, 1, 1,
0.9704695, 0.8069948, -0.9124454, 1, 0, 0, 1, 1,
0.9717245, -0.5385072, 3.124815, 0, 0, 0, 1, 1,
0.9780494, 0.2711109, 1.672195, 0, 0, 0, 1, 1,
0.9813423, -0.2532906, 0.9031644, 0, 0, 0, 1, 1,
0.9825118, -0.393416, 1.614849, 0, 0, 0, 1, 1,
0.9835522, -0.6492399, 1.074741, 0, 0, 0, 1, 1,
0.9837499, 1.174193, 0.5303238, 0, 0, 0, 1, 1,
0.9849305, 0.9212812, 2.044751, 0, 0, 0, 1, 1,
0.9869874, 0.8527743, 1.418823, 1, 1, 1, 1, 1,
1.001427, -0.1659385, 0.9370965, 1, 1, 1, 1, 1,
1.002496, 0.2194416, 0.5098293, 1, 1, 1, 1, 1,
1.005822, -1.237265, 1.404168, 1, 1, 1, 1, 1,
1.009457, -0.02053165, 0.6196492, 1, 1, 1, 1, 1,
1.018546, 1.105735, -0.02602927, 1, 1, 1, 1, 1,
1.028726, -2.604141, 1.57523, 1, 1, 1, 1, 1,
1.030364, 1.894733, -0.05167604, 1, 1, 1, 1, 1,
1.030949, 1.29987, 2.44131, 1, 1, 1, 1, 1,
1.031222, 1.146739, -0.01396496, 1, 1, 1, 1, 1,
1.031841, 0.5575153, 0.9053972, 1, 1, 1, 1, 1,
1.04048, 0.7366585, 0.9023727, 1, 1, 1, 1, 1,
1.041415, -0.2550271, 0.9141477, 1, 1, 1, 1, 1,
1.050182, 0.7857716, -0.3717767, 1, 1, 1, 1, 1,
1.05032, -0.3703485, 2.196832, 1, 1, 1, 1, 1,
1.052078, -0.3426905, 1.368509, 0, 0, 1, 1, 1,
1.05743, -1.220321, 2.329905, 1, 0, 0, 1, 1,
1.061026, 0.01277255, 2.630513, 1, 0, 0, 1, 1,
1.065633, -0.3516261, 0.9267858, 1, 0, 0, 1, 1,
1.074264, -1.393278, 3.139909, 1, 0, 0, 1, 1,
1.074466, -0.4191979, 2.444103, 1, 0, 0, 1, 1,
1.077944, 0.2744974, -0.3740926, 0, 0, 0, 1, 1,
1.078064, 0.3343985, 2.171522, 0, 0, 0, 1, 1,
1.080404, 0.007226664, 1.239237, 0, 0, 0, 1, 1,
1.082233, -1.546424, 2.071565, 0, 0, 0, 1, 1,
1.089427, -0.7250181, 1.617549, 0, 0, 0, 1, 1,
1.105318, 0.2702825, 4.308849, 0, 0, 0, 1, 1,
1.118264, -0.8981107, 2.489824, 0, 0, 0, 1, 1,
1.128051, -1.54641, 2.427851, 1, 1, 1, 1, 1,
1.128737, -1.017365, 2.8643, 1, 1, 1, 1, 1,
1.141306, -0.6764349, 1.789959, 1, 1, 1, 1, 1,
1.143395, 0.535274, 1.634055, 1, 1, 1, 1, 1,
1.146114, 1.792231, -0.4211971, 1, 1, 1, 1, 1,
1.151611, 1.913853, 0.1985934, 1, 1, 1, 1, 1,
1.152553, 0.4578862, 1.740769, 1, 1, 1, 1, 1,
1.153325, -0.4372961, 1.556981, 1, 1, 1, 1, 1,
1.156739, -0.09448513, 3.662474, 1, 1, 1, 1, 1,
1.158273, 1.662259, 0.3357391, 1, 1, 1, 1, 1,
1.163028, 0.5931148, 2.237833, 1, 1, 1, 1, 1,
1.165756, -0.4557157, 1.27308, 1, 1, 1, 1, 1,
1.173983, -1.426304, 3.170834, 1, 1, 1, 1, 1,
1.189051, -1.364598, 2.324911, 1, 1, 1, 1, 1,
1.192203, 0.6307821, 1.689219, 1, 1, 1, 1, 1,
1.196385, 0.6198094, 1.839636, 0, 0, 1, 1, 1,
1.198024, 0.9235715, 0.7137682, 1, 0, 0, 1, 1,
1.202175, -0.9899884, 2.039044, 1, 0, 0, 1, 1,
1.208141, 0.4789089, 1.9123, 1, 0, 0, 1, 1,
1.213197, -0.117629, 2.899042, 1, 0, 0, 1, 1,
1.21447, -0.3998823, 1.550375, 1, 0, 0, 1, 1,
1.215604, 0.3407081, 0.2116442, 0, 0, 0, 1, 1,
1.217162, -0.8281843, 2.06676, 0, 0, 0, 1, 1,
1.219877, 0.9064814, 0.5211585, 0, 0, 0, 1, 1,
1.22313, 0.6172346, -0.1590369, 0, 0, 0, 1, 1,
1.229594, -0.132279, 0.9727655, 0, 0, 0, 1, 1,
1.233852, 0.03153407, 2.76417, 0, 0, 0, 1, 1,
1.235715, -0.1517642, 3.256512, 0, 0, 0, 1, 1,
1.236404, -0.202007, 1.727093, 1, 1, 1, 1, 1,
1.252663, -0.6230487, 2.033383, 1, 1, 1, 1, 1,
1.255356, 1.319935, 2.986399, 1, 1, 1, 1, 1,
1.258525, 0.7164019, 1.111401, 1, 1, 1, 1, 1,
1.263668, -0.3269477, 1.449304, 1, 1, 1, 1, 1,
1.269645, -1.863563, 4.533795, 1, 1, 1, 1, 1,
1.273223, -0.2019466, 1.254237, 1, 1, 1, 1, 1,
1.279161, 1.400033, 0.6733811, 1, 1, 1, 1, 1,
1.285639, -0.009607831, 0.02361446, 1, 1, 1, 1, 1,
1.286874, 0.8914684, 0.7104481, 1, 1, 1, 1, 1,
1.288559, 0.5576212, 2.419087, 1, 1, 1, 1, 1,
1.304566, -1.20238, 2.334919, 1, 1, 1, 1, 1,
1.312383, -2.51974, 2.424207, 1, 1, 1, 1, 1,
1.313492, -1.360502, 4.56979, 1, 1, 1, 1, 1,
1.316632, 0.9752828, 0.07351686, 1, 1, 1, 1, 1,
1.327915, 0.04491597, 2.389045, 0, 0, 1, 1, 1,
1.336411, -0.4715284, 1.637979, 1, 0, 0, 1, 1,
1.339291, -0.5502619, 1.561317, 1, 0, 0, 1, 1,
1.339401, 0.3578729, 0.6107874, 1, 0, 0, 1, 1,
1.346595, -0.3192727, 0.3830526, 1, 0, 0, 1, 1,
1.369335, -1.247337, 2.333362, 1, 0, 0, 1, 1,
1.397028, 0.4529712, 2.041731, 0, 0, 0, 1, 1,
1.409873, 1.657668, 0.05989927, 0, 0, 0, 1, 1,
1.439698, -0.04041531, 3.047929, 0, 0, 0, 1, 1,
1.449864, -0.951481, 1.941284, 0, 0, 0, 1, 1,
1.456256, -0.9492686, 4.072102, 0, 0, 0, 1, 1,
1.466996, -1.100893, 1.868601, 0, 0, 0, 1, 1,
1.482625, 0.9271272, 1.566111, 0, 0, 0, 1, 1,
1.487364, -0.836724, 3.59006, 1, 1, 1, 1, 1,
1.500354, 1.173402, 1.550969, 1, 1, 1, 1, 1,
1.501595, -0.02308262, 0.4185372, 1, 1, 1, 1, 1,
1.502461, -0.07624885, 2.394382, 1, 1, 1, 1, 1,
1.505155, -0.3769021, 2.291603, 1, 1, 1, 1, 1,
1.508426, -1.095714, 3.340458, 1, 1, 1, 1, 1,
1.521671, 0.6179981, 1.569013, 1, 1, 1, 1, 1,
1.531401, -0.5576934, 3.412946, 1, 1, 1, 1, 1,
1.532754, 0.9306833, 0.0610019, 1, 1, 1, 1, 1,
1.536755, 0.3718237, 2.014938, 1, 1, 1, 1, 1,
1.553438, 0.0436171, 3.146721, 1, 1, 1, 1, 1,
1.556, -0.8085424, 3.703497, 1, 1, 1, 1, 1,
1.562933, 1.294218, -0.1880632, 1, 1, 1, 1, 1,
1.569205, 1.390491, -0.6962132, 1, 1, 1, 1, 1,
1.574343, -2.151441, 1.117093, 1, 1, 1, 1, 1,
1.579022, -1.231796, 4.024908, 0, 0, 1, 1, 1,
1.584165, 0.1440997, -0.5766444, 1, 0, 0, 1, 1,
1.591464, 0.05563016, 1.985411, 1, 0, 0, 1, 1,
1.597796, 1.085326, -0.7689227, 1, 0, 0, 1, 1,
1.606107, 0.3599789, 2.739517, 1, 0, 0, 1, 1,
1.610023, -2.620103, 2.748645, 1, 0, 0, 1, 1,
1.613312, 0.1273837, 2.402036, 0, 0, 0, 1, 1,
1.62483, 0.08374591, 0.808542, 0, 0, 0, 1, 1,
1.626464, 0.8442515, 1.535169, 0, 0, 0, 1, 1,
1.635602, -0.01945994, 0.7861335, 0, 0, 0, 1, 1,
1.643756, -0.6284024, 1.265625, 0, 0, 0, 1, 1,
1.646632, 0.0282341, 2.017741, 0, 0, 0, 1, 1,
1.668069, -0.4696284, 2.518882, 0, 0, 0, 1, 1,
1.669375, -1.564165, 2.848605, 1, 1, 1, 1, 1,
1.672114, 0.7562073, 2.269617, 1, 1, 1, 1, 1,
1.694856, -0.9589908, 1.257608, 1, 1, 1, 1, 1,
1.715122, 0.5683011, 0.444789, 1, 1, 1, 1, 1,
1.724836, 0.7814976, 0.711879, 1, 1, 1, 1, 1,
1.743558, -0.9274739, 3.127952, 1, 1, 1, 1, 1,
1.745131, 0.2914092, 3.580353, 1, 1, 1, 1, 1,
1.745231, 0.3110865, 1.522582, 1, 1, 1, 1, 1,
1.756266, 0.3142002, 0.8313642, 1, 1, 1, 1, 1,
1.766943, -0.7993292, 2.775185, 1, 1, 1, 1, 1,
1.798822, 0.3802611, 1.177952, 1, 1, 1, 1, 1,
1.842329, -0.8125595, 1.683184, 1, 1, 1, 1, 1,
1.865548, 1.812907, 0.3124302, 1, 1, 1, 1, 1,
1.880121, -0.4165649, -0.6211284, 1, 1, 1, 1, 1,
1.909948, 0.440171, 0.5830438, 1, 1, 1, 1, 1,
1.922339, 0.2634353, -0.04832254, 0, 0, 1, 1, 1,
1.954817, -0.3391949, 2.976762, 1, 0, 0, 1, 1,
1.965136, -0.5555739, 3.632943, 1, 0, 0, 1, 1,
1.980424, -0.9271168, 2.548217, 1, 0, 0, 1, 1,
1.990265, 0.5681859, 1.293363, 1, 0, 0, 1, 1,
2.011504, -0.9837326, 2.690449, 1, 0, 0, 1, 1,
2.025737, 0.06429685, 0.5407498, 0, 0, 0, 1, 1,
2.090853, 1.65186, -0.02252455, 0, 0, 0, 1, 1,
2.137249, -0.1841362, 2.96522, 0, 0, 0, 1, 1,
2.157042, -1.106643, 1.244535, 0, 0, 0, 1, 1,
2.159343, 0.7736738, 1.695332, 0, 0, 0, 1, 1,
2.16498, -0.08218709, 1.403887, 0, 0, 0, 1, 1,
2.183147, -0.5211798, 2.268981, 0, 0, 0, 1, 1,
2.450255, -0.9589751, 1.137344, 1, 1, 1, 1, 1,
2.524778, 0.04695767, 1.168661, 1, 1, 1, 1, 1,
2.573486, -0.1267396, -0.1396386, 1, 1, 1, 1, 1,
2.684457, -0.3025905, 0.1952752, 1, 1, 1, 1, 1,
2.706255, 0.006980062, 2.444787, 1, 1, 1, 1, 1,
2.8453, 1.29448, 1.272139, 1, 1, 1, 1, 1,
2.85113, -0.3794037, 3.52661, 1, 1, 1, 1, 1
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
var radius = 9.232026;
var distance = 32.4271;
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
mvMatrix.translate( -0.07736492, 0.1816024, 0.3477025 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.4271);
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
